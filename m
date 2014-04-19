Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id D6C2265D58
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Apr 2014 16:47:53 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so2512069eei.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Apr 2014 09:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yL28npJYaK/xVkSmw2apGm0LXdfm9l9Pb9NhD15Q+y4=;
	b=plHinR+BMO8KGmjHLEtu4QOylKdcG/4ZFYFU4b1bZkqF2F/FlmJBs8EiwcGMloLNup
	lUnklRWCYS3/oewseVLc7cmLeow7eeoyWdLA8zcT03kBR/ZXHpPu9H4oJQFAa2776m5c
	wuUXb+v1oMLuSJc63bzlv7g4tFsSds3AOQZOMJ9alEJL0r+wOrRLLJs4RE0DUYJQAnCv
	3CIRqSfn+07BhxAG0M00dHO1IjS+0nQaonbA0h03nl3IqukOfT2UUD+1Gf1NBE223dQR
	3acKqcIh09A7Bap48GTx4m0htzZGM6q9n5VVMih1se5RumnBRLqH2CAZ8vPJpsp3fbB6
	r0uQ==
X-Received: by 10.14.200.131 with SMTP id z3mr221835een.109.1397926074194;
	Sat, 19 Apr 2014 09:47:54 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x46sm86442049een.17.2014.04.19.09.47.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Apr 2014 09:47:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Apr 2014 18:47:47 +0200
Message-Id: <1397926070-7453-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1397926070-7453-1-git-send-email-Martin.Jansa@gmail.com>
References: <1397926070-7453-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/5] eve: move to new git repo
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
X-List-Received-Date: Sat, 19 Apr 2014 16:47:54 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...e-updated-for-Openmoko-Freerunner-screen.patch} | 26 ++++++-------
 ...atch => 0002-adapt-to-webkit-efl-changes.patch} | 45 ++++++++++++++--------
 .../recipes-efl/e17/{eve_svn.bb => eve_git.bb}     | 17 ++++----
 3 files changed, 52 insertions(+), 36 deletions(-)
 rename meta-efl/recipes-efl/e17/eve/{eve-theme-for-smaller-screens.patch => 0001-eve-theme-updated-for-Openmoko-Freerunner-screen.patch} (84%)
 rename meta-efl/recipes-efl/e17/eve/{adapt-to-webkit-efl-changes.patch => 0002-adapt-to-webkit-efl-changes.patch} (69%)
 rename meta-efl/recipes-efl/e17/{eve_svn.bb => eve_git.bb} (65%)

diff --git a/meta-efl/recipes-efl/e17/eve/eve-theme-for-smaller-screens.patch b/meta-efl/recipes-efl/e17/eve/0001-eve-theme-updated-for-Openmoko-Freerunner-screen.patch
similarity index 84%
rename from meta-efl/recipes-efl/e17/eve/eve-theme-for-smaller-screens.patch
rename to meta-efl/recipes-efl/e17/eve/0001-eve-theme-updated-for-Openmoko-Freerunner-screen.patch
index 61f3eca..a3c5cda 100644
--- a/meta-efl/recipes-efl/e17/eve/eve-theme-for-smaller-screens.patch
+++ b/meta-efl/recipes-efl/e17/eve/0001-eve-theme-updated-for-Openmoko-Freerunner-screen.patch
@@ -1,14 +1,14 @@
-From 2ce4e2e7cfe756bb78e883ff1a602a74e95288b5 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Marco=20Trevisan=20(Trevi=C3=B1o)?= <mail@3v1n0.net>
+From 203aabbb95a98fa455363f78ff07e2ed217b0086 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Marco=20Trevisan=20=28Trevi=C3=B1o=29?= <mail@3v1n0.net>
 Date: Wed, 17 Nov 2010 16:38:47 +0100
-Subject: [PATCH] eve: theme updated for Openmoko Freerunner screen
+Subject: [PATCH 1/2] eve: theme updated for Openmoko Freerunner screen
 
 ---
- data/themes/default.edc |   22 +++++++++++-----------
- 1 files changed, 11 insertions(+), 11 deletions(-)
+ data/themes/default.edc | 24 +++++++++++-------------
+ 1 file changed, 11 insertions(+), 13 deletions(-)
 
 diff --git a/data/themes/default.edc b/data/themes/default.edc
-index d4d29a6..7efaf23 100644
+index feeac4f..848ca5c 100644
 --- a/data/themes/default.edc
 +++ b/data/themes/default.edc
 @@ -1,8 +1,8 @@
@@ -22,7 +22,7 @@ index d4d29a6..7efaf23 100644
  #define URLBAR_ITEM_SIZE 40
  
  #define TOOLBAR_POSITION(_item_number) ((_item_number)*(TOOLBAR_ITEM_SIZE)-((TOOLBAR_ITEM_SIZE)*(TOOLBAR_MIDDLE_ITEM)))
