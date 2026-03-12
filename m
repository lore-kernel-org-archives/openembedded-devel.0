Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1335CFED2FE
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:52:46 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18510.1773312756591251179
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:52:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=j6JO7Yh7;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312756; x=1804848756;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xGibUTwn4i5nbmjd1Vy4/2p2uF7NCrP8ii4+JvWQGaY=;
  b=j6JO7Yh7FD9dKWwjMKHie8vF8lUHZxbqTFNefpsh6yqM+Se6xSQwNsdF
   lgK6kRPEDlAJ4m6IAPFZ8Fu3DJhbLLheIAio7aaDvK3bd0WLHUtDcaafH
   0mkKT6WecBeLCuPczz1VOu/n2lC1+QToYhxlyfp8YZuoYTqFpGd6sBiEB
   ts1xswaAoyOQ+R77vkoDql4Gs+pddu47XpHelxTkMr3ucx0J0FMgf3LZP
   p782JkCSMlVQNL8XWyKErY8Gr1k8fd4tTlaQRwd8tiA3oM2hLQGX/ejjn
   HVYgz+n1bQPSRZhS2XkB70JCCNGrau3qCE08qTmpSOIAAEh+B6taSrsQ2
   Q==;
X-CSE-ConnectionGUID: XA3kGYAeRu6ZXEOmoH1A+g==
X-CSE-MsgGUID: JJpDXhiUQCaMAg9rBLQj+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="232989757"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="232989757"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:52:34 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id CA70E2B81
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:34 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 7F0B31003BF5
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 9A2601801925;
	Thu, 12 Mar 2026 10:52:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/64] freerdp3: upgrade 3.22.0 -> 3.23.0
Date: Thu, 12 Mar 2026 18:51:20 +0800
Message-ID: <20260312105220.1856-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125104

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../freerdp/{freerdp3_3.22.0.bb => freerdp3_3.23.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp3_3.22.0.bb => freerdp3_3.23.0.bb} (99%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.22.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.23.0.bb
similarity index 99%
rename from meta-oe/recipes-support/freerdp/freerdp3_3.22.0.bb
rename to meta-oe/recipes-support/freerdp/freerdp3_3.23.0.bb
index c182ee1339..52ec74d5d7 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.22.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.23.0.bb
@@ -8,7 +8,7 @@ RDEPENDS:${PN}-ptest += "cmake coreutils"
 
 inherit pkgconfig cmake ptest
 
-SRCREV = "e3ef4c71138f76516299cb3637d2d0c59b2a3737"
+SRCREV = "b933ae18d9ad2a1d73c610868fcc30eb61654070"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https;tag=${PV} \
            file://run-ptest"
 
-- 
2.43.0


