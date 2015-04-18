Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id C633F7226D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Apr 2015 21:11:57 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so12698111wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Apr 2015 14:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=51OMwO6QQZ7mIz8ppUaSezOdBrxxv4pSCXmYfpFgi+E=;
	b=EW6ANKDmJxphy4VUrLnxcb25trLgC4sGaL6FyVOuXC6VWxEwDRm1D3JsxqlJn/CUAS
	iiF3eauiImrkV8VG8yH8Fzh7stFeMnFNBsz7KG6FjEKDbnV19B2dsSJzsrg4jLUPNvZp
	WUxrnYx6CVZDMj4JOBIQ2AzH50w2Mo4DGTBMssoi+CDpTtaQd9I1Fx9wVnyI9Y06obi8
	vocj+6NXfAIYuhYXcNx8yz4UdJjnXU0AcyaRxtUJDO93JpKkw7zxb4AM5al//BtbILEZ
	TZwguaCBYoFvC4orbzsGj6SUiEH314P4xZ+xRe0T1c0FkAFNP1QPWsxh3KnBGIUqJY1+
	Bu4w==
X-Received: by 10.180.80.105 with SMTP id q9mr12769241wix.52.1429391518403;
	Sat, 18 Apr 2015 14:11:58 -0700 (PDT)
Received: from T520.homenet.telecomitalia.it
	(host231-254-dynamic.11-79-r.retail.telecomitalia.it.
	[79.11.254.231]) by mx.google.com with ESMTPSA id
	hj10sm20404112wjc.48.2015.04.18.14.11.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 18 Apr 2015 14:11:57 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Apr 2015 23:11:50 +0200
Message-Id: <1429391510-17868-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-handheld][PATCH] linux-gcw0(-kexecboot): upgrade from 3.19 to 4.0 dev release
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
X-List-Received-Date: Sat, 18 Apr 2015 21:12:01 -0000

following upstream progress

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/{linux-gcw0-3.19 => linux-gcw0-4.0}/gcw0/defconfig     | 9 +++++----
 .../gcw0/defconfig                                               | 9 ++++++---
 ...{linux-gcw0-kexecboot_3.19.bb => linux-gcw0-kexecboot_4.0.bb} | 2 +-
 recipes-kernel/linux/{linux-gcw0_3.19.bb => linux-gcw0_4.0.bb}   | 4 ++--
 4 files changed, 14 insertions(+), 10 deletions(-)
 rename recipes-kernel/linux/{linux-gcw0-3.19 => linux-gcw0-4.0}/gcw0/defconfig (97%)
 rename recipes-kernel/linux/{linux-gcw0-kexecboot-3.19 => linux-gcw0-kexecboot-4.0}/gcw0/defconfig (97%)
 rename recipes-kernel/linux/{linux-gcw0-kexecboot_3.19.bb => linux-gcw0-kexecboot_4.0.bb} (94%)
 rename recipes-kernel/linux/{linux-gcw0_3.19.bb => linux-gcw0_4.0.bb} (69%)

diff --git a/recipes-kernel/linux/linux-gcw0-3.19/gcw0/defconfig b/recipes-kernel/linux/linux-gcw0-4.0/gcw0/defconfig
similarity index 97%
rename from recipes-kernel/linux/linux-gcw0-3.19/gcw0/defconfig
rename to recipes-kernel/linux/linux-gcw0-4.0/gcw0/defconfig
index e605822..97a9fc6 100644
--- a/recipes-kernel/linux/linux-gcw0-3.19/gcw0/defconfig
+++ b/recipes-kernel/linux/linux-gcw0-4.0/gcw0/defconfig
@@ -1,17 +1,16 @@
-CONFIG_MACH_JZ4770=y
+CONFIG_MACH_INGENIC=y
+CONFIG_JZ4770_GCW0=y
 CONFIG_HIGHMEM=y
 # CONFIG_COMPACTION is not set
 # CONFIG_BOUNCE is not set
 CONFIG_PREEMPT_VOLUNTARY=y
 CONFIG_KEXEC=y
 # CONFIG_SECCOMP is not set
-CONFIG_LOCALVERSION="-dingux"
+CONFIG_LOCALVERSION="-yocto-standard"
 # CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_DEFAULT_HOSTNAME="gcw-zero"
 # CONFIG_CROSS_MEMORY_ATTACH is not set
 # CONFIG_USELIB is not set
 CONFIG_NO_HZ_IDLE=y
-# CONFIG_INIT_FALLBACK is not set
 # CONFIG_SGETMASK_SYSCALL is not set
 # CONFIG_SYSFS_SYSCALL is not set
 CONFIG_EMBEDDED=y
