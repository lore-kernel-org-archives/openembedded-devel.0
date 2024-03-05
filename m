Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7471BC54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 11:56:34 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.21107.1709639783936502198
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Mar 2024 03:56:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout02.t-online.de (Postfix) with SMTP id 3ECB525473
	for <openembedded-devel@lists.openembedded.org>; Tue,  5 Mar 2024 12:56:03 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.161.242]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rhTOs-0Zhskj0; Tue, 5 Mar 2024 12:56:02 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] mozjs-115: update 115.6.0 -> 115.8.0
Date: Tue,  5 Mar 2024 12:56:12 +0100
Message-ID: <20240305115613.1149738-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1709639762-CB7FDDC7-CA4281AA/10/30626521646 SUSPECT URL
X-TOI-MSGID: ececb175-fcfd-45df-bce4-7554988f0647
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 11:56:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109120

- python 3.12 support was added, remove the patch

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../mozjs/mozjs-115/py3.12.patch              | 2496 -----------------
 ...js-115_115.6.0.bb =3D> mozjs-115_115.8.0.bb} |    3 +-
 2 files changed, 1 insertion(+), 2498 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/py3.12.patch
 rename meta-oe/recipes-extended/mozjs/{mozjs-115_115.6.0.bb =3D> mozjs-1=
15_115.8.0.bb} (96%)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/py3.12.patch b/meta=
-oe/recipes-extended/mozjs/mozjs-115/py3.12.patch
deleted file mode 100644
index 732c8ff1c..000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-115/py3.12.patch
+++ /dev/null
@@ -1,2496 +0,0 @@
-From 7293cfae4fd68004901825ad1cabb83424d8729a Mon Sep 17 00:00:00 2001
-From: serge-sans-paille <sguelton@mozilla.com>
-Date: Mon, 16 Oct 2023 13:35:24 +0000
-Subject: [PATCH] Bug 1857492 - Upgrade vendored version of six and urlli=
b3
- r=3Dsaschanaz
-
-six -> 1.16
-urllib3 -> 1.26.17
-
-Differential Revision: https://phabricator.services.mozilla.com/D190288
-Upstream-Status: Backport [https://github.com/mozilla/gecko-dev/commit/7=
293cfae4fd68004901825ad1cabb83424d8729a]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- third_party/python/poetry.lock                |  22 +--
- third_party/python/requirements.in            |   4 +-
- third_party/python/requirements.txt           |  12 +-
- .../python/six/six-1.13.0.dist-info/RECORD    |   6 -
- .../LICENSE                                   |   2 +-
- .../METADATA                                  |   9 +-
- .../python/six/six-1.16.0.dist-info/RECORD    |   6 +
- .../six-1.16.0.dist-info}/WHEEL               |   2 +-
- .../top_level.txt                             |   0
- third_party/python/six/six.py                 |  91 ++++++---
- .../urllib3/urllib3-1.26.0.dist-info/RECORD   |  44 -----
- .../LICENSE.txt                               |   0
- .../METADATA                                  | 177 ++++++++++++++++--
- .../urllib3/urllib3-1.26.17.dist-info/RECORD  |  44 +++++
- .../urllib3-1.26.17.dist-info}/WHEEL          |   2 +-
- .../top_level.txt                             |   0
- .../python/urllib3/urllib3/__init__.py        |  17 ++
- .../python/urllib3/urllib3/_version.py        |   2 +-
- .../python/urllib3/urllib3/connection.py      |  62 ++++--
- .../python/urllib3/urllib3/connectionpool.py  |  97 ++++++++--
- .../contrib/_securetransport/bindings.py      |   2 +-
- .../contrib/_securetransport/low_level.py     |   1 +
- .../urllib3/urllib3/contrib/appengine.py      |   4 +-
- .../urllib3/urllib3/contrib/ntlmpool.py       |  13 +-
- .../urllib3/urllib3/contrib/pyopenssl.py      |  19 +-
- .../urllib3/contrib/securetransport.py        |   5 +-
- .../python/urllib3/urllib3/contrib/socks.py   |   2 +-
- .../python/urllib3/urllib3/exceptions.py      |  12 +-
- .../urllib3/urllib3/packages/__init__.py      |   5 -
- .../packages/backports/weakref_finalize.py    | 155 +++++++++++++++
- .../python/urllib3/urllib3/packages/six.py    | 125 +++++++++----
- .../packages/ssl_match_hostname/__init__.py   |  22 ---
- .../python/urllib3/urllib3/poolmanager.py     |   3 +-
- third_party/python/urllib3/urllib3/request.py |  21 +++
- .../python/urllib3/urllib3/response.py        |  72 ++++++-
- .../python/urllib3/urllib3/util/connection.py |   5 +-
- .../python/urllib3/urllib3/util/proxy.py      |   1 +
- .../python/urllib3/urllib3/util/request.py    |   5 +-
- .../python/urllib3/urllib3/util/retry.py      |  37 +++-
- .../python/urllib3/urllib3/util/ssl_.py       |  53 ++++--
- .../ssl_match_hostname.py}                    |  15 +-
- .../urllib3/urllib3/util/ssltransport.py      |   6 +-
- .../python/urllib3/urllib3/util/timeout.py    |   9 +-
- .../python/urllib3/urllib3/util/url.py        |  17 +-
- .../python/urllib3/urllib3/util/wait.py       |   1 -
- 45 files changed, 934 insertions(+), 275 deletions(-)
- delete mode 100644 third_party/python/six/six-1.13.0.dist-info/RECORD
- rename third_party/python/six/{six-1.13.0.dist-info =3D> six-1.16.0.dis=
t-info}/LICENSE (96%)
- rename third_party/python/six/{six-1.13.0.dist-info =3D> six-1.16.0.dis=
t-info}/METADATA (85%)
- create mode 100644 third_party/python/six/six-1.16.0.dist-info/RECORD
- rename third_party/python/{urllib3/urllib3-1.26.0.dist-info =3D> six/si=
x-1.16.0.dist-info}/WHEEL (70%)
- rename third_party/python/six/{six-1.13.0.dist-info =3D> six-1.16.0.dis=
t-info}/top_level.txt (100%)
- delete mode 100644 third_party/python/urllib3/urllib3-1.26.0.dist-info/=
RECORD
- rename third_party/python/urllib3/{urllib3-1.26.0.dist-info =3D> urllib=
3-1.26.17.dist-info}/LICENSE.txt (100%)
- rename third_party/python/urllib3/{urllib3-1.26.0.dist-info =3D> urllib=
3-1.26.17.dist-info}/METADATA (86%)
- create mode 100644 third_party/python/urllib3/urllib3-1.26.17.dist-info=
/RECORD
- rename third_party/python/{six/six-1.13.0.dist-info =3D> urllib3/urllib=
3-1.26.17.dist-info}/WHEEL (70%)
- rename third_party/python/urllib3/{urllib3-1.26.0.dist-info =3D> urllib=
3-1.26.17.dist-info}/top_level.txt (100%)
- create mode 100644 third_party/python/urllib3/urllib3/packages/backport=
s/weakref_finalize.py
- delete mode 100644 third_party/python/urllib3/urllib3/packages/ssl_matc=
h_hostname/__init__.py
- rename third_party/python/urllib3/urllib3/{packages/ssl_match_hostname/=
_implementation.py =3D> util/ssl_match_hostname.py} (92%)
-
-diff --git a/third_party/python/poetry.lock b/third_party/python/poetry.=
lock
-index 3d50174e58bcb..b4a8455d20fb4 100644
---- a/third_party/python/poetry.lock
-+++ b/third_party/python/poetry.lock
-@@ -1333,14 +1333,14 @@ testing-integration =3D ["build[virtualenv]", "f=
ilelock (>=3D3.4.0)", "jaraco.envs (
-=20
- [[package]]
- name =3D "six"
--version =3D "1.13.0"
-+version =3D "1.16.0"
- description =3D "Python 2 and 3 compatibility utilities"
- category =3D "main"
- optional =3D false
--python-versions =3D ">=3D2.6, !=3D3.0.*, !=3D3.1.*"
-+python-versions =3D ">=3D2.7, !=3D3.0.*, !=3D3.1.*, !=3D3.2.*"
- files =3D [
--    {file =3D "six-1.13.0-py2.py3-none-any.whl", hash =3D "sha256:1f1b7=
d42e254082a9db6279deae68afb421ceba6158efa6131de7b3003ee93fd"},
--    {file =3D "six-1.13.0.tar.gz", hash =3D "sha256:30f610279e8b2578cab=
6db20741130331735c781b56053c59c4076da27f06b66"},
-+    {file =3D "six-1.16.0-py2.py3-none-any.whl", hash =3D "sha256:8abb2=
f1d86890a2dfb989f9a77cfcfd3e47c2a354b01111771326f8aa26e0254"},
-+    {file =3D "six-1.16.0.tar.gz", hash =3D "sha256:1e61c37477a1626458e=
36f7b1d82aa5c9b094fa4802892072e49de9c60c4c926"},
- ]
-=20
- [[package]]
-@@ -1491,19 +1491,19 @@ files =3D [
-=20
- [[package]]
- name =3D "urllib3"
--version =3D "1.26.0"
-+version =3D "1.26.17"
- description =3D "HTTP library with thread-safe connection pooling, file=
 post, and more."
- category =3D "main"
- optional =3D false
--python-versions =3D ">=3D2.7, !=3D3.0.*, !=3D3.1.*, !=3D3.2.*, !=3D3.3.=
*, !=3D3.4.*, <4"
-+python-versions =3D ">=3D2.7, !=3D3.0.*, !=3D3.1.*, !=3D3.2.*, !=3D3.3.=
*, !=3D3.4.*, !=3D3.5.*"
- files =3D [
--    {file =3D "urllib3-1.26.0-py2.py3-none-any.whl", hash =3D "sha256:b=
ad31cb622ceee0ab46c4c884cf61957def0ff2e644de0a7a093678844c9ccac"},
--    {file =3D "urllib3-1.26.0.tar.gz", hash =3D "sha256:4849f132941d681=
44df0a3785ccc4fe423430ba5db0108d045c8cadbc90f517a"},
-+    {file =3D "urllib3-1.26.17-py2.py3-none-any.whl", hash =3D "sha256:=
94a757d178c9be92ef5539b8840d48dc9cf1b2709c9d6b588232a055c524458b"},
-+    {file =3D "urllib3-1.26.17.tar.gz", hash =3D "sha256:24d6a242c28d29=
af46c3fae832c36db3bbebcc533dd1bb549172cd739c82df21"},
- ]
-=20
- [package.extras]
--brotli =3D ["brotlipy (>=3D0.6.0)"]
--secure =3D ["certifi", "cryptography (>=3D1.3.4)", "idna (>=3D2.0.0)", =
"ipaddress", "pyOpenSSL (>=3D0.14)"]
-+brotli =3D ["brotli (=3D=3D1.0.9)", "brotli (>=3D1.0.9)", "brotlicffi (=
>=3D0.8.0)", "brotlipy (>=3D0.6.0)"]
-+secure =3D ["certifi", "cryptography (>=3D1.3.4)", "idna (>=3D2.0.0)", =
"ipaddress", "pyOpenSSL (>=3D0.14)", "urllib3-secure-extra"]
- socks =3D ["PySocks (>=3D1.5.6,!=3D1.5.7,<2.0)"]
-=20
- [[package]]
-diff --git a/third_party/python/six/six-1.13.0.dist-info/RECORD b/third_=
party/python/six/six-1.13.0.dist-info/RECORD
-deleted file mode 100644
-index a0e6c1fd4bd99..0000000000000
---- a/third_party/python/six/six-1.13.0.dist-info/RECORD
-+++ /dev/null
-@@ -1,6 +0,0 @@
--six.py,sha256=3DbsEzSFTZTx49wQttLORmSZTrpjGc8UbXt-HBa_LZX7Q,33045
--six-1.13.0.dist-info/LICENSE,sha256=3Dt1KbjAcXGniow2wyg5BVKOSBKUXZd9El6=
5JujMvyRbY,1066
--six-1.13.0.dist-info/METADATA,sha256=3DhxS4rSPRfO8ewbcLS30anoFi6LFgUQ3m=
k_xknZ8RV4w,1940
--six-1.13.0.dist-info/WHEEL,sha256=3D8zNYZbwQSXoB9IfXOjPfeNwvAsALAjffgk2=
7FqvCWbo,110
--six-1.13.0.dist-info/top_level.txt,sha256=3D_iVH_iYEtEXnD8nYGQYpYFUvkUW=
9sEO1GYbkeKSAais,4
--six-1.13.0.dist-info/RECORD,,
-diff --git a/third_party/python/six/six-1.13.0.dist-info/LICENSE b/third=
_party/python/six/six-1.16.0.dist-info/LICENSE
-similarity index 96%
-rename from third_party/python/six/six-1.13.0.dist-info/LICENSE
-rename to third_party/python/six/six-1.16.0.dist-info/LICENSE
-index 4b05a545261c0..de6633112c1f9 100644
---- a/third_party/python/six/six-1.13.0.dist-info/LICENSE
-+++ b/third_party/python/six/six-1.16.0.dist-info/LICENSE
-@@ -1,4 +1,4 @@
--Copyright (c) 2010-2019 Benjamin Peterson
-+Copyright (c) 2010-2020 Benjamin Peterson
-=20
- Permission is hereby granted, free of charge, to any person obtaining a=
 copy of
- this software and associated documentation files (the "Software"), to d=
eal in
-diff --git a/third_party/python/six/six-1.13.0.dist-info/METADATA b/thir=
d_party/python/six/six-1.16.0.dist-info/METADATA
-similarity index 85%
-rename from third_party/python/six/six-1.13.0.dist-info/METADATA
-rename to third_party/python/six/six-1.16.0.dist-info/METADATA
-index b0c8f51e1f366..6d7525c2ebcfe 100644
---- a/third_party/python/six/six-1.13.0.dist-info/METADATA
-+++ b/third_party/python/six/six-1.16.0.dist-info/METADATA
-@@ -1,6 +1,6 @@
- Metadata-Version: 2.1
- Name: six
--Version: 1.13.0
-+Version: 1.16.0
- Summary: Python 2 and 3 compatibility utilities
- Home-page: https://github.com/benjaminp/six
- Author: Benjamin Peterson
-@@ -14,7 +14,7 @@ Classifier: Intended Audience :: Developers
- Classifier: License :: OSI Approved :: MIT License
- Classifier: Topic :: Software Development :: Libraries
- Classifier: Topic :: Utilities
--Requires-Python: >=3D2.6, !=3D3.0.*, !=3D3.1.*
-+Requires-Python: >=3D2.7, !=3D3.0.*, !=3D3.1.*, !=3D3.2.*
-=20
- .. image:: https://img.shields.io/pypi/v/six.svg
-    :target: https://pypi.org/project/six/
-@@ -37,7 +37,7 @@ for smoothing over the differences between the Python =
versions with the goal of
- writing Python code that is compatible on both Python versions.  See th=
e
- documentation for more information on what is provided.
-=20
--Six supports every Python version since 2.6.  It is contained in only o=
ne Python
-+Six supports Python 2.7 and 3.3+.  It is contained in only one Python
- file, so it can be easily copied into your project. (The copyright and =
license
- notice must be retained.)
-=20
-@@ -46,7 +46,4 @@ Online documentation is at https://six.readthedocs.io/=
.
- Bugs can be reported to https://github.com/benjaminp/six.  The code can=
 also
- be found there.
-=20
--For questions about six or porting in general, email the python-porting=
 mailing
--list: https://mail.python.org/mailman/listinfo/python-porting
--
-=20
-diff --git a/third_party/python/six/six-1.16.0.dist-info/RECORD b/third_=
party/python/six/six-1.16.0.dist-info/RECORD
-new file mode 100644
-index 0000000000000..8de4af79fae0b
---- /dev/null
-+++ b/third_party/python/six/six-1.16.0.dist-info/RECORD
-@@ -0,0 +1,6 @@
-+six.py,sha256=3DTOOfQi7nFGfMrIvtdr6wX4wyHH8M7aknmuLfo2cBBrM,34549
-+six-1.16.0.dist-info/LICENSE,sha256=3Di7hQxWWqOJ_cFvOkaWWtI9gq3_YPI5P8J=
2K2MYXo5sk,1066
-+six-1.16.0.dist-info/METADATA,sha256=3DVQcGIFCAEmfZcl77E5riPCN4v2TIsc_q=
tacnjxKHJoI,1795
-+six-1.16.0.dist-info/WHEEL,sha256=3DZ-nyYpwrcSqxfdux5Mbn_DQ525iP7J2DG3J=
gGvOYyTQ,110
-+six-1.16.0.dist-info/top_level.txt,sha256=3D_iVH_iYEtEXnD8nYGQYpYFUvkUW=
9sEO1GYbkeKSAais,4
-+six-1.16.0.dist-info/RECORD,,
-diff --git a/third_party/python/urllib3/urllib3-1.26.0.dist-info/WHEEL b=
/third_party/python/six/six-1.16.0.dist-info/WHEEL
-similarity index 70%
-rename from third_party/python/urllib3/urllib3-1.26.0.dist-info/WHEEL
-rename to third_party/python/six/six-1.16.0.dist-info/WHEEL
-index 6d38aa0601b31..01b8fc7d4a10c 100644
---- a/third_party/python/urllib3/urllib3-1.26.0.dist-info/WHEEL
-+++ b/third_party/python/six/six-1.16.0.dist-info/WHEEL
-@@ -1,5 +1,5 @@
- Wheel-Version: 1.0
--Generator: bdist_wheel (0.35.1)
-+Generator: bdist_wheel (0.36.2)
- Root-Is-Purelib: true
- Tag: py2-none-any
- Tag: py3-none-any
-diff --git a/third_party/python/six/six-1.13.0.dist-info/top_level.txt b=
/third_party/python/six/six-1.16.0.dist-info/top_level.txt
-similarity index 100%
-rename from third_party/python/six/six-1.13.0.dist-info/top_level.txt
-rename to third_party/python/six/six-1.16.0.dist-info/top_level.txt
-diff --git a/third_party/python/six/six.py b/third_party/python/six/six.=
py
-index 357e624abc6c9..4e15675d8b5ca 100644
---- a/third_party/python/six/six.py
-+++ b/third_party/python/six/six.py
-@@ -1,4 +1,4 @@
--# Copyright (c) 2010-2019 Benjamin Peterson
-+# Copyright (c) 2010-2020 Benjamin Peterson
- #
- # Permission is hereby granted, free of charge, to any person obtaining=
 a copy
- # of this software and associated documentation files (the "Software"),=
 to deal
-@@ -29,7 +29,7 @@
- import types
-=20
- __author__ =3D "Benjamin Peterson <benjamin@python.org>"
--__version__ =3D "1.13.0"
-+__version__ =3D "1.16.0"
-=20
-=20
- # Useful for very coarse version differentiation.
-@@ -71,6 +71,11 @@ def __len__(self):
-             MAXSIZE =3D int((1 << 63) - 1)
-         del X
-=20
-+if PY34:
-+    from importlib.util import spec_from_loader
-+else:
-+    spec_from_loader =3D None
-+
-=20
- def _add_doc(func, doc):
-     """Add documentation to a function."""
-@@ -186,6 +191,11 @@ def find_module(self, fullname, path=3DNone):
-             return self
-         return None
-=20
-+    def find_spec(self, fullname, path, target=3DNone):
-+        if fullname in self.known_modules:
-+            return spec_from_loader(fullname, self)
-+        return None
-+
-     def __get_module(self, fullname):
-         try:
-             return self.known_modules[fullname]
-@@ -223,6 +233,12 @@ def get_code(self, fullname):
-         return None
-     get_source =3D get_code  # same as get_code
-=20
-+    def create_module(self, spec):
-+        return self.load_module(spec.name)
-+
-+    def exec_module(self, module):
-+        pass
-+
- _importer =3D _SixMetaPathImporter(__name__)
-=20
-=20
-@@ -259,7 +275,7 @@ class _MovedItems(_LazyModule):
-     MovedModule("copyreg", "copy_reg"),
-     MovedModule("dbm_gnu", "gdbm", "dbm.gnu"),
-     MovedModule("dbm_ndbm", "dbm", "dbm.ndbm"),
--    MovedModule("_dummy_thread", "dummy_thread", "_dummy_thread"),
-+    MovedModule("_dummy_thread", "dummy_thread", "_dummy_thread" if sys=
.version_info < (3, 9) else "_thread"),
-     MovedModule("http_cookiejar", "cookielib", "http.cookiejar"),
-     MovedModule("http_cookies", "Cookie", "http.cookies"),
-     MovedModule("html_entities", "htmlentitydefs", "html.entities"),
-@@ -644,9 +660,11 @@ def u(s):
-     if sys.version_info[1] <=3D 1:
-         _assertRaisesRegex =3D "assertRaisesRegexp"
-         _assertRegex =3D "assertRegexpMatches"
-+        _assertNotRegex =3D "assertNotRegexpMatches"
-     else:
-         _assertRaisesRegex =3D "assertRaisesRegex"
-         _assertRegex =3D "assertRegex"
-+        _assertNotRegex =3D "assertNotRegex"
- else:
-     def b(s):
-         return s
-@@ -668,6 +686,7 @@ def indexbytes(buf, i):
-     _assertCountEqual =3D "assertItemsEqual"
-     _assertRaisesRegex =3D "assertRaisesRegexp"
-     _assertRegex =3D "assertRegexpMatches"
-+    _assertNotRegex =3D "assertNotRegexpMatches"
- _add_doc(b, """Byte literal""")
- _add_doc(u, """Text literal""")
-=20
-@@ -684,6 +703,10 @@ def assertRegex(self, *args, **kwargs):
-     return getattr(self, _assertRegex)(*args, **kwargs)
-=20
-=20
-+def assertNotRegex(self, *args, **kwargs):
-+    return getattr(self, _assertNotRegex)(*args, **kwargs)
-+
-+
- if PY3:
-     exec_ =3D getattr(moves.builtins, "exec")
-=20
-@@ -719,16 +742,7 @@ def exec_(_code_, _globs_=3DNone, _locs_=3DNone):
- """)
-=20
-=20
--if sys.version_info[:2] =3D=3D (3, 2):
--    exec_("""def raise_from(value, from_value):
--    try:
--        if from_value is None:
--            raise value
--        raise value from from_value
--    finally:
--        value =3D None
--""")
--elif sys.version_info[:2] > (3, 2):
-+if sys.version_info[:2] > (3,):
-     exec_("""def raise_from(value, from_value):
-     try:
-         raise value from from_value
-@@ -808,13 +822,33 @@ def print_(*args, **kwargs):
- _add_doc(reraise, """Reraise an exception.""")
-=20
- if sys.version_info[0:2] < (3, 4):
-+    # This does exactly the same what the :func:`py3:functools.update_w=
rapper`
-+    # function does on Python versions after 3.2. It sets the ``__wrapp=
ed__``
-+    # attribute on ``wrapper`` object and it doesn't raise an error if =
any of
-+    # the attributes mentioned in ``assigned`` and ``updated`` are miss=
ing on
-+    # ``wrapped`` object.
-+    def _update_wrapper(wrapper, wrapped,
-+                        assigned=3Dfunctools.WRAPPER_ASSIGNMENTS,
-+                        updated=3Dfunctools.WRAPPER_UPDATES):
-+        for attr in assigned:
-+            try:
-+                value =3D getattr(wrapped, attr)
-+            except AttributeError:
-+                continue
-+            else:
-+                setattr(wrapper, attr, value)
-+        for attr in updated:
-+            getattr(wrapper, attr).update(getattr(wrapped, attr, {}))
-+        wrapper.__wrapped__ =3D wrapped
-+        return wrapper
-+    _update_wrapper.__doc__ =3D functools.update_wrapper.__doc__
-+
-     def wraps(wrapped, assigned=3Dfunctools.WRAPPER_ASSIGNMENTS,
-               updated=3Dfunctools.WRAPPER_UPDATES):
--        def wrapper(f):
--            f =3D functools.wraps(wrapped, assigned, updated)(f)
--            f.__wrapped__ =3D wrapped
--            return f
--        return wrapper
-+        return functools.partial(_update_wrapper, wrapped=3Dwrapped,
-+                                 assigned=3Dassigned, updated=3Dupdated=
)
-+    wraps.__doc__ =3D functools.wraps.__doc__
-+
- else:
-     wraps =3D functools.wraps
-=20
-@@ -872,12 +906,11 @@ def ensure_binary(s, encoding=3D'utf-8', errors=3D=
'strict'):
-       - `str` -> encoded to `bytes`
-       - `bytes` -> `bytes`
-     """
-+    if isinstance(s, binary_type):
-+        return s
-     if isinstance(s, text_type):
-         return s.encode(encoding, errors)
--    elif isinstance(s, binary_type):
--        return s
--    else:
--        raise TypeError("not expecting type '%s'" % type(s))
-+    raise TypeError("not expecting type '%s'" % type(s))
-=20
-=20
- def ensure_str(s, encoding=3D'utf-8', errors=3D'strict'):
-@@ -891,12 +924,15 @@ def ensure_str(s, encoding=3D'utf-8', errors=3D'st=
rict'):
-       - `str` -> `str`
-       - `bytes` -> decoded to `str`
-     """
--    if not isinstance(s, (text_type, binary_type)):
--        raise TypeError("not expecting type '%s'" % type(s))
-+    # Optimization: Fast return for the common case.
-+    if type(s) is str:
-+        return s
-     if PY2 and isinstance(s, text_type):
--        s =3D s.encode(encoding, errors)
-+        return s.encode(encoding, errors)
-     elif PY3 and isinstance(s, binary_type):
--        s =3D s.decode(encoding, errors)
-+        return s.decode(encoding, errors)
-+    elif not isinstance(s, (text_type, binary_type)):
-+        raise TypeError("not expecting type '%s'" % type(s))
-     return s
-=20
-=20
-@@ -919,10 +955,9 @@ def ensure_text(s, encoding=3D'utf-8', errors=3D'st=
rict'):
-         raise TypeError("not expecting type '%s'" % type(s))
-=20
-=20
--
- def python_2_unicode_compatible(klass):
-     """
--    A decorator that defines __unicode__ and __str__ methods under Pyth=
on 2.
-+    A class decorator that defines __unicode__ and __str__ methods unde=
r Python 2.
-     Under Python 3 it does nothing.
-=20
-     To support Python 2 and 3 with a single code base, define a __str__=
 method
-diff --git a/third_party/python/urllib3/urllib3-1.26.0.dist-info/RECORD =
b/third_party/python/urllib3/urllib3-1.26.0.dist-info/RECORD
-deleted file mode 100644
-index ec9088a111a41..0000000000000
---- a/third_party/python/urllib3/urllib3-1.26.0.dist-info/RECORD
-+++ /dev/null
-@@ -1,44 +0,0 @@
--urllib3/__init__.py,sha256=3Dj3yzHIbmW7CS-IKQJ9-PPQf_YKO8EOAey_rMW0UR7u=
s,2763
--urllib3/_collections.py,sha256=3DRp1mVyBgc_UlAcp6M3at1skJBXR5J43NawRTvW=
2g_XY,10811
--urllib3/_version.py,sha256=3DH0vLQ8PY350EPZlZQa8ri0tEjVS-xhGdQOHcU360-0=
A,63
--urllib3/connection.py,sha256=3DBdaUSNpGzO0zq28i9MhOXb6QZspeVdVrYtjnkk2E=
qg4,18396
--urllib3/connectionpool.py,sha256=3DIKoeuJZY9YAYm0GK4q-MXAhyXW0M_FnvabYa=
NsDIR-E,37133
--urllib3/exceptions.py,sha256=3DlNrKC5J8zeBXIu9SSKSNb7cLi8iXl9ARu9DHD2Sf=
lZM,7810
--urllib3/fields.py,sha256=3DkvLDCg_JmH1lLjUUEY_FLS8UhY7hBvDPuVETbY8mdrM,=
8579
--urllib3/filepost.py,sha256=3D5b_qqgRHVlL7uLtdAYBzBh-GHmU5AfJVt_2N0XS3Pe=
Y,2440
--urllib3/poolmanager.py,sha256=3DwhzlX6UTEgODMOCy0ZDMUONRBCz5wyIM8Z9opXA=
Y-Lk,19763
--urllib3/request.py,sha256=3DZFSIqX0C6WizixecChZ3_okyu7BEv0lZu1VT0s6h4SM=
,5985
--urllib3/response.py,sha256=3DhGhGBh7TkEkh_IQg5C1W_xuPNrgIKv5BUXPyE-q0Lu=
E,28203
--urllib3/contrib/__init__.py,sha256=3D47DEQpj8HBSa-_TImW-5JCeuQeRkm5NMpJ=
WZG3hSuFU,0
--urllib3/contrib/_appengine_environ.py,sha256=3DbDbyOEhW2CKLJcQqAKAyrEHN=
-aklsyHFKq6vF8ZFsmk,957
--urllib3/contrib/appengine.py,sha256=3D7Pxb0tKfDB_LTGPERiswH0qomhDoUUOo5=
kwybAKLQyE,11010
--urllib3/contrib/ntlmpool.py,sha256=3D6I95h1_71fzxmoMSNtY0gB8lnyCoVtP_Dp=
qFGj14fdU,4160
--urllib3/contrib/pyopenssl.py,sha256=3Dvgh6j52w9xgwq-3R2kfB5M2JblQATJfKA=
K3lIAc1kSg,16778
--urllib3/contrib/securetransport.py,sha256=3DKxGPZk8d4YepWm7Rc-SBt1XrzIf=
nLKc8JkUVV75XzgE,34286
--urllib3/contrib/socks.py,sha256=3DDcRjM2l0rQMIyhYrN6r-tnVkY6ZTDxHJlM8_u=
sAkGCA,7097
--urllib3/contrib/_securetransport/__init__.py,sha256=3D47DEQpj8HBSa-_TIm=
W-5JCeuQeRkm5NMpJWZG3hSuFU,0
--urllib3/contrib/_securetransport/bindings.py,sha256=3DE1_7ScsgOchfxneoz=
bAueK7ziCwF35fna4DuDCYJ9_o,17637
--urllib3/contrib/_securetransport/low_level.py,sha256=3DlgIdsSycqfB0Xm5B=
iJzXGeIKT7ybCQMFPJAgkcwPa1s,13908
--urllib3/packages/__init__.py,sha256=3Dh4BLhD4tLaBx1adaDtKXfupsgqY0wWLXb=
_f1_yVlV6A,108
--urllib3/packages/six.py,sha256=3Dadx4z-eM_D0Vvu0IIqVzFACQ_ux9l64y7DkSEf=
bxCDs,32536
--urllib3/packages/backports/__init__.py,sha256=3D47DEQpj8HBSa-_TImW-5JCe=
uQeRkm5NMpJWZG3hSuFU,0
--urllib3/packages/backports/makefile.py,sha256=3Dnbzt3i0agPVP07jqqgjhaYj=
MmuAi_W5E0EywZivVO8E,1417
--urllib3/packages/ssl_match_hostname/__init__.py,sha256=3DzppezdEQdpGsYe=
rI6mV6MfUYy495JV4mcOWC_GgbljU,757
--urllib3/packages/ssl_match_hostname/_implementation.py,sha256=3D6dZ-q07=
4g7XhsJ27MFCgkct8iVNZB3sMZvKhf-KUVy0,5679
--urllib3/util/__init__.py,sha256=3DJEmSmmqqLyaw8P51gUImZh8Gwg9i1zSe-DoqA=
itn2nc,1155
--urllib3/util/connection.py,sha256=3D21B-LX0c8fkxPDssyHCaK0pCnmrKmhltg5E=
oouHiAPU,4910
--urllib3/util/proxy.py,sha256=3DFGipAEnvZteyldXNjce4DEB7YzwU-a5lep8y5S0q=
HQg,1604
--urllib3/util/queue.py,sha256=3DnRgX8_eX-_VkvxoX096QWoz8Ps0QHUAExILCY_7P=
ncM,498
--urllib3/util/request.py,sha256=3DNnzaEKQ1Pauw5MFMV6HmgEMHITf0Aua9fQuzi2=
uZzGc,4123
--urllib3/util/response.py,sha256=3DGJpg3Egi9qaJXRwBh5wv-MNuRWan5BIu40oRe=
oxWP28,3510
--urllib3/util/retry.py,sha256=3Dtn168HDMUynFmXRP-uVaLRUOlbTEJikoB1RuZdwf=
Ces,21366
--urllib3/util/ssl_.py,sha256=3DcUsmU604z2zAOZcaXDpINXOokQ1RtlJMe96TBDkaJ=
p0,16199
--urllib3/util/ssltransport.py,sha256=3DIvGQvs9YWkf4jzfqVjTu_UWjwAUgPn5Ac=
tajW8VLz6A,6908
--urllib3/util/timeout.py,sha256=3DQSbBUNOB9yh6AnDn61SrLQ0hg5oz0I9-uXEG91=
AJuIg,10003
--urllib3/util/url.py,sha256=3DLWfLSlI4l2FmUMKfCkElCaW10-0N-sJDT9bxaDZJkj=
s,13964
--urllib3/util/wait.py,sha256=3D3MUKRSAUJDB2tgco7qRUskW0zXGAWYvRRE4Q1_6xl=
Ls,5404
--urllib3-1.26.0.dist-info/LICENSE.txt,sha256=3Dw3vxhuJ8-dvpYZ5V7f486nswC=
RzrPaY8fay-Dm13kHs,1115
--urllib3-1.26.0.dist-info/METADATA,sha256=3DWghdt6nLf9HfZHhWj8Dpgz4n9vGR=
qXYhdIwJRPgki6M,42629
--urllib3-1.26.0.dist-info/WHEEL,sha256=3DADKeyaGyKF5DwBNE0sRE5pvW-bSkFMJ=
fBuhzZ3rceP4,110
--urllib3-1.26.0.dist-info/top_level.txt,sha256=3DEMiXL2sKrTcmrMxIHTqdc3E=
T54pQI2Y072LexFEemvo,8
--urllib3-1.26.0.dist-info/RECORD,,
-diff --git a/third_party/python/urllib3/urllib3-1.26.0.dist-info/LICENSE=
.txt b/third_party/python/urllib3/urllib3-1.26.17.dist-info/LICENSE.txt
-similarity index 100%
-rename from third_party/python/urllib3/urllib3-1.26.0.dist-info/LICENSE.=
txt
-rename to third_party/python/urllib3/urllib3-1.26.17.dist-info/LICENSE.t=
xt
-diff --git a/third_party/python/urllib3/urllib3-1.26.0.dist-info/METADAT=
A b/third_party/python/urllib3/urllib3-1.26.17.dist-info/METADATA
-similarity index 86%
-rename from third_party/python/urllib3/urllib3-1.26.0.dist-info/METADATA
-rename to third_party/python/urllib3/urllib3-1.26.17.dist-info/METADATA
-index 39869aafada8a..9493faee66c01 100644
---- a/third_party/python/urllib3/urllib3-1.26.0.dist-info/METADATA
-+++ b/third_party/python/urllib3/urllib3-1.26.17.dist-info/METADATA
-@@ -1,6 +1,6 @@
- Metadata-Version: 2.1
- Name: urllib3
--Version: 1.26.0
-+Version: 1.26.17
- Summary: HTTP library with thread-safe connection pooling, file post, a=
nd more.
- Home-page: https://urllib3.readthedocs.io/
- Author: Andrey Petrov
-@@ -10,7 +10,6 @@ Project-URL: Documentation, https://urllib3.readthedoc=
s.io/
- Project-URL: Code, https://github.com/urllib3/urllib3
- Project-URL: Issue tracker, https://github.com/urllib3/urllib3/issues
- Keywords: urllib httplib threadsafe filepost http https ssl pooling
--Platform: UNKNOWN
- Classifier: Environment :: Web Environment
- Classifier: Intended Audience :: Developers
- Classifier: License :: OSI Approved :: MIT License
-@@ -19,27 +18,33 @@ Classifier: Programming Language :: Python
- Classifier: Programming Language :: Python :: 2
- Classifier: Programming Language :: Python :: 2.7
- Classifier: Programming Language :: Python :: 3
--Classifier: Programming Language :: Python :: 3.5
- Classifier: Programming Language :: Python :: 3.6
- Classifier: Programming Language :: Python :: 3.7
- Classifier: Programming Language :: Python :: 3.8
- Classifier: Programming Language :: Python :: 3.9
-+Classifier: Programming Language :: Python :: 3.10
-+Classifier: Programming Language :: Python :: 3.11
- Classifier: Programming Language :: Python :: Implementation :: CPython
- Classifier: Programming Language :: Python :: Implementation :: PyPy
- Classifier: Topic :: Internet :: WWW/HTTP
- Classifier: Topic :: Software Development :: Libraries
--Requires-Python: >=3D2.7, !=3D3.0.*, !=3D3.1.*, !=3D3.2.*, !=3D3.3.*, !=
=3D3.4.*, <4
-+Requires-Python: >=3D2.7, !=3D3.0.*, !=3D3.1.*, !=3D3.2.*, !=3D3.3.*, !=
=3D3.4.*, !=3D3.5.*
- Description-Content-Type: text/x-rst
-+License-File: LICENSE.txt
- Provides-Extra: brotli
--Requires-Dist: brotlipy (>=3D0.6.0) ; extra =3D=3D 'brotli'
-+Requires-Dist: brotlicffi >=3D0.8.0 ; ((os_name !=3D "nt" or python_ver=
sion >=3D "3") and platform_python_implementation !=3D "CPython") and ext=
ra =3D=3D 'brotli'
-+Requires-Dist: brotli =3D=3D1.0.9 ; (os_name !=3D "nt" and python_versi=
on < "3" and platform_python_implementation =3D=3D "CPython") and extra =3D=
=3D 'brotli'
-+Requires-Dist: brotlipy >=3D0.6.0 ; (os_name =3D=3D "nt" and python_ver=
sion < "3") and extra =3D=3D 'brotli'
-+Requires-Dist: brotli >=3D1.0.9 ; (python_version >=3D "3" and platform=
_python_implementation =3D=3D "CPython") and extra =3D=3D 'brotli'
- Provides-Extra: secure
--Requires-Dist: pyOpenSSL (>=3D0.14) ; extra =3D=3D 'secure'
--Requires-Dist: cryptography (>=3D1.3.4) ; extra =3D=3D 'secure'
--Requires-Dist: idna (>=3D2.0.0) ; extra =3D=3D 'secure'
-+Requires-Dist: pyOpenSSL >=3D0.14 ; extra =3D=3D 'secure'
-+Requires-Dist: cryptography >=3D1.3.4 ; extra =3D=3D 'secure'
-+Requires-Dist: idna >=3D2.0.0 ; extra =3D=3D 'secure'
- Requires-Dist: certifi ; extra =3D=3D 'secure'
-+Requires-Dist: urllib3-secure-extra ; extra =3D=3D 'secure'
- Requires-Dist: ipaddress ; (python_version =3D=3D "2.7") and extra =3D=3D=
 'secure'
- Provides-Extra: socks
--Requires-Dist: PySocks (!=3D1.5.7,<2.0,>=3D1.5.6) ; extra =3D=3D 'socks=
'
-+Requires-Dist: PySocks !=3D1.5.7,<2.0,>=3D1.5.6 ; extra =3D=3D 'socks'
-=20
-=20
- urllib3 is a powerful, *user-friendly* HTTP client for Python. Much of =
the
-@@ -78,8 +83,10 @@ urllib3 can be installed with `pip <https://pip.pypa.=
io>`_::
-=20
- Alternatively, you can grab the latest source code from `GitHub <https:=
//github.com/urllib3/urllib3>`_::
-=20
--    $ git clone git://github.com/urllib3/urllib3.git
--    $ python setup.py install
-+    $ git clone https://github.com/urllib3/urllib3.git
-+    $ cd urllib3
-+    $ git checkout 1.26.x
-+    $ pip install .
-=20
-=20
- Documentation
-@@ -148,6 +155,152 @@ For Enterprise
- Changes
- =3D=3D=3D=3D=3D=3D=3D
-=20
-+1.26.17 (2023-10-02)
-+--------------------
-+
-+* Added the ``Cookie`` header to the list of headers to strip from requ=
ests when redirecting to a different host. As before, different headers c=
an be set via ``Retry.remove_headers_on_redirect``.
-+
-+
-+1.26.16 (2023-05-23)
-+--------------------
-+
-+* Fixed thread-safety issue where accessing a ``PoolManager`` with many=
 distinct origins
-+  would cause connection pools to be closed while requests are in progr=
ess (`#2954 <https://github.com/urllib3/urllib3/pull/2954>`_)
-+
-+
-+1.26.15 (2023-03-10)
-+--------------------
-+
-+* Fix socket timeout value when ``HTTPConnection`` is reused (`#2645 <h=
ttps://github.com/urllib3/urllib3/issues/2645>`__)
-+* Remove "!" character from the unreserved characters in IPv6 Zone ID p=
arsing
-+  (`#2899 <https://github.com/urllib3/urllib3/issues/2899>`__)
-+* Fix IDNA handling of '\x80' byte (`#2901 <https://github.com/urllib3/=
urllib3/issues/2901>`__)
-+
-+1.26.14 (2023-01-11)
-+--------------------
-+
-+* Fixed parsing of port 0 (zero) returning None, instead of 0. (`#2850 =
<https://github.com/urllib3/urllib3/issues/2850>`__)
-+* Removed deprecated getheaders() calls in contrib module.
-+
-+1.26.13 (2022-11-23)
-+--------------------
-+
-+* Deprecated the ``HTTPResponse.getheaders()`` and ``HTTPResponse.gethe=
ader()`` methods.
-+* Fixed an issue where parsing a URL with leading zeroes in the port wo=
uld be rejected
-+  even when the port number after removing the zeroes was valid.
-+* Fixed a deprecation warning when using cryptography v39.0.0.
-+* Removed the ``<4`` in the ``Requires-Python`` packaging metadata fiel=
d.
-+
-+
-+1.26.12 (2022-08-22)
-+--------------------
-+
-+* Deprecated the `urllib3[secure]` extra and the `urllib3.contrib.pyope=
nssl` module.
-+  Both will be removed in v2.x. See this `GitHub issue <https://github.=
com/urllib3/urllib3/issues/2680>`_
-+  for justification and info on how to migrate.
-+
-+
-+1.26.11 (2022-07-25)
-+--------------------
-+
-+* Fixed an issue where reading more than 2 GiB in a call to ``HTTPRespo=
nse.read`` would
-+  raise an ``OverflowError`` on Python 3.9 and earlier.
-+
-+
-+1.26.10 (2022-07-07)
-+--------------------
-+
-+* Removed support for Python 3.5
-+* Fixed an issue where a ``ProxyError`` recommending configuring the pr=
oxy as HTTP
-+  instead of HTTPS could appear even when an HTTPS proxy wasn't configu=
red.
-+
-+
-+1.26.9 (2022-03-16)
-+-------------------
-+
-+* Changed ``urllib3[brotli]`` extra to favor installing Brotli librarie=
s that are still
-+  receiving updates like ``brotli`` and ``brotlicffi`` instead of ``bro=
tlipy``.
-+  This change does not impact behavior of urllib3, only which dependenc=
ies are installed.
-+* Fixed a socket leaking when ``HTTPSConnection.connect()`` raises an e=
xception.
-+* Fixed ``server_hostname`` being forwarded from ``PoolManager`` to ``H=
TTPConnectionPool``
-+  when requesting an HTTP URL. Should only be forwarded when requesting=
 an HTTPS URL.
-+
-+
-+1.26.8 (2022-01-07)
-+-------------------
-+
-+* Added extra message to ``urllib3.exceptions.ProxyError`` when urllib3=
 detects that
-+  a proxy is configured to use HTTPS but the proxy itself appears to on=
ly use HTTP.
-+* Added a mention of the size of the connection pool when discarding a =
connection due to the pool being full.
-+* Added explicit support for Python 3.11.
-+* Deprecated the ``Retry.MAX_BACKOFF`` class property in favor of ``Ret=
ry.DEFAULT_MAX_BACKOFF``
-+  to better match the rest of the default parameter names. ``Retry.MAX_=
BACKOFF`` is removed in v2.0.
-+* Changed location of the vendored ``ssl.match_hostname`` function from=
 ``urllib3.packages.ssl_match_hostname``
-+  to ``urllib3.util.ssl_match_hostname`` to ensure Python 3.10+ compati=
bility after being repackaged
-+  by downstream distributors.
-+* Fixed absolute imports, all imports are now relative.
-+
-+
-+1.26.7 (2021-09-22)
-+-------------------
-+
-+* Fixed a bug with HTTPS hostname verification involving IP addresses a=
nd lack
-+  of SNI. (Issue #2400)
-+* Fixed a bug where IPv6 braces weren't stripped during certificate hos=
tname
-+  matching. (Issue #2240)
-+
-+
-+1.26.6 (2021-06-25)
-+-------------------
-+
-+* Deprecated the ``urllib3.contrib.ntlmpool`` module. urllib3 is not ab=
le to support
-+  it properly due to `reasons listed in this issue <https://github.com/=
urllib3/urllib3/issues/2282>`_.
-+  If you are a user of this module please leave a comment.
-+* Changed ``HTTPConnection.request_chunked()`` to not erroneously emit =
multiple
-+  ``Transfer-Encoding`` headers in the case that one is already specifi=
ed.
-+* Fixed typo in deprecation message to recommend ``Retry.DEFAULT_ALLOWE=
D_METHODS``.
-+
-+
-+1.26.5 (2021-05-26)
-+-------------------
-+
-+* Fixed deprecation warnings emitted in Python 3.10.
-+* Updated vendored ``six`` library to 1.16.0.
-+* Improved performance of URL parser when splitting
-+  the authority component.
-+
-+
-+1.26.4 (2021-03-15)
-+-------------------
-+
-+* Changed behavior of the default ``SSLContext`` when connecting to HTT=
PS proxy
-+  during HTTPS requests. The default ``SSLContext`` now sets ``check_ho=
stname=3DTrue``.
-+
-+
-+1.26.3 (2021-01-26)
-+-------------------
-+
-+* Fixed bytes and string comparison issue with headers (Pull #2141)
-+
-+* Changed ``ProxySchemeUnknown`` error message to be
-+  more actionable if the user supplies a proxy URL without
-+  a scheme. (Pull #2107)
-+
-+
-+1.26.2 (2020-11-12)
-+-------------------
-+
-+* Fixed an issue where ``wrap_socket`` and ``CERT_REQUIRED`` wouldn't
-+  be imported properly on Python 2.7.8 and earlier (Pull #2052)
-+
-+
-+1.26.1 (2020-11-11)
-+-------------------
-+
-+* Fixed an issue where two ``User-Agent`` headers would be sent if a
-+  ``User-Agent`` header key is passed as ``bytes`` (Pull #2047)
-+
-+
- 1.26.0 (2020-11-10)
- -------------------
-=20
-@@ -1331,5 +1484,3 @@ Changes
- ----------------
-=20
- * First release.
--
--
-diff --git a/third_party/python/urllib3/urllib3-1.26.17.dist-info/RECORD=
 b/third_party/python/urllib3/urllib3-1.26.17.dist-info/RECORD
-new file mode 100644
-index 0000000000000..1afc6580589c0
---- /dev/null
-+++ b/third_party/python/urllib3/urllib3-1.26.17.dist-info/RECORD
-@@ -0,0 +1,44 @@
-+urllib3/__init__.py,sha256=3DiXLcYiJySn0GNbWOOZDDApgBL1JgP44EZ8i1760S8M=
c,3333
-+urllib3/_collections.py,sha256=3DRp1mVyBgc_UlAcp6M3at1skJBXR5J43NawRTvW=
2g_XY,10811
-+urllib3/_version.py,sha256=3DazoM7M7BUADl2kBhMVR6PPf2GhBDI90me1fcnzTwdc=
w,64
-+urllib3/connection.py,sha256=3D92k9td_y4PEiTIjNufCUa1NzMB3J3w0LEdyokYgX=
nW8,20300
-+urllib3/connectionpool.py,sha256=3DItVDasDnPRPP9R8bNxY7tPBlC724nJ9nlxVg=
XG_SLbI,39990
-+urllib3/exceptions.py,sha256=3D0Mnno3KHTNfXRfY7638NufOPkUb6mXOm-Lqj-4x2=
w8A,8217
-+urllib3/fields.py,sha256=3DkvLDCg_JmH1lLjUUEY_FLS8UhY7hBvDPuVETbY8mdrM,=
8579
-+urllib3/filepost.py,sha256=3D5b_qqgRHVlL7uLtdAYBzBh-GHmU5AfJVt_2N0XS3Pe=
Y,2440
-+urllib3/poolmanager.py,sha256=3D0i8cJgrqupza67IBPZ_u9jXvnSxr5UBlVEiUqdk=
PtYI,19752
-+urllib3/request.py,sha256=3DYTWFNr7QIwh7E1W9dde9LM77v2VWTJ5V78XuTTw7D1A=
,6691
-+urllib3/response.py,sha256=3DUPgLmnHj4z71ZnH8ivYOyncATifTOw9FQukUqDnckC=
c,30761
-+urllib3/contrib/__init__.py,sha256=3D47DEQpj8HBSa-_TImW-5JCeuQeRkm5NMpJ=
WZG3hSuFU,0
-+urllib3/contrib/_appengine_environ.py,sha256=3DbDbyOEhW2CKLJcQqAKAyrEHN=
-aklsyHFKq6vF8ZFsmk,957
-+urllib3/contrib/appengine.py,sha256=3D6IBW6lPOoVUxASPwtn6IH1AATe5DK3lLJ=
CfwyWlLKAE,11012
-+urllib3/contrib/ntlmpool.py,sha256=3DNlfkW7WMdW8ziqudopjHoW299og1BTWi0I=
eIibquFwk,4528
-+urllib3/contrib/pyopenssl.py,sha256=3D4AJAlo9NmjWofY4dJwRa4kbZuRuHfNJxu=
8Pv6yQk1ss,17055
-+urllib3/contrib/securetransport.py,sha256=3DQOhVbWrFQTKbmV-vtyG69amekkK=
VxXkdjk9oymaO0Ag,34416
-+urllib3/contrib/socks.py,sha256=3DaRi9eWXo9ZEb95XUxef4Z21CFlnnjbEiAo9HO=
seoMt4,7097
-+urllib3/contrib/_securetransport/__init__.py,sha256=3D47DEQpj8HBSa-_TIm=
W-5JCeuQeRkm5NMpJWZG3hSuFU,0
-+urllib3/contrib/_securetransport/bindings.py,sha256=3D4Xk64qIkPBt09A5q-=
RIFUuDhNc9mXilVapm7WnYnzRw,17632
-+urllib3/contrib/_securetransport/low_level.py,sha256=3DB2JBB2_NRP02xK6D=
Ca1Pa9IuxrPwxzDzZbixQkb7U9M,13922
-+urllib3/packages/__init__.py,sha256=3D47DEQpj8HBSa-_TImW-5JCeuQeRkm5NMp=
JWZG3hSuFU,0
-+urllib3/packages/six.py,sha256=3Db9LM0wBXv7E7SrbCjAm4wwN-hrH-iNxv18LgWN=
MMKPo,34665
-+urllib3/packages/backports/__init__.py,sha256=3D47DEQpj8HBSa-_TImW-5JCe=
uQeRkm5NMpJWZG3hSuFU,0
-+urllib3/packages/backports/makefile.py,sha256=3Dnbzt3i0agPVP07jqqgjhaYj=
MmuAi_W5E0EywZivVO8E,1417
-+urllib3/packages/backports/weakref_finalize.py,sha256=3DtRCal5OAhNSRyb0=
DhHp-38AtIlCsRP8BxF3NX-6rqIA,5343
-+urllib3/util/__init__.py,sha256=3DJEmSmmqqLyaw8P51gUImZh8Gwg9i1zSe-DoqA=
itn2nc,1155
-+urllib3/util/connection.py,sha256=3D5Lx2B1PW29KxBn2T0xkN1CBgRBa3gGVJBKo=
QoRogEVk,4901
-+urllib3/util/proxy.py,sha256=3DzUvPPCJrp6dOF0N4GAVbOcl6o-4uXKSrGiTkkr5v=
US4,1605
-+urllib3/util/queue.py,sha256=3DnRgX8_eX-_VkvxoX096QWoz8Ps0QHUAExILCY_7P=
ncM,498
-+urllib3/util/request.py,sha256=3DfWiAaa8pwdLLIqoTLBxCC2e4ed80muzKU3e3HW=
WTzFQ,4225
-+urllib3/util/response.py,sha256=3DGJpg3Egi9qaJXRwBh5wv-MNuRWan5BIu40oRe=
oxWP28,3510
-+urllib3/util/retry.py,sha256=3DZ6WEf518eTOXP5jr5QSQ9gqJI0DVYt3Xs3EKnYaT=
mus,22013
-+urllib3/util/ssl_.py,sha256=3Dc0sYiSC6272r6uPkxQpo5rYPP9QC1eR6oI7004gYq=
Zo,17165
-+urllib3/util/ssl_match_hostname.py,sha256=3DIr4cZVEjmAk8gUAIHWSi7wtOO83=
UCYABY2xFD1Ql_WA,5758
-+urllib3/util/ssltransport.py,sha256=3DNA-u5rMTrDFDFC8QzRKUEKMG0561hOD4q=
BTr3Z4pv6E,6895
-+urllib3/util/timeout.py,sha256=3Dcwq4dMk87mJHSBktK1miYJ-85G-3T3RmT20v7S=
FCpno,10168
-+urllib3/util/url.py,sha256=3DkMxL1k0d-aQm_iZDw_zMmnyYyjrIA_DbsMy3cm3V55=
M,14279
-+urllib3/util/wait.py,sha256=3DfOX0_faozG2P7iVojQoE1mbydweNyTcm-hXEfFrTt=
LI,5403
-+urllib3-1.26.17.dist-info/LICENSE.txt,sha256=3Dw3vxhuJ8-dvpYZ5V7f486nsw=
CRzrPaY8fay-Dm13kHs,1115
-+urllib3-1.26.17.dist-info/METADATA,sha256=3DswEiQKmb2m5Vl4fygmy4aLSzZjx=
DjD8q2-_XzuhO9pA,48743
-+urllib3-1.26.17.dist-info/WHEEL,sha256=3DiYlv5fX357PQyRT2o6tw1bN-YcKFFH=
KqB_LwHO5wP-g,110
-+urllib3-1.26.17.dist-info/top_level.txt,sha256=3DEMiXL2sKrTcmrMxIHTqdc3=
ET54pQI2Y072LexFEemvo,8
-+urllib3-1.26.17.dist-info/RECORD,,
-diff --git a/third_party/python/six/six-1.13.0.dist-info/WHEEL b/third_p=
arty/python/urllib3/urllib3-1.26.17.dist-info/WHEEL
-similarity index 70%
-rename from third_party/python/six/six-1.13.0.dist-info/WHEEL
-rename to third_party/python/urllib3/urllib3-1.26.17.dist-info/WHEEL
-index 8b701e93c2315..c34f1162ef9a5 100644
---- a/third_party/python/six/six-1.13.0.dist-info/WHEEL
-+++ b/third_party/python/urllib3/urllib3-1.26.17.dist-info/WHEEL
-@@ -1,5 +1,5 @@
- Wheel-Version: 1.0
--Generator: bdist_wheel (0.33.6)
-+Generator: bdist_wheel (0.41.2)
- Root-Is-Purelib: true
- Tag: py2-none-any
- Tag: py3-none-any
-diff --git a/third_party/python/urllib3/urllib3-1.26.0.dist-info/top_lev=
el.txt b/third_party/python/urllib3/urllib3-1.26.17.dist-info/top_level.t=
xt
-similarity index 100%
-rename from third_party/python/urllib3/urllib3-1.26.0.dist-info/top_leve=
l.txt
-rename to third_party/python/urllib3/urllib3-1.26.17.dist-info/top_level=
.txt
-diff --git a/third_party/python/urllib3/urllib3/__init__.py b/third_part=
y/python/urllib3/urllib3/__init__.py
-index fe86b59d782bd..c6fa38212fb55 100644
---- a/third_party/python/urllib3/urllib3/__init__.py
-+++ b/third_party/python/urllib3/urllib3/__init__.py
-@@ -19,6 +19,23 @@
- from .util.timeout import Timeout
- from .util.url import get_host
-=20
-+# =3D=3D=3D NOTE TO REPACKAGERS AND VENDORS =3D=3D=3D
-+# Please delete this block, this logic is only
-+# for urllib3 being distributed via PyPI.
-+# See: https://github.com/urllib3/urllib3/issues/2680
-+try:
-+    import urllib3_secure_extra  # type: ignore # noqa: F401
-+except ImportError:
-+    pass
-+else:
-+    warnings.warn(
-+        "'urllib3[secure]' extra is deprecated and will be removed "
-+        "in a future release of urllib3 2.x. Read more in this issue: "
-+        "https://github.com/urllib3/urllib3/issues/2680",
-+        category=3DDeprecationWarning,
-+        stacklevel=3D2,
-+    )
-+
- __author__ =3D "Andrey Petrov (andrey.petrov@shazow.net)"
- __license__ =3D "MIT"
- __version__ =3D __version__
-diff --git a/third_party/python/urllib3/urllib3/_version.py b/third_part=
y/python/urllib3/urllib3/_version.py
-index cee465f88a931..cad75fb5df82a 100644
---- a/third_party/python/urllib3/urllib3/_version.py
-+++ b/third_party/python/urllib3/urllib3/_version.py
-@@ -1,2 +1,2 @@
- # This file is protected via CODEOWNERS
--__version__ =3D "1.26.0"
-+__version__ =3D "1.26.17"
-diff --git a/third_party/python/urllib3/urllib3/connection.py b/third_pa=
rty/python/urllib3/urllib3/connection.py
-index 52487417c946b..54b96b19154cc 100644
---- a/third_party/python/urllib3/urllib3/connection.py
-+++ b/third_party/python/urllib3/urllib3/connection.py
-@@ -43,6 +43,7 @@ class BrokenPipeError(Exception):
-         pass
-=20
-=20
-+from ._collections import HTTPHeaderDict  # noqa (historical, removed i=
n v2)
- from ._version import __version__
- from .exceptions import (
-     ConnectTimeoutError,
-@@ -50,15 +51,16 @@ class BrokenPipeError(Exception):
-     SubjectAltNameWarning,
-     SystemTimeWarning,
- )
--from .packages.ssl_match_hostname import CertificateError, match_hostna=
me
- from .util import SKIP_HEADER, SKIPPABLE_HEADERS, connection
- from .util.ssl_ import (
-     assert_fingerprint,
-     create_urllib3_context,
-+    is_ipaddress,
-     resolve_cert_reqs,
-     resolve_ssl_version,
-     ssl_wrap_socket,
- )
-+from .util.ssl_match_hostname import CertificateError, match_hostname
-=20
- log =3D logging.getLogger(__name__)
-=20
-@@ -66,7 +68,7 @@ class BrokenPipeError(Exception):
-=20
- # When it comes time to update this value as a part of regular maintena=
nce
- # (ie test_recent_date is failing) update it to ~6 months before the cu=
rrent date.
--RECENT_DATE =3D datetime.date(2019, 1, 1)
-+RECENT_DATE =3D datetime.date(2022, 1, 1)
-=20
- _CONTAINS_CONTROL_CHAR_RE =3D re.compile(r"[^-!#$%&'*+.^_`|~0-9a-zA-Z]"=
)
-=20
-@@ -106,6 +108,10 @@ class HTTPConnection(_HTTPConnection, object):
-     #: Whether this connection verifies the host's certificate.
-     is_verified =3D False
-=20
-+    #: Whether this proxy connection (if used) verifies the proxy host'=
s
-+    #: certificate.
-+    proxy_is_verified =3D None
-+
-     def __init__(self, *args, **kw):
-         if not six.PY2:
-             kw.pop("strict", None)
-@@ -200,7 +206,7 @@ def connect(self):
-         self._prepare_conn(conn)
-=20
-     def putrequest(self, method, url, *args, **kwargs):
--        """"""
-+        """ """
-         # Empty docstring because the indentation of CPython's implemen=
tation
-         # is broken but we don't want this method in our documentation.
-         match =3D _CONTAINS_CONTROL_CHAR_RE.search(method)
-@@ -213,8 +219,8 @@ def putrequest(self, method, url, *args, **kwargs):
-         return _HTTPConnection.putrequest(self, method, url, *args, **k=
wargs)
-=20
-     def putheader(self, header, *values):
--        """"""
--        if SKIP_HEADER not in values:
-+        """ """
-+        if not any(isinstance(v, str) and v =3D=3D SKIP_HEADER for v in=
 values):
-             _HTTPConnection.putheader(self, header, *values)
-         elif six.ensure_str(header.lower()) not in SKIPPABLE_HEADERS:
-             raise ValueError(
-@@ -223,12 +229,17 @@ def putheader(self, header, *values):
-             )
-=20
-     def request(self, method, url, body=3DNone, headers=3DNone):
-+        # Update the inner socket's timeout value to send the request.
-+        # This only triggers if the connection is re-used.
-+        if getattr(self, "sock", None) is not None:
-+            self.sock.settimeout(self.timeout)
-+
-         if headers is None:
-             headers =3D {}
-         else:
-             # Avoid modifying the headers passed into .request()
-             headers =3D headers.copy()
--        if "user-agent" not in (k.lower() for k in headers):
-+        if "user-agent" not in (six.ensure_str(k.lower()) for k in head=
ers):
-             headers["User-Agent"] =3D _get_default_user_agent()
-         super(HTTPConnection, self).request(method, url, body=3Dbody, h=
eaders=3Dheaders)
-=20
-@@ -248,7 +259,7 @@ def request_chunked(self, method, url, body=3DNone, =
headers=3DNone):
-             self.putheader("User-Agent", _get_default_user_agent())
-         for header, value in headers.items():
-             self.putheader(header, value)
--        if "transfer-encoding" not in headers:
-+        if "transfer-encoding" not in header_keys:
-             self.putheader("Transfer-Encoding", "chunked")
-         self.endheaders()
-=20
-@@ -349,17 +360,15 @@ def set_cert(
-=20
-     def connect(self):
-         # Add certificate verification
--        conn =3D self._new_conn()
-+        self.sock =3D conn =3D self._new_conn()
-         hostname =3D self.host
-         tls_in_tls =3D False
-=20
-         if self._is_using_tunnel():
-             if self.tls_in_tls_required:
--                conn =3D self._connect_tls_proxy(hostname, conn)
-+                self.sock =3D conn =3D self._connect_tls_proxy(hostname=
, conn)
-                 tls_in_tls =3D True
-=20
--            self.sock =3D conn
--
-             # Calls self._set_hostport(), so self.host is
-             # self._tunnel_host below.
-             self._tunnel()
-@@ -492,7 +501,7 @@ def _connect_tls_proxy(self, hostname, conn):
-=20
-         # If no cert was provided, use only the default options for ser=
ver
-         # certificate validation
--        return ssl_wrap_socket(
-+        socket =3D ssl_wrap_socket(
-             sock=3Dconn,
-             ca_certs=3Dself.ca_certs,
-             ca_cert_dir=3Dself.ca_cert_dir,
-@@ -501,8 +510,37 @@ def _connect_tls_proxy(self, hostname, conn):
-             ssl_context=3Dssl_context,
-         )
-=20
-+        if ssl_context.verify_mode !=3D ssl.CERT_NONE and not getattr(
-+            ssl_context, "check_hostname", False
-+        ):
-+            # While urllib3 attempts to always turn off hostname matchi=
ng from
-+            # the TLS library, this cannot always be done. So we check =
whether
-+            # the TLS Library still thinks it's matching hostnames.
-+            cert =3D socket.getpeercert()
-+            if not cert.get("subjectAltName", ()):
-+                warnings.warn(
-+                    (
-+                        "Certificate for {0} has no `subjectAltName`, f=
alling back to check for a "
-+                        "`commonName` for now. This feature is being re=
moved by major browsers and "
-+                        "deprecated by RFC 2818. (See https://github.co=
m/urllib3/urllib3/issues/497 "
-+                        "for details.)".format(hostname)
-+                    ),
-+                    SubjectAltNameWarning,
-+                )
-+            _match_hostname(cert, hostname)
-+
-+        self.proxy_is_verified =3D ssl_context.verify_mode =3D=3D ssl.C=
ERT_REQUIRED
-+        return socket
-+
-=20
- def _match_hostname(cert, asserted_hostname):
-+    # Our upstream implementation of ssl.match_hostname()
-+    # only applies this normalization to IP addresses so it doesn't
-+    # match DNS SANs so we do the same thing!
-+    stripped_hostname =3D asserted_hostname.strip("u[]")
-+    if is_ipaddress(stripped_hostname):
-+        asserted_hostname =3D stripped_hostname
-+
-     try:
-         match_hostname(cert, asserted_hostname)
-     except CertificateError as e:
-diff --git a/third_party/python/urllib3/urllib3/connectionpool.py b/thir=
d_party/python/urllib3/urllib3/connectionpool.py
-index 4708c5bfc7862..96844d933745d 100644
---- a/third_party/python/urllib3/urllib3/connectionpool.py
-+++ b/third_party/python/urllib3/urllib3/connectionpool.py
-@@ -2,6 +2,7 @@
-=20
- import errno
- import logging
-+import re
- import socket
- import sys
- import warnings
-@@ -35,7 +36,6 @@
- )
- from .packages import six
- from .packages.six.moves import queue
--from .packages.ssl_match_hostname import CertificateError
- from .request import RequestMethods
- from .response import HTTPResponse
- from .util.connection import is_connection_dropped
-@@ -44,11 +44,19 @@
- from .util.request import set_file_position
- from .util.response import assert_header_parsing
- from .util.retry import Retry
-+from .util.ssl_match_hostname import CertificateError
- from .util.timeout import Timeout
- from .util.url import Url, _encode_target
- from .util.url import _normalize_host as normalize_host
- from .util.url import get_host, parse_url
-=20
-+try:  # Platform-specific: Python 3
-+    import weakref
-+
-+    weakref_finalize =3D weakref.finalize
-+except AttributeError:  # Platform-specific: Python 2
-+    from .packages.backports.weakref_finalize import weakref_finalize
-+
- xrange =3D six.moves.xrange
-=20
- log =3D logging.getLogger(__name__)
-@@ -219,6 +227,16 @@ def __init__(
-             self.conn_kw["proxy"] =3D self.proxy
-             self.conn_kw["proxy_config"] =3D self.proxy_config
-=20
-+        # Do not pass 'self' as callback to 'finalize'.
-+        # Then the 'finalize' would keep an endless living (leak) to se=
lf.
-+        # By just passing a reference to the pool allows the garbage co=
llector
-+        # to free self if nobody else has a reference to it.
-+        pool =3D self.pool
-+
-+        # Close all the HTTPConnections in the pool before the
-+        # HTTPConnectionPool object is garbage collected.
-+        weakref_finalize(self, _close_pool_connections, pool)
-+
-     def _new_conn(self):
-         """
-         Return a fresh :class:`HTTPConnection`.
-@@ -301,8 +319,11 @@ def _put_conn(self, conn):
-             pass
-         except queue.Full:
-             # This should never happen if self.block =3D=3D True
--            log.warning("Connection pool is full, discarding connection=
: %s", self.host)
--
-+            log.warning(
-+                "Connection pool is full, discarding connection: %s. Co=
nnection pool size: %s",
-+                self.host,
-+                self.pool.qsize(),
-+            )
-         # Connection never got put back into the pool, close it.
-         if conn:
-             conn.close()
-@@ -318,7 +339,7 @@ def _prepare_proxy(self, conn):
-         pass
-=20
-     def _get_timeout(self, timeout):
--        """ Helper that always returns a :class:`urllib3.util.Timeout` =
"""
-+        """Helper that always returns a :class:`urllib3.util.Timeout`""=
"
-         if timeout is _Default:
-             return self.timeout.clone()
-=20
-@@ -375,7 +396,7 @@ def _make_request(
-=20
-         timeout_obj =3D self._get_timeout(timeout)
-         timeout_obj.start_connect()
--        conn.timeout =3D timeout_obj.connect_timeout
-+        conn.timeout =3D Timeout.resolve_default_timeout(timeout_obj.co=
nnect_timeout)
-=20
-         # Trigger any extra validation we need to do.
-         try:
-@@ -485,14 +506,8 @@ def close(self):
-         # Disable access to the pool
-         old_pool, self.pool =3D self.pool, None
-=20
--        try:
--            while True:
--                conn =3D old_pool.get(block=3DFalse)
--                if conn:
--                    conn.close()
--
--        except queue.Empty:
--            pass  # Done.
-+        # Close all the HTTPConnections in the pool.
-+        _close_pool_connections(old_pool)
-=20
-     def is_same_host(self, url):
-         """
-@@ -745,7 +760,35 @@ def urlopen(
-             # Discard the connection for these exceptions. It will be
-             # replaced during the next _get_conn() call.
-             clean_exit =3D False
--            if isinstance(e, (BaseSSLError, CertificateError)):
-+
-+            def _is_ssl_error_message_from_http_proxy(ssl_error):
-+                # We're trying to detect the message 'WRONG_VERSION_NUM=
BER' but
-+                # SSLErrors are kinda all over the place when it comes =
to the message,
-+                # so we try to cover our bases here!
-+                message =3D " ".join(re.split("[^a-z]", str(ssl_error).=
lower()))
-+                return (
-+                    "wrong version number" in message or "unknown proto=
col" in message
-+                )
-+
-+            # Try to detect a common user error with proxies which is t=
o
-+            # set an HTTP proxy to be HTTPS when it should be 'http://'
-+            # (ie {'http': 'http://proxy', 'https': 'https://proxy'})
-+            # Instead we add a nice error message and point to a URL.
-+            if (
-+                isinstance(e, BaseSSLError)
-+                and self.proxy
-+                and _is_ssl_error_message_from_http_proxy(e)
-+                and conn.proxy
-+                and conn.proxy.scheme =3D=3D "https"
-+            ):
-+                e =3D ProxyError(
-+                    "Your proxy appears to only use HTTP and not HTTPS,=
 "
-+                    "try changing your proxy URL to be HTTP. See: "
-+                    "https://urllib3.readthedocs.io/en/1.26.x/advanced-=
usage.html"
-+                    "#https-proxy-error-http-proxy",
-+                    SSLError(e),
-+                )
-+            elif isinstance(e, (BaseSSLError, CertificateError)):
-                 e =3D SSLError(e)
-             elif isinstance(e, (SocketError, NewConnectionError)) and s=
elf.proxy:
-                 e =3D ProxyError("Cannot connect to proxy.", e)
-@@ -830,7 +873,7 @@ def urlopen(
-             )
-=20
-         # Check if we should retry the HTTP response.
--        has_retry_after =3D bool(response.getheader("Retry-After"))
-+        has_retry_after =3D bool(response.headers.get("Retry-After"))
-         if retries.is_retry(method, response.status, has_retry_after):
-             try:
-                 retries =3D retries.increment(method, url, response=3Dr=
esponse, _pool=3Dself)
-@@ -1014,12 +1057,23 @@ def _validate_conn(self, conn):
-                 (
-                     "Unverified HTTPS request is being made to host '%s=
'. "
-                     "Adding certificate verification is strongly advise=
d. See: "
--                    "https://urllib3.readthedocs.io/en/latest/advanced-=
usage.html"
-+                    "https://urllib3.readthedocs.io/en/1.26.x/advanced-=
usage.html"
-                     "#ssl-warnings" % conn.host
-                 ),
-                 InsecureRequestWarning,
-             )
-=20
-+        if getattr(conn, "proxy_is_verified", None) is False:
-+            warnings.warn(
-+                (
-+                    "Unverified HTTPS connection done to an HTTPS proxy=
. "
-+                    "Adding certificate verification is strongly advise=
d. See: "
-+                    "https://urllib3.readthedocs.io/en/1.26.x/advanced-=
usage.html"
-+                    "#ssl-warnings"
-+                ),
-+                InsecureRequestWarning,
-+            )
-+
-=20
- def connection_from_url(url, **kw):
-     """
-@@ -1065,3 +1119,14 @@ def _normalize_host(host, scheme):
-     if host.startswith("[") and host.endswith("]"):
-         host =3D host[1:-1]
-     return host
-+
-+
-+def _close_pool_connections(pool):
-+    """Drains a queue of connections and closes each one."""
-+    try:
-+        while True:
-+            conn =3D pool.get(block=3DFalse)
-+            if conn:
-+                conn.close()
-+    except queue.Empty:
-+        pass  # Done.
-diff --git a/third_party/python/urllib3/urllib3/contrib/_securetransport=
/bindings.py b/third_party/python/urllib3/urllib3/contrib/_securetranspor=
t/bindings.py
-index 11524d400bab2..264d564dbda67 100644
---- a/third_party/python/urllib3/urllib3/contrib/_securetransport/bindin=
gs.py
-+++ b/third_party/python/urllib3/urllib3/contrib/_securetransport/bindin=
gs.py
-@@ -48,7 +48,7 @@
- )
- from ctypes.util import find_library
-=20
--from urllib3.packages.six import raise_from
-+from ...packages.six import raise_from
-=20
- if platform.system() !=3D "Darwin":
-     raise ImportError("Only macOS is supported")
-diff --git a/third_party/python/urllib3/urllib3/contrib/_securetransport=
/low_level.py b/third_party/python/urllib3/urllib3/contrib/_securetranspo=
rt/low_level.py
-index ed8120190c06f..fa0b245d279e9 100644
---- a/third_party/python/urllib3/urllib3/contrib/_securetransport/low_le=
vel.py
-+++ b/third_party/python/urllib3/urllib3/contrib/_securetransport/low_le=
vel.py
-@@ -188,6 +188,7 @@ def _cert_array_from_pem(pem_bundle):
-         # We only want to do that if an error occurs: otherwise, the ca=
ller
-         # should free.
-         CoreFoundation.CFRelease(cert_array)
-+        raise
-=20
-     return cert_array
-=20
-diff --git a/third_party/python/urllib3/urllib3/contrib/appengine.py b/t=
hird_party/python/urllib3/urllib3/contrib/appengine.py
-index aa64a0914c601..a5a6d91035f0a 100644
---- a/third_party/python/urllib3/urllib3/contrib/appengine.py
-+++ b/third_party/python/urllib3/urllib3/contrib/appengine.py
-@@ -111,7 +111,7 @@ def __init__(
-         warnings.warn(
-             "urllib3 is using URLFetch on Google App Engine sandbox ins=
tead "
-             "of sockets. To use sockets directly instead of URLFetch se=
e "
--            "https://urllib3.readthedocs.io/en/latest/reference/urllib3=
.contrib.html.",
-+            "https://urllib3.readthedocs.io/en/1.26.x/reference/urllib3=
.contrib.html.",
-             AppEnginePlatformWarning,
-         )
-=20
-@@ -224,7 +224,7 @@ def urlopen(
-                 )
-=20
-         # Check if we should retry the HTTP response.
--        has_retry_after =3D bool(http_response.getheader("Retry-After")=
)
-+        has_retry_after =3D bool(http_response.headers.get("Retry-After=
"))
-         if retries.is_retry(method, http_response.status, has_retry_aft=
er):
-             retries =3D retries.increment(method, url, response=3Dhttp_=
response, _pool=3Dself)
-             log.debug("Retry: %s", url)
-diff --git a/third_party/python/urllib3/urllib3/contrib/ntlmpool.py b/th=
ird_party/python/urllib3/urllib3/contrib/ntlmpool.py
-index b2df45dcf6065..471665754e9f1 100644
---- a/third_party/python/urllib3/urllib3/contrib/ntlmpool.py
-+++ b/third_party/python/urllib3/urllib3/contrib/ntlmpool.py
-@@ -5,6 +5,7 @@
- """
- from __future__ import absolute_import
-=20
-+import warnings
- from logging import getLogger
-=20
- from ntlm import ntlm
-@@ -12,6 +13,14 @@
- from .. import HTTPSConnectionPool
- from ..packages.six.moves.http_client import HTTPSConnection
-=20
-+warnings.warn(
-+    "The 'urllib3.contrib.ntlmpool' module is deprecated and will be re=
moved "
-+    "in urllib3 v2.0 release, urllib3 is not able to support it properl=
y due "
-+    "to reasons listed in issue: https://github.com/urllib3/urllib3/iss=
ues/2282. "
-+    "If you are a user of this module please comment in the mentioned i=
ssue.",
-+    DeprecationWarning,
-+)
-+
- log =3D getLogger(__name__)
-=20
-=20
-@@ -60,7 +69,7 @@ def _new_conn(self):
-         log.debug("Request headers: %s", headers)
-         conn.request("GET", self.authurl, None, headers)
-         res =3D conn.getresponse()
--        reshdr =3D dict(res.getheaders())
-+        reshdr =3D dict(res.headers)
-         log.debug("Response status: %s %s", res.status, res.reason)
-         log.debug("Response headers: %s", reshdr)
-         log.debug("Response data: %s [...]", res.read(100))
-@@ -92,7 +101,7 @@ def _new_conn(self):
-         conn.request("GET", self.authurl, None, headers)
-         res =3D conn.getresponse()
-         log.debug("Response status: %s %s", res.status, res.reason)
--        log.debug("Response headers: %s", dict(res.getheaders()))
-+        log.debug("Response headers: %s", dict(res.headers))
-         log.debug("Response data: %s [...]", res.read()[:100])
-         if res.status !=3D 200:
-             if res.status =3D=3D 401:
-diff --git a/third_party/python/urllib3/urllib3/contrib/pyopenssl.py b/t=
hird_party/python/urllib3/urllib3/contrib/pyopenssl.py
-index 0cabab1aed14a..1ed214b1d78fc 100644
---- a/third_party/python/urllib3/urllib3/contrib/pyopenssl.py
-+++ b/third_party/python/urllib3/urllib3/contrib/pyopenssl.py
-@@ -47,10 +47,10 @@
- """
- from __future__ import absolute_import
-=20
-+import OpenSSL.crypto
- import OpenSSL.SSL
- from cryptography import x509
- from cryptography.hazmat.backends.openssl import backend as openssl_bac=
kend
--from cryptography.hazmat.backends.openssl.x509 import _Certificate
-=20
- try:
-     from cryptography.x509 import UnsupportedExtension
-@@ -73,9 +73,19 @@ class UnsupportedExtension(Exception):
- import logging
- import ssl
- import sys
-+import warnings
-=20
- from .. import util
- from ..packages import six
-+from ..util.ssl_ import PROTOCOL_TLS_CLIENT
-+
-+warnings.warn(
-+    "'urllib3.contrib.pyopenssl' module is deprecated and will be remov=
ed "
-+    "in a future release of urllib3 2.x. Read more in this issue: "
-+    "https://github.com/urllib3/urllib3/issues/2680",
-+    category=3DDeprecationWarning,
-+    stacklevel=3D2,
-+)
-=20
- __all__ =3D ["inject_into_urllib3", "extract_from_urllib3"]
-=20
-@@ -85,6 +95,7 @@ class UnsupportedExtension(Exception):
- # Map from urllib3 to PyOpenSSL compatible parameter-values.
- _openssl_versions =3D {
-     util.PROTOCOL_TLS: OpenSSL.SSL.SSLv23_METHOD,
-+    PROTOCOL_TLS_CLIENT: OpenSSL.SSL.SSLv23_METHOD,
-     ssl.PROTOCOL_TLSv1: OpenSSL.SSL.TLSv1_METHOD,
- }
-=20
-@@ -217,9 +228,8 @@ def get_subj_alt_name(peer_cert):
-     if hasattr(peer_cert, "to_cryptography"):
-         cert =3D peer_cert.to_cryptography()
-     else:
--        # This is technically using private APIs, but should work acros=
s all
--        # relevant versions before PyOpenSSL got a proper API for this.
--        cert =3D _Certificate(openssl_backend, peer_cert._x509)
-+        der =3D OpenSSL.crypto.dump_certificate(OpenSSL.crypto.FILETYPE=
_ASN1, peer_cert)
-+        cert =3D x509.load_der_x509_certificate(der, openssl_backend)
-=20
-     # We want to find the SAN extension. Ask Cryptography to locate it =
(it's
-     # faster than looping in Python)
-@@ -404,7 +414,6 @@ def makefile(self, mode, bufsize=3D-1):
-         self._makefile_refs +=3D 1
-         return _fileobject(self, mode, bufsize, close=3DTrue)
-=20
--
- else:  # Platform-specific: Python 3
-     makefile =3D backport_makefile
-=20
-diff --git a/third_party/python/urllib3/urllib3/contrib/securetransport.=
py b/third_party/python/urllib3/urllib3/contrib/securetransport.py
-index ab092de67a57c..6c46a3b9f0375 100644
---- a/third_party/python/urllib3/urllib3/contrib/securetransport.py
-+++ b/third_party/python/urllib3/urllib3/contrib/securetransport.py
-@@ -67,6 +67,7 @@
- import six
-=20
- from .. import util
-+from ..util.ssl_ import PROTOCOL_TLS_CLIENT
- from ._securetransport.bindings import CoreFoundation, Security, Securi=
tyConst
- from ._securetransport.low_level import (
-     _assert_no_error,
-@@ -154,7 +155,8 @@
- # TLSv1 and a high of TLSv1.2. For everything else, we pin to that vers=
ion.
- # TLSv1 to 1.2 are supported on macOS 10.8+
- _protocol_to_min_max =3D {
--    util.PROTOCOL_TLS: (SecurityConst.kTLSProtocol1, SecurityConst.kTLS=
Protocol12)
-+    util.PROTOCOL_TLS: (SecurityConst.kTLSProtocol1, SecurityConst.kTLS=
Protocol12),
-+    PROTOCOL_TLS_CLIENT: (SecurityConst.kTLSProtocol1, SecurityConst.kT=
LSProtocol12),
- }
-=20
- if hasattr(ssl, "PROTOCOL_SSLv2"):
-@@ -768,7 +770,6 @@ def makefile(self, mode, bufsize=3D-1):
-         self._makefile_refs +=3D 1
-         return _fileobject(self, mode, bufsize, close=3DTrue)
-=20
--
- else:  # Platform-specific: Python 3
-=20
-     def makefile(self, mode=3D"r", buffering=3DNone, *args, **kwargs):
-diff --git a/third_party/python/urllib3/urllib3/contrib/socks.py b/third=
_party/python/urllib3/urllib3/contrib/socks.py
-index 93df8325d59c4..c326e80dd1174 100644
---- a/third_party/python/urllib3/urllib3/contrib/socks.py
-+++ b/third_party/python/urllib3/urllib3/contrib/socks.py
-@@ -51,7 +51,7 @@
-         (
-             "SOCKS support in urllib3 requires the installation of opti=
onal "
-             "dependencies: specifically, PySocks.  For more information=
, see "
--            "https://urllib3.readthedocs.io/en/latest/contrib.html#sock=
s-proxies"
-+            "https://urllib3.readthedocs.io/en/1.26.x/contrib.html#sock=
s-proxies"
-         ),
-         DependencyWarning,
-     )
-diff --git a/third_party/python/urllib3/urllib3/exceptions.py b/third_pa=
rty/python/urllib3/urllib3/exceptions.py
-index d69958d5dfc29..cba6f3f560f71 100644
---- a/third_party/python/urllib3/urllib3/exceptions.py
-+++ b/third_party/python/urllib3/urllib3/exceptions.py
-@@ -289,7 +289,17 @@ class ProxySchemeUnknown(AssertionError, URLSchemeU=
nknown):
-     # TODO(t-8ch): Stop inheriting from AssertionError in v2.0.
-=20
-     def __init__(self, scheme):
--        message =3D "Not supported proxy scheme %s" % scheme
-+        # 'localhost' is here because our URL parser parses
-+        # localhost:8080 -> scheme=3Dlocalhost, remove if we fix this.
-+        if scheme =3D=3D "localhost":
-+            scheme =3D None
-+        if scheme is None:
-+            message =3D "Proxy URL had no scheme, should start with htt=
p:// or https://"
-+        else:
-+            message =3D (
-+                "Proxy URL had unsupported scheme %s, should use http:/=
/ or https://"
-+                % scheme
-+            )
-         super(ProxySchemeUnknown, self).__init__(message)
-=20
-=20
-diff --git a/third_party/python/urllib3/urllib3/packages/__init__.py b/t=
hird_party/python/urllib3/urllib3/packages/__init__.py
-index fce4caa65d2ee..e69de29bb2d1d 100644
---- a/third_party/python/urllib3/urllib3/packages/__init__.py
-+++ b/third_party/python/urllib3/urllib3/packages/__init__.py
-@@ -1,5 +0,0 @@
--from __future__ import absolute_import
--
--from . import ssl_match_hostname
--
--__all__ =3D ("ssl_match_hostname",)
-diff --git a/third_party/python/urllib3/urllib3/packages/backports/weakr=
ef_finalize.py b/third_party/python/urllib3/urllib3/packages/backports/we=
akref_finalize.py
-new file mode 100644
-index 0000000000000..a2f2966e54966
---- /dev/null
-+++ b/third_party/python/urllib3/urllib3/packages/backports/weakref_fina=
lize.py
-@@ -0,0 +1,155 @@
-+# -*- coding: utf-8 -*-
-+"""
-+backports.weakref_finalize
-+~~~~~~~~~~~~~~~~~~
-+
-+Backports the Python 3 ``weakref.finalize`` method.
-+"""
-+from __future__ import absolute_import
-+
-+import itertools
-+import sys
-+from weakref import ref
-+
-+__all__ =3D ["weakref_finalize"]
-+
-+
-+class weakref_finalize(object):
-+    """Class for finalization of weakrefable objects
-+    finalize(obj, func, *args, **kwargs) returns a callable finalizer
-+    object which will be called when obj is garbage collected. The
-+    first time the finalizer is called it evaluates func(*arg, **kwargs=
)
-+    and returns the result. After this the finalizer is dead, and
-+    calling it just returns None.
-+    When the program exits any remaining finalizers for which the
-+    atexit attribute is true will be run in reverse order of creation.
-+    By default atexit is true.
-+    """
-+
-+    # Finalizer objects don't have any state of their own.  They are
-+    # just used as keys to lookup _Info objects in the registry.  This
-+    # ensures that they cannot be part of a ref-cycle.
-+
-+    __slots__ =3D ()
-+    _registry =3D {}
-+    _shutdown =3D False
-+    _index_iter =3D itertools.count()
-+    _dirty =3D False
-+    _registered_with_atexit =3D False
-+
-+    class _Info(object):
-+        __slots__ =3D ("weakref", "func", "args", "kwargs", "atexit", "=
index")
-+
-+    def __init__(self, obj, func, *args, **kwargs):
-+        if not self._registered_with_atexit:
-+            # We may register the exit function more than once because
-+            # of a thread race, but that is harmless
-+            import atexit
-+
-+            atexit.register(self._exitfunc)
-+            weakref_finalize._registered_with_atexit =3D True
-+        info =3D self._Info()
-+        info.weakref =3D ref(obj, self)
-+        info.func =3D func
-+        info.args =3D args
-+        info.kwargs =3D kwargs or None
-+        info.atexit =3D True
-+        info.index =3D next(self._index_iter)
-+        self._registry[self] =3D info
-+        weakref_finalize._dirty =3D True
-+
-+    def __call__(self, _=3DNone):
-+        """If alive then mark as dead and return func(*args, **kwargs);
-+        otherwise return None"""
-+        info =3D self._registry.pop(self, None)
-+        if info and not self._shutdown:
-+            return info.func(*info.args, **(info.kwargs or {}))
-+
-+    def detach(self):
-+        """If alive then mark as dead and return (obj, func, args, kwar=
gs);
-+        otherwise return None"""
-+        info =3D self._registry.get(self)
-+        obj =3D info and info.weakref()
-+        if obj is not None and self._registry.pop(self, None):
-+            return (obj, info.func, info.args, info.kwargs or {})
-+
-+    def peek(self):
-+        """If alive then return (obj, func, args, kwargs);
-+        otherwise return None"""
-+        info =3D self._registry.get(self)
-+        obj =3D info and info.weakref()
-+        if obj is not None:
-+            return (obj, info.func, info.args, info.kwargs or {})
-+
-+    @property
-+    def alive(self):
-+        """Whether finalizer is alive"""
-+        return self in self._registry
-+
-+    @property
-+    def atexit(self):
-+        """Whether finalizer should be called at exit"""
-+        info =3D self._registry.get(self)
-+        return bool(info) and info.atexit
-+
-+    @atexit.setter
-+    def atexit(self, value):
-+        info =3D self._registry.get(self)
-+        if info:
-+            info.atexit =3D bool(value)
-+
-+    def __repr__(self):
-+        info =3D self._registry.get(self)
-+        obj =3D info and info.weakref()
-+        if obj is None:
-+            return "<%s object at %#x; dead>" % (type(self).__name__, i=
d(self))
-+        else:
-+            return "<%s object at %#x; for %r at %#x>" % (
-+                type(self).__name__,
-+                id(self),
-+                type(obj).__name__,
-+                id(obj),
-+            )
-+
-+    @classmethod
-+    def _select_for_exit(cls):
-+        # Return live finalizers marked for exit, oldest first
-+        L =3D [(f, i) for (f, i) in cls._registry.items() if i.atexit]
-+        L.sort(key=3Dlambda item: item[1].index)
-+        return [f for (f, i) in L]
-+
-+    @classmethod
-+    def _exitfunc(cls):
-+        # At shutdown invoke finalizers for which atexit is true.
-+        # This is called once all other non-daemonic threads have been
-+        # joined.
-+        reenable_gc =3D False
-+        try:
-+            if cls._registry:
-+                import gc
-+
-+                if gc.isenabled():
-+                    reenable_gc =3D True
-+                    gc.disable()
-+                pending =3D None
-+                while True:
-+                    if pending is None or weakref_finalize._dirty:
-+                        pending =3D cls._select_for_exit()
-+                        weakref_finalize._dirty =3D False
-+                    if not pending:
-+                        break
-+                    f =3D pending.pop()
-+                    try:
-+                        # gc is disabled, so (assuming no daemonic
-+                        # threads) the following is the only line in
-+                        # this function which might trigger creation
-+                        # of a new finalizer
-+                        f()
-+                    except Exception:
-+                        sys.excepthook(*sys.exc_info())
-+                    assert f not in cls._registry
-+        finally:
-+            # prevent any more finalizers from executing during shutdow=
n
-+            weakref_finalize._shutdown =3D True
-+            if reenable_gc:
-+                gc.enable()
-diff --git a/third_party/python/urllib3/urllib3/packages/six.py b/third_=
party/python/urllib3/urllib3/packages/six.py
-index 314424099f624..f099a3dcd28d2 100644
---- a/third_party/python/urllib3/urllib3/packages/six.py
-+++ b/third_party/python/urllib3/urllib3/packages/six.py
-@@ -1,4 +1,4 @@
--# Copyright (c) 2010-2019 Benjamin Peterson
-+# Copyright (c) 2010-2020 Benjamin Peterson
- #
- # Permission is hereby granted, free of charge, to any person obtaining=
 a copy
- # of this software and associated documentation files (the "Software"),=
 to deal
-@@ -29,7 +29,7 @@
- import types
-=20
- __author__ =3D "Benjamin Peterson <benjamin@python.org>"
--__version__ =3D "1.12.0"
-+__version__ =3D "1.16.0"
-=20
-=20
- # Useful for very coarse version differentiation.
-@@ -71,6 +71,11 @@ def __len__(self):
-             MAXSIZE =3D int((1 << 63) - 1)
-         del X
-=20
-+if PY34:
-+    from importlib.util import spec_from_loader
-+else:
-+    spec_from_loader =3D None
-+
-=20
- def _add_doc(func, doc):
-     """Add documentation to a function."""
-@@ -182,6 +187,11 @@ def find_module(self, fullname, path=3DNone):
-             return self
-         return None
-=20
-+    def find_spec(self, fullname, path, target=3DNone):
-+        if fullname in self.known_modules:
-+            return spec_from_loader(fullname, self)
-+        return None
-+
-     def __get_module(self, fullname):
-         try:
-             return self.known_modules[fullname]
-@@ -220,6 +230,12 @@ def get_code(self, fullname):
-=20
-     get_source =3D get_code  # same as get_code
-=20
-+    def create_module(self, spec):
-+        return self.load_module(spec.name)
-+
-+    def exec_module(self, module):
-+        pass
-+
-=20
- _importer =3D _SixMetaPathImporter(__name__)
-=20
-@@ -260,9 +276,19 @@ class _MovedItems(_LazyModule):
-     ),
-     MovedModule("builtins", "__builtin__"),
-     MovedModule("configparser", "ConfigParser"),
-+    MovedModule(
-+        "collections_abc",
-+        "collections",
-+        "collections.abc" if sys.version_info >=3D (3, 3) else "collect=
ions",
-+    ),
-     MovedModule("copyreg", "copy_reg"),
-     MovedModule("dbm_gnu", "gdbm", "dbm.gnu"),
--    MovedModule("_dummy_thread", "dummy_thread", "_dummy_thread"),
-+    MovedModule("dbm_ndbm", "dbm", "dbm.ndbm"),
-+    MovedModule(
-+        "_dummy_thread",
-+        "dummy_thread",
-+        "_dummy_thread" if sys.version_info < (3, 9) else "_thread",
-+    ),
-     MovedModule("http_cookiejar", "cookielib", "http.cookiejar"),
-     MovedModule("http_cookies", "Cookie", "http.cookies"),
-     MovedModule("html_entities", "htmlentitydefs", "html.entities"),
-@@ -307,7 +333,9 @@ class _MovedItems(_LazyModule):
- ]
- # Add windows specific modules.
- if sys.platform =3D=3D "win32":
--    _moved_attributes +=3D [MovedModule("winreg", "_winreg")]
-+    _moved_attributes +=3D [
-+        MovedModule("winreg", "_winreg"),
-+    ]
-=20
- for attr in _moved_attributes:
-     setattr(_MovedItems, attr.name, attr)
-@@ -476,7 +504,7 @@ class Module_six_moves_urllib_robotparser(_LazyModul=
e):
-=20
-=20
- _urllib_robotparser_moved_attributes =3D [
--    MovedAttribute("RobotFileParser", "robotparser", "urllib.robotparse=
r")
-+    MovedAttribute("RobotFileParser", "robotparser", "urllib.robotparse=
r"),
- ]
- for attr in _urllib_robotparser_moved_attributes:
-     setattr(Module_six_moves_urllib_robotparser, attr.name, attr)
-@@ -678,9 +706,11 @@ def u(s):
-     if sys.version_info[1] <=3D 1:
-         _assertRaisesRegex =3D "assertRaisesRegexp"
-         _assertRegex =3D "assertRegexpMatches"
-+        _assertNotRegex =3D "assertNotRegexpMatches"
-     else:
-         _assertRaisesRegex =3D "assertRaisesRegex"
-         _assertRegex =3D "assertRegex"
-+        _assertNotRegex =3D "assertNotRegex"
- else:
-=20
-     def b(s):
-@@ -707,6 +737,7 @@ def indexbytes(buf, i):
-     _assertCountEqual =3D "assertItemsEqual"
-     _assertRaisesRegex =3D "assertRaisesRegexp"
-     _assertRegex =3D "assertRegexpMatches"
-+    _assertNotRegex =3D "assertNotRegexpMatches"
- _add_doc(b, """Byte literal""")
- _add_doc(u, """Text literal""")
-=20
-@@ -723,6 +754,10 @@ def assertRegex(self, *args, **kwargs):
-     return getattr(self, _assertRegex)(*args, **kwargs)
-=20
-=20
-+def assertNotRegex(self, *args, **kwargs):
-+    return getattr(self, _assertNotRegex)(*args, **kwargs)
-+
-+
- if PY3:
-     exec_ =3D getattr(moves.builtins, "exec")
-=20
-@@ -737,7 +772,6 @@ def reraise(tp, value, tb=3DNone):
-             value =3D None
-             tb =3D None
-=20
--
- else:
-=20
-     def exec_(_code_, _globs_=3DNone, _locs_=3DNone):
-@@ -750,7 +784,7 @@ def exec_(_code_, _globs_=3DNone, _locs_=3DNone):
-             del frame
-         elif _locs_ is None:
-             _locs_ =3D _globs_
--        exec("""exec _code_ in _globs_, _locs_""")
-+        exec ("""exec _code_ in _globs_, _locs_""")
-=20
-     exec_(
-         """def reraise(tp, value, tb=3DNone):
-@@ -762,18 +796,7 @@ def exec_(_code_, _globs_=3DNone, _locs_=3DNone):
-     )
-=20
-=20
--if sys.version_info[:2] =3D=3D (3, 2):
--    exec_(
--        """def raise_from(value, from_value):
--    try:
--        if from_value is None:
--            raise value
--        raise value from from_value
--    finally:
--        value =3D None
--"""
--    )
--elif sys.version_info[:2] > (3, 2):
-+if sys.version_info[:2] > (3,):
-     exec_(
-         """def raise_from(value, from_value):
-     try:
-@@ -863,19 +886,41 @@ def print_(*args, **kwargs):
- _add_doc(reraise, """Reraise an exception.""")
-=20
- if sys.version_info[0:2] < (3, 4):
-+    # This does exactly the same what the :func:`py3:functools.update_w=
rapper`
-+    # function does on Python versions after 3.2. It sets the ``__wrapp=
ed__``
-+    # attribute on ``wrapper`` object and it doesn't raise an error if =
any of
-+    # the attributes mentioned in ``assigned`` and ``updated`` are miss=
ing on
-+    # ``wrapped`` object.
-+    def _update_wrapper(
-+        wrapper,
-+        wrapped,
-+        assigned=3Dfunctools.WRAPPER_ASSIGNMENTS,
-+        updated=3Dfunctools.WRAPPER_UPDATES,
-+    ):
-+        for attr in assigned:
-+            try:
-+                value =3D getattr(wrapped, attr)
-+            except AttributeError:
-+                continue
-+            else:
-+                setattr(wrapper, attr, value)
-+        for attr in updated:
-+            getattr(wrapper, attr).update(getattr(wrapped, attr, {}))
-+        wrapper.__wrapped__ =3D wrapped
-+        return wrapper
-+
-+    _update_wrapper.__doc__ =3D functools.update_wrapper.__doc__
-=20
-     def wraps(
-         wrapped,
-         assigned=3Dfunctools.WRAPPER_ASSIGNMENTS,
-         updated=3Dfunctools.WRAPPER_UPDATES,
-     ):
--        def wrapper(f):
--            f =3D functools.wraps(wrapped, assigned, updated)(f)
--            f.__wrapped__ =3D wrapped
--            return f
--
--        return wrapper
-+        return functools.partial(
-+            _update_wrapper, wrapped=3Dwrapped, assigned=3Dassigned, up=
dated=3Dupdated
-+        )
-=20
-+    wraps.__doc__ =3D functools.wraps.__doc__
-=20
- else:
-     wraps =3D functools.wraps
-@@ -888,7 +933,15 @@ def with_metaclass(meta, *bases):
-     # the actual metaclass.
-     class metaclass(type):
-         def __new__(cls, name, this_bases, d):
--            return meta(name, bases, d)
-+            if sys.version_info[:2] >=3D (3, 7):
-+                # This version introduced PEP 560 that requires a bit
-+                # of extra care (we mimic what is done by __build_class=
__).
-+                resolved_bases =3D types.resolve_bases(bases)
-+                if resolved_bases is not bases:
-+                    d["__orig_bases__"] =3D bases
-+            else:
-+                resolved_bases =3D bases
-+            return meta(name, resolved_bases, d)
-=20
-         @classmethod
-         def __prepare__(cls, name, this_bases):
-@@ -928,12 +981,11 @@ def ensure_binary(s, encoding=3D"utf-8", errors=3D=
"strict"):
-       - `str` -> encoded to `bytes`
-       - `bytes` -> `bytes`
-     """
-+    if isinstance(s, binary_type):
-+        return s
-     if isinstance(s, text_type):
-         return s.encode(encoding, errors)
--    elif isinstance(s, binary_type):
--        return s
--    else:
--        raise TypeError("not expecting type '%s'" % type(s))
-+    raise TypeError("not expecting type '%s'" % type(s))
-=20
-=20
- def ensure_str(s, encoding=3D"utf-8", errors=3D"strict"):
-@@ -947,12 +999,15 @@ def ensure_str(s, encoding=3D"utf-8", errors=3D"st=
rict"):
-       - `str` -> `str`
-       - `bytes` -> decoded to `str`
-     """
--    if not isinstance(s, (text_type, binary_type)):
--        raise TypeError("not expecting type '%s'" % type(s))
-+    # Optimization: Fast return for the common case.
-+    if type(s) is str:
-+        return s
-     if PY2 and isinstance(s, text_type):
--        s =3D s.encode(encoding, errors)
-+        return s.encode(encoding, errors)
-     elif PY3 and isinstance(s, binary_type):
--        s =3D s.decode(encoding, errors)
-+        return s.decode(encoding, errors)
-+    elif not isinstance(s, (text_type, binary_type)):
-+        raise TypeError("not expecting type '%s'" % type(s))
-     return s
-=20
-=20
-@@ -977,7 +1032,7 @@ def ensure_text(s, encoding=3D"utf-8", errors=3D"st=
rict"):
-=20
- def python_2_unicode_compatible(klass):
-     """
--    A decorator that defines __unicode__ and __str__ methods under Pyth=
on 2.
-+    A class decorator that defines __unicode__ and __str__ methods unde=
r Python 2.
-     Under Python 3 it does nothing.
-=20
-     To support Python 2 and 3 with a single code base, define a __str__=
 method
-diff --git a/third_party/python/urllib3/urllib3/packages/ssl_match_hostn=
ame/__init__.py b/third_party/python/urllib3/urllib3/packages/ssl_match_h=
ostname/__init__.py
-deleted file mode 100644
-index 6b12fd90aadec..0000000000000
---- a/third_party/python/urllib3/urllib3/packages/ssl_match_hostname/__i=
nit__.py
-+++ /dev/null
-@@ -1,22 +0,0 @@
--import sys
--
--try:
--    # Our match_hostname function is the same as 3.5's, so we only want=
 to
--    # import the match_hostname function if it's at least that good.
--    if sys.version_info < (3, 5):
--        raise ImportError("Fallback to vendored code")
--
--    from ssl import CertificateError, match_hostname
--except ImportError:
--    try:
--        # Backport of the function from a pypi module
--        from backports.ssl_match_hostname import (  # type: ignore
--            CertificateError,
--            match_hostname,
--        )
--    except ImportError:
--        # Our vendored copy
--        from ._implementation import CertificateError, match_hostname  =
# type: ignore
--
--# Not needed, but documenting what we provide.
--__all__ =3D ("CertificateError", "match_hostname")
-diff --git a/third_party/python/urllib3/urllib3/poolmanager.py b/third_p=
arty/python/urllib3/urllib3/poolmanager.py
-index 3a31a285bf648..14b10daf3a962 100644
---- a/third_party/python/urllib3/urllib3/poolmanager.py
-+++ b/third_party/python/urllib3/urllib3/poolmanager.py
-@@ -34,6 +34,7 @@
-     "ca_cert_dir",
-     "ssl_context",
-     "key_password",
-+    "server_hostname",
- )
-=20
- # All known keyword arguments that could be provided to the pool manage=
r, its
-@@ -170,7 +171,7 @@ class PoolManager(RequestMethods):
-     def __init__(self, num_pools=3D10, headers=3DNone, **connection_poo=
l_kw):
-         RequestMethods.__init__(self, headers)
-         self.connection_pool_kw =3D connection_pool_kw
--        self.pools =3D RecentlyUsedContainer(num_pools, dispose_func=3D=
lambda p: p.close())
-+        self.pools =3D RecentlyUsedContainer(num_pools)
-=20
-         # Locally set the pool classes and keys so other PoolManagers c=
an
-         # override them.
-diff --git a/third_party/python/urllib3/urllib3/request.py b/third_party=
/python/urllib3/urllib3/request.py
-index 398386a5b9f61..3b4cf999225b8 100644
---- a/third_party/python/urllib3/urllib3/request.py
-+++ b/third_party/python/urllib3/urllib3/request.py
-@@ -1,6 +1,9 @@
- from __future__ import absolute_import
-=20
-+import sys
-+
- from .filepost import encode_multipart_formdata
-+from .packages import six
- from .packages.six.moves.urllib.parse import urlencode
-=20
- __all__ =3D ["RequestMethods"]
-@@ -168,3 +171,21 @@ def request_encode_body(
-         extra_kw.update(urlopen_kw)
-=20
-         return self.urlopen(method, url, **extra_kw)
-+
-+
-+if not six.PY2:
-+
-+    class RequestModule(sys.modules[__name__].__class__):
-+        def __call__(self, *args, **kwargs):
-+            """
-+            If user tries to call this module directly urllib3 v2.x sty=
le raise an error to the user
-+            suggesting they may need urllib3 v2
-+            """
-+            raise TypeError(
-+                "'module' object is not callable\n"
-+                "urllib3.request() method is not supported in this rele=
ase, "
-+                "upgrade to urllib3 v2 to use it\n"
-+                "see https://urllib3.readthedocs.io/en/stable/v2-migrat=
ion-guide.html"
-+            )
-+
-+    sys.modules[__name__].__class__ =3D RequestModule
-diff --git a/third_party/python/urllib3/urllib3/response.py b/third_part=
y/python/urllib3/urllib3/response.py
-index 38693f4fc6e33..0bd13d40b8ac7 100644
---- a/third_party/python/urllib3/urllib3/response.py
-+++ b/third_party/python/urllib3/urllib3/response.py
-@@ -2,16 +2,22 @@
-=20
- import io
- import logging
-+import sys
-+import warnings
- import zlib
- from contextlib import contextmanager
- from socket import error as SocketError
- from socket import timeout as SocketTimeout
-=20
- try:
--    import brotli
-+    try:
-+        import brotlicffi as brotli
-+    except ImportError:
-+        import brotli
- except ImportError:
-     brotli =3D None
-=20
-+from . import util
- from ._collections import HTTPHeaderDict
- from .connection import BaseSSLError, HTTPException
- from .exceptions import (
-@@ -478,6 +484,54 @@ def _error_catcher(self):
-             if self._original_response and self._original_response.iscl=
osed():
-                 self.release_conn()
-=20
-+    def _fp_read(self, amt):
-+        """
-+        Read a response with the thought that reading the number of byt=
es
-+        larger than can fit in a 32-bit int at a time via SSL in some
-+        known cases leads to an overflow error that has to be prevented
-+        if `amt` or `self.length_remaining` indicate that a problem may
-+        happen.
-+
-+        The known cases:
-+          * 3.8 <=3D CPython < 3.9.7 because of a bug
-+            https://github.com/urllib3/urllib3/issues/2513#issuecomment=
-1152559900.
-+          * urllib3 injected with pyOpenSSL-backed SSL-support.
-+          * CPython < 3.10 only when `amt` does not fit 32-bit int.
-+        """
-+        assert self._fp
-+        c_int_max =3D 2 ** 31 - 1
-+        if (
-+            (
-+                (amt and amt > c_int_max)
-+                or (self.length_remaining and self.length_remaining > c=
_int_max)
-+            )
-+            and not util.IS_SECURETRANSPORT
-+            and (util.IS_PYOPENSSL or sys.version_info < (3, 10))
-+        ):
-+            buffer =3D io.BytesIO()
-+            # Besides `max_chunk_amt` being a maximum chunk size, it
-+            # affects memory overhead of reading a response by this
-+            # method in CPython.
-+            # `c_int_max` equal to 2 GiB - 1 byte is the actual maximum
-+            # chunk size that does not lead to an overflow error, but
-+            # 256 MiB is a compromise.
-+            max_chunk_amt =3D 2 ** 28
-+            while amt is None or amt !=3D 0:
-+                if amt is not None:
-+                    chunk_amt =3D min(amt, max_chunk_amt)
-+                    amt -=3D chunk_amt
-+                else:
-+                    chunk_amt =3D max_chunk_amt
-+                data =3D self._fp.read(chunk_amt)
-+                if not data:
-+                    break
-+                buffer.write(data)
-+                del data  # to reduce peak memory usage by `max_chunk_a=
mt`.
-+            return buffer.getvalue()
-+        else:
-+            # StringIO doesn't like amt=3DNone
-+            return self._fp.read(amt) if amt is not None else self._fp.=
read()
-+
-     def read(self, amt=3DNone, decode_content=3DNone, cache_content=3DF=
alse):
-         """
-         Similar to :meth:`http.client.HTTPResponse.read`, but with two =
additional
-@@ -510,13 +564,11 @@ def read(self, amt=3DNone, decode_content=3DNone, =
cache_content=3DFalse):
-         fp_closed =3D getattr(self._fp, "closed", False)
-=20
-         with self._error_catcher():
-+            data =3D self._fp_read(amt) if not fp_closed else b""
-             if amt is None:
--                # cStringIO doesn't like amt=3DNone
--                data =3D self._fp.read() if not fp_closed else b""
-                 flush_decoder =3D True
-             else:
-                 cache_content =3D False
--                data =3D self._fp.read(amt) if not fp_closed else b""
-                 if (
-                     amt !=3D 0 and not data
-                 ):  # Platform-specific: Buggy versions of Python.
-@@ -612,9 +664,21 @@ def from_httplib(ResponseCls, r, **response_kw):
-=20
-     # Backwards-compatibility methods for http.client.HTTPResponse
-     def getheaders(self):
-+        warnings.warn(
-+            "HTTPResponse.getheaders() is deprecated and will be remove=
d "
-+            "in urllib3 v2.1.0. Instead access HTTPResponse.headers dir=
ectly.",
-+            category=3DDeprecationWarning,
-+            stacklevel=3D2,
-+        )
-         return self.headers
-=20
-     def getheader(self, name, default=3DNone):
-+        warnings.warn(
-+            "HTTPResponse.getheader() is deprecated and will be removed=
 "
-+            "in urllib3 v2.1.0. Instead use HTTPResponse.headers.get(na=
me, default).",
-+            category=3DDeprecationWarning,
-+            stacklevel=3D2,
-+        )
-         return self.headers.get(name, default)
-=20
-     # Backwards compatibility for http.cookiejar
-diff --git a/third_party/python/urllib3/urllib3/util/connection.py b/thi=
rd_party/python/urllib3/urllib3/util/connection.py
-index cd57455748be0..6af1138f260e4 100644
---- a/third_party/python/urllib3/urllib3/util/connection.py
-+++ b/third_party/python/urllib3/urllib3/util/connection.py
-@@ -2,9 +2,8 @@
-=20
- import socket
-=20
--from urllib3.exceptions import LocationParseError
--
- from ..contrib import _appengine_environ
-+from ..exceptions import LocationParseError
- from ..packages import six
- from .wait import NoWayToWaitForSocketError, wait_for_read
-=20
-@@ -118,7 +117,7 @@ def allowed_gai_family():
-=20
-=20
- def _has_ipv6(host):
--    """ Returns True if the system can bind an IPv6 address. """
-+    """Returns True if the system can bind an IPv6 address."""
-     sock =3D None
-     has_ipv6 =3D False
-=20
-diff --git a/third_party/python/urllib3/urllib3/util/proxy.py b/third_pa=
rty/python/urllib3/urllib3/util/proxy.py
-index 34f884d5b314d..2199cc7b7f004 100644
---- a/third_party/python/urllib3/urllib3/util/proxy.py
-+++ b/third_party/python/urllib3/urllib3/util/proxy.py
-@@ -45,6 +45,7 @@ def create_proxy_ssl_context(
-         ssl_version=3Dresolve_ssl_version(ssl_version),
-         cert_reqs=3Dresolve_cert_reqs(cert_reqs),
-     )
-+
-     if (
-         not ca_certs
-         and not ca_cert_dir
-diff --git a/third_party/python/urllib3/urllib3/util/request.py b/third_=
party/python/urllib3/urllib3/util/request.py
-index 25103383ec7ab..b574b081e98a0 100644
---- a/third_party/python/urllib3/urllib3/util/request.py
-+++ b/third_party/python/urllib3/urllib3/util/request.py
-@@ -14,7 +14,10 @@
-=20
- ACCEPT_ENCODING =3D "gzip,deflate"
- try:
--    import brotli as _unused_module_brotli  # noqa: F401
-+    try:
-+        import brotlicffi as _unused_module_brotli  # noqa: F401
-+    except ImportError:
-+        import brotli as _unused_module_brotli  # noqa: F401
- except ImportError:
-     pass
- else:
-diff --git a/third_party/python/urllib3/urllib3/util/retry.py b/third_pa=
rty/python/urllib3/urllib3/util/retry.py
-index ee51f922f8452..60ef6c4f3f9d0 100644
---- a/third_party/python/urllib3/urllib3/util/retry.py
-+++ b/third_party/python/urllib3/urllib3/util/retry.py
-@@ -37,7 +37,7 @@ class _RetryMeta(type):
-     def DEFAULT_METHOD_WHITELIST(cls):
-         warnings.warn(
-             "Using 'Retry.DEFAULT_METHOD_WHITELIST' is deprecated and "
--            "will be removed in v2.0. Use 'Retry.DEFAULT_METHODS_ALLOWE=
D' instead",
-+            "will be removed in v2.0. Use 'Retry.DEFAULT_ALLOWED_METHOD=
S' instead",
-             DeprecationWarning,
-         )
-         return cls.DEFAULT_ALLOWED_METHODS
-@@ -69,6 +69,24 @@ def DEFAULT_REDIRECT_HEADERS_BLACKLIST(cls, value):
-         )
-         cls.DEFAULT_REMOVE_HEADERS_ON_REDIRECT =3D value
-=20
-+    @property
-+    def BACKOFF_MAX(cls):
-+        warnings.warn(
-+            "Using 'Retry.BACKOFF_MAX' is deprecated and "
-+            "will be removed in v2.0. Use 'Retry.DEFAULT_BACKOFF_MAX' i=
nstead",
-+            DeprecationWarning,
-+        )
-+        return cls.DEFAULT_BACKOFF_MAX
-+
-+    @BACKOFF_MAX.setter
-+    def BACKOFF_MAX(cls, value):
-+        warnings.warn(
-+            "Using 'Retry.BACKOFF_MAX' is deprecated and "
-+            "will be removed in v2.0. Use 'Retry.DEFAULT_BACKOFF_MAX' i=
nstead",
-+            DeprecationWarning,
-+        )
-+        cls.DEFAULT_BACKOFF_MAX =3D value
-+
-=20
- @six.add_metaclass(_RetryMeta)
- class Retry(object):
-@@ -181,7 +199,7 @@ class Retry(object):
-=20
-         seconds. If the backoff_factor is 0.1, then :func:`.sleep` will=
 sleep
-         for [0.0s, 0.2s, 0.4s, ...] between retries. It will never be l=
onger
--        than :attr:`Retry.BACKOFF_MAX`.
-+        than :attr:`Retry.DEFAULT_BACKOFF_MAX`.
-=20
-         By default, backoff is disabled (set to 0).
-=20
-@@ -217,10 +235,10 @@ class Retry(object):
-     RETRY_AFTER_STATUS_CODES =3D frozenset([413, 429, 503])
-=20
-     #: Default headers to be used for ``remove_headers_on_redirect``
--    DEFAULT_REMOVE_HEADERS_ON_REDIRECT =3D frozenset(["Authorization"])
-+    DEFAULT_REMOVE_HEADERS_ON_REDIRECT =3D frozenset(["Cookie", "Author=
ization"])
-=20
-     #: Maximum backoff time.
--    BACKOFF_MAX =3D 120
-+    DEFAULT_BACKOFF_MAX =3D 120
-=20
-     def __init__(
-         self,
-@@ -253,6 +271,7 @@ def __init__(
-                 "Using 'method_whitelist' with Retry is deprecated and =
"
-                 "will be removed in v2.0. Use 'allowed_methods' instead=
",
-                 DeprecationWarning,
-+                stacklevel=3D2,
-             )
-             allowed_methods =3D method_whitelist
-         if allowed_methods is _Default:
-@@ -320,7 +339,7 @@ def new(self, **kw):
-=20
-     @classmethod
-     def from_int(cls, retries, redirect=3DTrue, default=3DNone):
--        """ Backwards-compatibility for the old retries format."""
-+        """Backwards-compatibility for the old retries format."""
-         if retries is None:
-             retries =3D default if default is not None else cls.DEFAULT
-=20
-@@ -347,7 +366,7 @@ def get_backoff_time(self):
-             return 0
-=20
-         backoff_value =3D self.backoff_factor * (2 ** (consecutive_erro=
rs_len - 1))
--        return min(self.BACKOFF_MAX, backoff_value)
-+        return min(self.DEFAULT_BACKOFF_MAX, backoff_value)
-=20
-     def parse_retry_after(self, retry_after):
-         # Whitespace: https://tools.ietf.org/html/rfc7230#section-3.2.4
-@@ -373,9 +392,9 @@ def parse_retry_after(self, retry_after):
-         return seconds
-=20
-     def get_retry_after(self, response):
--        """ Get the value of Retry-After in seconds. """
-+        """Get the value of Retry-After in seconds."""
-=20
--        retry_after =3D response.getheader("Retry-After")
-+        retry_after =3D response.headers.get("Retry-After")
-=20
-         if retry_after is None:
-             return None
-@@ -467,7 +486,7 @@ def is_retry(self, method, status_code, has_retry_af=
ter=3DFalse):
-         )
-=20
-     def is_exhausted(self):
--        """ Are we out of retries? """
-+        """Are we out of retries?"""
-         retry_counts =3D (
-             self.total,
-             self.connect,
-diff --git a/third_party/python/urllib3/urllib3/util/ssl_.py b/third_par=
ty/python/urllib3/urllib3/util/ssl_.py
-index 1cb5e7cdc1c0c..8f867812a5eb3 100644
---- a/third_party/python/urllib3/urllib3/util/ssl_.py
-+++ b/third_party/python/urllib3/urllib3/util/ssl_.py
-@@ -44,13 +44,21 @@ def _const_compare_digest_backport(a, b):
-=20
- try:  # Test for SSL features
-     import ssl
--    from ssl import HAS_SNI  # Has SNI?
-     from ssl import CERT_REQUIRED, wrap_socket
-+except ImportError:
-+    pass
-+
-+try:
-+    from ssl import HAS_SNI  # Has SNI?
-+except ImportError:
-+    pass
-=20
-+try:
-     from .ssltransport import SSLTransport
- except ImportError:
-     pass
-=20
-+
- try:  # Platform-specific: Python 3.6
-     from ssl import PROTOCOL_TLS
-=20
-@@ -63,6 +71,11 @@ def _const_compare_digest_backport(a, b):
-     except ImportError:
-         PROTOCOL_SSLv23 =3D PROTOCOL_TLS =3D 2
-=20
-+try:
-+    from ssl import PROTOCOL_TLS_CLIENT
-+except ImportError:
-+    PROTOCOL_TLS_CLIENT =3D PROTOCOL_TLS
-+
-=20
- try:
-     from ssl import OP_NO_COMPRESSION, OP_NO_SSLv2, OP_NO_SSLv3
-@@ -151,7 +164,7 @@ def wrap_socket(self, socket, server_hostname=3DNone=
, server_side=3DFalse):
-                 "urllib3 from configuring SSL appropriately and may cau=
se "
-                 "certain SSL connections to fail. You can upgrade to a =
newer "
-                 "version of Python to solve this. For more information,=
 see "
--                "https://urllib3.readthedocs.io/en/latest/advanced-usag=
e.html"
-+                "https://urllib3.readthedocs.io/en/1.26.x/advanced-usag=
e.html"
-                 "#ssl-warnings",
-                 InsecurePlatformWarning,
-             )
-@@ -270,7 +283,11 @@ def create_urllib3_context(
-         Constructed SSLContext object with specified options
-     :rtype: SSLContext
-     """
--    context =3D SSLContext(ssl_version or PROTOCOL_TLS)
-+    # PROTOCOL_TLS is deprecated in Python 3.10
-+    if not ssl_version or ssl_version =3D=3D PROTOCOL_TLS:
-+        ssl_version =3D PROTOCOL_TLS_CLIENT
-+
-+    context =3D SSLContext(ssl_version)
-=20
-     context.set_ciphers(ciphers or DEFAULT_CIPHERS)
-=20
-@@ -305,13 +322,25 @@ def create_urllib3_context(
-     ) is not None:
-         context.post_handshake_auth =3D True
-=20
--    context.verify_mode =3D cert_reqs
--    if (
--        getattr(context, "check_hostname", None) is not None
--    ):  # Platform-specific: Python 3.2
--        # We do our own verification, including fingerprints and altern=
ative
--        # hostnames. So disable it here
--        context.check_hostname =3D False
-+    def disable_check_hostname():
-+        if (
-+            getattr(context, "check_hostname", None) is not None
-+        ):  # Platform-specific: Python 3.2
-+            # We do our own verification, including fingerprints and al=
ternative
-+            # hostnames. So disable it here
-+            context.check_hostname =3D False
-+
-+    # The order of the below lines setting verify_mode and check_hostna=
me
-+    # matter due to safe-guards SSLContext has to prevent an SSLContext=
 with
-+    # check_hostname=3DTrue, verify_mode=3DNONE/OPTIONAL. This is made =
even more
-+    # complex because we don't know whether PROTOCOL_TLS_CLIENT will be=
 used
-+    # or not so we don't know the initial state of the freshly created =
SSLContext.
-+    if cert_reqs =3D=3D ssl.CERT_REQUIRED:
-+        context.verify_mode =3D cert_reqs
-+        disable_check_hostname()
-+    else:
-+        disable_check_hostname()
-+        context.verify_mode =3D cert_reqs
-=20
-     # Enable logging of TLS session keys via defacto standard environme=
nt variable
-     # 'SSLKEYLOGFILE', if the feature is available (Python 3.8+). Skip =
empty values.
-@@ -393,7 +422,7 @@ def ssl_wrap_socket(
-     try:
-         if hasattr(context, "set_alpn_protocols"):
-             context.set_alpn_protocols(ALPN_PROTOCOLS)
--    except NotImplementedError:
-+    except NotImplementedError:  # Defensive: in CI, we always have set=
_alpn_protocols
-         pass
-=20
-     # If we detect server_hostname is an IP address then the SNI
-@@ -411,7 +440,7 @@ def ssl_wrap_socket(
-             "This may cause the server to present an incorrect TLS "
-             "certificate, which can cause validation failures. You can =
upgrade to "
-             "a newer version of Python to solve this. For more informat=
ion, see "
--            "https://urllib3.readthedocs.io/en/latest/advanced-usage.ht=
ml"
-+            "https://urllib3.readthedocs.io/en/1.26.x/advanced-usage.ht=
ml"
-             "#ssl-warnings",
-             SNIMissingWarning,
-         )
-diff --git a/third_party/python/urllib3/urllib3/packages/ssl_match_hostn=
ame/_implementation.py b/third_party/python/urllib3/urllib3/util/ssl_matc=
h_hostname.py
-similarity index 92%
-rename from third_party/python/urllib3/urllib3/packages/ssl_match_hostna=
me/_implementation.py
-rename to third_party/python/urllib3/urllib3/util/ssl_match_hostname.py
-index 689208d3c63f1..1dd950c489607 100644
---- a/third_party/python/urllib3/urllib3/packages/ssl_match_hostname/_im=
plementation.py
-+++ b/third_party/python/urllib3/urllib3/util/ssl_match_hostname.py
-@@ -9,7 +9,7 @@
- # ipaddress has been backported to 2.6+ in pypi.  If it is installed on=
 the
- # system, use it to handle IPAddress ServerAltnames (this was added in
- # python-3.5) otherwise only do DNS matching.  This allows
--# backports.ssl_match_hostname to continue to be used in Python 2.7.
-+# util.ssl_match_hostname to continue to be used in Python 2.7.
- try:
-     import ipaddress
- except ImportError:
-@@ -78,7 +78,8 @@ def _dnsname_match(dn, hostname, max_wildcards=3D1):
-=20
- def _to_unicode(obj):
-     if isinstance(obj, str) and sys.version_info < (3,):
--        obj =3D unicode(obj, encoding=3D"ascii", errors=3D"strict")
-+        # ignored flake8 # F821 to support python 2.7 function
-+        obj =3D unicode(obj, encoding=3D"ascii", errors=3D"strict")  # =
noqa: F821
-     return obj
-=20
-=20
-@@ -111,11 +112,9 @@ def match_hostname(cert, hostname):
-     try:
-         # Divergence from upstream: ipaddress can't handle byte str
-         host_ip =3D ipaddress.ip_address(_to_unicode(hostname))
--    except ValueError:
--        # Not an IP address (common case)
--        host_ip =3D None
--    except UnicodeError:
--        # Divergence from upstream: Have to deal with ipaddress not tak=
ing
-+    except (UnicodeError, ValueError):
-+        # ValueError: Not an IP address (common case)
-+        # UnicodeError: Divergence from upstream: Have to deal with ipa=
ddress not taking
-         # byte strings.  addresses should be all ascii, so we consider =
it not
-         # an ipaddress in this case
-         host_ip =3D None
-@@ -123,7 +122,7 @@ def match_hostname(cert, hostname):
-         # Divergence from upstream: Make ipaddress library optional
-         if ipaddress is None:
-             host_ip =3D None
--        else:
-+        else:  # Defensive
-             raise
-     dnsnames =3D []
-     san =3D cert.get("subjectAltName", ())
-diff --git a/third_party/python/urllib3/urllib3/util/ssltransport.py b/t=
hird_party/python/urllib3/urllib3/util/ssltransport.py
-index 1e41354f5d458..4a7105d17916a 100644
---- a/third_party/python/urllib3/urllib3/util/ssltransport.py
-+++ b/third_party/python/urllib3/urllib3/util/ssltransport.py
-@@ -2,8 +2,8 @@
- import socket
- import ssl
-=20
--from urllib3.exceptions import ProxySchemeUnsupported
--from urllib3.packages import six
-+from ..exceptions import ProxySchemeUnsupported
-+from ..packages import six
-=20
- SSL_BLOCKSIZE =3D 16384
-=20
-@@ -193,7 +193,7 @@ def _wrap_ssl_read(self, len, buffer=3DNone):
-                 raise
-=20
-     def _ssl_io_loop(self, func, *args):
--        """ Performs an I/O loop between incoming/outgoing and the sock=
et."""
-+        """Performs an I/O loop between incoming/outgoing and the socke=
t."""
-         should_loop =3D True
-         ret =3D None
-=20
-diff --git a/third_party/python/urllib3/urllib3/util/timeout.py b/third_=
party/python/urllib3/urllib3/util/timeout.py
-index ff69593b05b5e..78e18a6272482 100644
---- a/third_party/python/urllib3/urllib3/util/timeout.py
-+++ b/third_party/python/urllib3/urllib3/util/timeout.py
-@@ -2,9 +2,8 @@
-=20
- import time
-=20
--# The default socket timeout, used by httplib to indicate that no timeo=
ut was
--# specified by the user
--from socket import _GLOBAL_DEFAULT_TIMEOUT
-+# The default socket timeout, used by httplib to indicate that no timeo=
ut was; specified by the user
-+from socket import _GLOBAL_DEFAULT_TIMEOUT, getdefaulttimeout
-=20
- from ..exceptions import TimeoutStateError
-=20
-@@ -116,6 +115,10 @@ def __repr__(self):
-     # __str__ provided for backwards compatibility
-     __str__ =3D __repr__
-=20
-+    @classmethod
-+    def resolve_default_timeout(cls, timeout):
-+        return getdefaulttimeout() if timeout is cls.DEFAULT_TIMEOUT el=
se timeout
-+
-     @classmethod
-     def _validate_timeout(cls, value, name):
-         """Check that a timeout attribute is valid.
-diff --git a/third_party/python/urllib3/urllib3/util/url.py b/third_part=
y/python/urllib3/urllib3/util/url.py
-index 6ff238fe3cbd0..e5682d3be4293 100644
---- a/third_party/python/urllib3/urllib3/util/url.py
-+++ b/third_party/python/urllib3/urllib3/util/url.py
-@@ -50,7 +50,7 @@
-     "(?:(?:%(hex)s:){0,6}%(hex)s)?::",
- ]
-=20
--UNRESERVED_PAT =3D r"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwx=
yz0123456789._!\-~"
-+UNRESERVED_PAT =3D r"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwx=
yz0123456789._\-~"
- IPV6_PAT =3D "(?:" + "|".join([x % _subs for x in _variations]) + ")"
- ZONE_ID_PAT =3D "(?:%25|%)(?:[" + UNRESERVED_PAT + "]|%[a-fA-F0-9]{2})+=
"
- IPV6_ADDRZ_PAT =3D r"\[" + IPV6_PAT + r"(?:" + ZONE_ID_PAT + r")?\]"
-@@ -63,12 +63,12 @@
- BRACELESS_IPV6_ADDRZ_RE =3D re.compile("^" + IPV6_ADDRZ_PAT[2:-2] + "$"=
)
- ZONE_ID_RE =3D re.compile("(" + ZONE_ID_PAT + r")\]$")
-=20
--SUBAUTHORITY_PAT =3D (u"^(?:(.*)@)?(%s|%s|%s)(?::([0-9]{0,5}))?$") % (
-+_HOST_PORT_PAT =3D ("^(%s|%s|%s)(?::0*?(|0|[1-9][0-9]{0,4}))?$") % (
-     REG_NAME_PAT,
-     IPV4_PAT,
-     IPV6_ADDRZ_PAT,
- )
--SUBAUTHORITY_RE =3D re.compile(SUBAUTHORITY_PAT, re.UNICODE | re.DOTALL=
)
-+_HOST_PORT_RE =3D re.compile(_HOST_PORT_PAT, re.UNICODE | re.DOTALL)
-=20
- UNRESERVED_CHARS =3D set(
-     "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789._-~=
"
-@@ -279,6 +279,9 @@ def _normalize_host(host, scheme):
-         if scheme in NORMALIZABLE_SCHEMES:
-             is_ipv6 =3D IPV6_ADDRZ_RE.match(host)
-             if is_ipv6:
-+                # IPv6 hosts of the form 'a::b%zone' are encoded in a U=
RL as
-+                # such per RFC 6874: 'a::b%25zone'. Unquote the ZoneID
-+                # separator as necessary to return a valid RFC 4007 sco=
ped IP.
-                 match =3D ZONE_ID_RE.search(host)
-                 if match:
-                     start, end =3D match.span(1)
-@@ -300,7 +303,7 @@ def _normalize_host(host, scheme):
-=20
-=20
- def _idna_encode(name):
--    if name and any([ord(x) > 128 for x in name]):
-+    if name and any(ord(x) >=3D 128 for x in name):
-         try:
-             import idna
-         except ImportError:
-@@ -331,7 +334,7 @@ def parse_url(url):
-     """
-     Given a url, return a parsed :class:`.Url` namedtuple. Best-effort =
is
-     performed to parse incomplete urls. Fields not provided will be Non=
e.
--    This parser is RFC 3986 compliant.
-+    This parser is RFC 3986 and RFC 6874 compliant.
-=20
-     The parser logic and helper functions are based heavily on
-     work done in the ``rfc3986`` module.
-@@ -365,7 +368,9 @@ def parse_url(url):
-             scheme =3D scheme.lower()
-=20
-         if authority:
--            auth, host, port =3D SUBAUTHORITY_RE.match(authority).group=
s()
-+            auth, _, host_port =3D authority.rpartition("@")
-+            auth =3D auth or None
-+            host, port =3D _HOST_PORT_RE.match(host_port).groups()
-             if auth and normalize_uri:
-                 auth =3D _encode_invalid_chars(auth, USERINFO_CHARS)
-             if port =3D=3D "":
-diff --git a/third_party/python/urllib3/urllib3/util/wait.py b/third_par=
ty/python/urllib3/urllib3/util/wait.py
-index c280646c7be0b..21b4590b3dc9b 100644
---- a/third_party/python/urllib3/urllib3/util/wait.py
-+++ b/third_party/python/urllib3/urllib3/util/wait.py
-@@ -42,7 +42,6 @@ class NoWayToWaitForSocketError(Exception):
-     def _retry_on_intr(fn, timeout):
-         return fn(timeout)
-=20
--
- else:
-     # Old and broken Pythons.
-     def _retry_on_intr(fn, timeout):
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115_115.6.0.bb b/meta-o=
e/recipes-extended/mozjs/mozjs-115_115.8.0.bb
similarity index 96%
rename from meta-oe/recipes-extended/mozjs/mozjs-115_115.6.0.bb
rename to meta-oe/recipes-extended/mozjs/mozjs-115_115.8.0.bb
index 4d9bb0e58..4e36acabb 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-115_115.6.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115_115.8.0.bb
@@ -15,10 +15,9 @@ SRC_URI =3D "https://archive.mozilla.org/pub/firefox/r=
eleases/${PV}esr/source/fire
            file://0001-rewrite-cargo-host-linker-in-python3.patch  \
            file://musl-disable-stackwalk.patch \
            file://0001-add-arm-to-list-of-mozinline.patch \
-           file://py3.12.patch \
            file://armv5.patch \
            "
-SRC_URI[sha256sum] =3D "66d7e6e5129ac8e6fe83e24227dc7bb8dc42650bc53b2183=
8e614de80d22bc66"
+SRC_URI[sha256sum] =3D "af8086f23efc8492d286671f6035b1a915de6f4ed5c7897e=
40be0e1cb6b895ea"
=20
 S =3D "${WORKDIR}/firefox-${PV}"
=20
--=20
2.43.0


