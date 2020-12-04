Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by mx.groups.io with SMTP id smtpd.web10.240.1607125658058061381
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Dec 2020 15:47:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.9, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4CnqBQ4TlDz1qs3d;
	Sat,  5 Dec 2020 00:47:26 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4CnqBQ4M4mz1sJ3c;
	Sat,  5 Dec 2020 00:47:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id 61v1n8iKkUWG; Sat,  5 Dec 2020 00:47:25 +0100 (CET)
X-Auth-Info: CWLAwV61obFTEblqpVod9KSt2mqaejexnF0LYf/3Agg=
Received: from localhost.localdomain (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sat,  5 Dec 2020 00:47:25 +0100 (CET)
From: "Marek Vasut" <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>
Subject: [meta-oe][dunfell][PATCH] freerdp: Add missing libxkbcommon WL dependency
Date: Sat,  5 Dec 2020 00:47:22 +0100
Message-Id: <20201204234722.20315-1-marex@denx.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The WL build depends on libxkbcommon, so add the dependency.

Signed-off-by: Marek Vasut <marex@denx.de>
---
 meta-oe/recipes-support/freerdp/freerdp_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/rec=
ipes-support/freerdp/freerdp_git.bb
index 7cafbb799..82ef561fb 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -40,7 +40,7 @@ PACKAGECONFIG ??=3D " \
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
2.29.2

