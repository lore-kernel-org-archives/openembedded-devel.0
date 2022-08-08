Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D80CEC3F6B0
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 14:10:08 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.86])
 by mx.groups.io with SMTP id smtpd.web12.26055.1659967800505477410
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=L4ViZV1J;
 spf=pass (domain: kpit.com, ip: 40.107.239.86,
 mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ns0L3o2kYKxuYZvZwd1dOVw+yPdctkwTuciie2XSrk9wJQlUox9e3qy6uZ64G/asO8KG36pyAv/FpJk/ChKjezazom/J7yz3zJjcGLKArP8zg2LbB59f8N8V6qgi/dE27mXb0ZHg+K6E+z8gVGpl2Y88BDrA0tYx20Y/bQgfS3tO3vw6VR4KnLXS80YlQ2tobysMEeiE4WEIdG+NWb75g4Qy3cnSdRRE+31A27yd0y2ncJWLVBDfPHbxOYAG9Rsj9E0QPk318+dmq1Nv6YQyztwxTofTDUJzKEfypc54q7IFhloHZHs9Hy+0U1h9g7wJB9YKI/DArbL29Mt9MuC8gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7oxRJEMjPrtn1pzc/y4izrOwN4ZSCCukQS4aN47rNE=;
 b=ZqrXOTosMTgkTHa6kMGpdVS1DI0Unsy+XIBMrRzoybLV5Ztk8sOs23KCXEa7YF1zxIFCquv2ZcXjfwNtlFRKxwzK63GnjYUeK3sOf8Y0g3MDZuItGxxLxQ9xexl4pPvcKWndN4IwYWhcWIyzjJNeGDpQ4Ynvg2WxyfI7iEm4/CEJvgOrjnoEY6jT2JOzbtTzjeAMi+WrFx5Jz8Cw9X3XTjL1qLa249chPGFr08i0VNTH9NoPywczwURDqO2bYpuSEoU+JIMD3ZOKLXq+UICC06PGQSfsjI1Nx+qFEejKL299F0WmtDQy+ZmJJkSPXK09C3PqzUmPrTQ2QBAQmDtCCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7oxRJEMjPrtn1pzc/y4izrOwN4ZSCCukQS4aN47rNE=;
 b=L4ViZV1JCq9vkVl6oC/LKMHggYccdVfwM+5sFZJPVsoOVs4AAt1w5030CYkXhrcS29CKyCDkW9XfyvA5rR1FJtUjNGA+blxKAXcqQCZalVawbgLKwwthCWfQfYE5a341TyEdy+bigVbyJba2z6j0VYpqD6HGBbjKdg+cVu/rFXo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:8d::14)
 by MA0PR01MB7867.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:2a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Mon, 8 Aug
 2022 14:09:55 +0000
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6986:8621:f6e5:e4ed]) by PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6986:8621:f6e5:e4ed%4]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 14:09:55 +0000
From: Ranjitsinh Rathod <ranjitsinhr@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Sinan Kaya <okaya@kernel.org>,
	Khem Raj <raj.khem@gmail.com>,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>,
	Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Subject: [PATCH 4/5] c-ares: remove custom patches
