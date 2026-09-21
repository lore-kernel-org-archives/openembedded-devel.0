Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C958C982F1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 11:55:28 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47149.1789991724758663919
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 04:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=l/Gmo0ed;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout05.t-online.de (Postfix) with SMTP id 56ACD8A8
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 13:55:22 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8ccB-04X1zI0; Mon, 21 Sep 2026 13:55:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 21/24] python3-txdbus: drop the six dependency
Date: Mon, 21 Sep 2026 13:54:57 +0200
Message-ID: <20260921115500.53770-21-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921115500.53770-1-f_l_k@t-online.de>
References: <20260921115500.53770-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789991719-07FFCA93-B5E86377/0/0 CLEAN NORMAL
X-TOI-MSGID: f9e801aa-381e-4dcc-b851-d28e85063068
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789991722; i=f_l_k@t-online.de;
	bh=w0yvL7bwFfTges4m4aJtuhup7GK77VrKjhr+SJilXhY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=l/Gmo0edxaawV7h5BKA5lWx4QIcI/MVyhQgAuSeyiwPuRbwYyM/KGfHYlV6A3mIjl
	 3zNxaq5uvsNIVyjq+BBlFhlpyoOPNhyKRX6wgmXaKJHGqkkNFvWg2Z0SjOoH3deLAD
	 XJ7D7L/ILe9PoV9gM0aJTyr0xS7WwjUTqoPlA0s63ojZYkav7YT5YMgRQ7Z/NEJvPN
	 psX1nO5rJ1MDRi4xlKJUOWWtaIr/w02lg9Uz3YjnZUL811+gZPAUBA8mqvrw6fSd3O
	 CGgB12ClFK+BAcjjM0MwFGWMTXWkLsSyskI+U+FnQ8ATdj+H4BgznlFJZMK52jt/+y
	 4DsRohaUZ7fMA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 11:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130135

Patch txdbus to use the dict methods, int, str, bytes indexing, next and
io.StringIO instead of the six helpers, and drop the runtime dependency.

Built for intel-corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-drop-the-six-dependency.patch        | 301 ++++++++++++++++++
 .../python/python3-txdbus_1.1.2.bb            |   3 +-
 2 files changed, 303 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-txdbus/00=
01-drop-the-six-dependency.patch

