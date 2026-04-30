Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3415CD13D2
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:49:46 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17430.1777546179907100614
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VCieGVD9;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546179; x=1809082179;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZcsAYoHQkQ9po+tjpapP1x0EehFVVX0+Tm/t6T3VUVQ=;
  b=VCieGVD9y34Pj2X7n82+qFdH5nCClZ42nD5jEWd2lhzPY2PujoG1/0QQ
   A5W5tPTuMv/wXlNCGP9qAcC6xQBHNB42ax+Jrnm3arT7XyV7smuxNRxqT
   NZgk4/yqMajgX/DrFbzpP68bb3lZRpOiNkzumWL3nm8SgWbdHfQsrSFYR
   UuWPp8BAHUAykvCYbv7ZvFhgt1EHpz7idIkOg49+NhgtgRZ/KxyVwcsAd
   BNAk2NsVgGbuBlvHT3S8V9KGJmDqU0RiZnEFGZTbGfTei/7JJeuMLPKSJ
   FQV2m26qhjvCQdS/YdaFOWMkSErelL78FjCfiaUtcT54N1A5QxX+G6Xn5
   A==;
X-CSE-ConnectionGUID: D38uUfTbS3GBhtXZHTEFug==
X-CSE-MsgGUID: FsMe4jsKQDW+RGYGJn55MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="239352992"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="239352992"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:49:38 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 52C251000149
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:38 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id F364E1004171
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 63BB21801130;
	Thu, 30 Apr 2026 10:49:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/64] fastfetch: upgrade 2.61.0 -> 2.62.1
Date: Thu, 30 Apr 2026 18:48:25 +0800
Message-ID: <20260430104924.1106-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126676

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fixes Host module not working on some devices
- Logos : Adds EN-OS, LimeOS, Redrose and Uzbek

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fastfetch/{fastfetch_2.61.0.bb => fastfetch_2.62.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/fastfetch/{fastfetch_2.61.0.bb => fastfetch_2.62.1.bb} (98%)

diff --git a/meta-oe/recipes-support/fastfetch/fastfetch_2.61.0.bb b/meta-oe/recipes-support/fastfetch/fastfetch_2.62.1.bb
similarity index 98%
rename from meta-oe/recipes-support/fastfetch/fastfetch_2.61.0.bb
rename to meta-oe/recipes-support/fastfetch/fastfetch_2.62.1.bb
index 8db0b608f1..160ac87bcb 100644
--- a/meta-oe/recipes-support/fastfetch/fastfetch_2.61.0.bb
+++ b/meta-oe/recipes-support/fastfetch/fastfetch_2.62.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2090e7d93df7ad5a3d41f6fb4226ac76"
 DEPENDS = "yyjson"
 
 SRC_URI = "git://github.com/fastfetch-cli/fastfetch.git;protocol=https;branch=master;tag=${PV}"
-SRCREV = "e5d600600614f5496b02907a11a7bc80c369d266"
+SRCREV = "4a61cdb1c9e4044ee959751e00bac1266dc6ebf9"
 
 inherit cmake pkgconfig
 
-- 
2.43.0