Date: Mon,  8 Aug 2022 19:39:31 +0530
Message-Id: <20220808140933.25968-5-ranjitsinhr@kpit.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220808140933.25968-1-ranjitsinhr@kpit.com>
References: <20220808140933.25968-1-ranjitsinhr@kpit.com>
Content-Type: text/plain
X-ClientProxiedBy: PN0PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::8) To PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:8d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67c08f2a-76ec-4459-0dbc-08da7947ab49
X-MS-TrafficTypeDiagnostic: MA0PR01MB7867:EE_
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3imISLaFFvnV+Uq+nZSD3UwXgbE7sdkCyMSRVqF7eEKsyklkbSII4poEj8ygILzCMvrl/SGw8LWMOoUP5UMzkW7YM4lmPE9DfWA6AOXFnsYEm2haW6S6Hu/2SXz53qFDHd4rkywNJhApjE6zCq/GkzE7Rge3WzQ+Km188cI+sgDGKXO0PA3vCWD5JRyNt6aDz4qKXzDTvq1JVZGvTfdiHtQ6dk/XAr4Mh+e8xgTMDHB2nKHGzGmuIhIYdDpe4R7YiVE9E5+c3zg6oukdhlnS5EYVhFMPce31IqAy71KPoutNEdCGPIGaVervaHs4ToaVo1brBg8wCuUggpmN3rvTENBDhjF3ZbtOs2atTfO43MGTCowk4o8Fxbj7RlneDRu5XC+uZK5Pr+lu9Kz9aHm1emFLnpTy+XN/pWVIqZeVioqrbBOzyTyuf4cn0UmclH9gOxE7FXScxXHY0EqY7DQi9W41A2r/dVeZlaMawboqu40E8PwF/rJpeXrluKgRm7J/DI0tXbyCbvtM8KU6jNabPGHQQlWmXsHskUpB38LBKLH7O4Gonr1Ol1i5VjAiejC7qkOqPDrWTO/TOeDILhe1T6IDOT1bSn6r7b18svNahZZmQyyRpIej76efkZ7cCmxq49XsEzKCp9vmMOZAQCNdI12nIvf3zIhohrwCwtgAwJ5vvysMUKWDzbcjPtFdkWW92T5mX3l+YXzCpINJubPEZbFHivoi94BtOGWuvgV+ekp1S6iHXEh0DmtzDH0116pM9aZVhgG5CaLeYkqpf919yyFVyWO0Nd5PzGscOUm+AODISlOyTyDgFfTuJ84BTZsNz/uJxx2vXNNvaG0qs5XrJA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(41300700001)(6512007)(6506007)(26005)(6666004)(38350700002)(52116002)(38100700002)(1076003)(83380400001)(66574015)(2616005)(186003)(8936002)(5660300002)(66476007)(66556008)(66946007)(2906002)(8676002)(4326008)(316002)(6916009)(54906003)(6486002)(966005)(36756003)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TjMw9Z7rHJNXISY5+XdXAPTYaOp5RXN5p0G2vA9H1gcjkRa2/fvglHZNtmba?=
 =?us-ascii?Q?qsRF58gNGeJ8SNNwq96xznxaTWptFJ5dgiqTgT7TM3dAvv3RY4Iyuy44gpDs?=
 =?us-ascii?Q?qSuphX4pf7ZYxqCCgOJzdMc0gHgtbCukVZiWsqq31oOew1DGv/ZjJ/ekDpZU?=
 =?us-ascii?Q?4CNgplSfA/xQZskyqDmOadub977+wXomexHowWNYDoLOGFfm+edh+lJEF+3W?=
 =?us-ascii?Q?E8ZnRNmMlKYJcyCwJQJ4YlYuEGqp/k5gcCzL4pUgTWFCmGvB+kvrrwZYHtPl?=
 =?us-ascii?Q?eaXac9hTYp8NmyL/IGgHazaA1j7Ku+m6Ssld3nrFcJjYojDDgC8JcjNYDa/l?=
 =?us-ascii?Q?koDKHySycAVYFsioT+xXMYn/hlidkM61cPrakD05cW35fly+4fkrxsCO7zjS?=
 =?us-ascii?Q?dAw/NVBqZm/Pn0Tcl8K3GAr4a3GCzgbcMRZS9hzQXXfyGQDe/iqVSycUr2Dg?=
 =?us-ascii?Q?I3KGXpB/3OTEdcL3ZXiBM3ICJqwhk7fplO9N0FLoH5Le0F2xUWyl/YDcbZrz?=
 =?us-ascii?Q?05cx1duGq79r/GZy8oyyfOsEllv1zZKaRdx7qBVKo+AAYy7oNfTBKQ7N0GDo?=
 =?us-ascii?Q?l47QDNn5qpNx9+4FX0JJQCcM7Jlp9HD9/DVO8dW7/pSdTBsxZay9/1eQdMbX?=
 =?us-ascii?Q?IGWEshhHjtQSAbt1B2Kcyxc8YP0AskZdl5hY3Q/ktg7a69Bz3UyxGFM+JSqu?=
 =?us-ascii?Q?FL0I5vzuSVi98y8k33OCTEFGSF6+M5yXkgJy0WP2m+KU5ddtaEQSEume+jcq?=
 =?us-ascii?Q?+fHuEZvbKMAEp0pWRPZfti75Y6ihpwjXt+xWxvzQr4qK3hrtTDEI9u4MfRhn?=
 =?us-ascii?Q?s3DMbig/blPolmYtaqVCjOuVee9t5VBp6lkzjssLfGLtAirQZ2kynIFTLpIe?=
 =?us-ascii?Q?rcvTvRqMuD6ke5bfBmZYtWi8+Jjj4IdjCwrJiZRzqVjKaQUBl0kpkgHgwGam?=
 =?us-ascii?Q?d9fBv50nELpKKjtXX+m1SzeYBr2iCs00Y1Xr64YIbwlJVlGfop0rf+RO1qlG?=
 =?us-ascii?Q?/onZ9h/omVUGy5eint/LSK3BxsARgbbgRuEZw2c3DVE3ZKwz3+bCvop1CEKQ?=
 =?us-ascii?Q?ppHwBrk57BU69gukpBtPjolvPWA1U3+t51b8rfYSUEal+XT2LPE1BOR7lqhg?=
 =?us-ascii?Q?ro8UBadFIZ97x0x4IBPM/1wBzE0rbzXptdeL9pZgl5MBQS6pkv32s2Kj+zkS?=
 =?us-ascii?Q?ytT2v5sFvWBIy9ZApLxj9NtITck9Nn3ZeDhMClCxwnfGrjZe6jvB2VXY6O0d?=
 =?us-ascii?Q?fHaMFPusm+Vl9Mr3ksW1fhlhNluqSJMgrLMKQPnka4MG5Pg45+fausolgEWt?=
 =?us-ascii?Q?bHaCVurOkgDD7Y+Ln5m8oXo4Y+a0pXP7qVt8VLjtMN2jVqUxLSVxc3616w6f?=
 =?us-ascii?Q?gn3eYD10A46LHEzytdglPApaM/PYWyergKgpIk5p61hxxbKoZGRScCA0RXQq?=
 =?us-ascii?Q?uqGySYukbytcE5MaT4RhG37RJwkHYGNa+TolSm5z1z9a8H9BgY44BsCsQBzt?=
 =?us-ascii?Q?HVylTVjVKejF9Bmjw0BavVuQfOrdlyqvq6LNo4GUCTbtpE0tGOygsIGUkJea?=
 =?us-ascii?Q?cc1NPIgPAgGM+dzKzVh1UsAk5A2yWkPoSddwCIS5knadEX5udGFKc8i9UlAa?=
 =?us-ascii?Q?vA=3D=3D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 67c08f2a-76ec-4459-0dbc-08da7947ab49
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 14:09:55.1083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Dou5S9PAfhUD3Lw5ggVKYa5aB/XwX2fICAKRs+28dFDvdbpsL8QDInxwbJBcgujEahyThQ54/7TjAd/m7wWBTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB7867
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Aug 2022 14:10:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98155

