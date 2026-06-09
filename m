Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57594CD8CAA
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:29:31 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76498.1781000969465925488
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=B4TQXbVX;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781000969; x=1812536969;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sF0tCZrgZ5t3T+DbR47f9xwdO6gV1F/7dBcCGWRQ2ro=;
  b=B4TQXbVX4WKiFBCDGVeBdWP8qT8z8CEYuRbKOjr+zaafjYoHVtxqIqpT
   Zlp3vY2cvg7GmlvU/ohxarNiDIind/7VbvPsJY6rVnsUgnRmFA5L5/k79
   66lJSukaHzmZil5i818436xA41BJuqh0DLoVa3t1C2QAIxyHHXDHjQGe+
   /d0b28IVKLdoEtOcqVVPmCkGa7eZ2lVYWqHpzA5/CFjcFNTD/S4ct1TId
   Z0eH6xetY/+8glutEE0iSBboMjxsaaxR+g6GcO59DlgO6tANxq3R2HsfJ
   p7jk2TUHcz9zu4SBeZwLeZ5/+hmtdLa6+fkdQZGNdwMxuvrm4SY3EL91Y
   g==;
X-CSE-ConnectionGUID: CWBqd/lSREWW0O26X8WYEQ==
X-CSE-MsgGUID: sQ8GCwjjRiKV0icU6juTxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="243544175"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="243544175"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:29:27 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 6DC381C1C70A
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:27 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 26FED14771F3
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 4EFCE10003C5;
	Tue,  9 Jun 2026 10:29:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/30] fastfetch: upgrade 2.64.0 -> 2.64.2
Date: Tue,  9 Jun 2026 18:28:46 +0800
Message-ID: <20260609102913.2204-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127457

From: Wang Mingyu <wangmy@fujitsu.com>

Features: =========
- Adds a CMake option -DPACKAGES_REMOVE_DISABLED to remove detection code of
  disabled packages (-DPACKAGES_DISABLE_<PACKAGE_NAME>) for slightly smaller
  binary size (Packages)

Bugfixes: =========
- Fixes compatibility issues with Lua 5.3
- Avoid possible infinite recursion in encode_json when encoding deeply nested
  tables or circular references
- Fixes compilation issues when building with old macOS SDKs
- Fixes image rendering being wiped quickly (#2374)
- Fixes ASCII logo being overwritten in --dynamic-interval mode
- Internal fixes

Logos: =======
- Updates OpenWrt and adds a small variant

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fastfetch/{fastfetch_2.64.0.bb => fastfetch_2.64.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/fastfetch/{fastfetch_2.64.0.bb => fastfetch_2.64.2.bb} (98%)

diff --git a/meta-oe/recipes-support/fastfetch/fastfetch_2.64.0.bb b/meta-oe/recipes-support/fastfetch/fastfetch_2.64.2.bb
similarity index 98%
rename from meta-oe/recipes-support/fastfetch/fastfetch_2.64.0.bb
rename to meta-oe/recipes-support/fastfetch/fastfetch_2.64.2.bb
index 951aa50ce4..8a953508eb 100644
--- a/meta-oe/recipes-support/fastfetch/fastfetch_2.64.0.bb
+++ b/meta-oe/recipes-support/fastfetch/fastfetch_2.64.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2090e7d93df7ad5a3d41f6fb4226ac76"
 DEPENDS = "yyjson"
 
 SRC_URI = "git://github.com/fastfetch-cli/fastfetch.git;protocol=https;branch=master;tag=${PV}"
-SRCREV = "d48bd733f062f374c382d67b59023c08925b0f40"
+SRCREV = "636471c3669201b37fca587e2882eaf3c7062aeb"
 
 inherit cmake pkgconfig
 
-- 
2.43.0


