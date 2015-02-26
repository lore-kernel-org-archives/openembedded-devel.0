Return-Path: <stephan.binner@basyskom.com>
Received: from mx1.basyskom.com (groupware.basyskom.com [144.76.148.65])
	by mail.openembedded.org (Postfix) with ESMTP id 26E0173731
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2015 13:11:15 +0000 (UTC)
X-Footer: YmFzeXNrb20uY29t
Received: from fridolin.localnet ([193.158.222.114])
	(authenticated user sbin@basyskom.com)
	by mx1.basyskom.com (Kerio Connect 8.4.0)
	(using TLSv1.1 with cipher DHE-RSA-AES256-SHA (256 bits))
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Feb 2015 14:11:14 +0100
From: Stephan Binner <stephan.binner@basyskom.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Feb 2015 14:11:14 +0100
Message-ID: <2271195.WOsUHlN0Xa@fridolin>
Organization: basysKom GmbH
User-Agent: KMail/4.8.5 (Linux/3.2.0-76-generic; KDE/4.8.5; x86_64; ; )
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] fix build of qtbase with "gles2" package config
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
X-List-Received-Date: Thu, 26 Feb 2015 13:11:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"


---
 .../qtbase/0014-fix-build-of-egl-integration.patch | 181 +++++++++++++++++++++
 recipes-qt/qt5/qtbase_5.4.1.bb                     |   5 +
 2 files changed, 186 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase/0014-fix-build-of-egl-integration.patch

