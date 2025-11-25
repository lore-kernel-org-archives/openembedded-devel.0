Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 447D9CFD379
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:17:28 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13260.1764062246254146733
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:17:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mqOCSXQL;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764062246; x=1795598246;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i41oSBjMMbBUOLQIFl4ZZ7woZ41PJ/Bged9wlDSvQGg=;
  b=mqOCSXQLIxZkrE0qF8+/9J4yTEqZ/NOrUfD6CwrO2oga2NpLIRqeb9gD
   p1Z4qqgmnO3UpRmu9U/Y8tdn/SnKt8s2Wj1u8vzZz9Ac+nGC880xqw6Xo
   a/dD3SA1gQ98aRQ+hVF+y00VlZ9By3jYEWTXr+R/vkTPMmO07hFtZdiDJ
   hP0zB1j59ju5VRhINORyBx5WXSP4EaDdEH9tK41iaR69rwSEjgQssl5FU
   qPdovoxYTEmKHjz7L98HDT9VKaWdD73lQv4ZX9bgOaYjnMgBogEjULd3m
   zSb4As0r+fhgB15j9+/hATv5IZbHDoRac3RdBTVNdritju62uTUE74ebC
   w==;
X-CSE-ConnectionGUID: ailCc140Sga9KSxBfd5EqA==
X-CSE-MsgGUID: lsfzJ/hnSW6onLCRPwMa5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="208281486"
X-IronPort-AV: E=Sophos;i="6.20,225,1758553200"; 
   d="scan'208";a="208281486"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 18:17:24 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id B0C5A493
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:17:24 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 658101C0015D
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:17:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 21487101A41A;
	Tue, 25 Nov 2025 09:17:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/26] python3-moteus: upgrade 0.3.95 -> 0.3.96
Date: Tue, 25 Nov 2025 17:17:07 +0800
Message-ID: <20251125091714.1420-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251125091714.1420-1-wangmy@fujitsu.com>
References: <20251125091714.1420-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:17:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122045

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-moteus_0.3.95.bb => python3-moteus_0.3.96.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.95.bb => python3-moteus_0.3.96.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.95.bb b/meta-python/recipes-devtools/python/python3-moteus_0.3.96.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.95.bb
rename to meta-python/recipes-devtools/python/python3-moteus_0.3.96.bb
index 27dd6ef82b..99d36791e1 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.95.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.96.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=9;md5=24025d3c660abfc62a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8607d7c841345ba88fafacc98b820129176e877f5b13176fe5acb4805cc22281"
+SRC_URI[sha256sum] = "b30d63a38bfc834e0bf8154d2f8cead81fbeaee38f14fff0ef2a40f620ed11eb"
 
 S = "${UNPACKDIR}/moteus-${PV}"
 
-- 
2.43.0


