Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4790C87FCF
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 06:42:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.95058.1755067340523911689
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Aug 2025 23:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0320c4a9ee=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57D5KZTX2742886
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Aug 2025 23:42:19 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48fvchhf35-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Aug 2025 23:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gl7a9QgwzY2Pqw03kdlxh40HTeXTPje/60oXXE5beurDTkAhwUaae9TWpudldLvUWRthykn10NsdKpKkeRhCxv+HJ5PkMiEvY1Pv7kACbvu9fHX0AIlgPmnuG/g1wdp0oR9awUy1CunS+H4+mDpGhry7qeXo/xlxvDpHb7rBSgA5xOfWKq4qEZw+tGsFCxkg0etYcRPcfaJ37g+1MLOgA9EIvgxpK8JOUFmgixmcrh3iX+4koGHELCZ/yKFfJDdwjE1QlwNOXmIdxfsevdD5jMsKNIocEDtHP0OUgmBhKyAHjDjouO1RQ7Fdzk1vKRIcNNnTYh6brYfzf7qU9Epk3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bksSdqL7d4gi5JG1EKy7RBtZ48G3qeVFUbaeom+FnZs=;
 b=uq6y3XP2b6KF9lThg3Rq15asXg7eF7nLh0xQoSJQUbVIEtRCn16XxDzZmfuuLkH0lZRX40aGbiy6a2syweErXxPCMjDbDOTmV8W3wPfM+FF0cN4gcXEW+nAMjBArcGjNCbWqA6fbtdjPQrX8kKb8Ygd57qsKpGR32/S7zevQa7NL1KPhNy1FtW5qcwSVfrKXLGYMyZ+f/ih7023/rIjYTPRkA9Micm/3ticsrDBtCL6O4DmAjl3eTxxym6Fmdoq9VmyRT4Sj3akOr9tjVzRSQNEF1xOadzRg8+IGZgeR6NVu91dUGIa5YWutLwrNOoa9P6dhNRx5mbHJXf5z9wg8Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by SA2PR11MB5018.namprd11.prod.outlook.com (2603:10b6:806:11a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Wed, 13 Aug
 2025 06:42:16 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%5]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 06:42:16 +0000
