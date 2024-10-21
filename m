Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C3ED15DBF
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 16:57:55 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.96])
 by mx.groups.io with SMTP id smtpd.web11.376.1729529867266316964
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Oct 2024 09:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=iKMVhaNF;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.20.96, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KXMjKC1dZCplipCRKwTIAY/7qr5tpN5STYn7Ho3FBfwBY7cZwOya1z/6KqbWQ0UeKNSYU2nm2ZlenXwvVdb3LPbmmX1tj9wlknwj6UdpcwzgEJ0Sc/ANsAX9ThotxtqBqwnbgHCiUWOCkYBPSf2m20saKwbjg9ifBkVEUyigGacji0+12HTJuABl+cBB5D65A7W5VLMkM1JQGVBuVHsyEbYvQwh9sLLMqg3g5IOtRoDCdrkzxhB7/o/ZSgwzeTYxV66XFjx5BwDqem32ypsAKxAtfgbLp9xQDqogRJbHse7fiW4k6oxiUErbFdtiO7bpaTZIclQ6V2kJW+ZWrGpl+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkhWH6+CI/OHv8+Q8uS8iKDF9EBBPeBzo/8rXhIMHlc=;
 b=RH2PI3aCY5ZXw2pPIHGelQxj7PZ+MJqfFsYz9ysVh7W50yGYrPD68Dq56v6+jg/NSFrSZwp4U36gHjiHgznz/exMqJFc2+REDaZQxlqNgyrKI6dewnWhvhCRZ4ZXumSB8C4/n+gvxY7sbSTdVioJVvRf1StpZWHY0zD14CM/Gk7N6LnJqt6Yb5V8HlcnyxXGRUnxIbKQwDJpBUiLpb5YPar4Y61vFLqjWp2IruWZQSadEE8gd8ccLEJytUpBVpFKv5EjL9rWDqQBlFANXjrR477ujdSt56Kcfw2F852nHWwpWdOveL4t3sWWgk1m3dnFtpNwYqjnySPxD6l8xdFqMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkhWH6+CI/OHv8+Q8uS8iKDF9EBBPeBzo/8rXhIMHlc=;
 b=iKMVhaNF0N2watiHVo++4/Trv07Ib97j7GZTdc+F17UrZC6AFuPaPgzSRgfqpaqnHVSFiAWgrRUpgolOqW0v1QgBkv3EPcxd2Exb8S1tfsFt8AtuYIS64auFUvlzSt/vrdqaBLkpry4ixBOMW+xIp2kzRFka4rTtfIt2vVd8JqnCj4X3u7v1vLgH+RRbOCwAg6my3k+xKqQPVXREd3lfRDO541b27DTQ1jehuWbS29J5lNnTSSrQRyPQc3dNS4KGXYXzwyjO8zcNrRXIBEQGxNDS8lYs6ioNcn6L6nGN7Y1H84Y/w/qB4iU9UNVDzCIRUWFjI7mxxfigQEE/jemdYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VI1PR06MB8904.eurprd06.prod.outlook.com (2603:10a6:800:1e0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20; Mon, 21 Oct
 2024 16:57:42 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8069.024; Mon, 21 Oct 2024
 16:57:42 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: raj.khem@gmail.com,
	patrick.wicki@subset.ch,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH] fluentbit: Mitigate init manager detection issues