diff --git a/recipes-qt/qt5/qtbase/0014-fix-build-of-egl-integration.patch b/recipes-qt/qt5/qtbase/0014-fix-build-of-egl-integration.patch
new file mode 100644
index 0000000..f21e820
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0014-fix-build-of-egl-integration.patch
@@ -0,0 +1,181 @@
+commit f8c8c79029867a087c9a753269d82b808c16f047
+Author: Stephan Binner <stephan.binner@basyskom.com>
+Date:   Mon Feb 2 13:10:50 2015 +0100
+
+    Fix build of egl integration
+    
+    Add missing includes and reorder includes to avoid X defines breakage
+    
+    Change-Id: Iaf95ae2488df3d3301436262ed79f7091b4be0a9
+    Reviewed-by: Laszlo Agocs <laszlo.agocs@theqtcompany.com>
+
+diff --git a/src/platformsupport/eglconvenience/qeglplatformcontext_p.h b/src/platformsupport/eglconvenience/qeglplatformcontext_p.h
+index 7825c7b..0c10710 100644
+--- a/src/platformsupport/eglconvenience/qeglplatformcontext_p.h
++++ b/src/platformsupport/eglconvenience/qeglplatformcontext_p.h
+@@ -45,6 +45,7 @@
+ // We mean it.
+ //
+ 
++#include <QtCore/qtextstream.h>
+ #include <qpa/qplatformwindow.h>
+ #include <qpa/qplatformopenglcontext.h>
+ #include <QtCore/QVariant>
+diff --git a/src/platformsupport/eglconvenience/qeglplatformintegration_p.h b/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
+index 4d7adce..2b5d5f5 100644
+--- a/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
++++ b/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
+@@ -45,9 +45,9 @@
+ // We mean it.
+ //
+ 
++#include <QtCore/QVariant>
+ #include <qpa/qplatformintegration.h>
+ #include <qpa/qplatformnativeinterface.h>
+-#include <QtCore/QVariant>
+ #include <EGL/egl.h>
+ 
+ QT_BEGIN_NAMESPACE
+diff --git a/src/plugins/platforms/eglfs/qeglfscontext.cpp b/src/plugins/platforms/eglfs/qeglfscontext.cpp
+index 6216fa8..6470280 100644
+--- a/src/plugins/platforms/eglfs/qeglfscontext.cpp
++++ b/src/plugins/platforms/eglfs/qeglfscontext.cpp
+@@ -31,15 +31,16 @@
+ **
+ ****************************************************************************/
+ 
+-#include "qeglfscontext.h"
+-#include "qeglfswindow.h"
+-#include "qeglfshooks.h"
++#include <QtGui/QSurface>
++#include <QtDebug>
+ 
++#include <QtPlatformSupport/private/qeglplatformcursor_p.h>
+ #include <QtPlatformSupport/private/qeglconvenience_p.h>
+ #include <QtPlatformSupport/private/qeglpbuffer_p.h>
+-#include <QtPlatformSupport/private/qeglplatformcursor_p.h>
+-#include <QtGui/QSurface>
+-#include <QtDebug>
++
++#include "qeglfswindow.h"
++#include "qeglfshooks.h"
++#include "qeglfscontext.h"
+ 
+ QT_BEGIN_NAMESPACE
+ 
+diff --git a/src/plugins/platforms/eglfs/qeglfshooks_stub.cpp b/src/plugins/platforms/eglfs/qeglfshooks_stub.cpp
+index 26d77a2..120c603 100644
+--- a/src/plugins/platforms/eglfs/qeglfshooks_stub.cpp
++++ b/src/plugins/platforms/eglfs/qeglfshooks_stub.cpp
+@@ -31,10 +31,10 @@
+ **
+ ****************************************************************************/
+ 
+-#include "qeglfshooks.h"
+ #include <QtPlatformSupport/private/qeglplatformcursor_p.h>
+ #include <QtPlatformSupport/private/qeglconvenience_p.h>
+ #include <QtCore/QRegularExpression>
++#include "qeglfshooks.h"
+ 
+ #if defined(Q_OS_LINUX)
+ #include <fcntl.h>
+diff --git a/src/plugins/platforms/eglfs/qeglfsintegration.cpp b/src/plugins/platforms/eglfs/qeglfsintegration.cpp
+index 2a4eae3..fbdd1d4 100644
+--- a/src/plugins/platforms/eglfs/qeglfsintegration.cpp
++++ b/src/plugins/platforms/eglfs/qeglfsintegration.cpp
+@@ -31,26 +31,26 @@
+ **
+ ****************************************************************************/
+ 
+-#include "qeglfsintegration.h"
++#include <QtCore/qtextstream.h>
++#include <QtGui/private/qguiapplication_p.h>
++
++#include <qpa/qplatformwindow.h>
++#include <QtGui/QSurfaceFormat>
++#include <QtGui/QOpenGLContext>
++#include <QtGui/QScreen>
++#include <QtGui/QOffscreenSurface>
++#include <qpa/qplatformcursor.h>
+ 
++#include "qeglfsintegration.h"
+ #include "qeglfswindow.h"
+ #include "qeglfshooks.h"
+ #include "qeglfscontext.h"
+ 
+-#include <QtGui/private/qguiapplication_p.h>
+-
+ #include <QtPlatformSupport/private/qeglconvenience_p.h>
+ #include <QtPlatformSupport/private/qeglplatformcontext_p.h>
+ #include <QtPlatformSupport/private/qeglpbuffer_p.h>
+ #include <QtPlatformHeaders/QEGLNativeContext>
+ 
+-#include <qpa/qplatformwindow.h>
+-#include <QtGui/QSurfaceFormat>
+-#include <QtGui/QOpenGLContext>
+-#include <QtGui/QScreen>
+-#include <QtGui/QOffscreenSurface>
+-#include <qpa/qplatformcursor.h>
+-
+ #include <EGL/egl.h>
+ 
+ static void initResources()
+diff --git a/src/plugins/platforms/eglfs/qeglfsscreen.cpp b/src/plugins/platforms/eglfs/qeglfsscreen.cpp
+index cd68540..bc93fe2 100644
+--- a/src/plugins/platforms/eglfs/qeglfsscreen.cpp
++++ b/src/plugins/platforms/eglfs/qeglfsscreen.cpp
+@@ -31,10 +31,12 @@
+ **
+ ****************************************************************************/
+ 
++#include <QtCore/qtextstream.h>
++#include <QtPlatformSupport/private/qeglplatformcursor_p.h>
++
+ #include "qeglfsscreen.h"
+ #include "qeglfswindow.h"
+ #include "qeglfshooks.h"
+-#include <QtPlatformSupport/private/qeglplatformcursor_p.h>
+ 
+ QT_BEGIN_NAMESPACE
+ 
+diff --git a/src/plugins/platforms/eglfs/qeglfswindow.cpp b/src/plugins/platforms/eglfs/qeglfswindow.cpp
+index f5839e0..39a3ef9 100644
+--- a/src/plugins/platforms/eglfs/qeglfswindow.cpp
++++ b/src/plugins/platforms/eglfs/qeglfswindow.cpp
+@@ -31,8 +31,7 @@
+ **
+ ****************************************************************************/
+ 
+-#include "qeglfswindow.h"
+-#include "qeglfshooks.h"
++#include <QtCore/qtextstream.h>
+ #include <qpa/qwindowsysteminterface.h>
+ #include <qpa/qplatformintegration.h>
+ #include <private/qguiapplication_p.h>
+@@ -40,6 +39,9 @@
+ #include <QtPlatformSupport/private/qeglplatformcursor_p.h>
+ #include <QtPlatformSupport/private/qeglconvenience_p.h>
+ 
++#include "qeglfswindow.h"
++#include "qeglfshooks.h"
++
+ #include <QtDebug>
+ 
+ QT_BEGIN_NAMESPACE
+diff --git a/src/plugins/platforms/minimalegl/qminimaleglwindow.cpp b/src/plugins/platforms/minimalegl/qminimaleglwindow.cpp
+index 906a130..d4bee2c 100644
+--- a/src/plugins/platforms/minimalegl/qminimaleglwindow.cpp
++++ b/src/plugins/platforms/minimalegl/qminimaleglwindow.cpp
+@@ -31,10 +31,10 @@
+ **
+ ****************************************************************************/
+ 
+-#include "qminimaleglwindow.h"
+-
+ #include <qpa/qwindowsysteminterface.h>
+ 
++#include "qminimaleglwindow.h"
++
+ QT_BEGIN_NAMESPACE
+ 
+ QMinimalEglWindow::QMinimalEglWindow(QWindow *w)
diff --git a/recipes-qt/qt5/qtbase_5.4.1.bb b/recipes-qt/qt5/qtbase_5.4.1.bb
index 6215e82..d423219 100644
--- a/recipes-qt/qt5/qtbase_5.4.1.bb
+++ b/recipes-qt/qt5/qtbase_5.4.1.bb
@@ -1,5 +1,10 @@
 require qt5-${PV}.inc
 require ${PN}.inc
 
+# This patch is in 5.4 branch but didn't make it into 5.4.1 release
+SRC_URI += "\
+    file://0014-fix-build-of-egl-integration.patch \
+"
+
 SRC_URI[md5sum] = "9507825e558c980fed602de1f16ec7ae"
 SRC_URI[sha256sum] = "8574a593830959c0f7e5430fe77a43832ea7f5299e14a397a74576b3df7fb1b7"
-- 
1.9.1




