Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4401.1794225280790652888
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2026 03:54:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=WWgDs74e;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd95.aul.t-online.de (fwd95.aul.t-online.de [10.223.144.121])
	by mailout03.t-online.de (Postfix) with SMTP id CC397E06C
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Nov 2026 12:54:37 +0100 (CET)
Received: from localhost.localdomain ([84.163.39.232]) by fwd95.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xQNxM-1UwWu10; Mon, 9 Nov 2026 12:54:36 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] colord: add a vapi PACKAGECONFIG
Date: Mon,  9 Nov 2026 12:54:22 +0100
Message-ID: <20261109115426.1051480-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109115426.1051480-1-f_l_k@t-online.de>
References: <20261109115426.1051480-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1794225276-6BFF540D-1C2A38F4/0/0 CLEAN NORMAL
X-TOI-MSGID: 6b02a5f8-0285-45fc-aaf8-f82aa9aee5cb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1794225277; i=f_l_k@t-online.de;
	bh=WuCUybJXeKzJ56U3oFVwbwSKPDTV5V4x1ZgQ1cgb2X4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=WWgDs74e9TvGu0SOr5fLQxi9pmgzwUiPK9OgAqmcIE0VnOdabJr+FDz4OnkZJAvq0
	 G7lrcJOvuKB9TdvLNqS1GGQtWdGMaXrX2kD/50dyJp4ED3BAAaZ7cDl56Wv+v8SxLA
	 wAxF87VP4oaL3gn33yFRR12Kx89mPV5W6/0K41guhAKA4qpkygLRN640UxIH+5cvZP
	 zMxkYCHbYoggaUqdBHeo9taPVydPr+dYxq3Y4HPatEsj+6xtPC434Co3mWztP+7+S6
	 YdRmwYlxqmgmhH5qtAxC7ZnkZNfhUdjTxk8jbcXkMe49diWPVDWd0aX4HakiHCzkws
	 n9/LZuwW5VVgg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 11:54:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132059
Content-Type: text/plain; charset="utf-8"

Build the vala bindings by default. simple-scan uses colord when it is
found and needs colord.vapi for it.

Tested by building colord and simple-scan for x86-64.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/colord/colord.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/colord/colord.bb b/meta-oe/recipes-s=
upport/colord/colord.bb
index 571c4b1826..f954f4d97e 100644
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
@@ -29,8 +29,9 @@ EXTRA_OEMESON +=3D " \
 	-Dpnp_ids=3D${datadir}/hwdata/pnp.ids \
 "
=20
-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
}"
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
} vapi"
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue, -Dsystemd=3Dfalse, systemd=
"
+PACKAGECONFIG[vapi] =3D "-Dvapi=3Dtrue,-Dvapi=3Dfalse"
=20
 SYSTEMD_SERVICE:${PN} =3D "colord.service"
=20
--=20
2.56.0

