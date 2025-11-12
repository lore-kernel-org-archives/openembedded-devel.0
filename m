Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC74CD1297
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 13:44:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13517.1762955064959199887
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 05:44:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nGrYoIRU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC3uhcD2252906
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=RmY/DOfDFeFsi6DkHCE7eKiw7Xav+6xosnwJ1FNnxts=; b=nGrYoIRUJTqF
	voAddns2tuQQx6GIQGATGOBfMCWu/qn2UZ6YrOzPStoMeBIpGJSVHm2po3MSmBxS
	JzVl14C04l9oz7ajpwr5vTeQG78RopNdT0YlperTVTtrt+xKRHfo9ckunr4JNJlu
	cTf+Ct1ujr3/heatE3OJ18pE69UlnAEAaDwcC1+IB9tMx9LETKqQ1UpcQLmPXDS/
	PMD452chOajEtnfkKRC8AWZbipKUAeGWsENl2Td8pJrylRsZmZwjFAIJ9Qtom4nC
	sPhAbmjwJE/H7x0CpdCO+4eHje15kJC5yQzDMFThZMgW08rgMD9LsEe1/atMa6n8
	GYxwL4vWnA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012068.outbound.protection.outlook.com [40.93.195.68])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9vu958y3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sIH+6mqar4o4bHFe8W4gTfpEkVMFBUG52v1gnIBy3FA4syX9+vlaC2zk/+wwfryk/IN0mvrbX3NhZ+PepOSf1bGhY73S3hjtLarcqeQ4uwV3xyXFXV9Uc8FGtNnhQcZ+wjij9KJ30yy6LZS7/s8LKGgn53BBXx3T9xH28Ydx5gV3Iiu+R3Od3grAd/jt8kHwBH/5dEajmSwZrhYauhJi2Ue1RZEfEwr/Lr3/5FRsbNYYAuO5iggxKY0POVB+45FGdEgpyJe5ix+E8lgz85w3hkxG00VvJB97zV3ZcilnYaiaZmTaYV/htlzdFrHH5C+UxcmzDbvK6dcssZs9NBFYEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmY/DOfDFeFsi6DkHCE7eKiw7Xav+6xosnwJ1FNnxts=;
 b=Esw6L4RdGT6J1R0yQSNQYXHWRbEUc3C2dqV/2gV6rlVPFZgfS2dzMU6he47mnw7HM1D+A3Dvgb+6ArcQUOxcJdLGcAWL0l60u3AN+c/G7OGbtLhXwODShcnM/W5C4W2RVtWAy1WEnWcYmnmE8Q8sbcag7/5lxRsg7A8MSL5i06bgPqvGMcu0zJoqgPq6mnGYwaQhWPNyn+GQDv3dD5YewEfV3BAS9z3yvvWfBex2ZGZ7T9jup4vfmvtNR3v9p9dE3i55exMAGw7PR3smD7rAuGBlmrv+0uVq5/rsuKeZjgpJj33F2EyNHGUijIDRxhZ+vINY8SZUXizcV/WSWhgHEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS4PPFABF58482A.namprd11.prod.outlook.com (2603:10b6:f:fc02::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 13:44:22 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:44:22 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 02/19] ade: add UPSTREAM_CHECK_GITTAGREGEX
