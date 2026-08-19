Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13939C5DF85
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:32 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3314.1787132185113744057
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mWhPEpjF;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132185; x=1818668185;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gh4FDTJaZa+x5A6kxZBkvpTS4SE5g7fhMEnRyp8VWOU=;
  b=mWhPEpjFAn19ewZSXMCs1letzjSzul6anuug/Rm52C4RILrEfK+7J6CX
   eW+/tQfl2qw2XOWFErO/cwdGCOTuwB8uvaBEum2kwcV225SMQBwgLlGzU
   HQ4i3MwQGAxPKbusneYR1NCBpdjoMRcfswcrn1HEq8E6AzwZG3tmBnZ1J
   FTe5muIzlCtw9zAXkj/D2ELYF0Pyo0ZskhK2m14NRCPxj2tavjR75u6zq
   c5J6H2psAIn+wQCHPIQEXTbu34mcrL/4q43y1uW4DhGzdNSYhkQOdyhG5
   0Gq+J6A6oiMODO8HRcfM7nDmQ6O61R4KKaXFiiu5/rUwy/RGVAnTBMW8O
   A==;
X-CSE-ConnectionGUID: X62YFPFxQNKJJwtYS5N2Ig==
X-CSE-MsgGUID: 381JmYdVRCmLnhmfa25geA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="251882257"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="251882257"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:23 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 73B021C000EA
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:23 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 23A79101D6A2
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 1DB851801C20;
	Wed, 19 Aug 2026 09:36:20 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/70] python3-huey: upgrade 3.3.2 -> 3.3.4
Date: Wed, 19 Aug 2026 17:34:40 +0800
Message-ID: <20260819093514.1101-36-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129306

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Forward the Django database OPTIONS when setting up the stats recorder
  connection.
- Remove accidental sqlite3 access at module scope,
- Use DoubleField for the stats ts, duration and started columns. On PG & MySQL
  the old FloatField was a 32-bit-shitter which lost a lot of seconds of
  precision. Existing PG/MySQL tables will need to run the SQL below to migrate
  OR just drop the tables and allow them to be rebuilt next run. SQLite was not
  affected.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-huey_3.3.2.bb => python3-huey_3.3.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_3.3.2.bb => python3-huey_3.3.4.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_3.3.2.bb b/meta-python/recipes-devtools/python/python3-huey_3.3.4.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-huey_3.3.2.bb
rename to meta-python/recipes-devtools/python/python3-huey_3.3.4.bb
index 19d2e59ef2..c292cd5666 100644
--- a/meta-python/recipes-devtools/python/python3-huey_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_3.3.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 PYPI_PACKAGE = "huey"
 
-SRC_URI[sha256sum] = "f8fd7610baec0fdf9359b0e033a02566ccbba9c865139086ba644e03c426e4af"
+SRC_URI[sha256sum] = "6de196c6ece2e38b5173f7510600091ab035c0e86b0958d0e5b38a82b9984666"
 
 RDEPENDS:${PN} += " \
 	python3-datetime \
-- 
2.43.0


