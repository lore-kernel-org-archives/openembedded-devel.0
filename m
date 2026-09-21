Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69BAC982FC
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 11:56:10 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47167.1789991765235311533
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 04:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=L59yHaT2;
 spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout09.t-online.de (Postfix) with SMTP id B382E38175
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 13:55:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8cc9-04X1z20; Mon, 21 Sep 2026 13:55:17 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 05/24] python3-ecdsa: drop the six dependency
Date: Mon, 21 Sep 2026 13:54:41 +0200
Message-ID: <20260921115500.53770-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921115500.53770-1-f_l_k@t-online.de>
References: <20260921115500.53770-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789991717-19FF8A93-0277A7CD/0/0 CLEAN NORMAL
X-TOI-MSGID: 1aabd7a8-d8eb-48d0-a6c8-6b97e9cb05c6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789991721; i=f_l_k@t-online.de;
	bh=4eYEJ8y7J7Cu62EDCZAbLySgEwewBXqmIcqNgwJ/ICU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=L59yHaT2kma4k5nmnbudHTSYuAVJnBMJRCwVptpKXl7MPPeotWCZJXinTaU8jTZmC
	 AbbOh6Ye3WAQ5plZr4kTlQupQ+rA26VH8jzDgvI0tDGMAWN06FbPdYFuc65QiqnAn7
	 FeRcS0L6QQB830W2mD5mrlLj8bJ1chVPJLNBkYuQifQOrsxJloB1UPU6HQcAYgbGVa
	 qpNVq2WHI/nyIcesJgB5Q6vFlhpeTBsQiTLlyBk3VS2q5BTbTi5ZucFJI9I47/gwco
	 T6g6Wj3zG3d9Mz56Th1RnfpVHsBgzA8Bx3V5v0DnsP5O9CLr31R0gN4dmoBepucdmz
	 5kMQfXzvdhuTw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 11:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130141

Patch ecdsa to use the Python 3 equivalents of the six helpers and drop
the runtime dependency.

Built for intel-corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-drop-the-six-dependency.patch        | 393 ++++++++++++++++++
 .../python/python3-ecdsa_0.19.2.bb            |   2 +-
 2 files changed, 394 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-ecdsa/000=
1-drop-the-six-dependency.patch

