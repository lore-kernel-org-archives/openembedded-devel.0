Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.1279.1631041226476849129
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Sep 2021 12:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=lNS1SO+C;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=488461c454=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 187HbRxE008822
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Sep 2021 19:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=8VtHwxzVQMKQg6TquVQPAC7h0/OInUkKRCbkYl4P9C0=;
 b=lNS1SO+C4MrXnScrVps66M8NY6HAMH1Tr3INJNxPIM6pM/vZSsKuI19XPdVZTu+ArMSm
 X8tADzHYort6TkMqITB1jzJL1lgInsn56xdItX3k7PRKvLh+c0MiK3+OBpC34b9s+Zy5
 GeXhOpRv6jwUBnYSxG332VpDMtx6evgpTDW8h4brf/TSc0X9+0RESe414AYbTbVBsxek
 zzVo0olfXFB6t9NeR6RVScOPEt47ootCxrss415rEgDxn7osnNm+FGvgTZRWKitpkAly
 6mzJ6Rs/dpYYK3+KP9XqFhMCVSqa09A3A/H+Qi02Up+dbXCxCUNcQyPW40heImtBDNGl GQ== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
	by mx0a-0064b401.pphosted.com with ESMTP id 3axcmt01uf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 07 Sep 2021 19:00:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MD6BL5CfvA7D4EUgWwodTv9YagIaZJcY6Zt44S62TWyaIlJapfZg7/SUAZuzzvG68qk6iFKufbJWIfiTRlyD9xojKo1uPY7MPVKOhwB20u1aqwGOvccZp+Pf4uRJJ4avHuAie37OVNzQRjJyiuwgWhNrSyXD/wJQktOsk0Yre/8XRr5SMRIWj1uuEJDKil/bPGluw4SiyoaRoKI3rNNsOM9vsxrtiGr0CU7oz6OOMbYdqaL8tEakCgUGzm8Hr+3nepljv58x26tRH9+h850yRx38vZX55dCGMHjRXh95TV/wvp2G6Lg0dIlySozHdVoeoajqWGr8BX8b6Sm4kB95Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=8VtHwxzVQMKQg6TquVQPAC7h0/OInUkKRCbkYl4P9C0=;
 b=k0qQbWsHkDsW+Zgfg4DWKa+ANsoB2Lv7QcVvhqv2Kp17zkk3WKiPi1QzzabPEinWhS/dUc6tIhNBa7bNK/gkDxIp2Mdbujt4OHfDldg6h9MNYnI/pVXavJIEGpPgLdEaKaJIf8XP4CL2XecIGqKRwTia4BM8PZj17BUvajDEyg8JUZ1zQ8tv2fP2zZ5ueZFo6AeeEHUGQtET+FYk8U30C9YoUuhHU9HCjyYlZYSC+Hg86Vjog2aPeR1hzo743xooBKcX5kFMuvlSTjMdsFDP5BvNNGccvZ++N929j6vqMCWug74CKFAXAGe8h70HP5ycHmp7DUKRXSLhyseYdiS2Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by SJ0PR11MB4880.namprd11.prod.outlook.com (2603:10b6:a03:2af::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 7 Sep
 2021 19:00:21 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::8136:f22:7050:c089]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::8136:f22:7050:c089%3]) with mapi id 15.20.4478.019; Tue, 7 Sep 2021
 19:00:21 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [meta-oe][hardknott][PATCH 1/1] redis: fix CVE-2021-32761
