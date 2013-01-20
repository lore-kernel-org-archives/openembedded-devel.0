Received: from mail-ee0-f51.google.com ([74.125.83.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Tx3MI-0003yc-Eg
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jan 2013 23:27:33 +0100
Received: by mail-ee0-f51.google.com with SMTP id d17so2534933eek.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jan 2013 14:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=VIXC3p899nyG62xrrPg7P6XOAVf6sZzc6zIRXdV0BSM=;
	b=mMSxaI+Sw2Icomgy059YhHu26xInJkimLH942W/fM0Habx1VcoL70rrdCgkjjsuuYw
	T91vbn/ghI8jTW1ow/RFXcmM/QMG2jCzwlHe8mPJQ4Gj0vtGBjk7TaBiFDUJltsvs3jw
	mZGeHYK4JtRey+SJ7t9rMDGxbXZAUQSUCbRXkOQVVUXwj03nG3vVLs0KS9TzB5HHz2vF
	UjvRU0RalhW/qFVe2zI3fjwTlplwOabnoi1LJqQFxeFJFzYWLEUs2LjSETou22L2HkPx
	CWQiXZOZg/xTjuqD+qsOcx21D+nM3oezH0Zwpbkb3w9EKu5pJ4IAhg1h3Z9PHV+B7Ind
	0/cg==
X-Received: by 10.14.173.69 with SMTP id u45mr53232622eel.21.1358719914921;
	Sun, 20 Jan 2013 14:11:54 -0800 (PST)
Received: from mizar.localdomain
	(host170-248-dynamic.5-87-r.retail.telecomitalia.it. [87.5.248.170])
	by mx.google.com with ESMTPS id w44sm19450405eep.6.2013.01.20.14.11.53
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 20 Jan 2013 14:11:54 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jan 2013 23:11:31 +0100
Message-Id: <8cbbf95af74e99d19d1b0b48bd94ff73dc1e6746.1358719629.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1358719629.git.andrea.adami@gmail.com>
References: <cover.1358719629.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1358719629.git.andrea.adami@gmail.com>
References: <cover.1358719629.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 5/5] linux-yocto_3.4: minor config cleanings towards 3.8
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
X-List-Received-Date: Sun, 20 Jan 2013 22:27:43 -0000

* fix lack of some mtd options needed by collie
* remove union_fs
* some options are now detected as non-hardware: move them
* still WIP

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.4/collie/collie.cfg           | 19 ++++++++++++++-----
 .../linux/linux-yocto-3.4/zaurus-hardware.cfg         |  9 ++++++---
 .../linux/linux-yocto-3.4/zaurus-non-hardware.cfg     |  9 ++++++++-
 .../linux/linux-yocto-3.4/zaurus-pxa-common.cfg       | 10 ----------
 4 files changed, 28 insertions(+), 19 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto-3.4/collie/collie.cfg b/recipes-kernel/linux/linux-yocto-3.4/collie/collie.cfg
index 5c0a7bf..791c966 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/collie/collie.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/collie/collie.cfg
@@ -1,9 +1,4 @@
 #
-# General setup
-#
-CONFIG_KERNEL_LZMA=y
-
-#
 # System Type
 #
 CONFIG_ARCH_SA1100=y
@@ -35,6 +30,20 @@ CONFIG_SPARSEMEM_EXTREME=y
 CONFIG_CMDLINE="console=ttySA0,115200n8 console=tty1 mem=64M fbcon=rotate:1 loglevel=3"
 
 #
+# RAM/ROM/Flash chip drivers
+#
+CONFIG_MTD_CFI=y
+CONFIG_MTD_JEDECPROBE=y
+CONFIG_MTD_GEN_PROBE=y
+CONFIG_MTD_CFI_INTELEXT=y
+CONFIG_MTD_CFI_UTIL=y
+
+#
+# Mapping drivers for chip access
+#
+CONFIG_MTD_SA1100=y
+
+#
 # Multimedia Capabilities Port drivers
 #
 CONFIG_MCP=y
diff --git a/recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg b/recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg
index 1336bf0..ae3627a 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg
@@ -1,14 +1,11 @@
 CONFIG_ARM=y
 CONFIG_SYS_SUPPORTS_APM_EMULATION=y
 CONFIG_GENERIC_GPIO=y
-CONFIG_KTIME_SCALAR=y
 CONFIG_HAVE_PROC_CPU=y
 CONFIG_STACKTRACE_SUPPORT=y
 CONFIG_HAVE_LATENCYTOP_SUPPORT=y
 CONFIG_LOCKDEP_SUPPORT=y
 CONFIG_TRACE_IRQFLAGS_SUPPORT=y
-CONFIG_HARDIRQS_SW_RESEND=y
-CONFIG_GENERIC_IRQ_PROBE=y
 CONFIG_RWSEM_GENERIC_SPINLOCK=y
 CONFIG_ARCH_HAS_CPUFREQ=y
 CONFIG_ARCH_HAS_CPU_IDLE_WAIT=y
@@ -156,6 +153,12 @@ CONFIG_SENSORS_MAX1111=y
 CONFIG_SSB_POSSIBLE=y
 
 #
+# Multimedia Capabilities Port drivers
+#
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_DUMMY=y
+
+#
 # Graphics support
 #
 CONFIG_FB=y
diff --git a/recipes-kernel/linux/linux-yocto-3.4/zaurus-non-hardware.cfg b/recipes-kernel/linux/linux-yocto-3.4/zaurus-non-hardware.cfg
index 1fced91..d76d794 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/zaurus-non-hardware.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/zaurus-non-hardware.cfg
@@ -1,3 +1,11 @@
+CONFIG_KERNEL_LZMA=y
+CONFIG_HARDIRQS_SW_RESEND=y
+CONFIG_GENERIC_IRQ_PROBE=y
+#
+# General setup
+#
+CONFIG_KTIME_SCALAR=y
+
 CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
 CONFIG_HAVE_IRQ_WORK=y
 CONFIG_IRQ_WORK=y
@@ -320,7 +328,6 @@ CONFIG_PROC_PAGE_MONITOR=y
 CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_TMPFS_XATTR=y
 CONFIG_MISC_FILESYSTEMS=y
-CONFIG_UNION_FS=y
 CONFIG_JFFS2_FS=y
 CONFIG_JFFS2_FS_DEBUG=0
 CONFIG_JFFS2_FS_WRITEBUFFER=y
diff --git a/recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-common.cfg b/recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-common.cfg
index 78d0e17..dace6fd 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-common.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-common.cfg
@@ -62,16 +62,6 @@ CONFIG_AUTO_ZRELADDR=y
 CONFIG_PXA_FICP=m
 
 #
-# RAM/ROM/Flash chip drivers
-#
-CONFIG_MTD_MAP_BANK_WIDTH_1=y
-CONFIG_MTD_MAP_BANK_WIDTH_2=y
-CONFIG_MTD_MAP_BANK_WIDTH_4=y
-CONFIG_MTD_CFI_I1=y
-CONFIG_MTD_CFI_I2=y
-CONFIG_MTD_ROM=y
-
-#
 # PATA SFF controllers with BMDMA
 #
 CONFIG_PATA_PXA=y
-- 
1.7.12.4



