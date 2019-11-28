Return-Path: <du@axentia.se>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr150132.outbound.protection.outlook.com [40.107.15.132])
	by mail.openembedded.org (Postfix) with ESMTP id 371BD7F9F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2019 12:17:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=B6Q2yg0e4g0J2vIVBvn5ZFcSI8HwMqU05NTcHyfdRMMKIN0Hgm1fNXtqgx4ot4A7o/HuR59kiYXVRjZwlSsKs1AaVJkuReoMDb3lvZ/L6LtZSEznzZbcxFn1yKfN4aAPXf/2T9mt6AgaOZeIUSPZkOYwxrXGQvitGLaxEFNTkwFYKTrFtZSlcVOk/cLofUWnx8s2ehmw1i3LBzoTvmTWewcEyj+kab9YRRy/3Pxs0N2clIpvm/Ozn09bDmz7CopaGgAHWBZTNHiKp5ei3yiCmF8FNXvbmVkxOQ8XxO/fZocWtMrLSlQyntrDgyoP9cujC9yADJpP7xA536B/Rr2idA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=K/g65C4RH0uo5NMg95ZXylpAlMYxISkXTIIXhtq7NY0=;
	b=USG/2TWTK+wsIDDc2pwoqW8dXolMims6Z1e8KWF7IcbQHOBJwO6OnRHiCC1l6DQHKf5qC0VR8nMmMlnoqiSD0ZaWLscQTgVcfV4dpvwJUPCNbIUJ/QF4UuamYDUa/zV8Ol4oKzxogTG1V6vZZro+AvYbp53ZZDIYxeqNV7cXi43M8arEiwjKLERO4CrsKqTy0pPRKE0eAVzW7YNMFlqe1nrlWoNekKF7KpNY4JRwqP9jLe2D4Z82EN8C1b8d9s9PB6Dv9xAtKUC53nsA6EcjoBuZRqWIMXLqvAMWjisc61TFb2f5tH/BMH2MJ4DmegkJY7LujUU0C+GIQ1LqJLJOLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
	dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=K/g65C4RH0uo5NMg95ZXylpAlMYxISkXTIIXhtq7NY0=;
	b=LinendEq+SBMHEqgBBDyUtrgS4OKxkh3YkBdvmITUilRvcUJ02owHX/i7KrOEIuGw1Xrl5aYlScPMd2cLJbgt7agZGakwUAWkZqg1B8iDtE3VgelobmYrXf8M51F7e3oNx80jUcEMCsK4xCFQ32Nd8MVvwU4oUIbc7XOBw2sM3I=
Received: from HE1PR0202MB2714.eurprd02.prod.outlook.com (10.168.189.16) by
	HE1PR0202MB2522.eurprd02.prod.outlook.com (10.168.184.137) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2495.20; Thu, 28 Nov 2019 12:17:53 +0000
Received: from HE1PR0202MB2714.eurprd02.prod.outlook.com
	([fe80::fc30:8b3d:e3b0:60da]) by
	HE1PR0202MB2714.eurprd02.prod.outlook.com
	([fe80::fc30:8b3d:e3b0:60da%8]) with mapi id 15.20.2474.023;
	Thu, 28 Nov 2019 12:17:53 +0000
From: Daniels Umanovskis <du@axentia.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] gattlib: add recipe
Thread-Index: AQHVpeXcvvz9Hypvw0y5C0/dBLuOXQ==
Date: Thu, 28 Nov 2019 12:17:53 +0000
Message-ID: <20191128121733.21335-1-du@axentia.se>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0384.eurprd05.prod.outlook.com
	(2603:10a6:7:94::43) To HE1PR0202MB2714.eurprd02.prod.outlook.com
	(2603:10a6:3:9a::16)
