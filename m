Received: from NAM04-MW2-obe.outbound.protection.outlook.com (NAM04-MW2-obe.outbound.protection.outlook.com [40.107.101.51])
 by mx.groups.io with SMTP id smtpd.web10.86.1617117073427435491
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Mar 2021 08:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=iXi98K7Y;
 spf=pass (domain: windriver.com, ip: 40.107.101.51, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VixNmmIaAzzueG5qscm5kRN8wspXpWjrw/j6THe44nIoWqn1lQXiycexGYTJmp93MhUsiQtYUiEjWw4aoS5kFqJrS12sSQdrprSoXcpaKY895AFeoyzfwo5LD3qu5uReC1NncFoCAgdKXyzt/DKhYZQXsh4IUoJeZtDTbyORM+zY1id/5EcV9Cg/8iZaMTQOZHZ9yOzdSwOFkR0uhRY8nGSljxfIAeLJafl1whynd/vblZ3lnwT0/iz/v8qvyDYwl1RL7O9RNZsU9xAn9jH3ZcWy8tdcCzxvMr9RTHWaDVEPFcXe1YBjY7hhwxlTkNC8uhQTjBeutUl7yz5B1zu5+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhQ1M4OhOq/q44X1pEO8pJfLPwRfgsVXo+w7lxgcXGw=;
 b=QZj4XFdv0IEk7saDwkYzMobW39YrPzUeY5/kiQP2nkPUFieRkKBfquW77aI3Kw2b6GxALA7xzOYSX1bCOFAYDTTpCwlUCYlv6UhaMfLfat2OTKQ61Yc9R+xEk6XfVnnIgvZw1DZjMhz9aZ6C4XFhQuXqOWdqhUamIG+cLqzZQIQ5Z5QyFY/Y3oY3eld/p/zdk93IAHAIWBh3uToyD5czgyUTNch/agfF13lmU4uhhM0eISmtSZAhTLy0bWV6/2IVLKIDVu3yHvFHnBBcmNEHyS0zTw2EUq0+EtV/R4Dy11z5H3wapzYCX9DNUsirhetI6ofHIHw/ut7YeeA2suX8UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhQ1M4OhOq/q44X1pEO8pJfLPwRfgsVXo+w7lxgcXGw=;
 b=iXi98K7YMVrnPFbz5Xr1ydAbuGNnwn6bmwEa3pkM7pR2I8LHisbS4R03fTNHJZt4hGc9hSTU1DrzT2KhMgv7nN5l4zKDS+mJ/GHma+813Pzkc7K5wZmCGAr69HeoQAyI+Y8Woke6kcuSfDwzpo4lb5aYZpf9VRDQVwI0vD2Jnwg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA0PR11MB4685.namprd11.prod.outlook.com (2603:10b6:806:9e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Tue, 30 Mar
 2021 15:11:11 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%9]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 15:11:10 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] rsyslog: fix some of the ptests
