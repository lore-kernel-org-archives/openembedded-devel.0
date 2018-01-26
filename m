Return-Path: <andrew.goodbody@cambrionix.com>
X-Greylist: delayed 27180 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 26 Jan 2018 17:41:10 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0114.outbound.protection.outlook.com [104.47.2.114])
	by mail.openembedded.org (Postfix) with ESMTP id 55E62787F9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 17:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CambrionixLtd.onmicrosoft.com; s=selector1-cambrionix-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=zZm5Pqmjj8yFUy7se8KiFgtqc6DwbemUhp9BuM53PVs=;
	b=tvXeYOKxKSbsgDJrLNUlpqFzDLPl8mK/hRhz4dEXTXAsuq8DW2wc86v+Nzbz6bLiIq89f8yHt1uLbzHF7EHkC6p4jh1ANySkhSo6DTzWhSBUxQcAbmh8m2ubZA69vWjbSx9TmJ1PidQXEkNyMrg8y9/mBfwZ6nTXrG+DeWtZ76g=
Received: from MMXP123MB1182.GBRP123.PROD.OUTLOOK.COM (10.166.241.15) by
	MMXP123MB1181.GBRP123.PROD.OUTLOOK.COM (10.166.241.14) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.428.17; Fri, 26 Jan 2018 10:08:10 +0000
Received: from MMXP123MB1182.GBRP123.PROD.OUTLOOK.COM ([10.166.241.15]) by
	MMXP123MB1182.GBRP123.PROD.OUTLOOK.COM ([10.166.241.15]) with mapi id
	15.20.0428.024; Fri, 26 Jan 2018 10:08:10 +0000
From: Andrew Goodbody <andrew.goodbody@cambrionix.com>
To: Derek Straka <derek@asterius.io>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-python][PATCH 05/10] Remove deprecated
	${PYTHON_PN}-importlib from the RDEPENDS
Thread-Index: AQHTktQOwHpoPOFPr0+0JuXbXvLx1qOF9P3Q
Date: Fri, 26 Jan 2018 10:08:10 +0000
Message-ID: <MMXP123MB1182908875FBCB83FB09F53085E00@MMXP123MB1182.GBRP123.PROD.OUTLOOK.COM>
References: <1516551637-32255-1-git-send-email-derek@asterius.io>
	<1516551637-32255-6-git-send-email-derek@asterius.io>
In-Reply-To: <1516551637-32255-6-git-send-email-derek@asterius.io>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=andrew.goodbody@cambrionix.com; 
x-originating-ip: [46.17.166.30]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MMXP123MB1181;
	6:Be4uNQnT/6f8Htgecf4f0SDt17EcKQiTk8zWdfIg6EoY8r1NFLIDTNzp2IxAZ+3SrtHEuakwGk1yn3RZzv4UTeBN1oLOhd/tdas/eUZCycym1vyvr8IPV0GKhgepcLcbtq1DOJU8JgbPumzki3ycYuO0EUq2FL2Oo9+LTK16vVTHcKoV7t7R/NzPciZ5j9O45vfBdhLukOAsT/cfQKaTV5Ft0k5fowbbaZiTi9O9vbKFUw2ESNOM2lgTLwS5oVj+ym6P1XZrd7Y6CRVNrhi1i0xEeuN7CAtxNXsbIPHqyAUIP6nzUNUdWB0u8QSRAkKZADx0tiF5sEyvkTWTYqACZsXn8a8IMXNvE03E0Nv60Io9RjoUh0U4IPUTlqrLbsZz;
	5:T6QUy6d++Ynwm/13dwM2y8vJxXNjFrBJkw80+YV4hYzTxE15hUnbEf3Pa2UpUI6NhG2mXBYT0pxXwwEw+x53/i3DmmMxAq1DOoerE5A87qkh6ZzbAGN/BKPy37QatesMIBVEn9f9H9lumH9ZLDugJa4uT2WLgyNlnasjXCDWyQg=;
	24:pWIR00pBuxpzkCUw2hj/IzS4LAYGtWBIVIsIo/tBr8x1hQIz5uGYuJwl9bUIJkjeRG8cKB+r2tlzizHkXrJ0Ejw5xJcqAx6AxeoDslvFiuM=;
	7:AmJpc42rJQoxYZ2pUArTAaS6un/mGUL0h6mwrimsMzwwWuiIUWb0XT5uOIJapcVEDvlj5TFjL7YgooJN70kbi5ziEONahiFr+HyEvNMGD0FgBMVnHWg5bwFCJHtWJa0ZREsh52uFlYVJDy0a+alqEynx7OW67pkxdkcAKP2krlVO0hcYPC1rrsLT6MRM6CyOnMJZPNlVTAEigYSejkyF6ZpZtEY5CN56KC6umNoHrlbSdCtZIcHNlOkuK9MNiq2g
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 8412bbde-d419-46c8-f082-08d564a4b476
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(7021125)(4534165)(7022125)(4603075)(4627221)(201702281549075)(7048125)(7024125)(7027125)(7028125)(7023125)(5600026)(4604075)(3008032)(2017052603307)(7153060)(7193020);
	SRVR:MMXP123MB1181; 
