Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A978CD1297
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 13:44:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13695.1762955068029141516
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 05:44:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TdkDm5QP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACCA4I2002158
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=H76oyM+Ct5qfgZfmbFxdgzGBPtMWYymnM0Tk6+1pQbM=; b=TdkDm5QPKctI
	2S4eK2FJFRDR8oOGCxQeMZUG11wze4qqX7ukk13vqADNdjLMWKdXp8W06Hb/2y4D
	zDVoudqFftkyp6zK0coJM5G8ULSbhf7B/wtn/s8Ase+784+MJRh7bErFb1RdhDIn
	jzUzdbtHnfHwLsSJxNAeUYHWt/P71ztJnTLj2508gE9n3UBOUZNgWdWm2AO4Itff
	bCW6FvsO4nKTUHHTOmhn3xRQdTeE0vDk3UqszHc5C/UEsRjhwDiK/p7RdF1PkMK4
	ow8Upu088UdwzR3qCiq5BSBV0zhpachzVrA+S1vQaO62MZAOLGS33VgkUHc96NjJ
	HI+NjouaRw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012040.outbound.protection.outlook.com [40.93.195.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9u2x5bmu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tM/ds+jmxMuj4ktEtUYXHtvdTXSElfXfBQ6IlFobXmQUZQH6aMbA027+kHWd/jYlTQkfD0i6YSqLS7PQyeO4l3vpV5W/KKtIr9Ag/2nlMvZwj3kYELOx24u0HQBHlXH153SVPU41Hf+l5D/SpEnwmDgihEteMP25GskIwCQ4F6m5H5wvA16+J0p1BPPuRXyjDyoQ+fSQBXoBh3lPOykLZ9cFJSstAoOWunQvwjZ4IFZX6bX8R3Mmx32DxQ4rP92ddynB8d8/Bc/35bAIN5XMwiVupxszaMCAmE9t/62RxthICtmR/ghvqhkFaoP6aj67egtW47RdkYGDC08APKwJ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H76oyM+Ct5qfgZfmbFxdgzGBPtMWYymnM0Tk6+1pQbM=;
 b=UJ9JjnLWo6mrMbEu2b4kihMuQsEY72A+fALC+aXXpU5a8PZZxAV3Jf/JIw1oZq9V46/CFKa65K0rnXLi4Fo7xQzdD+Y+STq3h2gIe4SlGDzAbwfff3AStJP5aOl+5CIQ+TDipioigXGR17qTVqOf+gcVmbRls5vosC22dfPLHyAsvvXi9TAg8gXRraW8GP8mlDlYeW+xOivcZmibxnrBJOcLvywDy8/OigLuOAF0/IXx4gox3+2FamoygfSUTGdBfFcjOND/VTs4zQw7eBBnI4ejcP/q5aS22XhutumNcSxbI10Iso/w6jJvZY8GFGQwKB377Xv2+zb3ujNb7gMHhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS4PPFABF58482A.namprd11.prod.outlook.com (2603:10b6:f:fc02::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 13:44:25 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:44:24 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 03/19] bonnie++: add UPSTREAM_CHECK_URI
Date: Wed, 12 Nov 2025 21:43:49 +0800
Message-Id: <20251112134405.3706508-3-yi.zhao@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 57cd482a-3954-4d2e-81b2-08de21f1973c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DYGgGVggu2V6GAcg604UKSrbsVlmodK3uZMOBru7jC4Hb31nSAZn0eSRJRrF?=
 =?us-ascii?Q?hQPEKohN40gyttzMwqvTjD9Mk8ZrYTjuB3OXi8BoNYPY5Catk/5GAYzxthqM?=
 =?us-ascii?Q?z5T8vG1Yh2KjZ3bio3EL1wkyudtkT2LuqMrlQ5MueoRmjTCYyiQtf0T/xc8v?=
 =?us-ascii?Q?6rNigHPs62rbjTCbscxPRo6LhyJ565MUZFJAn9HHSV5r/mInWJVfgeDqwryX?=
 =?us-ascii?Q?Qq3Z9IgvuVO5VfevP0rdF/Vomtpmy8dK/qSY73sn1dFKyebUBH1Xaq4hAbWu?=
 =?us-ascii?Q?IwCRNgPU7/WKY0xY7Q/Jox7/xibmf6mw578JGkD+lXr0rREjYspIqn3g23W0?=
 =?us-ascii?Q?FUvRoUNwaqrKn/DMtEPCWSxc5fI5NWg6ofP/cR9BGsE2gc4NaUUaIv2XtXaA?=
 =?us-ascii?Q?X/xCgL0R/xMgPuKxkPQVbYMX6lVg0wQQ7HuXFxi0uHxfd4cqDhYIxH4NIQKT?=
 =?us-ascii?Q?ekSokGhAYnaNtrVYr3Nlq/M9w9YxdH49nzkuEQFxnGQKbdEzr8jxUdA2FxDI?=
 =?us-ascii?Q?DIh1CmTe3KH+A+0cgfUOO/MyvXe5NdcYCiTIgc9yR3BtsY/9dW+fUeyO4kyS?=
 =?us-ascii?Q?KPACQi4+wah0U3vS4R1pHFXSM+DM96ERpq0OBi/aGozaQ4SoytuiGGWKB9A0?=
 =?us-ascii?Q?kaXVYUl3Y59Xce/nZpxiNkVHKZm8C8rvacCtRoXfs4bHGSxUSNKkRdR1iK6T?=
 =?us-ascii?Q?1YDHK0iTwT/etCw45ANT3BEN+TAtaEf56y08EU1OfjREISzcFlMC1kxkqh2h?=
 =?us-ascii?Q?QaAs0fKdwPDltWaCohOgVxohfBR7PbvQuts3NMWn527LsGEzNFsLDgnjjKhJ?=
 =?us-ascii?Q?CIeJnUSLYnougTqnKk/Z6xW6lQ2a/CNp7ztJifAcPWDr/kEGOTr3g8x5Mjvn?=
 =?us-ascii?Q?ioipUxx48l5P6VuhfOCK1MVl9nfs2O6JIEt+Ox+sSwQnWGAmD3mH/8IrPXEc?=
 =?us-ascii?Q?OjeXrlQvNEv9KLvlwGJ/UDQkZaPWjk1buSa1VXL/ZNla2aJOr9s8jSyZjUMS?=
 =?us-ascii?Q?ocSCiBMRToGOzgbskurgDda4SCrO5CjVy3N1FsgMUSSvgrRGVWaDe7Ob/c2n?=
 =?us-ascii?Q?Nd12q168OrIXfgrDINpl4NHS0j8HAcO+hBHdRSwgRuuuBCUCz+PBVlse3xAU?=
 =?us-ascii?Q?iU1TzxcZurTWR8bq1feQEmtvofbfSdEOVyxTs6frDceHJqpBovEYcfFUh3z/?=
 =?us-ascii?Q?EsAxUdhHI1C2QzSmZ9E5vRZ0rBTZftXZMla4i/FaxLvIi6Q4Lih+R2BKvwjO?=
 =?us-ascii?Q?dBfqCUMS/kOZtfMt1T7yTBLO2h8mNmYNlAUf2KPfFqiCBvIOHgSHnYwSEGvp?=
 =?us-ascii?Q?8ombqv7PXv6OgAKNuKwS2wOmC9Hw30Ub5pL/wm/gtxOdAtM8bcqebMSzp4BN?=
 =?us-ascii?Q?+jTymNSFDgXG4nJ4/xtuBSttYfaEcdeBweUp8QB4fESIuZ+yEpBz0kX1t62a?=
 =?us-ascii?Q?Gr4bBTfFupqYkf24yJCpLul8+5yWKpWh?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?epayg1Gie5qMYG6UuxgKmKLaGrLEAdfQnXlJbnPJ19Uu0O/KDDXfxjlOa4bz?=
 =?us-ascii?Q?joxQRemYtiPa7Cgremd+31FV6LYyuei4GCMHHwJZzb+Y6wRxzRKGc9EpzTXS?=
 =?us-ascii?Q?UBddIvQj+y+eiNJIuH2+Y8oexZ8OIjbyCDc/aelsWm45YZ2yXBKU9kqtntl0?=
 =?us-ascii?Q?XGc20jlywHWBW6QNg4Kn7IUVHjmH0uMOTXoRBgo9j6GZgWwSE8e28C3hi8Ck?=
 =?us-ascii?Q?2vRDyivXhkwWfAEXnJ2rPZcAESYhR+xXwA5jS33sZ/gXyWCaRcmbaeatUDCM?=
 =?us-ascii?Q?/BS9Qr1d70lP1DeTU08amj4wVF5SFNg0AMLIIv4W6fdvzNP4vdNt3lLVPqjZ?=
 =?us-ascii?Q?11wLVBhjfJrXqRW5spPxh8BKI/CqFsmPISWUC0eVfQHvOo/0L2Ne7sGfzvkS?=
 =?us-ascii?Q?5vT9Jy5PsIo91sws0zsU8S2j6K9GiyvaFUL0K6ro1NjaVRYF9lK9Wq11GZfr?=
 =?us-ascii?Q?r4kaq0oW6kvxkNRZEAGib6XOeXgA8RlGgdhCsBhiDzlZsegyPPS6g3IlVTZu?=
 =?us-ascii?Q?RlXTpPTEInoN4QKAdI4lCGmXg+a8PBg+eQHOBUs9riXKqrO2T877crSKturb?=
 =?us-ascii?Q?8S7kNUnwJGjK5vbfNZRjAYy2lt97rOwFza9Cz+brDXyI4ehYI3C0e3YJ7rUg?=
 =?us-ascii?Q?9oBz2pN+ViDVdnrRWmuUZ67E0g1ypf+ivZ2RuP1MXB6860iz8QmtdGTpxbwb?=
 =?us-ascii?Q?6pY3RvEVp29Mrwno0yK8MXEeIo4lXF0lwgAus3soKhtub9GmElmcICsLlHUK?=
 =?us-ascii?Q?tI3Z/a4RhQZmVeyJCrJ5DI0mnA3+1Hyz9o5UsREEfsbyZy8WcjyIb7jzSwIb?=
 =?us-ascii?Q?sDs5Lc7cLQ7x6voojBQuDUwKp+7wKYr6eQZAiM+l4LxcPckpvZFtVh5xSRfB?=
 =?us-ascii?Q?Dtnv4Az86pPdFGZ5X9BzCzF1Ru7iqF62VX2QZHFnGNpWg/8T/gA7agURgeMh?=
 =?us-ascii?Q?9ZS3gEQxRYWu3VwQhf/9revo4qzrdzivpErcS+oZRJuwqqZrBy5m7KTYoCQ9?=
 =?us-ascii?Q?SNNm2Txy0nhiJ0mA/v6ephoAT9MlRS+RLRr1FK6Wm7d+J3/TiIAkcRb+Lais?=
 =?us-ascii?Q?Zv5j3CheFQMYeZLHSS9lSb1N183dXJN+gJ6E4V1Nabh5cXUXUHkmHowUK8ab?=
 =?us-ascii?Q?ABo2naQn8mxJ6SHjo13agcCc1d6Lq8mjBAGVl1ZgIfLG8Fj1dah++Us9gS9J?=
 =?us-ascii?Q?GICG3QFuBdiSIRuAP0eJ0JyoMtxQ6DJHph2lX33V6C32U+xR5VZ4WRrkLLxC?=
 =?us-ascii?Q?OJvg1NrpSZDHhlhi7UPRl6HXGUsUDaMqh3gxkWEGfNFiK5phpz8G6zjxGRuR?=
 =?us-ascii?Q?/tbaKwUpVkCROqAuf1yH2Fwns7KgLu+TumChagCURUV5RjbDsm1h6mb4iw/d?=
 =?us-ascii?Q?wiEWZAL3qvjJuPrnmiJ+5E4BKlCVqCpPPNeoiehEXiYueNApkBnaFNJi+CFl?=
 =?us-ascii?Q?EbwQe1MSpVXGMj9FlUpBEom9fpQG9V/mXK3jY91k/BcCl4ofwJa217CJTukq?=
 =?us-ascii?Q?IPpf81gOunyjC7KJLFV9yDt1SZIlUMNuCfe8OXW1KEBboaNweViJHkHlRpQX?=
 =?us-ascii?Q?+9sll6ADj2AO57LC5th/Nz/dr8m8eK3GNy23iDcn?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57cd482a-3954-4d2e-81b2-08de21f1973c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:44:24.5560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jxFqsjZa6CidsnyXKBlc2vdSWcH+1uQAZeGLcvl496Er4fwGCARlurglepLptNgQdK19YJ9oVhehw646c35k8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFABF58482A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExMSBTYWx0ZWRfX0S9BA9vY9Hd9
 rv8s+RDWj8vrQ7ZBXHnvNBtlPL5C148TlXq4NYldqxCynyHJWMF/jg5kNwbtm+sosBZmcHOOQJM
 fjh2tewoZtY0t+jKmSz9jsc8IfqyWXzN3WQGfoP/NR14zjrYXz8SvjEH476PpAPVWgvo7joJW3P
 vZeM2IKKA3QDRSHbofeWRknYRLBOmtgpgumVxxtYOw9YWSDlADF0GOiY9J8jlfxjj0b93bOtuZB
 WJamXAD3UL/dqayHyBlMmOj+FV+scbmyM6IUfYWO/7TMaur4xVtKUNQvaFW3KRHTHupwdi7mSaj
 Qg/26acwKdL7LQqOdeXcVpad+C96Bf9wt4r+6f6MvK0RLfA0akkqb+ZUNOFrppYtJfYogZ1Oyzi
 FRuvShllMZJXY1SqSVHI9In8Ru2x+g==
X-Proofpoint-GUID: SjhNP2Sy-p1xio0F9nPsNfft_kCxBOPq
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=69148f3b cx=c_pps
 a=zWRuVz0++A3eh/KBGeICZg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=DVqcFYRoAAAA:8 a=t7CeM3EgAAAA:8 a=0TCzgAqvKRgjQSB2rh8A:9
 a=kFX2ZgtuGHDLQay-XlCA:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: SjhNP2Sy-p1xio0F9nPsNfft_kCxBOPq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120111
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121532

Add UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX to check the correct
latest stable verison.

Before the patch:
$ devtool latest-version bonnie++
INFO: Current version: 2.00a
INFO: Latest version: 1.04

After the patch:
$ devtool latest-version bonnie++
INFO: Current version: 2.00a
INFO: Latest version: 2.00a

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-benchmark/bonnie/bonnie++_2.00a.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_2.00a.bb b/meta-oe/recipes-benchmark/bonnie/bonnie++_2.00a.bb
index 29590bfe84..1029a0c480 100644
--- a/meta-oe/recipes-benchmark/bonnie/bonnie++_2.00a.bb
+++ b/meta-oe/recipes-benchmark/bonnie/bonnie++_2.00a.bb
@@ -12,6 +12,9 @@ SRC_URI = "\
 "
 SRC_URI[sha256sum] = "a8d33bbd81bc7eb559ce5bf6e584b9b53faea39ccfb4ae92e58f27257e468f0e"
 
+UPSTREAM_CHECK_URI = "https://doc.coker.com.au/projects/bonnie/"
+UPSTREAM_CHECK_REGEX = "bonnie\+\+-(?P<pver>\d+(\.\d+)+[a-z]?).tgz"
+
 # force lfs to skip configure's check, because we are cross-building
 PACKAGECONFIG ?= "lfs"
 PACKAGECONFIG[lfs] = "--enable-lfs,--disable-lfs"
-- 
2.34.1


