Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D66CF649E
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:43:58 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.48960.1727682237405251243
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Xy2Oq2Of;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682237; x=1759218237;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=fdSRgQTz34b2pez4SS8qvpWwagIYXEWwq4OR5eX4nfg=;
  b=Xy2Oq2OfbIRO438VXmTuMLKQ4sV7Foc9XPHfsPegZM4hzCsqFCpOrd0Q
   49zGrKn6seT5CbmhBMkyXGayFjbPdoKRTLHkITlD33ubBi/MfiZZsusBQ
   dN1u+C0jPYxWjElC+zWC2PBsevwu7XX65uzAnS3WsG9BH0qbuKp4Hrdv2
   C3z0AxO6nz1wDoGOjT4vonUE7FccWsHmerZ+zWr79XoB0m/ZfRyHpvp0r
   JaWqenlF/Rs+UyGRbiJGIMdqrsTS9O7J1LJ4E9CVgaRGsoXc/Z0kyfj3b
   N7z40ftcaGLR76qjJ1Pz1g2+P2G7AfiknqHKu91azGg4K2fLQE0VE+GlA
   Q==;
X-CSE-ConnectionGUID: PerpH+msQjWEeCIQ1vEzsg==
X-CSE-MsgGUID: Lk2/lBYeR+6lqsY5O6w8ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="163553706"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="163553706"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:55 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 564ADD2AB6
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:53 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8F4B5D4C0A
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 228F06B8C2
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C57D01A000A;
	Mon, 30 Sep 2024 15:43:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/40] python3-starlette: upgrade 0.39.0 -> 0.39.1
Date: Mon, 30 Sep 2024 15:42:55 +0800
Message-Id: <1727682185-12664-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10-0.827400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrH/XDVPX7qfKe38zXnNg9QyxX
	wd9S2XGh4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFBvjEJuy8KqbuzybL7jccVjKLn
	qql+4ua2zxJke4nVKtoLfm1xRwS1Atn2ZK05b7tOEI6NcJrRCHWA2SQiNnh5HjO8ZAvS4cmex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:43:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112588

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Avoid regex re-compilation in responses.py and schemas.py
- Improve performance of get_route_path by removing regular expression usage
- Consider FileResponse.chunk_size when handling multiple ranges
- Use token_hex for generating multipart boundary strings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-starlette_0.39.0.bb => python3-starlette_0.39.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-starlette_0.39.0.bb => python3-starlette_0.39.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-starlette_0.39.0.bb b/meta-python/recipes-devtools/python/python3-starlette_0.39.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-starlette_0.39.0.bb
rename to meta-python/recipes-devtools/python/python3-starlette_0.39.1.bb
index c4b3d9916..c01158fc7 100644
--- a/meta-python/recipes-devtools/python/python3-starlette_0.39.0.bb
+++ b/meta-python/recipes-devtools/python/python3-starlette_0.39.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Starlette is a lightweight ASGI framework/toolkit, which is ideal for
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
 
-SRC_URI[sha256sum] = "b35acedae74e95967dd9c0a47b45f5803dcd8973d0d95c18c1abb184845ba42c"
+SRC_URI[sha256sum] = "33c5a94f64d3ab2c799b2715b45f254a3752f229d334f1562a3aaf78c23eab95"
 
 inherit pypi python_hatchling ptest
 
-- 
2.34.1


