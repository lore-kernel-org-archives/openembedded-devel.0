Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OgKFN-0007tx-T5
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 18:21:48 +0200
Received: by fxm12 with SMTP id 12so2157397fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 09:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=csl9aU5EpMYD/0Tn5T3Gb5ABCq/W9OFpJILzggwYKbM=;
	b=hJIunBAW2V8oty2iwav7g0wgcH9/fbuA4q1RqSlko0C+44BWntVPqEj5DCdP79xRiV
	mU+oL9w+gTfsIG9FoNkP+u0N/IiBEgOQxePXusjnnTf8qmSAcsCnuEoEluwtQ7Cn7aLd
	tWoNuQmSP1a5CpePr3bsMy1Gt4YS5GidtXix8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=eXEWpywxU/LlYyUrxzSGhUM+Ivcabw2Y4V0q/A1QTGzXxbVhS0Cffne9n4tlTPbIoj
	nPb+81FCnBInw257XcC5OIAWBo6qY7s+pw1mtkkfjinBGwZXqIEViwVrdjFmVcWlM55C
	4YSlgO+MeZ0FOPEI64/z7rt9REmL4dk2ONwXk=
Received: by 10.223.118.71 with SMTP id u7mr7593355faq.58.1280852498652;
	Tue, 03 Aug 2010 09:21:38 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.72.151])
	by mx.google.com with ESMTPS id s20sm2570960faa.28.2010.08.03.09.21.35
	(version=SSLv3 cipher=RC4-MD5); Tue, 03 Aug 2010 09:21:38 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Aug 2010 11:23:19 -0500
Message-Id: <1280852605-3524-5-git-send-email-aalonso00@gmail.com>
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
Subject: [PATCH 05/11][v2] xilinx-virtex4: Add machine config for Xilinx Virtex4 platforms
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
X-List-Received-Date: Tue, 03 Aug 2010 16:21:48 -0000

* New config machine, generic support for Xilinx
  Virtex4 platforms ml401, ml403, ml405, ml410
* Tested on ml405 target board, powerpc based ref project
  design at http://github.com/aalonso/xilinx-ml405
* Target configuration handled in xilinx-bsp.bbclass
* v2 more descriptive subject

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
1.7.2



