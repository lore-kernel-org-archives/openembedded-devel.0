Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22473C44506
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 20:01:44 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21119.1769025695276666109
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 12:01:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout03.t-online.de (Postfix) with SMTP id C18A1EE9D
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 21:01:04 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.40.12]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vieO0-3BXRHl0; Wed, 21 Jan 2026 21:01:04 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mozjs-128: update  128.5.2 -> 128-14-0
Date: Wed, 21 Jan 2026 21:00:56 +0100
Message-ID: <20260121200056.2789828-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1769025664-E7FFC925-F0D6D8D6/0/0 CLEAN NORMAL
X-TOI-MSGID: 7ca8ca3a-7b84-4b90-8b14-5764ff9e0115
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 20:01:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123724

- add a patch to fix build with python 3.14, taken from fedora

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../mozjs/mozjs-128/D261512.1755672843.patch  | 69 +++++++++++++++++++
 ...s-128_128.5.2.bb =3D> mozjs-128_128.14.0.bb} | 34 ++++-----
 2 files changed, 87 insertions(+), 16 deletions(-)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/D261512.1755=
672843.patch
 rename meta-oe/recipes-extended/mozjs/{mozjs-128_128.5.2.bb =3D> mozjs-1=
28_128.14.0.bb} (69%)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/D261512.1755672843.=
patch b/meta-oe/recipes-extended/mozjs/mozjs-128/D261512.1755672843.patch
new file mode 100644
index 0000000000..ddc481bcec
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/D261512.1755672843.patch
@@ -0,0 +1,69 @@
+This patch fixes configure with python 3.14 and was taken from fedora
+
+Upstream-Status: Pending [https://src.fedoraproject.org/fork/churchyard/=
rpms/mozjs128/c/c9a3e719a87ba3313915195802ca6efcb9966fa3]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+
+diff --git a/python/mozbuild/mozbuild/frontend/reader.py b/python/mozbui=
ld/mozbuild/frontend/reader.py
+index 5cb627b..c2dcafe 100644
+--- a/python/mozbuild/mozbuild/frontend/reader.py
++++ b/python/mozbuild/mozbuild/frontend/reader.py
+@@ -470,7 +470,7 @@ class TemplateFunction(object):
+             return c(
+                 ast.Subscript(
+                     value=3Dc(ast.Name(id=3Dself._global_name, ctx=3Das=
t.Load())),
+-                    slice=3Dc(ast.Index(value=3Dc(ast.Str(s=3Dnode.id))=
)),
++                    slice=3Dc(ast.Index(value=3Dc(ast.Constant(value=3D=
node.id)))),
+                     ctx=3Dnode.ctx,
+                 )
+             )
+@@ -1035,8 +1035,8 @@ class BuildReader(object):
+                 else:
+                     # Others
+                     assert isinstance(target.slice, ast.Index)
+-                    assert isinstance(target.slice.value, ast.Str)
+-                    key =3D target.slice.value.s
++                    assert isinstance(target.slice.value, ast.Constant)
++                    key =3D target.slice.value.value
+=20
+             return name, key
+=20
+@@ -1044,11 +1044,11 @@ class BuildReader(object):
+             value =3D node.value
+             if isinstance(value, ast.List):
+                 for v in value.elts:
+-                    assert isinstance(v, ast.Str)
+-                    yield v.s
++                    assert isinstance(v, ast.Constant)
++                    yield v.value
+             else:
+-                assert isinstance(value, ast.Str)
+-                yield value.s
++                assert isinstance(value, ast.Constant)
++                yield value.value
+=20
+         assignments =3D []
+=20
+diff --git a/python/mozbuild/mozbuild/vendor/rewrite_mozbuild.py b/pytho=
n/mozbuild/mozbuild/vendor/rewrite_mozbuild.py
+index 1590267..151d27c 100644
+--- a/python/mozbuild/mozbuild/vendor/rewrite_mozbuild.py
++++ b/python/mozbuild/mozbuild/vendor/rewrite_mozbuild.py
+@@ -327,15 +327,13 @@ def assignment_node_to_source_filename_list(code, =
node):
+     """
+     if isinstance(node.value, ast.List) and "elts" in node.value._field=
s:
+         for f in node.value.elts:
+-            if not isinstance(f, ast.Constant) and not isinstance(f, as=
t.Str):
++            if not isinstance(f, ast.Constant):
+                 log(
+                     "Found non-constant source file name in list: ",
+                     ast_get_source_segment(code, f),
+                 )
+                 return []
+-        return [
+-            f.value if isinstance(f, ast.Constant) else f.s for f in no=
de.value.elts
+-        ]
++        return [f.value for f in node.value.elts]
+     elif isinstance(node.value, ast.ListComp):
+         # SOURCES +=3D [f for f in foo if blah]
+         log("Could not find the files for " + ast_get_source_segment(co=
de, node.value))
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb b/meta-o=
e/recipes-extended/mozjs/mozjs-128_128.14.0.bb
similarity index 69%
rename from meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
rename to meta-oe/recipes-extended/mozjs/mozjs-128_128.14.0.bb
index fbbe3749ba..635cad96cf 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128_128.14.0.bb
@@ -3,22 +3,24 @@ HOMEPAGE =3D "https://developer.mozilla.org/en-US/docs/=
Mozilla/Projects/SpiderMonk
 LICENSE =3D "MPL-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddc9b6ecd19a14a54a628edaaf2373=
3bf"
=20
-SRC_URI =3D "https://archive.mozilla.org/pub/firefox/releases/${PV}esr/s=
ource/firefox-${PV}esr.source.tar.xz \
-           file://0001-Cargo.toml-do-not-abort-on-panic.patch \
-           file://0002-moz.configure-do-not-look-for-llvm-objdump.patch =
\
-           file://0003-rust.configure-do-not-try-to-find-a-suitable-upst=
rea.patch \
-           file://0004-use-asm-sgidefs.h.patch \
-           file://0005-Add-RISCV32-support.patch \
-           file://0006-util.configure-fix-one-occasionally-reproduced-co=
nfi.patch \
-           file://0007-Rewrite-cargo-host-linker-in-python3.patch  \
-           file://0008-Musl-does-not-have-stack-unwinder-like-glibc-ther=
efo.patch \
-           file://0009-Backport-patch-from-firefox-bugzilla-to-fix-compi=
le-.patch \
-           file://0010-The-ISB-instruction-isn-t-available-in-ARMv5-or-v=
6-s.patch \
-           file://0011-Link-with-icu-uc-to-fix-build-with-ICU-76.patch \
-           file://0012-Recognise-riscv64gc-and-riscv32gc-as-valid-archit=
ect.patch \
-           file://0013-Fix-build-error-with-musl.patch \
-           "
-SRC_URI[sha256sum] =3D "25d633eb81499cbda44b8c64fa1c1a5879d55024b864ef49=
5d4997154d68358f"
+SRC_URI =3D " \
+    https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/fir=
efox-${PV}esr.source.tar.xz \
+    file://0001-Cargo.toml-do-not-abort-on-panic.patch \
+    file://0002-moz.configure-do-not-look-for-llvm-objdump.patch \
+    file://0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.pat=
ch \
+    file://0004-use-asm-sgidefs.h.patch \
+    file://0005-Add-RISCV32-support.patch \
+    file://0006-util.configure-fix-one-occasionally-reproduced-confi.pat=
ch \
+    file://0007-Rewrite-cargo-host-linker-in-python3.patch  \
+    file://0008-Musl-does-not-have-stack-unwinder-like-glibc-therefo.pat=
ch \
+    file://0009-Backport-patch-from-firefox-bugzilla-to-fix-compile-.pat=
ch \
+    file://0010-The-ISB-instruction-isn-t-available-in-ARMv5-or-v6-s.pat=
ch \
+    file://0011-Link-with-icu-uc-to-fix-build-with-ICU-76.patch \
+    file://0012-Recognise-riscv64gc-and-riscv32gc-as-valid-architect.pat=
ch \
+    file://0013-Fix-build-error-with-musl.patch \
+    file://D261512.1755672843.patch \
+"
+SRC_URI[sha256sum] =3D "93b9ef6229f41cb22ff109b95bbf61a78395a0fe4b870192=
eeca22947cb09a53"
=20
 UPSTREAM_CHECK_URI =3D "https://tracker.debian.org/pkg/mozjs128"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
--=20
2.52.0


