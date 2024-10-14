Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1566CFC510
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:03 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.50333.1728896160077214616
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GExiMPpG;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896160; x=1760432160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=iceNLaP8PLtxATfgwcBHyTApnJs2wTIQw03PpvhDxug=;
  b=GExiMPpGT2S4M20uzrKJKIH55LAFabLThUliMzXlBjIeqP5FkJxkJ2Sg
   B6mZLY9xxNXqpHo6K6Kgn+LRDUtMjwjnmk3dvnZ0OTm9UkEyfqpoxQ0AC
   iEwfZ3Nx2SreEBnVZjV1KusXTq0YASn0BrU5f9zU7/IQx88JJ2VSeftvQ
   9UPKw/C6Jt9H8/lUHF01sR11HEFAe1x64EFFUwSZfW7bBGXMiAyxcmFYv
   mK6BlGL817Bcay0/3MyA96769Ub/9NXB/nDuP/DRrFEoP65PDspr/GkFn
   Amj67IhjfJvAWoQk/MoBvfSBWwrc7DseYio798ITm9oIRmrM6xe7c5Z/e
   A==;
X-CSE-ConnectionGUID: uRag0FXvQ5SIJw05BYOPUQ==
X-CSE-MsgGUID: Uvk0zeWsTM+qWko/OqYVGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="164671110"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="164671110"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:55:57 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A4F1CD800F
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D43FBD9CA4
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 612EE6B4D4
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0B8941A01E9;
	Mon, 14 Oct 2024 16:55:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/54] libirecovery: upgrade 1.2.0 -> 1.2.1
Date: Mon, 14 Oct 2024 16:54:29 +0800
Message-Id: <1728896115-2944-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10-0.730900-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrZLeVqspIPkehLh9e7qvSIvF4
	Vuj8zJsPuzW0mXOtDbmVpEc4XqysTRDAodjg5c9wLPwitZPJdOOCVqomaN+L4KvWBS71/UX/jcR
	qQigdY11i+bOLm16aRmrpSxhrLECD7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5DubQ
	rtuRQMov8pW19mJIOmHosdBBK6Xtk3KXWd30Ii3RRFJJyf5BJe3x1YNh2+qan3PDiXO/tFSY6HM
	5rqDwqtn6WGgf9yvwdKcYChrrYheZA13q0xbExmrV2/rQ/3OXbISv9WAu1fTRZ3OtJhIJ3Xml0m
	uj0EMuDVCv06jskc2/6Y0FVnrtf3HSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4RUz90EQwG2MA
	pbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112859

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Changes:
  - Make sure IRECV_DEVICE_REMOVE event has the mode set the device was in
  - KIS: Add some retry loops around open/set config/set interface operations

* Device database changes:
  - Support Apple Watch Series 10 and iPhone 16 models
  - Add iPad Air (M2) and iPad Pro (M4) models

* Bug Fixes:
  - Windows: Fix crash due to access to uninitialized data

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libirecovery_1.2.0.bb => libirecovery_1.2.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libirecovery/{libirecovery_1.2.0.bb => libirecovery_1.2.1.bb} (89%)

diff --git a/meta-oe/recipes-connectivity/libirecovery/libirecovery_1.2.0.bb b/meta-oe/recipes-connectivity/libirecovery/libirecovery_1.2.1.bb
similarity index 89%
rename from meta-oe/recipes-connectivity/libirecovery/libirecovery_1.2.0.bb
rename to meta-oe/recipes-connectivity/libirecovery/libirecovery_1.2.1.bb
index 29f67d39d..818033243 100644
--- a/meta-oe/recipes-connectivity/libirecovery/libirecovery_1.2.0.bb
+++ b/meta-oe/recipes-connectivity/libirecovery/libirecovery_1.2.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://www.libimobiledevice.org/"
 
 DEPENDS = "libimobiledevice-glue libusb1 readline"
 
-SRCREV = "2254dab893ec439f9a73235ea07194afa77399db"
+SRCREV = "2fb767d784c01269a0ded5bacd5539aee3768c35"
 SRC_URI = "git://github.com/libimobiledevice/libirecovery;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


