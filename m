Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B01EEE6B49
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 18:24:52 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36.1770402287094188472
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Feb 2026 10:24:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=D4MaePd3;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.68, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MN7jMDK/Vuuq2M0CmMhV6KdIStm1Pt7ja8t47fBNnTloeqq1GjzU5RjNo2Cl7w6ZpjNj1C4NHnhG0L9BLm0UBGDMd6D8ZlMVrJkg5yrsFe+fMEdjq0+0J0k8hwbPqwwJJdDuIbRhNuBFKXEsE+KrCcZ4s3IZ/3vaZDUQxCBH+HDXWdGgSM/M5CYoDEyIwyfdoaXSbJ4cFc3+k4LBTriKYj1UelwFdEmSyVmVmxOQ+UDM1tcy1jhGe3fg4hZST0EYxVvnTkolIix4iDxb9z/D8Wd9PB7NwtEbNM3tD+zMdk6bWOvkodl7/i1CXd796zM3OnHQphlQECcmtJLXW2hhIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLJ36vPfZ0Eu48t0/TOZDRhBeeggXsjUsj756kQuBRA=;
 b=M+2IHtYi0Z1Kzl1RH7AYbKQyFMGVHJPYSmLIGBbIFypbMvmNJVhDP+CmpQ03Bgj5Qf287cxzORLff4MwcC6wBjw9UyxCofKRUnLlo7PgkaN8jJ8Zc6R7/KtvXoqbhQWdJZCHf3ET4ix5kzv/dlr5KCcleQLvhMubL9Zz4SvwuZIVtLh5W6r+3t4RFPkdHC+1L/UkJFqj9b1NZgIZioS9OkvZgA9t06kFwiP2vMYtu+R4jsnkSQVNHd4q2xo/ESDuuCPmPWTqq6O0EQyLLFtpC1TdbkhGmhQR5NElUVtKWEH3kf+6w5TsaK7GEqb3dtH6o1hl03pl9VSt28wgJE4r3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLJ36vPfZ0Eu48t0/TOZDRhBeeggXsjUsj756kQuBRA=;
 b=D4MaePd3Ly6ImQHSnKy05ANDf1XrZzTU2vvBbhil6Z8AMciIbS8dbIX+StvwocKjVqL4iRRDHUDrL8ym9uI50LM/EWY9Dx6WMekUOeUxEzinCsaaEN6yCf8vg7PZvetRniocP8MsNfYLBHXjPFu4znjySHMpQg/CNPcMpYD9exQ=
