Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C57E69EAB
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:16:59 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.8203.1733185015403613953
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:16:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=i5LW1oNI;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185017; x=1764721017;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=oEULbfuPtZUVYjyf9+4SfbUt9wKsZ4jrwzebtZVCzbg=;
  b=i5LW1oNICwtNj3DmVRA+CU65eQ1dnS2iqE2/tlbuF7N116twgsK41ypM
   FGliGboJPyFfC8IYczBnSDiOuaYWTRr5fv6c4O0wurhQMUdLIXdgDqmOJ
   NK0MWvCsZfQMSHoitAqGJ78HRouuOrB60tuCDMNKWSdW1vsYkofCMd2Ou
   sPgp8TTwN3znN7Mjt9GGoifsi4x/HAxDxgRI2RqwrkG+28ph/S81kPOog
   Terat73gGUmSU7hWmJsnFm18a4CUMixQZVcWvtHkltZLy75EC+Rpdd7Uo
   SU1EhvmvTngtgLyEfYvKAYQQe7huCNnLj8JqrrrWLx2rmwZO5NEsGUBeK
   Q==;
X-CSE-ConnectionGUID: fDCfozcsQsSUXWibdVuAUA==
X-CSE-MsgGUID: xZn0G+MrQueWVa/LE0xUIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="170368320"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="170368320"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:16:56 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B202896742
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:54 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8950410433
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E9C3520071A06
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:53 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8655B1A0003;
	Tue,  3 Dec 2024 08:16:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/34] python3-aiohttp: upgrade 3.10.11 -> 3.11.8
Date: Tue,  3 Dec 2024 08:16:18 +0800
Message-Id: <1733184999-27041-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10--0.878900-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGOYGRpv0VVRxuce7gFxhKa2YkAyCbA7KV5soi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62SNZ30fFdf9A1urjoA5FxyTWvvIY+h1xp0lUluUqnExW0OgJ
	lCPgutEqmSWDYeGWnugUTIBUNO8FNeQsaYOPNqKyHjNnaJbHGOS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114154

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{python3-aiohttp_3.10.11.bb => python3-aiohttp_3.11.8.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.10.11.bb => python3-aiohttp_3.11.8.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.10.11.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.11.8.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.10.11.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.11.8.bb
index 23ee568f02..9c4720daf2 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.10.11.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.11.8.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "9dc2b8f3dcab2e39e0fa309c8da50c3b55e6f34ab25f1a71d3288f24924d33a7"
+SRC_URI[sha256sum] = "7bc9d64a2350cbb29a9732334e1a0743cbb6844de1731cbdf5949b235653f3fd"
 
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi
-- 
2.34.1


