Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A35C02196
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:21 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.32642.1737360860401631548
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=n9njbNlP;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360860; x=1768896860;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=3UrXwOL4jCiCu+y7Xw1qozAOqsdJtbAtvpFELKc05ZY=;
  b=n9njbNlPC866EKpTMJVyzG38BYu7TA4C60pYNrQ7GmGm95dord8XX2P+
   yV9j1AjEdtm0TytUtYF+p7swJHujmcv2HUD//hzCCS6gT7K+WJUfkDshY
   hq0haipaFWcCp1g7+HhGSamaKZrqJVjkQCV0JY8PpIOXfhJzv7D+qGImd
   RkMgQkCUVcQHnb/u86p4AWe0J6AKSkeOyRgD8RLy9o+XmqqGqwqhMxlm4
   hmBTBP0rVsTPffZi36QF3ORQDQjqqrG8Ak78SlKa7wGF8Pbgwrusa7IOa
   D/p57lC4BN4JaQWbArPddUfOTQxjOFFRr4fvE8zjSFQMQtqk9MHOeZ3/D
   Q==;
X-CSE-ConnectionGUID: xBG+b43YSG6oHoVtVaTwTw==
X-CSE-MsgGUID: R1VCwxA2TLqgVVIa+hT/mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="187132059"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="187132059"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:18 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 42FD1D4810
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:16 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1C4A1D7866
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9E73B20074705
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:15 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 69CA51A0071;
	Mon, 20 Jan 2025 16:14:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 14/32] pocketpy: upgrade 2.0.4 -> 2.0.5
Date: Mon, 20 Jan 2025 16:13:48 +0800
Message-Id: <1737360846-4824-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10-0.680100-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxOeMm3G6m0Tdii
	DkGpj+2GhWig9YT7qvCkh51KSUs/hbPg2s6yW87OiV0ptmwZhq1UENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmikZmKVOLxy1I7Cl8sx4HBG4LsLasl5ROhP6dilEe0WVOjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcubsF4FKb1/19fJw7ybZnHS02Iw8p0gfJSrJu
	3YWgW0RMEIKEDfjy3xI1733+PnnjDsO0I3n5xZKaQo4JWq/C1COIKOIK/L0Vv6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114976

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- use cpython % and // impl
- add colorcvt module
- add py_importlib_reload and importlib module
- add py_interrupt and set single handler for REPL
- add PK_LOW_MEMORY_MODE
- reduce type's memory cost
- allow customize malloc, realloc and free
- make C99 compilers work
- fix win32 clang build
- avoid undefined behavior signed int overflow
- fix pybind11 implementation for error_already_set

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pocketpy/{pocketpy_2.0.4.bb => pocketpy_2.0.5.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/pocketpy/{pocketpy_2.0.4.bb => pocketpy_2.0.5.bb} (95%)

diff --git a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.4.bb b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.5.bb
similarity index 95%
rename from meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.4.bb
rename to meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.5.bb
index 3130a193d2..5193b0d176 100644
--- a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.4.bb
+++ b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.5.bb
@@ -14,7 +14,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8cdfa87bc5e09bc07f8cf64135026d91"
 
 SRC_URI = "git://github.com/pocketpy/pocketpy.git;protocol=https;branch=main"
-SRCREV = "416ee069fdd275b141e3b292fcfe913c8abfa194"
+SRCREV = "8024f46b544698ef51d1ca0bb50a29cf0d411a29"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


