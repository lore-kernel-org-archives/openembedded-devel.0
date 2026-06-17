Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627AACD98E4
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 15:26:05 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18079.1781709958678294052
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2026 08:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=tYSe+klC;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout03.t-online.de (Postfix) with SMTP id 537E2E0F4
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 17:25:56 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.174.202]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wZs9L-09CaTx0; Wed, 17 Jun 2026 17:25:55 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] packagegroup-meta-oe.bb: dont add runtime dependency on libdvdread
Date: Wed, 17 Jun 2026 17:25:50 +0200
Message-ID: <20260617152550.37909-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1781709955-627FB8DC-E7EEF0AC/0/0 CLEAN NORMAL
X-TOI-MSGID: ea3f7efd-522e-4a3e-a5aa-bf095fe90630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1781709956; i=f_l_k@t-online.de;
	bh=qtOU9Eqqxlwm67lItdZiDkDDpLknnVs40fIU4NvVaHA=;
	h=From:To:Subject:Date;
	b=tYSe+klCY3z4IvU3AGIM29zirHuQ4rG4QTNAhddKPwU0KmZbSDEzj+L7tkvZzQEXM
	 gbKuUbWv8ndJlpmGwMjkC1fhSgkGi0wxG/3tb9AVuVX6WPAMJ1/3rm17/15AODf1Eq
	 OiusJCJcRHPmP/v/111HAKlwTtEROS0PaCfUhmUZYVy00po32N2yhI3MnSu+yQAsl+
	 PTtkLSLf3xZ/IZiDd1HYQf4jK7JFPqgcVLdFLlGGPnfZzTJU0cJs0/UBja2n4yH+Mb
	 70vNLrrGz/6BmGDkXw4ebpNDZh/nG+BdrnfpL08foXUfWuIv+52dKTBImkbIXLWdJY
	 Ta4HHbK2AR9QA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 15:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127661

libdvdread was moved to meta-multimedia

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 7c2df00207..8cc3e2e844 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -654,7 +654,6 @@ RDEPENDS:packagegroup-meta-oe-multimedia =3D "\
     libass \
     libcdio \
     libcdio-paranoia \
-    libdvdread \
     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "libmad=
", "", d)} \
     libmikmod \
     libmms \
--=20
2.54.0


