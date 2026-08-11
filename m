Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BFEC5AC67
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 08:41:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50426.1786437679845486016
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2026 01:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FqsWS9KG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=26839b25fc=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B5HDWa3328347
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2026 08:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=LbCb92XnY
	LiuuCERbD6ODp3rcgymAkz/xeIZLZwOANY=; b=FqsWS9KGcgMT71Y9aXuO0UGp0
	FC8DZoQQvvA+cdd/SAaNQ7McmwFC+UtXTFZukGZ+V7D67CJjpu/b6Ob3Fh2AhPNW
	r7X4LAdPjq40hWDXpKVZbiEy5tkeGGvhffgOXhiDGprTu/4QVAtSojLdgQ3d6dWz
	I5NPZlDzDdxbjlnnArOuhyA8teENRFoj368iez9H2og9XoPqzjgsM9+jiqxnzq/q
	aee6lm/L/QHLylVsphXWrwzfrdW99y34WjdC2ONyzq/1z3OXL3jzJvv5n2HGoucL
	NKAf3aqvn0XK1jcKNpeHtcCpg5sZFBJx9f3nY7lvNhkxndr3vrq+il7+KE3Cg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022137.outbound.protection.outlook.com [52.101.43.137])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fysgurdd3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2026 08:41:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SY3h8+BeOOFbcRZk0JIkKDhIvVw+lUcoqBDl4hpt65rGrCObzeXkTCVkDYzKsFb3mtRCmeFubIct00eaySUHOwJ5DnGEH6kCBENhIBaxDXJLEx3hZwlzs43/XV5hdRb2VWCxdJ046RYgNvR2SBbMrUGBI8Fj1xkeUJMa/uYrE6ChEBFltQtOqJmPa/rE7dZBP/azsU48R6uYTJ6z6PYAFkaJPiCl3g83XTUwQSG+6E2HuzXC3OzWFDGLp0KiwJxDtIvocoX1e5TM2FiwDm5NdEie0ZdMN80Yk230Rla2IB/hkFqfN2hIPqUzBIANP2wTrDEWbCu1PI7htKbBSqA5aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LbCb92XnYLiuuCERbD6ODp3rcgymAkz/xeIZLZwOANY=;
 b=xgqREiuAq0YSrrpSuZQK3h8ii7XPQ3nhghNeZgEL3oEp3S3OmBqwznD62TjM5o/iNFjari6KArbHKE4SAXSRHfutH5JSA5br4lo4hgHrTxWs65oc4fejnPS5ebHO6DLbiGGnJsGu+DeHPlFXUZRSQsXiJTvW5JM3cjt/7JBsnjbTzlVZmthRvhp5BSupfREPLTcu/iWWVIvvyyF9PY7ZhPdwBp/ldVHJahNrFTqcDxYWE1iz424frJ6NTouXefjuEanIXapatgyel4LvBuRh4nUcYabCAgZoWFSRXsj+T+LL+acoTK5CRVfmX8kmNO6YEMjm5jiRey0x90rzMgw6eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by BL3PR11MB6364.namprd11.prod.outlook.com (2603:10b6:208:3b7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 08:41:15 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 08:41:15 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Abhishek.Bachiphale@windriver.com
Subject: [meta-oe][wrynose][PATCH] poppler: fix CVE-2026-10118
Date: Tue, 11 Aug 2026 14:10:49 +0530
Message-Id: <20260811084049.1999095-1-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0024.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b6::6) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|BL3PR11MB6364:EE_
X-MS-Office365-Filtering-Correlation-Id: dab727a9-d606-4f58-529f-08def7844e55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|23010399003|10067099003|11063799006|56012099006|3023799007|12006099003|6133799003|18002099003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	VaMecjaY7s5q+tYn0vu0nakMdrNvXjLg/JWkW7ExQmCB1kn+D00qMDyF8a5E06fVpKIBxfcN2+EDRD7bGD3/5RJQ1seBFzGKdfeNl7qTIaAKE93fJCPh6+F+J9fk0/R+tLXO+OG4/Jm4NYXZs1vi3YGhMSIADZaWPXo7uH1211JyiyZCJ+hBI9E5RgB+SfxLoYlc3tUvKM6AZYoSqEN/X6AGbYM05AmqdJKFcRkT47dv/MSrvzU1CE1GPneOIHZ6gjFhB1KCozOqP+ihoyexMC4JKy7T8UyfvCVnU0FCCoNSzquaHU/ewfu9rY5ewcNh8mP44VVKz1Stc1ocCQNdkBBHiL1SJ0ZctU40MSt0Lgs7E07v46r+0h5UU5GF566gT06wJJifqvlYI8LxJwTsaVrcm9L0KgDCpNZ6QtFXY3wFbJm/8w17IQDsl36SaN4sgi4vdnvmlV7AgAjfMU8StwUDHNrpPxnhj2NaGfo7ysGpk0+3v8lJeZGf13n3SqCWBOX/xzrunZ3+uICW0Sz6ej5zGQmXnVjzRIlxSDe06YCHjnMvB9c6uPJaYbNFukx9uo3zt0oTXCSm9RD6qsiT02EuxNx1ica0kjGQDA3q2EaFNFIyQQ8ERCyMofZyNCYpgv2uvKzAXp3Bfo4tlWKST4lZhcv2peNezhvL9ndFDTI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(23010399003)(10067099003)(11063799006)(56012099006)(3023799007)(12006099003)(6133799003)(18002099003)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hjzLeGXDBmTbSNS/bDACjh+T0hg4irQ3EgyQiQ/h+lH6F3UI48caeNiZG8sw?=
 =?us-ascii?Q?UyPxJZIC6U6mAyNYTdrBAHEhZrMSKpsnL19Jc5ES6A2s6RSa7soGn8qYjd0n?=
 =?us-ascii?Q?Vraj9uASFZWYmkkIUfv3WYJAS3pO50qTe8CmQlT/8pVkxIl2kbnki5MARTve?=
 =?us-ascii?Q?mPnGjlaHEgXE3wNJ6yR1autIpYycdbYeazZnbB5R2olMqPNwYNbdwI4frvfH?=
 =?us-ascii?Q?SjujJ4Gu30Exq0/MUbnl6jKEWRffuvJbGz+reUizEmnCU1trjRoDY4czmaVE?=
 =?us-ascii?Q?zYG9d0G4nw5pcybXs+WTNNw8b7Dpe5j5Fb58pSGTpAQPZTvCJudYi7PRyKsT?=
 =?us-ascii?Q?NLVhX4k/+7So3tuDAQQ11LHM7kL9QB/55Rn9bDcnLWAQ1P8Iw8e9eqbAUBvu?=
 =?us-ascii?Q?oPM2dRHbdDI6XXH8Ts0sMeiram5MX/b5B/w9k7FEfPAnDcvIKaR1QdFh2Hs3?=
 =?us-ascii?Q?8Ot0lEH3W0zbxN8E6QBjrrGyj6731y0MAnKmOi6R6znWd0XaxOP8hbJU/fMp?=
 =?us-ascii?Q?Pn/rLqpxSwx3Y3Et6L3wxUPgvo++Tj3oLIYmqqdLObx4W03aVMZsQlFMVAQg?=
 =?us-ascii?Q?8C5+M9SvUwBDtk/lfBD9iAK41GHvp6Bx7JAPW0a7Bs8N0nlDPlZmTs2chQPh?=
 =?us-ascii?Q?+OnZQPnnujy6j3+/Ebw3n/xlVBip0Ba0zpVclYTlLL7dTzqKMoysLKGGoXty?=
 =?us-ascii?Q?lp78Fq/tjYaTwOJOhI2qbSk90G5Tw1/WSqlEWj5eOBUHrYMSZx6HcwSwlDbP?=
 =?us-ascii?Q?Okul6vBD7Dgfz9op0SjqYoX3/ZSbESj7vWmbJ4Qc1HHyQJw5ZiNCmM71T4GN?=
 =?us-ascii?Q?rmj3gKoClaTtu1cBORcRri5t0PLR9dq+NsMZVrTRkthSIcR9NsAwxFS7NDbx?=
 =?us-ascii?Q?U7vPfaigDt687fJuCJbxW89f8//SVbkzT7Lljt0rYcu7cNtB4DT4300RX3Pr?=
 =?us-ascii?Q?eGnLrdYOnMhuMro0OuJhq0QgJHmQ9l8AeYzM75rqP0gOOcEV8zvEdnFPxfdG?=
 =?us-ascii?Q?fyRjgqEWhWeTrDk5KjTM+yX+PiMvatsNKcQ8dMKrta4kdBwHPiYkqMz+f9pe?=
 =?us-ascii?Q?YMgf5cGetg2og9w2itdpOafTv3/MTBinmc+ZCVHRVbmitZr0KZt4sM1tDNR/?=
 =?us-ascii?Q?J/i1BDzbc3FNSBJYxgfyxZvNm0NGFdk1OWxtfUtVH4LCCa1JTp9PjP4nrZZ0?=
 =?us-ascii?Q?WjtJOZBJCbpoQ6RkX0r/20eR3a491t4d3mL7T/UX2nEbwXfHIRuFrSYlZI8H?=
 =?us-ascii?Q?w6rjjhJNnMZQL4MFZIy8VJODX0sqxlJVMhW3psVl+njeTLxNUuOzIKXcTT6H?=
 =?us-ascii?Q?kVYWLAFjzYFeXv3BmJuGs1MrglduYxt1mCqEZ0XkzyPaKyNOxqc9ozf0uh2i?=
 =?us-ascii?Q?0ILZ/+c83a3LerOOM+RrLYgh1sIw7BsphC8XYXv8iJ/Xd+24pPRFVpi1+PnP?=
 =?us-ascii?Q?Vf3npdJcjbyB/ZrJdD/gpv+NW9vqt9EAdh5aXPoPEbriJnmtff5yEvQxjhSK?=
 =?us-ascii?Q?jJe/ePjZqAd5jIv8VNPwBZA/s600uZjmQqYUF9mqFnoP0YVRho4vOVR/GcFz?=
 =?us-ascii?Q?Aw8B6BRxoiWy4KXCw7I1+INkIarMVggSUd9BnRb3pxLfaOgfYt3ONKw60X8v?=
 =?us-ascii?Q?QvCCcWUM5L5g/Q1z/v66HJabCNCJG7sYHdUGEqDqkuksTwFCAvWoR0pEmTfM?=
 =?us-ascii?Q?wT/Mv/ZN1sossHfk2yauULhbiLU+eR8mIbS11UsDypLHn39kgRaziOr0kj3h?=
 =?us-ascii?Q?Z2xXqc+B3fn+zS5KPtanevChVM0Fbx14JGWocECZlP77y+q1dbof?=
