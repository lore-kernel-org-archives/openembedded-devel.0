Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60060F55136
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 05:55:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24123.1772949301073452526
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Mar 2026 21:55:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SrlmUWTg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7527cf9310=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6285IMlB3880835
	for <openembedded-devel@lists.openembedded.org>; Sun, 8 Mar 2026 05:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=rxxvKBtBIA/57PqWLHtQqhQTZBqYkoGBqU8vsvre2WU=; b=
	SrlmUWTgWtCJ3pm+pl1IA9B7DcXaDeKVEjLZL3Z2UMpLHmZxsT0srT2lsGJhMbtX
	LHmTq7uqWSquaJdWih6e2BWzoGiPa07ydTgAxLHNdQ+Gaa9x5iTRbX8HO6cTuuSO
	xRECekNiu3Pjmsg4D/+IfFqI7DidtKFzIgI2TLzEvBWXBaiuLp4oPdftZZCmdj+h
	iLf5cIm1EDJN8meZ7MF6WPIRqVHvNwNIQLZ+YK75QfMiNKpvAPRNxIS/Ty5uHWd0
	23fpGAw6AWWSUi4AwHn8cngVg21wbpe2lIVAaezlErrJihndO4cWOhsd2dPoI0rJ
	P2YqGvysR3xAjQSwE5F++A==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012021.outbound.protection.outlook.com [52.101.48.21])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cr97v8vd0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 05:54:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KEs+IzKLLn/I4S4SDdS/Y1RPmdnkDrv40vX5fUnXCTNHss5ylJkNc5IHiSpnW7uxXtLWQiKIxywDR27TtoUAVm/ibPP5NcY9SLX2wYlSE14rwtlQx/k8kbDCPcFZ4t8/rDtAcwjJUlMVt0pssxM7LRdu7/aK5gIWqr9XU4//LXG878G7vfrOJaQoZfUOpknNavfrnRmr68A1q4q7kZOIDBJFh0I3l/yPZiUDGdosSnILh+fMgPJJ+Plk/uLCZb75OIYAOsG9LTguDba9QjJb8m0yYjzDZ4v5p6RZEbu0DkzvjJ9hM1rEVIvmrU2J2fyxIvy4mQzwKd40ph93qiIOAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxxvKBtBIA/57PqWLHtQqhQTZBqYkoGBqU8vsvre2WU=;
 b=boyk16kCGZymanDRQ1nLdPbktMM5wo7GsHzrzb7mvdp9evOIcTIIPHP0b4JSAX8NJKDeVMnTtBslGTmpCDFkYBW7JgBZMY7EDjuYws7jZovfq+bugw0b+o687qXwudMDvkxOXtYcP7mEkJHao2FmQfWda/XfQUfffMpBhH+goycoiIFF//5C0VwZnwPDi3B7ipYFPqNfGQJ+LjukITYZiayp+9zYZx93MYn1YKR4MRYBmT0RZ5H+rCOBFJUmQAJ9XTw1w9OulCtDtxWBFWEchaHes+bY/en/TnmPau80uPCJcNkoaSpJD1AGncNmkjofhdSAkhE/1JydchWDhLrhrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS4PPF7CFF9C87C.namprd11.prod.outlook.com (2603:10b6:f:fc02::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.7; Sun, 8 Mar
 2026 05:54:58 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9700.006; Sun, 8 Mar 2026
 05:54:58 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [meta-oe][PATCH 3/3] bcc: Add ARM and AArch64 support to static tracepoints
