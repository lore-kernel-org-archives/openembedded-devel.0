Return-Path: <net147@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6EE9A6CE6D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2013 13:22:54 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz1so1028030pad.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Oct 2013 06:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6YWa5JZBQM+siWwn76lOBylB6VBKClbK0tbVMkrw4dE=;
	b=0lljYtGjXF9uSz/wbD40+HyKCQjPsZsOv6vowq4bNQ7pjxbV6TcfhzLXbxMBfMwWuF
	vj6EOA/tx8Y6BnTwOz/9I2aPkDVHBhKGlQWs1ZmmHe6n30vYV3IY+YIcjFzTMV/tl4lR
	OYgk5x2wJ/QNfSkeCvvTogmLDPEP/lfCaophsk5t8IAm50ErPra4HbeyFbvnMqHsgvlY
	kyG/2Ro2kzB5gQzSVKOsszIx9yuZ9HjtrAeqsvDWBfZJNmDcAgpzBX1d8zfsSSLhMx1u
	qd/tLqjqjIkkaLq5sIPEOciChhe2vJRvqtSM65oL/RM3wk2GpQi9H3OWnPzwAx8ucFGr
	s03Q==
X-Received: by 10.66.121.234 with SMTP id ln10mr9429725pab.20.1381324976174;
	Wed, 09 Oct 2013 06:22:56 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	bp4sm44071541pbb.42.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 09 Oct 2013 06:22:55 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Oct 2013 00:20:56 +1100
Message-Id: <1381324856-24216-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.4
Subject: [meta-qt5][PATCH] qtbase: add upstream QTBUG-31579 patch for QPainter regression
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
X-List-Received-Date: Wed, 09 Oct 2013 13:22:55 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 ...Pixel.y-is-also-initalized-to-1-when-nece.patch | 47 ++++++++++++++++++++++
 ...Pixel.y-is-also-initalized-to-1-when-nece.patch | 47 ++++++++++++++++++++++
 recipes-qt/qt5/qtbase.inc                          |  1 +
 3 files changed, 95 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase-5.1.0/0026-Ensure-lastPixel.y-is-also-initalized-to-1-when-nece.patch
 create mode 100644 recipes-qt/qt5/qtbase-git/0026-Ensure-lastPixel.y-is-also-initalized-to-1-when-nece.patch

