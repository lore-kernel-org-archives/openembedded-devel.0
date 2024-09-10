Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA3C1EDE99B
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:42 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.18598.1725959017466865846
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ElHehToh;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959017; x=1757495017;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ScNeCQkTJWO8NWewGFnhS07PD5mYbmqnO6WKhcbsgTg=;
  b=ElHehTohgpiD/Iy2PfQg0xIhPaenG5O9e3k6jFivfT2GvjOm7FsP1Wh+
   B7FLtEMGRAIgbPoWTN5rwH1g4wHfUfnKrxOrV/CNG3z7TONilbHCk4lFM
   MkV6W48wjOkvWI3zHLCE4DgfMT9aMKpfD0p8tK23BVssS5FUeFVicv3zZ
   3B50RAOhSY50luHEEtefLEwI4S/y5t8y04zygHKxP7CRfjp08XvpjE/I1
   p3KsHxkDu79Hy46ApZl0POsi8y0dQNKEJiXYSg7E3azlHn1CHeIqnlNqS
   dur1ZRjze/Sd7wEMWXuIrCgNpfO3PQMoLYLqPip3h0hMV0ZHa42Tc26gO
   A==;
X-CSE-ConnectionGUID: owlpRToWQb+jLkjj+Kd07Q==
X-CSE-MsgGUID: LM5lAIQlSqqE7D025mTZ7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="152237319"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="152237319"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:35 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 48428DB3C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:33 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D48BD3F0F
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 237DD200894AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CB7B01A01E9;
	Tue, 10 Sep 2024 17:03:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 37/42] python3-yarl: upgrade 1.9.4 -> 1.10.0
Date: Tue, 10 Sep 2024 17:03:05 +0800
Message-Id: <1725958990-5719-37-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10-0.204600-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrrOCEGIPhtwj+Aw16GgqpOy1k
	7y19oijYMMmNIi6fWOcxOKLTAV2DGk9PXwvU8euts0T0PE+KHuVa4WbtOovh4ZQOYBrXJCKAg4T
	d/DBNkVNH2XrR/WQcUtmEyZqfTGgT7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5DubQ
	rtuRQMos6t/lPNkWLxmD7EwRGvQ1l4HMSQIKmdGRMxKDqgAFSzfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtpmd/ehreR4Wx2iO7exJBiyPC/XCd23LXRp0R4WeJbkqjb7pUP7H0OWv/X6AOMf3nuEz8
	j7c1KS7KhVz9DQF8NwykyqtFL76u7u/KFSdfMHzyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgA
	Q4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112224

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fixed joining a path when the existing path was empty
- Added :meth:URL.without_query_params() <yarl.URL.without_query_params> method,
  to drop some parameters from query string
- The previously protected types _SimpleQuery, _QueryVariable, and _Query are
  now available for use externally as SimpleQuery, QueryVariable, and Query
- Replaced all :class:~typing.Optional with :class:~typing.Union
- Significantly improved performance of parsing the network location
- Added internal types to the cache to prevent future refactoring errors

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-yarl_1.9.4.bb => python3-yarl_1.10.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.9.4.bb => python3-yarl_1.10.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.9.4.bb b/meta-python/recipes-devtools/python/python3-yarl_1.10.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-yarl_1.9.4.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.10.0.bb
index 29897b7f1..0ff3041db 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.9.4.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.10.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "566db86717cf8080b99b58b083b773a908ae40f06681e87e589a976faf8246bf"
+SRC_URI[sha256sum] = "3bf10a395adac62177ba8ea738617e8de6cbb1cea6aa5d5dd2accde704fc8195"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.34.1


