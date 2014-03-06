Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 70F376F5A0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Mar 2014 16:48:11 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id q10so1809077ead.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Mar 2014 08:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=wTkD/iE1P2e0Y8P2ptyQFgimOw8hkIFLMKhDTIH/Qxs=;
	b=GpDpGmIMcgEzO8Au0xL/+dm9c7p+jBPJYCdIcjSHWQFLX/3nSRGScevuRyad6jdFTI
	S9GLjNLCPavmcguNYtEHTNfkuOgs1pASjysniWZvy3S8GkpgTT5kP3DVXS+6mv57kG3Z
	KoFSFN/TFghdpFGmjjGxMS2UKATAEd8J3OSYDDl4w1ySAQ3WsUH1QmbKpePUJo4NK/WO
	WjokG9d9Ggiju0Hs025E0f+Hk0HGhnWUoOcLwMNkHn+Llxac8JFJPhTLRHWQSmPBT6De
	c2ZX1rsXl7yfyDILFilVKqL9ryVA9srC+nMgFKys/3lbmI0TKZpHCwzo9tTqX9KsCUjZ
	HCzQ==
X-Received: by 10.14.251.5 with SMTP id a5mr3671563ees.108.1394124492288;
	Thu, 06 Mar 2014 08:48:12 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u6sm23683050eep.11.2014.03.06.08.48.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Mar 2014 08:48:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Mar 2014 17:48:11 +0100
Message-Id: <b5feda34dadeb551dea8148a4ccf25bc477ede2a.1394124356.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1394124356.git.Martin.Jansa@gmail.com>
References: <cover.1394124356.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1394124356.git.Martin.Jansa@gmail.com>
References: <cover.1394124356.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][WIP][PATCH 1/6] efl: upgrade to 1.9.0
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
X-List-Received-Date: Thu, 06 Mar 2014 16:48:13 -0000

* announcement:
  http://sourceforge.net/mailarchive/message.php?msg_id=32024303
* emotion-generic-players and evas-generic-loaders LIC_FILES_CHKSUM
  change is just copyright update

  < Copyright (C) 2011-2011 Carsten Haitzler and various contributors (see AUTHORS)
  ---
  > Copyright (C) 2011-2014 Carsten Haitzler and various contributors (see AUTHORS)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/efl.inc                   | 18 +++++--
 .../recipes-efl/efl/{efl_1.8.5.bb => efl_1.9.0.bb} |  6 +--
 meta-efl/recipes-efl/efl/elementary.inc            |  2 +-
 ...e-elementary_codegen-defined-in-configure.patch | 29 ++++++++++
 ...e-elm_prefs_cc-and-elementary_codegen-def.patch | 61 ----------------------
 .../{elementary_1.8.4.bb => elementary_1.9.0.bb}   |  6 +--
 .../recipes-efl/efl/emotion-generic-players.inc    |  4 +-
 ...s_1.8.1.bb => emotion-generic-players_1.9.0.bb} |  4 +-
 meta-efl/recipes-efl/efl/evas-generic-loaders.inc  |  2 +-
 ...yers_1.8.1.bb => evas-generic-loaders_1.9.0.bb} |  4 +-
 10 files changed, 59 insertions(+), 77 deletions(-)
 rename meta-efl/recipes-efl/efl/{efl_1.8.5.bb => efl_1.9.0.bb} (77%)
 create mode 100644 meta-efl/recipes-efl/efl/elementary/0001-Makefile-Use-elementary_codegen-defined-in-configure.patch
 delete mode 100644 meta-efl/recipes-efl/efl/elementary/0001-Makefile-Use-elm_prefs_cc-and-elementary_codegen-def.patch
 rename meta-efl/recipes-efl/efl/{elementary_1.8.4.bb => elementary_1.9.0.bb} (47%)
 rename meta-efl/recipes-efl/efl/{evas-generic-loaders_1.8.1.bb => emotion-generic-players_1.9.0.bb} (41%)
 rename meta-efl/recipes-efl/efl/{emotion-generic-players_1.8.1.bb => evas-generic-loaders_1.9.0.bb} (41%)

