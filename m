Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 764F26FB75
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jun 2014 22:08:53 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id t60so1856679wes.41
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jun 2014 15:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oCIk8CVxNggCYUSMwCeUeDN2K0WIdsyNAZ4L3/9elSQ=;
	b=GNYXywvLLy6wHacij8PEmWqukkVeyrcENaQt11eTEUWLB3mDSa9ES07yab1MK9Zn9W
	ucJfDFm5r0Efyc/PoyyvzP6V8vmKgcat4uqku9XGM3KbrKedwa3UvmbrzNjpz3Tgcovd
	acF4YOY7qzI4495y89Nhv9USbWh1hzX6TlB+OIZkPXA6IsE3ycqrjY3YKfjSGkyWMrgr
	zul4S2ESGVZ+GNyePTlQl8JFBynIHaEEfjaOaBO5y4mvexjdP0u55f1m9/w4+bckw/ga
	0XHfzlNldMb+xKoJaFJA+Dzuhy9LC0v5LAOofbfpQt7WYWqaCqqbvrSy02kxTxGOtDmR
	otTw==
X-Received: by 10.14.184.130 with SMTP id s2mr438444eem.34.1402006133869;
	Thu, 05 Jun 2014 15:08:53 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	z44sm17724926eep.39.2014.06.05.15.08.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jun 2014 15:08:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Jun 2014 00:08:55 +0200
Message-Id: <1402006139-27614-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1402006139-27614-1-git-send-email-Martin.Jansa@gmail.com>
References: <1401875817-30867-1-git-send-email-Martin.Jansa@gmail.com>
	<1402006139-27614-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCHv2 06/10] recipes-git: Upgrade to latest origin/stable
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
X-List-Received-Date: Thu, 05 Jun 2014 22:08:54 -0000

* qtbase: Fix undefined reference to qt_blend_argb32_on_argb32_ssse3

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/include/qt5-versions.inc               |  9 +++-
 recipes-qt/qt5/nativesdk-qtbase_git.bb             | 12 ++---
 recipes-qt/qt5/nativesdk-qttools_git.bb            |  2 +-
 recipes-qt/qt5/qt3d_git.bb                         |  2 +-
 recipes-qt/qt5/qt5-git.inc                         |  2 +-
 .../qtbase-git/0001-Add-linux-oe-g-platform.patch  | 26 +++++++----
 .../qtbase-git/0001-Fix-missing-plugin_types.patch | 30 ------------
 ...01-Revert-Use-the-gcc-feature-in-simd.prf.patch | 29 ++++++++++++
 .../0002-Add-external-hostbindir-option.patch      | 53 ++++++++++------------
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  8 ++--
 ...p-Prefix-default-LIBDIRS-and-INCDIRS-with.patch |  8 ++--
 ...fs-Print-the-chosen-config-in-debug-mode.patch} | 10 ++--
 ...build-uic.patch => 0006-Always-build-uic.patch} |  6 +--
 ...build-it-in-configure-but-allow-to-build.patch} | 12 ++---
 ...eserve-built-qmake-and-swap-with-native-.patch} | 11 ++---
 ...l-error-for-platforms-only-supporting-on.patch} |  6 +--
 ...mp-path-length-from-256-to-512-character.patch} | 10 ++--
 ...integration-Undefine-CursorShape-from-X..patch} |  6 +--
 recipes-qt/qt5/qtbase-native_git.bb                |  8 ++--
 recipes-qt/qt5/qtbase_git.bb                       | 12 ++---
 recipes-qt/qt5/qtconnectivity_git.bb               |  2 +-
 recipes-qt/qt5/qtdeclarative.inc                   |  1 -
 recipes-qt/qt5/qtdeclarative_5.3.0.bb              |  4 ++
 recipes-qt/qt5/qtdeclarative_git.bb                |  2 +-
 recipes-qt/qt5/qtenginio_git.bb                    |  4 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |  2 +-
 recipes-qt/qt5/qtimageformats_git.bb               |  2 +-
 recipes-qt/qt5/qtlocation_git.bb                   |  2 +-
 recipes-qt/qt5/qtmultimedia_git.bb                 |  2 +-
 recipes-qt/qt5/qtquick1_git.bb                     |  2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |  2 +-
 recipes-qt/qt5/qtscript_git.bb                     |  2 +-
 recipes-qt/qt5/qtsensors_git.bb                    |  2 +-
 recipes-qt/qt5/qtserialport_git.bb                 |  2 +-
 recipes-qt/qt5/qtsvg_git.bb                        |  2 +-
 ...w-to-build-only-lrelease-lupdate-lconvert.patch | 21 ++++-----
 ...t-help-fix-linking-of-dependent-libraries.patch |  4 +-
 recipes-qt/qt5/qttools-native_git.bb               |  2 +-
 recipes-qt/qt5/qttools_git.bb                      |  2 +-
 recipes-qt/qt5/qtwayland-native_git.bb             |  2 +-
 recipes-qt/qt5/qtwayland_git.bb                    |  2 +-
 recipes-qt/qt5/qtwebkit-examples_git.bb            |  2 +-
 recipes-qt/qt5/qtwebkit_git.bb                     |  2 +-
 recipes-qt/qt5/qtwebsockets_git.bb                 |  4 +-
 recipes-qt/qt5/qtx11extras_git.bb                  |  2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |  2 +-
 46 files changed, 170 insertions(+), 170 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtbase-git/0001-Fix-missing-plugin_types.patch
 create mode 100644 recipes-qt/qt5/qtbase-git/0001-Revert-Use-the-gcc-feature-in-simd.prf.patch
 rename recipes-qt/qt5/qtbase-git/{0001-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch => 0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch} (89%)
 rename recipes-qt/qt5/qtbase-git/{0008-Always-build-uic.patch => 0006-Always-build-uic.patch} (87%)
 rename recipes-qt/qt5/qtbase-git/{0005-qmake-don-t-build-it-in-configure-but-allow-to-build.patch => 0006-qmake-don-t-build-it-in-configure-but-allow-to-build.patch} (82%)
 rename recipes-qt/qt5/qtbase-git/{0009-configure-preserve-built-qmake-and-swap-with-native-.patch => 0007-configure-preserve-built-qmake-and-swap-with-native-.patch} (71%)
 rename recipes-qt/qt5/qtbase-git/{0006-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch => 0007-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch} (94%)
 rename recipes-qt/qt5/qtbase-git/{0010-configure-bump-path-length-from-256-to-512-character.patch => 0008-configure-bump-path-length-from-256-to-512-character.patch} (77%)
 rename recipes-qt/qt5/qtbase-git/{0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch => 0008-qeglplatformintegration-Undefine-CursorShape-from-X..patch} (86%)

