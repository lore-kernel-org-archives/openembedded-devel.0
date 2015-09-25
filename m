Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 418D77680D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Sep 2015 12:25:05 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so19641937wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Sep 2015 05:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=EBUUMC6KAZgcgIWW373zrwpjFwlya8jvSMZtbT+x314=;
	b=OB4De1wLvIOIUsAcxcdm3wIX71ShFx8mQfGrYrjASQtzG0PmoKZPkhs3rsYXasndq0
	l3vnPu+vmmPzgCTo85ZHghxBqkq83KezXsynOhw3fxK4GueRiNmv/CA9Z6kByNxA1Fne
	evs70ODjS/axLYWvrXb9pdNM341JwHcaaY94EZYM4nIFsDf0YtKLkCkBRmFFCgFjOm3b
	bByUpU4paWSoc2gDkNm/SbcivnlxmDM97W4Lai3tnC6r2ASk5sTbpTdVu73rXpLPBDJ5
	dPPhLgi4eeG3VUq/MyN1JH4NSY/o6q3pQlP270xPJggOlWkm+l4xxZNKYs4DG8cV9J2F
	7YWw==
X-Received: by 10.180.91.15 with SMTP id ca15mr3332977wib.12.1443183905089;
	Fri, 25 Sep 2015 05:25:05 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	fx2sm2990390wib.24.2015.09.25.05.24.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Sep 2015 05:25:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Sep 2015 14:24:45 +0200
Message-Id: <1443183885-28546-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.3
In-Reply-To: <1443020946-13141-1-git-send-email-Martin.Jansa@gmail.com>
References: <1443020946-13141-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCHv2][meta-qt5] qt5: upgrade to latest revision in 5.5 branches
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
X-List-Received-Date: Fri, 25 Sep 2015 12:25:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* qtbase/0008-Fix-build-with-clang-3.7.patch is now applied upstream

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |  12 +-
 recipes-qt/qt5/qt3d_git.bb                         |   7 +-
 recipes-qt/qt5/qtbase-native_git.bb                |  10 +-
 .../qt5/qtbase/0001-Add-linux-oe-g-platform.patch  |  14 +--
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |   6 +-
 .../0003-Add-external-hostbindir-option.patch      |  16 +--
 ...le-Fix-pkgconfig-and-libtool-replacements.patch |   8 +-
 ...mintegration-Undefine-CursorShape-from-X..patch |   4 +-
 ...ump-path-length-from-256-to-512-character.patch |  10 +-
 .../0007-QOpenGLPaintDevice-sub-area-support.patch |   4 +-
 recipes-qt/qt5/qtbase/0008-Always-build-uic.patch  |  31 +++++
 .../qt5/qtbase/0008-Fix-build-with-clang-3.7.patch |  72 -----------
 ...-build-it-in-configure-but-allow-to-build.patch |  68 +++++++++++
 ...external-hostbindir-option-for-native-sdk.patch | 134 +++++++++++++++++++++
 recipes-qt/qt5/qtbase/0009-Always-build-uic.patch  |  31 -----
 ...Invert-conditional-for-defining-QT_SOCKLE.patch |  36 ++++++
 ...-build-it-in-configure-but-allow-to-build.patch |  68 -----------
 ...external-hostbindir-option-for-native-sdk.patch | 134 ---------------------
 ...reserve-built-qmake-and-swap-with-native-.patch |  30 +++++
 ...Invert-conditional-for-defining-QT_SOCKLE.patch |  36 ------
 ...mscreen.cpp-reorder-headers-to-fix-build-.patch |  49 ++++++++
 ...reserve-built-qmake-and-swap-with-native-.patch |  30 -----
 ...mscreen.cpp-reorder-headers-to-fix-build-.patch |  49 --------
 recipes-qt/qt5/qtbase_git.bb                       |  12 +-
 recipes-qt/qt5/qtcanvas3d_git.bb                   |   5 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |   5 +-
 .../0001-qmltestexample-fix-link.patch             |   4 +-
 recipes-qt/qt5/qtdeclarative_git.bb                |   5 +-
 recipes-qt/qt5/qtenginio_git.bb                    |   5 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |   5 +-
 ...ats.pro-Make-the-dependencies-determinist.patch |   4 +-
 recipes-qt/qt5/qtimageformats_git.bb               |   5 +-
 recipes-qt/qt5/qtlocation_git.bb                   |   5 +-
 ...1-Initial-porting-effort-to-GStreamer-1.0.patch |  25 ++--
 recipes-qt/qt5/qtmultimedia_git.bb                 |   9 +-
 recipes-qt/qt5/qtquick1_git.bb                     |   5 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |   5 +-
 recipes-qt/qt5/qtscript_git.bb                     |   5 +-
 recipes-qt/qt5/qtsensors_git.bb                    |   5 +-
 recipes-qt/qt5/qtserialport_git.bb                 |   5 +-
 recipes-qt/qt5/qtsvg_git.bb                        |   5 +-
 recipes-qt/qt5/qtsystems_git.bb                    |   6 +-
 ...w-to-build-only-lrelease-lupdate-lconvert.patch |  20 +--
 ...t-help-fix-linking-of-dependent-libraries.patch |   4 +-
 .../0003-add-noqtwebkit-configuration.patch        |   4 +-
 recipes-qt/qt5/qttools_git.bb                      |   5 +-
 recipes-qt/qt5/qttranslations_git.bb               |   5 +-
 recipes-qt/qt5/qtwayland-native_git.bb             |   5 +-
 ...-qtwaylandscanner-tool-to-the-native-side.patch |   4 +-
 ...yland-include-server-buffer-only-when-bui.patch |   4 +-
 recipes-qt/qt5/qtwayland_git.bb                    |   7 +-
 recipes-qt/qt5/qtwebchannel_git.bb                 |   6 +-
 ...se.gypi-include-atomicops_internals_x86_g.patch |   8 +-
 ...rf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch |   8 +-
 ...ird_party-boringssl-Demand-for-newer-POSI.patch |   7 +-
 ...rf-Make-sure-we-only-use-the-file-name-to.patch |   8 +-
 ...s.prf-allow-build-for-linux-oe-g-platform.patch |  12 +-
 .../0004-Generate-usable-qmake_extras.gypi.patch   |  12 +-
 recipes-qt/qt5/qtwebengine_git.bb                  |   8 +-
 ...amples-enable-building-examples-by-defaul.patch |   4 +-
 recipes-qt/qt5/qtwebkit-examples_git.bb            |   5 +-
 .../0001-qtwebkit-fix-QA-issue-bad-RPATH.patch     |   6 +-
 .../qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch  |   6 +-
 ...ude-backtrace-API-for-non-glibc-libraries.patch |   6 +-
 recipes-qt/qt5/qtwebkit_git.bb                     |   2 +-
 recipes-qt/qt5/qtwebsockets_git.bb                 |   5 +-
 recipes-qt/qt5/qtx11extras_git.bb                  |   5 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |   5 +-
 68 files changed, 559 insertions(+), 596 deletions(-)
 create mode 100644 recipes-qt/qt5/qtbase/0008-Always-build-uic.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0008-Fix-build-with-clang-3.7.patch
 create mode 100644 recipes-qt/qt5/qtbase/0008-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
 create mode 100644 recipes-qt/qt5/qtbase/0009-Add-external-hostbindir-option-for-native-sdk.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
 create mode 100644 recipes-qt/qt5/qtbase/0009-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0009-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch
 create mode 100644 recipes-qt/qt5/qtbase/0010-configure-preserve-built-qmake-and-swap-with-native-.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0010-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
 create mode 100644 recipes-qt/qt5/qtbase/0010-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0011-configure-preserve-built-qmake-and-swap-with-native-.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0012-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 9c9d86f..3003323 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -6,7 +6,8 @@ HOMEPAGE = "http://qt-project.org"
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
@@ -28,18 +29,17 @@ SRC_URI += "\
     file://0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
     file://0006-configure-bump-path-length-from-256-to-512-character.patch \
     file://0007-QOpenGLPaintDevice-sub-area-support.patch \
-    file://0008-Fix-build-with-clang-3.7.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
-    file://0009-Always-build-uic.patch \
-    file://0010-Add-external-hostbindir-option-for-native-sdk.patch \
+    file://0008-Always-build-uic.patch \
+    file://0009-Add-external-hostbindir-option-for-native-sdk.patch \
 "
 
 # specific for nativesdk-qtbase
 SRC_URI += " \
-    file://0011-configure-preserve-built-qmake-and-swap-with-native-.patch \
+    file://0010-configure-preserve-built-qmake-and-swap-with-native-.patch \
 "
 
 # CMake's toolchain configuration of nativesdk-qtbase
@@ -278,4 +278,4 @@ fakeroot do_generate_qt_environment_file() {
 
 addtask generate_qt_environment_file after do_install before do_package
 
-SRCREV = "2fde9f59eeab68ede92324e7613daf8be3eaf498"
+SRCREV = "c619d2daac9b1f61e8ad2320b59c648b6af6af90"
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 70c053e..d42cf57 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -3,8 +3,9 @@ require qt5-git.inc
 
 LICENSE = "LGPL-3.0 | GPL-2.0"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-    file://LICENSE.GPL;md5=05832301944453ec79e40ba3c3cfceec\
+    file://LICENSE.LGPLv3;md5=3dcffeed712d3c916f9a2d9135703aff \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
+    file://LICENSE.GPL;md5=05832301944453ec79e40ba3c3cfceec \
 "
 
 DEPENDS = "qtdeclarative"
@@ -14,4 +15,4 @@ FILES_${PN}-qmlplugins += " \
     ${OE_QMAKE_PATH_QML}/*/*/*.obj \
 "
 
-SRCREV = "a3b99941751598fb734b189333d5020666df2b2c"
+SRCREV = "0bcb6600db2a74ee8c8b51207d3ba15e4973aa95"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index d75f5e5..0f77fa2 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -5,7 +5,8 @@ HOMEPAGE = "http://qt-project.org"
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
@@ -22,13 +23,12 @@ SRC_URI += "\
     file://0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
     file://0006-configure-bump-path-length-from-256-to-512-character.patch \
     file://0007-QOpenGLPaintDevice-sub-area-support.patch \
-    file://0008-Fix-build-with-clang-3.7.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
-    file://0009-Always-build-uic.patch \
-    file://0010-Add-external-hostbindir-option-for-native-sdk.patch \
+    file://0008-Always-build-uic.patch \
+    file://0009-Add-external-hostbindir-option-for-native-sdk.patch \
 "
 
 CLEANBROKEN = "1"
@@ -116,4 +116,4 @@ do_install() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "2fde9f59eeab68ede92324e7613daf8be3eaf498"
+SRCREV = "c619d2daac9b1f61e8ad2320b59c648b6af6af90"
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index 568d2a4..e67df40 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From de9a457dacd9388e8ef145fce9cf4e1e1da6468b Mon Sep 17 00:00:00 2001
+From 566de5f3f4dc14bae25a1b77eb6859c820447a32 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
 Subject: [PATCH 01/10] Add linux-oe-g++ platform
@@ -52,7 +52,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
 diff --git a/configure b/configure
-index 8a4c89e..dfbb111 100755
+index cea62fb..e1929e7 100755
 --- a/configure
 +++ b/configure
 @@ -342,6 +342,16 @@ getQMakeConf()
@@ -120,7 +120,7 @@ index 8a4c89e..dfbb111 100755
  fi'`
      eval "$cmd"
  done
-@@ -3337,7 +3347,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
+@@ -3350,7 +3360,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
      [ "$CFG_QGTKSTYLE" = "auto" ] && CFG_QGTKSTYLE=no
  fi
  
@@ -129,7 +129,7 @@ index 8a4c89e..dfbb111 100755
  
  TEST_COMPILER=$QMAKE_CONF_COMPILER
  
-@@ -3394,7 +3404,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
+@@ -3407,7 +3417,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
          exit 1
      fi
  fi
@@ -138,7 +138,7 @@ index 8a4c89e..dfbb111 100755
  
  GCC_MACHINE_DUMP=
  case "$TEST_COMPILER" in *g++) GCC_MACHINE_DUMP=$($TEST_COMPILER -dumpmachine);; esac
