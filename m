Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B89E3C001E0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:23:09 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.115830.1698049387699015147
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="138660311"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="138660311"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:23:05 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E5618D9DA6
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:23:02 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 34D5ED5EA9
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:23:02 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 644D92005932A;
	Mon, 23 Oct 2023 17:23:01 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] metacity: upgrade 3.46.1 -> 3.50.0
Date: Mon, 23 Oct 2023 16:22:49 +0800
Message-Id: <1698049369-24648-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10-1.524300-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrK2GKtdiFmTkgqW/YTgas3m8q
	nFk+BWUXDNTRoAwsU2ENyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl5GUF3NhJu3iOrT
	V1pt7yWJcCZaPgys8h8AoifPuvlEW4nzYos/x/8I6N/cDgNNi4arevnr2JqmbgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcv5BzDEdZecNxrK69mpkbKWJrq9a84ODE46eA
	BMeFxcVzZUseUB/Lk1OMUfSsWNvEAWmpKB7xHYHRVgW56OpHUfvqFnidONFSv6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:23:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105642

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Updated translations.
- Remove window shading keybinding.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../metacity/{metacity_3.46.1.bb => metacity_3.50.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/metacity/{metacity_3.46.1.bb => metacity_3.50.0.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.46.1.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.50.0.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/metacity/metacity_3.46.1.bb
rename to meta-gnome/recipes-gnome/metacity/metacity_3.50.0.bb
index 3ada6515f8..2f8173c017 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_3.46.1.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_3.50.0.bb
@@ -23,7 +23,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 inherit gnomebase gsettings gettext upstream-version-is-even features_check
 
-SRC_URI[archive.sha256sum] = "00ba49f7612088f2b3baeca79c45eb2a30423c2e4a7bea4015872beae25dd6c5"
+SRC_URI[archive.sha256sum] = "18e9b106438d46394e4148bcb83acc6367312be54559cdb564e270c1ccaeb60f"
 SRC_URI += "file://0001-drop-zenity-detection.patch"
 
 PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama"
-- 
2.34.1


