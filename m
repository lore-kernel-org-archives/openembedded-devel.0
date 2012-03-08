Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S5iEn-0003oi-Iz
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Mar 2012 19:38:53 +0100
Received: by mail-ee0-f47.google.com with SMTP id c1so201290eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Mar 2012 10:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=L/R6WZFrzn3u1jfTmvf1M8Ipcfu8c6gM9bVNRjaxSj4=;
	b=YczV3U1tTHHaVX/VjWHRR0mqpVS+C4JgMFDlWeLsaXRj/MdMK7T+61pz+d5bVPvhL1
	zjQ7jF663Yu65Cvu0KVfbQoUGNB/NQ8MM3iC9uqo3Petpsj0s96jnuHJ/aEL3CjIZyp1
	DwZT3VtS+rQ5TdXewosy+X++0vjY9sLKlZg5SPDatHm6sOwDoSk4xXDqgAcyXQkGMKb+
	CZKbFf9L32A5zD3mDV3RYH6luxfM3UkSgAoNgjorsnfFcjY5pC4f8MfFmc6apyATMxI5
	Cj3MpN4z+223z3RI1uZQ2TkbgEXtOecIAX+IBu9fI8cCd2kPJcQdclCmZPwr5N+paC+z
	CBAg==
Received: by 10.213.27.24 with SMTP id g24mr1419783ebc.113.1331231417424;
	Thu, 08 Mar 2012 10:30:17 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x42sm8933442eeb.1.2012.03.08.10.30.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Mar 2012 10:30:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Mar 2012 19:30:02 +0100
Message-Id: <3e2b850aecf62479c580875c424f1eb66986f2b1.1331231195.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1331231195.git.Martin.Jansa@gmail.com>
References: <cover.1331231195.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 1/7] e-base: bump EFL_SRCREV
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Mar 2012 18:38:53 -0000

* remove e-wm patch from 974d2fe857c82826606959ea909bc6e75567e4e4, it's
  not needed now.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass                    |    2 +-
 ...ume-Remove-the-popup.-It-s-not-needed-now.patch |  135 --------------------
 meta-efl/recipes-efl/e17/e-wm_svn.bb               |    1 -
 3 files changed, 1 insertions(+), 137 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/e-wm/0001-Revert-Illume-Remove-the-popup.-It-s-not-needed-now.patch

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index e53d5c0..b337530 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -1,6 +1,6 @@
 HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
-EFL_SRCREV ?= "67883"
+EFL_SRCREV ?= "68387"
 
 ARM_INSTRUCTION_SET = "arm"
