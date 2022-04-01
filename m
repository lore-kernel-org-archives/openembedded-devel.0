Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B52C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 09:42:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.8463.1648806133063674022
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Apr 2022 02:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=pY0IQu9p;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=1090099bd9=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2318qcrW001046
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 1 Apr 2022 02:42:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=EG8lfqNRSZzKOOPXXv3OWaKq9oW/LZTvC0rp2ffwEUI=;
 b=pY0IQu9p7MoL22Bxiv0w0qKLRyXisIjKJgQpq1Qt7SutH222det5louzeZBjTca0EO63
 40aPoQF3xcNZ7FEtj2Zt7Xo7K6LDaasZCOMRNgytdtMiWKpYvb6/TieXhAtYNzIODJTP
 oIDFBur+nII59RGYsw9gX+c/uPL9Ga9rGwc7VSZgkvY+IghXadP7zj0xrZp6vmzo6s64
 IFx+teWMiD7kZfhrFthlSUNlkR2bNGgJ1B3vmHzogbJKtJASYa78qeiw95Eh6Whho0rX
 V8RRm27S2oWZsJVDuS4DOu+vMjgQZuVrSeQyCp1X0p26vq6Go1C0P5GFoTmSDTsX/EPV 6g==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f22bjdb1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Apr 2022 02:42:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqVqRYCOGNo0tgvZIpaqYLpaCt6G1UqE9cVq817tbLV05WbTOZnaeNdw1iz6d/Bzmea5uiwJ4oYjphezIcbmtx7F48V3j85u06oxHUmp4mXNRTvMlvkF7LOXkOmgd2s99PLilWD72zymUh1HorFKnZ9urx6Yj0pRtqkdXLKnBI2twA+yiRpxMTvTlS67sLVN7KMD+UWVN6Cbcc/oVX/wxOvQ1iyxanyz4rYq65DsifoQVDhv0SxSc+knYyVZ0P+HxHSYvEZD6AQwj1zkb58eXzxqj8NBwjM4n8mYmFwitDalEWScVPeOOtqVmyO5k7raSfAMW7ZHBpIqxuFFijHdug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EG8lfqNRSZzKOOPXXv3OWaKq9oW/LZTvC0rp2ffwEUI=;
 b=mb8ETyI+TrqcxJWxuTLfyEuP30QRfNzQD3uqfMdf6sLZ0PNOFfF+cvcbwTIF3viRPMdmdeReYhM6HR3C1fzcx2P+1wO6saq4xd9liAIs1vda5NboiOhXlIz0JZ2Ln0HQU/RqYCUxLQrRd3GtDqiHLvI3dbmZCDUeL8guWksTViGuTOG7i1jjvsQKOcC2e+XlAfJxxmqMAowu6dicrqJyR1s5lKWDlhVpCV2zwG8AsgMScTZK+bQqaD5u0ko+uxiUPO4pnmDtr80gh76a70w8UzFYhkvWCkMrtgG/sv0zrIOIHNfDuxBjnFnVlJuxXj9ExcgJGXTYc9envgXMpa2xtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SJ0PR11MB5150.namprd11.prod.outlook.com (2603:10b6:a03:2d4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.27; Fri, 1 Apr
 2022 09:42:10 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8ec:d095:e49b:d875]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8ec:d095:e49b:d875%9]) with mapi id 15.20.5123.025; Fri, 1 Apr 2022
 09:42:10 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-initramfs][PATCH] dracut: upgrade 055 -> 056
