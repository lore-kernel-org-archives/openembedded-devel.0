Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF6ACD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:39:40 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19021.1779190770021256583
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:39:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KirrxjN8;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190770; x=1810726770;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bQEBoZOub/Ri9z33uVIn8wp/26k/VTzw36io6egvH3U=;
  b=KirrxjN8Ucjq6YwFo9mPjKCfSh1vjg7IiQSFqzI+4yb6Ai299nsxdoUH
   YibbRgQ9scSM3UHOvNzuQSOsNS9N3R4nEFaINCAAD+8iQdNtyZPG46Zz3
   e5aPXcvP8iFF3HL3+8coFEHZ3/N3HrXazp+fQtZlouWPxajeCHiEXs3Xm
   BNG7JzS54fC/xfKb6zDL8fIomWZ3oq+vwTkw1Sq2DBYcg5puVRAPT30KH
   dSOikuBsJAJ36CR8GtuyF4VIayCGKxSLrUAzUVfjpLWRPE7CsB57O2FrV
   3yyGRic7ZpgMfwGX3ik7L98BwHGODjU67JJka/5hi6G2gEUFUWK5oeTaI
   w==;
X-CSE-ConnectionGUID: gN/cJJZHTCmPcCGKraXTzA==
X-CSE-MsgGUID: AL3B1IE4RJmYzZh0olY3pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="227255567"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="227255567"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:39:28 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 216BAC000B2
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:28 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id CD25784F4A6
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 6D1344059BD;
	Tue, 19 May 2026 11:39:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/38] bit7z: upgrade 4.0.11 -> 4.0.12
Date: Tue, 19 May 2026 19:38:44 +0800
Message-ID: <20260519113921.655-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127063

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/7zip/{bit7z_4.0.11.bb => bit7z_4.0.12.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/7zip/{bit7z_4.0.11.bb => bit7z_4.0.12.bb} (98%)

diff --git a/meta-oe/recipes-extended/7zip/bit7z_4.0.11.bb b/meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb
similarity index 98%
rename from meta-oe/recipes-extended/7zip/bit7z_4.0.11.bb
rename to meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb
index fa4f910e05..300d9bc3cc 100644
--- a/meta-oe/recipes-extended/7zip/bit7z_4.0.11.bb
+++ b/meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
     ${@bb.utils.contains('PTEST_ENABLED', '1', d.getVar('SRC_URI_PTEST'), 'file://0001-cmake-disable-dependency-inclusion.patch', d)} \
 "
 
-SRCREV = "82f359371fda5c16c037ac0659b969334816a9c4"
+SRCREV = "9a43c9fb96003141dcb49c82843382a52afec86a"
 
 # ptest dependencies and their revisions
 SRC_URI_PTEST = " \
-- 
2.43.0


