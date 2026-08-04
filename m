Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC9BC55843
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:18:25 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10303.1785820698409550567
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=l069y3Bf;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785820701; x=1817356701;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jPz7/GElQw5qVLuHAByIA9/q2UO6O1pl0+BhPg/8Lug=;
  b=l069y3BfoHX770tNftg3tcLVyrJurf4rRsrgRsEhCIYGF6kK9Yvjby84
   hH1AgCfofPh6Sa0xFkRrYGi0a9m+x2Ec93lgX6ZAaqoxf9AmzkeYT5Fz4
   PyNcNiVA+DPFZsRQa9Irg41TVadFIN1HRag+WP7sH83KOTDan8vKQxNKg
   T8q3aHReHkWXJ/CwndaxbxeLbx2e+GzdlQqqWPxiDtsde0nK5ihJ5sRa+
   hGUHl+jP7NPKtbDzr0J8cCFQFH1zc1K07GVbCSlEkcobI9W/tGsh40lp3
   17yiW0Epd5+1vZv9t6jKp0ROENru0LwBVc2XjRPoAxJynnCc1a7SHo45P
   A==;
X-CSE-ConnectionGUID: CgOlFmDRTZmv5BuJMd9JVw==
X-CSE-MsgGUID: E48ZZP80QLWq47E4s6dKwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="253203135"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="253203135"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:18:19 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 982018204D2
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:18:16 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 4B813C170BB
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:18:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 4CC0E18005F0;
	Tue,  4 Aug 2026 05:18:14 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/28] python3-discovery: upgrade 1.5.0 -> 1.5.1
Date: Tue,  4 Aug 2026 13:17:10 +0800
Message-ID: <20260804051726.1489-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804051726.1489-1-wangmy@fujitsu.com>
References: <20260804051726.1489-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128717

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-discovery_1.5.0.bb => python3-discovery_1.5.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-discovery_1.5.0.bb => python3-discovery_1.5.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-discovery_1.5.0.bb b/meta-python/recipes-devtools/python/python3-discovery_1.5.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-discovery_1.5.0.bb
rename to meta-python/recipes-devtools/python/python3-discovery_1.5.1.bb
index 408a08ef84..12f2153f80 100644
--- a/meta-python/recipes-devtools/python/python3-discovery_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-discovery_1.5.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
 PYPI_PACKAGE = "python_discovery"
 
-SRC_URI[sha256sum] = "3e014c6327154d3dda27939a9a0dc9c5c000439f1906d3f303b48f984bd2ecef"
+SRC_URI[sha256sum] = "e2ea8b884cd1701f386eda8cf327b87743f1dc21b7f784470799537d95635384"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


