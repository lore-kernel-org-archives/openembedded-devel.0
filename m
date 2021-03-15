Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web12.5243.1615790970108785460
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Mar 2021 23:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=xMq6K9s0;
 spf=fail (domain: kpit.com, ip: <nil>, mailfrom: harpritkaur.bhandari@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grEYQu/IhdnWZn19h+HqXfj6H20HrIW+6egeQXzyFmo1Ip8va1ApBYmRuhIMNotjDny8MLEYaSM+P2FVFYkdvsBAmnNfNuf3pm/6fKrGv/5WxtyIuDOWdZTQ6xySCH0jwseA+7LciOZ4Oz1+LleilV7i92aJPQAPQoRN8WZFoQbhhyucrpNm8Q7upGeNBC4ffxjbWWNuCxzg9Ek2mPrwk1jUXgDc1VT+Kk35Mksc20JRWDybxPRoDaQ0Ey6EzP7Ji/1CBwaHY4iT/ryBgGT0MB7S/kX6Lj0vcVjz9kdKEP/9ID85L0PvhbBvseqFd7iafgPRIgnX6f5ZSj02Veeulw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rGRGJg/BkoL3SkfJuAbf4yedoQ3nTG5YGlNXs/8XmY=;
 b=JUSvFng73b9asbmzWqsPJCbFfIf+gN6wwbJOnMA2t/PTbTl5SU8v+YmoJsv8NiXfDHfDIm+c4E7/BfWKOT8jVygXYQWsrXu7mEd2H9TK2K0fYWcjOWsHsbyeKd0U04HzY1DFL/4EDmCF/KnFIIPOL01fyw7/aFJ20siEORyRSrs76Id/5Oqve1tN0BcB2MMXJ8k+KIwlREs+KU6i1LCrNU4iEM31ewlnk7SMcOpxQWVJgDwAVmPiRIZ74jDl8iKVMETJqcOxUb7XdbBfGUdB+2aGPYSufcI4jXfmxoYuvTLygYoR8mJqz+095CMAZCFaSICaV3A09C4aVDwmz1pA5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rGRGJg/BkoL3SkfJuAbf4yedoQ3nTG5YGlNXs/8XmY=;
 b=xMq6K9s06mtgio264uXq1DV8Qv8zoKcrkPAN8P/FpwCEUx/Y6LpXvinsriPH2QXo2tX8oBOFYJ8LmLCqB3N6/2/b4zhNW2EBQLZW6K2XIEz8JRA/HbK82lnuhcQputPBVAQD6VC9VYWHVO02X2XtQpGCScY+ZkVUx2XMpY/csqk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:16::13)
 by PN2PR01MB4714.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 06:49:22 +0000
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::148f:99ca:65bc:1277]) by PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::148f:99ca:65bc:1277%6]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 06:49:22 +0000
From: "Harpritkaur Bhandari" <harpritkaur.bhandari@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Harpritkaur Bhandari <harpritkaur.bhandari@kpit.com>
Subject: [meta-oe][gatesgarth][PATCH 2/2] rapidjson: Remove unwanted patches
Date: Mon, 15 Mar 2021 12:19:02 +0530
Message-Id: <1615790942-1428-2-git-send-email-Harpritkaur.Bhandari@kpit.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615790942-1428-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
References: <1615790942-1428-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
X-Originating-IP: [1.186.38.155]
X-ClientProxiedBy: PN2PR01CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::21) To PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:16::13)
Return-Path: Harpritkaur.Bhandari@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (1.186.38.155) by PN2PR01CA0046.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:22::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3933.31 via Frontend Transport; Mon, 15 Mar 2021 06:49:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ad637177-ed25-4eec-db00-08d8e77e74cc
X-MS-TrafficTypeDiagnostic: PN2PR01MB4714:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN2PR01MB47147F491EC90A592B9D674CEF6C9@PN2PR01MB4714.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	htFPvS8EPOrL+5IQHR0/uWDdS9CokVb11tVFUaDr4EPKC+/t1uU4kFY7RZkEtl62niHYvQyhM/+KGS1oV7y0Ivnj7T3o190a5mQR1U2q/307p9nvm0f5w3RBJKiYZQhF0/BIk/GHBM6RLp8gxkhi4bVH1y+4UF3VpSYAdPdHqVqD1MWDos3U6XOMQpH0Y37pIZL14s4kD2Qj/c/rGoba6TVOqm7Rv/2+ss3tkONc+bpyfunEZR12KodN9Guok8tE+gmOUA9NLFsUnngNoIJAa3iqejwNgihpqcxymz5cjMrbjX9Gd122kgMX+zty7R3WOzG3RkFvnvXKpGnt4qAOTcB9fNdT3o52F4HOmxhIlE7pDFA2h42fyIwVwzNsRO8/AUJK0gq5W3KfB0hFo79b4zDtWqeZeHPVk5jERO2nCqmbaZWFeZbGwB/nYiJU+0InDxHfnZL1+F8VIFmKGyE70KBMvubQynG0vjAuMBSX4fX9zareRgbb6OLBX1dYz9CYt4VhAPydeUc7IbRnZMYkZByJ7drWCxAt4W0BTr23MUXqPaxkhH6GPBu89XHKQs6U1WJfSM56biXuIVdGDWoUZW/Ws3aIkFiJRJI1WsBA51daNB0bew75KXZdyXyaIe2DRNhXEE4uMc+cy0+n1ikXTedPPTTw2Uios53/FWnMfZ6SyfiyHlPYRwJpNfOK5g7nFBx+QkFnPhijl3CZnO3WD7w95tW9LVoOErF9N1VDfPIUTrq4Qi8pnytWbxx5j2L6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(346002)(39850400004)(136003)(5660300002)(2906002)(1006002)(6666004)(36756003)(4326008)(86362001)(6486002)(66574015)(69590400012)(107886003)(2616005)(956004)(316002)(66476007)(16526019)(26005)(66946007)(8936002)(186003)(478600001)(52116002)(66556008)(6506007)(55236004)(6512007)(83380400001)(8676002)(36456004)(26123001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?7Cc/YBPrpeS00+oDCTPC/KYrT+TpoR51g/ozsPu8T/bPKMo0uBcErIaqiWbk?=
 =?us-ascii?Q?GNtJH81loxV5grWdDDjmobYOB7CnR9oDxV8HqyoGN1idYzhOoHw7o2ks231g?=
 =?us-ascii?Q?5QkIVUfNcLWvKJL96ufLpoq4Wz7NnCC1kEHxwQVHzKP/lBVopaYlvEAhVx3f?=
 =?us-ascii?Q?cMwmzGG/358ewlhsgngrAf8MZ4kEiDhZsmwnNM4Mm05Wrw9QnbzT6F+3BWh2?=
 =?us-ascii?Q?58h0+K1iiLe8TEmUVT1fYxuDYXe1lYPwEdDCn/8wnKNpo34xnSxB04W3DAP3?=
 =?us-ascii?Q?RPtcc4L5T+AJJ7DMbVojnSXsuVtyukjlE7U2BfPCnI55qYHCQpBBnRzwWaUI?=
 =?us-ascii?Q?zVJzcF1DgK+UD65sSL8VUqUG12rsZKLeiYsCYDbhqyiOZKiqu2id+D1aAI/J?=
 =?us-ascii?Q?QgvlcNkgfEeS/AxIWuGFpv3oPF8iMfZp8e1UQaUbmNzM/PbsvHqDa9t+NhK8?=
 =?us-ascii?Q?N9pkzMn2quMJXTMkDxYw5vkzc4eBnk5tK+SNmujWcHv0oVN86LzxIQg0m4vc?=
 =?us-ascii?Q?CvbdBi5PUppQoXXPsORTs6GZlVs79ePpPNkIIuiN5PT+MFslx6kYaGBDu5d2?=
 =?us-ascii?Q?sfmIKV66BurnDre/MbZ/YgEOvv+9/4k1hzlB2Urlq5QL75IZHoc5a82E9Azw?=
 =?us-ascii?Q?KOFVn/uLa7Yynd10FZai/PFbuD1kTRPwI0MvayggY7LhtZTRQYSD4nq9lEAU?=
 =?us-ascii?Q?UuJhneOXmTlrIGrK+ElQi/uVjwOzt58n+T90tZFFn8A8YcckaBSA4nG2vo6z?=
 =?us-ascii?Q?sDmYmvWEq6NGCu+Nt7RdejErj1rRj+Tmd+5Q7iV49utGS1KOtY5YI1g1zyvu?=
 =?us-ascii?Q?GYjsUHUNNEk8ZWLYqYDmyJo0fX2LpEOeyYUBMVIbLZ0I9KUlU2yj1So8BG+b?=
 =?us-ascii?Q?5RRf5+OAoJIGCOYY50OZc7gkQl7H73NAO+lHAnlFbHO7EjqsCDAdMtalUXiv?=
 =?us-ascii?Q?3HSV9rXAy30RKUzmbmuiPP52svfXkicnnSdgO/Yi9GsN+3Y8Mj3fRitD7gS7?=
 =?us-ascii?Q?P7T/NPrIWKJ7neBtmPacr64AO4sRwsBJO0ZXlsaTJKSx4LthsiLW8zaTMCqn?=
 =?us-ascii?Q?AhwggMmVe8iP6hqns9r/5mnr5fkms6kCzDUYpSpmb6k6tUPVmtdtS9NO4w03?=
 =?us-ascii?Q?0JVAb9tOVx0z66se5YUAeiF7PsOQBOXlV4+MJDSF+m9YhXk64z6w9LvSvp5z?=
 =?us-ascii?Q?Qksoq07NmyUw7lFhpGOh6mHVWxeFMHxaP59IWxSVzsUNaE3hypt4rEYknJOv?=
 =?us-ascii?Q?Xn6082FrYXUmglJMsLmZZC7kTuMBPuD0UyI0HbgP0KpEI83e6GRyJ6qh23Cc?=
 =?us-ascii?Q?sptUlA96Ew5rr/5cXB/0/AnD?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad637177-ed25-4eec-db00-08d8e77e74cc
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 06:49:18.6175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EvSIip+s/pS2z9M95x363tzlftcZ7hN2JBuiqa+tYyNd5ua8kk2jqavEUpE+Tb4lc65U9/l7nY1hzrMEVDlFlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4714
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
