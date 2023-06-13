Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E4EC88CBE
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:40:53 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.3822.1686620448318528945
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="108391002"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="108391002"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:40:46 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A97E8DDC65
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:43 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D3BE5D88A6
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:37 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C70820074724;
	Tue, 13 Jun 2023 10:40:37 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] ipcalc: upgrade 1.0.2 -> 1.0.3
Date: Tue, 13 Jun 2023 09:39:52 +0800
Message-Id: <1686620422-29962-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10-0.915800-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr2FA7wK9mP9e3amyQ6US3amlF
	7OhYLlctoiRiRqJbjhYF1Ec/oUIRldAy2LXTI7g3EXjPIvKd74DzWEMQjooUzWAN6i+va16ukWN
	Ccn0XQOLegKf/r6b46i5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO1FwN
	IqCPogbRhVBmnm7g46zMDDNS3Te9c/pp6ssj8DhqXTkIILUVwsKvxF1bosJwKgvRqhUI+8EopJY
	Go1Gwg86wWJlQ4pFbeXl52S2vwb4fIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103227

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- When --no-decorate is given the default output will
  include no colors (#28)
- Correctly split networks with /31 (#25)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/ipcalc/{ipcalc_1.0.2.bb => ipcalc_1.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/ipcalc/{ipcalc_1.0.2.bb => ipcalc_1.0.3.bb} (87%)

diff --git a/meta-networking/recipes-support/ipcalc/ipcalc_1.0.2.bb b/meta-networking/recipes-support/ipcalc/ipcalc_1.0.3.bb
similarity index 87%
rename from meta-networking/recipes-support/ipcalc/ipcalc_1.0.2.bb
rename to meta-networking/recipes-support/ipcalc/ipcalc_1.0.3.bb
index 1b7b68a7a..055c6e143 100644
--- a/meta-networking/recipes-support/ipcalc/ipcalc_1.0.2.bb
+++ b/meta-networking/recipes-support/ipcalc/ipcalc_1.0.3.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://gitlab.com/ipcalc/ipcalc.git;protocol=https;branch=master"
-SRCREV = "4c4261a47f355946ee74013d4f5d0494487cc2d6"
+SRCREV = "c341e55be386649c0a5347eefeae410753c4e753"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


