Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08567C4707B
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 02:50:49 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.11021.1705027844966690418
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jan 2024 18:50:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="145750616"
X-IronPort-AV: E=Sophos;i="6.04,188,1695654000"; 
   d="scan'208";a="145750616"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 11:50:39 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8862FD6186
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 11:50:36 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id BA6F8D3F1E
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 11:50:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 34EEC202D20E6
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 11:50:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A43B61A0070;
	Fri, 12 Jan 2024 10:50:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 1/2] frr: use update-alternatives for ietf-interfaces.yang
Date: Fri, 12 Jan 2024 10:50:23 +0800
Message-Id: <1705027824-28800-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28114.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28114.004
X-TMASE-Result: 10--3.505700-10.000000
X-TMASE-MatchedRID: 9CLtS+2vXX+txhXyTqc02bstbCLHbulS96ryTp77YeGysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLy9zcRSkKatcFBoCgEV4LyfOaYwP8dcX59LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrdmkDuI7ZsFtW5VjWTUsWeQ4awZD4TN4ZOg5Vv2byhXH3c+A3pbcfr0xLB
	09lujvp8O9m2bny1nxD1xPMMf+UC+H0QojRRNuJh0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 02:50:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108230

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/share/yang/ietf-interfaces.yang conflicts between attempted installs of libsmi-yang-0.5.0-r0.cortexa57 and frr-9.1-r1.cortexa57

libsmi also uses the doc 'ietf-interfaces.yang'.
libsmi has a priority of 50.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-networking/recipes-protocols/frr/frr_9.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-protocols/frr/frr_9.1.bb b/meta-networking/recipes-protocols/frr/frr_9.1.bb
index 9db6710d9..5cc19d09d 100644
--- a/meta-networking/recipes-protocols/frr/frr_9.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_9.1.bb
@@ -74,6 +74,11 @@ SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE:${PN} = "frr.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE:${PN} = " ietf-interfaces "
+ALTERNATIVE_LINK_NAME[ietf-interfaces] = "${datadir}/yang/ietf-interfaces.yang"
 do_compile:prepend () {
    sed -i -e 's#${RECIPE_SYSROOT_NATIVE}##g' \
           -e 's#${RECIPE_SYSROOT}##g' ${S}/lib/version.h
-- 
2.34.1


