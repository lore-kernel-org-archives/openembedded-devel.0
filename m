Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 866C96CE55
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2013 23:06:34 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id d41so3782025eek.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2013 16:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=1449RsHI4hjF7XIjeYSNW6QifLR110lZgVS64TY18xI=;
	b=BbQe+mReZcdqgu7bFVUcXOpuMADGkqYYqzhYtRx6CL+xRYPP6Y8vXj5s034uWP8B/n
	XvSC7kreLasenj3GalQLparLpsugbKj/UnoFQ3fp8jclsxWqG63Q+3YqVJxU2uIALQRp
	PiotiQoNUGaxYR0oIYxQ6htQELFaQfblHDTvTWeEi5wWdi31Amj/9e3tQ57eDLZJuDAL
	nLjtguzIwbo4+0QZ/VQu5AlC/VY4hqUyX4OdRxdBRbaH0nbvDSuUfiCLHDBB49YHpOE6
	M80DVBiTSe0uix5lizRZzwQap9Wc8Vx5nPNecbQajHkAw8ALAyQ7zXAzNN7kf9KZhMd8
	Oweg==
X-Received: by 10.15.50.68 with SMTP id k44mr4818155eew.54.1383001596069;
	Mon, 28 Oct 2013 16:06:36 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2A8E.dip0.t-ipconnect.de.
	[91.10.42.142])
	by mx.google.com with ESMTPSA id i1sm62756400eeg.0.2013.10.28.16.06.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Oct 2013 16:06:35 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2013 00:06:16 +0100
Message-Id: <1383001576-26578-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1383001576-26578-1-git-send-email-schnitzeltony@googlemail.com>
References: <1383001576-26578-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][RFC] qtbase: fix build for gles2 enabled by PACKAGECONFIG
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
X-List-Received-Date: Mon, 28 Oct 2013 23:06:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-reorder-includes-to-fix-build-with-eglfs.patch | 238 +++++++++++++++++++++
 recipes-qt/qt5/qtbase.inc                          |   1 +
 2 files changed, 239 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase-5.1.1/0027-reorder-includes-to-fix-build-with-eglfs.patch

