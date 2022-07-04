Return-Path: <yue.tao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A607DC43334
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 08:03:39 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.69693.1656921809355174879
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 01:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.146.13,
 mailfrom: yue.tao@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 26483S33008204
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 4 Jul 2022 01:03:28 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 4 Jul 2022 01:03:28 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 4 Jul 2022 01:03:28 -0700
Received: from pek-ytao-d1.wrs.com (128.224.34.179) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 4 Jul 2022 01:03:27 -0700
From: Yue Tao <yue.tao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <yue.tao@windriver.com>
Subject: [meta-oe][master][kirkstone][PATCH] dlt-daemon: upgrade to commit
 6a3bd901d8 to fix CVE-2022-31291
Date: Mon, 4 Jul 2022 16:03:25 +0800
Message-ID: <20220704080325.14346-1-yue.tao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Jul 2022 08:03:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97681

From: Yue Tao <Yue.Tao@windriver.com>

The upstream commit fcb676a79d introduced new option
WITH_DLT_ADAPTOR_UDP to select dlt-adaptor-udp.service instread of
WITH_DLT_ADAPTOR, so update the PACKAGECONFIG.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
---
 meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
index 2cea50dfb..7a613bcc9 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https;branch=master \
            file://0004-Modify-systemd-config-directory.patch \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
            "
-SRCREV = "0138c00811c86eab4ff6bff3c6528163885ade19"
+SRCREV = "6a3bd901d825c7206797e36ea98e10a218f5aad2"
 
 PV .= "+2.18.9git${SRCPV}"
 
@@ -27,7 +27,7 @@ S = "${WORKDIR}/git"
 
 LDFLAGS:append:riscv64 = " -latomic"
 
-PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd systemd-watchdog systemd-journal dlt-examples dlt-adaptor dlt-console ', '', d)} \
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd systemd-watchdog systemd-journal dlt-examples dlt-adaptor dlt-adaptor-udp dlt-console ', '', d)} \
  udp-connection dlt-system dlt-filetransfer "
 # dlt-dbus
 
@@ -44,6 +44,7 @@ PACKAGECONFIG[udp-connection] = "-DWITH_UDP_CONNECTION=ON,-DWITH_UDP_CONNECTION=
 # Command line options
 PACKAGECONFIG[dlt-system] = "-DWITH_DLT_SYSTEM=ON,-DWITH_DLT_SYSTEM=OFF"
 PACKAGECONFIG[dlt-adaptor] = "-DWITH_DLT_ADAPTOR=ON,-DWITH_DLT_ADAPTOR=OFF,,dlt-daemon-systemd"
+PACKAGECONFIG[dlt-adaptor-udp] = "-DWITH_DLT_ADAPTOR_UDP=ON,-DWITH_DLT_ADAPTOR_UDP=OFF,,dlt-daemon-systemd"
 PACKAGECONFIG[dlt-filetransfer] = "-DWITH_DLT_FILETRANSFER=ON,-DWITH_DLT_FILETRANSFER=OFF"
 PACKAGECONFIG[dlt-console] = "-DWITH_DLT_CONSOLE=ON,-DWITH_DLT_CONSOLE=OFF,,dlt-daemon-systemd"
 
@@ -58,7 +59,7 @@ SYSTEMD_SERVICE:${PN} = " ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'dlt.
                           ${@bb.utils.contains('PACKAGECONFIG', 'dlt-dbus', 'dlt-dbus.service', '', d)}"
 SYSTEMD_AUTO_ENABLE:${PN} = "enable"
 SYSTEMD_SERVICE:${PN}-systemd = " \
-    ${@bb.utils.contains('PACKAGECONFIG', 'dlt-adaptor', 'dlt-adaptor-udp.service', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'dlt-adaptor-udp', 'dlt-adaptor-udp.service', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'dlt-examples', 'dlt-example-user.service', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'dlt-examples dlt-console', 'dlt-receive.service', '', d)} \
 "
-- 
2.17.1


