class CashRegister
  attr_accessor :total, :discount, :items, :prev_purchase

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @prev_purchase = 0
  end

  def add_item(item, price, quantity = 1)
    @prev_purchase = price * quantity
    @total += @prev_purchase
    quantity.times do
      @items << item
    end
  end

  def apply_discount
    return "There is no discount to apply." if @discount == 0

    @total *= 100 - @discount
    @total /= 100
    "After the discount, the total comes to $#{total}."
  end

  def void_last_transaction
    @total -= @prev_purchase
    @prev_purchase = 0
    #this does not remove the item(s) from the list of purcahsed items, but that was not part of the assignment, and programmers are lazy, which is a virtue.
  end
end
