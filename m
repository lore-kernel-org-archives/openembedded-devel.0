Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D6A2CFC50A
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:24 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.50341.1728896172565027575
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TnZFGt5H;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896174; x=1760432174;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OstVveIUtwDc29kz6zJ0QFmg5hZHMwRgYkCa2q6Gr20=;
  b=TnZFGt5HTDomNWvRYAle8wHLnJ1q5DeF9ZG9VQb5OxB8Oos2EYYGWKf0
   ZpesLOnE+dSz3YcM0t8sGLUx87pQ0jr5ZIhlO1c38LvRkjO7f0twps17b
   CUftoN9LrDX3Pd35ZdinuI4Xzo4sja/ogpZRGLjd/XenNByogAvDmDsJC
   f8Fp7oDIHokbuuS+el7J+AwKfHVc+Sh1LzEXAW8CjvJh3b8M0D3ccxX9q
   UKBV3FuHnYHLqlbZC1M0yWG86envsvB+FJBvVHBrp6vxddhd8ImAQ+hx2
   O36Di6E+eInscxm2bIS8ZdMCGO36r+hfQbEKXyY+6Z1xRKUWFeffNFvAh
   A==;
X-CSE-ConnectionGUID: uk0W/catSI6fkmXu2MJ4Ag==
X-CSE-MsgGUID: NyKRwl4tSGC9RrvZy3U0gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="176874703"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="176874703"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:12 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E6880D6473
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:10 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 33368D4BC7
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:10 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C339620071A28
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 729271A000A;
	Mon, 14 Oct 2024 16:56:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 37/54] python3-pyproj: upgrade 3.6.1 -> 3.7.0
Date: Mon, 14 Oct 2024 16:54:58 +0800
Message-Id: <1728896115-2944-37-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--4.739400-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yXg2y0j5vXZGK2GKtdiFmTkyKRnX9xPs4K4r
	mQIDoB6SRRa406V/Ywy0NAtQOunSyLyBmVBNNVKmVyAKAMvj1ppcpvqT+hYowt9RlPzeVuQQB5z
	clOaSfy4kw8PwVHl/nwXURz+hQhGV0DLYtdMjuDcReM8i8p3vgJtfQPQZtgTzi/pMOYVoikZgkD
	4cHBIWJ4Ls/AIItVIigDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlyA+cIR4SPPvi3z63vTLXcGwMTv
	0Edx1GCeGp1xydzbrQLk61i7zYXGvxaDhptzICuEkTwdhjkCJ1FqAGY7MMy3CQ69VGpBNEo/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112883

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024.

rpath.patch
refreshed for 3.7.0

Changelog:
===========
- WHL: Wheels contain PROJ 9.4.1
- DEP: Minimum supported Python version 3.10
- DEP: Minimum PROJ version 9.2
- ENH: Add CRS.is_deprecated() and CRS.get_non_deprecated()
- PERF: thread local context
- ENH: Add runtime & compiled PROJ versions
- BUG: Handle changes to HotineObliqueMercatorBConversion

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/python/python3-pyproj/rpath.patch        | 2 +-
 .../{python3-pyproj_3.6.1.bb => python3-pyproj_3.7.0.bb}      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyproj_3.6.1.bb => python3-pyproj_3.7.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pyproj/rpath.patch b/meta-python/recipes-devtools/python/python3-pyproj/rpath.patch
index 347996a80..6e230d105 100644
--- a/meta-python/recipes-devtools/python/python3-pyproj/rpath.patch
+++ b/meta-python/recipes-devtools/python/python3-pyproj/rpath.patch
@@ -6,7 +6,7 @@ Upstream-Status: Inappropriate [OE-Specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 --- a/setup.py
 +++ b/setup.py
-@@ -194,9 +194,6 @@ def get_extension_modules():
+@@ -193,9 +193,6 @@ def get_extension_modules():
      ext_options = {
          "include_dirs": include_dirs,
          "library_dirs": library_dirs,
diff --git a/meta-python/recipes-devtools/python/python3-pyproj_3.6.1.bb b/meta-python/recipes-devtools/python/python3-pyproj_3.7.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pyproj_3.6.1.bb
rename to meta-python/recipes-devtools/python/python3-pyproj_3.7.0.bb
index cad9464cc..0a8b71084 100644
--- a/meta-python/recipes-devtools/python/python3-pyproj_3.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproj_3.7.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Python interface to PROJ (cartographic projections and coordinate transformations library)"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=873757af01d2d221eedb422c4c1dd163"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3f3574263859ef2dc9bd7817d51adbaa"
 DEPENDS = "python3-cython proj"
 DEPENDS:append:class-target = " python3-cython-native proj-native"
 
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://rpath.patch"
 
-SRC_URI[sha256sum] = "44aa7c704c2b7d8fb3d483bbf75af6cb2350d30a63b144279a09b75fead501bf"
+SRC_URI[sha256sum] = "bf658f4aaf815d9d03c8121650b6f0b8067265c36e31bc6660b98ef144d81813"
 
 RDEPENDS:${PN} = " \
     python3-certifi \
-- 
2.34.1