Date: Wed, 12 Nov 2025 21:43:48 +0800
Message-Id: <20251112134405.3706508-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112134405.3706508-1-yi.zhao@windriver.com>
References: <20251112134405.3706508-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0125.apcprd03.prod.outlook.com
 (2603:1096:4:91::29) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS4PPFABF58482A:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f859d61-28f9-48cc-a6c7-08de21f19637
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ybEfLqschiG6xR7B0Yp7QUKDqWHhfmWGoo2o8MhBqPdAXwonpDBUujuYS64R?=
 =?us-ascii?Q?kT17CP4tyzXY6HqQDID69NLT+xRwd0cgJ8T0MW58zJzrm76r3R4WQ2ebohtU?=
 =?us-ascii?Q?oepuyfaV9CkRRFEZjIw1wtkVZfB/yxyCezHOkl5fy6nTCWd1ns1aVanG46yf?=
 =?us-ascii?Q?XxqaqyHQovyuLYghzrncIAH1UXXe+DU5m7dyP0aNz7ANVu9phthfG7SwTO6G?=
 =?us-ascii?Q?G2u2Qtil+txIAJPms3FjWLwbblnk4vn0t01g7fLq9Y7qYuzJ8PfC6yBSkLx5?=
 =?us-ascii?Q?uyUMb+uuMdmODMrVpGC7Lc1swxAG7L1UJ/URekGI78i48dKMNa3nebwMEvA3?=
 =?us-ascii?Q?Dz2asI1sbisvufjx3I3QqlWScGUDtgXbqKIrQbEUp1hOaIeBmJAQaTBs6siC?=
 =?us-ascii?Q?IdCWf/x8llV5SNmurAL+4oWgy568PVSx3oYflTlBN70Otr4BvlTejADSZZi5?=
 =?us-ascii?Q?pfa83GU874EREDCirp/dkw9GgVD3ioITL5H1AJh6ZZ/eBqVVtsPJvbYYwFd+?=
 =?us-ascii?Q?/jCEHh7f8TNUlK/EdoHGxkaw9rYrWNo9tVkI1wipET3bF591aVNekUe4IfAn?=
 =?us-ascii?Q?7uyaTBncGEYQ3s2Kk9jjs2FncsYnMMfWySfHcuvwtN2oNRhNqNK2t3TpVIBE?=
 =?us-ascii?Q?0DElsiZvSPK/i+c/4JD/EQsN/P1Us84T8tUjp7HB95FeFEGdUYYR8YabhouZ?=
 =?us-ascii?Q?3N/fZ+HXBwxRsRGl44BrIDIAPjeV3y2QJbLZBlcHNFYnQPPhNMGOTTNA4la6?=
 =?us-ascii?Q?k28GtVJgrZ8hITZtyesuL0fVN4dqUDOKzGMbHhBqL7T59CV0+jQkZwhmevK6?=
 =?us-ascii?Q?U7J5doBHqD4hTmDIS6fs50EosDPh8Wg5TBCWEXsaqb4plA5wUbF2u873/ZTB?=
 =?us-ascii?Q?HLTI8tOGcx4HNf/blfz5ClLqdnFwynG9Xaob9dKQGmhltWBQBWcmKXryTUPp?=
 =?us-ascii?Q?93X1aiYWSsJZ42bh3Yv8fIJQ8lM/wjZTvFxUjRNhfz89gsQHHiW17lb/+MOS?=
 =?us-ascii?Q?zp5Qfwg7miSAxdTctGLkMgxhHW/GkhjYrSXMjP/yDorvodty8QrceNaoBuWc?=
 =?us-ascii?Q?Cpc+pDE/hQCj9Ev0fOL4DCpttn3gt91ltIYQr3B8hW8egFFjHh8nVwBxT7p/?=
 =?us-ascii?Q?Lgfs4xJrhiiSEQNniDOVoE+UEursbtU9asCfM1e8QWQHB8KY0S69uYENRadK?=
 =?us-ascii?Q?CtoZ8R6DgUA5dU87M1HSA0G23QT3rdngfYIA+ZOTsfD+4OkxfYUy/PjrtxsX?=
 =?us-ascii?Q?at15BWtC01PzDrvkrwhoQ4BOLBtKUUY71Uv0yuFqAVluOtU9hiHMKbp7gqoq?=
 =?us-ascii?Q?V4/0fZxf7xtuOIgg+GjAZFdrwMNTp7Uh5/g8WWa6zcCacY78ybOkj1P5EagM?=
 =?us-ascii?Q?yoXquezByKs/5HcChLSMP5q1KazBiVTHTThzC4ULLJHI2Fdio1rXBBjv31nd?=
 =?us-ascii?Q?5XGSMigZd3uhmU/9y7vUfIZd4rMWoNEaaNAkaPzbFiUT1QM9l1JV4ek3ZbOM?=
 =?us-ascii?Q?17ASHZtdTVlh0mFgaHLGtKltVgEDRBPKGBhD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MSpif6pfyQRL/XnWQJi+o6fx2jtirCbnKdW+Qf7YyaUOoapz8RQdcL0ieC6j?=
 =?us-ascii?Q?mxAfr1iK+p62R+ufyQwU/sqBH2kH7m3rc/ZdBDMle8m/tJBv88vQIK8jnvfH?=
 =?us-ascii?Q?/lwlmpaazU6dRiUxx5TJCkLZq/1D9p41Au7Bq+mXJdSUZn3YCIWqpi++b1V3?=
 =?us-ascii?Q?OtsdwUUdCtUebRDfzgTTUOobfRvQ5ruS5WAwYKI8T0DQkNyZN2lq4FRXRvys?=
 =?us-ascii?Q?gs+HXiLKWjYE29k2QEm3WnlxlFkH5Kkk3Mg3G2NamXqtVpOfbiSy803xxOTR?=
 =?us-ascii?Q?mVrO2D8V16Oh61p0EbH33zzP9gmoYtwQDXSxqYR5TxpBxvXzxj16Hkj9Nf0n?=
 =?us-ascii?Q?7YY6D5kr/IgvRiTBSIMOcLli6/8/bTYyn3+ipT90JUhrRu3nZ6n5Xj+8Ycin?=
 =?us-ascii?Q?JDXK2h6tAf0zZxArWEcUnmQYFeJZ5CPzyttBFzKbTsH5MlSbB1Z8sN4YKNqu?=
 =?us-ascii?Q?PMYA/KVlAIggzlYVkEelJ8fPabZmhVQBisZY77+rYB9zE3axJ9eIy718yK9c?=
 =?us-ascii?Q?z6ZpJx9dYsd2hKLZPq3y48Br7BUn1+KIwhKKF6v+9vAN6jOXrxhKDy7ElIGu?=
 =?us-ascii?Q?xyVdIYPjwZoe2htNAmu22GIROwQQtOLzWXfGm82r3Dmuz+t6KS/QL47zGQAt?=
 =?us-ascii?Q?i7zunuZD3rv/FeuNwkEawvYOOd0Eoh73RK/shjTNtdIN0sodHNyLTKaBrvel?=
 =?us-ascii?Q?GFGwMH0ANBJaoefkouuFfwjbinokqcmxca1sdfoIdpCrHWIQugc7DkBCrEl7?=
 =?us-ascii?Q?2zRS2v7xONuoadbGufQTxUhRcEcMhUmP368TCdk9gotvXyU25mkmVmsTvwGB?=
 =?us-ascii?Q?kmG+6C0PMPqym8UGxBfCGtZS0wob1IG+ytDB0avJnj+mgr5fuYJCPP7amge+?=
 =?us-ascii?Q?g58rFKicT3KLP3avkT0Gd7bAVhvP77v6d0BWTF4NOYI9U76CNpBuk3bJ5pXV?=
 =?us-ascii?Q?kaPG/46R8xdy1yUS1YA+8ZAK3sYzLwmkqHIfU1BOAVbtM2PSqYraWATcVxLv?=
 =?us-ascii?Q?cDJH4tEsaEzoO5NsgICTXesIXf95yJ14D+TtQTpJ8RvVbdpDcpof2mau3PZr?=
 =?us-ascii?Q?JnkHJysuqRLimYulIytwY4hh5U/LutqgGH+tgEIhZpTU1N/F6ig+6ZBjiuQ+?=
 =?us-ascii?Q?O0mkAIk0MPY9QzUaBjlmNu/D+mY7xbu2shKR9oPI5ubX4VEs4L/uunT6nCSM?=
 =?us-ascii?Q?FM3W/YuNzExIZLbBIpare0GQiLNQDjaShF4fn8Lb7VkQp669SpFk80UN789q?=
 =?us-ascii?Q?X4cIkNoTazei+g4B1c3Jpj/ZY+aeZeyGElhPVmVfPffQMadIBZAi0XKCGjcK?=
 =?us-ascii?Q?RgntXDFMZ2qxDQASyxRZlJhx869SG4s6s6JLYu528nxZ/riLXNrZtqPRkltG?=
 =?us-ascii?Q?HPnKExcnJ1WApdh1OYw+7zaGR+8msksfryWN7ug+KY+ElYyYgSxc24UzSwdB?=
 =?us-ascii?Q?+Xh1ClBNgdEdFHWtXR1XyDFsM32jFDvHM5GWBbsNVH4yTl0Qc3//e5HgO1zI?=
 =?us-ascii?Q?yQv2xwF5wFfe/iYpuFU9TURc/tmFzB43+hsV3u4/KxcSgprGXHjW826EMudw?=
 =?us-ascii?Q?gJ7ZZjjmsT26hGShd4LPzjr9rmg+N5F65UOYw/qi?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f859d61-28f9-48cc-a6c7-08de21f19637
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:44:22.8031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kZQ8husSvfzJ6bSzHy+jIog3ehgzLYz1sP/Eul6TooqKJXuQkZQL8EOTaa0l69JiR8sGjS+Qu7byUofhVd6rEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFABF58482A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExMSBTYWx0ZWRfX395gB/qyDX3s
 Mpr/f6MWCGJT1ia/HWBJXaAS7aN57/FWLbvOhcjJDgQWsMOykMoBrfntqIXmqHfLvOR6s1eGBbA
 bcOt0fRdi7wJl31YRy14QZglqcZwFA0Yor7SsLfJd2qhFBLcJyIzcqpLw9hk2gFyxN1VUmsH85R
 zeR1+LiCU5cDIpS8cR05nWdO2dsuMOUQvRe0chTQJatQIOzGBBT4vL46BvuCPxAvrMI8DrVIm7Z
 p1r5L0upCFPqa+7bQ71QKsxw0KonlPFhdwuflCb+fgWgxEKxo4YRnplLYYYJkTKoDTZYB9FU9Dp
 uWO7QqoXXTWZY41aOkGiy7cRGuOoG1b9+Cqm5K0nuXwViqzOIpRypAdclwZaBdULZl1uvU5syvi
 kgeanAZTAKcjRmLkF/uqsfE8W7fzXg==
