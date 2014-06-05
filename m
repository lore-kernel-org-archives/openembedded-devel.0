Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 215E360030
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jun 2014 22:08:55 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id bs8so4336486wib.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jun 2014 15:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=/o8QPihpNafyK2sBtxMe2ZodpgpNB5w0xLvbw8twhW0=;
	b=FA4aA0praoAJXC+PQG8ri40dHxrj5WmtgiYedO619KA4cRjYrYSwk562Sa+hb34EWP
	pGU79ml5rJRwr0kQc/AatcQy/WChMp2abRlM66IM2hC4EsYVG639mHgESK1uHvBWMSBs
	/yZ83ir3bE1xMHSy9XVLtaSBEytzDEQL13AhWM5SbJt5nmIS+warb1eTsnKcQCZbbdmE
	hOugdAM/Fsbr42s3NLzvfuK/ldJqERBau/iSodGIHqo1iAmVsNfQsbteM+5mEuF4F/bB
	tqnHCjY9ewOFPKlMJaTmJWWQjBkIjNwytoJg0yyjAFHe1sG5JqNgXmTX9jpKLSIoTmzY
	EAhg==
X-Received: by 10.14.246.68 with SMTP id p44mr485584eer.8.1402006136514;
	Thu, 05 Jun 2014 15:08:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	j8sm17721110eey.12.2014.06.05.15.08.55 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jun 2014 15:08:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Jun 2014 00:08:57 +0200
Message-Id: <1402006139-27614-8-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1402006139-27614-1-git-send-email-Martin.Jansa@gmail.com>
References: <1401875817-30867-1-git-send-email-Martin.Jansa@gmail.com>
	<1402006139-27614-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCHv2 08/10] qtbase: Refresh patches to match with b5.3.0* branches on github.com/meta-qt5
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
X-List-Received-Date: Thu, 05 Jun 2014 22:08:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* move more patches to "shared" section

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase.inc                | 13 ++++---
 recipes-qt/qt5/qtbase-native.inc                   | 15 ++++----
 recipes-qt/qt5/qtbase.inc                          | 17 ++++-----
 .../qt5/qtbase/0001-Add-linux-oe-g-platform.patch  | 18 +++++-----
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch | 10 +++---
 .../0003-Add-external-hostbindir-option.patch      | 40 +++++++++++-----------
 ...p-Prefix-default-LIBDIRS-and-INCDIRS-with.patch | 12 +++----
 .../0005-qt_module-Fix-pkgconfig-replacement.patch |  6 ++--
 ...on-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch |  8 ++---
 ....prf-Allow-to-add-extra-arguments-to-make.patch | 12 +++----
 ...ake-pulseaudio-alsa-freetype-a-configurab.patch | 10 +++---
 ...E_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch |  8 ++---
 ...s.patch => 0010-Fix-missing-plugin_types.patch} |  6 ++--
 ...fs-Print-the-chosen-config-in-debug-mode.patch} |  8 ++---
 ...integration-Undefine-CursorShape-from-X..patch} |  4 +--
 ...mp-path-length-from-256-to-512-character.patch} | 10 +++---
 ...0014-QOpenGLPaintDevice-sub-area-support.patch} |  6 ++--
 ...l-error-for-platforms-only-supporting-on.patch} | 20 +++++------
 ...build-uic.patch => 0016-Always-build-uic.patch} |  6 ++--
 ...-qmake-is-already-built-in-qtbase-native.patch} | 10 +++---
 ...building-a-separate-qmake-for-the-target.patch} |  6 ++--
 ...eserve-built-qmake-and-swap-with-native-.patch} | 10 +++---
 22 files changed, 131 insertions(+), 124 deletions(-)
 rename recipes-qt/qt5/qtbase/{0015-Fix-missing-plugin_types.patch => 0010-Fix-missing-plugin_types.patch} (90%)
 rename recipes-qt/qt5/qtbase/{0016-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch => 0011-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch} (91%)
 rename recipes-qt/qt5/qtbase/{0008-qeglplatformintegration-Undefine-CursorShape-from-X..patch => 0012-qeglplatformintegration-Undefine-CursorShape-from-X..patch} (87%)
 rename recipes-qt/qt5/qtbase/{0012-configure-bump-path-length-from-256-to-512-character.patch => 0013-configure-bump-path-length-from-256-to-512-character.patch} (78%)
 rename recipes-qt/qt5/qtbase/{0013-QOpenGLPaintDevice-sub-area-support.patch => 0014-QOpenGLPaintDevice-sub-area-support.patch} (97%)
 rename recipes-qt/qt5/qtbase/{0014-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch => 0015-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch} (81%)
 rename recipes-qt/qt5/qtbase/{0010-Always-build-uic.patch => 0016-Always-build-uic.patch} (87%)
 rename recipes-qt/qt5/qtbase/{0010-qmake-is-already-built-in-qtbase-native.patch => 0016-qmake-is-already-built-in-qtbase-native.patch} (74%)
 rename recipes-qt/qt5/qtbase/{0011-Allow-building-a-separate-qmake-for-the-target.patch => 0017-Allow-building-a-separate-qmake-for-the-target.patch} (83%)
 rename recipes-qt/qt5/qtbase/{0011-configure-preserve-built-qmake-and-swap-with-native-.patch => 0017-configure-preserve-built-qmake-and-swap-with-native-.patch} (73%)

diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
index 62e841c..5424ce9 100644
--- a/recipes-qt/qt5/nativesdk-qtbase.inc
+++ b/recipes-qt/qt5/nativesdk-qtbase.inc
@@ -23,19 +23,22 @@ SRC_URI += "\
     file://0007-configure.prf-Allow-to-add-extra-arguments-to-make.patch \
     file://0008-configure-make-pulseaudio-alsa-freetype-a-configurab.patch \
     file://0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch \
-    file://0015-Fix-missing-plugin_types.patch \
-    file://0016-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
+    file://0010-Fix-missing-plugin_types.patch \
+    file://0011-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
+    file://0012-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
+    file://0013-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0014-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0015-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
 "
 
 # common with -native
 SRC_URI += " \
-    file://0010-Always-build-uic.patch \
+    file://0016-Always-build-uic.patch \
 "
 
 # specific for nativesdk version
 SRC_URI += " \
-    file://0011-configure-preserve-built-qmake-and-swap-with-native-.patch \
-    file://0012-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0017-configure-preserve-built-qmake-and-swap-with-native-.patch \
 "
 
 PACKAGES = "${PN}-tools-dbg ${PN}-tools-dev ${PN}-tools-staticdev ${PN}-tools"
diff --git a/recipes-qt/qt5/qtbase-native.inc b/recipes-qt/qt5/qtbase-native.inc
index dc04987..fae7888 100644
--- a/recipes-qt/qt5/qtbase-native.inc
+++ b/recipes-qt/qt5/qtbase-native.inc
@@ -7,8 +7,7 @@ QT_MODULE = "qtbase"
 
 require qt5-native.inc
 
-# common with target version
-# common with -native and target version
+# common with nativesdk- and target version
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
@@ -19,13 +18,17 @@ SRC_URI += "\
     file://0007-configure.prf-Allow-to-add-extra-arguments-to-make.patch \
     file://0008-configure-make-pulseaudio-alsa-freetype-a-configurab.patch \
     file://0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch \
-    file://0015-Fix-missing-plugin_types.patch \
-    file://0016-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
+    file://0010-Fix-missing-plugin_types.patch \
+    file://0011-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
+    file://0012-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
+    file://0013-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0014-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0015-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
 "
 
-# specific for native version
+# common with nativesdk- version
 SRC_URI += " \
-    file://0010-Always-build-uic.patch \
+    file://0016-Always-build-uic.patch \
 "
 
 QT_CONF_PATH = "${B}/qt.conf"
diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 726576c..c4d1b84 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -1,6 +1,6 @@
 require qt5.inc
 
-# common with -native
+# common with qtbase-native and nativesdk-qtbase
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
@@ -11,16 +11,17 @@ SRC_URI += "\
     file://0007-configure.prf-Allow-to-add-extra-arguments-to-make.patch \
     file://0008-configure-make-pulseaudio-alsa-freetype-a-configurab.patch \
     file://0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch \
-    file://0015-Fix-missing-plugin_types.patch \
-    file://0016-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
+    file://0010-Fix-missing-plugin_types.patch \
+    file://0011-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
+    file://0012-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
+    file://0013-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0014-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0015-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
 "
 
 SRC_URI += "\
-    file://0010-qmake-is-already-built-in-qtbase-native.patch \
-    file://0011-Allow-building-a-separate-qmake-for-the-target.patch \
-    file://0013-QOpenGLPaintDevice-sub-area-support.patch \
-    file://0014-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
-    file://0008-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
+    file://0016-qmake-is-already-built-in-qtbase-native.patch \
+    file://0017-Allow-building-a-separate-qmake-for-the-target.patch \
 "
 
 DEPENDS += "qtbase-native"
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index 5ce4cdd..cddd621 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -1,7 +1,7 @@
-From f883ec8652ee603d9bb9def7eb669ed82c493961 Mon Sep 17 00:00:00 2001
+From 2c2e479049c49539049db7e53d500e673285025f Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
-Subject: [PATCH 01/14] Add linux-oe-g++ platform
+Subject: [PATCH 01/17] Add linux-oe-g++ platform
 
 * This qmake.conf unlike other platforms reads most variables from
   shell environment, because it's easier for qt recipes to export
@@ -41,7 +41,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
 diff --git a/configure b/configure
-index aaa59bd..0e74f29 100755
+index 601d84a..eaa4092 100755
 --- a/configure
 +++ b/configure
 @@ -324,6 +324,16 @@ getQMakeConf()
@@ -97,8 +97,8 @@ index aaa59bd..0e74f29 100755
  SYSTEM_VARIABLES="RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS LDFLAGS"
  for varname in $SYSTEM_VARIABLES; do
      qmakevarname="${varname}"
-@@ -3362,7 +3394,7 @@ if [ "$XPLATFORM_MAC" = "yes" ] && [ "$CFG_QGTKSTYLE" = "auto" ]; then
-     CFG_QGTKSTYLE=no
+@@ -3117,7 +3149,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
+     [ "$CFG_QGTKSTYLE" = "auto" ] && CFG_QGTKSTYLE=no
  fi
  
 -QMAKE_CONF_COMPILER=`getXQMakeConf QMAKE_CXX`
@@ -106,7 +106,7 @@ index aaa59bd..0e74f29 100755
  
  TEST_COMPILER=$QMAKE_CONF_COMPILER
  
-@@ -3397,7 +3429,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
+@@ -3152,7 +3184,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
          exit 1
      fi
  fi
@@ -115,7 +115,7 @@ index aaa59bd..0e74f29 100755
  
  GCC_MACHINE_DUMP=
  case "$TEST_COMPILER" in *g++) GCC_MACHINE_DUMP=$($TEST_COMPILER -dumpmachine);; esac
