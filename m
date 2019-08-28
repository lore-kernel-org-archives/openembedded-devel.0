Return-Path: <eero.aaltonen@vaisala.com>
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr00072.outbound.protection.outlook.com [40.107.0.72])
	by mail.openembedded.org (Postfix) with ESMTP id 41DC965CF3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 10:34:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=i/SCC3y98U2Pa8sRBOARSSuoSbrYv2SDQLnp0cOHPeA2idOhVo/RHYmQh9lFOMOMl5qhbzTWIiEEoMj8Dt3TuRhYNc1FMj5LBAt+zdHWcX+k/CJCeBLFR1nELa3ZBlP+OkmnQtWBIAhG/H3ffcztlvAtcEpfX/klc/rbCneTJU4DyTg9IgEIdVJZceAAIluR5SENhk2LVisAhleSw9fq5ftTIfFIr9/wLJ0nEzVm/oJBBiAZcpTwFhK/2elxYdM+s3AKwURv445qa5KiVsMtKbyupUZ0zG6czSclpfyUZG27WAO/3dVM4rU8AFR2nBZBamIbxTmr++41W2c+AHfbDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=2nf242xpJL1Wd9ibvl8R/s/3tTcj9rkwv0mkw9DG0sw=;
	b=B+7l11ml9LavXwNqSGFGaU/5HWwrjR0xCWadPMIyXSVrrQK+725rVKOd3fok64nDYZtRZvKJHGtvDruY8yhBsHhEU0Droclc7x/ITrccIpRm/BnlTYH/G9blfHNGZTm1VMyYOkT1p5RcYoDR094r5Rp31uHKGQIX6Urb6CxD+9EgK91KZixdxJLdJ4f1f6uCBd8kTR7ch+e8phgxjMal1KNlHxTYuOgj97YpynvjqFccmrkLu80D2MJbpszKFCLVtkJ1GaL/i3muypru7u7iWKGOpfqGL2GR/M5aSzPzyBePPBx/2XFW5RwA/URjwT9B7s+JHnHslPtEOB6EmgYAcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=vaisala.com;
	dmarc=pass action=none header.from=vaisala.com; 
	dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=2nf242xpJL1Wd9ibvl8R/s/3tTcj9rkwv0mkw9DG0sw=;
	b=bNNSfp//VFbwFaOM9b3jaqzryjAc1/a5SDz/UZpGE+7NZFf61jZWUlI2RpCSd8lnr+AQkMLwVlkTcLsX5TimVe4BPX2YXqNxSlq7/ULz8/fXdi8uqB1PlmwsfW9AFki1zIZUEFnOMr997W466KkSBe4h8+vRmynYf733qiQgwDA=
Received: from HE1PR0602MB3436.eurprd06.prod.outlook.com (52.133.4.143) by
	HE1PR0602MB3610.eurprd06.prod.outlook.com (52.133.5.33) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2199.21; Wed, 28 Aug 2019 10:34:14 +0000
Received: from HE1PR0602MB3436.eurprd06.prod.outlook.com
	([fe80::2cf5:efbc:99a9:dd01]) by
	HE1PR0602MB3436.eurprd06.prod.outlook.com
	([fe80::2cf5:efbc:99a9:dd01%7]) with mapi id 15.20.2199.021;
	Wed, 28 Aug 2019 10:34:14 +0000
From: Aaltonen Eero <eero.aaltonen@vaisala.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH v2 1/1] Recipe for docopt.cpp option parsing
	library
Thread-Index: AQHVXYwj38fOuyDPBESCtt7fpAA3iQ==
Date: Wed, 28 Aug 2019 10:34:14 +0000
Message-ID: <20190828103355.27234-2-eero.aaltonen@vaisala.com>
References: <20190826180437.GA18874@localhost>
	<20190828103355.27234-1-eero.aaltonen@vaisala.com>
