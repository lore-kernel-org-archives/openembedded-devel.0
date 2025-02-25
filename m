Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3627BC021BE
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:05 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.2304.1740525903703602786
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hbGMuTkt;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525904; x=1772061904;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=KbjZhGUMz7J1ZvXzeZdiK10pQN98PyMfLrM7ZS9OOB8=;
  b=hbGMuTktVl/mRyD5XkOuPAd2TGj6wC5FrqtTufCAA/0o0ERGFDMESU1Q
   J/Mm3/f4YrRa5149mlIPlDRtCUX9vo2e/Evw3QAYCZO3CF55s3yu1ZXQV
   LrjXDLr40vXmo4vYDcX6api/wf2R1/WLoeHrEpcOjO7Mcjj6eFcP3ZUFG
   5qraPWnli1RwYonh8jVdzOSacoJLXmi5Ckl8ywP/Pot4UxB9fJfmc0gz0
   gsFFF9moo5Jsg5FND1qsmUY71ylf3xDEvGJb5UJFFxJ/OUyrNIjBChqBq
   LZd29oOpOEtQqJIF2KKJM1l/tiV+yzUpq515iEJKiywDiq1oFcBPP+uQ7
   A==;
X-CSE-ConnectionGUID: ygJ3skjYSL6PbcjmKfCH4Q==
X-CSE-MsgGUID: AnRWGpt6QcG/Foz9WWFTZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="191193469"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="191193469"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:25:01 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 72C5B96741
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 38932D50A7
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:59 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CF9B01A006C;
	Wed, 26 Feb 2025 07:24:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/51] python3-propcache: upgrade 0.2.1 -> 0.3.0
Date: Wed, 26 Feb 2025 07:24:24 +0800
Message-Id: <1740525881-21103-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115634

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Implemented support for the free-threaded build of CPython 3.13
- Started building wheels for the free-threaded build of CPython 3.13
- GitHub Actions CI/CD is now configured to manage caching pip-ecosystem dependencies using re-actors/cache-python-deps

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-propcache_0.2.1.bb => python3-propcache_0.3.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-propcache_0.2.1.bb => python3-propcache_0.3.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-propcache_0.2.1.bb b/meta-python/recipes-devtools/python/python3-propcache_0.3.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-propcache_0.2.1.bb
rename to meta-python/recipes-devtools/python/python3-propcache_0.3.0.bb
index d15ead9205..adb424a169 100644
--- a/meta-python/recipes-devtools/python/python3-propcache_0.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-propcache_0.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/propcache"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "3f77ce728b19cb537714499928fe800c3dda29e8d9428778fc7c186da4c09a64"
+SRC_URI[sha256sum] = "a8fd93de4e1d278046345f49e2238cdb298589325849b2645d4a94c53faeffc5"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest cython
 
-- 
2.43.0


