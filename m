Return-Path: <libo.chen.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1F5CFC500
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:55:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.50480.1728896132437680152
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0017995f96=libo.chen.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49E5mvdT002940
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 01:55:31 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2042.outbound.protection.outlook.com [104.47.74.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 428jvtggp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 01:55:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+qwpIfNfjsGyiFu+9EvlA3DTcuetQAbuhPeEJNpBbKQ5fI9E2B3+uvpO94excT9qzsvRe5fRRdDaKzsRQyvsWFb/lCz7sGFQBGev5GlMlQniOmU/DQ2oyxj0FxZh0F8xqqj3gfKdz0T3nH25mdcPpesDSS23mdiaUirD1uzZ1XeksHNxNK8b15jXAdSFeaP8lazBK65xDnIHb546MZXiSztuj6R+n/GF4Bf+FqcD4/PZUCCk5MfdBh9bYwuJuXgqQWsf5fCTBGcmsCGZ4a2P7HngiUfGt89jppiP/Ht6pue3lO8YkW+bQK9ddVQI06ibD5x6tb4Zbq2z4wgGAZ0Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ldhiDyNA6Iof242tBEPu3s1NpRr10I7hhgNc/Q1hag=;
 b=X6HwS7/S4ZDfJvH6qxJM3WqpKzZuUVuLDnhKV8Nsc4FMPpyxOjTrF8wdjIPo+LzJ4UH39YZqiVGXJFhiyMrbLobvP2TL37qmsJCA1Qd0iufBbMO+e9VLst1onDH6RcSjxN5qJEtueBfcRyWAXVEoBF4rSrG1JBFVmozijaxgCEfri3T1/vEnALSRhsFrUk+8zskQNpRvXFukwlQ6EoPFfDenGTBJo92YPM6I3bmQ6HfKtly5udWqjmAoW+pnKd0sofRDHSO6I4zhov0M0isNrO5Y356+CsnEJsLh7aL76ocUkRYlcLcfhOe+EkANCHqLqepHyy3NfwbDmqVxAp+APw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB3152.namprd11.prod.outlook.com (2603:10b6:805:cd::19)
 by PH0PR11MB5111.namprd11.prod.outlook.com (2603:10b6:510:3c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 08:55:29 +0000
Received: from SN6PR11MB3152.namprd11.prod.outlook.com
 ([fe80::b311:7964:52a0:4174]) by SN6PR11MB3152.namprd11.prod.outlook.com
 ([fe80::b311:7964:52a0:4174%4]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 08:55:29 +0000
From: libo.chen.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta][kirkstone][patch] rt-tests: rt_bmark.py: fix TypeError
Date: Mon, 14 Oct 2024 16:55:14 +0800
Message-Id: <20241014085514.724667-1-libo.chen.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0228.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::24) To SN6PR11MB3152.namprd11.prod.outlook.com
 (2603:10b6:805:cd::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3152:EE_|PH0PR11MB5111:EE_
X-MS-Office365-Filtering-Correlation-Id: f2ec9906-444c-476c-ea7d-08dcec2df3e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bvYpi7+jNtDyd7B0OAiLQvVzwRKidfb3xJ2Tv+DjzRliS0jneVbvTXqlK/KM?=
 =?us-ascii?Q?lWBLEbtmx0VBmhyNZNthi6C+cCquPI1k01l1ci9njubaMp2UWG8KyzavfeDF?=
 =?us-ascii?Q?m3l7oa8U3tpY96igKS+eK/sR7Ho3HuvV5aVllAGMxZMD3JTzuBKbSMOZsPO3?=
 =?us-ascii?Q?ei88uOrwvziDTOXzQLPDUhyBQ2Tzlp/zgCKvi/2O8ILxaYK9u2LiLbyo+4PV?=
 =?us-ascii?Q?8T9wbpJv5nNlqOyGCHeRQMXbIoXOAnAmOB0m6hJrC98N9tFyNtlsnsVcmZC8?=
 =?us-ascii?Q?QYrGHL3fxYwEKOWNUXSe2DCZwRu0et5tD5CzPaCUe/aXaNCwGUDT7Qblgm4X?=
 =?us-ascii?Q?TDR1hNEbbiQod3eoQaGRHYgGGl18axJDFnEKwVWao6LNZuBBQZrbfF0fXJ+Z?=
 =?us-ascii?Q?wSghHQU4DmnOq67MVEoDBBq/j841YcagK/sMEXCPOD8TJ652CdgqKcLDTN9/?=
 =?us-ascii?Q?NbszvEc5ReiLEG1o4eNiq9Syb8FFIK0aOA9uP/WKPFPNh2OQAvTvrKCNmAVB?=
 =?us-ascii?Q?rHtJ3XSLMp4vfwaOiAq4ZZ+B2EIvjnobbWpew+0fS8IifooYrYiozGzQrGnP?=
 =?us-ascii?Q?aX7LEPQYXhLmpOY5VRhUzxJYK9i3XeK1eTCgGiezY3loqyqRa24jgssGR8Z3?=
 =?us-ascii?Q?DLLWsuNF451oYktQ3rGmLnls+7RymvRkT3yTejpagIWxg2XrSb+HXbQBOGVd?=
 =?us-ascii?Q?zkKr4NC9MT20fbuHrmYMNpDQU7GhL2NNpFeEX9FUbFBQAJchg27lGPCZZaMq?=
 =?us-ascii?Q?OWi1UbCsgwwHYXV0Ak6mx1vbXwASzTaJZCDuTcqffNQNllIfUVyKete+TLHn?=
 =?us-ascii?Q?J1WlyaaWIXuAeY07bITO9t5CQ6aCZy27xQcmD0Iwnw7wWDEa59s4mKUnm+4K?=
 =?us-ascii?Q?WEML0gNDUdBHDab24bGmfFxc38BbJLTlUMaQHaTs/XkS7+AYv/JDJOuLVLCV?=
 =?us-ascii?Q?3h9xrkGrrITC4kB04zoWA54a8xHdKaJf65R2Zkq2VPZpTwuvQCqeZmEMgHQE?=
 =?us-ascii?Q?hbGdOMi2zOdwJpu2wDz23guuKjTQNMckAOlJabQ6s17Jjs7k0m5hqhL8hzJz?=
 =?us-ascii?Q?sgGwpmw46GkC6caalkLZK9IVq96JES6X5QBBxx65Iv/V8cqyLgFbBDBvo6ZT?=
 =?us-ascii?Q?l4jAOZuDKNr016CKpe7ytNKRsP1FN4/kD5gQvovq0QZmxPgCktIvg8/TfL8Z?=
 =?us-ascii?Q?M3O1ZQ3U/IQmnov8+li+rO3dks5dv/yGySP/9NGRSN+xZHGYIhgWONUBez00?=
 =?us-ascii?Q?vXXi4Szo/3qLtBBfS/SU2SAPQEuLThFFvaJtrvZ9IM5UGcMHRKLredQxSy5+?=
 =?us-ascii?Q?dHbINuBab18jl/IqmX7XTNjOuyTgb+b+0QJfJiU/ehkxVQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ek42hv9sTlVSSmkr5mKY+r7gt+KMquZDkAhCrY08zDH9PBwH2T6RaFGToFc8?=
 =?us-ascii?Q?bWEA2T1D1sLllVKYfCvDIGrQ6aeYNoXOifTi+7+u8/gGvLq3h/DfFVqRRpUL?=
 =?us-ascii?Q?3LX2GKuMPyngSNz0nsCHOFiUo6ZTvSs/A+2gllibArdy7IP/xzLIjLJQ0Ia9?=
 =?us-ascii?Q?wNqFRN5RHwU3ZlDOuNdjXWr+88NQkB1jw2FWv9iz/0p5OUSJzfU24Rt0O4f3?=
 =?us-ascii?Q?UpVTbSlqyi3s2ciGXDoB8mxHpXTPDH26Lro5sOPkBI6GYXHiExq1mNNmqQ2u?=
 =?us-ascii?Q?FNoBKfsI3v4HnIuEEWjmy0yFoRWbromqLwpH+LlCf3m8eLzRnbhnn8xCeKI0?=
 =?us-ascii?Q?Gnf69z8bbZqHrVyW9PPw3Q3al34zLOde2jU3NPjm7BCkHHow6AOcm/1CxHgX?=
 =?us-ascii?Q?iP4V9CfoyPAY5CTlax+rOYHOM8bZr/txBDMLB0UAVGCan46+ugowKq2MScVw?=
 =?us-ascii?Q?OWtonaatzPBWT01qs8ABfOsamZOkbeUp3x/KXJlx75M4WsoSEgHPO4/b45HT?=
 =?us-ascii?Q?eqRrmGCUDLRNTPsEZCK4g2fHf1dxO0rMDWKtELfb5YHQyXDGv5OMZgRdyBWm?=
 =?us-ascii?Q?Ir3SN1zeWMCN3AllQj6EU00vGA81oxYQ4kmwonL3Q1xvsmd4XQ9TnPXgwl3E?=
 =?us-ascii?Q?rjShhMqYPg43gzgMtP0Du6K99OoiYVdKlXzAZuEFdBRX1kVaH86dYeENSZqQ?=
 =?us-ascii?Q?PFg6qGFqnLqnr7EvpZbUEZC5pufvMMYTbI65s/WbeqnYQUotvDBCGqUrThG9?=
 =?us-ascii?Q?L+uZK0YuxbCyLfQl7mzpteKdODqRfAVt1dTRGu+XhJ22HIietBhy609QpwjO?=
 =?us-ascii?Q?6nU+aQGkw3Qo0bTXFOK4ic2DqGkErdkX0Ux6CYJuVcO8t6LqtVadcC1qeDgA?=
 =?us-ascii?Q?zOp5ICBF2yG5eVoWaA1VEp1HvdTtkHlNj4n3gLruT0fGcrxOkTVmWvdBFKls?=
 =?us-ascii?Q?n0g89AhvAGxGTgol4T/w9A/samFSdh7t5sFkKQd8IMXO3xQbNSwE8nXS38JG?=
 =?us-ascii?Q?j+GUYOnRJlClwMymaTWuZWqLP6jW+SP24t9VUhLmxjdL4MGE3zYCb1YUAhpH?=
 =?us-ascii?Q?erlulANR4IixplFvBlAfkDFcYsJ8gSXfv5eAwHoxxWotVhmu3T2ZWW7eOe+g?=
 =?us-ascii?Q?OGWPiqfq7vnTcjqCJWS7QVTNqYGbqqrJIxgUZUoPTmQCEFMKTvkdMjYbXQJL?=
 =?us-ascii?Q?I57fmWRwITjs6zM7HTfuBu6EjAcHKWtIPR8s+KkoQS5c5SanRfzgx5gPxb7W?=
 =?us-ascii?Q?os6J35K8kab0NuGEleqvvqLXinpeKuZ9VZtLaNh88w6GLlgmDJ4O13Dd42ne?=
 =?us-ascii?Q?Tz2lCVqQ1aoaSicl34LxAX0gW1ypzUZ7ekE5qU7Rlysryf0lLtYlhpDyP7/t?=
 =?us-ascii?Q?fNBkApKL+/czR/I0JwkEtn8PDGiwaHHw+8cceYRZai4+aFo0YkjFl+pjydDV?=
 =?us-ascii?Q?APm7Gw4d6vna0Xmwj2rhd8kX9Pgi09KDDPh9KmygHtFyGECmsgQ1h9ZRuaIv?=
 =?us-ascii?Q?2mvWd7bmt+0H3J7lnmZdR7XZGlPEee5Cbjwk/dnZUTwlzHrXBCuvSY+QaT1E?=
 =?us-ascii?Q?M55hy/tewa8AmrWWDLd+mw6vXzKZ2dy6MTiJxvjMzG4tLWrXHWmfzjG9s+cU?=
 =?us-ascii?Q?mg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ec9906-444c-476c-ea7d-08dcec2df3e6
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 08:55:29.1764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1CpGKQl0T0LzCqYAQZkORdg/qJJXOT4Xgsxp0isyb1OPcglWkoHvRBgF2+RVO4cVgkhV2W30F7p3wZ9eqgvDmuwHyysPfXo1N1nTQkQPUKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5111
X-Authority-Analysis: v=2.4 cv=bIhEI++Z c=1 sm=1 tr=0 ts=670cdc83 cx=c_pps a=CZyBIZNk7+VlD+/eRBofeA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=V2T1AWeRghna1gjgFk8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: mgTInqXzWwcWZ0bwnjbujC-XI6yT4zqP
X-Proofpoint-GUID: mgTInqXzWwcWZ0bwnjbujC-XI6yT4zqP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-14_08,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 bulkscore=0 mlxlogscore=851 suspectscore=0 adultscore=0 impostorscore=0
 clxscore=1011 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410140065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112850

From: Libo Chen <libo.chen.cn@windriver.com>

Fix the following error:
    File "/usr/lib64/rt-tests/ptest/./rt_bmark.py", line 287, in run_cyclictest_once
    m = rex.search(line)
    TypeError: cannot use a string pattern on a bytes-like object

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
---
 meta/recipes-rt/rt-tests/files/rt_bmark.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-rt/rt-tests/files/rt_bmark.py b/meta/recipes-rt/rt-tests/files/rt_bmark.py
index 2a4eed412f..19a617f413 100755
--- a/meta/recipes-rt/rt-tests/files/rt_bmark.py
+++ b/meta/recipes-rt/rt-tests/files/rt_bmark.py
@@ -268,7 +268,7 @@ cmd = ("cyclictest",
 rex = re.compile(r"C:\s*(\d+).*Min:\s*(\d+).*Avg:\s*(\d+).*Max:\s*(\d+)")
 
 def run_cyclictest_once():
-        res = subprocess.check_output(cmd)
+        res = subprocess.check_output(cmd, encoding='utf-8')
 
         # minlist and maxlist are lists with the extremes for each core
         # avg_cnt is the sum of cycles for all cores
-- 
2.25.1