diff --git a/conf/distro/include/qt5-versions.inc b/conf/distro/include/qt5-versions.inc
index a2cc1fc..94b0462 100644
--- a/conf/distro/include/qt5-versions.inc
+++ b/conf/distro/include/qt5-versions.inc
@@ -1,7 +1,7 @@
 # Select which version you prefer by defining QT5_VERSION and including this file
-# possible values now "5.2.1", "5.2.1+git%"
+# possible values now "5.3.0", "5.3.0+git%"
 
-QT5_VERSION ?= "5.2.1"
+QT5_VERSION ?= "5.3.0"
 
 PREFERRED_VERSION_qtbase-native = "${QT5_VERSION}"
 PREFERRED_VERSION_qtbase = "${QT5_VERSION}"
@@ -24,4 +24,9 @@ PREFERRED_VERSION_qttools-native = "${QT5_VERSION}"
 PREFERRED_VERSION_nativesdk-qttools = "${QT5_VERSION}"
 PREFERRED_VERSION_qtwebkit = "${QT5_VERSION}"
 PREFERRED_VERSION_qtwebkit-examples = "${QT5_VERSION}"
+PREFERRED_VERSION_qtwebsockets = "${QT5_VERSION}"
 PREFERRED_VERSION_qtxmlpatterns = "${QT5_VERSION}"
+
+# qtenginio doesn't follow qt5 versioning, see https://bugreports.qt-project.org/browse/QTBUG-37791
+QT5_VERSION_QTENGINIO = "${@base_contains('QT5_VERSION', '5.3.0+git%', '${QT5_VERSION}', '1.0.4%', d)}"
+PREFERRED_VERSION_qtenginio = "${QT5_VERSION_QTENGINIO}"
diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index cac16a0..7c45693 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -14,19 +14,19 @@ SRC_URI += "\
     file://0002-Add-external-hostbindir-option.patch \
     file://0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
     file://0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch \
-    file://0001-Fix-missing-plugin_types.patch \
-    file://0001-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
+    file://0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
+    file://0001-Revert-Use-the-gcc-feature-in-simd.prf.patch \
 "
 
 # common with native version
 SRC_URI += " \
-    file://0008-Always-build-uic.patch \
+    file://0006-Always-build-uic.patch \
 "    
 
 # specific for nativesdk version
 SRC_URI += " \
-    file://0009-configure-preserve-built-qmake-and-swap-with-native-.patch \
-    file://0010-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0007-configure-preserve-built-qmake-and-swap-with-native-.patch \
+    file://0008-configure-bump-path-length-from-256-to-512-character.patch \
 "
 
-SRCREV = "207598fd8e69be34e8ba2c9db7720cb6003ea114"
+SRCREV = "267ba8b63e0fbf02cde4d2709397ed0e12f34ee2"
diff --git a/recipes-qt/qt5/nativesdk-qttools_git.bb b/recipes-qt/qt5/nativesdk-qttools_git.bb
index cbf1672..933119c 100644
--- a/recipes-qt/qt5/nativesdk-qttools_git.bb
+++ b/recipes-qt/qt5/nativesdk-qttools_git.bb
@@ -4,7 +4,7 @@ require ${PN}.inc
 # prepend this again, because ${PN}.inc prepneds ${PN}
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
 
-SRCREV = "e7b791c8bb5e64a4c786bf370b10366815af704f"
+SRCREV = "eaf069902111533f0e675ab32279bb57a5916169"
 
 # older copyright year than what e.g. qtbase is using now
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 0438dd9..2e32549 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -4,4 +4,4 @@ require ${PN}.inc
 QT_MODULE_BRANCH = "master"
 
 # last tag before this SRCREV is 5.0.0-beta1, but version says 5.3.0 already
-SRCREV = "36a829ad6fb44fd01f490c35e011f6fd2470ffdd"
+SRCREV = "bdb98baf8253c69949a8c259369203da9ffb269c"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index 25b7a62..3e714e0 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -10,7 +10,7 @@ SRC_URI += " \
 
 S = "${WORKDIR}/git"
 
-PV = "5.2.1+5.3.0-beta1+git${SRCPV}"
+PV = "5.3.0+git${SRCPV}"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
 
diff --git a/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
index 828f5ea..95841ce 100644
--- a/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
@@ -1,7 +1,7 @@
-From 237a4b0143d91c0573ecf6f9ff5e37827a14a75d Mon Sep 17 00:00:00 2001
+From e70bd40730582e5e5531fca51a1574cb306c40d3 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
-Subject: [PATCH 01/10] Add linux-oe-g++ platform
+Subject: [PATCH 1/8] Add linux-oe-g++ platform
 
 * This qmake.conf unlike other platforms reads most variables from
   shell environment, because it's easier for qt recipes to export
@@ -42,16 +42,16 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- configure                            |  60 +++++++++++++++------
+ configure                            |  66 ++++++++++++++++-------
  mkspecs/features/configure.prf       |   4 +-
  mkspecs/linux-oe-g++/qmake.conf      |  40 ++++++++++++++
  mkspecs/linux-oe-g++/qplatformdefs.h | 100 +++++++++++++++++++++++++++++++++++
- 4 files changed, 185 insertions(+), 19 deletions(-)
+ 4 files changed, 188 insertions(+), 22 deletions(-)
  create mode 100644 mkspecs/linux-oe-g++/qmake.conf
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
 diff --git a/configure b/configure
-index 55d68ef..bb24a9c 100755
+index d5c2b08..4eae0d3 100755
 --- a/configure
 +++ b/configure
 @@ -324,6 +324,16 @@ getQMakeConf()
@@ -118,7 +118,7 @@ index 55d68ef..bb24a9c 100755
  # Use CC/CXX to run config.tests
  mkdir -p "$outpath/config.tests"
  rm -f "$outpath/config.tests/.qmake.cache"
-@@ -3139,7 +3157,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
+@@ -3140,7 +3158,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
      [ "$CFG_QGTKSTYLE" = "auto" ] && CFG_QGTKSTYLE=no
  fi
  
@@ -127,7 +127,7 @@ index 55d68ef..bb24a9c 100755
  
  TEST_COMPILER=$QMAKE_CONF_COMPILER
  
-@@ -3174,7 +3192,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
+@@ -3175,7 +3193,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
          exit 1
      fi
  fi
@@ -136,7 +136,7 @@ index 55d68ef..bb24a9c 100755
  
  GCC_MACHINE_DUMP=
  case "$TEST_COMPILER" in *g++) GCC_MACHINE_DUMP=$($TEST_COMPILER -dumpmachine);; esac
