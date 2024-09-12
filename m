Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1580DEE642C
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 02:46:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.38556.1726109176199481727
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Sep 2024 19:46:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=998582a7bf=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C1eBJq027428
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 19:46:16 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2045.outbound.protection.outlook.com [104.47.56.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gj44da23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 19:46:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uIJtm3ijft0QtCxFQoKVUqODPpoINenkS+/FVKH9V4b9Cbeo43NJECs4Jnx0MyGj73PAOU14NBHmUqdM4lPebKGH4Av5Iw5Jf6soXs8KTxfB8NtafL6MtsHI2aepDpon+cMu+nk3nWe81CASrJjpmwFfms90yFweO1WFJQgqh6na5XiMldgYZRtuKK0bt9HlpdriRSNnwaSQ7QEgujrqKbn5JWKqdaIYS80JIu/BNa1Xqg3HSYeJli9fRU49zB1GX339ym/KLBTufaBaHB4OnpGfmKUWoIxv3TzSyP2CW4RbpJfkLYsP4599VEJxX0AY0TgU+ODjr8ZupBLBv3DTgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KR2qoFaCdEF2zut++Sy5jb/VOEC0xcn4UTNctvLAm3U=;
 b=tcSyQNmZQaMkFQPjEcsRdZ230GH6UvWBTE75KbVl1BLXW4z+OY6hA7k3/ESTMCZBIKilJqVnRH4MysDX5tvMVLNkpr44A17Az78k5DQzltaYItc8NO1Z6da9nw/E/BwTJ7mQK5AXYdkMCgWOypwoXKVeEwRj3EuqYTj+yyOpqm9j32oHk/4LQ3mHUFGzSFke84mO0Fdlnu57CZb1n5X6uebaTSj+VS2iDKtWtqyLTFEuJGv4H2/fCAG+jDhZ7vLMnXZC+XOeUj4dcLzfgDGHHJRd++MwBj2+wLb2VjXUROsOivDjKu6ZkngPovv9X+dOerkmIKB7jFeG40ykMrISow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.25; Thu, 12 Sep 2024 02:46:13 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7962.017; Thu, 12 Sep 2024
 02:46:13 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 6/7] mce-inject: upgrade to latest git rev
