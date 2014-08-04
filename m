Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id CAB3860438
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Aug 2014 17:24:10 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id t60so8071472wes.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Aug 2014 10:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=us73u7726hIgjaQ4IGacXM7BeF4+VTG2AWuouIqr3mY=;
	b=yT8ZlmEg5ESdBlEObxwp/Ng1nwskIMs1zBSeEGj4lUwJKMm5QwORAySp/Qrx2CI7fR
	h92HbDLIuKAtecLMV41YuKSrk8Glpgavg86u+HGW3LDI4/QoYoC168iXsOEUoZ64IgMc
	RNXse8ryOhmEjrnXEAx77rTzzvBoAzXRpgBwPtLg/y/l7+FebddUW3m0rmTbjhMveN5Q
	lPqYg1KSgFG1Ac4kJsMB+Hz8j41DsFjQ7tr9JAVAMdpvrUjlncwbbLyYysz0JcSMWfIZ
	50bdrwXltz2hTgFu8SEj2yvjKMN/sGw/Za1wPtBQS6AZB1U8M/xyCHI9ff+5lab6tRLh
	mRug==
X-Received: by 10.180.189.4 with SMTP id ge4mr32014633wic.25.1407173047923;
	Mon, 04 Aug 2014 10:24:07 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ca8sm44934611wjc.0.2014.08.04.10.24.06 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Aug 2014 10:24:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Aug 2014 19:24:32 +0200
Message-Id: <1407173072-3558-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [meta-qt5][PATCH] qtimageformats: Make the dependencies deterministic
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
X-List-Received-Date: Mon, 04 Aug 2014 17:24:17 -0000

* jasper and libwebp were autodetected from sysroot

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtimageformats.inc                  | 16 ++++++++++-
 ...ats.pro-Make-the-dependencies-determinist.patch | 31 ++++++++++++++++++++++
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch

diff --git a/recipes-qt/qt5/qtimageformats.inc b/recipes-qt/qt5/qtimageformats.inc
index b5edf1b..9306070 100644
--- a/recipes-qt/qt5/qtimageformats.inc
+++ b/recipes-qt/qt5/qtimageformats.inc
@@ -1,8 +1,22 @@
 require qt5.inc
 
-DEPENDS += "qtbase tiff"
+DEPENDS += "qtbase"
 ALLOW_EMPTY_${PN} = "1"
 
+SRC_URI += "file://0001-qtimageformats.pro-Make-the-dependencies-determinist.patch"
+
+PACKAGECONFIG ?= "libtiff"
+# Currently we don't have recipe for libmng, but lock it anyway so qtimageformats stay deterministic even when libmng is introduced
+PACKAGECONFIG[jasper] = ",,jasper"
+PACKAGECONFIG[libmng] = ",,libmng"
+PACKAGECONFIG[libtiff] = ",,tiff"
+PACKAGECONFIG[libwebp] = ",,libwebp"
+
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libmng', 'CONFIG+=OE_LIBMNG_ENABLED', '', d)}"
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'jasper', 'CONFIG+=OE_JASPER_ENABLED', '', d)}"
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libtiff', 'CONFIG+=OE_LIBTIFF_ENABLED', '', d)}"
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libwebp', 'CONFIG+=OE_LIBWEBP_ENABLED', '', d)}"
+
 # older copyright year than what e.g. qtbase is using now
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
                     file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
diff --git a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
new file mode 100644
index 0000000..d12851f
--- /dev/null
+++ b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
@@ -0,0 +1,31 @@
+From f309b1e149764a193cbfc694973083e70b5f4a7e Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Mon, 4 Aug 2014 19:19:05 +0200
+Subject: [PATCH] qtimageformats.pro: Make the dependencies deterministic
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ qtimageformats.pro | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/qtimageformats.pro b/qtimageformats.pro
+index 8382e5c..63d13ce 100644
+--- a/qtimageformats.pro
++++ b/qtimageformats.pro
+@@ -1,9 +1,9 @@
+ requires(qtHaveModule(gui))
+ 
+ load(configure)
+-qtCompileTest(jasper)
+-qtCompileTest(libmng)
+-qtCompileTest(libtiff)
+-qtCompileTest(libwebp)
++OE_JASPER_ENABLED:qtCompileTest(jasper)
++OE_LIBMNG_ENABLED:qtCompileTest(libmng)
++OE_LIBTIFF_ENABLED:qtCompileTest(libtiff)
++OE_LIBWEBP_ENABLED:qtCompileTest(libwebp)
+ 
+ load(qt_parts)
+-- 
+2.0.4
+
-- 
2.0.4


