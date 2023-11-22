Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA04C61D92
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 06:19:15 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.13748.1700633946655716208
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 22:19:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="128536551"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="128536551"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 15:19:04 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 05711A7C43
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:19:02 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 42492D12DD
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:19:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6802E2005932A;
	Wed, 22 Nov 2023 15:19:00 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-bluetooth: upgrade 42.6 -> 42.7
Date: Wed, 22 Nov 2023 14:18:08 +0800
Message-Id: <1700633888-7797-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28012.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28012.005
X-TMASE-Result: 10-2.350700-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrG24YVeuZGmOEmxOjZ1LZ2ZYv
	gWqjMEza+vKnbgltiZw5pAfSkVq90L2xlZTrH0CoZy/08A2dD0hUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmiAxYKB0LOn5q6kMgL3jbYOsiPdm6aAm4oF0dfZ5kV9l8p0R
	URDvVjQbF9uGobEuT7gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLPdXB+KaNVe4ZEo5
	YPiG0B6fONqD+KgT/uyGxrJ2lL/9ZKR+PrFJpm4lUgmKuZGMwKMJShE3Q6KeMs+4qllpg039HN4
	vZ4hppqIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 06:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106993

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-fixes bugs that stopped the Obex Push server from automatically accepting files
 from paired devices and caused the device's Connection switch to appear out of
 sync with the connection state.
-build fixes
-updated translations

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-bluetooth_42.6.bb => gnome-bluetooth_42.7.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_42.6.bb => gnome-bluetooth_42.7.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.6.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.7.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.6.bb
rename to meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.7.bb
index 1385e4203..ba5e55826 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.6.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.7.bb
@@ -25,7 +25,7 @@ inherit features_check gnomebase gtk-icon-cache gtk-doc gobject-introspection
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-SRC_URI[archive.sha256sum] = "5864fe6f1e718715db26b62201b75a59020cf4247fec37645b3559cd2dba59d0"
+SRC_URI[archive.sha256sum] = "94df1729dbec3bb105e588eaf5312bbbaa05c49ea733202a10dc3f7532bdf869"
 
 BT_PULSE_PACKS = " \
     pulseaudio-lib-bluez5-util \
-- 
2.34.1