X-Proofpoint-GUID: aAnNhdPfLHeu6U9oqhk7GRLGuBx_qo8l
X-Proofpoint-ORIG-GUID: aAnNhdPfLHeu6U9oqhk7GRLGuBx_qo8l
X-Authority-Analysis: v=2.4 cv=CMknnBrD c=1 sm=1 tr=0 ts=69148f37 cx=c_pps
 a=VErjObUdaCniAoRVWXewiA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=MvoKV6MICsog2wME0pgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120111
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121530

Add UPSTREAM_CHECK_GITTAGREGEX to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version ade
INFO: Current version: 0.1.2e
INFO: Latest version: 0.1.2
INFO: Latest version's commit: ffc83ad372d72b16732f201d8a9d1d80dd16515b

After the patch:
$ devtool latest-version ade
INFO: Current version: 0.1.2e
INFO: Latest version: 0.1.2e
INFO: Latest version's commit: ffc83ad372d72b16732f201d8a9d1d80dd16515b

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/opencv/ade_0.1.2e.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/opencv/ade_0.1.2e.bb b/meta-oe/recipes-support/opencv/ade_0.1.2e.bb
index a7af2f2da9..a6ae4fdbec 100644
--- a/meta-oe/recipes-support/opencv/ade_0.1.2e.bb
+++ b/meta-oe/recipes-support/opencv/ade_0.1.2e.bb
@@ -10,6 +10,8 @@ SRCREV = "ffc83ad372d72b16732f201d8a9d1d80dd16515b"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+[a-z]?)"
+
 inherit cmake
 
 EXTRA_OECMAKE += " -DCMAKE_BUILD_TYPE=Release"
-- 
2.34.1


