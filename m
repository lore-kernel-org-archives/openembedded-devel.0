Received: from [148.204.65.238] (helo=localhost.localdomain)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso@localhost.localdomain>) id 1NhQH3-0007I5-JM
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Feb 2010 17:27:49 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.14.3/8.14.3) with ESMTP id o1GGWcun002481; 
	Tue, 16 Feb 2010 10:32:38 -0600
Received: (from aalonso@localhost)
	by localhost.localdomain (8.14.3/8.14.3/Submit) id o1GGWbZ1002480;
	Tue, 16 Feb 2010 10:32:37 -0600
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Feb 2010 10:32:08 -0600
Message-Id: <1266337930-2440-2-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.6.6
In-Reply-To: <1266337930-2440-1-git-send-email-aalonso00@gmail.com>
References: <1266337930-2440-1-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 148.204.65.238
X-SA-Exim-Mail-From: aalonso@localhost.localdomain
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 2/4] xilinx-ml507.conf: new config for xilinx ml507 devboard
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
X-List-Received-Date: Tue, 16 Feb 2010 16:27:49 -0000

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 conf/machine/xilinx-ml507.conf |   33 +++++++++++++++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/xilinx-ml507.conf

diff --git a/conf/machine/xilinx-ml507.conf b/conf/machine/xilinx-ml507.conf
new file mode 100644
index 0000000..6194469
--- /dev/null
+++ b/conf/machine/xilinx-ml507.conf
@@ -0,0 +1,33 @@
+# Copyright (C) 2010, Adrian Alonso <aalonso00@gmail.com>
+# Released under the MIT license (see packages/COPYING)
+#@TYPE: Machine
+#@Name: Xilinx ML507 FPGA Development Platform
+#@DESCRIPTION: Machine configuration for Xilinx ML507
+
+TARGET_ARCH = "powerpc"
+TARGET_CPU = "440"
+TARGET_FPU = "soft"
+#tune for the 440 cpu
+require conf/machine/include/tune-ppc440.inc
+
+#ASSUME_PROVIDED += "virtual/kernel"
+PREFERRED_PROVIDER_virtual/kernel = "linux"
+
+KERNEL_IMAGETYPE = "uImage"
+
+MACHINE_FEATURES = "kernel26 ext2 usbhost udev"
+MACHINE_EXTRA_RECOMMENDS = "kernel-modules"
+
+UBOOT_ARCH = "ppc"
+UBOOT_MACHINE = "ml507_defconfig"
+
+# Xilinx EDK override hardware  definitions for xilinx-bsp
+# Include in your local.conf
+# XILINX_BSP_PATH = "complete path for Xilinx XPS project"
+# XILINX_BOARD = "ml507"
+
+# Don't use tty1
+USE_VT = "0"
+SERIAL_CONSOLE = "9600 ttyS0"
+
+
-- 
1.6.6



