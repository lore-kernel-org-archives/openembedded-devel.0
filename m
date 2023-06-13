Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 707ACC88CBB
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:41:03 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.3830.1686620458094551998
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:40:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="119840698"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="119840698"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:40:49 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 58D93C53C3
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:47 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 98CAAD9485
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:46 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1A6F420074724;
	Tue, 13 Jun 2023 10:40:46 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-eth-utils: upgrade 2.1.0 -> 2.1.1
Date: Tue, 13 Jun 2023 09:40:04 +0800
Message-Id: <1686620422-29962-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10-0.426100-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yXg2y0j5vXZGSc4iQ7VD4M2U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v+u2GmdldmiUGAN6i+va16uBqd
	FRjHdIbixfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzqxIZBxUqNkKsj4
	w7eXCxSUW7aJeqSVbdTLeEGfh3G6nTeOYTXOJqw0KQsrY6ZVdtEOJenDj3pCOVr7eK3cAfSOk8U
	PkgL0loiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103242

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-eth-utils_2.1.0.bb => python3-eth-utils_2.1.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-eth-utils_2.1.0.bb => python3-eth-utils_2.1.1.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-utils_2.1.0.bb b/meta-python/recipes-devtools/python/python3-eth-utils_2.1.1.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-eth-utils_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-utils_2.1.1.bb
index da45cc7c9..896800a42 100644
--- a/meta-python/recipes-devtools/python/python3-eth-utils_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-utils_2.1.1.bb
@@ -2,9 +2,9 @@ SUMMARY = "Common utility functions for codebases which interact with ethereum."
 HOMEPAGE = "https://github.com/ethereum/eth-utils"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=287820ad3553117aa2f92bf84c219324"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6749008d847c14b9718949c2e24d5c0a"
 
-SRC_URI[sha256sum] = "fcb4c3c1b32947ba92970963f9aaf40da73b04ea1034964ff8c0e70595127138"
+SRC_URI[sha256sum] = "7cccfb0b0749431d0d001e327e9a7289bf07308316a73850ae3895020e5682f4"
 
 inherit pypi setuptools3
 
-- 
2.34.1


