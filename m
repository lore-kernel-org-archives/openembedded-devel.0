Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD1AC3DA7D
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 10:59:02 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.16054.1672397939588711331
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Dec 2022 02:58:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout11.t-online.de (Postfix) with SMTP id 979FBD74F
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 11:58:57 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.234.94]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pBD6F-4cGBd50; Fri, 30 Dec 2022 11:58:55 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 3/5] gnome-panel: update 3.44.0 -> 3.47.1
Date: Fri, 30 Dec 2022 11:58:42 +0100
Message-Id: <20221230105844.428064-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230105844.428064-1-f_l_k@t-online.de>
References: <20221230105844.428064-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672397935-3AFEA81E-A4BDBA75/0/0 CLEAN NORMAL
X-TOI-MSGID: fd9ff627-f088-428a-bfdd-1455e9b30482
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 10:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100307

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-panel_3.44.0.bb =3D> gnome-panel_3.47.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-panel/{gnome-panel_3.44.0.bb =3D> =
gnome-panel_3.47.1.bb} (67%)

diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.44.0.bb b=
/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.47.1.bb
similarity index 67%
rename from meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.44.0.bb
rename to meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.47.1.bb
index 67bdf58f8..8380c51ed 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.44.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.47.1.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "GNOME flashback panel"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
-inherit gnomebase gsettings itstool gnome-help gtk-icon-cache gtk-doc ge=
ttext upstream-version-is-even features_check
+inherit gnomebase gsettings itstool gnome-help gtk-icon-cache gettext up=
stream-version-is-even features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam"
=20
@@ -17,7 +17,7 @@ DEPENDS +=3D " \
     gdm \
 "
=20
-SRC_URI[archive.sha256sum] =3D "99655f75d031876c130ed23c4da22c099e7bcc40=
48b0255a3c3a3bbc787b31aa"
+SRC_URI[archive.sha256sum] =3D "d8f6e2c659668c77df82c3dd95ba04fcef8c40c2=
28e2c22605f9a17a9161ec83"
=20
 PACKAGECONFIG[eds] =3D "--enable-eds,--disable-eds,evolution-data-server=
"
=20
--=20
2.34.1


