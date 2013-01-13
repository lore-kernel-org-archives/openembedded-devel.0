Received: from mail-we0-f170.google.com ([74.125.82.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TuLFS-0002jQ-7C
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Jan 2013 11:57:08 +0100
Received: by mail-we0-f170.google.com with SMTP id r1so1643169wey.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jan 2013 02:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=kmoKYZM8rdk/ekHOVfznwmyTY5T8sgUEjeyn6/ECFwo=;
	b=JJ7y4WFMGrJknQDFoIg7I9RcqYjdenzsgVEwKSZOzn7SpdVPnyQcGy0nWO0tOH/IPV
	Ot1g1gB0FV9DYtZxU0whC6NA0w7CFm3rGdRD5LVC2pR+HUEj25izW0IGGTHjuMuqOC2Y
	/Hya7bStP41sbKODM2zJnXQn654FpOgndSy53fiQvcJyY//Lx8meNOHbbAlrqcnbr3XJ
	XpkqngHfQcxsMg5TAflnu5eROzZ3HqOpw6SRMFEyKaBnn0DIEeHlMV2cI5yMxUW8Ia1N
	s90/To1Z1xSCjX3v+NeS/iIl2KtonkzVX86O1NHmjsvxWHXYJHAoaAGXw0M47iQ0XR/n
	TuUg==
X-Received: by 10.194.76.7 with SMTP id g7mr50963379wjw.50.1358073708919;
	Sun, 13 Jan 2013 02:41:48 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id eo10sm8235197wib.9.2013.01.13.02.41.47
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 13 Jan 2013 02:41:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Jan 2013 11:41:46 +0100
Message-Id: <1358073706-30876-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1
Subject: [PATCH][meta-oe] compat-wireless: upgrade and fixup
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
X-List-Received-Date: Sun, 13 Jan 2013 10:57:21 -0000

* use INC_PR
* fix RDEPENDS
* use normal PV
* move checksums from .inc to .bb
* upgrade, because old version fails to build with a lot of errors like this:
  compat-wireless-3.5-rc5-1/include/linux/compat-3.5.h:102:8: error: redefinition of 'struct tc_fq_codel_xstats'
* 3.5.4-1, 3.6.8-1 can failed when kernel option is missing:
  | compat-wireless-all/3.5.4-r1.0/compat-wireless-3.5.4-1/drivers/net/ethernet/broadcom/b44.c:2342:2:
    error: implicit declaration of function 'ssb_pcihost_register' [-Werror=implicit-function-declaration]
  | cc1: some warnings being treated as errors

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-ath5k-fix-compilation-without-CONFIG_PCI.patch | 33 ++++++++++++++++++++++
 .../compat-wireless/compat-wireless-all_0.bb       |  1 -
 .../compat-wireless/compat-wireless-all_3.6.8.bb   |  5 ++++
 .../compat-wireless/compat-wireless.inc            | 14 ++++-----
 ...-ath5k-fix-compilation-without-CONFIG_PCI.patch | 33 ----------------------
 5 files changed, 43 insertions(+), 43 deletions(-)
 create mode 100644 meta-oe/recipes-kernel/compat-wireless/compat-wireless-all/0001-ath5k-fix-compilation-without-CONFIG_PCI.patch
 delete mode 100644 meta-oe/recipes-kernel/compat-wireless/compat-wireless-all_0.bb
 create mode 100644 meta-oe/recipes-kernel/compat-wireless/compat-wireless-all_3.6.8.bb
 delete mode 100644 meta-oe/recipes-kernel/compat-wireless/files/0001-ath5k-fix-compilation-without-CONFIG_PCI.patch

diff --git a/meta-oe/recipes-kernel/compat-wireless/compat-wireless-all/0001-ath5k-fix-compilation-without-CONFIG_PCI.patch b/meta-oe/recipes-kernel/compat-wireless/compat-wireless-all/0001-ath5k-fix-compilation-without-CONFIG_PCI.patch
new file mode 100644
index 0000000..3a51266
--- /dev/null
+++ b/meta-oe/recipes-kernel/compat-wireless/compat-wireless-all/0001-ath5k-fix-compilation-without-CONFIG_PCI.patch
@@ -0,0 +1,33 @@
+From fb323acc0b01bcf1ecafb9330c4fbb41cf942139 Mon Sep 17 00:00:00 2001
+From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
+Date: Wed, 18 Jul 2012 01:01:52 +0200
+Subject: [PATCH] ath5k: fix compilation without CONFIG_PCI
+
+Without that fix we have:
+  [...]/drivers/net/wireless/ath/ath5k/led.c: In function 'ath5k_init_leds':
+  [...]/drivers/net/wireless/ath/ath5k/led.c:179:2: error: implicit declaration of function 'pci_match_id' [-Werror=implicit-function-declaration]
+When CONFIG_PCI is not set.
+
+Upstream-Status: Pending: Not submitted yet.
+
+Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
+---
+ drivers/net/wireless/ath/ath5k/led.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/net/wireless/ath/ath5k/led.c b/drivers/net/wireless/ath/ath5k/led.c
+index c044476..a4de133 100644
+--- a/drivers/net/wireless/ath/ath5k/led.c
++++ b/drivers/net/wireless/ath/ath5k/led.c
+@@ -173,7 +173,7 @@ int __devinit ath5k_init_leds(struct ath5k_hw *ah)
+ 	if (!ah->pdev)
+ 		return 0;
+ 
+-#ifdef CONFIG_ATHEROS_AR231X
++#if defined(CONFIG_ATHEROS_AR231X) || !defined(CONFIG_PCI)
+ 	match = NULL;
+ #else
+ 	match = pci_match_id(&ath5k_led_devices[0], pdev);
+-- 
+1.7.4.1
+
diff --git a/meta-oe/recipes-kernel/compat-wireless/compat-wireless-all_0.bb b/meta-oe/recipes-kernel/compat-wireless/compat-wireless-all_0.bb
deleted file mode 100644
index 1d3395f..0000000
--- a/meta-oe/recipes-kernel/compat-wireless/compat-wireless-all_0.bb
+++ /dev/null
@@ -1 +0,0 @@
-include compat-wireless.inc
diff --git a/meta-oe/recipes-kernel/compat-wireless/compat-wireless-all_3.6.8.bb b/meta-oe/recipes-kernel/compat-wireless/compat-wireless-all_3.6.8.bb
new file mode 100644
index 0000000..0c407de
--- /dev/null
+++ b/meta-oe/recipes-kernel/compat-wireless/compat-wireless-all_3.6.8.bb
@@ -0,0 +1,5 @@
+include compat-wireless.inc
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "f02849a795137438238b4d166609eacc"
+SRC_URI[sha256sum] = "9bbbc72bf0adf73012f377caa38147e90f6d77ef0369b52f9a687bc66bbfbcfa"
diff --git a/meta-oe/recipes-kernel/compat-wireless/compat-wireless.inc b/meta-oe/recipes-kernel/compat-wireless/compat-wireless.inc
index faf1aab..30d52cc 100644
--- a/meta-oe/recipes-kernel/compat-wireless/compat-wireless.inc
+++ b/meta-oe/recipes-kernel/compat-wireless/compat-wireless.inc
@@ -3,18 +3,17 @@ HOMEPAGE = "http://wireless.kernel.org/en/users/Download"
 SECTION = "kernel/modules"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d7810fab7487fb0aad327b76f1be7cd7"
-RDEPENDS = "wireless-tools"
-PR = "r0"
+RDEPENDS_${PN} = "wireless-tools"
+INC_PR = "r1"
 
-COMPAT_WIRELESS_VERSION = "3.5-rc5-1"
+COMPAT_WIRELESS_VERSION = "${PV}-1"
+SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
 SRC_URI = " \
-  http://www.orbit-lab.org/kernel/compat-wireless-3-stable/v3.5/compat-wireless-${COMPAT_WIRELESS_VERSION}.tar.bz2 \
+  http://www.orbit-lab.org/kernel/compat-wireless-3-stable/v${SHRT_VER}/compat-wireless-${COMPAT_WIRELESS_VERSION}.tar.bz2 \
   file://0001-ath5k-fix-compilation-without-CONFIG_PCI.patch \
 "
 
-PV = "${COMPAT_WIRELESS_VERSION}"
-
 S = "${WORKDIR}/compat-wireless-${COMPAT_WIRELESS_VERSION}"
 
 inherit module
@@ -28,6 +27,3 @@ do_configure_append() {
 do_install() {
 	oe_runmake DEPMOD=echo DESTDIR="${D}" INSTALL_MOD_PATH="${D}" LDFLAGS="" install-modules
 }
-
-SRC_URI[md5sum] = "5d26bb5fd830ba67e920e0e4b2cff284"
-SRC_URI[sha256sum] = "f77ec3afd7c8fb1d9583cb5c82cdc683816c7fc43cebebc1f0f029d172fcce9a"
diff --git a/meta-oe/recipes-kernel/compat-wireless/files/0001-ath5k-fix-compilation-without-CONFIG_PCI.patch b/meta-oe/recipes-kernel/compat-wireless/files/0001-ath5k-fix-compilation-without-CONFIG_PCI.patch
deleted file mode 100644
index 3a51266..0000000
--- a/meta-oe/recipes-kernel/compat-wireless/files/0001-ath5k-fix-compilation-without-CONFIG_PCI.patch
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
-- 
1.8.1