Date: Sat,  7 Mar 2026 21:54:12 -0800
Message-ID: <20260308055412.2450108-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260308055412.2450108-1-Harish.Sadineni@windriver.com>
References: <20260308055412.2450108-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:a03:505::19) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS4PPF7CFF9C87C:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f40e43-8e4c-434e-4633-08de7cd73af1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	o2Qd0fmXdzK8NUf8/kFVHplOH4zj101LK94oM8pRk14Bt/JMbWwuE2Anr6ikErP9XhxCrLSifovwleU8dj5nRFNrLuw4sViZ/BRVHwb4cc3wQhHJZj8jWJkblZmNeymV3TYz6HnncWdwqGVQJW2tntCgKP+G9HF4zgLCEmZCERzHbRaxFm5J20ZoXuMBvscoRUaIJ2qzIS9KKC9ZFy4j3q91n4ay3zvA9GJjG8gCWS6TTghoT0Ek0sbVv9QhGdo1F/UV11XiSZoh8DTNef8dkAPkhWT66Q6MR52ZPIdtu/mYg7gBtNkzNHbgMAGkUEUzHCieXwyyUFEooSZVToQAlZLYCyBfk4Xc4FyHu/KyxWOfAVqQcUYgBf8RVQtdayVbaJ2RQvvU81ofAroPVsv/1ZJG7csYqtrug96Lyjzp4DB0L/yjiBGkm3BeVqTFp/ix1U+8SppH3rjJBECEFsVHn3FfU3JGN2c36XOLbzsqw94tHBunk0yfwIY6+O/yTbaO2M6SRxuiOYw+VLoMRV4yjdfLmS1iqQPDP6fUUu21wT6q6HwvOY9QeInKUBZguGS4azPQ2O0aZpAY986Ndc9s2HQXpFqPI+xb8ETYkfkUkg+jlBFsCjF/2iQaS0tqYz3OIaNs7NgxMjifPFfXCEPkRZBo83Xhm7YHOoaOxJdX6PhnQiqViQBPoTY8n/RtnkAJ7eRTFJu+hrmulZeB2ARAKdDL5q9rEQKS3Ejxivb/j6OscJ94GRf/md7iBjzhM/7A
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DvZl2YRVBotTgwYiXuwkxIqiAyDK3edGmLo4LTTV7Bh638OKzv8b45FJB3gd?=
 =?us-ascii?Q?JEJMdNlTlQLMpWeZwX5NDepGo2LtD9Pb4Kw7hHhIXDeiHL0CtjoPDDs1ZFbS?=
 =?us-ascii?Q?zcp/WC2vqsYqkhZIwqAz9P0jnnqAh+EKByUnqWwzWEUGoHwW4IqR/Gbq0lZM?=
 =?us-ascii?Q?CmRuKhj31MU0hL28EcrDznKb455tqjk5c4x7Fh9uNATJD3zpsWXBI9eY59cV?=
 =?us-ascii?Q?EnajvvqloP1y1UPETy9smj3Py3svM63jHJZMP61zxqkbhuV4+uRL0iqRoqph?=
 =?us-ascii?Q?PCLa7ymCzXWp4gbuwZt/UyS1LiFV6q5KZ88gUcJK/peire7Y5+ppCSqiewpn?=
 =?us-ascii?Q?sstDw0BA29v3SoBeR38b8FY69nbzXPHGov91ZrNj76lUUbBMCgJOLIZv/DvL?=
 =?us-ascii?Q?DKgdok7kQaPlKYo0uti/dp/pDP3sgI/1gPAjUG7WuT1aSpYkDGDl9uy3mKId?=
 =?us-ascii?Q?El7A0wocGo8ECul1+go2CW+bpSfqPgItsaqGlXpYQowgPAnXsPip3cUI5d2u?=
 =?us-ascii?Q?Cfxh4EA1rXdFi0gd9x6HxtxRvhOGnyix+MrEm+tWEUt6BHEnWJr9KWulsqoJ?=
 =?us-ascii?Q?CxojJ0VWJUWcxPZLDNYvpKyZD/Urf77FLeZmz6jnE1R6q8mtoriQMdqjTrEt?=
 =?us-ascii?Q?cKwBEntLD0aqfIfEJ+CLysS3drWm1qaINF/n+qEVyVLbBzgZmoMbNm8XuBew?=
 =?us-ascii?Q?TqQIDxD2Lb6uTeDpTC43avJaNZjnCa3yZi3XR46nBiERYl0+vuLpQrZA7HQF?=
 =?us-ascii?Q?hjz8WESwjWV9jcTbCMekSmisHE+ACiElTLSKtjRRTyIsS337XSI3C47D6zgs?=
 =?us-ascii?Q?9HnbmlldToPlKJoAT1Qr014c9LBPFNdzfWeSMyPEyF2EYbhHj+I+ZBRUW0tZ?=
 =?us-ascii?Q?UbSka8g7c83asDtjwiqey6AL94hhRSG1cxBh6TUoqqZZFU9Z5ertYxQ7evjA?=
 =?us-ascii?Q?0ie/ekJrsTY3abYpW8Gop5rXVi8hwYo0yBmb9F6NWaVXunx1GrqSRuPC7Lmu?=
 =?us-ascii?Q?wkkS9wx6lBgKezdApORMxfrJ2J7tR5Q0SOszNa69fTTE0+IHi1DUImp+k+l/?=
 =?us-ascii?Q?J6AH40rf4T9NKx0Vanj2/7tJHzExXTA1BGmCKwaLkPsVnAqqD6SVhGSayfLj?=
 =?us-ascii?Q?EIh9aIAHFr4FzqO8AjmYdqfOgOj/2HvSZ1DDQKaqVhxFLVHWTDSQsLlTi+/s?=
 =?us-ascii?Q?oKU/rHBarZvwi8M1clupAbrlPq+xN+6KGY9LDYiMuwdxQJ0pA39MdeHAJ26U?=
 =?us-ascii?Q?z0RaTf7ZxNY7r2hOD5cJdkB7pt1JEkZGV4x6glidNI1NcaqTr8uKH1q3rThR?=
 =?us-ascii?Q?BBBOcQOmaiFVY88T+b/B3B4sLTIes/dH7evvqnIU9Ou+sVMfondlyaRsmePy?=
 =?us-ascii?Q?aZGnsz38QXspmfx150pcOYUZvXeD+5xqHkwTpaiL5mWxCgmqQVKqMfwPJxXp?=
 =?us-ascii?Q?nLHQLGTCTLagMtq13ie4cVagMUPSEJla4UWRnznD4C58SGmfg/5lVk41WRd9?=
 =?us-ascii?Q?q9fAZCNv4bjyGXviuX0J2Wna/2ZV5hTV/JKZX50aDCDgCZ+2B9Q8F1HO8mB2?=
 =?us-ascii?Q?ss7kXX7xhCg1dV3hyUZD7tAz3G9DF6YW5psRpUBRZR2CpA7ZaMKiu5MyE3tS?=
 =?us-ascii?Q?ReO6Nxe/oO8q9vNW0uIeRpXv4WhY3G0pqSNYGFB8pHJHAZLvadBf6otW6Q5e?=
 =?us-ascii?Q?APXToikKBa7fp/xgpMhNd6VFz6pcl4Qmte+TJkMSvEQekZuKDg9zeAWcPywZ?=
 =?us-ascii?Q?pxs1I3QCEo3rp0hfc+rOEZNVriC14R0=3D?=
