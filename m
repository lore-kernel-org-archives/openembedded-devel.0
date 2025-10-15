Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15EDDCCD192
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 12:33:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15399.1760531629288548387
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Oct 2025 05:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lkPrNab/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2383f062e7=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59F4KgAZ1035161
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 12:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=yUcbnLLS4O7YphmgJ6xm
	lYSpTJQ5EhhEXkwEH/iHa2s=; b=lkPrNab/tg2Q0w5GAr9tYWDoqW1pXGBYdeef
	zQsVsnzE4xRRr14pC5T/btPE1FF12S7NDvKHvpmKG88vobhi2636MwrQHp68vP4m
	0jtpArR5pc22n4rwYadEAZFG0S/IilVoS7PN9P/0p9PoNQx7zLaykmJ9stknfMof
	12JtjaIleCdKJBT3j+h7SsZGIl3P0BrqkXc0I8L/bVU+Y7gGsr2pA05RJYdbe07x
	LUfZDmeD8U08f9Cw2oRBlkxdNyAldsUmqnAn+vWG9TwX2WgNroGpMBqnDRMftg5f
	Ew36ezWkiItuLLCsh1LzFzN/ld180ynevUB68mAD3XIa0yEyHw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011041.outbound.protection.outlook.com [52.101.62.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49sthh9cp6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 12:33:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LViEhrRm1JbbhYxCRC8x36cZURABpMHdH8DOhc4eQ6n781b5KP5M5uHIdTauQKkKRQweK3yPR2rxWrpNvYXsnd4gbFJdFV47wu9r5saCk5QLQLriFTqyG+ynf1e+sB0yhhQ21Y+inVwuWDhfFdSO9Nn9/cXJAITkk9EMXYLAwcuA+upi3xbZ/lMBanYbgDW67pe+dL9b1HG7sKonUJ9895DWOR77FzAkMaQnqp770RkgSMlrXf8fcYd6XjinviMsh2RdRubluikusDht5rsXK05kcOWO9nG6Rp9T9u0a9sZeGf/nZAy1YOYFJYppNnNnttVWqj2cvODslKYBIi8Oxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUcbnLLS4O7YphmgJ6xmlYSpTJQ5EhhEXkwEH/iHa2s=;
 b=T3ocsz9JhJSOlaeC/ye88huxd/czQly5LbLMuLcBwkL1oKVZAJNum81nKqZKjKLwInLQQjV0c6DUvyeHKCKkksdmQCDpQlgeOnvHNTuupUdhOVczyPHUcnMQXThfDTQIP6UPh+ir6A4l6lDXKexNuFL8stUM5yKEQTOtInHIMcJI0pwzYPXQNnLTqXJ48WWYDB3Mko075ticTBeUln5MhY/g2qNo6qYG4olsIY6dgAG2h8C6vzEnuxJkKxbv2sBFuuXjUUTioO9S6klnlduWys5C+7Q0JnXIM/5RgQhzdLpywOy827DugeLEVnbOPDV7MsyIRt9xuTh1S5kbzZjOXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH8PR11MB8258.namprd11.prod.outlook.com (2603:10b6:510:1c1::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.10; Wed, 15 Oct 2025 12:33:44 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 12:33:44 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] libldb: upgrade 2.8.1 -> 2.8.2
Date: Wed, 15 Oct 2025 20:33:23 +0800
Message-Id: <20251015123324.732190-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0178.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::19) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH8PR11MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: 1354b563-0e02-4aab-b876-08de0be71486
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GxAE8Z2yL7kjhBgJ+iBObA+mhSFAp08z/AJ6kMT9A4JlVxfbYBzuT8mrZHnq?=
 =?us-ascii?Q?gpbKVFN1sSqKkXNhQBnp4/NxH+rI4TdxAZpbEpFLSSR7u9hV2Cbn5ld5f0NV?=
 =?us-ascii?Q?eCOPy60HAHvFlFJRC0gC6fQAoxqQLg/e0hBV24fOf/4yjbHXlJFkanfzz4aw?=
 =?us-ascii?Q?IGw24kkXPZAaEllPDftDe2WIVTQnYkW73lgEJ6GT6X8MGBpaleJYPq9Ost14?=
 =?us-ascii?Q?qwT/xgqJPPIEHXDjJd0NyIhPUDJwpwpgTOsgx6B54aUpOqOtdTgCJ8lvda3U?=
 =?us-ascii?Q?i7trxQ29OioIIjqtcF4P+6yhQtX1y8KwFiayz0ZY3oT4y+sVDXOimFXekVGH?=
 =?us-ascii?Q?x4sAMzn9AZEoVqdUCwpLtC4Vi3EZhTtZCD0FvaUTiTD75Rl2yfDjzXSfhOE3?=
 =?us-ascii?Q?ScpuAQEDSimbm//0PSOH0MN0cmXfh7ZsYDsp1vhKPgwdtPI/V6LMTIlEhN+K?=
 =?us-ascii?Q?D1Ph2ggqT4kjqiX3CrZK7dMLVZSMp7bHu2AnLx9AcJWkuwcq6fZBUfF7nYr6?=
 =?us-ascii?Q?Vh68mD94stY/3ZZizdlqSpKM2FVR5AS9qf/JWWwS2BYztWZKFyGToGpVaimg?=
 =?us-ascii?Q?cIPbJ6VGTP4U4qijNBsWHuE1SKds35BSTo8mU/yXrxTH3ml1BkmRYfYkLfFi?=
 =?us-ascii?Q?0UNYjTah4u2QGqtFpYtyBBDY8CwuMWtNzC1JtNnr5TFXB2xvl8ZsPKO+YBy5?=
 =?us-ascii?Q?jsLWkZLzdubnTBO+yYJ9YH7EXFVGkA0wSv6qTxaxY9k+KnvrRvVEAPQ7H6EJ?=
 =?us-ascii?Q?bMC8OLzd5Z5nvHAKV+HdXqRSTbgLlhlOoUEDCypw4x88WYzNTrjX1xQPEyyb?=
 =?us-ascii?Q?gvoFx6xZWiL26JUKxe2FSfEah87F+Aemw8+oqkN/uHT/CpmB3pbubDWcyyk5?=
 =?us-ascii?Q?fQ3rtAgih+LlQyVCz3M6okv3RVJRpOIQk9sOMLe+CR4FsiSb8LEmwzmQQ5Yd?=
 =?us-ascii?Q?3zTMpRO6kw84ESY7HhQVFDEG72a5a0rfdkG6TY6VvHWZKKYKcGFJnQxuT25B?=
 =?us-ascii?Q?8DvatuxK0L0usCwSOTexZX7FoEjE5kKIK8KcZpSi8kP56QvJv5kox3fxoCD4?=
 =?us-ascii?Q?+ZzGrzPHhhLA/zI4pxamkyXwmD6PY8c83xxwql7WNDJmCChNtp8E0H6HBxwA?=
 =?us-ascii?Q?46v5x3M3sM6IaoZ2iOd+05fRUk6CrND4Uuyei50lsz0f3xRPyvQWdafj/06U?=
 =?us-ascii?Q?J5j+kE1AXE4MbU1wWAV5PAVUXLQYgDlUq6Bo6Dd5txdZxjtBnGnDt0s4KsVj?=
 =?us-ascii?Q?by63ASigHNLKRn7dxXe/FLPuQqzf6f8SHxZmCX5fmByNJy6t6YOPjaR21+AY?=
 =?us-ascii?Q?BODHXy1DKwNlqnMx0Tfg9LCa5kI2k13CKYXV+wyMnHIwAG31fC8f/Xqbz5VO?=
 =?us-ascii?Q?YLpP4eKW1RYEjUT9OWjfzaj+wK6GvFjUzVHhqccqsAUVx2mHcCjOesoYITpx?=
 =?us-ascii?Q?mhUAn89AlVdi6BFwPWk5EgxoH4GEQdbiyuSN2CqnsdeXiH6L35mTRgJb0/co?=
 =?us-ascii?Q?0oxThLN7rsJs0otZteKuf5f9xjpmhhQD+4Gx?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9wirOy/yTVQvS432Msj71d+2H+7H31xVHsQaXfPydTvbOphFOGOK/Qg1dJAi?=
 =?us-ascii?Q?V1FJCz2PFJOR/FFfkgNYKWgsExVgqghIgWilkMBtmgJu1o0xdeRQMjfoCEnP?=
 =?us-ascii?Q?dnwQ34PHzsUwRsPHfqUIsFGeW/bnNGG4NRcqb9O+6NBWZKbUr8VVFGdax9PW?=
 =?us-ascii?Q?wX2BWPyUzHdJB1/GN88fwlbBFz6f4ipOcdmyXGPnfntzCF3LeFMqE7OS2j7D?=
 =?us-ascii?Q?XLpTTyMO30677xHBIqfCgGdQlFvdCmFccpi0w6FoJZ4v5VZFX6/fwhKfxe//?=
 =?us-ascii?Q?RkNR/0I6bPXJV9SK08PJFd/sWDsnLXm44voiCvWvxHldng0W93VVkVPM2EWO?=
 =?us-ascii?Q?luz3HQFX79VTXvjLc03IUQYQq6ALUv8QuxLxmt+i8pgGk3v6BEbGMa9NSNrk?=
 =?us-ascii?Q?LQyTacx7I98GvuUTeNXYLh4uxqGNSCcoWkFj58PmeGkuEKDUZ9PjNRdkViKB?=
 =?us-ascii?Q?Zyi30IFA/0HZAIh7OLdXWy8HksVYkVin8q+M+lGnwik/J2/ec1y8EW5xF+Ul?=
 =?us-ascii?Q?l/h0m7dH2mczBlApxO49tJYFAMRe3Ekp78DbQZrhc7r/eR2BemkkQit6xuYR?=
 =?us-ascii?Q?BPAaWCAfDJdxo8m8Lm5sDB6QvYyeDIe2KzrayDL8OuntVZuNodlpGzV22D0D?=
 =?us-ascii?Q?fgGVM01t1vDIiJB+QqDK0tFjq2Yxc2iDJ6qjnE/Hlnk2Y25ywQI84bstn6y9?=
 =?us-ascii?Q?HZBKd7z5Z5K5ssmfW/9Qx2ABtNhFik1+cmaTBbPBipx3sY/InsgmPmco52yO?=
 =?us-ascii?Q?xADr6IHP5KLdLPVlxFiEOvJZnmo5eIqJ5msLVp0KWp+ihVqKgkApEHmMU6hz?=
 =?us-ascii?Q?zwZfQSCZJflxOzIEHQWPc2w2JX0CikQH3FU6q4DX5Q6MkXxnKV7ynPMIIKZh?=
 =?us-ascii?Q?RuREPmptiCoiUXIz5qhg2dIBE1O8kyTwvHhZxEuuFgt3gHTImeh0rKOA7rlh?=
 =?us-ascii?Q?/pIaMyKgzpNemD+PV2Lq68NA8cMQrMGrswEq8v75c+/z6NZpsqg5fVrbGOkw?=
 =?us-ascii?Q?BDO2yEj+ZfRG0Y/JH1CkbJ1s61xl11c9WhkmYOu6WXgOlN8653UvMxWC+kXj?=
 =?us-ascii?Q?PqnCpMb5cyXSmUXpcW6Rjbgwd+VY1q80WA73B9hsTZaDfX0PpWWCs3w1fvmh?=
 =?us-ascii?Q?wyWBaJ6lmN2Gkt4imzONw0D4UBDggsYqXg7STsExXmb2PFJDTNiSX1BG7qeb?=
 =?us-ascii?Q?oyPzoI9usq9vsiankrWe38xh6ulp0imqN54eJXY6S67VDM3wefNi2uM24dMg?=
 =?us-ascii?Q?TGQ3vqSntLPV68YaEyiREQyQqDhzEfijQS2IIuN0/1j9H8y/l9oUxli02eWO?=
 =?us-ascii?Q?D/qp7NAJlDGXpUfKN5zhjFBelRzYeDYNZvewqggVhaWi4CqbPCjIxxMxAvoU?=
 =?us-ascii?Q?P9wHANRhDXkZn0RPfFODbyyrZUg2Ng0jRXG5Ysc5oFIenSsrxfpjH2IH2MmV?=
 =?us-ascii?Q?KXLQNN/8bf4tnrjrpIfKsz+PYyMCwQdFcJVCbkctZqywxUJj5t504xltmAY6?=
 =?us-ascii?Q?0cqtFsUKykSboBcyrF7YrD34iI7o4K7wyCUCDp8B+P//JG7OrWcJyol+7u1I?=
 =?us-ascii?Q?W6s1e6qC/G+WPxyQrRAXtu36hqsVB1/IipH7FATW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1354b563-0e02-4aab-b876-08de0be71486
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 12:33:44.5335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p233CMMULENyUliAFYDdGYBxxJs0RdGQXUcqXLqpFPOsUv+IWp0aQZKP/lnpNKXIc/q82QDYimbEsVRn3O9szQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8258
X-Proofpoint-GUID: reAn29Bf_U81uX0VlJUpS0eSdrcGPXm8
X-Proofpoint-ORIG-GUID: reAn29Bf_U81uX0VlJUpS0eSdrcGPXm8
X-Authority-Analysis: v=2.4 cv=QLBlhwLL c=1 sm=1 tr=0 ts=68ef94ac cx=c_pps
 a=ouBVT1c3MJkzDXWVqRnxag==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=hGzw-44bAAAA:8 a=t7CeM3EgAAAA:8 a=XKdr95i7JqerCAM43OYA:9
 a=HvKuF1_PTVFglORKqfwH:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE1MDA5OCBTYWx0ZWRfXwJEjHiMmiCKO
 cxCMyNPwTsRqIgovDCLth7bnleoM/su5WlzuvL7FapMO08/XnuV/Vl+dWQjNJoLTmApCqH5QiAO
 DbDrD+ZrvkQXYBCLnS0m3gf+jXp445ToVhw+y7sfBcp4WvQkFEgX7vjcCZCEwpXD+RxDDkrd9j0
 KLeLHJzZDkNrfoBDfOvacGP58YwOy7fnpcw+omS+5Ot9lzGAlC0ctd6D2ln1Z/b80rwig+UT6KF
 CQIfJzdosojZnfqdkr2J2orzUKCDZXZfMCkDrOBsqoD33enfpgiFZ1xucsrKaOWRWUXyJGL3CQx
 tgRgx/yvZYoLhNy+3n8+VyVLhChfiHJRecD632QqUAerkfAw9xpV6aK5WJn/b3k8dtGE87t01ik
 X8wLJumMisa3N+cJf06IGYZtBsy9Gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510150098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 12:33:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120709

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libldb/{libldb_2.8.1.bb => libldb_2.8.2.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_2.8.1.bb => libldb_2.8.2.bb} (95%)

