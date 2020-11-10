Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.45])
 by mx.groups.io with SMTP id smtpd.web11.22050.1604973100858609288
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 17:51:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ECeONRkv;
 spf=pass (domain: windriver.com, ip: 40.107.236.45, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TP18sd1bN15KvkyZA7tKD9deSg5pEWtJkxc5rszREkBrdgzPIAXaId0PhHIqzM0aOK0EPCt/gYtR8eBkBq1ATjQawNhGgp493n7fXBD1udXSo7KtA9/zHMLJGZh3J09+SX5PY49s5YeG32DIGsC5Sg/agAbmSW1ZvmAWd1V2GoD69VCsVzQT6t6dNHpJCwumm8uXy7dQ0LyuizDHeDhJa+AeYDNstD7O73iRiig0NDD/LNe48op6jqPyT1SakmsVCrYDl/E69cJ4e7wti5Sh9Ao7yqbE5tNwivHNrkdq2GgsDcTiqe1fbrfrO+ZBnrQ4WMoWa3UMfE7DOr2/HsbzAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+Ls/KcwchksZB/NXjnmUyC1xWeLr0txr60KYLxB3fk=;
 b=A/UDZD7TY1vAlFvmisZLO1GbdekEoQI6lPH6CQ65Atu1gWlgC9/vQCbWRE0rxD4J1XXlyTRWBhWvwpBXp8HfYpQh23pbddHC2a2+JB10Gj5djDw3wUkwuTZDds106IFoeewjET6GUWwKFgbbPM/iGz/td7AzwNgElEHcMcbUiQRj9vqLMkLDpDg0otmnJ6wTMpXyxeqnDPU0ishA4IJh7n5iyzX773N9uqoNyTi8rHCLkDKS/kPdDaaJOa/IoN8BFhFMyEjfsqcT4C1etcHcOEGf42a43Xw1VJdFo/4/y8MkYF8XZ+5IpeRlLfDdXlDB6isMB4Exr4NM2g13JxI4KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+Ls/KcwchksZB/NXjnmUyC1xWeLr0txr60KYLxB3fk=;
 b=ECeONRkvRxCwN3di2ESLHjtJKScMswqg8/sg3QcCKQTyqoEPsD4sSSp47lUzPEMo3zsIzzsAK5sb0uSOxBAPXLu0Ez0LqZOsqZ0odO/qspVJ16ZqQAYHd85Uvy59bETPOVUg7rpdnPVSB/zfQ3szltZ+/hzD5T43oOWsqw1W108=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MW3PR11MB4540.namprd11.prod.outlook.com (2603:10b6:303:56::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.24; Tue, 10 Nov
 2020 01:51:38 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f%7]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 01:51:38 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: raj.khem@gmail.com,
	openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH v4 4/4] ntop: remove the recipe
