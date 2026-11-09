Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4451.1794225939495791671
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2026 04:05:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=WZfj1jRu;
 spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout07.t-online.de (Postfix) with SMTP id D2045E7B9
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Nov 2026 13:05:36 +0100 (CET)
Received: from localhost.localdomain ([84.163.39.232]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xQO7w-4anzaS0; Mon, 9 Nov 2026 13:05:32 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] colord: add a vapi PACKAGECONFIG
Date: Mon,  9 Nov 2026 13:05:26 +0100
Message-ID: <20261109120526.1158026-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1794225932-557F9A00-408E6289/0/0 CLEAN NORMAL
X-TOI-MSGID: ee06a659-914e-4db1-aa39-7d542da5da29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1794225936; i=f_l_k@t-online.de;
	bh=I+SBSEwsEPhW5+H9EuSy1YjHA5VOzfa5FOudSlzYg3o=;
	h=From:To:Subject:Date;
	b=WZfj1jRuRq1ziSR2a0YmGZaZKvjEKb5CY0QSOnVGS2skJXhs15cDLQIgeSwzX4Le2
	 jh2rHPPOi45lD68TxXalUeSEBxUmtyxmSYT0M/fWwNtBiFTWVxcnMvkkJN0tAXXWa1
	 e+GXIGdne1NSuBbHtzjEcF3jtJfGqmlFc+lGLyRkXNIwJzgVL5PavafWJQOPOAxcZP
	 vDTWkh3RqZ51K/xVxO/Va4+6P8VoAiBd6Iwa5KOKblkFj5qjU3xjyUUMSFsX/TP1D+
	 q1sDPrtkZjbhURUj+BU7Dh4S/6ooYtF3fjlUfnpIAkKnl6MPEwSLO7TmCRpTxMAQMg
	 +8cARE71DFv3w==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 12:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132060
Content-Type: text/plain; charset="utf-8"

Build the vala bindings when gobject-introspection data is enabled.
simple-scan uses colord when it is found and needs colord.vapi for it.

Tested by building colord and simple-scan for x86-64.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/colord/colord.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/colord/colord.bb b/meta-oe/recipes-s=
upport/colord/colord.bb
index 571c4b1826..0652a48846 100644
--- a/meta-oe/recipes-support/colord/colord.bb
+++ b/meta-oe/recipes-support/colord/colord.bb
@@ -1,6 +1,6 @@
 require ${BPN}.inc
=20
-inherit meson gobject-introspection gsettings gtk-doc gettext bash-compl=
etion systemd features_check useradd pkgconfig
+inherit meson gobject-introspection gsettings gtk-doc gettext bash-compl=
etion systemd features_check useradd pkgconfig vala
=20
 # polkit and gobject-introspection are mandatory and cannot be configure=
d
 REQUIRED_DISTRO_FEATURES =3D "polkit gobject-introspection-data"
@@ -29,8 +29,12 @@ EXTRA_OEMESON +=3D " \
 	-Dpnp_ids=3D${datadir}/hwdata/pnp.ids \
 "
=20
-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
}"
+PACKAGECONFIG ??=3D " \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+    ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'vapi', '', d)} \
+"
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue, -Dsystemd=3Dfalse, systemd=
"
+PACKAGECONFIG[vapi] =3D "-Dvapi=3Dtrue,-Dvapi=3Dfalse"
=20
 SYSTEMD_SERVICE:${PN} =3D "colord.service"
=20
--=20
2.56.0