Received: from BN9PR03CA0872.namprd03.prod.outlook.com (2603:10b6:408:13c::7)
 by CY8PR10MB6635.namprd10.prod.outlook.com (2603:10b6:930:55::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 18:24:44 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:408:13c:cafe::48) by BN9PR03CA0872.outlook.office365.com
 (2603:10b6:408:13c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 18:24:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.0 via Frontend Transport; Fri, 6 Feb 2026 18:24:41 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 12:24:40 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 12:24:40 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Feb 2026 12:24:40 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 616IOek61761301
	for <openembedded-devel@lists.openembedded.org>; Fri, 6 Feb 2026 12:24:40 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1voQVU-00000007IV5-1Dte
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Feb 2026 12:24:40 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] netperf: Fix compile error with --enable-intervals
Date: Fri, 6 Feb 2026 12:24:40 -0600
Message-ID: <20260206182440.1739402-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|CY8PR10MB6635:EE_
X-MS-Office365-Filtering-Correlation-Id: c0829a12-773e-442d-c1cf-08de65acfe9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zmmGaG+KIQNFPb+EDPIf9baQB7xVPacISIKzAfnJ/E3JW8i9ps/20cOZ29+J?=
 =?us-ascii?Q?3d0fD2066ff7TRuoG/10ICeiCOLx+Z9smGuOYIyzN9Bub4E3QxNTQiW8+0T1?=
 =?us-ascii?Q?FpmpgRxW5vCHUSnzKVNbUs+Jcj9Dfp6T4M68Z0QPZZa7kxPeit8e8vyQyzHw?=
 =?us-ascii?Q?Sgyd+nPgoVyQcw6S4lgEH6eEhvS/SYSlocT343dWK4cHCRH7lwPbp4vgQYph?=
 =?us-ascii?Q?rUN/A6I+MyItJr1wYzSOdMXnjdJKkRrTmWaC1pYQDBE1O6NmmuqLcbUD79ft?=
 =?us-ascii?Q?iPallU60grs6WpNjMJwsHxLz0tG5L6OPrBmkVJYpSheQZRN+3DAA9T0oB4Iu?=
 =?us-ascii?Q?wIQdrN01/bJKCp0aMBhWyRz011uPRa+6pWtCQHtrihoHtldcNjhDogIhYcz8?=
 =?us-ascii?Q?mZWVb5joP3kUyLNUwmLJMXcZYPd9+aLjR15E1WwTDNK3dNTw9iyij63UREHP?=
 =?us-ascii?Q?PwbEa3jhFU6RJMSG6fYdUBrvgoCQoVV2QSYzuEtCP5GMS0eAFS7/hPMAqvEB?=
 =?us-ascii?Q?SrYl6UP3+edydjz0M/HMJ84ovG2/m76yC0zCs7MQEk2Q9IpIcG28HPCfhLSb?=
 =?us-ascii?Q?jGQnpcpnar4zCy0kH0S0z/qiEEEsn7srWM41R3W/ZhfWA5tH6aa/2oYwInQn?=
 =?us-ascii?Q?j5KEq0gQAvOjfi20+cjNNFtw28bT07fYBBqT7cX1ZdTVbkHXe06fdRWtKgwe?=
 =?us-ascii?Q?e9M8Yy9lT3XfE0A57t4ma1jXdCW/kyNcrxMm15F08Mm2sqixifnpdlFpOXex?=
 =?us-ascii?Q?OnO0nEwdAsPP6ttw2lDkSpkqAmHnQTJNSWQkC+m/14at4pzRK4Is62rbo78p?=
 =?us-ascii?Q?kj4EAUfiPhm+MOVKlHAjBaR3AZZ8nM7gsaQsGlBkf/f12pcNQczQhWqzZ0jT?=
 =?us-ascii?Q?da+HbAHFnH4PxXfeiPSbZ264VFpl+FZtfdzJtKsnbYUATlWEtm44RapYDMkw?=
 =?us-ascii?Q?tNojzLkZGdeZ+FqvBqBkhRdP9S1Ptu3O5xZe6sX8GfNmtjsBEZiVYl74Tfbk?=
 =?us-ascii?Q?PGF6cxiNLVDqPwiRVkKESkEGURQkYnb/58QekT9g5ywaWIYNJgfaFwXIj1lN?=
 =?us-ascii?Q?5P4hc5+GujYCNakgoCvE0tqCJ3a77ZhokBa1iX/BgxLHy+OEChrVrvau2qS4?=
 =?us-ascii?Q?eA0KUxtxK13oW9Z+szu2Hkep9yBkcTRHukav896Zqimmt42SaVKhqN9dBp83?=
 =?us-ascii?Q?wbN6ANOjeQ8q73VfMlrvCTrryift0XSxmLGrKa6OxSaDuMH+G4EEOu8eHcz2?=
 =?us-ascii?Q?KMjQhDFdKDOwUxWUO0amttlmLOkU1TDf2EVOtuhFsQp0TS+1jDPtUKH8VYh3?=
 =?us-ascii?Q?vWTKzEZAW4PvggpiMCsxv6dDMztIyXkni/8uBkitJGndMHkzZhhATB3JTsVs?=
 =?us-ascii?Q?aXEEjckqwv5jxalZ6qMqbpr8tdnYzhujv9tZ5u4qO9ShOjZDOxl+XD3zQmOJ?=
 =?us-ascii?Q?2ZmjaruJuQv+89ESYmN9VW/jdT+7UrwX7d1YNjs3cn6LCdVN40vQwm8MpIH+?=
 =?us-ascii?Q?5U5z/wfRRaYpNNTsGCehMc8cTzJDKi3tphhEz8TGXDN4pKk6Sj7+RI5Sk6Ue?=
 =?us-ascii?Q?T9odTF2g4MowcCUmYMn2NXMeRyqXSvoLpXoMrraaezKSCU8WLUkEq7U2Y2HV?=
 =?us-ascii?Q?3tIUBkgghAnxvmsItIDZFAU=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	YZi/4sejpYBbAeqWPQXvyk151z5PHmlEHQoBi065SkqbrTQF3qVOjq3khk2ERfxWUsqVovHTwill9yjFJWJbS4N8YN740RPPL2RqjloDbonfayRGosLGuFK6G3ap6/sRmY1CFF88ubtATu9DEaiOfthNxmb+KTp0b594sYm2EuaJz777wyB44sQzRHCWaf/HJLmB5zZu7HkHrLJ7naewBoqQfcJVWPzvlRzyFzJsIRUso01UK17gVFpjRb4CehqEzakpsilMvNpvtdKuy1SCcd9tKmG5Y5DW/D3dUEy4TjCfXR6eyxJMaqO17E6UK/9Jm7MyBBMh0S+DBbGYwgXwVY2vjvoWCEatIlq4K9rvAd9wuV0RNCY00cLVSPzE7m5h6OHnwkca0cxrlR/Wvhfr+KjUswv6tMsgcCMhSiZQl2kB+fiYroyoZdgsYyEqTF7t
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 18:24:41.2588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0829a12-773e-442d-c1cf-08de65acfe9d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6635
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 18:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124241

