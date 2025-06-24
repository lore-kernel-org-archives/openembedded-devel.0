Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D6EC7115B
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 03:06:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.264.1750734382735035239
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 20:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8270701add=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NNuYMQ022073
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 20:06:22 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2068.outbound.protection.outlook.com [40.107.96.68])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dv8mjb2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 20:06:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CzVSfliiPJHOBN/jYwQNoscvCYil7gECOfPoGaRAHPb7EbGePAfW6E0t7CmNnIpZUEZNMJQ12Z2wyjhy1dtWYv2Jt3XhPsqgdrEfY4E6WHfj39dH3e3c2Grvjw7QimE5qrmr1Pbpv9TWVzmZKpC9bPZWlgJ/VKlMo+Co9C37L1NzQai9h2vn3mcbqJL9VehtuRryNxIBBM3Tc6rA4ky4oja7SIEfUbufdjthqSAdY9X6nRkET4cXJzEk/eY5WOnGvyUNdcgAn6gkBHB4NJDGYkZTxb914TWg7DSxrR+FZ142GHWxz+pgo+Bl/dCONCkgDlSZmYD2kYAz6BrmD2eGHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZhGJEo56xF/+VpNttwfWAwBpILnam+10Z0ORCBmpKo=;
 b=pHo3OFXF+SGlK/vclfSMaz+wXHbryhU/KRcj/HPUp8m/ehTkGOJYaxsA2XTQBo5csk/oX9wz74spVm15VxTYkEtwDT3+n4I4s/O/1csQHfFyBrWkkF3/pca3LJ+zvnn5x21/gloNjpZeEZphF9Sh4pKectvVg9KhBgWtKnyWWLrBDSuYefzV5ICIEEX3QOz80vO7oJpP7k2z6AOAZQRSU2zYWmXXDy8U3xt1Ror0pddcg3r3RbWsnezhtl9vDFozjM4JsSrnis3uQGEI/esS8i9opew0TA3YtU4QPUxvfpTewTSffzjYX/yHdHwFHZO+KrFJE0rlA6wXzWBfyEP1CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SN7PR11MB7090.namprd11.prod.outlook.com (2603:10b6:806:299::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Tue, 24 Jun
 2025 03:06:18 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 03:06:17 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][scarthgap][PATCH 1/2] protobuf: upgrade from 4.25.3 to 4.25.8
