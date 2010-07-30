Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1Oerhb-0000pe-LA
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 17:40:53 +0200
Received: by wwb34 with SMTP id 34so22897wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 08:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=RaD6AB5WsjWWcRmqrFezIO4uUd/vbNIughcfwrBxu9s=;
	b=Gay3qi3iuj8X90HmcYKnL19pn1ur+EzQeU/Ngz8LmZmw3ls/EmlARrQltTiupkToyO
	K0M6Z24dT1X6AQVxTnJWQ87+3BheeR4q+gUUB2gDj1k65KXfio5YaTTQaJBOxs0G95lm
	pGxiW2GoR0Cway5E2X642wTFCXR6BkrZA/rNc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=PvDRp782PCsxdi2034zicHo3wmaLUeCQ3nJV7CSRt4BX4dUs3UyqEB7vB57jZvi8YN
	k62i1ir5bOuzAalrwVs1zGpr5QxE7/jub/8XXees8na/EhpPbC6mndtud+/9DQwO9Bsv
	2/BkJwL0KqvGXfkb4q6cmQAfuN3I7daTFlgwQ=
Received: by 10.227.141.84 with SMTP id l20mr1922084wbu.119.1280504430679;
	Fri, 30 Jul 2010 08:40:30 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.218.190])
	by mx.google.com with ESMTPS id h3sm2015014wbb.15.2010.07.30.08.40.28
	(version=SSLv3 cipher=RC4-MD5); Fri, 30 Jul 2010 08:40:30 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jul 2010 10:42:27 -0500
Message-Id: <1280504555-3633-2-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <openembedded-devel@lists.openembedded.org>
References: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 02/10] xilinx-virtex4: new file
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
X-List-Received-Date: Fri, 30 Jul 2010 15:40:53 -0000

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
1.7.2



