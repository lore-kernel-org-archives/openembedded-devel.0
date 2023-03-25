Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C4D3C77B75
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 08:03:20 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.17404.1679731394334810396
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 01:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id 487FF1BA09
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:03:12 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfyrn-0RoPhU0; Sat, 25 Mar 2023 09:03:11 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 12/32] gnome-disk-utility: update 43.0 -> 44.0
Date: Sat, 25 Mar 2023 09:02:36 +0100
Message-Id: <20230325080256.923752-12-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325080256.923752-1-f_l_k@t-online.de>
References: <20230325080256.923752-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679731391-85D6DC08-28A8C9FA/0/0 CLEAN NORMAL
X-TOI-MSGID: 2bcf7ea3-e0aa-4ef6-b050-924bef582781
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 08:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101724

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-disk-utility_43.0.bb =3D> gnome-disk-utility_44.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-disk-utility/{gnome-disk-utility_4=
3.0.bb =3D> gnome-disk-utility_44.0.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_43.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_44.0.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utilit=
y_43.0.bb
rename to meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_=
44.0.bb
index 247bf141c..d8674fca2 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_43.0=
.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_44.0=
.bb
@@ -30,7 +30,7 @@ PACKAGECONFIG[systemd] =3D "-Dlogind=3Dlibsystemd,-Dlog=
ind=3Dnone,systemd"
 PACKAGECONFIG[x11] =3D ",,libcanberra"
=20
 SRC_URI:append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', =
'file://0001-gnome-disk-utility-remove-libcanberra-dependency.patch', '',=
 d)}"
-SRC_URI[archive.sha256sum] =3D "7afca9805a6b92db6933dd7efcec4af8386c01bb=
c1f871e2dae4def7e192a2c5"
+SRC_URI[archive.sha256sum] =3D "02031097896cdb37d8717a5823f93e3723d4dfce=
7fdc4002c9dfcb16b7e7a3ef"
=20
 EXTRA_OEMESON =3D "-Dman=3Dfalse"
=20
--=20
2.34.1


