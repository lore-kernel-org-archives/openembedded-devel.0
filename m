Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id BBDEF6FB75
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jun 2014 22:08:56 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id n15so4345378wiw.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jun 2014 15:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=xaf2Y23bF1DfT0oKSYJIZuxwI3Tq2+H4HBpllXX/Pys=;
	b=QWO6TdVdA1786j9qXgpW1AMN9JrQ9ko1+/7CzokzVkMHbSMfXyaO1ICgn/OyeddU+B
	TDVY5yyix5HL0i3XJEb5NkInrK9zbAhqXX4MhHxSo/8VKai7+uOpxrauG9e35HTwj2n1
	vSIY1UBbfhWv7yfuuqj/N5SzyWTMVRmLB5xL68gfkL+1Ze6M/ozvTGJxxoXXJjKJx+fA
	FuaPb3vtxD7/FbNW4GTwcTCeVK63Q3dYuZeRW0zjsB0DI16xpFl00bQnDrjag4g/xZTA
	4T1/gbSZi/36yXEOc6rywdn2oE1ZZyl2VbpnfmfauDuH4AVCVEN9HsVq4FTJZlPxPprB
	gU7Q==
X-Received: by 10.15.49.8 with SMTP id i8mr278773eew.33.1402006137777;
	Thu, 05 Jun 2014 15:08:57 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m44sm17721022eeh.14.2014.06.05.15.08.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jun 2014 15:08:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Jun 2014 00:08:58 +0200
Message-Id: <1402006139-27614-9-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1402006139-27614-1-git-send-email-Martin.Jansa@gmail.com>
References: <1401875817-30867-1-git-send-email-Martin.Jansa@gmail.com>
	<1402006139-27614-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCHv2 09/10] qtbase: Refresh patches to match with stable* branches on github.com/meta-qt5
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
X-List-Received-Date: Thu, 05 Jun 2014 22:08:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb             | 23 +++---
 .../qtbase-git/0001-Add-linux-oe-g-platform.patch  |  4 +-
 ...-allow-to-set-qt.conf-from-the-outside-u.patch} |  8 +--
 ...h => 0003-Add-external-hostbindir-option.patch} | 10 +--
 ...p-Prefix-default-LIBDIRS-and-INCDIRS-with.patch |  4 +-
 ...le-Fix-pkgconfig-and-libtool-replacements.patch | 81 ++++++++++++++++++++++
 ...fs-Print-the-chosen-config-in-debug-mode.patch} |  4 +-
 ...integration-Undefine-CursorShape-from-X..patch} |  4 +-
 ...ump-path-length-from-256-to-512-character.patch |  6 +-
 ...l-error-for-platforms-only-supporting-on.patch} |  4 +-
 ...0-Revert-Use-the-gcc-feature-in-simd.prf.patch} |  7 +-
 ...build-uic.patch => 0011-Always-build-uic.patch} |  4 +-
 ...build-it-in-configure-but-allow-to-build.patch} |  8 +--
 ...eserve-built-qmake-and-swap-with-native-.patch} |  7 +-
 recipes-qt/qt5/qtbase-native_git.bb                | 20 +++---
 recipes-qt/qt5/qtbase_git.bb                       | 24 ++++---
 16 files changed, 153 insertions(+), 65 deletions(-)
 rename recipes-qt/qt5/qtbase-git/{0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch => 0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch} (87%)
 rename recipes-qt/qt5/qtbase-git/{0002-Add-external-hostbindir-option.patch => 0003-Add-external-hostbindir-option.patch} (97%)
 create mode 100644 recipes-qt/qt5/qtbase-git/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
 rename recipes-qt/qt5/qtbase-git/{0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch => 0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch} (93%)
 rename recipes-qt/qt5/qtbase-git/{0008-qeglplatformintegration-Undefine-CursorShape-from-X..patch => 0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch} (87%)
 rename recipes-qt/qt5/qtbase-git/{0007-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch => 0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch} (94%)
 rename recipes-qt/qt5/qtbase-git/{0001-Revert-Use-the-gcc-feature-in-simd.prf.patch => 0010-Revert-Use-the-gcc-feature-in-simd.prf.patch} (74%)
 rename recipes-qt/qt5/qtbase-git/{0006-Always-build-uic.patch => 0011-Always-build-uic.patch} (88%)
 rename recipes-qt/qt5/qtbase-git/{0006-qmake-don-t-build-it-in-configure-but-allow-to-build.patch => 0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch} (86%)
 rename recipes-qt/qt5/qtbase-git/{0007-configure-preserve-built-qmake-and-swap-with-native-.patch => 0012-configure-preserve-built-qmake-and-swap-with-native-.patch} (80%)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 7c45693..252cada 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -8,25 +8,28 @@ SRC_URI = "\
     git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
 "
 
