Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2158C31D97
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:04 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.167214.1719305816031357994
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BAegG4na;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305817; x=1750841817;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=HH7BxxP88XC+LNL2e5bhS3MGJ86H/hUyPla/061sBV8=;
  b=BAegG4na+9XNuzSf5CysviFUrUxXXvpSC/fEfOoouOCZGSyn04vKKL3P
   0xyTbuUdxXBqLn0rwAISH6IzEIr48THIw1gmyaqCSWO1zFHxR1dYl+RT7
   kT8u5m8t8q2Gs9f7TM6lhtDeJRVC8UAKew7n+OCw9dh1fTRn3+TqNLcx8
   W4oj/tcl2/iGOAUhaZeIgbsMv9TbF/8Z2EZFx2zyM/3qSU74EZah5Xb9g
   GqzDb5KrydJQA1bLrvJ/SmePMT9ib9RuF6u506kJ6YpLy5Gx+uBJR0sc6
   uvButDB4l6hNfOKv+C4pDgxabdjsZ1hL8OD0mD3rsSVXwX1rvKSyYHBYy
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="144297013"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="144297013"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:56:55 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9EA7FC9440
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:51 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D37A0D50E2
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 53DD52007CDE2
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 01CE91A0002;
	Tue, 25 Jun 2024 16:56:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/57] dialog: upgrade 1.3-20240307 -> 1.3-20240619
Date: Tue, 25 Jun 2024 16:55:36 +0800
Message-Id: <1719305790-11484-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10-3.095200-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrK0L6YMbmA3h4YeSlHZYFotyx
	bsqlEfBsa+o/S6GsElCKk5DNU2OpWEiQ+g5qQg9HxqtsVI8KrJpUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmikZmKVOLxy1I7Cl8sx4HBG/ioIsi7Sa0g3M41rVGynHcbSq
	g5zWtByrtwD3BWnpPVModguxHirQsfE8yM4pjsDwtuKBGekqUpnH7sbImOEBR/TjabhKhVVX3Ra
	XQIL8n0z245LdGELBQu7L5jE62gGApGIajd8TsGBIioqz5fEloOdT4XsIOLSnO7Hr5xbq7KUEd1
	V2vue1bsfZ9V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111015

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
+ modify configure script to ease deprecation of libtool-bin package
+ update dialog.map, dialog.sym for 2023/10/02 changes.
+ improve dialog-config.in,
  + suppressing several special cases of linker options, and
  + adding support for --cflags-only-I, --cflags-only-other
+ fix a few cppcheck warnings
+ improvements to NLS configuration.
+ add configure check for PIC vs PIE, needed for linking to libraries
  which lack pkg-config scripts to specify LDFLAGS.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dialog/{dialog_1.3-20240307.bb => dialog_1.3-20240619.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/dialog/{dialog_1.3-20240307.bb => dialog_1.3-20240619.bb} (92%)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20240307.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20240619.bb
similarity index 92%
rename from meta-oe/recipes-extended/dialog/dialog_1.3-20240307.bb
rename to meta-oe/recipes-extended/dialog/dialog_1.3-20240619.bb
index a49717536..0fccce5e8 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20240307.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20240619.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI = "https://invisible-mirror.net/archives/${BPN}/${BP}.tgz"
-SRC_URI[sha256sum] = "339d311c6abb240213426b99ad63565cbcb3e8641ef1989c033e945b754d34ef"
+SRC_URI[sha256sum] = "5d8c4318963db3fd383525340276e0e05ee3dea9a6686c20779f5433b199547d"
 
 # hardcoded here for use in dialog-static recipe
 S = "${WORKDIR}/dialog-${PV}"
-- 
2.34.1


