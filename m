Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3F63F75E80
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 10:01:30 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so9797408wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 03:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=m3j/BfC82hvPXo7wBGSFfLxcV8iFsNh/TLL6TmtRjT8=;
	b=H6sPgWszWecBwBc8ueKzGT19Dnj7A6maRGO7/fY//NJmMx5bKiO1st1Zearf+fF9O2
	IzoFi0hOJdRAVWBmbM5yKCYwln1E7LP5Gu56+vD8wWHbe0P8smFoH8404wXn00OPaotN
	zgvU/bk5rNre0j64QijT7aEawrotts7bU3w6J3VIJg22gNJJgQY6jL8OUsy1MUcpEDpU
	tdPwy6hfJQJFcB0iU5lTgQekYTBDyCy/ICoxojtzGwqC/vIUDKfHSu9APmVC4W3m6jjx
	VqjuhnaKVzNPk25R90b0WQCghVmZ/nHY+OXyQGL7SCTdT7beGgE9VWy/emSmhVV21xv3
	T//w==
X-Received: by 10.180.211.239 with SMTP id nf15mr3457626wic.13.1440496890794; 
	Tue, 25 Aug 2015 03:01:30 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id r8sm1821305wik.16.2015.08.25.03.01.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Aug 2015 03:01:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Aug 2015 12:01:33 +0200
Message-Id: <1440496893-4190-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <CA+chaQeiPNcWQ+DHByrdnYAG6tj0eW+r_zwfBVms5H_ZX6mHSw@mail.gmail.com>
References: <CA+chaQeiPNcWQ+DHByrdnYAG6tj0eW+r_zwfBVms5H_ZX6mHSw@mail.gmail.com>
Subject: [meta-qt5][PATCHv3] qtbase: Fix build with clang
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
X-List-Received-Date: Tue, 25 Aug 2015 10:01:33 -0000

From: Khem Raj <raj.khem@gmail.com>

This patch is a backport from upstream qt5 fixes building with clang
from meta-clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |   7 +-
 recipes-qt/qt5/qtbase-native_git.bb                |   5 +-
 recipes-qt/qt5/qtbase/0008-Always-build-uic.patch  |  31 -----
 .../qt5/qtbase/0008-Fix-build-with-clang-3.7.patch |  72 +++++++++++
 ...-build-it-in-configure-but-allow-to-build.patch |  68 -----------
 ...external-hostbindir-option-for-native-sdk.patch | 134 ---------------------
 recipes-qt/qt5/qtbase/0009-Always-build-uic.patch  |  31 +++++
 ...Invert-conditional-for-defining-QT_SOCKLE.patch |  36 ------
 ...-build-it-in-configure-but-allow-to-build.patch |  68 +++++++++++
 ...external-hostbindir-option-for-native-sdk.patch | 134 +++++++++++++++++++++
 ...reserve-built-qmake-and-swap-with-native-.patch |  30 -----
 ...Invert-conditional-for-defining-QT_SOCKLE.patch |  36 ++++++
 ...reserve-built-qmake-and-swap-with-native-.patch |  30 +++++
 recipes-qt/qt5/qtbase_git.bb                       |   5 +-
 14 files changed, 381 insertions(+), 306 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtbase/0008-Always-build-uic.patch
 create mode 100644 recipes-qt/qt5/qtbase/0008-Fix-build-with-clang-3.7.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0008-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0009-Add-external-hostbindir-option-for-native-sdk.patch
 create mode 100644 recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0009-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
 create mode 100644 recipes-qt/qt5/qtbase/0009-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
 create mode 100644 recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0010-configure-preserve-built-qmake-and-swap-with-native-.patch
 create mode 100644 recipes-qt/qt5/qtbase/0010-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
 create mode 100644 recipes-qt/qt5/qtbase/0011-configure-preserve-built-qmake-and-swap-with-native-.patch

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 28e6d09..320cad6 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -28,17 +28,18 @@ SRC_URI += "\
     file://0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
     file://0006-configure-bump-path-length-from-256-to-512-character.patch \
     file://0007-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0008-Fix-build-with-clang-3.7.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
