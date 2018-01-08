Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0701078976
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jan 2018 05:54:16 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id g130so14371359wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Jan 2018 21:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SfFmplofWS1oGfMtEd2+HNGFfntG7NBUMeZDWQrj4ZQ=;
	b=NN3dy4M3PpPduJRgZERyIQ4bcdc9gZ5pfBrmOjhB5EuRA4RAZULmH/VOBsxxU5LrDs
	RmC6z2142VFI2UyqApUVKk40fDt2mNWFCQLzUpX63MVgIbGifdj+e97/bbg8lhorxNgK
	AA1SQ9OUttjTco/W5u1N4bp3FR6cWxgAexwDOEFL+Qls9SqRxhV3h8ib1xu7Kq5bIzKs
	HjY3TFu6nBjpoI5PPh6YT2bROXUWBnpA1zrpvOa1QAZ0huqtGeuErr5+nNJw2FxMdgWy
	z3u0j+yLUjNLq1B14XnRBnbXQJHUU/iXAra1uHr4SjZeQim3qHBqcMmSyTG2n4v8ySD4
	iTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SfFmplofWS1oGfMtEd2+HNGFfntG7NBUMeZDWQrj4ZQ=;
	b=NBhfrHKC8tqzku+rmh2TgXxPfEYSZxUlZjLPC4CUTPudV9zRouPuXdfQ2/1S2+tt3l
	2oBZhNjBq/AUIgHYy/zkKUE+/qeD3Znky8U+1NlRaLkbRQdYyfF5gdNm/TdKq8K60Whn
	PhKe730JdfOsVMyTjqXPy9noYh45vY3ezJAgBW+YgBLRxj9D0nvteNmfzRlqHLcpsqY6
	ruXx8UklQitgFBVkNQE/2o48u/Lh4px69dx33QjHBBSduGtYYf0uPC2V51fRMk1cxhUI
	35Hfz17pSNj8v2K87YfFV26NMF0lWuOFemt0/5u0ogAx9khFuzuy3l53cq2TEGd/hRVn
	Pjlw==
X-Gm-Message-State: AKGB3mJ+3XWvqnuudMnH2LLXgpRckp7rR9tVx+yEbfEcFVfWafxDfM4J
	7Di7Qq8KajDK5+Bl+guDYBQUmoqVJfQ=
X-Google-Smtp-Source: ACJfBosoqqw9qIqHIg9tJboDxXl2bWH/xOUchtEzQ/Zmg+5e8kXd5I2pK+omU6NjGCziUSFdAG6pBw==
X-Received: by 10.80.203.135 with SMTP id k7mr15315738edi.69.1515390857616;
	Sun, 07 Jan 2018 21:54:17 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([111.207.81.199]) by smtp.gmail.com with ESMTPSA id
	e46sm7344354edb.93.2018.01.07.21.54.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 07 Jan 2018 21:54:17 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Jan 2018 06:52:07 +0100
Message-Id: <1515390727-15579-3-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515390727-15579-1-git-send-email-liu.ming50@gmail.com>
References: <1515390727-15579-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-qt5][PATCH 2/2] meta: fix a regression
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
X-List-Received-Date: Mon, 08 Jan 2018 05:54:17 -0000

From: Ming Liu <liu.ming50@gmail.com>

A flaw was introduced by commit b8a236df:
[ qt5: Fix cmake config files ]

Removing ${S}/include must be done before configure script being
called, but it's not in that case for qtbase-native recipe after
the commit, that is saying, ${S}/include was removed after configure
being called, which causes compiling issues for native build.

Further more, the logic introduced by commit b8a236df should only apply
to qtbase recipes, so they should be moved to qtbase recipes as well.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb | 5 +++++
 recipes-qt/qt5/qt5-native.inc          | 7 -------
 recipes-qt/qt5/qt5.inc                 | 7 -------
 recipes-qt/qt5/qtbase-native_git.bb    | 5 +++++
 recipes-qt/qt5/qtbase_git.bb           | 5 +++++
 5 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 3aeb2ab..4f4a0c3 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -102,6 +102,11 @@ OE_QMAKE_PATH_HOST_LIBS = "${libdir}"
 deltask generate_qt_config_file
 
 do_configure() {
+    # Regenerate header files when they are included in source tarball
+    # Otherwise cmake files don't set PRIVATE_HEADERS correctly
+    rm -rf ${S}/include
+    mkdir -p ${S}/.git || true
+
     ${S}/configure -v \
         -${QT_EDITION} -confirm-license \
         -sysroot ${STAGING_DIR_TARGET} \
diff --git a/recipes-qt/qt5/qt5-native.inc b/recipes-qt/qt5/qt5-native.inc
index 8535028..7681602 100644
--- a/recipes-qt/qt5/qt5-native.inc
+++ b/recipes-qt/qt5/qt5-native.inc
@@ -10,10 +10,3 @@ OE_QMAKE_PATH_DOCS = "${OE_QMAKE_PATH_QT_DOCS}"
 OE_QMAKE_PATH_SETTINGS = "${OE_QMAKE_PATH_QT_SETTINGS}"
 OE_QMAKE_PATH_EXAMPLES = "${OE_QMAKE_PATH_QT_EXAMPLES}"
 OE_QMAKE_PATH_TESTS = "${OE_QMAKE_PATH_QT_TESTS}"
-
-# Regenerate header files when they are included in source tarball
-# Otherwise cmake files don't set PRIVATE_HEADERS correctly
-do_configure_prepend() {
-    rm -rf ${S}/include
-    mkdir -p ${S}/.git || true
-}
diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index 4b5fe8a..95e3854 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -35,13 +35,6 @@ python __anonymous() {
             d.setVar("PACKAGE_ARCH", tarch)
 }
 
-# Regenerate header files when they are included in source tarball
-# Otherwise cmake files don't set PRIVATE_HEADERS correctly
-do_configure_prepend() {
-    rm -rf ${S}/include
-    mkdir -p ${S}/.git || true
-}
-
 # Many examples come with libraries installed outside of standard libdir,
 # suppress QA check complaining
 INSANE_SKIP_${PN}-dbg += "libdir"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 597b45e..7c76c25 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -100,6 +100,11 @@ PACKAGECONFIG_CONFARGS = " \
 deltask generate_qt_config_file
 
 do_configure_prepend() {
+    # Regenerate header files when they are included in source tarball
+    # Otherwise cmake files don't set PRIVATE_HEADERS correctly
+    rm -rf ${S}/include
+    mkdir -p ${S}/.git || true
+
     # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-device-extra.pri: No such file or directory"
     touch ${S}/mkspecs/oe-device-extra.pri
 
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index e2784d8..7047f6c 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -167,6 +167,11 @@ XPLATFORM_toolchain-clang = "linux-oe-clang"
 XPLATFORM ?= "linux-oe-g++"
 
 do_configure() {
+    # Regenerate header files when they are included in source tarball
+    # Otherwise cmake files don't set PRIVATE_HEADERS correctly
+    rm -rf ${S}/include
+    mkdir -p ${S}/.git || true
+
     # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-device-extra.pri: No such file or directory" during configuration
     touch ${S}/mkspecs/oe-device-extra.pri
 
-- 
2.7.4


