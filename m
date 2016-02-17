Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0AB3D6FFA6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2016 21:56:31 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id c200so235854786wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2016 13:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=puJX6z3arNXx4j2Q50ODwq/dKolclcu5NZ9EPBznCEE=;
	b=WyKpUabuFp7gXUkje6Qzlgelvr0fQi8rlCdCZxI7ZbehCJsQo9vG0T0r1YAwgXEnWI
	UGGOK74hxVediJDsQjIXLPRfO0diMpHSPis84O+5qWpySqK1+Y+yoIoksSutafbTaCI5
	OJ/jruV0LT4npmYR0LTpYYUuuokYwBkXwAWoCEZR/f/ORlxbCWAO/SG0YuR3BBqsABDJ
	bv4k478cbKGwzy24EmbgvGbZIPPz8uUUO66poj3V613YXQbAn94r3gOxsre6/LJG8CsU
	4RRerdcvFJFpdrzN8DftNyTwa8JS9DCEnG2MR74GTJWw4Qtcdd1f0i35JldxlSzcCECv
	St2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=puJX6z3arNXx4j2Q50ODwq/dKolclcu5NZ9EPBznCEE=;
	b=ARoO7pmL+ED3OuMT0tv54GWpv+tkpU4LDtVFmy4AV0qpG07AWf/Db0jYKZMZ1174Vf
	opt2UilJtsQfeFV6TEYjl2R2gOx6+mVrcu+LEcTwhbYBCnsBg/gXFwopx/0M//80sKXQ
	79KzMPrKeGGBMDnStDRAYUatJEc2PCQtBmDQJtq98yx2G5ZobPmzkXM3cnhwramCcy5k
	uZQdinahFJDm84W6wRU5ZsmbUbKSx/yfyYBHc9LwiuLnZnnhsFUMf5tjxLMQPBgm/CfP
	ysoYQF975D/ZS4PXo0CoD6ucpSSc1RoYXdGefP6MWLXhyTsi1gSin+MURjStWiBwa7xG
	3rVg==
X-Gm-Message-State: AG10YOTDALx+GzMNCRLs+PG6hU0x6qegG+P3+YyuKd1GHTxvxqLVqBmM1BxSX+NpYX55yQ==
X-Received: by 10.194.92.174 with SMTP id cn14mr4843675wjb.66.1455746191992;
	Wed, 17 Feb 2016 13:56:31 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id b1sm3502331wjy.0.2016.02.17.13.56.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Feb 2016 13:56:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Feb 2016 22:56:42 +0100
Message-Id: <1455746205-31727-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455746205-31727-1-git-send-email-Martin.Jansa@gmail.com>
References: <1455746205-31727-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-qt5 2/5] qt5: upgrade to latest revisions in 5.6 branch (5.6 RC)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Feb 2016 21:56:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |  7 ++--
 recipes-qt/qt5/qt5-git.inc                         |  8 +----
 recipes-qt/qt5/qtbase-native_git.bb                |  6 ++--
 .../qt5/qtbase/0001-Add-linux-oe-g-platform.patch  | 22 ++++++------
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch | 10 +++---
 .../0003-Add-external-hostbindir-option.patch      | 28 +++++++--------
 ...le-Fix-pkgconfig-and-libtool-replacements.patch | 40 +++++++++-------------
 ...ump-path-length-from-256-to-512-character.patch | 10 +++---
 .../0006-QOpenGLPaintDevice-sub-area-support.patch | 18 +++++-----
 ...Invert-conditional-for-defining-QT_SOCKLE.patch |  6 ++--
 ...configure-paths-for-target-qmake-properly.patch | 18 +++++-----
 recipes-qt/qt5/qtbase/0009-Always-build-uic.patch  | 10 +++---
 ...external-hostbindir-option-for-native-sdk.patch | 20 +++++------
 recipes-qt/qt5/qtbase_git.bb                       |  6 ++--
 recipes-qt/qt5/qtcanvas3d_git.bb                   |  2 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |  2 +-
 .../0001-qmltestexample-fix-link.patch             |  4 +--
 recipes-qt/qt5/qtdeclarative_git.bb                |  2 +-
 recipes-qt/qt5/qtenginio_git.bb                    |  2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |  2 +-
 ...ats.pro-Make-the-dependencies-determinist.patch |  4 +--
 recipes-qt/qt5/qtimageformats_git.bb               |  2 +-
 recipes-qt/qt5/qtlocation_git.bb                   |  2 +-
 ...1-Initial-porting-effort-to-GStreamer-1.0.patch |  8 ++---
 recipes-qt/qt5/qtmultimedia_git.bb                 |  2 +-
 recipes-qt/qt5/qtquick1_git.bb                     |  2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |  2 +-
 recipes-qt/qt5/qtscript_git.bb                     |  2 +-
 recipes-qt/qt5/qtsensors_git.bb                    |  2 +-
 recipes-qt/qt5/qtserialport_git.bb                 |  2 +-
 ...pro-use-DEPLOYMENT-only-for-wince-like-ot.patch |  4 +--
 recipes-qt/qt5/qtsvg_git.bb                        |  2 +-
 recipes-qt/qt5/qtsystems_git.bb                    |  2 +-
 ...w-to-build-only-lrelease-lupdate-lconvert.patch |  4 +--
 ...t-help-fix-linking-of-dependent-libraries.patch |  4 +--
 .../0003-add-noqtwebkit-configuration.patch        |  4 +--
 ...ols-cmake-allow-overriding-the-location-f.patch |  4 +--
 recipes-qt/qt5/qttools_git.bb                      |  2 +-
 recipes-qt/qt5/qttranslations_git.bb               |  2 +-
 recipes-qt/qt5/qtwayland-native_git.bb             |  2 +-
 ...-qtwaylandscanner-tool-to-the-native-side.patch |  4 +--
 ...yland-include-server-buffer-only-when-bui.patch |  4 +--
 recipes-qt/qt5/qtwayland_git.bb                    |  2 +-
 recipes-qt/qt5/qtwebchannel_git.bb                 |  2 +-
 ...se.gypi-include-atomicops_internals_x86_g.patch |  8 ++---
 ...rf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch | 10 +++---
 ...nge-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch} |  8 +++--
 ...rf-Make-sure-we-only-use-the-file-name-to.patch | 10 +++---
 ...s.prf-allow-build-for-linux-oe-g-platform.patch | 32 ++++++++++-------
 ...uickwebengineview_p_p.h-add-include-QCol.patch} | 10 +++---
 ...dependency-to-QCoreApplication-translate.patch} |  6 ++--
 recipes-qt/qt5/qtwebengine_git.bb                  | 10 +++---
 recipes-qt/qt5/qtwebkit-examples_git.bb            |  2 +-
 .../0001-qtwebkit-fix-QA-issue-bad-RPATH.patch     |  4 +--
 .../qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch  |  4 +--
 ...ude-backtrace-API-for-non-glibc-libraries.patch |  4 +--
 recipes-qt/qt5/qtwebkit_git.bb                     |  2 +-
 recipes-qt/qt5/qtwebsockets_git.bb                 |  2 +-
 recipes-qt/qt5/qtx11extras_git.bb                  |  2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |  2 +-
 60 files changed, 204 insertions(+), 205 deletions(-)
 rename recipes-qt/qt5/qtwebengine/{0001-chromium-jpeg_codec.cc_Change-false-to-FALSE-and-1-to-TRUE.patch => 0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch} (91%)
 rename recipes-qt/qt5/qtwebengine/{0003-WebEngine-qquickwebengineview_p_p.h-add-inc-QColor.patch => 0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch} (72%)
 rename recipes-qt/qt5/qtwebengine/{0002-media_capture_devices_dispatcher.h-Include-QCoreApplication-translate.patch => 0005-Include-dependency-to-QCoreApplication-translate.patch} (82%)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index ccb0922..70b596d 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -5,13 +5,14 @@ HOMEPAGE = "http://qt-project.org"
 
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.LGPLv21;md5=d3bb688e8d381a9fa5ee9063114b366d \
+    file://LICENSE.LGPLv3;md5=3fd06ee442011942b532cc6dedb0b39c \
     file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
