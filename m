Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by mx.groups.io with SMTP id smtpd.web12.197645.1598284426478122732
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 08:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.10, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4BZxVw3tPZz1rxb9;
	Mon, 24 Aug 2020 17:53:44 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4BZxVw3fBrz1qxpB;
	Mon, 24 Aug 2020 17:53:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id NL7MmjKW3f3t; Mon, 24 Aug 2020 17:53:43 +0200 (CEST)
X-Auth-Info: 9SjSsSPk3d4xFBikszwGszjH6fbpkxBWMVoLkajEICA=
Received: from desktop.lan (ip-86-49-101-166.net.upcbroadband.cz [86.49.101.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 24 Aug 2020 17:53:43 +0200 (CEST)
From: "Marek Vasut" <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Marek Vasut <marex@denx.de>
Subject: [meta-oe][PATCH] freerdp: Add missing libxkbcommon WL dependency
Date: Mon, 24 Aug 2020 17:53:37 +0200
Message-Id: <20200824155337.9092-1-marex@denx.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The WL build depends on libxkbcommon, so add the dependency.

Signed-off-by: Marek Vasut <marex@denx.de>
---
 meta-oe/recipes-support/freerdp/freerdp_2.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.2.0.bb b/meta-oe/r=
ecipes-support/freerdp/freerdp_2.2.0.bb
index 6a97c24c2..d446a31a5 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.2.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.2.0.bb
@@ -38,7 +38,7 @@ PACKAGECONFIG ??=3D " \
=20
 X11_DEPS =3D "virtual/libx11 libxinerama libxext libxcursor libxv libxi =
libxrender libxfixes libxdamage libxrandr libxkbfile"
 PACKAGECONFIG[x11] =3D "-DWITH_X11=3DON -DWITH_XINERAMA=3DON -DWITH_XEXT=
=3DON -DWITH_XCURSOR=3DON -DWITH_XV=3DON -DWITH_XI=3DON -DWITH_XRENDER=3D=
ON -DWITH_XFIXES=3DON -DWITH_XDAMAGE=3DON -DWITH_XRANDR=3DON -DWITH_XKBFI=
LE=3DON,-DWITH_X11=3DOFF,${X11_DEPS}"
-PACKAGECONFIG[wayland] =3D "-DWITH_WAYLAND=3DON,-DWITH_WAYLAND=3DOFF,way=
land wayland-native"
+PACKAGECONFIG[wayland] =3D "-DWITH_WAYLAND=3DON,-DWITH_WAYLAND=3DOFF,way=
land wayland-native libxkbcommon"
 PACKAGECONFIG[directfb] =3D "-DWITH_DIRECTFB=3DON,-DWITH_DIRECTFB=3DOFF,=
directfb"
 PACKAGECONFIG[pam] =3D "-DWITH_PAM=3DON,-DWITH_PAM=3DOFF,libpam"
 PACKAGECONFIG[pulseaudio] =3D "-DWITH_PULSEAUDIO=3DON,-DWITH_PULSEAUDIO=3D=
OFF,pulseaudio"
--=20
2.28.0