Submitted fix: https://github.com/HewlettPackard/netperf/pull/94

Fix for multiple definition error:
| <snip>/ld: nettest_omni.o:<snip>/src/nettest_omni.c:233: multiple definit=
ion of `signal_set'; nettest_bsd.o:<snip>/src/nettest_bsd.c:302: first defi=
ned here
| <snip>/ld: nettest_omni.o:<snip>/src/nettest_omni.c:191: multiple definit=
ion of `interval_count'; nettest_bsd.o:<snip>/src/nettest_bsd.c:289: first =
defined here
| <snip>/ld: nettest_omni.o:<snip>/src/nettest_omni.c:233: multiple definit=
ion of `signal_set'; nettest_bsd.o:<snip>/src/nettest_bsd.c:302: first defi=
ned here
| <snip>/ld: nettest_omni.o:<snip>/src/nettest_omni.c:191: multiple definit=
ion of `interval_count'; nettest_bsd.o:<snip>/src/nettest_bsd.c:289: first =
defined here

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...le-definitions-with-enable-intervals.patch | 69 +++++++++++++++++++
 .../recipes-support/netperf/netperf_git.bb    |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-networking/recipes-support/netperf/files/0001-Fix-=
multiple-definitions-with-enable-intervals.patch

diff --git a/meta-networking/recipes-support/netperf/files/0001-Fix-multipl=
e-definitions-with-enable-intervals.patch b/meta-networking/recipes-support=
/netperf/files/0001-Fix-multiple-definitions-with-enable-intervals.patch
new file mode 100644
index 0000000000..f1a4139386
--- /dev/null
+++ b/meta-networking/recipes-support/netperf/files/0001-Fix-multiple-defin=
itions-with-enable-intervals.patch
@@ -0,0 +1,69 @@
+From 3659ce248a62d98ac950ab68d8a5b4488136c85d Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Fri, 6 Feb 2026 11:52:31 -0600
+Subject: [PATCH] Fix multiple definitions with --enable-intervals
+
+There are multiple definitions of two variables when enabling intervals.
+
+| <snip>/ld: nettest_omni.o:<snip>/src/nettest_omni.c:233: multiple defini=
tion of `signal_set'; nettest_bsd.o:<snip>/src/nettest_bsd.c:302: first def=
ined here
+| <snip>/ld: nettest_omni.o:<snip>/src/nettest_omni.c:191: multiple defini=
tion of `interval_count'; nettest_bsd.o:<snip>/src/nettest_bsd.c:289: first=
 defined here