-@@ -202,7 +202,6 @@
+@@ -295,7 +295,6 @@ collections {
                  type: RECT;
                  description { state: "default" 0.0;
                      color: 0 0 0 255;
@@ -30,7 +30,7 @@ index d4d29a6..7efaf23 100644
                  }
              }
          }
-@@ -335,7 +334,6 @@
+@@ -526,7 +525,6 @@ collections {
                  type: RECT;
                  description { state: "default" 0.0;
                      color: 0 0 0 255;
@@ -38,7 +38,7 @@ index d4d29a6..7efaf23 100644
                  }
              }
              part { name: "view";
-@@ -893,17 +893,17 @@ collections {
+@@ -920,17 +918,17 @@ collections {
                  type: IMAGE;
                  description { state: "default" 0.0;
                      visible: 0;
@@ -60,7 +60,7 @@ index d4d29a6..7efaf23 100644
                      }
                  }
                  description { state: "visible" 0.0;
-@@ -912,11 +912,11 @@ collections {
+@@ -939,11 +937,11 @@ collections {
                      image.normal: "panel-top-triangle.png";
                      rel1 {
                          relative: 1.0 0.0;
@@ -74,7 +74,7 @@ index d4d29a6..7efaf23 100644
                      }
                  }
                  description { state: "pressed" 0.0;
-@@ -1006,11 +1006,11 @@ collections {
+@@ -1033,11 +1031,11 @@ collections {
                      rel2 {
                          to_y: "panel-top";
                          relative: 1.0 0.0;
@@ -88,7 +88,7 @@ index d4d29a6..7efaf23 100644
                          text: "Untitled";
                          min: 0 1;
                          align: 0.5 0.5;
-@@ -1026,7 +1026,7 @@ collections {
+@@ -1053,7 +1051,7 @@ collections {
                      rel1 {
                          to_y: "panel-top";
                          relative: 0.0 0.0;
@@ -98,5 +98,5 @@ index d4d29a6..7efaf23 100644
                      rel2 {
                          to_y: "panel-top";
 -- 
-1.7.1
+1.9.1
 
diff --git a/meta-efl/recipes-efl/e17/eve/adapt-to-webkit-efl-changes.patch b/meta-efl/recipes-efl/e17/eve/0002-adapt-to-webkit-efl-changes.patch
similarity index 69%
rename from meta-efl/recipes-efl/e17/eve/adapt-to-webkit-efl-changes.patch
rename to meta-efl/recipes-efl/e17/eve/0002-adapt-to-webkit-efl-changes.patch
index 5e03f85..4b5e64e 100644
--- a/meta-efl/recipes-efl/e17/eve/adapt-to-webkit-efl-changes.patch
+++ b/meta-efl/recipes-efl/e17/eve/0002-adapt-to-webkit-efl-changes.patch
@@ -1,3 +1,8 @@
+From c1cb2a7b6d8b4661fde442ea4725df6842a94816 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Fri, 18 Apr 2014 11:52:18 +0200
+Subject: [PATCH 2/2] adapt to webkit-efl changes
+
 WIP: just fixes the build, probably doesn't render correctly
 
 https://trac.webkit.org/changeset/164168
@@ -7,12 +12,19 @@ https://trac.webkit.org/changeset/162581
 removed ewk_view_pre_render methods (with whole tiled support)
 
 https://git.enlightenment.org/core/elementary.git/commit/?id=0e465290be2016f12adcbc8c8d74645b3e6a1d9a
-ewk_view_tiled_smart_set is gone and ewk_view_single_smart_set is ewk_view_smart_set
+ewk_view_tiled_smart_set is gone and ewk_view_single_smart_set is
+ewk_view_smart_set
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/bin/chrome.c |  4 +++-
+ src/bin/view.c   | 22 +++++++---------------
+ 2 files changed, 10 insertions(+), 16 deletions(-)
 
-Index: src/bin/chrome.c
-===================================================================
---- a/src/bin/chrome.c	(revision 84579)
-+++ b/src/bin/chrome.c	(working copy)
+diff --git a/src/bin/chrome.c b/src/bin/chrome.c
+index ee8f0c4..b46b29d 100644
+--- a/src/bin/chrome.c
++++ b/src/bin/chrome.c
 @@ -5,6 +5,8 @@
  #include <stdio.h>
  #include <string.h>
@@ -22,7 +34,7 @@ Index: src/bin/chrome.c
  #include <Eina.h>
  #include <Elementary.h>
  
-@@ -1997,7 +1999,7 @@
+@@ -1997,7 +1999,7 @@ view_screenshot_add(Evas *evas, const Evas_Object *view)
     if (cairo_status(cairo) != CAIRO_STATUS_SUCCESS)
        goto error_cairo_create;
  
@@ -31,11 +43,11 @@ Index: src/bin/chrome.c
       {
          evas_object_del(img);
          img = NULL;
-Index: src/bin/view.c
-===================================================================
---- a/src/bin/view.c	(revision 84579)
-+++ b/src/bin/view.c	(working copy)
-@@ -335,7 +335,7 @@
+diff --git a/src/bin/view.c b/src/bin/view.c
+index 54de6c1..2b07511 100644
+--- a/src/bin/view.c
++++ b/src/bin/view.c
+@@ -335,7 +335,7 @@ _view_load_finished(void *data, Evas_Object *view, void *event_info __UNUSED__)
     h *= 2;
  
     INF("load finished, pre-render %d,%d+%dx%d at %0.2f", x, y, w, h, zoom);
@@ -44,7 +56,7 @@ Index: src/bin/view.c
  }
  
  /* stop animators, we changed page */
-@@ -435,7 +435,7 @@
+@@ -435,7 +435,7 @@ _view_pan_pre_render(View_Smart_Data *sd, Evas_Coord dx, Evas_Coord dy)
  
     INF("pre-render region %d,%d+%dx%d at %0.2f (viewport=%d,%d+%dx%d)",
         px, py, pw, ph, zoom, x, y, w, h);
@@ -53,7 +65,7 @@ Index: src/bin/view.c
  }
  
  static unsigned int
-@@ -611,7 +611,7 @@
+@@ -611,7 +611,7 @@ _view_pan_start(View_Smart_Data *sd, const Evas_Event_Mouse_Down *ev)
  
     sd->pan.last_move = *p;
  
@@ -62,7 +74,7 @@ Index: src/bin/view.c
  
     /* register function to collect samples and apply scrolls at fixed interval*/
     if (!sd->animator.pan)
-@@ -816,7 +816,7 @@
+@@ -816,7 +816,7 @@ _view_zoom_start(View_Smart_Data *sd, const Evas_Event_Mouse_Down *ev)
     Evas_Coord cw, ch, vw, vh;
     float z, zx, zy;
  
@@ -71,7 +83,7 @@ Index: src/bin/view.c
  
     /* remember starting point so we have a reference */
     sd->zoom.start.zoom = ewk_frame_page_zoom_get(frame);
-@@ -1512,17 +1512,9 @@
+@@ -1512,17 +1512,9 @@ view_add(Evas_Object *parent, Backing_Store bs)
          /* create ewk_view_single subclass, this is done only once! */
          static Ewk_View_Smart_Class api = EWK_VIEW_SMART_CLASS_INIT_NAME_VERSION("EWK_View_Demo");
  
@@ -92,3 +104,6 @@ Index: src/bin/view.c
  
          /* override methods we want custom behavior */
          api.sc.add = _view_smart_add;
+-- 
+1.9.1
+
diff --git a/meta-efl/recipes-efl/e17/eve_svn.bb b/meta-efl/recipes-efl/e17/eve_git.bb
similarity index 65%
rename from meta-efl/recipes-efl/e17/eve_svn.bb
rename to meta-efl/recipes-efl/e17/eve_git.bb
index 869f8bf..7879d6a 100644
--- a/meta-efl/recipes-efl/e17/eve_svn.bb
+++ b/meta-efl/recipes-efl/e17/eve_git.bb
@@ -2,8 +2,10 @@ SUMMARY = "Enlightenment Web Browser"
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 DEPENDS = "evas ecore edje elementary webkit-efl eldbus"
-PV = "0.3.0.0+svnr${SRCPV}"
-SRCREV = "84579"
+
+PE = "1"
+PV = "0.3.0+gitr${SRCPV}"
+SRCREV = "7bd6549982f4fc5e26e5d11e6c536601358892e3"
 
 # webkit-efl isn't available for < armv7a
 COMPATIBLE_MACHINE = "(-)"
@@ -12,18 +14,17 @@ COMPATIBLE_MACHINE_x86-64 = "(.*)"
 COMPATIBLE_MACHINE_armv7a = "(.*)"
 
 inherit e gettext
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
-    file://adapt-to-webkit-efl-changes.patch \
+SRC_URI = " \
+    git://git.enlightenment.org/apps/${BPN}.git \
+    file://0001-eve-theme-updated-for-Openmoko-Freerunner-screen.patch \
+    file://0002-adapt-to-webkit-efl-changes.patch \
 "
-S = "${WORKDIR}/${SRCNAME}"
+S = "${WORKDIR}/git"
 
 do_configure_prepend() {
     autopoint || touch config.rpath
 }
 
-SRC_URI += "file://eve-theme-for-smaller-screens.patch \
-"
-
 EXTRA_OECONF = "\
     --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
 "
-- 
1.9.1


