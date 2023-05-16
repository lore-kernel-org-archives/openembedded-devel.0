Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B05EC77B7F
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 04:37:00 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.13645.1684211818671530526
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 May 2023 21:36:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout09.t-online.de (Postfix) with SMTP id 1D6304B80B
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 06:36:56 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([79.219.228.204]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pymPB-33a7Xu0; Tue, 16 May 2023 06:35:21 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 2/7] xdg-desktop-portal-gnome: update 44.0 -> 44.1
Date: Tue, 16 May 2023 06:34:53 +0200
Message-Id: <20230516043458.6180-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516043458.6180-1-f_l_k@t-online.de>
References: <20230516043458.6180-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1684211721-59FF057F-4CF4684F/0/0 CLEAN NORMAL
X-TOI-MSGID: f09f5d2d-4285-484c-987b-715775d2788d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 04:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102616

Changes in 44.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Improve handling of non-existing files on the filechooser portal
- Minor debugging improvements to the backgrounds portal
- More precise initialization timing
- Fix duplicate monitor and window streams
- Translation updates

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...op-portal-gnome_44.0.bb =3D> xdg-desktop-portal-gnome_44.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/xdg-desktop-portal/{xdg-desktop-portal=
-gnome_44.0.bb =3D> xdg-desktop-portal-gnome_44.1.bb} (94%)

diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-po=
rtal-gnome_44.0.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-de=
sktop-portal-gnome_44.1.bb
similarity index 94%
rename from meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-por=
tal-gnome_44.0.bb
rename to meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l-gnome_44.1.bb
index c92037d6e5..d6bc0e9c8b 100644
--- a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_44.0.bb
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_44.1.bb
@@ -24,7 +24,7 @@ REQUIRED_DISTRO_FEATURES =3D "polkit"
 SRC_URI =3D "git://gitlab.gnome.org/GNOME/xdg-desktop-portal-gnome.git;p=
rotocol=3Dhttps;nobranch=3D1"
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "8e1c4fd928be500208ca1df62441a56e2569bfb8"
+SRCREV =3D "89203bf3522556965fc225782d1a635afdac611e"
=20
 PACKAGECONFIG ?=3D "screenshot screencast ${@bb.utils.filter('DISTRO_FEA=
TURES', 'wayland', d)}"
=20
--=20
2.34.1


