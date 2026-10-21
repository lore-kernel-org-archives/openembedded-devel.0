Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8042.1792577262372443992
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=X2Gi24rg;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout10.t-online.de (Postfix) with SMTP id 3C80237E29
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 12:07:40 +0200 (CEST)
Received: from localhost.localdomain ([84.163.40.237]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xJTEL-0cELaK0; Wed, 21 Oct 2026 12:07:33 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 17/26] ghex: upgrade 46.3 -> 50.4
Date: Wed, 21 Oct 2026 12:07:05 +0200
Message-ID: <20261021100717.11068-17-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021100717.11068-1-f_l_k@t-online.de>
References: <20261021100717.11068-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1792577253-67FFC903-B25D16D6/0/0 CLEAN NORMAL
X-TOI-MSGID: 7731c6e5-6f64-4a01-b9a7-d3c3558145b2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1792577260; i=f_l_k@t-online.de;
	bh=ChnsJaQnU7HH2egz18Vu/okIm/0i1V8lvinW2kPRE0g=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=X2Gi24rguOqVyGzSxTCFoXmasknL9G9jbvmtKjviiMikqwXPpFIL+PyBUku4GBJrv
	 fYrvokvs7MOkYRs4o0u0gPT/OzqMqxcYFC04Wv1/DgTOHScAgOq8U7B+Q9QJC/uHh+
	 47p+GL+tuzF4tB65ZYae15LW0Ks6NeF9joStwooqYpqJsD38REAt+L5ieCttIEdVrL
	 VPvt9TudkB36rctZthTZjg/93I5AmP0rna8pKR7e2oRSFkxcozI1rizvsaeCwJGEC+
	 1xHaZabaProQUgcx4/eRD0jNapLtNtXwYT/6F2P2xPdl9HcUaC3VoOllWqkxa2X3jn
	 HOxNCvImjZBOA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 10:07:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131233
Content-Type: text/plain; charset="utf-8"

ghex now installs a D-Bus activation file for org.gnome.GHex; package
it.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/ghex/{ghex_46.3.bb =3D> ghex_50.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/ghex/{ghex_46.3.bb =3D> ghex_50.4.bb} (7=
4%)

diff --git a/meta-gnome/recipes-gnome/ghex/ghex_46.3.bb b/meta-gnome/reci=
pes-gnome/ghex/ghex_50.4.bb
similarity index 74%
rename from meta-gnome/recipes-gnome/ghex/ghex_46.3.bb
rename to meta-gnome/recipes-gnome/ghex/ghex_50.4.bb
index 0185090beb..1cdb1c5b58 100644
--- a/meta-gnome/recipes-gnome/ghex/ghex_46.3.bb
+++ b/meta-gnome/recipes-gnome/ghex/ghex_50.4.bb
@@ -16,8 +16,8 @@ GIR_MESON_DISABLE_FLAG =3D 'disabled'
=20
 inherit gnomebase gsettings gtk-icon-cache gnome-help gettext gobject-in=
trospection vala gi-docgen
=20
-SRC_URI[archive.sha256sum] =3D "ea16595dfba0a97b55dd106305d56ba2baee95de=
0b13b75e75966cc31f9b3ec9"
+SRC_URI[archive.sha256sum] =3D "e2bcf62438edaf04ca961aef8dafd35a2d208aa4=
5f00ee557000b37214c0972e"
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-FILES:${PN} +=3D "${libdir} ${datadir}/metainfo"
+FILES:${PN} +=3D "${libdir} ${datadir}/dbus-1 ${datadir}/metainfo"
--=20
2.56.0

