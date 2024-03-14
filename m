Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD67C5475B
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 09:10:34 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.138])
 by mx.groups.io with SMTP id smtpd.web10.8315.1710407428494031181
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Mar 2024 02:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=iWOE/CqB;
 spf=pass (domain: navimatix.de, ip: 40.107.20.138, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9a0udDOGxkzMg96a9STJtpEbtT+zVFdsyZMTRgW7zWmciNsP9PAPfBIpaNrIm3fKuUDDo7anP1R+aQjaWfSALmdik7+0Oww2bgclCZQ4PWPv2d4Pxqln/JutDwOPmmZa3byd5Uut0YSCIstPiA4L0ouVc5U9LOItQNlGZRhlVgNFNwBnLx4M8Kk+e9YkwshMnEKwZZDZNMXxT5f5BhvlDdAfutHxyxVuea9B696XcjbQYF+CcHK7Gf2mLCSJSt6AhGp3gJc6GyyTwAExXUIN+yvKxZ7mM7+I37jpJzelYxsmYv1uTibO3neyVQPn23DpvHTuI00Dx20AKWD/6r5fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xL0IvsUEIlprR6QqsAr74SnDm6Ve0efqpioJr1duTQc=;
 b=R3We7/m9b/lnqGy3w+IOS+ZSuAfCW3+YbEdfVP6w3HvJCfnPUWsH2Qetpvn/ZT4qO+A0+po7opFMrrN6GxbUdDwpPMpD6H3HToFohEtNKdOXu4u8KsNEbW+qZuarXFH0+O06fWDWDbO3qpWJLe1uEyDTL+yCc/0w4A90EXTdJ9LYBuvfu0kCif4hLYQ/Y7rfiieO8cMGDT7QIKr6dUaibOd623cF6IBNupYaLtuRzo6dZ3dxVjDyad3duwyUwWodeImuBQohgSFw4QAMh0rGAP0ReAOUhsJl5GJfIdkinj3PP0Oo37OsoOrqn2Fas34YKsd3+Hro+13TQ5nU6Lc4Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xL0IvsUEIlprR6QqsAr74SnDm6Ve0efqpioJr1duTQc=;
 b=iWOE/CqBxLrrZzTPsf3Bgo9j2wGI0x53zAkItRyoRumq4U9WzzmJ62etiPhDy2WuzaTtEkS+s4GvHKwc7Rc6vXpHfZH2i1ua6s3L9yDKUJBsjqDYUTKI6eg9DI0/cBfKcG/G6OqFf0Nm9i7HduDiEO/aUJXUCOsIKZWuJh3iD7E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
 (2603:10a6:8:7::20) by DB9PR01MB7868.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:21f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Thu, 14 Mar
 2024 09:10:24 +0000
Received: from DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
 ([fe80::25b0:e60e:c5dc:54f5]) by
 DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
 ([fe80::25b0:e60e:c5dc:54f5%6]) with mapi id 15.20.7362.035; Thu, 14 Mar 2024
 09:10:23 +0000
From: joerg.sommer@navimatix.de
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [meta-multimedia][PATCH] spandsp: new telephony DSP library
Date: Thu, 14 Mar 2024 10:10:05 +0100
Message-ID: <b25d5c76ac9cab023880ad8bb9ab2e729bf26227.1710407405.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0274.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::19) To DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
 (2603:10a6:8:7::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0102MB3658:EE_|DB9PR01MB7868:EE_
X-MS-Office365-Filtering-Correlation-Id: f6a93cd1-4832-4c3d-7c58-08dc4406949e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oh6CCNhDJutYxZFX83CC5vuoXuqAVs4lIb9CODc7TSE8VsbOR6KQbVNYBXJFNOKNGG5kwDRuq1QRpn0ozgRBk6KWR7xjOKJnx73KThUQRVv97TZNkdmiAqxK7/5YffraSIk9Wm0GIlUuHSxF2RwiZpgTuW0HruxZZPIVVoDRFb+1MMqExnQohUhTmqakZlDHE52Z9XE4I6v/jC1s+reBMptyRQEsgbkDQgdVPANjdriqOHQqGkcYjQl1bLMbhBkFZZMLIH6sTCvhZeVBGErYtqrqqiYaUBfwc3nZDsuuNXXHgiM5CzVtTgSKbpHceL4fi4ti63i5KOhKOfFqsnRqYOOYLi/4EfWUWMP/cyEZIfMBQjtf7g8unJE23VWg52x7hXk+Kkn9FE0U/t09Hg1jqaRiik8heKmDnj9ok8aZ8I3Tpy+YNwapTaJoRO2lRAqUEDA1vEg4A86LzQeSlvr7cKsZo9K+AjCGZUPFd2HsyBzwADB5MYdd/yW9l0rfqedf6nKgLbGiGiLvsA+0OrYwpXcLehC65w/Ag60VenC/tZUqjwZWsz2mMYxHCsqQhH6Z/KuFOQ/JTb33ouxXWJUvhGd2qiAYhHbxIFughyztMwSYCWV455DLtLIOtWAmS3LFCQIrRF9V2blpqJVE6nowo1Ak5VbfzSZTUDIXDYoh+Xc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0102MB3658.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9v18L/vELT/IAzgFsl5k/WXQkXkC8zMSCxpSwdwgP+vuquhPne3MbgM9hKqA?=
 =?us-ascii?Q?3vDfXSsf56VRUDIrYz2M2SPHpTla3pBNQy4/eGXQxpLflGI3l+E8avLJY2bv?=
 =?us-ascii?Q?e/m+svP/7sAbed+LBSScznyt0W78T6cHfId6pdysp1ZMox/CIp/HlAKrQA0s?=
 =?us-ascii?Q?0DrF2FAVOuN27CWXMtRaAO3b39bBddp4MJ1pCPUWaPuUPgYXedzMZq6R//3/?=
 =?us-ascii?Q?6Agw8sDzdDFldQmAr7wC4dUViTdFNw8xT3UME/epKdDwZ4hYnhecHADPvOAV?=
 =?us-ascii?Q?nBH4CT7o0Iz5GyNKN7waxCQZbCLdqWxU1enCkLIAAcsb1tFqVuRk2Dkw4B6K?=
 =?us-ascii?Q?/V3V+Wkh0AlDSaDZNeiWxSG9RUTKvWUVUB6RpkXqfAQHnYkfr+evDEikiyo5?=
 =?us-ascii?Q?lXAIR2A6h31Jp1LNO1Y3qDozPDujIClycGvddfXFs93DPEs6T3UTa75d20Vf?=
 =?us-ascii?Q?ZX1EFjFcVmWEk2Tcc+Neb+LFOzau5kRgEYSuTxD2z4KU+szq5AXbQGU+1cPP?=
 =?us-ascii?Q?jpeKemTIPDoOfwBS1N38AVZzbY87kd9zrVFtNM6w3cccgvBoFshTT363jK+x?=
 =?us-ascii?Q?A8HKDDz3M9W8Sqs49doOxTeqrYW1LScKQBuTIwMtf7DAx0pHCZ2cTuaCQWdn?=
 =?us-ascii?Q?ZhBEsDIP6BuSlzj/Lch+VXEA3vsPiO6+NPDzZJRx22Cmn6ujqPyWicINvufC?=
 =?us-ascii?Q?BLBEsF/gNIIa0hK+wB2wj9AX5Rn35MUmuV+PNF0Y1ETJj6DqsB0lzCzmw9U4?=
 =?us-ascii?Q?rmRCdwh9jGBswDA3Dkxe6QqWZn+qGYWAbXpONkenBsJ0hylY8tVToNSGGpdw?=
 =?us-ascii?Q?iViQpehsDQxU2v6J3pP/7KoYfTse+DsfaotlBZiSeaA6lR2cwnL5CIjKtej8?=
 =?us-ascii?Q?GY7l1CsHxuyP16ud0ZK+otmxR3jri0FqG3vVO1ct3Ga35ZUGeOIQ4CgRnv+7?=
 =?us-ascii?Q?/v9RayVClmlaaSetUx4rOgbVKOpavqNi3HWeGTdBBRK3snu2aPVtiGHAL7Az?=
 =?us-ascii?Q?jRcmwUrajyBEPqBBnwgowHL9BNTkZtD4t8/vzt5liqpGUK72pSZszLy+4ugW?=
 =?us-ascii?Q?skS3ppA6XsTn9hKtDFqCfbvFnj8jERHiasmH/XyKcNO2sWRumimqQ5XtvuFf?=
 =?us-ascii?Q?2WLW7CYAkCrEO/jMT7Df9WQkZLyN2yPo4hJddtsahLvfu4/oeovX9FfLkc/Z?=
 =?us-ascii?Q?zn9MkiGGUH1evR4sAaWAZIRu6ENllmDMElodkFdvm2zhVH7KGfd+a0vupqqN?=
 =?us-ascii?Q?mSalVRh3B/09XwxEHbZ0g6giX9EXZP1K52U/3QRL/L0oxJTJM3fU0jnepfOQ?=
 =?us-ascii?Q?CDkIupoXN7nVfty7/+fuHDXk5efentTThTbrkV4XizUgSfDJkM+eYrQ+l61U?=
 =?us-ascii?Q?Ud+laFKypCfkezKFokxk07hOZsuJvlpxJiihzlxtke0AWwRDA7TefsWSlHzv?=
 =?us-ascii?Q?OwOr8eGcGJr9IFIkBdCJI64hqBGLfj2wA2Qh+oD1Hud59dji3Fyij3z1H2It?=
 =?us-ascii?Q?Z7lVKiBJCBrHX7coep1Ad4TS7kMhHOiRy8iipMeRbgHMldbYgi3e43L5dPCC?=
 =?us-ascii?Q?yTMzekTBFlTOPKQSO0pF21sxzJdyUmQkgZ4gsWShWlUGFVHn60/d9HYowm/S?=
 =?us-ascii?Q?GQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f6a93cd1-4832-4c3d-7c58-08dc4406949e
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 09:10:23.6148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4tSazdfTCpZg3BVxwsZK1UDD47/vRu+6zrB/yEMAqytdeJB94iKjfgzl/htbbNC35JPfEs9creCQYuP/dMOuyot+7bvpkYYsmcvcXYEEHqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB7868
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 09:10:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109312

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
index 000000000..9f34a17f0
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
+PACKAGECONFIG[mmx] =3D "--enable-mmx"
+PACKAGECONFIG[sse] =3D "--enable-sse"
+PACKAGECONFIG[sse2] =3D "--enable-sse2"
+PACKAGECONFIG[sse3] =3D "--enable-sse3"
+PACKAGECONFIG[ssse3] =3D "--enable-ssse3"
+PACKAGECONFIG[sse4-1] =3D "--enable-sse4-1"
+PACKAGECONFIG[sse4-2] =3D "--enable-sse4-2"
+PACKAGECONFIG[sse4a] =3D "--enable-sse4a"
+PACKAGECONFIG[sse5] =3D "--enable-sse5"
+PACKAGECONFIG[avx] =3D "--enable-avx"
+PACKAGECONFIG[fixed-point] =3D "--enable-fixed-point"
+PACKAGECONFIG[v32bis] =3D "--enable-v32bis"
+PACKAGECONFIG[v34] =3D "--enable-v34"
+PACKAGECONFIG[sslfax] =3D "--enable-sslfax"
--=20
2.34.1


