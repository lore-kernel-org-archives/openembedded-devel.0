Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OgKFQ-0007uA-Ix
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 18:21:50 +0200
Received: by fxm12 with SMTP id 12so2157422fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 09:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=AC0hlYR30nr6YNut3OYmQzfKLMxR+KPqPHdWGg/lK0A=;
	b=DLD+wcQPkjnpy4mG/bwTBMpUL4zNV6krXD85GVqrDpXU40x5mXBGK2P6zSTn159TP5
	j4aKDhnaAAfQe7k4+UWPoqOTKEcfhohV0jJItynEs4unJ1YXGvGQk6Yhitkna/kqVOqb
	+qPLETTEm6vJT5Bw3F2N6e5Yz/nr/wpDBC67A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Mt6jPJuxBCQRWwAqQX4MMbtNoxNxqSaWAGtMgBhhoPZdigfSsyqFR2qkb5wfJGkdQO
	bbAlZJ6M3YeDb3ok2lwep3Xi4wHYQ4I42CdL9hqZsTlyfd186paFlZWfPiDL6O2//gty
	fHDXQrzNhsjlAh73CkK3Q4Qdp9lntohjMfBhE=
Received: by 10.223.119.136 with SMTP id z8mr7584683faq.63.1280852501541;
	Tue, 03 Aug 2010 09:21:41 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.72.151])
	by mx.google.com with ESMTPS id s20sm2570960faa.28.2010.08.03.09.21.38
	(version=SSLv3 cipher=RC4-MD5); Tue, 03 Aug 2010 09:21:40 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Aug 2010 11:23:20 -0500
Message-Id: <1280852605-3524-6-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <1280852605-3524-1-git-send-email-aalonso00@gmail.com>
References: <1280852605-3524-1-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 06/11][v2] xilinx-virtex5: Add machine config for Xilinx Virtex5 platforms
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
X-List-Received-Date: Tue, 03 Aug 2010 16:21:50 -0000

* Config machine for virtex5 platforms ml507, ml510
* Hardware reference design at
  http://github.com/aalonso/xilinx-ml507
* v2 more descriptive subject

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 conf/machine/xilinx-virtex5.conf |   36 ++++++++++++++++++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/xilinx-virtex5.conf

diff --git a/conf/machine/xilinx-virtex5.conf b/conf/machine/xilinx-virtex5.conf
new file mode 100644
index 0000000..2e11b96
--- /dev/null
+++ b/conf/machine/xilinx-virtex5.conf
@@ -0,0 +1,36 @@
+# Copyright (C) 2010, Adrian Alonso <aalonso00@gmail.com>
+# Released under the MIT license (see packages/COPYING)
+#@TYPE: Machine
+#@Name: Xilinx Virtex5 FPGA Development Platforms
+#@DESCRIPTION: Machine configuration for Xilinx Virtex5 boards
+# Supported boards ML506, ML507, ML510
+
+TARGET_ARCH = "powerpc"
+TARGET_CPU  = "440"
+TARGET_FPU  = "soft"
+#tune for the 440 cpu
+require conf/machine/include/tune-ppc440.inc
+
+PREFERRED_PROVIDER_virtual/kernel = "linux-xilinx"
+PREFERRED_VERSION_u-boot_xilinx-virtex5 = "u-boot-xilinx"
+
+KERNEL_IMAGETYPE = "uImage"
+
+MACHINE_FEATURES = "kernel26 apm ext2 vfat ethernet screen"
+MACHINE_EXTRA_RECOMMENDS = "kernel-modules"
+
+UBOOT_ENTRYPOINT ?= "0x00000000"
+UBOOT_LOADADDRESS ?= "0x00000000"
+
+# Xilinx EDK override hardware  definitions for xilinx-bsp
+# Include in your local.conf
+# XILINX_BSP_PATH = "complete path for Xilinx XPS project"
+# XILINX_BOARD = "ml507"
+
+# Don't use tty1
+# USE_VT = "0"
+SERIAL_CONSOLE = "9600 ttyS0"
+
+# Device nodes add xsa for (system ace)
+IMAGE_DEVICE_TABLES = "files/device_table-minimal.txt \
+                       files/device_table_add-xsa.txt"
-- 
1.7.2



