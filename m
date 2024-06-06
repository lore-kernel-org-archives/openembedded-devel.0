Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F3B1C27C7B
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:11 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.9834.1717664825105557901
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PXNNmrye;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664825; x=1749200825;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Jh899ErrUqc2ktEEd3Mr2FMeHZBSgk2NNQx3hppNapA=;
  b=PXNNmryeKUx+4zXHgYy3imMmnDZ73AxTURXqykU+YEJjsApfPeYfL2Ue
   10jsSOwWQZDkSJMHkbPm+0jS0nkzO3RinCSAgMzxOJjCuXZDuUfsIVnAc
   Zkg2D5z4nzfpGVOAFuQytCTc23aqDGxZLGUeAAQWuaVlotKpDoXJApcRB
   06gOpoxSkG9XitMudRLGF8tVDc+b0U4F0eA9GAut/ybYP9fUYZS+39JBy
   24SonN1tJdL8mGd6mCwVl70PXLZ18KUg7Gyz8D72h7BrM2aj/4lzC0dDT
   4SgkAOfCJxBYz5IjWMtuTnADzec7KGdXeXSFJdf9pYDDXJH63fop2Jzan
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="162245355"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="162245355"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:07:03 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F197ADA63
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:00 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E32AFF2FA
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C26A20081323
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2AD821A000A;
	Thu,  6 Jun 2024 17:06:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 23/36] libirecovery: upgrade 1.1.0 -> 1.2.0
Date: Thu,  6 Jun 2024 17:06:22 +0800
Message-Id: <1717664795-13902-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10-0.201800-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrXs5nqGvDCfPaNMi+l9LVfyWV
	0qXgzOhK8yF1RgEOd8QZuBgNAbdPYCr2duW+6UdaxhmK7vVDqU687rU89eLPKSSb8v8wgv7yKgL
	JAVeRBApSb0Ek5JT9b+bTwN/5Gm16WkIi5GvRHEpO5y1KmK5bJRSLgSFq3TnjS411xkMup5Syxs
	SRJfpzSRDqBjBbBcmV/Sj/WnCM/LMfE8yM4pjsDxZ4ylU2GwzAxEHRux+uk8hxKpvEGAbTDq0U+
	JalyTotJ2h8iLjDA6+E7EfKwPxERF1WvnpYJMp8oLgoz1hmSIRrOau+M4S3yxR/uKY328QOoWb9
	y3oZ5YOoxVy5bcGMEoK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110731

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Allow building --without-tools
- Add KIS (aka Debug USB) support for macOS, Linux, and Windows
  (Windows note: requires up-to-date AppleMobileDeviceSupport64.msi package installed)
- Add Port DFU support (restore procedure is handled externally)
- irecovery: Print detailed mode for -q and -m commands
- Overall code cleanup and de-duplication
- Windows-specific code cleanup and improvements
- Add Mac Pro, Mac Studio (M2) and MacBook Air (M2) models
- Add iPhone 15 family
- Add Apple Watch Series 9 and Ultra 2 models
- Add November 2023 iMac and MacBook Pro models
- Add support for Apple Vision Pro (RealityDevice14,1)
- A few minor Windows-specific bug fixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb b/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
index 240019597..42006b4ff 100644
--- a/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
+++ b/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
@@ -8,9 +8,9 @@ HOMEPAGE = "http://www.libimobiledevice.org/"
 
 DEPENDS = "libimobiledevice-glue libusb1 readline"
 
-PV = "1.1.0"
+PV = "1.2.0"
 
-SRCREV = "98c9f7055ec1f2e09fac69ef1413a8757113b838"
+SRCREV = "2254dab893ec439f9a73235ea07194afa77399db"
 SRC_URI = "git://github.com/libimobiledevice/libirecovery;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


