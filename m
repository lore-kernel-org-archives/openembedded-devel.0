Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A893C982FA
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 11:56:09 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47395.1789991767170328533
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 04:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=ipdFbnq0;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout01.t-online.de (Postfix) with SMTP id D0CA81C40E
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 13:55:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8cc9-04X1z60; Mon, 21 Sep 2026 13:55:17 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 09/24] python3-parse-type: drop the six dependency
Date: Mon, 21 Sep 2026 13:54:45 +0200
Message-ID: <20260921115500.53770-9-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921115500.53770-1-f_l_k@t-online.de>
References: <20260921115500.53770-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789991717-7E7F3A93-752BD31F/0/0 CLEAN NORMAL
X-TOI-MSGID: 5207fd5b-1de0-4423-82d8-5a12762f81c9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789991721; i=f_l_k@t-online.de;
	bh=dDftDJ1I4YJvoCd4Melj0THjO1m9AFeeBZ5FxPoDzKE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ipdFbnq0zfJyA7umjiQDljHcHQKzO2Ta0Ut4pCEumkuduh2KuOSrkZiiMXR2Ofz3y
	 InpLs7fPala/GLp0/PRdbVRmEgwDhYcZ+HiCLYzR1uMNEOx8sQmFXqXFu1ruEaJmYA
	 yt/t5yJoKstK+WSb5MmEwtckMwxk3RjAmU3WXhIo8DD1rr4AwlHEpb7XMq4ILS11mH
	 WaWdxXFn+SC0/qnIQA2zBMmH02aZftKiHcVwHrCL0ScNCnwdZp4iGoh7OZPZhMoaLC
	 Kusu81hvnjvs0GOoQc8TPYh6Cev3VlbQoR+lfeig65W0CmM8bdV+hy3Lrcob+62JbC
	 9WZNRYZlBX3rw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 11:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130144

Patch parse_type to use str instead of six.string_types and drop six from
the requirement lists and from the ptest dependencies.

Built for intel-corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-drop-the-six-dependency.patch        | 107 ++++++++++++++++++
 .../python/python3-parse-type_0.6.6.bb        |   2 +-
 2 files changed, 108 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-parse-typ=
e/0001-drop-the-six-dependency.patch

