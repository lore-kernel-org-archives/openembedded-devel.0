Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCE3C76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 13:46:50 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.45390.1681134405935821468
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 06:46:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout02.t-online.de (Postfix) with SMTP id E034529F22
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 15:46:43 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.40.74]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1plrr1-1wfzij0; Mon, 10 Apr 2023 15:46:43 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 1/2] mozjs: update 102.5.0 -> 102.9.0
Date: Mon, 10 Apr 2023 15:46:35 +0200
Message-Id: <20230410134636.459404-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1681134403-837FDC79-5D191214/0/0 CLEAN NORMAL
X-TOI-MSGID: 70a44dac-f9fb-48d1-a351-e9eba7ad5824
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 13:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102031

- remove backport patch

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../mozjs/mozjs-102/py-3.11.patch             | 139 ------------------
 ...js-102_102.5.0.bb =3D> mozjs-102_102.9.0.bb} |   3 +-
 2 files changed, 1 insertion(+), 141 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-102/py-3.11.patc=
h
 rename meta-oe/recipes-extended/mozjs/{mozjs-102_102.5.0.bb =3D> mozjs-1=
02_102.9.0.bb} (95%)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102/py-3.11.patch b/met=
a-oe/recipes-extended/mozjs/mozjs-102/py-3.11.patch
deleted file mode 100644
index 85af54709..000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-102/py-3.11.patch
+++ /dev/null
@@ -1,139 +0,0 @@
-From 1479dd9c75917d2be70ee840c9db141e59987e44 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Wed, 14 Sep 2022 14:03:10 +0200
-Subject: [PATCH] mozjs-91: backport a python 3.11 compatibility patch
-
-# HG changeset patch
-# User ahochheiden <ahochheiden@mozilla.com>
-# Date 1654151264 0
-# Node ID f54162b2c1f2fe52c6137ab2c3469a1944f58b27
-# Parent  6e7776492240c27732840d65a33dcc440fa1aba0
-Bug 1769631 - Remove 'U' from 'mode' parameters for various 'open' calls=
 to ensure Python3.11 compatibility r=3Dfirefox-build-system-reviewers,gl=
andium
-
-The 'U' flag represents "universal newline". It has been deprecated
-since Python3.3. Since then "universal newline" is the default when a
-file is opened in text mode (not bytes). In Python3.11 using the 'U'
-flag throws errors. There should be no harm in removing 'U' from 'open'
-everywhere it is used, and doing allows the use of Python3.11.
-
-For more reading see: https://docs.python.org/3.11/whatsnew/3.11.html#ch=
anges-in-the-python-api
-
-Differential Revision: https://phabricator.services.mozilla.com/D147721
-
-Upstream-Status: Backport [https://hg.mozilla.org/mozilla-central/rev/f5=
4162b2c1f2fe52c6137ab2c3469a1944f58b27]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- dom/base/usecounters.py                                 | 2 +-
- python/mozbuild/mozbuild/action/process_define_files.py | 2 +-
- python/mozbuild/mozbuild/backend/base.py                | 2 +-
- python/mozbuild/mozbuild/preprocessor.py                | 6 +++---
- python/mozbuild/mozbuild/util.py                        | 2 +-
- python/mozbuild/mozpack/files.py                        | 4 ++--
- 6 files changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/dom/base/usecounters.py b/dom/base/usecounters.py
-index 780e3b32b2..7e2c7148ec 100644
---- a/dom/base/usecounters.py
-+++ b/dom/base/usecounters.py
-@@ -8,7 +8,7 @@ import re
-=20
- def read_conf(conf_filename):
-     # Can't read/write from a single StringIO, so make a new one for re=
ading.
--    stream =3D open(conf_filename, "rU")
-+    stream =3D open(conf_filename, "r")
-=20
-     def parse_counters(stream):
-         for line_num, line in enumerate(stream):
-diff --git a/python/mozbuild/mozbuild/action/process_define_files.py b/p=
ython/mozbuild/mozbuild/action/process_define_files.py
-index f1d401ac26..aca59d0f05 100644
---- a/python/mozbuild/mozbuild/action/process_define_files.py
-+++ b/python/mozbuild/mozbuild/action/process_define_files.py
-@@ -36,7 +36,7 @@ def process_define_file(output, input):
-     ) and not config.substs.get("JS_STANDALONE"):
-         config =3D PartialConfigEnvironment(mozpath.join(topobjdir, "js=
", "src"))
-=20
--    with open(path, "rU") as input:
-+    with open(path, "r") as input:
-         r =3D re.compile(
-             "^\s*#\s*(?P<cmd>[a-z]+)(?:\s+(?P<name>\S+)(?:\s+(?P<value>=
\S+))?)?", re.U
-         )
-diff --git a/python/mozbuild/mozbuild/backend/base.py b/python/mozbuild/=
mozbuild/backend/base.py
-index 7bc1986d86..b64a709468 100644
---- a/python/mozbuild/mozbuild/backend/base.py
-+++ b/python/mozbuild/mozbuild/backend/base.py
-@@ -272,7 +272,7 @@ class BuildBackend(LoggingMixin):
-         return status
-=20
-     @contextmanager
--    def _write_file(self, path=3DNone, fh=3DNone, readmode=3D"rU"):
-+    def _write_file(self, path=3DNone, fh=3DNone, readmode=3D"r"):
-         """Context manager to write a file.
-=20
-         This is a glorified wrapper around FileAvoidWrite with integrat=
ion to
-diff --git a/python/mozbuild/mozbuild/preprocessor.py b/python/mozbuild/=
mozbuild/preprocessor.py
-index f7820b9c91..857f1a6c9b 100644
---- a/python/mozbuild/mozbuild/preprocessor.py
-+++ b/python/mozbuild/mozbuild/preprocessor.py
-@@ -531,7 +531,7 @@ class Preprocessor:
-=20
-         if args:
-             for f in args:
--                with io.open(f, "rU", encoding=3D"utf-8") as input:
-+                with io.open(f, "r", encoding=3D"utf-8") as input:
-                     self.processFile(input=3Dinput, output=3Dout)
-             if depfile:
-                 mk =3D Makefile()
-@@ -860,7 +860,7 @@ class Preprocessor:
-                     args =3D self.applyFilters(args)
-                 if not os.path.isabs(args):
-                     args =3D os.path.join(self.curdir, args)
--                args =3D io.open(args, "rU", encoding=3D"utf-8")
-+                args =3D io.open(args, "r", encoding=3D"utf-8")
-             except Preprocessor.Error:
-                 raise
-             except Exception:
-@@ -914,7 +914,7 @@ class Preprocessor:
- def preprocess(includes=3D[sys.stdin], defines=3D{}, output=3Dsys.stdou=
t, marker=3D"#"):
-     pp =3D Preprocessor(defines=3Ddefines, marker=3Dmarker)
-     for f in includes:
--        with io.open(f, "rU", encoding=3D"utf-8") as input:
-+        with io.open(f, "r", encoding=3D"utf-8") as input:
-             pp.processFile(input=3Dinput, output=3Doutput)
-     return pp.includes
-=20
-diff --git a/python/mozbuild/mozbuild/util.py b/python/mozbuild/mozbuild=
/util.py
-index b09f164698..4f1e0cdc5f 100644
---- a/python/mozbuild/mozbuild/util.py
-+++ b/python/mozbuild/mozbuild/util.py
-@@ -236,7 +236,7 @@ class FileAvoidWrite(BytesIO):
-     still occur, as well as diff capture if requested.
-     """
-=20
--    def __init__(self, filename, capture_diff=3DFalse, dry_run=3DFalse,=
 readmode=3D"rU"):
