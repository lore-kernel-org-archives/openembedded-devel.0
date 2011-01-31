Received: from smtprelay-h21.telenor.se ([195.54.99.196])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Pk0qo-00084P-Sw
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 21:59:55 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-h21.telenor.se (Postfix) with ESMTP id AB2ADEAC9B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 21:59:01 +0100 (CET)
X-SENDER-IP: [83.227.56.243]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Aqw+ANqxRk1T4zjzPGdsb2JhbACIXo16jiAMAQEBATUvvgWDF4I3BIwh
X-IronPort-AV: E=Sophos;i="4.60,405,1291590000"; d="scan'208";a="169041743"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.56.243])
	by ipb2.telenor.se with ESMTP; 31 Jan 2011 21:59:01 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Jan 2011 21:58:59 +0100
Message-Id: <1296507539-5401-1-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.3.3
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH v2] Add Wi-Fi support in at91sam9 image
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
X-List-Received-Date: Mon, 31 Jan 2011 20:59:55 -0000


Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 recipes/images/x11-at91sam9-image.bb |   43 +++++++++++++++++++--------------
 1 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/recipes/images/x11-at91sam9-image.bb b/recipes/images/x11-at91sam9-image.bb
index 3917873..29337ca 100644
--- a/recipes/images/x11-at91sam9-image.bb
+++ b/recipes/images/x11-at91sam9-image.bb
@@ -1,8 +1,11 @@
 # Angstrom x11-gpe-image with additional apps included
 XSERVER = "xserver-xorg \
            xf86-input-evdev \
-           xf86-input-tslib \
-           xf86-video-fbdev "
+           xf86-input-mouse \
+           xf86-video-fbdev \
+           xf86-input-keyboard \
+	   xinput-calibrator \
+	  "
 
 require x11-gpe-image.bb
 
@@ -11,6 +14,11 @@ export IMAGE_BASENAME = "x11-at91sam9-image"
 DEPENDS = "task-base"
 
 IMAGE_INSTALL += "\
+	alsa-utils-aplay \
+	alsa-utils-amixer \
+	dosfstools \
+	fbv \
+	gnome-mplayer \
 	gpe-calculator \
 	gpe-calendar \
 	gpe-clock \
@@ -20,6 +28,7 @@ IMAGE_INSTALL += "\
 	gpe-gallery \
 	gpe-go \
 	gpe-irc \
+#	gpe-mini-browser \
 	gpe-mixer \
 	gpe-scap \
 	gpe-sketchbook \
@@ -27,29 +36,27 @@ IMAGE_INSTALL += "\
 	gpe-tetris \
 	gpe-watch \
 	gpe-windowlist \
-	gnome-mplayer \
+	iperf \
+	libstdc++ \
+	madplay \
 	matchbox-panel-hacks \
-	usbview \
 	mplayer \
-	thttpd \
-	madplay \
-	alsa-utils-aplay \
-	alsa-utils-amixer \
-	iperf \
-	fbv \
-	dosfstools \
 	mtd-utils \
-	gpe-mini-browser \
-	tslib-conf \
-	tslib-calibrate \
-	tslib-tests \
-	libstdc++ \
-	${IMAGE_EXTRA_INSTALL} \
 #	nbench-byte \
-#	pointercal \
+	owl-wifi \
+	pointercal \
+	thttpd \
+#	tslib-conf \
+#	tslib-calibrate \
+#	tslib-tests \
+	usbview \
 	"
 
+IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
+
 # IMAGE_LINGUAS += " se no dk fi"
+#zap root password for release images
+ROOTFS_POSTPROCESS_COMMAND += '${@base_conditional("DISTRO_TYPE", "release", "zap_root_password; ", "",d)}'
 ROOTFS_POSTPROCESS_COMMAND += "set_image_autologin; "
 ROOTFS_POSTPROCESS_COMMAND += "install_linguas; "
 
-- 
1.6.3.3



