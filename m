Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B0DC021AA
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:18 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.46626.1739178120512085675
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fEkI6cns;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178130; x=1770714130;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=x8CqGOjfGxaP0w3Ibm3Ve3WR2NP6ckLgHERzJCleRp4=;
  b=fEkI6cnsyKMDfOwUQQ2CeYZ8p3deUSDSe66SwNubiIaMaYBEpvNoesLH
   bNFUPhTZaBa6SBLVXc7K5cKJBmzcut7JJlbAQuIjOTUh73wS/mIhhAseU
   EA2pO5tQ6aoCV7o8XT/swqJkVlbuQJklh6BDCCD9K2Go/mZ1WEsgHDEa8
   Od8ExGklICYCa5uJzPgSxfG+hdd4Cv4wRdv4oYX64JLQfMgi1SzAmokwJ
   /7Y1REHJL0hvGV9qol7rTsD7o+QpyH/0IjO1MGVL6hdoiefs0uSl0MTHr
   ar3R7WTFys3xwNW+1OKkkSlNrFcxub3sOd3zc0ZNhBdfzk+yYbr+Oo8AL
   Q==;
X-CSE-ConnectionGUID: 3Cy2VoilQZ+E+vm2+Cs9fw==
X-CSE-MsgGUID: goqUxMP2QyWaJ4zfbQaVMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="177444540"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="177444540"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:08 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7971FD4F41
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4409D10361
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:06 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0A52E1A000B;
	Mon, 10 Feb 2025 17:02:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 56/66] python3-pyparted: upgrade 3.12.0 -> 3.13.0
Date: Mon, 10 Feb 2025 17:01:25 +0800
Message-Id: <1739178095-26432-56-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115383

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 Rename COPYING to LICENSE
 Replace outdated Red Hat sample GPLv2+ boilerplates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-pyparted_3.12.0.bb => python3-pyparted_3.13.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-extended/python-pyparted/{python3-pyparted_3.12.0.bb => python3-pyparted_3.13.0.bb} (71%)

diff --git a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.12.0.bb b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.13.0.bb
similarity index 71%
rename from meta-python/recipes-extended/python-pyparted/python3-pyparted_3.12.0.bb
rename to meta-python/recipes-extended/python-pyparted/python3-pyparted_3.13.0.bb
index 7a0d3987d2..0f7065f5ae 100644
--- a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.12.0.bb
+++ b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.13.0.bb
@@ -5,11 +5,11 @@ SUMMARY = "Python bindings for libparted"
 HOMEPAGE = "https://github.com/rhinstaller/pyparted"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "\
-    file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
-    file://src/_pedmodule.c;beginline=10;endline=22;md5=9e53304db812b80d0939e11bb69dcab2 \
+    file://LICENSE;md5=8ca43cbc842c2336e835926c2166c28b \
+    file://src/_pedmodule.c;beginline=10;endline=22;md5=c4b9f810cd53b16ff269447fb8af6c3d \
 "
 
-SRC_URI[sha256sum] = "da985e116beb733371feb605b174db9eec8bd0eedffc8f739f8e603f51b521e7"
+SRC_URI[sha256sum] = "443b59eb9ac63b8ca87094e02376646e172c7ea075f955f105889ca3485b06fd"
 
 inherit pkgconfig pypi setuptools3
 
-- 
2.43.0


