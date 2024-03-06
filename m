Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3952C54E5D
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 08:44:17 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.7728.1709714645633307130
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 00:44:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cqddpLqf;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709714652; x=1741250652;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jZ5tYqwT8wt3S4UalXsecbE8dhMtjB90t8//K4o9nTE=;
  b=cqddpLqfWhadgoAD0L9w4RWcmay59qZHqZc+pRKBNUJ10196KsH8f9zG
   xLweMQeRFGD0WgXG6inG8LJP88Neq7jKsLnDh3m9m+YQI94hPpWYfMNio
   HiUZ7Q1V/AhEuUMUTGUpgm6tR8JOJVBrONKBnFdvFG6Q7kHsIw0YfSXTH
   u+Bt3UmnOmHa0CmSSlX3gc/fe97Zqmm7hmIa9wLRysgA7W1UlQ3fIxaX2
   kxOGNHoqL2iVF16EfRWIVMCMXcj/dF8g7vbdX5DtjLGEYdgn7e5wdSUNR
   dVK/aThO2/iZfWtMqGWozvr8cena2I2Q7QTwkMmKJr9E++ALoQVb5fBX6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="151387277"
X-IronPort-AV: E=Sophos;i="6.06,207,1705330800"; 
   d="scan'208";a="151387277"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:44:10 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id AA7B06D030
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:07 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id EB3BFBF3CA
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 835EF2008FF86
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1BDEA1A006A;
	Wed,  6 Mar 2024 16:44:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/26] python3-cbor2: upgrade 5.6.1 -> 5.6.2
Date: Wed,  6 Mar 2024 16:43:15 +0800
Message-Id: <1709714608-19296-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
References: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28234.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28234.006
X-TMASE-Result: 10--1.678100-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrrOCEGIPhtwgGgRu8CzxXGQbo
	TDS3zulAvnCllUJsUcvjc+iG8jrftnqDDsxI37Z8Of/Bx1+MuMJ70npWTCd4Vh//bz4/xYKAEvx
	S9nuqXFK7cu/Std+lTONR01XzZWOf7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5Da5c
	e/HiHRzeyz2v/93Du3BhQWw3lZ+IXymVDB8yZElJ4CIKY/Hg3AaZGo0EeYG96m4/3ODjvukSq2r
	l3dzGQ11YSHOGQtql77Jp2/gOsAl50cHTqaDK5Y8gYOMyFPc8NSG13KUx4rK4E03d3iHh3Ar4rO
	f5WIYGpzNOh98wk3JVcy8WOsY4yXmW1z9vWl8eZTyZ1y9sjWHZLqPOO5dObQxMzMgJrM/hR6Fi1
	pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109153

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fixed __hash__() of the C version of the CBORTag type crashing when there's a
 recursive reference cycle
-Fixed type annotation for the file object in cbor2.dump(), cbor2.load(),
 CBOREncoder and CBORDecoder to be IO[bytes] instead of BytesIO
-Worked around a CPython bug that caused a SystemError to be raised, or even a
 buffer overflow to occur when decoding a long text string that contained only
 ASCII characters
-Changed the return type annotations of cbor2.load() and cbor2.load() to return
 Any instead of object so as not to force users to make type casts

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cbor2_5.6.1.bb => python3-cbor2_5.6.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_5.6.1.bb => python3-cbor2_5.6.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.6.1.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.6.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-cbor2_5.6.1.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_5.6.2.bb
index e2493e4e1..c0987a9a1 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.6.2.bb
@@ -4,7 +4,7 @@ DEPENDS +="python3-setuptools-scm-native"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[sha256sum] = "752130e38644319f3dae7f91fabb08f58bc454ca671b72875e6228d423890efd"
+SRC_URI[sha256sum] = "b7513c2dea8868991fad7ef8899890ebcf8b199b9b4461c3c11d7ad3aef4820d"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


