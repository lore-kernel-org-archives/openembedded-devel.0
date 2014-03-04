Return-Path: <net147@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 395066ADA2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Mar 2014 22:04:18 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id lj1so144880pab.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Mar 2014 14:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4T4IRJkWm0bBQLqV97cfRnwdiAkALm5dMgrdWAVcIy0=;
	b=IuZ7x1CRN3NuaZh9Iwoqw/f2XnRGXfzmWP6oqMAjJcz2PkFHHjjnM47q7b6HVW/QGj
	pZKOhT28HIk9prSr8gcoLvFbgZd9SH+blt9wUxU6eOJmvnE6EW3vlKi0teh+jA1+QKvo
	wLd1Ag4WZj4sXccYwMb/TFZsChLPYFuNDOpeIsH6gsziuNl+rpWDpx1QDANFvadpNxcI
	Xv3EhVkkNcULsz0FllsrY871nUZM2IzKLYCOpMIUEV65sJw4ezepHNrfUPCAep/rfNj+
	bR2qF6tpw3O9e3MAuuOL9MJxYOYVlpmWtqbu/9T1me6lxeb8GwodcfluygUNYCc2HtJ/
	MRSw==
X-Received: by 10.68.190.228 with SMTP id gt4mr2395680pbc.94.1393970659781;
	Tue, 04 Mar 2014 14:04:19 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id af1sm1422446pad.12.2014.03.04.14.04.17
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Mar 2014 14:04:18 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Mar 2014 09:09:00 +1100
Message-Id: <1393970940-2727-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-qt5][PATCH v2] qtbase: fix mmsize argument parsing for linuxfb plugin
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
X-List-Received-Date: Tue, 04 Mar 2014 22:04:20 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qtbase.inc                          |  1 +
 .../0015-Fix-linuxfb-argument-mmsize-parsing.patch | 42 ++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase/0015-Fix-linuxfb-argument-mmsize-parsing.patch

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 378f229..f1a10bb 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -19,6 +19,7 @@ SRC_URI += "\
     file://0012-qtbase-allow-build-of-examples.patch \
     file://0013-QOpenGLPaintDevice-sub-area-support.patch \
     file://0014-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
+    file://0015-Fix-linuxfb-argument-mmsize-parsing.patch \
 "
 
 DEPENDS += "qtbase-native"
diff --git a/recipes-qt/qt5/qtbase/0015-Fix-linuxfb-argument-mmsize-parsing.patch b/recipes-qt/qt5/qtbase/0015-Fix-linuxfb-argument-mmsize-parsing.patch
new file mode 100644
index 0000000..a31301e
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0015-Fix-linuxfb-argument-mmsize-parsing.patch
@@ -0,0 +1,42 @@
+From 99979159a404df09495c8ddd6a052837f66b8739 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>
+Date: Fri, 7 Feb 2014 13:12:37 +0100
+Subject: [PATCH] Fix linuxfb argument 'mmsize' parsing
+
+Parse first for 'mmsize' because the regex for 'size' also fits to 'mmsize'.
+
+Upstream-Status: Backport
+
+Task-number: QTBUG-29133
+Change-Id: Idc4950270818e496d5d94a97a172b7c780f069b1
+Reviewed-by: Laszlo Agocs <laszlo.agocs@digia.com>
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp b/src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp
+index 735a43d..33a9523 100644
+--- a/src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp
++++ b/src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp
+@@ -333,6 +333,8 @@ bool QLinuxFbScreen::initialize()
+     foreach (const QString &arg, mArgs) {
+         if (arg == QLatin1String("nographicsmodeswitch"))
+             doSwitchToGraphicsMode = false;
++        else if (mmSizeRx.indexIn(arg) != -1)
++            userMmSize = QSize(mmSizeRx.cap(1).toInt(), mmSizeRx.cap(2).toInt());
+         else if (sizeRx.indexIn(arg) != -1)
+             userGeometry.setSize(QSize(sizeRx.cap(1).toInt(), sizeRx.cap(2).toInt()));
+         else if (offsetRx.indexIn(arg) != -1)
+@@ -341,8 +343,6 @@ bool QLinuxFbScreen::initialize()
+             ttyDevice = ttyRx.cap(1);
+         else if (fbRx.indexIn(arg) != -1)
+             fbDevice = fbRx.cap(1);
+-        else if (mmSizeRx.indexIn(arg) != -1)
+-            userMmSize = QSize(mmSizeRx.cap(1).toInt(), mmSizeRx.cap(2).toInt());
+     }
+ 
+     if (fbDevice.isEmpty()) {
+-- 
+1.7.1
+
-- 
1.9.0


