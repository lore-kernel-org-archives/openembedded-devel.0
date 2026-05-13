Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C12CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:17:18 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.209.1778645828485237545
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CQPIgJl5;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645828; x=1810181828;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4Os3IakDN9LiqvAxM0b1PbD7CKTGoQKUisZBX79zErA=;
  b=CQPIgJl5yDG+Gq52CJ5pRzxhywDSgGGanL7b5qSDho9KDI2fhA29fuhv
   4ha/bqBofuIbWP7MS9agKMN1BH85WXJqFYwce5Hhm3rac8Pf8O0GAQVLO
   nA5HGb9fceIiGrvMEwKlGzbXwuZgy/B3rMcSAE8h8vIszlOTefxInGyOJ
   5Cid6+9CIdT1Xr61pSR4WnkJM4eEoNLqeuKxGgtdfVgeui+Hw1nQYQluE
   0sjAh3QIUBo9X2+euqzMUWOs9+9R1/6ZLKF3lYzUg+emkgEpcrgFgE2tP
   goIh/191KDRs/3TvpxCsfCB8fJZB3vj/rU1DZ9X2+1sT+ZanNoH9Jvi1W
   Q==;
X-CSE-ConnectionGUID: f68+XIImQceaxYLHN+Y/uw==
X-CSE-MsgGUID: ZnqXnItySGGa/8VWXJ0A3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240208128"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240208128"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:17:07 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 0114D100035E
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:17:07 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id AAE63100153D
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:17:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 39F161019066;
	Wed, 13 May 2026 04:17:03 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 42/56] python3-tox: upgrade 4.53.0 -> 4.53.1
Date: Wed, 13 May 2026 12:16:11 +0800
Message-ID: <20260513041626.412-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513041626.412-1-wangmy@fujitsu.com>
References: <20260513041626.412-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126924

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- harden user-facing logs and untrusted inputs
- correct argparse override signatures for ty 0.0.33
- fix: allow deps arrays in TOML schema

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.53.0.bb => python3-tox_4.53.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.53.0.bb => python3-tox_4.53.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.53.0.bb b/meta-python/recipes-devtools/python/python3-tox_4.53.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.53.0.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.53.1.bb
index bf3c1d3690..b3fe030c6c 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.53.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.53.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "62c780e42f87d34ee60f2ea20342156253794fdcbd6885fd797d98ee05009f22"
+SRC_URI[sha256sum] = "7be9805ed4a34242510c7acc9a7e3a01a35942e08f31f8bd69067c3a37130afc"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


