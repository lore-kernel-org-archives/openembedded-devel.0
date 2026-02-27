Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 421C2FD7F6B
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:14:30 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92444.1772187260081930582
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:14:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IXG7Va41;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187260; x=1803723260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SKUILKpUd6TWDtgsWHybxIr/wFI2hC2mVL5dQvKyZoA=;
  b=IXG7Va41nunzuDClRyl3DyflrH4XUOo88Tf4J2ANJYl/RHebPZ7jtkAs
   X8VNr8Jq2fwe7QpEOSWnIeLKJ+weVCyTsK2SM6DmAwVnmmEGCcbBjlBJC
   zYbpvnxkoH8G21WEX/zcB4hRW1j8LihjS0DMoAdJNl8n9AMeN7e6aU7ng
   f6vgFjREOqBwXFOptQxiIAC6FfEJ/lvbUkwflRQRoXb49n7xdOizyE6Sk
   BPL5relPOTMByBgA36nTVwL1mqDxCPqVYadbSpm4PCorVx3b59tNL/3mh
   0a4LIDSKz3hPDlXjyhniXpHVsY/+XbCqQcK9BDxQ4/unGvK35eWaRh06C
   w==;
X-CSE-ConnectionGUID: Zj3mpd3BQWKl1w5YZn9F+g==
X-CSE-MsgGUID: RTchfR/RRQuEZirWd98Eug==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="235523416"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="235523416"
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 9BCF71C0009A
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:18 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 4B35D1C10088
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:18 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 75E2118005BF;
	Fri, 27 Feb 2026 10:14:15 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/52] python3-isort: upgrade 7.0.0 -> 8.0.0
Date: Fri, 27 Feb 2026 18:12:52 +0800
Message-ID: <20260227101327.1432-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124717

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Update CHANGELOG for version 8.0.0
- Fix edge case of __future__ import.
- Fix the Plone profile to be compatible with black
- typo fix
- Remove the setuptools plugin
- Turn some warnings into errors in test suite
- chore: replace black with ruff in clean.sh
- feat!: remove old finders flag and legacy finder logic
- Fix whitespace insensitive check triggering on tabs
- Fix line separator detection not considering form feed as white space
- Fix #1964: lines_before_import sometimes ignored
- Remove reference to 3.9 in README

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-isort_7.0.0.bb => python3-isort_8.0.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-isort_7.0.0.bb => python3-isort_8.0.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_7.0.0.bb b/meta-python/recipes-devtools/python/python3-isort_8.0.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-isort_7.0.0.bb
rename to meta-python/recipes-devtools/python/python3-isort_8.0.0.bb
index 86ad769b1d..36cf91ba6e 100644
--- a/meta-python/recipes-devtools/python/python3-isort_7.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_8.0.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=197c46995787b46a2dbf0d519c1754cf"
 
-SRC_URI[sha256sum] = "5513527951aadb3ac4292a41a16cbc50dd1642432f5e8c20057d414bdafb4187"
+SRC_URI[sha256sum] = "fddea59202f231e170e52e71e3510b99c373b6e571b55d9c7b31b679c0fed47c"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


