Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 965906EAD9
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 07:34:20 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id e53so2643257eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 23:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=BPl2nYqMR6QaSfGh3I6M27N9tev4fVdmxoDG92E5W/w=;
	b=0z3undDdhBG6wxnUkd0xdzS90k4Udqse1Uny6wTYS2vEKO74L0enxS5wCfwcXpR7du
	8ZgLITIGLKDt3UUq2qDDuU1j+p0kReXgrko7248WWJLkFX7pqfavt2Bk8Aoq08iBolXv
	n049FPmWLepVsUrB45VUUS5kvfNR76ZejRBaK6bhw8cEMPqWJuoNC3+hzuU/T3Q+kiCb
	sF/A81xlk2Lgeg/QOSUulccluhm8Z0NVbGgCbTY7nz34wjWcXJOlT13YunW+CrL/j8If
	Ctf90KVVz5N27mRRaioi0tE1sI8lfS+19X7DJQclzIt9z+u7FMvQLN9OGDZ1cJlIjSKw
	Axjw==
X-Received: by 10.15.22.65 with SMTP id e41mr9455071eeu.5.1391240061005;
	Fri, 31 Jan 2014 23:34:21 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	b41sm46486780eef.16.2014.01.31.23.34.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 23:34:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Feb 2014 08:34:01 +0100
Message-Id: <d00bc8d2f04f12af0246ab8f4c7f5468f87a075a.1391239970.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
Subject: [PATCH 05/20] elementary: upgrade to 1.8.4
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
X-List-Received-Date: Sat, 01 Feb 2014 07:34:21 -0000

* Elementary 1.8.3 release
  http://sourceforge.net/mailarchive/message.php?msg_id=31826305
* Elementary 1.8.4 release
  http://sourceforge.net/mailarchive/message.php?msg_id=31895179
* introduce elementary-native for elm-prefs_cc and elementary_codegen
  binary

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/elementary.inc            | 29 ++++++----
 ...e-elm_prefs_cc-and-elementary_codegen-def.patch | 61 ++++++++++++++++++++++
 meta-efl/recipes-efl/efl/elementary_1.7.9.bb       |  8 ---
 meta-efl/recipes-efl/efl/elementary_1.8.4.bb       | 12 +++++
 4 files changed, 92 insertions(+), 18 deletions(-)
 create mode 100644 meta-efl/recipes-efl/efl/elementary/0001-Makefile-Use-elm_prefs_cc-and-elementary_codegen-def.patch
 delete mode 100644 meta-efl/recipes-efl/efl/elementary_1.7.9.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary_1.8.4.bb

diff --git a/meta-efl/recipes-efl/efl/elementary.inc b/meta-efl/recipes-efl/efl/elementary.inc
index 542e200..5c5c463 100644
--- a/meta-efl/recipes-efl/efl/elementary.inc
+++ b/meta-efl/recipes-efl/efl/elementary.inc
@@ -1,20 +1,26 @@
 DESCRIPTION = "EFL based widget set for mobile devices"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=10a051c72424b80bc784a3903651b43b"
-DEPENDS = "eet-native efreet evas ecore edje eet edbus ethumb poppler eio"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ae1a906a61040d01df137a6b2c6acb68"
+DEPENDS = "eet-native edje-native elementary-native efreet evas ecore edje eet eldbus ethumb poppler eio"
+DEPENDS_class-native = "efl-native"
 
 inherit efl gettext
 
 EXTRA_OECONF = "\
+    --disable-web \
+"
+EXTRA_OECONF_append_class-target = "\
     --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
     --with-eet-eet=${STAGING_BINDIR_NATIVE}/eet \
-    --disable-web \
+    --with-elementary-codegen=${STAGING_BINDIR_NATIVE}/elementary_codegen \
+    --with-elm-prefs-cc=${STAGING_BINDIR_NATIVE}/elm_prefs_cc \
 "
 
-PACKAGECONFIG ??= ""
+BBCLASSEXTEND = "native"
+
 PACKAGECONFIG[eweather] = "--enable-eweather,--disable-eweather,libeweather"
 
