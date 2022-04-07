Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01672C352A7
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:15 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.75])
 by mx.groups.io with SMTP id smtpd.web09.5527.1649331879516321720
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Apr 2022 04:44:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=jj4Roe1O;
 spf=pass (domain: weidmueller.com, ip: 40.107.8.75,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7FkHJ6iWzwDccIDjABxZFfbVS8qmdZtI9CgiBcPWHeNGZ9E6/5MnrunAKQ+9y2u4/C/CVHCC5+fIj9JEF3561iqbTFJ4/7sjRYrPAfuZ6Hv34Rb5lRWRJcVp8ZPWfS4/lms+871x50s817Tkr9+GCF7FGaFQUS5XlA9SUlXD2Hlfi8cXPrbV9GYjcAcwYpn03elXx0LYdrDTRZKKWU/qGDoBKMl6l39Sz5IpJ59wzN1J9kG70htsooLVu9rkXsnZhP4Jaa1eZ0Cms49wnlE7li08i8ZxODZggfjtsu+ontvvrjDd3UgRCrWgh5sF4LtgIZY0xYgwYFcG5U1BXZeNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOHc59fh0ovfnLQZQgiM44WmC7bVvRsb/SuoM8AYGWA=;
 b=C8Fer+UveiEDjFqkGIL7HKqwpIcO5Se536GnU1tk7WIJEGcyOiqj868k9kjLUlJBAK2YiVTTFuu5vI/IYsGGIz6Wldn14C/5a+5RvoNKlMrI1zkpxxqFaMMyYm9sVeMNmhFQzvdwZsCBvlb+c3vtUMw05SU9sIIq18F18gLnWj1F7N4h+o6afwXzt7VA28587zrX9yaHcbqiP3+wnyodCYB/GD9Jy+EVFUM4pHQclzyCgsZyEa3dW/JkMoCCjEvvZTYhL9sRSINrxiP1d1dRe7v5VqKOeWcblS34kQJ7uzanRUtAD1AORofA8G7r38/4ksht8wUoOGT0yPAmRdV6KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOHc59fh0ovfnLQZQgiM44WmC7bVvRsb/SuoM8AYGWA=;
 b=jj4Roe1OKnkcRrgSmhZ+d3GAr/EaMjHUIGKE23JrIQJr+YaAIq1i/KxZDa95cW8emg2s/ZM34wp6rjV3uChpiGn1INP/lQQQ2+0SPiELbEmiZk1mXxx8Z3m8LSPRtX75FpTZpANorOf5tRIGW3MRXdnnuKq8930zuQEKDYfjcv0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by HE1PR0801MB1788.eurprd08.prod.outlook.com (2603:10a6:3:88::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Thu, 7 Apr
 2022 11:44:34 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::c53d:64fa:866b:b512]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::c53d:64fa:866b:b512%7]) with mapi id 15.20.5123.031; Thu, 7 Apr 2022
 11:44:34 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-devel@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [meta-oe][ PATCH 1/2] grpc: add cmake support for target
