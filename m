Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD23EE01FE
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 02:54:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13553.1726023237159337243
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 19:53:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=99845107e5=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B2XQr5015906
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 19:53:56 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gj44brjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 19:53:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lAmHGig5moN04F20iOU9ze+MGLd017TArB8pxOcWViAI5XxZFBFLPlQ2PVBkoD+zIydiKkjiI0luYOsVscxycJXQnWOZyJ1DxZAryZHeKNPT4BRl4b8HLfRB8hjWCyA4aQD6U+7+9NV3RKrBu4kMa61ngSGoZRcEl8tpRN6OWr+HUSv4WKXj541VH834RFrr9XcLsnkUjFhsLbe4p9CkpEoB0jHRpTgdLv4oBujXvd8/V7R5fWFxGDbeTUiy7NP5F/wubO+m+fhf1sMYNqTwCm3Y0fK7i6dq6cCfFQOnVgjvPCYi4Pztqceqjenwner9lZzH5Nlq47VN1U2TQ/M7Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQliYxlPzXROr8C+u7pFS2LQIjRMMvKMIJ2Ju6acHtc=;
 b=ZtosKC5bSa7sX4N2sh8VXBk14g8vQxGw4VbDOkWBuYko5YvEnMbaq+k3M3Oy0w7hCP1di+0BKj1o54pq6MVYg5FEKgHBH3wPre2jIRyHVrX6x4uL9gAwv9DMOBrlzUvql9aDVWONv69Q8u/y2+F+84jY5HfdbqniBxMcq7MQUx9z6aoWZHf85iiLOixBxD9hjOJRLjZ0WluwTQDm1MrlFDw7h5a4RwkD3L+DHMG2RHomNtYUr2BmU8K/8NXRvBJCqsykouMkyGmXidA/YHEsKWIUERLRLoEdzCiTZ0ay+GWw0zQ9aNtgusVL+JBb6ud49NUKqx7u8GS0RHHO8M80Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.17; Wed, 11 Sep 2024 02:53:54 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 02:53:54 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-initramfs][PATCH] dracut: upgrade 102 -> 103
