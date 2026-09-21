Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCEFBC982FE
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 11:56:11 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47399.1789991769132939923
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 04:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=YZAs1klk;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout01.t-online.de (Postfix) with SMTP id 3F49C1C436
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 13:55:22 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8ccA-04X1zG0; Mon, 21 Sep 2026 13:55:18 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 19/24] python3-smpplib: drop the six dependency
Date: Mon, 21 Sep 2026 13:54:55 +0200
Message-ID: <20260921115500.53770-19-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921115500.53770-1-f_l_k@t-online.de>
References: <20260921115500.53770-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789991718-89FF8A93-81CB74A2/0/0 CLEAN NORMAL
X-TOI-MSGID: 9cf6f6ea-ceac-49c5-bd89-a3891c0e4d0e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789991722; i=f_l_k@t-online.de;
	bh=cD3jFRJWiJe1qjB0qP/Q5D4TJUnQ2yu9zLzz8w8pFT0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=YZAs1klkWBAfl76opQTEpdKfCXlRMLu0GqCogMzk6M0tEK90cvMAXQS/QMRVSbQkc
	 bQfvfAtoeL3RNg5eIHdag7fsJnmcUbKoj05+uMVwTd+RRMBw/AQd6QtYYrpEcIpJzk
	 K/sWEi+H6LlQxKpjnLVer+BBr+GaLcd1710sjQSq3NTGkHzhOQ68d8aD0R9//7+hSA
	 G0Cpt8IrbUJ9NmTqX+D8dBHTR3/FhyB5S0wvZ/ZLQ2qcBFnNFlovBFE4+aBxtjV07w
	 E1FbmvuBUlk3Uef2eKQORJiXC0FUycZb0gBrc0WUbf5J4XBhMzcAfZEy+8um2flxiJ
	 MY61krH410C4w==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 11:56:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130150

Patch smpplib to use dict.items, a bytes literal and a latin-1 encode
instead of six.iteritems, six.int2byte and six.b, and drop the runtime
dependency.

Built for intel-corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-drop-the-six-dependency.patch        | 124 ++++++++++++++++++
 .../python/python3-smpplib_2.2.4.bb           |   2 +-
 2 files changed, 125 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-smpplib/0=
001-drop-the-six-dependency.patch