+| <snip>/ld: nettest_omni.o:<snip>/src/nettest_omni.c:233: multiple defini=
tion of `signal_set'; nettest_bsd.o:<snip>/src/nettest_bsd.c:302: first def=
ined here
+| <snip>/ld: nettest_omni.o:<snip>/src/nettest_omni.c:191: multiple defini=
tion of `interval_count'; nettest_bsd.o:<snip>/src/nettest_bsd.c:289: first=
 defined here
+
+Make them static for each file.
+
+Upstream-Status: Submitted [https://github.com/HewlettPackard/netperf/pull=
/94]
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ src/nettest_bsd.c  | 4 ++--
+ src/nettest_omni.c | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/nettest_bsd.c b/src/nettest_bsd.c
+index 36f5810..4bbc4fa 100644
+--- a/src/nettest_bsd.c
++++ b/src/nettest_bsd.c
+@@ -286,7 +286,7 @@ static HIST time_hist;
+ #endif /* WANT_HISTOGRAM */
+=20
+ #ifdef WANT_INTERVALS
+-int interval_count;
++static int interval_count;
+ #ifndef WANT_SPIN
+ #ifdef WIN32
+ #define INTERVALS_INIT() \
+@@ -299,7 +299,7 @@ int interval_count;
+     } \
+     interval_count =3D interval_burst;
+ #else
+-sigset_t signal_set;
++static sigset_t signal_set;
+ #define INTERVALS_INIT() \
+     if (interval_burst) { \
+       /* zero means that we never pause, so we never should need the \
+diff --git a/src/nettest_omni.c b/src/nettest_omni.c
+index 5d63f02..2ba5604 100644
+--- a/src/nettest_omni.c
++++ b/src/nettest_omni.c
+@@ -188,7 +188,7 @@ static HIST time_hist;
+=20
+=20
+ #ifdef WANT_INTERVALS
+-int interval_count;
++static int interval_count;
+ unsigned int interval_wait_microseconds;
+=20
+ /* hoist the timestamps up here so we can use them to factor-out the
+@@ -230,7 +230,7 @@ static struct timeval *temp_intvl_ptr =3D &intvl_one;
+     interval_count =3D interval_burst; \
+     interval_wait_microseconds =3D 0;
+ #else
+-sigset_t signal_set;
++static sigset_t signal_set;
+ #define INTERVALS_INIT() \
+     if (interval_burst) { \
+       /* zero means that we never pause, so we never should need the \
+--=20
+2.43.0
+
diff --git a/meta-networking/recipes-support/netperf/netperf_git.bb b/meta-=
networking/recipes-support/netperf/netperf_git.bb
index 4043da5621..d5a717b0f6 100644
--- a/meta-networking/recipes-support/netperf/netperf_git.bb
+++ b/meta-networking/recipes-support/netperf/netperf_git.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "git://github.com/HewlettPackard/netperf.git;=
branch=3Dmaster;protocol=3Dht
            file://netserver_permissions.patch \
            file://0001-Makefile.am-add-ACLOCAL_AMFLAGS.patch \
            file://0001-Fix-too-many-arguments-error-occurring-in-gcc-15.pa=
tch \
+           file://0001-Fix-multiple-definitions-with-enable-intervals.patc=
h \
            "
=20
 SRCREV =3D "3bc455b23f901dae377ca0a558e1e32aa56b31c4"
--=20
2.43.0