x-ms-traffictypediagnostic: MMXP123MB1181:
x-microsoft-antispam-prvs: <MMXP123MB11819D6D7A16828F5CC8F53985E00@MMXP123MB1181.GBRP123.PROD.OUTLOOK.COM>
x-exchange-antispam-report-test: UriScan:(264703809997249);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(3231069)(2400081)(944501161)(3002001)(10201501046)(93006095)(93001095)(6041288)(20161123562045)(20161123564045)(2016111802025)(20161123560045)(20161123558120)(6072148)(6043046)(201708071742011);
	SRVR:MMXP123MB1181; BCL:0; PCL:0; RULEID:; SRVR:MMXP123MB1181; 
x-forefront-prvs: 05641FD966
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39380400002)(396003)(366004)(346002)(376002)(39830400003)(13464003)(199004)(189003)(102836004)(81156014)(3660700001)(2900100001)(2906002)(81166006)(6436002)(55016002)(77096007)(26005)(105586002)(68736007)(3280700002)(97736004)(229853002)(575784001)(14454004)(7696005)(966005)(2950100002)(106356001)(2501003)(6506007)(74316002)(25786009)(478600001)(86362001)(8936002)(76176011)(53546011)(6116002)(3846002)(305945005)(53936002)(1720100001)(7736002)(9686003)(5660300001)(6306002)(33656002)(6246003)(99286004)(110136005)(66066001)(316002)(186003)(228453006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MMXP123MB1181;
	H:MMXP123MB1182.GBRP123.PROD.OUTLOOK.COM; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: cambrionix.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: s+BkOwUXp+jppOjsaB8A7X3lMAtl/l4fcR76N21oTvor1D6CGXAJSt75TKC6E6AekF0Gh4fWLnZZOqbzDZxRkg==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: cambrionix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8412bbde-d419-46c8-f082-08d564a4b476
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2018 10:08:10.6494 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6eddda96-aa38-44c8-ab83-12529d9cab1f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMXP123MB1181
Subject: Re: [meta-python][PATCH 05/10] Remove deprecated	${PYTHON_PN}-importlib from the RDEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Jan 2018 17:41:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Just wondering what is happening with this patch?

I have a broken build until it is fixed.

Thanks,
Andrew

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Derek Straka
Sent: 21 January 2018 16:21
To: openembedded-devel@lists.openembedded.org
Subject: [oe] [meta-python][PATCH 05/10] Remove deprecated ${PYTHON_PN}-imp=
ortlib from the RDEPENDS

The ${PYTHON_PN}-importlib package was removed as part of the migration to =
the json manifest file.  The functionality is now part of core

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-devtools/python/python-pygobject_3.22.0.bb    | 2 +-
 meta-python/recipes-devtools/python/python-astroid_1.6.0.bb   | 1 -
 meta-python/recipes-devtools/python/python-behave_1.2.5.bb    | 2 +-
 meta-python/recipes-devtools/python/python-can.inc            | 1 -
 meta-python/recipes-devtools/python/python-dbusmock_0.16.7.bb | 1 -
 meta-python/recipes-devtools/python/python-django.inc         | 1 -
 meta-python/recipes-devtools/python/python-pandas_0.22.0.bb   | 1 -
 meta-python/recipes-devtools/python/python-pyroute2.inc       | 1 -
 meta-python/recipes-devtools/python/python-pyserial_3.4.bb    | 2 +-
 9 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.22.0.bb b/m=
eta-oe/recipes-devtools/python/python-pygobject_3.22.0.bb
index 9d2e165..7ddf4e5 100644
--- a/meta-oe/recipes-devtools/python/python-pygobject_3.22.0.bb
+++ b/meta-oe/recipes-devtools/python/python-pygobject_3.22.0.bb
@@ -26,7 +26,7 @@ BBCLASSEXTEND =3D "native"
=20
 EXTRA_OECONF =3D "--disable-cairo --with-python=3D${PYTHON}"
=20
-RDEPENDS_${PN} +=3D "python-setuptools python-importlib"
+RDEPENDS_${PN} +=3D "python-setuptools"
 RDEPENDS_${PN}_class-native =3D ""
=20
 do_install_append() {
diff --git a/meta-python/recipes-devtools/python/python-astroid_1.6.0.bb b/=
meta-python/recipes-devtools/python/python-astroid_1.6.0.bb
index 42208bc..fd98630 100644
--- a/meta-python/recipes-devtools/python/python-astroid_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python-astroid_1.6.0.bb
@@ -4,7 +4,6 @@ require python-astroid.inc  RDEPENDS_${PN}_class-target +=
=3D " \
     ${PYTHON_PN}-enum34 \
     ${PYTHON_PN}-backports-functools-lru-cache \
-    ${PYTHON_PN}-importlib \
     ${PYTHON_PN}-re \
     ${PYTHON_PN}-singledispatch \
 "
diff --git a/meta-python/recipes-devtools/python/python-behave_1.2.5.bb b/m=
eta-python/recipes-devtools/python/python-behave_1.2.5.bb
index 541a79d..3db2016 100644
--- a/meta-python/recipes-devtools/python/python-behave_1.2.5.bb
+++ b/meta-python/recipes-devtools/python/python-behave_1.2.5.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd950439e8ea6ed23=
3e4288f5e1a49c06"
 SRC_URI[md5sum] =3D "3af4bc2886d2be982e41bfaba61da3bc"
 SRC_URI[sha256sum] =3D "81b731ac5187e31e4aad2594944fa914943683a9818320846d=
037c5ebd6d5d0b"
=20
-RDEPENDS_${PN} +=3D "python-difflib python-setuptools python-pkgutil pytho=
n-misc python-argparse python-xml python-importlib python-enum34 python-par=
se python-parse-type python-six"
+RDEPENDS_${PN} +=3D "python-difflib python-setuptools python-pkgutil pytho=
n-misc python-argparse python-xml python-enum34 python-parse python-parse-t=
ype python-six"
=20
 inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-can.inc b/meta-pyth=
on/recipes-devtools/python/python-can.inc
index 8cdd4d3..2b15af4 100644
--- a/meta-python/recipes-devtools/python/python-can.inc
+++ b/meta-python/recipes-devtools/python/python-can.inc
@@ -10,7 +10,6 @@ PYPI_PACKAGE=3D"python-can"
=20
 RDEPENDS_${PN}_class-target +=3D "\
     ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-importlib \
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-netserver \
diff --git a/meta-python/recipes-devtools/python/python-dbusmock_0.16.7.bb =
b/meta-python/recipes-devtools/python/python-dbusmock_0.16.7.bb
index fb8c0aa..ec8c54a 100644
--- a/meta-python/recipes-devtools/python/python-dbusmock_0.16.7.bb
+++ b/meta-python/recipes-devtools/python/python-dbusmock_0.16.7.bb
@@ -20,7 +20,6 @@ inherit pypi setuptools
=20
 RDEPENDS_${PN} +=3D "\
     ${PYTHON_PN}-dbus \
-    ${PYTHON_PN}-importlib \
     ${PYTHON_PN}-pygobject \
     ${PYTHON_PN}-xml \
     "
diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-p=
ython/recipes-devtools/python/python-django.inc
index 9287715..3602a74 100644
--- a/meta-python/recipes-devtools/python/python-django.inc
+++ b/meta-python/recipes-devtools/python/python-django.inc
@@ -19,7 +19,6 @@ RDEPENDS_${PN} +=3D "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-email \
     ${PYTHON_PN}-html \
-    ${PYTHON_PN}-importlib \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-multiprocessing \
     ${PYTHON_PN}-netserver \
diff --git a/meta-python/recipes-devtools/python/python-pandas_0.22.0.bb b/=
meta-python/recipes-devtools/python/python-pandas_0.22.0.bb
index 355074c..b3bfab9 100644
--- a/meta-python/recipes-devtools/python/python-pandas_0.22.0.bb
+++ b/meta-python/recipes-devtools/python/python-pandas_0.22.0.bb
@@ -4,5 +4,4 @@ require python-pandas.inc  RDEPENDS_${PN} +=3D " \
     ${PYTHON_PN}-future \
     ${PYTHON_PN}-json \
-    ${PYTHON_PN}-importlib \
 "
diff --git a/meta-python/recipes-devtools/python/python-pyroute2.inc b/meta=
-python/recipes-devtools/python/python-pyroute2.inc
index f63ccbd..24e3555 100644
--- a/meta-python/recipes-devtools/python/python-pyroute2.inc
+++ b/meta-python/recipes-devtools/python/python-pyroute2.inc
@@ -13,7 +13,6 @@ inherit pypi
 RDEPENDS_${PN} +=3D " \
     ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-distutils \
-    ${PYTHON_PN}-importlib \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-multiprocessing \
diff --git a/meta-python/recipes-devtools/python/python-pyserial_3.4.bb b/m=
eta-python/recipes-devtools/python/python-pyserial_3.4.bb
index 0497087..fd852a2 100644
--- a/meta-python/recipes-devtools/python/python-pyserial_3.4.bb
+++ b/meta-python/recipes-devtools/python/python-pyserial_3.4.bb
@@ -1,4 +1,4 @@
 inherit setuptools
 require python-pyserial.inc
=20
-RDEPENDS_${PN} +=3D "${PYTHON_PN}-argparse ${PYTHON_PN}-importlib"
+RDEPENDS_${PN} +=3D "${PYTHON_PN}-argparse"
--
2.7.4

--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