Date: Mon, 21 Oct 2024 16:57:03 +0000
Message-ID: <20241021165703.3473986-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00004591.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::42d) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VI1PR06MB8904:EE_
X-MS-Office365-Filtering-Correlation-Id: ccde8327-4e8e-4eda-3684-08dcf1f17a92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?B0I5zOQyLmkTxQH1YRXHxxHZR/1LT4cnb/XbxrRKc/8cb6hNFdwN6p7+GVh1?=
 =?us-ascii?Q?+Yi5cOvTH5NaP56aPZUobAK1aUKtoyb/OtBpAgHGWtsTXmUi3hslFiNeZacp?=
 =?us-ascii?Q?sT8F452nh4RlLCmZGqj5F1Up+OZWrqDWkCA+/qxQF9lRGUHjqL7xJfFYuldg?=
 =?us-ascii?Q?bvQfS8Y6U2OD80/xmruxsDPDkDN41f9ejziUK/242B3tjMHkFFXcz+WI6V5V?=
 =?us-ascii?Q?n3c9DtgxuEDISZHEIkd6h5J4utpt6LhZQM03OHKCmS79w4QgLzvYwOJQd4q5?=
 =?us-ascii?Q?rvFwvaNbBoIxBsg7AQzptWy5bjoYmK+tJYvSrNIr3DGEH3Fklw42iv6QnrNf?=
 =?us-ascii?Q?GDtxaa28wSA2YKPwcHGB7vsSSyFAmC00yLUvZMZRes7FTfYO6S6kJKHn6BE0?=
 =?us-ascii?Q?0xPl7PkjHCZdEO8ZX+wgAMEOUFdWKNiChWnq0jNsGhjismf3uUrcLiYargr8?=
 =?us-ascii?Q?QI8U2cUcoGJ3Lx2c3MuDgCB1xa8cMFqd9tbu+HREfcxS8YOMqrb7LkDH3UjO?=
 =?us-ascii?Q?c/GsDxJMB4aoRc88q676a7t6LiRYPG47LUIamcVvrp/yM5RVsiA3/vFqE6QR?=
 =?us-ascii?Q?Ih1lbOiE7HvDlK75GS1LqvOzviNzTxAXOS9XR4iInH7wqkYEBjXJinBISa5A?=
 =?us-ascii?Q?zNjJ6ahHvcbK2AXfxYjlfwf64hD+lMe0zbGHNx9gA/JtQbDkZzHWiIiAJWlK?=
 =?us-ascii?Q?W1NR+0iuAuwt4HzpmTdoO8qOAetR9kU9DJo2yon4UM2RmNopJJibkpP5sdXz?=
 =?us-ascii?Q?5NEABFYPhks9dMfNXnoZJ+/1/jSvcEKpLNnwUiILX49E2NJ3FbMjONum966k?=
 =?us-ascii?Q?+RUSottNpYqc4T1hIo7OwaylnDYCW90OzUGYfP45ydCaJ2woEOhV+KxWPkrm?=
 =?us-ascii?Q?bP3CqWtMmJGxsHUuIPmm8nrP/nF4ipEyMZiiO6n7QXR2cs6zWDBkk0puHIEh?=
 =?us-ascii?Q?belKcdxE7ewhJKlodx7IEHWtXPyJNjWZEE/wbkN2WXJM538HYeTw9p+UBHr4?=
 =?us-ascii?Q?Pq1nvFc1CxAvcjsW3D1Pnbd7a7aVIGEo8pxocAtAEJ4mcJIRx0PCyEectNEJ?=
 =?us-ascii?Q?nfxXLwwuXT9YVkm1Jwc+9izZS0jXUMCFoix6b3f9QOPn3c5UpNTHquzPIMyg?=
 =?us-ascii?Q?+opmG3IDBfx4P0RJfCJ0FoOXpI8Zz2xsXgjiLhScOZGkmXMLp8g7lWunpzdG?=
 =?us-ascii?Q?zccG+cqBSDK03+slbKjk6ZKNEltJSpwZZuhMTgdNBBymGEQGMNVwqmqQCmDC?=
 =?us-ascii?Q?xUsEiVitN6ZTlYVy/L/hNwi+R4o14k5ochE90lSyJ5k2unA3sAtVjFgZsYs1?=
 =?us-ascii?Q?RRNHND/EZwfnvgZZhHoUNOodSJEyOsWXcrUGhXGDU9C5QI4wUTDgmxmCDw7P?=
 =?us-ascii?Q?vvDNtlo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bgonaXZAKADguKXIa9fGy0GV+e1tKdljgTUVxClu9FDBynbkkoV+zWCt/XxE?=
 =?us-ascii?Q?QpDHAO3quO5mab0LpUFNI/XDKFFJWocmt4zJoUjM/Pr0Jl482aFI4syWs7Ko?=
 =?us-ascii?Q?Ro3O32WWG6S5IvwEOCJijsM83Cd2tlPQ6AoHgXmd5GmgnZLgWZkX2BdIHWWa?=
 =?us-ascii?Q?Lb/9Du0EboJb6pZsLttG9GmW1QGGy96uHE8PQNrZfDwortvcPRS5JTwb+pxs?=
 =?us-ascii?Q?pIoU3gR29Y/pu08dRcha8uEYfA0wabfoWFHuoPQt3hmWOn3rYZFCGmS4ikTQ?=
 =?us-ascii?Q?sWrXbtMfQTKPfuC0qGoJTtA07GwNyEE7/RGKyQfyb28HhZ6kGWt3hTjk0zLD?=
 =?us-ascii?Q?dle9nA1qUCYBqWXhRl6EK22XUc9d65kZFGAk88uCVEW4Rs4abnsPIYL0VgB9?=
 =?us-ascii?Q?Vk4/0uFcoJ848FtXy/G3lu34qfr+iTgXIZpfmXS4N33cdIRhAHMMrn8kSE/n?=
 =?us-ascii?Q?2JdXiN3jXKq+Rus0YoxL9a/FybSS8O9oMmFQt+x1HL6hVND9KnHei5mMzKXe?=
 =?us-ascii?Q?DAxl3F9DN9b4Buk3oYU6zCev56P7u9bb84vPerAH6EiwHdBLClhNAD9frVZW?=
 =?us-ascii?Q?wad+nbw0FHH6ffvCjJzIFZYQ+4xHV0KyF3s7zDV3vGlInT7uFw1RfPBG0Tu7?=
 =?us-ascii?Q?NR0Aexsk/qknpK5jlgjtqcBIMTKlIN55dGSv89T4JLkQ1CZVOBaXCN6Qn8ub?=
 =?us-ascii?Q?AchGQPDa2vZCyNwbjRpaRbOADlb+z95/IybVXpisOH0M3EwqqD020cl+4U/K?=
 =?us-ascii?Q?u0DDSVkAaL1nRG2g6bEVB2RJSGLuyOAIazkpALePDoGJ2cewYMHf1LzsQOUf?=
 =?us-ascii?Q?VedQEMX5kcqdudbxpHE/GZPWGsP/dCHKZ3MhBkwQnkrqKiY8SF0bibu5MXus?=
 =?us-ascii?Q?F0gEVlh7dhbCy2r4BFx0fvWFyw35md/NvyhQX/B+XAwstR8OjhuE4A3XKt48?=
 =?us-ascii?Q?9VGEuTBmaJeB63uR13l9co1ECLo4E/Vv/Y7lCkmAJB5bbTPmuA9tdtEu4yBJ?=
 =?us-ascii?Q?xa/L/vFhveOxInvXnyT88Xz0gvwWEre9gaMOpkvXc/LdGzChIs+ONli6k8Lj?=
 =?us-ascii?Q?/sNbZRZq+nIvqSOyaUFC5xWVXJ+cE89fiQs/RJY8RWaLLNXXajqbgRfXUQNk?=
 =?us-ascii?Q?i2Uag6wjNhwLqciYuPhdvb9P+Z43YH3/WXb7Hd2ZMx86TkwoO0JD0aKFAJKN?=
 =?us-ascii?Q?ZO+jhdmu3GDjNkviufNlXUktUYeuW/Deg2P3v0SksafuimsMoCfHXiwMJA6x?=
 =?us-ascii?Q?hEPRExE+vDRS50Cx0jChV/n7A0ob1Pc0qdI94JVjOc8nOB4fppGxpT8Xrwfy?=
 =?us-ascii?Q?6hdtDBUrF9ZFxddagb5wLOLEi5CgTBO2LhGTYm+Idt0Ak2j47iYf/HGBWZk+?=
 =?us-ascii?Q?kR36P6Y0OfyXuIqtaustJfs9Atx3gn6aVliRw9U2J9wB+GQsGgtlabRUyQYp?=
 =?us-ascii?Q?dDtlHAOdPT3X6AhorgsgaJxzE6WU4vI12wazdskqsObRDe0ihkyMSnzQq0wW?=
 =?us-ascii?Q?Cl/heXX5x9hLT2v2DpoEOC1JNuJSAiCC3U6PkO6cNXECRRzonEGsHa0MSeoJ?=
 =?us-ascii?Q?gWciqeeS52vBrrBxatPLxyh7IpLDSTHZzLg9FUjYWuIdJDkYh2parhK3nXdg?=
 =?us-ascii?Q?kA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccde8327-4e8e-4eda-3684-08dcf1f17a92
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 16:57:42.6249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LyLOgoGjamNdx5Mo1Cz+94MdQ0yYUnP9zxS0nS8ndQmBubvW4ZMAvAlBZYrIbWnTSmoUEFJxbDBMD7SMiJ8ASQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB8904
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Oct 2024 16:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113080

