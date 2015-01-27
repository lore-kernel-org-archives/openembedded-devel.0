Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id EDF52718E1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2015 05:54:08 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id n3so2588415wiv.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 21:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=bbOOIi94FxDnPbqNxEkxRlFxBeUGOMcc6iHi8ky8B80=;
	b=r1GRcnW1kIVDVZA80+8uQ82r/RoWvmxp05tqnamOcxDLqJXrt+qOSfx40UXKJmZAub
	0o9NXAN/NQlcx2IZo2q8s+2YF2gw0ozqckEH/jHjh3k7IUaQJCnH+yS+57ys0VW8bddG
	0/cgfbMhzbyaRCfNHp8u0BjD+oOv4XT9/7BthPGSSzIPuOVTTnDXfcZ2zpumS4uBEG/v
	XRnbfhZgAiw3ZbrZxDOrEWGv2MVSgvl+meIWLnY7YZZYphX4NVLTA9rksH2Ltm9v2w9j
	DnwDnlZdUiBZZ5ZZFIPFejgiUQTx3Gbcpujddsu1KDBAPsJyZDwDjX2NdBWeMDLc87DP
	DyEg==
X-Received: by 10.180.73.239 with SMTP id o15mr3430829wiv.14.1422338048441;
	Mon, 26 Jan 2015 21:54:08 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-254-85.hsi05.unitymediagroup.de. [176.198.254.85])
	by mx.google.com with ESMTPSA id
	gm10sm16610857wib.19.2015.01.26.21.54.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jan 2015 21:54:07 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jan 2015 06:53:50 +0100
Message-Id: <1422338033-18521-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1422338033-18521-1-git-send-email-schnitzeltony@googlemail.com>
References: <1422338033-18521-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 2/5] qtbase/EXTERNAL_HOST_BINS: split out code only required for native-(sdk)
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
X-List-Received-Date: Tue, 27 Jan 2015 05:54:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* code was moved from 0003-Add-external-hostbindir-option.patch to
  0014-Add-external-hostbindir-option-native.patch
* only native(-sdk) versions of qtbase apply
  0014-Add-external-hostbindir-option-native.patch

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/nativesdk-qtbase.inc                |   1 +
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |   1 +
 recipes-qt/qt5/qtbase-native.inc                   |   1 +
 .../0003-Add-external-hostbindir-option.patch      |  75 ---------------
 ...014-Add-external-hostbindir-option-native.patch | 106 +++++++++++++++++++++
 5 files changed, 109 insertions(+), 75 deletions(-)
 create mode 100644 recipes-qt/qt5/qtbase/0014-Add-external-hostbindir-option-native.patch

diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
index b3eab76..8a0b31a 100644
--- a/recipes-qt/qt5/nativesdk-qtbase.inc
+++ b/recipes-qt/qt5/nativesdk-qtbase.inc
@@ -27,6 +27,7 @@ SRC_URI += "\
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
     file://0011-Always-build-uic.patch \
+    file://0014-Add-external-hostbindir-option-native.patch \
 "
 
 # specific for nativesdk-qtbase
diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 1e93891..0bfa442 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -25,6 +25,7 @@ SRC_URI += "\
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
     file://0011-Always-build-uic.patch \
+    file://0014-Add-external-hostbindir-option-native.patch \
 "
 
 # specific for nativesdk-qtbase
diff --git a/recipes-qt/qt5/qtbase-native.inc b/recipes-qt/qt5/qtbase-native.inc
index 4023844..6a0191d 100644
--- a/recipes-qt/qt5/qtbase-native.inc
+++ b/recipes-qt/qt5/qtbase-native.inc
@@ -24,6 +24,7 @@ SRC_URI += "\
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
     file://0011-Always-build-uic.patch \
+    file://0014-Add-external-hostbindir-option-native.patch \
 "
 
 QT_CONF_PATH = "${B}/qt.conf"
diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
index c633ea7..87e8f0f 100644
--- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
@@ -27,14 +27,10 @@ Signed-off-by: Jonathan Liu <net147@gmail.com>
  configure                                   | 15 +++++++++++++++
  mkspecs/features/qt_functions.prf           |  6 +++++-
  mkspecs/features/qt_tool.prf                |  4 ++--
- qmake/property.cpp                          |  1 +
  qtbase.pro                                  | 13 ++++++++++---
  src/corelib/Qt5CoreConfigExtras.cmake.in    |  6 +++---
