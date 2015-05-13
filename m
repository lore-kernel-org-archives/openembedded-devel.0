Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7382474064
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2015 15:33:59 +0000 (UTC)
Received: by wicnf17 with SMTP id nf17so60889917wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2015 08:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ayaDFm3H1ww/CF2OpltppJaRfWKj2CAVQL4JUp9+2jw=;
	b=IsYbVNL5lY7PyW0MEUnspxvjVIm0pCYiwcmlip2Vs3GInxaDYmJdFsezG69s/LRxPh
	SPmaz4hq9O7jDrAbp14CVTCZEco8k945YWBsgse+fczoMs+kJ6TLMOCagxpOV2nJGZdd
	q2nSEbKK9sjTJv2Rj+tc+s+UQ1SY9nznFaXIi4qsxQj70hbGz03Dffowu9SBWptpmg3R
	LQqHTo4zmkYJwtlMoz8kgCZcBJsgQPreg+5d/wi9OPLM8wl7znQq5iDyWUyhXozZJr50
	IZ2f3zVL0tNNE8ZTyRIkCbdaASfhniJ65xRvMMpgGFSbnONcSIT6bDnPAhRHEpCjbklT
	RIMQ==
X-Received: by 10.180.88.72 with SMTP id be8mr40394796wib.45.1431531239971;
	Wed, 13 May 2015 08:33:59 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id i13sm8644386wic.13.2015.05.13.08.33.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 May 2015 08:33:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2015 17:34:04 +0200
Message-Id: <1431531246-27655-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.0
Subject: [meta-efl][PATCH 1/3] efl, elementary, emotion-generic-players, evas-generic-loaders: upgrade to 1.14.0
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
X-List-Received-Date: Wed, 13 May 2015 15:34:02 -0000

* announcement:
  https://phab.enlightenment.org/phame/live/3/post/enlightenment_foundation_libraries_1_14_and_friends_are_out/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/efl.inc                             | 12 +++++++-----
 meta-efl/recipes-efl/efl/{efl_1.13.2.bb => efl_1.14.0.bb}    |  4 ++--
 .../efl/{elementary_1.13.2.bb => elementary_1.14.0.bb}       |  4 ++--
 meta-efl/recipes-efl/efl/emotion-generic-players_1.13.0.bb   |  8 --------
 meta-efl/recipes-efl/efl/emotion-generic-players_1.14.0.bb   |  8 ++++++++
 meta-efl/recipes-efl/efl/evas-generic-loaders_1.13.2.bb      |  8 --------
 meta-efl/recipes-efl/efl/evas-generic-loaders_1.14.0.bb      |  8 ++++++++
 7 files changed, 27 insertions(+), 25 deletions(-)
 rename meta-efl/recipes-efl/efl/{efl_1.13.2.bb => efl_1.14.0.bb} (92%)
 rename meta-efl/recipes-efl/efl/{elementary_1.13.2.bb => elementary_1.14.0.bb} (79%)
 delete mode 100644 meta-efl/recipes-efl/efl/emotion-generic-players_1.13.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion-generic-players_1.14.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.13.2.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.14.0.bb

diff --git a/meta-efl/recipes-efl/efl/efl.inc b/meta-efl/recipes-efl/efl/efl.inc
index ba993af..f2d83c1 100644
--- a/meta-efl/recipes-efl/efl/efl.inc
+++ b/meta-efl/recipes-efl/efl/efl.inc
@@ -1,6 +1,6 @@
 SUMMARY = "EFL"
 LICENSE = "MIT & BSD & LGPL-2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a1809a807e39dd48ddcf7be98477d130"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5cb19adb5be911811c7a4e05152548e8"
 
 DEPENDS_class-native = "freetype-native libxext-native libpng-native jpeg-native tiff-native libfribidi-native glib-2.0-native dbus-native"
 DEPENDS = "virtual/libiconv tslib curl glib-2.0 gnutls pkgconfig zlib jpeg openssl libsndfile1 dbus libexif librsvg freetype libpng tiff libxext virtual/libx11 libxdamage libxrender fontconfig libfribidi giflib udev libxcursor libxcomposite libxinerama libxrandr libxtst libxscrnsaver efl-native util-linux"
@@ -33,6 +33,7 @@ EXTRA_OECONF_append_class-native = " \
     --disable-physics \
     --disable-multisense \
     --disable-cserve \
+    --disable-libeeze \
     --with-x11=none \
     --disable-image-loader-bmp \
     --disable-image-loader-eet \
@@ -70,10 +71,10 @@ PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
 # currently we don't provide doxygen-native
 PACKAGECONFIG[doc] = "--enable-doc,--disable-doc,doxygen-native"
 
