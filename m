Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBCCCC0218A
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 07:50:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.32424.1737359390965725484
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jan 2025 23:49:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3115d3f7ac=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K6PTDc003397
	for <openembedded-devel@lists.openembedded.org>; Sun, 19 Jan 2025 23:49:50 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 448cpq17hp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 19 Jan 2025 23:49:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QnmjaLGKpMcPzRV1/j/Db/HIiocw9c6fa4cC7Hi7nymDibEtGi7pdW+NJrsOVQKhUXyXjlHTFvDsdGj7dHJiXuFclzOAgNUSQvDufqqI1uLkPbtE1n1qLsAk/5wCdaf1ppmbPNuiF7dnM8YoclK1RRyu5bVR9KUHa5gjf+RL4Jld1tBQjezTK6whsZqVpg6b8eZUGn520q3sk6GtKwM2vSXPZv7LYrfcGfU5eMElOJ2v0SJRldZzyhogvDyre8fiYK7syms3/r2oEVtyVDDI7Dxc+52HNuo/t0K4pAGhdQozjSKml8QP7pc9BzPDaEQRUxRLZF7Bp2n51ouoLFzZuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aewjLRvAPIDCwOY2FQoa633ceww4pKdlF7RqeLYzdI8=;
 b=cnFnIxyOIA00Bl0lWOMPN+4I9o5lz04DRfMSuvl+20hSAshcBT6My63JmiVAj3TI6EqT+p/JxQAs3bVfVB5ZnnwQg0BdII8uciPcXcoZx6ZPkWexqYcrSVrDX8IIpKj8XFXbO9JJOA3pPM7r4RMnO/KJuVXE4wG4JOn/81KghQBZnLak8LZso1hEmBOume6/kVYhfOwkfx46P/1DtnZ7kQuf839H/yJ45f8oCt8MaLDtWEzIyZR1HLw5y2zIb5yBwRHlSuFiLZWmgxm5ulTODIkRjof6aQt+2eqbHirApnFXCqG0f0DMwTFfiQSRrvFDz3uHrAB6FxrrW3wkEzN5Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DM6PR11MB4642.namprd11.prod.outlook.com (2603:10b6:5:2a2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 07:49:48 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f5f6:a389:b6fc:dbc3]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f5f6:a389:b6fc:dbc3%4]) with mapi id 15.20.8356.014; Mon, 20 Jan 2025
 07:49:48 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][scarthgap][PATCH] crash: fix crash cannot work with kaslr
