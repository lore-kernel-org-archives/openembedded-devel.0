Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id 8ED5472491
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 20:53:26 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 516CF5D5; Fri, 27 Feb 2015 21:53:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id EEC2C265;
	Fri, 27 Feb 2015 21:53:30 +0100 (CET)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Feb 2015 21:53:17 +0100
Message-Id: <1425070398-1602-1-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 1/2] qtwebkit: Fix build without opengl
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Backport a patch from 5.4.1 to get qtwebkit to build without opengl.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 .../qt5/qtwebkit/0003-qtwebkit-fix-no-opengl.patch | 291 +++++++++++++++++++++
 recipes-qt/qt5/qtwebkit_5.4.0.bb                   |   2 +
 2 files changed, 293 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwebkit/0003-qtwebkit-fix-no-opengl.patch

diff --git a/recipes-qt/qt5/qtwebkit/0003-qtwebkit-fix-no-opengl.patch b/recipes-qt/qt5/qtwebkit/0003-qtwebkit-fix-no-opengl.patch
new file mode 100644
index 000000000000..cf6aeeefc5b9
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit/0003-qtwebkit-fix-no-opengl.patch
@@ -0,0 +1,291 @@
+From 4ecb913768ff0806c6efdff4567ef5907f597e4a Mon Sep 17 00:00:00 2001
+From: Allan Sandfeld Jensen <allan.jensen@digia.com>
+Date: Tue, 6 Jan 2015 16:31:27 +0100
+Subject: [PATCH] Fix build without OpenGL
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The accelerated 2D canvas feature broke building without OpenGL due to
+missing feature checks.
+
+Task-number: QTBUG-43549
+Change-Id: I7e62751d5237e1c600bc784539c70db50bccfa22
+Reviewed-by: Ashish Kulkarni <kulkarni.ashish@gmail.com>
+Reviewed-by: Michael Brüning <michael.bruning@theqtcompany.com>
+---
+ Source/WebCore/Target.pri                          |    4 ++--
+ Source/WebCore/html/HTMLCanvasElement.cpp          |    2 +-
+ Source/WebCore/platform/graphics/ImageBuffer.h     |    4 ++--
+ .../platform/graphics/qt/ImageBufferDataQt.cpp     |   11 +++++------
+ .../platform/graphics/qt/ImageBufferDataQt.h       |    7 ++++++-
+ .../WebCore/platform/graphics/qt/ImageBufferQt.cpp |    4 ++++
+ Tools/QtTestBrowser/launcherwindow.cpp             |    8 ++++----
+ Tools/QtTestBrowser/launcherwindow.h               |    2 +-
+ 8 files changed, 25 insertions(+), 17 deletions(-)
+
+diff --git a/Source/WebCore/Target.pri b/Source/WebCore/Target.pri
+index b9167d1..d1aad9f 100644
+--- a/Source/WebCore/Target.pri
++++ b/Source/WebCore/Target.pri
+@@ -2232,7 +2232,6 @@ HEADERS += \
+     platform/graphics/RoundedRect.h \
+     platform/graphics/qt/FontCustomPlatformData.h \
+     platform/graphics/qt/NativeImageQt.h \
+-    platform/graphics/qt/QFramebufferPaintDevice.h \
+     platform/graphics/qt/StillImageQt.h \
+     platform/graphics/qt/TransparencyLayer.h \
+     platform/graphics/SegmentedFontData.h \
+@@ -2886,7 +2885,6 @@ SOURCES += \
+     platform/graphics/qt/IntPointQt.cpp \
+     platform/graphics/qt/IntRectQt.cpp \
+     platform/graphics/qt/IntSizeQt.cpp \
+-    platform/graphics/qt/QFramebufferPaintDevice.cpp \
+     platform/graphics/qt/PathQt.cpp \
+     platform/graphics/qt/PatternQt.cpp \
+     platform/graphics/qt/StillImageQt.cpp \
+@@ -4146,6 +4144,7 @@ use?(3D_GRAPHICS) {
+         platform/graphics/gpu/Texture.h \
+         platform/graphics/gpu/TilingData.h \
+         platform/graphics/opengl/Extensions3DOpenGL.h \
++        platform/graphics/qt/QFramebufferPaintDevice.h \
+         platform/graphics/texmap/TextureMapperGL.h \
+         platform/graphics/texmap/TextureMapperShaderProgram.h \
+         platform/graphics/texmap/coordinated/AreaAllocator.h \
+@@ -4182,6 +4181,7 @@ use?(3D_GRAPHICS) {
+         platform/graphics/opengl/GraphicsContext3DOpenGLCommon.cpp \
+         platform/graphics/opengl/Extensions3DOpenGLCommon.cpp \
+         platform/graphics/qt/GraphicsContext3DQt.cpp \
++        platform/graphics/qt/QFramebufferPaintDevice.cpp \
+         platform/graphics/texmap/TextureMapperGL.cpp \
+         platform/graphics/texmap/TextureMapperShaderProgram.cpp \
+         platform/graphics/texmap/coordinated/AreaAllocator.cpp \
+diff --git a/Source/WebCore/html/HTMLCanvasElement.cpp b/Source/WebCore/html/HTMLCanvasElement.cpp
+index b856234..ae39959 100644
+--- a/Source/WebCore/html/HTMLCanvasElement.cpp
++++ b/Source/WebCore/html/HTMLCanvasElement.cpp
+@@ -586,7 +586,7 @@ void HTMLCanvasElement::createImageBuffer() const
+         return;
+ 
+     RenderingMode renderingMode = shouldAccelerate(bufferSize) ? Accelerated : Unaccelerated;
+-#if PLATFORM(QT)
++#if PLATFORM(QT) && ENABLE(ACCELERATED_2D_CANVAS)
+     if (renderingMode == Accelerated) {
+         QWebPageClient* client = document()->page()->chrome().platformPageClient();
+         // The WebKit2 Chrome does not have a pageclient.
+diff --git a/Source/WebCore/platform/graphics/ImageBuffer.h b/Source/WebCore/platform/graphics/ImageBuffer.h
+index 7addde9..a30d052 100644
+--- a/Source/WebCore/platform/graphics/ImageBuffer.h
++++ b/Source/WebCore/platform/graphics/ImageBuffer.h
+@@ -95,7 +95,7 @@ namespace WebCore {
+         }
+ 
+         static PassOwnPtr<ImageBuffer> createCompatibleBuffer(const IntSize&, float resolutionScale, ColorSpace, const GraphicsContext*, bool hasAlpha);
+-#if PLATFORM(QT)
++#if PLATFORM(QT) && ENABLE(ACCELERATED_2D_CANVAS)
+         static PassOwnPtr<ImageBuffer> createCompatibleBuffer(const IntSize&, float resolutionScale, ColorSpace, QOpenGLContext*);
+ #endif
+ 
+@@ -165,7 +165,7 @@ namespace WebCore {
+         // This constructor will place its success into the given out-variable
+         // so that create() knows when it should return failure.
+         ImageBuffer(const IntSize&, float resolutionScale, ColorSpace, RenderingMode, bool& success);
+-#if PLATFORM(QT)
++#if PLATFORM(QT) && ENABLE(ACCELERATED_2D_CANVAS)
+         ImageBuffer(const IntSize&, float resolutionScale, ColorSpace, QOpenGLContext*, bool& success);
+ #endif
+     };
+diff --git a/Source/WebCore/platform/graphics/qt/ImageBufferDataQt.cpp b/Source/WebCore/platform/graphics/qt/ImageBufferDataQt.cpp
+index 4a16515..1235ce6 100644
+--- a/Source/WebCore/platform/graphics/qt/ImageBufferDataQt.cpp
++++ b/Source/WebCore/platform/graphics/qt/ImageBufferDataQt.cpp
+@@ -34,7 +34,6 @@
+ #include "GraphicsSurface.h"
+ #include "ImageData.h"
+ #include "StillImageQt.h"
+-#include "QFramebufferPaintDevice.h"
+ 
+ #include <QImage>
+ #include <QPaintEngine>
+@@ -42,6 +41,7 @@
+ #include <QPixmap>
+ 
+ #if ENABLE(ACCELERATED_2D_CANVAS)
++#include "QFramebufferPaintDevice.h"
+ #include "TextureMapper.h"
+ #include "TextureMapperPlatformLayer.h"
+ #include "TextureMapperGL.h"
+@@ -483,16 +483,12 @@ ImageBufferData::ImageBufferData(const IntSize& size)
+     initPainter();
+ }
+ 
++#if ENABLE(ACCELERATED_2D_CANVAS)
+ ImageBufferData::ImageBufferData(const IntSize& size, QOpenGLContext* compatibleContext)
+ {
+     m_painter = new QPainter;
+ 
+-#if ENABLE(ACCELERATED_2D_CANVAS)
+     m_impl = new ImageBufferDataPrivateAccelerated(size, compatibleContext);
+-#else
+-    Q_UNUSED(compatibleContext);
+-    m_impl = new ImageBufferDataPrivateUnaccelerated(size);
+-#endif
+ 
+     if (!m_impl->paintDevice())
+         return;
+@@ -501,11 +497,14 @@ ImageBufferData::ImageBufferData(const IntSize& size, QOpenGLContext* compatible
+ 
+     initPainter();
+ }
++#endif
+ 
+ ImageBufferData::~ImageBufferData()
+ {
++#if ENABLE(ACCELERATED_2D_CANVAS)
+     if (m_impl->isAccelerated())
+         static_cast<QFramebufferPaintDevice*>(m_impl->paintDevice())->ensureActiveTarget();
++#endif
+     m_painter->end();
+     delete m_painter;
+     delete m_impl;
+diff --git a/Source/WebCore/platform/graphics/qt/ImageBufferDataQt.h b/Source/WebCore/platform/graphics/qt/ImageBufferDataQt.h
+index 486b0d5..fcad887 100644
+--- a/Source/WebCore/platform/graphics/qt/ImageBufferDataQt.h
++++ b/Source/WebCore/platform/graphics/qt/ImageBufferDataQt.h
+@@ -29,10 +29,13 @@
+ #include "Image.h"
+ 
+ #include <QImage>
+-#include <QOpenGLContext>
+ #include <QPainter>
+ #include <QPaintDevice>
+ 
++#if ENABLE(ACCELERATED_2D_CANVAS)
++#include <QOpenGLContext>
++#endif
++
+ #include <wtf/RefPtr.h>
+ 
+ namespace WebCore {
+@@ -61,7 +64,9 @@ class ImageBufferData
+ {
+ public:
+     ImageBufferData(const IntSize&);
++#if ENABLE(ACCELERATED_2D_CANVAS)
+     ImageBufferData(const IntSize&, QOpenGLContext*);
++#endif
+     ~ImageBufferData();
+     QPainter* m_painter;
+     ImageBufferDataPrivate* m_impl;
+diff --git a/Source/WebCore/platform/graphics/qt/ImageBufferQt.cpp b/Source/WebCore/platform/graphics/qt/ImageBufferQt.cpp
+index 400743d..09c90a6 100644
+--- a/Source/WebCore/platform/graphics/qt/ImageBufferQt.cpp
++++ b/Source/WebCore/platform/graphics/qt/ImageBufferQt.cpp
+@@ -47,6 +47,7 @@
+ 
+ namespace WebCore {
+ 
++#if ENABLE(ACCELERATED_2D_CANVAS)
+ ImageBuffer::ImageBuffer(const IntSize& size, float /* resolutionScale */, ColorSpace, QOpenGLContext* compatibleContext, bool& success)
+     : m_data(size, compatibleContext)
+     , m_size(size)
+@@ -58,6 +59,7 @@ ImageBuffer::ImageBuffer(const IntSize& size, float /* resolutionScale */, Color
+ 
+     m_context = adoptPtr(new GraphicsContext(m_data.m_painter));
+ }
++#endif
+ 
+ ImageBuffer::ImageBuffer(const IntSize& size, float /* resolutionScale */, ColorSpace, RenderingMode /*renderingMode*/, bool& success)
+     : m_data(size)
+@@ -75,6 +77,7 @@ ImageBuffer::~ImageBuffer()
+ {
+ }
+ 
++#if ENABLE(ACCELERATED_2D_CANVAS)
+ PassOwnPtr<ImageBuffer> ImageBuffer::createCompatibleBuffer(const IntSize& size, float resolutionScale, ColorSpace colorSpace, QOpenGLContext* context)
+ {
+     bool success = false;
+@@ -83,6 +86,7 @@ PassOwnPtr<ImageBuffer> ImageBuffer::createCompatibleBuffer(const IntSize& size,
+         return nullptr;
+     return buf.release();
+ }
++#endif
+ 
+ GraphicsContext* ImageBuffer::context() const
+ {
+diff --git a/Tools/QtTestBrowser/launcherwindow.cpp b/Tools/QtTestBrowser/launcherwindow.cpp
+index e2dcef3..d293397 100644
+--- a/Tools/QtTestBrowser/launcherwindow.cpp
++++ b/Tools/QtTestBrowser/launcherwindow.cpp
+@@ -177,9 +177,9 @@ void LauncherWindow::initializeView()
+ #ifndef QT_NO_OPENGL
+         if (!m_windowOptions.useQOpenGLWidgetViewport)
+             toggleQGLWidgetViewport(m_windowOptions.useQGLWidgetViewport);
+-#endif
+         if (!m_windowOptions.useQGLWidgetViewport)
+             toggleQOpenGLWidgetViewport(m_windowOptions.useQOpenGLWidgetViewport);
++#endif
+         view->setPage(page());
+ 
+         connect(view, SIGNAL(currentFPSUpdated(int)), this, SLOT(updateFPS(int)));
+@@ -407,7 +407,6 @@ void LauncherWindow::createChrome()
+     toggleQGLWidgetViewport->setChecked(m_windowOptions.useQGLWidgetViewport);
+     toggleQGLWidgetViewport->setEnabled(isGraphicsBased());
+     toggleQGLWidgetViewport->connect(toggleGraphicsView, SIGNAL(toggled(bool)), SLOT(setEnabled(bool)));
+-#endif
+ #if QT_VERSION >= QT_VERSION_CHECK(5, 4, 0)
+     QAction* toggleQOpenGLWidgetViewport = graphicsViewMenu->addAction("Toggle use of QOpenGLWidget Viewport", this, SLOT(toggleQOpenGLWidgetViewport(bool)));
+     toggleQOpenGLWidgetViewport->setCheckable(true);
+@@ -415,6 +414,7 @@ void LauncherWindow::createChrome()
+     toggleQOpenGLWidgetViewport->setEnabled(isGraphicsBased());
+     toggleQOpenGLWidgetViewport->connect(toggleGraphicsView, SIGNAL(toggled(bool)), SLOT(setEnabled(bool)));
+ #endif
++#endif
+ 
+     QMenu* viewportUpdateMenu = graphicsViewMenu->addMenu("Change Viewport Update Mode");
+     viewportUpdateMenu->setEnabled(isGraphicsBased());
+@@ -802,9 +802,9 @@ void LauncherWindow::screenshot()
+ #ifndef QT_NO_OPENGL
+     if (!m_windowOptions.useQOpenGLWidgetViewport)
+         toggleQGLWidgetViewport(m_windowOptions.useQGLWidgetViewport);
+-#endif
+     if (!m_windowOptions.useQGLWidgetViewport)
+         toggleQOpenGLWidgetViewport(m_windowOptions.useQOpenGLWidgetViewport);
++#endif
+ }
+ 
+ void LauncherWindow::setEditable(bool on)
+@@ -997,7 +997,6 @@ void LauncherWindow::toggleQGLWidgetViewport(bool enable)
+     WebViewGraphicsBased* view = static_cast<WebViewGraphicsBased*>(m_view);
+     view->setViewport(enable ? new QGLWidget() : 0);
+ }
+-#endif
+ 
+ void LauncherWindow::toggleQOpenGLWidgetViewport(bool enable)
+ {
+@@ -1013,6 +1012,7 @@ void LauncherWindow::toggleQOpenGLWidgetViewport(bool enable)
+     view->setViewport(enable ? new QOpenGLWidget() : 0);
+ #endif
+ }
++#endif
+ 
+ void LauncherWindow::changeViewportUpdateMode(int mode)
+ {
+diff --git a/Tools/QtTestBrowser/launcherwindow.h b/Tools/QtTestBrowser/launcherwindow.h
+index c470a5a..5cee7e5 100644
+--- a/Tools/QtTestBrowser/launcherwindow.h
++++ b/Tools/QtTestBrowser/launcherwindow.h
+@@ -180,8 +180,8 @@ protected Q_SLOTS:
+ #endif
+ #ifndef QT_NO_OPENGL
+     void toggleQGLWidgetViewport(bool enable);
+-#endif
+     void toggleQOpenGLWidgetViewport(bool enable);
++#endif
+ 
+     void changeViewportUpdateMode(int mode);
+     void animatedFlip();
+-- 
+1.7.1
+
+
diff --git a/recipes-qt/qt5/qtwebkit_5.4.0.bb b/recipes-qt/qt5/qtwebkit_5.4.0.bb
index 8a276ab178ec..8d7b7192c94a 100644
--- a/recipes-qt/qt5/qtwebkit_5.4.0.bb
+++ b/recipes-qt/qt5/qtwebkit_5.4.0.bb
@@ -1,5 +1,7 @@
 require qt5-${PV}.inc
 require ${PN}.inc
 
+SRC_URI += "file://0003-qtwebkit-fix-no-opengl.patch"
+
 SRC_URI[md5sum] = "e62d72c410dffe5129043f80f624c896"
 SRC_URI[sha256sum] = "6c672207765d5d2e88aa14b72b3876ad7bce453397a02e1a3d6e4670a8d188c1"
-- 
2.1.0


