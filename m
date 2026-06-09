Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3251CCD8CA8
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:30:12 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76509.1781001010666241103
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CCxXi9ry;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781001011; x=1812537011;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XPs2XtUrzjDPrpHh6IdcYSyGYukGHwuy2aFzWgtywN8=;
  b=CCxXi9ry9VPNjeU4T6B7UAcdDzmX9o50iEVq+gTTGaISnxMfoKv6UCcX
   gDj5FS6tReSaZqY02L9Ix2izbamCQwj1kkSGxcoJIcsV9lVEAaNYynxVJ
   qebH5AM34o0PUu3CSTdrAFFWkDsI3LCzz4bqIJvfvYbncyX2RHkri9Cis
   WmV70zZSpI2jk2GUclnFISqRRUzscUg/vT/Kk3G/lIEpNu/dIWhVYb7Ia
   PFRu8ogZA6QpiQ4ZrFl6o7JqZ+7m+Dymy1jZeLwmRHedUOzyW99/sKw7G
   ZzWsRHzEyNWtIVQoPUtsdhVubNbR17jjefnVsM1zrRteCe2zkYm7b3oPX
   A==;
X-CSE-ConnectionGUID: IeeKVpK+SZ2As7WHzlyXHA==
X-CSE-MsgGUID: nva3V2j9TWW1ZljB/DE6tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="229674121"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="229674121"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:30:09 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 28EA4C00416
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:30:09 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id D5C9AC00818
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:30:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 0F32810003C5;
	Tue,  9 Jun 2026 10:30:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/30] python3-python-multipart: upgrade 0.0.30 -> 0.0.32
Date: Tue,  9 Jun 2026 18:29:06 +0800
Message-ID: <20260609102913.2204-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127477

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Speed up partial-boundary scanning for CR/LF-dense part data
- Speed up multipart header parsing and callback dispatch
- Bound header field name size before validating
- Validate Content-Length is non-negative in parse_form

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n-multipart_0.0.30.bb => python3-python-multipart_0.0.32.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-python-multipart_0.0.30.bb => python3-python-multipart_0.0.32.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.30.bb b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.32.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-python-multipart_0.0.30.bb
rename to meta-python/recipes-devtools/python/python3-python-multipart_0.0.32.bb
index 46c8ff72e5..9b73b9470d 100644
--- a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.30.bb
+++ b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.32.bb
@@ -2,7 +2,7 @@ SUMMARY = "A streaming multipart parser for Python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "0edfe0475c1f46ddd3ff7785a626f6118af32bdcf359bb21260367313bb32118"
+SRC_URI[sha256sum] = "be54b7f3fa167bb83e4fcd936b887b708f4e57fe75911c02aebf53efaf8d938e"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


