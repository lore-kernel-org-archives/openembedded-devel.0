Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88780C4167D
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:33:32 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.5417.1699083208369144373
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout10.t-online.de (Postfix) with SMTP id 7B55733075
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Nov 2023 08:33:26 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.35.165]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qzB9p-1L3at80; Sat, 4 Nov 2023 08:33:25 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/5] gnome-text-editor: Upgrade 45.0 -> 45.1
Date: Sat,  4 Nov 2023 08:33:45 +0100
Message-ID: <20231104073348.132975-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231104073348.132975-1-f_l_k@t-online.de>
References: <20231104073348.132975-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1699083205-CF573E93-ED0AF97D/0/0 CLEAN NORMAL
X-TOI-MSGID: 345c7010-e7f7-4eaf-831a-6c7780aa3eb7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:33:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106350

 =E2=80=A2 Use proper etag when comparing document for changes after a Sa=
ve As
   operation occurs.
 =E2=80=A2 Fix row styling in preferences.
 =E2=80=A2 Fix memory leak of GtkNativeDialog.
 =E2=80=A2 Translation updates.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-text-editor_45.0.bb =3D> gnome-text-editor_45.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-text-editor/{gnome-text-editor_45.=
0.bb =3D> gnome-text-editor_45.1.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor=
_45.0.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_4=
5.1.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_=
45.0.bb
rename to meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_45=
.1.bb
index 52bb92ee9..c1e8f3a99 100644
--- a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_45.0.b=
b
+++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_45.1.b=
b
@@ -19,7 +19,7 @@ inherit gnomebase gtk-icon-cache itstool gnome-help mim=
e-xdg features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-SRC_URI[archive.sha256sum] =3D "47b3fbe4900eb204413d9af3ae8e0ecd06728d2a=
c15d02b1a050d02d47226bc1"
+SRC_URI[archive.sha256sum] =3D "6a86ec9920f466b6ed92695524d3b507b1e84272=
dafa5341d06a157de868af71"
=20
 FILES:${PN} +=3D " \
     ${datadir}/metainfo \
--=20
2.42.0