authentication-results: spf=none (sender IP is ) smtp.mailfrom=du@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [87.96.186.165]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 304e5d2b-ef09-4a5d-6564-08d773fcfe82
x-ms-traffictypediagnostic: HE1PR0202MB2522:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0202MB25226B40BDFC0A54D235D3B3BD470@HE1PR0202MB2522.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0235CBE7D0
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(136003)(366004)(39830400003)(346002)(396003)(199004)(189003)(8936002)(4326008)(25786009)(305945005)(2351001)(316002)(5640700003)(8676002)(107886003)(6512007)(66556008)(6436002)(81166006)(14444005)(6486002)(26005)(81156014)(256004)(186003)(50226002)(19627235002)(6916009)(66946007)(3846002)(508600001)(86362001)(6116002)(2501003)(2906002)(102836004)(99286004)(71200400001)(71190400001)(52116002)(66446008)(5660300002)(66476007)(64756008)(2616005)(14454004)(386003)(7736002)(36756003)(1076003)(6506007)(66066001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0202MB2522;
	H:HE1PR0202MB2714.eurprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: axentia.se does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XUe2rOpknn8ddS1jjSKBAsZv5AzzNqShHbkMXLRe6lOKQj2lS9sYuGw4MGUtxlW7t6OztUEXh840Is4pb+Z901Fmc6f5tVC1VJJ6PmyZPYjMofCEUfjebzPU+DoUZNHouOXoKYj9Q1jEr9EVtqwp1si0z9l1GGxShRUgcmlx/2zOTpUpK/cGppdcmuEWUhdcIn81zkBg1pEOJcVZyFMwbMIJ8LHVZ8RgOXjAMrG0JqTSb58HfobyS1rK2oqvoESUTQyQctc85YS9WmuD4x6ye1ymPOZX6CCDax/p/BiR4M9IuRJQsXxcSicQPMugGY0VyraK39bVVWFOXZnzrZnsyJNwoepgKLcNMkn4EvDozqXOqSLvO0Jj0l8A3aVNDR1Iyg1itq4eHtrvAgP0XzXYm9w8HOCZbq/9JpJW0+cO/QZljxcq1cWLCTrnrqDAuUQv
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 304e5d2b-ef09-4a5d-6564-08d773fcfe82
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2019 12:17:53.7324 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gC2qJppyB4jEsmNq5PzTmv4hEBKQYigOAuMxmZ0iS/GhoZ03og2xOGYy39Gr/2Ho
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0202MB2522
Subject: [meta-oe][PATCH] gattlib: add recipe
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
X-List-Received-Date: Thu, 28 Nov 2019 12:17:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

gattlib is a C library for talking to Bluetooth, including BLE,
devices. It's the only free, embedded-appropriate library for
easily scanning BLE devices and subscribing to their notifications

Signed-off-by: Daniels Umanovskis <du@axentia.se>
---
 ...oid-strange-chars-from-the-build-dir.patch | 70 +++++++++++++++++++
 .../gattlib/gattlib_git.bb                    | 30 ++++++++
 2 files changed, 100 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/gattlib/files/dbus-avoid-s=
trange-chars-from-the-build-dir.patch
 create mode 100644 meta-oe/recipes-connectivity/gattlib/gattlib_git.bb

diff --git a/meta-oe/recipes-connectivity/gattlib/files/dbus-avoid-strange-=
chars-from-the-build-dir.patch b/meta-oe/recipes-connectivity/gattlib/files=
/dbus-avoid-strange-chars-from-the-build-dir.patch
new file mode 100644
index 000000000..96e4f8d6f
--- /dev/null
+++ b/meta-oe/recipes-connectivity/gattlib/files/dbus-avoid-strange-chars-f=
rom-the-build-dir.patch
@@ -0,0 +1,70 @@
+From 87df05c3f83c563af76ab00567e7a1ab7a6ebc88 Mon Sep 17 00:00:00 2001
+From: Peter Rosin <peda@axentia.se>
+Date: Sat, 9 Nov 2019 15:42:03 +0100
+Subject: [PATCH] dbus: avoid 'strange' chars from the build dir in #define=
s
+
+gdbus-codegen uses include guards with the full path dir, and if there
+are "bad" characters, such as '+', this fails miserably. E.g. Yocto has a
+tendency to build in directories named from the Yocto package version and
+that package version containing a '+' are not uncommon, and even the
+standard in certain scenarios such as when using ${SRCPV}.
+
+Avoid the problem of the full path "leaking" into the source by avoiding
+the normal include guards and request "#pragma once" instead.
+
+Signed-off-by: Peter Rosin <peda@axentia.se>
+---
+ dbus/CMakeLists.txt | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/dbus/CMakeLists.txt b/dbus/CMakeLists.txt
+index f5096ce10ecd..013c32239e12 100644
+--- a/dbus/CMakeLists.txt
++++ b/dbus/CMakeLists.txt
+@@ -43,37 +43,37 @@ else()
+ endif()
+=20
+ add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/org-bluez-adaptater=
1.c
+-                   COMMAND gdbus-codegen --interface-prefix org.bluez.Ada=
pter1. --generate-c-code ${CMAKE_CURRENT_BINARY_DIR}/org-bluez-adaptater1 $=
{CMAKE_CURRENT_SOURCE_DIR}/${DBUS_BLUEZ_API}/org.bluez.Adapter1.xml
++                   COMMAND gdbus-codegen --pragma-once --interface-prefix=
 org.bluez.Adapter1. --generate-c-code ${CMAKE_CURRENT_BINARY_DIR}/org-blue=
z-adaptater1 ${CMAKE_CURRENT_SOURCE_DIR}/${DBUS_BLUEZ_API}/org.bluez.Adapte=
r1.xml
+                    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${DBUS_BLUEZ_API}/=
org.bluez.Adapter1.xml
+                    COMMENT "Generate D-Bus 'org.bluez.Adapter1.xml'"
+                    )
+=20
+ add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/org-bluez-device1.c
+-                   COMMAND gdbus-codegen --interface-prefix org.bluez.Dev=
ice1. --generate-c-code ${CMAKE_CURRENT_BINARY_DIR}/org-bluez-device1 ${CMA=
KE_CURRENT_SOURCE_DIR}/${DBUS_BLUEZ_API}/org.bluez.Device1.xml
++                   COMMAND gdbus-codegen --pragma-once --interface-prefix=
 org.bluez.Device1. --generate-c-code ${CMAKE_CURRENT_BINARY_DIR}/org-bluez=
