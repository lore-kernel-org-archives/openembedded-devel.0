Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF2E7C87FCE
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:55:19 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.31499.1753869312363064647
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:55:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UcARfHXZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753869312; x=1785405312;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eIe8qe6Mi83dViEyzJzFm+XokUckFGhR/q1F2O5Aang=;
  b=UcARfHXZgU3sGf2CPmg24EZDCj4EBdYXMGqj/yjlAF5TZEtyIPfZz9X4
   Teeb2wcj6mN1UPGw1LIqR71WNnraC1hVUj2MjuQmFvUIToBO3VPet0H2+
   AZjPjueyY7K/PA9NCwOQpEh0LsfNcHVPhyyNGnACKTjdqLEcFoHH05a0b
   vho9GbkIUgUcKLO1qQUfshE7dXiTxJwLUJ9H6UZTzh1KfIde7hVRn6egy
   tavJU0CuE5HUQ1lCfncaU8mjOE4h4V/UbWSHToMXlT9IqaoTHZLcLhp97
   tizE+s37W1gyrTOlyw2/YjuYF4nx7tR88T+psJPmbozWRJKJfmN8c9+cc
   w==;
X-CSE-ConnectionGUID: PcUwqJSXRGK3apHZ2uJeMw==
X-CSE-MsgGUID: Ag0pICUVQIqZirqcmDEy0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="208433622"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="208433622"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 18:55:10 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id E693C42A305
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:10 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 55705C03416
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 42FAA1A000B;
	Wed, 30 Jul 2025 17:55:07 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/40] python3-grpcio-channelz: upgrade 1.73.1 -> 1.74.0
Date: Wed, 30 Jul 2025 17:54:41 +0800
Message-ID: <20250730095456.695-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730095456.695-1-wangmy@fujitsu.com>
References: <20250730095456.695-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118792

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...cio-channelz_1.73.1.bb => python3-grpcio-channelz_1.74.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-channelz_1.73.1.bb => python3-grpcio-channelz_1.74.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.73.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.74.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-grpcio-channelz_1.73.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-channelz_1.74.0.bb
index 857e842b70..97b645d985 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.73.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.74.0.bb
@@ -11,7 +11,7 @@ DEPENDS += "python3-grpcio"
 PYPI_PACKAGE = "grpcio_channelz"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "e48c5444db505d9e42ceca4399ccb9926bceb41189a8956140a94d2f95538be9"
+SRC_URI[sha256sum] = "6b80079b6d6e3484eaf89f4e547438e8fcb8658f244027dafb67803bbbd07d4b"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0


