Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD9CC02196
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:31 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.32747.1737360862298976228
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gj9va/iG;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360862; x=1768896862;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pANaSpV5A3Aqqy0V/5KRGaZOartF4qhw1ssYI8S5HZE=;
  b=gj9va/iGlYyZ2wdiT2Vew9mHICJZ9I4UKjAU0tt16sj5sV9RClZ2Axb9
   G4D+7+4vZ5ASFA5/5i9NvWVLLQGB3gnezYvIJJPuv660TWhFvS25kdKaM
   a+81HB0ZDl7FLErTBxjhlj5OvD3lgvI4ovBKWD3NF1FjYsQIz6+Fg5dpn
   kvasB3iiSBNInt4ce0dSqCwed5dD21//nZXB2la3bWcQtkJfqt3LcV19+
   cz6U03aLNXUKcj2ZJsMeZREoPhag1jnoVUITTMf/LcjxIIxaP1oYL/8/M
   c8CvBPynwVnjryb2ruJ28J/T5OcIuvzWgrCjhFmN92NrGblDH4/C5kQ5s
   g==;
X-CSE-ConnectionGUID: JGQ8Nd2WQ0yIvrYH9fqjJQ==
X-CSE-MsgGUID: wbFdWUg/RO+1fWxBa9AdsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="187354169"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="187354169"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:20 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0556A9674B
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:18 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D0CDCCFBC2
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 683CF20071A22
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:17 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 27E2A1A0071;
	Mon, 20 Jan 2025 16:14:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/32] python3-hexbytes: upgrade 1.2.1 -> 1.3.0
Date: Mon, 20 Jan 2025 16:13:54 +0800
Message-Id: <1737360846-4824-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10--2.085300-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yXg2y0j5vXZGlEDhvi2wR879wRnyxuPjhA88
	0Lzc32ISX9t4w91/vrYScHHX0rLXBO1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKJE7BLYUytncIhMTcdVKb+FeBzEkCCpnRmeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNfDnlS9vpNnZvSYfmwjInJczUuxUazODoHzBUQTmOC+66+R7M3eETUAlh1jRJ7JIhmwMz
	QxSTzxBeFycoNvxzXdYogQ0RcBmkDIuZWQlOWCUU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114982

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025

Changelog:
===========
- Merge template, adding py313 suppport and removing bumpversion for bump-my-version
- Bump towncrier dep from >=21,<22 to >=24,<25

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-hexbytes_1.2.1.bb => python3-hexbytes_1.3.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-hexbytes_1.2.1.bb => python3-hexbytes_1.3.0.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-hexbytes_1.2.1.bb b/meta-python/recipes-devtools/python/python3-hexbytes_1.3.0.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-hexbytes_1.2.1.bb
rename to meta-python/recipes-devtools/python/python3-hexbytes_1.3.0.bb
index c8e34fc401..f3cb7d7b8a 100644
--- a/meta-python/recipes-devtools/python/python3-hexbytes_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-hexbytes_1.3.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "Python bytes subclass that decodes hex, with a readable console outpu
 HOMEPAGE = "https://github.com/ethereum/hexbytes"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=16ffc86adf4293d4cfb204e77d62cfe6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a26e64020156e806cf0054a6d504b301"
 
-SRC_URI[sha256sum] = "515f00dddf31053db4d0d7636dd16061c1d896c3109b8e751005db4ca46bcca7"
+SRC_URI[sha256sum] = "4a61840c24b0909a6534350e2d28ee50159ca1c9e89ce275fd31c110312cf684"
 
 inherit pypi setuptools3
 
-- 
2.43.0


