Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S1ZBh-000871-TF
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Feb 2012 09:10:33 +0100
Received: by mail-ee0-f47.google.com with SMTP id c1so32672eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Feb 2012 00:02:11 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.32.133 as permitted sender) client-ip=10.213.32.133; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.32.133 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.32.133])
	by 10.213.32.133 with SMTP id c5mr2667905ebd.119.1330243331559
	(num_hops = 1); Sun, 26 Feb 2012 00:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=0OHkpUYxtviIOCyITAezwcvCbkRKZzrhpf/lRuwItng=;
	b=LLCwbVpFQC5L0yIHsLCP5xZwP+TP2RBROFTVfQ9bbKNdGmkOSSMCe/207kCoS78KA1
	o4Y0Of/KrkzRFEuVb04rDD819oXK2+nZ7xnwePz4OqWxidNxROgXnilUBDsD7c91+xiS
	TJBoFDD0x1bc1cpsotfuFEZC1oGwja8Pmyofg=
Received: by 10.213.32.133 with SMTP id c5mr2001187ebd.119.1330243331445;
	Sun, 26 Feb 2012 00:02:11 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o49sm41842458eeb.7.2012.02.26.00.02.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Feb 2012 00:02:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 26 Feb 2012 09:01:34 +0100
Message-Id: <7f37409e0a7f528df15eef0d44f78ecae0b20f6c.1330243124.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <64ab53576a0a55c3cb21c0bd690b6b4f95ab2769.1330243124.git.Martin.Jansa@gmail.com>
References: <64ab53576a0a55c3cb21c0bd690b6b4f95ab2769.1330243124.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330243124.git.Martin.Jansa@gmail.com>
References: <cover.1330243124.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 5/5] e-wm: fix memory usage with illume causing OOM
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
X-List-Received-Date: Sun, 26 Feb 2012 08:10:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ume-Remove-the-popup.-It-s-not-needed-now.patch |  135 ++++++++++++++++++++
 meta-efl/recipes-efl/e17/e-wm_svn.bb               |    3 +-
 2 files changed, 137 insertions(+), 1 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/e-wm/0001-Revert-Illume-Remove-the-popup.-It-s-not-needed-now.patch

