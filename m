Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE161112278
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:16:03 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7120.1775096162335174097
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UnnJp2u9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096161; x=1806632161;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Tf8MzM1WJ5xaIKiUlDGm1RneE/4dJXiWZ/9lrqnVuTk=;
  b=UnnJp2u9nQE7hItSWWDrXf9dTM97x5NUL8/c68odoQZsNUeJg6k1DGy9
   MkdfVrVfeQQ8nirYua3hMyzRqPh8gapFPfdbtbEsmXFza+WT5F/7631xc
   nmoNy29EEhW32MDxS1RODteGXIyuAF3TAwLiuK5u27RqBGhQMRms2a8KO
   ikFz5OJTQTvJzrQK+5sW9XmqbTv5L/di00RdCkvjUJCTLl35Oh/hqVjEO
   VKjUs5pZDZFT1s+IUC/Wc+GxQYpO1ayQrKBsnETozA6YC4RMw9bwCar1b
   X8oMAkSlvpS+1vgP2qOcWaxckCelzkDS0m0YXzlOQ7ers8iJ35L/S8N8Z
   g==;
X-CSE-ConnectionGUID: jypCxMXAS66eF+ZFP8V2Jg==
X-CSE-MsgGUID: PHQi96U9R9WP3Z6d7F0olA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="235493534"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="235493534"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:15:59 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id CAD347327
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:16:00 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 726D91C4C185
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:16:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id E98851003743;
	Thu,  2 Apr 2026 02:15:57 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/39] python3-tomli: upgrade 2.4.0 -> 2.4.1
Date: Thu,  2 Apr 2026 10:13:49 +0800
Message-ID: <20260402021355.1324-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125949

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Limit number of parts of a TOML key to address quadratic time complexity

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tomli_2.4.0.bb => python3-tomli_2.4.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tomli_2.4.0.bb => python3-tomli_2.4.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-tomli_2.4.0.bb b/meta-python/recipes-devtools/python/python3-tomli_2.4.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-tomli_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-tomli_2.4.1.bb
index 310052072d..b95d208a82 100644
--- a/meta-python/recipes-devtools/python/python3-tomli_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tomli_2.4.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5"
 
 inherit pypi python_flit_core
 
-SRC_URI[sha256sum] = "aa89c3f6c277dd275d8e243ad24f3b5e701491a860d5121f2cdd399fbb31fc9c"
+SRC_URI[sha256sum] = "7c7e1a961a0b2f2472c1ac5b69affa0ae1132c39adcb67aba98568702b9cc23f"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


