Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872E4C05052
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:28 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.7628.1690875731007171006
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="126412265"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="126412265"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:19 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F488DE636
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:17 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 94016D9487
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:16 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2328910211;
	Tue,  1 Aug 2023 16:42:16 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-configargparse: upgrade 1.5.5 -> 1.7
Date: Tue,  1 Aug 2023 15:41:39 +0800
Message-Id: <1690875717-21608-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10-2.873700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrc103KQHKHukp9n6NFANS676p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGAN6i+va16uBqd
	FRjHdIbixfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzRdYX0ZGgFkMJHr
	b4jwWVaBiT6nuMKU47GtrJfoUbDHENovyQBmF045HyNdhUdSUWe8M7iOxbprLdFcc5ZmzvQLANj
	CmlTN/IiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104180

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 added several missed global variables from the argparse module

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-configargparse_1.5.5.bb => python3-configargparse_1.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-configargparse_1.5.5.bb => python3-configargparse_1.7.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-configargparse_1.5.5.bb b/meta-python/recipes-devtools/python/python3-configargparse_1.7.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-configargparse_1.5.5.bb
rename to meta-python/recipes-devtools/python/python3-configargparse_1.7.bb
index 7d3a5fba5f..2eab701c8a 100644
--- a/meta-python/recipes-devtools/python/python3-configargparse_1.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-configargparse_1.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bw2/ConfigArgParse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=da746463714cc35999ed9a42339f2943"
 
-SRC_URI[sha256sum] = "363d80a6d35614bd446e2f2b1b216f3b33741d03ac6d0a92803306f40e555b58"
+SRC_URI[sha256sum] = "e7067471884de5478c58a511e529f0f9bd1c66bfef1dea90935438d6c23306d1"
 
 PYPI_PACKAGE = "ConfigArgParse"
 
-- 
2.34.1


