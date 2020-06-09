Received: from mailout12.rmx.de (mailout12.rmx.de [94.199.88.78])
 by mx.groups.io with SMTP id smtpd.web11.2322.1591688971051544793
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 00:49:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.88.78, mailfrom: ceggers@arri.de)
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout12.rmx.de (Postfix) with ESMTPS id 49h2MC3vBtzRltP
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2020 09:49:27 +0200 (CEST)
Received: from ppmail.arri.de (unknown [217.111.95.7])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by kdin01.retarus.com (Postfix) with ESMTPS id 49h2M2525yz2xFb
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2020 09:49:18 +0200 (CEST)
Received: from mta.arri.de ([192.168.100.141]) by ppmail.arri.de over TLS secured channel with Microsoft SMTPSVC(7.0.6002.18264);
	 Tue, 9 Jun 2020 09:49:03 +0200
Received: from N95HX1G2.wgnetz.xx (192.168.54.29) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Tue, 9 Jun
 2020 09:49:03 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-oe][PATCH 4/4] mscgen: Extend for native and nativesdk
Date: Tue, 9 Jun 2020 09:48:44 +0200
Message-ID: <20200609074844.6139-5-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200609074844.6139-1-ceggers@arri.de>
References: <20200609074844.6139-1-ceggers@arri.de>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.29]
X-OriginalArrivalTime: 09 Jun 2020 07:49:03.0692 (UTC) FILETIME=[720F98C0:01D63E32]
X-RMX-ID: 20200609-094924-49h2M2525yz2xFb-0@kdin01
X-RMX-SOURCE: 217.111.95.7
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

msgcgen is often used together with doxygen (which is already available
for native/nativesdk).

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta-oe/recipes-support/mscgen/mscgen_0.20.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/mscgen/mscgen_0.20.bb b/meta-oe/reci=
pes-support/mscgen/mscgen_0.20.bb
index 276ad201f..49899edd7 100644
--- a/meta-oe/recipes-support/mscgen/mscgen_0.20.bb
+++ b/meta-oe/recipes-support/mscgen/mscgen_0.20.bb
@@ -16,3 +16,5 @@ inherit autotools gettext
 do_configure_prepend() {
 	sed -i "s#AC_PATH_PROG(GDLIB_CONFIG,gdlib-config)#AC_PATH_PROG([GDLIB_C=
ONFIG],[gdlib-config], ,[${STAGING_BINDIR_CROSS}])#" ${S}/configure.ac
 }
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

