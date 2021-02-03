Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.51])
 by mx.groups.io with SMTP id smtpd.web11.7442.1612349425439014244
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Feb 2021 02:50:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=FF90DhXA;
 spf=pass (domain: kpit.com, ip: 40.107.138.51, mailfrom: harpritkaur.bhandari@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KOCZJcBD10L1XAJlQ2HY96qIFdQibs/69lkXxifowTe5fi0JK0qGOjMCfzTUMf1OSqwBfAqKSNEUDhCeYHshwhmd808SQJwwnd0TxlHJ0WQOT6ntoPvCmIObtb7ZclYNclvDNCwXmhnYEKlOfokGq9UWf1T3Cp+KarpPkb4AA4+teh6WVe6Vh6bC6XDFMxR+dOsbuiTqL+7b1OxqFJXz0MKG6s6KD+I6YmuHGcPhle5LrI7umcqSdoCs1An82S56XxdO9jd8jOSEhzNN6IQmeahNA9JjRnsGOw5WsupUFB3HVRch4RdauEDFsxgzzLgpkQ4mnmWr74iW5puev8nFtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVfgBDbjMJ+abiOTfUVp7LP6ESeZDNYg0u6dmxDVU0c=;
 b=lHC4wi8NRzfxJuU6xBUSrs6QBH6zDKL6k9px4IkbYnPxwtWOpApnQka/lb8QDlMCOrg99uRCpYc1wATF2ZuJH/sIWZyuRxRg0Zb8G7j1MFR3EVz0KRbWrcL4/DH0OmiTsFyoLyV1bpBR415HFt7oeSiKoIDTL/3yABWFG3Zx/i3BTZBaRVnOup+txslpWibAcI0kqFFdZOoqFJZoPzKEJFZFq/He7nAILU9hTCqz7VPBeB68BZs8PV9zLOabXsw6ET8Lxlc/NDdEzQChX/4Ne2d2U0wZxfEymSQJ4MI92/NChAFLfFXMadatsubWf/sGHZ5yqL0VS7xUkMLf9HiL6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVfgBDbjMJ+abiOTfUVp7LP6ESeZDNYg0u6dmxDVU0c=;
 b=FF90DhXAMGn4h8txUvN2tILaAObizvsFBAui2AvUVolc8u3ayEO+UIWUPd5tEl+op3x9pqA3A4dmqhBzNwtwfCOBSAWGcHSiMMhCIdr2iEMLIHIddS4cwDdeSTUfUOygLqux20Jb092yUD/SEODODvda5YobejDyGCAeBm0NbwI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:16::13)
 by PN1PR0101MB1134.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:18::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Wed, 3 Feb
 2021 10:50:13 +0000
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9d4e:7536:7e00:3cd1]) by PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9d4e:7536:7e00:3cd1%7]) with mapi id 15.20.3825.020; Wed, 3 Feb 2021
 10:50:13 +0000
