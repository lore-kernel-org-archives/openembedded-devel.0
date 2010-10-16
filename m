Received: from smtprelay-h31.telenor.se ([213.150.131.4])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1P76jv-0002Q4-Fo
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 15:24:00 +0200
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-h31.telenor.se (Postfix) with ESMTP id A0EBCEAF33
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 14:50:26 +0200 (CEST)
X-SENDER-IP: [83.227.56.243]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ah9AAFY8uUxT4zjzPGdsb2JhbACHcYtIjXkMAQEBATUtvRuFSQSKSg
X-IronPort-AV: E=Sophos;i="4.57,339,1283724000"; d="scan'208";a="141710377"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.56.243])
	by ipb1.telenor.se with ESMTP; 16 Oct 2010 14:50:26 +0200
From: ulf.samuelsson@atmel.com
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Oct 2010 14:50:06 +0200
Message-Id: <1287233406-8778-5-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1287233406-8778-4-git-send-email-ulf.samuelsson@atmel.com>
References: <1287233406-8778-1-git-send-email-ulf.samuelsson@atmel.com>
	<1287233406-8778-2-git-send-email-ulf.samuelsson@atmel.com>
	<1287233406-8778-3-git-send-email-ulf.samuelsson@atmel.com>
	<1287233406-8778-4-git-send-email-ulf.samuelsson@atmel.com>
X-SA-Exim-Connect-IP: 213.150.131.4
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH 5/5] Add X11 images with more multimedia support (mplayer etc.)
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
X-List-Received-Date: Sat, 16 Oct 2010 13:24:00 -0000

From: Ulf Samuelsson <ulf.samuelsson@atmel.com>


Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 recipes/images/console-audio-image.bb |   33 ++++++++++++++++++
 recipes/images/x11-at91sam9-image.bb  |   58 +++++++++++++++++++++++++++++++++
 2 files changed, 91 insertions(+), 0 deletions(-)
 create mode 100644 recipes/images/console-audio-image.bb
 create mode 100644 recipes/images/x11-at91sam9-image.bb

diff --git a/recipes/images/console-audio-image.bb b/recipes/images/console-audio-image.bb
new file mode 100644
index 0000000..271ebfb
--- /dev/null
+++ b/recipes/images/console-audio-image.bb
@@ -0,0 +1,33 @@
+# Angstrom bootstrap at91sam9 image
+require console-base-image.bb
+
+export IMAGE_BASENAME = "console-at91sam9-image"
+
+IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
+
+DEPENDS = "task-base-extended \
+           ${@base_contains("MACHINE_FEATURES", "screen", "psplash-zap", "",d)} \
+	   "
+
+IMAGE_INSTALL = "task-base-extended \
+	usbview \
+	mplayer \
+	thttpd \
+	madplay \
+	alsa-utils-aplay \
+	alsa-utils-amixer \
+	iperf \
+	dosfstools \
+	mtd-utils \
+	${@base_contains("MACHINE_FEATURES", "screen", "psplash-zap", "",d)} \
+	${IMAGE_EXTRA_INSTALL} \
+#	nbench-byte \
+	"
+
+IMAGE_LINGUAS = ""
+
+#we dont need the kernel in the image
+ROOTFS_POSTPROCESS_COMMAND += "rm -f ${IMAGE_ROOTFS}/boot/*Image*; "
+
+inherit image
+
diff --git a/recipes/images/x11-at91sam9-image.bb b/recipes/images/x11-at91sam9-image.bb
new file mode 100644
index 0000000..3917873
--- /dev/null
+++ b/recipes/images/x11-at91sam9-image.bb
@@ -0,0 +1,58 @@
+# Angstrom x11-gpe-image with additional apps included
+XSERVER = "xserver-xorg \
+           xf86-input-evdev \
+           xf86-input-tslib \
+           xf86-video-fbdev "
+
+require x11-gpe-image.bb
+
+export IMAGE_BASENAME = "x11-at91sam9-image"
+
+DEPENDS = "task-base"
+
+IMAGE_INSTALL += "\
+	gpe-calculator \
+	gpe-calendar \
+	gpe-clock \
+	gpe-contacts \
+	gpe-edit \
+	gpe-filemanager \
+	gpe-gallery \
+	gpe-go \
+	gpe-irc \
+	gpe-mixer \
+	gpe-scap \
+	gpe-sketchbook \
+	gpe-terminal \
+	gpe-tetris \
+	gpe-watch \
+	gpe-windowlist \
+	gnome-mplayer \
+	matchbox-panel-hacks \
+	usbview \
+	mplayer \
+	thttpd \
+	madplay \
+	alsa-utils-aplay \
+	alsa-utils-amixer \
+	iperf \
+	fbv \
+	dosfstools \
+	mtd-utils \
+	gpe-mini-browser \
+	tslib-conf \
+	tslib-calibrate \
+	tslib-tests \
+	libstdc++ \
+	${IMAGE_EXTRA_INSTALL} \
+#	nbench-byte \
+#	pointercal \
+	"
+
+# IMAGE_LINGUAS += " se no dk fi"
+ROOTFS_POSTPROCESS_COMMAND += "set_image_autologin; "
+ROOTFS_POSTPROCESS_COMMAND += "install_linguas; "
+
+#we dont need the kernel in the image
+ROOTFS_POSTPROCESS_COMMAND += "rm -f ${IMAGE_ROOTFS}/boot/*Image*; "
+
-- 
1.6.3.3