X-Exchange-RoutingPolicyChecked: 
	PPfngNX6F8KSymZtNCmMQYBSQ0/gdbIpiQtnLdYtBkTDjV2LJR94+iJuYSta72hbB/RyW4G/tBRMJpJeVg7JPnuVNTI94a/ufadgkwMy+61JWrVhOicREdmCVONNHhJyPh2o8lhTVvhFe4Ewc3WfL1D342pt4oWA1PCuLcJiw3fc2bl7iz4Q3qgip/DO5F+goL1gYhBMXjVWjFvmByLd0gJ9aeh7LBcCe5RD4bjSqFthXKyNlsOtDcsiND/MGXU/SRuSRtCqqHaTO16AFJqZ/9usSh11+Q0VmwHDoXoV6ytBL3Olc4pF2dBrtSD6JWFiwfvLIdxRJPzb7vXizLFFWg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f40e43-8e4c-434e-4633-08de7cd73af1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 05:54:58.2843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0VfHngAJujxf4JHknLnJudHZxInqKw/lnst8+3UiuWTXHu6qK8AFG4MP/bR4ZufPUPAgxXWhNs01p5DBhsbUp6YFvptxC8EfINZGTnV694=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF7CFF9C87C
X-Proofpoint-ORIG-GUID: _IvEY_vl9mq-5EdPFTFYZxsMN4TLN1A2
X-Authority-Analysis: v=2.4 cv=B9a0EetM c=1 sm=1 tr=0 ts=69ad0f34 cx=c_pps
 a=+6ZDvk2G9QUnVG1E9ywKdQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=AGlavb5FBgy7KLhhvucA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDA1MSBTYWx0ZWRfXw2J2tugQ6K50
 CcsG0i+ttxk3F1aeQWnRgaRxgx64yNHaMsIwEmVhkn0e80MS3ROn1v38XlTWUDkE5mdfQLx/7MY
 1HpF+djTIuwxN6nQvT1sUvT6oSp7RNOB9yavAqHk/Sz3MSklNUdjgeV+/cnh3lk8JL8L5CxJhgZ
 zm4qW0EFAUFmjR7SEBPOUQALTlRCtTpDrDhC2getDQnOKyGJqbG6yvJM+uzO0ZTlfbHaAST/8hy
 yAKBp0P3b0u0kPRa3wbz1MiwwEmaDmO/QGy1GcSodj9V0rmDGarkHVss5EiApIfLjagxoYevkBL
 tHOVs6dJ1WFCwioOEzuANEB0PBYITc04NcucZ7ILBuaDnnXbMrG+sR946DkH7qCawWBUcd6h2vI
 8xA170f3gyvMrnt0OE3XICzcROH8muAppsAyE3pFbzAsYv1jdq+//yTWZLwuUAPjnXrFErGmN8I
 K8p6VvO9cq2Px6cpl8w==
