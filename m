Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E612CD4F48
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 02:59:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15353.1763002757442764442
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 18:59:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LwtaltUW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3412a946d8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD2vgQh114160
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 18:59:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=H+rbuOaObhwYuCn8S1Oz1koT56u1uPNM9l3uzZA/9ow=; b=LwtaltUWDSFU
	RrWw/VtdKHWNCqcQHOVCwcJCo+bAJYDTTwku1TcW75QmlSGkfjbTRfl7pEjF3tGP
	XFS5FsNPvdeI2tro3UJtB1Dwc+g+n6rTS4Fvou0pRdV9uf3jl/8yCIkoYU3AXfk8
	w9nO6vyb51DI6e3sqTnTRZ//R1WkZ0T/+SIYaZf2LrKSrKexgNTd8S4OCWaSqhuA
	y3d59uWkf1MR/xg+J1Zz5alRG7Ax1+pVnW90kB4UGBZD752ZdW416YGAAXk3gg2U
	+JhJVbRq5B5NLAa0UwlVkO5eT3y73rIEcXn1CrlhDdhtp5u25Pgz3b11VW2d6W3g
	Jeoefq/R/Q==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013009.outbound.protection.outlook.com [40.107.201.9])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa2136f2n-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 18:59:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7xtIBLRl8g0SFg0pVfUq90LTMkfMhqxZaYxXwZCiMaZI40HEXhDOXJAOAVpsU+tTTpmGorSdCHXoVtP4TID0SrPe7YYBlD5sMxytWSF71DjyNj3pgVCnjUmh36vJXVZmUrvUYi0Di8UNruKtoNn22J2XnYezCGoxQeaE+AsOhma5+eAZAzjD3p037mlQrHkvrO9ya9JPBiKikVwriat6iXBSkqdfU8Gn9KRAupwmSS41gmE7kZkbQy5wL0dIYmsRAKkVZSOKkV4eQbewpbzncYIgGl9B7Hgru0ipj9Mly2QXNA2uzTg/tXVt8QSlX369EbKYVxxHMmXCA/eCXezBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+rbuOaObhwYuCn8S1Oz1koT56u1uPNM9l3uzZA/9ow=;
 b=vtp9GhBufBPTMHaLS8yAKPKKOVFZJqNryb8v1uFrl/OgHtH0pClZwIgVk4dS/25Pjcn02XwpuH9GzzCBttdSXsLOuye0YylAVH/53Gj210TnLlA2xcSw90iBqrOk5//547eguLqpbF8oGnBZTI/1mWgbLhfQefwWdHOY1SmGS3+msbudANuQl0bdKlDCNlPcMKSzzl8Dc4vF37uSLGIJ1ICAaCJL5xCRCuxAR5y3HdME9O39lfbliJhLWfFbC6fTlHaD2LfIcrU+PpP4W4pR84ofA1PWNfGydOD1zmN9G/yVan3IC8iYLZP2V6uYh6Xe0Rg9RHR+Yi69ZuT3hq5Z8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB7570.namprd11.prod.outlook.com (2603:10b6:510:27a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Thu, 13 Nov 2025 02:59:14 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 02:59:14 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 05/11 v2] python3-pytest-asyncio: add UPSTREAM_CHECK_PYPI_PACKAGE