diff --git a/meta-efl/recipes-efl/efl/efl.inc b/meta-efl/recipes-efl/efl/efl.inc
index 4e25389..56b3cd2 100644
--- a/meta-efl/recipes-efl/efl/efl.inc
+++ b/meta-efl/recipes-efl/efl/efl.inc
@@ -3,7 +3,7 @@ LICENSE = "MIT BSD LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a1809a807e39dd48ddcf7be98477d130"
 
 DEPENDS_class-native = "lua5.1-native freetype-native libxext-native libpng-native jpeg-native tiff-native libfribidi-native glib-2.0-native dbus-native"
-DEPENDS = "virtual/libiconv tslib curl glib-2.0 gnutls pkgconfig zlib jpeg openssl libsndfile1 lua5.1 dbus libexif librsvg freetype libpng tiff libxext virtual/libx11 libxrender fontconfig libfribidi giflib udev libxcursor libxcomposite libxinerama libxrandr libxtst libxscrnsaver efl-native"
+DEPENDS = "virtual/libiconv tslib curl glib-2.0 gnutls pkgconfig zlib jpeg openssl libsndfile1 luajit dbus libexif librsvg freetype libpng tiff libxext virtual/libx11 libxrender fontconfig libfribidi giflib udev libxcursor libxcomposite libxinerama libxrandr libxtst libxscrnsaver efl-native"
 
 inherit efl gettext pkgconfig
 
@@ -12,8 +12,14 @@ BBCLASSEXTEND = "native"
 PROVIDES += "ecore edje eet eeze efreet eina eio embryo emotion ethumb evas eldbus"
 
 # we don't have bullet for physics
+# You have chosen to disable physics support. This disables lots of
+# core functionality and is effectively never tested. You are going
+# to find features that suddenly don't work and as a result cause
+# a series of breakages. This is simply not tested so you are on
+# your own in terms of ensuring everything works if you do this
 EXTRA_OECONF = " \
     --disable-physics \
+    --enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-aaa \
 "
 EXTRA_OECONF_append_class-target = " \
     --with-bin-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
@@ -36,16 +42,19 @@ EXTRA_OECONF_append_class-native = " \
     --disable-image-loader-xpm \
 "
 
-PACKAGECONFIG ??= "opengl-es"
+PACKAGECONFIG ?= "opengl-es gstreamer1 pulseaudio"
 PACKAGECONFIG_class-native = ""
 
 # sort of tri-state
 PACKAGECONFIG[opengl-full] = "--with-opengl=full,,virtual/libgl"
 PACKAGECONFIG[opengl-es] = "--with-opengl=es,,virtual/libgles2"
 PACKAGECONFIG[opengl-none] = "--with-opengl=none,,"
-# used only in ecore examples and supports only 0.10 now
 PACKAGECONFIG[gstreamer] = "--enable-gstreamer,--disable-gstreamer,gstreamer"
+PACKAGECONFIG[gstreamer1] = "--enable-gstreamer1,--disable-gstreamer1,gstreamer1.0 gstreamer1.0-plugins-base"
 PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
+PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
+# we don't have luajit-native now, so use old lua for -native
+PACKAGECONFIG[luajit] = "--disable-lua-old,--enable-lua-old,luajit"
 
 # new efl doesn't have option to disable eeze build and we don't want to provide udev-native just to build eeze-native we don't need
 do_configure_prepend_class-native() {
@@ -175,6 +184,7 @@ FILES_eet = " \
 "
 FILES_emotion = " \
     ${datadir}/emotion \
+    ${libdir}/emotion/modules/gstreamer1/*/module.so \
 "
 FILES_embryo-tests = " \
     ${datadir}/embryo/ \
@@ -234,6 +244,7 @@ FILES_${PN}-dbg += " \
     ${libdir}/edje/utils/*/.debug \
     ${libdir}/ethumb/*/*/*/.debug \
     ${libdir}/ethumb_client/utils/*/.debug \
+    ${libdir}/emotion/modules/gstreamer1/*/.debug \
 "
 FILES_${PN}-dev += " \
     ${libdir}/cmake \
@@ -242,6 +253,7 @@ FILES_${PN}-dev += " \
     ${libdir}/ethumb*/*/*/*/module.la \
     ${libdir}/eeze*/*/*/*/*/module.la \
     ${libdir}/edje*/*/*/*/module.la \
+    ${libdir}/emotion/modules/gstreamer1/*/module.la \
     ${datadir}/gdb/auto-load \
     ${datadir}/eo/gdb \
     ${bindir}/eldbus-codegen \
diff --git a/meta-efl/recipes-efl/efl/efl_1.8.5.bb b/meta-efl/recipes-efl/efl/efl_1.9.0.bb
similarity index 77%
rename from meta-efl/recipes-efl/efl/efl_1.8.5.bb
rename to meta-efl/recipes-efl/efl/efl_1.9.0.bb
index cacae5f..b6aa77f 100644
--- a/meta-efl/recipes-efl/efl/efl_1.8.5.bb
+++ b/meta-efl/recipes-efl/efl/efl_1.9.0.bb
@@ -4,14 +4,14 @@ SRC_URI = "\
     ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "3d2c3ca2ff1a072b72ffab40ff598dfb"
-SRC_URI[sha256sum] = "7e514c0a972feea1c44c9074a4b58c14821d93dc91ff6f51066528f12ab42fe5"
+SRC_URI[md5sum] = "f5d0c61db951cb6a5434a30672975dd1"
+SRC_URI[sha256sum] = "fd4703edb56c01b713f92849fb15f6ca3d866227ce4abff2d90b08244cd99a99"
 
 # Temporary disable until error like the one following are fixed
 # efl-native/2_1.8.4-r0/efl-1.8.4/src/lib/eet/.libs/libeet.so: file not recognized: File truncated
 # collect2: error: ld returned 1 exit status
 # x86_64-linux-libtool: install: error: relink `modules/evas/savers/tiff/module.la' with the above command before installing it
 # Makefile:11031: recipe for target 'install-savertiffpkgLTLIBRARIES' failed
-PARALLEL_MAKE = ""
+PARALLEL_MAKE_class-native = ""
 
 SRC_URI += "file://0001-configure.ac-Don-t-check-for-Xprint-extension.patch"
diff --git a/meta-efl/recipes-efl/efl/elementary.inc b/meta-efl/recipes-efl/efl/elementary.inc
index 8d95967..6de749a 100644
--- a/meta-efl/recipes-efl/efl/elementary.inc
+++ b/meta-efl/recipes-efl/efl/elementary.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "EFL based widget set for mobile devices"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ae1a906a61040d01df137a6b2c6acb68"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a173054a93896e933df53e3382d472c2"
 DEPENDS = "eet-native edje-native elementary-native efreet evas ecore edje eet eldbus ethumb poppler eio"
 DEPENDS_class-native = "efl-native"
 
diff --git a/meta-efl/recipes-efl/efl/elementary/0001-Makefile-Use-elementary_codegen-defined-in-configure.patch b/meta-efl/recipes-efl/efl/elementary/0001-Makefile-Use-elementary_codegen-defined-in-configure.patch
new file mode 100644
index 0000000..9524c70
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/elementary/0001-Makefile-Use-elementary_codegen-defined-in-configure.patch
@@ -0,0 +1,29 @@
+From 75d104d105aa03dd9d446fa7d84fa95e0f566cf9 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 11 Jan 2014 12:55:59 +0100
+Subject: [PATCH] Makefile: Use elementary_codegen defined in configure
+
+* using binaries from top_buildir doesn't work when cross-compiling elementary
+  where we need to pass native binaries in configure params
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/examples/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/examples/Makefile.am b/src/examples/Makefile.am
+index fc35c75..1e10b0b 100644
+--- a/src/examples/Makefile.am
++++ b/src/examples/Makefile.am
+@@ -29,7 +29,7 @@ LDADD = \
+ @ELEMENTARY_X_LIBS@ \
+ $(top_builddir)/src/lib/libelementary.la
+ 
+-ELEMENTARY_CODEGEN = $(top_builddir)/src/bin/@ELEMENTARY_CODEGEN_PRG@
++ELEMENTARY_CODEGEN = @elementary_codegen@
+ ELEMENTARY_CODEGEN_FLAGS = --prefix=codegen_example
+ 
+ SRCS = \
+-- 
+1.9.0
+
diff --git a/meta-efl/recipes-efl/efl/elementary/0001-Makefile-Use-elm_prefs_cc-and-elementary_codegen-def.patch b/meta-efl/recipes-efl/efl/elementary/0001-Makefile-Use-elm_prefs_cc-and-elementary_codegen-def.patch
deleted file mode 100644
index e3fba9b..0000000
--- a/meta-efl/recipes-efl/efl/elementary/0001-Makefile-Use-elm_prefs_cc-and-elementary_codegen-def.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 53c7046933d1b622a7f99e70a08a0bf46e38369f Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 11 Jan 2014 12:55:59 +0100
-Subject: [PATCH] Makefile: Use elm_prefs_cc and elementary_codegen defined in
- configure
-
-* using binaries from top_buildir doesn't work when cross-compiling elementary
-  where we need to pass native binaries in configure params
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- data/objects/Makefile.am | 2 +-
- doc/widgets/Makefile.am  | 2 +-
- src/examples/Makefile.am | 4 ++--
- 3 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/data/objects/Makefile.am b/data/objects/Makefile.am
-index c6a775d..88c4f1a 100644
---- a/data/objects/Makefile.am
-+++ b/data/objects/Makefile.am
-@@ -11,7 +11,7 @@ filesdir = $(datadir)/elementary/objects
- 
- files_DATA = test.edj test_external.edj multip.edj cursors.edj font_preview.edj postit_ent.edj multibuttonentry.edj test_prefs.edj test_prefs.epb test_focus_custom.edj
- 
--ELM_PREFS_CC = $(top_builddir)/src/bin/@ELM_PREFS_CC_PRG@
-+ELM_PREFS_CC = @elm_prefs_cc@
- 
- EXTRA_DIST = \
- test.edc \
-diff --git a/doc/widgets/Makefile.am b/doc/widgets/Makefile.am
-index c1508b8..c0544f9 100644
---- a/doc/widgets/Makefile.am
-+++ b/doc/widgets/Makefile.am
-@@ -19,7 +19,7 @@ AM_CPPFLAGS = \
- @ELEMENTARY_EWEATHER_CFLAGS@ \
- @ELEMENTARY_EMAP_CFLAGS@
- 
--ELM_PREFS_CC = $(top_builddir)/src/bin/@ELM_PREFS_CC_PRG@
-+ELM_PREFS_CC = @elm_prefs_cc@
- 
- noinst_DATA = widget_preview_prefs.epb
- 
-diff --git a/src/examples/Makefile.am b/src/examples/Makefile.am
-index 7184ca1..ce80a46 100644
---- a/src/examples/Makefile.am
-+++ b/src/examples/Makefile.am
-@@ -33,9 +33,9 @@ EDJE_FLAGS_VERBOSE_0 =
- EDJE_FLAGS_VERBOSE_1 = -v
- EDJE_FLAGS = $(EDJE_FLAGS_VERBOSE_$(V))
- 
--ELM_PREFS_CC = $(top_builddir)/src/bin/@ELM_PREFS_CC_PRG@
-+ELM_PREFS_CC = @elm_prefs_cc@
- 
--ELEMENTARY_CODEGEN = $(top_builddir)/src/bin/@ELEMENTARY_CODEGEN_PRG@
-+ELEMENTARY_CODEGEN = @elementary_codegen@
- ELEMENTARY_CODEGEN_FLAGS = --prefix=codegen_example
- 
- SRCS = \
--- 
-1.8.5.2
-
diff --git a/meta-efl/recipes-efl/efl/elementary_1.8.4.bb b/meta-efl/recipes-efl/efl/elementary_1.9.0.bb
similarity index 47%
rename from meta-efl/recipes-efl/efl/elementary_1.8.4.bb
rename to meta-efl/recipes-efl/efl/elementary_1.9.0.bb
index 7208210..e7cbb5b 100644
--- a/meta-efl/recipes-efl/efl/elementary_1.8.4.bb
+++ b/meta-efl/recipes-efl/efl/elementary_1.9.0.bb
@@ -6,7 +6,7 @@ SRC_URI = "\
 
 # only for target, because configure doesn't default to sane default when
 # these paths aren't passed in -native build
-SRC_URI_append_class-target = " file://0001-Makefile-Use-elm_prefs_cc-and-elementary_codegen-def.patch"
+SRC_URI_append_class-target = " file://0001-Makefile-Use-elementary_codegen-defined-in-configure.patch"
 
-SRC_URI[md5sum] = "898d0ee0e18078640948fa5d04d56efe"
-SRC_URI[sha256sum] = "129b8a015c34df3e8633b5b65aa3bcdd77ed101992948cb096389fed3f3a4244"
+SRC_URI[md5sum] = "408b61a080f51731eeed81968d3cc7f5"
+SRC_URI[sha256sum] = "95cb9ade6c1f135b673555d927d13b5e06986353047178125346abdf6c2b4d82"
diff --git a/meta-efl/recipes-efl/efl/emotion-generic-players.inc b/meta-efl/recipes-efl/efl/emotion-generic-players.inc
index 5c16802..4ab89ae 100644
--- a/meta-efl/recipes-efl/efl/emotion-generic-players.inc
+++ b/meta-efl/recipes-efl/efl/emotion-generic-players.inc
@@ -1,6 +1,8 @@
 DESCRIPTION = "Emotion generic players"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=69f44058245ce5c596d56bb622d5dabd"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a0f11eedf8706bf6d4d6639fb67eb8ae"
+
+DEPENDS = "emotion"
 
 inherit efl
 
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.8.1.bb b/meta-efl/recipes-efl/efl/emotion-generic-players_1.9.0.bb
similarity index 41%
rename from meta-efl/recipes-efl/efl/evas-generic-loaders_1.8.1.bb
rename to meta-efl/recipes-efl/efl/emotion-generic-players_1.9.0.bb
index 21e57f9..0337751 100644
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.8.1.bb
+++ b/meta-efl/recipes-efl/efl/emotion-generic-players_1.9.0.bb
@@ -4,5 +4,5 @@ SRC_URI = "\
     ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "2f39de031a236e53d251beefb4f6fcfd"
-SRC_URI[sha256sum] = "fa5d40324367b2e126853ba70f6522552fff9e80f6dd91566b2dacc4b0ffebc0"
+SRC_URI[md5sum] = "dc897ba540560fce0787bbff8455c022"
+SRC_URI[sha256sum] = "d26546adf61db7521f9d46f2baedcb645af72497fc259e93907026970d42d794"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders.inc b/meta-efl/recipes-efl/efl/evas-generic-loaders.inc
index 904527c..e64fa88 100644
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders.inc
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Evas generic loaders"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f86abf15f4d911ae87092e90222d0ef3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f3877fbaaa46306051a559814451883c"
 DEPENDS = "eina poppler librsvg cairo"
 
 inherit efl
diff --git a/meta-efl/recipes-efl/efl/emotion-generic-players_1.8.1.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.9.0.bb
similarity index 41%
rename from meta-efl/recipes-efl/efl/emotion-generic-players_1.8.1.bb
rename to meta-efl/recipes-efl/efl/evas-generic-loaders_1.9.0.bb
index 9fc50a7..38d0518 100644
--- a/meta-efl/recipes-efl/efl/emotion-generic-players_1.8.1.bb
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.9.0.bb
@@ -4,5 +4,5 @@ SRC_URI = "\
     ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "895d8057fb5cdcadd9ed1f710a460b4e"
-SRC_URI[sha256sum] = "d3221726df583b3d5d43192e4909c08ac4dbf7ff35b81568ac339d7dbaf84d36"
+SRC_URI[md5sum] = "bec6d27fc4afd2f5e4829da5aeccdc0b"
+SRC_URI[sha256sum] = "9447839047b087b0293b2ed6c453249919f66e5c4f62e252a7b7e4f996c2ac5f"
-- 
1.9.0


