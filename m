Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD6FBC25B4E
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 05:43:27 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.8890.1674538997941426537
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jan 2023 21:43:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout09.t-online.de (Postfix) with SMTP id 7687514EB4
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Jan 2023 06:43:16 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.227.201]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pKC5U-0mO3Zx0; Tue, 24 Jan 2023 06:43:16 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] cups-filters: build with dbus support
Date: Tue, 24 Jan 2023 06:43:06 +0100
Message-Id: <20230124054306.11815-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1674538996-B182A007-9DD24381/0/0 CLEAN NORMAL
X-TOI-MSGID: 3b1bebcb-bbf2-42b3-b42f-fa8cd49cc908
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Jan 2023 05:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100715

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-printing/cups/cups-filters.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-printing/cups/cups-filters.inc b/meta-oe/rec=
ipes-printing/cups/cups-filters.inc
index 5952b5a2a..f0f915e94 100644
--- a/meta-oe/recipes-printing/cups/cups-filters.inc
+++ b/meta-oe/recipes-printing/cups/cups-filters.inc
@@ -34,10 +34,10 @@ PACKAGECONFIG[jpeg] =3D "--with-jpeg,--without-jpeg,j=
peg"
 PACKAGECONFIG[png] =3D "--with-png,--without-png,libpng"
 PACKAGECONFIG[tiff] =3D "--with-tiff,--without-tiff,tiff"
=20
-PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf',=
 'avahi', '', d)}"
+PACKAGECONFIG ??=3D "dbus ${@bb.utils.contains('DISTRO_FEATURES', 'zeroc=
onf', 'avahi', '', d)}"
=20
 PACKAGECONFIG[avahi] =3D "--enable-avahi,--disable-avahi,avahi"
-PACKAGECONFIG[dbus] =3D "--enable-dbus,--disable-dbus,dbus"
+PACKAGECONFIG[dbus] =3D "--enable-dbus,--disable-dbus,,dbus"
=20
 DIRFILES =3D "1"
=20
--=20
2.34.1