Date: Fri,  1 Apr 2022 17:41:59 +0800
Message-Id: <20220401094159.2476691-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR06CA0021.apcprd06.prod.outlook.com
 (2603:1096:202:2e::33) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3d72852-af92-40f8-d8cd-08da13c3e4c8
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5150:EE_
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB515065A16E7F8260639A0E9EF9E09@SJ0PR11MB5150.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FM26f7IQ1tgWpkkQ0iCAYk/IV+9NKCCzaeE06ax7J820rkAvh8DXWBr5Za3sGPkKEqqSywZvgpsgqNGlizzuom5iqtFagPGQjrE5XQThye0Udy1JEw/eoqMVI3KDBZ6pPOm4bWXicZIzyyTxdhxHjqCQXlji8CVtLRMxl3xqQE5RMfyP82hNLJ9vLF6JWpws7HWR22rOhNRSdasdJNalsvIVaqKx/+gy4DO7fUIhRVeJxuQBSlzHy+JB+uhjswxnlxIkPhNR9Bk/lV9UZR2eImh73F4loIF1+113RpP6UyULLR+lL2tJ6pQM3QVoDXVUfD+M3j94zolYS0H18AHIrzVetrC9OX+1tosbMpYzojPgPPXV6GNTLITMB5a0hYQWqByVQHe0aoqhBzMAfYpOJHPKFLEZGe/8+S0KIQhOkrLnxf8PlP3u5V9Lt+jK/Ufv1ZlQPKU4IC7Hms+hLK3gXja0yPvNj+ykkoxHWFl7UYs4dmll2o6Q9ywTXtnm6Ov6qo6fa+jMeDm8sFve6V+ylnMtKTD+1oe9p4wfBNL97kRYbVba/rrvVZPNFJRDRy6+JGTnYQaRMAGPKLpH0FL279wvstEn2RZcakEeJ2dzZdKLo6V0bqQWMIRm95oXStOmocplTZhosGMmt3lrUpQCWQLzFHTXz5BOf6/sDBoEb2pLwJkLh2+KA+qIXUqjHGrRornZAW/R7F8liu5Pn69uow==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(83380400001)(316002)(186003)(6486002)(38100700002)(26005)(8936002)(44832011)(38350700002)(508600001)(6916009)(36756003)(1076003)(2616005)(66476007)(66556008)(8676002)(5660300002)(6506007)(86362001)(6666004)(52116002)(6512007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?y81DZKQELAdKW3Zodz4nNqqsKt0LZyM2NvSVOIP42DFAxMnhpTSsR7jwg/st?=
 =?us-ascii?Q?IRJwp6qw5gWPM7+wcDu0VB/WGTqc6agYHBtHLqQba30QwYLxIgDeCRR7Fn6y?=
 =?us-ascii?Q?Qacur9AbHAhje3i0s4dSCum5vM9AzmJw41FTQ4ckRDU2hIZRDj5CxOfSVAFN?=
 =?us-ascii?Q?tZq9VunBicw1Q9tu9MnB/H+dYL0Npe15kjy5yXtuc3nCK5vQUvI0grSiATF5?=
 =?us-ascii?Q?2Gz4buosl75kKW8Tp+9JM+mssnIM5Y/FIZIS2GJkBGwhhVwDSi8stSyHQW6d?=
 =?us-ascii?Q?W6lqfsbS1mJ86a44Mx5YeJc1XhnYdfSPEOSiayO1wAAC8e2iywbatLFDbCQP?=
 =?us-ascii?Q?p1OzljnsPqGPh2TXs9HYI/Da2Y2Idrq9xgOGstTh0qpGy/EAEGn3q1axDJu+?=
 =?us-ascii?Q?4lw5ELdp6AqtQYSw48EIJyUw3MrrL9+i1/RmjrHC1jjDqbGFEd5ACHd98Ufo?=
 =?us-ascii?Q?RyLWg0Zvfu4ByVf90NG86sci6Go4YZR7IVD5p7jXI9+U/KHdtaKAlEM3MVAI?=
 =?us-ascii?Q?/oqzc9oax4HY6a5gF4bDOwHkRZE6KdLiSGyv/6VQhQOR7PxT/rmBpEe67aKI?=
 =?us-ascii?Q?Ht5gbMiLclrsVbZDROwISpWTWJj6lcqhaVGDrjaUgTLhXYQ08KlE2G8uv+hq?=
 =?us-ascii?Q?aKWfcZNi4pObdC+acvyr2b545gRN/WfdVErF7tg9Z3Yg3fgTYUABEUzXWxxn?=
 =?us-ascii?Q?WVLUN+6zzsH9ecii8CctIZaPECaJVp8L+2IEcXNx5YnbZFUJtswDPE0YAccc?=
 =?us-ascii?Q?jkrHQVdZ2lSVYIuYoIKha4v6k7Hp9HVLhoniNutTp1sI4+0kImokOpl4rc/J?=
 =?us-ascii?Q?Is6rVMq5LZJBFJZqR5plp613IsRN+hW8mtYLCO8i85aiwguAwNfay07m9hNF?=
 =?us-ascii?Q?Ium3+li/kTXesauOlHmBf2xOWznJM3MZT7G3yf89xGT9QZSNBKGm3Rc9CYgG?=
 =?us-ascii?Q?bzQq86sDDKLrsOMO9OwhzzrsBxJyu6AA6Hf+iTq73faCkNTvQ457HWyh7f0g?=
 =?us-ascii?Q?K+AVSaDgdR3nRsX2YCJNhEXejl975cL0zwLDEE2U+ZhPYJoS7r+/5KGT7Bnl?=
 =?us-ascii?Q?ojyXGXMTatnnHMsTTTlyd91s/d4xX+ZRhmA29PtC/GAh6sONxevEzdbKRcof?=
 =?us-ascii?Q?WMfcXHJjXtJP++zyNHIeTXSe41zEjEsg2lqaoZyF39k7/+vuxA9HwSJspO15?=
 =?us-ascii?Q?rCu542n9lu/ExMd/T/6m8XHjGPgNHiw57e/VEiHWUSh3xQxNmgp3K8LzhDyn?=
 =?us-ascii?Q?u/gWNuxDhGLdQ5EzAmPmfVfij7J1gxjcyrYlbYvGuH9ah01HHPjkc9Y/aWeg?=
 =?us-ascii?Q?p/gDkNPkWzlm76Rce6RFeWMDZffjN633WI6Q6BA6uifIbbjYBKAY9QPcnxIl?=
 =?us-ascii?Q?kqkoGkOxE2C/jlLEhQg8dfYyhscqyJoblwJVBRYU/BMDK8Rtf9C3MI6K39Gj?=
 =?us-ascii?Q?y9cC1/urjq6uH6ZCEMtMXA/ERkZtVtIeiJT3KCNwQmSjzwimR5RNx/JznoNn?=
 =?us-ascii?Q?oq8CwZ6qyIqYwvGlcn/GHYynI2Ob/lgvCKXyskgr1yBV6OpJnwUL3LpiVJm2?=
 =?us-ascii?Q?n9bdo1K4SdMfZKMexs63c/tsQpzHMnnhWhUTd1ehC++828IP1PK4cUnJyUWM?=
 =?us-ascii?Q?54TS1nQCJHprWs0xhXx5z0gqlM7fHPI5giupjM4LX1yhtPux/miC5R5EInMd?=
 =?us-ascii?Q?7IiZ38M5cqazDydonuEWAUq/K19Ad469kWzVYna6yzw3gPLSZ3cbFAIl/CcC?=
 =?us-ascii?Q?gPLRjrchlA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f3d72852-af92-40f8-d8cd-08da13c3e4c8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 09:42:10.7076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 oWagupFdtQK+cMTSO/jI8+FfTOBpy4RdilSTwo9aCgEd1uXX8VnKl9oi009/EXQoXlSAW5bz7SRHJLVaPo/zaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5150
X-Proofpoint-ORIG-GUID: c-pVn7L4T_WpV-mhixqa_aYsJqd3CaKL
X-Proofpoint-GUID: c-pVn7L4T_WpV-mhixqa_aYsJqd3CaKL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-01_03,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 mlxlogscore=535 bulkscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204010044
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Apr 2022 09:42:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96323

* Add a patch to fix musl build:
  src/install/util.c:30:19: error: missing binary operator before token "("
     30 | #if __GLIBC_PREREQ(2, 30) == 0
        |                   ^
  make: *** [Makefile:57: src/install/util.o] Error 1

* Pass "-fPIC" to CFLAGS to fix build warning with musl build:
  WARNING: dracut-1_056-r0 do_package_qa: QA Issue: dracut: ELF binary
  /usr/lib/dracut/dracut-install has relocations in .text [textrel]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...against-__GLIBC_PREREQ-for-musl-libc.patch | 35 +++++++++++++++++++
 .../dracut/{dracut_055.bb => dracut_056.bb}   |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-initramfs/recipes-devtools/dracut/dracut/0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch
 rename meta-initramfs/recipes-devtools/dracut/{dracut_055.bb => dracut_056.bb} (93%)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut/0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch b/meta-initramfs/recipes-devtools/dracut/dracut/0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch
new file mode 100644
index 000000000..bd768d00d
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/dracut/dracut/0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch
@@ -0,0 +1,35 @@
+From ff5e1a662ba93ba79e2aeaaaec48a2a8ec4b4701 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Thu, 31 Mar 2022 22:22:44 +0800
+Subject: [PATCH] Guard against __GLIBC_PREREQ for musl libc
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/install/util.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/install/util.c b/src/install/util.c
+index 5721de89..784aec48 100644
+--- a/src/install/util.c
++++ b/src/install/util.c
+@@ -27,6 +27,7 @@
+ 
+ #include "util.h"
+ 
++#if defined(__GLIBC__)
+ #if __GLIBC_PREREQ(2, 30) == 0
+ #include <sys/syscall.h>
+ #ifndef SYS_gettid
+@@ -35,6 +36,7 @@
+ 
+ #define gettid()    ((pid_t) syscall(SYS_gettid))
+ #endif /*__GLIBC_PREREQ */
++#endif /*__GLIBC__*/
+ 
+ size_t page_size(void)
+ {
+-- 
+2.25.1
+
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_055.bb b/meta-initramfs/recipes-devtools/dracut/dracut_056.bb
similarity index 93%
rename from meta-initramfs/recipes-devtools/dracut/dracut_055.bb
rename to meta-initramfs/recipes-devtools/dracut/dracut_056.bb
index a8fc5462f..7b8900610 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_055.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_056.bb
@@ -7,9 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PE = "1"
 
-SRCREV = "86bf2533d77762e823ad7a3e06a574522c1a90e3"
+SRCREV = "631d5f72a223288aa1f48bb8e8d0313e75947400"
 SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git;protocol=http;branch=master \
            file://0001-util.h-include-sys-reg.h-when-libc-glibc.patch \
+           file://0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch \
            "
 
 DEPENDS += "kmod"
@@ -36,6 +37,7 @@ PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/
 
 EXTRA_OEMAKE += 'libdir=${prefix}/lib LDLIBS="${LDLIBS}"'
 
+CFLAGS:append = " -fPIC"
 LDLIBS:append:libc-musl = " -lfts"
 
 do_configure() {
-- 
2.25.1