X-Exchange-RoutingPolicyChecked: 
	YkblmDrUfpIF+o1tLJNyfso6hYtquBJM5srx9Rxhw2PmLQL0CI/3+iyDVQ8xeHedQVdaQIipp3soflIC/59MPphcTygOzCM4pblRqrj/LVbFeOHWHIyPGmmC8WjAv+J98eTHEA8nVBE3TwSNhGtrBIuaN7ULrCauWCHfX1qS1fJLNqBZTGP8ISK2kYoPrMu6kb8PIfoAAK+TR64IqvrVR6NQeh7/dD0Ck0egTkw2whuzI9fhXiYu8Dmwb6g7iqyDGWoYe4zYiEdCB1YZH2CuRKGKzyc2lT+6k0ULUrLccs925HejdT+Z5jp+1aZyYcgEul2XZOm2hIOYSD2IG18pfQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dab727a9-d606-4f58-529f-08def7844e55
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 08:41:15.8010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xi5QX5J6EdGi40YJX/gDCJw9cnF048UxUNb8Bbv9l7VmTHjUvvNO1mj0CV56TXN0OA06HROG17QXuPgjJJ1rgGLtrDB95ARjULE5xZlPTTv+0+CcGtJa5K8JqLsll579
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6364
X-Proofpoint-GUID: KCSkzpo6QLjCcCTZC3ffSl4dYKaMzTUS
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA3MSBTYWx0ZWRfXzsljk2bgOedO
 DMwyx5cDdt67s/do+AvUsOzS6m6vVbYndL176k3/Qjd4qWF4+90NeM5e/HQbkvMMa4Qboexfd53
 DEWZXLLJf4ylByJvKZz8vS82D6+8DR4buWeY8q2Dod1Hl7c+6xVC
