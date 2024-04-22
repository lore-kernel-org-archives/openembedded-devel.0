Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9174C07E8F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 09:16:20 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.14071.1713777370176135847
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 02:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=p8LZpnLM;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713777370; x=1745313370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=qH23Abwx6KuMLHRl9hokxRsTI8RmzUSmO0yKDd60JJs=;
  b=p8LZpnLM9YSVLAdobdb0dbD0FCh1ohus+N4btO+izzZTSXguqp3KyYvF
   BZ/IkZnbppdU8JFFvj5oBCCW5Udc7MX8HiIu0M3fOUW+PsU1m91IaJVP6
   oJPtxLID8rd3X8/eOUbDMPlbNHuLRPXhcDHS07XAXzIwIz93QRLH/LGDk
   QFJp3NeMDh0mVx58rjs1J8vMOXvvl5wJJiF37dazB7iWiwYzpxPnNQ9m2
   71tF2S1T7HN1yvL5IpEbAArP4a/kVo0wauEEQcfq++cxQ+vlkIqzN0Df1
   fZnnWoOoaR9+J7QRdQ4MddjyCEYo+ssu7h+tJSOTS/uzwGn7/2VS8yhxB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="144774009"
X-IronPort-AV: E=Sophos;i="6.07,220,1708354800"; 
   d="scan'208";a="144774009"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 18:16:08 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B19DD5004
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:06 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id DA02232488
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 584966BC6F
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:05 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 012201A000C;
	Mon, 22 Apr 2024 17:16:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 06/15] python3-croniter: upgrade 2.0.3 -> 2.0.5
Date: Mon, 22 Apr 2024 17:15:36 +0800
Message-Id: <1713777345-29264-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
References: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28336.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28336.006
X-TMASE-Result: 10-0.854400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRtV4BnlVId1nZsoi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62SyXcK1bvmzyOHkS5tp72bCDyvqZIe+Uq5sXyEVOTFekpFlp
	q/BS4oWlGIYhCkGI+n17hABHt+6vZWTvFKT8DD1bNxUT0mxs5dS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 09:16:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110088

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Support hashid strings in is_valid
-Avoid over-optimization in crontab expansions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-croniter_2.0.3.bb => python3-croniter_2.0.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_2.0.3.bb => python3-croniter_2.0.5.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_2.0.3.bb b/meta-python/recipes-devtools/python/python3-croniter_2.0.5.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-croniter_2.0.3.bb
rename to meta-python/recipes-devtools/python/python3-croniter_2.0.5.bb
index ad80574a9..01ee04840 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_2.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_2.0.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "28763ad39c404e159140874f08010cfd8a18f4c2a7cea1ce73e9506a4380cfc1"
+SRC_URI[sha256sum] = "f1f8ca0af64212fbe99b1bee125ee5a1b53a9c1b433968d8bca8817b79d237f3"
 
 inherit pypi setuptools3
 
-- 
2.34.1


