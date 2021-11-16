Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701BDC433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 11:07:15 +0000 (UTC)
Received: from mailout03.rmx.de (mailout03.rmx.de [94.199.88.101])
 by mx.groups.io with SMTP id smtpd.web11.8479.1637060833574174501
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 03:07:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arri.de, ip: 94.199.88.101, mailfrom: ceggers@arri.de)
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout03.rmx.de (Postfix) with ESMTPS id 4Htjv322Cjzljfv
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 12:07:11 +0100 (CET)
Received: from mta.arri.de (unknown [217.111.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by kdin02.retarus.com (Postfix) with ESMTPS id 4Htjv26Lzzz2TSF4
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 12:07:10 +0100 (CET)
Received: from N95HX1G2.arri.de (192.168.54.108) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 16 Nov
 2021 12:07:10 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-oe][PATCH 3/4] gpsd: remove obsolete files from FILES:gps-utils
Date: Tue, 16 Nov 2021 12:06:29 +0100
Message-ID: <20211116110630.12314-3-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211116110630.12314-1-ceggers@arri.de>
References: <20211116110630.12314-1-ceggers@arri.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.54.108]
X-RMX-ID: 20211116-120710-pgmzsfjqJCZR-0@out02.hq
X-RMX-SOURCE: 217.111.95.66
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Nov 2021 11:07:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93976

- ${libdir}/gps/*.py is already packaged by python3-pygps
- no files matches ${libdir}/gps/*.so

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb b/meta-oe/rec=
ipes-navigation/gpsd/gpsd_3.23.1.bb
index 944a515e63b1..01b254ae0dde 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
@@ -102,7 +102,7 @@ FILES:gpsd-gpsctl =3D "${bindir}/gpsctl"
=20
 SUMMARY:gps-utils =3D "Utils used for simulating, monitoring,... a GPS"
 # Python files are required for gps/fake, required for gpsfake.
-FILES:gps-utils =3D "${bindir}/* ${libdir}/gps/*.py ${libdir}/gps/*.so"
+FILES:gps-utils =3D "${bindir}/*"
 RDEPENDS:gps-utils =3D "python3-pygps"
=20
 SUMMARY:python3-pygps =3D "Python bindings to gpsd"
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


