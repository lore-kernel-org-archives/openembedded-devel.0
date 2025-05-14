Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF208C3ABDD
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 08:20:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.97349.1747210829440855926
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 May 2025 01:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7229598d4b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E5iPHG014893
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 May 2025 01:20:29 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46mbca0sux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 May 2025 01:20:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p//+6+xwYDddqNZBtKDODVpScezKTpKdLpolJqxZnbfsGrhIlf01B44qMtOFvTuLcTKqEJwQlNqIc0WJYvgtMIlkSqp+Duodl/6Y5Mji1gpKaFYPnaWN3M+EFzeOYgTtJOy5pghN9zxP8N+sRWPzWqCDbQr1VVZU2Iws81FR/9Qvi4eVEhdIi46VTsBHS74iWC5ecK1Oi4oDrrzCoDSk247gRnbwxgyDyi6HIY6avJwP8/B/5TXlBz/D7IaND3GmHVoM7XocMxA8GQnwj4+QetKoU7UItFf510w7T0EpoflstkzwERyBGxa8+uBkcEiLFS8NOpSl1M1Qe7LiUmIk7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3Xt+vyKWioM3dHQld5rVv0T8PXs5bhNaFQDTHhAloM=;
 b=aQZf9a4W3bGDs7BbIPAVAR+R04I82p4mt8R8jWeVRQrnM9E46XZ03CVuEzi7YhI8JoY8Bm4/Yytc/1Ke22Cs7BmjXEo7P/QnJC+DlOWkylSttETbJ6ST0JCOVn1mfiyH8EX31ZDNo2ap16eHg4RTQzGQXM+cLneqR2OEjvVV3y+hrrCKp/rQvCKVpfxlk45GaPKKZJm5ncRB8pS2kAT30wUPfyh40DYy+47DUuTivnNOnMtXbiWWIRCnJ0a/bw9FmPKETvInIJDQhdEdFtHRdUXpGRhXHHIPhXZgDKFYRodX2GrHzNRtUuFaRDUEj3MvS5LYEvPsxzejEzfx89fPVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 LV3PR11MB8742.namprd11.prod.outlook.com (2603:10b6:408:212::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 14 May
 2025 08:20:25 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 08:20:25 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [walnascar][PATCH 2/2] nmap: add recipe for 7.92
Date: Wed, 14 May 2025 16:20:07 +0800
Message-Id: <20250514082007.1128117-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514082007.1128117-1-yi.zhao@windriver.com>
References: <20250514082007.1128117-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0032.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::19)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|LV3PR11MB8742:EE_
X-MS-Office365-Filtering-Correlation-Id: a039e031-662c-4dcf-37bd-08dd92c02d83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YUjf/o3PLtk96SFIyrWsNeyCOhp3yCvl1DEJ+0a1rWJGcy1/q0uCsmQuOaR2?=
 =?us-ascii?Q?dgOojk4LoUTQ+/Kj2joOApeiAQwWSJAY3+2RBUIIm9KBIgNtX4YSRPCHCbgR?=
 =?us-ascii?Q?bXfoZvuxtypX8O6t17NUWSP4mcaiqFzzw7Mi3yOshfRZhxzL6gSSvXXceFSK?=
 =?us-ascii?Q?xqC1IPYvAuIJs/XMlvLOwlkYUN9/geyrEY9pV7HYXfme4TD+pbpt0+lL4QYC?=
 =?us-ascii?Q?+9QyRmkvh3bu9GlhVGgJH4lCe80jI1k2FDUM/Z+nxjTt7S/OiNWkg23lMZeQ?=
 =?us-ascii?Q?rEF31ytyk5pgDp03TV2u+WFERSH/kfUrdZBh/Lwg8diAtt990fycCKK9j7/W?=
 =?us-ascii?Q?bk4rHnYFt2U5+0JilRdRfznQjN3AvSed9rrgdXu4E2IhMw9TYr7bVyn8Nur+?=
 =?us-ascii?Q?YYafOJzsDPt+ljknjEDaB+kFxgxB/nmiwdOV2lD4oVFitX2G7IlgElBGfxiR?=
 =?us-ascii?Q?Khzx46naBhSRo/12nDmGA82DlLvjpzIOuJEPEpRP5Wpry+Aujj9nnTXYIW4Y?=
 =?us-ascii?Q?60TfFC5k6sBcXzP1I/Ktj7+sPGwU8+KBgqT5xuCThjLrntAocD9j+OTiaR58?=
 =?us-ascii?Q?uvJlOJYRVKHMbCba/3CZCP2PBBQfkH0J9tM/bPrJjlPr/7z6nCQp11cBruwW?=
 =?us-ascii?Q?mjVgaw6WPbO8HCVr9lxvhN4cg17qUrvF/Se5Vex9mudd2xxt6m0tE/Kd/CG1?=
 =?us-ascii?Q?dU+ZsODzOhI9m1DTeM0a0KCAYOEln7eSw6Y3QO7jcb+SjiRW33XTdB261CGy?=
 =?us-ascii?Q?QosJvBF7tgotQ4eiwvR3sXiw52GpeyBeHgl5+1Ysy0AXvnwAaJHulhWHkVgw?=
 =?us-ascii?Q?Do0ShpKqpnR3EqIYKlOBHHyzDvFIWbNULTwWZFTS+HPpnka5+3CYwjAg4z1G?=
 =?us-ascii?Q?iilQ5T882gqi0uUt7OCGwFZLuRURQEpybc1kqKsucsCihE7c20VtrUb6UUsZ?=
 =?us-ascii?Q?fJ67BoHTQuSCvawain8kYqbB3p8hcE8ueefX5yAgt2GN+dZnx0vJlpHxX3t9?=
 =?us-ascii?Q?C4uFe3A/IFdf8O7TTzMzP0G5vFopM1w8ENvwOUPL68hBxXQBZfQsajUuEJcx?=
 =?us-ascii?Q?Pa3NaOrtyMzhfh12RvmwJUX+cV0hkGAsdOCNs9PuMoSDgp2CAkK70V6N136G?=
 =?us-ascii?Q?yuN+g5CwqAxVwk6RAKD7+N0vchzUE8Jo+CzFxFJOnSHtdv8vkfKGOJRFWLZ/?=
 =?us-ascii?Q?B2QI4YSlsTa6j/ecJpNVweEym5fqk1WurBGmRcYiO8h3uP/CSjiI5WP56R94?=
 =?us-ascii?Q?88WP0gYNd0H54hujJPILN1fqMl1YMLOj8Yu3vTBtOCIF6ttDQQ39P3bsA/jV?=
 =?us-ascii?Q?WQxNZiPtA1Nk85oeoOoXfCLqyLyfxB3PZ6o0Di6YRPm6V8kNORT2KlqZj/vc?=
 =?us-ascii?Q?DsTWLbIhaL43MGXzwERWwYkOqgwcBmKaZl9ldMXEqkesW1wj5AJLif+2o2nu?=
 =?us-ascii?Q?qJludo0/1pM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fsbPAZd8W6NJlK87RHVl1jNYk0dhU83S4dHZirzPOGfIGlPlv9Estw5Gz1Cn?=
 =?us-ascii?Q?z5CsBpmYd90eawtOpCdKQmRaFTqfc7MUOVJKYFOZRFYgPmk62gaVdCuArSMg?=
 =?us-ascii?Q?tXKnmavsn/Ia3Uedkho5WuglDwolV2ml7xbiPsM+Gfhm79Mlqu39rnocDkSG?=
 =?us-ascii?Q?9c2RWrikWSNNkBF282HhK84lHyie6JLL5he26XDyLkQ8tPZYjxBPd5IlZApz?=
 =?us-ascii?Q?JUg4c5GIdGv5v9tuTyRGpbgQzYQFKMKgGF/NsI1pJ5jCJ4YEjN44pt1eAPtN?=
 =?us-ascii?Q?xy/XbB1W21QBc5/gRH0Rtt+NH0yAJVeIpKl71Mtjf0aFUwlru8PUH66GHSGT?=
 =?us-ascii?Q?knmn5k8shEomfh/zAYKoxBDsFOSHlexTd1RDdfM6LkDJRQB4NswpWUXzhZXq?=
 =?us-ascii?Q?aLO+/RFdHVwS+kyB3GudqgVynjNPSi/MSmiV6IBOVrb6fEVNG7Po2Av47mTh?=
 =?us-ascii?Q?hRAj8O42zvTddoOoI+LvjhUMJpii0QQ0Qcz+v0i/BRvhjESdIgZG/3Q47S0I?=
 =?us-ascii?Q?NqXCm9oMuuNKbS/AHb9tFWAzvOUkjzS67vfAcICiyoLM2QsWmxtK3bqc78ZN?=
 =?us-ascii?Q?bleBsjDG+uk1xpfRFD0mVtd4prIeTX3h+hCJNQcsLFhHvdbGko1Nh+dFhvS2?=
 =?us-ascii?Q?UYb7ej/jAN9MFeG3ROEIqK0bjeV8ElGeW8yLeQw/y2VQ7+bd27GfW+LMJQhg?=
 =?us-ascii?Q?74w50rec7Avz7jMCiE/DfnpQakj61S6KiXv8gGzMSDJcE37oFl3PKNrh37K/?=
 =?us-ascii?Q?beIEE0+VxyXGWFFYk69h8G3A3y+cY9afBKFcq6SyZ8/SaTaBMkRFXWmAAuqM?=
 =?us-ascii?Q?1axjsLC9uIx67LHmwDCIgmR1cONsWaM+eu+THUaMRnI8BkT0ZkE/Q9x6pndn?=
 =?us-ascii?Q?qwLyeysgMeXfGwXgu9hymoYt5SwEqC70diDEkx2SH1ynxlMQ/+QFWewMvYGW?=
 =?us-ascii?Q?+wArtTQj1lpaw/BvPFUnUbg6NR+HEp57TweSpL0D82WDcR5ILryFUKlgqojg?=
 =?us-ascii?Q?9dJ2dYO+qgN1ZMvM1HSOyKGq4zBRof7QLJoh9jSnCBRfm+iAgg9lbnkZtz9B?=
 =?us-ascii?Q?6HE0UzL4X39P2Zcl3O+ldTIF0Ddo1SCg5Ni8z/X79KqhfQQILFTaFONdZbkw?=
 =?us-ascii?Q?p9IInXa9kvXOpx/HeFSyTL20rOuhtoHSHgpBqESBR7MsQYcobezNsMWzNT3x?=
 =?us-ascii?Q?+prOjkVdRjvYEG7Q2mPpAGb/7wNLa/t62hoklED+/1HQUNj/WvnMjm/7EhjK?=
 =?us-ascii?Q?X1sY6tlO20z4qky6bNZKY17jP187h5Uz1AsR8mmN4mUAW8bmvt10ZSVUL6Je?=
 =?us-ascii?Q?ttkH3Z0lmYAZh5rHbQ3PbEaK0KnyApUuUcVwR5uM/oHNq72f9Fw5+n28H3e3?=
 =?us-ascii?Q?P8SSP00KT7g90mq5wPTxbZ6BlQOrPP0ie7fX8f1Efc0RcaJ6B9jr2wbTLUcE?=
 =?us-ascii?Q?avUNFMJyYLBXuFRlRIysEcjvPUvOjSawD3hr/COImPe3u/EFToN3hx3Lzqp8?=
 =?us-ascii?Q?smMLarJ+s5CTDPrM480haFa8VpDDALGrTWoGDv2pW6AWQdxrF8H1zv9qO5VR?=
 =?us-ascii?Q?xbZzpOAR8RRI0VwbZHjJ3qGeoctcnq8wa0p7bGKO?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a039e031-662c-4dcf-37bd-08dd92c02d83
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 08:20:25.3129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yuNYaj8Obw6Euqt3SxD8VdyP8Af8WraleE4KzttQEkItxSz9uoXSJ5Gn6CR8QrQtibSpmOZkPWnD5kvdSXfE4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8742
X-Proofpoint-ORIG-GUID: e2pxDL1ReEsvqVk7GcEUFh9Z6wLr1nGu
X-Authority-Analysis: v=2.4 cv=P446hjAu c=1 sm=1 tr=0 ts=6824524c cx=c_pps a=wMNeujlvNozESTkKEiiyVQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=auHYCxwYAAAA:8 a=07d9gI8wAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=VVTqxq01RwSPQkx8PyoA:9 a=sqfIHldIKiMA:10 a=67XU6oJk2Lrwzah0vfu5:22 a=e2CUPOnPG4QKp8I52DXD:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: e2pxDL1ReEsvqVk7GcEUFh9Z6wLr1nGu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA3MSBTYWx0ZWRfX+reF2olxHmlp P8dVfUNDLeAv2TJ58gkZigzQg3sz43xKFNOJaEJnHrAiebt8CE+htoZE7XB8ALU0ru+mBEh/pzN AwlTUPTo0KMIER95c9UyPpJW+JCHsg/2KshoTyKDVrvAuqiCVoQe4YIik/Kq7XbfzlajCxsaM5U
 onOKWXGrmYQD67n8iIRpYXTLC/+/xc7oH6A6U7m/P9ptswJG0lFMIgoRa82dHSUVebMbY1fu70W 71FzAxYEvnrU3wQo/Pc6xbuvf8mztyGSAuwFW070Oc5PK2T+ybA8i2N/k39HxMl4wmD1+N6pCtP rP2lRVQtT1OiD7msRUFyj2KCxDkV7LCwuBRr8EYGw3Gatl5hVUYD5P8VFZ/oShXb+TDbVP6QM5N
 +HnEQIDKFCz7BbLFtTsAHB48qXqszLtcqBPXRV8/ehqqC/iNC9D4ESbMHkzxlb4z6uATVpxN
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 mlxscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505140071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 May 2025 08:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117412

