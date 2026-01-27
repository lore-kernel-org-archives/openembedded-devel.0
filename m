Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 114DAD2D8D4
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:44:58 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6896.1769507091153223657
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:44:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=S/uj+Mxg;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769507092; x=1801043092;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=srmd8OjDhOffNwjvZWWLIiUMYaL1qrnpTpGqbltKqRE=;
  b=S/uj+MxgWJk7omjHt0x1RvwjLnijtZrNiFI43Oei/yXHnpIHzZJ/l1pR
   B6Zg4pz/X1D9WGZu5ZR4lkbL9jS0MuS1ysxu6wYxDzfmrj4xxmLCOo5m3
   CqF6nSLBXn19jZ3zQuP+r1eJpQbIQcZ0UtT4hUIL113T9SvViuzxUO6r6
   fb/AFHB8yJMTQcNskU1QLaKY1b9oAUG2PyuTWestL8oHfxj8LpwHFV+PG
   yyD72VnhNXaZCKUi3xfVwel1T7XNVHDfubRbt9EuVOI/GtyLk0ziQycOr
   t8iQtEZz+ep2J3KjwZGryHOeakyeVxNoRI5qr4XbY3SK1qk1PBFaoJLUU
   w==;
X-CSE-ConnectionGUID: aLgVxD1fRoKSoToGp0SiqQ==
X-CSE-MsgGUID: 2yQjt6ovR7uH7D0YM+npzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="227252752"
X-IronPort-AV: E=Sophos;i="6.21,256,1763391600"; 
   d="scan'208";a="227252752"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:44:21 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 05E9742A316
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:20 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id AFB63180320A
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 1F65320000EC;
	Tue, 27 Jan 2026 09:44:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/25] python3-elementpath: upgrade 5.1.0 -> 5.1.1
Date: Tue, 27 Jan 2026 17:43:29 +0800
Message-ID: <20260127094339.1081-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260127094339.1081-1-wangmy@fujitsu.com>
References: <20260127094339.1081-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123930

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-elementpath_5.1.0.bb => python3-elementpath_5.1.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_5.1.0.bb => python3-elementpath_5.1.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_5.1.0.bb b/meta-python/recipes-devtools/python/python3-elementpath_5.1.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-elementpath_5.1.0.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_5.1.1.bb
index 06bfa2cf1b..d89a012f9a 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_5.1.1.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "Provide XPath 1.0 and 2.0 selectors for Python's ElementTree XML data structures, both for the standard ElementTree library and for the lxml.etree library."
 HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9291d2ba8ccce92cf704b173e0dca725"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c04ab6ce886cc843af8941bb199406ba"
 
-SRC_URI[sha256sum] = "61618f64686ce73cf6f191b17298e2568e9a1763b125fc7f2cb796ad0eacfd1e"
+SRC_URI[sha256sum] = "c4d1bd6aed987258354d0ea004d965eb0a6818213326bd4fd9bde5dacdb20277"
 
 PYPI_PACKAGE = "elementpath"
 
-- 
2.43.0


