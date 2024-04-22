Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42873C10F1A
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 09:16:21 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.13980.1713777369071639966
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 02:16:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PD7gFY92;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713777373; x=1745313373;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vTAHwfCCOfXkKtORnOKtqmj4cQLLdu2MwZ6MCi1BR7k=;
  b=PD7gFY92E53b/eUQ4R7ZY9VgB1BsDCIzVeSq61axnIZGi1qUu8obKiZO
   e8ightC3Tz84Q43KVBfgpVMol2CCwiogLWoQfTARL0doilq1TBRrAlf8N
   sRFPCC5j9UWaoykBVquW3h2T2bydjgy/4pIAiZUmLnoveolnqHY4hJccQ
   oO5DtqhlXa+pPDqSZnZO0Js/nQ1pCRJ+lsq6/kSAl8nnLt/t1/XxELkma
   3BemMX9XUDtnpmak2E9FbgBqYJCS68JvLJJwsLszLd+ocOThQw0+aQU45
   pFKgnxABCSlC3AmrpigW64rb8LmXjGDRlw0f7m7xvu/f4r94ypO6QWf0i
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="144288401"
X-IronPort-AV: E=Sophos;i="6.07,220,1708354800"; 
   d="scan'208";a="144288401"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 18:16:11 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 98F40C6909
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:09 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D8B85D96F0
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6DB4720093278
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 191271A000B;
	Mon, 22 Apr 2024 17:16:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/15] python3-pywbemtools: upgrade 1.2.1 -> 1.3.0
Date: Mon, 22 Apr 2024 17:15:42 +0800
Message-Id: <1713777345-29264-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
References: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28336.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28336.006
X-TMASE-Result: 10--1.026300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrBgA+oehWZhGU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNMKPrF7dK57NuTKBinxl/umAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7Zr8
	geS6TCr9bjJWry/AgsbjeHtTSdJrtfUxbV3tY7waIzB3J3/m3I0lUubJRgZBqS4KV09ov/lbWD+
	/NZTmdSDdZyYfIO5BiCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 09:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110093

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/pywbem/pywbemtools/blob/master/docs/changes.rst

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-pywbemtools_1.2.1.bb => python3-pywbemtools_1.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/pywbemtools/{python3-pywbemtools_1.2.1.bb => python3-pywbemtools_1.3.0.bb} (89%)

diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.2.1.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.3.0.bb
similarity index 89%
rename from meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.2.1.bb
rename to meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.3.0.bb
index c0a5368d1..127aa8b4a 100644
--- a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.2.1.bb
+++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.3.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pywbemtools.readthedocs.io/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 
-SRC_URI[sha256sum] = "d2ad6c383490ddb3bbb0f737d23a07c7e8c345df65f8309bc554d8455cc913dc"
+SRC_URI[sha256sum] = "9d0162b74c0b34d4500c099dddfe518cadc295a1a7bfb0abefa740a134d80fea"
 
 inherit pypi setuptools3
 
-- 
2.34.1


