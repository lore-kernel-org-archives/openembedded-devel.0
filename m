Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC8EC4450C
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:39:50 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3415.1784111987273040188
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=X2G96ckP;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784111989; x=1815647989;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wB+BAReNPhVBMJgxlew+Act6KqEceddjQ1CuO0Mp/2w=;
  b=X2G96ckP0Qid2mJ1V+6CaR/hHRY8QX/jxsFhmwpqYQyfVyox6ItYg9ks
   bxYO7AbbnaLREs9/RZeKk9/DhmdNk+FU1SbsiBIaCK/Q/4wXwtqE5si1q
   Qu5IkyHxSelAcNHJw7y9x+oOeSPCginnvMSIsogQu8k1ANKxdjrdW48aS
   wZ2+eJQ3pLwk4aOxd9PYb7XM/yPgi1LLU9XPNS1c2oLw43QOxce2OXwKq
   lQcq74dFkAKMqKNzy/ibnbWUp260TYvyAwp0haPIV/HW2YDNxtZldww5M
   Bn3GPiZcx7l21AnnMfD1utARSYBeFH2c+5pr//tmlD4AmMOLOT4tL0spq
   Q==;
X-CSE-ConnectionGUID: FqygqPx7TpeZlrRn+4T2GA==
X-CSE-MsgGUID: JtbiimPoQ5exrlR6TiFcMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="247518881"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="247518881"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:39:49 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 956E21C00094
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:48 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 3D69E1C0014F
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 444D7180113F;
	Wed, 15 Jul 2026 10:39:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 08/44] postfix: upgrade 3.11.4 -> 3.11.5
Date: Wed, 15 Jul 2026 18:38:38 +0800
Message-ID: <20260715103914.2120-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128181

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../postfix/{postfix_3.11.4.bb => postfix_3.11.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.11.4.bb => postfix_3.11.5.bb} (99%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.11.4.bb b/meta-networking/recipes-daemons/postfix/postfix_3.11.5.bb
similarity index 99%
rename from meta-networking/recipes-daemons/postfix/postfix_3.11.4.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.11.5.bb
index 1877c3c187..66dc620a3a 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.11.4.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.11.5.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0001-Fix-build-with-musl.patch \
            "
 
-SRC_URI[sha256sum] = "226ec59a18e43e277691005e31496f7608b9ba9210be600a267fb217a4a6cee9"
+SRC_URI[sha256sum] = "4a6ab3d0e9390989fa201fc6c446045fc702c4e16e7a247c3ae261c9e9bee610"
 
 UPSTREAM_CHECK_URI = "https://www.postfix.org/announcements.html"
 UPSTREAM_CHECK_REGEX = "postfix-(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