diff --git a/meta-efl/recipes-efl/e17/e-wm/0001-Revert-Illume-Remove-the-popup.-It-s-not-needed-now.patch b/meta-efl/recipes-efl/e17/e-wm/0001-Revert-Illume-Remove-the-popup.-It-s-not-needed-now.patch
new file mode 100644
index 0000000..c4a18d0
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/e-wm/0001-Revert-Illume-Remove-the-popup.-It-s-not-needed-now.patch
@@ -0,0 +1,135 @@
+From c7f54838d09cc94dd23ed060889bae780758c391 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sun, 19 Feb 2012 23:09:07 +0100
+Subject: [PATCH] Revert "Illume: Remove the popup. It's not needed now."
+
+This reverts commit cba0bc9833689900930272fa5c4a2cd2529d3028.
+---
+ src/modules/illume-indicator/e_mod_ind_win.c |   23 ++++++++++++++++++++---
+ src/modules/illume-indicator/e_mod_ind_win.h |    1 +
+ 2 files changed, 21 insertions(+), 3 deletions(-)
+
+diff --git a/src/modules/illume-indicator/e_mod_ind_win.c b/src/modules/illume-indicator/e_mod_ind_win.c
+index d3657d6..4a593fd 100644
+--- a/src/modules/illume-indicator/e_mod_ind_win.c
++++ b/src/modules/illume-indicator/e_mod_ind_win.c
+@@ -57,6 +57,11 @@ e_mod_ind_win_new(E_Zone *zone)
+    /* set this window to not accept or take focus */
+    ecore_x_icccm_hints_set(iwin->win->evas_win, 0, 0, 0, 0, 0, 0, 0);
+ 
++   /* create the popup */
++   iwin->popup = e_popup_new(zone, 0, 0, zone->w, h);
++   e_popup_name_set(iwin->popup, "indicator");
++   e_popup_layer_set(iwin->popup, 200);
++
+    /* create our event rectangle */
+    iwin->o_event = evas_object_rectangle_add(iwin->win->evas);
+    evas_object_color_set(iwin->o_event, 0, 0, 0, 0);
+@@ -85,6 +90,8 @@ e_mod_ind_win_new(E_Zone *zone)
+    evas_object_move(iwin->o_base, 0, 0);
+    evas_object_show(iwin->o_base);
+ 
++   e_popup_edje_bg_object_set(iwin->popup, iwin->o_base);
++
+    /* create our gadget container */
+    iwin->gadcon = e_gadcon_swallowed_new("illume-indicator", zone->id, 
+                                          iwin->o_base, "e.swallow.content");
+@@ -133,12 +140,15 @@ e_mod_ind_win_new(E_Zone *zone)
+ 
+    /* set minimum size of this window & popup */
+    e_win_size_min_set(iwin->win, zone->w, h);
++   ecore_evas_size_min_set(iwin->popup->ecore_evas, zone->w, h);
+ 
+    /* position and resize this window */
+    e_win_move_resize(iwin->win, zone->x, zone->y, zone->w, h);
++   e_popup_move_resize(iwin->popup, zone->x, zone->y, zone->w, h);
+ 
+    /* show the window */
+    e_win_show(iwin->win);
++   e_popup_show(iwin->popup);
+ 
+    /* set this window on proper zone */
+    e_border_zone_set(iwin->win->border, zone);
+@@ -188,6 +198,9 @@ _e_mod_ind_win_cb_free(Ind_Win *iwin)
+    /* tell conformant apps our position and size */
+    ecore_x_e_illume_indicator_geometry_set(iwin->zone->black_win, 0, 0, 0, 0);
+ 
++   if (iwin->popup) e_object_del(E_OBJECT(iwin->popup));
++   iwin->popup = NULL;
++
+    /* delete the window */
+    if (iwin->win) e_object_del(E_OBJECT(iwin->win));
+    iwin->win = NULL;
+@@ -214,6 +227,7 @@ _e_mod_ind_win_cb_win_prop(void *data, int type __UNUSED__, void *event)
+ 
+    /* set minimum size of this window */
+    e_win_size_min_set(iwin->win, iwin->zone->w, h);
++   ecore_evas_size_min_set(iwin->popup->ecore_evas, iwin->zone->w, h);
+ 
+    /* NB: Not sure why, but we need to tell this border to fetch icccm 
+     * size position hints now :( (NOTE: This was not needed a few days ago) 
+@@ -222,6 +236,7 @@ _e_mod_ind_win_cb_win_prop(void *data, int type __UNUSED__, void *event)
+ 
+    /* resize this window */
+    e_win_resize(iwin->win, iwin->zone->w, h);
++   e_popup_resize(iwin->popup, iwin->zone->w, h);
+ 
+    /* tell conformant apps our position and size */
+    ecore_x_e_illume_indicator_geometry_set(iwin->zone->black_win, 
+@@ -246,6 +261,7 @@ _e_mod_ind_win_cb_zone_resize(void *data, int type __UNUSED__, void *event)
+ 
+    /* set minimum size of this window to match zone size */
+    e_win_size_min_set(iwin->win, ev->zone->w, h);
++   ecore_evas_size_min_set(iwin->popup->ecore_evas, ev->zone->w, h);
+ 
+    return ECORE_CALLBACK_PASS_ON;
+ }
+@@ -256,6 +272,7 @@ _e_mod_ind_win_cb_resize(E_Win *win)
+    Ind_Win *iwin;
+ 
+    if (!(iwin = win->data)) return;
++   if (iwin->popup) e_popup_resize(iwin->popup, win->w, win->h);
+    if (iwin->o_event) evas_object_resize(iwin->o_event, win->w, win->h);
+    if (iwin->o_base) evas_object_resize(iwin->o_base, win->w, win->h);
+    if (iwin->gadcon->o_container)
+@@ -427,7 +444,7 @@ _e_mod_ind_win_cb_mouse_move(void *data, Evas *evas __UNUSED__, Evas_Object *obj
+              bd->y = ny;
+              bd->changes.pos = 1;
+              bd->changed = 1;
+-             e_win_move(iwin->win, iwin->win->x, ny);
++             e_popup_move(iwin->popup, iwin->popup->x, ny);
+           }
+      }
+ }
+@@ -553,7 +570,7 @@ _e_mod_ind_win_cb_border_hide(void *data, int type __UNUSED__, void *event)
+    if (!(iwin = data)) return ECORE_CALLBACK_PASS_ON;
+    ev = event;
+    if (ev->border != iwin->win->border) return ECORE_CALLBACK_PASS_ON;
+-   e_win_hide(iwin->win);
++   e_popup_hide(iwin->popup);
+    return ECORE_CALLBACK_PASS_ON;
+ }
+ 
+@@ -566,6 +583,6 @@ _e_mod_ind_win_cb_border_show(void *data, int type __UNUSED__, void *event)
+    if (!(iwin = data)) return ECORE_CALLBACK_PASS_ON;
+    ev = event;
+    if (ev->border != iwin->win->border) return ECORE_CALLBACK_PASS_ON;
+-   e_win_show(iwin->win);
++   e_popup_show(iwin->popup);
+    return ECORE_CALLBACK_PASS_ON;
+ }
+diff --git a/src/modules/illume-indicator/e_mod_ind_win.h b/src/modules/illume-indicator/e_mod_ind_win.h
+index aa2dd1c..d41a861 100644
+--- a/src/modules/illume-indicator/e_mod_ind_win.h
++++ b/src/modules/illume-indicator/e_mod_ind_win.h
+@@ -14,6 +14,7 @@ struct _Ind_Win
+    Eina_List *hdls;
+ 
+    E_Win *win;
++   E_Popup *popup;
+    Evas_Object *o_base, *o_event;
+    E_Gadcon *gadcon;
+    E_Menu *menu;
+-- 
+1.7.8.4
+
diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index e931967..25aa865 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2667a0f4120372ea91f7467cdff4095f"
 SRCNAME = "e"
 PV = "0.16.999.060+svnr${SRCPV}"
-PR = "r23"
+PR = "r24"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e update-alternatives gettext
@@ -12,6 +12,7 @@ S = "${WORKDIR}/${SRCNAME}"
 
 SRC_URI = "\
   ${E_SVN}/trunk;module=${SRCNAME};proto=http \
+  file://0001-Revert-Illume-Remove-the-popup.-It-s-not-needed-now.patch \
   file://enlightenment_start.oe \
   file://applications.menu \
 "
-- 
1.7.8.4



