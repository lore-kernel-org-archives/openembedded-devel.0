Received: from smtprelay-h32.telenor.se ([213.150.131.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Pk0rH-0008RT-Td
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 22:00:24 +0100
Received: from ipb4.telenor.se (ipb4.telenor.se [195.54.127.167])
	by smtprelay-h32.telenor.se (Postfix) with ESMTP id B13C5E8CA7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 21:59:30 +0100 (CET)
X-SENDER-IP: [83.227.56.243]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Aqw+ABayRk1T4zjzPGdsb2JhbACIXo16jiAMAQEBATUvvgOFTgSMIQ
X-IronPort-AV: E=Sophos;i="4.60,405,1291590000"; d="scan'208";a="1710711154"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.56.243])
	by ipb4.telenor.se with ESMTP; 31 Jan 2011 21:59:16 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Jan 2011 21:59:14 +0100
Message-Id: <1296507554-5473-1-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.3.3
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH v2] Add basic at91 image with Wi-Fi support
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
X-List-Received-Date: Mon, 31 Jan 2011 21:00:24 -0000


Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 recipes/images/console-at91sam9-image.bb |   35 ++++++++++++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 recipes/images/console-at91sam9-image.bb

diff --git a/recipes/images/console-at91sam9-image.bb b/recipes/images/console-at91sam9-image.bb
new file mode 100644
index 0000000..8b066e2
--- /dev/null
+++ b/recipes/images/console-at91sam9-image.bb
@@ -0,0 +1,35 @@
+#Angstrom bootstrap at91sam9 image
+
+IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
+
+ANGSTROM_EXTRA_INSTALL += " \
+	alsa-utils-amixer \
+	alsa-utils-aplay \
+	dosfstools \
+	iperf \
+	madplay \
+	mplayer \
+	mtd-utils \
+#	nbench-byte \
+	owl-wifi \
+	thttpd \
+	usbview \
+	"
+
+DEPENDS = "task-base-extended \
+           ${@base_contains("MACHINE_FEATURES", "screen", "psplash-zap", "",d)} \
+	   "
+
+IMAGE_INSTALL = "task-base-extended \
+	    ${ANGSTROM_EXTRA_INSTALL} \
+	    ${@base_contains("MACHINE_FEATURES", "screen", "psplash-zap", "",d)} \
+	   "
+
+export IMAGE_BASENAME = "console-at91sam9-image"
+IMAGE_LINGUAS = ""
+
+#we dont need the kernel in the image
+ROOTFS_POSTPROCESS_COMMAND += "rm -f ${IMAGE_ROOTFS}/boot/*Image*; "
+
+inherit image
+
-- 
1.6.3.3



