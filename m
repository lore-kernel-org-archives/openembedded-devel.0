Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.65])
 by mx.groups.io with SMTP id smtpd.web09.5145.1604568646260413636
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2020 01:30:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=T06SxSRJ;
 spf=pass (domain: windriver.com, ip: 40.107.223.65, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGOlt33jCOyGoQwMKLLCUTmX/bkp2BG2cuAPngm6RBYp17ZHYQcYNnkftUzgwq7Xjr3CEdizbVx6fySHXuHYjrMWq2RSwXzwAcktlQzOdu0d/M0oe652mmZA0LGPoVn2DbdhYjLLjyy4CZzXEEnqHe2XOL+kYAOAH2VMyxeEuaFYqVEY4sZwBVfv+o5FutWJwEqbx0YGcOcg5cfIn9Mmla6mcRy5KhRMujU8pHzth7Noos9/LZHtMhEHLppm6JgFLjCCBEn5jrMWj03ypCCtqUseIYO8luxoUyI/pEphDyWabLZFdBqj38XfReGNbqLjERuMRASf/CdSWA7f7oAtqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jyfaIbq3sqZIglwB7gVxtEccvyxEIK0X1gqSJDQl+c=;
 b=gbrpHKzIM6fPBvKr5imzbdj3+6VN6djBsJ7kjeAceKReh2x2utzlP2aOXzPq2mV33Vev231hsmqbo0XH8k3u+7OmluL5QSuhQ1bBvFinemjQjEFv3vGQm8NqtZC1dpDiLciu5ztu0tC5aM+rHb+TBeIereQn0jhmX5cOnaqGLm65XW3YC+f4FNMxveBLxKb7M/Y2T7tAVqR+kwHQNv/o825Sf2uzJkmIychS9TQ4WTFu37PsBw+19b8cum1YNcHBVsRsYcD8QjN5nuw7sF8HEeIoORSsN+KVuKQoU9BumdEKRlJ4yYDbRw3bbf6w5JlbsGGCMp1Vcyk/2QBK/Arv1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jyfaIbq3sqZIglwB7gVxtEccvyxEIK0X1gqSJDQl+c=;
 b=T06SxSRJshSOWIEsDkh6+CsbTm3XwNrOytydmuO3mX1IH2JOfynlDTB9/N605xztkLPM7fiC+lxhNXCixc/saEzTN1BYjhIe8XdONMZoO8QpD5Wvz4O+owfxOV05/GvHtazcwsxa19MgD6YMN1I/1kSzBaVKoUbFB2ZqP91gKc8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CO1PR11MB4817.namprd11.prod.outlook.com (2603:10b6:303:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Thu, 5 Nov
 2020 09:30:45 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f%7]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 09:30:45 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 4/4] ntop: remove the recipe
