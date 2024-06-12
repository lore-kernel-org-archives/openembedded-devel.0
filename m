Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9CEC2D0CF
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:46 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.2432.1718161119922720466
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PD7rkYNa;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161125; x=1749697125;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JShUGA8Gx2Wyen25U7a/YwlT+e57Iyu8qNr4uikwBAQ=;
  b=PD7rkYNaBaw9UqAT/v0sb9kU6mq7SRtAtM/RzoGqLrbulEGj48/5Gtyx
   eV/v5/ItgWYGO1E8KxFKdOi7abnnzZTCU0EQ1nty5/LASiYuT7xoK4G0J
   ybzLpYb5NovK5YP++pqIHxJYx0RlWXTb74vkdFs0NriaoFSLnKzTtZ1Z7
   x72btbR+x/zpxK1tIVfIUTWMa3taMzEMz+VTnPQXV6/sV3ywNBTYCRMw/
   rpd8Lw4fW2d38BOIFjrol+7umA2wozOFcKo1Ax8xelL+hjItRpY1S8RDV
   yNdfz0yNKmC1vsGybuqWxJ7avQZ1yQp/fjGz8dx1/iWHVaTDYfHFvnZ1t
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="150756315"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="150756315"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:43 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B15137109
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:41 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E403DD3F18
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 702D0E290B
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1E8F41A0002;
	Wed, 12 Jun 2024 10:58:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/43] python3-pdm: upgrade 2.15.3 -> 2.15.4
Date: Wed, 12 Jun 2024 10:57:52 +0800
Message-Id: <1718161096-29710-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10--0.193400-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrUXlp1FHYSPV4YeSlHZYFoufD
	otHL7YhsA7hovCNjCId5I/z8imOZAL7xwHdvGxjHHWRJEfGP5nkaa/4LdYtybq4h39HPcItcvmK
	TdxbGqLKwjNdKSqldxOGAzSFnBjrJ83gviLOxr+QD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpiDmIE4Tvg5l/c+HB+YVvemDsKXyzHgcEbfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtuVfc976pNyqsW/Wxg3Hp2HE1QGg7/qk3672c6ugIflsZ6iEjsUZR9JUhoSmi9VX5o/vd
	oFn0RVOPwCkDB/r6vWYJroHWgGVkULH1lqTMXTnyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgA
	Q4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110855

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Build wheel from sdist if available, to make sure sdist is built properly.
  This behavior is consistent with pypa/build.
- Fix the issue of self-referencing extra dependencies failing to be resolved
  for local packages.
- Fix an issue of max recursion depth error when parsing a poetry project with
  circular dependencies on local packages.
- Fix a bug that VCS dependencies and --self don't work in the exported
  requirements.txt with hashes.
- Fix a cache miss when there exist built wheels for a given link.
- Don't try to store caches when --no-cache is given.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pdm_2.15.3.bb => python3-pdm_2.15.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm_2.15.3.bb => python3-pdm_2.15.4.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.15.3.bb b/meta-python/recipes-devtools/python/python3-pdm_2.15.4.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pdm_2.15.3.bb
rename to meta-python/recipes-devtools/python/python3-pdm_2.15.4.bb
index 7551de866..364c7c81e 100644
--- a/meta-python/recipes-devtools/python/python3-pdm_2.15.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm_2.15.4.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "c227d81f6bf109626a5643a7bb531c5f5b777a850c4eac8d08b472c1146beee5"
+SRC_URI[sha256sum] = "58e225850567dcadce42418db4638996df2b1378cd0830cd48afda1b455d9c72"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


