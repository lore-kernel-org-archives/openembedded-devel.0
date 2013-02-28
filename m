Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1UBDcC-00043s-Vq
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Mar 2013 01:14:21 +0100
Received: by mail-ee0-f45.google.com with SMTP id b57so1909220eek.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2013 15:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=5axkIaneIQdO5zq7fQRnwR6R7kVXLELvjUrF/zKofgo=;
	b=TGLiDjMReo4qt+JseRYvIACsWXMIkwnJsktxr3ytkrTE2GerwaJ2G1cIS6seny5ZMC
	g5kIRSQQURTGw86z4B8fuUx3AQQdMZZuTNVK/IjSv5owtSQaILFPNv2yxiDaLvr6tMUP
	ES9fNXiirauSxogiYnJJf/OGi4/elpujnEphn9JwUuxTKt31U+cC2Ozddby9babvdR7Q
	AgjlZ6dm4WO7MrWy764s02RErqWuBk5Y4Rm8+7aUPQtLr4DtKu0r5MVBFu+QNdoQBSZQ
	xCknIfmEe4MgulU/UAIlk2RQSS0/jCGdONBhvH62uYC68TsItwhULs5gLuOAcBJkYlVr
	v6+w==
X-Received: by 10.14.210.8 with SMTP id t8mr21719393eeo.35.1362095878006;
	Thu, 28 Feb 2013 15:57:58 -0800 (PST)
Received: from mizar.localdomain
	(host223-35-dynamic.252-95-r.retail.telecomitalia.it.
	[95.252.35.223])
	by mx.google.com with ESMTPS id f47sm14308586eep.13.2013.02.28.15.57.56
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Feb 2013 15:57:57 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Mar 2013 00:57:51 +0100
Message-Id: <1362095872-4586-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.12.4
Subject: [meta-handheld][PATCH] linux-yocto(-tiny-kexecboot)_3.2: Zaurus collie MTD fixes
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
X-List-Received-Date: Fri, 01 Mar 2013 00:14:23 -0000

* experimental patches to fix mtd partitions detection
* kexecboot now finds cramfs
* mount of orig. cramfs partition tested for fun :)
* collie's NOR is still READ-ONLY on boot
*
* while there, add a patch to mcp.h to fix
* collie_battery.c compilation

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.2/collie/collie-eraseinfo.patch     | 11 +++++++++++
 .../linux/linux-yocto-3.2/collie/collie-jedec-probe.patch   | 11 +++++++++++
 .../linux/linux-yocto-3.2/collie/collie-mtd-rw.patch        | 12 ++++++++++++
 recipes-kernel/linux/linux-yocto-3.2/collie/collie.cfg      |  2 +-
 .../linux/linux-yocto-3.2/collie/mcp-device.patch           | 13 +++++++++++++
 .../collie/collie-eraseinfo.patch                           | 11 +++++++++++
 .../collie/collie-jedec-probe.patch                         | 11 +++++++++++
 .../collie/collie-mtd-rw.patch                              | 12 ++++++++++++
 .../linux-yocto-tiny-kexecboot-3.2/collie/mcp-device.patch  | 13 +++++++++++++
 .../linux/linux-yocto-tiny-kexecboot_3.2.bbappend           |  6 +++++-
 recipes-kernel/linux/linux-yocto_3.2.bbappend               |  4 ++++
 11 files changed, 104 insertions(+), 2 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-yocto-3.2/collie/collie-eraseinfo.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.2/collie/collie-jedec-probe.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.2/collie/collie-mtd-rw.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.2/collie/mcp-device.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-eraseinfo.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-jedec-probe.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-mtd-rw.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/mcp-device.patch

