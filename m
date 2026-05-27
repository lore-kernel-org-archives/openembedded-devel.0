Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64783CD6E44
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:54 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16815.1779875388023606736
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=N1w5YBF2;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875388; x=1811411388;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DOGDn0fu1AWOjqgqe6TZhy1DC/VG6x/kW2CvF/Ai1t0=;
  b=N1w5YBF2VPcwUVRX7VXfY8x0bnLgedW5rqMnMcwyRGCwPXRmWxdGlRV4
   maBPaQX+AFvIgXr/eYIO5GyZa1AbP1l1eM+ht+/cAKQt9dsvYJk9s/Hw7
   lpRXeN9TjSP6W7iJRHr7SZZtnAwOl7tyjQwkZxKluYWESuMXrNJvsCaxE
   tIvc+rUeju3mm/EH4FNsVF8Xa27hNxaj1PPFg8tu82sX9Zy+GWW+eP3/N
   3I8fFC0dzyZwaLoFY9VokGB7daPAEKjMQ/tL662E1Llr81Vprl9WO1nfC
   fzjKSIB5i6F7IZQQzMUn5XV9mrKEgCKwuZvFN3OEG4WxFnTPclf1+TTYU
   Q==;
X-CSE-ConnectionGUID: X9e/FXK5Rpix5i8vTIxhQg==
X-CSE-MsgGUID: VDV3MX1nTVajcxuTCIeffQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="229391941"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="229391941"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:46 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 9329A1000147
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:46 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 44362100D211
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 4FAD782A2D5;
	Wed, 27 May 2026 09:49:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 54/56] unbound: upgrade 1.25.0 -> 1.25.1
Date: Wed, 27 May 2026 17:48:03 +0800
Message-ID: <20260527094805.2039-54-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127262

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../unbound/{unbound_1.25.0.bb => unbound_1.25.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/unbound/{unbound_1.25.0.bb => unbound_1.25.1.bb} (98%)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.25.0.bb b/meta-networking/recipes-support/unbound/unbound_1.25.1.bb
similarity index 98%
rename from meta-networking/recipes-support/unbound/unbound_1.25.0.bb
rename to meta-networking/recipes-support/unbound/unbound_1.25.1.bb
index 8e0d3f346d..7331fc01d1 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.25.0.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.25.1.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://run-ptest \
            "
 
-SRCREV = "25fe6020248df41f891c921b254cf91d3d55f194"
+SRCREV = "75b6dba593d4fff000434cd64807c6ebd50bd244"
 
 inherit autotools pkgconfig systemd update-rc.d ptest
 
-- 
2.43.0


