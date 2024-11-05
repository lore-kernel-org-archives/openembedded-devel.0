Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CCC5D12685
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 11:07:18 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.47])
 by mx.groups.io with SMTP id smtpd.web11.15238.1730804832699598341
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 03:07:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=G/ILXKq/;
 spf=pass (domain: prevas.dk, ip: 40.107.21.47, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nKdrLG4jDbnzS0dx0xHJy70h/pQKPaFFXkIF1MwdzEbPefG8nW8rIZW33/FCzsYRdPAU9mIWHKLXjBt2f2LLrbNymzYINx9dvgbtzyDa4PDNVlDi1rlC+rwTcyje2VVBYbBCnAUuEvBCiM7BVWZILXpZrUZ+moC4A8Bk3G6462yriFZw05beLU+Ub7pcRN1HZQdJtfT/dDhpRVwg7+DbwpaB1qDs8HX3wWz6wfAkzsey/uMyusH5Bw4rB02neAo1M8/Uol5Ra6uBIgKb98MKxTjbwrV0ztSV73ZrG9T1hvJdfVymAAlAQHiVbrVBdE7FOsNT9CF2Ax6qOFOR/wDjtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sg1bhTB87JSsOU+bVoL7jaTgpwvJuE46UdqdFTULnsg=;
 b=CComiN8Ut5QhzfsfRrdWd9XyTRDvCaEQE7soI9lQcrsM6zF65fA1wKctlHI/BpE/Izpu+qSwkcHuiyhoxcJIc+EwjizXZB01wMywempXZjQmrq+3nXwLY4fY9F5yF8+H4hHCkoB5XKwdb1KeXjjX/ntKL7HPikhzAadGjJoaYcvQsh78lI5aAKViewBGdANFiMd1Wke8kcxIO9/YSNUdvtVghBxHCJgAaFsH8sceMIgpXOHkZ4vOflaqsanNHQ3V1PuAQNYzaleygvd+E4fEGueHkDudXCGphRg+B9lhTr/YOvqMgrf+xBI6KheGRMpyvquecgVO57MNwkysyEXggg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sg1bhTB87JSsOU+bVoL7jaTgpwvJuE46UdqdFTULnsg=;
 b=G/ILXKq/LkBBcwtW9P2xPLH0oo+0ixMddhYKcNiQVIKCigGDQ7BJVWgcug4GZPI5lFJ+iKXGKTVsuKDO78xu5l4lkBGVThXSKeJl92fclyStiUSDpPPhcRGnvIm5xAo8rnqNrILGIDGcXUl3M1kyrOAuNY9/aorL5crT6OwYT5U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41::17)
 by GVXPR10MB8377.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Tue, 5 Nov
 2024 11:07:06 +0000
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4]) by DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4%5]) with mapi id 15.20.8137.018; Tue, 5 Nov 2024
 11:07:06 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-devel@lists.openembedded.org
