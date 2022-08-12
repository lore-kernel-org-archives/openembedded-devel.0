Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC563C00140
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 07:52:44 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.52])
 by mx.groups.io with SMTP id smtpd.web09.8335.1660290761287076859
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 00:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=UxflVBup;
 spf=pass (domain: kpit.com, ip: 40.107.239.52,
 mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LHVo60X915ZLETVxo3iMoXfCL8DSAkNf10neLEue4C0VtT4SRXsErKGNYOsSPFJvCofMtays23a/AloQDfZoy9Y47RgxKxa4bREuklRbiOgk2p49vvHdGtOy0evCdjcwMX0uYEr8zV2mlF5e7WP4/5EP2FaX8FG5aGiFOfkP1qeBK658Uisk5NMZaA6QqB1Ra6sq01iptLlhijphRnuGh7bFvMXcdkJzuvz97VFyRS+nytOKSnNDmMUdi7KPGi4xo2SHmingXGoakqjDhJ3ri5Y0h2unkUQ0Lmr0xp8E69H9KVnbuB7w/MqJzlTwtamFzJcW5S/qKCWOTJMCFF0cEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S6g2CdPaUK+lUL1o+BeisXnKXRMQZpfdl8+QMFKi4fU=;
 b=gcy+8brMVhM8ionr7qTp670G3xxidr/g8dtoMCKllN7d2eIztAY8mmMkm5Fe+GqRIxS6UttljGSmaoD+GsZl48zqPTy5VnSTeZEVAbIH/WfRKWjCZYVpMCWINHJF7CuNMe84qdnSgMbWrfgYva91jeavG/BNc4m8xXQLVbK73s7JK0xEs86WpDrliDdZS5zFH4F/ea7CdwaNfxbKbSeajFF19H12HaxxPK8C84KzxEiWnX0xfFHxNi7zdLrc8GI3Egcof5765WL14IMsPirc3YhdIPGgXBl4hSO4DgRc+5RIpPRnGrIFx8eKPh4PEy2JMtUIeNsRsK5lP+ucSsRd2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6g2CdPaUK+lUL1o+BeisXnKXRMQZpfdl8+QMFKi4fU=;
 b=UxflVBupoURkbwONiRLCZN4BmB+EppN+iKF2vUNDSsD9SZPRQ2ThS6w5G9KcbmI3hLXlWiGrA8xeuu0ApKGAgE7Pe0JrXzg7QcxBR5Q+NcgBIsf+q3jaWEH6zJJeOthLuZXsS41zy+x3nc17dK8EbvKA1vxjikglwiM4T0E+1YA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:89::13)
 by PNZPR01MB8490.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:5f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 12 Aug
 2022 07:52:40 +0000
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5d77:6438:def1:ac50]) by PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5d77:6438:def1:ac50%5]) with mapi id 15.20.5504.025; Fri, 12 Aug 2022
 07:52:40 +0000
From: Akash Hadke <akash.hadke@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>,
	Khem Raj <raj.khem@gmail.com>,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [oe][meta-oe][dunfell][PATCH 4/5] c-ares: remove custom patches