- src/corelib/global/qlibraryinfo.cpp         |  3 ++-
- src/corelib/global/qlibraryinfo.h           |  1 +
  src/dbus/Qt5DBusConfigExtras.cmake.in       |  4 ++--
  src/widgets/Qt5WidgetsConfigExtras.cmake.in |  2 +-
- tools/configure/configureapp.cpp            |  8 ++++++++
  11 files changed, 50 insertions(+), 13 deletions(-)
 
 diff --git a/configure b/configure
@@ -133,18 +129,6 @@ index 1d3e88c..9b26adf 100644
      isEmpty(MODULE):MODULE = $$TARGET
  
      !host_build|!force_bootstrap: MODULE_DEPENDS = $$replace(QT, -private$, _private)
-diff --git a/qmake/property.cpp b/qmake/property.cpp
-index 051e056..50da6ed 100644
---- a/qmake/property.cpp
-+++ b/qmake/property.cpp
-@@ -67,6 +67,7 @@ static const struct {
-     { "QT_HOST_DATA", QLibraryInfo::HostDataPath, true },
-     { "QT_HOST_BINS", QLibraryInfo::HostBinariesPath, true },
-     { "QT_HOST_LIBS", QLibraryInfo::HostLibrariesPath, true },
-+    { "QT_EXTERNAL_HOST_BINS", QLibraryInfo::ExternalHostBinariesPath, true },
-     { "QMAKE_SPEC", QLibraryInfo::HostSpecPath, true },
-     { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
- };
 diff --git a/qtbase.pro b/qtbase.pro
 index 6d0de44..ddf7478 100644
 --- a/qtbase.pro
@@ -209,39 +193,6 @@ index 9bda70e..6e3605a 100644
  !!ENDIF
      _qt5_Core_check_file_exists(${imported_location})
  
-diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index d68c51b..7191159 100644
---- a/src/corelib/global/qlibraryinfo.cpp
-+++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -349,7 +349,7 @@ QLibraryInfo::isDebugBuild()
-  */
- 
- static const struct {
--    char key[19], value[13];
-+    char key[21], value[13];
- } qtConfEntries[] = {
-     { "Prefix", "." },
-     { "Documentation", "doc" }, // should be ${Data}/doc
-@@ -375,6 +375,7 @@ static const struct {
-     { "HostBinaries", "bin" },
-     { "HostLibraries", "lib" },
-     { "HostData", "." },
-+    { "ExternalHostBinaries", "" },
-     { "TargetSpec", "" },
-     { "HostSpec", "" },
- #endif
-diff --git a/src/corelib/global/qlibraryinfo.h b/src/corelib/global/qlibraryinfo.h
-index 543c4b3..a02e03a 100644
---- a/src/corelib/global/qlibraryinfo.h
-+++ b/src/corelib/global/qlibraryinfo.h
-@@ -80,6 +80,7 @@ public:
-         HostBinariesPath,
-         HostLibrariesPath,
-         HostDataPath,
-+        ExternalHostBinariesPath,
-         TargetSpecPath,
-         HostSpecPath,
-         LastHostPath = HostSpecPath,
 diff --git a/src/dbus/Qt5DBusConfigExtras.cmake.in b/src/dbus/Qt5DBusConfigExtras.cmake.in
 index 1d94715..301af8f 100644
 --- a/src/dbus/Qt5DBusConfigExtras.cmake.in
@@ -277,32 +228,6 @@ index 99d87e2..5621dc0 100644
  !!ENDIF
      _qt5_Widgets_check_file_exists(${imported_location})
  
-diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index 92422c2..d0a62c8 100644
---- a/tools/configure/configureapp.cpp
-+++ b/tools/configure/configureapp.cpp
-@@ -1191,6 +1191,13 @@ void Configure::parseCmdLine()
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
-@@ -3995,6 +4002,7 @@ void Configure::generateQConfigCpp()
-                   << "    \"qt_hbinpath=" << formatPath(dictionary["QT_HOST_BINS"]) << "\"," << endl
-                   << "    \"qt_hlibpath=" << formatPath(dictionary["QT_HOST_LIBS"]) << "\"," << endl
-                   << "    \"qt_hdatpath=" << formatPath(dictionary["QT_HOST_DATA"]) << "\"," << endl
-+                  << "    \"qt_ebinpath=" << formatPath(dictionary["QT_EXTERNAL_HOST_BINS"]) << "\"," << endl
-                   << "    \"qt_targspec=" << targSpec << "\"," << endl
-                   << "    \"qt_hostspec=" << hostSpec << "\"," << endl
-                   << "#endif" << endl
 -- 
 2.1.3
 
diff --git a/recipes-qt/qt5/qtbase/0014-Add-external-hostbindir-option-native.patch b/recipes-qt/qt5/qtbase/0014-Add-external-hostbindir-option-native.patch
new file mode 100644
index 0000000..08a1cbd
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0014-Add-external-hostbindir-option-native.patch
@@ -0,0 +1,106 @@
+From f2d51e50a7fbdf485696d1b8b2d29e64c729c76b Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 6 Apr 2013 13:15:07 +0200
+Subject: [PATCH 03/11] Add -external-hostbindir option
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
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Simon Busch <morphis@gravedo.de>
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ qmake/property.cpp                          |  1 +
+ tools/configure/configureapp.cpp            |  8 ++++++++
+ src/corelib/global/qlibraryinfo.cpp         |  3 ++-
+ src/corelib/global/qlibraryinfo.h           |  1 +
+ 1 files changed, 50 insertions(+), 13 deletions(-)
+
+diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
+index 92422c2..d0a62c8 100644
+--- a/tools/configure/configureapp.cpp
++++ b/tools/configure/configureapp.cpp
+@@ -1191,6 +1191,13 @@ void Configure::parseCmdLine()
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
+@@ -3995,6 +4002,7 @@ void Configure::generateQConfigCpp()
+                   << "    \"qt_hbinpath=" << formatPath(dictionary["QT_HOST_BINS"]) << "\"," << endl
+                   << "    \"qt_hlibpath=" << formatPath(dictionary["QT_HOST_LIBS"]) << "\"," << endl
+                   << "    \"qt_hdatpath=" << formatPath(dictionary["QT_HOST_DATA"]) << "\"," << endl
++                  << "    \"qt_ebinpath=" << formatPath(dictionary["QT_EXTERNAL_HOST_BINS"]) << "\"," << endl
+                   << "    \"qt_targspec=" << targSpec << "\"," << endl
+                   << "    \"qt_hostspec=" << hostSpec << "\"," << endl
+                   << "#endif" << endl
+diff --git a/qmake/property.cpp b/qmake/property.cpp
+index 051e056..50da6ed 100644
+--- a/qmake/property.cpp
++++ b/qmake/property.cpp
+@@ -67,6 +67,7 @@ static const struct {
+     { "QT_HOST_DATA", QLibraryInfo::HostDataPath, true },
+     { "QT_HOST_BINS", QLibraryInfo::HostBinariesPath, true },
+     { "QT_HOST_LIBS", QLibraryInfo::HostLibrariesPath, true },
++    { "QT_EXTERNAL_HOST_BINS", QLibraryInfo::ExternalHostBinariesPath, true },
+     { "QMAKE_SPEC", QLibraryInfo::HostSpecPath, true },
+     { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
+ };
+diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
+index d68c51b..7191159 100644
+--- a/src/corelib/global/qlibraryinfo.cpp
++++ b/src/corelib/global/qlibraryinfo.cpp
+@@ -349,7 +349,7 @@ QLibraryInfo::isDebugBuild()
+  */
+ 
+ static const struct {
+-    char key[19], value[13];
++    char key[21], value[13];
+ } qtConfEntries[] = {
+     { "Prefix", "." },
+     { "Documentation", "doc" }, // should be ${Data}/doc
+@@ -375,6 +375,7 @@ static const struct {
+     { "HostBinaries", "bin" },
+     { "HostLibraries", "lib" },
+     { "HostData", "." },
++    { "ExternalHostBinaries", "" },
+     { "TargetSpec", "" },
+     { "HostSpec", "" },
+ #endif
+diff --git a/src/corelib/global/qlibraryinfo.h b/src/corelib/global/qlibraryinfo.h
+index 543c4b3..a02e03a 100644
+--- a/src/corelib/global/qlibraryinfo.h
++++ b/src/corelib/global/qlibraryinfo.h
+@@ -80,6 +80,7 @@ public:
+         HostBinariesPath,
+         HostLibrariesPath,
+         HostDataPath,
++        ExternalHostBinariesPath,
+         TargetSpecPath,
+         HostSpecPath,
+         LastHostPath = HostSpecPath,
+-- 
+2.1.3
+
-- 
1.8.3.1


