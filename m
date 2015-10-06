Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id F13EA600B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Oct 2015 22:30:39 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so3240255wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Oct 2015 15:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S5ItgkC/7EOMdK0BMzwppxVASsX2O5GD/J3x8wrI3mc=;
	b=gTX/nis+z8/K5IRgDrWS965Gvx4zRkd2RmGFX01bZAa04sALypQ7PBVKyF+NjzBGvC
	30B8wNjxS2jbxOpv7bJ96UeCuF/TlW57jcwoB0O2eNU8uOpDjL2v3Te9aCUJ+AY1DhCA
	kjfa0Dm2zpPQSXFIaBzLqKRaBR3Dfw+B+CUMt0QB865yi2x/YKc/DYCXA80crgOCzMBi
	pKtfLPsr3it8dHHqttI0yCKnoatPkBsLGYpRgVWLhrqk8gYsbhmDZyxGpSNJ++SW6aaR
	EAwt3IIUy0pGhcSr1K3EoHJdihdv5HPP+5ovNCfbrTKSzAWa/VrDehRq/9U+Q/M/wGMx
	dNzQ==
X-Received: by 10.194.121.1 with SMTP id lg1mr11260179wjb.111.1444170639529;
	Tue, 06 Oct 2015 15:30:39 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	f17sm35096271wjn.38.2015.10.06.15.30.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Oct 2015 15:30:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Oct 2015 00:30:36 +0200
Message-Id: <1444170642-23088-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444170642-23088-1-git-send-email-Martin.Jansa@gmail.com>
References: <1444170642-23088-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 2/8] Revert "qcanobserver: Move to nonworking"
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
X-List-Received-Date: Tue, 06 Oct 2015 22:30:40 -0000

* Use PNBLACKLIST instead

This reverts commit 8040a4c38bd00e45d50b539affde03deddecd38c.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../qcanobserver/qcanobserver-socketcan_svn.bb     | 30 ---------------
 ...erinterface.cpp-add-sys-socket.h-as-inclu.patch | 41 ---------------------
 .../0002-qconsole-writethread-gcc-4.5-fixes.patch  | 40 --------------------
 .../qcanobserver/qcanobserver/candemo.xml          | 40 --------------------
 .../nonworking/qcanobserver/qcanobserver_svn.bb    | 41 ---------------------
 .../qcanobserver/qcanobserver-socketcan_svn.bb     | 31 ++++++++++++++++
 ...erinterface.cpp-add-sys-socket.h-as-inclu.patch | 41 +++++++++++++++++++++
 .../0002-qconsole-writethread-gcc-4.5-fixes.patch  | 40 ++++++++++++++++++++
 .../qcanobserver/qcanobserver/candemo.xml          | 40 ++++++++++++++++++++
 .../recipes-qt/qcanobserver/qcanobserver_svn.bb    | 43 ++++++++++++++++++++++
 10 files changed, 195 insertions(+), 192 deletions(-)
 delete mode 100644 meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver-socketcan_svn.bb
 delete mode 100644 meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver/0001-messagebufferinterface.cpp-add-sys-socket.h-as-inclu.patch
 delete mode 100644 meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver/0002-qconsole-writethread-gcc-4.5-fixes.patch
 delete mode 100755 meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver/candemo.xml
 delete mode 100644 meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver_svn.bb
 create mode 100644 meta-oe/recipes-qt/qcanobserver/qcanobserver-socketcan_svn.bb
 create mode 100644 meta-oe/recipes-qt/qcanobserver/qcanobserver/0001-messagebufferinterface.cpp-add-sys-socket.h-as-inclu.patch
 create mode 100644 meta-oe/recipes-qt/qcanobserver/qcanobserver/0002-qconsole-writethread-gcc-4.5-fixes.patch
 create mode 100755 meta-oe/recipes-qt/qcanobserver/qcanobserver/candemo.xml
 create mode 100644 meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb

diff --git a/meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver-socketcan_svn.bb b/meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver-socketcan_svn.bb
deleted file mode 100644
index 9852b0c..0000000
--- a/meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver-socketcan_svn.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY = "The Linux CAN Sniffer - SocketCAN driver"
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
-SRC_URI = "svn://qcanobserver.svn.sourceforge.net/svnroot;module=qcanobserver;protocol=https"
-
-S = "${WORKDIR}/qcanobserver/DeviceLib/linux/SocketCAN"
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
diff --git a/meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver/0001-messagebufferinterface.cpp-add-sys-socket.h-as-inclu.patch b/meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver/0001-messagebufferinterface.cpp-add-sys-socket.h-as-inclu.patch
deleted file mode 100644
index 1b3da3b..0000000
--- a/meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver/0001-messagebufferinterface.cpp-add-sys-socket.h-as-inclu.patch
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
diff --git a/meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver/0002-qconsole-writethread-gcc-4.5-fixes.patch b/meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver/0002-qconsole-writethread-gcc-4.5-fixes.patch
deleted file mode 100644
index 4561923..0000000
--- a/meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver/0002-qconsole-writethread-gcc-4.5-fixes.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 3b3cb5212b5dbf182beed171045e5d179b2e9000 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Fri, 11 Nov 2011 09:32:14 +0100
-Subject: [PATCH 2/2] qconsole, writethread: gcc 4.5 fixes
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- qconsole.cpp    |    2 +-
- writethread.cpp |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/qconsole.cpp b/qconsole.cpp
-index ea86957..b5a4687 100644
---- a/qconsole.cpp
-+++ b/qconsole.cpp
-@@ -22,7 +22,7 @@ QConsole::QConsole()
- 
- {
-     this->setReadOnly(true);
--    QTextEdit::QTextEdit(NULL);
-+    QTextEdit(NULL);
- }
- 
- 
-diff --git a/writethread.cpp b/writethread.cpp
-index ef7bc13..ff19560 100755
---- a/writethread.cpp
-+++ b/writethread.cpp
-@@ -69,7 +69,7 @@ void WriteThread::setDev(void *ConfData, QString InterfaceLib, bool shareDevLib)
-     if(!handle)
-     {
-         QString *ErrStr = new QString(" ");
--        ErrStr->sprintf("%s %s","Could not load Device Mapper: ", InterfaceLib);
-+        ErrStr->sprintf("%s %s","Could not load Device Mapper: ", (char*)InterfaceLib.constData());
-         ErrorDialog *ed = new ErrorDialog;
-         ed->SetErrorMessage(*ErrStr);
-         delete ErrStr;
--- 
-1.7.2.5
-
diff --git a/meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver/candemo.xml b/meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver/candemo.xml
deleted file mode 100755
index 304713f..0000000
--- a/meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver/candemo.xml
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
diff --git a/meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver_svn.bb b/meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver_svn.bb
deleted file mode 100644
index 4b566f7..0000000
--- a/meta-oe/recipes-qt/nonworking/qcanobserver/qcanobserver_svn.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY = "The Linux CAN Sniffer"
-
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://modeltest/LICENSE.GPL;md5=34337af480a8c452bfafe22a78fa20cb"
-
-inherit qt4x11
-
-DEPENDS += "qwt"
-
-PV = "0.5+svnr${SRCPV}"
-SRCREV = "48"
-SRC_URI = "svn://qcanobserver.svn.sourceforge.net/svnroot;module=qcanobserver;protocol=https \
-           file://0001-messagebufferinterface.cpp-add-sys-socket.h-as-inclu.patch \
-           file://0002-qconsole-writethread-gcc-4.5-fixes.patch  \
-           file://candemo.xml"
-
-S = "${WORKDIR}/qcanobserver/"
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
diff --git a/meta-oe/recipes-qt/qcanobserver/qcanobserver-socketcan_svn.bb b/meta-oe/recipes-qt/qcanobserver/qcanobserver-socketcan_svn.bb
new file mode 100644
index 0000000..19ea1ea
--- /dev/null
+++ b/meta-oe/recipes-qt/qcanobserver/qcanobserver-socketcan_svn.bb
@@ -0,0 +1,31 @@
+SUMMARY = "The Linux CAN Sniffer - SocketCAN driver"
+
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://../../../modeltest/LICENSE.GPL;md5=34337af480a8c452bfafe22a78fa20cb"
+
+inherit qt4x11
+
+DEPENDS += "qwt libsocketcan"
+
+PV = "0.5+svnr${SRCPV}"
+SRCREV = "48"
+SRC_URI = "svn://qcanobserver.svn.sourceforge.net/svnroot;module=qcanobserver;protocol=https"
+
+S = "${WORKDIR}/qcanobserver/DeviceLib/linux/SocketCAN"
+
+CXXFLAGS += " -DPF_CAN=29  -DAF_CAN=PF_CAN"
+
+do_configure_prepend() {
+    sed -i s:/usr/include/qwt5/:${STAGING_INCDIR}:g *.pro
+}
+
+do_install() {
+    install -d ${D}${datadir}/qcanobserver/lib
+
+    install -m 0755 ${S}/lib* ${D}${datadir}/qcanobserver/lib/
+}
+
+FILES_${PN} += "${datadir}/qcanobserver/lib"
+FILES_${PN}-dbg += "${datadir}/qcanobserver/lib/.debug"
+
+PNBLACKLIST[qcanobserver-socketcan] ?= "depends on qwt-5 APIs"
diff --git a/meta-oe/recipes-qt/qcanobserver/qcanobserver/0001-messagebufferinterface.cpp-add-sys-socket.h-as-inclu.patch b/meta-oe/recipes-qt/qcanobserver/qcanobserver/0001-messagebufferinterface.cpp-add-sys-socket.h-as-inclu.patch
new file mode 100644
index 0000000..1b3da3b
--- /dev/null
+++ b/meta-oe/recipes-qt/qcanobserver/qcanobserver/0001-messagebufferinterface.cpp-add-sys-socket.h-as-inclu.patch
@@ -0,0 +1,41 @@
+From ebb464e3dfa2d59d65c3aa8ee652cb7607481f61 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Thu, 10 Nov 2011 19:38:27 +0100
+Subject: [PATCH] messagebufferinterface.cpp: move sys/socket.h include
+
+This prevents the following error during cross-compiling:
+
+| In file included from messagebufferinterface.cpp:30:
+| /OE/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/linux/can.h:81: error: 'sa_family_t' does not name a type
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ messagebufferinterface.cpp |    7 ++++---
+ 1 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/messagebufferinterface.cpp b/messagebufferinterface.cpp
+index 116564c..3e9a535 100644
+--- a/messagebufferinterface.cpp
++++ b/messagebufferinterface.cpp
+@@ -25,14 +25,15 @@
+ #include <sys/time.h>
+ #include <QFile>
+ 
++#include <sys/types.h>
++#include <sys/socket.h>
++#include <sys/stat.h>
++
+ //#include <linux/can.h>
+ //#include <linux/can/raw.h>
+ #include <syscall.h>
+ 
+ #include "configdialog.h"
+-#include <sys/types.h>
+-#include <sys/socket.h>
+-#include <sys/stat.h>
+ #include <linux/can.h>
+ #include <linux/can/raw.h>
+ 
+-- 
+1.7.2.5
+
diff --git a/meta-oe/recipes-qt/qcanobserver/qcanobserver/0002-qconsole-writethread-gcc-4.5-fixes.patch b/meta-oe/recipes-qt/qcanobserver/qcanobserver/0002-qconsole-writethread-gcc-4.5-fixes.patch
new file mode 100644
index 0000000..4561923
--- /dev/null
+++ b/meta-oe/recipes-qt/qcanobserver/qcanobserver/0002-qconsole-writethread-gcc-4.5-fixes.patch
@@ -0,0 +1,40 @@
+From 3b3cb5212b5dbf182beed171045e5d179b2e9000 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Fri, 11 Nov 2011 09:32:14 +0100
+Subject: [PATCH 2/2] qconsole, writethread: gcc 4.5 fixes
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ qconsole.cpp    |    2 +-
+ writethread.cpp |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/qconsole.cpp b/qconsole.cpp
+index ea86957..b5a4687 100644
+--- a/qconsole.cpp
++++ b/qconsole.cpp
+@@ -22,7 +22,7 @@ QConsole::QConsole()
+ 
+ {
+     this->setReadOnly(true);
+-    QTextEdit::QTextEdit(NULL);
++    QTextEdit(NULL);
+ }
+ 
+ 
+diff --git a/writethread.cpp b/writethread.cpp
+index ef7bc13..ff19560 100755
+--- a/writethread.cpp
++++ b/writethread.cpp
+@@ -69,7 +69,7 @@ void WriteThread::setDev(void *ConfData, QString InterfaceLib, bool shareDevLib)
+     if(!handle)
+     {
+         QString *ErrStr = new QString(" ");
+-        ErrStr->sprintf("%s %s","Could not load Device Mapper: ", InterfaceLib);
++        ErrStr->sprintf("%s %s","Could not load Device Mapper: ", (char*)InterfaceLib.constData());
+         ErrorDialog *ed = new ErrorDialog;
+         ed->SetErrorMessage(*ErrStr);
+         delete ErrStr;
+-- 
+1.7.2.5
+
diff --git a/meta-oe/recipes-qt/qcanobserver/qcanobserver/candemo.xml b/meta-oe/recipes-qt/qcanobserver/qcanobserver/candemo.xml
new file mode 100755
index 0000000..304713f
--- /dev/null
+++ b/meta-oe/recipes-qt/qcanobserver/qcanobserver/candemo.xml
@@ -0,0 +1,40 @@
+<?xml version="1.0" encoding="ISO-8859-1"?>
+
+<Database Name="EW-demo">
+    <ID Id="180">
+	<Item0>
+	    <interpret Multiplier="0.010986328125" Name="MotorPos" Offset="-180" Datamask="00120000">
+	    </interpret>
+	</Item0>
+	</ID>
+	    <ID Id="280">
+	<Item0>
+	    <interpret Multiplier="1.0" Name="Fanstatus" Offset="0" Datamask="10000000">
+	    </interpret>
+	</Item0>
+	</ID>
+	    <ID Id="380">
+	<Item0>
+	    <interpret Multiplier="0.00390625" Name="temp1" Offset="0" Datamask="00120000">
+	    </interpret>
+	</Item0>
+	</ID>
+	    <ID Id="480">
+	<Item0>
+	    <interpret Multiplier="1.0" Name="fanstatus" Offset="0" Datamask="10000000">
+	    </interpret>
+	</Item0>
+	</ID>
+	<ID Id="580">
+	<Item0>
+	    <interpret Multiplier="1.0" Name="lampstatus" Offset="0" Datamask="10000000">
+	    </interpret>
+	</Item0>
+	</ID>
+	<ID Id="680">
+	<Item0>
+	<interpret Multiplier="0.00390625" Name="Lightsensor" Offset="0" Datamask="00120000">
+	</interpret>
+	</Item0>
+	</ID>
+</Database>
diff --git a/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb b/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb
new file mode 100644
index 0000000..54e7fc1
--- /dev/null
+++ b/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb
@@ -0,0 +1,43 @@
+SUMMARY = "The Linux CAN Sniffer"
+
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://modeltest/LICENSE.GPL;md5=34337af480a8c452bfafe22a78fa20cb"
+
+inherit qt4x11
+
+DEPENDS += "qwt"
+
+PV = "0.5+svnr${SRCPV}"
+SRCREV = "48"
+SRC_URI = "svn://qcanobserver.svn.sourceforge.net/svnroot;module=qcanobserver;protocol=https \
+           file://0001-messagebufferinterface.cpp-add-sys-socket.h-as-inclu.patch \
+           file://0002-qconsole-writethread-gcc-4.5-fixes.patch  \
+           file://candemo.xml"
+
+S = "${WORKDIR}/qcanobserver/"
+
+CXXFLAGS += " -DPF_CAN=29  -DAF_CAN=PF_CAN"
+
+do_configure_prepend() {
+    sed -i -e s:/usr/include/qwt5/:${STAGING_INCDIR}:g -e 's:-L/usr/lib/:-L${STAGING_DIR_TARGET}/lib -ldl:g' *.pro
+}
+
+do_configure_append() {
+    sed -i -e s:-L/usr/lib::g Makefile
+}
+
+do_install() {
+    install -d ${D}${datadir}/qcanobserver
+    install -d ${D}${datadir}/qcanobserver/cfg
+    install -d ${D}${datadir}/qcanobserver/lib
+    install -d ${D}${datadir}/qcanobserver/db
+
+    install -m 0755 ${S}/QCanObserver ${D}${datadir}/qcanobserver
+
+    install -m 0644 ${WORKDIR}/candemo.xml ${D}${datadir}/qcanobserver/db
+    install -m 0644 ${S}/db/*.xml ${D}${datadir}/qcanobserver/db
+}
+
+FILES_${PN}-dbg += "${datadir}/qcanobserver/.debug"
+
+PNBLACKLIST[qcanobserver] ?= "depends on qwt-5 APIs"
-- 
2.6.0


