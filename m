Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.71])
 by mx.groups.io with SMTP id smtpd.web12.3435.1617106022122757000
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Mar 2021 05:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=UQ1P6sqm;
 spf=pass (domain: kpit.com, ip: 40.107.139.71, mailfrom: harpritkaur.bhandari@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ocEgbxg4c+ubAR/Lp5zFf+Re+wodmZbLCxO97dpoMj1DbuSxb6vpmfUOtTSATh3AJCfuT/5jyoDL9hlD2RZ4cvrel9+sUo0SQknK17lTyx0XIftz862yrTn4k7ttKqxNGakEySNSrM2sPfW9yawb3DXOgoOH84zUuVUqV1pG6qRClI0yqlnYVWliqhVRJ+vykYSVo4Vl8SJy9kqhXZ1gVmeKUQGkt5Ts4FdIc/c88ra9C6vzBMI5PWhPglwiOqgL5ul5TGcfsFGoVEKRgKDs/5X5vhujCfkihRFw9JdmQHT+Ze1O8LU9BV9Os/ZuH7bDgkzOf2jRQGmTtnaBQW44cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKKGEKFyiUZ89OO18EJbl+ELy6bZVlDPiP5umQX5uFU=;
 b=OChvTkjD+TvA0V1iApAeJrXnNAnaWlUdXbVWJ/DifccQRXtbWGR0QAhXmMlzSKb3TyBtxbnmeLb0gB5ihUjsYZV4HQXhvOHQHg4DEOKs7snmskE273iRfgRKrIAH11jtHN9g21wPMq0sDrvQgQp10IOIhNyhxjGOP5LgRr5t0aP7G40NSY+KQC3YVoakURtkxxr1KJywExznoUeIGu43zjqasst/wwS5P2A/FkxvAse/xXQIB809of1Xk0Z5V+kv8Ky6oM0jO2E+IDrtHEccNxxqdww0zA2HOvongS/ARH6GBaFcEbQQyFN5AWdW2E3CKLbHcV0GfMekgi97PWRHDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKKGEKFyiUZ89OO18EJbl+ELy6bZVlDPiP5umQX5uFU=;
 b=UQ1P6sqm0hWRcOgiiWEhdjR8bmEOGjp8RZP8tA8YH9QFuHwUbwXYfKoOiHLErlUoaTd0ot3Ll7xiU0+6eq5oCIGD1oUIkSTXuzD0mtgcnin3Rjv4TqKDUZRMuSc+VHwcqygrlOeX7nVvfe1BjnixItJ6YQLVdMToG+PlN/KLU9E=
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:16::13)
 by PN1PR0101MB1375.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:1a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Tue, 30 Mar
 2021 12:06:54 +0000
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::148f:99ca:65bc:1277]) by PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::148f:99ca:65bc:1277%6]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 12:06:53 +0000
From: "Harpritkaur Bhandari" <harpritkaur.bhandari@kpit.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
CC: Nisha Parrakat <Nisha.Parrakat@kpit.com>
Subject: Re: [meta-oe][gatesgarth][PATCH 2/2] rapidjson: Remove unwanted patches
Thread-Topic: [meta-oe][gatesgarth][PATCH 2/2] rapidjson: Remove unwanted
 patches
Thread-Index: AQHXGWdSOU74kTBoP02WwN2QmppbIqqPoLAxgAzmwZ0=
Date: Tue, 30 Mar 2021 12:06:53 +0000
Message-ID: 
 <PN2PR01MB4410638FEC7DD1F273E6524EEF7D9@PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM>
References: 
 <1615790942-1428-1-git-send-email-Harpritkaur.Bhandari@kpit.com>,<1615790942-1428-2-git-send-email-Harpritkaur.Bhandari@kpit.com>,<PN2PR01MB4410D3ED5FE0F0AF900EA55CEF659@PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: 
 <PN2PR01MB4410D3ED5FE0F0AF900EA55CEF659@PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
