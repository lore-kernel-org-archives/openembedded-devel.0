Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 185FBC54F47
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:06 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.6716.1747818001404151484
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 02:00:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Fm0JpaGd;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747818001; x=1779354001;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=c67bZNLkl4x+YaSMmSRijpHHt701193XWyiDucg/TmE=;
  b=Fm0JpaGdQEVYt+dK85J7PRO8Flu++t0UMiCJyVbWv+76vyi6iA7vGuQS
   YMQEL1h2apD2Unw7Z5upuA2dJIaoVDySF1ddbszu9qB3bcLVal5qV1m7u
   qXjsLgmzHBFwcC89xzqKNviiGXM/dXORE/i2SkFZH5vItt3suX4eHXHGz
   SqIUQKWqsPr7kPg/FTrvgzewMbOn+9E0cG87jsl17bPcN28VVNVrynLc4
   I4p/UbIepbHNsK04L0cMB6gn+zxlZs7YPufy/p/M3kzQmHhSHRMZWZx8Y
   g0kp1/9CSaL8pssX1jWh5pZbyPuv19p79vsuUvD4YGcm4A/5qndswPOSt
   A==;
X-CSE-ConnectionGUID: HvPQHPo/TziO6QPA/R2g0Q==
X-CSE-MsgGUID: LYQn+M9iTACuOCazeQXqtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="187522016"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="187522016"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:59:59 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 53637D4C24
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 12AA0D8C1F
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:57 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C19F11A0078;
	Wed, 21 May 2025 16:59:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/43] python3-pycares: upgrade 4.6.1 -> 4.8.0
Date: Wed, 21 May 2025 16:59:13 +0800
Message-Id: <1747817972-28874-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117551

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Cancel previous CI jobs on pull request update
- Update bundled c-ares to v1.34.5
- Add ARES_FLAG_NO_DFLT_SVR and ARES_FLAG_EDNS to API

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pycares_4.6.1.bb => python3-pycares_4.8.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycares_4.6.1.bb => python3-pycares_4.8.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pycares_4.6.1.bb b/meta-python/recipes-devtools/python/python3-pycares_4.8.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pycares_4.6.1.bb
rename to meta-python/recipes-devtools/python/python3-pycares_4.8.0.bb
index 7f1f3cf0fa..29f4132d67 100644
--- a/meta-python/recipes-devtools/python/python3-pycares_4.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pycares_4.8.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/saghul/pycares"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1538fcaea82ebf2313ed648b96c69b1"
 
-SRC_URI[sha256sum] = "8a1d981206a16240eedc79b51af3293575715d4b0b971f4eb47e24839d5ab440"
+SRC_URI[sha256sum] = "2fc2ebfab960f654b3e3cf08a732486950da99393a657f8b44618ad3ed2d39c1"
 
 PYPI_PACKAGE = "pycares"
 
-- 
2.43.0


