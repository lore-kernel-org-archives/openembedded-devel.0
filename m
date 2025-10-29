Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D72CCF9F2
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:16:22 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.27256.1761696980606336789
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=syLsIA6h;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696981; x=1793232981;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nCbcY799FIX8ft2biSC8vjqAps38782ZFopaLS7rOZg=;
  b=syLsIA6ht+N/9JqjkKgvGYBH0WPEMZXPfvbqZSDFraoJP669k6/pW5On
   WuIEiukctZpg/6XQX66sCQmyeM4JrAiFHt2arBr3PU6eNqjdaAofjSc0c
   VCKWukrumbj8FFM1cVovKUOjJHBOO1XH4tAkwAB0hvJ6yprujnQFWr8YT
   56esvozTN91J4lAMdbY0s6stQrSEenYrDo1T90+Rlumhn1YaKfrUxyJUx
   cBuV0S3EFOkUZFKb2VSPOKeUVu7vs5imxYigzp+v7XMX6VVsW4PW1L5y7
   YDOkUmWtoVjAvq4zkLqqLdcLj8JSa5Z0TBUVScc+MSui7/7MPzcWYuWK5
   w==;
X-CSE-ConnectionGUID: c09kiiAmSiiq8vkRiZ3h4w==
X-CSE-MsgGUID: KkSWPUqkQp28QqkIJxxuMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="217443353"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="217443353"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:16:19 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id CC1401C1C735
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:18 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 853818D65CA
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:18 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id A00E182C0FE;
	Wed, 29 Oct 2025 00:16:15 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 31/32] sip: upgrade 6.13.1 -> 6.14.0
Date: Wed, 29 Oct 2025 08:15:04 +0800
Message-ID: <20251029001505.528-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121137

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/sip/{sip_6.13.1.bb => sip_6.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.13.1.bb => sip_6.14.0.bb} (87%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.13.1.bb b/meta-oe/recipes-devtools/sip/sip_6.14.0.bb
similarity index 87%
rename from meta-oe/recipes-devtools/sip/sip_6.13.1.bb
rename to meta-oe/recipes-devtools/sip/sip_6.14.0.bb
index 1f7c3e9afd..6b091c5e47 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.13.1.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.14.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=236276327275fdb261636fb40b18d88d"
 inherit pypi python_setuptools_build_meta python3native
 
 PYPI_PACKAGE = "sip"
-SRC_URI[sha256sum] = "d065b74eca996f29f1f0831ad321efaecf9906759b09466edc45349df7be6cd0"
+SRC_URI[sha256sum] = "20c086aba387707b34cf47fd96d1a978d01e2b95807e86f8aaa960081f163b28"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.43.0


