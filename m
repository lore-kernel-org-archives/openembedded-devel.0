Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F7B3C982F8
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 11:55:28 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47147.1789991724365655488
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 04:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=tqoRazPD;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout05.t-online.de (Postfix) with SMTP id 2CB668A4
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 13:55:22 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8ccA-04X1zD0; Mon, 21 Sep 2026 13:55:18 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 16/24] python3-qface: drop the six dependency
Date: Mon, 21 Sep 2026 13:54:52 +0200
Message-ID: <20260921115500.53770-16-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921115500.53770-1-f_l_k@t-online.de>
References: <20260921115500.53770-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789991718-76FF2A93-E1A71EFF/0/0 CLEAN NORMAL
X-TOI-MSGID: ae820fba-4605-4dc6-a417-7831b681de1c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789991722; i=f_l_k@t-online.de;
	bh=/rNGXKGPirC+hmacpbWS8nQT520Nai/JgMaSe18wxMI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=tqoRazPD8F7ssfiUYG76z0HTCu/yVokS38OsCLTiCuvq8EtkhMYmdsD6+rgOWcBY+
	 FO/JRPxetrXiyTOMLTmg6+Zd1oypsewi8Yki3iW5aYjW/FVz72zXTt82tsXjkb4TXq
	 1wEjpe3HE8yg07XTEoqnf22d8jhBQD4Wpf7OUOwfuC2457Z3L8cnvB2IJHdaHnhxpC
	 vvtXAvOSWGTOtho64UGAkI1fzTSLQagBfaD9Muz2PkYbCSZVHXzCv5CTrEUjxTnigW
	 QG9gnL87ExxqUN/NYroJV7QKZRNhuNMH4t9lwWJtriYX9co2rlyfZo1vkg1E9IH+Mg
	 b2m2HLFYn/epA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 11:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130134

qface declares six in install_requires but does not import it anywhere.
Patch it out and drop the dependency from the recipe.

Built for intel-corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-drop-the-six-dependency.patch        | 27 +++++++++++++++++++
 .../python/python3-qface_2.0.14.bb            |  2 +-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-qface/000=
1-drop-the-six-dependency.patch

diff --git a/meta-python/recipes-devtools/python/python3-qface/0001-drop-=
the-six-dependency.patch b/meta-python/recipes-devtools/python/python3-qf=
ace/0001-drop-the-six-dependency.patch
new file mode 100644
index 0000000000..e4722a021b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-qface/0001-drop-the-six=
-dependency.patch
@@ -0,0 +1,27 @@
+From 306a9a40b6056c9d07037282bec645ca393ed4b2 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 21 Sep 2026 13:31:21 +0200
+Subject: [PATCH] drop the six dependency
+
+six is a Python 2 compatibility shim; qface declares it in
+install_requires but no longer imports it anywhere.
+
+Upstream-Status: Pending
+
+AI-Generated: Uses Claude Code (Claude Opus 5)
+---
+ setup.py | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 3dca1d3..d2734d3 100644
+--- a/setup.py
++++ b/setup.py
+@@ -51,7 +51,6 @@ setup(
+         'jinja2>=3D2.10.3',
+         'pyyaml>=3D5.1',
+         'watchdog>=3D1.0',
+-        'six>=3D1.11.0',
+         'coloredlogs>=3D10.0',
+     ],
+     extras_require=3D{
diff --git a/meta-python/recipes-devtools/python/python3-qface_2.0.14.bb =
b/meta-python/recipes-devtools/python/python3-qface_2.0.14.bb
index 9e78074e0e..a8a4083b23 100644
--- a/meta-python/recipes-devtools/python/python3-qface_2.0.14.bb
+++ b/meta-python/recipes-devtools/python/python3-qface_2.0.14.bb
@@ -2,6 +2,7 @@ SUMMARY =3D "A generator framework based on a common mode=
rn IDL"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Deee61e10a40b0e3045ee5965bcd9a=
8b5"
=20
+SRC_URI +=3D "file://0001-drop-the-six-dependency.patch"
 SRC_URI[sha256sum] =3D "df31014fbe95b3d910d059ce1a8e827d57d234aca3a5c420=
94d6ad096fd8f39e"
=20
 inherit pypi setuptools3
@@ -11,7 +12,6 @@ DEPS =3D "\
     python3-click \
     python3-pyyaml \
     python3-pytest \
-    python3-six \
     python3-path \
     python3-antlr4-runtime \
     python3-watchdog \
--=20
2.55.0