From: Sinan Kaya <okaya@kernel.org>

Current patch is breaking the library dependencies added by cmake
especially when you are static linking.

Applications need the ws2_32 library to be linked for mingw32
and with the existing patch this is not getting passed to the users.

Current patch seems to address this issue:
https://github.com/c-ares/c-ares/issues/373

Both issues are resolved in 1.17.2:

1.17.2-r0/git $ find . | grep c-ares-config.cmake.in
./c-ares-config.cmake.in
1.17.2-r0/git $ find . | grep libcares.pc.cmake
./libcares.pc.cmake

Conflicts:
meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb

Signed-off-by: Sinan Kaya <okaya@kernel.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 621bdc1993d2e8da08b9b240043dc13481cd644f)
Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 ...ror-mv-libcares.pc.cmakein-to-libcar.patch | 27 -------
 .../c-ares/cmake-install-libcares.pc.patch    | 77 -------------------
 .../recipes-support/c-ares/c-ares_1.17.2.bb   |  5 +-
 3 files changed, 1 insertion(+), 108 deletions(-)
 delete mode 100644 meta-oe/recipes-support/c-ares/c-ares/0001-fix-configur=
e-error-mv-libcares.pc.cmakein-to-libcar.patch
 delete mode 100644 meta-oe/recipes-support/c-ares/c-ares/cmake-install-lib=
cares.pc.patch