+
 QT_MODULE = "qtbase"
 
 require nativesdk-qt5.inc
@@ -255,4 +256,4 @@ fakeroot do_generate_qt_environment_file() {
 
 addtask generate_qt_environment_file after do_install before do_package
 
-SRCREV = "f7f4dde80e13ff1c05a9399297ffb746ab505e62"
+SRCREV = "ac8a3b948da1980bc59bae3fc76d20b5b45662a0"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index bf0be7e..f6149fb 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -11,10 +11,4 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-PV = "5.5.99+5.6.0-alpha1+git${SRCPV}"
-
-#LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
-#LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-#                    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
-#                    file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
-#                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+PV = "5.5.99+5.6.0-rc+git${SRCPV}"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 0683708..bb10438 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -4,8 +4,8 @@ SECTION = "libs"
 HOMEPAGE = "http://qt-project.org"
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.LGPLv21;md5=d3bb688e8d381a9fa5ee9063114b366d \
+    file://LICENSE.LGPLv3;md5=3fd06ee442011942b532cc6dedb0b39c \
     file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
@@ -117,4 +117,4 @@ do_install() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "f7f4dde80e13ff1c05a9399297ffb746ab505e62"
+SRCREV = "ac8a3b948da1980bc59bae3fc76d20b5b45662a0"
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index 9f5bb63..bca154c 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -1,7 +1,7 @@
-From 729b7873256b11778832c5786dc50fd9ea860a7d Mon Sep 17 00:00:00 2001
+From f35a940471022c31dfd72aa5d1c942ce64ca5a6a Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
-Subject: [PATCH 1/9] Add linux-oe-g++ platform
+Subject: [PATCH 01/10] Add linux-oe-g++ platform
 
 * This qmake.conf unlike other platforms reads most variables from
   shell environment, because it's easier for qt recipes to export
@@ -56,7 +56,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
 diff --git a/configure b/configure
-index 16e8fb4..9897fe6 100755
+index 1473a62..15207bf 100755
 --- a/configure
 +++ b/configure
 @@ -342,6 +342,16 @@ getQMakeConf()
@@ -124,7 +124,7 @@ index 16e8fb4..9897fe6 100755
  fi'`
      eval "$cmd"
  done
-@@ -3400,7 +3410,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
+@@ -3418,7 +3428,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
      [ "$CFG_QGTKSTYLE" = "auto" ] && CFG_QGTKSTYLE=no
  fi
  
@@ -133,7 +133,7 @@ index 16e8fb4..9897fe6 100755
  
  TEST_COMPILER=$QMAKE_CONF_COMPILER
  
-@@ -3457,7 +3467,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
+@@ -3475,7 +3485,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
          exit 1
      fi
  fi
@@ -142,7 +142,7 @@ index 16e8fb4..9897fe6 100755
  
  GCC_MACHINE_DUMP=
  case "$TEST_COMPILER" in *g++) GCC_MACHINE_DUMP=$($TEST_COMPILER -dumpmachine);; esac
