Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 55AB273D8E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2015 14:16:26 +0000 (UTC)
Received: by wizk4 with SMTP id k4so23545649wiz.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2015 07:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=XL9c2IMuILwMa0Om9upsb9my9YLqOnbgYaXc5GPWNOk=;
	b=J8Km4K08WQZqRtA6wrW1vHb/kdLN/uHgcOZnUX1wieZxolYPoci8MFRuKwN+8my8TT
	LhdbdpW88YzuNPuX6cdrl+qzEm9QcId9+i4sm+Ssei/LVMpTt25pmfGoh21AqA/DQH9M
	fmQ0Ao3mIhAR65ftn8XuZxlqtFhfgrqkRlag/I8ehiyosamEwMQ8fl1qhjHQM1RJ6H7D
	Nn53bfOMelcNHk5YCUhDaSGkyKjfZF0Q3Jt3oZ0eIROm9T4+F7CfZGbnSwHOe3NWKtir
	2Y7LidLt52nSBQtSudOb1iZ21RUJF1IMI3D7D7PTX8xbeSjLpiTR+J2n6uptd1AVUzRZ
	VxEw==
X-Received: by 10.194.95.4 with SMTP id dg4mr6259063wjb.81.1429280187641;
	Fri, 17 Apr 2015 07:16:27 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id l1sm2835371wiy.20.2015.04.17.07.16.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Apr 2015 07:16:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Apr 2015 16:16:44 +0200
Message-Id: <1429280204-27191-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1429280204-27191-1-git-send-email-Martin.Jansa@gmail.com>
References: <1429280204-27191-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-qt5][WIP][PATCH 3/3] WIP: recipes-git: upgrade to latest revision in 5.5 branch
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
X-List-Received-Date: Fri, 17 Apr 2015 14:16:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* this gets us close to 5.5 beta release

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |   18 +-
 recipes-qt/qt5/nativesdk-qttools_git.bb            |    2 +-
 recipes-qt/qt5/qt5-git.inc                         |    4 +-
 .../qtbase-git/0001-Add-linux-oe-g-platform.patch  |   39 +-
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |   16 +-
 .../0003-Add-external-hostbindir-option.patch      |   30 +-
 ...le-Fix-pkgconfig-and-libtool-replacements.patch |   34 +-
 ...lfs-Print-the-chosen-config-in-debug-mode.patch |   97 -
 ...integration-Undefine-CursorShape-from-X..patch} |    8 +-
 ...ump-path-length-from-256-to-512-character.patch |   29 +
 ...ump-path-length-from-256-to-512-character.patch |   29 -
 ...l-error-for-platforms-only-supporting-on.patch} |   10 +-
 ...0008-QOpenGLPaintDevice-sub-area-support.patch} |   24 +-
 ...build-uic.patch => 0009-Always-build-uic.patch} |    8 +-
 ...xternal-hostbindir-option-for-native-sdk.patch} |   38 +-
 ...ConfigExtras.cmake-find-gl-es-include-dir.patch |   42 -
 ...eserve-built-qmake-and-swap-with-native-.patch} |   12 +-
 ...-build-it-in-configure-but-allow-to-build.patch |   68 -
 .../0012-Set-paths-for-target-properly.patch       |   72 -
 recipes-qt/qt5/qtbase-native_git.bb                |   16 +-
 recipes-qt/qt5/qtbase_git.bb                       |   19 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |    2 +-
 .../0001-qmltestexample-fix-link.patch             |    2 +-
 recipes-qt/qt5/qtdeclarative_git.bb                |    2 +-
 recipes-qt/qt5/qtenginio_git.bb                    |    4 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |    2 +-
 ...ats.pro-Make-the-dependencies-determinist.patch |    2 +-
 recipes-qt/qt5/qtimageformats_git.bb               |    2 +-
 recipes-qt/qt5/qtlocation_git.bb                   |    2 +-
 ...1-Initial-porting-effort-to-GStreamer-1.0.patch | 2375 +-------------------
 recipes-qt/qt5/qtmultimedia_git.bb                 |    2 +-
 recipes-qt/qt5/qtquick1_git.bb                     |    2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |    2 +-
 recipes-qt/qt5/qtscript_git.bb                     |    2 +-
 recipes-qt/qt5/qtsensors_git.bb                    |    2 +-
 .../0001-Unix-Clear-serial_struct-instances.patch  |   42 -
 recipes-qt/qt5/qtserialport.inc                    |    4 -
 recipes-qt/qt5/qtserialport_5.4.1.bb               |    4 +
 recipes-qt/qt5/qtserialport_git.bb                 |    2 +-
 recipes-qt/qt5/qtsvg_git.bb                        |    2 +-
 ...w-to-build-only-lrelease-lupdate-lconvert.patch |   22 +-
 ...t-help-fix-linking-of-dependent-libraries.patch |    2 +-
 .../0003-add-noqtwebkit-configuration.patch        |   20 +-
 recipes-qt/qt5/qttools-native_git.bb               |    2 +-
 recipes-qt/qt5/qttools_git.bb                      |    2 +-
 recipes-qt/qt5/qttranslations_git.bb               |    2 +-
 ...-qtwaylandscanner-tool-to-the-native-side.patch |    4 +-
 ...yland-include-server-buffer-only-when-bui.patch |    2 +-
 recipes-qt/qt5/qtwayland-native_git.bb             |    2 +-
 recipes-qt/qt5/qtwayland_git.bb                    |    2 +-
 recipes-qt/qt5/qtwebchannel_git.bb                 |    2 +-
 ...se.gypi-include-atomicops_internals_x86_g.patch |    4 +-
 ...rf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch |   17 +-
 ...rf-Make-sure-we-only-use-the-file-name-to.patch |   10 +-
 ...s.prf-allow-build-for-linux-oe-g-platform.patch |    6 +-
 recipes-qt/qt5/qtwebengine_git.bb                  |    7 +-
 ...amples-enable-building-examples-by-defaul.patch |    2 +-
 recipes-qt/qt5/qtwebkit-examples_git.bb            |    2 +-
 .../0001-qtwebkit-fix-QA-issue-bad-RPATH.patch     |    2 +-
 .../0002-Remove-TEXTREL-tag-in-x86.patch           |    2 +-
 recipes-qt/qt5/qtwebkit_git.bb                     |    2 +-
 recipes-qt/qt5/qtwebsockets_git.bb                 |    2 +-
 recipes-qt/qt5/qtx11extras_git.bb                  |    2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |    2 +-
 64 files changed, 266 insertions(+), 2928 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtbase-git/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
 rename recipes-qt/qt5/qtbase-git/{0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch => 0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch} (82%)
 create mode 100644 recipes-qt/qt5/qtbase-git/0006-configure-bump-path-length-from-256-to-512-character.patch
 delete mode 100644 recipes-qt/qt5/qtbase-git/0007-configure-bump-path-length-from-256-to-512-character.patch
 rename recipes-qt/qt5/qtbase-git/{0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch => 0007-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch} (89%)
 rename recipes-qt/qt5/qtbase-git/{0009-QOpenGLPaintDevice-sub-area-support.patch => 0008-QOpenGLPaintDevice-sub-area-support.patch} (89%)
 rename recipes-qt/qt5/qtbase-git/{0011-Always-build-uic.patch => 0009-Always-build-uic.patch} (77%)
 rename recipes-qt/qt5/qtbase-git/{0012-Add-external-hostbindir-option-for-native-sdk.patch => 0010-Add-external-hostbindir-option-for-native-sdk.patch} (71%)
 delete mode 100644 recipes-qt/qt5/qtbase-git/0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch
 rename recipes-qt/qt5/qtbase-git/{0013-configure-preserve-built-qmake-and-swap-with-native-.patch => 0011-configure-preserve-built-qmake-and-swap-with-native-.patch} (69%)
 delete mode 100644 recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
 delete mode 100644 recipes-qt/qt5/qtbase-git/0012-Set-paths-for-target-properly.patch
 delete mode 100644 recipes-qt/qt5/qtserialport-git/0001-Unix-Clear-serial_struct-instances.patch

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index b120733..8b733b8 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -14,23 +14,21 @@ SRC_URI += "\
     file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
     file://0003-Add-external-hostbindir-option.patch \
     file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
-    file://0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
-    file://0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
-    file://0007-configure-bump-path-length-from-256-to-512-character.patch \
-    file://0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
-    file://0009-QOpenGLPaintDevice-sub-area-support.patch \
-    file://0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch \
+    file://0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
+    file://0006-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0007-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
+    file://0008-QOpenGLPaintDevice-sub-area-support.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
-    file://0011-Always-build-uic.patch \
-    file://0012-Add-external-hostbindir-option-for-native-sdk.patch \
+    file://0009-Always-build-uic.patch \
+    file://0010-Add-external-hostbindir-option-for-native-sdk.patch \
 "
 
 # specific for nativesdk-qtbase
 SRC_URI += " \
-    file://0013-configure-preserve-built-qmake-and-swap-with-native-.patch \
+    file://0011-configure-preserve-built-qmake-and-swap-with-native-.patch \
 "
 
 # CMake's toolchain configuration of nativesdk-qtbase
@@ -38,7 +36,7 @@ SRC_URI += " \
     file://OEQt5Toolchain.cmake \
 "
 
-SRCREV = "f58e882b7594c59b6050d3c87562fcf836d10f60"
+SRCREV = "4f8171998378f3e0f345b2b417afbfc9ad9738f0"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
                     file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
diff --git a/recipes-qt/qt5/nativesdk-qttools_git.bb b/recipes-qt/qt5/nativesdk-qttools_git.bb
index 7ce1747..7ce885f 100644
--- a/recipes-qt/qt5/nativesdk-qttools_git.bb
+++ b/recipes-qt/qt5/nativesdk-qttools_git.bb
@@ -4,7 +4,7 @@ require ${PN}.inc
 # prepend this again, because ${PN}.inc prepends ${PN}
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
 
-SRCREV = "7f5b11a4a6357d2969e5b24bfb25c47aeb3d99f5"
+SRCREV = "975763169166961f66826998ac44d88ffe3e535e"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
                     file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index e90256e..4658981 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -1,7 +1,7 @@
 # Copyright (C) 2012 O.S. Systems Software LTDA.
 # Copyright (C) 2013-2014 Martin Jansa <martin.jansa@gmail.com>
 
-QT_MODULE_BRANCH ?= "5.4"
+QT_MODULE_BRANCH ?= "5.5"
 
 # each module needs to define valid SRCREV
 SRC_URI += " \
@@ -10,7 +10,7 @@ SRC_URI += " \
 
 S = "${WORKDIR}/git"
 
-PV = "5.4.1+git${SRCPV}"
+PV = "5.4.99+git${SRCPV}"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
 
diff --git a/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
index f34aed4..55d7ab8 100644
--- a/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
@@ -1,7 +1,7 @@
-From 08f6be97c3f088fd8a2d752441c638093eedd990 Mon Sep 17 00:00:00 2001
+From 1b738a83668aaadd720be2e54920d55e9421d8e1 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
-Subject: [PATCH 01/12] Add linux-oe-g++ platform
+Subject: [PATCH 1/8] Add linux-oe-g++ platform
 
 * This qmake.conf unlike other platforms reads most variables from
   shell environment, because it's easier for qt recipes to export
@@ -43,19 +43,19 @@ Upstream-Status: Inappropriate [embedded specific]
 Change-Id: I0591ed5da0d61d7cf1509d420e6b293582f1863c
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- configure                            |  66 ++++++++++++++++-------
+ configure                            |  70 +++++++++++++++---------
  mkspecs/features/configure.prf       |   4 +-
  mkspecs/linux-oe-g++/qmake.conf      |  40 ++++++++++++++
  mkspecs/linux-oe-g++/qplatformdefs.h | 100 +++++++++++++++++++++++++++++++++++
- 4 files changed, 188 insertions(+), 22 deletions(-)
+ 4 files changed, 186 insertions(+), 28 deletions(-)
  create mode 100644 mkspecs/linux-oe-g++/qmake.conf
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
 diff --git a/configure b/configure
-index 6ce6753..0a00d6d 100755
+index 4addf22..e618264 100755
 --- a/configure
 +++ b/configure
-@@ -316,6 +316,16 @@ getQMakeConf()
+@@ -342,6 +342,16 @@ getQMakeConf()
      getSingleQMakeVariable "$1" "$specvals"
  }
  
@@ -72,7 +72,7 @@ index 6ce6753..0a00d6d 100755
  getXQMakeConf()
  {
      if [ -z "$xspecvals" ]; then
-@@ -325,6 +335,16 @@ getXQMakeConf()
+@@ -351,6 +361,16 @@ getXQMakeConf()
      getSingleQMakeVariable "$1" "$xspecvals"
  }
  
@@ -89,37 +89,38 @@ index 6ce6753..0a00d6d 100755
  compilerSupportsFlag()
  {
      cat >conftest.cpp <<EOF
-@@ -541,21 +561,19 @@ fi
+@@ -561,24 +581,14 @@ fi
  # initalize variables
  #-------------------------------------------------------------------------------
  
--SYSTEM_VARIABLES="RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS LDFLAGS"
+-SYSTEM_VARIABLES="AR RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS LDFLAGS"
 -for varname in $SYSTEM_VARIABLES; do
 +# Export all OE variables for qmake.conf from shell env to QMakeVars
 +OE_VARIABLES="AR CC CFLAGS COMPILER CXX CXXFLAGS LDFLAGS LINK QT_CONFIG STRIP"
 +for varname in $OE_VARIABLES; do
      qmakevarname="${varname}"
+-    qmakecmdargs=""
 -    # use LDFLAGS for autoconf compat, but qmake uses QMAKE_LFLAGS
 -    if [ "${varname}" = "LDFLAGS" ]; then
 -        qmakevarname="LFLAGS"
 -    elif [ "${varname}" = "LD" ]; then
 -        qmakevarname="LINK"
+-    elif [ "${varname}" = "AR" ]; then
+-        # QMAKE_AR needs to be set to "/path/to/ar cqs" but the
+-        # environment variable will be set to the command only so we
+-        # need to append " cqs" for autoconf compatibility
+-        qmakecmdargs=" cqs"
 -    fi
      cmd=`echo \
 -'if [ -n "\$'${varname}'" ]; then
--    QMakeVar set QMAKE_'${qmakevarname}' "\$'${varname}'"
+-    QMakeVar set QMAKE_'${qmakevarname}' "\$'${varname}${qmakecmdargs}'"
 +'if [ -n "\$OE_QMAKE_'${varname}'" ]; then
 +    QMakeVar set OE_QMAKE_'${qmakevarname}' "\$OE_QMAKE_'${varname}'"
 +#    echo "Exporting OE_QMAKE_'${qmakevarname}' value=\"\$OE_QMAKE_'${varname}'\"" >&2
  fi'`
      eval "$cmd"
  done
-+
-+SYSTEM_VARIABLES="RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS LDFLAGS"
- # Use CC/CXX to run config.tests
- mkdir -p "$outpath/config.tests"
- rm -f "$outpath/config.tests/.qmake.cache"
-@@ -3178,7 +3196,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
+@@ -3311,7 +3321,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
      [ "$CFG_QGTKSTYLE" = "auto" ] && CFG_QGTKSTYLE=no
  fi
  
@@ -128,7 +129,7 @@ index 6ce6753..0a00d6d 100755
  
  TEST_COMPILER=$QMAKE_CONF_COMPILER
  
-@@ -3216,7 +3234,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
+@@ -3368,7 +3378,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
          exit 1
      fi
  fi
@@ -137,7 +138,7 @@ index 6ce6753..0a00d6d 100755
  
  GCC_MACHINE_DUMP=
  case "$TEST_COMPILER" in *g++) GCC_MACHINE_DUMP=$($TEST_COMPILER -dumpmachine);; esac
