Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A9A6E75438
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:14:30 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.117713.1766567668009985724
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:14:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oZxUJbDp;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766567668; x=1798103668;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xZtRNqsRYzz3UuZHqtESYpm0Hq7kpAnlCc8LVXKh/eg=;
  b=oZxUJbDpgxx9CE2k4ir3s3oyXooRKbJkKl9+LfpwJJCaNbxJJEVg28F1
   +d/PDE67VhlDQc07UZ9wG4bcfiQLg5+u1Ooxds0oaM9iytSx8mXEXM+gQ
   SKUKTzK5SbOxaa4NQEYOdblILAboj7IXceQaM3PVEMevGY2D7oAAV2NrI
   jsT5J4zMnATC+2oNgauCymOvPPP3SqBkIcXTJCBQ4YtBlYbTcyDHbDPk/
   V3Lu81uzLYSMAh1gE/7YYJLjeyLSWgnxRZCU3I22Hv4Udlgt9+QOGLQRL
   TjPit2SZRGrMMY1mhpM26XfPhAcZCgSzaUmyUYewMHGgQxfZ3fPz9g68J
   A==;
X-CSE-ConnectionGUID: n6gSbXzjSGGYA6WrRzm9Xw==
X-CSE-MsgGUID: YidFujPIRci8MFOLw1fjYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="223815399"
X-IronPort-AV: E=Sophos;i="6.21,173,1763391600"; 
   d="scan'208";a="223815399"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 18:14:26 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 583BA42A304
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:26 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 017DF1C00133
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.254])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 584C3200074F;
	Wed, 24 Dec 2025 09:14:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/28] python3-humanize: upgrade 4.14.0 -> 4.15.0
Date: Wed, 24 Dec 2025 17:12:53 +0800
Message-ID: <20251224091304.974-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251224091304.974-1-wangmy@fujitsu.com>
References: <20251224091304.974-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122867

From: Wang Mingyu <wangmy@fujitsu.com>

Added
------
- Add locale support for decimal separator in intword
- Add support for Python 3.15

Changed
--------
- Replace pre-commit with prek

Fixed
------
- naturaldelta: round the value to nearest unit that makes sense
- Fix plural form for intword and improve performance
- Replace Exception with more specific FileNotFoundError

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-humanize_4.14.0.bb => python3-humanize_4.15.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_4.14.0.bb => python3-humanize_4.15.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_4.14.0.bb b/meta-python/recipes-devtools/python/python3-humanize_4.15.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-humanize_4.14.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_4.15.0.bb
index d5f81d8ee6..27a7cd022e 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_4.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_4.15.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "2fa092705ea640d605c435b1ca82b2866a1b601cdf96f076d70b79a855eba90d"
+SRC_URI[sha256sum] = "1dd098483eb1c7ee8e32eb2e99ad1910baefa4b75c3aff3a82f4d78688993b10"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


