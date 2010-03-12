Received: from smtprelay-h11.telenor.se ([62.127.194.4])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1NqDlR-0002yB-J7
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 23:55:33 +0100
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-h11.telenor.se (Postfix) with ESMTP id B8FC8C2C4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Mar 2010 23:30:03 +0100 (CET)
X-SMTPAUTH-B2: 
X-SENDER-IP: 83.227.59.242
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ao85AL9OmktT4zvyPGdsb2JhbACHYZMIDAEBAQE3La42jVSEewQ
X-IronPort-AV: E=Sophos;i="4.49,628,1262559600"; d="scan'208";a="49492440"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost.localdomain) ([83.227.59.242])
	by ipb1.telenor.se with ESMTP; 12 Mar 2010 23:30:00 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Mar 2010 23:30:00 +0100
Message-Id: <1268433000-4728-1-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.0.2
X-SA-Exim-Connect-IP: 62.127.194.4
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH] console-at91sam9-image: console-image with apps
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
X-List-Received-Date: Fri, 12 Mar 2010 22:55:33 -0000

From: Nicolas Ferre <nicolas.ferre@atmel.com>

Create a derivative of console-image with more applications

+       usbview
+       mplayer
+       thttpd
+       madplay
+       alsa-utils-aplay
+       alsa-utils-amixer
+       iperf
+       dosfstools
+       mtd-utils

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 recipes/images/console-at91sam9-image.bb |   34 ++++++++++++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 recipes/images/console-at91sam9-image.bb

diff --git a/recipes/images/console-at91sam9-image.bb b/recipes/images/console-at91sam9-image.bb
new file mode 100644
index 0000000..7aae0fb
--- /dev/null
+++ b/recipes/images/console-at91sam9-image.bb
@@ -0,0 +1,34 @@
+#Angstrom bootstrap at91sam9 image
+
+IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
+
+ANGSTROM_EXTRA_INSTALL += " \
+	usbview \
+	mplayer \
+	thttpd \
+	madplay \
+	alsa-utils-aplay \
+	alsa-utils-amixer \
+	iperf \
+	dosfstools \
+	mtd-utils \
+#	nbench-byte \
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
1.6.0.2



