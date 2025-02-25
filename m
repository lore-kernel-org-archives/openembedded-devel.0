Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E67C021BB
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:16 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.2297.1740525897445317206
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WYOAK3So;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525906; x=1772061906;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=skL0pjI+niNmnDX4Y3tRXGigACNLqIbIRM20V/OMSH8=;
  b=WYOAK3SoW88QySJguOTfxWQk+up0NWeWLTt71R3Crn16qki/dqG0JeqT
   YfSuAD/2MBx02uhn4Q0P/YcEoiyAYekchQ3LITbFkcjJ6SQLprax6iDyg
   /PLKvlsgV0ITcACKHeHOJAKWG3XHBXA1DLrJsBSje5Mu+uR9J3kLXzL4R
   KFudtenaxDOHq0P7dY1zuSzABjHsEKKUo1AbSyuyMNHPUG84/5uPBD5vV
   0JQQ05ruCzxOCpxLvqLiH/4kbpeJdgYsTQsE2u/3bP6s8TIPX6L5j+uB9
   6+XRet1IAInevIXS7/Dd3LMvBf00k0/9wMTf/MGd087uxUktVK1rD1OcU
   w==;
X-CSE-ConnectionGUID: BJFsXwRbQLC32G+vhj1gmg==
X-CSE-MsgGUID: pt7D1IS8S6iIUAr7d1L4cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="170073430"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="170073430"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:25:05 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4CE4EDBB80
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 10544D7731
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:03 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A8FB11A0073;
	Wed, 26 Feb 2025 07:25:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 51/51] pmdk: upgrade 2.1.0 -> 2.1.1
Date: Wed, 26 Feb 2025 07:24:41 +0800
Message-Id: <1740525881-21103-51-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115648

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 change LICENSE to LICENSE.txt
 Copyright year updated to 2025.
 fix license to follow SPDX format

Changelog:
===========
- remove non-Linux support from all compilation paths (OS_KERNEL_NAME)
- add an aarch64 cross-compilation (requested by DAOS)
- mute error messages when transactions are intentionally aborted
- mute error message "Cannot find any matching device, no bad blocks found" when PMDK is used without PMem

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/pmdk/{pmdk_2.1.0.bb => pmdk_2.1.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/pmdk/{pmdk_2.1.0.bb => pmdk_2.1.1.bb} (91%)

diff --git a/meta-oe/recipes-extended/pmdk/pmdk_2.1.0.bb b/meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb
similarity index 91%
rename from meta-oe/recipes-extended/pmdk/pmdk_2.1.0.bb
rename to meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb
index 100ff4200c..1bafad96b9 100644
--- a/meta-oe/recipes-extended/pmdk/pmdk_2.1.0.bb
+++ b/meta-oe/recipes-extended/pmdk/pmdk_2.1.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Persistent Memory Development Kit"
 HOMEPAGE = "http://pmem.io"
 SECTION = "libs"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b44ee63f162f9cdb18fff1224877aafd"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3e2f50552a27ca99772f3d884f98560b"
 DEPENDS = "ndctl cmake-native"
 
 # Required to have the fts.h header for musl
@@ -12,7 +12,7 @@ DEPENDS:append:libc-musl = " fts"
 S = "${WORKDIR}/git"
 
 SRC_URI = "git://github.com/pmem/pmdk.git;branch=master;protocol=https"
-SRCREV = "5705fdffa755d00b4dbb4d6c30eb49671436f961"
+SRCREV = "0f0ab391d8e3db52f745f33c92b9d9a462bb3695"
 
 inherit autotools-brokensep pkgconfig
 
-- 
2.43.0


