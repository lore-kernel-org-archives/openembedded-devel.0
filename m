Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OYnxB-0001oc-M7
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 00:27:54 +0200
Received: by pzk2 with SMTP id 2so1719258pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jul 2010 15:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=AxgNg0hIj+qKywP8y6VuRspdzFehK30s9zdXYx+wvf4=;
	b=wuO5XCIWchC2R8CuCmUYCMRtKR6dtiQLhJ1Jysu12fa6GefkFSlMv2eYO3fUTMtGQ1
	lUtxSZr0OunvUAN5lE8hVs0Qf6A2hhryTCQfPhReL3fi1FwQCm2reGPtG1QXSCORpwzd
	Rb6b+xi8010Cv8xDBElIiHqnLTfHg+hODGt9M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=PoE43gHi9h8y+tyFEZGAkC7gA8G5sDRBdVNJZgdDQyNyqIvUcTngN+AhT6o5FKmHrJ
	N7wT/Hq7GBfP+X8utcs5tQRFCIq9++6lAHvoJRQ/nwwYK6lxmRtlGwWvZCtVFsfKMVsv
	cnrzcHC3cpTX4ydDVsFVfv4VYGOVl3nKLODuY=
Received: by 10.142.204.17 with SMTP id b17mr3497313wfg.142.1279060069468;
	Tue, 13 Jul 2010 15:27:49 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.224.36])
	by mx.google.com with ESMTPS id g37sm6348269rvb.17.2010.07.13.15.27.47
	(version=SSLv3 cipher=RC4-MD5); Tue, 13 Jul 2010 15:27:48 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Jul 2010 17:28:59 -0500
Message-Id: <1279060140-17856-2-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.1.1
In-Reply-To: <1279060140-17856-1-git-send-email-aalonso00@gmail.com>
References: <1279060140-17856-1-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/3 v2] xilinx-virtex5: new file
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
X-List-Received-Date: Tue, 13 Jul 2010 22:27:55 -0000

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
1.7.1.1



