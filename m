Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id 8FBE672667
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 20:53:26 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id CAC1C5E5; Fri, 27 Feb 2015 21:53:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 93F75265;
	Fri, 27 Feb 2015 21:53:31 +0100 (CET)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Feb 2015 21:53:18 +0100
Message-Id: <1425070398-1602-2-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1425070398-1602-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1425070398-1602-1-git-send-email-alexandre.belloni@free-electrons.com>
Subject: [meta-qt5][PATCH 2/2] qtmultimedia: Fix build without opengl
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
X-List-Received-Date: Fri, 27 Feb 2015 20:53:32 -0000

Backport a patch from 5.4.1 to get qtmultimedia to build without opengl.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 .../0002-qtmultimedia-fix-no-opengl.patch          | 36 ++++++++++++++++++++++
 recipes-qt/qt5/qtmultimedia_5.4.0.bb               |  2 ++
 2 files changed, 38 insertions(+)
 create mode 100644 recipes-qt/qt5/qtmultimedia/0002-qtmultimedia-fix-no-opengl.patch

diff --git a/recipes-qt/qt5/qtmultimedia/0002-qtmultimedia-fix-no-opengl.patch b/recipes-qt/qt5/qtmultimedia/0002-qtmultimedia-fix-no-opengl.patch
new file mode 100644
index 000000000000..0991e5d08212
--- /dev/null
+++ b/recipes-qt/qt5/qtmultimedia/0002-qtmultimedia-fix-no-opengl.patch
@@ -0,0 +1,36 @@
+From 2b181d546970d18a48a0f36f5d1a22418b61cd4d Mon Sep 17 00:00:00 2001
+From: Laszlo Agocs <laszlo.agocs@theqtcompany.com>
+Date: Tue, 9 Dec 2014 15:34:10 +0100
+Subject: Make it compile with no-opengl
+
+Change-Id: I71358bb1268e5b28b66b1817a3ec0cd98459cfd2
+Reviewed-by: Friedemann Kleint <Friedemann.Kleint@theqtcompany.com>
+Reviewed-by: Yoann Lopes <yoann.lopes@theqtcompany.com>
+
+diff --git a/src/multimediawidgets/qpaintervideosurface.cpp b/src/multimediawidgets/qpaintervideosurface.cpp
+index 3a880de..2ab5dcb 100644
+--- a/src/multimediawidgets/qpaintervideosurface.cpp
++++ b/src/multimediawidgets/qpaintervideosurface.cpp
+@@ -96,7 +96,9 @@ QVideoSurfaceGenericPainter::QVideoSurfaceGenericPainter()
+         << QVideoFrame::Format_ARGB32
+         << QVideoFrame::Format_RGB565;
+     // The raster formats should be a subset of the GL formats.
++#ifndef QT_NO_OPENGL
+     if (QOpenGLContext::openGLModuleType() != QOpenGLContext::LibGLES)
++#endif
+         m_imagePixelFormats << QVideoFrame::Format_RGB24;
+ }
+ 
+@@ -137,7 +139,9 @@ QAbstractVideoSurface::Error QVideoSurfaceGenericPainter::start(const QVideoSurf
+     const QAbstractVideoBuffer::HandleType t = format.handleType();
+     if (t == QAbstractVideoBuffer::NoHandle) {
+         bool ok = m_imageFormat != QImage::Format_Invalid && !m_imageSize.isEmpty();
++#ifndef QT_NO_OPENGL
+         if (QOpenGLContext::openGLModuleType() == QOpenGLContext::LibGLES)
++#endif
+             ok &= format.pixelFormat() != QVideoFrame::Format_RGB24;
+         if (ok)
+             return QAbstractVideoSurface::NoError;
+-- 
+cgit v0.10.1
+
diff --git a/recipes-qt/qt5/qtmultimedia_5.4.0.bb b/recipes-qt/qt5/qtmultimedia_5.4.0.bb
index 0fc982a196f1..a71bb700c6ea 100644
--- a/recipes-qt/qt5/qtmultimedia_5.4.0.bb
+++ b/recipes-qt/qt5/qtmultimedia_5.4.0.bb
@@ -1,5 +1,7 @@
 require qt5-${PV}.inc
 require ${PN}.inc
 
+SRC_URI += "file://0002-qtmultimedia-fix-no-opengl.patch"
+
 SRC_URI[md5sum] = "3a6a415813b54a54cf283a5e2906e012"
 SRC_URI[sha256sum] = "5ab9dba27ae64123f2d0124b6884da276d8982aa959d65aa44125f758ef9af51"
-- 
2.1.0