Date: Thu, 12 Sep 2024 10:45:57 +0800
Message-Id: <20240912024558.3998529-6-yi.zhao@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: b454ac8a-9d38-4a9a-252a-08dcd2d510fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lPvoJZMM/dI4YFXlHSKN9mFQEovPlasfmn81QP1GN3Q7fQx6EocIowtBABih?=
 =?us-ascii?Q?Nk7vd8S4jTgDzxdXY9tQ2pQV9H40S4OSC5dq7mcD0FYTM58vMBZd008t2gSg?=
 =?us-ascii?Q?3PiyqnlFEnK9JrVS9pFO+VN9FUJgmlixpCeeoIt2Ddqyk6RKiKwDzNr2MxJB?=
 =?us-ascii?Q?o4G+z/bhckmlHLNlTA5LH3JqfbQhC5D8GJp2VDgdva3C/RKmC1TwCK2g30iU?=
 =?us-ascii?Q?U/BKBmzHPrDw6aE7JjY9riY5lPaQ/uNxxXq4/6LQpV0eY6HNA9RZCgZqHc2E?=
 =?us-ascii?Q?W2niYIDa1HfhDTHdFpGSvk8Ti4ePivsCf8DPB8gs95vY3egh5xVTQ5oWYX3F?=
 =?us-ascii?Q?RNjrsGE4+OvRkVerKxCYXTFW1wkylKpeuRXIPXaGqdEGaOAje97fgg8jlxAk?=
 =?us-ascii?Q?JGPB62C4b4ZbZJUwr45LQA6usQDjgXMTR8TsARsSnZL6StG92w8zRWRsfx2i?=
 =?us-ascii?Q?GRPkFRiq5+iVHCLBkGzb5BN1XQ61DP5omo1w9/psWfk9eAoS6Cy5tTWcPozP?=
 =?us-ascii?Q?P/M0pK6lck7ruOF9kY7JDpAk39Ab1+rXRnuD1jN0nePesF/cJuXHLucn2DFk?=
 =?us-ascii?Q?ibuXL0KWOZnuK9kgVaFJ2DUAV4dbnrvfD0TYLaIqaEdTLhguE9mX8QnnMFtQ?=
 =?us-ascii?Q?sDBnMFDX3YTdP62x7xrdTGLfoeBkxdbWQ+FUvb5OzRKH20oTGCib/Ybh8fei?=
 =?us-ascii?Q?DV0dt4iuuHjH4qew4bX8Qq1LGbP5RxLyhQ3iyC6CFpNMmFgTO3wjDvf2oyHp?=
 =?us-ascii?Q?4gCa6fqNpkuBcRYh5Kpi5k3xTretrVMjV9pN/vQdn+IlvxU+SuWI+iSrU+2c?=
 =?us-ascii?Q?9tSqbBw+/l/QzzpfIITlspsXq/94LJweFdeL+tzRQebao/WwYQpBd2LnYQRr?=
 =?us-ascii?Q?PpmJeo7VmcrxoFaFEzpII+xTtMSdj5bVoJIq0EKmNtN0U9FvDxDB3MKn9NdT?=
 =?us-ascii?Q?tgfLxJ1xAjmVvMIY+tMLKZDeAxQysIMbVLtQYmtecQs6/KRbRq2mgkDo9Ho2?=
 =?us-ascii?Q?bDqUsHhAsgJbcAaxX9J04iUT78Msr8Mw5jWYgveeVboDWGrGCmrq63RFAG19?=
 =?us-ascii?Q?cNIcx3VyAgsZgMCwClRLbPrw6hf6I9bvHCSJN6Oaw0THIbgdI53zIikRLRBJ?=
 =?us-ascii?Q?riHvQyV3XN6MhiKyT22652OLxdt7ZZqZkg2JOYDBCfWFBMHp7nP8UcvuEKzq?=
 =?us-ascii?Q?lpDuhjx0FSArrH7RcsGMOyIO+9Lxp6CSQGtQGYqpVDkf+Q4IkV7V3TGN3EOS?=
 =?us-ascii?Q?zavgSW5bvYCmjJ8UDmY9YSXitWeoiUYpfKLVbaLBNdmpbhLZGCDzfYnGxK54?=
 =?us-ascii?Q?xCbxJuug0nHZxTrLN3P95QvNaWrYBIzD94AEErTVavzkWjctHS47KjADmxWs?=
 =?us-ascii?Q?PFuT5w0+dixXpZ5YE5qlw1BO27Yohmar/d5lCrCxxv2BGykj3g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?s7GfrJvZ0cXjlH1mG38Z/rbxIheJI4mGVV9XQb5nNyHthaUFouRJIaZf7IPk?=
 =?us-ascii?Q?4UcNCmF2Axf5iIv/lv6D872bIXfkhQCitwlfR09htr1FQjsM0q/OUMfTYiGx?=
 =?us-ascii?Q?EZ4PSmTXLnk3Rv71Gv0lc0PptBUevKkYVdVBJfCISdqlf6XWd8/mjLqo/WIO?=
 =?us-ascii?Q?m9KGUbEnR63OP1L8UQltq36ZsTU3u4W9P6ob5NccIUhS4NgVhlim7T7s9v8i?=
 =?us-ascii?Q?D3PxcWwEmap3iuBnpE/37RBBdLDTiYFfkBOM27FfNMmr2WWAS5GElOvFBvr/?=
 =?us-ascii?Q?ks6ReiOsrbOyfz5SmBsEgdrVC1gJcVdqSpNWnc+i1+XktIvTB7UUm1AFNpWZ?=
 =?us-ascii?Q?T9gnVceXCIpmSNK2Mmy4nD4h+ymGTPK6dpI0ENd2GkWAwsqL8gLxzzRX+9KY?=
 =?us-ascii?Q?jMfBJbzQlEonMTDM9v40HdcGHbpNs+hzEoQdoCFivrwyk8OQwMqpa6ZjUS8M?=
 =?us-ascii?Q?feyTkucNiWZbMwRZkb/t+J+V/nH7f4dpH/hbR7CxOYdJQuQ6YFnza32N2kgS?=
 =?us-ascii?Q?IcBSqSDCiSjf0ncSvwgpjuzdW/0iQMLojCn8SoWFL+zob6nQyw39r+WRQEH7?=
 =?us-ascii?Q?csg7mUPp+R4IcC/eUNKpoHoHhHCy0SZ5O3Z5uCQw4K7qCmZidAm3USmYiTnO?=
 =?us-ascii?Q?45atVJDWH06wbJlljqY+70cHXmVR4+AF/z93Bs8qw4ty2wQK9HRNXciEfwV2?=
 =?us-ascii?Q?eoisM5hw+u26IWejIR7aMm60nOisE6Ob6h51htTa8RO/4t/QOQpxd9et0Xmw?=
 =?us-ascii?Q?eOvLxv3cYyXBwxDF1ue291onK427pReX/2WZugZ+4lTr9ujpHn9iKoP71Rad?=
 =?us-ascii?Q?6w+aoAW4DD4lP/DUcQzZQGyeRuHenaJetq46c0JSGDE/OnMbAmtzLvGax1TC?=
 =?us-ascii?Q?52E2T3IVI3vORd3boqAYRP4gs55ouKczCIWkd2FThyKr/rjdilLzEm62n19M?=
 =?us-ascii?Q?hglM1UX6GVJf3LqijgK7zk/Vo4ldSE6qXFwQ92R+KJmZwzz5aMYVaxtohrlu?=
 =?us-ascii?Q?0rWiKBfbLaRHQQU9AMsMEMjoSGV+T2zEuK08jrUnFhzxMrr2bZaTFE12sLmC?=
 =?us-ascii?Q?Ux78qTiU4LYebVuC+RH1zAdQ3qwI1BgBMWBMOgysCD7TnuYuVi6OZn0VxsY6?=
 =?us-ascii?Q?VPfC6t2OxwLKGBlBqGxIxI6L0uJc8TDtNUrlmoPIMfueLvA6jIbHgIDNDFPe?=
 =?us-ascii?Q?acl3iRUKGUl8XTAuaaRT+mDUhyYSDStFnWDIDRT/hW4TWHwWpIAKz4LYyndt?=
 =?us-ascii?Q?Z+hni78O3FSo5hE7RukVgk1BBmlqke6v1sXYhXAR/d6vCLCr7AJhhbUr7WzD?=
 =?us-ascii?Q?KrQHDCxYPekJROYDrxqDH2/d4pOQX0IdWUL3Ykdiil8R5EGMz0vwz4glqy/J?=
 =?us-ascii?Q?HTWdisxJazJHa5U17iD1hTDVNUjWhpi/ojvUe+QveposDbwFZNCOsY8EFFtb?=
 =?us-ascii?Q?G9yFtSkek3iMJ1Jkqzy09oja4v7mXNKcGKWykyqst72l+d8Jfg5+MN4LiZFF?=
 =?us-ascii?Q?qCT0hHUVRUAPorVTqwWmBwNaLnZju7ke2c/64aRSAQfGaQNRSvz/HB4PV9uz?=
 =?us-ascii?Q?8wiykZjBFzW6hHFE3dLUj5xTw9kDyT6xF7IWpvIG?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b454ac8a-9d38-4a9a-252a-08dcd2d510fe
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 02:46:13.7283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +6HmZ7WKlyzyYBCuTHDfr9tIUqO7f7EMOlCPboz8I9f0gRDumQB+bmshFfb3Bi/LYrqRLirpP0QJqqGjICkKWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
X-Proofpoint-GUID: IqBfrI2Mk3EhuPBH2bRoLVSuT-OGUAdF
X-Authority-Analysis: v=2.4 cv=DZxFqetW c=1 sm=1 tr=0 ts=66e255f7 cx=c_pps a=fpyyTn7Kx2iM0+fj1eipXw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=VwQbUJbxAAAA:8 a=lcw-_RvqmVpt6WSkHXoA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: IqBfrI2Mk3EhuPBH2bRoLVSuT-OGUAdF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-11_02,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=940 lowpriorityscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409120020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Sep 2024 02:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112252

7668d820cadc simulate a MCE event happened during TDX guest context

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/mcelog/mce-inject_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mcelog/mce-inject_git.bb b/meta-oe/recipes-support/mcelog/mce-inject_git.bb
index a228c3cc0..08ec8c574 100644
--- a/meta-oe/recipes-support/mcelog/mce-inject_git.bb
+++ b/meta-oe/recipes-support/mcelog/mce-inject_git.bb
@@ -6,7 +6,7 @@ SECTION = "System Environment/Base"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mce-inject.git;branch=master"
 
-SRCREV = "4cbe46321b4a81365ff3aafafe63967264dbfec5"
+SRCREV = "7668d820cadce2da9d90b72aab14c3e637ca47d6"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.25.1


