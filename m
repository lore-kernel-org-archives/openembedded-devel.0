Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C14BAC79FAC
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 09:37:31 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10846.1788687443489593313
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Sep 2026 02:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Xz2ON5ey;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd94.aul.t-online.de (fwd94.aul.t-online.de [10.223.144.120])
	by mailout11.t-online.de (Postfix) with SMTP id 72C911C42E
	for <openembedded-devel@lists.openembedded.org>; Sun,  6 Sep 2026 11:37:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.20]) by fwd94.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x39JO-22AhJi0; Sun, 6 Sep 2026 11:37:18 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 03/15] gnome-control-center: upgrade 49.9 -> 50.4
Date: Sun,  6 Sep 2026 11:37:01 +0200
Message-ID: <20260906093713.797648-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906093713.797648-1-f_l_k@t-online.de>
References: <20260906093713.797648-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788687438-E4FEE956-6B57963A/0/0 CLEAN NORMAL
X-TOI-MSGID: befc3195-9e71-4f4b-b354-584ff4520066
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788687441; i=f_l_k@t-online.de;
	bh=6hRnZtrUfHT5V9R379B6DkFohC9GDSMfeSZN/lJGI7M=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Xz2ON5eyoUOLKOe/nMUDvHMe36jnNwppyKyiQuT1ael2BbtkBaYc/DaYyRLM/SToO
	 7YlgJvkWPxDZ51AwiQacChwD3sUmkgWJYwMkKXpAORVvPImftRB2npF+MJxYNN7MZL
	 4Fc2adYdSBHi4eTXLL/api0O66dn0OKMNs1QjY+maSbHsNr7HHosG5XA3pVqAxQvlA
	 khOGSeQ1pGf1mlrSrj0qC7aKJk7MasJUmpxN6s2TuC1YvvWgkv3NZK+iR0L9fM9hS2
	 LsdiH/w4P6B9GXg8TjJHe0G3YxcAe75cJHf8eDEb/sMNfeuxAnH+p8zwHkvOU26Y/r
	 fDoMvP8Gpl0fg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Sep 2026 09:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129783

The x11 meson option was removed upstream, drop the corresponding
PACKAGECONFIG. The sysroot patch still applies with an offset.

Build tested on corei7-64.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...e-control-center_49.9.bb =3D> gnome-control-center_50.4.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-cent=
er_49.9.bb =3D> gnome-control-center_50.4.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_49.9.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_50.4.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-c=
enter_49.9.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cen=
ter_50.4.bb
index e2e7fed24c..e66f11a2b1 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
49.9.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
50.4.bb
@@ -40,17 +40,16 @@ inherit gtk-icon-cache pkgconfig gnomebase gsettings =
gettext gi-docgen upstream-
 REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd"
=20
 SRC_URI =3D "https://download.gnome.org/sources/gnome-control-center/${@=
oe.utils.trim_version('${PV}', 1)}/gnome-control-center-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "b7987aa4d6899584bbc9ff9a698d1adc1b557bcec09168eb=
ebb624585f3cdf77"
+SRC_URI[sha256sum] =3D "5856c73999bedf45e74f73bac3d61e2b5ec1689f8bcf1943=
737baeee8204fb11"
=20
 SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.gnome.org/GNOME/gnome-control-cen=
ter/-/tags"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
=20
-PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d=
)}"
+PACKAGECONFIG ??=3D "ibus"
 PACKAGECONFIG[cups] =3D ",,cups,cups system-config-printer cups-pk-helpe=
r"
 PACKAGECONFIG[ibus] =3D "-Dibus=3Dtrue, -Dibus=3Dfalse, ibus"
-PACKAGECONFIG[x11] =3D "-Dx11=3Dtrue, -Dx11=3Dfalse, virtual/libx11"
 PACKAGECONFIG[file-share] =3D ",,,gnome-user-share"
 PACKAGECONFIG[media-share] =3D ",,,rygel-meta tumbler"
 PACKAGECONFIG[malcontent] =3D "-Dmalcontent=3Dtrue,-Dmalcontent=3Dfalse,=
malcontent,malcontent-ui"
--=20
2.55.0


