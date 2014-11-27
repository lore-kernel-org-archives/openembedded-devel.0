Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id EFE937185E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Nov 2014 13:12:46 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id y19so6425730wgg.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Nov 2014 05:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=LglJemDZMOROXAl8QoLbuyurgLHY/Xw+4nObJ5ZHnlU=;
	b=ilWFuGb2um7/4+5dnSEMT7mDCQKlmC2cnrVYFl8+jtrl1IkTluo9kr23CkLzm/TIHb
	qcKeeOSVE7+gSOjMEC9es1fEIz9yP+hQxizMFvwJircj2+6y578Fj80vfEdKwBfppd+m
	E/83xjTqAsqfZdzWBhWHE88fL7zPYRqwS1earoeMsk6VHK8yhhshAnxbFb3CGJ+00mkI
	UXcnFY/X4VfjgALUW4Sx3c+tyfpUqI73f2wzSKpI7qLNer2aDdfnWBHt2w8+JxgcmzK7
	ulcL0z9FStuB5FZEuHrW7HQlFz63Zoyf/b6y8gHnVP6CZZIRL66aveipBNOzx6nrnudn
	ZThA==
X-Received: by 10.180.186.40 with SMTP id fh8mr51242207wic.40.1417093966391;
	Thu, 27 Nov 2014 05:12:46 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bm1sm10650029wjb.45.2014.11.27.05.12.45 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Nov 2014 05:12:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Nov 2014 14:12:47 +0100
Message-Id: <1417093967-22563-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.3
MIME-Version: 1.0
Subject: [meta-qt5][WIP][PATCH] qt5-git: Update to rc1+, latest revision in 5.4 branch
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
X-List-Received-Date: Thu, 27 Nov 2014 13:12:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |  2 +-
 recipes-qt/qt5/qt5-git.inc                         |  2 +-
 .../qtbase-git/0001-Add-linux-oe-g-platform.patch  | 18 ++++++------
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  8 ++---
 .../0003-Add-external-hostbindir-option.patch      | 28 +++++++++---------
 ...p-Prefix-default-LIBDIRS-and-INCDIRS-with.patch |  8 ++---
 ...le-Fix-pkgconfig-and-libtool-replacements.patch | 10 +++----
 ...lfs-Print-the-chosen-config-in-debug-mode.patch |  8 ++---
 ...mintegration-Undefine-CursorShape-from-X..patch |  4 +--
 ...ump-path-length-from-256-to-512-character.patch |  8 ++---
 ...gl-error-for-platforms-only-supporting-on.patch |  6 ++--
 .../0010-QOpenGLPaintDevice-sub-area-support.patch | 17 +++++------
 .../qt5/qtbase-git/0011-Always-build-uic.patch     |  8 ++---
 ...-build-it-in-configure-but-allow-to-build.patch |  8 ++---
 ...reserve-built-qmake-and-swap-with-native-.patch |  8 ++---
 recipes-qt/qt5/qtbase-native_git.bb                |  2 +-
 recipes-qt/qt5/qtbase_git.bb                       |  2 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |  2 +-
 .../0001-qmltestexample-fix-link.patch             |  4 +--
 recipes-qt/qt5/qtdeclarative_git.bb                |  2 +-
 recipes-qt/qt5/qtimageformats_git.bb               |  2 +-
 recipes-qt/qt5/qtlocation_git.bb                   |  2 +-
 ...1-Initial-porting-effort-to-GStreamer-1.0.patch | 28 +++++++++---------
 ...a.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch |  4 +--
 recipes-qt/qt5/qtmultimedia_git.bb                 |  2 +-
 recipes-qt/qt5/qtquick1_git.bb                     |  2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |  2 +-
 recipes-qt/qt5/qtscript_git.bb                     |  2 +-
 recipes-qt/qt5/qtserialport_git.bb                 |  2 +-
 recipes-qt/qt5/qtsvg_git.bb                        |  2 +-
 recipes-qt/qt5/qtsystems_git.bb                    |  6 ++--
 ...w-to-build-only-lrelease-lupdate-lconvert.patch |  4 +--
 ...t-help-fix-linking-of-dependent-libraries.patch |  4 +--
 .../0003-add-noqtwebkit-configuration.patch        |  4 +--
 recipes-qt/qt5/qttools-native_git.bb               |  2 +-
 recipes-qt/qt5/qttools_git.bb                      |  2 +-
 ...-qtwaylandscanner-tool-to-the-native-side.patch |  4 +--
 ...yland-include-server-buffer-only-when-bui.patch |  4 +--
 recipes-qt/qt5/qtwayland-native_git.bb             |  2 +-
 recipes-qt/qt5/qtwayland_git.bb                    |  2 +-
 ...rf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch | 29 ------------------
 ...0002-functions.prf-Try-to-add-_moc-suffix.patch | 34 ----------------------
 recipes-qt/qt5/qtwebengine_git.bb                  | 11 +++----
 .../0001-qtwebkit-fix-QA-issue-bad-RPATH.patch     |  4 +--
 recipes-qt/qt5/qtwebkit_git.bb                     |  2 +-
 recipes-qt/qt5/qtwebsockets_git.bb                 |  2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |  2 +-
 47 files changed, 127 insertions(+), 194 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtwebengine-git/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine-git/0002-functions.prf-Try-to-add-_moc-suffix.patch

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 96d86db..ac865c0 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -32,7 +32,7 @@ SRC_URI += " \
     file://0012-configure-preserve-built-qmake-and-swap-with-native-.patch \
 "
 
-SRCREV = "06e706bdbb826b521389409b53079483fda5584a"
+SRCREV = "cc23ebace8b7f343aca6e10f9ebd31b87c17c782"
 
 LICENSE = "GFDL-1.3 & LGPL-2.1 | LGPL-3.0"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index 4f8fa98..8631e10 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -10,7 +10,7 @@ SRC_URI += " \
 
 S = "${WORKDIR}/git"
 
-PV = "5.3.99+5.4.0-beta1+git${SRCPV}"
+PV = "5.3.99+5.4.0-rc1+git${SRCPV}"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
 
diff --git a/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
index 8f95ccb..081bcac 100644
--- a/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From 71a2437e2ee5a1214ab88c8a3d1d0ddcc012698d Mon Sep 17 00:00:00 2001
+From 81cd2947e9b1290498bdc2505a76fb053ff33be8 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
 Subject: [PATCH 01/11] Add linux-oe-g++ platform
@@ -51,7 +51,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
 diff --git a/configure b/configure
-index 7d6ba9f..1de01a9 100755
+index 229fb4e..b7a6fe3 100755
 --- a/configure
 +++ b/configure
 @@ -316,6 +316,16 @@ getQMakeConf()
@@ -118,7 +118,7 @@ index 7d6ba9f..1de01a9 100755
  # Use CC/CXX to run config.tests
  mkdir -p "$outpath/config.tests"
  rm -f "$outpath/config.tests/.qmake.cache"
