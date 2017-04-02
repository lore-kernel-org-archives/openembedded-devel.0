Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 346B97199A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Apr 2017 20:33:24 +0000 (UTC)
Received: from seahawk.toradex.int
	(75-146-58-181-Washington.hfc.comcastbusiness.net [75.146.58.181])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 5B43B5C0533;
	Sun,  2 Apr 2017 22:33:21 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Apr 2017 13:33:09 -0700
Message-Id: <1491165189-7839-1-git-send-email-stefan@agner.ch>
X-Mailer: git-send-email 2.7.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1491165202; bh=bIxIqe4jxfZ93SZbiQOc2YsgRdpx/zHFZvGvkODQ3wQ=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=Cyi27sXh2bGUOl3JVcUBtQcpAWIl6VJEfKRsq8TDRLLKzcfWRzkYUlvJL7GuAApRPzaL4yrdlQymxnThdCsNgVv0m4i5FfIOFPBQbEXY1chrvT+bb+fSrX+8rADiK7DxEwNq5ETRcTrAinS+mL4O6a/X+IOE+d7SQ5Vp0GB0ihU=
Subject: [meta-networking][PATCH] wireguard: add WireGuard kernel module and tools
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
X-List-Received-Date: Sun, 02 Apr 2017 20:33:28 -0000

WireGuard is an extremely simple yet fast and modern VPN that utilizes
state-of-the-art cryptography. It aims to be faster, simpler, leaner,
and more useful than IPSec, while avoiding the massive headache.

The recipes add the current experimental snapshot v0.0.20170324
out-of-tree kernel module and tools. The kernel module has some kernel
configuration dependencies such as some configuration part of
features/netfilter/netfilter.scc, hence netfilter.scc should be part
of KERNEL_EXTRA_FEATURES (which is the case by default).

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 .../wireguard/wireguard-module_0.0.20170324.bb     |  9 ++++++++
 .../wireguard/wireguard-tools_0.0.20170324.bb      | 27 ++++++++++++++++++++++
 .../recipes-kernel/wireguard/wireguard.inc         | 18 +++++++++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170324.bb
 create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170324.bb
 create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard.inc

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170324.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170324.bb
new file mode 100644
index 0000000..aeb8269
--- /dev/null
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170324.bb
@@ -0,0 +1,9 @@
+require wireguard.inc
+
+inherit module
+
+EXTRA_OEMAKE += "KERNELDIR=${STAGING_KERNEL_DIR}"
+MAKE_TARGETS = "module"
+MODULES_INSTALL_TARGET = "module-install"
+
+RRECOMMENDS_${PN} = "kernel-module-xt-hashlimit"
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170324.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170324.bb
new file mode 100644
index 0000000..79d420f
--- /dev/null
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170324.bb
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
new file mode 100644
index 0000000..cec7260
--- /dev/null
+++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
@@ -0,0 +1,18 @@
+SUMMARY = "WireGuard is an extremely simple yet fast and modern VPN"
+DESCRIPTION="WireGuard is a secure network tunnel, operating at layer 3, \
+implemented as a kernel virtual network interface for Linux, which aims to \
+replace both IPsec for most use cases, as well as popular user space and/or \
+TLS-based solutions like OpenVPN, while being more secure, more performant, \
+and easier to use."
+SECTION = "networking"
+HOMEPAGE = "https://www.wireguard.io/"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "fead9ae2d7c6729e39f529913584494a"
+SRC_URI[sha256sum] = "2ec08a5d74cb3a63576f06d3cae695b6b8995acd9665e2fa4da91927b467ca51"
+
+S = "${WORKDIR}/WireGuard-${PV}/src/"
-- 
2.7.4


