Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69190C001E0
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:06 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.682.1689654363908940538
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="112602061"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="112602061"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:01 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1E8ACD4F59
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:25:59 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 62880CF7C6
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:25:58 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DE90B200854E2;
	Tue, 18 Jul 2023 13:25:57 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] gensio: upgrade 2.6.6 -> 2.6.7
Date: Tue, 18 Jul 2023 12:25:05 +0800
Message-Id: <1689654348-30702-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10-4.738000-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrG24YVeuZGmPfKapXkCLRBYr8
	9wC5UuPWsrSRpmPuC6Nk3oR40BD5eUL9uIW7+6TbG9TMqjxt7zFUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmikZmKVOLxy1I7Cl8sx4HBGw1Uei1O+6/rAhn751acftuem2
	vw+cenKeLzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAURVFCJ+zQj9PIfFt7eUObzuC6x
	gsdV3yVWfxp33jhqNAZ5oud+g6QfEQTvIcRlNn44YJ7Vpz1gmYIdY+lAV56R0stbCMyZjm97H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103895

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fixes a few issues with pkg-config
* I ran coverity on Windows. It found a bunch of little things, but nothing of any real significance. But the little things are fixed.
* A "dev" gensio is added for devices that are not serial ports. For instance, line-printers with two-way data transfer can be used.
* You can now use "sdev" as shorthand for "serialdev".
* A systemd unit file example is added
* Other typos and little fixes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gensio/{gensio_2.6.6.bb => gensio_2.6.7.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.6.6.bb => gensio_2.6.7.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.6.6.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.6.7.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/gensio/gensio_2.6.6.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_2.6.7.bb
index 85160bcda3..c3ba96ff60 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.6.6.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.6.7.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     "
 
-SRCREV = "536db06723bd3cde8e1f2d52a5cdd65af2433784"
+SRCREV = "266277aeb39dc2db33e577335236f89ed7ca5918"
 
 SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=master"
 
-- 
2.34.1