-# common with -native
+# common with -native and -nativesdk
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
-    file://0002-Add-external-hostbindir-option.patch \
-    file://0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
+    file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
+    file://0003-Add-external-hostbindir-option.patch \
     file://0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch \
-    file://0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
-    file://0001-Revert-Use-the-gcc-feature-in-simd.prf.patch \
+    file://0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
+    file://0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
+    file://0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
+    file://0008-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
+    file://0010-Revert-Use-the-gcc-feature-in-simd.prf.patch \
 "
 
-# common with native version
+# common with -native version
 SRC_URI += " \
-    file://0006-Always-build-uic.patch \
+    file://0011-Always-build-uic.patch \
 "    
 
 # specific for nativesdk version
 SRC_URI += " \
-    file://0007-configure-preserve-built-qmake-and-swap-with-native-.patch \
-    file://0008-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0012-configure-preserve-built-qmake-and-swap-with-native-.patch \
 "
 
-SRCREV = "267ba8b63e0fbf02cde4d2709397ed0e12f34ee2"
+SRCREV = "80b6fbc2d9dfc753d6570e971aa4cf4f3420585c"
diff --git a/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
index 95841ce..eca6b36 100644
--- a/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
@@ -1,7 +1,7 @@
-From e70bd40730582e5e5531fca51a1574cb306c40d3 Mon Sep 17 00:00:00 2001
+From 9c7d71880c6ec5b07e3030b7c7a23e004d5c60a2 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
-Subject: [PATCH 1/8] Add linux-oe-g++ platform
+Subject: [PATCH 01/12] Add linux-oe-g++ platform
 
 * This qmake.conf unlike other platforms reads most variables from
   shell environment, because it's easier for qt recipes to export
diff --git a/recipes-qt/qt5/qtbase-git/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
similarity index 87%
rename from recipes-qt/qt5/qtbase-git/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
rename to recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index 4b4e47c..29f788e 100644
--- a/recipes-qt/qt5/qtbase-git/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,8 +1,8 @@
-From b76b34a03c3051cda5330c8ae9f5e2a26c5c4da6 Mon Sep 17 00:00:00 2001
+From ad884ab378939e685a3b00af03bb6875d9bdc1d5 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
-Subject: [PATCH 3/8] qlibraryinfo: allow to set qt.conf from the outside using
- the environment
+Subject: [PATCH 02/12] qlibraryinfo: allow to set qt.conf from the outside
+ using the environment
 
 Allow to set a qt.conf from the outside using the environment. This allows
 to inject new prefixes and other paths into qmake. This is needed when using
@@ -19,7 +19,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 3686b17..89e13cf 100644
+index 6d25325..80e0f30 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
 @@ -153,7 +153,10 @@ QLibrarySettings::QLibrarySettings()
diff --git a/recipes-qt/qt5/qtbase-git/0002-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
similarity index 97%
rename from recipes-qt/qt5/qtbase-git/0002-Add-external-hostbindir-option.patch
rename to recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
index 81f1867..44d17ca 100644
--- a/recipes-qt/qt5/qtbase-git/0002-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
@@ -1,7 +1,7 @@
-From eaa4a4c13e65e29e2214a01b69b77b9c6f2ada05 Mon Sep 17 00:00:00 2001
+From b45d963702c139ea4f5b5ce572d046511a878d81 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH 2/8] Add -external-hostbindir option
+Subject: [PATCH 03/12] Add -external-hostbindir option
 
 * when cross-compiling it's sometimes useful to use existing tools from machine
   (or in OpenEmbedded built with separate native recipe) when building for target
