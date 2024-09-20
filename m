Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D9ADCF9C42
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 15:08:11 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.20383.1726844889971821058
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 08:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id B78A1DE43
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 17:07:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.23]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1srfET-3JaG0N0; Fri, 20 Sep 2024 17:07:41 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 07/23] gnome-console: update 45.0 -> 47.0
Date: Fri, 20 Sep 2024 17:08:06 +0200
Message-ID: <20240920150822.1131707-7-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920150822.1131707-1-f_l_k@t-online.de>
References: <20240920150822.1131707-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1726844861-8EFFB467-307F017E/0/0 CLEAN NORMAL
X-TOI-MSGID: 1d0bb547-b625-4725-8861-7b81003fe6b8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 15:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112412

Version 47.0
~~~~~~~~~~~~

A edge case in drag-and-drop has been resolved, and Aleksandr Melman fixe=
d a
string that hadn't been marked for translation.

Updated Translations
 * Belarusian  (Vasil Pupkin)
 * British English  (Andi Chandler)
 * Bulgarian  (Alexander Shopov)
 * Catalan  (Jordi Mas i Hernandez)
 * Chinese (China)  (Luming Zh)
 * Czech  (Daniel Rusek)
 * Danish  (Ask Hjorth Larsen)
 * Galician  (Fran Dieguez)
 * Georgian  (Ekaterine Papava)
 * Greek  (Efstathios Iosifidis)
 * Hebrew  (Yaron Shahrabani)
 * Hungarian  (Bal=C3=A1zs =C3=9Ar)
 * Indonesian  (Andika Triwidada)
 * Lithuanian  (Aurimas =C4=8Cernius)
 * Norwegian Bokm=C3=A5l  (Brage Fuglseth)
 * Persian  (Danial Behzadi)
 * Polish  (Piotr Dr=C4=85g)
 * Portuguese  (Hugo Carvalho)
 * Russian  (Artur S0)
 * Slovak  (Jose Riha)
 * Slovenian  (Martin)
 * Spanish  (Daniel Mustieles)
 * Swedish  (Anders Jonsson)
 * Ukrainian  (Yuri Chornoivan)

Version 47.rc
~~~~~~~~~~~~~~~

Thanks to feedback from beta users, a couple small improvements were made=
.

Updated Translations
 * Basque  (Asier Sarasua Garmendia)
 * Belarusian  (Vasil Pupkin)
 * Brazilian Portuguese  (Juliano de Souza Camargo)
 * Bulgarian  (Alexander Shopov)
 * Catalan  (poc senderi)
 * Chinese (China)  (Luming Zh)
 * Czech  (Daniel Rusek)
 * Finnish  (Jiri Gr=C3=B6nroos)
 * Georgian  (Ekaterine Papava)
 * German  (J=C3=BCrgen Benvenuti)
 * Hindi  (Scrambled 777)
 * Hungarian  (Bal=C3=A1zs =C3=9Ar)
 * Kazakh  (Baurzhan Muftakhidinov)
 * Korean  (DaeHyun Sung)
 * Norwegian Bokm=C3=A5l  (Brage Fuglseth)
 * Occitan  (Quentin PAG=C3=88S)
 * Persian  (Danial Behzadi)
 * Portuguese  (Hugo Carvalho)
 * Romanian  (Daniel =C8=98erb=C4=83nescu, Florentina Mu=C8=99at)
 * Russian  (Artur S0)
 * Turkish  (Emin Tufan =C3=87etin, Sabri =C3=9Cnal)
 * Ukrainian  (Yuri Chornoivan)

Version 47.beta
~~~~~~~~~~~~~~~

The preferences dialogue has been expanded to include scrollback size, an=
d
there has been behind the scenes work fixing some pesky issues and settin=
g
up future improvements.

Thanks to work elsewhere in the stack, we now have restored screen reader
support. This has taken far too long, and there is more work do be done, =
but
hopefully this is a significant step forward.

Additionally Alice reworked our styles to take advantage of improvements =
in
Gtk, whilst Chris helped us keep current with developments in Adwaita, an=
d
Ball=C3=B3 Gy=C3=B6rgy provided some fixes.

Updated Translations
 * Brazilian Portuguese  (Juliano de Souza Camargo)
 * Greek  (Efstathios Iosifidis)
 * Hebrew  (Yosef Or Boczko)
 * Hindi  (Guntupalli Karunakar, Scrambled 777)
 * Kabyle  (Rachida SACI)
 * Nepali  (Pawan Chitrakar)
 * Occitan  (Quentin PAG=C3=88S)
 * Portuguese  (Hugo Carvalho)
 * Romanian  (Daniel =C8=98erb=C4=83nescu)
 * Serbian  (Du=C5=A1an Simi=C4=87)
 * Serbian (Latin)  (=D0=9C=D0=B8=D0=BB=D0=BE=D1=88 =D0=9F=D0=BE=D0=BF=D0=
=BE=D0=B2=D0=B8=D1=9B)
 * Slovak  (Matej Mrenica)
 * Slovenian  (Martin)
 * Turkish  (Sabri =C3=9Cnal)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-console_45.0.bb =3D> gnome-console_47.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-console/{gnome-console_45.0.bb =3D=
> gnome-console_47.0.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb=
 b/meta-gnome/recipes-gnome/gnome-console/gnome-console_47.0.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb
rename to meta-gnome/recipes-gnome/gnome-console/gnome-console_47.0.bb
index d03b5fe04..922b0576e 100644
--- a/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-console/gnome-console_47.0.bb
@@ -18,7 +18,7 @@ DEPENDS =3D " \
     vte \
 "
=20
-SRC_URI[archive.sha256sum] =3D "e7462128d2df2324a1d748062c40429cd0504af0=
9e407067b33f3a9d0c59c8e1"
+SRC_URI[archive.sha256sum] =3D "487ec0de0a24f12ef6f778e4aee98d744a9dcc92=
1c9e7df98b2d9f410b00ef52"
=20
 PACKAGECONFIG ?=3D ""
 PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse"
--=20
2.46.0


