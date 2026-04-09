Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 941C8EA3C35
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:33:50 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128830.1775730828216382478
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TMmQ/qKT;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730826; x=1807266826;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ciQ1nPrWaVZblcYvFm1hT0118UoLck56Cse+1L/HMjw=;
  b=TMmQ/qKTOOm1ggBBj7aWM+vFiCgkEYhvijZAQyvUloTwJw0N7h+8fljn
   9RS3mhmvys7zea0XgUROrMRP9y3tm3HUzIhJgHPxiwnKfF2RvdnOdTycO
   AHVQHWiTT8XgfoSsTozg8HVeMhZKEkv2j3/7gI+d4r+92adqmzkTG2cWw
   j3uFlw3HO2s3R2LQp3J/ZZXz07iCLRTFDnBYRsOv++Mo0OIN4SVeX5Uqi
   DpOMPhsnuJMst4g/WKDlcvQsSGcQGnyPhNhwzzuYbvaExZCoowWzByAou
   rfu5u9xuCUjxy+RQeEyaVPpZta65JuXV8Zt3nNDDRcwARjbi60Rh90lGp
   g==;
X-CSE-ConnectionGUID: kbV44zKHQP+K0Gf8ULy8rw==
X-CSE-MsgGUID: bh1SLAp4TxShp6shAnMnYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="237107665"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="237107665"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:33:45 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id CAA8B1000154
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:33:46 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 7C3801804156
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:33:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id DAB194046AC;
	Thu,  9 Apr 2026 10:33:43 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 14/37] nbdkit: upgrade 1.47.5 -> 1.47.7
Date: Thu,  9 Apr 2026 18:32:00 +0800
Message-ID: <20260409103223.1574-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:33:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126163

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.47.5.bb => nbdkit_1.47.7.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.47.5.bb => nbdkit_1.47.7.bb} (96%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.47.5.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.47.7.bb
similarity index 96%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.47.5.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.47.7.bb
index 5ec440fc18..3b64ccb439 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.47.5.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.47.7.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=26250adec854bc317493f6fb98efe049"
 SRC_URI = "git://gitlab.com/nbdkit/nbdkit.git;protocol=https;branch=master;tag=v${PV} \
            file://0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch \
            "
-SRCREV = "131372494a384a2ee21b97ec9375b7a55636a417"
+SRCREV = "12ad24489c3de7b3810ae82fcffbdc113e1859ca"
 
 
 DEPENDS = "curl xz e2fsprogs zlib"
-- 
2.43.0


