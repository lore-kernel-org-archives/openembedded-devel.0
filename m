Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 329C071692
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Oct 2014 02:25:04 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id d1so382736wiv.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Oct 2014 19:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kopgR+Nu85hjz+tHvl/+zvyqPXyg4YHrIypsQyEJwAU=;
	b=Rm320TL7a++o8bTTI7zRTbYzIgqW5KXfekyQk5a4UQf5IWVSQIdJ6A8/4humMKWAJq
	9iYN+vRJhkzZUErc9Byqj0MSstY2+lhb/BMaAfJHWIlIDkvQsyMP2kvLqK73BdgD5Rmk
	fidUOrkNamrz9OBfQFGdi5JF4w6SFZXMPMIxBtGxiRhcBvjG6cx2069eDUQh6VmU7X6k
	6aVj5RWQtj/Dt3C8XiD2NPmFm8p98wfKYILjACsOpSUA/gLXvg8WIA7KFd0pml/bh0hI
	iiMmD/fS+OPAT/EajplZk3/gSDVTPCIkK+YsyrwiWkdXUVAkdGk9O5kOXyan8G8I0aL2
	QQoA==
X-Received: by 10.194.173.67 with SMTP id bi3mr11364041wjc.105.1412389506016; 
	Fri, 03 Oct 2014 19:25:06 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	c7sm3706029wib.12.2014.10.03.19.25.04 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Oct 2014 19:25:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Oct 2014 04:25:55 +0200
Message-Id: <1412389558-13237-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1412389558-13237-1-git-send-email-Martin.Jansa@gmail.com>
References: <1412389558-13237-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCH 4/7] qt*: refresh the patches
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
X-List-Received-Date: Sat, 04 Oct 2014 02:25:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase.inc                |  4 +--
 recipes-qt/qt5/qtbase-native.inc                   |  2 +-
 recipes-qt/qt5/qtbase.inc                          |  2 +-
 .../qt5/qtbase/0001-Add-linux-oe-g-platform.patch  |  8 ++---
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  6 ++--
 .../0003-Add-external-hostbindir-option.patch      | 32 +++++++++---------
 ...p-Prefix-default-LIBDIRS-and-INCDIRS-with.patch | 10 +++---
 ...le-Fix-pkgconfig-and-libtool-replacements.patch |  8 ++---
 ...lfs-Print-the-chosen-config-in-debug-mode.patch |  6 ++--
 ...mintegration-Undefine-CursorShape-from-X..patch |  6 ++--
 ...ump-path-length-from-256-to-512-character.patch |  8 ++---
 ...gl-error-for-platforms-only-supporting-on.patch |  6 ++--
 ...10-Revert-Use-the-gcc-feature-in-simd.prf.patch |  6 ++--
 .../0011-QOpenGLPaintDevice-sub-area-support.patch |  6 ++--
 ...build-uic.patch => 0012-Always-build-uic.patch} |  6 ++--
 ...build-it-in-configure-but-allow-to-build.patch} |  8 ++---
 ...eserve-built-qmake-and-swap-with-native-.patch} |  8 ++---
 .../0001-qmltestexample-fix-link.patch             |  4 +--
 ...ats.pro-Make-the-dependencies-determinist.patch |  4 +--
 ...1-Initial-porting-effort-to-GStreamer-1.0.patch | 39 ++++++++++++----------
 ...a.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch | 14 ++++----
 ...w-to-build-only-lrelease-lupdate-lconvert.patch |  4 +--
 ...t-help-fix-linking-of-dependent-libraries.patch |  4 +--
 .../0003-add-noqtwebkit-configuration.patch        |  4 +--
 ...-qtwaylandscanner-tool-to-the-native-side.patch |  6 ++--
 ...o-include-server-buffer-only-when-buildin.patch |  8 ++---
 .../0001-qtwebkit-fix-QA-issue-bad-RPATH.patch     | 10 +++---
 27 files changed, 117 insertions(+), 112 deletions(-)
 rename recipes-qt/qt5/qtbase/{0011-Always-build-uic.patch => 0012-Always-build-uic.patch} (87%)
 rename recipes-qt/qt5/qtbase/{0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch => 0012-qmake-don-t-build-it-in-configure-but-allow-to-build.patch} (88%)
 rename recipes-qt/qt5/qtbase/{0012-configure-preserve-built-qmake-and-swap-with-native-.patch => 0013-configure-preserve-built-qmake-and-swap-with-native-.patch} (81%)

diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
index e3b2863..6987c9f 100644
--- a/recipes-qt/qt5/nativesdk-qtbase.inc
+++ b/recipes-qt/qt5/nativesdk-qtbase.inc
@@ -27,12 +27,12 @@ SRC_URI += "\
 
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
-    file://0011-Always-build-uic.patch \
+    file://0012-Always-build-uic.patch \
 "
 
 # specific for nativesdk-qtbase
 SRC_URI += " \
-    file://0012-configure-preserve-built-qmake-and-swap-with-native-.patch \
+    file://0013-configure-preserve-built-qmake-and-swap-with-native-.patch \
 "
 
 PACKAGES = "${PN}-tools-dbg ${PN}-tools-dev ${PN}-tools-staticdev ${PN}-tools"
diff --git a/recipes-qt/qt5/qtbase-native.inc b/recipes-qt/qt5/qtbase-native.inc
index e935d70..f58fdb7 100644
--- a/recipes-qt/qt5/qtbase-native.inc
+++ b/recipes-qt/qt5/qtbase-native.inc
@@ -24,7 +24,7 @@ SRC_URI += "\
 
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
-    file://0011-Always-build-uic.patch \
+    file://0012-Always-build-uic.patch \
 "
 
 QT_CONF_PATH = "${B}/qt.conf"
diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 9941cda..bafb59e 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -17,7 +17,7 @@ SRC_URI += "\
 
 # specific for qtbase
 SRC_URI += "\
-    file://0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
+    file://0012-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
 "
 
 DEPENDS += "qtbase-native"
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index f2a7c0e..64829fa 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -1,7 +1,7 @@
-From c5b50848ead7de12ec18cd30940d74d92b974280 Mon Sep 17 00:00:00 2001
+From 9816098355731afb60cd41d334be97d07f0dcc42 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
-Subject: [PATCH 01/12] Add linux-oe-g++ platform
+Subject: [PATCH 01/13] Add linux-oe-g++ platform
 
 * This qmake.conf unlike other platforms reads most variables from
   shell environment, because it's easier for qt recipes to export
@@ -51,7 +51,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
 diff --git a/configure b/configure
-index d5c2b08..4eae0d3 100755
+index cb8d78f..3f7b41b 100755
 --- a/configure
 +++ b/configure
 @@ -324,6 +324,16 @@ getQMakeConf()
@@ -346,5 +346,5 @@ index 0000000..dd12003
 +
 +#endif // QPLATFORMDEFS_H
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index 247bfb7..669ebb2 100644
--- a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,7 +1,7 @@
-From 5d83d8ce8b601a983b055f32dc67a418a0ce06ab Mon Sep 17 00:00:00 2001
+From 2749053c1a0670fea50f2f716fea0839fbbbb007 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
-Subject: [PATCH 02/12] qlibraryinfo: allow to set qt.conf from the outside
+Subject: [PATCH 02/13] qlibraryinfo: allow to set qt.conf from the outside
  using the environment
 
 Allow to set a qt.conf from the outside using the environment. This allows
@@ -35,5 +35,5 @@ index 174c1d0..69e614f 100644
      if(!QFile::exists(qtconfig))
          qtconfig = qt_libraryInfoFile();
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
index 2abea8f..d5df4f6 100644
--- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
@@ -1,7 +1,7 @@
-From b544f5f3462e2981ada045a32038b7f116f8590c Mon Sep 17 00:00:00 2001
+From e263260c50051327e3f7f2ca8c46e014228e0078 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH 03/12] Add -external-hostbindir option
+Subject: [PATCH 03/13] Add -external-hostbindir option
 
 * when cross-compiling it's sometimes useful to use existing tools from machine
   (or in OpenEmbedded built with separate native recipe) when building for target
@@ -38,10 +38,10 @@ Signed-off-by: Jonathan Liu <net147@gmail.com>
  11 files changed, 51 insertions(+), 13 deletions(-)
 
 diff --git a/configure b/configure
-index d5c2b08..dcd066c 100755
+index 3f7b41b..18d1a0b 100755
 --- a/configure
 +++ b/configure
-@@ -759,6 +759,7 @@ QT_HOST_BINS=
+@@ -777,6 +777,7 @@ QT_HOST_BINS=
  QT_HOST_LIBS=
  QT_HOST_DATA=
  QT_EXT_PREFIX=
@@ -49,7 +49,7 @@ index d5c2b08..dcd066c 100755
  
  #flags for SQL drivers
  QT_CFLAGS_PSQL=
-@@ -878,6 +879,7 @@ while [ "$#" -gt 0 ]; do
+@@ -896,6 +897,7 @@ while [ "$#" -gt 0 ]; do
      -testsdir| \
      -hostdatadir| \
      -hostbindir| \
@@ -57,7 +57,7 @@ index d5c2b08..dcd066c 100755
      -hostlibdir| \
      -extprefix| \
      -sysroot| \
-@@ -1092,6 +1094,9 @@ while [ "$#" -gt 0 ]; do
+@@ -1110,6 +1112,9 @@ while [ "$#" -gt 0 ]; do
      extprefix)
          QT_EXT_PREFIX="$VAL"
          ;;
@@ -67,7 +67,7 @@ index d5c2b08..dcd066c 100755
      pkg-config)
          if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
              CFG_PKGCONFIG="$VAL"
-@@ -2230,6 +2235,10 @@ Installation options:
+@@ -2248,6 +2253,10 @@ Installation options:
      -hostdatadir <dir> . Data used by qmake will be installed to <dir>
                           (default HOSTPREFIX)
  
@@ -78,7 +78,7 @@ index d5c2b08..dcd066c 100755
  Configure options:
  
   The defaults (*) are usually acceptable. A plus (+) denotes a default value
-@@ -2897,6 +2906,11 @@ fi
+@@ -2915,6 +2924,11 @@ fi
  # command line and environment validation
  #-------------------------------------------------------------------------------
  
@@ -90,7 +90,7 @@ index d5c2b08..dcd066c 100755
  # update QT_CONFIG to show our current predefined configuration
  CFG_QCONFIG_PATH=$relpath/src/corelib/global/qconfig-${CFG_QCONFIG}.h
  case "$CFG_QCONFIG" in
-@@ -3577,6 +3591,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
+@@ -3595,6 +3609,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
      "qt_hbinpath=$QT_HOST_BINS",
      "qt_hlibpath=$QT_HOST_LIBS",
      "qt_hdatpath=$QT_HOST_DATA",
