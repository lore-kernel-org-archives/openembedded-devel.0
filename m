Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55965C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 11:42:45 +0000 (UTC)
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.171389.1783424304624128141
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jul 2026 04:38:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: lgo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 307E9202596
	for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jul 2026 13:38:22 +0200 (CEST)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <lgo@pengutronix.de>)
	id 1wh486-000ZQk-0M
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Jul 2026 13:38:22 +0200
Received: from lgo by dude03.red.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <lgo@pengutronix.de>)
	id 1wh486-00000009K11-051y
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Jul 2026 13:38:22 +0200
From: =?UTF-8?B?TGVvbmFyZCBHw7ZocnM=?= <l.goehrs@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-aiohttp: add buildpath HOME check exception due to upstream pkg
Date: Tue,  7 Jul 2026 13:38:16 +0200
Message-ID: <20260707113818.2221878-1-l.goehrs@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jul 2026 11:42:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128059

The upstream tarball fetched from pypi contains `.hash` files like these:

  $ cat aiohttp/.hash/hdrs.py.hash
  a46ad6c3a2faf8d26a2c6afc1a2210ce379a23f2799fce7b26a01f6ce5a40642  /home=
/runner/work/aiohttp/aiohttp/aiohttp/hdrs.py

These file trigger the relatively new HOME buildpath check _if_ the recip=
e
happens to be built by someone with HOME set to /home/runner
(for example someone building in a GitHub workflow):

  ERROR: python3-aiohttp-3.14.1-r0 do_package_qa: QA Issue:
  File /usr/lib/python3.14/site-packages/aiohttp/.hash/hdrs.py.hash
  in package python3-aiohttp contains a reference to the build host HOME =
directory.
  If upstream hardcodes a directory path that matches your home,
  you can set OEQA_BUILDPATHS_SKIP =3D "/home/runner" in the recipe. [bui=
ldpaths]

Follow the suggested fix of setting `OEQA_BUILDPATHS_SKIP`.
See also openembedded-core commit ee29a9132a ("oeqa: allow exceptions in
buildpath HOME checks") for an example of `OEQA_BUILDPATHS_SKIP` used.

Signed-off-by: Leonard G=C3=B6hrs <l.goehrs@pengutronix.de>
---
 meta-python/recipes-devtools/python/python3-aiohttp_3.14.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.14.1.b=
b b/meta-python/recipes-devtools/python/python3-aiohttp_3.14.1.bb
index a2267ea23c..656cef368a 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.14.1.bb
@@ -35,3 +35,5 @@ RDEPENDS:${PN} =3D "\
 CFLAGS:append:toolchain-gcc:arm =3D " -flax-vector-conversions"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+OEQA_BUILDPATHS_SKIP =3D "/home/runner"
--=20
2.47.3