diff --git a/meta-oe/recipes-support/c-ares/c-ares/0001-fix-configure-error=
-mv-libcares.pc.cmakein-to-libcar.patch b/meta-oe/recipes-support/c-ares/c-=
ares/0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch
deleted file mode 100644
index 8f15f8424c..0000000000
--- a/meta-oe/recipes-support/c-ares/c-ares/0001-fix-configure-error-mv-lib=
cares.pc.cmakein-to-libcar.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From f2f1e134bf5d9d0789942848e03006af8d926cf8 Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@cn.fujitsu.com>
-Date: Tue, 17 Mar 2020 12:53:35 +0800
-Subject: [PATCH] fix configure error : mv libcares.pc.cmakein to
- libcares.pc.cmake
-
-Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 3a5878d..c2e5740 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -563,7 +563,7 @@ IF (CARES_STATIC)
- ENDIF()
-
- # Write ares_config.h configuration file.  This is used only for the buil=
d.
--CONFIGURE_FILE (libcares.pc.cmakein ${PROJECT_BINARY_DIR}/libcares.pc @ON=
LY)
-+CONFIGURE_FILE (libcares.pc.cmake ${PROJECT_BINARY_DIR}/libcares.pc @ONLY=
)
-
-
-
---
-2.17.1
-
diff --git a/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.p=
c.patch b/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.p=
atch
deleted file mode 100644
index c6f9c6de61..0000000000
--- a/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 2cc41bee63223cb398ea932aad6ecc94ff5b61dd Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 24 Jul 2018 13:33:33 +0800
-Subject: [PATCH] cmake: Install libcares.pc
-
-Prepare and install libcares.pc file during cmake build, so libraries
-using pkg-config to find libcares will not fail.
-
-Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
-
-update to 1.14.0, fix patch warning
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
----
- CMakeLists.txt | 23 +++++++++++++++++------
- 1 file changed, 17 insertions(+), 6 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 08c0247..0020d6b 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -214,22 +214,25 @@ ADD_DEFINITIONS(${SYSFLAGS})
-
-
- # Tell C-Ares about libraries to depend on
-+# Also pass these libraries to pkg-config file
-+SET(CARES_PRIVATE_LIBS_LIST)
- IF (HAVE_LIBRESOLV)
--      LIST (APPEND CARES_DEPENDENT_LIBS resolv)
-+      LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lresolv")
- ENDIF ()
- IF (HAVE_LIBNSL)
--      LIST (APPEND CARES_DEPENDENT_LIBS nsl)
-+      LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lnsl")
- ENDIF ()
- IF (HAVE_LIBSOCKET)
--      LIST (APPEND CARES_DEPENDENT_LIBS socket)
-+      LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lsocket")
- ENDIF ()
- IF (HAVE_LIBRT)
--      LIST (APPEND CARES_DEPENDENT_LIBS rt)
-+      LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lrt")
- ENDIF ()
- IF (WIN32)
--      LIST (APPEND CARES_DEPENDENT_LIBS ws2_32 Advapi32)
-+      LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lws2_32")
- ENDIF ()
-
-+string (REPLACE ";" " " CARES_PRIVATE_LIBS "${CARES_PRIVATE_LIBS_LIST}")
-
- # When checking for symbols, we need to make sure we set the proper
- # headers, libraries, and definitions for the detection to work properly
-@@ -551,6 +554,15 @@ ENDIF()
- # Record toplevel CMakeLists.txt path
- set(CARES_TOPLEVEL_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
-
-+# Pass required CFLAGS to pkg-config in case of static library
-+IF (CARES_STATIC)
-+       SET (CPPFLAG_CARES_STATICLIB "-DCARES_STATICLIB")
-+ENDIF()
-+
-+# Write ares_config.h configuration file.  This is used only for the buil=
d.
-+CONFIGURE_FILE (libcares.pc.cmakein ${PROJECT_BINARY_DIR}/libcares.pc @ON=
LY)
-+
-+
-
- # TRANSFORM_MAKEFILE_INC
- #
-@@ -624,7 +636,6 @@ IF (CARES_INSTALL)
-       INSTALL (FILES "${CMAKE_CURRENT_BINARY_DIR}/libcares.pc" COMPONENT =
Devel DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
- ENDIF ()
-
--
- # Legacy chain-building variables (provided for compatibility with old co=
de).
- # Don't use these, external code should be updated to refer to the aliase=
s directly (e.g., Cares::cares).
- SET (CARES_FOUND 1 CACHE INTERNAL "CARES LIBRARY FOUND")
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb b/meta-oe/reci=
pes-support/c-ares/c-ares_1.17.2.bb
index 19e35db2d7..80d711a36f 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
@@ -5,10 +5,7 @@ SECTION =3D "libs"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dfb997454c8d62aa6a47f07a8cd48=
b006"

-SRC_URI =3D "git://github.com/c-ares/c-ares.git;branch=3Dmain;protocol=3Dh=
ttps \
-           file://cmake-install-libcares.pc.patch \
-           file://0001-fix-configure-error-mv-libcares.pc.cmakein-to-libca=
r.patch \
-           "
+SRC_URI =3D "git://github.com/c-ares/c-ares.git;branch=3Dmain;protocol=3Dh=
ttps"
 SRCREV =3D "6654436a307a5a686b008c1d4c93b0085da6e6d8"

 UPSTREAM_CHECK_GITTAGREGEX =3D "cares-(?P<pver>\d+_(\d_?)+)"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