diff --git a/recipes-qt/qt5/qtbase-5.1.0/0026-Ensure-lastPixel.y-is-also-initalized-to-1-when-nece.patch b/recipes-qt/qt5/qtbase-5.1.0/0026-Ensure-lastPixel.y-is-also-initalized-to-1-when-nece.patch
new file mode 100644
index 0000000..0d53305
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-5.1.0/0026-Ensure-lastPixel.y-is-also-initalized-to-1-when-nece.patch
@@ -0,0 +1,47 @@
+From f0b950144dde85b65df0c3cf83f7c8df0e94bbbf Mon Sep 17 00:00:00 2001
+From: Andy Shaw <andy.shaw@digia.com>
+Date: Tue, 8 Oct 2013 15:45:42 +0200
+Subject: [PATCH] Ensure lastPixel.y is also initalized to -1 when necessary
+
+Task-number: QTBUG-31579
+
+Upstream-Status: Accepted [https://codereview.qt-project.org/#change,67578]
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+
+Change-Id: Ia4916ac0d384ea523bbfad0dafbc90044da7ec3e
+Reviewed-by: Gunnar Sletta <gunnar.sletta@digia.com>
+---
+ src/gui/painting/qcosmeticstroker.cpp | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/gui/painting/qcosmeticstroker.cpp b/src/gui/painting/qcosmeticstroker.cpp
+index 39f6422..a2301e3 100644
+--- a/src/gui/painting/qcosmeticstroker.cpp
++++ b/src/gui/painting/qcosmeticstroker.cpp
+@@ -305,6 +305,7 @@ void QCosmeticStroker::setup()
+     ymax = deviceRect.bottom() + 2;
+ 
+     lastPixel.x = -1;
++    lastPixel.y = -1;
+ }
+ 
+ // returns true if the whole line gets clipped away
+@@ -533,6 +534,7 @@ void QCosmeticStroker::drawPath(const QVectorPath &path)
+             QPointF p = QPointF(points[0], points[1]) * state->matrix;
+             patternOffset = state->lastPen.dashOffset()*64;
+             lastPixel.x = -1;
++            lastPixel.y = -1;
+ 
+             bool closed;
+             const QPainterPath::ElementType *e = subPath(type, end, points, &closed);
+@@ -587,6 +589,7 @@ void QCosmeticStroker::drawPath(const QVectorPath &path)
+         QPointF movedTo = p;
+         patternOffset = state->lastPen.dashOffset()*64;
+         lastPixel.x = -1;
++        lastPixel.y = -1;
+ 
+         const qreal *begin = points;
+         const qreal *end = points + 2*path.elementCount();
+-- 
+1.8.4
+
diff --git a/recipes-qt/qt5/qtbase-git/0026-Ensure-lastPixel.y-is-also-initalized-to-1-when-nece.patch b/recipes-qt/qt5/qtbase-git/0026-Ensure-lastPixel.y-is-also-initalized-to-1-when-nece.patch
new file mode 100644
index 0000000..0d53305
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-git/0026-Ensure-lastPixel.y-is-also-initalized-to-1-when-nece.patch
@@ -0,0 +1,47 @@
+From f0b950144dde85b65df0c3cf83f7c8df0e94bbbf Mon Sep 17 00:00:00 2001
+From: Andy Shaw <andy.shaw@digia.com>
+Date: Tue, 8 Oct 2013 15:45:42 +0200
+Subject: [PATCH] Ensure lastPixel.y is also initalized to -1 when necessary
+
+Task-number: QTBUG-31579
+
+Upstream-Status: Accepted [https://codereview.qt-project.org/#change,67578]
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+
+Change-Id: Ia4916ac0d384ea523bbfad0dafbc90044da7ec3e
+Reviewed-by: Gunnar Sletta <gunnar.sletta@digia.com>
+---
+ src/gui/painting/qcosmeticstroker.cpp | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/gui/painting/qcosmeticstroker.cpp b/src/gui/painting/qcosmeticstroker.cpp
+index 39f6422..a2301e3 100644
+--- a/src/gui/painting/qcosmeticstroker.cpp
++++ b/src/gui/painting/qcosmeticstroker.cpp
+@@ -305,6 +305,7 @@ void QCosmeticStroker::setup()
+     ymax = deviceRect.bottom() + 2;
+ 
+     lastPixel.x = -1;
++    lastPixel.y = -1;
+ }
+ 
+ // returns true if the whole line gets clipped away
+@@ -533,6 +534,7 @@ void QCosmeticStroker::drawPath(const QVectorPath &path)
+             QPointF p = QPointF(points[0], points[1]) * state->matrix;
+             patternOffset = state->lastPen.dashOffset()*64;
+             lastPixel.x = -1;
++            lastPixel.y = -1;
+ 
+             bool closed;
+             const QPainterPath::ElementType *e = subPath(type, end, points, &closed);
+@@ -587,6 +589,7 @@ void QCosmeticStroker::drawPath(const QVectorPath &path)
+         QPointF movedTo = p;
+         patternOffset = state->lastPen.dashOffset()*64;
+         lastPixel.x = -1;
++        lastPixel.y = -1;
+ 
+         const qreal *begin = points;
+         const qreal *end = points + 2*path.elementCount();
+-- 
+1.8.4
+
diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index b6927d1..ffd5af4 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -23,6 +23,7 @@ SRC_URI += " \
     file://0023-configure-make-freetype-a-configurable-option.patch \
     file://0024-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch \
     file://0025-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch \
+    file://0026-Ensure-lastPixel.y-is-also-initalized-to-1-when-nece.patch \
 "
 
 DEPENDS += "qtbase-native"
-- 
1.8.4


