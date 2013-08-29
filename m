Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8DC0D6BB4A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 14:31:49 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so287051eae.37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 07:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yrxM1qHU7eEOLDz4xaFtG1ggSANb+G+y8kqwrbU/HQ4=;
	b=LUD8Z+1k7ZeNiqPDMHn4IojsWmqcE7x/6vV8YTN65aJQIaQ+nFRZdN9xIzmIgs9fc8
	SZgfu9ZftFoBNNmdzuaRSjMj/H6vUcsz2v8OUxOnYqRMgFjjYH+YOqztrqxMKP8RdYCf
	H996eBfE4kkUv8IgOS0wdJ3rGPOUQ+ik1Sbd4sCPVBgYWaIiViwRlV6PDrj/UQli/rI5
	W3i7Wpygd58EjOHoWONeRFwahyO2QHs25Y/S3msj9i2ip1vRxGuxa5iPFHVB/uGCPkFN
	CL/1zFa2C8YfjoQTUCddcm+WyG30WEGexkhUug/ufeOyaVMTaM27tpMgVZPiaaRbsddc
	cIBA==
X-Received: by 10.14.210.8 with SMTP id t8mr4787200eeo.39.1377786709875;
	Thu, 29 Aug 2013 07:31:49 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a43sm46585007eep.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 07:31:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 16:32:30 +0200
Message-Id: <1377786750-20058-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] qcanobserver: Move to nonworking
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
X-List-Received-Date: Thu, 29 Aug 2013 14:31:51 -0000

* depends on qwt-5 APIs, I've tried to update it to support qwt-6 which
  is used in meta-oe, but it looks more complicated then what I've
  expected, my WIP patch is here:
  http://git.openembedded.org/meta-openembedded-contrib/log/?h=jansa/qcanobserver
  if you want to finish it and move qcanobserver back to recipes-qt
* qwt-5 was removed more then 1 year ago:
  commit 5ad3d0d042dcd3f3bf54d44144b731cd0607b2e3
  Author: Eric BENARD <eric@eukrea.com>
  Date:   Thu Apr 12 15:09:48 2012 +0000

    qwt: add 6.0.1 version

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../qcanobserver/qcanobserver-socketcan_svn.bb     | 30 -------
 .../0001-WIP-try-to-upgrade-to-qwt-6-API.patch     | 98 ----------------------
 ...erinterface.cpp-add-sys-socket.h-as-inclu.patch | 41 ---------
 ...erinterface-include-unistd.h-for-read-wri.patch | 39 ---------
 .../qcanobserver/qcanobserver/candemo.xml          | 40 ---------
 .../recipes-qt/qcanobserver/qcanobserver_svn.bb    | 42 ----------
 6 files changed, 290 deletions(-)
 delete mode 100644 meta-oe/recipes-qt/qcanobserver/qcanobserver-socketcan_svn.bb
 delete mode 100644 meta-oe/recipes-qt/qcanobserver/qcanobserver/0001-WIP-try-to-upgrade-to-qwt-6-API.patch
 delete mode 100644 meta-oe/recipes-qt/qcanobserver/qcanobserver/0001-messagebufferinterface.cpp-add-sys-socket.h-as-inclu.patch
 delete mode 100644 meta-oe/recipes-qt/qcanobserver/qcanobserver/0003-messagebufferinterface-include-unistd.h-for-read-wri.patch
 delete mode 100755 meta-oe/recipes-qt/qcanobserver/qcanobserver/candemo.xml
 delete mode 100644 meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb

