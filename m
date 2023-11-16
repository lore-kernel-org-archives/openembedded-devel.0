Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C467AC47071
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:37:46 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.2933.1700123858935052749
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:37:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="119279613"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="119279613"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:37:37 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9060AD7AE5
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:37:34 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C723BF4CD
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:37:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AC03F6B80D;
	Thu, 16 Nov 2023 17:37:32 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-tomlkit: upgrade 0.12.2 -> 0.12.3
Date: Thu, 16 Nov 2023 16:33:08 +0800
Message-Id: <1700123588-22554-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28000.003
X-TMASE-Result: 10-3.586400-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrJ4cwIYL6Kud+ovg8NDYPAr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIMay5jJvrxqM1vZ
	7s3YIVDKbepuhA18xJM5462iIVZCxrWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNZdacNh8njm70Twom803BUf7ALuwH7q46tb8/xcAEzgs6drOaI6YIDbRN9uR9GF7kNup+
	vxedjOx+j7V32273JJKz9Elx1uOfJltc/b1pfHmU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:37:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106801

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Improve the performance when parsing a table with nested dotted keys.
-Keep the newlines when replacing a table. 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-tomlkit_0.12.2.bb => python3-tomlkit_0.12.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tomlkit_0.12.2.bb => python3-tomlkit_0.12.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-tomlkit_0.12.2.bb b/meta-python/recipes-devtools/python/python3-tomlkit_0.12.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-tomlkit_0.12.2.bb
rename to meta-python/recipes-devtools/python/python3-tomlkit_0.12.3.bb
index bbc5356d8..89acd7777 100644
--- a/meta-python/recipes-devtools/python/python3-tomlkit_0.12.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tomlkit_0.12.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/tomlkit/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=31aac0dbc1babd278d5386dadb7f8e82"
 
-SRC_URI[sha256sum] = "df32fab589a81f0d7dc525a4267b6d7a64ee99619cbd1eeb0fae32c1dd426977"
+SRC_URI[sha256sum] = "75baf5012d06501f07bee5bf8e801b9f343e7aac5a92581f20f80ce632e6b5a4"
 
 inherit pypi python_poetry_core ptest
 
-- 
2.34.1


