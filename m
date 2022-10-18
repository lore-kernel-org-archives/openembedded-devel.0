Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4673DC4332F
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 08:32:19 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web09.4520.1666081936502436495
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Oct 2022 01:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CPQlMp0c;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 555F040010;
	Tue, 18 Oct 2022 08:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666081934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+dy0fB4LwlcR0MqTF95OgjrNb0mvIgshI9EsU0/sPEk=;
	b=CPQlMp0cTVb8C4pPNfuUvCKRd64JcyEVKxBzmpU85AwF/acci0gxPfC0Xzvr6GJL6bOCWs
	E1nnANySmAtaoYPsCT6paERwwwxCPNfX37vaSVXufNjf2Iq5D6fk1q2Z5e1PpB+jtUjndx
	rB1tZXJNCOGrcxWIXpUZQ1VNU1sRHynOKUGDRHxIymHB6EmNsc4dD/0QDGAW9zW2mbMa/X
	LwLxuxCt0RTQ+NdhIpazk+zMz6xIznq+jJk4vBc4Ej6Ho/H2BRdhx7FIqIrCVU1rlGutVP
	W8hBKDOo2p9aadzzVZO+QDwp4zJiTotVS3zuN3xXbh4YDAVbmsolvVp7+mjCZQ==
From: thomas.perrot@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [oe][meta-xfce][PATCH] xfce4-settings: upgrade 4.16.2 -> 4.16.3
Date: Tue, 18 Oct 2022 10:32:07 +0200
Message-Id: <20221018083207.3286412-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 08:32:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99237

From: Thomas Perrot <thomas.perrot@bootlin.com>

This version includes a fix for an issue led by libx11 thread
safety feature, that is enabled by default, since the upgrade
to 1.8.1.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 .../{xfce4-settings_4.16.2.bb => xfce4-settings_4.16.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.16.2.bb => xfce4-settings_4.16.3.bb} (93%)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.3.bb
similarity index 93%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.3.bb
index aa4265f7b0d9..f283edac6a77 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.3.bb
@@ -9,7 +9,7 @@ inherit xfce features_check mime-xdg
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-xsettings.xml-Set-default-themes.patch"
-SRC_URI[sha256sum] = "4dd7cb420860535e687f673c0b5c0274e0d2fb67181281d4b85be9197da03d7e"
+SRC_URI[sha256sum] = "f299e6d26d8e142c0b7edeb9b8917d6bd50bc8647254ea585069c68f2bab8e64"
 
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
-- 
2.37.3