Date: Thu,  5 Nov 2020 17:30:15 +0800
Message-Id: <20201105093015.36886-4-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201105093015.36886-1-mingli.yu@windriver.com>
References: <20201105093015.36886-1-mingli.yu@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: YT1PR01CA0132.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::11) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by YT1PR01CA0132.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 5 Nov 2020 09:30:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7b2da8a-6fd9-4d65-915e-08d8816d7835
X-MS-TrafficTypeDiagnostic: CO1PR11MB4817:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4817678281118A7CB79B018DF1EE0@CO1PR11MB4817.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JlGcPXw0kxDm3tjTLAKEsG6UZtQf6bmbq2ZpLsCRs1WUsGsD1i1Ev3QkMRZnJeNCNzoUbefvGGlPcrhU/HmCa6BnQA2HYnbqfkdXt+jJaawwjEZxBbPeHCZXp9yFak2xFcoJaq32GqanjhLzKsxq2SOmEFIeSVRidiy+P6BCw1NamCgr+RvjZLPSHAJMbcQ7crrt5gvu2z+TkbZc+KGS9rBQb3OF85cjC0x+OPUa7qO92b4QzXAqyjfoGg73gi57HCNlFYBBzeJTpB8NRhUXf6AVVfBfxI8qLNhri5JxSBxLuyaCIaxLMZEWFHyBO9AwRSH8YOMbq3b4ZAaXTwg1XiBauLrP9kGHBgKjiaKXWqhhxrnae1eyt0XC5Z0MvbM34qdoFRZslx8UHYbz/eYPoA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(376002)(39850400004)(136003)(66556008)(5660300002)(66946007)(66476007)(6666004)(186003)(6916009)(52116002)(83380400001)(6506007)(6486002)(86362001)(16526019)(316002)(8936002)(26005)(966005)(1076003)(478600001)(8676002)(6512007)(9686003)(956004)(36756003)(2906002)(2616005)(30864003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	txPiU/RF55HoMfONm0+T21/rO4+YRVPVAqydkl1dWS1tMPiysX2thlr4RLwOQfS5hvuw1STjLJcvs8HYE43a00wPIBZuX9SUcf3JXW1zqOtDeO7mAgGYiJGpZogfZbWsmIReidUpWNZ7tCoEd1KqXw0b6oIr4gX2Hd7mheD6fw7Alu0jhbQjZLmBC0q5Nm7Va+QybUJqVpzSTjrd23oebinc2yOCf4SXWte+u5y7idjMDwZcUHMn24TqfiGgBmYpdUl6rh1m9vz0W8IPu031Jvb0gInZK+Zk5Zb8mEInmFZDG0q1LuXrTPyJLD1Ecv/vhDIIepAq1gdzju/LKGEhcoE7dXVne49cAK1Qa82/7SJPsU5RNgWj8HZp97NorRmlIzK3So7BuAeFtLqt2dMJyiP89SODMwZx8LL4np5i0xG4nGG98qxo6Sq1Uw0P/TzPP6de4Alv+9C+SzBXEMZCu1AJC+BTmr+uLkpLlVtT4cQC5biPMPBJBuDdduI0pJZktAx6ZQjYBO9VW+I3nN5/XHG0RzM1PePgMhFmq7qUNFeAz/vnevDSAdHxojC0z+onaZkJjldaOnL2Evr9kLwkM8oXFG7BYO8RIk3WatiUpWgndLu+mwpm8ipvNeB1VMVKrrK8LIUY+f300r5YIOft2g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b2da8a-6fd9-4d65-915e-08d8816d7835
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 09:30:44.9851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w5edMZ817dhS6TffBnWLV3yBLplNGTok6ap+8oUfvZ/3AadNQDeaFvzdSx8dHh8MqOjGyphp1sBxgjEIBmcGQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4817
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

The ntop project is inactive and there is no new version
since 2012 [1] and it has been replaced by ntopng.

[1] https://sourceforge.net/projects/ntop/files/ntop/Stable/

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../ntop/0001-nDPI-Include-sys-types.h.patch  |  26 --
 ...-Makefile.am-fix-for-automake-1.16.1.patch |  74 ------
 .../ntop/ntop/embed-libs.patch                |  20 --
 ...issing-return-from-non-void-function.patch |  19 --
 .../recipes-support/ntop/ntop/ntop.service    |  15 --
 .../ntop/ntop/ntop_configure_in.patch         | 164 -------------
 ...p_configure_in_net_snmp_config_exist.patch |  21 --
 .../recipes-support/ntop/ntop/ntop_init.patch | 228 ------------------
 .../ntop/ntop/ntop_webInterface.patch         |  19 --
 .../ntop/ntop/use-static-inline.patch         |  32 ---
 .../recipes-support/ntop/ntop_5.0.1.bb        | 142 -----------
 11 files changed, 760 deletions(-)
 delete mode 100644 meta-networking/recipes-support/ntop/ntop/0001-nDPI-In=
clude-sys-types.h.patch
 delete mode 100644 meta-networking/recipes-support/ntop/ntop/0001-plugins=
-Makefile.am-fix-for-automake-1.16.1.patch
 delete mode 100644 meta-networking/recipes-support/ntop/ntop/embed-libs.p=
atch
 delete mode 100644 meta-networking/recipes-support/ntop/ntop/fix-missing-=
return-from-non-void-function.patch
 delete mode 100644 meta-networking/recipes-support/ntop/ntop/ntop.service
 delete mode 100644 meta-networking/recipes-support/ntop/ntop/ntop_configu=
re_in.patch
 delete mode 100644 meta-networking/recipes-support/ntop/ntop/ntop_configu=
re_in_net_snmp_config_exist.patch
 delete mode 100644 meta-networking/recipes-support/ntop/ntop/ntop_init.pa=
tch
 delete mode 100644 meta-networking/recipes-support/ntop/ntop/ntop_webInte=
rface.patch
 delete mode 100644 meta-networking/recipes-support/ntop/ntop/use-static-i=
nline.patch
 delete mode 100644 meta-networking/recipes-support/ntop/ntop_5.0.1.bb

diff --git a/meta-networking/recipes-support/ntop/ntop/0001-nDPI-Include-s=
ys-types.h.patch b/meta-networking/recipes-support/ntop/ntop/0001-nDPI-Incl=
ude-sys-types.h.patch
deleted file mode 100644
index 81ffeec21..000000000
--- a/meta-networking/recipes-support/ntop/ntop/0001-nDPI-Include-sys-type=
s.h.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 6543f3e2d5fe214e2fc6c050289bf1ae73b18724 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 30 Aug 2017 13:56:24 -0700
-Subject: [PATCH] nDPI: Include sys/types.h
-
-Needed for uint_t types
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- nDPI/src/include/ipq_api.h | 1 +
- 1 file changed, 1 insertion(+)
-
-Index: ntop-5.0.1/nDPI/src/include/ipq_api.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- ntop-5.0.1.orig/nDPI/src/include/ipq_api.h
-+++ ntop-5.0.1/nDPI/src/include/ipq_api.h
-@@ -24,6 +24,7 @@
- #ifndef __IPOQUE_API_INCLUDE_FILE__=0D=0D
- #define __IPOQUE_API_INCLUDE_FILE__=0D=0D
- =0D=0D
-+#include <sys/types.h>=0D=0D
- =0D=0D
- #if defined(HAVE_NTOP) && defined(WIN32)=0D=0D
- #include <winsock2.h>=0D=0D
diff --git a/meta-networking/recipes-support/ntop/ntop/0001-plugins-Makefi=
le.am-fix-for-automake-1.16.1.patch b/meta-networking/recipes-support/ntop/=
ntop/0001-plugins-Makefile.am-fix-for-automake-1.16.1.patch
deleted file mode 100644
index d6f7eb555..000000000
--- a/meta-networking/recipes-support/ntop/ntop/0001-plugins-Makefile.am-f=
ix-for-automake-1.16.1.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From d22ddc73f00ed056032a635ee8379305ec83bf81 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Wed, 11 Jul 2018 12:02:50 +0800
-Subject: [PATCH] plugins/Makefile.am: fix for automake 1.16.1
-
-Fixed:
-| i586-poky-linux-gcc: error: netflowPlugin.o: No such file or directory
-| i586-poky-linux-gcc: error: unrecognized command line option '-flat_nam=
espace'; did you mean '-Wnamespaces'?
-| i586-poky-linux-gcc: fatal error: no input files
-
-The previous code make things complicated, but we don't have to, let libt=
ool do
-most of the things can fix the problem.
-
-Upstream-Status: Pending [ntop is not longer maintained any more, we need=
 consider moving to ntopng]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- plugins/Makefile.am | 34 ++++++----------------------------
- 1 file changed, 6 insertions(+), 28 deletions(-)
-
-diff --git a/plugins/Makefile.am b/plugins/Makefile.am
-index 64492e0..bcd0c10 100644
---- a/plugins/Makefile.am
-+++ b/plugins/Makefile.am
-@@ -69,40 +69,18 @@ libsflowPlugin_la_CFLAGS =3D $(AM_CFLAGS)
- # by default ntop looks for plugins in the plugins/ subdirectory
- #
-=20
--
--.libs/libnetflowPlugin.so@SO_VERSION_PATCH@:
--	@if test -f libnetflowPlugin_la-netflowPlugin.o; then \
--	$(CC) @MAKE_SHARED_LIBRARY_PARM@ -o .libs/libnetflowPlugin.so@SO_VERSIO=
N_PATCH@ libnetflowPlugin_la-netflowPlugin.o; \
--	else \
--	$(CC) @MAKE_SHARED_LIBRARY_PARM@ -o .libs/libnetflowPlugin.so@SO_VERSIO=
N_PATCH@ netflowPlugin.o; \
--	fi
--
--netflowPlugin.so$(EXEEXT): .libs/libnetflowPlugin.so@SO_VERSION_PATCH@
--	@$(LN_S) .libs/libnetflowPlugin.so netflowPlugin.so
-+netflowPlugin.so$(EXEEXT): libnetflowPlugin.la
-+	@$(LN_S) -f .libs/libnetflowPlugin.so netflowPlugin.so
-=20
- ###############
-=20
--.libs/librrdPlugin.so@SO_VERSION_PATCH@:
--	@if test -f librrdPlugin_la-rrdPlugin.o; then \
--	$(CC) @MAKE_SHARED_LIBRARY_PARM@ -o .libs/librrdPlugin.so@SO_VERSION_PA=
TCH@ librrdPlugin_la-rrdPlugin.o; \
--	else \
--	$(CC) @MAKE_SHARED_LIBRARY_PARM@ -o .libs/librrdPlugin.so@SO_VERSION_PA=
TCH@ rrdPlugin.o; \
--	fi
--
--rrdPlugin.so$(EXEEXT): .libs/librrdPlugin.so@SO_VERSION_PATCH@
--	@$(LN_S) .libs/librrdPlugin.so rrdPlugin.so
-+rrdPlugin.so$(EXEEXT): librrdPlugin.la
-+	@$(LN_S) -f .libs/librrdPlugin.so rrdPlugin.so
-=20
- ###############
-=20
--.libs/libsflowPlugin.so@SO_VERSION_PATCH@:
--	@if test -f libsflowPlugin_la-sflowPlugin.o; then \
--	$(CC) @MAKE_SHARED_LIBRARY_PARM@ -o .libs/libsflowPlugin.so@SO_VERSION_=
PATCH@ libsflowPlugin_la-sflowPlugin.o; \
--	else \
--	$(CC) @MAKE_SHARED_LIBRARY_PARM@ -o .libs/libsflowPlugin.so@SO_VERSION_=
PATCH@ sflowPlugin.o; \
--	fi
--
--sflowPlugin.so$(EXEEXT): .libs/libsflowPlugin.so@SO_VERSION_PATCH@
--	@$(LN_S) .libs/libsflowPlugin.so sflowPlugin.so
-+sflowPlugin.so$(EXEEXT): libsflowPlugin.la
-+	@$(LN_S) -f .libs/libsflowPlugin.so sflowPlugin.so
-=20
- ###############
-=20
---=20
-2.7.4
-
diff --git a/meta-networking/recipes-support/ntop/ntop/embed-libs.patch b/=
meta-networking/recipes-support/ntop/ntop/embed-libs.patch
deleted file mode 100644
index 2d1ab7371..000000000
--- a/meta-networking/recipes-support/ntop/ntop/embed-libs.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Use --embed option so that it can return libpython as well
-
-% ../recipe-sysroot-native/usr/bin/python3-native/python3-config --libs -=
-embed
--lpython3.8 -lcrypt -lpthread -ldl -lutil -lm -lm
-[kraj@apollo /mnt/b/yoe/build/tmp/work/cortexa7t2hf-neon-vfpv4-yoe-linux-=
gnueabi/ntop/5.0.1-r0/ntop-5.0.1]
-% ../recipe-sysroot-native/usr/bin/python3-native/python3-config --libs
--lcrypt -lpthread -ldl -lutil -lm -lm
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/configure.in
-+++ b/configure.in
-@@ -1463,7 +1463,7 @@ dnl>
-   fi
-=20
-   if test "x$PYTHON_CONFIG" !=3D "x"; then
--    PYTHON_LIBS=3D"`$PYTHON_CONFIG --libs`"
-+    PYTHON_LIBS=3D"`$PYTHON_CONFIG --libs --embed`"
-     if test "x$PYTHON_LIBS" =3D "x"; then
-       AC_MSG_RESULT(Python[-devel] support is present but misconfigured)=
    =20
-     else  =20
diff --git a/meta-networking/recipes-support/ntop/ntop/fix-missing-return-=
from-non-void-function.patch b/meta-networking/recipes-support/ntop/ntop/fi=
x-missing-return-from-non-void-function.patch
deleted file mode 100644
index e627e59a5..000000000
--- a/meta-networking/recipes-support/ntop/ntop/fix-missing-return-from-no=
n-void-function.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Fix following error:
-
-netflowPlugin.c: In function 'netflowUtilsLoop':
-netflowPlugin.c:2144:1: error: no return statement in function returning =
non-void [-Werror=3Dreturn-type]
- 2144 | }
-      | ^
-
-Return NULL like netflowMainLoop does.
-
---- ntop-5.0.1.orig/plugins/netflowPlugin.c	2012-03-09 17:44:17.000000000=
 +0000
