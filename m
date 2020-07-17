Received: from mailout08.rmx.de (mailout08.rmx.de [94.199.90.85])
 by mx.groups.io with SMTP id smtpd.web10.7631.1594976227192556991
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jul 2020 01:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.90.85, mailfrom: ceggers@arri.de)
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout08.rmx.de (Postfix) with ESMTPS id 4B7Q3f1Qw9zMpDT
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2020 10:57:02 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by kdin01.retarus.com (Postfix) with ESMTPS id 4B7Q3R45Xbz2xD8
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2020 10:56:51 +0200 (CEST)
Received: from N95HX1G2.wgnetz.xx (192.168.54.104) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Fri, 17 Jul
 2020 10:56:47 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-oe][PATCH] networkmanager: Fix udev dependency
Date: Fri, 17 Jul 2020 10:56:36 +0200
Message-ID: <20200717085636.24944-1-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [192.168.54.104]
X-RMX-ID: 20200717-105655-4B7Q3R45Xbz2xD8-0@kdin01
X-RMX-SOURCE: 217.111.95.66
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

NetworkManager depends on libudev, but not on libgudev.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 .../networkmanager/networkmanager_1.22.14.bb                    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager_1.22.14.bb b/meta-networking/recipes-connectivity/networkmanager/n=
etworkmanager_1.22.14.bb
index 7fc2a6155..4e4217c1f 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.22.14.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.22.14.bb
@@ -11,7 +11,7 @@ DEPENDS =3D " \
     intltool-native \
     libxslt-native \
     libnl \
-    libgudev \
+    udev \
     util-linux \
     libndp \
     libnewt \
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