diff --git a/meta-python/recipes-devtools/python/python3-txdbus/0001-drop=
-the-six-dependency.patch b/meta-python/recipes-devtools/python/python3-t=
xdbus/0001-drop-the-six-dependency.patch
new file mode 100644
index 0000000000..6ea52c4deb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-txdbus/0001-drop-the-si=
x-dependency.patch
@@ -0,0 +1,301 @@
+From f3362adf93eb439e0b9c997b7b8d182da4ed6cf4 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 21 Sep 2026 13:25:01 +0200
+Subject: [PATCH] drop the six dependency
+
+six is a Python 2 compatibility shim and txdbus does not need it on
+Python 3: the iteritems/iterkeys/itervalues helpers are the dict
+methods, integer_types and string_types are int and str, byte2int is
+indexing the bytes object, six.next is next and six.moves.cStringIO is
+io.StringIO.
+
+Upstream-Status: Pending
+
+AI-Generated: Uses Claude Code (Claude Opus 5)
+---
+ setup.py                 | 2 +-
+ txdbus/authentication.py | 3 +--
+ txdbus/client.py         | 5 ++---
+ txdbus/interface.py      | 7 +++----
+ txdbus/introspection.py  | 4 ++--
+ txdbus/marshal.py        | 14 ++++++--------
+ txdbus/objects.py        | 11 +++++------
+ txdbus/protocol.py       | 3 +--
+ txdbus/router.py         | 3 +--
+ 9 files changed, 22 insertions(+), 30 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 784cd0f..d4d2758 100755
+--- a/setup.py
++++ b/setup.py
+@@ -21,7 +21,7 @@ setup(
+     url=3D'https://github.com/cocagne/txdbus',
+     author=3D'Tom Cocagne',
+     author_email=3D'tom.cocagne@gmail.com',
+-    install_requires=3D['twisted>=3D10.1', 'six'],
++    install_requires=3D['twisted>=3D10.1'],
+     provides=3D['txdbus'],
+     packages=3D['txdbus'],
+     keywords=3D['dbus', 'twisted'],
+diff --git a/txdbus/authentication.py b/txdbus/authentication.py
+index 656fecf..2b91e47 100644
+--- a/txdbus/authentication.py
++++ b/txdbus/authentication.py
+@@ -11,7 +11,6 @@ import os
+ import os.path
+ import time
+=20
+-import six
+ from twisted.internet import interfaces
+ from twisted.python import log
+ from zope.interface import implementer, Interface
+@@ -557,7 +556,7 @@ class BusAuthenticator (object):
+         self.state =3D None
+         self.current_mech =3D None
+=20
+-        for n, m in six.iteritems(self.authenticators):
++        for n, m in self.authenticators.items():
+             self.mechanisms[n] =3D m
+=20
+         mechNames =3D self.authenticators.keys()
+diff --git a/txdbus/client.py b/txdbus/client.py
+index 986da6c..53b4a25 100644
+--- a/txdbus/client.py
++++ b/txdbus/client.py
+@@ -7,7 +7,6 @@ methods over the DBus bus.
+ @author: Tom Cocagne
+ """
+=20
+-import six
+ from twisted.internet import defer, reactor
+ from twisted.internet.error import ConnectError
+ from twisted.internet.protocol import Factory
+@@ -472,7 +471,7 @@ class DBusClientConnection (txdbus.protocol.BasicDBu=
sProtocol):
+             return None
+=20
+         # if not (
+-        #     isinstance(msg.body[0], six.string_types) and
++        #     isinstance(msg.body[0], str) and
+         #     msg.body[0].startswith('<!D')
+         # ):
+         #     print('RET SIG', msg.signature, 'BODY:', msg.body)
+@@ -630,7 +629,7 @@ class DBusClientConnection (txdbus.protocol.BasicDBu=
sProtocol):
+             e.message =3D ''
+             e.values =3D []
+             if merr.body:
+-                if isinstance(merr.body[0], six.string_types):
++                if isinstance(merr.body[0], str):
+                     e.message =3D merr.body[0]
+                 e.values =3D merr.body
+             d.errback(e)
+diff --git a/txdbus/interface.py b/txdbus/interface.py
+index 87ad3c4..6b6b677 100644
+--- a/txdbus/interface.py
++++ b/txdbus/interface.py
+@@ -5,7 +5,6 @@ model's definition of Interfaces.
+=20
+ @author: Tom Cocagne
+ """
+-import six
+ import twisted
+=20
+ from txdbus import marshal
+@@ -212,7 +211,7 @@ class DBusInterface (object):
+             l =3D []
+             l.append('  <interface name=3D"%s">' % (self.name,))
+=20
+-            k =3D sorted(six.iterkeys(self.methods))
++            k =3D sorted(self.methods)
+             for m in (self.methods[a] for a in k):
+                 l.append('    <method name=3D"%s">' % (m.name,))
+                 for arg_sig in marshal.genCompleteTypes(m.sigIn):
+@@ -225,14 +224,14 @@ class DBusInterface (object):
+                         (arg_sig,))
+                 l.append('    </method>')
+=20
+-            k =3D sorted(six.iterkeys(self.signals))
++            k =3D sorted(self.signals)
+             for s in (self.signals[a] for a in k):
+                 l.append('    <signal name=3D"%s">' % (s.name,))
+                 for arg_sig in marshal.genCompleteTypes(s.sig):
+                     l.append('      <arg type=3D"%s"/>' % (arg_sig,))
+                 l.append('    </signal>')
+=20
+-            k =3D list(six.iterkeys(self.properties))
++            k =3D list(self.properties)
+             k.sort()
+             for p in (self.properties[a] for a in k):
+                 l.append(
+diff --git a/txdbus/introspection.py b/txdbus/introspection.py
+index 099a74b..b8a85cc 100644
+--- a/txdbus/introspection.py
++++ b/txdbus/introspection.py
+@@ -6,7 +6,7 @@ Provides support for DBus introspection
+ import xml.sax
+ import xml.sax.handler
+=20
+-from six.moves import cStringIO
++from io import StringIO
+=20
+ from txdbus import interface
+=20
+@@ -96,7 +96,7 @@ def getInterfacesFromXML(xmlStr, replaceKnownInterface=
s=3DFalse):
+     p.setFeature(xml.sax.handler.feature_validation, False)
+     p.setFeature(xml.sax.handler.feature_external_ges, False)
+     p.setContentHandler(handler)
+-    p.parse(cStringIO(xmlStr))
++    p.parse(StringIO(xmlStr))
+=20
+     return handler.interfaces
+=20
+diff --git a/txdbus/marshal.py b/txdbus/marshal.py
+index 1867e0b..ac49f15 100644
+--- a/txdbus/marshal.py
++++ b/txdbus/marshal.py
+@@ -8,8 +8,6 @@ import codecs
+ import re
+ import struct
+=20
+-import six
+-
+ from txdbus.error import MarshallingError
+=20
+=20
+@@ -262,11 +260,11 @@ def sigFromPy(pobj):
+         return 'b'
+     elif isinstance(pobj, int):
+         return 'i'
+-    elif isinstance(pobj, six.integer_types):
++    elif isinstance(pobj, int):
+         return 'x'
+     elif isinstance(pobj, float):
+         return 'd'
+-    elif isinstance(pobj, six.string_types):
++    elif isinstance(pobj, str):
+         return 's'
+     elif isinstance(pobj, bytearray):
+         return 'ay'
+@@ -288,7 +286,7 @@ def sigFromPy(pobj):
+     elif isinstance(pobj, dict):
+         same =3D True
+         vtype =3D None
+-        for k, v in six.iteritems(pobj):
++        for k, v in pobj.items():
+             if vtype is None:
+                 vtype =3D type(v)
+             elif not isinstance(v, vtype):
+@@ -376,7 +374,7 @@ def genCompleteTypes(compoundSig):
+=20
+         elif c =3D=3D 'a':
+             g =3D genCompleteTypes(compoundSig[i + 1:])
+-            ct =3D six.next(g)
++            ct =3D next(g)
+             i +=3D len(ct)
+             yield 'a' + ct
+=20
+@@ -468,7 +466,7 @@ def marshal_unix_fd(ct, var, start_byte, lendian, oo=
bFDs):
+ #       3 - terminating nul byte
+ #
+ def marshal_string(ct, var, start_byte, lendian, oobFDs):
+-    if not isinstance(var, six.string_types):
++    if not isinstance(var, str):
+         raise MarshallingError('Required string. Received: ' + repr(var=
))
+     if var.find('\0') !=3D -1:
+         raise MarshallingError(
+@@ -525,7 +523,7 @@ def marshal_array(ct, var, start_byte, lendian, oobF=
Ds):
+     if isinstance(var, (list, tuple, bytearray)):
+         arr_list =3D var
+     elif isinstance(var, dict):
+-        arr_list =3D [tpl for tpl in six.iteritems(var)]
++        arr_list =3D [tpl for tpl in var.items()]
+     else:
+         raise MarshallingError(
+             'List, Tuple, Bytearray, or Dictionary required for DBus ar=
ray. '
+diff --git a/txdbus/objects.py b/txdbus/objects.py
+index 69d3a3e..e2e7523 100644
+--- a/txdbus/objects.py
++++ b/txdbus/objects.py
+@@ -7,7 +7,6 @@ DBus objects
+ import inspect
+ import weakref
+=20
+-import six
+ from twisted.internet import defer
+ from zope.interface import implementer, Interface
+=20
+@@ -400,7 +399,7 @@ class DBusObject (object):
+=20
+                 cache =3D {}
+=20
+-                for name, obj in six.iteritems(base.__dict__):
++                for name, obj in base.__dict__.items():
+                     self._cacheInterfaces(base, cache, name, obj)
+=20
+                 base._dbusIfaceCache =3D cache
+@@ -449,7 +448,7 @@ class DBusObject (object):
+                     if key in d:
+                         return d[key]
+             else:
+-                for ic in six.itervalues(cache):
++                for ic in cache.values():
+                     d =3D getattr(ic, cacheAttr)
+                     if key in d:
+                         return d[key]
+@@ -588,14 +587,14 @@ class DBusObject (object):
+                 ifc =3D cache.get(interfaceName, None)
+=20
+                 if ifc:
+-                    for p in six.itervalues(ifc.properties):
++                    for p in ifc.properties.values():
+                         addp(p)
+                     break
+=20
+         else:
+             for cache in self._iterIFaceCaches():
+-                for ifc in six.itervalues(cache):
+-                    for p in six.itervalues(ifc.properties):
++                for ifc in cache.values():
++                    for p in ifc.properties.values():
+                         addp(p)
+=20
+         return r
+diff --git a/txdbus/protocol.py b/txdbus/protocol.py
+index 7e6ed8a..1c05f11 100644
+--- a/txdbus/protocol.py
++++ b/txdbus/protocol.py
+@@ -6,7 +6,6 @@ This module implements the wire-level DBus protocol.
+ import os.path
+ import struct
+=20
+-import six
+ from twisted.internet import interfaces, protocol
+ from twisted.python import log
+ from zope.interface import implementer, Interface
+@@ -144,7 +143,7 @@ class BasicDBusProtocol(protocol.Protocol):
+                     self.dataReceived(b'')
+         else:
+             if not self._client and self._firstByte:
+-                if six.byte2int(data) !=3D 0:
++                if data[0] !=3D 0:
+                     self.transport.loseConnection()
+                     return
+                 self._firstByte =3D False
+diff --git a/txdbus/router.py b/txdbus/router.py
+index a5f8e44..2a7e732 100644
+--- a/txdbus/router.py
++++ b/txdbus/router.py
+@@ -4,7 +4,6 @@ to interested connections.
+=20
+ @author: Tom Cocagne
+ """
+-import six
+ from twisted.python import log
+=20
+ # XXX Replace this simple, inefficient implementation with something a =
bit
+@@ -124,5 +123,5 @@ class MessageRouter (object):
+=20
+     def routeMessage(self, m):
+         # print 'ROUTING MSG', m.interface, m.member
+-        for r in six.itervalues(self._rules):
++        for r in self._rules.values():
+             r.match(m)
diff --git a/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb =
b/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb
index ef6c248e80..c90f513a1f 100644
--- a/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb
@@ -4,8 +4,9 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://README.rst;beginline=3D32;endline=3D32;md5=3D=
2141358b0bce85fc45216ba91735ad50"
=20
+SRC_URI +=3D "file://0001-drop-the-six-dependency.patch"
 SRC_URI[sha256sum] =3D "8375a5fb68a12054f0def91af800c821fb2232949337756e=
d975f88d8ea2bc97"
=20
 inherit pypi setuptools3
=20
-RDEPENDS:${PN} +=3D "python3-twisted-core python3-six"
+RDEPENDS:${PN} +=3D "python3-twisted-core"
--=20
2.55.0


