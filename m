Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A443ACDE009
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:39 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7243.1782378155064613552
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=E4Ncrey3;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378155; x=1813914155;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LFIREHmr521EdyawiLDpMmm8cB10wVplHwFHSnsdikA=;
  b=E4Ncrey3vlPdD6wdACpaG1jldJBWC6ZR+TbHx4aREca4kwjz6UGn7H+X
   LwPP6SuLOW0Ymsf0iFvovhpS6Tqzi7KK9VTut3BKlCfkBSxEao6RSF8Gf
   6Urz+6B8BK0soN4GRwlHtMu8UhAL2nj3GeOFdnc4hwFJqQ5w79rMUgEvM
   olFNpn4cNBq7O3ws2pGQUUXRuV3GoHhRlmxvCsAsiRAQaL87f8hhUJZzR
   Ni5t6nABA8L498gDvjLcycr95vujGjh9m4kY0vvmnTR4e+y9K0jjmXnHM
   kD2/fpD5hxWJtN0kuHQ981VTMfT+f9r/4J7D0sHlUG+i61XWXmHwizIt7
   g==;
X-CSE-ConnectionGUID: SaKnMNPuQwa02DyYvUXIAA==
X-CSE-MsgGUID: xGlT6ouaRN+qW61/FLx4Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="233265767"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="233265767"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:33 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 6B33D1000169
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:33 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 1D0F0C0EEF0
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 3593B1017329;
	Thu, 25 Jun 2026 09:02:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 39/47] python3-svglib: upgrade 1.6.0 -> 2.0.2
Date: Thu, 25 Jun 2026 17:01:19 +0800
Message-ID: <20260625090127.1563-39-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127771

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-svglib_1.6.0.bb => python3-svglib_2.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-svglib_1.6.0.bb => python3-svglib_2.0.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-svglib_1.6.0.bb b/meta-python/recipes-devtools/python/python3-svglib_2.0.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-svglib_1.6.0.bb
rename to meta-python/recipes-devtools/python/python3-svglib_2.0.2.bb
index fc16e3099d..2144ae52dd 100644
--- a/meta-python/recipes-devtools/python/python3-svglib_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-svglib_2.0.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 
 CVE_PRODUCT = "svglib"
 
-SRC_URI[sha256sum] = "4c38a274a744ef0d1677f55d5d62fc0fb798819f813e52872a796e615741733d"
+SRC_URI[sha256sum] = "455e473dbe7066eea55c39de8194a6a3b646b6c37a255700257fd32115ddb218"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


