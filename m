Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC88C98301
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 11:56:12 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47402.1789991769404963068
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 04:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=BttvI8lO;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout01.t-online.de (Postfix) with SMTP id 5A9C01C456
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 13:55:22 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8ccB-04X1zJ0; Mon, 21 Sep 2026 13:55:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 22/24] python3-txws: drop the six dependency
Date: Mon, 21 Sep 2026 13:54:58 +0200
Message-ID: <20260921115500.53770-22-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921115500.53770-1-f_l_k@t-online.de>
References: <20260921115500.53770-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789991719-8F7FDA93-F056B4E6/0/0 CLEAN NORMAL
X-TOI-MSGID: 3fd4569d-c9f3-4571-a3fe-285229758f0a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789991722; i=f_l_k@t-online.de;
	bh=e3nfsst7ddKXmGzgOvM5rLX+8xRuglwxgGPcweXEurU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=BttvI8lOqI+PAMpl0AUHSx2yRGXQgbkEu6QcGUa77mMpNAxZKNpxYZBRWj4Zs1CKR
	 j6RgDKYXWOe8XXWxuDMhcq0aad3kwH2bFhOgm8TGh13ePh7u0iuCqMrI7l5SfoULuQ
	 D0KREUmNa7YGVbfc3LR6q3/Fdzymyk4ci1bhKoPWB8nTEa2jZhB+4TlQU6ElDCI8ZW
	 TFctvcho7MjVZd5u84rsju+re0CK9/bVfM8GY2kH0svgINLaUHcnu5nTvlDQgkD4qF
	 qz6vwLZyzBjXPl5Zl8h8TcXU/3zon6s23PsKVc5jXR3i9WSZZpImbtEzx9ma5suyfq
	 Cl00FLtrpqQwA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 11:56:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130153

Patch txWS to use bytes literals, str and bytes instead of six.b and the
six type aliases, and remove the six.PY2 ord() fixups since indexing a
bytes object already yields an int.

Built for intel-corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-drop-the-six-dependency.patch        | 191 ++++++++++++++++++
 .../python-txws/python3-txws_0.9.1.bb         |   4 +-
 2 files changed, 193 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-connectivity/python-txws/python3-=
txws/0001-drop-the-six-dependency.patch

