Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBCEC3601F
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:30 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.61525.1742893329607333293
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BCv7aWZZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893340; x=1774429340;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=2vbJ10X4UwO13FIT0XE/zFQAIpgtcLshWEIeKXHFUgg=;
  b=BCv7aWZZyqnAArjFFN7Tv+tYk4PtI+Vh/Dbw+jkYnXT9LYTXxkO0Z0Df
   7rsk2wvvph+fSORoUmMKy3OSWOeXHA77CC1k235cHI7q+CZ1Y6CR/O8V2
   G95DsRc8RdJ0bcQCFqzFyPvHZduc4kBuyrmJEUEnntV33vlowdAT/GTqh
   +Zo/lUUQHhdZhCxoAL4YgIMkKJsbs9vm99RHFedB7BcXFidsTSeOAdmJU
   Bx36nZtysfsvuhRfoAL094ip04PhxN/YyPJoa9cImgioKDYkneuhFQC2J
   43PTup1A4FtSHiWGeRCY5he4FYEXAFIraANGo99OEXc8xyagTHxSVzXhw
   Q==;
X-CSE-ConnectionGUID: LbRVytdeRbadF2lEFg1WeQ==
X-CSE-MsgGUID: +qOrpusdTFuBCzu3aciDxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="182576321"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="182576321"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:19 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 04F67D481E
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BFFE4BDCAC
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:16 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5A3171A009B;
	Tue, 25 Mar 2025 17:02:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/45] python3-ecdsa: upgrade 0.19.0 -> 0.19.1
Date: Tue, 25 Mar 2025 17:01:32 +0800
Message-Id: <1742893312-3809-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116247

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
New API:
-----------
- der.remove_implicit and der.encode_implicit for decoding and
  encoding DER IMPLICIT values with custom tag values and arbitrary
  classes

Bug fixes:
------------
- Minor fixes around arithmetic with curves that have non-prime order
  (useful for experimentation, not practical deployments)
- Fix arithmetic to work with curves that have (0, 0) on the curve
- Fix canonicalization of signatures when s is just slightly
  above half of curve order

Maintenance:
------------
- Dropped official support for Python 3.5 (again, issues with CI, support
  for Python 2.6 and Python 2.7 is unchanged)
- Officially support Python 3.12 and 3.13 (add them to CI)
- Removal of few more unnecessary six.b literals (Alexandre Detiste)
- Fix typos in warning messages

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-ecdsa_0.19.0.bb => python3-ecdsa_0.19.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ecdsa_0.19.0.bb => python3-ecdsa_0.19.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.19.0.bb b/meta-python/recipes-devtools/python/python3-ecdsa_0.19.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ecdsa_0.19.0.bb
rename to meta-python/recipes-devtools/python/python3-ecdsa_0.19.1.bb
index f26c90d83b..4e884b2d74 100644
--- a/meta-python/recipes-devtools/python/python3-ecdsa_0.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.19.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=66ffc5e30f76cbb5358fe54b645e5a1d"
 
 PYPI_PACKAGE = "ecdsa"
-SRC_URI[sha256sum] = "60eaad1199659900dd0af521ed462b793bbdf867432b3948e87416ae4caf6bf8"
+SRC_URI[sha256sum] = "478cba7b62555866fcb3bb3fe985e06decbdb68ef55713c4e5ab98c57d508e61"
 
 inherit pypi setuptools3 python3native ptest-python-pytest
 
-- 
2.43.0


