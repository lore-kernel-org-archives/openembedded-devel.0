Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.52])
 by mx.groups.io with SMTP id smtpd.web11.31511.1612762439554591203
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 21:34:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=nJQLxPHN;
 spf=pass (domain: kpit.com, ip: 40.107.138.52, mailfrom: harpritkaur.bhandari@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZEqOex831rl/wL+qqIlLiO9uzUW845B511nVQAnL2+RzDAXWKZ12lnT3omQNFCmoWj62wr0uVbVv/ITwqiOsvBlM0ao8oy4BtkhSyjyqsEhU29l+ii7dBBO/lzq8kDuwJJPThPmHRyZYoBpzMXdMNACJbqyzqS8O64FZf9LNxxldBbibhd+rf2j4R1n7vGhXjO4YfBBTnjY3uUedUDLR/2WlfZ2nceQP1EqxtLvytVUK/jP3mMf8aBTvG7UUUkDFjlvPV5MKjyp9C+GW/dIFCCVc3X11KQu+USsuE7aU+DBXcyJ3Pm7OpNWCnUrzEVlliok29u/VmcPTuwUl8zJEow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rGRGJg/BkoL3SkfJuAbf4yedoQ3nTG5YGlNXs/8XmY=;
 b=XdY8C3fU6eZlchPvZ+P2iQ2SBpXullXvmBPk7nVBykg/i0iHInL0FCcwjjqlZkP3k1kS5Gxrn2Y3R+kXd/X/M3svDTDzELsFZ+lk4EvzzIVYzM6eP5nDT2+1bcHatAHV7GWqF3tnybWkVF81gkzi2Z0rdl9rz7RvV4KCh7/npyVobPj9OY/5a8AJB+LZow5M2adX5acyoN8ziIONzSBbEDagxe31KZVv74mt00R3SLFMrtjaypDDz3npA3o45HvyaFZ3jogxmhClK2hnyEr3ndcsU/KSkIkz8BREQzLTchkAYoEGg9rl9jQYuqzz/eTTrmjRIWDUDwo7G3lQXuUWMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rGRGJg/BkoL3SkfJuAbf4yedoQ3nTG5YGlNXs/8XmY=;
 b=nJQLxPHNDZgyjkRBstRwhMDB9IH896fKm5T7VnclGFTO6OjnVcDMbt08O/jJQ+6AxXFICYuCqJv0hkPZ29L7Gc9bagMsM3oMQYg6bfSSQ1idtHQqPgpob3bOOJcUGJnWkQ0fZP2L9gcCrLoFC/aa8XQeCI5in4R39rmAWPPXXkU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:16::13)
 by PN1PR01MB0829.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Mon, 8 Feb
 2021 05:33:53 +0000
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9d4e:7536:7e00:3cd1]) by PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9d4e:7536:7e00:3cd1%7]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 05:33:53 +0000
From: "Harpritkaur Bhandari" <harpritkaur.bhandari@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	aditya.tayade@kpit.com,
	Harpritkaur Bhandari <harpritkaur.bhandari@kpit.com>
Subject: [meta-oe][dunfell][PATCH] rapidjson: Remove unwanted patches
Date: Mon,  8 Feb 2021 11:03:37 +0530
Message-Id: <1612762417-13302-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [1.186.38.155]
X-ClientProxiedBy: BM1PR01CA0106.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::22)
 To PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:16::13)
