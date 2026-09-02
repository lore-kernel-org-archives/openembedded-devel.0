Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58828C624D6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:29:18 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9372.1788344947322121284
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:29:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jy3RBEpN;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788344951; x=1819880951;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bGh9gdCfyCwQ7qeRVgFBk1tdLpzubZQ/N14om5kTZJE=;
  b=jy3RBEpNtZ2BlG4Y0aQ7Ihmk2Bb/f3xzqCZaxE1EEZJNeyWl9KicASfH
   4btwi9ftvLNRTHE3ZEAYD6HqS1dQFbSImzUcfOM9+AAYqmrT4JeQzTxAA
   wRmAqW/m9W7nPCDFEkDoTgbO0/vOKH/kkiPqsChtU9dZ0GjC9kB5jLAMJ
   HuMpdgq4uPNto3T0JSb5jZbUvrwjIESU1ThZd0Sm1tJCZYaYk5OBHK6Zy
   svSdGdcb3jC2+MIdMRyCp17pFqhg/Sp5OpMQgJZ6gv63YLkbsqpMAYngD
   E28nrQrlCeQ9aFEtf0fBZmlP+jlR5VgKnPZvmEY3gcQjLpFRH1mgwSTpX
   Q==;
X-CSE-ConnectionGUID: a542UMpKR/6OwNXQGGDjqg==
X-CSE-MsgGUID: Hz71/9fvSoGnZwKTK8ikuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="231299190"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="231299190"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:29:09 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id A35A11C1C725
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:05 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 4BF4CC00228
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 4B45A2000770;
	Wed,  2 Sep 2026 10:29:03 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/34] catch2: upgrade 3.15.3 -> 3.16.0
Date: Wed,  2 Sep 2026 18:28:27 +0800
Message-ID: <20260902102900.1296-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129660

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-test/catch2/{catch2_3.15.3.bb => catch2_3.16.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/catch2/{catch2_3.15.3.bb => catch2_3.16.0.bb} (92%)

diff --git a/meta-oe/recipes-test/catch2/catch2_3.15.3.bb b/meta-oe/recipes-test/catch2/catch2_3.16.0.bb
similarity index 92%
rename from meta-oe/recipes-test/catch2/catch2_3.15.3.bb
rename to meta-oe/recipes-test/catch2/catch2_3.16.0.bb
index f331a09f68..e9ef1e70a4 100644
--- a/meta-oe/recipes-test/catch2/catch2_3.15.3.bb
+++ b/meta-oe/recipes-test/catch2/catch2_3.16.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/catchorg/Catch2.git;branch=devel;protocol=https;tag=v${PV}"
-SRCREV = "95d8a61b089317bec800c7cc4c64064cbcb3802d"
+SRCREV = "317ac1ed4c0bb6e6b91eafc817e05c488feffcb3"
 
 
 inherit cmake python3native
-- 
2.43.0


