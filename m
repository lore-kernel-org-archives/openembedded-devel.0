Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF4CC982D7
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 09:33:27 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7232.1789724005293008657
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Sep 2026 02:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=I/DXhsQ/;
 spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout08.t-online.de (Postfix) with SMTP id D8764E4B4
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Sep 2026 11:33:22 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.164.121]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x7UyA-0EP8qm0; Fri, 18 Sep 2026 11:33:22 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-html5lib: drop the six dependency
Date: Fri, 18 Sep 2026 11:33:15 +0200
Message-ID: <20260918093315.337468-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789724002-4D7F99BC-B9845707/0/0 CLEAN NORMAL
X-TOI-MSGID: ffe4be8d-7033-4125-8e62-b6e0d0e8654f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789724002; i=f_l_k@t-online.de;
	bh=C89fCtDu0uAaxrDdmku+hVrpyLp35qm51+NTAznRynQ=;
	h=From:To:Subject:Date;
	b=I/DXhsQ//cNY0jF/bmNPDLUHJS9f4C6KmF321IDD/NFZReubBGRld/HjWT8/HT0HN
	 Hkv5dZgwKCa6ybXVMZXqdoT6Bc3vjdCZkaB+dt2bq0o3t7YoIP7g8uOG19AP8xLW5z
	 A/li8Mb/15fH8yOdbTQog+FqG0i14qbkppttCb+7ru4ClcN0xjgALsC3TXzi487bb0
	 oRUsPLhU596t6S6kptYf70nJDB7k7WbCd0Wp2S7ZigB1Xxk4DETpUGDatN5Q/+isjB
	 1b3B1c4AXQMV9z92BZlrgQJ1X2bWKWtz4pK/QSUvgLCT39Y9lmGPo+kcvgyWg9JN/H
	 XMUNyTGsWB6YQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Sep 2026 09:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130112

openembedded-core removed python3-six, so the recipe no longer resolves.
html5lib 1.1 only used six as a Python 2 compatibility layer; patch the
imports over to the Python 3 builtins and drop the runtime dependency.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
AI-Generated: Uses Claude Code (Claude Fable 5.1)
---
 .../0001-Drop-the-six-dependency.patch        | 397 ++++++++++++++++++
 .../python/python3-html5lib_1.1.bb            |   2 +-
 2 files changed, 398 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-html5lib/=
0001-Drop-the-six-dependency.patch