Date: Mon, 20 Jan 2025 15:49:38 +0800
Message-Id: <20250120074938.2262388-2-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250120074938.2262388-1-xiangyu.chen@eng.windriver.com>
References: <20250120074938.2262388-1-xiangyu.chen@eng.windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYBP286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::21) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DM6PR11MB4642:EE_
X-MS-Office365-Filtering-Correlation-Id: 26ff6b6a-8896-4c1b-a4ce-08dd3927035b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Nhz2d5johluJo9QEMFcJ7fkITVYayzpBCJmCG3YU7D0ivlXaRytQnRzDigkk?=
 =?us-ascii?Q?evELffBDVX2SlgtykAWZLudTnRdTet2gkjUi1VnGSvANB6C+47rB1mNIw4pX?=
 =?us-ascii?Q?wZn6Ws7ixXEXlPsly2eVag5bukefuk0XUto8RqypfjL3fhSCoo1Z4oUPbQvK?=
 =?us-ascii?Q?LQqW8EEbP6sW3/7FuTJNKF8uv/XevVLCsOCuSz6LVfRd6x3RdebP5EotRLZ9?=
 =?us-ascii?Q?XlDUcKGKnuz+TdhxZBFbXE70ukOmVcaySOz4HEh8RnYpF3BbFP9ZAX/8SctT?=
 =?us-ascii?Q?+k9rxGuUvavCq5+hHzM7XWJceh10+7Ul0Gqf0mtGDr10U74vPdYe3GAH0l9i?=
 =?us-ascii?Q?wDytmDA63Ojxshn/twArCaTnStHuYEuqAmHkU+hdlFU/RKnZkPwyp0dqQtJQ?=
 =?us-ascii?Q?y60M6DuMhu2m9k6bLqQeRXY6rZcKbmoUF9aTSa5jqu+h2AzVQrn/WgtmJiut?=
 =?us-ascii?Q?llqWJLf/b3ZBLcfjkq92WLnyGcSA2NCnOICYfhP2M5kNPuimjZOxyB1M1qEn?=
 =?us-ascii?Q?BcDY+Pdb4qxduf9/wBcU7npSBXsoCWfGpCkIbv+dPH3Oj/CbbHxnd9GG1YbH?=
 =?us-ascii?Q?Asp9DIh6/MEUB7mAIgkJIwBv5jFG1x5jIF5IAtkq7P289rRdSqy7iqW5dbRy?=
 =?us-ascii?Q?XQqa+zkV4ZPeGT20mTHuEiynqg96q5xfpTzksbPUJiMPliJDDWXcav3MUfvA?=
 =?us-ascii?Q?0FODXpF3D4ELe3+eEuK+iOMylc8RKUCrhNQRQ7prXhSwWiMWVNCN+TIYxjJv?=
 =?us-ascii?Q?em3oE1LYBgf6kCI0V+PQvYgOCVhhVCsJtNv3r3sd9bkuc5pdDZOXv25UoZuy?=
 =?us-ascii?Q?CNHxWJkjMBh24Xu7uLNFi1X9xOdce9qDxhfn5t028O3eBbCa88qq/fNqQaV2?=
 =?us-ascii?Q?f8pTmSFMWVfCFDbG55jjseULK79bdVjI1lAWR6GGPRjA4b4TPGw/MOhQfN7V?=
 =?us-ascii?Q?6pGW5n4tFfYF1B+xNDkJ7ikRm8eVlFpRnYMvLgPU9PYU6cPAF272+PU8t/hC?=
 =?us-ascii?Q?WxZ4GHKIfsWvszE9kSxTQa2NVdNLghc2JZDXtow+eS5FHvl5RFQU8S6p2lfa?=
 =?us-ascii?Q?GGKXm536OmSft7pbCI4/TFjetiyvZlkM4FX2I511TNjjCNIVHiURHQi0a5hp?=
 =?us-ascii?Q?7pMDEl1nU/WzhaE+EW/+xTkH0pTgl00NLoqwKIrDoXoW3xA/xlCbcYjTWp+B?=
 =?us-ascii?Q?RnMG/doJXLLQxkCOidSHZc7DZ39QnbaJ4fEw5GwIc0ykPhpyKcTTOtzegkMT?=
 =?us-ascii?Q?Lr2zs7yzUnmS51bauF9VLNhKn5C+s0AjELaQpuyzKYLN33nq5IvVkISVlbAm?=
 =?us-ascii?Q?LWqPr5BFj6/4MCjfGRnHBQ+kni/nsluBGpcYkQmELNjx06dHxA+ofsJ/+4QF?=
 =?us-ascii?Q?fQtQgv9POSI5VqAwIpNu4V66u3NSiw8WjSo0ijDJWGmM+Trk3Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ftokXZQD9jiyHPhgg3bmJRjaM2LTFWT5sJGnYyMVK/B5xN7W5fjUNia7hSv3?=
 =?us-ascii?Q?xa8AYMOqw6IiYW7xkYwWiQzY5qIBW638IkWiuiB9HNbCpHX3DOvgQ65Tqd9k?=
 =?us-ascii?Q?Gli2r6TkQQXdyqHJjyf52x3yZU7UXFkLDjTAolD2LpdPSKQs/rnsiYl4FBhJ?=
 =?us-ascii?Q?ULiQ9A+hMbjxP+Zf7wtyVbYbXE/ClmVYKqjhx765N72AncC2BiFX6BaUWFcK?=
 =?us-ascii?Q?xZJ5Yf1Bo7Mfdoehjzy6Zx3C+FkkAD8VHsLmETZNlufyaULIMJJXlDvuBwzB?=
 =?us-ascii?Q?ATp1vdYTMTZ/wx+VvkLeNlJo/dJe6912ing944XQIumuxzUECuX8vU8TF8j8?=
 =?us-ascii?Q?HmE+a1PAivnMiEzd7Jvufd+TcfQ9wLLmyD5NCYQ3ohVJmAU3nXlXAHoPanSS?=
 =?us-ascii?Q?VDBip8vbWODPAbzH0Wm5UGvim7oGGOjWsK8W64K9yzmRb+SVs3XgaWPsThJn?=
 =?us-ascii?Q?VN8DZMbMNZv3mfzXQxAqRqc1MtRyTYSXsxtzHhknBplZEsImxlclfQuw17oB?=
 =?us-ascii?Q?Et/H6EhAEH9Ibq7tDBoQjfhcOs0CXtKDwI+D93jNnQ100ONLhOf5sY0aw2GF?=
 =?us-ascii?Q?F5RtHIwTRHuXo0dxyQo/j9xKJkQGppqSzvrBrHV/KmgqyZizFPeVEwHwZNvB?=
 =?us-ascii?Q?4DWakHLLdJ+IpRPnhi4JPKnMmUfkLEGo8NlkxDzndlyszBxoSJVv442iWw+t?=
 =?us-ascii?Q?5sFT2AXnsM3DjuDxnN0qZe07+AntwwZZVLdjhuG6b9EVT02JVEaiVNGjRTzH?=
 =?us-ascii?Q?LOuOiBBG2gBkFlUBpj/zWeHHql7v5jsYxRWhtc0XNxKRo8HfIPnXnAOQvLc/?=
 =?us-ascii?Q?GS2kptMpzIpbIa8sickNjbn2YRThhcP/9dtNsFatUORp4hOKMTDPhZpKOSpv?=
 =?us-ascii?Q?Ppd3NCGqqlcZa68OgqOjSUQtBAnT60gwA7PuMIBCMJjRz0rH39UV23jRRS2z?=
 =?us-ascii?Q?7OcI5DTKz1XcWURz9FSq3aj1Dd9JqI/cu89a40hrK4ygu02vi/4EdJsZsFz3?=
 =?us-ascii?Q?E9PfW1bVUJ4l57ClXu/5eWDUhfBPz68EGzY2vlDMyBi476unCWjP5SWY7N1b?=
 =?us-ascii?Q?8IZDqFT2hnMHV8gwd+XVtlieldyYyGP/Ns1SJdOMSGAm+qmD0hlQsyUaeOIg?=
 =?us-ascii?Q?jmXI6vlSo88TwPDyU6GDcUGpFzkkycxQn+CzDuVrPipSgBO/YuHIev0VD4RE?=
 =?us-ascii?Q?FxKH1RTbU8Jep4VSnRWjzd1fG2TR7l7VNnuU9npTU4YH5erk1MkqqMkU0/46?=
 =?us-ascii?Q?VvMVBMrsfOO7YI7PTGTzeXYqUDK0ii42oKtCNOieZ32YUkZRSvfjFp/2OEt1?=
 =?us-ascii?Q?wI0LC+VrWADthWsOnRoFVEJxd5yxSuy7teCrxIuagUnTRziua0ImdkQKDi1x?=
 =?us-ascii?Q?nzjf7RgpXwRt89ZJYNQW31LWGEsi/TNVg/5GrRI908411et01icC6yASJXGL?=
 =?us-ascii?Q?w5AzRsUi3ek5re3fTXZDnFQeIfoAMzSNmF2TdWuh6AvfTKlkG7dpMBlhwN1y?=
 =?us-ascii?Q?yy+GaZC1ZITzVhdCu+rHLEwDAy1OgVD+XOA28Z3yZlBSr/EdCQLAOPi8abmZ?=
 =?us-ascii?Q?1umgSuqxHTMr3CDOJrc/to1vti3CaEyY3npLI3pWgEZD7fw8LLvIzVwZ1pi3?=
 =?us-ascii?Q?EQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ff6b6a-8896-4c1b-a4ce-08dd3927035b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 07:49:48.1048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DDSu7VVD29li3QJkhpwLfJH5FpR9R64uFDj3XHxZJCb9jR89sIVK5iNMnMyNGPs4h+0FGff22tvGRRa3rs6IgJuZ0a53q76Ee36U57lkTPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4642
