Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 77BFF70D2E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Aug 2014 13:12:12 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id v6so2739947lbi.38
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Aug 2014 06:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=t8VTT0Yd1puI23wJsD1qXBxL5VBacAc/X3i58Lug/Hk=;
	b=qOH9auxTG2sbo2ZpUnWNJMu6Vh755HcnyoU5apaJ9oti/ZoZsdxO8H4k4NHfY/pbv7
	X9OgRDSNOhxv3TdeR1vPE1ZgLi3y8vKmbWtnk5VD39DI2q66XSG5oRZZzj2uLr0aAwaU
	yQ6OAXySqRpn+5DgtdVr5aO1QQRlQE9tN3riMVZNf2VWacY+JaBy7yxd7YzXzeKx9T/1
	54fODuJjMjQWPbvgNQQJW9CEoo40j1IRYuyyyY3WY++8hrUib1XFl3dhsdD9iE4MfymB
	EaL5Ss3stLUgcd0Z9jeA5fUWJa8i/kwdk+VRb8Ax9/a2OwOgsSTcVc0LA3qrKQeJO4gK
	Takw==
X-Received: by 10.152.30.100 with SMTP id r4mr15986171lah.87.1408194733333;
	Sat, 16 Aug 2014 06:12:13 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ad8sm17497703lbc.15.2014.08.16.06.12.12 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Aug 2014 06:12:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Aug 2014 15:12:46 +0200
Message-Id: <1408194766-23394-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1408194766-23394-1-git-send-email-Martin.Jansa@gmail.com>
References: <1408194766-23394-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-efl][WIP][PATCH 2/2] elbow: replace eve
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Aug 2014 13:12:15 -0000

* ewebkit1 was dropped in latest webkit-efl, elbow is based on ewebkit2

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/elbow_git.bb              |  24 +++++
 ...me-updated-for-Openmoko-Freerunner-screen.patch | 102 -------------------
 .../e17/eve/0002-adapt-to-webkit-efl-changes.patch | 109 ---------------------
 meta-efl/recipes-efl/e17/eve_git.bb                |  34 -------
 4 files changed, 24 insertions(+), 245 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/elbow_git.bb
 delete mode 100644 meta-efl/recipes-efl/e17/eve/0001-eve-theme-updated-for-Openmoko-Freerunner-screen.patch
 delete mode 100644 meta-efl/recipes-efl/e17/eve/0002-adapt-to-webkit-efl-changes.patch
 delete mode 100644 meta-efl/recipes-efl/e17/eve_git.bb

