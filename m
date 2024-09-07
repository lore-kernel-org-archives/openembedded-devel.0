Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B1DE6FE4D
	for <webhook@archiver.kernel.org>; Sat,  7 Sep 2024 06:33:06 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.2756.1725690779635389198
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Sep 2024 23:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout08.t-online.de (Postfix) with SMTP id BE89C22267
	for <openembedded-devel@lists.openembedded.org>; Sat,  7 Sep 2024 08:32:57 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.32.86]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1smp0D-25ndK50; Sat, 7 Sep 2024 08:32:57 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] libspelling: add recipe
Date: Sat,  7 Sep 2024 08:34:39 +0200
Message-ID: <20240907063439.110570-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1725690777-84FEF5A6-1646F74D/0/0 CLEAN NORMAL
X-TOI-MSGID: 69018923-4c6d-450d-af36-77f345920b70
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Sep 2024 06:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112111

The gnome spellcheck library for gtk4

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/libspelling/libspelling_0.2.1.bb  | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/libspelling/libspelling_0.2.=
1.bb

diff --git a/meta-gnome/recipes-gnome/libspelling/libspelling_0.2.1.bb b/=
meta-gnome/recipes-gnome/libspelling/libspelling_0.2.1.bb
new file mode 100644
index 000000000..f5f8a3321
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libspelling/libspelling_0.2.1.bb
@@ -0,0 +1,13 @@
+SUMMARY =3D "A spellcheck library for GTK 4"
+HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/libspelling"
+LICENSE =3D "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
+
+DEPENDS =3D "enchant2 gtk4 gtksourceview5 icu"
+
+inherit gnomebase pkgconfig gettext gi-docgen vala gobject-introspection
+
+GIR_MESON_OPTION =3D ''
+GIDOCGEN_MESON_OPTION =3D 'docs'
+
+SRC_URI[archive.sha256sum] =3D "7a787b467bd493f6baffb44138dbc4bef78aaab6=
0efb76a7db88b243bf0f6343"
--=20
2.46.0


