Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B87CE79A8
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 15:49:38 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.13054.1695138574026095585
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 08:49:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout08.t-online.de (Postfix) with SMTP id 6C6BA25C98
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 17:48:32 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.233.37]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qicxh-26b87t0; Tue, 19 Sep 2023 17:48:29 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gdm: upgrade 44.1 -> 45.0.1
Date: Tue, 19 Sep 2023 17:48:18 +0200
Message-ID: <20230919154818.1649351-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695138510-CD42ECA9-7D531E7E/0/0 CLEAN NORMAL
X-TOI-MSGID: 4b4c2c44-48f3-40a1-ada5-ff81c4136a16
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 15:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105003

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gdm/{gdm_44.1.bb =3D> gdm_45.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gdm/{gdm_44.1.bb =3D> gdm_45.0.1.bb} (90=
%)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_44.1.bb b/meta-gnome/recipe=
s-gnome/gdm/gdm_45.0.1.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/gdm/gdm_44.1.bb
rename to meta-gnome/recipes-gnome/gdm/gdm_45.0.1.bb
index cd9013312..311d28325 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_44.1.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_45.0.1.bb
@@ -20,8 +20,8 @@ GIR_MESON_OPTION =3D ""
 GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gsettings pkgconfig gobject-introspection gettext syst=
emd useradd itstool gnome-help features_check
-
-SRC_URI[archive.sha256sum] =3D "68266b3abe7d28fc469d0067aac9c5dabb0ca795=
2cc1f7c238a04951f3dc5b0d"
+SRC_URI =3D "https://download.gnome.org/sources/gdm/${@oe.utils.trim_ver=
sion("${PV}", 1)}/gdm-${PV}.tar.xz"
+SRC_URI[sha256sum] =3D "6572578c05e3c6569d6ed269f7de2aaf3a035657654586d8=
243907bb7a6ffa85"
=20
 EXTRA_OEMESON =3D " \
     -Dplymouth=3Ddisabled \
--=20
2.42.0


