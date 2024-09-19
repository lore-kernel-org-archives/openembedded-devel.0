Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E29CDD57B
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 03:32:39 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.11425.1726716751774462316
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 20:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=s81nXIep;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726716755; x=1758252755;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vVEtgX3e+rosvMXqJ/LrxLxOwJsQCiKCk4SLmrxwDkM=;
  b=s81nXIepxb/EEmzR7LciK1W4BMcvtrsiE+7+kKEvJSN6boCmbLUGJC72
   17lv4jhcMpcn9hHpnUCHYeJ6AXBnzjT/k/UdFZbsTtkLMIuTHRkKNsj+n
   FUaLSPL879XrOTEn+hjAd0wMsM9wVwy4xtUyPhFGflACZLp2m/RTCR73Q
   E+ZkYx1PnDK84cYypL/TnMiI9a7nlLUmStRmMaHpi//XV2ivsT8dTt2JR
   hWiR7f894AhnWNi9xG2ayufE3eZnn9VJ2v6HVwVYRYw4RhK4f2Ladnv2G
   BaqTms2csCzqxFdKIEPu9T2G0+B7sSqZGeqBfdaCOvXQP3j/r/Z4/0J3P
   A==;
X-CSE-ConnectionGUID: jPuiBeyWQ1i/vmucqLsnkQ==
X-CSE-MsgGUID: jcgVmgR0Q/iV7mzlAV6U3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="174296131"
X-IronPort-AV: E=Sophos;i="6.10,240,1719846000"; 
   d="scan'208";a="174296131"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:32:34 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6155ADB3C9
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:32 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 79DC9D5104
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EE7AE228921
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 98F811A000A;
	Thu, 19 Sep 2024 11:32:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/28] python3-filelock: upgrade 3.16.0 -> 3.16.1
Date: Thu, 19 Sep 2024 11:31:55 +0800
Message-Id: <1726716733-14548-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
References: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28672.004
X-TMASE-Result: 10-1.473700-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOMKPrF7dK57MQhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXJb1aXG9drHOIDeTpC9EQGUyBJXyOI7RuZ5Th
	yd0SXLn9ZH1z57u9dZwZSyl908KMSJtjzXFIx+KwCDHr8VE+TyFOwMvVsf0Lr+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 03:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112372

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 CI improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-filelock_3.16.0.bb => python3-filelock_3.16.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.16.0.bb => python3-filelock_3.16.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.16.0.bb b/meta-python/recipes-devtools/python/python3-filelock_3.16.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-filelock_3.16.0.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.16.1.bb
index 0aac54a15..abafa1245 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.16.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://py-filelock.readthedocs.io/"
 LICENSE = "Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 
-SRC_URI[sha256sum] = "81de9eb8453c769b63369f87f11131a7ab04e367f8d97ad39dc230daa07e3bec"
+SRC_URI[sha256sum] = "c249fbfcd5db47e5e2d6d62198e565475ee65e4831e2561c8e313fa7eb961435"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1


