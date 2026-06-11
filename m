Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89314CD98C7
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 20:56:26 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56725.1781211382010468399
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2026 13:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=E7NV2M3i;
 spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout08.t-online.de (Postfix) with SMTP id 06860E9AA
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 22:56:20 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.168.237]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wXmRm-4WmaEE0; Thu, 11 Jun 2026 22:56:18 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] cairomm-1.16: fix LIC_FILES_CHECKSUM
Date: Thu, 11 Jun 2026 22:56:07 +0200
Message-ID: <20260611205607.2081431-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611205607.2081431-1-f_l_k@t-online.de>
References: <20260611205607.2081431-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1781211378-637FD9CC-14A094B8/0/0 CLEAN NORMAL
X-TOI-MSGID: aa0f5d86-1e1d-4eb6-9a13-593b02767753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1781211379; i=f_l_k@t-online.de;
	bh=Wyk1VqmanHQa9bUePM/fZoFIXARHRm9POXkeT6UCwyA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=E7NV2M3iv+lsUNoSEQVdRMG8W5cLt0zpkMvZhv4+/m0E6fuoRT98fSeMmD1Y7twKH
	 9GAy9ff17ukBoSyGjirayIbxruPGoDaNH3ljr95igPa2hdBrNdKxRF5tu9l23zs/Af
	 mKSguWG+NVczUwKjyak0y3C3Y7yATLUkaNKJOpg/AswaT4ecuYqdhpRb3kGchowU+h
	 d7l0+ymH/8LXraz6ap40sz6s0UvAEQX2BYbami0NYwrOiKcqCurkQJF4WBb2KLB38T
	 zY0vc9I7r2IvQI70sVA+mrBD1SmgUNFQgNgGSxT/mqfzLw1Cm3686MAyKbfXu5uIZu
	 iiOGnofWCHf9A==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 20:56:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127533

License changed from LGPL-2.0 to LGPL-2.1

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.1.bb b/meta=
-oe/recipes-graphics/cairo/cairomm-1.16_1.18.1.bb
index a02d4b7700..371e085b0c 100644
--- a/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.1.bb
+++ b/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.1.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "C++ bindings for Cairo graphics library"
=20
-LICENSE =3D "LGPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc46bda00ffbb0ba1dac22f8d087f5=
4d9"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4bf661c1e3793e55c8d1051bc5e0a=
e21"
=20
 inherit gnomebase
=20
--=20
2.54.0


