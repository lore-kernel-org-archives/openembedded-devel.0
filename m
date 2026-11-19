Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11741.1795085361627926447
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 02:49:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=J/daTj33;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout06.t-online.de (Postfix) with SMTP id 35FE8104E
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 11:49:19 +0100 (CET)
Received: from localhost.localdomain ([79.219.238.229]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xTzhd-4JwVdr0; Thu, 19 Nov 2026 11:49:17 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/4] lpeg: add recipe for 1.1.0
Date: Thu, 19 Nov 2026 11:47:48 +0100
Message-ID: <20261119104903.176376-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119104903.176376-1-f_l_k@t-online.de>
References: <20261119104903.176376-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1795085357-60FF69BF-A5261679/0/0 CLEAN NORMAL
X-TOI-MSGID: 6c0f41f2-36de-45e8-bb34-ea0c4f2dfe2a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1795085359; i=f_l_k@t-online.de;
	bh=jP6K50gq8UoZ//O9wAMaDdKHpAVblk/fqFJJsYWwedo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=J/daTj33l+0BRw/j0I5G8GgJmEk8XJlSlrwzwhm5jrvpcOlimWjC5dlhy0NHv/cPH
	 9D8qF1PlIJO29rbMfnXJsbJ7VQ8oBoXB7aw1JZBqNEukGZpGw1vPaLE3PgHWYGJTaD
	 yHcwo4EMvgbaX/6dbLM0EJVcOpI+0LD+auUnFN8O3IuhA8qbN8e7D14LU7Kz/jKlB9
	 b6kkUQ786bdE1WFVfz+p9cSaFbSulF7w9YPgWggEs7l0XhgUc4DWO1er9bwz556/Nd
	 /9xckK6O608JUlh8ACTbUPrGQGDIrHmoa6RRRO7oYBhWoIh0IAsu4dllOwOF6FHwU0
	 E9mcxFcmh/LRA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132677
Content-Type: text/plain; charset="utf-8"

LPeg is a pattern-matching library for Lua and a build dependency of
neovim. Upstream only builds a Lua module without a soname, so build it
as liblpeg.so.1 for linking and add a lua/5.1/lpeg.so link so that
LuaJIT can load it with require "lpeg"; dev-so is skipped for that
module link.

Tested on intel-corei7-64: neovim links against it, and LuaJIT loads
it with require "lpeg".

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-devtools/lpeg/lpeg_1.1.0.bb | 35 +++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/lpeg/lpeg_1.1.0.bb

diff --git a/meta-oe/recipes-devtools/lpeg/lpeg_1.1.0.bb b/meta-oe/recipe=
s-devtools/lpeg/lpeg_1.1.0.bb
new file mode 100644
index 0000000000..3ba37ef4df
--- /dev/null
+++ b/meta-oe/recipes-devtools/lpeg/lpeg_1.1.0.bb
@@ -0,0 +1,35 @@
+SUMMARY =3D "Parsing Expression Grammars for Lua"
+DESCRIPTION =3D "LPeg is a pattern-matching library for Lua based on Par=
sing \
+Expression Grammars. It is built as a shared library with a soname, so t=
hat \
+programs embedding LuaJIT such as neovim can link against it; it is \
+also installed as a Lua module for LuaJIT."
+HOMEPAGE =3D "https://www.inf.puc-rio.br/~roberto/lpeg/"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://lpeg.html;beginline=3D1388;endline=3D1421;m=
d5=3Dc6b4557382727a792e7134685abbf862"
+
+SRC_URI =3D "https://www.inf.puc-rio.br/~roberto/lpeg/lpeg-${PV}.tar.gz"
+SRC_URI[sha256sum] =3D "4b155d67d2246c1ffa7ad7bc466c1ea899bbc40fef0257cc=
9c03cecbaed4352a"
+
+DEPENDS =3D "luajit"
+
+inherit pkgconfig
+
+do_compile() {
+    oe_runmake lpeg.so \
+        CC=3D"${CC}" \
+        CFLAGS=3D"${CFLAGS} -std=3Dc99 -fPIC $(pkg-config --cflags luaji=
t)" \
+        DLLFLAGS=3D"${LDFLAGS} -shared -Wl,-soname,liblpeg.so.1"
+}
+
+do_install() {
+    install -d ${D}${libdir}/lua/5.1
+    install -m 0755 ${S}/lpeg.so ${D}${libdir}/liblpeg.so.${PV}
+    ln -sf liblpeg.so.${PV} ${D}${libdir}/liblpeg.so.1
+    ln -sf liblpeg.so.${PV} ${D}${libdir}/liblpeg.so
+    ln -sf ../../liblpeg.so.1 ${D}${libdir}/lua/5.1/lpeg.so
+}
+
+FILES:${PN} +=3D "${libdir}/lua"
+INSANE_SKIP:${PN} =3D "dev-so"
+
+BBCLASSEXTEND =3D "native"
--=20
2.56.0

