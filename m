Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0A1C77B6E
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 14:54:23 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.15570.1681397659748164624
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Apr 2023 07:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout06.t-online.de (Postfix) with SMTP id A172224ADB
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Apr 2023 16:54:17 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.34.78]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pmyKz-3R17yL0; Thu, 13 Apr 2023 16:54:13 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [mickledore][meta-gnome][PATCH] xdg-desktop-portal-gnome: downgrade to 43.1
Date: Thu, 13 Apr 2023 16:54:06 +0200
Message-Id: <20230413145406.1216066-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1681397653-A4FC4C52-21868A8E/0/0 CLEAN NORMAL
X-TOI-MSGID: 2f5eb041-26d3-4a2a-a0e6-e16dac67ab57
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Apr 2023 14:54:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102079

xdg-desktop-portal-gnome_44.0 requires that mutter, gnome-shell and
gnome-control-center are also updated to v44. The v43 variants experience
problems such as protals not working and delayed startup of some gtk
applications. Downgrade to fix these problems

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...op-portal-gnome_44.0.bb =3D> xdg-desktop-portal-gnome_43.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/xdg-desktop-portal/{xdg-desktop-portal=
-gnome_44.0.bb =3D> xdg-desktop-portal-gnome_43.1.bb} (94%)

diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-po=
rtal-gnome_44.0.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-de=
sktop-portal-gnome_43.1.bb
similarity index 94%
rename from meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-por=
tal-gnome_44.0.bb
rename to meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l-gnome_43.1.bb
index c92037d6e..636aba689 100644
--- a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_44.0.bb
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_43.1.bb
@@ -24,7 +24,7 @@ REQUIRED_DISTRO_FEATURES =3D "polkit"
 SRC_URI =3D "git://gitlab.gnome.org/GNOME/xdg-desktop-portal-gnome.git;p=
rotocol=3Dhttps;nobranch=3D1"
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "8e1c4fd928be500208ca1df62441a56e2569bfb8"
+SRCREV =3D "4fd5a8bf16b01c78ed19764415cb26d29aaf7eab"
=20
 PACKAGECONFIG ?=3D "screenshot screencast ${@bb.utils.filter('DISTRO_FEA=
TURES', 'wayland', d)}"
=20
--=20
2.34.1