-@@ -3167,7 +3185,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
+@@ -3173,7 +3191,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
      [ "$CFG_QGTKSTYLE" = "auto" ] && CFG_QGTKSTYLE=no
  fi
  
@@ -127,7 +127,7 @@ index 7d6ba9f..1de01a9 100755
  
  TEST_COMPILER=$QMAKE_CONF_COMPILER
  
-@@ -3205,7 +3223,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
+@@ -3211,7 +3229,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
          exit 1
      fi
  fi
@@ -136,7 +136,7 @@ index 7d6ba9f..1de01a9 100755
  
  GCC_MACHINE_DUMP=
  case "$TEST_COMPILER" in *g++) GCC_MACHINE_DUMP=$($TEST_COMPILER -dumpmachine);; esac
-@@ -3676,6 +3694,14 @@ setBootstrapVariable()
+@@ -3682,6 +3700,14 @@ setBootstrapVariable()
      getQMakeConf "$1" | echo ${2-$1} = `if [ -n "$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
  }
  
@@ -151,7 +151,7 @@ index 7d6ba9f..1de01a9 100755
  # build qmake
  if true; then ###[ '!' -f "$outpath/bin/qmake" ];
      echo "Creating qmake..."
-@@ -3714,14 +3740,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+@@ -3720,14 +3746,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
          fi
  
          [ "$CFG_SILENT" = "yes" ] && CC_TRANSFORM='s,^,\@,' || CC_TRANSFORM=
@@ -175,10 +175,10 @@ index 7d6ba9f..1de01a9 100755
          if [ "$CFG_RELEASE_QMAKE" = "yes" ]; then
              setBootstrapVariable QMAKE_CFLAGS_RELEASE
 diff --git a/mkspecs/features/configure.prf b/mkspecs/features/configure.prf
-index 05e10c9..213eeb8 100644
+index 6b37a04..dcf6025 100644
 --- a/mkspecs/features/configure.prf
 +++ b/mkspecs/features/configure.prf
-@@ -60,12 +60,12 @@ defineTest(qtCompileTest) {
+@@ -63,12 +63,12 @@ defineTest(qtCompileTest) {
      }
  
      # Clean up after previous run
@@ -346,5 +346,5 @@ index 0000000..dd12003
 +
 +#endif // QPLATFORMDEFS_H
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index e4ef88c..bae0dd3 100644
--- a/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,4 +1,4 @@
-From 1e7e18bca925638cb381edbba3f10ce79799d460 Mon Sep 17 00:00:00 2001
+From aae38b0ff226f287ad40f6eb423f1b974f548b73 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
 Subject: [PATCH 02/11] qlibraryinfo: allow to set qt.conf from the outside
@@ -19,10 +19,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index c3ec2bc..1be2659 100644
+index 7ca0aa7..d68c51b 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -147,7 +147,10 @@ QLibrarySettings::QLibrarySettings()
+@@ -139,7 +139,10 @@ QLibrarySettings::QLibrarySettings()
  
  QSettings *QLibraryInfoPrivate::findConfiguration()
  {
@@ -35,5 +35,5 @@ index c3ec2bc..1be2659 100644
      if(!QFile::exists(qtconfig))
          qtconfig = qt_libraryInfoFile();
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
index 7c54008..c633ea7 100644
--- a/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
@@ -1,4 +1,4 @@
-From 8f5a3f5b5d8f50661a2c69d5741a9df237600094 Mon Sep 17 00:00:00 2001
+From f2d51e50a7fbdf485696d1b8b2d29e64c729c76b Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH 03/11] Add -external-hostbindir option
@@ -28,17 +28,17 @@ Signed-off-by: Jonathan Liu <net147@gmail.com>
  mkspecs/features/qt_functions.prf           |  6 +++++-
  mkspecs/features/qt_tool.prf                |  4 ++--
  qmake/property.cpp                          |  1 +
- qtbase.pro                                  | 14 +++++++++++---
+ qtbase.pro                                  | 13 ++++++++++---
  src/corelib/Qt5CoreConfigExtras.cmake.in    |  6 +++---
  src/corelib/global/qlibraryinfo.cpp         |  3 ++-
  src/corelib/global/qlibraryinfo.h           |  1 +
  src/dbus/Qt5DBusConfigExtras.cmake.in       |  4 ++--
  src/widgets/Qt5WidgetsConfigExtras.cmake.in |  2 +-
  tools/configure/configureapp.cpp            |  8 ++++++++
- 11 files changed, 51 insertions(+), 13 deletions(-)
+ 11 files changed, 50 insertions(+), 13 deletions(-)
 
 diff --git a/configure b/configure
-index 1de01a9..7d7a98a 100755
+index b7a6fe3..d715f6c 100755
 --- a/configure
 +++ b/configure
 @@ -769,6 +769,7 @@ QT_HOST_BINS=
@@ -67,7 +67,7 @@ index 1de01a9..7d7a98a 100755
      pkg-config)
          if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
              CFG_PKGCONFIG="$VAL"
-@@ -2260,6 +2265,10 @@ Installation options:
+@@ -2265,6 +2270,10 @@ Installation options:
      -hostdatadir <dir> . Data used by qmake will be installed to <dir>
                           (default HOSTPREFIX)
  
@@ -78,7 +78,7 @@ index 1de01a9..7d7a98a 100755
  Configure options:
  
   The defaults (*) are usually acceptable. A plus (+) denotes a default value
-@@ -2939,6 +2948,11 @@ fi
+@@ -2944,6 +2953,11 @@ fi
  # command line and environment validation
  #-------------------------------------------------------------------------------
  
@@ -90,7 +90,7 @@ index 1de01a9..7d7a98a 100755
  # update QT_CONFIG to show our current predefined configuration
  CFG_QCONFIG_PATH=$relpath/src/corelib/global/qconfig-${CFG_QCONFIG}.h
  case "$CFG_QCONFIG" in
-@@ -3638,6 +3652,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
+@@ -3644,6 +3658,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
      "qt_hbinpath=$QT_HOST_BINS",
      "qt_hlibpath=$QT_HOST_LIBS",
      "qt_hdatpath=$QT_HOST_DATA",
@@ -146,7 +146,7 @@ index 051e056..50da6ed 100644
      { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
  };
 diff --git a/qtbase.pro b/qtbase.pro
-index d6861cf..7fb58a3 100644
+index 6d0de44..ddf7478 100644
 --- a/qtbase.pro
 +++ b/qtbase.pro
 @@ -69,18 +69,25 @@ CONFIG -= qt
@@ -210,10 +210,10 @@ index 9bda70e..6e3605a 100644
      _qt5_Core_check_file_exists(${imported_location})
  
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 1be2659..6c3718a 100644
+index d68c51b..7191159 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -357,7 +357,7 @@ QLibraryInfo::isDebugBuild()
+@@ -349,7 +349,7 @@ QLibraryInfo::isDebugBuild()
   */
  
  static const struct {
@@ -222,7 +222,7 @@ index 1be2659..6c3718a 100644
  } qtConfEntries[] = {
      { "Prefix", "." },
      { "Documentation", "doc" }, // should be ${Data}/doc
-@@ -383,6 +383,7 @@ static const struct {
+@@ -375,6 +375,7 @@ static const struct {
      { "HostBinaries", "bin" },
      { "HostLibraries", "lib" },
      { "HostData", "." },
@@ -278,7 +278,7 @@ index 99d87e2..5621dc0 100644
      _qt5_Widgets_check_file_exists(${imported_location})
  
 diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index 99ecc7b..6e0f4da 100644
+index 92422c2..d0a62c8 100644
 --- a/tools/configure/configureapp.cpp
 +++ b/tools/configure/configureapp.cpp
 @@ -1191,6 +1191,13 @@ void Configure::parseCmdLine()
@@ -295,7 +295,7 @@ index 99ecc7b..6e0f4da 100644
          else if (configCmdLine.at(i) == "-make-tool") {
              ++i;
              if (i == argCount)
-@@ -3994,6 +4001,7 @@ void Configure::generateQConfigCpp()
+@@ -3995,6 +4002,7 @@ void Configure::generateQConfigCpp()
                    << "    \"qt_hbinpath=" << formatPath(dictionary["QT_HOST_BINS"]) << "\"," << endl
                    << "    \"qt_hlibpath=" << formatPath(dictionary["QT_HOST_LIBS"]) << "\"," << endl
                    << "    \"qt_hdatpath=" << formatPath(dictionary["QT_HOST_DATA"]) << "\"," << endl
@@ -304,5 +304,5 @@ index 99ecc7b..6e0f4da 100644
                    << "    \"qt_hostspec=" << hostSpec << "\"," << endl
                    << "#endif" << endl
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtbase-git/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch b/recipes-qt/qt5/qtbase-git/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
index b5b7746..83694b7 100644
--- a/recipes-qt/qt5/qtbase-git/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
+++ b/recipes-qt/qt5/qtbase-git/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
@@ -1,4 +1,4 @@
-From e74a3790f613771099e3373f8e6df506c3520b73 Mon Sep 17 00:00:00 2001
+From 13a61389aa33fdfd5d9a1adf824d98c5ebf1cdff Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 22:33:33 +0200
 Subject: [PATCH 04/11] configureapp: Prefix default LIBDIRS and INCDIRS with
@@ -11,10 +11,10 @@ Upstream-Status: Pending
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index 6e0f4da..d72c302 100644
+index d0a62c8..b3f3ff8 100644
 --- a/tools/configure/configureapp.cpp
 +++ b/tools/configure/configureapp.cpp
-@@ -3383,8 +3383,8 @@ void Configure::generateQConfigPri()
+@@ -3384,8 +3384,8 @@ void Configure::generateQConfigPri()
          configStream << "    QT_ARCH = " << dictionary["QT_ARCH"] << endl;
          if (dictionary.contains("XQMAKESPEC") && !dictionary["XQMAKESPEC"].startsWith("wince")) {
              // FIXME: add detection
@@ -26,5 +26,5 @@ index 6e0f4da..d72c302 100644
          configStream << "}" << endl;
          configStream << "QT_CONFIG += " << qtConfig.join(' ') << endl;
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtbase-git/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase-git/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
index 4661606..a6e9089 100644
--- a/recipes-qt/qt5/qtbase-git/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ b/recipes-qt/qt5/qtbase-git/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -1,4 +1,4 @@
-From 9f7dd27bb14cf0c3425c2c8fdec2f6d0df3852f9 Mon Sep 17 00:00:00 2001
+From 5778f98f990781710e72be8275dae32a7999330d Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
 Subject: [PATCH 05/11] qt_module: Fix pkgconfig and libtool replacements
@@ -67,7 +67,7 @@ Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
  2 files changed, 16 insertions(+), 1 deletion(-)
 
 diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_common.prf
-index ebc5f00..46319d8 100644
+index af9d6ca..a4781d6 100644
 --- a/mkspecs/features/qt_common.prf
 +++ b/mkspecs/features/qt_common.prf
 @@ -33,7 +33,7 @@ contains(TEMPLATE, .*lib) {
@@ -80,10 +80,10 @@ index ebc5f00..46319d8 100644
      lib_replace.CONFIG = path
      QMAKE_PRL_INSTALL_REPLACE += lib_replace
 diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_module.prf
-index 8599a47..7da73a6 100644
+index d213f9e..915c596 100644
 --- a/mkspecs/features/qt_module.prf
 +++ b/mkspecs/features/qt_module.prf
-@@ -190,10 +190,25 @@ unix|mingw {
+@@ -192,10 +192,25 @@ unix|mingw {
          QMAKE_PKGCONFIG_DESCRIPTION = $$replace(TARGET, ^Qt, "Qt ") module
      QMAKE_PKGCONFIG_INSTALL_REPLACE += lib_replace
  
@@ -110,5 +110,5 @@ index 8599a47..7da73a6 100644
  }
  
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtbase-git/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch b/recipes-qt/qt5/qtbase-git/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
index 6e47e81..042d763 100644
--- a/recipes-qt/qt5/qtbase-git/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
+++ b/recipes-qt/qt5/qtbase-git/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
@@ -1,4 +1,4 @@
-From 4b6778e44b35d97bd08baded4e5d1f570693ae05 Mon Sep 17 00:00:00 2001
+From 4a067c162d08596e3ec89dcfb3ecdf197b1bf22a Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 21 Apr 2014 19:22:04 +0200
 Subject: [PATCH 06/11] Revert "eglfs: Print the chosen config in debug mode"
@@ -51,7 +51,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  2 files changed, 3 insertions(+), 8 deletions(-)
 
 diff --git a/src/platformsupport/eglconvenience/qeglconvenience.cpp b/src/platformsupport/eglconvenience/qeglconvenience.cpp
-index 1fdeec3..0fa3d88 100644
+index c1a491c..7a0fc87 100644
 --- a/src/platformsupport/eglconvenience/qeglconvenience.cpp
 +++ b/src/platformsupport/eglconvenience/qeglconvenience.cpp
 @@ -443,9 +443,11 @@ void q_printEglConfig(EGLDisplay display, EGLConfig config)
@@ -66,7 +66,7 @@ index 1fdeec3..0fa3d88 100644
 +    qWarning("\n");
  }
  
- #ifdef Q_OS_LINUX
+ #ifdef Q_OS_UNIX
 diff --git a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp b/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
 index 7cc3300..ccbd974 100644
 --- a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
@@ -93,5 +93,5 @@ index 7cc3300..ccbd974 100644
  }
  
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtbase-git/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch b/recipes-qt/qt5/qtbase-git/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
index ddc541a..c528f0c 100644
--- a/recipes-qt/qt5/qtbase-git/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
+++ b/recipes-qt/qt5/qtbase-git/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
@@ -1,4 +1,4 @@
-From 2ec9a882cd9a0893f2060ef36d28e0568416f9fe Mon Sep 17 00:00:00 2001
+From 8e152449beb18454347cfdb300c50d113fa48383 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 19 Mar 2014 18:32:28 +0100
 Subject: [PATCH 07/11] qeglplatformintegration: Undefine CursorShape from X.h
@@ -26,5 +26,5 @@ index 4d7adce..c9b6873 100644
  
  class QEGLPlatformScreen;
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtbase-git/0008-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase-git/0008-configure-bump-path-length-from-256-to-512-character.patch
index 508f9f9..c20d6f1 100644
--- a/recipes-qt/qt5/qtbase-git/0008-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase-git/0008-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,4 +1,4 @@
-From 00906b6ca765e7e71d354bf675b27b3862af535c Mon Sep 17 00:00:00 2001
+From 3a31a14c9c244a22337f22d083a680f69a1b1ce8 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:27:30 -0500
 Subject: [PATCH 08/11] configure: bump path length from 256 to 512 characters
@@ -12,10 +12,10 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 7d7a98a..3f05383 100755
+index d715f6c..bd43281 100755
 --- a/configure
 +++ b/configure
-@@ -3616,7 +3616,7 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
+@@ -3622,7 +3622,7 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
  static const char qt_configure_installation          [12+11]    = "qt_instdate=`date +%Y-%m-%d`";
  
  /* Installation Info */
@@ -25,5 +25,5 @@ index 7d7a98a..3f05383 100755
      "qt_prfxpath=$QT_SYSROOT_PREFIX",
      "qt_docspath=$QT_SYSROOT_DOCS",
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtbase-git/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch b/recipes-qt/qt5/qtbase-git/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
index 0f66330..200864a 100644
--- a/recipes-qt/qt5/qtbase-git/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
+++ b/recipes-qt/qt5/qtbase-git/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
@@ -1,4 +1,4 @@
-From 46cf3a50908de0ccec31de6705674a4c69fb8d6c Mon Sep 17 00:00:00 2001
+From 621d867223a135a9babd452d4918200bc6d0463b Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 5 Feb 2014 18:35:08 +0100
 Subject: [PATCH 09/11] eglfs: fix egl error for platforms only supporting one
@@ -27,7 +27,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 15 insertions(+), 1 deletion(-)
 
 diff --git a/src/plugins/platforms/eglfs/qeglfswindow.cpp b/src/plugins/platforms/eglfs/qeglfswindow.cpp
-index c83b894..b937881 100644
+index f5839e0..5ebde6d 100644
 --- a/src/plugins/platforms/eglfs/qeglfswindow.cpp
 +++ b/src/plugins/platforms/eglfs/qeglfswindow.cpp
 @@ -66,6 +66,15 @@ void QEglFSWindow::create()
@@ -68,5 +68,5 @@ index c83b894..b937881 100644
  
      if (isRaster()) {
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtbase-git/0010-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase-git/0010-QOpenGLPaintDevice-sub-area-support.patch
index 51a244d..986d2a9 100644
--- a/recipes-qt/qt5/qtbase-git/0010-QOpenGLPaintDevice-sub-area-support.patch
+++ b/recipes-qt/qt5/qtbase-git/0010-QOpenGLPaintDevice-sub-area-support.patch
@@ -1,4 +1,4 @@
-From e7b9af7232c4f7eb50933dde208e58438bedd964 Mon Sep 17 00:00:00 2001
+From 46074ffb4525e8217acd78c9cbe29f3d62f85c78 Mon Sep 17 00:00:00 2001
 From: Jani Hautakangas <jani.hautakangas@ixonos.com>
 Date: Thu, 16 May 2013 09:52:07 +0300
 Subject: [PATCH 10/11] QOpenGLPaintDevice sub-area support
@@ -21,7 +21,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  6 files changed, 23 insertions(+), 3 deletions(-)
 
 diff --git a/src/gui/opengl/qopenglpaintdevice.cpp b/src/gui/opengl/qopenglpaintdevice.cpp
-index e908fd8..8f0ef56 100644
+index a08d26f..cff3155 100644
 --- a/src/gui/opengl/qopenglpaintdevice.cpp
 +++ b/src/gui/opengl/qopenglpaintdevice.cpp
 @@ -135,6 +135,12 @@ QOpenGLPaintDevice::QOpenGLPaintDevice(int width, int height)
@@ -50,18 +50,17 @@ index e908fd8..8f0ef56 100644
      Returns the pixel size of the paint device.
  
 diff --git a/src/gui/opengl/qopenglpaintdevice.h b/src/gui/opengl/qopenglpaintdevice.h
-index dda3bfe..9965553 100644
+index 10cee84..a6683c5 100644
 --- a/src/gui/opengl/qopenglpaintdevice.h
 +++ b/src/gui/opengl/qopenglpaintdevice.h
-@@ -53,6 +53,7 @@ public:
+@@ -53,12 +53,14 @@ public:
      QOpenGLPaintDevice();
      explicit QOpenGLPaintDevice(const QSize &size);
      QOpenGLPaintDevice(int width, int height);
 +    QOpenGLPaintDevice(int x, int y, int width, int height);
-     QOpenGLPaintDevice(QOpenGLPaintDevicePrivate *dd);
      virtual ~QOpenGLPaintDevice();
  
-@@ -60,6 +61,7 @@ public:
+     int devType() const { return QInternal::OpenGL; }
      QPaintEngine *paintEngine() const;
  
      QOpenGLContext *context() const;
@@ -141,10 +140,10 @@ index 5ef0366..c5b517d 100644
      QOpenGLContext *ctx;
      EngineMode mode;
 diff --git a/src/gui/opengl/qopengltextureglyphcache.cpp b/src/gui/opengl/qopengltextureglyphcache.cpp
-index 6e16b2d..ddec9bb 100644
+index cd268cd..997bc35 100644
 --- a/src/gui/opengl/qopengltextureglyphcache.cpp
 +++ b/src/gui/opengl/qopengltextureglyphcache.cpp
-@@ -308,7 +308,7 @@ void QOpenGLTextureGlyphCache::resizeTextureData(int width, int height)
+@@ -310,7 +310,7 @@ void QOpenGLTextureGlyphCache::resizeTextureData(int width, int height)
      funcs->glBindFramebuffer(GL_FRAMEBUFFER, (GLuint)oldFbo);
  
      if (pex != 0) {
@@ -154,5 +153,5 @@ index 6e16b2d..ddec9bb 100644
      } else {
          if (m_vao.isCreated()) {
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch b/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch
index 8ef6eaa..86bf90d 100644
--- a/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch
@@ -1,4 +1,4 @@
-From 8a3493c260f8b0580f9dd0ab2dafbf968c14e019 Mon Sep 17 00:00:00 2001
+From d48323aae1bee4b2398d61e1777815ffac15ccce Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
 Subject: [PATCH 11/12] Always build uic
@@ -14,10 +14,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/src.pro b/src/src.pro
-index ab93641..a48606b 100644
+index 81f4fa5..74ec23d 100644
 --- a/src/src.pro
 +++ b/src/src.pro
-@@ -161,7 +161,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
+@@ -162,7 +162,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
          }
      }
  }
@@ -27,5 +27,5 @@ index ab93641..a48606b 100644
  nacl: SUBDIRS -= src_network src_testlib
  
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch b/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
index 1e701c7..21e0987 100644
--- a/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
+++ b/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
@@ -1,4 +1,4 @@
-From d750936020f354b8c59bbfcbf3930115c390d36d Mon Sep 17 00:00:00 2001
+From ee542556da221be99fa3344630b78529555be2bc Mon Sep 17 00:00:00 2001
 From: Michael Krelin <hacker@klever.net>
 Date: Mon, 29 Oct 2012 20:07:49 -0700
 Subject: [PATCH 11/11] qmake: don't build it in configure, but allow to build
@@ -20,10 +20,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  2 files changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 3f05383..05ae996 100755
+index bd43281..5d1b3aa 100755
 --- a/configure
 +++ b/configure
-@@ -3718,7 +3718,7 @@ setBootstrapEvalVariable()
+@@ -3724,7 +3724,7 @@ setBootstrapEvalVariable()
  
  
  # build qmake
@@ -46,5 +46,5 @@ index 89d6ea5..7c605b9 100644
  VPATH += \
      ../src/corelib/global \
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtbase-git/0012-configure-preserve-built-qmake-and-swap-with-native-.patch b/recipes-qt/qt5/qtbase-git/0012-configure-preserve-built-qmake-and-swap-with-native-.patch
index d89f344..6a428ed 100644
--- a/recipes-qt/qt5/qtbase-git/0012-configure-preserve-built-qmake-and-swap-with-native-.patch
+++ b/recipes-qt/qt5/qtbase-git/0012-configure-preserve-built-qmake-and-swap-with-native-.patch
@@ -1,4 +1,4 @@
-From 36b89f6e50e2b28d8646a5e77cdac36ecbd6ba4f Mon Sep 17 00:00:00 2001
+From 9089bf90632ffc983625816c5b0f2f2509ffc176 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:22:34 -0500
 Subject: [PATCH 12/12] configure: preserve built qmake and swap with native
@@ -13,10 +13,10 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/configure b/configure
-index 3f05383..d6ff774 100755
+index bd43281..d331711 100755
 --- a/configure
 +++ b/configure
-@@ -3868,6 +3868,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+@@ -3874,6 +3874,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
  
      (cd "$outpath/qmake"; "$MAKE") || exit 2
  fi # Build qmake
@@ -26,5 +26,5 @@ index 3f05383..d6ff774 100755
  echo "Running configuration tests..."
  
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 5853731..9d7baed 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -30,7 +30,7 @@ do_install_append() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "06e706bdbb826b521389409b53079483fda5584a"
+SRCREV = "cc23ebace8b7f343aca6e10f9ebd31b87c17c782"
 
 LICENSE = "GFDL-1.3 & LGPL-2.1 | LGPL-3.0"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 443f64a..f136651 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -24,7 +24,7 @@ SRC_URI += "\
     file://0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
 "
 
-SRCREV = "06e706bdbb826b521389409b53079483fda5584a"
+SRCREV = "cc23ebace8b7f343aca6e10f9ebd31b87c17c782"
 
 LICENSE = "GFDL-1.3 & LGPL-2.1 | LGPL-3.0"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 7bf6b30..4e7323b 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${BPN}.inc
 
-SRCREV = "4a6d4e8682384887d1b30b9c3107f47c57d7ee3f"
+SRCREV = "73563f571e6dfd37a0e4cf90f4679d9901b9233c"
 
 LICENSE += "| GPL-2.0"
 LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch b/recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch
index 2c0b3b6..acff84f 100644
--- a/recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch
+++ b/recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch
@@ -1,4 +1,4 @@
-From 74983b3dfdf23880ce63d7ecb866a9e08bff923d Mon Sep 17 00:00:00 2001
+From a5a0646f185a8062f6d257afba37f589a223b058 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
 Date: Sun, 26 May 2013 14:26:19 +0200
 Subject: [PATCH] qmltestexample: fix link
@@ -84,5 +84,5 @@ index 1bb913e..56f2dd5 100644
  
  load(qt_tool)
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 1cdbee5..e7f8871 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "d767254ee09e9fd773bd40c93395609ac8bbf7e6"
+SRCREV = "be6c91acc3ee5ebb8336b9e79df195662ac11788"
 
 LICENSE += "| GPL-2.0"
 LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index b73fa85..1923f87 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "fef13b3b4c1a8af83086ecf49430903778e63624"
+SRCREV = "9141782adabcfd374285c3a52b7c386b9b90aa9a"
 
 LICENSE += "| GPL-2.0"
 LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 133c188..35b06dd 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "eebf55a6919dff9eec4dd8529223aae6f6d0f569"
+SRCREV = "486874134b83672ae46bce315f632943829d5303"
 
 LICENSE += "| GPL-2.0"
 LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtmultimedia-git/0001-Initial-porting-effort-to-GStreamer-1.0.patch b/recipes-qt/qt5/qtmultimedia-git/0001-Initial-porting-effort-to-GStreamer-1.0.patch
index 5c12cbd..ab819f2 100644
--- a/recipes-qt/qt5/qtmultimedia-git/0001-Initial-porting-effort-to-GStreamer-1.0.patch
+++ b/recipes-qt/qt5/qtmultimedia-git/0001-Initial-porting-effort-to-GStreamer-1.0.patch
@@ -1,4 +1,4 @@
-From b16e42196969a6277e7b8902488fad1950a52d0d Mon Sep 17 00:00:00 2001
+From 4af76880d63e8d392eb8add8b8999e3f5031675a Mon Sep 17 00:00:00 2001
 From: Yoann Lopes <yoann.lopes@digia.com>
 Date: Thu, 31 Oct 2013 15:06:30 +0100
 Subject: [PATCH 1/2] Initial porting effort to GStreamer 1.0.
@@ -612,7 +612,7 @@ index 3ed539e..ed0ed3c 100644
 +
 +#endif
 diff --git a/src/gsttools/qgstappsrc.cpp b/src/gsttools/qgstappsrc.cpp
-index 148366b..cf9be45 100644
+index 561a96f..d5e106f 100644
 --- a/src/gsttools/qgstappsrc.cpp
 +++ b/src/gsttools/qgstappsrc.cpp
 @@ -147,23 +147,44 @@ void QGstAppSrc::pushDataToAppSrc()
@@ -1032,7 +1032,7 @@ index a373dcc..587b010 100644
  
          if (caps) {
 diff --git a/src/gsttools/qgstutils.cpp b/src/gsttools/qgstutils.cpp
-index 8d484aa..b0e377b 100644
+index 556fc03..5ea2c59 100644
 --- a/src/gsttools/qgstutils.cpp
 +++ b/src/gsttools/qgstutils.cpp
 @@ -89,8 +89,13 @@ static void addTagToMap(const GstTagList *list,
@@ -1083,7 +1083,7 @@ index 8d484aa..b0e377b 100644
  
  /*!
    Builds GstCaps for an audio format.
-@@ -564,7 +587,7 @@ int QGstUtils::cameraOrientation(const QString &device, GstElementFactory * fact
+@@ -579,7 +602,7 @@ QByteArray QGstUtils::cameraDriver(const QString &device, GstElementFactory *fac
  
  void qt_gst_object_ref_sink(gpointer object)
  {
@@ -1514,10 +1514,10 @@ index 81e5764..c9fdb5c 100644
      GstElement *m_videoSink;
      WId m_windowId;
 diff --git a/src/multimedia/gsttools_headers/qgstutils_p.h b/src/multimedia/gsttools_headers/qgstutils_p.h
-index 48434b2..96c23cb 100644
+index 65ff759..6015980 100644
 --- a/src/multimedia/gsttools_headers/qgstutils_p.h
 +++ b/src/multimedia/gsttools_headers/qgstutils_p.h
-@@ -72,7 +72,11 @@ namespace QGstUtils {
+@@ -73,7 +73,11 @@ namespace QGstUtils {
      QSize capsResolution(const GstCaps *caps);
      QSize capsCorrectedResolution(const GstCaps *caps);
      QAudioFormat audioFormatForCaps(const GstCaps *caps);
@@ -1689,10 +1689,10 @@ index f944a60..72d1cf1 100644
      if (m_duration != duration) {
          m_duration = duration;
 diff --git a/src/plugins/gstreamer/camerabin/camerabinsession.cpp b/src/plugins/gstreamer/camerabin/camerabinsession.cpp
-index 0197839..128ab58 100644
+index a4038c5..9d1fdfa 100644
 --- a/src/plugins/gstreamer/camerabin/camerabinsession.cpp
 +++ b/src/plugins/gstreamer/camerabin/camerabinsession.cpp
-@@ -728,7 +728,11 @@ qint64 CameraBinSession::duration() const
+@@ -760,7 +760,11 @@ qint64 CameraBinSession::duration() const
          if (fileSink) {
              GstFormat format = GST_FORMAT_TIME;
              gint64 duration = 0;
@@ -1704,7 +1704,7 @@ index 0197839..128ab58 100644
              gst_object_unref(GST_OBJECT(fileSink));
              if (ret)
                  return duration / 1000000;
-@@ -765,8 +769,13 @@ void CameraBinSession::setMetaData(const QMap<QByteArray, QVariant> &data)
+@@ -797,8 +801,13 @@ void CameraBinSession::setMetaData(const QMap<QByteArray, QVariant> &data)
  
      if (m_camerabin) {
          GstIterator *elements = gst_bin_iterate_all_by_interface(GST_BIN(m_camerabin), GST_TYPE_TAG_SETTER);
@@ -1718,7 +1718,7 @@ index 0197839..128ab58 100644
              gst_tag_setter_reset_tags(GST_TAG_SETTER(element));
  
              QMapIterator<QByteArray, QVariant> it(data);
-@@ -827,7 +836,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
+@@ -859,7 +868,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
  
      if (gm && GST_MESSAGE_TYPE(gm) == GST_MESSAGE_ELEMENT) {
          if (m_captureMode == QCamera::CaptureStillImage &&
@@ -1730,7 +1730,7 @@ index 0197839..128ab58 100644
              st = gst_message_get_structure(gm);
  
              if (gst_structure_has_field_typed(st, "buffer", GST_TYPE_BUFFER)) {
-@@ -837,7 +850,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
+@@ -869,7 +882,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
  
                      QImage img;
  
@@ -1742,7 +1742,7 @@ index 0197839..128ab58 100644
                      if (caps) {
                          GstStructure *structure = gst_caps_get_structure(caps, 0);
                          gint width = 0;
-@@ -1110,7 +1127,11 @@ QList< QPair<int,int> > CameraBinSession::supportedFrameRates(const QSize &frame
+@@ -1142,7 +1159,11 @@ QList< QPair<int,int> > CameraBinSession::supportedFrameRates(const QSize &frame
          gst_structure_remove_all_fields(structure);
          gst_structure_set_value(structure, "framerate", &rate);
      }
@@ -1754,7 +1754,7 @@ index 0197839..128ab58 100644
  
  
      for (uint i=0; i<gst_caps_get_size(caps); i++) {
-@@ -1230,7 +1251,11 @@ QList<QSize> CameraBinSession::supportedResolutions(QPair<int,int> rate,
+@@ -1262,7 +1283,11 @@ QList<QSize> CameraBinSession::supportedResolutions(QPair<int,int> rate,
          gst_structure_set_value(structure, "width", &w);
          gst_structure_set_value(structure, "height", &h);
      }
@@ -2365,5 +2365,5 @@ index f2e760a..50bda3d 100644
  
  QT_END_NAMESPACE
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtmultimedia-git/0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch b/recipes-qt/qt5/qtmultimedia-git/0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch
index d225d07..1654e00 100644
--- a/recipes-qt/qt5/qtmultimedia-git/0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch
+++ b/recipes-qt/qt5/qtmultimedia-git/0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch
@@ -1,4 +1,4 @@
-From 392d324d86e3b889acfce4f3469158dd942cc969 Mon Sep 17 00:00:00 2001
+From b5c058f62a79efa213e4492ac7209b3a92f45e3b Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 5 Jul 2014 09:10:02 +0200
 Subject: [PATCH 2/2] qtmultimedia.pro: Respect
@@ -49,5 +49,5 @@ index 109dd81..54b67a8 100644
              cache(GST_VERSION, set, gstver);
              # Force a re-run of the test
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index fc61cd3..65a83a0 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "b366a99eb14f166ebdcfcb6d328b4d7552227b71"
+SRCREV = "59f2bf186400241c62a02044265d9ecab81c1749"
 
 LICENSE += "| GPL-2.0"
 LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index 7beec5d..54cc990 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "61df13088c6c1d6a1b5a6d329dcc6879b33d69ba"
+SRCREV = "1f92491bd95abc642dcd882846884a5271c8ba16"
 
 LICENSE += "| GPL-2.0"
 LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index e0edf98..2e3b8b3 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "737379ad810d4431a93bed214f50b25632ba00e5"
+SRCREV = "3704a616dfabb71ebd3ffc64f8efe32931c82a8b"
 
 LICENSE += "| GPL-2.0"
 LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 445cf7a..8ef7f1d 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "9871b41531d632105f1d11e3a9683b05061177c1"
+SRCREV = "2bb2ebef4c86c588c3041569ffb090041ffc6b04"
 
 LICENSE += "| GPL-2.0"
 LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index 82a58bd..f3807af 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "3bb682ea29ffaf72ff73e6eb57abdc5c59524e8a"
+SRCREV = "ab51ad6a5f4e533c31bd8e5b6f16a3bcd09a3ee6"
 
 # text of LGPL_EXCEPTION.txt and LICENSE.FDL is slightly different than what
 # other qt* components use :/
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 64ae78e..e2c0410 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "9f1c31c8a3cfd0f341987e8011abad172592dd3c"
+SRCREV = "78dcdd807c06009460a949a7015b63f0f75ac61b"
 
 LICENSE += "| GPL-2.0"
 LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index ac2fc86..320bc7f 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -1,9 +1,9 @@
 require qt5-git.inc
 require ${PN}.inc
 
-QT_MODULE_BRANCH = "5.3"
+QT_MODULE_BRANCH = "dev"
 
 # qtsystems wasn't released yet, last tag before this SRCREV is 5.0.0-beta1
-# qt5-git PV is only to indicate that this recipe is compatible with qt5 5.2.1
+# qt5-git PV is only to indicate that this recipe is compatible with qt5 5.4
 
-SRCREV = "aa651c73bf7bc57c1b6b1bfcfa9afe901884a102"
+SRCREV = "3a0216301ad1338126abb326e8e4c22c6ea12f40"
diff --git a/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
index af431dc..e4ad221 100644
--- a/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
+++ b/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
@@ -1,4 +1,4 @@
-From f8476dd4e4069b4403f26b5ccd5c3d9d9402c7bd Mon Sep 17 00:00:00 2001
+From ff3f521648906d07ddc1e1aecaddadb95b0314f3 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.jansa@gmail.com>
 Date: Wed, 11 Sep 2013 18:30:08 +0200
 Subject: [PATCH 1/3] Allow to build only lrelease + lupdate + lconvert
@@ -151,5 +151,5 @@ index df240e3..27ee687 100644
  installed_cmake.depends = cmake
  
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch b/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch
index 764c3e5..5cc317c 100644
--- a/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch
+++ b/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch
@@ -1,4 +1,4 @@
-From d43c5a3759ceee4ba0e0e6d94c61d13850e142ec Mon Sep 17 00:00:00 2001
+From 20dd8d70eb3db17173eb3965e757711cc694de2a Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 17 Jan 2014 14:33:19 +0100
 Subject: [PATCH 2/3] assistant/help: fix linking of dependent libraries
@@ -28,5 +28,5 @@ index 168d23d..a9c3b59 100644
 +
 +LIBS += -lQt5CLucene
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch
index 535a24c..bf5957b 100644
--- a/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch
@@ -1,4 +1,4 @@
-From 5012d9057afa20e34aa8a36c195f87b89d0fbf8c Mon Sep 17 00:00:00 2001
+From 1d8bf41acc2235528f1d08505cf2dc8afd793aef Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
 Subject: [PATCH 3/3] add noqtwebkit configuration
@@ -47,5 +47,5 @@ index 500a153..b60fa2d 100644
  win32: qtHaveModule(axcontainer): SUBDIRS += activeqt
  qtHaveModule(quickwidgets): SUBDIRS += qquickwidget
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qttools-native_git.bb b/recipes-qt/qt5/qttools-native_git.bb
index fade625..ceb972b 100644
--- a/recipes-qt/qt5/qttools-native_git.bb
+++ b/recipes-qt/qt5/qttools-native_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "f3abe81d510bef5b984544a6d58551ce04cb8b48"
+SRCREV = "7e7d549d26028ff407a9a3d260955f95b403a406"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
                     file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index fade625..ceb972b 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "f3abe81d510bef5b984544a6d58551ce04cb8b48"
+SRCREV = "7e7d549d26028ff407a9a3d260955f95b403a406"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
                     file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
diff --git a/recipes-qt/qt5/qtwayland-git/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch b/recipes-qt/qt5/qtwayland-git/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
index 16433d5..ae3d998 100644
--- a/recipes-qt/qt5/qtwayland-git/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
+++ b/recipes-qt/qt5/qtwayland-git/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
@@ -1,4 +1,4 @@
-From 3cf60039ff1825c58bee5c79c66e7d12f4039fc7 Mon Sep 17 00:00:00 2001
+From 99c49a3304c1d08d164e0df252ca85f426381bb7 Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Fri, 19 Jul 2013 13:35:14 +0000
 Subject: [PATCH] Install the qtwaylandscanner tool to the native side
@@ -28,5 +28,5 @@ index ac2d07b..7a46a24 100644
 +target.path = $$[QT_HOST_BINS]
 +INSTALLS += target
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtwayland-git/0001-examples-wayland-include-server-buffer-only-when-bui.patch b/recipes-qt/qt5/qtwayland-git/0001-examples-wayland-include-server-buffer-only-when-bui.patch
index 1af124a..664fa3f 100644
--- a/recipes-qt/qt5/qtwayland-git/0001-examples-wayland-include-server-buffer-only-when-bui.patch
+++ b/recipes-qt/qt5/qtwayland-git/0001-examples-wayland-include-server-buffer-only-when-bui.patch
@@ -1,4 +1,4 @@
-From 9c98c0c411ecaf4cb95b76d0c07e72af75a8d7f0 Mon Sep 17 00:00:00 2001
+From cd1e17e8c6082fe8578d64baaff55f1f00c0f7a0 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 22 Feb 2014 17:47:44 +0100
 Subject: [PATCH] examples/wayland: include server-buffer only when building
@@ -27,5 +27,5 @@ index d633fb9..643c7cd 100644
 +    }
  }
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index f7d0466..da38195 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "c3d2a7bd8af4102441c113e088bd6a2cb50b97cf"
+SRCREV = "e47474cf91be5fa1d12bf329526d938be8293638"
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 3d53a32..1ce3043 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "c3d2a7bd8af4102441c113e088bd6a2cb50b97cf"
+SRCREV = "e47474cf91be5fa1d12bf329526d938be8293638"
 
 SRC_URI += " \
     file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
diff --git a/recipes-qt/qt5/qtwebengine-git/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch b/recipes-qt/qt5/qtwebengine-git/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
deleted file mode 100644
index 3e8d7ac..0000000
--- a/recipes-qt/qt5/qtwebengine-git/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 1e2fbd3bbf3eb94a4d78c53068bbb58d4227ab46 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Mon, 30 Jun 2014 20:08:17 +0200
-Subject: [PATCH 1/2] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
- anywhere in patch, but at the end
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- tools/qmake/mkspecs/features/functions.prf | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 02c3872..3b9babe 100644
---- a/tools/qmake/mkspecs/features/functions.prf
-+++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -61,8 +61,8 @@ defineReplace(findIncludedMocFiles) {
- defineReplace(mocOutput) {
-   out = $$1
-   # The order is important, since the output of the second replace would end up accidentaly transformed by the first one
--  out = $$replace(out, ^(.*)($$join(QMAKE_EXT_CPP,|)), $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
--  out = $$replace(out, ^(.*)($$join(QMAKE_EXT_H,|)), $${QMAKE_H_MOD_MOC}\\1$${first(QMAKE_EXT_CPP)})
-+  out = $$replace(out, ^(.*)($$join(QMAKE_EXT_CPP,|))$, $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
-+  out = $$replace(out, ^(.*)($$join(QMAKE_EXT_H,|))$, $${QMAKE_H_MOD_MOC}\\1$${first(QMAKE_EXT_CPP)})
-   return($$out)
- }
- 
--- 
-2.1.1
-
diff --git a/recipes-qt/qt5/qtwebengine-git/0002-functions.prf-Try-to-add-_moc-suffix.patch b/recipes-qt/qt5/qtwebengine-git/0002-functions.prf-Try-to-add-_moc-suffix.patch
deleted file mode 100644
index 646d2a6..0000000
--- a/recipes-qt/qt5/qtwebengine-git/0002-functions.prf-Try-to-add-_moc-suffix.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 4fd50d344ad5e7f89e538222605dd50d0f636d3a Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Tue, 1 Jul 2014 15:58:16 +0200
-Subject: [PATCH 2/2] functions.prf: Try to add _moc suffix
-
-* otherwise moc generated files have the same basename and do_configure fails with:
-  core_generated.gyp:QtWebEngineCore#target has several files with the same basename:
-  |   javascript_dialog_controller: javascript_dialog_controller.cpp
-  | /OE/build/oe-core/tmp-eglibc/work/i586-oe-linux/qtwebengine/0.9.99+gitAUTOINC+21f6ce84ec-r0/git/src/core/.moc/moc_/OE/build/oe-core/tmp-eglibc/work/i586-oe-linux/qtwebengine/0.9.99+gitAUTOI.moc+21f6ce84ec-r0/git/src/core/javascript_dialog_controller.cpp
-  ...
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- tools/qmake/mkspecs/features/functions.prf | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 3b9babe..6d691df 100644
---- a/tools/qmake/mkspecs/features/functions.prf
-+++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -61,8 +61,8 @@ defineReplace(findIncludedMocFiles) {
- defineReplace(mocOutput) {
-   out = $$1
-   # The order is important, since the output of the second replace would end up accidentaly transformed by the first one
--  out = $$replace(out, ^(.*)($$join(QMAKE_EXT_CPP,|))$, $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
--  out = $$replace(out, ^(.*)($$join(QMAKE_EXT_H,|))$, $${QMAKE_H_MOD_MOC}\\1$${first(QMAKE_EXT_CPP)})
-+  out = $$replace(out, ^(.*)($$join(QMAKE_EXT_CPP,|))$, $${QMAKE_CPP_MOD_MOC}\\1_moc$${QMAKE_EXT_CPP_MOC})
-+  out = $$replace(out, ^(.*)($$join(QMAKE_EXT_H,|))$, $${QMAKE_H_MOD_MOC}\\1_moc$${first(QMAKE_EXT_CPP)})
-   return($$out)
- }
- 
--- 
-2.1.1
-
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index a2f685a..23a8ce4 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -1,19 +1,16 @@
 require qt5-git.inc
 require ${PN}.inc
 
-QT_MODULE_BRANCH = "1.0"
-QT_MODULE_BRANCH_CHROMIUM = "33.0.1750.170-based"
+QT_MODULE_BRANCH = "5.4"
+QT_MODULE_BRANCH_CHROMIUM = "37.0.2062-based"
 
 SRC_URI += " \
     git://gitorious.org/qt/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};destsuffix=git/src/3rdparty \
     file://0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
     file://0002-functions.prf-Try-to-add-_moc-suffix.patch \
-    file://0001-chromium-Drop-build-time-only-dependency-on-x11-libr.patch \
-    file://0002-chromium-Strip-unwanted-echo-compiling-prefix-from-C.patch \
-    file://0003-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch \
 "
-SRCREV_qtwebengine = "14fcf0d3193e2ee2bf904a305c9f34ff8d0e5ce7"
-SRCREV_chromium = "1f3cc8c2618979b557d60ef1ad984a49dca83bff"
+SRCREV_qtwebengine = "aa1b2d20a80f53ce5e7f6097114d41a018d9350b"
+SRCREV_chromium = "66388297cf2ca42049fb099237134ec33465e2f5"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine"
diff --git a/recipes-qt/qt5/qtwebkit-git/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/recipes-qt/qt5/qtwebkit-git/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
index 2c471be..3c6c4d3 100644
--- a/recipes-qt/qt5/qtwebkit-git/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
+++ b/recipes-qt/qt5/qtwebkit-git/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
@@ -1,4 +1,4 @@
-From a7d860fbc194c46591016ba41e138eadc1e50d84 Mon Sep 17 00:00:00 2001
+From 83a7ef8c92b4363bd0aa372c804858c5882db0af Mon Sep 17 00:00:00 2001
 From: Trevor Woerner <trevor.woerner@linaro.org>
 Date: Fri, 7 Feb 2014 04:07:17 +0100
 Subject: [PATCH] qtwebkit: fix QA issue (bad RPATH)
@@ -26,5 +26,5 @@ index 9c52406..a68a101 100644
  CONFIG(debug, debug|release)|force_debug_info {
      # Make ld not cache the symbol tables of input files in memory to avoid memory exhaustion during the linking phase.
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index a4973e0..0446d38 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -3,7 +3,7 @@ require ${PN}.inc
 
 DEPENDS += "leveldb"
 
-SRCREV = "7778f881ff7dc92fca44dd414b02e7345f8db930"
+SRCREV = "18cb1a3ae907d76da9eb8c54528cf3bcb074d0e5"
 
 LICENSE += "| GPL-2.0"
 LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index d68a523..5939e89 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "0854eda408de542047a0ef38c37953719a8f9fde"
+SRCREV = "64927e04f202d33b9a9a1f94141ef692c0b513ac"
 
 LICENSE += "| GPL-2.0"
 LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index 92390ba..5be8f81 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "045028f951959dc217a0fc1c19f014989bfaaa1f"
+SRCREV = "2e8b90b33d1d8dce4acdb6a116a227f2a5d3e044"
 
 LICENSE += "| GPL-2.0"
 LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
-- 
2.1.3