-    file://0008-Always-build-uic.patch \
-    file://0009-Add-external-hostbindir-option-for-native-sdk.patch \
+    file://0009-Always-build-uic.patch \
+    file://0010-Add-external-hostbindir-option-for-native-sdk.patch \
 "
 
 # specific for nativesdk-qtbase
 SRC_URI += " \
-    file://0010-configure-preserve-built-qmake-and-swap-with-native-.patch \
+    file://0011-configure-preserve-built-qmake-and-swap-with-native-.patch \
 "
 
 # CMake's toolchain configuration of nativesdk-qtbase
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index e449b01..ac68f2b 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -24,12 +24,13 @@ SRC_URI += "\
     file://0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
     file://0006-configure-bump-path-length-from-256-to-512-character.patch \
     file://0007-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0008-Fix-build-with-clang-3.7.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
-    file://0008-Always-build-uic.patch \
-    file://0009-Add-external-hostbindir-option-for-native-sdk.patch \
+    file://0009-Always-build-uic.patch \
+    file://0010-Add-external-hostbindir-option-for-native-sdk.patch \
 "
 
 CLEANBROKEN = "1"
diff --git a/recipes-qt/qt5/qtbase/0008-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0008-Always-build-uic.patch
deleted file mode 100644
index 11e1bcb..0000000
--- a/recipes-qt/qt5/qtbase/0008-Always-build-uic.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 7159760b75cc338faee3e95d26d3aea377473681 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 16 Nov 2013 00:32:30 +0100
-Subject: [PATCH 08/10] Always build uic
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
diff --git a/recipes-qt/qt5/qtbase/0008-Fix-build-with-clang-3.7.patch b/recipes-qt/qt5/qtbase/0008-Fix-build-with-clang-3.7.patch
new file mode 100644
index 0000000..6583e80
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0008-Fix-build-with-clang-3.7.patch
@@ -0,0 +1,72 @@
+From 63111eaec5cb758d99d68a4e9ec827b79121544b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 23 Aug 2015 15:19:41 -0700
+Subject: [PATCH 08/10] Fix build with clang 3.7
+
+Nullable is a language extension in clang 3.7 (indicating whether or
+not a pointer can be null).
+http://clang.llvm.org/docs/AttributeReference.html#nullable
+Using it as a class name breaks building with this compiler
+
+Upstream-Status: Backport
+This is backport of https://codereview.qt-project.org/#/c/121545/
+
+/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/git/src/tools/qlalr/lalr.cpp:241:1: error: declaration of anonymous
+      struct must be a definition
+struct _Nullable: public std::unary_function<Name, bool>
+^
+/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/git/src/tools/qlalr/lalr.cpp:241:56: error: expected unqualified-id
+struct _Nullable: public std::unary_function<Name, bool>
+                                                       ^
+/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/git/src/tools/qlalr/lalr.cpp:303:98: error: expected expression
+          NameList::iterator nn = std::find_if (rule->rhs.begin (), rule->rhs.end (), std::not1 (_Nullable (this)));
+                                                                                                 ^
+/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/git/src/tools/qlalr/lalr.cpp:638:107: error: expected expression
+                  NameList::iterator first_not_nullable = std::find_if (dot, rule->rhs.end (), std::not1 (_Nullable (this)));
+                                                                                                          ^
+4 errors generated.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/tools/qlalr/lalr.cpp | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/tools/qlalr/lalr.cpp b/src/tools/qlalr/lalr.cpp
+index 3d0d5de..3d780cd 100644
+--- a/src/tools/qlalr/lalr.cpp
++++ b/src/tools/qlalr/lalr.cpp
+@@ -238,11 +238,11 @@ void Grammar::buildExtendedGrammar ()
+   non_terminals.insert (accept_symbol);
+ }
+ 
+-struct _Nullable: public std::unary_function<Name, bool>
++struct Nullable: public std::unary_function<Name, bool>
+ {
+   Automaton *_M_automaton;
+ 
+-  _Nullable (Automaton *aut):
++  Nullable (Automaton *aut):
+     _M_automaton (aut) {}
+ 
+   bool operator () (Name name) const
+@@ -300,7 +300,7 @@ void Automaton::buildNullables ()
+ 
+       for (RulePointer rule = _M_grammar->rules.begin (); rule != _M_grammar->rules.end (); ++rule)
+         {
+-          NameList::iterator nn = std::find_if (rule->rhs.begin (), rule->rhs.end (), std::not1 (_Nullable (this)));
++          NameList::iterator nn = std::find_if (rule->rhs.begin (), rule->rhs.end (), std::not1 (Nullable (this)));
+ 
+           if (nn == rule->rhs.end ())
+             changed |= nullables.insert (rule->lhs).second;
+@@ -635,7 +635,7 @@ void Automaton::buildIncludesDigraph ()
+                   if (! _M_grammar->isNonTerminal (*A))
+                     continue;
+ 
+-                  NameList::iterator first_not_nullable = std::find_if (dot, rule->rhs.end (), std::not1 (_Nullable (this)));
++                  NameList::iterator first_not_nullable = std::find_if (dot, rule->rhs.end (), std::not1 (Nullable (this)));
+                   if (first_not_nullable != rule->rhs.end ())
+                     continue;
+ 
+-- 
+2.5.0
+
diff --git a/recipes-qt/qt5/qtbase/0008-qmake-don-t-build-it-in-configure-but-allow-to-build.patch b/recipes-qt/qt5/qtbase/0008-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
deleted file mode 100644
index ef8fcb2..0000000
--- a/recipes-qt/qt5/qtbase/0008-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 890df28110c254022682b38f78bbbea1d62b8081 Mon Sep 17 00:00:00 2001
-From: Michael Krelin <hacker@klever.net>
-Date: Mon, 29 Oct 2012 20:07:49 -0700
-Subject: [PATCH 8/9] qmake: don't build it in configure, but allow to build it
- separately
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
diff --git a/recipes-qt/qt5/qtbase/0009-Add-external-hostbindir-option-for-native-sdk.patch b/recipes-qt/qt5/qtbase/0009-Add-external-hostbindir-option-for-native-sdk.patch
deleted file mode 100644
index 59b6728..0000000
--- a/recipes-qt/qt5/qtbase/0009-Add-external-hostbindir-option-for-native-sdk.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-From a48e2ad5bef673e9d345d5d6de94e5bbda53fa2b Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH 09/10] Add -external-hostbindir option for native(sdk)
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
diff --git a/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
new file mode 100644
index 0000000..59266f4
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
@@ -0,0 +1,31 @@
+From c6a58549ef110a31960fca80f6d3dcdcf4d9176a Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 16 Nov 2013 00:32:30 +0100
+Subject: [PATCH 09/11] Always build uic
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
+index b4d62aa..5e19215 100644
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
+2.5.0
+
diff --git a/recipes-qt/qt5/qtbase/0009-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch b/recipes-qt/qt5/qtbase/0009-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
deleted file mode 100644
index 3be238b..0000000
--- a/recipes-qt/qt5/qtbase/0009-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 168bf7753c648e7599ab9967501e74373037f5e9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 8 Jun 2015 13:59:25 -0700
-Subject: [PATCH 9/9] linux-oe-g++: Invert conditional for defining
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
diff --git a/recipes-qt/qt5/qtbase/0009-qmake-don-t-build-it-in-configure-but-allow-to-build.patch b/recipes-qt/qt5/qtbase/0009-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
new file mode 100644
index 0000000..8521327
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0009-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
@@ -0,0 +1,68 @@
+From 744fc89cd56387cac613534adc538900ed133b25 Mon Sep 17 00:00:00 2001
+From: Michael Krelin <hacker@klever.net>
+Date: Mon, 29 Oct 2012 20:07:49 -0700
+Subject: [PATCH 09/10] qmake: don't build it in configure, but allow to build
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
+index b8f1fb9..c72b8ee 100755
+--- a/configure
++++ b/configure
+@@ -3929,7 +3929,7 @@ setBootstrapEvalVariable()
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
+2.5.0
+
diff --git a/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch b/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch
new file mode 100644
index 0000000..4e770ee
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch
@@ -0,0 +1,134 @@
+From b0ab57e1f0781b73830514ddc498f38da0886d15 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 6 Apr 2013 13:15:07 +0200
+Subject: [PATCH 10/11] Add -external-hostbindir option for native(sdk)
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
+index b8f1fb9..1d2157f 100755
+--- a/configure
++++ b/configure
+@@ -3833,6 +3833,7 @@ addConfStr "$CFG_SYSROOT"
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
+index f663c88..675bd4c 100644
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
+2.5.0
+
diff --git a/recipes-qt/qt5/qtbase/0010-configure-preserve-built-qmake-and-swap-with-native-.patch b/recipes-qt/qt5/qtbase/0010-configure-preserve-built-qmake-and-swap-with-native-.patch
deleted file mode 100644
index 109c7d1..0000000
--- a/recipes-qt/qt5/qtbase/0010-configure-preserve-built-qmake-and-swap-with-native-.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From ee09941be5f00409029497b65358f8b8d3db91de Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Mon, 11 Nov 2013 20:22:34 -0500
-Subject: [PATCH 10/10] configure: preserve built qmake and swap with native
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
diff --git a/recipes-qt/qt5/qtbase/0010-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch b/recipes-qt/qt5/qtbase/0010-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
new file mode 100644
index 0000000..0069a17
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0010-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
@@ -0,0 +1,36 @@
+From bae2c6afb951d1352845ca257fdc2389f3fe851e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 8 Jun 2015 13:59:25 -0700
+Subject: [PATCH 10/10] linux-oe-g++: Invert conditional for defining
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
+2.5.0
+
diff --git a/recipes-qt/qt5/qtbase/0011-configure-preserve-built-qmake-and-swap-with-native-.patch b/recipes-qt/qt5/qtbase/0011-configure-preserve-built-qmake-and-swap-with-native-.patch
new file mode 100644
index 0000000..1bfe825
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0011-configure-preserve-built-qmake-and-swap-with-native-.patch
@@ -0,0 +1,30 @@
+From cef1ac9fa399ad5c57480de26a1ef441414f125c Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Mon, 11 Nov 2013 20:22:34 -0500
+Subject: [PATCH 11/11] configure: preserve built qmake and swap with native
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
+index 1d2157f..bea14af 100755
+--- a/configure
++++ b/configure
+@@ -4099,6 +4099,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+         echo "Done."
+     fi
+ fi # Build qmake
++mv "$outpath/bin/qmake" "$outpath/bin/qmake-real"
++mv "$outpath/bin/qmake-native" "$outpath/bin/qmake"
+ 
+ echo "Running configuration tests..."
+ 
+-- 
+2.5.0
+
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index e1d208d..0d3f685 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -18,12 +18,13 @@ SRC_URI += "\
     file://0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
     file://0006-configure-bump-path-length-from-256-to-512-character.patch \
     file://0007-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0008-Fix-build-with-clang-3.7.patch \
 "
 
 # specific for target qtbase
 SRC_URI += "\
-    file://0008-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
-    file://0009-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
+    file://0009-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
+    file://0010-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
 "
 
 DEPENDS += "qtbase-native"
-- 
2.5.0


