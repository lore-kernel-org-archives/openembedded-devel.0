Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id A91FE73163
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 12:04:37 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id l68so25653936wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 04:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=D46ItkgAF6jr0+TF7YI9q+wIk9unF/YXOI54+2SxRxk=;
	b=Udo4JNHVrz2JXFK+rDKk4RLPEXjyoQleCHajN55FvKJhtOwdNqhrAZXavfTEB2G9Yq
	1umUwTcedzjssU3IPmXPQ84vS3KR2nJiWPvBOtsExPFtQ//R+78HDRQ3m5lUJoDKAWfF
	EM182bJzSd+hA3s/RfPYRjtI8SO9Uv4UnJmHYhmt4Eal3alB7YL79GLpo2c+Y6lDIKGg
	QTDpzGAPAdCxuxwRHk8LdITUg0GIn7aFv5eQtKS6TNropt92IK1A/Nw8Ecl0nZ1Dl3VS
	3+MpxUlXEYpzbVmxn637bvcwQCSOmj2305P60DIt3fpfXy2c+pzBRfH9ao6BJfTYTY0X
	Qp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=D46ItkgAF6jr0+TF7YI9q+wIk9unF/YXOI54+2SxRxk=;
	b=PFJtAnhPZai9AJVmDvEUNPAmCKDWOlOKdFQ3XvaJNITamsaKgNeeDRDEYu8sfgrXwB
	a+bBLzHWhtPDd4gSmelwSVTqIoiLvHZYxcs2FUEpyr+QtyCnO5lKkHMZe9RSHeUZ5Qg7
	ltThPGQWlQdfoXj60KL1ODcUEMuMGKHFNwAtFysooGreEiVmwMmpPJORHhLbUZEhLsSv
	8OKp2XAlv2FPt7Ihc2rfEweO71jPgyTAHSR9DoXbuMTS90qEEJPABYLM/JCB4shqDGl0
	n39/u4sap6gTZfPECg+JT/qgI/xqc6F2jkQ2NlLteWWdfMd1fURaByAJSKUUanjQtxDz
	rPDw==
X-Gm-Message-State: AD7BkJIaosp6reNI08Iyg8C0i2qZqPrTWeuQFjCs5ydpcPWA/ELQZhABcYOvQWu9X8yJ3g==
X-Received: by 10.28.146.209 with SMTP id u200mr3270167wmd.59.1457611477475;
	Thu, 10 Mar 2016 04:04:37 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id s66sm3266130wmb.6.2016.03.10.04.04.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Mar 2016 04:04:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Mar 2016 13:07:32 +0100
Message-Id: <1457611653-26035-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.2
Subject: [PATCH][meta-oe 1/2] compat-wireless: Remove
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Mar 2016 12:04:38 -0000

* some layers already have recipes for linux-backports
* don't know about anyone still using this and fails in default setups
  | make -C /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemuarm/kernel-source M=/home/jenkins/oe/world/shr-core/tmp-glibc/work/qemuarm-oe-linux-gnueabi/compat-wireless-all/3.6.8-r1.0/compat-wireless-3.6.8-1 modules
  | make[1]: Entering directory `/home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemuarm/kernel-source'
  | make[2]: Entering directory `/home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemuarm/kernel-build-artifacts'
  | /home/jenkins/oe/world/shr-core/tmp-glibc/work/qemuarm-oe-linux-gnueabi/compat-wireless-all/3.6.8-r1.0/compat-wireless-3.6.8-1/config.mk:21: *** "ERROR: compat-wireless by default supports kernels >= 2.6.24, try enabling only one driver though".  Stop.
  | make[2]: *** [_module_/home/jenkins/oe/world/shr-core/tmp-glibc/work/qemuarm-oe-linux-gnueabi/compat-wireless-all/3.6.8-r1.0/compat-wireless-3.6.8-1] Error 2
  | make[2]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemuarm/kernel-build-artifacts'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-ath5k-fix-compilation-without-CONFIG_PCI.patch | 33 ----------------------
 .../compat-wireless/compat-wireless-all_3.6.8.bb   |  5 ----
 .../compat-wireless/compat-wireless.inc            | 33 ----------------------
 3 files changed, 71 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/compat-wireless/compat-wireless-all/0001-ath5k-fix-compilation-without-CONFIG_PCI.patch
 delete mode 100644 meta-oe/recipes-kernel/compat-wireless/compat-wireless-all_3.6.8.bb
 delete mode 100644 meta-oe/recipes-kernel/compat-wireless/compat-wireless.inc

