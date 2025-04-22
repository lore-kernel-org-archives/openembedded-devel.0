Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5490BC369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:43 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.35402.1745311780878626397
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=knKTxlgh;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311780; x=1776847780;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=6ZLDHleErnSBsWzlFCWDzgiLGOrKvTck4MkunZaWuXA=;
  b=knKTxlgh1MlnekC8yx3vQgKzYWiul4jB7bwE6s6fsBMHSYfZqUPvKPUl
   PtEQ270pPXbMLzgvwjqmT5zfYNYJVl+WqsaaXChgUggjjWF9MB9fbr/kk
   EqdMdYduhV5R26l8sjlrkIOP9DCSBXsDN9cpeXAhWpJEqTvSEgFu5gH3C
   zYa6reu+A8mX7WZTdAcEVrw3bnCZ8vtA3gsyF3WRiJkATq1PQm9VzK4+X
   5tViijXdzBDngD5lT/hHKUvXGMsMSZwc4Rmx+vTTl4sx9zBsp22TOIdED
   k2Uexkd+hkKXwYIBzUDlN73/Jfhx4K5cS7v7ANQQDm1IV2D0JEhub5V6X
   Q==;
X-CSE-ConnectionGUID: eZkpSpIjQCWc2z3t9PQsgg==
X-CSE-MsgGUID: YpHSqfPSRgmaqtRZ1eeXhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="197650132"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="197650132"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:34 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E0EAD6EA1
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F2BB15C57
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:33 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AB8D61A0078;
	Tue, 22 Apr 2025 16:49:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/30] python3-mlcommons-loadgen: upgrade 5.0.14 -> 5.0.15
Date: Tue, 22 Apr 2025 16:49:12 +0800
Message-Id: <1745311761-1912-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117045

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ns-loadgen_5.0.14.bb => python3-mlcommons-loadgen_5.0.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-mlcommons-loadgen/{python3-mlcommons-loadgen_5.0.14.bb => python3-mlcommons-loadgen_5.0.15.bb} (91%)

diff --git a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.14.bb b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.15.bb
similarity index 91%
rename from meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.14.bb
rename to meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.15.bb
index 7331612032..26aacde3c9 100644
--- a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.14.bb
+++ b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_5.0.15.bb
@@ -17,7 +17,7 @@ inherit setuptools3 pypi
 PYPI_PACKAGE = "mlcommons_loadgen"
 UPSTREAM_CHECK_PYPI_PACKAGE = "mlcommons_loadgen"
 
-SRC_URI[sha256sum] = "95594ac6cf78254bc80806873ad5e3b9d8662953b5f38c7209631a00a1ea8d85"
+SRC_URI[sha256sum] = "803121ffcfb35f86ffe837e4fb09860cf485c581589be70a4950c72a2e54b8fa"
 
 # Because the pyproject.toml contains invalid requirements.
 INSANE_SKIP += "pep517-backend"
-- 
2.43.0


