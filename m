Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 160E2C04E69
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:27 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.739.1689654382117899190
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="124851889"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="124851889"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:15 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C67F7FB7F
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:13 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C530ED88D8
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:12 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 560DC20077821;
	Tue, 18 Jul 2023 13:26:12 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-frozenlist: upgrade 1.3.3 -> 1.4.0
Date: Tue, 18 Jul 2023 12:25:30 +0800
Message-Id: <1689654348-30702-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10--0.299100-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrGEfoClqBl86U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v9uTKBinxl/umAN6i+va16uBqd
	FRjHdIbixfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzi6EuxaB5wf/1WP
	UrAhz59i2n89pvB2NX/rTFOV+TtlEMrbFex6dznPrAxbEaBn7y1JLtKO82l/wxTnR93dbGmLAsY
	cdr6tC/iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103929

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
 Removed an unused :py:data:'typing.Tuple' import
 Dropped Python 3.7 support.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-frozenlist_1.3.3.bb => python3-frozenlist_1.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-frozenlist_1.3.3.bb => python3-frozenlist_1.4.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-frozenlist_1.3.3.bb b/meta-python/recipes-devtools/python/python3-frozenlist_1.4.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-frozenlist_1.3.3.bb
rename to meta-python/recipes-devtools/python/python3-frozenlist_1.4.0.bb
index 0cd23ab7a8..340b0e3845 100644
--- a/meta-python/recipes-devtools/python/python3-frozenlist_1.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-frozenlist_1.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/frozenlist"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf056e8e7a0a5477451af18b7b5aa98c"
 
-SRC_URI[sha256sum] = "58bcc55721e8a90b88332d6cd441261ebb22342e238296bb330968952fbb3a6a"
+SRC_URI[sha256sum] = "09163bdf0b2907454042edb19f887c6d33806adc71fbd54afc14908bfdc22251"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


