Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC5610A3D67
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:54 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45658.1774526264727324418
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RW1tUjxx;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526265; x=1806062265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y4CsYhxLpMPAtDF/5OtUiDJWxe7bsrP6OifLefc1Ua0=;
  b=RW1tUjxxkFHFvy2kRHA1oYhyPYEdMWD1ZCEILWiLwmCXas3HeiNLCcRs
   KhMg7Iovx8dVVwIUTJuhxMJSasAdOvO9Z8l+5p3KmfkFRBklFeRXQ5NuO
   HQEa0Vnav1m6seII6yNPxQLYPd/M/BsyWZiGpqER+bdA22aearT/canK/
   hR00WIybmR0w+Dz9rDGJJDvbP2MSbvDEbPuq+XWfYCNpgiX1iuAiJpssn
   W6TvgsXpcPN3/dA0y/vnP3R6oCKTsef1FZHtpZLjh63D3cXKHPVfHM94l
   2K5CqtGk9AQG/G2VwkLwPMVE+TduJTPyKYJSbpFY0xcqmA/i/30IoYLVe
   Q==;
X-CSE-ConnectionGUID: Xd962pJkSj+yV/kAh3HwNw==
X-CSE-MsgGUID: udN60c61TY2TxOUqdCrA0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="213717107"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="213717107"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:43 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 4BDF41002B82
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:43 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 06036C0021A
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 986C5180715C;
	Thu, 26 Mar 2026 11:57:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 39/63] python3-inline-snapshot: upgrade 0.32.4 -> 0.32.5
Date: Thu, 26 Mar 2026 19:56:09 +0800
Message-ID: <20260326115634.1199-39-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125694

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.32.4.bb => python3-inline-snapshot_0.32.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.32.4.bb => python3-inline-snapshot_0.32.5.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.4.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.5.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.4.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.5.bb
index 41b365963c..32b8d15249 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.4.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.5.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "f6c21f3a5cb8b4cc5a9ae80fa5d1b66bb642195884ddd6960d383c21a2258318"
+SRC_URI[sha256sum] = "5025074eab5c82a88504975e2655beeb5e96fd57ed2d9ebb38538473748f2065"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


