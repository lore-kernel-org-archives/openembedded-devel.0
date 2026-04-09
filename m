Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 217A3EA3C26
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:32:40 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128808.1775730753144896559
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:32:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r0zb8MX5;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730751; x=1807266751;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jMoP7EFW8rPgxx+n0yAtnHmlxpqBSBq/HUnrE1kZ1Po=;
  b=r0zb8MX5wMRm9bRD74AitXLwdNBk24ZHGpoCpvJCCdtuVPcOqVoFtbhr
   0a4ouRGJPfyygksRgJkcCsz6GComwZqIfv9LTR2wr3W2Z9CfHVqo7F5l9
   Zk6/waMyGSCvJpXVEAY5P0WdWE9BvnIkG1dks1YMdP54+FV9JA3J30ecw
   RtGJ5BMKQCWqFhorHu2cKrnm9TGliLFw+gaEJAJTKVpOB2Cvl2m5OSqBI
   XLy2J6BjEWhANgFvSwtnS72hZgivHyjpFI4TL1DDk0KeoXVDuahFFznwj
   8DCU+4zqsAJNh81bZ3UatzxFipbOG4i5VC+7UnCvMsKLusDpdFrO/z12U
   A==;
X-CSE-ConnectionGUID: gYXr2AXbTkKVzQRPu2+TLA==
X-CSE-MsgGUID: CrynXdcuQ4i22DBep0s3Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="223865544"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="223865544"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:32:29 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 535C11C06200
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:32:31 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 0CDA8C00892
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:32:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 80343404333;
	Thu,  9 Apr 2026 10:32:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/37] bolt: upgrade 0.9.10 -> 0.9.11
Date: Thu,  9 Apr 2026 18:31:47 +0800
Message-ID: <20260409103223.1574-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126150

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Updated NHI PCI IDs: added Maple Ridge, ADL, TGL-H, RPL, MTL, and AMD Strix Point USB4 Routers.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-bsp/bolt/{bolt_0.9.10.bb => bolt_0.9.11.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-bsp/bolt/{bolt_0.9.10.bb => bolt_0.9.11.bb} (88%)

diff --git a/meta-oe/recipes-bsp/bolt/bolt_0.9.10.bb b/meta-oe/recipes-bsp/bolt/bolt_0.9.11.bb
similarity index 88%
rename from meta-oe/recipes-bsp/bolt/bolt_0.9.10.bb
rename to meta-oe/recipes-bsp/bolt/bolt_0.9.11.bb
index 3d1686bcf6..924964f6b6 100644
--- a/meta-oe/recipes-bsp/bolt/bolt_0.9.10.bb
+++ b/meta-oe/recipes-bsp/bolt/bolt_0.9.11.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 DEPENDS = "udev polkit dbus"
 REQUIRED_DISTRO_FEATURES = "polkit"
 
-SRC_URI = "git://gitlab.freedesktop.org/bolt/bolt.git;protocol=https;branch=master"
-SRCREV = "c0d4cb2f4399e86417907a37c0d8ef3bb9fb406f"
+SRC_URI = "git://gitlab.freedesktop.org/bolt/bolt.git;protocol=https;branch=master;tag=${PV}"
+SRCREV = "9d1d66380353dab94c28466f34adb2ba6c7e4393"
 
 
 CVE_PRODUCT = "freedesktop:bolt"
-- 
2.43.0