diff --git a/meta-networking/recipes-support/libldb/libldb_2.8.1.bb b/meta-networking/recipes-support/libldb/libldb_2.8.2.bb
similarity index 95%
rename from meta-networking/recipes-support/libldb/libldb_2.8.1.bb
rename to meta-networking/recipes-support/libldb/libldb_2.8.2.bb
index dbb27e6ba6..6038066169 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.8.1.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.8.2.bb
@@ -9,7 +9,7 @@ RDEPENDS:pyldb += "python3"
 export PYTHONHASHSEED = "1"
 export PYTHONARCHDIR = "${PYTHON_SITEPACKAGES_DIR}"
 
-SRC_URI = "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
+SRC_URI = "https://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
            file://0001-do-not-import-target-module-while-cross-compile.patch \
            file://0002-ldb-Add-configure-options-for-packages.patch \
            file://0003-Fix-pyext_PATTERN-for-cross-compilation.patch \
@@ -34,7 +34,7 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[sha256sum] = "b68ce6eb0ccd2870fa3c8c334f2028b5d16606fd41308696c17b71959f7bf59f"
+SRC_URI[sha256sum] = "0e9aeb657aedbd048b1c0de4afe5b01a8dd33c24a6adb8361a0829374a2fc016"
 
 inherit pkgconfig waf-samba ptest
 
-- 
2.34.1


