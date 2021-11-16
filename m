Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77666C433EF
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 11:08:16 +0000 (UTC)
Received: from mailout04.rmx.de (mailout04.rmx.de [94.199.90.94])
 by mx.groups.io with SMTP id smtpd.web11.8487.1637060895029897897
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 03:08:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arri.de, ip: 94.199.90.94, mailfrom: ceggers@arri.de)
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout04.rmx.de (Postfix) with ESMTPS id 4HtjwD55v1z3qlFZ
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 12:08:12 +0100 (CET)
Received: from mta.arri.de (unknown [217.111.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by kdin02.retarus.com (Postfix) with ESMTPS id 4Htjw75thxz2TSDZ
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 12:08:07 +0100 (CET)
Received: from N95HX1G2.arri.de (192.168.54.108) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 16 Nov
 2021 12:07:23 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-oe][PATCH 4/4] gpsd: list files for gps-utils individually
Date: Tue, 16 Nov 2021 12:06:30 +0100
Message-ID: <20211116110630.12314-4-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211116110630.12314-1-ceggers@arri.de>
References: <20211116110630.12314-1-ceggers@arri.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.54.108]
X-RMX-ID: 20211116-120807-QsmBPKwkVbCz-0@out02.hq
X-RMX-SOURCE: 217.111.95.66
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Nov 2021 11:08:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93977

Avoid packaging 'gpsd' and 'gpsdctl' by gps-utils in configurations
where ${bindir}=3D=3D${sbindir} (e.g. nativesdk). Additionally provide
${sbindir} to scons for this case.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 .../recipes-navigation/gpsd/gpsd_3.23.1.bb    | 28 ++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb b/meta-oe/rec=
ipes-navigation/gpsd/gpsd_3.23.1.bb
index 01b254ae0dde..ace907bc0194 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
@@ -34,6 +34,7 @@ EXTRA_OESCONS =3D " \
     nostrip=3D'true' \
     systemd=3D'${SYSTEMD_OESCONS}' \
     libdir=3D'${libdir}' \
+    sbindir=3D'${sbindir}' \
     udevdir=3D'${nonarch_base_libdir}/udev' \
     unitdir=3D'${systemd_system_unitdir}' \
     manbuild=3D'false' \
@@ -102,7 +103,32 @@ FILES:gpsd-gpsctl =3D "${bindir}/gpsctl"
=20
 SUMMARY:gps-utils =3D "Utils used for simulating, monitoring,... a GPS"
 # Python files are required for gps/fake, required for gpsfake.
-FILES:gps-utils =3D "${bindir}/*"
+FILES:gps-utils =3D "\
+    ${bindir}/cgps         \
+    ${bindir}/gegps        \
+    ${bindir}/gps2udp      \
+    ${bindir}/gpscat       \
+    ${bindir}/gpscsv       \
+    ${bindir}/gpsctl       \
+    ${bindir}/gpsdebuginfo \
+    ${bindir}/gpsdecode    \
+    ${bindir}/gpsfake      \
+    ${bindir}/gpsmon       \
+    ${bindir}/gpspipe      \
+    ${bindir}/gpsplot      \
+    ${bindir}/gpsprof      \
+    ${bindir}/gpsrinex     \
+    ${bindir}/gpssnmp      \
+    ${bindir}/gpssubframe  \
+    ${bindir}/gpxlogger    \
+    ${bindir}/lcdgps       \
+    ${bindir}/ntpshmmon    \
+    ${bindir}/ppscheck     \
+    ${bindir}/ubxtool      \
+    ${bindir}/xgps         \
+    ${bindir}/xgpsspeed    \
+    ${bindir}/zerk         \
+"
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