-@@ -3878,6 +3910,14 @@ setBootstrapVariable()
+@@ -3617,6 +3649,14 @@ setBootstrapVariable()
      getQMakeConf "$1" | echo ${2-$1} = `if [ -n "$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
  }
  
@@ -130,7 +130,7 @@ index aaa59bd..0e74f29 100755
  # build qmake
  if true; then ###[ '!' -f "$outpath/bin/qmake" ];
      echo "Creating qmake..."
-@@ -3916,11 +3956,11 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+@@ -3655,11 +3695,11 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
          fi
  
          [ "$CFG_SILENT" = "yes" ] && CC_TRANSFORM='s,^,\@,' || CC_TRANSFORM=
@@ -300,5 +300,5 @@ index 0000000..dd12003
 +
 +#endif // QPLATFORMDEFS_H
 -- 
-1.8.5.3
+2.0.0
 
diff --git a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index 2f72dca..14f0fc7 100644
--- a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,7 +1,7 @@
-From 841d1f06f3fd2f59f6b18067b02d5fcfc93aaa7a Mon Sep 17 00:00:00 2001
+From c45a30d1301f85e49eef66c06cccf2a16741a932 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
-Subject: [PATCH 02/14] qlibraryinfo: allow to set qt.conf from the outside
+Subject: [PATCH 02/17] qlibraryinfo: allow to set qt.conf from the outside
  using the environment
 
 Allow to set a qt.conf from the outside using the environment. This allows
@@ -16,10 +16,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 1c3b09f..c647a16 100644
+index 6d25325..80e0f30 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -149,7 +149,10 @@ QLibrarySettings::QLibrarySettings()
+@@ -153,7 +153,10 @@ QLibrarySettings::QLibrarySettings()
  
  QSettings *QLibraryInfoPrivate::findConfiguration()
  {
@@ -32,5 +32,5 @@ index 1c3b09f..c647a16 100644
      if(!QFile::exists(qtconfig))
          qtconfig = qt_libraryInfoFile();
 -- 
-1.8.5.3
+2.0.0
 
diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
index 7e03f74..f8253ec 100644
--- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
@@ -1,7 +1,7 @@
-From 3648eeddaed0cf31fba226ec713d2321f398974f Mon Sep 17 00:00:00 2001
+From 5c2a17167e89f8f6cf26cbc289e57fa466678d2d Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH 03/14] Add -external-hostbindir option
+Subject: [PATCH 03/17] Add -external-hostbindir option
 
 * when cross-compiling it's sometimes useful to use existing tools from machine
   (or in OpenEmbedded built with separate native recipe) when building for target
@@ -28,10 +28,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  8 files changed, 45 insertions(+), 7 deletions(-)
 
 diff --git a/configure b/configure
-index 0e74f29..7f3f2f0 100755
+index eaa4092..43ad8df 100755
 --- a/configure
 +++ b/configure
-@@ -788,6 +788,7 @@ QT_HOST_BINS=
+@@ -791,6 +791,7 @@ QT_HOST_BINS=
  QT_HOST_LIBS=
  QT_HOST_DATA=
  QT_EXT_PREFIX=
@@ -39,7 +39,7 @@ index 0e74f29..7f3f2f0 100755
  
  #flags for SQL drivers
  QT_CFLAGS_PSQL=
-@@ -907,6 +908,7 @@ while [ "$#" -gt 0 ]; do
+@@ -910,6 +911,7 @@ while [ "$#" -gt 0 ]; do
      -testsdir| \
      -hostdatadir| \
      -hostbindir| \
@@ -47,7 +47,7 @@ index 0e74f29..7f3f2f0 100755
      -hostlibdir| \
      -extprefix| \
      -sysroot| \
-@@ -1120,6 +1122,9 @@ while [ "$#" -gt 0 ]; do
+@@ -1124,6 +1126,9 @@ while [ "$#" -gt 0 ]; do
      extprefix)
          QT_EXT_PREFIX="$VAL"
          ;;
@@ -57,7 +57,7 @@ index 0e74f29..7f3f2f0 100755
      pkg-config)
          if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
              CFG_PKGCONFIG="$VAL"
-@@ -2236,6 +2241,10 @@ Installation options:
+@@ -2248,6 +2253,10 @@ Installation options:
      -hostdatadir <dir> . Data used by qmake will be installed to <dir>
                           (default HOSTPREFIX)
  
@@ -68,7 +68,7 @@ index 0e74f29..7f3f2f0 100755
  Configure options:
  
   The defaults (*) are usually acceptable. A plus (+) denotes a default value
-@@ -3151,6 +3160,11 @@ fi
+@@ -2906,6 +2915,11 @@ fi
  # command line and environment validation
  #-------------------------------------------------------------------------------
  
@@ -80,7 +80,7 @@ index 0e74f29..7f3f2f0 100755
  # update QT_CONFIG to show our current predefined configuration
  CFG_QCONFIG_PATH=$relpath/src/corelib/global/qconfig-${CFG_QCONFIG}.h
  case "$CFG_QCONFIG" in
-@@ -3838,6 +3852,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
+@@ -3593,6 +3607,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
      "qt_hbinpath=$QT_HOST_BINS",
      "qt_hlibpath=$QT_HOST_LIBS",
      "qt_hdatpath=$QT_HOST_DATA",
@@ -135,10 +135,10 @@ index e50485c..71291ad 100644
      { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
  };
 diff --git a/qtbase.pro b/qtbase.pro
-index 140a137..4e01d5b 100644
+index ed6fc39..2421f41 100644
 --- a/qtbase.pro
 +++ b/qtbase.pro
-@@ -70,16 +70,22 @@ CONFIG -= qt
+@@ -71,16 +71,22 @@ CONFIG -= qt
  
  #qmake
  qmake.path = $$[QT_HOST_BINS]
@@ -165,10 +165,10 @@ index 140a137..4e01d5b 100644
  
  # If we are doing a prefix build, create a "module" pri which enables
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index c647a16..da82913 100644
+index 80e0f30..89e13cf 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -281,7 +281,7 @@ QLibraryInfo::isDebugBuild()
+@@ -336,7 +336,7 @@ QLibraryInfo::isDebugBuild()
   */
  
  static const struct {
@@ -177,7 +177,7 @@ index c647a16..da82913 100644
  } qtConfEntries[] = {
      { "Prefix", "." },
      { "Documentation", "doc" }, // should be ${Data}/doc
-@@ -307,6 +307,7 @@ static const struct {
+@@ -362,6 +362,7 @@ static const struct {
      { "HostBinaries", "bin" },
      { "HostLibraries", "lib" },
      { "HostData", "." },
@@ -186,10 +186,10 @@ index c647a16..da82913 100644
      { "HostSpec", "" },
  #endif
 diff --git a/src/corelib/global/qlibraryinfo.h b/src/corelib/global/qlibraryinfo.h
-index 17864b5..a14bc0f 100644
+index 0b573c2..b5535ee 100644
 --- a/src/corelib/global/qlibraryinfo.h
 +++ b/src/corelib/global/qlibraryinfo.h
-@@ -84,6 +84,7 @@ public:
+@@ -88,6 +88,7 @@ public:
          HostBinariesPath,
          HostLibrariesPath,
          HostDataPath,
@@ -198,10 +198,10 @@ index 17864b5..a14bc0f 100644
          HostSpecPath,
          LastHostPath = HostSpecPath,
 diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index 5ab413a..50a192b 100644
+index fe2caa2..eb472db 100644
 --- a/tools/configure/configureapp.cpp
 +++ b/tools/configure/configureapp.cpp
-@@ -1186,6 +1186,13 @@ void Configure::parseCmdLine()
+@@ -1208,6 +1208,13 @@ void Configure::parseCmdLine()
              dictionary[ "QT_EXT_PREFIX" ] = configCmdLine.at(i);
          }
  
@@ -215,7 +215,7 @@ index 5ab413a..50a192b 100644
          else if (configCmdLine.at(i) == "-make-tool") {
              ++i;
              if (i == argCount)
-@@ -3852,6 +3859,7 @@ void Configure::generateQConfigCpp()
+@@ -3957,6 +3964,7 @@ void Configure::generateQConfigCpp()
                    << "    \"qt_hbinpath=" << formatPath(dictionary["QT_HOST_BINS"]) << "\"," << endl
                    << "    \"qt_hlibpath=" << formatPath(dictionary["QT_HOST_LIBS"]) << "\"," << endl
                    << "    \"qt_hdatpath=" << formatPath(dictionary["QT_HOST_DATA"]) << "\"," << endl
@@ -224,5 +224,5 @@ index 5ab413a..50a192b 100644
                    << "    \"qt_hostspec=" << hostSpec << "\"," << endl
                    << "#endif" << endl
 -- 
-1.8.5.3
+2.0.0
 
diff --git a/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch b/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
index 16317ac..d24e193 100644
--- a/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
+++ b/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
@@ -1,7 +1,7 @@
-From 698f073fb8cc6dc1ced277b6ae2056cb9d02f2d5 Mon Sep 17 00:00:00 2001
+From 15b871b694cead18fcb750c0bb393440ea929e06 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 22:33:33 +0200
-Subject: [PATCH 04/14] configureapp: Prefix default LIBDIRS and INCDIRS with
+Subject: [PATCH 04/17] configureapp: Prefix default LIBDIRS and INCDIRS with
  SYSROOT
 
 Upstream-Status: Pending
@@ -10,10 +10,10 @@ Upstream-Status: Pending
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index 50a192b..46eabe4 100644
+index eb472db..808c8dd 100644
 --- a/tools/configure/configureapp.cpp
 +++ b/tools/configure/configureapp.cpp
-@@ -3213,8 +3213,8 @@ void Configure::generateQConfigPri()
+@@ -3344,8 +3344,8 @@ void Configure::generateQConfigPri()
          configStream << "    QT_ARCH = " << dictionary["QT_ARCH"] << endl;
          if (dictionary.contains("XQMAKESPEC") && !dictionary["XQMAKESPEC"].startsWith("wince")) {
              // FIXME: add detection
@@ -23,7 +23,7 @@ index 50a192b..46eabe4 100644
 +            configStream << "    QMAKE_DEFAULT_INCDIRS = $$[QT_SYSROOT]/usr/include $$[QT_SYSROOT]/usr/local/include" << endl;
          }
          configStream << "}" << endl;
-         if (dictionary["QT_EDITION"].contains("OPENSOURCE"))
+         configStream << "QT_CONFIG += " << qtConfig.join(' ') << endl;
 -- 
-1.8.5.3
+2.0.0
 
diff --git a/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch b/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch
index e1135ce..751ba27 100644
--- a/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch
+++ b/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch
@@ -1,7 +1,7 @@
-From 4d690dbc278063648434b0f02bdb1b6f4623b285 Mon Sep 17 00:00:00 2001
+From ad57786c39de2a192c0972bca6ffde2ce7a05d91 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
-Subject: [PATCH 05/14] qt_module: Fix pkgconfig replacement
+Subject: [PATCH 05/17] qt_module: Fix pkgconfig replacement
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -95,5 +95,5 @@ index 2134077..a88b8cc 100644
  
  unix|mingw {
 -- 
-1.9.3
+2.0.0
 
diff --git a/recipes-qt/qt5/qtbase/0006-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch b/recipes-qt/qt5/qtbase/0006-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch
index 726bfe0..2ad412e 100644
--- a/recipes-qt/qt5/qtbase/0006-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch
+++ b/recipes-qt/qt5/qtbase/0006-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch
@@ -1,7 +1,7 @@
-From ebd38fc708cf7190e47a75754235f56fa5d86300 Mon Sep 17 00:00:00 2001
+From 96b69ad415b4883782841fa1d7723cf182e4ce6e Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 8 May 2013 23:54:35 +0200
-Subject: [PATCH 06/14] configure: don't export SYSTEM_VARIABLES to .qmake.vars
+Subject: [PATCH 06/17] configure: don't export SYSTEM_VARIABLES to .qmake.vars
 
 * linux-oe-g++ should handle this correctly and exporting LD as QMAKE_LINK is
   causing issues as we need g++ to be used as linker
@@ -14,7 +14,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 14 deletions(-)
 
 diff --git a/configure b/configure
-index 7f3f2f0..13dd619 100755
+index 43ad8df..341a01b 100755
 --- a/configure
 +++ b/configure
 @@ -581,20 +581,6 @@ fi'`
