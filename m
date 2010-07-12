Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OYP0O-0004NL-1I
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 21:49:33 +0200
Received: by pzk2 with SMTP id 2so1332662pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jul 2010 12:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=dUk/IP2KQljcbczfzSh9qf0JKVfIYmbSN+neGEEFJ4s=;
	b=ESpIbQQ0rhsY2PrTwJTrYFVbrtF74BcAoI9xqSZeeggs1iVbMzqmLtgkSSU8pXjpZd
	A5dbOnTUiZyUcWiZ8OhQ1a51fDCbkE/uQYxjHcwuTddLfZzQ8V6HsAUQsA/XZIe6gWYO
	YNaqCSTsOQqOGSz8lP4sIPyMHRX1L8LA4/kns=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=epTvstcvqV+nzJ3WEAjz0AQ5sC08Z21oMPzbVzL/3jtTqKrpN29sPdiflAv8B5AnLN
	TDPVtQ9U9hMJijSwxy+A8YbYk9sscRfApfYd4IVseesdWmZg8eILoZLLJqryqXAMxgyC
	GRQnEMReHKx8c1FLwCASZZEytApJJajqc7uus=
Received: by 10.142.158.13 with SMTP id g13mr16399592wfe.235.1278963874466;
	Mon, 12 Jul 2010 12:44:34 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.224.36])
	by mx.google.com with ESMTPS id 23sm5192380wfa.22.2010.07.12.12.44.31
	(version=SSLv3 cipher=RC4-MD5); Mon, 12 Jul 2010 12:44:33 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Jul 2010 14:45:43 -0500
Message-Id: <1278963950-2587-2-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.1.1
In-Reply-To: <1278963950-2587-1-git-send-email-aalonso00@gmail.com>
References: <1278963950-2587-1-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/9] xilinx-virtex5: new file
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
X-List-Received-Date: Mon, 12 Jul 2010 19:49:33 -0000

* Config machine for virtex5 platforms ml505, ml507, ml510
* Hardware reference design at
  http://github.com/aalonso/xilinx-ml507

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 conf/machine/xilinx-virtex5.conf |   37 +++++++++++++++++++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/xilinx-virtex5.conf

diff --git a/conf/machine/xilinx-virtex5.conf b/conf/machine/xilinx-virtex5.conf
new file mode 100644
index 0000000..3272f2c
--- /dev/null
+++ b/conf/machine/xilinx-virtex5.conf
@@ -0,0 +1,37 @@
+# Copyright (C) 2010, Adrian Alonso <aalonso00@gmail.com>
+# Released under the MIT license (see packages/COPYING)
+#@TYPE: Machine
+#@Name: Xilinx ML507 FPGA Development Platform
+#@DESCRIPTION: Machine configuration for Xilinx ML507
+
+TARGET_ARCH ?= "powerpc"
+TARGET_CPU  ?= "440"
+TARGET_FPU  ?= "soft"
+TARGET_TUNE ?= "ppc440"
+#tune for the 440 cpu
+require conf/machine/include/tune-${TARGET_TUNE}.inc
+
+#ASSUME_PROVIDED += "virtual/kernel"
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
1.7.1.1



