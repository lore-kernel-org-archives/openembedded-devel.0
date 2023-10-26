Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6135DC25B70
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 09:09:55 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.195841.1698311394429470245
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 02:09:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout02.t-online.de (Postfix) with SMTP id 87AAA226E0
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 11:09:52 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.32.112]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qvwNC-3EEu4R0; Thu, 26 Oct 2023 11:09:50 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/3] gnome-disk-utility: Update 44.0 -> 45.0
Date: Thu, 26 Oct 2023 11:09:59 +0200
Message-ID: <20231026090959.764445-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231026090959.764445-1-f_l_k@t-online.de>
References: <20231026090959.764445-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1698311390-3FFFCEA2-85EDE057/0/0 CLEAN NORMAL
X-TOI-MSGID: 7c8932d7-f4b4-4f96-8414-e25e1824149d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 09:09:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105734

45.0 - September 10, 2023
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Luk=C3=A1=C5=A1 Tyrychtr:
 * benchmark-dialog: Silence two maybe-uninitialized warnings

Updated translations:
 * Alexander Shopov (bg), Amn Alam (pa), Baurzhan Muftakhidinov (kk),
   Boyuan Yang (zh_CN), Bruce Cowan (en_GB), Danial Behzadi (fa), Efstath=
ios
   Iosifidis (el), Gianvito Cavasoli (it), Ir=C3=A9n=C3=A9e THIRION (fr),=
 Le=C3=B4nidas
   Ara=C3=BAjo (pt_BR), Nathan Follens (nl), R=C5=ABdolfs Mazurs (lv), Sa=
bri =C3=9Cnal
   (tr), Vasil Pupkin (be)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-disk-utility_44.0.bb =3D> gnome-disk-utility_45.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-disk-utility/{gnome-disk-utility_4=
4.0.bb =3D> gnome-disk-utility_45.0.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_44.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_45.0.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utilit=
y_44.0.bb
rename to meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_=
45.0.bb
index d8674fca2..7cae5dbcc 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_44.0=
.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_45.0=
.bb
@@ -30,7 +30,7 @@ PACKAGECONFIG[systemd] =3D "-Dlogind=3Dlibsystemd,-Dlog=
ind=3Dnone,systemd"
 PACKAGECONFIG[x11] =3D ",,libcanberra"
=20
 SRC_URI:append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', =
'file://0001-gnome-disk-utility-remove-libcanberra-dependency.patch', '',=
 d)}"
-SRC_URI[archive.sha256sum] =3D "02031097896cdb37d8717a5823f93e3723d4dfce=
7fdc4002c9dfcb16b7e7a3ef"
+SRC_URI[archive.sha256sum] =3D "3d8625faa99047bc4aefd29921ad728ab4d700cf=
f86e0f2ec67e8dba877d0dd3"
=20
 EXTRA_OEMESON =3D "-Dman=3Dfalse"
=20
--=20
2.42.0


