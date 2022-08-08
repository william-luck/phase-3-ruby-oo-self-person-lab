# your code goes here

require 'pry'

class Person 

    attr_reader :name
    attr_accessor :bank_account, :happiness, :hygiene

    def initialize(name, bank_account = 25, happiness = 8, hygiene = 8)
        @name = name
        @bank_account = bank_account
        @happiness = happiness
        @hygiene = hygiene
    end

    def happiness=(value)
        # will reassign the value of happiness to a number between 0 and 10 inclusive. If given a value below or above these clamped values, it will go to the endpoint. 
        # Custom setter function beyond the one just in the attr macro.... Still a little shaky on this.
        @happiness = value.clamp(0, 10)
    end

    def hygiene=(value)
        @hygiene = value.clamp(0, 10)
    end

    def clean?
        self.hygiene > 7
    end

    def happy?
        # Implicit self
        happiness > 7
    end

    def get_paid(amount)
        # Cannot use implicit self, because Ruby will think its an undefined variable assignment.
        self.bank_account += amount
        'all about the benjamins'
    end

    def take_bath
        self.hygiene += 4
        "♪ Rub-a-dub just relaxing in the tub ♫"
    end

    def work_out
        self.happiness += 2
        self.hygiene -=3
        "♪ another one bites the dust ♫"
    end

    def call_friend(friend)
        friend.happiness +=3
        self.happiness +=3
        "Hi #{friend.name}! It's #{self.name}. How are you?"
    end

    def start_conversation(friend, topic)
        if topic == 'politics'
            self.happiness -=2
            friend.happiness -=2
            "blah blah partisan blah lobbyist"
        elsif topic == 'weather'
            self.happiness +=1
            friend.happiness +=1
            "blah blah sun blah rain"
        else
            "blah blah blah blah blah"
        end
    end
end

binding.pry
0