@@ -145,6 +144,8 @@ CONFIG_BACKLIGHT_PWM=y
 CONFIG_PANEL_NT39016=y
 CONFIG_GPU_VIVANTE_V4=y
 # CONFIG_VGA_CONSOLE is not set
+CONFIG_DUMMY_CONSOLE_COLUMNS=53
+CONFIG_DUMMY_CONSOLE_ROWS=24
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
diff --git a/recipes-kernel/linux/linux-gcw0-kexecboot-3.19/gcw0/defconfig b/recipes-kernel/linux/linux-gcw0-kexecboot-4.0/gcw0/defconfig
similarity index 97%
rename from recipes-kernel/linux/linux-gcw0-kexecboot-3.19/gcw0/defconfig
rename to recipes-kernel/linux/linux-gcw0-kexecboot-4.0/gcw0/defconfig
index 259bcc9..2e976b4 100644
--- a/recipes-kernel/linux/linux-gcw0-kexecboot-3.19/gcw0/defconfig
+++ b/recipes-kernel/linux/linux-gcw0-kexecboot-4.0/gcw0/defconfig
@@ -1,12 +1,13 @@
-CONFIG_MACH_JZ4770=y
+CONFIG_MACH_INGENIC=y
+CONFIG_JZ4770_GCW0=y
 CONFIG_HIGHMEM=y
 # CONFIG_COMPACTION is not set
 # CONFIG_BOUNCE is not set
 CONFIG_PREEMPT_VOLUNTARY=y
 CONFIG_KEXEC=y
 # CONFIG_SECCOMP is not set
+CONFIG_LOCALVERSION="-yocto-standard"
 # CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_DEFAULT_HOSTNAME="gcw-zero"
 # CONFIG_CROSS_MEMORY_ATTACH is not set
 # CONFIG_USELIB is not set
 CONFIG_NO_HZ_IDLE=y
@@ -17,7 +18,6 @@ CONFIG_INITRAMFS_SOURCE="initramfs.cpio.gz"
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
-# CONFIG_INIT_FALLBACK is not set
 # CONFIG_SGETMASK_SYSCALL is not set
 # CONFIG_SYSFS_SYSCALL is not set
 CONFIG_EMBEDDED=y
@@ -151,6 +151,8 @@ CONFIG_BACKLIGHT_PWM=y
 CONFIG_PANEL_NT39016=y
 CONFIG_GPU_VIVANTE_V4=y
 # CONFIG_VGA_CONSOLE is not set
+CONFIG_DUMMY_CONSOLE_COLUMNS=53
+CONFIG_DUMMY_CONSOLE_ROWS=24
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
@@ -195,6 +197,7 @@ CONFIG_PWM=y
 CONFIG_PWM_JZ4740=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
+CONFIG_EXT3_FS=y
 CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
 CONFIG_MSDOS_FS=y
diff --git a/recipes-kernel/linux/linux-gcw0-kexecboot_3.19.bb b/recipes-kernel/linux/linux-gcw0-kexecboot_4.0.bb
similarity index 94%
rename from recipes-kernel/linux/linux-gcw0-kexecboot_3.19.bb
rename to recipes-kernel/linux/linux-gcw0-kexecboot_4.0.bb
index 43baae5..0041588 100644
--- a/recipes-kernel/linux/linux-gcw0-kexecboot_3.19.bb
+++ b/recipes-kernel/linux/linux-gcw0-kexecboot_4.0.bb
@@ -1,4 +1,4 @@
-require recipes-kernel/linux/linux-gcw0_3.19.bb
+require recipes-kernel/linux/linux-gcw0_4.0.bb
 SUMMARY = "GCW Zero kernel embedding a minimalistic kexecboot initramfs"
 
 PACKAGES = ""
diff --git a/recipes-kernel/linux/linux-gcw0_3.19.bb b/recipes-kernel/linux/linux-gcw0_4.0.bb
similarity index 69%
rename from recipes-kernel/linux/linux-gcw0_3.19.bb
rename to recipes-kernel/linux/linux-gcw0_4.0.bb
index 80ab3bf..4f02e26 100644
--- a/recipes-kernel/linux/linux-gcw0_3.19.bb
+++ b/recipes-kernel/linux/linux-gcw0_4.0.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
 COMPATIBLE_MACHINE = "gcw0"
 
-SRC_URI = "git://github.com/gcwnow/linux.git;branch=jz-3.19 \
+SRC_URI = "git://github.com/gcwnow/linux.git;branch=jz-4.0 \
           file://defconfig \
           "
-SRCREV = "9482cbbce300c7ae7ff3faa99abc7d5cb319d915"
+SRCREV = "419916bf914574237a5e54a0ce614a9479532cee"
 
 inherit kernel
 
-- 
1.9.1


