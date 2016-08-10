Return-Path: <johannes.pointner@br-automation.com>
X-Greylist: delayed 902 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 10 Aug 2016 15:05:55 UTC
Received: from mail2.br-automation.com (mail2.br-automation.com
	[213.33.116.61])
	by mail.openembedded.org (Postfix) with ESMTP id 771E774197
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 15:05:55 +0000 (UTC)
X-AuditID: c0a80110-96fff700000033ed-5e-57ab3f4bb7f6
Received: from brsmtp01.br-automation.com (Unknown_Domain [192.168.1.60])
	by  () with SMTP id A3.1F.13293.B4F3BA75;
	Wed, 10 Aug 2016 16:50:52 +0200 (CEST)
From: Johannes Pointner <johannes.pointner@br-automation.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Aug 2016 16:50:37 +0200
Message-Id: <20160810145037.27172-1-johannes.pointner@br-automation.com>
X-Mailer: git-send-email 2.9.2
X-MIMETrack: Itemize by SMTP Server on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 10/08/2016 16:51:26,
	Serialize by Router on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 10/08/2016 16:51:31,
	Serialize complete at 10/08/2016 16:51:31,
	Itemize by SMTP Server on BRSMTP01/Eggelsberg/AT/B&R(Release
	9.0.1FP5|November 22, 2015) at 10.08.2016 16:50:50,
	Serialize by Router on BRSMTP01/Eggelsberg/AT/B&R(Release
	9.0.1FP5|November 22, 2015) at 10.08.2016 16:50:50,
	Serialize complete at 10.08.2016 16:50:50
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNJMWRmVeSWpSXmKPExsVyYAWjja6v/epwg01iFhcPL2V2YPQ4t3EF
	YwBjFJdNSmpOZllqkb5dAlfGnLavrAWbhCpO3nnO1sD4k7+LkZNDQsBEYm/bXCYQW0hgDqPE
	y40GIDabgK3EkQlfWUBsEQFdiY8f5jKC2MwC1hLvly9gBbGFBewkdv1sArNZBFQl3rVfAqvn
	FfCQeLF6FRvEfDmJl69/MncxcgHZG1kkNkx7xA6REJI4vfgs8wRG7gWMDKsYxXMTM3OM9JKK
	dBNLS/JzE0sy8/P0kvNzNzFCvCiwg3H3G+1DjAIcjEo8vB+sVocLsSaWFVfmHmKU4GBWEuF1
	swEK8aYkVlalFuXHF5XmpBYfYpTmYFES532huCRcSCA9sSQ1OzW1ILUIJsvEwSnVwOhxt7qL
	b/Gk979PSgjOV7UI4f7dXlB0e079DheFnJYNb5vSze/M3jD5woSXL338Dpu+Oc+x4P62Hxyv
	5HvYpjUsOi1w9UeNsfgx7x0rJi6yr5fu71fhsXfXeN39N8zT00S/Qp03/89XqeKQAIEZIvMV
	TjwK4I0NaJtpxdxk49fLacpzjzO3SomlOCPRUIu5qDgRAPwF17DeAQAA
Subject: [meta-qt5][PATCH] qtbase: Fix build with QT_NO_OPENGL
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
X-List-Received-Date: Wed, 10 Aug 2016 15:05:58 -0000

This fixes the build of qtbase without opengl support

Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
---
 .../qtbase/0013-Fix-build-with-QT_NO_OPENGL.patch  | 33 ++++++++++++++++++++++
 recipes-qt/qt5/qtbase_git.bb                       |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase/0013-Fix-build-with-QT_NO_OPENGL.patch

diff --git a/recipes-qt/qt5/qtbase/0013-Fix-build-with-QT_NO_OPENGL.patch b/recipes-qt/qt5/qtbase/0013-Fix-build-with-QT_NO_OPENGL.patch
new file mode 100644
index 0000000..7b681dc
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0013-Fix-build-with-QT_NO_OPENGL.patch
@@ -0,0 +1,33 @@
+From 2e176e3d10535e4fdaa6ecc919538f66f4a2930d Mon Sep 17 00:00:00 2001
+From: Andy Nichols <andy.nichols@qt.io>
+Date: Mon, 11 Jul 2016 09:18:33 +0200
+Subject: QWidgetBackingStore: Fix build with QT_NO_OPENGL
+
+A define moved out of the #ifndef QT_NO_OPENGL scope.
+
+Change-Id: I41c943b97f165b5171581e01f3a4b2d3fb25747e
+Reviewed-by: Laszlo Agocs <laszlo.agocs@qt.io>
+
+Upstream-Status: Backport
+Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
+---
+ src/widgets/kernel/qwidgetbackingstore.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/widgets/kernel/qwidgetbackingstore.cpp b/src/widgets/kernel/qwidgetbackingstore.cpp
+index 32aabce..242e625 100644
+--- a/src/widgets/kernel/qwidgetbackingstore.cpp
++++ b/src/widgets/kernel/qwidgetbackingstore.cpp
+@@ -67,7 +67,9 @@ QT_BEGIN_NAMESPACE
+
+ extern QRegion qt_dirtyRegion(QWidget *);
+
++#ifndef QT_NO_OPENGL
+ Q_GLOBAL_STATIC(QPlatformTextureList, qt_dummy_platformTextureList)
++#endif
+
+ /**
+  * Flushes the contents of the \a backingStore into the screen area of \a widget.
+--
+cgit v1.0-4-g1e03
+
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index f69c33c..c82195d 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -26,6 +26,7 @@ SRC_URI += "\
     file://0008-configure-paths-for-target-qmake-properly.patch \
     file://0009-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch \
     file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
+    file://0013-Fix-build-with-QT_NO_OPENGL.patch \
 "
 
 DEPENDS += "qtbase-native"
-- 
2.9.2


