Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id CF5CA733BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 18:40:51 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id hi2so6625196wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 10:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WVr+U8VXY9igYLbwc3ubmStgBMzv+GMvKGBdxiI9C78=;
	b=fAI2kP3F6ty5eb6h4vvAkDfkst+DwYtrKri9RFModYMu7o/PWPPtJs/Xf/fNK+2681
	ecM0nWR1IObVF9z0aGVNDF/O/vhbZntUL1ONV414Bo+cudRpt2o02GBbqNUfGnkWDcIC
	VmilrhXvVGiMxaMfkMvyDkJUOqtUaJ6QOAVxxyI53CWuCYmeWfruycC/5GkDLlZEaKvN
	fQCrNkR02GmqYUd7s/zQCT6FMllZgrGEEyd5HWwVF+JGrT/+LBG2lQ1UBAZ6zrWFajQL
	RRIGre1Y79Z5mJ+YYTT3J5xHVdznWixHg45y31wyHSAPJdoXdZrcG/cWz0bwsyz5Njhi
	F8JA==
X-Received: by 10.180.37.197 with SMTP id a5mr8934727wik.2.1423766451263;
	Thu, 12 Feb 2015 10:40:51 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dj4sm6786106wjc.13.2015.02.12.10.40.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 10:40:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2015 19:40:51 +0100
Message-Id: <1423766452-23118-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.0
Subject: [meta-efl][PATCH 1/2] efl, elementary, emotion-generic-players, evas-generic-loaders: Upgrade to 1.13.0
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
X-List-Received-Date: Thu, 12 Feb 2015 18:40:52 -0000

* announcement:
  https://phab.enlightenment.org/phame/live/3/post/efl_1_13_is_out/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...igure.ac-Don-t-check-for-Xprint-extension.patch |  8 +++---
 .../efl/efl/0002-evas_3d-Add-Eet.h-includes.patch  | 26 +++++++++----------
 ..._cc-Avoid-segfault-when-strcmp-NULL-items.patch | 30 ++++++++++++++++++++++
 .../efl/{efl_1.12.2.bb => efl_1.13.0.bb}           |  5 ++--
 .../{elementary_1.12.2.bb => elementary_1.13.0.bb} |  4 +--
 .../efl/emotion-generic-players_1.12.0.bb          |  8 ------
 .../efl/emotion-generic-players_1.13.0.bb          |  8 ++++++
 .../recipes-efl/efl/evas-generic-loaders_1.12.0.bb |  8 ------
 .../recipes-efl/efl/evas-generic-loaders_1.13.0.bb |  8 ++++++
 9 files changed, 68 insertions(+), 37 deletions(-)
 create mode 100644 meta-efl/recipes-efl/efl/efl/0003-edje_cc-Avoid-segfault-when-strcmp-NULL-items.patch
 rename meta-efl/recipes-efl/efl/{efl_1.12.2.bb => efl_1.13.0.bb} (89%)
 rename meta-efl/recipes-efl/efl/{elementary_1.12.2.bb => elementary_1.13.0.bb} (79%)
 delete mode 100644 meta-efl/recipes-efl/efl/emotion-generic-players_1.12.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion-generic-players_1.13.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.12.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.13.0.bb

diff --git a/meta-efl/recipes-efl/efl/efl/0001-configure.ac-Don-t-check-for-Xprint-extension.patch b/meta-efl/recipes-efl/efl/efl/0001-configure.ac-Don-t-check-for-Xprint-extension.patch
index f34b957..fa85f81 100644
--- a/meta-efl/recipes-efl/efl/efl/0001-configure.ac-Don-t-check-for-Xprint-extension.patch
+++ b/meta-efl/recipes-efl/efl/efl/0001-configure.ac-Don-t-check-for-Xprint-extension.patch
@@ -1,4 +1,4 @@
-From a7ee62a2e90a346bf9aaf9260c918d87e21cfba6 Mon Sep 17 00:00:00 2001
+From 27aedcdcdafbf079dc022bab72ec309cf7db3172 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Fri, 10 Jan 2014 17:07:13 +0100
 Subject: [PATCH 1/3] configure.ac: Don't check for Xprint extension
