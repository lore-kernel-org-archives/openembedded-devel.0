Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.48])
 by mx.groups.io with SMTP id smtpd.web09.6898.1611310629424651512
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jan 2021 02:17:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XmNRvps6;
 spf=pass (domain: windriver.com, ip: 40.107.92.48, mailfrom: zhe.he@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vn89Wr0NGYUSw3eDYgJcTYAGYCfMZtZmO7Hb8cONLMMB0CbgLTmq9su0jzN/wt0I9rMtNxSTF0T9Wu9TxibdE1v8RzrNJ5VF4QtiwSrIDtCRCFAR2m0R/gdxNrFE7t6T+LD/yO0Wo1UyHz/C8JGWTCzPf9p+YJc/zYj/BB8UxKzDv7iAP/qH/MA5vQ/yxmZwpqakC1kA4zdSR3cWUWaKzhPmWJsrRVIzjezo6im0MmuNJ6sRZZyHdF58dSGSzlgIjgCgbTTOaTjmscnOdZXk01VpKl+Lv+Apn/7PS85i9T8No/0MJvsrgVU9+l4RnHgZNskCH95VaDgFxhDkSlAsyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3QR5iefC9U1sfzReuV9G5xTr3yg79qY7yfZWesf1SE=;
 b=LOtscOiKWjcSSX5vkLBypsD/zEWKK6o5uPmy8Lx1J+/sK3K8S33boD1UHmefCf1CA2pqLs2ReX+EKdNx9pjhYn74yMe2zOl9hUw4BtKtmwjTenDu/WUQl1h7KzwRfz6Ha6Ew/fTXyvhmMGqBh/vnZYDwf5H7ZkA3JOff2jEokFVD3tUHDpLEGmdem2Hh1XwFflWR+OoYXWl1pXjdFEsFe5AVRT5SnweotuGApI9gaZjLBBzQGs4NqmXTBcVyXVIqACz21ge2a/5MCh/lkmlJ2jCTdTqGLN6CE8fJQz5Kc0/dz37+UfNGdHspBUTGuqIaLXeOzrsP0MnWr6AYsslVqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3QR5iefC9U1sfzReuV9G5xTr3yg79qY7yfZWesf1SE=;
 b=XmNRvps6G7q8PwpfoKJ317oIAox5/Y+e4ZqIhAYHuZb0a3qm2NOWSgqKXwK6NxHdRwuObWQ3BdiuLbU8N/GoatU5zc/UvkX9d3LoxsLMdlB4qHNtefJabRp4l5xbP3eVGFWzYcdDoT+89XvMvc7H73q+kQXofXXWQywMIF+umw4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3360.namprd11.prod.outlook.com (2603:10b6:805:c8::30)
 by SN6PR11MB3262.namprd11.prod.outlook.com (2603:10b6:805:bf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Fri, 22 Jan
 2021 10:17:07 +0000
Received: from SN6PR11MB3360.namprd11.prod.outlook.com
 ([fe80::f013:6c05:9f97:ca7c]) by SN6PR11MB3360.namprd11.prod.outlook.com
 ([fe80::f013:6c05:9f97:ca7c%7]) with mapi id 15.20.3763.015; Fri, 22 Jan 2021
 10:17:07 +0000
From: "He Zhe" <zhe.he@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] lmbench: Fix webpage-lm and manual page typos
Date: Fri, 22 Jan 2021 18:16:51 +0800
Message-Id: <20210122101652.46438-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR01CA0055.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::19) To SN6PR11MB3360.namprd11.prod.outlook.com
 (2603:10b6:805:c8::30)
