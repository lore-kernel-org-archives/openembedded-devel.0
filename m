Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F0FC433F5
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 17:58:52 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web09.1901.1643392731366911510
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 09:58:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20,
 mailfrom: f_l_k@t-online.de)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout08.t-online.de (Postfix) with SMTP id 0233CBFDA
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 18:58:50 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.44.28]) by fwd70.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nDVWL-2LBp210; Fri, 28 Jan 2022 18:58:49 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] folks: dont build tests as they are not installed
 anyway
Date: Fri, 28 Jan 2022 18:58:42 +0100
Message-Id: <20220128175842.5234-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1643392729-00004E7B-4E312ADA/0/0 CLEAN NORMAL
X-TOI-MSGID: e1dc8385-e402-49c5-bbc6-99c341f0cae3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jan 2022 17:58:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95157

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb b/meta=
-gnome/recipes-connectivity/folks/folks_0.15.4.bb
index d331dfdb5..c3c30ca46 100644
--- a/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
+++ b/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
@@ -8,6 +8,7 @@ DEPENDS =3D " \
 "
=20
 GNOMEBASEBUILDCLASS =3D "meson"
+EXTRA_OEMESON +=3D "-Dtests=3Dfalse"
=20
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
@@ -19,9 +20,8 @@ PACKAGECONFIG[ofono] =3D "-Deds_backend=3Dtrue -Dofono_=
backend=3Dtrue,-Dofono_backend=3D
 PACKAGECONFIG[telepathy] =3D "-Dtelepathy_backend=3Dtrue,-Dtelepathy_bac=
kend=3Dfalse,telepathy-glib dbus-glib"
 PACKAGECONFIG[import_tool] =3D "-Dimport_tool=3Dtrue,-Dimport_tool=3Dfal=
se,libxml2"
 PACKAGECONFIG[inspect_tool] =3D "-Dinspect_tool=3Dtrue,-Dinspect_tool=3D=
false"
-PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse,python3-dbusmoc=
k-native"
=20
-PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 't=
ests','', d)}"
+PACKAGECONFIG ??=3D ""
=20
 inherit pkgconfig gnomebase gettext gobject-introspection vala features_=
check
=20
--=20
2.25.1


