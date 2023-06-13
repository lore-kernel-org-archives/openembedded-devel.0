Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B87C88CB8
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:40:53 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.3819.1686620440878148778
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:40:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="120229186"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="120229186"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:40:48 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0642BE4458
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:46 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 43D47F807
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:45 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C19C420074724;
	Tue, 13 Jun 2023 10:40:44 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-eth-hash: upgrade 0.5.1 -> 0.5.2
Date: Tue, 13 Jun 2023 09:40:02 +0800
Message-Id: <1686620422-29962-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10-4.366100-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yXg2y0j5vXZGSc4iQ7VD4M3fUZT83lbkELeT
	J2+A5e4R+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AMDKjaL38DqBHfiujuTbedh+t
	oLLKXwRGBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNRz4tF/sDU5vwop0UhfR9m/8JTEYna+LVTOh4v5kJYJeXNDoPDFuVwF1/PonYDSINs+nh
	ks8bV5mgED9vpv1Uq3+Q5G3XHfLuDKgHg/t0KH2U8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103231

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eth-hash_0.5.1.bb => python3-eth-hash_0.5.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-eth-hash_0.5.1.bb => python3-eth-hash_0.5.2.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-hash_0.5.1.bb b/meta-python/recipes-devtools/python/python3-eth-hash_0.5.2.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-eth-hash_0.5.1.bb
rename to meta-python/recipes-devtools/python/python3-eth-hash_0.5.2.bb
index 10d6695de..683d84761 100644
--- a/meta-python/recipes-devtools/python/python3-eth-hash_0.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-hash_0.5.2.bb
@@ -2,9 +2,9 @@ SUMMARY = "The Ethereum hashing function, keccak256, sometimes (erroneously) cal
 HOMEPAGE = "https://github.com/ethereum/eth-hash"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=287820ad3553117aa2f92bf84c219324"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3d7bdfe69b1ffbde073ca6e96f5c53f7"
 
-SRC_URI[sha256sum] = "9805075f653e114a31a99678e93b257fb4082337696f4eff7b4371fe65158409"
+SRC_URI[sha256sum] = "1b5f10eca7765cc385e1430eefc5ced6e2e463bb18d1365510e2e539c1a6fe4e"
 
 inherit pypi setuptools3
 
-- 
2.34.1


