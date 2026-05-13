Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2672FCD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:10:28 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.119.1778645422315465565
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sggY+K9z;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645422; x=1810181422;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OOUIzPxsfUb/m38ZW+TFh+oOggVd9SMYT0Rej4HeWSI=;
  b=sggY+K9zgjJWK1yDQpvDX/W+Ag0XPr7BNHNJeyOCMIgvrYBPkStaftKl
   Aim6l2euRjgRaIeu0IWGBKoFwyC1lh3zx7pSPPaJEqF96lB2fis7VvEgH
   lRubm7cpc5GSzW9x+5JkYKCo5h6uhlLfXlKJ30gpl4VDpQTx1HutTQbVS
   iCgeHF9aBaelmsvmdHm2prHxLSoCDtWkOam8zN9QZh3i7HrThRgxDkOZf
   UrBXVPYVMj8HUfAfHEPLHUHkQXCKs6c2Gy0rMvKEr7HbgYM8bI+gA5yqA
   ms8TMcNf1AVSeTngvKUSQulqkyos3dzBUDdTt9wGwxezu/zZ/xopvwTnA
   A==;
X-CSE-ConnectionGUID: m8XySgsXQ8mNqFCs5NUmdQ==
X-CSE-MsgGUID: QSTbBDH8Rh+KInBn7EweJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="228214028"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="228214028"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:10:20 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id BFA2510001C6
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:20 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 7BE65C02F1A
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:20 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1D3AC140008D;
	Wed, 13 May 2026 04:10:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 20/56] magic-enum: upgrade 0.9.7 -> 0.9.8
Date: Wed, 13 May 2026 12:05:19 +0800
Message-ID: <20260513040555.377-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126905

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../magic-enum/{magic-enum_0.9.7.bb => magic-enum_0.9.8.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/magic-enum/{magic-enum_0.9.7.bb => magic-enum_0.9.8.bb} (95%)

diff --git a/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb b/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.8.bb
similarity index 95%
rename from meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb
rename to meta-oe/recipes-extended/magic-enum/magic-enum_0.9.8.bb
index 958ae21065..2243ca4e00 100644
--- a/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb
+++ b/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.8.bb
@@ -16,7 +16,7 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRCREV = "7d87efb4a3dddbbe8caa9ca14eff05ede1102ab8"
+SRCREV = "1384769c66bd16ec9bb1353f45fe8ec8ccc12dbd"
 PV .= "+git"
 
 inherit cmake ptest
-- 
2.43.0


