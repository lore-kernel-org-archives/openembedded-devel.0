Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id E467C76BD7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2015 14:37:47 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so117676326wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Sep 2015 07:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Hrr8pcLUL1nST9gGNurb47nJly+IDmREjd7GHslNl3k=;
	b=lQVAh8tg57S41MvsZzgQGOcuB0UR2Po+iLeqg+AiniIrPmY4xNEOAiD8Yphg52sVXO
	EWSzOwxxUQ6BdRZIUV3YrzIx52iWCmEvyLl1e7uHq8+rNHbTZHslnR/MejoZdg3DGXvO
	kt5r0gvw/xA3ZbhakN8jyPEr7xNR+GC3m+JDCdVKcjrhPqKhgBaPDxlCPXt/oofxcaEv
	ExtKqGKktfeGbbazs2KcuKctu8e6YWwN6j6c0GMK6dkPWUe/DZFncPlPnt23QLZ+krfL
	ElQymhSPLhUfkB3s3H0qY8K/1rVqxdbjmYU4mUTlDWcwZ5E4q56F0RPoNUIfebPK2+HB
	vRMg==
X-Received: by 10.180.74.52 with SMTP id q20mr46487626wiv.94.1441723067661;
	Tue, 08 Sep 2015 07:37:47 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ht5sm5208118wib.10.2015.09.08.07.37.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 07:37:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Sep 2015 16:38:31 +0200
Message-Id: <1441723113-27004-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
Subject: [meta-efl][PATCH 1/3] efl, elementary, emotion-generic-players, evas-generic-loaders: upgrade to 1.15.*
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
X-List-Received-Date: Tue, 08 Sep 2015 14:37:50 -0000

* announcements:
  https://phab.enlightenment.org/phame/live/3/post/enlightenment_foundation_libraries_1_15_and_friends_are_out/
  https://phab.enlightenment.org/phame/live/3/post/efl_and_elementary_1_15_1_release/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/efl.inc                   |  2 +-
 .../efl/efl/0001-evas_3d-Add-Eet.h-includes.patch  | 51 ++++++++++++++++++++++
 meta-efl/recipes-efl/efl/efl_1.14.1.bb             | 25 -----------
 meta-efl/recipes-efl/efl/efl_1.15.1.bb             | 25 +++++++++++
 meta-efl/recipes-efl/efl/elementary_1.14.1.bb      | 16 -------
 meta-efl/recipes-efl/efl/elementary_1.15.1.bb      | 16 +++++++
 .../efl/emotion-generic-players_1.14.0.bb          |  8 ----
 .../efl/emotion-generic-players_1.15.0.bb          |  8 ++++
 .../recipes-efl/efl/evas-generic-loaders_1.14.0.bb |  8 ----
 .../recipes-efl/efl/evas-generic-loaders_1.15.0.bb |  8 ++++
 10 files changed, 109 insertions(+), 58 deletions(-)
 create mode 100644 meta-efl/recipes-efl/efl/efl/0001-evas_3d-Add-Eet.h-includes.patch
 delete mode 100644 meta-efl/recipes-efl/efl/efl_1.14.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/efl_1.15.1.bb
 delete mode 100644 meta-efl/recipes-efl/efl/elementary_1.14.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary_1.15.1.bb
 delete mode 100644 meta-efl/recipes-efl/efl/emotion-generic-players_1.14.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion-generic-players_1.15.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.14.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.15.0.bb

diff --git a/meta-efl/recipes-efl/efl/efl.inc b/meta-efl/recipes-efl/efl/efl.inc
index 65c9f37..1948a80 100644
--- a/meta-efl/recipes-efl/efl/efl.inc
+++ b/meta-efl/recipes-efl/efl/efl.inc
@@ -1,6 +1,6 @@
 SUMMARY = "EFL"
 LICENSE = "MIT & BSD & LGPL-2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5cb19adb5be911811c7a4e05152548e8"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ca7873210523dcfd32694b94286dca60"
 
 DEPENDS_class-native = "freetype-native libxext-native libpng-native jpeg-native tiff-native libfribidi-native glib-2.0-native dbus-native"
 DEPENDS = "virtual/libiconv tslib curl glib-2.0 gnutls pkgconfig zlib jpeg openssl libsndfile1 dbus libexif librsvg freetype libpng tiff libxext virtual/libx11 libxdamage libxrender fontconfig libfribidi giflib udev libxcursor libxcomposite libxinerama libxrandr libxtst libxscrnsaver efl-native util-linux"