Return-Path: zhe.he@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK0PR01CA0055.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend Transport; Fri, 22 Jan 2021 10:17:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f61680f4-2dc9-41f0-8bd6-08d8bebedf59
X-MS-TrafficTypeDiagnostic: SN6PR11MB3262:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB326292F3A5AA7DBFCFCFFD418FA09@SN6PR11MB3262.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:14;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZUh4lw30JYT82MnQGk0RRD1rjFb6bChSW7ZOJTV7v1GltQCK+yqp3i6I7pFID4kx6C4iKN7a3rdJCw93sAI+foKp8ljieiAwUoB8OSL3G1Trnyr2Bj3lxsVVC8UKJq4zEMY5rWUlRvbfLko9Q91IgMyjdPjuIesg/fq9h/GXiuZh8R9Z436/2+1tB4g/uNfRe1XYArdHkokONvMKPO22lubdgBn4qsGQ8woRio8V0FfDBFWY29+wQj3c+oUIBZoRKwKr8ETRthjFQS85oAgf7IkYLLMNkw+zmyxoj5y4/XbFoExyT2z/hEoQOobz0fY+tmqyvZ3Y4e1r0RfaHG2MwePZb2qtDJgxJrNEITb4E60VCNKME9dQNvnEkdnyxLAwgyywWztSyjQLKmern8q+yA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3360.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(39850400004)(346002)(376002)(6666004)(52116002)(2616005)(6512007)(66946007)(6916009)(66476007)(66556008)(316002)(1076003)(956004)(83380400001)(26005)(2906002)(478600001)(6506007)(36756003)(6486002)(186003)(8676002)(5660300002)(16526019)(86362001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?7yL7ATtGz6a/DKSmiPtb2KIYTUmdCOmwA7bXHC4aDI6XbrX3sbx+SGllh5jy?=
 =?us-ascii?Q?7LtBlkdA5x+hJLONBq5o+BxjzWmXq2Lo8pn/VmR78Q65eVbKNeCWrN2t9hUH?=
 =?us-ascii?Q?kNPf/dZRq4dG8m5TSYR+bXwOroUbQbmdlCOw6JCsM3Ze69UUQ0drlAe/KDAM?=
 =?us-ascii?Q?TBZJdlebTz9KfACTXle/DTrssNtufio88sGrc8qnLswnn285qCGCQgkqzKoT?=
 =?us-ascii?Q?GuVkxirC6UoQe2GxXYJoaH6NtfaSiBx5NPQn3ORN/RG2GPqh1zRL+2jV6A6n?=
 =?us-ascii?Q?5So4d44GZIQp8uBCrsZXSKnT+me1Xv+XNliXUrq9Vw/qoIPLXL1lGjJ9mCtY?=
 =?us-ascii?Q?YL5zb3mxQlOQgNkD7sjC6nz1YJAJj7gAYdsT6d9iJty4H5feSrtirw/70zgD?=
 =?us-ascii?Q?c+8zB206u/8F2Jq8nsj8ljtyRguliU14OIiJPM7Lk9DbDHDZKHAK9+d3NsUJ?=
 =?us-ascii?Q?LzgKRtJ1csrRYQ7RqSfJHbomw6M5OyIMMgdA1OgFWv5B/LzegCX6yUVvqz+X?=
 =?us-ascii?Q?UAOww7LK3lPYAnY6jtZ/Q5Z4dNCxT2s94Ssy7vT59tFP6oefs7z8ksBtOOu9?=
 =?us-ascii?Q?uqafIalnRz7fvzgOytWkfYfAZijTXJBHm0aWT8/W3FDC7hwfvzhMYfL+gTmd?=
 =?us-ascii?Q?m0dV4jLMXY/F6V/EmzbeoD0KwEJ3fwclmFE6vynWTicmxQeBrXYoRBhUycZK?=
 =?us-ascii?Q?VHc1LrnXqrSrkUpj4/yHZdnttAiRWJ5CtDiLrEyS6b9pP17tlJXdyyNffo8t?=
 =?us-ascii?Q?u8VPZ+uQQwA7Opyr0u/QQFmXjEPF7p3M1PeSB8dMasILEscjMkP9TYXO03HQ?=
 =?us-ascii?Q?WoXoQfVrEcXO16hfoamnZmB4o1hJpAbnTaLmoDnUbf5ZqLwjCWXgGYjGZwoU?=
 =?us-ascii?Q?Iwc8Za2rAOhgaLZvCN0sBv2HcvBi1B3kOx1o4F3/tCyC6sNBE73dOgqngXCi?=
 =?us-ascii?Q?RdbcUOdGnfxoE4ZfAy58P2rjteKSZMbdXsPTkrCQixg1Su54XpSQZzG77skL?=
 =?us-ascii?Q?jny9?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f61680f4-2dc9-41f0-8bd6-08d8bebedf59
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 10:17:07.6244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9a2Z6rp6j/Sx2iNpcXHL7NdDOeoZbM+9x7N6KbN2LTILTu4CCv3XYvqh8aVEg4BVmXAWTv9qURqfnMHau6cUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3262
Content-Type: text/plain

/usr/binlmbench references src/webpages which was never copied to target.
Fix this and a bunch of typos in manual pages

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 .../0001-doc-Fix-typos-in-manual-pages.patch  | 100 ++++++++++++++++++
 ...Point-webpage-lm-to-target-directory.patch |  77 ++++++++++++++
 .../lmbench/lmbench_3.0-a9.bb                 |   3 +
 3 files changed, 180 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-doc-Fix-typos-in-manual-pages.patch
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lmbench-Point-webpage-lm-to-target-directory.patch

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-doc-Fix-typos-in-manual-pages.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-doc-Fix-typos-in-manual-pages.patch
new file mode 100644
index 000000000..b27e6c9fe
--- /dev/null
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-doc-Fix-typos-in-manual-pages.patch
@@ -0,0 +1,100 @@
+From a8d86a2d994a008dab3c3ecad65528c0e5fc2cba Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Fri, 22 Jan 2021 11:22:48 +0800
+Subject: [PATCH] doc: Fix typos in manual pages
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ doc/bw_mem.8     | 2 +-
+ doc/lat_fcntl.8  | 2 +-
+ doc/lat_fifo.8   | 2 +-
+ doc/lat_http.8   | 6 +++---
+ doc/lat_select.8 | 2 +-
+ doc/lat_sig.8    | 2 +-
+ 6 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/doc/bw_mem.8 b/doc/bw_mem.8
+index 33df417..9e84d73 100644
+--- a/doc/bw_mem.8
++++ b/doc/bw_mem.8
+@@ -3,7 +3,7 @@
+ .SH NAME
+ bw_mem \- time memory bandwidth
+ .SH SYNOPSIS
+-.B bw_mem_cp
++.B bw_mem
+ [
+ .I "-P <parallelism>"
+ ]
+diff --git a/doc/lat_fcntl.8 b/doc/lat_fcntl.8
+index cf3c93e..2e501d6 100644
+--- a/doc/lat_fcntl.8
++++ b/doc/lat_fcntl.8
+@@ -3,7 +3,7 @@
+ .SH NAME
+ lat_fcntl \- fcntl file locking benchmark
+ .SH SYNOPSIS
+-.B lat_ctx 
++.B lat_fcntl
+ [
+ .I "-P <parallelism>"
+ ]
+diff --git a/doc/lat_fifo.8 b/doc/lat_fifo.8
+index 65e5a08..90bc900 100644
+--- a/doc/lat_fifo.8
++++ b/doc/lat_fifo.8
+@@ -3,7 +3,7 @@
+ .SH NAME
+ lat_fifo \- FIFO benchmark
+ .SH SYNOPSIS
+-.B lat_ctx 
++.B lat_fifo
+ [
+ .I "-P <parallelism>"
+ ]
+diff --git a/doc/lat_http.8 b/doc/lat_http.8
+index a4bb459..99c5d4a 100644
+--- a/doc/lat_http.8
++++ b/doc/lat_http.8
+@@ -1,9 +1,9 @@
+ .\" $Id$
+-.TH LAT_FCNTL 8 "$Date$" "(c)1994-2000 Carl Staelin and Larry McVoy" "LMBENCH"
++.TH LAT_HTTP 8 "$Date$" "(c)1994-2000 Carl Staelin and Larry McVoy" "LMBENCH"
+ .SH NAME
+-lat_fcntl \- fcntl file locking benchmark
++lat_http \- http GET request latency
+ .SH SYNOPSIS
+-.B lat_ctx 
++.B lat_http
+ [
+ .I "-d"
+ ]
+diff --git a/doc/lat_select.8 b/doc/lat_select.8
+index 03f83bf..e13499f 100644
+--- a/doc/lat_select.8
++++ b/doc/lat_select.8
+@@ -3,7 +3,7 @@
+ .SH NAME
+ lat_select \- select benchmark
+ .SH SYNOPSIS
+-.B lat_ctx 
++.B lat_select
+ [
+ .I "-P <parallelism>"
+ ]
+diff --git a/doc/lat_sig.8 b/doc/lat_sig.8
+index 91baf78..19a8838 100644
+--- a/doc/lat_sig.8
++++ b/doc/lat_sig.8
+@@ -3,7 +3,7 @@
+ .SH NAME
+ lat_sig \- select benchmark
+ .SH SYNOPSIS
+-.B lat_ctx 
++.B lat_sig
+ [
+ .I "-P <parallelism>"
+ ]
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lmbench-Point-webpage-lm-to-target-directory.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lmbench-Point-webpage-lm-to-target-directory.patch
new file mode 100644
index 000000000..4a26b8ea7
--- /dev/null
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lmbench-Point-webpage-lm-to-target-directory.patch
@@ -0,0 +1,77 @@
+From 353e8a62bf3cb5f1b9504efa16b8b974e93cac49 Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Fri, 22 Jan 2021 10:58:41 +0800
+Subject: [PATCH] lmbench: Point webpage-lm to target directory
+
+As webpage-lm.tar has been copied to ${datadir}\lmbench.
+Plus improve 'hello' copying in lmbench script.
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ scripts/lmbench | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/scripts/lmbench b/scripts/lmbench
+index 7a52cb1..82e36b6 100755
+--- a/scripts/lmbench
++++ b/scripts/lmbench
+@@ -167,7 +167,7 @@ if [ X$BENCHMARK_OS = XYES -o X$BENCHMARK_UNIX = XYES ]; then
+ 	lat_unix -P $SYNC_MAX
+ fi
+ if [ X$BENCHMARK_OS = XYES -o X$BENCHMARK_PROC = XYES ]; then
+-	cp hello /tmp/hello
++	cp `which hello` /tmp/hello
+ 	for i in fork exec shell
+ 	do	lat_proc -P $SYNC_MAX $i
+ 	done
+@@ -237,14 +237,14 @@ fi
+ 
+ date >> ${OUTPUT}
+ echo Local networking >> ${OUTPUT}
+-if [ ! -d ../../src/webpage-lm ]
+-then	(cd ../../src && tar xf webpage-lm.tar)
++if [ ! -d /usr/share/lmbench/webpage-lm ]
++then	(cd /usr/share/lmbench && tar xf webpage-lm.tar)
+ 	sync
+ 	sleep 1
+ fi
+ SERVERS="lat_udp lat_tcp lat_rpc lat_connect bw_tcp"
+ for server in $SERVERS; do $server -s; done
+-DOCROOT=../../src/webpage-lm lmhttp 8008 &
++DOCROOT=/usr/share/lmbench/webpage-lm lmhttp 8008 &
+ sleep 2;
+ 
+ if [ X$BENCHMARK_OS = XYES -o X$BENCHMARK_UDP = XYES ]; then
+@@ -280,15 +280,15 @@ bw_tcp -S localhost
+ 
+ if [ X$BENCHMARK_OS = XYES -o X$BENCHMARK_HTTP = XYES ]; then
+ 	# I want a hot cache number
+-	lat_http localhost 8008 < ../../src/webpage-lm/URLS > /dev/null 2>&1
+-	lat_http localhost 8008 < ../../src/webpage-lm/URLS
++	lat_http localhost 8008 < /usr/share/lmbench/webpage-lm/URLS > /dev/null 2>&1
++	lat_http localhost 8008 < /usr/share/lmbench/webpage-lm/URLS
+ fi
+ lat_http -S localhost 8008
+ 
+ for remote in $REMOTE 
+ do
+ 	echo Networking to $remote >> ${OUTPUT}
+-	$RCP $SERVERS lmhttp ../../src/webpage-lm.tar ${remote}:/tmp
++	$RCP $SERVERS lmhttp /usr/share/lmbench/webpage-lm.tar ${remote}:/tmp
+ 	for server in $SERVERS
+ 	do	$RSH $remote -n /tmp/$server -s &
+ 	done
+@@ -327,8 +327,8 @@ do
+ 
+ 	if [ X$BENCHMARK_OS = XYES -o X$BENCHMARK_HTTP = XYES ]; then
+ 		# I want a hot cache number
+-		lat_http $remote 8008 < ../../src/webpage-lm/URLS > /dev/null 2>&1
+-		lat_http $remote 8008 < ../../src/webpage-lm/URLS
++		lat_http $remote 8008 < /usr/share/lmbench/webpage-lm/URLS > /dev/null 2>&1
++		lat_http $remote 8008 < /usr/share/lmbench/webpage-lm/URLS
+ 	fi
+ 	lat_http -S $remote 8008
+ 
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 171ac31ac..68c7e7b4f 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -26,6 +26,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
            file://0001-Check-for-musl-define-guard-before-redefining-sockle.patch \
            file://0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch \
            file://0001-src-Makefile-use-libdir-instead-of-hardcoded-lib.patch \
+           file://0001-lmbench-Point-webpage-lm-to-target-directory.patch \
+           file://0001-doc-Fix-typos-in-manual-pages.patch \
            "
 SRC_URI[md5sum] = "b3351a3294db66a72e2864a199d37cbf"
 SRC_URI[sha256sum] = "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8a2a551"
@@ -75,6 +77,7 @@ do_install () {
            ${D}${bindir}/lmbench-run
     install -m 0755 ${S}/scripts/lmbench ${D}${bindir}
     install -m 0755 ${S}/scripts/* ${D}${datadir}/lmbench/scripts
+    install -m 0644 ${S}/src/webpage-lm.tar ${D}${datadir}/lmbench
 }
 
 pkg_postinst_${PN} () {
-- 
2.17.1

