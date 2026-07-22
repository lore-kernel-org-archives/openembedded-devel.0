Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 610CCC4453E
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:23:39 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44771.1784715810215204671
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TLI0VBd4;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715810; x=1816251810;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EG1fwQF8FMonweNNevRz8m1QwyQlVz3HnysXRSCcW3E=;
  b=TLI0VBd4eirrkZ6SZF0vWsBBnyY1FepR/1U9+k01clNwT9t7qlrakVon
   KOJTTQ2ZaD2YljOG/Y3K3s4kTrQzjVWII6abj5yGxT+Zd77vB2/lrZ2Al
   /XIAgd6KXs8AC/7zHJC/vU9lDnd5U4wJTbTHkFt5pMqzSOEG4z+b5nCv8
   1ffBxhlsomsTlm2pd9bIEa1rmY/ws73c9uQfyvnGKcD3INzlG0IIGy59q
   oFCIgP5FLnJ/2We9bl7NbK0Nxzfvfg7kUD2NM/WqBpo90z7tCOIipE0UC
   zckPwBzJoGB8HGOgv09GBkRUNTsvGkC0bW/igcC1PSUU9Kb+ZbtiIx6+B
   g==;
X-CSE-ConnectionGUID: NCy5vo22T8GgaXb+xGgBHQ==
X-CSE-MsgGUID: Cnv11dKaSBOX8HTHv0jTNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="234395255"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="234395255"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:23:28 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 537B31002B87
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:28 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 0AB7CC091B2
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 18D434064B2;
	Wed, 22 Jul 2026 10:23:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/37] dash: upgrade 0.5.13.4 -> 0.5.13.5
Date: Wed, 22 Jul 2026 18:22:44 +0800
Message-ID: <20260722102320.1019-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128371

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-shells/dash/{dash_0.5.13.4.bb => dash_0.5.13.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-shells/dash/{dash_0.5.13.4.bb => dash_0.5.13.5.bb} (90%)

diff --git a/meta-oe/recipes-shells/dash/dash_0.5.13.4.bb b/meta-oe/recipes-shells/dash/dash_0.5.13.5.bb
similarity index 90%
rename from meta-oe/recipes-shells/dash/dash_0.5.13.4.bb
rename to meta-oe/recipes-shells/dash/dash_0.5.13.5.bb
index d7db0abed1..438d712e9a 100644
--- a/meta-oe/recipes-shells/dash/dash_0.5.13.4.bb
+++ b/meta-oe/recipes-shells/dash/dash_0.5.13.5.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b5262b4a1a1bff72b48e935531976d2e"
 inherit autotools update-alternatives
 
 SRC_URI = "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.gz"
-SRC_URI[sha256sum] = "d10dfd41cda59165560db39ca915c2c4a7636fff04281d8d2df77ad92c753e2b"
+SRC_URI[sha256sum] = "40090101a2a491f13e901d3d48e90414f26634628b9bfff35ff540363c227a7d"
 
 CVE_PRODUCT = "dash:dash"
 
-- 
2.43.0


