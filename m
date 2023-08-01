Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625ADC07E8A
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:18 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.7628.1690875731007171006
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="126412238"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="126412238"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:09 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DD7E37FB80
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:06 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 23C75BF49B
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:06 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A79AF10211;
	Tue,  1 Aug 2023 16:42:05 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gspell: upgrade 1.12.1 -> 1.12.2
Date: Tue,  1 Aug 2023 15:41:23 +0800
Message-Id: <1690875717-21608-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10--2.616800-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrTJDl9FKHbrkwcMedHxxRAtMj
	jwb9QfV2lHVH/UHDB9Hmn3xyPJAJop1OGPOtOV850NA+DE6YXwRsce70VI2yoYFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXJ8gfPpJSIdJO4cJ+rdaVSrqj476yGEbY/V+a
	pIVBXe0cf14KfK8W5xajZQB2ebQRBsmoJQBBGmAB9Ge2Hxt1zVhp97djmKgFD+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104164

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Small code maintenance: don't use g_slice_*().

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/gspell/{gspell_1.12.1.bb => gspell_1.12.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gspell/{gspell_1.12.1.bb => gspell_1.12.2.bb} (76%)

diff --git a/meta-gnome/recipes-gnome/gspell/gspell_1.12.1.bb b/meta-gnome/recipes-gnome/gspell/gspell_1.12.2.bb
similarity index 76%
rename from meta-gnome/recipes-gnome/gspell/gspell_1.12.1.bb
rename to meta-gnome/recipes-gnome/gspell/gspell_1.12.2.bb
index 6b65af3bb4..389f2fd48c 100644
--- a/meta-gnome/recipes-gnome/gspell/gspell_1.12.1.bb
+++ b/meta-gnome/recipes-gnome/gspell/gspell_1.12.2.bb
@@ -7,4 +7,4 @@ DEPENDS = "gtk+3 iso-codes enchant2"
 
 inherit gnomebase gettext gobject-introspection vala
 
-SRC_URI[archive.sha256sum] = "8ec44f32052e896fcdd4926eb814a326e39a5047e251eec7b9056fbd9444b0f1"
+SRC_URI[archive.sha256sum] = "b4e993bd827e4ceb6a770b1b5e8950fce3be9c8b2b0cbeb22fdf992808dd2139"
-- 
2.34.1


