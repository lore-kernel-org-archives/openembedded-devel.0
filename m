Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E3DC4453D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:23:39 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44773.1784715812571524012
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:23:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VW+A9cYM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715815; x=1816251815;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xWE9hIgVWkKzI0yWQwxS6GQvJ4YCXjRggSd16TG1Ggg=;
  b=VW+A9cYMrAGhHqqiqP8QFY8YQiFKws0H78UdQ7hCCOuxzyzgSODKEShP
   X3zJ7FI3aS5ztCPdu+E0Jh3G0Wi2nrr/WpsXoAFgyJQ+jgi/H1ivz2Uz8
   SNUO1odDOEIHLmjA3K9pqATSY/IaMcsuJsb40ePF2b3HrJcrALNS00IGL
   LT2QDsY1CDtc6yATTXhv2va/RAHAkWBhnVdAlFLHY3NSepHOqIZjAe2hd
   kfp96RUrxwe3AN8+klhoWyXW2PHOiRjajgubbJ7B2Qai7D/E2L+I2a0EI
   ifRyCyOWWlonL9seRAZ3Pns0bYXrrvEzIRGCIIkenLC/JDmBIbALEIRDs
   A==;
X-CSE-ConnectionGUID: fBCBt1eVSruV2hkwQKVXFg==
X-CSE-MsgGUID: AewNvPItSSaZCJO+ximIAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="248220145"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="248220145"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:23:33 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id A442D551F
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:30 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 516B81801E86
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 4CB6F4064B2;
	Wed, 22 Jul 2026 10:23:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/37] freerdp3: upgrade 3.28.0 -> 3.30.0
Date: Wed, 22 Jul 2026 18:22:45 +0800
Message-ID: <20260722102320.1019-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128372

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../freerdp/{freerdp3_3.28.0.bb => freerdp3_3.30.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp3_3.28.0.bb => freerdp3_3.30.0.bb} (99%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.28.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.30.0.bb
similarity index 99%
rename from meta-oe/recipes-support/freerdp/freerdp3_3.28.0.bb
rename to meta-oe/recipes-support/freerdp/freerdp3_3.30.0.bb
index 628b69cc2c..7d78f770f7 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.28.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.30.0.bb
@@ -8,7 +8,7 @@ RDEPENDS:${PN}-ptest += "cmake coreutils"
 
 inherit pkgconfig cmake ptest
 
-SRCREV = "5370fb26fbf034ecd11d3026b6ad639b5fff493f"
+SRCREV = "6b107f0aadbabc47941c5a5b893b88c01792af6d"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;nobranch=1;protocol=https;tag=${PV} \
            file://run-ptest"
 
-- 
2.43.0


