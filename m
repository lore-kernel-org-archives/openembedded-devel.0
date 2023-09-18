Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD28CD3427
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 21:52:18 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.4036.1695073932219564744
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 14:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout06.t-online.de (Postfix) with SMTP id 9CB4C54FA
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 23:52:09 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.214]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiMA1-3qxV2G0; Mon, 18 Sep 2023 23:52:06 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 16/18] zenity: upgrade 3.44.0 -> 3.44.2
Date: Mon, 18 Sep 2023 23:51:51 +0200
Message-ID: <20230918215156.1920452-16-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918215156.1920452-1-f_l_k@t-online.de>
References: <20230918215156.1920452-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695073926-44FF45E3-75368ED6/0/0 CLEAN NORMAL
X-TOI-MSGID: 95cb2035-e2d8-460e-b64e-ed620518a847
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 21:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104941

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/zenity/{zenity_3.44.0.bb =3D> zenity_3.44.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/zenity/{zenity_3.44.0.bb =3D> zenity_3.4=
4.2.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/zenity/zenity_3.44.0.bb b/meta-gnom=
e/recipes-gnome/zenity/zenity_3.44.2.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/zenity/zenity_3.44.0.bb
rename to meta-gnome/recipes-gnome/zenity/zenity_3.44.2.bb
index 3548cc5bb..a152e6405 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_3.44.0.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_3.44.2.bb
@@ -16,7 +16,7 @@ DEPENDS =3D " \
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
-SRC_URI[archive.sha256sum] =3D "c15582301ed90b9d42ce521dbccf99a989f22f12=
041bdd5279c6636da99ebf65"
+SRC_URI[archive.sha256sum] =3D "3fb5b8b1044d3d129262d3c54cf220eb7f76bc21=
bd5ac6d96ec115cd3518300e"
 SRC_URI +=3D "file://0001-Harcode-shebang-to-avoid-pointing-to-build-sys=
tem-s-.patch"
=20
 PACKAGECONFIG ?=3D "webkitgtk"
--=20
2.41.0


