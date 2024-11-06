Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E38D29F90
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:34 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.40139.1730874690487656887
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jyMKHLHt;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874690; x=1762410690;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vkgVvpuwt6cghN+XRW14qTgbgHLZE4bzTSapErWsaew=;
  b=jyMKHLHtiqIoDnA+nsdjRQM5vBYoV62pKJ1RcsU1CjoIM/nR52Wf5PB/
   yk8RGopSeAnirRiBYxLaQ6OO2AxJPceb0lNBnxVj0zJ4XPHnRHpCgIfGR
   2fHu7V0A50/b6jCVv9VC/USXDe9ncZzMKxwBSq04Mxg967NRkGItU3PGk
   fLAqofJkjeKQHjCAOFB/ctDOiYXwqA9YMWRP76u5eFAi9H/wIhGwKwgKP
   0nLgS/AlndTYTNClskVJsPMdWEZz/XEc2XeF5//KgbLVG79wpA2WrQElW
   leHJ3/VFj9Y2dzaH/cPnZvrJ3TBUYCgjmzND+JtXMOBUMl8PWQpnL1uKu
   Q==;
X-CSE-ConnectionGUID: QXUidxmdSNiGFwGy1RrhyA==
X-CSE-MsgGUID: fHwySVSGQouTaezibjxkNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="158171281"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="158171281"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:28 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 074AED9223
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:25 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 47D61D7485
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D2BCB20071A01
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:23 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 81B0B1A000A;
	Wed,  6 Nov 2024 14:31:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/46] python3-pulsectl: upgrade 24.8.0 -> 24.11.0
Date: Wed,  6 Nov 2024 14:30:45 +0800
Message-Id: <1730874660-2364-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10-1.621100-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGEWNbZfbxvwGOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrZ0ISD95D3EinyrZ4d14iAg2aQOPDA0jmlztFOlTI8zOYIeufjXAF80UsZ
	4P+Wf4Z/NZVUg+IOye9Ut0iBEY5p0n5aBVmAwOkh0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113716

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pulsectl_24.8.0.bb => python3-pulsectl_24.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pulsectl_24.8.0.bb => python3-pulsectl_24.11.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pulsectl_24.8.0.bb b/meta-python/recipes-devtools/python/python3-pulsectl_24.11.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pulsectl_24.8.0.bb
rename to meta-python/recipes-devtools/python/python3-pulsectl_24.11.0.bb
index 580d41d0c..bd0e0b960 100644
--- a/meta-python/recipes-devtools/python/python3-pulsectl_24.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pulsectl_24.11.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/mk-fg/python-pulse-control"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f1d10048469ff90123263eb5e214061d"
 
-SRC_URI[sha256sum] = "b051506d0d73d3cc4357cefd3de17bb859d7ecf004e994b0f7cfa87851bc7156"
+SRC_URI[sha256sum] = "0ba32745d3f198d5657af19f7ee3eb007af5a86a306ec3cd45af42e767820d0d"
 
 RDEPENDS:${PN} += " \
 	libpulse \
-- 
2.34.1


