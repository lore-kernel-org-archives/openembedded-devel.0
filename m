Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 892E0CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:20:28 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.245.1778646018199535273
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YU5AkZbR;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778646018; x=1810182018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Rhq1bnd98L77YUESE/cIPThp7qh9lDZWyY59T9yvACA=;
  b=YU5AkZbRwSHYSaqCeTDZ/02jIika3DndI7VT/PZabo3DSPYQT3FF/jm6
   JBlAoa3GY4epJFFSL+xvimrlX8CGkZGw5ULXs1hTdAJY4x7d+sAgSAl1X
   vvG52cnELXme5ealrV769qrbXp6Nec2/4oONHR0oyUZ9eAN9fO0Hu774A
   qP04Ro1kGsH8v2IjT3I+C7WonYCxyKxhDx+/dRwflpD7rYkgqJBdjKDSf
   kTB8AXpujazRbVaf/yllG0uoiDg/yayKNVLEArQhPAAfuZg3zRxIE00JT
   r7KN3376u7Q7wvMjYSq4n8nWXj0YTiKUsat8Iea/oMEAzDyxt5bADvfoR
   A==;
X-CSE-ConnectionGUID: 5UqrNAewRACVFhRpFfFLxQ==
X-CSE-MsgGUID: v05q7OnZRd2Isru6OlretQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="219134598"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="219134598"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:20:16 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 68E86100035E
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:16 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 174CF100039C
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 8B695140024F;
	Wed, 13 May 2026 04:20:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 48/56] python3-web3: upgrade 7.12.1 -> 7.16.0
Date: Wed, 13 May 2026 12:19:44 +0800
Message-ID: <20260513041952.450-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513041952.450-1-wangmy@fujitsu.com>
References: <20260513041952.450-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126932

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_7.12.1.bb => python3-web3_7.16.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_7.12.1.bb => python3-web3_7.16.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_7.12.1.bb b/meta-python/recipes-devtools/python/python3-web3_7.16.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-web3_7.12.1.bb
rename to meta-python/recipes-devtools/python/python3-web3_7.16.0.bb
index fe5886692d..bb1c354934 100644
--- a/meta-python/recipes-devtools/python/python3-web3_7.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_7.16.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1d34d9701a1461e4bd71a904ac4cf7be"
 
-SRC_URI[sha256sum] = "97f6a116ccaeb5907bb4cb6c771cc23bc942bf09528a840189e9b509b7b8347c"
+SRC_URI[sha256sum] = "b4a75a3fa94fef4d23d502eb3c2244146ef9a1ee0082cf1cb0a91586ba0510c3"
 
 inherit pypi setuptools3
 
-- 
2.43.0


