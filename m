Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.4424.1589851900763224974
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 18:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04J1Unc3031778
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 18:31:30 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Mon, 18 May 2020 18:31:10 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 4/4] catfish: 1.4.11 -> 1.4.13
Date: Tue, 19 May 2020 09:30:34 +0800
Message-ID: <20200519013034.37855-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519013034.37855-1-kai.kang@windriver.com>
References: <20200519013034.37855-1-kai.kang@windriver.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 04J1Unc3031778
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Kai Kang <kai.kang@windriver.com>

v1.4.13:
 + General:
   - Optimized svg and png assets
 + Bug Fixes:
   - Fix missing results from symbolic links (Xfce #16318)
   - Do not load catfishconfig during setup as it breaks Debian packaging
 + Translation Updates:
   Bulgarian, Catalan, Chinese (China), Chinese (Taiwan), Croatian, Czech=
,
   Danish, Dutch, French, Galician, German, Hungarian, Interlingue, Itali=
an,
   Japanese, Lithuanian, Norwegian Bokm=C3=A5l, Polish, Portuguese, Russi=
an,
   Spanish, Swedish, Turkish

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../catfish/{catfish_1.4.11.bb =3D> catfish_1.4.13.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/catfish/{catfish_1.4.11.bb =3D> catfish_1.=
4.13.bb} (72%)

diff --git a/meta-xfce/recipes-apps/catfish/catfish_1.4.11.bb b/meta-xfce=
/recipes-apps/catfish/catfish_1.4.13.bb
similarity index 72%
rename from meta-xfce/recipes-apps/catfish/catfish_1.4.11.bb
rename to meta-xfce/recipes-apps/catfish/catfish_1.4.13.bb
index 27b5d5ed4..01a36e1fc 100644
--- a/meta-xfce/recipes-apps/catfish/catfish_1.4.11.bb
+++ b/meta-xfce/recipes-apps/catfish/catfish_1.4.13.bb
@@ -9,8 +9,8 @@ DEPENDS +=3D "python3-distutils-extra-native"
=20
 B =3D "${S}"
=20
-SRC_URI[md5sum] =3D "67e23d45fded026ef3445bc7fe1d1653"
-SRC_URI[sha256sum] =3D "617baf9309e3cdfb20c8357ac786eb26f30e6fd4280d4534=
d3cdd742c7ffcd85"
+SRC_URI[md5sum] =3D "750b65401c9445e185e71c808d7509a4"
+SRC_URI[sha256sum] =3D "58c0ea06e5f286019295545fbfd1dbca23aea74c625762bb=
b4c89a6f484ae839"
=20
 FILES_${PN} +=3D "${datadir}/metainfo"
=20
--=20
2.17.1

