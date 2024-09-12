Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00482EE6427
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 02:46:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.38555.1726109174216510027
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Sep 2024 19:46:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=998582a7bf=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C1fPwa029960
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 19:46:14 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2042.outbound.protection.outlook.com [104.47.56.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gj44da1x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 19:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNgKHi2IPRaS4gnxVDldv3uDGzyvkyI6XjsnYTvJ7vgLpYyatB+Jingv/kvxeJT6urSfoO2WloltHE165ntRj9Tvt8FVd73u+xaiA7SPjx3t/9XC+6po8Iz5B0zNHMsbQiC+BZLuxYy0kQTK/0u0sEj8saOhwVosKBWMSNr/U5HSYIxEZjptkqLJHee+gWGrGTyxZmEw79jsP46wJgLPGUMWpyGwQZnreJG2WXZ1uUiCIahWPljiaScPhBrY5HfZv9jBpnHsbXsaXfAGW4KX5b5bJefJVSMiKfVmQ9YmR9QOc3t7GfdzHXFk+MNgNDp4/39AGWX45yNkxFUDNLgd6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Fxz2VlFPwTYb4yVoT6C8X/KjmgzchYBdHBNn672f5c=;
 b=AiQEH2q6b+ZQ99OxGJ2/sdiQEGRpyddjvFojxuISgZ3C3p4Ijtag1QuAom9UpvAZcQqcl6OqT5ObDe5izHC33Np168RSzN9Mx+3a1oJHUbigr34WCwMi62DtDgJkYYRXldICQTFQHJAq+zhxuqqzMqzYc4oG0vuHGTa+s1dT4TQau4NKyITISEzfl/n4RsXVv3bec9tqpjGSDxn/VNF+NHygFGi7PwCtBMfk8XqjX1bvmiBEeJlCKE16XRdEy9/tRtvg2E4RKVQ1xCbD6H3gsk8BHOkg1J/MsazZwP732IG6a6iLA3Ub9UXESQ/Tfg75oswZNEBH/NVZd+gypdQWqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.25; Thu, 12 Sep 2024 02:46:12 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7962.017; Thu, 12 Sep 2024
 02:46:12 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 5/7] crash: upgrade 8.0.4 -> 8.0.5
