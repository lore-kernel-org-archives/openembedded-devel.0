Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75988C4450F
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:21 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3445.1784112012103649167
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=L0o/0Iuq;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112012; x=1815648012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wnsElOOEQG3/S7x5Vs6utareHGXNW5TM5mBR00c1liQ=;
  b=L0o/0Iuqhp8jqrOI22xnvu5pQRK6fciiK43pg22EzPjjt1XkyOziJ/C1
   b/SwFAx5GFapp8rh+TeJZWro8lflJe2UC/0/IZUL7Aps4hzUo75iJBc45
   ALE2QvwidkVZIboc1E5l6ZzqLeEQ1negFUNfdQgCd9PTW4MYqKcFIe1cL
   Y4kzHeEt2zQqsqFWXH4LtH6hbpVLYE5bStrUYiHgbu5gP41Kehtk271wx
   gLXjWZuEgh3zDITrovrVxg0VXiKi1LbYGx8WgPRb66BFsFwHEsIRblePR
   hvMGRbeGleME5dZPnqk+EqAJ+3VKUcDIbfVwF1bRMsTlP1Vxng1/s/rUt
   A==;
X-CSE-ConnectionGUID: sZc0XaCKR1iSmwY7TgraNQ==
X-CSE-MsgGUID: lK0xPoA8SD6gs4BL91a0fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="233681215"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="233681215"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:10 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 7EC9A1C0169D
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:10 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 35D7B148CE52
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 4FE40180113F;
	Wed, 15 Jul 2026 10:40:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/44] python3-huey: upgrade 3.1.1 -> 3.2.1
Date: Wed, 15 Jul 2026 18:38:52 +0800
Message-ID: <20260715103914.2120-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128195

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-huey_3.1.1.bb => python3-huey_3.2.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_3.1.1.bb => python3-huey_3.2.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_3.1.1.bb b/meta-python/recipes-devtools/python/python3-huey_3.2.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-huey_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-huey_3.2.1.bb
index 185549fe91..080ecf5c11 100644
--- a/meta-python/recipes-devtools/python/python3-huey_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_3.2.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 PYPI_PACKAGE = "huey"
 
-SRC_URI[sha256sum] = "156f30e90f0fae81ae2e004f2062e1b18ec9dcbc684564df63159ef546b13502"
+SRC_URI[sha256sum] = "79cd63d117e5b8da2de58420dcde4e2d0f963e362d67a9b3872ce565eec5c3dc"
 
 RDEPENDS:${PN} += " \
 	python3-datetime \
-- 
2.43.0


