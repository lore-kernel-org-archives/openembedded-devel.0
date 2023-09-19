Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A26DEE0215
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:30:39 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.2182.1695108633060498607
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:30:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="132119230"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="132119230"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:30:31 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4FF1DDB4CE
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:30:28 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 886C7D968A
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:30:27 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id B5458883DD;
	Tue, 19 Sep 2023 16:30:26 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] eog: upgrade 44.3 -> 45.0
Date: Tue, 19 Sep 2023 15:30:19 +0800
Message-Id: <1695108619-6907-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27884.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27884.006
X-TMASE-Result: 10-1.905400-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrN5dqZcIK7VgwcMedHxxRAiFL
	Sh+QCTPZIvrftAIhWmLy9zcRSkKatTrIIDpXIcjHtAlV2L6pgFHmDCqb+qEqyaEuH17uq9IikrI
	9/WPu3jetyIGyqiA2AwHPh0m8/rkHrWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNfbfI5FfdyGmtAdxkOQs8WIgzfxDCTaAb5lIH8bmzUDBcwouticDEuXQP75a+xlwZmqPf
	/QXvDEWUkQjByS4GSF4mxUC2yp3O9ctSarHnY/EU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104961

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 * help: Replace dead IRC links

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/eog/{eog_44.3.bb => eog_45.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/eog/{eog_44.3.bb => eog_45.0.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/eog/eog_44.3.bb b/meta-gnome/recipes-gnome/eog/eog_45.0.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/eog/eog_44.3.bb
rename to meta-gnome/recipes-gnome/eog/eog_45.0.bb
index 06203fbbe0..eb3d07ce10 100644
--- a/meta-gnome/recipes-gnome/eog/eog_44.3.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_45.0.bb
@@ -22,7 +22,7 @@ inherit gnomebase pkgconfig gsettings gobject-introspection gettext mime-xdg fea
 # FIXME: whilst eog uses libpeas <2, g-i is needed. This can be removed when libpeas2 is used.
 REQUIRED_DISTRO_FEATURES = "opengl gobject-introspection-data"
 
-SRC_URI[archive.sha256sum] = "d6b2d70f4b432ff8cf494c8f9029b2621d08e7817938317d64063ae6c4da9d8c"
+SRC_URI[archive.sha256sum] = "05cb2c9a66ba15870f47358cd4c1ce670f17e4c8b22e050d627d728ff88b57ba"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.34.1