diff --git a/meta-oe/recipes-kernel/compat-wireless/compat-wireless-all/0001-ath5k-fix-compilation-without-CONFIG_PCI.patch b/meta-oe/recipes-kernel/compat-wireless/compat-wireless-all/0001-ath5k-fix-compilation-without-CONFIG_PCI.patch
deleted file mode 100644
index 3a51266..0000000
--- a/meta-oe/recipes-kernel/compat-wireless/compat-wireless-all/0001-ath5k-fix-compilation-without-CONFIG_PCI.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From fb323acc0b01bcf1ecafb9330c4fbb41cf942139 Mon Sep 17 00:00:00 2001
-From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
-Date: Wed, 18 Jul 2012 01:01:52 +0200
-Subject: [PATCH] ath5k: fix compilation without CONFIG_PCI
-
-Without that fix we have:
-  [...]/drivers/net/wireless/ath/ath5k/led.c: In function 'ath5k_init_leds':
-  [...]/drivers/net/wireless/ath/ath5k/led.c:179:2: error: implicit declaration of function 'pci_match_id' [-Werror=implicit-function-declaration]
-When CONFIG_PCI is not set.
-
-Upstream-Status: Pending: Not submitted yet.
-
-Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
----
- drivers/net/wireless/ath/ath5k/led.c |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/drivers/net/wireless/ath/ath5k/led.c b/drivers/net/wireless/ath/ath5k/led.c
-index c044476..a4de133 100644
---- a/drivers/net/wireless/ath/ath5k/led.c
-+++ b/drivers/net/wireless/ath/ath5k/led.c
-@@ -173,7 +173,7 @@ int __devinit ath5k_init_leds(struct ath5k_hw *ah)
- 	if (!ah->pdev)
- 		return 0;
- 
--#ifdef CONFIG_ATHEROS_AR231X
-+#if defined(CONFIG_ATHEROS_AR231X) || !defined(CONFIG_PCI)
- 	match = NULL;
- #else
- 	match = pci_match_id(&ath5k_led_devices[0], pdev);
--- 
-1.7.4.1
-
diff --git a/meta-oe/recipes-kernel/compat-wireless/compat-wireless-all_3.6.8.bb b/meta-oe/recipes-kernel/compat-wireless/compat-wireless-all_3.6.8.bb
deleted file mode 100644
index 0c407de..0000000
--- a/meta-oe/recipes-kernel/compat-wireless/compat-wireless-all_3.6.8.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-include compat-wireless.inc
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "f02849a795137438238b4d166609eacc"
-SRC_URI[sha256sum] = "9bbbc72bf0adf73012f377caa38147e90f6d77ef0369b52f9a687bc66bbfbcfa"
diff --git a/meta-oe/recipes-kernel/compat-wireless/compat-wireless.inc b/meta-oe/recipes-kernel/compat-wireless/compat-wireless.inc
deleted file mode 100644
index 3981426..0000000
--- a/meta-oe/recipes-kernel/compat-wireless/compat-wireless.inc
+++ /dev/null
@@ -1,33 +0,0 @@
-DESCRIPTION = "Latest wireless drivers"
-HOMEPAGE = "http://wireless.kernel.org/en/users/Download"
-SECTION = "kernel/modules"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d7810fab7487fb0aad327b76f1be7cd7"
-RDEPENDS_${PN} = "wireless-tools"
-INC_PR = "r1"
-
-# depends on config options which are not enabled in qemu* MACHINEs by default
-# config.mk:25: *** "ERROR: your kernel has CONFIG_CFG80211=y, you should have it CONFIG_CFG80211=m if you want to use this thing.".  Stop.
-EXCLUDE_FROM_WORLD = "1"
-
-COMPAT_WIRELESS_VERSION = "${PV}-1"
-SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
-
-SRC_URI = " \
-    http://www.orbit-lab.org/kernel/compat-wireless-3-stable/v${SHRT_VER}/compat-wireless-${COMPAT_WIRELESS_VERSION}.tar.bz2 \
-    file://0001-ath5k-fix-compilation-without-CONFIG_PCI.patch \
-"
-
-S = "${WORKDIR}/compat-wireless-${COMPAT_WIRELESS_VERSION}"
-
-inherit module
-
-EXTRA_OEMAKE = "KLIB_BUILD=${STAGING_KERNEL_DIR} KLIB=${D}"
-
-do_configure_append() {
-    sed -i "s#@./scripts/update-initramfs## " Makefile
-}
-
-do_install() {
-    oe_runmake DEPMOD=echo DESTDIR="${D}" INSTALL_MOD_PATH="${D}" LDFLAGS="" install-modules
-}
-- 
2.7.2


