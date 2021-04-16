Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.44])
 by mx.groups.io with SMTP id smtpd.web12.10885.1618587430405850621
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Apr 2021 08:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ee+VVbr/;
 spf=pass (domain: windriver.com, ip: 40.107.243.44, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZipkzx/+nXAbT/n7O9t/QnYXQbtzDh2pz49XiD7XapHmi6un3SkuaQ+IqZvN6GvSmhLF93Ct5+HQs1C/YKj9+FJffrXrPm73K6E3rcMbmRnH5VAeWCPrvoW3XUKx4IBTOWp1hAu8wG5OtIBCU+ghz8GA5m6X5D0QEE8rR3pdEPc7drqQ+KZ0tAK8OQT5XV3uPFkFON/IrWkcj0JKZBgau8cU7WUGKzzoKKRSAbb1xkPmOJGBV4L8kY1l22zICMOOmUVaXZFCPCWzKQFy5erhihV9UI1D9xfyCPwrssnJNT1xTgvFxRvl5S8wr8ZDL4PNYQk8UqVrLiylODDIpcieA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LONGkXvzn0Wln7lAIXRb9paKk9Yoo5yymdiqf1ZDTQ8=;
 b=IFuOXd+pikSU9Gl1E9N8dC8/DGQ0lcUoECwUCoRWFZYgNTINxNH+fkS5SnJngw2wSpKe3HFNtXeA9NkW1aXDR1nKUWsbCd+21PSnY5EH/DExTqm7C18UlNlK2fD4kQi6of+bNXW1oMR3Mg9czczL5TcyQz7WVKwnZyyabyCoC5sEgv5L6gRG0HOQJFQGv6P9Wa3KYFL+U6PpmN0y0igpsdl+dDkMyFWCjBYlu8uEROIZykjzz5Ggdt4uOU3jdz8K5I+Doj0SVVdTM8nOgDySshdRT4IGdGrp3lfztXaZQ6OXQvDUlEj6BybVqOfaO9riHMtiwo7ukQH/ca5ev6Pxjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LONGkXvzn0Wln7lAIXRb9paKk9Yoo5yymdiqf1ZDTQ8=;
 b=ee+VVbr/lONOrCsz05Ugh6r6/GysLs4yn+KHgOWMCyN3KgcVzx/tH8QJS8P4HaqaBNEVVQ2jAkiESaB2K3CjwOVh/5ZYYoTiUCe6+8Yv1swrNjPXrnAbredDSTDKu1kYUxJWuOrHu63izLER08R+dn0yo9sebpW9tTIsY0FlUTM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA0PR11MB4640.namprd11.prod.outlook.com (2603:10b6:806:9b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Fri, 16 Apr
 2021 15:37:09 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%9]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 15:37:09 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] syslog-ng: remove CONFIG_TLS override for arm DEBUG_BUILD