Return-Path: Harpritkaur.Bhandari@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (1.186.38.155) by BM1PR01CA0106.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3825.19 via Frontend Transport; Mon, 8 Feb 2021 05:33:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 36ea014c-76b4-4d25-459d-08d8cbf31ebb
X-MS-TrafficTypeDiagnostic: PN1PR01MB0829:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN1PR01MB082935434B0C36B5525A21D4EF8F9@PN1PR01MB0829.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3VF5IhBPOmU5e2WZRYbfrby2XBIw0oGvJ7J/xLlDtbRqkhRJd5YqUtO2yKFXkRQjcBaIhsqQML70ipl5HcTrM4T3pB39r0AhIy8IQeo+347jimgEzOfmXE0u0rAHAAfnvOk70xOaUfazdfz8a75DpI2bCv9xZUBuCUmbHo9f1v629x6tsaWYneRcueR18a/6kIpNYhwkC7Zxycbwj/C/YXrAl9kNSWpq8eocKfXFXKg3rorlxwVzc/QPx7taXdimVmsLm2aWW7w5zQuw0JMAFf82Liy/mo6xQzeNlDoPB2LQjBGCTW8mfiLmtGd7cwRsy0NIWLW9gIiOOchRfBbR+iRgRx5R6o2YLLeydq4OowTTak+bPGTpn0xs44hcPsGnR5Nz78mnpItIENwwnipIMS6fDyIjYPoTIRUF5JI+kbxmXMeoXwlLvP3FSGbzkR6Oav1B+dMbwCbVG+XgUffaGYbHYkub6baUyYuwjOj598mvO/f5X59Ib2GtLF+uQH6q4XNudQx+hn1AIfinunkepNhKBbP5hBAJYbSx4idgU/l70ojP4ZPP5T5GFj1r1t+PpjpBbNpD97JZQN33ZN+HtaBCDvnKUFToVVFo24b71QBSUYPDVbsCgdn6YcjHJdxLg0P45eGuNgFJcGoSN1IE03uLSE94wMLNw+5OowB318xmqM/8ZochAGBayE1szztzw5swLprN0xhsANLYsE7aFA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39850400004)(52116002)(69590400011)(316002)(83380400001)(36756003)(66574015)(86362001)(6506007)(55236004)(8676002)(478600001)(8936002)(1006002)(6666004)(956004)(4326008)(16526019)(2906002)(26005)(186003)(107886003)(5660300002)(6486002)(66556008)(66476007)(6512007)(66946007)(2616005)(26123001)(36456004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?6zcuTzwJWu+c9y6jSIfeYlFjq0H8Q35QAS0fmpEJH08PbdVV0sFK4wu3+W7w?=
 =?us-ascii?Q?87waRWOo9MTpe6+pnMm3RcaCIW+LjRJlVbvfwjLdNfZI9JupKl1bBhtlo+Ub?=
 =?us-ascii?Q?Pu6YWijvznDVENxJpPEmGTGWmutYiSnIEnervGsloC1oJvkimPFS+R13/hRl?=
 =?us-ascii?Q?qURYL3EXflLktpy56Z7AZt/9bcSyyx5OSm99r4Z+xgLArkMUoTcjPp2dtifh?=
 =?us-ascii?Q?jE3PyPS9j/Nt3KrevgWlVHyzvlzGS48TDgahWVYDlNPUqdMVs8Luac+XEeD8?=
 =?us-ascii?Q?lytOEJ3OjnDRihRa8XOnq6P+TMJ8KGtgOlcFDi8ozby+i7V6QJvISEsBRl0x?=
 =?us-ascii?Q?m8N1jwu9ZdPWdyuQKZbQy50mPWfew6/iXC4Dugzgum2f7v1B94Kv1ddPFKGe?=
 =?us-ascii?Q?LUmp6MGrjLlk1VWh1QllMGaKYYfA/fZk1I9xMEnf4LB9X2ML+8UX9Mmt14c/?=
 =?us-ascii?Q?qcdg1yRCzUA/EQ1UjULmdjrh9wcsnjOvW9AXko23UhzmhKv5TgSfryGxFH4u?=
 =?us-ascii?Q?hwS+LAK63NZ5GAVmABfdmw4ejFEumkAprou2elHlXn8MaTPzj+peUcSlQC7n?=
 =?us-ascii?Q?N+qYx11OGYaJWujNDQI7IEs5LlJxJ+f5UdgzoHq1uW3rRYoPcTxTbJnqO/bZ?=
 =?us-ascii?Q?8Xhe1d6171/6lMQ+eofMFjtai3BjZYu3oRY9qvHOIE2FD/HWUm/6/v4SA5Dq?=
 =?us-ascii?Q?UW5tsrgsBClJTLTSbGAiTMFWtt7b0CCun0zXxPbb8yAWbgSeDyo4MnirYWsC?=
 =?us-ascii?Q?ZwIlaXwK1HnFnpb56aToTmayaD70vwKwGDRRfMzzd5OsLb3LSdS4bRU6bJ8Y?=
 =?us-ascii?Q?05BLVLJ5WFFLD8RIvhtHtNURBK/u7ekK+mODCYTiZh4pU9JjzU8H1WalZZGT?=
 =?us-ascii?Q?JoSAEx7m5PkRTQkuJI0vra3FbPfnIPUA4wIoE+XDuZomyaC1pfg2gwZ+9FzW?=
 =?us-ascii?Q?xXm+Sc+VdwgMRk9TOJxR86f+3c+kqOJQgB9tw29ZoWFRZadl+QnmgrqJELNI?=
 =?us-ascii?Q?x0NKRWgRvUtcZ9e/f1mNMzVZIN0yhR0OAY4vCi2J/r7yyohMt11LHLgGPhUQ?=
 =?us-ascii?Q?vOb8Hbxqol5Yp+vBlYNG/qj0DjMpb4weAFQ25Va5r0AHM1qRIwwfEFuKR18O?=
 =?us-ascii?Q?oGmWMQyz2wOW4J5oad7NygkYymPTRHNrzhcTdbtRxq/XY+7MQ/xuquPjLH7B?=
 =?us-ascii?Q?8/ef67LLU6+xK5vTnWZXZznboRxmEqZGZ2Cqji7YBexcPct0gyEr1MOOaRl+?=
 =?us-ascii?Q?H1/Xv4/xqHpTkl9gDmyKlkwRPjdIf3jt2z6lrVjRuu7NMxluWyVPwpzXFYp2?=
 =?us-ascii?Q?XRhFPfJjAWBDVsWoe3QgHXT0?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36ea014c-76b4-4d25-459d-08d8cbf31ebb
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 05:33:52.8017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ySDkOXC4j20bLsF/U3xX2jUTEKoEZsaCwt1Kd3YqqT3dZqfYDkX/s5ebw8f0oVMeROSTGbXgvo/2no5KcQEzwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PR01MB0829
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

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
