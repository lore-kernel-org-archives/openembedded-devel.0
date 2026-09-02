Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC3EC624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:29:18 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9377.1788344951546762077
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=h8FPwWc4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788344951; x=1819880951;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1X5Lvo3IAmw2HtB5WcNdq6kWst8dQv4DKHhUOBsD8D0=;
  b=h8FPwWc4wQA1YZm7h1eZUt/9l6VfAFzZmoSMidSaj3eRJPP8aHoKVsk3
   6KnZdYzpTGTQW+rJiUtp9HIlS8MKK0qcgr6ZfHrQ6Cuj03zYCW4WdhLk6
   f3a27pkbGW3cGRx4s3N2ZvX+xp3vPMNGA1Pk2lVo75muxPBLD/kbFNsAj
   POnABZrZAgEHXE2TMilslanQaWFsgUTVMfB+rE884+QPRmoutEjO3vFzL
   yDQzWI2YtlrUahyZoqnR5m9wFSxD8jKv2IlHiES6NzMNGFcObIFBc5+l0
   KU2fzcXVy4oIw5tp7LDLz0OrF8lYSasOVNtMgNo9ltXbYsJmekBPRFuXc
   g==;
X-CSE-ConnectionGUID: 6WCC2TuNSsOvhmVonca03Q==
X-CSE-MsgGUID: 0lV1olp2RS6bTZ0zaV4VEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="253071007"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="253071007"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:29:10 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D6D9942A309
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:09 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 85B6B18026E8
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 94D062000770;
	Wed,  2 Sep 2026 10:29:07 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/34] glaze: upgrade 8.1.0 -> 8.3.0
Date: Wed,  2 Sep 2026 18:28:29 +0800
Message-ID: <20260902102900.1296-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129662

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/glaze/{glaze_8.1.0.bb => glaze_8.3.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/glaze/{glaze_8.1.0.bb => glaze_8.3.0.bb} (93%)

diff --git a/meta-oe/recipes-support/glaze/glaze_8.1.0.bb b/meta-oe/recipes-support/glaze/glaze_8.3.0.bb
similarity index 93%
rename from meta-oe/recipes-support/glaze/glaze_8.1.0.bb
rename to meta-oe/recipes-support/glaze/glaze_8.3.0.bb
index 405f575339..b393460c9f 100644
--- a/meta-oe/recipes-support/glaze/glaze_8.1.0.bb
+++ b/meta-oe/recipes-support/glaze/glaze_8.3.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4d29875d83fbbf50485c846dbbbed8"
 
 SRC_URI = "git://github.com/stephenberry/glaze;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "07e5ef2e2d4c53fdfd8603a61be37053b5a27bc5"
+SRCREV = "dce5e0f7ec572725ec369a0bc59a00eeb2270a9a"
 
 inherit cmake
 
-- 
2.43.0