@@ -39,5 +39,5 @@ index 7f3f2f0..13dd619 100755
  mkdir -p "$outpath/config.tests"
  rm -f "$outpath/config.tests/.qmake.cache"
 -- 
-1.8.5.3
+2.0.0
 
diff --git a/recipes-qt/qt5/qtbase/0007-configure.prf-Allow-to-add-extra-arguments-to-make.patch b/recipes-qt/qt5/qtbase/0007-configure.prf-Allow-to-add-extra-arguments-to-make.patch
index e8a7784..66eb898 100644
--- a/recipes-qt/qt5/qtbase/0007-configure.prf-Allow-to-add-extra-arguments-to-make.patch
+++ b/recipes-qt/qt5/qtbase/0007-configure.prf-Allow-to-add-extra-arguments-to-make.patch
@@ -1,7 +1,7 @@
-From 828eecd8f361cb965bd40f535435efa91665c8e5 Mon Sep 17 00:00:00 2001
+From 28fa609f9726993dd5b52de45c3458a1bdff6149 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Thu, 9 May 2013 10:06:50 +0200
-Subject: [PATCH 07/14] configure.prf: Allow to add extra arguments to make
+Subject: [PATCH 07/17] configure.prf: Allow to add extra arguments to make
 
 * sometimes we would like to add -e or define some variable and respect it from both
   Makefiles used in configure tests and also Makefiles to build the application
