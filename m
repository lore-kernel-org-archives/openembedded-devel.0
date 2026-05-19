Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A54A6CD5BA4
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:39:40 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19305.1779190778160376429
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LV35ylM4;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190778; x=1810726778;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NpGv5L9GvNHWR4lJ1xRAitJFQ6V5VojvNbsT3cjiiik=;
  b=LV35ylM47FR4tPRnS+dDDvO95dyDJk3HwTzK6vwJXDtuMIriBu2Empz1
   dunGETG2NjZOCZrAaY+xzWDz9+1HfsTroTKjA49hjXH7UV4JoQhxleNRT
   S/prtGHNOGpXt7MImk3Oh4IwaSi85pyIF9WBwlo6U2g6TN+kIqLiqEN5u
   v9MmtayBov4tipKiCjsuFS3mWa+LgRgEq3UfyQk12ymCdcR2yof1NG7WE
   e999436uYn31LcuBxTVPYbn+uHkpBQK12+r629p5fAqFesTQQuIjW8nBy
   1Wwv/75pQSRqPjiMoa6XQy6JtHL0jnU4h85xHTkZWdXgJjhosOmELgFLl
   A==;
X-CSE-ConnectionGUID: UreJCRZcQlqaFN0HbBekwA==
X-CSE-MsgGUID: p9ZFwTYRSPOKQ216z/Cmhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="218799561"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="218799561"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:39:36 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 89278C000B9
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:36 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 4529E182632D
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id E2AB6405E3F;
	Tue, 19 May 2026 11:39:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/38] fastfetch: upgrade 2.62.1 -> 2.63.1
Date: Tue, 19 May 2026 19:38:48 +0800
Message-ID: <20260519113921.655-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127067

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fixes media length detection for Chrome on Linux (Media, Linux)
- Fixes segmentation fault when specifying unsupported modules on command line
- Disables usage of Netlink for Wi-Fi detection on s390x architectures (Wifi, Linux)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fastfetch/{fastfetch_2.62.1.bb => fastfetch_2.63.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/fastfetch/{fastfetch_2.62.1.bb => fastfetch_2.63.1.bb} (98%)

diff --git a/meta-oe/recipes-support/fastfetch/fastfetch_2.62.1.bb b/meta-oe/recipes-support/fastfetch/fastfetch_2.63.1.bb
similarity index 98%
rename from meta-oe/recipes-support/fastfetch/fastfetch_2.62.1.bb
rename to meta-oe/recipes-support/fastfetch/fastfetch_2.63.1.bb
index 160ac87bcb..bb4db47a49 100644
--- a/meta-oe/recipes-support/fastfetch/fastfetch_2.62.1.bb
+++ b/meta-oe/recipes-support/fastfetch/fastfetch_2.63.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2090e7d93df7ad5a3d41f6fb4226ac76"
 DEPENDS = "yyjson"
 
 SRC_URI = "git://github.com/fastfetch-cli/fastfetch.git;protocol=https;branch=master;tag=${PV}"
-SRCREV = "4a61cdb1c9e4044ee959751e00bac1266dc6ebf9"
+SRCREV = "acf610416c2d5bb1438f723699aca47647fbeba5"
 
 inherit cmake pkgconfig
 
-- 
2.43.0


