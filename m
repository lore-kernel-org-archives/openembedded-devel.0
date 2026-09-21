Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E2CBC982ED
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 11:56:08 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47398.1789991767842445109
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 04:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=QVlHxWky;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout01.t-online.de (Postfix) with SMTP id 22EDE1C423
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 13:55:22 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8ccA-04X1zC0; Mon, 21 Sep 2026 13:55:18 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 15/24] python3-pywbemtools: upgrade 1.3.1 -> 1.4.1
Date: Mon, 21 Sep 2026 13:54:51 +0200
Message-ID: <20260921115500.53770-15-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921115500.53770-1-f_l_k@t-online.de>
References: <20260921115500.53770-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789991718-8AFFAA93-0D505878/0/0 CLEAN NORMAL
X-TOI-MSGID: 2be92ef6-16db-42b7-8358-94dbbbf2c17e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789991722; i=f_l_k@t-online.de;
	bh=W7H4tyEaisCqTDyiRz8PCZCNVGVKXY++x9mCYVLl0zM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=QVlHxWkyDQX1OpKtVEi7NThLellg9NxyeIWy0+9YF5KRrHPBeBXE9/YSixVjmCCyz
	 5rFK0hxMbjRzKCjJfmCz3uJScfnj4hsdmHAKjNEwFIbFgQOm5W/Ptkagmuoro+SfqR
	 vpQ57VoTwT36uo2ir1NY+KPGF3F4/tusigMJlnTtGZbp6DeqwFfbKQ8DyF36mAqCkN
	 Gu4yA6QO4F+I1X7Ch/D6mlvZ68hKcRXoSygnXDuxDH1oRTq7KG1tzBv6e52JsS0GMS
	 Uw8nVEF+IJOUj37Pw2E+VPDC4By3va+B03eCtoye7ZzwWF9XguW/XywzLnSLjJvoDR
	 dJ3McEHjMPZPQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 11:56:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130149

The new release drops six, pydicti and custom-inherit and adds toposort,
psutil, pyparsing and urllib3. It builds with the setuptools build
backend and needs setuptools-scm and wheel at build time.

Built for intel-corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ols_1.3.1.bb =3D> python3-pywbemtools_1.4.1.bb} | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)
 rename meta-python/recipes-extended/pywbemtools/{python3-pywbemtools_1.3=
.1.bb =3D> python3-pywbemtools_1.4.1.bb} (69%)

diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools=
_1.3.1.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_=
1.4.1.bb
similarity index 69%
rename from meta-python/recipes-extended/pywbemtools/python3-pywbemtools_=
1.3.1.bb
rename to meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.=
4.1.bb
index 83156cfddf..da5205711d 100644
--- a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.3.1.=
bb
+++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.4.1.=
bb
@@ -4,14 +4,18 @@ HOMEPAGE =3D "https://pywbemtools.readthedocs.io/en/sta=
ble/"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3De23fadd6ceef8c618fc1c6519=
1d846fa"
=20
-SRC_URI[sha256sum] =3D "7fb1c32e358d55c2c6966a071c8ecc0ca81de3d32944a67c=
c646c57b1a7a337a"
+SRC_URI[sha256sum] =3D "537f848a90b3f40531984ec296387eaa1892905b5ed8d3fe=
7d6d4c737f25fce9"
=20
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
+
+DEPENDS +=3D " \
+    python3-setuptools-scm-native \
+    python3-wheel-native \
+"
=20
 RDEPENDS:${PN}:append:class-target =3D " \
     python3-ply \
     python3-pyyaml \
-    python3-six \
     python3-pywbem \
     python3-click \
     python3-requests \
@@ -24,9 +28,11 @@ RDEPENDS:${PN}:append:class-target =3D " \
     python3-click-spinner \
     python3-asciitree \
     python3-tabulate \
-    python3-pydicti \
     python3-nocaselist \
-    python3-custom-inherit \
+    python3-toposort \
+    python3-psutil \
+    python3-pyparsing \
+    python3-urllib3 \
 "
=20
 BBCLASSEXTEND =3D "native"
--=20
2.55.0


