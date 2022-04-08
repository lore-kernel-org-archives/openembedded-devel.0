Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7907CC4167D
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:35 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.72])
 by mx.groups.io with SMTP id smtpd.web10.3088.1649403026558679978
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 00:30:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=pkQy2Nhm;
 spf=pass (domain: weidmueller.com, ip: 40.107.8.72,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1uVXRATT9jgPQfe3TDxYmHYHHDc5oAguT0mLZQFw9L4qOPuKBGsR52ZkOxX25MShBng4Cke/r13rcrEubj2HOwXP9VcUQaxuJW6CNSUWhcr45eLXPR9Qpbh4hDhMfTjb7Ln3bmVyGL6wzFdEsCg0YxtSlr4XOTG83a1Z0o0ELOINITxHvtddHu0rct0dWUaHfqZgghOxx7n1Toxn+rOqSJvTQQtOkJSKr7bAMn0bHZ2BwA8WSEU9w+7ipKbyaPfESlZV7uwpl2kgP0/DsHiILyMM8+nBLkMf4w1ZeRLN4FeON5VkuC7H/dG5isJJk8DAckaWHZ/sVAYmi4kw05IOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7K+8ThgkXHyGwbYlo9CozuIgOxReCOGo3OH1Gp4K9GY=;
 b=EDwcrVlv2s1X+8sScyZszlGhtvTktgphlKeEhsxp2M3HLBNsHd8Fh9GY48h0wI/N03vBwL4IW0lYI238oyp43Ku+Db//OrDbsOAn1MkbdmMHBr9xY30TiYj3tN+U6gBDnegxPGjpPywg1fh8TeQRbDT+/Ski6ZrU4Kk9clrXNSS0w3j8g57yqG6QVa628Ji+y/U5l5ioUWi0l08V7/shmqeiyL3ZorBT4qOH94ps522To1D4P3G2VCxnvWDm25W9HAvXu2qXM+oDlvMgFDHagcJbb/Ut/bSYgm5F3XXXlEQWxHA0XHrAuEHUz1yl7ek168vHPJraDU++XiV0q/W4pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7K+8ThgkXHyGwbYlo9CozuIgOxReCOGo3OH1Gp4K9GY=;
 b=pkQy2NhmVAdubFgvpO361lm/Y6R3LZL4Tr2oNjfn3Ho1VJABDg5k2hZaxTOoVFh2SQUmo3JCQTXtoikCJp/LY1pYe5Sksk8lcPy85b/npNmixxn28RoZURfd99DLGemmBQoeKxvRr0d8vzmTInkwCn4A6v7ixQb4qoWsgm4rsM8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PA4PR08MB5919.eurprd08.prod.outlook.com (2603:10a6:102:e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 07:30:22 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::c53d:64fa:866b:b512]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::c53d:64fa:866b:b512%7]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 07:30:22 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-devel@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [meta-oe][PATCH v2 1/2] grpc: add cmake support for target
Date: Fri,  8 Apr 2022 09:30:03 +0200
Message-ID: 
 <20220408073004.20207-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0104.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::16) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a49dad38-1810-4406-a764-08da1931a41e