diff --git a/meta-efl/recipes-efl/e17/e-wm/0001-Revert-Illume-Remove-the-popup.-It-s-not-needed-now.patch b/meta-efl/recipes-efl/e17/e-wm/0001-Revert-Illume-Remove-the-popup.-It-s-not-needed-now.patch
deleted file mode 100644
index c4a18d0..0000000
--- a/meta-efl/recipes-efl/e17/e-wm/0001-Revert-Illume-Remove-the-popup.-It-s-not-needed-now.patch
+++ /dev/null
@@ -1,135 +0,0 @@
-From c7f54838d09cc94dd23ed060889bae780758c391 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sun, 19 Feb 2012 23:09:07 +0100
-Subject: [PATCH] Revert "Illume: Remove the popup. It's not needed now."
-
-This reverts commit cba0bc9833689900930272fa5c4a2cd2529d3028.
----
- src/modules/illume-indicator/e_mod_ind_win.c |   23 ++++++++++++++++++++---
- src/modules/illume-indicator/e_mod_ind_win.h |    1 +
- 2 files changed, 21 insertions(+), 3 deletions(-)
-
-diff --git a/src/modules/illume-indicator/e_mod_ind_win.c b/src/modules/illume-indicator/e_mod_ind_win.c
-index d3657d6..4a593fd 100644
---- a/src/modules/illume-indicator/e_mod_ind_win.c
-+++ b/src/modules/illume-indicator/e_mod_ind_win.c
-@@ -57,6 +57,11 @@ e_mod_ind_win_new(E_Zone *zone)
-    /* set this window to not accept or take focus */
-    ecore_x_icccm_hints_set(iwin->win->evas_win, 0, 0, 0, 0, 0, 0, 0);
- 
-+   /* create the popup */
-+   iwin->popup = e_popup_new(zone, 0, 0, zone->w, h);
-+   e_popup_name_set(iwin->popup, "indicator");
-+   e_popup_layer_set(iwin->popup, 200);
-+
-    /* create our event rectangle */
-    iwin->o_event = evas_object_rectangle_add(iwin->win->evas);
-    evas_object_color_set(iwin->o_event, 0, 0, 0, 0);
-@@ -85,6 +90,8 @@ e_mod_ind_win_new(E_Zone *zone)
-    evas_object_move(iwin->o_base, 0, 0);
-    evas_object_show(iwin->o_base);
- 
-+   e_popup_edje_bg_object_set(iwin->popup, iwin->o_base);
-+
-    /* create our gadget container */
-    iwin->gadcon = e_gadcon_swallowed_new("illume-indicator", zone->id, 
-                                          iwin->o_base, "e.swallow.content");
-@@ -133,12 +140,15 @@ e_mod_ind_win_new(E_Zone *zone)
- 
-    /* set minimum size of this window & popup */
-    e_win_size_min_set(iwin->win, zone->w, h);
-+   ecore_evas_size_min_set(iwin->popup->ecore_evas, zone->w, h);
- 
-    /* position and resize this window */
-    e_win_move_resize(iwin->win, zone->x, zone->y, zone->w, h);
-+   e_popup_move_resize(iwin->popup, zone->x, zone->y, zone->w, h);
- 
-    /* show the window */
-    e_win_show(iwin->win);
-+   e_popup_show(iwin->popup);
- 
-    /* set this window on proper zone */
-    e_border_zone_set(iwin->win->border, zone);
-@@ -188,6 +198,9 @@ _e_mod_ind_win_cb_free(Ind_Win *iwin)
-    /* tell conformant apps our position and size */
-    ecore_x_e_illume_indicator_geometry_set(iwin->zone->black_win, 0, 0, 0, 0);
- 
-+   if (iwin->popup) e_object_del(E_OBJECT(iwin->popup));
-+   iwin->popup = NULL;
-+
-    /* delete the window */
-    if (iwin->win) e_object_del(E_OBJECT(iwin->win));
-    iwin->win = NULL;
-@@ -214,6 +227,7 @@ _e_mod_ind_win_cb_win_prop(void *data, int type __UNUSED__, void *event)
- 
-    /* set minimum size of this window */
-    e_win_size_min_set(iwin->win, iwin->zone->w, h);
-+   ecore_evas_size_min_set(iwin->popup->ecore_evas, iwin->zone->w, h);
- 
-    /* NB: Not sure why, but we need to tell this border to fetch icccm 
-     * size position hints now :( (NOTE: This was not needed a few days ago) 
-@@ -222,6 +236,7 @@ _e_mod_ind_win_cb_win_prop(void *data, int type __UNUSED__, void *event)
- 
-    /* resize this window */
-    e_win_resize(iwin->win, iwin->zone->w, h);
-+   e_popup_resize(iwin->popup, iwin->zone->w, h);
- 
-    /* tell conformant apps our position and size */
-    ecore_x_e_illume_indicator_geometry_set(iwin->zone->black_win, 
-@@ -246,6 +261,7 @@ _e_mod_ind_win_cb_zone_resize(void *data, int type __UNUSED__, void *event)
- 
-    /* set minimum size of this window to match zone size */
-    e_win_size_min_set(iwin->win, ev->zone->w, h);
-+   ecore_evas_size_min_set(iwin->popup->ecore_evas, ev->zone->w, h);
- 
-    return ECORE_CALLBACK_PASS_ON;
- }
-@@ -256,6 +272,7 @@ _e_mod_ind_win_cb_resize(E_Win *win)
-    Ind_Win *iwin;
- 
-    if (!(iwin = win->data)) return;
-+   if (iwin->popup) e_popup_resize(iwin->popup, win->w, win->h);
-    if (iwin->o_event) evas_object_resize(iwin->o_event, win->w, win->h);
-    if (iwin->o_base) evas_object_resize(iwin->o_base, win->w, win->h);
-    if (iwin->gadcon->o_container)
-@@ -427,7 +444,7 @@ _e_mod_ind_win_cb_mouse_move(void *data, Evas *evas __UNUSED__, Evas_Object *obj
-              bd->y = ny;
-              bd->changes.pos = 1;
-              bd->changed = 1;
--             e_win_move(iwin->win, iwin->win->x, ny);
-+             e_popup_move(iwin->popup, iwin->popup->x, ny);
-           }
-      }
- }
-@@ -553,7 +570,7 @@ _e_mod_ind_win_cb_border_hide(void *data, int type __UNUSED__, void *event)
-    if (!(iwin = data)) return ECORE_CALLBACK_PASS_ON;
-    ev = event;
-    if (ev->border != iwin->win->border) return ECORE_CALLBACK_PASS_ON;
--   e_win_hide(iwin->win);
-+   e_popup_hide(iwin->popup);
-    return ECORE_CALLBACK_PASS_ON;
- }
- 
-@@ -566,6 +583,6 @@ _e_mod_ind_win_cb_border_show(void *data, int type __UNUSED__, void *event)
-    if (!(iwin = data)) return ECORE_CALLBACK_PASS_ON;
-    ev = event;
-    if (ev->border != iwin->win->border) return ECORE_CALLBACK_PASS_ON;
--   e_win_show(iwin->win);
-+   e_popup_show(iwin->popup);
-    return ECORE_CALLBACK_PASS_ON;
- }
-diff --git a/src/modules/illume-indicator/e_mod_ind_win.h b/src/modules/illume-indicator/e_mod_ind_win.h
-index aa2dd1c..d41a861 100644
---- a/src/modules/illume-indicator/e_mod_ind_win.h
-+++ b/src/modules/illume-indicator/e_mod_ind_win.h
-@@ -14,6 +14,7 @@ struct _Ind_Win
-    Eina_List *hdls;
- 
-    E_Win *win;
-+   E_Popup *popup;
-    Evas_Object *o_base, *o_event;
-    E_Gadcon *gadcon;
-    E_Menu *menu;
--- 
-1.7.8.4
-
diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index 25aa865..ec921af 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -12,7 +12,6 @@ S = "${WORKDIR}/${SRCNAME}"
 
 SRC_URI = "\
   ${E_SVN}/trunk;module=${SRCNAME};proto=http \
-  file://0001-Revert-Illume-Remove-the-popup.-It-s-not-needed-now.patch \
   file://enlightenment_start.oe \
   file://applications.menu \
 "
-- 
1.7.8.5



