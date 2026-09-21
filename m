Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DC3C982F9
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 11:55:28 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47380.1789991724416412411
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 04:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=V1Xqt24V;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout05.t-online.de (Postfix) with SMTP id 3A6668A6
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 13:55:22 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8ccA-04X1zF0; Mon, 21 Sep 2026 13:55:18 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 18/24] python3-slip-dbus: drop the six dependency
Date: Mon, 21 Sep 2026 13:54:54 +0200
Message-ID: <20260921115500.53770-18-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921115500.53770-1-f_l_k@t-online.de>
References: <20260921115500.53770-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789991718-30FF6A93-CD386558/0/0 CLEAN NORMAL
X-TOI-MSGID: 96b5da31-7430-4fb6-8187-54cf50ace75d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789991722; i=f_l_k@t-online.de;
	bh=a206wWOHy/6SuXmXJrg9vfrL1Yz9DUc/JoQSdOFN/W8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=V1Xqt24V3X3Xbb0b1NYQTLAYTDsVY3MPyyOAD5hqWaOUGvIdpv4JvoU/egV9BQ9A1
	 jSifdzv0UBtTO80yXXvjo8ipSrbSd5KSgDe3VJN7Evpj4Nzf4cFWB4SxJQGeL661F9
	 l7zIWYUE0XwEHaAUFcD4ox/yghWu+mFGkKJM0vnjr2YbBPjhgwIuSK5tJiS1qSYuyU
	 bS/DSJBUuzToACN4Kbpi2IDGsNVbYtl6W7Y61oPz3u2Wat+K0wKgLk/iYQHKlHTHrq
	 bICYvLnTSM+bSoVc1ERH7uX7K/24xVkUJ+ooHTjb6/wm5/lP13Lpe3lv6KUL2Sme2Q
	 Kupz5FbR+VBLw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 11:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130132

Patch slip to use the metaclass keyword argument in the class statement
instead of six.with_metaclass, and drop the runtime dependency.

Built for intel-corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0002-drop-the-six-dependency.patch        | 81 +++++++++++++++++++
 .../python/python3-slip-dbus_0.6.5.bb         |  4 +-
 2 files changed, 82 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-slip-dbus=
/0002-drop-the-six-dependency.patch

diff --git a/meta-python/recipes-devtools/python/python3-slip-dbus/0002-d=
rop-the-six-dependency.patch b/meta-python/recipes-devtools/python/python=
3-slip-dbus/0002-drop-the-six-dependency.patch
new file mode 100644
index 0000000000..dcf9239e70
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-slip-dbus/0002-drop-the=
-six-dependency.patch
@@ -0,0 +1,81 @@
+From 42fb66d5ed4a713ce82356cbd00f1f0a40676e1c Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 21 Sep 2026 13:23:21 +0200
+Subject: [PATCH] drop the six dependency
+
+six is a Python 2 compatibility shim and slip does not need it on
+Python 3: six.with_metaclass is the metaclass keyword argument in the
+class statement.
+
+Upstream-Status: Pending
+
+AI-Generated: Uses Claude Code (Claude Opus 5)
+---
+ slip/dbus/introspection.py | 3 +--
+ slip/dbus/service.py       | 3 +--
+ slip/util/hookable.py      | 3 +--
+ 3 files changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/slip/dbus/introspection.py b/slip/dbus/introspection.py
+index 07eb8a7..83dc7e0 100644
+--- a/slip/dbus/introspection.py
++++ b/slip/dbus/introspection.py
+@@ -26,7 +26,6 @@ from __future__ import absolute_import
+=20
+ from xml.etree.ElementTree import ElementTree
+ from io import StringIO
+-from six import with_metaclass
+=20
+=20
+ class IElemMeta(type):
+@@ -73,7 +72,7 @@ class IElemMeta(type):
+         return kls
+=20
+=20
+-class IElem(with_metaclass(IElemMeta, object)):
++class IElem(object, metaclass=3DIElemMeta):
+     """Base class for introspection elements."""
+=20
+     def __new__(cls, elem, parent=3DNone):
+diff --git a/slip/dbus/service.py b/slip/dbus/service.py
+index 5d276f8..6a795d6 100644
+--- a/slip/dbus/service.py
++++ b/slip/dbus/service.py
+@@ -27,7 +27,6 @@ from __future__ import absolute_import
+=20
+ import dbus
+ import dbus.service
+-from six import with_metaclass
+=20
+ from .._wrappers import _glib as GLib
+=20
+@@ -182,7 +181,7 @@ class InterfaceType(dbus.service.InterfaceType):
+         return super(InterfaceType, cls).__new__(cls, name, bases, dct)
+=20
+=20
+-class Object(with_metaclass(InterfaceType, dbus.service.Object)):
++class Object(dbus.service.Object, metaclass=3DInterfaceType):
+=20
+     # timeout & persistence
+=20
+diff --git a/slip/util/hookable.py b/slip/util/hookable.py
+index 89c7392..41d1688 100644
+--- a/slip/util/hookable.py
++++ b/slip/util/hookable.py
+@@ -24,7 +24,6 @@
+ hooks on changes."""
+=20
+ import collections.abc
+-from six import with_metaclass
+=20
+ __all__ =3D ["Hookable", "HookableSet"]
+=20
+@@ -121,7 +120,7 @@ class _HookEntry(object):
+             self.__hook(*self.__args, **self.__kwargs)
+=20
+=20
+-class Hookable(with_metaclass(HookableType, object)):
++class Hookable(object, metaclass=3DHookableType):
+=20
+     """An object which calls registered hooks on changes."""
+=20
diff --git a/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.=
bb b/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
index b706db8d49..99d2f9b7e1 100644
--- a/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
+++ b/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
@@ -17,6 +17,7 @@ SRCNAME =3D "python-slip"
 SRC_URI =3D "https://github.com/nphilipp/${SRCNAME}/releases/download/${=
SRCNAME}-${PV}/${SRCNAME}-${PV}.tar.bz2 \
            file://9b939c0b534c1b7958fa0a3c7aedf30bca910431.patch \
            file://0001-setup.py-Use-setuptools-instead-of-distutils.patc=
h \
+           file://0002-drop-the-six-dependency.patch \
           "
 SRC_URI[sha256sum] =3D "c726c086f0dd93a0ac7a0176f383a12af91b6657b78a301e=
3f5b25d9f8d4d10b"
=20
@@ -26,9 +27,6 @@ do_compile:prepend() {
     sed -e 's/@VERSION@/${PV}/g' ${S}/setup.py.in > ${S}/setup.py
 }
=20
-RDEPENDS:${PN} +=3D "\
-    python3-six \
-"
 # http://errors.yoctoproject.org/Errors/Details/184713/
 # python-native/python: can't open file 'setup.py': [Errno 2] No such fi=
le or directory
 CLEANBROKEN =3D "1"
--=20
2.55.0


