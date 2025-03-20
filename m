Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D35AC28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 08:57:57 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.2933.1742461074467816481
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 01:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=U1CzTaFx;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742461075; x=1773997075;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=RGekqRCYWb+xmhrIslfSOT8XQG0QyQ3l4zWW90O9L40=;
  b=U1CzTaFxk/MAKCcxKbPdUgukUR9qD3iDiXoJjdLRN1Lou9/jUfekLeLC
   EmlL/mJSMFtqDSr4wc8jIrDM9VVPPZDm3T3HTc91KSVra/EO4oU5Ds4BB
   91zL9lpreXmJSoRZtvZYR14+X91HEevWw5Qy482dRjXtfvpELKoBF+TfB
   7KLxAMvBqrQ5QLc0PXqRGqj74sOyzwFHPLk3Fpwx3+iC22woRCd8hPJDg
   +dF5oyTVa2NoI52gcjDhpoDa0nvcC3ExaT2atACdSIcBmkvo8G5gkkkuF
   RFRB9+6JGbWgfdSWYqex6VwPf3NUr7vjVSLYkTbkx98cZl87761NCAq6H
   Q==;
X-CSE-ConnectionGUID: 2xuNd+2cQEu/ux6bDkP7BA==
X-CSE-MsgGUID: nQKZJ/KJSqOc4jXZBdCXAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="193976762"
X-IronPort-AV: E=Sophos;i="6.14,261,1736780400"; 
   d="scan'208";a="193976762"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 17:57:54 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5AFB8D4C2B
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 17:57:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 16635D4F60
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 17:57:52 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 991701A00A0;
	Thu, 20 Mar 2025 16:57:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 4/5] fsverity-utils: upgrade 1.5 -> 1.6
Date: Thu, 20 Mar 2025 16:57:42 +0800
Message-Id: <1742461063-20828-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742461063-20828-1-git-send-email-wangmy@fujitsu.com>
References: <1742461063-20828-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 08:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116126

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{fsverity-utils_1.5.bb => fsverity-utils_1.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/fsverity-utils/{fsverity-utils_1.5.bb => fsverity-utils_1.6.bb} (95%)

diff --git a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.6.bb
similarity index 95%
rename from meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb
rename to meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.6.bb
index 49f83a67c3..b8ffa45947 100644
--- a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb
+++ b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.6.bb
@@ -9,7 +9,7 @@ SECTION = "console"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bc974d217b525ea216a336adb73e1220"
 
-SRCREV = "20e87c13075a8e5660a8d69fd6c93d4f7c5f01a5"
+SRCREV = "2543e6e5037c0b1b448282c2793f8a6ce8b12d71"
 SRC_URI = "git://git.kernel.org/pub/scm/fs/fsverity/fsverity-utils.git;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


