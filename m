Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1M6gfG-0005Di-RY
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 May 2009 09:56:40 +0200
Received: from gandalf.denix.org ([71.127.60.148]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KJX0055EMZZLVH4@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	20 May 2009 02:47:59 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 10CD314AF5F; Wed,
	20 May 2009 03:47:59 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2009 03:47:51 -0400
Message-id: <1242805678-20645-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.0.6
In-reply-to: <1242805678-20645-1-git-send-email-denis@denix.org>
References: <1242805678-20645-1-git-send-email-denis@denix.org>
Subject: [PATCHv2 1/8] davinci.inc: add common DaVinci machine configuration
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
X-List-Received-Date: Wed, 20 May 2009 07:56:43 -0000


Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 conf/machine/include/davinci.inc |   26 ++++++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/include/davinci.inc

diff --git a/conf/machine/include/davinci.inc b/conf/machine/include/davinci.inc
new file mode 100644
index 0000000..295a9c7
--- /dev/null
+++ b/conf/machine/include/davinci.inc
@@ -0,0 +1,26 @@
+require conf/machine/include/tune-arm926ejs.inc
+
+# Increase this everytime you change something in the kernel
+MACHINE_KERNEL_PR = "r0"
+
+TARGET_ARCH = "arm"
+
+KERNEL_IMAGETYPE = "uImage"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux-davinci"
+PREFERRED_PROVIDER_xserver = "xserver-kdrive"
+
+PREFERRED_VERSION_u-boot = "git"
+UBOOT_MACHINE = "davinci_dvevm_config"
+
+UBOOT_ENTRYPOINT = "0x80008000"
+UBOOT_LOADADDRESS = "0x80008000"
+
+#EXTRA_IMAGEDEPENDS += "u-boot ubl"
+
+SERIAL_CONSOLE ?= "115200 ttyS0"
+EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
+
+#ROOT_FLASH_SIZE = "29"
+
+MACHINE_FEATURES = "kernel26 serial ethernet usbhost usbgadget mmc alsa"
-- 
1.6.0.6