diff --git a/meta-oe/recipes-qt/qcanobserver/qcanobserver-socketcan_svn.bb b/meta-oe/recipes-qt/qcanobserver/qcanobserver-socketcan_svn.bb
deleted file mode 100644
index 09ba57a..0000000
--- a/meta-oe/recipes-qt/qcanobserver/qcanobserver-socketcan_svn.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "The Linux CAN Sniffer - SocketCAN driver"
-
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://../../../modeltest/LICENSE.GPL;md5=34337af480a8c452bfafe22a78fa20cb"
-
-inherit qt4x11
-
-DEPENDS += "qwt libsocketcan"
-
-PV = "0.5+svnr${SRCPV}"
-SRCREV = "48"
-SRC_URI = "svn://svn.code.sf.net/p/qcanobserver;module=code;protocol=https"
-
-S = "${WORKDIR}/code/DeviceLib/linux/SocketCAN"
-
-CXXFLAGS += " -DPF_CAN=29  -DAF_CAN=PF_CAN"
-
-do_configure_prepend() {
-    sed -i s:/usr/include/qwt5/:${STAGING_INCDIR}:g *.pro
-}
-
-do_install() {
-    install -d ${D}${datadir}/qcanobserver/lib
-
-    install -m 0755 ${S}/lib* ${D}${datadir}/qcanobserver/lib/
-}
-
-FILES_${PN} += "${datadir}/qcanobserver/lib"
-FILES_${PN}-dbg += "${datadir}/qcanobserver/lib/.debug"
-
diff --git a/meta-oe/recipes-qt/qcanobserver/qcanobserver/0001-WIP-try-to-upgrade-to-qwt-6-API.patch b/meta-oe/recipes-qt/qcanobserver/qcanobserver/0001-WIP-try-to-upgrade-to-qwt-6-API.patch
deleted file mode 100644
index 9d25a78..0000000
--- a/meta-oe/recipes-qt/qcanobserver/qcanobserver/0001-WIP-try-to-upgrade-to-qwt-6-API.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From fbfd3db23b2707e5d423e3271fef2a5a8f8719ab Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Thu, 29 Aug 2013 16:27:22 +0200
-Subject: [PATCH] WIP: try to upgrade to qwt-6 API
-
-* biggest remaining issue is qcancostumplotcurve.cpp
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- graphicwindow.cpp     | 4 ++--
- graphicwindow.h       | 7 +++----
- qcancostumplotcurve.h | 2 --
- 3 files changed, 5 insertions(+), 8 deletions(-)
-
-diff --git a/graphicwindow.cpp b/graphicwindow.cpp
-index f1690c6..0af3f12 100644
---- a/graphicwindow.cpp
-+++ b/graphicwindow.cpp
-@@ -123,7 +123,7 @@ void GraphicWindow::MainTimerSlot()
-        {
-            if(Curves.at(i)->x.count())
-            {
--                Curves.at(i)->PlotCurve->setRawData((double*)&Curves.at(i)->x.first(),(double*)&Curves.at(i)->y.first(), Curves.at(i)->x.size());
-+                Curves.at(i)->PlotCurve->setRawSamples((double*)&Curves.at(i)->x.first(),(double*)&Curves.at(i)->y.first(), Curves.at(i)->x.size());
-                 Curves.at(i)->PlotCurve->attach(Plot);
- 
-            }
-@@ -140,7 +140,7 @@ void GraphicWindow::ClearAll()
-        {
-            if(Curves.at(i)->x.count())
-            {
--                Curves.at(i)->PlotCurve->setRawData((double*)&Curves.at(i)->x.first(),(double*)&Curves.at(i)->y.first(), 0);
-+                Curves.at(i)->PlotCurve->setRawSamples((double*)&Curves.at(i)->x.first(),(double*)&Curves.at(i)->y.first(), 0);
-                 Curves.at(i)->y.clear();
-                 Curves.at(i)->x.clear();
-            }
-diff --git a/graphicwindow.h b/graphicwindow.h
-index ea93db6..cf173bb 100644
---- a/graphicwindow.h
-+++ b/graphicwindow.h
-@@ -41,6 +41,7 @@
- #include <qwt_plot_magnifier.h>
- #include <QLinkedList>
- #include "configdialog.h"
-+#include <qwt_compat.h>
- 
- using namespace std;
- 
-@@ -59,7 +60,6 @@ public:
-         this->insertLegend(legend, QwtPlot::BottomLegend);
-         ActCanvas = canvas();
-         CanvasZoomer = new QwtPlotZoomer( QwtPlot::xBottom, QwtPlot::yLeft,  ActCanvas);
--        CanvasZoomer->setSelectionFlags( QwtPicker::DragSelection );
-         CanvasZoomer->setTrackerMode(QwtPicker::AlwaysOn);
-         CanvasZoomer->setMousePattern(QwtEventPattern::MouseSelect2,
-         Qt::NoButton, Qt::ControlModifier);
-@@ -92,7 +92,6 @@ public:
- 
-         delete CanvasZoomer;
-         CanvasZoomer = new QwtPlotZoomer( QwtPlot::xBottom, QwtPlot::yLeft,  ActCanvas);
--        CanvasZoomer->setSelectionFlags( QwtPicker::DragSelection );
-         CanvasZoomer->setTrackerMode(QwtPicker::AlwaysOn);
-     }
-         else
-@@ -132,8 +131,8 @@ class ItemCurveInfo
-     QCANCostumPlotCurve *PlotCurve;
- 
-     CANSignal *pSignal;
--    QwtArray<double> x;
--    QwtArray<double> y;
-+    QVector<double> x;
-+    QVector<double> y;
- };
- 
- namespace Ui {
-diff --git a/qcancostumplotcurve.h b/qcancostumplotcurve.h
-index a0dc16d..f9f5ad0 100644
---- a/qcancostumplotcurve.h
-+++ b/qcancostumplotcurve.h
-@@ -156,7 +156,6 @@ public:
-     };
- 
-     PrivateData():
--            curveType(Yfx),
-             style(QwtPlotCurve::Lines),
-             reference(0.0),
-             attributes(0),
-@@ -173,7 +172,6 @@ public:
-         delete curveFitter;
-     }
- 
--    QwtPlotCurve::CurveType curveType;
-     QwtPlotCurve::CurveStyle style;
-     double reference;
- 
--- 
-1.8.3.2
-
diff --git a/meta-oe/recipes-qt/qcanobserver/qcanobserver/0001-messagebufferinterface.cpp-add-sys-socket.h-as-inclu.patch b/meta-oe/recipes-qt/qcanobserver/qcanobserver/0001-messagebufferinterface.cpp-add-sys-socket.h-as-inclu.patch
deleted file mode 100644
index 1b3da3b..0000000
--- a/meta-oe/recipes-qt/qcanobserver/qcanobserver/0001-messagebufferinterface.cpp-add-sys-socket.h-as-inclu.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From ebb464e3dfa2d59d65c3aa8ee652cb7607481f61 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Thu, 10 Nov 2011 19:38:27 +0100
-Subject: [PATCH] messagebufferinterface.cpp: move sys/socket.h include
-
-This prevents the following error during cross-compiling:
-
-| In file included from messagebufferinterface.cpp:30:
-| /OE/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/linux/can.h:81: error: 'sa_family_t' does not name a type
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- messagebufferinterface.cpp |    7 ++++---
- 1 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/messagebufferinterface.cpp b/messagebufferinterface.cpp
-index 116564c..3e9a535 100644
---- a/messagebufferinterface.cpp
-+++ b/messagebufferinterface.cpp
-@@ -25,14 +25,15 @@
- #include <sys/time.h>
- #include <QFile>
- 
-+#include <sys/types.h>
-+#include <sys/socket.h>
-+#include <sys/stat.h>
-+
- //#include <linux/can.h>
- //#include <linux/can/raw.h>
- #include <syscall.h>
- 
- #include "configdialog.h"
--#include <sys/types.h>
--#include <sys/socket.h>
--#include <sys/stat.h>
- #include <linux/can.h>
- #include <linux/can/raw.h>
- 
--- 
-1.7.2.5
-
diff --git a/meta-oe/recipes-qt/qcanobserver/qcanobserver/0003-messagebufferinterface-include-unistd.h-for-read-wri.patch b/meta-oe/recipes-qt/qcanobserver/qcanobserver/0003-messagebufferinterface-include-unistd.h-for-read-wri.patch
deleted file mode 100644
index d111957..0000000
--- a/meta-oe/recipes-qt/qcanobserver/qcanobserver/0003-messagebufferinterface-include-unistd.h-for-read-wri.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 3d2d2f586c7a1498ab6a4376b128eaa86a9904b0 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Thu, 29 Aug 2013 12:29:32 +0200
-Subject: [PATCH] include unistd.h for read, write, close, usleep
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- messagebufferinterface.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/messagebufferinterface.cpp b/messagebufferinterface.cpp
-index 116564c..93f3ce7 100644
---- a/messagebufferinterface.cpp
-+++ b/messagebufferinterface.cpp
-@@ -18,6 +18,7 @@
- #include "messagebufferinterface.h"
- #include "errordialog.h"
- #include <stdio.h>
-+#include <unistd.h>
- #include <fcntl.h>
- 
- #include <string.h>
-diff --git a/graphicwindow.cpp b/graphicwindow.cpp
-index 7db6069..f1690c6 100644
---- a/graphicwindow.cpp
-+++ b/graphicwindow.cpp
-@@ -21,6 +21,7 @@
- #include "extrect.h"
- #include <stdio.h>
- #include <fcntl.h>
-+#include <unistd.h>
- #include<sys/types.h>
- #include<sys/stat.h>
- #include <string.h>
--- 
-1.8.3.2
-
diff --git a/meta-oe/recipes-qt/qcanobserver/qcanobserver/candemo.xml b/meta-oe/recipes-qt/qcanobserver/qcanobserver/candemo.xml
deleted file mode 100755
index 304713f..0000000
--- a/meta-oe/recipes-qt/qcanobserver/qcanobserver/candemo.xml
+++ /dev/null
@@ -1,40 +0,0 @@
-<?xml version="1.0" encoding="ISO-8859-1"?>
-
-<Database Name="EW-demo">
-    <ID Id="180">
-	<Item0>
-	    <interpret Multiplier="0.010986328125" Name="MotorPos" Offset="-180" Datamask="00120000">
-	    </interpret>
-	</Item0>
-	</ID>
-	    <ID Id="280">
-	<Item0>
-	    <interpret Multiplier="1.0" Name="Fanstatus" Offset="0" Datamask="10000000">
-	    </interpret>
-	</Item0>
-	</ID>
-	    <ID Id="380">
-	<Item0>
-	    <interpret Multiplier="0.00390625" Name="temp1" Offset="0" Datamask="00120000">
-	    </interpret>
-	</Item0>
-	</ID>
-	    <ID Id="480">
-	<Item0>
-	    <interpret Multiplier="1.0" Name="fanstatus" Offset="0" Datamask="10000000">
-	    </interpret>
-	</Item0>
-	</ID>
-	<ID Id="580">
-	<Item0>
-	    <interpret Multiplier="1.0" Name="lampstatus" Offset="0" Datamask="10000000">
-	    </interpret>
-	</Item0>
-	</ID>
-	<ID Id="680">
-	<Item0>
-	<interpret Multiplier="0.00390625" Name="Lightsensor" Offset="0" Datamask="00120000">
-	</interpret>
-	</Item0>
-	</ID>
-</Database>
diff --git a/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb b/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb
deleted file mode 100644
index d2ca941..0000000
--- a/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-DESCRIPTION = "The Linux CAN Sniffer"
-
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://modeltest/LICENSE.GPL;md5=34337af480a8c452bfafe22a78fa20cb"
-
-inherit qt4x11
-
-DEPENDS += "qwt"
-
-PV = "0.5+svnr${SRCPV}"
-SRCREV = "50"
-SRC_URI = "svn://svn.code.sf.net/p/qcanobserver;module=code;protocol=https \
-           file://0001-messagebufferinterface.cpp-add-sys-socket.h-as-inclu.patch \
-	   file://0001-WIP-try-to-upgrade-to-qwt-6-API.patch \
-           file://0003-messagebufferinterface-include-unistd.h-for-read-wri.patch \
-           file://candemo.xml"
-
-S = "${WORKDIR}/code/"
-
-CXXFLAGS += " -DPF_CAN=29  -DAF_CAN=PF_CAN"
-
-do_configure_prepend() {
-    sed -i -e s:/usr/include/qwt5/:${STAGING_INCDIR}:g -e 's:-L/usr/lib/:-L${STAGING_DIR_TARGET}/lib -ldl:g' *.pro
-}
-
-do_configure_append() {
-    sed -i -e s:-L/usr/lib::g Makefile
-}
-
-do_install() {
-    install -d ${D}${datadir}/qcanobserver
-    install -d ${D}${datadir}/qcanobserver/cfg
-    install -d ${D}${datadir}/qcanobserver/lib
-    install -d ${D}${datadir}/qcanobserver/db
-
-    install -m 0755 ${S}/QCanObserver ${D}${datadir}/qcanobserver
-
-    install -m 0644 ${WORKDIR}/candemo.xml ${D}${datadir}/qcanobserver/db
-    install -m 0644 ${S}/db/*.xml ${D}${datadir}/qcanobserver/db
-}
-
-FILES_${PN}-dbg += "${datadir}/qcanobserver/.debug"
-- 
1.8.3.2


