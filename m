Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F791C6FA8F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:08:44 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.6250.1692864517638344547
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="129323076"
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="129323076"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:08:35 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 84048CA1E4
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:08:31 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BACD8D8B71
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:08:30 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F26220093544;
	Thu, 24 Aug 2023 17:08:30 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-bluetooth: upgrade 42.5 -> 42.6
Date: Thu, 24 Aug 2023 16:08:05 +0800
Message-Id: <1692864485-2184-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27832.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27832.006
X-TMASE-Result: 10-0.770000-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrC//1TMV5chMHzz3J3co1Zdmz
	LmhBcZthzDEb+Y2UcKgefeycEmxucOxuEpSKm2TEZy/08A2dD0hUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmiAxYKB0LOn5q6kMgL3jbYOsiPdm6aAm4oF0dfZ5kV9l8p0R
	URDvVjQbF9uGobEuT7gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLOXROZr3kzInSre1
	gfkV3Otr6eK4NLNajkdsX9vXbAqs1xp0BK2EaECgzKFl8uOZWy01cHUPNhGQtHSyaAidy8nDUux
	MKVOCFuIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 08:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104561

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 This version fixes problems with icons for mice and tablets, updates status labels
 to be dimmed by default, and contains updated translations.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-bluetooth_42.5.bb => gnome-bluetooth_42.6.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_42.5.bb => gnome-bluetooth_42.6.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.5.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.6.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.5.bb
rename to meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.6.bb
index fa4f9cb78f..7cce14dba9 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.5.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.6.bb
@@ -26,7 +26,7 @@ inherit features_check gnomebase gtk-icon-cache gtk-doc gobject-introspection
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-SRC_URI[archive.sha256sum] = "a4f5f1ac2dbb7b7b92f7d6d2b42c030f62aed9b5426b9dc116946041f3cba8f7"
+SRC_URI[archive.sha256sum] = "5864fe6f1e718715db26b62201b75a59020cf4247fec37645b3559cd2dba59d0"
 
 BT_PULSE_PACKS = " \
     pulseaudio-lib-bluez5-util \
-- 
2.34.1


