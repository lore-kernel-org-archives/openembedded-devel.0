Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C830CCFA1C
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:44:21 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2931.1762386256903980817
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:44:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IqGOgvxR;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386257; x=1793922257;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DMfZgL3YYz1Nxyr1q+rEskpQnQBUMEM+3Wi2jf8OIBI=;
  b=IqGOgvxRfP2o+xo0OBj/joI39vFXwqqV6+EPRI8/mXgAOBE0WmVGAIqd
   Q7vx84TmpNVpXq+V7QrpBqiqaryX11mgDAyEAuSiqecXNBYe8IhRQrV04
   du6tgABk99JYTb+wXMJPwec7Rpa1y1cbV2v/xMXaxgU4NYd//pKPw+ECA
   D4WB2Uo1R5iMFQX9kHyhuCa/SMnhQCvM6+F3M2+M/QIM9jIL7RGgaAtQ7
   o7aPrc5/QXf9fKhvJ6ixFotD8ZugHhCiL3purWXGfDH7zkbo2nLICDJ3p
   2LmxE7DM+OERbgs5/uBbWmr0Pkd4JAFbH5eIyrMyEVESAwoB3OVBvG7vk
   Q==;
X-CSE-ConnectionGUID: U0+7SfywR0iAB4ec2CSk9Q==
X-CSE-MsgGUID: aPGhRTE5Qr66K0y1eleBjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="218221435"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="218221435"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:44:15 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 2D70A10001EB
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Nov 2025 23:44:15 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id E12B5180009A
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Nov 2025 23:44:14 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 54DA410001F9;
	Wed,  5 Nov 2025 23:44:12 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/12] parallel: upgrade 20250922 -> 20251022
Date: Thu,  6 Nov 2025 07:43:54 +0800
Message-ID: <20251105234402.423-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234402.423-1-wangmy@fujitsu.com>
References: <20251105234402.423-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 23:44:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121343

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../parallel/{parallel_20250922.bb => parallel_20251022.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/parallel/{parallel_20250922.bb => parallel_20251022.bb} (93%)

diff --git a/meta-oe/recipes-extended/parallel/parallel_20250922.bb b/meta-oe/recipes-extended/parallel/parallel_20251022.bb
similarity index 93%
rename from meta-oe/recipes-extended/parallel/parallel_20250922.bb
rename to meta-oe/recipes-extended/parallel/parallel_20251022.bb
index fb94e89f30..9fa1b6052d 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20250922.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20251022.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "ee3ddc3125ef7ddcd97dde5ba64ab7f71874faa2f5d7720acdd3e4bf5265a32b"
+SRC_URI[sha256sum] = "474326d59688d2fc078cf89a7b0b4a11cc9684229b3fa0158fe8bc03f1b69ee1"
 
 inherit autotools bash-completion
 
-- 
2.43.0