-@@ -3958,6 +3968,14 @@ setBootstrapVariable()
+@@ -3976,6 +3986,14 @@ setBootstrapVariable()
      getQMakeConf "$1" | echo ${2-$1} = `if [ -n "$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
  }
  
@@ -157,7 +157,7 @@ index 16e8fb4..9897fe6 100755
  # build qmake
  if true; then ###[ '!' -f "$outpath/bin/qmake" ];
      echo "Creating qmake..."
-@@ -3996,14 +4014,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+@@ -4014,14 +4032,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
          fi
  
          [ "$CFG_SILENT" = "yes" ] && CC_TRANSFORM='s,^,\@,' || CC_TRANSFORM=
@@ -178,9 +178,9 @@ index 16e8fb4..9897fe6 100755
 +        setBootstrapEvalVariable QMAKE_LFLAGS
 +        setBootstrapEvalVariable QMAKE_LFLAGS_GCSECTIONS
  
-         if [ "$CFG_RELEASE_QMAKE" = "yes" ]; then
+         if [ "$CFG_RELEASE_TOOLS" = "yes" ]; then
              setBootstrapVariable QMAKE_CFLAGS_RELEASE
-@@ -4052,6 +4070,7 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+@@ -4070,6 +4088,7 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
                          \"\$(SOURCE_PATH)/src/corelib/io/qfsfileengine_unix.cpp\" \
                          \"\$(SOURCE_PATH)/src/corelib/tools/qlocale_unix.cpp\""
              EXEEXT=
@@ -209,7 +209,7 @@ index 6b37a04..dcf6025 100644
              write_file($$QMAKE_CONFIG_LOG, msg, append)
 diff --git a/mkspecs/linux-oe-g++/qmake.conf b/mkspecs/linux-oe-g++/qmake.conf
 new file mode 100644
-index 0000000..d0a4166
+index 0000000..311ba04
 --- /dev/null
 +++ b/mkspecs/linux-oe-g++/qmake.conf
 @@ -0,0 +1,42 @@
@@ -362,5 +362,5 @@ index 0000000..dd12003
 +
 +#endif // QPLATFORMDEFS_H
 -- 
-2.6.2
+2.7.1
 
diff --git a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index 0183238..dcd59ab 100644
--- a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,8 +1,8 @@
-From f902b73eda6d459a3669fd78a3c8908ae13e705b Mon Sep 17 00:00:00 2001
+From 2fbde67aa4184e31ccbfae95e884b89567883904 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
-Subject: [PATCH 2/9] qlibraryinfo: allow to set qt.conf from the outside using
- the environment
+Subject: [PATCH 02/10] qlibraryinfo: allow to set qt.conf from the outside
+ using the environment
 
 Allow to set a qt.conf from the outside using the environment. This allows
 to inject new prefixes and other paths into qmake. This is needed when using
@@ -19,7 +19,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 0cfcc4e..c3b5c2d 100644
+index 8bcacca..e1c87b5 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
 @@ -157,7 +157,10 @@ void QLibrarySettings::load()
@@ -35,5 +35,5 @@ index 0cfcc4e..c3b5c2d 100644
          return new QSettings(qtconfig, QSettings::IniFormat);
  #ifdef QT_BUILD_QMAKE
 -- 
-2.6.2
+2.7.1
 
diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
index ea15279..0cb8363 100644
--- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
@@ -1,7 +1,7 @@
-From 175d86ddb36117c0ca2ff47ae42693980dbfa098 Mon Sep 17 00:00:00 2001
+From b28148fd6ee59d584e59a07736da63ee9ea5c1ad Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH 3/9] Add -external-hostbindir option
+Subject: [PATCH 03/10] Add -external-hostbindir option
 
 * when cross-compiling it's sometimes useful to use existing tools from machine
   (or in OpenEmbedded built with separate native recipe) when building for target
@@ -37,10 +37,10 @@ Conflicts:
  7 files changed, 38 insertions(+), 12 deletions(-)
 
 diff --git a/configure b/configure
-index 9897fe6..aa89d30 100755
+index 15207bf..8fafeca 100755
 --- a/configure
 +++ b/configure
-@@ -808,6 +808,7 @@ QT_HOST_BINS=
+@@ -810,6 +810,7 @@ QT_HOST_BINS=
  QT_HOST_LIBS=
  QT_HOST_DATA=
  QT_EXT_PREFIX=
@@ -48,7 +48,7 @@ index 9897fe6..aa89d30 100755
  
  #flags for SQL drivers
  QT_CFLAGS_PSQL=
-@@ -927,6 +928,7 @@ while [ "$#" -gt 0 ]; do
+@@ -929,6 +930,7 @@ while [ "$#" -gt 0 ]; do
      -testsdir| \
      -hostdatadir| \
      -hostbindir| \
@@ -56,7 +56,7 @@ index 9897fe6..aa89d30 100755
      -hostlibdir| \
      -extprefix| \
      -sysroot| \
-@@ -1157,6 +1159,9 @@ while [ "$#" -gt 0 ]; do
+@@ -1159,6 +1161,9 @@ while [ "$#" -gt 0 ]; do
      extprefix)
          QT_EXT_PREFIX="$VAL"
          ;;
@@ -66,7 +66,7 @@ index 9897fe6..aa89d30 100755
      pkg-config)
          if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
              CFG_PKGCONFIG="$VAL"
-@@ -2419,6 +2424,10 @@ Installation options:
+@@ -2428,6 +2433,10 @@ Installation options:
      -hostdatadir <dir> . Data used by qmake will be installed to <dir>
                           (default HOSTPREFIX)
  
@@ -77,7 +77,7 @@ index 9897fe6..aa89d30 100755
  Configure options:
  
   The defaults (*) are usually acceptable. A plus (+) denotes a default value
-@@ -3158,6 +3167,11 @@ fi
+@@ -3172,6 +3181,11 @@ fi
  # command line and environment validation
  #-------------------------------------------------------------------------------
  
@@ -90,7 +90,7 @@ index 9897fe6..aa89d30 100755
  CFG_QCONFIG_PATH=$relpath/src/corelib/global/qconfig-${CFG_QCONFIG}.h
  case "$CFG_QCONFIG" in
 diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
-index 6616aa4..3d40bf9 100644
+index b2c2507..fba4a58 100644
 --- a/mkspecs/features/qt_functions.prf
 +++ b/mkspecs/features/qt_functions.prf
 @@ -57,7 +57,11 @@ defineTest(qtHaveModule) {
@@ -107,7 +107,7 @@ index 6616aa4..3d40bf9 100644
              cmd = perl -w $$system_path($${cmd}.pl)
          } else: contains(QMAKE_HOST.os, Windows) {
 diff --git a/mkspecs/features/qt_tool.prf b/mkspecs/features/qt_tool.prf
-index 3f0301a..7dc66de 100644
+index 839c3d6..45934a0 100644
 --- a/mkspecs/features/qt_tool.prf
 +++ b/mkspecs/features/qt_tool.prf
 @@ -14,10 +14,11 @@ load(qt_app)
@@ -125,7 +125,7 @@ index 3f0301a..7dc66de 100644
  
      !host_build|!force_bootstrap: MODULE_DEPENDS = $$replace(QT, -private$, _private)
 diff --git a/qtbase.pro b/qtbase.pro
-index 24d0f52..d3d79b3 100644
+index 98ca86a..0eed475 100644
 --- a/qtbase.pro
 +++ b/qtbase.pro
 @@ -37,12 +37,16 @@ CONFIG -= qt
@@ -148,7 +148,7 @@ index 24d0f52..d3d79b3 100644
  }
  INSTALLS += qmake
  
-@@ -54,6 +58,9 @@ licheck.files = $$PWD/bin/$$QT_LICHECK
+@@ -59,6 +63,9 @@ INSTALLS += fixqt4headers
  #syncqt
  syncqt.path = $$[QT_HOST_BINS]
  syncqt.files = $$PWD/bin/syncqt.pl
@@ -159,7 +159,7 @@ index 24d0f52..d3d79b3 100644
  
  # If we are doing a prefix build, create a "module" pri which enables
 diff --git a/src/corelib/Qt5CoreConfigExtras.cmake.in b/src/corelib/Qt5CoreConfigExtras.cmake.in
-index 65fd1f9..457518b 100644
+index 91a4eb6..25df27c 100644
 --- a/src/corelib/Qt5CoreConfigExtras.cmake.in
 +++ b/src/corelib/Qt5CoreConfigExtras.cmake.in
 @@ -5,7 +5,7 @@ if (NOT TARGET Qt5::qmake)
@@ -225,5 +225,5 @@ index 99d87e2..5621dc0 100644
      _qt5_Widgets_check_file_exists(${imported_location})
  
 -- 
-2.6.2
+2.7.1
 
diff --git a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
index 2bbb92c..062db89 100644
--- a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -1,7 +1,7 @@
-From a76a6c33be512a2909904b6136a6044e4b747ffd Mon Sep 17 00:00:00 2001
+From 43305bc5cfe1db5021abb1bf2806dcc63b31f176 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
-Subject: [PATCH 4/9] qt_module: Fix pkgconfig and libtool replacements
+Subject: [PATCH 04/10] qt_module: Fix pkgconfig and libtool replacements
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -63,8 +63,8 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
  mkspecs/features/qt_common.prf |  2 +-
- mkspecs/features/qt_module.prf | 10 ++++++++++
- 2 files changed, 11 insertions(+), 1 deletion(-)
+ mkspecs/features/qt_module.prf | 11 +++++++++++
+ 2 files changed, 12 insertions(+), 1 deletion(-)
 
 diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_common.prf
 index 38602f6..f9c401f 100644
@@ -80,33 +80,27 @@ index 38602f6..f9c401f 100644
      lib_replace.CONFIG = path
      QMAKE_PRL_INSTALL_REPLACE += lib_replace
 diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_module.prf
-index 193629b..38ff9a8 100644
+index e543ea6..0624ce2 100644
 --- a/mkspecs/features/qt_module.prf
 +++ b/mkspecs/features/qt_module.prf
-@@ -255,6 +255,11 @@ unix|mingw {
-     pclib_replace.CONFIG = path
-     QMAKE_PKGCONFIG_INSTALL_REPLACE += pclib_replace
- 
+@@ -273,6 +273,17 @@ load(qt_targets)
+         ltlib_replace.replace = $$QMAKE_LIBTOOL_LIBDIR
+     ltlib_replace.CONFIG = path
+     QMAKE_LIBTOOL_INSTALL_REPLACE += ltlib_replace
++
 +    pkgconfig_include_replace.match = $$rplbase/include
 +    pkgconfig_include_replace.replace = "\$$\\{includedir}"
 +    pkgconfig_include_replace.CONFIG = path
 +    QMAKE_PKGCONFIG_INSTALL_REPLACE += pkgconfig_include_replace
 +
-     unix {
-         CONFIG += create_libtool explicitlib
-         host_build: \
-@@ -266,6 +271,11 @@ unix|mingw {
-             ltlib_replace.replace = $$QMAKE_LIBTOOL_LIBDIR
-         ltlib_replace.CONFIG = path
-         QMAKE_LIBTOOL_INSTALL_REPLACE += ltlib_replace
-+        # drop -L/usr/lib in .prl files
-+        prl_replace.match = "-L\$${libdir}"
-+        prl_replace.replace = ""
-+        prl_replace.CONFIG = path
-+        QMAKE_PRL_INSTALL_REPLACE += prl_replace
-     }
++    # drop -L/usr/lib in .prl files
++    prl_replace.match = "-L\$${libdir}"
++    prl_replace.replace = ""
++    prl_replace.CONFIG = path
++    QMAKE_PRL_INSTALL_REPLACE += prl_replace
  }
  
+ contains(QT_PRODUCT, OpenSource.*):DEFINES *= QT_OPENSOURCE
 -- 
-2.6.2
+2.7.0
 
diff --git a/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
index a3470f6..c93c6f5 100644
--- a/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,7 +1,7 @@
-From 9f80241e140b0e22d58aa2ac6ef13a277c38fe9f Mon Sep 17 00:00:00 2001
+From 8bc8e96a6ad707c5f399c307e519444a1fafc4fe Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Tue, 25 Aug 2015 10:05:15 -0400
-Subject: [PATCH 5/9] configure: bump path length from 256 to 512 characters
+Subject: [PATCH 05/10] configure: bump path length from 256 to 512 characters
 
 Increase the path length that gets hardcoded into generated config.cpp file
 from 256 to 512 characters, as nativesdk path can be quite long.
@@ -14,10 +14,10 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure b/configure
-index aa89d30..6edfffd 100755
+index 8fafeca..34c7b8b 100755
 --- a/configure
 +++ b/configure
-@@ -3912,10 +3912,10 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
+@@ -3930,10 +3930,10 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
  static const char qt_configure_installation          [12+11]    = "qt_instdate=2012-12-20";
  
  /* Installation Info */
@@ -32,5 +32,5 @@ index aa89d30..6edfffd 100755
  
  static const short qt_configure_str_offsets[] = {
 -- 
-2.6.2
+2.7.1
 
diff --git a/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch
index 0dbee0b..bd5cfac 100644
--- a/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch
+++ b/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch
@@ -1,7 +1,7 @@
-From 4772fd9332b7c71543d058c1e1cfa24399a9f269 Mon Sep 17 00:00:00 2001
+From a2a195bc2782ccf582afb00ffc25021abd2ba810 Mon Sep 17 00:00:00 2001
 From: Jani Hautakangas <jani.hautakangas@ixonos.com>
 Date: Thu, 16 May 2013 09:52:07 +0300
-Subject: [PATCH 6/9] QOpenGLPaintDevice sub-area support
+Subject: [PATCH 06/10] QOpenGLPaintDevice sub-area support
 
 Allows creating QOpenGLPaintDevice targetting sub-area
 of binded framebuffer.
@@ -81,10 +81,10 @@ index 54ea092..f660143 100644
  
      qreal dpmx;
 diff --git a/src/gui/opengl/qopenglpaintengine.cpp b/src/gui/opengl/qopenglpaintengine.cpp
-index 4836dde..3f99b16 100644
+index 0b92bf4..f41e059 100644
 --- a/src/gui/opengl/qopenglpaintengine.cpp
 +++ b/src/gui/opengl/qopenglpaintengine.cpp
-@@ -2091,7 +2091,10 @@ bool QOpenGL2PaintEngineEx::begin(QPaintDevice *pdev)
+@@ -2078,7 +2078,10 @@ bool QOpenGL2PaintEngineEx::begin(QPaintDevice *pdev)
      for (int i = 0; i < QT_GL_VERTEX_ARRAY_TRACKED_COUNT; ++i)
          d->vertexAttributeArraysEnabledState[i] = false;
  
@@ -95,7 +95,7 @@ index 4836dde..3f99b16 100644
      d->width = sz.width();
      d->height = sz.height();
      d->mode = BrushDrawingMode;
-@@ -2178,7 +2181,7 @@ void QOpenGL2PaintEngineEx::ensureActive()
+@@ -2165,7 +2168,7 @@ void QOpenGL2PaintEngineEx::ensureActive()
          d->device->ensureActiveTarget();
  
          d->transferMode(BrushDrawingMode);
@@ -104,7 +104,7 @@ index 4836dde..3f99b16 100644
          d->needsSync = false;
          d->shaderManager->setDirty();
          d->syncGlState();
-@@ -2220,6 +2223,7 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
+@@ -2207,6 +2210,7 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
      if (bounds == QRect(0, 0, width, height)) {
          funcs.glDisable(GL_SCISSOR_TEST);
      } else {
@@ -112,7 +112,7 @@ index 4836dde..3f99b16 100644
          funcs.glEnable(GL_SCISSOR_TEST);
          setScissor(bounds);
      }
-@@ -2228,12 +2232,13 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
+@@ -2215,12 +2219,13 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
  
  void QOpenGL2PaintEngineExPrivate::setScissor(const QRect &rect)
  {
@@ -128,7 +128,7 @@ index 4836dde..3f99b16 100644
  
      funcs.glScissor(left, bottom, width, height);
 diff --git a/src/gui/opengl/qopenglpaintengine_p.h b/src/gui/opengl/qopenglpaintengine_p.h
-index 17be72b..43e88f6 100644
+index f1ec669..6d302b8 100644
 --- a/src/gui/opengl/qopenglpaintengine_p.h
 +++ b/src/gui/opengl/qopenglpaintengine_p.h
 @@ -264,6 +264,7 @@ public:
@@ -153,5 +153,5 @@ index c179143..fad68d5 100644
      } else {
          if (m_vao.isCreated()) {
 -- 
-2.6.2
+2.7.1
 
diff --git a/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch b/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
index 55f8276..525396f 100644
--- a/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
+++ b/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
@@ -1,7 +1,7 @@
-From a3c5659464c911c60f31834187f3b1e914f0bf1f Mon Sep 17 00:00:00 2001
+From 4c68f97060427d3184589be4f25e1e366e26557c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 8 Jun 2015 13:59:25 -0700
-Subject: [PATCH 7/9] linux-oe-g++: Invert conditional for defining
+Subject: [PATCH 07/10] linux-oe-g++: Invert conditional for defining
  QT_SOCKLEN_T
 
 This helps to make sure that QT_SOCKLEN_T is defined to be 'int'
@@ -32,5 +32,5 @@ index dd12003..8623651 100644
  
  #if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE >= 500)
 -- 
-2.6.2
+2.7.1
 
diff --git a/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch b/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
index efd27a5..204b3bf 100644
--- a/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
+++ b/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
@@ -1,7 +1,7 @@
-From fb519b08f564a8a640b1b2f2b6a3bd54a83e19e8 Mon Sep 17 00:00:00 2001
+From 3e343061f8f8cb71fbb4f52e6e825495880779a2 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 13 Nov 2015 12:36:11 +0100
-Subject: [PATCH] configure paths/mkspecs for target qmake properly
+Subject: [PATCH 08/10] configure paths for target qmake properly
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -11,16 +11,18 @@ conditionally based on QT_CROSS_COMPILE
 
 Upstream-Status: Inappropriate [OE specific]
 
+Change-Id: I2b2f00c496216e98fbe14801f9e840ef5333c4b6
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
  configure | 23 +++++++++++++++++++----
  1 file changed, 19 insertions(+), 4 deletions(-)
 
 diff --git a/configure b/configure
-index 6edfffd..de74a29 100755
+index 34c7b8b..f9869dd 100755
 --- a/configure
 +++ b/configure
-@@ -3857,8 +3857,13 @@ if [ "$CFG_COMPILE_EXAMPLES" = "yes" ]; then
+@@ -3875,8 +3875,13 @@ if [ "$CFG_COMPILE_EXAMPLES" = "yes" ]; then
      QMAKE_CONFIG="$QMAKE_CONFIG compile_examples"
  fi
  
@@ -36,7 +38,7 @@ index 6edfffd..de74a29 100755
  
  QT_CONFIGURE_STR_OFF=0
  
-@@ -3891,7 +3896,11 @@ QT_CONFIGURE_STRS_ALL=$QT_CONFIGURE_STRS
+@@ -3909,7 +3914,11 @@ QT_CONFIGURE_STRS_ALL=$QT_CONFIGURE_STRS
  
  QT_CONFIGURE_STR_OFFSETS=
  QT_CONFIGURE_STRS=
@@ -49,7 +51,7 @@ index 6edfffd..de74a29 100755
  addConfStr "$QT_REL_HOST_BINS"
  addConfStr "$QT_REL_HOST_LIBS"
  addConfStr "$QT_REL_HOST_DATA"
-@@ -3903,6 +3912,12 @@ addConfStr "$shortspec"
+@@ -3921,6 +3930,12 @@ addConfStr "$shortspec"
  #-------------------------------------------------------------------------------
  [ -d "$outpath/src/corelib/global" ] || mkdir -p "$outpath/src/corelib/global"
  
@@ -62,7 +64,7 @@ index 6edfffd..de74a29 100755
  cat > "$outpath/src/corelib/global/qconfig.cpp.new" <<EOF
  /* License Info */
  static const char qt_configure_licensee_str          [256 + 12] = "qt_lcnsuser=$Licensee";
-@@ -3915,7 +3930,7 @@ static const char qt_configure_installation          [12+11]    = "qt_instdate=2
+@@ -3933,7 +3948,7 @@ static const char qt_configure_installation          [12+11]    = "qt_instdate=2
  static const char qt_configure_prefix_path_str       [512 + 12] = "qt_prfxpath=$QT_INSTALL_PREFIX";
  #ifdef QT_BUILD_QMAKE
  static const char qt_configure_ext_prefix_path_str   [512 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
@@ -72,5 +74,5 @@ index 6edfffd..de74a29 100755
  
  static const short qt_configure_str_offsets[] = {
 -- 
-2.1.0
+2.7.1
 
diff --git a/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
index 359be5f..4db32e7 100644
--- a/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
@@ -1,7 +1,7 @@
-From e3ce176f43e9214808cbdac13ace0aa8d8ec046d Mon Sep 17 00:00:00 2001
+From c9e825dd77c23dda786809ecb19ca1a88dccdf1b Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
-Subject: [PATCH 8/9] Always build uic
+Subject: [PATCH 09/10] Always build uic
 
 Even if we are not building gui or widgets. This tool is needed later
 as a native tool when compiling the target.
@@ -14,10 +14,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/src.pro b/src/src.pro
-index a970391..66c66d0 100644
+index 1671338..83de483 100644
 --- a/src/src.pro
 +++ b/src/src.pro
-@@ -176,7 +176,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
+@@ -180,7 +180,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
          }
      }
  }
@@ -27,5 +27,5 @@ index a970391..66c66d0 100644
  nacl: SUBDIRS -= src_network src_testlib
  
 -- 
-2.6.2
+2.7.1
 
diff --git a/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch b/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch
index 4d654a4..e088bba 100644
--- a/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch
+++ b/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch
@@ -1,7 +1,7 @@
-From 38ecbe7300925d440fa3d7c58e40ed5a53b2d73a Mon Sep 17 00:00:00 2001
+From 7c548d3833e29fade57855ef82ed2abd815b7fc4 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH 9/9] Add -external-hostbindir option for native(sdk)
+Subject: [PATCH 10/10] Add -external-hostbindir option for native(sdk)
 
 * when cross-compiling it's sometimes useful to use existing tools from machine
   (or in OpenEmbedded built with separate native recipe) when building for target
@@ -37,10 +37,10 @@ Conflicts:
  5 files changed, 16 insertions(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 6edfffd..313d921 100755
+index f9869dd..c81d02a 100755
 --- a/configure
 +++ b/configure
-@@ -3895,6 +3895,7 @@ addConfStr "$CFG_SYSROOT"
+@@ -3922,6 +3922,7 @@ fi
  addConfStr "$QT_REL_HOST_BINS"
  addConfStr "$QT_REL_HOST_LIBS"
  addConfStr "$QT_REL_HOST_DATA"
@@ -61,7 +61,7 @@ index 817ae95..c69539f 100644
      { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
  };
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index c3b5c2d..1381658 100644
+index e1c87b5..d6e03ba 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
 @@ -373,7 +373,7 @@ QLibraryInfo::isDebugBuild()
@@ -94,10 +94,10 @@ index 1ad7637..5a8b127 100644
          HostSpecPath,
          HostPrefixPath,
 diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index 6c3217b..980c578 100644
+index 555ccbf..d9a5b08 100644
 --- a/tools/configure/configureapp.cpp
 +++ b/tools/configure/configureapp.cpp
-@@ -1243,6 +1243,13 @@ void Configure::parseCmdLine()
+@@ -1248,6 +1248,13 @@ void Configure::parseCmdLine()
              dictionary[ "QT_EXT_PREFIX" ] = configCmdLine.at(i);
          }
  
@@ -111,7 +111,7 @@ index 6c3217b..980c578 100644
          else if (configCmdLine.at(i) == "-make-tool") {
              ++i;
              if (i == argCount)
-@@ -4198,6 +4205,9 @@ void Configure::generateQConfigCpp()
+@@ -4214,6 +4221,9 @@ void Configure::generateQConfigCpp()
  
      if (dictionary["QT_REL_HOST_DATA"].isEmpty())
          dictionary["QT_REL_HOST_DATA"] = haveHpx ? "." : dictionary["QT_REL_INSTALL_ARCHDATA"];
@@ -121,7 +121,7 @@ index 6c3217b..980c578 100644
  
      confStringOff = 0;
      addConfStr(0, dictionary["QT_REL_INSTALL_DOCS"]);
-@@ -4217,6 +4227,7 @@ void Configure::generateQConfigCpp()
+@@ -4233,6 +4243,7 @@ void Configure::generateQConfigCpp()
      addConfStr(1, dictionary["QT_REL_HOST_BINS"]);
      addConfStr(1, dictionary["QT_REL_HOST_LIBS"]);
      addConfStr(1, dictionary["QT_REL_HOST_DATA"]);
@@ -130,5 +130,5 @@ index 6c3217b..980c578 100644
      addConfStr(1, hostSpec);
  
 -- 
-2.6.2
+2.7.1
 
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 1db6b88..c5ea7bb 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -3,8 +3,8 @@ require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.LGPLv21;md5=d3bb688e8d381a9fa5ee9063114b366d \
+    file://LICENSE.LGPLv3;md5=3fd06ee442011942b532cc6dedb0b39c \
     file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
@@ -260,4 +260,4 @@ sysroot_stage_dirs_append() {
     rm -rf $to${OE_QMAKE_PATH_QT_FONTS}
 }
 
-SRCREV = "f7f4dde80e13ff1c05a9399297ffb746ab505e62"
+SRCREV = "ac8a3b948da1980bc59bae3fc76d20b5b45662a0"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index c892d9b..4990f34 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "a84dad27182ba6cb4c6f9bf4008a9e63346a7a83"
+SRCREV = "b351fb164af327828c9bdbc414ffd8e47e387e8c"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index f677f71..cf6d3c5 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -25,4 +25,4 @@ do_configure_prepend() {
     sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/qtconnectivity.pro
 }
 
-SRCREV = "a7617f963c1d375fb7ac7d5c17f450acdb2796b8"
+SRCREV = "dec32076b9153febc575a0418af702f8cb400258"
diff --git a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
index fd2586e..b3f7621 100644
--- a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
+++ b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
@@ -1,4 +1,4 @@
-From d5e0c3af853c7bdb202f15a12117db76f744cc55 Mon Sep 17 00:00:00 2001
+From 1755b8c7ab87f9e6bf072bd0bef50086c14dd9ff Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
 Date: Sun, 26 May 2013 14:26:19 +0200
 Subject: [PATCH] qmltestexample: fix link
@@ -84,5 +84,5 @@ index 1bb913e..56f2dd5 100644
  
  load(qt_tool)
 -- 
-2.6.1
+2.7.0
 
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index de71c39..93442fb 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -33,6 +33,6 @@ do_configure_prepend() {
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "1064d5100f4d00af5f56b87331251f97d78f8b87"
+SRCREV = "0fab5761d5428aa708edd66e40fc3c449adc4b11"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index 5854abe..5590abd 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
-SRCREV = "34d66f3836051dca35a854577fe04b45af3630f2"
+SRCREV = "60a135102aaa37d0d817883e4d6aed456372709d"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index 463e15b..c35cc80 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -17,4 +17,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "ad227e9808288b12726114365ae1474386c6cdf8"
+SRCREV = "24f3fd69a2e953619c48b4a632262ce8419fee40"
diff --git a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
index a112439..8964a5d 100644
--- a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
+++ b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
@@ -1,4 +1,4 @@
-From 903682bb95cc2cdb51a1155c3977d0ec8619a73d Mon Sep 17 00:00:00 2001
+From 14a68abb4c492fb7ba55dbccaf61057e861bbf3c Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 4 Aug 2014 19:19:05 +0200
 Subject: [PATCH] qtimageformats.pro: Make the dependencies deterministic
@@ -27,5 +27,5 @@ index 8382e5c..63d13ce 100644
  
  load(qt_parts)
 -- 
-2.6.1
+2.7.0
 
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index a847fb2..b49940b 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -28,4 +28,4 @@ EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'jasper', 'CONFIG+=OE_
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libtiff', 'CONFIG+=OE_LIBTIFF_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libwebp', 'CONFIG+=OE_LIBWEBP_ENABLED', '', d)}"
 
-SRCREV = "67cbcf399aa1a18b9b1dbac0a6572a865687230a"
+SRCREV = "58f19cf8d51e06f1781f3142e6d872e5feb0690e"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 2c66ad4..5072903 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -29,4 +29,4 @@ do_configure_prepend() {
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
 
-SRCREV = "1fd85dd9426b65198b396c686edd42e42d5b8149"
+SRCREV = "03163a3c9129b7f982b690e750056506c3d06b41"
diff --git a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
index 696f1c0..a4ac12a 100644
--- a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
+++ b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
@@ -1,4 +1,4 @@
-From 066a997479b2431d7bc479655ce37ae083e7a224 Mon Sep 17 00:00:00 2001
+From e8e2e289288acd3124536a41351e7bcd639bef07 Mon Sep 17 00:00:00 2001
 From: Yoann Lopes <yoann.lopes@digia.com>
 Date: Thu, 31 Oct 2013 15:06:30 +0100
 Subject: [PATCH] Initial porting effort to GStreamer 1.0.
@@ -17,10 +17,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 14 insertions(+), 12 deletions(-)
 
 diff --git a/qtmultimedia.pro b/qtmultimedia.pro
-index 1225ffb..4f675fe 100644
+index 98bb315..287887f 100644
 --- a/qtmultimedia.pro
 +++ b/qtmultimedia.pro
-@@ -18,19 +18,21 @@ win32 {
+@@ -17,19 +17,21 @@ win32 {
      contains(QT_CONFIG, alsa):qtCompileTest(alsa)
      contains(QT_CONFIG, pulseaudio):qtCompileTest(pulseaudio)
  
@@ -55,5 +55,5 @@ index 1225ffb..4f675fe 100644
  
      qtCompileTest(resourcepolicy)
 -- 
-2.6.1
+2.7.0
 
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 96a21cd..ce42302 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -35,4 +35,4 @@ SRC_URI += "\
      file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
 "
 
-SRCREV = "ac1b772ec8e428acd23322a6fccbde2bda6b8bd2"
+SRCREV = "3b6de26fe585c586d055ac86c5911cc6df0e3887"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index d7cf434..e0a264d 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -23,4 +23,4 @@ do_configure_prepend() {
     sed -i 's#^qtHaveModule(webkitwidgets):#enable-webkit:qtHaveModule(webkitwidgets):#g' ${S}/src/imports/imports.pro
 }
 
-SRCREV = "b0382acf65dbc0debcb7cf956ba954117a682d90"
+SRCREV = "87f2415adf34da08e6cd58f5da6f6a7d0d9cf141"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 644b70e..1e25d6e 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -13,4 +13,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "2e48d16e4a230069884ac0585ae111037f4171fb"
+SRCREV = "93d06fb27d7eae9290db33b6684916a225939f0b"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index c53217a..32f6ebf 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -27,4 +27,4 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEPENDS += "qtbase"
 
-SRCREV = "7ebf02ea3e8e91b13eb2d34847c005d8a487e9da"
+SRCREV = "a5e814fd8809dd6a8a3c3efd4b911b36e3325a2a"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index a422544..4fbd15b 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "d8d4a5e9ac1251e82d1ec639bc3bff7e7f53c083"
+SRCREV = "fbaca62cd0a7309f04bf82101c8e20dbbf423192"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index c95844c..f32a8e1 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "2575d33fab4042baba67384f92119c58c0ce0245"
+SRCREV = "02e4a66a8bd9ce4d2f7f8c89cd1bddf4b6385b5f"
diff --git a/recipes-qt/qt5/qtsvg/0001-textobject.pro-use-DEPLOYMENT-only-for-wince-like-ot.patch b/recipes-qt/qt5/qtsvg/0001-textobject.pro-use-DEPLOYMENT-only-for-wince-like-ot.patch
index 4c9c643..c0e1389 100644
--- a/recipes-qt/qt5/qtsvg/0001-textobject.pro-use-DEPLOYMENT-only-for-wince-like-ot.patch
+++ b/recipes-qt/qt5/qtsvg/0001-textobject.pro-use-DEPLOYMENT-only-for-wince-like-ot.patch
@@ -1,4 +1,4 @@
-From d539c7e4ef98fd4933573eac606a4edee6655d8c Mon Sep 17 00:00:00 2001
+From f3b363acbe125c1eb1f1d4cf28973d2914cda024 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Thu, 5 Nov 2015 12:25:05 +0100
 Subject: [PATCH] textobject.pro: use DEPLOYMENT only for wince like other
@@ -26,5 +26,5 @@ index 794ad32..0ecd2c7 100644
 +    DEPLOYMENT += filesToDeploy
 +}
 -- 
-2.6.2
+2.7.0
 
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 57e9b4f..d2699f7 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -13,6 +13,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "9ee5ee12a7b92a57624dafed935b3ac1fad426d9"
+SRCREV = "a9ac71a443260de66f720f0184646847b03fcb46"
 
 SRC_URI += "file://0001-textobject.pro-use-DEPLOYMENT-only-for-wince-like-ot.patch"
diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index 9d9d245..868e051 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -33,4 +33,4 @@ QT_MODULE_BRANCH = "dev"
 # qtsystems wasn't released yet, last tag before this SRCREV is 5.0.0-beta1
 # qt5-git PV is only to indicate that this recipe is compatible with qt5 5.6
 
-SRCREV = "0577ffca58b7fed78c1820fc1c2b7ab3533d5698"
+SRCREV = "cc2077700bd5503d1fcf53aef83cbb76975e745a"
diff --git a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
index e743a35..45a4fc7 100644
--- a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
+++ b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
@@ -1,4 +1,4 @@
-From 0fb675dfdff64a270b92d768bedc0d6b355675b4 Mon Sep 17 00:00:00 2001
+From a6f3bde30cb78e109a26fec6b336f8a504d4fa3c Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.jansa@gmail.com>
 Date: Wed, 11 Sep 2013 18:30:08 +0200
 Subject: [PATCH 1/4] Allow to build only lrelease + lupdate + lconvert
@@ -157,5 +157,5 @@ index 20b5fec..8a42d1f 100644
  installed_cmake.depends = cmake
  
 -- 
-2.6.2
+2.7.0
 
diff --git a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
index 754213f..c4c0a14 100644
--- a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
+++ b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
@@ -1,4 +1,4 @@
-From d480a725a36482f7a1df52c5c170961382a8e730 Mon Sep 17 00:00:00 2001
+From 1140fd4bb5768d49cad9e834a9ce5eb05b711d0e Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 17 Jan 2014 14:33:19 +0100
 Subject: [PATCH 2/4] assistant/help: fix linking of dependent libraries
@@ -28,5 +28,5 @@ index 168d23d..a9c3b59 100644
 +
 +LIBS += -lQt5CLucene
 -- 
-2.6.2
+2.7.0
 
diff --git a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
index 3e87400..81b511f 100644
--- a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
@@ -1,4 +1,4 @@
-From d26b82742e20d4fff96856f7b9a7828ccb1aea68 Mon Sep 17 00:00:00 2001
+From a0637f231d513dfc15f1eec185d5d5e7fb03e292 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
 Subject: [PATCH 3/4] add noqtwebkit configuration
@@ -47,5 +47,5 @@ index 500a153..b60fa2d 100644
  win32: qtHaveModule(axcontainer): SUBDIRS += activeqt
  qtHaveModule(quickwidgets): SUBDIRS += qquickwidget
 -- 
-2.6.2
+2.7.0
 
diff --git a/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch b/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
index 55e7ec5..0e7061a 100644
--- a/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
+++ b/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
@@ -1,4 +1,4 @@
-From eb882650473cea1cd71cef7813512b381429fd5c Mon Sep 17 00:00:00 2001
+From 3f1754dec603e3508a45f3e1800edf0a44411084 Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 9 Jul 2015 11:28:19 -0400
 Subject: [PATCH 4/4] linguist-tools cmake: allow overriding the location for
@@ -59,5 +59,5 @@ index 4318b16..2e3b70f 100644
  
      set_target_properties(Qt5::lconvert PROPERTIES
 -- 
-2.6.2
+2.7.0
 
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 8c22e75..785510e 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -31,6 +31,6 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'linguistonly', 'CONFIG+=linguistonly', '', d)}"
 
-SRCREV = "57301c0003e9d776d31953f1411cc06a395b752e"
+SRCREV = "05206b44cf25ca6a895cc9a8716f2b7f2f14191f"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 72a29b3..5d3818e 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -104,4 +104,4 @@ FILES_${PN}-qt = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
 "
 
-SRCREV = "9c6d1af76ac28de8d59be344ea3a21b2607fa118"
+SRCREV = "ce85e4ee4ee22e5dea3b44707a27dab44319708e"
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index ba07591..b164a67 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -25,4 +25,4 @@ do_install() {
     oe_runmake install INSTALL_ROOT=${D}
 }
 
-SRCREV = "bd21beea9a433a8878c0e719a7bfb8c14df47840"
+SRCREV = "bebe9beff3e9874498474cec32634cf281ddc453"
diff --git a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
index 8b539b6..06168e3 100644
--- a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
+++ b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
@@ -1,4 +1,4 @@
-From 7c34dff33e7669e9227df548c8ab08a850c72e39 Mon Sep 17 00:00:00 2001
+From 8841d31cb66fda833dc0ae557f13887716f4c46b Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Fri, 19 Jul 2013 13:35:14 +0000
 Subject: [PATCH] Install the qtwaylandscanner tool to the native side
@@ -28,5 +28,5 @@ index ac2d07b..7a46a24 100644
 +target.path = $$[QT_HOST_BINS]
 +INSTALLS += target
 -- 
-2.6.1
+2.7.0
 
diff --git a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch b/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
index 27dada2..3604757 100644
--- a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
+++ b/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
@@ -1,4 +1,4 @@
-From e3469724404a8afaa51939e17fc85f6cb40b5196 Mon Sep 17 00:00:00 2001
+From efec881d1bff247e6452a10a60821612c2585c67 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 22 Feb 2014 17:47:44 +0100
 Subject: [PATCH] examples/wayland: include server-buffer only when building
@@ -27,5 +27,5 @@ index d633fb9..643c7cd 100644
 +    }
  }
 -- 
-2.6.1
+2.7.0
 
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 128794c..78d8a3e 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -36,4 +36,4 @@ SRC_URI += " \
     file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
 "
 
-SRCREV = "bd21beea9a433a8878c0e719a7bfb8c14df47840"
+SRCREV = "bebe9beff3e9874498474cec32634cf281ddc453"
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index e070d13..eb4475b 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "97577a0f27a1f427948871ae535645a2e0788bf7"
+SRCREV = "3fa1c9d2cf5e00e7431d042e7955a6dd75e6e2b1"
diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
index b6500ea..a1ea375 100644
--- a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
@@ -1,8 +1,8 @@
-From 53e16d6f07005c1176455a4488cd8f93218e3cde Mon Sep 17 00:00:00 2001
+From 90d2f7aefa8922c3aa29e6907c1520c814d1797f Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Fri, 3 Oct 2014 03:52:11 +0200
-Subject: [PATCH] <chromium> base.gypi: include atomicops_internals_x86_gcc.cc
- when building for x64 arch
+Subject: [PATCH 1/2] <chromium> base.gypi: include
+ atomicops_internals_x86_gcc.cc when building for x64 arch
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
@@ -23,5 +23,5 @@ index b860735..0ed5de3 100644
                  ['include', 'atomicops_internals_x86_gcc.cc'],
                ],
 -- 
-2.6.1
+2.7.0
 
diff --git a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
index ce76afa..88d4826 100644
--- a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
@@ -1,7 +1,7 @@
-From 38efc016f223a1277bd3a92e4c78ac816adbcdaa Mon Sep 17 00:00:00 2001
+From f052458fe39733602751f9f9a09d1c0d78bea421 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 30 Jun 2014 20:08:17 +0200
-Subject: [PATCH 1/3] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
+Subject: [PATCH 1/5] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
  anywhere in path, but at the end
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
@@ -10,10 +10,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index d5265ab..2825457 100644
+index 2df689b..8d984c7 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -113,9 +113,9 @@ defineReplace(mocOutput) {
+@@ -131,9 +131,9 @@ defineReplace(mocOutput) {
    out = $$1
    # The order is important, since the output of the second replace would end up accidentaly transformed by the first one
    for(ext, $$list($${QMAKE_EXT_CPP})): \
@@ -26,5 +26,5 @@ index d5265ab..2825457 100644
  }
  
 -- 
-2.6.2
+2.7.0
 
diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-jpeg_codec.cc_Change-false-to-FALSE-and-1-to-TRUE.patch b/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
similarity index 91%
rename from recipes-qt/qt5/qtwebengine/0001-chromium-jpeg_codec.cc_Change-false-to-FALSE-and-1-to-TRUE.patch
rename to recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
index 3707cbe..1227d0a 100644
--- a/recipes-qt/qt5/qtwebengine/0001-chromium-jpeg_codec.cc_Change-false-to-FALSE-and-1-to-TRUE.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
@@ -1,9 +1,11 @@
-From 54b183ada5b5ead1c4b6e6532e24d21f372d70d7 Mon Sep 17 00:00:00 2001
+From a015bddaf2005cac376be7dda4603637afc5844c Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Thu, 24 Dec 2015 12:46:58 -0200
-Subject: [PATCH] Change false to FALSE and 1 to TRUE, FIX qtwebengine compile
+Subject: [PATCH 2/2] chromium: Change false to FALSE and 1 to TRUE, FIX
+ qtwebengine compile
 
 Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
  src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc | 12 ++++++------
  1 file changed, 6 insertions(+), 6 deletions(-)
@@ -60,5 +62,5 @@ index 8a08fe0..32b2a05 100644
    // we want to always get RGB data out
    switch (cinfo.jpeg_color_space) {
 -- 
-1.8.1.2
+2.7.0
 
diff --git a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
index f2dcaed..dbc1e24 100644
--- a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
@@ -1,7 +1,7 @@
-From ebfec8ca32379bffd18cbab1f4335a458fcc7e41 Mon Sep 17 00:00:00 2001
+From 5f6389fe3493420c2afeec8f2786165f1d08901a Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Tue, 18 Nov 2014 10:38:18 +0100
-Subject: [PATCH 2/3] functions.prf: Make sure we only use the file name to
+Subject: [PATCH 2/5] functions.prf: Make sure we only use the file name to
  generate it's moc'ed abbreviation
 
 Signed-off-by: Simon Busch <morphis@gravedo.de>
@@ -11,10 +11,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 2825457..f761b64 100644
+index 8d984c7..055e960 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -110,7 +110,8 @@ defineReplace(findIncludedMocFiles) {
+@@ -128,7 +128,8 @@ defineReplace(findIncludedMocFiles) {
  }
  
  defineReplace(mocOutput) {
@@ -25,5 +25,5 @@ index 2825457..f761b64 100644
    for(ext, $$list($${QMAKE_EXT_CPP})): \
        out = $$replace(out, ^(.*)($$re_escape($${ext}))$, $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
 -- 
-2.6.2
+2.7.0
 
diff --git a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
index a3ea02a..28960ed 100644
--- a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
@@ -1,27 +1,33 @@
-From daf1deee393576f86b22178a7cc18717962cb68e Mon Sep 17 00:00:00 2001
+From 348a74cb924cf6ac4384069d84ee3995644b2ce1 Mon Sep 17 00:00:00 2001
 From: Frieder Schrempf <frieder.schrempf@online.de>
 Date: Mon, 1 Dec 2014 14:34:40 +0000
-Subject: [PATCH 3/3] functions.prf: allow build for linux-oe-g++ platform
+Subject: [PATCH 3/5] functions.prf: allow build for linux-oe-g++ platform
 
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Frieder Schrempf <frieder.schrempf@online.de>
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- tools/qmake/mkspecs/features/functions.prf | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ tools/qmake/mkspecs/features/functions.prf | 6 ++++++
+ 1 file changed, 6 insertions(+)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index f761b64..ab5f018 100644
+index 055e960..379c9b5 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -1,5 +1,5 @@
- defineTest(isPlatformSupported) {
--  !linux-g++*:!linux-clang:!win32-msvc2013*:!win32-msvc2015*:!macx-clang*:!boot2qt {
-+  !linux-g++*:!linux-oe-g++*:!linux-clang:!win32-msvc2013*:!win32-msvc2015*:!macx-clang*:!boot2qt {
-     skipBuild("Qt WebEngine can currently only be built for Linux (GCC/clang), Windows (MSVC 2013 or 2015), OS X (10.9/XCode 5.1+) or Qt for Device Creation.")
-     return(false)
-   }
+@@ -5,6 +5,12 @@ defineTest(isPlatformSupported) {
+       return(false)
+     }
+     gcc:!clang:!isGCCVersionSupported(): return(false)
++  } else:linux-oe-g++* {
++    !gcc:!clang {
++      skipBuild("Qt WebEngine on Linux requires clang or GCC.")
++      return(false)
++    }
++    gcc:!clang:!isGCCVersionSupported(): return(false)
+   } else:win32 {
+     winrt {
+       skipBuild("WinRT is not supported.")
 -- 
-2.6.2
+2.7.0
 
diff --git a/recipes-qt/qt5/qtwebengine/0003-WebEngine-qquickwebengineview_p_p.h-add-inc-QColor.patch b/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
similarity index 72%
rename from recipes-qt/qt5/qtwebengine/0003-WebEngine-qquickwebengineview_p_p.h-add-inc-QColor.patch
rename to recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
index 544db3a..4a3deb9 100644
--- a/recipes-qt/qt5/qtwebengine/0003-WebEngine-qquickwebengineview_p_p.h-add-inc-QColor.patch
+++ b/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
@@ -1,15 +1,15 @@
-From 741f83397be4157cd34386f619f6d74fca4da149 Mon Sep 17 00:00:00 2001
+From 80f5e26073ef58c1a2ff510c6ccdb7423bcb2fc3 Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Fri, 25 Dec 2015 18:16:05 -0200
-Subject: [PATCH] WebEngine qquickwebengineview_p_p.h add include QColor
+Subject: [PATCH 4/5] WebEngine qquickwebengineview_p_p.h add include QColor
 
 Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
 ---
- qquickwebengineview_p_p.h | 2 ++
+ src/webengine/api/qquickwebengineview_p_p.h | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/src/webengine/api/qquickwebengineview_p_p.h b/src/webengine/api/qquickwebengineview_p_p.h
-index c221085..d39aba7 100644
+index dbbbf91..94268b6 100644
 --- a/src/webengine/api/qquickwebengineview_p_p.h
 +++ b/src/webengine/api/qquickwebengineview_p_p.h
 @@ -56,6 +56,8 @@
@@ -22,5 +22,5 @@ index c221085..d39aba7 100644
  namespace QtWebEngineCore {
  class WebContentsAdapter;
 -- 
-1.8.1.2
+2.7.0
 
diff --git a/recipes-qt/qt5/qtwebengine/0002-media_capture_devices_dispatcher.h-Include-QCoreApplication-translate.patch b/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch
similarity index 82%
rename from recipes-qt/qt5/qtwebengine/0002-media_capture_devices_dispatcher.h-Include-QCoreApplication-translate.patch
rename to recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch
index 1b637cb..6fd9e49 100644
--- a/recipes-qt/qt5/qtwebengine/0002-media_capture_devices_dispatcher.h-Include-QCoreApplication-translate.patch
+++ b/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch
@@ -1,7 +1,7 @@
-From 23e391f08f36d9ab9c0030ae52b3821ec9f3c3ed Mon Sep 17 00:00:00 2001
+From b3f3154e4852a830fdc4e311d4f5105fc337e8f2 Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Thu, 24 Dec 2015 15:59:51 -0200
-Subject: [PATCH] Include dependency to QCoreApplication::translate()
+Subject: [PATCH 5/5] Include dependency to QCoreApplication::translate()
 
 Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
 ---
@@ -22,5 +22,5 @@ index 500fe76..eda2824 100644
  
  #include "base/callback.h"
 -- 
-1.8.1.2
+2.7.0
 
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 7660932..47d3613 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -111,14 +111,14 @@ SRC_URI += " \
     file://0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
     file://0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch \
     file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
+    file://0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch \
+    file://0005-Include-dependency-to-QCoreApplication-translate.patch \
     file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch \
-    file://0002-media_capture_devices_dispatcher.h-Include-QCoreApplication-translate.patch \
-    file://0003-WebEngine-qquickwebengineview_p_p.h-add-inc-QColor.patch \
-    file://0001-chromium-jpeg_codec.cc_Change-false-to-FALSE-and-1-to-TRUE.patch \
+    file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch \
 "
 
-SRCREV_qtwebengine = "40ef43e0d69c4a86c9430b7f264d2cde6340ee0f"
-SRCREV_chromium = "ec5b3304fc266dfdec7666b8b73d57a3971ea35f"
+SRCREV_qtwebengine = "3f02c25de46f5ff296b8189af3435ce5800b39a7"
+SRCREV_chromium = "779a2388fc123a7f3a178ce2ced921ee4a307e2c"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine_chromium"
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index a0d4e9f..63d02fa 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -19,4 +19,4 @@ DEPENDS += "qtwebkit qtxmlpatterns"
 RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
 RDEPENDS_${PN}-examples += "${@base_contains('PACKAGECONFIG_OPENSSL', 'openssl', 'ca-certificates', '', d)}"
 
-SRCREV = "7988aecdbcb07f3a214c2c804a39db3fc5617844"
+SRCREV = "1b9a0fc9d1ded4f4f11b04eb0bb7d1de82d6eb34"
diff --git a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
index 33e7dd2..e8b0e43 100644
--- a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
+++ b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
@@ -1,4 +1,4 @@
-From a5aae8adf808bb07b0326edbf2dc66bfb4917963 Mon Sep 17 00:00:00 2001
+From 1735a8484ef9ae336f8d607b56bda64c8af10c79 Mon Sep 17 00:00:00 2001
 From: Trevor Woerner <trevor.woerner@linaro.org>
 Date: Fri, 7 Feb 2014 04:07:17 +0100
 Subject: [PATCH 1/3] qtwebkit: fix QA issue (bad RPATH)
@@ -26,5 +26,5 @@ index fd66af6..ef754c3 100644
  CONFIG(debug, debug|release)|force_debug_info {
      # Make ld not cache the symbol tables of input files in memory to avoid memory exhaustion during the linking phase.
 -- 
-2.6.1
+2.7.0
 
diff --git a/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch b/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
index 3c3b489..b3a8615 100644
--- a/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
+++ b/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
@@ -1,4 +1,4 @@
-From 08e983e065acce369aa95e3fcb5b7fe6ca563e04 Mon Sep 17 00:00:00 2001
+From ae16ce17cc7060274a0b0c165b953fc32540f977 Mon Sep 17 00:00:00 2001
 From: Magnus Granberg <zorry@gentoo.org>
 Date: Fri, 27 Feb 2015 11:55:09 +0100
 Subject: [PATCH 2/3] Remove TEXTREL tag in x86
@@ -75,5 +75,5 @@ index 0a2fe78..2dc40ef 100644
  #define GLOBAL_REFERENCE(name) SYMBOL_STRING(name)
  #endif
 -- 
-2.6.1
+2.7.0
 
diff --git a/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch b/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
index 4465093..4379866 100644
--- a/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
+++ b/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
@@ -1,4 +1,4 @@
-From d4ea11922ebaf865f0b0c57e6746d6b985bf840f Mon Sep 17 00:00:00 2001
+From 6c36f0ff8c1f5852c33d2b23714f9f187cc6ff26 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 5 Jun 2015 19:55:05 -0700
 Subject: [PATCH 3/3] Exclude backtrace() API for non-glibc libraries
@@ -34,5 +34,5 @@ index 1b2091f..ba03a28 100644
  #elif OS(WINDOWS) && !OS(WINCE)
      // The CaptureStackBackTrace function is available in XP, but it is not defined
 -- 
-2.6.1
+2.7.0
 
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index a952306..559efac 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -65,4 +65,4 @@ PACKAGES_remove = "${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-db
 RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i386').replace('i686', 'i386') }"
 export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
 
-SRCREV = "93cc8d306f8033551fb60e2e1f8f480330778a21"
+SRCREV = "d2ff5a085572b1ee24dcb42ae107063f3142d14e"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 6aea0a6..fbce6be 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "469f748515b65cd4c9bec8794ec37ca6cf5df026"
+SRCREV = "2d8c94cf11097b61689757f8a0162bb7dd9d7d0b"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index ac33fb2..0ae8e4a 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "d64ee96f0df4d3baa6959b8552bc59d53cb0b451"
+SRCREV = "5df9fa8f3a7209c067a5d5068776b9aa52273d3b"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index 4b511d0..c424562 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -13,6 +13,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "94136d42805abeaf3dd9d6ded7b74e3d27fd3777"
+SRCREV = "a8d103a05bc195dd045779f3aebdf67bd0140df1"
 
 BBCLASSEXTEND =+ "native nativesdk"
-- 
2.7.1