Date: Tue, 24 Jun 2025 11:05:59 +0800
Message-Id: <20250624030600.986551-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KL1PR01CA0081.apcprd01.prod.exchangelabs.com
 (2603:1096:820:2::21) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SN7PR11MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: 61f2a204-f124-4d04-08d9-08ddb2cc150b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Y17B15FUHY7jmCsVxgP7R74WTjx5/ojDNggxgSR+y1tmDgd/yOACgcYKdB6C?=
 =?us-ascii?Q?yj0z8jRWvYrokROnKhd5o4TqW8eUgjUb3LQ/se6zDtCwiODApS3ka4V8OX5d?=
 =?us-ascii?Q?v5ZmNqS8wjDfx/GTTwk8eNGdFmlbCo7JG2AgyQGHlMan+i8nQYZ/CQQYBB1K?=
 =?us-ascii?Q?8+MP2pRdkieV2VtgZng8GjdMA8FWyPdeTj8N0uQztW88WoLsKu3LgjQkSjUP?=
 =?us-ascii?Q?ojdY/aU21gySy9OmA6hslDoyaus3ePbH11Uhwv05634Whr+AgaJvIVPCJ1+i?=
 =?us-ascii?Q?FC6Zata7CIOZ7etY0jfzalUzT6boodIpiy5RY5CxumutB+56G5qPn62VJLp3?=
 =?us-ascii?Q?+DIylrSJLOaWuOt7Z20be+T2ZmVdPVYNlE20sISMn/uSGKX0uXRIZCBCRlZn?=
 =?us-ascii?Q?7Om9Wktz9Yc/8ks3yXJeYYc8eD1LwtaFBf9Qx9vf9oAsbZEzuxsLlyzqF0ik?=
 =?us-ascii?Q?K/NhSE9hz85bEbFooCbqbaP93EALx3yZFb7qASP2zm7ggDR/JrK+7MhTwLAQ?=
 =?us-ascii?Q?9cWUBflDOOWLVufwwXcI0du7MjPN0uSDZaJJKJS91e2b/TIvLbVe0H/MhhsZ?=
 =?us-ascii?Q?P1iuRD520g8+shOIevcLkNMTIVlgz8GAa9D/QvRAojrmsigvWLnzAWQ/aNKL?=
 =?us-ascii?Q?bqiFwN7jTXFBkeEXyZzCVzmuR64YsQguXf3EN/zKxG17rSwPSXuqSDde98gT?=
 =?us-ascii?Q?16vLf91XJPt/sKYuFv05+WVl+UBzOGVBVfWRh75I+MzUEQ4ZIS25arb3SExb?=
 =?us-ascii?Q?F4xZKbJd5OCggh+eor9SpcL/egqtNIwBtt7QOQozH7JYzBqwVK5gdqQQqVIV?=
 =?us-ascii?Q?5UhYtnHhY41mzTotIHs3wlnfOn1EH/3ip/9w208thpwbt3c6bfrxm+ZIGOnr?=
 =?us-ascii?Q?l2WpwtCXbZtsJo2g0WdcOWsQSQD9ViX0/JnxAR9BQIjeJYGXNmn+1asI58xB?=
 =?us-ascii?Q?59F5JDRuWHHIq6jOzYxIPqYka+94eQiy+7Fo83a8eniqyoT8HLNjKhKaknAr?=
 =?us-ascii?Q?lYPwDqq2445fm1KcHU31BU0Ix17q4kKIqE7fUk+A083y3EmjJXLm4vvqQucq?=
 =?us-ascii?Q?8tNhHpEhyKgb0RZIpXHhAoeJZooHcYYsiIYUeln7ClJFr6GuH+f/Pan6Iq8v?=
 =?us-ascii?Q?pvP4/vOJxhUVkSrPSqz4AaGihxUZp9xz+EwLfgpLPV692pSHti5S5jC3Daxj?=
 =?us-ascii?Q?KDtYIxwedmVdTheiWGuXIjsoin+NvbSfa1Q3Ydj6vKt0idxFMqut7GTN3Olh?=
 =?us-ascii?Q?uLHyw4gg51gGDbvGOvKUFS1A/c3Z6X0iaL1RjEC1S0vgc5TKymQ2NmVQTFIl?=
 =?us-ascii?Q?QC3kkCRUkCShi8pyS7zaXmAmy2ayCVz+5AYxFc4gP2olrpAy96G6wW2sF1NM?=
 =?us-ascii?Q?xuu0EXfHhzvVHT7K07xGQDEApYgCHxo69NiG+RKxznVM14LImskt+lGRMiWf?=
 =?us-ascii?Q?5pKPayjqyPCBZedOfQ6GsEq+dBOB6QMtJiSSA9FXZpplavKmgRqN4A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qB0j+xtpcSE8JDNpA6hVtxx59ButmObZDpOMoxJmDmJpatHobcINakWRfKwR?=
 =?us-ascii?Q?B/GSeuUVZRHmw3p/PjZvkrD6E2ups0zy6F2aSqxNRVGohPEc852WWOjIB+lQ?=
 =?us-ascii?Q?m+CWIZneCFmSPZSOusEtQgcwKg/jmlTUAl27GDay+wkX51SDubs3p3P/vhqe?=
 =?us-ascii?Q?YHdtHLKOk+jf+gkG4H1xZYJmDLHhOPrgmVXMPGJnv5sInsZLK2xiCzlShnxy?=
 =?us-ascii?Q?Yl0+CGSXNl0Iynx06+bntzAMuCqs0rws8Xq7YUln2x6d00afHG3Ls+l3Lwal?=
 =?us-ascii?Q?x0mzs4PK2tkeRV87eCD0TwhBLmM0f7ktPxayZSk0y/KHd3CzL2ylhuXfOLUE?=
 =?us-ascii?Q?/p8YZX+/oDzkuGLg6RRoJqvI7Zubg5W40TkfA+6dL3pGJ4aHIGLCfiwMETwJ?=
 =?us-ascii?Q?whpKqwklF/28yUFT9v25Tvz+dDf0Hc67+pWRRqyRCZRyqowDNhgDOaN5IAhM?=
 =?us-ascii?Q?v0nTozD1Tv1E6ANezWsv5zujut5rxxtD6yioVLM7n9Be1EqSInCDA51qWT8H?=
 =?us-ascii?Q?jaYHOzqiI4ro2qhJwwf00trxiYp99pTyk9Cp0vOQ3GG8J/zYNc9/WOFUgm5W?=
 =?us-ascii?Q?gzBHUjl/y0L6YR4DdepChR1v4kPUzNDa6dCiiYDttBgK9s2rwz4Ntx+Q3BnM?=
 =?us-ascii?Q?EYVlJXRGxI+T9IMiXp/GTPFYE4yLjn5uemib5fS2RprjAQ7oCcxHeQfpTnAP?=
 =?us-ascii?Q?Pd4Cw9nBnxWDmL1kYuMvYthtHyZ86vXMsU04SVcIU2OhoCnGFo1FJHh6bYzo?=
 =?us-ascii?Q?aR2AWwxr0/QpJpS6UuXldheJfyKH8mVUFrudXya6MUp14W8vjHV+86M0Mae0?=
 =?us-ascii?Q?FrvsNkPLngLFQZiECiikdETC2F+xiKnX9Fi+pkEho5+iYpw/PIQjHCmGPojh?=
 =?us-ascii?Q?fqnpT/At0xSTVRlNQu4pbzIRVUS7ODeVNAKAn/18wEXdfl3TGfpH5098g/6N?=
 =?us-ascii?Q?PGwaoQyT1cul+cu2jngzdhGJBKmCWAV4TOlJ19f18h3L233uW4fZw78UyzTJ?=
 =?us-ascii?Q?dVoV8i8MwLABtbY1pCAWf15WtYR9k252wwUu4kvS0QEZYapfSn0RCcrrFmze?=
 =?us-ascii?Q?srhGtOsHAOMp6GCfUD6cKnebmIc/d1P9N/VLZgcjO9CHMe2SRWC5Avoy9J7p?=
 =?us-ascii?Q?qH82Jfn98Gykp3YIpLgySDcs2YT71Hh3v83I6ufRZFoq4EzCRCAYyeV7iAfF?=
 =?us-ascii?Q?mvIgX61o+7UKkNtGTLILYhlgcR5op2L/Mhvzldi2HjfI3ILu4tEftKFEu5Mi?=
 =?us-ascii?Q?lY/rZZrf2pQCeJsFR5iDiH9fCFBIwBgvW0rNHp6+nWXDouTPPLNVzixJpF5c?=
 =?us-ascii?Q?voZ3xsfeFMubwNnEqlY8ixxdjZ5/uqUo0/qqDVZ0j0tt6Mz8+UvOL8Y5HFJM?=
 =?us-ascii?Q?EephzCrnoxOrHEtekMcsihuKi5eJ2NHGZ5AM1rG8CKVlTzJ+/SFM2s0lycXI?=
 =?us-ascii?Q?9ccIM33Ni5JpSBz/LtvQ+r3ozHC7ik1U7DNuY4Ma4Bj+vPyVic+VY++ZhQQ2?=
 =?us-ascii?Q?yzGjQsY7dR5veBBrSIlhhDczc2y7POiubtCNhYISIbyygnZE2qvkyK/J3nbv?=
 =?us-ascii?Q?8+Ib7iXshu/f3hypxVgGM3r6dZHnVCbDaacCeiWp?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f2a204-f124-4d04-08d9-08ddb2cc150b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 03:06:16.8347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0sTwJ59IKDMIzG3GU4pwboEpLHAKIIUkPa4rXUcqcm52cgRqmj+o/Obk72l4YEybucTzaJgRHfd8MOga4zNa2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7090
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDAyNSBTYWx0ZWRfX576syT799ec2 IXZW07RUH25aaOqoVgDwKzA+LsyLNSbAxKaWRlSvfBkTnuqt7px0oRPFaApLCgYj3hkntBMBi1A TlkBWvZxOC25Mc2anL4eRo05T/7sR7B+HCV+ZFtnHe+OnHQInDNVzQFYCbDsireAYzSpjM2YZqY
 1yrEgEanu6mkVLM1cPGslfHBAyZT3JImJ4BIrVRZ4U7yyTomHsthhgKIEIikOiMXQy6tfjgw/wv BCbd6Z6v8gUIBifW+rBMy7rDVvi4jvdXjTo7L9fcYEr4kT/Nn71OFtZKjK8B7SARh/YReeb3jHy wma4q1EnAyHeCN1u+UVLA0BTOB/oYzPFXPrW1Cq4m8sbEleVxybS16D5WZqs/tr/FFVhp63Vy/B
 3UwjnxvmPXD+qFN+HIutYdRzKVrUN6dPZu6WZx+hLkfq/OqBHz2+jWUsJreAHFKF2StkCAM1
