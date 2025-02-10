Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93DAC021B2
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.46465.1739178120497717104
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lBieWpgk;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178120; x=1770714120;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kmRV1tAzJA5BYNyhnuY/bx01p6U1kaGwa9blJioKXYo=;
  b=lBieWpgk1Wz0JRVv2jNs80FIlnvuDzMffaHpMbhrauLU/ArPxc2mu07P
   IbOZHjE0lV87EMNEXGXngdr2VSlpuBMO2CVtCjPZOOZRiwHPm8j7VS8Ot
   T9pDC2ULTg3f4L41+SlJfJ8gA2mEXfm1Ts9c6glCzebifLRQlJCSbQy1z
   +x8zaYfL1UPFpbZHzwc+lfAtP9w5akGiqp5R4x5DdXpKvLXtUAGHll2ul
   8LVLFtlwK7nJOOEn83ZS7iyrjyH0B9b1u028GDRVDVwc4UPO2OTIS2z6E
   8iv1Xb3w60K7JjOOrAIDn23owzh+oFv2+A5BePDGG3mA8widQ4LX5AdOr
   Q==;
X-CSE-ConnectionGUID: 8Kz2Ny/+QmKJkQhDzCIkYg==
X-CSE-MsgGUID: ji0ZRSC2RV+1vUmjay9B/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="177845832"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="177845832"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:59 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 76FCFD4C70
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3EB26BF499
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:57 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D7D7F1A000B;
	Mon, 10 Feb 2025 17:01:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/66] python3-deprecated: upgrade 1.2.15 -> 1.2.18
Date: Mon, 10 Feb 2025 17:01:01 +0800
Message-Id: <1739178095-26432-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115357

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Update Packit configuration
- docs: fix compat with sphinx8
- fix: enhance documentation and build configuration: update versioning, fixes, and ReadTheDocs setup

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-deprecated_1.2.15.bb => python3-deprecated_1.2.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-deprecated_1.2.15.bb => python3-deprecated_1.2.18.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-deprecated_1.2.15.bb b/meta-python/recipes-devtools/python/python3-deprecated_1.2.18.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-deprecated_1.2.15.bb
rename to meta-python/recipes-devtools/python/python3-deprecated_1.2.18.bb
index 46b8a19ddc..5f52571edd 100644
--- a/meta-python/recipes-devtools/python/python3-deprecated_1.2.15.bb
+++ b/meta-python/recipes-devtools/python/python3-deprecated_1.2.18.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://deprecated.readthedocs.io/en/latest/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=44288e26f4896bdab14072d4fa35ff01"
 
-SRC_URI[sha256sum] = "683e561a90de76239796e6b6feac66b99030d2dd3fcf61ef996330f14bbb9b0d"
+SRC_URI[sha256sum] = "422b6f6d859da6f2ef57857761bfb392480502a64c3028ca9bbe86085d72115d"
 
 inherit pypi setuptools3
 
-- 
2.43.0