x-originating-ip: [182.48.232.155]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: dc09d40b-be5d-4c02-a8be-08d8f3744ed8
x-ms-traffictypediagnostic: PN1PR0101MB1375:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <PN1PR0101MB13759366C39DD605DC80102CEF7D9@PN1PR0101MB1375.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 eMtX4q2EGjXr3c17QuiymEfirCc6Zm/UE4J76YjCCFBrLv6TkHvd5d2oaElinTOq0SygLAEmMvsYPz8B0jPQh2ZYOWP1Q/LNZNBUnVh21YIcPBgRCN2rw6N4j9YTcQHXQ95W+U0hPUIVWiWXiGddD7wdViBoYRphqiElfd+eVdnnRKAGKkuJ5XKulNbazlzdFFmbnEMFWvv12m6UxLblq6N+JPT/h+PtgWnC+W+qrfLXTuFky7BJOx5C2L/SFDQG6YYOrJEkDtI5grYWM//SYYs+EGBp0W9pXZ2tbEeGfoE+CGLQ9II6JEP5xQJYiybPGjuj3UaH1SYuAojfJxshGYSzUJTq8KvAI621gaobE69YZ5pzB/cSME1mBrkgqlIUTEl3MWbQeWZVtP2nYtSvGqI4VhrWEaYkf6OfKkmNFwmbB6LDqKEU04H11LZFGFFRDOnuwmzTeXofki3Uy9UVWpgb5EViJ+jH8F9k0ZTQhdRgzZyCxeTayjJ7NFFZCIrbjR4fdam+MUvsZu/7V81s+xIeXX5hVSLOk+c5xnNvBPUlO46rkYltOIT+gX8avpGumJyzknu/2j7DtB7kaTwQo4Vf29KTUS2Tx/8SBo+qW3r0DAiWZZj5ndiTInEfff0RKSc+aZzoIRPjB+ESXx1pDu2EKseT0LaeZtLSuAyOY0s9Xa+yuCUTLVUMrFpLYBwYmHKG5ogRIRTRZ0yvfV1H3CN5CLSlk0JyQH5P7U0WDUZwPtiftZkiXr4w/sZEhRKboHKoQMEscI8GxBYZyZAiVg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(366004)(376002)(346002)(5660300002)(71200400001)(66446008)(76116006)(66946007)(66556008)(2906002)(64756008)(8676002)(55016002)(19627405001)(52536014)(91956017)(26005)(66476007)(66574015)(38100700001)(86362001)(110136005)(33656002)(8936002)(478600001)(6506007)(53546011)(83380400001)(186003)(166002)(107886003)(4326008)(316002)(9686003)(7696005)(26123001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?AuktziXjZqrpJWajIdRqTL0UGpob1ONJutrLzfNpfGoYdtpyePSkMWFAS5?=
 =?iso-8859-1?Q?YvWnvADuvTbVYLzqx5OyPNUFrLZrBvudMoVYZzhxhjV3mLRg4ntqsp2OaK?=
 =?iso-8859-1?Q?JvLGjDk+PhieAQLSbvfKNKMRIINe8WiSeqRusVtxHv30WEzIODCoJ4CBOv?=
 =?iso-8859-1?Q?j4L6MKjFGoQzVHEvIJU0SXjLVk0kDxOmFoBN+CghqF3ekCdthZeMnMys9a?=
 =?iso-8859-1?Q?/fFg/3adbFAPfELBHpwGLVtuwhgGvf2U7GVWlfpkGlW89I9FmgbpESwcBK?=
 =?iso-8859-1?Q?KYYuG6Xxlf92T3e+yrShAwGUR62Dc4T8bflV6QA6dsXxMddHwToSlL9Hr7?=
 =?iso-8859-1?Q?s/m6OiIJkazcmfMucBZDyd33Ir1KgDvd+EeiLPyZBD0yr8CHQS+KA3yV/M?=
 =?iso-8859-1?Q?A6kDImcPx6NDFY1QTgDoEtSaSb40bnMMF5IG+/FO8THkSBAe2dg7FFZi/M?=
 =?iso-8859-1?Q?gqW1GWrSTV1VtgCMYgwXZn5rynqh9lvxveJsIpKXln9CyxngmUI6SJ7l2+?=
 =?iso-8859-1?Q?nb/pw3FhATbM1C6i8mnHz+sjXMWAnLXaM70WiPybZuapyRS8jsH1dMYajm?=
 =?iso-8859-1?Q?ZnhGC/mmTtzCEkPN0RCTSWlVAdzK3FZjxnvXv9MbPi8sZxQvLPYKaTcwFf?=
 =?iso-8859-1?Q?CKhQ05oSYfS0cfdOahwNa/15lXFujNK93wfNXWmwmiSE7kfLKMQgov1QB9?=
 =?iso-8859-1?Q?mvGVScnR0KqH3Ew9RqYzARlWX62BGJXrfI3C52+yGu/jEHYwEdwZxdKP/F?=
 =?iso-8859-1?Q?9qe1xSovS9mm69n8CipjJWmgJm5tjIXfYUV74kmXQik4VHdUDnXEYRCxfc?=
 =?iso-8859-1?Q?FyrYF/rg8+K1n5bGk5fo6SvFDE5QUCCPFELgDWC4hRq+qBqwJDYxfXJEsn?=
 =?iso-8859-1?Q?fkkmm9SQhg+OYT9XAl8743teh0ynM+tMzBnOCERNEP6GxHV+X9bOWdmDu1?=
 =?iso-8859-1?Q?xlI1Im4MZIlDag44bYZC2wqdTbS9x8q5k+9YAZdbpMCQvyUSWQOT0/EvaU?=
 =?iso-8859-1?Q?vC4yYvykOPZacuFraNCe4TJL5/ny8M6hvVMoKxaBXp7ZaBbgmUMQBSSifx?=
 =?iso-8859-1?Q?uDA4tNhwDmbeG2iVz5Jg/RN3iRlmQr1N8rjTN35MbEAdepOhr8pTtE/KRS?=
 =?iso-8859-1?Q?rfKCl+RoS0H28LrZNDIhf6+ILmJ0kro1tEZ2u0g5OoDIc+VjKFY9hYxi2s?=
 =?iso-8859-1?Q?AQd7nu9lQyq2OqQb74gO4WvT3Ha8xUL/fYiu9WDd2U1Xsm0Tb31G+NPJc0?=
 =?iso-8859-1?Q?AMSDsS7Aq2iG4vuSU+Y2CrmqV/ouSq2I0o98WJFA7dAG5wNDEfrn663PcL?=
 =?iso-8859-1?Q?deuEttdp458JQtbSFNJ1an9FHWSeqavBERjFiNj4CsJwxzcPuxJd0TE0Ew?=
 =?iso-8859-1?Q?Nrok7zZ13t?=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dc09d40b-be5d-4c02-a8be-08d8f3744ed8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2021 12:06:53.3619
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +S8QWSkSKYyQrlSpp3cKiJiyrrEjKOA6ph5DtafT45+GvXU/USjUSmW/E3h1W+WoxKtwae8ajlaOX0l5qrCAXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PR0101MB1375
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_PN2PR01MB4410638FEC7DD1F273E6524EEF7D9PN2PR01MB4410INDP_"

