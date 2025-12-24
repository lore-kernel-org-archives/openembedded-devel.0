Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C6DDE75445
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:15:00 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.117719.1766567690215553534
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:14:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=REA0zCQr;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766567690; x=1798103690;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gXOOtmf8gUg5Qe+FTlpEkO0RNUHaXYpvF9IBqrBwgJs=;
  b=REA0zCQrIx1vhC5ADhqYGzzS+jaC+rNLxCO0PAI7eRR0SeAPoiGivYvv
   uwfkyxhpoU2nSLiyxgW7xpp1L7mKg46Z5y8xkZZu5+veEW44VaqqofN7U
   ipe2vLrFzemnX11rXg4j2Aj8fjthfY/GYchmztwFOBdfXfT15V5gQBGwF
   evO8Pv7z502NPIW/kms5BMpRyl4bMQ9CkzLIEuXVHx7Bay5eQkZSVFqzp
   CjpJVXzZxFpTrLP2xBS7+z/IvNi2BNLHLpVHbgY95FxunZYiHPzKdBFKQ
   vz+XLnN8WMJObNGIYfVGWfjdws3g/v1HPWk/b0LAUzSgyoE6ZZP1WJ3N3
   Q==;
X-CSE-ConnectionGUID: cde2xgb2Tka0sKLmi+eNmg==
X-CSE-MsgGUID: gy36SJfTTsW8eLL1FuciWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="227738376"
X-IronPort-AV: E=Sophos;i="6.21,173,1763391600"; 
   d="scan'208";a="227738376"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 18:14:49 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id BDC9EC0034E
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:48 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 76A388D29D8
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.254])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id AB80A2000769;
	Wed, 24 Dec 2025 09:14:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 28/28] sip: upgrade 6.15.0 -> 6.15.1
Date: Wed, 24 Dec 2025 17:13:04 +0800
Message-ID: <20251224091304.974-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251224091304.974-1-wangmy@fujitsu.com>
References: <20251224091304.974-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:15:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122878

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/sip/{sip_6.15.0.bb => sip_6.15.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.15.0.bb => sip_6.15.1.bb} (87%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.15.0.bb b/meta-oe/recipes-devtools/sip/sip_6.15.1.bb
similarity index 87%
rename from meta-oe/recipes-devtools/sip/sip_6.15.0.bb
rename to meta-oe/recipes-devtools/sip/sip_6.15.1.bb
index 1cce35db9a..b00d5d5e7a 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.15.0.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.15.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=236276327275fdb261636fb40b18d88d"
 inherit pypi python_setuptools_build_meta python3native
 
 PYPI_PACKAGE = "sip"
-SRC_URI[sha256sum] = "3920f26515456ee21114a1f8282144f8c156b1aabc3b44424155d5f81396025f"
+SRC_URI[sha256sum] = "dc2e58c1798a74e1b31c28e837339822fe8fa55288ae30e8986eb28100ebca5a"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.43.0


