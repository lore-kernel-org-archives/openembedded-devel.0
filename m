Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OYnx9-0001oa-1Y
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 00:28:18 +0200
Received: by pxi12 with SMTP id 12so1889735pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jul 2010 15:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=hEfZ4IvO47oEGOaUuH98UCq90HcVRQqvUUxnpyqS+uM=;
	b=mR2zuY7wBn8RL6kjCirk0sRuLDhihyMSkvIFHpqt66AySG8OKGzoTA5oXSBjDyAE9l
	NcMxh7HdYbvXY/aah3bFi1lkTX5U/CkNQWlZUcvpe7BqSd6nYmTtOxM1SeLQ30PjfMg5
	K4zOhE2yW5jTjJpEHWpgTQI1JZJokJ/DtM388=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=B1krwz/0L/F3Jo0qYRnJPx1t4DTDGMi/H6QuhtpcX5fODlq9MD0o6a79ZGdW7/sQfq
	6UPmpHZFj8t7yxCaNlyImeN21WqD0UL1UQHfg9CsRWyLLhut+BemFaQ4zKIT8fXAehp2
	E8397PNEPX0N5Q2cBtAVtCtGw+z1PNpffWKnc=
Received: by 10.142.144.2 with SMTP id r2mr4096734wfd.298.1279060067109;
	Tue, 13 Jul 2010 15:27:47 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.224.36])
	by mx.google.com with ESMTPS id g37sm6348269rvb.17.2010.07.13.15.27.45
	(version=SSLv3 cipher=RC4-MD5); Tue, 13 Jul 2010 15:27:46 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Jul 2010 17:28:58 -0500
Message-Id: <1279060140-17856-1-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.1.1
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/3 v2] xilinx-virtex4: new file
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
X-List-Received-Date: Tue, 13 Jul 2010 22:28:25 -0000

* New config machine, generic support for Xilinx
  Virtex4 platforms ml401, ml403, ml405, ml410
* Tested on ml405 target board, powerpc based ref
  design at http://github.com/aalonso/xilinx-ml405
* Target configuration handled in xilinx-bsp.bbclass

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 conf/machine/xilinx-virtex4.conf |   37 +++++++++++++++++++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/xilinx-virtex4.conf

diff --git a/conf/machine/xilinx-virtex4.conf b/conf/machine/xilinx-virtex4.conf
new file mode 100644
index 0000000..eeea44e
--- /dev/null
+++ b/conf/machine/xilinx-virtex4.conf
@@ -0,0 +1,37 @@
+# Copyright (C) 2010, Adrian Alonso <aalonso00@gmail.com>
+# Released under the MIT license (see packages/COPYING)
+#@TYPE: Machine
+#@Name: Xilinx Virtex4 FPGA Development Platform
+#@DESCRIPTION: Machine configuration for Xilinx Virtex4 family
+# Supported targets
+# ML403, ML405, ML410
+
+TARGET_ARCH = "powerpc"
+TARGET_CPU  = "405"
+TARGET_FPU  = "soft"
+#tune for the selected cpu
+require conf/machine/include/tune-ppc405.inc
+
+PREFERRED_PROVIDER_virtual/kernel = "linux-xilinx"
+PREFERRED_VERSION_u-boot_xilinx-virtex4 = "u-boot-xilinx"
+
+KERNEL_IMAGETYPE = "uImage"
+
+MACHINE_FEATURES = "kernel26 apm ext2 vfat ethernet"
+MACHINE_EXTRA_RECOMMENDS = "kernel-modules"
+
+UBOOT_ENTRYPOINT ?= "0x00000000"
+UBOOT_LOADADDRESS ?= "0x00000000"
+
+# Xilinx EDK override hardware definitions for xilinx-bsp
+# Include in your local.conf
+# XILINX_BSP_PATH = "complete path for Xilinx XPS project"
+# XILINX_BOARD = "ml410"
+
+# Don't use tty1
+USE_VT = "0"
+SERIAL_CONSOLE = "9600 ttyS0"
+
+# Device nodes add xsa for (system ace)
+IMAGE_DEVICE_TABLES = "files/device_table-minimal.txt \
+                       files/device_table_add-xsa.txt"
-- 
1.7.1.1



