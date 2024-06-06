Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D22EC27C77
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:11 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.9832.1717664823201327645
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=I0h2IlyR;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664824; x=1749200824;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1e0xRc/Ew9Wa0QitW454b1KgvhQHyaVWq3fEclTNNZs=;
  b=I0h2IlyRFSGSaw+3U8CNfvCif7AUToOy115yV168vYehlgXXsR2ZLoyQ
   drDUCSnBtgFIvhsT7F0HjHB5sAKjnjhNq73Fq3ZddiwutyJeRmpPOESe7
   MoBhk1Jly308qjgqffUk4DCJUD7BCN2mQdiLWQXbDJfnRLdNCk0LiVolr
   eAyQC6SWAzuJuoPs9MezSsBerN+x4kpptxk8F7JdN3cRhmz3pTR7/0VjG
   /5r83Ag0NELgCr3hGKai1A5KQj2T/MTO3eu+jObOfIDrBj7VPfmfGuPSO
   D3o39ovD9S5GwgvPHbYVOABAn793fvCt99TZA+Y1V9WgtSi5+lGCbq/SY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="164091934"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="164091934"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:07:02 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 829B7C68E6
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:59 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id CEDEFD0925
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 66734401D8
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:58 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1433D1A000A;
	Thu,  6 Jun 2024 17:06:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 21/36] libio-compress-lzma-perl: upgrade 2.206 -> 2.212
Date: Thu,  6 Jun 2024 17:06:20 +0800
Message-Id: <1717664795-13902-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10--2.646700-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yXg2y0j5vXZGK2GKtdiFmTnaNMi+l9LVfxQr
	bjPnytRT4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbedduZ
	RuRKwoPYdA8XPYQyAUNfOKCnopUTU6WZ8G/zxUhOeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNbUlLddJpUcDGkRmUr/aE6M4MXwD4mv0YQqGiWyc/y8mmEgR4NDDOiysgbfvOge3rgr20
	kOBxlgFpKJAKLuhqvhG/B6sFIPhLI4g39jQjFhNU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110729

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 Copyright year updated to 2024.
 add feedback ktest

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...s-lzma-perl_2.206.bb => libio-compress-lzma-perl_2.212.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libio/{libio-compress-lzma-perl_2.206.bb => libio-compress-lzma-perl_2.212.bb} (76%)

diff --git a/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.206.bb b/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.212.bb
similarity index 76%
rename from meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.206.bb
rename to meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.212.bb
index 1959df5e0..cf5a9db66 100644
--- a/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.206.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.212.bb
@@ -5,11 +5,11 @@ HOMEPAGE = "https://metacpan.org/release/IO-Compress-Lzma"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=b95311d4a7dbf3d0d3663edc094aced6"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=2a0fd6d30eaf88289587b776f74c2886"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/IO-Compress-Lzma-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "6c600f9bbb1a2d834b1decd0bd5863dcea52e0ac17de101b5085e0e3cb27285c"
+SRC_URI[sha256sum] = "51ef81f931cfd2c13fb2340c665204a9587843087dec1a57e9e9f4666d6dad40"
 
 S = "${WORKDIR}/IO-Compress-Lzma-${PV}"
 
-- 
2.34.1