From: guocai.he.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][kirkstone][PATCH] tcprelay: fix a minor cross compilation do_configure issue
Date: Wed, 13 Aug 2025 14:42:00 +0800
Message-Id: <20250813064200.657215-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR02CA0062.apcprd02.prod.outlook.com
 (2603:1096:404:e2::26) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|SA2PR11MB5018:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f4cdc32-91bc-4f81-252a-08ddda348b13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Hyh9i8hqA/N+fCcEmvtcir492HP0CsTS84r3JGzZRH1c8zh3WdiWnsxAhMRh?=
 =?us-ascii?Q?XLp7SoNtU92jFx0KolhckE3zb4cy6vXSZFXkfluYn03dtStWolKkafDv7tIP?=
 =?us-ascii?Q?Hcd5ERqC85Ws96kCEY6ZzJ5SdBhkORHPocxSuMhkzM/TgInvKJa948BQkJ7M?=
 =?us-ascii?Q?FOFrXt/HKjRiJ/yYe3kuWeF4hhs4pJUniwtMN4DmXUKUzpu/xqxrVMoAaUMj?=
 =?us-ascii?Q?BrhmFX5ssNi8KGkAXSxynZ8RLemqOpgb2co6RQyBXbqUPq8oHsmNE4cGUIRM?=
 =?us-ascii?Q?RCftebK4vMHJ8DOTMWtTQsZFXX2VKjKFVINmLAYLEQLQC5Hofq3zIy67DJKg?=
 =?us-ascii?Q?oHDimL2iP1VjII0GCCuWAO+9EI7zmmSsQ60sYWaTJMPrAzRMJZM3IydQ61aE?=
 =?us-ascii?Q?zYPoFcUJ5osmmaRGYmiL/oiHT2pcea3Ev7zEZJ600tPjZdhrC1WV/9QcBhYh?=
 =?us-ascii?Q?kTNPkBI2/mR774Z6pdivCgFhPMtdMkQmVEOkyWKOpGAXBMqu8rLwVTgslcjU?=
 =?us-ascii?Q?A/I1YenKzxGmKeALjj/rJxuKezMqp/0Mwezw5a7il6DsWUo3V9REcDcBwG1b?=
 =?us-ascii?Q?pWTj751Oq3thivalUAQ8kLk/9IXFl11UgLPXGdG4Wmog8twfeUXmh5tMYbHg?=
 =?us-ascii?Q?1YddAvORNdcmM5fEKUXjVHTQXlvL0FKf1JeQSixLUBgym2eGU/PY3ECjd/3W?=
 =?us-ascii?Q?9l5yA+sPwJz7O3uHPUwzrngjz6ABp6cCrIZvrLtLKchujgX1cPvuGmYwUT9y?=
 =?us-ascii?Q?rqkCUMnca3UnwWlKzEdOKH/rAGZ7gRdDLvMWo/1ESaeOf0R139SukrYMSPqG?=
 =?us-ascii?Q?ThH6y1LGpg3b6RFMGMP9Ic01b4mMU+A9zU7MvXFVXL73mZ599xhq/RVPaHYv?=
 =?us-ascii?Q?CMK/L9Gfgd345Bcjkvtq23NpDPdm/pSb6VoEMOJAj2p4nyx7mEnDeGwrC2Lu?=
 =?us-ascii?Q?IL4UvmmPyVqpg7RqTIhlpw0aJcL0sDJodj7zX9U+7CvwvGNbLhHRgwuyoxUb?=
 =?us-ascii?Q?QZIw0vtBaqY73EMw34aDjV1sewiq5Z2/KROMy/u4lbRG3j9dzGfivXIZdrOR?=
 =?us-ascii?Q?NO+bvS7ggM5wSZL4alNwCu4CIyfBAZFPmkr3qGGIkFo3uBzACuarxuJXyrNZ?=
 =?us-ascii?Q?qcBfWI90NI1IJqmWugcYFNgO3TbYn6rH4kkqbyGXp2W2TR+kxeWdTTwmoQHF?=
 =?us-ascii?Q?4jQLMDtsLvSkkYEeb5Nohp8VzMh5IweRUF1bd6nUJvUkwC6DjOz86Pm4vFis?=
 =?us-ascii?Q?SItOiNRbiCqfAk10pYT5V2a96dmtqX2l1Esq6qSUep16IFcQuphKUpWNTsRe?=
 =?us-ascii?Q?tlSG5NrHym82uq00MMT7ly04fTyDKPzwOhHtoL5d3CuUQBPucc9tmUgGtGN1?=
 =?us-ascii?Q?4Qg9U7TBx0ODMtwurYno0aDFgF4bQnBc8kASJBrZts+WnciSKleB2JL0hmxO?=
 =?us-ascii?Q?ukBlFThFOfkib3zt8abi3soFT8OsAdYJgGU7l4sGc5nhDalyswHEVj4y4n8h?=
 =?us-ascii?Q?OXtIwEMtEHzRa5s=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gcDB48y5f8XX9yIqiQEV83KxEOEriyXSREU/aCoYqXNR52BAmPOjwQErmVWj?=
 =?us-ascii?Q?IU/rDah7VEu/+jbvKCwFWxjzJx/p4As/M667taak03x4vKVrZrMoGGWTxUsX?=
 =?us-ascii?Q?rAykpXj+9LM7vCpz6j1ESSBUOkOJJlNg7RoFzyFl4TXgr7TAZrqhni86oy1n?=
 =?us-ascii?Q?VCwmeUos+jFk6/NY/l9UvkiE4klTQWjIOBzieqB6Iz2ORDIylEX9qPfM42l4?=
 =?us-ascii?Q?hw5fsHf8ZGaTyksKMmdjm6OegzTmCHfCe1vCW8kHbz7oByLNjt7dTFvf92ww?=
 =?us-ascii?Q?WwFl9xCDSztgvSX36m/rXdps5WIJkAfREAugB/rX9XhQsxbHe2y69DmdmZjg?=
 =?us-ascii?Q?hnBgLIQul5CJVuz0DEdT71tmjTXq/RgAifnpCBea1FXTXKmo+8TblmzEXUi/?=
 =?us-ascii?Q?fx68QP+KTAApeTVrBbYb1bT5a1LJIzdFvriLzViXu4naKtu8gUuzRFcDDv3Q?=
 =?us-ascii?Q?xgKJbQ1xgGct0/Taz3HnfD9WN2L2mnU4/vN9xanQ9Gjoc3JlSkm2qt+ZD3OJ?=
 =?us-ascii?Q?XR6Ce/D0QCJShg85pS/4GCfPrAd7n3e0Vh7B/1Mr0y4FEb+8fImi4Rcpp6OO?=
 =?us-ascii?Q?drmdAn8THgMnPdF2AfOARAeJMq8tOyQSYKmfyVWxlw9F5nQzreqyI0LE8S1r?=
 =?us-ascii?Q?C2PpzDWmrWo6HUdP6b+AZef8BS3X/hzX6wVCT2q0KLesLcvAZjYuwh71U8dE?=
 =?us-ascii?Q?6FaIYzaAy+VzGCVb/mqmyqNQHozbIkiUSExf6BXafjNHlYA3ZQfIa5s8lNkc?=
 =?us-ascii?Q?HCz6jchnYoaJ8xtBdK6UNW+FfV6s/gloVJTRHhx8/ak4jbmgWnxGB1BdhiUa?=
 =?us-ascii?Q?DKtzsmTTBmGDXnt/msrENNuM4X7M1ZDV32yc+Wxbz2jb//hT40Bq4SgfLVvG?=
 =?us-ascii?Q?ePhZzCXbaxEGatK2jpmLvSk9mzi4Z8DhgbOBNbNtiHvkJ0LCaEOSmpZR7Wxw?=
 =?us-ascii?Q?+awr7CqQ7yAu7PDeFCbMKzqlhgYP4G6XwFynfxsv0XW+Uhpm3SbXJsb8y2w3?=
 =?us-ascii?Q?cUsknjXcJTlnB/fBHRAY+nZODUTtCRylkp/60IE9gks71FDFdpynL1zDH4z+?=
 =?us-ascii?Q?H87ckgdXi64CjiR4JiHRfDK3uU3iKE/EQJwObhj4sQLSVs3hu9KVf6Ckp4cF?=
 =?us-ascii?Q?c6zMeoGbyKDONPZiWRdQFrTh4voSwXWsUG0bjC/PPDUJ575RNoobxligb1QD?=
 =?us-ascii?Q?HsJZvMarbUTi/zBqMsyuzEgM5cg+z5+L6zzII/jZ5UvCBj1nT0va77kg3prK?=
 =?us-ascii?Q?ZUaScn3E62PFO1h2qmkr9ltHKY6mQ8zBma+a87F8JqBRCEjY9Z8zA6XLWhy2?=
 =?us-ascii?Q?tIoT+RvGgB/b5KJ7HpY80oX4OOM86csKNx2fNiIDcXeeyoPb6xJ7g7KBPILu?=
 =?us-ascii?Q?zkhhFRu8EHDe9tttXKq5FAsEk7Ndpc9312MZWXiPX6nhi4r41yRMeX0DWB79?=
 =?us-ascii?Q?rXLVZyn8dZMjS3pxTbexaB2g5Feaau5lbyIDmlRIRZwDsVYNaa8ZsmU/takp?=
 =?us-ascii?Q?NaWbdqYJVgkPCZ+jAyX7iXcdGS0nMwqcEMw2vHURWjY2Bw45VOurYB0OXPOQ?=
 =?us-ascii?Q?zSvDu9O9hEK0CryNTcD9S27e72k8hNhXb2C4LCYRsRCV4h0QJmMX386/a7OB?=
 =?us-ascii?Q?Kw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f4cdc32-91bc-4f81-252a-08ddda348b13
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 06:42:16.6263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nsnhxuJKIW/8b+np6TwP6GjooXtsRN+tvG2u1Gy5BA7PRyfp2oCrnt0b973ccd24OicrUtzl735tF1c/Fd5m4xyFjH73uMFeHw6jns7Aqs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5018
X-Proofpoint-GUID: A4LatbXi8k_LrN9_Jnov2OT1O-kg1Cww
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDA2MiBTYWx0ZWRfX9WGkD4Rjd7O+
 V/S0TufgqZYf+vTyKVL5SouZNKchPNe/UGZPoRczknVQS8euwW5ccP1QeK/bkfW/0FIgw+8iLTc
 XE9/XXx4+pv/WKu6pBGERI/b+42clzMy/TB6BNvF1BCkybEqC2ebgygoUG8+raIzMikMkutLexO
 V9GNa3R4/4+6NkT4jBvO1NH1hSDGz32MiLwlVhnCNddOoTgidK8Rceh3dLPmzDdewDNFKWrsP7O
 NvAPI4DrjTBNShFy4VZPDggzIZQXXo4HRlLCVB3phJXBK5JteBXQJNsfD+HDmgZZcmLTzPIx0Er
 gD6IaQvWu962SCBkTOJi/WqU7pzodacThXYA4oc6Ji3S7KmRmoiWe/7cofZ5f0=
