Return-Path: <thond2009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D69C36011
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:50 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web10.47796.1743412367218774284
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: gmail.com, ip: 156.147.23.51, mailfrom: thond2009@gmail.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.51 with ESMTP; 31 Mar 2025 18:12:45 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: thond2009@gmail.com
Received: from unknown (HELO tho3-nguyen-weboscsm.bee-live.svc.cluster.local) (10.185.60.84)
	by 156.147.1.151 with ESMTP; 31 Mar 2025 18:12:45 +0900
X-Original-SENDERIP: 10.185.60.84
X-Original-MAILFROM: thond2009@gmail.com
From: Nguyen Dat Tho <thond2009@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nguyen Dat Tho <tho3.nguyen@lge.com>
Subject: [meta-multimedia][PATCH] openal-soft: upgrade 1.23.1 -> 1.24.3
Date: Mon, 31 Mar 2025 18:12:36 +0900
Message-Id: <20250331091236.1848719-1-thond2009@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116425

From: Nguyen Dat Tho <tho3.nguyen@lge.com>

Changelog:
  https://github.com/kcat/openal-soft/blob/master/ChangeLog

Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
---
 .../openal/{openal-soft_1.23.1.bb => openal-soft_1.24.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/openal/{openal-soft_1.23.1.bb => openal-soft_1.24.3.bb} (95%)

diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.23.1.bb b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb
similarity index 95%
rename from meta-multimedia/recipes-multimedia/openal/openal-soft_1.23.1.bb
rename to meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb
index 83745703f5..e79efd4697 100644
--- a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.23.1.bb
+++ b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb
@@ -7,7 +7,7 @@ inherit cmake pkgconfig
 
 DEPENDS = "zlib libsndfile1"
 
-SRCREV = "d3875f333fb6abe2f39d82caca329414871ae53b"
+SRCREV = "dc7d7054a5b4f3bec1dc23a42fd616a0847af948"
 SRC_URI = "git://github.com/kcat/openal-soft.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