diff --git a/meta-python/recipes-devtools/python/python3-smpplib/0001-dro=
p-the-six-dependency.patch b/meta-python/recipes-devtools/python/python3-=
smpplib/0001-drop-the-six-dependency.patch
new file mode 100644
index 0000000000..0423fdc455
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-smpplib/0001-drop-the-s=
ix-dependency.patch
@@ -0,0 +1,124 @@
+From ebb5d702a7bff096a75280b1709f5e061857b7d4 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 21 Sep 2026 13:24:42 +0200
+Subject: [PATCH] drop the six dependency
+
+six is a Python 2 compatibility shim and smpplib does not need it on
+Python 3: six.iteritems is dict.items, six.int2byte is bytes of a single
+value and six.b encodes as latin-1.
+
+Upstream-Status: Pending
+
+AI-Generated: Uses Claude Code (Claude Opus 5)
+---
+ setup.py                 | 1 -
+ smpplib/command.py       | 8 +++-----
+ smpplib/command_codes.py | 4 +---
+ smpplib/gsm.py           | 8 +++-----
+ 4 files changed, 7 insertions(+), 14 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index b12fc31..b3ef37e 100644
+--- a/setup.py
++++ b/setup.py
+@@ -16,7 +16,6 @@ setup(
+     url=3D'https://github.com/python-smpplib/python-smpplib',
+     description=3D'SMPP library for python',
+     packages=3Dfind_packages(),
+-    install_requires=3D['six'],
+     extras_require=3Ddict(
+         tests=3D('typing; python_version < "3.5"', 'pytest', 'mock'),
+     ),
+diff --git a/smpplib/command.py b/smpplib/command.py
+index bde5840..40fcac7 100644
+--- a/smpplib/command.py
++++ b/smpplib/command.py
+@@ -22,8 +22,6 @@
+ import logging
+ import struct
+=20
+-import six
+-
+ from smpplib import consts, exceptions, pdu
+ from smpplib.ptypes import flag, ostr
+=20
+@@ -64,7 +62,7 @@ def get_optional_name(code):
+     """Return optional_params name by given code. If code is unknown, r=
aise
+     UnkownCommandError exception"""
+=20
+-    for key, value in six.iteritems(consts.OPTIONAL_PARAMS):
++    for key, value in consts.OPTIONAL_PARAMS.items():
+         if value =3D=3D code:
+             return key
+=20
+@@ -106,7 +104,7 @@ class Command(pdu.PDU):
+=20
+     def _set_vars(self, **kwargs):
+         """set attributes accordingly to kwargs"""
+-        for key, value in six.iteritems(kwargs):
++        for key, value in kwargs.items():
+             if not hasattr(self, key) or getattr(self, key) is None:
+                 setattr(self, key, value)
+=20
+@@ -179,7 +177,7 @@ class Command(pdu.PDU):
+                 value =3D chr(0)
+=20
+         setattr(self, field, field_value)
+-        return six.b(value)
++        return value.encode('latin-1')
+=20
+     def _generate_ostring(self, field):
+         """Generate octet string value (no null terminator)"""
+diff --git a/smpplib/command_codes.py b/smpplib/command_codes.py
+index eab6868..a0fc53e 100644
+--- a/smpplib/command_codes.py
++++ b/smpplib/command_codes.py
+@@ -1,5 +1,3 @@
+-import six
+-
+ from smpplib import exceptions
+=20
+ #
+@@ -42,7 +40,7 @@ def get_command_name(code):
+     If code is unknown, raise UnknownCommandError exception.
+     """
+=20
+-    for key, value in six.iteritems(commands):
++    for key, value in commands.items():
+         if value =3D=3D code:
+             return key
+=20
+diff --git a/smpplib/gsm.py b/smpplib/gsm.py
+index 9d70f98..77c6d0e 100644
+--- a/smpplib/gsm.py
++++ b/smpplib/gsm.py
+@@ -1,8 +1,6 @@
+ # -*- coding: utf8 -*-
+ import random
+=20
+-import six
+-
+ from smpplib import consts, exceptions
+=20
+=20
+@@ -55,7 +53,7 @@ def gsm_encode(plaintext):
+     """Performs default GSM 7-bit encoding. Beware it's vendor-specific=
 and not recommended for use."""
+     try:
+         return b''.join(
+-            six.int2byte(index) if index < 0x80 else b'\x1B' + six.int2=
byte(index - 0x80)
++            bytes((index,)) if index < 0x80 else b'\x1B' + bytes((index=
 - 0x80,))
+             for index in map(GSM_CHARACTER_TABLE.index, plaintext)
+         )
+     except ValueError:
+@@ -78,9 +76,9 @@ def make_parts_encoded(encoded_text, part_size):
+         raise exceptions.MessageTooLong()
+=20
+     uid =3D random.randint(0, 255)
+-    header =3D b''.join((b'\x05\x00\x03', six.int2byte(uid), six.int2by=
te(len(chunks))))
++    header =3D b''.join((b'\x05\x00\x03', bytes((uid,)), bytes((len(chu=
nks),))))
+=20
+-    return [b''.join((header, six.int2byte(i), chunk)) for i, chunk in =
enumerate(chunks, start=3D1)]
++    return [b''.join((header, bytes((i,)), chunk)) for i, chunk in enum=
erate(chunks, start=3D1)]
+=20
+=20
+ def split_sequence(sequence, part_size):
diff --git a/meta-python/recipes-devtools/python/python3-smpplib_2.2.4.bb=
 b/meta-python/recipes-devtools/python/python3-smpplib_2.2.4.bb
index e65259a053..f06a71f4f6 100644
--- a/meta-python/recipes-devtools/python/python3-smpplib_2.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-smpplib_2.2.4.bb
@@ -3,13 +3,13 @@ SECTION =3D "devel/python"
 LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://README.md;md5=3D8b4e2ac8cf248f7b991784f88b6=
30852"
=20
+SRC_URI +=3D "file://0001-drop-the-six-dependency.patch"
 SRC_URI[sha256sum] =3D "6f3b036fcb2643c1b7a3289bb5ac4c9a720af1bf73e572e2=
729db6b5d800c273"
=20
 inherit pypi setuptools3 ptest-python-pytest
=20
 RDEPENDS:${PN} +=3D " \
         python3-logging \
-        python3-six \
 "
=20
 RDEPENDS:${PN}-ptest +=3D " \
--=20
2.55.0


