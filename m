Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF4BC48286
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 07:18:04 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.16684.1707203882137617966
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 23:18:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZXpC6JdR;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707203882; x=1738739882;
  h=from:to:cc:subject:date:message-id;
  bh=TM8/I/feiMJv/Z4yYHgz7AOFgSzUQsAkLEPgEn4DGHs=;
  b=ZXpC6JdR44li9GlA8Ce3E9/2mgQThcM3Gyz9GvlJPVR1m5zAlkwDUMNU
   ADcdFsCTZqR9L97amzlh9+0KQ+/G8uLDLdIp1Rm2StAVucAOfMXC2luhm
   ohjI+FZMhnpNzeUyzg9SPUNZoFKdy10JdlT4eWexSark37750ATFCqhwA
   crIA1mumLMo0G4e79PXq+dxph86JUlA+U7L6Lwe8qcmmvJj+myLnFkQed
   VP8rMt7LnJqYyLMBWnpqiNR2g+nCyjXmJXC8bEZYyPWI1i2FTLJZgqN4k
   XJc5DNgl4ubaHKFCFdK3eJfNhireNK2+7wvwEDPjrJC/TsR5UrGC6bNam
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="148529037"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="148529037"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 16:18:00 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0A7FFD772D
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:17:58 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4971ACFA58
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:17:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C46212007912F
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:17:56 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 584A11A009A;
	Tue,  6 Feb 2024 15:17:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libinih: upgrade 57 -> 58
Date: Tue,  6 Feb 2024 15:16:42 +0800
Message-Id: <1707203802-4443-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10--1.167700-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrnkLsRhpTw1oeZzJlaRLGxWMW
	vMMU24Z7mFgDtee/7/otEr1RH4yw81pCIuRr0RxKP0HVIeixJdDBOVz0Jwcxl6vCrG0TnfVU2d8
	mtRIRsUOBkESMI05d4qHvyg1ZsxTfW2EXohiB6dqeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNfNj5IybSiu0EKicCqm5gWizVqAr9uje4ttl92LxOfu06+OkMb2qyD/HZJlG2yKCMRlUY
	EizFXewV9tDFcOaI92cckYGOJ5Li4ByMfv2BEtbU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 07:18:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108592

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-[oss-fuzz] fuzzing support
-[Fuzzing] fix harness
-[Fuzzing] using cifuzz for PR
-Specify C++11 std in meson build
-Add ini_ prefix even to static names so inih can be used as an #include

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/inih/{libinih_57.bb => libinih_58.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/inih/{libinih_57.bb => libinih_58.bb} (88%)

diff --git a/meta-oe/recipes-support/inih/libinih_57.bb b/meta-oe/recipes-support/inih/libinih_58.bb
similarity index 88%
rename from meta-oe/recipes-support/inih/libinih_57.bb
rename to meta-oe/recipes-support/inih/libinih_58.bb
index 08957e18f..2bcf2b4bd 100644
--- a/meta-oe/recipes-support/inih/libinih_57.bb
+++ b/meta-oe/recipes-support/inih/libinih_58.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a7a95d2af90376e85a05318794e6f202"
 SRC_URI = "git://github.com/benhoyt/inih.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-SRCREV = "9cecf0643da0846e77f64d10a126d9f48b9e05e8"
+SRCREV = "5cc5e2c24642513aaa5b19126aad42d0e4e0923e"
 
 inherit meson pkgconfig
-- 
2.34.1