diff --git a/meta-efl/recipes-efl/e17/elbow_git.bb b/meta-efl/recipes-efl/e17/elbow_git.bb
new file mode 100644
index 0000000..16664f9
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/elbow_git.bb
@@ -0,0 +1,24 @@
+SUMMARY = "EFL based browser"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
+DEPENDS = "evas ecore edje eina elementary webkit-efl sqlite3"
+
+PV = "0.0.1+gitr${SRCPV}"
+SRCREV = "b41fd0bc9514ff61bb2a50d957efe4155fa3e6a8"
+
+# webkit-efl isn't available for < armv7a
+COMPATIBLE_MACHINE = "(-)"
+COMPATIBLE_MACHINE_i586 = "(.*)"
+COMPATIBLE_MACHINE_x86-64 = "(.*)"
+COMPATIBLE_MACHINE_armv7a = "(.*)"
+
+inherit e gettext cmake
+
+EXTRA_OECMAKE = "-DDATA_INSTALL_DIR=${datadir}"
+
+SRC_URI = " \
+    git://github.com/bunhere/elbow.git;protocol=https \
+"
+S = "${WORKDIR}/git"
+
+FILES_${PN} += "${datadir}/themes"
diff --git a/meta-efl/recipes-efl/e17/eve/0001-eve-theme-updated-for-Openmoko-Freerunner-screen.patch b/meta-efl/recipes-efl/e17/eve/0001-eve-theme-updated-for-Openmoko-Freerunner-screen.patch
deleted file mode 100644
index a3c5cda..0000000
--- a/meta-efl/recipes-efl/e17/eve/0001-eve-theme-updated-for-Openmoko-Freerunner-screen.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From 203aabbb95a98fa455363f78ff07e2ed217b0086 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Marco=20Trevisan=20=28Trevi=C3=B1o=29?= <mail@3v1n0.net>
-Date: Wed, 17 Nov 2010 16:38:47 +0100
-Subject: [PATCH 1/2] eve: theme updated for Openmoko Freerunner screen
-
----
- data/themes/default.edc | 24 +++++++++++-------------
- 1 file changed, 11 insertions(+), 13 deletions(-)
-
-diff --git a/data/themes/default.edc b/data/themes/default.edc
-index feeac4f..848ca5c 100644
---- a/data/themes/default.edc
-+++ b/data/themes/default.edc
-@@ -1,8 +1,8 @@
--#define TOP_PANEL_HEIGHT 64
-+#define TOP_PANEL_HEIGHT 80
- #define BOTTOM_PANEL_HEIGHT 85
- #define TOOLBAR_ITEMS 5
- #define TOOLBAR_MIDDLE_ITEM 3
--#define TOOLBAR_ITEM_SIZE 90
-+#define TOOLBAR_ITEM_SIZE 87
- #define URLBAR_ITEM_SIZE 40
- 
- #define TOOLBAR_POSITION(_item_number) ((_item_number)*(TOOLBAR_ITEM_SIZE)-((TOOLBAR_ITEM_SIZE)*(TOOLBAR_MIDDLE_ITEM)))
-@@ -295,7 +295,6 @@ collections {
-                 type: RECT;
-                 description { state: "default" 0.0;
-                     color: 0 0 0 255;
--                    min: 240 320;
-                 }
-             }
-         }
-@@ -526,7 +525,6 @@ collections {
-                 type: RECT;
-                 description { state: "default" 0.0;
-                     color: 0 0 0 255;
--                    min: 240 320;
-                 }
-             }
-             part { name: "view";
-@@ -920,17 +918,17 @@ collections {
-                 type: IMAGE;
-                 description { state: "default" 0.0;
-                     visible: 0;
--                    min: 30 27;
--                    max: 30 27;
-+                    min: 80 78;
-+                    max: 80 78;
-                     fixed: 1 1;
-                     image.normal: "panel-top-triangle.png";
-                     rel1 {
-                         relative: 1.0 0.0;
--                        offset: 60 60;
-+                        offset: 0 0;
-                     }
-                     rel2 {
-                         relative: 1.0 0.0;
--                        offset: 60 60;
-+                        offset: 0 0;
-                     }
-                 }
-                 description { state: "visible" 0.0;
-@@ -939,11 +937,11 @@ collections {
-                     image.normal: "panel-top-triangle.png";
-                     rel1 {
-                         relative: 1.0 0.0;
--                        offset: -15 13;
-+                        offset: -40 38;
-                     }
-                     rel2 {
-                         relative: 1.0 0.0;
--                        offset: -15 13;
-+                        offset: -40 38;
-                     }
-                 }
-                 description { state: "pressed" 0.0;
-@@ -1033,11 +1031,11 @@ collections {
-                     rel2 {
-                         to_y: "panel-top";
-                         relative: 1.0 0.0;
--                        offset: -1 24;
-+                        offset: -1 26;
-                     }
-                     text {
-                         font: "Sans,Edje-Vera";
--                        size: 8;
-+                        size: 11;
-                         text: "Untitled";
-                         min: 0 1;
-                         align: 0.5 0.5;
-@@ -1053,7 +1051,7 @@ collections {
-                     rel1 {
-                         to_y: "panel-top";
-                         relative: 0.0 0.0;
--                        offset: (URLBAR_ITEM_SIZE+20)   68;
-+                        offset: (URLBAR_ITEM_SIZE+20)   70;
-                     }
-                     rel2 {
-                         to_y: "panel-top";
--- 
-1.9.1
-
diff --git a/meta-efl/recipes-efl/e17/eve/0002-adapt-to-webkit-efl-changes.patch b/meta-efl/recipes-efl/e17/eve/0002-adapt-to-webkit-efl-changes.patch
deleted file mode 100644
index 4b5e64e..0000000
--- a/meta-efl/recipes-efl/e17/eve/0002-adapt-to-webkit-efl-changes.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From c1cb2a7b6d8b4661fde442ea4725df6842a94816 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 18 Apr 2014 11:52:18 +0200
-Subject: [PATCH 2/2] adapt to webkit-efl changes
-
-WIP: just fixes the build, probably doesn't render correctly
-
-https://trac.webkit.org/changeset/164168
-removed cairo.h from public headers and ewk_view_paint_contents
-
-https://trac.webkit.org/changeset/162581
-removed ewk_view_pre_render methods (with whole tiled support)
-
-https://git.enlightenment.org/core/elementary.git/commit/?id=0e465290be2016f12adcbc8c8d74645b3e6a1d9a
-ewk_view_tiled_smart_set is gone and ewk_view_single_smart_set is
-ewk_view_smart_set
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/bin/chrome.c |  4 +++-
- src/bin/view.c   | 22 +++++++---------------
- 2 files changed, 10 insertions(+), 16 deletions(-)
-
-diff --git a/src/bin/chrome.c b/src/bin/chrome.c
-index ee8f0c4..b46b29d 100644
---- a/src/bin/chrome.c
-+++ b/src/bin/chrome.c
-@@ -5,6 +5,8 @@
- #include <stdio.h>
- #include <string.h>
- 
-+#include <cairo.h>
-+
- #include <Eina.h>
- #include <Elementary.h>
- 
-@@ -1997,7 +1999,7 @@ view_screenshot_add(Evas *evas, const Evas_Object *view)
-    if (cairo_status(cairo) != CAIRO_STATUS_SUCCESS)
-       goto error_cairo_create;
- 
--   if (!ewk_view_paint_contents(priv, cairo, &rect))
-+   if (!ewk_view_screenshot_contents_get(priv, &rect, 1))
-      {
-         evas_object_del(img);
-         img = NULL;
-diff --git a/src/bin/view.c b/src/bin/view.c
-index 54de6c1..2b07511 100644
---- a/src/bin/view.c
-+++ b/src/bin/view.c
-@@ -335,7 +335,7 @@ _view_load_finished(void *data, Evas_Object *view, void *event_info __UNUSED__)
-    h *= 2;
- 
-    INF("load finished, pre-render %d,%d+%dx%d at %0.2f", x, y, w, h, zoom);
--   ewk_view_pre_render_region(view, x, y, w, h, zoom);
-+   //ewk_view_pre_render_region(view, x, y, w, h, zoom);
- }
- 
- /* stop animators, we changed page */
-@@ -435,7 +435,7 @@ _view_pan_pre_render(View_Smart_Data *sd, Evas_Coord dx, Evas_Coord dy)
- 
-    INF("pre-render region %d,%d+%dx%d at %0.2f (viewport=%d,%d+%dx%d)",
-        px, py, pw, ph, zoom, x, y, w, h);
--   ewk_view_pre_render_region(sd->base.self, px, py, pw, ph, zoom);
-+   //ewk_view_pre_render_region(sd->base.self, px, py, pw, ph, zoom);
- }
- 
- static unsigned int
-@@ -611,7 +611,7 @@ _view_pan_start(View_Smart_Data *sd, const Evas_Event_Mouse_Down *ev)
- 
-    sd->pan.last_move = *p;
- 
--   ewk_view_pre_render_cancel(sd->base.self);
-+   //ewk_view_pre_render_cancel(sd->base.self);
- 
-    /* register function to collect samples and apply scrolls at fixed interval*/
-    if (!sd->animator.pan)
-@@ -816,7 +816,7 @@ _view_zoom_start(View_Smart_Data *sd, const Evas_Event_Mouse_Down *ev)
-    Evas_Coord cw, ch, vw, vh;
-    float z, zx, zy;
- 
--   ewk_view_pre_render_cancel(sd->base.self);
-+   //ewk_view_pre_render_cancel(sd->base.self);
- 
-    /* remember starting point so we have a reference */
-    sd->zoom.start.zoom = ewk_frame_page_zoom_get(frame);
-@@ -1512,17 +1512,9 @@ view_add(Evas_Object *parent, Backing_Store bs)
-         /* create ewk_view_single subclass, this is done only once! */
-         static Ewk_View_Smart_Class api = EWK_VIEW_SMART_CLASS_INIT_NAME_VERSION("EWK_View_Demo");
- 
--        /* set current and parent apis to vanilla ewk_view_single methods */
--        if (bs == BACKING_STORE_TILED)
--          {
--             ewk_view_tiled_smart_set(&api);
--             ewk_view_tiled_smart_set(&_parent_sc);
--          }
--        else
--          {
--             ewk_view_single_smart_set(&api);
--             ewk_view_single_smart_set(&_parent_sc);
--          }
-+        /* set current and parent apis to vanilla ewk_view methods */
-+        ewk_view_smart_set(&api);
-+        ewk_view_smart_set(&_parent_sc);
- 
-         /* override methods we want custom behavior */
-         api.sc.add = _view_smart_add;
--- 
-1.9.1
-
diff --git a/meta-efl/recipes-efl/e17/eve_git.bb b/meta-efl/recipes-efl/e17/eve_git.bb
deleted file mode 100644
index 7879d6a..0000000
--- a/meta-efl/recipes-efl/e17/eve_git.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY = "Enlightenment Web Browser"
-LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
-DEPENDS = "evas ecore edje elementary webkit-efl eldbus"
-
-PE = "1"
-PV = "0.3.0+gitr${SRCPV}"
-SRCREV = "7bd6549982f4fc5e26e5d11e6c536601358892e3"
-
-# webkit-efl isn't available for < armv7a
-COMPATIBLE_MACHINE = "(-)"
-COMPATIBLE_MACHINE_i586 = "(.*)"
-COMPATIBLE_MACHINE_x86-64 = "(.*)"
-COMPATIBLE_MACHINE_armv7a = "(.*)"
-
-inherit e gettext
-SRC_URI = " \
-    git://git.enlightenment.org/apps/${BPN}.git \
-    file://0001-eve-theme-updated-for-Openmoko-Freerunner-screen.patch \
-    file://0002-adapt-to-webkit-efl-changes.patch \
-"
-S = "${WORKDIR}/git"
-
-do_configure_prepend() {
-    autopoint || touch config.rpath
-}
-
-EXTRA_OECONF = "\
-    --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
-"
-
-FILES_${PN} += "\
-    ${datadir}/icons/eve.png \
-"
-- 
2.0.4


