Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C4AC05052
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:18 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.7629.1690875733075270236
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="126071598"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="126071598"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:11 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id EE545CD7E0
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:08 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D876BF49B
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:08 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A197810211;
	Tue,  1 Aug 2023 16:42:07 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libcompress-raw-zlib-perl: upgrade 2.204 -> 2.206
Date: Tue,  1 Aug 2023 15:41:26 +0800
Message-Id: <1690875717-21608-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10--6.513300-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrrthpnZXZolBM+b8yxBqvAzAW
	5be84JTBcGwEYIqF3GqoRfmzONNsP2QexWkOikPfn6y0mNkW0aRh0Eb5uGGI1CwCQ5IBIxlH2Kc
	bwdR0oKeQ8jX9l2qhLRJwcdfSstcE7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5BEGD
	rWRIrgOJgvVfiqe2AOzD59ilFX7wTymVDB8yZElJ4CIKY/Hg3AaZGo0EeYG96O8R6rqACRhjgGs
	BPCbyGiJ0RPnyOnrZKqJ/HYVZVaq/vlTOQV1xRoY/HUiK4vJLSOPethQDaiCAQOoxOsKffKyH5u
	BXCybckGETQcGiuRLQsRkDua3ztiWrjJr4R7cMFLv5Eyr/YIrqsDhztRXZ9Cm+LY9A78UVCLPa6
	Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104167

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* drop rt.cpan from SUPPORT section
* Test::More::isn't warns in perl 5.38
* add zlib-ng 2.1.3
* add zlib-ng 2.1.2
* Change storage of ZLIBNG_VER_STATUS from IV to PV https://github.com/pmqs/Compress-Raw-Zlib/issues/24
* Fix to allow building with C++17 register keyword not allowed in C++17 https://github.com/pmqs/Compress-Raw-Zlib/issues/23
* Change while loop for `LimitOutput`  example https://github.com/pmqs/Compress-Raw-Zlib/issues/21
* [doc] zlib.h: Remove duplicate "the" (#22)
* Add zlib compat version for 2.0.7

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...aw-zlib-perl_2.204.bb => libcompress-raw-zlib-perl_2.206.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libcompress/{libcompress-raw-zlib-perl_2.204.bb => libcompress-raw-zlib-perl_2.206.bb} (89%)

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.204.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.206.bb
similarity index 89%
rename from meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.204.bb
rename to meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.206.bb
index e0aa2e9c25..47fe8e0035 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.204.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.206.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=8;endline=17;md5=45bba5fa4937353fd4f
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Zlib-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "f161f4297efadbed79c8b096a75951784fc5ccd3170bd32866a19e5c6876d13f"
+SRC_URI[sha256sum] = "46785a6a383a1c843895b7f9f25d5d759e7c305159f9d1e04a3604eb74c77374"
 
 DEPENDS += "zlib"
 
-- 
2.34.1


