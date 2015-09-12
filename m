Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4B9AE762B4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Sep 2015 11:37:57 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so90077598wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Sep 2015 04:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=7w7tmrAkEfyO28gBr0nZTQlF0ZDI1cU5DKYNyWtofHY=;
	b=neTTLXFHUSZn1hsK6WffJCjGFBt0h4AvPCdj0Z+h7+cjrn25MwIgBVO5G3gmAc2iWM
	eaYAJEM9E0wPsfyGZ0wfpBfHhXGqHBmxr28f3jdhtLHOQzu1qod8Rv5j8T2MUA/yywrw
	eoe2XgJ03roJN2IBNCoV4mNA+mJ7mkgjQB+q67JNScGp5VpsxvLEiWt0O4tAp9wthcVp
	2XUMObeRl84u/V2SzL7wQQzpInrMsXXMb2L6tAVaVHd45FozUbrGY4BGo+nN0IjcrH6k
	hdd0T54wV79OWbwwPiVWCkaPGz8ZbTfwYOuWjj7NE4jvJmEry7hdnCNRi5SxeCabbDc5
	cKIA==
X-Received: by 10.180.221.193 with SMTP id qg1mr5654527wic.87.1442057877534;
	Sat, 12 Sep 2015 04:37:57 -0700 (PDT)
Received: from localhost.localdomain (p4FDF178C.dip0.t-ipconnect.de.
	[79.223.23.140]) by smtp.googlemail.com with ESMTPSA id
	mc18sm3867187wic.23.2015.09.12.04.37.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Sep 2015 04:37:57 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Sep 2015 13:37:43 +0200
Message-Id: <1442057863-19627-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH][meta-qt5] qtbase: fix build for PACKAGECONFIG gles2
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
X-List-Received-Date: Sat, 12 Sep 2015 11:37:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fixes:

| In file included from /home/superandy/tmp/oe-core-glibc/sysroots/varsomimx6q/usr/include/X11/Xlib.h:44:0,
|                  from /home/superandy/tmp/oe-core-glibc/sysroots/varsomimx6q/usr/include/EGL/eglvivante.h:244,
|                  from /home/superandy/tmp/oe-core-glibc/sysroots/varsomimx6q/usr/include/EGL/eglplatform.h:38,
|                  from /home/superandy/tmp/oe-core-glibc/sysroots/varsomimx6q/usr/include/EGL/egl.h:39,
|                  from /home/superandy/tmp/oe-core-glibc/work/cortexa9t2hf-vfp-neon-mx6qdl-angstrom-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/platformsupport/eglconvenience/qeglplatformscreen_p.h:52,
|                  from /home/superandy/tmp/oe-core-glibc/work/cortexa9t2hf-vfp-neon-mx6qdl-angstrom-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/platformsupport/eglconvenience/qeglplatformscreen.cpp:34:
| ../../include/QtCore/../../../git/src/corelib/io/qurl.h:131:9: error: expected identifier before numeric constant
|          None = 0x0,
|          ^

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...mscreen.cpp-reorder-headers-to-fix-build-.patch | 49 ++++++++++++++++++++++
 recipes-qt/qt5/qtbase_git.bb                       |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase/0012-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch

diff --git a/recipes-qt/qt5/qtbase/0012-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch b/recipes-qt/qt5/qtbase/0012-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch
new file mode 100644
index 0000000..a1a8791
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0012-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch
@@ -0,0 +1,49 @@
+From f8873b5ba0fa42cc0d2aadfd6c5a449b37799609 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Sat, 12 Sep 2015 12:58:46 +0200
+Subject: [PATCH] qeglplatformscreen.cpp: reorder headers to fix build with egl
+ enabled
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+fixes:
+In file included from /home/superandy/tmp/oe-core-glibc/sysroots/varsomimx6q/usr/include/X11/Xlib.h:44:0,
+                 from /home/superandy/tmp/oe-core-glibc/sysroots/varsomimx6q/usr/include/EGL/eglvivante.h:244,
+                 from /home/superandy/tmp/oe-core-glibc/sysroots/varsomimx6q/usr/include/EGL/eglplatform.h:38,
+                 from /home/superandy/tmp/oe-core-glibc/sysroots/varsomimx6q/usr/include/EGL/egl.h:39,
+                 from /home/superandy/tmp/oe-core-glibc/work/cortexa9t2hf-vfp-neon-mx6qdl-angstrom-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/platformsupport/eglconvenience/qeglplatformscreen_p.h:52,
+                 from /home/superandy/tmp/oe-core-glibc/work/cortexa9t2hf-vfp-neon-mx6qdl-angstrom-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/platformsupport/eglconvenience/qeglplatformscreen.cpp:34:
+../../include/QtCore/../../../git/src/corelib/io/qurl.h:131:9: error: expected identifier before numeric constant
+         None = 0x0,
+         ^
+
+This patch has a very limited lifetime: In branch dev and 5.6 the patched file is gone. Therefore:
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/platformsupport/eglconvenience/qeglplatformscreen.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/platformsupport/eglconvenience/qeglplatformscreen.cpp b/src/platformsupport/eglconvenience/qeglplatformscreen.cpp
+index 61f8cdd..ceec797 100644
+--- a/src/platformsupport/eglconvenience/qeglplatformscreen.cpp
++++ b/src/platformsupport/eglconvenience/qeglplatformscreen.cpp
+@@ -31,10 +31,10 @@
+ **
+ ****************************************************************************/
+ 
+-#include "qeglplatformscreen_p.h"
+-#include "qeglplatformwindow_p.h"
+ #include <QtGui/qwindow.h>
+ #include <qpa/qwindowsysteminterface.h>
++#include "qeglplatformscreen_p.h"
++#include "qeglplatformwindow_p.h"
+ #include <QtPlatformSupport/private/qopenglcompositor_p.h>
+ 
+ QT_BEGIN_NAMESPACE
+-- 
+2.1.0
+
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index f4287cc..4a073c5 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -25,6 +25,7 @@ SRC_URI += "\
 SRC_URI += "\
     file://0009-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
     file://0010-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
+    file://0012-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch \
 "
 
 DEPENDS += "qtbase-native"
-- 
2.1.0


