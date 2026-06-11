Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 299D2CD98D2
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 10:15:05 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42216.1781172897864730414
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2026 03:14:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=QRJj/XvM;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout10.t-online.de (Postfix) with SMTP id D57C737E9A
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 12:14:55 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.168.237]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wXcR3-3vm8930; Thu, 11 Jun 2026 12:14:53 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] webkitgtk3: add PACKAGECONFIG for librice
Date: Thu, 11 Jun 2026 12:14:43 +0200
Message-ID: <20260611101443.631643-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1781172893-FCFF7489-D93C3F69/0/0 CLEAN NORMAL
X-TOI-MSGID: e9d2698a-2e96-479e-ba2e-03f0ec6a58e8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1781172895; i=f_l_k@t-online.de;
	bh=2fFiB3DR7d1OB3JNDNJ+6H5iDour21VyVVPkFofB6Ac=;
	h=From:To:Subject:Date;
	b=QRJj/XvMOG66t8qw1TyUX3OTCZOvp52wXFQSKDcGjwDqJ/DOKmYICydVNUpqIrn/l
	 f5zC8+uQJKgl7L4RzV9m+9xD2RZC8g1GuXwfu9+zGRooRZhBZvolQI3xQvwU5qJMPc
	 z1/XmzXkKSNJI3nk51YOgtABfTBiUCKzcNwg3XmJbGkYBTUdE4l+wu5i31UtiR0jSS
	 /Q6gdPL6r6pqWfaKKT3ZVMToltZfv7AU2jNVrzGWrIuNLf7aqNqoGHHuX0BiuLEa0G
	 MT3Z+NHSVK4F0258LnSUMHp6t2Vy18NIgIoppaRPkXNTVzL0LMQ7br4Ng/IaWIK8e8
	 2qlpUh/LRu8fQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 10:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127526

webkitgtk3 enables librice support by default, thus build fails.
Add a PACKAGECONFIG for librice to handle this but disable by
default to not change our dependencies. librice requires clang-native
to build bindgen.

todo: enable this PACKAGECONFIG by default?

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb b/met=
a-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb
index 4486450595..c0836d283d 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.52.4.bb
@@ -88,6 +88,7 @@ PACKAGECONFIG[bubblewrap] =3D "-DENABLE_BUBBLEWRAP_SAND=
BOX=3DON -DBWRAP_EXECUTABLE=3D$
 PACKAGECONFIG[backtrace] =3D "-DUSE_LIBBACKTRACE=3DON,-DUSE_LIBBACKTRACE=
=3DOFF,libbacktrace"
 PACKAGECONFIG[sysprof-capture] =3D "-DUSE_SYSTEM_SYSPROF_CAPTURE=3DYES,-=
DUSE_SYSTEM_SYSPROF_CAPTURE=3DNO,sysprof"
 PACKAGECONFIG[speech] =3D "-DENABLE_SPEECH_SYNTHESIS=3DON,-DENABLE_SPEEC=
H_SYNTHESIS=3DOFF,flite"
+PACKAGECONFIG[librice] =3D "-DUSE_LIBRICE=3DYES,-DUSE_LIBRICE=3DNO,libri=
ce"
=20
 EXTRA_OECMAKE =3D " \
 	-DPORT=3DGTK \
--=20
2.54.0


