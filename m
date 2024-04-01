Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 469C0CD1297
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:35:22 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.38879.1711982115728890440
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=s9DRG8dw;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711982119; x=1743518119;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=yVrgepCpJJ2OmFO5dp626rx94yD326bi97gXGBLEXsk=;
  b=s9DRG8dw4XDak/vJdImeeRfX97pDPJGgKn1XIejPqtSWsMSC+qO3XJul
   MA2KQ7cWdftz+DGpvJ5J1sbYNCZf9Hu8XsYPe5/5SLGOfpj83bqQgn8RD
   3Pa8p5TRsDvHf9H2HYqkTD76LGPAYX4pRogm3IKh8tpHumEwnlJWewnSj
   FvNrbHkcn3jai6KBTNKsFTpFs+2QgoLBInWFgIYdiicE8uDGpO6Esd+hF
   DhP0zWooW5NDJu47TvD6KW3QvjGp6UGLY1kqmW8qba2tqsqDw8f9UhFIP
   LrCiOv2RFpqBFnuoLbIWJPAO9DNDrD5TWbVX7KAfOs4gmL9i10wJMLKzm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="133053356"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="133053356"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:35:18 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 660CFD7AEC
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:35:16 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9149DBF3CC
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:35:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D9E9E60B
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:35:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D8D241A000A;
	Mon,  1 Apr 2024 22:35:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH 08/47] libtommath: upgrade 1.2.1 -> 1.3.0
Date: Mon,  1 Apr 2024 22:34:25 +0800
Message-Id: <1711982104-16711-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711982104-16711-1-git-send-email-wangmy@fujitsu.com>
References: <1711982104-16711-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--0.718200-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mregIHHX2L4YyU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNCTeoveN0UE0NVHotTvuv68EguqiGeZ5Jo8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXLOYfSow2Vhi5U6SpNa639+9YUK+DuJiKVNnr
	hhDwqARmlsajYnuBj34mvICQ7IRWgTypwN4HOX45s14Leh5MrwXVkPA313tVP+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109708

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Deprecate more APIs which are replaced in develop
- Add support for CMake
- Add support for GitHub Actions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtommath/{libtommath_1.2.1.bb => libtommath_1.3.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libtommath/{libtommath_1.2.1.bb => libtommath_1.3.0.bb} (91%)

diff --git a/meta-oe/recipes-support/libtommath/libtommath_1.2.1.bb b/meta-oe/recipes-support/libtommath/libtommath_1.3.0.bb
similarity index 91%
rename from meta-oe/recipes-support/libtommath/libtommath_1.2.1.bb
rename to meta-oe/recipes-support/libtommath/libtommath_1.3.0.bb
index 32ec290c1..4d6c06240 100644
--- a/meta-oe/recipes-support/libtommath/libtommath_1.2.1.bb
+++ b/meta-oe/recipes-support/libtommath/libtommath_1.3.0.bb
@@ -8,7 +8,7 @@ DEPENDS = "libtool-cross"
 
 SRC_URI = "git://github.com/libtom/libtommath.git;protocol=https;branch=master"
 
-SRCREV = "97e500351e653472b2ea00b37137ad0414165efe"
+SRCREV = "95d80fd8229d05dd6cb4ec88bc8d4f5377ff00ef"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


