Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC229CCD1BB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:22:39 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.4815.1761099758181481133
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:22:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EDHv8P7G;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099758; x=1792635758;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j84bNBaHgLsad66vydpYrYNOQZHic+rLMTm9/OiJ3sI=;
  b=EDHv8P7GT85D3wJePX0dV9bprFA9mlB/8h1V/l6SvgrbMlUm3SlDJmr0
   RA0l3irfg+3EpulRU42OZ9lWABmOPCfsN5uhx1vu67vnb9FeLKzNYOytn
   dhptvdTwY9IxCEBJ20S1hbLrmvnipjQG6bES9lEW8HTGY/ZA7906FQV+9
   o8O9BOz6l+217fOl3siduCWk6abTUOLMCiYNE6QgsoJB8MDuYEG0sk/Im
   mP0nXsWz6QxwobL6P6qtnNALooXkZmX6XvqLeUtnp/KfBuKMHxSldT9z0
   5OA2N5n/Q3kQZmkri6/qtJUSAEakG2x3y1d/g0QkqLnYazBexQiL1hZiQ
   w==;
X-CSE-ConnectionGUID: ug+ppZS7SAOWUWNwDg7w4Q==
X-CSE-MsgGUID: g8VkwQdrSYKRWyWXCD8ywQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="217274131"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="217274131"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:22:36 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 90C7E100034D
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:36 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 5616810003AE
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id BBE6A82C0E2;
	Wed, 22 Oct 2025 02:22:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/29] ctags: upgrade 6.2.20251012.0 -> 6.2.20251019.0
Date: Wed, 22 Oct 2025 10:21:58 +0800
Message-ID: <20251022022227.226-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251022022227.226-1-wangmy@fujitsu.com>
References: <20251022022227.226-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120849

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20251012.0.bb => ctags_6.2.20251019.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20251012.0.bb => ctags_6.2.20251019.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20251012.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20251019.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20251012.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20251019.0.bb
index 5fec7c2b06..bf94f00d23 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20251012.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20251019.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "e6a4947d6e04001771d4740636f83d34a1d6f281"
+SRCREV = "940751c4c0540d40af90a33e81467746f552b212"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0