--_000_PN2PR01MB4410638FEC7DD1F273E6524EEF7D9PN2PR01MB4410INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Can you please confirm when this patch will get merged in gatesgarth branch=
?

Thanks,
Harprit Bhandari

________________________________
From: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
Sent: 22 March 2021 12:37
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>; raj.khem@gmail.com <raj.khem@gmail.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>
Subject: Re: [meta-oe][gatesgarth][PATCH 2/2] rapidjson: Remove unwanted pa=
tches

Hi,

Can you please confirm when this patch will get merged in gatesgarth branch=
.

Thanks,
Harprit Bhandari

________________________________
From: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
Sent: 15 March 2021 12:19
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>; raj.khem@gmail.com <raj.khem@gmail.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>; Harpritkaur Bhandari <Harprit=
kaur.Bhandari@kpit.com>
Subject: [meta-oe][gatesgarth][PATCH 2/2] rapidjson: Remove unwanted patche=
s

From: Harpritkaur Bhandari <harpritkaur.bhandari@kpit.com>

rapidjson is upgraded to latest SRCREV so
removing the below patches which are not
applicable:
1.0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch
2.remove-march-native-from-CMAKE_CXX_FLAGS.patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5aa127af2d3942c9b1dfcd768a8123513a26c53f)
Signed-off-by: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
---
 ...ve-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch | 36 ------------------=
-
 .../remove-march-native-from-CMAKE_CXX_FLAGS.patch | 40 ------------------=