-# new efl doesn't have option to disable eeze build and we don't want to provide udev-native just to build eeze-native we don't need
-do_configure_prepend_class-native() {
-    sed -i 's/EFL_LIB_START_OPTIONAL(\[Eeze\], \[test "${have_linux}" = "yes"\])/EFL_LIB_START_OPTIONAL([Eeze], [test "${no-we-really-dont-want-native-eeze}" = "yes"])/g' ${S}/configure.ac
-}
+## new efl doesn't have option to disable eeze build and we don't want to provide udev-native just to build eeze-native we don't need
+#do_configure_prepend_class-native() {
+#    sed -i 's/EFL_LIB_START_OPTIONAL(\[Eeze\], \[test "${have_linux}" = "yes"\])/EFL_LIB_START_OPTIONAL([Eeze], [test "${no-we-really-dont-want-native-eeze}" = "yes"])/g' ${S}/configure.ac
+#}
 
 do_install_append() {
     # don't ship precompiled lua files
@@ -201,6 +202,7 @@ FILES_efreet = " \
 "
 FILES_eet = " \
     ${bindir}/eet \
+    ${bindir}/eetpack \
     ${bindir}/vieet \
     ${bindir}/diffeet \
     ${libdir}/libeet${SOLIBS} \
diff --git a/meta-efl/recipes-efl/efl/efl_1.13.2.bb b/meta-efl/recipes-efl/efl/efl_1.14.0.bb
similarity index 92%
rename from meta-efl/recipes-efl/efl/efl_1.13.2.bb
rename to meta-efl/recipes-efl/efl/efl_1.14.0.bb
index 176f58a..c891f0d 100644
--- a/meta-efl/recipes-efl/efl/efl_1.13.2.bb
+++ b/meta-efl/recipes-efl/efl/efl_1.14.0.bb
@@ -6,8 +6,8 @@ SRC_URI = "\
     file://0002-evas_3d-Add-Eet.h-includes.patch \
 "
 
-SRC_URI[md5sum] = "dd779050ccc4ad8d7ae71f2dc8c85855"
-SRC_URI[sha256sum] = "98404d8de63eea318f748c25708ec989628f025adf12cd54697e5de2fe48c2a4"
+SRC_URI[md5sum] = "b0813fe92cb6eaf861e3c179a19d8e41"
+SRC_URI[sha256sum] = "30a8a239449e0d068a39787b5a4769dd26ddf0476f58f094c85e65b108086269"
 
 # Temporary disable until error like the one following are fixed
 # efl-native/2_1.8.4-r0/efl-1.8.4/src/lib/eet/.libs/libeet.so: file not recognized: File truncated
diff --git a/meta-efl/recipes-efl/efl/elementary_1.13.2.bb b/meta-efl/recipes-efl/efl/elementary_1.14.0.bb
similarity index 79%
rename from meta-efl/recipes-efl/efl/elementary_1.13.2.bb
rename to meta-efl/recipes-efl/efl/elementary_1.14.0.bb
index db6afde..99d58e6 100644
--- a/meta-efl/recipes-efl/efl/elementary_1.13.2.bb
+++ b/meta-efl/recipes-efl/efl/elementary_1.14.0.bb
@@ -8,8 +8,8 @@ SRC_URI = "\
 # these paths aren't passed in -native build
 SRC_URI_append_class-target = " file://0001-Makefile-Use-elementary_codegen-defined-in-configure.patch"
 
-SRC_URI[md5sum] = "0d32d241af1c96c06da6d130020275f0"
-SRC_URI[sha256sum] = "312dd63f3c82c9076f0cfe5125990e650d7767a776186631455911a980f91039"
+SRC_URI[md5sum] = "e77075b8a80e9a931b91388d608c211c"
+SRC_URI[sha256sum] = "aa06ca1b332b3cd29ffd136c1f10edf08a06906b3532785ce7e390c1cad6090e"
 
 # autotools-brokensep - configure updates Elementary.h correctly in ${B}, but then build is using Elementary.h from ${S}
 # which includes #define ELM_EMAP (instead of #undef ELM_EMAP) and building fails
diff --git a/meta-efl/recipes-efl/efl/emotion-generic-players_1.13.0.bb b/meta-efl/recipes-efl/efl/emotion-generic-players_1.13.0.bb
deleted file mode 100644
index e42c516..0000000
--- a/meta-efl/recipes-efl/efl/emotion-generic-players_1.13.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "36e5fc6a2bc83b1ab90c5c72b344f00e"
-SRC_URI[sha256sum] = "23a3966d38cafece2c39d1e9904f26da11b9b282676f2d1fd8e54807251b363e"
diff --git a/meta-efl/recipes-efl/efl/emotion-generic-players_1.14.0.bb b/meta-efl/recipes-efl/efl/emotion-generic-players_1.14.0.bb
new file mode 100644
index 0000000..6a7b904
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/emotion-generic-players_1.14.0.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "9713c54888c355b5f29d1dc099138b49"
+SRC_URI[sha256sum] = "8345c7d8c3cdf062b5df4500c0d4c557b6109c67667ac2e5431699c8852d2ad8"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.13.2.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.13.2.bb
deleted file mode 100644
index 162a85b..0000000
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.13.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "b1e3401429b7dadbf70e9472d25c9986"
-SRC_URI[sha256sum] = "8455f10b8dd418eaa4d64d3eb6446814d893d96ff083646afbdbdf8626baa81a"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.14.0.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.14.0.bb
new file mode 100644
index 0000000..c43f637
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.14.0.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "507f28ef012344d1befa6a86cf39304f"
+SRC_URI[sha256sum] = "943b25427c4e77a3aeae72811557a0b1b7ec4c61aa53922a4c4faf17b3dea812"
-- 
2.4.0


