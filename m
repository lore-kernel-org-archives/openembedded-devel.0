Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8481ACDB47F
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:01:46 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7223.1782378094534315168
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UOlDl7PG;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378096; x=1813914096;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1lWgFghVuGh2NZ2DvOPqEfOHVuPRSOOYESdCG8fHcms=;
  b=UOlDl7PGY29uVtTNnInIXbDSpZu3tgahjMYs0daFK1IWo4xvXj7xM2x9
   hEaOiBC96t54SKctJbs77zRopAQAz7jhQDs7XSCUcYR1VZopkshypGUaj
   GlZyrnQBQaW93k/gqF8v5B6jATNelrpoBkCdjdJmhYKUYnbNdKiWRvvgK
   pMpH8OKMdr2TX9FHGPtMPys9wJCXUFeI6SS/8AL7dIr2I2YwPau725b3j
   7bpgcDQsr0mTFUEybSUvcr/ncmrj63n9pl8bFyECGxy3MyaZp+2YfiPeJ
   HXTQVSFjQs3DqzFWhGzdWsKeZxNgkhMW3JnpJ2PhnLlmSyb11oM3AP2pM
   A==;
X-CSE-ConnectionGUID: imTXdCIpTaG5jGctjw/BuA==
X-CSE-MsgGUID: EdBsNtsXRGy0m4Xk4EE00Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="244743083"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="244743083"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:01:36 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D22E61002B87
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:35 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 8DBE5C041E6
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 9FF7E1017325;
	Thu, 25 Jun 2026 09:01:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/47] glaze: upgrade 7.8.1 -> 7.8.2
Date: Thu, 25 Jun 2026 17:00:43 +0800
Message-ID: <20260625090127.1563-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127734

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add WebSocket autobahn client testsuite
- Fail fast after receiving invalid UTF-8 payload in WebSocket connection
- Fix HTTP date formatting data race
- Fix exception reads from generic JSON
- guard iterator against end in stencilcount
- guard fixed-size arrays in beve bool and complex readers
- guard eetf_to_json length readers against char sign extension
- guard eetf big integer sign byte read against end
- guard http_client chunked readers against chunk size overflow

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/glaze/{glaze_7.8.1.bb => glaze_7.8.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/glaze/{glaze_7.8.1.bb => glaze_7.8.2.bb} (92%)

diff --git a/meta-oe/recipes-support/glaze/glaze_7.8.1.bb b/meta-oe/recipes-support/glaze/glaze_7.8.2.bb
similarity index 92%
rename from meta-oe/recipes-support/glaze/glaze_7.8.1.bb
rename to meta-oe/recipes-support/glaze/glaze_7.8.2.bb
index d1ed7d7605..293adc1981 100644
--- a/meta-oe/recipes-support/glaze/glaze_7.8.1.bb
+++ b/meta-oe/recipes-support/glaze/glaze_7.8.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4d29875d83fbbf50485c846dbbbed8"
 
 SRC_URI = "git://github.com/stephenberry/glaze;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "9618ef8ef503c72b10e7b2769839784f09d24d2c"
+SRCREV = "c2eef5e33ef0b0e221e8b2154f7988dcaa13f483"
 
 inherit cmake
 
-- 
2.43.0