Date: Thu,  7 Apr 2022 13:44:05 +0200
Message-ID: <20220407114406.6828-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR05CA0016.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::7) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e920571a-a2f9-4e3d-d755-08da188bfc2d
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1788:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB17881E44CA925E4A058D3A7DD7E69@HE1PR0801MB1788.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ax5rWKXopRWb/GTtyb3xD3y/QMCJCV4eYw77Mz76ejlu8kUr//f4E9RVKSvk87UnVYbqODLCq3vVrT5TbrBBbC7dP/Q5eCzuK+yhH1pRs7g4Mn86/ifBJyYLZzl6OWDfGHZsWYymXaEiiLiiC3HAtnFnXDIMTN8YEphqsQ4Zzz/pgS0D434mN8uSGFNEGSJb2FWuC1oJX/gHMWj28w3GJ9a4pfkFgmK9K7CGC24QbyVLwWtlYuis8MGj66D1sJf322gBqssm/OKeA74y0P54dYAXiF6fB9si08M9Rkdh08z+nUA3vJ0HqOXubh7oZijn+D7dav8Iw2m8+qPiAXtz1zIwSkOUI+rQw85GiIGDJTwVz1NiSV6wZ8gANmupgHa0sGUZPavKTCXxh7HHpweyFIoOW3T27BYU4kG29SmuODKGxeyXM12cWIGPxDHbXEr+A5qZPJCmyWMkDUUWAwix54I/6XAjiwF0EZGP6LcfSO6UnKA8TpSFvbKYQS77ickdmLioaqhA0l0Na1FkTlvrcPs7u2sxTu72Kh/bHSOhiYHyWFrBl1s8T7xFfyUGAz2SlJxU+TqhmP0B5iADmsgRNQDFYN8BJMnaMAqj6gebAgorPVtkP3PXuK73zc+8rl+GEfT4mBOGoz8offnYluPn8UJIrCYQjdYj00BskA/drxMysSEuIrWtpLj9fMY38nHRXwIxEnuLpLlWWC5v7xjTbrR6xuuopGcv63OtLBh/uRl3Rc2DfnRWbEQhNXwCBItw6OIHHkCIZbuc2/wfQzdVNw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(52116002)(6666004)(1076003)(26005)(107886003)(186003)(2616005)(66946007)(66476007)(38350700002)(38100700002)(66556008)(6506007)(4326008)(316002)(8676002)(86362001)(6512007)(2906002)(83380400001)(36756003)(6486002)(508600001)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1IYALQkKwxhquUMI3S0A+qpCzT5YjFeX2q7vEPJ5hDrspUeIw7mbpQwnFQZX?=
 =?us-ascii?Q?4BVP9pMdhIdq/8TF5dACZNSvdw7TdP1cUqfWrQN9BZVx7zHyTZegci3n9KFJ?=
 =?us-ascii?Q?/vVgZmKkXQa/0A+fEb4fJg+LE4vTfSOulfH5r/+wPBBX+BHtVuDUbVyxAol/?=
 =?us-ascii?Q?JzHcFtVoCJyzJe4Uyo6IVDh6AT+07hn02aJ/USGSzRNKYaQsbsDwqC2oEQVB?=
 =?us-ascii?Q?jcBIIOn8ARL8p7O1/Co9gYPueUKirYWRJ7asCCjclDpcrrK8pClmuj0sCt6J?=
 =?us-ascii?Q?wS0pK0nY1i8JHMWJj+PHgy7okD2OBgF1w6aXcLXTpF06V5QqIqewbsDXJUQ8?=
 =?us-ascii?Q?ujq3Vg43XEJepgEJEIZpk2TZpE+CgfZyZW6R7VKDbGLSCTQz44l1f3QaXeev?=
 =?us-ascii?Q?K32knHcAenpB9sZSJhPCIM9N3ZYDGaCTqG3yzfHCK5OqrK+2iCPgLlz3zuzk?=
 =?us-ascii?Q?RAD4nRu53Fv2Oo77lYbXI6vaMXf6Es3gv4raYapmwm4svEQaIHu6Q61YnOdu?=
 =?us-ascii?Q?7PmMhgYPAK92eWs5sgdGKRlF/HxZEQqhvCg+doM3uMmkFmNhtxyOy+YQvs4Z?=
 =?us-ascii?Q?QaD6ffQXI3S1J0UtX0JXLP3c9M6BI2jzGyx7v0EWhAoZEwrVfREDsHGuDCQs?=
 =?us-ascii?Q?7zLOWVi61WTaN5YdO4440XyK5NnFkoIyOnVEvBGZtggPifR+8WTmPJzNjAIG?=
 =?us-ascii?Q?jzWEg3SfWaxOZNgICLvqQtNQIJ4jWbMVAawQN8VStHbZMPRN8RnxkxIINFUR?=
 =?us-ascii?Q?uZCzIN3fO6WdwN3eVfBcAXQGtnDRNpJXEHlzVtzrh9PtLc95n5ecyxm3syjz?=
 =?us-ascii?Q?WDHiOLi3wlC0S2E81tuEq0KYOdQctjpkyz9Zyqog0Mzayp6j7BcMwE+1M9Dv?=
 =?us-ascii?Q?FnYhORsGCUmG9RMcqprvpEz0BKXalovNnwaYwIlgulMsgBW0YhQoktAe28u4?=
 =?us-ascii?Q?QtJZXeu5x9qMQfKvQgEkRwc4/t4QHQWTo1lWGsJyqB5uLRwbKGvbRfGO2taY?=
 =?us-ascii?Q?7O1eVrgPfTMMO1l2dsoPrh3LUwRIhzcWo8T9++s3iOibCysaXOKjqJdv0wn6?=
 =?us-ascii?Q?Eaj1iHHaNNdnH8Wi00KVtXCsGtu4E4cejKplu6iBGAN3644/7+0xIFyUr+Nv?=
 =?us-ascii?Q?0cf4s754xQnp1yr37mpBQRwgHJcPREKFu3zNkDPrQBKBomxb0mijNSUaQj3P?=
 =?us-ascii?Q?xL4TThgQ6d6CYxUITkdHUVneX4iIBHXZ4R8DfyJ5Rk8xmcFLpnugpygqI795?=
 =?us-ascii?Q?2lPeEEkXP3DBWh1YhLJVK4fnb5mdzF403XndpP3AjGbB+jlGelhKrDC+Y1w7?=
 =?us-ascii?Q?ft+/knOm47UK04GzqSd72XRwp0zJZAgMOf6b2YQ4y8o/XmiHPdICVgmDID8s?=
 =?us-ascii?Q?m/fnMWYffvLwLLhEq5bJdTMvYlAKV10mGg54JhbuAdyxSRByyUR9dx/lIH1j?=
 =?us-ascii?Q?Ju4TM+44b3s2/ydF3X7O2faSXYv67GeDbdeJLYFxJKKNpL5qeBJHriHgIo12?=
 =?us-ascii?Q?HnuY30kxBqqo3unfPHhtONrASDezRDSaPp/Bkh5c/g2lZjUFp1FM2IwE4HNE?=
 =?us-ascii?Q?02ILHV8hyv/TR+5j3T1VcGkhwQyQ+MAyhsYy6jV/B7bAM07sqm43s0FFQ7hv?=
 =?us-ascii?Q?KCwfClHnCLXraounwMPoVzwnlSyeS2mRl9Vy5DO991PFpG0ydHUa1tTQaR2H?=
 =?us-ascii?Q?vUh+2GgnkBDoa3VqTHwDEVNCcdKVX0rOEqjjWWcfeQoswiw4xo3uNEPb4XVh?=
 =?us-ascii?Q?G+rQ6S56uekN/l7PcUKqVEyDC1bow88=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e920571a-a2f9-4e3d-d755-08da188bfc2d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 11:44:33.9229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Ko/jkqvBQTF98MefOcbjFO4HFhHguwyzG8uVhTvOF2v8FnhLlZazpRy1MpK/qyBe4Vfp6+MHLx71YebHsZ5EGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1788
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Apr 2022 15:41:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96451

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

The CMake gRPC config checks for binaries and fails if a binary (plugin)
is missing. Fix the problem in the code and add the CMake gRPC config
back to the target package.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 ...d-separate-export-for-plugin-targets.patch | 93 +++++++++++++++++++
 meta-oe/recipes-devtools/grpc/grpc_1.45.0.bb  |  3 +-
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
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.45.0.bb b/meta-oe/recipes=
-devtools/grpc/grpc_1.45.0.bb
index d25a01cf3..d50fd2727 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.45.0.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.45.0.bb
@@ -24,6 +24,7 @@ SRCREV_grpc =3D "494b08ada4009ead0d0b70e44d354be72f9c283a=
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


