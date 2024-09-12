Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B2EEEB591
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 11:05:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.45307.1726139093156258604
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Sep 2024 04:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9985bb68a1=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C5EEdO012321
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Sep 2024 04:04:52 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gj44dtwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Sep 2024 04:04:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPhsqp/sdX0Ch0ShxkP3k+OmeGnn8D78HFu5lov0j1UQ235QdsAcBjTLVxblaQQxO0X2jsY2fCwntuw9dhV2YWVI7ZgozXzTvCqzb0zcfPLSf/LPXceC7ktP62tPzJhOfXLzdt6nSwhA9cOiiTI8any4LY3023pa4JWz+JGjhYmsvb1g+8X8RDnl8PiIJjTpgxpk/awo2rgdynP5HFjJk1YsFzXcs0SqldCCBWuwg1Vz8wsxvc6Z9z2B524pcS59GzUuSKfoKw+zm/I7eXqT8RyRD0ClrgaD+LHkxdcWvssm/PXlyDBRWOdhhqfHiC0kxt9yACH1Fwq09+Df8Vg+Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gARhTAEG+8s9jlQhaUCCJMEKn+dB71LDZD6pqI23ZjQ=;
 b=DEF4TRsHb7yTMmDKDKiHMHeqETA0kjRqN/j39Clz8aZfHrwsuZVg7dIgOVPQ2BDJYuV0a3jPYHQA50IpQpF6fAGRXZ5cbZOtUOMdHhdGiLeKbP2actssGYh8Zjo0LYQmeb+mDLqsVsK8pZjsNYrgrfCLsubcT3vwwnRaXBQD3wAfV8uowI4p2/gfw4Y8Orrlcj3EehZvZWNCjXmtwTwsiAH1ksHrjqFSgZwXH5E2Fiipo2XVtS/jVJBnnIz8uRAq8wsGHjiTnLYGoyQmXAsf/PJsNrffDVH4H+QGuRmj5+TbE5rGDmqJo39YxbPoZuEOEeMA03+Q24+Nnr0S1o3XRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CH3PR11MB8591.namprd11.prod.outlook.com (2603:10b6:610:1af::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Thu, 12 Sep
 2024 11:04:48 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.7939.022; Thu, 12 Sep 2024
 11:04:47 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [meta-oe][PATCH] bpftool: Add support for riscv64
Date: Thu, 12 Sep 2024 04:04:21 -0700
Message-ID: <20240912110421.1455475-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0331.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::6) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CH3PR11MB8591:EE_
X-MS-Office365-Filtering-Correlation-Id: c78eb0ee-b70b-417f-8df0-08dcd31ab6f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QV1J6S8v+3MxLXo1kKc16sCaF4nfgzUnTWdR0+GfYCTBCRJSzOQuKH2xIJWO?=
 =?us-ascii?Q?NSYVu4GO7vGGQg/TWauQq+HW5KGer2SncBTYqxvmXlopgzkYZftln+/fgymR?=
 =?us-ascii?Q?fgSHJj4vcvsv/9/FkAD9ZbhFXUbwl2KhurGmDJqdZGLLoKkTXbQk2qHTwUN2?=
 =?us-ascii?Q?oISPgiehYk0XBuCwAT6VAjBU7bBv3N6EZrPg7aMl1ab3JcKezDYHW/Xpep4z?=
 =?us-ascii?Q?3Vz95h9G3KT5h2cStXERFVFGwIVfMNSjPo/lxpFW9OUwtE19aputuRxp/g9Y?=
 =?us-ascii?Q?Y9xD33PcxGjqhp32ePXYtg1iPXJ5N0uAOYMcqaXuN5qQz+rOAMweLYHSHrFZ?=
 =?us-ascii?Q?fffAl1hHDigPoA8TqUXJVSRulGp+WeYRuztxQlyl7i1DtL4eJ4nwG+2ekpPu?=
 =?us-ascii?Q?bMhvYNpA47cUil8YdSzxJMZHun8uoZ4kYYjXK8VUr3WO0G4wp/AfgXV94D8J?=
 =?us-ascii?Q?GV9KWkpPc2bPhJDhPVHCwo1BkqZJsmvENFUZJCEhi7Js6FCDc5Kh3/2MAQ3Y?=
 =?us-ascii?Q?iqSMCsRxcnGZnoS8P45C9da7g93FyCYqXsfjm8eqkJbDFZ0djISN84zBhGH/?=
 =?us-ascii?Q?8m7XtkqTVDvrreXkMiqg3/T+RB6vJIgZ5D6oTWPofzD6XYttIFVvCLgZ4jzd?=
 =?us-ascii?Q?dUgSZ48OTww+c/nVX9PU/b0zm64jfUndb3Mv8iuzmCMADQMG/5EEEBx3esQG?=
 =?us-ascii?Q?OY+4Eh3tpE2qDjC6jLtj1Cw9iwSkMta5j822jBg7oWSqNnQzam8PtgxKY08z?=
 =?us-ascii?Q?8KyQE9j9nlRnOPP9Dg3KoF6WGO9HLT5YTCPQ2ZogI7Y6ylCFHVxcX/59EZAp?=
 =?us-ascii?Q?mWmGptk3CGO5ebRIEm9LSHxew3/AeCoL7GhZJSs/rZcc9ORvYSSuQc0yQ0op?=
 =?us-ascii?Q?6lNCzAyVKIayEdP+SF3eWkTMIfnLChBK4SYKJ4aMFIgdnB316oW8SQJPPjy2?=
 =?us-ascii?Q?M03gSaVXz4vb+DcERDrtoXHI3BXIrW2+fWbgIR4ENAvDKzkEyjMsqO5lOJEh?=
 =?us-ascii?Q?SOj6ybMdpJy1/JKkS09M/Xpg0pz6ZAXXpWHdU9mstJWsWMdoHBjPp188B+fm?=
 =?us-ascii?Q?GRyHze0hAE0ejJGRAeoie54eFO1VuH/K7nm55Mi6tj+bhejcrm/RMVVy0ONa?=
 =?us-ascii?Q?lWBfCJbge3CqrQoX8cCZFaXr8P/vI5+7sgX2pVObcL0IxQIr9PrrvWT6KWsU?=
 =?us-ascii?Q?WaOufKCMZ3GmOVztFDXeP4xLaoYlBpb3VlQ83AwsrJQOSPtzTJBP3gUCBgOJ?=
 =?us-ascii?Q?hniZZbdgiP85gVaiNwNBSzofDCpVeqrCet5/LZjadg9YDe2J3ziBS8D2gcpN?=
 =?us-ascii?Q?r/tEOfcDpxHzp9+wXloHMfVuj9TCxJhThEbNB8Spm7V+BmXJDsWWTgPQTSKR?=
 =?us-ascii?Q?9m94pBSZPt5d1RpFP3MyqFLlnW8H8ueZUjRjNY43j/6y5GxPAg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0hiMlwf3vTo9Ig5K0uN3mGVOpy7s2pO9tPs0K0LFTkqkZjpCEEQyWSRIjGbC?=
 =?us-ascii?Q?G8q8vDzdjnwHkNJ+N37pzZiGkuMniAo4V13TAKvPb5sB2DBf96NdU6I40rBp?=
 =?us-ascii?Q?QxuKSywYXp+v9uGLoHvzZYEnhorQZOqPW0s8DcRwG7DuBgE9baiGRE6sbE1+?=
 =?us-ascii?Q?8MUB/IdtjekLXJrh4Z7IZOuVk7v1W5RUPDjGgyRQmZqAx9TaOGY+JgvmpXM7?=
 =?us-ascii?Q?v99rKWyM6S1zzkjXnC9592UjFIqYzynMgKF2kcR1KAH9uWN8KxFxkdTlSbgG?=
 =?us-ascii?Q?f6k4hLNa0FWD/WZHCn2vBveuySxLIAsHTFxo3eihzfFPsZbYpRj0Ch406me4?=
 =?us-ascii?Q?mzzwXnSKfD+3TCi5r0w6bkFV76TaRS8jqBBBJ/w3lrFPW2Pr6IQnDW87xHkb?=
 =?us-ascii?Q?TvMvJQocQgBV8REdDU8ZU4404GKrsK9pvNhhvjWOcT+OOealKQvk6WzLDP3/?=
 =?us-ascii?Q?ZF2y7QmBxeaZ30cfDl/hOPU+U8+bQI7yNoGZ9pzhTOD9jrW8WPwr9rWdMXFR?=
 =?us-ascii?Q?Zm3ew0ccb4KlB11xjYWCqninaOUTogtgYIt60NUMkW8t0moSqoF0Qhgt0k5m?=
 =?us-ascii?Q?nthBfft4MXv6hWMDuAd1LNjY+3TzZayz02ZneczuTVzRbuipVIczLwybUt1Y?=
 =?us-ascii?Q?yIJqQCMA05DyCOR3cjtUlNZsOG7KREWiQzmkHSDxo/INMWGhxqfO5UIiK3/v?=
 =?us-ascii?Q?K0s2iG0BMcX8tNN1yGk55JwrKasFmJjL6z02BUkyzmyQQaLhNQXOMuZ06/s9?=
 =?us-ascii?Q?+zpbzZLU7DOrqwsoD/VC1Qa4S+ANV3Th3H6GDj30tplThl++6awmJ03VXk2E?=
 =?us-ascii?Q?BV3+1Z1TquyvTr376wpHW7JqtmBDXD5uWl1oTd3M/fcchDZk+xKpFw/ioBMm?=
 =?us-ascii?Q?EzivfL8Pf+MotqE1eRChpy9/Yw7VUaBTnXqqjDHaKLlWmnY1ur0iOgf5FjhZ?=
 =?us-ascii?Q?5HEx28d6vdiV8UfyTXfk6mXgF8M+Rac6W+voB+YaWJKTmP4oosjOzI5yQVdf?=
 =?us-ascii?Q?1z6uYmFWOPVakXQL4//DzRZCW1wPBW622SUbY5E9h+yH096ZfhAxUlRnTq5w?=
 =?us-ascii?Q?BzNjr5Ab74pJgJj1LTAP3kK3Met67RQM+jLrRPy4z7MR1MhkZfUCZ1d1bqDf?=
 =?us-ascii?Q?6tLw9L79ZNaaYJCDgCMsaOm1g5ZFtIaXvvG5PrJn6JwxWqsWpLlnWawUsggc?=
 =?us-ascii?Q?V7aUweCwiqu60Gd0KBwyuKyVhTwIsS+a/LqQ0QQCFf8Q+a1xrs02lzs7feWn?=
 =?us-ascii?Q?S5NmM2vPqmcDjuXY6Fzg+6YUIcEHm5rYMtCxPig916fqCn316qaT/tTjCfO4?=
 =?us-ascii?Q?q2iOaEUhtgLtfGq4uQYwEajl7Z5E2macUedYfiuhh2vOAnIDvr+yQEeuD3mL?=
 =?us-ascii?Q?mboqYeDI1tJ0bxHlE+7wVHYMYCUuimUjmOHhCSpgXOcqC9hNEjrqRud9/wG9?=
 =?us-ascii?Q?7rUf2TOkwnB6lZYhZMfnpQFuVjcU0Hlm6Fxb0AoV916IfGrM4HzQEvSoJ+Fw?=
 =?us-ascii?Q?cPrjEXMPteRzwxqeYKmJZf4mIFRRB0Mjvt5NWJhwimrJEfQMUrQTf/pFDPN/?=
 =?us-ascii?Q?MPvJ10+fEn+32agdUUsBwIpZC+Y5hpBtZYkcTVc3v76a/iDm32yZwfYBOAwL?=
 =?us-ascii?Q?3A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c78eb0ee-b70b-417f-8df0-08dcd31ab6f1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 11:04:47.3171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fG4GbHx8WGCToS93PpOkEE1CJjBRLcAEoh71DoN3AM8xBZVK3XLRb7nVsPaZ+pbBV0SdBjyF6teIYgZCwNkR0cEZy6QG/zfPQ/HGmL0XQVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8591
X-Proofpoint-GUID: j4sIjlKPlxwaoB-EYGDzfEuwM3yeRdZ1
X-Authority-Analysis: v=2.4 cv=DZxFqetW c=1 sm=1 tr=0 ts=66e2cad4 cx=c_pps a=H8RDR50mQ1szzU+C1Tr1+Q==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=UTGy41UV_SZnT839eVoA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: j4sIjlKPlxwaoB-EYGDzfEuwM3yeRdZ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-12_02,2024-09-12_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=877 lowpriorityscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1011 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409120079
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Sep 2024 11:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112256

From: Harish Sadineni <Harish.Sadineni@windriver.com>

bpftool is supported for riscv64 and tested on qemuriscv64.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta-oe/recipes-kernel/bpftool/bpftool.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
index b22334fe9..8bddde945 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -26,7 +26,7 @@ SECURITY_CFLAGS = ""
 
 do_configure[depends] += "virtual/kernel:do_shared_workdir"
 
-COMPATIBLE_HOST = "(x86_64|aarch64).*-linux"
+COMPATIBLE_HOST = "(x86_64|aarch64|riscv64).*-linux"
 COMPATIBLE_HOST:libc-musl = 'null'
 
 do_compile() {
-- 
2.43.0


