Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF07C38150
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:36 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.166862.1719305843089878927
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cA4hyLgW;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305849; x=1750841849;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kItoQo1kaa4OEJ90i0f3u3A3sfb0i/eWK58DNXhpjRQ=;
  b=cA4hyLgWu2ub6ncA7ooPnbDb/pSx1SlyB/c3pKWcUVq0so2CkgbHT50+
   DXVDhiPYWeTgNVB9bCuR3Exol7NRR36B1oo3dZDOYt4rkymv3JWWOe6Cs
   8yeNm3AfRRWSOQIRH6EjpRjjLx8kyhNaHZJ0L7cke4D2oDqSymPkJq6ak
   YF5gLAspWRyUtsA+LwXHBIgRlMqvgMrECSRl80co9L2dvL0np+390B2Y9
   ZPXnbrNfwhy5WGbOi6rEn3T5AVr/Cl9jA/7ntab98sPcPLrknCnKuQGMd
   HdX1RdSRI566JLoV7og8Iep5BM3pPjKBACPDfHdN1CnzRTMhcYC33Hs2b
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="164831351"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="164831351"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:27 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C590C9440
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:25 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8C234F769
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 18CA64107B
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B99111A0002;
	Tue, 25 Jun 2024 16:57:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 38/57] python3-parse: upgrade 1.20.1 -> 1.20.2
Date: Tue, 25 Jun 2024 16:56:11 +0800
Message-Id: <1719305790-11484-38-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10-0.713400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrAWQaZTMSP86U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8QhNjZQYyI3FCedixYXzOra/1
	DMOwpv9fi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFCz2iw6d6RBAe8yMU15rNhknvV
	rG2nfOSy3mHg1VJQVTP2aAmPTFceIqhJ3W1H+NC0JNs9p/VY1+4/rNNVB2dDyeMPkjWUwFTex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111051

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 allow hyphen in field name.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-parse_1.20.1.bb => python3-parse_1.20.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-parse_1.20.1.bb => python3-parse_1.20.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-parse_1.20.1.bb b/meta-python/recipes-devtools/python/python3-parse_1.20.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-parse_1.20.1.bb
rename to meta-python/recipes-devtools/python/python3-parse_1.20.2.bb
index d2b91b3f3..6e7139bfb 100644
--- a/meta-python/recipes-devtools/python/python3-parse_1.20.1.bb
+++ b/meta-python/recipes-devtools/python/python3-parse_1.20.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/r1chardj0n3s/parse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8ab458ad281b60e6f1b39b3feafbfc05"
 
-SRC_URI[sha256sum] = "09002ca350ad42e76629995f71f7b518670bcf93548bdde3684fd55d2be51975"
+SRC_URI[sha256sum] = "b41d604d16503c79d81af5165155c0b20f6c8d6c559efa66b4b695c3e5a0a0ce"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.34.1


