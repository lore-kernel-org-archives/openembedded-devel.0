Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 258057716A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 11:03:52 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id a4so65456354wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 03:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Z6/ZhoWQgh8I/gj5t0cHoPBK5sinpAP7PtLs3c6MUbE=;
	b=KNlfmz9oBOOkBsFN6+4EIIlIvNVuHyNyAMdEXU5lPFH1gOr0qXG68ysxP+KhgzIr5C
	P37dlgKPG462HXQMb4sud6l1YI/l5WMAMlxkKTzEDaLSuyT44HlpkL/dQkInkxKAnKMR
	4OYgmp218DcnDCJJh6ppnJmXnv7IaFsrJsG/E9n9yJKD+bgGcwQ2GgO7+kbLKhyFx8Km
	uPBV9dfc6x55wDfAgqDn0PXS/riTpCVQ26afwbQ8wYD1mlBjJLkTfe5FPrIwknzM9dvI
	CmBxTQX/245LsT6r3LjT5I/86UNspoLb8SB5cxWt1G+lQ8o7veCeZKpjNxYQKbSDv76h
	RLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Z6/ZhoWQgh8I/gj5t0cHoPBK5sinpAP7PtLs3c6MUbE=;
	b=K2fDsXQv4ucRZCPiS6CJWZztFekSaEVsTyP/0ZIgRbpm97g2xGj1w8BLFVkP2Xsu+9
	raDIbSy46X342z47oSTBJ9bjr6+Y2HD1T1DcTL/ECGcJxCp/uXiK2ZU2yO3OluM4wb1O
	tOF54OIYiPTwN4klfA/J+jXzsunnRpUnWsuC0hSih5idVA5j0k1HazoTPUUcwC4Our/5
	uE+2y5oi5v1i7zFkP6OJrYWOnQsHQ7b3XKXHW+37aAXLDkcqePPfpCPzCTg27MyNQDmE
	ZtZMRtP0kA+a64dtlgWfHzA3BwR4zuCrPxMXisoJV69kp0rmtgHym3Xopk2149cNNuHq
	Cv5Q==
X-Gm-Message-State: AG10YORqDkq1Ucc4p7krrA/8bsqd2zh9tOKqcx4wIYPNi+RssoaEdIvtUvkmPAouUEcMvw==
X-Received: by 10.28.9.67 with SMTP id 64mr8683008wmj.10.1455879833066;
	Fri, 19 Feb 2016 03:03:53 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	cb2sm10750707wjc.16.2016.02.19.03.03.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Feb 2016 03:03:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Feb 2016 12:04:17 +0100
Message-Id: <1455879859-3401-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455879859-3401-1-git-send-email-Martin.Jansa@gmail.com>
References: <1455879859-3401-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][WIP-for-5.7][meta-qt5 2/4] qt5: upgrade to latest revisions in 5.7 branches
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
X-List-Received-Date: Fri, 19 Feb 2016 11:03:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |  2 +-
 recipes-qt/qt5/qt5-git.inc                         |  6 +-
 recipes-qt/qt5/qtbase-native_git.bb                |  2 +-
 .../qt5/qtbase/0001-Add-linux-oe-g-platform.patch  | 63 +++++++--------------
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  6 +-
 .../0003-Add-external-hostbindir-option.patch      | 64 +++++++++++-----------
 ...le-Fix-pkgconfig-and-libtool-replacements.patch |  6 +-
 ...ump-path-length-from-256-to-512-character.patch |  6 +-
 .../0006-QOpenGLPaintDevice-sub-area-support.patch | 34 ++++++------
 ...Invert-conditional-for-defining-QT_SOCKLE.patch |  2 +-
 ...configure-paths-for-target-qmake-properly.patch | 12 ++--
 recipes-qt/qt5/qtbase/0009-Always-build-uic.patch  |  2 +-
 ...external-hostbindir-option-for-native-sdk.patch | 28 +++++-----
 recipes-qt/qt5/qtbase_git.bb                       |  2 +-
 recipes-qt/qt5/qtcanvas3d_git.bb                   |  2 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |  2 +-
 .../0001-qmltestexample-fix-link.patch             | 31 +++--------
 recipes-qt/qt5/qtdeclarative_git.bb                |  2 +-
 recipes-qt/qt5/qtenginio_git.bb                    |  2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |  2 +-
 ...ats.pro-Make-the-dependencies-determinist.patch |  2 +-
 recipes-qt/qt5/qtimageformats_git.bb               |  2 +-
 recipes-qt/qt5/qtlocation_git.bb                   |  2 +-
 ...1-Initial-porting-effort-to-GStreamer-1.0.patch |  2 +-
 recipes-qt/qt5/qtmultimedia_git.bb                 |  2 +-
 recipes-qt/qt5/qtquick1_git.bb                     |  2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |  2 +-
 recipes-qt/qt5/qtscript_git.bb                     |  2 +-
 recipes-qt/qt5/qtsensors_git.bb                    |  2 +-
 recipes-qt/qt5/qtserialport_git.bb                 |  2 +-
 ...pro-use-DEPLOYMENT-only-for-wince-like-ot.patch |  2 +-
 recipes-qt/qt5/qtsvg_git.bb                        |  2 +-
 recipes-qt/qt5/qtsystems_git.bb                    |  5 --
 ...w-to-build-only-lrelease-lupdate-lconvert.patch |  2 +-
 ...t-help-fix-linking-of-dependent-libraries.patch |  2 +-
 .../0003-add-noqtwebkit-configuration.patch        |  2 +-
 ...ols-cmake-allow-overriding-the-location-f.patch |  2 +-
 recipes-qt/qt5/qttools_git.bb                      |  2 +-
 recipes-qt/qt5/qttranslations_git.bb               |  2 +-
 recipes-qt/qt5/qtwayland-native_git.bb             |  2 +-
 ...-qtwaylandscanner-tool-to-the-native-side.patch |  2 +-
 ...yland-include-server-buffer-only-when-bui.patch | 19 +++----
 recipes-qt/qt5/qtwayland_git.bb                    |  2 +-
 recipes-qt/qt5/qtwebchannel_git.bb                 |  2 +-
 ...se.gypi-include-atomicops_internals_x86_g.patch |  6 +-
 ...rf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch |  2 +-
 ...ange-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch |  2 +-
 ...rf-Make-sure-we-only-use-the-file-name-to.patch |  2 +-
 ...s.prf-allow-build-for-linux-oe-g-platform.patch |  2 +-
 ...quickwebengineview_p_p.h-add-include-QCol.patch |  6 +-
 ...-dependency-to-QCoreApplication-translate.patch |  6 +-
 recipes-qt/qt5/qtwebengine_git.bb                  |  6 +-
 recipes-qt/qt5/qtwebkit-examples_git.bb            |  2 +-
 recipes-qt/qt5/qtwebkit_git.bb                     |  2 +-
 recipes-qt/qt5/qtwebsockets_git.bb                 |  2 +-
 recipes-qt/qt5/qtx11extras_git.bb                  |  2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |  2 +-
 57 files changed, 174 insertions(+), 212 deletions(-)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 70b596d..2471d4f 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -256,4 +256,4 @@ fakeroot do_generate_qt_environment_file() {
 
 addtask generate_qt_environment_file after do_install before do_package
 
-SRCREV = "ac8a3b948da1980bc59bae3fc76d20b5b45662a0"
+SRCREV = "10742cf8949497b83b87133ed66ec119cb3ab08f"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index f6149fb..bceddf5 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -1,8 +1,8 @@
 # Copyright (C) 2012-2016 O.S. Systems Software LTDA.
-# Copyright (C) 2013-2014 Martin Jansa <martin.jansa@gmail.com>
+# Copyright (C) 2013-2016 Martin Jansa <martin.jansa@gmail.com>
 
 QT_MODULE ?= "${BPN}"
-QT_MODULE_BRANCH ?= "5.6"
+QT_MODULE_BRANCH ?= "5.7"
 
 # each module needs to define valid SRCREV
 SRC_URI = " \
@@ -11,4 +11,4 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-PV = "5.5.99+5.6.0-rc+git${SRCPV}"
+PV = "5.6.99+5.7.0-alpha+git${SRCPV}"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index bb10438..5d1a142 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -117,4 +117,4 @@ do_install() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "ac8a3b948da1980bc59bae3fc76d20b5b45662a0"
+SRCREV = "10742cf8949497b83b87133ed66ec119cb3ab08f"
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index bca154c..1b0b98b 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From f35a940471022c31dfd72aa5d1c942ce64ca5a6a Mon Sep 17 00:00:00 2001
+From d8ae63e5cf207999017b9a598c81d218a8142b23 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
 Subject: [PATCH 01/10] Add linux-oe-g++ platform
@@ -47,19 +47,19 @@ Upstream-Status: Inappropriate [embedded specific]
 Change-Id: I0591ed5da0d61d7cf1509d420e6b293582f1863c
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- configure                            |  71 ++++++++++++++++---------
+ configure                            |  55 ++++++++++++-------
  mkspecs/features/configure.prf       |   4 +-
  mkspecs/linux-oe-g++/qmake.conf      |  42 +++++++++++++++
  mkspecs/linux-oe-g++/qplatformdefs.h | 100 +++++++++++++++++++++++++++++++++++
- 4 files changed, 189 insertions(+), 28 deletions(-)
+ 4 files changed, 181 insertions(+), 20 deletions(-)
  create mode 100644 mkspecs/linux-oe-g++/qmake.conf
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
 diff --git a/configure b/configure
-index 1473a62..15207bf 100755
+index 121031e..78ed82e 100755
 --- a/configure
 +++ b/configure
-@@ -342,6 +342,16 @@ getQMakeConf()
+@@ -339,6 +339,16 @@ getQMakeConf()
      getSingleQMakeVariable "$1" "$specvals"
  }
  
