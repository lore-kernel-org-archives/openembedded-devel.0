Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id B843172491
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 20:56:21 +0000 (UTC)
Received: by wghl2 with SMTP id l2so22745306wgh.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 12:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wMW1RxK9JPDP3oLw3cvOAyJeXtPg33qndXElmrA7YRg=;
	b=NBWUYUEDsx3FORH5/Gz86m40TyUPk1nwtiOOH3nVdc36FWQwZ+mQzgdh7yrpF/Fvxm
	C9TyAHlasLTsSHOmh97G3wukm9tvaAG9yGdCsmWXUf8CNOb66ELwd7qObtS4DhPdg7We
	ErmcJZQwVgIHvSjW7CwSRt9AujUJcoRAtbBxOnLAT71CAZhr1fLTMOkaq0A3xMpkUP6J
	ZrE4ADCIMTmgPLCPLtHOzj+Q/M3prucIT4WWHzCUuWUel/+WGAfRs9ddXIodCd8lEGKf
	MSyj6N3xC91ItxU8WWHiw5e/UwMQxahMjMlxT+L9Pt0tOc2aK37o09L/YNXXOYjQgukV
	nMiA==
X-Received: by 10.180.76.4 with SMTP id g4mr10269619wiw.43.1425070582926;
	Fri, 27 Feb 2015 12:56:22 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id v6sm4397984wix.8.2015.02.27.12.56.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Feb 2015 12:56:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Feb 2015 21:56:31 +0100
Message-Id: <1425070591-28158-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
In-Reply-To: <1425070591-28158-1-git-send-email-Martin.Jansa@gmail.com>
References: <1425070591-28158-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCH 7/7] qtwebengine: fix executing config tests instead of ignoring libcap test failure
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
X-List-Received-Date: Fri, 27 Feb 2015 20:56:24 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ure.prf-don-t-fail-when-libcap-test-fails.patch | 26 ----------------------
 recipes-qt/qt5/qtwebengine.inc                     | 11 ++++-----
 ...ure.prf-don-t-fail-when-libcap-test-fails.patch | 26 ----------------------
 recipes-qt/qt5/qtwebengine_5.4.1.bb                |  1 -
 recipes-qt/qt5/qtwebengine_git.bb                  |  1 -
 5 files changed, 6 insertions(+), 59 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtwebengine-git/0004-configure.prf-don-t-fail-when-libcap-test-fails.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine/0004-configure.prf-don-t-fail-when-libcap-test-fails.patch

diff --git a/recipes-qt/qt5/qtwebengine-git/0004-configure.prf-don-t-fail-when-libcap-test-fails.patch b/recipes-qt/qt5/qtwebengine-git/0004-configure.prf-don-t-fail-when-libcap-test-fails.patch
deleted file mode 100644
index 6a2162f..0000000
--- a/recipes-qt/qt5/qtwebengine-git/0004-configure.prf-don-t-fail-when-libcap-test-fails.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 7d20d5e4584abce2353557c90e79ee0b3cdc330e Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 27 Feb 2015 19:51:55 +0100
-Subject: [PATCH 4/4] configure.prf: don't fail when libcap test fails
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- tools/qmake/mkspecs/features/configure.prf | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/qmake/mkspecs/features/configure.prf b/tools/qmake/mkspecs/features/configure.prf
-index 6e74b55..b91fde8 100644
---- a/tools/qmake/mkspecs/features/configure.prf
-+++ b/tools/qmake/mkspecs/features/configure.prf
-@@ -20,7 +20,7 @@ defineTest(runConfigure) {
-         qtCompileTest($$test)
-     }
-     # libcap-dev package doesn't ship .pc files on Ubuntu.
--    linux:!config_libcap:skipBuild("libcap appears to be missing")
-+    #linux:!config_libcap:skipBuild("libcap appears to be missing")
-     contains(QT_CONFIG, xcb) {
-         for(package, $$list("libdrm xcomposite xi xrandr")) {
-             !packagesExist($$package):skipBuild("Unmet dependency: $$package")
--- 
-2.3.1
-
diff --git a/recipes-qt/qt5/qtwebengine.inc b/recipes-qt/qt5/qtwebengine.inc
index 46060c0..a9c7005 100644
--- a/recipes-qt/qt5/qtwebengine.inc
+++ b/recipes-qt/qt5/qtwebengine.inc
@@ -35,11 +35,12 @@ export NINJA_PATH="${STAGING_BINDIR_NATIVE}/ninja"
 
 do_configure() {
     # replace LD with CXX, to workaround a possible gyp inheritssue?
-    LD="${CXX}" export LD
-    CC="${CC}" export CC
-    CXX="${CXX}" export CXX
-    CC_host="gcc" export CC_host
-    CXX_host="g++" export CXX_host
+    export LD="${CXX}"
+    export CC="${CC}"
+    export CXX="${CXX}"
+    export CC_host="gcc"
+    export CXX_host="g++"
+    export QMAKE_MAKE_ARGS="${EXTRA_OEMAKE}"
 
     # qmake can't find the OE_QMAKE_* variables on it's own so directly passing them as
     # arguments here
diff --git a/recipes-qt/qt5/qtwebengine/0004-configure.prf-don-t-fail-when-libcap-test-fails.patch b/recipes-qt/qt5/qtwebengine/0004-configure.prf-don-t-fail-when-libcap-test-fails.patch
deleted file mode 100644
index 71ee4fe..0000000
--- a/recipes-qt/qt5/qtwebengine/0004-configure.prf-don-t-fail-when-libcap-test-fails.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 1306df17fccb672e95911398740d48408488035a Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 27 Feb 2015 19:51:55 +0100
-Subject: [PATCH 4/4] configure.prf: don't fail when libcap test fails
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- tools/qmake/mkspecs/features/configure.prf | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/qmake/mkspecs/features/configure.prf b/tools/qmake/mkspecs/features/configure.prf
-index 6e74b55..b91fde8 100644
---- a/tools/qmake/mkspecs/features/configure.prf
-+++ b/tools/qmake/mkspecs/features/configure.prf
-@@ -20,7 +20,7 @@ defineTest(runConfigure) {
-         qtCompileTest($$test)
-     }
-     # libcap-dev package doesn't ship .pc files on Ubuntu.
--    linux:!config_libcap:skipBuild("libcap appears to be missing")
-+    #linux:!config_libcap:skipBuild("libcap appears to be missing")
-     contains(QT_CONFIG, xcb) {
-         for(package, $$list("libdrm xcomposite xi xrandr")) {
-             !packagesExist($$package):skipBuild("Unmet dependency: $$package")
--- 
-2.3.1
-
diff --git a/recipes-qt/qt5/qtwebengine_5.4.1.bb b/recipes-qt/qt5/qtwebengine_5.4.1.bb
index 4b21f32..92e8c04 100644
--- a/recipes-qt/qt5/qtwebengine_5.4.1.bb
+++ b/recipes-qt/qt5/qtwebengine_5.4.1.bb
@@ -8,6 +8,5 @@ SRC_URI += " \
     file://0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
     file://0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch \
     file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
-    file://0004-configure.prf-don-t-fail-when-libcap-test-fails.patch \
     file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch \
 "
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 450609d..b451c37 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -9,7 +9,6 @@ SRC_URI += " \
     file://0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
     file://0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch \
     file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
-    file://0004-configure.prf-don-t-fail-when-libcap-test-fails.patch \
     file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch \
 "
 SRCREV_qtwebengine = "4eceed9ac0b646238e76d77569a619d4dc515ba5"
-- 
2.3.1