The nmap has changed its license to NPSL (Nmap Public Source License)
since 7.90[1][2]. See [3] for a discussion of this license.

According to [1] and [4], 7.92 is the last dual-licensed (GPL-2.0 and
NPSL)version:
"Note that some releases of Nmap may fall under a previous version of
this license, or a different license entirely. The exact terms for a
given version of Nmap can be found in the included LICENSE or COPYING
file. To ease the transition to the NPSL, the first three Nmap releases
made under that license (Nmap 7.90, 7.91, and 7.92) may also be used
under the previous Nmap license terms by anyone who prefers those. "

Add 7.92 recipe with GPLv2 license.

[1] https://nmap.org/npsl/
[2] https://lwn.net/Articles/842436/
[3] https://github.com/nmap/nmap/issues/2199
[4] https://nmap.org/changelog.html#7.92

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...efine-the-python-library-install-dir.patch | 31 ++++++++
 ...l-mkdir-with-coreutils-mkdir-command.patch | 38 +++++++++
 ...e.h-header-to-pass-clang-compilation.patch | 76 ++++++++++++++++++
 .../0004-Fix-building-with-libc.patch         | 79 +++++++++++++++++++
 ...ing-between-build-ncat-and-build-lua.patch | 55 +++++++++++++
 .../0006-Fix-build-with-libpcap-1.10.5.patch  | 47 +++++++++++
 meta-oe/recipes-security/nmap/nmap_7.92.bb    | 66 ++++++++++++++++
 7 files changed, 392 insertions(+)
 create mode 100644 meta-oe/recipes-security/nmap/nmap-7.92/0001-redefine-the-python-library-install-dir.patch
 create mode 100644 meta-oe/recipes-security/nmap/nmap-7.92/0002-replace-.-shtool-mkdir-with-coreutils-mkdir-command.patch
 create mode 100644 meta-oe/recipes-security/nmap/nmap-7.92/0003-Include-time.h-header-to-pass-clang-compilation.patch
 create mode 100644 meta-oe/recipes-security/nmap/nmap-7.92/0004-Fix-building-with-libc.patch
 create mode 100644 meta-oe/recipes-security/nmap/nmap-7.92/0005-fix-racing-between-build-ncat-and-build-lua.patch
 create mode 100644 meta-oe/recipes-security/nmap/nmap-7.92/0006-Fix-build-with-libpcap-1.10.5.patch
 create mode 100644 meta-oe/recipes-security/nmap/nmap_7.92.bb

