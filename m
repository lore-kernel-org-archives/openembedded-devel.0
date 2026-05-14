Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05AE1CD4846
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 03:43:37 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2851.1778730210741592286
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2026 20:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Um+FtOu7;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778730211; x=1810266211;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Wcu4hAi3Tf5CNIq32t2bTqyvSKZAxwtnEkPdsaMUdLY=;
  b=Um+FtOu7R6WOpoLMKyPCsQg3KiiUIhMnyISrph900Y7cNG35Lnykl3qd
   XKkxMYganQFrRJYBycLZzcyI72nk8gp+rreCcVvy3SDhm+4hpnfTF1Lkm
   U345JT3ENkVo9ogjHNAjaitg6wEnBwA2WBpd86/2PJ6d99I54JF4j6vZZ
   diZGLlRYQYs1wMPz7S26WsD/QtFvQ6w4uM+uZbu2OpKA1eTcV/Wb4JzVH
   9NwwsyW8yPlq+ReglPpwct0QJpMNLeBlEMzLLnn1EELS4lxUW9FipkPi0
   VtJhV34hfbEXbbsQdQZCIeGkOEaJAorNx//EcuOIF/L4r3ZwnZL1suYPJ
   Q==;
X-CSE-ConnectionGUID: YpaBrmsWQQar+UcW0EfX+Q==
X-CSE-MsgGUID: 2sI9JWHpQj2qlTwPKfVEvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="240440220"
X-IronPort-AV: E=Sophos;i="6.23,234,1770562800"; 
   d="scan'208";a="240440220"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 12:43:29 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id C39DF1C000A0
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 03:43:28 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 77FF31800EA5
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 03:43:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id C1A70821205;
	Thu, 14 May 2026 03:43:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] magic-enum: upgrade 0.9.7 -> 0.9.8
Date: Thu, 14 May 2026 11:43:21 +0800
Message-ID: <20260514034321.578-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 03:43:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126983

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../magic-enum/{magic-enum_0.9.7.bb => magic-enum_0.9.8.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-extended/magic-enum/{magic-enum_0.9.7.bb => magic-enum_0.9.8.bb} (94%)

diff --git a/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb b/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.8.bb
similarity index 94%
rename from meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb
rename to meta-oe/recipes-extended/magic-enum/magic-enum_0.9.8.bb
index 958ae21065..fa608bdffb 100644
--- a/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb
+++ b/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.8.bb
@@ -16,8 +16,7 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRCREV = "7d87efb4a3dddbbe8caa9ca14eff05ede1102ab8"
-PV .= "+git"
+SRCREV = "1384769c66bd16ec9bb1353f45fe8ec8ccc12dbd"
 
 inherit cmake ptest
 
-- 
2.43.0


