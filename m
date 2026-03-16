Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7625F013EF
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 09:07:45 +0000 (UTC)
Received: from mailrelay-egress7.pub.mailoutpod3-cph3.one.com (mailrelay-egress7.pub.mailoutpod3-cph3.one.com [46.30.211.246])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46332.1773652058996696189
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 02:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa2 header.b=JA7CEa7h;
 dkim=pass header.i=@berginkonsult.se header.s=ed2 header.b=dN5jAtVe;
 spf=none, err=SPF record not found (domain: berginkonsult.se, ip: 46.30.211.246, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1773652056; x=1774256856;
	d=berginkonsult.se; s=rsa2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=SNCrFZmD3iEzl7rKaCQcOh4i17LkNF51km5cPSXDAX8=;
	b=JA7CEa7hdWOeF40/OO0NMPbmmZoMhJorxodraTD2YPJ5JaBuuCG45KPsET7wZO9uf2fpjZxGsfVVR
	 6W+YHF2nPuf9J0217uzK6Iz0TCi7sOc6CyV+sFyJdIcbQFNJpwmu6f3s2druTP4g096+9tME5RTzOl
	 ozGD6tsSVqswsO/7aKB0+A3dyfnAiVmBrkJtPr8QH2jcnaMnPBMFMhtv+tTCVzjgBUDBHOMIII3cLe
	 pzA5+ZWREVBH0l+6kCqWdq1d9nmPaDIElvE7+tLR81HzitPZqH3vOi+Jg0tfykkiw1jOioeVFEFbwf
	 pfRgFXEYsEA3OM+V57C8neqKN6zBNog==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1773652056; x=1774256856;
	d=berginkonsult.se; s=ed2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=SNCrFZmD3iEzl7rKaCQcOh4i17LkNF51km5cPSXDAX8=;
	b=dN5jAtVetDeVcX7P3stLpbs/baeMe2n5gA6hsSXEhfFh40DVNK4+3qNsTNzxi7J5O7F5rrL8+ggDU
	 si1JR1oBg==
X-HalOne-ID: 8e45f889-2117-11f1-b697-494313b7f784
Received: from pbkserver2.. (c83-191-168-223.bredband.tele2.se [83.191.168.223])
	by mailrelay6.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 8e45f889-2117-11f1-b697-494313b7f784;
	Mon, 16 Mar 2026 09:07:36 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>
Subject: [PATCH v2 1/2] cpupower: keep header files for other packages and package systemd service
Date: Mon, 16 Mar 2026 10:07:21 +0100
Message-ID: <20260316090722.1184220-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 09:07:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125266

When having a DEPENDS against cpupower it need to leave its header files.
Remove that cleanup that has been present since the beginning of the recipe
without any (to me) known reason.

cpupower ship a systemd service and config file in kernel source tree
since kernel 6.16. Package them as a separate package cpupower-systemd to
be installed if wanted.

Add cpupower to packagegroup-meta-oe to be included in builds of all
packages.

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 .../recipes-core/packagegroups/packagegroup-meta-oe.bb   | 1 +
 meta-oe/recipes-kernel/cpupower/cpupower.bb              | 9 +++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 87f8a1eed5..9fd7af6c08 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -52,6 +52,7 @@ RDEPENDS:packagegroup-meta-oe = "\
 
 RDEPENDS:packagegroup-meta-oe-benchmarks = "\
     bonnie++ \
+    cpupower \
     dbench \
     dhrystone \
     fio \
diff --git a/meta-oe/recipes-kernel/cpupower/cpupower.bb b/meta-oe/recipes-kernel/cpupower/cpupower.bb
index 453ebe8c7f..b453308770 100644
--- a/meta-oe/recipes-kernel/cpupower/cpupower.bb
+++ b/meta-oe/recipes-kernel/cpupower/cpupower.bb
@@ -5,6 +5,8 @@ LICENSE = "GPL-2.0-only"
 DEPENDS = "pciutils gettext-native"
 PROVIDES = "virtual/cpupower"
 
+B = "${WORKDIR}/${BPN}-${PV}"
+
 inherit kernelsrc kernel-arch bash-completion
 
 do_populate_lic[depends] += "virtual/kernel:do_shared_workdir"
@@ -19,17 +21,16 @@ do_compile() {
 
 do_install() {
     oe_runmake DESTDIR=${D} install
-    # Do not ship headers
-    rm -rf ${D}${includedir}
     chown -R root:root ${D}
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
+PACKAGES =+ "${PN}-systemd"
+
+FILES:${PN}-systemd = "${sysconfdir}/cpupower-service.conf ${systemd_unitdir}"
 
 RDEPENDS:${PN} = "bash"
 
 python do_package:prepend() {
     d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
 }
-
-B = "${WORKDIR}/${BPN}-${PV}"