@@ -11,10 +11,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 779763a..57d3601 100644
+index c108b1b..f019bfc 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3445,7 +3445,6 @@ if test "x${want_x11_xlib}" = "xyes" ; then
+@@ -3474,7 +3474,6 @@ if test "x${want_x11_xlib}" = "xyes" ; then
     ECORE_CHECK_X_EXTENSION([Xdpms], [dpms.h], [Xext], [DPMSQueryExtension])
     ECORE_CHECK_X_EXTENSION([Xfixes], [Xfixes.h], [Xfixes], [XFixesExpandRegion])
     ECORE_CHECK_X_EXTENSION([Xinerama], [Xinerama.h], [Xinerama], [XineramaQueryScreens])
@@ -23,5 +23,5 @@ index 779763a..57d3601 100644
     ECORE_CHECK_X_EXTENSION([Xrender], [Xrender.h], [Xrender], [XRenderFindVisualFormat])
     ECORE_CHECK_X_EXTENSION([Xtest], [XTest.h], [Xtst], [XTestFakeKeyEvent])
 -- 
-2.1.3
+2.3.0
 
diff --git a/meta-efl/recipes-efl/efl/efl/0002-evas_3d-Add-Eet.h-includes.patch b/meta-efl/recipes-efl/efl/efl/0002-evas_3d-Add-Eet.h-includes.patch
index 9847c07..aa7fd4b 100644
--- a/meta-efl/recipes-efl/efl/efl/0002-evas_3d-Add-Eet.h-includes.patch
+++ b/meta-efl/recipes-efl/efl/efl/0002-evas_3d-Add-Eet.h-includes.patch
@@ -1,4 +1,4 @@
-From 9db1f2f9dfe785e3a42445b766e7f4736821264a Mon Sep 17 00:00:00 2001
+From b3cbe31c38a088af7b0dade82545475fc9b72492 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Tue, 2 Dec 2014 12:21:10 +0100
 Subject: [PATCH 2/3] evas_3d: Add Eet.h includes
@@ -8,9 +8,9 @@ Subject: [PATCH 2/3] evas_3d: Add Eet.h includes
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- src/lib/evas/canvas/evas_3d_eet.c             | 1 +
- src/lib/evas/canvas/evas_3d_mesh_loader_eet.c | 1 +
- src/lib/evas/canvas/evas_3d_mesh_saver_eet.c  | 1 +
+ src/lib/evas/canvas/evas_3d_eet.c                        | 1 +
+ src/modules/evas/model_loaders/eet/evas_model_load_eet.c | 1 +
+ src/modules/evas/model_savers/eet/evas_model_save_eet.c  | 1 +
  3 files changed, 3 insertions(+)
 
 diff --git a/src/lib/evas/canvas/evas_3d_eet.c b/src/lib/evas/canvas/evas_3d_eet.c
@@ -22,10 +22,10 @@ index 1515f5a..a438217 100644
  #include <stdio.h>
  #include "evas_common_private.h"
  #include "evas_private.h"
-diff --git a/src/lib/evas/canvas/evas_3d_mesh_loader_eet.c b/src/lib/evas/canvas/evas_3d_mesh_loader_eet.c
-index 26c3569..a93efca 100644
---- a/src/lib/evas/canvas/evas_3d_mesh_loader_eet.c
-+++ b/src/lib/evas/canvas/evas_3d_mesh_loader_eet.c
+diff --git a/src/modules/evas/model_loaders/eet/evas_model_load_eet.c b/src/modules/evas/model_loaders/eet/evas_model_load_eet.c
+index 815b9f1..bff2cea 100644
+--- a/src/modules/evas/model_loaders/eet/evas_model_load_eet.c
++++ b/src/modules/evas/model_loaders/eet/evas_model_load_eet.c
 @@ -3,6 +3,7 @@
  #endif
  