Date: Thu, 13 Nov 2025 10:58:49 +0800
Message-Id: <20251113025855.1520038-5-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113025855.1520038-1-yi.zhao@windriver.com>
References: <20251113025855.1520038-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY1PR01CA0197.jpnprd01.prod.outlook.com (2603:1096:403::27)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH7PR11MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: 54d561e7-070d-430e-f11b-08de2260a0e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UMM90pH3lo8hwIVNo9U7vNRFbzqxP/NatCAgydkHRcL9U77lYBCCkmBBtchJ?=
 =?us-ascii?Q?SXIaaUs6iq6oE6dClsay5pck/eBtv2rZJN1aPhJL5JsalakJxvx5uhEbZnju?=
 =?us-ascii?Q?y7SUBQNb9EZV7ZRDyWeYougUxuvJp8jrr3wZ62qzEcjVYKeEjOtkHMGQa/kN?=
 =?us-ascii?Q?hFFKrZN5UClrQJd/8pQUaYZyPHYAuMBbL4SNneOBEYSMst7zK89DPlKVTXMW?=
 =?us-ascii?Q?zMeUpjZimKf0q1j/rUFdOBKQu62CiKAisq1kitX40HB0XLLZ7jA5yH/LrlAm?=
 =?us-ascii?Q?Q3vIIFrJsere1i1lPn3jGPN3Af/UWYxA1JLgKkWKRsqmdR66GUkmb3/Is+Xz?=
 =?us-ascii?Q?kG6Rw+RTr3z6gv3Hn3UAfRHUsvNb0oXwW/dA5CPVo3XiIKsIZAbsAXFSyC3j?=
 =?us-ascii?Q?SQjFiV2yQSLo9Daj8jcWTZnwocjYIiPd9PQdI6BahOdD2SVMhoYe4+z2RKen?=
 =?us-ascii?Q?hONbMZGfhp3HrgEpwYj/TVs1FUwEm0c8bEXysBH9LJ/odj4imlKosD3ytm90?=
 =?us-ascii?Q?ZQbEHAB0sPoMd9l0WspvQ8/MN+MZUM0bMU/TdJqcE7AGsGB+hyhuAEe3p1g/?=
 =?us-ascii?Q?LPbsiEH3+yQ1aRz+ofXBKAblt/fiwoLzC7W2nPTjyAiVRx2Ij+hBKwnnzIUJ?=
 =?us-ascii?Q?P36jIZVYeTMsvlCzEFJKFFgK5Ex5L4vDVTmv4g4tSgTI9Zl5A489KIlmpr0B?=
 =?us-ascii?Q?fM8DkVvwfr4XLajbi4hDmZ+Ae/0OxqGUR11lvmoCmOO/CeG8j2/j/t0dTsUB?=
 =?us-ascii?Q?tUtmephZNPd4O4sOJr8EsWmYUps4oq2Rv/SPh+PJPn8B9aF0F80aRULFC8P/?=
 =?us-ascii?Q?pAaZSh5mHII77C2e2qQBxw4iowTnFtvSTRBIInq/N6HPEmhgsWrBItvrEyEC?=
 =?us-ascii?Q?meVAGpH5vmclQ+TmC1YBo7tRVja0YdbP1//tvbZhJ0yAcN3vhTyqt5fdR6DG?=
 =?us-ascii?Q?g/pPO+CiyH2TylV86to9Ka6CbrUHkQX8rPPCtL1YrLqxwVJl87/aHlPFt07B?=
 =?us-ascii?Q?QmMc61oDVQr3v2goZzBl0lmCotKYfIC5xECH6VA2m9Tw24W+krb3aKneQL8C?=
 =?us-ascii?Q?y240DVH+vIDvmy7fVSajCbPfdIfAWq0axsJKkcJa2DJ+b/Xq2J2o1MVVfP9t?=
 =?us-ascii?Q?Lif96gWFGPifOY128iSNHlp7qnz0gs2BGZf5Kp7SJ7Lj8aj/P1ZfPf9XVIrP?=
 =?us-ascii?Q?Z0oCiUp8sHCaKcxeEAnrNHFqVPBGXqZdf8T1/5zwzcto4QZL1ehVGTf/WVZ4?=
 =?us-ascii?Q?pIg0HR/cu/ubyu9uvs/pzeoQCmTi26dJFfp6Vth4BYYGcyyO3RKehaARqx1V?=
 =?us-ascii?Q?XJZ3VnhtKI5o+0ilwq7J2d5YhTa2hBkWkndesOIinqWdURemirLMB0eJefw+?=
 =?us-ascii?Q?UpYh4hKcME0VD6Dj3fDZy6ZOo7HSw4QQw223Nr8kiE9TlsRWk+I425Eojbnn?=
 =?us-ascii?Q?OqL0gCVVGgY47QAXdzmQ1il+TFlWK0HTTsGMscumSJyN96EJaCRHdIs5g2Jh?=
 =?us-ascii?Q?wU/NBbM+7E6+ZVwy3OTm0g0e9hrIdX1Kvmo/?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tD3P5alq3xwt2yM+t7GK33zGaiySsOf0V21si04JvWl1LtI6cbwYdShurnMQ?=
 =?us-ascii?Q?XIViSD8qmHeLVEmbl3vBKuvGYYsnbkW/rUrmr7e/nG9Q7xW0BeQ7vVdwFmWC?=
 =?us-ascii?Q?isA3WNri7y9FPPmMekdSeQft54wnG6T7xhgjNsU2FJ3s565/g8OnMShqqJ41?=
 =?us-ascii?Q?QcoCU3N0YT8lcRcMcGVEOPVer2ThcsmZIehmYmQVccpvejmSwb6/G2XCXOnF?=
 =?us-ascii?Q?5nFIGQjqfWjNSDMvh0SbIEkvRVNgDJvrvedxC3jH872JAHcBGonguLeTDXDT?=
 =?us-ascii?Q?rcoJDjLpdH5FuZlovNpdOqmzOYjqFYQlvSxPvspvNnxqd0OjwRNmj7xzU5pP?=
 =?us-ascii?Q?zc9yXtHdXGv2i11wFlIxLRF07Kf5t6yZh/pbqtYCy22wsYx++LqblelAuODC?=
 =?us-ascii?Q?INAvoX4teNbVKKuOX19XhUG7jqGWa4gRZmjrizu5NDLj2hX6oz8dUOIUyDeh?=
 =?us-ascii?Q?MmUgNVM8OMEaADM30BUV0+j7eswOT1vJDtpnHqHcatUkVcbIx1EgbDg3MqZB?=
 =?us-ascii?Q?iS+SxcLOSvI8xA+tqm4bF0DyUAXv4AJrKt7NH9sOtVvPFVur4eLpjtDbc8ct?=
 =?us-ascii?Q?elTCvvwjSPBBWMJqVZlCsn39QTK7oGKO5+CnU43uCPiATuH9bAtU7WIJz3dG?=
 =?us-ascii?Q?XhShm5l61WmqlNmmpgyH/y8zagpYfIHl6EkijV2xUogUL9QLWlofuRPj5mh9?=
 =?us-ascii?Q?HZH1BN0XpSxjb3QrwSWvUVRScuzficDE8OzeEKwpSo+K1HjxciG60dvgMQyD?=
 =?us-ascii?Q?RAVWrIZdxPUYy7+1c5cGPzmjhSqw8evfku0I+s2dJkbeeYzNOrS1frVLQ5ui?=
 =?us-ascii?Q?gSZaCrZF9JwEOs9wpp1CSoSxtRQNbLPhM9e3iu8zxlfypGi+idkxMN1WvhFG?=
 =?us-ascii?Q?4aSwvLiuj/6dQJN7t02D0+oRxBqGLoryxviOPAilitoB7fLOtNj/ZFaxPmKN?=
 =?us-ascii?Q?QX1lq1ldshvPVFoxsdMU2DZKDp43mo2F3gMxqRCK7CqdPTVyNpN0V12THu7U?=
 =?us-ascii?Q?IFVgrFq1DFER77XAAe6VPJZqTVzVxssy8P3UlDloupmjbkwEpl1tIOdXf5Km?=
 =?us-ascii?Q?SU5LwM+ckZQUEHnx1jkWUGk7PAIndKnhJj1gGThFrV/MfvKAuHdu14XzXwto?=
 =?us-ascii?Q?thKM8gsKZRTsK1HxfIu2KCzFPIkSxLONZSmk9SaEaHlAHbdTq53572LB8d4Q?=
 =?us-ascii?Q?JZThOfwe2h3FRBFNHMq9T8rs2As+dU4wk3cXrlOvU/16LHTiNtXQdNVD0dAK?=
 =?us-ascii?Q?UN4N7rGomhCowC00wfqh9UzmFMpQDj3RrVY+ktMGVzTtCcNcPimdoAgKG6Z6?=
 =?us-ascii?Q?47fYJcQUr5me0XLLAQO1r2I9qc5xrXa486fwuRLiQtk/G4E3XNhiTMK6Kv+3?=
 =?us-ascii?Q?i0sB1qDji2esYisbydIi0JVWrQtzS+Frbwxbu6LatEfViSM5UZZ5zz1ZJcQy?=
 =?us-ascii?Q?avQA+M1Pdrdut0HY0iwAYABwnQ7Pquv4cvQlfH1zpoQ5pFCBZvmVG00RzSyL?=
 =?us-ascii?Q?WhNIbWZcYycyMI/xqDC4UB2zGdSMxEmTYkvMNZvOjjU0+h5fB5h1SItwtUBa?=
 =?us-ascii?Q?GNR1D2PusGmNlzMmHav/h6Wvhc+KC6dAkDjoRn/p?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d561e7-070d-430e-f11b-08de2260a0e5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 02:59:14.7717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JD6I1NepEuWAYn49f3NCnWAOJQPbyOmArLv1tlFPdY9Oc72U5VgtdT/DCM0bftWhRkaQF3wfSCKoM+IqcAH75A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7570
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDAyMCBTYWx0ZWRfXxlKqzpyR/Rkx
 tbzpWJDyx0SdvfSfRXf3GIBOsbhhRVliCF7SkDevmdnZBI5dqL+/GCxKbkb8Vdciimt/724YuZK
 abZ+AAr2WCdehbYBb7hzuqujyL9fKmaPcCyxL2oLPOL+KYl4llIXeTMW1yfPoHrsObwuRbMFAPZ
 fcg5uKVndf5LEhHpgbiV7GtlkJba2oRjYNs7tGKRCATV7agrgFSomVvmraHxbuhJ4unrDHCfhsN
 8VNYRY5+mLWjshAI9zwJjfHGEqu54seRDgR/pRcYm3AT3wmPqBNvzdbqALRsi3t00pzA/Jiop4w
 1UiwN5RHGRn2zMUkLUgt8fPWmhjjzQHNhmR/ud7emDAajZTiavfXnpg/lQw7cVPE3DZeSdo0qn8
 N8HKiqGZKCSRil7wjVXDymX+vImWog==
X-Proofpoint-ORIG-GUID: GblxWTZQ9Ldmeqo_nF2LshRfeL9V5ODJ
X-Authority-Analysis: v=2.4 cv=XPA9iAhE c=1 sm=1 tr=0 ts=69154985 cx=c_pps
 a=xBk5Uq5DOFf1FlsSGvIvFQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=rR3rKrEq9my3PbB2fw4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: GblxWTZQ9Ldmeqo_nF2LshRfeL9V5ODJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 02:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121589

Add UPSTREAM_CHECK_PYPI_PACKAGE to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version python3-pytest-asyncio
INFO: Current version: 1.1.0
INFO: Latest version: 0.23.6

After the patch:
$ devtool latest-version python3-pytest-asyncio
INFO: Current version: 1.1.0
INFO: Latest version: 1.3.0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-devtools/python/python3-pytest-asyncio_1.1.0.bb      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.1.0.bb
index 4ac45fb1a8..424a68debc 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.1.0.bb
@@ -8,6 +8,7 @@ SRC_URI[sha256sum] = "796aa822981e01b68c12e4827b8697108f7205020f24b5793b3c41555d
 inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "pytest_asyncio"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.34.1


