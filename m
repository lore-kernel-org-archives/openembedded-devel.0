Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F6AC3DA4A
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 04:15:53 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.7615.1745900151983593155
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 21:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Rq2edYLv;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745900153; x=1777436153;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ogKkTbq/pkvI8Ho/rPhTwj9GyLA5zbviO8pEi5dwxmk=;
  b=Rq2edYLv4laRoyv/jjo7CiXbBdfDelczj5VPaTSs02dB+GEOWh1N03jr
   8KTCImP+6mH7Ss9wz5AbDGezC4xKnS72OT5alTN/pbcMkxRXyxyEiHz0P
   xO/euRPMTK7joEjptS0lOCqvhWyjjWaveOUNEfYOsyn/yoc+/EaZBq3vm
   k/iqj4dWt7MNDmioj1i0eztZ1bm0khHMsPGyVlsqIAy3kRwLuSN/nlpfK
   L2nKKhf/UE4KR1upepHJsz3q+Q1n4RSMu/4Ww7xLbClOpCWaW8R6I67Wc
   YU07rvB8GC/zATFjL+eKtWjumHGHR2p3vCuqWFooB3dRC4s2deEaddSGP
   Q==;
X-CSE-ConnectionGUID: 8JSONF2HR3a/J+R5TOL3FA==
X-CSE-MsgGUID: Ir6ASrBaQsiLLfmu6Z77oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="177458653"
X-IronPort-AV: E=Sophos;i="6.15,248,1739804400"; 
   d="scan'208";a="177458653"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:15:51 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4B7CCD4807
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 09062D88A9
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:49 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BE2F81A0071;
	Tue, 29 Apr 2025 12:15:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/23] python3-grpcio-channelz: upgrade 1.71.0 -> 1.72.0
Date: Tue, 29 Apr 2025 12:15:28 +0800
Message-Id: <1745900138-26424-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
References: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 04:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117215

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...cio-channelz_1.71.0.bb => python3-grpcio-channelz_1.72.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-channelz_1.71.0.bb => python3-grpcio-channelz_1.72.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.71.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.72.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-grpcio-channelz_1.71.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-channelz_1.72.0.bb
index d1c694b4cb..ec6279a87c 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.71.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.72.0.bb
@@ -11,7 +11,7 @@ DEPENDS += "python3-grpcio"
 PYPI_PACKAGE = "grpcio_channelz"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "2f6b661dee6b43ff76f38fd4fa17949f3847ea82e515d6e6f21f4fcfe046ecf2"
+SRC_URI[sha256sum] = "3dcb2df1cb9c905f7daaf08bcec214fd082809a59adf1405b66d44f56ef0fad1"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0