X-MS-TrafficTypeDiagnostic: PA4PR08MB5919:EE_
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB5919F63BEE14982481D55712D7E99@PA4PR08MB5919.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yGySfbxxRACNL2JacFa7foKmj+QVGJHpGvBAmoP3e7DfDI4pW686G6/QTmOXmEI4yEvUvHgIDGnJDx6YGkUMKCIxKQ1GvjUNXFH4qoemgsOtCOdilPvUcDSMDFn5tIDq+Fbg52Tcfbv81wST/BP3pLDGU18q0qrXL6kHMSspWuHoDpdEWMLnBjLl1++aKUHix7rL/Sl9+QVUFk6rXWyf+0T2bnvM6duYBmKKY0x9tTgIaTAtQ0ZMz2oGnIH5ZH/+QH4tiHJsH1UHf2wCWs50vIgspfapnNMl5Zd8BFSsgPGRg0ZUTTwtoJ7hHoLcAIgY1wXvelHg1gIbU+XqhsBHjoFqxQ+KeyFh7BKAfCnjTXNL1zP4iw6LRQL9hYwuLMtemUOOPsMH1TIz2zLw5idzALStAR61tbYIzHlNcn5EYlfGKwey3PN8N+gA6mZpWHroFxRNZBYtCQM61Bj4fVMdFWLeTMH3QZ4J0aQMzcPmx7Ky7me4ihUNgkAMlSXrgqwABOmb5iJA+EWtOGZLprH5CLz1AQqJDIWWsF2cN/QXvPIzl5hByroaPagrKgunI1Ppk2paViokicQc5IoPaMZMW8TrvTX4CUFyNrAcVbkFK0RpdWTO6iUEvX/yVV5A3n3yl2kGkyqoLpuZ3RmexjqXNEa/mVvmp8yJ4oamScMTztSNKefKuC/SnodRFe1DtnATXyBYwRVbEVxq6zrtEDgfJv8IFvGam9W+9ET2R9uK5bWbMWg4L/lCLKSEZ1s7ycPm1t7KPOPVSNx4BSKOmbzjKA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(6486002)(4326008)(5660300002)(8936002)(107886003)(86362001)(6512007)(26005)(186003)(2616005)(6666004)(52116002)(2906002)(6506007)(38100700002)(66946007)(66476007)(66556008)(316002)(8676002)(36756003)(6916009)(1076003)(83380400001)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l2KCzWwdpzHNad971CDIgI9m2TpvPYaILqGd5HIkCQlHv/AsvdNIx/qpQ9LP?=
 =?us-ascii?Q?fq6bOc2vssYhu/cSQ+/btoF9AwRexcF+AnQQclcoV/DsDSPB57yvJ1TqWqVc?=
 =?us-ascii?Q?GxIxsUXQMmcC/sqWNFt1VKqSOgw+tbdISnP1SzuBVSca8G4LtRQ+XWE9QN2Z?=
 =?us-ascii?Q?dmY31Z8f5UeDTJn2lAzJauKEhzQxQhBZiurrWIM6KF3EAJiFo/QfkZhPCXvj?=
 =?us-ascii?Q?W6ZA08+6R93aAawFiwhyJLI+DsZx2xvGPqOrOGMZ9w4OXLGP+u+5N/IUlep2?=
 =?us-ascii?Q?70XlWgfBSSxSyquk7zzwVhNafT8w7C9aQHOckhm/StnShPEaw3MFKqkNY47z?=
 =?us-ascii?Q?nS4y3Lw+IZ8iCCzjiixQdXr28eCDQ5UL/mTyjQ58UG2SkUlIf6JJ4mznVWwH?=
 =?us-ascii?Q?AVzw8sxmhbjQqMbeywr4qg1ok29r9c3azUUKlVY8UobLmR0P7fkuvG4mGJjY?=
 =?us-ascii?Q?qQn01iBBGSfGCNE2hF53aY9RYLQe+7uBzvUkfrzu5d3SzR6sU+AjYnxoTyi5?=
 =?us-ascii?Q?vskJt94tNBVkcE8UyIx+IF2ZnMV/lMJfcqtFWZYNzmYK8e0wAHrsu2agYnwB?=
 =?us-ascii?Q?gcPe6bUj7TFwcELO8exdFac1VTcOvwZwwUWmIMiRjX/LS9YYenlBXqUYUgdt?=
 =?us-ascii?Q?2nE02/zAnfzvdE2AmM7B+5D57xdFQOCuvD7mC7lFnRrl7WhPWNd9y6650mxu?=
 =?us-ascii?Q?iFLUwM6g0TleZ4IYsxx1o5OUsri+QnHJT/Fo3yjIEUZFAhHqzVoj//ogxYFN?=
 =?us-ascii?Q?AzmADEODhJUyFEoZZFE77RxXlgEi6x1ybj6/phDG7pNdPJOvo5cGf2yYkWd3?=
 =?us-ascii?Q?V+jbFc3umn4g5zYh+WsIQsYUaQWyxcEc9HdpH5j7VMP29cxIr/sMDD1IuKgg?=
 =?us-ascii?Q?L4Ry1N8xj6GTefhuk0rw5hVtIKxNxdxGx7gO58E0eIJZpCNwf6Atm2E0ODCE?=
 =?us-ascii?Q?P1GCVrKPt1w6Pi64QHvSaF4Y7s4J/mbm67IHgaEYQ3OMET0pO+51K3KaYMQ5?=
 =?us-ascii?Q?MRUSlY57baZMLi4d1vSKAxHZRZODxAyR8fFZaEhNzczrmJF10Vo89QN4oD4h?=
 =?us-ascii?Q?GxmHdLWdHTQrrTAp3ERjXxCyc9NC7wNS49cLTrBJu3EQ82BjBRritb3h2DtL?=
 =?us-ascii?Q?s2TpOCfjELGiuBeS9Rkk+Yv/Rk9YSsRtdWUe0JLib5Q342D1QaaOeTCbsEJp?=
 =?us-ascii?Q?+JvW7fpSHaOOWOG+eU8DwLNz2bzfjaJ38XF58hZSnNs41l2pGQ2Is7XW3vMi?=
 =?us-ascii?Q?oFYTgRnZ7mAG88z717GMwo0ZCl74rrBeSQmR98cq2Re7kGn2Ut/7w2ArT8Kg?=
 =?us-ascii?Q?BI1j4eccPPKlGxYjbWumXYn+jG0IlMFv3ulgeUc15P0LurHSC6+hh1AUw5rF?=
 =?us-ascii?Q?epgEiqoMxPa4BnGDJZz7fCGIPyZIKMvA6VoiZsiWlx8aJ7u0gLwC5/5z3bAR?=
 =?us-ascii?Q?qqbbfEfe23JUyLWiADPfdVE3+qbBHnelGSEcuYDLHeZIQKP7xlxXJ2Z30P5d?=
 =?us-ascii?Q?J8vzZeo8OfE1mO0KWEoZdZjNQWI/F8wGc9hfwTdmEC0ZqA1BAx3Yg7qYg3hI?=
 =?us-ascii?Q?uNRzvVlaRA/IB5SMcORJqglSWkKPko2C5jeZ9P7vE+NC/5FCJJlflgMP1C5q?=
 =?us-ascii?Q?aGkQOg9qt7RZAfE0veSZrFOITut7OdEBVyzZurPLDfb8mtk8DsvvP9ZeL7GT?=
 =?us-ascii?Q?BRsM4UdLsTlK7qSVDXJkmO8SrZsVR349CAr+lmBTAn6AT7u5DsjFq1y7BXtg?=
 =?us-ascii?Q?0AHe2FaqhecV3emBURk3Nq60DHi26NQ=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a49dad38-1810-4406-a764-08da1931a41e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 07:30:22.5316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 UPzSKM8/SmOY1qtGjFYWgX/Pwxb8g/PYvmOKWOHy8unbIZrBTtSCZnV44jdASUk6vn67t9FnQvVSY7NaD6fodg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5919
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Apr 2022 17:09:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96473

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

