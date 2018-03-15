Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5409878889
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2018 02:03:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="37832310"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Mar 2018 10:03:29 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 12152486A78B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2018 10:03:30 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 15 Mar 2018 10:03:29 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 15 Mar 2018 10:03:15 +0800
Message-ID: <1521079395-25438-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521079395-25438-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1521079395-25438-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 12152486A78B.A4EC3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-qt5][PATCH] qtbase: Fix the qt5 linuxfb ratation problem
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
X-List-Received-Date: Thu, 15 Mar 2018 02:03:29 -0000
Content-Type: text/plain

This patch fix the qt5 linuxfb ratation problem, create an mrotation option which can rotate the display by 90,180 and 270 degrees.
Use tslib as a touch plugin to make rotation of touch coordinates effective.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 ...01-Fix-the-qt5.6-linuxfb-ratation-problem.patch | 120 +++++++++++++++++++++
 recipes-qt/qt5/qtbase/0012-Fix-rotate-tslib.patch  |  75 +++++++++++++
 recipes-qt/qt5/qtbase_git.bb                       |  10 ++
 3 files changed, 205 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase/0001-Fix-the-qt5.6-linuxfb-ratation-problem.patch
 create mode 100644 recipes-qt/qt5/qtbase/0012-Fix-rotate-tslib.patch