Date: Tue,  7 Sep 2021 12:00:02 -0700
Message-Id: <20210907190002.10664-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.24.1
X-ClientProxiedBy: SJ0PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::29) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
Received: from ala-lpggp5.wrs.com (147.11.105.121) by SJ0PR13CA0084.namprd13.prod.outlook.com (2603:10b6:a03:2c4::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.6 via Frontend Transport; Tue, 7 Sep 2021 19:00:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eddf16cc-f491-4562-f1fa-08d97231bdca
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4880:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4880F45371D76F7E962E6E2088D39@SJ0PR11MB4880.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u3jjRyknvkgDmYrSLpDnqPVMYTL19dSrsdpIgbXLoxbe5WoC9SUrFs8HK57b6qqB9LRduysGz7OR2mzIQwGDcHx0+ETQCg6UV3/R6+XEMcGL186fg6n/XUgnFhypWVmTqdPMzEPrkzlIWOeCrgyKapQah0U8HJmBNgQdi1OJUkz4HW4s9cRo401S/QJ1AvULKTkeG4z6ukBU6z18FPqTA7g5cUo6oO51gYUfqYsshZBRLF2lt77gAUIcYvfjeIP0ulKY7YCNwtzPrTasRwfE8ib7pmBIcElm5VnRIFdXr2kEDJJj/y1Bda44mL1MMk+fvavuze7knIHj0IGrtSELSKcbMagvjXfQ4A1HfeRNe8Z9jywpM6Pnzo29sqsnPzVpKwiBQwPYbmJQNdcEgGjuBWUOQ4uBMzqbysPBYEgPmbECLCcn6aFftzsbrhuGkYKHhpUAPp19LoJ2HnXAHktLHHGwKX/S83RpKEJOCKVGCTMwNF6jDquClEbEubg0fNmRMahmvkvTE6kqvcWl6oRr7ClxhZ/i3sPePKiZMtexLKWy3VA6bgIEmDUVLrt5ytwsx6mJSXQTKNx7z66VK0ujFwVk7akBmZsu8iRII5+8UZ/WCaK7PesTEGRYmonF6anpad6Afa99MDP7EeJoURAtTCs2/0L95fuIuV1ofPY0DL9ZpKjEpM9J9YCrT2Qr4nRLqW1K2Tbtj9A+GBivxzWEO9gHyImpnkDHrVangfnXCCeY6i5YiCd6kRrWAhGNvrxbU0tZTu84rD68qS6UB54G1CnpOLWGhY1KbiEatT04GZbOLiWdvyPDHhOADxAy24EXg83r0X5Nq4qDxkzYavLJvqTHzD+aGAkaP9D6ScMryYM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(376002)(346002)(39850400004)(44832011)(478600001)(316002)(38100700002)(966005)(38350700002)(6506007)(86362001)(26005)(4326008)(30864003)(66476007)(66556008)(36756003)(66946007)(186003)(2616005)(2906002)(956004)(8936002)(6512007)(6666004)(1076003)(8676002)(107886003)(6916009)(6486002)(52116002)(83380400001)(5660300002)(525324003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kHMKGnhgs69WE+pf3d4MiSz719FAGa5w8FUZV3u6PGtVYtBztWcOTkrFWh7T?=
 =?us-ascii?Q?1mrxMwHO70twXgOuDdom+bIGj74046opeJ4xMKddpsyFjUp9DuNbcNIoXi/d?=
 =?us-ascii?Q?sRywIddhF7/ifr7TSFG5ouQ9PsiEzgzbQ4+QXYNaX5NcyLhG0qs9o4MUagdO?=
 =?us-ascii?Q?MaiHszxtclb+JUcwBsflUvHbLNcCqO1/CNik7OCoav+WaNzsQSHEngdTGWZJ?=
 =?us-ascii?Q?finlT83eg58gLvvIsgvIwHWABzuA4EvixxaeCj2Nbkpat0Y8n+tmQ/zAF/6o?=
 =?us-ascii?Q?lj3VCPTMheSykfxTuVPWhnlViS6JSOHYHTnAg8HYpud7xyb9Upp+4JjnFOTI?=
 =?us-ascii?Q?umPVpI5C1dnJhmgm8ac6rLW6xKLRwQzdGPrBEE2b6cIP1xKj8uuGgEo1Lk+3?=
 =?us-ascii?Q?bfExlSIbWkiBs7Xbi9fz41RTN3j1WkWEEmzwHpBH/rp0O8hdotcFj64dn9OR?=
 =?us-ascii?Q?4aOjZHju8yKbW0TMCnQhvd9Q4bSj3xYjdtFmBD2gucSN1kb7cHBTU6rnKiCM?=
 =?us-ascii?Q?D+P9UgVU13f0n8dhr21WKCPNuE64xjZOEYkoLwrTXYmIP1DDo5i+EbEyPjLd?=
 =?us-ascii?Q?/itljUmpxRLmveDQhXoUktGNQWso63zn5JvS7aBx4XeD4Mg63Krxm2g5lbcP?=
 =?us-ascii?Q?8SfAsTg9WgpynXqcJbu7lwQOXLrtozPsTCh/Bp0W7pHBIsoD5i6wwqUdcVpJ?=
 =?us-ascii?Q?MY340unwb+3fN3Cjs0pF3O5qgKAF1nUCr1ulKKXW2K/9goZU+KS1x55b/8Ei?=
 =?us-ascii?Q?RFrAWN7jCgb9w4yt6KHFYdKy3tC6y38uXZyBqPiyAtkOd5t2AxASqyjuVm99?=
 =?us-ascii?Q?+PCnsTms8Gnw9rcIbSfF8RBu0RppYIM20Gxisa3ifbaDjWRT/lZZtcPSIOdB?=
 =?us-ascii?Q?2N8/r5VWOieojiYZwloeb0WS283iVL8cr5UXqMtM880ZojyQZrkauDa3FoD5?=
 =?us-ascii?Q?wOkZz6IZpsl516K+J+wK9oCBdOVyCRXksohWgqUptthik6BTW1RtGAfjEcGK?=
 =?us-ascii?Q?fFVrXd9AMEMaoqVc/gZdpVlvPegDrxQ8dUBg6DDzowdHQZG+/qMErR4OB1MV?=
 =?us-ascii?Q?TVddGRjVvZmr/iU2oa19/CZBFiD85dg+C8St8FMJlTIT47iDm/ehLYrVhtWL?=
 =?us-ascii?Q?Q1lnj03awXbi6U3bzOj7R7Y+GZHgkSLf1YRxllYlAcierH5rSOne/yuzPJLt?=
 =?us-ascii?Q?d6NdcvLs5S7ugrR+6rO4p5RFIztpuOCCVBq9a0KiDwNhYWIXuxazFpAejCLU?=
 =?us-ascii?Q?Wy320UkrIlzfk3GGFrPAtCgwQL8r04y5309cVK/RPnxFwfXzEmcR89EjngQy?=
 =?us-ascii?Q?Ex075rD1lU2PCYm+J6mF/qcr?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eddf16cc-f491-4562-f1fa-08d97231bdca
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 19:00:21.6481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HM9zq6ZGnoM5EmRC61TcRTaE4lonhelWLR1iCJHSW7jTLeIwpEH7C4WLIYwpoeiwLvbzIpiPffuqP0XjHhsmWoXQXM1Tdot/12HStUjX8Oc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4880
X-Proofpoint-ORIG-GUID: wAVqLfDIBcfs5mbXfifgeLHbSwT2wDo6
X-Proofpoint-GUID: wAVqLfDIBcfs5mbXfifgeLHbSwT2wDo6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-07_07,2021-09-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109070121
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Backport from version 6.2.5.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../redis/redis/CVE-2021-32761.patch          | 257 ++++++++++++++++++
 meta-oe/recipes-extended/redis/redis_6.2.2.bb |   1 +
 2 files changed, 258 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2021-32761.patch

diff --git a/meta-oe/recipes-extended/redis/redis/CVE-2021-32761.patch b/meta-oe/recipes-extended/redis/redis/CVE-2021-32761.patch
new file mode 100644
index 000000000..14992b789
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/CVE-2021-32761.patch
@@ -0,0 +1,257 @@
+From 835d15b5360e277e6f95529c4d8685946a977ddd Mon Sep 17 00:00:00 2001
+From: Huang Zhw <huang_zhw@126.com>
+Date: Wed, 21 Jul 2021 21:25:19 +0800
+Subject: [PATCH 1/1] On 32 bit platform, the bit position of
+ GETBIT/SETBIT/BITFIELD/BITCOUNT,BITPOS may overflow (see CVE-2021-32761)
+ (#9191)
+
+GETBIT, SETBIT may access wrong address because of wrap.
+BITCOUNT and BITPOS may return wrapped results.
+BITFIELD may access the wrong address but also allocate insufficient memory and segfault (see CVE-2021-32761).
+
+This commit uses `uint64_t` or `long long` instead of `size_t`.
+related https://github.com/redis/redis/pull/8096
+
+At 32bit platform:
+> setbit bit 4294967295 1
+(integer) 0
+> config set proto-max-bulk-len 536870913
+OK
+> append bit "\xFF"
+(integer) 536870913
+> getbit bit 4294967296
+(integer) 0
+
+When the bit index is larger than 4294967295, size_t can't hold bit index. In the past,  `proto-max-bulk-len` is limit to 536870912, so there is no problem.
+
+After this commit, bit position is stored in `uint64_t` or `long long`. So when `proto-max-bulk-len > 536870912`, 32bit platforms can still be correct.
+
+For 64bit platform, this problem still exists. The major reason is bit pos 8 times of byte pos. When proto-max-bulk-len is very larger, bit pos may overflow.
+But at 64bit platform, we don't have so long string. So this bug may never happen.
+
+Additionally this commit add a test cost `512MB` memory which is tag as `large-memory`. Make freebsd ci and valgrind ci ignore this test.
+
+(cherry picked from commit 71d452876ebf8456afaadd6b3c27988abadd1148)d
+---
+
+CVE: CVE-2021-32761
+
+Upstream-Status: Backport [835d15b5360e277e6f95529c4d8685946a977ddd]
+                          https://github.com/redis/redis.git
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+---
+ .github/workflows/daily.yml |  6 +++---
+ src/bitops.c                | 32 ++++++++++++++++----------------
+ src/server.h                |  2 +-
+ tests/unit/bitops.tcl       | 28 ++++++++++++++++++++++++++++
+ 4 files changed, 48 insertions(+), 20 deletions(-)
+
+diff --git a/.github/workflows/daily.yml b/.github/workflows/daily.yml
+index 9e4630e29..432971a9d 100644
+--- a/.github/workflows/daily.yml
++++ b/.github/workflows/daily.yml
+@@ -151,7 +151,7 @@ jobs:
+       run: |
+         sudo apt-get update
+         sudo apt-get install tcl8.6 valgrind -y
+-        ./runtest --valgrind --verbose --clients 1 --dump-logs
++        ./runtest --valgrind --verbose --clients 1 --tags -large-memory --dump-logs
+     - name: module api test
+       run: ./runtest-moduleapi --valgrind --no-latency --verbose --clients 1
+     - name: unittest
+@@ -171,7 +171,7 @@ jobs:
+       run: |
+         sudo apt-get update
+         sudo apt-get install tcl8.6 valgrind -y
+-        ./runtest --valgrind --verbose --clients 1 --dump-logs
++        ./runtest --valgrind --verbose --clients 1 --tags -large-memory --dump-logs
+     - name: module api test
+       run: ./runtest-moduleapi --valgrind --no-latency --verbose --clients 1
+ 
+@@ -260,7 +260,7 @@ jobs:
+         prepare: pkg install -y bash gmake lang/tcl86
+         run: >
+           gmake &&
+-          ./runtest --accurate --verbose --no-latency --dump-logs &&
++          ./runtest --accurate --verbose --no-latency --tags -large-memory --dump-logs &&
+           MAKE=gmake ./runtest-moduleapi --verbose &&
+           ./runtest-sentinel &&
+           ./runtest-cluster
+diff --git a/src/bitops.c b/src/bitops.c
+index afd79ad88..f1c563a41 100644
+--- a/src/bitops.c
++++ b/src/bitops.c
+@@ -37,8 +37,8 @@
+ /* Count number of bits set in the binary array pointed by 's' and long
+  * 'count' bytes. The implementation of this function is required to
+  * work with an input string length up to 512 MB or more (server.proto_max_bulk_len) */
+-size_t redisPopcount(void *s, long count) {
+-    size_t bits = 0;
++long long redisPopcount(void *s, long count) {
++    long long bits = 0;
+     unsigned char *p = s;
+     uint32_t *p4;
+     static const unsigned char bitsinbyte[256] = {0,1,1,2,1,2,2,3,1,2,2,3,2,3,3,4,1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,3,4,4,5,4,5,5,6,4,5,5,6,5,6,6,7,1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,3,4,4,5,4,5,5,6,4,5,5,6,5,6,6,7,2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,3,4,4,5,4,5,5,6,4,5,5,6,5,6,6,7,3,4,4,5,4,5,5,6,4,5,5,6,5,6,6,7,4,5,5,6,5,6,6,7,5,6,6,7,6,7,7,8};
+@@ -98,11 +98,11 @@ size_t redisPopcount(void *s, long count) {
+  * no zero bit is found, it returns count*8 assuming the string is zero
+  * padded on the right. However if 'bit' is 1 it is possible that there is
+  * not a single set bit in the bitmap. In this special case -1 is returned. */
+-long redisBitpos(void *s, unsigned long count, int bit) {
++long long redisBitpos(void *s, unsigned long count, int bit) {
+     unsigned long *l;
+     unsigned char *c;
+     unsigned long skipval, word = 0, one;
+-    long pos = 0; /* Position of bit, to return to the caller. */
++    long long pos = 0; /* Position of bit, to return to the caller. */
+     unsigned long j;
+     int found;
+ 
+@@ -410,7 +410,7 @@ void printBits(unsigned char *p, unsigned long count) {
+  * If the 'hash' argument is true, and 'bits is positive, then the command
+  * will also parse bit offsets prefixed by "#". In such a case the offset
+  * is multiplied by 'bits'. This is useful for the BITFIELD command. */
+-int getBitOffsetFromArgument(client *c, robj *o, size_t *offset, int hash, int bits) {
++int getBitOffsetFromArgument(client *c, robj *o, uint64_t *offset, int hash, int bits) {
+     long long loffset;
+     char *err = "bit offset is not an integer or out of range";
+     char *p = o->ptr;
+@@ -435,7 +435,7 @@ int getBitOffsetFromArgument(client *c, robj *o, size_t *offset, int hash, int b
+         return C_ERR;
+     }
+ 
+-    *offset = (size_t)loffset;
++    *offset = loffset;
+     return C_OK;
+ }
+ 
+@@ -477,7 +477,7 @@ int getBitfieldTypeFromArgument(client *c, robj *o, int *sign, int *bits) {
+  * so that the 'maxbit' bit can be addressed. The object is finally
+  * returned. Otherwise if the key holds a wrong type NULL is returned and
+  * an error is sent to the client. */
+-robj *lookupStringForBitCommand(client *c, size_t maxbit) {
++robj *lookupStringForBitCommand(client *c, uint64_t maxbit) {
+     size_t byte = maxbit >> 3;
+     robj *o = lookupKeyWrite(c->db,c->argv[1]);
+     if (checkType(c,o,OBJ_STRING)) return NULL;
+@@ -527,7 +527,7 @@ unsigned char *getObjectReadOnlyString(robj *o, long *len, char *llbuf) {
+ void setbitCommand(client *c) {
+     robj *o;
+     char *err = "bit is not an integer or out of range";
+-    size_t bitoffset;
++    uint64_t bitoffset;
+     ssize_t byte, bit;
+     int byteval, bitval;
+     long on;
+@@ -566,7 +566,7 @@ void setbitCommand(client *c) {
+ void getbitCommand(client *c) {
+     robj *o;
+     char llbuf[32];
+-    size_t bitoffset;
++    uint64_t bitoffset;
+     size_t byte, bit;
+     size_t bitval = 0;
+ 
+@@ -888,7 +888,7 @@ void bitposCommand(client *c) {
+         addReplyLongLong(c, -1);
+     } else {
+         long bytes = end-start+1;
+-        long pos = redisBitpos(p+start,bytes,bit);
++        long long pos = redisBitpos(p+start,bytes,bit);
+ 
+         /* If we are looking for clear bits, and the user specified an exact
+          * range with start-end, we can't consider the right of the range as
+@@ -897,11 +897,11 @@ void bitposCommand(client *c) {
+          * So if redisBitpos() returns the first bit outside the range,
+          * we return -1 to the caller, to mean, in the specified range there
+          * is not a single "0" bit. */
+-        if (end_given && bit == 0 && pos == bytes*8) {
++        if (end_given && bit == 0 && pos == (long long)bytes<<3) {
+             addReplyLongLong(c,-1);
+             return;
+         }
+-        if (pos != -1) pos += start*8; /* Adjust for the bytes we skipped. */
++        if (pos != -1) pos += (long long)start<<3; /* Adjust for the bytes we skipped. */
+         addReplyLongLong(c,pos);
+     }
+ }
+@@ -933,12 +933,12 @@ struct bitfieldOp {
+  * GET subcommand is allowed, other subcommands will return an error. */
+ void bitfieldGeneric(client *c, int flags) {
+     robj *o;
+-    size_t bitoffset;
++    uint64_t bitoffset;
+     int j, numops = 0, changes = 0;
+     struct bitfieldOp *ops = NULL; /* Array of ops to execute at end. */
+     int owtype = BFOVERFLOW_WRAP; /* Overflow type. */
+     int readonly = 1;
+-    size_t highest_write_offset = 0;
++    uint64_t highest_write_offset = 0;
+ 
+     for (j = 2; j < c->argc; j++) {
+         int remargs = c->argc-j-1; /* Remaining args other than current. */
+@@ -1128,9 +1128,9 @@ void bitfieldGeneric(client *c, int flags) {
+              * object boundaries. */
+             memset(buf,0,9);
+             int i;
+-            size_t byte = thisop->offset >> 3;
++            uint64_t byte = thisop->offset >> 3;
+             for (i = 0; i < 9; i++) {
+-                if (src == NULL || i+byte >= (size_t)strlen) break;
++                if (src == NULL || i+byte >= (uint64_t)strlen) break;
+                 buf[i] = src[i+byte];
+             }
+ 
+diff --git a/src/server.h b/src/server.h
+index 67541fe60..caf9df31c 100644
+--- a/src/server.h
++++ b/src/server.h
+@@ -1795,7 +1795,7 @@ void getRandomHexChars(char *p, size_t len);
+ void getRandomBytes(unsigned char *p, size_t len);
+ uint64_t crc64(uint64_t crc, const unsigned char *s, uint64_t l);
+ void exitFromChild(int retcode);
+-size_t redisPopcount(void *s, long count);
++long long redisPopcount(void *s, long count);
+ int redisSetProcTitle(char *title);
+ int validateProcTitleTemplate(const char *template);
+ int redisCommunicateSystemd(const char *sd_notify_msg);
+diff --git a/tests/unit/bitops.tcl b/tests/unit/bitops.tcl
+index 926f38295..534832974 100644
+--- a/tests/unit/bitops.tcl
++++ b/tests/unit/bitops.tcl
+@@ -349,3 +349,31 @@ start_server {tags {"bitops"}} {
+         }
+     }
+ }
++
++start_server {tags {"bitops large-memory"}} {
++    test "BIT pos larger than UINT_MAX" {
++        set bytes [expr (1 << 29) + 1]
++        set bitpos [expr (1 << 32)]
++        set oldval [lindex [r config get proto-max-bulk-len] 1]
++        r config set proto-max-bulk-len $bytes
++        r setbit mykey $bitpos 1
++        assert_equal $bytes [r strlen mykey]
++        assert_equal 1 [r getbit mykey $bitpos]
++        assert_equal [list 128 128 -1] [r bitfield mykey get u8 $bitpos set u8 $bitpos 255 get i8 $bitpos]
++        assert_equal $bitpos [r bitpos mykey 1]
++        assert_equal $bitpos [r bitpos mykey 1 [expr $bytes - 1]]
++        if {$::accurate} {
++            # set all bits to 1
++            set mega [expr (1 << 23)]
++            set part [string repeat "\xFF" $mega]
++            for {set i 0} {$i < 64} {incr i} {
++                r setrange mykey [expr $i * $mega] $part
++            }
++            r setrange mykey [expr $bytes - 1] "\xFF"
++            assert_equal [expr $bitpos + 8] [r bitcount mykey]
++            assert_equal -1 [r bitpos mykey 0 0 [expr $bytes - 1]]
++        }
++        r config set proto-max-bulk-len $oldval
++        r del mykey
++    } {1}
++}
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.2.bb b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
index a9e6eaffa..ad675e9e0 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.2.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://fix-CVE-2021-29477.patch \
            file://fix-CVE-2021-29478.patch \
            file://fix-CVE-2021-32625.patch \
+           file://CVE-2021-32761.patch \
            "
 SRC_URI[sha256sum] = "7a260bb74860f1b88c3d5942bf8ba60ca59f121c6dce42d3017bed6add0b9535"
 
-- 
2.24.1

