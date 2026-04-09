Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4779EEA3C2B
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:32:50 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128810.1775730759257866994
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fuTq4zoA;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730763; x=1807266763;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4xsGISWiLUz//GrZ3IURSLAxD0PNzBlhxsov234UCLs=;
  b=fuTq4zoAijTS2n3vh61AQim2SUjOgAGeUH1Su+hXJ+0DeERQ188fsCly
   0wVtf7Lw0eGRMN14zo7bulxEMEqvYr3MI5iUyd8EUuxOtWyOYwH0LAPDk
   xOXs5WCQoaLurG2LImJA1/z+mvR/bHyDYD4e+/CYjvnRJJ3kILAymgne6
   fu0tww/hriEk7wPrxlkuXRDt5OBtLofG38OPV6ksL5A03Ovaq5e64Rq2n
   jYen60Nf8KI92uDRbobPY4Uhd0emqNg6VqZuB49yqZaydu94MnV0X6mKR
   EOdKYeUg8+2lbYYKP3LXyD+CgwzVdOtrPx5DVTtdg7KMOPWwZlGG2Yk1Y
   A==;
X-CSE-ConnectionGUID: dnNpXvJaSraukILa+A6AkA==
X-CSE-MsgGUID: +qlV58G9TKWwzVr+h/QfHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="236386448"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="236386448"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:32:43 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 0F8131000158
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:32:43 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id AFD88C012A9
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:32:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 1E88D404333;
	Thu,  9 Apr 2026 10:32:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/37] glaze: upgrade 7.2.2 -> 7.3.0
Date: Thu,  9 Apr 2026 18:31:51 +0800
Message-ID: <20260409103223.1574-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126154

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/glaze/{glaze_7.2.2.bb => glaze_7.3.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/glaze/{glaze_7.2.2.bb => glaze_7.3.0.bb} (92%)

diff --git a/meta-oe/recipes-support/glaze/glaze_7.2.2.bb b/meta-oe/recipes-support/glaze/glaze_7.3.0.bb
similarity index 92%
rename from meta-oe/recipes-support/glaze/glaze_7.2.2.bb
rename to meta-oe/recipes-support/glaze/glaze_7.3.0.bb
index 807f8811d1..698f0fab3c 100644
--- a/meta-oe/recipes-support/glaze/glaze_7.2.2.bb
+++ b/meta-oe/recipes-support/glaze/glaze_7.3.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4d29875d83fbbf50485c846dbbbed8"
 
 SRC_URI = "git://github.com/stephenberry/glaze;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "959c50207aa552a8de5aabfcbb6801d08fa6fb9d"
+SRCREV = "d59555bced07d7d4a633e1a282917b567b997b15"
 
 inherit cmake
 
-- 
2.43.0


