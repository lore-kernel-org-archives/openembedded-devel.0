Received: from mailout04.rmx.de (mailout04.rmx.de [94.199.90.94])
 by mx.groups.io with SMTP id smtpd.web10.1528.1591684396975300535
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2020 23:33:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.90.94, mailfrom: ceggers@arri.de)
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout04.rmx.de (Postfix) with ESMTPS id 49h0gF1ZX5z3qgrb
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2020 08:33:13 +0200 (CEST)
Received: from ppmail.arri.de (unknown [217.111.95.7])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by kdin01.retarus.com (Postfix) with ESMTPS id 49h0g22TkZz2xcC
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2020 08:33:02 +0200 (CEST)
Received: from mta.arri.de ([192.168.100.141]) by ppmail.arri.de over TLS secured channel with Microsoft SMTPSVC(7.0.6002.18264);
	 Tue, 9 Jun 2020 08:32:39 +0200
Received: from N95HX1G2.wgnetz.xx (192.168.54.29) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Tue, 9 Jun
 2020 08:32:39 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-oe][PATCH 3/4] gd: Extend for native and nativesdk
Date: Tue, 9 Jun 2020 08:32:11 +0200
Message-ID: <20200609063212.3788-4-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200609063212.3788-1-ceggers@arri.de>
References: <20200609063212.3788-1-ceggers@arri.de>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.29]
X-OriginalArrivalTime: 09 Jun 2020 06:32:39.0551 (UTC) FILETIME=[C5B330F0:01D63E27]
X-RMX-ID: 20200609-083306-49h0g22TkZz2xcC-0@kdin01
X-RMX-SOURCE: 217.111.95.7
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

gd is required for msgcgen which is often used together with doxygen.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta-oe/recipes-support/gd/gd_2.3.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/gd/gd_2.3.0.bb b/meta-oe/recipes-sup=
port/gd/gd_2.3.0.bb
index eec8a05ae..554e07fd3 100644
--- a/meta-oe/recipes-support/gd/gd_2.3.0.bb
+++ b/meta-oe/recipes-support/gd/gd_2.3.0.bb
@@ -35,7 +35,7 @@ EXTRA_OEMAKE =3D 'LDFLAGS=3D"${LDFLAGS}"'
=20
 DEBUG_OPTIMIZATION_append =3D " -Wno-error=3Dmaybe-uninitialized"
=20
-do_install_append() {
+do_install_append_class-target() {
     # cleanup buildpaths from gdlib.pc
     sed -i -e 's#${STAGING_DIR_HOST}##g' ${D}${libdir}/pkgconfig/gdlib.p=
c
 }
@@ -50,3 +50,5 @@ RPROVIDES_${PN}-tools =3D "${PN}-tools"
 RDEPENDS_${PN}-tools =3D "perl perl-module-strict"
=20
 CVE_PRODUCT =3D "libgd"
+
+BBCLASSEXTEND =3D "native nativesdk"
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

