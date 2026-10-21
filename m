Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8046.1792577262563014125
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=pzU2QjOI;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout11.t-online.de (Postfix) with SMTP id F04771C467
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 12:07:39 +0200 (CEST)
Received: from localhost.localdomain ([84.163.40.237]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xJTEJ-0cELa80; Wed, 21 Oct 2026 12:07:31 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 05/26] gnome-control-center: upgrade 50.4 -> 51.1
Date: Wed, 21 Oct 2026 12:06:53 +0200
Message-ID: <20261021100717.11068-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021100717.11068-1-f_l_k@t-online.de>
References: <20261021100717.11068-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1792577251-65FF8903-66265651/0/0 CLEAN NORMAL
X-TOI-MSGID: 2a47a306-b368-4533-8dd9-fe9133b447d8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1792577259; i=f_l_k@t-online.de;
	bh=F2wnLAZm0I8pVXQRk8rKSamo0ysEmu499U0NH5VEMOM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=pzU2QjOIHJM387LF7Jw632UeeSK0FkccP5HDO0jAjdNrtF1K+qidg7uNmYFIjQvqQ
	 nCafgrKJmCdNhxcqV6EWP8ScCMqtaQGO5SwhLV96kMQysNFsCMvTBidBAMJPrC7hUh
	 BG6mTAKvdOelcWexwzNq8y+COnAsG/O4/Xj3G091AOAWWd2URvMa/2YKLL2PK9ZE4y
	 9mWZM1vlfkkcaBHoGOux5LnPhpOy92jI+lSeKtKGLq4iYs/xz+89sN/g4OJMMvxqT3
	 78Al7uRosNoFRIu3uYKbvpDuZj/oob5OeaE2hWPXbYG0kZIFfpYOqLuTwWxz/sUR9/
	 YqULaOdGECkIg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 10:07:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131237
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...nome-control-center_50.4.bb =3D> gnome-control-center_51.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-cent=
er_50.4.bb =3D> gnome-control-center_51.1.bb} (96%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_50.4.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_51.1.bb
similarity index 96%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-c=
enter_50.4.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cen=
ter_51.1.bb
index ea45485b69..d9f6423693 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
50.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
51.1.bb
@@ -40,7 +40,7 @@ inherit gtk-icon-cache pkgconfig gnomebase gsettings ge=
ttext gi-docgen upstream-
 REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd"
=20
 SRC_URI =3D "https://download.gnome.org/sources/gnome-control-center/${@=
oe.utils.trim_version('${PV}', 1)}/gnome-control-center-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "5856c73999bedf45e74f73bac3d61e2b5ec1689f8bcf1943=
737baeee8204fb11"
+SRC_URI[sha256sum] =3D "1054976c2f1977f770ba134b872f547c89db7005e4422f09=
a96d521379c083cb"
=20
 SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"
=20
--=20
2.56.0