X-Authority-Analysis: v=2.4 cv=MeNsu4/f c=1 sm=1 tr=0 ts=685a162d cx=c_pps a=DAnEN4zbyIEUnuRlQkh4pQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=1XWaLZrsAAAA:8 a=NEAV23lmAAAA:8 a=p-hzNQkk9tjQgA2UY3EA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: lBwVS2wZOuyPDCwoqardWiLK60BKOLy7
X-Proofpoint-ORIG-GUID: lBwVS2wZOuyPDCwoqardWiLK60BKOLy7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506240025
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Jun 2025 03:06:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118093

From: Chen Qi <Qi.Chen@windriver.com>

0001-Add-recursion-check-when-parsing-unknown-fields-in-J.patch is
dropped because it has been in new version.

This upgrade also fixes CVE-2025-4565. The fix commit is as below:

  d31100c91 Manually backport recursion limit enforcement to 25.x

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...eck-when-parsing-unknown-fields-in-J.patch | 794 ------------------
 ...{protobuf_4.25.3.bb => protobuf_4.25.8.bb} |   3 +-
 2 files changed, 1 insertion(+), 796 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-Add-recursion-check-when-parsing-unknown-fields-in-J.patch
 rename meta-oe/recipes-devtools/protobuf/{protobuf_4.25.3.bb => protobuf_4.25.8.bb} (97%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Add-recursion-check-when-parsing-unknown-fields-in-J.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Add-recursion-check-when-parsing-unknown-fields-in-J.patch
deleted file mode 100644
index 2f14620b4a..0000000000
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Add-recursion-check-when-parsing-unknown-fields-in-J.patch
+++ /dev/null
@@ -1,794 +0,0 @@
-From 9f182ae260cc60e8cc5417abbe9481821642afa0 Mon Sep 17 00:00:00 2001
-From: Protobuf Team Bot <protobuf-github-bot@google.com>
-Date: Tue, 17 Sep 2024 12:03:36 -0700
-Subject: [PATCH] Add recursion check when parsing unknown fields in Java.
-
-PiperOrigin-RevId: 675657198
-
-CVE: CVE-2024-7254
-
-Upstream-Status: Backport [ac9fb5b4c71b0dd80985b27684e265d1f03abf46]
-
-The original patch is adjusted to fit for the current version.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- .../com/google/protobuf/ArrayDecoders.java    |  28 +++
- .../com/google/protobuf/CodedInputStream.java |  72 +++++-
- .../com/google/protobuf/MessageSchema.java    |   9 +-
- .../com/google/protobuf/MessageSetSchema.java |   2 +-
- .../google/protobuf/UnknownFieldSchema.java   |  28 ++-
- .../google/protobuf/CodedInputStreamTest.java | 159 ++++++++++++
- .../java/com/google/protobuf/LiteTest.java    | 232 ++++++++++++++++++
- 7 files changed, 514 insertions(+), 16 deletions(-)
-
-diff --git a/java/core/src/main/java/com/google/protobuf/ArrayDecoders.java b/java/core/src/main/java/com/google/protobuf/ArrayDecoders.java
-index f3241de50..0f3d7de0d 100644
---- a/java/core/src/main/java/com/google/protobuf/ArrayDecoders.java
-+++ b/java/core/src/main/java/com/google/protobuf/ArrayDecoders.java
-@@ -26,6 +26,10 @@ final class ArrayDecoders {
- 
-   private ArrayDecoders() {
-   }
-+  static final int DEFAULT_RECURSION_LIMIT = 100;
-+
-+  @SuppressWarnings("NonFinalStaticField")
-+  private static volatile int recursionLimit = DEFAULT_RECURSION_LIMIT;
- 
-   /**
-    * A helper used to return multiple values in a Java function. Java doesn't natively support
-@@ -38,6 +42,7 @@ final class ArrayDecoders {
-     public long long1;
-     public Object object1;
-     public final ExtensionRegistryLite extensionRegistry;
-+    public int recursionDepth;
- 
-     Registers() {
-       this.extensionRegistry = ExtensionRegistryLite.getEmptyRegistry();
-@@ -245,7 +250,10 @@ final class ArrayDecoders {
-     if (length < 0 || length > limit - position) {
-       throw InvalidProtocolBufferException.truncatedMessage();
-     }
-+    registers.recursionDepth++;
-+    checkRecursionLimit(registers.recursionDepth);
-     schema.mergeFrom(msg, data, position, position + length, registers);
-+    registers.recursionDepth--;
-     registers.object1 = msg;
-     return position + length;
-   }
-@@ -263,8 +271,11 @@ final class ArrayDecoders {
-     // A group field must has a MessageSchema (the only other subclass of Schema is MessageSetSchema
-     // and it can't be used in group fields).
-     final MessageSchema messageSchema = (MessageSchema) schema;
-+    registers.recursionDepth++;
-+    checkRecursionLimit(registers.recursionDepth);
-     final int endPosition =
-         messageSchema.parseMessage(msg, data, position, limit, endGroup, registers);
-+    registers.recursionDepth--;
-     registers.object1 = msg;
-     return endPosition;
-   }
-@@ -1025,6 +1036,8 @@ final class ArrayDecoders {
-         final UnknownFieldSetLite child = UnknownFieldSetLite.newInstance();
-         final int endGroup = (tag & ~0x7) | WireFormat.WIRETYPE_END_GROUP;
-         int lastTag = 0;
-+        registers.recursionDepth++;
-+        checkRecursionLimit(registers.recursionDepth);
-         while (position < limit) {
-           position = decodeVarint32(data, position, registers);
-           lastTag = registers.int1;
-@@ -1033,6 +1046,7 @@ final class ArrayDecoders {
-           }
-           position = decodeUnknownField(lastTag, data, position, limit, child, registers);
-         }
-+        registers.recursionDepth--;
-         if (position > limit || lastTag != endGroup) {
-           throw InvalidProtocolBufferException.parseFailure();
-         }
-@@ -1079,4 +1093,18 @@ final class ArrayDecoders {
-         throw InvalidProtocolBufferException.invalidTag();
-     }
-   }
-+
-+  /**
-+   * Set the maximum recursion limit that ArrayDecoders will allow. An exception will be thrown if
-+   * the depth of the message exceeds this limit.
-+   */
-+  public static void setRecursionLimit(int limit) {
-+    recursionLimit = limit;
-+  }
-+
-+  private static void checkRecursionLimit(int depth) throws InvalidProtocolBufferException {
-+    if (depth >= recursionLimit) {
-+      throw InvalidProtocolBufferException.recursionLimitExceeded();
-+    }
-+  }
- }
-diff --git a/java/core/src/main/java/com/google/protobuf/CodedInputStream.java b/java/core/src/main/java/com/google/protobuf/CodedInputStream.java
-index 8f1ac736d..29256b4b3 100644
---- a/java/core/src/main/java/com/google/protobuf/CodedInputStream.java
-+++ b/java/core/src/main/java/com/google/protobuf/CodedInputStream.java
-@@ -703,7 +703,14 @@ public abstract class CodedInputStream {
-     public void skipMessage() throws IOException {
-       while (true) {
-         final int tag = readTag();
--        if (tag == 0 || !skipField(tag)) {
-+	if (tag == 0) {
-+	    return;
-+	}
-+	checkRecursionLimit();
-+	++recursionDepth;
-+	boolean fieldSkipped = skipField(tag);
-+	--recursionDepth;
-+        if (!fieldSkipped) {
-           return;
-         }
-       }
-@@ -713,7 +720,14 @@ public abstract class CodedInputStream {
-     public void skipMessage(CodedOutputStream output) throws IOException {
-       while (true) {
-         final int tag = readTag();
--        if (tag == 0 || !skipField(tag, output)) {
-+	if (tag == 0) {
-+	    return;
-+	}
-+	checkRecursionLimit();
-+	++recursionDepth;
-+	boolean fieldSkipped = skipField(tag, output);
-+	--recursionDepth;
-+        if (!fieldSkipped) {
-           return;
-         }
-       }
-@@ -1415,7 +1429,14 @@ public abstract class CodedInputStream {
-     public void skipMessage() throws IOException {
-       while (true) {
-         final int tag = readTag();
--        if (tag == 0 || !skipField(tag)) {
-+	if (tag == 0) {
-+	    return;
-+	}
-+	checkRecursionLimit();
-+	++recursionDepth;
-+	boolean fieldSkipped = skipField(tag);
-+	--recursionDepth;
-+        if (!fieldSkipped) {
-           return;
-         }
-       }
-@@ -1425,7 +1446,14 @@ public abstract class CodedInputStream {
-     public void skipMessage(CodedOutputStream output) throws IOException {
-       while (true) {
-         final int tag = readTag();
--        if (tag == 0 || !skipField(tag, output)) {
-+	if (tag == 0) {
-+	    return;
-+	}
-+	checkRecursionLimit();
-+	++recursionDepth;
-+	boolean fieldSkipped = skipField(tag, output);
-+	--recursionDepth;
-+        if (!fieldSkipped) {
-           return;
-         }
-       }
-@@ -2180,7 +2208,14 @@ public abstract class CodedInputStream {
-     public void skipMessage() throws IOException {
-       while (true) {
-         final int tag = readTag();
--        if (tag == 0 || !skipField(tag)) {
-+	if (tag == 0) {
-+	    return;
-+	}
-+	checkRecursionLimit();
-+	++recursionDepth;
-+	boolean fieldSkipped = skipField(tag);
-+	--recursionDepth;
-+        if (!fieldSkipped) {
-           return;
-         }
-       }
-@@ -2190,7 +2225,14 @@ public abstract class CodedInputStream {
-     public void skipMessage(CodedOutputStream output) throws IOException {
-       while (true) {
-         final int tag = readTag();
--        if (tag == 0 || !skipField(tag, output)) {
-+	if (tag == 0) {
-+	    return;
-+	}
-+	checkRecursionLimit();
-+	++recursionDepth;
-+	boolean fieldSkipped = skipField(tag, output);
-+	--recursionDepth;
-+        if (!fieldSkipped) {
-           return;
-         }
-       }
-@@ -3298,7 +3340,14 @@ public abstract class CodedInputStream {
-     public void skipMessage() throws IOException {
-       while (true) {
-         final int tag = readTag();
--        if (tag == 0 || !skipField(tag)) {
-+	if (tag == 0) {
-+	    return;
-+	}
-+	checkRecursionLimit();
-+	++recursionDepth;
-+	boolean fieldSkipped = skipField(tag);
-+	--recursionDepth;
-+        if (!fieldSkipped) {
-           return;
-         }
-       }
-@@ -3308,7 +3357,14 @@ public abstract class CodedInputStream {
-     public void skipMessage(CodedOutputStream output) throws IOException {
-       while (true) {
-         final int tag = readTag();
--        if (tag == 0 || !skipField(tag, output)) {
-+	if (tag == 0) {
-+	    return;
-+	}
-+	checkRecursionLimit();
-+	++recursionDepth;
-+	boolean fieldSkipped = skipField(tag, output);
-+	--recursionDepth;
-+        if (!fieldSkipped) {
-           return;
-         }
-       }
-diff --git a/java/core/src/main/java/com/google/protobuf/MessageSchema.java b/java/core/src/main/java/com/google/protobuf/MessageSchema.java
-index de3890f70..5ad6762b0 100644
---- a/java/core/src/main/java/com/google/protobuf/MessageSchema.java
-+++ b/java/core/src/main/java/com/google/protobuf/MessageSchema.java
-@@ -3006,7 +3006,8 @@ final class MessageSchema<T> implements Schema<T> {
-               unknownFields = unknownFieldSchema.getBuilderFromMessage(message);
-             }
-             // Unknown field.
--            if (unknownFieldSchema.mergeOneFieldFrom(unknownFields, reader)) {
-+            if (unknownFieldSchema.mergeOneFieldFrom(
-+                unknownFields, reader, /* currentDepth= */ 0)) {
-               continue;
-             }
-           }
-@@ -3381,7 +3382,8 @@ final class MessageSchema<T> implements Schema<T> {
-               if (unknownFields == null) {
-                 unknownFields = unknownFieldSchema.getBuilderFromMessage(message);
-               }
--              if (!unknownFieldSchema.mergeOneFieldFrom(unknownFields, reader)) {
-+              if (!unknownFieldSchema.mergeOneFieldFrom(
-+                  unknownFields, reader, /* currentDepth= */ 0)) {
-                 return;
-               }
-               break;
-@@ -3397,7 +3399,8 @@ final class MessageSchema<T> implements Schema<T> {
-             if (unknownFields == null) {
-               unknownFields = unknownFieldSchema.getBuilderFromMessage(message);
-             }
--            if (!unknownFieldSchema.mergeOneFieldFrom(unknownFields, reader)) {
-+            if (!unknownFieldSchema.mergeOneFieldFrom(
-+                unknownFields, reader, /* currentDepth= */ 0)) {
-               return;
-             }
-           }
-diff --git a/java/core/src/main/java/com/google/protobuf/MessageSetSchema.java b/java/core/src/main/java/com/google/protobuf/MessageSetSchema.java
-index eec3acd35..ec37d41f9 100644
---- a/java/core/src/main/java/com/google/protobuf/MessageSetSchema.java
-+++ b/java/core/src/main/java/com/google/protobuf/MessageSetSchema.java
-@@ -278,7 +278,7 @@ final class MessageSetSchema<T> implements Schema<T> {
-               reader, extension, extensionRegistry, extensions);
-           return true;
-         } else {
--          return unknownFieldSchema.mergeOneFieldFrom(unknownFields, reader);
-+          return unknownFieldSchema.mergeOneFieldFrom(unknownFields, reader, /* currentDepth= */ 0);
-         }
-       } else {
-         return reader.skipField();
-diff --git a/java/core/src/main/java/com/google/protobuf/UnknownFieldSchema.java b/java/core/src/main/java/com/google/protobuf/UnknownFieldSchema.java
-index c4ec645bf..0cdecd30e 100644
---- a/java/core/src/main/java/com/google/protobuf/UnknownFieldSchema.java
-+++ b/java/core/src/main/java/com/google/protobuf/UnknownFieldSchema.java
-@@ -13,6 +13,11 @@ import java.io.IOException;
- @CheckReturnValue
- abstract class UnknownFieldSchema<T, B> {
- 
-+  static final int DEFAULT_RECURSION_LIMIT = 100;
-+
-+  @SuppressWarnings("NonFinalStaticField")
-+  private static volatile int recursionLimit = DEFAULT_RECURSION_LIMIT;
-+
-   /** Whether unknown fields should be dropped. */
-   abstract boolean shouldDiscardUnknownFields(Reader reader);
- 
-@@ -56,7 +61,8 @@ abstract class UnknownFieldSchema<T, B> {
-   abstract void makeImmutable(Object message);
- 
-   /** Merges one field into the unknown fields. */
--  final boolean mergeOneFieldFrom(B unknownFields, Reader reader) throws IOException {
-+  final boolean mergeOneFieldFrom(B unknownFields, Reader reader, int currentDepth)
-+      throws IOException {
-     int tag = reader.getTag();
-     int fieldNumber = WireFormat.getTagFieldNumber(tag);
-     switch (WireFormat.getTagWireType(tag)) {
-@@ -75,7 +81,12 @@ abstract class UnknownFieldSchema<T, B> {
-       case WireFormat.WIRETYPE_START_GROUP:
-         final B subFields = newBuilder();
-         int endGroupTag = WireFormat.makeTag(fieldNumber, WireFormat.WIRETYPE_END_GROUP);
--        mergeFrom(subFields, reader);
-+        currentDepth++;
-+        if (currentDepth >= recursionLimit) {
-+          throw InvalidProtocolBufferException.recursionLimitExceeded();
-+        }
-+        mergeFrom(subFields, reader, currentDepth);
-+        currentDepth--;
-         if (endGroupTag != reader.getTag()) {
-           throw InvalidProtocolBufferException.invalidEndTag();
-         }
-@@ -88,10 +99,11 @@ abstract class UnknownFieldSchema<T, B> {
-     }
-   }
- 
--  final void mergeFrom(B unknownFields, Reader reader) throws IOException {
-+  final void mergeFrom(B unknownFields, Reader reader, int currentDepth)
-+      throws IOException {
-     while (true) {
-       if (reader.getFieldNumber() == Reader.READ_DONE
--          || !mergeOneFieldFrom(unknownFields, reader)) {
-+          || !mergeOneFieldFrom(unknownFields, reader, currentDepth)) {
-         break;
-       }
-     }
-@@ -108,4 +120,12 @@ abstract class UnknownFieldSchema<T, B> {
-   abstract int getSerializedSizeAsMessageSet(T message);
- 
-   abstract int getSerializedSize(T unknowns);
-+
-+  /**
-+   * Set the maximum recursion limit that ArrayDecoders will allow. An exception will be thrown if
-+   * the depth of the message exceeds this limit.
-+   */
-+  public void setRecursionLimit(int limit) {
-+    recursionLimit = limit;
-+  }
- }
-diff --git a/java/core/src/test/java/com/google/protobuf/CodedInputStreamTest.java b/java/core/src/test/java/com/google/protobuf/CodedInputStreamTest.java
-index 2de3273e3..19a6b669d 100644
---- a/java/core/src/test/java/com/google/protobuf/CodedInputStreamTest.java
-+++ b/java/core/src/test/java/com/google/protobuf/CodedInputStreamTest.java
-@@ -10,6 +10,10 @@ package com.google.protobuf;
- import static com.google.common.truth.Truth.assertThat;
- import static com.google.common.truth.Truth.assertWithMessage;
- import static org.junit.Assert.assertArrayEquals;
-+import static org.junit.Assert.assertThrows;
-+
-+import com.google.common.primitives.Bytes;
-+import map_test.MapTestProto.MapContainer;
- import protobuf_unittest.UnittestProto.BoolMessage;
- import protobuf_unittest.UnittestProto.Int32Message;
- import protobuf_unittest.UnittestProto.Int64Message;
-@@ -34,6 +38,13 @@ public class CodedInputStreamTest {
- 
-   private static final int DEFAULT_BLOCK_SIZE = 4096;
- 
-+  private static final int GROUP_TAP = WireFormat.makeTag(3, WireFormat.WIRETYPE_START_GROUP);
-+
-+  private static final byte[] NESTING_SGROUP = generateSGroupTags();
-+
-+  private static final byte[] NESTING_SGROUP_WITH_INITIAL_BYTES = generateSGroupTagsForMapField();
-+
-+
-   private enum InputType {
-     ARRAY {
-       @Override
-@@ -116,6 +127,17 @@ public class CodedInputStreamTest {
-     return bytes;
-   }
- 
-+  private static byte[] generateSGroupTags() {
-+    byte[] bytes = new byte[100000];
-+    Arrays.fill(bytes, (byte) GROUP_TAP);
-+    return bytes;
-+  }
-+
-+  private static byte[] generateSGroupTagsForMapField() {
-+    byte[] initialBytes = {18, 1, 75, 26, (byte) 198, (byte) 154, 12};
-+    return Bytes.concat(initialBytes, NESTING_SGROUP);
-+  }
-+
-   /**
-    * An InputStream which limits the number of bytes it reads at a time. We use this to make sure
-    * that CodedInputStream doesn't screw up when reading in small blocks.
-@@ -659,6 +681,143 @@ public class CodedInputStreamTest {
-     }
-   }
- 
-+  @Test
-+  public void testMaliciousRecursion_unknownFields() throws Exception {
-+    Throwable thrown =
-+        assertThrows(
-+            InvalidProtocolBufferException.class,
-+            () -> TestRecursiveMessage.parseFrom(NESTING_SGROUP));
-+
-+    assertThat(thrown).hasMessageThat().contains("Protocol message had too many levels of nesting");
-+  }
-+
-+  @Test
-+  public void testMaliciousRecursion_skippingUnknownField() throws Exception {
-+    Throwable thrown =
-+        assertThrows(
-+            InvalidProtocolBufferException.class,
-+            () ->
-+                DiscardUnknownFieldsParser.wrap(TestRecursiveMessage.parser())
-+                    .parseFrom(NESTING_SGROUP));
-+
-+    assertThat(thrown).hasMessageThat().contains("Protocol message had too many levels of nesting");
-+  }
-+
-+  @Test
-+  public void testMaliciousSGroupTagsWithMapField_fromInputStream() throws Exception {
-+    Throwable parseFromThrown =
-+        assertThrows(
-+            InvalidProtocolBufferException.class,
-+            () ->
-+                MapContainer.parseFrom(
-+                    new ByteArrayInputStream(NESTING_SGROUP_WITH_INITIAL_BYTES)));
-+    Throwable mergeFromThrown =
-+        assertThrows(
-+            InvalidProtocolBufferException.class,
-+            () ->
-+                MapContainer.newBuilder()
-+                    .mergeFrom(new ByteArrayInputStream(NESTING_SGROUP_WITH_INITIAL_BYTES)));
-+
-+    assertThat(parseFromThrown)
-+        .hasMessageThat()
-+        .contains("Protocol message had too many levels of nesting");
-+    assertThat(mergeFromThrown)
-+        .hasMessageThat()
-+        .contains("Protocol message had too many levels of nesting");
-+  }
-+
-+  @Test
-+  public void testMaliciousSGroupTags_inputStream_skipMessage() throws Exception {
-+    ByteArrayInputStream inputSteam = new ByteArrayInputStream(NESTING_SGROUP);
-+    CodedInputStream input = CodedInputStream.newInstance(inputSteam);
-+    CodedOutputStream output = CodedOutputStream.newInstance(new byte[NESTING_SGROUP.length]);
-+
-+    Throwable thrown = assertThrows(InvalidProtocolBufferException.class, input::skipMessage);
-+    Throwable thrown2 =
-+        assertThrows(InvalidProtocolBufferException.class, () -> input.skipMessage(output));
-+
-+    assertThat(thrown).hasMessageThat().contains("Protocol message had too many levels of nesting");
-+    assertThat(thrown2)
-+        .hasMessageThat()
-+        .contains("Protocol message had too many levels of nesting");
-+  }
-+
-+  @Test
-+  public void testMaliciousSGroupTagsWithMapField_fromByteArray() throws Exception {
-+    Throwable parseFromThrown =
-+        assertThrows(
-+            InvalidProtocolBufferException.class,
-+            () -> MapContainer.parseFrom(NESTING_SGROUP_WITH_INITIAL_BYTES));
-+    Throwable mergeFromThrown =
-+        assertThrows(
-+            InvalidProtocolBufferException.class,
-+            () -> MapContainer.newBuilder().mergeFrom(NESTING_SGROUP_WITH_INITIAL_BYTES));
-+
-+    assertThat(parseFromThrown)
-+        .hasMessageThat()
-+        .contains("the input ended unexpectedly in the middle of a field");
-+    assertThat(mergeFromThrown)
-+        .hasMessageThat()
-+        .contains("the input ended unexpectedly in the middle of a field");
-+  }
-+
-+  @Test
-+  public void testMaliciousSGroupTags_arrayDecoder_skipMessage() throws Exception {
-+    CodedInputStream input = CodedInputStream.newInstance(NESTING_SGROUP);
-+    CodedOutputStream output = CodedOutputStream.newInstance(new byte[NESTING_SGROUP.length]);
-+
-+    Throwable thrown = assertThrows(InvalidProtocolBufferException.class, input::skipMessage);
-+    Throwable thrown2 =
-+        assertThrows(InvalidProtocolBufferException.class, () -> input.skipMessage(output));
-+
-+    assertThat(thrown).hasMessageThat().contains("Protocol message had too many levels of nesting");
-+    assertThat(thrown2)
-+        .hasMessageThat()
-+        .contains("Protocol message had too many levels of nesting");
-+  }
-+
-+  @Test
-+  public void testMaliciousSGroupTagsWithMapField_fromByteBuffer() throws Exception {
-+    Throwable thrown =
-+        assertThrows(
-+            InvalidProtocolBufferException.class,
-+            () -> MapContainer.parseFrom(ByteBuffer.wrap(NESTING_SGROUP_WITH_INITIAL_BYTES)));
-+
-+    assertThat(thrown)
-+        .hasMessageThat()
-+        .contains("the input ended unexpectedly in the middle of a field");
-+  }
-+
-+  @Test
-+  public void testMaliciousSGroupTags_byteBuffer_skipMessage() throws Exception {
-+    CodedInputStream input = InputType.NIO_DIRECT.newDecoder(NESTING_SGROUP);
-+    CodedOutputStream output = CodedOutputStream.newInstance(new byte[NESTING_SGROUP.length]);
-+
-+    Throwable thrown = assertThrows(InvalidProtocolBufferException.class, input::skipMessage);
-+    Throwable thrown2 =
-+        assertThrows(InvalidProtocolBufferException.class, () -> input.skipMessage(output));
-+
-+    assertThat(thrown).hasMessageThat().contains("Protocol message had too many levels of nesting");
-+    assertThat(thrown2)
-+        .hasMessageThat()
-+        .contains("Protocol message had too many levels of nesting");
-+  }
-+
-+  @Test
-+  public void testMaliciousSGroupTags_iterableByteBuffer() throws Exception {
-+    CodedInputStream input = InputType.ITER_DIRECT.newDecoder(NESTING_SGROUP);
-+    CodedOutputStream output = CodedOutputStream.newInstance(new byte[NESTING_SGROUP.length]);
-+
-+    Throwable thrown = assertThrows(InvalidProtocolBufferException.class, input::skipMessage);
-+    Throwable thrown2 =
-+        assertThrows(InvalidProtocolBufferException.class, () -> input.skipMessage(output));
-+
-+    assertThat(thrown).hasMessageThat().contains("Protocol message had too many levels of nesting");
-+    assertThat(thrown2)
-+        .hasMessageThat()
-+        .contains("Protocol message had too many levels of nesting");
-+  }
-+
-   private void checkSizeLimitExceeded(InvalidProtocolBufferException e) {
-     assertThat(e)
-         .hasMessageThat()
-diff --git a/java/lite/src/test/java/com/google/protobuf/LiteTest.java b/java/lite/src/test/java/com/google/protobuf/LiteTest.java
-index 754ed7d5f..81be90bfd 100644
---- a/java/lite/src/test/java/com/google/protobuf/LiteTest.java
-+++ b/java/lite/src/test/java/com/google/protobuf/LiteTest.java
-@@ -2459,6 +2459,211 @@ public class LiteTest {
-     }
-   }
- 
-+  @Test
-+  public void testParseFromInputStream_concurrent_nestingUnknownGroups() throws Exception {
-+    int numThreads = 200;
-+    ArrayList<Thread> threads = new ArrayList<>();
-+
-+    ByteString byteString = generateNestingGroups(99);
-+    AtomicBoolean thrown = new AtomicBoolean(false);
-+
-+    for (int i = 0; i < numThreads; i++) {
-+      Thread thread =
-+          new Thread(
-+              () -> {
-+                try {
-+                  TestAllTypesLite unused = TestAllTypesLite.parseFrom(byteString);
-+                } catch (IOException e) {
-+                  if (e.getMessage().contains("Protocol message had too many levels of nesting")) {
-+                    thrown.set(true);
-+                  }
-+                }
-+              });
-+      thread.start();
-+      threads.add(thread);
-+    }
-+
-+    for (Thread thread : threads) {
-+      thread.join();
-+    }
-+
-+    assertThat(thrown.get()).isFalse();
-+  }
-+
-+  @Test
-+  public void testParseFromInputStream_nestingUnknownGroups() throws IOException {
-+    ByteString byteString = generateNestingGroups(99);
-+
-+    Throwable thrown =
-+        assertThrows(
-+            InvalidProtocolBufferException.class, () -> TestAllTypesLite.parseFrom(byteString));
-+    assertThat(thrown)
-+        .hasMessageThat()
-+        .doesNotContain("Protocol message had too many levels of nesting");
-+  }
-+
-+  @Test
-+  public void testParseFromInputStream_nestingUnknownGroups_exception() throws IOException {
-+    ByteString byteString = generateNestingGroups(100);
-+
-+    Throwable thrown =
-+        assertThrows(
-+            InvalidProtocolBufferException.class, () -> TestAllTypesLite.parseFrom(byteString));
-+    assertThat(thrown).hasMessageThat().contains("Protocol message had too many levels of nesting");
-+  }
-+
-+  @Test
-+  public void testParseFromInputStream_setRecursionLimit_exception() throws IOException {
-+    ByteString byteString = generateNestingGroups(199);
-+    UnknownFieldSchema<?, ?> schema = SchemaUtil.unknownFieldSetLiteSchema();
-+    schema.setRecursionLimit(200);
-+
-+    Throwable thrown =
-+        assertThrows(
-+            InvalidProtocolBufferException.class, () -> TestAllTypesLite.parseFrom(byteString));
-+    assertThat(thrown)
-+        .hasMessageThat()
-+        .doesNotContain("Protocol message had too many levels of nesting");
-+    schema.setRecursionLimit(UnknownFieldSchema.DEFAULT_RECURSION_LIMIT);
-+  }
-+
-+  @Test
-+  public void testParseFromBytes_concurrent_nestingUnknownGroups() throws Exception {
-+    int numThreads = 200;
-+    ArrayList<Thread> threads = new ArrayList<>();
-+
-+    ByteString byteString = generateNestingGroups(99);
-+    AtomicBoolean thrown = new AtomicBoolean(false);
-+
-+    for (int i = 0; i < numThreads; i++) {
-+      Thread thread =
-+          new Thread(
-+              () -> {
-+                try {
-+                  // Should pass in byte[] instead of ByteString to go into ArrayDecoders.
-+                  TestAllTypesLite unused = TestAllTypesLite.parseFrom(byteString.toByteArray());
-+                } catch (InvalidProtocolBufferException e) {
-+                  if (e.getMessage().contains("Protocol message had too many levels of nesting")) {
-+                    thrown.set(true);
-+                  }
-+                }
-+              });
-+      thread.start();
-+      threads.add(thread);
-+    }
-+
-+    for (Thread thread : threads) {
-+      thread.join();
-+    }
-+
-+    assertThat(thrown.get()).isFalse();
-+  }
-+
-+  @Test
-+  public void testParseFromBytes_nestingUnknownGroups() throws IOException {
-+    ByteString byteString = generateNestingGroups(99);
-+
-+    Throwable thrown =
-+        assertThrows(
-+            InvalidProtocolBufferException.class,
-+            () -> TestAllTypesLite.parseFrom(byteString.toByteArray()));
-+    assertThat(thrown)
-+        .hasMessageThat()
-+        .doesNotContain("Protocol message had too many levels of nesting");
-+  }
-+
-+  @Test
-+  public void testParseFromBytes_nestingUnknownGroups_exception() throws IOException {
-+    ByteString byteString = generateNestingGroups(100);
-+
-+    Throwable thrown =
-+        assertThrows(
-+            InvalidProtocolBufferException.class,
-+            () -> TestAllTypesLite.parseFrom(byteString.toByteArray()));
-+    assertThat(thrown).hasMessageThat().contains("Protocol message had too many levels of nesting");
-+  }
-+
-+  @Test
-+  public void testParseFromBytes_setRecursionLimit_exception() throws IOException {
-+    ByteString byteString = generateNestingGroups(199);
-+    ArrayDecoders.setRecursionLimit(200);
-+
-+    Throwable thrown =
-+        assertThrows(
-+            InvalidProtocolBufferException.class,
-+            () -> TestAllTypesLite.parseFrom(byteString.toByteArray()));
-+    assertThat(thrown)
-+        .hasMessageThat()
-+        .doesNotContain("Protocol message had too many levels of nesting");
-+    ArrayDecoders.setRecursionLimit(ArrayDecoders.DEFAULT_RECURSION_LIMIT);
-+  }
-+
-+  @Test
-+  public void testParseFromBytes_recursiveMessages() throws Exception {
-+    byte[] data99 = makeRecursiveMessage(99).toByteArray();
-+    byte[] data100 = makeRecursiveMessage(100).toByteArray();
-+
-+    RecursiveMessage unused = RecursiveMessage.parseFrom(data99);
-+    Throwable thrown =
-+        assertThrows(
-+            InvalidProtocolBufferException.class, () -> RecursiveMessage.parseFrom(data100));
-+    assertThat(thrown).hasMessageThat().contains("Protocol message had too many levels of nesting");
-+  }
-+
-+  @Test
-+  public void testParseFromBytes_recursiveKnownGroups() throws Exception {
-+    byte[] data99 = makeRecursiveGroup(99).toByteArray();
-+    byte[] data100 = makeRecursiveGroup(100).toByteArray();
-+
-+    RecursiveGroup unused = RecursiveGroup.parseFrom(data99);
-+    Throwable thrown =
-+        assertThrows(InvalidProtocolBufferException.class, () -> RecursiveGroup.parseFrom(data100));
-+    assertThat(thrown).hasMessageThat().contains("Protocol message had too many levels of nesting");
-+  }
-+
-+  @Test
-+  @SuppressWarnings("ProtoParseFromByteString")
-+  public void testMaliciousSGroupTagsWithMapField_fromByteArray() throws Exception {
-+    ByteString byteString = generateNestingGroups(102);
-+
-+    Throwable parseFromThrown =
-+        assertThrows(
-+            InvalidProtocolBufferException.class,
-+            () -> MapContainer.parseFrom(byteString.toByteArray()));
-+    Throwable mergeFromThrown =
-+        assertThrows(
-+            InvalidProtocolBufferException.class,
-+            () -> MapContainer.newBuilder().mergeFrom(byteString.toByteArray()));
-+
-+    assertThat(parseFromThrown)
-+        .hasMessageThat()
-+        .contains("Protocol message had too many levels of nesting");
-+    assertThat(mergeFromThrown)
-+        .hasMessageThat()
-+        .contains("Protocol message had too many levels of nesting");
-+  }
-+
-+  @Test
-+  public void testMaliciousSGroupTagsWithMapField_fromInputStream() throws Exception {
-+    byte[] bytes = generateNestingGroups(101).toByteArray();
-+
-+    Throwable parseFromThrown =
-+        assertThrows(
-+            InvalidProtocolBufferException.class,
-+            () -> MapContainer.parseFrom(new ByteArrayInputStream(bytes)));
-+    Throwable mergeFromThrown =
-+        assertThrows(
-+            InvalidProtocolBufferException.class,
-+            () -> MapContainer.newBuilder().mergeFrom(new ByteArrayInputStream(bytes)));
-+
-+    assertThat(parseFromThrown)
-+        .hasMessageThat()
-+        .contains("Protocol message had too many levels of nesting");
-+    assertThat(mergeFromThrown)
-+        .hasMessageThat()
-+        .contains("Protocol message had too many levels of nesting");
-+  }
-+
-   @Test
-   public void testParseFromByteBuffer_extensions() throws Exception {
-     TestAllExtensionsLite message =
-@@ -2815,4 +3020,31 @@ public class LiteTest {
-     }
-     return false;
-   }
-+
-+  private static ByteString generateNestingGroups(int num) throws IOException {
-+    int groupTap = WireFormat.makeTag(3, WireFormat.WIRETYPE_START_GROUP);
-+    ByteString.Output byteStringOutput = ByteString.newOutput();
-+    CodedOutputStream codedOutput = CodedOutputStream.newInstance(byteStringOutput);
-+    for (int i = 0; i < num; i++) {
-+      codedOutput.writeInt32NoTag(groupTap);
-+    }
-+    codedOutput.flush();
-+    return byteStringOutput.toByteString();
-+  }
-+
-+  private static RecursiveMessage makeRecursiveMessage(int num) {
-+    if (num == 0) {
-+      return RecursiveMessage.getDefaultInstance();
-+    } else {
-+      return RecursiveMessage.newBuilder().setRecurse(makeRecursiveMessage(num - 1)).build();
-+    }
-+  }
-+
-+  private static RecursiveGroup makeRecursiveGroup(int num) {
-+    if (num == 0) {
-+      return RecursiveGroup.getDefaultInstance();
-+    } else {
-+      return RecursiveGroup.newBuilder().setRecurse(makeRecursiveGroup(num - 1)).build();
-+    }
-+  }
- }
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.3.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.8.bb
similarity index 97%
rename from meta-oe/recipes-devtools/protobuf/protobuf_4.25.3.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_4.25.8.bb
index acc35db4a5..949a3b207b 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.3.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.8.bb
@@ -10,12 +10,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 DEPENDS = "zlib abseil-cpp"
 DEPENDS:append:class-target = " protobuf-native"
 
-SRCREV = "4a2aef570deb2bfb8927426558701e8bfc26f2a4"
+SRCREV = "a4cbdd3ed0042e8f9b9c30e8b0634096d9532809"
 
 SRC_URI = "gitsm://github.com/protocolbuffers/protobuf.git;branch=25.x;protocol=https \
            file://run-ptest \
            file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch \
-           file://0001-Add-recursion-check-when-parsing-unknown-fields-in-J.patch \
            "
 SRC_URI:append:mips:toolchain-clang = " file://0001-Fix-build-on-mips-clang.patch "
 SRC_URI:append:mipsel:toolchain-clang = " file://0001-Fix-build-on-mips-clang.patch "
-- 
2.34.1