diff --git a/meta-oe/recipes-security/nmap/nmap-7.92/0001-redefine-the-python-library-install-dir.patch b/meta-oe/recipes-security/nmap/nmap-7.92/0001-redefine-the-python-library-install-dir.patch
new file mode 100644
index 0000000000..6298f7ea26
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/nmap-7.92/0001-redefine-the-python-library-install-dir.patch
@@ -0,0 +1,31 @@
+From 67b4614ea529460dca9326bfe5d355bad6f9bdee Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Sun, 27 Apr 2025 16:33:08 +0800
+Subject: [PATCH] redefine the python library install dir
+
+If install-lib is not defined, it is always /usr/lib/, but it
+maybe /usr/lib64 for multilib
+
+Upstream-Status: Pending
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index ccfceda..6b25d27 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -387,7 +387,7 @@ build-nping: $(NPINGDIR)/Makefile build-nbase build-nsock build-netutil $(NPINGD
+ 	@cd $(NPINGDIR) && $(MAKE)
+ 
+ install-ndiff:
+-	cd $(NDIFFDIR) && $(PYTHON) setup.py install --prefix "$(prefix)" $(if $(DESTDIR),--root "$(DESTDIR)")
++	cd $(NDIFFDIR) && $(PYTHON) setup.py install --prefix "$(prefix)" --install-lib="${PYTHON_SITEPACKAGES_DIR}" $(if $(DESTDIR),--root "$(DESTDIR)")
+ 
+ NSE_FILES = scripts/script.db scripts/*.nse
+ NSE_LIB_LUA_FILES = nselib/*.lua nselib/*.luadoc
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-security/nmap/nmap-7.92/0002-replace-.-shtool-mkdir-with-coreutils-mkdir-command.patch b/meta-oe/recipes-security/nmap/nmap-7.92/0002-replace-.-shtool-mkdir-with-coreutils-mkdir-command.patch
new file mode 100644
index 0000000000..f81e230b28
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/nmap-7.92/0002-replace-.-shtool-mkdir-with-coreutils-mkdir-command.patch
@@ -0,0 +1,38 @@
+From 783333de42b06020f5c0852c415cd34972a773fb Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Sun, 27 Apr 2025 16:35:11 +0800
+Subject: [PATCH] replace "./shtool mkdir" with coreutils mkdir command
+
+"./shtool mkdir" is used when mkdir has not -p parameter, but mkdir in
+today most release has supportted the -p parameter, not need to use
+shtool, and it can not fix the race if two process are running mkdir to
+create same dir
+
+Upstream-Status: Pending
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ ncat/Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ncat/Makefile.in b/ncat/Makefile.in
+index 4632a78..11a5e7c 100644
+--- a/ncat/Makefile.in
++++ b/ncat/Makefile.in
+@@ -166,11 +166,11 @@ $(NSOCKDIR)/libnsock.a: $(NSOCKDIR)/Makefile
+ 
+ install: $(TARGET)
+ 	@echo Installing Ncat;
+-	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
++	mkdir -p -m 755 $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
+ 	$(INSTALL) -c -m 755 ncat $(DESTDIR)$(bindir)/ncat
+ 	$(STRIP) -x $(DESTDIR)$(bindir)/ncat
+ 	if [ -n "$(DATAFILES)" ]; then \
+-		$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(pkgdatadir); \
++		mkdir -p -m 755 $(DESTDIR)$(pkgdatadir); \
+ 		$(INSTALL) -c -m 644 $(DATAFILES) $(DESTDIR)$(pkgdatadir)/; \
+ 	fi
+ 	$(INSTALL) -c -m 644 docs/$(TARGET).1 $(DESTDIR)$(mandir)/man1/$(TARGET).1
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-security/nmap/nmap-7.92/0003-Include-time.h-header-to-pass-clang-compilation.patch b/meta-oe/recipes-security/nmap/nmap-7.92/0003-Include-time.h-header-to-pass-clang-compilation.patch
new file mode 100644
index 0000000000..b940124f98
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/nmap-7.92/0003-Include-time.h-header-to-pass-clang-compilation.patch
@@ -0,0 +1,76 @@
+From e9d876bedc8a7bc96856ecf38bbeeafee2d5b206 Mon Sep 17 00:00:00 2001
+From: Peiran Hong <peiran.hong@windriver.com>
+Date: Fri, 20 Sep 2019 15:02:45 -0400
+Subject: [PATCH] Include time.h header to pass clang compilation
+
+Upstream-Status: Pending
+
+Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
+---
+ nmap_error.cc       | 11 +----------
+ nping/EchoServer.cc |  1 +
+ osscan2.cc          |  1 +
+ service_scan.cc     |  1 +
+ 4 files changed, 4 insertions(+), 10 deletions(-)
+
+diff --git a/nmap_error.cc b/nmap_error.cc
+index 5ec938f..83ba6cc 100644
+--- a/nmap_error.cc
++++ b/nmap_error.cc
+@@ -67,16 +67,7 @@
+ #include "xml.h"
+ 
+ #include <errno.h>
+-#if TIME_WITH_SYS_TIME
+-# include <sys/time.h>
+-# include <time.h>
+-#else
+-# if HAVE_SYS_TIME_H
+-#  include <sys/time.h>
+-# else
+-#  include <time.h>
+-# endif
+-#endif
++#include <time.h>
+ 
+ extern NmapOps o;
+ 
+diff --git a/nping/EchoServer.cc b/nping/EchoServer.cc
+index dea2851..c80efb4 100644
+--- a/nping/EchoServer.cc
++++ b/nping/EchoServer.cc
+@@ -69,6 +69,7 @@
+ #include "NpingOps.h"
+ #include "ProbeMode.h"
+ #include <signal.h>
++#include <time.h>
+ 
+ extern NpingOps o;
+ extern EchoServer es;
+diff --git a/osscan2.cc b/osscan2.cc
+index efe6da0..392c65f 100644
+--- a/osscan2.cc
++++ b/osscan2.cc
+@@ -80,6 +80,7 @@
+ 
+ #include <list>
+ #include <math.h>
++#include <time.h>
+ 
+ extern NmapOps o;
+ #ifdef WIN32
+diff --git a/service_scan.cc b/service_scan.cc
+index 66e0d92..161f2a1 100644
+--- a/service_scan.cc
++++ b/service_scan.cc
+@@ -77,6 +77,7 @@
+ #include "nmap_tty.h"
+ 
+ #include <errno.h>
++#include <time.h>
+ 
+ #if HAVE_OPENSSL
+ /* OpenSSL 1.0.0 needs _WINSOCKAPI_ to be defined, otherwise it loads
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-security/nmap/nmap-7.92/0004-Fix-building-with-libc.patch b/meta-oe/recipes-security/nmap/nmap-7.92/0004-Fix-building-with-libc.patch
new file mode 100644
index 0000000000..295abe6d50
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/nmap-7.92/0004-Fix-building-with-libc.patch
@@ -0,0 +1,79 @@
+From 4c54b00e6f3749924532c2636eae01daff9e4bcd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 20 Jan 2019 23:11:56 -0800
+Subject: [PATCH] Fix building with libc++
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ nping/EchoServer.cc | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/nping/EchoServer.cc b/nping/EchoServer.cc
+index c80efb4..914bd54 100644
+--- a/nping/EchoServer.cc
++++ b/nping/EchoServer.cc
+@@ -214,14 +214,14 @@ int EchoServer::nep_listen_socket(){
+         server_addr6.sin6_len = sizeof(struct sockaddr_in6);
+     #endif
+     /* Bind to local address and the specified port */
+-    if( bind(master_sd, (struct sockaddr *)&server_addr6, sizeof(server_addr6)) != 0 ){
++    if( ::bind(master_sd, (struct sockaddr *)&server_addr6, sizeof(server_addr6)) != 0 ){
+         nping_warning(QT_3, "Failed to bind to source address %s. Trying to bind to port %d...", IPtoa(server_addr6.sin6_addr), port);
+         /* If the bind failed for the supplied address, just try again with in6addr_any */
+         if( o.spoofSource() ){
+             server_addr6.sin6_addr = in6addr_any;
+-            if( bind(master_sd, (struct sockaddr *)&server_addr6, sizeof(server_addr6)) != 0 ){
++            if( ::bind(master_sd, (struct sockaddr *)&server_addr6, sizeof(server_addr6)) != 0 ){
+                 nping_fatal(QT_3, "Could not bind to port %d (%s).", port, strerror(errno));
+-            }else{ 
++            }else{
+                 nping_print(VB_1, "Server bound to port %d", port);
+             }
+         }
+@@ -252,12 +252,12 @@ int EchoServer::nep_listen_socket(){
+ #endif
+ 
+     /* Bind to local address and the specified port */
+-    if( bind(master_sd, (struct sockaddr *)&server_addr4, sizeof(server_addr4)) != 0 ){
++    if( ::bind(master_sd, (struct sockaddr *)&server_addr4, sizeof(server_addr4)) != 0 ){
+         nping_warning(QT_3, "Failed to bind to source address %s. Trying to bind to port %d...", IPtoa(server_addr4.sin_addr), port);
+         /* If the bind failed for the supplied address, just try again with in6addr_any */
+         if( o.spoofSource() ){
+             server_addr4.sin_addr.s_addr=INADDR_ANY;
+-            if( bind(master_sd, (struct sockaddr *)&server_addr4, sizeof(server_addr4)) != 0 ){
++            if( ::bind(master_sd, (struct sockaddr *)&server_addr4, sizeof(server_addr4)) != 0 ){
+                 nping_fatal(QT_3, "Could not bind to port %d (%s).", port, strerror(errno));
+             }else{
+                 nping_print(VB_1, "Server bound to port %d", port);
+@@ -493,7 +493,7 @@ clientid_t EchoServer::nep_match_headers(IPv4Header *ip4, IPv6Header *ip6, TCPHe
+                             nping_print(DBG_3, ";");
+                             /* The payload magic may affect the score only between
+                              * zero and 4 bytes. This is done to prevent long
+-                             * common strings like "GET / HTTP/1.1\r\n" 
++                             * common strings like "GET / HTTP/1.1\r\n"
+                              * increasing the score a lot and cause problems for
+                              * the matching logic. */
+                             current_score+= MIN(4, fspec->len)*FACTOR_PAYLOAD_MAGIC;
+@@ -503,7 +503,7 @@ clientid_t EchoServer::nep_match_headers(IPv4Header *ip4, IPv6Header *ip6, TCPHe
+                     default:
+                         nping_warning(QT_2, "Bogus field specifier found in client #%d context. Please report a bug", ctx->getIdentifier());
+                     break;
+-                }           
++                }
+             } /* End of field specifiers loop */
+ 
+             nping_print(DBG_3, "%s() current_score=%.02f candidate_score=%.02f", __func__, current_score, candidate_score);
+@@ -582,7 +582,7 @@ clientid_t EchoServer::nep_match_packet(const u8 *pkt, size_t pktlen){
+                 }else{
+                     if( (tcplen=tcp.validate())==OP_FAILURE){
+                         return CLIENT_NOT_FOUND;
+-                    }else{                        
++                    }else{
+                         if( (int)pktlen > (iplen+tcplen) ){
+                            if( payload.storeRecvData(pkt+iplen+tcplen, pktlen-iplen-tcplen)!=OP_FAILURE)
+                                payload_included=true;
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-security/nmap/nmap-7.92/0005-fix-racing-between-build-ncat-and-build-lua.patch b/meta-oe/recipes-security/nmap/nmap-7.92/0005-fix-racing-between-build-ncat-and-build-lua.patch
new file mode 100644
index 0000000000..f660719640
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/nmap-7.92/0005-fix-racing-between-build-ncat-and-build-lua.patch
@@ -0,0 +1,55 @@
+From c1b436da46a7e3089b657f3f92308defc0ebb735 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sun, 9 Feb 2025 00:45:36 +0000
+Subject: [PATCH] fix racing between build-ncat and build-lua
+
+There are two build-lua rules, one in Makefile.in, another in
+ncat/Makefile.in which is required by build-ncat
+
+Build them may cause potential racing
+
+$ bitbake lib32-nmap
+$ grep -e "Compiling liblua" -e 'nmap-7.95/liblua' -e ": error" -n patch-to/temp/log.do_compile
+Compiling liblua
+make[1]: Entering directory 'path-to/build/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
+Compiling liblua
+make[2]: Entering directory 'path-to/build/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
+make[2]: Leaving directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
+path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/recipe-sysroot-native/usr/bin/i686-wrsmllib32-linux/../../libexec/i686-wrsmllib32-linux/gcc/i686-wrsmllib32-linux/14.2.0/ld: ./../liblua/liblua.a: error adding symbols: no more archived files
+collect2: error: ld returned 1 exit status
+make[1]: Leaving directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
+
+Explicitly make build-ncat depends on build-lua to avoid racing,
+after applying the patch
+...
+Compiling liblua
+make[1]: Entering directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
+make[1]: Leaving directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
+Compiling liblua
+make[2]: Entering directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
+make[2]: Leaving directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
+...
+
+Upstream-Status: Submitted [https://github.com/nmap/nmap/pull/3025]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 6b25d27..b0a2719 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -159,7 +159,7 @@ build-netutil: libnetutil/Makefile
+ 	@echo Compiling libnetutil;
+ 	cd libnetutil && $(MAKE)
+ 
+-build-ncat: $(NCATDIR)/Makefile build-nbase build-nsock $(NCATDIR)/ncat.h @PCAP_BUILD@
++build-ncat: $(NCATDIR)/Makefile build-nbase build-nsock build-lua $(NCATDIR)/ncat.h @PCAP_BUILD@
+ 	cd $(NCATDIR) && $(MAKE)
+ 
+ build-lua: $(LIBLUADIR)/Makefile
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-security/nmap/nmap-7.92/0006-Fix-build-with-libpcap-1.10.5.patch b/meta-oe/recipes-security/nmap/nmap-7.92/0006-Fix-build-with-libpcap-1.10.5.patch
new file mode 100644
index 0000000000..4ee4a7295e
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/nmap-7.92/0006-Fix-build-with-libpcap-1.10.5.patch
@@ -0,0 +1,47 @@
+From ba7b4a8cc570f0ce154f186fbe840f0ac23b2b96 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Mon, 28 Apr 2025 10:04:46 +0800
+Subject: [PATCH] Fix build with libpcap 1.10.5
+
+Fixes:
+In file included from /build/tmp/work/core2-64-poky-linux/nmap/7.92/recipe-sysroot/usr/include/pcap/pcap.h:130,
+                 from /build/tmp/work/core2-64-poky-linux/nmap/7.92/recipe-sysroot/usr/include/pcap.h:43,
+                 from tcpip.h:72,
+                 from nse_nsock.cc:4:
+nse_nsock.cc:36:3: error: expected identifier before 'int'
+   36 |   PCAP_SOCKET = lua_upvalueindex(3), /* pcap socket metatable */
+      |   ^~~~~~~~~~~
+nse_nsock.cc:36:3: error: expected '}' before 'int'
+nse_nsock.cc:33:6: note: to match this '{'
+   33 | enum {
+      |      ^
+nse_nsock.cc:36:15: error: expected unqualified-id before '=' token
+   36 |   PCAP_SOCKET = lua_upvalueindex(3), /* pcap socket metatable */
+      |               ^
+nse_nsock.cc:40:1: error: expected declaration before '}' token
+   40 | };
+      | ^
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ nse_nsock.cc | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/nse_nsock.cc b/nse_nsock.cc
+index 75ddeb6..a3c5186 100644
+--- a/nse_nsock.cc
++++ b/nse_nsock.cc
+@@ -29,6 +29,8 @@
+ 
+ #define DEFAULT_TIMEOUT 30000
+ 
++#undef PCAP_SOCKET
++
+ /* Upvalues for library variables */
+ enum {
+   NSOCK_POOL = lua_upvalueindex(1),
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-security/nmap/nmap_7.92.bb b/meta-oe/recipes-security/nmap/nmap_7.92.bb
new file mode 100644
index 0000000000..98969fe001
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/nmap_7.92.bb
@@ -0,0 +1,66 @@
+SUMMARY = "network auditing tool"
+DESCRIPTION = "Nmap (Network Mapper) is a free and open source (license) utility for network discovery and security auditing.\nGui support via appending to IMAGE_FEATURES x11-base in local.conf"
+SECTION = "security"
+LICENSE = "GPL-2.0-only"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b8823a06822788010eae05b4f5e921b3"
+
+SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
+           file://0001-redefine-the-python-library-install-dir.patch \
+           file://0002-replace-.-shtool-mkdir-with-coreutils-mkdir-command.patch \
+           file://0003-Include-time.h-header-to-pass-clang-compilation.patch \
+           file://0004-Fix-building-with-libc.patch \
+           file://0005-fix-racing-between-build-ncat-and-build-lua.patch \
+           file://0006-Fix-build-with-libpcap-1.10.5.patch \
+           "
+SRC_URI[sha256sum] = "a5479f2f8a6b0b2516767d2f7189c386c1dc858d997167d7ec5cfc798c7571a1" 
+
+UPSTREAM_CHECK_REGEX = "nmap-(?P<pver>\d+(\.\d+)+)\.tar"
+
+inherit autotools-brokensep pkgconfig python3native
+
+PACKAGECONFIG ?= "pcre ncat nping pcap"
+
+PACKAGECONFIG[pcap] = "--with-pcap=linux, --without-pcap, libpcap, libpcap"
+PACKAGECONFIG[pcre] = "--with-libpcre=${STAGING_LIBDIR}/.., --with-libpcre=included, libpcre"
+PACKAGECONFIG[ssl] = "--with-openssl=${STAGING_LIBDIR}/.., --without-openssl, openssl, openssl"
+PACKAGECONFIG[ssh2] = "--with-openssh2=${STAGING_LIBDIR}/.., --without-openssh2, libssh2, libssh2"
+PACKAGECONFIG[libz] = "--with-libz=${STAGING_LIBDIR}/.., --without-libz, zlib, zlib"
+
+# disable/enable packages
+PACKAGECONFIG[nping] = ",--without-nping,"
+PACKAGECONFIG[ncat] = ",--without-ncat,"
+PACKAGECONFIG[ndiff] = "--with-ndiff=yes,--without-ndiff,python3 python3-setuptools-native"
+PACKAGECONFIG[update] = ",--without-nmap-update,"
+
+EXTRA_OECONF = "--with-libdnet=included --with-liblinear=included --without-subversion --with-liblua=included"
+
+# zenmap needs python-pygtk which has been removed
+# it also only works with python2
+# disable for now until py3 is supported
+EXTRA_OECONF += "--without-zenmap"
+
+export PYTHON_SITEPACKAGES_DIR
+
+do_configure() {
+    autoconf
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
+    oe_runconf
+}
+
+do_install:append() {
+    for f in ndiff uninstall_ndiff; do
+        if [ -f ${D}${bindir}/$f ]; then
+            sed -i 's@^#!.*$@#!/usr/bin/env python3@g' ${D}${bindir}/$f
+        fi
+    done
+}
+
+FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR} ${datadir}/ncat"
+
+RDEPENDS:${PN} += " \
+    python3-difflib \
+    python3-asyncio \
+    python3-xml \
+"
-- 
2.34.1