-@@ -3687,6 +3705,14 @@ setBootstrapVariable()
+@@ -3863,6 +3873,14 @@ setBootstrapVariable()
      getQMakeConf "$1" | echo ${2-$1} = `if [ -n "$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
  }
  
@@ -152,7 +153,7 @@ index 6ce6753..0a00d6d 100755
  # build qmake
  if true; then ###[ '!' -f "$outpath/bin/qmake" ];
      echo "Creating qmake..."
-@@ -3725,14 +3751,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+@@ -3901,14 +3919,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
          fi
  
          [ "$CFG_SILENT" = "yes" ] && CC_TRANSFORM='s,^,\@,' || CC_TRANSFORM=
diff --git a/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index ec2bcb4..7db3cea 100644
--- a/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,8 +1,8 @@
-From 31fa051d53e26301ef6abf72bd3f992d7c16cad2 Mon Sep 17 00:00:00 2001
+From c64f7074591b3e0cdafbbf285f7f139d15895fcb Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
-Subject: [PATCH 02/12] qlibraryinfo: allow to set qt.conf from the outside
- using the environment
+Subject: [PATCH 2/8] qlibraryinfo: allow to set qt.conf from the outside using
+ the environment
 
 Allow to set a qt.conf from the outside using the environment. This allows
 to inject new prefixes and other paths into qmake. This is needed when using
@@ -19,10 +19,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index d66007b..91ca643 100644
+index 2912e68..f663c88 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -138,7 +138,10 @@ QLibrarySettings::QLibrarySettings()
+@@ -157,7 +157,10 @@ void QLibrarySettings::load()
  
  QSettings *QLibraryInfoPrivate::findConfiguration()
  {
@@ -31,9 +31,9 @@ index d66007b..91ca643 100644
 +    QString qtconfig = QFile::decodeName(config);
 +    if(!QFile::exists(qtconfig))
 +        qtconfig = QStringLiteral(":/qt/etc/qt.conf");
- #ifdef QT_BOOTSTRAPPED
-     if(!QFile::exists(qtconfig))
-         qtconfig = qt_libraryInfoFile();
+     if (QFile::exists(qtconfig))
+         return new QSettings(qtconfig, QSettings::IniFormat);
+ #ifdef QT_BUILD_QMAKE
 -- 
 2.3.5
 
diff --git a/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
index 779ea91..6a9c345 100644
--- a/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
@@ -1,7 +1,7 @@
-From cf4e996876e0b467b7aae124c7cb285f677bf6b0 Mon Sep 17 00:00:00 2001
+From 33fcab1583dd4bed1399d92182ba26fc90edf9db Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH 03/12] Add -external-hostbindir option
+Subject: [PATCH 3/8] Add -external-hostbindir option
 
 * when cross-compiling it's sometimes useful to use existing tools from machine
   (or in OpenEmbedded built with separate native recipe) when building for target
@@ -24,20 +24,20 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 Signed-off-by: Simon Busch <morphis@gravedo.de>
 Signed-off-by: Jonathan Liu <net147@gmail.com>
 ---
- configure                                   | 15 +++++++++++++++
+ configure                                   | 14 ++++++++++++++
  mkspecs/features/qt_functions.prf           |  6 +++++-
  mkspecs/features/qt_tool.prf                |  4 ++--
  qtbase.pro                                  | 13 ++++++++++---
  src/corelib/Qt5CoreConfigExtras.cmake.in    |  6 +++---
  src/dbus/Qt5DBusConfigExtras.cmake.in       |  4 ++--
  src/widgets/Qt5WidgetsConfigExtras.cmake.in |  2 +-
- 7 files changed, 38 insertions(+), 12 deletions(-)
+ 7 files changed, 37 insertions(+), 12 deletions(-)
 
 diff --git a/configure b/configure
-index 0a00d6d..ad5f4cd 100755
+index e618264..2877b77 100755
 --- a/configure
 +++ b/configure
-@@ -770,6 +770,7 @@ QT_HOST_BINS=
+@@ -801,6 +801,7 @@ QT_HOST_BINS=
  QT_HOST_LIBS=
  QT_HOST_DATA=
  QT_EXT_PREFIX=
@@ -45,7 +45,7 @@ index 0a00d6d..ad5f4cd 100755
  
  #flags for SQL drivers
  QT_CFLAGS_PSQL=
-@@ -889,6 +890,7 @@ while [ "$#" -gt 0 ]; do
+@@ -920,6 +921,7 @@ while [ "$#" -gt 0 ]; do
      -testsdir| \
      -hostdatadir| \
      -hostbindir| \
@@ -53,7 +53,7 @@ index 0a00d6d..ad5f4cd 100755
      -hostlibdir| \
      -extprefix| \
      -sysroot| \
-@@ -1107,6 +1109,9 @@ while [ "$#" -gt 0 ]; do
+@@ -1149,6 +1151,9 @@ while [ "$#" -gt 0 ]; do
      extprefix)
          QT_EXT_PREFIX="$VAL"
          ;;
@@ -63,7 +63,7 @@ index 0a00d6d..ad5f4cd 100755
      pkg-config)
          if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
              CFG_PKGCONFIG="$VAL"
-@@ -2270,6 +2275,10 @@ Installation options:
+@@ -2368,6 +2373,10 @@ Installation options:
      -hostdatadir <dir> . Data used by qmake will be installed to <dir>
                           (default HOSTPREFIX)
  
@@ -74,7 +74,7 @@ index 0a00d6d..ad5f4cd 100755
  Configure options:
  
   The defaults (*) are usually acceptable. A plus (+) denotes a default value
-@@ -2949,6 +2958,11 @@ fi
+@@ -3071,6 +3080,11 @@ fi
  # command line and environment validation
  #-------------------------------------------------------------------------------
  
@@ -86,16 +86,8 @@ index 0a00d6d..ad5f4cd 100755
  # update QT_CONFIG to show our current predefined configuration
  CFG_QCONFIG_PATH=$relpath/src/corelib/global/qconfig-${CFG_QCONFIG}.h
  case "$CFG_QCONFIG" in
-@@ -3649,6 +3663,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
-     "qt_hbinpath=$QT_HOST_BINS",
-     "qt_hlibpath=$QT_HOST_LIBS",
-     "qt_hdatpath=$QT_HOST_DATA",
-+    "qt_ebinpath=$QT_EXTERNAL_HOST_BINS",
-     "qt_targspec=$shortxspec",
-     "qt_hostspec=$shortspec",
- #endif
 diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
-index 79b4eab..8c6913e 100644
+index 78be2e8..b443e96 100644
 --- a/mkspecs/features/qt_functions.prf
 +++ b/mkspecs/features/qt_functions.prf
 @@ -198,7 +198,11 @@ defineTest(qtAddRpathLink) {
diff --git a/recipes-qt/qt5/qtbase-git/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase-git/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
index c586775..f1539da 100644
--- a/recipes-qt/qt5/qtbase-git/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ b/recipes-qt/qt5/qtbase-git/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -1,7 +1,7 @@
-From bf9f8df42f5a7ac4a0cb4bdad8c849228aa79b35 Mon Sep 17 00:00:00 2001
+From 8f42d3a19aa12f8674946b96cd7465147b24b814 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
-Subject: [PATCH 04/12] qt_module: Fix pkgconfig and libtool replacements
+Subject: [PATCH 4/8] qt_module: Fix pkgconfig and libtool replacements
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -63,29 +63,29 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
  mkspecs/features/qt_common.prf |  2 +-
- mkspecs/features/qt_module.prf | 15 +++++++++++++++
- 2 files changed, 16 insertions(+), 1 deletion(-)
+ mkspecs/features/qt_module.prf | 10 ++++++++++
+ 2 files changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_common.prf
-index eb65e73..4db40d0 100644
+index 6a66b76..fc3594e 100644
 --- a/mkspecs/features/qt_common.prf
 +++ b/mkspecs/features/qt_common.prf
-@@ -33,7 +33,7 @@ contains(TEMPLATE, .*lib) {
+@@ -36,7 +36,7 @@ contains(TEMPLATE, .*lib) {
          lib_replace.replace =
      } else {
          lib_replace.match = $$rplbase/lib
--        lib_replace.replace = $$qt_libdir
+-        lib_replace.replace = $$qqt_libdir
 +        lib_replace.replace = "\$$\\{libdir}"
      }
      lib_replace.CONFIG = path
      QMAKE_PRL_INSTALL_REPLACE += lib_replace
 diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_module.prf
-index 2437efe..2e1f014 100644
+index b85dbfb..21605a4 100644
 --- a/mkspecs/features/qt_module.prf
 +++ b/mkspecs/features/qt_module.prf
-@@ -192,10 +192,25 @@ unix|mingw {
-         QMAKE_PKGCONFIG_DESCRIPTION = $$replace(TARGET, ^Qt, "Qt ") module
-     QMAKE_PKGCONFIG_INSTALL_REPLACE += lib_replace
+@@ -199,6 +199,11 @@ unix|mingw {
+     pclib_replace.CONFIG = path
+     QMAKE_PKGCONFIG_INSTALL_REPLACE += pclib_replace
  
 +    pkgconfig_include_replace.match = $$rplbase/include
 +    pkgconfig_include_replace.replace = "\$$\\{includedir}"
@@ -94,13 +94,11 @@ index 2437efe..2e1f014 100644
 +
      unix {
          CONFIG += create_libtool explicitlib
-         QMAKE_LIBTOOL_LIBDIR = $$qt_libdir
-         QMAKE_LIBTOOL_INSTALL_REPLACE += lib_replace
-+        # add '=' as sysroot in .la files
-+        lafile_replace.match = "-L\$${libdir}"
-+        lafile_replace.replace = "-L=\$$\\{libdir}"
-+        lafile_replace.CONFIG = path
-+        QMAKE_LIBTOOL_INSTALL_REPLACE += lafile_replace
+         host_build: \
+@@ -210,6 +215,11 @@ unix|mingw {
+             ltlib_replace.replace = $$QMAKE_LIBTOOL_LIBDIR
+         ltlib_replace.CONFIG = path
+         QMAKE_LIBTOOL_INSTALL_REPLACE += ltlib_replace
 +        # drop -L/usr/lib in .prl files
 +        prl_replace.match = "-L\$${libdir}"
 +        prl_replace.replace = ""
diff --git a/recipes-qt/qt5/qtbase-git/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch b/recipes-qt/qt5/qtbase-git/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
deleted file mode 100644
index 9723bea..0000000
--- a/recipes-qt/qt5/qtbase-git/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From f8a4e063b45b5b941738dd90ea7c74063bc1e49f Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Mon, 21 Apr 2014 19:22:04 +0200
-Subject: [PATCH 05/12] Revert "eglfs: Print the chosen config in debug mode"
-
-With this change the build is failing with:
-| In file included from /OE/build/oe-core/tmp-glibc/sysroots/qemux86-64/usr/include/EGL/eglplatform.h:118:0,
-|                  from /OE/build/oe-core/tmp-glibc/sysroots/qemux86-64/usr/include/EGL/egl.h:36,
-|                  from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformcontext_p.h:51,
-|                  from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformcontext.cpp:34:
-| ../../include/QtCore/../../../git/src/corelib/io/qtextstream.h:72:10: error: expected identifier before 'int'
-|      enum Status {
-|           ^
-| In file included from ../../include/QtCore/qtextstream.h:1:0,
-|                  from ../../include/QtCore/../../../git/src/corelib/io/qdebug.h:42,
-|                  from ../../include/QtCore/qdebug.h:1,
-|                  from ../../include/QtCore/QDebug:1,
-|                  from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformcontext.cpp:40:
-| ../../include/QtCore/../../../git/src/corelib/io/qtextstream.h:72:17: error: expected unqualified-id before '{' token
-|      enum Status {
-|                  ^
-| Makefile:3896: recipe for target '.obj/qeglplatformcontext.o' failed
-| make[2]: *** [.obj/qeglplatformcontext.o] Error 1
-| make[2]: *** Waiting for unfinished jobs....
-| /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformintegration.cpp:196:5: error: 'Display' redeclared as different kind of symbol
-|      Display
-|      ^
-| In file included from /OE/build/oe-core/tmp-glibc/sysroots/qemux86-64/usr/include/EGL/eglplatform.h:118:0,
-|                  from /OE/build/oe-core/tmp-glibc/sysroots/qemux86-64/usr/include/EGL/egl.h:36,
-|                  from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformintegration_p.h:51,
-|                  from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformintegration.cpp:55:
-| /OE/build/oe-core/tmp-glibc/sysroots/qemux86-64/usr/include/X11/Xlib.h:499:26: note: previous declaration 'typedef struct _XDisplay Display'
-|  typedef struct _XDisplay Display;
-|                           ^
-| /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformintegration.cpp: In member function 'virtual void* QEGLPlatformIntegration::nativeResourceForScreen(const QByteArray&, QScreen*)':
-| /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformintegration.cpp:239:17: error: expected primary-expression before ':' token
-|      case Display:
-|                  ^
-| Makefile:5486: recipe for target '.obj/qeglplatformintegration.o' failed
-
-This reverts commit dc685cf6331f5fb46285cf10d6464c2ecf41f73e.
-
-Will be partially resolved in newer revision with:
-https://codereview.qt-project.org/96220
-
-Change-Id: I7a6a926b7525d4f137824c71f2ec8cd089c21f13
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/platformsupport/eglconvenience/qeglconvenience.cpp     | 4 +++-
- src/platformsupport/eglconvenience/qeglplatformcontext.cpp | 7 -------
- 2 files changed, 3 insertions(+), 8 deletions(-)
-
-diff --git a/src/platformsupport/eglconvenience/qeglconvenience.cpp b/src/platformsupport/eglconvenience/qeglconvenience.cpp
-index c1a491c..7a0fc87 100644
---- a/src/platformsupport/eglconvenience/qeglconvenience.cpp
-+++ b/src/platformsupport/eglconvenience/qeglconvenience.cpp
-@@ -443,9 +443,11 @@ void q_printEglConfig(EGLDisplay display, EGLConfig config)
-     for (index = 0; attrs[index].attr != -1; ++index) {
-         EGLint value;
-         if (eglGetConfigAttrib(display, config, attrs[index].attr, &value)) {
--            qDebug("\t%s: %d", attrs[index].name, (int)value);
-+            qWarning("\t%s: %d\n", attrs[index].name, (int)value);
-         }
-     }
-+
-+    qWarning("\n");
- }
- 
- #ifdef Q_OS_UNIX
-diff --git a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp b/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
-index 7cc3300..ccbd974a 100644
---- a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
-+++ b/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
-@@ -37,7 +37,6 @@
- #include <qpa/qplatformwindow.h>
- #include <QOpenGLContext>
- #include <QtPlatformHeaders/QEGLNativeContext>
--#include <QDebug>
- 
- QT_BEGIN_NAMESPACE
- 
-@@ -181,12 +180,6 @@ void QEGLPlatformContext::init(const QSurfaceFormat &format, QPlatformOpenGLCont
-         return;
-     }
- 
--    static const bool printConfig = qgetenv("QT_QPA_EGLFS_DEBUG").toInt();
--    if (printConfig) {
--        qDebug() << "Created context for format" << format << "with config:";
--        q_printEglConfig(m_eglDisplay, m_eglConfig);
--    }
--
-     updateFormatFromGL();
- }
- 
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtbase-git/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch b/recipes-qt/qt5/qtbase-git/0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch
similarity index 82%
rename from recipes-qt/qt5/qtbase-git/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch
rename to recipes-qt/qt5/qtbase-git/0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch
index 04fb370..07e1db4 100644
--- a/recipes-qt/qt5/qtbase-git/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch
+++ b/recipes-qt/qt5/qtbase-git/0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch
@@ -1,7 +1,7 @@
-From 6061c8457ea1f76745bd9918e61bda01ef96ce56 Mon Sep 17 00:00:00 2001
+From 27be7849765282c56da2d394cfc5d3a5ddc0a89b Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 19 Mar 2014 18:32:28 +0100
-Subject: [PATCH 06/12] qeglplatformintegration: Undefine CursorShape from X.h
+Subject: [PATCH 5/8] qeglplatformintegration: Undefine CursorShape from X.h
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
@@ -9,7 +9,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/src/platformsupport/eglconvenience/qeglplatformintegration_p.h b/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
-index 2b5d5f5..a0aab03 100644
+index 42fbf8c..8950f2d 100644
 --- a/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
 +++ b/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
 @@ -50,6 +50,12 @@
@@ -24,7 +24,7 @@ index 2b5d5f5..a0aab03 100644
 +
  QT_BEGIN_NAMESPACE
  
- class QEGLPlatformScreen;
+ class QEGLPlatformWindow;
 -- 
 2.3.5
 
diff --git a/recipes-qt/qt5/qtbase-git/0006-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase-git/0006-configure-bump-path-length-from-256-to-512-character.patch
new file mode 100644
index 0000000..ce7d64e
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-git/0006-configure-bump-path-length-from-256-to-512-character.patch
@@ -0,0 +1,29 @@
+From d3ad470e6bf6b2b588bdb3484f1c834c03d21894 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Mon, 11 Nov 2013 20:27:30 -0500
+Subject: [PATCH 6/8] configure: bump path length from 256 to 512 characters
+
+Increase the path length that gets hardcoded into generated config.cpp file
+from 256 to 512 characters, as nativesdk path can be quite long.
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 2877b77..1127ebd 100755
+--- a/configure
++++ b/configure
+@@ -3817,7 +3817,7 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
+ static const char qt_configure_installation          [12+11]    = "qt_instdate=2012-12-20";
+ 
+ /* Installation Info */
+-static const char qt_configure_prefix_path_str       [256 + 12] = "qt_prfxpath=$QT_INSTALL_PREFIX";
++static const char qt_configure_prefix_path_str       [512 + 12] = "qt_prfxpath=$QT_INSTALL_PREFIX";
+ #ifdef QT_BUILD_QMAKE
+ static const char qt_configure_ext_prefix_path_str   [256 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
+ static const char qt_configure_host_prefix_path_str  [256 + 12] = "qt_hpfxpath=$QT_HOST_PREFIX";
+-- 
+2.3.5
+
diff --git a/recipes-qt/qt5/qtbase-git/0007-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase-git/0007-configure-bump-path-length-from-256-to-512-character.patch
deleted file mode 100644
index be75d72..0000000
--- a/recipes-qt/qt5/qtbase-git/0007-configure-bump-path-length-from-256-to-512-character.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From a6b01490248be28c1db3abd5f710c5d7d9afee55 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Mon, 11 Nov 2013 20:27:30 -0500
-Subject: [PATCH 07/12] configure: bump path length from 256 to 512 characters
-
-Increase the path length that gets hardcoded into generated config.cpp file
-from 256 to 512 characters, as nativesdk path can be quite long.
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index ad5f4cd..c19ff6a 100755
---- a/configure
-+++ b/configure
-@@ -3627,7 +3627,7 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
- static const char qt_configure_installation          [12+11]    = "qt_instdate=`date +%Y-%m-%d`";
- 
- /* Installation Info */
--static const char qt_configure_prefix_path_strs[][256 + 12] = {
-+static const char qt_configure_prefix_path_strs[][512 + 12] = {
- #ifndef QT_BUILD_QMAKE
-     "qt_prfxpath=$QT_SYSROOT_PREFIX",
-     "qt_docspath=$QT_SYSROOT_DOCS",
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtbase-git/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch b/recipes-qt/qt5/qtbase-git/0007-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
similarity index 89%
rename from recipes-qt/qt5/qtbase-git/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
rename to recipes-qt/qt5/qtbase-git/0007-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
index e4d4327..6f65161 100644
--- a/recipes-qt/qt5/qtbase-git/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
+++ b/recipes-qt/qt5/qtbase-git/0007-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
@@ -1,7 +1,7 @@
-From d1712999887b9809cce57b1e6c008c454330cd2e Mon Sep 17 00:00:00 2001
+From 9182ee68c6078604c6b6ef67b3a47abfea9409ae Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 5 Feb 2014 18:35:08 +0100
-Subject: [PATCH 08/12] eglfs: fix egl error for platforms only supporting one
+Subject: [PATCH 7/8] eglfs: fix egl error for platforms only supporting one
  window/surface
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
@@ -27,7 +27,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 15 insertions(+), 1 deletion(-)
 
 diff --git a/src/plugins/platforms/eglfs/qeglfswindow.cpp b/src/plugins/platforms/eglfs/qeglfswindow.cpp
-index 39a3ef9..2c05979 100644
+index 30fdce9..9a28955 100644
 --- a/src/plugins/platforms/eglfs/qeglfswindow.cpp
 +++ b/src/plugins/platforms/eglfs/qeglfswindow.cpp
 @@ -68,6 +68,15 @@ void QEglFSWindow::create()
@@ -46,7 +46,7 @@ index 39a3ef9..2c05979 100644
      if (window()->type() == Qt::Desktop)
          return;
  
-@@ -81,7 +90,7 @@ void QEglFSWindow::create()
+@@ -82,7 +91,7 @@ void QEglFSWindow::create()
              return;
          }
  
@@ -55,7 +55,7 @@ index 39a3ef9..2c05979 100644
          // We can have either a single OpenGL window or multiple raster windows.
          // Other combinations cannot work.
          qFatal("EGLFS: OpenGL windows cannot be mixed with others.");
-@@ -101,6 +110,11 @@ void QEglFSWindow::create()
+@@ -102,6 +111,11 @@ void QEglFSWindow::create()
  
      resetSurface();
  
diff --git a/recipes-qt/qt5/qtbase-git/0009-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase-git/0008-QOpenGLPaintDevice-sub-area-support.patch
similarity index 89%
rename from recipes-qt/qt5/qtbase-git/0009-QOpenGLPaintDevice-sub-area-support.patch
rename to recipes-qt/qt5/qtbase-git/0008-QOpenGLPaintDevice-sub-area-support.patch
index bebb3d9..1290a92 100644
--- a/recipes-qt/qt5/qtbase-git/0009-QOpenGLPaintDevice-sub-area-support.patch
+++ b/recipes-qt/qt5/qtbase-git/0008-QOpenGLPaintDevice-sub-area-support.patch
@@ -1,7 +1,7 @@
-From a34538ff13c520fa85df689255469a316f037d0d Mon Sep 17 00:00:00 2001
+From 2930d9dc9a856ffe697a0d7557bd5ad35f21bbb3 Mon Sep 17 00:00:00 2001
 From: Jani Hautakangas <jani.hautakangas@ixonos.com>
 Date: Thu, 16 May 2013 09:52:07 +0300
-Subject: [PATCH 09/12] QOpenGLPaintDevice sub-area support
+Subject: [PATCH 8/8] QOpenGLPaintDevice sub-area support
 
 Allows creating QOpenGLPaintDevice targetting sub-area
 of binded framebuffer.
@@ -21,7 +21,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  6 files changed, 23 insertions(+), 3 deletions(-)
 
 diff --git a/src/gui/opengl/qopenglpaintdevice.cpp b/src/gui/opengl/qopenglpaintdevice.cpp
-index a08d26f..cff3155 100644
+index c0657fe..395ec14 100644
 --- a/src/gui/opengl/qopenglpaintdevice.cpp
 +++ b/src/gui/opengl/qopenglpaintdevice.cpp
 @@ -135,6 +135,12 @@ QOpenGLPaintDevice::QOpenGLPaintDevice(int width, int height)
@@ -50,7 +50,7 @@ index a08d26f..cff3155 100644
      Returns the pixel size of the paint device.
  
 diff --git a/src/gui/opengl/qopenglpaintdevice.h b/src/gui/opengl/qopenglpaintdevice.h
-index 10cee84..a6683c5 100644
+index 804e485..88b481a 100644
 --- a/src/gui/opengl/qopenglpaintdevice.h
 +++ b/src/gui/opengl/qopenglpaintdevice.h
 @@ -53,12 +53,14 @@ public:
@@ -69,7 +69,7 @@ index 10cee84..a6683c5 100644
      void setSize(const QSize &size);
      void setDevicePixelRatio(qreal devicePixelRatio);
 diff --git a/src/gui/opengl/qopenglpaintdevice_p.h b/src/gui/opengl/qopenglpaintdevice_p.h
-index 0b01129..211f2f3 100644
+index 57d93ee..5b5c0d9 100644
 --- a/src/gui/opengl/qopenglpaintdevice_p.h
 +++ b/src/gui/opengl/qopenglpaintdevice_p.h
 @@ -65,6 +65,7 @@ public:
@@ -81,10 +81,10 @@ index 0b01129..211f2f3 100644
  
      qreal dpmx;
 diff --git a/src/gui/opengl/qopenglpaintengine.cpp b/src/gui/opengl/qopenglpaintengine.cpp
-index 8eeaa31..e17520e 100644
+index a9a4ada..de3c518 100644
 --- a/src/gui/opengl/qopenglpaintengine.cpp
 +++ b/src/gui/opengl/qopenglpaintengine.cpp
-@@ -2080,7 +2080,10 @@ bool QOpenGL2PaintEngineEx::begin(QPaintDevice *pdev)
+@@ -2091,7 +2091,10 @@ bool QOpenGL2PaintEngineEx::begin(QPaintDevice *pdev)
      for (int i = 0; i < QT_GL_VERTEX_ARRAY_TRACKED_COUNT; ++i)
          d->vertexAttributeArraysEnabledState[i] = false;
  
@@ -95,7 +95,7 @@ index 8eeaa31..e17520e 100644
      d->width = sz.width();
      d->height = sz.height();
      d->mode = BrushDrawingMode;
-@@ -2167,7 +2170,7 @@ void QOpenGL2PaintEngineEx::ensureActive()
+@@ -2178,7 +2181,7 @@ void QOpenGL2PaintEngineEx::ensureActive()
          d->device->ensureActiveTarget();
  
          d->transferMode(BrushDrawingMode);
@@ -104,7 +104,7 @@ index 8eeaa31..e17520e 100644
          d->needsSync = false;
          d->shaderManager->setDirty();
          d->syncGlState();
-@@ -2209,6 +2212,7 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
+@@ -2220,6 +2223,7 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
      if (bounds == QRect(0, 0, width, height)) {
          funcs.glDisable(GL_SCISSOR_TEST);
      } else {
@@ -112,7 +112,7 @@ index 8eeaa31..e17520e 100644
          funcs.glEnable(GL_SCISSOR_TEST);
          setScissor(bounds);
      }
-@@ -2217,12 +2221,13 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
+@@ -2228,12 +2232,13 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
  
  void QOpenGL2PaintEngineExPrivate::setScissor(const QRect &rect)
  {
@@ -128,7 +128,7 @@ index 8eeaa31..e17520e 100644
  
      funcs.glScissor(left, bottom, width, height);
 diff --git a/src/gui/opengl/qopenglpaintengine_p.h b/src/gui/opengl/qopenglpaintengine_p.h
-index 9722ea3..07e3163 100644
+index 17be72b..43e88f6 100644
 --- a/src/gui/opengl/qopenglpaintengine_p.h
 +++ b/src/gui/opengl/qopenglpaintengine_p.h
 @@ -264,6 +264,7 @@ public:
@@ -140,7 +140,7 @@ index 9722ea3..07e3163 100644
      QOpenGLContext *ctx;
      EngineMode mode;
 diff --git a/src/gui/opengl/qopengltextureglyphcache.cpp b/src/gui/opengl/qopengltextureglyphcache.cpp
-index cd268cd..997bc35 100644
+index c179143..fad68d5 100644
 --- a/src/gui/opengl/qopengltextureglyphcache.cpp
 +++ b/src/gui/opengl/qopengltextureglyphcache.cpp
 @@ -310,7 +310,7 @@ void QOpenGLTextureGlyphCache::resizeTextureData(int width, int height)
diff --git a/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch b/recipes-qt/qt5/qtbase-git/0009-Always-build-uic.patch
similarity index 77%
rename from recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch
rename to recipes-qt/qt5/qtbase-git/0009-Always-build-uic.patch
index da17878..8afdeca 100644
--- a/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase-git/0009-Always-build-uic.patch
@@ -1,7 +1,7 @@
-From 5a6ad20dd4fde6a0581be895d763aae43f1fc2b6 Mon Sep 17 00:00:00 2001
+From b0bdbe2e6a6a51f6c955be58670802fe4273262a Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
-Subject: [PATCH 11/13] Always build uic
+Subject: [PATCH 09/11] Always build uic
 
 Even if we are not building gui or widgets. This tool is needed later
 as a native tool when compiling the target.
@@ -14,10 +14,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/src.pro b/src/src.pro
-index 83f7587..9dbcf70 100644
+index fcdc6c3..d0c01aa 100644
 --- a/src/src.pro
 +++ b/src/src.pro
-@@ -163,7 +163,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
+@@ -180,7 +180,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
          }
      }
  }
diff --git a/recipes-qt/qt5/qtbase-git/0012-Add-external-hostbindir-option-for-native-sdk.patch b/recipes-qt/qt5/qtbase-git/0010-Add-external-hostbindir-option-for-native-sdk.patch
similarity index 71%
rename from recipes-qt/qt5/qtbase-git/0012-Add-external-hostbindir-option-for-native-sdk.patch
rename to recipes-qt/qt5/qtbase-git/0010-Add-external-hostbindir-option-for-native-sdk.patch
index 4c044c0..0524b7e 100644
--- a/recipes-qt/qt5/qtbase-git/0012-Add-external-hostbindir-option-for-native-sdk.patch
+++ b/recipes-qt/qt5/qtbase-git/0010-Add-external-hostbindir-option-for-native-sdk.patch
@@ -1,7 +1,7 @@
-From 6425d71d52c5587f323fe28af62530d5c82b02fd Mon Sep 17 00:00:00 2001
+From 21ffd1ad245c12d9e9ea4554832866278d0f0f25 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH 12/13] Add -external-hostbindir option for native(sdk)
+Subject: [PATCH 10/11] Add -external-hostbindir option for native(sdk)
 
 * when cross-compiling it's sometimes useful to use existing tools from machine
   (or in OpenEmbedded built with separate native recipe) when building for target
@@ -29,14 +29,14 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  qmake/property.cpp                  | 1 +
  src/corelib/global/qlibraryinfo.cpp | 3 ++-
  src/corelib/global/qlibraryinfo.h   | 1 +
- tools/configure/configureapp.cpp    | 8 ++++++++
- 4 files changed, 12 insertions(+), 1 deletion(-)
+ tools/configure/configureapp.cpp    | 7 +++++++
+ 4 files changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/qmake/property.cpp b/qmake/property.cpp
-index 051e056..50da6ed 100644
+index 817ae95..c69539f 100644
 --- a/qmake/property.cpp
 +++ b/qmake/property.cpp
-@@ -67,6 +67,7 @@ static const struct {
+@@ -68,6 +68,7 @@ static const struct {
      { "QT_HOST_DATA", QLibraryInfo::HostDataPath, true },
      { "QT_HOST_BINS", QLibraryInfo::HostBinariesPath, true },
      { "QT_HOST_LIBS", QLibraryInfo::HostLibrariesPath, true },
@@ -45,10 +45,10 @@ index 051e056..50da6ed 100644
      { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
  };
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 91ca643..7a567fa 100644
+index f663c88..675bd4c 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -348,7 +348,7 @@ QLibraryInfo::isDebugBuild()
+@@ -373,7 +373,7 @@ QLibraryInfo::isDebugBuild()
   */
  
  static const struct {
@@ -57,31 +57,31 @@ index 91ca643..7a567fa 100644
  } qtConfEntries[] = {
      { "Prefix", "." },
      { "Documentation", "doc" }, // should be ${Data}/doc
-@@ -374,6 +374,7 @@ static const struct {
+@@ -398,6 +398,7 @@ static const struct {
      { "HostBinaries", "bin" },
      { "HostLibraries", "lib" },
      { "HostData", "." },
 +    { "ExternalHostBinaries", "" },
      { "TargetSpec", "" },
      { "HostSpec", "" },
- #endif
+     { "HostPrefix", "" },
 diff --git a/src/corelib/global/qlibraryinfo.h b/src/corelib/global/qlibraryinfo.h
-index 543c4b3..a02e03a 100644
+index 1ad7637..5a8b127 100644
 --- a/src/corelib/global/qlibraryinfo.h
 +++ b/src/corelib/global/qlibraryinfo.h
-@@ -80,6 +80,7 @@ public:
+@@ -81,6 +81,7 @@ public:
          HostBinariesPath,
          HostLibrariesPath,
          HostDataPath,
 +        ExternalHostBinariesPath,
          TargetSpecPath,
          HostSpecPath,
-         LastHostPath = HostSpecPath,
+         HostPrefixPath,
 diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index 6e9d4aa..0ca4daf 100644
+index 0490952..5a9ad3d 100644
 --- a/tools/configure/configureapp.cpp
 +++ b/tools/configure/configureapp.cpp
-@@ -1191,6 +1191,13 @@ void Configure::parseCmdLine()
+@@ -1209,6 +1209,13 @@ void Configure::parseCmdLine()
              dictionary[ "QT_EXT_PREFIX" ] = configCmdLine.at(i);
          }
  
@@ -95,14 +95,6 @@ index 6e9d4aa..0ca4daf 100644
          else if (configCmdLine.at(i) == "-make-tool") {
              ++i;
              if (i == argCount)
-@@ -4004,6 +4011,7 @@ void Configure::generateQConfigCpp()
-                   << "    \"qt_hbinpath=" << formatPath(dictionary["QT_HOST_BINS"]) << "\"," << endl
-                   << "    \"qt_hlibpath=" << formatPath(dictionary["QT_HOST_LIBS"]) << "\"," << endl
-                   << "    \"qt_hdatpath=" << formatPath(dictionary["QT_HOST_DATA"]) << "\"," << endl
-+                  << "    \"qt_ebinpath=" << formatPath(dictionary["QT_EXTERNAL_HOST_BINS"]) << "\"," << endl
-                   << "    \"qt_targspec=" << targSpec << "\"," << endl
-                   << "    \"qt_hostspec=" << hostSpec << "\"," << endl
-                   << "#endif" << endl
 -- 
 2.3.5
 
diff --git a/recipes-qt/qt5/qtbase-git/0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch b/recipes-qt/qt5/qtbase-git/0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch
deleted file mode 100644
index f2eed11..0000000
--- a/recipes-qt/qt5/qtbase-git/0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 16a55457ce31d467cb331ab8e94b672757ef42b9 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Thu, 18 Dec 2014 13:41:09 +0100
-Subject: [PATCH 10/12] Make Qt5GuiConfigExtras.cmake find gl(es) include dir
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-In configure QMAKE_INCDIR_OPENGL is set with pkg-config. Without
-PKG_CONFIG_ALLOW_SYSTEM_CFLAGS set, pkg-config returns paths outside
-/usr/include only (in my case /usr/include/libdrm). With NO_DEFAULT_PATH set
-gl(es) include directories cannot be found. Cmake builds depending on
-Qt5Gui error out with
-
-| Failed to find "GLES2/gl2.h" in "/usr/include/libdrm"
-
-Upstream-Status: submitted [1]
-
-[1] https://bugreports.qt-project.org/browse/QTBUG-43445
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- src/gui/Qt5GuiConfigExtras.cmake.in | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/src/gui/Qt5GuiConfigExtras.cmake.in b/src/gui/Qt5GuiConfigExtras.cmake.in
-index 9a846d4..07869ef 100644
---- a/src/gui/Qt5GuiConfigExtras.cmake.in
-+++ b/src/gui/Qt5GuiConfigExtras.cmake.in
-@@ -57,9 +57,6 @@ set(Qt5Gui_OPENGL_LIBRARIES Qt5::Gui_GLESv2)
- set(_GL_INCDIRS $$CMAKE_GL_INCDIRS)
- find_path(_qt5gui_OPENGL_INCLUDE_DIR $$CMAKE_GL_HEADER_NAME
-     PATHS ${_GL_INCDIRS}
--!!IF !mac
--    NO_DEFAULT_PATH
--!!ENDIF
- )
- if (NOT _qt5gui_OPENGL_INCLUDE_DIR)
-     message(FATAL_ERROR \"Failed to find \\\"$$CMAKE_GL_HEADER_NAME\\\" in \\\"${_GL_INCDIRS}\\\".\")
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtbase-git/0013-configure-preserve-built-qmake-and-swap-with-native-.patch b/recipes-qt/qt5/qtbase-git/0011-configure-preserve-built-qmake-and-swap-with-native-.patch
similarity index 69%
rename from recipes-qt/qt5/qtbase-git/0013-configure-preserve-built-qmake-and-swap-with-native-.patch
rename to recipes-qt/qt5/qtbase-git/0011-configure-preserve-built-qmake-and-swap-with-native-.patch
index 0b271a3..1fcedcc 100644
--- a/recipes-qt/qt5/qtbase-git/0013-configure-preserve-built-qmake-and-swap-with-native-.patch
+++ b/recipes-qt/qt5/qtbase-git/0011-configure-preserve-built-qmake-and-swap-with-native-.patch
@@ -1,7 +1,7 @@
-From 6b980c8132800001b2f0c5c0e76f7cc7c60d14ee Mon Sep 17 00:00:00 2001
+From 1f827a890a4bd7f13f84a02143d0683ceb06a6dd Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:22:34 -0500
-Subject: [PATCH 13/13] configure: preserve built qmake and swap with native
+Subject: [PATCH 11/11] configure: preserve built qmake and swap with native
  one
 
 Let configure script build the real qmake, but right after it's built, swap
@@ -13,12 +13,12 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/configure b/configure
-index c19ff6a..2d920e3 100755
+index 1127ebd..b47538d 100755
 --- a/configure
 +++ b/configure
-@@ -3879,6 +3879,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
- 
-     (cd "$outpath/qmake"; "$MAKE") || exit 2
+@@ -4065,6 +4065,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+         echo "Done."
+     fi
  fi # Build qmake
 +mv "$outpath/bin/qmake" "$outpath/bin/qmake-real"
 +mv "$outpath/bin/qmake-native" "$outpath/bin/qmake"
diff --git a/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch b/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
deleted file mode 100644
index 96198b1..0000000
--- a/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 6c0cc990522454e0c9e52ba969c3a8c5937157b8 Mon Sep 17 00:00:00 2001
-From: Michael Krelin <hacker@klever.net>
-Date: Mon, 29 Oct 2012 20:07:49 -0700
-Subject: [PATCH 11/12] qmake: don't build it in configure, but allow to build
- it separately
-
-* it is already built in qtbase-native, so we don't need it in configure
-* allow building a separate qmake for the target
-
-Upstream-Status: Inappropriate [configuration]
-  OE specific for native/target builds
-
-Signed-off-by: Yu Ke <ke.yu@intel.com>
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-Signed-off-by: Mikko Levonmaa <mikko.levonmaa@gmail.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
- configure       | 2 +-
- qmake/qmake.pri | 3 ++-
- qmake/qmake.pro | 2 ++
- 3 files changed, 5 insertions(+), 2 deletions(-)
----
- configure       | 2 +-
- qmake/qmake.pri | 3 ++-
- qmake/qmake.pro | 1 +
- 3 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index c19ff6a..7a34b11 100755
---- a/configure
-+++ b/configure
-@@ -3729,7 +3729,7 @@ setBootstrapEvalVariable()
- 
- 
- # build qmake
--if true; then ###[ '!' -f "$outpath/bin/qmake" ];
-+if false; then ###[ '!' -f "$outpath/bin/qmake" ];
-     echo "Creating qmake..."
- 
-     mkdir -p "$outpath/qmake" || exit
-diff --git a/qmake/qmake.pri b/qmake/qmake.pri
-index 4de41d6..69982b7 100644
---- a/qmake/qmake.pri
-+++ b/qmake/qmake.pri
-@@ -82,7 +82,8 @@ bootstrap { #Qt code
-         qjsonparser.cpp \
-         qjsonarray.cpp \
-         qjsonobject.cpp \
--        qjsonvalue.cpp
-+        qjsonvalue.cpp \
-+        qdebug.cpp
- 
-    HEADERS+= \
-         qbitarray.h \
-diff --git a/qmake/qmake.pro b/qmake/qmake.pro
-index 89d6ea5..0ff4a96 100644
---- a/qmake/qmake.pro
-+++ b/qmake/qmake.pro
-@@ -8,6 +8,7 @@ CONFIG -= qt
- DEFINES += \
-     QT_BUILD_QMAKE \
-     PROEVALUATOR_FULL
-+TARGET = qmake
- 
- VPATH += \
-     ../src/corelib/global \
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtbase-git/0012-Set-paths-for-target-properly.patch b/recipes-qt/qt5/qtbase-git/0012-Set-paths-for-target-properly.patch
deleted file mode 100644
index 0a7eb15..0000000
--- a/recipes-qt/qt5/qtbase-git/0012-Set-paths-for-target-properly.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 84c23fc01b28087de35604ef971227b57fb77876 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Thu, 22 Jan 2015 16:09:35 +0100
-Subject: [PATCH 12/12] Set paths for target properly
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- configure | 43 +++++++++++++++++++++----------------------
- 1 file changed, 21 insertions(+), 22 deletions(-)
-
-diff --git a/configure b/configure
-index 7a34b11..7bb4476 100755
---- a/configure
-+++ b/configure
-@@ -3644,28 +3644,27 @@ static const char qt_configure_prefix_path_strs[][512 + 12] = {
-     "qt_xmplpath=$QT_SYSROOT_EXAMPLES",
-     "qt_tstspath=$QT_SYSROOT_TESTS",
- #else
--    "qt_prfxpath=$QT_INSTALL_PREFIX",
--    "qt_docspath=$QT_INSTALL_DOCS",
--    "qt_hdrspath=$QT_INSTALL_HEADERS",
--    "qt_libspath=$QT_INSTALL_LIBS",
--    "qt_lbexpath=$QT_INSTALL_LIBEXECS",
--    "qt_binspath=$QT_INSTALL_BINS",
--    "qt_plugpath=$QT_INSTALL_PLUGINS",
--    "qt_impspath=$QT_INSTALL_IMPORTS",
--    "qt_qml2path=$QT_INSTALL_QML",
--    "qt_adatpath=$QT_INSTALL_ARCHDATA",
--    "qt_datapath=$QT_INSTALL_DATA",
--    "qt_trnspath=$QT_INSTALL_TRANSLATIONS",
--    "qt_xmplpath=$QT_INSTALL_EXAMPLES",
--    "qt_tstspath=$QT_INSTALL_TESTS",
--    "qt_ssrtpath=$CFG_SYSROOT",
--    "qt_hpfxpath=$QT_HOST_PREFIX",
--    "qt_hbinpath=$QT_HOST_BINS",
--    "qt_hlibpath=$QT_HOST_LIBS",
--    "qt_hdatpath=$QT_HOST_DATA",
--    "qt_ebinpath=$QT_EXTERNAL_HOST_BINS",
--    "qt_targspec=$shortxspec",
--    "qt_hostspec=$shortspec",
-+    "qt_prfxpath=$QT_SYSROOT_PREFIX",
-+    "qt_docspath=$QT_SYSROOT_DOCS",
-+    "qt_hdrspath=$QT_SYSROOT_HEADERS",
-+    "qt_libspath=$QT_SYSROOT_LIBS",
-+    "qt_lbexpath=$QT_SYSROOT_LIBEXECS",
-+    "qt_binspath=$QT_SYSROOT_BINS",
-+    "qt_plugpath=$QT_SYSROOT_PLUGINS",
-+    "qt_impspath=$QT_SYSROOT_IMPORTS",
-+    "qt_qml2path=$QT_SYSROOT_QML",
-+    "qt_adatpath=$QT_SYSROOT_ARCHDATA",
-+    "qt_datapath=$QT_SYSROOT_DATA",
-+    "qt_trnspath=$QT_SYSROOT_TRANSLATIONS",
-+    "qt_xmplpath=$QT_SYSROOT_EXAMPLES",
-+    "qt_tstspath=$QT_SYSROOT_TESTS",
-+    "qt_ssrtpath=",
-+    "qt_hpfxpath=$QT_SYSROOT_PREFIX",
-+    "qt_hbinpath=$QT_SYSROOT_BINS",
-+    "qt_hlibpath=$QT_SYSROOT_LIBS",
-+    "qt_hdatpath=$QT_SYSROOT_LIBS/qt5",
-+    "qt_targspec=linux-g++",
-+    "qt_hostspec=linux-g++",
- #endif
- };
- static const char qt_configure_settings_path_str[256 + 12] = "qt_stngpath=$QT_INSTALL_SETTINGS";
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 8ba9170..d171a3b 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -11,18 +11,16 @@ SRC_URI += "\
     file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
     file://0003-Add-external-hostbindir-option.patch \
     file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
-    file://0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
-    file://0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
-    file://0007-configure-bump-path-length-from-256-to-512-character.patch \
-    file://0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
-    file://0009-QOpenGLPaintDevice-sub-area-support.patch \
-    file://0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch \
+    file://0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
+    file://0006-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0007-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
+    file://0008-QOpenGLPaintDevice-sub-area-support.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
-    file://0011-Always-build-uic.patch \
-    file://0012-Add-external-hostbindir-option-for-native-sdk.patch \
+    file://0009-Always-build-uic.patch \
+    file://0010-Add-external-hostbindir-option-for-native-sdk.patch \
 "
 
 do_install_append() {
@@ -31,7 +29,7 @@ do_install_append() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "f58e882b7594c59b6050d3c87562fcf836d10f60"
+SRCREV = "4f8171998378f3e0f345b2b417afbfc9ad9738f0"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
                     file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index ed6878c..6298a34 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -11,21 +11,14 @@ SRC_URI += "\
     file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
     file://0003-Add-external-hostbindir-option.patch \
     file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
-    file://0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
-    file://0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
-    file://0007-configure-bump-path-length-from-256-to-512-character.patch \
-    file://0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
-    file://0009-QOpenGLPaintDevice-sub-area-support.patch \
-    file://0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch \
+    file://0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
+    file://0006-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0007-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
+    file://0008-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0009-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch \
 "
  
-# specific for qtbase
-SRC_URI += "\
-    file://0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
-    file://0012-Set-paths-for-target-properly.patch \
-"
-
-SRCREV = "f58e882b7594c59b6050d3c87562fcf836d10f60"
+SRCREV = "4f8171998378f3e0f345b2b417afbfc9ad9738f0"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
                     file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 0e62a23..edfebf3 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${BPN}.inc
 
-SRCREV = "b4bf23453e65995bdd8827b6e146edd5cafeddc3"
+SRCREV = "8589703bd4e377eeb2a01c43f0c13542f54133ba"
diff --git a/recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch b/recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch
index 1603100..5ef6fc2 100644
--- a/recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch
+++ b/recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch
@@ -1,4 +1,4 @@
-From 1abe7b1d4de10ba3739db8a685661e99fb274a00 Mon Sep 17 00:00:00 2001
+From d696ec9eb1c8eea197240cf7fec27f824b09cc44 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
 Date: Sun, 26 May 2013 14:26:19 +0200
 Subject: [PATCH] qmltestexample: fix link
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index caa851a..d4a2251 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "2b3c2339616680537145a9cc2e7567575add1abb"
+SRCREV = "5870667929ac5f45805b1e1e656fec81b9b22337"
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index 9e2c703..f979959 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -1,5 +1,5 @@
 require qt5-git.inc
 require ${PN}.inc
 
-QT_MODULE_BRANCH = "1.1"
-SRCREV = "30ee95cd19f9a435ce337b4f651175ed2e8ba2e5"
+QT_MODULE_BRANCH = "1.2"
+SRCREV = "efac3cd245e2610924133e304d15bf726f5864f5"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index cf2498b..375bc40 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "6eef4b5fa1836c9cb7ebc5dcb269a8d3114eb6c3"
+SRCREV = "4ee79d3eb4baef9e5b2a3d263f002a24184d0e6e"
diff --git a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
index 2439520..f702824 100644
--- a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
+++ b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
@@ -1,4 +1,4 @@
-From f7cc9df393826c1697e45e87c929ad17ab225256 Mon Sep 17 00:00:00 2001
+From 203ee0f705862dbd0ca6b0b662e7076c25126403 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 4 Aug 2014 19:19:05 +0200
 Subject: [PATCH] qtimageformats.pro: Make the dependencies deterministic
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 149148e..54218e3 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "98f83553e9fe2aa5fc54b32513af6ba3aa60a07b"
+SRCREV = "5b1a3318125b72563b5de1bf7549088165ec60f4"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 75b4f72..83ec402 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "b13fec3c7ed08b7d0e79c08312a3c3285eb20ef3"
+SRCREV = "ec4c8d4a75a811d5440a297df0d7c6ebb7d56522"
diff --git a/recipes-qt/qt5/qtmultimedia-git/0001-Initial-porting-effort-to-GStreamer-1.0.patch b/recipes-qt/qt5/qtmultimedia-git/0001-Initial-porting-effort-to-GStreamer-1.0.patch
index e2a46df..57bebab 100644
--- a/recipes-qt/qt5/qtmultimedia-git/0001-Initial-porting-effort-to-GStreamer-1.0.patch
+++ b/recipes-qt/qt5/qtmultimedia-git/0001-Initial-porting-effort-to-GStreamer-1.0.patch
@@ -1,2369 +1,58 @@
-From 8b306a5a70d431b8e142b3a7efb32d897cb79ab5 Mon Sep 17 00:00:00 2001
+From d3096bb03b5fb3e70073700976e5c0ee6b2c9ba7 Mon Sep 17 00:00:00 2001
 From: Yoann Lopes <yoann.lopes@digia.com>
 Date: Thu, 31 Oct 2013 15:06:30 +0100
 Subject: [PATCH] Initial porting effort to GStreamer 1.0.
 
-Imported from git@github.com:jhodapp/qtmultimedia.git
+* It's already included in 5.5 with this commit:
+  commit 108dda7a90bd0f0337358b0db47ae55acd16dea6
+  Author: Yoann Lopes <yoann.lopes@theqtcompany.com>
+  Date:   Thu Nov 20 17:54:18 2014 +0100
+  GStreamer: port to 1.0.
+* here we restore only the done_config_gstreamer variable
+  to explicitly disable it from OE build
 
-Contributions from:
-Ilya Smelykh <ilya@videoexpertsgroup.com>
-Jim Hodapp <jim.hodapp@canonical.com>
-Sergio Schvezov <sergio.schvezov@canonical.com>
-
-Change-Id: I10fa5e5078efa4564ce833befd417008e26a90a9
-Reviewed-by: Yoann Lopes <yoann.lopes@digia.com>
-(cherry picked from commit d91dac090d92fdbc3a3425e8d969c62e5c79eff9)
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-Conflicts:
-	src/gsttools/qgstreamervideorenderer.cpp
-	src/gsttools/qgstreamervideowidget.cpp
-	src/gsttools/qgstreamervideowindow.cpp
-	src/plugins/gstreamer/camerabin/camerabinsession.cpp
-	src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp
-	src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
 ---
- config.tests/gstreamer/gstreamer.pro               |  11 +-
- config.tests/gstreamer_appsrc/gstreamer_appsrc.pro |  13 +-
- .../gstreamer_encodingprofiles.pro                 |  13 +-
- .../gstreamer_photography.pro                      |  15 +-
- qtmultimedia.pro                                   |  25 ++-
- src/gsttools/gsttools.pro                          |  22 +--
- src/gsttools/gstvideoconnector.c                   | 199 +++++++++++++++++++--
- src/gsttools/qgstappsrc.cpp                        |  29 ++-
- src/gsttools/qgstreameraudioprobecontrol.cpp       |  19 +-
- src/gsttools/qgstreamerbushelper.cpp               |   8 +
- src/gsttools/qgstreamervideoprobecontrol.cpp       |   9 +
- src/gsttools/qgstreamervideorenderer.cpp           |   3 +-
- src/gsttools/qgstreamervideowidget.cpp             |  29 ++-
- src/gsttools/qgstreamervideowindow.cpp             |  79 +++++++-
- src/gsttools/qgstutils.cpp                         |  27 ++-
- src/gsttools/qgstvideobuffer.cpp                   |  18 +-
- src/gsttools/qvideosurfacegstsink.cpp              | 136 +++++++++++++-
- src/multimedia/gsttools_headers/qgstappsrc_p.h     |   3 +
- .../qgstreameraudioprobecontrol_p.h                |   5 +-
- .../qgstreamervideoprobecontrol_p.h                |   4 +
- .../gsttools_headers/qgstreamervideowindow_p.h     |   4 +
- src/multimedia/gsttools_headers/qgstutils_p.h      |   4 +
- .../gsttools_headers/qgstvideobuffer_p.h           |   3 +
- .../gsttools_headers/qvideosurfacegstsink_p.h      |   6 +-
- .../qgstreameraudiodecoderserviceplugin.cpp        |  27 ++-
- .../audiodecoder/qgstreameraudiodecodersession.cpp |  33 +++-
- .../gstreamer/camerabin/camerabinsession.cpp       |  25 +++
- src/plugins/gstreamer/common.pri                   |  21 ++-
- src/plugins/gstreamer/gstreamer.pro                |   3 +-
- .../mediacapture/qgstreamercapturesession.cpp      |   5 +
- src/plugins/gstreamer/mediaplayer/mediaplayer.pro  |   1 -
- .../mediaplayer/qgstreamerplayercontrol.cpp        |   2 +
- .../mediaplayer/qgstreamerplayerservice.cpp        |   9 +-
- .../mediaplayer/qgstreamerplayerserviceplugin.cpp  |  27 ++-
- .../mediaplayer/qgstreamerplayersession.cpp        | 154 ++++++++++++++--
- .../mediaplayer/qgstreamerplayersession.h          |   9 +
- 36 files changed, 871 insertions(+), 129 deletions(-)
+ qtmultimedia.pro | 25 +++++++++++++------------
+ 1 file changed, 13 insertions(+), 12 deletions(-)
 
-diff --git a/config.tests/gstreamer/gstreamer.pro b/config.tests/gstreamer/gstreamer.pro
-index 02a7e34..6b9843a 100644
---- a/config.tests/gstreamer/gstreamer.pro
-+++ b/config.tests/gstreamer/gstreamer.pro
-@@ -3,11 +3,10 @@ SOURCES += main.cpp
- CONFIG += link_pkgconfig
- 
- PKGCONFIG += \
--    gstreamer-0.10 \
--    gstreamer-base-0.10 \
--    gstreamer-interfaces-0.10 \
--    gstreamer-audio-0.10 \
--    gstreamer-video-0.10 \
--    gstreamer-pbutils-0.10
-+    gstreamer-$$GST_VERSION \
-+    gstreamer-base-$$GST_VERSION \
-+    gstreamer-audio-$$GST_VERSION \
-+    gstreamer-video-$$GST_VERSION \
-+    gstreamer-pbutils-$$GST_VERSION
- 
- 
-diff --git a/config.tests/gstreamer_appsrc/gstreamer_appsrc.pro b/config.tests/gstreamer_appsrc/gstreamer_appsrc.pro
-index 9f61703..0f3ca2b 100644
---- a/config.tests/gstreamer_appsrc/gstreamer_appsrc.pro
-+++ b/config.tests/gstreamer_appsrc/gstreamer_appsrc.pro
-@@ -3,11 +3,8 @@ SOURCES += main.cpp
- CONFIG += link_pkgconfig
- 
- PKGCONFIG += \
--    gstreamer-0.10 \
--    gstreamer-base-0.10 \
--    gstreamer-interfaces-0.10 \
--    gstreamer-audio-0.10 \
--    gstreamer-video-0.10 \
--    gstreamer-app-0.10
--
--
-+    gstreamer-$$GST_VERSION \
-+    gstreamer-base-$$GST_VERSION \
-+    gstreamer-audio-$$GST_VERSION \
-+    gstreamer-video-$$GST_VERSION \
-+    gstreamer-pbutils-$$GST_VERSION
-diff --git a/config.tests/gstreamer_encodingprofiles/gstreamer_encodingprofiles.pro b/config.tests/gstreamer_encodingprofiles/gstreamer_encodingprofiles.pro
-index 7e8a9e7..fad40b0 100644
---- a/config.tests/gstreamer_encodingprofiles/gstreamer_encodingprofiles.pro
-+++ b/config.tests/gstreamer_encodingprofiles/gstreamer_encodingprofiles.pro
-@@ -2,11 +2,10 @@ SOURCES += main.cpp
- 
- CONFIG += link_pkgconfig
- 
--PKGCONFIG += \
--    gstreamer-0.10 \
--    gstreamer-base-0.10 \
--    gstreamer-interfaces-0.10 \
--    gstreamer-audio-0.10 \
--    gstreamer-video-0.10 \
--    gstreamer-pbutils-0.10
- 
-+PKGCONFIG += \
-+    gstreamer-$$GST_VERSION \
-+    gstreamer-base-$$GST_VERSION \
-+    gstreamer-audio-$$GST_VERSION \
-+    gstreamer-video-$$GST_VERSION \
-+    gstreamer-pbutils-$$GST_VERSION
-diff --git a/config.tests/gstreamer_photography/gstreamer_photography.pro b/config.tests/gstreamer_photography/gstreamer_photography.pro
-index 6b530cb..975991f 100644
---- a/config.tests/gstreamer_photography/gstreamer_photography.pro
-+++ b/config.tests/gstreamer_photography/gstreamer_photography.pro
-@@ -3,12 +3,11 @@ SOURCES += main.cpp
- CONFIG += link_pkgconfig
- 
- PKGCONFIG += \
--    gstreamer-0.10 \
--    gstreamer-base-0.10 \
--    gstreamer-interfaces-0.10 \
--    gstreamer-audio-0.10 \
--    gstreamer-video-0.10 \
--    gstreamer-pbutils-0.10
--
--LIBS += -lgstphotography-0.10
-+    gstreamer-$$GST_VERSION \
-+    gstreamer-base-$$GST_VERSION \
-+    gstreamer-audio-$$GST_VERSION \
-+    gstreamer-video-$$GST_VERSION \
-+    gstreamer-pbutils-$$GST_VERSION
-+
-+LIBS += -lgstphotography-$$GST_VERSION
- 
 diff --git a/qtmultimedia.pro b/qtmultimedia.pro
-index cf97e64..d94d6a2 100644
+index 21d72d0..01180fc 100644
 --- a/qtmultimedia.pro
 +++ b/qtmultimedia.pro
-@@ -17,11 +17,26 @@ win32 {
- } else {
+@@ -18,19 +18,20 @@ win32 {
      contains(QT_CONFIG, alsa):qtCompileTest(alsa)
      contains(QT_CONFIG, pulseaudio):qtCompileTest(pulseaudio)
--    qtCompileTest(gstreamer) {
+ 
+-    isEmpty(GST_VERSION) {
+-        contains(QT_CONFIG, gstreamer-0.10) {
+-            GST_VERSION = 0.10
+-        } else: contains(QT_CONFIG, gstreamer-1.0) {
+-            GST_VERSION = 1.0
++    !done_config_gstreamer {
++        isEmpty(GST_VERSION) {
++            contains(QT_CONFIG, gstreamer-0.10) {
++                GST_VERSION = 0.10
++            } else: contains(QT_CONFIG, gstreamer-1.0) {
++                GST_VERSION = 1.0
++            }
+         }
+-    }
+-    cache(GST_VERSION, set)
+-    !isEmpty(GST_VERSION):qtCompileTest(gstreamer) {
 -        qtCompileTest(gstreamer_photography)
 -        qtCompileTest(gstreamer_encodingprofiles)
 -        qtCompileTest(gstreamer_appsrc)
 -        qtCompileTest(linux_v4l)
-+    !done_config_gstreamer {
-+        gstver=1.0
-+        cache(GST_VERSION, set, gstver);
-+        qtCompileTest(gstreamer) {
++        cache(GST_VERSION, set)
++        !isEmpty(GST_VERSION):qtCompileTest(gstreamer) {
 +            qtCompileTest(gstreamer_photography)
 +            qtCompileTest(gstreamer_encodingprofiles)
 +            qtCompileTest(gstreamer_appsrc)
 +            qtCompileTest(linux_v4l)
-+        } else {
-+            gstver=0.10
-+            cache(GST_VERSION, set, gstver);
-+            # Force a re-run of the test
-+            CONFIG -= done_config_gstreamer
-+            qtCompileTest(gstreamer) {
-+                qtCompileTest(gstreamer_photography)
-+                qtCompileTest(gstreamer_encodingprofiles)
-+                qtCompileTest(gstreamer_appsrc)
-+                qtCompileTest(linux_v4l)
-+            }
-+        }
-     }
-     qtCompileTest(resourcepolicy)
-     qtCompileTest(gpu_vivante)
-diff --git a/src/gsttools/gsttools.pro b/src/gsttools/gsttools.pro
-index 7c809a7..6b9bf5d 100644
---- a/src/gsttools/gsttools.pro
-+++ b/src/gsttools/gsttools.pro
-@@ -2,7 +2,7 @@ TEMPLATE = lib
- 
- TARGET = qgsttools_p
- QPRO_PWD = $$PWD
--QT = core-private multimedia-private gui-private
-+QT = core-private multimedia-private gui-private opengl
- 
- !static:DEFINES += QT_MAKEDLL
- DEFINES += GLIB_VERSION_MIN_REQUIRED=GLIB_VERSION_2_26
-@@ -15,13 +15,14 @@ LIBS_PRIVATE += \
- 
- CONFIG += link_pkgconfig
- 
--PKGCONFIG_PRIVATE += \
--    gstreamer-0.10 \
--    gstreamer-base-0.10 \
--    gstreamer-interfaces-0.10 \
--    gstreamer-audio-0.10 \
--    gstreamer-video-0.10 \
--    gstreamer-pbutils-0.10
-+PKGCONFIG += \
-+    gstreamer-$$GST_VERSION \
-+    gstreamer-base-$$GST_VERSION \
-+    gstreamer-audio-$$GST_VERSION \
-+    gstreamer-video-$$GST_VERSION \
-+    gstreamer-pbutils-$$GST_VERSION
-+
-+equals(GST_VERSION,"0.10"): PKGCONFIG_PRIVATE += gstreamer-interfaces-$$GST_VERSION
- 
- maemo*: PKGCONFIG_PRIVATE +=gstreamer-plugins-bad-0.10
- 
-@@ -33,6 +34,7 @@ config_resourcepolicy {
- # Header files must go inside source directory of a module
- # to be installed by syncqt.
- INCLUDEPATH += ../multimedia/gsttools_headers/
-+INCLUDEPATH += ../plugins/gstreamer/mediaplayer/
- VPATH += ../multimedia/gsttools_headers/
- 
- PRIVATE_HEADERS += \
-@@ -91,13 +93,13 @@ maemo6 {
- }
- 
- config_gstreamer_appsrc {
--    PKGCONFIG_PRIVATE += gstreamer-app-0.10
-+    PKGCONFIG_PRIVATE += gstreamer-app-$$GST_VERSION
-     PRIVATE_HEADERS += qgstappsrc_p.h
-     SOURCES += qgstappsrc.cpp
- 
-     DEFINES += HAVE_GST_APPSRC
- 
--    LIBS_PRIVATE += -lgstapp-0.10
-+    LIBS_PRIVATE += -lgstapp-$$GST_VERSION
- }
- 
- config_linux_v4l: DEFINES += USE_V4L
-diff --git a/src/gsttools/gstvideoconnector.c b/src/gsttools/gstvideoconnector.c
-index 3ed539e..ed0ed3c 100644
---- a/src/gsttools/gstvideoconnector.c
-+++ b/src/gsttools/gstvideoconnector.c
-@@ -59,26 +59,93 @@ GST_STATIC_PAD_TEMPLATE ("src",
-                          GST_PAD_ALWAYS,
-                          GST_STATIC_CAPS_ANY);
- 
-+
-+#if GST_CHECK_VERSION(1,0,0)
-+
-+G_DEFINE_TYPE(GstVideoConnector, gst_video_connector, GST_TYPE_ELEMENT);
-+#else
- #define _do_init(bla) \
-     GST_DEBUG_CATEGORY_INIT (video_connector_debug, \
-     "video-connector", 0, "An identity like element for reconnecting video stream");
- 
- GST_BOILERPLATE_FULL (GstVideoConnector, gst_video_connector, GstElement,
-                       GST_TYPE_ELEMENT, _do_init);
-+#endif
- 
- static void gst_video_connector_dispose (GObject * object);
-+
-+#if GST_CHECK_VERSION(1,0,0)
-+static GstFlowReturn gst_video_connector_chain (GstPad * pad, GstObject* parent, GstBuffer * buf);
-+#else
- static GstFlowReturn gst_video_connector_chain (GstPad * pad, GstBuffer * buf);
- static GstFlowReturn gst_video_connector_buffer_alloc (GstPad * pad,
-                                                        guint64 offset, guint size, GstCaps * caps, GstBuffer ** buf);
-+#endif
-+
- static GstStateChangeReturn gst_video_connector_change_state (GstElement *
-                                                               element, GstStateChange transition);
-+
-+#if GST_CHECK_VERSION(1,0,0)
-+static gboolean gst_video_connector_handle_sink_event (GstPad * pad, GstObject* parent,
-+                                                       GstEvent * event);
-+#else
- static gboolean gst_video_connector_handle_sink_event (GstPad * pad,
-                                                        GstEvent * event);
-+#endif
-+
-+#if GST_CHECK_VERSION(1,0,0)
-+static GstPadProbeReturn gst_video_connector_new_buffer_probe(GstPad *pad, GstPadProbeInfo *info, gpointer object);
-+static GstPadProbeReturn gst_video_connector_new_event_probe(GstPad *pad, GstPadProbeInfo *info, gpointer object);
-+static GstPadProbeReturn gst_video_connector_new_query_probe(GstPad *pad, GstPadProbeInfo *info, gpointer object);
-+#else
- static gboolean gst_video_connector_new_buffer_probe(GstObject *pad, GstBuffer *buffer, guint * object);
--static void gst_video_connector_resend_new_segment(GstElement * element, gboolean emitFailedSignal);
- static gboolean gst_video_connector_setcaps (GstPad  *pad, GstCaps *caps);
- static GstCaps *gst_video_connector_getcaps (GstPad * pad);
- static gboolean gst_video_connector_acceptcaps (GstPad * pad, GstCaps * caps);
-+#endif
-+
-+static void gst_video_connector_resend_new_segment(GstElement * element, gboolean emitFailedSignal);
-+
-+#if GST_CHECK_VERSION(1,0,0)
-+static void
-+gst_video_connector_class_init (GstVideoConnectorClass * klass)
-+{
-+    GObjectClass *gobject_class = G_OBJECT_CLASS (klass);
-+    GstElementClass *gstelement_class = GST_ELEMENT_CLASS (klass);
-+
-+    gst_element_class_set_details_simple (gstelement_class, "Video Connector",
-+                                          "Generic",
-+                                          "An identity like element used for reconnecting video stream",
-+                                          "Dmytro Poplavskiy <dmytro.poplavskiy@nokia.com>");
-+    gst_element_class_add_pad_template (gstelement_class,
-+                                        gst_static_pad_template_get (&gst_video_connector_sink_factory));
-+    gst_element_class_add_pad_template (gstelement_class,
-+                                        gst_static_pad_template_get (&gst_video_connector_src_factory));
-+
-+    gst_video_connector_parent_class = g_type_class_peek_parent (klass);
-+
-+    gobject_class->dispose = gst_video_connector_dispose;
-+    gstelement_class->change_state = gst_video_connector_change_state;
-+    klass->resend_new_segment = gst_video_connector_resend_new_segment;
-+
-+    gst_video_connector_signals[SIGNAL_RESEND_NEW_SEGMENT] =
-+            g_signal_new ("resend-new-segment", G_TYPE_FROM_CLASS (klass),
-+                          G_SIGNAL_RUN_LAST | G_SIGNAL_ACTION,
-+                          G_STRUCT_OFFSET (GstVideoConnectorClass, resend_new_segment), NULL, NULL,
-+                          g_cclosure_marshal_VOID__BOOLEAN, G_TYPE_NONE, 1, G_TYPE_BOOLEAN);
-+
-+    gst_video_connector_signals[SIGNAL_CONNECTION_FAILED] =
-+            g_signal_new ("connection-failed", G_TYPE_FROM_CLASS (klass),
-+                          G_SIGNAL_RUN_LAST,
-+                          0, NULL, NULL,
-+                          g_cclosure_marshal_VOID__VOID, G_TYPE_NONE, 0);
-+
-+    GST_DEBUG_CATEGORY_INIT(video_connector_debug, "video-connector", 0,
-+                            "An identity like element for reconnecting video stream");
-+
-+}
-+
-+#else
- 
- static void
- gst_video_connector_base_init (gpointer g_class)
-@@ -120,18 +187,33 @@ gst_video_connector_class_init (GstVideoConnectorClass * klass)
-                           g_cclosure_marshal_VOID__VOID, G_TYPE_NONE, 0);
- }
- 
-+#endif
-+
- static void
--gst_video_connector_init (GstVideoConnector *element,
--                          GstVideoConnectorClass *g_class)
-+gst_video_connector_init (GstVideoConnector *element
-+#if GST_CHECK_VERSION(1,0,0)
-+#else
-+                          ,GstVideoConnectorClass *g_class
-+#endif
-+                          )
- {
-+#if GST_CHECK_VERSION(1,0,0)
-+#else
-     (void) g_class;
-+#endif
-     element->sinkpad =
-             gst_pad_new_from_static_template (&gst_video_connector_sink_factory,
-                                               "sink");
-     gst_pad_set_chain_function(element->sinkpad,
-                                GST_DEBUG_FUNCPTR (gst_video_connector_chain));
-+#if GST_CHECK_VERSION(1,0,0)
-+    /* gstreamer 1.x uses QUERIES and EVENTS for allocation and caps handiling purposes */
-+    GST_OBJECT_FLAG_SET (element->sinkpad, GST_PAD_FLAG_PROXY_CAPS);
-+    GST_OBJECT_FLAG_SET (element->sinkpad, GST_PAD_FLAG_PROXY_ALLOCATION);
-+#else
-     gst_pad_set_event_function(element->sinkpad,
-                                GST_DEBUG_FUNCPTR (gst_video_connector_handle_sink_event));
-+
-     gst_pad_set_bufferalloc_function(element->sinkpad,
-                                      GST_DEBUG_FUNCPTR (gst_video_connector_buffer_alloc));
-     gst_pad_set_setcaps_function(element->sinkpad,
-@@ -140,14 +222,23 @@ gst_video_connector_init (GstVideoConnector *element,
-                                GST_DEBUG_FUNCPTR(gst_video_connector_getcaps));
-     gst_pad_set_acceptcaps_function(element->sinkpad,
-                                GST_DEBUG_FUNCPTR(gst_video_connector_acceptcaps));
--
-+#endif
-     gst_element_add_pad (GST_ELEMENT (element), element->sinkpad);
- 
-     element->srcpad =
-             gst_pad_new_from_static_template (&gst_video_connector_src_factory,
-                                               "src");
-+#if GST_CHECK_VERSION(1,0,0)
-+    gst_pad_add_probe(element->srcpad, GST_PAD_PROBE_TYPE_BUFFER,
-+                             gst_video_connector_new_buffer_probe, element, NULL);
-+    gst_pad_add_probe(element->srcpad, GST_PAD_PROBE_TYPE_QUERY_DOWNSTREAM,
-+                             gst_video_connector_new_query_probe, element, NULL);
-+    gst_pad_add_probe(element->sinkpad, GST_PAD_PROBE_TYPE_EVENT_DOWNSTREAM,
-+                             gst_video_connector_new_event_probe, element, NULL);
-+#else
-     gst_pad_add_buffer_probe(element->srcpad,
-                              G_CALLBACK(gst_video_connector_new_buffer_probe), element);
-+#endif
-     gst_element_add_pad (GST_ELEMENT (element), element->srcpad);
- 
-     element->relinked = FALSE;
-@@ -175,9 +266,16 @@ gst_video_connector_dispose (GObject * object)
- 
-     gst_video_connector_reset (element);
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+    G_OBJECT_CLASS (gst_video_connector_parent_class)->dispose (object);
-+#else
-     G_OBJECT_CLASS (parent_class)->dispose (object);
-+#endif
- }
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+/* For gstreamer 1.x we handle it in ALLOCATION Query */
-+#else
- // "When this function returns anything else than GST_FLOW_OK,
- // the buffer allocation failed and buf does not contain valid data."
- static GstFlowReturn
-@@ -221,6 +319,7 @@ gst_video_connector_buffer_alloc (GstPad * pad, guint64 offset, guint size,
-                 if (state == GST_STATE_NULL) {
-                     GST_DEBUG_OBJECT (element, "Downstream element is in NULL state");
-                     // Downstream filter seems to be in the wrong state
-+
-                     return GST_FLOW_UNEXPECTED;
-                 }
-             }
-@@ -293,6 +392,7 @@ static GstCaps *gst_video_connector_getcaps (GstPad * pad)
-     return caps;
- }
- 
-+
- static gboolean gst_video_connector_acceptcaps (GstPad * pad, GstCaps * caps)
- {
-     GstVideoConnector *element;
-@@ -300,6 +400,7 @@ static gboolean gst_video_connector_acceptcaps (GstPad * pad, GstCaps * caps)
- 
-     return gst_pad_peer_accept_caps(element->srcpad, caps);
- }
-+#endif
- 
- static void
- gst_video_connector_resend_new_segment(GstElement * element, gboolean emitFailedSignal)
-@@ -311,11 +412,39 @@ gst_video_connector_resend_new_segment(GstElement * element, gboolean emitFailed
-         connector->failedSignalEmited = FALSE;
- }
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+static GstPadProbeReturn gst_video_connector_new_event_probe(GstPad *pad, GstPadProbeInfo *info, gpointer object)
-+{
-+    GstVideoConnector *connector = GST_VIDEO_CONNECTOR (object);
-+    GstEvent *event = gst_pad_probe_info_get_event(info);
-+
-+    GST_DEBUG_OBJECT(connector, "Event %"GST_PTR_FORMAT" received\n", event);
-+
-+    return GST_PAD_PROBE_OK;
-+}
-+
-+static GstPadProbeReturn gst_video_connector_new_query_probe(GstPad *pad, GstPadProbeInfo *info, gpointer object)
-+{
-+    GstVideoConnector *connector = GST_VIDEO_CONNECTOR (object);
-+    GstQuery *query = gst_pad_probe_info_get_query(info);
-+
-+    GST_DEBUG_OBJECT(connector, "Query %"GST_PTR_FORMAT" received\n", query);
-+
-+    return GST_PAD_PROBE_OK;
-+}
-+#endif
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+static GstPadProbeReturn gst_video_connector_new_buffer_probe(GstPad *pad, GstPadProbeInfo *info, gpointer object)
-+{
-+    (void) info;
-+#else
- static gboolean gst_video_connector_new_buffer_probe(GstObject *pad, GstBuffer *buffer, guint * object)
- {
--    (void) pad;
-     (void) buffer;
-+#endif
-+    (void) pad;
-+
- 
-     GstVideoConnector *element = GST_VIDEO_CONNECTOR (object);
- 
-@@ -327,16 +456,23 @@ static gboolean gst_video_connector_new_buffer_probe(GstObject *pad, GstBuffer *
-     if (element->relinked)
-         GST_LOG_OBJECT(element, "rejected buffer because of new segment request");
- 
--    return !element->relinked;
-+    return element->relinked ? GST_PAD_PROBE_DROP : GST_PAD_PROBE_OK;
- }
- 
--
- static GstFlowReturn
-+#if GST_CHECK_VERSION(1,0,0)
-+gst_video_connector_chain (GstPad * pad, GstObject* parent, GstBuffer * buf)
-+#else
- gst_video_connector_chain (GstPad * pad, GstBuffer * buf)
-+#endif
- {
-     GstFlowReturn res;
-     GstVideoConnector *element;
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+    (void)parent;
-+#endif
-+
-     element = GST_VIDEO_CONNECTOR (gst_pad_get_parent (pad));
- 
-     do {
-@@ -348,20 +484,29 @@ gst_video_connector_chain (GstPad * pad, GstBuffer * buf)
-         */
-         while (element->relinked) {
-             element->relinked = FALSE;
--
-+#if GST_CHECK_VERSION(1,0,0)
-+            if (element->latest_buffer && GST_BUFFER_TIMESTAMP_IS_VALID(element->latest_buffer)) {
-+                element->segment.position = GST_BUFFER_TIMESTAMP (element->latest_buffer);
-+            }
-+#else
-             gint64 pos = element->segment.last_stop;
--
-             if (element->latest_buffer && GST_BUFFER_TIMESTAMP_IS_VALID(element->latest_buffer)) {
-                 pos = GST_BUFFER_TIMESTAMP (element->latest_buffer);
-             }
-+#endif
- 
-             //push a new segment and last buffer
-+#if GST_CHECK_VERSION(1,0,0)
-+            GstEvent *ev = gst_event_new_segment (&element->segment);
-+
-+#else
-             GstEvent *ev = gst_event_new_new_segment (TRUE,
-                                                       element->segment.rate,
-                                                       element->segment.format,
-                                                       pos, //start
-                                                       element->segment.stop,
-                                                       pos);
-+#endif
- 
-             GST_DEBUG_OBJECT (element, "Pushing new segment event");
-             if (!gst_pad_push_event (element->srcpad, ev)) {
-@@ -424,8 +569,11 @@ gst_video_connector_change_state (GstElement * element,
-     GstStateChangeReturn result;
- 
-     connector = GST_VIDEO_CONNECTOR(element);
-+#if GST_CHECK_VERSION(1,0,0)
-+    result = GST_ELEMENT_CLASS (gst_video_connector_parent_class)->change_state(element, transition);
-+#else
-     result = GST_ELEMENT_CLASS (parent_class)->change_state(element, transition);
--
-+#endif
-     switch (transition) {
-     case GST_STATE_CHANGE_PAUSED_TO_READY:
-         gst_video_connector_reset (connector);
-@@ -440,9 +588,32 @@ gst_video_connector_change_state (GstElement * element,
-     return result;
- }
- 
--static gboolean
--gst_video_connector_handle_sink_event (GstPad * pad, GstEvent * event)
-+#if GST_CHECK_VERSION(1,0,0)
-+static gboolean gst_video_connector_handle_sink_event (GstPad * pad, GstObject* parent,
-+                                                       GstEvent * event)
-+{
-+    GstVideoConnector *element = GST_VIDEO_CONNECTOR (gst_pad_get_parent (pad));
-+
-+    switch (GST_EVENT_TYPE (event)) {
-+      case GST_EVENT_SEGMENT:
-+      break;
-+      case GST_EVENT_CAPS:
-+      break;
-+    default:
-+      break;
-+    }
-+
-+    gst_object_unref (element);
-+    return gst_pad_event_default (pad, parent, event);
-+}
-+
-+#else
-+
-+static gboolean gst_video_connector_handle_sink_event (GstPad * pad,
-+                                                       GstEvent * event)
- {
-+    (void)parent;
-+
-     if (GST_EVENT_TYPE (event) == GST_EVENT_NEWSEGMENT) {
-         GstVideoConnector *element = GST_VIDEO_CONNECTOR (gst_pad_get_parent (pad));
- 
-@@ -453,7 +624,6 @@ gst_video_connector_handle_sink_event (GstPad * pad, GstEvent * event)
- 
-         gst_event_parse_new_segment_full (event, &update, &rate, &arate, &format,
-                                           &start, &stop, &time);
--
-         GST_LOG_OBJECT (element,
-                           "NEWSEGMENT update %d, rate %lf, applied rate %lf, "
-                           "format %d, " "%" G_GINT64_FORMAT " -- %" G_GINT64_FORMAT ", time %"
-@@ -461,9 +631,10 @@ gst_video_connector_handle_sink_event (GstPad * pad, GstEvent * event)
- 
-         gst_segment_set_newsegment_full (&element->segment, update,
-                                          rate, arate, format, start, stop, time);
--
-         gst_object_unref (element);
-     }
- 
-     return gst_pad_event_default (pad, event);
- }
-+
-+#endif
-diff --git a/src/gsttools/qgstappsrc.cpp b/src/gsttools/qgstappsrc.cpp
-index 561a96f..d5e106f 100644
---- a/src/gsttools/qgstappsrc.cpp
-+++ b/src/gsttools/qgstappsrc.cpp
-@@ -147,23 +147,44 @@ void QGstAppSrc::pushDataToAppSrc()
-             size = qMin(m_stream->bytesAvailable(), (qint64)m_dataRequestSize);
- 
-         if (size) {
--            void *data = g_malloc(size);
--            GstBuffer* buffer = gst_app_buffer_new(data, size, g_free, data);
-+            GstBuffer* buffer = gst_buffer_new_and_alloc(size);
-+
-+#if GST_CHECK_VERSION(1,0,0)
-+            GstMapInfo mapInfo;
-+            gst_buffer_map(buffer, &mapInfo, GST_MAP_WRITE);
-+            void* bufferData = mapInfo.data;
-+#else
-+            void* bufferData = GST_BUFFER_DATA(buffer);
-+#endif
-+            
-             buffer->offset = m_stream->pos();
--            qint64 bytesRead = m_stream->read((char*)GST_BUFFER_DATA(buffer), size);
-+            qint64 bytesRead = m_stream->read((char*)bufferData, size);
-             buffer->offset_end =  buffer->offset + bytesRead - 1;
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+            gst_buffer_unmap(buffer, &mapInfo);
-+#endif
-+            
-             if (bytesRead > 0) {
-                 m_dataRequested = false;
-                 m_enoughData = false;
-                 GstFlowReturn ret = gst_app_src_push_buffer (GST_APP_SRC (element()), buffer);
-                 if (ret == GST_FLOW_ERROR) {
-                     qWarning()<<"appsrc: push buffer error";
-+#if GST_CHECK_VERSION(1,0,0)
-+                } else if (ret == GST_FLOW_FLUSHING) {
-+                    qWarning()<<"appsrc: push buffer wrong state";
-+                }
-+#else
-                 } else if (ret == GST_FLOW_WRONG_STATE) {
-                     qWarning()<<"appsrc: push buffer wrong state";
--                } else if (ret == GST_FLOW_RESEND) {
-+                }
-+#endif
-+#if GST_VERSION_MAJOR < 1
-+                else if (ret == GST_FLOW_RESEND) {
-                     qWarning()<<"appsrc: push buffer resend";
-                 }
-+#endif
-             }
-         } else {
-             sendEOS();
-diff --git a/src/gsttools/qgstreameraudioprobecontrol.cpp b/src/gsttools/qgstreameraudioprobecontrol.cpp
-index 3baca53..be3de3f 100644
---- a/src/gsttools/qgstreameraudioprobecontrol.cpp
-+++ b/src/gsttools/qgstreameraudioprobecontrol.cpp
-@@ -45,9 +45,14 @@ QGstreamerAudioProbeControl::~QGstreamerAudioProbeControl()
- 
- }
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+void QGstreamerAudioProbeControl::bufferProbed(GstBuffer* buffer, GstCaps* caps)
-+{
-+#else
- void QGstreamerAudioProbeControl::bufferProbed(GstBuffer* buffer)
- {
--    GstCaps* caps = gst_buffer_get_caps(buffer);
-+    gst_buffer_get_caps(buffer);
-+#endif
-     if (!caps)
-         return;
- 
-@@ -56,8 +61,20 @@ void QGstreamerAudioProbeControl::bufferProbed(GstBuffer* buffer)
-     if (!format.isValid())
-         return;
- 
-+    #if GST_CHECK_VERSION(1,0,0)
-+
-+    GstMapInfo info;
-+
-+    gst_buffer_map (buffer, &info, GST_MAP_READ);
-+    QAudioBuffer audioBuffer = QAudioBuffer(QByteArray((const char*)info.data, info.size), format);
-+    gst_buffer_unmap(buffer, &info);
-+
-+    #else
-+
-     QAudioBuffer audioBuffer = QAudioBuffer(QByteArray((const char*)buffer->data, buffer->size), format);
- 
-+    #endif
-+
-     {
-         QMutexLocker locker(&m_bufferMutex);
-         m_pendingBuffer = audioBuffer;
-diff --git a/src/gsttools/qgstreamerbushelper.cpp b/src/gsttools/qgstreamerbushelper.cpp
-index 84eda46..eb1fc36 100644
---- a/src/gsttools/qgstreamerbushelper.cpp
-+++ b/src/gsttools/qgstreamerbushelper.cpp
-@@ -154,13 +154,21 @@ QGstreamerBusHelper::QGstreamerBusHelper(GstBus* bus, QObject* parent):
-     QObject(parent)
- {
-     d = new QGstreamerBusHelperPrivate(this, bus);
-+#if GST_CHECK_VERSION(1,0,0)
-+    gst_bus_set_sync_handler(bus, (GstBusSyncHandler)syncGstBusFilter, d, 0);
-+#else
-     gst_bus_set_sync_handler(bus, (GstBusSyncHandler)syncGstBusFilter, d);
-+#endif
-     gst_object_ref(GST_OBJECT(bus));
- }
- 
- QGstreamerBusHelper::~QGstreamerBusHelper()
- {
-+#if GST_CHECK_VERSION(1,0,0)
-+    gst_bus_set_sync_handler(d->bus(), 0, 0, 0);
-+#else
-     gst_bus_set_sync_handler(d->bus(),0,0);
-+#endif
-     gst_object_unref(GST_OBJECT(d->bus()));
- }
- 
-diff --git a/src/gsttools/qgstreamervideoprobecontrol.cpp b/src/gsttools/qgstreamervideoprobecontrol.cpp
-index a78a9da..9c31140 100644
---- a/src/gsttools/qgstreamervideoprobecontrol.cpp
-+++ b/src/gsttools/qgstreamervideoprobecontrol.cpp
-@@ -67,12 +67,21 @@ void QGstreamerVideoProbeControl::stopFlushing()
-     m_flushing = false;
- }
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+void QGstreamerVideoProbeControl::bufferProbed(GstBuffer* buffer, GstCaps* caps)
-+#else
- void QGstreamerVideoProbeControl::bufferProbed(GstBuffer* buffer)
-+#endif
- {
-     if (m_flushing)
-         return;
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+    // FIXME:
-+   // GstCaps* caps = NULL;//gst_buffer_get_caps(buffer);
-+#else
-     GstCaps* caps = gst_buffer_get_caps(buffer);
-+#endif
-     if (!caps)
-         return;
- 
-diff --git a/src/gsttools/qgstreamervideorenderer.cpp b/src/gsttools/qgstreamervideorenderer.cpp
-index 2b66f76..804dce9 100644
---- a/src/gsttools/qgstreamervideorenderer.cpp
-+++ b/src/gsttools/qgstreamervideorenderer.cpp
-@@ -35,8 +35,7 @@
- #include <private/qvideosurfacegstsink_p.h>
- #include <private/qgstutils_p.h>
- #include <qabstractvideosurface.h>
--
--#include <QDebug>
-+#include <QtCore/qdebug.h>
- 
- #include <gst/gst.h>
- 
-diff --git a/src/gsttools/qgstreamervideowidget.cpp b/src/gsttools/qgstreamervideowidget.cpp
-index b26369a..23674bb 100644
---- a/src/gsttools/qgstreamervideowidget.cpp
-+++ b/src/gsttools/qgstreamervideowidget.cpp
-@@ -40,8 +40,13 @@
- #include <QtGui/qpainter.h>
- 
- #include <gst/gst.h>
-+
-+#if !GST_CHECK_VERSION(1,0,0)
- #include <gst/interfaces/xoverlay.h>
- #include <gst/interfaces/propertyprobe.h>
-+#else
-+#include <gst/video/videooverlay.h>
-+#endif
- 
- QT_BEGIN_NAMESPACE
- 
-@@ -161,9 +166,13 @@ bool QGstreamerVideoWidgetControl::processSyncMessage(const QGstreamerMessage &m
- {
-     GstMessage* gm = message.rawMessage();
- 
-+#if !GST_CHECK_VERSION(1,0,0)
-     if (gm && (GST_MESSAGE_TYPE(gm) == GST_MESSAGE_ELEMENT) &&
-             gst_structure_has_name(gm->structure, "prepare-xwindow-id")) {
--
-+#else
-+      if (gm && (GST_MESSAGE_TYPE(gm) == GST_MESSAGE_ELEMENT) &&
-+              gst_structure_has_name(gst_message_get_structure(gm), "prepare-window-handle")) {
-+#endif
-         setOverlay();
-         QMetaObject::invokeMethod(this, "updateNativeVideoSize", Qt::QueuedConnection);
-         return true;
-@@ -191,18 +200,29 @@ bool QGstreamerVideoWidgetControl::processBusMessage(const QGstreamerMessage &me
- 
- void QGstreamerVideoWidgetControl::setOverlay()
- {
-+#if !GST_CHECK_VERSION(1,0,0)
-     if (m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
-         gst_x_overlay_set_xwindow_id(GST_X_OVERLAY(m_videoSink), m_windowId);
-     }
-+#else
-+    if (m_videoSink && GST_IS_VIDEO_OVERLAY(m_videoSink)) {
-+        gst_video_overlay_set_window_handle(GST_VIDEO_OVERLAY(m_videoSink), m_windowId);
-+    }
-+#endif
- }
- 
- void QGstreamerVideoWidgetControl::updateNativeVideoSize()
- {
-     if (m_videoSink) {
-         //find video native size to update video widget size hint
--        GstPad *pad = gst_element_get_static_pad(m_videoSink,"sink");
-+        GstPad *pad = gst_element_get_static_pad(m_videoSink, "sink");
-+#if !GST_CHECK_VERSION(1,0,0)
-         GstCaps *caps = gst_pad_get_negotiated_caps(pad);
-         gst_object_unref(GST_OBJECT(pad));
-+#else
-+        GstCaps *caps = gst_pad_get_current_caps(pad);
-+        gst_object_unref(GST_OBJECT(pad));
-+#endif
- 
-         if (caps) {
-             m_widget->setNativeSize(QGstUtils::capsCorrectedResolution(caps));
-@@ -217,8 +237,13 @@ void QGstreamerVideoWidgetControl::updateNativeVideoSize()
- 
- void QGstreamerVideoWidgetControl::windowExposed()
- {
-+#if !GST_CHECK_VERSION(1,0,0)
-     if (m_videoSink && GST_IS_X_OVERLAY(m_videoSink))
-         gst_x_overlay_expose(GST_X_OVERLAY(m_videoSink));
-+#else
-+    if (m_videoSink && GST_IS_VIDEO_OVERLAY(m_videoSink))
-+        gst_video_overlay_expose(GST_VIDEO_OVERLAY(m_videoSink));
-+#endif
- }
- 
- QWidget *QGstreamerVideoWidgetControl::videoWidget()
-diff --git a/src/gsttools/qgstreamervideowindow.cpp b/src/gsttools/qgstreamervideowindow.cpp
-index a373dcc..587b010 100644
---- a/src/gsttools/qgstreamervideowindow.cpp
-+++ b/src/gsttools/qgstreamervideowindow.cpp
-@@ -37,8 +37,12 @@
- #include <QtCore/qdebug.h>
- 
- #include <gst/gst.h>
-+#include <gst/video/videooverlay.h>
-+
-+#if !GST_CHECK_VERSION(1,0,0)
- #include <gst/interfaces/xoverlay.h>
- #include <gst/interfaces/propertyprobe.h>
-+#endif
- 
- 
- QGstreamerVideoWindow::QGstreamerVideoWindow(QObject *parent, const char *elementName)
-@@ -49,18 +53,25 @@ QGstreamerVideoWindow::QGstreamerVideoWindow(QObject *parent, const char *elemen
-     , m_fullScreen(false)
-     , m_colorKey(QColor::Invalid)
- {
--    if (elementName)
-+    if (elementName) {
-         m_videoSink = gst_element_factory_make(elementName, NULL);
--    else
-+    } else {
-         m_videoSink = gst_element_factory_make("xvimagesink", NULL);
-+    }
- 
-     if (m_videoSink) {
-         qt_gst_object_ref_sink(GST_OBJECT(m_videoSink)); //Take ownership
- 
-         GstPad *pad = gst_element_get_static_pad(m_videoSink,"sink");
-+#if GST_CHECK_VERSION(1,0,0)
-+        m_bufferProbeId = gst_pad_add_probe(pad, GST_PAD_PROBE_TYPE_BUFFER, padBufferProbe, this, NULL);
-+#else
-         m_bufferProbeId = gst_pad_add_buffer_probe(pad, G_CALLBACK(padBufferProbe), this);
-+#endif
-         gst_object_unref(GST_OBJECT(pad));
-     }
-+    else
-+        qDebug() << "No m_videoSink available!";
- }
- 
- QGstreamerVideoWindow::~QGstreamerVideoWindow()
-@@ -82,11 +93,15 @@ void QGstreamerVideoWindow::setWinId(WId id)
-     WId oldId = m_windowId;
- 
-     m_windowId = id;
--
-+#if GST_CHECK_VERSION(1,0,0)
-+    if (m_videoSink && GST_IS_VIDEO_OVERLAY(m_videoSink)) {
-+        gst_video_overlay_set_window_handle(GST_VIDEO_OVERLAY(m_videoSink), m_windowId);
-+    }
-+#else
-     if (m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
-         gst_x_overlay_set_xwindow_id(GST_X_OVERLAY(m_videoSink), m_windowId);
-     }
--
-+#endif
-     if (!oldId)
-         emit readyChanged(true);
- 
-@@ -97,7 +112,20 @@ void QGstreamerVideoWindow::setWinId(WId id)
- bool QGstreamerVideoWindow::processSyncMessage(const QGstreamerMessage &message)
- {
-     GstMessage* gm = message.rawMessage();
-+#if GST_CHECK_VERSION(1,0,0)
-+    const GstStructure *s = gst_message_get_structure(gm);
-+    if ((GST_MESSAGE_TYPE(gm) == GST_MESSAGE_ELEMENT) &&
-+            gst_structure_has_name(s, "prepare-window-handle") &&
-+            m_videoSink && GST_IS_VIDEO_OVERLAY(m_videoSink)) {
-+
-+        gst_video_overlay_set_window_handle(GST_VIDEO_OVERLAY(m_videoSink), m_windowId);
- 
-+        GstPad *pad = gst_element_get_static_pad(m_videoSink,"sink");
-+        m_bufferProbeId = gst_pad_add_probe(pad, GST_PAD_PROBE_TYPE_BUFFER, padBufferProbe, this, NULL);
-+
-+        return true;
-+    }
-+#else
-     if ((GST_MESSAGE_TYPE(gm) == GST_MESSAGE_ELEMENT) &&
-             gst_structure_has_name(gm->structure, "prepare-xwindow-id") &&
-             m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
-@@ -110,7 +138,7 @@ bool QGstreamerVideoWindow::processSyncMessage(const QGstreamerMessage &message)
- 
-         return true;
-     }
--
-+#endif
-     return false;
- }
- 
-@@ -122,7 +150,19 @@ QRect QGstreamerVideoWindow::displayRect() const
- void QGstreamerVideoWindow::setDisplayRect(const QRect &rect)
- {
-     m_displayRect = rect;
--
-+#if GST_CHECK_VERSION(1,0,0)
-+    if (m_videoSink && GST_IS_VIDEO_OVERLAY(m_videoSink)) {
-+        if (m_displayRect.isEmpty())
-+            gst_video_overlay_set_render_rectangle(GST_VIDEO_OVERLAY(m_videoSink), -1, -1, -1, -1);
-+        else
-+            gst_video_overlay_set_render_rectangle(GST_VIDEO_OVERLAY(m_videoSink),
-+                                               m_displayRect.x(),
-+                                               m_displayRect.y(),
-+                                               m_displayRect.width(),
-+                                               m_displayRect.height());
-+        repaint();
-+    }
-+#else
-     if (m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
- #if GST_VERSION_MICRO >= 29
-         if (m_displayRect.isEmpty())
-@@ -136,6 +176,7 @@ void QGstreamerVideoWindow::setDisplayRect(const QRect &rect)
-         repaint();
- #endif
-     }
-+#endif
- }
- 
- Qt::AspectRatioMode QGstreamerVideoWindow::aspectRatioMode() const
-@@ -157,6 +198,16 @@ void QGstreamerVideoWindow::setAspectRatioMode(Qt::AspectRatioMode mode)
- 
- void QGstreamerVideoWindow::repaint()
- {
-+#if GST_CHECK_VERSION(1,0,0)
-+    if (m_videoSink && GST_IS_VIDEO_OVERLAY(m_videoSink)) {
-+        //don't call gst_x_overlay_expose if the sink is in null state
-+        GstState state = GST_STATE_NULL;
-+        GstStateChangeReturn res = gst_element_get_state(m_videoSink, &state, NULL, 1000000);
-+        if (res != GST_STATE_CHANGE_FAILURE && state != GST_STATE_NULL) {
-+            gst_video_overlay_expose(GST_VIDEO_OVERLAY(m_videoSink));
-+        }
-+    }
-+#else
-     if (m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
-         //don't call gst_x_overlay_expose if the sink is in null state
-         GstState state = GST_STATE_NULL;
-@@ -165,6 +216,7 @@ void QGstreamerVideoWindow::repaint()
-             gst_x_overlay_expose(GST_X_OVERLAY(m_videoSink));
-         }
-     }
-+#endif
- }
- 
- QColor QGstreamerVideoWindow::colorKey() const
-@@ -296,11 +348,22 @@ QSize QGstreamerVideoWindow::nativeSize() const
-     return m_nativeSize;
- }
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+GstPadProbeReturn QGstreamerVideoWindow::padBufferProbe(GstPad *pad, GstPadProbeInfo *info, gpointer user_data)
-+#else
- void QGstreamerVideoWindow::padBufferProbe(GstPad *pad, GstBuffer * /* buffer */, gpointer user_data)
-+#endif
- {
-     QGstreamerVideoWindow *control = reinterpret_cast<QGstreamerVideoWindow*>(user_data);
-     QMetaObject::invokeMethod(control, "updateNativeVideoSize", Qt::QueuedConnection);
-+
-+#if GST_CHECK_VERSION(1,0,0)
-+    Q_UNUSED(pad);
-+    Q_UNUSED(info);
-+    return GST_PAD_PROBE_REMOVE;
-+#else
-     gst_pad_remove_buffer_probe(pad, control->m_bufferProbeId);
-+#endif
- }
- 
- void QGstreamerVideoWindow::updateNativeVideoSize()
-@@ -311,7 +374,11 @@ void QGstreamerVideoWindow::updateNativeVideoSize()
-     if (m_videoSink) {
-         //find video native size to update video widget size hint
-         GstPad *pad = gst_element_get_static_pad(m_videoSink,"sink");
-+#if GST_CHECK_VERSION(1,0,0)
-+        GstCaps *caps = gst_pad_get_current_caps(pad);
-+#else
-         GstCaps *caps = gst_pad_get_negotiated_caps(pad);
-+#endif
-         gst_object_unref(GST_OBJECT(pad));
- 
-         if (caps) {
-diff --git a/src/gsttools/qgstutils.cpp b/src/gsttools/qgstutils.cpp
-index 465f439..cb26137 100644
---- a/src/gsttools/qgstutils.cpp
-+++ b/src/gsttools/qgstutils.cpp
-@@ -90,8 +90,13 @@ static void addTagToMap(const GstTagList *list,
-             break;
-         default:
-             // GST_TYPE_DATE is a function, not a constant, so pull it out of the switch
-+#if GST_CHECK_VERSION(1,0,0)
-+            if (G_VALUE_TYPE(&val) == G_TYPE_DATE) {
-+                const GDate *date = (const GDate *)g_value_get_boxed(&val);
-+#else
-             if (G_VALUE_TYPE(&val) == GST_TYPE_DATE) {
-                 const GDate *date = gst_value_get_date(&val);
-+#endif
-                 if (g_date_valid(date)) {
-                     int year = g_date_get_year(date);
-                     int month = g_date_get_month(date);
-@@ -255,6 +260,24 @@ QAudioFormat QGstUtils::audioFormatForCaps(const GstCaps *caps)
- }
- 
- 
-+
-+#if GST_CHECK_VERSION(1,0,0)
-+/*!
-+  Returns audio format for a buffer.
-+  If the buffer doesn't have a valid audio format, an empty QAudioFormat is returned.
-+*/
-+
-+QAudioFormat QGstUtils::audioFormatForSample(GstSample *sample)
-+{
-+    GstCaps* caps = gst_sample_get_caps(sample);
-+    if (!caps)
-+        return QAudioFormat();
-+
-+    QAudioFormat format = QGstUtils::audioFormatForCaps(caps);
-+    gst_caps_unref(caps);
-+    return format;
-+}
-+#else
- /*!
-   Returns audio format for a buffer.
-   If the buffer doesn't have a valid audio format, an empty QAudioFormat is returned.
-@@ -270,7 +293,7 @@ QAudioFormat QGstUtils::audioFormatForBuffer(GstBuffer *buffer)
-     gst_caps_unref(caps);
-     return format;
- }
--
-+#endif
- 
- /*!
-   Builds GstCaps for an audio format.
-@@ -588,7 +611,7 @@ QByteArray QGstUtils::cameraDriver(const QString &device, GstElementFactory *fac
- 
- void qt_gst_object_ref_sink(gpointer object)
- {
--#if (GST_VERSION_MAJOR >= 0) && (GST_VERSION_MINOR >= 10) && (GST_VERSION_MICRO >= 24)
-+#if (GST_VERSION_MAJOR >= 0) && (GST_VERSION_MINOR >= 10) && (GST_VERSION_MICRO >= 24) || GST_CHECK_VERSION(1,0,0)
-     gst_object_ref_sink(object);
- #else
-     g_return_if_fail (GST_IS_OBJECT(object));
-diff --git a/src/gsttools/qgstvideobuffer.cpp b/src/gsttools/qgstvideobuffer.cpp
-index 18702ec..93f22f5 100644
---- a/src/gsttools/qgstvideobuffer.cpp
-+++ b/src/gsttools/qgstvideobuffer.cpp
-@@ -70,21 +70,33 @@ QAbstractVideoBuffer::MapMode QGstVideoBuffer::mapMode() const
- uchar *QGstVideoBuffer::map(MapMode mode, int *numBytes, int *bytesPerLine)
- {
-     if (mode != NotMapped && m_mode == NotMapped) {
--        if (numBytes)
--            *numBytes = m_buffer->size;
-+        m_mode = mode;
- 
-         if (bytesPerLine)
-             *bytesPerLine = m_bytesPerLine;
- 
--        m_mode = mode;
-+#if GST_CHECK_VERSION(1,0,0)
-+        gst_buffer_map(m_buffer, &m_mapInfo, GST_MAP_READ);
-+        if (numBytes)
-+            *numBytes = m_mapInfo.size;
-+
-+        return m_mapInfo.data;
-+#else
-+        if (numBytes)
-+            *numBytes = m_buffer->size;
- 
-         return m_buffer->data;
-+#endif
-     } else {
-         return 0;
-     }
- }
- void QGstVideoBuffer::unmap()
- {
-+#if GST_CHECK_VERSION(1,0,0)
-+    if (m_mode != NotMapped)
-+        gst_buffer_unmap(m_buffer, &m_mapInfo);
-+#endif
-     m_mode = NotMapped;
- }
- 
-diff --git a/src/gsttools/qvideosurfacegstsink.cpp b/src/gsttools/qvideosurfacegstsink.cpp
-index f3e2d88..94aaee7 100644
---- a/src/gsttools/qvideosurfacegstsink.cpp
-+++ b/src/gsttools/qvideosurfacegstsink.cpp
-@@ -43,7 +43,11 @@
- 
- #include "qvideosurfacegstsink_p.h"
- 
--//#define DEBUG_VIDEO_SURFACE_SINK
-+#if GST_VERSION_MAJOR >=1
-+#include <gst/video/video.h>
-+#endif
-+
-+#define DEBUG_VIDEO_SURFACE_SINK
- 
- QT_BEGIN_NAMESPACE
- 
-@@ -62,10 +66,12 @@ QVideoSurfaceGstDelegate::QVideoSurfaceGstDelegate(
-     if (m_surface) {
-         foreach (QObject *instance, bufferPoolLoader()->instances(QGstBufferPoolPluginKey)) {
-             QGstBufferPoolInterface* plugin = qobject_cast<QGstBufferPoolInterface*>(instance);
-+
-             if (plugin) {
-                 m_pools.append(plugin);
-             }
-         }
-+
-         updateSupportedFormats();
-         connect(m_surface, SIGNAL(supportedFormatsChanged()), this, SLOT(updateSupportedFormats()));
-     }
-@@ -198,6 +204,8 @@ GstFlowReturn QVideoSurfaceGstDelegate::render(GstBuffer *buffer)
-     if (QThread::currentThread() == thread()) {
-         if (!m_surface.isNull())
-             m_surface->present(m_frame);
-+        else
-+            qWarning() << "m_surface.isNull().";
-     } else {
-         QMetaObject::invokeMethod(this, "queuedRender", Qt::QueuedConnection);
-         m_renderCondition.wait(&m_mutex, 300);
-@@ -283,6 +291,27 @@ void QVideoSurfaceGstDelegate::updateSupportedFormats()
-     }
- }
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+struct YuvFormat
-+{
-+    QVideoFrame::PixelFormat pixelFormat;
-+    GstVideoFormat vfmt;
-+    guint32 fourcc;
-+    int bitsPerPixel;
-+};
-+
-+static const YuvFormat qt_yuvColorLookup[] =
-+{
-+    { QVideoFrame::Format_YUV420P, GST_VIDEO_FORMAT_I420, GST_MAKE_FOURCC('I','4','2','0'), 8  },
-+    { QVideoFrame::Format_YV12,    GST_VIDEO_FORMAT_YV12, GST_MAKE_FOURCC('Y','V','1','2'), 8  },
-+    { QVideoFrame::Format_UYVY,    GST_VIDEO_FORMAT_UYVY, GST_MAKE_FOURCC('U','Y','V','Y'), 16 },
-+    { QVideoFrame::Format_YUYV,    GST_VIDEO_FORMAT_YUY2, GST_MAKE_FOURCC('Y','U','Y','2'), 16 },
-+    { QVideoFrame::Format_NV12,    GST_VIDEO_FORMAT_NV12, GST_MAKE_FOURCC('N','V','1','2'), 8 },
-+    { QVideoFrame::Format_NV21,    GST_VIDEO_FORMAT_NV21, GST_MAKE_FOURCC('N','V','2','1'), 8 },
-+    { QVideoFrame::Format_AYUV444, GST_VIDEO_FORMAT_AYUV, GST_MAKE_FOURCC('A','Y','U','V'), 32 },
-+};
-+
-+#else
- struct YuvFormat
- {
-     QVideoFrame::PixelFormat pixelFormat;
-@@ -300,6 +329,7 @@ static const YuvFormat qt_yuvColorLookup[] =
-     { QVideoFrame::Format_NV21,    GST_MAKE_FOURCC('N','V','2','1'), 8 },
-     { QVideoFrame::Format_AYUV444, GST_MAKE_FOURCC('A','Y','U','V'), 32 }
- };
-+#endif
- 
- static int indexOfYuvColor(QVideoFrame::PixelFormat format)
- {
-@@ -312,12 +342,20 @@ static int indexOfYuvColor(QVideoFrame::PixelFormat format)
-     return -1;
- }
- 
-+#if GST_VERSION_MAJOR >=1
-+static int indexOfYuvColor(GstVideoFormat vfmt)
-+#else
- static int indexOfYuvColor(guint32 fourcc)
-+#endif
- {
-     const int count = sizeof(qt_yuvColorLookup) / sizeof(YuvFormat);
- 
-     for (int i = 0; i < count; ++i)
-+#if GST_VERSION_MAJOR >=1
-+        if (qt_yuvColorLookup[i].vfmt == vfmt)
-+#else
-         if (qt_yuvColorLookup[i].fourcc == fourcc)
-+#endif
-             return i;
- 
-     return -1;
-@@ -388,13 +426,13 @@ GType QVideoSurfaceGstSink::get_type()
-     if (type == 0) {
-         static const GTypeInfo info =
-         {
--            sizeof(QVideoSurfaceGstSinkClass),                    // class_size
-+            sizeof(QVideoSurfaceGstSinkClass),                 // class_size
-             base_init,                                         // base_init
-             NULL,                                              // base_finalize
-             class_init,                                        // class_init
-             NULL,                                              // class_finalize
-             NULL,                                              // class_data
--            sizeof(QVideoSurfaceGstSink),                         // instance_size
-+            sizeof(QVideoSurfaceGstSink),                      // instance_size
-             0,                                                 // n_preallocs
-             instance_init,                                     // instance_init
-             0                                                  // value_table
-@@ -419,7 +457,11 @@ void QVideoSurfaceGstSink::class_init(gpointer g_class, gpointer class_data)
-     GstBaseSinkClass *base_sink_class = reinterpret_cast<GstBaseSinkClass *>(g_class);
-     base_sink_class->get_caps = QVideoSurfaceGstSink::get_caps;
-     base_sink_class->set_caps = QVideoSurfaceGstSink::set_caps;
-+// FIXME:
-+#if GST_CHECK_VERSION(1,0,0)
-+#else
-     base_sink_class->buffer_alloc = QVideoSurfaceGstSink::buffer_alloc;
-+#endif
-     base_sink_class->start = QVideoSurfaceGstSink::start;
-     base_sink_class->stop = QVideoSurfaceGstSink::stop;
- 
-@@ -434,6 +476,18 @@ void QVideoSurfaceGstSink::base_init(gpointer g_class)
- {
-     static GstStaticPadTemplate sink_pad_template = GST_STATIC_PAD_TEMPLATE(
-             "sink", GST_PAD_SINK, GST_PAD_ALWAYS, GST_STATIC_CAPS(
-+#if GST_CHECK_VERSION(1,0,0)
-+                    "video/x-raw, "
-+                    "format = (string) RGBA,"
-+                    "framerate = (fraction) [ 0, MAX ], "
-+                    "width = (int) [ 1, MAX ], "
-+                    "height = (int) [ 1, MAX ]; "
-+                    "video/x-raw, "
-+                    "format = (string) I420,"
-+                    "framerate = (fraction) [ 0, MAX ], "
-+                    "width = (int) [ 1, MAX ], "
-+                    "height = (int) [ 1, MAX ]"));
-+#else
-                     "video/x-raw-rgb, "
-                     "framerate = (fraction) [ 0, MAX ], "
-                     "width = (int) [ 1, MAX ], "
-@@ -442,6 +496,7 @@ void QVideoSurfaceGstSink::base_init(gpointer g_class)
-                     "framerate = (fraction) [ 0, MAX ], "
-                     "width = (int) [ 1, MAX ], "
-                     "height = (int) [ 1, MAX ]"));
-+#endif
- 
-     gst_element_class_add_pad_template(
-             GST_ELEMENT_CLASS(g_class), gst_static_pad_template_get(&sink_pad_template));
-@@ -490,7 +545,11 @@ GstStateChangeReturn QVideoSurfaceGstSink::change_state(
-             element, transition);
- }
- 
--GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink *base)
-+GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink *base
-+#if GST_CHECK_VERSION(1,0,0)
-+                                        , GstCaps* /*filterCaps*/
-+#endif
-+)
- {
-     VO_SINK(base);
- 
-@@ -503,6 +562,7 @@ GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink *base)
-     QList<QVideoFrame::PixelFormat> poolHandleFormats;
-     sink->delegate->poolMutex()->lock();
-     QGstBufferPoolInterface *pool = sink->delegate->pool();
-+
-     if (pool)
-         poolHandleFormats = sink->delegate->supportedPixelFormats(pool->handleType());
-     sink->delegate->poolMutex()->unlock();
-@@ -518,11 +578,19 @@ GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink *base)
- 
-         if (index != -1) {
-             gst_caps_append_structure(caps, gst_structure_new(
-+#if GST_CHECK_VERSION(1,0,0)
-+                    "video/x-raw",
-+#else
-                     "video/x-raw-yuv",
-+#endif
-                     "framerate", GST_TYPE_FRACTION_RANGE, 0, 1, INT_MAX, 1,
-                     "width"    , GST_TYPE_INT_RANGE, 1, INT_MAX,
-                     "height"   , GST_TYPE_INT_RANGE, 1, INT_MAX,
-+#if GST_CHECK_VERSION(1,0,0)
-+                    "format"   , G_TYPE_STRING, gst_video_format_to_string(qt_yuvColorLookup[index].vfmt),
-+#else
-                     "format"   , GST_TYPE_FOURCC, qt_yuvColorLookup[index].fourcc,
-+#endif
-                     NULL));
-             continue;
-         }
-@@ -532,7 +600,18 @@ GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink *base)
-         for (int i = 0; i < count; ++i) {
-             if (qt_rgbColorLookup[i].pixelFormat == format) {
-                 GstStructure *structure = gst_structure_new(
-+#if GST_CHECK_VERSION(1,0,0)
-+                        "video/x-raw",
-+                        "format"    , G_TYPE_STRING, gst_video_format_to_string(gst_video_format_from_masks(qt_rgbColorLookup[i].depth,
-+                                                                                 qt_rgbColorLookup[i].bitsPerPixel,
-+                                                                                 qt_rgbColorLookup[i].endianness,
-+                                                                                 qt_rgbColorLookup[i].red,
-+                                                                                 qt_rgbColorLookup[i].green,
-+                                                                                 qt_rgbColorLookup[i].blue,
-+                                                                                 qt_rgbColorLookup[i].alpha)),
-+#else
-                         "video/x-raw-rgb",
-+#endif
-                         "framerate" , GST_TYPE_FRACTION_RANGE, 0, 1, INT_MAX, 1,
-                         "width"     , GST_TYPE_INT_RANGE, 1, INT_MAX,
-                         "height"    , GST_TYPE_INT_RANGE, 1, INT_MAX,
-@@ -553,6 +632,7 @@ GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink *base)
-         }
-     }
- 
-+//    printf("get Caps %"GST_PTR_FORMAT"\n", caps);
-     return caps;
- }
- 
-@@ -592,7 +672,7 @@ gboolean QVideoSurfaceGstSink::set_caps(GstBaseSink *base, GstCaps *caps)
-         sink->lastRequestedCaps = 0;
- 
- #ifdef DEBUG_VIDEO_SURFACE_SINK
--        qDebug() << "Staring video surface, format:";
-+        qDebug() << "Starting video surface, format:";
-         qDebug() << format;
-         qDebug() << "bytesPerLine:" << bytesPerLine;
- #endif
-@@ -617,11 +697,49 @@ QVideoSurfaceFormat QVideoSurfaceGstSink::formatForCaps(GstCaps *caps, int *byte
-     gst_structure_get_int(structure, "width", &size.rwidth());
-     gst_structure_get_int(structure, "height", &size.rheight());
- 
-+#if GST_CHECK_VERSION(1, 0, 0)
-+    GstVideoInfo info;
-+    gst_video_info_from_caps(&info, caps);
-+
-+    if (info.finfo->format == GST_VIDEO_FORMAT_I420) {
-+        int index = indexOfYuvColor(GST_VIDEO_FORMAT_I420);
-+
-+        if (index != -1) {
-+            pixelFormat = qt_yuvColorLookup[index].pixelFormat;
-+            bitsPerPixel = qt_yuvColorLookup[index].bitsPerPixel;
-+        }
-+    } else if (info.finfo->format == GST_VIDEO_FORMAT_RGBx) {
-+        int depth = 0;
-+        int endianness = 0;
-+        int red = 0;
-+        int green = 0;
-+        int blue = 0;
-+        int alpha = 0;
-+
-+        gst_structure_get_int(structure, "bpp", &bitsPerPixel);
-+        gst_structure_get_int(structure, "depth", &depth);
-+        gst_structure_get_int(structure, "endianness", &endianness);
-+        gst_structure_get_int(structure, "red_mask", &red);
-+        gst_structure_get_int(structure, "green_mask", &green);
-+        gst_structure_get_int(structure, "blue_mask", &blue);
-+        gst_structure_get_int(structure, "alpha_mask", &alpha);
-+
-+        int index = indexOfRgbColor(bitsPerPixel, depth, endianness, red, green, blue, alpha);
-+        printf("INDEX %x\n", index);
-+        if (index != -1)
-+            pixelFormat = qt_rgbColorLookup[index].pixelFormat;
-+    }
-+#else
-+
-     if (qstrcmp(gst_structure_get_name(structure), "video/x-raw-yuv") == 0) {
-         guint32 fourcc = 0;
-+#if GST_CHECK_VERSION(1, 0, 0)
-+        int index = indexOfYuvColor(gst_video_format_from_string(gst_structure_get_string(structure, "format")));
-+#else
-         gst_structure_get_fourcc(structure, "format", &fourcc);
- 
-         int index = indexOfYuvColor(fourcc);
-+#endif
-         if (index != -1) {
-             pixelFormat = qt_yuvColorLookup[index].pixelFormat;
-             bitsPerPixel = qt_yuvColorLookup[index].bitsPerPixel;
-@@ -647,6 +765,7 @@ QVideoSurfaceFormat QVideoSurfaceGstSink::formatForCaps(GstCaps *caps, int *byte
-         if (index != -1)
-             pixelFormat = qt_rgbColorLookup[index].pixelFormat;
-     }
-+#endif
- 
-     if (pixelFormat != QVideoFrame::Format_Invalid) {
-         QVideoSurfaceFormat format(size, pixelFormat, handleType);
-@@ -722,7 +841,11 @@ GstFlowReturn QVideoSurfaceGstSink::buffer_alloc(
- 
-     poolLock.unlock();
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+    GstCaps *intersection = gst_caps_intersect(get_caps(GST_BASE_SINK(sink), NULL), caps);
-+#else
-     GstCaps *intersection = gst_caps_intersect(get_caps(GST_BASE_SINK(sink)), caps);
-+#endif
- 
-     if (gst_caps_is_empty (intersection)) {
-         gst_caps_unref(intersection);
-@@ -763,7 +886,7 @@ GstFlowReturn QVideoSurfaceGstSink::buffer_alloc(
-     QVideoSurfaceFormat surfaceFormat = sink->delegate->surfaceFormat();
- 
-     if (!pool->isFormatSupported(surfaceFormat)) {
--        //qDebug() << "sink doesn't support native pool format, skip custom buffers allocation";
-+        qDebug() << "sink doesn't support native pool format, skip custom buffers allocation";
-         return GST_FLOW_OK;
-     }
- 
-@@ -787,7 +910,6 @@ GstFlowReturn QVideoSurfaceGstSink::buffer_alloc(
- gboolean QVideoSurfaceGstSink::start(GstBaseSink *base)
- {
-     Q_UNUSED(base);
--
-     return TRUE;
- }
- 
-diff --git a/src/multimedia/gsttools_headers/qgstappsrc_p.h b/src/multimedia/gsttools_headers/qgstappsrc_p.h
-index 4af9252..0e0fc0a 100644
---- a/src/multimedia/gsttools_headers/qgstappsrc_p.h
-+++ b/src/multimedia/gsttools_headers/qgstappsrc_p.h
-@@ -39,7 +39,10 @@
- 
- #include <gst/gst.h>
- #include <gst/app/gstappsrc.h>
-+
-+#if GST_VERSION_MAJOR < 1
- #include <gst/app/gstappbuffer.h>
-+#endif
- 
- QT_BEGIN_NAMESPACE
- 
-diff --git a/src/multimedia/gsttools_headers/qgstreameraudioprobecontrol_p.h b/src/multimedia/gsttools_headers/qgstreameraudioprobecontrol_p.h
-index 34669b8..0f3b165 100644
---- a/src/multimedia/gsttools_headers/qgstreameraudioprobecontrol_p.h
-+++ b/src/multimedia/gsttools_headers/qgstreameraudioprobecontrol_p.h
-@@ -47,8 +47,11 @@ class QGstreamerAudioProbeControl : public QMediaAudioProbeControl
- public:
-     explicit QGstreamerAudioProbeControl(QObject *parent);
-     virtual ~QGstreamerAudioProbeControl();
--
-+#if GST_CHECK_VERSION(1,0,0)
-+    void bufferProbed(GstBuffer* buffer, GstCaps* caps);
-+#else
-     void bufferProbed(GstBuffer* buffer);
-+#endif
- 
- private slots:
-     void bufferProbed();
-diff --git a/src/multimedia/gsttools_headers/qgstreamervideoprobecontrol_p.h b/src/multimedia/gsttools_headers/qgstreamervideoprobecontrol_p.h
-index 49064f9..fce6309 100644
---- a/src/multimedia/gsttools_headers/qgstreamervideoprobecontrol_p.h
-+++ b/src/multimedia/gsttools_headers/qgstreamervideoprobecontrol_p.h
-@@ -48,7 +48,11 @@ public:
-     explicit QGstreamerVideoProbeControl(QObject *parent);
-     virtual ~QGstreamerVideoProbeControl();
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+    void bufferProbed(GstBuffer* buffer, GstCaps*);
-+#else
-     void bufferProbed(GstBuffer* buffer);
-+#endif
-     void startFlushing();
-     void stopFlushing();
- 
-diff --git a/src/multimedia/gsttools_headers/qgstreamervideowindow_p.h b/src/multimedia/gsttools_headers/qgstreamervideowindow_p.h
-index 81e5764..c9fdb5c 100644
---- a/src/multimedia/gsttools_headers/qgstreamervideowindow_p.h
-+++ b/src/multimedia/gsttools_headers/qgstreamervideowindow_p.h
-@@ -104,7 +104,11 @@ private slots:
-     void updateNativeVideoSize();
- 
- private:
-+#if GST_CHECK_VERSION(1,0,0)
-+    static GstPadProbeReturn padBufferProbe(GstPad *pad, GstPadProbeInfo *info, gpointer user_data);
-+#else
-     static void padBufferProbe(GstPad *pad, GstBuffer *buffer, gpointer user_data);
-+#endif
- 
-     GstElement *m_videoSink;
-     WId m_windowId;
-diff --git a/src/multimedia/gsttools_headers/qgstutils_p.h b/src/multimedia/gsttools_headers/qgstutils_p.h
-index 65ff759..6015980 100644
---- a/src/multimedia/gsttools_headers/qgstutils_p.h
-+++ b/src/multimedia/gsttools_headers/qgstutils_p.h
-@@ -73,7 +73,11 @@ namespace QGstUtils {
-     QSize capsResolution(const GstCaps *caps);
-     QSize capsCorrectedResolution(const GstCaps *caps);
-     QAudioFormat audioFormatForCaps(const GstCaps *caps);
-+#if GST_CHECK_VERSION(1,0,0)
-+    QAudioFormat audioFormatForSample(GstSample *sample);
-+#else
-     QAudioFormat audioFormatForBuffer(GstBuffer *buffer);
-+#endif
-     GstCaps *capsForAudioFormat(QAudioFormat format);
-     void initializeGst();
-     QMultimedia::SupportEstimate hasSupport(const QString &mimeType,
-diff --git a/src/multimedia/gsttools_headers/qgstvideobuffer_p.h b/src/multimedia/gsttools_headers/qgstvideobuffer_p.h
-index 1e0fda8..be48820 100644
---- a/src/multimedia/gsttools_headers/qgstvideobuffer_p.h
-+++ b/src/multimedia/gsttools_headers/qgstvideobuffer_p.h
-@@ -71,6 +71,9 @@ private:
-     int m_bytesPerLine;
-     MapMode m_mode;
-     QVariant m_handle;
-+#if GST_CHECK_VERSION(1,0,0)
-+    GstMapInfo m_mapInfo;
-+#endif
- };
- 
- QT_END_NAMESPACE
-diff --git a/src/multimedia/gsttools_headers/qvideosurfacegstsink_p.h b/src/multimedia/gsttools_headers/qvideosurfacegstsink_p.h
-index 11b305d..01935f7 100644
---- a/src/multimedia/gsttools_headers/qvideosurfacegstsink_p.h
-+++ b/src/multimedia/gsttools_headers/qvideosurfacegstsink_p.h
-@@ -131,7 +131,11 @@ private:
- 
-     static GstStateChangeReturn change_state(GstElement *element, GstStateChange transition);
- 
--    static GstCaps *get_caps(GstBaseSink *sink);
-+    static GstCaps *get_caps(GstBaseSink *sink
-+#if GST_CHECK_VERSION(1,0,0)
-+                             , GstCaps* /*filterCaps*/
-+#endif
-+                            );
-     static gboolean set_caps(GstBaseSink *sink, GstCaps *caps);
- 
-     static GstFlowReturn buffer_alloc(
-diff --git a/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderserviceplugin.cpp b/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderserviceplugin.cpp
-index 3098aab..9c54663 100644
---- a/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderserviceplugin.cpp
-+++ b/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderserviceplugin.cpp
-@@ -74,29 +74,42 @@ void QGstreamerAudioDecoderServicePlugin::updateSupportedMimeTypes() const
-     gst_init(NULL, NULL);
- 
-     GList *plugins, *orig_plugins;
-+#if GST_CHECK_VERSION(1,0,0)
-+    orig_plugins = plugins = gst_registry_get_plugin_list (gst_registry_get());
-+#else
-     orig_plugins = plugins = gst_default_registry_get_plugin_list ();
--
-+#endif
-     while (plugins) {
-         GList *features, *orig_features;
- 
-         GstPlugin *plugin = (GstPlugin *) (plugins->data);
-         plugins = g_list_next (plugins);
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+        if (GST_OBJECT_FLAG_IS_SET(plugin, GST_PLUGIN_FLAG_BLACKLISTED))
-+            continue;
-+#else
-         if (plugin->flags & (1<<1)) //GST_PLUGIN_FLAG_BLACKLISTED
-             continue;
--
--        orig_features = features = gst_registry_get_feature_list_by_plugin(gst_registry_get_default (),
--                                                                        plugin->desc.name);
-+#endif
-+        orig_features = features = gst_registry_get_feature_list_by_plugin(gst_registry_get (),
-+                                                                         gst_plugin_get_name(plugin));
-         while (features) {
-             if (!G_UNLIKELY(features->data == NULL)) {
-                 GstPluginFeature *feature = GST_PLUGIN_FEATURE(features->data);
-                 if (GST_IS_ELEMENT_FACTORY (feature)) {
-                     GstElementFactory *factory = GST_ELEMENT_FACTORY(gst_plugin_feature_load(feature));
-                     if (factory
--                       && factory->numpadtemplates > 0
-+                       && gst_element_factory_get_num_pad_templates(factory) > 0
-+#if GST_CHECK_VERSION(1,0,0)
-+                       && (qstrcmp(gst_element_factory_get_metadata(factory, GST_ELEMENT_METADATA_KLASS), "Codec/Decoder/Audio") == 0
-+                          || qstrcmp(gst_element_factory_get_metadata(factory, GST_ELEMENT_METADATA_KLASS), "Codec/Demux") == 0 )
-+#else
-                        && (qstrcmp(factory->details.klass, "Codec/Decoder/Audio") == 0
--                          || qstrcmp(factory->details.klass, "Codec/Demux") == 0 )) {
--                        const GList *pads = factory->staticpadtemplates;
-+                           || qstrcmp(factory->details.klass, "Codec/Demux") == 0 )
-+#endif
-+                        ) {
-+                        const GList *pads = gst_element_factory_get_static_pad_templates(factory);
-                         while (pads) {
-                             GstStaticPadTemplate *padtemplate = (GstStaticPadTemplate*)(pads->data);
-                             pads = g_list_next (pads);
-diff --git a/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecodersession.cpp b/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecodersession.cpp
-index f944a60..72d1cf1 100644
---- a/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecodersession.cpp
-+++ b/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecodersession.cpp
-@@ -446,21 +446,40 @@ QAudioBuffer QGstreamerAudioDecoderSession::read()
-         if (buffersAvailable == 1)
-             emit bufferAvailableChanged(false);
- 
-+        const char* bufferData = 0;
-+        int bufferSize = 0;
-+
-+#if GST_CHECK_VERSION(1,0,0)
-+        GstSample *sample = gst_app_sink_pull_sample(m_appSink);
-+        GstBuffer *buffer = gst_sample_get_buffer(sample);
-+        GstMapInfo mapInfo;
-+        gst_buffer_map(buffer, &mapInfo, GST_MAP_READ);
-+        bufferData = (const char*)mapInfo.data;
-+        bufferSize = mapInfo.size;
-+        QAudioFormat format = QGstUtils::audioFormatForSample(sample);
-+#else
-         GstBuffer *buffer = gst_app_sink_pull_buffer(m_appSink);
--
-+        bufferData = (const char*)buffer->data;
-+        bufferSize = buffer->size;
-         QAudioFormat format = QGstUtils::audioFormatForBuffer(buffer);
-+#endif
-+
-         if (format.isValid()) {
-             // XXX At the moment we have to copy data from GstBuffer into QAudioBuffer.
-             // We could improve performance by implementing QAbstractAudioBuffer for GstBuffer.
-             qint64 position = getPositionFromBuffer(buffer);
--            audioBuffer = QAudioBuffer(QByteArray((const char*)buffer->data, buffer->size), format, position);
-+            audioBuffer = QAudioBuffer(QByteArray((const char*)bufferData, bufferSize), format, position);
-             position /= 1000; // convert to milliseconds
-             if (position != m_position) {
-                 m_position = position;
-                 emit positionChanged(m_position);
-             }
-         }
-+#if GST_CHECK_VERSION(1,0,0)
-+        gst_sample_unref(sample);
-+#else
-         gst_buffer_unref(buffer);
-+#endif
-     }
- 
-     return audioBuffer;
-@@ -531,7 +550,12 @@ void QGstreamerAudioDecoderSession::addAppSink()
- 
-     GstAppSinkCallbacks callbacks;
-     memset(&callbacks, 0, sizeof(callbacks));
-+#if GST_CHECK_VERSION(1,0,0)
-+    // ### Should perhaps also rename new_buffer to new_sample.
-+    callbacks.new_sample = &new_buffer;
-+#else
-     callbacks.new_buffer = &new_buffer;
-+#endif
-     gst_app_sink_set_callbacks(m_appSink, &callbacks, this, NULL);
-     gst_app_sink_set_max_buffers(m_appSink, MAX_BUFFERS_IN_QUEUE);
-     gst_base_sink_set_sync(GST_BASE_SINK(m_appSink), FALSE);
-@@ -557,8 +581,13 @@ void QGstreamerAudioDecoderSession::updateDuration()
-     gint64 gstDuration = 0;
-     int duration = -1;
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+    if (m_playbin && gst_element_query_duration(m_playbin, format, &gstDuration))
-+        duration = gstDuration / 1000000;
-+#else
-     if (m_playbin && gst_element_query_duration(m_playbin, &format, &gstDuration))
-         duration = gstDuration / 1000000;
-+#endif
- 
-     if (m_duration != duration) {
-         m_duration = duration;
-diff --git a/src/plugins/gstreamer/camerabin/camerabinsession.cpp b/src/plugins/gstreamer/camerabin/camerabinsession.cpp
-index 1ed663b..e0c6b50 100644
---- a/src/plugins/gstreamer/camerabin/camerabinsession.cpp
-+++ b/src/plugins/gstreamer/camerabin/camerabinsession.cpp
-@@ -796,7 +796,11 @@ qint64 CameraBinSession::duration() const
-         if (fileSink) {
-             GstFormat format = GST_FORMAT_TIME;
-             gint64 duration = 0;
-+#if GST_CHECK_VERSION(1,0,0)
-+            bool ret = gst_element_query_duration(fileSink, format, &duration);
-+#else
-             bool ret = gst_element_query_position(fileSink, &format, &duration);
-+#endif
-             gst_object_unref(GST_OBJECT(fileSink));
-             if (ret)
-                 return duration / 1000000;
-@@ -833,8 +837,13 @@ void CameraBinSession::setMetaData(const QMap<QByteArray, QVariant> &data)
- 
-     if (m_camerabin) {
-         GstIterator *elements = gst_bin_iterate_all_by_interface(GST_BIN(m_camerabin), GST_TYPE_TAG_SETTER);
-+#if GST_CHECK_VERSION(1,0,0)
-+        GValue *element = 0;
-+        while (gst_iterator_next(elements, element) == GST_ITERATOR_OK) {
-+#else
-         GstElement *element = 0;
-         while (gst_iterator_next(elements, (void**)&element) == GST_ITERATOR_OK) {
-+#endif
-             gst_tag_setter_reset_tags(GST_TAG_SETTER(element));
- 
-             QMapIterator<QByteArray, QVariant> it(data);
-@@ -895,7 +904,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
- 
-     if (gm && GST_MESSAGE_TYPE(gm) == GST_MESSAGE_ELEMENT) {
-         if (m_captureMode == QCamera::CaptureStillImage &&
-+#if GST_CHECK_VERSION(1,0,0)
-+            gst_message_has_name (gm, "preview-image")) {
-+#else
-             gst_structure_has_name(gm->structure, "preview-image")) {
-+#endif
-             st = gst_message_get_structure(gm);
- 
-             if (gst_structure_has_field_typed(st, "buffer", GST_TYPE_BUFFER)) {
-@@ -905,7 +918,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
- 
-                     QImage img;
- 
-+#if GST_CHECK_VERSION(1,0,0)
-                     GstCaps *caps = gst_buffer_get_caps(buffer);
-+#else
-+                    GstCaps *caps = gst_buffer_get_caps(buffer);
-+#endif
-                     if (caps) {
-                         GstStructure *structure = gst_caps_get_structure(caps, 0);
-                         gint width = 0;
-@@ -1178,7 +1195,11 @@ QList< QPair<int,int> > CameraBinSession::supportedFrameRates(const QSize &frame
-         gst_structure_remove_all_fields(structure);
-         gst_structure_set_value(structure, "framerate", &rate);
-     }
-+#if GST_CHECK_VERSION(1,0,0)
-+    caps = gst_caps_simplify(caps);
-+#else
-     gst_caps_do_simplify(caps);
-+#endif
- 
- 
-     for (uint i=0; i<gst_caps_get_size(caps); i++) {
-@@ -1298,7 +1319,11 @@ QList<QSize> CameraBinSession::supportedResolutions(QPair<int,int> rate,
-         gst_structure_set_value(structure, "width", &w);
-         gst_structure_set_value(structure, "height", &h);
-     }
-+#if GST_CHECK_VERSION(1,0,0)
-+    caps = gst_caps_simplify(caps);
-+#else
-     gst_caps_do_simplify(caps);
-+#endif
- 
-     for (uint i=0; i<gst_caps_get_size(caps); i++) {
-         GstStructure *structure = gst_caps_get_structure(caps, i);
-diff --git a/src/plugins/gstreamer/common.pri b/src/plugins/gstreamer/common.pri
-index 8b421b8..2e7f746 100644
---- a/src/plugins/gstreamer/common.pri
-+++ b/src/plugins/gstreamer/common.pri
-@@ -12,14 +12,17 @@ LIBS += -lqgsttools_p
- CONFIG += link_pkgconfig
- 
- PKGCONFIG += \
--    gstreamer-0.10 \
--    gstreamer-base-0.10 \
--    gstreamer-interfaces-0.10 \
--    gstreamer-audio-0.10 \
--    gstreamer-video-0.10 \
--    gstreamer-pbutils-0.10
-+    gstreamer-$$GST_VERSION \
-+    gstreamer-base-$$GST_VERSION \
-+    gstreamer-audio-$$GST_VERSION \
-+    gstreamer-video-$$GST_VERSION \
-+    gstreamer-pbutils-$$GST_VERSION
- 
--maemo*:PKGCONFIG +=gstreamer-plugins-bad-0.10
-+maemo*:PKGCONFIG +=gstreamer-plugins-bad-$$GST_VERSION
-+
-+mir: {
-+    DEFINES += HAVE_MIR
-+}
- 
- config_resourcepolicy {
-     DEFINES += HAVE_RESOURCE_POLICY
-@@ -27,8 +30,8 @@ config_resourcepolicy {
- }
- 
- config_gstreamer_appsrc {
--    PKGCONFIG += gstreamer-app-0.10
-+    PKGCONFIG += gstreamer-app-$$GST_VERSION
-     DEFINES += HAVE_GST_APPSRC
--    LIBS += -lgstapp-0.10
-+    LIBS += -lgstapp-$$GST_VERSION
- }
- 
-diff --git a/src/plugins/gstreamer/gstreamer.pro b/src/plugins/gstreamer/gstreamer.pro
-index 7649010..fce55ac 100644
---- a/src/plugins/gstreamer/gstreamer.pro
-+++ b/src/plugins/gstreamer/gstreamer.pro
-@@ -2,11 +2,10 @@ TEMPLATE = subdirs
- 
- SUBDIRS += \
-     audiodecoder \
--    mediacapture \
-     mediaplayer
- 
- config_gstreamer_encodingprofiles {
--    SUBDIRS += camerabin
-+#    SUBDIRS += camerabin
- }
- 
- OTHER_FILES += \
-diff --git a/src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp b/src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp
-index a2bd80d..d12e9a5 100644
---- a/src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp
-+++ b/src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp
-@@ -498,6 +498,11 @@ GstElement *QGstreamerCaptureSession::buildImageCapture()
-     gst_pad_add_buffer_probe(pad, G_CALLBACK(passImageFilter), this);
-     gst_object_unref(GST_OBJECT(pad));
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+    gst_pad_add_probe(pad, GST_PAD_PROBE_TYPE_BUFFER, passImageFilter, this);
-+#else
-+    gst_pad_add_buffer_probe(pad, G_CALLBACK(passImageFilter), this);
-+#endif
-     g_object_set(G_OBJECT(sink), "signal-handoffs", TRUE, NULL);
-     g_signal_connect(G_OBJECT(sink), "handoff",
-                      G_CALLBACK(saveImageFilter), this);
-diff --git a/src/plugins/gstreamer/mediaplayer/mediaplayer.pro b/src/plugins/gstreamer/mediaplayer/mediaplayer.pro
-index 2ca9377..b986fc7 100644
---- a/src/plugins/gstreamer/mediaplayer/mediaplayer.pro
-+++ b/src/plugins/gstreamer/mediaplayer/mediaplayer.pro
-@@ -28,4 +28,3 @@ SOURCES += \
- 
- OTHER_FILES += \
-     mediaplayer.json
--
-diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayercontrol.cpp b/src/plugins/gstreamer/mediaplayer/qgstreamerplayercontrol.cpp
-index fed756a..8239710 100644
---- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayercontrol.cpp
-+++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayercontrol.cpp
-@@ -537,6 +537,8 @@ void QGstreamerPlayerControl::processEOS()
-         m_session->showPrerollFrames(false); // stop showing prerolled frames in stop state
-     }
- 
-+    qWarning() << "Processing EOS!";
-+
-     popAndNotifyState();
- }
- 
-diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayerservice.cpp b/src/plugins/gstreamer/mediaplayer/qgstreamerplayerservice.cpp
-index ddc828e..00bee36 100644
---- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayerservice.cpp
-+++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayerservice.cpp
-@@ -51,7 +51,11 @@
- #include <private/qgstreamervideorenderer_p.h>
- 
- #if defined(Q_WS_MAEMO_6) && defined(__arm__)
--#include "qgstreamergltexturerenderer.h"
-+#include "private/qgstreamergltexturerenderer.h"
-+#endif
-+
-+#if defined(HAVE_MIR) && defined (__arm__)
-+#include "private/qgstreamermirtexturerenderer_p.h"
- #endif
- 
- #include "qgstreamerstreamscontrol.h"
-@@ -82,6 +86,9 @@ QGstreamerPlayerService::QGstreamerPlayerService(QObject *parent):
- 
- #if defined(Q_WS_MAEMO_6) && defined(__arm__)
-     m_videoRenderer = new QGstreamerGLTextureRenderer(this);
-+#elif defined(HAVE_MIR) && defined (__arm__)
-+    //m_videoRenderer = new QGstreamerVideoRenderer(this);
-+    m_videoRenderer = new QGstreamerMirTextureRenderer(this, m_session);
- #else
-     m_videoRenderer = new QGstreamerVideoRenderer(this);
- #endif
-diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp b/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp
-index 7d20b6d..bf2f9f8 100644
---- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp
-+++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp
-@@ -87,7 +87,11 @@ void QGstreamerPlayerServicePlugin::updateSupportedMimeTypes() const
-     gst_init(NULL, NULL);
- 
-     GList *plugins, *orig_plugins;
-+#if GST_CHECK_VERSION(1,0,0)
-+    orig_plugins = plugins = gst_registry_get_plugin_list (gst_registry_get());
-+#else
-     orig_plugins = plugins = gst_default_registry_get_plugin_list ();
-+#endif
- 
-     while (plugins) {
-         GList *features, *orig_features;
-@@ -95,22 +99,33 @@ void QGstreamerPlayerServicePlugin::updateSupportedMimeTypes() const
-         GstPlugin *plugin = (GstPlugin *) (plugins->data);
-         plugins = g_list_next (plugins);
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+        if (GST_OBJECT_FLAG_IS_SET(plugin, GST_PLUGIN_FLAG_BLACKLISTED))
-+            continue;
-+#else
-         if (plugin->flags & (1<<1)) //GST_PLUGIN_FLAG_BLACKLISTED
-             continue;
-+#endif
- 
--        orig_features = features = gst_registry_get_feature_list_by_plugin(gst_registry_get_default (),
--                                                                        plugin->desc.name);
-+        orig_features = features = gst_registry_get_feature_list_by_plugin(gst_registry_get(),
-+                                                                           gst_plugin_get_name(plugin));
-         while (features) {
-             if (!G_UNLIKELY(features->data == NULL)) {
-                 GstPluginFeature *feature = GST_PLUGIN_FEATURE(features->data);
-                 if (GST_IS_ELEMENT_FACTORY (feature)) {
-                     GstElementFactory *factory = GST_ELEMENT_FACTORY(gst_plugin_feature_load(feature));
-                     if (factory
--                       && factory->numpadtemplates > 0
--                       && (qstrcmp(factory->details.klass, "Codec/Decoder/Audio") == 0
-+#if GST_CHECK_VERSION(1,0,0)
-+                        && (qstrcmp(gst_element_factory_get_metadata(factory, GST_ELEMENT_METADATA_KLASS), "Codec/Decoder/Audio") == 0
-+                          || qstrcmp(gst_element_factory_get_metadata(factory, GST_ELEMENT_METADATA_KLASS),"Codec/Decoder/Video") == 0
-+                          || qstrcmp(gst_element_factory_get_metadata(factory, GST_ELEMENT_METADATA_KLASS), "Codec/Demux") == 0 )
-+#else
-+                        && (qstrcmp(factory->details.klass, "Codec/Decoder/Audio") == 0
-                           || qstrcmp(factory->details.klass, "Codec/Decoder/Video") == 0
--                          || qstrcmp(factory->details.klass, "Codec/Demux") == 0 )) {
--                        const GList *pads = factory->staticpadtemplates;
-+                          || qstrcmp(factory->details.klass, "Codec/Demux") == 0 )
-+#endif
-+                        ) {
-+                        const GList *pads = gst_element_factory_get_static_pad_templates(factory);
-                         while (pads) {
-                             GstStaticPadTemplate *padtemplate = (GstStaticPadTemplate*)(pads->data);
-                             pads = g_list_next (pads);
-diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp b/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
-index 15924a6..8013d0d 100644
---- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
-+++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
-@@ -85,6 +85,16 @@ typedef enum {
-     GST_PLAY_FLAG_BUFFERING     = 0x000000100
- } GstPlayFlags;
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+#define DEFAULT_RAW_CAPS \
-+    "video/x-surface; " \
-+    "text/plain; " \
-+    "text/x-pango-markup; " \
-+    "video/x-dvd-subpicture; " \
-+    "subpicture/x-pgs" \
-+    "video/x-raw" \
-+    "audio/x-raw"
-+#else
- #define DEFAULT_RAW_CAPS \
-     "video/x-raw-yuv; " \
-     "video/x-raw-rgb; " \
-@@ -97,6 +107,8 @@ typedef enum {
-     "text/x-pango-markup; " \
-     "video/x-dvd-subpicture; " \
-     "subpicture/x-pgs"
-+#endif
-+
- static GstStaticCaps static_RawCaps = GST_STATIC_CAPS(DEFAULT_RAW_CAPS);
- 
- QGstreamerPlayerSession::QGstreamerPlayerSession(QObject *parent)
-@@ -137,8 +149,11 @@ QGstreamerPlayerSession::QGstreamerPlayerSession(QObject *parent)
-     gboolean result = gst_type_find_register(0, "playlist", GST_RANK_MARGINAL, playlistTypeFindFunction, 0, 0, this, 0);
-     Q_ASSERT(result == TRUE);
-     Q_UNUSED(result);
--
-+#if GST_CHECK_VERSION(1,0,0)
-+    m_playbin = gst_element_factory_make("playbin", NULL);
-+#else
-     m_playbin = gst_element_factory_make("playbin2", NULL);
-+#endif
- 
-     if (m_playbin) {
-         //GST_PLAY_FLAG_NATIVE_VIDEO omits configuration of ffmpegcolorspace and videoscale,
-@@ -188,7 +203,11 @@ QGstreamerPlayerSession::QGstreamerPlayerSession(QObject *parent)
-     m_videoIdentity = GST_ELEMENT(g_object_new(gst_video_connector_get_type(), 0)); // floating ref
-     g_signal_connect(G_OBJECT(m_videoIdentity), "connection-failed", G_CALLBACK(insertColorSpaceElement), (gpointer)this);
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+    m_colorSpace = gst_element_factory_make("videoconvert", "ffmpegcolorspace-vo");
-+#else
-     m_colorSpace = gst_element_factory_make("ffmpegcolorspace", "ffmpegcolorspace-vo");
-+#endif
-     // might not get a parent, take ownership to avoid leak
-     qt_gst_object_ref_sink(GST_OBJECT(m_colorSpace));
- 
-@@ -206,7 +225,7 @@ QGstreamerPlayerSession::QGstreamerPlayerSession(QObject *parent)
- 
-     // add ghostpads
-     GstPad *pad = gst_element_get_static_pad(m_videoIdentity,"sink");
--    gst_element_add_pad(GST_ELEMENT(m_videoOutputBin), gst_ghost_pad_new("videosink", pad));
-+    gst_element_add_pad(GST_ELEMENT(m_videoOutputBin), gst_ghost_pad_new("sink", pad));
-     gst_object_unref(GST_OBJECT(pad));
- 
-     if (m_playbin != 0) {
-@@ -218,7 +237,7 @@ QGstreamerPlayerSession::QGstreamerPlayerSession(QObject *parent)
-         g_object_set(G_OBJECT(m_playbin), "video-sink", m_videoOutputBin, NULL);
- 
-         g_signal_connect(G_OBJECT(m_playbin), "notify::source", G_CALLBACK(playbinNotifySource), this);
--        g_signal_connect(G_OBJECT(m_playbin), "element-added",  G_CALLBACK(handleElementAdded), this);
-+        //g_signal_connect(G_OBJECT(m_playbin), "element-added",  G_CALLBACK(handleElementAdded), this);
- 
-         if (usePlaybinVolume()) {
-             updateVolume();
-@@ -342,9 +361,13 @@ qint64 QGstreamerPlayerSession::position() const
-     GstFormat   format = GST_FORMAT_TIME;
-     gint64      position = 0;
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+    if ( m_playbin && gst_element_query_position(m_playbin, format, &position))
-+        m_lastPosition = position / 1000000;
-+#else
-     if ( m_playbin && gst_element_query_position(m_playbin, &format, &position))
-         m_lastPosition = position / 1000000;
--
-+#endif
-     return m_lastPosition;
- }
- 
-@@ -474,9 +497,18 @@ bool QGstreamerPlayerSession::isAudioAvailable() const
-     return m_audioAvailable;
- }
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+static GstPadProbeReturn block_pad_cb(GstPad *pad, GstPadProbeInfo *info, gpointer user_data)
-+#else
- static void block_pad_cb(GstPad *pad, gboolean blocked, gpointer user_data)
-+#endif
- {
-     Q_UNUSED(pad);
-+#if GST_CHECK_VERSION(1,0,0)
-+    Q_UNUSED(info);
-+    Q_UNUSED(user_data);
-+    return GST_PAD_PROBE_OK;
-+#else
- #ifdef DEBUG_PLAYBIN
-     qDebug() << "block_pad_cb, blocked:" << blocked;
- #endif
-@@ -485,6 +517,7 @@ static void block_pad_cb(GstPad *pad, gboolean blocked, gpointer user_data)
-         QGstreamerPlayerSession *session = reinterpret_cast<QGstreamerPlayerSession*>(user_data);
-         QMetaObject::invokeMethod(session, "finishVideoOutputChange", Qt::QueuedConnection);
-     }
-+#endif
- }
- 
- void QGstreamerPlayerSession::updateVideoRenderer()
-@@ -529,7 +562,7 @@ void QGstreamerPlayerSession::setVideoRenderer(QObject *videoOutput)
-     m_renderer = renderer;
- 
- #ifdef DEBUG_VO_BIN_DUMP
--    _gst_debug_bin_to_dot_file_with_ts(GST_BIN(m_playbin),
-+    gst_debug_bin_to_dot_file_with_ts(GST_BIN(m_playbin),
-                                   GstDebugGraphDetails(GST_DEBUG_GRAPH_SHOW_ALL /* GST_DEBUG_GRAPH_SHOW_MEDIA_TYPE | GST_DEBUG_GRAPH_SHOW_NON_DEFAULT_PARAMS | GST_DEBUG_GRAPH_SHOW_STATES*/),
-                                   "playbin_set");
- #endif
-@@ -633,7 +666,11 @@ void QGstreamerPlayerSession::setVideoRenderer(QObject *videoOutput)
- 
-         //block pads, async to avoid locking in paused state
-         GstPad *srcPad = gst_element_get_static_pad(m_videoIdentity, "src");
-+#if GST_CHECK_VERSION(1,0,0)
-+        this->pad_probe_id = gst_pad_add_probe(srcPad, (GstPadProbeType)(GST_PAD_PROBE_TYPE_BUFFER | GST_PAD_PROBE_TYPE_BLOCK), block_pad_cb, this, NULL);
-+#else
-         gst_pad_set_blocked_async(srcPad, true, &block_pad_cb, this);
-+#endif
-         gst_object_unref(GST_OBJECT(srcPad));
- 
-         //Unpause the sink to avoid waiting until the buffer is processed
-@@ -674,7 +711,11 @@ void QGstreamerPlayerSession::finishVideoOutputChange()
-         //video output was change back to the current one,
-         //no need to torment the pipeline, just unblock the pad
-         if (gst_pad_is_blocked(srcPad))
-+#if GST_CHECK_VERSION(1,0,0)
-+            gst_pad_remove_probe(srcPad, this->pad_probe_id);
-+#else
-             gst_pad_set_blocked_async(srcPad, false, &block_pad_cb, 0);
-+#endif
- 
-         m_pendingVideoSink = 0;
-         gst_object_unref(GST_OBJECT(srcPad));
-@@ -760,12 +801,17 @@ void QGstreamerPlayerSession::finishVideoOutputChange()
- 
-     //don't have to wait here, it will unblock eventually
-     if (gst_pad_is_blocked(srcPad))
--        gst_pad_set_blocked_async(srcPad, false, &block_pad_cb, 0);
-+#if GST_CHECK_VERSION(1,0,0)
-+            gst_pad_remove_probe(srcPad, this->pad_probe_id);
-+#else
-+            gst_pad_set_blocked_async(srcPad, false, &block_pad_cb, 0);
-+#endif
-+
-     gst_object_unref(GST_OBJECT(srcPad));
- 
- #ifdef DEBUG_VO_BIN_DUMP
--    _gst_debug_bin_to_dot_file_with_ts(GST_BIN(m_playbin),
--                                  GstDebugGraphDetails(GST_DEBUG_GRAPH_SHOW_ALL /* GST_DEBUG_GRAPH_SHOW_MEDIA_TYPE | GST_DEBUG_GRAPH_SHOW_NON_DEFAULT_PARAMS | GST_DEBUG_GRAPH_SHOW_STATES*/),
-+    gst_debug_bin_to_dot_file_with_ts(GST_BIN(m_playbin),
-+                                  GstDebugGraphDetails(GST_DEBUG_GRAPH_SHOW_ALL /* | GST_DEBUG_GRAPH_SHOW_MEDIA_TYPE | GST_DEBUG_GRAPH_SHOW_NON_DEFAULT_PARAMS | GST_DEBUG_GRAPH_SHOW_STATES */),
-                                   "playbin_finish");
- #endif
- }
-@@ -830,6 +876,7 @@ bool QGstreamerPlayerSession::play()
- #ifdef DEBUG_PLAYBIN
-     qDebug() << Q_FUNC_INFO;
- #endif
-+
-     m_everPlayed = false;
-     if (m_playbin) {
-         m_pendingState = QMediaPlayer::PlayingState;
-@@ -1327,8 +1374,11 @@ void QGstreamerPlayerSession::getStreamsInfo()
-         default:
-             break;
-         }
--
-+#if GST_CHECK_VERSION(1,0,0)
-+        if (tags && GST_IS_TAG_LIST(tags)) {
-+#else
-         if (tags && gst_is_tag_list(tags)) {
-+#endif
-             gchar *languageCode = 0;
-             if (gst_tag_list_get_string(tags, GST_TAG_LANGUAGE_CODE, &languageCode))
-                 streamProperties[QMediaMetaData::Language] = QString::fromUtf8(languageCode);
-@@ -1367,7 +1417,11 @@ void QGstreamerPlayerSession::updateVideoResolutionTag()
-     QSize aspectRatio;
- 
-     GstPad *pad = gst_element_get_static_pad(m_videoIdentity, "src");
-+#if GST_CHECK_VERSION(1,0,0)
-+    GstCaps *caps = gst_pad_get_current_caps(pad);
-+#else
-     GstCaps *caps = gst_pad_get_negotiated_caps(pad);
-+#endif
- 
-     if (caps) {
-         const GstStructure *structure = gst_caps_get_structure(caps, 0);
-@@ -1411,7 +1465,11 @@ void QGstreamerPlayerSession::updateDuration()
-     gint64 gstDuration = 0;
-     int duration = -1;
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+    if (m_playbin && gst_element_query_duration(m_playbin, format, &gstDuration))
-+#else
-     if (m_playbin && gst_element_query_duration(m_playbin, &format, &gstDuration))
-+#endif
-         duration = gstDuration / 1000000;
- 
-     if (m_duration != duration) {
-@@ -1467,7 +1525,11 @@ void QGstreamerPlayerSession::playbinNotifySource(GObject *o, GParamSpec *p, gpo
- 
-     // The rest
-     if (g_object_class_find_property(G_OBJECT_GET_CLASS(source), "extra-headers") != 0) {
-+#if GST_CHECK_VERSION(1,0,0)
-+        GstStructure *extras = gst_structure_new_empty("extras");
-+#else
-         GstStructure *extras = gst_structure_empty_new("extras");
-+#endif
- 
-         foreach (const QByteArray &rawHeader, self->m_request.rawHeaderList()) {
-             if (rawHeader == userAgentString) // Filter User-Agent
-@@ -1623,7 +1685,11 @@ GstAutoplugSelectResult QGstreamerPlayerSession::handleAutoplugSelect(GstBin *bi
-     const gchar *factoryName = gst_plugin_feature_get_name(GST_PLUGIN_FEATURE(factory));
-     if (g_str_has_prefix(factoryName, "vaapi")) {
-         GstPad *sinkPad = gst_element_get_static_pad(session->m_videoSink, "sink");
-+#if GST_CHECK_VERSION(1,0,0)
-+        GstCaps *sinkCaps = gst_pad_query_caps(sinkPad, NULL);
-+#else
-         GstCaps *sinkCaps = gst_pad_get_caps(sinkPad);
-+#endif
- 
- #if (GST_VERSION_MAJOR == 0) && ((GST_VERSION_MINOR < 10) || (GST_VERSION_MICRO < 33))
-         if (!factory_can_src_any_caps(factory, sinkCaps))
-@@ -1652,14 +1718,19 @@ void QGstreamerPlayerSession::handleElementAdded(GstBin *bin, GstElement *elemen
-         // Disable on-disk buffering.
-         g_object_set(G_OBJECT(element), "temp-template", NULL, NULL);
-     } else if (g_str_has_prefix(elementName, "uridecodebin") ||
--               g_str_has_prefix(elementName, "decodebin2")) {
--
-+#if GST_CHECK_VERSION(1,0,0)
-+        g_str_has_prefix(elementName, "decodebin")) {
-+#else
-+        g_str_has_prefix(elementName, "decodebin2")) {
-+#endif
-         if (g_str_has_prefix(elementName, "uridecodebin")) {
-             // Add video/x-surface (VAAPI) to default raw formats
-             g_object_set(G_OBJECT(element), "caps", gst_static_caps_get(&static_RawCaps), NULL);
-             // listen for uridecodebin autoplug-select to skip VAAPI usage when the current
-             // video sink doesn't support it
-+#if !(GST_CHECK_VERSION(1,0,0))
-             g_signal_connect(element, "autoplug-select", G_CALLBACK(handleAutoplugSelect), session);
-+#endif
-         }
- 
-         //listen for queue2 element added to uridecodebin/decodebin2 as well.
-@@ -1727,7 +1798,27 @@ void QGstreamerPlayerSession::removeProbe(QGstreamerVideoProbeControl* probe)
-     // Assume user releases any outstanding references to video frames.
- }
- 
--gboolean QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pad, GstBuffer *buffer, gpointer user_data)
-+#if GST_CHECK_VERSION(1,0,0)
-+GstPadProbeReturn QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pad, GstPadProbeInfo *info, gpointer user_data)
-+{
-+    Q_UNUSED(pad);
-+    GstBuffer* buffer = GST_PAD_PROBE_INFO_BUFFER(info);
-+
-+    QGstreamerPlayerSession *session = reinterpret_cast<QGstreamerPlayerSession*>(user_data);
-+    QMutexLocker locker(&session->m_videoProbeMutex);
-+
-+    if (session->m_videoProbes.isEmpty())
-+        return GST_PAD_PROBE_OK;
-+
-+    foreach (QGstreamerVideoProbeControl* probe, session->m_videoProbes)
-+        probe->bufferProbed(buffer, gst_pad_get_current_caps(pad));
-+
-+    return GST_PAD_PROBE_OK;
-+}
-+
-+#else
-+
-+static gboolean QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pad, GstBuffer *buffer, gpointer user_data)
- {
-     Q_UNUSED(pad);
- 
-@@ -1742,6 +1833,7 @@ gboolean QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pad, GstBuffer *bu
- 
-     return TRUE;
- }
-+#endif
- 
- void QGstreamerPlayerSession::addProbe(QGstreamerAudioProbeControl* probe)
- {
-@@ -1759,6 +1851,24 @@ void QGstreamerPlayerSession::removeProbe(QGstreamerAudioProbeControl* probe)
-     m_audioProbes.removeOne(probe);
- }
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+GstPadProbeReturn  QGstreamerPlayerSession::padAudioBufferProbe(GstPad *pad, GstPadProbeInfo* info, gpointer user_data)
-+{
-+    Q_UNUSED(pad);
-+    GstBuffer* buffer = GST_PAD_PROBE_INFO_BUFFER(info);
-+
-+    QGstreamerPlayerSession *session = reinterpret_cast<QGstreamerPlayerSession*>(user_data);
-+    QMutexLocker locker(&session->m_audioProbeMutex);
-+
-+    if (session->m_audioProbes.isEmpty())
-+        return GST_PAD_PROBE_OK;
-+
-+    foreach (QGstreamerAudioProbeControl* probe, session->m_audioProbes)
-+        probe->bufferProbed(buffer, gst_pad_get_current_caps(pad));
-+
-+    return GST_PAD_PROBE_OK;
-+}
-+#else
- gboolean QGstreamerPlayerSession::padAudioBufferProbe(GstPad *pad, GstBuffer *buffer, gpointer user_data)
- {
-     Q_UNUSED(pad);
-@@ -1774,7 +1884,7 @@ gboolean QGstreamerPlayerSession::padAudioBufferProbe(GstPad *pad, GstBuffer *bu
- 
-     return TRUE;
- }
--
-+#endif
- // This function is similar to stop(),
- // but does not set m_everPlayed, m_lastPosition,
- // and setSeekable() values.
-@@ -1807,7 +1917,11 @@ void QGstreamerPlayerSession::removeVideoBufferProbe()
- 
-     GstPad *pad = gst_element_get_static_pad(m_videoSink, "sink");
-     if (pad) {
-+#if GST_CHECK_VERSION(1,0,0)
-+        gst_pad_remove_probe(pad, m_videoBufferProbeId);
-+#else
-         gst_pad_remove_buffer_probe(pad, m_videoBufferProbeId);
-+#endif
-         gst_object_unref(GST_OBJECT(pad));
-     }
- 
-@@ -1822,7 +1936,11 @@ void QGstreamerPlayerSession::addVideoBufferProbe()
- 
-     GstPad *pad = gst_element_get_static_pad(m_videoSink, "sink");
-     if (pad) {
-+#if GST_CHECK_VERSION(1,0,0)
-+        m_videoBufferProbeId = gst_pad_add_probe(pad, GST_PAD_PROBE_TYPE_BUFFER, padVideoBufferProbe, this, NULL);
-+#else
-         m_videoBufferProbeId = gst_pad_add_buffer_probe(pad, G_CALLBACK(padVideoBufferProbe), this);
-+#endif
-         gst_object_unref(GST_OBJECT(pad));
-     }
- }
-@@ -1839,7 +1957,11 @@ void QGstreamerPlayerSession::removeAudioBufferProbe()
- 
-     GstPad *pad = gst_element_get_static_pad(m_audioSink, "sink");
-     if (pad) {
-+#if GST_CHECK_VERSION(1,0,0)
-+        gst_pad_remove_probe(pad, m_audioBufferProbeId);
-+#else
-         gst_pad_remove_buffer_probe(pad, m_audioBufferProbeId);
-+#endif
-         gst_object_unref(GST_OBJECT(pad));
-     }
- 
-@@ -1854,7 +1976,11 @@ void QGstreamerPlayerSession::addAudioBufferProbe()
- 
-     GstPad *pad = gst_element_get_static_pad(m_audioSink, "sink");
-     if (pad) {
-+#if GST_CHECK_VERSION(1,0,0)
-+        m_audioBufferProbeId = gst_pad_add_probe(pad, GST_PAD_PROBE_TYPE_BUFFER, padAudioBufferProbe, this, NULL);
-+#else
-         m_audioBufferProbeId = gst_pad_add_buffer_probe(pad, G_CALLBACK(padAudioBufferProbe), this);
-+#endif
-         gst_object_unref(GST_OBJECT(pad));
      }
- }
-@@ -1887,7 +2013,7 @@ void QGstreamerPlayerSession::playlistTypeFindFunction(GstTypeFind *find, gpoint
-         length = qMin(length, guint64(1024));
- 
-     while (length > 0) {
--        guint8 *data = gst_type_find_peek(find, 0, length);
-+        const guint8 *data = gst_type_find_peek(find, 0, length);
-         if (data) {
-             session->m_isPlaylist = (QPlaylistFileParser::findPlaylistType(QString::fromUtf8(uri), 0, data, length) != QPlaylistFileParser::UNKNOWN);
-             return;
-diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.h b/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.h
-index f2e760a..50bda3d 100644
---- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.h
-+++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.h
-@@ -119,11 +119,19 @@ public:
- 
-     void addProbe(QGstreamerVideoProbeControl* probe);
-     void removeProbe(QGstreamerVideoProbeControl* probe);
-+#if GST_CHECK_VERSION(1,0,0)
-+    static GstPadProbeReturn padVideoBufferProbe(GstPad *pad, GstPadProbeInfo *info, gpointer user_data);
-+#else
-     static gboolean padVideoBufferProbe(GstPad *pad, GstBuffer *buffer, gpointer user_data);
-+#endif
- 
-     void addProbe(QGstreamerAudioProbeControl* probe);
-     void removeProbe(QGstreamerAudioProbeControl* probe);
-+#if GST_CHECK_VERSION(1,0,0)
-+    static GstPadProbeReturn padAudioBufferProbe(GstPad *pad, GstPadProbeInfo* info, gpointer user_data);
-+#else
-     static gboolean padAudioBufferProbe(GstPad *pad, GstBuffer *buffer, gpointer user_data);
-+#endif
  
-     void endOfMediaReset();
- 
-@@ -252,6 +260,7 @@ private:
-     bool m_isLiveSource;
- 
-     bool m_isPlaylist;
-+    gulong pad_probe_id;
- };
- 
- QT_END_NAMESPACE
+     qtCompileTest(resourcepolicy)
 -- 
 2.3.5
 
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 1795169..6d151b5 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "6fe3061c1f6b7438d20c7bfb92c7652cedc5b049"
+SRCREV = "be0a231be4ed28474271fb29f44e1eb3270f35b7"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index 7cc23d5..5505a86 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "c78f720de6de9340492f8395109252919283a955"
+SRCREV = "15daa5fe1c347b0cad80e46c1aafe1de728c3c06"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index ddc4ccf..9fb683a 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "de9145dcd904068256e28e130fdfda2e8014efe8"
+SRCREV = "13aad0cf03170cde6dd147f9d2ce460bac98d712"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 4b99e38..233a079 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "822df36f252c5a16cdf82f5666f36e7011df46c4"
+SRCREV = "f8a48df4fcb2b40c2978c4e446bc6599c942aa32"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 982b2f7..2517c22 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "26c99a8f7832a5549d315ad434e038ae3964e224"
+SRCREV = "cbd16183528d6e6127891801048dc16014d26ae5"
diff --git a/recipes-qt/qt5/qtserialport-git/0001-Unix-Clear-serial_struct-instances.patch b/recipes-qt/qt5/qtserialport-git/0001-Unix-Clear-serial_struct-instances.patch
deleted file mode 100644
index d0f4eb9..0000000
--- a/recipes-qt/qt5/qtserialport-git/0001-Unix-Clear-serial_struct-instances.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From cdaa89e30e12d247a8086763d341e5f020151b67 Mon Sep 17 00:00:00 2001
-From: Jonathan Liu <net147@gmail.com>
-Date: Mon, 9 Mar 2015 22:35:56 +1100
-Subject: [PATCH] Unix: Clear serial_struct instances
-
-Silences the following Valgrind warning:
-Conditional jump or move depends on uninitialised value(s)
-
-Upstream-Status: Backport from 5.5 branch
-
-Change-Id: I8fd8cfd6aa6f75ed515e6151cfc282faca508bdc
-Reviewed-by: Denis Shienkov <denis.shienkov@gmail.com>
-Signed-off-by: Jonathan Liu <net147@gmail.com>
----
- src/serialport/qserialport_unix.cpp | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/serialport/qserialport_unix.cpp b/src/serialport/qserialport_unix.cpp
-index cda73b2..62c454c 100644
---- a/src/serialport/qserialport_unix.cpp
-+++ b/src/serialport/qserialport_unix.cpp
-@@ -451,6 +451,8 @@ QSerialPortPrivate::setStandardBaudRate(qint32 baudRate, QSerialPort::Directions
- {
-     struct serial_struct currentSerialInfo;
- 
-+    ::memset(&currentSerialInfo, 0, sizeof(currentSerialInfo));
-+
-     if ((::ioctl(descriptor, TIOCGSERIAL, &currentSerialInfo) != -1)
-             && (currentSerialInfo.flags & ASYNC_SPD_CUST)) {
-         currentSerialInfo.flags &= ~ASYNC_SPD_CUST;
-@@ -481,6 +483,8 @@ QSerialPortPrivate::setCustomBaudRate(qint32 baudRate, QSerialPort::Directions d
- 
-     struct serial_struct currentSerialInfo;
- 
-+    ::memset(&currentSerialInfo, 0, sizeof(currentSerialInfo));
-+
-     if (::ioctl(descriptor, TIOCGSERIAL, &currentSerialInfo) == -1)
-         return decodeSystemError();
- 
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtserialport.inc b/recipes-qt/qt5/qtserialport.inc
index c9877c6..8bb168e 100644
--- a/recipes-qt/qt5/qtserialport.inc
+++ b/recipes-qt/qt5/qtserialport.inc
@@ -1,9 +1,5 @@
 require qt5.inc
 
-SRC_URI += " \
-    file://0001-Unix-Clear-serial_struct-instances.patch \
-"
-
 DEPENDS += "qtbase"
 
 # text of LGPL_EXCEPTION.txt and LICENSE.FDL is slightly different than what
diff --git a/recipes-qt/qt5/qtserialport_5.4.1.bb b/recipes-qt/qt5/qtserialport_5.4.1.bb
index 2349ad3..bf140d3 100644
--- a/recipes-qt/qt5/qtserialport_5.4.1.bb
+++ b/recipes-qt/qt5/qtserialport_5.4.1.bb
@@ -1,5 +1,9 @@
 require qt5-${PV}.inc
 require ${PN}.inc
 
+SRC_URI += " \
+    file://0001-Unix-Clear-serial_struct-instances.patch \
+"
+
 SRC_URI[md5sum] = "2333d25916a74260ce39b8a77c7c4288"
 SRC_URI[sha256sum] = "79d99e826bf49e469a651cdc2d499d8b54e52bb8aaa279719a3afa03eba5d0ff"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index a4e471b..4b5c1e2 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "b84fe7eb3d6d977a347bfbb82da724409b2eda69"
+SRCREV = "03629b992766fe30ad148ccdf732e0aa1ec0171e"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index b9e57f5..4491715 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "1fb79c9f2b50294b989cf2bdd8bfaaf0a458e2a8"
+SRCREV = "7e767afb429910adc0e9a219c5d600b55f6d72d1"
diff --git a/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
index cb12fc1..a0e386c 100644
--- a/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
+++ b/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
@@ -1,4 +1,4 @@
-From 6d3adbdeee29af76b41a319016dfd396659ac0b0 Mon Sep 17 00:00:00 2001
+From 3bf42c051d7bdaaaf0058d6b91446558b9a2e273 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.jansa@gmail.com>
 Date: Wed, 11 Sep 2013 18:30:08 +0200
 Subject: [PATCH 1/3] Allow to build only lrelease + lupdate + lconvert
@@ -15,8 +15,8 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  src/designer/src/src.pro  | 16 +++++++++-------
  src/linguist/linguist.pro |  2 +-
  src/src.pro               | 14 ++++++++------
- tests/auto/auto.pro       | 24 +++++++++++++-----------
- 5 files changed, 33 insertions(+), 26 deletions(-)
+ tests/auto/auto.pro       | 22 ++++++++++++----------
+ 5 files changed, 32 insertions(+), 25 deletions(-)
 
 diff --git a/examples/examples.pro b/examples/examples.pro
 index 69365d1..da7b38b 100644
@@ -75,7 +75,7 @@ index 3a70580..a977878 100644
  qtNomakeTools( \
      linguist \
 diff --git a/src/src.pro b/src/src.pro
-index 722b32e..9453152 100644
+index 494898f..c02848d 100644
 --- a/src/src.pro
 +++ b/src/src.pro
 @@ -4,10 +4,12 @@ qtHaveModule(widgets) {
@@ -91,15 +91,15 @@ index 722b32e..9453152 100644
 +                  qtestlib
 +        }
 +        SUBDIRS += designer
- #    unix:!mac:!embedded:!qpa:SUBDIRS += qtconfig
  
          linguist.depends = designer
+     }
 @@ -15,7 +17,7 @@ qtHaveModule(widgets) {
- }
  
- SUBDIRS += linguist
+ SUBDIRS += linguist \
+     qtplugininfo
 -if(!android|android_app):!ios: SUBDIRS += qtpaths
-+if(!android|android_app):!linguistonly:!ios: SUBDIRS += qtpaths
++if(!android|android_app):!ios:!linguistonly: SUBDIRS += qtpaths
  
  mac {
      SUBDIRS += macdeployqt
@@ -118,14 +118,13 @@ index 722b32e..9453152 100644
  qtNomakeTools( \
      pixeltool \
 diff --git a/tests/auto/auto.pro b/tests/auto/auto.pro
-index df240e3..27ee687 100644
+index a703a06..44bae18 100644
 --- a/tests/auto/auto.pro
 +++ b/tests/auto/auto.pro
-@@ -1,15 +1,17 @@
+@@ -1,14 +1,16 @@
  TEMPLATE=subdirs
 -SUBDIRS=\
 -    linguist \
--    host.pro \
 -    qhelpcontentmodel \
 -    qhelpenginecore \
 -    qhelpgenerator \
@@ -137,7 +136,6 @@ index df240e3..27ee687 100644
 +!linguistonly {
 +    SUBDIRS=\
 +        linguist \
-+        host.pro \
 +        qhelpcontentmodel \
 +        qhelpenginecore \
 +        qhelpgenerator \
diff --git a/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch b/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch
index 72fc3a4..6748d6a 100644
--- a/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch
+++ b/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch
@@ -1,4 +1,4 @@
-From 5bf38c5d5555ddcaea4a601fdfa304b3f0e5b943 Mon Sep 17 00:00:00 2001
+From 6536a983e2d1d73208cd01308bbfef08e566cba2 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 17 Jan 2014 14:33:19 +0100
 Subject: [PATCH 2/3] assistant/help: fix linking of dependent libraries
diff --git a/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch
index 7ceb84a..117d065 100644
--- a/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch
@@ -1,4 +1,4 @@
-From c9f7a83107d01b30cb150f7783441fe73003cfa1 Mon Sep 17 00:00:00 2001
+From 785fc0e42406ba3d3428a93714a786e38b6cf161 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
 Subject: [PATCH 3/3] add noqtwebkit configuration
@@ -16,24 +16,24 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  2 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/src/assistant/assistant/assistant.pro b/src/assistant/assistant/assistant.pro
-index 6e82b07..56df78c 100644
+index ef5c595..9c2dc1c 100644
 --- a/src/assistant/assistant/assistant.pro
 +++ b/src/assistant/assistant/assistant.pro
 @@ -1,4 +1,4 @@
 -qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static) {
 +qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static):!contains(CONFIG, noqtwebkit) {
-     QT += webkitwidgets
+     BROWSER = qtwebkit
  } else {
-     DEFINES += QT_NO_WEBKIT
-@@ -71,7 +71,7 @@ SOURCES += aboutdialog.cpp \
-     openpageswidget.cpp \
+     BROWSER = qtextbrowser
+@@ -75,7 +75,7 @@ SOURCES += aboutdialog.cpp \
      openpagesmanager.cpp \
      openpagesswitcher.cpp
--qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static) {
-+qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static):!contains(CONFIG, noqtwebkit) {
+ 
+-equals(BROWSER, "qtwebkit") {
++equals(BROWSER, "qtwebkit"):!contains(CONFIG, noqtwebkit) {
+     DEFINES += BROWSER_QTWEBKIT
+     QT += webkitwidgets
      SOURCES += helpviewer_qwv.cpp
- } else {
-     SOURCES += helpviewer_qtb.cpp
 diff --git a/src/designer/src/plugins/plugins.pro b/src/designer/src/plugins/plugins.pro
 index 500a153..b60fa2d 100644
 --- a/src/designer/src/plugins/plugins.pro
diff --git a/recipes-qt/qt5/qttools-native_git.bb b/recipes-qt/qt5/qttools-native_git.bb
index bbaafc5..8362380 100644
--- a/recipes-qt/qt5/qttools-native_git.bb
+++ b/recipes-qt/qt5/qttools-native_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "7f5b11a4a6357d2969e5b24bfb25c47aeb3d99f5"
+SRCREV = "975763169166961f66826998ac44d88ffe3e535e"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
                     file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index bbaafc5..8362380 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "7f5b11a4a6357d2969e5b24bfb25c47aeb3d99f5"
+SRCREV = "975763169166961f66826998ac44d88ffe3e535e"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
                     file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index a16b6ff..0823f8e 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "1224b6890e0b0971e5eeea9f52d806f1890de0ed"
+SRCREV = "8eb8dcb1af39cd6129031becc52fa4d6222166e3"
diff --git a/recipes-qt/qt5/qtwayland-git/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch b/recipes-qt/qt5/qtwayland-git/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
index a7be5e5..17b0fb4 100644
--- a/recipes-qt/qt5/qtwayland-git/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
+++ b/recipes-qt/qt5/qtwayland-git/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
@@ -1,4 +1,4 @@
-From ecaf131c0307f198f8efbf06410976ded97aab80 Mon Sep 17 00:00:00 2001
+From 03f7e2bfbc5955797c51ffe6bb9c46c8a73f164e Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Fri, 19 Jul 2013 13:35:14 +0000
 Subject: [PATCH] Install the qtwaylandscanner tool to the native side
@@ -28,5 +28,5 @@ index ac2d07b..7a46a24 100644
 +target.path = $$[QT_HOST_BINS]
 +INSTALLS += target
 -- 
-2.3.1
+2.3.5
 
diff --git a/recipes-qt/qt5/qtwayland-git/0001-examples-wayland-include-server-buffer-only-when-bui.patch b/recipes-qt/qt5/qtwayland-git/0001-examples-wayland-include-server-buffer-only-when-bui.patch
index e1a41db..a08584e 100644
--- a/recipes-qt/qt5/qtwayland-git/0001-examples-wayland-include-server-buffer-only-when-bui.patch
+++ b/recipes-qt/qt5/qtwayland-git/0001-examples-wayland-include-server-buffer-only-when-bui.patch
@@ -1,4 +1,4 @@
-From 90fc9f3f059c19e84ffd29718482a2f06ec3f0bf Mon Sep 17 00:00:00 2001
+From d9c75fd4b165d1701affee4aa11628c61a06513a Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 22 Feb 2014 17:47:44 +0100
 Subject: [PATCH] examples/wayland: include server-buffer only when building
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index 3be3e51..39a82f2 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "d5e7965a87d81e2d7157c785403b0aba681de62a"
+SRCREV = "1783179280dda6e470b0a429d4533db544b3c7b2"
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 93ef54a..9ab83c9 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "d5e7965a87d81e2d7157c785403b0aba681de62a"
+SRCREV = "1783179280dda6e470b0a429d4533db544b3c7b2"
 
 SRC_URI += " \
     file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index 30fcde8..158f644 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "358e5acba3154a8ab4b53b22797c2c1eae4707dc"
+SRCREV = "ccb40b720a675242b5b93333e5a56d5938086e0c"
diff --git a/recipes-qt/qt5/qtwebengine-git/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch b/recipes-qt/qt5/qtwebengine-git/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
index b4a8852..f90718b 100644
--- a/recipes-qt/qt5/qtwebengine-git/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
+++ b/recipes-qt/qt5/qtwebengine-git/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
@@ -1,4 +1,4 @@
-From 21d008c31a262ddcaeb3a8457de49061361ed882 Mon Sep 17 00:00:00 2001
+From 59e305219cdaeac6d143cb0466a2f518b4050688 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Fri, 3 Oct 2014 03:52:11 +0200
 Subject: [PATCH] <chromium> base.gypi: include atomicops_internals_x86_gcc.cc
@@ -23,5 +23,5 @@ index a5a990a..af30cfa 100644
                  ['include', 'atomicops_internals_x86_gcc.cc'],
                ],
 -- 
-2.3.1
+2.3.5
 
diff --git a/recipes-qt/qt5/qtwebengine-git/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch b/recipes-qt/qt5/qtwebengine-git/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
index 134133b..ac1f045 100644
--- a/recipes-qt/qt5/qtwebengine-git/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
+++ b/recipes-qt/qt5/qtwebengine-git/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
@@ -1,4 +1,4 @@
-From b6ca6c086aa21985e17d11592a830f18159f1c3b Mon Sep 17 00:00:00 2001
+From f2cbe0dd9a700c10446126a574188bef48f03040 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 30 Jun 2014 20:08:17 +0200
 Subject: [PATCH 1/3] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
@@ -10,17 +10,18 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 4c2547d..64c08ad 100644
+index e1864f7..314b50d 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -87,8 +87,8 @@ defineReplace(findIncludedMocFiles) {
- defineReplace(mocOutput) {
+@@ -98,9 +98,9 @@ defineReplace(mocOutput) {
    out = $$1
    # The order is important, since the output of the second replace would end up accidentaly transformed by the first one
--  out = $$replace(out, ^(.*)($$join(QMAKE_EXT_CPP,|)), $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
--  out = $$replace(out, ^(.*)($$join(QMAKE_EXT_H,|)), $${QMAKE_H_MOD_MOC}\\1$${first(QMAKE_EXT_CPP)})
-+  out = $$replace(out, ^(.*)($$join(QMAKE_EXT_CPP,|))$, $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
-+  out = $$replace(out, ^(.*)($$join(QMAKE_EXT_H,|))$, $${QMAKE_H_MOD_MOC}\\1$${first(QMAKE_EXT_CPP)})
+   for(ext, $$list($${QMAKE_EXT_CPP})): \
+-      out = $$replace(out, ^(.*)($$re_escape($${ext})), $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
++      out = $$replace(out, ^(.*)($$re_escape($${ext}))$, $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
+   for(ext, $$list($${QMAKE_EXT_H})): \
+-      out = $$replace(out, ^(.*)($$re_escape($${ext})), $${QMAKE_H_MOD_MOC}\\1$${first(QMAKE_EXT_CPP)})
++      out = $$replace(out, ^(.*)($$re_escape($${ext}))$, $${QMAKE_H_MOD_MOC}\\1$${first(QMAKE_EXT_CPP)})
    return($$out)
  }
  
diff --git a/recipes-qt/qt5/qtwebengine-git/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch b/recipes-qt/qt5/qtwebengine-git/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
index 8d1c5fd..a17342e 100644
--- a/recipes-qt/qt5/qtwebengine-git/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
+++ b/recipes-qt/qt5/qtwebengine-git/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
@@ -1,4 +1,4 @@
-From cfe706846298d41defbf0386f85b17e70108b7af Mon Sep 17 00:00:00 2001
+From abd57c8b1a1dd881f4ab3663466b44f095416d87 Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Tue, 18 Nov 2014 10:38:18 +0100
 Subject: [PATCH 2/3] functions.prf: Make sure we only use the file name to
@@ -11,10 +11,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 64c08ad..b46478b 100644
+index 314b50d..d6c4d3f 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -85,7 +85,8 @@ defineReplace(findIncludedMocFiles) {
+@@ -95,7 +95,8 @@ defineReplace(findIncludedMocFiles) {
  }
  
  defineReplace(mocOutput) {
@@ -22,8 +22,8 @@ index 64c08ad..b46478b 100644
 +  in = $$1
 +  out = $$basename(in)
    # The order is important, since the output of the second replace would end up accidentaly transformed by the first one
-   out = $$replace(out, ^(.*)($$join(QMAKE_EXT_CPP,|))$, $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
-   out = $$replace(out, ^(.*)($$join(QMAKE_EXT_H,|))$, $${QMAKE_H_MOD_MOC}\\1$${first(QMAKE_EXT_CPP)})
+   for(ext, $$list($${QMAKE_EXT_CPP})): \
+       out = $$replace(out, ^(.*)($$re_escape($${ext}))$, $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
 -- 
 2.3.5
 
diff --git a/recipes-qt/qt5/qtwebengine-git/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine-git/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
index 4e5e453..595a359 100644
--- a/recipes-qt/qt5/qtwebengine-git/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtwebengine-git/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From 9595a2dd48dbf45ba1661cf1fd4d38fac8192a4f Mon Sep 17 00:00:00 2001
+From 4edda6f03a3a0e47aaa0322da089e8f701b45700 Mon Sep 17 00:00:00 2001
 From: Frieder Schrempf <frieder.schrempf@online.de>
 Date: Mon, 1 Dec 2014 14:34:40 +0000
 Subject: [PATCH 3/3] functions.prf: allow build for linux-oe-g++ platform
@@ -12,10 +12,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index b46478b..6205bf4 100644
+index d6c4d3f..fcf8561 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -10,7 +10,7 @@ defineTest(isPlatformSupported) {
+@@ -14,7 +14,7 @@ defineTest(isPlatformSupported) {
  
    linux-g++*:!isGCCVersionSupported(): return(false)
    !isPythonVersionSupported(): return(false)
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 81c5333..d11611a 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -1,8 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-QT_MODULE_BRANCH = "5.4"
-QT_MODULE_BRANCH_CHROMIUM = "37.0.2062-based"
+QT_MODULE_BRANCH_CHROMIUM = "40.0.2214-based"
 
 SRC_URI += " \
     git://gitorious.org/qt/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};destsuffix=git/src/3rdparty \
@@ -11,8 +10,8 @@ SRC_URI += " \
     file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
     file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch \
 "
-SRCREV_qtwebengine = "b0c48cb3a0c9630899a357fb8a01ba13ccad5395"
-SRCREV_chromium = "140893bef70011645c686f5fabe45018dd2e392a"
+SRCREV_qtwebengine = "f5ec28285ab7f71d6d75af963ae499603da6630e"
+SRCREV_chromium = "6b1784803e5333987c5e86087ec782a3eaacfa76"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine"
diff --git a/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch b/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch
index dd73fe6..223991a 100644
--- a/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch
+++ b/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch
@@ -1,4 +1,4 @@
-From 52f75c43702ab04f3426025eea80155aa27b3422 Mon Sep 17 00:00:00 2001
+From a3c5765b9ef6e45db847c79ed333ed5e124dbecb Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Tue, 8 Oct 2013 00:18:10 -0400
 Subject: [PATCH] qtwebkit-examples: enable building examples by default
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index 7225ae5..3ff807f 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "734663277730bc20dacf0a6b07427002a53cc107"
+SRCREV = "0dc8719647eca19fd0828a86f5e61d21e0b774ad"
diff --git a/recipes-qt/qt5/qtwebkit-git/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/recipes-qt/qt5/qtwebkit-git/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
index 886a954..3711413 100644
--- a/recipes-qt/qt5/qtwebkit-git/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
+++ b/recipes-qt/qt5/qtwebkit-git/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
@@ -1,4 +1,4 @@
-From b3d43d2b8c1e11122ac36e3e0b102c2ffef83010 Mon Sep 17 00:00:00 2001
+From 47ea832054f3ae6cdbe713a276cb433101beecde Mon Sep 17 00:00:00 2001
 From: Trevor Woerner <trevor.woerner@linaro.org>
 Date: Fri, 7 Feb 2014 04:07:17 +0100
 Subject: [PATCH 1/2] qtwebkit: fix QA issue (bad RPATH)
diff --git a/recipes-qt/qt5/qtwebkit-git/0002-Remove-TEXTREL-tag-in-x86.patch b/recipes-qt/qt5/qtwebkit-git/0002-Remove-TEXTREL-tag-in-x86.patch
index de21a7c..b605f0b 100644
--- a/recipes-qt/qt5/qtwebkit-git/0002-Remove-TEXTREL-tag-in-x86.patch
+++ b/recipes-qt/qt5/qtwebkit-git/0002-Remove-TEXTREL-tag-in-x86.patch
@@ -1,4 +1,4 @@
-From 491cbd653eb7b992202f06bd2e62cf29f5f495af Mon Sep 17 00:00:00 2001
+From 519b1775717d3e595e2b645dbc624c864924fb1d Mon Sep 17 00:00:00 2001
 From: Magnus Granberg <zorry@gentoo.org>
 Date: Fri, 27 Feb 2015 11:55:09 +0100
 Subject: [PATCH 2/2] Remove TEXTREL tag in x86
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 3d39178..4c54800 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "738ad7e37c66f2afdbc7a77aff3ab7fa510361a2"
+SRCREV = "0f68b45974d9da98af22a5d33269bd31c8726221"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 4c96e25..d674dd1 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "5b469aa3c4d6b9c68feb9cf92d03614077518894"
+SRCREV = "0a9cbcf2894f4f9e621e0f5fb644d2b5e15ab2c7"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index 63ccdcb..57286af 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "bcc86311359e138ecc3a8fc1ce6eee1cda2ec0f5"
+SRCREV = "e6a813c7869fb3677b15b3907bd6647b5f80bd5e"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index 3bdbbdc..1dc967a 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "db784fb1c01ca2a0e7ada2c407cd1aab3aa98fee"
+SRCREV = "8d5f3bd730486b3fd3d5b1782fa70b80108c0ba4"
-- 
2.3.5