@@ -14,11 +14,11 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/mkspecs/features/configure.prf b/mkspecs/features/configure.prf
-index 39144e7..de48b07 100644
+index fe41c54..e2db923 100644
 --- a/mkspecs/features/configure.prf
 +++ b/mkspecs/features/configure.prf
-@@ -54,12 +54,12 @@ defineTest(qtCompileTest) {
-     qmake_configs = "\"CONFIG -= qt debug_and_release app_bundle lib_bundle\""
+@@ -60,12 +60,12 @@ defineTest(qtCompileTest) {
+     }
  
      # Clean up after previous run
 -    exists($$test_out_dir/Makefile):qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE distclean")
@@ -33,5 +33,5 @@ index 39144e7..de48b07 100644
              msg = "test $$1 succeeded"
              write_file($$QMAKE_CONFIG_LOG, msg, append)
 -- 
-1.8.5.3
+2.0.0
 
diff --git a/recipes-qt/qt5/qtbase/0008-configure-make-pulseaudio-alsa-freetype-a-configurab.patch b/recipes-qt/qt5/qtbase/0008-configure-make-pulseaudio-alsa-freetype-a-configurab.patch
index cccf7fb..d1d5873 100644
--- a/recipes-qt/qt5/qtbase/0008-configure-make-pulseaudio-alsa-freetype-a-configurab.patch
+++ b/recipes-qt/qt5/qtbase/0008-configure-make-pulseaudio-alsa-freetype-a-configurab.patch
@@ -1,7 +1,7 @@
-From 3923edc900d1b3dd23e0a6af3a32255707cd497c Mon Sep 17 00:00:00 2001
+From 8cca7892a65992369bb50a965293ebd2198ce40a Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Tue, 28 Feb 2012 15:10:24 +0000
-Subject: [PATCH 08/14] configure: make pulseaudio, alsa, freetype a
+Subject: [PATCH 08/17] configure: make pulseaudio, alsa, freetype a
  configurable option
 
 Allows disabling pulseaudio, alsa, freetype support at configure time
@@ -16,10 +16,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 21 insertions(+)
 
 diff --git a/configure b/configure
-index 13dd619..66c2ae0 100755
+index 341a01b..7d33403 100755
 --- a/configure
 +++ b/configure
-@@ -1810,6 +1810,27 @@ while [ "$#" -gt 0 ]; do
+@@ -1826,6 +1826,27 @@ while [ "$#" -gt 0 ]; do
              UNKNOWN_OPT=yes
          fi
          ;;
@@ -48,5 +48,5 @@ index 13dd619..66c2ae0 100755
          if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
              CFG_QGTKSTYLE="$VAL"
 -- 
-1.8.5.3
+2.0.0
 
diff --git a/recipes-qt/qt5/qtbase/0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch b/recipes-qt/qt5/qtbase/0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch
index 23e22a8..c83e330 100644
--- a/recipes-qt/qt5/qtbase/0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch
+++ b/recipes-qt/qt5/qtbase/0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch
@@ -1,7 +1,7 @@
-From acbd622d1b91c1aa9ec8c48d10d91354d175345c Mon Sep 17 00:00:00 2001
+From c1c28fa202519d6af0ca5aac942c3e18aaeda602 Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Mon, 22 Jul 2013 21:09:41 +0000
-Subject: [PATCH 09/14] cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS to
+Subject: [PATCH 09/17] cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS to
  determine path to host binaries
 
 Upstream-Status: Inappropiate (configuration)
@@ -46,7 +46,7 @@ index 9bda70e..6e3605a 100644
      _qt5_Core_check_file_exists(${imported_location})
  
 diff --git a/src/dbus/Qt5DBusConfigExtras.cmake.in b/src/dbus/Qt5DBusConfigExtras.cmake.in
-index 1d94715..617efa8 100644
+index 1d94715..301af8f 100644
 --- a/src/dbus/Qt5DBusConfigExtras.cmake.in
 +++ b/src/dbus/Qt5DBusConfigExtras.cmake.in
 @@ -5,7 +5,7 @@ if (NOT TARGET Qt5::qdbuscpp2xml)
@@ -81,5 +81,5 @@ index e5650ff..16ff007 100644
      _qt5_Widgets_check_file_exists(${imported_location})
  
 -- 
-1.8.5.3
+2.0.0
 
diff --git a/recipes-qt/qt5/qtbase/0015-Fix-missing-plugin_types.patch b/recipes-qt/qt5/qtbase/0010-Fix-missing-plugin_types.patch
similarity index 90%
rename from recipes-qt/qt5/qtbase/0015-Fix-missing-plugin_types.patch
rename to recipes-qt/qt5/qtbase/0010-Fix-missing-plugin_types.patch
index 612cbdd..8defd45 100644
--- a/recipes-qt/qt5/qtbase/0015-Fix-missing-plugin_types.patch
+++ b/recipes-qt/qt5/qtbase/0010-Fix-missing-plugin_types.patch
@@ -1,7 +1,7 @@
-From f0e01b788e86f24352ba14ad17c3f337f934467d Mon Sep 17 00:00:00 2001
+From 92cd73cb679dec203484cd76deff50cf329d8c44 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 21 Apr 2014 15:09:23 +0200
-Subject: [PATCH] Fix missing plugin_types
+Subject: [PATCH 10/17] Fix missing plugin_types
 
 * bearer/generic was failing with:
   Project ERROR: No module claims plugin type 'bearer'
@@ -26,5 +26,5 @@ index f31bc38..415e780 100644
                          rpath_link \
                  )):defined(QT.$${mod}.$$var, var):cache(QT.$${mod}.$$var, transient)
 -- 
