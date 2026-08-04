Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F074C55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:19:25 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10310.1785820757153520350
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=S8gXeEsl;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785820757; x=1817356757;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GI4A3yxVfQ8SaJsdFU6TGmhGLFzhQH1e9obxnv6VwQo=;
  b=S8gXeEslWlpPKrCWbdYDxQTu7kXYLcsHP9sUEUZblPTyOQ870/x4Qdtx
   gHFGfYR/6/ok23/RNQljKRouvtlPXvVDr82RLV7PVHPkbJWyJaud5utJL
   FZ+8+gKNU8BUMtyy9dn5cvx20r82+9QxQGxyhPekuC7dzdXkBvWA7hUll
   HPlqJWrP5nL66Ah6qOBQjupVbw/4h8/zck6D5MlFs8r1XzDK6fWCOpT/8
   1apqF53O/VO7x7IjzpT3TYBhaD2il6JBBmBLlRgTFyGmHuh1EaoqIC70+
   3kKgFgMx5GqqWGBEeS/5rhMnqw1tUW4hWG1SWu5OFPSn2Zl+O+Z0hqlOg
   Q==;
X-CSE-ConnectionGUID: NrUWoqq2S8W1n0f+5/znGg==
X-CSE-MsgGUID: CaqgvFZnS/uMn2F1/MwvfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="249616344"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="249616344"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:19:16 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 886A71C000A7
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:19:15 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 3EC4D1800EA3
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:19:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 561D81800122;
	Tue,  4 Aug 2026 05:19:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/28] python3-huey: upgrade 3.3.0 -> 3.3.2
Date: Tue,  4 Aug 2026 13:17:15 +0800
Message-ID: <20260804051726.1489-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804051726.1489-1-wangmy@fujitsu.com>
References: <20260804051726.1489-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:19:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128722

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-huey_3.3.0.bb => python3-huey_3.3.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_3.3.0.bb => python3-huey_3.3.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_3.3.0.bb b/meta-python/recipes-devtools/python/python3-huey_3.3.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-huey_3.3.0.bb
rename to meta-python/recipes-devtools/python/python3-huey_3.3.2.bb
index 105f0e6220..47758ea655 100644
--- a/meta-python/recipes-devtools/python/python3-huey_3.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_3.3.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 PYPI_PACKAGE = "huey"
 
-SRC_URI[sha256sum] = "e0c2a1542e6c3acb894821cde895cf9dbf72e42deb25f55b2d44096aa30f8f24"
+SRC_URI[sha256sum] = "f8fd7610baec0fdf9359b0e033a02566ccbba9c865139086ba644e03c426e4af"
 
 RDEPENDS:${PN} += " \
 	python3-datetime \
-- 
2.43.0