Date: Tue, 30 Mar 2021 11:10:51 -0400
Message-ID: <20210330151051.32026-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <166FC59255639D18.19792@lists.openembedded.org>
References: <166FC59255639D18.19792@lists.openembedded.org>
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: MN2PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:c0::24) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by MN2PR05CA0011.namprd05.prod.outlook.com (2603:10b6:208:c0::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.14 via Frontend Transport; Tue, 30 Mar 2021 15:11:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea2ceceb-7382-46ec-6790-08d8f38e0d4c
X-MS-TrafficTypeDiagnostic: SA0PR11MB4685:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB46851F7CD3CFEF865CD0FB7B807D9@SA0PR11MB4685.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Vg3FYwkQo3w+1mlzfWuS2fWe4CqxQa8ZFe03vG6QkwSa+vDz/IEU/ymBqZ2XWt0/IkYVnbf9a5PQOGXEXKuaF8dX1Jv+OgW5WugIiEn3m9Ny0WwP+ldHGL/ZQ3KfgEE7L71FekGqEa6KTWZZ6iNg8LgI3I1e30VhGJsVcwrRu1ZLDeJWZqfo+yotqGJWY2cGTEFJMS+/KwQGyBsDUQ4+bYCoAVW/lGMTXqVjS4KY7MGpgoQjse8FQk8IkAkAtW9bBR0JK6K/CkVYjMoQe0qwu/jE2hTz/eIZd8YIlMY89d5N+gvHb8l2/SZ6LROr2dJdy1dkJAE6QF2zHH0xy/7m/eYZzB67cIewmInjAElks4jqhyKQUD0hiVQ092AtNqJ1ASjaJlJI5yJ2Zv9Abn/koYKKOJUtiz6t8qAQgZGHs2bpCRGeVwtk9pJXt2YKy3XyCvz2bcJ9oDfdFutlFXBwofTGInjpD+IKVuTFX+0GOsnqIrNHhQbSwywSu3cS44G8ZmvsbgLKEw2SIeSLu+tUq2/f8aQmhyqicN2696h6+xViBeOiKDCUgRcIMRISOuZxweVuPYO5T5438LxL/4zJl6K9xrVO0PeFMyVGTpS6CWErWfv0AZUFX+xT7VjL/1G8FlkLWmQMdG+7Jduc3OokBCEe8upUl53rZF3tKqzvN1FY8D3v4RRzmqRDp7qOCVXW3CRgP3tm67AkrOHLdhS6DF26Kdf3d6F6c+FLoGY4M6k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39830400003)(136003)(396003)(376002)(366004)(8676002)(316002)(956004)(2616005)(1076003)(6916009)(8936002)(478600001)(36756003)(66946007)(83380400001)(86362001)(186003)(38100700001)(6512007)(26005)(5660300002)(6666004)(52116002)(6486002)(2906002)(6506007)(66556008)(66476007)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?kaTZ48l97AeX0QgjqSCNIsnOWNyvO0BTlsypiEl2FlKkiv2dNmG5r2W3CnQv?=
 =?us-ascii?Q?N4n03AtdzOZYAwEwRBbvBXzXrs5MVP42ZbXnJh+CDiQp38s+pdarWVS9J4Wq?=
 =?us-ascii?Q?hHecwMIIcEXRnI0BIOFGc46+ARM+SrkqwgJJVfaokTZpbyfevqUXpSHnimaq?=
 =?us-ascii?Q?jVxUfmpKcYa+ks8BOHD7rbTDIeWCvJrVzdB5yOLMHZqq0G4I5CUCCb5cM4yW?=
 =?us-ascii?Q?bJkG4nR6qMPjtXt+a0GpljEwFCFiLI32WODeV63iQP/BiwOvSCiyKH14D2aQ?=
 =?us-ascii?Q?gIBcmA4jvBO+CMKgf43S1z6f0zCcitm4cTxGozMTMd4h2xVMdHxpTnMWTd42?=
 =?us-ascii?Q?UpD5uwzMwfyGh2h0RIe/HPzymHTX6Qq/chKD1BDtPl7LtilKy3v9cWSfocPi?=
 =?us-ascii?Q?WbbwNRbMPDZxlyjWEJdmyBRsrIZ0e69D27Sy73Cy+kVsuVIUhQT892x8/wC6?=
 =?us-ascii?Q?o8ZaWksszsAC5EvmXrsZPWD6aAtEf7qjG1YzTUqz3nCi1Vy9J+Toc/zjpQgP?=
 =?us-ascii?Q?UPAOA7u9tcojImiLz1eNDuVyxN0Mz7NyKfLBZzoUOpIkuwhgYNWUNoA9uQRB?=
 =?us-ascii?Q?Dyz0AREqu55FfJtcDokr5vC1q4DkMSpTLWz4OvZnqD09zzBLNOiRy/GX68t4?=
 =?us-ascii?Q?+6U+gDm1C2wDqrMs9Qk0r2ki7hzgG3NdVGsjuDbjtCk/QVg2NyQKVARbnXJ6?=
 =?us-ascii?Q?3zJXnQMKjVT+3pieo/LWJe8Dw3TfaJ2VeqXOKH2DWkFeDuEU66GPD+TKJ4G6?=
 =?us-ascii?Q?cTz5GXDf4JM5MrdxX7rU5YwtlFmQi1xc6RmQY1apwbAbHPB5v3GJy3lIuwA9?=
 =?us-ascii?Q?cCxzrHW6rbfrduqcrj6sPxZtcG+sAf10JvT9o3ckbw8dKBc6uzExfkjh3tcv?=
 =?us-ascii?Q?+vT+HC7NO/Mk3koc7vXXMAFL89LNDBC9x9VnVs6MjPfpopUGZGZcMJkCfxWl?=
 =?us-ascii?Q?SGq5BQX2E5DpsVJfETgyylD+2V0fp8CxUQHsfy71y+VWStf0M/sY+IYw0T9x?=
 =?us-ascii?Q?NvkuTBqvC65Vs0QkKiSoLUj1CgJhJL3ep+FlFEbQ+pVJDP32w51kkeDsmfZu?=
 =?us-ascii?Q?MaxSP+hH8x1FvVlilQlJtqrzjr+oauYiDhCdbwn8G47jpUvW+bbFBf7RJdTa?=
 =?us-ascii?Q?tIJR1VDb1BBvQFNWguDGovVTkyjgx3XTNiZTAgu/xgn5zxJ2N57+WmHjDW54?=
 =?us-ascii?Q?8JIc5xOeAtOUz2f/3c+7biqWKZWtsjZXSceF0Bmf4B1lFSXzba5/aKZAWmyF?=
 =?us-ascii?Q?YGC1kQhkEE9GcI1BrDzJJGtvVbyxDmiR5Klb3Q1ep56IGH6oqnLPGVY6H0v8?=
 =?us-ascii?Q?GgEHhb+aRhNrrtUSdDOtu5Qd?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2ceceb-7382-46ec-6790-08d8f38e0d4c
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 15:11:10.8793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nlET4dAjtBnXGxrQohlCY+6VA/q0zl2WPvrVT+NM2ZfTnL5NqrvuDYqVt57aoomlJ+1L0Fgb88+jKNGUtPESUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4685
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Run test as non-root 'tester'.
Add more rdepends for ptest.

