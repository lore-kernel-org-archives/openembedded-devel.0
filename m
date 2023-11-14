Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20DDCC4167B
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 09:24:10 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.9142.1699953841591655004
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 01:24:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout03.t-online.de (Postfix) with SMTP id DEA98B8D1
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 10:23:57 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.170.36]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r2peH-1HVKiH0; Tue, 14 Nov 2023 10:23:57 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gtksourceview4: Upgrade 4.8.2 -> 4.8.4
Date: Tue, 14 Nov 2023 10:24:16 +0100
Message-ID: <20231114092417.1842461-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699953837-44FF6979-D00FAB16/0/0 CLEAN NORMAL
X-TOI-MSGID: 91249977-ded7-4b6a-8537-14a6789f2b30
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 09:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106702

News in 4.8.4, 2022-11-03
-------------------------
* Style updates to kate, classic, tango
* Language updates to vala, python3, c, cuda, latex
* Add unit tests for language specs
* Translation updates

News in 4.8.3, 2022-03-18
-------------------------

* Adds support for more Pango font-variants
* Style updates to solarized-dark, solarized-light
* Language updates to lean, rst, c, gtk-doc, javascript, and json
* Translation updates

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gtksourceview4_4.8.2.bb =3D> gtksourceview4_4.8.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview4_4.8.2.bb =3D=
> gtksourceview4_4.8.4.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.=
bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.b=
b
rename to meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
index b10a317fa..6acd00324 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
@@ -16,7 +16,7 @@ inherit gnomebase lib_package gettext features_check gt=
k-doc gobject-introspecti
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 SRC_URI =3D "https://download.gnome.org/sources/gtksourceview/4.8/${PNAM=
E}-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "842de7e5cb52000fd810e4be39cd9fe29ffa87477f15da85=
c18f7b82d45637cc"
+SRC_URI[sha256sum] =3D "7ec9d18fb283d1f84a3a3eff3b7a72b09a10c9c006597b3f=
babbb5958420a87d"
=20
 GIR_MESON_OPTION =3D 'gir'
 GTKDOC_MESON_OPTION =3D "gtk_doc"
--=20
2.42.0


