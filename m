Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE56C369D9
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:43 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.35430.1745311778692245298
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Iwpl0jm1;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311779; x=1776847779;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=xPaxvj2MD9fF7BcxLUykDmtn6md2uD5uj4i7i3eaNSE=;
  b=Iwpl0jm1MQns09rQI237KbYBL1r0DSgMFOXaCkZeWXsaS3UPMcF7o/TE
   eNLUVaE6DPBs4w1Oq2LWjhItBxYcBrCBIEOI4qRCFp2KSMUPy2X/Z0TSK
   CeGGOPShLsJIdgC2qIJEanm2XZ+2x3AfLDCIDTq+X6QKBkq396iNGSpkg
   C7ZAblubds14OU69ff2Ix+3JatKiKkZtgxBXtB/L/sF/xzJTCybtR0fSl
   64OSm6HmkcCBxSAeiAU1ltR8lkS+jpIMo/TdT5X16UyCNXhXsaoR2EetT
   2OZSk01cSilVD72svIzGV7i14UxKfjJu07KmlrgHuwJDAxz2yX3OxS4Xj
   A==;
X-CSE-ConnectionGUID: mieE77qpSdy7g261I0VY1A==
X-CSE-MsgGUID: zsxjMfkdQ4KDwUgROR64bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="176186094"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="176186094"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:37 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 33188D4808
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E40C8D72AC
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:34 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 75EF61A009A;
	Tue, 22 Apr 2025 16:49:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/30] python3-xmlschema: upgrade 4.0.0 -> 4.0.1
Date: Tue, 22 Apr 2025 16:49:19 +0800
Message-Id: <1745311761-1912-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117042

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix XSD identity update with xsi:type substitution

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-xmlschema_4.0.0.bb => python3-xmlschema_4.0.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_4.0.0.bb => python3-xmlschema_4.0.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_4.0.0.bb b/meta-python/recipes-devtools/python/python3-xmlschema_4.0.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-xmlschema_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_4.0.1.bb
index 5211963f68..ed759ab532 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_4.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=26aa26eda991a3a2b61c11b62d3fda65"
 
-SRC_URI[sha256sum] = "1b6d6c3650f1e0c60d8edc9204572b5700f408953d1fbd9bb6f4eaf5f3dda70c"
+SRC_URI[sha256sum] = "9a8598daa2e2859c499f6f08242f7547804ae0c2d037971c44bcb9aae154ff22"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


