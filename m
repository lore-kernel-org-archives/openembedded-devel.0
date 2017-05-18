Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 0E6287807B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 May 2017 18:16:50 +0000 (UTC)
Received: from seahawk.toradex.int
	(75-146-58-181-Washington.hfc.comcastbusiness.net [75.146.58.181])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 5C9215C1C68;
	Thu, 18 May 2017 20:15:59 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 May 2017 11:16:40 -0700
Message-Id: <1495131400-2540-1-git-send-email-stefan@agner.ch>
X-Mailer: git-send-email 2.7.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1495131360; bh=qjzemBC6PigHHL06X9y3H5O9iXAWlateVznUoVuPkm0=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=E3BUaWDrpp9gSDUpOcfnrruUtq0ZfY17uLvsA2TVBotpUn3jjgnEt1g0TshpUQC5+EOPJy9qJJ9mwA5coMRjthslDeauEZUf6eEXV0DTFWo1mt5BdYtNmEV5Ctz1fNaxCXzrwwCIupvE/Ma9JkOfHO42/KgBOsXqFAj1BJYKIPo=
Subject: [PATCH] wireguard: bump version to latest snapshot 0.0.20170517
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
X-List-Received-Date: Thu, 18 May 2017 18:16:53 -0000

Use the latest available snapshot 0.0.20170517 of WireGuard.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 .../wireguard/wireguard-module_0.0.20170421.bb     | 31 ----------------------
 .../wireguard/wireguard-module_0.0.20170517.bb     | 31 ++++++++++++++++++++++
 .../wireguard/wireguard-tools_0.0.20170421.bb      | 27 -------------------
 .../wireguard/wireguard-tools_0.0.20170517.bb      | 27 +++++++++++++++++++
 .../recipes-kernel/wireguard/wireguard.inc         |  4 +--
 5 files changed, 60 insertions(+), 60 deletions(-)
 delete mode 100644 meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170421.bb
 create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170517.bb
 delete mode 100644 meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170421.bb
 create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170517.bb

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170421.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170421.bb
deleted file mode 100644
index 2c69c58..0000000
--- a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170421.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-require wireguard.inc
-
-inherit module kernel-module-split
-
-DEPENDS = "virtual/kernel libmnl"
-
-# This module requires Linux 3.10 higher and several networking related
-# configuration options. For exact kernel requirements visit:
-# https://www.wireguard.io/install/#kernel-requirements
-
-EXTRA_OEMAKE_append = " \
-    KERNELDIR=${STAGING_KERNEL_DIR} \
-    "
-
-MAKE_TARGETS = "module"
-
-RRECOMMENDS_${PN} = "kernel-module-xt-hashlimit"
-MODULE_NAME = "wireguard"
-
-# Kernel module packages MUST begin with 'kernel-module-', otherwise
-# multilib image generation can fail.
-#
-# The following line is only necessary if the recipe name does not begin
-# with kernel-module-.
-PKG_${PN} = "kernel-module-${MODULE_NAME}"
-
-module_do_install() {
-    install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/${MODULE_NAME}
-    install -m 0644 ${MODULE_NAME}.ko \
-    ${D}/lib/modules/${KERNEL_VERSION}/kernel/${MODULE_NAME}/${MODULE_NAME}.ko
-}
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170517.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170517.bb
new file mode 100644
index 0000000..2c69c58
--- /dev/null
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170517.bb
@@ -0,0 +1,31 @@
+require wireguard.inc
+
+inherit module kernel-module-split
+
+DEPENDS = "virtual/kernel libmnl"
+
+# This module requires Linux 3.10 higher and several networking related
+# configuration options. For exact kernel requirements visit:
+# https://www.wireguard.io/install/#kernel-requirements
+
+EXTRA_OEMAKE_append = " \
+    KERNELDIR=${STAGING_KERNEL_DIR} \
+    "
+
+MAKE_TARGETS = "module"
+
+RRECOMMENDS_${PN} = "kernel-module-xt-hashlimit"
+MODULE_NAME = "wireguard"
+
+# Kernel module packages MUST begin with 'kernel-module-', otherwise
+# multilib image generation can fail.
+#
+# The following line is only necessary if the recipe name does not begin
+# with kernel-module-.
+PKG_${PN} = "kernel-module-${MODULE_NAME}"
+
+module_do_install() {
+    install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/${MODULE_NAME}
+    install -m 0644 ${MODULE_NAME}.ko \
+    ${D}/lib/modules/${KERNEL_VERSION}/kernel/${MODULE_NAME}/${MODULE_NAME}.ko
+}
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170421.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170421.bb
deleted file mode 100644
index 79d420f..0000000
--- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170421.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-require wireguard.inc
-
-inherit bash-completion systemd pkgconfig
-
-DEPENDS = "wireguard-module libmnl"
-
-do_compile_prepend () {
-    cd ${S}/tools
-}
-
-do_install () {
-    cd ${S}/tools
-    oe_runmake DESTDIR="${D}" PREFIX="${prefix}" SYSCONFDIR="${sysconfdir}" \
-        SYSTEMDUNITDIR="${systemd_unitdir}" \
-        WITH_SYSTEMDUNITS=${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'yes', '', d)} \
-        WITH_BASHCOMPLETION=yes \
-        WITH_WGQUICK=yes \
-        install
-}
-
-FILES_${PN} = " \
-    ${sysconfdir} \
-    ${systemd_unitdir} \
-    ${bindir} \
-"
-
-RDEPENDS_${PN} = "wireguard-module"
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170517.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170517.bb
new file mode 100644
index 0000000..79d420f
--- /dev/null
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170517.bb
@@ -0,0 +1,27 @@
+require wireguard.inc
+
+inherit bash-completion systemd pkgconfig
+
+DEPENDS = "wireguard-module libmnl"
+
+do_compile_prepend () {
+    cd ${S}/tools
+}
+
+do_install () {
+    cd ${S}/tools
+    oe_runmake DESTDIR="${D}" PREFIX="${prefix}" SYSCONFDIR="${sysconfdir}" \
+        SYSTEMDUNITDIR="${systemd_unitdir}" \
+        WITH_SYSTEMDUNITS=${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'yes', '', d)} \
+        WITH_BASHCOMPLETION=yes \
+        WITH_WGQUICK=yes \
+        install
+}
+
+FILES_${PN} = " \
+    ${sysconfdir} \
+    ${systemd_unitdir} \
+    ${bindir} \
+"
+
+RDEPENDS_${PN} = "wireguard-module"
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc b/meta-networking/recipes-kernel/wireguard/wireguard.inc
index 46a9971..9e38c57 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard.inc
+++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "8e559f4fd672b15c38a15eb4d88cc84d"
-SRC_URI[sha256sum] = "03c82af774224cd171d000ee4a519b5e474cc6842ac04967773cf77b26750000"
+SRC_URI[md5sum] = "e9969ebbdf525fcbe91a513db8a5c864"
+SRC_URI[sha256sum] = "7303e973654a3585039f4789e89a562f807f0d6010c7787b9b69ca72aa7a6908"
 
 S = "${WORKDIR}/WireGuard-${PV}/src/"
-- 
2.7.4


