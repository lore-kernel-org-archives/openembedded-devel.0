Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.86])
 by mx.groups.io with SMTP id smtpd.web08.9812.1611652918691316369
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jan 2021 01:21:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YVEiLzQo;
 spf=pass (domain: windriver.com, ip: 40.107.220.86, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFMu6zjyvmvllvHbU3dG2DRpTMy5RsuNIKj9C/ui4ah8awPwzAPd+kqVdXQLjsFV5sEzQCiPn7rWZ0p3XW14ZFtqz1KL5emdIPzHfxJ1qbQ0TJ/MPboPI9JLJ9ZuSHrVfyIVfcW/1kR2UfzZ2QUKOcVIGCYJcRNTI41pzk40r3b1LADkDrWdmbwPHdYmj9qffQoPvdrXMit2BqJ3GtjCxfPDaGcc+XfPS7UDbAIPpaEzMQa3Yx9n+BL/oeB/blcQw4xwIxeBcT8uN2JhBLkHu59rhToT7lUgw4op95jFn3cIOFIR5uAyLRJyvUEOp+bLZWmZSPuqb71TVH4vrvgydQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLnPKshfZOg2rjyr0iDyrLYLTHknBD1K9RC2AQMpwjc=;
 b=AqTB8piRnh16JSFWDJSFmETYpNF8KuQymW82figr+bqfOw4tGoflvdHm8btOKutAkGswYIktsaTLZpkS+RnmUcF3f2NbT6S1Dw4yi6Dq8S1sDMwiqMGa0TKjxF32cWGivwpCWA2yHgXHAZBI1DmgBYgOALBfPVrkbCoJo2G8LNlq/8IlFzL47mwLdfQ1ZadkVRB1/3xvZUOA1LgGi6mMmEDYb7IZ3+rXNotsAnOL7T4m4Xt0QVpQnfXQ7TW+A26/+Y7xx0kVxaQWgbfZ99NybdYR7iVRHTvzdI3JIcWNx0n/ikXBAXHeitcl9EMLWT8GLPjmVCl8To6JSLMzocdo1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLnPKshfZOg2rjyr0iDyrLYLTHknBD1K9RC2AQMpwjc=;
 b=YVEiLzQou+N6h9dL22M4+LkGn0h5s0jz+7cGzo9KjaxNfQaIfyy8HCaIDv1hrPK2McdJCVZxjjzNUK0zhA77E3dFt33Pnbjie/W56w6pUECL1ckO4+Tq+D8/BXfjcNya0rKw9580Z22jec0e5CG1VPnh2OlJK40TAR0qHLMyUEY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MW3PR11MB4683.namprd11.prod.outlook.com (2603:10b6:303:5c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Tue, 26 Jan
 2021 09:21:57 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c888:52a9:d69:3859]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c888:52a9:d69:3859%5]) with mapi id 15.20.3784.019; Tue, 26 Jan 2021
 09:21:57 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] mariadb: upgrade to 10.5.8
