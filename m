Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3662BC0015E
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:14:35 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.7469.1687850067015209936
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:14:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="101771703"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="101771703"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:14:25 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D6203D29E5
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:23 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E182D5C3B
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:23 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2762C88D20;
	Tue, 27 Jun 2023 16:14:22 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] weechat: upgrade 3.8 -> 4.0.0
Date: Tue, 27 Jun 2023 15:12:19 +0800
Message-Id: <1687849939-19941-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
References: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27716.005
X-TMASE-Result: 10-3.315900-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mr9pLnYtQ99xKaDNlRJumzuWlF
	7OhYLlctoiRiRqJbjhYF1Ec/oUIRldAy2LXTI7g3EXjPIvKd74D4qCLIu0mtIO63p3Evo7CYnpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFEWssuljWZ/QbPH2VLmOdHQ4gV
	8elZQrri8vMPo8QCxAVsU4fkx/qncZCf332Hu9bWtHgLdeP4+xvuOOh9YrJr9tMScbrIKln+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 07:14:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103611

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://weechat.org/files/doc/weechat/ChangeLog-4.0.0.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-irc/weechat/{weechat_3.8.bb => weechat_4.0.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-irc/weechat/{weechat_3.8.bb => weechat_4.0.0.bb} (93%)

diff --git a/meta-networking/recipes-irc/weechat/weechat_3.8.bb b/meta-networking/recipes-irc/weechat/weechat_4.0.0.bb
similarity index 93%
rename from meta-networking/recipes-irc/weechat/weechat_3.8.bb
rename to meta-networking/recipes-irc/weechat/weechat_4.0.0.bb
index 8c770938af..eb9f8c8f14 100644
--- a/meta-networking/recipes-irc/weechat/weechat_3.8.bb
+++ b/meta-networking/recipes-irc/weechat/weechat_4.0.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://weechat.org/files/src/weechat-${PV}.tar.xz \
            file://0001-use-pkg-config-for-gcrypt-instead.patch \
            "
 
-SRC_URI[sha256sum] = "f7cb65c200f8c090c56f2cf98c0b184051e516e5f7099a4308cacf86f174bf28"
+SRC_URI[sha256sum] = "5bd75ee15f3392a0ad174ee7c54518daece3878477670c07f10d6ebf988240f9"
 
 inherit cmake pkgconfig
 
-- 
2.34.1


