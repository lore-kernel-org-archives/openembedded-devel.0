Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87FB4CCF9F2
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:15:22 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.24187.1761696921688799600
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:15:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AUWPa0gI;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696921; x=1793232921;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DiHmXQ6/Dva6Wqhf1BzFQbPSinGObLaXB7iI46Alb28=;
  b=AUWPa0gIvJAOrrJBvyBUI+NomZXOkSs+gPRPbbRm7BMw6qYemunrouhI
   6KFLuBIwgqVoPWdewJWsy1IMZfJKqMMfer/M9SmsXxgbXvVM1PcLrRrsI
   807X03sJ0xE9IB8lt7QoLq/4ZgCOHTMXnng2FmpLjPJjKEk3kE146B1Wj
   Dt/0GeISRUt31QW7pEneXLPP41MNZ9gFI1V0HMytUDtIMsOFwk2Tu43ij
   pwtLR5wu3OJFXDHmSOfT5kuBGsfuYfIZ2eNOQoU/IV5tKKfsQkutP15Nw
   TBPxIoDCvyq6B9M5cVxDkP1MHF//hcBR5/IMhHYoppKy/V0tVH40yc8ig
   w==;
X-CSE-ConnectionGUID: eW/Ii6+3Q9mKdelhXpFRIg==
X-CSE-MsgGUID: luAHdD/mQU6y54LmZnhjqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="217999591"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="217999591"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:15:19 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 10A043FFF
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:20 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id BC185C0162B
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 1EFA0826FD1;
	Wed, 29 Oct 2025 00:15:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/32] doxygen: upgrade 1.14.0 -> 1.15.0
Date: Wed, 29 Oct 2025 08:14:36 +0800
Message-ID: <20251029001505.528-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121109

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../doxygen/{doxygen_1.14.0.bb => doxygen_1.15.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/doxygen/{doxygen_1.14.0.bb => doxygen_1.15.0.bb} (96%)

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.15.0.bb
similarity index 96%
rename from meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb
rename to meta-oe/recipes-devtools/doxygen/doxygen_1.15.0.bb
index 73594fc09f..494e92f768 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.15.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "\
     git://github.com/doxygen/doxygen.git;branch=master;protocol=https \
 "
 
-SRCREV = "cbe58f6237b2238c9af7f51c6b7afb8bbf52c866"
+SRCREV = "7cca38ba5185457e6d9495bf963d4cdeacebc25a"
 
 
 UPSTREAM_CHECK_GITTAGREGEX = "Release_(?P<pver>\d+(\_\d+)+)"
-- 
2.43.0


