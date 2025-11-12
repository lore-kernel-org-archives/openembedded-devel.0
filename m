Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C43CCD13DE
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 14:54:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15250.1762959269271225342
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 06:54:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fkmK4eMC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC53dYP3492130
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 14:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=aiLKaYcC8poC4HDLjtqmH0al9b1idpp0swjji4itlKw=; b=fkmK4eMCk1OR
	oRMira3IJx1jTazdbAVZAJ+Ip176zO8031XHOMfaI5vlvHgP3+1XWzxk9v0NYHa7
	Ttl2nNsKMdfdmTnnNeasZ9nci9dcFLULzmdQCGbMmDbdPK+YMg09BYAX3If6R7xb
	zp1uhajD3WdMc3mlRz3wqp/oob7NUG9IHWB0QGGQI/XovgdyKCPhBGlNADlaxmVa
	yqQubSiaM7NHrkx6MPJ2+rsoXnTOXSKtKx6/t6yzM0g4uNyOiQyTYXXm9e8+zWPM
	HCmxP03cJsLZQOD7JRO1HNkJuayQ/TnY0gs6HJ6R4puGP4GLVk0pyfb8VmS8TvUP
	w0KjG2LRSA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010056.outbound.protection.outlook.com [52.101.46.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9u2x5fvx-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 14:54:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1jJLFhzCg4+5CVEQZpofUR2hecABp33eeyNa6yvmCNHlcgYOXL05Yfzn4fTQYWkawoTt+SAvOYhyZKYY/O6fKWkmb/jQKLi7THxxCxnhhQHtOoZvCtRUqSZI3nz9L1nnwbGi9yRn6jauS3mU4zzhrY2jCLN80ESFF1L8x2NtukbmGBRziQYySScl0HpETGZLu6mmAjpIExuGxF6dC3eLHfdYrluv51fhM5RgnqgAAGuCDFWW2+0/GCPHXSJGVuuXJk1egNiDuc2Qi6yjbgvIkVhOZUjRcLdgjB9ky74ptQDDQZRBu91qzRqV7qDnpQuVbWtEUZId5KRzzdgFELVYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiLKaYcC8poC4HDLjtqmH0al9b1idpp0swjji4itlKw=;
 b=PifHlXdutEtclNF2lceEoOS640LiJk5uEX8IK491sXlCR3TnzDa2KDFTWFJQp1W+rW2v8imP3Eeh2ndP2nUvNJlhf6FBFB7hUUEg+DYX3rCnxU/aPvy3wPlDdRBvYTh2xAjiGivzKsx8nNFiP66YH+1as25bWCitkwP+f3VdqxYxPcmvSnnyJAauXpPG6V7fynRrZOIbzQ63wsM0ZqKxdDzh5Bt4ygBAxjy+qmcUBrwTYD8K8VoOucJX9SbK4IWZetN413G4gq5+kc0bYxtnA/+XDZTxsfTscQUjftTW/wpNIH4Nv7Iw7+6FsCIURpxCATiuzoXyGvwoySzbQBuUiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB7598.namprd11.prod.outlook.com (2603:10b6:a03:4c6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 14:54:17 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 14:54:16 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 03/11] python3-lazy-object-proxy: add UPSTREAM_CHECK_REGEX
Date: Wed, 12 Nov 2025 22:53:49 +0800
Message-Id: <20251112145357.3788595-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112145357.3788595-1-yi.zhao@windriver.com>
References: <20251112145357.3788595-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0128.apcprd02.prod.outlook.com
 (2603:1096:4:188::20) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ2PR11MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: b2d90090-72ee-4270-3686-08de21fb59b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kAPfSax3L4lAVRgkxeMpsUfm8PZAsE6UvUsOPi5ZKICIq+A+Me26JNQJDa//?=
 =?us-ascii?Q?okUNpeOzDAEhqqm+3SR88KJHgFphhGd57Qe+CfO7U+1WWJmuYoZvix0ACC+T?=
 =?us-ascii?Q?NaLKZ6bGaUd03RcaoGNI5FDPJg49ZQvjFIn0y6FGOBxfDAIl4cQMbEU9He7i?=
 =?us-ascii?Q?cmsAUxYR59TjlCeltZqbleWY8p6rFqQqDL3OInLuFy1BKbxuQX/8X5NwjfXs?=
 =?us-ascii?Q?faRJJZbkq/eik8eX8rER7KL+Z2S4xXLSzXW5vbUFuNWuW4CiHWd7QSo8AiGZ?=
 =?us-ascii?Q?TtMRCNx4cAvx5KzvM5406U+EyAtSO4oDxNsYPSiHys/xZu/9xnsktwUiHYVZ?=
 =?us-ascii?Q?j2zjgYvWQq+Nmh9geCVk0IQbSsB3aZNepirNTYF9ZzN+alc3GGTV6fAFOEVo?=
 =?us-ascii?Q?YhpVB+/ZEUQtVnuQaJTdg1iIaIMbKlWSEn9C3Tx+N9hkbOdRy4IQyeT+JMbp?=
 =?us-ascii?Q?+kjh4Mnki09L10q2q8Nt25PDHtvwuCc6SLxw/eF+VrLno8MyRTjFQj+JIhkG?=
 =?us-ascii?Q?wivYqVru0AViqiHeaC9w9DEgYROaHQ4vHDqlvcicz0ohtVt5U6zZPdW3Ptyl?=
 =?us-ascii?Q?xcYPEi10kwHbtSqiAe92XUHnGooAQZsLUSvcsJFPh5mE1VQ/Qwhv1zfCenfh?=
 =?us-ascii?Q?W5/df2Nk7llzeHIeb1SsoGFYYlHjfD2piRnOCNFrGDl8eJs2TuhHRyoSFN1E?=
 =?us-ascii?Q?iSXHDd87Y4HAqMN0x+LDsbypkOe1TVwuioxnuqi80TVjQJjgqWoDcFyJELBh?=
 =?us-ascii?Q?6EIglPsUn0wzA9V6Pp1UAl+iP0lKHyWpDrimrU1xUbDBwF08ZBjHV8g/uDrn?=
 =?us-ascii?Q?2sMPQpqwypOfaPDjLg2vAbUvEeE4c2S1uUGG8O+i065Jmat8739vdO65ZeL3?=
 =?us-ascii?Q?NpYlEUxGE3izNRuSjV5ndnZlLdA64wK7qbZ5XhRvH4ZGGrDS24FmP2QQXTB5?=
 =?us-ascii?Q?6vy0FNPReGmh+4A15DQT7zhZyMahtHP8XN49md84JA3bfZIgC2xkKLdWkb0g?=
 =?us-ascii?Q?7tJf4OxXKIAIFrlyzFO7A+NOVKG46YnaDinZmKh8xHuBe3tp6cW6eCHbeLIf?=
 =?us-ascii?Q?re2vn1ULRe/EVEXLkVb76shMTo8XDoZC7aarloe7SbrMnhE8TgIN7APwMqnm?=
 =?us-ascii?Q?SuuRXXKCMnePbsujHRs/TP8rknjd3gM+VXjMfSH+J6sdGsmOPuOJKh32jV3B?=
 =?us-ascii?Q?iBmEGAZPP8R4VJS7DcY7VBg7AsApJg47ZDXSgDXe5pUa4MDJBVL7OUCpQ3YL?=
 =?us-ascii?Q?aGXSy+i1e5ydNbxGyA+eOfw6IqNYWrHCNgCcyT+diSUwzNGJ2Px7vFePYWO0?=
 =?us-ascii?Q?28alXvFHKbng4cNE8qdLY6HEZVDULrl2ivGHcnvNTOFet9ieQ/Hsuq175Gga?=
 =?us-ascii?Q?oCs1UApCsJOocGQv485X36baa7rNd/d/liTlA9ztiAxK+QD1zJUjXb4TkGKV?=
 =?us-ascii?Q?5qKlC5i5mEg+l8cNjhRApVfoVNVeEi5FSBuLJwCkgqZ3YoRA2fzbT0JMYYOP?=
 =?us-ascii?Q?QNbxsSmU4VcMg5Vq9Px1qeJ0cHDs+dPgUJff?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nGiP7SYF+2xMulKvnNsCZMZ+G4V6Cv6QF/1GhBMrtqIYSgV+jM/cvn0j5Jfp?=
 =?us-ascii?Q?yFVV62zKQFtxn+ucPUuowuakOSwiXEh1W+VT/KuW8XukkNEI86TSyJpC4w4C?=
 =?us-ascii?Q?bvy3Z/iv2t3f5xFkdCNtpI8+mgg5FU8lGgdNH7cwHPQrcWRUriJZP0txiGAc?=
 =?us-ascii?Q?Dtq8O9jQQvrE7aTdsDgGEjQHhAaaZOYzD8ObidRrAcw3zmLVteMP5ZSKWFGr?=
 =?us-ascii?Q?sMQ64XsIZwgfHVIlv0lKlKAouyXm16Vhq6sxx5RoakD9fU2gBYp6IIO7hjwO?=
 =?us-ascii?Q?9idvTbKHA2nIF77rlxHTASB6UYNVqRepDsqD1mylPysB80uZLI5U6BpY/oZ0?=
 =?us-ascii?Q?Qb1PPRjF1aTmlXOM8hXg3xPThiPRG0Xxf/nQAxXRld/7sp+1dCJhzCaY17Ti?=
 =?us-ascii?Q?gKWW33LDRcmGcekTVjqOnNFRb2+hh+ON5p7pamBvz/Mh3rGOFV9XN0D33HMn?=
 =?us-ascii?Q?z4HKPvf3KhYS0C6lJbyFFUXb2/LJrl3PhN5HPplCs9HcUWP5IB+dKH6pEDi3?=
 =?us-ascii?Q?Cu9ljLfCMx+UUFGejJaf0/XemTzMqGh4hJVb+lSPajivK+hLepHUudhpT3RB?=
 =?us-ascii?Q?NUoSSgb/PwHcef2D7J4ucWNUH6VM6KHcbmSmKo9KWV6z7BP8BzcoK+mZQkSF?=
 =?us-ascii?Q?p1fZ6G6ywdjq+53Q40oc+aOCFuTC5HAjdC3OAjDhUw6Lg9x1pWMyKYg0ig/U?=
 =?us-ascii?Q?3sunNyV1U9U1IbUlUqxrp0abpW+YqASYokP2PRIMJb8rttnjCpor3DCt0Zbp?=
 =?us-ascii?Q?gfgK2vk8mM69r1N/tBIkpvgSJ4v96F1CCp4I3RmGpX4KSjL8mOF3YvUeFmDl?=
 =?us-ascii?Q?DQIr9JUDtnNA5H78wv1S6TuhSvyelFDC0xfOzVyF/wqKcGQRedra06xqwm+G?=
 =?us-ascii?Q?m6B8p3ytgoIIS2x6tY1wnOKLokgyn2GgBaCM4aeu3CneHVNsuLahyHAAZPeu?=
 =?us-ascii?Q?phOqNlKzGUL2/Mr9HtE8qWFrywffKD/KFmxfW7+WHSapEhIsYoQ3uDGe+gM8?=
 =?us-ascii?Q?Emh0TSr58fkqb5wyx6E1Rnd+ZFgK4levYhXwBNGIK6z56psM+wCITvw2LiLK?=
 =?us-ascii?Q?Vxk/1kjr64IVcZ6njuaF+/pYhBKn9oFiKlb2G2gZhL4hdlwExnGHVZ9ZdAcu?=
 =?us-ascii?Q?xkwlMID9vPgN+6dP7R3VVi1RKiyewImv8fZtdGloP334KUvoHGAaYK7LoaJZ?=
 =?us-ascii?Q?SoTttNwmhGMgokDqJkb4S/VnayRRD8IfUL0rFDTRLhor/t1AnfG4Cse+z4vJ?=
 =?us-ascii?Q?APYC4WMrdRyyvItC4k0CyrX248jCplQKaj4syZ71VDa3398FyfW/zqaWMlHg?=
 =?us-ascii?Q?CELFx70HtlPw6n5olKWZmvgrWI/j8EP6N02y3luvLiCWnZluiFbD2jIJHMNd?=
 =?us-ascii?Q?tn7H12C41S/q4ujXTm9j+YFpRrOlOaNeaYlzFwWlBB/F+BSKqLMNOyCUgXoz?=
 =?us-ascii?Q?9LCXfaBkD7dfP3EtT/Qzowbova09U22wAmFCzOAHT6+JKAX5gY9Gx6dIrrCr?=
 =?us-ascii?Q?oxrcUS4KoXspOsuydUyMHnOzIBqIVJA9hZLSk3bTK1HpMYhE4qh/tZl51ot3?=
 =?us-ascii?Q?ImBQy2mmLycgghz3T5nYCqDgxRlJX8BRYpL4MdiQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d90090-72ee-4270-3686-08de21fb59b0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 14:54:16.7596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+dZiUm5knXojIBado1K3LRWUCX4+GXvCrs5E5sY8vfEB9fsHJ0BAVQo/2SUDy9Txjy17eftGB2qtV0dQoFvzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7598
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEyMCBTYWx0ZWRfXx7Tacruqz4u9
 jQHtnF/n2f9nlWbBWju0ioUk7VR1+GQjYFCYWLBRNv8VPQiEDOX3D7rjui3uZotGZFmEClTm+FH
 yY8GVBIxblyZtjyW94hVnzF60AH3g8IBjGQLEtjRmoZ2U4NmbPqzo2ZkyitW+kXEsPdxtl5wqHv
 sXOSgBcbBFVLoX9kTVuxzW996EpV/yWuzo/bXih5iSY4o3s9vKd9aLw2RaYwJ5Ajwyg06jqwwFv
 JyWMJ6fZufIpb4zobzd58hzLmQq7CzRbZT5QdJgQ58Ng6Y5YH8Y3O7sFlqohvpowgcHK28EHoha
 ugBciLPrp8lfpZfMGc3TpMPIHHiS4AMc5+Qshx6AS+hyNkABAMGrzMMcEU4vs6jAAE7VJ9mRLcg
 H3W8VYizaof3gphh4NmWOas9uGINHw==
X-Proofpoint-GUID: NyH2U6jzW_Nf55pezp8XZjZP5x8QhDOO
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=69149fa4 cx=c_pps
 a=0PDhd3HO6khzWhHQYbQRQA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=7YkJnH4Rh0F38lPe4QcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: NyH2U6jzW_Nf55pezp8XZjZP5x8QhDOO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_04,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120120
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 14:54:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121551

Add UPSTREAM_CHECK_REGEX to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version python3-lazy-object-proxy
INFO: Current version: 1.12.0
INFO: Latest version: 1.10.0

After the patch:
$ devtool latest-version python3-lazy-object-proxy
INFO: Current version: 1.12.0
INFO: Latest version: 1.12.0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-devtools/python/python3-lazy-object-proxy_1.12.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.12.0.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.12.0.bb
index acd84efd21..cadb1395b7 100644
--- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.12.0.bb
@@ -10,6 +10,8 @@ SRC_URI[sha256sum] = "1f5a462d92fd0cfb82f1fab28b51bfb209fabbe6aabf7f0d51472c0c12
 
 PYPI_PACKAGE = "lazy_object_proxy"
 
+UPSTREAM_CHECK_REGEX = "lazy_object_proxy-(?P<pver>\d+(\.\d+)+)"
+
 inherit pypi python_setuptools_build_meta
 
 do_install:append() {
-- 
2.34.1