In-Reply-To: <20190828103355.27234-1-eero.aaltonen@vaisala.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P190CA0020.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::30)
	To HE1PR0602MB3436.eurprd06.prod.outlook.com
	(2603:10a6:7:89::15)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=eero.aaltonen@vaisala.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [193.143.230.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b6a38f6-4825-4848-1fd9-08d72ba34576
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:HE1PR0602MB3610; 
x-ms-traffictypediagnostic: HE1PR0602MB3610:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <HE1PR0602MB3610E86B0ECD5E648FAE0AA5F5A30@HE1PR0602MB3610.eurprd06.prod.outlook.com>
x-tenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(346002)(396003)(136003)(39860400002)(366004)(189003)(199004)(6486002)(53936002)(25786009)(5640700003)(50226002)(6512007)(26005)(81156014)(1076003)(6436002)(186003)(7736002)(966005)(305945005)(478600001)(3846002)(81166006)(6306002)(5660300002)(2351001)(6116002)(8676002)(8936002)(66066001)(36756003)(66556008)(64756008)(6916009)(316002)(66446008)(66946007)(71200400001)(71190400001)(256004)(19627235002)(2501003)(86362001)(14454004)(66476007)(52116002)(99286004)(486006)(446003)(11346002)(2616005)(6506007)(102836004)(76176011)(2906002)(476003)(386003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0602MB3610;
	H:HE1PR0602MB3436.eurprd06.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vaisala.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: B+ca13vgxgCCpoP7w0pvjFg0JDTBhRzjdUIL5QEn4MFAHK3xd1gLQ3VltqEvXHkifzhXrelg0laHrOZJTcyW+JM7gXF5jzwoe451UUtR+aTk4mTJFna5aFVEJEoI2rici3eiuC4tc3WqJkYKCSdIYIZ0DShRnYX5D3IHbuR2XHVmkEoUi5H3Dt8C7HGcODOWQ7ZqOEaFDhXfHIjD7tMwuA6S136bdzXUcdDQZnzGQkZnl/ZaRszKvcaJyfdZ96B9EPPvcJlB3M8xFyPZbRj7+5/GwSk6TO0swFT+rpytU4ZsoNiPESdOXl6nLJJWsmBO/reQGhA0X7Zl1w1YKE09CqULKWuLEndlpz/c8KvxpTGMAGxDeEB1ssbaWFMWZYCCEj195Eg7UnB4e+rE86TwFif2BqEZkxX9IdwD4BfLOng=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b6a38f6-4825-4848-1fd9-08d72ba34576
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 10:34:14.3486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uK5nns8XUygeCdVgNxv90bdo9vfFLZ3nrQqb4dc4e7KeK2p86Iy1RMnJegw4SJXFiv/2PgaH9rgJVSFoJ7XxpAwbaYxdG7C/SoSFS4ty2cs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB3610
Subject: [meta-oe][PATCH v2 1/1] Recipe for docopt.cpp option parsing library
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
X-List-Received-Date: Wed, 28 Aug 2019 10:34:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Upstream is at
https://github.com/docopt/docopt.cpp/

Installs with a small build modification to pass QA checks.

Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
---
 file                                          |  0
 ...01-Set-library-VERSION-and-SOVERSION.patch | 31 +++++++++++++++++++
 .../docopt.cpp/docopt.cpp_git.bb              | 27 ++++++++++++++++
 3 files changed, 58 insertions(+)
 create mode 100644 file
 create mode 100644 meta-oe/recipes-extended/docopt.cpp/docopt.cpp/0001-Set=
-library-VERSION-and-SOVERSION.patch
 create mode 100644 meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb

diff --git a/file b/file
new file mode 100644
index 000000000..e69de29bb
diff --git a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp/0001-Set-librar=
y-VERSION-and-SOVERSION.patch b/meta-oe/recipes-extended/docopt.cpp/docopt.=
cpp/0001-Set-library-VERSION-and-SOVERSION.patch
new file mode 100644
index 000000000..d4c776569
--- /dev/null
+++ b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp/0001-Set-library-VERSI=
ON-and-SOVERSION.patch
@@ -0,0 +1,31 @@
+From a47ca75702318ff43446c70120f7aacde4ccee1b Mon Sep 17 00:00:00 2001
+From: Eero Aaltonen <eero.aaltonen@vaisala.com>
+Date: Thu, 20 Jun 2019 16:21:20 +0300
+Subject: [PATCH] Set library VERSION and SOVERSION
+
+With soversion and version specified, `install` target will install the
+library with the specified version and also create the proper symlink.
+
+Upstream-Status: Submitted [https://github.com/docopt/docopt.cpp/pull/112]
+but unlikely to be merged soon as it is a duplicate of
+[https://github.com/docopt/docopt.cpp/pull/112] which has been **Open**
+since 2016-12-08.
+---
+ CMakeLists.txt | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 23da468..feff32e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -50,6 +50,10 @@ else()
+     set_target_properties(docopt_o PROPERTIES POSITION_INDEPENDENT_CODE T=
RUE)
+=20
+     add_library(docopt SHARED $<TARGET_OBJECTS:docopt_o>)
++	set_target_properties(docopt PROPERTIES
++		VERSION ${PROJECT_VERSION}
++		SOVERSION ${PROJECT_VERSION_MAJOR}
++		)
+     add_library(docopt_s STATIC $<TARGET_OBJECTS:docopt_o>)
+ endif()
+=20
diff --git a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb b/meta-o=
e/recipes-extended/docopt.cpp/docopt.cpp_git.bb
new file mode 100644
index 000000000..aa55ebf84
--- /dev/null
+++ b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
@@ -0,0 +1,27 @@
+SUMMARY =3D "C++11 port of docopt command-line interface description langu=
age and parser"
+
+DESCRIPTION =3D "docopt is library that lets you define a command line int=
erface with the \
+utility argument syntax that has been used by command line utilities for \
+decades (formalized in POSIX.1-2017). From the description, docopt \
+automatically generates a parser for the command line arguments."
+
+HOMEPAGE =3D "https://github.com/docopt/docopt.cpp"
+
+LICENSE =3D "MIT | BSL-1.0"
+LIC_FILES_CHKSUM =3D "\
+    file://LICENSE-Boost-1.0;md5=3De4224ccaecb14d942c71d31bef20d78c \
+    file://LICENSE-MIT;md5=3D4b242fd9ef20207e18286d73da8a6677 \
+"
+
+DEPENDS =3D "boost"
+SRCREV =3D "3dd23e3280f213bacefdf5fcb04857bf52e90917"
+PV =3D "0.6.2+git${SRCPV}"
+
+SRC_URI =3D "\
+    git://github.com/docopt/docopt.cpp.git;protocol=3Dhttps \
+    file://0001-Set-library-VERSION-and-SOVERSION.patch \
+"
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake
--=20
2.17.1


