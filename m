Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3708CD54A8
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 08:02:19 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.2852.1695110533178022713
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 01:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="132648507"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="132648507"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 17:02:11 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 98B3BC68E8
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 17:02:08 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id CF458D5EA6
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 17:02:07 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B5C92007470A;
	Tue, 19 Sep 2023 17:02:07 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] remmina: upgrade 1.4.31 -> 1.4.32
Date: Tue, 19 Sep 2023 16:01:13 +0800
Message-Id: <1695110473-8479-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27884.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27884.005
X-TMASE-Result: 10--14.440600-10.000000
X-TMASE-MatchedRID: OIStEy/X03Cjz0nOeth/yUIIxwDaU5mrWfgivgcUPZNRxKUjyPAED33Y
	vtP37IU4OuzeNmOGKnN/J73098tKLujcH35fRruqJTyMiqml0ikKW68eInZ/haEuH17uq9IiaxZ
	lX1gwMFsLYGVIbQoEChtgDXGtpBuUlFKRvEp4lzg7I8qKHhHKyBgff28UuvITLaKzyzWK8GTAf/
	xnVqCA6nxi2H7TNiIJYkJe1bKK2fCGAgWc66O+Hw5YMW/LPq9Aj9NIFpTnH/W+f7ap9DJaDdSHn
	JDq2yhMzHL5fTnZvs5RMT6BdnQZ+XI0shGAc7FejoyKzEmtrEeOQOsE4nDCdKaYkqKEtUB4qyra
	WLXtXr0dJ+Ed5b0NmKTNA7jGXR040UwGeYlGH8n1A8E3bi1JHESQjdVrcDG6AIHQXgQgQg/TI48
	G/UH1dggvGgJhnjupVdNPsIcMVUMv+0FNnM7lDWgws6g0ewz2TnSpwnlY4yGbKItl61J/yZ+inT
	K0bC9eKrauXd3MZDUWBX33jERFaM4CVif2BEDH2LAX+e7sfn7ts6ax4n6xhiZsi9At6mAC
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 08:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105000

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* [REM2916] Added option to kill async process started by exec plugin on tab close
* Fix search bar toggle behavior
* Fix memory leaks
* [REM-2920] Password visibility can now be toggled on remmina_message_panels
* Remove SSH file paths from remmina file when unchecking box in profile edit
* Solved issue #2910 - Added support for IPv6 with fallback to IPv4 for ssh
* Fix UI bugs in Remmina Preferences set new password
* Fix memory leaks and change GTK critical errors to remmina warnings for null icon autostart file
* [REM-2926] Added ability to set a fixed aspect ratio for vnc connections when...
* Fix snap crash
* [REM-2936] Fix crash related to unmap events
* [REM-2938] Improved ordering of tray icon menu items
* Fix memory leaks in remmina_plugin_manager_init with g_free and g_ptr_array_free
* Remote assistance
* Spelling: Various strings for assistance mode
* Fix some compiler warnings
* Ability to SPICE connect to unix domain socket
* update multi monitor icon
* Save toggle options when duplicating connection
* Rem 2954
* New feature: Allow user to specify use of modifiers when changing key preferences
* [REM-2914] Alert user of unexpected disconnect instead of immediately closing the connection window
* Fix Remmina not using '@REMMINA_BINARY_PATH@'
* Highlight top bar when 'Grab all keyboard events' is enabled
* Snapcraft: Allow remmina preferences file to point to symlinked 'current' directory
* [REM-2850] Add ability to automatically move mouse to keep RDP connections alive
* Allow user to set REMMINA_GIT_REVISION
* Remove unnecessary parameters from remmina_public_get_server_port_wrapper
* Fix freeze that occurs when loading in python modules properly
* [REM-1923] Fix handling of pause break key for RDP connections
* [REM-2971] When quiting Remmina from the system tray the are you sure prompt now functions properly

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../remmina/{remmina_1.4.31.bb => remmina_1.4.32.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/remmina/{remmina_1.4.31.bb => remmina_1.4.32.bb} (96%)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.31.bb b/meta-oe/recipes-support/remmina/remmina_1.4.32.bb
similarity index 96%
rename from meta-oe/recipes-support/remmina/remmina_1.4.31.bb
rename to meta-oe/recipes-support/remmina/remmina_1.4.32.bb
index 56ad32ce37..74c68a59d8 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.31.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.32.bb
@@ -25,7 +25,7 @@ DEPENDS = " \
 DEPENDS:append:libc-musl = " libexecinfo"
 LDFLAGS:append:libc-musl = " -lexecinfo"
 
-SRCREV = "7407cc3a27eb25ba4ddddeab565f67fd688324ed"
+SRCREV = "4804f68f23045a38c3a7be46810fce14bac2fc3c"
 SRC_URI = "git://gitlab.com/Remmina/Remmina;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
-- 
2.34.1