X-Proofpoint-ORIG-GUID: YgywEXdGi0vphsi0vzzGPvikXOB4UYVh
X-Proofpoint-GUID: YgywEXdGi0vphsi0vzzGPvikXOB4UYVh
X-Authority-Analysis: v=2.4 cv=TdtstQQh c=1 sm=1 tr=0 ts=678e001e cx=c_pps a=clyc6YhGvfCRRXf4btgSWw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=_Eqp4RXO4fwA:10 a=b7JCq0Q3AAAA:8
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=20KFwNOVAAAA:8 a=bAUgQ3DjsJl9ahxi_C4A:9 a=OeAogzt4mPoSVrmxIpBN:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 clxscore=1011 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501200064
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 07:50:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114961

From: Xiangyu Chen <xiangyu.chen@windriver.com>

According to crash help message, crash can decode the random address with
"--kaslr=auto". But it has a bug that when with "-S" in parameter, crash will
bypass the kaslr option.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta-oe/recipes-kernel/crash/crash.inc        |  1 +
 ...x-S-cannot-work-with-kaslr-detection.patch | 89 +++++++++++++++++++
 2 files changed, 90 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/crash/crash/0001-symbol-fix-S-cannot-work-with-kaslr-detection.patch

diff --git a/meta-oe/recipes-kernel/crash/crash.inc b/meta-oe/recipes-kernel/crash/crash.inc
index 04318b1505..c8c8518394 100644
--- a/meta-oe/recipes-kernel/crash/crash.inc
+++ b/meta-oe/recipes-kernel/crash/crash.inc
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/crash-utility/${BPN}.git;branch=master;protocol=http
            file://0001-cross_add_configure_option.patch \
            file://donnot-extract-gdb-during-do-compile.patch \
            file://gdb_build_jobs_and_not_write_crash_target.patch \