----
 2 files changed, 76 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake=
-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch
 delete mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/remove-mar=
ch-native-from-CMAKE_CXX_FLAGS.patch

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove=
-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch b/meta-oe/recipes-devtools/ra=
pidjson/rapidjson/0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.=
patch
deleted file mode 100644
index 745f5d0..0000000
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove-hardco=
ded-CMAKECONFIG_INSTALL_DIR-path.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 8d272e53a4d1dc405e08ce2dd50159c58f4451e9 Mon Sep 17 00:00:00 2001
-From: Ruslan Bilovol <rbilovol@cisco.com>
-Date: Thu, 24 Jan 2019 18:11:39 +0200
-Subject: [PATCH] CMake: remove hardcoded CMAKECONFIG_INSTALL_DIR path
-
-Currently this path is hardcoded to lib/cmake.
-Some distributions have different library path (like lib64).
-So reuse LIB_INSTALL_DIR for that to make CMAKECONFIG_INSTALL_DIR
-configurable and usable in such distros.
-
-Upstream-Status: Backport [https://github.com/Tencent/rapidjson/commit/8d2=
72e53a4d1dc405e08ce2dd50159c58f4451e9]
-
-Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
----
- CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7c60407..0275672 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -199,9 +199,9 @@ CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_N=
AME}ConfigVersion.cmake.in
-     ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake @ONLY)
-
- # ... for the install tree
--SET( CMAKECONFIG_INSTALL_DIR lib/cmake/${PROJECT_NAME} )
-+SET( CMAKECONFIG_INSTALL_DIR ${LIB_INSTALL_DIR}/cmake/${PROJECT_NAME} )
- FILE( RELATIVE_PATH REL_INCLUDE_DIR
--    "${CMAKE_INSTALL_PREFIX}/${CMAKECONFIG_INSTALL_DIR}"
-+    "${CMAKECONFIG_INSTALL_DIR}"
-     "${CMAKE_INSTALL_PREFIX}/include" )
-
- SET( ${PROJECT_NAME}_INCLUDE_DIR "\${${PROJECT_NAME}_CMAKE_DIR}/${REL_INC=
LUDE_DIR}" )
---
-1.9.1
-
diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-nati=
ve-from-CMAKE_CXX_FLAGS.patch b/meta-oe/recipes-devtools/rapidjson/rapidjso=
n/remove-march-native-from-CMAKE_CXX_FLAGS.patch
deleted file mode 100644
index cf3e16e..0000000
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-native-from=
-CMAKE_CXX_FLAGS.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 827155e5e659b2a5065b00d701bc59b57feab2bf Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Mon, 19 Dec 2016 01:37:11 -0800
-Subject: [PATCH] remove -march=3Dnative from CMAKE_CXX_FLAGS
-
-Not appropriate when cross compiling.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-Index: git/CMakeLists.txt
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- git.orig/CMakeLists.txt
-+++ git/CMakeLists.txt
-@@ -51,10 +51,10 @@ endif(CCACHE_FOUND)
-
- if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
-     if(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "powerpc" OR ${CMAKE_SYSTEM_PRO=
CESSOR} STREQUAL "ppc64" OR ${CMAKE_SYSTEM_PROCESSOR} STREQUAL "ppc64le")
--      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mcpu=3Dnative")
-+      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
-     else()
-       #FIXME: x86 is -march=3Dnative, but doesn't mean every arch is this=
 option. To keep original project's compatibility, I leave this except POWE=
