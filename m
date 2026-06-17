Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE510CD98EE
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 08:58:27 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11260.1781686697557978934
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2026 01:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K240E3wn;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781686700; x=1813222700;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YC0a+XOe8T+cS192J686GXH5kZjFGhl6zAzPiNiuFqE=;
  b=K240E3wnGiHBL6AyAJJm/XG1vOSsotg++X03wWZ4QmVBMKipl4yAzjeM
   f65sT1I5gpn+ElekHN42Vq078X6BNprrjYIqiabo39YuvWmmJDxW1+QCe
   PkFckGPDZLO3B8HafepVqyHnVjZu+LBLhh4m7VGfn7kfLCvBOgvRdY6Bn
   1ehKmiRDebc0czJmWp0z8+H3Fu0+KmhPYKZlbWIOwfqPlGG+gqekFqjRj
   JPhNkzHQS3ChyKxBhCa4cSFPeaPPdcymPzMRi9Tm/Jz6ckUjFRg3+3Hy/
   BAiytWZ8P4Rhtrlti2IoMMX4NVuxgBSjEKRkx/W8xl1WoUeXxW5EgzqLZ
   A==;
X-CSE-ConnectionGUID: CMa146d8RRulUOlJotrdqg==
X-CSE-MsgGUID: Y1IC9MNFRLKPrxJ3Qqhz9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="223301124"
X-IronPort-AV: E=Sophos;i="6.24,209,1774278000"; 
   d="scan'208";a="223301124"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 17:58:19 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C09CFC01814
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:19 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 7B0578D29F3
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id A4A2610017CA;
	Wed, 17 Jun 2026 08:58:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/17] ldns: upgrade 1.9.0 -> 1.9.2
Date: Wed, 17 Jun 2026 16:57:53 +0800
Message-ID: <20260617085807.542-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260617085807.542-1-wangmy@fujitsu.com>
References: <20260617085807.542-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127640

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fix to set VERSION_INFO to create .so.3 instead of .so.11 which will
  be reserved for a future 1.10.0 release
* Bugfix: Insufficient verification that responses belong to a
  query (CVE-2026-10846). Thanks Pablo Ruiz from 'codecome.ai'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/ldns/{ldns_1.9.0.bb => ldns_1.9.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ldns/{ldns_1.9.0.bb => ldns_1.9.2.bb} (89%)

diff --git a/meta-oe/recipes-devtools/ldns/ldns_1.9.0.bb b/meta-oe/recipes-devtools/ldns/ldns_1.9.2.bb
similarity index 89%
rename from meta-oe/recipes-devtools/ldns/ldns_1.9.0.bb
rename to meta-oe/recipes-devtools/ldns/ldns_1.9.2.bb
index de75c73207..8b3b9bd9de 100644
--- a/meta-oe/recipes-devtools/ldns/ldns_1.9.0.bb
+++ b/meta-oe/recipes-devtools/ldns/ldns_1.9.2.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34330f15b2b4abbbaaa7623f79a6a019"
 
 SRC_URI = "https://www.nlnetlabs.nl/downloads/ldns/ldns-${PV}.tar.gz"
-SRC_URI[sha256sum] = "abaeed2858fbea84a4eb9833e19e7d23380cc0f3d9b6548b962be42276ffdcb3"
+SRC_URI[sha256sum] = "b524fa21994b6e834200ceb8c27f1b84bda5982fe35706f058196c079db94d5d"
 
 DEPENDS = "openssl"
 
-- 
2.43.0


