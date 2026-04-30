Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116C6CD13DA
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:49:47 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17425.1777546173502871540
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kQjQ6aUW;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546177; x=1809082177;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZDJ+rHFywOu6pmtdGMXS33L0CDa7nru1sCvwqsiDvsM=;
  b=kQjQ6aUWTT1+vvu3wfuNaowqYFruA+KkBjDIpeFi/VOtFq66jpGR36y1
   8lbhpmPg5YtBEL8yswJvoy7H4GUjpRUX1zWDGBzH+Zm7iIj2zZIVg1yQl
   JCzqzdZ8aOCW2Qh9zm2UdlnLM3ZpQBagtuf7rUCW2zLg21LrjeSJP6ar3
   sc2xbBnEGRHsSzk4+c+JdbT0JQwmTBWxgo71ZkOjYpCf6N3WKX0sEazOl
   geXnwjplz7yvbpqnaL2S2PW3zAIUdTePEipjr/KVFzN1IgJ3Yhog3b4n/
   QVrXvMXI8GZGKxUnUJam6b0BHQAViSVIuxcgLYiWM/T6P+6e/qer6Pp1T
   A==;
X-CSE-ConnectionGUID: SaksfVLdRaO0V0Faux7iXA==
X-CSE-MsgGUID: c8kmLNryTQqiMzs/Hl0S7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="226100944"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="226100944"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:49:36 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 76F5F1002BAD
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:36 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 2FBCBC0022B
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id C2C51180113C;
	Thu, 30 Apr 2026 10:49:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/64] dash: upgrade 0.5.13.2 -> 0.5.13.3
Date: Thu, 30 Apr 2026 18:48:24 +0800
Message-ID: <20260430104924.1106-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126675

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-shells/dash/{dash_0.5.13.2.bb => dash_0.5.13.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-shells/dash/{dash_0.5.13.2.bb => dash_0.5.13.3.bb} (90%)

diff --git a/meta-oe/recipes-shells/dash/dash_0.5.13.2.bb b/meta-oe/recipes-shells/dash/dash_0.5.13.3.bb
similarity index 90%
rename from meta-oe/recipes-shells/dash/dash_0.5.13.2.bb
rename to meta-oe/recipes-shells/dash/dash_0.5.13.3.bb
index 94a5d87c5d..48533e908a 100644
--- a/meta-oe/recipes-shells/dash/dash_0.5.13.2.bb
+++ b/meta-oe/recipes-shells/dash/dash_0.5.13.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b5262b4a1a1bff72b48e935531976d2e"
 inherit autotools update-alternatives
 
 SRC_URI = "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.gz"
-SRC_URI[sha256sum] = "e7136826b1eed6ce3193e8affa2f70b1b2b9168dd91ffa7ddb4f46e9e62054fe"
+SRC_URI[sha256sum] = "a83727c1299ac4c3d9d43979393b3a4eb00275d5636ae02526e7979d51d6fbd1"
 
 CVE_PRODUCT = "dash:dash"
 
-- 
2.43.0


