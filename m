Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1M3gN8-0007Ab-Re
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 May 2009 03:01:31 +0200
Received: from gandalf.denix.org ([71.127.60.148]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KJI00F6PAISEBA2@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	11 May 2009 19:54:34 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 18A5114AF5F; Mon,
	11 May 2009 20:54:28 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 May 2009 20:54:21 -0400
Message-id: <1242089668-11610-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.0.6
In-reply-to: <1242089668-11610-1-git-send-email-denis@denix.org>
References: <1242089668-11610-1-git-send-email-denis@denix.org>
Subject: [PATCH 1/8] davinci.inc: add common DaVinci machine configuration
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
X-List-Received-Date: Tue, 12 May 2009 01:01:31 -0000


Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 conf/machine/include/davinci.inc |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/include/davinci.inc

diff --git a/conf/machine/include/davinci.inc b/conf/machine/include/davinci.inc
new file mode 100644
index 0000000..1f688f4
--- /dev/null
+++ b/conf/machine/include/davinci.inc
@@ -0,0 +1,24 @@
+require conf/machine/include/tune-arm926ejs.inc
+
+# Increase this everytime you change something in the kernel
+MACHINE_KERNEL_PR = "r0"
+
+TARGET_ARCH = "arm"
+
+HOTPLUG = "udev"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux-davinci"
+
+KERNEL_IMAGETYPE = "uImage"
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
+MACHINE_FEATURES += " kernel26 serial usbhost alsa "
-- 
1.6.0.6