-device1 ${CMAKE_CURRENT_SOURCE_DIR}/${DBUS_BLUEZ_API}/org.bluez.Device1.xm=
l
+                    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${DBUS_BLUEZ_API}/=
org.bluez.Device1.xml
+                    COMMENT "Generate D-Bus 'org.bluez.Device1.xml'"
+                    )
+=20
+ add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/org-bluez-gattservi=
ce1.c
+-                   COMMAND gdbus-codegen --interface-prefix org.bluez.Gat=
tService1. --generate-c-code ${CMAKE_CURRENT_BINARY_DIR}/org-bluez-gattserv=
ice1 ${CMAKE_CURRENT_SOURCE_DIR}/${DBUS_BLUEZ_API}/org.bluez.GattService1.x=
ml
++                   COMMAND gdbus-codegen --pragma-once --interface-prefix=
 org.bluez.GattService1. --generate-c-code ${CMAKE_CURRENT_BINARY_DIR}/org-=
bluez-gattservice1 ${CMAKE_CURRENT_SOURCE_DIR}/${DBUS_BLUEZ_API}/org.bluez.=
GattService1.xml
+                    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${DBUS_BLUEZ_API}/=
org.bluez.GattService1.xml
+                    COMMENT "Generate D-Bus 'org.bluez.GattService1.xml'"
+                    )
+=20
+ add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/org-bluez-gattchara=
cteristic1.c
+-                   COMMAND gdbus-codegen --interface-prefix org.bluez.Cha=
racteristic1. --generate-c-code ${CMAKE_CURRENT_BINARY_DIR}/org-bluez-gattc=
haracteristic1 ${CMAKE_CURRENT_SOURCE_DIR}/${DBUS_BLUEZ_API}/org.bluez.Gatt=
Characteristic1.xml
++                   COMMAND gdbus-codegen --pragma-once --interface-prefix=
 org.bluez.Characteristic1. --generate-c-code ${CMAKE_CURRENT_BINARY_DIR}/o=
