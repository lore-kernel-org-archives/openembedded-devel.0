Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E1EC7EE39
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:58:27 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.6087.1684997897816270719
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="97363776"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="97363776"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:58:15 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id F236DE8523
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:58:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 405C8D3F37
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:58:12 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9E9F12008FF8C;
	Thu, 25 May 2023 15:58:11 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] setxkbmap: upgrade 1.3.3 -> 1.3.4
Date: Thu, 25 May 2023 14:58:04 +0800
Message-Id: <1684997886-2137-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997886-2137-1-git-send-email-wangmy@fujitsu.com>
References: <1684997886-2137-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27648.005
X-TMASE-Result: 10-2.152400-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrBGvINcfHqhds1Ir4NZzFmmAz
	/p8lErXAKNLrUo1TED2fJsQgxsr97WpSPf7GObmnP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW7v0LMVKXbDRXk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5L6a
	n5yolzgYG4S48Wg05DEnR0Bnz39f1GiTS4LyvSU4qhQCKp/5f4IyCBj4C2H6LYyh/ZkkeKXBcsa
	ROl35CuHxTo857/0ZmCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102843

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
Check for the XWAYLAND extension
Fix "Xwayland" spelling
Route the Xwayland warning through stderr
Be more careful about querying randr
gitlab CI: stop requiring Signed-off-by in commits

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{setxkbmap_1.3.3.bb => setxkbmap_1.3.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{setxkbmap_1.3.3.bb => setxkbmap_1.3.4.bb} (86%)

diff --git a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.3.bb b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.4.bb
similarity index 86%
rename from meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.3.bb
rename to meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.4.bb
index 18fa63ead..9c522d6ae 100644
--- a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.3.bb
+++ b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.4.bb
@@ -16,4 +16,4 @@ DEPENDS += "libxkbfile xrandr"
 BBCLASSEXTEND = "native"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "b560c678da6930a0da267304fa3a41cc5df39a96a5e23d06f14984c87b6f587b"
+SRC_URI[sha256sum] = "be8d8554d40e981d1b93b5ff82497c9ad2259f59f675b38f1b5e84624c07fade"
-- 
2.34.1