Date: Tue, 10 Nov 2020 09:51:21 +0800
Message-Id: <20201110015121.11481-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAMKF1sru02J6BaL=1c_=2Xkm7ocFT-dBiMZbDZH-x1F-crvidg@mail.gmail.com>
References: <CAMKF1sru02J6BaL=1c_=2Xkm7ocFT-dBiMZbDZH-x1F-crvidg@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0401CA0005.apcprd04.prod.outlook.com
 (2603:1096:202:2::15) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2PR0401CA0005.apcprd04.prod.outlook.com (2603:1096:202:2::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 01:51:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f970b4c-c087-4119-1f56-08d8851b29a1
X-MS-TrafficTypeDiagnostic: MW3PR11MB4540:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4540773994BFBB8B38673443F1E90@MW3PR11MB4540.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L1Z/luWg3jIjCBJhs0S0QfENHsIX6w9gtb2AwaRvnn8rsl7+j3rGCDnqtKhGd8NtmrAzGPWmkSmwwe0g48AH0XXzeqc0+T2eN6rZW+YfQbhwUDmusLtBROwHQlyLNDWtoV2LMMckOmfaD8iPNwJxedxNC6J8O47XKvxAslCvpgS2tYWp95bO1oBU+cViy1TcNf77yRYV4yR7eMjn/m7PzeMM1lsb7RLzuzK2rmBFa29Yn3p4q+KFsSxdMfGnClv/fsTrp/F2dk18+LRWXM62yIgoM1mrKwQ/UCJjlWo8RrgZye6yQ9TlzjPQr8YlvhBKBOaPTpuxfwnuDN+gfNobhf/KLM+/4wyExUZR+HF+HrJcZRUxctmtZqd7rPX9MQco3HU9aoUvVCjTnyeLPqZVJg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(366004)(39850400004)(956004)(66556008)(66476007)(2906002)(6666004)(8676002)(8936002)(9686003)(6512007)(66946007)(186003)(16526019)(26005)(6506007)(52116002)(966005)(6486002)(1076003)(83380400001)(5660300002)(30864003)(316002)(2616005)(36756003)(86362001)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	NNPcHSZurwPbXJpm9U4WYuI2IBIXTKws2Do4ihhX9BPbJG0qJ8+HJnsehB3L+mrAWlN+6VE860XRqDiH3GGymYlAb7ahI9A0v73c4mhEr6dgh5bBaptN2UHm7FUnh2rep2WmSv4BIiV8HRRuvcWP+ZgSKdrUpt6YV4I+5+EtCQefgOmyV5KUqRxuiIi6rCLG2xMhJEQovD37gYU/Oah3kdzc/qIgGUdnzkGlTnl6rkd5tcJULi9tQR122s2sp1GgTmgMKj4x6ophvVy8TvqpjDHQiw5red6vWOSSyfKGMRbvRM6hM+spLXIZ2eC8zVmd99kRaE6NXvi6sDVAqKqqh+Mj2AO5IDGSx2AQJBWyJGnhIGQEVXpzanIj4CnO54e4AzH9I2uDilbhB+We2Fr8msE4/XPDEE/T0cg2ltMNB/Va8M/RKjRWxgui+Rw4X+rbcO7zdniLUvlRpTHp5QrOVBUgcKJBdaUk8w3j7F8z7PuQaIGJtyYpmKHYN6tLQzKN28mTaPele+Wb95EeKED5a+fVCtOWXxDgrhxuKsFLX/5vzKrRu4X6sHe7xkc3rlXX0jBnwPulFsJZmT9Ep05sfjuXgoUe1FVcsY+SUia7vSzRUHYP0g7zBIG36ZVhrizG0xS0lO1+MCErX4CUcSp58WnZ5r6LyTp0HD9CgZHcOodi0w6khU+eo9nGgqVSfcImjLOXeZf6qD35oSKjCJScjYM0mK+BlMKLZBYg0HbWSbR80J+OQpEkrPJwZ24FPYOd/r1Ho55R0hLTFFW7/FHwktPQ2Ks2ghftP037AR9QCdvmAUNcp/5l4C5r3CTVam5CUbyDtJs/BIWp+TDddDamwt70MCEeAeQYysPG25eLw87WyGsxo4zWhvBu2PWOjrRbmHDTdXzKmUc7tIi2q1g41A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f970b4c-c087-4119-1f56-08d8851b29a1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 01:51:38.5366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SVAEZhkNBF9hRoVb/8jT61r7PKZGQXwUpB7jJ9jpOOXWtJUcdnNrkK5IqAj0V6ojzXlVwnmpFUkZAEjSShqMeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4540
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
 delete mode 100644 meta-networking/recipes-support/ntop/ntop/0001-nDPI-Include-sys-types.h.patch
 delete mode 100644 meta-networking/recipes-support/ntop/ntop/0001-plugins-Makefile.am-fix-for-automake-1.16.1.patch
 delete mode 100644 meta-networking/recipes-support/ntop/ntop/embed-libs.patch
 delete mode 100644 meta-networking/recipes-support/ntop/ntop/fix-missing-return-from-non-void-function.patch
 delete mode 100644 meta-networking/recipes-support/ntop/ntop/ntop.service
 delete mode 100644 meta-networking/recipes-support/ntop/ntop/ntop_configure_in.patch
 delete mode 100644 meta-networking/recipes-support/ntop/ntop/ntop_configure_in_net_snmp_config_exist.patch
 delete mode 100644 meta-networking/recipes-support/ntop/ntop/ntop_init.patch
 delete mode 100644 meta-networking/recipes-support/ntop/ntop/ntop_webInterface.patch
 delete mode 100644 meta-networking/recipes-support/ntop/ntop/use-static-inline.patch
 delete mode 100644 meta-networking/recipes-support/ntop/ntop_5.0.1.bb

diff --git a/meta-networking/recipes-support/ntop/ntop/0001-nDPI-Include-sys-types.h.patch b/meta-networking/recipes-support/ntop/ntop/0001-nDPI-Include-sys-types.h.patch
deleted file mode 100644
index 81ffeec21..000000000
--- a/meta-networking/recipes-support/ntop/ntop/0001-nDPI-Include-sys-types.h.patch
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
-===================================================================
---- ntop-5.0.1.orig/nDPI/src/include/ipq_api.h
-+++ ntop-5.0.1/nDPI/src/include/ipq_api.h
-@@ -24,6 +24,7 @@
- #ifndef __IPOQUE_API_INCLUDE_FILE__
- #define __IPOQUE_API_INCLUDE_FILE__
- 
-+#include <sys/types.h>
- 
- #if defined(HAVE_NTOP) && defined(WIN32)
- #include <winsock2.h>
diff --git a/meta-networking/recipes-support/ntop/ntop/0001-plugins-Makefile.am-fix-for-automake-1.16.1.patch b/meta-networking/recipes-support/ntop/ntop/0001-plugins-Makefile.am-fix-for-automake-1.16.1.patch
deleted file mode 100644
index d6f7eb555..000000000
--- a/meta-networking/recipes-support/ntop/ntop/0001-plugins-Makefile.am-fix-for-automake-1.16.1.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From d22ddc73f00ed056032a635ee8379305ec83bf81 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Wed, 11 Jul 2018 12:02:50 +0800
-Subject: [PATCH] plugins/Makefile.am: fix for automake 1.16.1
-
-Fixed:
-| i586-poky-linux-gcc: error: netflowPlugin.o: No such file or directory
-| i586-poky-linux-gcc: error: unrecognized command line option '-flat_namespace'; did you mean '-Wnamespaces'?
-| i586-poky-linux-gcc: fatal error: no input files
-
-The previous code make things complicated, but we don't have to, let libtool do
-most of the things can fix the problem.
-
-Upstream-Status: Pending [ntop is not longer maintained any more, we need consider moving to ntopng]
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
-@@ -69,40 +69,18 @@ libsflowPlugin_la_CFLAGS = $(AM_CFLAGS)
- # by default ntop looks for plugins in the plugins/ subdirectory
- #
- 
--
--.libs/libnetflowPlugin.so@SO_VERSION_PATCH@:
--	@if test -f libnetflowPlugin_la-netflowPlugin.o; then \
--	$(CC) @MAKE_SHARED_LIBRARY_PARM@ -o .libs/libnetflowPlugin.so@SO_VERSION_PATCH@ libnetflowPlugin_la-netflowPlugin.o; \
--	else \
--	$(CC) @MAKE_SHARED_LIBRARY_PARM@ -o .libs/libnetflowPlugin.so@SO_VERSION_PATCH@ netflowPlugin.o; \
--	fi
--
--netflowPlugin.so$(EXEEXT): .libs/libnetflowPlugin.so@SO_VERSION_PATCH@
--	@$(LN_S) .libs/libnetflowPlugin.so netflowPlugin.so
-+netflowPlugin.so$(EXEEXT): libnetflowPlugin.la
-+	@$(LN_S) -f .libs/libnetflowPlugin.so netflowPlugin.so
- 
- ###############
- 
--.libs/librrdPlugin.so@SO_VERSION_PATCH@:
--	@if test -f librrdPlugin_la-rrdPlugin.o; then \
--	$(CC) @MAKE_SHARED_LIBRARY_PARM@ -o .libs/librrdPlugin.so@SO_VERSION_PATCH@ librrdPlugin_la-rrdPlugin.o; \
--	else \
--	$(CC) @MAKE_SHARED_LIBRARY_PARM@ -o .libs/librrdPlugin.so@SO_VERSION_PATCH@ rrdPlugin.o; \
--	fi
--
--rrdPlugin.so$(EXEEXT): .libs/librrdPlugin.so@SO_VERSION_PATCH@
--	@$(LN_S) .libs/librrdPlugin.so rrdPlugin.so
-+rrdPlugin.so$(EXEEXT): librrdPlugin.la
-+	@$(LN_S) -f .libs/librrdPlugin.so rrdPlugin.so
- 
- ###############
- 
--.libs/libsflowPlugin.so@SO_VERSION_PATCH@:
--	@if test -f libsflowPlugin_la-sflowPlugin.o; then \
--	$(CC) @MAKE_SHARED_LIBRARY_PARM@ -o .libs/libsflowPlugin.so@SO_VERSION_PATCH@ libsflowPlugin_la-sflowPlugin.o; \
--	else \
--	$(CC) @MAKE_SHARED_LIBRARY_PARM@ -o .libs/libsflowPlugin.so@SO_VERSION_PATCH@ sflowPlugin.o; \
--	fi
--
--sflowPlugin.so$(EXEEXT): .libs/libsflowPlugin.so@SO_VERSION_PATCH@
--	@$(LN_S) .libs/libsflowPlugin.so sflowPlugin.so
-+sflowPlugin.so$(EXEEXT): libsflowPlugin.la
-+	@$(LN_S) -f .libs/libsflowPlugin.so sflowPlugin.so
- 
- ###############
- 
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-support/ntop/ntop/embed-libs.patch b/meta-networking/recipes-support/ntop/ntop/embed-libs.patch
deleted file mode 100644
index 2d1ab7371..000000000
--- a/meta-networking/recipes-support/ntop/ntop/embed-libs.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Use --embed option so that it can return libpython as well
-
-% ../recipe-sysroot-native/usr/bin/python3-native/python3-config --libs --embed
--lpython3.8 -lcrypt -lpthread -ldl -lutil -lm -lm
-[kraj@apollo /mnt/b/yoe/build/tmp/work/cortexa7t2hf-neon-vfpv4-yoe-linux-gnueabi/ntop/5.0.1-r0/ntop-5.0.1]
-% ../recipe-sysroot-native/usr/bin/python3-native/python3-config --libs
--lcrypt -lpthread -ldl -lutil -lm -lm
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/configure.in
-+++ b/configure.in
-@@ -1463,7 +1463,7 @@ dnl>
-   fi
- 
-   if test "x$PYTHON_CONFIG" != "x"; then
--    PYTHON_LIBS="`$PYTHON_CONFIG --libs`"
-+    PYTHON_LIBS="`$PYTHON_CONFIG --libs --embed`"
-     if test "x$PYTHON_LIBS" = "x"; then
-       AC_MSG_RESULT(Python[-devel] support is present but misconfigured)     
-     else   
diff --git a/meta-networking/recipes-support/ntop/ntop/fix-missing-return-from-non-void-function.patch b/meta-networking/recipes-support/ntop/ntop/fix-missing-return-from-non-void-function.patch
deleted file mode 100644
index e627e59a5..000000000
--- a/meta-networking/recipes-support/ntop/ntop/fix-missing-return-from-non-void-function.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Fix following error:
-
-netflowPlugin.c: In function 'netflowUtilsLoop':
-netflowPlugin.c:2144:1: error: no return statement in function returning non-void [-Werror=return-type]
- 2144 | }
-      | ^
-
-Return NULL like netflowMainLoop does.
-
---- ntop-5.0.1.orig/plugins/netflowPlugin.c	2012-03-09 17:44:17.000000000 +0000
-+++ ntop-5.0.1/plugins/netflowPlugin.c	2019-08-09 10:25:40.878799852 +0000
-@@ -2141,6 +2141,7 @@
-       waitCondvar(&myGlobals.device[deviceId].netflowGlobals->ifStatsQueueCondvar);
-     }
-   }
-+  return(NULL);
- }
- #endif
- 
diff --git a/meta-networking/recipes-support/ntop/ntop/ntop.service b/meta-networking/recipes-support/ntop/ntop/ntop.service
deleted file mode 100644
index 1ead2a0c5..000000000
--- a/meta-networking/recipes-support/ntop/ntop/ntop.service
+++ /dev/null
@@ -1,15 +0,0 @@
-[Unit]
-Description=A network traffic probe similar to the UNIX top command
-Requires=network.target
-
-ConditionPathExists=@SYSCONFDIR@/ntop.conf
-After=syslog.target network.target
-
-[Service]
-Type=oneshot
-RemainAfterExit=yes
-ExecStart=@LIBEXECDIR@/ntop-helper start
-ExecStop=@LIBEXECDIR@/ntop-helper stop
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-networking/recipes-support/ntop/ntop/ntop_configure_in.patch b/meta-networking/recipes-support/ntop/ntop/ntop_configure_in.patch
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
-               [  +-External-source-locations:-------------------------------------------------+])
- 
--AC_ARG_WITH(  rrd-home,
--              [  --with-rrd-home=DIR        Usually /usr/local/rrdtool-1.2.x],
--              RRD_HOME="$withval",
--              RRD_HOME=/usr/local/rrdtool-1.2.19)
- AC_ARG_WITH(  pcap-root,
-               [  --with-pcap-root=DIR        LBNL pcap located in DIR],
-               PCAP_ROOT="$withval",
-               PCAP_ROOT=)
-+AC_ARG_WITH(  pcap-config,
-+              [  --with-pcap-config=path/pcap-config where to find pcap-config],
-+              PCAP_CONFIG="$withval",
-+              PCAP_CONFIG=)
- AC_ARG_WITH(  gdbm-root,
-               [  --with-gdbm-root=DIR        gdbm located in DIR],
-               GDBM_DIRECTORY="$withval",
-@@ -556,6 +556,7 @@ if test ".${PCAPRING_DIR}" != .; then
- else
- 
- TMP_ROOT=${HOME}/PF_RING/userland/libpcap/
-+FOUND_PCAP=1
- if test ".${PCAP_ROOT}" == . &&
-    test -d ${TMP_ROOT} &&
-    test -r ${TMP_ROOT}/libpcap.a; then
-@@ -563,6 +564,18 @@ if test ".${PCAP_ROOT}" == . &&
-        CORELIBS="${CORELIBS} -L${TMP_ROOT} -L${HOME}/PF_RING/userland/lib -lpfring -lpcap "
-        INCS="${INCS} -I ${PCAP_ROOT}"
-        AC_MSG_RESULT([found in $PCAP_ROOT])
-+elif test -n "${PCAP_CONFIG}" && test -x "${PCAP_CONFIG}"; then
-+       CORELIBS="${CORELIBS} $(${PCAP_CONFIG} --libs)" 
-+       INCS="${INCS} $(${PCAP_CONFIG} --cflags)"
-+       AC_DEFINE_UNQUOTED(HAVE_LIBPCAP, 1, [have libpcap ])
-+       AC_MSG_RESULT([found pcap-config: $PCAP_CONFIG, libs:$(${PCAP_CONFIG} --libs) cflags:$(${PCAP_CONFIG} --cflags)])
-+else
-+     AC_CHECK_LIB(pcap, pcap_lookupdev, ,
-+        [FOUND_PCAP=])
-+fi
-+
-+if test -n "$FOUND_PCAP"; then
-+	:
- elif test ".${PCAP_ROOT}" != .; then
-   if test -d $PCAP_ROOT &&
-      test -r $PCAP_ROOT/lib/libpcap.a &&
-@@ -880,44 +893,11 @@ AC_CHECK_LIB([z], [zlibVersion], [], [
-         exit -1
-         ])
- 
--# RRD
--if test -d "$RRD_HOME"; then
--   AC_MSG_RESULT(checking for RRD home... yes)
--else
--   RRD_HOME=/usr/local/rrdtool
--   if test -d "$RRD_HOME"; then
--      AC_MSG_RESULT(Checking rrdtool in $RRD_HOME)
--   else
--      RRD_HOME=/usr/local
--   fi
--fi
--
--RRD_LIB="-L${RRD_HOME}/lib -lrrd_th"
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
--       if test ".${ac_cv_lib_rrd_th_main}" != ".yes"; then
--         AC_MSG_ERROR(Unable to find RRD at $RRD_HOME: please use --with-rrd-home=DIR);
--	 AC_MSG_ERROR(RRD source can be downloaded from http://www.rrdtool.org/);
--       else
--         RRD_LIB=
--       fi
--     fi
--  fi
--fi
--
--RRD_INC=
--if test -d "${RRD_HOME}/include"; then
--  RRD_INC="-I${RRD_HOME}/include"
--fi
-+PKG_CHECK_MODULES( [RRD], [librrd] )
-+AC_SUBST(RRD_CFLAGS)
-+AC_SUBST(RRD_LIBS)
-+RRD_INC=$RRD_FLAGS
-+RRD_LIB=$RRD_LIBS
- 
- dnl> The failed recheck stuff below is courtesy of Chris Turbeville [turbo@verio.net]
- dnl> Chris developed this for Solaris 9, confirming work I had done earlier for FreeBSD
-@@ -1041,7 +1021,7 @@ AC_CHECK_HEADERS([sched.h sys/sched.h])
- AC_CHECK_HEADERS([pthread.h])
- 
- AC_MSG_CHECKING([if r/w locks are supported])
--AC_TRY_RUN([
-+AC_COMPILE_IFELSE([
- #include <pthread.h>
- 
- int main()
-@@ -1443,15 +1423,15 @@ dnl> NET-SNMP
- dnl>
- if test ".${ac_disable_snmp}" != ".yes"; then
-   AC_CHECK_TOOL(NETSNMP, net-snmp-config)
--  if test "x$ac_cv_prog_ac_ct_NETSNMP" = "xnet-snmp-config"; then
-+  if test -n "$NETSNMP"; then
-     AC_DEFINE_UNQUOTED(HAVE_SNMP, 1, [SNMP is supported])
--    SNMPLIBS="`net-snmp-config --libs`"
-+    SNMPLIBS="`$NETSNMP --libs`"
-     SNMPLIBS="`echo ${SNMPLIBS}|sed -e s,'-R../lib',,g`"
-     echo "net-snmp libs: ${SNMPLIBS}"
-     LIBS="${LIBS} ${SNMPLIBS}"
- dnl remove unecessary path
-     LIBS=`echo ${LIBS}|sed -e s,'-R../lib',,g`
--    INCS="${INCS} `net-snmp-config --cflags`"
-+    INCS="${INCS} `$NETSNMP --cflags`"
-   else
-     AC_MSG_RESULT(NETSNMP is not present: SNMP support is disabled)
-   fi
-@@ -1464,10 +1444,9 @@ SAVED_LIBS=$LIBS
- dnl>
- dnl> PYTHON
- dnl>
--  AC_CHECK_TOOL(PYTHON, python-config)
--  PYTHON_CONFIG=""
-+  AC_CHECK_TOOL(PYTHON_CONFIG, python-config)
- 
--  if test "x$ac_cv_prog_ac_ct_PYTHON" != "xpython-config"; then   
-+  if test -z "$PYTHON_CONFIG"; then   
-        if test -f "/etc/debian_version"; then
-        	   AC_MSG_RESULT(Please install python-dev and rerun configure)
- 	   exit 1
-@@ -1481,8 +1460,6 @@ dnl>
-           PYTHON_CONFIG="python-config"
-         fi
-      fi
--  else
--     PYTHON_CONFIG="python-config"
-   fi
- 
-   if test "x$PYTHON_CONFIG" != "x"; then
diff --git a/meta-networking/recipes-support/ntop/ntop/ntop_configure_in_net_snmp_config_exist.patch b/meta-networking/recipes-support/ntop/ntop/ntop_configure_in_net_snmp_config_exist.patch
deleted file mode 100644
index 269138df9..000000000
--- a/meta-networking/recipes-support/ntop/ntop/ntop_configure_in_net_snmp_config_exist.patch
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
- if test ".${ac_disable_snmp}" != ".yes"; then
-   AC_CHECK_TOOL(NETSNMP, net-snmp-config)
--  if test -n "$NETSNMP"; then
-+  if test -n "$NETSNMP" -a -e "$NETSNMP"; then
-     AC_DEFINE_UNQUOTED(HAVE_SNMP, 1, [SNMP is supported])
-     SNMPLIBS="`$NETSNMP --libs`"
-     SNMPLIBS="`echo ${SNMPLIBS}|sed -e s,'-R../lib',,g`"
diff --git a/meta-networking/recipes-support/ntop/ntop/ntop_init.patch b/meta-networking/recipes-support/ntop/ntop/ntop_init.patch
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
- packages/RedHat/ntop.init |  102 +++++++++-----------------------------------
- 1 files changed, 21 insertions(+), 81 deletions(-)
-
-diff --git a/packages/RedHat/ntop.init b/packages/RedHat/ntop.init
-index 40d49f1..a189c59 100755
---- a/packages/RedHat/ntop.init
-+++ b/packages/RedHat/ntop.init
-@@ -10,19 +10,9 @@
- #           You have set the admin password - read docs/1STRUN.txt
- #           You have created /etc/ntop.conf with appropriate parameters.
- 
--#  To identify an interface to ntop, use the following flags 
--#  in /etc/sysconfig/network-scripts/ifcfg-ethx
--
--#   NTOP="yes"      <--- means for ntop to use this interface
--#   NTOPCONFIG="yes"  <--- means for ntop to configure this interface
--
- # Note that if you give a -i parameter in either /etc/ntop.conf or
- # the command line, the scan is NOT performed.  
- 
--# However, when it comes to the configuration step, with NTOPCONFIG="yes"
--# the interface is configured regardless of how the interface list was
--# specified.
--
- #
- #  
- # 
-@@ -107,11 +97,7 @@ ntopusesyslog="local3"
- invoked=$0
- 
- # Source function library.
--. /etc/rc.d/init.d/functions
--
--# Source networking configuration.
--. /etc/sysconfig/network
--
-+. /etc/init.d/functions
- 
- # Basic sanity checks...
- if ! [ -x $prog ]; then
-@@ -124,16 +110,6 @@ if ! [ -x $prog ]; then
-   exit 1
- fi
- 
--if [ ${NETWORKING} = "no" ]; then
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
- if [ "${debug}" = "y" ]; then echo "DEBUG: parm file temp is ${parmfile}"; fi
-  
- cmd=`echo \
--    @${conf} \
-     -i tbd \
-+    @${conf} \
-     $extra $@`
- 
- echo ${cmd} | awk ' \
-@@ -305,42 +281,6 @@ logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD -      Configuration
- 
- # Build list of interfaces, e.g  eth0 eth1 eth1:1
- # (Yeah, we'll have to convert that to eth0,eth1,eth1:1 later
--if [ ".${ntopinterface}" = ".tbd" ]; then
--
--    ntopinterface=""
--    iflist=`ip link show | \
--        awk '/^[0-9]*:\ eth/ { printf("%s ", substr($2, 1, length($2)-1)) }'`
--    logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Scanning all interfaces $iflist"
--    if [ "${debug}" = "y" ]; then echo "DEBUG: Interface candidates are ${iflist}"; fi
--
--    for eth in $iflist; do
--
--       if ! LANG=C egrep -L "^[Nn][Tt][Oo][Pp]=['\"]?[Yy][Ee][Ss]['\"]?" \
--                /etc/sysconfig/network-scripts/ifcfg-$eth > /dev/null ; then
--            logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - $eth is not ntop=yes, skipping"
--            if [ "${debug}" = "y" ]; then echo "DEBUG: $eth not ntop=yes"; fi
--            continue
--       fi
--
--       ntopinterface="${ntopinterface} $eth"
--  
--       ip=`ip addr show $eth | \
--           awk '/inet/ { printf("%s", substr($2, 1, index($2, "/")-1)) }'`
--
--       if [ ".$ip" = "." ]; then
--           is="is unnumbered interface"
--       else
--           is="has IP address $ip"
--       fi
--       logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - $eth is ntop=yes, ${is}"
--       if [ "${debug}" = "y" ]; then echo "DEBUG: $eth ntop=yes, ${is}"; fi
--
--    done
--
--else
--    logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Skipping interface scan - list in parms"
--fi
--
- if [ "x${ntopinterface}" = "x" ]; then
-   ntopinterface="none"
- fi
-@@ -462,12 +402,6 @@ config_interfaces () {
-           if="${if},${eth}"
-       fi
- 
--       if ! LANG=C egrep -L "^[Nn][Tt][Oo][Pp][Cc].*=['\"]?[Yy][Ee][Ss]['\"]?" \
--                /etc/sysconfig/network-scripts/ifcfg-$eth > /dev/null ; then
--            logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - $eth is not ntopconfigure=yes, skipping"
--            continue
--       fi
--
-       logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Configuring $eth"
-       if [ "${debug}" = "y" ]; then echo "DEBUG: Configuring $eth"; fi
- 
-@@ -527,7 +461,7 @@ start () {
-   show_extra
-   config_interfaces
- 
--  cmd=`echo $prog \
-+  cmd=`echo \
-                @${conf} \
-                -i $if \
-                $extra $@`
-@@ -541,7 +475,7 @@ start () {
-   if [ ".${ldlibpath}" != "." ]; then
-     export LD_LIBRARY_PATH="${ldlibpath}"
-   fi
--  daemon ${cmd}
-+  start-stop-daemon --start --quiet --exec $prog -- ${cmd}
-   RETVAL=$?
- 
-   [ $RETVAL = 0 ] && touch /var/lock/subsys/${name}${instance}
-@@ -551,6 +485,7 @@ start () {
- stop () {
-   # stop daemon
- 
-+  NOT_RUNNING=1
-   RETVAL=1
-   echo -n $"Stopping ${name}${instance}: "
-   logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Stopping: ${name}${instance}"
-@@ -563,13 +498,14 @@ stop () {
-     if [ $rc = 0 ]; then
-       logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Sending SIGTERM to ${pid}"
-       if [ "${debug}" = "y" ]; then echo "Sending SIGTERM to ${pid}"; fi
--      kill -s SIGTERM ${pid}
-+      kill -TERM ${pid} 2>&1 > /dev/null
-       RETVAL=$?
-       rm -f ${ntopdbfilepath}/ntop.pid
-     else 
-       logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Unable to find process ${pid} ... will kill by name"
-       if [ "${debug}" = "y" ]; then echo "Unable to find process ${pid} ... will kill by name"; fi
-     fi
-+    NOT_RUNNING=0
-   else
- 
-     logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Unable to find ${ntopdbfilepath}/ntop.pid file ... will kill by name"
-@@ -577,15 +513,16 @@ stop () {
- 
-   fi
- 
--  echo 
--
-   if [ $RETVAL != 0 ]; then
-     pids=`ps axf | grep '\/usr\/bin\/ntop' | awk '{ printf(" %s", $1) }; END { print "" }'`
--    if [ "${pids}" != " " ]; then
-+    if [ "${pids}" != "" ]; then
-       logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Sending SIGTERM to ${prog}...${pids}"
-       if [ "${debug}" = "y" ]; then echo "Sending SIGTERM to ${prog}...${pids}"; fi
--      kill -INT ${pids}
-+      kill -TERM ${pids} > /dev/null 2>&1
-       RETVAL=$?
-+      NOT_RUNNING=0
-+    else
-+      NOT_RUNNING=1
-     fi
-   fi
- 
-@@ -597,13 +534,9 @@ stop () {
-       if [ "${debug}" = "y" ]; then echo "DEBUG: Unconfiguring interfaces"; fi
- 
-       for eth in ${ntopinterface}; do
--          if ! LANG=C egrep -L "^[Nn][Tt][Oo][Pp][Cc].*=['\"]?[Yy][Ee][Ss]['\"]?" \
--                   /etc/sysconfig/network-scripts/ifcfg-$eth > /dev/null ; then
--              logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - $eth is not ntopconfigure=yes, skipping"
--              if [ "${debug}" = "y" ]; then echo "DEBUG: $eth is not ntopconfigure=yes"; fi
--              continue
-+          if [ "$eth" = "none" ]; then
-+               continue
-           fi
--
-           logger -p ${ntopusesyslog} -t ${name}${instance} -- "INITD - Unconfiguring $eth"
-           if [ "${debug}" = "y" ]; then echo "DEBUG: Unconfiguring $eth"; fi
-     
-@@ -623,6 +556,13 @@ stop () {
-       if [ "${debug}" = "y" ]; then echo "DEBUG: Interfaces are unconfigured"; fi
-   fi
- 
-+  if [ $NOT_RUNNING -eq 1 -o $RETVAL -eq 0 ]; then
-+    echo " [ OK ]"
-+    RETVAL=0
-+  else
-+    echo " [ FAILED ]"
-+  fi
-+
-   return $RETVAL
- }
- 
--- 
-1.7.5.4
-
diff --git a/meta-networking/recipes-support/ntop/ntop/ntop_webInterface.patch b/meta-networking/recipes-support/ntop/ntop/ntop_webInterface.patch
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
-@@ -5816,7 +5816,7 @@ static void printNtopConfigInfoData(int textPrintFlag, UserPref *pref) {
-   printInfoSectionTitle(textPrintFlag, "Basic Information");
- 
-   safe_snprintf(__FILE__, __LINE__, formatBuf, sizeof(formatBuf), "%s (%d bit)",
--		osName, sizeof(long) == 8 ? 64 : 32);
-+		version, sizeof(long) == 8 ? 64 : 32);
-   printFeatureConfigInfo(textPrintFlag, "ntop Version", formatBuf);
- 
- #ifndef WIN32
diff --git a/meta-networking/recipes-support/ntop/ntop/use-static-inline.patch b/meta-networking/recipes-support/ntop/ntop/use-static-inline.patch
deleted file mode 100644
index 2b001c13e..000000000
--- a/meta-networking/recipes-support/ntop/ntop/use-static-inline.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-[PATCH] replace 'inline' with 'static inline' for gcc 5.x
-
-gcc 5.x defaults to -std=gnu11 instead of -std=gnu89 which change
-the semantics for inline functions and the standalone 'inline'
-causes error with "gcc5 -g -o0"
- 
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
-@@ -39,7 +39,7 @@ static void ipoque_int_ssl_add_connection(struct ipoque_detection_module_struct
- 
- #ifdef HAVE_NTOP
- #ifndef WIN32
--inline int min(int a, int b) { return(a < b ? a : b); }
-+static inline int min(int a, int b) { return(a < b ? a : b); }
- #endif
- 
- static void stripCertificateTrailer(char *buffer, int buffer_len) {
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-support/ntop/ntop_5.0.1.bb b/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
deleted file mode 100644
index 13a878412..000000000
--- a/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
+++ /dev/null
@@ -1,142 +0,0 @@
-SUMMARY = "ntop is network top"
-DESCRIPTION = "ntop is a network traffic probe that shows the network usage, \
-similar to what the popular top Unix command does."
-
-SECTION = "console/network"
-
-LICENSE = "GPLv2+ & GPLv3 & OpenSSL"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LICENSE-OpenSSL.txt;md5=a409f902e447ddd889cffa0c70e7c7c2 \
-                   "
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/ntop/ntop-${PV}.tar.gz \
-           file://ntop_configure_in.patch \
-           file://ntop_init.patch \
-           file://ntop_webInterface.patch \
-           file://ntop_configure_in_net_snmp_config_exist.patch \
-           file://ntop.service \
-           file://use-static-inline.patch \
-           file://0001-nDPI-Include-sys-types.h.patch \
-           file://0001-plugins-Makefile.am-fix-for-automake-1.16.1.patch \
-           file://fix-missing-return-from-non-void-function.patch \
-           file://embed-libs.patch \
-          "
-SRC_URI[md5sum] = "01710b6925a8a5ffe1a41b8b512ebd69"
-SRC_URI[sha256sum] = "7e8e84cb14d2173beaca4d4cb991a14d84a4bef84ec37b2276bc363f45c52ef8"
-
-UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/ntop/files/ntop/Stable"
-
-inherit autotools-brokensep useradd python3native pkgconfig systemd
-
-DEPENDS = "geoip rrdtool python3 zlib libpcap gdbm"
-
-PACKAGECONFIG ??= "openssl snmp plugins"
-PACKAGECONFIG[openssl] = "--with-ssl, --without-ssl, openssl, openssl"
-PACKAGECONFIG[snmp] = "--enable-snmp=yes NETSNMP=${STAGING_BINDIR_CROSS}/net-snmp-config, \
---disable-snmp,net-snmp,"
-PACKAGECONFIG[plugins] = "--enable-plugins=yes, --disable-plugins, ,"
-
-EXTRA_OECONF += "ac_cv_file_aclocal_m4=yes ac_cv_file_depcomp=no PYTHON_CONFIG=python3-config"
-
-do_configure() {
-    cp ${STAGING_DATADIR_NATIVE}/aclocal/libtool.m4 libtool.m4.in
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/nDPI
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/nDPI
-    cat acinclude.m4.in acinclude.m4.ntop libtool.m4.in > acinclude.m4
-    cp 3rd_party/* ./
-
-    # config nDPI
-    cd nDPI
-    ./configure ${CONFIGUREOPTS} --with-pic
-    cd ..
-
-    sed -i -e 's:^CFG_DBFILE_DIR=$localstatedir/ntop:CFG_DBFILE_DIR=$localstatedir/lib/ntop:' ${S}/configure.in
-
-    # fix the CFLAGS, CPPFLAGS, LDFLAGS, remove the host include
-    sed -i \
-        -e 's:\(^CFLAGS="\$.*\) -I/usr/local/include -I/opt/local/include":\1":' \
-        -e 's:\(^CPPFLAGS="\$.*\) -I/usr/local/include -I/opt/local/include":\1":' \
-        -e 's:\(^LDFLAGS="\$.*\) -L/usr/local/lib -L/opt/local/lib":\1":' \
-        ${S}/configure.in
-
-    # replace the DISTRO RELEASE in configure.in which are host's
-    # with our release, although those doesn't affect functionality
-    sed -i -e \
-        '/DEFINEOS="LINUX"/{N;s/DISTRO=.*/DISTRO="${DISTRO}"/;N;s/RELEASE=.*/RELEASE="${DISTRO_VERSION}"/;}' \
-        ${S}/configure.in
-
-    # osName in original configure.in should be ${TARGET_SYS}
-    # which will show in ntop's "show configuration"
-    sed -i -e \
-        's:^osName=.*:osName=${TARGET_SYS}:' \
-        ${S}/configure.in
-
-    # rename configureextra to configureextra_rename to avoid
-    # configure.in to guess host OS and pull in more configure, non needed
-    # which will cause some cross-compiling failure on specific host
-    # e.g. SUSE(SLED...)
-    test ! -f configureextra || mv -f configureextra configureextra_rename
-
-    # make sure configure finds python includdirs/libs with these envs
-    export BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-        STAGING_INCDIR=${STAGING_INCDIR} \
-        STAGING_LIBDIR=${STAGING_LIBDIR}
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
-    sed -i -e "s:^--db-file-path /usr/share/ntop:--db-file-path /var/lib/ntop:" \
-        -e "s:^#? -P /var/ntop:#? -P /var/lib/ntop:" \
-        ${D}${sysconfdir}/ntop.conf
-
-    # For systemd
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        install -D -m 0755 ${S}/packages/RedHat/ntop.init ${D}${libexecdir}/ntop-helper
-        install -D -m 0644 ${WORKDIR}/ntop.service ${D}${systemd_system_unitdir}/ntop.service
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
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} = "-M -g ntop -r -d ${localstatedir}/lib/ntop \
--s /usr/sbin/nologin -c 'ntop' ntop"
-GROUPADD_PARAM_${PN} = "-r ntop"
-
-SYSTEMD_SERVICE_${PN} = "ntop.service"
-SYSTEMD_AUTO_ENABLE = "disable"
-
-FILES_${PN}_append = "${libdir}/ntop/plugins ${libdir}/libntop-*.so \
-                      ${libdir}/libntopreport-*.so ${libdir}/lib*-${PV}.so"
-FILES_${PN}-dev = "${includedir} ${libdir}/libntop.so \
-                   ${libdir}/libntopreport.so \
-                   ${libdir}/libnetflowPlugin.so ${libdir}/libsflowPlugin.so \
-                   ${libdir}/librrdPlugin.so \
-                   ${libdir}/*.la"
-
-- 
2.17.1

