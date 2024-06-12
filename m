Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CEDC27C7B
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:46 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.2490.1718161123300457061
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ODTqdcGl;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161123; x=1749697123;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JCXF6oUeEkJmk7otV2qAPtKX89XfqmTarua8zACxTpY=;
  b=ODTqdcGlNF7hs1oBIdP5CQTB+0QsI8WfbG/pwXdJosn1wMVg6td1HTID
   8Vk7hy2pgw4a19Lld3rzxtbkns+xwl32jSQXcqKOUCFfx7zeK3zsCR7eK
   5VduMr9qv3qdN927FJsGRDNcpsnNSkbdInIQIKFYE6fujvFaXTZGxhLP4
   iYr4trc5awByUMsIECo3vkbp2TJThw8np1gdXGbO5XlcnQ0QbajbvxcZT
   QbZ8kO/llmHumKat1KIqfiF+oisw13hQhBPD3f6W826/jv6E7tnNRWVW9
   fdtfak7JCjJ+rEvxGQ82iR3b/Z3l6/S06Tk2Xj2FroSbxESawskgTe309
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="162860612"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="162860612"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:40 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 82180DAE0A
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:38 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C6F35CF7DB
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C5B5E290B
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E57261A0002;
	Wed, 12 Jun 2024 10:58:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/43] python3-hexbytes: upgrade 1.0.0 -> 1.2.0
Date: Wed, 12 Jun 2024 10:57:44 +0800
Message-Id: <1718161096-29710-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10-0.224400-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwwaoe6trQC0SGu
	zVLLKJdOBnXkNYowuNLD68Ptc0ZrHADNPxu11HXjP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6knQ5gytPTKYhMTcdVKb+FeBzEkCCpnRmeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNQQnC7OwmWOEVJcWJBFfKYoXtCIaxZJ40mru+xVabDN9TjZJ8OlYSEqq3OHs4sAzZDA48
	okQYlYMHGr8EeSvI/rqRZOA5SAJpYByMfv2BEtbU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110850

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Add to_0x_hex() method to provide a quick, explicit way to get an 0x-prefixed string
- Change the name of master branch to main
- Merge template updates, notably adding py312 support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-hexbytes_1.0.0.bb => python3-hexbytes_1.2.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-hexbytes_1.0.0.bb => python3-hexbytes_1.2.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-hexbytes_1.0.0.bb b/meta-python/recipes-devtools/python/python3-hexbytes_1.2.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-hexbytes_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-hexbytes_1.2.0.bb
index 951998b5a..b75f7794a 100644
--- a/meta-python/recipes-devtools/python/python3-hexbytes_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-hexbytes_1.2.0.bb
@@ -4,6 +4,6 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=16ffc86adf4293d4cfb204e77d62cfe6"
 
-SRC_URI[sha256sum] = "18e6e3279a13878b93fb85da77822dc506b7048065a588e74141c2468a65ad8c"
+SRC_URI[sha256sum] = "965f1cc712e7b263c41fdf3fb36cf671ba6f59b895937cf33941a5c996ec3a5c"
 
 inherit pypi setuptools3
-- 
2.34.1


