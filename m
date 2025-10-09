Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A07CCD188
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 06:08:34 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.5574.1759990107980111608
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 23:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SEJIaskf;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1759990109; x=1791526109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HcQuoZsLMSMTeXTt1qdSI4eud5AWLlVxyHI/crje2I8=;
  b=SEJIaskfNv1V+8M7pEyQ3S5IzccPXlZIu4O9AF2IGCcJeeqZqZXB97Hh
   no4XgSNxoAOuJtJ3Xci4FeIUL6DB0k+CG3d1/AX7Nm2tARA3+pxXmvgVl
   zKoPFGNBVbpmZVbkkMkWQn7ubrU5E1XAwaEd14I0FoK6lZRkCog285i+6
   QZ+MTNuWm1Mnnbz/vABr6tPw/0ES2Blm9jSFTLdDYx+ncsD5Btp0xQ7iu
   yA0+KrBOpOhO2M1FtissLaj8AN/+ksmd5P0lOrOwjQsFTpbt+1Epm3NoR
   oF0003cLgwvH0vBcrrIFNvs0N8KilLUsSGK79jZBO4T4SE3mSMKWq8xa/
   A==;
X-CSE-ConnectionGUID: do998zcLQ7aP68HERb/1qg==
X-CSE-MsgGUID: gO/O2QRGTa6jl3XhhxA0BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="215495659"
X-IronPort-AV: E=Sophos;i="6.19,215,1754924400"; 
   d="scan'208";a="215495659"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:08:27 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 37A5710029AA
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:26 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id E64C41803175
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 9C1BD1001CF7;
	Thu,  9 Oct 2025 06:08:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/22] parallel: upgrade 20250822 -> 20250922
Date: Thu,  9 Oct 2025 14:07:53 +0800
Message-ID: <20251009060809.445-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251009060809.445-1-wangmy@fujitsu.com>
References: <20251009060809.445-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 06:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120403

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../parallel/{parallel_20250822.bb => parallel_20250922.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/parallel/{parallel_20250822.bb => parallel_20250922.bb} (93%)

diff --git a/meta-oe/recipes-extended/parallel/parallel_20250822.bb b/meta-oe/recipes-extended/parallel/parallel_20250922.bb
similarity index 93%
rename from meta-oe/recipes-extended/parallel/parallel_20250822.bb
rename to meta-oe/recipes-extended/parallel/parallel_20250922.bb
index 27a65ae1af..fb94e89f30 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20250822.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20250922.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "019d328722867cffe918c449364308c0df048456c69299b91451a3e6fac9167a"
+SRC_URI[sha256sum] = "ee3ddc3125ef7ddcd97dde5ba64ab7f71874faa2f5d7720acdd3e4bf5265a32b"
 
 inherit autotools bash-completion
 
-- 
2.43.0


