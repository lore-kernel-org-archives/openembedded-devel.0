Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A65F5C5478D
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 09:02:49 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.37567.1708333360522936497
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 01:02:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YVyKcPqN;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708333360; x=1739869360;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=rgC2YNixUpxDFjZHnQ3nXcKeMMmexJKIDcOkkHlbwIc=;
  b=YVyKcPqNKMcKJP87smZEE/VsbEe2pZ6VBUWAYELiVslMd7prczbTmbQf
   ck6rKMuLMvoD+dVMixH5DzilcrP+VVH20FBvo/gzb9CIGtQ2RMKZp3sX2
   ImV/JisbLSTmcdZV8W5X8K1em1DvTOfeDHRTQMpLB1Eo9QevQYpWxEGwQ
   QFrfx+YERt6+JK4JY/GGwNiKEcm1Bs9gwkNwdvVXcd+Waynr7I1HuEdtx
   cQPo3xOAvCrNotA4w3N7PCPzxNwegu1XnEbGWz095Stn6g2yH1SbaWuWI
   f4l0zHvD0kdLJeDKQdAdXZmuiJp0FWgo0onDRQdmvTImOyAzALUOPMNr/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="129068873"
X-IronPort-AV: E=Sophos;i="6.06,170,1705330800"; 
   d="scan'208";a="129068873"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 18:02:37 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C0A384DA763
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:35 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id ED0B4D4F5B
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 86E901E9CA1
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 379A51A006B;
	Mon, 19 Feb 2024 17:02:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/23] btop: upgrade 1.3.0 -> 1.3.2
Date: Mon, 19 Feb 2024 17:02:05 +0800
Message-Id: <1708333346-17704-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
References: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28200.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28200.006
X-TMASE-Result: 10-2.349200-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yUIIxwDaU5mrYdBG+bhhiNSVDBAppAT/pZ6D
	0okeKUMsLY0Km6kFDTKT6D4iaAGa/alw6Je69lsoqhcdnP91eXF+tO36GYDlsk553QR7Ldg5mBQ
	vLjMBsUHxMTb8QSoc+3uyhfOQ5WPM94K/U9yoT978dMpK2wMYwnIa+KQSxiLwB/FMznsE8cO/BR
	68O365bn9eOltIlLtrEriUbUlPOKN4HMSQIKmdGdyBRU/cKn69guwtqyXlE6HofsVSWZ64fJSDl
	QPoCUXSsX24ahsS5PuAMuqetGVetnyef22ep6XYxlblqLlYqXKE96BFtWAsFQhSqjSBhSK7Em+N
	LYkg1KOzi9+tafVWzb21UDCVNhJ1N5E2VGcRo41DJJwSk3jYaqRwwXp6VY11DZLyhzW3gKP+v9v
	52ZIoWjoAf389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 09:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108847

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
-fix: Can't detect librocm 6.0.x
-GPU: Added support for dynamic loading of ROCm v6 libraries
-Increase max network interface name to 15
-Fix OpenBSD UTF-8 locale detection
-Add hot-reloading of config file with CTRL+R or SIGUSR2 signal
-Add battery power draw for linux and freebsd
-Fix crash caused by string exception when cpu clock is exactly between 999.5 and 999.9 Mhz
-Write newline at end of config file
-Add theme based on Everforest Dark Medium palette
-fix: don't mangle memory for zombie processes
-Share common code from collect
-Fixed incorrect used and available memory for OSX

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/btop/{btop_1.3.0.bb => btop_1.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/btop/{btop_1.3.0.bb => btop_1.3.2.bb} (93%)

diff --git a/meta-oe/recipes-support/btop/btop_1.3.0.bb b/meta-oe/recipes-support/btop/btop_1.3.2.bb
similarity index 93%
rename from meta-oe/recipes-support/btop/btop_1.3.0.bb
rename to meta-oe/recipes-support/btop/btop_1.3.2.bb
index f20d1a8ec..c473bf0a3 100644
--- a/meta-oe/recipes-support/btop/btop_1.3.0.bb
+++ b/meta-oe/recipes-support/btop/btop_1.3.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "console/utils"
 
 SRC_URI = "git://github.com/aristocratos/btop.git;protocol=https;branch=main"
-SRCREV = "36842a3bccfb78f5c27642435bff387b42f7d13b"
+SRCREV = "fd2a2acdad6fbaad76846cb5e802cf2ae022d670"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


