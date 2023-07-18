Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE50C00528
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:27 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.689.1689654379725723008
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="124880152"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="124880152"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:23 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C8C35DDC63
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:20 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 05A51D8B9E
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:20 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D084200854E2;
	Tue, 18 Jul 2023 13:26:19 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] smemstat: upgrade 0.02.11 -> 0.02.12
Date: Tue, 18 Jul 2023 12:25:44 +0800
Message-Id: <1689654348-30702-42-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZOdKnCeVjjIZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SgNOfwOsQarZMoiCaoIWFHkU+CpE2Op9pk1FX6RW9Y1g8q4
	W/5LjTvfWz5w6FuvKnI6d7NWa43JeQaI306iLWjxczK8+wwzn2S7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103932

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../smemstat/{smemstat_0.02.11.bb => smemstat_0.02.12.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/smemstat/{smemstat_0.02.11.bb => smemstat_0.02.12.bb} (90%)

diff --git a/meta-oe/recipes-devtools/smemstat/smemstat_0.02.11.bb b/meta-oe/recipes-devtools/smemstat/smemstat_0.02.12.bb
similarity index 90%
rename from meta-oe/recipes-devtools/smemstat/smemstat_0.02.11.bb
rename to meta-oe/recipes-devtools/smemstat/smemstat_0.02.12.bb
index 21f315b1c2..46dc94154d 100644
--- a/meta-oe/recipes-devtools/smemstat/smemstat_0.02.11.bb
+++ b/meta-oe/recipes-devtools/smemstat/smemstat_0.02.12.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "ncurses"
 
 SRC_URI = "git://github.com/ColinIanKing/smemstat.git;protocol=https;branch=master"
-SRCREV = "9eea7504ab33783d804c4ed9237e299effb68874"
+SRCREV = "72efeb08ccdb22f57054279d25e3c522e8e1d4c3"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


