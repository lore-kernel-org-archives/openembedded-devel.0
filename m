Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF662EE49AB
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 20:54:12 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.685.1692996847345713705
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Aug 2023 13:54:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout01.t-online.de (Postfix) with SMTP id 97CC91CAF2
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 22:54:05 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.164.212]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qZdog-38mfuj0; Fri, 25 Aug 2023 22:54:02 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] xdg-desktop-portal-gnome: upgrade 44.1 -> 44.2
Date: Fri, 25 Aug 2023 22:53:54 +0200
Message-ID: <20230825205355.220438-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1692996842-061C4670-0EEEB83E/0/0 CLEAN NORMAL
X-TOI-MSGID: d3ae2287-d4b9-410d-8db9-9445f301ca8e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 20:54:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104612

Changes in 44.2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=EF=BF=BC=EF=BF=BC
- Expose settings backend when running outside of GNOME
- Translation updates

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...op-portal-gnome_44.1.bb =3D> xdg-desktop-portal-gnome_44.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/xdg-desktop-portal/{xdg-desktop-portal=
-gnome_44.1.bb =3D> xdg-desktop-portal-gnome_44.2.bb} (94%)

diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-po=
rtal-gnome_44.1.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-de=
sktop-portal-gnome_44.2.bb
similarity index 94%
rename from meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-por=
tal-gnome_44.1.bb
rename to meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l-gnome_44.2.bb
index d6bc0e9c8..c55137b6e 100644
--- a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_44.1.bb
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_44.2.bb
@@ -24,7 +24,7 @@ REQUIRED_DISTRO_FEATURES =3D "polkit"
 SRC_URI =3D "git://gitlab.gnome.org/GNOME/xdg-desktop-portal-gnome.git;p=
rotocol=3Dhttps;nobranch=3D1"
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "89203bf3522556965fc225782d1a635afdac611e"
+SRCREV =3D "68a15e19f23aeb1421f4186c4b993a6532ee366b"
=20
 PACKAGECONFIG ?=3D "screenshot screencast ${@bb.utils.filter('DISTRO_FEA=
TURES', 'wayland', d)}"
=20
--=20
2.41.0