@@ -34,10 +34,10 @@ index 26c3569..a93efca 100644
  #include <stdio.h>
  #include "evas_common_private.h"
  #include "evas_private.h"
-diff --git a/src/lib/evas/canvas/evas_3d_mesh_saver_eet.c b/src/lib/evas/canvas/evas_3d_mesh_saver_eet.c
-index c801ac1..0a4d269 100644
---- a/src/lib/evas/canvas/evas_3d_mesh_saver_eet.c
-+++ b/src/lib/evas/canvas/evas_3d_mesh_saver_eet.c
+diff --git a/src/modules/evas/model_savers/eet/evas_model_save_eet.c b/src/modules/evas/model_savers/eet/evas_model_save_eet.c
+index e445dca..2e1cf4e 100644
+--- a/src/modules/evas/model_savers/eet/evas_model_save_eet.c
++++ b/src/modules/evas/model_savers/eet/evas_model_save_eet.c
 @@ -2,6 +2,7 @@
     #include "config.h"
  #endif
@@ -47,5 +47,5 @@ index c801ac1..0a4d269 100644
  #include "evas_common_private.h"
  #include "evas_private.h"
 -- 
-2.1.3
+2.3.0
 
diff --git a/meta-efl/recipes-efl/efl/efl/0003-edje_cc-Avoid-segfault-when-strcmp-NULL-items.patch b/meta-efl/recipes-efl/efl/efl/0003-edje_cc-Avoid-segfault-when-strcmp-NULL-items.patch
new file mode 100644
index 0000000..55d7b54
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/efl/0003-edje_cc-Avoid-segfault-when-strcmp-NULL-items.patch
@@ -0,0 +1,30 @@
+From 84259714c2376fdb919299e8e01af1ccc6fbe2c0 Mon Sep 17 00:00:00 2001
+From: Stefan Schmidt <s.schmidt@samsung.com>
+Date: Thu, 12 Feb 2015 15:24:27 +0100
+Subject: [PATCH 3/3] edje_cc: Avoid segfault when strcmp NULL items
+
+Martin reported a porblem with one of the SHR project edc files after an upgrade
+to 1.13. The segfault itself is easy enough to fix here but I think there might
+be other problems with the edc after this segfault is gone. We will see.
+
+Fixes T2106
+---
+ src/bin/edje/edje_cc_out.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/bin/edje/edje_cc_out.c b/src/bin/edje/edje_cc_out.c
+index 4f582c7..bc85444 100755
+--- a/src/bin/edje/edje_cc_out.c
++++ b/src/bin/edje/edje_cc_out.c
+@@ -386,7 +386,7 @@ check_source_links(Edje_Part_Collection *pc, Edje_Part *ep, Eet_File *ef, Eina_L
+    EINA_LIST_FOREACH(edje_collections, l, pc_source)
+      {
+         /* Find sourced group */
+-        if (strcmp(ep->source, pc_source->part) == 0)
++        if (ep->source && pc_source->part && strcmp(ep->source, pc_source->part) == 0)
+           {
+              /* Go through every part to find parts with type GROUP */
+              for (i = 0; i < pc_source->parts_count; ++i)
+-- 
+2.3.0
+
diff --git a/meta-efl/recipes-efl/efl/efl_1.12.2.bb b/meta-efl/recipes-efl/efl/efl_1.13.0.bb
similarity index 89%
rename from meta-efl/recipes-efl/efl/efl_1.12.2.bb
rename to meta-efl/recipes-efl/efl/efl_1.13.0.bb
index 0d5b090..b243b81 100644
--- a/meta-efl/recipes-efl/efl/efl_1.12.2.bb
+++ b/meta-efl/recipes-efl/efl/efl_1.13.0.bb
@@ -4,10 +4,11 @@ SRC_URI = "\
     ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
     file://0001-configure.ac-Don-t-check-for-Xprint-extension.patch \
     file://0002-evas_3d-Add-Eet.h-includes.patch \
+    file://0003-edje_cc-Avoid-segfault-when-strcmp-NULL-items.patch \
 "
 
-SRC_URI[md5sum] = "27b8578e5797ee2c484d886fb49704f2"
-SRC_URI[sha256sum] = "dc4a3fe448e0a8019030fe7c045de30d9ac1e92033620fbfbefb761c3ba9ddce"
+SRC_URI[md5sum] = "c73f00e1e25b3b660e15ef754c76541d"
+SRC_URI[sha256sum] = "7ff797d4cd01143edc1258a287be3ddfb11264f0b855878d8f5ad5129dee9357"
 
 # Temporary disable until error like the one following are fixed
 # efl-native/2_1.8.4-r0/efl-1.8.4/src/lib/eet/.libs/libeet.so: file not recognized: File truncated
diff --git a/meta-efl/recipes-efl/efl/elementary_1.12.2.bb b/meta-efl/recipes-efl/efl/elementary_1.13.0.bb
similarity index 79%
rename from meta-efl/recipes-efl/efl/elementary_1.12.2.bb
rename to meta-efl/recipes-efl/efl/elementary_1.13.0.bb
index 9e6f2ea..e7be246 100644
--- a/meta-efl/recipes-efl/efl/elementary_1.12.2.bb
+++ b/meta-efl/recipes-efl/efl/elementary_1.13.0.bb
@@ -8,8 +8,8 @@ SRC_URI = "\
 # these paths aren't passed in -native build
 SRC_URI_append_class-target = " file://0001-Makefile-Use-elementary_codegen-defined-in-configure.patch"
 
-SRC_URI[md5sum] = "b01329104e8eb61be1581e24a1951eaf"
-SRC_URI[sha256sum] = "b1b84dd061b6e93f38bbba4c91ea4c9b5de5d190828b5c00fb051a6e61834b62"
+SRC_URI[md5sum] = "e8464cc2d89585cfe189584c7081845b"
+SRC_URI[sha256sum] = "52f1b4304f22156ab53d2d13b8d8f15c58a110a3bc3f31a13fc357eb9527778c"
 
 # autotools-brokensep - configure updates Elementary.h correctly in ${B}, but then build is using Elementary.h from ${S}
 # which includes #define ELM_EMAP (instead of #undef ELM_EMAP) and building fails
diff --git a/meta-efl/recipes-efl/efl/emotion-generic-players_1.12.0.bb b/meta-efl/recipes-efl/efl/emotion-generic-players_1.12.0.bb
deleted file mode 100644
index 1e1bb8f..0000000
--- a/meta-efl/recipes-efl/efl/emotion-generic-players_1.12.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "fb67cd4e0c6f13da9cdd864763217a59"
-SRC_URI[sha256sum] = "2f2b3c60b113bb637c6b40b575ceffe4055aa424f4585c64ddef6638dbc2a0da"
diff --git a/meta-efl/recipes-efl/efl/emotion-generic-players_1.13.0.bb b/meta-efl/recipes-efl/efl/emotion-generic-players_1.13.0.bb
new file mode 100644
index 0000000..e42c516
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/emotion-generic-players_1.13.0.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "36e5fc6a2bc83b1ab90c5c72b344f00e"
+SRC_URI[sha256sum] = "23a3966d38cafece2c39d1e9904f26da11b9b282676f2d1fd8e54807251b363e"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.12.0.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.12.0.bb
deleted file mode 100644
index c172895..0000000
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.12.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "d60282b9cfad5336e75264767be07179"
-SRC_URI[sha256sum] = "c531c82845b656cb8ea8e2db1e413509d9b4558450be6c5ee27da0cdc781376e"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.13.0.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.13.0.bb
new file mode 100644
index 0000000..cae8df7
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.13.0.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "45df9e4816ceba40219db0167c549e1e"
+SRC_URI[sha256sum] = "c3bcb7d418b8cea79bbaf0731d008e527697b44239ff6b69064df785ca94df9b"
-- 
2.3.0


