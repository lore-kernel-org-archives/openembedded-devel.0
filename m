Received: from smtprelay-h21.telenor.se ([195.54.99.196])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1P76jm-0002OY-6I
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 15:23:51 +0200
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-h21.telenor.se (Postfix) with ESMTP id 9B6E5EAEEE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 14:50:22 +0200 (CEST)
X-SENDER-IP: [83.227.56.243]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ajg7AM88uUxT4zjzPGdsb2JhbACHcZlBDAEBAQE1La5bAY49hUkEiko
X-IronPort-AV: E=Sophos;i="4.57,339,1283724000"; d="scan'208";a="140649697"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.56.243])
	by ipb2.telenor.se with ESMTP; 16 Oct 2010 14:50:22 +0200
From: ulf.samuelsson@atmel.com
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Oct 2010 14:50:05 +0200
Message-Id: <1287233406-8778-4-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1287233406-8778-3-git-send-email-ulf.samuelsson@atmel.com>
References: <1287233406-8778-1-git-send-email-ulf.samuelsson@atmel.com>
	<1287233406-8778-2-git-send-email-ulf.samuelsson@atmel.com>
	<1287233406-8778-3-git-send-email-ulf.samuelsson@atmel.com>
X-SA-Exim-Connect-IP: 195.54.99.196
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_SOFTFAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH 4/5] Add X-Windows support for AT91 LCD controller
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Oct 2010 13:23:51 -0000

From: Ulf Samuelsson <ulf.samuelsson@atmel.com>


Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 .../xserver-kdrive-1.4.0.90/at91sam9-kmode.patch   |   18 +++++++++++++++
 .../xserver-kdrive-1.4.0.90/wvga-kmode.patch       |   16 +++++++++++++
 recipes/xorg-xserver/xserver-kdrive_1.4.0.90.bb    |    2 +
 .../xserver-xorg-conf/at91sam9g45ek/xorg.conf      |   23 ++++++++++++++++++++
 4 files changed, 59 insertions(+), 0 deletions(-)
 create mode 100644 recipes/xorg-xserver/xserver-kdrive-1.4.0.90/at91sam9-kmode.patch
 create mode 100644 recipes/xorg-xserver/xserver-kdrive-1.4.0.90/wvga-kmode.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg-conf/at91sam9g45ek/xorg.conf

diff --git a/recipes/xorg-xserver/xserver-kdrive-1.4.0.90/at91sam9-kmode.patch b/recipes/xorg-xserver/xserver-kdrive-1.4.0.90/at91sam9-kmode.patch
new file mode 100644
index 0000000..96d814c
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-kdrive-1.4.0.90/at91sam9-kmode.patch
@@ -0,0 +1,18 @@
+diff -Nru xorg-server-1.4.0.90_orig/hw/kdrive/src/kmode.c xorg-server-1.4.0.90/hw/kdrive/src/kmode.c
+--- xorg-server-1.4.0.90_orig/hw/kdrive/src/kmode.c
++++ xorg-server-1.4.0.90/hw/kdrive/src/kmode.c
+@@ -69,6 +69,12 @@
+                   0,      0,      0,     KdSyncNegative,
+     },
+ 
++    /* at91sam9g45-ekes */
++    {   480,    272,    60,     0,                      /* VESA */
++               0,      0,     0,    KdSyncNegative, /* 31.469 */
++               0,      0,     0,     KdSyncNegative, /* 59.940 */
++    },
++
+     /* Other VESA modes */
+     { 640,    350,    85,     31500,                      /* VESA */
+                   32,     96,     192,    KdSyncPositive, /* 26.413 */
+
+
diff --git a/recipes/xorg-xserver/xserver-kdrive-1.4.0.90/wvga-kmode.patch b/recipes/xorg-xserver/xserver-kdrive-1.4.0.90/wvga-kmode.patch
new file mode 100644
index 0000000..4b6a1fc
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-kdrive-1.4.0.90/wvga-kmode.patch
@@ -0,0 +1,16 @@
+--- xorg-server-1.4.0.90/hw/kdrive/src/kmode.c.orig
++++ xorg-server-1.4.0.90/hw/kdrive/src/kmode.c
+@@ -75,6 +75,13 @@
+                0,      0,     0,     KdSyncNegative, /* 59.940 */
+     },
+ 
++    /* at91sam9m10-ekes */
++    {	800,	480,	60,	0,
++	0,	0,	0,	KdSyncNegative,
++	0,	0,	0,	KdSyncNegative, 
++    },
++
++
+     /* Other VESA modes */
+     {	640,	350,	85,	31500,			    /* VESA */
+ 		    32,	    96,	    192,    KdSyncPositive, /* 26.413 */
diff --git a/recipes/xorg-xserver/xserver-kdrive_1.4.0.90.bb b/recipes/xorg-xserver/xserver-kdrive_1.4.0.90.bb
index 6f329d1..6e2457b 100644
--- a/recipes/xorg-xserver/xserver-kdrive_1.4.0.90.bb
+++ b/recipes/xorg-xserver/xserver-kdrive_1.4.0.90.bb
@@ -28,6 +28,8 @@ SRC_URI = "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.bz2 \
 	file://xorg-1.4-kdrive-rotation.patch \
 	file://split_multiple_AC_SUBST.patch \
 	file://vm86_masks.patch \
+	file://at91sam9-kmode.patch \
+	file://wvga-kmode.patch \
         "
 
 S = "${WORKDIR}/xorg-server-${PV}"
diff --git a/recipes/xorg-xserver/xserver-xorg-conf/at91sam9g45ek/xorg.conf b/recipes/xorg-xserver/xserver-xorg-conf/at91sam9g45ek/xorg.conf
new file mode 100644
index 0000000..0502f87
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-conf/at91sam9g45ek/xorg.conf
@@ -0,0 +1,23 @@
+Section "ServerLayout"
+    Identifier "default"
+    InputDevice "atmel-tsadcc" "CorePointer"
+EndSection
+
+Section "InputDevice"
+    Identifier "atmel-tsadcc"
+    Driver "evdev"
+    Option "Device" "/dev/input/touchscreen0"
+EndSection
+
+Section "InputDevice"
+	Driver		"mouse"
+	Identifier	"Mouse[1]"
+	Option		"Buttons"	"10"
+	Option		"Device"	"/dev/input/mice"
+EndSection
+
+Section	"InputDevice"
+	Driver		"kbd"
+	Identifier	"Keyboard[0]"
+	Option		"Protocol" "Standard"
+EndSection
-- 
1.6.3.3



