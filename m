Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47527CD5838
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:29:44 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3095.1767781774076152305
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:29:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IMooImqf;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781774; x=1799317774;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ck48D+hPW/71/+ytpimW0etNteIZW5jGkPsl8kyvhAU=;
  b=IMooImqfHrJjJOVZlLVuRNaq8dSQ4L33X4580K9lTgVQL97AcFMc/6IW
   8+x1yRpSex4gFAYwjC0kU4SLM2THgu7Du2ntjkS91PxFLEydkgci2u4UT
   oPuUQRDgqR5Y/zNjlhs8b6I1M3icvlj+zk0H3iFa/p1mNKwVX/5uTEDyq
   kIVT2t4BNjk3RuqbVChMivPJgIawK1QTCBmt4l/skW9rgrNpIKhBym+bM
   ycSIzI5x95I79omYqFnbc2oNDLXZTDU5BnJvPXscYKILJqdJNBWR99Off
   eNllZC7HWaGoY1t9Dz8OYztPsBvsOTRZeKRuYCy8jXZavuFtGzv9kVNqL
   g==;
X-CSE-ConnectionGUID: S90SiUUNSIa/gjmBTHn8nw==
X-CSE-MsgGUID: GZmgV0eQSJiSdxPZqyrQaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="213016690"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="213016690"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:29:32 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 724D5820711
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:32 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 20D7B1809C1F
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 54914829F3C;
	Wed,  7 Jan 2026 10:29:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/24] python3-marshmallow: upgrade 4.1.2 -> 4.2.0
Date: Wed,  7 Jan 2026 18:28:46 +0800
Message-ID: <20260107102855.228-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107102855.228-1-wangmy@fujitsu.com>
References: <20260107102855.228-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123213

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 many argument of Nested properly overrides schema instance value.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-marshmallow_4.1.2.bb => python3-marshmallow_4.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_4.1.2.bb => python3-marshmallow_4.2.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_4.1.2.bb b/meta-python/recipes-devtools/python/python3-marshmallow_4.2.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-marshmallow_4.1.2.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_4.2.0.bb
index af973b2cf9..006f91838c 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_4.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_4.2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
                     file://LICENSE;md5=27586b20700d7544c06933afe56f7df4 \
                     file://docs/license.rst;md5=13da439ad060419fb7cf364523017cfb"
 
-SRC_URI[sha256sum] = "083f250643d2e75fd363f256aeb6b1af369a7513ad37647ce4a601f6966e3ba5"
+SRC_URI[sha256sum] = "908acabd5aa14741419d3678d3296bda6abe28a167b7dcd05969ceb8256943ac"
 
 CVE_PRODUCT = "marshmallow"
 
-- 
2.43.0


