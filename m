Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.42])
 by mx.groups.io with SMTP id smtpd.web10.6973.1612345134832681239
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Feb 2021 01:38:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=FsRlo2Pd;
 spf=pass (domain: kpit.com, ip: 40.107.138.42, mailfrom: harpritkaur.bhandari@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4VowYvY2X0h9dBF3eSdtTrZ3z8/C6FhxXmTwVrPHh4cHEG2zqs24OgczWDCzmb2dA3LjD2pPmW82s5eFwEIIRJ2eTZCCOemsKMjepKhlqgJgC6J7AU7PemJnMFJ5FE4gCjugrDF5oJP3GANoKJET54RboNGU/Ee63uRj6y1KKDcKLGH+cueQFGZoGJ9nOO/li1PL8Srehgbfs8QBPL7tXklD9ECy+hOR8tYZi0k2d8JLQWjjkx7Slj2jmByzWQNQJMIndy2y1ZtRPvUmNiLkTzZvAH7E0BE8xxqjV/e505nvvH2P1pefJjU8u7xN7KI+4FB4sacVXB/D++q7tj45A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUdqEjCtAIrTmMO7y0O2PG71khLnLESXIFG0G9zMiPs=;
 b=bfgCM4prZhNnEW9bRvPWGjVivSuqwY232681fNN0lBu++Sen2ONg6FsdEthVN5Bp6dRuN0uqjuzGRVrtWxB+aBl+3KGrLa8cDktlzsrQwXwBXslJnxmd8fMO3Pn/nNXd1k/84SPs4P6DrZT6Avbq4zGRGqqd8x9MWT1I2BgsMoPReTwifMIBticjfJ9w61Wgv65FWj9oPhtQb0B7KmqnH0fcqR98jXoqYNwa5ir0lG5Qa4VAzFdiQHaqFxNdqwVDfnzUPZsJHE+O8i61v+4vMRPSK55S/81R6ceFBHIVBloVEn4CtJEMHK/j+qLc53BtVMwjvYui3zvCKvRC2xVPQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUdqEjCtAIrTmMO7y0O2PG71khLnLESXIFG0G9zMiPs=;
 b=FsRlo2PdUGb2J0ONGvcm9bRdf9zGrLwI+jvrE8BWnYElctI7w/0F9DH5ahwcvNk1iGBmUoTWkcXVFEfm5tT29Whc7y96F6k5TWkn/4zSpjHfRC9eqy41SiByaAuT5yj00DYHtYoE5wTkWDNt/pn1RQukpR1RJM3bkZcKF2VmZjU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:16::13)
 by PN2PR01MB4297.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19; Wed, 3 Feb 2021 09:38:49 +0000
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9d4e:7536:7e00:3cd1]) by PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9d4e:7536:7e00:3cd1%7]) with mapi id 15.20.3825.020; Wed, 3 Feb 2021
 09:38:48 +0000
