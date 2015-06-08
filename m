Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9245673F7F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jun 2015 21:39:16 +0000 (UTC)
Received: by igblz2 with SMTP id lz2so2623668igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jun 2015 14:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=QeokNNAXIABC0d+MJpXrRK0PQH5qm4VBuR9gVbaKpCM=;
	b=wQA+wDTB3M6Ydi5qiyhYw2NUJb/WwwsgeV/8R1veOlH/Dx5iGfem6NTrVHUTtoZB2y
	amTKx8H8xso0MHLYz5cg+L1O9l8jwwm+oeFyP3lHhXciTpbCOV9aBI/poM1LrF6vHnGe
	Yi0G4cC2xcJto/PWwXOOvJK1v4duYyuMUWjtGPqNDaJyTxMGGwzrf5ckELWBcSyMxEPP
	CeLeFbbTYrvsWgurmbiyRVhhti+UxDrjKdZXsneHSJKjz39KulO8weE9OMsw3483zaZD
	KNgmYlgaOcYokqwILgUywYdYMsavzhb5icMNX6HZMWdUIpEQGQIEtuRQpBVx7FitLYaF
	HRNw==
X-Received: by 10.50.44.99 with SMTP id d3mr16046175igm.10.1433799556843;
	Mon, 08 Jun 2015 14:39:16 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id j20sm1212128igt.16.2015.06.08.14.39.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Jun 2015 14:39:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Jun 2015 14:39:08 -0700
Message-Id: <1433799548-15328-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-qt5][PATCH 1/2 V2] qtbase: Fix build with musl
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
X-List-Received-Date: Mon, 08 Jun 2015 21:39:18 -0000

This is a generic fix to accomodate musl which is adhering to posix
and doesnt have legacy to carry, so lets invert the conditional so the
special legacy case of glibc is checked and else part then covers rest
of cases which are newer glibc/uclibc and musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Invert-conditional-for-defining-QT_SOCKLE.patch | 35 ++++++++++++++++++++++
 recipes-qt/qt5/qtbase_git.bb                       |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase/0014-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch

diff --git a/recipes-qt/qt5/qtbase/0014-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch b/recipes-qt/qt5/qtbase/0014-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
new file mode 100644
index 0000000..dee8b35
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0014-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
@@ -0,0 +1,35 @@
+From 8f09897de948cea8861ca95e182f442cf15a339e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 8 Jun 2015 13:59:25 -0700
+Subject: [PATCH] linux-oe-g++: Invert conditional for defining QT_SOCKLEN_T
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
+2.1.4
+
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index ec6ea17..33620cb 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -21,6 +21,7 @@ SRC_URI += "\
     file://0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
     file://0009-QOpenGLPaintDevice-sub-area-support.patch \
     file://0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch \
+    file://0014-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
 "
  
 # specific for qtbase
-- 
2.1.4


