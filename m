Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1Q4zqY-0004wl-5A
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Mar 2011 20:10:22 +0200
Received: by yxn22 with SMTP id 22so644107yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2011 11:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=XqjEnGH9o68VoWh7Q5Vkb3jv7aBCniunWY6NiaWeVqU=;
	b=r4XshcGEcx2tlMo4cx5Te7H8VnyWRMaNTTvvV+cOdVGkngNnOg8+Of76lbA7/AgHji
	LBRMDduatN6ZncYEDBSMtPfyS42BgRvXiK1zdIna54XG+7M/r9+uIMTvK7GR+Fi7ivt7
	7LN5ex9VPHIYPtN6px0y1MZPhlWibsBROlJuU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=w/CgM6kTJVPz1GruESgJruMT2S0pbxa2CISF1C7krQancZtpu3uHqGk+UGYW14rhCg
	JnvR4QJiJmZC8dD+0MtLDhUasizvf21Dd6kZAPBkkMoEWAOb51QVFCtoPJaQOUUDic1X
	6K8v/GgpvfDLuH0JK7JLyeo5ng3YQKBiut6r0=
Received: by 10.101.193.1 with SMTP id v1mr1134866anp.143.1301508502535;
	Wed, 30 Mar 2011 11:08:22 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id x32sm301049ana.38.2011.03.30.11.08.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Mar 2011 11:08:17 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Mar 2011 13:08:06 -0500
Message-Id: <1301508491-3062-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 1/6] ti814x: Add new machine definitions
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
X-List-Received-Date: Wed, 30 Mar 2011 18:10:22 -0000

* Add new am387x-evm machine definition
* Add new dm814xx-evm machine definition
* Add new c6a814x-evm machine definition
* New SOC_FAMILY ti814x available
* Based on machine configuration files from Arago contributed
  by Siddharth Heroor

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 conf/machine/am387x-evm.conf    |    5 +++++
 conf/machine/c6a814x-evm.conf   |    5 +++++
 conf/machine/dm814x-evm.conf    |    5 +++++
 conf/machine/include/ti814x.inc |   26 ++++++++++++++++++++++++++
 4 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/am387x-evm.conf
 create mode 100644 conf/machine/c6a814x-evm.conf
 create mode 100644 conf/machine/dm814x-evm.conf
 create mode 100644 conf/machine/include/ti814x.inc

diff --git a/conf/machine/am387x-evm.conf b/conf/machine/am387x-evm.conf
new file mode 100644
index 0000000..ebf9889
--- /dev/null
+++ b/conf/machine/am387x-evm.conf
@@ -0,0 +1,5 @@
+#@TYPE: Machine
+#@NAME: AM389x evm
+#@DESCRIPTION: Machine configuration for the AM389x evm
+
+require conf/machine/include/ti814x.inc
diff --git a/conf/machine/c6a814x-evm.conf b/conf/machine/c6a814x-evm.conf
new file mode 100644
index 0000000..b85c489
--- /dev/null
+++ b/conf/machine/c6a814x-evm.conf
@@ -0,0 +1,5 @@
+#@TYPE: Machine
+#@NAME: c6a814x evm
+#@DESCRIPTION: Machine configuration for the c6a814x evm
+
+require conf/machine/include/ti814x.inc
diff --git a/conf/machine/dm814x-evm.conf b/conf/machine/dm814x-evm.conf
new file mode 100644
index 0000000..140dcc1
--- /dev/null
+++ b/conf/machine/dm814x-evm.conf
@@ -0,0 +1,5 @@
+#@TYPE: Machine
+#@NAME: DM814x evm
+#@DESCRIPTION: Machine configuration for the DM814x evm
+
+require conf/machine/include/ti814x.inc
diff --git a/conf/machine/include/ti814x.inc b/conf/machine/include/ti814x.inc
new file mode 100644
index 0000000..8fa7ee9
--- /dev/null
+++ b/conf/machine/include/ti814x.inc
@@ -0,0 +1,26 @@
+TARGET_ARCH = "arm"
+SOC_FAMILY = "ti814x"
+
+require conf/machine/include/tune-cortexa8.inc
+
+PREFERRED_PROVIDER_virtual/kernel = "linux-omap3"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
+
+# Increase this everytime you change something in the kernel
+MACHINE_KERNEL_PR = "r1"
+
+KERNEL_IMAGETYPE = "uImage"
+
+UBOOT_ARCH = "arm"
+UBOOT_MACHINE = "ti8148_evm_config_nand"
+UBOOT_ENTRYPOINT = "0x80008000"
+UBOOT_LOADADDRESS = "0x80008000"
+
+# Only build u-boot
+EXTRA_IMAGEDEPENDS += "u-boot"
+
+# Ship all kernel modules
+IMAGE_FSTYPES ?= "jffs2 tar.bz2"
+EXTRA_IMAGECMD_jffs2 = "-lqn -e 128"
+SERIAL_CONSOLE = "115200 ttyO0"
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 ethernet"
-- 
1.7.0.4



