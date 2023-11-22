Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC7BC072A2
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 06:15:55 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.13711.1700633748783838567
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 22:15:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="142082808"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="142082808"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 15:15:46 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 44CA4D9D92
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:15:44 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 72658E49DE
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:15:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A237EE20D6;
	Wed, 22 Nov 2023 15:15:42 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] c-ares: upgrade 1.22.0 -> 1.22.1
Date: Wed, 22 Nov 2023 14:15:09 +0800
Message-Id: <1700633709-7666-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28012.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28012.005
X-TMASE-Result: 10-2.867900-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyv312tVy7FM9b6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3HztJgOULF9rREf
	fVh/puQ5eEP/t8LqgZrc/ZCLk5AauuJXEeLLJ6+yeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNcafH94OWijJexuv7MwThE7+ESvGEFSnohah1je1Xa7AEPSZLLf4sEWOz0y3tqO3eEpyY
	oIrZtOwktV8LHiyfsEWwETaBn/9xzKgHg/t0KH2U8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 06:15:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106990

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Fix /etc/hosts processing performance with all entries using same IPaddress.
-Fix typos in manpages
-Fix OpenWatcom building

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../c-ares/{c-ares_1.22.0.bb => c-ares_1.22.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.22.0.bb => c-ares_1.22.1.bb} (91%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.22.0.bb b/meta-oe/recipes-support/c-ares/c-ares_1.22.1.bb
similarity index 91%
rename from meta-oe/recipes-support/c-ares/c-ares_1.22.0.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.22.1.bb
index 6f6030fcf..8ba1b6099 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.22.0.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.22.1.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fdbc58a6da11a9f68aa73c453818decc"
 
 SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main;protocol=https"
-SRCREV = "9706649cd940b00a20373c0c079ae281beb470fb"
+SRCREV = "36466bb240661fa8fdc2ffa47d229d92ac762286"
 
 UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
 
-- 
2.34.1


