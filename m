Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F82EC982F8
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 11:56:09 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47170.1789991767303996563
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 04:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Kzgezqva;
 spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout09.t-online.de (Postfix) with SMTP id C12E438176
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 13:55:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8cc9-04X1z30; Mon, 21 Sep 2026 13:55:17 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 06/24] python3-jsonpath-rw: drop the six dependency
Date: Mon, 21 Sep 2026 13:54:42 +0200
Message-ID: <20260921115500.53770-6-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921115500.53770-1-f_l_k@t-online.de>
References: <20260921115500.53770-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789991717-31FF8A93-01C6FF64/0/0 CLEAN NORMAL
X-TOI-MSGID: 16b20362-f3ef-4c02-ab45-8e1f10bf8b57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789991721; i=f_l_k@t-online.de;
	bh=B66vyIplCevHJDXSRMl04KW2wmb7qtkI3NIbz2vH0XE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=KzgezqvaH+fs9f4EJ2pX/qsQaf+lqS3VbhXj3NadY9jK2e5JMY62Z/a7DK7uAbPi0
	 No9ZFyHA9PwyfcJ4EG1fLakhRfLSv5nXZPqdm7XZKvHTyxhHqobt/+hVw93EEFqIdd
	 pMSfJwZ2KW81YPcnT2byd0J5oYMsFVgcqKgjRQf9d9GNgWSQfDCC+hqbpV8r0ykXSg
	 1G6iT1ToEVpORuMeAcICm+g3pWnCzqwkgW1kuW1a+1p7IvJV/+e1mrJN3M1oW7AXPB
	 u9MpNDLXUk5n/kn4PytIYHef20xZXQph8C+D9klaWGaYiy95KHFsjsxwmNL0hpKZjT
	 nxEJgo9yLV4yg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 11:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130145

Patch jsonpath-rw to use int, str and range instead of six.integer_types,
six.string_types and six.moves.xrange, and drop the runtime dependency.

Built for intel-corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-drop-the-six-dependency.patch        | 58 +++++++++++++++++++
 .../python/python3-jsonpath-rw_1.4.0.bb       |  2 +-
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-jsonpath-=
rw/0001-drop-the-six-dependency.patch

diff --git a/meta-python/recipes-devtools/python/python3-jsonpath-rw/0001=
-drop-the-six-dependency.patch b/meta-python/recipes-devtools/python/pyth=
on3-jsonpath-rw/0001-drop-the-six-dependency.patch
new file mode 100644
index 0000000000..735fe26140
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jsonpath-rw/0001-drop-t=
he-six-dependency.patch
@@ -0,0 +1,58 @@
+From a12efc7d5ede4fb2404ea1e4edeba03c9225ab4e Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 21 Sep 2026 13:22:53 +0200
+Subject: [PATCH] drop the six dependency
+
+six is a Python 2 compatibility shim and jsonpath-rw does not need it on
+Python 3: six.integer_types and six.string_types are int and str, and
+six.moves.xrange is range.
+
+Upstream-Status: Pending
+
+AI-Generated: Uses Claude Code (Claude Opus 5)
+---
+ jsonpath_rw/jsonpath.py | 6 ++----
+ setup.py                | 2 +-
+ 2 files changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/jsonpath_rw/jsonpath.py b/jsonpath_rw/jsonpath.py
+index 3c491d0..4703fae 100644
+--- a/jsonpath_rw/jsonpath.py
++++ b/jsonpath_rw/jsonpath.py
+@@ -1,7 +1,5 @@
+ from __future__ import unicode_literals, print_function, absolute_impor=
t, division, generators, nested_scopes
+ import logging
+-import six
+-from six.moves import xrange
+ from itertools import *
+=20
+ logger =3D logging.getLogger(__name__)
+@@ -485,13 +483,13 @@ class Slice(JSONPath):
+        =20
+         # Here's the hack. If it is a dictionary or some kind of consta=
nt,
+         # put it in a single-element list
+-        if (isinstance(datum.value, dict) or isinstance(datum.value, si=
x.integer_types) or isinstance(datum.value, six.string_types)):
++        if (isinstance(datum.value, dict) or isinstance(datum.value, in=
t) or isinstance(datum.value, str)):
+             return self.find(DatumInContext([datum.value], path=3Ddatum=
.path, context=3Ddatum.context))
+=20
+         # Some iterators do not support slicing but we can still
+         # at least work for '*'
+         if self.start =3D=3D None and self.end =3D=3D None and self.ste=
p =3D=3D None:
+-            return [DatumInContext(datum.value[i], path=3DIndex(i), con=
text=3Ddatum) for i in xrange(0, len(datum.value))]
++            return [DatumInContext(datum.value[i], path=3DIndex(i), con=
text=3Ddatum) for i in range(0, len(datum.value))]
+         else:
+             return [DatumInContext(datum.value[i], path=3DIndex(i), con=
text=3Ddatum) for i in range(0, len(datum.value))[self.start:self.end:sel=
f.step]]
+=20
+diff --git a/setup.py b/setup.py
+index 8108124..4b2dfb9 100644
+--- a/setup.py
++++ b/setup.py
+@@ -18,7 +18,7 @@ setuptools.setup(
+         'console_scripts':  ['jsonpath.py =3D jsonpath_rw.bin.jsonpath:=
entry_point'],
+     },
+     test_suite =3D 'tests',
+-    install_requires =3D [ 'ply', 'decorator', 'six' ],
++    install_requires =3D [ 'ply', 'decorator' ],
+     classifiers =3D [
+         'Development Status :: 5 - Production/Stable',
+         'Intended Audience :: Developers',
diff --git a/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.=
0.bb b/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb
index 4cc39a286a..8d846ab720 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb
@@ -4,6 +4,7 @@ SECTION =3D "devel/python"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://README.rst;beginline=3D198;endline=3D215;md=
5=3D2866908485c18dc999b6c8dc608563ec"
=20
+SRC_URI +=3D "file://0001-drop-the-six-dependency.patch"
 SRC_URI[sha256sum] =3D "05c471281c45ae113f6103d1268ec7a4831a2e96aa80de45=
edc89b11fac4fbec"
=20
 inherit pypi setuptools3
@@ -12,5 +13,4 @@ RDEPENDS:${PN} +=3D " \
     python3-decorator \
     python3-logging \
     python3-ply \
-    python3-six \
 "
--=20
2.55.0


