Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC74C001E0
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:26 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.689.1689654379725723008
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="124880156"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="124880156"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:24 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CB6D1D3EB4
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:21 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1488CD5E99
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:21 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8C380200854E2;
	Tue, 18 Jul 2023 13:26:20 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] weechat: upgrade 4.0.1 -> 4.0.2
Date: Tue, 18 Jul 2023 12:25:46 +0800
Message-Id: <1689654348-30702-44-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10-3.040500-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrG24YVeuZGmN4YeSlHZYFonFQ
	4P0LNO7tgAud6WRc1//wfOXWTiuZvO3nZY4pYUTTqhcdnP91eXE81ck8U80WlgMFD5cGHhglTxS
	ugU04antruPzTKuxCyfF0YB7PLLTxfWP75SpO+lPjB2htmJXMOEyQ5fRSh265IPUd1fKoOcTs/R
	/hFDFDJSL637QCIVpiAH/xyJs7whhFjW2X28b8Bjo39wOA02LhVeAZ5VSHdZ2bKItl61J/yZ+in
	TK0bC9eKrauXd3MZDXWArjsnlY9DzcYCzVYTaqZGIeMtHVdM1bShSlWYFD843T7KE2z8MxWoExr
	I8T0HiCFSyf5B9B+OLNsNEMLsZZzdtAnsR9Ug+iCV7SgdjlG21PJnXL2yNYdkuo847l05tDEzMy
	Amsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103935

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Bug fixes::

  * core: fix renaming of options with command '/item rename'
  * core: don't send "key_pressed" signal again for the same key press
  * core: don't send "key_combo_*" signals for incomplete keys
  * core: add key ctrl-backspace in /help key
  * core: keep keys ctrl-H and ctrl-? (in lower case) if they were manually bound to custom commands in a previous version

Tests::

  * core: fix hdata tests failure on Alpine 3.18
  * relay: fix crash in tests on Alpine 3.18

Build::

  * php: fix detection of PHP 8.2 on Alpine 3.18

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-irc/weechat/{weechat_4.0.1.bb => weechat_4.0.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-irc/weechat/{weechat_4.0.1.bb => weechat_4.0.2.bb} (93%)

diff --git a/meta-networking/recipes-irc/weechat/weechat_4.0.1.bb b/meta-networking/recipes-irc/weechat/weechat_4.0.2.bb
similarity index 93%
rename from meta-networking/recipes-irc/weechat/weechat_4.0.1.bb
rename to meta-networking/recipes-irc/weechat/weechat_4.0.2.bb
index 00472e21eb..8f1e06f390 100644
--- a/meta-networking/recipes-irc/weechat/weechat_4.0.1.bb
+++ b/meta-networking/recipes-irc/weechat/weechat_4.0.2.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://weechat.org/files/src/weechat-${PV}.tar.xz \
            file://0001-use-pkg-config-for-gcrypt-instead.patch \
            "
 
-SRC_URI[sha256sum] = "1b9533123af427922b3d7fabede958dc85392d50881d97d0b7986d8f514556e9"
+SRC_URI[sha256sum] = "0e648ee0d024c8099425ee60d41b272924ec8e19800ee8f1441090708834023c"
 
 inherit cmake pkgconfig
 
-- 
2.34.1


