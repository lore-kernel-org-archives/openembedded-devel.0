Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22FE1C7EE2E
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:56:37 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.6064.1684997793105741374
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="105604820"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="105604820"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:56:30 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 67CD0D29E9
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:56:27 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C53FD94B2
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:56:26 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2A1DD2007CA80;
	Thu, 25 May 2023 15:56:26 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hidapi: upgrade 0.13.1 -> 0.14.0
Date: Thu, 25 May 2023 14:56:12 +0800
Message-Id: <1684997777-2061-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997777-2061-1-git-send-email-wangmy@fujitsu.com>
References: <1684997777-2061-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27648.005
X-TMASE-Result: 10--3.532900-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzT+1Zj+w66+lYM
	JR3dIrh2x/1swsBKUWG0A1iSwqAoSn1j++UqTvpTEVuC0eNRYvIplXRoxG4ek+5SxpUwKMkt/rZ
	zL50JflPwx1fpYFo1NHp5g9gYJWDLJEVzBtPVDTwD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpixwb6oUXQPLJy7YhgtA3A/54CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyHEqm
	8QYBtMOhMKsqcW0oOMNWkdh2HeiMmtP3Zf8wgkN/6EKWS+zXKcL7xnpeTMCqd468haiEHK1Tq6P
	+XpPkzd5lxYYQ/LiX7m4IrZuC207gr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102814

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
general: add hid_get_report_descriptor API function (#451)
macOS: fix retrieving USB Interface number on macOS 13.3 (#534)
macOS: Properly handle the close of run loop on macOS (#522)
libusb: fix crash in hid_enumerate() caused by a stale device handle (#526)
windows: alternative way to get USB Serial Number if not provided by HidD_GetSerialNumberString (#464)
windows: don't mark with dllexport in static build (#507/#515)
windows: Get Bluetooth device Model Number String instead of Device Name into product string (#500)
general: fixes (mostly error handling) of issues found by Coverity Scan (#552/#554/#555/#559/#560/#561)
general: variouse fixes and improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../hidapi/{hidapi_0.13.1.bb => hidapi_0.14.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hidapi/{hidapi_0.13.1.bb => hidapi_0.14.0.bb} (90%)

diff --git a/meta-oe/recipes-support/hidapi/hidapi_0.13.1.bb b/meta-oe/recipes-support/hidapi/hidapi_0.14.0.bb
similarity index 90%
rename from meta-oe/recipes-support/hidapi/hidapi_0.13.1.bb
rename to meta-oe/recipes-support/hidapi/hidapi_0.14.0.bb
index 2e62612e3..91e5b55be 100644
--- a/meta-oe/recipes-support/hidapi/hidapi_0.13.1.bb
+++ b/meta-oe/recipes-support/hidapi/hidapi_0.14.0.bb
@@ -12,5 +12,5 @@ RDEPENDS:${PN}:append:libc-glibc = " glibc-gconv-utf-16"
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/libusb/hidapi.git;protocol=https;branch=master"
-SRCREV = "4ebce6b5059b086d05ca7e091ce04a5fd08ac3ac"
+SRCREV = "d3013f0af3f4029d82872c1a9487ea461a56dee4"
 S = "${WORKDIR}/git"
-- 
2.34.1


