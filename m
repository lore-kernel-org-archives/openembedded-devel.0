Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CFBC982C2
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:40 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18085.1789458275937181696
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=KSyu2pv8;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout01.t-online.de (Postfix) with SMTP id C85671C4F6
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:44:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Nps-00ds680; Tue, 15 Sep 2026 09:44:12 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 29/31] xdg-desktop-portal-gnome: upgrade 50.0 -> 51.0
Date: Tue, 15 Sep 2026 09:43:45 +0200
Message-ID: <20260915074347.6003-29-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915074347.6003-1-f_l_k@t-online.de>
References: <20260915074347.6003-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789458252-117F19B9-C79C5BC8/0/0 CLEAN NORMAL
X-TOI-MSGID: 56d478eb-73f7-4923-8953-4b572f817919
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458260; i=f_l_k@t-online.de;
	bh=waxFlprOYLjP5p4rMNYq+CJVuc3rDh6AI/TAg9Ey4iU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=KSyu2pv8zkjlUWJ6HxTwLiyl3gIjs6oKOBdviMQdhRTBU/skBke/rCEeX3215rvXJ
	 qK8bBS7iLVaO2hIpXuCtb2Hg5WgdFAFMqmyoI9xaw/Nw0apZUeNzJvgg3I2dGkeHOi
	 jTgePlyvNTw7xGyuWKL27FkmxbXjAkWmcEAW0B37HQdEP9M6P1W5038Gb47YwUTgPZ
	 ARehgQHjnuo8sgpaM1sPMm90cCZPssAMkIfD1irJA4vkCR2FCkmDm2HOjz88gHdGMK
	 i02xUc4eBU090yp3GNpRkdgnCi11cDM6+sFupR4OS92fgglk1fDRvGs/G4zTK57CpU
	 LTz2U7Eq6lhwQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130064

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...op-portal-gnome_50.0.bb =3D> xdg-desktop-portal-gnome_51.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/xdg-desktop-portal/{xdg-desktop-portal=
-gnome_50.0.bb =3D> xdg-desktop-portal-gnome_51.0.bb} (88%)

diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-po=
rtal-gnome_50.0.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-de=
sktop-portal-gnome_51.0.bb
similarity index 88%
rename from meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-por=
tal-gnome_50.0.bb
rename to meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l-gnome_51.0.bb
index f9d52a5bb2..e09c51105b 100644
--- a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_50.0.bb
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_51.0.bb
@@ -21,7 +21,7 @@ inherit gnomebase pkgconfig gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "polkit"
=20
-SRC_URI[archive.sha256sum] =3D "ceeef2fb68b34b3f66a3def0a332a22a70af2726=
41fb6c50065b7a2fde3d5759"
+SRC_URI[archive.sha256sum] =3D "ec228b305091b649c16c690e102aa1d66fc10e98=
34888d51e411913c82c1430d"
=20
 PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}=
"
 PACKAGECONFIG[wayland] =3D ",,wayland-native"
--=20
2.55.0


