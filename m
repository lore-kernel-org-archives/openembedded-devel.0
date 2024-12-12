Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC9B7E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 06:15:38 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.14050.1733984137345396467
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Dec 2024 22:15:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JIxq42lg;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733984137; x=1765520137;
  h=from:to:cc:subject:date:message-id;
  bh=ntHH5z+qrsGbmV+y7X3Qwwaleg2BLkCX2ygLiUZn+hI=;
  b=JIxq42lg83Yzbf63wC8idXUeWuRRdLwNhVQRiCvrvHs5wXktzVmO97Jz
   dCCYrpb/fVUWYHoQJMFGXwMUtRr2xSjCOqDBslqj1HFIdZ8DdVughFw4n
   aHjvsOU322kNqO4c2DRMnPA6OdOGPWotFoUYikTn88AwRnfvC9HVTpFhW
   upnVs9VxuP5nX5h+HQxw3hu0q3axI2GLgYrqtZ98w1q4NwzTf3nQSz0jg
   YF07uDobibIq/ZE1YwRWO94HudHQE3L7/8K7UeERZCVbwGrP48AlMEsTa
   G6z938k7jPfsovRvL/efUe1REqD+e2OXMxD3H51zU+QDf/b5Hxwv37nYw
   w==;
X-CSE-ConnectionGUID: H3DQceXpRC2YOZMlMlS4mA==
X-CSE-MsgGUID: Iuvnh3mtTeu2OHbzIVhTIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="162351462"
X-IronPort-AV: E=Sophos;i="6.12,227,1728918000"; 
   d="scan'208";a="162351462"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 15:15:34 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E8D7ADBB84
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 15:15:32 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C2058D6FF0
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 15:15:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 42FBF2007C3F7
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 15:15:27 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BEF0F1A000B;
	Thu, 12 Dec 2024 14:15:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] smarty: update 4.4.1 -> 4.5.5
Date: Thu, 12 Dec 2024 14:15:19 +0800
Message-Id: <1733984119-7516-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28854.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28854.005
X-TMASE-Result: 10--0.764800-10.000000
X-TMASE-MatchedRID: WwTQ5WpbqUCvbHkumykHI6oXHZz/dXlxrOCEGIPhtwh9ZDXSzHFFN4fq
	baIWKx3QqV/q9KFgVMgNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDI3lq3YEgY6Jv0o/1pwjPyzHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7Hjt
	Abrtf1OagP3/Z28RFCBUOayebN9/52jSMCmnop+X6y1NbZyrnoM9ehEW1+8+s0VvW0y+wlg6KiA
	/K2KKiJ2OsaLpj3HpOCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 06:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114288

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Changelog:
===========
- Add PHP 8.4 support to Smarty
- Fixed that using count() would trigger a deprecation notice.
- Fixed argument must be passed by reference error introduced in v4.5.1
- Using PHP functions and static class methods in expressions now also triggers a deprecation notice

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../smarty/{smarty_4.4.1.bb => smarty_4.5.5.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/smarty/{smarty_4.4.1.bb => smarty_4.5.5.bb} (93%)

diff --git a/meta-oe/recipes-support/smarty/smarty_4.4.1.bb b/meta-oe/recipes-support/smarty/smarty_4.5.5.bb
similarity index 93%
rename from meta-oe/recipes-support/smarty/smarty_4.4.1.bb
rename to meta-oe/recipes-support/smarty/smarty_4.5.5.bb
index e0979bb5aa..e8a63a74a7 100644
--- a/meta-oe/recipes-support/smarty/smarty_4.4.1.bb
+++ b/meta-oe/recipes-support/smarty/smarty_4.5.5.bb
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c0f216b2120ffc367e20f2b56df51b3"
 
 DEPENDS += "php"
 
-SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=support/4.3"
+SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=support/4"
 
-SRCREV = "f4152e9b814ae2369b6e4935c05e1e0c3654318d"
+SRCREV = "c4851c12e34ff80073ddeb7d98b059d57dea9de2"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


