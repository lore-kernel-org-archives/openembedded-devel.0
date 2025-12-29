Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC26E8FDB1
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 09:30:01 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40574.1767000590282734388
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 01:29:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=f7+kNkDq;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767000595; x=1798536595;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wUJIA/kx3PsKoK37dMD3fR3Ktrw7T8OIRY3WEoFywRE=;
  b=f7+kNkDqHRneZxtm37ozXeKu9KQCUE4y5eZUqu+yg6TvFagpQ1CguDcj
   E5SJbrfmV35QPDAg9PzvXO8g7uxHnmO+3QTqyCnSOE8tyDxenGsDIUYQ9
   LUzlHOds69PF0sKLQKovCwCKhEZjFCmy0PGt7jr2AxtQTSk76KPqJ99c+
   sGCk1BwThppoK9ggXa73JrqLyxM8T7Ec/YTo65QbNvu6XjvO+xZPUi474
   zowiuUpSkdYBsFU9U9BAMrdrplYX8PwZJdV7mZBY/38pVCvuVFctSMcLs
   a9RyLspHoQ7UOVVSn1fx3yDZkFvEA2bc8ymaVXMHYyUuhG/54Ri9QOAQj
   w==;
X-CSE-ConnectionGUID: k2ultHm7RnG2EGVF1B5CuQ==
X-CSE-MsgGUID: Kkos982hS9WxfSrLnhVw1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="203210080"
X-IronPort-AV: E=Sophos;i="6.21,185,1763391600"; 
   d="scan'208";a="203210080"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 18:29:54 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 8AD2C42A311
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:29:54 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 3B7A410001E7
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:29:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id B05C3100036E;
	Mon, 29 Dec 2025 09:29:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 06/10] python3-elementpath: upgrade 5.0.4 -> 5.1.0
Date: Mon, 29 Dec 2025 17:29:32 +0800
Message-ID: <20251229092936.1483-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251229092936.1483-1-wangmy@fujitsu.com>
References: <20251229092936.1483-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122970

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025.

Changelog:
===========
- Drop Python 3.9 compatibility and add Pyton 3.15 support
- Improve XPath sequence internal processing with a list derived type xlist
- Extensions and fixes for XSD datatypes
- Add XSequence datatype for external representation of XPath sequences

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-elementpath_5.0.4.bb => python3-elementpath_5.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_5.0.4.bb => python3-elementpath_5.1.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_5.0.4.bb b/meta-python/recipes-devtools/python/python3-elementpath_5.1.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-elementpath_5.0.4.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_5.1.0.bb
index 150a7245e0..06bfa2cf1b 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_5.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_5.1.0.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "Provide XPath 1.0 and 2.0 selectors for Python's ElementTree XML data structures, both for the standard ElementTree library and for the lxml.etree library."
 HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9291d2ba8ccce92cf704b173e0dca725"
 
-SRC_URI[sha256sum] = "85ed93565d6e94aefa160b12f36b12cbe4be6bf9bbde06b80f2c5c94829a25fb"
+SRC_URI[sha256sum] = "61618f64686ce73cf6f191b17298e2568e9a1763b125fc7f2cb796ad0eacfd1e"
 
 PYPI_PACKAGE = "elementpath"
 
-- 
2.43.0


