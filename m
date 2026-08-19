Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B73BC5DF86
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:37:34 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3379.1787132246459234989
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OBWxbljX;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132247; x=1818668247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qx0Wu/zCJRTeNSwMRQx64Jk7n3vhtk50UdNMMHtogxA=;
  b=OBWxbljXwcMO5pPtZdnPQFKUG+GswatD39JnxSO1wAeCdH88CM6zzoYL
   TQUKHvZouDMIF790napwhHK1ok7J8Bs33sAFMYI9bN/l6SG85Lwd8/xmc
   E0wyhqK69gq7dg08n9eRo1cxjl6E/Sxf6CFTmALlqxJVPRXcW5QhlBB8b
   3Zw1W/jCEKGeYqwr8lGG5T7uy3wFrWIJ4RldW/w22SJI3HXyv0C5f0sYS
   11CHujcBL44JmpQ5OWOY8xnET9kU1/yyUbC7iQHA/9YegCwPjDOvB3CEU
   fsSPM60V8w8lsztPcT2Nus3C1aayF4GJRWBsYJkN5aVU/1/4TVfsQm/F+
   Q==;
X-CSE-ConnectionGUID: XXlwpHqgTG+HAh5Q6IsuEQ==
X-CSE-MsgGUID: id+3fWndRlW1zeOB2c43pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="251882393"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="251882393"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:37:25 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id C3ECA100037B
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:24 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 73F0E1C0CAFB
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 6B86B1801C0F;
	Wed, 19 Aug 2026 09:37:22 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 70/70] wtmpdb: upgrade 0.75.0 -> 0.76.0
Date: Wed, 19 Aug 2026 17:35:14 +0800
Message-ID: <20260819093514.1101-70-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129340

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wtmpdb/{wtmpdb_0.75.0.bb => wtmpdb_0.76.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/wtmpdb/{wtmpdb_0.75.0.bb => wtmpdb_0.76.0.bb} (94%)

diff --git a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.75.0.bb b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.76.0.bb
similarity index 94%
rename from meta-oe/recipes-extended/wtmpdb/wtmpdb_0.75.0.bb
rename to meta-oe/recipes-extended/wtmpdb/wtmpdb_0.76.0.bb
index 4de0a300d4..ebbfc7e994 100644
--- a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.75.0.bb
+++ b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.76.0.bb
@@ -5,9 +5,9 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=020090a00b69dd2af9ab82eb0003ea2c"
 SECTION = "libs"
 
-SRCREV = "a6f185a241ee633cbba600029ec153feb2665cf8"
+SRCREV = "89c0861f74e576c5ad0ec9f5302aa635a4e50dc6"
 
-SRC_URI = "git://github.com/thkukuk/wtmpdb.git;branch=main;protocol=https"
+SRC_URI = "git://github.com/thkukuk/wtmpdb.git;branch=main;protocol=https;tag=v${PV}"
 
 
 inherit meson pkgconfig systemd features_check
-- 
2.43.0


