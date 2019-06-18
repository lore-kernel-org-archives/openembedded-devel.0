Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5686D7E95A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 16:55:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45SvMj0Rwkz4h
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 18:55:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560876913;
	bh=evczIl1sd3wF2PKkYROuGxaBIozWGRvicBu3SjJj32s=;
	h=From:To:Subject:Date:From;
	b=fB+Cx7ed3QPV8mtOMkG9+d4dF57uhXkvChCRiyGjo61Fsm00vYrslI4k2nXKKCP1V
	ex9TXL9HZHcnCtaYygMlxzuq12i+AxehbcuA9nbv3alM/1Hf/T/VMisGr51aF99OL2
	6aYNFA0v/SWnHBi5YaTl5vlL5qIdeXce4siKD7S5IrQ8jawZvcUCW8iUaMzykZgc6W
	PGIExGldVx47N+FT1K5GX3ruFjErtz0jhv21NgLH7E0u/np2zvvkRmm2L9OoaQUYRe
	UlgNwbG1ly/cJ119nq2xGnksoI0u7m5YVmgpjhmCU96uFMMtvHMESH7uVnu7mI/OuW
	iRvs9AFJ/1DFq0dNiMM5IE6JaiA/vHtBzRG1G5fl4zmPz39hHGPib47/ZzE5frs88Y
	Bhmvkl1DbcuRLIc49oRbAo0k1yPiL6QCv7dh8kqN3ly6C1Gz0WqRenUdZ1+XQOnDgo
	bsHdYMmk0FOgqyFUAAGzoTuJwlNKPX8qotXcwn3jvF9AL134f2KPash+QsCq6k6Zw8
	omknVjfCJq1DGGc5miLF9eVWnfAwKZbbGFiYnGO9+cS5K7FgqumxFip+9nrKajooaE
	hshHJ9A4s/w/8yIpDpVMZfY/0yf4NFUw7rFXgiTlZ3bbAHcpkrpM8w3qVndStWGMv2
	FmKww3Vp9sCky4WEtCDKm+pI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jun 2019 19:55:14 +0300
Message-Id: <20190618165514.8176-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] xl2tpd: Remove the old 1.3.6 version
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
X-List-Received-Date: Tue, 18 Jun 2019 16:55:12 -0000

It started as one recipe for the latest stable release and one
for the latest git, but after these became ancient release and
latest release it no longer made sense to have two recipees.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../recipes-protocols/xl2tpd/xl2tpd.inc       | 39 ------------------
 .../recipes-protocols/xl2tpd/xl2tpd_1.3.14.bb | 41 +++++++++++++++++--
 .../recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb  |  7 ----
 3 files changed, 38 insertions(+), 49 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
 delete mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb

diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc b/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
deleted file mode 100644
index 43942bcae..000000000
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "Xelerance version of the Layer 2 Tunneling Protocol (L2TP) daemon"
-HOMEPAGE = "http://www.xelerance.com/software/xl2tpd/"
-SECTION = "net"
-DEPENDS = "ppp virtual/kernel"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-SRC_URI = "git://github.com/xelerance/xl2tpd.git"
-
-S = "${WORKDIR}/git"
-
-inherit update-rc.d
-
-do_compile () {
-    oe_runmake CFLAGS="${CFLAGS} -DLINUX" LDFLAGS="${LDFLAGS}" PREFIX="${prefix}" KERNELSRC=${STAGING_KERNEL_DIR} all
-}
-
-do_install () {
-    oe_runmake PREFIX="${D}${prefix}" install
-
-    install -d ${D}${sysconfdir}/init.d
-    touch ${D}${sysconfdir}/xl2tpd.conf
-    install -m 0755 debian/xl2tpd.init ${D}${sysconfdir}/init.d/xl2tpd
-    sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/xl2tpd
-    sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/xl2tpd
-    sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/xl2tpd
-    sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${sysconfdir}/init.d/xl2tpd
-
-    install -d ${D}${sysconfdir}/default
-    install -m 0644 debian/xl2tpd.default ${D}${sysconfdir}/default/xl2tpd
-}
-
-CONFFILES_${PN} += "${sysconfdir}/xl2tpd.conf ${sysconfdir}/default/xl2tpd"
-
-INITSCRIPT_PACKAGES = "${PN}"
-INITSCRIPT_NAME_${PN} = "xl2tpd"
diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.14.bb b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.14.bb
index f03b537d9..b02e183db 100644
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.14.bb
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.14.bb
@@ -1,5 +1,40 @@
-require xl2tpd.inc
+SUMMARY = "Xelerance version of the Layer 2 Tunneling Protocol (L2TP) daemon"
+HOMEPAGE = "http://www.xelerance.com/software/xl2tpd/"
+SECTION = "net"
+DEPENDS = "ppp virtual/kernel"
 
-# This is v1.3.6 plus some commits.  There is no tag for this commit.
-#
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "git://github.com/xelerance/xl2tpd.git"
 SRCREV = "ba619c79c4790c78c033df0abde4a9a5de744a08"
+
+S = "${WORKDIR}/git"
+
+inherit update-rc.d
+
+do_compile () {
+    oe_runmake CFLAGS="${CFLAGS} -DLINUX" LDFLAGS="${LDFLAGS}" PREFIX="${prefix}" KERNELSRC=${STAGING_KERNEL_DIR} all
+}
+
+do_install () {
+    oe_runmake PREFIX="${D}${prefix}" install
+
+    install -d ${D}${sysconfdir}/init.d
+    touch ${D}${sysconfdir}/xl2tpd.conf
+    install -m 0755 debian/xl2tpd.init ${D}${sysconfdir}/init.d/xl2tpd
+    sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/xl2tpd
+    sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/xl2tpd
+    sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/xl2tpd
+    sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${sysconfdir}/init.d/xl2tpd
+
+    install -d ${D}${sysconfdir}/default
+    install -m 0644 debian/xl2tpd.default ${D}${sysconfdir}/default/xl2tpd
+}
+
+CONFFILES_${PN} += "${sysconfdir}/xl2tpd.conf ${sysconfdir}/default/xl2tpd"
+
+INITSCRIPT_PACKAGES = "${PN}"
+INITSCRIPT_NAME_${PN} = "xl2tpd"
diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb
deleted file mode 100644
index df2ec52c6..000000000
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xl2tpd.inc
-
-# The SRCREV corresponds to v1.3.6.
-# Adding tag=v1.3.6 to the SRC_URI will force access to the upstream repo.
-#
-SRCREV = "5619e1771048e74b729804e8602f409af0f3faea"
-
-- 
2.17.1