Date: Tue, 26 Jan 2021 17:21:06 +0800
Message-Id: <20210126092106.27123-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAMKF1so_N34oWGvbL-eDi2ud_rh=s1qWGprqF1gmZzJsTVT4uw@mail.gmail.com>
References: <CAMKF1so_N34oWGvbL-eDi2ud_rh=s1qWGprqF1gmZzJsTVT4uw@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:202:2e::14) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2PR06CA0002.apcprd06.prod.outlook.com (2603:1096:202:2e::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.14 via Frontend Transport; Tue, 26 Jan 2021 09:21:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f5d0846-1c4e-45c2-e5f1-08d8c1dbd3de
X-MS-TrafficTypeDiagnostic: MW3PR11MB4683:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB46833E8B1E451A1963440297F1BC9@MW3PR11MB4683.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ai9xWCjeXyBnkHNQp9H7ULPTZ0ARonhFyJH/1FhpSMleufn2KUjy7VZU6BNiLMAB+aqhhRR0luaRVG2U11/vnsdrX6+uwjdqnDij3hXHUlETCMuxaJL2t+WKDU+N69CVqUiTJEdFCU5W2G0NceSOJJmiZcYf+OPTSCgjE9DiNB3VMXwn8ZO0Uaaoi9/xXYWnoVa/DSxXloAxMDShQnI41QvFbdf551yEl9FR7h78Xs/JWittppgy5QDb+MmBAW1mCtNb4JSRsbDjuhhvLwtHm0bJwBJ2U4H0+Idw0V0dLLi64XFR9o9sA19ilH93aJNv+DibssFhKDEoPGQCbK41btNICJrKt3F5MjwBINS6PCBI6Tv3iceCGFliPklaJFd6UzB3hX5MCPwNL2jqG6XbQXN/NeVl1qbPlxdCt3n5CjzJ5l6lpEd21o1Wsbh2jAIPtNrBqVRnDXotJaugKHH7kQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(39850400004)(396003)(346002)(16526019)(186003)(9686003)(26005)(8936002)(316002)(86362001)(8676002)(66556008)(6666004)(66476007)(6506007)(66946007)(83380400001)(36756003)(6916009)(5660300002)(2906002)(2616005)(52116002)(6512007)(478600001)(1076003)(6486002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?k4Fl/nla2XN/p7bGIin2pHKkZ59jgLl3afoXirvw4U91ynoe+UWE+1t1cP3s?=
 =?us-ascii?Q?vJFQpAv/TLpsmmVSwdbXa/SlDrgTb08oi8tw/EMV+7F/XF8xMko8Be0MKktC?=
 =?us-ascii?Q?7YQ3ERlQQA5/ZGJiaT66KKLGbXAJERZexk9GinGegX53lBFlIcqAE9PucAYc?=
 =?us-ascii?Q?qUCDyYvDFm2pIuMtxCZ8vJqa9sh0SjzJ6D2abXZ2bbMwS3hamjBCur3cm8iw?=
 =?us-ascii?Q?dQkvnTNfxZdpSKUkO9svOu6eyDfSbm8fHclPG8uUaR0kk3LZvX67ugoU7Hh2?=
 =?us-ascii?Q?nGDgSkgoF/krqyUx/sCp/CJXhC7MdYldklpz+McX05SOCH/c33qeFBsVWO1G?=
 =?us-ascii?Q?sFpidPVkbkbwoOkQgPCb4sue7qSfqiQE5DZY7NITWWSnx9yS3URv9/L+VF9i?=
 =?us-ascii?Q?ClkK/me1VdGSIwXt0p7E2CxNvzM/HZtGc1AhUaLPVSVrQPSuW6DoGXrx3357?=
 =?us-ascii?Q?QFGaghnqHWQHyFYl1f8u11G6ZLmERFN3r5yqIEa9Yctot1Ktv3WqC1OBVvfl?=
 =?us-ascii?Q?J9h1LzyhM7bTVxTSBbrD8o7k0IsVRr7gk9rD8U5vORoYUw0TQ4kbRsc0KMsq?=
 =?us-ascii?Q?sujATB1URgMHR+0bG1oJ9i6hAmPrWTiCdv1ixV9qgEkHeBWk0OmdbbbGjZri?=
 =?us-ascii?Q?i457kiRwKVzOvBx/eoVbMBz6uLNYt7FO4gGeKOFxJnevvKVQaqx/y0CjdLGd?=
 =?us-ascii?Q?ZkqANaZHWANsv8APiD1xnQQsC7cSzt26CfxREd06m/sAKB9UkbNIG/hOSsch?=
 =?us-ascii?Q?3bjLB+g9I3GI2gBG3/oyA0aveaoSqV0Fix99pjoSH2Qu9anQ1Yuqn60IM9Sh?=
 =?us-ascii?Q?FgwS+bzOuObOkitQm39TAeN6OghioWPyu1LpG3UKVcXMlZNZc0YC0u5ibeqF?=
 =?us-ascii?Q?/fE6TCMWKyiH9oryobdtzqekFh2zjwhH7mPECgqz6nF8rgaVBrUsvnbYk3IN?=
 =?us-ascii?Q?hBAIMusGN7Sv1h+wxViN3Z9FE2aG72CCcrhg9B0xHRbWhEN7+9LWzU8SMQUj?=
 =?us-ascii?Q?+FrOMGtr5dQwYT8Jle8vvGtAMlITpQVOLJlSeNTzdcYW7l5R1GELJjFc0EI+?=
 =?us-ascii?Q?Y62g8/DJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f5d0846-1c4e-45c2-e5f1-08d8c1dbd3de
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 09:21:57.2212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8fl3+rF+pD/NY6boXzkkvxFBzKBh88E9KbLRHtbEPsjquFoCkdd1UmaFHcTmqUGVGlV+qeF9FHUdHiJcnz0iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4683
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Fixes for the following security vulnerabilities:
CVE-2020-14812
CVE-2020-14765
CVE-2020-14776
CVE-2020-14789
CVE-2020-28912 (MDEV-24040)

Rebase c11_atomics.patch to avoid fuzz warnings and add
a patch to fix below build error on musl.
/prj/tmp/work/cortexa57-poky-linux-musl/mariadb/10.5.8-r0/recipe-sysroot-native/usr/bin/aarch64-poky-linux-musl/../../libexec/aarch64-poky-linux-musl/gcc/aarch64-poky-linux-musl/10.2.0/ld.bfd: /usr/src/debug/mariadb/10.5.8-r0/mariadb-10.5.8/unittest/mysys/stacktrace-t.c:36: undefined reference to `my_safe_print_str'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ive_10.5.6.bb => mariadb-native_10.5.8.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  3 +-
 ...ktrace-t.c-make-the-test-conditional.patch | 38 +++++++++++++++++++
 .../mysql/mariadb/c11_atomics.patch           | 14 +++----
 .../{mariadb_10.5.6.bb => mariadb_10.5.8.bb}  |  0
 5 files changed, 47 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.6.bb => mariadb-native_10.5.8.bb} (100%)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace-t.c-make-the-test-conditional.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.6.bb => mariadb_10.5.8.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.6.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.8.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.5.6.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.5.8.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index e3ce29761..6f54344e0 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -20,8 +20,9 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
            file://fix-arm-atomic.patch \
            file://0001-Fix-library-LZ4-lookup.patch \
            file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
+           file://0001-stacktrace-t.c-make-the-test-conditional.patch \
           "
-SRC_URI[sha256sum] = "ff05dd69e9f6992caf1053242db704f04eda6f9accbcc98b74edfaf6013c45c4"
+SRC_URI[sha256sum] = "eb4824f6f2c532cd3fc6a6bce7bf78ea7c6b949f8bdd07656b2c84344e757be8"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace-t.c-make-the-test-conditional.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace-t.c-make-the-test-conditional.patch
new file mode 100644
index 000000000..d8f672d74
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace-t.c-make-the-test-conditional.patch
@@ -0,0 +1,38 @@
+From 966cbeb309f867ff4ac8e7f4462be4780e421700 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Mon, 25 Jan 2021 19:01:06 -0800
+Subject: [PATCH] stacktrace-t.c: make the test conditional
+
+Fixes:
+/prj/tmp/work/cortexa57-poky-linux-musl/mariadb/10.5.8-r0/recipe-sysroot-native/usr/bin/aarch64-poky-linux-musl/../../libexec/aarch64-poky-linux-musl/gcc/aarch64-poky-linux-musl/10.2.0/ld.bfd: /usr/src/debug/mariadb/10.5.8-r0/mariadb-10.5.8/unittest/mysys/stacktrace-t.c:36: undefined reference to `my_safe_print_str'
+
+Upstream-Status: Submitted [https://jira.mariadb.org/browse/MDEV-24131]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ unittest/mysys/stacktrace-t.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/unittest/mysys/stacktrace-t.c b/unittest/mysys/stacktrace-t.c
+index 8fa0db15b36..d8408f80d76 100644
+--- a/unittest/mysys/stacktrace-t.c
++++ b/unittest/mysys/stacktrace-t.c
+@@ -29,6 +29,7 @@ void test_my_safe_print_str()
+   memcpy(b_stack, "LEGAL", 6);
+   memcpy(b_bss, "LEGAL", 6);
+ 
++#ifdef HAVE_STACKTRACE
+ #ifndef __SANITIZE_ADDRESS__
+   fprintf(stderr, "\n===== stack =====\n");
+   my_safe_print_str(b_stack, 65535);
+@@ -48,6 +49,7 @@ void test_my_safe_print_str()
+   fprintf(stderr, "\n===== (const char*) 1 =====\n");
+   my_safe_print_str((const char*)1, 5);
+ #endif /*__SANITIZE_ADDRESS__*/
++#endif /*HAVE_STACKTRACE*/
+ 
+   free(b_heap);
+ 
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch b/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
index 36217f9aa..32c9818ab 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
@@ -17,10 +17,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  3 files changed, 27 insertions(+), 1 deletion(-)
 
 diff --git a/configure.cmake b/configure.cmake
-index a355214..6ee595f 100644
+index bb3ad43..2ff4f19 100644
 --- a/configure.cmake
 +++ b/configure.cmake
-@@ -865,7 +865,25 @@ int main()
+@@ -861,7 +861,25 @@ int main()
    long long int *ptr= &var;
    return (int)__atomic_load_n(ptr, __ATOMIC_SEQ_CST);
  }"
@@ -48,11 +48,11 @@ index a355214..6ee595f 100644
  IF(WITH_VALGRIND)
    SET(HAVE_valgrind 1)
 diff --git a/mysys/CMakeLists.txt b/mysys/CMakeLists.txt
-index 3d8a20e..42f1441 100644
+index 6a3a1ef..e306ae7 100644
 --- a/mysys/CMakeLists.txt
 +++ b/mysys/CMakeLists.txt
-@@ -129,6 +129,10 @@ TARGET_LINK_LIBRARIES(mysys dbug strings ${ZLIB_LIBRARY}
-  ${LIBNSL} ${LIBM} ${LIBRT} ${LIBDL} ${LIBSOCKET} ${LIBEXECINFO})
+@@ -140,6 +140,10 @@ TARGET_LINK_LIBRARIES(mysys dbug strings ${ZLIB_LIBRARY}
+  ${LIBNSL} ${LIBM} ${LIBRT} ${CMAKE_DL_LIBS} ${LIBSOCKET} ${LIBEXECINFO})
  DTRACE_INSTRUMENT(mysys)
  
 +IF (HAVE_GCC_C11_ATOMICS_WITH_LIBATOMIC)
@@ -63,10 +63,10 @@ index 3d8a20e..42f1441 100644
    TARGET_LINK_LIBRARIES(mysys bfd)  
  ENDIF(HAVE_BFD_H)
 diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
-index 616017b..53575f6 100644
+index 4978d01..883a930 100644
 --- a/sql/CMakeLists.txt
 +++ b/sql/CMakeLists.txt
-@@ -219,6 +219,10 @@ ELSE()
+@@ -220,6 +220,10 @@ ELSE()
    SET(MYSQLD_SOURCE main.cc ${DTRACE_PROBES_ALL})
  ENDIF()
  
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.5.6.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.5.8.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.5.6.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.5.8.bb
-- 
2.17.1

