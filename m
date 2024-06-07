Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AACC9C27C65
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 05:06:37 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.34677.1717736796298252721
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 22:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=M3EzRmZK;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717736797; x=1749272797;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ZTG1UowUomzjX9hpDk+h8yYqKt4HNOYXjiR42ERb+FE=;
  b=M3EzRmZK3XiG7mGsUEcjJXtsP1xDwFTNOEiYyi2nvWdma3FU805I1xSc
   8jeJpTlMGKG3YsElhaqIVpYVnwr7UsgiXrsHRqAS6FMoCWIPD19PFpboP
   yn93nfoehBgxTRDEahNO85zFg4x/nTS1nt2HtcjmdbU2LXeLRqkbpoeru
   2R3Gb4J9xv+uGYuySQhSMzQsc+emc0m7ctRAbwuciuwGVt2jH6jtv+M0W
   WA5jtRFupMB2LpjrFhSBAHySOwTtofccvt4pqgcRP0EZ47LyK3fG6x8mu
   YdbQ6rneGhzkg4sDvjrB6+2Hsfge/x/ULYp/O4Oe+Ih0HwELXHrbAfVfv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="162294161"
X-IronPort-AV: E=Sophos;i="6.08,220,1712588400"; 
   d="scan'208";a="162294161"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 14:06:35 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E69C1E8525
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jun 2024 14:06:31 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 34E8BD3F0C
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jun 2024 14:06:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C07E6200838A9
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jun 2024 14:06:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6DEC71A000A;
	Fri,  7 Jun 2024 13:06:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] libirecovery: upgrade 1.1.0 -> 1.2.0
Date: Fri,  7 Jun 2024 13:06:20 +0800
Message-Id: <1717736780-20965-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717736780-20965-1-git-send-email-wangmy@fujitsu.com>
References: <1717736780-20965-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28436.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28436.005
X-TMASE-Result: 10-0.001400-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrXs5nqGvDCfPaNMi+l9LVfyWV
	0qXgzOhK8yF1RgEOd8QZuBgNAbdPYCr2duW+6UdaxhmK7vVDqU687rU89eLPKSSb8v8wgv7yKgL
	JAVeRBApSb0Ek5JT9b3dpZTmN1jrY7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5DubQ
	rtuRQMov8pW19mJIOmHosdBBK6Xtk3KXWd30Ii3RRFJJyf5BJelBlY5S+EP6f3PDiXO/tFSY6HM
	5rqDwqtfTBmx9rE8yyz0ekdiJnT7CSPmW7R46kn9DM5abgRpFcf3ncOweVpmCIYVfvclHNXMdQW
	vpkFJ08oNLMH3xnz2iy76b+CQoGUHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4RUz90EQwG2MA
	pbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jun 2024 05:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110760

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
 .../{libirecovery_git.bb => libirecovery_1.2.0.bb}            | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/libirecovery/{libirecovery_git.bb => libirecovery_1.2.0.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb b/meta-oe/recipes-connectivity/libirecovery/libirecovery_1.2.0.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
rename to meta-oe/recipes-connectivity/libirecovery/libirecovery_1.2.0.bb
index 240019597..29f67d39d 100644
--- a/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
+++ b/meta-oe/recipes-connectivity/libirecovery/libirecovery_1.2.0.bb
@@ -8,9 +8,7 @@ HOMEPAGE = "http://www.libimobiledevice.org/"
 
 DEPENDS = "libimobiledevice-glue libusb1 readline"
 
-PV = "1.1.0"
-
-SRCREV = "98c9f7055ec1f2e09fac69ef1413a8757113b838"
+SRCREV = "2254dab893ec439f9a73235ea07194afa77399db"
 SRC_URI = "git://github.com/libimobiledevice/libirecovery;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


