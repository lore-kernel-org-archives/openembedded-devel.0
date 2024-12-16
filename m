Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91226E77184
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 12:15:49 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.55110.1734351341416441700
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Dec 2024 04:15:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout03.t-online.de (Postfix) with SMTP id 473B6A38
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 13:15:38 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.162.147]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tNA0a-0JvUjy0; Mon, 16 Dec 2024 13:15:32 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/3] lua-lgi: add recipe
Date: Mon, 16 Dec 2024 13:15:26 +0100
Message-ID: <20241216121527.1428075-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241216121527.1428075-1-f_l_k@t-online.de>
References: <20241216121527.1428075-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1734351332-CE7FB9BF-CB7CB7F6/10/3626336762 SUSPECT URL
X-TOI-MSGID: 7860495d-d7a6-48c1-bcb0-63529958c60d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 12:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114334

gobject bindings for lua

Required to build the lua51 loader for libpeas-2

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/lgi/lua-lgi_0.9.2.bb | 24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-support/lgi/lua-lgi_0.9.2.bb

diff --git a/meta-oe/recipes-support/lgi/lua-lgi_0.9.2.bb b/meta-oe/recip=
es-support/lgi/lua-lgi_0.9.2.bb
new file mode 100644
index 0000000000..1584a931c7
--- /dev/null
+++ b/meta-oe/recipes-support/lgi/lua-lgi_0.9.2.bb
@@ -0,0 +1,24 @@
+SUMMARY =3D "LGI is gobject-introspection based dynamic Lua binding to G=
Object based libraries."
+HOMEPAGE =3D "https://https://github.com/pavouk/lgi"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da77b7838f84aa753d37f88fd9c9cc=
f7d"
+
+SRC_URI =3D "git://github.com/pavouk/lgi.git;protocol=3Dhttps;branch=3Dm=
aster"
+
+DEPENDS =3D " \
+	luajit \
+	luajit-native \
+	cairo \
+	gobject-introspection \
+	gobject-introspection-native \
+"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "d7666f77e7ee33907c84f5efdef32aef2e1cc196"
+SRCPV =3D "${PV}+${SRCREV}"
+
+inherit meson pkgconfig
+
+EXTRA_OEMESON +=3D "--buildtype release -Dtests=3Dfalse"
+
+FILES:${PN} =3D "${libdir} ${datadir}"
--=20
2.47.0