R.
--      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=3Dnative")
-+      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
-     endif()
-     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror")
-     set(EXTRA_CXX_FLAGS -Weffc++ -Wswitch-default -Wfloat-equal -Wconvers=
ion -Wsign-conversion)
-@@ -84,7 +84,7 @@ elseif (CMAKE_CXX_COMPILER_ID MATCHES "C
-       set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mcpu=3Dnative")
-     else()
-       #FIXME: x86 is -march=3Dnative, but doesn't mean every arch is this=
 option. To keep original project's compatibility, I leave this except POWE=
R.
--      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=3Dnative")
-+      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
-     endif()
-     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror -Wno-mi=
ssing-field-initializers")
-     set(EXTRA_CXX_FLAGS -Weffc++ -Wswitch-default -Wfloat-equal -Wconvers=
ion -Wimplicit-fallthrough -Weverything)
--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_PN2PR01MB4410638FEC7DD1F273E6524EEF7D9PN2PR01MB4410INDP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"margin:0px;font-size:12pt;color:black;background-color:rgb(2=
55, 255, 255)"><span style=3D"margin:0px;font-family:Calibri, Helvetica, sa=
ns-serif">Hi,</span></span>
<div style=3D"margin:0px;font-size:12pt;color:black;background-color:rgb(25=
5, 255, 255)">
<br>
</div>
<div style=3D"margin:0px;font-size:12pt;color:black;background-color:rgb(25=
5, 255, 255)">
<span style=3D"margin:0px;font-family:Calibri, Helvetica, sans-serif">Can y=
ou please confirm when this patch will get merged in&nbsp;</span><span styl=
e=3D"margin:0px;font-family:Calibri, Helvetica, sans-serif;color:rgb(50, 49=
, 48);background-color:rgb(250, 249, 248)"><span data-markjs=3D"true" class=
=3D"markyxnohaa6z" data-ogac=3D"" data-ogab=3D"" data-ogsc=3D"" data-ogsb=
=3D"" style=3D"margin:0px">gatesgarth</span><span>&nbsp;</span>branch?</spa=
n></div>
<div style=3D"margin:0px;font-size:12pt;color:black;background-color:rgb(25=
5, 255, 255)">
<span style=3D"margin:0px;font-size:17px;color:rgb(50, 49, 48);background-c=
olor:rgb(250, 249, 248)"><br>
</span></div>
<div style=3D"margin:0px;font-size:12pt;color:black;background-color:rgb(25=
5, 255, 255)">
<span style=3D"margin:0px;font-family:Calibri, Helvetica, sans-serif;color:=
rgb(50, 49, 48);background-color:rgb(250, 249, 248)">Thanks</span><span sty=
le=3D"margin:0px;font-family:Calibri, Helvetica, sans-serif;color:rgb(50, 4=
9, 48);background-color:rgb(250, 249, 248)">,</span><span style=3D"margin:0=
px;font-size:17px;color:rgb(50, 49, 48);background-color:rgb(250, 249, 248)=
"><br>
</span><span style=3D"margin:0px;font-family:Calibri, Helvetica, sans-serif=
;color:rgb(50, 49, 48);background-color:rgb(250, 249, 248)">Harprit Bhandar=
i</span></div>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Harpritkaur Bhandari =
&lt;Harpritkaur.Bhandari@kpit.com&gt;<br>
<b>Sent:</b> 22 March 2021 12:37<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;; raj.khem@gmail.com &lt;raj.khem@gmail.com&gt;<=
br>
<b>Cc:</b> Nisha Parrakat &lt;Nisha.Parrakat@kpit.com&gt;<br>
<b>Subject:</b> Re: [meta-oe][gatesgarth][PATCH 2/2] rapidjson: Remove unwa=
nted patches</font>
<div>&nbsp;</div>
</div>
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt">Hi=
,</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt">Ca=
n you please confirm when this patch will get merged in&nbsp;</span><span s=
tyle=3D"color:rgb(50,49,48); font-family:Calibri,Helvetica,sans-serif; font=
-size:12pt; background-color:rgb(250,249,248); display:inline!important">ga=
tesgarth
 branch.</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"color:rgb(50,49,48); font-size:17px; background-color:rgb(25=
