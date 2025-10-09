Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE805CCA470
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 06:08:54 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.5579.1759990123709387554
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 23:08:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TuHXGvHj;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1759990124; x=1791526124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y8O6dKPLmyIKvu4pbhvd01KSxtv3QqgjLiWIJjV5dJ8=;
  b=TuHXGvHjsYKoas1X1uE76znungaM8V2h4xkOa98MzEFkWDKPhWWsTcIV
   kV19WtyRZNJzJw5RrkfYDyVqq1OPOvBx5fgUcIocIR98L1Xxi4Coky9y9
   CItoCR8d7xgrE+BAf+uA3wQBR4hNgAvm/e5JSvVLHJYQPKf6slCfPCQT3
   gGePww4VKiO4UAA2/2Bc0lwlVqeJ99qYtxQyzMWEO/toYO4qpifyc3GPJ
   +jPcA71/v4HtYeq6WQjm3lYUF9kDYXN6KDED9r51vCzu/FGeFT3R18jGR
   cmU+W6xVkV1Xcft9yOgCMrL5z6XTyg2N/jxpDhCBRcP5X5XA049UfeeR9
   g==;
X-CSE-ConnectionGUID: CA7ypK2iT56TxhK/fCkm1Q==
X-CSE-MsgGUID: 9tXr2TTxTrOGGfzBP46mww==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="194297243"
X-IronPort-AV: E=Sophos;i="6.19,215,1754924400"; 
   d="scan'208";a="194297243"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:08:43 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id BA7291C000B1
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:43 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 737F51C00971
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 0BB6B1001CFB;
	Thu,  9 Oct 2025 06:08:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/22] python3-grpcio: upgrade 1.75.0 -> 1.75.1
Date: Thu,  9 Oct 2025 14:08:02 +0800
Message-ID: <20251009060809.445-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251009060809.445-1-wangmy@fujitsu.com>
References: <20251009060809.445-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 06:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120412

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-grpcio_1.75.0.bb => python3-grpcio_1.75.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.75.0.bb => python3-grpcio_1.75.1.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.75.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.75.1.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.75.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.75.1.bb
index 52a0158107..ef0bf126d5 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.75.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.75.1.bb
@@ -13,7 +13,7 @@ DEPENDS += "c-ares openssl python3-protobuf re2 zlib"
 SRC_URI += "file://0001-python-enable-unbundled-cross-compilation.patch \
            file://abseil-ppc-fixes.patch \
            "
-SRC_URI[sha256sum] = "b989e8b09489478c2d19fecc744a298930f40d8b27c3638afbfe84d22f36ce4e"
+SRC_URI[sha256sum] = "3e81d89ece99b9ace23a6916880baca613c03a799925afb2857887efa8b1b3d2"
 
 RDEPENDS:${PN} = "python3-protobuf"
 
-- 
2.43.0


