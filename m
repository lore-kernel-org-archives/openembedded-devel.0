Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8447BEFD237
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:38:51 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42055.1772012318895928097
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:38:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Oz7s+EBm;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012321; x=1803548321;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1ytQFoTFyl9a6ffPrwVA8PMJowSAFd2Y3hzEaarX+vM=;
  b=Oz7s+EBmXSP+ast2PQqaltoCCqi0dU5CQVcoI4d9tFDI0Fh04UuQ/SyX
   LYBrCbnIGJTGEFaQPX47uZwLjivrcwT1xjrJOF22UWt4D6cyUriZWx1tf
   88Xr0U45pmcz3v6EpiP4wHs+8VGkoJ8fQR2k/g0SiUsp4Q7tEGeFcQhZL
   4JOL2P629ztZceoQqZyQvOEaZLQpkjcMLitEa52JLLRBP38qbUr7PFeXl
   A3Nf21p5MX5O0KfovrMHC3oqNE8hU8kRgtOuXW9xL/gr+dBn6JylP64Vn
   mprfw8yni1bKzORIHB2BoMMdGvzI3jaeljvGIRYsMqfRDwX2VBnsPBqEo
   w==;
X-CSE-ConnectionGUID: QSJjzvq9T4OZGyMSwspEOw==
X-CSE-MsgGUID: lK1GsECIRIa6fKWNwrViDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="209814756"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="209814756"
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id 801551C000A4
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:41 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 331121800525
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 59FB2101BB42;
	Wed, 25 Feb 2026 09:38:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/33] python3-astroid: upgrade 4.0.3 -> 4.1.1
Date: Wed, 25 Feb 2026 17:37:24 +0800
Message-ID: <20260225093727.1284-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124642

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_4.0.3.bb => python3-astroid_4.1.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_4.0.3.bb => python3-astroid_4.1.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_4.0.3.bb b/meta-python/recipes-devtools/python/python3-astroid_4.1.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_4.0.3.bb
rename to meta-python/recipes-devtools/python/python3-astroid_4.1.1.bb
index efa59fc198..568769c58a 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_4.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_4.1.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "08d1de40d251cc3dc4a7a12726721d475ac189e4e583d596ece7422bc176bda3"
+SRC_URI[sha256sum] = "445d831fe785df8c670bbb46b900b8424b82f85b4af187103f71a63a63ebed43"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


