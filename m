Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7F59C766B2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2015 13:37:59 +0000 (UTC)
Received: by wicfv8 with SMTP id fv8so28998961wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2015 05:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iLsk0JpUTl400bJ3xz5ypj2d/qwPJXY5nfyJBN2yvEA=;
	b=hPfnqEx95cmBaOz5MyhyzHt3nce0zwWYMzw7o2GuD35Xfs0yRE976ZYZY1MRRD6PXf
	maOXYhljRFiAToDPhr5OV+R5BzKEVp7lRR943qXvqfrd05x+gRyBs0YfeTOCPNt722Ro
	6tiv9A8Vzfhj3Hoe7o6HgESI5YsQwa2jB57gNjo4G9KQ1tunFLQ+R2JE+4Wot/Y/ZQ8E
	//524HQaZTNE+9/yNqOix6ztF4U4O9glfYE2sQqfsTY2ZwvypXiUGb+LixYLl9R5seLw
	PZIWAI21WlwpmY7i6TcebJJ21NlaUVzRzRaJzWtgE2g95JLpSOi+b3siAvcHDejQSXuR
	YTJw==
X-Received: by 10.194.78.109 with SMTP id a13mr14889037wjx.20.1446817079155;
	Fri, 06 Nov 2015 05:37:59 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id pc2sm213007wjb.11.2015.11.06.05.37.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Nov 2015 05:37:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Nov 2015 14:38:07 +0100
Message-Id: <1446817092-9386-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1446817092-9386-1-git-send-email-Martin.Jansa@gmail.com>
References: <1446817092-9386-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-qt5 2/7] qtwebengine: bump SRCREV and re-add 0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
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
X-List-Received-Date: Fri, 06 Nov 2015 13:38:01 -0000

* it's still needed, just somewhere else a bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...rf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch |  2 +-
 ...rf-Make-sure-we-only-use-the-file-name-to.patch |  2 +-
 ...s.prf-allow-build-for-linux-oe-g-platform.patch | 27 ++++++++++++++++++++++
 recipes-qt/qt5/qtwebengine_git.bb                  |  3 ++-
 4 files changed, 31 insertions(+), 3 deletions(-)
 create mode 100644 recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch

diff --git a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
index 3249f83..ce76afa 100644
--- a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
@@ -1,7 +1,7 @@
 From 38efc016f223a1277bd3a92e4c78ac816adbcdaa Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 30 Jun 2014 20:08:17 +0200
-Subject: [PATCH 1/2] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
+Subject: [PATCH 1/3] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
  anywhere in path, but at the end
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
diff --git a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
index 4224d32..f2dcaed 100644
--- a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
@@ -1,7 +1,7 @@
 From ebfec8ca32379bffd18cbab1f4335a458fcc7e41 Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Tue, 18 Nov 2014 10:38:18 +0100
-Subject: [PATCH 2/2] functions.prf: Make sure we only use the file name to
+Subject: [PATCH 2/3] functions.prf: Make sure we only use the file name to
  generate it's moc'ed abbreviation
 
 Signed-off-by: Simon Busch <morphis@gravedo.de>
diff --git a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
new file mode 100644
index 0000000..a3ea02a
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
@@ -0,0 +1,27 @@
+From daf1deee393576f86b22178a7cc18717962cb68e Mon Sep 17 00:00:00 2001
+From: Frieder Schrempf <frieder.schrempf@online.de>
+Date: Mon, 1 Dec 2014 14:34:40 +0000
+Subject: [PATCH 3/3] functions.prf: allow build for linux-oe-g++ platform
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Frieder Schrempf <frieder.schrempf@online.de>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ tools/qmake/mkspecs/features/functions.prf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
+index f761b64..ab5f018 100644
+--- a/tools/qmake/mkspecs/features/functions.prf
++++ b/tools/qmake/mkspecs/features/functions.prf
+@@ -1,5 +1,5 @@
+ defineTest(isPlatformSupported) {
+-  !linux-g++*:!linux-clang:!win32-msvc2013*:!win32-msvc2015*:!macx-clang*:!boot2qt {
++  !linux-g++*:!linux-oe-g++*:!linux-clang:!win32-msvc2013*:!win32-msvc2015*:!macx-clang*:!boot2qt {
+     skipBuild("Qt WebEngine can currently only be built for Linux (GCC/clang), Windows (MSVC 2013 or 2015), OS X (10.9/XCode 5.1+) or Qt for Device Creation.")
+     return(false)
+   }
+-- 
+2.6.2
+
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index b8269b8..0b2c756 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -77,9 +77,10 @@ SRC_URI += " \
     ${QT_GIT}/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};destsuffix=git/src/3rdparty \
     file://0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
     file://0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch \
+    file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
     file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch \
 "
-SRCREV_qtwebengine = "cfee452174c58fe4048b1604503d03de2764fc8e"
+SRCREV_qtwebengine = "40ef43e0d69c4a86c9430b7f264d2cde6340ee0f"
 SRCREV_chromium = "ec5b3304fc266dfdec7666b8b73d57a3971ea35f"
 SRCREV = "${SRCREV_qtwebengine}"
 
-- 
2.6.2


