Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2D9C4450C
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:42 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3453.1784112040733874582
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=b482Cjau;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112041; x=1815648041;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9sWVvc6KG797RZQM9XeYyrOV6aAdKErGHsN+6svcxBw=;
  b=b482CjaumpF5Q1YCbKvr31JXvURuWU/kkzaYP2Unvelc6zDlregsxC37
   zsacq5JEyokwpWDVI9h+csl7ufMC0/5GmEzvSSbFr6GxisRpU8Q0BtBWK
   qmKLZWr1d6wlqxG12e+/+lhcmBitE5tqAdphKNy/fXN9IwSOmAmVXxZLL
   T882uSoU17LUwLjY8w1sUOjOAcbZMGIsjw2KaK0LtK9rfKvN4eOJDDWvT
   /nSU5DbqZiI+MqD2voObHgSATfAp/bmfOblPlGs1MMqB45So0JYUYFqmr
   yKCaE20d+etnRcZlHqzb+XxQdSU14CuYTNcgWa3CnwjzFEb3gR6fvGjFE
   Q==;
X-CSE-ConnectionGUID: TL5vyot6TB6uuVyk6cQA8w==
X-CSE-MsgGUID: Fx9NrVXOQV+RWX1Gkgcbaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="233681264"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="233681264"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:39 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E7E26C00569
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:38 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 9DCC4148CE4E
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id B70E41801122;
	Wed, 15 Jul 2026 10:40:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 40/44] xrefresh: upgrade 1.1.0 -> 1.1.1
Date: Wed, 15 Jul 2026 18:39:10 +0800
Message-ID: <20260715103914.2120-40-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128213

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xrefresh_1.1.0.bb => xrefresh_1.1.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xrefresh_1.1.0.bb => xrefresh_1.1.1.bb} (80%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xrefresh_1.1.0.bb b/meta-oe/recipes-graphics/xorg-app/xrefresh_1.1.1.bb
similarity index 80%
rename from meta-oe/recipes-graphics/xorg-app/xrefresh_1.1.0.bb
rename to meta-oe/recipes-graphics/xorg-app/xrefresh_1.1.1.bb
index 12d05b1307..f9a8d42ef2 100644
--- a/meta-oe/recipes-graphics/xorg-app/xrefresh_1.1.0.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xrefresh_1.1.1.bb
@@ -9,5 +9,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dad633bce9c3cd0e3abf72a16e0057cf"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[sha256sum] = "29ed592d5ece35a3029004d8c46f3002f92970870a96c11e38baf7f1122b8b5f"
+SRC_URI[sha256sum] = "e947048130f6300e8be86573af8f225b486884fac14fcfe01bd913b41fa73bd3"
 SRC_URI_EXT = "xz"
-- 
2.43.0


