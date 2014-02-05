Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id A0FC76E3EC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2014 19:35:18 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id c13so439821eek.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Feb 2014 11:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=XuBmlgpMz9ZQv+WceCvHicx2KZYc2118vnZvloPN+j8=;
	b=TgCxxzyxEstBV1g7jC/GfBEqNyFE/OWLbIXKickbvLicNCa9wZQlw8ix/Mq4pIdw1p
	iPaEid7NJnrdyieEumLnoWdBxUZSsS3k5rmxNP6VG7qcE/CMnJhBjMdzUAt6NJZbpomT
	g9GwxIn9J3Nhqsz0ijbzGmH0BqLA90xlDJJSjnqw0+TOck5mOKslnGqMR18VvWyZLtPN
	culVSGYNrE+brA4kN4zZR3v1HEPb/l5aaguSF2GEUouWniITE5xFuEO0HzfyB8+kYi21
	sT2qPwFQs1A/LIA1e5mZn455qVmB7IL17PbCAhfeSHuKy9PdpeDrzZ5auifV3BaRU9lv
	ryqg==
X-Received: by 10.15.43.141 with SMTP id x13mr3920084eev.35.1391628918911;
	Wed, 05 Feb 2014 11:35:18 -0800 (PST)
Received: from localhost.localdomain (ip-178-200-247-214.unitymediagroup.de.
	[178.200.247.214]) by mx.google.com with ESMTPSA id
	y47sm58045298eel.14.2014.02.05.11.35.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Feb 2014 11:35:18 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Feb 2014 20:35:11 +0100
Message-Id: <1391628912-17880-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH][meta-qt5 1/2] qtbase: eglfs: fix egl error for platforms only supporting one window/surface
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
X-List-Received-Date: Wed, 05 Feb 2014 19:35:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtbase.inc                          |  1 +
 ...gl-error-for-platforms-only-supporting-on.patch | 63 ++++++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase/0015-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 83ce25b..1fbe765 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -19,6 +19,7 @@ SRC_URI += "\
     file://0012-qtbase-allow-build-of-examples.patch \
     file://0013-QOpenGLPaintDevice-sub-area-support.patch \
     file://0014-enables-tslib-device-to-be-read-from-env-variable.patch \
+    file://0015-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
 "
 
 DEPENDS += "qtbase-native"
diff --git a/recipes-qt/qt5/qtbase/0015-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch b/recipes-qt/qt5/qtbase/0015-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
new file mode 100644
index 0000000..96d8281
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0015-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
@@ -0,0 +1,63 @@
+From 093ae963179c237afae7844f67d226bc2f1f5a40 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Wed, 5 Feb 2014 18:35:08 +0100
+Subject: [PATCH] eglfs: fix egl error for platforms only supporting one
+ window/surface
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+running qmlscene -platform eglfs <filename>.qml
+
+caused
+
+EGL Error : Could not create the egl surface: error = 0x3003
+
+Rebased version of [1-2]
+
+Upstream-Status: unknown
+
+[1] http://repository.timesys.com/buildsources/q/qt-everywhere-opensource/qt-everywhere-opensource-5.1.1/qt-everywhere-opensource-5.1.1-qeglfswindow.cpp.patch
+[2] https://github.com/prabindh/qt-configs/blob/master/qt5_1.0_Feb13/qeglfswindow.cpp.patch
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/plugins/platforms/eglfs/qeglfswindow.cpp | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/src/plugins/platforms/eglfs/qeglfswindow.cpp b/src/plugins/platforms/eglfs/qeglfswindow.cpp
+index bba00da..567820c 100644
+--- a/src/plugins/platforms/eglfs/qeglfswindow.cpp
++++ b/src/plugins/platforms/eglfs/qeglfswindow.cpp
+@@ -87,6 +87,16 @@ void QEglFSWindow::create()
+     if (m_flags.testFlag(Created))
+         return;
+ 
++    static EGLSurface __singleWindowSurface;
++    if(QEglFSHooks::hooks() && !QEglFSHooks::hooks()->hasCapability(QPlatformIntegration::MultipleWindows) && (__singleWindowSurface))
++    {
++        m_surface = __singleWindowSurface;
++#ifdef QEGL_EXTRA_DEBUG
++    qWarning("Surface recreate request, re-using %x\n", m_surface);
++#endif
++       return;
++    }
++
+     m_flags = Created;
+     m_wid = newWId();
+ 
+@@ -130,6 +140,11 @@ void QEglFSWindow::create()
+ 
+     resetSurface();
+ 
++    if(QEglFSHooks::hooks() && !QEglFSHooks::hooks()->hasCapability(QPlatformIntegration::MultipleWindows))
++    {
++        __singleWindowSurface = m_surface;
++    }
++
+     screen->setPrimarySurface(m_surface);
+ 
+     if (m_flags.testFlag(IsRaster)) {
+-- 
+1.8.3.1
+
-- 
1.8.3.1


