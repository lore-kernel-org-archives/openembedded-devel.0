Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0189C25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 10:29:21 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.18765.1716892152899146518
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 May 2024 03:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout12.t-online.de (Postfix) with SMTP id A285325517
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 12:29:10 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.40.240]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sBu4r-37vsWX0; Tue, 28 May 2024 12:29:09 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-remote-desktop: update 46.1 -> 46.2
Date: Tue, 28 May 2024 12:29:47 +0200
Message-ID: <20240528102947.2457479-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1716892149-4E7FBD04-03C51B2A/0/0 CLEAN NORMAL
X-TOI-MSGID: b6784d1d-c332-4697-94bf-be99a55d8006
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110587

46.2
=3D=3D=3D=3D
* Potential crasher fix
* Improved disconnection messages
* Broader client compatibility support
* Various security hardening improvements
* CVE-2024-5148 Limit login screen->user session handover access to appro=
priate user

Contributors:
 Pascal Nowack, Ray Strode

Translators:
  Bal=C3=A1zs =C3=9Ar [hu], Efstathios Iosifidis [el], Fabio Tomat [fur],
  Hugo Carvalho [pt], Jordi Mas i Hernandez [ca],
  Juliano de Souza Camargo [pt_BR]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...nome-remote-desktop_46.1.bb =3D> gnome-remote-desktop_46.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remot=
e-desktop/{gnome-remote-desktop_46.1.bb =3D> gnome-remote-desktop_46.2.bb=
} (91%)

diff --git a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-=
remote-desktop/gnome-remote-desktop_46.1.bb b/meta-gnome/dynamic-layers/m=
eta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_46.2=
.bb
similarity index 91%
rename from meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-r=
emote-desktop/gnome-remote-desktop_46.1.bb
rename to meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-rem=
ote-desktop/gnome-remote-desktop_46.2.bb
index 634b37971..f4736b39a 100644
--- a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_46.1.bb
+++ b/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_46.2.bb
@@ -8,7 +8,7 @@ inherit gnomebase gettext gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-SRC_URI[archive.sha256sum] =3D "7c62a4281fdfa9522110affbf75d09973035f2ad=
c7fa4577511d733186beb68f"
+SRC_URI[archive.sha256sum] =3D "97443eaffe4b1a69626886a41d25cbeb2c148d3f=
ed43d92115c1b7d20d5238ab"
=20
 DEPENDS =3D " \
     asciidoc-native \
--=20
2.45.1


