Received: from smtprelay-h31.telenor.se ([213.150.131.4])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Pk19N-0001pw-K0
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 22:19:05 +0100
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-h31.telenor.se (Postfix) with ESMTP id 54431C130
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 22:18:12 +0100 (CET)
X-SENDER-IP: [83.227.56.243]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ais3AGG1Rk1T4zjzPGdsb2JhbACIXpwaDAEBAQE1L71thU4EjCE
X-IronPort-AV: E=Sophos;i="4.60,405,1291590000"; d="scan'208";a="170551952"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.56.243])
	by ipb1.telenor.se with ESMTP; 31 Jan 2011 22:18:12 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Jan 2011 22:18:04 +0100
Message-Id: <1296508688-5770-4-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1296508688-5770-3-git-send-email-ulf.samuelsson@atmel.com>
References: <1296508688-5770-1-git-send-email-ulf.samuelsson@atmel.com>
	<1296508688-5770-2-git-send-email-ulf.samuelsson@atmel.com>
	<1296508688-5770-3-git-send-email-ulf.samuelsson@atmel.com>
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH v3 04/08] Add X arguments for AT91 boards
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
X-List-Received-Date: Mon, 31 Jan 2011 21:19:05 -0000

* CAP9
* SAM9RL
* SAM9G10
* SAM9M10
* SAM9G45

Use xinput-calibrator to calibrate touch screen when building xorg

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 .../files/xserver-common-at91sam9.patch            |   18 ++++++++++++++++++
 recipes/xserver-common/xserver-common_1.22.bb      |    4 +++-
 recipes/xserver-common/xserver-common_1.33.bb      |    5 ++++-
 3 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100644 recipes/xserver-common/files/xserver-common-at91sam9.patch

diff --git a/recipes/xserver-common/files/xserver-common-at91sam9.patch b/recipes/xserver-common/files/xserver-common-at91sam9.patch
new file mode 100644
index 0000000..ae8a864
--- /dev/null
+++ b/recipes/xserver-common/files/xserver-common-at91sam9.patch
@@ -0,0 +1,18 @@
+diff -u xserver-common-1.22.old/X11/Xserver xserver-common-1.22/X11/Xserver
+--- xserver-common-1.22.old/X11/Xserver
++++ xserver-common-1.22/X11/Xserver
+@@ -100,8 +100,12 @@
+ 		ARGS="$ARGS -dpi 100 -screen 480x640@270" ;;
+ 	"HTC Tornado")
+ 		ARGS="$ARGS -dpi 100 -hide-cursor" ;;
+-	"Atmel AT91SAM9261-EK" | "Atmel AT91SAM9263-EK")
+-		ARGS="$ARGS -mouse tslib -dpi 100 -rgba bgr -screen 240x320" ;;	
++	"Atmel AT91SAM9261-EK" | "Atmel AT91SAM9263-EK" | "Atmel AT91CAP9A-DK" | "Atmel AT91CAP9-STK")
++		ARGS="$ARGS -mouse tslib -dpi 100 -rgba bgr -screen 240x320" ;;
++	"Atmel AT91SAM9RL-EK" | "Atmel AT91SAM9G10-EK" )
++		ARGS="$ARGS -mouse tslib -dpi 100 -rgba rgb -screen 240x320" ;;
++	"Atmel AT91SAM9M10-EKES" | "Atmel AT91SAM9G45-EKES" | "Atmel AT91SAM9M10G45-EK")
++		ARGS="$ARGS -mouse tslib -rgba rgb -screen 480x272" ;;
+ 	"Generic OMAP1510/1610/1710" | "Nokia N770")
+ 		ARGS="$ARGS -dpi 225 -screen ${SCREEN_SIZE} -mouse tslib" ;;
+ 	"Nokia N800")
diff --git a/recipes/xserver-common/xserver-common_1.22.bb b/recipes/xserver-common/xserver-common_1.22.bb
index 160a3fd..d50614f 100644
--- a/recipes/xserver-common/xserver-common_1.22.bb
+++ b/recipes/xserver-common/xserver-common_1.22.bb
@@ -14,7 +14,9 @@ SRC_URI_append_angstrom = " file://kdrive-1.4-fixes.patch \
                             file://xorg-fixes.patch \
 			    file://gta-xorg-fixes.patch \
                             file://default.xmodmap \
-                            file://98keymap-fixup "
+                            file://98keymap-fixup \
+			    file://xserver-common-at91sam9.patch "
+
 
 do_install_append() {
 	install -m 0755 "${WORKDIR}/setDPI.sh" "${D}/etc/X11/Xinit.d/50setdpi"
diff --git a/recipes/xserver-common/xserver-common_1.33.bb b/recipes/xserver-common/xserver-common_1.33.bb
index ff5711f..86f8932 100644
--- a/recipes/xserver-common/xserver-common_1.33.bb
+++ b/recipes/xserver-common/xserver-common_1.33.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Common X11 scripts and support files"
 LICENSE = "GPL"
 SECTION = "x11"
 RDEPENDS_${PN} = "xmodmap xrandr xdpyinfo"
-PR = "r8"
+PR = "r9"
 
 PACKAGE_ARCH = "all"
 DEFAULT_PREFERENCE = "-1"
@@ -33,6 +33,9 @@ SRC_URI_append_shr = " file://89xTs_Calibrate.xinput_calibrator.patch \
                        file://Xserver.add.dpi.for.gta.patch \
 		       file://Xserver.n900.patch"
 
+SRC_URI_append_at91 =	" file://89xTs_Calibrate.xinput_calibrator.patch \
+			"
+
 do_install_append() {
 	install -m 0755 "${WORKDIR}/setDPI.sh" "${D}/etc/X11/Xinit.d/50setdpi"
 	install -m 0755 "${WORKDIR}/89xdgautostart.sh" "${D}/etc/X11/Xsession.d/89xdgautostart"
-- 
1.6.3.3