-+++ ntop-5.0.1/plugins/netflowPlugin.c	2019-08-09 10:25:40.878799852 +000=
0
-@@ -2141,6 +2141,7 @@
-       waitCondvar(&myGlobals.device[deviceId].netflowGlobals->ifStatsQue=
ueCondvar);
-     }
-   }
-+  return(NULL);
- }
- #endif
-=20
diff --git a/meta-networking/recipes-support/ntop/ntop/ntop.service b/meta=
-networking/recipes-support/ntop/ntop/ntop.service
deleted file mode 100644
index 1ead2a0c5..000000000
--- a/meta-networking/recipes-support/ntop/ntop/ntop.service
+++ /dev/null
@@ -1,15 +0,0 @@
-[Unit]
-Description=3DA network traffic probe similar to the UNIX top command
-Requires=3Dnetwork.target
-
-ConditionPathExists=3D@SYSCONFDIR@/ntop.conf
-After=3Dsyslog.target network.target
-
-[Service]
-Type=3Doneshot
-RemainAfterExit=3Dyes
-ExecStart=3D@LIBEXECDIR@/ntop-helper start
-ExecStop=3D@LIBEXECDIR@/ntop-helper stop
-
-[Install]
-WantedBy=3Dmulti-user.target
diff --git a/meta-networking/recipes-support/ntop/ntop/ntop_configure_in.p=
atch b/meta-networking/recipes-support/ntop/ntop/ntop_configure_in.patch
deleted file mode 100644
index 392cb082b..000000000
--- a/meta-networking/recipes-support/ntop/ntop/ntop_configure_in.patch
+++ /dev/null
@@ -1,164 +0,0 @@
-1)add --with-pcap-config option to use libpcap's pcap-config
-2)add AC_CHECK_LIB if user didn't specify PCAP_ROOT and pcap-config
-  put it before host check to make cross-compiling easier.
-  pcap doesn't need extra include and libs so it is fine.
-3)remove old rrd configure code but use pkg-config to config rrd
-  rrdtool should have the pkg-config file installed.
-4)fix python-config
-5)change AC_TRY_RUN to AC_COMPILE_IFELSE for pthread_rwlock_t checking
-6)fix a net-snmp-config bug
-
-Upstream-Status: Pending
-
-Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
----
-diff --git a/configure.in b/configure.in
-index 0c7c0a5..cad40be 100644
---- a/configure.in
-+++ b/configure.in
-@@ -230,14 +230,14 @@ dnl>
- AC_ARG_WITH(void,
-               [  +-External-source-locations:---------------------------=
----------------------+])
-=20
--AC_ARG_WITH(  rrd-home,
--              [  --with-rrd-home=3DDIR        Usually /usr/local/rrdtool=
-1.2.x],
--              RRD_HOME=3D"$withval",
--              RRD_HOME=3D/usr/local/rrdtool-1.2.19)
- AC_ARG_WITH(  pcap-root,
-               [  --with-pcap-root=3DDIR        LBNL pcap located in DIR]=
,
-               PCAP_ROOT=3D"$withval",
-               PCAP_ROOT=3D)
-+AC_ARG_WITH(  pcap-config,
-+              [  --with-pcap-config=3Dpath/pcap-config where to find pca=
p-config],
-+              PCAP_CONFIG=3D"$withval",
-+              PCAP_CONFIG=3D)
- AC_ARG_WITH(  gdbm-root,
-               [  --with-gdbm-root=3DDIR        gdbm located in DIR],
-               GDBM_DIRECTORY=3D"$withval",
-@@ -556,6 +556,7 @@ if test ".${PCAPRING_DIR}" !=3D .; then
- else
-=20
- TMP_ROOT=3D${HOME}/PF_RING/userland/libpcap/
-+FOUND_PCAP=3D1
- if test ".${PCAP_ROOT}" =3D=3D . &&
-    test -d ${TMP_ROOT} &&
-    test -r ${TMP_ROOT}/libpcap.a; then
-@@ -563,6 +564,18 @@ if test ".${PCAP_ROOT}" =3D=3D . &&
-        CORELIBS=3D"${CORELIBS} -L${TMP_ROOT} -L${HOME}/PF_RING/userland/=
lib -lpfring -lpcap "
-        INCS=3D"${INCS} -I ${PCAP_ROOT}"
-        AC_MSG_RESULT([found in $PCAP_ROOT])
-+elif test -n "${PCAP_CONFIG}" && test -x "${PCAP_CONFIG}"; then
-+       CORELIBS=3D"${CORELIBS} $(${PCAP_CONFIG} --libs)"=20
-+       INCS=3D"${INCS} $(${PCAP_CONFIG} --cflags)"
-+       AC_DEFINE_UNQUOTED(HAVE_LIBPCAP, 1, [have libpcap ])
-+       AC_MSG_RESULT([found pcap-config: $PCAP_CONFIG, libs:$(${PCAP_CON=
FIG} --libs) cflags:$(${PCAP_CONFIG} --cflags)])
-+else
-+     AC_CHECK_LIB(pcap, pcap_lookupdev, ,
-+        [FOUND_PCAP=3D])
-+fi
-+
-+if test -n "$FOUND_PCAP"; then
-+	:
- elif test ".${PCAP_ROOT}" !=3D .; then
-   if test -d $PCAP_ROOT &&
-      test -r $PCAP_ROOT/lib/libpcap.a &&
-@@ -880,44 +893,11 @@ AC_CHECK_LIB([z], [zlibVersion], [], [
-         exit -1
-         ])
-=20
--# RRD
--if test -d "$RRD_HOME"; then
--   AC_MSG_RESULT(checking for RRD home... yes)
--else
--   RRD_HOME=3D/usr/local/rrdtool
--   if test -d "$RRD_HOME"; then
--      AC_MSG_RESULT(Checking rrdtool in $RRD_HOME)
--   else
--      RRD_HOME=3D/usr/local
--   fi
--fi
--
--RRD_LIB=3D"-L${RRD_HOME}/lib -lrrd_th"
--
--if test -f "$RRD_HOME/lib/librrd_th.so"; then
--   AC_MSG_RESULT(checking for rrdtool... yes)
--else
--  if test -f "$RRD_HOME/lib/librrd_th.dylib"; then # OSX
--     AC_MSG_RESULT(checking for rrdtool... yes)
--  else
--     if test -f "$RRD_HOME/lib/librrd_th.a"; then
--       AC_MSG_RESULT(checking for rrdtool... yes)
--     else
--       AC_CHECK_LIB([rrd_th], [main])
--       if test ".${ac_cv_lib_rrd_th_main}" !=3D ".yes"; then
--         AC_MSG_ERROR(Unable to find RRD at $RRD_HOME: please use --with=
-rrd-home=3DDIR);
--	 AC_MSG_ERROR(RRD source can be downloaded from http://www.rrdtool.org/=
);
--       else
--         RRD_LIB=3D
--       fi
--     fi
--  fi
--fi
--
--RRD_INC=3D
--if test -d "${RRD_HOME}/include"; then
--  RRD_INC=3D"-I${RRD_HOME}/include"
--fi
-+PKG_CHECK_MODULES( [RRD], [librrd] )
-+AC_SUBST(RRD_CFLAGS)
-+AC_SUBST(RRD_LIBS)
-+RRD_INC=3D$RRD_FLAGS
-+RRD_LIB=3D$RRD_LIBS
-=20
- dnl> The failed recheck stuff below is courtesy of Chris Turbeville [tur=
bo@verio.net]
- dnl> Chris developed this for Solaris 9, confirming work I had done earl=
ier for FreeBSD
-@@ -1041,7 +1021,7 @@ AC_CHECK_HEADERS([sched.h sys/sched.h])
- AC_CHECK_HEADERS([pthread.h])
-=20
- AC_MSG_CHECKING([if r/w locks are supported])
--AC_TRY_RUN([
-+AC_COMPILE_IFELSE([
- #include <pthread.h>
-=20
- int main()
-@@ -1443,15 +1423,15 @@ dnl> NET-SNMP
- dnl>
- if test ".${ac_disable_snmp}" !=3D ".yes"; then
-   AC_CHECK_TOOL(NETSNMP, net-snmp-config)
--  if test "x$ac_cv_prog_ac_ct_NETSNMP" =3D "xnet-snmp-config"; then
-+  if test -n "$NETSNMP"; then
-     AC_DEFINE_UNQUOTED(HAVE_SNMP, 1, [SNMP is supported])
--    SNMPLIBS=3D"`net-snmp-config --libs`"
-+    SNMPLIBS=3D"`$NETSNMP --libs`"
-     SNMPLIBS=3D"`echo ${SNMPLIBS}|sed -e s,'-R../lib',,g`"
-     echo "net-snmp libs: ${SNMPLIBS}"
-     LIBS=3D"${LIBS} ${SNMPLIBS}"
- dnl remove unecessary path
-     LIBS=3D`echo ${LIBS}|sed -e s,'-R../lib',,g`
--    INCS=3D"${INCS} `net-snmp-config --cflags`"
-+    INCS=3D"${INCS} `$NETSNMP --cflags`"
-   else
-     AC_MSG_RESULT(NETSNMP is not present: SNMP support is disabled)
-   fi
-@@ -1464,10 +1444,9 @@ SAVED_LIBS=3D$LIBS
- dnl>
- dnl> PYTHON
- dnl>
--  AC_CHECK_TOOL(PYTHON, python-config)
--  PYTHON_CONFIG=3D""
-+  AC_CHECK_TOOL(PYTHON_CONFIG, python-config)
-=20
--  if test "x$ac_cv_prog_ac_ct_PYTHON" !=3D "xpython-config"; then  =20
-+  if test -z "$PYTHON_CONFIG"; then  =20
-        if test -f "/etc/debian_version"; then
-        	   AC_MSG_RESULT(Please install python-dev and rerun configure)
- =09   exit 1
-@@ -1481,8 +1460,6 @@ dnl>
-           PYTHON_CONFIG=3D"python-config"
-         fi
-      fi
--  else
--     PYTHON_CONFIG=3D"python-config"
-   fi
-=20
-   if test "x$PYTHON_CONFIG" !=3D "x"; then
diff --git a/meta-networking/recipes-support/ntop/ntop/ntop_configure_in_n=
et_snmp_config_exist.patch b/meta-networking/recipes-support/ntop/ntop/ntop=
_configure_in_net_snmp_config_exist.patch
deleted file mode 100644
index 269138df9..000000000
--- a/meta-networking/recipes-support/ntop/ntop/ntop_configure_in_net_snmp=
_config_exist.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Check net-snmp-config's existence in case user specified the
-ac_cv_prog_NETSNMP to avoid HAVE_SNMP defined if the specified
-net-snmp-config doesn't exist.
-
-Upstream-Status: Inappropriate [Embedded specific]
-
-Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
----
-diff --git a/configure.in b/configure.in
-index 6f3e88f..8ddf017 100755
---- a/configure.in
-+++ b/configure.in
-@@ -1423,7 +1423,7 @@ dnl> NET-SNMP
- dnl>
- if test ".${ac_disable_snmp}" !=3D ".yes"; then
-   AC_CHECK_TOOL(NETSNMP, net-snmp-config)
--  if test -n "$NETSNMP"; then
-+  if test -n "$NETSNMP" -a -e "$NETSNMP"; then
-     AC_DEFINE_UNQUOTED(HAVE_SNMP, 1, [SNMP is supported])
-     SNMPLIBS=3D"`$NETSNMP --libs`"
-     SNMPLIBS=3D"`echo ${SNMPLIBS}|sed -e s,'-R../lib',,g`"
diff --git a/meta-networking/recipes-support/ntop/ntop/ntop_init.patch b/m=
eta-networking/recipes-support/ntop/ntop/ntop_init.patch
deleted file mode 100644
index e7684c1b4..000000000
--- a/meta-networking/recipes-support/ntop/ntop/ntop_init.patch
+++ /dev/null
@@ -1,228 +0,0 @@
-Modify ntop.init to WRLinux 5.0 style.
-
-Fix a small problem that when ntop not running,
-/etc/init.d/ntop stop will return 1
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
----
- packages/RedHat/ntop.init |  102 +++++++++------------------------------=
-----
- 1 files changed, 21 insertions(+), 81 deletions(-)
-
-diff --git a/packages/RedHat/ntop.init b/packages/RedHat/ntop.init
-index 40d49f1..a189c59 100755
---- a/packages/RedHat/ntop.init
-+++ b/packages/RedHat/ntop.init
-@@ -10,19 +10,9 @@
- #           You have set the admin password - read docs/1STRUN.txt
- #           You have created /etc/ntop.conf with appropriate parameters.
-=20
--#  To identify an interface to ntop, use the following flags=20
--#  in /etc/sysconfig/network-scripts/ifcfg-ethx
--
--#   NTOP=3D"yes"      <--- means for ntop to use this interface
--#   NTOPCONFIG=3D"yes"  <--- means for ntop to configure this interface
--
- # Note that if you give a -i parameter in either /etc/ntop.conf or
- # the command line, the scan is NOT performed.  
-=20
--# However, when it comes to the configuration step, with NTOPCONFIG=3D"y=
es"
--# the interface is configured regardless of how the interface list was
--# specified.
--
- #
- #  
- #=20
-@@ -107,11 +97,7 @@ ntopusesyslog=3D"local3"
- invoked=3D$0
-=20
- # Source function library.
--. /etc/rc.d/init.d/functions
--
--# Source networking configuration.
--. /etc/sysconfig/network
--
-+. /etc/init.d/functions
-=20
- # Basic sanity checks...
- if ! [ -x $prog ]; then
-@@ -124,16 +110,6 @@ if ! [ -x $prog ]; then
-   exit 1
- fi
-=20
--if [ ${NETWORKING} =3D "no" ]; then
--  echo ""
--  echo "ERROR -"
--  echo "        Networking is not up!"
--  echo ""
--  echo "Aborting..."
--  echo ""
--  exit 1
--fi
--
- if ! [ -f ${conf} ]; then
-   echo ""
-   echo "ERROR -"
-@@ -180,8 +156,8 @@ fi
- if [ "${debug}" =3D "y" ]; then echo "DEBUG: parm file temp is ${parmfil=
e}"; fi
-  
- cmd=3D`echo \
--    @${conf} \
-     -i tbd \
-+    @${conf} \
-     $extra $@`
-=20
- echo ${cmd} | awk ' \
-@@ -305,42 +281,6 @@ logger -p ${ntopusesyslog} -t ${name}${instance} -- =
"INITD -      Configuration
-=20
- # Build list of interfaces, e.g  eth0 eth1 eth1:1
- # (Yeah, we'll have to convert that to eth0,eth1,eth1:1 later
--if [ ".${ntopinterface}" =3D ".tbd" ]; then
--
--    ntopinterface=3D""
--    iflist=3D`ip link show | \
--        awk '/^[0-9]*:\ eth/ { printf("%s ", substr($2, 1, length($2)-1)=
) }'`
--    logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Scannin=
g all interfaces $iflist"
--    if [ "${debug}" =3D "y" ]; then echo "DEBUG: Interface candidates ar=
e ${iflist}"; fi
--
--    for eth in $iflist; do
--
--       if ! LANG=3DC egrep -L "^[Nn][Tt][Oo][Pp]=3D['\"]?[Yy][Ee][Ss]['\=
"]?" \
--                /etc/sysconfig/network-scripts/ifcfg-$eth > /dev/null ; =
then
--            logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD -=
 $eth is not ntop=3Dyes, skipping"
--            if [ "${debug}" =3D "y" ]; then echo "DEBUG: $eth not ntop=
=3Dyes"; fi
--            continue
--       fi
--
--       ntopinterface=3D"${ntopinterface} $eth"
--  
--       ip=3D`ip addr show $eth | \
--           awk '/inet/ { printf("%s", substr($2, 1, index($2, "/")-1)) }=
'`
--
--       if [ ".$ip" =3D "." ]; then
--           is=3D"is unnumbered interface"
--       else
--           is=3D"has IP address $ip"
--       fi
--       logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - $eth=
 is ntop=3Dyes, ${is}"
--       if [ "${debug}" =3D "y" ]; then echo "DEBUG: $eth ntop=3Dyes, ${i=
s}"; fi
--
--    done
--
--else
--    logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Skippin=
g interface scan - list in parms"
--fi
--
- if [ "x${ntopinterface}" =3D "x" ]; then
-   ntopinterface=3D"none"
- fi
-@@ -462,12 +402,6 @@ config_interfaces () {
-           if=3D"${if},${eth}"
-       fi
-=20
--       if ! LANG=3DC egrep -L "^[Nn][Tt][Oo][Pp][Cc].*=3D['\"]?[Yy][Ee][=
Ss]['\"]?" \
--                /etc/sysconfig/network-scripts/ifcfg-$eth > /dev/null ; =
then
--            logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD -=
 $eth is not ntopconfigure=3Dyes, skipping"
--            continue
--       fi
--
-       logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Confi=
guring $eth"
-       if [ "${debug}" =3D "y" ]; then echo "DEBUG: Configuring $eth"; fi
-=20
-@@ -527,7 +461,7 @@ start () {
-   show_extra
-   config_interfaces
-=20
--  cmd=3D`echo $prog \
-+  cmd=3D`echo \
-                @${conf} \
-                -i $if \
-                $extra $@`
-@@ -541,7 +475,7 @@ start () {
-   if [ ".${ldlibpath}" !=3D "." ]; then
-     export LD_LIBRARY_PATH=3D"${ldlibpath}"
-   fi
--  daemon ${cmd}
-+  start-stop-daemon --start --quiet --exec $prog -- ${cmd}
-   RETVAL=3D$?
-=20
-   [ $RETVAL =3D 0 ] && touch /var/lock/subsys/${name}${instance}
-@@ -551,6 +485,7 @@ start () {
- stop () {
-   # stop daemon
-=20
-+  NOT_RUNNING=3D1
-   RETVAL=3D1
-   echo -n $"Stopping ${name}${instance}: "
-   logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Stopping:=
 ${name}${instance}"
-@@ -563,13 +498,14 @@ stop () {
-     if [ $rc =3D 0 ]; then
-       logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Sendi=
ng SIGTERM to ${pid}"
-       if [ "${debug}" =3D "y" ]; then echo "Sending SIGTERM to ${pid}"; =
fi
--      kill -s SIGTERM ${pid}
-+      kill -TERM ${pid} 2>&1 > /dev/null
-       RETVAL=3D$?
-       rm -f ${ntopdbfilepath}/ntop.pid
-     else=20
-       logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Unabl=
e to find process ${pid} ... will kill by name"
-       if [ "${debug}" =3D "y" ]; then echo "Unable to find process ${pid=
} ... will kill by name"; fi
-     fi
-+    NOT_RUNNING=3D0
-   else
-=20
-     logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Unable =
to find ${ntopdbfilepath}/ntop.pid file ... will kill by name"
-@@ -577,15 +513,16 @@ stop () {
-=20
-   fi
-=20
--  echo=20
--
-   if [ $RETVAL !=3D 0 ]; then
-     pids=3D`ps axf | grep '\/usr\/bin\/ntop' | awk '{ printf(" %s", $1) =
}; END { print "" }'`
--    if [ "${pids}" !=3D " " ]; then
-+    if [ "${pids}" !=3D "" ]; then
-       logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Sendi=
ng SIGTERM to ${prog}...${pids}"
-       if [ "${debug}" =3D "y" ]; then echo "Sending SIGTERM to ${prog}..=
.${pids}"; fi
--      kill -INT ${pids}
-+      kill -TERM ${pids} > /dev/null 2>&1
-       RETVAL=3D$?
-+      NOT_RUNNING=3D0
-+    else
-+      NOT_RUNNING=3D1
-     fi
-   fi
-=20
-@@ -597,13 +534,9 @@ stop () {
-       if [ "${debug}" =3D "y" ]; then echo "DEBUG: Unconfiguring interfa=
ces"; fi
-=20
-       for eth in ${ntopinterface}; do
--          if ! LANG=3DC egrep -L "^[Nn][Tt][Oo][Pp][Cc].*=3D['\"]?[Yy][E=
e][Ss]['\"]?" \
--                   /etc/sysconfig/network-scripts/ifcfg-$eth > /dev/null=
 ; then
--              logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD=
 - $eth is not ntopconfigure=3Dyes, skipping"
--              if [ "${debug}" =3D "y" ]; then echo "DEBUG: $eth is not n=
topconfigure=3Dyes"; fi
--              continue
-+          if [ "$eth" =3D "none" ]; then
-+               continue
-           fi
--
-           logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - U=
nconfiguring $eth"
-           if [ "${debug}" =3D "y" ]; then echo "DEBUG: Unconfiguring $et=
h"; fi
-    =20
-@@ -623,6 +556,13 @@ stop () {
-       if [ "${debug}" =3D "y" ]; then echo "DEBUG: Interfaces are unconf=
igured"; fi
-   fi
-=20
-+  if [ $NOT_RUNNING -eq 1 -o $RETVAL -eq 0 ]; then
-+    echo " [ OK ]"
-+    RETVAL=3D0
-+  else
-+    echo " [ FAILED ]"
-+  fi
-+
-   return $RETVAL
- }
-=20
---=20
-1.7.5.4
-
diff --git a/meta-networking/recipes-support/ntop/ntop/ntop_webInterface.p=
atch b/meta-networking/recipes-support/ntop/ntop/ntop_webInterface.patch
deleted file mode 100644
index 9f57ca425..000000000
--- a/meta-networking/recipes-support/ntop/ntop/ntop_webInterface.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-change osName to version as it prints out "ntop Version".
-
-Upstream-Status: Pending
-
-Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
----
-diff --git a/webInterface.c b/webInterface.c
-index 5622e69..8cb7a67 100644
---- a/webInterface.c
-+++ b/webInterface.c
-@@ -5816,7 +5816,7 @@ static void printNtopConfigInfoData(int textPrintFl=
ag, UserPref *pref) {
-   printInfoSectionTitle(textPrintFlag, "Basic Information");
-=20
-   safe_snprintf(__FILE__, __LINE__, formatBuf, sizeof(formatBuf), "%s (%=
d bit)",
--	=09osName, sizeof(long) =3D=3D 8 ? 64 : 32);
-+	=09version, sizeof(long) =3D=3D 8 ? 64 : 32);
-   printFeatureConfigInfo(textPrintFlag, "ntop Version", formatBuf);
-=20
- #ifndef WIN32
diff --git a/meta-networking/recipes-support/ntop/ntop/use-static-inline.p=
atch b/meta-networking/recipes-support/ntop/ntop/use-static-inline.patch
deleted file mode 100644
index 2b001c13e..000000000
--- a/meta-networking/recipes-support/ntop/ntop/use-static-inline.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-[PATCH] replace 'inline' with 'static inline' for gcc 5.x
-
-gcc 5.x defaults to -std=3Dgnu11 instead of -std=3Dgnu89 which change
-the semantics for inline functions and the standalone 'inline'
-causes error with "gcc5 -g -o0"
-=20
-Replace inline with static inline to be compatible with both gcc 4
-and 5.
-
-Upstream-status: Pending
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- nDPI/src/lib/protocols/ssl.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/nDPI/src/lib/protocols/ssl.c b/nDPI/src/lib/protocols/ssl.c
-index 245b8c3..72beda9 100644
---- a/nDPI/src/lib/protocols/ssl.c
-+++ b/nDPI/src/lib/protocols/ssl.c
-@@ -39,7 +39,7 @@ static void ipoque_int_ssl_add_connection(struct ipoque=
_detection_module_struct
-=20
- #ifdef HAVE_NTOP
- #ifndef WIN32
--inline int min(int a, int b) { return(a < b ? a : b); }
-+static inline int min(int a, int b) { return(a < b ? a : b); }
- #endif
-=20
- static void stripCertificateTrailer(char *buffer, int buffer_len) {
---=20
-1.9.1
-
diff --git a/meta-networking/recipes-support/ntop/ntop_5.0.1.bb b/meta-net=
working/recipes-support/ntop/ntop_5.0.1.bb
deleted file mode 100644
index 13a878412..000000000
--- a/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
+++ /dev/null
@@ -1,142 +0,0 @@
-SUMMARY =3D "ntop is network top"
-DESCRIPTION =3D "ntop is a network traffic probe that shows the network u=
sage, \
-similar to what the popular top Unix command does."
-
-SECTION =3D "console/network"
-
-LICENSE =3D "GPLv2+ & GPLv3 & OpenSSL"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae5=
04 \
-                    file://LICENSE-OpenSSL.txt;md5=3Da409f902e447ddd889cf=
fa0c70e7c7c2 \
-                   "
-
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/ntop/ntop-${PV}.tar.gz \
-           file://ntop_configure_in.patch \
-           file://ntop_init.patch \
-           file://ntop_webInterface.patch \
-           file://ntop_configure_in_net_snmp_config_exist.patch \
-           file://ntop.service \
-           file://use-static-inline.patch \
-           file://0001-nDPI-Include-sys-types.h.patch \
-           file://0001-plugins-Makefile.am-fix-for-automake-1.16.1.patch =
\
-           file://fix-missing-return-from-non-void-function.patch \
-           file://embed-libs.patch \
-          "
-SRC_URI[md5sum] =3D "01710b6925a8a5ffe1a41b8b512ebd69"
-SRC_URI[sha256sum] =3D "7e8e84cb14d2173beaca4d4cb991a14d84a4bef84ec37b227=
6bc363f45c52ef8"
-
-UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/ntop/files/ntop/=
Stable"
-
-inherit autotools-brokensep useradd python3native pkgconfig systemd
-
-DEPENDS =3D "geoip rrdtool python3 zlib libpcap gdbm"
-
-PACKAGECONFIG ??=3D "openssl snmp plugins"
-PACKAGECONFIG[openssl] =3D "--with-ssl, --without-ssl, openssl, openssl"
-PACKAGECONFIG[snmp] =3D "--enable-snmp=3Dyes NETSNMP=3D${STAGING_BINDIR_C=
ROSS}/net-snmp-config, \
---disable-snmp,net-snmp,"
-PACKAGECONFIG[plugins] =3D "--enable-plugins=3Dyes, --disable-plugins, ,"
-
-EXTRA_OECONF +=3D "ac_cv_file_aclocal_m4=3Dyes ac_cv_file_depcomp=3Dno PY=
THON_CONFIG=3Dpython3-config"
-
-do_configure() {
-    cp ${STAGING_DATADIR_NATIVE}/aclocal/libtool.m4 libtool.m4.in
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S=
}
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S=
}/nDPI
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/=
nDPI
-    cat acinclude.m4.in acinclude.m4.ntop libtool.m4.in > acinclude.m4
-    cp 3rd_party/* ./
-
-    # config nDPI
-    cd nDPI
-    ./configure ${CONFIGUREOPTS} --with-pic
-    cd ..
-
-    sed -i -e 's:^CFG_DBFILE_DIR=3D$localstatedir/ntop:CFG_DBFILE_DIR=3D$=
localstatedir/lib/ntop:' ${S}/configure.in
-
-    # fix the CFLAGS, CPPFLAGS, LDFLAGS, remove the host include
-    sed -i \
-        -e 's:\(^CFLAGS=3D"\$.*\) -I/usr/local/include -I/opt/local/inclu=
de":\1":' \
-        -e 's:\(^CPPFLAGS=3D"\$.*\) -I/usr/local/include -I/opt/local/inc=
lude":\1":' \
-        -e 's:\(^LDFLAGS=3D"\$.*\) -L/usr/local/lib -L/opt/local/lib":\1"=
:' \
-        ${S}/configure.in
-
-    # replace the DISTRO RELEASE in configure.in which are host's
-    # with our release, although those doesn't affect functionality
-    sed -i -e \
-        '/DEFINEOS=3D"LINUX"/{N;s/DISTRO=3D.*/DISTRO=3D"${DISTRO}"/;N;s/R=
ELEASE=3D.*/RELEASE=3D"${DISTRO_VERSION}"/;}' \
-        ${S}/configure.in
-
-    # osName in original configure.in should be ${TARGET_SYS}
-    # which will show in ntop's "show configuration"
-    sed -i -e \
-        's:^osName=3D.*:osName=3D${TARGET_SYS}:' \
-        ${S}/configure.in
-
-    # rename configureextra to configureextra_rename to avoid
-    # configure.in to guess host OS and pull in more configure, non neede=
d
-    # which will cause some cross-compiling failure on specific host
-    # e.g. SUSE(SLED...)
-    test ! -f configureextra || mv -f configureextra configureextra_renam=
e
-
-    # make sure configure finds python includdirs/libs with these envs
-    export BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
-        STAGING_INCDIR=3D${STAGING_INCDIR} \
-        STAGING_LIBDIR=3D${STAGING_LIBDIR}
-
-    autotools_do_configure
-}
-
-do_compile_prepend() {
-    cd nDPI
-    oe_runmake
-    cd ..
-}
-
-do_install_append() {
-    # remove the empty dirs
-    rm -rf ${D}${libdir}/plugins
-
-    install -D -m 0755 ${S}/packages/RedHat/ntop.init \
-        ${D}${sysconfdir}/init.d/ntop
-    install -D -m 0644 ${S}/packages/RedHat/ntop.conf.sample \
-        ${D}${sysconfdir}/ntop.conf
-
-    # change ntop dir in ntop.conf
-    # don't use the -P as the ntop.init didn't support it
-    sed -i -e "s:^--db-file-path /usr/share/ntop:--db-file-path /var/lib/=
ntop:" \
-        -e "s:^#? -P /var/ntop:#? -P /var/lib/ntop:" \
-        ${D}${sysconfdir}/ntop.conf
-
-    # For systemd
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false'=
, d)}; then
-        install -D -m 0755 ${S}/packages/RedHat/ntop.init ${D}${libexecdi=
r}/ntop-helper
-        install -D -m 0644 ${WORKDIR}/ntop.service ${D}${systemd_system_u=
nitdir}/ntop.service
-        sed -i -e 's,@LIBEXECDIR@,${libexecdir},g' \
-            -e 's,@SYSCONFDIR@,${sysconfdir},g' \
-            ${D}${systemd_system_unitdir}/ntop.service
-    fi
-
-    # Fix host-user-contaminated issue
-    chown -R root:root ${D}
-
-    chown -R ntop.ntop ${D}${datadir}/ntop
-    chown -R ntop:ntop ${D}${localstatedir}/lib/ntop
-}
-
-USERADD_PACKAGES =3D "${PN}"
-USERADD_PARAM_${PN} =3D "-M -g ntop -r -d ${localstatedir}/lib/ntop \
--s /usr/sbin/nologin -c 'ntop' ntop"
-GROUPADD_PARAM_${PN} =3D "-r ntop"
-
-SYSTEMD_SERVICE_${PN} =3D "ntop.service"
-SYSTEMD_AUTO_ENABLE =3D "disable"
-
-FILES_${PN}_append =3D "${libdir}/ntop/plugins ${libdir}/libntop-*.so \
-                      ${libdir}/libntopreport-*.so ${libdir}/lib*-${PV}.s=
o"
-FILES_${PN}-dev =3D "${includedir} ${libdir}/libntop.so \
-                   ${libdir}/libntopreport.so \
-                   ${libdir}/libnetflowPlugin.so ${libdir}/libsflowPlugin=
.so \
-                   ${libdir}/librrdPlugin.so \
-                   ${libdir}/*.la"
-
--=20
2.26.2