Date: Thu, 12 Sep 2024 10:45:56 +0800
Message-Id: <20240912024558.3998529-5-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240912024558.3998529-1-yi.zhao@windriver.com>
References: <20240912024558.3998529-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0304.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::12) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM4PR11MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d84f6d6-c990-4ab1-29e7-08dcd2d51053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?X027bt494IndTuFRAQxcNlUSUKgBPjnaMTvF9RJTKHN9Bq0ChSK6nAXELVHv?=
 =?us-ascii?Q?pgVfCyQE5DquHu2DhGWEHXNatIDqYM5KPVQLtrtqaYsB//hhrdwJAnHen0TV?=
 =?us-ascii?Q?+bGg06/TcgeISa3QUcC7gDdxPD2paEIkhAjEGusgxC01l2AjDAsEPC6aHE/s?=
 =?us-ascii?Q?zqpMyfJoI83GBwM5UVLnvp1il/R+khDEXO6XmzUApHmPBE+i4RKFP2WgjoYa?=
 =?us-ascii?Q?7u7i1Vqe6r+DMqMbcp6kbwgIQ4Kd5TVfhYngUt9WAqmC6eY9JqGbUJTvTFnM?=
 =?us-ascii?Q?TxrxPBg1pOn3jVl3ClbOdCnMm+WClRLDJzRLdXwcYCK0sQ7R6CQ/KhFQpe1D?=
 =?us-ascii?Q?LGdDckL5VeFjsJ8vxO3WYsUBnOhU1qRjCMfUlh0ZDbpvCYVlV50B6g6QCX9k?=
 =?us-ascii?Q?L8wAIgkYvQN2ntQcU4CP6dlWb8sQAC91dqFx7SEa73EX/2uh41NQgPV9ygTt?=
 =?us-ascii?Q?n9/EaovLymnIdyEMEcX4har2WUEx9hmaqd2AwMgNAtUsqhJay3gemViEQMT+?=
 =?us-ascii?Q?LjjwCURR8862lW2hL1onuLgukxJgZBx2471YEEp5U1sFQfyc18doMkmKrBq5?=
 =?us-ascii?Q?0E2JTP/LcJlb4Hvaiid35a0IQvan7RI9yugQNdvdnMiErZgADVs5T2EZAP+i?=
 =?us-ascii?Q?zXNTMdN21+v/ATqn3T+osPU0hCko4q1pBXxRZnhD+Jbl6OPbpe55SONny6lV?=
 =?us-ascii?Q?eVfjbgF8rMce7IbfRgu4GhviElLuI1ut794PqhPIvTU1Vu+hW6NT/Q0Pgylc?=
 =?us-ascii?Q?W6pB+6lFOO0HqhJZYzSaXbbhT59ybtawt4GYqVp3CG6Ctl3mcAHfBwaRdyDm?=
 =?us-ascii?Q?OgXS/ljKOpdkkPQ+0qvEF5NPoFs2Lkfn2VKdeQu7CuYFJKKl0hIbiZwRYy0C?=
 =?us-ascii?Q?j55iZuggTq15iP1G6j4pQFj1wOvtHXyjrwBhNpcCrlWfJ9Gl9zD4Qu1ld2Zt?=
 =?us-ascii?Q?PGVPeQBONQouLpdP4BsijawuTRd3RAHWM/OjTE+vqBd8l8k9PBdVjcFsWWlp?=
 =?us-ascii?Q?lKyPjH5xrqT8DFnQf/f/UeIjl94aYff7xGO6q7xOfC0SNO6cv0AtNILYnn4v?=
 =?us-ascii?Q?KnXsUJ6V4SfbjtvUJamqyONTzto2EHjp0wrqkigYsIWGhiRtPYOInBZ1O03Y?=
 =?us-ascii?Q?qT6FCnw/Mczv1s5abt3doe5aHH1KMbgKwCE5fAqHG1mh5oCuCWkLg6l6Ttnw?=
 =?us-ascii?Q?U1OMLQwxDpo0na1/MZrNJa6yWNLRgIqyJhv2xEJy3vXX4bNl3VOLl1u2gkNf?=
 =?us-ascii?Q?/NxHkJXJnhec9G1dYXApWwo9gyrW5dWecoClglk9eyIpPhaGO53KdhrC1Df/?=
 =?us-ascii?Q?SmaKfoIaK5lrXfPpf/CsVr4KdR2J/wzNV1i2S53KdhvI0A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xt717Th4NT641bNitS9JU/ezhDwNnqOYqepxUmP4hzmGjUIB2tVFRA8gAspk?=
 =?us-ascii?Q?QNSkzCCwXq/teu1fDmWErOxyEgB2fsF1Kf5NN1Wnq8GGDcw5ARAbFTNdJky0?=
 =?us-ascii?Q?sO7XpKjfWAZrj/VBaPqA2o6Lyr37wV1MDHu/038zGcMNrG1vV7RLTzxIyAfj?=
 =?us-ascii?Q?1m7Br6L6pBcPs4QDDwf2AA6g7YsaShd9D+qx68PSOYHCqWB4ye/si+0/DPO1?=
 =?us-ascii?Q?uqQpJO208op3KoX9OuZtHPfNt181UjHxL/4nwVSvpmfPKVQ8Hi/muNPH2aQd?=
 =?us-ascii?Q?BzVZAS3a5jPDaPES/wsrgtYA0uKniUFiujWQPeOZBhhZZcu5ff6cZmJyPKWI?=
 =?us-ascii?Q?5Ab1z9dlQOG6Dp1Rzif3px4x/oqfIhT3zQ4HM9l2f5yOVxzF2/Ix+Tl3WwCr?=
 =?us-ascii?Q?CPtDhuPmXnrkW5N8yeM7HLDyGvTgRM8KQWlfjwuRt4EEM0dIqCk+LeivAmWO?=
 =?us-ascii?Q?qbEjJFfRT6PE9KsUe9ikp1GfDbh912Ivf9iwjrCKjdOYzhP0hxUBsHzgX4sL?=
 =?us-ascii?Q?yn2jrT9AcFrul2xUjVvNXc8KWFkqvS6a9MX1W8ICnJZ6XH2Q0LcY/9stqYo0?=
 =?us-ascii?Q?5UlIZw4GRiHEg6ajR1X+3iqZP6YgUdzLT5r3eSYQJx2ZBoDvj9q7tqn7uoxG?=
 =?us-ascii?Q?654HcfwngclBPEpvmQzwlqFc8A5RDz6NiV9dvt/owPGbVrz4P387qanhjJGP?=
 =?us-ascii?Q?km+RkqGDZ/j2HiZcnH20hF/NEEpysWLYkRy9Ymev4dZ69kkaklja5M3g2Jbw?=
 =?us-ascii?Q?G38zslR0hjlJvCkR1OBuwgdxPHYdO5k7ZzMxZzQe68t6fD1LpOuKINXmX8Mi?=
 =?us-ascii?Q?WR8NonU5g7inK4f8jhkQROLiQ+n4bJreRj6+3IxLgzqVMb7J2ex98LCG1tW/?=
 =?us-ascii?Q?ma/RK/6MlLAfVFeSKxq+VwCe5vcE6PfH+Phn8sKVmJVeoQU2XpZEevHS46HG?=
 =?us-ascii?Q?SNIcqGEdYbHNnT9ppwEIFfY50/hu3+5H22xZuKwGzhwilmNwOKDCPCqcb/sf?=
 =?us-ascii?Q?MarPbQWXE18l02WOEy40MOcZdO7nc0oDIQbFylNQrniw0w2vaNzXIAboryxh?=
 =?us-ascii?Q?UExly/R+vUMqbmEpjuGWBca63FQ8EmU2O9q50Pc3r5Q8wJIbyjgFxROgkj8s?=
 =?us-ascii?Q?gNCTID/1/hj1nvJ24Or34YpDRyZgd5Qh36axz0r69yfGjI38+z2T+e53bdip?=
 =?us-ascii?Q?LgJjICv4CJOWONfEhbmXXGchywCu4cyHFrsf8hPO3EovVhULUMbyotPa61OX?=
 =?us-ascii?Q?Y6VPxEAMg13eL6GcBmZyO5mRxI3U65JkwzuAsw8fA1Z7kooYS3Q/hoMJQK9x?=
 =?us-ascii?Q?tkqx9PMA5WWGQq8gm1ogkxS4bydv+64tEQTeV7MJTTFGnzfa3Vkt04LkE5CO?=
 =?us-ascii?Q?2PzQqXocRaebSN5SYojUEyxLc4P5+NaDa171+mJyObCcGB1yHQ1im2o7CGsL?=
 =?us-ascii?Q?JMw08pKflShIW/UwMZc1ajh3YiCyEZ4WNtAwct2lTIIFlog1sRAXxN/ko4Bi?=
 =?us-ascii?Q?ERFgdWo/kAcBjmBp1Gng/Jfk0OZaOgTUEk1wFP2VjW5pzvY0bQuZHrcXsX4s?=
 =?us-ascii?Q?QpgO+wS4jVNSxgIPeCzfmRHZt5SYOo1GuTHMbKut?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d84f6d6-c990-4ab1-29e7-08dcd2d51053
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 02:46:12.5179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L0wbhCH1ibvIaSLhsLg0+dJs1GyDi3r28TXNJcq8dx90TNlNjGbC8n39suF3zIV1CDxNh8X7csRry4wvE31U1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
X-Proofpoint-GUID: znsoIfO-sGZaMqSy754ipKXuqAIMDqBh
X-Authority-Analysis: v=2.4 cv=DZxFqetW c=1 sm=1 tr=0 ts=66e255f5 cx=c_pps a=ruI+LRy+bJmAUyIDade2ZQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=zxyvrzb0AAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=WSdcqNITIfVBjxQcX4EA:9 a=INJkBFiNmdvbNVMkhF4h:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: znsoIfO-sGZaMqSy754ipKXuqAIMDqBh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-11_02,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=926 lowpriorityscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409120020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Sep 2024 02:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112251

