Return-Path: <frieder.schrempf@exceet.de>
Received: from smtp.exceet.ch (smtp.exceet.ch [77.245.33.226])
	by mail.openembedded.org (Postfix) with ESMTP id 1A39F77233
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 15:06:24 +0000 (UTC)
Received: from fs-work.fritz.box (94.216.237.169) by smtp.exceet.ch
	(172.24.58.4) with Microsoft SMTP Server (TLS) id 14.3.210.2;
	Thu, 16 Feb 2017 16:06:23 +0100
From: Frieder Schrempf <frieder.schrempf@exceet.de>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Feb 2017 16:05:58 +0100
Message-ID: <1487257558-3384-1-git-send-email-frieder.schrempf@exceet.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CA+chaQd_O8+rQ10gRJqgXZt9zYdR7CowTKXD3trYPn-hXNZEhg@mail.gmail.com>
References: <CA+chaQd_O8+rQ10gRJqgXZt9zYdR7CowTKXD3trYPn-hXNZEhg@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [94.216.237.169]
X-TM-AS-Product-Ver: SMEX-11.0.0.4255-8.100.1062-22888.006
X-TM-AS-Result: No--1.130900-5.000000-31
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
Cc: Frieder Schrempf <frieder.schrempf@exceet.de>
Subject: [meta-qt5][PATCH] qtbase-native: nativesdk-qtbase: remove patch that breaks mkspec setting for SDK
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
X-List-Received-Date: Thu, 16 Feb 2017 15:06:26 -0000
Content-Type: text/plain

The patch 0008-configure-paths-for-target-qmake-properly.patch seems
to be intended for the target, not for native/nativesdk, as it breaks
the mkspec setting (sets linux-g++ instead of linux-oe-g++) by default.

This issue is also described here:
https://github.com/graugans/meta-udoo/issues/20#issuecomment-261241783

Signed-off-by: Frieder Schrempf <frieder.schrempf@exceet.de>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb | 1 -
 recipes-qt/qt5/qtbase-native_git.bb    | 1 -
 2 files changed, 2 deletions(-)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 47e204b..e64c30e 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -33,7 +33,6 @@ SRC_URI += "\
     file://0005-configure-bump-path-length-from-256-to-512-character.patch \
     file://0006-QOpenGLPaintDevice-sub-area-support.patch \
     file://0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
-    file://0008-configure-paths-for-target-qmake-properly.patch \
     file://0009-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch \
     file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
 "
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index ec4a9b6..c6a847a 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -28,7 +28,6 @@ SRC_URI += "\
     file://0005-configure-bump-path-length-from-256-to-512-character.patch \
     file://0006-QOpenGLPaintDevice-sub-area-support.patch \
     file://0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
-    file://0008-configure-paths-for-target-qmake-properly.patch \
     file://0009-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch \
     file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
 "
-- 
2.7.4


