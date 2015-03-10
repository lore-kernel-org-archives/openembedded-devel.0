Return-Path: <net147@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5D27B738EC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 06:38:31 +0000 (UTC)
Received: by pabli10 with SMTP id li10so78957452pab.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Mar 2015 23:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=zta/yxf4neWQxtWfVG7VHt3pRDDLEJzTX9ep9HCe9jQ=;
	b=Q90BE9j/AKhSS5kcJTEwbtgsZ0FnYQg3o0qzr1Ur0RiJgcvpVIT1hoM7TBjlM4G4zl
	cK0zsICsshI0sW8tv7G3Vsq5xGnxhKmbTRPpJj2Z7GI+7RLOxZgNLRngtmxYnIpdndh9
	W2yWwEOCktSeD0FCqmn6SpqAiyY/hKEj7SmQn+AhEY6wVWmP8VdqnECwhG88/kNZhwYv
	9XlLMR5lhOgSjDMgLa2dekxIDFMS1KJv1Z4LcnRlvmSKs2QtfjD3v6pEPUH0RZzXHTxy
	N1yiyz5k3r0FpSLXtwZcwvpvDKX6vnic9qidR8EOj72Dswm2HGNAiPujzmA1r10ZPyjB
	h2HA==
X-Received: by 10.66.221.135 with SMTP id qe7mr61208362pac.97.1425969512511;
	Mon, 09 Mar 2015 23:38:32 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	ci17sm22289928pdb.70.2015.03.09.23.38.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Mar 2015 23:38:31 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Mar 2015 17:37:12 +1100
Message-Id: <1425969432-24313-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [meta-qt5][PATCH] qtserialport: backport patch to silence Valgrind warning
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
X-List-Received-Date: Tue, 10 Mar 2015 06:38:33 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../0001-Unix-Clear-serial_struct-instances.patch  | 42 ++++++++++++++++++++++
 recipes-qt/qt5/qtserialport.inc                    |  4 +++
 .../0001-Unix-Clear-serial_struct-instances.patch  | 42 ++++++++++++++++++++++
 3 files changed, 88 insertions(+)
 create mode 100644 recipes-qt/qt5/qtserialport-git/0001-Unix-Clear-serial_struct-instances.patch
 create mode 100644 recipes-qt/qt5/qtserialport/0001-Unix-Clear-serial_struct-instances.patch