-1.9.1
+2.0.0
 
diff --git a/recipes-qt/qt5/qtbase/0016-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch b/recipes-qt/qt5/qtbase/0011-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
similarity index 91%
rename from recipes-qt/qt5/qtbase/0016-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
rename to recipes-qt/qt5/qtbase/0011-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
index 65ebbd1..412ff35 100644
--- a/recipes-qt/qt5/qtbase/0016-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
+++ b/recipes-qt/qt5/qtbase/0011-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
@@ -1,7 +1,7 @@
-From 91b185d1f4843d22d42461c0aee4cd0f5393bbc8 Mon Sep 17 00:00:00 2001
+From 13d45f81c26b22668c58d56a797db6f4309b5469 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 21 Apr 2014 19:22:04 +0200
-Subject: [PATCH] Revert "eglfs: Print the chosen config in debug mode"
+Subject: [PATCH 11/17] Revert "eglfs: Print the chosen config in debug mode"
 
 This reverts commit dc685cf6331f5fb46285cf10d6464c2ecf41f73e.
 ---
@@ -10,7 +10,7 @@ This reverts commit dc685cf6331f5fb46285cf10d6464c2ecf41f73e.
  2 files changed, 3 insertions(+), 8 deletions(-)
 
 diff --git a/src/platformsupport/eglconvenience/qeglconvenience.cpp b/src/platformsupport/eglconvenience/qeglconvenience.cpp
-index e6624fb..3870f6c 100644
+index 75789db..cd732d9 100644
 --- a/src/platformsupport/eglconvenience/qeglconvenience.cpp
 +++ b/src/platformsupport/eglconvenience/qeglconvenience.cpp
 @@ -437,9 +437,11 @@ void q_printEglConfig(EGLDisplay display, EGLConfig config)
