Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E0310A1E8C
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:02 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45637.1774526214345241521
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=J6s+vC5A;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526214; x=1806062214;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1TPrVeCY13MJzYmf4elAVGPbx/iTk86S2N9pLRrt/Ho=;
  b=J6s+vC5A9tYDIXUHntS4TBCcIMglaUFQbPuW0m0NuxtxDp/RU/0aLyFs
   XX7N0Nr7dmviH/pZL0t92bIeJQ9n/bPqQVmgnsCpAFbdNk90E6bQIhE2z
   lzeMbR/xQF5Wvs7ecbBslBtvJWms+Bt8uCBGTn4lKCDdCwmoBWMAId+ta
   YyhV3q/ACHMUreakNZYRf9ii2KjwYeUB6nB20GdNozt8dQqHMnY0kEQSI
   6t08cUI/KJUQiP4Wxk9uma2hKaZxSiow/QFhe72GJYAMbCczxa0Qzfksm
   XFenO4G1EiBrG+Yb0MbM5LLYUlqkJDU34lmx4VHNlWvaKRsz42wixvhW8
   A==;
X-CSE-ConnectionGUID: b0iDkJlQQimprDRFNyRsIg==
X-CSE-MsgGUID: J4XSl/VFT8C99E4lBuUlXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="222647243"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="222647243"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:56:52 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 9BF331000343
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:56:52 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 4A1AA18009EA
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:56:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id C0DB2180714D;
	Thu, 26 Mar 2026 11:56:49 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/63] dash: upgrade 0.5.13.1 -> 0.5.13.2
Date: Thu, 26 Mar 2026 19:55:37 +0800
Message-ID: <20260326115634.1199-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125662

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-shells/dash/{dash_0.5.13.1.bb => dash_0.5.13.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-shells/dash/{dash_0.5.13.1.bb => dash_0.5.13.2.bb} (90%)

diff --git a/meta-oe/recipes-shells/dash/dash_0.5.13.1.bb b/meta-oe/recipes-shells/dash/dash_0.5.13.2.bb
similarity index 90%
rename from meta-oe/recipes-shells/dash/dash_0.5.13.1.bb
rename to meta-oe/recipes-shells/dash/dash_0.5.13.2.bb
index 7b4962f614..94a5d87c5d 100644
--- a/meta-oe/recipes-shells/dash/dash_0.5.13.1.bb
+++ b/meta-oe/recipes-shells/dash/dash_0.5.13.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b5262b4a1a1bff72b48e935531976d2e"
 inherit autotools update-alternatives
 
 SRC_URI = "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.gz"
-SRC_URI[sha256sum] = "d9271bce09c127d9866e25c011582ddc75ab988958a04bc4d8553a3b8f30e370"
+SRC_URI[sha256sum] = "e7136826b1eed6ce3193e8affa2f70b1b2b9168dd91ffa7ddb4f46e9e62054fe"
 
 CVE_PRODUCT = "dash:dash"
 
-- 
2.43.0


