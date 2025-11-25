Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C11CFD37A
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:17:38 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13252.1764062252325972486
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:17:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Hp266Tz0;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764062252; x=1795598252;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DTOHCRP4JUblnXlAEvwxcTxvUf/+uFQ74umvTpag+9c=;
  b=Hp266Tz00dGGr6A0szAhN7f2JNzOx5Pxp4r+gW2QMcFKv8xLDkJ29TdM
   dH2h2UJME4xGFnlx7YSL3uQwDB88fPCtVaPGNoARghAx7mvSxBIXbr8Yf
   3BEzeUuA6dYDOVTAlGDbH4cgfwjNBZIhsTg/7rp/WpJ5QuQXaxoUbRPY9
   PDz/nsatiArmzGKso+PPEzWVpixlZ8VfhWD3w+v8sLrXZGg6UUTbWN1Z+
   YCO/GbFDFqn4FyEUyUK88CnIvndqJhUxdTpQZ3Int411CvP298Tcg4G6J
   KKQaiCCc/a/zPsL2LmY1x/jAQoRhTtLz48ngPkJHcgdLKE0njTz/q+7mx
   g==;
X-CSE-ConnectionGUID: ThKd9WZlTIy4pYk32IXZJg==
X-CSE-MsgGUID: H8ljNcEZQK2esPoXDjh/vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="207757735"
X-IronPort-AV: E=Sophos;i="6.20,225,1758553200"; 
   d="scan'208";a="207757735"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 18:17:30 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id C6C3942A307
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:17:30 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 7AFCD1C0015F
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:17:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 38C5E101A426;
	Tue, 25 Nov 2025 09:17:27 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/26] python3-stevedore: upgrade 5.5.0 -> 5.6.0
Date: Tue, 25 Nov 2025 17:17:10 +0800
Message-ID: <20251125091714.1420-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251125091714.1420-1-wangmy@fujitsu.com>
References: <20251125091714.1420-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122048

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-stevedore_5.5.0.bb => python3-stevedore_5.6.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_5.5.0.bb => python3-stevedore_5.6.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_5.5.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_5.6.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-stevedore_5.5.0.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_5.6.0.bb
index 5f63f6b128..634df7db37 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_5.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_5.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "d31496a4f4df9825e1a1e4f1f74d19abb0154aff311c3b376fcc89dae8fccd73"
+SRC_URI[sha256sum] = "f22d15c6ead40c5bbfa9ca54aa7e7b4a07d59b36ae03ed12ced1a54cf0b51945"
 
 DEPENDS += "python3-pbr-native"
 
-- 
2.43.0


