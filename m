Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46EE8C47258
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 18:24:13 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.90783.1705343049371145536
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jan 2024 10:24:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout04.t-online.de (Postfix) with SMTP id 89B5E139A4
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 19:24:06 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.169.126]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rPRcy-2E8KDi0; Mon, 15 Jan 2024 19:24:04 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/4] file-roller: update 43.0 -> 43.1
Date: Mon, 15 Jan 2024 19:23:59 +0100
Message-ID: <20240115182402.126946-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115182402.126946-1-f_l_k@t-online.de>
References: <20240115182402.126946-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1705343044-DF21A917-9E1513AC/0/0 CLEAN NORMAL
X-TOI-MSGID: b59d4269-b965-407f-b349-1fc83bf3354a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 18:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108294

Version 43.1
~~~~~~~~~~~~
Released: 2023-12-03

Bugfixes:
 * Fixed deb package support. (Bastien Nocera) (!14)
 * Fixed wrong filename when opening a files on Google Drive. (Frank Dana=
) (!212)
 * Updated README. (Jan Tojnar)
 * Fixed flapak build. (David Hewitt) (Jan Tojnar)

Translations:
 * Abkhazian (=D0=9D=D0=B0=D0=BD=D0=B1=D0=B0 =D0=9D=D0=B0=D0=B0=D0=BB=D0=B0=
)
 * Belarusian ()
 * Dutch (Nathan Follens)
 * Friulian (Fabio Tomat)
 * Icelandic (Sveinn =C3=AD Felli)
 * IE (OIS)
 * Kazakh (Baurzhan Muftakhidinov)
 * Nepali (Pawan Chitrakar)
 * Slovak (Du=C5=A1an Kazik)
 * Turkish (Sabri =C3=9Cnal)
 * Vietnamese (Tr=E1=BA=A7n Ng=E1=BB=8Dc Qu=C3=A2n)
 * =CE=95=CE=BB=CE=BB=CE=B7=CE=BD=CE=B9=CE=BA=CE=AC (Efstathios Iosifidis=
)
 * =D0=A0=D1=83=D1=81=D1=81=D0=BA=D0=B8=D0=B9 (Aleksandr Melman)
 * Chinese (China) (Boyuan Yang)
 * Galician <Proxecto Trasno (Fran Dieguez)
---
 .../file-roller/{file-roller_43.0.bb =3D> file-roller_43.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/file-roller/{file-roller_43.0.bb =3D> fi=
le-roller_43.1.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_43.0.bb b/m=
eta-gnome/recipes-gnome/file-roller/file-roller_43.1.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/file-roller/file-roller_43.0.bb
rename to meta-gnome/recipes-gnome/file-roller/file-roller_43.1.bb
index ce2b6d95b..0b9dd741f 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_43.0.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_43.1.bb
@@ -20,7 +20,7 @@ REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
 EXTRA_OEMESON +=3D "-Dintrospection=3Denabled"
=20
-SRC_URI[archive.sha256sum] =3D "298729fdbdb9da8132c0bbc60907517d65685b05=
618ae05167335e6484f573a1"
+SRC_URI[archive.sha256sum] =3D "84994023997293beb345d9793db8f5f0bbb41faa=
155c6ffb48328f203957ad08"
=20
 PACKAGECONFIG ??=3D ""
=20
--=20
2.43.0


