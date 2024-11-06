Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB31D29F88
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:23 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.40131.1730874676482827245
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=W+RDTKZM;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874678; x=1762410678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=HPOllaSi/oJiHZopczhy+/xuUFs3G9YrqGTUwLWH53U=;
  b=W+RDTKZMUG5NAa7LuaCDAXER21JPTcsQ+sxyWRJ+E3pTd2Zsn6QwV7xr
   0ZjQy0OsVTGKEdtj9ASS5WCdCx/iK4PwbkigTfITwJWlhtYet/PWFEH8c
   EYH204+3rAedyYMdccaRx7b6S0DsEECnmjPRCb5nPnsM0P66skjrvWz0O
   y16pcA2Jjo61HGpib+QSTAo1HAmdbHX5KRp+ZvjWCceL06HrKJSgYFHvb
   sRXMfFfOyD8ISN53x9NCd78ZsVosJ3QlAB/KBNsa5fYKTyv3FCmCN++BI
   Piq+2lk/gWu1ttcZSpBMJ/x5gNiKsD7avYFIJ/dNM9nfj4gYARwBqjM6V
   w==;
X-CSE-ConnectionGUID: 0pEYJJ4qTYORyEiWkRH/bA==
X-CSE-MsgGUID: JXEIGAGETASdIrED4VOG8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="179498406"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="179498406"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:16 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8727CC684B
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:14 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id CA429D50F4
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 558B66B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 043AB1A000A;
	Wed,  6 Nov 2024 14:31:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 15/46] poppler: upgrade 24.09.0 -> 24.11.0
Date: Wed,  6 Nov 2024 14:30:29 +0800
Message-Id: <1730874660-2364-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10--2.659100-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvIgofMgahPrR4o
	ak3KDMhH8kWQ1CLeQ5LTCbsGsB8dh05enoFAhOlo72ud2GNk0ie/yN2q8U674gSG3rUhmUxrT5D
	+tWniw5oDCvV3UwP6eHQ0fw6r+D88P0RMDgPThrUMPOZL2X19ilQQ0EgzIoPRB/FMznsE8cPu/Q
	yUVIt+aU0NCZDxtvO/5p98cjyQCaIMCLEGW7c2cDo39wOA02LhfS0Ip2eEHnyFh/DzryTTlvc8O
	Jc7+0VJjoczmuoPCq01BzdhEMyNHKw0USq3+2HDdCAkKSalNB4rlrlOI43l9ECDKI+aTgFlSDzR
	T4+DiHh1R0FVDIv0zsRrHy150urx2TsU/7lzqr8dJuEZuYbKVcUkrvIudlEZl07dDrsiYvyCLhF
	TP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113700

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
core:
* Fix rendering of some buttons
* Fix selecting fonts in TTC font collections
* CairoOutputDev: prevent infinite loop in functionShadedFill()
* Fix some unstable headers not being usable on their own
* Fix some headers not being usable on their own
* Add support for SubmitForms Links
* Internal code improvements
* Fix crash in malformed documents

glib:
* Fix some headers not being usable on their own
* add INSTALL_GLIB_DEMO option to install poppler-glib-demo
* Fix Launch action with unicode encoded filenames
* add auto_cleanup functions so that consumers can use g_auto*
* fix closure GI annotation

qt6:
* Fix memory handling issue on signature creation
* Fix Launch action with unicode encoded filenames
* Add support for SubmitForms Links
* Add API for creating signature field without signing immediately

qt5:
* Fix Launch action with unicode encoded filenames
* Add support for SubmitForms Links

build system:
* Remove duplicate definitions
* cmake: Set CMAKE_C_STANDARD to 17
* Use the boosts own cmake file as suggested by cmake itself

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../poppler/{poppler_24.09.0.bb => poppler_24.11.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_24.09.0.bb => poppler_24.11.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_24.09.0.bb b/meta-oe/recipes-support/poppler/poppler_24.11.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_24.09.0.bb
rename to meta-oe/recipes-support/poppler/poppler_24.11.0.bb
index fb6b534cf..8b9888a78 100644
--- a/meta-oe/recipes-support/poppler/poppler_24.09.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_24.11.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://basename-include.patch \
            file://0001-cmake-Do-not-use-isystem.patch \
            "
-SRC_URI[sha256sum] = "ebd857987e2395608c69fdc44009692d5906f13b612c5280beff65a0b75dc255"
+SRC_URI[sha256sum] = "7723d880565211740c13649d24a300257b86ddd7fa2d208187ff7e5cc8dfbd58"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0 glib-2.0-native"
 
-- 
2.34.1


