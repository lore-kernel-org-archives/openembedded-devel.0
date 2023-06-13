Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27DE8C88CBA
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:40:53 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.3822.1686620448318528945
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:40:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="108391007"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="108391007"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:40:47 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 53163E05A2
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:45 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D41AF807
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:44 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2685D20074724;
	Tue, 13 Jun 2023 10:40:44 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-eth-account: upgrade 0.8.0 -> 0.9.0
Date: Tue, 13 Jun 2023 09:40:01 +0800
Message-Id: <1686620422-29962-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10-0.426100-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yXg2y0j5vXZGSc4iQ7VD4M2U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v+u2GmdldmiUGAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4uTC
	Gw8B573Rjzi4QSb+TgZrC8kQxHnrKTgMg2r1Q/dsgVCvIfmuFwzAER/O9BjX8NF+/6sHcdspIJg
	OVyH0ITVYc2fBoq1u+CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103230

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2023

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-eth-account_0.8.0.bb => python3-eth-account_0.9.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-eth-account_0.8.0.bb => python3-eth-account_0.9.0.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-account_0.8.0.bb b/meta-python/recipes-devtools/python/python3-eth-account_0.9.0.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-eth-account_0.8.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-account_0.9.0.bb
index bb82168b3..e33b7679c 100644
--- a/meta-python/recipes-devtools/python/python3-eth-account_0.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-account_0.9.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "Assign Ethereum transactions and messages with local private keys."
 HOMEPAGE = "https://github.com/ethereum/eth-account"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=287820ad3553117aa2f92bf84c219324"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=16ffc86adf4293d4cfb204e77d62cfe6"
 
-SRC_URI[sha256sum] = "ccb2d90a16c81c8ea4ca4dc76a70b50f1d63cea6aff3c5a5eddedf9e45143eca"
+SRC_URI[sha256sum] = "5f66ecb7bc52569924dfaf4a9add501b1c2a4901eec74e3c0598cd26d0971777"
 
 inherit pypi setuptools3
 
-- 
2.34.1


