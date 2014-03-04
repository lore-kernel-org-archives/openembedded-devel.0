Return-Path: <net147@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8CC1F6F09E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Mar 2014 22:04:35 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id bj1so149729pad.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Mar 2014 14:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=sl72E+wBB9Da+e/dXdGgPdcdXXumB3uf11N7AMOYZKc=;
	b=S4VGcJ458/wyCWkk2Q0KrtXAWcvbKFqEkXHS+ZSORYkSpF/6LZ/OOWCglwnsYevG2a
	JA5iPgWuSG3BDo+k9z33AK2xqbEYle1CXF3TA3VgQHV51NrNgZTKvaDLMjoghgR1rYqI
	uOtknzMlw8FP9BGqMweg8n7YaBG95/HqRqBl094s9dIurhEC8vX4rG4MEVSMBMW4WFsT
	7QBnUXOykoSVeUAeQWwaLSq4TPRJS+fUznFNLTYTwun3/Y4EQXBwyof700lmiJfev3Or
	qshV/BeEXkPAUK3GRXSqKYtLqCs7xmYaK0KNMIbEMXMM7cj7uS+f+Sy4TvflTYioosv/
	C0Bw==
X-Received: by 10.68.134.198 with SMTP id pm6mr2287185pbb.9.1393970676188;
	Tue, 04 Mar 2014 14:04:36 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id j3sm551256pbh.38.2014.03.04.14.04.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Mar 2014 14:04:34 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Mar 2014 09:09:39 +1100
Message-Id: <1393970979-2785-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-qt5][PATCH v3] qtbase: prevent artifacts on raster windows using eglfs plugin
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
X-List-Received-Date: Tue, 04 Mar 2014 22:04:35 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qtbase.inc                          |  1 +
 .../qtbase/0016-eglfs-Fix-quad-coordinates.patch   | 39 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase/0016-eglfs-Fix-quad-coordinates.patch

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index f1a10bb..e5d98df 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -20,6 +20,7 @@ SRC_URI += "\
     file://0013-QOpenGLPaintDevice-sub-area-support.patch \
     file://0014-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
     file://0015-Fix-linuxfb-argument-mmsize-parsing.patch \
+    file://0016-eglfs-Fix-quad-coordinates.patch \
 "
 
 DEPENDS += "qtbase-native"
diff --git a/recipes-qt/qt5/qtbase/0016-eglfs-Fix-quad-coordinates.patch b/recipes-qt/qt5/qtbase/0016-eglfs-Fix-quad-coordinates.patch
new file mode 100644
index 0000000..92785e4
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0016-eglfs-Fix-quad-coordinates.patch
@@ -0,0 +1,39 @@
+From 84756d94c73885803ad8044099ab47c0c49b5076 Mon Sep 17 00:00:00 2001
+From: Laszlo Agocs <laszlo.agocs@digia.com>
+Date: Thu, 23 Jan 2014 11:45:22 +0100
+Subject: [PATCH] eglfs: Fix quad coordinates
+
+Prevent artifacts on raster windows by properly mapping
+the coordinates to [-1,1].
+
+Upstream-Status: Backport
+
+Task-number: QTBUG-36370
+Change-Id: I95d0d03952f597ef4ce6a950c6533a3af2df964a
+Reviewed-by: Andy Nichols <andy.nichols@digia.com>
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ src/plugins/platforms/eglfs/qeglfscompositor.cpp | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/plugins/platforms/eglfs/qeglfscompositor.cpp b/src/plugins/platforms/eglfs/qeglfscompositor.cpp
+index 845bb5b..1efc4f7 100644
+--- a/src/plugins/platforms/eglfs/qeglfscompositor.cpp
++++ b/src/plugins/platforms/eglfs/qeglfscompositor.cpp
+@@ -153,10 +153,11 @@ void QEglFSCompositor::render(QEglFSWindow *window, uint texture, bool raster)
+     QPoint tl = r.topLeft();
+     QPoint br = r.bottomRight();
+ 
++    // Map to [-1,1]
+     GLfloat x1 = (tl.x() / sr.width()) * 2 - 1;
+-    GLfloat x2 = (br.x() / sr.width()) * 2 - 1;
+     GLfloat y1 = ((sr.height() - tl.y()) / sr.height()) * 2 - 1;
+-    GLfloat y2 = ((sr.height() - br.y()) / sr.height()) * 2 - 1;
++    GLfloat x2 = ((br.x() + 1) / sr.width()) * 2 - 1;
++    GLfloat y2 = ((sr.height() - (br.y() + 1)) / sr.height()) * 2 - 1;
+ 
+     if (!raster)
+         qSwap(y1, y2);
+-- 
+1.7.1
+
-- 
1.9.0


