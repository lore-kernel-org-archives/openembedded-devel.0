Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3AF2C6FD1C
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 08:03:30 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.17416.1679731400787586003
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 01:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id 57A051E821
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:03:17 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfyrq-0RoPho0; Sat, 25 Mar 2023 09:03:15 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 32/32] xdg-desktop-portal-gnome: update 43.1 -> 44.0
Date: Sat, 25 Mar 2023 09:02:56 +0100
Message-Id: <20230325080256.923752-32-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325080256.923752-1-f_l_k@t-online.de>
References: <20230325080256.923752-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679731395-85D6DC08-816C4200/0/0 CLEAN NORMAL
X-TOI-MSGID: 8daf122f-3521-4aec-8c9e-14496c4b3f87
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 08:03:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101743

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...portal-gnome_43.1.bb =3D> xdg-desktop-portal-gnome_44.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-support/xdg-desktop-portal/{xdg-desktop-portal=
-gnome_43.1.bb =3D> xdg-desktop-portal-gnome_44.0.bb} (81%)

diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-po=
rtal-gnome_43.1.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-de=
sktop-portal-gnome_44.0.bb
similarity index 81%
rename from meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-por=
tal-gnome_43.1.bb
rename to meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l-gnome_44.0.bb
index 050ce1a04..c92037d6e 100644
--- a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_43.1.bb
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_44.0.bb
@@ -24,10 +24,11 @@ REQUIRED_DISTRO_FEATURES =3D "polkit"
 SRC_URI =3D "git://gitlab.gnome.org/GNOME/xdg-desktop-portal-gnome.git;p=
rotocol=3Dhttps;nobranch=3D1"
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "4fd5a8bf16b01c78ed19764415cb26d29aaf7eab"
+SRCREV =3D "8e1c4fd928be500208ca1df62441a56e2569bfb8"
=20
-PACKAGECONFIG ?=3D ""
+PACKAGECONFIG ?=3D "screenshot screencast ${@bb.utils.filter('DISTRO_FEA=
TURES', 'wayland', d)}"
=20
+PACKAGECONFIG[wayland] =3D ",,wayland-native"
 PACKAGECONFIG[screenshot] =3D ",,,gnome-shell"
 PACKAGECONFIG[screencast] =3D ",,,mutter"
=20
--=20
2.34.1