Avoid following CMake failure which during do_configure stemming from
non-cross compile friendly condition check executed on a build host
which has /usr/share/upstart directory

  | CMake Error at src/CMakeLists.txt:550 (install):
  |   install DIRECTORY given unknown argument "/etc/fluent-bit/".

Also handle systemd init manager case more appropriately, so that it
works also when the build host does not have a /lib/systemd/system
directory.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 ...ts.txt-Revise-init-manager-deduction.patch | 41 +++++++++++++++++++
 ...able-installing-systemd-service-file.patch | 40 ------------------
 .../fluentbit/fluentbit_3.1.9.bb              |  9 +++-
 3 files changed, 49 insertions(+), 41 deletions(-)
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0003-CMake=
Lists.txt-Revise-init-manager-deduction.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0003-Disab=
le-installing-systemd-service-file.patch

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-CMakeLists.t=
xt-Revise-init-manager-deduction.patch b/meta-oe/recipes-extended/fluentbit=
/fluentbit/0003-CMakeLists.txt-Revise-init-manager-deduction.patch
new file mode 100644
index 0000000000..5105444dc0
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-CMakeLists.txt-Revi=
se-init-manager-deduction.patch
@@ -0,0 +1,41 @@
+From c9969cc46e5e4d58db28c89b22bebe42d9f96962 Mon Sep 17 00:00:00 2001
+From: Niko Mauno <niko.mauno@vaisala.com>
+Date: Mon, 21 Oct 2024 16:02:46 +0000
+Subject: [PATCH] CMakeLists.txt: Revise init manager deduction
+
+The init manager deduction is not cross-compile friendly, so replace
+the host specific condition checks with placeholders that can be
+replaced in Yocto recipe.
+
+Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
+
+Upstream-Status: Inappropriate [configuration]
+---
+ src/CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 084f2c57d..f0f35f00b 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -532,7 +532,7 @@ if(FLB_BINARY)
+     set(SYSTEMD_UNITDIR  /lib/systemd/system)
+   endif()
+=20
+-  if(SYSTEMD_UNITDIR)
++  if(@INIT_MANAGER_IS_SYSTEMD@)
+     set(FLB_SYSTEMD_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.se=
rvice")
+     configure_file(
+       "${PROJECT_SOURCE_DIR}/init/systemd.in"
+@@ -540,7 +540,7 @@ if(FLB_BINARY)
+       )
+     install(FILES ${FLB_SYSTEMD_SCRIPT} COMPONENT binary DESTINATION ${SY=
STEMD_UNITDIR})
+     install(DIRECTORY DESTINATION ${FLB_INSTALL_CONFDIR} COMPONENT binary=
)
+-  elseif(IS_DIRECTORY /usr/share/upstart)
++  elseif(@INIT_MANAGER_IS_UPSTART@)
+     set(FLB_UPSTART_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.co=
nf")
+     configure_file(
+       "${PROJECT_SOURCE_DIR}/init/upstart.in"
+--=20
+2.39.2
+
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-Disable-inst=
alling-systemd-service-file.patch b/meta-oe/recipes-extended/fluentbit/flue=
ntbit/0003-Disable-installing-systemd-service-file.patch
deleted file mode 100644
index 36a0092ba8..0000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-Disable-installing-=
systemd-service-file.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From c3b891eeec691753fccdf8e0a4541dcba244ec6b Mon Sep 17 00:00:00 2001
-From: Niko Mauno <niko.mauno@vaisala.com>
-Date: Thu, 10 Oct 2024 11:06:07 +0300
-Subject: [PATCH] Disable installing systemd service file
-
-With this we avoid the the following BitBake error when using some
-other init manager than SystemD:
-
-  ERROR: fluentbit-3.1.9-r0 do_package: QA Issue: fluentbit: Files/directo=
ries were installed but not shipped in any package:
-    /lib
-    /lib/systemd
-    /lib/systemd/system
-    /lib/systemd/system/fluent-bit.service
-  Please set FILES such that these items are packaged. Alternatively if th=
ey are unneeded, avoid installing them or delete them within do_install.
-  fluentbit: 4 installed and not shipped files. [installed-vs-shipped]
-  ERROR: fluentbit-3.1.9-r0 do_package: Fatal QA errors were found, failin=
g task.
-
-Upstream-Status: Inappropriate [hack]
-
-Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
----
- src/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index e24666484..c102806d0 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -534,7 +534,7 @@ if(FLB_BINARY)
-     set(SYSTEMD_UNITDIR  /lib/systemd/system)
-   endif()
-=20
--  if(SYSTEMD_UNITDIR)
-+  if(FALSE)
-     set(FLB_SYSTEMD_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.se=
rvice")
-     configure_file(
-       "${PROJECT_SOURCE_DIR}/init/systemd.in"
---=20
-2.39.2
-
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb b/meta-o=
e/recipes-extended/fluentbit/fluentbit_3.1.9.bb
index fc67236d3e..f96e1a7edc 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
@@ -22,7 +22,7 @@ SRC_URI =3D "\
     git://github.com/fluent/fluent-bit.git;branch=3D3.1;protocol=3Dhttps \
     file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch=
 \
     file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch=
 \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0003-Di=
sable-installing-systemd-service-file.patch', d)} \
+    file://0003-CMakeLists.txt-Revise-init-manager-deduction.patch \
 "
 SRC_URI:append:libc-musl =3D "\
     file://0004-chunkio-Link-with-fts-library-with-musl.patch \
@@ -116,6 +116,13 @@ EXTRA_OECMAKE:append:riscv32 =3D " -DCMAKE_C_STANDARD_=
LIBRARIES=3D-latomic"
 EXTRA_OECMAKE:append:riscv64 =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-latomic=
"
 EXTRA_OECMAKE:append:x86 =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-latomic"
=20
+do_configure:prepend() {
+    sed -i \
+        -e 's#@INIT_MANAGER_IS_SYSTEMD@#'${@'TRUE' if d.getVar('INIT_MANAG=
ER') =3D=3D 'systemd' else 'FALSE'}'#' \
+        -e 's#@INIT_MANAGER_IS_UPSTART@#'${@'TRUE' if d.getVar('INIT_MANAG=
ER') =3D=3D 'upstart' else 'FALSE'}'#' \
+        ${S}/src/CMakeLists.txt
+}
+
 # flex hardcodes the input file in #line directives leading to TMPDIR cont=
amination of debug sources.
 do_compile:append() {
     find ${B} -name '*.c' -or -name '*.h' | xargs sed -i -e 's|${TMPDIR}|$=
{TARGET_DBGSRC_DIR}/|g'
--=20
2.39.2


