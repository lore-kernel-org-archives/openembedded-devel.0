Return-Path: <eero.aaltonen@vaisala.com>
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr10057.outbound.protection.outlook.com [40.107.1.57])
	by mail.openembedded.org (Postfix) with ESMTP id C997F7F284
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2019 10:54:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=nEVUSF8KizWuvgGnEcy9zXw3JgNe1V2wwbqYYJC+DJAxFT7EySzEM3k0Ip/znn6czijkRgO/CHsR8XdVZUJL7aiMZF5lQcQUenEDAJVpkLuSYtNzkc8V36qpNSQjfLh0aDRBr1giMqBT48ZewOcADt5l4n29W8fn5oJ/dPwsK/AYxFLIucZvySRQFkyRv3Ndl8rCY7LYi6ik+CXGSMcAoPNo+LIAyvcFGRWYSum3dHZpaKJl4d5OWtz+nNVQUspA089DZMiBcrnW9GzmJNsYqSazi1tylDt7xbEa+tum3St+EzMWGDZgSYVTHDgiRT4TeNCPa9i8SfBQdD1qyx0auQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Qdv6fdnYDpRWyWpmo0WJkjnOxbUJhb7EAJFHWlut6gc=;
	b=jOkDwwI63qZ7ak2QWJJ/K0CQyTnzF7GNZysKsb/jxTPlDtC8kx+bA4wkHjXH5uaHvqvo/OyVpKZmk6pTf6cf+ZfADv6U95t0UsUhbqhUn6kMzBNBAz6pGnxn4wd9tecnR2jPJiT0lLXAJuLPSyWLXkS4g8sQwsfYVxeqQNYtwTJ5ZGEJOZuLbFNTIWa9s98MLtWDxG7pZxLqgdSs5HC+yDj4eteKLvhLU/seihD7+gxFYIla4PiiTYsgLsgoVt+PYBHW39sSIYMuf6iJ6bNNKytUvyQoHLgryKvDHSBCsIaSuLOVo7msb/8T0vlnfZUHTDume3kdJKWVvO1s+AO8DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=vaisala.com;
	dmarc=pass action=none header.from=vaisala.com; 
	dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Qdv6fdnYDpRWyWpmo0WJkjnOxbUJhb7EAJFHWlut6gc=;
	b=JFZ8e5Eoxna1IaZG6mf0BwCioZvipUNH8WyNt8rRibTOFQr+JD1Y/vPyxecO4O4OiW0ukIDsXf74XZZ1/bkEjnF+ZNA6VIBJxQjP3tdS1HpuH2qzKoW2BYaQaZ3GKzvWY/Z+8c0YxCS8qd5hy9oT8lbvGzVQjkiYoorsbBVUGgU=
Received: from HE1PR0602MB3436.eurprd06.prod.outlook.com (52.133.4.143) by
	HE1PR0602MB2809.eurprd06.prod.outlook.com (10.175.32.23) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2178.16; Fri, 23 Aug 2019 10:54:46 +0000
Received: from HE1PR0602MB3436.eurprd06.prod.outlook.com
	([fe80::2cf5:efbc:99a9:dd01]) by
	HE1PR0602MB3436.eurprd06.prod.outlook.com
	([fe80::2cf5:efbc:99a9:dd01%7]) with mapi id 15.20.2178.020;
	Fri, 23 Aug 2019 10:54:46 +0000
From: Aaltonen Eero <eero.aaltonen@vaisala.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] Recipe for docopt.cpp option parsing library
Thread-Index: AQHVWaEtPmAHeHqTnEGoWqnSUmSmew==
Date: Fri, 23 Aug 2019 10:54:46 +0000
Message-ID: <20190823105345.12430-1-eero.aaltonen@vaisala.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0247.eurprd05.prod.outlook.com
	(2603:10a6:3:fb::23) To HE1PR0602MB3436.eurprd06.prod.outlook.com
	(2603:10a6:7:89::15)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=eero.aaltonen@vaisala.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [193.143.230.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2ac4eb3-c7e2-40ce-b882-08d727b84fb0
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:HE1PR0602MB2809; 
x-ms-traffictypediagnostic: HE1PR0602MB2809:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0602MB28092117D916EEA0F849B76AF5A40@HE1PR0602MB2809.eurprd06.prod.outlook.com>
x-tenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(39860400002)(396003)(346002)(376002)(366004)(199004)(189003)(53936002)(66066001)(25786009)(1076003)(316002)(14454004)(6436002)(6486002)(6506007)(107886003)(386003)(4326008)(2351001)(2501003)(6916009)(486006)(966005)(2616005)(66946007)(26005)(66446008)(64756008)(66556008)(66476007)(476003)(186003)(2906002)(99286004)(36756003)(6306002)(52116002)(305945005)(71190400001)(71200400001)(5640700003)(478600001)(8676002)(256004)(102836004)(19627235002)(5660300002)(81166006)(81156014)(8936002)(86362001)(6116002)(6512007)(7736002)(3846002)(50226002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0602MB2809;
	H:HE1PR0602MB3436.eurprd06.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vaisala.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jTlOFhzeOMhgyTsyZOo6JhGINK/0sGsNMDl79GAFwVygGWDtZbMBZXBLzP+4z8ACVqfGVoM3ed+w7sUYqmIK1b1Cz+7SYBDrPJUFOC5MrZ761iB5tG6Z+9t2Uxy/mxv6gJ8ujPPHmNMN7CkEJ5F6rNqxxkI1wRSexcpJqgoo4jA/FD5tpcgHREXl59u9OhEH0+/6UEgZ7HwH1IPZ8ZfV9Qsv/+5hmQ+VFc9uAa/m+nYmGUlxFzaYreqPEPHuxBMxHjM/3hjK6d7mh4cIYfJlVz9MmbYz9H4ozq5skY7DRmPe4ENi+nMmWbJeM2iW+Y03sh/+T5KyWosqsJdHbNUAnIXD2ohsqYPVqN2jHBs1ONhsWZbNlVIQg6z6el5wrvV3fUGI66AMN+D91Ji9I4lQw4KqrO4rHobFw+um/RFxQFY=
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ac4eb3-c7e2-40ce-b882-08d727b84fb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 10:54:46.2021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T57eHI6osnHlCYBW7iL1Piag/6eH2B2Ke2SRcN23NOMZAc0ktcSfO3NYFWvufga5AK/5o1a+zw9mjYznub0Nr/dZjTVXfX03KAiL3vJ9Oh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB2809
Subject: [meta-oe][PATCH] Recipe for docopt.cpp option parsing library
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
X-List-Received-Date: Fri, 23 Aug 2019 10:54:48 -0000
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
 .../docopt.cpp/docopt.cpp_git.bb              | 29 +++++++++++++++++
 3 files changed, 60 insertions(+)
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
index 000000000..95c60617c
--- /dev/null
+++ b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
@@ -0,0 +1,29 @@
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
+    git://git@github.com/docopt/docopt.cpp.git;protocol=3Dssh \
+    file://0001-Set-library-VERSION-and-SOVERSION.patch \
+"
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake gitpkgv
+
+PKGV =3D "0.6.2+git${GITPKGV}"
--=20
2.17.1