Introduce a patch to skip checking for a libc header:
    sys/inotify

Python scripts no longer called with ./script.
Remove the need to add the correct shebang.
Ptest results:

    8.2102.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
TOTAL: 424
PASS:  417
SKIP:  5
XFAIL: 0
FAIL:  2
XPASS: 0
ERROR: 0

Remaining failure related to relp:
* imrelp-tls-cfgcmd
* sndrcv_relp_tls-cfgcmd

the test expects an error "relp connect failed with return 10031",
but the connection seems to be established and working.

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
Changes for V2:

Slightly reworked the commit msg
Reapply 'disable check for inotify'

 ...-tests-disable-the-check-for-inotify.patch | 46 +++++++++++++++++++
 .../rsyslog/rsyslog/run-ptest                 |  6 ++-
 .../rsyslog/rsyslog_8.2102.0.bb               | 15 +++---
 3 files changed, 60 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-dis=
able-the-check-for-inotify.patch

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-th=
e-check-for-inotify.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-t=
ests-disable-the-check-for-inotify.patch
new file mode 100644
index 000000000..552172d39
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check=
-for-inotify.patch
@@ -0,0 +1,46 @@
+From 194e199ce08acc2192f6a63420ff24d9064666e5 Mon Sep 17 00:00:00 2001
+From: Yi Fan Yu <yifan.yu@windriver.com>
+Date: Sat, 27 Mar 2021 19:18:25 -0400
+Subject: [PATCH] tests: disable the check for inotify
+
+We don't need to check inotify.h.
+Assume it is present since it is part of the linux kernel
+since 2.6.13 [1].
+
+[1](https://kernelnewbies.org/Linux_2_6_13)
+
+(it would require installing the libc headers otherwise,
+ for the test  to detect /usr/include/sys/inotify.h.)
+
+Upstream-Status: Inappropriate[OE-specific]
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ tests/diag.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/diag.sh b/tests/diag.sh
+index 6cd60ea88..7424f48c5 100755
+--- a/tests/diag.sh
++++ b/tests/diag.sh
+@@ -2672,7 +2672,7 @@ case $1 in
+ 		fi
+ 		;;
+ 	'check-inotify') # Check for inotify/fen support=20
+-		if [ -n "$(find /usr/include -name 'inotify.h' -print -quit)" ]; then
++		if true; then
+ 			echo [inotify mode]
+ 		elif [ -n "$(find /usr/include/sys/ -name 'port.h' -print -quit)" ]; th=
en
+ 			grep -qF "PORT_SOURCE_FILE" < /usr/include/sys/port.h
+@@ -2687,7 +2687,7 @@ case $1 in
+ 		fi
+ 		;;
+ 	'check-inotify-only') # Check for ONLY inotify support=20
+-		if [ -n "$(find /usr/include -name 'inotify.h' -print -quit)" ]; then
++		if true; then
+ 			echo [inotify mode]
+ 		else
+ 			echo [inotify not supported, skipping...]
+--=20
+2.29.2
+
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest b/meta-oe/r=
ecipes-extended/rsyslog/rsyslog/run-ptest
index aa698d85c..efa9ba3ed 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest
@@ -5,4 +5,8 @@ set -o pipefail
=20
 SCRIPTPATH=3D"$( cd "$(dirname "$0")" ; pwd -P )"
 cd ${SCRIPTPATH}
