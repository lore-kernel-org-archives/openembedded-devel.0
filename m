Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.71])
 by mx.groups.io with SMTP id smtpd.web11.42521.1609136321864838551
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Dec 2020 22:18:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=I7fsdTmG;
 spf=pass (domain: windriver.com, ip: 40.107.94.71, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5EHRhdWD4topLZ3JRnjwrpEH7I53z38iKNIusX7Xn/L81iwEJfZxvnC+Cx+G+Nv4QdpcyJZakloruLRvu6eXy4DTHONP0BIetxl39EKhz8c5wwZsDqz6jVG428uCr6Yo/XOa2Vg3ET3GoEshj/yzXvmM+Jd/gQZx0agihYk7cteG8FOqFYAmMXRyRfstRqQd+qkQ6I2mcI14TiXA2f/ngN2sk/Q7VSRiLq4GgMW48bHlInUimu59uQRn9a5f1M4aDva5PTJNZR9EQS1z+yP3Gax4CrMFGY0ZAmievEwXkfYgavUzIGCk4U6VYMc7lXAQ4BP7sg7d5Ikl49qgBV4Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lG4z/oE/Fvic9jnHuf/G153HqF+6lou8L2Atsx4kHmg=;
 b=Zq9kHIZaHbGmXHhUhw/0HM6OehC/iqgLnp0Rmnr6alJU3S2Aj/o/gAuM1RYnPeQGfbyxa5TEaXmgtWxdtD5iOOMC+A2L83hCzeZcuWWD8JMcDAwNbKrtTZTwYoDslGE1jv3E4Bw64fImt+ZJyNniHGsEZ/17wU0uBoiJjSvCPpWBBzD5XeqFFuhmXr08ukOKbzjbst3+Ywz5WZ4YAr3z7emUCYvMLLhmlThh+KhHQizpNXdSG7jtvy6qJCX924hER/IIOZJYIkQu3eyqxfYTACITTnAkj6KjuyP65X56qrEyFiNVk3T9HwQvDNNmwf+VnoPlSPhYgZ1KS0Miacrn1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lG4z/oE/Fvic9jnHuf/G153HqF+6lou8L2Atsx4kHmg=;
 b=I7fsdTmGughu4NWmhOo0eCHvSVf+UcfycEOHlDtq7SCjMiBm4z2N+WjDGHt4zzr1bU1eOOqaoFpHaglS3mYN/ISB1CX1eu7bPvolpspNCkBZM13mwA/e0n+n4qd8Rcqyb9ALQo7OWmjv9ZRTFK9nSjPahhYzzbievXs9HoaERNw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA2PR11MB5132.namprd11.prod.outlook.com (2603:10b6:806:11a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Mon, 28 Dec
 2020 06:18:38 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::106d:2efa:3adc:3bea]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::106d:2efa:3adc:3bea%4]) with mapi id 15.20.3700.031; Mon, 28 Dec 2020
 06:18:38 +0000
