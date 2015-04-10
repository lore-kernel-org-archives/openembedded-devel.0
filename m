Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0FEF96ABF7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Apr 2015 11:33:48 +0000 (UTC)
Received: by wiun10 with SMTP id n10so23004968wiu.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Apr 2015 04:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=am7qNMjZvW3L2iUQkEdAHSGFPDBQUOzS1iBKqCGkk/4=;
	b=hYCqOGmuQkv1AppNyoxoEGJSvm9JChf1hqLtsUUUX/1uUABYvvmtMon7pLC5xIHXxP
	pm7SMmbZw9C9weN+7JqmphZd1D16MhKR2UZi3COP/pnOGBdLQtA7C2sMRg30INd2Lxoa
	Ayehw3lts2247ANCS4sGjasqkXdGVK4wa4lKwrdU+pQb3yWRSfFAupxjCIw6GaXK3ScG
	q19bleT1rOVKLItYQdbC0gt/61KnBcJCLC36vzJoomoE1/mnCqxfukv9/CylPC3n/H6g
	97ZcBn/tmlXuqZmUyYMrPaYEcDBi4DdHLjeaSZ1GyTPYnar/TgwCcEPTcka3sH4upidL
	DlAw==
X-Received: by 10.180.84.3 with SMTP id u3mr14592886wiy.38.1428665629193;
	Fri, 10 Apr 2015 04:33:49 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id h5sm2538451wjn.20.2015.04.10.04.33.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Apr 2015 04:33:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Apr 2015 13:33:48 +0200
Message-Id: <1428665629-15335-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-efl][PATCH 1/2] efl, elementary, evas-generic-loaders: upgrade to 1.13.2
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
X-List-Received-Date: Fri, 10 Apr 2015 11:33:49 -0000

* announcements:
  https://phab.enlightenment.org/phame/live/3/post/efl_and_elementary_1_13_1_release/
  https://phab.enlightenment.org/phame/live/3/post/efl_elementary_and_evas_generic_loaders_1_13_2_release/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/efl.inc                   |  7 ++++-
 ..._cc-Avoid-segfault-when-strcmp-NULL-items.patch | 30 ----------------------
 .../efl/{efl_1.13.0.bb => efl_1.13.2.bb}           |  5 ++--
 .../{elementary_1.13.0.bb => elementary_1.13.2.bb} |  4 +--
 .../recipes-efl/efl/evas-generic-loaders_1.13.0.bb |  8 ------
 .../recipes-efl/efl/evas-generic-loaders_1.13.2.bb |  8 ++++++
 6 files changed, 18 insertions(+), 44 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/efl/efl/0003-edje_cc-Avoid-segfault-when-strcmp-NULL-items.patch
 rename meta-efl/recipes-efl/efl/{efl_1.13.0.bb => efl_1.13.2.bb} (89%)
 rename meta-efl/recipes-efl/efl/{elementary_1.13.0.bb => elementary_1.13.2.bb} (79%)
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.13.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.13.2.bb

diff --git a/meta-efl/recipes-efl/efl/efl.inc b/meta-efl/recipes-efl/efl/efl.inc
index b765bf0..ba993af 100644
--- a/meta-efl/recipes-efl/efl/efl.inc
+++ b/meta-efl/recipes-efl/efl/efl.inc
@@ -3,7 +3,7 @@ LICENSE = "MIT & BSD & LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a1809a807e39dd48ddcf7be98477d130"
 
 DEPENDS_class-native = "freetype-native libxext-native libpng-native jpeg-native tiff-native libfribidi-native glib-2.0-native dbus-native"
-DEPENDS = "virtual/libiconv tslib curl glib-2.0 gnutls pkgconfig zlib jpeg openssl libsndfile1 dbus libexif librsvg freetype libpng tiff libxext virtual/libx11 libxdamage libxrender fontconfig libfribidi giflib udev libxcursor libxcomposite libxinerama libxrandr libxtst libxscrnsaver efl-native"
+DEPENDS = "virtual/libiconv tslib curl glib-2.0 gnutls pkgconfig zlib jpeg openssl libsndfile1 dbus libexif librsvg freetype libpng tiff libxext virtual/libx11 libxdamage libxrender fontconfig libfribidi giflib udev libxcursor libxcomposite libxinerama libxrandr libxtst libxscrnsaver efl-native util-linux"
 
 inherit efl gettext pkgconfig
 
@@ -75,6 +75,11 @@ do_configure_prepend_class-native() {
     sed -i 's/EFL_LIB_START_OPTIONAL(\[Eeze\], \[test "${have_linux}" = "yes"\])/EFL_LIB_START_OPTIONAL([Eeze], [test "${no-we-really-dont-want-native-eeze}" = "yes"])/g' ${S}/configure.ac
 }
 