+           file://0001-symbol-fix-S-cannot-work-with-kaslr-detection.patch \
            "
 SRCREV = "a6832f608cb5d473739cf33bbf84ab1df8d98fd5"
 
diff --git a/meta-oe/recipes-kernel/crash/crash/0001-symbol-fix-S-cannot-work-with-kaslr-detection.patch b/meta-oe/recipes-kernel/crash/crash/0001-symbol-fix-S-cannot-work-with-kaslr-detection.patch
new file mode 100644
index 0000000000..47182f8b6c
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash/0001-symbol-fix-S-cannot-work-with-kaslr-detection.patch
@@ -0,0 +1,89 @@
+From 329bd56da28fc1b5b53a60ca2172643d2090435d Mon Sep 17 00:00:00 2001
+From: Tao Liu <ltao@redhat.com>
+Date: Fri, 13 Dec 2024 08:36:03 +0000
+Subject: [PATCH] symbol: fix -S cannot work with kaslr detection
+
+When kernel enabled the CONFIG_RANDOMIZE_BASE, crash needs to add "kaslr=auto"
+in crash command line to tell crash to decode the random address.
+But when with "-S" in command line, crash would bypass the kaslr option
+that cause symbol from kernel image is mismatch with ram on a live system.
+
+The fix is provided by Tao Liu <ltao@redhat.com> from crash-utility upstream,
+and not merged to crash master yet.
+
+Upstream-Status: Pending
+[https://lists.crash-utility.osci.io/archives/list/devel@lists.crash-utility.osci.io/thread/5OXNYPPU6GLLQKCWH7WBNBJXLNZ4EBZD/]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ symbols.c | 18 ++++++++++--------
+ 1 file changed, 10 insertions(+), 8 deletions(-)
+
+diff --git a/symbols.c b/symbols.c
+index a3cd0f3..6062d21 100644
+--- a/symbols.c
++++ b/symbols.c
+@@ -25,7 +25,7 @@
+ 
+ static void store_symbols(bfd *, int, void *, long, unsigned int);
+ static void store_sysmap_symbols(void);
+-static ulong relocate(ulong, char *, int);
++static ulong relocate(ulong, char *, int *);
+ static int relocate_force(ulong, char *);
+ static void kaslr_init(void);
+ static void strip_module_symbol_end(char *s);
+@@ -230,6 +230,7 @@ symtab_init(void)
+ 				DEBUGINFO_ERROR_MESSAGE1 :
+ 				DEBUGINFO_ERROR_MESSAGE2);
+ 		}
++		kt->flags |= RELOC_FORCE;
+ 		store_sysmap_symbols();
+ 		return;
+ 	} else if (LKCD_KERNTYPES())
+@@ -817,7 +818,7 @@ store_symbols(bfd *abfd, int dynamic, void *minisyms, long symcount,
+ 		    syminfo.type)) {
+ 			if (kt->flags & (RELOC_SET|RELOC_FORCE))
+ 				sp->value = relocate(syminfo.value,
+-					(char *)syminfo.name, !(first++));
++					(char *)syminfo.name, &first);
+ 			else
+ 				sp->value = syminfo.value;
+ 			sp->type = syminfo.type;
+@@ -893,9 +894,9 @@ store_sysmap_symbols(void)
+ 
+                 if (machdep->verify_symbol(name, syment.value, 
+ 		    syment.type)) {
+-			if (kt->flags & RELOC_SET)
++			if (kt->flags & (RELOC_SET|RELOC_FORCE))
+ 				sp->value = relocate(syment.value,
+-					syment.name, !(first++));
++					syment.name, &first);
+ 			else
+ 				sp->value = syment.value;
+                         sp->type = syment.type;
+@@ -924,7 +925,7 @@ store_sysmap_symbols(void)
+  *  are not as loaded into the kernel (not unity-mapped).
+  */
+ static ulong
+-relocate(ulong symval, char *symname, int first_symbol)
++relocate(ulong symval, char *symname, int *first_symbol)
+ {
+ 	if (XEN_HYPER_MODE()) {
+ 		kt->flags &= ~(RELOC_SET|RELOC_FORCE);
+@@ -937,9 +938,10 @@ relocate(ulong symval, char *symname, int first_symbol)
+ 		break;
+ 
+ 	case RELOC_FORCE:
+-		if (first_symbol && !relocate_force(symval, symname))
+-			kt->flags &= ~RELOC_FORCE;
+-		break;
++		if (!(*first_symbol) && relocate_force(symval, symname)) {
++			*first_symbol += 1;
++		}
++		return symval - kt->relocate;
+ 	}
+ 
+ 	if (machine_type("X86_64")) {
+-- 
+2.35.5
+
-- 
2.25.1


