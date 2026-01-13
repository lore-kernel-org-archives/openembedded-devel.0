Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7549CF45DB
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:24:10 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55828.1768299842738380855
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:24:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pmofZZ+s;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299843; x=1799835843;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yl2mUnKxb2p2q7DhXVEsuwIQWbzLfjqd654OsmCfLoA=;
  b=pmofZZ+sVZciLaFutAH/TVoT9LhHsIfyPyy0IGNAg0XEG5aJD169icVA
   XMALEprtxDJNxzc1iaWQSjbhSXix/BQVU1oBkAIbWj6OvkIE+e2pUE+nv
   YL08Hf50szE+KdhP9jdyIJAYhFsDOV3Mq7XU3XZsrkfbEYYo1AooV8zin
   uk5IoDBxxS3/cS9V2D3O1Az1kcs98olpkviwg1vNUitvqYgZDVszVBfDi
   8f9kpiNEM2zOMmr38lw5pVVMTfETI0NNNx7xztjCacaKp1O3PGQRZadRu
   73pppL7pbkltgyC524a8zFWZB6527IzULrfrQHwc4K3cLc1/7KBNNBLbT
   Q==;
X-CSE-ConnectionGUID: r7eARQuaSLipwTh5whzQnw==
X-CSE-MsgGUID: mu7zbbG4Romdgw19RtbfCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="204607124"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="204607124"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:24:01 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id E9E19820720
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:00 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 9E51E1801FE2
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id BE84C1019041;
	Tue, 13 Jan 2026 10:23:57 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/22] doxygen: upgrade 1.15.0 -> 1.16.1
Date: Tue, 13 Jan 2026 18:23:15 +0800
Message-ID: <20260113102334.605-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102334.605-1-wangmy@fujitsu.com>
References: <20260113102334.605-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123409

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../doxygen/{doxygen_1.15.0.bb => doxygen_1.16.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/doxygen/{doxygen_1.15.0.bb => doxygen_1.16.1.bb} (96%)

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.15.0.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.16.1.bb
similarity index 96%
rename from meta-oe/recipes-devtools/doxygen/doxygen_1.15.0.bb
rename to meta-oe/recipes-devtools/doxygen/doxygen_1.16.1.bb
index 494e92f768..3d0cfaed80 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.15.0.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.16.1.bb
@@ -10,7 +10,7 @@ SRC_URI = "\
     git://github.com/doxygen/doxygen.git;branch=master;protocol=https \
 "
 
-SRCREV = "7cca38ba5185457e6d9495bf963d4cdeacebc25a"
+SRCREV = "669aeeefca743c148e2d935b3d3c69535c7491e6"
 
 
 UPSTREAM_CHECK_GITTAGREGEX = "Release_(?P<pver>\d+(\_\d+)+)"
-- 
2.43.0


