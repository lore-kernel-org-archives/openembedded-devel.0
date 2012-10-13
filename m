Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1TN7sL-0003ET-Lj
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Oct 2012 21:59:58 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so3381027pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Oct 2012 12:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=9QTbTgxaPy6WLs4kJoKUfU+0npd1mI58n+UUkxs4mBg=;
	b=Na8UG5pZJ+Q0G4M9mheoA8T9Vi8jF0ae1oHaP2a6PRklXorYDSX/yjJk0iA0QLeuiy
	daME7ooZB2lxdVWlx5fhReKmxiL9RobT7Taow5jHKaKrWedfE25XpGcIsq4dWcOwPNTZ
	JcAEOwdyKDQ6fYL3BT/F1ul23DeVNfsW6Es0jMTIl15ur1Rq6oF1K8Q8A7CBr8nyazcc
	+MOwvn3spuvQqZxCzZGFpXMmAbZgPVe0Bo20legTFCXZX4lqcbxHfVrtfe18iAqkDBQU
	jabm7eTyHwTV0IeeWQvmMtlU1hm+1Ntif0oWHg+nN4RTDueBOecLkNXPsftjb3kOcTjX
	DNvg==
Received: by 10.68.132.41 with SMTP id or9mr24556709pbb.67.1350157603848;
	Sat, 13 Oct 2012 12:46:43 -0700 (PDT)
Received: from titan.du.ae ([94.205.106.220])
	by mx.google.com with ESMTPS id pw2sm6416726pbb.59.2012.10.13.12.46.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 13 Oct 2012 12:46:43 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Oct 2012 23:46:30 +0400
Message-Id: <1350157590-14336-2-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1350157590-14336-1-git-send-email-elvis.dowson@gmail.com>
References: <1350157590-14336-1-git-send-email-elvis.dowson@gmail.com>
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-zynq-balister 2/2] zynq-zc702: Refactor machine configuration.
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
X-List-Received-Date: Sat, 13 Oct 2012 19:59:58 -0000

This commit
* refactors the zynq-zc702 machine configuration
* adds u-boot to the generated rootfs

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 conf/machine/include/zynq-base.inc              |   21 +++++++++++++++++++++
 conf/machine/include/zynq-default-providers.inc |    4 ++++
 conf/machine/zynq-zc702.conf                    |   14 +++++---------
 3 files changed, 30 insertions(+), 9 deletions(-)
 create mode 100644 conf/machine/include/zynq-base.inc
 create mode 100644 conf/machine/include/zynq-default-providers.inc

diff --git a/conf/machine/include/zynq-base.inc b/conf/machine/include/zynq-base.inc
new file mode 100644
index 0000000..1b30a4d
--- /dev/null
+++ b/conf/machine/include/zynq-base.inc
@@ -0,0 +1,21 @@
+# Provides the Xilinx Zynq common settings
+
+include conf/machine/include/zynq-default-providers.inc
+
+# Add u-boot image to rootfs
+EXTRA_IMAGEDEPENDS = "u-boot-zynq"
+
+# Specify kernel image type
+KERNEL_IMAGETYPE = "uImage"
+
+# Specify machine features
+MACHINE_FEATURES = "apm vfat ethernet"
+
+# Ship kernel modules
+MACHINE_EXTRA_RRECOMMENDS = "kernel-modules"
+
+# Specify rootfs image filesystem types
+IMAGE_FSTYPES += "tar.gz"
+
+# Specify serial console settings
+SERIAL_CONSOLE = "115200 ttyPS0"
diff --git a/conf/machine/include/zynq-default-providers.inc b/conf/machine/include/zynq-default-providers.inc
new file mode 100644
index 0000000..10934c7
--- /dev/null
+++ b/conf/machine/include/zynq-default-providers.inc
@@ -0,0 +1,4 @@
+# Xilinx Zynq BSP default providers
+
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-zynq"
+PREFERRED_PROVIDER_u-boot ?= "u-boot-zynq"
diff --git a/conf/machine/zynq-zc702.conf b/conf/machine/zynq-zc702.conf
index 74a1271..09ef4a1 100644
--- a/conf/machine/zynq-zc702.conf
+++ b/conf/machine/zynq-zc702.conf
@@ -1,14 +1,10 @@
-include conf/machine/include/tune-cortexa9.inc
-
-PREFERRED_PROVIDER_virtual/kernel ?= "linux-zynq"
-
-MACHINE_FEATURES = "apm vfat ethernet"
+#@TYPE: Machine
+#@Name: Xilinx ZC702 FPGA Development Platform for the Zynq-7020 processor.
+#@DESCRIPTION: Machine configuration for the Xilinx ZC702 FPGA Development Platform.
 
-IMAGE_FSTYPES += "tar.gz"
-
-SERIAL_CONSOLE = "115200 ttyPS0"
+include conf/machine/include/zynq-base.inc
+include conf/machine/include/tune-cortexa9.inc
 
 UBOOT_MACHINE = "zynq_zc702_config"
 #UBOOT_ENTRYPOINT = "0x80008000"
 #UBOOT_LOADADDRESS = "0x80008000"
-
-- 
1.7.9.5