diff --git a/meta-efl/recipes-efl/efl/efl/0001-evas_3d-Add-Eet.h-includes.patch b/meta-efl/recipes-efl/efl/efl/0001-evas_3d-Add-Eet.h-includes.patch
new file mode 100644
index 0000000..d0f26c7
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/efl/0001-evas_3d-Add-Eet.h-includes.patch
@@ -0,0 +1,51 @@
+From 2e50fd2dfc68b77e7acddc79550f22987778a897 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 2 Dec 2014 12:21:10 +0100
+Subject: [PATCH] evas_3d: Add Eet.h includes
+
+* with some very restrictive options like we use in efl-native, the build is complaining
+  about missing symbols from Eet.h, add include where needed
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/lib/evas/canvas/evas_canvas3d_eet.c                  | 1 +
+ src/modules/evas/model_loaders/eet/evas_model_load_eet.c | 1 +
+ src/modules/evas/model_savers/eet/evas_model_save_eet.c  | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/src/lib/evas/canvas/evas_canvas3d_eet.c b/src/lib/evas/canvas/evas_canvas3d_eet.c
+index 281f69d..a604076 100644
+--- a/src/lib/evas/canvas/evas_canvas3d_eet.c
++++ b/src/lib/evas/canvas/evas_canvas3d_eet.c
+@@ -1,3 +1,4 @@
++#include <Eet.h>
+ #include <stdio.h>
+ #include "evas_common_private.h"
+ #include "evas_private.h"
+diff --git a/src/modules/evas/model_loaders/eet/evas_model_load_eet.c b/src/modules/evas/model_loaders/eet/evas_model_load_eet.c
+index 803846d..7ebaf8e 100644
+--- a/src/modules/evas/model_loaders/eet/evas_model_load_eet.c
++++ b/src/modules/evas/model_loaders/eet/evas_model_load_eet.c
+@@ -3,6 +3,7 @@
+ #endif
+ 
+ #include <Eo.h>
++#include <Eet.h>
+ #include <stdio.h>
+ #include "evas_common_private.h"
+ #include "evas_private.h"
+diff --git a/src/modules/evas/model_savers/eet/evas_model_save_eet.c b/src/modules/evas/model_savers/eet/evas_model_save_eet.c
+index 71e094a..4d56977 100644
+--- a/src/modules/evas/model_savers/eet/evas_model_save_eet.c
++++ b/src/modules/evas/model_savers/eet/evas_model_save_eet.c
+@@ -2,6 +2,7 @@
+    #include "config.h"
+ #endif
+ 
++#include <Eet.h>
+ #include <stdio.h>
+ #include "evas_common_private.h"
+ #include "evas_private.h"
+-- 
+2.5.0
+
diff --git a/meta-efl/recipes-efl/efl/efl_1.14.1.bb b/meta-efl/recipes-efl/efl/efl_1.14.1.bb
deleted file mode 100644
index a17a685..0000000
--- a/meta-efl/recipes-efl/efl/efl_1.14.1.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-    file://0001-configure.ac-Don-t-check-for-Xprint-extension.patch \
-    file://0002-evas_3d-Add-Eet.h-includes.patch \
-"
-
-SRC_URI[md5sum] = "e0668a93a67be2d59fb40cf71369d82d"
-SRC_URI[sha256sum] = "4e7e69c52c4fa6801e271f30bb4fb41fd62abfe1c9a874f502ca077e2d26329b"
-
-# Temporary disable until error like the one following are fixed
-# efl-native/2_1.8.4-r0/efl-1.8.4/src/lib/eet/.libs/libeet.so: file not recognized: File truncated
-# collect2: error: ld returned 1 exit status
-# x86_64-linux-libtool: install: error: relink `modules/evas/savers/tiff/module.la' with the above command before installing it
-# Makefile:11031: recipe for target 'install-savertiffpkgLTLIBRARIES' failed
-PARALLEL_MAKE_class-native = ""
-
-#EFL_RUN_IN_TREE=1 ../src/bin/eolian/eolian_gen --eo --legacy -I/OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/eo -I/OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/evas/canvas -I/OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/edje -I/OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/ecore_audio --gc -o lib/evas/canvas/evas_line.eo.c /OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/evas/canvas/evas_line.eo
-#ERR<32439>:eolian_gen /OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/bin/eolian/main.c:103 _generate_c_file() Couldnt open file lib/evas/canvas/evas_line.eo.c for writing
-#Makefile:30738: recipe for target 'lib/evas/canvas/evas_line.eo.c' failed
-#make[2]: *** [lib/evas/canvas/evas_line.eo.c] Error 1
-#Makefile:2163: recipe for target 'all-recursive' failed
-# autotools-brokensep
-B = "${S}"
diff --git a/meta-efl/recipes-efl/efl/efl_1.15.1.bb b/meta-efl/recipes-efl/efl/efl_1.15.1.bb
new file mode 100644
index 0000000..aaebf90
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/efl_1.15.1.bb
@@ -0,0 +1,25 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+    file://0001-configure.ac-Don-t-check-for-Xprint-extension.patch \
+    file://0001-evas_3d-Add-Eet.h-includes.patch \
+"
+
+SRC_URI[md5sum] = "dc91bcab73275f678e1748a2dea8d88a"
+SRC_URI[sha256sum] = "2a6d0ab28020b4741be20b32ad0ffeb8f97f766c5c32175bacc2f2d0dc52f98c"
+
+# Temporary disable until error like the one following are fixed
+# efl-native/2_1.8.4-r0/efl-1.8.4/src/lib/eet/.libs/libeet.so: file not recognized: File truncated
+# collect2: error: ld returned 1 exit status
+# x86_64-linux-libtool: install: error: relink `modules/evas/savers/tiff/module.la' with the above command before installing it
+# Makefile:11031: recipe for target 'install-savertiffpkgLTLIBRARIES' failed
+PARALLEL_MAKE_class-native = ""
+
+#EFL_RUN_IN_TREE=1 ../src/bin/eolian/eolian_gen --eo --legacy -I/OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/eo -I/OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/evas/canvas -I/OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/edje -I/OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/ecore_audio --gc -o lib/evas/canvas/evas_line.eo.c /OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/evas/canvas/evas_line.eo
+#ERR<32439>:eolian_gen /OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/bin/eolian/main.c:103 _generate_c_file() Couldnt open file lib/evas/canvas/evas_line.eo.c for writing
+#Makefile:30738: recipe for target 'lib/evas/canvas/evas_line.eo.c' failed
+#make[2]: *** [lib/evas/canvas/evas_line.eo.c] Error 1
+#Makefile:2163: recipe for target 'all-recursive' failed
+# autotools-brokensep
+B = "${S}"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.14.1.bb b/meta-efl/recipes-efl/efl/elementary_1.14.1.bb
deleted file mode 100644
index ecb147a..0000000
--- a/meta-efl/recipes-efl/efl/elementary_1.14.1.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-# only for target, because configure doesn't default to sane default when
-# these paths aren't passed in -native build
-SRC_URI_append_class-target = " file://0001-Makefile-Use-elementary_codegen-defined-in-configure.patch"
-
-SRC_URI[md5sum] = "704adee92de4010b88b89b329d1faaff"
-SRC_URI[sha256sum] = "e182d7079100edead934d6d2e9a6ff67ce7d7106f59387d9b7ed146cf8770b80"
-
-# autotools-brokensep - configure updates Elementary.h correctly in ${B}, but then build is using Elementary.h from ${S}
-# which includes #define ELM_EMAP (instead of #undef ELM_EMAP) and building fails
-B = "${S}"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.15.1.bb b/meta-efl/recipes-efl/efl/elementary_1.15.1.bb
new file mode 100644
index 0000000..f53eb44
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/elementary_1.15.1.bb
@@ -0,0 +1,16 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+# only for target, because configure doesn't default to sane default when
+# these paths aren't passed in -native build
+SRC_URI_append_class-target = " file://0001-Makefile-Use-elementary_codegen-defined-in-configure.patch"
+
+SRC_URI[md5sum] = "bde4d85fa10ee8a7c0aeb74e69d7cd06"
+SRC_URI[sha256sum] = "ae5540c2103fcdc69fd7469277ce25a8a00a0f701fc2c20771dc0108401e53a0"
+
+# autotools-brokensep - configure updates Elementary.h correctly in ${B}, but then build is using Elementary.h from ${S}
+# which includes #define ELM_EMAP (instead of #undef ELM_EMAP) and building fails
+B = "${S}"
diff --git a/meta-efl/recipes-efl/efl/emotion-generic-players_1.14.0.bb b/meta-efl/recipes-efl/efl/emotion-generic-players_1.14.0.bb
deleted file mode 100644
index 6a7b904..0000000
--- a/meta-efl/recipes-efl/efl/emotion-generic-players_1.14.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "9713c54888c355b5f29d1dc099138b49"
-SRC_URI[sha256sum] = "8345c7d8c3cdf062b5df4500c0d4c557b6109c67667ac2e5431699c8852d2ad8"
diff --git a/meta-efl/recipes-efl/efl/emotion-generic-players_1.15.0.bb b/meta-efl/recipes-efl/efl/emotion-generic-players_1.15.0.bb
new file mode 100644
index 0000000..1a184bd
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/emotion-generic-players_1.15.0.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "68627c1aabf5b7fe084299adcc0b73c1"
+SRC_URI[sha256sum] = "10bad633480a691585b0ba470c573b14da0a010008d9d59d0792cea8c621d423"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.14.0.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.14.0.bb
deleted file mode 100644
index c43f637..0000000
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.14.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "507f28ef012344d1befa6a86cf39304f"
-SRC_URI[sha256sum] = "943b25427c4e77a3aeae72811557a0b1b7ec4c61aa53922a4c4faf17b3dea812"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.15.0.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.15.0.bb
new file mode 100644
index 0000000..911ce8c
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.15.0.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "3ca8443b8cbf177845595c5e02fbc49c"
+SRC_URI[sha256sum] = "caa22c9ba1ae9629c16a3fe809ea927f60b8f0d80cdb7f145159b997b9ae2bcd"
-- 
2.5.1


