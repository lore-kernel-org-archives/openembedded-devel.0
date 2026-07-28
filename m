Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD951C54F51
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:05:08 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5753.1785218701090002042
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DYNuVQj3;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218701; x=1816754701;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=17sGNjUUU4U1F9/UWTgyOmSSpV3xuTsBVlB1D/viDBo=;
  b=DYNuVQj3IEGJCtt00IBNcUoqtQCBkCrEcJRuhbEFjgpLtUpcXIU+MuY+
   8n5Kho43YQHzlAL7t1t6Y5C390kdpObcJ+/e6mGq9aE9NuPBm5qmGCOe4
   hNPRQQuZQfwdrYETk3eVyF3ytgF3ckDOnyiK/pcYmLfp93CR673IRr0LD
   npwwlzPkv7PnG6z56FjHU50IZBBKwFo/RnyK7li7FOvnH/pCLp/mXE4rQ
   0iWZzQ90sljUeL7t6sU2kWs6V2yBCa3LhPa4v3/h0R4C1ENvJ2ijtd16x
   q5HlOpnJ+L1Zu+48J56bYAuvQmg32J9GReSk4LIU7gT5k4CKNFcd5y5Uj
   A==;
X-CSE-ConnectionGUID: dw9FXtSAQq+BsG/4AABthg==
X-CSE-MsgGUID: euro1oPsTcu3D958oZ0Jig==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="248305376"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="248305376"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:04:59 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 412661C1C716
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:04:59 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id ED776896E20
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:04:58 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 34973826FED
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:04:56 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] libxmp: upgrade 4.7.1 -> 4.7.2
Date: Tue, 28 Jul 2026 14:04:55 +0800
Message-ID: <20260728060455.792-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:05:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128469

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libxmp/{libxmp_4.7.1.bb => libxmp_4.7.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/libxmp/{libxmp_4.7.1.bb => libxmp_4.7.2.bb} (85%)

diff --git a/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.1.bb b/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.2.bb
similarity index 85%
rename from meta-oe/recipes-multimedia/libxmp/libxmp_4.7.1.bb
rename to meta-oe/recipes-multimedia/libxmp/libxmp_4.7.2.bb
index 4e87ee275f..02fb8ee9d8 100644
--- a/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.1.bb
+++ b/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.2.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://README;beginline=59;md5=b25470e2863502c9ac9886f09c21a
 inherit cmake pkgconfig
 
 SRC_URI = "git://github.com/libxmp/libxmp.git;protocol=https;branch=master;tag=libxmp-${PV}"
-SRCREV = "12f76e4bf1dd6765e3bf46cbc1ff35c4a4551671"
+SRCREV = "a13276d27feabcf9ee4f982913f718ee05a65cb7"
 
-- 
2.43.0


