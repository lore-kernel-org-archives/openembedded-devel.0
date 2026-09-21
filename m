Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D33CC982E1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 11:56:11 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47165.1789991765094614058
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 04:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=oGNU4wBo;
 spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout09.t-online.de (Postfix) with SMTP id 9839438166
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 13:55:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8cc8-04X1z00; Mon, 21 Sep 2026 13:55:16 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 03/24] python3-configshell-fb: upgrade 1.1.30 -> 2.0.3
Date: Mon, 21 Sep 2026 13:54:39 +0200
Message-ID: <20260921115500.53770-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921115500.53770-1-f_l_k@t-online.de>
References: <20260921115500.53770-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789991716-837FDA93-76AB94C8/0/0 CLEAN NORMAL
X-TOI-MSGID: d5912325-d424-4e38-a0ee-bcdc8412ffb7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789991721; i=f_l_k@t-online.de;
	bh=kKvQrJErWE89Ys3hSZpp7TVGGyV2hqWLNE1Xl2O4Pr0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=oGNU4wBo7ZuL28St8CHIgSG20i3Z072GOsyPNazeMdEx3kBd1cmVkzaNu6asOCDf8
	 T7AK7OjcL6uLJ6DnXBfXPor09uIBc7tvZMDhIk162xqAJCWvFtU3CMrUOo6A17CY4u
	 /JbP0z6ESG1Jq3XxLO1Mwe7ARRWlzonmpsILbpEgL5cF1s4rU7VEL1EvQW9uXWfCBR
	 P2Xa/9GClbFHJuwock6vogznBaxY6a2Qgf07Qfe77V6wHpTG6ARfTtkVzfyADiprsM
	 dFw/1VnZBc2WSJ9ctT+gdeQPFK3MnVQRUxa9utW1SrsbeTIugHG1iKSN/Al1sNseFX
	 aimdic91GG69w==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 11:56:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130138

The new release drops the six dependency and the 2to3 conversion, and
switches the build backend from poetry-core to hatchling, which needs
hatch-vcs at build time. The COPYING checksum changed with the new
license file header.

Built for intel-corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../python/python3-configshell-fb_1.1.30.bb   | 18 -----------------
 .../python/python3-configshell-fb_2.0.3.bb    | 20 +++++++++++++++++++
 2 files changed, 20 insertions(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-configshe=
ll-fb_1.1.30.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-configshe=
ll-fb_2.0.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-configshell-fb_1=
.1.30.bb b/meta-python/recipes-devtools/python/python3-configshell-fb_1.1=
.30.bb
deleted file mode 100644
index aa14c99e8b..0000000000
--- a/meta-python/recipes-devtools/python/python3-configshell-fb_1.1.30.b=
b
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY =3D "A Python library for building configuration shells"
-DESCRIPTION =3D "configshell-fb is a Python library that provides a fram=
ework for \
-building simple but nice CLI-based applications. This runs with Python 2=
 and \
-2to3 is run by setup.py to run on Python 3."
-
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1dece7821bf3fd70fe1309eaa37d5=
2a2"
-
-SRC_URI[sha256sum] =3D "41f6b7eaa7c9ff422acdc910762fd39ef3333a365918463f=
ef8b398d857170fe"
-
-inherit pypi python_poetry_core
-
-RDEPENDS:${PN} +=3D " \
-    python3-fcntl \
-    python3-modules \
-    python3-pyparsing \
-    python3-six \
-"
diff --git a/meta-python/recipes-devtools/python/python3-configshell-fb_2=
.0.3.bb b/meta-python/recipes-devtools/python/python3-configshell-fb_2.0.=
3.bb
new file mode 100644
index 0000000000..48751575c5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-configshell-fb_2.0.3.bb
@@ -0,0 +1,20 @@
+SUMMARY =3D "A Python library for building configuration shells"
+DESCRIPTION =3D "configshell-fb is a Python library that provides a fram=
ework for \
+building simple but nice CLI-based applications."
+
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D34400b68072d710fecd0a2940a0d1=
658"
+
+PYPI_PACKAGE =3D "configshell_fb"
+
+SRC_URI[sha256sum] =3D "dbb086c16c1603a230f9017ef85baccabfd5d87439a01e96=
3377e50f10220f53"
+
+inherit pypi python_hatchling
+
+DEPENDS +=3D "python3-hatch-vcs-native"
+
+RDEPENDS:${PN} +=3D " \
+    python3-fcntl \
+    python3-modules \
+    python3-pyparsing \
+"
--=20
2.55.0


