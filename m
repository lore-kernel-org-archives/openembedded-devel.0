Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1173AC77B73
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 09:01:00 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.4340.1686042051413203333
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jun 2023 02:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout07.t-online.de (Postfix) with SMTP id 88FC744E2B
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Jun 2023 11:00:34 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.154.173.9]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1q6SYJ-1OO6cM0; Tue, 6 Jun 2023 11:00:31 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 2/3] mutter: upgrade 44.1 -> 44.2
Date: Tue,  6 Jun 2023 11:00:12 +0200
Message-Id: <20230606090013.1455222-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606090013.1455222-1-f_l_k@t-online.de>
References: <20230606090013.1455222-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686042031-FBFE8283-76540846/0/0 CLEAN NORMAL
X-TOI-MSGID: fbb9bf3e-e5d3-493d-bb5f-adf2deb8827b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 09:01:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103136

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/mutter/{mutter_44.1.bb =3D> mutter_44.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_44.1.bb =3D> mutter_44.2.=
bb} (97%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_44.1.bb b/meta-gnome/=
recipes-gnome/mutter/mutter_44.2.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/mutter/mutter_44.1.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_44.2.bb
index 1060e916a..9c25eda6f 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_44.1.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_44.2.bb
@@ -25,7 +25,7 @@ GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gsettings gobject-introspection gettext features_check
=20
-SRC_URI[archive.sha256sum] =3D "973aeafab42f06f934a0994fc84878958cdb4d27=
66a4c867a5ccdc547dd57056"
+SRC_URI[archive.sha256sum] =3D "37566d7e55c93dc8894e9c7f23a7ba5879a8b30b=
af65558223009d2b467402a1"
=20
 # x11 is still manadatory - see meson.build
 REQUIRED_DISTRO_FEATURES =3D "wayland x11 polkit"
--=20
2.34.1


