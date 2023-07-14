Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DCCCC001DF
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 01:01:00 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.8415.1689296457682303110
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jul 2023 18:00:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="112593538"
X-IronPort-AV: E=Sophos;i="6.01,204,1684767600"; 
   d="scan'208";a="112593538"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 10:00:55 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 180B9CD7E3
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Jul 2023 10:00:53 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 35FD9BF3C6
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Jul 2023 10:00:52 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 45F1587870;
	Fri, 14 Jul 2023 10:00:51 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] lastlog2: add new recipe
Date: Fri, 14 Jul 2023 09:00:42 +0800
Message-Id: <1689296444-28141-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27750.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27750.003
X-TMASE-Result: 10--1.574600-10.000000
X-TMASE-MatchedRID: GQw6Xh/XS6US5iXdhf8hbs2CuVPkCNzuN5dqZcIK7Vgg9R3V8qg5xOz7
	d6pPgEtr+Y0M++nrfr/K24Lrk00g7kwYXRRr2ymnfOaYwP8dcX74qCLIu0mtIK9j7aNnpjtl6o5
	I451FHlqBkESMI05d4nF03j9r9uDDny8X/DSjpXxoMLOoNHsM9jK1/qdbjc7QeGHkpR2WBaLxGV
	LD6h21AbPG2twrRn5MBzEnsRYJlw4vW+23dfanRZ4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyHEqm
	8QYBtMO4cb0NcdeCVcfaXh+90tTbRxrjYHvDfTpkWSVzly/qcT/S1fdPzZu7+yv7drZYbJmeH1p
	Smra1Xe7pnmqMPdN8BZ1Y8edzCkKgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jul 2023 01:01:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103858

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lastlog2/lastlog2_1.1.0.bb                | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-extended/lastlog2/lastlog2_1.1.0.bb

diff --git a/meta-oe/recipes-extended/lastlog2/lastlog2_1.1.0.bb b/meta-oe/recipes-extended/lastlog2/lastlog2_1.1.0.bb
new file mode 100644
index 0000000000..cc60a46899
--- /dev/null
+++ b/meta-oe/recipes-extended/lastlog2/lastlog2_1.1.0.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Y2038 safe version of lastlog"
+HOMEPAGE = "https://github.com/thkukuk/lastlog2"
+DESCRIPTION = "lastlog reports the last login of a given user or of all users who did ever login on a system."
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=020090a00b69dd2af9ab82eb0003ea2c"
+SECTION = "libs"
+
+SRCREV = "585153a577788c590370d20e40263b61238dfab3"
+
+SRC_URI = "git://github.com/thkukuk/lastlog2.git;branch=main;protocol=https"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig systemd
+
+DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} sqlite3 "
+
+SYSTEMD_SERVICE:${PN} = "lastlog2-import.service"
+
+EXTRA_OEMESON = " -Dpamlibdir=${libdir}"
+
+do_install:append () {
+      # Fix makefile hardcoded path assumptions for systemd (assumes $prefix)
+      # without usrmerge distro feature enabled
+      install -d `dirname ${D}${systemd_unitdir}`
+      mv ${D}${prefix}/lib/systemd `dirname ${D}${systemd_unitdir}`
+}
+
+FILES:${PN} += " ${systemd_system_unitdir} "
+FILES:${PN} += " ${libdir} "
-- 
2.34.1