diff --git a/recipes-qt/qt5/qtbase/0001-Fix-the-qt5.6-linuxfb-ratation-problem.patch b/recipes-qt/qt5/qtbase/0001-Fix-the-qt5.6-linuxfb-ratation-problem.patch
new file mode 100644
index 0000000..12ba9fa
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0001-Fix-the-qt5.6-linuxfb-ratation-problem.patch
@@ -0,0 +1,120 @@
+From 8b4e54674a248fda7f1b72e01f429f495e4054e0 Mon Sep 17 00:00:00 2001
+From: Fan Xin <fan.xin@jp.fujitsu.com>
+Date: Wed, 6 Dec 2017 18:47:53 +0900
+Subject: [PATCH] Fix the qt5.6 linuxfb ratation problem
+
+This patch is backported from
+https://borkedlabs.com/blog/2015/06-01-qt5-linuxfb-rotation-for-lcds/
+
+Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
+Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
+---
+ src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp | 38 +++++++++++++++++++++++++---
+ src/plugins/platforms/linuxfb/qlinuxfbscreen.h   |  1 +
+ 2 files changed, 35 insertions(+), 4 deletions(-)
+
+diff --git a/src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp b/src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp
+index 91708c0..0bf64db 100644
+--- a/src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp
++++ b/src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp
+@@ -280,7 +280,7 @@ static void blankScreen(int fd, bool on)
+ }
+ 
+ QLinuxFbScreen::QLinuxFbScreen(const QStringList &args)
+-    : mArgs(args), mFbFd(-1), mTtyFd(-1), mBlitter(0)
++    : mArgs(args), mFbFd(-1), mTtyFd(-1), mBlitter(0), mRotation(90)
+ {
+     mMmap.data = 0;
+ }
+@@ -306,6 +306,7 @@ bool QLinuxFbScreen::initialize()
+     QRegularExpression mmSizeRx(QLatin1String("mmsize=(\\d+)x(\\d+)"));
+     QRegularExpression sizeRx(QLatin1String("size=(\\d+)x(\\d+)"));
+     QRegularExpression offsetRx(QLatin1String("offset=(\\d+)x(\\d+)"));
++    QRegularExpression rotationRx(QLatin1String("rotation=(0|90|180|270)"));
+ 
+     QString fbDevice, ttyDevice;
+     QSize userMmSize;
+@@ -327,6 +328,8 @@ bool QLinuxFbScreen::initialize()
+             ttyDevice = match.captured(1);
+         else if (arg.contains(fbRx, &match))
+             fbDevice = match.captured(1);
++        else if (arg.contains(rotationRx, &match))
++            mRotation = match.captured(1).toInt();
+     }
+ 
+     if (fbDevice.isEmpty()) {
+@@ -365,9 +368,17 @@ bool QLinuxFbScreen::initialize()
+     mDepth = determineDepth(vinfo);
+     mBytesPerLine = finfo.line_length;
+     QRect geometry = determineGeometry(vinfo, userGeometry);
++    QRect originalGeometry = geometry;
++    if( mRotation == 90 || mRotation == 270 )
++    {
++        int tmp = geometry.width();
++        geometry.setWidth(geometry.height());
++        geometry.setHeight(tmp);
++    }
++
+     mGeometry = QRect(QPoint(0, 0), geometry.size());
+     mFormat = determineFormat(vinfo, mDepth);
+-    mPhysicalSize = determinePhysicalSize(vinfo, userMmSize, geometry.size());
++    mPhysicalSize = determinePhysicalSize(vinfo, userMmSize, originalGeometry.size());
+ 
+     // mmap the framebuffer
+     mMmap.size = finfo.smem_len;
+@@ -377,11 +388,11 @@ bool QLinuxFbScreen::initialize()
+         return false;
+     }
+ 
+-    mMmap.offset = geometry.y() * mBytesPerLine + geometry.x() * mDepth / 8;
++    mMmap.offset = originalGeometry.y() * mBytesPerLine + originalGeometry.x() * mDepth / 8;
+     mMmap.data = data + mMmap.offset;
+ 
+     QFbScreen::initializeCompositor();
+-    mFbScreenImage = QImage(mMmap.data, geometry.width(), geometry.height(), mBytesPerLine, mFormat);
++    mFbScreenImage = QImage(mMmap.data, originalGeometry.width(), originalGeometry.height(), mBytesPerLine, mFormat);
+ 
+     mCursor = new QFbCursor(this);
+ 
+@@ -411,7 +422,26 @@ QRegion QLinuxFbScreen::doRedraw()
+ 
+     mBlitter->setCompositionMode(QPainter::CompositionMode_Source);
+     for (const QRect &rect : touched)
++    {
++        if( mRotation == 90 || mRotation == 270 )
++        {
++            mBlitter->translate(mGeometry.height()/2, mGeometry.width()/2);
++        }
++        else if( mRotation == 180 )
++        {
++            mBlitter->translate(mGeometry.width()/2, mGeometry.height()/2);
++        }
++
++        if( mRotation != 0 )
++        {
++            mBlitter->rotate(mRotation);
++            mBlitter->translate(-mGeometry.width()/2, -mGeometry.height()/2);
++        }
++
+         mBlitter->drawImage(rect, mScreenImage, rect);
++
++        mBlitter->resetTransform();
++    }
+ 
+     return touched;
+ } 
+diff --git a/src/plugins/platforms/linuxfb/qlinuxfbscreen.h b/src/plugins/platforms/linuxfb/qlinuxfbscreen.h
+index 1adce21..2f74b0c 100644
+--- a/src/plugins/platforms/linuxfb/qlinuxfbscreen.h
++++ b/src/plugins/platforms/linuxfb/qlinuxfbscreen.h
+@@ -58,6 +58,7 @@ private:
+     QStringList mArgs;
+     int mFbFd;
+     int mTtyFd;
++    int mRotation;
+ 
+     QImage mFbScreenImage;
+     int mBytesPerLine;
+-- 
+2.7.4
+
diff --git a/recipes-qt/qt5/qtbase/0012-Fix-rotate-tslib.patch b/recipes-qt/qt5/qtbase/0012-Fix-rotate-tslib.patch
new file mode 100644
index 0000000..fe32fc4
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0012-Fix-rotate-tslib.patch
@@ -0,0 +1,75 @@
+This patch is backported from
+https://forum.qt.io/topic/67820/cannot-rotate-my-touchscreen-with-qt_qpa_evdev_touchscreen_parameters-using-linuxfb-plugin/2
+
+--- git/src/platformsupport/input/tslib/qtslib.cpp.orig	2018-01-18 10:47:49.161802514 +0900
++++ git/src/platformsupport/input/tslib/qtslib.cpp	2018-01-18 10:49:42.077798388 +0900
+@@ -35,6 +35,8 @@
+ 
+ #include <QSocketNotifier>
+ #include <QStringList>
++#include <QString>
++#include <QPointF>
+ #include <QPoint>
+ #include <QLoggingCategory>
+ 
+@@ -102,6 +104,30 @@ static bool get_sample(struct tsdev *dev
+ void QTsLibMouseHandler::readMouseData()
+ {
+     ts_sample sample;
++    QString spec = QString::fromLocal8Bit(qgetenv("TSLIB_PARAMETERS"));
++    int RotateAngle;
++    int Width;
++    int Height;
++    QString ModeArg;
++
++    if(spec.isEmpty()){
++       RotateAngle = 0;
++       Height = 480;
++       Width = 272;
++    }
++
++    QStringList args = spec.split(QLatin1Char(':'));
++    for (int i = 0; i < args.count(); ++i) {
++        if(args.at(i).startsWith(QLatin1String("rotate"))) {
++          QString rotateArg = args.at(i).section(QLatin1Char('='), 1, 1);
++          RotateAngle = rotateArg.toInt();
++        }
++       else if(args.at(i).startsWith(QLatin1String("mode"))) {
++          ModeArg = args.at(i).section(QLatin1Char('='), 1, 1);
++          Width = ModeArg.section(QLatin1Char('x'),0,0).toInt();
++          Height= ModeArg.section(QLatin1Char('x'),1,1).toInt();
++        }
++    }
+ 
+     while (get_sample(m_dev, &sample, m_rawMode)) {
+         bool pressed = sample.pressure;
+@@ -121,7 +147,28 @@ void QTsLibMouseHandler::readMouseData()
+             if (dx*dx <= 4 && dy*dy <= 4 && pressed == m_pressed)
+                 continue;
+         }
+-        QPoint pos(x, y);
++       QPoint pos(x,y);
++       //Switch to apply rotation
++       switch (RotateAngle) {
++            case 0:
++               pos.setX(x);
++               pos.setY(y);
++               break;
++            case 90:
++               pos.setX(y);
++               pos.setY(Width-x);
++               break;
++            case 180:
++               pos.setX(Width-x);
++               pos.setY(Height-y);
++               break;
++            case 270:
++               pos.setX(Height-y);
++               pos.setY(x);
++               break;
++            default:
++                break;
++        }
+ 
+         QWindowSystemInterface::handleMouseEvent(0, pos, pos, pressed ? Qt::LeftButton : Qt::NoButton);
+ 
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 6532dde..9537a61 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -31,6 +31,8 @@ SRC_URI += "\
     file://0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch \
     file://0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch \
     file://0012-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch \
+    file://0001-Fix-the-qt5.6-linuxfb-ratation-problem.patch \
+    file://0012-Fix-rotate-tslib.patch \
 "
 
 # LGPL-3.0 is used only in src/plugins/platforms/android/extract.cpp
@@ -85,6 +87,12 @@ PACKAGECONFIG ?= " \
     ${PACKAGECONFIG_FONTS} \
     ${PACKAGECONFIG_SYSTEM} \
     ${PACKAGECONFIG_DISTRO} \
+    linuxfb \
+    tslib \
+    sm \
+    accessibility \
+    harfbuzz \
+    examples \ 
 "
 
 PACKAGECONFIG[release] = "-release,-debug"
@@ -245,3 +253,5 @@ INSANE_SKIP_${PN}-mkspecs += "file-rdeps"
 RRECOMMENDS_${PN}-plugins += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-locale', '', d)}"
 
 SRCREV = "6c6ace9d23f90845fd424e474d38fe30f070775e"
+
+PR = "r2"
-- 
2.7.4




