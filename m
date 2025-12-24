Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D345E7542B
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:13:40 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.117292.1766567611269813911
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:13:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=teEqQOwI;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766567612; x=1798103612;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kL5mLKSf0eFjhdE4j2TF6m/ICf3c9FmaTayWC2U3THo=;
  b=teEqQOwIiDb4v0vUWp9WGOkADco9KUbZFRU2c5Qn948dS/rNxjoyt+VB
   M5h2RA9oS9VkbKS7EXpYCy+6OkLRpXEQxqHPr/lq72VeeUcIomJbXKu3k
   eQdiQ74N09aPrTTWzT4Tfn3R2hNpN4bhsIlFAGauR7ZyUqaMIBe8pd836
   laimLH+J0BEIs1b7yJlGt+AD6W+HTuMej/NMRabZ519uUts7ZqXUjJfB9
   +A/cz+hW8BJLkOY3QhgMBk+P23ln29/u6l1FyRwGQrRh4Rgbe0MBwh6VR
   9uTFlvCmnqVcBE1pKzdOp+GPAJwauyYJNeJKOB3POWWoz3trqCn45AZ8m
   Q==;
X-CSE-ConnectionGUID: fwxs1KUpSRuhn4AlyJWWlg==
X-CSE-MsgGUID: DziqUUocTvK4411QAY/1vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="223750053"
X-IronPort-AV: E=Sophos;i="6.21,173,1763391600"; 
   d="scan'208";a="223750053"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 18:13:30 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 97EB042A327
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:13:29 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 49E22C02080
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:13:29 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.254])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 8D2B6200074F;
	Wed, 24 Dec 2025 09:13:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/28] fuse3: upgrade 3.17.4 -> 3.18.1
Date: Wed, 24 Dec 2025 17:12:39 +0800
Message-ID: <20251224091304.974-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251224091304.974-1-wangmy@fujitsu.com>
References: <20251224091304.974-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:13:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122853

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/fuse/{fuse3_3.17.4.bb => fuse3_3.18.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/fuse/{fuse3_3.17.4.bb => fuse3_3.18.1.bb} (97%)

diff --git a/meta-oe/recipes-support/fuse/fuse3_3.17.4.bb b/meta-oe/recipes-support/fuse/fuse3_3.18.1.bb
similarity index 97%
rename from meta-oe/recipes-support/fuse/fuse3_3.17.4.bb
rename to meta-oe/recipes-support/fuse/fuse3_3.18.1.bb
index fcd09059ab..a29e1820d7 100644
--- a/meta-oe/recipes-support/fuse/fuse3_3.17.4.bb
+++ b/meta-oe/recipes-support/fuse/fuse3_3.18.1.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse-${PV}/fuse-${PV}.tar.gz"
-SRC_URI[sha256sum] = "df9e40ae927b73dc702d0bce7925c0c618af47ad0b13204fbf2be66e54d8528b"
+SRC_URI[sha256sum] = "dd395c88f29c7540bbdd0b830260ab8092ccb241bb6e66f603643f715fb9322c"
 
 S = "${UNPACKDIR}/fuse-${PV}"
 
-- 
2.43.0


