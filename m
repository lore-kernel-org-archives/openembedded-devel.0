Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10AEFC54E68
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 10:49:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4345.1711018195363293222
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Mar 2024 03:49:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KERY9Y4o;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3810e2bd3d=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42LAWLoH027965
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Mar 2024 10:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=aW2XvyutwGOgH4iaxs
	+tWy6rCPAbctSsb7hwxwjqMlE=; b=KERY9Y4oe2Uqz645g1JInHqPSxHF1p0lBa
	FLdfjEepuUWfpAr+2VM0d0ZiF1wpiZz5TprdLp/03iYkvpFN7iBD7jvgKA3oT53q
	ago1k5eJ9P/vLEMCu62ZM1h2VGP/ahsNTnyXOo4fHewcOwuI+HUdLqK4fYhEF4rZ
	lfMovQ419FtVG1n7RX/2fqsbd7aU3wIaIUaXe3pJdjy/P8a0gz6C+A/mZqkWQpv3
	7VPwrRzzimwkYvaPwuvtFGkdJx7b9+HdMR1vMFZO378sWGXzS0zpv+Ugq7Ji6tZb
	hxLO6Q6dYb1KghP2at9/AXZUPKiVhm3BLxnN1iFsx7yse5Pv0Oww==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ww0mxn071-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Mar 2024 10:49:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzRQCNPlWEUPewQnXsrxqsqkGiwaa1tdnMa6XpBSoWmqCvR5aV+fSjVFQyVZWMhV+kk3ZxcsCvS3WSLbNMBS1KOKPafvcncVboP/4NoF3cAMpFr0+/GFUHYtN0RcP53ZlWSbY7otf70VBk19mJHV9ESb7ND8LAvMYhvbRGF1Cw/GA5R0ZQx8ewZhDf3SI371w/TtVEtofWPLaZ9B0Xmw5IA/bPyvFdKiO8L76D2SUKcjEpz82CMOCUxjWKH79jfBjDVbJJWt8g53lQ6hlMHeodj0wmKvbaDR4gcWdTw63BQv5U/6CHoxhtfuwPw1E+PQ03szB3xIHzOgSjfDh9CIuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aW2XvyutwGOgH4iaxs+tWy6rCPAbctSsb7hwxwjqMlE=;
 b=iCS5YCDNEGVgSCbTiWsN+ZF4otJHKz0aoPXXKufSC2AP4z5GNv+l3I0vvZ9nADpcVUi2KEnP2cLtXI6xEGTpCeE6cgxwydf8zmNOVqldqxPeFe07ByNNwlwvKbnK2fa3ZbdwNyNTplxU7eNsFmCKu+W9fvbfoRZbhnghFhDB2ZYDIyqOLhymtVDpwkhsQ5G9LVQ7o1p8E7I+yynTb3JwZDTVPx6k1rlkSrng8DOTvmBZONfcTI7VvaMhmHrpyyBax8fQpMuNdSahoPDLXxYftY09kIoWaGoG42I2kb4Qf6SccjT4BrCjxP5oQSVj8ashkzp00uHKUkCaYDSXSmP3Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by IA0PR11MB7332.namprd11.prod.outlook.com (2603:10b6:208:434::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Thu, 21 Mar
 2024 10:49:49 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::2ef2:65b1:77e:899b]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::2ef2:65b1:77e:899b%6]) with mapi id 15.20.7409.010; Thu, 21 Mar 2024
 10:49:49 +0000
From: liezhi.yang@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] gperftools: 2.10 -> 2.15
Date: Thu, 21 Mar 2024 19:29:34 +0800
Message-Id: <20240321112934.2436615-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0176.apcprd04.prod.outlook.com
 (2603:1096:4:14::14) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|IA0PR11MB7332:EE_
