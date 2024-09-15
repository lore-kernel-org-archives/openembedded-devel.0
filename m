Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511C6C3ABA0
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 15:13:23 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.116429.1726413194491185294
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Sep 2024 08:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout09.t-online.de (Postfix) with SMTP id E0BDA22215
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 17:13:11 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.169.165]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1spqw3-3nL77h0; Sun, 15 Sep 2024 17:13:11 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-disk-utility: update 46.0 -> 46.1
Date: Sun, 15 Sep 2024 17:14:55 +0200
Message-ID: <20240915151455.74739-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1726413191-2AFFB5EE-24D57161/0/0 CLEAN NORMAL
X-TOI-MSGID: 6d4e5e02-c2b0-4b2d-9571-4e69fe1e9b64
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 15:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112299

46.1 - September 03, 2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Alexandre Franke:
 * metainfo: fix URLs
 * metainfo: replace screenshots

Athmane MOKRAOUI:
 * Add Kabyle translation

Updated translations:
 * Alexandre Franke (fr), Anders Jonsson (sv), Andi Chandler (en_GB),
   Andika Triwidada (id), Artur S0 (ru), Asier Sarasua Garmendia (eu),
   Athmane MOKRAOUI (kab), Aurimas =C4=8Cernius (lt), Bal=C3=A1zs =C3=9Ar=
 (hu), Boyuan
   Yang (zh_CN), Danial Behzadi (fa), Daniel Rusek (cs), Daniel =C8=98erb=
=C4=83nescu
   (ro), Efstathios Iosifidis (el), Ekaterine Papava (ka), Guntupalli
   Karunakar (hi), Hugo Carvalho (pt), Jordi Mas i Hernandez (ca), Julian=
o de
   Souza Camargo (pt_BR), J=C3=BCrgen Benvenuti (de), Martin (sl), Matej =
Mrenica
   (sk), Piotr Dr=C4=85g (pl), Rachida SACI (kab), Sabri =C3=9Cnal (tr), =
Seong-ho Cho
   (ko), Vasil Pupkin (be), Vincent Chatelain (fr), Yaron Shahrabani (he)=
,
   Yuri Chornoivan (uk)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-disk-utility_46.0.bb =3D> gnome-disk-utility_46.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-disk-utility/{gnome-disk-utility_4=
6.0.bb =3D> gnome-disk-utility_46.1.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_46.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_46.1.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utilit=
y_46.0.bb
rename to meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_=
46.1.bb
index e4998f627..6f910c4c1 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.0=
.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1=
.bb
@@ -29,7 +29,7 @@ PACKAGECONFIG[systemd] =3D "-Dlogind=3Dlibsystemd,-Dlog=
ind=3Dnone,systemd"
 PACKAGECONFIG[x11] =3D ",,libcanberra"
=20
 SRC_URI:append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', =
'file://0001-gnome-disk-utility-remove-libcanberra-dependency.patch', '',=
 d)}"
-SRC_URI[archive.sha256sum] =3D "464649148c6d6771f1ac2ebfe43a4e519205b11c=
2d914a09f2a001821d06957d"
+SRC_URI[archive.sha256sum] =3D "c24e9439a04d70bcfae349ca134c7005435fe2b6=
f452114df878bff0b89bbffe"
=20
 EXTRA_OEMESON =3D "-Dman=3Dfalse"
=20
--=20
2.46.0