From: "Harpritkaur Bhandari" <harpritkaur.bhandari@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	aditya.tayade@kpit.com
Subject: [meta-oe][master][PATCH v1] rapidjson: Remove unwanted patches
Date: Wed,  3 Feb 2021 16:20:05 +0530
Message-Id: <1612349405-4211-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [1.186.38.155]
X-ClientProxiedBy: PN0PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::13) To PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:16::13)
Return-Path: Harpritkaur.Bhandari@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (1.186.38.155) by PN0PR01CA0044.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:49::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3825.19 via Frontend Transport; Wed, 3 Feb 2021 10:50:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 469e0164-4a73-449e-c114-08d8c8317bde
X-MS-TrafficTypeDiagnostic: PN1PR0101MB1134:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN1PR0101MB11348C859B2FEF36D9BEC1B2EFB49@PN1PR0101MB1134.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y3YB3TAe7xwKOyY4snz0rO0miIodIezDxtyMYMwxOA6/eSfGGALzFznBuZhW4LQUYbaqKW7XcKMS5GUbmtWJMwS1xNO5BLAZzWZrqxaXWRpIYnZ0y53Hd1kRZ++p4ack49fFxnXmhLg3zMFFlYhS0wR7yHQxXX2ULOFfeBn6AxD4j4LTbQ/anEW3T+R4pmpI/YaFDq+3l6u5CC7TS4xhtQlscMFf932qxKUS8Zy33ajTn3xqki5CYGoJn8ArjLU0M7hi2cq9ZPZhyg880Vu4+v1wlznbPyhzzYaaQamKxPeWhAbZNjZ2ui+3Nyz+CjR8QyHYsFZ/myjYKpciBXYAoHe+X9ebApcOPMDt2WGfIelncEV3qfhhf+Iaw6bb4Tjv6Jm4mpNy2JxBWg1mVe/oB7lf4hFz2TcOgZYd0Vn9CDTVP1bq/bg3kL8m5Hb4cxFnxjB+1wzClBvguE0pzWa/wZUroXRzrUGAutrwON7OaH/rVL6D10mbbC6HixcQOQ/Yq2Ec5pSZg8PQDOQpJI2DgVZn2dx358VFcL6rT+5YdA46kckkwEYO8NqaO1JHCcRLMqWHYcpNFXXriMX3nUK14GSSU7BoJmOBVq91tUE4YJKIV9hG4h60JVkyNJSdZKe+2SqQYbAWtxeARZbT9aUePtrTwkjsYnHXzsKBG1Gg1hBvTKMhEadjpV3ZePg+Ia5NtbwM4H2B/J2Dz+FDAlPgwQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(396003)(136003)(376002)(66476007)(4326008)(66574015)(8936002)(6512007)(316002)(956004)(6506007)(52116002)(66946007)(6486002)(69590400011)(478600001)(86362001)(66556008)(83380400001)(186003)(36756003)(2616005)(16526019)(26005)(1006002)(107886003)(6666004)(8676002)(2906002)(5660300002)(55236004)(36456004)(26123001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Es3Vwnd+CUutoj/OvCQXcIONL4+Y9mdtxl/xjvb/j5ePNf7YTWx7EgucLDNr?=
 =?us-ascii?Q?mvAoNJfOo1kCz/wDPSRd9d8eYQiG34bsyC1YnElozvQYG1DNwIGDM4MHirSH?=
 =?us-ascii?Q?zlv142B1Btd5B4DuZbFe/X8BbLNPlIDtHqqvIbn+0otCin6go4m7JxuZlV/w?=
 =?us-ascii?Q?fKcnlW7lpG8YI1vycmYca935yTdQXOSUcmNWTYq1WM64fZs5kliCwE+I9+wU?=
 =?us-ascii?Q?wSSxNWjivaTEwzISldaWSmE6Xm02Ex/8yP+tof/bytZCAAlU71MDwiTM6P4h?=
 =?us-ascii?Q?p8T9nKf4W40u5egk+LGC3t3IVLZjvnyMZTMDHkV3uV4TQTJtzIwlaT0WKF3O?=
 =?us-ascii?Q?f4p5IJj84UnbMaqIlH2SOkBUthF+r1nz193BLl8U73vTwov6jjRDGYF70qn5?=
 =?us-ascii?Q?d5px5iIJy0YsM2bHRi3xEkE86qjIQweSZhlXcG2JfCjUmWjg7H8D33sHXh8W?=
 =?us-ascii?Q?Y47P20paob4xvthWe72gEg3EQRhhoZ4fz6YOUfe4zsbNSbKc1wnAIRW6LD0u?=
 =?us-ascii?Q?Xdk41AWBy7UItB6L8w4fi54659E4/WO/ubbS67dJQRDtmka9tyzdN+ytOzIr?=
 =?us-ascii?Q?0CRNeUJrXKVbXgSXNXf93dYUAm220aXyvLFU5x3HqBtJzvSOPNWr+zp3hdKy?=
 =?us-ascii?Q?KZdjUb9JOLi1odDY7sRz+jvQrC1q5zJME9oo96qgjTkOHbxvHmee4e9uv3D2?=
 =?us-ascii?Q?q2wGs+HjhvqIhp3RFmJqVTjvZshemPy3BveBc4ZhuEppSKXFN3Kps/eqSFMW?=
 =?us-ascii?Q?+iRoapXbZPMSnqW4UqKwskGNpLQ4Wp+hOAvwEUt+oUmok8Psurcup0bh5JML?=
 =?us-ascii?Q?cIL7VgYlvLh/lmpiKaycvJQuyUPCDGpm9TGHS+vUBo5xjTKsvTejbNgsvVfE?=
 =?us-ascii?Q?ouKMvl8vczWDYaY1E+lh8dcSDLvc/HalC6p0+cBqEnyqLVt5B4fjCbKwAw7y?=
 =?us-ascii?Q?WaURMlfUcaQCcNC4Tkt8683quim5s6KfF2KLr6+j218BU8yXYCztazgnEQCm?=
 =?us-ascii?Q?Ig1PoQcw1C/wuMRa3VheAKPiVoNWa68dnDsQgpvd6SxuDcV7w3UeaNBv1ErY?=
 =?us-ascii?Q?9KbtKeig?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 469e0164-4a73-449e-c114-08d8c8317bde
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 10:50:13.2373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPcaxudJP1cpi68ucmtK7IemWHFzSlF4UUy88c6N76tY9YVf+k7p1pnaUjme9gS/rwMbLlmqC5eajiooa2MwDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PR0101MB1134
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

rapidjson is upgraded to latest SRCREV so
removing the below patches which are not
applicable:
1.0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch
2.remove-march-native-from-CMAKE_CXX_FLAGS.patch

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
