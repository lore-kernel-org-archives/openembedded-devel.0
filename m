Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 233B410F2849
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 15:50:32 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76562.1774626623113366783
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Mar 2026 08:50:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=DeOYEMad;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout11.t-online.de (Postfix) with SMTP id F2C0A1C456
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 16:49:25 +0100 (CET)
Received: from fedora.fritz.box ([84.154.173.111]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w69R5-1q7qU50; Fri, 27 Mar 2026 16:49:23 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] mypaint-brushes-1.0: remove recipe
Date: Fri, 27 Mar 2026 16:49:17 +0100
Message-ID: <20260327154917.1632994-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1774626564-A4FF6830-D0090601/0/0 CLEAN NORMAL
X-TOI-MSGID: 9a0059fe-5f95-4ad5-8c6f-cd0a32b6d2f7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1774626565; i=f_l_k@t-online.de;
	bh=IbsqNa00ADJUkol9hc8LzNZfL2ApYgQxKYPIXM6EDeE=;
	h=From:To:Subject:Date;
	b=DeOYEMadp09FQgqxEWeqwEkoEZisEOl15Nzfr1EVs7ZGWsoBYFpKXsB9Zg8jRNvja
	 XPvB7ViR5J0s23VTr/g9sjsyiu11WVb+mLsHp0WgW3qpkEjlvyekULSFI6/foGY+gF
	 zgl4YiYG7wpVEOnFv1IeFHoq28WqKy76AKmZMqcDiK0xUtK7Lignni3dsefNzfLGrW
	 kgOhckVb8XewvPIkP11Kus+BWfcMyxy0tANglU2eiDYwH9ZeEqMnecT2lazKMUJJbX
	 KdMaORmfjFsi4lkCdTX/URskdWbUQBJLv1v8iUDYkA/98XjQOPr0oGyTsddAxowyyo
	 V5uu/H3IbW8dw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 15:50:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125791

It was only required for gimp, which now uses mypaint-brushes v2

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb   | 11 -----------
 1 file changed, 11 deletions(-)
 delete mode 100644 meta-gnome/recipes-gimp/mypaint/mypaint-brushes-1.0_g=
it.bb

diff --git a/meta-gnome/recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb b=
/meta-gnome/recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb
deleted file mode 100644
index b6b8ff8c1f..0000000000
--- a/meta-gnome/recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY =3D "MyPaint brushes"
-LICENSE =3D "CC0-1.0"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D65d3616852dbf7b1a6d4b53b00626=
032"
-
-inherit autotools allarch
-
-SRC_URI =3D "git://github.com/mypaint/mypaint-brushes.git;protocol=3Dhtt=
ps;branch=3Dv1.3.x"
-SRCREV =3D "8a0124ac0675103eae8fa41fad533851768ae1ce"
-PV =3D "1.3.1"
-
-FILES:${PN} +=3D "${datadir}/mypaint-data"
--=20
2.53.0