@@ -52,5 +52,5 @@ index eec6463..4a7c69b 100644
      // Make the context current to ensure the GL version query works. This needs a surface too.
      const EGLint pbufferAttributes[] = {
 -- 
-1.9.1
+2.0.0
 
diff --git a/recipes-qt/qt5/qtbase/0008-qeglplatformintegration-Undefine-CursorShape-from-X..patch b/recipes-qt/qt5/qtbase/0012-qeglplatformintegration-Undefine-CursorShape-from-X..patch
similarity index 87%
rename from recipes-qt/qt5/qtbase/0008-qeglplatformintegration-Undefine-CursorShape-from-X..patch
rename to recipes-qt/qt5/qtbase/0012-qeglplatformintegration-Undefine-CursorShape-from-X..patch
index 2f4d80c..6c7d139 100644
--- a/recipes-qt/qt5/qtbase/0008-qeglplatformintegration-Undefine-CursorShape-from-X..patch
+++ b/recipes-qt/qt5/qtbase/0012-qeglplatformintegration-Undefine-CursorShape-from-X..patch
@@ -1,7 +1,7 @@
-From 959b2fb8d8eb5e755e3d9d3d3031b996f96fb23b Mon Sep 17 00:00:00 2001
+From ebe56bbaf8916bae94e7cef7932b87fd0fe13959 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 19 Mar 2014 18:32:28 +0100
-Subject: [PATCH 8/8] qeglplatformintegration: Undefine CursorShape from X.h
+Subject: [PATCH 12/17] qeglplatformintegration: Undefine CursorShape from X.h
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
diff --git a/recipes-qt/qt5/qtbase/0012-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0013-configure-bump-path-length-from-256-to-512-character.patch
similarity index 78%
rename from recipes-qt/qt5/qtbase/0012-configure-bump-path-length-from-256-to-512-character.patch
rename to recipes-qt/qt5/qtbase/0013-configure-bump-path-length-from-256-to-512-character.patch
index be86f71..a215a5d 100644
--- a/recipes-qt/qt5/qtbase/0012-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase/0013-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,7 +1,7 @@
-From 63313ba681ad5bb0ef83c3b8908387939c2b41d5 Mon Sep 17 00:00:00 2001
+From 2fd1d381e0202296303f296965467f3252d72e25 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:27:30 -0500
-Subject: [PATCH 12/12] configure: bump path length from 256 to 512 characters
+Subject: [PATCH 13/17] configure: bump path length from 256 to 512 characters
 
 Increase the path length that gets hardcoded into generated config.cpp file
 from 256 to 512 characters, as nativesdk path can be quite long.
@@ -12,10 +12,10 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index d423cce..1ea4102 100755
+index 7d33403..53eb65d 100755
 --- a/configure
 +++ b/configure
-@@ -3823,7 +3823,7 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
+@@ -3578,7 +3578,7 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
  static const char qt_configure_installation          [12+11]    = "qt_instdate=`date +%Y-%m-%d`";
  
  /* Installation Info */
@@ -25,5 +25,5 @@ index d423cce..1ea4102 100755
      "qt_prfxpath=$QT_SYSROOT_PREFIX",
      "qt_docspath=$QT_SYSROOT_DOCS",
 -- 
-1.8.5.3
+2.0.0
 
diff --git a/recipes-qt/qt5/qtbase/0013-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase/0014-QOpenGLPaintDevice-sub-area-support.patch
similarity index 97%
rename from recipes-qt/qt5/qtbase/0013-QOpenGLPaintDevice-sub-area-support.patch
rename to recipes-qt/qt5/qtbase/0014-QOpenGLPaintDevice-sub-area-support.patch
index 54039de..64dd18a 100644
--- a/recipes-qt/qt5/qtbase/0013-QOpenGLPaintDevice-sub-area-support.patch
+++ b/recipes-qt/qt5/qtbase/0014-QOpenGLPaintDevice-sub-area-support.patch
@@ -1,7 +1,7 @@
-From 3c7bfc66e6c84fe06b16dfa0b76ee71701e8d5b5 Mon Sep 17 00:00:00 2001
+From d252513e388358e52865a29374840327369cb479 Mon Sep 17 00:00:00 2001
 From: Jani Hautakangas <jani.hautakangas@ixonos.com>
 Date: Thu, 16 May 2013 09:52:07 +0300
-Subject: [PATCH 13/14] QOpenGLPaintDevice sub-area support
+Subject: [PATCH 14/17] QOpenGLPaintDevice sub-area support
 
 Allows creating QOpenGLPaintDevice targetting sub-area
 of binded framebuffer.
@@ -148,5 +148,5 @@ index ac88d9d..6c77f10 100644
      } else {
          if (m_vao.isCreated()) {
 -- 
-1.9.3
+2.0.0
 
diff --git a/recipes-qt/qt5/qtbase/0014-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch b/recipes-qt/qt5/qtbase/0015-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
similarity index 81%
rename from recipes-qt/qt5/qtbase/0014-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
rename to recipes-qt/qt5/qtbase/0015-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
index 6fd2938..92b9ddd 100644
--- a/recipes-qt/qt5/qtbase/0014-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
+++ b/recipes-qt/qt5/qtbase/0015-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
@@ -1,7 +1,7 @@
-From c8995c6eb6cf4bfa8daf1e3e96bd4885a096f405 Mon Sep 17 00:00:00 2001
+From c209e7648bc0c59707fe18874789a826f8beb47b Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 5 Feb 2014 18:35:08 +0100
-Subject: [PATCH 14/14] eglfs: fix egl error for platforms only supporting one
+Subject: [PATCH 15/17] eglfs: fix egl error for platforms only supporting one
  window/surface
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
@@ -26,12 +26,12 @@ Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
  1 file changed, 15 insertions(+)
 
 diff --git a/src/plugins/platforms/eglfs/qeglfswindow.cpp b/src/plugins/platforms/eglfs/qeglfswindow.cpp
-index bba00da..567820c 100644
+index 2d36c0b..f2b68d3 100644
 --- a/src/plugins/platforms/eglfs/qeglfswindow.cpp
 +++ b/src/plugins/platforms/eglfs/qeglfswindow.cpp
-@@ -87,6 +87,16 @@ void QEglFSWindow::create()
-     if (m_flags.testFlag(Created))
-         return;
+@@ -72,6 +72,16 @@ void QEglFSWindow::create()
+ 
+     QEGLPlatformWindow::create();
  
 +    static EGLSurface __singleWindowSurface;
 +    if(QEglFSHooks::hooks() && !QEglFSHooks::hooks()->hasCapability(QPlatformIntegration::MultipleWindows) && (__singleWindowSurface))
@@ -44,9 +44,9 @@ index bba00da..567820c 100644
 +    }
 +
      m_flags = Created;
-     m_wid = newWId();
  
-@@ -130,6 +140,11 @@ void QEglFSWindow::create()
+     if (window()->type() == Qt::Desktop)
+@@ -105,6 +115,11 @@ void QEglFSWindow::create()
  
      resetSurface();
  
@@ -57,7 +57,7 @@ index bba00da..567820c 100644
 +
      screen->setPrimarySurface(m_surface);
  
-     if (m_flags.testFlag(IsRaster)) {
+     if (isRaster()) {
 -- 
-1.8.5.3
+2.0.0
 
diff --git a/recipes-qt/qt5/qtbase/0010-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0016-Always-build-uic.patch
similarity index 87%
rename from recipes-qt/qt5/qtbase/0010-Always-build-uic.patch
rename to recipes-qt/qt5/qtbase/0016-Always-build-uic.patch
index c55bc54..a466dbc 100644
--- a/recipes-qt/qt5/qtbase/0010-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase/0016-Always-build-uic.patch
@@ -1,7 +1,7 @@
-From 745055eb0f56ec4d48ea2ce57bcf3d0011afcec0 Mon Sep 17 00:00:00 2001
+From 981cbf981b4a36d790b4ebf1a3434ef439ad3e52 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
-Subject: [PATCH 10/12] Always build uic
+Subject: [PATCH 16/17] Always build uic
 
 Even if we are not building gui or widgets. This tool is needed later
 as a native tool when compiling the target.
@@ -27,5 +27,5 @@ index 6a805a6..90623a6 100644
  nacl: SUBDIRS -= src_network src_testlib
  
 -- 
-1.9.3
+2.0.0
 
diff --git a/recipes-qt/qt5/qtbase/0010-qmake-is-already-built-in-qtbase-native.patch b/recipes-qt/qt5/qtbase/0016-qmake-is-already-built-in-qtbase-native.patch
similarity index 74%
rename from recipes-qt/qt5/qtbase/0010-qmake-is-already-built-in-qtbase-native.patch
rename to recipes-qt/qt5/qtbase/0016-qmake-is-already-built-in-qtbase-native.patch
index 64ba88e..b807862 100644
--- a/recipes-qt/qt5/qtbase/0010-qmake-is-already-built-in-qtbase-native.patch
+++ b/recipes-qt/qt5/qtbase/0016-qmake-is-already-built-in-qtbase-native.patch
@@ -1,7 +1,7 @@
-From 77a18a9fe2d0e4a1dcd95e2d78c85eb37452bc73 Mon Sep 17 00:00:00 2001
+From 9a83bdba584d2a816c4f54fbc903f9f8f9fc0a2d Mon Sep 17 00:00:00 2001
 From: Michael Krelin <hacker@klever.net>
 Date: Mon, 29 Oct 2012 20:07:49 -0700
-Subject: [PATCH 10/14] qmake is already built in qtbase-native
+Subject: [PATCH 16/17] qmake is already built in qtbase-native
 
 Ported from OE by: Yu Ke <ke.yu@intel.com>
 Upstream-Status: Inappropriate [configuration]
@@ -13,10 +13,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 66c2ae0..ac836aa 100755
+index 53eb65d..b61c82b 100755
 --- a/configure
 +++ b/configure
-@@ -3941,7 +3941,7 @@ setBootstrapEvalVariable()
+@@ -3680,7 +3680,7 @@ setBootstrapEvalVariable()
  
  
  # build qmake
@@ -26,5 +26,5 @@ index 66c2ae0..ac836aa 100755
  
      mkdir -p "$outpath/qmake" || exit
 -- 
-1.8.5.3
+2.0.0
 
diff --git a/recipes-qt/qt5/qtbase/0011-Allow-building-a-separate-qmake-for-the-target.patch b/recipes-qt/qt5/qtbase/0017-Allow-building-a-separate-qmake-for-the-target.patch
similarity index 83%
rename from recipes-qt/qt5/qtbase/0011-Allow-building-a-separate-qmake-for-the-target.patch
rename to recipes-qt/qt5/qtbase/0017-Allow-building-a-separate-qmake-for-the-target.patch
index f80edbd..a6fcfe5 100644
--- a/recipes-qt/qt5/qtbase/0011-Allow-building-a-separate-qmake-for-the-target.patch
+++ b/recipes-qt/qt5/qtbase/0017-Allow-building-a-separate-qmake-for-the-target.patch
@@ -1,7 +1,7 @@
-From dd14f3eda61669c66c95dbcbca3afbd61f9aa746 Mon Sep 17 00:00:00 2001
+From a850a288fb526e6a4003616aa11dd992688ccc89 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Mon, 29 Oct 2012 20:26:36 -0700
-Subject: [PATCH 11/14] Allow building a separate qmake for the target
+Subject: [PATCH 17/17] Allow building a separate qmake for the target
 
 Upstream-Status: Inappropriate [config]
 
@@ -26,5 +26,5 @@ index 89d6ea5..7c605b9 100644
  VPATH += \
      ../src/corelib/global \
 -- 
-1.8.5.3
+2.0.0
 
diff --git a/recipes-qt/qt5/qtbase/0011-configure-preserve-built-qmake-and-swap-with-native-.patch b/recipes-qt/qt5/qtbase/0017-configure-preserve-built-qmake-and-swap-with-native-.patch
similarity index 73%
rename from recipes-qt/qt5/qtbase/0011-configure-preserve-built-qmake-and-swap-with-native-.patch
rename to recipes-qt/qt5/qtbase/0017-configure-preserve-built-qmake-and-swap-with-native-.patch
index 798cd45..0d5bc2f 100644
--- a/recipes-qt/qt5/qtbase/0011-configure-preserve-built-qmake-and-swap-with-native-.patch
+++ b/recipes-qt/qt5/qtbase/0017-configure-preserve-built-qmake-and-swap-with-native-.patch
@@ -1,7 +1,7 @@
-From 441b2ebc41013505b9f5b6a4db43526506f84e47 Mon Sep 17 00:00:00 2001
+From 88e1910cc2e0c2890d7084cc66ebb7c3c9981bf3 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:22:34 -0500
-Subject: [PATCH 11/12] configure: preserve built qmake and swap with native
+Subject: [PATCH 17/17] configure: preserve built qmake and swap with native
  one
 
 Let configure script build the real qmake, but right after it's built, swap
@@ -13,10 +13,10 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/configure b/configure
-index 66c2ae0..d423cce 100755
+index 53eb65d..01832e6 100755
 --- a/configure
 +++ b/configure
-@@ -4085,6 +4085,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+@@ -3827,6 +3827,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
  
      (cd "$outpath/qmake"; "$MAKE") || exit 2
  fi # Build qmake
@@ -26,5 +26,5 @@ index 66c2ae0..d423cce 100755
  echo "Running configuration tests..."
  
 -- 
-1.8.5.3
+2.0.0
 
-- 
2.0.0


