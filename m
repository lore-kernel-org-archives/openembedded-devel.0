Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E8AEB64DB
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 06:50:21 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.2313.1687157419852830676
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jun 2023 23:50:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="121192083"
X-IronPort-AV: E=Sophos;i="6.00,254,1681138800"; 
   d="scan'208";a="121192083"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 15:50:18 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6844AF0767
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:16 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 985D0D4BF5
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:15 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id C3ABE2FC8442;
	Mon, 19 Jun 2023 15:50:14 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] evince: upgrade 44.1 -> 44.2
Date: Mon, 19 Jun 2023 14:48:07 +0800
Message-Id: <1687157308-17342-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
References: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27700.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27700.005
X-TMASE-Result: 10--3.963400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4Bchr4pBLGIvAH8UzOewTxw+z9
	H+EUMUMlIvrftAIhWmJ8eC2pVr1wbx7GIvj+BE01sZaZ5UBQsoe8TPg5rIBCgIFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXKJO6NOecatZ8axAIhS4DzWWYr75uBfPNFols
	kAbGxjiiN7h+Ytfx9bPIKv2xUhLzICHzwlReYmxZnXazZU7BXmWVnrUjptf63+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103358

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/evince/{evince_44.1.bb => evince_44.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/evince/{evince_44.1.bb => evince_44.2.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/evince/evince_44.1.bb b/meta-gnome/recipes-gnome/evince/evince_44.2.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/evince/evince_44.1.bb
rename to meta-gnome/recipes-gnome/evince/evince_44.2.bb
index a844324ad..00d107910 100644
--- a/meta-gnome/recipes-gnome/evince/evince_44.1.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_44.2.bb
@@ -34,7 +34,7 @@ REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'open
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] = "15afd3bb15ffb38fecab34c23350950ad270ab03a85b94e333d9dd7ee6a74314"
+SRC_URI[archive.sha256sum] = "9a75c7ff8f599218d070e09fb4082cb26f9b86370a9bfae98e1aacb564d675dd"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.34.1


