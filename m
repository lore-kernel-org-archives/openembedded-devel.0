Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA7FCDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:38:39 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.116022.1698050318942685353
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:38:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="138661995"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="138661995"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:38:37 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7EF7CCA1E4
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:38:34 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B90BD5020
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:38:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AFE8E6BA7B;
	Mon, 23 Oct 2023 17:38:32 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-email-validator: upgrade 1.3.1 -> 2.0.0
Date: Mon, 23 Oct 2023 16:38:17 +0800
Message-Id: <1698050297-25335-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10-1.973800-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mr9pLnYtQ99xLMApOK4R8F4oIB
	CrHXdfvc4K9FmervsqX6AyQYfGtr/W0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2h+t
	oLLKXwRGBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNfkYqJmlI9niY2CymcjXBFZiSgmOrbJYIvTaJ0oqmrChnvqaYIuGngYpR3E9qHpNTAj5d
	utxzdptkDF1A5Zo1f67NWyc896nAvzs1/e9oUcoU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105659

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/JoshData/python-email-validator/blob/main/CHANGELOG.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...mail-validator_1.3.1.bb => python3-email-validator_2.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-email-validator_1.3.1.bb => python3-email-validator_2.0.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-email-validator_1.3.1.bb b/meta-python/recipes-devtools/python/python3-email-validator_2.0.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-email-validator_1.3.1.bb
rename to meta-python/recipes-devtools/python/python3-email-validator_2.0.0.bb
index 2350c4d758..74e08b82ce 100644
--- a/meta-python/recipes-devtools/python/python3-email-validator_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-email-validator_2.0.0.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "CC0-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=65d3616852dbf7b1a6d4b53b00626032"
 
-SRC_URI[sha256sum] = "d178c5c6fa6c6824e9b04f199cf23e79ac15756786573c190d2ad13089411ad2"
+SRC_URI[sha256sum] = "f4904f4145c11f8de5897afbb8d7db4b465c57f13db1c8c106c16d02bceebd9a"
 
 PYPI_PACKAGE = "email_validator"
 
-- 
2.34.1