X-MS-Office365-Filtering-Correlation-Id: aa3031d0-28aa-42aa-1c7c-08dc4994a17f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1ezcui6zH3zXOvkFNUW+gtAAKRON4QZTZaum2dAaxISFQiBiWG64dsC8sIbLDoKvMG1CBUuOdL8YNReJvUyvT7yLsFuGgbysTETWnycGbZtaeVFjfGWD6HL5aBL5163qEV9A5jjCBEWT03XzfZo4/JKfSOnoSF/jGzNnSELi9w9noVyxMX+ZvadpEGVbhCymF0rKROwCINRsTyJAt6PT9zFP0BPY28cEXPuyGjwNUY6RISD1Tdilob7dseD0FTS8dRkA4K8XK3c7+19b4XWCXlrSO3GkMZ+fCnbuaOSP6U2+ObQWYK/SFgHUa7p9Zx03gWAVisUsyQbhfEdwzoy3IiwJ4appjwyrRBriHJhHvENJD++AIMTwLF+D0kTU+JWkOOPK7HNA9YPBUq3oH75CNb6EuABvUyARTsytLt2AOToD31RE80yww9cYmk/KeYuAkOMLZHrOcYWRGaF7htqBZeNgb8Uf51zldyoEi5f2gO64SBtuL/Lo/np3NOecYaDzlg068QakKln+y+/vLwNjnUsttLli3mcohAGONL4Lcic84rAx1+667Kz2UjWr1T2zYFmO2LEHNIaQpCbfUtSavbFk8hIIzB3aDSYPrY7Yvm13r/72YUWrMY9Ssp5hgoXZi2VRhGKSenr8gruYg1AGVsKz6x2DQnUCaZqrx1OwAeo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eF31z7o7M6GjoHEkExuG2P2T/o17qNwk97qxECkgWhf5XOobl5BH8fr+d5lo?=
 =?us-ascii?Q?yqqBO4abjgJ7hgAB5yaVvCWzsIVD/4zpasVDOg3o3fwJoOlhjThzmi0pCUPA?=
 =?us-ascii?Q?LCgeTTsnEfOiafQw14+1F85yjTEQjaJWQgmpHJ8Ku2lRPMbykBKQEpWNyWdX?=
 =?us-ascii?Q?244qwxY17OC2hbkUeMegkDCfm13w06efaqN4nYp7fB3Cwf18pR55lBr2DeVw?=
 =?us-ascii?Q?zulnl4L5O4qmdX7sdtisJq5lcgEhdbOdHSrU0objNUQyHHdyAioJ8CFYekD9?=
 =?us-ascii?Q?AwhZzlyGNq5GVstRv6DonPSY015MqThsKC+B+VZLakDlExlhDQJ8xvY5hGD2?=
 =?us-ascii?Q?JITJzxjpDYjPancz/E4yUbq/aI55bAYMsNCIlb57n56a53gZramQLLyulCuS?=
 =?us-ascii?Q?BGgzHqEgr2eBXqfCEkO+FY29EaK9XvT/MCP1AEqgoEK/rGEHXkgw3duXytJa?=
 =?us-ascii?Q?Lj/hkMzyADKWa0g1h+/GISQtkv0umBlK/AI5Ssa9XLU9L/w2YV2TWUBb2PNy?=
 =?us-ascii?Q?CcP5cewwJNeOeTSzVkFO7s809dBI6wBD1sT8CJMnKgt3beizgknxMROkpEVE?=
 =?us-ascii?Q?+kmJqLG5/EY63kDgJtQf1T6XaCxvsePd7CMl7veTQEI3s8X0oJLGXPjMW4Hu?=
 =?us-ascii?Q?6gRwHYCsGhDxlqJRnrri4tTXquL4KSx5znjzA8tqsj0DiyOvaOAKWNZC7lmq?=
 =?us-ascii?Q?7D0K47TLlknrGPr0N1Y3zzloJkNk7Gy6yhONS57n2j3YdJ6nYfzeXETDks96?=
 =?us-ascii?Q?QhBIm424+2PGSpX9tA64HRalnIbIVqlbW3aKHfHYxe8H/j55oPO9ZXQH5yMP?=
 =?us-ascii?Q?zqzoDCaD0pt7YCQI6W2TcHq/o/ekg76r4KsV+LwET6WGrYsfEkJSxJaXP+Ew?=
 =?us-ascii?Q?EGf158w0Yv7x8qGiNLkUiLHT/JghPB524hWmlt/ZzveOLEcHUrgtS11iQUIR?=
 =?us-ascii?Q?qtvRAIIWfIEAp4Wna0dcBD9Fpf60W16GoHchyPRgIhaQlpYTtCrRTc94d0+X?=
 =?us-ascii?Q?pjOHLMSR4dUQ2vgn3QWF4g9j2Rir/zDjWPZEmLpKmiG/co3sYVeOmiZL++Gx?=
 =?us-ascii?Q?AlJ52gL/ImOHnOZdX571nXRt2kSlrvws1r3EB8G6wIQx/PwjB0uy1Skhzqv1?=
 =?us-ascii?Q?qvbiz3ZP0NhhOpDVT4YoYsO3eOOBGZGvO2RbIIk4l1tyzwZ5OEvlFLrhsmQY?=
 =?us-ascii?Q?ftTmAISAZnMj185UukTNzpasu6zWZb8BfB8zjBAJ+0F1BEQ2f8Ipfc+sU1tx?=
 =?us-ascii?Q?KVbLSWyBEXVMyezkUkX+cUS2AMQkOWW7ZSIS5Cs/HcQ0rjTxfwtfwK2eyPTY?=
 =?us-ascii?Q?qB9JWNKbMMiPp5Wp0NSSxukM6XTeP7DouHyCg6NmU0/kwUWGBWmzcz4o5BtU?=
 =?us-ascii?Q?ewhJnxmWcME29c31sE3N1RcBcJokpL/iB9uIktaSHaQ+xjHppnoyDTo0p2CN?=
 =?us-ascii?Q?94c7zRrs6fe5zOr+QrS3MEKzh7wB4IwPsAWaQwuXF0WZ9Vjmz0fmfXvbiwoH?=
 =?us-ascii?Q?YiF7XF8kNzg46tfD7hfbzulNPoFvP8jgHJaOGNiazz+FNOEt1xdxmWSVpAye?=
 =?us-ascii?Q?xj5ahL5kMO3Y1J5fW4aqOuRJgrY8gAG1FRhjtCKcANXw152O5LaZ8blr5nQv?=
 =?us-ascii?Q?Pw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa3031d0-28aa-42aa-1c7c-08dc4994a17f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 10:49:49.5168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mGyW18wC7qaF+LwC5SI5rSPdwrVutidtffg3VOPB0+3lQDL2RskD50u9FUIYn1917JHx9XdfufDpSWUH7PYiVmifAXgNSJvDAiVXT5fNIFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7332
