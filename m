Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 321DACFC273
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 07:31:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7844.1728977505292079284
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Oct 2024 00:31:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=001810f469=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49F3L3Oj028151
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 00:31:44 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2049.outbound.protection.outlook.com [104.47.56.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 428jvmhpsm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 00:31:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPJAkLJ4uT9G3Tbgmr7eDLXBueEHTx5Jy2kaHMVTR5yefK/WzO58znaJE7zx3JbUVR2PrFtCKrCJL6+ttU3Z9jSxXrF0hB0OV6Ro+Kk5XMml46fDSc6BPt//ysPfXczixA88WcfO5U8DmTs33ZaXpGFTqhjI+0mMb0bQyi2rl7jDiFEMTzDx34xdTdq+i86jR/dWToNoLV8YnDh+UIAvv3O3UpxWm5QsB1TjDxk3hW/l+9ahFEfKYFjAp0eIL8Fqu5OmfHCjSS2rfLU/PFYJrrt+Ylq0cEVH9Du8blC6upX5elwvEswtLWac08GwgDD107F2Sq987UOH2VS6s4GpMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1W5hafsScKcn91mVFeSlvKYZKAwZSsVYMkV1kDaXhoE=;
 b=bFr5WR/inGgI2veEJGKbe2fuoPdQnJV0iDmvC2dj6FihCBmAuZa4wBXkBs0zhlc7W3tDFobwrM+x/b7vjJXwxCkoScOPNsZDYVNVCMABzuodOD42uP8Kh+foXtFDBNUfoA71p03zxVTCKLYN2ei3++iTUL/JHypiprhBqmv1wcjl8AXyrXq6WpmrtZtiIEw+eIVCtUgMECN72r81rywzoz5INC4oBCUPADUfpxP2guLdUOEYvS/VuO6qh+lek57tfbvzXMCV50Rb6rv/fsDCMcfC9heOMMt5+paFPc7JfLLwEKkuf2Vvr4a7QDzovsuvIQ/hUiCHIBScbgZIlcb91Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by PH7PR11MB6330.namprd11.prod.outlook.com (2603:10b6:510:1fe::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 07:31:42 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%4]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 07:31:42 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][kirkstone][PATCH 1/1] wireguard-tools:  clean the do_fecth warning
