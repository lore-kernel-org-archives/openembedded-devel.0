Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D157AC4707B
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 15:14:26 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.82410.1705330803006882446
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jan 2024 07:00:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZOuW7uAo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0539360008;
	Mon, 15 Jan 2024 15:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705330801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZCMFmdOkOTWJaetjbSIb6SM7/9OfG6jm469P7gOu4lU=;
	b=ZOuW7uAo96p42nhXeaBtANvoszTRKIhxKlCPmvE4tNFgVZO9Yy12H+RXVBQhxGpdS9ziLi
	Pjh1GKI/Eh13SlVf1ObAGeQLdOKER9FSay28CqU78vQY7B4RbvH+YXuooRXOdDIIYs+N0G
	A6w5IHeWj5g9YKDZi2FW7EpboWVKSwO5BZKzbKUo2xeDd2A0ZomsjeOenDURa99Gu0ih/U
	Swmnu5W45z/utp9NWn/UOnhzy/+2mxysMxuGI7afE9+ovpXxGQei+QpzQdWcelBnFAxaNA
	pLyYZpv2E71nJxIMjtVXrblkCrYD9z/B5xk9ZlaLlw3iFx2mEqtfXQ6cLTVXPw==
From: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	thomas.petazzoni@bootlin.com,
	alexandre.belloni@bootlin.com,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [meta-gnome] [dunfell] [PATCH v1] gdm: Add polkit to required distro features
Date: Mon, 15 Jan 2024 15:59:45 +0100
Message-ID: <20240115145945.2168539-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: joaomarcos.costa@bootlin.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 15:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108290

From: Khem Raj <raj.khem@gmail.com>

it depends on accountservice package which already needs this
DISTRO_FEATURE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

Backported from Honister
(cherry-picked from commit e7251cf6ba5a61e09a02e4c7f5774498ef6c0916)
---
 meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb b/meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb
index a47bf6fcf..b10efbedc 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb
@@ -10,7 +10,7 @@ DEPENDS = " \
     libpam \
 "
 
-REQUIRED_DISTRO_FEATURES = "x11 systemd pam"
+REQUIRED_DISTRO_FEATURES = "x11 systemd pam polkit"
 
 inherit gnomebase gsettings gobject-introspection gettext systemd useradd upstream-version-is-even features_check
 
-- 
2.43.0


