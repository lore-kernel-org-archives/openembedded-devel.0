Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B5711112261
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:15:42 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7218.1775096133229766648
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gWay5ldk;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096133; x=1806632133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vn45F0JMgAmIrfdF0XeD0j3y+XE320j7CE8gHIEw2k4=;
  b=gWay5ldksUAe7aXzOTyTBzXxTwzy2O2A2upKYPPSb0ywNjke8ZMsldVs
   ataUt5tbAImgD1cQk3Vm9KTIWrKpCyLhjIIkmppQXtV5qwZn5FpBMn9Wp
   UxiC/50+61z6vh09kRX/ToKm0Ur60AhBF1UIJzZKG6GDnkdcWTEQt3dcZ
   jMZChJWgmo390YkgtgoiprpJ+lKwn/rPdXrK1TkBb4JVr6jZfEyMIWMDl
   VOgCzXWQmdtOzEZRR2U8SKY0eyx08Sa5CjIaAku7YR1bJO4TCk0sxbY/x
   2GTBAzhv6tMRcDV6qHy7sYCukoWyGjWy0tWhmW6gI4FMjhKaoxsuHqiAV
   A==;
X-CSE-ConnectionGUID: EgLUbfhQSOeCn9eoTCFooQ==
X-CSE-MsgGUID: gH1fjGOuTTurLymDkkLrBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="214501872"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="214501872"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:15:32 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D1DB53FC6
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:31 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 7C77D18915CB
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id EE3821003741;
	Thu,  2 Apr 2026 02:15:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/39] python3-aiohttp: upgrade 3.13.3 -> 3.13.4
Date: Thu,  2 Apr 2026 10:13:31 +0800
Message-ID: <20260402021355.1324-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:15:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125931

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-aiohttp_3.13.3.bb => python3-aiohttp_3.13.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.13.3.bb => python3-aiohttp_3.13.4.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.3.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.4.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.13.3.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.13.4.bb
index 00758a7546..7416b87347 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.3.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "a949eee43d3782f2daae4f4a2819b2cb9b0c5d3b7f7a927067cc84dafdbb9f88"
+SRC_URI[sha256sum] = "d97a6d09c66087890c2ab5d49069e1e570583f7ac0314ecf98294c1b6aaebd38"
 
 CVE_PRODUCT = "aiohttp"
 
-- 
2.43.0


