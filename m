Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D2ECCFA04
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 01:53:25 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.2282.1693965202659533467
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 18:53:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="130427314"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="130427314"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 10:53:20 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0BFB5D29EB
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:53:18 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DECACD6025
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:53:16 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1BBD78653F;
	Wed,  6 Sep 2023 10:53:16 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] freerdp: upgrade 2.10.0 -> 2.11.0
Date: Wed,  6 Sep 2023 09:53:08 +0800
Message-Id: <1693965188-13918-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27858.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27858.004
X-TMASE-Result: 10-3.083100-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrG24YVeuZGmMtorPLNYrwZEbX
	NqhgWp8u1jypNY0wtaYrbVWjKPRUza8zfGxMvR+8aDCzqDR7DPYxXH/dlhvLvxG3US/I5cDR3eO
	MudZ4HeHgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZ7rencS+jsJiem2
	vw+cenKeLzNWBegCW29sZ0UX0EaOILbigRnpKlKZx+7GyJjhAUFMSWlsyFtlrg6/hGi8LkNjUy6
	4E4RN/ijSyr/1eU69JVOnIQVqaA6SeRBXQpXF4kDjRbo6Ev1q0oNzjGTkuVA9mzuHp16QqY7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 01:53:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104734

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Noteworthy changes:
* Various input validation fixes
* Added various CMake options #9317
* LibreSSL build fixes #8709

Fixed issues:
* Backported #9233: Big endian support
* Backported #9099: Mouse grabbing support
* Backported #6851: wayland scrolling fix
* Backported #8690: Update h264 to use new FFMPEG API
* Backported #7306: early bail from update_read_window_state_order breaks protocol
* Backported #8903: rdpecam/server: Remove wrong assertion
* Backported #8994: bounds checks for gdi/gfx rectangles
* Backported #9023: enforce rdpdr client side state checks
* Backported #6331: deactivate mouse grabbing by default
* Cherry-pick out of #9172: channels/cliprdr: Fix writing incorrect PDU type for unlock PDUs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../freerdp/{freerdp_2.10.0.bb => freerdp_2.11.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp_2.10.0.bb => freerdp_2.11.0.bb} (98%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.0.bb
similarity index 98%
rename from meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb
rename to meta-oe/recipes-support/freerdp/freerdp_2.11.0.bb
index 4cb452608e..de87dc3a02 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.0.bb
@@ -13,7 +13,7 @@ inherit pkgconfig cmake gitpkgv
 PE = "1"
 PKGV = "${GITPKGVTAG}"
 
-SRCREV = "7471ae383e7b7a613f275e19f7b54958a193c891"
+SRCREV = "1384b3c33b9bd7599633cc54bf20cf20ec6be83c"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https \
            file://winpr-makecert-Build-with-install-RPATH.patch \
            "
-- 
2.34.1