From: "Changqing Li" <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] libssh2: enhance ptest
Date: Mon, 28 Dec 2020 14:17:02 +0800
Message-Id: <20201228061702.34368-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0216.apcprd02.prod.outlook.com
 (2603:1096:201:20::28) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2PR02CA0216.apcprd02.prod.outlook.com (2603:1096:201:20::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend Transport; Mon, 28 Dec 2020 06:18:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56712864-16b7-48b3-8f74-08d8aaf86a46
X-MS-TrafficTypeDiagnostic: SA2PR11MB5132:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB5132713720460977238DE7E382D90@SA2PR11MB5132.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rkmo/iHtLiW+GGWE8piqfQ8oASrOPbrGP+tLLqprs2dn3R5wL0YlAovA7ItjVGlhMu4WSJRBL9uiGPQwQKyvEc511u3siv1KvsdWmazmJSsd82yhyx5w9v6q7mcLpRXg4LYLtQXPad5PTXafSHtqG4nGyZZ74HL5ykqXVpDi+/z5R9BRLS77rg4JTpSJAzLHC2eaPzf31YnP+KgEjJAVVq2y0d6vXLl0u6fafWMBW6kQsUXOxMz0oIGEB6zaQYkX5VWBX9jLBHWPuk/MEUp/0wvLbCj4LRYZd50TwUn7C4vpF2zoDWHiWFJDrF1ijaU0qjvje7a4RtzYnsNngNByrhciWqDCzmfxDxCbIeqWaUPKO688SZB8fQEj7Yx2qlfvCIxecPT5oJReOqN7yCdvyBX3Pb1M5pTVHGag0SK6QPkqETs+X7oSuL2I+gHOGLUZ48zqUolSqSbk8e9ud9CJ+w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(366004)(376002)(396003)(136003)(346002)(52116002)(66556008)(316002)(1076003)(186003)(8676002)(6506007)(2616005)(16526019)(44832011)(5660300002)(83380400001)(36756003)(6486002)(956004)(478600001)(6916009)(86362001)(66476007)(2906002)(6666004)(26005)(8936002)(66946007)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?L7PS+FkZo2B3jciZ8ZGzogUamK2/ISf8qcJYocOqtULMnVZpaBS+1bUUAmyF?=
 =?us-ascii?Q?/1P9OrvgJwGvEV6KY2Rqz/O+5erIwQs1tGYrPdB4rg6pyW/KfOxdPTMMvcqb?=
 =?us-ascii?Q?VSwe0qU/hKDU/nvtxqYFHZfB8Np8+c15koJlzFR6g0uQ/K/y8u0+W8UBkGIr?=
 =?us-ascii?Q?ZhzoVlZHrxwhNT9nQDtx7Wfc2rcgSPK1P0lPWEoGKSQVtMQf+eSbc5GOV3mt?=
 =?us-ascii?Q?hUt0EGbhbAxrbV80Wac18OZftdAFP1Ru+M8IZM75qHvqJl/HlJ0kqgG6ogfR?=
 =?us-ascii?Q?+DvjE9mVoMrWrkH6ND688v7OvTMMhZ/WHMyZyeGjLRbiGnnI3M1U36Uv6Cla?=
 =?us-ascii?Q?lnb8D/fR44+Vpnrd1gO9TI2vtZC7VhTJDGC6ZCrNsmzpjc6qH9HQDZw7Z/kg?=
 =?us-ascii?Q?WmvXGHjoY/SzkKNN4HmW/p7V1kahxdoV1gMmonl0hXssFcvW8VYgnXyij7hH?=
 =?us-ascii?Q?2WflbHadcq0yruryYVOv1WWqxq456MyWCfTwjNSr/vSxv2bAGZabvCph5Z0D?=
 =?us-ascii?Q?kLU8GY4I8O+iXIZFd4OWAhYsZ1HJQmX9MLa2R+P7OQo+wdISvfHMog+5WPDv?=
 =?us-ascii?Q?RImy58FJJHtNYm23pUTgfmbkaVHedFI2L74HfkJqKS4ybYxFrlQtkZGcBf0V?=
 =?us-ascii?Q?52yJK/hUJwAWdtRgtTNnQVc3jbDO8Ez7guLJ4Ea7PGWlEQ4XAdsUqQqTI5dZ?=
 =?us-ascii?Q?HDYExS/YxZfl3bNpgwIG4Xgz/oP+lqKG6TUKO8bnp6mu0xm/ugN7WA9rQZeN?=
 =?us-ascii?Q?gpT/ESjNox2aJ0wcju+S4u9NULT8tEpsYur1jxIXF/af9kXsrTOQP/sLJya1?=
 =?us-ascii?Q?+cqqnsM5mHmc2BO/3L9JjmdXLwNIf7rKeY6S9vCDtBzipDE5d/PO+sOI2TmR?=
 =?us-ascii?Q?e8q1c4F3PPoOdKyWHKoC4ubO29eGXvNqV9v9W0bu7h2trnYSk9Q9rhmXs2Vi?=
 =?us-ascii?Q?SoCq/LUKpqvZsLguL/BfG1KtMlOUpKkz2xBJJ+2ohogcOEag0cAdlecH6Ngj?=
 =?us-ascii?Q?hNGM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2020 06:18:38.3376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 56712864-16b7-48b3-8f74-08d8aaf86a46
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zd35SszQzD8tUKlp3igwgz/3JjsPE8lwN/iGsnPAtMjg5SaqFgahl2b/bG5+wKP/JHzJZpeiHO1cFqM5BKFySnR/YMNJ+VMpV5RaHa4hGdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5132
Content-Type: text/plain

support testcase ssh2.sh

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...nviroment-to-decide-if-a-test-is-bui.patch | 46 +++++++++++++++++++
 .../recipes-support/libssh2/files/run-ptest   |  2 +-
 .../recipes-support/libssh2/libssh2_1.9.0.bb  | 11 +++--
 3 files changed, 55 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch

diff --git a/meta-oe/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch b/meta-oe/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
new file mode 100644
index 000000000..5ff9bf846
--- /dev/null
+++ b/meta-oe/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
@@ -0,0 +1,46 @@
+From f9e3e2ee7b18ba5bb8efe083171f3e701eb0a663 Mon Sep 17 00:00:00 2001
+From: Your Name <you@example.com>
+Date: Mon, 28 Dec 2020 02:08:03 +0000
+Subject: [PATCH] Don't let host enviroment to decide if a test is build
+
+test ssh2.sh need sshd, for cross compile, we need it on target, so
+don't use SSHD on host to decide weither to build a test
+
+Upstream-Status: Inappropriate[oe specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tests/Makefile.am | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index dc0922f..6cbc35d 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -1,16 +1,12 @@
+ AM_CPPFLAGS = -I$(top_srcdir)/src -I$(top_srcdir)/include -I$(top_builddir)/src
+ LDADD = ../src/libssh2.la
+ 
+-if SSHD
+ noinst_PROGRAMS = ssh2
+ ssh2_SOURCES = ssh2.c
+-endif
+ 
+ ctests = simple$(EXEEXT)
+ TESTS = $(ctests) mansyntax.sh
+-if SSHD
+ TESTS += ssh2.sh
+-endif
+ check_PROGRAMS = $(ctests)
+ 
+ TESTS_ENVIRONMENT = SSHD=$(SSHD) EXEEXT=$(EXEEXT)
+@@ -38,4 +34,4 @@ if OPENSSL
+ # EXTRA_DIST += test_public_key_auth_succeeds_with_correct_encrypted_ed25519_key.c
+ # EXTRA_DIST += test_public_key_auth_succeeds_with_correct_ed25519_key_from_mem.c
+ EXTRA_DIST += test_public_key_auth_succeeds_with_correct_rsa_openssh_key.c
+-endif
+\ No newline at end of file
++endif
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-support/libssh2/files/run-ptest b/meta-oe/recipes-support/libssh2/files/run-ptest
index c213b32e5..5fd7ec65f 100644
--- a/meta-oe/recipes-support/libssh2/files/run-ptest
+++ b/meta-oe/recipes-support/libssh2/files/run-ptest
@@ -2,7 +2,7 @@
 
 ptestdir=$(dirname "$(readlink -f "$0")")
 cd tests
-for test in $(ls)
+for test in simple ssh2.sh mansyntax.sh
 do
 	./../test-driver --test-name $test --log-file ../$test.log --trs-file ../$test.trs --color-tests no --enable-hard-errors yes --expect-failure no -- ./$test
 done
diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb b/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
index 38f162693..4a5a05060 100644
--- a/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
+++ b/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
@@ -11,6 +11,9 @@ SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://CVE-2019-17498.patch \
            file://run-ptest \
 "
+
+SRC_URI_append_ptest = " file://0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch"
+
 SRC_URI[md5sum] = "1beefafe8963982adc84b408b2959927"
 SRC_URI[sha256sum] = "d5fb8bd563305fd1074dda90bd053fb2d29fc4bce048d182f96eaa466dfadafd"
 
@@ -29,7 +32,7 @@ PACKAGECONFIG[gcrypt] = "--with-crypto=libgcrypt --with-libgcrypt-prefix=${STAGI
 BBCLASSEXTEND = "native nativesdk"
 
 # required for ptest on documentation
-RDEPENDS_${PN}-ptest = "man-db"
+RDEPENDS_${PN}-ptest = "man-db openssh"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-en-us"
 
 do_compile_ptest() {
@@ -39,9 +42,11 @@ do_compile_ptest() {
 
 do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/tests
-	install -m 0755 ${B}/tests/.libs/simple ${D}${PTEST_PATH}/tests/
-	install -m 0755 ${S}/tests/mansyntax.sh ${D}${PTEST_PATH}/tests/
 	install -m 0755 ${S}/test-driver ${D}${PTEST_PATH}/
+	cp -rf ${B}/tests/.libs/* ${D}${PTEST_PATH}/tests/
+	cp -rf ${S}/tests/mansyntax.sh  ${D}${PTEST_PATH}/tests/
+	cp -rf ${S}/tests/ssh2.sh  ${D}${PTEST_PATH}/tests/
+	cp -rf ${S}/tests/etc ${D}${PTEST_PATH}/tests/
 	mkdir -p ${D}${PTEST_PATH}/docs
 	cp -r ${S}/docs/* ${D}${PTEST_PATH}/docs/
 }
-- 
2.17.1

