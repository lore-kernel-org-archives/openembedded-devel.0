Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB1B7CD13DE
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 21:52:17 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.4197.1695073932073999140
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 14:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout06.t-online.de (Postfix) with SMTP id 96E0854F3
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 23:52:09 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.214]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiMA1-3qxV2D0; Mon, 18 Sep 2023 23:52:05 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 13/18] gnome-text-editor: upgrade 44.0 -> 45.0
Date: Mon, 18 Sep 2023 23:51:48 +0200
Message-ID: <20230918215156.1920452-13-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918215156.1920452-1-f_l_k@t-online.de>
References: <20230918215156.1920452-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695073925-46FF85E3-EBF4C571/0/0 CLEAN NORMAL
X-TOI-MSGID: ce61aaab-4ffb-42eb-a8e8-39cbc3393186
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 21:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104937

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-text-editor_44.0.bb =3D> gnome-text-editor_45.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-text-editor/{gnome-text-editor_44.=
0.bb =3D> gnome-text-editor_45.0.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor=
_44.0.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_4=
5.0.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_=
44.0.bb
rename to meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_45=
.0.bb
index 40bcd27d2..52bb92ee9 100644
--- a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_44.0.b=
b
+++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_45.0.b=
b
@@ -19,7 +19,7 @@ inherit gnomebase gtk-icon-cache itstool gnome-help mim=
e-xdg features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-SRC_URI[archive.sha256sum] =3D "f67bc3780734ffa815fcc4c5daa7b555d24e459f=
81ea2b548e6a85c1612a31ca"
+SRC_URI[archive.sha256sum] =3D "47b3fbe4900eb204413d9af3ae8e0ecd06728d2a=
c15d02b1a050d02d47226bc1"
=20
 FILES:${PN} +=3D " \
     ${datadir}/metainfo \
--=20
2.41.0