diff --git a/meta-python/recipes-devtools/python/python3-html5lib/0001-Dr=
op-the-six-dependency.patch b/meta-python/recipes-devtools/python/python3=
-html5lib/0001-Drop-the-six-dependency.patch
new file mode 100644
index 0000000000..f83c7de34e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-html5lib/0001-Drop-the-=
six-dependency.patch
@@ -0,0 +1,397 @@
+From 2d62ee4926f2597839b59201504a6075651b2978 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Fri, 18 Sep 2026 11:22:50 +0200
+Subject: [PATCH] Drop the six dependency
+
+html5lib only runs on Python 3 nowadays, so the six shims can be replace=
d by
+their builtins: text_type/string_types by str, binary_type by bytes, uni=
chr by
+chr, viewkeys by dict.keys, with_metaclass by the metaclass keyword and =
the
+six.moves imports by http.client, urllib.response and urllib.parse. The =
PY3
+branches collapse to their Python 3 half.
+
+Upstream-Status: Submitted [https://github.com/html5lib/html5lib-python/=
pull/581]
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ html5lib/_inputstream.py            |  8 ++++----
+ html5lib/_tokenizer.py              |  1 -
+ html5lib/_trie/py.py                |  3 +--
+ html5lib/_utils.py                  | 14 +++-----------
+ html5lib/filters/lint.py            | 29 ++++++++++++++---------------
+ html5lib/filters/sanitizer.py       |  2 +-
+ html5lib/html5parser.py             |  5 ++---
+ html5lib/serializer.py              |  5 ++---
+ html5lib/treebuilders/base.py       |  5 ++---
+ html5lib/treebuilders/etree.py      |  3 +--
+ html5lib/treebuilders/etree_lxml.py |  6 +-----
+ html5lib/treewalkers/etree.py       |  3 +--
+ html5lib/treewalkers/etree_lxml.py  |  3 +--
+ setup.py                            |  1 -
+ 14 files changed, 33 insertions(+), 55 deletions(-)
+
+diff --git a/html5lib/_inputstream.py b/html5lib/_inputstream.py
+index 0207dd2..5a2fc8c 100644
+--- a/html5lib/_inputstream.py
++++ b/html5lib/_inputstream.py
+@@ -1,7 +1,7 @@
+ from __future__ import absolute_import, division, unicode_literals
+=20
+-from six import text_type
+-from six.moves import http_client, urllib
++import http.client as http_client
++import urllib.response
+=20
+ import codecs
+ import re
+@@ -131,9 +131,9 @@ def HTMLInputStream(source, **kwargs):
+          isinstance(source.fp, http_client.HTTPResponse))):
+         isUnicode =3D False
+     elif hasattr(source, "read"):
+-        isUnicode =3D isinstance(source.read(0), text_type)
++        isUnicode =3D isinstance(source.read(0), str)
+     else:
+-        isUnicode =3D isinstance(source, text_type)
++        isUnicode =3D isinstance(source, str)
+=20
+     if isUnicode:
+         encodings =3D [x for x in kwargs if x.endswith("_encoding")]
+diff --git a/html5lib/_tokenizer.py b/html5lib/_tokenizer.py
+index 4748a19..5b20f49 100644
+--- a/html5lib/_tokenizer.py
++++ b/html5lib/_tokenizer.py
+@@ -1,6 +1,5 @@
+ from __future__ import absolute_import, division, unicode_literals
+=20
+-from six import unichr as chr
+=20
+ from collections import deque, OrderedDict
+ from sys import version_info
+diff --git a/html5lib/_trie/py.py b/html5lib/_trie/py.py
+index c2ba3da..cfe7513 100644
+--- a/html5lib/_trie/py.py
++++ b/html5lib/_trie/py.py
+@@ -1,5 +1,4 @@
+ from __future__ import absolute_import, division, unicode_literals
+-from six import text_type
+=20
+ from bisect import bisect_left
+=20
+@@ -8,7 +7,7 @@ from ._base import Trie as ABCTrie
+=20
+ class Trie(ABCTrie):
+     def __init__(self, data):
+-        if not all(isinstance(x, text_type) for x in data.keys()):
++        if not all(isinstance(x, str) for x in data.keys()):
+             raise TypeError("All keys must be strings")
+=20
+         self._data =3D data
+diff --git a/html5lib/_utils.py b/html5lib/_utils.py
+index 9ea5794..5bc56ec 100644
+--- a/html5lib/_utils.py
++++ b/html5lib/_utils.py
+@@ -7,15 +7,7 @@ try:
+ except ImportError:
+     from collections import Mapping
+=20
+-from six import text_type, PY3
+-
+-if PY3:
+-    import xml.etree.ElementTree as default_etree
+-else:
+-    try:
+-        import xml.etree.cElementTree as default_etree
+-    except ImportError:
+-        import xml.etree.ElementTree as default_etree
++import xml.etree.ElementTree as default_etree
+=20
+=20
+ __all__ =3D ["default_etree", "MethodDispatcher", "isSurrogatePair",
+@@ -31,10 +23,10 @@ __all__ =3D ["default_etree", "MethodDispatcher", "i=
sSurrogatePair",
+ # escapes.
+ try:
+     _x =3D eval('"\\uD800"')  # pylint:disable=3Deval-used
+-    if not isinstance(_x, text_type):
++    if not isinstance(_x, str):
+         # We need this with u"" because of http://bugs.jython.org/issue=
2039
+         _x =3D eval('u"\\uD800"')  # pylint:disable=3Deval-used
+-        assert isinstance(_x, text_type)
++        assert isinstance(_x, str)
+ except Exception:
+     supports_lone_surrogates =3D False
+ else:
+diff --git a/html5lib/filters/lint.py b/html5lib/filters/lint.py
+index acd4d7a..e012fb8 100644
+--- a/html5lib/filters/lint.py
++++ b/html5lib/filters/lint.py
+@@ -1,6 +1,5 @@
+ from __future__ import absolute_import, division, unicode_literals
+=20
+-from six import text_type
+=20
+ from . import base
+ from ..constants import namespaces, voidElements
+@@ -33,9 +32,9 @@ class Filter(base.Filter):
+             if type in ("StartTag", "EmptyTag"):
+                 namespace =3D token["namespace"]
+                 name =3D token["name"]
+-                assert namespace is None or isinstance(namespace, text_=
type)
++                assert namespace is None or isinstance(namespace, str)
+                 assert namespace !=3D ""
+-                assert isinstance(name, text_type)
++                assert isinstance(name, str)
+                 assert name !=3D ""
+                 assert isinstance(token["data"], dict)
+                 if (not namespace or namespace =3D=3D namespaces["html"=
]) and name in voidElements:
+@@ -45,18 +44,18 @@ class Filter(base.Filter):
+                 if type =3D=3D "StartTag" and self.require_matching_tag=
s:
+                     open_elements.append((namespace, name))
+                 for (namespace, name), value in token["data"].items():
+-                    assert namespace is None or isinstance(namespace, t=
ext_type)
++                    assert namespace is None or isinstance(namespace, s=
tr)
+                     assert namespace !=3D ""
+-                    assert isinstance(name, text_type)
++                    assert isinstance(name, str)
+                     assert name !=3D ""
+-                    assert isinstance(value, text_type)
++                    assert isinstance(value, str)
+=20
+             elif type =3D=3D "EndTag":
+                 namespace =3D token["namespace"]
+                 name =3D token["name"]
+-                assert namespace is None or isinstance(namespace, text_=
type)
++                assert namespace is None or isinstance(namespace, str)
+                 assert namespace !=3D ""
+-                assert isinstance(name, text_type)
++                assert isinstance(name, str)
+                 assert name !=3D ""
+                 if (not namespace or namespace =3D=3D namespaces["html"=
]) and name in voidElements:
+                     assert False, "Void element reported as EndTag toke=
n: %(tag)s" % {"tag": name}
+@@ -66,26 +65,26 @@ class Filter(base.Filter):
+=20
+             elif type =3D=3D "Comment":
+                 data =3D token["data"]
+-                assert isinstance(data, text_type)
++                assert isinstance(data, str)
+=20
+             elif type in ("Characters", "SpaceCharacters"):
+                 data =3D token["data"]
+-                assert isinstance(data, text_type)
++                assert isinstance(data, str)
+                 assert data !=3D ""
+                 if type =3D=3D "SpaceCharacters":
+                     assert data.strip(spaceCharacters) =3D=3D ""
+=20
+             elif type =3D=3D "Doctype":
+                 name =3D token["name"]
+-                assert name is None or isinstance(name, text_type)
+-                assert token["publicId"] is None or isinstance(name, te=
xt_type)
+-                assert token["systemId"] is None or isinstance(name, te=
xt_type)
++                assert name is None or isinstance(name, str)
++                assert token["publicId"] is None or isinstance(name, st=
r)
++                assert token["systemId"] is None or isinstance(name, st=
r)
+=20
+             elif type =3D=3D "Entity":
+-                assert isinstance(token["name"], text_type)
++                assert isinstance(token["name"], str)
+=20
+             elif type =3D=3D "SerializerError":
+-                assert isinstance(token["data"], text_type)
++                assert isinstance(token["data"], str)
+=20
+             else:
+                 assert False, "Unknown token type: %(type)s" % {"type":=
 type}
+diff --git a/html5lib/filters/sanitizer.py b/html5lib/filters/sanitizer.=
py
+index 70ef906..b949127 100644
+--- a/html5lib/filters/sanitizer.py
++++ b/html5lib/filters/sanitizer.py
+@@ -12,7 +12,7 @@ import re
+ import warnings
+ from xml.sax.saxutils import escape, unescape
+=20
+-from six.moves import urllib_parse as urlparse
++import urllib.parse as urlparse
+=20
+ from . import base
+ from ..constants import namespaces, prefixes
+diff --git a/html5lib/html5parser.py b/html5lib/html5parser.py
+index 74d829d..653f49a 100644
+--- a/html5lib/html5parser.py
++++ b/html5lib/html5parser.py
+@@ -1,5 +1,4 @@
+ from __future__ import absolute_import, division, unicode_literals
+-from six import with_metaclass, viewkeys
+=20
+ import types
+=20
+@@ -423,7 +422,7 @@ def getPhases(debug):
+             return type
+=20
+     # pylint:disable=3Dunused-argument
+-    class Phase(with_metaclass(getMetaclass(debug, log))):
++    class Phase(metaclass=3DgetMetaclass(debug, log)):
+         """Base class for helper object that implements each phase of p=
rocessing
+         """
+         __slots__ =3D ("parser", "tree", "__startTagCache", "__endTagCa=
che")
+@@ -2776,7 +2775,7 @@ def getPhases(debug):
+=20
+=20
+ def adjust_attributes(token, replacements):
+-    needs_adjustment =3D viewkeys(token['data']) & viewkeys(replacement=
s)
++    needs_adjustment =3D token['data'].keys() & replacements.keys()
+     if needs_adjustment:
+         token['data'] =3D type(token['data'])((replacements.get(k, k), =
v)
+                                             for k, v in token['data'].i=
tems())
+diff --git a/html5lib/serializer.py b/html5lib/serializer.py
+index c66df68..e3b8ea5 100644
+--- a/html5lib/serializer.py
++++ b/html5lib/serializer.py
+@@ -1,5 +1,4 @@
+ from __future__ import absolute_import, division, unicode_literals
+-from six import text_type
+=20
+ import re
+=20
+@@ -222,14 +221,14 @@ class HTMLSerializer(object):
+         self.strict =3D False
+=20
+     def encode(self, string):
+-        assert(isinstance(string, text_type))
++        assert(isinstance(string, str))
+         if self.encoding:
+             return string.encode(self.encoding, "htmlentityreplace")
+         else:
+             return string
+=20
+     def encodeStrict(self, string):
+-        assert(isinstance(string, text_type))
++        assert(isinstance(string, str))
+         if self.encoding:
+             return string.encode(self.encoding, "strict")
+         else:
+diff --git a/html5lib/treebuilders/base.py b/html5lib/treebuilders/base.=
py
+index e4a3d71..24759e9 100644
+--- a/html5lib/treebuilders/base.py
++++ b/html5lib/treebuilders/base.py
+@@ -1,5 +1,4 @@
+ from __future__ import absolute_import, division, unicode_literals
+-from six import text_type
+=20
+ from ..constants import scopingElements, tableInsertModeElements, names=
paces
+=20
+@@ -199,7 +198,7 @@ class TreeBuilder(object):
+         # match any node with that name
+         exactNode =3D hasattr(target, "nameTuple")
+         if not exactNode:
+-            if isinstance(target, text_type):
++            if isinstance(target, str):
+                 target =3D (namespaces["html"], target)
+             assert isinstance(target, tuple)
+=20
+@@ -322,7 +321,7 @@ class TreeBuilder(object):
+=20
+     def insertElementNormal(self, token):
+         name =3D token["name"]
+-        assert isinstance(name, text_type), "Element %s not unicode" % =
name
++        assert isinstance(name, str), "Element %s not unicode" % name
+         namespace =3D token.get("namespace", self.defaultNamespace)
+         element =3D self.elementClass(name, namespace)
+         element.attributes =3D token["data"]
+diff --git a/html5lib/treebuilders/etree.py b/html5lib/treebuilders/etre=
e.py
+index 086bed4..eb1f026 100644
+--- a/html5lib/treebuilders/etree.py
++++ b/html5lib/treebuilders/etree.py
+@@ -1,7 +1,6 @@
+ from __future__ import absolute_import, division, unicode_literals
+ # pylint:disable=3Dprotected-access
+=20
+-from six import text_type
+=20
+ import re
+=20
+@@ -222,7 +221,7 @@ def getETreeBuilder(ElementTreeImplementation, fullT=
ree=3DFalse):
+             elif element.tag =3D=3D ElementTreeCommentType:
+                 rv.append("|%s<!-- %s -->" % (' ' * indent, element.tex=
t))
+             else:
+-                assert isinstance(element.tag, text_type), \
++                assert isinstance(element.tag, str), \
+                     "Expected unicode, got %s, %s" % (type(element.tag)=
, element.tag)
+                 nsmatch =3D tag_regexp.match(element.tag)
+=20
+diff --git a/html5lib/treebuilders/etree_lxml.py b/html5lib/treebuilders=
/etree_lxml.py
+index e73de61..b13b23b 100644
+--- a/html5lib/treebuilders/etree_lxml.py
++++ b/html5lib/treebuilders/etree_lxml.py
+@@ -28,7 +28,6 @@ from . import etree as etree_builders
+ from .. import _ihatexml
+=20
+ import lxml.etree as etree
+-from six import PY3, binary_type
+=20
+=20
+ fullTree =3D True
+@@ -207,10 +206,7 @@ class TreeBuilder(base.TreeBuilder):
+                 return name
+=20
+             def __getitem__(self, key):
+-                value =3D self._element._element.attrib[self._coerceKey=
(key)]
+-                if not PY3 and isinstance(value, binary_type):
+-                    value =3D value.decode("ascii")
+-                return value
++                return self._element._element.attrib[self._coerceKey(ke=
y)]
+=20
+             def __setitem__(self, key, value):
+                 self._element._element.attrib[self._coerceKey(key)] =3D=
 value
+diff --git a/html5lib/treewalkers/etree.py b/html5lib/treewalkers/etree.=
py
+index 4465337..0bfd81f 100644
+--- a/html5lib/treewalkers/etree.py
++++ b/html5lib/treewalkers/etree.py
+@@ -3,7 +3,6 @@ from __future__ import absolute_import, division, unicod=
e_literals
+ from collections import OrderedDict
+ import re
+=20
+-from six import string_types
+=20
+ from . import base
+ from .._utils import moduleFactoryFactory
+@@ -51,7 +50,7 @@ def getETreeBuilder(ElementTreeImplementation):
+                 return base.COMMENT, node.text
+=20
+             else:
+-                assert isinstance(node.tag, string_types), type(node.ta=
g)
++                assert isinstance(node.tag, str), type(node.tag)
+                 # This is assumed to be an ordinary element
+                 match =3D tag_regexp.match(node.tag)
+                 if match:
+diff --git a/html5lib/treewalkers/etree_lxml.py b/html5lib/treewalkers/e=
tree_lxml.py
+index a614ac5..9514f57 100644
+--- a/html5lib/treewalkers/etree_lxml.py
++++ b/html5lib/treewalkers/etree_lxml.py
+@@ -1,5 +1,4 @@
+ from __future__ import absolute_import, division, unicode_literals
+-from six import text_type
+=20
+ from collections import OrderedDict
+=20
+@@ -14,7 +13,7 @@ from .. import _ihatexml
+ def ensure_str(s):
+     if s is None:
+         return None
+-    elif isinstance(s, text_type):
++    elif isinstance(s, str):
+         return s
+     else:
+         return s.decode("ascii", "strict")
+diff --git a/setup.py b/setup.py
+index f84c128..b195d30 100644
+--- a/setup.py
++++ b/setup.py
+@@ -104,7 +104,6 @@ setup(name=3D'html5lib',
+       maintainer_email=3D'james@hoppipolla.co.uk',
+       packages=3Dfind_packages(exclude=3D["*.tests", "*.tests.*", "test=
s.*", "tests"]),
+       install_requires=3D[
+-          'six>=3D1.9',
+           'webencodings',
+       ],
+       python_requires=3D">=3D2.7, !=3D3.0.*, !=3D3.1.*, !=3D3.2.*, !=3D=
3.3.*, !=3D3.4.*",
+--=20
+2.55.0
+
diff --git a/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb =
b/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb
index 9c92164546..2447acde39 100644
--- a/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb
@@ -4,13 +4,13 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1ba5ada9e6fe=
ad1fdc32f43c9f10ba7c"
=20
 SRC_URI +=3D "file://0001-setup.py-fix-version-parsing-on-Python-3.14-as=
t.Str-.patch"
 SRC_URI +=3D "file://0001-setup.py-make-pkg_resources-import-optional-fo=
r-Pyth.patch"
+SRC_URI +=3D "file://0001-Drop-the-six-dependency.patch"
 SRC_URI[sha256sum] =3D "b2e5b40261e20f354d198eae92afc10d750afb487ed5e50f=
9c4eaf07c184146f"
=20
 inherit pypi setuptools3
=20
 RDEPENDS:${PN} +=3D "\
     python3-lxml \
-    python3-six \
     python3-webencodings \
     python3-xml \
 "
--=20
2.55.0