-@@ -3632,6 +3650,14 @@ setBootstrapVariable()
+@@ -3633,6 +3651,14 @@ setBootstrapVariable()
      getQMakeConf "$1" | echo ${2-$1} = `if [ -n "$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
  }
  
@@ -151,20 +151,26 @@ index 55d68ef..bb24a9c 100755
  # build qmake
  if true; then ###[ '!' -f "$outpath/bin/qmake" ];
      echo "Creating qmake..."
-@@ -3670,11 +3696,11 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+@@ -3671,14 +3697,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
          fi
  
          [ "$CFG_SILENT" = "yes" ] && CC_TRANSFORM='s,^,\@,' || CC_TRANSFORM=
 -        setBootstrapVariable QMAKE_CC CC "$CC_TRANSFORM"
 -        setBootstrapVariable QMAKE_CXX CXX "$CC_TRANSFORM"
 -        setBootstrapVariable QMAKE_CFLAGS
+-        setBootstrapVariable QMAKE_CFLAGS_SPLIT_SECTIONS
 -        setBootstrapVariable QMAKE_CXXFLAGS
+-        setBootstrapVariable QMAKE_CXXFLAGS_SPLIT_SECTIONS
 -        setBootstrapVariable QMAKE_LFLAGS
+-        setBootstrapVariable QMAKE_LFLAGS_GCSECTIONS
 +        setBootstrapEvalVariable QMAKE_CC CC "$CC_TRANSFORM"
 +        setBootstrapEvalVariable QMAKE_CXX CXX "$CC_TRANSFORM"
 +        setBootstrapEvalVariable QMAKE_CFLAGS
++        setBootstrapEvalVariable QMAKE_CFLAGS_SPLIT_SECTIONS
 +        setBootstrapEvalVariable QMAKE_CXXFLAGS
++        setBootstrapEvalVariable QMAKE_CXXFLAGS_SPLIT_SECTIONS
 +        setBootstrapEvalVariable QMAKE_LFLAGS
++        setBootstrapEvalVariable QMAKE_LFLAGS_GCSECTIONS
  
          if [ "$CFG_RELEASE_QMAKE" = "yes" ]; then
              setBootstrapVariable QMAKE_CFLAGS_RELEASE
@@ -340,5 +346,5 @@ index 0000000..dd12003
 +
 +#endif // QPLATFORMDEFS_H
 -- 
-1.9.1
+2.0.0
 
diff --git a/recipes-qt/qt5/qtbase-git/0001-Fix-missing-plugin_types.patch b/recipes-qt/qt5/qtbase-git/0001-Fix-missing-plugin_types.patch
deleted file mode 100644
index 612cbdd..0000000
--- a/recipes-qt/qt5/qtbase-git/0001-Fix-missing-plugin_types.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From f0e01b788e86f24352ba14ad17c3f337f934467d Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Mon, 21 Apr 2014 15:09:23 +0200
-Subject: [PATCH] Fix missing plugin_types
-
-* bearer/generic was failing with:
-  Project ERROR: No module claims plugin type 'bearer'
-
-Change-Id: I90848856a8b0a4df52e599983cf7dde0bc0e6623
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- mkspecs/features/qt_module_pris.prf | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mkspecs/features/qt_module_pris.prf b/mkspecs/features/qt_module_pris.prf
-index f31bc38..415e780 100644
---- a/mkspecs/features/qt_module_pris.prf
-+++ b/mkspecs/features/qt_module_pris.prf
-@@ -177,7 +177,7 @@ MODULE_FWD_PRI = $$mod_work_pfx/qt_lib_$${MODULE_ID}.pri
-         include($$mod_work_pfx/qt_lib_$${pri}.pri)
-     for(mod, mods_to_load) {
-         for(var, $$list(VERSION MAJOR_VERSION MINOR_VERSION PATCH_VERSION \
--                        name depends module_config CONFIG DEFINES sources \
-+                        name depends module_config plugin_types CONFIG DEFINES sources \
-                         includes bins libs libexecs plugins imports qml \
-                         rpath_link \
-                 )):defined(QT.$${mod}.$$var, var):cache(QT.$${mod}.$$var, transient)
--- 
-1.9.1
-
diff --git a/recipes-qt/qt5/qtbase-git/0001-Revert-Use-the-gcc-feature-in-simd.prf.patch b/recipes-qt/qt5/qtbase-git/0001-Revert-Use-the-gcc-feature-in-simd.prf.patch
new file mode 100644
index 0000000..88f5c12
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-git/0001-Revert-Use-the-gcc-feature-in-simd.prf.patch
@@ -0,0 +1,29 @@
+From 9d33599f12787f85a19e8147604f919ac40c02c1 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 4 Jun 2014 15:26:11 +0200
+Subject: [PATCH] Revert "Use the "gcc" feature in simd.prf"
+
+It's causing linker issues, see my comment in:
+https://bugreports.qt-project.org/browse/QTBUG-38544
+
+This reverts commit 3b00cc480400d47c59c29d3507c7fcdc9be2a489.
+---
+ mkspecs/features/simd.prf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mkspecs/features/simd.prf b/mkspecs/features/simd.prf
+index 62a63f9..4f86f60 100644
+--- a/mkspecs/features/simd.prf
++++ b/mkspecs/features/simd.prf
+@@ -18,7 +18,7 @@ QT_CPU_FEATURES = $$eval(QT_CPU_FEATURES.$$QT_ARCH)
+ #
+ # Set up compilers for SIMD (SSE/AVX, NEON etc)
+ #
+-gcc {       # includes intel_icc and clang variants
++*-g++*|intel_icc|*-clang*|*-qcc* {
+     sse2 {
+         HEADERS += $$SSE2_HEADERS
+ 
+-- 
+2.0.0
+
diff --git a/recipes-qt/qt5/qtbase-git/0002-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase-git/0002-Add-external-hostbindir-option.patch
index 5f9fd90..81f1867 100644
--- a/recipes-qt/qt5/qtbase-git/0002-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase-git/0002-Add-external-hostbindir-option.patch
@@ -1,7 +1,7 @@
-From 00ad866f82f89ce938e9eaabfc50af3cde72ccfe Mon Sep 17 00:00:00 2001
+From eaa4a4c13e65e29e2214a01b69b77b9c6f2ada05 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH 02/10] Add -external-hostbindir option
+Subject: [PATCH 2/8] Add -external-hostbindir option
 
 * when cross-compiling it's sometimes useful to use existing tools from machine
   (or in OpenEmbedded built with separate native recipe) when building for target
@@ -24,7 +24,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 Signed-off-by: Simon Busch <morphis@gravedo.de>
 ---
  configure                                   | 15 +++++++++++++++
- mkspecs/features/qt_functions.prf           |  9 ++++++++-
+ mkspecs/features/qt_functions.prf           |  2 +-
  mkspecs/features/qt_tool.prf                |  3 +--
  qmake/property.cpp                          |  1 +
  qtbase.pro                                  | 12 +++++++++---
@@ -34,10 +34,10 @@ Signed-off-by: Simon Busch <morphis@gravedo.de>
  src/dbus/Qt5DBusConfigExtras.cmake.in       |  4 ++--
  src/widgets/Qt5WidgetsConfigExtras.cmake.in |  2 +-
  tools/configure/configureapp.cpp            |  8 ++++++++
- 11 files changed, 51 insertions(+), 13 deletions(-)
+ 11 files changed, 44 insertions(+), 13 deletions(-)
 
 diff --git a/configure b/configure
-index bb24a9c..bf7c11e 100755
+index 4eae0d3..48d5119 100755
 --- a/configure
 +++ b/configure
 @@ -777,6 +777,7 @@ QT_HOST_BINS=
@@ -48,7 +48,7 @@ index bb24a9c..bf7c11e 100755
  
  #flags for SQL drivers
  QT_CFLAGS_PSQL=
-@@ -898,6 +899,7 @@ while [ "$#" -gt 0 ]; do
+@@ -896,6 +897,7 @@ while [ "$#" -gt 0 ]; do
      -testsdir| \
      -hostdatadir| \
      -hostbindir| \
@@ -56,7 +56,7 @@ index bb24a9c..bf7c11e 100755
      -hostlibdir| \
      -extprefix| \
      -sysroot| \
-@@ -1112,6 +1114,9 @@ while [ "$#" -gt 0 ]; do
+@@ -1110,6 +1112,9 @@ while [ "$#" -gt 0 ]; do
      extprefix)
          QT_EXT_PREFIX="$VAL"
          ;;
@@ -66,7 +66,7 @@ index bb24a9c..bf7c11e 100755
      pkg-config)
          if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
              CFG_PKGCONFIG="$VAL"
-@@ -2250,6 +2255,10 @@ Installation options:
+@@ -2248,6 +2253,10 @@ Installation options:
      -hostdatadir <dir> . Data used by qmake will be installed to <dir>
                           (default HOSTPREFIX)
  
@@ -77,7 +77,7 @@ index bb24a9c..bf7c11e 100755
  Configure options:
  
   The defaults (*) are usually acceptable. A plus (+) denotes a default value
-@@ -2914,6 +2923,11 @@ fi
+@@ -2915,6 +2924,11 @@ fi
  # command line and environment validation
  #-------------------------------------------------------------------------------
  
@@ -89,7 +89,7 @@ index bb24a9c..bf7c11e 100755
  # update QT_CONFIG to show our current predefined configuration
  CFG_QCONFIG_PATH=$relpath/src/corelib/global/qconfig-${CFG_QCONFIG}.h
  case "$CFG_QCONFIG" in
-@@ -3594,6 +3608,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
+@@ -3595,6 +3609,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
      "qt_hbinpath=$QT_HOST_BINS",
      "qt_hlibpath=$QT_HOST_LIBS",
      "qt_hdatpath=$QT_HOST_DATA",
@@ -98,27 +98,20 @@ index bb24a9c..bf7c11e 100755
      "qt_hostspec=$shortspec",
  #endif
 diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
-index 1dacfed..7229845 100644
+index d41fe3b..050a4a7 100644
 --- a/mkspecs/features/qt_functions.prf
 +++ b/mkspecs/features/qt_functions.prf
-@@ -193,7 +193,14 @@ defineTest(qtAddRpathLink) {
+@@ -193,7 +193,7 @@ defineTest(qtAddRpathLink) {
  defineTest(qtPrepareTool) {
-     $$1 = $$eval(QT_TOOL.$${2}.binary)
-     isEmpty($$1) {
--        $$1 = $$[QT_HOST_BINS]/$$2
-+        $$1 = $$[QT_EXTERNAL_HOST_BINS]/$$2
-+        # for some reason isEmpty does not work here, FIXME before submitting upstream
-+        # DEBUG 1: mkspecs/features/qt_functions.prf:198: calling built-in isEmpty(/OE/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/qt5)
-+        # DEBUG 1: mkspecs/features/qt_functions.prf:198: test function returned true
-+        # DEBUG 1: mkspecs/features/qt_functions.prf:198: taking 'then' branch
-+        !exists($$[QT_EXTERNAL_HOST_BINS]/$$2) {
-+            $$1 = $$[QT_HOST_BINS]/$$2
-+        }
-         exists($$eval($$1).pl) {
-             $$1 = perl -w $$eval($$1).pl
+     cmd = $$eval(QT_TOOL.$${2}.binary)
+     isEmpty(cmd) {
+-        cmd = $$[QT_HOST_BINS]/$$2
++        cmd = $$[QT_EXTERNAL_HOST_BINS]/$$2
+         exists($${cmd}.pl) {
+             cmd = perl -w $$system_path($${cmd}.pl)
          } else: contains(QMAKE_HOST.os, Windows) {
 diff --git a/mkspecs/features/qt_tool.prf b/mkspecs/features/qt_tool.prf
-index f0864f9..50bfac8 100644
+index 1d3e88c..bd44754 100644
 --- a/mkspecs/features/qt_tool.prf
 +++ b/mkspecs/features/qt_tool.prf
 @@ -15,8 +15,7 @@ CONFIG += console
@@ -144,7 +137,7 @@ index e50485c..71291ad 100644
      { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
  };
 diff --git a/qtbase.pro b/qtbase.pro
-index ed6fc39..2421f41 100644
+index d6861cf..92e6a83 100644
 --- a/qtbase.pro
 +++ b/qtbase.pro
 @@ -71,16 +71,22 @@ CONFIG -= qt
@@ -273,7 +266,7 @@ index 99d87e2..5621dc0 100644
      _qt5_Widgets_check_file_exists(${imported_location})
  
 diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index cff3f1b..540708b 100644
+index b756509..7e61845 100644
 --- a/tools/configure/configureapp.cpp
 +++ b/tools/configure/configureapp.cpp
 @@ -1213,6 +1213,13 @@ void Configure::parseCmdLine()
@@ -290,7 +283,7 @@ index cff3f1b..540708b 100644
          else if (configCmdLine.at(i) == "-make-tool") {
              ++i;
              if (i == argCount)
-@@ -3986,6 +3993,7 @@ void Configure::generateQConfigCpp()
+@@ -3983,6 +3990,7 @@ void Configure::generateQConfigCpp()
                    << "    \"qt_hbinpath=" << formatPath(dictionary["QT_HOST_BINS"]) << "\"," << endl
                    << "    \"qt_hlibpath=" << formatPath(dictionary["QT_HOST_LIBS"]) << "\"," << endl
                    << "    \"qt_hdatpath=" << formatPath(dictionary["QT_HOST_DATA"]) << "\"," << endl
@@ -299,5 +292,5 @@ index cff3f1b..540708b 100644
                    << "    \"qt_hostspec=" << hostSpec << "\"," << endl
                    << "#endif" << endl
 -- 
-1.9.1
+2.0.0
 
diff --git a/recipes-qt/qt5/qtbase-git/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase-git/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index 95c67a8..4b4e47c 100644
--- a/recipes-qt/qt5/qtbase-git/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase-git/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,8 +1,8 @@
-From 53b152be24082a2cf2497d2e687f9ee73a39d6f4 Mon Sep 17 00:00:00 2001
+From b76b34a03c3051cda5330c8ae9f5e2a26c5c4da6 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
-Subject: [PATCH 03/10] qlibraryinfo: allow to set qt.conf from the outside
- using the environment
+Subject: [PATCH 3/8] qlibraryinfo: allow to set qt.conf from the outside using
+ the environment
 
 Allow to set a qt.conf from the outside using the environment. This allows
 to inject new prefixes and other paths into qmake. This is needed when using
@@ -35,5 +35,5 @@ index 3686b17..89e13cf 100644
      if(!QFile::exists(qtconfig))
          qtconfig = qt_libraryInfoFile();
 -- 
-1.9.1
+2.0.0
 
diff --git a/recipes-qt/qt5/qtbase-git/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch b/recipes-qt/qt5/qtbase-git/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
index c263d09..1e5ffac 100644
--- a/recipes-qt/qt5/qtbase-git/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
+++ b/recipes-qt/qt5/qtbase-git/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
@@ -1,7 +1,7 @@
-From a39f5e64b7b5a31e7e5cd988b5f967ce6cf02990 Mon Sep 17 00:00:00 2001
+From 83205b1344e57e2cb0292cf1d276e40c7f45ca32 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 22:33:33 +0200
-Subject: [PATCH 04/10] configureapp: Prefix default LIBDIRS and INCDIRS with
+Subject: [PATCH 4/8] configureapp: Prefix default LIBDIRS and INCDIRS with
  SYSROOT
 
 Upstream-Status: Pending
@@ -11,7 +11,7 @@ Upstream-Status: Pending
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index 540708b..45f4a1e 100644
+index 7e61845..29c6358 100644
 --- a/tools/configure/configureapp.cpp
 +++ b/tools/configure/configureapp.cpp
 @@ -3370,8 +3370,8 @@ void Configure::generateQConfigPri()
@@ -26,5 +26,5 @@ index 540708b..45f4a1e 100644
          configStream << "}" << endl;
          configStream << "QT_CONFIG += " << qtConfig.join(' ') << endl;
 -- 
-1.9.1
+2.0.0
 
diff --git a/recipes-qt/qt5/qtbase-git/0001-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch b/recipes-qt/qt5/qtbase-git/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
similarity index 89%
rename from recipes-qt/qt5/qtbase-git/0001-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
rename to recipes-qt/qt5/qtbase-git/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
index 65ebbd1..213a9c3 100644
--- a/recipes-qt/qt5/qtbase-git/0001-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
+++ b/recipes-qt/qt5/qtbase-git/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
@@ -1,7 +1,7 @@
-From 91b185d1f4843d22d42461c0aee4cd0f5393bbc8 Mon Sep 17 00:00:00 2001
+From 22775e5f0b1097964062fbcf1805a841f971de34 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 21 Apr 2014 19:22:04 +0200
-Subject: [PATCH] Revert "eglfs: Print the chosen config in debug mode"
+Subject: [PATCH 5/8] Revert "eglfs: Print the chosen config in debug mode"
 
 This reverts commit dc685cf6331f5fb46285cf10d6464c2ecf41f73e.
 ---
@@ -10,10 +10,10 @@ This reverts commit dc685cf6331f5fb46285cf10d6464c2ecf41f73e.
  2 files changed, 3 insertions(+), 8 deletions(-)
 
 diff --git a/src/platformsupport/eglconvenience/qeglconvenience.cpp b/src/platformsupport/eglconvenience/qeglconvenience.cpp
-index e6624fb..3870f6c 100644
+index 5eed470..39c7c1f 100644
 --- a/src/platformsupport/eglconvenience/qeglconvenience.cpp
 +++ b/src/platformsupport/eglconvenience/qeglconvenience.cpp
-@@ -437,9 +437,11 @@ void q_printEglConfig(EGLDisplay display, EGLConfig config)
+@@ -451,9 +451,11 @@ void q_printEglConfig(EGLDisplay display, EGLConfig config)
      for (index = 0; attrs[index].attr != -1; ++index) {
          EGLint value;
          if (eglGetConfigAttrib(display, config, attrs[index].attr, &value)) {
@@ -52,5 +52,5 @@ index eec6463..4a7c69b 100644
      // Make the context current to ensure the GL version query works. This needs a surface too.
      const EGLint pbufferAttributes[] = {
 -- 
-1.9.1
+2.0.0
 
diff --git a/recipes-qt/qt5/qtbase-git/0008-Always-build-uic.patch b/recipes-qt/qt5/qtbase-git/0006-Always-build-uic.patch
similarity index 87%
rename from recipes-qt/qt5/qtbase-git/0008-Always-build-uic.patch
rename to recipes-qt/qt5/qtbase-git/0006-Always-build-uic.patch
index fd45516..f425c3e 100644
--- a/recipes-qt/qt5/qtbase-git/0008-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase-git/0006-Always-build-uic.patch
@@ -1,7 +1,7 @@
-From 4d5502114a3135f2c78eb9e63476918cbee00040 Mon Sep 17 00:00:00 2001
+From dd679f743291a924bed500a866eb05fab71c9978 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
-Subject: [PATCH 08/10] Always build uic
+Subject: [PATCH 6/8] Always build uic
 
 Even if we are not building gui or widgets. This tool is needed later
 as a native tool when compiling the target.
@@ -27,5 +27,5 @@ index 6a805a6..90623a6 100644
  nacl: SUBDIRS -= src_network src_testlib
  
 -- 
-1.9.1
+2.0.0
 
diff --git a/recipes-qt/qt5/qtbase-git/0005-qmake-don-t-build-it-in-configure-but-allow-to-build.patch b/recipes-qt/qt5/qtbase-git/0006-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
similarity index 82%
rename from recipes-qt/qt5/qtbase-git/0005-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
rename to recipes-qt/qt5/qtbase-git/0006-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
index 395e84c..6d79acb 100644
--- a/recipes-qt/qt5/qtbase-git/0005-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
+++ b/recipes-qt/qt5/qtbase-git/0006-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
@@ -1,8 +1,8 @@
-From c0c4c468cc70a367e3bb2dd4a48c31e62b3b0fa4 Mon Sep 17 00:00:00 2001
+From d8e725cb2c25a443d888fe2652f9039e79ae75ac Mon Sep 17 00:00:00 2001
 From: Michael Krelin <hacker@klever.net>
 Date: Mon, 29 Oct 2012 20:07:49 -0700
-Subject: [PATCH 05/10] qmake: don't build it in configure, but allow to build
- it separately
+Subject: [PATCH 6/8] qmake: don't build it in configure, but allow to build it
+ separately
 
 * it is already built in qtbase-native, so we don't need it in configure
 * allow building a separate qmake for the target
@@ -20,10 +20,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  2 files changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index bf7c11e..5e93ce4 100755
+index 48d5119..2a42c08 100755
 --- a/configure
 +++ b/configure
-@@ -3674,7 +3674,7 @@ setBootstrapEvalVariable()
+@@ -3675,7 +3675,7 @@ setBootstrapEvalVariable()
  
  
  # build qmake
@@ -46,5 +46,5 @@ index 89d6ea5..7c605b9 100644
  VPATH += \
      ../src/corelib/global \
 -- 
-1.9.1
+2.0.0
 
diff --git a/recipes-qt/qt5/qtbase-git/0009-configure-preserve-built-qmake-and-swap-with-native-.patch b/recipes-qt/qt5/qtbase-git/0007-configure-preserve-built-qmake-and-swap-with-native-.patch
similarity index 71%
rename from recipes-qt/qt5/qtbase-git/0009-configure-preserve-built-qmake-and-swap-with-native-.patch
rename to recipes-qt/qt5/qtbase-git/0007-configure-preserve-built-qmake-and-swap-with-native-.patch
index ddd7116..79ac5e8 100644
--- a/recipes-qt/qt5/qtbase-git/0009-configure-preserve-built-qmake-and-swap-with-native-.patch
+++ b/recipes-qt/qt5/qtbase-git/0007-configure-preserve-built-qmake-and-swap-with-native-.patch
@@ -1,8 +1,7 @@
-From 7117e71f5e1aac3ac6e5e87852c108bbc13dc364 Mon Sep 17 00:00:00 2001
+From 3db5991e607a82403272b0ea821fc84e3c8b6d2a Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:22:34 -0500
-Subject: [PATCH 09/10] configure: preserve built qmake and swap with native
- one
+Subject: [PATCH 7/8] configure: preserve built qmake and swap with native one
 
 Let configure script build the real qmake, but right after it's built, swap
 it with a native qmake for further internal use, preserving the real one.
@@ -13,10 +12,10 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/configure b/configure
-index 5e93ce4..01fca8f 100755
+index 48d5119..b7aac15 100755
 --- a/configure
 +++ b/configure
-@@ -3821,6 +3821,8 @@ if false; then ###[ '!' -f "$outpath/bin/qmake" ];
+@@ -3825,6 +3825,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
  
      (cd "$outpath/qmake"; "$MAKE") || exit 2
  fi # Build qmake
@@ -26,5 +25,5 @@ index 5e93ce4..01fca8f 100755
  echo "Running configuration tests..."
  
 -- 
-1.9.1
+2.0.0
 
diff --git a/recipes-qt/qt5/qtbase-git/0006-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch b/recipes-qt/qt5/qtbase-git/0007-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
similarity index 94%
rename from recipes-qt/qt5/qtbase-git/0006-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
rename to recipes-qt/qt5/qtbase-git/0007-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
index 21821c3..f8a789c 100644
--- a/recipes-qt/qt5/qtbase-git/0006-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
+++ b/recipes-qt/qt5/qtbase-git/0007-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
@@ -1,7 +1,7 @@
-From 2cb0f75bb9ab1e6709fe867887f9e6014a140356 Mon Sep 17 00:00:00 2001
+From cc8bd33740ee16b29e0801dbc2228314ef3cef2f Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 5 Feb 2014 18:35:08 +0100
-Subject: [PATCH 06/10] eglfs: fix egl error for platforms only supporting one
+Subject: [PATCH 7/8] eglfs: fix egl error for platforms only supporting one
  window/surface
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
@@ -68,5 +68,5 @@ index 2d36c0b..854531e 100644
  
      if (isRaster()) {
 -- 
-1.9.1
+2.0.0
 
diff --git a/recipes-qt/qt5/qtbase-git/0010-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase-git/0008-configure-bump-path-length-from-256-to-512-character.patch
similarity index 77%
rename from recipes-qt/qt5/qtbase-git/0010-configure-bump-path-length-from-256-to-512-character.patch
rename to recipes-qt/qt5/qtbase-git/0008-configure-bump-path-length-from-256-to-512-character.patch
index 02eef9b..e5a3890 100644
--- a/recipes-qt/qt5/qtbase-git/0010-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase-git/0008-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,7 +1,7 @@
-From 6afe8d5d1daf94ac64478406b5b84b6879981446 Mon Sep 17 00:00:00 2001
+From 3eabdee39cad37a4ce451486fce20680f169a0f1 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:27:30 -0500
-Subject: [PATCH 10/10] configure: bump path length from 256 to 512 characters
+Subject: [PATCH 8/8] configure: bump path length from 256 to 512 characters
 
 Increase the path length that gets hardcoded into generated config.cpp file
 from 256 to 512 characters, as nativesdk path can be quite long.
@@ -12,10 +12,10 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 01fca8f..801c7c1 100755
+index b7aac15..c51f785 100755
 --- a/configure
 +++ b/configure
-@@ -3572,7 +3572,7 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
+@@ -3573,7 +3573,7 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
  static const char qt_configure_installation          [12+11]    = "qt_instdate=`date +%Y-%m-%d`";
  
  /* Installation Info */
@@ -25,5 +25,5 @@ index 01fca8f..801c7c1 100755
      "qt_prfxpath=$QT_SYSROOT_PREFIX",
      "qt_docspath=$QT_SYSROOT_DOCS",
 -- 
-1.9.1
+2.0.0
 
diff --git a/recipes-qt/qt5/qtbase-git/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch b/recipes-qt/qt5/qtbase-git/0008-qeglplatformintegration-Undefine-CursorShape-from-X..patch
similarity index 86%
rename from recipes-qt/qt5/qtbase-git/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
rename to recipes-qt/qt5/qtbase-git/0008-qeglplatformintegration-Undefine-CursorShape-from-X..patch
index 24ae7ea..2f4d80c 100644
--- a/recipes-qt/qt5/qtbase-git/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
+++ b/recipes-qt/qt5/qtbase-git/0008-qeglplatformintegration-Undefine-CursorShape-from-X..patch
@@ -1,7 +1,7 @@
-From 0923f72a444bcdc0675a24aec9782692b41d301c Mon Sep 17 00:00:00 2001
+From 959b2fb8d8eb5e755e3d9d3d3031b996f96fb23b Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 19 Mar 2014 18:32:28 +0100
-Subject: [PATCH 07/10] qeglplatformintegration: Undefine CursorShape from X.h
+Subject: [PATCH 8/8] qeglplatformintegration: Undefine CursorShape from X.h
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
@@ -26,5 +26,5 @@ index f665455..9eb783c 100644
  
  class QEGLPlatformScreen;
 -- 
-1.9.1
+2.0.0
 
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index bafe37b..e10748f 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -11,13 +11,13 @@ SRC_URI += "\
     file://0002-Add-external-hostbindir-option.patch \
     file://0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
     file://0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch \
-    file://0001-Fix-missing-plugin_types.patch \
-    file://0001-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
+    file://0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
+    file://0001-Revert-Use-the-gcc-feature-in-simd.prf.patch \
 "
 
 # specific for native version
 SRC_URI += " \
-    file://0008-Always-build-uic.patch \
+    file://0006-Always-build-uic.patch \
 "
 
 do_install_append() {
@@ -26,4 +26,4 @@ do_install_append() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "207598fd8e69be34e8ba2c9db7720cb6003ea114"
+SRCREV = "267ba8b63e0fbf02cde4d2709397ed0e12f34ee2"
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 9bcfa79..4f019be 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -11,15 +11,15 @@ SRC_URI += "\
     file://0002-Add-external-hostbindir-option.patch \
     file://0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
     file://0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch \
-    file://0001-Fix-missing-plugin_types.patch \
-    file://0001-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
+    file://0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
+    file://0001-Revert-Use-the-gcc-feature-in-simd.prf.patch \
 "
 
 # target specific
 SRC_URI += "\
-    file://0005-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
-    file://0006-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
-    file://0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
+    file://0006-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
+    file://0007-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
+    file://0008-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
 "
 
-SRCREV = "207598fd8e69be34e8ba2c9db7720cb6003ea114"
+SRCREV = "267ba8b63e0fbf02cde4d2709397ed0e12f34ee2"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index c0fd15d..52f2a2d 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${BPN}.inc
 
-SRCREV = "6d9ab3981a1ae9e224b3c6a8cf107049a0ee5095"
+SRCREV = "19f10aae3d333ef6486ea1390998f0674fd4d89e"
diff --git a/recipes-qt/qt5/qtdeclarative.inc b/recipes-qt/qt5/qtdeclarative.inc
index bdb1de9..ddc44c9 100644
--- a/recipes-qt/qt5/qtdeclarative.inc
+++ b/recipes-qt/qt5/qtdeclarative.inc
@@ -2,7 +2,6 @@ require qt5.inc
 
 SRC_URI += " \
     file://0001-qmltestexample-fix-link.patch \
-    file://0002-Fix-improper-antialiasing-property-behavior.patch \
 "
 
 # older copyright year than what e.g. qtbase is using now
diff --git a/recipes-qt/qt5/qtdeclarative_5.3.0.bb b/recipes-qt/qt5/qtdeclarative_5.3.0.bb
index 6725b57..7bd6bb4 100644
--- a/recipes-qt/qt5/qtdeclarative_5.3.0.bb
+++ b/recipes-qt/qt5/qtdeclarative_5.3.0.bb
@@ -1,5 +1,9 @@
 require qt5-${PV}.inc
 require ${PN}.inc
 
+SRC_URI += " \
+    file://0002-Fix-improper-antialiasing-property-behavior.patch \
+"
+
 SRC_URI[md5sum] = "9e29d2b481c771ce5c798a3319835673"
 SRC_URI[sha256sum] = "fab07eb4f4b2091e1d88b27b84ac49d7e8daaa1eb72fd62e602ee9ac3ed7f42f"
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 2d733a3..318ba44 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "aedcd57c84ac9d6b74816c13bdf3fde31e1132b5"
+SRCREV = "67a101af142355a0ca7cdc234b7ee1716a25d87c"
 
 # older copyright year than what e.g. qtbase is using now
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index 3960bd2..b7f2f79 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -1,6 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-QT_MODULE_BRANCH = "release"
-# v1.0.4
-SRCREV = "bb55ab0eed452704e4ce52faf8e5337674c3b668"
+SRCREV = "07885f25ed57b98a695f28337fc4b91e611991aa"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index 9347e7b..a1e9009 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "9b1883d2e90dd6ef92374d21e490a3de1c8330ba"
+SRCREV = "82abf6975b6737259ee656564e5ec7f8ad1d0508"
 
 # older copyright year than what e.g. qtbase is using now
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index b413a5f..3e04c40 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "554d617762c86964dfa074074304993ccdfbe2c9"
+SRCREV = "bcc7909dfe9d89f793919bc96abdfd6b704c4c0e"
 
 # older copyright year than what e.g. qtbase is using now
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index bab8275..fcb6993 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "27c9ffe1d2eb2103e9b420c86c6fc3d10cb1ff76"
+SRCREV = "749cdff5289412780f0bb8e351cb140ba64d85ce"
 
 # older copyright year than what e.g. qtbase is using now
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 88ca59e..f0ce24e 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "b088962950dbc4c6f0219de30b0d9a8cf47a3376"
+SRCREV = "7e668fe58fc9546eb91bbf39992566f709b5e6c2"
 
 # older copyright year than what e.g. qtbase is using now
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index 7c64460..3400f47 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "c56f5d8848ce03cc6667804f815de47d2d8221fb"
+SRCREV = "26e713cddcc8a62e49ce7a3352d3b5f13ffd7d52"
 
 # older copyright year than what e.g. qtbase is using now
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index fd525f1..bab6854 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "ea9add905768a26ce86ab542615a193296642732"
+SRCREV = "82a0a8244a2edf27c196f6c8cc3e2c36a3f4a8c5"
 
 # older copyright year than what e.g. qtbase is using now
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 2deaaff..6d8fd31 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "e4453c92ee41943a3a1d67a725804a44e747f64e"
+SRCREV = "161e1fd31537f41992b3024c32b525b64be080ed"
 
 # older copyright year than what e.g. qtbase is using now
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 6e3bda6..c2ab063 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "eee2eee734b4aa735d35f6c53d79c06c1c76425a"
+SRCREV = "9efc5bea41e7acbce55c37b49b167092b71114a9"
 
 # older copyright year than what e.g. qtbase is using now
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index 4619227..0755f45 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "6e75610dff5fb96ebd72cfb40ba7cbfea4bd21b7"
+SRCREV = "04a3308346190a70509a759423993f6bcc365328"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 0aa79e1..6fc617d 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "ad81f5720c4f4a1dac099cbe2f9d47ed3a9025b0"
+SRCREV = "35a2f0880831d38c60d2b4820dac808f48f6f3a8"
 
 # older copyright year than what e.g. qtbase is using now
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
diff --git a/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
index 575616b..9a31c13 100644
--- a/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
+++ b/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
@@ -1,4 +1,4 @@
-From 90a2e92062fc67fa54be0f5596606ce2bc21f772 Mon Sep 17 00:00:00 2001
+From 50fdb63c074138f783a448bc2db97b6f0ccfefea Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.jansa@gmail.com>
 Date: Wed, 11 Sep 2013 18:30:08 +0200
 Subject: [PATCH 1/2] Allow to build only lrelease + lupdate + lconvert
@@ -74,7 +74,7 @@ index 3a70580..a977878 100644
  qtNomakeTools( \
      linguist \
 diff --git a/src/src.pro b/src/src.pro
-index 861d06d..3438f9a 100644
+index a486d65..393eac2 100644
 --- a/src/src.pro
 +++ b/src/src.pro
 @@ -4,10 +4,12 @@ qtHaveModule(widgets) {
@@ -97,12 +97,12 @@ index 861d06d..3438f9a 100644
  }
  
  SUBDIRS += linguist
--!android|android_app: SUBDIRS += qtpaths
-+!linguistonly:!android|android_app: SUBDIRS += qtpaths
+-if(!android|android_app):!ios: SUBDIRS += qtpaths
++if(!android|android_app):!linguistonly:!ios: SUBDIRS += qtpaths
  
  mac {
      SUBDIRS += macdeployqt
-@@ -25,7 +27,7 @@ android {
+@@ -25,11 +27,11 @@ android {
      SUBDIRS += androiddeployqt
  }
  
@@ -111,12 +111,11 @@ index 861d06d..3438f9a 100644
  
  win32|winrt:SUBDIRS += windeployqt
  winrt:SUBDIRS += winrtrunner qtd3dservice
-@@ -36,4 +38,4 @@ qtNomakeTools( \
-     macdeployqt \
- )
+-qtHaveModule(gui):!android:!ios:!qnx:!wince*:!winrt*:SUBDIRS += qtdiag
++!linguistonly:qtHaveModule(gui):!android:!ios:!qnx:!wince*:!winrt*:SUBDIRS += qtdiag
  
--!android:!ios:!qnx:!wince*:!winrt*:SUBDIRS += qtdiag
-+!linguistonly:!android:!ios:!qnx:!wince*:!winrt*:SUBDIRS += qtdiag
+ qtNomakeTools( \
+     pixeltool \
 diff --git a/tests/auto/auto.pro b/tests/auto/auto.pro
 index c3acfe3..b48e711 100644
 --- a/tests/auto/auto.pro
@@ -151,5 +150,5 @@ index c3acfe3..b48e711 100644
  installed_cmake.depends = cmake
  
 -- 
-1.9.1
+2.0.0
 
diff --git a/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch b/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch
index 1c40471..eaf4694 100644
--- a/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch
+++ b/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch
@@ -1,4 +1,4 @@
-From 509541ebd648414ee33f3aea3035d1e6382bfa3c Mon Sep 17 00:00:00 2001
+From f375385c4795e3cd7df7aca2a4c769597164aaa8 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 17 Jan 2014 14:33:19 +0100
 Subject: [PATCH 2/2] assistant/help: fix linking of dependent libraries
@@ -28,5 +28,5 @@ index 168d23d..a9c3b59 100644
 +
 +LIBS += -lQt5CLucene
 -- 
-1.9.1
+2.0.0
 
diff --git a/recipes-qt/qt5/qttools-native_git.bb b/recipes-qt/qt5/qttools-native_git.bb
index 49a1907..b37e0ed 100644
--- a/recipes-qt/qt5/qttools-native_git.bb
+++ b/recipes-qt/qt5/qttools-native_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "e7b791c8bb5e64a4c786bf370b10366815af704f"
+SRCREV = "eaf069902111533f0e675ab32279bb57a5916169"
 
 # older copyright year than what e.g. qtbase is using now
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 49a1907..b37e0ed 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "e7b791c8bb5e64a4c786bf370b10366815af704f"
+SRCREV = "eaf069902111533f0e675ab32279bb57a5916169"
 
 # older copyright year than what e.g. qtbase is using now
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index 9fac8b2..9089f0f 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -4,7 +4,7 @@ require ${PN}.inc
 # qtwayland wasn't released yet, last tag before this SRCREV is 5.0.0-beta1
 # qt5-git PV is only to indicate that this recipe is compatible with qt5 5.2.1
 
-SRCREV = "a237778666666ab77c4e8e6b501cf0fbe7c9223e"
+SRCREV = "98dca3b54f52f08117c1e0d3a1b4826ed12ef23f"
 
 # wayland-scanner and qtwaylandscanner must be in same path to work properly
 do_install_append() {
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 3f18272..ca068da 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -4,7 +4,7 @@ require ${PN}.inc
 # qtwayland wasn't released yet, last tag before this SRCREV is 5.0.0-beta1
 # qt5-git PV is only to indicate that this recipe is compatible with qt5 5.2.1
 
-SRCREV = "f9ebbd6c618488f9b671f5504528ced3350754fb"
+SRCREV = "98dca3b54f52f08117c1e0d3a1b4826ed12ef23f"
 
 SRC_URI += " \
     file://0001-examples.pro-include-server-buffer-only-when-buildin.patch \
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index 98fdc2f..f0ceb5d 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "c9d13139b65818785f218cc96d136d33591ca2f5"
+SRCREV = "bce5056b9e16a943357e362455a46685d3f22093"
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index ec8b4f3..829dc77 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "0546c8656a3728bf4375da39027e096beba4f111"
+SRCREV = "a7ef31b64324fa43623e768a0798175884bd6e79"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 3528ae7..ff13986 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -1,6 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-QT_MODULE_BRANCH = "release"
-# v5.3.0
-SRCREV = "c6dfdcdacfdd8c8190301b930caf67ad50ac09bb"
+SRCREV = "eb16b1970293dfeb5918751afbdf1fb7f62028e1"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index 954545f..fdb8094 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "947361a7dc8db093d0b8e1ec5ac953470a180259"
+SRCREV = "2d84caf5ef1b5dace0d678df4581db3c955be6ee"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index b86a749..fb1846c 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "d25091bb8b52455e415f8147a9100094c489a041"
+SRCREV = "e13d30be68228ccda3b6310ac44a84981b17f03b"
 
 # older copyright year than what e.g. qtbase is using now
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-- 
2.0.0