@@ -198,10 +198,10 @@ index 9bda70e..6e3605a 100644
      _qt5_Core_check_file_exists(${imported_location})
  
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 6d25325..3686b17 100644
+index 80e0f30..89e13cf 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -333,7 +333,7 @@ QLibraryInfo::isDebugBuild()
+@@ -336,7 +336,7 @@ QLibraryInfo::isDebugBuild()
   */
  
  static const struct {
@@ -210,7 +210,7 @@ index 6d25325..3686b17 100644
  } qtConfEntries[] = {
      { "Prefix", "." },
      { "Documentation", "doc" }, // should be ${Data}/doc
-@@ -359,6 +359,7 @@ static const struct {
+@@ -362,6 +362,7 @@ static const struct {
      { "HostBinaries", "bin" },
      { "HostLibraries", "lib" },
      { "HostData", "." },
diff --git a/recipes-qt/qt5/qtbase-git/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch b/recipes-qt/qt5/qtbase-git/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
index 1e5ffac..78fb3c6 100644
--- a/recipes-qt/qt5/qtbase-git/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
+++ b/recipes-qt/qt5/qtbase-git/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
@@ -1,7 +1,7 @@
-From 83205b1344e57e2cb0292cf1d276e40c7f45ca32 Mon Sep 17 00:00:00 2001
+From 8a14a69d5b0078554ed002e682c72e995b1e6320 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 22:33:33 +0200
-Subject: [PATCH 4/8] configureapp: Prefix default LIBDIRS and INCDIRS with
+Subject: [PATCH 04/12] configureapp: Prefix default LIBDIRS and INCDIRS with
  SYSROOT
 
 Upstream-Status: Pending
diff --git a/recipes-qt/qt5/qtbase-git/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase-git/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
new file mode 100644
index 0000000..29108cd
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-git/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -0,0 +1,81 @@
+From 1e87c127c5d268870c51894c955bf24cde83ff69 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 27 Apr 2013 23:15:37 +0200
+Subject: [PATCH 05/12] qt_module: Fix pkgconfig and libtool replacements
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* in situation like this:
+  QT_SYSROOT:/OE/oe-core/tmp-eglibc/sysroots/qemuarm
+  QT_INSTALL_LIBS:/OE/oe-core/tmp-eglibc/sysroots/qemuarm/usr/lib
+  QT_INSTALL_LIBS/raw:/usr/lib
+  QT_INSTALL_LIBS/get:/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtbase/5.0.0-r0.0/build/lib
+
+  I don't want the replacement like this:
+  sed
+    -e "s,/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtbase/5.0.0-r0.0/build/include,/usr/include/qt5,g"
+    -e "s,/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtbase/5.0.0-r0.0/build/lib,/usr/lib,g"
+    "../../lib/pkgconfig/Qt5Core.pc"
+    >"/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtbase/5.0.0-r0.0/image/OE/oe-core/tmp-eglibc/sysroots/qemuarm/usr/lib/pkgconfig/Qt5Core.pc"
+  because that way I'll end with -L/usr/lib in .pc file which is
+  cross-compile unfriendly, keeping ${libdir}/${includedir} works better
+  in my case
+
+* qt_module: Fix paths in .prl files
+* qmake does not prefix them with QT_SYSROOT when using them
+  so e.g. when building qtdeclarative we get -L/usr/lib to LINKAGE
+  variable, which is unsafe for cross-compilation
+* writting QT_SYSROOT in .prl files is dangerous for sstate when
+  builds are in different directories, so we need
+  SSTATE_SCAN_FILES += "*.pri *.prl"
+  to make them relocateble
+
+* fix paths in packageconfig files
+  This reverts parts of:
+
+  enable path replacement in installed prl files on all platforms
+
+  Task-number: QTBUG-33794
+  Change-Id: Id0d38715673b8a1c0c034e9c15783eb255c4315b
+  Reviewed-by: Joerg Bornemann <joerg.bornemann@digia.com>
+
+Change-Id: Ie1c94b15f2a4e736b65b4d0924d99eb2a7d92a6c
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ mkspecs/features/qt_module.prf | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_module.prf
+index 8bf4c92..9737f8c 100644
+--- a/mkspecs/features/qt_module.prf
++++ b/mkspecs/features/qt_module.prf
+@@ -188,10 +188,24 @@ unix|mingw {
+         QMAKE_PKGCONFIG_DESCRIPTION = $$replace(TARGET, ^Qt, "Qt ") module
+     QMAKE_PKGCONFIG_INSTALL_REPLACE += lib_replace
+ 
++    pkgconfig_include_replace.match = $$rplbase/include
++    pkgconfig_include_replace.replace = "\$$\\{includedir}"
++    pkgconfig_include_replace.CONFIG = path
++    QMAKE_PKGCONFIG_INSTALL_REPLACE += pkgconfig_include_replace
++
++    pkgconfig_lib_replace.match = $$rplbase/lib
++    pkgconfig_lib_replace.replace = "\$$\\{libdir}"
++    pkgconfig_lib_replace.CONFIG = path
++    QMAKE_PKGCONFIG_INSTALL_REPLACE += pkgconfig_lib_replace
++
+     unix {
+         CONFIG += create_libtool explicitlib
+         QMAKE_LIBTOOL_LIBDIR = $$qt_libdir
+         QMAKE_LIBTOOL_INSTALL_REPLACE += lib_replace
++        lafile_replace.match = "-L$$[QT_INSTALL_LIBS/raw]"
++        lafile_replace.replace = ""
++        lafile_replace.CONFIG = path
++        QMAKE_LIBTOOL_INSTALL_REPLACE += lafile_replace
+     }
+ }
+ 
+-- 
+2.0.0
+
diff --git a/recipes-qt/qt5/qtbase-git/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch b/recipes-qt/qt5/qtbase-git/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
similarity index 93%
rename from recipes-qt/qt5/qtbase-git/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
rename to recipes-qt/qt5/qtbase-git/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
index 213a9c3..0e3bc99 100644
--- a/recipes-qt/qt5/qtbase-git/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
+++ b/recipes-qt/qt5/qtbase-git/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
@@ -1,7 +1,7 @@
-From 22775e5f0b1097964062fbcf1805a841f971de34 Mon Sep 17 00:00:00 2001
+From ca212fd10a95b2c694f3c89c3f22a2b0ae185198 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 21 Apr 2014 19:22:04 +0200
-Subject: [PATCH 5/8] Revert "eglfs: Print the chosen config in debug mode"
+Subject: [PATCH 06/12] Revert "eglfs: Print the chosen config in debug mode"
 
 This reverts commit dc685cf6331f5fb46285cf10d6464c2ecf41f73e.
 ---
diff --git a/recipes-qt/qt5/qtbase-git/0008-qeglplatformintegration-Undefine-CursorShape-from-X..patch b/recipes-qt/qt5/qtbase-git/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
similarity index 87%
rename from recipes-qt/qt5/qtbase-git/0008-qeglplatformintegration-Undefine-CursorShape-from-X..patch
rename to recipes-qt/qt5/qtbase-git/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
index 2f4d80c..1f029a2 100644
--- a/recipes-qt/qt5/qtbase-git/0008-qeglplatformintegration-Undefine-CursorShape-from-X..patch
+++ b/recipes-qt/qt5/qtbase-git/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
@@ -1,7 +1,7 @@
-From 959b2fb8d8eb5e755e3d9d3d3031b996f96fb23b Mon Sep 17 00:00:00 2001
+From 3d61189d1706d3367eada4e7db6f2c6c167130ce Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 19 Mar 2014 18:32:28 +0100
-Subject: [PATCH 8/8] qeglplatformintegration: Undefine CursorShape from X.h
+Subject: [PATCH 07/12] qeglplatformintegration: Undefine CursorShape from X.h
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
diff --git a/recipes-qt/qt5/qtbase-git/0008-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase-git/0008-configure-bump-path-length-from-256-to-512-character.patch
index e5a3890..b1c4690 100644
--- a/recipes-qt/qt5/qtbase-git/0008-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase-git/0008-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,7 +1,7 @@
-From 3eabdee39cad37a4ce451486fce20680f169a0f1 Mon Sep 17 00:00:00 2001
+From 107fe67947ced65315550e6a7795be24efaab371 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:27:30 -0500
-Subject: [PATCH 8/8] configure: bump path length from 256 to 512 characters
+Subject: [PATCH 08/12] configure: bump path length from 256 to 512 characters
 
 Increase the path length that gets hardcoded into generated config.cpp file
 from 256 to 512 characters, as nativesdk path can be quite long.
@@ -12,7 +12,7 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index b7aac15..c51f785 100755
+index 48d5119..3c0347a 100755
 --- a/configure
 +++ b/configure
 @@ -3573,7 +3573,7 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
diff --git a/recipes-qt/qt5/qtbase-git/0007-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch b/recipes-qt/qt5/qtbase-git/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
similarity index 94%
rename from recipes-qt/qt5/qtbase-git/0007-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
rename to recipes-qt/qt5/qtbase-git/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
index f8a789c..cbd0bcd 100644
--- a/recipes-qt/qt5/qtbase-git/0007-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
+++ b/recipes-qt/qt5/qtbase-git/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
@@ -1,7 +1,7 @@
-From cc8bd33740ee16b29e0801dbc2228314ef3cef2f Mon Sep 17 00:00:00 2001
+From b8f2fdcd7683058554b5d76b270c5f4bb3d0b91a Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 5 Feb 2014 18:35:08 +0100
-Subject: [PATCH 7/8] eglfs: fix egl error for platforms only supporting one
+Subject: [PATCH 09/12] eglfs: fix egl error for platforms only supporting one
  window/surface
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
diff --git a/recipes-qt/qt5/qtbase-git/0001-Revert-Use-the-gcc-feature-in-simd.prf.patch b/recipes-qt/qt5/qtbase-git/0010-Revert-Use-the-gcc-feature-in-simd.prf.patch
similarity index 74%
rename from recipes-qt/qt5/qtbase-git/0001-Revert-Use-the-gcc-feature-in-simd.prf.patch
rename to recipes-qt/qt5/qtbase-git/0010-Revert-Use-the-gcc-feature-in-simd.prf.patch
index 88f5c12..da05f28 100644
--- a/recipes-qt/qt5/qtbase-git/0001-Revert-Use-the-gcc-feature-in-simd.prf.patch
+++ b/recipes-qt/qt5/qtbase-git/0010-Revert-Use-the-gcc-feature-in-simd.prf.patch
@@ -1,10 +1,7 @@
-From 9d33599f12787f85a19e8147604f919ac40c02c1 Mon Sep 17 00:00:00 2001
+From 8d8db9db8518289f4c1856dd3062c2e324c5c9be Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 4 Jun 2014 15:26:11 +0200
-Subject: [PATCH] Revert "Use the "gcc" feature in simd.prf"
-
-It's causing linker issues, see my comment in:
-https://bugreports.qt-project.org/browse/QTBUG-38544
+Subject: [PATCH 10/12] Revert "Use the "gcc" feature in simd.prf"
 
 This reverts commit 3b00cc480400d47c59c29d3507c7fcdc9be2a489.
 ---
diff --git a/recipes-qt/qt5/qtbase-git/0006-Always-build-uic.patch b/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch
similarity index 88%
rename from recipes-qt/qt5/qtbase-git/0006-Always-build-uic.patch
rename to recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch
index f425c3e..a1af18e 100644
--- a/recipes-qt/qt5/qtbase-git/0006-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch
@@ -1,7 +1,7 @@
-From dd679f743291a924bed500a866eb05fab71c9978 Mon Sep 17 00:00:00 2001
+From 271db04ebfbaf67e2e8c30ff050510c5a42acfa4 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
-Subject: [PATCH 6/8] Always build uic
+Subject: [PATCH 11/12] Always build uic
 
 Even if we are not building gui or widgets. This tool is needed later
 as a native tool when compiling the target.
diff --git a/recipes-qt/qt5/qtbase-git/0006-qmake-don-t-build-it-in-configure-but-allow-to-build.patch b/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
similarity index 86%
rename from recipes-qt/qt5/qtbase-git/0006-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
rename to recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
index 6d79acb..820fb21 100644
--- a/recipes-qt/qt5/qtbase-git/0006-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
+++ b/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
@@ -1,8 +1,8 @@
-From d8e725cb2c25a443d888fe2652f9039e79ae75ac Mon Sep 17 00:00:00 2001
+From ac507c953112630d7e929be35586e97396b76327 Mon Sep 17 00:00:00 2001
 From: Michael Krelin <hacker@klever.net>
 Date: Mon, 29 Oct 2012 20:07:49 -0700
-Subject: [PATCH 6/8] qmake: don't build it in configure, but allow to build it
- separately
+Subject: [PATCH 11/11] qmake: don't build it in configure, but allow to build
+ it separately
 
 * it is already built in qtbase-native, so we don't need it in configure
 * allow building a separate qmake for the target
@@ -20,7 +20,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  2 files changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 48d5119..2a42c08 100755
+index 3c0347a..a75ca11 100755
 --- a/configure
 +++ b/configure
 @@ -3675,7 +3675,7 @@ setBootstrapEvalVariable()
diff --git a/recipes-qt/qt5/qtbase-git/0007-configure-preserve-built-qmake-and-swap-with-native-.patch b/recipes-qt/qt5/qtbase-git/0012-configure-preserve-built-qmake-and-swap-with-native-.patch
similarity index 80%
rename from recipes-qt/qt5/qtbase-git/0007-configure-preserve-built-qmake-and-swap-with-native-.patch
rename to recipes-qt/qt5/qtbase-git/0012-configure-preserve-built-qmake-and-swap-with-native-.patch
index 79ac5e8..81b05f3 100644
--- a/recipes-qt/qt5/qtbase-git/0007-configure-preserve-built-qmake-and-swap-with-native-.patch
+++ b/recipes-qt/qt5/qtbase-git/0012-configure-preserve-built-qmake-and-swap-with-native-.patch
@@ -1,7 +1,8 @@
-From 3db5991e607a82403272b0ea821fc84e3c8b6d2a Mon Sep 17 00:00:00 2001
+From 11bd34bfe629767ec32a36593386ef0655e86f24 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:22:34 -0500
-Subject: [PATCH 7/8] configure: preserve built qmake and swap with native one
+Subject: [PATCH 12/12] configure: preserve built qmake and swap with native
+ one
 
 Let configure script build the real qmake, but right after it's built, swap
 it with a native qmake for further internal use, preserving the real one.
@@ -12,7 +13,7 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/configure b/configure
-index 48d5119..b7aac15 100755
+index 3c0347a..c51f785 100755
 --- a/configure
 +++ b/configure
 @@ -3825,6 +3825,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index e10748f..7965292 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -5,19 +5,23 @@ SRC_URI = "\
     git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
 "
 
-# common with -native
+# common with -native and -nativesdk
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
-    file://0002-Add-external-hostbindir-option.patch \
-    file://0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
+    file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
+    file://0003-Add-external-hostbindir-option.patch \
     file://0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch \
-    file://0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
-    file://0001-Revert-Use-the-gcc-feature-in-simd.prf.patch \
+    file://0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
+    file://0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
+    file://0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
+    file://0008-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
+    file://0010-Revert-Use-the-gcc-feature-in-simd.prf.patch \
 "
 
-# specific for native version
+# common with -nativesdk version
 SRC_URI += " \
-    file://0006-Always-build-uic.patch \
+    file://0011-Always-build-uic.patch \
 "
 
 do_install_append() {
@@ -26,4 +30,4 @@ do_install_append() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "267ba8b63e0fbf02cde4d2709397ed0e12f34ee2"
+SRCREV = "80b6fbc2d9dfc753d6570e971aa4cf4f3420585c"
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 4f019be..037a4f6 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -5,21 +5,23 @@ SRC_URI = "\
     git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
 "
 
-# common with -native
-SRC_URI += "\
+# common with -native and -nativesdk
+SRC_URI += "\  
     file://0001-Add-linux-oe-g-platform.patch \
-    file://0002-Add-external-hostbindir-option.patch \
-    file://0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
+    file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
+    file://0003-Add-external-hostbindir-option.patch \
     file://0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch \
-    file://0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
-    file://0001-Revert-Use-the-gcc-feature-in-simd.prf.patch \
+    file://0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
+    file://0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
+    file://0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
+    file://0008-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
+    file://0010-Revert-Use-the-gcc-feature-in-simd.prf.patch \
 "
-
+ 
 # target specific
 SRC_URI += "\
-    file://0006-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
-    file://0007-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
-    file://0008-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
+    file://0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
 "
 
-SRCREV = "267ba8b63e0fbf02cde4d2709397ed0e12f34ee2"
+SRCREV = "80b6fbc2d9dfc753d6570e971aa4cf4f3420585c"
-- 
2.0.0