diff --git a/recipes-qt/qt5/qtbase-5.1.1/0027-reorder-includes-to-fix-build-with-eglfs.patch b/recipes-qt/qt5/qtbase-5.1.1/0027-reorder-includes-to-fix-build-with-eglfs.patch
new file mode 100644
index 0000000..2c47bd2
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-5.1.1/0027-reorder-includes-to-fix-build-with-eglfs.patch
@@ -0,0 +1,238 @@
+From 8d810aaf46ff65452a53c3d4ab2c64a33187dba0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Wed, 23 Oct 2013 19:27:15 +0200
+Subject: [PATCH] reorder includes to fix build with eglfs
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+fixes several errors as
+
+| In file included from /home/a.mueller/tmp/oe-core-eglibc/sysroots/colibri-t30/usr/include/X11/Xlib.h:44:0,
+|                  from /home/a.mueller/tmp/oe-core-eglibc/sysroots/colibri-t30/usr/include/EGL/eglplatform.h:118,
+|                  from /home/a.mueller/tmp/oe-core-eglibc/sysroots/colibri-t30/usr/include/EGL/egl.h:36,
+|                  from /home/a.mueller/tmp/oe-core-eglibc/work/cortexa9hf-vfp-neon-angstrom-linux-gnueabi/qtbase/5.1.1-r0/qtbase-opensource-src-5.1.1/src/plugins/platforms/eglfs/qeglfsscreen.h:49,
+|                  from /home/a.mueller/tmp/oe-core-eglibc/work/cortexa9hf-vfp-neon-angstrom-linux-gnueabi/qtbase/5.1.1-r0/qtbase-opensource-src-5.1.1/src/plugins/platforms/eglfs/qeglfsintegration.h:45,
+|                  from /home/a.mueller/tmp/oe-core-eglibc/work/cortexa9hf-vfp-neon-angstrom-linux-gnueabi/qtbase/5.1.1-r0/qtbase-opensource-src-5.1.1/src/plugins/platforms/eglfs/qeglfsintegration.cpp:42:
+| /home/a.mueller/tmp/oe-core-eglibc/work/cortexa9hf-vfp-neon-angstrom-linux-gnueabi/qtbase/5.1.1-r0/qtbase-opensource-src-5.1.1/include/QtCore/../../src/corelib/io/qurl.h:132:9: error: expected identifier before numeric constant
+|          None = 0x0,
+|          ^
+... and follow up error messages
+
+The error is caused by X.h (inluded by Xlib.h)
+
+| #ifndef None
+| #define None                 0L	/* universal null resource or null atom */
+| #endif
+
+and other defines causing symbols used by Qt being replaced.
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/platformsupport/eglconvenience/qeglpbuffer_p.h   |  2 +-
+ src/plugins/platforms/eglfs/qeglfscontext.cpp        | 16 +++++++++++-----
+ src/plugins/platforms/eglfs/qeglfscursor.cpp         |  9 ++++++++-
+ src/plugins/platforms/eglfs/qeglfscursor.h           |  1 -
+ src/plugins/platforms/eglfs/qeglfshooks_stub.cpp     |  8 +++++---
+ src/plugins/platforms/eglfs/qeglfsintegration.cpp    | 20 +++++++++++---------
+ src/plugins/platforms/eglfs/qeglfswindow.cpp         |  7 +++++--
+ .../platforms/minimalegl/qminimaleglwindow.cpp       |  6 ++++--
+ 8 files changed, 45 insertions(+), 24 deletions(-)
+
+diff --git a/src/platformsupport/eglconvenience/qeglpbuffer_p.h b/src/platformsupport/eglconvenience/qeglpbuffer_p.h
+index 1b4ac6f..1237950 100644
+--- a/src/platformsupport/eglconvenience/qeglpbuffer_p.h
++++ b/src/platformsupport/eglconvenience/qeglpbuffer_p.h
+@@ -42,8 +42,8 @@
+ #ifndef QEGLPBUFFER_H
+ #define QEGLPBUFFER_H
+ 
+-#include <EGL/egl.h>
+ #include <qpa/qplatformoffscreensurface.h>
++#include <EGL/egl.h>
+ 
+ QT_BEGIN_NAMESPACE
+ 
+diff --git a/src/plugins/platforms/eglfs/qeglfscontext.cpp b/src/plugins/platforms/eglfs/qeglfscontext.cpp
+index 5143964..c776371 100644
+--- a/src/plugins/platforms/eglfs/qeglfscontext.cpp
++++ b/src/plugins/platforms/eglfs/qeglfscontext.cpp
+@@ -39,15 +39,21 @@
+ **
+ ****************************************************************************/
+ 
+-#include "qeglfscontext.h"
+-#include "qeglfswindow.h"
++#include <QMetaType>
++#include <QTextStream>
++#include <QDataStream>
++
++#include <QtGui/QSurface>
++#include <QtDebug>
++
+ #include "qeglfscursor.h"
+-#include "qeglfshooks.h"
+ #include "qeglfsintegration.h"
++#include "qeglfswindow.h"
++#include "qeglfshooks.h"
++#include "qeglfscontext.h"
++
+ 
+ #include <QtPlatformSupport/private/qeglpbuffer_p.h>
+-#include <QtGui/QSurface>
+-#include <QtDebug>
+ 
+ QT_BEGIN_NAMESPACE
+ 
+diff --git a/src/plugins/platforms/eglfs/qeglfscursor.cpp b/src/plugins/platforms/eglfs/qeglfscursor.cpp
+index 9dc836b..cfffe00 100644
+--- a/src/plugins/platforms/eglfs/qeglfscursor.cpp
++++ b/src/plugins/platforms/eglfs/qeglfscursor.cpp
+@@ -39,7 +39,6 @@
+ **
+ ****************************************************************************/
+ 
+-#include "qeglfscursor.h"
+ #include <qpa/qwindowsysteminterface.h>
+ #include <QtGui/QOpenGLContext>
+ #include <QtCore/QJsonDocument>
+@@ -47,6 +46,14 @@
+ #include <QtCore/QJsonObject>
+ #include <QtDebug>
+ 
++#include "qeglfscursor.h"
++#include "qeglfsscreen.h"
++
++// workaround for CursorShape defined in X.h
++#ifdef CursorShape
++#undef CursorShape
++#endif
++
+ QT_BEGIN_NAMESPACE
+ 
+ QEglFSCursor::QEglFSCursor(QEglFSScreen *screen)
+diff --git a/src/plugins/platforms/eglfs/qeglfscursor.h b/src/plugins/platforms/eglfs/qeglfscursor.h
+index fdbffde..081658d 100644
+--- a/src/plugins/platforms/eglfs/qeglfscursor.h
++++ b/src/plugins/platforms/eglfs/qeglfscursor.h
+@@ -43,7 +43,6 @@
+ #define QEGLFSCURSOR_H
+ 
+ #include <qpa/qplatformcursor.h>
+-#include "qeglfsscreen.h"
+ #include <GLES2/gl2.h>
+ 
+ QT_BEGIN_NAMESPACE
+diff --git a/src/plugins/platforms/eglfs/qeglfshooks_stub.cpp b/src/plugins/platforms/eglfs/qeglfshooks_stub.cpp
+index c334f46..bc37ef9 100644
+--- a/src/plugins/platforms/eglfs/qeglfshooks_stub.cpp
++++ b/src/plugins/platforms/eglfs/qeglfshooks_stub.cpp
+@@ -39,9 +39,6 @@
+ **
+ ****************************************************************************/
+ 
+-#include "qeglfshooks.h"
+-#include "qeglfscursor.h"
+-
+ #include <fcntl.h>
+ #include <unistd.h>
+ #include <linux/fb.h>
+@@ -50,6 +47,11 @@
+ #include <private/qmath_p.h>
+ #include <private/qcore_unix_p.h>
+ 
++#include <QTextStream>
++
++#include "qeglfscursor.h"
++#include "qeglfshooks.h"
++
+ QT_BEGIN_NAMESPACE
+ 
+ // file descriptor for the frame buffer
+diff --git a/src/plugins/platforms/eglfs/qeglfsintegration.cpp b/src/plugins/platforms/eglfs/qeglfsintegration.cpp
+index cf1503b..61382e2 100644
+--- a/src/plugins/platforms/eglfs/qeglfsintegration.cpp
++++ b/src/plugins/platforms/eglfs/qeglfsintegration.cpp
+@@ -39,19 +39,10 @@
+ **
+ ****************************************************************************/
+ 
+-#include "qeglfsintegration.h"
+-
+-#include "qeglfswindow.h"
+-#include "qeglfsbackingstore.h"
+-#include "qeglfshooks.h"
+-
+ #include <QtGui/private/qguiapplication_p.h>
+ 
+ #include <QtPlatformSupport/private/qgenericunixfontdatabase_p.h>
+ #include <QtPlatformSupport/private/qgenericunixeventdispatcher_p.h>
+-#include <QtPlatformSupport/private/qeglconvenience_p.h>
+-#include <QtPlatformSupport/private/qeglplatformcontext_p.h>
+-#include <QtPlatformSupport/private/qeglpbuffer_p.h>
+ 
+ #if !defined(QT_NO_EVDEV) && (!defined(Q_OS_ANDROID) || defined(Q_OS_ANDROID_NO_SDK))
+ #include <QtPlatformSupport/private/qevdevmousemanager_p.h>
+@@ -68,8 +59,19 @@
+ 
+ #include <qpa/qplatforminputcontextfactory_p.h>
+ 
++#include <QTextStream>
++
++#include "qeglfsintegration.h"
++
++#include "qeglfswindow.h"
++#include "qeglfsbackingstore.h"
++#include "qeglfshooks.h"
+ #include "qeglfscontext.h"
+ 
++#include <QtPlatformSupport/private/qeglconvenience_p.h>
++#include <QtPlatformSupport/private/qeglplatformcontext_p.h>
++#include <QtPlatformSupport/private/qeglpbuffer_p.h>
++
+ #include <EGL/egl.h>
+ 
+ QT_BEGIN_NAMESPACE
+diff --git a/src/plugins/platforms/eglfs/qeglfswindow.cpp b/src/plugins/platforms/eglfs/qeglfswindow.cpp
+index 98c54e0..b0b7481 100644
+--- a/src/plugins/platforms/eglfs/qeglfswindow.cpp
++++ b/src/plugins/platforms/eglfs/qeglfswindow.cpp
+@@ -39,12 +39,15 @@
+ **
+ ****************************************************************************/
+ 
+-#include "qeglfswindow.h"
+-#include "qeglfshooks.h"
++#include <QTextStream>
++
+ #include <qpa/qwindowsysteminterface.h>
+ 
+ #include <QtPlatformSupport/private/qeglconvenience_p.h>
+ 
++#include "qeglfswindow.h"
++#include "qeglfshooks.h"
++
+ #include <QtDebug>
+ 
+ QT_BEGIN_NAMESPACE
+diff --git a/src/plugins/platforms/minimalegl/qminimaleglwindow.cpp b/src/plugins/platforms/minimalegl/qminimaleglwindow.cpp
+index 13640b7..26ce1d9 100644
+--- a/src/plugins/platforms/minimalegl/qminimaleglwindow.cpp
++++ b/src/plugins/platforms/minimalegl/qminimaleglwindow.cpp
+@@ -39,10 +39,12 @@
+ **
+ ****************************************************************************/
+ 
+-#include "qminimaleglwindow.h"
+-
+ #include <qpa/qwindowsysteminterface.h>
+ 
++#include <QTextStream>
++
++#include "qminimaleglwindow.h"
++
+ QT_BEGIN_NAMESPACE
+ 
+ QMinimalEglWindow::QMinimalEglWindow(QWindow *w)
+-- 
+1.8.3.1
diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 889ab99..4490a72 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -23,6 +23,7 @@ SRC_URI += " \
     file://0023-configure-make-freetype-a-configurable-option.patch \
     file://0024-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch \
     file://0026-Ensure-lastPixel.y-is-also-initalized-to-1-when-nece.patch \
+    file://0027-reorder-includes-to-fix-build-with-eglfs.patch \
 "
 
 DEPENDS += "qtbase-native"
-- 
1.8.3.1


