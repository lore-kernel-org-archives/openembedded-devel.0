Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA886C47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 02:00:34 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.1784.1705975231268899888
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 18:00:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="146790729"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="146790729"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 11:00:29 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D2334E8D4F
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 11:00:26 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 10859D5C21
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 11:00:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F69B6B4C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 11:00:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 31AE11A006A;
	Tue, 23 Jan 2024 10:00:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] smemstat: upgrade 0.02.12 -> 0.02.13
Date: Tue, 23 Jan 2024 10:00:01 +0800
Message-Id: <1705975201-26484-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.004
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPauLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXJHJYd0Pq1bt6NaiJ1YmdvFfzJmg2OC6qKITq
	++hQdG2Jpm2MAWTU+VCofJHdk4ES7yfowbLpoj0o/0ubXNI5BLfH7U7ErY7L/+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 02:00:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108426

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../smemstat/{smemstat_0.02.12.bb => smemstat_0.02.13.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/smemstat/{smemstat_0.02.12.bb => smemstat_0.02.13.bb} (90%)

diff --git a/meta-oe/recipes-devtools/smemstat/smemstat_0.02.12.bb b/meta-oe/recipes-devtools/smemstat/smemstat_0.02.13.bb
similarity index 90%
rename from meta-oe/recipes-devtools/smemstat/smemstat_0.02.12.bb
rename to meta-oe/recipes-devtools/smemstat/smemstat_0.02.13.bb
index 46dc94154..bf5c52fe5 100644
--- a/meta-oe/recipes-devtools/smemstat/smemstat_0.02.12.bb
+++ b/meta-oe/recipes-devtools/smemstat/smemstat_0.02.13.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "ncurses"
 
 SRC_URI = "git://github.com/ColinIanKing/smemstat.git;protocol=https;branch=master"
-SRCREV = "72efeb08ccdb22f57054279d25e3c522e8e1d4c3"
+SRCREV = "1edc560602aa116b96408110b8b9d66a4edef60e"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


