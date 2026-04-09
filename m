Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C10EA3C3E
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:34:10 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128833.1775730843014055707
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:34:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lRBiyR6T;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730843; x=1807266843;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RvHa3XuTr50VeNTHcayyynrWUANCXudvboC90z/DyZw=;
  b=lRBiyR6Tm08rKK4hLQ6dqyY5LhZpbv+9k2p135uO8PMMZFfR4norQuCx
   0wWAwLTyvDGueI9fpRKroapEXUxTHWGW6pJir+7YVGY4Z5RlCQoWiVymW
   ZpSu09tIugre1O6LqQxJXFt/ynACw/9TR5nZDyNZtwGWAEVtPNx4Jjdpm
   10R4o2Gv5Xu5xP6hMhuEA5IFsAkttzfFGU78ZhEifFYE25VDJEZPdy5dh
   /tQAkGRa3Xb+BAnz+zTyaLo8VjT3dg38tXkBw/nKH08wIqRX+2P3S4F+I
   cQfRYJui2hJ3FESHahAlF5NW37+vjlk6G1NWtAfKigCyomdJbM7VogfXj
   Q==;
X-CSE-ConnectionGUID: +ZhhK3LOSwSTzFPIY1J8Lg==
X-CSE-MsgGUID: RO5161msR2qr0H3CfVmceQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="224322045"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="224322045"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:34:01 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 7A06C483
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:01 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 2D4241C002CE
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 99931404950;
	Thu,  9 Apr 2026 10:33:58 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/37] python3-google-auth-oauthlib: upgrade 1.3.0 -> 1.3.1
Date: Thu,  9 Apr 2026 18:32:07 +0800
Message-ID: <20260409103223.1574-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126170

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Allow Protobuf 7.x
- Require Python 3.9

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-oauthlib_1.3.0.bb => python3-google-auth-oauthlib_1.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth-oauthlib_1.3.0.bb => python3-google-auth-oauthlib_1.3.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.3.0.bb b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.3.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.3.1.bb
index 0eed90090c..7f9435d475 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.3.1.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI += "file://0001-python3-google-auth-oauthlib-Skip-failing-3PI-creden.patch"
-SRC_URI[sha256sum] = "cd39e807ac7229d6b8b9c1e297321d36fcc8a9e4857dff4301870985df51a528"
+SRC_URI[sha256sum] = "14c22c7b3dd3d06dbe44264144409039465effdd1eef94f7ce3710e486cc4bfa"
 
 inherit pypi setuptools3 ptest
 PYPI_PACKAGE = "google_auth_oauthlib"
-- 
2.43.0


