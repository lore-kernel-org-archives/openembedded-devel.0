Received: from mailout06.rmx.de (mailout06.rmx.de [94.199.90.92])
 by mx.groups.io with SMTP id smtpd.web10.7628.1594976217382664882
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jul 2020 01:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.90.92, mailfrom: ceggers@arri.de)
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout06.rmx.de (Postfix) with ESMTPS id 4B7Q3R4BGjz9wDB
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2020 10:56:51 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by kdin01.retarus.com (Postfix) with ESMTPS id 4B7Q3J6JgWz2xb5
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2020 10:56:44 +0200 (CEST)
Received: from N95HX1G2.wgnetz.xx (192.168.54.104) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Fri, 17 Jul
 2020 10:55:38 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-oe][PATCH] networkmanager: Package nmcli separately
Date: Fri, 17 Jul 2020 10:55:21 +0200
Message-ID: <20200717085521.24853-1-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [192.168.54.104]
X-RMX-ID: 20200717-105646-4B7Q3J6JgWz2xb5-0@kdin01
X-RMX-SOURCE: 217.111.95.66
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

nmcli depends on libreadline which is licensed under GPLv3.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 .../networkmanager/networkmanager_1.22.14.bb             | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager_1.22.14.bb b/meta-networking/recipes-connectivity/networkmanager/n=
etworkmanager_1.22.14.bb
index 5eb2aefa7..7fc2a6155 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.22.14.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.22.14.bb
@@ -85,6 +85,7 @@ PACKAGECONFIG[qt4-x11-free] =3D "--enable-qt,--disable-=
qt,qt4-x11-free"
 PACKAGECONFIG[cloud-setup] =3D "--with-nm-cloud-setup=3Dyes,--with-nm-cl=
oud-setup=3Dno"
=20
 PACKAGES =3D+ " \
+  ${PN}-nmcli ${PN}-nmcli-doc \
   ${PN}-nmtui ${PN}-nmtui-doc \
   ${PN}-adsl ${PN}-cloud-setup \
 "
@@ -134,6 +135,14 @@ FILES_${PN}-dev +=3D " \
     ${libdir}/NetworkManager/${PV}/*.la \
 "
=20
+FILES_${PN}-nmcli =3D " \
+    ${bindir}/nmcli \
+"
+
+FILES_${PN}-nmcli-doc =3D " \
+    ${mandir}/man1/nmcli* \
+"
+
 FILES_${PN}-nmtui =3D " \
     ${bindir}/nmtui \
     ${bindir}/nmtui-edit \
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