Date: Tue, 15 Oct 2024 15:31:25 +0800
Message-Id: <20241015073125.1695231-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0275.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::17) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|PH7PR11MB6330:EE_
X-MS-Office365-Filtering-Correlation-Id: 54bc0589-344b-4f02-580a-08dceceb69e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?INivtWT+vntP/02VCGoB/K3Pl0DsB/YWa2skH9DgXggQndfeZCJNKeqiE+d6?=
 =?us-ascii?Q?A0U+5qQ9jO1d/yAkeG4gx6F8Aa9fzr0aCYUdevAqauRee2ru6f96ag4Kttjw?=
 =?us-ascii?Q?nxeP88cC+rt7avUPXgHgmquVqGMSj70wnlWCZemi4Fwh29kSbZXTyKZisygB?=
 =?us-ascii?Q?TOoLQAWix7t63di8UbP3vrEw+x2EgEgmIxc4NG3vheEKJ4ZvtyzneVC5vik6?=
 =?us-ascii?Q?bweYpktt6N4aThjjP/ytyvkh1FtcrG8UgVFZzP68WCJPjPyimONXUF8iz944?=
 =?us-ascii?Q?Oaw8dxU07iXsBDh7glZ213iLebVV1kaSgzO6OIHOBCuTXwdQ9O0hy6nphdbI?=
 =?us-ascii?Q?yt0QH7K4/Ht1yWhyL8sITIbSaAuigJ6EK26eKj46PIkjAebRIkoO0j0KW/Kl?=
 =?us-ascii?Q?4vvbM1BKS+NKjyY3uOhFLsjTZlQhCFfD7xMtIHUnWvjtdAu4BbscDpK1zGGO?=
 =?us-ascii?Q?XXNAzpkhn9zzJ4XZ/3szmkoKKzXNmVzv+u/Q6os4AcQgFQHiZCjT+CU9vToo?=
 =?us-ascii?Q?pR6Egqi3bmsDD/LLqX9PHmNg060/A55ZGJK3S4jjukBpxTfykPt+okCK/hGl?=
 =?us-ascii?Q?I7ntI1dBTxbWPog7596hs4cLil3NxGoqt1N3GODroX/O9f5hKyLSvUyu2TBa?=
 =?us-ascii?Q?E2rsVjDpT0gSk+KJYZ6StosN69x/sUE7Xp4iiuL19gJRiVit21aD8yk74Sml?=
 =?us-ascii?Q?iddStVywU0jtOLRSUCsqJqu4T1dbBh0OGQfvqJr+JPI1cMN7I+pdO6SPUv3A?=
 =?us-ascii?Q?mqt2X3Nlkp0SbfSiBTgMYvtgkrARvonyIt5+wvWEab02R8s+G3dHOxXrdgzB?=
 =?us-ascii?Q?ufXOnUgJ0Z93F/3Y99o6rZaioyS/lWyH61ez2q4dYMYDrvLEJf91WB+UwaJ4?=
 =?us-ascii?Q?5C67CrRg/NGlC6f8AqZNEWEIYEfJEP+4Vmpu2vq86nXmh0/rushoQBSacf6K?=
 =?us-ascii?Q?F66zMrWzROYYqzYRtjT81jL7TQRhOerhleX+xb2LJyhxtpviQesKUJlOdczP?=
 =?us-ascii?Q?GIa7YOXmJhvK8bHXIpOPT2yragNoLV0HgKgn7/n//Wo2pYZNHieOFyadtSQl?=
 =?us-ascii?Q?mqAPyviHd2WRiBM+9c/7ofIzGZ9o/P4oslQUS28/FxgkgXl0jzeYaps+KsQr?=
 =?us-ascii?Q?oZBTfdXRxUqCiP2V0RScMOWyfEpNYCut4ebJGVgLjFFyLGveUscqbAep6TFl?=
 =?us-ascii?Q?1dXfDbSq9OUL7UORJqwxB5r3aBcbe0WxOv3qa/wuB9yv/7sIwOEUEXKiyTt2?=
 =?us-ascii?Q?hbHHrIFXWRopBw/tHfAbqqA/BjnRtM/uuu7ph8+JKVWWO4fyd1cktfqPL9ZR?=
 =?us-ascii?Q?82z7kYIl735t71A6wuVBOCnpCDn0AWJGcV5Go8a9xwh+rA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JwMd4+AHFk+gnBbrSSjkbICaQBM0rCxwzDLpX8l25N2SO/wKX1HpllFN2Sbb?=
 =?us-ascii?Q?C4EyhOLXnddtXbbniCJrTEztIwHuOXTVudRTG3eIM+8Qfsi8tfB2M4yWmXc0?=
 =?us-ascii?Q?xIMNt5Z8xRlBtYLCVk1JQGHUneUxJCVxelA4Yiijo51RuD72BFrpzrImkSXb?=
 =?us-ascii?Q?9uXQjoudbMLwfCEgKzw4PS/IQhxQpEnbfyZv0hYspWqgWru+lu68HWa6z0o7?=
 =?us-ascii?Q?CLC/BeklnmEPGv6Np3fGV1VaDN6HkdUlxA3SEcQ5XwJuPcmh7eGhMhpXwpee?=
 =?us-ascii?Q?8Orjm4V6t2mc3UWxwUHKMil1BCdrWTaVWIjPTCSXOuHhzW6dqoJtFfnlBcbW?=
 =?us-ascii?Q?h7rf1IIe+YdvNXuTAijcn0djdM/B3Wgl3XLFpm5VdHPZYtjn2oqXL6g8WOYT?=
 =?us-ascii?Q?4DgkDWzrJ6ALw2FPa92CzoIQBdreBzL7qh7AwfO6zLjVAOH/VIMnoeWNqGV1?=
 =?us-ascii?Q?7N3ML/8tVXVFqATdOE4QG3qMx5+DPd5SYfNnPUt8fVOzsIG5EFyZDJAmvWnn?=
 =?us-ascii?Q?MiZxpULm+HRq9BcuRN/4EK0xGkTkGtbfnuHEDJeB/VH+C3Ujt+IfJNqxzxr0?=
 =?us-ascii?Q?g4HASsRjgqODNm/98hrsRE1mvHoHlruR4uOVNG5Uwf49dU77i6Q9OVjbODqJ?=
 =?us-ascii?Q?o1mGrctd/kUI6uPLTUnZM1gdUMmBlhzntbfP9MjrfAkCu2ROaYWgq1hk+3Jv?=
 =?us-ascii?Q?xOYDnesjupQWPmNdQfvuHHVZoPto5bCQFXBn4Lbhavm/AaTQFsSnZ7QjD4yY?=
 =?us-ascii?Q?zY/a+QO06l7ohU/qutT4vTxVScxAFynEUxwhh/kHKElCjUPT3ntmkicVodxJ?=
 =?us-ascii?Q?N8W5ucVZtU7CiAUYUBAeQrapW31rK3wYs6mOuhB558R1D8gsKwm8i9Vr7K6y?=
 =?us-ascii?Q?62J7w2Z21GcDNfJtN73DSmXFYkUsZMycnfYw2kqgvg0mbRO9AFkHQPYSxz3/?=
 =?us-ascii?Q?GH9Y0BhrjlFZH/OiN+rqjX0Ej4XDp1HuA23WCxbQWZ+YVs9L1i4qcaZtSA1v?=
 =?us-ascii?Q?3R87nkqwzZW6QhaFr3363Pedj457EhvIx4+HD/EC6mb1RqJAiB+e0ZThITLI?=
 =?us-ascii?Q?EJX9NAlUF6/oxw/ANtpD3IlrGKuVTq2ds0LChG8bqvXymka+ygv4FfioaNlq?=
 =?us-ascii?Q?Qo/NsC8UrpTF5jU/1mKj+xiklQ/CGy3mh3UlEzvhsvfxZ1vQCASJDa5gpDEO?=
 =?us-ascii?Q?Tt1HQLLHZ7RYE+dLY4BptSMTCrUVyMTAsvHb+4VJWSYLRzUub7qGUu+dzTuI?=
 =?us-ascii?Q?SL9ADTUfS0qRYIYlzo6UFHg0v8CBgEr0W9a6Pa4XpjFTS3qRVbaofTrFBiVV?=
 =?us-ascii?Q?4IfPUrs1EItiUY4+wIzXiiFqlE0Cm/gbtxmaLw78QOXVpQO4gA1Eaq4FiEbi?=
 =?us-ascii?Q?Ujt+iOivlY78fOCP+8xfJIiQYjEMP7T/dCCPzPvnQ/CPJiVj4zcv1K+mOAIF?=
 =?us-ascii?Q?samHZOGZ0/1d+9fc08pfm0IV0w7Eu6cLfFfcR1bDOsivYKo0pVlrfnANzHbl?=
 =?us-ascii?Q?nXs4d6KdH3r8SrIsRiZuR6lFNZpA2giiJiPq7aO0DfuIlLGSpPITyuV6mIlI?=
 =?us-ascii?Q?W2p1pm7tl+LSx/Lu4eMyDxd7S9AhF1mduKZRHQPClJ23yLdoSgyvQYZElhJV?=
 =?us-ascii?Q?1g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54bc0589-344b-4f02-580a-08dceceb69e6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 07:31:42.0484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YCkj3y8FPjvt5hAgJk9KS1sjmxj8yJvC1siOfUm2+6/Oys8WvicvqjjIwooRGS/fLz1bA3tbI5Bv6mgdcz6IL+3Vl5rIyFRxRBG6gZdG+tU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6330