-make -C tests -k check-TESTS
+useradd tester  || echo "user already exists"
+ln -sf /usr/sbin/logrotate /usr/bin/logrotate
+su tester -c "make -C tests -k check-TESTS"
+userdel tester
+rm -f /usr/bin/logrotate
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2102.0.bb b/meta-oe=
/recipes-extended/rsyslog/rsyslog_8.2102.0.bb
index 22059d140..921124024 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2102.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2102.0.bb
@@ -24,6 +24,7 @@ SRC_URI =3D "http://www.rsyslog.com/download/files/downlo=
ad/rsyslog/${BPN}-${PV}.t
            file://rsyslog.service \
            file://use-pkgconfig-to-check-libgcrypt.patch \
            file://run-ptest \
+           file://0001-tests-disable-the-check-for-inotify.patch \
 "
=20
 SRC_URI_append_libc-musl =3D " \
@@ -80,11 +81,6 @@ PACKAGECONFIG[mail] =3D "--enable-mail,--disable-mail,,"
 PACKAGECONFIG[valgrind] =3D ",--without-valgrind-testbench,valgrind,"
 PACKAGECONFIG[imhttp] =3D "--enable-imhttp,--disable-imhttp,civetweb,"
=20
-do_configure_prepend() {
-    sed -i -e 's|python |python3 |g' ${S}/tests/*.sh
-    sed -i -e 's|/usr/bin/env python|/usr/bin/env python3|g' ${S}/tests/*.=
py
-    sed -i -e 's|/usr/bin/env python|/usr/bin/env python3|g' ${S}/tests/te=
stsuites/*.py
-}
=20
 TESTDIR =3D "tests"
 do_compile_ptest() {
@@ -97,6 +93,10 @@ do_install_ptest() {
     cp -rf ${S}/${TESTDIR} ${D}${PTEST_PATH}
     cp -rf ${B}/${TESTDIR} ${D}${PTEST_PATH}
=20
+    # give permissions to all users
+    # some tests need to write to this directory as user 'daemon'
+    chmod 777 -R ${D}${PTEST_PATH}/tests
+
     # do NOT need to rebuild Makefile itself
     sed -i 's/^Makefile:.*$/Makefile:/' ${D}${PTEST_PATH}/${TESTDIR}/Makef=
ile
     # do NOT need to rebuild $(check_PROGRAMS)
@@ -195,8 +195,11 @@ VALGRIND_libc-musl_powerpc64le =3D ''
 VALGRIND_riscv64 =3D ""
 VALGRIND_riscv32 =3D ""
=20
+# util-linux: logger needs the -d option
 RDEPENDS_${PN}-ptest +=3D "\
   make diffutils gzip bash gawk coreutils procps \
-  libgcc python3-core python3-io \
+  libgcc python3-core python3-io python3-json \
+  curl util-linux shadow \
   "
+
 RRECOMMENDS_${PN}-ptest +=3D "${TCLIBC}-dbg ${VALGRIND}"
--=20
2.29.2