Date: Fri, 12 Aug 2022 09:51:35 +0200
Message-Id: <20220812075136.31326-4-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220812075136.31326-1-akash.hadke@kpit.com>
References: <20220812075136.31326-1-akash.hadke@kpit.com>
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::19) To PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:89::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb588a76-0aea-4464-a661-08da7c37a14e
X-MS-TrafficTypeDiagnostic: PNZPR01MB8490:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	041glas7A9cO2XsoX2M/8gBzWGKmywT3Jldfnosiq3tlx7Q77WhxAFFc65os8bFgZMktZSBoiPnc7ugx6Lg1CO/TyDmdVkwqMY908fvXiKPrMzPS6ZgWBylpWDsDnMPedGzwyvoToSb+/YZ1o5dYfD3G3AxWIhEhbEncx29zKErLIx/dozmJIZmsWymNafHjccDneWT38FKWXprKml5a6hfSjJQ0QH/9NE3ATsJZhh9NTa+dlRL/KlTw1cUbjUWVbEIIL0wQSx/2+Tm4SbQNqH1cF2gS6lIWISvn18eXQePa3WyXrQvTZjXgKqVX1l6Y7ukNsNPEU4crBzxt1QHVVk/AKTFiPvx/BUz1vHYNf4qVd66F/N8Sjdd4MK7I4QJE7sD6YHmOQ0REcHyX0PtpCz4P88yfMjmwEm4kzt9pTzmhNIyJz2+SQnzJVvPW7t/FCA0Q98oyJNU6VQsg/vffSeF4ycXk8nLUAfVX1QCLnhfWD9VdhfWsKH2v4WjCghJRp8AbnwxjDH1U26DxECzQFlI7fsZ6HFxBI8mDOnKOg1eW+O46G51q1khHW7GvqWQUZHl9aUfnZg/V1aVRohgf55IXiwFX0es7EZXwumQadFKxr+IvnYRMd8Lloc3bHYFYBqBiItKPoI9HCoBbz7zAUT/nLDGY+kJ71+bAwFlVujl9yGlhuArjeouzZUWcXc/2bTe3fk7gSxdgI4nH0TR1OlxRF+V/+fdKLmQojA1WtSiYmAuSkyOUalaGEqfHFwgjG6Vk2V6LbaUJmMfh66a7VA5p00WRpoFsAIqRnqgxIOsEtLXUMRkg7tqnlJMp3qJy4NHpdW9MzPqDNFW69KU/WQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(36756003)(5660300002)(2906002)(44832011)(478600001)(8936002)(316002)(66946007)(966005)(6916009)(2616005)(38100700002)(38350700002)(6506007)(26005)(66476007)(6512007)(6486002)(86362001)(54906003)(41300700001)(52116002)(6666004)(186003)(8676002)(4326008)(66556008)(107886003)(83380400001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Mfdy1X1ASKFroCYt91rV1Yn+OslqBp+tO87PlhqrxlUnRZm9O7DLK+cGUydN?=
 =?us-ascii?Q?FyDUYWIL9Vi3RWv8fP3Gq1fMWKBy04vpDUalxzZPWyVfcwKyo5HxDnO9JFPr?=
 =?us-ascii?Q?JdGBBKqstH6gIeIJdj5XzFHjOPD6qyG6H0eH3Yhs1hYXhjpiDkTl9UpNb612?=
 =?us-ascii?Q?zuaHc3wF5u3TRjj+zUM5sdwYUAkYBymcJmddpKC48pTsP5aEVhhM1YtmLY5j?=
 =?us-ascii?Q?dEa9hNUknvipkchV8yf/dYu3rZ+xY3p4sY/9NVL2GZ0v3h6p+ts5FkT3fmsk?=
 =?us-ascii?Q?SzuufV0pQNZzyNyr95ONGxrbdjPmd5bs5vEK/8fXirxIuDsfjTf4lYfJLzlQ?=
 =?us-ascii?Q?1GTT5qZyOzWxEZSd6y3OX5VUWOcjBxIZ6UJIh9a4vlKNCIL0jy0Xg4MaDRxf?=
 =?us-ascii?Q?1KuTJrGMmJ4zDFxII6EO2xVGwf109MGezGnGA08FnV9ZNvvlSLvjfcPml5H7?=
 =?us-ascii?Q?MZN6VeSHZV//5O5NMKaHejOkVhFZffo36r/nePK+ip7+BUoSACp+3pxJPpPn?=
 =?us-ascii?Q?mINr2AFodh7WxdDri6mHhn+NUrz6RDfjNEPQZosXktm9GkYQiW5HtqF846VX?=
 =?us-ascii?Q?aHu3Gf283hOgKTeqdvBmJY4L1o5fovmkgQOTZxG++PyLm/oqoYFKxqmLbEOP?=
 =?us-ascii?Q?GF27GsOhR2si8Wmrd6HICdCJ8GoomlXOzcEq4z9YdZ7vuOJ69WVFdVr5JMue?=
 =?us-ascii?Q?nAxI4ThMoT2gbGheLlIG8xp4e5PKttsE6/5DGTmMErv6/E2WBIpqyYNIzRUt?=
 =?us-ascii?Q?KiykkGP/Qz/HtNqaMwkYj5cqerQUATex3buXEFFEPsTnd1ss1Sad4gCJuBti?=
 =?us-ascii?Q?7kvVNjoWwrIiDCazJoSoJrcqROzkApSOcENnGqEyIFSdsZp7wpGd3U40DhcG?=
 =?us-ascii?Q?3Fucun+3Va/DzSrjyhoF52G8w3D5CS2RYl4BFMbJYZYUx0AwOz8fmebh8jZ2?=
 =?us-ascii?Q?0fA5+ugcEQxO2AP76iaiEmyGqy4iomg0EF7Mft0EksFNq8zDzzxxEXOq54Gv?=
 =?us-ascii?Q?i7PGo0UqFt0kNQhx1S9yPBROh76m7GoCywmj1w+dQ3hTVm82fYTEsPc7x1ah?=
 =?us-ascii?Q?tvTk58TpeVIzDMW25OiPMKZO8aYcBcu0xTpUj3qIHmrI52KCMvRpDaOmPQQ+?=
 =?us-ascii?Q?3GRYhAkiTnbIsrWjua0rfy3V4CnOzgAnFDVhlCePJcC6cVPDaLGtMo8QenNr?=
 =?us-ascii?Q?IR8EIiTIKnn2J8D1e8pvL+bjUNGEBkmaNXPZJM+VSBgW76kzpmAoKGQ3UcGq?=
 =?us-ascii?Q?04cy1UvGRyCIsgUC1nxSR2HICkY8s6B6+kaFtSsN3zM2SDLBS93oW1papuWJ?=
 =?us-ascii?Q?JlAhEbNDQfUOZPTl7PI+eSsL76JwEBnZ8GamH10jD2xLqSwjrnGmktFs483Z?=
 =?us-ascii?Q?PDLkaRzy4PKYQm4HZcjiB1GwzU0G+1zaG37srRoO714L9KOiDbEU+nOCRKFT?=
 =?us-ascii?Q?YZFsBBF2ULYwddy8VMO6I3fZ8B+9/2dma0OpYZk44P0DoAfsQumonqdBdjVm?=
 =?us-ascii?Q?gmvha8+A9IH4eiQmKVL6lL0Ra8EBdm3X25Fi9TwAPI1MDy3LbGHhJRQwPJZ5?=
 =?us-ascii?Q?7fC/+ikri0/dPyI87VFxs+ycQja259bceylYcmRi?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 eb588a76-0aea-4464-a661-08da7c37a14e
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 07:52:39.9638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7GjnDlQ6Zq2u0eeBlmW+phsHbcJQI25bDShTLvqXzNqaxzYYxeOxhlh2jjFIB9Rs/uIK+p5srfI8Kv0BCZMMkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB8490
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Aug 2022 07:52:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98205

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
Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
---
 ...ror-mv-libcares.pc.cmakein-to-libcar.patch | 27 -------
 .../c-ares/cmake-install-libcares.pc.patch    | 77 -------------------
 .../recipes-support/c-ares/c-ares_1.17.2.bb   |  5 +-
 3 files changed, 1 insertion(+), 108 deletions(-)
 delete mode 100644 meta-oe/recipes-support/c-ares/c-ares/0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch
 delete mode 100644 meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch

diff --git a/meta-oe/recipes-support/c-ares/c-ares/0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch b/meta-oe/recipes-support/c-ares/c-ares/0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch
deleted file mode 100644
index 8f15f8424c..0000000000
--- a/meta-oe/recipes-support/c-ares/c-ares/0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch
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
- # Write ares_config.h configuration file.  This is used only for the build.
--CONFIGURE_FILE (libcares.pc.cmakein ${PROJECT_BINARY_DIR}/libcares.pc @ONLY)
-+CONFIGURE_FILE (libcares.pc.cmake ${PROJECT_BINARY_DIR}/libcares.pc @ONLY)
- 
- 
- 
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch b/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
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
--	LIST (APPEND CARES_DEPENDENT_LIBS resolv)
-+	LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lresolv")
- ENDIF ()
- IF (HAVE_LIBNSL)
--	LIST (APPEND CARES_DEPENDENT_LIBS nsl)
-+	LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lnsl")
- ENDIF ()
- IF (HAVE_LIBSOCKET)
--	LIST (APPEND CARES_DEPENDENT_LIBS socket)
-+	LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lsocket")
- ENDIF ()
- IF (HAVE_LIBRT)
--	LIST (APPEND CARES_DEPENDENT_LIBS rt)
-+	LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lrt")
- ENDIF ()
- IF (WIN32)
--	LIST (APPEND CARES_DEPENDENT_LIBS ws2_32 Advapi32)
-+	LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lws2_32")
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
-+# Write ares_config.h configuration file.  This is used only for the build.
-+CONFIGURE_FILE (libcares.pc.cmakein ${PROJECT_BINARY_DIR}/libcares.pc @ONLY)
-+
-+
- 
- # TRANSFORM_MAKEFILE_INC
- #
-@@ -624,7 +636,6 @@ IF (CARES_INSTALL)
- 	INSTALL (FILES "${CMAKE_CURRENT_BINARY_DIR}/libcares.pc" COMPONENT Devel DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
- ENDIF ()
- 
--
- # Legacy chain-building variables (provided for compatibility with old code).
- # Don't use these, external code should be updated to refer to the aliases directly (e.g., Cares::cares).
- SET (CARES_FOUND 1 CACHE INTERNAL "CARES LIBRARY FOUND")
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb b/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
index 19e35db2d7..80d711a36f 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
@@ -5,10 +5,7 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb997454c8d62aa6a47f07a8cd48b006"
 
-SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main;protocol=https \
-           file://cmake-install-libcares.pc.patch \
-           file://0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch \
-           "
+SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main;protocol=https"
 SRCREV = "6654436a307a5a686b008c1d4c93b0085da6e6d8"
 
 UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
-- 
2.17.1