X-Proofpoint-GUID: _IvEY_vl9mq-5EdPFTFYZxsMN4TLN1A2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 05:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124937

From: Harish Sadineni <Harish.Sadineni@windriver.com>

This resolves USDT probe test failures on ARM64 platforms.
Without these changes, the .note.stapsdt section containing probe
information was missing entirely on ARM64, causing test failures when
attempting to find and attach to USDT probes in the BCC test suite.

Upstream-Status: Submitted [https://github.com/iovisor/bcc/pull/5491]

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 ...move-x86-specific-naming-from-tracin.patch | 25 +++++++
 ...d-ARM-and-AArch64-support-to-static-.patch | 67 +++++++++++++++++++
 .../recipes-devtools/bcc/bcc_0.35.0.bb        |  2 +
 3 files changed, 94 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0003-folly-tracing-Remove-x86-specific-naming-from-tracin.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0004-folly-tracing-Add-ARM-and-AArch64-support-to-static-.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0003-folly-tracing-Remove-x86-specific-naming-from-tracin.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0003-folly-tracing-Remove-x86-specific-naming-from-tracin.patch
new file mode 100644
index 0000000000..2c1ff2dd73
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0003-folly-tracing-Remove-x86-specific-naming-from-tracin.patch
@@ -0,0 +1,25 @@
+From c2bd977c6c885d5cdca94ef5ac31bfcd9c4347ea Mon Sep 17 00:00:00 2001
+From: Harish Sadineni <Harish.Sadineni@windriver.com>
+Date: Sat, 7 Mar 2026 21:44:41 +0000
+Subject: [PATCH 1/2] folly/tracing: Remove x86-specific naming from tracing
+ header
+
+Rename StaticTracepoint-ELFx86.h to StaticTracepoint-ELF.h so the header
+name is no longer tied to a specific architecture, enabling future
+support for additional architectures.
+
+Upstream-Status: Submitted [https://github.com/iovisor/bcc/pull/5491]
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ .../tracing/{StaticTracepoint-ELFx86.h => StaticTracepoint-ELF.h} | 0
+ 1 file changed, 0 insertions(+), 0 deletions(-)
+ rename tests/python/include/folly/tracing/{StaticTracepoint-ELFx86.h => StaticTracepoint-ELF.h} (100%)
+
+diff --git a/tests/python/include/folly/tracing/StaticTracepoint-ELFx86.h b/tests/python/include/folly/tracing/StaticTracepoint-ELF.h
+similarity index 100%
+rename from tests/python/include/folly/tracing/StaticTracepoint-ELFx86.h
+rename to tests/python/include/folly/tracing/StaticTracepoint-ELF.h
+-- 
+2.49.1
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0004-folly-tracing-Add-ARM-and-AArch64-support-to-static-.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0004-folly-tracing-Add-ARM-and-AArch64-support-to-static-.patch
new file mode 100644
index 0000000000..2b97242753
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0004-folly-tracing-Add-ARM-and-AArch64-support-to-static-.patch
@@ -0,0 +1,67 @@
+From f290f9df0556735041bfee8e67fcad55edb4c70b Mon Sep 17 00:00:00 2001
+From: Harish Sadineni <Harish.Sadineni@windriver.com>
+Date: Sat, 7 Mar 2026 22:02:07 +0000
+Subject: [PATCH 2/2] folly/tracing: Add ARM and AArch64 support to static
+ tracepoints
+
+Extend the static tracepoint (SDT) macros to work on ARM and AArch64
+by:
+
+- Defining FOLLY_SDT_NOP as "nop" (the same mnemonic works for both
+  ARM and AArch64)
+- Adding `defined(__aarch64__) || defined(__arm__)` to the preprocessor
+  guard in StaticTracepoint.h
+
+This resolves USDT probe test failures on ARM64 platforms.
+Without these changes, the .note.stapsdt section containing probe
+information was missing entirely on ARM64, causing test failures when
+attempting to find and attach to USDT probes in the BCC test suite.
+
+Fixes: #5354
+
+Upstream-Status: Submitted [https://github.com/iovisor/bcc/pull/5491]
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ tests/python/include/folly/tracing/StaticTracepoint-ELF.h | 6 ++++++
+ tests/python/include/folly/tracing/StaticTracepoint.h     | 4 ++--
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/tests/python/include/folly/tracing/StaticTracepoint-ELF.h b/tests/python/include/folly/tracing/StaticTracepoint-ELF.h
+index 033809cb..47828309 100644
+--- a/tests/python/include/folly/tracing/StaticTracepoint-ELF.h
++++ b/tests/python/include/folly/tracing/StaticTracepoint-ELF.h
+@@ -25,7 +25,13 @@
+ #endif
+ 
+ // Instruction to emit for the probe.
++#if defined(__x86_64__) || defined(__i386__)
+ #define FOLLY_SDT_NOP                 nop
++#elif defined(__aarch64__) || defined(__arm__)
++#define FOLLY_SDT_NOP                 nop
++#else
++#error "Unsupported architecture"
++#endif
+ 
+ // Note section properties.
+ #define FOLLY_SDT_NOTE_NAME           "stapsdt"
+diff --git a/tests/python/include/folly/tracing/StaticTracepoint.h b/tests/python/include/folly/tracing/StaticTracepoint.h
+index 858b7dbc..86f8e40c 100644
+--- a/tests/python/include/folly/tracing/StaticTracepoint.h
++++ b/tests/python/include/folly/tracing/StaticTracepoint.h
+@@ -16,10 +16,10 @@
+ 
+ #pragma once
+ 
+-#if defined(__ELF__) && (defined(__x86_64__) || defined(__i386__)) && \
++#if defined(__ELF__) && (defined(__x86_64__) || defined(__i386__) || defined(__aarch64__) || defined(__arm__)) && \
+     !FOLLY_DISABLE_SDT
+ 
+-#include <folly/tracing/StaticTracepoint-ELFx86.h>
++#include <folly/tracing/StaticTracepoint-ELF.h>
+ 
+ #define FOLLY_SDT(provider, name, ...) \
+   FOLLY_SDT_PROBE_N(                   \
+-- 
+2.49.0
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.35.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.35.0.bb
index 3a34f04349..4051d7fe11 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.35.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.35.0.bb
@@ -24,6 +24,8 @@ SRC_URI = "gitsm://github.com/iovisor/bcc;branch=master;protocol=https;tag=v${PV
            file://0001-Fix-a-build-failure-with-clang21-5369.patch \
            file://0001-Add-ARM64-syscall-prefix-detection-in-C-API.patch \
            file://0002-Add-riscv-syscall-prefix-detection-in-C-API.patch \
+           file://0003-folly-tracing-Remove-x86-specific-naming-from-tracin.patch \
+           file://0004-folly-tracing-Add-ARM-and-AArch64-support-to-static-.patch \
            file://run-ptest \
            file://ptest_wrapper.sh \
            file://fix_for_memleak.patch \
-- 
2.49.0


