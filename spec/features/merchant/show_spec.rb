require 'rails_helper'

RSpec.describe 'Merchant#dashboard' do
  describe 'dashboard' do
    before(:each) do
      @merchant_1 = create(:merchant)
    end

    it "has a merchant name" do
      visit "/merchants/#{@merchant_1.id}/dashboard"

      expect(page).to have_content(@merchant_1.name)
    end

    it "lists a link to the items index" do
      visit "/merchants/#{@merchant_1.id}/dashboard"

      click_link 'Items Index'
      expect(current_path).to eq(merchant_items_path(@merchant_1))
    end

    it 'lists a link to the invoices index' do
      visit "/merchants/#{@merchant_1.id}/dashboard"

      click_link 'Invoices Index'
      expect(current_path).to eq(merchant_invoices_path(@merchant_1))
    end
  end
end
