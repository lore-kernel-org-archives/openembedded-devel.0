Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id F2C8272B1E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 04:53:07 +0000 (UTC)
Received: by igui7 with SMTP id i7so48249285igu.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Aug 2015 21:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KDQ1nzJARhdk9KPaH1iFD3aXOUegBp2JhcOVu7zpa94=;
	b=AuZOsh+oJTDu+Ly6hkpdMQxXaa7WG0EV+cP+3j9IKGlAgxAfnK6Gm23esDkfz55Zxx
	sJauY/c94aCDdYmnvSzI8l53gKvk+3jOh54Pgs02pvSUiyPv9jtxsCyL5aOqHlWRcPf9
	BGt8iFk9QrjfN/URK5v2jX41cVQyIVNfgI6i0ReAKrUPzhX+cxrpXrMJmU74ClWBw/Eu
	QYoMpJLYR04eq9DVQ7nIAmeceVGVXOhNiUDDehc4Re/i8FSmJeilActd+jIPQx3EMeQ8
	5K9jxUVuvFwVCA/wh32mc9Mv1CS6Onb8DVrrJ0oHfQOr9z1vQMDSIcw3YxL9xDYN9X9F
	1w0g==
X-Received: by 10.50.20.8 with SMTP id j8mr12140204ige.36.1440391987685;
	Sun, 23 Aug 2015 21:53:07 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by smtp.gmail.com with ESMTPSA id a1sm8172496iga.4.2015.08.23.21.53.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Aug 2015 21:53:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Aug 2015 21:52:59 -0700
Message-Id: <1440391979-3469-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440391979-3469-1-git-send-email-raj.khem@gmail.com>
References: <1440391979-3469-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-qt5][PATCH 3/3] qtwayland: Fix build for raspberryPi
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
X-List-Received-Date: Mon, 24 Aug 2015 04:53:08 -0000

rpi uses bcom EGL implementation and it has descrepency when it comes to
defining 'EGLNativePixmapType', lets typecast the ussage of this type to
avoid this sort of errors.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...egl-Typecast-proper-EGLNativeWindowType-t.patch | 56 ++++++++++++++++++++++
 recipes-qt/qt5/qtwayland_git.bb                    |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwayland/0001-xcomposite-egl-Typecast-proper-EGLNativeWindowType-t.patch

diff --git a/recipes-qt/qt5/qtwayland/0001-xcomposite-egl-Typecast-proper-EGLNativeWindowType-t.patch b/recipes-qt/qt5/qtwayland/0001-xcomposite-egl-Typecast-proper-EGLNativeWindowType-t.patch
new file mode 100644
index 0000000..2e1f2c4
--- /dev/null
+++ b/recipes-qt/qt5/qtwayland/0001-xcomposite-egl-Typecast-proper-EGLNativeWindowType-t.patch
@@ -0,0 +1,56 @@
+From 91746518a0cd56d7b0bfda69ba6cf743bf051fb9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 23 Aug 2015 17:33:25 -0700
+Subject: [PATCH] xcomposite-egl: Typecast proper EGLNativeWindowType to
+ eglCreateWindowSurface params
+
+This surfaces on rpi which has slightly different definition of
+EGLNativeWindowType
+
+Fixes errors like
+
+/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/qtwayland/5.4.2+gitAUTOINC+182488129c-r0/git/src/hardwareintegration/compositor/xcomposite-egl/xcompositeeglintegration.cpp:117:26: error: no matching function for call
+      to 'eglCreatePixmapSurface'
+    EGLSurface surface = eglCreatePixmapSurface(mEglDisplay,config,pixmap,attribList.constData());
+                         ^~~~~~~~~~~~~~~~~~~~~~
+/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/sysroots/raspberrypi2/usr/include/EGL/egl.h:270:31: note: candidate function not viable: no known conversion from 'Pixmap' (aka 'unsigned long') to 'EGLNativePixmapType' (aka 'void *') for 3rd argument; take the
+      address of the argument with &
+EGLAPI EGLSurface EGLAPIENTRY eglCreatePixmapSurface(EGLDisplay dpy, EGLConfig config,
+                              ^
+1 error generated.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../client/xcomposite-egl/qwaylandxcompositeeglwindow.cpp               | 2 +-
+ .../compositor/xcomposite-egl/xcompositeeglintegration.cpp              | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/hardwareintegration/client/xcomposite-egl/qwaylandxcompositeeglwindow.cpp b/src/hardwareintegration/client/xcomposite-egl/qwaylandxcompositeeglwindow.cpp
+index 01d6324..e268ede 100644
+--- a/src/hardwareintegration/client/xcomposite-egl/qwaylandxcompositeeglwindow.cpp
++++ b/src/hardwareintegration/client/xcomposite-egl/qwaylandxcompositeeglwindow.cpp
+@@ -122,7 +122,7 @@ void QWaylandXCompositeEGLWindow::createEglSurface()
+     XCompositeRedirectWindow(m_glxIntegration->xDisplay(), m_xWindow, CompositeRedirectManual);
+     XMapWindow(m_glxIntegration->xDisplay(), m_xWindow);
+ 
+-    m_surface = eglCreateWindowSurface(m_glxIntegration->eglDisplay(), m_config, m_xWindow,0);
++    m_surface = eglCreateWindowSurface(m_glxIntegration->eglDisplay(), m_config, (EGLNativeWindowType)m_xWindow,0);
+     if (m_surface == EGL_NO_SURFACE) {
+         qFatal("Could not make eglsurface");
+     }
+diff --git a/src/hardwareintegration/compositor/xcomposite-egl/xcompositeeglintegration.cpp b/src/hardwareintegration/compositor/xcomposite-egl/xcompositeeglintegration.cpp
+index 2401d67..61664b5 100644
+--- a/src/hardwareintegration/compositor/xcomposite-egl/xcompositeeglintegration.cpp
++++ b/src/hardwareintegration/compositor/xcomposite-egl/xcompositeeglintegration.cpp
+@@ -114,7 +114,7 @@ void XCompositeEglClientBufferIntegration::bindTextureToBuffer(struct ::wl_resou
+     attribList.append(EGL_TEXTURE_2D);
+     attribList.append(EGL_NONE);
+ 
+-    EGLSurface surface = eglCreatePixmapSurface(mEglDisplay,config,pixmap,attribList.constData());
++    EGLSurface surface = eglCreatePixmapSurface(mEglDisplay,config,(EGLNativeWindowType)pixmap,attribList.constData());
+     if (surface == EGL_NO_SURFACE) {
+         qDebug() << "Failed to create eglsurface" << pixmap << compositorBuffer->window();
+     }
+-- 
+2.1.4
+
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 0be7afe..4725d3c 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -35,6 +35,7 @@ FILES_${PN}-plugins-dbg += " \
 
 SRC_URI += " \
     file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
+    file://0001-xcomposite-egl-Typecast-proper-EGLNativeWindowType-t.patch \
 "
 
 QT_VERSION ?= "5.4.3"
-- 
2.1.4


