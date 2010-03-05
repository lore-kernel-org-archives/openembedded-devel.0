Received: from [148.204.64.197] (helo=localhost.localdomain)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso@localhost.localdomain>) id 1NnhRQ-00061f-Cs
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Mar 2010 01:00:25 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.14.3/8.14.3) with ESMTP id o25NFUaY014777; 
	Fri, 5 Mar 2010 17:15:30 -0600
Received: (from aalonso@localhost)
	by localhost.localdomain (8.14.3/8.14.3/Submit) id o25NFUWr014776;
	Fri, 5 Mar 2010 17:15:30 -0600
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Mar 2010 17:15:19 -0600
Message-Id: <1267830919-14718-7-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1267830919-14718-6-git-send-email-aalonso00@gmail.com>
References: <openembedded-devel@lists.openembedded.org>
	<1267830919-14718-1-git-send-email-aalonso00@gmail.com>
	<1267830919-14718-2-git-send-email-aalonso00@gmail.com>
	<1267830919-14718-3-git-send-email-aalonso00@gmail.com>
	<1267830919-14718-4-git-send-email-aalonso00@gmail.com>
	<1267830919-14718-5-git-send-email-aalonso00@gmail.com>
	<1267830919-14718-6-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 148.204.64.197
X-SA-Exim-Mail-From: aalonso@localhost.localdomain
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL,BAYES_00,HELO_LH_LD,
	NO_DNS_FOR_FROM,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 7/7] xilinx-ml507.conf: new config file for ml507 devboard
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
X-List-Received-Date: Sat, 06 Mar 2010 00:00:25 -0000

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 conf/machine/xilinx-ml507.conf |   38 ++++++++++++++++++++++++++++++++++++++++
 1 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/xilinx-ml507.conf

diff --git a/conf/machine/xilinx-ml507.conf b/conf/machine/xilinx-ml507.conf
new file mode 100644
index 0000000..bcb83a5
--- /dev/null
+++ b/conf/machine/xilinx-ml507.conf
@@ -0,0 +1,38 @@
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
+PREFERRED_PROVIDER_virtual/kernel = "linux-xilinx-ml507"
+
+KERNEL_IMAGETYPE = "uImage"
+
+MACHINE_FEATURES = "kernel26 apm ext2 vfat ethernet"
+MACHINE_EXTRA_RECOMMENDS = "kernel-modules"
+
+UBOOT_ARCH = "ppc"
+UBOOT_MACHINE = "ml507_config"
+UBOOT_ENTRYPOINT ?= "0x00000000"
+UBOOT_LOADADDRESS ?= "0x00000000"
+PREFERRED_VERSION_u-boot_xilinx-ml507 = "git"
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
+# Device nodes add xsa for (system ace)
+IMAGE_DEVICE_TABLES = "files/device_table-minimal.txt \
+                       files/device_table_add-xsa.txt"
-- 
1.6.6.1