@@ -76,7 +76,7 @@ index 1473a62..15207bf 100755
  getXQMakeConf()
  {
      if [ -z "$xspecvals" ]; then
-@@ -351,6 +361,16 @@ getXQMakeConf()
+@@ -348,6 +358,16 @@ getXQMakeConf()
      getSingleQMakeVariable "$1" "$xspecvals"
  }
  
@@ -93,7 +93,7 @@ index 1473a62..15207bf 100755
  compilerSupportsFlag()
  {
      cat >conftest.cpp <<EOF
-@@ -557,24 +577,14 @@ fi
+@@ -569,24 +589,14 @@ fi
  # initalize variables
  #-------------------------------------------------------------------------------
  
@@ -124,8 +124,8 @@ index 1473a62..15207bf 100755
  fi'`
      eval "$cmd"
  done
-@@ -3418,7 +3428,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
-     [ "$CFG_QGTKSTYLE" = "auto" ] && CFG_QGTKSTYLE=no
+@@ -3436,7 +3446,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
+     [ "$CFG_GTK" = "auto" ] && CFG_GTK=no
  fi
  
 -QMAKE_CONF_COMPILER=`getXQMakeConf QMAKE_CXX`
@@ -133,7 +133,7 @@ index 1473a62..15207bf 100755
  
  TEST_COMPILER=$QMAKE_CONF_COMPILER
  
-@@ -3475,7 +3485,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
+@@ -3493,7 +3503,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
          exit 1
      fi
  fi
@@ -142,7 +142,7 @@ index 1473a62..15207bf 100755
  
  GCC_MACHINE_DUMP=
  case "$TEST_COMPILER" in *g++) GCC_MACHINE_DUMP=$($TEST_COMPILER -dumpmachine);; esac
