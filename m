Return-Path: <alistair@alistair23.me>
X-Greylist: delayed 17939 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 16 Apr 2019 10:30:47 UTC
Received: from APC01-PU1-obe.outbound.protection.outlook.com
	(mail-oln040092254020.outbound.protection.outlook.com [40.92.254.20])
	by mail.openembedded.org (Postfix) with ESMTP id 980457D8CE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2019 10:30:47 +0000 (UTC)
Received: from PU1APC01FT020.eop-APC01.prod.protection.outlook.com
	(10.152.252.55) by PU1APC01HT126.eop-APC01.prod.protection.outlook.com
	(10.152.253.76) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1771.16;
	Tue, 16 Apr 2019 04:00:49 +0000
Received: from PSXP216MB0277.KORP216.PROD.OUTLOOK.COM (10.152.252.58) by
	PU1APC01FT020.mail.protection.outlook.com (10.152.252.217) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.1771.16 via Frontend Transport; Tue, 16 Apr 2019 04:00:49 +0000
Received: from PSXP216MB0277.KORP216.PROD.OUTLOOK.COM
	([fe80::a9fb:86c9:a1ef:59ec]) by PSXP216MB0277.KORP216.PROD.OUTLOOK.COM
	([fe80::a9fb:86c9:a1ef:59ec%5]) with mapi id 15.20.1792.020;
	Tue, 16 Apr 2019 04:00:49 +0000
From: Alistair Francis <alistair@alistair23.me>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH] u-boot: Fix missing Python.h build failure
Thread-Index: AQHU9Aj6u5WUPnoorUyOYJY0EozqlA==
Date: Tue, 16 Apr 2019 04:00:49 +0000
Message-ID: <PSXP216MB02777C55F909552A664FC2D6DD240@PSXP216MB0277.KORP216.PROD.OUTLOOK.COM>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0037.namprd02.prod.outlook.com
	(2603:10b6:a03:54::14) To PSXP216MB0277.KORP216.PROD.OUTLOOK.COM
	(2603:1096:300:a::18)
x-incomingtopheadermarker: OriginalChecksum:494216C83E68D07B956F29028080F14DDA911B406A1C089AD3C42591D8637A91;
	UpperCasedChecksum:408F76611B525E3955A5C10255FF7EC9E5973402477DF75F648A698A2CD1A296;
	SizeAsReceived:7451; Count:48
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-tmn: [cTSC/QaB+Jnp60IidBZ1bhRa4WLjEJwApzjL0K9pj8uL398/eC0ruJSl2ce9n25u]
x-microsoft-original-message-id: <20190416040035.17741-1-alistair@alistair23.me>
x-ms-publictraffictype: Email
x-incomingheadercount: 48
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031323274)(2017031324274)(2017031322404)(1601125500)(1603101475)(1701031045);
	SRVR:PU1APC01HT126; 
x-ms-traffictypediagnostic: PU1APC01HT126:
x-microsoft-antispam-message-info: ql3HNPEbyFJcUnM74Jx0jgQaR7e9tmJKMd/FymOn8MhWMoYC5bz6Z25Nwgga9GvoP+uuPV2E6S6coi3fFvWXdHFHhN3JnkrmJkL2owFlyU+OJhDMwDnyWf1Eyxek1bFbGJQGDFw5p3XpXVoUeTszC4NKvMWeX4jf89E0d0/lnk8PG5RmwEnU0MzlPPzt3eSP
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 01368085-5aa3-4fcf-04f8-08d6c2201c59
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2019 04:00:49.4305 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT126
Subject: [PATCH] u-boot: Fix missing Python.h build failure
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
X-List-Received-Date: Tue, 16 Apr 2019 10:30:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 ...rt-pylibfdt-Use-Python-2-in-Makefile.patch | 37 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  4 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-Revert-pylibfdt-Use-=
Python-2-in-Makefile.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-Revert-pylibfdt-Use-Python-=
2-in-Makefile.patch b/meta/recipes-bsp/u-boot/files/0001-Revert-pylibfdt-Us=
e-Python-2-in-Makefile.patch
new file mode 100644
index 0000000000..a7c934d49e
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-Revert-pylibfdt-Use-Python-2-in-Ma=
kefile.patch
@@ -0,0 +1,37 @@
+From 30f41eae3d7a3d07e1d62b98d11430d5b2d24513 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair@alistair23.me>
+Date: Sat, 13 Apr 2019 13:41:58 -0700
+Subject: [PATCH] Revert "pylibfdt: Use Python 2 in Makefile"
+
+This reverts commit 03e6151d5bb42fd055e9c1e571440359bd5b5282.
+
+Revert the patch to avoid:
+| scripts/dtc/pylibfdt/libfdt_wrap.c:149:11: fatal error: Python.h: No suc=
h file or directory
+|  # include <Python.h>
+|            ^~~~~~~~~~
+| compilation terminated.
+
+errors when buildling u-boot in OE.
+
+Signed-off-by: Alistair Francis <alistair@alistair23.me>
+Upstream-Status: Inappropriate [configuration]
+---
+ scripts/dtc/pylibfdt/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/dtc/pylibfdt/Makefile b/scripts/dtc/pylibfdt/Makefile
+index 15e66ad44d..c769d7db06 100644
+--- a/scripts/dtc/pylibfdt/Makefile
++++ b/scripts/dtc/pylibfdt/Makefile
+@@ -21,7 +21,7 @@ quiet_cmd_pymod =3D PYMOD   $@
+ 		CPPFLAGS=3D"$(HOSTCFLAGS) -I$(LIBFDT_srcdir)" OBJDIR=3D$(obj) \
+ 		SOURCES=3D"$(PYLIBFDT_srcs)" \
+ 		SWIG_OPTS=3D"-I$(LIBFDT_srcdir) -I$(LIBFDT_srcdir)/.." \
+-		$(PYTHON2) $< --quiet build_ext --inplace
++		$(PYTHON) $< --quiet build_ext --inplace
+=20
+ $(obj)/_libfdt.so: $(src)/setup.py $(PYLIBFDT_srcs) FORCE
+ 	$(call if_changed,pymod)
+--=20
+2.20.1
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u=
-boot/u-boot-common.inc
index a0212e1b6b..5e81cabdbd 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -10,6 +10,8 @@ PE =3D "1"
 # repo during parse
 SRCREV =3D "3c99166441bf3ea325af2da83cfe65430b49c066"
=20
-SRC_URI =3D "git://git.denx.de/u-boot.git"
+SRC_URI =3D "git://git.denx.de/u-boot.git \
+           file://0001-Revert-pylibfdt-Use-Python-2-in-Makefile.patch \
+          "
=20
 S =3D "${WORKDIR}/git"
--=20
2.20.1


