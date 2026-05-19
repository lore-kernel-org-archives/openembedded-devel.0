Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A14CECD4F57
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:41:23 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19342.1779190875628732343
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:41:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PxnQsZwc;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190875; x=1810726875;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ksH9ru7bTW7aun61sGXLqMgTV4pmj6je3hyqxxIxcc8=;
  b=PxnQsZwcytW3C/gLxpazjiqiFVGpQsAlfG/blTrGfk5KEbDzHsTkdcOs
   OlaGgxI99Q3xJvZSw8vrxGyvaysVe4vbwOtepiBa061JX/Hl8thCApwVq
   F/7wShOGMiryRaFA84oCwS0hK49MgxsHCbKUM1CIjipmCtl5dQ06YBTkh
   PZsX/4fsODdkiS5F6LGLK0hURm6kSjoK4zS86RP2qSXpDiVGaOXYCRpXO
   4ZDn1H3cmElDflb69a+lmNuOk8fmotzfMJWvGnVNw+AwP3kI2+C630ulB
   S/naS5jFYTP/lcX5uNm7/bgs+AnOzBjQNi+tQRWWo6swu8ZZR1n4+G1AB
   w==;
X-CSE-ConnectionGUID: CvGA9OBlQsOxKTaaJLMQUg==
X-CSE-MsgGUID: dz4eLeiDQyOrS4t2jaQ4xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="239231341"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="239231341"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:41:14 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 28C24C0035B
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:41:14 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id D2D6B84F4AC
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:41:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 82AEC4066E4;
	Tue, 19 May 2026 11:41:11 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/38] python3-twisted: upgrade 25.5.0 -> 26.4.0
Date: Tue, 19 May 2026 19:39:16 +0800
Message-ID: <20260519113921.655-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127095

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-twisted_25.5.0.bb => python3-twisted_26.4.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-twisted_25.5.0.bb => python3-twisted_26.4.0.bb} (97%)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb b/meta-python/recipes-devtools/python/python3-twisted_26.4.0.bb
similarity index 97%
rename from meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
rename to meta-python/recipes-devtools/python/python3-twisted_26.4.0.bb
index 8ce5740e0b..7d7f5d3053 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_26.4.0.bb
@@ -4,9 +4,9 @@ Twisted supports TCP, UDP, SSL/TLS, multicast, Unix sockets, a large number of p
 HOMEPAGE = "https://twisted.org"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5316a448a61a38d722c291f78d915d11"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ff950f7bafa004a86f478dc9eaf8106f"
 
-SRC_URI[sha256sum] = "1deb272358cb6be1e3e8fc6f9c8b36f78eb0fa7c2233d2dbe11ec6fee04ea316"
+SRC_URI[sha256sum] = "dbfd0fe1ee409d0243fdd7a6a6ff14f4948cec1fd78e0376291f805e1501fae9"
 
 CVE_PRODUCT = "twisted"
 
-- 
2.43.0


