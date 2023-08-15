Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB16C0015E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 17:16:53 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.140141.1692119805853684794
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 10:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout05.t-online.de (Postfix) with SMTP id 89B0D10EF7
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Aug 2023 19:16:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.225.50]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qVxeq-3zFRRJ0; Tue, 15 Aug 2023 19:16:40 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] nautilus: fix api-documentation build
Date: Tue, 15 Aug 2023 19:16:34 +0200
Message-ID: <20230815171634.2975886-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1692119800-998269C6-3B2A81F5/0/0 CLEAN NORMAL
X-TOI-MSGID: 0ea7943f-d04f-419e-8086-e85099488cdc
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Aug 2023 17:16:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104365

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/nautilus/nautilus_44.2.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_44.2.1.bb b/meta-=
gnome/recipes-gnome/nautilus/nautilus_44.2.1.bb
index 362629fce0..f181822b1a 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_44.2.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_44.2.1.bb
@@ -21,7 +21,7 @@ DEPENDS =3D " \
     tracker \
 "
=20
-inherit gnomebase gsettings gobject-introspection gtk-doc gettext featur=
es_check mime-xdg gtk-icon-cache
+inherit gnomebase gsettings gobject-introspection gi-docgen gettext feat=
ures_check mime-xdg gtk-icon-cache
=20
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
@@ -31,6 +31,10 @@ SRC_URI[archive.sha256sum] =3D "d9c62f024727f7a76fc6a5=
da788a2b0247df01a71c2a601143
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl gobject-introspection-data"
=20
+GIDOCGEN_MESON_OPTION =3D "docs"
+GIDOCGEN_MESON_ENABLE_FLAG =3D 'true'
+GIDOCGEN_MESON_DISABLE_FLAG =3D 'false'
+
 EXTRA_OEMESON +=3D " \
     -Dtests=3Dnone \
 "
--=20
2.41.0


