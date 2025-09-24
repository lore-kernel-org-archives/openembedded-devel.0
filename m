Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46989CAC5B3
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:45 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.8225.1758704439250344584
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=njh2i6Rn;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758704442; x=1790240442;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SoIA0d+R0vEJpbFzJWYHeVXZlrHlHwJ0p360ghBJ8ME=;
  b=njh2i6RnhQh1iG3xvVUlB1JIQ9t9YhII0qjSc0ukVqSJfFc+8V3OyE/V
   D4KfP+HJRn69Rii2i2CHDo1BSpx0QrxDw7uzBprkqDalfidANPbt6wfrR
   EcC7wVfq5JWAhHEVhedPcVuUUa0qY8odbdsaD1STYvJeFyxSOmSGzvdrl
   jFOctoluLeWdWmpCIXvSFKWnCyfuw5itTQNP5XNykHYDZ6UKwKHxHuvae
   Oyvquz4qGK9m0yU0EVNsd7zkZWmCRRKdu+vZftiIGktG8t1vIVEE8RN25
   lJ8Crhvz4MZpUzakLJ+1U3fSWLloRatKHgK0GKWr2Z8UuxSOjURWvOvQb
   A==;
X-CSE-ConnectionGUID: tKwLJny3TpWumRz8OiOGug==
X-CSE-MsgGUID: s/WbhArDTde9SxwLTOZ6tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="213113617"
X-IronPort-AV: E=Sophos;i="6.18,290,1751209200"; 
   d="scan'208";a="213113617"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:00:41 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id A45961002B9E
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:40 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 5F73DC00416
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:40 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id E05FA40CDD4;
	Wed, 24 Sep 2025 09:00:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2D32A1A008D;
	Wed, 24 Sep 2025 17:00:35 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/29] leptonica: upgrade 1.85.0 -> 1.86.0
Date: Wed, 24 Sep 2025 17:00:09 +0800
Message-ID: <20250924090029.1786-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250924090029.1786-1-wangmy@fujitsu.com>
References: <20250924090029.1786-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119771

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../leptonica/{leptonica_1.85.0.bb => leptonica_1.86.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/leptonica/{leptonica_1.85.0.bb => leptonica_1.86.0.bb} (89%)

diff --git a/meta-oe/recipes-graphics/leptonica/leptonica_1.85.0.bb b/meta-oe/recipes-graphics/leptonica/leptonica_1.86.0.bb
similarity index 89%
rename from meta-oe/recipes-graphics/leptonica/leptonica_1.85.0.bb
rename to meta-oe/recipes-graphics/leptonica/leptonica_1.86.0.bb
index 068937e6bb..11adbc7125 100644
--- a/meta-oe/recipes-graphics/leptonica/leptonica_1.85.0.bb
+++ b/meta-oe/recipes-graphics/leptonica/leptonica_1.86.0.bb
@@ -7,7 +7,7 @@ UPSTREAM_CHECK_URI = "https://github.com/DanBloomberg/leptonica/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
 SRC_URI = "http://www.leptonica.org/source/leptonica-${PV}.tar.gz"
-SRC_URI[sha256sum] = "3745ae3bf271a6801a2292eead83ac926e3a9bc1bf622e9cd4dd0f3786e17205"
+SRC_URI[sha256sum] = "1fa08e40bb37fd45802d5e6e7b43927449a5c47d4608ef99d3bd3f0fa76baedc"
 
 EXTRA_OECONF += " \
     --without-libwebp \
-- 
2.43.0


