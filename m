Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51334C55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:18:35 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10306.1785820706624942799
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:18:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=B9Cbmqu1;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785820706; x=1817356706;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aHE/n+EIdgG4BLRa6Ft+cPMLLGf1ogv8BpCHgNIL8UI=;
  b=B9Cbmqu1D7sPhXK8WKoTzZHf/+zHDu4YBB0LRymmmMklrHRnh/zBfA3/
   qI57HzKeMVgxaE2hZ+y/IG3gBugneYDJ4QFk3nw4BxtfSSMPOxlr2p7Sd
   klPN4an6Ok01UHXT1vaFY6QbrIX+fKaSvBwDDiGmapfHSDOmPFpkAqv9i
   hm9oP5+LmkvVwTbUOLWFLP2ou78FvOXPyawObEK3fWej9S13WHc3ad/ZV
   VESKacgWZfIA/NLrC4ZQguGLZphVBlY5R45/pwZxsghV3WlM7NOt526Qn
   VjI/n5zbFL4M9fXMjeUGG9px+bGh/StoDGyOlDUrmekmpckcctedAoLvL
   w==;
X-CSE-ConnectionGUID: uNTdNT7iSEuX33h/5oQLEg==
X-CSE-MsgGUID: DoL+MsHDS8uwilBCKV3VKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="237581582"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="237581582"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:18:24 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id B093BC01B26
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:18:24 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 6522A140736A
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:18:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 61DC91800592;
	Tue,  4 Aug 2026 05:18:22 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/28] python3-engineio: upgrade 4.13.3 -> 4.13.4
Date: Tue,  4 Aug 2026 13:17:12 +0800
Message-ID: <20260804051726.1489-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804051726.1489-1-wangmy@fujitsu.com>
References: <20260804051726.1489-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:18:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128719

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-engineio_4.13.3.bb => python3-engineio_4.13.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-engineio_4.13.3.bb => python3-engineio_4.13.4.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-engineio_4.13.3.bb b/meta-python/recipes-devtools/python/python3-engineio_4.13.4.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-engineio_4.13.3.bb
rename to meta-python/recipes-devtools/python/python3-engineio_4.13.4.bb
index 262715a6bc..21de0c4a25 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_4.13.3.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.13.4.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += " \
 	python3-asyncio \
 "
 
-SRC_URI[sha256sum] = "572b7783e341fed21edbc7cea297ccd378dad79265fdde96aa4664420a7c06c9"
+SRC_URI[sha256sum] = "413cb98d56c62f0f5ef29931592a360d437b82b3fa7ab415da3f6c7d3ebc0cb7"
-- 
2.43.0