diff --git a/recipes-qt/qt5/qtserialport-git/0001-Unix-Clear-serial_struct-instances.patch b/recipes-qt/qt5/qtserialport-git/0001-Unix-Clear-serial_struct-instances.patch
new file mode 100644
index 0000000..b14cf01
--- /dev/null
+++ b/recipes-qt/qt5/qtserialport-git/0001-Unix-Clear-serial_struct-instances.patch
@@ -0,0 +1,42 @@
+From 53afe73154c7c00b54cd280fa3d6c9127a2bc84b Mon Sep 17 00:00:00 2001
+From: Jonathan Liu <net147@gmail.com>
+Date: Mon, 9 Mar 2015 22:35:56 +1100
+Subject: [PATCH] Unix: Clear serial_struct instances
+
+Silences the following Valgrind warning:
+Conditional jump or move depends on uninitialised value(s)
+
+Upstream-Status: Backport from 5.5 branch
+
+Change-Id: I8fd8cfd6aa6f75ed515e6151cfc282faca508bdc
+Reviewed-by: Denis Shienkov <denis.shienkov@gmail.com>
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ src/serialport/qserialport_unix.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/serialport/qserialport_unix.cpp b/src/serialport/qserialport_unix.cpp
+index 34ef41d..7cf356b 100644
+--- a/src/serialport/qserialport_unix.cpp
++++ b/src/serialport/qserialport_unix.cpp
+@@ -439,6 +439,8 @@ QSerialPortPrivate::setStandardBaudRate(qint32 baudRate, QSerialPort::Directions
+ {
+     struct serial_struct currentSerialInfo;
+ 
++    ::memset(&currentSerialInfo, 0, sizeof(currentSerialInfo));
++
+     if ((::ioctl(descriptor, TIOCGSERIAL, &currentSerialInfo) != -1)
+             && (currentSerialInfo.flags & ASYNC_SPD_CUST)) {
+         currentSerialInfo.flags &= ~ASYNC_SPD_CUST;
+@@ -469,6 +471,8 @@ QSerialPortPrivate::setCustomBaudRate(qint32 baudRate, QSerialPort::Directions d
+ 
+     struct serial_struct currentSerialInfo;
+ 
++    ::memset(&currentSerialInfo, 0, sizeof(currentSerialInfo));
++
+     if (::ioctl(descriptor, TIOCGSERIAL, &currentSerialInfo) == -1)
+         return decodeSystemError();
+ 
+-- 
+2.3.2
+
diff --git a/recipes-qt/qt5/qtserialport.inc b/recipes-qt/qt5/qtserialport.inc
index 8bb168e..c9877c6 100644
--- a/recipes-qt/qt5/qtserialport.inc
+++ b/recipes-qt/qt5/qtserialport.inc
@@ -1,5 +1,9 @@
 require qt5.inc
 
+SRC_URI += " \
+    file://0001-Unix-Clear-serial_struct-instances.patch \
+"
+
 DEPENDS += "qtbase"
 
 # text of LGPL_EXCEPTION.txt and LICENSE.FDL is slightly different than what
diff --git a/recipes-qt/qt5/qtserialport/0001-Unix-Clear-serial_struct-instances.patch b/recipes-qt/qt5/qtserialport/0001-Unix-Clear-serial_struct-instances.patch
new file mode 100644
index 0000000..b14cf01
--- /dev/null
+++ b/recipes-qt/qt5/qtserialport/0001-Unix-Clear-serial_struct-instances.patch
@@ -0,0 +1,42 @@
+From 53afe73154c7c00b54cd280fa3d6c9127a2bc84b Mon Sep 17 00:00:00 2001
+From: Jonathan Liu <net147@gmail.com>
+Date: Mon, 9 Mar 2015 22:35:56 +1100
+Subject: [PATCH] Unix: Clear serial_struct instances
+
+Silences the following Valgrind warning:
+Conditional jump or move depends on uninitialised value(s)
+
+Upstream-Status: Backport from 5.5 branch
+
+Change-Id: I8fd8cfd6aa6f75ed515e6151cfc282faca508bdc
+Reviewed-by: Denis Shienkov <denis.shienkov@gmail.com>
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ src/serialport/qserialport_unix.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/serialport/qserialport_unix.cpp b/src/serialport/qserialport_unix.cpp
+index 34ef41d..7cf356b 100644
+--- a/src/serialport/qserialport_unix.cpp
++++ b/src/serialport/qserialport_unix.cpp
+@@ -439,6 +439,8 @@ QSerialPortPrivate::setStandardBaudRate(qint32 baudRate, QSerialPort::Directions
+ {
+     struct serial_struct currentSerialInfo;
+ 
++    ::memset(&currentSerialInfo, 0, sizeof(currentSerialInfo));
++
+     if ((::ioctl(descriptor, TIOCGSERIAL, &currentSerialInfo) != -1)
+             && (currentSerialInfo.flags & ASYNC_SPD_CUST)) {
+         currentSerialInfo.flags &= ~ASYNC_SPD_CUST;
+@@ -469,6 +471,8 @@ QSerialPortPrivate::setCustomBaudRate(qint32 baudRate, QSerialPort::Directions d
+ 
+     struct serial_struct currentSerialInfo;
+ 
++    ::memset(&currentSerialInfo, 0, sizeof(currentSerialInfo));
++
+     if (::ioctl(descriptor, TIOCGSERIAL, &currentSerialInfo) == -1)
+         return decodeSystemError();
+ 
+-- 
+2.3.2
+
-- 
2.3.1


