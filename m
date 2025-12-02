Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA888CFD376
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:52:19 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4296.1764669129982086809
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:52:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lUqdipZy;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764669131; x=1796205131;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C1yYnb9DI/8XrGNNOHsemne1iuEiwF40+6bklURH3bE=;
  b=lUqdipZyO47zc+yxhZBHQfdKMqaco1RqM0/HpwJalvXqeBJUyg750iU9
   DT+JVGFWBOuL+7Ib0yVs00juQgDM+kF1yZ6gtG+pX5vJ23hY++bORE70v
   znb34VrK8WnDdZatA/G9K1PO4AtnWbUjbVBn6XsnZ0TknQvhhGWK1wVq5
   4EfkJOrpyOw87sTmMDuq2Y7atZB1h+1FkRm3q0Q66vHsy+KeXbFWXmnAJ
   A0dyMmo9agsyw7oj1OHoR5RkFrUPYNIsE+GvclAdDWlyQMdLipMoODy/Q
   Y89HXkwuTP15GBFwTVIbWBoZH+BsvyAegcP/PvHuLohsnlq33Aa8EriQD
   w==;
X-CSE-ConnectionGUID: 49vl/x/xRWezWRFBB35FuQ==
X-CSE-MsgGUID: fG3DeVTeT2m0gWqtPvnpOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="225034825"
X-IronPort-AV: E=Sophos;i="6.20,242,1758553200"; 
   d="scan'208";a="225034825"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:52:10 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 8A632100034C
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:08 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 4084B100046F
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id C8AD7101A436;
	Tue,  2 Dec 2025 09:52:05 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/25] python3-mlcommons-loadgen: upgrade 5.1.1 -> 5.1.2
Date: Tue,  2 Dec 2025 17:51:22 +0800
Message-ID: <20251202095132.652-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251202095132.652-1-wangmy@fujitsu.com>
References: <20251202095132.652-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 09:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122248

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...mons-loadgen_5.1.1.bb => python3-mlcommons-loadgen_5.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-mlcommons-loadgen/{python3-mlcommons-loadgen_5.1.1.bb => python3-mlcommons-loadgen_5.1.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.1.1.bb b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.1.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.1.1.bb
rename to meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.1.2.bb
index f607dcbcc1..79687290f5 100644
--- a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.1.1.bb
+++ b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.1.2.bb
@@ -21,7 +21,7 @@ SRC_URI += " \
 PYPI_PACKAGE = "mlcommons_loadgen"
 UPSTREAM_CHECK_PYPI_PACKAGE = "mlcommons_loadgen"
 
-SRC_URI[sha256sum] = "4059adc2c3cf3655d605f90c510aaf49bf5017fba7c0d85501bc22a90794e4f9"
+SRC_URI[sha256sum] = "cd686a6223c978d1056e38a417e4807bfa21c855189f7882d24c8313174bca74"
 
 # Because the pyproject.toml contains invalid requirements.
 INSANE_SKIP += "pep517-backend"
-- 
2.43.0