X-Proofpoint-ORIG-GUID: HoDh_WBmwhZqakzmsJPtjnViV-jEWWxg
X-Proofpoint-GUID: HoDh_WBmwhZqakzmsJPtjnViV-jEWWxg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-21_07,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403210076
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Mar 2024 10:49:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109501

From: Robert Yang <liezhi.yang@windriver.com>

* Remove 0001-Support-Atomic-ops-on-clang.patch because of:
  commit 54605b8a5807fe893a4b9ff8def982a264cdc6c9
  Author: Aliaksey Kandratsenka <alkondratenko@gmail.com>
  Date:   Wed Jun 21 10:39:18 2023 -0400

      amputate old atomic ops implementation

* Remove sgidef.patch because of:
  commit e78238d94d41764dc72edb37e3d6510255d3dcd4
  Author: Aliaksey Kandratsenka <alkondratenko@gmail.com>
  Date:   Wed Jun 21 10:39:38 2023 -0400

      reworked heap leak checker for more portability

* Remove 0001-Define-off64_t-as-off_t-on-musl.patch because of:
  commit 8be84e4a5c28c33bfdb7da3ee0c92d9620cd552f
  Author: Aliaksey Kandratsenka <alkondratenko@gmail.com>
  Date:   Fri Jul 21 14:18:12 2023 -0400

      drop old mmap hooks and introduce internal & simpler mmap_hook.h

* Rebased 0001-Support-Atomic-ops-on-clang.patch for 2.15

* Rebased ppc-musl.patch for 2.15

* Add 0001-src-mmap_hook.cc-Fix-build-for-32bit-machine.patch to fix
  build error for 32bit machine.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...0001-Define-off64_t-as-off_t-on-musl.patch | 33 -----------
 .../0001-Support-Atomic-ops-on-clang.patch    | 31 ----------
 ...checkers-and-debug-allocator-on-musl.patch |  8 ++-
 ..._hook.cc-Fix-build-for-32bit-machine.patch | 59 +++++++++++++++++++
 .../gperftools/gperftools/ppc-musl.patch      | 38 +++---------
 .../gperftools/gperftools/sgidef.patch        | 23 --------
 ...{gperftools_2.10.bb => gperftools_2.15.bb} |  6 +-
 7 files changed, 74 insertions(+), 124 deletions(-)
 delete mode 100644 meta-oe/recipes-support/gperftools/gperftools/0001-Define-off64_t-as-off_t-on-musl.patch
 delete mode 100644 meta-oe/recipes-support/gperftools/gperftools/0001-Support-Atomic-ops-on-clang.patch
 create mode 100644 meta-oe/recipes-support/gperftools/gperftools/0001-src-mmap_hook.cc-Fix-build-for-32bit-machine.patch
 delete mode 100644 meta-oe/recipes-support/gperftools/gperftools/sgidef.patch
 rename meta-oe/recipes-support/gperftools/{gperftools_2.10.bb => gperftools_2.15.bb} (91%)

diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-Define-off64_t-as-off_t-on-musl.patch b/meta-oe/recipes-support/gperftools/gperftools/0001-Define-off64_t-as-off_t-on-musl.patch
deleted file mode 100644
index 2b782c2040..0000000000
--- a/meta-oe/recipes-support/gperftools/gperftools/0001-Define-off64_t-as-off_t-on-musl.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 41260e21e271eb1dc8b34f952ea3f90a0dc35e9e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 25 Dec 2022 20:01:29 -0800
-Subject: [PATCH] Define off64_t as off_t on musl
-
-Musl's default bitlength for off_t is always 64bit therefore define
-off64_t as off_t on musl
-
-Upstream-Status: Submitted [https://github.com/gperftools/gperftools/pull/1379]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/malloc_hook_mmap_linux.h | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/malloc_hook_mmap_linux.h b/src/malloc_hook_mmap_linux.h
-index c7d8b4b..a10687e 100644
---- a/src/malloc_hook_mmap_linux.h
-+++ b/src/malloc_hook_mmap_linux.h
-@@ -45,6 +45,11 @@
- #include <sys/syscall.h>
- #include <unistd.h>
- 
-+// musl's off_t is already 64-bit
-+#if defined(__linux__) && !defined(__GLIBC__)
-+typedef off_t off64_t;
-+#endif
-+
- // The x86-32 case and the x86-64 case differ:
- // 32b has a mmap2() syscall, 64b does not.
- // 64b and 32b have different calling conventions for mmap().
--- 
-2.39.0
-
diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-Support-Atomic-ops-on-clang.patch b/meta-oe/recipes-support/gperftools/gperftools/0001-Support-Atomic-ops-on-clang.patch
deleted file mode 100644
index 2fd21c2783..0000000000
--- a/meta-oe/recipes-support/gperftools/gperftools/0001-Support-Atomic-ops-on-clang.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From aa0a63209af6813d87255ec3ab339f2dbbf27d6d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 6 Mar 2017 13:38:46 -0800
-Subject: [PATCH] Support Atomic ops on clang
-
-clang pretends to be gcc 4.2 which is a lie
-it actually supports a lot more features then
-gcc 4.2, here it depends on gcc 4.7 to enable
-the atomics and fails for clang
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
----
- src/base/atomicops.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/base/atomicops.h b/src/base/atomicops.h
-index dac95be..390733c 100644
---- a/src/base/atomicops.h
-+++ b/src/base/atomicops.h
-@@ -124,7 +124,7 @@
- #include "base/atomicops-internals-linuxppc.h"
- #elif defined(__GNUC__) && defined(__mips__)
- #include "base/atomicops-internals-mips.h"
--#elif defined(__GNUC__) && GCC_VERSION >= 40700
-+#elif defined(__GNUC__) && GCC_VERSION >= 40700 || defined(__clang__)
- #include "base/atomicops-internals-gcc.h"
- #elif defined(__clang__) && CLANG_VERSION >= 30400
- #include "base/atomicops-internals-gcc.h"
diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch b/meta-oe/recipes-support/gperftools/gperftools/0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch
index e3e857f0c2..2ea54e48c9 100644
--- a/meta-oe/recipes-support/gperftools/gperftools/0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch
+++ b/meta-oe/recipes-support/gperftools/gperftools/0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch
@@ -11,12 +11,14 @@ Upstream-Status: Pending
  configure.ac | 2 ++
  1 file changed, 2 insertions(+)
 
+diff --git a/configure.ac b/configure.ac
+index 68fd51c..4cb71fe 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -53,6 +53,8 @@ case "$host" in
-    *-cygwin*) default_enable_heap_checker=no; default_enable_cpu_profiler=no;;
-    *-freebsd*) default_enable_heap_checker=no;;
-    *-darwin*) default_enable_heap_checker=no;;
+              need_nanosleep=no;;
+    *-cygwin*) default_enable_cpu_profiler=no;;
+    *-linux*) default_enable_heap_checker=yes; heap_checker_supported=yes;;
 +   *-musl*) default_enable_heap_checker=no; default_enable_heap_profiler=no;
 +            default_enable_debugalloc=no; default_enable_libunwind=no;
  esac
diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-src-mmap_hook.cc-Fix-build-for-32bit-machine.patch b/meta-oe/recipes-support/gperftools/gperftools/0001-src-mmap_hook.cc-Fix-build-for-32bit-machine.patch
new file mode 100644
index 0000000000..1142df0be9
--- /dev/null
+++ b/meta-oe/recipes-support/gperftools/gperftools/0001-src-mmap_hook.cc-Fix-build-for-32bit-machine.patch
@@ -0,0 +1,59 @@
+From d675808d300278a9e7143428cfecf3fda61cc9a2 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 21 Mar 2024 10:59:29 +0000
+Subject: [PATCH] src/mmap_hook.cc: Fix build for 32bit machine
+
+Fixed build error on 32bit machine:
+
+../git/src/mmap_hook.cc:309:31: error: static assertion failed
+ 309 | static_assert(sizeof(int32_t) == sizeof(off_t), "");
+
+This is because oe's off_t is 64bit on both 32 and 64bit system, which is the
+default value of glibc, so the assertion would be failed on 32bit system, and
+remove mmap() and mmap64() to fix the redefined error.
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ src/mmap_hook.cc | 22 ----------------------
+ 1 file changed, 22 deletions(-)
+
+diff --git a/src/mmap_hook.cc b/src/mmap_hook.cc
+index 0a0f62f..27425e4 100644
+--- a/src/mmap_hook.cc
++++ b/src/mmap_hook.cc
+@@ -302,30 +302,8 @@ void* mmap(void* start, size_t length, int prot, int flags, int fd, off_t off) _
+ 
+ #define HOOKED_MMAP
+ 
+-#elif defined(DEFINED_DO_MMAP) && defined(__linux__) && !GOOD_LINUX_SYSTEM
+-// Linuxes with 32-bit off_t. We're being careful with mmap64 being
+-// 64-bit and mmap being 32-bit.
+-
+-static_assert(sizeof(int32_t) == sizeof(off_t), "");
+-
+-extern "C" void* mmap64(void* start, size_t length, int prot, int flags, int fd, int64_t off)
+-  __THROW ATTRIBUTE_SECTION(malloc_hook);
+-extern "C" void* mmap(void* start, size_t length, int prot, int flags, int fd, off_t off)
+-  __THROW ATTRIBUTE_SECTION(malloc_hook);
+-
+-void* mmap(void *start, size_t length, int prot, int flags, int fd, off_t off) __THROW {
+-  return do_mmap_with_hooks(start, length, prot, flags, fd, off);
+-}
+-
+-void* mmap64(void *start, size_t length, int prot, int flags, int fd, int64_t off) __THROW {
+-  return do_mmap_with_hooks(start, length, prot, flags, fd, off);
+-}
+-
+-#define HOOKED_MMAP
+-
+ #endif  // Linux/32-bit off_t case
+ 
+-
+ #ifdef HOOKED_MMAP
+ 
+ extern "C" int munmap(void* start, size_t length) __THROW ATTRIBUTE_SECTION(malloc_hook);
+-- 
+2.35.5
+
diff --git a/meta-oe/recipes-support/gperftools/gperftools/ppc-musl.patch b/meta-oe/recipes-support/gperftools/gperftools/ppc-musl.patch
index 3034e20176..800fa3a84f 100644
--- a/meta-oe/recipes-support/gperftools/gperftools/ppc-musl.patch
+++ b/meta-oe/recipes-support/gperftools/gperftools/ppc-musl.patch
@@ -6,49 +6,27 @@ Subject: [PATCH] Compatibility fixes for musl.
 ---
 Upstream-Status: Pending
 
- m4/pc_from_ucontext.m4             | 4 +++-
- src/getpc.h                        | 3 +++
+ src/getpc.h                        | 4 ++++
  src/stacktrace_powerpc-linux-inl.h | 8 ++++++--
- 3 files changed, 12 insertions(+), 3 deletions(-)
+ 2 files changed, 10 insertions(+), 2 deletions(-)
 
