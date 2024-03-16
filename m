Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C38A4C54E60
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 08:23:37 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.117])
 by mx.groups.io with SMTP id smtpd.web11.2809.1710577406551973469
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Mar 2024 01:23:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=vXa56/d7;
 spf=pass (domain: navimatix.de, ip: 40.107.8.117, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGi5z7RThw4mciWBTzXt5f3JmSOhzS5edh2l738VcwxDJlRkp1UB0xGnUERwycyAcYVZg5K2NQTBfPR1oP8XOq2Ga/RaJiaVRj0TNa15cfvNr60WweX2K6qmDLqPSDM6hX0DCxjU3gH6fKQyjN2bplvZO00pGrpNQQDEjQl0WJrYeRDAiEJobDSoIsUKo0+Ge2xb9abOKPmCUdEPHU3rC/kOKrD00YRBuGFgbWmEZt6wPl2bCrj15nYBDXTOoT2M5diry1vy/WCG9/9vv8O9271ttAEtG51/6kPRN+eq0OSA+dyNXT3xKDPc+MxO9T0NkXT+lSYVcuGAQja4Nw/4uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IucGEzk7aMXRgrbF6oGln1Q5GHcOIquymrNmG4ht0m8=;
 b=l5YXooyBAtlnDSJVAk2jYTzsdFtHhTYWZG6QqR3V2XVrLgtXEcoCJb1s8WwQiA53zZC0px3MxLnuqZE5bjO67a+y2YF5Ydt+iC/RncSzG3NkI4vNiu2Fx0h+gSVYVyioyz3tm4atYFtJuQcxOPTRm2ap93NrW4y9YMjR1EJtAKXMHHbUeVDsXq0m2pl1ChFC8mIwFIU/wpuSjz5ocZohd5IoYjiUq/HMgN2tAQ4CccS6KZqyeDR1gjOMhurs0nCDT1G+0A5Gk8WjldFqA8xNsp7WrGfcZn2D5TOCsx7wvpl92QvjSJdyxjjrtdVR5hr2iCgv+ec88GSr6/2cvvbRxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IucGEzk7aMXRgrbF6oGln1Q5GHcOIquymrNmG4ht0m8=;
 b=vXa56/d7iktTpVAGQaYWhjbcJIKjB3e1ES75T4YOXkXe2aBeTqJ0STXDdjAg9NbOxiesPo95kN4uORZgwxVhif2Rglt4mgqX6Y1ZsJ8AV/fnkhamTskMB7Vqk8jmSHCAIIIixnRB8IDBdetxnmbFD/8iiUc4wddQ0PUyPVZ1sLw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
 (2603:10a6:8:7::20) by DU0PR01MB9240.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:35f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.31; Sat, 16 Mar
 2024 08:23:22 +0000
Received: from DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
 ([fe80::25b0:e60e:c5dc:54f5]) by
 DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
 ([fe80::25b0:e60e:c5dc:54f5%6]) with mapi id 15.20.7386.021; Sat, 16 Mar 2024
 08:23:21 +0000
From: joerg.sommer@navimatix.de
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [meta-multimedia][PATCH v3] spandsp: new telephony DSP library
Date: Sat, 16 Mar 2024 09:23:07 +0100
Message-ID: <4b6630f81955208dbd94091d3d7fff8c5ebd9167.1710577386.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::19) To DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
 (2603:10a6:8:7::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0102MB3658:EE_|DU0PR01MB9240:EE_
X-MS-Office365-Filtering-Correlation-Id: ea7f6191-c71d-4ec0-ea49-08dc45925796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	osQ9znRtd30+L2JP/9kKKuuCJe4IXvGemPCB0i5zGt/cwoMDr1Z9TN9y7JmQApPlcr/6nN/Hc/1HIlk800IaEBxDq8tBjs/9G359+M6siqohO7WQP2DI9Ti3l+12Re/yR6SU71ndUV9vjMgXVMUI4ICkWbvHihUbTMhsg2K6GmUEU74/JENRaTemTCRD+4STMQSBPKFTP8qrEcvuARlySs+mRT99eA1cgfIGWFi3lTRTnLDAEMsr7TmFJstBxH4RpTq8mIQr/U3N+INb17AR9XeGcBWf62Ebw03KD/Guaf8g8NiiYz5Bi1MrypW0hTQVlXopgdcrPAK6Uo8f3W+hm+EAVrjxMWTbcNAMYZBomwnaXnMZIhermbOemD1WVVUzS4zkxDokEgMOzVYhFpAbJT3nP9epJISmBr8iSC6xRSzMAVZJPxFCM52RZ5OSk1dYvDxPI4480XDB2g225muRhW+uXJmYRWFGMNhHFQbKRr5aIH4AL3kZaDfNbe9Zl0dm146jHw+zpBWNv5hGDT9CEAmDF7oDBsP5AnLD/+3VMjTKMBK3UPyFIucityK2MycyiOMgiZAUcBQV7quFpI6nyZ/RlVLAtcwaeaUQx0TWw7qKasrXC9jQZ+wI+qDv+wRQoBBIdT4ocIpTM1zIBlTo1fVsyHnk9IpCGiu0iX/ASVQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0102MB3658.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tEBWPcU0bulxnUul3DWon9dRTARuge7MGj8HDHlg99Lc8PmhQRu0UueenFGn?=
 =?us-ascii?Q?LdveBgX5DdRZwajWfH7p99ghhdZNnQNRldEEBpYghmKAi+6JCy7OaI7x0jef?=
 =?us-ascii?Q?mxMKFxauu3qfP4cARl6C0HW+KcNpvqJQap+MTlneAqTL6KL4yPZIx6MOHjTU?=
 =?us-ascii?Q?/UiEJDnEC60fcUkq6/9SQqoY7QksGestKcOsK8pRPfUDF54t9NsKaGH+L5qf?=
 =?us-ascii?Q?EtMaImeauI8fnz13b4SFUbK4qSiLEPK8+IVv7VkKPcQW87b2/1Zkk/cZ45AG?=
 =?us-ascii?Q?7R6/2h3eCrTBuVao90Fla7g7aeNNdMXVRmM7W2fleCbWG70OsMgX6KQJ9pzc?=
 =?us-ascii?Q?idrBbmnVkvmmPElYg8WBhis8Ht4oLtP/YGfhksZ/yaeuaFfTX8SRMeM1CZDA?=
 =?us-ascii?Q?79uk7gkI04LOuKnMo7OwRpLnVGRLmGRNF0pat7xYUrKd+VxFzIcCDBFNTWQC?=
 =?us-ascii?Q?hl9HGDBjKtKcmmjEo+cVv0+rukVO01BRGe53QY25WzYcSWUnkR5D0N4SieW8?=
 =?us-ascii?Q?UWe+TNjIPNxoJX23kS8DjaHwzBspfnpfxO1noPCVhG+sdlzH4HNCBytQYRBx?=
 =?us-ascii?Q?XdroXD+5B+is67OuL5Gm+ecmetcIQhCrZJkfIg/36hX40TNysgWf/6qMqTjR?=
 =?us-ascii?Q?QBbJIhXC6C+3Goi++YSg+rWnuK7JpC8Ny8pLthJmLTSSbW8J1N6JoMFEycJC?=
 =?us-ascii?Q?WUyg7X/4vl/RqMmJi2uUy6WZHF0bTCpaSwHaEIR8FAzr3rOooOOK0nrfuWy6?=
 =?us-ascii?Q?OtIGhSZT8DKtKIvUBp56KSpFuIHC0w0nj1RJ45g+xS9f7h/C/G8JwZz0rOQi?=
 =?us-ascii?Q?QFV4jFH34oVq5FUW5g03Q3eArZoecbvozyRWhgShNcjy2/2lef6o0el8aeBE?=
 =?us-ascii?Q?e7GjPKpJX+H11KdMFpOUKRev5V/oEQL2SKtRIaolVWMeUDG2As6JWTH6Kbok?=
 =?us-ascii?Q?4VnYj4Tc/D+3FwcDN+UjlSHKoLWtNOkHyo36hSWMLscoHolI4GMTQS6sSP/4?=
 =?us-ascii?Q?e7Mp/JWYdIT6eeCFFHyJ7qt5Wogmkg5bMjQKGgbCf7qeR6BbK/MV4onU5u6s?=
 =?us-ascii?Q?ChejF+fmac9eljnaUVdO/rhR5THm4ygrHKQLcbHPTMgrcXbZEZb0yt6VDn1x?=
 =?us-ascii?Q?Zj3j9vmBNm5ZwwY1GcX1fzOJOENmXXN5JarXuxlDcp2cuu243GxnUdwfrRTe?=
 =?us-ascii?Q?0VMR4yb4P+EhcrNOhPjybGCuDpfRkgdLL/NkOP5phRzhjjBmnH7g+x1aEF+b?=
 =?us-ascii?Q?D3rErtFy4rn8AqLOcUr6OwtWLaRoB/AnhoMOVJGqfTeXE8wavzjUbmsryA+h?=
 =?us-ascii?Q?n+KwZlLkQFpDhJ193HAE7QfG6oMYyqwkBs0MJcDgjgMyCnQRueaT1wsBK8C8?=
 =?us-ascii?Q?1o8AWSm+xyUUXzjxNTn9jvfvMZlWuw+PErPftEBJqH9kN9FWu/1zgtQGZF1g?=
 =?us-ascii?Q?zax5mIo2Uvy1hJ1XSzwNiq4dzNFIXRAy+BkuM6+i6Rg/MVKcn+vuU2NZ+8xE?=
 =?us-ascii?Q?LZFAgKsel2ihp2p+zLL28pcokui9Zum3JdM/ZlU66+HVzSIt8FE6xP0SbXL6?=
 =?us-ascii?Q?n4HyBk+SqhrYfkFvuVARqw+eEj2bb8DPD4q4miejvT/VjUSiTxMLmh1FoTp+?=
 =?us-ascii?Q?HA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ea7f6191-c71d-4ec0-ea49-08dc45925796
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2024 08:23:21.8696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tq7hG03elRZxB4nbagAY9BCQCNrB5y0aLZL4XTHaf6LUTssLUahCC958uDNkWOXvkhxliHBwqBYS8A/VugDlqMUJ77U3DTRuc4fawfAkcso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR01MB9240
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 08:23:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109354

From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 .../spandsp/spandsp/configure.patch           |  56 ++++++
 .../spandsp/spandsp/makefile.patch            | 161 ++++++++++++++++++
 .../recipes-multimedia/spandsp/spandsp_git.bb |  50 ++++++
 3 files changed, 267 insertions(+)
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
index 000000000..f115553fd
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb
@@ -0,0 +1,50 @@
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
+# Fails to build with Clang since 5394b2cae6c482ccb835335b769469977e6802ae
+# https://github.com/freeswitch/spandsp/issues/67
+# https://lists.openembedded.org/g/openembedded-devel/message/109325
+SRCREV =3D "df1282eb9af538ab1aadb6d66146e258451d4fe4"
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


