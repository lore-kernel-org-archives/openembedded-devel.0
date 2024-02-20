Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1ECC54E42
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 08:55:03 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.9330.1708419295801558947
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 00:54:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jE28ptTs;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708419296; x=1739955296;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=BNoqvflBKqR2Xin4j8mkn4oTF6GJvEqLxKv/lj61AiY=;
  b=jE28ptTsq16J3Xl/cC66mYylUFug2cx+nja++yqGtCzERr4yCvDqDv2u
   cydMd8jEqIsG/9h9+g/4s71m8N3quKjNEYAKxWJsyUXRUVvIiEsKE089r
   vg/k9YyhKEfFabWyxSqHG7+Nun6mJgBsEGEvxJ1i/kl2lx9+B2sBR9swX
   5ETr9KvhTLt3LDqeZEl74ePXLba3Gg/LNCjqxSB6cCXMkdhD4rtr1/QTt
   JTevz8qX/xrmIKOiR657VJ/4xy6APqan/x/UMvc3c9/jcrNr1wcTpZLYc
   hHJ0CjQdJL/5zD2qr8ODv8IxPHBJ1RE0odKcaMMoRB/LA0oIBA22lQxiY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="149872557"
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="149872557"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:54:54 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C81F94DA4E3
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:52 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 07A4830DAA
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9E9EF6C9D6
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 524501A006B;
	Tue, 20 Feb 2024 16:54:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 06/26] python3-google-api-core: upgrade 2.16.2 -> 2.17.1
Date: Tue, 20 Feb 2024 16:54:21 +0800
Message-Id: <1708419281-26047-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28202.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28202.006
X-TMASE-Result: 10-0.181900-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrStGAgmKqWuUli8Y5a0svL8+1
	6WmVK8+X4K9FmervsqX+kfjo+nx5BG0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO36CZ
	XLlV1mScknkoKV9FdMkL3r7+Iy3k3FVvKfGlXCXYHSky+uyARecoHDidQDys4lCPepKyi2LnpH1
	RSsT/VVzn/sy4rStDxg7A/StwoGl/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108925

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Resolve issue handling protobuf responses in rest streaming

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...gle-api-core_2.16.2.bb => python3-google-api-core_2.17.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-core_2.16.2.bb => python3-google-api-core_2.17.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_2.16.2.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2.17.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-core_2.16.2.bb
rename to meta-python/recipes-devtools/python/python3-google-api-core_2.17.1.bb
index 4d13b2e78..99e7e23c0 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.16.2.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.17.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "032d37b45d1d6bdaf68fb11ff621e2593263a239fa9246e2e94325f9c47876d2"
+SRC_URI[sha256sum] = "9df18a1f87ee0df0bc4eea2770ebc4228392d8cc4066655b320e2cfccb15db95"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.34.1


