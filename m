Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA50C4167B
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 14:59:25 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.11012.1699109957963639722
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 07:59:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout07.t-online.de (Postfix) with SMTP id B964C52617
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Nov 2023 15:59:15 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.35.165]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qzI7G-00YN740; Sat, 4 Nov 2023 15:59:15 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/3] libgweather4: Upgrade 4.2.0 -> 4.4.0
Date: Sat,  4 Nov 2023 15:59:31 +0100
Message-ID: <20231104145932.128150-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231104145932.128150-1-f_l_k@t-online.de>
References: <20231104145932.128150-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1699109955-58FF2ED2-32F34870/0/0 CLEAN NORMAL
X-TOI-MSGID: 84185eb2-ebbe-4fc0-93fe-b1f600db3ae7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 14:59:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106371

GWeather 4.4.0 (stable)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- nws: fix null string comparison when reading visibility [!282]
- Translation updates
- Location database changes
  - Adds Cities from Ukraines Zaporizhzhia Oblast [!276]

GWeather 4.3.2 (development)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D

- Fix fallback metric unit detection logic [!231]
- Documentation fixes [!229]
- Performance improvements for nearest location lookups [!271]
- Location database changes
  - Add Ulsan city and Ulsan Airport [!218]
  - Add Koblenz and Mainz (Germany) [!184]
  - Add S=C3=A3o Bento do Sul, Brazil [!220]
  - Add Ryazan' city [!224]
  - Add Freiburg and Heidelberg in Germany [!225]
  - Add Nottingham, UK [!268]
  - Add cities and airports in Argentina [!270]
  - Add Bracknell, United Kingdom [!249]
  - Update Romanian cities [!255]
  - Add cities in Rwanda [!260]
  - Add Mahilyow, Belarus [!250]
  - Add Aachen (North Rhine-Westphalia, Germany) [!246]
  - Add airports, structure of regions and biggest regional cities of Ukr=
aine
[!242]
  - Add Osh City (Kyrgyzstan) [!190]
  - Add city Caravaca de la Cruz [!237]
  - Add a new Argentinian city, Bah=C3=ADa Blanca [!177]
  - Fix timezone for Denpasar [#209]
  - Fix spelling of Siem Reap [#199]
  - Add Rio Grande in Brazil [!226]
  - Add major cities of Japan [!267]
  - Add some cities in Germany [!266]
- Translation updates

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{libgweather4_4.2.0.bb =3D> libgweather4_4.4.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libgweather/{libgweather4_4.2.0.bb =3D> =
libgweather4_4.4.0.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.2.0.bb b=
/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb
similarity index 87%
rename from meta-gnome/recipes-gnome/libgweather/libgweather4_4.2.0.bb
rename to meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb
index f2ffcfdd7..81ae8317d 100644
--- a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.2.0.bb
+++ b/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb
@@ -12,7 +12,7 @@ inherit gnomebase gsettings gobject-introspection gette=
xt gi-docgen vala feature
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
 SRC_URI +=3D "file://0001-Allow-building-gir-in-cross-environments.patch=
"
-SRC_URI[archive.sha256sum] =3D "af8a812da0d8976a000e1d62572c256086a81732=
3fbf35b066dbfdd8d2ca6203"
+SRC_URI[archive.sha256sum] =3D "366e866ff2a708b894cfea9475b8e8ff54cb3e2b=
477ea72a8ade0dabee5f48a4"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
--=20
2.42.0


