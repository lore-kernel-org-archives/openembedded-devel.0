Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F3DF0182B
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 11:39:37 +0000 (UTC)
Received: from mailrelay-egress7.pub.mailoutpod3-cph3.one.com (mailrelay-egress7.pub.mailoutpod3-cph3.one.com [46.30.211.246])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67239.1772797169368140658
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Mar 2026 03:39:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa2 header.b=gLQuYuVQ;
 dkim=pass header.i=@berginkonsult.se header.s=ed2 header.b=2x3bC+hy;
 spf=none, err=SPF record not found (domain: berginkonsult.se, ip: 46.30.211.246, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1772797167; x=1773401967;
	d=berginkonsult.se; s=rsa2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=SNCrFZmD3iEzl7rKaCQcOh4i17LkNF51km5cPSXDAX8=;
	b=gLQuYuVQAV9Ixwzk79umjOUewHWZkSQntcl0R//noahyYXQb2CZP7evRN6Weaf88l8dSLxSRjyzmz
	 REwCSBqZolQ9kJoVBzaeV2Nay+LpdLt3yzBSsm5LaEbk+xVXdNI+QijOwRfdQpo7Y5Aru3QKq8y1xr
	 YYq+qaw3DtEeQIAOQO4SNAJJ58LNfrXEeH1JJHziRhA9dO8p39pz4JZSiOH+T96qiVxibAq3FCPEfO
	 rLy8PHZ1qplxAVwlFOO6YJ6YBW6NGOQMxEhtvo0JyjruyEQhmF+uBRWc+DGkfAjdJQev6A6BDHQqIV
	 Om8on4aYiHoHKeTwgMsGIXsFwLKcwig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1772797167; x=1773401967;
	d=berginkonsult.se; s=ed2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=SNCrFZmD3iEzl7rKaCQcOh4i17LkNF51km5cPSXDAX8=;
	b=2x3bC+hy6ezq/QsWhyNyHBVzWDU6U/+7zCZzcrf1D2QaDq1Ka3urLTyxASR53E8tyotTN5t+LYVIn
	 BflpB3ACA==
X-HalOne-ID: 1f3b1d0e-1951-11f1-a392-81a63d10fb2d
Received: from pbkserver2.. (c83-191-168-223.bredband.tele2.se [83.191.168.223])
	by mailrelay5.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 1f3b1d0e-1951-11f1-a392-81a63d10fb2d;
	Fri, 06 Mar 2026 11:39:26 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>
Subject: [meta-oe][PATCH 1/2] cpupower: keep header files for other packages and package systemd service
Date: Fri,  6 Mar 2026 12:39:21 +0100
Message-ID: <20260306113922.3319380-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 11:39:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124903

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

