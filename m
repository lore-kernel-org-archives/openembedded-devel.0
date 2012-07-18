Received: from smtp204.alice.it ([82.57.200.100])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1SrcYL-0002r2-Sc
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 00:17:05 +0200
Received: from gnutoo-laptop.workgroup (79.1.133.74) by smtp204.alice.it
	(8.6.023.02) (authenticated as editempo@alice.it)
	id 5006060B000A23BF; Thu, 19 Jul 2012 00:00:28 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: martin.jansa@gmail.com
Date: Thu, 19 Jul 2012 00:00:16 +0200
Message-Id: <1342648817-23943-2-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1342648817-23943-1-git-send-email-GNUtoo@no-log.org>
References: <1342648817-23943-1-git-send-email-GNUtoo@no-log.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/3] Add compat-wireless recipe.
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
X-List-Received-Date: Wed, 18 Jul 2012 22:17:06 -0000

This recipe was based on the compat-wireless.inc recipe from openembedded-classic
  at commit 53784a5e2622582ce5e2ffb91bbdb573503ed75e

The .inc is there in order to make it possible to have such recipes:
  $ cat compat-wireless-ath_0.bb
  include compat-wireless.inc

  do_configure() {
  	cd ${S}
          ./scripts/driver-select ath
  }

0001-ath5k-fix-compilation-without-CONFIG_PCI.patch will have to be submitted upstream

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 .../compat-wireless/compat-wireless-all_0.bb       |    1 +
 .../compat-wireless/compat-wireless.inc            |   33 ++++++++++++++++++++
 ...-ath5k-fix-compilation-without-CONFIG_PCI.patch |   33 ++++++++++++++++++++
 3 files changed, 67 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-kernel/compat-wireless/compat-wireless-all_0.bb
 create mode 100644 meta-oe/recipes-kernel/compat-wireless/compat-wireless.inc
 create mode 100644 meta-oe/recipes-kernel/compat-wireless/files/0001-ath5k-fix-compilation-without-CONFIG_PCI.patch

diff --git a/meta-oe/recipes-kernel/compat-wireless/compat-wireless-all_0.bb b/meta-oe/recipes-kernel/compat-wireless/compat-wireless-all_0.bb
new file mode 100644
index 0000000..1d3395f
--- /dev/null
+++ b/meta-oe/recipes-kernel/compat-wireless/compat-wireless-all_0.bb
@@ -0,0 +1 @@
+include compat-wireless.inc
diff --git a/meta-oe/recipes-kernel/compat-wireless/compat-wireless.inc b/meta-oe/recipes-kernel/compat-wireless/compat-wireless.inc
new file mode 100644
index 0000000..faf1aab
--- /dev/null
+++ b/meta-oe/recipes-kernel/compat-wireless/compat-wireless.inc
@@ -0,0 +1,33 @@
+DESCRIPTION = "Latest wireless drivers"
+HOMEPAGE = "http://wireless.kernel.org/en/users/Download"
+SECTION = "kernel/modules"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d7810fab7487fb0aad327b76f1be7cd7"
+RDEPENDS = "wireless-tools"
+PR = "r0"
+
+COMPAT_WIRELESS_VERSION = "3.5-rc5-1"
+
+SRC_URI = " \
+  http://www.orbit-lab.org/kernel/compat-wireless-3-stable/v3.5/compat-wireless-${COMPAT_WIRELESS_VERSION}.tar.bz2 \
+  file://0001-ath5k-fix-compilation-without-CONFIG_PCI.patch \
+"
+
+PV = "${COMPAT_WIRELESS_VERSION}"
+
+S = "${WORKDIR}/compat-wireless-${COMPAT_WIRELESS_VERSION}"
+
+inherit module
+
+EXTRA_OEMAKE = "KLIB_BUILD=${STAGING_KERNEL_DIR} KLIB=${D}"
+
+do_configure_append() {
+	sed -i "s#@./scripts/update-initramfs## " Makefile
+}
+
+do_install() {
+	oe_runmake DEPMOD=echo DESTDIR="${D}" INSTALL_MOD_PATH="${D}" LDFLAGS="" install-modules
+}
+
+SRC_URI[md5sum] = "5d26bb5fd830ba67e920e0e4b2cff284"
+SRC_URI[sha256sum] = "f77ec3afd7c8fb1d9583cb5c82cdc683816c7fc43cebebc1f0f029d172fcce9a"
diff --git a/meta-oe/recipes-kernel/compat-wireless/files/0001-ath5k-fix-compilation-without-CONFIG_PCI.patch b/meta-oe/recipes-kernel/compat-wireless/files/0001-ath5k-fix-compilation-without-CONFIG_PCI.patch
new file mode 100644
index 0000000..3a51266
--- /dev/null
+++ b/meta-oe/recipes-kernel/compat-wireless/files/0001-ath5k-fix-compilation-without-CONFIG_PCI.patch
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
-- 
1.7.5.4