0,249,248); display:inline!important"><br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"color:rgb(50,49,48); font-family:Calibri,Helvetica,sans-seri=
f; font-size:12pt; background-color:rgb(250,249,248); display:inline!import=
ant">Thanks</span><span style=3D"color:rgb(50,49,48); font-family:Calibri,H=
elvetica,sans-serif; font-size:12pt; background-color:rgb(250,249,248); dis=
play:inline!important">,</span><span style=3D"color:rgb(50,49,48); font-siz=
e:17px; background-color:rgb(250,249,248); display:inline!important"><br>
</span><span style=3D"color:rgb(50,49,48); font-family:Calibri,Helvetica,sa=
ns-serif; font-size:12pt; background-color:rgb(250,249,248); display:inline=
!important">Harprit Bhandari</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"color:rgb(50,49,48); font-size:17px; font-weight:600; backgr=
ound-color:rgb(250,249,248); display:inline!important"><br>
</span></div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Harpritkaur Bhandar=
i &lt;Harpritkaur.Bhandari@kpit.com&gt;<br>
<b>Sent:</b> 15 March 2021 12:19<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;; raj.khem@gmail.com &lt;raj.khem@gmail.com&gt;<=
br>
<b>Cc:</b> Nisha Parrakat &lt;Nisha.Parrakat@kpit.com&gt;; Harpritkaur Bhan=
dari &lt;Harpritkaur.Bhandari@kpit.com&gt;<br>
<b>Subject:</b> [meta-oe][gatesgarth][PATCH 2/2] rapidjson: Remove unwanted=
 patches</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">From: Harpritkaur Bhandari &lt;harpritkaur.bhand=
