Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A192C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 21:54:18 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web10.2358.1706306053963371319
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jan 2024 13:54:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=CWGCg/98;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id E2572240027
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 22:54:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1706306051; bh=d5OjywraS7wUPjvWfUYb5D4urKIp01i9SqII64Y6iNA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=CWGCg/98ACvdhvZHQRwJ4ARX6CoqhAkQRDPudJr/xRJq1nZei9x/6MWdzqWsotRsc
	 K1Fesph/4TiVlNenLx4uN1EbvhGtOUqTd7baN3WN71rOG+jW0bRZjzFknfBaXG9Kgn
	 D1/voh33RPY2z0lKnoaMYzYLnQEfjPTUiqDfGtxH4vrhZZprGtzyECI6PoLHpmAig/
	 n4XoGE7MxxkWTe2qxSXOz5BZZAIBQ26dOkWZ2wXi25h1s2PmIugMzosru15rCwXAV5
	 INr3zszbB9LmXr9zVZmfwiREwi+mrwdnaZzvF7+3cIzorgGH15iThYGKfPLpZ62UVT
	 af0uiujK6nL4w==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TMBKv11s7z9rxG;
	Fri, 26 Jan 2024 22:54:10 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [meta-networking][PATCH] scapy: Add difftools and logutils in RDEPENDS
Date: Fri, 26 Jan 2024 21:53:54 +0000
Message-Id: <20240126215354.2032441-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 21:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108476

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

When adding scapy to core-image-base from poky those dependecies were
missing causing scapys start to fail.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.5.0.=
bb b/meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb
index 4858e4e57..d99d7016b 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb
+++ b/meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb
@@ -38,4 +38,5 @@ do_install_ptest() {
=20
 RDEPENDS:${PN} =3D "tcpdump ${PYTHON_PN}-compression ${PYTHON_PN}-crypto=
graphy ${PYTHON_PN}-netclient  \
                   ${PYTHON_PN}-netserver ${PYTHON_PN}-pydoc ${PYTHON_PN}=
-pkgutil ${PYTHON_PN}-shell \
-                  ${PYTHON_PN}-threading ${PYTHON_PN}-numbers ${PYTHON_P=
N}-fcntl"
+                  ${PYTHON_PN}-threading ${PYTHON_PN}-numbers ${PYTHON_P=
N}-fcntl ${PYTHON_PN}-logging \
+                  ${PYTHON_PN}-difflib"
--=20
2.39.2


