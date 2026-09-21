Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86ACFC982EE
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 11:56:08 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47397.1789991767651272520
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 04:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=PQKo5meW;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout01.t-online.de (Postfix) with SMTP id 154471C418
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 13:55:22 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8ccA-04X1zA0; Mon, 21 Sep 2026 13:55:18 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 13/24] python3-pyu2f: drop the six dependency
Date: Mon, 21 Sep 2026 13:54:49 +0200
Message-ID: <20260921115500.53770-13-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921115500.53770-1-f_l_k@t-online.de>
References: <20260921115500.53770-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789991718-50FF6A93-EDF915DE/0/0 CLEAN NORMAL
X-TOI-MSGID: 1db4728c-ca3d-43b2-a293-3007290d088c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789991722; i=f_l_k@t-online.de;
	bh=ebhMUWJA2cCPyVwaDjuLKrA9gYE1sjf+gy9JZixTNbQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=PQKo5meWaP8GpiuSxamSaB5yW62N8CJtvyhFaIhXe9d6nrd4ERCNUyKBoIludgyDy
	 4wKTrRqMJx26wGh9lv/VyyyFM+/gfHmk6ZuK6ixBwJbU9H8mp/c9vvZgYv+ZW6/04Q
	 THJ8TVsCkaF9b2WLqrxqBn36gmTz/M39XQ3B5VTRBp29PFM+2N/488UKU/PUKFGAXb
	 8UjvH5Opzm/JX0bFf0g+o8hfM8wNFK8n5U1RW9AZ0jIdXMQhgOeSHh9iVwJayPopn+
	 nH5h0anKaRJROojN8TUWbwpUoXOJx+ovYHuwzu9hp3eM+sZ70Nw56vlEdntOGqPaTX
	 0BOQMAQ2zpvQA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 11:56:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130148

Patch pyu2f to use queue, range and the input builtin instead of the
six.moves aliases, and drop the runtime dependency.

Built for intel-corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-drop-the-six-dependency.patch        | 70 +++++++++++++++++++
 .../python/python3-pyu2f_0.1.5.bb             |  2 +-
 2 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyu2f/000=
1-drop-the-six-dependency.patch

diff --git a/meta-python/recipes-devtools/python/python3-pyu2f/0001-drop-=
the-six-dependency.patch b/meta-python/recipes-devtools/python/python3-py=
u2f/0001-drop-the-six-dependency.patch
new file mode 100644
index 0000000000..87a6ab9fa0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyu2f/0001-drop-the-six=
-dependency.patch
@@ -0,0 +1,70 @@
+From eb27c7a2a85f2ac21ea9fa0d30979b04fdb0f671 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 21 Sep 2026 13:23:08 +0200
+Subject: [PATCH] drop the six dependency
+
+six is a Python 2 compatibility shim and pyu2f does not need it on
+Python 3: six.moves.queue and six.moves.range are queue and range, and
+six.moves.input is input.
+
+Upstream-Status: Pending
+
+AI-Generated: Uses Claude Code (Claude Opus 5)
+---
+ pyu2f/convenience/localauthenticator.py | 3 +--
+ pyu2f/hid/macos.py                      | 3 +--
+ setup.py                                | 3 ---
+ 3 files changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/pyu2f/convenience/localauthenticator.py b/pyu2f/convenience=
/localauthenticator.py
+index b03fa57..2b6b22a 100644
+--- a/pyu2f/convenience/localauthenticator.py
++++ b/pyu2f/convenience/localauthenticator.py
+@@ -13,7 +13,6 @@
+ # limitations under the License.
+=20
+ """Convenience class for U2F signing with local security keys."""
+-import six
+ import base64
+ import sys
+=20
+@@ -36,7 +35,7 @@ class LocalAuthenticator(baseauthenticator.BaseAuthent=
icator):
+       device =3D u2f.GetLocalU2FInterface(origin=3Dself.origin)
+     except errors.NoDeviceFoundError:
+       print_callback('Please insert your security key and press enter..=
.')
+-      six.moves.input()
++      input()
+       device =3D u2f.GetLocalU2FInterface(origin=3Dself.origin)
+=20
+     print_callback('Please touch your security key.\n')
+diff --git a/pyu2f/hid/macos.py b/pyu2f/hid/macos.py
+index 905bce2..a2ed2e6 100644
+--- a/pyu2f/hid/macos.py
++++ b/pyu2f/hid/macos.py
+@@ -13,11 +13,10 @@
+ # limitations under the License.
+=20
+ """Implements HID device interface on MacOS using IOKit and HIDManager.=
"""
+-from six.moves import queue
+-from six.moves import range
+ import ctypes
+ import ctypes.util
+ import logging
++import queue
+ import sys
+ import threading
+=20
+diff --git a/setup.py b/setup.py
+index 663706b..184be89 100644
+--- a/setup.py
++++ b/setup.py
+@@ -36,9 +36,6 @@ setuptools.setup(
+     author_email=3D'pyu2f-team@google.com',
+     # Contained modules and scripts.
+     packages=3Dsetuptools.find_packages(exclude=3D["pyu2f.tests", "pyu2=
f.tests.*"]),
+-    install_requires=3D[
+-        'six',
+-    ],
+     tests_require=3D[
+         'unittest2>=3D0.5.1',
+         'pyfakefs>=3D2.4',
diff --git a/meta-python/recipes-devtools/python/python3-pyu2f_0.1.5.bb b=
/meta-python/recipes-devtools/python/python3-pyu2f_0.1.5.bb
index 5a2899e132..083fed68f6 100644
--- a/meta-python/recipes-devtools/python/python3-pyu2f_0.1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pyu2f_0.1.5.bb
@@ -3,6 +3,7 @@ HOMEPAGE =3D "https://github.com/google/pyu2f/"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
=20
+SRC_URI +=3D "file://0001-drop-the-six-dependency.patch"
 SRC_URI[sha256sum] =3D "a3caa3a11842fc7d5746376f37195e6af5f17c0a15737538=
bb1cebf656fb306b"
=20
 inherit pypi setuptools3
@@ -16,5 +17,4 @@ RDEPENDS:${PN} +=3D " \
     python3-logging \
     python3-netclient \
     python3-threading \
-    python3-six \
 "
--=20
2.55.0