X-Authority-Analysis: v=2.4 cv=BYroFLt2 c=1 sm=1 tr=0 ts=6a7ae02e cx=c_pps
 a=KrBlo5eklov38meissWYIg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=PYnjg3YJAAAA:8
 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=A_E7m-nl8g4djxudnU4A:9
 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA3MSBTYWx0ZWRfX9DJRtfLyEwoF
 0HVwlCgy/aIPaCGI+MOVsdk6h9zdlGr7phLUyL7OKfwnGdBTYHTTJPFa3MS/StcnH2uoCbZDUdM
 EWwP73pUi9SImKFOAJFhb59yUnWom3OIdrMJuA0hRduTC1myidpcVhl6Ch1lAi8bn3Pkbpxl4/Y
 MzLFK8t9xVG8+A8DG5saFj2mZOx5tw7gcX7tvz3dqAhs0XVeSJBjbKRtesT/+zgW7Fu+mbWCqjp
 OHevDt/IDA7LoEQigRgpQVPT0LiaZvuOnm8lK9HKrrB+qDb0VGQUfVODNCMXGfRfzW72zYu0RBF
 We7u2repaHUq8zaqW5wd1DlET6VCMnAF1OYpTv1un8iMlIGIwxeiGEXmTap5icV1R55gpj3e4r4
 HCqfgE8qp/rRZfLc/CszhrfKQrRdhb9G3KgFe2m6h5vUjOmx0wyRNp73V7TcwoF6e7xddpWaA0R
 CmPldgM3R/F5f3Q4MWQ==
