Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OYP0N-0004NI-9e
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 21:49:35 +0200
Received: by pzk2 with SMTP id 2so1332655pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jul 2010 12:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=nlLl1d+6TgH1SAu5yC9v+RylPKNSbPABpJBCPRmClCY=;
	b=OOCsBKDxIqZZqMi52nrOThCVWApkpsrKBnAyL64mA/AtghnQmLSKjHAh39A3Y5iwUp
	wR/ur9v2S9WbrVn3ipJwsyoJ9g3cykXORV1jogqiCvU9a0Cu5diisRyE8Sn7ySPFIu8b
	nUgbq5xFxHIJsCpInlpRGqqetTZjy2E4W1WmM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=CWfIkf9zILVwwlpwEW06LfS0iX6vtZHf6kWC7xH0d4ENRj1ZSZsGA2Os9age93eynf
	O/Ut4RdE923cVwaAegKdHCSDI4KL8TBhQqAOtehpwL86HYAB+dtKqdW+cO6yf5vIe/RY
	Q4gLE9URKxWZmJMCY4LUgZtUfE5DWnbB3GGOA=
Received: by 10.142.215.6 with SMTP id n6mr6228767wfg.228.1278963871634;
	Mon, 12 Jul 2010 12:44:31 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.224.36])
	by mx.google.com with ESMTPS id 23sm5192380wfa.22.2010.07.12.12.44.28
	(version=SSLv3 cipher=RC4-MD5); Mon, 12 Jul 2010 12:44:30 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Jul 2010 14:45:42 -0500
Message-Id: <1278963950-2587-1-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.1.1
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/9] xilinx-virtex4: new file
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
X-List-Received-Date: Mon, 12 Jul 2010 19:49:35 -0000

* New config machine, generic support for Xilinx
  Virtex4 platforms ml401, ml403, ml405, ml410
* Tested on ml405 target board, powerpc based ref
  design at http://github.com/aalonso/xilinx-ml405
* Target configuration handled in xilinx-bsp.bbclass

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 conf/machine/xilinx-virtex4.conf |   40 ++++++++++++++++++++++++++++++++++++++
 1 files changed, 40 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/xilinx-virtex4.conf

diff --git a/conf/machine/xilinx-virtex4.conf b/conf/machine/xilinx-virtex4.conf
new file mode 100644
index 0000000..942b63f
--- /dev/null
+++ b/conf/machine/xilinx-virtex4.conf
@@ -0,0 +1,40 @@
+# Copyright (C) 2010, Adrian Alonso <aalonso00@gmail.com>
+# Released under the MIT license (see packages/COPYING)
+#@TYPE: Machine
+#@Name: Xilinx Virtex4 FPGA Development Platform
+#@DESCRIPTION: Machine configuration for Xilinx Virtex4 family
+# Supported targets
+# ML403, ML405, ML410
+
+# Default arch can be overrided in local.conf
+TARGET_ARCH ?= "powerpc"
+TARGET_CPU  ?= "405"
+TARGET_FPU  ?= "soft"
+TARGET_TUNE ?= "ppc405"
+#tune for the selected cpu
+require conf/machine/include/tune-${TARGET_TUNE}.inc
+
+#ASSUME_PROVIDED += "virtual/kernel"
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
+# Xilinx EDK override hardware  definitions for xilinx-bsp
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



