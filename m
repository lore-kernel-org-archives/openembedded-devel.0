Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 934ECC433FE
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 17:52:16 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.5181.1637257934817814888
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 09:52:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=e0li1kGB;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 00D2682F8B;
	Thu, 18 Nov 2021 18:52:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1637257932;
	bh=fxC9sTjCCvzC7AuAsoCFodD1sm9uODK6mXxz5CJDesI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e0li1kGBJkKEZE6hc5/vWEODsFx7nAMuTkNafHQd9vML9vqSACxn+sAn1k5oCvgSd
	 YHJdO8E2cUqxUbhHqUo9b1Kd+M0jJknXq6b1UeNSWwKherYmVZ8gHZQjC+sr22sp7V
	 Ux+Wv65VZZ6x3Iv2HuBAMguGjPmKGF3poJJ2zhP0sFYiCKYNTMFhT+0fy5K7K3Grsg
	 CvipzPdNjZuuClCVa5cGVO+a02pFrrvufZMXMiu7DZYARNxdJGQQnaiVDfFVj9Q46c
	 91EIv6l625iGoOpRbEtsqyFlWzxCDibl4LwnH6zejl0dMGMM5hGnDy5nhOyGcNA0uE
	 uI2XkHTVbk3ng==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Marek Vasut <marex@denx.de>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [meta-oe][PATCH 3/4] freerdp: Make PCSC dependency optional
Date: Thu, 18 Nov 2021 18:51:43 +0100
Message-Id: <20211118175144.1708578-3-marex@denx.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211118175144.1708578-1-marex@denx.de>
References: <20211118175144.1708578-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 17:52:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94049

The PCSC is used for smartcard forwarding, make this optional as
not all users need this functionality and it pulls in considerable
amount of dependencies. Keep this enabled by default to retain
backward compatibility.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Kanavin <alex@linutronix.de>
Cc: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb b/meta-oe/r=
ecipes-support/freerdp/freerdp_2.4.1.bb
index d2851a602..aba77e20f 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb
@@ -3,7 +3,7 @@
=20
 DESCRIPTION =3D "FreeRDP RDP client & server library"
 HOMEPAGE =3D "http://www.freerdp.com"
-DEPENDS =3D "openssl alsa-lib pcsc-lite libusb1"
+DEPENDS =3D "openssl alsa-lib libusb1"
 SECTION =3D "net"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
@@ -22,7 +22,6 @@ S =3D "${WORKDIR}/git"
=20
 EXTRA_OECMAKE +=3D " \
     -DWITH_ALSA=3DON \
-    -DWITH_PCSC=3DON \
     -DWITH_FFMPEG=3DOFF \
     -DWITH_CUNIT=3DOFF \
     -DWITH_NEON=3DOFF \
@@ -33,7 +32,7 @@ EXTRA_OECMAKE +=3D " \
=20
 PACKAGECONFIG ??=3D " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'directfb pam pulseaudio wayla=
nd x11', d)}\
-    gstreamer cups \
+    gstreamer cups pcsc \
 "
=20
 X11_DEPS =3D "virtual/libx11 libxinerama libxext libxcursor libxv libxi =
libxrender libxfixes libxdamage libxrandr libxkbfile"
@@ -41,6 +40,7 @@ PACKAGECONFIG[x11] =3D "-DWITH_X11=3DON -DWITH_XINERAMA=
=3DON -DWITH_XEXT=3DON -DWITH_XCU
 PACKAGECONFIG[wayland] =3D "-DWITH_WAYLAND=3DON,-DWITH_WAYLAND=3DOFF,way=
land wayland-native libxkbcommon"
 PACKAGECONFIG[directfb] =3D "-DWITH_DIRECTFB=3DON,-DWITH_DIRECTFB=3DOFF,=
directfb"
 PACKAGECONFIG[pam] =3D "-DWITH_PAM=3DON,-DWITH_PAM=3DOFF,libpam"
+PACKAGECONFIG[pcsc] =3D "-DWITH_PCSC=3DON,-DWITH_PCSC=3DOFF,pcsc-lite"
 PACKAGECONFIG[pulseaudio] =3D "-DWITH_PULSEAUDIO=3DON,-DWITH_PULSEAUDIO=3D=
OFF,pulseaudio"
 PACKAGECONFIG[gstreamer] =3D "-DWITH_GSTREAMER_1_0=3DON,-DWITH_GSTREAMER=
_1_0=3DOFF,gstreamer1.0 gstreamer1.0-plugins-base"
 PACKAGECONFIG[cups] =3D "-DWITH_CUPS=3DON,-DWITH_CUPS=3DOFF,cups"
--=20
2.33.0


