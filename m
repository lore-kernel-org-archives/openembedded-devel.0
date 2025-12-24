Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C8BE75430
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:13:40 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.117298.1766567619421276267
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:13:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YGrRFjmy;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766567619; x=1798103619;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YUqw8yIKoJ1q2pEebI0Mj0GVQd8k+mpwrhW8N3vfpWA=;
  b=YGrRFjmy6xHV9J75GupRi1M/KK9+jY6YMwhiisIjQJy80FFNVIqKpc+A
   oi4QmH23cBDv3FyeRMExydVyOw0ONCXi4fW/YmQDzpB7u7vrZT/tHZ7KL
   TaADo70DkyuyFPSBy/WhaHQUHWX/3Y9D4VbNVQiR+BUO9+s81pdPVM8DT
   GqEFoDYd3o1ifVbYACaPYwNjTvY8Urumk9t55GM2p7F5JOADGByPYbW1q
   7f/ztEhurGd/9A0hG00BWolrMa1IyhotMmb+ePJrdNBV4a4T9X/UBT8No
   +QPr/m8+wcMhFoP30dR+bKISImDj66dd7nZ6pW9ikazbjun+foanGs6HT
   w==;
X-CSE-ConnectionGUID: cOQoO53oRHmc+rxFTHOgBw==
X-CSE-MsgGUID: aWew/6aYQ3CDEwjxaLFJIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="202625749"
X-IronPort-AV: E=Sophos;i="6.21,173,1763391600"; 
   d="scan'208";a="202625749"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 18:13:37 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id ABFB11C0009A
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:13:37 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 5BC811800524
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:13:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.254])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id AA3622000770;
	Wed, 24 Dec 2025 09:13:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/28] libopus: upgrade 1.5.2 -> 1.6
Date: Wed, 24 Dec 2025 17:12:43 +0800
Message-ID: <20251224091304.974-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251224091304.974-1-wangmy@fujitsu.com>
References: <20251224091304.974-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:13:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122857

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libopus/{libopus_1.5.2.bb => libopus_1.6.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/libopus/{libopus_1.5.2.bb => libopus_1.6.bb} (96%)

diff --git a/meta-oe/recipes-multimedia/libopus/libopus_1.5.2.bb b/meta-oe/recipes-multimedia/libopus/libopus_1.6.bb
similarity index 96%
rename from meta-oe/recipes-multimedia/libopus/libopus_1.5.2.bb
rename to meta-oe/recipes-multimedia/libopus/libopus_1.6.bb
index 9f1a79ace2..0e2bf09898 100644
--- a/meta-oe/recipes-multimedia/libopus/libopus_1.5.2.bb
+++ b/meta-oe/recipes-multimedia/libopus/libopus_1.6.bb
@@ -9,7 +9,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4b365c2155d66e550e1447075d6744a5"
 
 SRC_URI = "http://downloads.xiph.org/releases/opus/opus-${PV}.tar.gz"
-SRC_URI[sha256sum] = "65c1d2f78b9f2fb20082c38cbe47c951ad5839345876e46941612ee87f9a7ce1"
+SRC_URI[sha256sum] = "b7637334527201fdfd6dd6a02e67aceffb0e5e60155bbd89175647a80301c92c"
 
 S = "${UNPACKDIR}/opus-${PV}"
 
-- 
2.43.0


