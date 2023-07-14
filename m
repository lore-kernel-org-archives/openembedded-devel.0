Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ECD2C001B0
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 01:01:10 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.8439.1689296468469489448
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jul 2023 18:01:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="112765814"
X-IronPort-AV: E=Sophos;i="6.01,204,1684767600"; 
   d="scan'208";a="112765814"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 10:01:05 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A99A0CD6E5
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Jul 2023 10:01:03 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E2EF714252
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Jul 2023 10:01:02 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 006908798F;
	Fri, 14 Jul 2023 10:01:01 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] wtmpdb: add new recipe
Date: Fri, 14 Jul 2023 09:00:44 +0800
Message-Id: <1689296444-28141-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689296444-28141-1-git-send-email-wangmy@fujitsu.com>
References: <1689296444-28141-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27750.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27750.003
X-TMASE-Result: 10--1.517600-10.000000
X-TMASE-MatchedRID: NGDYxnKYxb0S5iXdhf8hbvLeH1FBnhK0P8UQejhp29qysPB8dBBorez7
	d6pPgEtr+Y0M++nrfr/K24Lrk00g7kwYXRRr2ymnfOaYwP8dcX74qCLIu0mtIK9j7aNnpjtlmBQ
	vLjMBsUFetT2bRd6uiwYUFsN5WfiFqqg2TSZUFr2Vd49c0zgWM4LsLasl5ROh362KccE/Ndavl4
	8WNXODp9hnEsRN7QJ3CyEWguLpjI2PDdTlKvYuyL/HywF9D+dAVeAZ5VSHdZ2bKItl61J/yZ+in
	TK0bC9eKrauXd3MZDXnp/oCJ7rcKVNeI6JwVgV8jV1IxxjftQLJbUKBqlAgjrBGEISWfw1XIYHL
	yWEDo1fy/xH5uChuhHcMLeFODxrHU2FVSFJBi9WqBBhtzPlTslPJnXL2yNYdkuo847l05tDEzMy
	Amsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jul 2023 01:01:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103860

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/wtmpdb/wtmpdb_0.7.1.bb   | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-extended/wtmpdb/wtmpdb_0.7.1.bb

diff --git a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.7.1.bb b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.7.1.bb
new file mode 100644
index 0000000000..c3b97b0630
--- /dev/null
+++ b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.7.1.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Y2038 safe version of wtmp"
+HOMEPAGE = "https://github.com/thkukuk/wtmpdb"
+DESCRIPTION = "last reports the login and logout times of users and when the machine got rebooted."
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=020090a00b69dd2af9ab82eb0003ea2c"
+SECTION = "libs"
+
+SRCREV = "502b19a41c7a3b1b5e70969b18088683825f71f8"
+
+SRC_URI = "git://github.com/thkukuk/wtmpdb.git;branch=main;protocol=https"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig systemd
+
+DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} sqlite3 "
+
+SYSTEMD_SERVICE:${PN} = "wtmpdb-update-boot.service wtmpdb-rotate.service"
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