ChangeLog:
https://crash-utility.github.io/changelog/ChangeLog-8.0.5.txt

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...sh-cross-canadian_8.0.4.bb => crash-cross-canadian_8.0.5.bb} | 0
 meta-oe/recipes-kernel/crash/crash.inc                          | 2 +-
 meta-oe/recipes-kernel/crash/{crash_8.0.4.bb => crash_8.0.5.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/crash/{crash-cross-canadian_8.0.4.bb => crash-cross-canadian_8.0.5.bb} (100%)
 rename meta-oe/recipes-kernel/crash/{crash_8.0.4.bb => crash_8.0.5.bb} (100%)

diff --git a/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.4.bb b/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.5.bb
similarity index 100%
rename from meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.4.bb
rename to meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.5.bb
diff --git a/meta-oe/recipes-kernel/crash/crash.inc b/meta-oe/recipes-kernel/crash/crash.inc
index 04318b150..29cff569f 100644
--- a/meta-oe/recipes-kernel/crash/crash.inc
+++ b/meta-oe/recipes-kernel/crash/crash.inc
@@ -23,7 +23,7 @@ SRC_URI = "git://github.com/crash-utility/${BPN}.git;branch=master;protocol=http
            file://donnot-extract-gdb-during-do-compile.patch \
            file://gdb_build_jobs_and_not_write_crash_target.patch \
            "
-SRCREV = "a6832f608cb5d473739cf33bbf84ab1df8d98fd5"
+SRCREV = "ceacceef7d13134d327719a624cfafed99e90f8a"
 
 SRC_URI[gdb.sha256sum] = "b33ad58d687487a821ec8d878daab0f716be60d0936f2e3ac5cf08419ce70350"
 
diff --git a/meta-oe/recipes-kernel/crash/crash_8.0.4.bb b/meta-oe/recipes-kernel/crash/crash_8.0.5.bb
similarity index 100%
rename from meta-oe/recipes-kernel/crash/crash_8.0.4.bb
rename to meta-oe/recipes-kernel/crash/crash_8.0.5.bb
-- 
2.25.1


