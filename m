Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631E4C7EE2C
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:58:27 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.6219.1684997898849371629
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:58:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="97363772"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="97363772"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:58:13 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A9AADDC62
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:58:11 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C74F2E4AF8
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:58:10 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 529552008FF8C;
	Thu, 25 May 2023 15:58:10 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-tzlocal: upgrade 4.3 -> 5.0.1
Date: Thu, 25 May 2023 14:57:59 +0800
Message-Id: <1684997886-2137-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997886-2137-1-git-send-email-wangmy@fujitsu.com>
References: <1684997886-2137-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27648.005
X-TMASE-Result: 10-0.741900-10.000000
X-TMASE-MatchedRID: eWs1WpfTtqCjz0nOeth/yUIIxwDaU5mrNoSDavyLMJTPWp1UK7zV92sW
	ZV9YMDBbUoDKDRI6O5mjV8mWfSRFbww8Nmue9wz3nXdphQTSK/JxXefgn/TNQ0Qlv2S0+Igat6R
	3YtfQOkiM1jwFWZwL9Xx4LalWvXBvBoT1RsJmrAVB9I5g6XEpi+EpCHUsKYYGVI7KaIl9Nhejvr
	iAVyhrb+ArY2JkKW9pBdRHP6FCEZVaQiLka9EcSk7nLUqYrlslFIuBIWrdOeMR34ro7k23nafxD
	YuLPebIgZBEjCNOXeIojn9TQ5wiPuVHGbcDbAq6FEUknJ/kEl4YSQiB0ZTudfoLR4+zsDTtqrM4
	6JQnL8gIey4p1kwGGS3PoGgDpnkhvghtMJRGfUXTmRdhOenZ2pqft+8T4shEtjwnfMFpo2rtT7t
	RzNGfxjNuYzg6IBB+2V7jyjpBnjHyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102842

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- The logging info under windows made it look like it looked up the registry
  info even when you had a TZ environment, but it doesn't actually do that.
- Improved the handling of loggers.
- Fixed a bug in the new assert_tz_offset method.
- Change how the system offset is calculated to deal with non-DST
  temporary changes, such as Ramadan time in Morocco.
- Change the default to only warn when the timezone offset and system
  offset disagree (but still not even warn if TZ is set)
- Add the assert_tz_offset() method to the top level for those who want
  to explicitly check and fail.
- Removed the deprecation shim.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tzlocal_4.3.bb => python3-tzlocal_5.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzlocal_4.3.bb => python3-tzlocal_5.0.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-tzlocal_4.3.bb b/meta-python/recipes-devtools/python/python3-tzlocal_5.0.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-tzlocal_4.3.bb
rename to meta-python/recipes-devtools/python/python3-tzlocal_5.0.1.bb
index 37d5ed604..43649bf73 100644
--- a/meta-python/recipes-devtools/python/python3-tzlocal_4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tzlocal_5.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/tzlocal/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=57e0bd61643d81d05683cdce65b11d10"
 
-SRC_URI[sha256sum] = "3f21d09e1b2aa9f2dacca12da240ca37de3ba5237a93addfd6d593afe9073355"
+SRC_URI[sha256sum] = "46eb99ad4bdb71f3f72b7d24f4267753e240944ecfc16f25d2719ba89827a803"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


