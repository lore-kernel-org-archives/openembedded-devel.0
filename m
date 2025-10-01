Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15AECCA470
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 06:23:59 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.9899.1759299837229722167
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 23:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout01.t-online.de (Postfix) with SMTP id E5FC61C6BC
	for <openembedded-devel@lists.openembedded.org>; Wed,  1 Oct 2025 08:23:54 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.168.197]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1v3qFi-1OWM5K0; Wed, 1 Oct 2025 08:23:50 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] folks: add 'telepathy-mission-control' runtime dependency
Date: Wed,  1 Oct 2025 08:23:39 +0200
Message-ID: <20251001062339.74011-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001062339.74011-1-f_l_k@t-online.de>
References: <20251001062339.74011-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1759299830-87FFCA62-2009C3BD/0/0 CLEAN NORMAL
X-TOI-MSGID: 54868b56-cb2a-4c9a-a5c6-ddec2eff312b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:23:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120088

Add 'telepathy-mission-control' as a runtime dependency to the telepathy =
PACKAGECONFIG

This fixes:
*[wrn] 07:44:35.0558 folks:backend-store.vala:435: Error preparing Backen=
d 'telepathy': The name org.freedesktop.Telepathy.AccountManager was not =
provided by any .service files

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-connectivity/folks/folks_0.15.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.9.bb b/meta=
-gnome/recipes-connectivity/folks/folks_0.15.9.bb
index 0c6a39d492..e8f4669ab1 100644
--- a/meta-gnome/recipes-connectivity/folks/folks_0.15.9.bb
+++ b/meta-gnome/recipes-connectivity/folks/folks_0.15.9.bb
@@ -17,7 +17,7 @@ GIR_MESON_OPTION =3D ""
 PACKAGECONFIG[eds] =3D "-Deds_backend=3Dtrue,-Deds_backend=3Dfalse,evolu=
tion-data-server"
 PACKAGECONFIG[bluez] =3D "-Dbluez_backend=3Dtrue,-Dbluez_backend=3Dfalse=
,evolution-data-server"
 PACKAGECONFIG[ofono] =3D "-Deds_backend=3Dtrue -Dofono_backend=3Dtrue,-D=
ofono_backend=3Dfalse,evolution-data-server"
-PACKAGECONFIG[telepathy] =3D "-Dtelepathy_backend=3Dtrue,-Dtelepathy_bac=
kend=3Dfalse,telepathy-glib dbus-glib"
+PACKAGECONFIG[telepathy] =3D "-Dtelepathy_backend=3Dtrue,-Dtelepathy_bac=
kend=3Dfalse,telepathy-glib dbus-glib,telepathy-mission-control"
 PACKAGECONFIG[import_tool] =3D "-Dimport_tool=3Dtrue,-Dimport_tool=3Dfal=
se,libxml2"
 PACKAGECONFIG[inspect_tool] =3D "-Dinspect_tool=3Dtrue,-Dinspect_tool=3D=
false,readline"
=20
--=20
2.51.0