rg-bluez-gattcharacteristic1 ${CMAKE_CURRENT_SOURCE_DIR}/${DBUS_BLUEZ_API}/=
org.bluez.GattCharacteristic1.xml
+                    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${DBUS_BLUEZ_API}/=
org.bluez.GattCharacteristic1.xml
+                    COMMENT "Generate D-Bus 'org.bluez.GattCharacteristic1=
.xml'"
+                    )
+=20
+ add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/org-bluez-gattdescr=
iptor1.c
+-                   COMMAND gdbus-codegen --interface-prefix org.bluez.Des=
criptor1. --generate-c-code ${CMAKE_CURRENT_BINARY_DIR}/org-bluez-gattdescr=
iptor1 ${CMAKE_CURRENT_SOURCE_DIR}/${DBUS_BLUEZ_API}/org.bluez.GattDescript=
or1.xml
++                   COMMAND gdbus-codegen --pragma-once --interface-prefix=
 org.bluez.Descriptor1. --generate-c-code ${CMAKE_CURRENT_BINARY_DIR}/org-b=
luez-gattdescriptor1 ${CMAKE_CURRENT_SOURCE_DIR}/${DBUS_BLUEZ_API}/org.blue=
z.GattDescriptor1.xml
+                    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${DBUS_BLUEZ_API}/=
org.bluez.GattDescriptor1.xml
+                    COMMENT "Generate D-Bus 'org.bluez.GattDescriptor1.xml=
'"
+                    )
+=20
+ add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/org-bluez-battery1.=
c
+-                   COMMAND gdbus-codegen --interface-prefix org.bluez.Bat=
tery1. --generate-c-code ${CMAKE_CURRENT_BINARY_DIR}/org-bluez-battery1 ${C=
MAKE_CURRENT_SOURCE_DIR}/${DBUS_BLUEZ_API}/org.bluez.Battery1.xml
++                   COMMAND gdbus-codegen --pragma-once --interface-prefix=
 org.bluez.Battery1. --generate-c-code ${CMAKE_CURRENT_BINARY_DIR}/org-blue=
z-battery1 ${CMAKE_CURRENT_SOURCE_DIR}/${DBUS_BLUEZ_API}/org.bluez.Battery1=
.xml
+                    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${DBUS_BLUEZ_API}/=
org.bluez.Battery1.xml
+                    COMMENT "Generate D-Bus 'org.bluez.Battery1.xml'"
+                    )
+--=20
+2.11.0
+
diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb b/meta-oe/=
recipes-connectivity/gattlib/gattlib_git.bb
new file mode 100644
index 000000000..0e6fce9c9
--- /dev/null
+++ b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
@@ -0,0 +1,30 @@
+DESCRIPTION =3D "Bluetooth library with attribute support"
+SECTION =3D "libs/network"
+
+LICENSE =3D "GPLv2+"
+LIC_FILES_CHKSUM =3D "file://CMakeLists.txt;beginline=3D1;endline=3D20;md5=
=3D8d5efeb9189b60866baff80ff791bf00"
+
+DEPENDS =3D "bluez5 glib-2.0"
+DEPENDS +=3D "glib-2.0-native"
+
+PV =3D "0.2+git${SRCPV}"
+
+SRC_URI =3D "git://github.com/labapart/gattlib.git"
+SRC_URI +=3D "file://dbus-avoid-strange-chars-from-the-build-dir.patch"
+
+SRCBRANCH =3D "master"
+SRCREV =3D "c6a33252221dff904cf277e085e2ce70aced8788"
+
+S =3D "${WORKDIR}/git"
+
+PACKAGECONFIG[examples] =3D "-DGATTLIB_BUILD_EXAMPLES=3DON,-DGATTLIB_BUILD=
_EXAMPLES=3DOFF"
+
+# Set this to force use of DBus API if Bluez version is older than 5.42
+PACKAGECONFIG[force-dbus] =3D "-DGATTLIB_FORCE_DBUS=3DTRUE,-DGATTLIB_FORCE=
_DBUS=3DFALSE"
+
+EXTRA_OECMAKE +=3D "-DGATTLIB_BUILD_DOCS=3DOFF"
+
+inherit pkgconfig cmake
+
+FILES_${PN} =3D "${libdir}/* ${includedir}/*"
+FILES_${PN}-dev =3D "${includedir}/*"
--=20
2.20.1


