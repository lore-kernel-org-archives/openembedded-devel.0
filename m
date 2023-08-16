Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D43C001DE
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:54:15 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.152219.1692150846709651391
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:54:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="116498492"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="116498492"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:54:04 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 40873CA1E4
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:54:02 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7A6EED9484
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:54:01 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C41F121BD58;
	Wed, 16 Aug 2023 10:54:00 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] weechat: upgrade 4.0.2 -> 4.0.3
Date: Wed, 16 Aug 2023 09:53:41 +0800
Message-Id: <1692150821-6154-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27816.003
X-TMASE-Result: 10-0.586500-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrG24YVeuZGmN4YeSlHZYFopmj
	18Axvjh0zIO4dXAjcKpFDp6wA1GXBQ3mZXbns8PVOWUWxTQJdI+YasbATu5ay31kNdLMcUU3k40
	5vw0y9i0QT82YoBmnzDzh+7RpDMYp4azk2mKXWa8D2WXLXdz+AXIa+KQSxiLwB/FMznsE8cPs/R
	/hFDFDJSL637QCIVpiAH/xyJs7whhFjW2X28b8Bjo39wOA02LhVeAZ5VSHdZ2bKItl61J/yZ+in
	TK0bC9eKrauXd3MZDW5b1JRE4P6adY7+6QiqdkEx2anbVvqVIbbULWcQkgonPId8Ovbj/GJ0yqA
	sjlWouh1ivQJZuAUFDayL7KNYjjWtYGxus6zGgmCV7SgdjlG21PJnXL2yNYdkuo847l05tDEzMy
	Amsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104405

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Bug fixes::
----------
* core: fix input length and crash after delete of line
* irc: fix display of self CTCP message containing bold attribute
* irc: fix memory leak in IRC message parser
* irc: fix switch to channel manually joined when server option
  autojoin_dynamic is on and option irc.look.buffer_switch_autojoin is off
* irc: fix display of outgoing notice with channel when capability
  "echo-message" is enabled
* relay: fix display of IRC CTCP messages received from client

Build::
-----------
 * doc: display a warning if a locale is missing with fallback to English
  for auto-generated content

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-irc/weechat/{weechat_4.0.2.bb => weechat_4.0.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-irc/weechat/{weechat_4.0.2.bb => weechat_4.0.3.bb} (93%)

diff --git a/meta-networking/recipes-irc/weechat/weechat_4.0.2.bb b/meta-networking/recipes-irc/weechat/weechat_4.0.3.bb
similarity index 93%
rename from meta-networking/recipes-irc/weechat/weechat_4.0.2.bb
rename to meta-networking/recipes-irc/weechat/weechat_4.0.3.bb
index 8f1e06f390..f78fd4fc90 100644
--- a/meta-networking/recipes-irc/weechat/weechat_4.0.2.bb
+++ b/meta-networking/recipes-irc/weechat/weechat_4.0.3.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://weechat.org/files/src/weechat-${PV}.tar.xz \
            file://0001-use-pkg-config-for-gcrypt-instead.patch \
            "
 
-SRC_URI[sha256sum] = "0e648ee0d024c8099425ee60d41b272924ec8e19800ee8f1441090708834023c"
+SRC_URI[sha256sum] = "880dbdce8e73b3f4802a082c4a1a7c61943dbc5867d7a95695e4e463c6535a92"
 
 inherit cmake pkgconfig
 
-- 
2.34.1