X-Proofpoint-ORIG-GUID: 7d3MpxCVTECn2lQZWS35j0_pecgrEtwU
X-Authority-Analysis: v=2.4 cv=arbgCjZV c=1 sm=1 tr=0 ts=670e1a60 cx=c_pps a=mbHLYBybxRkByWxHAZWYkg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2MUAHTJp_KMA:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=UGG5zPGqAAAA:8
 a=2lvbruORj4a1qGgLT30A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=17ibUXfGiVyGqR_YBevW:22
X-Proofpoint-GUID: 7d3MpxCVTECn2lQZWS35j0_pecgrEtwU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_04,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 adultscore=0 suspectscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 mlxlogscore=599 spamscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410150050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 07:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112925

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

Update SRC_URI, change the protocol to https.
do_fetch warning:
WARNING: wireguard-tools-1.0.20210914-r0 do_fetch: Failed to fetch URL
git://git.zx2c4.com/wireguard-tools;branch=master, attempting MIRRORS if
available

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 .../recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
index 20435338c375..efac808b758f 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
@@ -1,7 +1,7 @@
 require wireguard.inc
 
 SRCREV = "3ba6527130c502144e7388b900138bca6260f4e8"
-SRC_URI = "git://git.zx2c4.com/wireguard-tools;branch=master"
+SRC_URI = "git://git.zx2c4.com/wireguard-tools;branch=master;protocol=https"
 
 inherit bash-completion systemd pkgconfig
 
-- 
2.25.1