The CMake gRPC config checks for binaries and fails if a binary (plugin)
is missing. Fix the problem in the code and add the CMake gRPC config
back to the target package.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

Changes in v2:
- Rebase on top of latest master

 ...d-separate-export-for-plugin-targets.patch | 93 +++++++++++++++++++
 meta-oe/recipes-devtools/grpc/grpc_1.45.1.bb  |  3 +-
 2 files changed, 94 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separ=
ate-export-for-plugin-targets.patch

diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-exp=
ort-for-plugin-targets.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-cmak=
e-add-separate-export-for-plugin-targets.patch
new file mode 100644
index 000000000..679bd3882
--- /dev/null
+++ b/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-export-for=
-plugin-targets.patch
@@ -0,0 +1,93 @@
+From 3150cb043363e05588062dd392b940be25594713 Mon Sep 17 00:00:00 2001
+From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
+Date: Tue, 18 Feb 2020 14:17:07 +0100
+Subject: [PATCH] cmake: add separate export for plugin targets
+
+Upstream-Status: Submitted [https://github.com/grpc/grpc/pull/29328]
+
+
+---
+ CMakeLists.txt | 18 +++++++++++-------
+ 1 file changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index efdaf8936d..6608b1b00c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -10935,7 +10935,7 @@ target_link_libraries(grpc_cpp_plugin
+=20
+=20
+ if(gRPC_INSTALL)
+-  install(TARGETS grpc_cpp_plugin EXPORT gRPCTargets
++  install(TARGETS grpc_cpp_plugin EXPORT gRPCPluginTargets
+     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
+     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
+     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
+@@ -10975,7 +10975,7 @@ target_link_libraries(grpc_csharp_plugin
+=20
+=20
+ if(gRPC_INSTALL)
+-  install(TARGETS grpc_csharp_plugin EXPORT gRPCTargets
++  install(TARGETS grpc_csharp_plugin EXPORT gRPCPluginTargets
+     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
+     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
+     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
+@@ -11015,7 +11015,7 @@ target_link_libraries(grpc_node_plugin
+=20
+=20
+ if(gRPC_INSTALL)
+-  install(TARGETS grpc_node_plugin EXPORT gRPCTargets
++  install(TARGETS grpc_node_plugin EXPORT gRPCPluginTargets
+     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
+     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
+     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
+@@ -11055,7 +11055,7 @@ target_link_libraries(grpc_objective_c_plugin
+=20
+=20
+ if(gRPC_INSTALL)
+-  install(TARGETS grpc_objective_c_plugin EXPORT gRPCTargets
++  install(TARGETS grpc_objective_c_plugin EXPORT gRPCPluginTargets
+     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
+     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
+     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
+@@ -11095,7 +11095,7 @@ target_link_libraries(grpc_php_plugin
+=20
+=20
+ if(gRPC_INSTALL)
+-  install(TARGETS grpc_php_plugin EXPORT gRPCTargets
++  install(TARGETS grpc_php_plugin EXPORT gRPCPluginTargets
+     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
+     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
+     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
+@@ -11135,7 +11135,7 @@ target_link_libraries(grpc_python_plugin
+=20
+=20
+ if(gRPC_INSTALL)
+-  install(TARGETS grpc_python_plugin EXPORT gRPCTargets
++  install(TARGETS grpc_python_plugin EXPORT gRPCPluginTargets
+     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
+     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
+     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
+@@ -11175,7 +11175,7 @@ target_link_libraries(grpc_ruby_plugin
+=20
+=20
+ if(gRPC_INSTALL)
+-  install(TARGETS grpc_ruby_plugin EXPORT gRPCTargets
++  install(TARGETS grpc_ruby_plugin EXPORT gRPCPluginTargets
+     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
+     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
+     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
+@@ -17349,6 +17349,10 @@ if(gRPC_INSTALL)
+     DESTINATION ${gRPC_INSTALL_CMAKEDIR}
+     NAMESPACE gRPC::
+   )
++  install(EXPORT gRPCPluginTargets
++    DESTINATION ${gRPC_INSTALL_CMAKEDIR}
++    NAMESPACE gRPC::
++  )
+ endif()
+=20
+ include(CMakePackageConfigHelpers)
+--=20
+2.30.2
+
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.45.1.bb b/meta-oe/recipes=
-devtools/grpc/grpc_1.45.1.bb
index 872bc6afc..292ea7f9b 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.45.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.45.1.bb
@@ -24,6 +24,7 @@ SRCREV_grpc =3D "1c159689ceda2c408f7f9d97d96a264c9521b806=
"
 BRANCH =3D "v1.45.x"
 SRC_URI =3D "git://github.com/grpc/grpc.git;protocol=3Dhttps;name=3Dgrpc;b=
ranch=3D${BRANCH} \
            file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYN=
C.patch \
+           file://0001-cmake-add-separate-export-for-plugin-targets.patch =
\
            "
 # Fixes build with older compilers 4.8 especially on ubuntu 14.04
 CXXFLAGS:append:class-native =3D " -Wl,--no-as-needed"
@@ -80,8 +81,6 @@ do_configure:prepend:toolchain-clang:x86() {
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-SYSROOT_DIRS_IGNORE:append:class-target =3D " ${baselib}/cmake/grpc"
-
 FILES:${PN}-compiler +=3D " \
     ${bindir} \
     ${libdir}/libgrpc_plugin_support${SOLIBS} \
--=20
2.30.2


