Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B0AC41513
	for <webhook@archiver.kernel.org>; Sat, 11 May 2024 07:58:25 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.10439.1715414297091359269
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 May 2024 00:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout09.t-online.de (Postfix) with SMTP id 5910515C96
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 May 2024 09:58:15 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.160.148]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s5hcU-1NX2B70; Sat, 11 May 2024 09:58:14 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/3] evince: update 46.0 -> 46.1
Date: Sat, 11 May 2024 09:58:40 +0200
Message-ID: <20240511075842.480843-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1715414294-437FDD34-C74302D0/0/0 CLEAN NORMAL
X-TOI-MSGID: 3b4862bc-aba0-40c1-9892-f7e6cefc0166
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 May 2024 07:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110310

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Evince   46.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

data:
  * Improve url locations (Germ=C3=A1n Poo-Caama=C3=B1o)

help:
  * Replace live.gnome.org with wiki.gnome.org (Andre Klapper)

Developers:
  * Andre Klapper, Germ=C3=A1n Poo-Caama=C3=B1o

Translations:
  * Changwoo Ryu (Korean)
  * Seong-ho Cho (Korean)
  * Piotr Dr=C4=85g (Polish)
  * Anders Jonsson (Swedish)
  * Yuri Chornoivan (Ukrainian)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/evince/{evince_46.0.bb =3D> evince_46.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/evince/{evince_46.0.bb =3D> evince_46.1.=
bb} (95%)

diff --git a/meta-gnome/recipes-gnome/evince/evince_46.0.bb b/meta-gnome/=
recipes-gnome/evince/evince_46.1.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/evince/evince_46.0.bb
rename to meta-gnome/recipes-gnome/evince/evince_46.1.bb
index 291d32584..5077cfc20 100644
--- a/meta-gnome/recipes-gnome/evince/evince_46.0.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_46.1.bb
@@ -33,7 +33,7 @@ REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('DIS=
TRO_FEATURES', 'x11', 'open
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
=20
-SRC_URI[archive.sha256sum] =3D "aff6af69392c04956bfad976dec5d1583b41d5a3=
34e937995f7c3ca0740de221"
+SRC_URI[archive.sha256sum] =3D "94bb525365b060a28c2f6017d22cbf2af5115507=
254aa42e9bfc000bbc18ab62"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
--=20
2.44.0


