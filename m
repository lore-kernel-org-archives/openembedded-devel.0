Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11754.1795083950913399901
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 02:25:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=k1azfZ8S;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout04.t-online.de (Postfix) with SMTP id 7EB4D42A
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 11:25:48 +0100 (CET)
Received: from localhost.localdomain ([79.219.238.229]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xTzKt-41P5Cy0; Thu, 19 Nov 2026 11:25:48 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] libtreesitter: add recipe for 0.27.2
Date: Thu, 19 Nov 2026 11:25:41 +0100
Message-ID: <20261119102542.104648-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1795083948-95FF892B-EB0F97FC/0/0 CLEAN NORMAL
X-TOI-MSGID: 98148d32-2cb3-49b2-a6ba-f94b825088ca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1795083948; i=f_l_k@t-online.de;
	bh=Xi2A46CE/NX9YYFxw5TjUvUlXfBwZC8vefUVQkiC4Ds=;
	h=From:To:Subject:Date;
	b=k1azfZ8SV9x71rD+T/XQe1lAUAjX7WLL4D9RaVFNlm6HT9Nxafl82k4hmY9kZShEL
	 1TM397Ki/n6Htu4IzJ5s27+e/AuuhwnfRHuC1latcSEBOhoDchfV+CFLbPy1HfNQcv
	 Di5c6v23tF8oxqVj4NMuEkv4mKsSR7kcdIbfQ3GYcS3Ig4UxPly+QvBKj60rBTgkYS
	 SUsXlIakLvXcfxTUELJ0FSDcYmFz+bWPU4HyT3ROL4+pU7/Mxnw9/985M/lrKgUN8g
	 xVbIYwhqi33HWlxrsp/H79c0xIWnTnF81vRWwIGslHR6oDS05tcGvW1tX8IXx59VsY
	 SQvAaniV4Yp+w==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132672
Content-Type: text/plain; charset="utf-8"

Tree-sitter is an incremental parsing library used by editors for
syntax highlighting and code navigation: neovim requires it, and GNU
Emacs uses it for its tree-sitter major modes since version 29.
Language grammars are built as separate shared libraries against it.

The recipe builds only the C runtime library, without the wasm
feature; the tree-sitter CLI, which is written in Rust, is not needed.

Tested on intel-corei7-64 by building emacs with the new tree-sitter
PACKAGECONFIG and neovim 0.12.5 against it; both parse C code with
tree-sitter-c 0.24.1.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../tree-sitter/libtreesitter_0.27.2.bb       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/tree-sitter/libtreesitter_0.=
27.2.bb

diff --git a/meta-oe/recipes-devtools/tree-sitter/libtreesitter_0.27.2.bb=
 b/meta-oe/recipes-devtools/tree-sitter/libtreesitter_0.27.2.bb
new file mode 100644
index 0000000000..e1e9ab1dce
--- /dev/null
+++ b/meta-oe/recipes-devtools/tree-sitter/libtreesitter_0.27.2.bb
@@ -0,0 +1,19 @@
+SUMMARY =3D "Tree-sitter parsing library"
+DESCRIPTION =3D "Tree-sitter is an incremental parsing system for progra=
mming tools. \
+This is the C runtime library libtree-sitter, which editors such as neov=
im and \
+emacs use to load language grammars."
+HOMEPAGE =3D "https://tree-sitter.github.io/tree-sitter/"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db83e3e9ab94483903b3bc21d9a1d4=
1ed"
+
+SRC_URI =3D "git://github.com/tree-sitter/tree-sitter.git;protocol=3Dhtt=
ps;branch=3Drelease-0.27;tag=3Dv${PV}"
+SRCREV =3D "3fb7be49145acfb07e33b61ed5689e2b6771b2e9"
+
+inherit cmake pkgconfig
+
+EXTRA_OECMAKE =3D " \
+    -DBUILD_SHARED_LIBS=3DON \
+    -DTREE_SITTER_FEATURE_WASM=3DOFF \
+"
+
+BBCLASSEXTEND =3D "native"
--=20
2.56.0