diff --git a/recipes-kernel/linux/linux-yocto-3.2/collie/collie-eraseinfo.patch b/recipes-kernel/linux/linux-yocto-3.2/collie/collie-eraseinfo.patch
new file mode 100644
index 0000000..47e814d
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.2/collie/collie-eraseinfo.patch
@@ -0,0 +1,11 @@
+--- a/drivers/mtd/chips/jedec_probe.c
++++ b/drivers/mtd/chips/jedec_probe.c
+@@ -1305,7 +1305,7 @@
+ 		.cmd_set	= P_ID_INTEL_STD,
+ 		.nr_regions	= 1,
+ 		.regions	= {
+-			ERASEINFO(0x40000,16),
++			ERASEINFO(0x08000,128),
+ 		}
+ 	}, {
+ 		.mfr_id		= CFI_MFR_SST,
diff --git a/recipes-kernel/linux/linux-yocto-3.2/collie/collie-jedec-probe.patch b/recipes-kernel/linux/linux-yocto-3.2/collie/collie-jedec-probe.patch
new file mode 100644
index 0000000..530643e
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.2/collie/collie-jedec-probe.patch
@@ -0,0 +1,11 @@
+--- a/arch/arm/mach-sa1100/collie.c
++++ b/arch/arm/mach-sa1100/collie.c
+@@ -289,7 +289,7 @@
+ }
+ 
+ static struct flash_platform_data collie_flash_data = {
+-	.map_name	= "cfi_probe",
++	.map_name	= "jedec_probe",
+ 	.init		= collie_flash_init,
+ 	.set_vpp	= collie_set_vpp,
+ 	.exit		= collie_flash_exit,
diff --git a/recipes-kernel/linux/linux-yocto-3.2/collie/collie-mtd-rw.patch b/recipes-kernel/linux/linux-yocto-3.2/collie/collie-mtd-rw.patch
new file mode 100644
index 0000000..193004d
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.2/collie/collie-mtd-rw.patch
@@ -0,0 +1,12 @@
+diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-flash.c
+index fa9c0a9..bf6b04f 100644
+--- a/drivers/mtd/maps/sa1100-flash.c
++++ b/drivers/mtd/maps/sa1100-flash.c
+@@ -206,6 +206,7 @@ static int sa1100_probe_subdev(struct sa_subdev_info *subdev, struct resource *r
+ 		goto err;
+ 	}
+ 	subdev->mtd->owner = THIS_MODULE;
++	subdev->mtd->unlock(subdev->mtd, 0xc0000, subdev->mtd->size - 0xc0000);
+ 
+ 	printk(KERN_INFO "SA1100 flash: CFI device at 0x%08lx, %uMiB, %d-bit\n",
+ 		phys, (unsigned)(subdev->mtd->size >> 20),
diff --git a/recipes-kernel/linux/linux-yocto-3.2/collie/collie.cfg b/recipes-kernel/linux/linux-yocto-3.2/collie/collie.cfg
index 2f5ead7..a47461e 100644
--- a/recipes-kernel/linux/linux-yocto-3.2/collie/collie.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.2/collie/collie.cfg
@@ -1473,7 +1473,7 @@ CONFIG_APM_POWER=y
 # CONFIG_TEST_POWER is not set
 # CONFIG_BATTERY_DS2780 is not set
 # CONFIG_BATTERY_DS2782 is not set
-# CONFIG_BATTERY_COLLIE is not set
+CONFIG_BATTERY_COLLIE=y
 # CONFIG_BATTERY_BQ20Z75 is not set
 # CONFIG_BATTERY_BQ27x00 is not set
 # CONFIG_BATTERY_MAX17040 is not set
diff --git a/recipes-kernel/linux/linux-yocto-3.2/collie/mcp-device.patch b/recipes-kernel/linux/linux-yocto-3.2/collie/mcp-device.patch
new file mode 100644
index 0000000..9a0a8ba
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.2/collie/mcp-device.patch
@@ -0,0 +1,13 @@
+--- a/include/linux/mfd/mcp.h	2013-02-18 00:14:09.000000000 +0100
++++ b/include/linux/mfd/mcp.h	2013-02-17 23:55:52.000000000 +0100
+@@ -10,6 +10,8 @@
+ #ifndef MCP_H
+ #define MCP_H
+ 
++#include <linux/device.h>
++
+ struct mcp_ops;
+ 
+ struct mcp {
+
+
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-eraseinfo.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-eraseinfo.patch
new file mode 100644
index 0000000..47e814d
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-eraseinfo.patch
@@ -0,0 +1,11 @@
+--- a/drivers/mtd/chips/jedec_probe.c
++++ b/drivers/mtd/chips/jedec_probe.c
+@@ -1305,7 +1305,7 @@
+ 		.cmd_set	= P_ID_INTEL_STD,
+ 		.nr_regions	= 1,
+ 		.regions	= {
+-			ERASEINFO(0x40000,16),
++			ERASEINFO(0x08000,128),
+ 		}
+ 	}, {
+ 		.mfr_id		= CFI_MFR_SST,
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-jedec-probe.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-jedec-probe.patch
new file mode 100644
index 0000000..530643e
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-jedec-probe.patch
@@ -0,0 +1,11 @@
+--- a/arch/arm/mach-sa1100/collie.c
++++ b/arch/arm/mach-sa1100/collie.c
+@@ -289,7 +289,7 @@
+ }
+ 
+ static struct flash_platform_data collie_flash_data = {
+-	.map_name	= "cfi_probe",
++	.map_name	= "jedec_probe",
+ 	.init		= collie_flash_init,
+ 	.set_vpp	= collie_set_vpp,
+ 	.exit		= collie_flash_exit,
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-mtd-rw.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-mtd-rw.patch
new file mode 100644
index 0000000..193004d
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-mtd-rw.patch
@@ -0,0 +1,12 @@
+diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-flash.c
+index fa9c0a9..bf6b04f 100644
+--- a/drivers/mtd/maps/sa1100-flash.c
++++ b/drivers/mtd/maps/sa1100-flash.c
+@@ -206,6 +206,7 @@ static int sa1100_probe_subdev(struct sa_subdev_info *subdev, struct resource *r
+ 		goto err;
+ 	}
+ 	subdev->mtd->owner = THIS_MODULE;
++	subdev->mtd->unlock(subdev->mtd, 0xc0000, subdev->mtd->size - 0xc0000);
+ 
+ 	printk(KERN_INFO "SA1100 flash: CFI device at 0x%08lx, %uMiB, %d-bit\n",
+ 		phys, (unsigned)(subdev->mtd->size >> 20),
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/mcp-device.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/mcp-device.patch
new file mode 100644
index 0000000..9a0a8ba
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/mcp-device.patch
@@ -0,0 +1,13 @@
+--- a/include/linux/mfd/mcp.h	2013-02-18 00:14:09.000000000 +0100
++++ b/include/linux/mfd/mcp.h	2013-02-17 23:55:52.000000000 +0100
+@@ -10,6 +10,8 @@
+ #ifndef MCP_H
+ #define MCP_H
+ 
++#include <linux/device.h>
++
+ struct mcp_ops;
+ 
+ struct mcp {
+
+
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.2.bbappend b/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.2.bbappend
index 6ab9f2f..7f03732 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.2.bbappend
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.2.bbappend
@@ -34,12 +34,16 @@ SRC_URI_append_c7x0 = " \
 SRC_URI_append_collie = " \
            file://collie-tiny.scc \
            file://collie-kexecboot.cfg \
-           file://qvga/logo_linux_clut224.ppm.bz2 \
            file://0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch \
            file://locomo_kbd_tweak-r2.patch \
            file://collie_remove_irq_to_gpio.patch \
+           file://mcp-device.patch \
+           file://collie-jedec-probe.patch \
+           file://collie-eraseinfo.patch \
+           file://qvga/logo_linux_clut224.ppm.bz2 \
            file://revert-check-on-console-device.patch \
            "
+#           file://collie-mtd-rw.patch
 
 SRC_URI_append_poodle = " \
            file://poodle-tiny.scc \
diff --git a/recipes-kernel/linux/linux-yocto_3.2.bbappend b/recipes-kernel/linux/linux-yocto_3.2.bbappend
index a4ff596..6b765d5 100644
--- a/recipes-kernel/linux/linux-yocto_3.2.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.2.bbappend
@@ -27,8 +27,12 @@ SRC_URI_append_collie = " \
            file://qvga/logo_linux_clut224.ppm.bz2 \
            file://0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch \
            file://collie_remove_irq_to_gpio.patch \
+           file://mcp-device.patch \
+           file://collie-jedec-probe.patch \
+           file://collie-eraseinfo.patch \
            file://locomo_kbd_tweak-r2.patch \
            "
+#           file://collie-mtd-rw.patch
 
 SRC_URI_append_poodle = " \
            file://poodle-standard.scc \
-- 
1.7.12.4