-+    def __init__(self, filename, capture_diff=3DFalse, dry_run=3DFalse,=
 readmode=3D"r"):
-         BytesIO.__init__(self)
-         self.name =3D filename
-         assert type(capture_diff) =3D=3D bool
-diff --git a/python/mozbuild/mozpack/files.py b/python/mozbuild/mozpack/=
files.py
-index 1d8a1ed2d8..a295a67b5a 100644
---- a/python/mozbuild/mozpack/files.py
-+++ b/python/mozbuild/mozpack/files.py
-@@ -554,7 +554,7 @@ class PreprocessedFile(BaseFile):
-         pp =3D Preprocessor(defines=3Dself.defines, marker=3Dself.marke=
r)
-         pp.setSilenceDirectiveWarnings(self.silence_missing_directive_w=
arnings)
-=20
--        with _open(self.path, "rU") as input:
-+        with _open(self.path, "r") as input:
-             with _open(os.devnull, "w") as output:
-                 pp.processFile(input=3Dinput, output=3Doutput)
-=20
-@@ -611,7 +611,7 @@ class PreprocessedFile(BaseFile):
-         pp =3D Preprocessor(defines=3Dself.defines, marker=3Dself.marke=
r)
-         pp.setSilenceDirectiveWarnings(self.silence_missing_directive_w=
arnings)
-=20
--        with _open(self.path, "rU") as input:
-+        with _open(self.path, "r") as input:
-             pp.processFile(input=3Dinput, output=3Ddest, depfile=3Ddeps=
_out)
-=20
-         dest.close()
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102_102.5.0.bb b/meta-o=
e/recipes-extended/mozjs/mozjs-102_102.9.0.bb
similarity index 95%
rename from meta-oe/recipes-extended/mozjs/mozjs-102_102.5.0.bb
rename to meta-oe/recipes-extended/mozjs/mozjs-102_102.9.0.bb
index 5e884b6f6..e6ff379e9 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-102_102.5.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-102_102.9.0.bb
@@ -13,11 +13,10 @@ SRC_URI =3D "https://archive.mozilla.org/pub/firefox/=
releases/${PV}esr/source/fire
            file://riscv32.patch \
            file://0001-util.configure-fix-one-occasionally-reproduced-co=
nfi.patch \
            file://0001-rewrite-cargo-host-linker-in-python3.patch  \
-           file://py-3.11.patch \
            file://musl-disable-stackwalk.patch \
            file://0001-add-arm-to-list-of-mozinline.patch \
            "
-SRC_URI[sha256sum] =3D "017dd44b1285913f477074802707a4c76ed1a28270ec5a32=
7bbb76574cc057d8"
+SRC_URI[sha256sum] =3D "31b074623f09ca821a8a7dee0b3d2df1a45f1164264d31c2=
6b4969a4d6a21dd1"
=20
 S =3D "${WORKDIR}/firefox-${PV}"
=20
--=20
2.34.1