diff --git a/meta-python/recipes-devtools/python/python3-parse-type/0001-=
drop-the-six-dependency.patch b/meta-python/recipes-devtools/python/pytho=
n3-parse-type/0001-drop-the-six-dependency.patch
new file mode 100644
index 0000000000..7b5f5683c1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-parse-type/0001-drop-th=
e-six-dependency.patch
@@ -0,0 +1,107 @@
+From acd176d3ada46ced050ed401c9d3f38a1ef7836d Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 21 Sep 2026 13:24:27 +0200
+Subject: [PATCH] drop the six dependency
+
+six is a Python 2 compatibility shim and parse_type does not need it on
+Python 3: six.string_types is str.
+
+Upstream-Status: Pending
+
+AI-Generated: Uses Claude Code (Claude Opus 5)
+---
+ parse_type/cardinality_field.py | 3 +--
+ parse_type/parse_util.py        | 3 +--
+ py.requirements/basic.txt       | 1 -
+ pyproject.toml                  | 1 -
+ setup.py                        | 1 -
+ tasks/py.requirements.txt       | 1 -
+ 6 files changed, 2 insertions(+), 8 deletions(-)
+
+diff --git a/parse_type/cardinality_field.py b/parse_type/cardinality_fi=
eld.py
+index 4e892ed..8ae89bf 100644
+--- a/parse_type/cardinality_field.py
++++ b/parse_type/cardinality_field.py
+@@ -9,7 +9,6 @@ A cardinality field is a type suffix for parse format ex=
pression, ala:
+ """
+=20
+ from __future__ import absolute_import
+-import six
+ from parse_type.cardinality import Cardinality, TypeBuilder
+=20
+=20
+@@ -115,7 +114,7 @@ class CardinalityFieldTypeBuilder(object):
+         :raises: ValueError, if type_name does not end with Cardinality=
Field
+         :raises: MissingTypeError, if type_converter is missing in type=
_dict
+         """
+-        assert isinstance(type_name, six.string_types)
++        assert isinstance(type_name, str)
+         if not CardinalityField.matches_type(type_name):
+             message =3D "type_name=3D'%s' has no CardinalityField" % ty=
pe_name
+             raise ValueError(message)
+diff --git a/parse_type/parse_util.py b/parse_type/parse_util.py
+index 0e5ee73..73190c6 100644
+--- a/parse_type/parse_util.py
++++ b/parse_type/parse_util.py
+@@ -7,7 +7,6 @@ Provides generic utility classes for the :class:`parse.P=
arser` class.
+ from __future__ import absolute_import
+ from collections import namedtuple
+ import parse
+-import six
+=20
+=20
+ # -- HELPER-CLASS: For format part in a Field.
+@@ -66,7 +65,7 @@ class Field(object):
+             format1 =3D self.format or ""
+             format2 =3D other.format or ""
+             return (self.name =3D=3D other.name) and (format1 =3D=3D fo=
rmat2)
+-        elif isinstance(other, six.string_types):
++        elif isinstance(other, str):
+             return str(self) =3D=3D other
+         else:
+             raise ValueError(other)
+diff --git a/py.requirements/basic.txt b/py.requirements/basic.txt
+index b9735ab..c3c52ee 100644
+--- a/py.requirements/basic.txt
++++ b/py.requirements/basic.txt
+@@ -11,4 +11,3 @@
+ parse >=3D 1.18.0; python_version >=3D '3.0'
+ parse >=3D 1.13.1; python_version <=3D '2.7'
+ enum34; python_version < '3.4'
+-six >=3D 1.15
+diff --git a/pyproject.toml b/pyproject.toml
+index 7ca4407..e377bf0 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -52,7 +52,6 @@ dependencies =3D [
+     "parse >=3D 1.18.0; python_version >=3D '3.0'",
+     "parse >=3D 1.13.1; python_version <=3D '2.7'",
+     "enum34; python_version < '3.4'",
+-    "six >=3D 1.15",
+ ]
+=20
+=20
+diff --git a/setup.py b/setup.py
+index 02ef727..9ea9ab4 100644
+--- a/setup.py
++++ b/setup.py
+@@ -101,7 +101,6 @@ setup(
+         "parse >=3D 1.18.0; python_version >=3D '3.0'",
+         "parse >=3D 1.13.1; python_version <=3D '2.7'",
+         "enum34; python_version < '3.4'",
+-        "six >=3D 1.15",
+     ],
+     tests_require=3D[
+         "pytest <  5.0; python_version <  '3.0'", # >=3D 4.2
+diff --git a/tasks/py.requirements.txt b/tasks/py.requirements.txt
+index e063e44..fb95307 100644
+--- a/tasks/py.requirements.txt
++++ b/tasks/py.requirements.txt
+@@ -11,7 +11,6 @@
+ invoke >=3D1.7.0,<2.0; python_version <  '3.6'
+ invoke >=3D1.7.0;      python_version >=3D '3.6'
+ pycmd
+-six >=3D 1.15.0
+=20
+ # -- HINT, was RENAMED: path.py =3D> path (for python3)
+ path.py >=3D11.5.0,<13.0; python_version <  '3.5'
diff --git a/meta-python/recipes-devtools/python/python3-parse-type_0.6.6=
.bb b/meta-python/recipes-devtools/python/python3-parse-type_0.6.6.bb
index 979e25b47b..43ae9bd1cf 100644
--- a/meta-python/recipes-devtools/python/python3-parse-type_0.6.6.bb
+++ b/meta-python/recipes-devtools/python/python3-parse-type_0.6.6.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2e469278ace89c=
246d52505acc39c3da"
 SRC_URI[sha256sum] =3D "513a3784104839770d690e04339a8b4d33439fcd5dd99f2e=
4580f9fc1097bfb2"
 SRC_URI +=3D " \
     file://run-ptest \
+    file://0001-drop-the-six-dependency.patch \
 "
=20
 PYPI_PACKAGE =3D "parse_type"
@@ -24,6 +25,5 @@ do_install_ptest() {
 RDEPENDS:${PN} +=3D "python3-parse"
 RDEPENDS:${PN}-ptest +=3D " \
     python3-pytest \
-    python3-six \
     python3-unittest-automake-output \
 "
--=20
2.55.0


