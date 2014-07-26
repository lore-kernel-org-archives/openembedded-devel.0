Return-Path: <andrea.adami@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1721270668
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jul 2014 14:58:58 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id a1so5368936wgh.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jul 2014 07:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5VffxYgKJe3GicVWnUF8r/uEDxmshyG/pq6XXoxrhCA=;
	b=vtcO+tflDIdfccshNAjuL/ltdrB4M9GFxJQA3TGyr40E6ljoXvLRBC8Wyi7D17xi3k
	h0JzAWJM9XlJeD8Em+dqgDGOMWWvoJJZi0FaJRAg19KSoDcjs0epnsTJFASFt4hSHhQU
	NDOGY4Vlei4qL9yF0XGo+hLN2niEXNNqvHRYKMwNS83cDAI0eXRMWU8SH5r9MN+hHWOv
	YHxJD+COwHstBG22S2GceNKHRb4O6UlVWDHzk7CHZaWUrhRz9GRtbcmyrVn4PoaG2qaW
	1SHj/aTAqA6k1406Mn9Tyxgk1r+XnIMuEDwjAFA0hRQkOEIWw4kFBGZz+R85wZVcB/2x
	wN3Q==
X-Received: by 10.180.187.197 with SMTP id fu5mr3043412wic.64.1406386739120;
	Sat, 26 Jul 2014 07:58:59 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host30-249-dynamic.54-79-r.retail.telecomitalia.it. [79.54.249.30])
	by mx.google.com with ESMTPSA id hp6sm8277089wib.23.2014.07.26.07.58.58
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Jul 2014 07:58:58 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Jul 2014 16:58:47 +0200
Message-Id: <1406386727-19634-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1406386727-19634-1-git-send-email-andrea.adami@gmail.com>
References: <1406386727-19634-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH] linux-gcw0-kexecboot_3.12: update defconfig
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
X-List-Received-Date: Sat, 26 Jul 2014 14:59:05 -0000

Follow upstream changes.

While there, fix a potential issue with do_package_qa
like done in meta-initramfs for the main -kexecboot kernel.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-gcw0-kexecboot-3.12/gcw0/defconfig | 8 +++++---
 recipes-kernel/linux/linux-gcw0-kexecboot_3.12.bb             | 1 +
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-gcw0-kexecboot-3.12/gcw0/defconfig b/recipes-kernel/linux/linux-gcw0-kexecboot-3.12/gcw0/defconfig
index e5c5d7e..97e2e82 100644
--- a/recipes-kernel/linux/linux-gcw0-kexecboot-3.12/gcw0/defconfig
+++ b/recipes-kernel/linux/linux-gcw0-kexecboot-3.12/gcw0/defconfig
@@ -7,6 +7,7 @@ CONFIG_PREEMPT_VOLUNTARY=y
 CONFIG_KEXEC=y
 # CONFIG_SECCOMP is not set
 CONFIG_LOCALVERSION="-dingux"
+# CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_DEFAULT_HOSTNAME="gcw-zero"
 CONFIG_SYSVIPC=y
 CONFIG_NO_HZ_IDLE=y
@@ -21,10 +22,8 @@ CONFIG_PROFILING=y
 CONFIG_OPROFILE=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
-# CONFIG_LBDAF is not set
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
-# CONFIG_EFI_PARTITION is not set
 # CONFIG_IOSCHED_CFQ is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 # CONFIG_SUSPEND is not set
@@ -68,8 +67,10 @@ CONFIG_KEYBOARD_GPIO=y
 # CONFIG_INPUT_MOUSE is not set
 CONFIG_INPUT_JOYSTICK=y
 CONFIG_JOYSTICK_JZ_SADC=y
+CONFIG_JOYSTICK_MXC6225=m
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_UINPUT=y
+CONFIG_INPUT_PWM_HAPTIC=y
 # CONFIG_SERIO is not set
 CONFIG_LEGACY_PTY_COUNT=2
 # CONFIG_DEVMEM is not set
@@ -82,6 +83,7 @@ CONFIG_I2C=y
 # CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_GPIO=y
+CONFIG_PINCTRL_JZ4770=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_POWER_SUPPLY=y
 CONFIG_PMU_ACT8600_SUPPORT=y
@@ -175,7 +177,7 @@ CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_TIMER=y
 CONFIG_RTC_CLASS=y
 # CONFIG_RTC_INTF_PROC is not set
-CONFIG_RTC_DRV_JZ4770=y
+CONFIG_RTC_DRV_JZ4740=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_PWM=y
 CONFIG_PWM_JZ4770=y
diff --git a/recipes-kernel/linux/linux-gcw0-kexecboot_3.12.bb b/recipes-kernel/linux/linux-gcw0-kexecboot_3.12.bb
index 45a18c0..aada422 100644
--- a/recipes-kernel/linux/linux-gcw0-kexecboot_3.12.bb
+++ b/recipes-kernel/linux/linux-gcw0-kexecboot_3.12.bb
@@ -16,6 +16,7 @@ INITRAMFS_TASK = "${INITRAMFS_IMAGE}:do_rootfs"
 # disable unneeded tasks
 do_install[noexec] = "1"
 do_package[noexec] = "1"
+do_package_qa[noexec] = "1"
 do_packagedata[noexec] = "1"
 do_package_deb[noexec] = "1"
 do_package_ipk[noexec] = "1"
-- 
1.9.1


