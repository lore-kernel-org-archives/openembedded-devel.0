Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A6BCD128E
	for <webhook@archiver.kernel.org>; Sat, 30 Mar 2024 11:21:56 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.11993.1711797707419784483
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Mar 2024 04:21:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout05.t-online.de (Postfix) with SMTP id CF9B41749A
	for <openembedded-devel@lists.openembedded.org>; Sat, 30 Mar 2024 12:21:44 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.161.36]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rqWmM-4Go6410; Sat, 30 Mar 2024 12:21:42 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-user-share: remove hardcoded paths
Date: Sat, 30 Mar 2024 12:21:59 +0100
Message-ID: <20240330112159.1837193-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1711797702-81CE4861-3FC89584/0/0 CLEAN NORMAL
X-TOI-MSGID: c0428e42-0ead-434b-8dd1-fe945df4e40d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Mar 2024 11:21:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109686

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gnome-user-share/gnome-user-share_43.0.bb   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_4=
3.0.bb b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_43.0.=
bb
index 3ff8f938a..6fc78dd29 100644
--- a/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_43.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_43.0.bb
@@ -18,7 +18,7 @@ SRCREV =3D "a0e790aa9494db9d1b1f48b4fc0d2f78e112044d"
 S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ??=3D "modules"
-PACKAGECONFIG[httpd] =3D "-Dhttpd=3D/usr/sbin/httpd,,,apache2 mod-dnssd"
-PACKAGECONFIG[modules] =3D "-Dmodules_path=3D/usr/libexec/apache2/module=
s"
+PACKAGECONFIG[httpd] =3D "-Dhttpd=3D${sbindir}/httpd,,,apache2 mod-dnssd=
"
+PACKAGECONFIG[modules] =3D "-Dmodules_path=3D${libexecdir}/apache2/modul=
es"
=20
 FILES:${PN} +=3D "${systemd_user_unitdir}"
--=20
2.44.0


