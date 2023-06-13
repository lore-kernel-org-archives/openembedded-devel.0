Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A01D6CA9EA0
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:41:03 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.3831.1686620459046713221
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:41:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="108391046"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="108391046"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:41:02 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A8AE8CD7E0
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:59 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id DF9C6BF4A8
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:58 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6674D20079126;
	Tue, 13 Jun 2023 10:40:58 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] tio: upgrade 2.5 -> 2.6
Date: Tue, 13 Jun 2023 09:40:22 +0800
Message-Id: <1686620422-29962-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10--3.669900-10.000000
X-TMASE-MatchedRID: eWs1WpfTtqCjz0nOeth/yUIIxwDaU5mrMVx/3ZYby7/5V4X/65Dwb5gU
	Ly4zAbFBgqbIqTpcd3zmxW/PTt1cUwdrD3O6lkawzmwpmAFt7kVN8rmPQRlvKzYnGCpPrrgS6SA
	S+mkx1FHx79muHEGAiwY/wdDFDceDHMPTw7mbdNGC+Y2uxPjocht0qAFnFONluBsk5njfgGzUF0
	LwgfZcDQgvGgJhnjup6l71yjwYOQZlYwkarmHZPhF4zyLyne+AVBDQSDMig9HEosIs7IJbkNb2e
	7N2CFQyN5at2BIGOiZhafan3Io4vZH0YXYnbGozFEUknJ/kEl5lVdRvgpNpe/oLR4+zsDTtpmd/
	ehreR4Wy0AhWrhoSmdaFXGjkNh7PpWgPwLJ4xeWhbdamfTTSBYiaU6/W2aGvHCRrUGjJJ49JIz5
	teFinkhcb/5a7JM8t+XmnG4i8S93yDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103249

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 * Remove warning when using pattern option
 * Add --log-append option
 * Update man page
 * Update README
 * Fix line termination for response wait feature
 * Update tty device listing configuration
 * Move map variables to tty to keep them all in one spot
 * Configure socket mapping flags from tty parsing logic. Remove duplicate parsing logic in socket
 * Support input mapping modes for sockets
 * Various spelling fixes
 * avoid "warning: unused parameter" on setspeed stub
 * use right /dev/ path on Haiku
 * Update README with details on snap confinement

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/tio/{tio_2.5.bb => tio_2.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/tio/{tio_2.5.bb => tio_2.6.bb} (91%)

diff --git a/meta-oe/recipes-support/tio/tio_2.5.bb b/meta-oe/recipes-support/tio/tio_2.6.bb
similarity index 91%
rename from meta-oe/recipes-support/tio/tio_2.5.bb
rename to meta-oe/recipes-support/tio/tio_2.6.bb
index 1f69e1a9e..1a83a2e42 100644
--- a/meta-oe/recipes-support/tio/tio_2.5.bb
+++ b/meta-oe/recipes-support/tio/tio_2.6.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0e1a95b7892d3015ecd6d0016f601f2c"
 
 SRC_URI = "git://github.com/tio/tio;protocol=https;nobranch=1"
-SRCREV = "a2bbab068428275febeea13906654b9e58400c95"
+SRCREV = "88ef473362c5a1ff0dcd389fd5b1d4d6bf202472"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


