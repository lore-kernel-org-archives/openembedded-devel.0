Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5097AC88CBF
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:40:53 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.3819.1686620440878148778
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:40:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="120229179"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="120229179"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:40:45 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C2D83D29E5
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:42 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 08D62D4BF1
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:42 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 864D020074732;
	Tue, 13 Jun 2023 10:40:41 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] mbpoll: upgrade 1.5.0 -> 1.5.2
Date: Tue, 13 Jun 2023 09:39:57 +0800
Message-Id: <1686620422-29962-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10-4.106200-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrWq/snXbxpCBkDFfw8NSG/L6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3LRPJs/q8vyUIY6
	e+Xi1ah9bJcQH3furV3k48PxckV+kHxPMjOKY7A/+HHE8LDNSg8RB0bsfrpPIcSqbxBgG0w4/KK
	xbWibJ9rlhCMJqKkl2XjnjJVJWbTyLpCLHsWUw1PKMRqRADcEyQmwiEopHs8TAiiwAZjNPzQYhI
	6Chr+tOSK40+j1FHTGCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103224

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Fixes Remove FieldTalk trademark

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mbpoll/{mbpoll_1.5.0.bb => mbpoll_1.5.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/mbpoll/{mbpoll_1.5.0.bb => mbpoll_1.5.2.bb} (92%)

diff --git a/meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.0.bb b/meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.2.bb
similarity index 92%
rename from meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.0.bb
rename to meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.2.bb
index 3d1c4f1ee..028a8f9e4 100644
--- a/meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.0.bb
+++ b/meta-oe/recipes-devtools/mbpoll/mbpoll_1.5.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 DEPENDS = "libmodbus (>=3.1.4)"
 
 SRC_URI = "git://github.com/epsilonrt/mbpoll;protocol=https;branch=master"
-SRCREV = "ed00121bfa04afdef2d037aac4f574ad7b410601"
+SRCREV = "a0bd6c08d3d15b086f2104477295c0705aed366a"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