ari@kpit.com&gt;<br>
<br>
rapidjson is upgraded to latest SRCREV so<br>
removing the below patches which are not<br>
applicable:<br>
1.0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch<br>
2.remove-march-native-from-CMAKE_CXX_FLAGS.patch<br>
<br>
Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
(cherry picked from commit 5aa127af2d3942c9b1dfcd768a8123513a26c53f)<br>
Signed-off-by: Harpritkaur Bhandari &lt;Harpritkaur.Bhandari@kpit.com&gt;<b=
r>
---<br>
&nbsp;...ve-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch | 36 -------------=
------<br>
&nbsp;.../remove-march-native-from-CMAKE_CXX_FLAGS.patch | 40 -------------=
---------<br>
&nbsp;2 files changed, 76 deletions(-)<br>
&nbsp;delete mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/0001-=
CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch<br>
&nbsp;delete mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/remov=
e-march-native-from-CMAKE_CXX_FLAGS.patch<br>
<br>
diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove=
-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch b/meta-oe/recipes-devtools/ra=
pidjson/rapidjson/0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.=
patch<br>
deleted file mode 100644<br>
index 745f5d0..0000000<br>
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-CMake-remove-hardco=
ded-CMAKECONFIG_INSTALL_DIR-path.patch<br>
+++ /dev/null<br>
@@ -1,36 +0,0 @@<br>
-From 8d272e53a4d1dc405e08ce2dd50159c58f4451e9 Mon Sep 17 00:00:00 2001<br>
-From: Ruslan Bilovol &lt;rbilovol@cisco.com&gt;<br>
-Date: Thu, 24 Jan 2019 18:11:39 +0200<br>
-Subject: [PATCH] CMake: remove hardcoded CMAKECONFIG_INSTALL_DIR path<br>
-<br>
-Currently this path is hardcoded to lib/cmake.<br>
-Some distributions have different library path (like lib64).<br>
-So reuse LIB_INSTALL_DIR for that to make CMAKECONFIG_INSTALL_DIR<br>
-configurable and usable in such distros.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/Tencent/rapidjson=
/commit/8d272e53a4d1dc405e08ce2dd50159c58f4451e9">https://github.com/Tencen=
t/rapidjson/commit/8d272e53a4d1dc405e08ce2dd50159c58f4451e9</a>]<br>
-<br>
-Signed-off-by: Ruslan Bilovol &lt;rbilovol@cisco.com&gt;<br>
----<br>
- CMakeLists.txt | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
-index 7c60407..0275672 100644<br>
---- a/CMakeLists.txt<br>
-+++ b/CMakeLists.txt<br>
-@@ -199,9 +199,9 @@ CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_N=
AME}ConfigVersion.cmake.in<br>
-&nbsp;&nbsp;&nbsp;&nbsp; ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config=
Version.cmake @ONLY)<br>
- <br>
- # ... for the install tree<br>
--SET( CMAKECONFIG_INSTALL_DIR lib/cmake/${PROJECT_NAME} )<br>
-+SET( CMAKECONFIG_INSTALL_DIR ${LIB_INSTALL_DIR}/cmake/${PROJECT_NAME} )<b=
r>
- FILE( RELATIVE_PATH REL_INCLUDE_DIR<br>
--&nbsp;&nbsp;&nbsp; &quot;${CMAKE_INSTALL_PREFIX}/${CMAKECONFIG_INSTALL_DI=
R}&quot;<br>
-+&nbsp;&nbsp;&nbsp; &quot;${CMAKECONFIG_INSTALL_DIR}&quot;<br>
-&nbsp;&nbsp;&nbsp;&nbsp; &quot;${CMAKE_INSTALL_PREFIX}/include&quot; )<br>
- <br>
- SET( ${PROJECT_NAME}_INCLUDE_DIR &quot;\${${PROJECT_NAME}_CMAKE_DIR}/${RE=
L_INCLUDE_DIR}&quot; )<br>
--- <br>
-1.9.1<br>
-<br>
diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-nati=
ve-from-CMAKE_CXX_FLAGS.patch b/meta-oe/recipes-devtools/rapidjson/rapidjso=
n/remove-march-native-from-CMAKE_CXX_FLAGS.patch<br>
deleted file mode 100644<br>
index cf3e16e..0000000<br>
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-native-from=
-CMAKE_CXX_FLAGS.patch<br>
+++ /dev/null<br>
@@ -1,40 +0,0 @@<br>
-From 827155e5e659b2a5065b00d701bc59b57feab2bf Mon Sep 17 00:00:00 2001<br>
-From: Andre McCurdy &lt;armccurdy@gmail.com&gt;<br>
-Date: Mon, 19 Dec 2016 01:37:11 -0800<br>
-Subject: [PATCH] remove -march=3Dnative from CMAKE_CXX_FLAGS<br>
-<br>
-Not appropriate when cross compiling.<br>
-<br>
-Upstream-Status: Inappropriate [configuration]<br>
-<br>
-Signed-off-by: Andre McCurdy &lt;armccurdy@gmail.com&gt;<br>
----<br>
- CMakeLists.txt | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-Index: git/CMakeLists.txt<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- git.orig/CMakeLists.txt<br>
-+++ git/CMakeLists.txt<br>
-@@ -51,10 +51,10 @@ endif(CCACHE_FOUND)<br>
- <br>
- if (&quot;${CMAKE_CXX_COMPILER_ID}&quot; STREQUAL &quot;GNU&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp; if(${CMAKE_SYSTEM_PROCESSOR} STREQUAL &quot;power=
pc&quot; OR ${CMAKE_SYSTEM_PROCESSOR} STREQUAL &quot;ppc64&quot; OR ${CMAKE=
_SYSTEM_PROCESSOR} STREQUAL &quot;ppc64le&quot;)<br>
--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX_FLAG=
S} -mcpu=3Dnative&quot;)<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX_FLAG=
S}&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp; else()<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #FIXME: x86 is -march=3Dnative, but d=
oesn't mean every arch is this option. To keep original project's compatibi=
lity, I leave this except POWER.<br>
--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX_FLAG=
S} -march=3Dnative&quot;)<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX_FLAG=
S}&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp; endif()<br>
-&nbsp;&nbsp;&nbsp;&nbsp; set(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX_FLAGS} -Wal=
l -Wextra -Werror&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp; set(EXTRA_CXX_FLAGS -Weffc++ -Wswitch-default -Wf=
loat-equal -Wconversion -Wsign-conversion)<br>
-@@ -84,7 +84,7 @@ elseif (CMAKE_CXX_COMPILER_ID MATCHES &quot;C<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX=
_FLAGS} -mcpu=3Dnative&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp; else()<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #FIXME: x86 is -march=3Dnative, but d=
oesn't mean every arch is this option. To keep original project's compatibi=
lity, I leave this except POWER.<br>
--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX_FLAG=
S} -march=3Dnative&quot;)<br>
-+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX_FLAG=
S}&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp; endif()<br>
-&nbsp;&nbsp;&nbsp;&nbsp; set(CMAKE_CXX_FLAGS &quot;${CMAKE_CXX_FLAGS} -Wal=
l -Wextra -Werror -Wno-missing-field-initializers&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp; set(EXTRA_CXX_FLAGS -Weffc++ -Wswitch-default -Wf=
loat-equal -Wconversion -Wimplicit-fallthrough -Weverything)<br>
-- <br>
2.7.4<br>
<br>
</div>
</span></font></div>
</div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_PN2PR01MB4410638FEC7DD1F273E6524EEF7D9PN2PR01MB4410INDP_--