Date: Fri, 16 Apr 2021 11:36:48 -0400
Message-ID: <20210416153648.25192-2-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210416153648.25192-1-yifan.yu@windriver.com>
References: <20210416153648.25192-1-yifan.yu@windriver.com>
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: MN2PR17CA0009.namprd17.prod.outlook.com
 (2603:10b6:208:15e::22) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by MN2PR17CA0009.namprd17.prod.outlook.com (2603:10b6:208:15e::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 15:37:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 109ac2f4-66ff-4fc3-2137-08d900ed7f37
X-MS-TrafficTypeDiagnostic: SA0PR11MB4640:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB464048AA7B40D2B56E96617A804C9@SA0PR11MB4640.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Pd65CY82R7ZQxk8/N1uYqCEPnzqGtB+9kmiXH6PeOj/zvh4kpSJgDyo9zNsvVp7dx2CLUQNyQXsw28jnSW2GYI2ZzpeTaIyxZpNI18XC39qx1flPCadyepsv65yczaQ/3Ppm06/nkSDIkzG7Ap6FOnfmd58ASBlq35GF36ZF7Q6hKg72V8NNy06TiXZN56Hbyp/Jf4JOhdof88xS+mQmDm88MiDruy77+heHeSIav/wjobJ3t0sTWFLbl20Ll0P75GmQB0l43+g/fCDTcuha0bV2829FqTQ5LPcjYQNjOLMZaRV5SFeE79j9ZW92Yns+PqU2vfgbJ+G+cUl58fm2mdVi+Vkw5IArFunJItfXLa5HDURlSF20pb9i1g7YuVXKOSYh3uLOd6j27ktNSvtrQMKozWwRQ8XACZiXRz78o1bi2BNpToJHDY+HgM+WOYLHfiZl3isFeE1AA4K5ZIN/jVuGK40P5jR9TopzCY3/yLBpujWAZU+mcHPCAv3BXxtkAMbC3r2JTU75d7ROfSU6T743bUCScAyA+gt82eYoP1l/OOwTUTodwrSfLgIbXeGvmsYPnYa+9eimnVn2s3cTLKk2/LfSOu27ocvUfaJ+tE4cChF3JiKfavE6YqNSB6bZrm8HfcwsM/mp/VIxm2bNKn9Z39P+yxt5XEPQj1HRytXt93QX8KgCm9GrDFK5rqYx8HwymaYscF//bRIR2I/D+gI1R6ULDTjZYJS9P0wtWaA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(346002)(366004)(136003)(396003)(66556008)(16526019)(52116002)(8936002)(66476007)(38350700002)(36756003)(6506007)(86362001)(5660300002)(956004)(66946007)(2906002)(6512007)(6666004)(316002)(83380400001)(2616005)(186003)(478600001)(26005)(1076003)(6916009)(6486002)(8676002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?/vdXJxmHXHVgFpxpWCar6X6Xc4MVDCsMfOis3nwOYRF/hqZ9Ql9SQf9AYn6D?=
 =?us-ascii?Q?FBCnwAVknLFYa7MzPha6rB6aoqgJZu5MG+24GNjpBxfq8e9xg4VFrT+jGW7i?=
 =?us-ascii?Q?Qk0eed4M+Zfcb5H8LZQPwwpKl3LeiJXFRmTAwPTr+qOG42a+ksk4/LegREzL?=
 =?us-ascii?Q?pmCHJaUdvqRlHWY5tQryS64ISdiBBWE6m8bqniBvZw8yCWPHxbl/FrUkJHIr?=
 =?us-ascii?Q?qyA6fI2l7gVDkOQ24C3MzABKa3MJOFUezpL/Qt5q6ntBbHSEvHe9qqJNihV5?=
 =?us-ascii?Q?yJMO//PBfxpJpSfB1C30JtFWuOHK/dAFONrmio3fLB5CftDIY2QJLlaWeaR/?=
 =?us-ascii?Q?9c4rcHpUOQpq0yNuzElnRBIHXu1IoNaXOLchkesV4UQ+rtLp3INo0ItRSfLe?=
 =?us-ascii?Q?n9YB9xBbvtrcQQ1Aktl7Lp9Ncs5Gswrrwl/Ax0isdoupqGX2WLC5xr0pnrcj?=
 =?us-ascii?Q?vO7TUNZpiooj+SczOk1/MjZRcMNtY9fWEUUF4gSImPWVYkHIYNv+xTrbIQHy?=
 =?us-ascii?Q?mR28ifuAsCTmrs3AdkS7Xlw6mTpV1UFglEISSD/Yri8sVlqgAJvT0GwFvhGJ?=
 =?us-ascii?Q?stBdGOuvFdJ5dt5hH6iHbPZmQ7jSoXw3J4e3uKv4X03+uMc+qLBI3dhhgZBE?=
 =?us-ascii?Q?xJuVtNEA0nrMQbXwjwSS+LX1GDEr+PFY5YORe/P4uFCVaBMm7uQ5/zDv85Uq?=
 =?us-ascii?Q?yLMCmHDH2JY88B+1ycu49KQC2oEHVH2iLLBpEBSHTd1h49ZclF6RyTJv6q2c?=
 =?us-ascii?Q?hXLYIWvdl7MrD1H7wBc1/eEFaAEwAOWT+kq+Lgt7Dk6xAZzN4P1ih7cqI2uZ?=
 =?us-ascii?Q?Equ7/T38DJAFDC7akXfH2KqWRJ8ljGic1zODyLvlTSwmNDPy89Px0Lnem83O?=
 =?us-ascii?Q?haG2XeT/eak6IhF/Y648obqhJ1sIgACu4Ci9+tM/5+wX2yNt8Cj2PHTiE2Mq?=
 =?us-ascii?Q?mwF4fa8yiI3CSqcgFQfvKyJ8GU7X0f8mfn5ELawR1Grd/uW8Jl8F/WpLusti?=
 =?us-ascii?Q?9iEAQQHZU8uFpf/hKraRQTBV3xFfxZ7aZ5+8wT8AoBlFX5qp8tFVFBPXiXT+?=
 =?us-ascii?Q?DR39j8Kvct+YGNSLdFh4W6xXxMw4p4sxbc4TDyF36u7F35QuIo+MzBvOTMmo?=
 =?us-ascii?Q?irjnIbk+f+7E3zeussxWP6KWaTvL90mwG+rnwt6VVFUwxCzbtwXQ9eYKIjKL?=
 =?us-ascii?Q?quMjq/Cup8Bwm0v9UL2r7ei2ptWCXyu16VS5OYD0e3YE743kzjUJ80EN5Kt2?=
 =?us-ascii?Q?1WK5hvJHoS2ikDkOn7gxt1XfLNfOkpyanh3Ma6CSlk+ZidI/YNPigYsBEaoP?=
 =?us-ascii?Q?/G2gVSGZhoa4wGEnGUVW+F+R?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 109ac2f4-66ff-4fc3-2137-08d900ed7f37
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 15:37:09.2399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQp/FwiN/e1EpNufbZ7MZNHu80gXvdyf1i4K1WdXoBXPWOf34xY9girQFRd+Z4y+O39GVhYWFzBsb8r5e2yv7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4640
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

when enabling DEBUG_BUILD, an assembler failure used to be seen.
But this patch was in meta-oe c0ce7599, dating in 2014...

Cannot reproduce the failure anymore with qemuarm.

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 ...-option-enable-thread-tls-to-manage-.patch | 63 -------------------
 .../recipes-support/syslog-ng/syslog-ng.inc   |  5 --
 2 files changed, 68 deletions(-)
 delete mode 100644 meta-oe/recipes-support/syslog-ng/files/configure.ac-ad=
d-option-enable-thread-tls-to-manage-.patch

diff --git a/meta-oe/recipes-support/syslog-ng/files/configure.ac-add-optio=
n-enable-thread-tls-to-manage-.patch b/meta-oe/recipes-support/syslog-ng/fi=
les/configure.ac-add-option-enable-thread-tls-to-manage-.patch
deleted file mode 100644
index ff35fb157..000000000
--- a/meta-oe/recipes-support/syslog-ng/files/configure.ac-add-option-enabl=
e-thread-tls-to-manage-.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 15a90fd9ac1396015340e599e26d7cd193898fb8 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 12 Aug 2014 14:26:13 +0800
-Subject: [PATCH] configure.ac: add option --enable-thread-tls to manage th=
read
- ssl support
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-The thread local storage caused arm-gcc broken while compiling            =
              =E2=94=82
-syslog-ng with option '-g -O'.                                            =
              =E2=94=82
-...                                                                       =
              =E2=94=82
-dnscache.s: Assembler messages:                                           =
              =E2=94=82
-dnscache.s:100: Error: invalid operands (.text and *UND* sections) for `-'=
              =E2=94=82
-...                                                                       =
              =E2=94=82
-                                                                          =
              =E2=94=82
-Add option --enable-thread-tls to manage the including of thread
-local storage, so we could explicitly disable it.
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
-change default to 'yes'
-Upstream-Status: Submitted [https://github.com/syslog-ng/syslog-ng/pull/36=
49]
-
-Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
----
- configure.ac | 16 ++++++++++------
- 1 file changed, 10 insertions(+), 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1d67e81..7aad75f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -210,6 +210,8 @@ AC_ARG_WITH(sanitizer,
-               [  --with-sanitizer=3D[address/undefined/etc...]
-                                          Enables compiler sanitizer suppo=
rts (default: no)]
-               ,,with_sanitizer=3D"no")
-+AC_ARG_ENABLE(thread-tls,
-+              [  --enable-thread-tls        Enable Thread Local Storage s=
upport (default: yes)],,enable_thread_tls=3D"yes")
-=20
- AC_ARG_ENABLE(dynamic-linking,
-               [  --enable-dynamic-linking        Link everything dynamica=
lly.],,enable_dynamic_linking=3D"auto")
-@@ -628,12 +630,14 @@ dnl ************************************************=
***************************
- dnl Is the __thread keyword available?
- dnl *********************************************************************=
******
-=20
--AC_LINK_IFELSE([AC_LANG_PROGRAM(
--[[#include <pthread.h>
--__thread int a;
--]],
--[a=3D0;])],
--[ac_cv_have_tls=3Dyes; AC_DEFINE_UNQUOTED(HAVE_THREAD_KEYWORD, 1, "Whethe=
r Thread Local Storage is supported by the system")])
-+if test "x$enable_thread_tls" =3D "xyes"; then
-+    AC_LINK_IFELSE([AC_LANG_PROGRAM(
-+    [[#include <pthread.h>
-+    __thread int a;
-+    ]],
-+    [a=3D0;])],
-+    [ac_cv_have_tls=3Dyes; AC_DEFINE_UNQUOTED(HAVE_THREAD_KEYWORD, 1, "Wh=
ether Thread Local Storage is supported by the system")])
-+fi
-=20
- dnl *********************************************************************=
******
- dnl How to do static linking?
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/reci=
pes-support/syslog-ng/syslog-ng.inc
index ebb3eaf0f..e48e5d5e2 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -22,7 +22,6 @@ SRC_URI =3D "https://github.com/balabit/syslog-ng/release=
s/download/${BP}/${BP}.ta
            file://syslog-ng.conf.sysvinit \
            file://initscript \
            file://volatiles.03_syslog-ng \
-           file://configure.ac-add-option-enable-thread-tls-to-manage-.pat=
ch \
 "
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/balabit/syslog-ng/releases"
@@ -42,12 +41,8 @@ EXTRA_OECONF =3D " \
     --disable-python \
     --disable-java --disable-java-modules \
     --with-pidfile-dir=3D${localstatedir}/run/${BPN} \
-    ${CONFIG_TLS} \
 "
=20
-CONFIG_TLS =3D "--enable-thread-tls"
-CONFIG_TLS_arm =3D "${@oe.utils.conditional( "DEBUG_BUILD", "1", " --disab=
le-thread-tls", " --enable-thread-tls", d )}"
-
 PACKAGECONFIG ??=3D " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)} \
 "
--=20
2.29.2

