Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA2D9C021B4
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.46627.1739178121940360202
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jp1hkjOE;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178122; x=1770714122;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=mOzxJ5joWoR+3HEy5SsDgzTjbyihGR2Lof3r8VqffsA=;
  b=jp1hkjOEFtugtkAXmMg0KIQ0W92NU/OJc+7/FeAuEVsGpefcs55N9yGc
   rAJX+nvu9CYobMka7B/bhD2i5siDu2Qq8XrahT7YjPlwSe1wRK57zOImK
   mXYAhG8s1LAXM4yRLovYoGgg4HIH/S5i34pFPqIQtL4CCUK1mwAQg1E+H
   pPDGX2Sp1Cixd8GOT4GCI791pll+07zTgyMMGwNBi9f4xuDIprWkn6IM6
   /CE9SOZDgXxyXNxQ1Sx04WgzBf6ATdO72fT91xWhg51a7ypJzlnTEEdPX
   vsMfrPgXzNDr82W4Cw4W0QdoJ6RyRyhTlQk1bVnCLqP72xmhaxiM1TptU
   A==;
X-CSE-ConnectionGUID: OOYkJwQpQeutGx76X7zxZw==
X-CSE-MsgGUID: zVeUzNNvRV27IbiuEmf7/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="189490517"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="189490517"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:00 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A7CABD6EA1
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 69C1F10361
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:57 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2E4BF1A006C;
	Mon, 10 Feb 2025 17:01:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/66] python3-eth-utils: upgrade 5.1.0 -> 5.2.0
Date: Mon, 10 Feb 2025 17:01:02 +0800
Message-Id: <1739178095-26432-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115361

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025

Changelog:
===========
- Update types in 'is_same_address' to accept 'AnyAddress', 'str', or 'bytes'.
- Add Python 3.13 support and other misc. template updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-eth-utils_5.1.0.bb => python3-eth-utils_5.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-eth-utils_5.1.0.bb => python3-eth-utils_5.2.0.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-utils_5.1.0.bb b/meta-python/recipes-devtools/python/python3-eth-utils_5.2.0.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-eth-utils_5.1.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-utils_5.2.0.bb
index 6561e7cf65..435d032a84 100644
--- a/meta-python/recipes-devtools/python/python3-eth-utils_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-utils_5.2.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "Common utility functions for codebases which interact with ethereum."
 HOMEPAGE = "https://github.com/ethereum/eth-utils"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6749008d847c14b9718949c2e24d5c0a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d3f53e7cc5bf80b16eff1f4a38c73182"
 
-SRC_URI[sha256sum] = "84c6314b9cf1fcd526107464bbf487e3f87097a2e753360d5ed319f7d42e3f20"
+SRC_URI[sha256sum] = "17e474eb654df6e18f20797b22c6caabb77415a996b3ba0f3cc8df3437463134"
 
 PYPI_PACKAGE = "eth_utils"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


