Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F4EBC433EF
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 11:07:05 +0000 (UTC)
Received: from mailout10.rmx.de (mailout10.rmx.de [94.199.88.75])
 by mx.groups.io with SMTP id smtpd.web08.8396.1637060824341132933
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 03:07:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arri.de, ip: 94.199.88.75, mailfrom: ceggers@arri.de)
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout10.rmx.de (Postfix) with ESMTPS id 4Htjts32MFz2ykp
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 12:07:01 +0100 (CET)
Received: from mta.arri.de (unknown [217.111.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by kdin01.retarus.com (Postfix) with ESMTPS id 4Htjts07H5z30jv
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 12:07:01 +0100 (CET)
Received: from N95HX1G2.arri.de (192.168.54.108) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 16 Nov
 2021 12:07:00 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-oe][PATCH 2/4] gpsd: remove obsolete libgpsd package
Date: Tue, 16 Nov 2021 12:06:28 +0100
Message-ID: <20211116110630.12314-2-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211116110630.12314-1-ceggers@arri.de>
References: <20211116110630.12314-1-ceggers@arri.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.54.108]
X-RMX-ID: 20211116-120701-YnFQBgqxczVs-0@out01.hq
X-RMX-SOURCE: 217.111.95.66
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Nov 2021 11:07:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93975

The gpsd project stopped shipping the libgpsd shared library in commmit
901bfe301956 (6 years ago).

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb b/meta-oe/rec=
ipes-navigation/gpsd/gpsd_3.23.1.bb
index 8b238631ea30..944a515e63b1 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
@@ -75,7 +75,7 @@ do_install:append() {
     install -m 755 ${D}${libdir}/gps/*.py ${D}${PYTHON_SITEPACKAGES_DIR}=
/gps
 }
=20
-PACKAGES =3D+ "libgps libgpsd python3-pygps gpsd-udev gpsd-conf gpsd-gps=
ctl gps-utils"
+PACKAGES =3D+ "libgps python3-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-=
utils"
=20
 RPROVIDES:${PN}-dbg +=3D "python-pygps-dbg"
=20
@@ -90,9 +90,6 @@ SUMMARY:gpsd-udev =3D "udev relevant files to use gpsd =
hotplugging"
 FILES:gpsd-udev =3D "${nonarch_base_libdir}/udev"
 RDEPENDS:gpsd-udev +=3D "udev gpsd-conf"
=20
-SUMMARY:libgpsd =3D "C service library used for communicating with gpsd"
-FILES:libgpsd =3D "${libdir}/libgpsd.so.*"
-
 SUMMARY:libgps =3D "C service library used for communicating with gpsd"
 FILES:libgps =3D "${libdir}/libgps.so.*"
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


