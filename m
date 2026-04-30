Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97FBFCD13D2
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:18 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17222.1777546210272801001
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=G0L/q+R/;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546209; x=1809082209;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xLIf/uVPKyde2o4Xkj2R9C4M5RAewWPH4md+cwLfnrE=;
  b=G0L/q+R/mk8eQgdANCaKMEeNxNLfVTka4EpvoMawlIRCpO7ByaPtAU6B
   kgfauJYxh3DvjysQbsBjCgHd/Q2Cg2TBzKzaUCiVB08sSmlDTqcgYshZE
   60Hr377vF4oPSsFd3sk5porjBC8wxr8zNDIrr5ke8EeEjQNt0+bmQwAtS
   57xxxmWQQWyOT/zLDkHWD24ASh/3mec8WaSc79zA6eOadtj7LSDr1wkSo
   7pItZkLqIuoK43ntg62FQQRHCrih6DLosao6/ScrY4OypT/BxhwFgbVHh
   8Fqi6KxFyTo7G/lrQaKPZDkmw6Tukl8RVCw7Oj/cxGUW+OKw7yNJG68Q1
   w==;
X-CSE-ConnectionGUID: GJyZ4OybR0WDEOiLCdAvMA==
X-CSE-MsgGUID: oxcKCwbMSoWFw9k0Cwftmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="217636939"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="217636939"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:08 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id DC31442A335
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:08 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 7E99BC0023B
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 04F111801543;
	Thu, 30 Apr 2026 10:50:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 22/64] mdio-tools,mdio-netlink: upgrade 1.3.1 -> 1.3.2,1.3.1 -> 1.3.2
Date: Thu, 30 Apr 2026 18:48:41 +0800
Message-ID: <20260430104924.1106-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126690

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add a new addressing mode "mscc": Used to access PHYs from Microchip that
  uses C22 register 31 as a page register
- Fix VPATH builds and various other build related warnings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{mdio-netlink_1.3.1.bb => mdio-netlink_1.3.2.bb}          | 0
 meta-networking/recipes-support/mdio-tools/mdio-tools.inc     | 4 ++--
 .../mdio-tools/{mdio-tools_1.3.1.bb => mdio-tools_1.3.2.bb}   | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/mdio-tools/{mdio-netlink_1.3.1.bb => mdio-netlink_1.3.2.bb} (100%)
 rename meta-networking/recipes-support/mdio-tools/{mdio-tools_1.3.1.bb => mdio-tools_1.3.2.bb} (99%)

diff --git a/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb b/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.2.bb
similarity index 100%
rename from meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb
rename to meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.2.bb
diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools.inc b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
index fc8161eb1f..b90f476e89 100644
--- a/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
+++ b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
@@ -4,5 +4,5 @@ HOMEPAGE = "https://github.com/wkz/mdio-tools"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/wkz/mdio-tools.git;protocol=https;branch=master"
-SRCREV = "f74eaf38dbda441df4fcaeb21ca4465957953a2f"
+SRC_URI = "git://github.com/wkz/mdio-tools.git;protocol=https;branch=master;tag=${PV}"
+SRCREV = "a1fca6b8fb3b5a95ebb28324a95673488dddc005"
diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.1.bb b/meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.2.bb
similarity index 99%
rename from meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.1.bb
rename to meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.2.bb
index 2c8f9b8c37..3b4a525da0 100644
--- a/meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.1.bb
+++ b/meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.2.bb
@@ -6,3 +6,4 @@ DEPENDS += "virtual/kernel libmnl"
 inherit pkgconfig autotools
 
 RRECOMMENDS:${PN} = "kernel-module-mdio-netlink"
+
-- 
2.43.0


