Return-Path: <andrea.adami@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id D952660703
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jul 2014 14:58:55 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id k14so5420842wgh.32
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jul 2014 07:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ZAj8ja0zH6Bx4lbvQ7xHA6KVNgFab5KFaEIM61AmFe0=;
	b=AgyEIZMpmWB070rw89TYehMyST3f+VC6B2GeuEiQVsHa74p+54owup6gFuITl5ghV7
	ziIYlJ2yCWva/2CIR/KP/8z2WHMqhs5mosYQVAcpY1iSpIGsPHC1S1aqri3LtojXzOZu
	uwctTCTNh3L9ep2TKPowQa0ZqGYI69uWpn3bGYZtau4HnPUsL9q676eETkXPH4Snf55T
	563pmeS2uAP0qq5VH5x95ksGWuSRQsDzMmuIAvRhuqkCmEsMepK1YAQ99SA4hFR8h7Fa
	gm4C4MlcYnB/37vzxodTONEaVpnROkAvqIubcdcH0obdgpJZ6ZzhKQeXvq8yWrMgY5Es
	lmuQ==
X-Received: by 10.180.106.138 with SMTP id gu10mr14305586wib.21.1406386736436; 
	Sat, 26 Jul 2014 07:58:56 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host30-249-dynamic.54-79-r.retail.telecomitalia.it. [79.54.249.30])
	by mx.google.com with ESMTPSA id hp6sm8277089wib.23.2014.07.26.07.58.54
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Jul 2014 07:58:55 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Jul 2014 16:58:46 +0200
Message-Id: <1406386727-19634-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-handheld][PATCH] linux-gcw0_3.12: update defconfig
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
Add CONFIG_KEXEC=y

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-gcw0-3.12/gcw0/defconfig | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-gcw0-3.12/gcw0/defconfig b/recipes-kernel/linux/linux-gcw0-3.12/gcw0/defconfig
index 70f6f41..44c53bd 100644
--- a/recipes-kernel/linux/linux-gcw0-3.12/gcw0/defconfig
+++ b/recipes-kernel/linux/linux-gcw0-3.12/gcw0/defconfig
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
@@ -67,8 +66,10 @@ CONFIG_KEYBOARD_GPIO=y
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
@@ -81,6 +82,7 @@ CONFIG_I2C=y
 # CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_GPIO=y
+CONFIG_PINCTRL_JZ4770=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_POWER_SUPPLY=y
 CONFIG_PMU_ACT8600_SUPPORT=y
@@ -174,7 +176,7 @@ CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_TIMER=y
 CONFIG_RTC_CLASS=y
 # CONFIG_RTC_INTF_PROC is not set
-CONFIG_RTC_DRV_JZ4770=y
+CONFIG_RTC_DRV_JZ4740=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_PWM=y
 CONFIG_PWM_JZ4770=y
-- 
1.9.1


