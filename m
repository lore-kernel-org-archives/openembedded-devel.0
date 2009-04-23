Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Lx3hk-0000sO-3P
	for openembedded-devel@openembedded.org; Thu, 23 Apr 2009 20:31:24 +0200
Received: (qmail 28240 invoked by uid 813007); 23 Apr 2009 18:26:45 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 23 Apr 2009 18:26:45 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Apr 2009 20:26:36 +0200
Message-Id: <1240511199-30422-2-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.rc0
In-Reply-To: <1240511199-30422-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1240511199-30422-1-git-send-email-marcin@juszkiewicz.com.pl>
Cc: Marcin Juszkiewicz <marcin@buglabs.net>
Subject: [STABLE][PATCH 1/4] bug: added BUG Labs device
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
X-List-Received-Date: Thu, 23 Apr 2009 18:31:24 -0000

From: Marcin Juszkiewicz <marcin@buglabs.net>

BUG is i.mx31 based device which is often called 'LEGO for IT'.

More info: http://buglabs.net/

Signed-off-by: Marcin Juszkiewicz <marcin@buglabs.net>
---
 conf/machine/bug.conf |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/bug.conf

diff --git a/conf/machine/bug.conf b/conf/machine/bug.conf
new file mode 100644
index 0000000..cec3d5b
--- /dev/null
+++ b/conf/machine/bug.conf
@@ -0,0 +1,16 @@
+#@TYPE: Machine
+#@NAME: Bug Labs BUG Computer
+#@DESCRIPTION: Machine configuration for the BUG base unit.
+TARGET_ARCH = "arm"
+
+MACHINE_EXTRA_RRECOMMENDS = "marvell-gspi-fw"
+PREFERRED_PROVIDER_virtual/kernel = "linux-bug"
+
+MACHINE_FEATURES = "kernel26 screen touchscreen hotplug alsa wifi usbhost usbgadget"
+SERIAL_CONSOLE = "-L 115200 ttymxc4"
+
+CPU_FEATURES += "vfp"
+
+require conf/machine/include/tune-arm1136jf-s.inc
+
+KERNEL_IMAGETYPE = "uImage"
-- 
1.6.3.rc0





