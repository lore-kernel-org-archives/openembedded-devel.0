Return-Path: <thond2009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BB2EC36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 09:11:42 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.web10.4080.1744189899988461063
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 02:11:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: gmail.com, ip: 156.147.23.53, mailfrom: thond2009@gmail.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.53 with ESMTP; 9 Apr 2025 18:11:37 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: thond2009@gmail.com
Received: from unknown (HELO tho3-nguyen-weboscsm.bee-live.svc.cluster.local) (10.185.60.38)
	by 156.147.1.121 with ESMTP; 9 Apr 2025 18:11:37 +0900
X-Original-SENDERIP: 10.185.60.38
X-Original-MAILFROM: thond2009@gmail.com
From: Nguyen Dat Tho <thond2009@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nguyen Dat Tho <tho3.nguyen@lge.com>
Subject: [meta-networking][PATCH] weechat: upgrade 4.5.0 -> 4.6.0
Date: Wed,  9 Apr 2025 18:11:23 +0900
Message-Id: <20250409091123.103612-1-thond2009@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 09:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116729

From: Nguyen Dat Tho <tho3.nguyen@lge.com>

Changelog:
  https://github.com/weechat/weechat/blob/v4.6.0/CHANGELOG.md

Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
---
 .../recipes-irc/weechat/{weechat_4.5.0.bb => weechat_4.6.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-irc/weechat/{weechat_4.5.0.bb => weechat_4.6.0.bb} (93%)

diff --git a/meta-networking/recipes-irc/weechat/weechat_4.5.0.bb b/meta-networking/recipes-irc/weechat/weechat_4.6.0.bb
similarity index 93%
rename from meta-networking/recipes-irc/weechat/weechat_4.5.0.bb
rename to meta-networking/recipes-irc/weechat/weechat_4.6.0.bb
index cca2bf4ecc..da79c59ba5 100644
--- a/meta-networking/recipes-irc/weechat/weechat_4.5.0.bb
+++ b/meta-networking/recipes-irc/weechat/weechat_4.6.0.bb
@@ -8,7 +8,7 @@ DEPENDS = "zlib libgcrypt gnutls curl aspell zstd cjson gettext-native"
 
 SRC_URI = "https://weechat.org/files/src/weechat-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "b85e800af0f7c9f2d60d72c0f7e56abbaa60274a4d47be17407907292da30398"
+SRC_URI[sha256sum] = "2681fc662996fead9d66a26d81740088e4284cf4e6dfe6b834f3b98fc703597f"
 
 inherit cmake pkgconfig
 
-- 
2.34.1


