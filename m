Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4672111226C
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:15:52 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7109.1775096148359118781
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=es39VMB5;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096146; x=1806632146;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E2V/GEsRFOZ6N5LGr0KPANLdNd8T4sxPtFEcjAa3+mg=;
  b=es39VMB5dJOHOEF4VpLFg45+X8F2sxCYDNdVv1uwqvBE6ERykAw2lza8
   sNfxYELtI8A3GT82B+e6hGnxTERivo9usqUE8tBjHBDeg3pAGMWcjQzxf
   UQxlgWGWpJq5pf8NJQwk/+KDLWeSMVA9EEidWKi++EyI+ONVIeKcy0Z4v
   fgbY/Q98JPo8SpXTzQZn1w1VS9D8GMD2LXdhI8fHZUoh/qnacHJvh8+J3
   Qy9z61pwdT18qXp+YuS2mdzD5vuIpMgy9TfE9325aEJGpP2CVloi+BvFV
   w2K45T+ry00iSTsGNu/vnrxIypqt5zR+jlP08btTh67XrxHb4EiIDxoYB
   w==;
X-CSE-ConnectionGUID: NJ88fF7CRAC/70WTIY3eOg==
X-CSE-MsgGUID: KsZ6foiKT+OGYzL68DUWTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="223429718"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="223429718"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:15:45 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D2F391000141
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:46 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 83B5DC0425E
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 0801F10001CA;
	Thu,  2 Apr 2026 02:15:43 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/39] python3-fastapi: upgrade 0.135.1 -> 0.135.2
Date: Thu,  2 Apr 2026 10:13:40 +0800
Message-ID: <20260402021355.1324-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125940

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-fastapi_0.135.1.bb => python3-fastapi_0.135.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastapi_0.135.1.bb => python3-fastapi_0.135.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.135.1.bb b/meta-python/recipes-devtools/python/python3-fastapi_0.135.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-fastapi_0.135.1.bb
rename to meta-python/recipes-devtools/python/python3-fastapi_0.135.2.bb
index 4eb9dced82..a8ace95347 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi_0.135.1.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.135.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://fastapi.tiangolo.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=95792ff3fe8e11aa49ceb247e66e4810"
 
-SRC_URI[sha256sum] = "d04115b508d936d254cea545b7312ecaa58a7b3a0f84952535b4c9afae7668cd"
+SRC_URI[sha256sum] = "88a832095359755527b7f63bb4c6bc9edb8329a026189eed83d6c1afcf419d56"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.43.0