Cc: peng.zhang1.cn@windriver.com
Subject: Re: [oe] [meta-oe][PATCH] parallel: Add recipe for GUN Parallel
In-Reply-To: <20241105101028.2967192-1-peng.zhang1.cn@windriver.com> (peng
	zhang1.cn via lists openembedded org's message of "Tue, 5 Nov 2024
	18:10:28 +0800")
References: <20241105101028.2967192-1-peng.zhang1.cn@windriver.com>
Date: Tue, 05 Nov 2024 12:07:11 +0100
Message-ID: <877c9ihrc0.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0031.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::19) To DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:41::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR10MB2475:EE_|GVXPR10MB8377:EE_
X-MS-Office365-Filtering-Correlation-Id: cffc1692-8d44-4511-8121-08dcfd89fbfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OIbw+q4l9sKMWX3jT3v6IEFLJWnJQBZPAVxQMcvxONfsWGEgDSWUEkX2svQP?=
 =?us-ascii?Q?I58SJSKn8cFD6v6LxLtrEiviAQGn4QPbCDMdoRdOQ0bn5xLKZ7d1g/LSWpEl?=
 =?us-ascii?Q?eIzeMXOiJtRDPvGDu8ffl+Bv9YDZJxSH/2jgTPA+oFEJE2pzDsKdiUuDI5UQ?=
 =?us-ascii?Q?57S1b/bm6TxUnCaGo29h7B0Xku1wBHwg+CTVN4e3olNlRyoWuh5y80hEZ9bw?=
 =?us-ascii?Q?SaNP7mt6SlADb4o0Lp3gAweWKXBVJ+6m3+nrEU8nj9CU6VevNYsA7J9ya73x?=
 =?us-ascii?Q?/4ReMKQ8+iEp3gNzviLGcinzaLR7oXtQ4G5eh3Bzzk2OazWag6b2WVeRKV71?=
 =?us-ascii?Q?Z8vGOKQdHrrUFGDlT573Ni0pm+fA4S6XsWTmnbgSZm50YlS/Qsi8doI2WCcr?=
 =?us-ascii?Q?/15mO2QtowxgZwLOb7dSGLQLFLOHTE0/NdQaV6jNxaIFsBf3JuGe37/gB1cM?=
 =?us-ascii?Q?cTS3SRmM1xu9MMJF6LfdQjsM0nqqj6BjNwFn+KkZJD4JyNnw4xo2fo7mlCX8?=
 =?us-ascii?Q?UaqF4lpvZfG4SXt86qrYIED3JWHkrxg0xLFV7M62LgSq41kaaXntTY/WPMkn?=
 =?us-ascii?Q?tGIYHc3JKOGQhT7f5u1KUL81VDjdbACnMhlATWhRUifHMTmOk8bZJkEIOaJF?=
 =?us-ascii?Q?G8NY9MKvsrnHVD1LPkvEyCKofm5wMVq9dJ6bi83/S4RMw5bEdedKyX/A4Vwe?=
 =?us-ascii?Q?JEzPyFvd64wdM5MUJMg9zQk9qg7k0DHRZrbSRz6dIjvmMTt90mPiHP9Drid8?=
 =?us-ascii?Q?R0Rxw2m5d+rfcY4DLIJZ3bP1OQ9s6zws6EYiZWJgiqyXCMdzziScRbOMz8Aj?=
 =?us-ascii?Q?p41ac/cL9PVErls3urCzSiSVERyKUhxn/Hq4+p+O3U5W4oBgC2eYrsJ5yeO8?=
 =?us-ascii?Q?yIPJeF7sULPPDn00e+TByb/mujF3WcUPBJmNvB/R4BEyEz7JAkk+4w9dVnDM?=
 =?us-ascii?Q?lJAg1rjHQa4kXNi8B5BLeV1Mvqzxnu/lN//eroKobt//ZuNKqaLpN1fUKNQ3?=
 =?us-ascii?Q?r8PjOLBWJMUXH7ncqW86T07S8AZ/XZqbZMTpEPSCYbSA1fORl6GB621CeVEd?=
 =?us-ascii?Q?xJiAfxPja95ZRJx/4cOUcbIFBDfrxHWTJpcDv5Mexh1BLS1daWkygPormf4N?=
 =?us-ascii?Q?wFKJP7u89fOWEFy4aTnTD9LzStCcUhrdkhMxSxnwXD3xvG5apUPAFvrzWRLT?=
 =?us-ascii?Q?vX7qyO/EaHYWSxyPDiiGieS0bUF2AfShudBrnr6ug5ij29CcKbHAwuVFHCf0?=
 =?us-ascii?Q?sFvx9kiRQh74cpnRgFOGcLXvHnGeF8KvQikRaXFUuTXSNFZmDU1yk2jm+tgN?=
 =?us-ascii?Q?2CB2zvlGwktL6IcVP4hSlmFw23TqDKYUVIX6LlXjfgpiB19pos6Rv9KnRX0n?=
 =?us-ascii?Q?oMxmu5o=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lPokeo0E6/lOx+yZrbcKpL1dgYk9ZFOn+FZWsU6r4YxvZfM2zkRXnjmtRbZR?=
 =?us-ascii?Q?0sxFuXANh7jYRBzilPGCyNxv3kpHWupV5X6ts82XdWTsug0Sbup6XJqPTDTG?=
 =?us-ascii?Q?AD5/GXmEmPAl/ljwF3ZHprvvDiBP+USH8FA0NUjgF1eHF9//8nF/Sx6TM57d?=
 =?us-ascii?Q?IkgtFdcZA/KgAktJRJ/16Ya3TN/McLnTX4YkvlyVSdBsPh8E4WUfnd3+c4Ij?=
 =?us-ascii?Q?ujZFsWxZu5/bDlkK9p0GHS2xqVyyNsQW9RRPpLOwNEDZQQWF5vK9xZjYj3pE?=
 =?us-ascii?Q?KSEf00RLERxLtJmEJFkeAim8bx+XeJ7NSFvHhKh+NTr6PmezJFLoP7j5LEXe?=
 =?us-ascii?Q?pdwGOQhVS2QcNvzeSCTlmJwd2oF3aUPR0QISSSlnQpLvsenVze8+TyIil6TN?=
 =?us-ascii?Q?MWemEILgeKZ6WEZVEosQnH6inZlvotf57CKVDCTUYmNvbJYtQLp8vjPpbNj3?=
 =?us-ascii?Q?U+KrfJ93ssEUwoivtEW3I3ULd4VyLuS7/GOUGKjIu2LujwoQtrH9cD2nH6Sn?=
 =?us-ascii?Q?QKwSmHATNZZ3N2mgcDZO/oXlTw2lgx5La7/MLc4b4Nlbq8NmLiL0ANFm7fTY?=
 =?us-ascii?Q?cmnFknX4wPG3PnLIQOwHMOzqyKdoSpXk8ntYX2U/pa9wzrtjjs7qACHyG5+N?=
 =?us-ascii?Q?QNeZ+Ru66wd4nPHcT2NgdWczPruG07R3+UzSlOULlnbbd8yN43JQwaJbblg/?=
 =?us-ascii?Q?lTG2eqhigGP69O9AYr8D7T9neipdpEyxJa2Z76axnXQwwTT22eM/0R5Nni4Q?=
 =?us-ascii?Q?hh8iZYt3Jhp9RQ7Q3YH4vZ4jhiqHmiEnFF1+6QxpqTkTRCBJDfuTFpjM/C1d?=
 =?us-ascii?Q?czshpoZg5tM5AHvpIQ+1KnmmjCe2jhzcVOUU4gJoAWhynf8QT5aL0adiDH/K?=
 =?us-ascii?Q?EIy1ktuNBlPxzUjvXiCdPoAWj1ujJ25LLRGDqEczV3PXIQRRGeR6p+LK2iSD?=
 =?us-ascii?Q?gYqVM7HotRtQhhFNOLBDx1VS+4/Kk7H2Nu6VKj2pLBU37KKZshXZ2/S74O2Y?=
 =?us-ascii?Q?qhtITuTFu4YD0tCNqfqB6TOO/OFXAeCjA6ifVhut0q2/74lrTsFAMBBENFLg?=
 =?us-ascii?Q?X8sYsTHgCgmh9vPjgLZYWdiBJ/d78CcUbUmZUOGII7cwtFMjgnau2FOcaQZb?=
 =?us-ascii?Q?3MO098NCXnPTN8PCd3m0eoVB6yd8qpXhfJVxjaA4JwrUwsSsHTo8szDq1qM1?=
 =?us-ascii?Q?4CDvyqxhFZ8bZDgDFCt3sz+9RX8zGDBrN1mkTDf3v1SfvXCl2KgCNGTO3m3o?=
 =?us-ascii?Q?4mBNctgXVOr1VRA9eqnZ9CrUhulAHs7dD1OstzzJ57Qmgev80BT3Jjm3jBFt?=
 =?us-ascii?Q?mnuYkZiZX5YKWp3q9WdcnGAtyvNwbkgyBuZrx7I9ymdpuD7Kh1RrKqASB8+o?=
 =?us-ascii?Q?kyy0SEVKBTqRk34OYOKiSGxG8l7ZOArxws0FM1Wf+LBbp00BJQ5v8k0ys9RK?=
 =?us-ascii?Q?ivjDjjNseZxgLAlY2+Y7OEDxgxTbar9CKsTipLPyglm1pPucLx2AXdt2Q5ko?=
 =?us-ascii?Q?c5e2VLnJDd6Hd8Odgt86JtURjrsQvocVfGAZD0ZLwkj96SPhHNiBm7j3Ecop?=
 =?us-ascii?Q?/fX24NCkSuItVDIQ3EGG0RdwPWjWtVw0+lD32Xbih+hGOtp/zkfJqhEpTyWh?=
 =?us-ascii?Q?eg=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: cffc1692-8d44-4511-8121-08dcfd89fbfe
X-MS-Exchange-CrossTenant-AuthSource: DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 11:07:06.1262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5C4ppOzsHL7gBlLdVuwdVv1deMMHyXOb24eh+s/fgaFejVsbdS7dGDp/kcgVBqateA0A946Vz/0IIMLhKvmqavj3zlgLfkqCZ6Pw+gwpHSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8377
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 11:07:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113417

On Tue, Nov 05 2024, "peng.zhang1.cn via lists.openembedded.org" <peng.zhang1.cn=windriver.com@lists.openembedded.org> wrote:

> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>
> This recipe adds the parallel package, a shell tool for executing jobs
> in parallel using one or more computers.

I often use GNU parallel, and might find some use for it on an embedded
target, so makes sense to me. However

> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> ---
>  .../parallel/parallel_20150322.bb             | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644
> meta-oe/recipes-extended/parallel/parallel_20150322.bb

Why such an old version? It's not a dead project, there was a release
just a few weeks ago. If it's because of some dependencies that the
newer releases have grown and which are hard/impossible to satisfy in
oe, that should be mentioned in the commit message.

Rasmus