-@@ -3896,6 +3906,14 @@ setBootstrapVariable()
+@@ -3909,6 +3919,14 @@ setBootstrapVariable()
      getQMakeConf "$1" | echo ${2-$1} = `if [ -n "$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
  }
  
@@ -153,7 +153,7 @@ index 8a4c89e..dfbb111 100755
  # build qmake
  if true; then ###[ '!' -f "$outpath/bin/qmake" ];
      echo "Creating qmake..."
-@@ -3934,14 +3952,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+@@ -3947,14 +3965,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
          fi
  
          [ "$CFG_SILENT" = "yes" ] && CC_TRANSFORM='s,^,\@,' || CC_TRANSFORM=
@@ -348,5 +348,5 @@ index 0000000..dd12003
 +
 +#endif // QPLATFORMDEFS_H
 -- 
-2.5.0
+2.5.3
 
diff --git a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index 5727517..800d42a 100644
--- a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,4 +1,4 @@
-From 7ca620bb9f03ddc8536ac3c45b485cc83603f1c8 Mon Sep 17 00:00:00 2001
+From 9e987abf08c5841fcce3331aceec51e00a26dcc8 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
 Subject: [PATCH 02/10] qlibraryinfo: allow to set qt.conf from the outside
@@ -19,7 +19,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 2912e68..f663c88 100644
+index 0cfcc4e..c3b5c2d 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
 @@ -157,7 +157,10 @@ void QLibrarySettings::load()
@@ -35,5 +35,5 @@ index 2912e68..f663c88 100644
          return new QSettings(qtconfig, QSettings::IniFormat);
  #ifdef QT_BUILD_QMAKE
 -- 
-2.5.0
+2.5.3
 
diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
index c44611d..de8e1a4 100644
--- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
@@ -1,4 +1,4 @@
-From 0ac23b38794bd4580428e11b2cf1c88eb7f410f3 Mon Sep 17 00:00:00 2001
+From 90f3f8f59dd23f67e14c9988c2f4449a31762752 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH 03/10] Add -external-hostbindir option
@@ -37,10 +37,10 @@ Conflicts:
  7 files changed, 37 insertions(+), 12 deletions(-)
 
 diff --git a/configure b/configure
-index dfbb111..548dd0d 100755
+index e1929e7..a757ce5 100755
 --- a/configure
 +++ b/configure
-@@ -806,6 +806,7 @@ QT_HOST_BINS=
+@@ -809,6 +809,7 @@ QT_HOST_BINS=
  QT_HOST_LIBS=
  QT_HOST_DATA=
  QT_EXT_PREFIX=
@@ -48,7 +48,7 @@ index dfbb111..548dd0d 100755
  
  #flags for SQL drivers
  QT_CFLAGS_PSQL=
-@@ -925,6 +926,7 @@ while [ "$#" -gt 0 ]; do
+@@ -928,6 +929,7 @@ while [ "$#" -gt 0 ]; do
      -testsdir| \
      -hostdatadir| \
      -hostbindir| \
@@ -56,7 +56,7 @@ index dfbb111..548dd0d 100755
      -hostlibdir| \
      -extprefix| \
      -sysroot| \
-@@ -1154,6 +1156,9 @@ while [ "$#" -gt 0 ]; do
+@@ -1157,6 +1159,9 @@ while [ "$#" -gt 0 ]; do
      extprefix)
          QT_EXT_PREFIX="$VAL"
          ;;
@@ -66,7 +66,7 @@ index dfbb111..548dd0d 100755
      pkg-config)
          if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
              CFG_PKGCONFIG="$VAL"
-@@ -2380,6 +2385,10 @@ Installation options:
+@@ -2383,6 +2388,10 @@ Installation options:
      -hostdatadir <dir> . Data used by qmake will be installed to <dir>
                           (default HOSTPREFIX)
  
@@ -77,7 +77,7 @@ index dfbb111..548dd0d 100755
  Configure options:
  
   The defaults (*) are usually acceptable. A plus (+) denotes a default value
-@@ -3097,6 +3106,11 @@ fi
+@@ -3110,6 +3119,11 @@ fi
  # command line and environment validation
  #-------------------------------------------------------------------------------
  
@@ -225,5 +225,5 @@ index 99d87e2..5621dc0 100644
      _qt5_Widgets_check_file_exists(${imported_location})
  
 -- 
-2.5.0
+2.5.3
 
diff --git a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
index aef4999..e7155bb 100644
--- a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -1,4 +1,4 @@
-From bae1b8fbd3fe94a99a02fb751302baa788e9f2ff Mon Sep 17 00:00:00 2001
+From d28d15f9489ab9bb09627014003ad1bde2a79e1f Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
 Subject: [PATCH 04/10] qt_module: Fix pkgconfig and libtool replacements
@@ -67,7 +67,7 @@ Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
  2 files changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_common.prf
-index 5861941..474827c 100644
+index 55f65b5..2412fdd 100644
 --- a/mkspecs/features/qt_common.prf
 +++ b/mkspecs/features/qt_common.prf
 @@ -36,7 +36,7 @@ contains(TEMPLATE, .*lib) {
@@ -80,7 +80,7 @@ index 5861941..474827c 100644
      lib_replace.CONFIG = path
      QMAKE_PRL_INSTALL_REPLACE += lib_replace
 diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_module.prf
-index 5412f37..5ab348a 100644
+index c89b6d2..23d4366 100644
 --- a/mkspecs/features/qt_module.prf
 +++ b/mkspecs/features/qt_module.prf
 @@ -214,6 +214,11 @@ unix|mingw {
@@ -108,5 +108,5 @@ index 5412f37..5ab348a 100644
  }
  
 -- 
-2.5.0
+2.5.3
 
diff --git a/recipes-qt/qt5/qtbase/0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch b/recipes-qt/qt5/qtbase/0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch
index fbddae3..0875bd8 100644
--- a/recipes-qt/qt5/qtbase/0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch
+++ b/recipes-qt/qt5/qtbase/0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch
@@ -1,4 +1,4 @@
-From 0b4d9044218df6e7fb700be6cfd21b4aaab24b18 Mon Sep 17 00:00:00 2001
+From c3f540be8541f71fdb7b7baa9000583a914ac7f7 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 19 Mar 2014 18:32:28 +0100
 Subject: [PATCH 05/10] qeglplatformintegration: Undefine CursorShape from X.h
@@ -26,5 +26,5 @@ index 42fbf8c..8950f2d 100644
  
  class QEGLPlatformWindow;
 -- 
-2.5.0
+2.5.3
 
diff --git a/recipes-qt/qt5/qtbase/0006-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0006-configure-bump-path-length-from-256-to-512-character.patch
index 8f95480..0635a2f 100644
--- a/recipes-qt/qt5/qtbase/0006-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase/0006-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,7 +1,7 @@
-From fe6405c5a628c168e42138ac82ba70bb8c909d0b Mon Sep 17 00:00:00 2001
+From 37aec78ac44bad8754c3bd5b56836025e4eed50a Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Tue, 25 Aug 2015 10:05:15 -0400
-Subject: [PATCH] configure: bump path length from 256 to 512 characters
+Subject: [PATCH 06/10] configure: bump path length from 256 to 512 characters
 
 Increase the path length that gets hardcoded into generated config.cpp file
 from 256 to 512 characters, as nativesdk path can be quite long.
@@ -14,10 +14,10 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure b/configure
-index 22867a7..fe18487 100755
+index a757ce5..f0f42ab 100755
 --- a/configure
 +++ b/configure
-@@ -3851,10 +3851,10 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
+@@ -3863,10 +3863,10 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
  static const char qt_configure_installation          [12+11]    = "qt_instdate=2012-12-20";
  
  /* Installation Info */
@@ -32,5 +32,5 @@ index 22867a7..fe18487 100755
  
  static const short qt_configure_str_offsets[] = {
 -- 
-2.2.0
+2.5.3
 
diff --git a/recipes-qt/qt5/qtbase/0007-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase/0007-QOpenGLPaintDevice-sub-area-support.patch
index eb2fd5a..e2d2115 100644
--- a/recipes-qt/qt5/qtbase/0007-QOpenGLPaintDevice-sub-area-support.patch
+++ b/recipes-qt/qt5/qtbase/0007-QOpenGLPaintDevice-sub-area-support.patch
@@ -1,4 +1,4 @@
-From 7dfc673d6968ce890e5fad7fd8fd8a74c12b876b Mon Sep 17 00:00:00 2001
+From ca3b8fabcc38a9545e935a7c530565689fb85ff7 Mon Sep 17 00:00:00 2001
 From: Jani Hautakangas <jani.hautakangas@ixonos.com>
 Date: Thu, 16 May 2013 09:52:07 +0300
 Subject: [PATCH 07/10] QOpenGLPaintDevice sub-area support
@@ -153,5 +153,5 @@ index c179143..fad68d5 100644
      } else {
          if (m_vao.isCreated()) {
 -- 
-2.5.0
+2.5.3
 
diff --git a/recipes-qt/qt5/qtbase/0008-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0008-Always-build-uic.patch
new file mode 100644
index 0000000..d84e298
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0008-Always-build-uic.patch
@@ -0,0 +1,31 @@
+From d1feb6d0a80460e66872749d931cddc8ed22851d Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 16 Nov 2013 00:32:30 +0100
+Subject: [PATCH 08/10] Always build uic
+
+Even if we are not building gui or widgets. This tool is needed later
+as a native tool when compiling the target.
+
+Change-Id: I257668ac28c22b192e7ec7736e6c23fa3be6bab6
+Signed-off-by: Mikko Levonmaa <mikko.levonmaa@palm.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/src.pro | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/src.pro b/src/src.pro
+index 61e5ce2..a4047aa 100644
+--- a/src/src.pro
++++ b/src/src.pro
+@@ -182,7 +182,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
+         }
+     }
+ }
+-SUBDIRS += src_plugins src_tools_qdoc
++SUBDIRS += src_plugins src_tools_qdoc src_tools_uic
+ 
+ nacl: SUBDIRS -= src_network src_testlib
+ 
+-- 
+2.5.3
+
diff --git a/recipes-qt/qt5/qtbase/0008-Fix-build-with-clang-3.7.patch b/recipes-qt/qt5/qtbase/0008-Fix-build-with-clang-3.7.patch
deleted file mode 100644
index 6583e80..0000000
--- a/recipes-qt/qt5/qtbase/0008-Fix-build-with-clang-3.7.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 63111eaec5cb758d99d68a4e9ec827b79121544b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 23 Aug 2015 15:19:41 -0700
-Subject: [PATCH 08/10] Fix build with clang 3.7
-
-Nullable is a language extension in clang 3.7 (indicating whether or
-not a pointer can be null).
-http://clang.llvm.org/docs/AttributeReference.html#nullable
-Using it as a class name breaks building with this compiler
-
-Upstream-Status: Backport
-This is backport of https://codereview.qt-project.org/#/c/121545/
-
-/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/git/src/tools/qlalr/lalr.cpp:241:1: error: declaration of anonymous
-      struct must be a definition
-struct _Nullable: public std::unary_function<Name, bool>
-^
-/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/git/src/tools/qlalr/lalr.cpp:241:56: error: expected unqualified-id
-struct _Nullable: public std::unary_function<Name, bool>
-                                                       ^
-/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/git/src/tools/qlalr/lalr.cpp:303:98: error: expected expression
-          NameList::iterator nn = std::find_if (rule->rhs.begin (), rule->rhs.end (), std::not1 (_Nullable (this)));
-                                                                                                 ^
-/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/git/src/tools/qlalr/lalr.cpp:638:107: error: expected expression
-                  NameList::iterator first_not_nullable = std::find_if (dot, rule->rhs.end (), std::not1 (_Nullable (this)));
-                                                                                                          ^
-4 errors generated.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/tools/qlalr/lalr.cpp | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/tools/qlalr/lalr.cpp b/src/tools/qlalr/lalr.cpp
-index 3d0d5de..3d780cd 100644
---- a/src/tools/qlalr/lalr.cpp
-+++ b/src/tools/qlalr/lalr.cpp
-@@ -238,11 +238,11 @@ void Grammar::buildExtendedGrammar ()
-   non_terminals.insert (accept_symbol);
- }
- 
--struct _Nullable: public std::unary_function<Name, bool>
-+struct Nullable: public std::unary_function<Name, bool>
- {
-   Automaton *_M_automaton;
- 
--  _Nullable (Automaton *aut):
-+  Nullable (Automaton *aut):
-     _M_automaton (aut) {}
- 
-   bool operator () (Name name) const
-@@ -300,7 +300,7 @@ void Automaton::buildNullables ()
- 
-       for (RulePointer rule = _M_grammar->rules.begin (); rule != _M_grammar->rules.end (); ++rule)
-         {
--          NameList::iterator nn = std::find_if (rule->rhs.begin (), rule->rhs.end (), std::not1 (_Nullable (this)));
-+          NameList::iterator nn = std::find_if (rule->rhs.begin (), rule->rhs.end (), std::not1 (Nullable (this)));
- 
-           if (nn == rule->rhs.end ())
-             changed |= nullables.insert (rule->lhs).second;
-@@ -635,7 +635,7 @@ void Automaton::buildIncludesDigraph ()
-                   if (! _M_grammar->isNonTerminal (*A))
-                     continue;
- 
--                  NameList::iterator first_not_nullable = std::find_if (dot, rule->rhs.end (), std::not1 (_Nullable (this)));
-+                  NameList::iterator first_not_nullable = std::find_if (dot, rule->rhs.end (), std::not1 (Nullable (this)));
-                   if (first_not_nullable != rule->rhs.end ())
-                     continue;
- 
--- 
-2.5.0
-
diff --git a/recipes-qt/qt5/qtbase/0008-qmake-don-t-build-it-in-configure-but-allow-to-build.patch b/recipes-qt/qt5/qtbase/0008-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
new file mode 100644
index 0000000..9bc1315
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0008-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
@@ -0,0 +1,68 @@
+From dcc588b11abdc12b4ed08534334e338f35d96ed1 Mon Sep 17 00:00:00 2001
+From: Michael Krelin <hacker@klever.net>
+Date: Mon, 29 Oct 2012 20:07:49 -0700
+Subject: [PATCH 08/10] qmake: don't build it in configure, but allow to build
+ it separately
+
+* it is already built in qtbase-native, so we don't need it in configure
+* allow building a separate qmake for the target
+
+Upstream-Status: Inappropriate [configuration]
+  OE specific for native/target builds
+
+Signed-off-by: Yu Ke <ke.yu@intel.com>
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Signed-off-by: Mikko Levonmaa <mikko.levonmaa@gmail.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+ configure       | 2 +-
+ qmake/qmake.pri | 3 ++-
+ qmake/qmake.pro | 2 ++
+ 3 files changed, 5 insertions(+), 2 deletions(-)
+---
+ configure       | 2 +-
+ qmake/qmake.pri | 3 ++-
+ qmake/qmake.pro | 1 +
+ 3 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index f0f42ab..6f338f3 100755
+--- a/configure
++++ b/configure
+@@ -3942,7 +3942,7 @@ setBootstrapEvalVariable()
+ 
+ 
+ # build qmake
+-if true; then ###[ '!' -f "$outpath/bin/qmake" ];
++if false; then ###[ '!' -f "$outpath/bin/qmake" ];
+     echo "Creating qmake..."
+ 
+     mkdir -p "$outpath/qmake" || exit
+diff --git a/qmake/qmake.pri b/qmake/qmake.pri
+index 782151d..4b314a8 100644
+--- a/qmake/qmake.pri
++++ b/qmake/qmake.pri
+@@ -80,7 +80,8 @@ bootstrap { #Qt code
+         qjsonparser.cpp \
+         qjsonarray.cpp \
+         qjsonobject.cpp \
+-        qjsonvalue.cpp
++        qjsonvalue.cpp \
++        qdebug.cpp
+ 
+    HEADERS+= \
+         qbitarray.h \
+diff --git a/qmake/qmake.pro b/qmake/qmake.pro
+index 89d6ea5..0ff4a96 100644
+--- a/qmake/qmake.pro
++++ b/qmake/qmake.pro
+@@ -8,6 +8,7 @@ CONFIG -= qt
+ DEFINES += \
+     QT_BUILD_QMAKE \
+     PROEVALUATOR_FULL
++TARGET = qmake
+ 
+ VPATH += \
+     ../src/corelib/global \
+-- 
+2.5.3
+
diff --git a/recipes-qt/qt5/qtbase/0009-Add-external-hostbindir-option-for-native-sdk.patch b/recipes-qt/qt5/qtbase/0009-Add-external-hostbindir-option-for-native-sdk.patch
new file mode 100644
index 0000000..292ced8
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0009-Add-external-hostbindir-option-for-native-sdk.patch
@@ -0,0 +1,134 @@
+From 22c6746515470bab482b8cbb9a256033470d3647 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 6 Apr 2013 13:15:07 +0200
+Subject: [PATCH 09/10] Add -external-hostbindir option for native(sdk)
+
+* when cross-compiling it's sometimes useful to use existing tools from machine
+  (or in OpenEmbedded built with separate native recipe) when building for target
+
+* this way we can skip bootstraping tools we already have
+
+* qt_functions: temporary remove isEmpty check
+* now we assume that every build will provide QT_EXTERNAL_HOST_BINS value
+* isEmpty works correctly only with qmake variables (e.g. $$FOO -
+  isEmpty(FOO)), but doesn't work with system properties like $$[FOO].
+
+* cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS to determine path to host binaries
+
+Upstream-Status: Pending
+  is a lot better for upstreaming (and it was already sort of approved by
+  Oswald) but in 5.2.0 I've noticed that he added something similar for
+  android builds
+
+Change-Id: I4f6e634bf0b2cb96065ee5c38b9cd8a224c3bd37
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Simon Busch <morphis@gravedo.de>
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+Conflicts:
+        tools/configure/configureapp.cpp
+---
+ configure                           |  1 +
+ qmake/property.cpp                  |  1 +
+ src/corelib/global/qlibraryinfo.cpp |  3 ++-
+ src/corelib/global/qlibraryinfo.h   |  1 +
+ tools/configure/configureapp.cpp    | 11 +++++++++++
+ 5 files changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index f0f42ab..04fd1ba 100755
+--- a/configure
++++ b/configure
+@@ -3846,6 +3846,7 @@ addConfStr "$CFG_SYSROOT"
+ addConfStr "$QT_REL_HOST_BINS"
+ addConfStr "$QT_REL_HOST_LIBS"
+ addConfStr "$QT_REL_HOST_DATA"
++addConfStr "$QT_EXTERNAL_HOST_BINS"
+ addConfStr "$shortxspec"
+ addConfStr "$shortspec"
+ 
+diff --git a/qmake/property.cpp b/qmake/property.cpp
+index 817ae95..c69539f 100644
+--- a/qmake/property.cpp
++++ b/qmake/property.cpp
+@@ -68,6 +68,7 @@ static const struct {
+     { "QT_HOST_DATA", QLibraryInfo::HostDataPath, true },
+     { "QT_HOST_BINS", QLibraryInfo::HostBinariesPath, true },
+     { "QT_HOST_LIBS", QLibraryInfo::HostLibrariesPath, true },
++    { "QT_EXTERNAL_HOST_BINS", QLibraryInfo::ExternalHostBinariesPath, true },
+     { "QMAKE_SPEC", QLibraryInfo::HostSpecPath, true },
+     { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
+ };
+diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
+index c3b5c2d..1381658 100644
+--- a/src/corelib/global/qlibraryinfo.cpp
++++ b/src/corelib/global/qlibraryinfo.cpp
+@@ -373,7 +373,7 @@ QLibraryInfo::isDebugBuild()
+  */
+ 
+ static const struct {
+-    char key[19], value[13];
++    char key[21], value[13];
+ } qtConfEntries[] = {
+     { "Prefix", "." },
+     { "Documentation", "doc" }, // should be ${Data}/doc
+@@ -398,6 +398,7 @@ static const struct {
+     { "HostBinaries", "bin" },
+     { "HostLibraries", "lib" },
+     { "HostData", "." },
++    { "ExternalHostBinaries", "" },
+     { "TargetSpec", "" },
+     { "HostSpec", "" },
+     { "HostPrefix", "" },
+diff --git a/src/corelib/global/qlibraryinfo.h b/src/corelib/global/qlibraryinfo.h
+index 1ad7637..5a8b127 100644
+--- a/src/corelib/global/qlibraryinfo.h
++++ b/src/corelib/global/qlibraryinfo.h
+@@ -81,6 +81,7 @@ public:
+         HostBinariesPath,
+         HostLibrariesPath,
+         HostDataPath,
++        ExternalHostBinariesPath,
+         TargetSpecPath,
+         HostSpecPath,
+         HostPrefixPath,
+diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
+index 3bf0546..53bf146 100644
+--- a/tools/configure/configureapp.cpp
++++ b/tools/configure/configureapp.cpp
+@@ -1217,6 +1217,13 @@ void Configure::parseCmdLine()
+             dictionary[ "QT_EXT_PREFIX" ] = configCmdLine.at(i);
+         }
+ 
++        else if (configCmdLine.at(i) == "-external-hostbindir") {
++            ++i;
++            if (i == argCount)
++                break;
++            dictionary[ "QT_EXTERNAL_HOST_BINS" ] = configCmdLine.at(i);
++        }
++
+         else if (configCmdLine.at(i) == "-make-tool") {
+             ++i;
+             if (i == argCount)
+@@ -4101,6 +4108,9 @@ void Configure::generateQConfigCpp()
+ 
+     if (dictionary["QT_REL_HOST_DATA"].isEmpty())
+         dictionary["QT_REL_HOST_DATA"] = haveHpx ? "." : dictionary["QT_REL_INSTALL_ARCHDATA"];
++    
++    if (dictionary["QT_EXTERNAL_HOST_BINS"].isEmpty())
++        dictionary["QT_EXTERNAL_HOST_BINS"] = haveHpx ? "bin" : dictionary["QT_REL_INSTALL_BINS"];
+ 
+     confStringOff = 0;
+     addConfStr(0, dictionary["QT_REL_INSTALL_DOCS"]);
+@@ -4120,6 +4130,7 @@ void Configure::generateQConfigCpp()
+     addConfStr(1, dictionary["QT_REL_HOST_BINS"]);
+     addConfStr(1, dictionary["QT_REL_HOST_LIBS"]);
+     addConfStr(1, dictionary["QT_REL_HOST_DATA"]);
++    addConfStr(1, dictionary["QT_EXTERNAL_HOST_BINS"]);
+     addConfStr(1, targSpec);
+     addConfStr(1, hostSpec);
+ 
+-- 
+2.5.3
+
diff --git a/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
deleted file mode 100644
index 59266f4..0000000
--- a/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From c6a58549ef110a31960fca80f6d3dcdcf4d9176a Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 16 Nov 2013 00:32:30 +0100
-Subject: [PATCH 09/11] Always build uic
-
-Even if we are not building gui or widgets. This tool is needed later
-as a native tool when compiling the target.
-
-Change-Id: I257668ac28c22b192e7ec7736e6c23fa3be6bab6
-Signed-off-by: Mikko Levonmaa <mikko.levonmaa@palm.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/src.pro | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/src.pro b/src/src.pro
-index b4d62aa..5e19215 100644
---- a/src/src.pro
-+++ b/src/src.pro
-@@ -182,7 +182,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
-         }
-     }
- }
--SUBDIRS += src_plugins src_tools_qdoc
-+SUBDIRS += src_plugins src_tools_qdoc src_tools_uic
- 
- nacl: SUBDIRS -= src_network src_testlib
- 
--- 
-2.5.0
-
diff --git a/recipes-qt/qt5/qtbase/0009-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch b/recipes-qt/qt5/qtbase/0009-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
new file mode 100644
index 0000000..760f446
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0009-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
@@ -0,0 +1,36 @@
+From b0648c997d24855b2a6f56fc61e3159af815fb4d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 8 Jun 2015 13:59:25 -0700
+Subject: [PATCH 09/10] linux-oe-g++: Invert conditional for defining
+ QT_SOCKLEN_T
+
+This helps to make sure that QT_SOCKLEN_T is defined to be 'int'
+only when its glibc < 2 and not also for the libraries which may define
+it as per standards but are not glibc, e.g. musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ mkspecs/linux-oe-g++/qplatformdefs.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/mkspecs/linux-oe-g++/qplatformdefs.h b/mkspecs/linux-oe-g++/qplatformdefs.h
+index dd12003..8623651 100644
+--- a/mkspecs/linux-oe-g++/qplatformdefs.h
++++ b/mkspecs/linux-oe-g++/qplatformdefs.h
+@@ -86,10 +86,10 @@
+ 
+ #undef QT_SOCKLEN_T
+ 
+-#if defined(__GLIBC__) && (__GLIBC__ >= 2)
+-#define QT_SOCKLEN_T            socklen_t
+-#else
++#if defined(__GLIBC__) && (__GLIBC__ < 2)
+ #define QT_SOCKLEN_T            int
++#else
++#define QT_SOCKLEN_T            socklen_t
+ #endif
+ 
+ #if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE >= 500)
+-- 
+2.5.3
+
diff --git a/recipes-qt/qt5/qtbase/0009-qmake-don-t-build-it-in-configure-but-allow-to-build.patch b/recipes-qt/qt5/qtbase/0009-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
deleted file mode 100644
index 8521327..0000000
--- a/recipes-qt/qt5/qtbase/0009-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 744fc89cd56387cac613534adc538900ed133b25 Mon Sep 17 00:00:00 2001
-From: Michael Krelin <hacker@klever.net>
-Date: Mon, 29 Oct 2012 20:07:49 -0700
-Subject: [PATCH 09/10] qmake: don't build it in configure, but allow to build
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
-index b8f1fb9..c72b8ee 100755
---- a/configure
-+++ b/configure
-@@ -3929,7 +3929,7 @@ setBootstrapEvalVariable()
- 
- 
- # build qmake
--if true; then ###[ '!' -f "$outpath/bin/qmake" ];
-+if false; then ###[ '!' -f "$outpath/bin/qmake" ];
-     echo "Creating qmake..."
- 
-     mkdir -p "$outpath/qmake" || exit
-diff --git a/qmake/qmake.pri b/qmake/qmake.pri
-index 782151d..4b314a8 100644
---- a/qmake/qmake.pri
-+++ b/qmake/qmake.pri
-@@ -80,7 +80,8 @@ bootstrap { #Qt code
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
-2.5.0
-
diff --git a/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch b/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch
deleted file mode 100644
index 4e770ee..0000000
--- a/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-From b0ab57e1f0781b73830514ddc498f38da0886d15 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH 10/11] Add -external-hostbindir option for native(sdk)
-
-* when cross-compiling it's sometimes useful to use existing tools from machine
-  (or in OpenEmbedded built with separate native recipe) when building for target
-
-* this way we can skip bootstraping tools we already have
-
-* qt_functions: temporary remove isEmpty check
-* now we assume that every build will provide QT_EXTERNAL_HOST_BINS value
-* isEmpty works correctly only with qmake variables (e.g. $$FOO -
-  isEmpty(FOO)), but doesn't work with system properties like $$[FOO].
-
-* cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS to determine path to host binaries
-
-Upstream-Status: Pending
-  is a lot better for upstreaming (and it was already sort of approved by
-  Oswald) but in 5.2.0 I've noticed that he added something similar for
-  android builds
-
-Change-Id: I4f6e634bf0b2cb96065ee5c38b9cd8a224c3bd37
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Signed-off-by: Simon Busch <morphis@gravedo.de>
-Signed-off-by: Jonathan Liu <net147@gmail.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-Conflicts:
-        tools/configure/configureapp.cpp
----
- configure                           |  1 +
- qmake/property.cpp                  |  1 +
- src/corelib/global/qlibraryinfo.cpp |  3 ++-
- src/corelib/global/qlibraryinfo.h   |  1 +
- tools/configure/configureapp.cpp    | 11 +++++++++++
- 5 files changed, 16 insertions(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index b8f1fb9..1d2157f 100755
---- a/configure
-+++ b/configure
-@@ -3833,6 +3833,7 @@ addConfStr "$CFG_SYSROOT"
- addConfStr "$QT_REL_HOST_BINS"
- addConfStr "$QT_REL_HOST_LIBS"
- addConfStr "$QT_REL_HOST_DATA"
-+addConfStr "$QT_EXTERNAL_HOST_BINS"
- addConfStr "$shortxspec"
- addConfStr "$shortspec"
- 
-diff --git a/qmake/property.cpp b/qmake/property.cpp
-index 817ae95..c69539f 100644
---- a/qmake/property.cpp
-+++ b/qmake/property.cpp
-@@ -68,6 +68,7 @@ static const struct {
-     { "QT_HOST_DATA", QLibraryInfo::HostDataPath, true },
-     { "QT_HOST_BINS", QLibraryInfo::HostBinariesPath, true },
-     { "QT_HOST_LIBS", QLibraryInfo::HostLibrariesPath, true },
-+    { "QT_EXTERNAL_HOST_BINS", QLibraryInfo::ExternalHostBinariesPath, true },
-     { "QMAKE_SPEC", QLibraryInfo::HostSpecPath, true },
-     { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
- };
-diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index f663c88..675bd4c 100644
---- a/src/corelib/global/qlibraryinfo.cpp
-+++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -373,7 +373,7 @@ QLibraryInfo::isDebugBuild()
-  */
- 
- static const struct {
--    char key[19], value[13];
-+    char key[21], value[13];
- } qtConfEntries[] = {
-     { "Prefix", "." },
-     { "Documentation", "doc" }, // should be ${Data}/doc
-@@ -398,6 +398,7 @@ static const struct {
-     { "HostBinaries", "bin" },
-     { "HostLibraries", "lib" },
-     { "HostData", "." },
-+    { "ExternalHostBinaries", "" },
-     { "TargetSpec", "" },
-     { "HostSpec", "" },
-     { "HostPrefix", "" },
-diff --git a/src/corelib/global/qlibraryinfo.h b/src/corelib/global/qlibraryinfo.h
-index 1ad7637..5a8b127 100644
---- a/src/corelib/global/qlibraryinfo.h
-+++ b/src/corelib/global/qlibraryinfo.h
-@@ -81,6 +81,7 @@ public:
-         HostBinariesPath,
-         HostLibrariesPath,
-         HostDataPath,
-+        ExternalHostBinariesPath,
-         TargetSpecPath,
-         HostSpecPath,
-         HostPrefixPath,
-diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index 3bf0546..53bf146 100644
---- a/tools/configure/configureapp.cpp
-+++ b/tools/configure/configureapp.cpp
-@@ -1217,6 +1217,13 @@ void Configure::parseCmdLine()
-             dictionary[ "QT_EXT_PREFIX" ] = configCmdLine.at(i);
-         }
- 
-+        else if (configCmdLine.at(i) == "-external-hostbindir") {
-+            ++i;
-+            if (i == argCount)
-+                break;
-+            dictionary[ "QT_EXTERNAL_HOST_BINS" ] = configCmdLine.at(i);
-+        }
-+
-         else if (configCmdLine.at(i) == "-make-tool") {
-             ++i;
-             if (i == argCount)
-@@ -4101,6 +4108,9 @@ void Configure::generateQConfigCpp()
- 
-     if (dictionary["QT_REL_HOST_DATA"].isEmpty())
-         dictionary["QT_REL_HOST_DATA"] = haveHpx ? "." : dictionary["QT_REL_INSTALL_ARCHDATA"];
-+    
-+    if (dictionary["QT_EXTERNAL_HOST_BINS"].isEmpty())
-+        dictionary["QT_EXTERNAL_HOST_BINS"] = haveHpx ? "bin" : dictionary["QT_REL_INSTALL_BINS"];
- 
-     confStringOff = 0;
-     addConfStr(0, dictionary["QT_REL_INSTALL_DOCS"]);
-@@ -4120,6 +4130,7 @@ void Configure::generateQConfigCpp()
-     addConfStr(1, dictionary["QT_REL_HOST_BINS"]);
-     addConfStr(1, dictionary["QT_REL_HOST_LIBS"]);
-     addConfStr(1, dictionary["QT_REL_HOST_DATA"]);
-+    addConfStr(1, dictionary["QT_EXTERNAL_HOST_BINS"]);
-     addConfStr(1, targSpec);
-     addConfStr(1, hostSpec);
- 
--- 
-2.5.0
-
diff --git a/recipes-qt/qt5/qtbase/0010-configure-preserve-built-qmake-and-swap-with-native-.patch b/recipes-qt/qt5/qtbase/0010-configure-preserve-built-qmake-and-swap-with-native-.patch
new file mode 100644
index 0000000..9a8ddbb
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0010-configure-preserve-built-qmake-and-swap-with-native-.patch
@@ -0,0 +1,30 @@
+From 706d9a8b270d5eb803e93005cc90a1aa1553572a Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Mon, 11 Nov 2013 20:22:34 -0500
+Subject: [PATCH 10/10] configure: preserve built qmake and swap with native
+ one
+
+Let configure script build the real qmake, but right after it's built, swap
+it with a native qmake for further internal use, preserving the real one.
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ configure | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure b/configure
+index 04fd1ba..8914e9c 100755
+--- a/configure
++++ b/configure
+@@ -4112,6 +4112,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+         echo "Done."
+     fi
+ fi # Build qmake
++mv "$outpath/bin/qmake" "$outpath/bin/qmake-real"
++mv "$outpath/bin/qmake-native" "$outpath/bin/qmake"
+ 
+ echo "Running configuration tests..."
+ 
+-- 
+2.5.3
+
diff --git a/recipes-qt/qt5/qtbase/0010-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch b/recipes-qt/qt5/qtbase/0010-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
deleted file mode 100644
index 0069a17..0000000
--- a/recipes-qt/qt5/qtbase/0010-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From bae2c6afb951d1352845ca257fdc2389f3fe851e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 8 Jun 2015 13:59:25 -0700
-Subject: [PATCH 10/10] linux-oe-g++: Invert conditional for defining
- QT_SOCKLEN_T
-
-This helps to make sure that QT_SOCKLEN_T is defined to be 'int'
-only when its glibc < 2 and not also for the libraries which may define
-it as per standards but are not glibc, e.g. musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- mkspecs/linux-oe-g++/qplatformdefs.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/mkspecs/linux-oe-g++/qplatformdefs.h b/mkspecs/linux-oe-g++/qplatformdefs.h
-index dd12003..8623651 100644
---- a/mkspecs/linux-oe-g++/qplatformdefs.h
-+++ b/mkspecs/linux-oe-g++/qplatformdefs.h
-@@ -86,10 +86,10 @@
- 
- #undef QT_SOCKLEN_T
- 
--#if defined(__GLIBC__) && (__GLIBC__ >= 2)
--#define QT_SOCKLEN_T            socklen_t
--#else
-+#if defined(__GLIBC__) && (__GLIBC__ < 2)
- #define QT_SOCKLEN_T            int
-+#else
-+#define QT_SOCKLEN_T            socklen_t
- #endif
- 
- #if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE >= 500)
--- 
-2.5.0
-
diff --git a/recipes-qt/qt5/qtbase/0010-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch b/recipes-qt/qt5/qtbase/0010-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch
new file mode 100644
index 0000000..b2dbbfd
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0010-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch
@@ -0,0 +1,49 @@
+From c09e6ef0bf6a879455ffee496c716a0bc1787cdf Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Sat, 12 Sep 2015 12:58:46 +0200
+Subject: [PATCH 10/10] qeglplatformscreen.cpp: reorder headers to fix build
+ with egl enabled
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+fixes:
+In file included from /home/superandy/tmp/oe-core-glibc/sysroots/varsomimx6q/usr/include/X11/Xlib.h:44:0,
+                 from /home/superandy/tmp/oe-core-glibc/sysroots/varsomimx6q/usr/include/EGL/eglvivante.h:244,
+                 from /home/superandy/tmp/oe-core-glibc/sysroots/varsomimx6q/usr/include/EGL/eglplatform.h:38,
+                 from /home/superandy/tmp/oe-core-glibc/sysroots/varsomimx6q/usr/include/EGL/egl.h:39,
+                 from /home/superandy/tmp/oe-core-glibc/work/cortexa9t2hf-vfp-neon-mx6qdl-angstrom-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/platformsupport/eglconvenience/qeglplatformscreen_p.h:52,
+                 from /home/superandy/tmp/oe-core-glibc/work/cortexa9t2hf-vfp-neon-mx6qdl-angstrom-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/platformsupport/eglconvenience/qeglplatformscreen.cpp:34:
+../../include/QtCore/../../../git/src/corelib/io/qurl.h:131:9: error: expected identifier before numeric constant
+         None = 0x0,
+         ^
+
+This patch has a very limited lifetime: In branch dev and 5.6 the patched file is gone. Therefore:
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/platformsupport/eglconvenience/qeglplatformscreen.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/platformsupport/eglconvenience/qeglplatformscreen.cpp b/src/platformsupport/eglconvenience/qeglplatformscreen.cpp
+index 61f8cdd..ceec797 100644
+--- a/src/platformsupport/eglconvenience/qeglplatformscreen.cpp
++++ b/src/platformsupport/eglconvenience/qeglplatformscreen.cpp
+@@ -31,10 +31,10 @@
+ **
+ ****************************************************************************/
+ 
+-#include "qeglplatformscreen_p.h"
+-#include "qeglplatformwindow_p.h"
+ #include <QtGui/qwindow.h>
+ #include <qpa/qwindowsysteminterface.h>
++#include "qeglplatformscreen_p.h"
++#include "qeglplatformwindow_p.h"
+ #include <QtPlatformSupport/private/qopenglcompositor_p.h>
+ 
+ QT_BEGIN_NAMESPACE
+-- 
+2.5.3
+
diff --git a/recipes-qt/qt5/qtbase/0011-configure-preserve-built-qmake-and-swap-with-native-.patch b/recipes-qt/qt5/qtbase/0011-configure-preserve-built-qmake-and-swap-with-native-.patch
deleted file mode 100644
index 1bfe825..0000000
--- a/recipes-qt/qt5/qtbase/0011-configure-preserve-built-qmake-and-swap-with-native-.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From cef1ac9fa399ad5c57480de26a1ef441414f125c Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Mon, 11 Nov 2013 20:22:34 -0500
-Subject: [PATCH 11/11] configure: preserve built qmake and swap with native
- one
-
-Let configure script build the real qmake, but right after it's built, swap
-it with a native qmake for further internal use, preserving the real one.
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- configure | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/configure b/configure
-index 1d2157f..bea14af 100755
---- a/configure
-+++ b/configure
-@@ -4099,6 +4099,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
-         echo "Done."
-     fi
- fi # Build qmake
-+mv "$outpath/bin/qmake" "$outpath/bin/qmake-real"
-+mv "$outpath/bin/qmake-native" "$outpath/bin/qmake"
- 
- echo "Running configuration tests..."
- 
--- 
-2.5.0
-
diff --git a/recipes-qt/qt5/qtbase/0012-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch b/recipes-qt/qt5/qtbase/0012-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch
deleted file mode 100644
index a1a8791..0000000
--- a/recipes-qt/qt5/qtbase/0012-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From f8873b5ba0fa42cc0d2aadfd6c5a449b37799609 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Sat, 12 Sep 2015 12:58:46 +0200
-Subject: [PATCH] qeglplatformscreen.cpp: reorder headers to fix build with egl
- enabled
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-fixes:
-In file included from /home/superandy/tmp/oe-core-glibc/sysroots/varsomimx6q/usr/include/X11/Xlib.h:44:0,
-                 from /home/superandy/tmp/oe-core-glibc/sysroots/varsomimx6q/usr/include/EGL/eglvivante.h:244,
-                 from /home/superandy/tmp/oe-core-glibc/sysroots/varsomimx6q/usr/include/EGL/eglplatform.h:38,
-                 from /home/superandy/tmp/oe-core-glibc/sysroots/varsomimx6q/usr/include/EGL/egl.h:39,
-                 from /home/superandy/tmp/oe-core-glibc/work/cortexa9t2hf-vfp-neon-mx6qdl-angstrom-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/platformsupport/eglconvenience/qeglplatformscreen_p.h:52,
-                 from /home/superandy/tmp/oe-core-glibc/work/cortexa9t2hf-vfp-neon-mx6qdl-angstrom-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/platformsupport/eglconvenience/qeglplatformscreen.cpp:34:
-../../include/QtCore/../../../git/src/corelib/io/qurl.h:131:9: error: expected identifier before numeric constant
-         None = 0x0,
-         ^
-
-This patch has a very limited lifetime: In branch dev and 5.6 the patched file is gone. Therefore:
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- src/platformsupport/eglconvenience/qeglplatformscreen.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/platformsupport/eglconvenience/qeglplatformscreen.cpp b/src/platformsupport/eglconvenience/qeglplatformscreen.cpp
-index 61f8cdd..ceec797 100644
---- a/src/platformsupport/eglconvenience/qeglplatformscreen.cpp
-+++ b/src/platformsupport/eglconvenience/qeglplatformscreen.cpp
-@@ -31,10 +31,10 @@
- **
- ****************************************************************************/
- 
--#include "qeglplatformscreen_p.h"
--#include "qeglplatformwindow_p.h"
- #include <QtGui/qwindow.h>
- #include <qpa/qwindowsysteminterface.h>
-+#include "qeglplatformscreen_p.h"
-+#include "qeglplatformwindow_p.h"
- #include <QtPlatformSupport/private/qopenglcompositor_p.h>
- 
- QT_BEGIN_NAMESPACE
--- 
-2.1.0
-
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index f64804c..63f52f4 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -4,7 +4,8 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
@@ -18,14 +19,13 @@ SRC_URI += "\
     file://0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
     file://0006-configure-bump-path-length-from-256-to-512-character.patch \
     file://0007-QOpenGLPaintDevice-sub-area-support.patch \
-    file://0008-Fix-build-with-clang-3.7.patch \
 "
 
 # specific for target qtbase
 SRC_URI += "\
-    file://0009-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
-    file://0010-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
-    file://0012-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch \
+    file://0008-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
+    file://0009-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
+    file://0010-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch \
 "
 
 DEPENDS += "qtbase-native"
@@ -279,4 +279,4 @@ sysroot_stage_dirs_append() {
     rm -rf $to${OE_QMAKE_PATH_LIBS}/fonts
 }
 
-SRCREV = "2fde9f59eeab68ede92324e7613daf8be3eaf498"
+SRCREV = "c619d2daac9b1f61e8ad2320b59c648b6af6af90"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index aca896f..4616a21 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -3,10 +3,11 @@ require qt5-git.inc
 
 LICENSE = "LGPL-3.0 | GPL-3.0"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LICENSE.GPL;md5=05832301944453ec79e40ba3c3cfceec \
 "
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "f8fe29aab406ded57f13ad961ba977401d9585c9"
+SRCREV = "e372a67c1bbdf695f8e550950a3dbf3106389479"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 4781be1..24988cd 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -4,7 +4,8 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
     file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
@@ -21,4 +22,4 @@ do_configure_prepend() {
     sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/qtconnectivity.pro
 }
 
-SRCREV = "e4a5dc7dbe62c32032e5e683ac1fdb57663a14b3"
+SRCREV = "b31cbd7c5d6b16a20035ace6675835356b69fd65"
diff --git a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
index 3c34977..5dd0aa4 100644
--- a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
+++ b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
@@ -1,4 +1,4 @@
-From 47b3408b8aeed4795dcfebcd81b6b7b4185712de Mon Sep 17 00:00:00 2001
+From c866d9b3f38f1a0adabdeb19648058711a66a900 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
 Date: Sun, 26 May 2013 14:26:19 +0200
 Subject: [PATCH] qmltestexample: fix link
@@ -84,5 +84,5 @@ index 1bb913e..56f2dd5 100644
  
  load(qt_tool)
 -- 
-2.4.2
+2.5.3
 
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 105c9cd..57e76e3 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -5,7 +5,8 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
@@ -32,6 +33,6 @@ do_configure_prepend() {
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "cc0df64bb0e1dea2fe37950816095802f527a241"
+SRCREV = "9794e7d66c30f012a19ec9530d719293b7c5bc7c"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index 0e2a0ce..47f2a1d 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -4,11 +4,12 @@ require qt5-git.inc
 LICENSE = "BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
 "
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
 QT_MODULE_BRANCH = "1.2"
-SRCREV = "749bcec16b89269026a2048c7394df74f08935c4"
+SRCREV = "e32bcb7b714454f9167c4d49776a95c9a5799d70"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index ef14672..e707dee 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -6,7 +6,8 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
     file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
@@ -16,4 +17,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "73357afbbe46e660b3497f621505f351b43c5efa"
+SRCREV = "9aa0edc6d13d20796feb1712883eddb7cd411ecd"
diff --git a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
index 66b24e5..66000c5 100644
--- a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
+++ b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
@@ -1,4 +1,4 @@
-From f2e3dfd496a79a993ae4a03c2239b757131a9a68 Mon Sep 17 00:00:00 2001
+From 464c01a76acdde344248a873f63c5016d0258a31 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 4 Aug 2014 19:19:05 +0200
 Subject: [PATCH] qtimageformats.pro: Make the dependencies deterministic
@@ -27,5 +27,5 @@ index 8382e5c..63d13ce 100644
  
  load(qt_parts)
 -- 
-2.4.2
+2.5.3
 
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index f3726da..85a1dce 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -4,7 +4,8 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
     file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
@@ -27,4 +28,4 @@ EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'jasper', 'CONFIG+=OE_
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libtiff', 'CONFIG+=OE_LIBTIFF_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libwebp', 'CONFIG+=OE_LIBWEBP_ENABLED', '', d)}"
 
-SRCREV = "e76fd83774f2e2ba552700e02e974fd4608bb001"
+SRCREV = "3c68f26c052b06da9b43bb775cbe5a539fccb0c3"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 191dfcf..df5a67d 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -4,7 +4,8 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
     file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
@@ -28,4 +29,4 @@ do_configure_prepend() {
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
 
-SRCREV = "d2d08b4f04a40c9760d73da36ed7c61881d99326"
+SRCREV = "d1c91515ef0ad4208c41a4052f92bfb817333aca"
diff --git a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
index 59a5282..ec96ddc 100644
--- a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
+++ b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
@@ -1,4 +1,4 @@
-From fe90d2bb5dcfd1cb75ed5414a4acdb9dfc9d4367 Mon Sep 17 00:00:00 2001
+From c75cdeeb0ea705b9415c3cf777c611aee01f62c2 Mon Sep 17 00:00:00 2001
 From: Yoann Lopes <yoann.lopes@digia.com>
 Date: Thu, 31 Oct 2013 15:06:30 +0100
 Subject: [PATCH] Initial porting effort to GStreamer 1.0.
@@ -13,14 +13,14 @@ Subject: [PATCH] Initial porting effort to GStreamer 1.0.
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- qtmultimedia.pro | 25 +++++++++++++------------
- 1 file changed, 13 insertions(+), 12 deletions(-)
+ qtmultimedia.pro | 26 ++++++++++++++------------
+ 1 file changed, 14 insertions(+), 12 deletions(-)
 
 diff --git a/qtmultimedia.pro b/qtmultimedia.pro
-index 1225ffb..a60b1fc 100644
+index 1225ffb..4f675fe 100644
 --- a/qtmultimedia.pro
 +++ b/qtmultimedia.pro
-@@ -18,19 +18,20 @@ win32 {
+@@ -18,19 +18,21 @@ win32 {
      contains(QT_CONFIG, alsa):qtCompileTest(alsa)
      contains(QT_CONFIG, pulseaudio):qtCompileTest(pulseaudio)
  
@@ -36,6 +36,13 @@ index 1225ffb..a60b1fc 100644
 +            } else: contains(QT_CONFIG, gstreamer-1.0) {
 +                GST_VERSION = 1.0
 +            }
++        }
++        cache(GST_VERSION, set)
++        !isEmpty(GST_VERSION):qtCompileTest(gstreamer) {
++            qtCompileTest(gstreamer_photography)
++            qtCompileTest(gstreamer_encodingprofiles)
++            qtCompileTest(gstreamer_appsrc)
++            qtCompileTest(linux_v4l)
          }
 -    }
 -    cache(GST_VERSION, set)
@@ -44,15 +51,9 @@ index 1225ffb..a60b1fc 100644
 -        qtCompileTest(gstreamer_encodingprofiles)
 -        qtCompileTest(gstreamer_appsrc)
 -        qtCompileTest(linux_v4l)
-+        cache(GST_VERSION, set)
-+        !isEmpty(GST_VERSION):qtCompileTest(gstreamer) {
-+            qtCompileTest(gstreamer_photography)
-+            qtCompileTest(gstreamer_encodingprofiles)
-+            qtCompileTest(gstreamer_appsrc)
-+            qtCompileTest(linux_v4l)
      }
  
      qtCompileTest(resourcepolicy)
 -- 
-2.4.2
+2.5.3
 
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index f190b9f..7103c04 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -5,7 +5,8 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
@@ -30,4 +31,8 @@ EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'gstreamer010', 'G
 # Disable GStreamer if completely disabled
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains_any('PACKAGECONFIG', 'gstreamer gstreamer010', '', 'CONFIG+=done_config_gstreamer', d)}"
 
-SRCREV = "3f15c1b17e55b5b118d11621f85fa74f7cc74ae6"
+SRC_URI += "\
+     file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
+"
+
+SRCREV = "46a83d5b86a792e62f14674e27c5d95695f2b44d"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index 905fcd9..edd47f6 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -7,7 +7,8 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
     file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
@@ -23,4 +24,4 @@ do_configure_prepend() {
     sed -i 's#^qtHaveModule(webkitwidgets):#enable-webkit:qtHaveModule(webkitwidgets):#g' ${S}/src/imports/imports.pro
 }
 
-SRCREV = "eb3c45a5a6a84bd02cac2f5254ef56c3fe2536e8"
+SRCREV = "f079636a3ee5538eb79fd4e7e6ffcb0465a015a0"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 823923e..bd42cc9 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -3,7 +3,8 @@ require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & BSD & LGPL-3.0 | GPL-2.0"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
     file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
 "
@@ -12,4 +13,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "32ac38930c7a5183d6ce7f88d7008c9c45b2c94b"
+SRCREV = "b35b0d60c8252b44e21e53922cba9c3a2d1abbc1"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 0a04d15..b07675f 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -6,7 +6,8 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
@@ -25,4 +26,4 @@ ARM_INSTRUCTION_SET = "arm"
 
 DEPENDS += "qtbase"
 
-SRCREV = "2724355d3a1029168e19162e1d1b10dd3f98dc89"
+SRCREV = "50446e4edb0360871309a5d72a9a873f45fb17bd"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 5a01ce0..c37a12d 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -6,7 +6,8 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
     file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
@@ -14,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "414c0a82944bcf1bd4763f343b85abb0d8eb2f2d"
+SRCREV = "a7b94516e1412073eb9d3fb57e49315ef966b183"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index 0f8ec30..53e6069 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -6,7 +6,8 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LGPL_EXCEPTION.txt;md5=bb426f3367c4805d1e12fad05bd0b750 \
     file://LICENSE.FDL;md5=3801d7932fdc07fd9efe89f9854a6caa \
     file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
@@ -14,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "d9ab9258ca81650a914357d53e7f92f293d4ef81"
+SRCREV = "ad108e9d56e7838eac3726e0492a246086d53e70"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 5fb84ca..dc0bd5f 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -5,11 +5,12 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
 DEPENDS += "qtbase"
 
-SRCREV = "ae3990fbf41039c78066c8440c654936365d9404"
+SRCREV = "b5d689eaafd1e243d38f4df30f2d35eaab8b3b44"
diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index 781cd38..7e36e80 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -3,8 +3,8 @@ require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & LGPL-2.1 | GPL-3.0"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+    file://LICENSE.LGPLv21;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+    file://LICENSE.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
@@ -30,4 +30,4 @@ QT_MODULE_BRANCH = "dev"
 # qtsystems wasn't released yet, last tag before this SRCREV is 5.0.0-beta1
 # qt5-git PV is only to indicate that this recipe is compatible with qt5 5.5
 
-SRCREV = "4e3a7ed3ef5226256ae6aee1a73e264768aac8f4"
+SRCREV = "0577ffca58b7fed78c1820fc1c2b7ab3533d5698"
diff --git a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
index ab08fc0..7d14014 100644
--- a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
+++ b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
@@ -1,4 +1,4 @@
-From 5d1c8cdf5d448d5b3f719447dae3a59340348d2e Mon Sep 17 00:00:00 2001
+From 922931781bd4fd765de996f1709aff95b6ac3fba Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.jansa@gmail.com>
 Date: Wed, 11 Sep 2013 18:30:08 +0200
 Subject: [PATCH 1/3] Allow to build only lrelease + lupdate + lconvert
@@ -15,8 +15,8 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  src/designer/src/src.pro  | 18 ++++++++++--------
  src/linguist/linguist.pro |  2 +-
  src/src.pro               | 14 ++++++++------
- tests/auto/auto.pro       | 22 ++++++++++++----------
- 5 files changed, 33 insertions(+), 26 deletions(-)
+ tests/auto/auto.pro       | 24 +++++++++++++-----------
+ 5 files changed, 34 insertions(+), 27 deletions(-)
 
 diff --git a/examples/examples.pro b/examples/examples.pro
 index 69365d1..da7b38b 100644
@@ -122,10 +122,10 @@ index 494898f..c02848d 100644
  qtNomakeTools( \
      pixeltool \
 diff --git a/tests/auto/auto.pro b/tests/auto/auto.pro
-index a703a06..44bae18 100644
+index 20b5fec..8a42d1f 100644
 --- a/tests/auto/auto.pro
 +++ b/tests/auto/auto.pro
-@@ -1,14 +1,16 @@
+@@ -1,15 +1,17 @@
  TEMPLATE=subdirs
 -SUBDIRS=\
 -    linguist \
@@ -136,7 +136,8 @@ index a703a06..44bae18 100644
 -    qhelpprojectdata \
 -    cmake \
 -    installed_cmake \
--    qtdiag
+-    qtdiag \
+-    windeployqt
 +!linguistonly {
 +    SUBDIRS=\
 +        linguist \
@@ -146,12 +147,13 @@ index a703a06..44bae18 100644
 +        qhelpindexmodel \
 +        qhelpprojectdata \
 +        cmake \
-+        installed_cmake
-+        qtdiag
++        installed_cmake \
++        qtdiag \
++        windeployqt
 +}
  
  installed_cmake.depends = cmake
  
 -- 
-2.4.2
+2.5.3
 
diff --git a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
index 7177652..7496a4a 100644
--- a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
+++ b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
@@ -1,4 +1,4 @@
-From b0f96a829a7a04400f6a8b6cb14756db175c8e03 Mon Sep 17 00:00:00 2001
+From 83493e0f4e0d8b4dbf1da982e4459fefea61c582 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 17 Jan 2014 14:33:19 +0100
 Subject: [PATCH 2/3] assistant/help: fix linking of dependent libraries
@@ -28,5 +28,5 @@ index 168d23d..a9c3b59 100644
 +
 +LIBS += -lQt5CLucene
 -- 
-2.4.2
+2.5.3
 
diff --git a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
index 0c3842e..55506f8 100644
--- a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
@@ -1,4 +1,4 @@
-From a4438a8c93e9846f1057dd7a21cbb41183440ec1 Mon Sep 17 00:00:00 2001
+From ad5e4266eda956a1ff408bf3fe875badc5f4c866 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
 Subject: [PATCH 3/3] add noqtwebkit configuration
@@ -47,5 +47,5 @@ index 500a153..b60fa2d 100644
  win32: qtHaveModule(axcontainer): SUBDIRS += activeqt
  qtHaveModule(quickwidgets): SUBDIRS += qquickwidget
 -- 
-2.4.2
+2.5.3
 
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 5651f56..6aa478a 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -4,7 +4,8 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
@@ -30,6 +31,6 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'linguistonly', 'CONFIG+=linguistonly', '', d)}"
 
-SRCREV = "33c65366a7c3901d2aecfde3dbc485e1eac5c10c"
+SRCREV = "02402887562f55b822fd29a64437da3d1252fd5b"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index cff2a09..673e25d 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -4,7 +4,8 @@ require qt5-git.inc
 LICENSE = "(LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
 "
 
@@ -98,4 +99,4 @@ FILES_${PN}-qt = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
 "
 
-SRCREV = "5e65c6fcdbbc75040426c8239c686f7b1ea689fd"
+SRCREV = "6fbc830e0ebeb66a5570e8c432c27658670cd071"
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index efb615a..48a94e5 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -5,7 +5,8 @@ require qt5-git.inc
 LICENSE = "BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
@@ -24,4 +25,4 @@ do_install() {
     oe_runmake install INSTALL_ROOT=${D}
 }
 
-SRCREV = "0e4e0a7c6be2928cc4300c8ef41d10ed8b3b316c"
+SRCREV = "10fd51a3e69a0a2ee6b8cd151fa6c847f684253c"
diff --git a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
index 97326d3..3d26a5e 100644
--- a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
+++ b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
@@ -1,4 +1,4 @@
-From 5d3dbd14e72724f4cbffe79b82d5055d19094437 Mon Sep 17 00:00:00 2001
+From 09ba9e7eaebd72be5703d29848f5a65e5ca2e21c Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Fri, 19 Jul 2013 13:35:14 +0000
 Subject: [PATCH] Install the qtwaylandscanner tool to the native side
@@ -28,5 +28,5 @@ index ac2d07b..7a46a24 100644
 +target.path = $$[QT_HOST_BINS]
 +INSTALLS += target
 -- 
-2.4.2
+2.5.3
 
diff --git a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch b/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
index 714e100..d271f25 100644
--- a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
+++ b/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
@@ -1,4 +1,4 @@
-From f47f46bb3ea3a01967f0a4beab72e16e5e603fdf Mon Sep 17 00:00:00 2001
+From 19a3382694b3d66a056207e4e0345348f1d5bd57 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 22 Feb 2014 17:47:44 +0100
 Subject: [PATCH] examples/wayland: include server-buffer only when building
@@ -27,5 +27,5 @@ index d633fb9..643c7cd 100644
 +    }
  }
 -- 
-2.4.2
+2.5.3
 
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 7484a87..8e6f9d0 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -5,7 +5,8 @@ require qt5-git.inc
 LICENSE = "BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
@@ -37,7 +38,7 @@ SRC_URI += " \
     file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
 "
 
-QT_VERSION ?= "5.5.0"
+QT_VERSION ?= "5.5.1"
 
 do_install_append() {
     # do install files created by qtwaylandscanner
@@ -45,4 +46,4 @@ do_install_append() {
     install ${B}/include/QtCompositor/${QT_VERSION}/QtCompositor/private/*protocol*.h ${D}${OE_QMAKE_PATH_QT_HEADERS}/QtCompositor/${QT_VERSION}/QtCompositor/private
 }
 
-SRCREV = "0e4e0a7c6be2928cc4300c8ef41d10ed8b3b316c"
+SRCREV = "10fd51a3e69a0a2ee6b8cd151fa6c847f684253c"
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index 923ada8..60d3f38 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -6,11 +6,13 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "b0fb9dcb63e21c197417164e6067086426f1d4c6"
+SRCREV = "6a7de61bc15d0cde3a3c91c58f45ba10957aa39b"
diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
index 32e8f87..f8808c1 100644
--- a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
@@ -1,8 +1,8 @@
-From d1dfff21428643488790926bde3d699d64746f19 Mon Sep 17 00:00:00 2001
+From 8752cdaf7961ad0be8482cd6ebf76c91972f5088 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Fri, 3 Oct 2014 03:52:11 +0200
-Subject: [PATCH] <chromium> base.gypi: include atomicops_internals_x86_gcc.cc
- when building for x64 arch
+Subject: [PATCH 1/2] <chromium> base.gypi: include
+ atomicops_internals_x86_gcc.cc when building for x64 arch
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
@@ -23,5 +23,5 @@ index a5a285a..f1cad86 100644
                  ['include', 'atomicops_internals_x86_gcc.cc'],
                ],
 -- 
-2.4.2
+2.5.3
 
diff --git a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
index e8a2bab..cceba8d 100644
--- a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
@@ -1,7 +1,7 @@
-From 42b7e38e8d6fd36976a984edb40f947923d78d2c Mon Sep 17 00:00:00 2001
+From f66dceb807d27e4c0a3d1dd4d5b4f448b08317c9 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 30 Jun 2014 20:08:17 +0200
-Subject: [PATCH 1/3] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
+Subject: [PATCH 1/4] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
  anywhere in path, but at the end
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
@@ -10,7 +10,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index ef0320d..98cff24 100644
+index 69d3fd3..5689ce0 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
 @@ -98,9 +98,9 @@ defineReplace(mocOutput) {
@@ -26,5 +26,5 @@ index ef0320d..98cff24 100644
  }
  
 -- 
-2.4.2
+2.5.3
 
diff --git a/recipes-qt/qt5/qtwebengine/0002-chromium-third_party-boringssl-Demand-for-newer-POSI.patch b/recipes-qt/qt5/qtwebengine/0002-chromium-third_party-boringssl-Demand-for-newer-POSI.patch
index 4e09f6e..87d21db 100644
--- a/recipes-qt/qt5/qtwebengine/0002-chromium-third_party-boringssl-Demand-for-newer-POSI.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-chromium-third_party-boringssl-Demand-for-newer-POSI.patch
@@ -1,7 +1,8 @@
-From 75e9a963561a73ef2a449d7915cd8b41285ac862 Mon Sep 17 00:00:00 2001
+From 1efcdf981e6f4cc4e2b5e5dfe407030dc1e43e65 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 27 Jun 2015 13:29:52 -0700
-Subject: [PATCH] chromium/third_party/boringssl: Demand for newer POSIX macro
+Subject: [PATCH 2/2] chromium/third_party/boringssl: Demand for newer POSIX
+ macro
 
 Reason for change: Define _POSIX_C_SOURCE such that it demands correct
 posix interfaces, netdb.h declares interfaces such as
@@ -33,5 +34,5 @@ index ba65a1a..66c3976 100644
  #include <openssl/bio.h>
  #include <openssl/err.h>
 -- 
-2.5.0
+2.5.3
 
diff --git a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
index 9df1c04..1448197 100644
--- a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
@@ -1,7 +1,7 @@
-From 4b5d3c736714b2712d7f3a77ea5a8a76fea0fc1f Mon Sep 17 00:00:00 2001
+From 3cdf1ffa138026a601df8e8ddff5ac0723edb0b7 Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Tue, 18 Nov 2014 10:38:18 +0100
-Subject: [PATCH 2/3] functions.prf: Make sure we only use the file name to
+Subject: [PATCH 2/4] functions.prf: Make sure we only use the file name to
  generate it's moc'ed abbreviation
 
 Signed-off-by: Simon Busch <morphis@gravedo.de>
@@ -11,7 +11,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 98cff24..aec54ea 100644
+index 5689ce0..e71e6e4 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
 @@ -95,7 +95,8 @@ defineReplace(findIncludedMocFiles) {
@@ -25,5 +25,5 @@ index 98cff24..aec54ea 100644
    for(ext, $$list($${QMAKE_EXT_CPP})): \
        out = $$replace(out, ^(.*)($$re_escape($${ext}))$, $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
 -- 
-2.4.2
+2.5.3
 
diff --git a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
index a533eea..bfde82e 100644
--- a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
@@ -1,7 +1,7 @@
-From 399990aa9b68437be7f3d6fa16556bf091645c34 Mon Sep 17 00:00:00 2001
+From b7b5fa151e1ff1749ab5b04763f0f64a156e6e48 Mon Sep 17 00:00:00 2001
 From: Frieder Schrempf <frieder.schrempf@online.de>
 Date: Mon, 1 Dec 2014 14:34:40 +0000
-Subject: [PATCH 3/3] functions.prf: allow build for linux-oe-g++ platform
+Subject: [PATCH 3/4] functions.prf: allow build for linux-oe-g++ platform
 
 Upstream-Status: Inappropriate [OE specific]
 
@@ -12,18 +12,18 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index aec54ea..6a4b01f 100644
+index e71e6e4..2161505 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
 @@ -14,7 +14,7 @@ defineTest(isPlatformSupported) {
  
    linux-g++*:!isGCCVersionSupported(): return(false)
    !isPythonVersionSupported(): return(false)
--  linux-g++*|win32-msvc2013|macx-clang: return(true)
-+  linux-g++*|linux-oe-g++*|win32-msvc2013|macx-clang: return(true)
+-  linux-g++*|win32-msvc2013|macx-clang*: return(true)
++  linux-g++*|linux-oe-g++*|win32-msvc2013|macx-clang*: return(true)
    boot2qt: return(true)
  
    skipBuild("Qt WebEngine can currently only be built for Linux (GCC), Windows (MSVC 2013), OS X (XCode 5.1+) or Qt for Device Creation.")
 -- 
-2.4.2
+2.5.3
 
diff --git a/recipes-qt/qt5/qtwebengine/0004-Generate-usable-qmake_extras.gypi.patch b/recipes-qt/qt5/qtwebengine/0004-Generate-usable-qmake_extras.gypi.patch
index 89f56e0..55dc557 100644
--- a/recipes-qt/qt5/qtwebengine/0004-Generate-usable-qmake_extras.gypi.patch
+++ b/recipes-qt/qt5/qtwebengine/0004-Generate-usable-qmake_extras.gypi.patch
@@ -1,7 +1,7 @@
-From 9d2fafdd9a15adf51d8383bdd545d73e76ad0428 Mon Sep 17 00:00:00 2001
+From 55c5a15f0a11c76a930020ac725e57303da2ef48 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@theqtcompany.com>
 Date: Mon, 11 May 2015 13:47:06 +0300
-Subject: [PATCH] Generate usable qmake_extras.gypi
+Subject: [PATCH 4/4] Generate usable qmake_extras.gypi
 
 Running qmake recursively does not take .depends into account, so
 the SUBDIRS need to be in correct order so that qmake_extras.gypi
@@ -39,7 +39,7 @@ index cf00f39..747b711 100644
 +SUBDIRS += gyp_run \
 +           core_module
 diff --git a/src/core/gyp_configure_host.pro b/src/core/gyp_configure_host.pro
-index 3eb6738..d6820c4 100644
+index eb94cb8..859bcbf 100644
 --- a/src/core/gyp_configure_host.pro
 +++ b/src/core/gyp_configure_host.pro
 @@ -6,9 +6,6 @@ option(host_build)
@@ -50,10 +50,10 @@ index 3eb6738..d6820c4 100644
 -                "    ['CXX.host', '$$which($$QMAKE_CXX)']," \
 -                "    ['LD.host', '$$which($$QMAKE_LINK)'],"
  
- GYPI_FILE = $$absolute_path('qmake_extras.gypi')
+ GYPI_FILE = $$OUT_PWD/qmake_extras.gypi
  !build_pass {
 diff --git a/src/core/gyp_configure_target.pro b/src/core/gyp_configure_target.pro
-index 4d52044..f02bfa0 100644
+index 2a59966..317d24a 100644
 --- a/src/core/gyp_configure_target.pro
 +++ b/src/core/gyp_configure_target.pro
 @@ -3,9 +3,6 @@ TEMPLATE = aux
@@ -67,5 +67,5 @@ index 4d52044..f02bfa0 100644
                   "  'target_defaults': {" \
                   "    'target_conditions': [" \
 -- 
-1.9.1
+2.5.3
 
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 09a49db..40dca0c 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -4,7 +4,9 @@ LICENSE = "LGPL-3.0 & BSD"
 LIC_FILES_CHKSUM = " \
     file://src/core/browser_context_qt.cpp;md5=5fe719c44250955a5d5f8fb15fc8b1da;beginline=1;endline=35 \
     file://src/3rdparty/chromium/LICENSE;md5=537e0b52077bf0a616d0a0c8a79bc9d5 \
-    file://LICENSE.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
+    file://LICENSE.LGPLv3;md5=3dcffeed712d3c916f9a2d9135703aff \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
+    file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
 "
 
 DEPENDS += " \
@@ -83,8 +85,8 @@ SRC_URI += " \
     file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch \
     file://0002-chromium-third_party-boringssl-Demand-for-newer-POSI.patch \
 "
-SRCREV_qtwebengine = "c6573119006014ff7bc0efb2da16ea35d302a1ec"
-SRCREV_chromium = "41a1a031cd69e187a9608359ffe56652dcaaa6c5"
+SRCREV_qtwebengine = "ccb373c4937777ce4af10918f7412c606cbd56ce"
+SRCREV_chromium = "305284960db83fe9b9ae47674db9914d82180c23"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine"
diff --git a/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch b/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch
index 05b8f29..caf8a38 100644
--- a/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch
+++ b/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch
@@ -1,4 +1,4 @@
-From a3c5765b9ef6e45db847c79ed333ed5e124dbecb Mon Sep 17 00:00:00 2001
+From 9097d1fe3b21df880ec799414aeab78e62f032d2 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Tue, 8 Oct 2013 00:18:10 -0400
 Subject: [PATCH] qtwebkit-examples: enable building examples by default
@@ -25,5 +25,5 @@ index 3fcecf1..2da8a36 100644
 -SUBDIRS += doc
 +SUBDIRS += doc examples
 -- 
-2.4.2
+2.5.3
 
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index 20202d5..3e89d80 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -7,7 +7,8 @@ LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://examples/webkitwidgets/scroller/wheel/main.cpp;endline=39;md5=b0739af76072fbe303dc04b6941e054f \
     file://examples/webkitwidgets/imageanalyzer/imageanalyzer.cpp;endline=39;md5=b0739af76072fbe303dc04b6941e054f \
 "
@@ -20,4 +21,4 @@ DEPENDS += "qtwebkit qtxmlpatterns"
 RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
 RDEPENDS_${PN}-examples += "${@base_contains('PACKAGECONFIG_OPENSSL', 'openssl', 'ca-certificates', '', d)}"
 
-SRCREV = "b7c95dc2ada1171f06183ce8608990732791aa3f"
+SRCREV = "df729f9f284df2d30db432de351e7e80360097c8"
diff --git a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
index 9163468..17f9ee4 100644
--- a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
+++ b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
@@ -1,7 +1,7 @@
-From 6b1704fcbe24d78c546a45c882db817634192058 Mon Sep 17 00:00:00 2001
+From d765da41bafa8349d4c64a74a841ebe3b2fb9443 Mon Sep 17 00:00:00 2001
 From: Trevor Woerner <trevor.woerner@linaro.org>
 Date: Fri, 7 Feb 2014 04:07:17 +0100
-Subject: [PATCH 1/2] qtwebkit: fix QA issue (bad RPATH)
+Subject: [PATCH 1/3] qtwebkit: fix QA issue (bad RPATH)
 
 Building qtwebkit causes a QA issue such that QtWebPluginProcess and
 QtWebProcess contain bad RPATHs which point into the build location. This fix
@@ -26,5 +26,5 @@ index fd66af6..ef754c3 100644
  CONFIG(debug, debug|release)|force_debug_info {
      # Make ld not cache the symbol tables of input files in memory to avoid memory exhaustion during the linking phase.
 -- 
-2.4.2
+2.5.3
 
diff --git a/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch b/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
index 34aedbd..39cfc62 100644
--- a/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
+++ b/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
@@ -1,7 +1,7 @@
-From 8239c912d045d04d4944650dde397473a8eb4462 Mon Sep 17 00:00:00 2001
+From 05e0ba998775d92bd3c0701cd5e290815700e3f4 Mon Sep 17 00:00:00 2001
 From: Magnus Granberg <zorry@gentoo.org>
 Date: Fri, 27 Feb 2015 11:55:09 +0100
-Subject: [PATCH 2/2] Remove TEXTREL tag in x86
+Subject: [PATCH 2/3] Remove TEXTREL tag in x86
 
 Fix textrel QA warnings when building qtwebkit for x86:
 
@@ -75,5 +75,5 @@ index 0a2fe78..2dc40ef 100644
  #define GLOBAL_REFERENCE(name) SYMBOL_STRING(name)
  #endif
 -- 
-2.4.2
+2.5.3
 
diff --git a/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch b/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
index 6a9d1f4..819cc27 100644
--- a/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
+++ b/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
@@ -1,7 +1,7 @@
-From b345a3414a7d09b47586aac437d79e2bbfa52fb8 Mon Sep 17 00:00:00 2001
+From c9ed11eff6f200ea42ae64372186d560880591bc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 5 Jun 2015 19:55:05 -0700
-Subject: [PATCH] Exclude backtrace() API for non-glibc libraries
+Subject: [PATCH 3/3] Exclude backtrace() API for non-glibc libraries
 
 It was excluding musl with current checks, so lets make it such that it
 considers only glibc when using backtrace API
@@ -34,5 +34,5 @@ index 1b2091f..ba03a28 100644
  #elif OS(WINDOWS) && !OS(WINCE)
      // The CaptureStackBackTrace function is available in XP, but it is not defined
 -- 
-2.1.4
+2.5.3
 
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index d80ab7f..b0d1e4e 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -64,4 +64,4 @@ PACKAGES_remove = "${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-db
 RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i386').replace('i686', 'i386') }"
 export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
 
-SRCREV = "3f0fbb46e2e4e3d0d9ac9f0731b3f8435a504b4b"
+SRCREV = "0d592678bad23a77f35c109253a0263664e69812"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 73f95a3..11ce7f4 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -4,10 +4,11 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LGPL_EXCEPTION.txt;md5=bb426f3367c4805d1e12fad05bd0b750 \
 "
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "158ec0ca22f8f6713eb80f737eb8d0ef84f515ac"
+SRCREV = "12e424f241b29ef26ad2a3a70740d8b320e9e85a"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index 70480df..5af0ac5 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -4,7 +4,8 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
     file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
@@ -12,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "f2da28b77cf3256d98e00ff7435938ebee44cb01"
+SRCREV = "e4f2f0a146a83fa3160687ca06e11430ff02c5a8"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index f6a0c41..2581af0 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -5,13 +5,14 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
 DEPENDS += "qtbase"
 
-SRCREV = "ae6504efc85adf754d60a02f81413e5949282d78"
+SRCREV = "670b2073c0b1c40f5b67fc36c18ed15fe2cdfee2"
 
 BBCLASSEXTEND =+ "native nativesdk"
-- 
2.5.3


