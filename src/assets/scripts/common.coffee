$ ->
  inSubMenu = false
  inMenu = false

  showSubMenu = (menu) ->
    menu.removeClass 'hidden'
    menu.animate
      opacity: 1
      top: '86px'
    , 200

  hideSubMenu = (menu) ->
    menu.animate
      opacity: 0
      top: '76px'
    , 200, ->
      menu.addClass 'hidden'

  focus = (menu) ->
    menu.addClass 'active'

  blur = (menu) ->
    menu.removeClass 'active'

  $('#mainNav').on 'mouseenter', 'li', ->
    sub = $(@).find '.sub-menu'
    inMenu = true
    focus $(@)
    showSubMenu sub

  $('#mainNav').on 'mouseleave', 'li', ->
    sub = $(@).find '.sub-menu'
    inMenu = false
    if not inSubMenu
      blur $(@)
      hideSubMenu sub

  $('#mainNav .sub-menu').on 'mouseenter', ->
    inSubMenu = true

  $('#mainNav .sub-menu').on 'mouseleave', ->
    parent = $(@).parents 'li'

    inSubMenu = false
    if not inMenu
      hideSubMenu $(@)
      blur parent
