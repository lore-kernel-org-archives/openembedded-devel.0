Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3CE0C4828F
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 23:04:24 +0000 (UTC)
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
 by mx.groups.io with SMTP id smtpd.web11.27975.1707001461816511436
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Feb 2024 15:04:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@g0hl1n.net header.s=key1 header.b=eZUVIocH;
 spf=pass (domain: g0hl1n.net, ip: 91.218.175.183, mailfrom: dev@g0hl1n.net)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1707001459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xJ2sjexhveZCuXdlXr2oG7+QAtecyuA6QZJdi8oiJ+Q=;
	b=eZUVIocHZIYvHYXO4UngmR516RiD6uI0I888pwsalX1w3XAgUq0Gx3E8rpdzD0gPaJdcAh
	8eoBFGPs8qkVOATrKSqZ/Oi+gcQFiszVrFQ/TNknpI0NJnpCC/FhC41MLsKbJ3AwABBu69
	Ng874LrHhqPVDJZo9T7n/DDjVzW3lZA=
From: Richard Leitner <dev@g0hl1n.net>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Leitner <dev@g0hl1n.net>
Subject: [meta-python][PATCH] python3-moteus: add recipe for v0.3.67
Date: Sun,  4 Feb 2024 00:03:55 +0100
Message-Id: <20240203230355.1837702-1-dev@g0hl1n.net>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Feb 2024 23:04:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108557

moteus brushless controller library and tools. This recipe uses pypi as
source:

    https://pypi.org/project/moteus/

Signed-off-by: Richard Leitner <dev@g0hl1n.net>
---
 ...hon-remove-self-import-from-setup.py.patch | 32 +++++++++++++++++++
 .../python/python3-moteus_0.3.67.bb           | 19 +++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-moteus/00=
01-lib-python-remove-self-import-from-setup.py.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-moteus_0.=
3.67.bb

diff --git a/meta-python/recipes-devtools/python/python3-moteus/0001-lib-=
python-remove-self-import-from-setup.py.patch b/meta-python/recipes-devto=
ols/python/python3-moteus/0001-lib-python-remove-self-import-from-setup.p=
y.patch
new file mode 100644
index 000000000..10acd7b8c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-moteus/0001-lib-python-=
remove-self-import-from-setup.py.patch
@@ -0,0 +1,32 @@
+From 7490ac4629c7fe0dc329647e6e000d4bc13c610d Mon Sep 17 00:00:00 2001
+From: Richard Leitner <dev@g0hl1n.net>
+Date: Wed, 24 Jan 2024 00:49:45 +0100
+Subject: [PATCH] lib: python: remove self-import from setup.py
+
+Importing moteus itself within the setup.py creates some kind of a
+chicken-and-egg problem. Furthermore it isn't used anywhere within
+setup.py. Therefore remove the corresponding import.
+
+Signed-off-by: Richard Leitner <dev@g0hl1n.net>
+
+Upstream-Status: Backport [https://github.com/mjbots/moteus/commit/7490a=
c4629c7fe0dc329647e6e000d4bc13c610d]
+---
+ setup.py | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 2731685..6c6064d 100644
+--- a/setup.py
++++ b/setup.py
+@@ -17,8 +17,6 @@
+ import setuptools
+ import pathlib
+=20
+-import moteus
+-
+ here =3D pathlib.Path(__file__).parent.resolve()
+=20
+ # Get the long description from the README file
+--=20
+2.40.1
+
diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.67.bb=
 b/meta-python/recipes-devtools/python/python3-moteus_0.3.67.bb
new file mode 100644
index 000000000..3c93ee44f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.67.bb
@@ -0,0 +1,19 @@
+SUMMARY =3D "moteus brushless controller library and tools"
+HOMEPAGE =3D "https://github.com/mjbots/moteus"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D3;endline=3D9;md5=3D24=
025d3c660abfc62a83f0e709a45e76"
+
+inherit pypi setuptools3
+
+SRC_URI +=3D "file://0001-lib-python-remove-self-import-from-setup.py.pa=
tch"
+
+SRC_URI[sha256sum] =3D "a2122f20f59b8962057cf8d3fb583e0aa19006eaf2cde49e=
30027a4d1b8bf925"
+
+S =3D "${WORKDIR}/moteus-${PV}"
+
+RDEPENDS:${PN} +=3D "\
+    python3-can \
+    python3-importlib-metadata \
+    python3-pyelftools \
+    python3-pyserial \
+"
--=20
2.40.1


