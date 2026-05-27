Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3266ECD4F54
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:54 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16973.1779875391338980095
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nySqA7g2;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875391; x=1811411391;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K/YQzKpEMHtFXaBDXEZAoZO7taU5RvkvvJcGRSItud8=;
  b=nySqA7g2s/FH5OvXw1ZOMLdeMXt9FjxdCw6GHXb+MXB1Okup/DjtrcwP
   yD+N5nf7iXLTu9AkN/Qkdfs1EFaOivd5BLVBYt81IWofRETVY99EgvcM6
   1PuXjO/vQV2DrYslKh8P9R6bGk2XJ6jTkmO93f8jU/tm95eBT/4ydqlQX
   s2Eb5WRGka/j3xpIcCneVqyWIvfJ5hx4zIMTsSgxP4f/94YCt3c0/ytbc
   mQEgQcj0QT5JkwqpbCmaL37iLg8Mzj2sBSNie/pdb0/GlclKuGSgAHzuo
   Jf0BbTa51bgYUqr16PGHWndGGHntNUm+gJfxFQzuuFg3FucaIVm1gmAVo
   w==;
X-CSE-ConnectionGUID: axf4KuAPQZigKJMSpaX5fQ==
X-CSE-MsgGUID: 0kn9f92CTs2al8rTBe2dDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="245264263"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="245264263"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:50 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id DFBED1C1C717
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:49 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 98B9F18591C0
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 9933A82A2D2;
	Wed, 27 May 2026 09:49:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH 56/56] xfsprogs: upgrade 7.0.0 -> 7.0.1
Date: Wed, 27 May 2026 17:48:05 +0800
Message-ID: <20260527094805.2039-56-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127264

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xfsprogs/{xfsprogs_7.0.0.bb => xfsprogs_7.0.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_7.0.0.bb => xfsprogs_7.0.1.bb} (96%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.0.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.0.1.bb
similarity index 96%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.0.0.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.0.1.bb
index 7c6dae1896..129b30583c 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.0.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.0.1.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://0003-doc-man-support-reproducible-builds.patch \
            "
 
-SRC_URI[sha256sum] = "c05930b04e7a0e6c9115cf891cd4e973231d7066b2d6b2993d23705089678988"
+SRC_URI[sha256sum] = "4a8ca83a7acb8cd92c997d63b69ae64f170056b366a2924a753e47d4bb4b8b06"
 
 inherit autotools-brokensep pkgconfig
 
-- 
2.43.0