diff --git a/meta-python/recipes-devtools/python/python3-ecdsa/0001-drop-=
the-six-dependency.patch b/meta-python/recipes-devtools/python/python3-ec=
dsa/0001-drop-the-six-dependency.patch
new file mode 100644
index 0000000000..3104aae6d0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ecdsa/0001-drop-the-six=
-dependency.patch
@@ -0,0 +1,393 @@
+From 53f1f05e81e03b023c08a28d0d2b6d28766cb5cd Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 21 Sep 2026 13:05:32 +0200
+Subject: [PATCH] drop the six dependency
+
+six is a Python 2 compatibility shim. On Python 3 int2byte is a one line
+struct helper, and PY2, integer_types, text_type, binary_type,
+python_2_unicode_compatible and six.moves.reduce all have direct
+equivalents, so the module keeps its behaviour without the dependency.
+
+Upstream-Status: Pending
+
+AI-Generated: Uses Claude Code (Claude Opus 5)
+---
+ requirements.txt           | 1 -
+ setup.py                   | 1 -
+ src/ecdsa/__init__.py      | 5 -----
+ src/ecdsa/_compat.py       | 6 ++++--
+ src/ecdsa/curves.py        | 3 +--
+ src/ecdsa/der.py           | 5 ++---
+ src/ecdsa/ecdsa.py         | 3 +--
+ src/ecdsa/ellipticcurve.py | 2 --
+ src/ecdsa/keys.py          | 3 +--
+ src/ecdsa/numbertheory.py  | 11 ++++-------
+ src/ecdsa/test_pyecdsa.py  | 35 +++++++++++++++++------------------
+ src/ecdsa/util.py          | 8 ++------
+ 12 files changed, 32 insertions(+), 51 deletions(-)
+
+diff --git a/requirements.txt b/requirements.txt
+index ffe2fce..e69de29 100644
+--- a/requirements.txt
++++ b/requirements.txt
+@@ -1 +0,0 @@
+-six
+diff --git a/setup.py b/setup.py
+index 618f5e6..8aceb5b 100755
+--- a/setup.py
++++ b/setup.py
+@@ -44,6 +44,5 @@ setup(
+         "Programming Language :: Python :: 3.12",
+         "Programming Language :: Python :: 3.13",
+     ],
+-    install_requires=3D["six>=3D1.9.0"],
+     extras_require=3D{"gmpy2": "gmpy2", "gmpy": "gmpy"},
+ )
+diff --git a/src/ecdsa/__init__.py b/src/ecdsa/__init__.py
+index 342538e..64aaa55 100644
+--- a/src/ecdsa/__init__.py
++++ b/src/ecdsa/__init__.py
+@@ -1,6 +1,3 @@
+-# while we don't use six in this file, we did bundle it for a long time=
, so
+-# keep as part of module in a virtual way (through __all__)
+-import six
+ from .keys import (
+     SigningKey,
+     VerifyingKey,
+@@ -56,7 +53,6 @@ __all__ =3D [
+     "numbertheory",
+     "test_pyecdsa",
+     "util",
+-    "six",
+ ]
+=20
+ _hush_pyflakes =3D [
+@@ -90,7 +86,6 @@ _hush_pyflakes =3D [
+     SECP160r1,
+     Ed25519,
+     Ed448,
+-    six.b(""),
+     BRAINPOOLP160t1,
+     BRAINPOOLP192t1,
+     BRAINPOOLP224t1,
+diff --git a/src/ecdsa/_compat.py b/src/ecdsa/_compat.py
+index 4558e33..bd410f9 100644
+--- a/src/ecdsa/_compat.py
++++ b/src/ecdsa/_compat.py
+@@ -4,13 +4,15 @@ Common functions for providing cross-python version co=
mpatibility.
+ import sys
+ import re
+ import binascii
+-from six import integer_types
++import struct
++
++int2byte =3D struct.Struct(">B").pack
+=20
+=20
+ def str_idx_as_int(string, index):
+     """Take index'th byte from string, return as integer"""
+     val =3D string[index]
+-    if isinstance(val, integer_types):
++    if isinstance(val, int):
+         return val
+     return ord(val)
+=20
+diff --git a/src/ecdsa/curves.py b/src/ecdsa/curves.py
+index 38e3a75..7662185 100644
+--- a/src/ecdsa/curves.py
++++ b/src/ecdsa/curves.py
+@@ -1,6 +1,5 @@
+ from __future__ import division
+=20
+-from six import PY2
+ from . import der, ecdsa, ellipticcurve, eddsa
+ from .util import orderlen, number_to_string, string_to_number
+ from ._compat import normalise_bytes, bit_length
+@@ -269,7 +268,7 @@ class Curve:
+             and ``explicit``
+         :type valid_encodings: :term:`set-like object`
+         """
+-        if not PY2 and isinstance(string, str):  # pragma: no branch
++        if isinstance(string, str):  # pragma: no branch
+             string =3D string.encode()
+=20
+         ec_param_index =3D string.find(b"-----BEGIN EC PARAMETERS-----"=
)
+diff --git a/src/ecdsa/der.py b/src/ecdsa/der.py
+index 5d35d69..42440cc 100644
+--- a/src/ecdsa/der.py
++++ b/src/ecdsa/der.py
+@@ -4,8 +4,7 @@ import binascii
+ import base64
+ import warnings
+ from itertools import chain
+-from six import int2byte, text_type
+-from ._compat import compat26_str, str_idx_as_int
++from ._compat import compat26_str, int2byte, str_idx_as_int
+=20
+=20
+ class UnexpectedDER(Exception):
+@@ -461,7 +460,7 @@ def remove_bitstring(string, expect_unused=3D_sentry=
):
+=20
+=20
+ def unpem(pem):
+-    if isinstance(pem, text_type):  # pragma: no branch
++    if isinstance(pem, str):  # pragma: no branch
+         pem =3D pem.encode()
+=20
+     d =3D b"".join(
+diff --git a/src/ecdsa/ecdsa.py b/src/ecdsa/ecdsa.py
+index f710965..6877a2f 100644
+--- a/src/ecdsa/ecdsa.py
++++ b/src/ecdsa/ecdsa.py
+@@ -65,11 +65,10 @@ modified as part of the python-ecdsa package.
+ """
+=20
+ import warnings
+-from six import int2byte
+ from . import ellipticcurve
+ from . import numbertheory
+ from .util import bit_length
+-from ._compat import remove_whitespace
++from ._compat import int2byte, remove_whitespace
+=20
+=20
+ class RSZeroError(RuntimeError):
+diff --git a/src/ecdsa/ellipticcurve.py b/src/ecdsa/ellipticcurve.py
+index a982c1e..0e9db2e 100644
+--- a/src/ecdsa/ellipticcurve.py
++++ b/src/ecdsa/ellipticcurve.py
+@@ -47,14 +47,12 @@ except ImportError:  # pragma: no branch
+         GMPY =3D False
+=20
+=20
+-from six import python_2_unicode_compatible
+ from . import numbertheory
+ from ._compat import normalise_bytes, int_to_bytes, bit_length, bytes_t=
o_int
+ from .errors import MalformedPointError
+ from .util import orderlen, string_to_number, number_to_string
+=20
+=20
+-@python_2_unicode_compatible
+ class CurveFp(object):
+     """
+     :term:`Short Weierstrass Elliptic Curve <short Weierstrass curve>` =
over a
+diff --git a/src/ecdsa/keys.py b/src/ecdsa/keys.py
+index f74252c..75e059f 100644
+--- a/src/ecdsa/keys.py
++++ b/src/ecdsa/keys.py
+@@ -5,7 +5,6 @@ Primary classes for performing signing and verification =
operations.
+ import binascii
+ from hashlib import sha1
+ import os
+-from six import PY2
+ from . import ecdsa, eddsa
+ from . import der, ssh
+ from . import rfc6979
+@@ -963,7 +962,7 @@ class SigningKey(object):
+         :return: Initialised SigningKey object
+         :rtype: SigningKey
+         """
+-        if not PY2 and isinstance(string, str):  # pragma: no branch
++        if isinstance(string, str):  # pragma: no branch
+             string =3D string.encode()
+=20
+         # The privkey pem may have multiple sections, commonly it also =
has
+diff --git a/src/ecdsa/numbertheory.py b/src/ecdsa/numbertheory.py
+index fe974f8..9d55047 100644
+--- a/src/ecdsa/numbertheory.py
++++ b/src/ecdsa/numbertheory.py
+@@ -12,8 +12,9 @@
+ from __future__ import division
+=20
+ import sys
+-from six import integer_types, PY2
+-from six.moves import reduce
++from functools import reduce
++
++integer_types =3D (int,)
+=20
+ try:
+     xrange
+@@ -218,11 +219,7 @@ def square_root_mod_prime(a, p):
+         assert d =3D=3D p - 1
+         return (2 * a * pow(4 * a, (p - 5) // 8, p)) % p
+=20
+-    if PY2:
+-        # xrange on python2 can take integers representable as C long o=
nly
+-        range_top =3D min(0x7FFFFFFF, p)
+-    else:
+-        range_top =3D p
++    range_top =3D p
+     for b in xrange(2, range_top):  # pragma: no branch
+         if jacobi(b * b - 4 * a, p) =3D=3D -1:
+             f =3D (a, -b, 1)
+diff --git a/src/ecdsa/test_pyecdsa.py b/src/ecdsa/test_pyecdsa.py
+index 799e9b7..6d95672 100644
+--- a/src/ecdsa/test_pyecdsa.py
++++ b/src/ecdsa/test_pyecdsa.py
+@@ -16,7 +16,6 @@ from functools import partial
+ from hypothesis import given, settings
+ import hypothesis.strategies as st
+=20
+-from six import binary_type
+ from .keys import SigningKey, VerifyingKey
+ from .keys import BadSignatureError, MalformedPointError, BadDigestErro=
r
+ from . import util
+@@ -235,47 +234,47 @@ class ECDSA(unittest.TestCase):
+     def test_privkey_strings(self):
+         priv1 =3D SigningKey.generate()
+         s1 =3D priv1.to_string()
+-        self.assertEqual(type(s1), binary_type)
++        self.assertEqual(type(s1), bytes)
+         self.assertEqual(len(s1), NIST192p.baselen)
+         priv2 =3D SigningKey.from_string(s1)
+         self.assertTruePrivkeysEqual(priv1, priv2)
+=20
+         s1 =3D priv1.to_pem()
+-        self.assertEqual(type(s1), binary_type)
++        self.assertEqual(type(s1), bytes)
+         self.assertTrue(s1.startswith(b"-----BEGIN EC PRIVATE KEY-----"=
))
+         self.assertTrue(s1.strip().endswith(b"-----END EC PRIVATE KEY--=
---"))
+         priv2 =3D SigningKey.from_pem(s1)
+         self.assertTruePrivkeysEqual(priv1, priv2)
+=20
+         s1 =3D priv1.to_der()
+-        self.assertEqual(type(s1), binary_type)
++        self.assertEqual(type(s1), bytes)
+         priv2 =3D SigningKey.from_der(s1)
+         self.assertTruePrivkeysEqual(priv1, priv2)
+=20
+         priv1 =3D SigningKey.generate(curve=3DNIST256p)
+         s1 =3D priv1.to_pem()
+-        self.assertEqual(type(s1), binary_type)
++        self.assertEqual(type(s1), bytes)
+         self.assertTrue(s1.startswith(b"-----BEGIN EC PRIVATE KEY-----"=
))
+         self.assertTrue(s1.strip().endswith(b"-----END EC PRIVATE KEY--=
---"))
+         priv2 =3D SigningKey.from_pem(s1)
+         self.assertTruePrivkeysEqual(priv1, priv2)
+=20
+         s1 =3D priv1.to_der()
+-        self.assertEqual(type(s1), binary_type)
++        self.assertEqual(type(s1), bytes)
+         priv2 =3D SigningKey.from_der(s1)
+         self.assertTruePrivkeysEqual(priv1, priv2)
+=20
+     def test_privkey_strings_brainpool(self):
+         priv1 =3D SigningKey.generate(curve=3DBRAINPOOLP512r1)
+         s1 =3D priv1.to_pem()
+-        self.assertEqual(type(s1), binary_type)
++        self.assertEqual(type(s1), bytes)
+         self.assertTrue(s1.startswith(b"-----BEGIN EC PRIVATE KEY-----"=
))
+         self.assertTrue(s1.strip().endswith(b"-----END EC PRIVATE KEY--=
---"))
+         priv2 =3D SigningKey.from_pem(s1)
+         self.assertTruePrivkeysEqual(priv1, priv2)
+=20
+         s1 =3D priv1.to_der()
+-        self.assertEqual(type(s1), binary_type)
++        self.assertEqual(type(s1), bytes)
+         priv2 =3D SigningKey.from_der(s1)
+         self.assertTruePrivkeysEqual(priv1, priv2)
+=20
+@@ -288,7 +287,7 @@ class ECDSA(unittest.TestCase):
+         priv1 =3D SigningKey.generate()
+         pub1 =3D priv1.get_verifying_key()
+         s1 =3D pub1.to_string()
+-        self.assertEqual(type(s1), binary_type)
++        self.assertEqual(type(s1), bytes)
+         self.assertEqual(len(s1), NIST192p.verifying_key_length)
+         pub2 =3D VerifyingKey.from_string(s1)
+         self.assertTruePubkeysEqual(pub1, pub2)
+@@ -296,13 +295,13 @@ class ECDSA(unittest.TestCase):
+         priv1 =3D SigningKey.generate(curve=3DNIST256p)
+         pub1 =3D priv1.get_verifying_key()
+         s1 =3D pub1.to_string()
+-        self.assertEqual(type(s1), binary_type)
++        self.assertEqual(type(s1), bytes)
+         self.assertEqual(len(s1), NIST256p.verifying_key_length)
+         pub2 =3D VerifyingKey.from_string(s1, curve=3DNIST256p)
+         self.assertTruePubkeysEqual(pub1, pub2)
+=20
+         pub1_der =3D pub1.to_der()
+-        self.assertEqual(type(pub1_der), binary_type)
++        self.assertEqual(type(pub1_der), bytes)
+         pub2 =3D VerifyingKey.from_der(pub1_der)
+         self.assertTruePubkeysEqual(pub1, pub2)
+=20
+@@ -330,7 +329,7 @@ class ECDSA(unittest.TestCase):
+         self.assertRaises(UnknownCurveError, VerifyingKey.from_der, bad=
der)
+=20
+         pem =3D pub1.to_pem()
+-        self.assertEqual(type(pem), binary_type)
++        self.assertEqual(type(pem), bytes)
+         self.assertTrue(pem.startswith(b"-----BEGIN PUBLIC KEY-----"), =
pem)
+         self.assertTrue(pem.strip().endswith(b"-----END PUBLIC KEY-----=
"), pem)
+         pub2 =3D VerifyingKey.from_pem(pem)
+@@ -340,13 +339,13 @@ class ECDSA(unittest.TestCase):
+         priv1 =3D SigningKey.generate(curve=3DBRAINPOOLP512r1)
+         pub1 =3D priv1.get_verifying_key()
+         s1 =3D pub1.to_string()
+-        self.assertEqual(type(s1), binary_type)
++        self.assertEqual(type(s1), bytes)
+         self.assertEqual(len(s1), BRAINPOOLP512r1.verifying_key_length)
+         pub2 =3D VerifyingKey.from_string(s1, curve=3DBRAINPOOLP512r1)
+         self.assertTruePubkeysEqual(pub1, pub2)
+=20
+         pub1_der =3D pub1.to_der()
+-        self.assertEqual(type(pub1_der), binary_type)
++        self.assertEqual(type(pub1_der), bytes)
+         pub2 =3D VerifyingKey.from_der(pub1_der)
+         self.assertTruePubkeysEqual(pub1, pub2)
+=20
+@@ -431,21 +430,21 @@ class ECDSA(unittest.TestCase):
+         data =3D b"data"
+=20
+         sig =3D priv1.sign(data)
+-        self.assertEqual(type(sig), binary_type)
++        self.assertEqual(type(sig), bytes)
+         self.assertEqual(len(sig), NIST192p.signature_length)
+         self.assertTrue(pub1.verify(sig, data))
+=20
+         sig =3D priv1.sign(data, sigencode=3Dsigencode_strings)
+         self.assertEqual(type(sig), tuple)
+         self.assertEqual(len(sig), 2)
+-        self.assertEqual(type(sig[0]), binary_type)
+-        self.assertEqual(type(sig[1]), binary_type)
++        self.assertEqual(type(sig[0]), bytes)
++        self.assertEqual(type(sig[1]), bytes)
+         self.assertEqual(len(sig[0]), NIST192p.baselen)
+         self.assertEqual(len(sig[1]), NIST192p.baselen)
+         self.assertTrue(pub1.verify(sig, data, sigdecode=3Dsigdecode_st=
rings))
+=20
+         sig_der =3D priv1.sign(data, sigencode=3Dsigencode_der)
+-        self.assertEqual(type(sig_der), binary_type)
++        self.assertEqual(type(sig_der), bytes)
+         self.assertTrue(pub1.verify(sig_der, data, sigdecode=3Dsigdecod=
e_der))
+=20
+     def test_sigencode_string_canonize_no_change(self):
+diff --git a/src/ecdsa/util.py b/src/ecdsa/util.py
+index 1aff5bf..06b2fdb 100644
+--- a/src/ecdsa/util.py
++++ b/src/ecdsa/util.py
+@@ -18,9 +18,8 @@ import math
+ import binascii
+ import sys
+ from hashlib import sha256
+-from six import PY2, int2byte, next
+ from . import der
+-from ._compat import normalise_bytes
++from ._compat import int2byte, normalise_bytes
+=20
+=20
+ # RFC5480:
+@@ -111,10 +110,7 @@ class PRNG:
+     def __call__(self, numbytes):
+         a =3D [next(self.generator) for i in range(numbytes)]
+=20
+-        if PY2:  # pragma: no branch
+-            return "".join(a)
+-        else:
+-            return bytes(a)
++        return bytes(a)
+=20
+     def block_generator(self, seed):
+         counter =3D 0
diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.19.2.bb =
b/meta-python/recipes-devtools/python/python3-ecdsa_0.19.2.bb
index 5142fff297..15d3682892 100644
--- a/meta-python/recipes-devtools/python/python3-ecdsa_0.19.2.bb
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.19.2.bb
@@ -3,6 +3,7 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D66ffc5e30f76cbb5358fe54b645e5=
a1d"
=20
+SRC_URI +=3D "file://0001-drop-the-six-dependency.patch"
 SRC_URI[sha256sum] =3D "62635b0ac1ca2e027f82122b5b81cb706edc38cd91c63dda=
28e4f3455a2bf930"
=20
 CVE_PRODUCT =3D "python-ecdsa_project:python-ecdsa tlsfuzzer:ecdsa"
@@ -23,7 +24,6 @@ do_install_ptest:append () {
 RDEPENDS:${PN} +=3D " \
 	python3-gmpy2 \
 	python3-json \
-	python3-six \
 "
=20
 do_install:append() {
--=20
2.55.0