diff --git a/meta-python/recipes-connectivity/python-txws/python3-txws/00=
01-drop-the-six-dependency.patch b/meta-python/recipes-connectivity/pytho=
n-txws/python3-txws/0001-drop-the-six-dependency.patch
new file mode 100644
index 0000000000..8718d28b02
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-txws/python3-txws/0001-drop=
-the-six-dependency.patch
@@ -0,0 +1,191 @@
+From 9f33d0d87503cd6215e92b204f7d89d7caac82c2 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 21 Sep 2026 13:25:17 +0200
+Subject: [PATCH] drop the six dependency
+
+six is a Python 2 compatibility shim and txWS does not need it on
+Python 3: six.b is a bytes literal or a latin-1 encode, text_type,
+binary_type and string_types are str and bytes, and indexing a bytes
+object already yields an int so the six.PY2 ord() fixups can go.
+
+Upstream-Status: Pending
+
+AI-Generated: Uses Claude Code (Claude Opus 5)
+---
+ setup.py | 2 +-
+ txws.py  | 40 ++++++++++++++++------------------------
+ 2 files changed, 17 insertions(+), 25 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index e4b3372..1564f1f 100755
+--- a/setup.py
++++ b/setup.py
+@@ -5,7 +5,7 @@ from setuptools import setup
+ setup(
+     name=3D"txWS",
+     py_modules=3D["txws"],
+-    setup_requires=3D["vcversioner", "six"],
++    setup_requires=3D["vcversioner"],
+     vcversioner=3D{},
+     author=3D"Corbin Simpson",
+     author_email=3D"simpsoco@osuosl.org",
+diff --git a/txws.py b/txws.py
+index 7de92a4..1da7cba 100644
+--- a/txws.py
++++ b/txws.py
+@@ -27,8 +27,6 @@ from __future__ import division
+=20
+ __version__ =3D "0.7.1"
+=20
+-import six
+-
+ import array
+=20
+ from base64 import b64encode, b64decode
+@@ -139,7 +137,7 @@ def complete_hybi00(headers, challenge):
+     first =3D int("".join(i for i in key1 if i in digits)) // key1.coun=
t(" ")
+     second =3D int("".join(i for i in key2 if i in digits)) // key2.cou=
nt(" ")
+=20
+-    nonce =3D pack(">II8s", first, second, six.b(challenge))
++    nonce =3D pack(">II8s", first, second, challenge.encode("latin-1"))
+=20
+     return md5(nonce).digest()
+=20
+@@ -169,10 +167,10 @@ def make_hybi00_frame(buf):
+     and valid text without any 0xff bytes.
+     """
+=20
+-    if isinstance(buf, six.text_type):
++    if isinstance(buf, str):
+         buf =3D buf.encode('utf-8')
+=20
+-    return six.b("\x00") + buf + six.b("\xff")
++    return b"\x00" + buf + b"\xff"
+=20
+ def parse_hybi00_frames(buf):
+     """
+@@ -182,12 +180,12 @@ def parse_hybi00_frames(buf):
+     and will actively ignore it.
+     """
+=20
+-    start =3D buf.find(six.b("\x00"))
++    start =3D buf.find(b"\x00")
+     tail =3D 0
+     frames =3D []
+=20
+     while start !=3D -1:
+-        end =3D buf.find(six.b("\xff"), start + 1)
++        end =3D buf.find(b"\xff", start + 1)
+         if end =3D=3D -1:
+             # Incomplete frame, try again later.
+             break
+@@ -196,7 +194,7 @@ def parse_hybi00_frames(buf):
+             frame =3D buf[start + 1:end]
+             frames.append((NORMAL, frame))
+             tail =3D end + 1
+-        start =3D buf.find(six.b("\x00"), end + 1)
++        start =3D buf.find(b"\x00", end + 1)
+=20
+     # Adjust the buffer and return.
+     buf =3D buf[tail:]
+@@ -231,12 +229,12 @@ def make_hybi07_frame(buf, opcode=3D0x1):
+     else:
+         length =3D chr(len(buf))
+=20
+-    if isinstance(buf, six.text_type):
++    if isinstance(buf, str):
+         buf =3D buf.encode('utf-8')
+=20
+     # Always make a normal packet.
+     header =3D chr(0x80 | opcode)
+-    return six.b(header + length) + buf
++    return (header + length).encode("latin-1") + buf
+=20
+ def make_hybi07_frame_dwim(buf):
+     """
+@@ -244,9 +242,9 @@ def make_hybi07_frame_dwim(buf):
+     """
+=20
+     # TODO: eliminate magic numbers.
+-    if isinstance(buf, six.binary_type):
++    if isinstance(buf, bytes):
+         return make_hybi07_frame(buf, opcode=3D0x2)
+-    elif isinstance(buf, six.text_type):
++    elif isinstance(buf, str):
+         return make_hybi07_frame(buf.encode("utf-8"), opcode=3D0x1)
+     else:
+         raise TypeError("In binary support mode, frame data must be eit=
her str or unicode")
+@@ -268,9 +266,6 @@ def parse_hybi07_frames(buf):
+         # about, and an opcode which nobody cares about.
+         header =3D buf[start]
+=20
+-        if six.PY2:
+-            header =3D ord(header)
+-
+         if header & 0x70:
+             # At least one of the reserved flags is set. Pork chop sand=
wiches!
+             raise WSException("Reserved flag in HyBi-07 frame (%d)" % h=
eader)
+@@ -289,9 +284,6 @@ def parse_hybi07_frames(buf):
+         # extra length.
+         length =3D buf[start + 1]
+=20
+-        if six.PY2:
+-            length =3D ord(length)
+-
+         masked =3D length & 0x80
+         length &=3D 0x7f
+=20
+@@ -342,7 +334,7 @@ def parse_hybi07_frames(buf):
+                 data =3D unpack(">H", data[:2])[0], data[2:]
+             else:
+                 # No reason given; use generic data.
+-                data =3D 1000, six.b("No reason given")
++                data =3D 1000, b"No reason given"
+=20
+         frames.append((opcode, data))
+         start +=3D offset + length
+@@ -355,7 +347,7 @@ class WebSocketProtocol(ProtocolWrapper):
+     layer.
+     """
+=20
+-    buf =3D six.b("")
++    buf =3D b""
+     codec =3D None
+     location =3D "/"
+     host =3D "example.com"
+@@ -385,7 +377,7 @@ class WebSocketProtocol(ProtocolWrapper):
+         return ISSLTransport(self.transport, None) is not None
+=20
+     def writeEncoded(self, data):
+-        if isinstance(data, six.text_type):
++        if isinstance(data, str):
+             data =3D data.encode('utf-8')
+         self.transport.write(data)
+=20
+@@ -528,7 +520,7 @@ class WebSocketProtocol(ProtocolWrapper):
+         elif "Sec-WebSocket-Protocol" in self.headers:
+             protocols =3D self.headers["Sec-WebSocket-Protocol"]
+=20
+-        if isinstance(protocols, six.string_types):
++        if isinstance(protocols, str):
+             protocols =3D [p.strip() for p in protocols.split(',')]
+=20
+             for protocol in protocols:
+@@ -587,7 +579,7 @@ class WebSocketProtocol(ProtocolWrapper):
+             # These lines look like:
+             # GET /some/path/to/a/websocket/resource HTTP/1.1
+             if self.state =3D=3D REQUEST:
+-                separator =3D six.b("\r\n")
++                separator =3D b"\r\n"
+                 if separator in self.buf:
+                     request, chaff, self.buf =3D self.buf.partition(sep=
arator)
+                     request =3D request.decode('utf-8')
+@@ -601,7 +593,7 @@ class WebSocketProtocol(ProtocolWrapper):
+=20
+             elif self.state =3D=3D NEGOTIATING:
+                 # Check to see if we've got a complete set of headers y=
et.
+-                separator =3D six.b("\r\n\r\n")
++                separator =3D b"\r\n\r\n"
+                 if separator in self.buf:
+                     head, chaff, self.buf =3D self.buf.partition(separa=
tor)
+                     head =3D head.decode('utf-8')
diff --git a/meta-python/recipes-connectivity/python-txws/python3-txws_0.=
9.1.bb b/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.=
bb
index 9299539cef..11ce8610fd 100644
--- a/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
+++ b/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
@@ -4,10 +4,9 @@ HOMEPAGE =3D "https://github.com/MostAwesomeDude/txWS"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D76699830db7fa9e897f6a1ad05f98=
ec8"
=20
-DEPENDS =3D "python3-twisted python3-six python3-vcversioner python3-six=
-native python3-vcversioner-native"
+DEPENDS =3D "python3-twisted python3-vcversioner python3-vcversioner-nat=
ive"
=20
 RDEPENDS:${PN} +=3D " \
-    python3-six \
     python3-twisted \
 "
=20
@@ -15,4 +14,5 @@ inherit setuptools3 pypi
=20
 PYPI_PACKAGE =3D "txWS"
=20
+SRC_URI +=3D "file://0001-drop-the-six-dependency.patch"
 SRC_URI[sha256sum] =3D "cb93086095d04a5d70f53a75053f7df478ff37e972c3637f=
b55ca4a9e6b94679"
--=20
2.55.0


