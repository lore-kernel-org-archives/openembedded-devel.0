Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B22C54ED1
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:05 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.6739.1747817996288026139
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 02:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hhAp8MM8;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747818003; x=1779354003;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=SJppxQIFBDucCF6aJVM5t2N7twc+/JnLzlDk+7Okttk=;
  b=hhAp8MM8JOoReXQpwGmXSGQ2y2wkEnvHM+QrAFqFnrypct/RyKUVPIyK
   dOOSu5694PfNqb3u0APEfatRP7u7CmKoO1TjHmZHHqpGp7E6M4GsM5blG
   M7kR0W9J+cDRXLOt/fuhy/WS7gLNdzW89/R0WIMi+MhPfxYHNKRsNL5jK
   KDdQyhGTbyKuArH4l+q6A4W+ppm/838PevI9q23VZgGB/S3Ro7ivjOF6Y
   aNsvC98k/0TDr+EL1wqzbqtSVrVsO+NijIDCACBNCI3Je4dj3vfcMvLDF
   anQcfEraldm7rELffV1QpcrnriU25Msie8CNHtLKuaft6lB4ywv2g5ZHZ
   w==;
X-CSE-ConnectionGUID: jTk8YTEfQZizT4rRfhEaUA==
X-CSE-MsgGUID: S3pb/zSuToS3nHdwIO4W7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="188157670"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="188157670"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 18:00:02 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C3CBD8E68
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 18:00:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C09DD52D2
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 18:00:00 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C29D21A0078;
	Wed, 21 May 2025 16:59:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/43] python3-sympy: upgrade 1.13.3 -> 1.14.0
Date: Wed, 21 May 2025 16:59:24 +0800
Message-Id: <1747817972-28874-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117560

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-sympy_1.13.3.bb => python3-sympy_1.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sympy_1.13.3.bb => python3-sympy_1.14.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-sympy_1.13.3.bb b/meta-python/recipes-devtools/python/python3-sympy_1.14.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-sympy_1.13.3.bb
rename to meta-python/recipes-devtools/python/python3-sympy_1.14.0.bb
index a0f6700722..dd0a84aa2c 100644
--- a/meta-python/recipes-devtools/python/python3-sympy_1.13.3.bb
+++ b/meta-python/recipes-devtools/python/python3-sympy_1.14.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/sympy/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ea48085d7dff75b49271b25447e8cdca"
 
-SRC_URI[sha256sum] = "b27fd2c6530e0ab39e275fc9b683895367e51d5da91baa8d3d64db2565fec4d9"
+SRC_URI[sha256sum] = "d3d3fe8df1e5a0b42f0e7bdf50541697dbe7d23746e894990c030e2b05e72517"
 
 inherit pypi setuptools3
 
-- 
2.43.0