X-Proofpoint-ORIG-GUID: A4LatbXi8k_LrN9_Jnov2OT1O-kg1Cww
X-Authority-Analysis: v=2.4 cv=RPGzH5i+ c=1 sm=1 tr=0 ts=689c33cb cx=c_pps
 a=pfCY2Ats7XXgTBCGz+4jpg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yU_jQ1hFIRIA:10 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=0gfcVsA-400DJKt_lX0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Aug 2025 06:42:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118922

From: Chen Qi <Qi.Chen@windriver.com>

We're seeing errors like below in log.do_configure:

  ./conftest: cannot execute binary file: Exec format error

The tcprelay's configure have two places to execute ./conftest.
And the result happens to be correct even with the error above.

Instead of leaving the errors as they are, we explicitly skip
running ./conftest in case of cross compiling. The build will
continue to succeed and result will remain the same.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

(master rev: 8cf55e279fd08f71f281fc8e5f2dabd638d3fa79)

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 ...not-run-conftest-in-case-of-cross-co.patch | 50 +++++++++++++++++++
 .../tcpreplay/tcpreplay_4.4.4.bb              |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/0001-configure.ac-do-not-run-conftest-in-case-of-cross-co.patch

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/0001-configure.ac-do-not-run-conftest-in-case-of-cross-co.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/0001-configure.ac-do-not-run-conftest-in-case-of-cross-co.patch
new file mode 100644
index 0000000000..d424d4fa35
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/0001-configure.ac-do-not-run-conftest-in-case-of-cross-co.patch
@@ -0,0 +1,50 @@
+From 42f7bbc1ce4913fe2c0bc76293c5445d31690f5d Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 7 Mar 2024 21:02:07 -0800
+Subject: [PATCH] configure.ac: do not run conftest in case of cross
+ compilation
+
+It'll give us nothing but error like below:
+
+  ./conftest: cannot execute binary file: Exec format error
+  ...
+  ./configure: line 23950: test: -eq: unary operator expected
+
+The version check only has effect on Apple systems. We'd better
+avoid error like above when cross compilation.
+
+Also, in case of cross compilation, instead of having the above
+Exec format error and resulting in unaligned_cv_fail to yes, set
+it directly to yes.
+
+Upstream-Status: Submitted [https://github.com/appneta/tcpreplay/pull/849]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 387219de..15201601 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -928,7 +928,7 @@ cat >conftest.c <<EOF
+ EOF
+ ${CC-cc} -o conftest $CFLAGS $CPPFLAGS $LPCAPLIB \
+     conftest.c $LIBS >/dev/null 2>&1
+-if test -x conftest ; then
++if test -x conftest -a "$cross_compiling" != "yes"; then
+     full_libpcap_version=$(LD_LIBRARY_PATH="$LPCAP_LD_LIBRARY_PATH" ./conftest)
+     libpcap_version=$(echo "$full_libpcap_version" | ${CUT} -d' ' -f3)
+     pcap_version_ok=yes
+@@ -1709,7 +1709,7 @@ case "$host_os" in
+ EOF
+         ${CC-cc} -o conftest $CFLAGS $CPPFLAGS $LDFLAGS \
+             conftest.c $LIBS >/dev/null 2>&1
+-        if test ! -x conftest ; then
++        if test ! -x conftest -o "$cross_compiling" = "yes" ; then
+             dnl failed to compile for some reason
+             unaligned_cv_fail=yes
+         else
+--
+2.42.0
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
index 3ece4b78c6..09831d8c80 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcprepl
            file://CVE-2023-4256.patch \
            file://CVE-2024-22654-0001.patch \
            file://CVE-2024-22654-0002.patch \
+           file://0001-configure.ac-do-not-run-conftest-in-case-of-cross-co.patch \
 "
 
 SRC_URI[sha256sum] = "44f18fb6d3470ecaf77a51b901a119dae16da5be4d4140ffbb2785e37ad6d4bf"
-- 
2.34.1


