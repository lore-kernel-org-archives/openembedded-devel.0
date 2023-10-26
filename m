Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8663DC25B6B
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 09:20:05 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.66409.1698311997607353641
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 02:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout11.t-online.de (Postfix) with SMTP id 024476A18
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 11:19:56 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.32.112]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qvwWv-10e7og0; Thu, 26 Oct 2023 11:19:53 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] eog: Update 45.0 -> 45.1
Date: Thu, 26 Oct 2023 11:20:07 +0200
Message-ID: <20231026092007.791879-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231026092007.791879-1-f_l_k@t-online.de>
References: <20231026092007.791879-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1698311993-C4BE0DAC-78BC28FA/0/0 CLEAN NORMAL
X-TOI-MSGID: 7e4dcbc5-8dd5-454b-8e01-cf30b9463489
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 09:20:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105738

Version 45.1
------------

Bug fixes and improvements:

 #300, Statusbar image position incorrect (Felix Riemann)

New and updated translations:

- Sabri =C3=9Cnal [tr]

New and updated manual translations

- Bal=C3=A1zs =C3=9Ar [hu]
- Ser82-png [ru]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/eog/{eog_45.0.bb =3D> eog_45.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/eog/{eog_45.0.bb =3D> eog_45.1.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/eog/eog_45.0.bb b/meta-gnome/recipe=
s-gnome/eog/eog_45.1.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/eog/eog_45.0.bb
rename to meta-gnome/recipes-gnome/eog/eog_45.1.bb
index eb3d07ce1..41bd5d882 100644
--- a/meta-gnome/recipes-gnome/eog/eog_45.0.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_45.1.bb
@@ -22,7 +22,7 @@ inherit gnomebase pkgconfig gsettings gobject-introspec=
tion gettext mime-xdg fea
 # FIXME: whilst eog uses libpeas <2, g-i is needed. This can be removed =
when libpeas2 is used.
 REQUIRED_DISTRO_FEATURES =3D "opengl gobject-introspection-data"
=20
-SRC_URI[archive.sha256sum] =3D "05cb2c9a66ba15870f47358cd4c1ce670f17e4c8=
b22e050d627d728ff88b57ba"
+SRC_URI[archive.sha256sum] =3D "c17f86704c722b36c01a168f1e51439be0bb279f=
2c6646f48b66e9d0f3a24cd2"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
--=20
2.42.0


