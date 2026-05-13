Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A81D9CD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:22:18 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.279.1778646135419200685
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PVK4vG9H;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778646136; x=1810182136;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=icQQ4wDOw86GC9JJrjsjFpNTamW0eONF0Qu1i6gh5xg=;
  b=PVK4vG9HyoiAiniRit375vsrCMTvjwgfBqN8fy+n7SLXJBr1ZsKAmrYE
   fugM7wEsaXE3vacUSGwCAhRCIlCEZ/MIIwClbKC/YIx8bTa2Zjk1ylj/z
   wGjQQjmCQ1ycJSWWPuNTx6VOHCgJ43qcKE4ArNc28DoGvJV8ADEDMdd78
   Nnkfc0p/8pizFT81KqMSHXfUxB5WkNELnx6iFEdVCwY01eG2eZP6exqDh
   9wmxt+a7gMKaMly2c2J++KRdoHlmeyp0lnxP6+j5Lqdqt017G9m6RJ4Mp
   w3QURryCBXBil57zbS1ZuqDSwr4J6hl/TYCkWDU4hDaXMuPjC+r4EHZFi
   Q==;
X-CSE-ConnectionGUID: K67dqeKXQlep3Ips3EwboA==
X-CSE-MsgGUID: uFCH1t85SkeoNyRZUMCV7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240209301"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240209301"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:22:14 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C16D110001C7
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:43 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 76694896E1E
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1431214001F2;
	Wed, 13 May 2026 04:20:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH 54/56] xfsprogs: upgrade 6.18.0 -> 7.0.0
Date: Wed, 13 May 2026 12:19:50 +0800
Message-ID: <20260513041952.450-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513041952.450-1-wangmy@fujitsu.com>
References: <20260513041952.450-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:22:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126942

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xfsprogs/{xfsprogs_6.18.0.bb => xfsprogs_7.0.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_6.18.0.bb => xfsprogs_7.0.0.bb} (96%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.18.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.0.0.bb
similarity index 96%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.18.0.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.0.0.bb
index 33847a86d7..7c6dae1896 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.18.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.0.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://0003-doc-man-support-reproducible-builds.patch \
            "
 
-SRC_URI[sha256sum] = "3a6dc7b1245ce9bccd197bab00691f1b190bd3694d3ccc301d21b83afc133199"
+SRC_URI[sha256sum] = "c05930b04e7a0e6c9115cf891cd4e973231d7066b2d6b2993d23705089678988"
 
 inherit autotools-brokensep pkgconfig
 
-- 
2.43.0