From: "Harpritkaur Bhandari" <harpritkaur.bhandari@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	aditya.tayade@kpit.com
Subject: [meta-oe][master][PATCH] rapidjson: Remove unwanted patches
Date: Wed,  3 Feb 2021 15:08:37 +0530
Message-Id: <1612345117-31065-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [1.186.38.155]
X-ClientProxiedBy: PN2PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::22) To PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:16::13)
Return-Path: Harpritkaur.Bhandari@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (1.186.38.155) by PN2PR01CA0107.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:27::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3825.19 via Frontend Transport; Wed, 3 Feb 2021 09:38:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 023879a3-66e0-4b55-d7f0-08d8c8278174
X-MS-TrafficTypeDiagnostic: PN2PR01MB4297:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN2PR01MB4297E087AD3BF0C4CE8113B6EFB49@PN2PR01MB4297.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5IT/nYU576PFvxLGB8JinTKyFnaOH9uKB2bhqAX0ozux2riFq5kDz+hbKr7Qvh/IpkoM85fDCQGfkt5ZymQQ9LiAcxA/bZSFBiHTjk7uHgWFvJeorr90uIR6IXk9innXaZGwQVSgUxM+dTG2oMBYHR4fGs2xVW38BAjKgevflu9zVGVy4aAO5LTmj/SzwYB8+M5BZJiCS0zsrtcgW+PyEVL349PGZlE8OH7/FZG19BHGqB+pfl8dHdYUNkxCDqzRl6wYVEmo7a+MIfe+ITZZ8Ay5ssWUv8S01EZdb+TMb9PWd1Ll2C5eGIX4Sf3NEZ7YN5gC6vWi9hG6LQieAIOmvOtTlKSljRFBkVq1dOHNqjEvZkrDryN9DscvvACP/qay+iBEe0AAISvCi/jsxx4nilLEmFmqeo/3K8L2tg9on9/X8qvPZvglqm5ltXNfCgAX1KdNmLPoq4FRuOznvIFFUXbEaoC9IcQN8Jjo21fVbbJmbaV8ObWH06uhBKsc+4frBmbS5IKjtWj82V+0tstaU8ucmChXU+fCwVyVTzC4dz0VwtZIiLc9tYuBAj5+ciYM5dltGfZCOMC0FIhYCKYeZbgtgrslR9wz1SOr/y8w1WJQ5IPHhE+u6FATFv0wdKhExCjXntfHIQr7BKnZOUPHk+pg1nUuaoUFv8h86zBAglkOpHw8AIQEvzUQNvnDdd0Q9UZxCdEpenAkQ3nqhPHVrw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(956004)(6486002)(66946007)(2616005)(1006002)(6666004)(316002)(478600001)(26005)(36756003)(66574015)(8676002)(16526019)(5660300002)(66476007)(8936002)(107886003)(66556008)(55236004)(4326008)(69590400011)(6506007)(52116002)(83380400001)(2906002)(86362001)(186003)(6512007)(26123001)(36456004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?sT+zhfbQMhADBXAYvLp5dJ2uJhGjoNK8KKTGwPx6MF9IRYXx+cpTPtuMsvHA?=
 =?us-ascii?Q?2vCFJatnqMu/esdID6MqgU/xNTutPoUP/TiLzkaQB2iXZSNwa0/iRkfKnta2?=
 =?us-ascii?Q?v8byNWHPu680bynOY0T/vJqBleSsjUMvrZCXOsgV6Ql6YSM/bxwt/QktXnSD?=
 =?us-ascii?Q?oRZsUYKjitRd9Xi99lKGSwTZGiPvldeEdi3r4vpT5ulRHLPsCQfg1Q4m5Om2?=
 =?us-ascii?Q?YWtkn/ehxO9iYD5rG+4VgPaEk+d5vDVQ11eoHN7NaG0IKsYdGbv2vJkyJRYH?=
 =?us-ascii?Q?s6wAQaLoA218Q3S/YuA1QBKW/LK7VXB4VYlAVwiGEv0VCWhRjmvPhnu1EVoi?=
 =?us-ascii?Q?4aklun5pKqNa2ndBQ/3ixrPVSkgKQBkdt4HV+Kq8BDY2gE8DUjQSJHeuikfU?=
 =?us-ascii?Q?P0PqvaDzXKYg1s8YKRZDaq/fPQbjv52N9M27Hw+AkevQ5okVLNUJkUgj4XaC?=
 =?us-ascii?Q?9/tFRKidKfhigIP/7j/qUE200nXAjOg83NwyjAg1/He1Bqcadl7myQwg481x?=
 =?us-ascii?Q?rg4drO/eh8n3bS9DUtvb18NacRZG1lL6IczfZ/KJUqOk66ykDVwY5SbmQZQe?=
 =?us-ascii?Q?Ts1gFPzNnfEHzhrU02H4BawJJzOdDfAnYck045LeGk/QbyDCzUq2QKIprX8N?=
 =?us-ascii?Q?nS7+2sPHakCBf4WV/H2DyJ3pQ4zD5frAM8I10OslvyUaoxlQUAKyjrrtrHQd?=
 =?us-ascii?Q?T0KbPEvLSWVw1Xs1rYY9P5cMfbh64r5dWplphwkkSr6NkfCBIVmAs575UfZ3?=
 =?us-ascii?Q?PXnHq1+lm28k13jPGlVkH7RgbxoimkeG3iYhGJ0a5XQmJK2FaYZbAC0pqtHX?=
 =?us-ascii?Q?qMOoNhye22Ue05LimDWasWF52S5u9eiKmPBr73wgGqmVOlvVSQyAwF4rCI8X?=
 =?us-ascii?Q?yxcZRocgEYVUayI3sXG0+fdVochZxL2Xwj5N8U9Rm81xT0TfzoyMjR0EfR2w?=
 =?us-ascii?Q?jcYPFpjBw6WwGrjK9Ld5GpTaWYWr8mG0XuIvJ+Z2tCJ838dRULHyjYSVr/Uz?=
 =?us-ascii?Q?8aMa71kFb+PrEYwLlh91mOUaDS9LpMf0Ehz7HkKYSF71xSd81dMSTjGgaD50?=
 =?us-ascii?Q?vXFZaMV1?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 023879a3-66e0-4b55-d7f0-08d8c8278174
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 09:38:47.5805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jg+jTDrOkE0sTUEto+wHKOIR2B5m3QqGLXIFfs9Iv3MNjNdK72F2rDSADpVIPwif2SFrOeWOTIe0C2Ki1fd0yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4297
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

rapidjson is upgraded to latest SRCREV so
removing the below patches which are not
applicable:
1.0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch
2.remove-march-native-from-CMAKE_CXX_FLAGS.patch

Change-Id: I42e789ba2c732c11ff507660d13a1fdb2231c9ad
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
