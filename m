Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1O93A5-0006Ft-K1
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 May 2010 23:26:48 +0200
Received: from smtp2-g21.free.fr (localhost [127.0.0.1])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 70A574B00D9;
	Mon,  3 May 2010 23:22:59 +0200 (CEST)
Received: from localhost.localdomain (pac33-2-82-240-38-71.fbx.proxad.net
	[82.240.38.71]) by smtp2-g21.free.fr (Postfix) with ESMTP;
	Mon,  3 May 2010 23:22:57 +0200 (CEST)
From: Eric Benard <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 May 2010 23:22:35 +0200
Message-Id: <1272921755-7414-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 212.27.42.2
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] compat-wireless: Add latest Linux wireless drivers
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
X-List-Received-Date: Mon, 03 May 2010 21:26:48 -0000

- provides latest (linux-next) drivers for older kernels
- ath driver was tested on x86 (on Asus eeetop with Linux 2.6.33)
- other drivers were only compile tested for x86

Signed-off-by: Eric Benard <eric@eukrea.com>
---
 recipes/compat-wireless/compat-wireless-ath_0.bb   |    6 ++++
 .../compat-wireless/compat-wireless-atheros_0.bb   |    6 ++++
 recipes/compat-wireless/compat-wireless-intel_0.bb |    6 ++++
 .../compat-wireless/compat-wireless-iwlwifi_0.bb   |    6 ++++
 .../compat-wireless/compat-wireless-rtl818x_0.bb   |    6 ++++
 .../compat-wireless/compat-wireless-wl12xx_0.bb    |    6 ++++
 recipes/compat-wireless/compat-wireless.inc        |   31 ++++++++++++++++++++
 7 files changed, 67 insertions(+), 0 deletions(-)
 create mode 100644 recipes/compat-wireless/compat-wireless-ath_0.bb
 create mode 100644 recipes/compat-wireless/compat-wireless-atheros_0.bb
 create mode 100644 recipes/compat-wireless/compat-wireless-intel_0.bb
 create mode 100644 recipes/compat-wireless/compat-wireless-iwlwifi_0.bb
 create mode 100644 recipes/compat-wireless/compat-wireless-rtl818x_0.bb
 create mode 100644 recipes/compat-wireless/compat-wireless-wl12xx_0.bb
 create mode 100644 recipes/compat-wireless/compat-wireless.inc

diff --git a/recipes/compat-wireless/compat-wireless-ath_0.bb b/recipes/compat-wireless/compat-wireless-ath_0.bb
new file mode 100644
index 0000000..dedc9e7
--- /dev/null
+++ b/recipes/compat-wireless/compat-wireless-ath_0.bb
@@ -0,0 +1,6 @@
+include compat-wireless.inc
+
+do_configure() {
+	cd ${S}
+        ./scripts/driver-select ath
+}
diff --git a/recipes/compat-wireless/compat-wireless-atheros_0.bb b/recipes/compat-wireless/compat-wireless-atheros_0.bb
new file mode 100644
index 0000000..33a23ba
--- /dev/null
+++ b/recipes/compat-wireless/compat-wireless-atheros_0.bb
@@ -0,0 +1,6 @@
+include compat-wireless.inc
+
+do_configure() {
+	cd ${S}
+        ./scripts/driver-select atheros
+}
diff --git a/recipes/compat-wireless/compat-wireless-intel_0.bb b/recipes/compat-wireless/compat-wireless-intel_0.bb
new file mode 100644
index 0000000..cfb5473
--- /dev/null
+++ b/recipes/compat-wireless/compat-wireless-intel_0.bb
@@ -0,0 +1,6 @@
+include compat-wireless.inc
+
+do_configure() {
+	cd ${S}
+        ./scripts/driver-select intel
+}
diff --git a/recipes/compat-wireless/compat-wireless-iwlwifi_0.bb b/recipes/compat-wireless/compat-wireless-iwlwifi_0.bb
new file mode 100644
index 0000000..cc9d922
--- /dev/null
+++ b/recipes/compat-wireless/compat-wireless-iwlwifi_0.bb
@@ -0,0 +1,6 @@
+include compat-wireless.inc
+
+do_configure() {
+	cd ${S}
+        ./scripts/driver-select iwlwifi
+}
diff --git a/recipes/compat-wireless/compat-wireless-rtl818x_0.bb b/recipes/compat-wireless/compat-wireless-rtl818x_0.bb
new file mode 100644
index 0000000..1f4c795
--- /dev/null
+++ b/recipes/compat-wireless/compat-wireless-rtl818x_0.bb
@@ -0,0 +1,6 @@
+include compat-wireless.inc
+
+do_configure() {
+	cd ${S}
+        ./scripts/driver-select rtl818x
+}
diff --git a/recipes/compat-wireless/compat-wireless-wl12xx_0.bb b/recipes/compat-wireless/compat-wireless-wl12xx_0.bb
new file mode 100644
index 0000000..01719b7
--- /dev/null
+++ b/recipes/compat-wireless/compat-wireless-wl12xx_0.bb
@@ -0,0 +1,6 @@
+include compat-wireless.inc
+
+do_configure() {
+	cd ${S}
+        ./scripts/driver-select wl12xx
+}
diff --git a/recipes/compat-wireless/compat-wireless.inc b/recipes/compat-wireless/compat-wireless.inc
new file mode 100644
index 0000000..73daeb4
--- /dev/null
+++ b/recipes/compat-wireless/compat-wireless.inc
@@ -0,0 +1,31 @@
+DESCRIPTION = "Latest wireless drivers"
+HOMEPAGE = "http://wireless.kernel.org/en/users/Download"
+SECTION = "kernel/modules"
+LICENSE = "GPL"
+RDEPENDS = "wireless-tools"
+PR = "r0"
+
+COMPAT_WIRELESS_VERSION = "2010-04-26"
+
+SRC_URI = "http://wireless.kernel.org/download/compat-wireless-2.6/compat-wireless-${COMPAT_WIRELESS_VERSION}.tar.bz2 \
+	"
+
+TAG = "${@'${COMPAT_WIRELESS_VERSION}'.replace('-', '')}"
+PV = "0.${TAG}"
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
+	oe_runmake DEPMOD=echo DESTDIR="${D}" INSTALL_MOD_PATH="${D}" install-modules
+}
+
+SRC_URI[md5sum] = "371e6fe12a0a8435e33061158c329a2e"
+SRC_URI[sha256sum] = "2988eb25a7e7d8bb0f324c5a500eff4445bc8bafc0135b6c05e07544a4f791ed"
-- 
1.6.3.3