-diff --git a/m4/pc_from_ucontext.m4 b/m4/pc_from_ucontext.m4
-index 7f09dd7..5f4ee8c 100644
---- a/m4/pc_from_ucontext.m4
-+++ b/m4/pc_from_ucontext.m4
-@@ -34,6 +34,7 @@ AC_DEFUN([AC_PC_FROM_UCONTEXT],
-    pc_fields="$pc_fields uc_mcontext.gregs[[R15]]"     # Linux (arm old [untested])
-    pc_fields="$pc_fields uc_mcontext.arm_pc"           # Linux (arm arch 5)
-    pc_fields="$pc_fields uc_mcontext.gp_regs[[PT_NIP]]"  # Suse SLES 11 (ppc64)
-+   pc_fields="$pc_fields uc_mcontext.gregs[[PT_NIP]]"
-    pc_fields="$pc_fields uc_mcontext.mc_eip"           # FreeBSD (i386)
-    pc_fields="$pc_fields uc_mcontext.mc_srr0"          # FreeBSD (powerpc, powerpc64)
-    pc_fields="$pc_fields uc_mcontext.mc_rip"           # FreeBSD (x86_64 [untested])
-@@ -77,7 +78,8 @@ AC_DEFUN([AC_PC_FROM_UCONTEXT],
-                         pc_field_found=true)
-        elif test "x$ac_cv_header_ucontext_h" = xyes; then
-          AC_TRY_COMPILE([#define _GNU_SOURCE 1
--                         #include <ucontext.h>],
-+                         #include <ucontext.h>
-+                         #include <asm/ptrace.h>],
-                         [ucontext_t u; return u.$pc_field == 0;],
-                         AC_DEFINE_UNQUOTED(PC_FROM_UCONTEXT, $pc_field,
-                                            How to access the PC from a struct ucontext)
 diff --git a/src/getpc.h b/src/getpc.h
-index 9605363..cd8ccfa 100644
+index 87d18b6..c569731 100644
 --- a/src/getpc.h
 +++ b/src/getpc.h
-@@ -68,6 +68,9 @@
+@@ -68,6 +68,10 @@
  typedef ucontext ucontext_t;
  #endif
  
 +#if defined(__powerpc__) && !defined(PT_NIP)
 +#define PT_NIP 32
 +#endif
++
+ namespace tcmalloc {
+ namespace getpc {
  
- // Take the example where function Foo() calls function Bar().  For
- // many architectures, Bar() is responsible for setting up and tearing
 diff --git a/src/stacktrace_powerpc-linux-inl.h b/src/stacktrace_powerpc-linux-inl.h
-index a301a46..efca426 100644
+index 883e7d2..212bd25 100644
 --- a/src/stacktrace_powerpc-linux-inl.h
 +++ b/src/stacktrace_powerpc-linux-inl.h
 @@ -186,7 +186,7 @@ static int GET_STACK_TRACE_OR_FRAMES {
diff --git a/meta-oe/recipes-support/gperftools/gperftools/sgidef.patch b/meta-oe/recipes-support/gperftools/gperftools/sgidef.patch
deleted file mode 100644
index b01cba39cd..0000000000
--- a/meta-oe/recipes-support/gperftools/gperftools/sgidef.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 259b420444c52463795b4b582a2ab7511149eea7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 16 Oct 2017 21:26:40 -0700
-Subject: [PATCH] sgidef.h does not exist on musl and its not needed to compile
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
----
- src/base/linux_syscall_support.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/src/base/linux_syscall_support.h
-+++ b/src/base/linux_syscall_support.h
-@@ -164,7 +164,7 @@ extern "C" {
- #include <endian.h>
- #include <fcntl.h>
- 
--#ifdef __mips__
-+#if defined(__mips__) && defined(__glibc__)
- /* Include definitions of the ABI currently in use.                          */
- #include <sgidefs.h>
- #endif
diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.10.bb b/meta-oe/recipes-support/gperftools/gperftools_2.15.bb
similarity index 91%
rename from meta-oe/recipes-support/gperftools/gperftools_2.10.bb
rename to meta-oe/recipes-support/gperftools/gperftools_2.15.bb
index 8db0cecbfd..bd3b2afaea 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.10.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.15.bb
@@ -10,13 +10,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=762732742c73dc6c7fbe8632f06c059a"
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRCREV = "bf8b714bf5075d0a6f2f28504b43095e2b1e11c5"
+SRCREV = "365060c4213a48adb27f63d5dfad41b3dfbdd62e"
 SRC_URI = "git://github.com/gperftools/gperftools;branch=master;protocol=https \
-           file://0001-Support-Atomic-ops-on-clang.patch \
            file://0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch \
            file://disable_libunwind_aarch64.patch \
-           file://sgidef.patch \
-           file://0001-Define-off64_t-as-off_t-on-musl.patch \
+           file://0001-src-mmap_hook.cc-Fix-build-for-32bit-machine.patch \
            "
 
 SRC_URI:append:libc-musl = " file://ppc-musl.patch"
-- 
2.25.1


