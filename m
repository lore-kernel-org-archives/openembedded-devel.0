Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB3FC54764
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 09:02:49 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.37567.1708333360522936497
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 01:02:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WWWE2ovN;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708333367; x=1739869367;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uRaaa1A+ocXbNS693vWT7VwnltuZd11RGXd/dnfxRR0=;
  b=WWWE2ovNuxMSrjVePL8FpWGDOZPDVCWt3GtCPmL1lru0RLfnKi9x7H6R
   4qoIxur/fgzYeQJne/sLRZk5z4dY1VOLKXjgMo546td3A4FdrfbMDiS0p
   xdrvlpiK1WM+wP82BTPXxAFLI85Fah5AM+gSvRtmzlU5n3IpBw22EfrUs
   6qmrr51C/b7CBKmHKQJiubivfuR4ckL0vBTOX/4jNX6ohoeSJ9jvNmlri
   Gi9rmX1bpbUfMz4NAGfVcr0Rr/jDVtTW6/GiA9xmnvYF9fhUNgcEY1ZI3
   6QA65bJs/DlAYOQVrLeCg1J0nW3S9pUGKWalac1Bw4dDPjwAMgVLIXuFz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="129068891"
X-IronPort-AV: E=Sophos;i="6.06,170,1705330800"; 
   d="scan'208";a="129068891"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 18:02:45 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CAEB1D772A
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:43 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D1C7CFA5A
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id ACDAA1E9CA1
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:42 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 605FC1A006B;
	Mon, 19 Feb 2024 17:02:42 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/23] python3-awesomeversion: upgrade 23.11.0 -> 24.2.0
Date: Mon, 19 Feb 2024 17:02:18 +0800
Message-Id: <1708333346-17704-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
References: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28200.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28200.006
X-TMASE-Result: 10--1.645600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJon585nKQczq7uce7gFxhKa3zndiJkHFMhLOzl1HPrN3hnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFJWmaZKHrIkAFzVGq9dm1SSMN7
	xhWOkXJA+BbQR/hY8uFLMYwXRlTdRN2SQPd2Sn6fsrH+pR9mSIPsIIA4lbNqc7h8JP52tjOex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 09:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108858

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Implement handling of 0x prefixed hex strings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...esomeversion_23.11.0.bb => python3-awesomeversion_24.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-awesomeversion_23.11.0.bb => python3-awesomeversion_24.2.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-awesomeversion_23.11.0.bb b/meta-python/recipes-devtools/python/python3-awesomeversion_24.2.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-awesomeversion_23.11.0.bb
rename to meta-python/recipes-devtools/python/python3-awesomeversion_24.2.0.bb
index 67b78c9e9..8b19605b1 100644
--- a/meta-python/recipes-devtools/python/python3-awesomeversion_23.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-awesomeversion_24.2.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE.md;md5=92622b5a8e216099be741d78328bae5d"
 
-SRC_URI[sha256sum] = "9146329196f0f045887de6c195730750f8f7a9302d1c149378db73ab5dc468f0"
+SRC_URI[sha256sum] = "47a6dcbbe2921b725f75106a66ab30f26f1f33dbc5e07bc8e1e39d8eb921f53c"
 
 RDEPENDS:${PN} += "python3-profile python3-logging"
 
-- 
2.34.1


