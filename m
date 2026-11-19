Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11740.1795085361594249094
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 02:49:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=HZkS2BbW;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout06.t-online.de (Postfix) with SMTP id 1F8451370
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 11:49:19 +0100 (CET)
Received: from localhost.localdomain ([79.219.238.229]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xTzhd-4JwVdq0; Thu, 19 Nov 2026 11:49:17 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/4] luv: add recipe for 1.53.0
Date: Thu, 19 Nov 2026 11:47:47 +0100
Message-ID: <20261119104903.176376-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119104903.176376-1-f_l_k@t-online.de>
References: <20261119104903.176376-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1795085357-E2FFA9BF-BC65803E/0/0 CLEAN NORMAL
X-TOI-MSGID: 7e4c676f-cb4c-4d9a-8120-786a83b60d73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1795085359; i=f_l_k@t-online.de;
	bh=NftIXHE9ngdFEZ8kQWx5aXj8eSsRUSfgfTziU7Nyq9Y=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=HZkS2BbWz67mFNpgWVywPA2g59U15pZlzslpIDXRJRUDY6+QWejIRxlHvxuJR8fKJ
	 3wbpOdjMJlrxNbQqkLzk54KAxAsvW+iSs/k+ruZAoFpIpXQRnb8VF6ByC0qGLaFd8/
	 jMAwMmD1WMMAaOS/q/Dy3n+yYLbK5Z9AHxT03v167chNNRNvCEnCeVzvb64pP3245F
	 ZGQABKa2jq2paZqz3CtArWqt+IPVpkZKNsWst4YquuC6Zy7q2qR/CC7qRaLBWyxPSw
	 sVGf/OUXe0Ebl9n2GsCphyjCaJY+g9Tc2qHn5+Ts8Rtd2kGbvtLSvhXjP2OuNgCQEH
	 YL84Z+C21nn/Q==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132676
Content-Type: text/plain; charset="utf-8"

luv provides libuv bindings for LuaJIT and Lua and is a build
dependency of neovim. Built as a shared library against the system
libuv and LuaJIT from the release tarball, which carries the
lua-compat-5.3 sources the build needs.

Tested on intel-corei7-64 by building neovim against it.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-devtools/luv/luv_1.53.0.bb | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/luv/luv_1.53.0.bb

diff --git a/meta-oe/recipes-devtools/luv/luv_1.53.0.bb b/meta-oe/recipes=
-devtools/luv/luv_1.53.0.bb
new file mode 100644
index 0000000000..1611b31366
--- /dev/null
+++ b/meta-oe/recipes-devtools/luv/luv_1.53.0.bb
@@ -0,0 +1,24 @@
+SUMMARY =3D "libuv bindings for LuaJIT and Lua"
+HOMEPAGE =3D "https://github.com/luvit/luv"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc=
3c6bd57"
+
+LUV_REV =3D "1"
+SRC_URI =3D "https://github.com/luvit/luv/releases/download/${PV}-${LUV_=
REV}/luv-${PV}-${LUV_REV}.tar.gz"
+SRC_URI[sha256sum] =3D "569b488d5d31609ea466a6c70e008a42661ec773ea1584d3=
d766d46280ab7cf4"
+
+S =3D "${UNPACKDIR}/luv-${PV}-${LUV_REV}"
+
+DEPENDS =3D "luajit libuv"
+
+inherit cmake
+
+EXTRA_OECMAKE =3D " \
+    -DBUILD_SHARED_LIBS=3DON \
+    -DWITH_SHARED_LIBUV=3DON \
+    -DBUILD_MODULE=3DOFF \
+    -DLUA_BUILD_TYPE=3DSystem \
+    -DWITH_LUA_ENGINE=3DLuaJIT \
+"
+
+BBCLASSEXTEND =3D "native"
--=20
2.56.0

