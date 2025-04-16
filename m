Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E109EC369C2
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 13:44:24 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.19917.1744811063082574674
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 06:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout05.t-online.de (Postfix) with SMTP id 25A131F43
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 15:44:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.236.131]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u533q-0pWT9m0; Wed, 16 Apr 2025 15:44:18 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] flatpak: add requested user
Date: Wed, 16 Apr 2025 15:44:10 +0200
Message-ID: <20250416134410.712154-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416134410.712154-1-f_l_k@t-online.de>
References: <20250416134410.712154-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1744811058-94FF6AE4-E1F3A00A/0/0 CLEAN NORMAL
X-TOI-MSGID: ef723407-7433-4afb-be9e-cc0c320f9b0e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 13:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116909

This fixes:
WARNING: gnome-image-1.0-r0 do_rootfs: User flatpak has never been define=
d

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.16.0.bb
index 1f0e649eea..9b7d11e9a9 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb
@@ -12,7 +12,7 @@ SRCREV =3D "1440f4faa67ebf69c7559f31d2cab59e6ec6fe2b"
=20
 S =3D "${WORKDIR}/git"
=20
-inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection py=
thon3native mime features_check
+inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection py=
thon3native mime features_check useradd
=20
 REQUIRED_DISTRO_FEATURES =3D "polkit"
=20
@@ -75,4 +75,7 @@ EXTRA_OEMESON =3D " \
     -Dsystem_dbus_proxy=3Dxdg-dbus-proxy \
 "
=20
+USERADD_PACKAGES =3D "${PN}"
+USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --shell =
/bin/nologin flatpak"
+
 FILES:${PN} +=3D "${libdir} ${datadir}"
--=20
2.49.0


