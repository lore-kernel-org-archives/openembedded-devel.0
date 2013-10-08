Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id B6CA26CF67
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 23:41:00 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id f15so12565eak.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Oct 2013 16:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0jxubGSLUE7iB5tMGQGmlkS6vyA2cInpAbPxwxZXeO4=;
	b=sOUlSsZUb2vx9x2wQq5l2zFGWR10pKXHeTT+KKoxdT9/XM5UhOKuBZHpSNwOSN2jtH
	lK1V7PTZaabn8/gV2BIDh29k4ity01o4v9SsI2bOq1yGQJ0kGmvvp/kY8OGKk22JaLGk
	XSt0NhNTu4ud+JPzZ3KHg3C5w1MOIjLNRM2Fsy922n531ucmAa/X7OC62pBLimM0Ffqx
	bcGRDhP+CyiWGlfo4HuKoKqFjYx0sfWCRaTmIjuH7R3XyeYGJI8Xph8xqyW92SumyRsm
	kT1C5JOR/Udl6QzSNca9IZly6SDECKsh7E0tEzvJ8mkRbks79TQwc3xM1DDrB0FV4V1N
	2UMw==
X-Received: by 10.15.93.131 with SMTP id w3mr6337389eez.47.1381275662259;
	Tue, 08 Oct 2013 16:41:02 -0700 (PDT)
Received: from mizar.localdomain
	(host40-228-dynamic.1-79-r.retail.telecomitalia.it. [79.1.228.40])
	by mx.google.com with ESMTPSA id d8sm81475383eeh.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Oct 2013 16:41:01 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Oct 2013 01:40:53 +0200
Message-Id: <1381275653-25949-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1381275653-25949-1-git-send-email-andrea.adami@gmail.com>
References: <1381275653-25949-1-git-send-email-andrea.adami@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Subject: [meta-handheld][PATCH 3/3] linux-yocto_3.10: initial commit of h3600 defconfig
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Oct 2013 23:41:01 -0000

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.10/h3600/defconfig         | 72 ++++++++++++++++++++++
 recipes-kernel/linux/linux-yocto-handhelds.inc     |  6 ++
 recipes-kernel/linux/linux-yocto_3.10.bbappend     |  3 +-
 3 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/h3600/defconfig

diff --git a/recipes-kernel/linux/linux-yocto-3.10/h3600/defconfig b/recipes-kernel/linux/linux-yocto-3.10/h3600/defconfig
new file mode 100644
index 0000000..2b4adc5
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.10/h3600/defconfig
@@ -0,0 +1,72 @@
+CONFIG_SYSVIPC=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_MODULES=y
+# CONFIG_LBDAF is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_ARCH_SA1100=y
+CONFIG_SA1100_H3600=y
+CONFIG_PCCARD=y
+CONFIG_PCMCIA_SA1100=y
+CONFIG_PREEMPT=y
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+# CONFIG_CPU_FREQ_STAT is not set
+CONFIG_FPE_NWFPE=y
+CONFIG_NET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_IPV6 is not set
+CONFIG_IRDA=m
+CONFIG_IRLAN=m
+CONFIG_IRNET=m
+CONFIG_IRCOMM=m
+# CONFIG_WIRELESS is not set
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_MTD=y
+CONFIG_MTD_REDBOOT_PARTS=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_CFI=y
+CONFIG_MTD_CFI_ADV_OPTIONS=y
+CONFIG_MTD_CFI_GEOMETRY=y
+# CONFIG_MTD_CFI_I1 is not set
+CONFIG_MTD_CFI_INTELEXT=y
+CONFIG_MTD_SA1100=y
+CONFIG_BLK_DEV_LOOP=m
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_SIZE=8192
+CONFIG_IDE=y
+CONFIG_BLK_DEV_IDECS=y
+CONFIG_NETDEVICES=y
+CONFIG_PCMCIA_PCNET=y
+CONFIG_PPP=m
+CONFIG_PPP_BSDCOMP=m
+CONFIG_PPP_DEFLATE=m
+CONFIG_PPP_ASYNC=m
+# CONFIG_WLAN is not set
+# CONFIG_KEYBOARD_ATKBD is not set
+CONFIG_KEYBOARD_GPIO=y
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+CONFIG_SERIAL_SA1100=y
+CONFIG_SERIAL_SA1100_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+# CONFIG_HWMON is not set
+CONFIG_FB=y
+CONFIG_FB_SA1100=y
+# CONFIG_USB_SUPPORT is not set
+CONFIG_EXT2_FS=y
+CONFIG_MSDOS_FS=m
+CONFIG_VFAT_FS=m
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_SUMMARY=y
+CONFIG_JFFS2_COMPRESSION_OPTIONS=y
+CONFIG_JFFS2_LZO=y
+CONFIG_CRAMFS=m
+CONFIG_NFS_FS=y
+CONFIG_NFSD=m
+CONFIG_NLS=y
diff --git a/recipes-kernel/linux/linux-yocto-handhelds.inc b/recipes-kernel/linux/linux-yocto-handhelds.inc
index 119086f..90026ee 100644
--- a/recipes-kernel/linux/linux-yocto-handhelds.inc
+++ b/recipes-kernel/linux/linux-yocto-handhelds.inc
@@ -1,6 +1,7 @@
 KMACHINE_akita = "akita"
 KMACHINE_c7x0 = "c7x0"
 KMACHINE_collie = "collie"
+KMACHINE_h3600 = "h3600"
 KMACHINE_poodle = "poodle"
 KMACHINE_spitz = "spitz"
 KMACHINE_tosa = "tosa"
@@ -20,6 +21,11 @@ SRC_URI_append_collie = " \
            file://qvga/logo_linux_clut224.ppm.bz2 \
            "
 
+SRC_URI_append_h3600 = " \
+           file://defconfig \
+           file://qvga/logo_linux_clut224.ppm.bz2 \
+           "
+
 SRC_URI_append_poodle = " \
            file://feature-top.scc \
            file://qvga/logo_linux_clut224.ppm.bz2 \
diff --git a/recipes-kernel/linux/linux-yocto_3.10.bbappend b/recipes-kernel/linux/linux-yocto_3.10.bbappend
index 537bf37..12810ba 100644
--- a/recipes-kernel/linux/linux-yocto_3.10.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.10.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.10:${THISDIR}/${PN}:${THISDIR}/files:"
 
-COMPATIBLE_MACHINE .= "|akita|c7x0|collie|poodle|spitz|tosa"
+COMPATIBLE_MACHINE .= "|akita|c7x0|collie|h3600|poodle|spitz|tosa"
 
 # Override kernel features
 #KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
@@ -8,6 +8,7 @@ COMPATIBLE_MACHINE .= "|akita|c7x0|collie|poodle|spitz|tosa"
 KERNEL_EXTRA_FEATURES_akita ?= ""
 KERNEL_EXTRA_FEATURES_c7x0 ?= ""
 KERNEL_EXTRA_FEATURES_collie ?= ""
+KERNEL_EXTRA_FEATURES_h3600 ?= ""
 KERNEL_EXTRA_FEATURES_poodle ?= ""
 KERNEL_EXTRA_FEATURES_spitz ?= ""
 KERNEL_EXTRA_FEATURES_tosa ?= ""
-- 
1.8.1.5


