Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5862AC77B71
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 08:03:20 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.17400.1679731393528631899
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 01:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id 2A4E71B9FF
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:03:12 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfyrm-0RoPhQ0; Sat, 25 Mar 2023 09:03:10 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 08/32] gnome-calendar: update 43.1 -> 44.0
Date: Sat, 25 Mar 2023 09:02:32 +0100
Message-Id: <20230325080256.923752-8-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325080256.923752-1-f_l_k@t-online.de>
References: <20230325080256.923752-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679731390-8556AC08-D37FCE93/0/0 CLEAN NORMAL
X-TOI-MSGID: 6ad66730-e8b6-4d22-9ede-bb46773be79e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 08:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101718

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-calendar_43.1.bb =3D> gnome-calendar_44.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-calendar/{gnome-calendar_43.1.bb =3D=
> gnome-calendar_44.0.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_43.1.=
bb b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_44.0.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_43.1.b=
b
rename to meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_44.0.bb
index 06e06e9bd..dcf5ba7d6 100644
--- a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_43.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_44.0.bb
@@ -23,7 +23,7 @@ inherit gnomebase gsettings gtk-icon-cache gettext feat=
ures_check upstream-versi
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
=20
-SRC_URI[archive.sha256sum] =3D "afa5fc66e2f691553cc7d517db2363cff2d62cd1=
b5df455e5f4f7133139d21f2"
+SRC_URI[archive.sha256sum] =3D "96acd74cbf45652934515cc3447a3b895e933f86=
324ca92436f67ddd63c3a802"
=20
 FILES:${PN} +=3D " \
     ${datadir}/gnome-shell \
--=20
2.34.1


