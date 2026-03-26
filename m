Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C69B510A3D7A
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:58:04 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45667.1774526282427332392
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Av1TQ1Hr;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526282; x=1806062282;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XlYYSYJdMz15Zd5OdSNVgFNSP6RVPkooocqqNVShHrY=;
  b=Av1TQ1HrOJa5PSzgGvkZgniAzxU+GW5ebGxvM2RuHJk9bPG3CJVd+UAk
   iH/6QvNyhc9g6TmPwS9J6TssXkXq/0uzMb4n00XCAO+L5SwWvLHbl39/i
   F3uWK++A6EfiEwsULYTzmh40pSmVJ3kR/jdpURKxOINOzbExQBzInTpA6
   Pcm1mCfuvjI2oo5tFHl4MgMbtRY2WYgMOhQM8VCB5zn4ueaqcjunjZM4n
   nKzsYXiDgDljxpzNN7rDsPxtoL2NQ1//PDT3anCEosNd1Mxy+VLUHonYo
   qnhR29gloUVjNvPnR5kx/Y9Tm9a0VDX7mEAQfQg1t7E+9Dh8+mtnw18Tc
   w==;
X-CSE-ConnectionGUID: aT7Lbc2aSG2KKFUYrhEu6A==
X-CSE-MsgGUID: DTl8VgVCTC2It/JJJ709Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="213520874"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="213520874"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:58:00 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id EE6321C001BF
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:00 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id A1A84101B172
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 08FF71807149;
	Thu, 26 Mar 2026 11:57:57 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 50/63] python3-sentry-sdk: upgrade 1.45.1 -> 2.55.0
Date: Thu, 26 Mar 2026 19:56:20 +0800
Message-ID: <20260326115634.1199-50-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125705

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_1.45.1.bb => python3-sentry-sdk_2.55.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.45.1.bb => python3-sentry-sdk_2.55.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.45.1.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.55.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.45.1.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_2.55.0.bb
index 10fdbce139..ac57d3b0ac 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.45.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.55.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	python3-datetime \
 "
 
-SRC_URI[sha256sum] = "a16c997c0f4e3df63c0fc5e4207ccb1ab37900433e0f72fef88315d317829a26"
+SRC_URI[sha256sum] = "3774c4d8820720ca4101548131b9c162f4c9426eb7f4d24aca453012a7470f69"
 
 PYPI_PACKAGE = "sentry_sdk"
 
-- 
2.43.0