Date: Wed, 11 Sep 2024 10:53:44 +0800
Message-Id: <20240911025344.2671746-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0128.apcprd03.prod.outlook.com
 (2603:1096:4:91::32) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH0PR11MB4952:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fa37c60-5263-4c8c-90b9-08dcd20cf920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aliVZpdDfjzOoqDxMOAmLpvG2RxCs2gJQyo5DZHV6/6YR15YBs/iidsDMzAo?=
 =?us-ascii?Q?/9WwXVtxP1aHq4jykXQazmRMqUKd3WGBtcK4Gtp6ytdhLiAXhptrbWdpPpob?=
 =?us-ascii?Q?2VxPVPVVfHnebPdHiXzxPR9D0IwBiW9ONpv/8Wqj30TGuVa+wxzj9rz3bIiC?=
 =?us-ascii?Q?Hk0daP3bq+y6NazUticg6Wm+CfE3iNUDN59F7sPCaN4e4HQf2jmURTwXnE6J?=
 =?us-ascii?Q?s3HsbU+pqLUBRJAFDF03qTHUbkxx/WJQPDn5WFjiLlkU1F4NwdBBOf+D3XFO?=
 =?us-ascii?Q?l1ZkeavkinzcNQENpJhIvil+FO4dhT+54Jvb3zgMHHu3yFcMsjItdfR7pbxM?=
 =?us-ascii?Q?NAihfdKR8t4kaezDk1dqsLOeG3Qz+Sqth1utpFSaH+VLXu6LWARvxoIxeHwD?=
 =?us-ascii?Q?Zcn3E0ArxS9NTZu4PLffpxOd1vwfqZmM34BJEo8XvHdG7EPq86WHMHlNgZIW?=
 =?us-ascii?Q?2uGabrL8Ye9fCfMjqa6+bxXszRt/x2ET4ZcsLjlBmhEwK46R3dY7Ala+ChvV?=
 =?us-ascii?Q?XmTdrsSFG8F86FILYL8/LOHt7CaBdQS6wIS0dZmZDT/th6TRgPPijVVlwhWN?=
 =?us-ascii?Q?kdL42ad2/80N6mzKgtOng3q42XAgiyCrIkGc5BZzNqvDOXERekyq30Azu23i?=
 =?us-ascii?Q?w2KbPoXpgQVumE5Uu6wDaEybtq3hMTxhtU27TfqGbCZ6x8A4LJqx8ICfs40K?=
 =?us-ascii?Q?sN67NrD6GBKtpc8p7j8Dle0rztuwUYe4/T1jp9cuVX7ICkpZRwfrzqi0lhVS?=
 =?us-ascii?Q?x+UimJ8DofpEhUZPaH3WDWlkUwWqdoxg1vGB1fHFbUmz/obr3SSn462TVD0n?=
 =?us-ascii?Q?RWtkhvku3PaqzYkjW4eTmou2Z5H0Jn5oTXkpr2XhYrBICwwlUhzHIyoXccmG?=
 =?us-ascii?Q?ls5qaoIQUX21BgHqQNxEfID7aoLF2/zG/EHP5Ks3wzVxGib11eSkm7/ckR7z?=
 =?us-ascii?Q?N52OunBQTjq8saC9+KJWV1HQi8MaW6li2rK46Tmb0nHVf+oLgINVq4tFUajO?=
 =?us-ascii?Q?45UlaDoczhdrwRaHlxGB1EWNgl930GeZ3OegeYsxCVGpniE7tE2u+S2kzqX9?=
 =?us-ascii?Q?eKdkk7TX2rICBhgHv37QsVG0Gf/eHCqiZ5gduzXKJBp7QlHayS8q4VUPfetE?=
 =?us-ascii?Q?zprGkLeQS6lVSywkmJF7uv4u+UQrGwL3QViuJse0425EUCiwbUlNlNpfoWQu?=
 =?us-ascii?Q?gu3VWqLqEIrXY+NB6EMHS/s4alQPMhomQWa9LZptJRvQ4VP1qMkfU/l4QhWM?=
 =?us-ascii?Q?JeAKZDhUNRiBmf2y+ilmI1+C0tR7TNwciRTcSxdNh3lu1pbmm6gmDBXcaxsf?=
 =?us-ascii?Q?7YaX2mOX5mZ8GqwhQgQBqJHroSKfPnqob8CSYvkLIjkbKY/gOmZi8Mya1wdP?=
 =?us-ascii?Q?S8Jb1cxfoPfXTTcrleKZN6/E15ex6cgDq7mRt96psG9IofPrUQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Mt9y+VC32l8Cl+cWXeMBYpWt/BuMeVEoVSfvmsTfjfgTgOtTQdESwIQWXF5B?=
 =?us-ascii?Q?MeyuxufOELS6N4HA9CrfLy1JKXZ6uHYbEfNDzYC6zt+8nhp0NufyKwxkCvFb?=
 =?us-ascii?Q?h/GZ0SRHTszEyyDxTuxu53ORqfmMTURmfYmxwDekwYoIZsOHGbbvLQaAEdHc?=
 =?us-ascii?Q?uQqvKDF2jUa0iYgmX3UXuYldCx4yyu4lpkmqgQ5xZXGHMD4kU7FjtK2e3PZ3?=
 =?us-ascii?Q?CxjXhdZPNw6TKdgF8hlVE2AIGtabNx+5CBl6UPLaDJ2KLRuD+vZwws/qBKTb?=
 =?us-ascii?Q?MitPS2cAFvBfr6pO1hLYxp7c1dE02Gi4Iaa8msJz11opFNfBuhpwAYii2R9w?=
 =?us-ascii?Q?oB/J1ifwxXMA+D2d9i18dv/Fyoj4EvVm/9DXGlp7iqQi3w0gSwoEzK+wiAfb?=
 =?us-ascii?Q?oOlFiGxvgCunxukt2EL3roXOD0Lu3u+8YxlnkigPOKmWwQT0arNJ8nl+0cAN?=
 =?us-ascii?Q?n/rs9tkuSe1KkhUBq6iiPcr3Iubvc1mq2h/f51/9eEzN4H8Jd02+vAcMBZAr?=
 =?us-ascii?Q?WZ2jXUEaWbws9DLqQecnwjCCN/Ts6ay+fp7ho8bgKtvBJ8jaQvu1vIpiH6Ni?=
 =?us-ascii?Q?t4THnD2OP6rkZwSz5gBn0XHPKK/qVaMikdvnMa2RW4WFYyE6+QF5HRX3kBZi?=
 =?us-ascii?Q?xjUoBqFVimsBFi5yk41kF172uwKmTRs2D3TgiMopGcC0TLhZH0Qkj3XsJnk3?=
 =?us-ascii?Q?nMcezbK2iKp85vW6ZzCkPrbU74Yd5wA3T9iKWxl4CNe58Ca7aKaImR7dxnup?=
 =?us-ascii?Q?bdm40iZ+tUQBqJWqRUhyLJp4swDzuvSYtvwqX58nTS6KLn0x0QlZuxLQ5EWi?=
 =?us-ascii?Q?Qu0iKiTPTvs4VBRYBX6kz2wCGTbWLIGs2oOj8seU0oqxQ/RqGSP3kNh475Hq?=
 =?us-ascii?Q?K7Z+emqWZ1mYj8RoqXXTdzLTaGmQmcmWfAS3TFphmdASeR21CwBZXyqbIVjL?=
 =?us-ascii?Q?dGzTkT9Aw6L2DjyotIZmRAvdHSaINb0Y+ALPTnjHZx2p1VT7TFrlTa4IE4sY?=
 =?us-ascii?Q?kSd1wcH4h4fR2yaF7x5QHP6aAyibETC0qN/HalsKz8MFUizv8oXPvZAabwGZ?=
 =?us-ascii?Q?n7ru0ptmK+WXHty6+oIt14fORYKQkqjxjVmZp2Zutv8fpLghGbIZbeqmR7xJ?=
 =?us-ascii?Q?u+UKmn4zaSC7eVzuFOWYVZx52Shys7L7oA2ALmgICkLGdMutnwdnqWbWTjbw?=
 =?us-ascii?Q?1i5vBaX0Qze+5ebhJFOO8HyAM9SiplYvNPCIGKqsiBIT6hvGmvSOSX6X6sQt?=
 =?us-ascii?Q?NO1dwHUykVFaCvsU3GIJyiWHhtgDuZ0cHuw5/zidW31Za+H0KjT3d+WfFhgd?=
 =?us-ascii?Q?IGBfpLhQJB9jU2oNCfaVUQRKBECTeCfeuvfwIiIidVEUHaQ4PCIrOj7t+AUb?=
 =?us-ascii?Q?NpqY35OYKlyEd8K1/pPrxV2feeDsORZLgWbw0moW/MvqGVShgRmp8+IYw4Rh?=
 =?us-ascii?Q?SUWWnbrHQ526Na+XGFmM4tMjEYJ3HvbS6RTfBw3MycyM1gIIE2B0KZZmFw4n?=
 =?us-ascii?Q?Wq/4hmKw7CwMlrJA/dLtohR6YhIVIPR4Cs9EW/OYizbZNGTB58QqIJE8j+VE?=
 =?us-ascii?Q?21ZsAQPATORmxPrFdUm+nLdf2QC9xZUGkxI0uTm6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa37c60-5263-4c8c-90b9-08dcd20cf920
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 02:53:54.4312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xxv4Z2TRcEznzNAPKLXf0CypnVHFTvRvpfKrAMHRSBpRyXd7a4qJBaeXLroXFM9iehYhxQywWoMpIBer1gIIGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4952
X-Proofpoint-GUID: Fe4-GHKujRdqoKCe_BWGnAnwOLHtwEd2
X-Authority-Analysis: v=2.4 cv=DZxFqetW c=1 sm=1 tr=0 ts=66e10644 cx=c_pps a=JZW2CxG2E6UWpsn1SfDs7A==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=HQT1lDfycQYa-dHPGSQA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Fe4-GHKujRdqoKCe_BWGnAnwOLHtwEd2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_12,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409110021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 02:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112236

ChangeLog:
https://github.com/dracut-ng/dracut-ng/releases/tag/103

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-devtools/dracut/{dracut_102.bb => dracut_103.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-initramfs/recipes-devtools/dracut/{dracut_102.bb => dracut_103.bb} (97%)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_102.bb b/meta-initramfs/recipes-devtools/dracut/dracut_103.bb
similarity index 97%
rename from meta-initramfs/recipes-devtools/dracut/dracut_102.bb
rename to meta-initramfs/recipes-devtools/dracut/dracut_103.bb
index 39ff265a3..3ee348dbf 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_102.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_103.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PE = "1"
 
-SRCREV = "1a8ee6e00bbe017717a5ef9e9bcfefb3b88f629e"
+SRCREV = "3fce598fb45aa5618cdf885eb48cf327104ffcb8"
 SRC_URI = "git://github.com/dracut-ng/dracut-ng.git;protocol=http;branch=main \
            file://0001-feat-dracut-install-split-ldd-command-arguments-for-.patch \
            "
-- 
2.25.1


