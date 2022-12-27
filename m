Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C7A1C4708D
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:53:05 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.152491.1672123978705864064
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:52:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout04.t-online.de (Postfix) with SMTP id 10963A6FA
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 07:52:57 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.226.104]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pA3pS-2m9AI60; Tue, 27 Dec 2022 07:52:50 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 2/4] libportal: build libportal-gtk4 and vala support
Date: Tue, 27 Dec 2022 07:52:33 +0100
Message-Id: <20221227065235.95271-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221227065235.95271-1-f_l_k@t-online.de>
References: <20221227065235.95271-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672123970-6B7FA9DD-8E68EC13/0/0 CLEAN NORMAL
X-TOI-MSGID: 0f9d8e36-ca96-412c-8f44-0e8250ef8e35
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:53:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100280

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/libportal/libportal_0.6.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libportal/libportal_0.6.bb b/meta-g=
nome/recipes-gnome/libportal/libportal_0.6.bb
index 9784f0481..9c628c457 100644
--- a/meta-gnome/recipes-gnome/libportal/libportal_0.6.bb
+++ b/meta-gnome/recipes-gnome/libportal/libportal_0.6.bb
@@ -10,10 +10,10 @@ SRC_URI =3D "git://github.com/flatpak/${BPN}.git;prot=
ocol=3Dhttps;branch=3Dmain"
 SRCREV =3D "13df0b887a7eb7b0f9b14069561a41f62e813155"
 S =3D "${WORKDIR}/git"
=20
-inherit meson gtk-doc gobject-introspection features_check
+inherit meson gtk-doc gobject-introspection vala features_check
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
-DEPENDS +=3D "glib-2.0 glib-2.0-native gtk+3"
+DEPENDS +=3D "glib-2.0 glib-2.0-native gtk+3 gtk4"
=20
-EXTRA_OEMESON =3D "-Dbackends=3Dgtk3 -Dvapi=3Dfalse"
+EXTRA_OEMESON =3D "-Dbackends=3Dgtk3,gtk4"
--=20
2.34.1


