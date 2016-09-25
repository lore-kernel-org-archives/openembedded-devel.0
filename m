Return-Path: <dachaac@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id C4CB2605C2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Sep 2016 07:55:22 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id s29so7886732lfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Sep 2016 00:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Rh5u4NnvVdknctmEadGx90zvfwNhUXk6PQlEX6SvFgc=;
	b=o+Cp7y3XdUVK1uUe5wCRz7aq3GIIRpSISo9MFWflUUv2Q+f4LbczJJWFeWp/aEMKvh
	VIWNlNqErUavYsH/e1zwiJ9i+R2CyiBPknvQqorzbf5FJIlhdk7Nb+ak6X95qQ82f5MG
	/IOcoQNrT8HvgKlC4EV4bfh3H/lxSwJ9mUnctk+0mtwXy8Ph7pa0HmmZjmuh1VGEtYwV
	KJex7XnH52EWEW91549ss6BX8YD8vAe1aSauwDbrD9sNaVZ/xGuiVZlAfdHAFHbO+CNp
	ujGlE6AhDGMt1PdLrXrhFf7c9twk9Mj2EzjRTxJMSxPKx/IJhBDQ3/xRolKTL9cF7zIL
	k4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Rh5u4NnvVdknctmEadGx90zvfwNhUXk6PQlEX6SvFgc=;
	b=eGPXma7FB51K4mjw9K30fThNdH/XHnTdZkgN/esGGWotOgDsntJ+S5yhzcJmhkJP0q
	98C+h+OGWp0HkmjmFJav+jTtoPqhRGZSbMRsR7hf9dvxPhvRFdzZjA/WZv0sm6iIzi3l
	MzMCqdz2kSS4MeYka3OFKRHsCehG1ExzjAE2cPqQdOeYTuPkpzwDirjkqR3o6J39AadW
	aQLLjltUQnldDT4ts+bCRd2n/Zb/1vzXxhVT2ZRQ4REf53818cde0YJJJAfv43sCbSFW
	HTslL/94IFHGXzOvheJ6bX29snIauA2Nyxnm+p3LnikCSx2gY4x/fQw7/CHSCFg+6E1f
	O2QA==
X-Gm-Message-State: AE9vXwM0J7zLFkMA7RTAY2zqKcoQw7Ujb7RWEXUPZT0i1Sp9VpuHE16bTVhUnPJIVg90mg==
X-Received: by 10.46.1.5 with SMTP id 5mr5076981ljb.16.1474790123428;
	Sun, 25 Sep 2016 00:55:23 -0700 (PDT)
Received: from localhost.localdomain
	(dtd-fyyhbw4v5697nzw6y-3.rev.dnainternet.fi.
	[2001:14ba:80fe:4000:c196:239d:776b:a4b4])
	by smtp.gmail.com with ESMTPSA id
	l65sm2675934lfl.30.2016.09.25.00.55.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Sep 2016 00:55:22 -0700 (PDT)
From: =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?= <dachaac@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Sep 2016 10:54:49 +0300
Message-Id: <1474790089-17176-1-git-send-email-dachaac@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-qt5][krogoth][PATCH] qtwayland: Fix building of QWaylandIntegration if some Qt5 features are disabled.
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
X-List-Received-Date: Sun, 25 Sep 2016 07:55:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

QPlatformIntegration's interface methods are disabled based on QT_NO_OPENGL,
QT_NO_CLIPBOARD, QT_NO_DRAGANDDROP, QT_NO_ACCESSIBILITY and
QT_NO_SESSIONMANAGER, these has to be taken into account when compiling
QtWayland.

Signed-off-by: Vesa Jääskeläinen <dachaac@gmail.com>
---
 recipes-qt/qt5/qtwayland-native_git.bb             |   1 +
 ...g-of-QWaylandIntegration-if-some-Qt5-feat.patch | 156 +++++++++++++++++++++
 recipes-qt/qt5/qtwayland_git.bb                    |   1 +
 3 files changed, 158 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwayland/0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.patch

diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index 8fc1862..18477b0 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -15,6 +15,7 @@ DEPENDS = "qtbase-native wayland-native"
 
 SRC_URI += " \
     file://0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch \
+    file://0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.patch \
 "
 
 do_configure() {
diff --git a/recipes-qt/qt5/qtwayland/0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.patch b/recipes-qt/qt5/qtwayland/0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.patch
new file mode 100644
index 0000000..d173e67
--- /dev/null
+++ b/recipes-qt/qt5/qtwayland/0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.patch
@@ -0,0 +1,156 @@
+From de85e1c1ee76be845a21b441d9e4ea12a30d84c7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?= <dachaac@gmail.com>
+Date: Sun, 18 Sep 2016 11:51:59 +0300
+Subject: [PATCH] Fix building of QWaylandIntegration if some Qt5 features are
+ disabled.
+
+QPlatformIntegration's interface methods are disabled based on QT_NO_OPENGL,
+QT_NO_CLIPBOARD, QT_NO_DRAGANDDROP, QT_NO_ACCESSIBILITY and
+QT_NO_SESSIONMANAGER, these has to be taken into account when compiling
+QtWayland.
+---
+ src/client/qwaylandintegration.cpp | 21 ++++++++++++++++++---
+ src/client/qwaylandintegration_p.h | 12 ++++++++++++
+ 2 files changed, 30 insertions(+), 3 deletions(-)
+
+diff --git a/src/client/qwaylandintegration.cpp b/src/client/qwaylandintegration.cpp
+index 39fff53..481e3d6 100644
+--- a/src/client/qwaylandintegration.cpp
++++ b/src/client/qwaylandintegration.cpp
+@@ -39,7 +39,9 @@
+ #include "qwaylandinputcontext_p.h"
+ #include "qwaylandshmbackingstore_p.h"
+ #include "qwaylandnativeinterface_p.h"
++#ifndef QT_NO_CLIPBOARD
+ #include "qwaylandclipboard_p.h"
++#endif
+ #include "qwaylanddnd_p.h"
+ #include "qwaylandwindowmanagerintegration_p.h"
+ #include "qwaylandscreen_p.h"
+@@ -57,7 +59,9 @@
+ #include <QSocketNotifier>
+ 
+ #include <qpa/qplatforminputcontextfactory_p.h>
++#ifndef QT_NO_ACCESSIBILITY
+ #include <qpa/qplatformaccessibility.h>
++#endif
+ #include <qpa/qplatforminputcontext.h>
+ 
+ #include "qwaylandhardwareintegration_p.h"
+@@ -117,8 +121,6 @@ QWaylandIntegration::QWaylandIntegration()
+     , mNativeInterface(new QWaylandNativeInterface(this))
+ #ifndef QT_NO_ACCESSIBILITY
+     , mAccessibility(new QPlatformAccessibility())
+-#else
+-    , mAccessibility(0)
+ #endif
+     , mClientBufferIntegrationInitialized(false)
+     , mServerBufferIntegrationInitialized(false)
+@@ -126,9 +128,12 @@ QWaylandIntegration::QWaylandIntegration()
+ {
+     initializeInputDeviceIntegration();
+     mDisplay = new QWaylandDisplay(this);
++#ifndef QT_NO_CLIPBOARD
+     mClipboard = new QWaylandClipboard(mDisplay);
++#endif
++#ifndef QT_NO_DRAGANDDROP
+     mDrag = new QWaylandDrag(mDisplay);
+-
++#endif
+     QString icStr = QPlatformInputContextFactory::requested();
+     icStr.isNull() ? mInputContext.reset(new QWaylandInputContext(mDisplay))
+                    : mInputContext.reset(QPlatformInputContextFactory::create(icStr));
+@@ -136,8 +141,12 @@ QWaylandIntegration::QWaylandIntegration()
+ 
+ QWaylandIntegration::~QWaylandIntegration()
+ {
++#ifndef QT_NO_DRAGANDDROP
+     delete mDrag;
++#endif
++#ifndef QT_NO_CLIPBOARD
+     delete mClipboard;
++#endif
+ #ifndef QT_NO_ACCESSIBILITY
+     delete mAccessibility;
+ #endif
+@@ -213,15 +222,19 @@ QPlatformFontDatabase *QWaylandIntegration::fontDatabase() const
+     return mFontDb;
+ }
+ 
++#ifndef QT_NO_CLIPBOARD
+ QPlatformClipboard *QWaylandIntegration::clipboard() const
+ {
+     return mClipboard;
+ }
++#endif
+ 
++#ifndef QT_NO_DRAGANDDROP
+ QPlatformDrag *QWaylandIntegration::drag() const
+ {
+     return mDrag;
+ }
++#endif
+ 
+ QPlatformInputContext *QWaylandIntegration::inputContext() const
+ {
+@@ -243,10 +256,12 @@ QVariant QWaylandIntegration::styleHint(StyleHint hint) const
+     return QPlatformIntegration::styleHint(hint);
+ }
+ 
++#ifndef QT_NO_ACCESSIBILITY
+ QPlatformAccessibility *QWaylandIntegration::accessibility() const
+ {
+     return mAccessibility;
+ }
++#endif
+ 
+ QPlatformServices *QWaylandIntegration::services() const
+ {
+diff --git a/src/client/qwaylandintegration_p.h b/src/client/qwaylandintegration_p.h
+index 987d805..b50ad95 100644
+--- a/src/client/qwaylandintegration_p.h
++++ b/src/client/qwaylandintegration_p.h
+@@ -80,15 +80,21 @@ public:
+ 
+     QPlatformNativeInterface *nativeInterface() const Q_DECL_OVERRIDE;
+ 
++#ifndef QT_NO_CLIPBOARD
+     QPlatformClipboard *clipboard() const Q_DECL_OVERRIDE;
++#endif
+ 
++#ifndef QT_NO_DRAGANDDROP
+     QPlatformDrag *drag() const Q_DECL_OVERRIDE;
++#endif
+ 
+     QPlatformInputContext *inputContext() const Q_DECL_OVERRIDE;
+ 
+     QVariant styleHint(StyleHint hint) const Q_DECL_OVERRIDE;
+ 
++#ifndef QT_NO_ACCESSIBILITY
+     QPlatformAccessibility *accessibility() const Q_DECL_OVERRIDE;
++#endif
+ 
+     QPlatformServices *services() const Q_DECL_OVERRIDE;
+ 
+@@ -117,12 +123,18 @@ private:
+     void initializeInputDeviceIntegration();
+ 
+     QPlatformFontDatabase *mFontDb;
++#ifndef QT_NO_CLIPBOARD
+     QPlatformClipboard *mClipboard;
++#endif
++#ifndef QT_NO_DRAGANDDROP
+     QPlatformDrag *mDrag;
++#endif
+     QWaylandDisplay *mDisplay;
+     QPlatformNativeInterface *mNativeInterface;
+     QScopedPointer<QPlatformInputContext> mInputContext;
++#ifndef QT_NO_ACCESSIBILITY
+     QPlatformAccessibility *mAccessibility;
++#endif
+     bool mClientBufferIntegrationInitialized;
+     bool mServerBufferIntegrationInitialized;
+     bool mShellIntegrationInitialized;
+-- 
+2.7.4
+
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 3153dc0..f6c4903 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -34,6 +34,7 @@ FILES_${PN}-plugins-dbg += " \
 
 SRC_URI += " \
     file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
+    file://0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.patch \
 "
 
 SRCREV = "d8b4bef3ddff327598027c8f94a61e3d0b61a2dd"
-- 
2.7.4


