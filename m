Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5088D6ACC1
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:04:12 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37574.1766048644265359540
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:04:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AfMBCE7X;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048646; x=1797584646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l+bRE/55LVCvcyPn9CUpClBIv/c1bjMdp5OjIe9TeLc=;
  b=AfMBCE7XNspe6tKNQ/JD7CdSBM19gGFDOVrQsY1aqDeHsjEYeJmMfHBP
   OWicf8KVe0lpAW5+7bWG14Mi0IYrzC7c217F0EzZK/wxx6TYBvUdHblts
   8UtwxChC87UiQkgj7MkcqrzZLHy6lz85J4bkgn8LAklpnR7713Hw0dGlS
   qxCGh8Lo7TBanSzVVo1pBKVY3HjnpzQUCdMdk6PXH2nQezP2tMGGtFDGB
   VwvUWQsKK7PZF1pIs+Pm2NwvJWnFi9hmjN4A6aRkjMLV8oRJVepXfSh+Z
   XmSKqFmhtE43fSSSseDIhMOWO6u6wiz9LSe2f3f89uCwu15s7bVH+8k5b
   g==;
X-CSE-ConnectionGUID: ma8NujyiS1KP7t1U5B3nNA==
X-CSE-MsgGUID: rOe1thueQcqeYGLRLBXGcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="227016400"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="227016400"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:04:06 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id BD7261000373
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:05 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 773D9C00FCB
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 13B02101E528;
	Thu, 18 Dec 2025 09:04:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/20] osinfo-db: upgrade 20250606 -> 20251212
Date: Thu, 18 Dec 2025 17:03:33 +0800
Message-ID: <20251218090346.735-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251218090346.735-1-wangmy@fujitsu.com>
References: <20251218090346.735-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122741

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{osinfo-db_20250606.bb => osinfo-db_20251212.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libosinfo/{osinfo-db_20250606.bb => osinfo-db_20251212.bb} (86%)

diff --git a/meta-oe/recipes-support/libosinfo/osinfo-db_20250606.bb b/meta-oe/recipes-support/libosinfo/osinfo-db_20251212.bb
similarity index 86%
rename from meta-oe/recipes-support/libosinfo/osinfo-db_20250606.bb
rename to meta-oe/recipes-support/libosinfo/osinfo-db_20251212.bb
index 33e17234ce..441e440467 100644
--- a/meta-oe/recipes-support/libosinfo/osinfo-db_20250606.bb
+++ b/meta-oe/recipes-support/libosinfo/osinfo-db_20251212.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "osinfo-db-tools-native"
 
-SRC_URI = "git://gitlab.com/libosinfo/osinfo-db.git;branch=main;protocol=https"
+SRC_URI = "git://gitlab.com/libosinfo/osinfo-db.git;branch=main;protocol=https;tag=v${PV}"
 
-SRCREV = "62f8adceb8ee88e643a134f2cfaf04fc11b9fc51"
+SRCREV = "70fe571c605541e7be76b50f430c1cd13959c5b9"
 
 
 inherit allarch autotools-brokensep
-- 
2.43.0