X-Proofpoint-ORIG-GUID: KCSkzpo6QLjCcCTZC3ffSl4dYKaMzTUS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2026 08:41:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128924

A flaw was found in Poppler's Splash backend. A remote attacker could
exploit this vulnerability by crafting a malicious PDF file that, when
rendered, triggers an integer overflow in the `tilingPatternFill`
function. This overflow leads to an undersized heap memory allocation,
allowing a subsequent out-of-bounds write. Successful exploitation could
result in arbitrary code execution, information disclosure, or denial of
service within the context of the application processing the PDF.

Backport patch to fix CVE-2026-10118.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2026-10118]
[https://gitlab.freedesktop.org/poppler/poppler/-/work_items/1715]

Upstream Patch:
[https://gitlab.freedesktop.org/poppler/poppler/-/commit/8352264766652b98336e92359a70b3161a9ab97a]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 .../poppler/poppler/CVE-2026-10118.patch      | 46 +++++++++++++++++++
 .../poppler/poppler_25.12.0.bb                |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2026-10118.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/CVE-2026-10118.patch b/meta-oe/recipes-support/poppler/poppler/CVE-2026-10118.patch
new file mode 100644
index 0000000000..ec4782efa8
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/CVE-2026-10118.patch
@@ -0,0 +1,46 @@
+From 8352264766652b98336e92359a70b3161a9ab97a Mon Sep 17 00:00:00 2001
+From: Marek Kasik <mkasik@redhat.com>
+Date: Thu, 21 May 2026 17:51:51 +0200
+Subject: [PATCH] SplashOutputDev: Fix integer overflow in tilingPatternFill
+
+Use checkedMultiply() to check integer multiplication of surface size
+and number of repetitions to avoid integer overflow and possible memory issues.
+
+Fixes: #1715
+
+CVE: CVE-2026-10118
+Upstream-Status: Backport [https://gitlab.freedesktop.org/poppler/poppler/-/commit/8352264766652b98336e92359a70b3161a9ab97a]
+
+Changes:
+- Removed copyright from the upstream patch
+
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+---
+ poppler/SplashOutputDev.cc | 4 +---
+ 1 file changed, 1 insertions(+), 3 deletions(-)
+
+diff --git a/poppler/SplashOutputDev.cc b/poppler/SplashOutputDev.cc
+index ff3ad0eff..f055486c3 100644
+--- a/poppler/SplashOutputDev.cc
++++ b/poppler/SplashOutputDev.cc
+@@ -4327,7 +4328,7 @@ bool SplashOutputDev::tilingPatternFill(GfxState *state, Gfx *gfxA, Catalog * /*
+     matc[2] = ctm[2];
+     matc[3] = ctm[3];
+ 
+-    if (surface_width == 0 || surface_height == 0 || repeatX * repeatY <= 4) {
++    if (surface_width == 0 || surface_height == 0 || repeatX * repeatY <= 4 || checkedMultiply(surface_width, repeatX, &result_width) || checkedMultiply(surface_height, repeatY, &result_height)) {
+         state->setCTM(savedCTM[0], savedCTM[1], savedCTM[2], savedCTM[3], savedCTM[4], savedCTM[5]);
+         return false;
+     }
+@@ -4349,8 +4350,6 @@ bool SplashOutputDev::tilingPatternFill(GfxState *state, Gfx *gfxA, Catalog * /*
+         kx = matc[0];
+         ky = matc[3] - (matc[1] * matc[2]) / matc[0];
+     }
+-    result_width = surface_width * repeatX;
+-    result_height = surface_height * repeatY;
+     kx = result_width / (fabs(kx) + 1);
+     ky = result_height / (fabs(ky) + 1);
+     state->concatCTM(kx, 0, 0, ky, 0, 0);
+-- 
+GitLab
+
diff --git a/meta-oe/recipes-support/poppler/poppler_25.12.0.bb b/meta-oe/recipes-support/poppler/poppler_25.12.0.bb
index 71bff6d70d..57a7b996be 100644
--- a/meta-oe/recipes-support/poppler/poppler_25.12.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_25.12.0.bb
@@ -8,6 +8,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://basename-include.patch \
            file://0001-cmake-Do-not-use-isystem.patch \
            file://0001-workaround-build-racing.patch \
+           file://CVE-2026-10118.patch \
            "
 SRC_URI[sha256sum] = "c18b40eb36b1a0c5b86e29ca054bf0770304583da4f2cdd42fe86eca6a20de48"
 
-- 
2.40.0


