Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6DAC4450F
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:32 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3449.1784112024848809544
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JwBqkE4j;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112025; x=1815648025;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aaicwPyh4EKtjgXPo7gK2X51hgADntU0skURNZ8Jm60=;
  b=JwBqkE4j9HEUT/rkLAhNzAGOgP7oe25nIbwju1h78kemmxCqXlthhAD+
   kFx0o5jey10BGp5aDIsYQNiD/uv4UouBRf1JHWX86LlPMQU19/Nt2OOCY
   65nlzpdIUDaoj+6yy5w0F0xKbd6Cd7fIopMtOzUP9EFh9uDFz/r4O7YU5
   4qhuTa7onSy4wtdhczHsLc5U/QOHu83pe6/YXXcyTy6NePv+9Z9zIP1bI
   23vuhzMUAR2DihO0XF++d1qO16F0kZZd13ul/KPeS9USZJCSb1g7ubJHq
   xG2rv72AG0+7ed7eRcVqZcwAh00fkKV3TPlc849An3Ge6zBRp4RDTbAyp
   Q==;
X-CSE-ConnectionGUID: j1jAANlHSrCkG5HPyQLAHQ==
X-CSE-MsgGUID: jg8jY40iRyupyN03mlKsaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="225218938"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="225218938"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:23 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4C2532B88
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:23 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id EAF91C0343E
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id F11A2180113F;
	Wed, 15 Jul 2026 10:40:20 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/44] python3-tqdm: upgrade 4.68.3 -> 4.68.4
Date: Wed, 15 Jul 2026 18:39:00 +0800
Message-ID: <20260715103914.2120-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128203

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- trim to ncols even when '{bar}' not in bar_format
- fix tqdm.write when stdout=None

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tqdm_4.68.3.bb => python3-tqdm_4.68.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.68.3.bb => python3-tqdm_4.68.4.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.68.3.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.68.4.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.68.3.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.68.4.bb
index 333455a3d4..c556741846 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.68.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.68.4.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=9a9bed097dea538bf341c8623c8f8852"
 
-SRC_URI[sha256sum] = "00dfa48452b6b6cfae3dd9885636c23d3422d1ec97c66d96818cbd5e0821d482"
+SRC_URI[sha256sum] = "19829c9673638f2a0b8617da4cdcb927e831cd88bcfcb6e78d42a4d1af131520"
 
 CVE_PRODUCT = "tqdm"
 
-- 
2.43.0


