Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E8AD0C82D
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:24:51 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56072.1768299885340605714
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:24:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CAdJw5lM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299885; x=1799835885;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hWuKLflrH1MkAe/92FIZQm2HTmD3Xg1FmfOC6EVKe3Q=;
  b=CAdJw5lMhJAmKslvNVc9RC2BTYv3V9fG3+JaE7N0nhmtZCdnleaZ8hpE
   Rar7cOIdCw/GnCBvZUPnzNLOdIaoiFcca2Fz5egYoN5xtkGGdTvnswFoH
   iVUX8fntngdGReBZxolqiRpS8CT/nP6XyPMdSX+5YfJUdiagkaCcHLVmI
   xAqwwk92sisQQ9VaDle94WJ/APa0TdfqWZuxU6uLswbp8OTBc8DImJeTa
   JVwcLKUMHFq5SI74KkrkjgfP8Hah9D9lSsZ13X6b6x3wwnHPjnY9QHmCw
   Y6m+dbzAcvhH6r1oWmZH9tK0XObOa1G3ggxAokX9bRdxvR4AQo4av7eAR
   g==;
X-CSE-ConnectionGUID: 5bHZRd4oSzes5DowMPtRkA==
X-CSE-MsgGUID: cErl54B7TnugvwFHlve/NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="225618029"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="225618029"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:24:43 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id C38C21000349
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:43 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 787531003BC9
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id C47971019048;
	Tue, 13 Jan 2026 10:24:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/22] python3-pystemd: upgrade 0.14.0 -> 0.15.1
Date: Tue, 13 Jan 2026 18:23:29 +0800
Message-ID: <20260113102334.605-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102334.605-1-wangmy@fujitsu.com>
References: <20260113102334.605-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123423

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add wait_for_activation parameter to pystemd.run to wait only for service activation without blocking until completion
- Document cwd and wait_for_activation parameters in pystemd.run
- Drop support for Python 3.6-3.10, now requires Python 3.11+
- Add unit property and unit_name to TransientUnitProcess for easy access to the running unit
- Change development tooling to use uv for package management
- Change lint/format stack from black/mypy to ruff/pyrefly
- Add a lot of typing

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pystemd_0.14.0.bb => python3-pystemd_0.15.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pystemd_0.14.0.bb => python3-pystemd_0.15.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pystemd_0.14.0.bb b/meta-python/recipes-devtools/python/python3-pystemd_0.15.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pystemd_0.14.0.bb
rename to meta-python/recipes-devtools/python/python3-pystemd_0.15.1.bb
index 58247af55a..7698d6394d 100644
--- a/meta-python/recipes-devtools/python/python3-pystemd_0.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pystemd_0.15.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python bindings for interacting with systemd over DBus"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[sha256sum] = "56875ef5662122d251435f6efa0edfcf15e3c9c17f4a7b15d5481814cf268e6f"
+SRC_URI[sha256sum] = "f217b5792f1e7c391ae46262f43566b6f83364507eaab5d5e73fcd05ab12d2bb"
 
 DEPENDS = "systemd"
 RDEPENDS:${PN} += "\
-- 
2.43.0


