Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26237C982CE
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:41 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18078.1789458271433288534
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=bSW2JByP;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout01.t-online.de (Postfix) with SMTP id A58501C3B7
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:44:19 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Npp-00ds5h0; Tue, 15 Sep 2026 09:44:09 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 02/31] gnome-remote-desktop: upgrade 50.2 -> 51.0
Date: Tue, 15 Sep 2026 09:43:18 +0200
Message-ID: <20260915074347.6003-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915074347.6003-1-f_l_k@t-online.de>
References: <20260915074347.6003-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789458249-C4FF69B9-83766EA2/0/0 CLEAN NORMAL
X-TOI-MSGID: 323adca8-f3b1-4b7e-8289-cfab8a47e896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458259; i=f_l_k@t-online.de;
	bh=z/P4GK+UWWP+ldPsEM3WtDrx67CKqSStzTCcrtUSFP4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=bSW2JByPOrYoF32C8074s1wvogb42X+QCQFEzvwONnHlQBYd1INdg5AqoZcrYB+RR
	 v3a12gqThtf5J6OTxz8y+I2haQHHcoIKsP/HiYnrUNWjGdK68Ilo9L4W1tKDLgthnN
	 KeFkziv4EV9H2gQ+OK6mGG0UdRrD7R4g3JHLz/nnnuAbceQvRvNmigCaS0Sq4S/zSE
	 Ynnf+q6VRz98fwjWgp2oBd7cQ0xSOwSUVwrY0oB9i9552hhqCQRX3Gvq/IOcLYDULH
	 3LDajScnTtKBM9LpYHfAnsJFz9xb/wLwZ9gH5+SSSQQtLzanL93mcrEFqoCikQ+EZg
	 jHCEtTf6mVJQQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130050

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...nome-remote-desktop_50.2.bb =3D> gnome-remote-desktop_51.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remot=
e-desktop/{gnome-remote-desktop_50.2.bb =3D> gnome-remote-desktop_51.0.bb=
} (94%)

diff --git a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-=
remote-desktop/gnome-remote-desktop_50.2.bb b/meta-gnome/dynamic-layers/m=
eta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_51.0=
.bb
similarity index 94%
rename from meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-r=
emote-desktop/gnome-remote-desktop_50.2.bb
rename to meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-rem=
ote-desktop/gnome-remote-desktop_51.0.bb
index 51076d004c..cf6132fa97 100644
--- a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_50.2.bb
+++ b/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_51.0.bb
@@ -8,7 +8,7 @@ inherit gnomebase pkgconfig gettext gsettings features_ch=
eck useradd
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl polkit"
=20
-SRC_URI[archive.sha256sum] =3D "31df628f4113573f136ffc8dc001763aed633cd8=
5bed21e58bc61f8a17df091f"
+SRC_URI[archive.sha256sum] =3D "c7954b34da5766288ea19b56026421c9c1fe2c23=
ef379e57ec209dc0cf13df2b"
=20
 DEPENDS =3D " \
     asciidoc-native \
--=20
2.55.0


