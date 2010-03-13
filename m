Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1NqLOC-00044d-6A
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Mar 2010 08:04:04 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id 77A0ACA2F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Mar 2010 08:01:00 +0100 (CET)
X-SMTPAUTH-B2: 
X-SENDER-IP: 83.227.59.242
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Arg2APrGmktT4zvyPGdsb2JhbACHYZMNDAEBAQE3LawkDY00gnCCCwQ
X-IronPort-AV: E=Sophos;i="4.49,630,1262559600"; d="scan'208";a="49506684"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost.localdomain) ([83.227.59.242])
	by ipb2.telenor.se with ESMTP; 13 Mar 2010 08:01:00 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Mar 2010 08:00:59 +0100
Message-Id: <1268463659-12912-1-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.0.2
X-SA-Exim-Connect-IP: 62.127.194.20
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH v2 1/1] x11-at91sam9-image: x11-gpe-image with additions
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
X-List-Received-Date: Sat, 13 Mar 2010 07:04:04 -0000

From: Nicolas Ferre <nicolas.ferre@atmel.com>

Create an image based on x11-gpe-image but with
a lot of applications added;

+	gpe-irc
+	gpe-sketchbook
+	gpe-filemanager
+	gpe-tetris
+	gpe-go
+	gpe-calendar
+	gpe-contacts
+	gpe-edit
+	gpe-gallery
+	gpe-calculator
+	gpe-clock
+	gpe-terminal
+	gpe-watch
+	matchbox-panel-hacks
+	gpe-scap
+	gpe-windowlist
+	gpe-mixer
+	usbview
+	mplayer
+	thttpd
+	madplay
+	alsa-utils-aplay
+	alsa-utils-amixer
+	iperf
+	fbv
+	dosfstools
+	mtd-utils
+	multimedia
+	gpe-mini-browser

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 recipes/images/x11-at91sam9-image.bb |   67 ++++++++++++++++++++++++++++++++++
 1 files changed, 67 insertions(+), 0 deletions(-)
 create mode 100644 recipes/images/x11-at91sam9-image.bb

diff --git a/recipes/images/x11-at91sam9-image.bb b/recipes/images/x11-at91sam9-image.bb
new file mode 100644
index 0000000..c2bd723
--- /dev/null
+++ b/recipes/images/x11-at91sam9-image.bb
@@ -0,0 +1,67 @@
+#Angstrom X11 at91sam9 image with apps and kernel modules included
+
+XSERVER ?= "xserver-kdrive-fbdev"
+SPLASH ?= ' ${@base_contains("MACHINE_FEATURES", "screen", "psplash-angstrom", "",d)}'
+	
+ANGSTROM_EXTRA_INSTALL += " \
+	gpe-irc \
+	gpe-sketchbook \
+	gpe-filemanager \
+	gpe-tetris \
+	gpe-go \
+	gpe-calendar \
+	gpe-contacts \
+	gpe-edit \
+	gpe-gallery \
+	gpe-calculator \
+	gpe-clock \
+	gpe-terminal \
+	gpe-watch \
+	matchbox-panel-hacks \
+	gpe-scap \
+	gpe-windowlist \
+	gpe-mixer \
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
+	multimedia \
+	gpe-mini-browser \
+#	nbench-byte \
+#	pointercal \
+	"
+
+export IMAGE_BASENAME = "x11-at91sam9-image"
+
+DEPENDS = "task-base"
+IMAGE_INSTALL = "\
+    ${XSERVER} \
+    task-base-extended \
+    angstrom-x11-base-depends \
+    angstrom-gpe-task-base \
+    angstrom-gpe-task-settings \
+    kernel-modules \
+    hal \
+    angstrom-gpe-task-pim \
+    tslib-conf \
+    tslib-calibrate \
+    tslib-tests \
+    ${SPLASH} \
+    ${ANGSTROM_EXTRA_INSTALL}"
+
+IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
+
+#zap root password for release images
+ROOTFS_POSTPROCESS_COMMAND += '${@base_conditional("DISTRO_TYPE", "release", "zap_root_password; ", "",d)}'
+ROOTFS_POSTPROCESS_COMMAND += "set_image_autologin; "
+
+#we dont need the kernel in the image
+ROOTFS_POSTPROCESS_COMMAND += "rm -f ${IMAGE_ROOTFS}/boot/*Image*; "
+
+inherit image
-- 
1.6.0.2



