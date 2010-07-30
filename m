Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1Oerhe-0000lV-0D
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 17:41:01 +0200
Received: by mail-wy0-f175.google.com with SMTP id 38so1347518wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 08:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Qzc2dVIotkczEmVh+1AwBjJ29qxu0+VY0S66zUI0eUc=;
	b=mxxmlcAed48JBtq+ALVsXXmQMgVuYzFt1b4pv+4zGx45kPRP1HyGziodRUjSBGXpJc
	81CCvazboBINCezQGE1FXF3fCZeBZarHK33sE2hTCETIKCmu/keXk19qmxevISQry3xR
	IhN5hYdRTFIeJUXbt/xJWC4/fW4+0siV+98Lg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Va1zFUM4T98du19Bj9zPa6K6lKpNi2XA99/J24u0hhAGBNPK48M27e17ioPvm4ghc6
	sfWwTPt+G98XTEiwOhydJ81zWaPjU9vukrgf9DFJah+rtSogVyUpDyjbZRqvCNHiyJV1
	ZegZoiSB2bg44ClUvVp9WWZLcjs9jxl/BJAX8=
Received: by 10.227.132.129 with SMTP id b1mr2000177wbt.5.1280504435733;
	Fri, 30 Jul 2010 08:40:35 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.218.190])
	by mx.google.com with ESMTPS id h3sm2015014wbb.15.2010.07.30.08.40.31
	(version=SSLv3 cipher=RC4-MD5); Fri, 30 Jul 2010 08:40:34 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jul 2010 10:42:28 -0500
Message-Id: <1280504555-3633-3-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <openembedded-devel@lists.openembedded.org>
References: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 03/10] xilinx-virtex5: new file
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
X-List-Received-Date: Fri, 30 Jul 2010 15:41:01 -0000

* Config machine for virtex5 platforms ml505, ml507, ml510
* Hardware reference design at
  http://github.com/aalonso/xilinx-ml507

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