-do_compile_append() {
+do_compile_append_class-target() {
     sed -i -e s:${STAGING_DIR_TARGET}::g \
            -e s:/${TARGET_SYS}::g \
               elementary.pc
@@ -22,6 +28,8 @@ do_compile_append() {
 
 PACKAGES += "${PN}-configs ${PN}-accessibility"
 
+RDEPENDS_${PN}_class-native = ""
+
 RDEPENDS_${PN} = "\
     ${PN}-themes \
     ${PN}-configs \
@@ -31,10 +39,14 @@ RSUGGESTS_${PN} = "${PN}-tests ${PN}-accessibility"
 FILES_${PN} += "\
     ${libdir}/edje/modules/elm \
     ${libdir}/elementary/modules/datetime_input_ctxpopup/*/module.so \
+    ${libdir}/elementary/modules/prefs/*/module.so \
+    ${libdir}/elementary/modules/prefs/*/*.edj \
 "
 
 FILES_${PN}-dev += "\
-    ${libdir}/elementary/modules/datetime_input_ctxpopup/*/module.la \
+    ${bindir}/elm_prefs_cc \
+    ${libdir}/elementary/modules/*/*/module.la \
+    ${libdir}/cmake \
 "
 
 FILES_${PN}-themes = "\
@@ -46,10 +58,7 @@ FILES_${PN}-configs = "\
 "
 
 FILES_${PN}-dbg += "\
-    ${libdir}/elementary/modules/test_entry/*/.debug \
-    ${libdir}/elementary/modules/test_map/*/.debug \
-    ${libdir}/elementary/modules/access_output/*/.debug \
-    ${libdir}/elementary/modules/datetime_input_ctxpopup/*/.debug \
+    ${libdir}/elementary/modules/*/*/.debug \
     ${libdir}/edje/modules/elm/*/.debug \
 "
 
diff --git a/meta-efl/recipes-efl/efl/elementary/0001-Makefile-Use-elm_prefs_cc-and-elementary_codegen-def.patch b/meta-efl/recipes-efl/efl/elementary/0001-Makefile-Use-elm_prefs_cc-and-elementary_codegen-def.patch
new file mode 100644
index 0000000..e3fba9b
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/elementary/0001-Makefile-Use-elm_prefs_cc-and-elementary_codegen-def.patch
@@ -0,0 +1,61 @@
+From 53c7046933d1b622a7f99e70a08a0bf46e38369f Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 11 Jan 2014 12:55:59 +0100
+Subject: [PATCH] Makefile: Use elm_prefs_cc and elementary_codegen defined in
+ configure
+
+* using binaries from top_buildir doesn't work when cross-compiling elementary
+  where we need to pass native binaries in configure params
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ data/objects/Makefile.am | 2 +-
+ doc/widgets/Makefile.am  | 2 +-
+ src/examples/Makefile.am | 4 ++--
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/data/objects/Makefile.am b/data/objects/Makefile.am
+index c6a775d..88c4f1a 100644
+--- a/data/objects/Makefile.am
++++ b/data/objects/Makefile.am
+@@ -11,7 +11,7 @@ filesdir = $(datadir)/elementary/objects
+ 
+ files_DATA = test.edj test_external.edj multip.edj cursors.edj font_preview.edj postit_ent.edj multibuttonentry.edj test_prefs.edj test_prefs.epb test_focus_custom.edj
+ 
+-ELM_PREFS_CC = $(top_builddir)/src/bin/@ELM_PREFS_CC_PRG@
++ELM_PREFS_CC = @elm_prefs_cc@
+ 
+ EXTRA_DIST = \
+ test.edc \
+diff --git a/doc/widgets/Makefile.am b/doc/widgets/Makefile.am
+index c1508b8..c0544f9 100644
+--- a/doc/widgets/Makefile.am
++++ b/doc/widgets/Makefile.am
+@@ -19,7 +19,7 @@ AM_CPPFLAGS = \
+ @ELEMENTARY_EWEATHER_CFLAGS@ \
+ @ELEMENTARY_EMAP_CFLAGS@
+ 
+-ELM_PREFS_CC = $(top_builddir)/src/bin/@ELM_PREFS_CC_PRG@
++ELM_PREFS_CC = @elm_prefs_cc@
+ 
+ noinst_DATA = widget_preview_prefs.epb
+ 
+diff --git a/src/examples/Makefile.am b/src/examples/Makefile.am
+index 7184ca1..ce80a46 100644
+--- a/src/examples/Makefile.am
++++ b/src/examples/Makefile.am
+@@ -33,9 +33,9 @@ EDJE_FLAGS_VERBOSE_0 =
+ EDJE_FLAGS_VERBOSE_1 = -v
+ EDJE_FLAGS = $(EDJE_FLAGS_VERBOSE_$(V))
+ 
+-ELM_PREFS_CC = $(top_builddir)/src/bin/@ELM_PREFS_CC_PRG@
++ELM_PREFS_CC = @elm_prefs_cc@
+ 
+-ELEMENTARY_CODEGEN = $(top_builddir)/src/bin/@ELEMENTARY_CODEGEN_PRG@
++ELEMENTARY_CODEGEN = @elementary_codegen@
+ ELEMENTARY_CODEGEN_FLAGS = --prefix=codegen_example
+ 
+ SRCS = \
+-- 
+1.8.5.2
+
diff --git a/meta-efl/recipes-efl/efl/elementary_1.7.9.bb b/meta-efl/recipes-efl/efl/elementary_1.7.9.bb
deleted file mode 100644
index 712d668..0000000
--- a/meta-efl/recipes-efl/efl/elementary_1.7.9.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "6a3acb394b640697b1fd2dd61d990d0b"
-SRC_URI[sha256sum] = "3667c6da3d89be5a46363509645be59e3deb1f052bfa14239986ac9499da52fb"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.8.4.bb b/meta-efl/recipes-efl/efl/elementary_1.8.4.bb
new file mode 100644
index 0000000..7208210
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/elementary_1.8.4.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+# only for target, because configure doesn't default to sane default when
+# these paths aren't passed in -native build
+SRC_URI_append_class-target = " file://0001-Makefile-Use-elm_prefs_cc-and-elementary_codegen-def.patch"
+
+SRC_URI[md5sum] = "898d0ee0e18078640948fa5d04d56efe"
+SRC_URI[sha256sum] = "129b8a015c34df3e8633b5b65aa3bcdd77ed101992948cb096389fed3f3a4244"
-- 
1.8.5.3


