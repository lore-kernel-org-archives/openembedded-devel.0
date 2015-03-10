Return-Path: <mario.goulart@gmail.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5E2A873A52
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 21:11:44 +0000 (UTC)
Received: by qcxr5 with SMTP id r5so5455772qcx.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 14:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=WCchHSKq037nDzvEmvlSKcDDUn9YImRGy7NmmXSK9kM=;
	b=o/dQN3uU3EzcRmeSCjKMWZgNhiQU5m1+Q37fp+0nCCq/avECfe5wm4MqPpXZHNLVIW
	A/V9o/AY0oJSWyeKckEXSt6W0dDPNUrKRfMGpRutkHVzeCZZk+FHZdM3k7AoxyIKLdTb
	fyr9vKZVSGk9QbT5qK1mAsEOvsbZOeZoDG/yy4EdffhEHkpsLHes8Hii236olDMlGqn0
	ZH3sCh020twtbv/B4mLhu5XUHUiwuT1PVkiGZWqkpKvVCYsvlOqQzWLWL2mb0KMdRfZC
	RLiSAabwpCFLGLpV2W433JQfOVYIOcWbNPn0oI3FoWbSmuty7T2fMpYc/ZOQ4qefvuJO
	6eJg==
X-Received: by 10.140.108.116 with SMTP id i107mr42207976qgf.73.1426021905813; 
	Tue, 10 Mar 2015 14:11:45 -0700 (PDT)
Received: from centrium.lab.ossystems.com.br ([177.100.224.72])
	by mx.google.com with ESMTPSA id
	c199sm1179624qka.21.2015.03.10.14.11.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Mar 2015 14:11:45 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Mar 2015 18:10:21 -0300
Message-Id: <1426021821-26379-2-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1426021821-26379-1-git-send-email-mario@ossystems.com.br>
References: <1426021821-26379-1-git-send-email-mario@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-java][PATCH 2/2] rxtx: add patch to support i.MX serial ports
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
X-List-Received-Date: Tue, 10 Mar 2015 21:11:45 -0000

Support for /dev/ttymxc* devices.

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 .../0001-Support-Freescale-i.MX-serial-ports.patch | 27 ++++++++++++++++++++++
 recipes-extended/rxtx/rxtx_2.2.0.bb                |  3 ++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 recipes-extended/rxtx/files/0001-Support-Freescale-i.MX-serial-ports.patch

diff --git a/recipes-extended/rxtx/files/0001-Support-Freescale-i.MX-serial-ports.patch b/recipes-extended/rxtx/files/0001-Support-Freescale-i.MX-serial-ports.patch
new file mode 100644
index 0000000..91b1207
--- /dev/null
+++ b/recipes-extended/rxtx/files/0001-Support-Freescale-i.MX-serial-ports.patch
@@ -0,0 +1,27 @@
+From 9295c8c954c28f30d90f7521048be17790ddb878 Mon Sep 17 00:00:00 2001
+From: Mario Domenech Goulart <mario@ossystems.com.br>
+Date: Mon, 9 Mar 2015 16:18:12 -0300
+Subject: [PATCH] Support Freescale i.MX serial ports
+Organization: O.S. Systems Software LTDA.
+
+Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
+Upstream-Status: Pending
+---
+ src/gnu/io/RXTXCommDriver.java | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/gnu/io/RXTXCommDriver.java b/src/gnu/io/RXTXCommDriver.java
+index 16225dc..4cadd03 100644
+--- a/src/gnu/io/RXTXCommDriver.java
++++ b/src/gnu/io/RXTXCommDriver.java
+@@ -612,6 +612,7 @@ public class RXTXCommDriver implements CommDriver
+ 						"ttyH", // linux Chase serial card
+ 						"ttyI", // linux virtual modems
+ 						"ttyL", // linux SDL RISCom serial card
++						"ttymxc", // linux Freescale i.MX serial card
+ 						"ttyM", // linux PAM Software's multimodem boards
+ 							// linux ISI serial card
+ 						"ttyMX",// linux Moxa Smart IO cards
+-- 
+2.1.4
+
diff --git a/recipes-extended/rxtx/rxtx_2.2.0.bb b/recipes-extended/rxtx/rxtx_2.2.0.bb
index ff17e9c..56c939f 100644
--- a/recipes-extended/rxtx/rxtx_2.2.0.bb
+++ b/recipes-extended/rxtx/rxtx_2.2.0.bb
@@ -18,7 +18,8 @@ SRC_URI = "http://rxtx.qbang.org/pub/rxtx/rxtx-2.2pre2.zip \
            file://MonitorThread-daemon.patch \
            file://usb_38400.patch \
            file://fix_snprintf.patch \
-           file://format_security.patch"
+           file://format_security.patch \
+           file://0001-Support-Freescale-i.MX-serial-ports.patch"
 
 SRC_URI[md5sum] = "7eedb18e3f33a427e2b0e9be8ce3f94c"
 SRC_URI[sha256sum] = "3c30373e760f444def3650c76c5a00ae12fb1d860ec008750d084f4880495b03"
-- 
2.1.4


