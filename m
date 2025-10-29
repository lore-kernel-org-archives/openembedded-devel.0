Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2602CCF9F5
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:15:52 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.27244.1761696950427738405
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=D0BBl07o;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696951; x=1793232951;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ai/CGu1V9CbtlJG82XyGAgNttumqE9HnJk56wMys+cI=;
  b=D0BBl07osa1j6cJwcTSJY8V38/wNebpujcwBCXe2phiNBeXhSZrpOYI2
   AJ9USoKHtv/H7Z8fIsXk2v9lrma+DeWgH5se4ARGN6CQAABrtCDTBj0mg
   dqglxH9avIS4EDvmK12VxQrurjHzbzwcmFvffmVIRv9bQBDVKm+y42yv9
   59ftP0fV37p/WBJgUE8Nz7a2pqPIwUE8LlhcD/dj1wjBv7LNiU28yVIT+
   CB3fO37iGjiCbT4vCfaWuxjzvnH3EefAIiMVX6r8vxg10cOsFSzBIr0D8
   3hHCMen261fW8Zg1m1+q/ZxbsRWQ5FHwZ9vrXIz3dXocI5lhXlWDC6FA+
   A==;
X-CSE-ConnectionGUID: e6YI/2LlQjedMwv/NHM9bw==
X-CSE-MsgGUID: a03b+IZBQjKUqKSb6B7Exw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="196243073"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="196243073"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:15:50 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id D1F6D820404
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:50 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 8F9C21800080
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id D8AE9826FCD;
	Wed, 29 Oct 2025 00:15:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/32] python3-grpcio: upgrade 1.75.1 -> 1.76.0
Date: Wed, 29 Oct 2025 08:14:51 +0800
Message-ID: <20251029001505.528-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121124

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-grpcio_1.75.1.bb => python3-grpcio_1.76.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.75.1.bb => python3-grpcio_1.76.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.75.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.76.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.75.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.76.0.bb
index ef0bf126d5..c4282502e1 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.75.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.76.0.bb
@@ -13,7 +13,7 @@ DEPENDS += "c-ares openssl python3-protobuf re2 zlib"
 SRC_URI += "file://0001-python-enable-unbundled-cross-compilation.patch \
            file://abseil-ppc-fixes.patch \
            "
-SRC_URI[sha256sum] = "3e81d89ece99b9ace23a6916880baca613c03a799925afb2857887efa8b1b3d2"
+SRC_URI[sha256sum] = "7be78388d6da1a25c0d5ec506523db58b18be22d9c37d8d3a32c08be4987bd73"
 
 RDEPENDS:${PN} = "python3-protobuf"
 
-- 
2.43.0


