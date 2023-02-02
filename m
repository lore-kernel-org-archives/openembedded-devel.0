Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F171FC05027
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 16:05:06 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.18334.1675353906217456248
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Feb 2023 08:05:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout12.t-online.de (Postfix) with SMTP id 18472B7E5
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Feb 2023 17:04:17 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.46.179]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pNc4N-1hYr2n0; Thu, 2 Feb 2023 17:04:15 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] xdg-desktop-portal: add runtime dependency on rtkit
Date: Thu,  2 Feb 2023 17:04:08 +0100
Message-Id: <20230202160408.6204-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1675353855-42AC0378-CF4E0E09/0/0 CLEAN NORMAL
X-TOI-MSGID: 605805a3-a2a6-4708-975d-bb27215aeead
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Feb 2023 16:05:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100915

According to the used desktop environment there are high level xdg-deskto=
p-portal
backends available. There are implementations for kde, lxde, gnome, wlroo=
ts.
Even hyprland provides its own portal backend addition.
These backends are known to cause unexpected behavior if mixed together,
so it was a little bit overambitious to set the gnome portal as a
runtime dependency by default as it may break other environments.

Remove it from RDEPENDS

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb       | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l_1.16.0.bb b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-port=
al_1.16.0.bb
index 84e04e9f2..e16f9f372 100644
--- a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.=
0.bb
+++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.=
0.bb
@@ -20,13 +20,11 @@ DEPENDS =3D " \
 "
=20
 PORTAL_BACKENDS ?=3D " \
-	${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'xdg-desktop-portal-=
wlr', '', d)} \
-	${@bb.utils.contains('DISTRO_FEATURES', 'gtk', 'xdg-desktop-portal-gnom=
e', '', d)} \
-	${@bb.utils.contains('DISTRO_FEATURES', 'gtk+3', 'xdg-desktop-portal-gn=
ome', '', d)} \
-	${@bb.utils.contains('DISTRO_FEATURES', 'gtk4', 'xdg-desktop-portal-gno=
me', '', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'gtk+3', 'xdg-desktop-portal-gt=
k', '', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'gtk4', 'xdg-desktop-portal-gtk=
', '', d)} \
 "
=20
-RDEPENDS:${PN} =3D "bubblewrap ${PORTAL_BACKENDS}"
+RDEPENDS:${PN} =3D "bubblewrap rtkit ${PORTAL_BACKENDS}"
=20
 inherit meson pkgconfig python3native features_check
=20
--=20
2.34.1


