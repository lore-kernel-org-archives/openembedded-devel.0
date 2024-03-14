Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D24DC54E60
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 19:43:42 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.134])
 by mx.groups.io with SMTP id smtpd.web10.2182.1710445415852466504
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Mar 2024 12:43:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=ohfYCKgd;
 spf=pass (domain: navimatix.de, ip: 40.107.104.134, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ri7QP6xG5mlZiHEkyz1cJH2tX4msVXVfbHw/uuTpuIHsOexe/M+C6KTUodR86HpNMR10LfieSjGBMmrqo5uF31qmOAJcIla+78AGPnljSAWlb9cj1dZVFH3ZNtsnb4Ta0PVo3fh4bQYpoOCnhmKEp37pVO6RStaTg2QjIDY/VQkxT0YHVC+E0sWRowTCItQebuIYxXPj4obV2kPZnZLITbbkYygD86E9TgQGPEICuIwT5LbgA/tb9eB0g9nBen23IlhR0d9HQrygHXduS2u2ecRxZPm+ywOkGIXdOx+mRfrudjtlkU5yhoU88TngcLAxor5k6/zG1Y76md4XSyhyxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIhwL7fAWzSePLoHHS4LEYgJ3vIbXKd3i/7y8bmmV0c=;
 b=Z8M+KxyZ2TmlY/F9i4cMF7SWsQvP+UovnxnIqgi1qxqkmZBxAaond1kFD4ci2Ig8XU/RAYJNM8A6YJg7yDrIqXYQDwuRhZstudFhAPKpbXqkMSRdFreskl91R1W9a6dKVYG+EtWhUHJ/IDQy7SAdobPlN+Kk7yWYaD1gcnBJIv4o69LP60flA7bhviNL9U77CYRIM00JMI1adYqeNXf9d2pkOUyPACh4yScy2UnXrJ1sjxVNLaX5LXuZWhUNGBIkLcsQqFKJcW+jV8KbicTzHWZE/Hcw54i/kaVdqXXBYgV/xynbn54SWwsCbTk/k8YicJDQn8HPGndw54ECVwdQ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIhwL7fAWzSePLoHHS4LEYgJ3vIbXKd3i/7y8bmmV0c=;
 b=ohfYCKgdgCUehxru6P1zMuRRUkcuLxjn4mZ/NPai7nUHrcQf6cJ3iOtVGPX4y7BU+R1Nwx98d559sJ6bUbrQSoCZqxwbsSNG1C/B6tEBQrpDRcSODxUWatLUEqGDCrvT/7XCi8TCmNp/ruPq1yy4fIhOZLGsBw9OVN6i8DHZbwg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
 (2603:10a6:8:7::20) by VI1PR01MB7135.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:17d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Thu, 14 Mar
 2024 19:43:30 +0000
Received: from DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
 ([fe80::25b0:e60e:c5dc:54f5]) by
 DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
 ([fe80::25b0:e60e:c5dc:54f5%6]) with mapi id 15.20.7362.035; Thu, 14 Mar 2024
 19:43:30 +0000
From: joerg.sommer@navimatix.de
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [meta-multimedia][PATCH v2] spandsp: new telephony DSP library
Date: Thu, 14 Mar 2024 20:43:17 +0100
Message-ID: <0afe6e7d5c9f3de0c3b82a646236bb9bbbe8210f.1710445397.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:22::8) To DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
 (2603:10a6:8:7::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0102MB3658:EE_|VI1PR01MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: 22e907a2-b1ca-496d-c28b-08dc445f0666
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KIRv7vnqNs4ZjcLGrCM0C8X1JLC2WhspQ+uOamfNKAwc6ao83rYbkAzl6HUr17XSjmoqvTgjG+GgEiUp1OaecaE+XpBtzrqDBJjO9P2x/yBA+l1fthPgbY2aXBd3zHaNCf0ilaZYeLKkf0sFMh6yjPzp2di3P57c3iiZYE2+11Oda1bjVBunqgQFulWghrf7nHCa/rSzaY1x3bSmmKm+7GwEZrjcQXwDOIeXxqOqCuMJcXI38XRHMyp34NrRl81GLM91D+6nQPxfv/hzLh45jAMPK4Ji9CGT7RxrsZXjFKM9iAjp0ODM5teQB4V4S4fFfhQj8Iv3MhUIsrtQF4te7fbI8z6pPGxiHIKtx3UkQBifkJWHi8f83c1hGGZM/d27zoBVLBmqtjlhj/rYo4zZqv/36N1MbDghMDPAq8i6JnJjBNbIYOnetn21N5/hdiZbC9s79v4MI2NWOJFgNSUIijLupZu+R7id8o+yXLRL9JdZFAUQeEuzDaUizgoJ42sSriVOHiiw1+xMrvWqI5q+2nCD4N8aojC3+Id8EG++4URCgRN+54gS9XZfhbNT541fv0yJBdqEyKtky0KE3Wjfa3V69FHt0UzPV2K/eHdD5jqQanyXZvdDU21yIU4kskUw8waqKTbbK5vUf0ALgcltYhTGakLoE81ONGpl9bMEa/A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0102MB3658.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?F0qBIknuwcvVYDP0cP8XbjGOXEiagLyNv7r50q5gxhf/oXJF8kWipg37va76?=
 =?us-ascii?Q?ao0Sv08IH5T/AagrdO28Yf6rhuXGCkVQ2bIBivZd+FO4zDLEmryHJDU5d2cj?=
 =?us-ascii?Q?o829z8nDu4CI44nrgC56wpkO/e6ZfDJcBraP0GU8T7JGyYzlksFsqV3Gm4gK?=
 =?us-ascii?Q?iiKPqeQmrImdADJGxLK/swubMeunZIEt3M1ssujsuidyGGYyA0+Ew4SK4LJI?=
 =?us-ascii?Q?keengWSCsSTt2w/Bj1sktKvmnyQs6rfFEe37iTZHsS7SaC9hf2nAnJE2d2oL?=
 =?us-ascii?Q?cFyVq4qBk8VDchuVshwKyhcFE8OOOhNiSxA+oZUdZ6gN4jW11QeGUuKsjAMX?=
 =?us-ascii?Q?4zqPY3ba93xzVXfSF3jkUM/Z2TmJsvtvbq+m9wBgulX7ymE17dXqQIS3TiNk?=
 =?us-ascii?Q?NLVaQcGooySXjv1AaaR2YM3eyEK6QXW+BEGLffW4CPsgumeO69x0anr0u8l6?=
 =?us-ascii?Q?KQ0BAoHBW1obUkswDAHbr42KkKqtgxdhb1R2Xhv96ctdetZNCo/boXVRMeds?=
 =?us-ascii?Q?v/AcjupaKl44OLfgbeBC9s92wG8UdFz6KnUA+od+GRsGYCPcL54T/7KUcIC9?=
 =?us-ascii?Q?tQiCqEDo1FQMI8FdUCxUn0U6MvN6ZZ7AzdNyAx7q/N3Sf5WIjERov9xll9e5?=
 =?us-ascii?Q?j5bktY9Ho2OPi28Ro3XYUb6Ffa8h8qXchCE9QMdPehirt9TvGxZKcr4L8YV+?=
 =?us-ascii?Q?Jf9ysp9oAQKI/Z14HEwTHo2RbYPNw65xcWSwUKuDSaniu795Oc5iPuOLxg2/?=
 =?us-ascii?Q?T6eUcnA0V47wXZKMqTfzGg5OMROFaIuhrOpVgDatNUfb5LJMy6FGuAWwC87e?=
 =?us-ascii?Q?Ht8LdEVA+Q8t3+AbYab8JBLQ/mBYW9OMsIbUlcIUvhzxzCKCwpeBW0OCvzxk?=
 =?us-ascii?Q?PH5SoEpiWnXOJEB1imUbIssN5RX7REFpyb1UeiUsxlGhLq23OR7ve5UGH/AL?=
 =?us-ascii?Q?u2t9GzhXK4mqATuFaMLI2K3Oqukcj0ICU/G70RmLRknPJkPk4oEWVcov4sCq?=
 =?us-ascii?Q?ZwdT92zNS2B6A8Bmgoh1tQ3Dje2bD7o+7gt2ViSGhvOInhYJ6WVhYllFGiyA?=
 =?us-ascii?Q?yKUG7ZfE7lJ2fThoTiJ/iutWml5oThLgIkhTN2Qt/I+qjH8BmkFvYFvaJJEu?=
 =?us-ascii?Q?2cwgaqOfX/0IaXq0xF+s4KgZf8pXcnAsbJtPzpjrajbrTHz+AZgbt1nCN5/O?=
 =?us-ascii?Q?w4VfBfGZB9Bk2/eJruit6upY/Jeg9ssrGW6vLgfWNHs3iR/iNMQOddYFIpyi?=
 =?us-ascii?Q?PkUA6oDNGn5ooZP9VZcUcsD4nRQuKoxMPD0djN+Y+qvrUY4bHWuG2ZwiYZ8h?=
 =?us-ascii?Q?BWMmGcLNpk8DETzXkJya4jOud8TpqXU3Y26oLrFAYMu2usKbA2y9jy7igF5Q?=
 =?us-ascii?Q?8CihPywnWUNplzMa3wJR5oydjWIHDHTPZoJs5XocefYk7G96m1jb3m3X1SO3?=
 =?us-ascii?Q?wwLOSb/CfHErc2qGeF6aA+e67b2NeYqHDwcv1WAeFdLtMYBdqJIwmnrPZa+y?=
 =?us-ascii?Q?M1Dx0MkMV6fR2kErJR3NCCm1u7/Iswbpsz9MvMv5s/RzchsV8jv8GgJrAKmB?=
 =?us-ascii?Q?ThNjfbr2gVzZx4oUYzW4n5+A+zTOL2adFSixgZ324jBXXT1o7zjtFW1ylbm7?=
 =?us-ascii?Q?PA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 22e907a2-b1ca-496d-c28b-08dc445f0666
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 19:43:30.3764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XYl0aeUc99mHNms9e/LjrDKw6L61oc4tO3osBFTp8MWgs4RwUhwGG8EiEvEZT68GjUdkZG3zTjRtx4xY4pRldHDivwzla8lzpwTB8+7JE2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR01MB7135
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 19:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109321

From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 .../spandsp/spandsp/configure.patch           |  56 ++++++
 .../spandsp/spandsp/makefile.patch            | 161 ++++++++++++++++++
 .../recipes-multimedia/spandsp/spandsp_git.bb |  47 +++++
 3 files changed, 264 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/spandsp/spandsp/conf=
igure.patch
 create mode 100644 meta-multimedia/recipes-multimedia/spandsp/spandsp/make=
file.patch
 create mode 100644 meta-multimedia/recipes-multimedia/spandsp/spandsp_git.=
bb

diff --git a/meta-multimedia/recipes-multimedia/spandsp/spandsp/configure.p=
atch b/meta-multimedia/recipes-multimedia/spandsp/spandsp/configure.patch
new file mode 100644
index 000000000..af504be76
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/spandsp/spandsp/configure.patch
@@ -0,0 +1,56 @@
+From: =3D?UTF-8?q?J=3DC3=3DB6rg=3D20Sommer?=3D <joerg.sommer@navimatix.de>
+Date: Thu, 14 Mar 2024 09:41:57 +0100
+Subject: [PATCH 2/2] configure: Replace manual search for libxml by
+ AC_CHECK_LIB
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The manual search fails if the include directories (and build environment)
+are located somewhere else.
+
+Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
+Upstream-Status: Submitted [https://github.com/freeswitch/spandsp/pull/74]
+---
+
+ERROR: spandsp-3.0.0+git-r0 do_configure: QA Issue: This autoconf log indi=
cates errors, it looked at host include and/or library paths while determin=
ing system capabilities.
+
+ configure.ac | 22 +++++-----------------
+ 1 file changed, 5 insertions(+), 17 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2140837..b5138d6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -185,23 +185,11 @@ then
+ fi
+=20
+ # Determine XML2 include path
+-AC_MSG_CHECKING(for libxml/xmlmemory.h)
+-
+-# Can we include headers using system include dirs?
+-AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include <libxml/xmlmemory.h>]], [[i=
nt a =3D 1;]])],[XML2_INCLUDE=3D" "],[XML2_INCLUDE=3D])
+-
+-# Hunt through several possible directories to find the includes for libx=
ml2
+-if test "x$XML2_INCLUDE" =3D "x"; then
+-    old_CPPFLAGS=3D"$CPPFLAGS"
+-    for i in $xml2_include_dir /usr/include /usr/local/include /usr/inclu=
de/libxml2 /usr/local/include/libxml2 ; do
+-        CPPFLAGS=3D"$old_CPPFLAGS -I$i"
+-        AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include <libxml/xmlmemory.h=
>]], [[int a =3D 1;]])],[XML2_INCLUDE=3D"-I$i"],[XML2_INCLUDE=3D
+-        ])
+-        if test "x$XML2_INCLUDE" !=3D "x"; then
+-            break;
+-        fi
+-    done
+-    CPPFLAGS=3D"$old_CPPFLAGS $XML2_INCLUDE"
++AC_CHECK_LIB([xml2], [xmlParseFile], [libxml2_found=3Dyes])
++if test "$libxml2_found" =3D "yes" ; then
++    AC_DEFINE(HAVE_LIBXML2,1,[defined when libxml2 is available])
++else
++    AC_MSG_WARN([libxml2 not found. Disabling cache.])
+ fi
+=20
+ AC_CHECK_HEADERS([libxml/xmlmemory.h])
+--=20
+2.34.1
+
diff --git a/meta-multimedia/recipes-multimedia/spandsp/spandsp/makefile.pa=
tch b/meta-multimedia/recipes-multimedia/spandsp/spandsp/makefile.patch
new file mode 100644
index 000000000..d3eb047fe
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/spandsp/spandsp/makefile.patch
@@ -0,0 +1,161 @@
+From: =3D?UTF-8?q?J=3DC3=3DB6rg=3D20Sommer?=3D <joerg.sommer@navimatix.de>
+Date: Thu, 14 Mar 2024 08:08:13 +0100
+Subject: [PATCH 1/2] configure: Use AX_PROG_CC_FOR_BUILD for cross compili=
ng
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The macro AX_PROG_CC_FOR_BUILD [1] sets the variables CC_FOR_BUILD and
+..._FLAGS_FOR_BUILD they can be used [2] to build binaries used at compile
+time.
+
+[1]: https://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.ht=
ml
+[2]: https://stackoverflow.com/questions/24201260/autotools-cross-compilat=
ion-and-generated-sources/24208587#24208587
+
+Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
+Upstream-Status: Submitted [https://github.com/freeswitch/spandsp/pull/74]
+---
+ configure.ac    | 49 +-------------------------------------------
+ src/Makefile.am | 54 +++++++++++++++++++++++++------------------------
+ 2 files changed, 29 insertions(+), 74 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 96fd022..2140837 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -55,54 +55,7 @@ AC_LANG([C])
+=20
+ AX_COMPILER_VENDOR
+=20
+-if test "${build}" !=3D "${host}"
+-then
+-    # If we are doing a Canadian Cross, in which the host and build syste=
ms
+-    # are not the same, we set reasonable default values for the tools.
+-
+-    CC_FOR_BUILD=3D${CC_FOR_BUILD-gcc}
+-    CPPFLAGS_FOR_BUILD=3D"\$(CPPFLAGS)"
+-    CC=3D${CC-${host_alias}-gcc}
+-    CFLAGS=3D${CFLAGS-"-g -O2"}
+-    CXX=3D${CXX-${host_alias}-c++}
+-    CXXFLAGS=3D${CXXFLAGS-"-g -O2"}
+-else
+-    # Set reasonable default values for some tools even if not Canadian.
+-    # Of course, these are different reasonable default values, originall=
y
+-    # specified directly in the Makefile.
+-    # We don't export, so that autoconf can do its job.
+-    # Note that all these settings are above the fragment inclusion point
+-    # in Makefile.in, so can still be overridden by fragments.
+-    # This is all going to change when we autoconfiscate...
+-    CC_FOR_BUILD=3D"\$(CC)"
+-    CPPFLAGS_FOR_BUILD=3D"\$(CPPFLAGS)"
+-    AC_PROG_CC
+-
+-    # We must set the default linker to the linker used by gcc for the co=
rrect
+-    # operation of libtool.  If LD is not defined and we are using gcc, t=
ry to
+-    # set the LD default to the ld used by gcc.
+-    if test -z "$LD"
+-    then
+-        if test "$GCC" =3D yes
+-        then
+-            case $build in
+-            *-*-mingw*)
+-                gcc_prog_ld=3D`$CC -print-prog-name=3Dld 2>&1 | tr -d '\0=
15'` ;;
+-            *)
+-                gcc_prog_ld=3D`$CC -print-prog-name=3Dld 2>&1` ;;
+-            esac
+-            case $gcc_prog_ld in
+-            # Accept absolute paths.
+-            [[\\/]* | [A-Za-z]:[\\/]*)]
+-                LD=3D"$gcc_prog_ld" ;;
+-            esac
+-        fi
+-    fi
+-
+-    CXX=3D${CXX-"c++"}
+-    CFLAGS=3D${CFLAGS-"-g -O2"}
+-    CXXFLAGS=3D${CXXFLAGS-"-g -O2"}
+-fi
++AX_PROG_CC_FOR_BUILD
+=20
+ AC_DEFUN([REMOVE_FROM_VAR],[
+     new_val=3D""
+diff --git a/src/Makefile.am b/src/Makefile.am
+index e05fad5..9b409a1 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -386,44 +386,46 @@ noinst_HEADERS =3D cielab_luts.h \
+                  v34_tx_pre_emphasis_filters.h \
+                  v34_tables.h
+=20
+-make_at_dictionary$(EXEEXT): $(top_srcdir)/src/make_at_dictionary.c
+-	$(CC_FOR_BUILD) -o make_at_dictionary$(EXEEXT) $(top_srcdir)/src/make_at=
_dictionary.c -DHAVE_CONFIG_H -I$(top_builddir)/src
++LINK_FOR_BUILD.c =3D $(CC_FOR_BUILD) -DHAVE_CONFIG_H -I$(top_builddir)/sr=
c $(CFLAGS_FOR_BUILD) $(CPPFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD) $(TARGET_A=
RCH_FOR_BUILD)
+=20
+-make_cielab_luts$(EXEEXT): $(top_srcdir)/src/make_cielab_luts.c
+-	$(CC_FOR_BUILD) -o make_cielab_luts$(EXEEXT) $(top_srcdir)/src/make_ciel=
ab_luts.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
++make_at_dictionary$(BUILD_EXEEXT): $(top_srcdir)/src/make_at_dictionary.c
++	$(LINK_FOR_BUILD.c) -o $@ $^
+=20
+-make_math_fixed_tables$(EXEEXT): $(top_srcdir)/src/make_math_fixed_tables=
.c
+-	$(CC_FOR_BUILD) -o make_math_fixed_tables$(EXEEXT) $(top_srcdir)/src/mak=
e_math_fixed_tables.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
++make_cielab_luts$(BUILD_EXEEXT): $(top_srcdir)/src/make_cielab_luts.c
++	$(LINK_FOR_BUILD.c) -o $@ $^ -lm
+=20
+-make_modem_filter$(EXEEXT): $(top_srcdir)/src/make_modem_filter.c $(top_s=
rcdir)/src/filter_tools.c
+-	$(CC_FOR_BUILD) -o make_modem_filter$(EXEEXT) $(top_srcdir)/src/make_mod=
em_filter.c $(top_srcdir)/src/filter_tools.c -DHAVE_CONFIG_H -I$(top_buildd=
ir)/src -lm
++make_math_fixed_tables$(BUILD_EXEEXT): $(top_srcdir)/src/make_math_fixed_=
tables.c
++	$(LINK_FOR_BUILD.c) -o $@ $^ -lm
+=20
+-make_modem_godard_coefficients$(EXEEXT): $(top_srcdir)/src/make_modem_god=
ard_coefficients.c $(top_srcdir)/src/filter_tools.c
+-	$(CC_FOR_BUILD) -o make_modem_godard_coefficients$(EXEEXT) $(top_srcdir)=
/src/make_modem_godard_coefficients.c $(top_srcdir)/src/filter_tools.c -DHA=
VE_CONFIG_H -I$(top_builddir)/src -lm
++make_modem_filter$(BUILD_EXEEXT): $(top_srcdir)/src/make_modem_filter.c $=
(top_srcdir)/src/filter_tools.c
++	$(LINK_FOR_BUILD.c) -o $@ $^ -lm
+=20
+-make_t43_gray_code_tables$(EXEEXT): $(top_srcdir)/src/make_t43_gray_code_=
tables.c
+-	$(CC_FOR_BUILD) -o make_t43_gray_code_tables$(EXEEXT) $(top_srcdir)/src/=
make_t43_gray_code_tables.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
++make_modem_godard_coefficients$(BUILD_EXEEXT): $(top_srcdir)/src/make_mod=
em_godard_coefficients.c $(top_srcdir)/src/filter_tools.c
++	$(LINK_FOR_BUILD.c) -o $@ $^ -lm
+=20
+-make_v17_v32_constellation_map$(EXEEXT): $(top_srcdir)/src/make_v17_v32_c=
onstellation_map.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c
+-	$(CC_FOR_BUILD) -o make_v17_v32_constellation_map$(EXEEXT) $(top_srcdir)=
/src/make_v17_v32_constellation_map.c $(top_srcdir)/src/g711.c $(top_srcdir=
)/src/alloc.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
++make_t43_gray_code_tables$(BUILD_EXEEXT): $(top_srcdir)/src/make_t43_gray=
_code_tables.c
++	$(LINK_FOR_BUILD.c) -o $@ $^ -lm
+=20
+-make_v17_v32_convolutional_encoder$(EXEEXT): $(top_srcdir)/src/make_v17_v=
32_convolutional_encoder.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc=
.c
+-	$(CC_FOR_BUILD) -o make_v17_v32_convolutional_encoder$(EXEEXT) $(top_src=
dir)/src/make_v17_v32_convolutional_encoder.c $(top_srcdir)/src/g711.c $(to=
p_srcdir)/src/alloc.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
++make_v17_v32_constellation_map$(BUILD_EXEEXT): $(top_srcdir)/src/make_v17=
_v32_constellation_map.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c
++	$(LINK_FOR_BUILD.c) -o $@ $^ -lm
+=20
+-make_v29_constellation_map$(EXEEXT): $(top_srcdir)/src/make_v29_constella=
tion_map.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c
+-	$(CC_FOR_BUILD) -o make_v29_constellation_map$(EXEEXT) $(top_srcdir)/src=
/make_v29_constellation_map.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/al=
loc.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
++make_v17_v32_convolutional_encoder$(BUILD_EXEEXT): $(top_srcdir)/src/make=
_v17_v32_convolutional_encoder.c $(top_srcdir)/src/g711.c $(top_srcdir)/src=
/alloc.c
++	$(LINK_FOR_BUILD.c) -o $@ $^ -lm
+=20
+-make_v34_convolutional_coders$(EXEEXT): $(top_srcdir)/src/make_v34_convol=
utional_coders.c
+-	$(CC_FOR_BUILD) -o make_v34_convolutional_coders$(EXEEXT) $(top_srcdir)/=
src/make_v34_convolutional_coders.c -DHAVE_CONFIG_H -I$(top_builddir)/src -=
lm
++make_v29_constellation_map$(BUILD_EXEEXT): $(top_srcdir)/src/make_v29_con=
stellation_map.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c
++	$(LINK_FOR_BUILD.c) -o $@ $^ -lm
+=20
+-make_v34_probe_signals$(EXEEXT): $(top_srcdir)/src/make_v34_probe_signals=
.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c
+-	$(CC_FOR_BUILD) -o make_v34_probe_signals$(EXEEXT) $(top_srcdir)/src/mak=
e_v34_probe_signals.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c -D=
HAVE_CONFIG_H -I$(top_builddir)/src -lm
++make_v34_convolutional_coders$(BUILD_EXEEXT): $(top_srcdir)/src/make_v34_=
convolutional_coders.c
++	$(LINK_FOR_BUILD.c) -o $@ $^ -lm
+=20
+-make_v34_shell_map$(EXEEXT): $(top_srcdir)/src/make_v34_shell_map.c
+-	$(CC_FOR_BUILD) -o make_v34_shell_map$(EXEEXT) $(top_srcdir)/src/make_v3=
4_shell_map.c -DHAVE_CONFIG_H -I$(top_builddir)/src
++make_v34_probe_signals$(BUILD_EXEEXT): $(top_srcdir)/src/make_v34_probe_s=
ignals.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c
++	$(LINK_FOR_BUILD.c) -o $@ $^ -I$(top_srcdir)/src -lm
+=20
+-make_v34_tx_pre_emphasis_filters$(EXEEXT): $(top_srcdir)/src/make_v34_tx_=
pre_emphasis_filters.c $(top_srcdir)/tools/meteor-engine.c
+-	$(CC_FOR_BUILD) -o make_v34_tx_pre_emphasis_filters$(EXEEXT) $(top_srcdi=
r)/src/make_v34_tx_pre_emphasis_filters.c $(top_srcdir)/tools/meteor-engine=
.c -DHAVE_CONFIG_H -I$(top_builddir)/src -I$(top_builddir)/tools -lm
++make_v34_shell_map$(BUILD_EXEEXT): $(top_srcdir)/src/make_v34_shell_map.c
++	$(LINK_FOR_BUILD.c) -o $@ $^
++
++make_v34_tx_pre_emphasis_filters$(BUILD_EXEEXT): $(top_srcdir)/src/make_v=
34_tx_pre_emphasis_filters.c $(top_srcdir)/tools/meteor-engine.c
++	$(LINK_FOR_BUILD.c) -o $@ $^ -I$(top_srcdir)/tools -lm
+=20
+ # We need to run make_at_dictionary, so it generates the
+ # at_interpreter_dictionary.h file
+--=20
+2.34.1
+
diff --git a/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb b/me=
ta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb
new file mode 100644
index 000000000..84bc4a8f1
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb
@@ -0,0 +1,47 @@
+SUMMARY =3D "A DSP library for telephony"
+DESCRIPTION =3D "\
+    SpanDSP is a low-level signal processing library that modulates and \
+    demodulates signals commonly used in telephony, such as the \"noise\" =
\
+    generated by a fax modem or DTMF touchpad. \
+"
+HOMEPAGE =3D "https://www.soft-switch.org/"
+BUGTRACKER =3D "https://github.com/freeswitch/spandsp/issues"
+SECTION =3D "libs"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8791c23ddf418deb5be264cffb5fa6b=
c"
+
+DEPENDS =3D "\
+    libxml2 \
+    tiff \
+    tiff-native \
+"
+
+PV =3D "3.0.0+git"
+
+SRC_URI =3D "\
+    git://github.com/freeswitch/spandsp.git;protocol=3Dhttps;branch=3Dmast=
er \
+    file://configure.patch \
+    file://makefile.patch \
+"
+SRCREV =3D "7b0b8cf3d42b725405bcc63145de5e280265ce4e"
+
+S =3D "${WORKDIR}/git"
+
+inherit autotools
+
+PACKAGECONFIG ?=3D ""
+
+PACKAGECONFIG[mmx] =3D "--enable-mmx,--disable-mmx"
+PACKAGECONFIG[sse] =3D "--enable-sse,--disable-sse"
+PACKAGECONFIG[sse2] =3D "--enable-sse2,--disable-sse2"
+PACKAGECONFIG[sse3] =3D "--enable-sse3,--disable-sse3"
+PACKAGECONFIG[ssse3] =3D "--enable-ssse3,--disable-ssse3"
+PACKAGECONFIG[sse4-1] =3D "--enable-sse4-1,--disable-sse4-1"
+PACKAGECONFIG[sse4-2] =3D "--enable-sse4-2,--disable-sse4-2"
+PACKAGECONFIG[avx] =3D "--enable-avx,--disable-avx"
+PACKAGECONFIG[avx2] =3D "--enable-avx2,--disable-avx2"
+PACKAGECONFIG[neon] =3D "--enable-neon,--disable-neon"
+PACKAGECONFIG[fixed-point] =3D "--enable-fixed-point,--disable-fixed-point=
"
+PACKAGECONFIG[v32bis] =3D "--enable-v32bis,--disable-v32bis"
+PACKAGECONFIG[v34] =3D "--enable-v34,--disable-v34"
+PACKAGECONFIG[sslfax] =3D "--enable-sslfax,--disable-sslfax"
--=20
2.34.1


