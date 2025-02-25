Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE59C28B24
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:06 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.2306.1740525904794386333
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ljCv+SS9;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525905; x=1772061905;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zV9Dil58AwkMsWMjMMdHnZyWnuxW66CvVNikK2kHiHM=;
  b=ljCv+SS9LYt/T7mCUY30+F1ri9sgg0StWfBfGn+LBaUeuXawslLdbBJh
   2ybUHkoyApEVofkEbSlcB7ZspAc6i4T/VK2uX+8ZBeWjU9ZsAr5cdCAfN
   GA5veVrkj9zQ7OEnrfUtKWkozbqw1OKZ1p8n5H6P3LivtT1V3xYLBHiQG
   cjp807Imvn+QHU05akzjiL/jaswGH1Y6ZdrpwC48ChdPbx0cZCnxxTgV0
   I4BOEOFCrhR4jxtRP1+aw5c3Bx6xdO2kIOahguG/v4+jS51Xd1/hEeuwT
   PEd8szpW4Ti1v6naEuAB79KKdtYwFLwieeNCwRjXtBJw62yXJtByye5nN
   Q==;
X-CSE-ConnectionGUID: IBv25YCMTeCTAx4n5P7q2Q==
X-CSE-MsgGUID: kHgakyWpTACigpjKn/uJbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="193783225"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="193783225"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:25:02 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6E4D810086
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3765EC8BF7
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:00 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F0CD71A0073;
	Wed, 26 Feb 2025 07:24:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 39/51] python3-pyproj: upgrade 3.7.0 -> 3.7.1
Date: Wed, 26 Feb 2025 07:24:29 +0800
Message-Id: <1740525881-21103-39-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115640

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- WHL: Add wheels for musllinux
- WHL: MacOS minimum deployment target moved to 13
- WHL: Wheels contain PROJ 9.5.1
- MNT: Cython 3.1+ fixes
- MNT: Remove use of utcnow() and change to naive datetimes instead
- TST: remove checking is python >= 3.4
- TST: Add assert statements at the end of tests
- LNT: Setup ruff & lint fixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyproj_3.7.0.bb => python3-pyproj_3.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyproj_3.7.0.bb => python3-pyproj_3.7.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pyproj_3.7.0.bb b/meta-python/recipes-devtools/python/python3-pyproj_3.7.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pyproj_3.7.0.bb
rename to meta-python/recipes-devtools/python/python3-pyproj_3.7.1.bb
index 0143943e89..3cc8c21280 100644
--- a/meta-python/recipes-devtools/python/python3-pyproj_3.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproj_3.7.1.bb
@@ -6,7 +6,7 @@ inherit pypi python_setuptools_build_meta cython
 
 SRC_URI += "file://rpath.patch"
 
-SRC_URI[sha256sum] = "bf658f4aaf815d9d03c8121650b6f0b8067265c36e31bc6660b98ef144d81813"
+SRC_URI[sha256sum] = "60d72facd7b6b79853f19744779abcd3f804c4e0d4fa8815469db20c9f640a47"
 
 DEPENDS = "proj proj-native"
 
-- 
2.43.0