-@@ -3976,6 +3986,14 @@ setBootstrapVariable()
+@@ -3993,6 +4003,14 @@ setBootstrapVariable()
      getQMakeConf "$1" | echo ${2-$1} = `if [ -n "$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
  }
  
@@ -157,42 +157,19 @@ index 1473a62..15207bf 100755
  # build qmake
  if true; then ###[ '!' -f "$outpath/bin/qmake" ];
      echo "Creating qmake..."
-@@ -4014,14 +4032,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
-         fi
- 
-         [ "$CFG_SILENT" = "yes" ] && CC_TRANSFORM='s,^,\@,' || CC_TRANSFORM=
--        setBootstrapVariable QMAKE_CC CC "$CC_TRANSFORM"
--        setBootstrapVariable QMAKE_CXX CXX "$CC_TRANSFORM"
--        setBootstrapVariable QMAKE_CFLAGS
--        setBootstrapVariable QMAKE_CFLAGS_SPLIT_SECTIONS
--        setBootstrapVariable QMAKE_CXXFLAGS
--        setBootstrapVariable QMAKE_CXXFLAGS_SPLIT_SECTIONS
--        setBootstrapVariable QMAKE_LFLAGS
--        setBootstrapVariable QMAKE_LFLAGS_GCSECTIONS
-+        setBootstrapEvalVariable QMAKE_CC CC "$CC_TRANSFORM"
-+        setBootstrapEvalVariable QMAKE_CXX CXX "$CC_TRANSFORM"
-+        setBootstrapEvalVariable QMAKE_CFLAGS
-+        setBootstrapEvalVariable QMAKE_CFLAGS_SPLIT_SECTIONS
-+        setBootstrapEvalVariable QMAKE_CXXFLAGS
-+        setBootstrapEvalVariable QMAKE_CXXFLAGS_SPLIT_SECTIONS
-+        setBootstrapEvalVariable QMAKE_LFLAGS
-+        setBootstrapEvalVariable QMAKE_LFLAGS_GCSECTIONS
- 
-         if [ "$CFG_RELEASE_TOOLS" = "yes" ]; then
-             setBootstrapVariable QMAKE_CFLAGS_RELEASE
-@@ -4070,6 +4088,7 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
-                         \"\$(SOURCE_PATH)/src/corelib/io/qfsfileengine_unix.cpp\" \
-                         \"\$(SOURCE_PATH)/src/corelib/tools/qlocale_unix.cpp\""
+@@ -4092,6 +4110,7 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
              EXEEXT=
-+            [ "$QT_CROSS_COMPILE" = "yes" ] && EXEEXT=-target
-         fi
+             ;;
+         esac
++        [ "$QT_CROSS_COMPILE" = "yes" ] && EXEEXT=-target
          if [ "$BUILD_ON_MAC" = "yes" ]; then
              echo "COCOA_LFLAGS =-framework Foundation -framework CoreServices" >>"$mkfile"
+             echo "CARBON_LFLAGS =-framework ApplicationServices" >>"$mkfile"
 diff --git a/mkspecs/features/configure.prf b/mkspecs/features/configure.prf
-index 6b37a04..dcf6025 100644
+index 92c288c..f3019e0 100644
 --- a/mkspecs/features/configure.prf
 +++ b/mkspecs/features/configure.prf
-@@ -63,12 +63,12 @@ defineTest(qtCompileTest) {
+@@ -63,14 +63,14 @@ defineTest(qtCompileTest) {
      }
  
      # Clean up after previous run
@@ -201,7 +178,9 @@ index 6b37a04..dcf6025 100644
  
      mkpath($$test_out_dir)|error("Aborting.")
  
-     qtRunLoggedCommand("$$test_cmd_base $$system_quote($$system_path($$QMAKE_QMAKE)) -spec $$QMAKESPEC $$qmake_configs $$shell_quote($$test_dir)") {
+     !isEmpty (QMAKE_QTCONF): qtconfarg = -qtconf $$QMAKE_QTCONF
+ 
+     qtRunLoggedCommand("$$test_cmd_base $$system_quote($$system_path($$QMAKE_QMAKE)) $$qtconfarg -spec $$QMAKESPEC $$qmake_configs $$shell_quote($$test_dir)") {
 -        qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE") {
 +        qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE $$(QMAKE_MAKE_ARGS)") {
              log("yes$$escape_expand(\\n)")
diff --git a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index dcd59ab..612b6dc 100644
--- a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,4 +1,4 @@
-From 2fbde67aa4184e31ccbfae95e884b89567883904 Mon Sep 17 00:00:00 2001
+From 105f60c086bc85d4011758cd55bb2e70b3633e87 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
 Subject: [PATCH 02/10] qlibraryinfo: allow to set qt.conf from the outside
@@ -19,10 +19,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 8bcacca..e1c87b5 100644
+index c962f1b..893917e 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -157,7 +157,10 @@ void QLibrarySettings::load()
+@@ -163,7 +163,10 @@ void QLibrarySettings::load()
  
  QSettings *QLibraryInfoPrivate::findConfiguration()
  {
diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
index 0cb8363..a734d41 100644
--- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
@@ -1,4 +1,4 @@
-From b28148fd6ee59d584e59a07736da63ee9ea5c1ad Mon Sep 17 00:00:00 2001
+From 10cb93fc8312dcbe0a7f82010077a39a60039233 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH 03/10] Add -external-hostbindir option
@@ -26,21 +26,23 @@ Signed-off-by: Jonathan Liu <net147@gmail.com>
 
 Conflicts:
         configure
+
+Change-Id: Iacaa1c5531cd6dcc094891610c351673db55d7b2
 ---
  configure                                   | 14 ++++++++++++++
  mkspecs/features/qt_functions.prf           |  6 +++++-
- mkspecs/features/qt_tool.prf                |  5 +++--
- qtbase.pro                                  | 13 ++++++++++---
+ mkspecs/features/qt_tool.prf                |  4 +++-
+ qtbase.pro                                  | 16 ++++++++++++++++
  src/corelib/Qt5CoreConfigExtras.cmake.in    |  6 +++---
  src/dbus/Qt5DBusConfigExtras.cmake.in       |  4 ++--
  src/widgets/Qt5WidgetsConfigExtras.cmake.in |  2 +-
- 7 files changed, 38 insertions(+), 12 deletions(-)
+ 7 files changed, 44 insertions(+), 8 deletions(-)
 
 diff --git a/configure b/configure
-index 15207bf..8fafeca 100755
+index 78ed82e..a065ade 100755
 --- a/configure
 +++ b/configure
-@@ -810,6 +810,7 @@ QT_HOST_BINS=
+@@ -822,6 +822,7 @@ QT_HOST_BINS=
  QT_HOST_LIBS=
  QT_HOST_DATA=
  QT_EXT_PREFIX=
@@ -48,7 +50,7 @@ index 15207bf..8fafeca 100755
  
  #flags for SQL drivers
  QT_CFLAGS_PSQL=
-@@ -929,6 +930,7 @@ while [ "$#" -gt 0 ]; do
+@@ -941,6 +942,7 @@ while [ "$#" -gt 0 ]; do
      -testsdir| \
      -hostdatadir| \
      -hostbindir| \
@@ -56,7 +58,7 @@ index 15207bf..8fafeca 100755
      -hostlibdir| \
      -extprefix| \
      -sysroot| \
-@@ -1159,6 +1161,9 @@ while [ "$#" -gt 0 ]; do
+@@ -1173,6 +1175,9 @@ while [ "$#" -gt 0 ]; do
      extprefix)
          QT_EXT_PREFIX="$VAL"
          ;;
@@ -66,7 +68,7 @@ index 15207bf..8fafeca 100755
      pkg-config)
          if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
              CFG_PKGCONFIG="$VAL"
-@@ -2428,6 +2433,10 @@ Installation options:
+@@ -2435,6 +2440,10 @@ Installation options:
      -hostdatadir <dir> . Data used by qmake will be installed to <dir>
                           (default HOSTPREFIX)
  
@@ -77,7 +79,7 @@ index 15207bf..8fafeca 100755
  Configure options:
  
   The defaults (*) are usually acceptable. A plus (+) denotes a default value
-@@ -3172,6 +3181,11 @@ fi
+@@ -3190,6 +3199,11 @@ fi
  # command line and environment validation
  #-------------------------------------------------------------------------------
  
@@ -90,10 +92,10 @@ index 15207bf..8fafeca 100755
  CFG_QCONFIG_PATH=$relpath/src/corelib/global/qconfig-${CFG_QCONFIG}.h
  case "$CFG_QCONFIG" in
 diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
-index b2c2507..fba4a58 100644
+index 88467e8..158652d 100644
 --- a/mkspecs/features/qt_functions.prf
 +++ b/mkspecs/features/qt_functions.prf
-@@ -57,7 +57,11 @@ defineTest(qtHaveModule) {
+@@ -67,7 +67,11 @@ defineTest(qtHaveModule) {
  defineTest(qtPrepareTool) {
      cmd = $$eval(QT_TOOL.$${2}.binary)
      isEmpty(cmd) {
@@ -107,10 +109,10 @@ index b2c2507..fba4a58 100644
              cmd = perl -w $$system_path($${cmd}.pl)
          } else: contains(QMAKE_HOST.os, Windows) {
 diff --git a/mkspecs/features/qt_tool.prf b/mkspecs/features/qt_tool.prf
-index 839c3d6..45934a0 100644
+index bdeb59c..5b84e1e 100644
 --- a/mkspecs/features/qt_tool.prf
 +++ b/mkspecs/features/qt_tool.prf
-@@ -14,10 +14,11 @@ load(qt_app)
+@@ -14,10 +14,12 @@ load(qt_app)
  CONFIG += console
  DEFINES *= QT_USE_QSTRINGBUILDER
  
@@ -118,37 +120,37 @@ index 839c3d6..45934a0 100644
 +
  # If we are doing a prefix build, create a "module" pri which enables
  # qtPrepareTool() to work with the non-installed build.
--# Non-bootstrapped tools always need this because of the environment setup.
--!build_pass:if(!host_build|!force_bootstrap|force_independent) {
-+!build_pass:if(!host_build|!force_bootstrap|force_independent):isEmpty(QT_EXTERNAL_HOST_BINS) {
+ # Non-bootstrapped tools always need this because of the environment setup.
+-!build_pass:if(!host_build|!force_bootstrap|force_independent|!isEmpty(HOST_QT_TOOLS)) {
++!build_pass:if(!host_build|!force_bootstrap|force_independent|!isEmpty(HOST_QT_TOOLS)|!isEmpty(QT_EXTERNAL_HOST_BINS)) {
      isEmpty(MODULE):MODULE = $$TARGET
  
-     !host_build|!force_bootstrap: MODULE_DEPENDS = $$replace(QT, -private$, _private)
+     load(qt_build_paths)
 diff --git a/qtbase.pro b/qtbase.pro
-index 98ca86a..0eed475 100644
+index 663ff87..590741a 100644
 --- a/qtbase.pro
 +++ b/qtbase.pro
-@@ -37,12 +37,16 @@ CONFIG -= qt
+@@ -37,6 +37,19 @@ CONFIG -= qt
  
  ### installations ####
  
 +QT_EXTERNAL_HOST_BINS = $$[QT_EXTERNAL_HOST_BINS]
 +
- #qmake
- qmake.path = $$[QT_HOST_BINS]
++#qmake
++qmake.path = $$[QT_HOST_BINS]
 +qmake.files = $$OUT_PWD/bin/qmake
 +!isEmpty(QT_EXTERNAL_HOST_BINS) {
 +   qmake.files = $$[QT_EXTERNAL_HOST_BINS]/qmake
 +}
- equals(QMAKE_HOST.os, Windows) {
--   qmake.files = $$OUT_PWD/bin/qmake.exe
--} else {
--   qmake.files = $$OUT_PWD/bin/qmake
++equals(QMAKE_HOST.os, Windows) {
 +   qmake.files = $${qmake.files}.exe
- }
- INSTALLS += qmake
- 
-@@ -59,6 +63,9 @@ INSTALLS += fixqt4headers
++}
++INSTALLS += qmake
++
+ #licheck
+ licheck.path = $$[QT_HOST_BINS]
+ licheck.files = $$PWD/bin/$$QT_LICHECK
+@@ -50,6 +63,9 @@ INSTALLS += fixqt4headers
  #syncqt
  syncqt.path = $$[QT_HOST_BINS]
  syncqt.files = $$PWD/bin/syncqt.pl
@@ -159,7 +161,7 @@ index 98ca86a..0eed475 100644
  
  # If we are doing a prefix build, create a "module" pri which enables
 diff --git a/src/corelib/Qt5CoreConfigExtras.cmake.in b/src/corelib/Qt5CoreConfigExtras.cmake.in
-index 91a4eb6..25df27c 100644
+index a5ed8b2..0e11a1e 100644
 --- a/src/corelib/Qt5CoreConfigExtras.cmake.in
 +++ b/src/corelib/Qt5CoreConfigExtras.cmake.in
 @@ -5,7 +5,7 @@ if (NOT TARGET Qt5::qmake)
diff --git a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
index 188ac4d..1ee1938 100644
--- a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -1,4 +1,4 @@
-From f1f05d7b671b973903d9c0d411207bcc82a9a9d8 Mon Sep 17 00:00:00 2001
+From 5f32bb91f55bfa606d79b3dfd6c4b825b99c89a3 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
 Subject: [PATCH 04/10] qt_module: Fix pkgconfig and libtool replacements
@@ -67,7 +67,7 @@ Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
  2 files changed, 17 insertions(+), 1 deletion(-)
 
 diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_common.prf
-index 38602f6..f9c401f 100644
+index 0730084..333bb97 100644
 --- a/mkspecs/features/qt_common.prf
 +++ b/mkspecs/features/qt_common.prf
 @@ -38,7 +38,7 @@ contains(TEMPLATE, .*lib) {
@@ -80,7 +80,7 @@ index 38602f6..f9c401f 100644
      lib_replace.CONFIG = path
      QMAKE_PRL_INSTALL_REPLACE += lib_replace
 diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_module.prf
-index e543ea6..4a76851 100644
+index e543ea6..5da38b1 100644
 --- a/mkspecs/features/qt_module.prf
 +++ b/mkspecs/features/qt_module.prf
 @@ -273,6 +273,22 @@ load(qt_targets)
diff --git a/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
index c93c6f5..a65b755 100644
--- a/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,4 +1,4 @@
-From 8bc8e96a6ad707c5f399c307e519444a1fafc4fe Mon Sep 17 00:00:00 2001
+From 5deaf7735646a52a60d3a0b983e5fcab1de792c6 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Tue, 25 Aug 2015 10:05:15 -0400
 Subject: [PATCH 05/10] configure: bump path length from 256 to 512 characters
@@ -14,10 +14,10 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure b/configure
-index 8fafeca..34c7b8b 100755
+index a065ade..47c3d7c 100755
 --- a/configure
 +++ b/configure
-@@ -3930,10 +3930,10 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
+@@ -3947,10 +3947,10 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
  static const char qt_configure_installation          [12+11]    = "qt_instdate=2012-12-20";
  
  /* Installation Info */
diff --git a/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch
index bd5cfac..5a1b4fe 100644
--- a/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch
+++ b/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch
@@ -1,4 +1,4 @@
-From a2a195bc2782ccf582afb00ffc25021abd2ba810 Mon Sep 17 00:00:00 2001
+From d5f9a899813bc548eee9e5d38c06f173868348cb Mon Sep 17 00:00:00 2001
 From: Jani Hautakangas <jani.hautakangas@ixonos.com>
 Date: Thu, 16 May 2013 09:52:07 +0300
 Subject: [PATCH 06/10] QOpenGLPaintDevice sub-area support
@@ -21,10 +21,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  6 files changed, 23 insertions(+), 3 deletions(-)
 
 diff --git a/src/gui/opengl/qopenglpaintdevice.cpp b/src/gui/opengl/qopenglpaintdevice.cpp
-index 17a3277..85425da 100644
+index 75f09d6..17d7155 100644
 --- a/src/gui/opengl/qopenglpaintdevice.cpp
 +++ b/src/gui/opengl/qopenglpaintdevice.cpp
-@@ -135,6 +135,12 @@ QOpenGLPaintDevice::QOpenGLPaintDevice(int width, int height)
+@@ -141,6 +141,12 @@ QOpenGLPaintDevice::QOpenGLPaintDevice(int width, int height)
  {
  }
  
@@ -37,7 +37,7 @@ index 17a3277..85425da 100644
  /*!
      \internal
   */
-@@ -216,6 +222,11 @@ QOpenGLContext *QOpenGLPaintDevice::context() const
+@@ -222,6 +228,11 @@ QOpenGLContext *QOpenGLPaintDevice::context() const
      return d_ptr->ctx;
  }
  
@@ -50,10 +50,10 @@ index 17a3277..85425da 100644
      Returns the pixel size of the paint device.
  
 diff --git a/src/gui/opengl/qopenglpaintdevice.h b/src/gui/opengl/qopenglpaintdevice.h
-index 804e485..88b481a 100644
+index dffa68c..66a1e3d 100644
 --- a/src/gui/opengl/qopenglpaintdevice.h
 +++ b/src/gui/opengl/qopenglpaintdevice.h
-@@ -53,12 +53,14 @@ public:
+@@ -59,12 +59,14 @@ public:
      QOpenGLPaintDevice();
      explicit QOpenGLPaintDevice(const QSize &size);
      QOpenGLPaintDevice(int width, int height);
@@ -69,10 +69,10 @@ index 804e485..88b481a 100644
      void setSize(const QSize &size);
      void setDevicePixelRatio(qreal devicePixelRatio);
 diff --git a/src/gui/opengl/qopenglpaintdevice_p.h b/src/gui/opengl/qopenglpaintdevice_p.h
-index 54ea092..f660143 100644
+index 78e6b7a..6630461 100644
 --- a/src/gui/opengl/qopenglpaintdevice_p.h
 +++ b/src/gui/opengl/qopenglpaintdevice_p.h
-@@ -65,6 +65,7 @@ public:
+@@ -71,6 +71,7 @@ public:
  
  public:
      QSize size;
@@ -81,10 +81,10 @@ index 54ea092..f660143 100644
  
      qreal dpmx;
 diff --git a/src/gui/opengl/qopenglpaintengine.cpp b/src/gui/opengl/qopenglpaintengine.cpp
-index 0b92bf4..f41e059 100644
+index d93871c..be2bee9 100644
 --- a/src/gui/opengl/qopenglpaintengine.cpp
 +++ b/src/gui/opengl/qopenglpaintengine.cpp
-@@ -2078,7 +2078,10 @@ bool QOpenGL2PaintEngineEx::begin(QPaintDevice *pdev)
+@@ -2084,7 +2084,10 @@ bool QOpenGL2PaintEngineEx::begin(QPaintDevice *pdev)
      for (int i = 0; i < QT_GL_VERTEX_ARRAY_TRACKED_COUNT; ++i)
          d->vertexAttributeArraysEnabledState[i] = false;
  
@@ -95,7 +95,7 @@ index 0b92bf4..f41e059 100644
      d->width = sz.width();
      d->height = sz.height();
      d->mode = BrushDrawingMode;
-@@ -2165,7 +2168,7 @@ void QOpenGL2PaintEngineEx::ensureActive()
+@@ -2171,7 +2174,7 @@ void QOpenGL2PaintEngineEx::ensureActive()
          d->device->ensureActiveTarget();
  
          d->transferMode(BrushDrawingMode);
@@ -104,7 +104,7 @@ index 0b92bf4..f41e059 100644
          d->needsSync = false;
          d->shaderManager->setDirty();
          d->syncGlState();
-@@ -2207,6 +2210,7 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
+@@ -2213,6 +2216,7 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
      if (bounds == QRect(0, 0, width, height)) {
          funcs.glDisable(GL_SCISSOR_TEST);
      } else {
@@ -112,7 +112,7 @@ index 0b92bf4..f41e059 100644
          funcs.glEnable(GL_SCISSOR_TEST);
          setScissor(bounds);
      }
-@@ -2215,12 +2219,13 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
+@@ -2221,12 +2225,13 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
  
  void QOpenGL2PaintEngineExPrivate::setScissor(const QRect &rect)
  {
@@ -128,10 +128,10 @@ index 0b92bf4..f41e059 100644
  
      funcs.glScissor(left, bottom, width, height);
 diff --git a/src/gui/opengl/qopenglpaintengine_p.h b/src/gui/opengl/qopenglpaintengine_p.h
-index f1ec669..6d302b8 100644
+index c9f3282..7c0616b 100644
 --- a/src/gui/opengl/qopenglpaintengine_p.h
 +++ b/src/gui/opengl/qopenglpaintengine_p.h
-@@ -264,6 +264,7 @@ public:
+@@ -270,6 +270,7 @@ public:
      QOpenGL2PaintEngineEx* q;
      QOpenGLEngineShaderManager* shaderManager;
      QOpenGLPaintDevice* device;
@@ -140,10 +140,10 @@ index f1ec669..6d302b8 100644
      QOpenGLContext *ctx;
      EngineMode mode;
 diff --git a/src/gui/opengl/qopengltextureglyphcache.cpp b/src/gui/opengl/qopengltextureglyphcache.cpp
-index c179143..fad68d5 100644
+index 8f69095..cf82ee7 100644
 --- a/src/gui/opengl/qopengltextureglyphcache.cpp
 +++ b/src/gui/opengl/qopengltextureglyphcache.cpp
-@@ -310,7 +310,7 @@ void QOpenGLTextureGlyphCache::resizeTextureData(int width, int height)
+@@ -316,7 +316,7 @@ void QOpenGLTextureGlyphCache::resizeTextureData(int width, int height)
      funcs->glBindFramebuffer(GL_FRAMEBUFFER, (GLuint)oldFbo);
  
      if (pex != 0) {
diff --git a/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch b/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
index 525396f..ea5d2e6 100644
--- a/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
+++ b/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
@@ -1,4 +1,4 @@
-From 4c68f97060427d3184589be4f25e1e366e26557c Mon Sep 17 00:00:00 2001
+From e1017cd402728c3805e04b4360f1a7a39518ea21 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 8 Jun 2015 13:59:25 -0700
 Subject: [PATCH 07/10] linux-oe-g++: Invert conditional for defining
diff --git a/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch b/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
index 204b3bf..3f8a462 100644
--- a/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
+++ b/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
@@ -1,4 +1,4 @@
-From 3e343061f8f8cb71fbb4f52e6e825495880779a2 Mon Sep 17 00:00:00 2001
+From 231cb740c5d8fcfd8b10d110e1295af4c9377935 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 13 Nov 2015 12:36:11 +0100
 Subject: [PATCH 08/10] configure paths for target qmake properly
@@ -19,10 +19,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 19 insertions(+), 4 deletions(-)
 
 diff --git a/configure b/configure
-index 34c7b8b..f9869dd 100755
+index 47c3d7c..c4b8fad 100755
 --- a/configure
 +++ b/configure
-@@ -3875,8 +3875,13 @@ if [ "$CFG_COMPILE_EXAMPLES" = "yes" ]; then
+@@ -3892,8 +3892,13 @@ if [ "$CFG_COMPILE_EXAMPLES" = "yes" ]; then
      QMAKE_CONFIG="$QMAKE_CONFIG compile_examples"
  fi
  
@@ -38,7 +38,7 @@ index 34c7b8b..f9869dd 100755
  
  QT_CONFIGURE_STR_OFF=0
  
-@@ -3909,7 +3914,11 @@ QT_CONFIGURE_STRS_ALL=$QT_CONFIGURE_STRS
+@@ -3926,7 +3931,11 @@ QT_CONFIGURE_STRS_ALL=$QT_CONFIGURE_STRS
  
  QT_CONFIGURE_STR_OFFSETS=
  QT_CONFIGURE_STRS=
@@ -51,7 +51,7 @@ index 34c7b8b..f9869dd 100755
  addConfStr "$QT_REL_HOST_BINS"
  addConfStr "$QT_REL_HOST_LIBS"
  addConfStr "$QT_REL_HOST_DATA"
-@@ -3921,6 +3930,12 @@ addConfStr "$shortspec"
+@@ -3938,6 +3947,12 @@ addConfStr "$shortspec"
  #-------------------------------------------------------------------------------
  [ -d "$outpath/src/corelib/global" ] || mkdir -p "$outpath/src/corelib/global"
  
@@ -64,7 +64,7 @@ index 34c7b8b..f9869dd 100755
  cat > "$outpath/src/corelib/global/qconfig.cpp.new" <<EOF
  /* License Info */
  static const char qt_configure_licensee_str          [256 + 12] = "qt_lcnsuser=$Licensee";
-@@ -3933,7 +3948,7 @@ static const char qt_configure_installation          [12+11]    = "qt_instdate=2
+@@ -3950,7 +3965,7 @@ static const char qt_configure_installation          [12+11]    = "qt_instdate=2
  static const char qt_configure_prefix_path_str       [512 + 12] = "qt_prfxpath=$QT_INSTALL_PREFIX";
  #ifdef QT_BUILD_QMAKE
  static const char qt_configure_ext_prefix_path_str   [512 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
diff --git a/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
index 4db32e7..7e39a93 100644
--- a/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
@@ -1,4 +1,4 @@
-From c9e825dd77c23dda786809ecb19ca1a88dccdf1b Mon Sep 17 00:00:00 2001
+From 701ba7cf444e34186d9617c920d30c32dfe48a23 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
 Subject: [PATCH 09/10] Always build uic
diff --git a/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch b/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch
index e088bba..8c6ef88 100644
--- a/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch
+++ b/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch
@@ -1,4 +1,4 @@
-From 7c548d3833e29fade57855ef82ed2abd815b7fc4 Mon Sep 17 00:00:00 2001
+From e97780e53e47c302b455db5e82d8cf608a237b2d Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH 10/10] Add -external-hostbindir option for native(sdk)
@@ -37,10 +37,10 @@ Conflicts:
  5 files changed, 16 insertions(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index f9869dd..c81d02a 100755
+index c4b8fad..f51634f 100755
 --- a/configure
 +++ b/configure
-@@ -3922,6 +3922,7 @@ fi
+@@ -3939,6 +3939,7 @@ fi
  addConfStr "$QT_REL_HOST_BINS"
  addConfStr "$QT_REL_HOST_LIBS"
  addConfStr "$QT_REL_HOST_DATA"
@@ -49,10 +49,10 @@ index f9869dd..c81d02a 100755
  addConfStr "$shortspec"
  
 diff --git a/qmake/property.cpp b/qmake/property.cpp
-index 817ae95..c69539f 100644
+index 9ee08f4..e6ecf92 100644
 --- a/qmake/property.cpp
 +++ b/qmake/property.cpp
-@@ -68,6 +68,7 @@ static const struct {
+@@ -63,6 +63,7 @@ static const struct {
      { "QT_HOST_DATA", QLibraryInfo::HostDataPath, true },
      { "QT_HOST_BINS", QLibraryInfo::HostBinariesPath, true },
      { "QT_HOST_LIBS", QLibraryInfo::HostLibrariesPath, true },
@@ -61,10 +61,10 @@ index 817ae95..c69539f 100644
      { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
  };
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index e1c87b5..d6e03ba 100644
+index 893917e..2da8334 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -373,7 +373,7 @@ QLibraryInfo::isDebugBuild()
+@@ -379,7 +379,7 @@ QLibraryInfo::isDebugBuild()
   */
  
  static const struct {
@@ -73,7 +73,7 @@ index e1c87b5..d6e03ba 100644
  } qtConfEntries[] = {
      { "Prefix", "." },
      { "Documentation", "doc" }, // should be ${Data}/doc
-@@ -398,6 +398,7 @@ static const struct {
+@@ -404,6 +404,7 @@ static const struct {
      { "HostBinaries", "bin" },
      { "HostLibraries", "lib" },
      { "HostData", "." },
@@ -82,10 +82,10 @@ index e1c87b5..d6e03ba 100644
      { "HostSpec", "" },
      { "HostPrefix", "" },
 diff --git a/src/corelib/global/qlibraryinfo.h b/src/corelib/global/qlibraryinfo.h
-index 1ad7637..5a8b127 100644
+index 362d47d..a2326e2 100644
 --- a/src/corelib/global/qlibraryinfo.h
 +++ b/src/corelib/global/qlibraryinfo.h
-@@ -81,6 +81,7 @@ public:
+@@ -87,6 +87,7 @@ public:
          HostBinariesPath,
          HostLibrariesPath,
          HostDataPath,
@@ -94,10 +94,10 @@ index 1ad7637..5a8b127 100644
          HostSpecPath,
          HostPrefixPath,
 diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index 555ccbf..d9a5b08 100644
+index 871251d..9c1d7d8 100644
 --- a/tools/configure/configureapp.cpp
 +++ b/tools/configure/configureapp.cpp
-@@ -1248,6 +1248,13 @@ void Configure::parseCmdLine()
+@@ -1253,6 +1253,13 @@ void Configure::parseCmdLine()
              dictionary[ "QT_EXT_PREFIX" ] = configCmdLine.at(i);
          }
  
@@ -111,7 +111,7 @@ index 555ccbf..d9a5b08 100644
          else if (configCmdLine.at(i) == "-make-tool") {
              ++i;
              if (i == argCount)
-@@ -4214,6 +4221,9 @@ void Configure::generateQConfigCpp()
+@@ -4253,6 +4260,9 @@ void Configure::generateQConfigCpp()
  
      if (dictionary["QT_REL_HOST_DATA"].isEmpty())
          dictionary["QT_REL_HOST_DATA"] = haveHpx ? "." : dictionary["QT_REL_INSTALL_ARCHDATA"];
@@ -121,7 +121,7 @@ index 555ccbf..d9a5b08 100644
  
      confStringOff = 0;
      addConfStr(0, dictionary["QT_REL_INSTALL_DOCS"]);
-@@ -4233,6 +4243,7 @@ void Configure::generateQConfigCpp()
+@@ -4272,6 +4282,7 @@ void Configure::generateQConfigCpp()
      addConfStr(1, dictionary["QT_REL_HOST_BINS"]);
      addConfStr(1, dictionary["QT_REL_HOST_LIBS"]);
      addConfStr(1, dictionary["QT_REL_HOST_DATA"]);
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index b4c6c1f..7728ba4 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -261,4 +261,4 @@ sysroot_stage_dirs_append() {
     rm -rf $to${OE_QMAKE_PATH_QT_FONTS}
 }
 
-SRCREV = "ac8a3b948da1980bc59bae3fc76d20b5b45662a0"
+SRCREV = "10742cf8949497b83b87133ed66ec119cb3ab08f"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index 4990f34..42728fc 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "b351fb164af327828c9bdbc414ffd8e47e387e8c"
+SRCREV = "691d62dcd6c028e509ebb5241bb0a184faf3a5fc"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index cf6d3c5..48b90ed 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -25,4 +25,4 @@ do_configure_prepend() {
     sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/qtconnectivity.pro
 }
 
-SRCREV = "dec32076b9153febc575a0418af702f8cb400258"
+SRCREV = "fa2389dd0a6df58d73d221654db36ff791b96e43"
diff --git a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
index b3f7621..7501dc1 100644
--- a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
+++ b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
@@ -1,4 +1,4 @@
-From 1755b8c7ab87f9e6bf072bd0bef50086c14dd9ff Mon Sep 17 00:00:00 2001
+From 4e4675a65fa5ad687a9ca93540799f157bd328a0 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
 Date: Sun, 26 May 2013 14:26:19 +0200
 Subject: [PATCH] qmltestexample: fix link
@@ -15,12 +15,11 @@ Change-Id: I63088ff73bec6a8559dfae132f8bd40b62487450
 Signed-off-by: Eric Bénard <eric@eukrea.com>
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- examples/qmltest/qmltest/qmltest.pro         | 2 +-
- tests/auto/qml/qjsengine/qjsengine.pro       | 2 +-
- tests/auto/qml/qtqmlmodules/qtqmlmodules.pro | 2 +-
- tests/auto/qmltest/qmltest.pro               | 1 +
- tools/qmltestrunner/qmltestrunner.pro        | 2 +-
- 5 files changed, 5 insertions(+), 4 deletions(-)
+ examples/qmltest/qmltest/qmltest.pro   | 2 +-
+ tests/auto/qml/qjsengine/qjsengine.pro | 2 +-
+ tests/auto/qmltest/qmltest.pro         | 1 +
+ tools/qmltestrunner/qmltestrunner.pro  | 2 +-
+ 4 files changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/examples/qmltest/qmltest/qmltest.pro b/examples/qmltest/qmltest/qmltest.pro
 index b5893c5..1b00e6c 100644
@@ -36,31 +35,19 @@ index b5893c5..1b00e6c 100644
  macx: CONFIG -= app_bundle
  
 diff --git a/tests/auto/qml/qjsengine/qjsengine.pro b/tests/auto/qml/qjsengine/qjsengine.pro
-index fc2452c..919710f 100644
+index c9d78e2..5861613 100644
 --- a/tests/auto/qml/qjsengine/qjsengine.pro
 +++ b/tests/auto/qml/qjsengine/qjsengine.pro
-@@ -1,7 +1,7 @@
+@@ -1,6 +1,6 @@
  CONFIG += testcase
- CONFIG += parallel_test
  TARGET = tst_qjsengine
 -QT +=  qml qml-private widgets testlib gui-private
 +QT +=  qml qml-private widgets testlib gui-private quick
  macx:CONFIG -= app_bundle
  SOURCES += tst_qjsengine.cpp
  RESOURCES += qjsengine.qrc
-diff --git a/tests/auto/qml/qtqmlmodules/qtqmlmodules.pro b/tests/auto/qml/qtqmlmodules/qtqmlmodules.pro
-index c6d442e..3181dcd 100644
---- a/tests/auto/qml/qtqmlmodules/qtqmlmodules.pro
-+++ b/tests/auto/qml/qtqmlmodules/qtqmlmodules.pro
-@@ -8,5 +8,5 @@ macx:CONFIG -= app_bundle
- 
- TESTDATA = data/*
- 
--QT += core-private  qml-private testlib gui gui-private
-+QT += core-private  qml-private testlib gui gui-private quick
- DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
 diff --git a/tests/auto/qmltest/qmltest.pro b/tests/auto/qmltest/qmltest.pro
-index 7662cb1..a8f8ae2 100644
+index 54db7a7..8c6986c 100644
 --- a/tests/auto/qmltest/qmltest.pro
 +++ b/tests/auto/qmltest/qmltest.pro
 @@ -4,6 +4,7 @@ CONFIG += qmltestcase
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 93442fb..deb758e 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -33,6 +33,6 @@ do_configure_prepend() {
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "0fab5761d5428aa708edd66e40fc3c449adc4b11"
+SRCREV = "20a51e87fd15b8a6c1503b905399f7befe31114b"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index 5590abd..5066eb7 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
-SRCREV = "60a135102aaa37d0d817883e4d6aed456372709d"
+SRCREV = "f253f76aca4eb82a6df11c00a25c178e16253c9d"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index c35cc80..bf72040 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -17,4 +17,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "24f3fd69a2e953619c48b4a632262ce8419fee40"
+SRCREV = "7764833edf8f7ca8a53b4ea18688051ea010b70c"
diff --git a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
index 8964a5d..d42adfe 100644
--- a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
+++ b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
@@ -1,4 +1,4 @@
-From 14a68abb4c492fb7ba55dbccaf61057e861bbf3c Mon Sep 17 00:00:00 2001
+From f8a7d0e55e4c59de974e6459c05ce026577826ab Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 4 Aug 2014 19:19:05 +0200
 Subject: [PATCH] qtimageformats.pro: Make the dependencies deterministic
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index b49940b..c05669c 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -28,4 +28,4 @@ EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'jasper', 'CONFIG+=OE_
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libtiff', 'CONFIG+=OE_LIBTIFF_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libwebp', 'CONFIG+=OE_LIBWEBP_ENABLED', '', d)}"
 
-SRCREV = "58f19cf8d51e06f1781f3142e6d872e5feb0690e"
+SRCREV = "14f86268e7f149a3c881203227321c3fd085e4d9"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 5072903..6084830 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -29,4 +29,4 @@ do_configure_prepend() {
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
 
-SRCREV = "03163a3c9129b7f982b690e750056506c3d06b41"
+SRCREV = "48651de4a7a11b7bd348487df6eb68f258ed3c6a"
diff --git a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
index a4ac12a..63d5783 100644
--- a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
+++ b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
@@ -1,4 +1,4 @@
-From e8e2e289288acd3124536a41351e7bcd639bef07 Mon Sep 17 00:00:00 2001
+From e2dd9e2c359198e160bc2c743f084f5243cff69d Mon Sep 17 00:00:00 2001
 From: Yoann Lopes <yoann.lopes@digia.com>
 Date: Thu, 31 Oct 2013 15:06:30 +0100
 Subject: [PATCH] Initial porting effort to GStreamer 1.0.
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index ce42302..ad3a5d0 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -35,4 +35,4 @@ SRC_URI += "\
      file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
 "
 
-SRCREV = "3b6de26fe585c586d055ac86c5911cc6df0e3887"
+SRCREV = "7610f6e9ba8b92df6d18b94fcec982064dffacbd"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index e0a264d..8b37516 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -23,4 +23,4 @@ do_configure_prepend() {
     sed -i 's#^qtHaveModule(webkitwidgets):#enable-webkit:qtHaveModule(webkitwidgets):#g' ${S}/src/imports/imports.pro
 }
 
-SRCREV = "87f2415adf34da08e6cd58f5da6f6a7d0d9cf141"
+SRCREV = "5e3bd5cb28e7af95b289a617ca2f7a8892498225"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 1e25d6e..7d668af 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -13,4 +13,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "93d06fb27d7eae9290db33b6684916a225939f0b"
+SRCREV = "571a44a4dde8f047773f4e91a4a6941cb4cdf212"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 32f6ebf..2ea4758 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -27,4 +27,4 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEPENDS += "qtbase"
 
-SRCREV = "a5e814fd8809dd6a8a3c3efd4b911b36e3325a2a"
+SRCREV = "d80f57f60f39bb98948e22e94036104ddabd5e2b"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 4fbd15b..56dd837 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "fbaca62cd0a7309f04bf82101c8e20dbbf423192"
+SRCREV = "5e8d2b4e266916761a26905f0930add305c308cf"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index f32a8e1..37f7da5 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "02e4a66a8bd9ce4d2f7f8c89cd1bddf4b6385b5f"
+SRCREV = "e5c93da50f3b05d312f0e3dec50baf9fcbd5ffdc"
diff --git a/recipes-qt/qt5/qtsvg/0001-textobject.pro-use-DEPLOYMENT-only-for-wince-like-ot.patch b/recipes-qt/qt5/qtsvg/0001-textobject.pro-use-DEPLOYMENT-only-for-wince-like-ot.patch
index c0e1389..9f6921e 100644
--- a/recipes-qt/qt5/qtsvg/0001-textobject.pro-use-DEPLOYMENT-only-for-wince-like-ot.patch
+++ b/recipes-qt/qt5/qtsvg/0001-textobject.pro-use-DEPLOYMENT-only-for-wince-like-ot.patch
@@ -1,4 +1,4 @@
-From f3b363acbe125c1eb1f1d4cf28973d2914cda024 Mon Sep 17 00:00:00 2001
+From d474ee7585372fdb77a928b401b5895b05b41e20 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Thu, 5 Nov 2015 12:25:05 +0100
 Subject: [PATCH] textobject.pro: use DEPLOYMENT only for wince like other
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index d2699f7..314679b 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -13,6 +13,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "a9ac71a443260de66f720f0184646847b03fcb46"
+SRCREV = "b50d20b7057fcd808525921e56d25f75140c79cd"
 
 SRC_URI += "file://0001-textobject.pro-use-DEPLOYMENT-only-for-wince-like-ot.patch"
diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index 868e051..56d6a5c 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -28,9 +28,4 @@ do_install_append() {
     rm -f ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro	
 }
 
-QT_MODULE_BRANCH = "dev"
-
-# qtsystems wasn't released yet, last tag before this SRCREV is 5.0.0-beta1
-# qt5-git PV is only to indicate that this recipe is compatible with qt5 5.6
-
 SRCREV = "cc2077700bd5503d1fcf53aef83cbb76975e745a"
diff --git a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
index 45a4fc7..717f3af 100644
--- a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
+++ b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
@@ -1,4 +1,4 @@
-From a6f3bde30cb78e109a26fec6b336f8a504d4fa3c Mon Sep 17 00:00:00 2001
+From 3bd799c512d03bcef2f7c0e3db7b12e0579aa53b Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.jansa@gmail.com>
 Date: Wed, 11 Sep 2013 18:30:08 +0200
 Subject: [PATCH 1/4] Allow to build only lrelease + lupdate + lconvert
diff --git a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
index c4c0a14..f7dd179 100644
--- a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
+++ b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
@@ -1,4 +1,4 @@
-From 1140fd4bb5768d49cad9e834a9ce5eb05b711d0e Mon Sep 17 00:00:00 2001
+From 59f4367fc7cd378727a5569bd7babfb8b83bc8d2 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 17 Jan 2014 14:33:19 +0100
 Subject: [PATCH 2/4] assistant/help: fix linking of dependent libraries
diff --git a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
index 81b511f..b1b9efb 100644
--- a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
@@ -1,4 +1,4 @@
-From a0637f231d513dfc15f1eec185d5d5e7fb03e292 Mon Sep 17 00:00:00 2001
+From 80409fd5fcdf8dfc61e8c9007286a292a195051d Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
 Subject: [PATCH 3/4] add noqtwebkit configuration
diff --git a/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch b/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
index 0e7061a..2eed34b 100644
--- a/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
+++ b/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
@@ -1,4 +1,4 @@
-From 3f1754dec603e3508a45f3e1800edf0a44411084 Mon Sep 17 00:00:00 2001
+From 69a2d2bef3605edb34da7f56a51e5fff50ef3191 Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 9 Jul 2015 11:28:19 -0400
 Subject: [PATCH 4/4] linguist-tools cmake: allow overriding the location for
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 8991633..11512ff 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -31,6 +31,6 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'linguistonly', 'CONFIG+=linguistonly', '', d)}"
 
-SRCREV = "05206b44cf25ca6a895cc9a8716f2b7f2f14191f"
+SRCREV = "36aa99b22465e10d44c1461021b93d60bc6aeead"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 7908a3e..3598a9b 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -114,4 +114,4 @@ FILES_${PN}-qt = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
 "
 
-SRCREV = "ce85e4ee4ee22e5dea3b44707a27dab44319708e"
+SRCREV = "510ee7f04035dc64d43be29716d6d8079a8d908a"
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index b164a67..c0c04f7 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -25,4 +25,4 @@ do_install() {
     oe_runmake install INSTALL_ROOT=${D}
 }
 
-SRCREV = "bebe9beff3e9874498474cec32634cf281ddc453"
+SRCREV = "74b1ec474d1d48242893dcaf58b8a35f155f3fc3"
diff --git a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
index 06168e3..37d3fdc 100644
--- a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
+++ b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
@@ -1,4 +1,4 @@
-From 8841d31cb66fda833dc0ae557f13887716f4c46b Mon Sep 17 00:00:00 2001
+From bb43e4a944db0095dcc9f2f0b07ca1f79f3a5206 Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Fri, 19 Jul 2013 13:35:14 +0000
 Subject: [PATCH] Install the qtwaylandscanner tool to the native side
diff --git a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch b/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
index 3604757..a99fba7 100644
--- a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
+++ b/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
@@ -1,4 +1,4 @@
-From efec881d1bff247e6452a10a60821612c2585c67 Mon Sep 17 00:00:00 2001
+From 125478ea618c1329b210621bee6f6cdec5e81032 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 22 Feb 2014 17:47:44 +0100
 Subject: [PATCH] examples/wayland: include server-buffer only when building
@@ -14,18 +14,17 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/examples/wayland/wayland.pro b/examples/wayland/wayland.pro
-index d633fb9..643c7cd 100644
+index 91c68b8..9cfcefe 100644
 --- a/examples/wayland/wayland.pro
 +++ b/examples/wayland/wayland.pro
-@@ -9,5 +9,7 @@ contains(CONFIG, wayland-compositor) {
-         SUBDIRS += qml-compositor
-     }
- 
--    SUBDIRS += server-buffer
-+    contains(QT_CONFIG, opengles2) {
-+        SUBDIRS += server-buffer
-+    }
+@@ -8,4 +8,6 @@ qtHaveModule(quick) {
+     SUBDIRS += custom-extension
  }
+ 
+-SUBDIRS += server-buffer
++contains(QT_CONFIG, opengles2) {
++    SUBDIRS += server-buffer
++}
 -- 
 2.7.0
 
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 78d8a3e..534334e 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -36,4 +36,4 @@ SRC_URI += " \
     file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
 "
 
-SRCREV = "bebe9beff3e9874498474cec32634cf281ddc453"
+SRCREV = "74b1ec474d1d48242893dcaf58b8a35f155f3fc3"
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index eb4475b..c3fb061 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "3fa1c9d2cf5e00e7431d042e7955a6dd75e6e2b1"
+SRCREV = "9507cdc31ff6778cba77764bb0991e538c493a9e"
diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
index a1ea375..a6972fc 100644
--- a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
@@ -1,4 +1,4 @@
-From 90d2f7aefa8922c3aa29e6907c1520c814d1797f Mon Sep 17 00:00:00 2001
+From aab168c504038c7573f72e082a2431bc0502efd9 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Fri, 3 Oct 2014 03:52:11 +0200
 Subject: [PATCH 1/2] <chromium> base.gypi: include
@@ -10,10 +10,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/3rdparty/chromium/base/base.gypi b/src/3rdparty/chromium/base/base.gypi
-index b860735..0ed5de3 100644
+index be4e87c..5434828 100644
 --- a/src/3rdparty/chromium/base/base.gypi
 +++ b/src/3rdparty/chromium/base/base.gypi
-@@ -785,7 +785,7 @@
+@@ -787,7 +787,7 @@
                  ['include', '^nix/'],
                ],
            }],
diff --git a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
index 88d4826..9020292 100644
--- a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
@@ -1,4 +1,4 @@
-From f052458fe39733602751f9f9a09d1c0d78bea421 Mon Sep 17 00:00:00 2001
+From 0fdc77731963107902fba356b96a9f0648d03e81 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 30 Jun 2014 20:08:17 +0200
 Subject: [PATCH 1/5] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
diff --git a/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch b/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
index 1227d0a..94eaf86 100644
--- a/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
@@ -1,4 +1,4 @@
-From a015bddaf2005cac376be7dda4603637afc5844c Mon Sep 17 00:00:00 2001
+From c3805244c812f4dbfb8949dc2f146aa5c7af62df Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Thu, 24 Dec 2015 12:46:58 -0200
 Subject: [PATCH 2/2] chromium: Change false to FALSE and 1 to TRUE, FIX
diff --git a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
index dbc1e24..72eec1b 100644
--- a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
@@ -1,4 +1,4 @@
-From 5f6389fe3493420c2afeec8f2786165f1d08901a Mon Sep 17 00:00:00 2001
+From 75b06098b5780ba3eaa24d48dd90d91590a379d1 Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Tue, 18 Nov 2014 10:38:18 +0100
 Subject: [PATCH 2/5] functions.prf: Make sure we only use the file name to
diff --git a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
index 28960ed..6bf2935 100644
--- a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From 348a74cb924cf6ac4384069d84ee3995644b2ce1 Mon Sep 17 00:00:00 2001
+From 52575f04d108183482cef6b4b871f736ef66aa1b Mon Sep 17 00:00:00 2001
 From: Frieder Schrempf <frieder.schrempf@online.de>
 Date: Mon, 1 Dec 2014 14:34:40 +0000
 Subject: [PATCH 3/5] functions.prf: allow build for linux-oe-g++ platform
diff --git a/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch b/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
index 4a3deb9..efaabf0 100644
--- a/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
+++ b/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
@@ -1,4 +1,4 @@
-From 80f5e26073ef58c1a2ff510c6ccdb7423bcb2fc3 Mon Sep 17 00:00:00 2001
+From b3c28efd16c9e9a0cd2a29441dae02382b8deaea Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Fri, 25 Dec 2015 18:16:05 -0200
 Subject: [PATCH 4/5] WebEngine qquickwebengineview_p_p.h add include QColor
@@ -9,10 +9,10 @@ Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/src/webengine/api/qquickwebengineview_p_p.h b/src/webengine/api/qquickwebengineview_p_p.h
-index dbbbf91..94268b6 100644
+index e4313a4..5a8137e 100644
 --- a/src/webengine/api/qquickwebengineview_p_p.h
 +++ b/src/webengine/api/qquickwebengineview_p_p.h
-@@ -56,6 +56,8 @@
+@@ -59,6 +59,8 @@
  #include <QString>
  #include <QtCore/qcompilerdetection.h>
  #include <QtGui/qaccessibleobject.h>
diff --git a/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch b/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch
index 6fd9e49..b2cc4d1 100644
--- a/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch
+++ b/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch
@@ -1,4 +1,4 @@
-From b3f3154e4852a830fdc4e311d4f5105fc337e8f2 Mon Sep 17 00:00:00 2001
+From cc711a443c53c61475957fd8b6ffcf84272bf7a6 Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Thu, 24 Dec 2015 15:59:51 -0200
 Subject: [PATCH 5/5] Include dependency to QCoreApplication::translate()
@@ -9,10 +9,10 @@ Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/src/core/media_capture_devices_dispatcher.h b/src/core/media_capture_devices_dispatcher.h
-index 500fe76..eda2824 100644
+index b13a9da..8a54cce 100644
 --- a/src/core/media_capture_devices_dispatcher.h
 +++ b/src/core/media_capture_devices_dispatcher.h
-@@ -43,6 +43,8 @@
+@@ -46,6 +46,8 @@
  #include <map>
  #include <QtCore/qcompilerdetection.h>
  
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index d2975ef..3c185ea 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -105,7 +105,7 @@ RDEPENDS_${PN}-examples += " \
     qtdeclarative-qmlplugins \
 "
 
-QT_MODULE_BRANCH_CHROMIUM = "45-based"
+QT_MODULE_BRANCH_CHROMIUM = "47-based"
 
 SRC_URI += " \
     ${QT_GIT}/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};destsuffix=git/src/3rdparty \
@@ -118,8 +118,8 @@ SRC_URI += " \
     file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch \
 "
 
-SRCREV_qtwebengine = "3f02c25de46f5ff296b8189af3435ce5800b39a7"
-SRCREV_chromium = "779a2388fc123a7f3a178ce2ced921ee4a307e2c"
+SRCREV_qtwebengine = "835b24055cfbc953fd4c844d264e7fbc8550d575"
+SRCREV_chromium = "df7c5f41e9f7e6a1382706e99bd78c4b7e3d1201"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine_chromium"
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index 63d02fa..2bc5e9d 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -19,4 +19,4 @@ DEPENDS += "qtwebkit qtxmlpatterns"
 RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
 RDEPENDS_${PN}-examples += "${@base_contains('PACKAGECONFIG_OPENSSL', 'openssl', 'ca-certificates', '', d)}"
 
-SRCREV = "1b9a0fc9d1ded4f4f11b04eb0bb7d1de82d6eb34"
+SRCREV = "f3f9e2a1b772b718335331a603a6bee748928e49"
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 9044d4f..79b06a2 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -71,4 +71,4 @@ PACKAGES_remove = "${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-db
 RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i386').replace('i686', 'i386') }"
 export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
 
-SRCREV = "d2ff5a085572b1ee24dcb42ae107063f3142d14e"
+SRCREV = "e9b369b16f5b6070d11888474f1b652db6f4b4e2"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index fbce6be..0b1d9b8 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "2d8c94cf11097b61689757f8a0162bb7dd9d7d0b"
+SRCREV = "e821221d4bbeab3715702e4265670f58290676d6"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index 0ae8e4a..ac3e145 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "5df9fa8f3a7209c067a5d5068776b9aa52273d3b"
+SRCREV = "5df6e708b64e22f98a053145011b6da917257174"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index c424562..6c5b0f2 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -13,6 +13,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "a8d103a05bc195dd045779f3aebdf67bd0140df1"
+SRCREV = "1f4c37adfacadec463884f4c22850c74a0c5893f"
 
 BBCLASSEXTEND =+ "native nativesdk"
-- 
2.7.1


