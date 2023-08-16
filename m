Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D08C001DE
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:54:35 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.152020.1692150867988107933
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:54:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="115967550"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="115967550"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:54:25 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id BD01FD29E5
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:54:23 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id EA6BEBF3CD
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:54:22 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0560486E22;
	Wed, 16 Aug 2023 10:54:21 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xdg-dbus-proxy: upgrade 0.1.4 -> 0.1.5
Date: Wed, 16 Aug 2023 09:53:55 +0800
Message-Id: <1692150835-6192-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27816.003
X-TMASE-Result: 10--0.287800-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytGQgIVrmBL5FUV
	Lgjd3EiYUSSj7B+lizdHIe4DqnZCEc2i33nC1a8mA9lly13c/gFitmIjtFuxEwfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmiCGqH67UhpHuVd49c0zgWM050qcJ5WOMhmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZJ3YnF4DmuotSsNOrCIzthNCf6UvMYuy1d5LzRkuZvBWeUwH
	hW0+F8P5uCfsqoWkrbf382L5cUqO4v9aZUrCMPScUv6J+4mBAVLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104406

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
  * Fix handling of object paths > 255 bytes
  * Print better errors when message parsing fails
  * Optionally install tests for "as-installed" testing

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{xdg-dbus-proxy_0.1.4.bb => xdg-dbus-proxy_0.1.5.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/xdg-dbus-proxy/{xdg-dbus-proxy_0.1.4.bb => xdg-dbus-proxy_0.1.5.bb} (90%)

diff --git a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.4.bb b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.5.bb
similarity index 90%
rename from meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.4.bb
rename to meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.5.bb
index 35dee632a2..e10ccd04ea 100644
--- a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.4.bb
+++ b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.5.bb
@@ -14,6 +14,6 @@ inherit meson pkgconfig
 SRC_URI = "git://github.com/flatpak/xdg-dbus-proxy.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
-SRCREV = "6bfe8c32ab23f8c1d80af7a70b3d318a79a17652"
+SRCREV = "7466c8137fc06f863fde8486521984e43a26cd10"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