@@ -211,10 +211,10 @@ index 9bda70e..6e3605a 100644
      _qt5_Core_check_file_exists(${imported_location})
  
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 174c1d0..1fe03cb 100644
+index 69e614f..a95ca35 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -333,7 +333,7 @@ QLibraryInfo::isDebugBuild()
+@@ -336,7 +336,7 @@ QLibraryInfo::isDebugBuild()
   */
  
  static const struct {
@@ -223,7 +223,7 @@ index 174c1d0..1fe03cb 100644
  } qtConfEntries[] = {
      { "Prefix", "." },
      { "Documentation", "doc" }, // should be ${Data}/doc
-@@ -359,6 +359,7 @@ static const struct {
+@@ -362,6 +362,7 @@ static const struct {
      { "HostBinaries", "bin" },
      { "HostLibraries", "lib" },
      { "HostData", "." },
@@ -279,10 +279,10 @@ index 99d87e2..5621dc0 100644
      _qt5_Widgets_check_file_exists(${imported_location})
  
 diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index b756509..7e61845 100644
+index 90981f6..7d73882 100644
 --- a/tools/configure/configureapp.cpp
 +++ b/tools/configure/configureapp.cpp
-@@ -1213,6 +1213,13 @@ void Configure::parseCmdLine()
+@@ -1215,6 +1215,13 @@ void Configure::parseCmdLine()
              dictionary[ "QT_EXT_PREFIX" ] = configCmdLine.at(i);
          }
  
@@ -296,7 +296,7 @@ index b756509..7e61845 100644
          else if (configCmdLine.at(i) == "-make-tool") {
              ++i;
              if (i == argCount)
-@@ -3983,6 +3990,7 @@ void Configure::generateQConfigCpp()
+@@ -4006,6 +4013,7 @@ void Configure::generateQConfigCpp()
                    << "    \"qt_hbinpath=" << formatPath(dictionary["QT_HOST_BINS"]) << "\"," << endl
                    << "    \"qt_hlibpath=" << formatPath(dictionary["QT_HOST_LIBS"]) << "\"," << endl
                    << "    \"qt_hdatpath=" << formatPath(dictionary["QT_HOST_DATA"]) << "\"," << endl
@@ -305,5 +305,5 @@ index b756509..7e61845 100644
                    << "    \"qt_hostspec=" << hostSpec << "\"," << endl
                    << "#endif" << endl
 -- 
-2.0.1
+2.1.1
 
diff --git a/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch b/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
index db6266d..adf1c4a 100644
--- a/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
+++ b/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
@@ -1,7 +1,7 @@
-From 4a86d338f04c2bfa4d3f63a2fa9d1252503757fd Mon Sep 17 00:00:00 2001
+From 34a32208034a03c0d591dc79386f97ae020652e7 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 22:33:33 +0200
-Subject: [PATCH 04/12] configureapp: Prefix default LIBDIRS and INCDIRS with
+Subject: [PATCH 04/13] configureapp: Prefix default LIBDIRS and INCDIRS with
  SYSROOT
 
 Upstream-Status: Pending
@@ -11,10 +11,10 @@ Upstream-Status: Pending
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index 7e61845..29c6358 100644
+index 7d73882..c572fbb 100644
 --- a/tools/configure/configureapp.cpp
 +++ b/tools/configure/configureapp.cpp
-@@ -3370,8 +3370,8 @@ void Configure::generateQConfigPri()
+@@ -3393,8 +3393,8 @@ void Configure::generateQConfigPri()
          configStream << "    QT_ARCH = " << dictionary["QT_ARCH"] << endl;
          if (dictionary.contains("XQMAKESPEC") && !dictionary["XQMAKESPEC"].startsWith("wince")) {
              // FIXME: add detection
@@ -26,5 +26,5 @@ index 7e61845..29c6358 100644
          configStream << "}" << endl;
          configStream << "QT_CONFIG += " << qtConfig.join(' ') << endl;
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
index e189c22..fe2fd6a 100644
--- a/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ b/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -1,7 +1,7 @@
-From 71e5a4c62ca38b30a14c9957db21a7cbf5fcf54d Mon Sep 17 00:00:00 2001
+From 9e7667c9124ab287dc0f7ad40c2b61c435ffc186 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
-Subject: [PATCH 05/12] qt_module: Fix pkgconfig and libtool replacements
+Subject: [PATCH 05/13] qt_module: Fix pkgconfig and libtool replacements
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -80,7 +80,7 @@ index 4dcabe9..d04bc3e 100644
      lib_replace.CONFIG = path
      QMAKE_PRL_INSTALL_REPLACE += lib_replace
 diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_module.prf
-index 8bf4c92..ee2e989 100644
+index 8bf4c92..2e229fc 100644
 --- a/mkspecs/features/qt_module.prf
 +++ b/mkspecs/features/qt_module.prf
 @@ -188,10 +188,25 @@ unix|mingw {
@@ -110,5 +110,5 @@ index 8bf4c92..ee2e989 100644
  }
  
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtbase/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch b/recipes-qt/qt5/qtbase/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
index e70417c..08629f5 100644
--- a/recipes-qt/qt5/qtbase/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
+++ b/recipes-qt/qt5/qtbase/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
@@ -1,7 +1,7 @@
-From a3e87ebdf7dff6b9d4b1d8191f044cfb56b9da3d Mon Sep 17 00:00:00 2001
+From ce38ab8b2167b74fa90eb3e17507dc9e799a3274 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 21 Apr 2014 19:22:04 +0200
-Subject: [PATCH 06/12] Revert "eglfs: Print the chosen config in debug mode"
+Subject: [PATCH 06/13] Revert "eglfs: Print the chosen config in debug mode"
 
 This reverts commit dc685cf6331f5fb46285cf10d6464c2ecf41f73e.
 ---
@@ -52,5 +52,5 @@ index eec6463..4a7c69b 100644
      // Make the context current to ensure the GL version query works. This needs a surface too.
      const EGLint pbufferAttributes[] = {
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtbase/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch b/recipes-qt/qt5/qtbase/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
index b5e46d7..c1ffb91 100644
--- a/recipes-qt/qt5/qtbase/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
+++ b/recipes-qt/qt5/qtbase/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
@@ -1,7 +1,7 @@
-From 75fbeec66d98aacad5be1e3fcfd92f42b1ef0da7 Mon Sep 17 00:00:00 2001
+From 7c16b57ecdddffb4bb52d32bb763791fd8aa8414 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 19 Mar 2014 18:32:28 +0100
-Subject: [PATCH 07/12] qeglplatformintegration: Undefine CursorShape from X.h
+Subject: [PATCH 07/13] qeglplatformintegration: Undefine CursorShape from X.h
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
@@ -26,5 +26,5 @@ index f665455..9eb783c 100644
  
  class QEGLPlatformScreen;
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtbase/0008-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0008-configure-bump-path-length-from-256-to-512-character.patch
index 5df8330..370cc48 100644
--- a/recipes-qt/qt5/qtbase/0008-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase/0008-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,7 +1,7 @@
-From a3beca1f4ba231baf38e7de0221e55681437966d Mon Sep 17 00:00:00 2001
+From 68e499a4a521f3876aca195ba8ed5b63d45d09ed Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:27:30 -0500
-Subject: [PATCH 08/12] configure: bump path length from 256 to 512 characters
+Subject: [PATCH 08/13] configure: bump path length from 256 to 512 characters
 
 Increase the path length that gets hardcoded into generated config.cpp file
 from 256 to 512 characters, as nativesdk path can be quite long.
@@ -12,7 +12,7 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 48d5119..3c0347a 100755
+index 18d1a0b..ca0824f 100755
 --- a/configure
 +++ b/configure
 @@ -3573,7 +3573,7 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
@@ -25,5 +25,5 @@ index 48d5119..3c0347a 100755
      "qt_prfxpath=$QT_SYSROOT_PREFIX",
      "qt_docspath=$QT_SYSROOT_DOCS",
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtbase/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch b/recipes-qt/qt5/qtbase/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
index c3750b8..bbd27b9 100644
--- a/recipes-qt/qt5/qtbase/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
+++ b/recipes-qt/qt5/qtbase/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
@@ -1,7 +1,7 @@
-From 6d1123116233e55c4ade13378eec41fb7441cec6 Mon Sep 17 00:00:00 2001
+From 3408e6d6c56a18bed48353c2f1b2e18f6716fc4e Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 5 Feb 2014 18:35:08 +0100
-Subject: [PATCH 09/12] eglfs: fix egl error for platforms only supporting one
+Subject: [PATCH 09/13] eglfs: fix egl error for platforms only supporting one
  window/surface
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
@@ -68,5 +68,5 @@ index 2d36c0b..854531e 100644
  
      if (isRaster()) {
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtbase/0010-Revert-Use-the-gcc-feature-in-simd.prf.patch b/recipes-qt/qt5/qtbase/0010-Revert-Use-the-gcc-feature-in-simd.prf.patch
index 9fb7e08..07f9795 100644
--- a/recipes-qt/qt5/qtbase/0010-Revert-Use-the-gcc-feature-in-simd.prf.patch
+++ b/recipes-qt/qt5/qtbase/0010-Revert-Use-the-gcc-feature-in-simd.prf.patch
@@ -1,7 +1,7 @@
-From 2a6891f2cbf221b51b214a527adb4602e20b100b Mon Sep 17 00:00:00 2001
+From 4a6476822784ca6a10f59cfb3e941854ccea8408 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 4 Jun 2014 15:26:11 +0200
-Subject: [PATCH 10/12] Revert "Use the "gcc" feature in simd.prf"
+Subject: [PATCH 10/13] Revert "Use the "gcc" feature in simd.prf"
 
 This reverts commit 3b00cc480400d47c59c29d3507c7fcdc9be2a489.
 ---
@@ -22,5 +22,5 @@ index 62a63f9..4f86f60 100644
          HEADERS += $$SSE2_HEADERS
  
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtbase/0011-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase/0011-QOpenGLPaintDevice-sub-area-support.patch
index 27496db..f2031f7 100644
--- a/recipes-qt/qt5/qtbase/0011-QOpenGLPaintDevice-sub-area-support.patch
+++ b/recipes-qt/qt5/qtbase/0011-QOpenGLPaintDevice-sub-area-support.patch
@@ -1,7 +1,7 @@
-From 606dc31c85d97dff52b07ec9c896718c6533f670 Mon Sep 17 00:00:00 2001
+From 3902dcd1d7da169229deffbff02ac1a159b08d44 Mon Sep 17 00:00:00 2001
 From: Jani Hautakangas <jani.hautakangas@ixonos.com>
 Date: Thu, 16 May 2013 09:52:07 +0300
-Subject: [PATCH 11/11] QOpenGLPaintDevice sub-area support
+Subject: [PATCH 11/13] QOpenGLPaintDevice sub-area support
 
 Allows creating QOpenGLPaintDevice targetting sub-area
 of binded framebuffer.
@@ -148,5 +148,5 @@ index 0610ab6..ea1e3b2 100644
      } else {
          if (m_vao.isCreated()) {
 -- 
-2.0.2
+2.1.1
 
diff --git a/recipes-qt/qt5/qtbase/0011-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0012-Always-build-uic.patch
similarity index 87%
rename from recipes-qt/qt5/qtbase/0011-Always-build-uic.patch
rename to recipes-qt/qt5/qtbase/0012-Always-build-uic.patch
index dcd10bd..46ae47f 100644
--- a/recipes-qt/qt5/qtbase/0011-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase/0012-Always-build-uic.patch
@@ -1,7 +1,7 @@
-From bf4593d727fa673734bb1930f79fc012e52250ec Mon Sep 17 00:00:00 2001
+From bdcbca2fcb09d48af75e99b7dfa6ce211507925c Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
-Subject: [PATCH 11/12] Always build uic
+Subject: [PATCH 12/13] Always build uic
 
 Even if we are not building gui or widgets. This tool is needed later
 as a native tool when compiling the target.
@@ -27,5 +27,5 @@ index 6a805a6..90623a6 100644
  nacl: SUBDIRS -= src_network src_testlib
  
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch b/recipes-qt/qt5/qtbase/0012-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
similarity index 88%
rename from recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
rename to recipes-qt/qt5/qtbase/0012-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
index 7135a49..7145796 100644
--- a/recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
+++ b/recipes-qt/qt5/qtbase/0012-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
@@ -1,7 +1,7 @@
-From 6317e81c96cec598da266d0c863afa4320d1e38a Mon Sep 17 00:00:00 2001
+From bb0958af49c1ad4d35b6b6b9033cd46eda4a3ac8 Mon Sep 17 00:00:00 2001
 From: Michael Krelin <hacker@klever.net>
 Date: Mon, 29 Oct 2012 20:07:49 -0700
-Subject: [PATCH 11/11] qmake: don't build it in configure, but allow to build
+Subject: [PATCH 12/12] qmake: don't build it in configure, but allow to build
  it separately
 
 * it is already built in qtbase-native, so we don't need it in configure
@@ -20,7 +20,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  2 files changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 3c0347a..a75ca11 100755
+index ca0824f..5a09ae3 100755
 --- a/configure
 +++ b/configure
 @@ -3675,7 +3675,7 @@ setBootstrapEvalVariable()
@@ -46,5 +46,5 @@ index 89d6ea5..7c605b9 100644
  VPATH += \
      ../src/corelib/global \
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtbase/0012-configure-preserve-built-qmake-and-swap-with-native-.patch b/recipes-qt/qt5/qtbase/0013-configure-preserve-built-qmake-and-swap-with-native-.patch
similarity index 81%
rename from recipes-qt/qt5/qtbase/0012-configure-preserve-built-qmake-and-swap-with-native-.patch
rename to recipes-qt/qt5/qtbase/0013-configure-preserve-built-qmake-and-swap-with-native-.patch
index 32d67db..667c9ec 100644
--- a/recipes-qt/qt5/qtbase/0012-configure-preserve-built-qmake-and-swap-with-native-.patch
+++ b/recipes-qt/qt5/qtbase/0013-configure-preserve-built-qmake-and-swap-with-native-.patch
@@ -1,7 +1,7 @@
-From bfc795c5af38731dbd18d20467e27dd710df374c Mon Sep 17 00:00:00 2001
+From 68bd66b37455f9b27b2f030948943942e12b3af1 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:22:34 -0500
-Subject: [PATCH 12/12] configure: preserve built qmake and swap with native
+Subject: [PATCH 13/13] configure: preserve built qmake and swap with native
  one
 
 Let configure script build the real qmake, but right after it's built, swap
@@ -13,7 +13,7 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/configure b/configure
-index 3c0347a..c51f785 100755
+index ca0824f..2c097c3 100755
 --- a/configure
 +++ b/configure
 @@ -3825,6 +3825,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
@@ -26,5 +26,5 @@ index 3c0347a..c51f785 100755
  echo "Running configuration tests..."
  
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
index b1e8dff..c597bce 100644
--- a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
+++ b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
@@ -1,4 +1,4 @@
-From c38b854abffbae52c118a361e49987a7623e231a Mon Sep 17 00:00:00 2001
+From fd077fa40e7750f5836a07dde4f9c65864f87c3f Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
 Date: Sun, 26 May 2013 14:26:19 +0200
 Subject: [PATCH] qmltestexample: fix link
@@ -84,5 +84,5 @@ index 1bb913e..56f2dd5 100644
  
  load(qt_tool)
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
index d12851f..f473f23 100644
--- a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
+++ b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
@@ -1,4 +1,4 @@
-From f309b1e149764a193cbfc694973083e70b5f4a7e Mon Sep 17 00:00:00 2001
+From 862ce82f7c0237b839539332c860e12c7d3c3e67 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 4 Aug 2014 19:19:05 +0200
 Subject: [PATCH] qtimageformats.pro: Make the dependencies deterministic
@@ -27,5 +27,5 @@ index 8382e5c..63d13ce 100644
  
  load(qt_parts)
 -- 
-2.0.4
+2.1.1
 
diff --git a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
index 98a77b9..c32ddaf 100644
--- a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
+++ b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
@@ -1,4 +1,4 @@
-From 8d396ebedaa9ed6d9152fb8a4f90a3ea347fdec0 Mon Sep 17 00:00:00 2001
+From f8e3c6be700907a597ae706afeec14e26103b31e Mon Sep 17 00:00:00 2001
 From: Yoann Lopes <yoann.lopes@digia.com>
 Date: Thu, 31 Oct 2013 15:06:30 +0100
 Subject: [PATCH 1/2] Initial porting effort to GStreamer 1.0.
@@ -26,7 +26,7 @@ Conflicts:
  config.tests/gstreamer_appsrc/gstreamer_appsrc.pro |  13 +-
  .../gstreamer_encodingprofiles.pro                 |  13 +-
  .../gstreamer_photography.pro                      |  15 +-
- qtmultimedia.pro                                   |  22 ++-
+ qtmultimedia.pro                                   |  25 ++-
  src/gsttools/gsttools.pro                          |  22 +--
  src/gsttools/gstvideoconnector.c                   | 199 +++++++++++++++++++--
  src/gsttools/qgstappsrc.cpp                        |  29 ++-
@@ -58,7 +58,7 @@ Conflicts:
  .../mediaplayer/qgstreamerplayerserviceplugin.cpp  |  27 ++-
  .../mediaplayer/qgstreamerplayersession.cpp        | 154 ++++++++++++++--
  .../mediaplayer/qgstreamerplayersession.h          |   9 +
- 36 files changed, 873 insertions(+), 131 deletions(-)
+ 36 files changed, 875 insertions(+), 132 deletions(-)
 
 diff --git a/config.tests/gstreamer/gstreamer.pro b/config.tests/gstreamer/gstreamer.pro
 index 02a7e34..6b9843a 100644
@@ -149,10 +149,10 @@ index 6b530cb..975991f 100644
 +LIBS += -lgstphotography-$$GST_VERSION
  
 diff --git a/qtmultimedia.pro b/qtmultimedia.pro
-index c7f093c..37f42a0 100644
+index 3cec526..109dd81 100644
 --- a/qtmultimedia.pro
 +++ b/qtmultimedia.pro
-@@ -21,10 +21,24 @@ win32 {
+@@ -17,11 +17,26 @@ win32 {
  } else {
      qtCompileTest(alsa)
      qtCompileTest(pulseaudio)
@@ -160,6 +160,7 @@ index c7f093c..37f42a0 100644
 -        qtCompileTest(gstreamer_photography)
 -        qtCompileTest(gstreamer_encodingprofiles)
 -        qtCompileTest(gstreamer_appsrc)
+-        qtCompileTest(linux_v4l)
 +    !done_config_gstreamer {
 +        gstver=1.0
 +        cache(GST_VERSION, set, gstver);
@@ -167,6 +168,7 @@ index c7f093c..37f42a0 100644
 +            qtCompileTest(gstreamer_photography)
 +            qtCompileTest(gstreamer_encodingprofiles)
 +            qtCompileTest(gstreamer_appsrc)
++            qtCompileTest(linux_v4l)
 +        } else {
 +            gstver=0.10
 +            cache(GST_VERSION, set, gstver);
@@ -176,13 +178,14 @@ index c7f093c..37f42a0 100644
 +                qtCompileTest(gstreamer_photography)
 +                qtCompileTest(gstreamer_encodingprofiles)
 +                qtCompileTest(gstreamer_appsrc)
++                qtCompileTest(linux_v4l)
 +            }
 +        }
      }
      qtCompileTest(resourcepolicy)
      qtCompileTest(gpu_vivante)
 diff --git a/src/gsttools/gsttools.pro b/src/gsttools/gsttools.pro
-index 15edd04..d252344 100644
+index 7c809a7..6b9bf5d 100644
 --- a/src/gsttools/gsttools.pro
 +++ b/src/gsttools/gsttools.pro
 @@ -2,7 +2,7 @@ TEMPLATE = lib
@@ -239,7 +242,7 @@ index 15edd04..d252344 100644
 +    LIBS_PRIVATE += -lgstapp-$$GST_VERSION
  }
  
- HEADERS += $$PRIVATE_HEADERS
+ config_linux_v4l: DEFINES += USE_V4L
 diff --git a/src/gsttools/gstvideoconnector.c b/src/gsttools/gstvideoconnector.c
 index 3e08fe5..ff3f9a3 100644
 --- a/src/gsttools/gstvideoconnector.c
@@ -1698,10 +1701,10 @@ index 9f1a765..dd6bd02 100644
      if (m_duration != duration) {
          m_duration = duration;
 diff --git a/src/plugins/gstreamer/camerabin/camerabinsession.cpp b/src/plugins/gstreamer/camerabin/camerabinsession.cpp
-index 6e3448f..0dbf848 100644
+index a835b1c..6bd3682 100644
 --- a/src/plugins/gstreamer/camerabin/camerabinsession.cpp
 +++ b/src/plugins/gstreamer/camerabin/camerabinsession.cpp
-@@ -726,7 +726,11 @@ qint64 CameraBinSession::duration() const
+@@ -731,7 +731,11 @@ qint64 CameraBinSession::duration() const
      GstFormat   format = GST_FORMAT_TIME;
      gint64      duration = 0;
  
@@ -1713,7 +1716,7 @@ index 6e3448f..0dbf848 100644
          return duration / 1000000;
      else
          return 0;
-@@ -759,8 +763,13 @@ void CameraBinSession::setMetaData(const QMap<QByteArray, QVariant> &data)
+@@ -764,8 +768,13 @@ void CameraBinSession::setMetaData(const QMap<QByteArray, QVariant> &data)
  
      if (m_camerabin) {
          GstIterator *elements = gst_bin_iterate_all_by_interface(GST_BIN(m_camerabin), GST_TYPE_TAG_SETTER);
@@ -1727,7 +1730,7 @@ index 6e3448f..0dbf848 100644
              gst_tag_setter_reset_tags(GST_TAG_SETTER(element));
  
              QMapIterator<QByteArray, QVariant> it(data);
-@@ -821,7 +830,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
+@@ -826,7 +835,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
  
      if (gm && GST_MESSAGE_TYPE(gm) == GST_MESSAGE_ELEMENT) {
          if (m_captureMode == QCamera::CaptureStillImage &&
@@ -1739,7 +1742,7 @@ index 6e3448f..0dbf848 100644
              st = gst_message_get_structure(gm);
  
              if (gst_structure_has_field_typed(st, "buffer", GST_TYPE_BUFFER)) {
-@@ -831,7 +844,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
+@@ -836,7 +849,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
  
                      QImage img;
  
@@ -1751,7 +1754,7 @@ index 6e3448f..0dbf848 100644
                      if (caps) {
                          GstStructure *structure = gst_caps_get_structure(caps, 0);
                          gint width = 0;
-@@ -1103,7 +1120,11 @@ QList< QPair<int,int> > CameraBinSession::supportedFrameRates(const QSize &frame
+@@ -1109,7 +1126,11 @@ QList< QPair<int,int> > CameraBinSession::supportedFrameRates(const QSize &frame
          gst_structure_remove_all_fields(structure);
          gst_structure_set_value(structure, "framerate", &rate);
      }
@@ -1763,7 +1766,7 @@ index 6e3448f..0dbf848 100644
  
  
      for (uint i=0; i<gst_caps_get_size(caps); i++) {
-@@ -1223,7 +1244,11 @@ QList<QSize> CameraBinSession::supportedResolutions(QPair<int,int> rate,
+@@ -1229,7 +1250,11 @@ QList<QSize> CameraBinSession::supportedResolutions(QPair<int,int> rate,
          gst_structure_set_value(structure, "width", &w);
          gst_structure_set_value(structure, "height", &h);
      }
@@ -1833,10 +1836,10 @@ index 7649010..fce55ac 100644
  
  OTHER_FILES += \
 diff --git a/src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp b/src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp
-index 518a66b..0c99502 100644
+index b9114c6..97d9203 100644
 --- a/src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp
 +++ b/src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp
-@@ -504,6 +504,11 @@ GstElement *QGstreamerCaptureSession::buildImageCapture()
+@@ -506,6 +506,11 @@ GstElement *QGstreamerCaptureSession::buildImageCapture()
      gst_pad_add_buffer_probe(pad, G_CALLBACK(passImageFilter), this);
      gst_object_unref(GST_OBJECT(pad));
  
@@ -1858,7 +1861,7 @@ index 2ca9377..b986fc7 100644
      mediaplayer.json
 -
 diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayercontrol.cpp b/src/plugins/gstreamer/mediaplayer/qgstreamerplayercontrol.cpp
-index ff99aa3..f9de6a7 100644
+index 99c471b..deec236 100644
 --- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayercontrol.cpp
 +++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayercontrol.cpp
 @@ -527,6 +527,8 @@ void QGstreamerPlayerControl::processEOS()
@@ -2374,5 +2377,5 @@ index 23e7031..707779b 100644
  
  QT_END_NAMESPACE
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtmultimedia/0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch b/recipes-qt/qt5/qtmultimedia/0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch
index f0a9611..23c400c 100644
--- a/recipes-qt/qt5/qtmultimedia/0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch
+++ b/recipes-qt/qt5/qtmultimedia/0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch
@@ -1,4 +1,4 @@
-From 8d0358d4d586daece0e683ba002fbab16fd53cd1 Mon Sep 17 00:00:00 2001
+From 5b6ff7fc6a102c9dc00ba947efbe000f34addbd5 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 5 Jul 2014 09:10:02 +0200
 Subject: [PATCH 2/2] qtmultimedia.pro: Respect
@@ -6,11 +6,11 @@ Subject: [PATCH 2/2] qtmultimedia.pro: Respect
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- qtmultimedia.pro | 19 +++++++++++--------
- 1 file changed, 11 insertions(+), 8 deletions(-)
+ qtmultimedia.pro | 21 ++++++++++++---------
+ 1 file changed, 12 insertions(+), 9 deletions(-)
 
 diff --git a/qtmultimedia.pro b/qtmultimedia.pro
-index 37f42a0..5a2a533 100644
+index 109dd81..54b67a8 100644
 --- a/qtmultimedia.pro
 +++ b/qtmultimedia.pro
 @@ -1,7 +1,7 @@
@@ -22,7 +22,7 @@ index 37f42a0..5a2a533 100644
  win32 {
      qtCompileTest(directshow) {
          qtCompileTest(wshellitem)
-@@ -22,13 +22,16 @@ win32 {
+@@ -18,14 +18,17 @@ win32 {
      qtCompileTest(alsa)
      qtCompileTest(pulseaudio)
      !done_config_gstreamer {
@@ -32,6 +32,7 @@ index 37f42a0..5a2a533 100644
 -            qtCompileTest(gstreamer_photography)
 -            qtCompileTest(gstreamer_encodingprofiles)
 -            qtCompileTest(gstreamer_appsrc)
+-            qtCompileTest(linux_v4l)
 -        } else {
 +        OE_GSTREAMER_ENABLED {
 +            gstver=1.0
@@ -40,6 +41,7 @@ index 37f42a0..5a2a533 100644
 +                qtCompileTest(gstreamer_photography)
 +                qtCompileTest(gstreamer_encodingprofiles)
 +                qtCompileTest(gstreamer_appsrc)
++                qtCompileTest(linux_v4l)
 +            }
 +        }
 +        !OE_GSTREAMER_ENABLED:OE_GSTREAMER010_ENABLED {
@@ -47,5 +49,5 @@ index 37f42a0..5a2a533 100644
              cache(GST_VERSION, set, gstver);
              # Force a re-run of the test
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
index e668edd..5cebe25 100644
--- a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
+++ b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
@@ -1,4 +1,4 @@
-From f4eb217f9b706a13e7f8256b8540970cfc78d805 Mon Sep 17 00:00:00 2001
+From 7bd3f1feea0ec1121a73faa1214e72702954b317 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.jansa@gmail.com>
 Date: Wed, 11 Sep 2013 18:30:08 +0200
 Subject: [PATCH 1/3] Allow to build only lrelease + lupdate + lconvert
@@ -150,5 +150,5 @@ index c3acfe3..f2f88f7 100644
  installed_cmake.depends = cmake
  
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
index 042605c..d25904e 100644
--- a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
+++ b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
@@ -1,4 +1,4 @@
-From 2b9829a4aa1379a69343371991a81b3769ac7dec Mon Sep 17 00:00:00 2001
+From a74f00b2a64dde326a78f7523f875d7e14ee45f5 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 17 Jan 2014 14:33:19 +0100
 Subject: [PATCH 2/3] assistant/help: fix linking of dependent libraries
@@ -28,5 +28,5 @@ index 168d23d..a9c3b59 100644
 +
 +LIBS += -lQt5CLucene
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
index fa3ac1a..98a0bc6 100644
--- a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
@@ -1,4 +1,4 @@
-From 6bb257d69ba7ac93b2b11aae35e0a523785d94ad Mon Sep 17 00:00:00 2001
+From 7388296f5219725801aeb9d8b0a2f4ba01a7ca6d Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
 Subject: [PATCH 3/3] add noqtwebkit configuration
@@ -47,5 +47,5 @@ index 500a153..b60fa2d 100644
  win32: qtHaveModule(axcontainer): SUBDIRS += activeqt
  qtHaveModule(quickwidgets): SUBDIRS += qquickwidget
 -- 
-2.0.4
+2.1.1
 
diff --git a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
index 1fac95b..e224e55 100644
--- a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
+++ b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
@@ -1,4 +1,4 @@
-From 761367755efa529c41ba414521eaed0b10873d99 Mon Sep 17 00:00:00 2001
+From fd79724a05ee7fb52d8ac1b02057e7a1ba4efb14 Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Fri, 19 Jul 2013 13:35:14 +0000
 Subject: [PATCH] Install the qtwaylandscanner tool to the native side
@@ -11,7 +11,7 @@ Signed-off-by: Simon Busch <morphis@gravedo.de>
  1 file changed, 6 insertions(+), 2 deletions(-)
 
 diff --git a/src/qtwaylandscanner/qtwaylandscanner.pro b/src/qtwaylandscanner/qtwaylandscanner.pro
-index ac2d07b..53b93f9 100644
+index ac2d07b..7a46a24 100644
 --- a/src/qtwaylandscanner/qtwaylandscanner.pro
 +++ b/src/qtwaylandscanner/qtwaylandscanner.pro
 @@ -1,6 +1,10 @@
@@ -28,5 +28,5 @@ index ac2d07b..53b93f9 100644
 +target.path = $$[QT_HOST_BINS]
 +INSTALLS += target
 -- 
-1.8.1.2
+2.1.1
 
diff --git a/recipes-qt/qt5/qtwayland/0001-examples.pro-include-server-buffer-only-when-buildin.patch b/recipes-qt/qt5/qtwayland/0001-examples.pro-include-server-buffer-only-when-buildin.patch
index 998f8b6..1b46f9b 100644
--- a/recipes-qt/qt5/qtwayland/0001-examples.pro-include-server-buffer-only-when-buildin.patch
+++ b/recipes-qt/qt5/qtwayland/0001-examples.pro-include-server-buffer-only-when-buildin.patch
@@ -1,4 +1,4 @@
-From 201b36614907584a0d446975bddbb11a495540ed Mon Sep 17 00:00:00 2001
+From 6e554b116bfe57744a3de02370fd96b9ea13ecb2 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 22 Feb 2014 17:47:44 +0100
 Subject: [PATCH] examples.pro: include server-buffer only when building with
@@ -14,10 +14,10 @@ Change-Id: I8412dfd4ebb95c147328ac6e4dfff14a0cff4e78
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/examples/examples.pro b/examples/examples.pro
-index 2d4cd1b..fb2497e 100644
+index d633fb9..643c7cd 100644
 --- a/examples/examples.pro
 +++ b/examples/examples.pro
-@@ -13,5 +13,7 @@ contains(CONFIG, wayland-compositor) {
+@@ -9,5 +9,7 @@ contains(CONFIG, wayland-compositor) {
          SUBDIRS += qml-compositor
      }
  
@@ -27,5 +27,5 @@ index 2d4cd1b..fb2497e 100644
 +    }
  }
 -- 
-1.8.5.3
+2.1.1
 
diff --git a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
index 07e4436..4073319 100644
--- a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
+++ b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
@@ -1,4 +1,4 @@
-From 89c132829d1a93d662f617c2a7be75c5e6eaa33a Mon Sep 17 00:00:00 2001
+From fe714df9641286e3f005e0021e1c6462fb0b061e Mon Sep 17 00:00:00 2001
 From: Trevor Woerner <trevor.woerner@linaro.org>
 Date: Fri, 7 Feb 2014 04:07:17 +0100
 Subject: [PATCH] qtwebkit: fix QA issue (bad RPATH)
@@ -14,11 +14,11 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/Tools/qmake/mkspecs/features/unix/default_post.prf b/Tools/qmake/mkspecs/features/unix/default_post.prf
-index 79b7208..6dff72b 100644
+index 75df1c5..5d9a4d2 100644
 --- a/Tools/qmake/mkspecs/features/unix/default_post.prf
 +++ b/Tools/qmake/mkspecs/features/unix/default_post.prf
-@@ -58,8 +58,6 @@ linux-*g++* {
-     QMAKE_OBJECTIVE_CFLAGS += -Wno-c++11-extensions -Wno-c++0x-extensions
+@@ -56,8 +56,6 @@ linux-*g++* {
+     }
  }
  
 -contains(TEMPLATE, app): CONFIG += rpath
@@ -27,5 +27,5 @@ index 79b7208..6dff72b 100644
      # Make ld not cache the symbol tables of input files in memory to avoid memory exhaustion during the linking phase.
      !force_static_libs_as_shared:config_gnuld: QMAKE_LFLAGS += -Wl,--no-keep-memory
 -- 
-1.8.5.3
+2.1.1
 
-- 
2.1.1