+do_install_append() {
+    # don't ship precompiled lua files
+    rm -f ${datadir}/elua/*/*.luac
+}
+
 PACKAGES =+ "edje-utils embryo-utils embryo-tests efreet-trash efreet-mime libeet libefreet ecore-audio ecore-input-evas ecore-input ecore-imf-evas ecore-imf ecore-file ecore-con ecore-ipc ecore-x ecore-evas libemotion eo ecore edje eet eeze efreet eina eio embryo emotion ethumb evas eldbus elua"
 
 # upgrade path from 1.7
diff --git a/meta-efl/recipes-efl/efl/efl/0003-edje_cc-Avoid-segfault-when-strcmp-NULL-items.patch b/meta-efl/recipes-efl/efl/efl/0003-edje_cc-Avoid-segfault-when-strcmp-NULL-items.patch
deleted file mode 100644
index 55d7b54..0000000
--- a/meta-efl/recipes-efl/efl/efl/0003-edje_cc-Avoid-segfault-when-strcmp-NULL-items.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 84259714c2376fdb919299e8e01af1ccc6fbe2c0 Mon Sep 17 00:00:00 2001
-From: Stefan Schmidt <s.schmidt@samsung.com>
-Date: Thu, 12 Feb 2015 15:24:27 +0100
-Subject: [PATCH 3/3] edje_cc: Avoid segfault when strcmp NULL items
-
-Martin reported a porblem with one of the SHR project edc files after an upgrade
-to 1.13. The segfault itself is easy enough to fix here but I think there might
-be other problems with the edc after this segfault is gone. We will see.
-
-Fixes T2106
----
- src/bin/edje/edje_cc_out.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/bin/edje/edje_cc_out.c b/src/bin/edje/edje_cc_out.c
-index 4f582c7..bc85444 100755
---- a/src/bin/edje/edje_cc_out.c
-+++ b/src/bin/edje/edje_cc_out.c
-@@ -386,7 +386,7 @@ check_source_links(Edje_Part_Collection *pc, Edje_Part *ep, Eet_File *ef, Eina_L
-    EINA_LIST_FOREACH(edje_collections, l, pc_source)
-      {
-         /* Find sourced group */
--        if (strcmp(ep->source, pc_source->part) == 0)
-+        if (ep->source && pc_source->part && strcmp(ep->source, pc_source->part) == 0)
-           {
-              /* Go through every part to find parts with type GROUP */
-              for (i = 0; i < pc_source->parts_count; ++i)
--- 
-2.3.0
-
diff --git a/meta-efl/recipes-efl/efl/efl_1.13.0.bb b/meta-efl/recipes-efl/efl/efl_1.13.2.bb
similarity index 89%
rename from meta-efl/recipes-efl/efl/efl_1.13.0.bb
rename to meta-efl/recipes-efl/efl/efl_1.13.2.bb
index b243b81..176f58a 100644
--- a/meta-efl/recipes-efl/efl/efl_1.13.0.bb
+++ b/meta-efl/recipes-efl/efl/efl_1.13.2.bb
@@ -4,11 +4,10 @@ SRC_URI = "\
     ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
     file://0001-configure.ac-Don-t-check-for-Xprint-extension.patch \
     file://0002-evas_3d-Add-Eet.h-includes.patch \
-    file://0003-edje_cc-Avoid-segfault-when-strcmp-NULL-items.patch \
 "
 
-SRC_URI[md5sum] = "c73f00e1e25b3b660e15ef754c76541d"
-SRC_URI[sha256sum] = "7ff797d4cd01143edc1258a287be3ddfb11264f0b855878d8f5ad5129dee9357"
+SRC_URI[md5sum] = "dd779050ccc4ad8d7ae71f2dc8c85855"
+SRC_URI[sha256sum] = "98404d8de63eea318f748c25708ec989628f025adf12cd54697e5de2fe48c2a4"
 
 # Temporary disable until error like the one following are fixed
 # efl-native/2_1.8.4-r0/efl-1.8.4/src/lib/eet/.libs/libeet.so: file not recognized: File truncated
diff --git a/meta-efl/recipes-efl/efl/elementary_1.13.0.bb b/meta-efl/recipes-efl/efl/elementary_1.13.2.bb
similarity index 79%
rename from meta-efl/recipes-efl/efl/elementary_1.13.0.bb
rename to meta-efl/recipes-efl/efl/elementary_1.13.2.bb
index e7be246..db6afde 100644
--- a/meta-efl/recipes-efl/efl/elementary_1.13.0.bb
+++ b/meta-efl/recipes-efl/efl/elementary_1.13.2.bb
@@ -8,8 +8,8 @@ SRC_URI = "\
 # these paths aren't passed in -native build
 SRC_URI_append_class-target = " file://0001-Makefile-Use-elementary_codegen-defined-in-configure.patch"
 
-SRC_URI[md5sum] = "e8464cc2d89585cfe189584c7081845b"
-SRC_URI[sha256sum] = "52f1b4304f22156ab53d2d13b8d8f15c58a110a3bc3f31a13fc357eb9527778c"
+SRC_URI[md5sum] = "0d32d241af1c96c06da6d130020275f0"
+SRC_URI[sha256sum] = "312dd63f3c82c9076f0cfe5125990e650d7767a776186631455911a980f91039"
 
 # autotools-brokensep - configure updates Elementary.h correctly in ${B}, but then build is using Elementary.h from ${S}
 # which includes #define ELM_EMAP (instead of #undef ELM_EMAP) and building fails
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.13.0.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.13.0.bb
deleted file mode 100644
index cae8df7..0000000
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.13.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "45df9e4816ceba40219db0167c549e1e"
-SRC_URI[sha256sum] = "c3bcb7d418b8cea79bbaf0731d008e527697b44239ff6b69064df785ca94df9b"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.13.2.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.13.2.bb
new file mode 100644
index 0000000..162a85b
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.13.2.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "b1e3401429b7dadbf70e9472d25c9986"
+SRC_URI[sha256sum] = "8455f10b8dd418eaa4d64d3eb6446814d893d96ff083646afbdbdf8626baa81a"
-- 
2.3.5


