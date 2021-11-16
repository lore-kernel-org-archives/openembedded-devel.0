Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B0EAC433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 11:06:54 +0000 (UTC)
Received: from mailout04.rmx.de (mailout04.rmx.de [94.199.90.94])
 by mx.groups.io with SMTP id smtpd.web08.8390.1637060810639483581
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 03:06:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arri.de, ip: 94.199.90.94, mailfrom: ceggers@arri.de)
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout04.rmx.de (Postfix) with ESMTPS id 4Htjtb4Pvlz3qvlw
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 12:06:47 +0100 (CET)
Received: from mta.arri.de (unknown [217.111.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by kdin02.retarus.com (Postfix) with ESMTPS id 4Htjtb1rMmz2TTLM
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 12:06:47 +0100 (CET)
Received: from N95HX1G2.arri.de (192.168.54.108) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 16 Nov
 2021 12:06:46 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-oe][PATCH 1/4] gpsd: remove obsolete files from FILES:${PN}-dev
Date: Tue, 16 Nov 2021 12:06:27 +0100
Message-ID: <20211116110630.12314-1-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.54.108]
X-RMX-ID: 20211116-120647-HjRFJcdRHjXs-0@out02.hq
X-RMX-SOURCE: 217.111.95.66
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Nov 2021 11:06:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93974

Files for pkg-config are installed under ${libdir}/pkg-config which is
already set in bitbake.conf

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb b/meta-oe/rec=
ipes-navigation/gpsd/gpsd_3.23.1.bb
index 8763c68ed722..8b238631ea30 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
@@ -79,8 +79,7 @@ PACKAGES =3D+ "libgps libgpsd python3-pygps gpsd-udev g=
psd-conf gpsd-gpsctl gps-ut
=20
 RPROVIDES:${PN}-dbg +=3D "python-pygps-dbg"
=20
-FILES:${PN}-dev +=3D "${libdir}/pkgconfdir/libgpsd.pc ${libdir}/pkgconfd=
ir/libgps.pc \
-                    ${libdir}/libQgpsmm.prl"
+FILES:${PN}-dev +=3D "${libdir}/libQgpsmm.prl"
=20
 FILES:${PN}-doc +=3D "${datadir}/${BPN}/doc"
=20
--=20
Christian Eggers
Embedded software developer

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsregistern=
ummer: HRA 57918
Persoenlich haftender Gesellschafter: Arnold & Richter Cine Technik GmbH
Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsregistern=
ummer: HRB 54477
Geschaeftsfuehrer: Dr. Michael Neuhaeuser; Stephan Schenk; Walter Traunin=
ger; Markus Zeiler


