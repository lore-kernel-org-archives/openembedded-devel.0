Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF02DC02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 08:18:24 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.53])
 by mx.groups.io with SMTP id smtpd.web11.10277.1739348299322871514
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Feb 2025 00:18:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=Sp9YcyqL;
 spf=pass (domain: prevas.dk, ip: 40.107.21.53, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iEAAT4rNpN0W6uxbLTkZ6Tq1aeHuSupWjNb7E5PnlX3n3U1S2zO1V+g+3/N0yj9wcEgBpsAAfr5+KSBI0miWbb0lxheJiRjB/jq4HhZ7lL0ei7Sg41ROABYLrTtY9d4Pern2iW5tO4xNFS1scmRS4we2tVwCVAedLOcx+5IWZhuJhSd1VL5bh3DjcrfzY95CS5GyYK6hQhWp5les2zYEBgQwNeWdjpER995ZAbknewzj2AYH26jsAhwfoLXiYW8qDecsWrc4jzRvEMHjstaKESLubf+S51uSaTbwCj/tSdUd0dDobk23ksFb69WJGFarN1aPv5vOHfxcqhjTdmCinw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOm1c2Z+4l/iAy/2riruXtR+kLPtSgfWb9bg4seLVhY=;
 b=cAIQRrggqpjaL7sDEEIbgz4ekKSaJcRYf+03onAOxc8m5rYp+cvsu0gMKMB2P7dwu0HuzyGonA+Dj4kdcRJn7s9uBh/BN3e9kFP3mxRwRZxlB9ewy1v5xtN1z0GMUfG1Xwtg/FZqLOsHgZRlhGGYetOcUJoeFuDoQ3IalwC6tX/b1CXs1FVkq6Zawk+bxlHiAiz9SxgN+R4TffJln/8IHefZ72ekBUfUWcWycjVTD/0T+sII45RXKNBRkkrvae/tVPxTNgLn46htLpBY5Zmh6gKgNJ8MuT5XhRlGXQpIkfg/FP4sbBM/xHHTorgSokhFoxpAxDeYwadTvWRwWsj+xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOm1c2Z+4l/iAy/2riruXtR+kLPtSgfWb9bg4seLVhY=;
 b=Sp9YcyqLq2nLCeYffT4/HdVu0RS9/0CXrA+w35LcNE441VDUerDa2B56zmQdn7YKyyrKhWyXe+ukFH78DrmaYJar50Su3AlsOdD9OMmlTWcEaKlrK8xrUyBwTECd3NrJ6a7AyntAFrRnqVGDkXM3Zq2fy6HOztYPmo78iLn8/cQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41::17)
 by DU2PR10MB7863.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:493::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.10; Wed, 12 Feb
 2025 08:18:11 +0000
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4]) by DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4%5]) with mapi id 15.20.8445.005; Wed, 12 Feb 2025
 08:18:11 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] systemd-netlogd: new recipe
In-Reply-To: <CAMKF1soPmxVfZRLkMjWmMfv-FM=PqkDsdCnWHYDcPnXZRvKHXg@mail.gmail.com>
	(Khem Raj's message of "Mon, 10 Feb 2025 15:13:53 -0800")
References: <20250210132923.933209-1-ravi@prevas.dk>
	<CAMKF1soPmxVfZRLkMjWmMfv-FM=PqkDsdCnWHYDcPnXZRvKHXg@mail.gmail.com>
Date: Wed, 12 Feb 2025 09:18:09 +0100
Message-ID: <87cyfnr2ym.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0002.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::27) To DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:41::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR10MB2475:EE_|DU2PR10MB7863:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d1df2da-5ef4-4bab-6faa-08dd4b3dca3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xbbKhaEZ1aJ3POL5LrsuaWsJSFDZ+IZCw7dt89SWd2NfMyeiz+AF1hB28P4F?=
 =?us-ascii?Q?XkvnWg07NVWZr2GD4eIFJBtenjuMbB9Z6KLN+I406QHNyxQU15IQaeq8D/X2?=
 =?us-ascii?Q?32S3KvJSwgRcB6QsmUjYR9iEB+lffWyJtZbGWBe7DGyEcH7tr8yflOw0XYKZ?=
 =?us-ascii?Q?VJfC2NCzGraVlg7bD+mF7BwHnEQAwvCi9zoI8ytGjNfB+n8EqdNxIM5ZvIEj?=
 =?us-ascii?Q?ur7wCkh1JDHy0jKkTdSHmWVFasSauiI0lgQKTDo+wElkczWwgve8pQO8+vK8?=
 =?us-ascii?Q?WDDy5Xlyk/O+wNnx4tXB0CbAg29qLlUA31HslymWmlHWpnR3WJuDBhCXD+Vu?=
 =?us-ascii?Q?jILKiYtm+sXmne/4dcfK8wLdiD/yH4KcxNHrirIKKdI4d5XHdl/nsieNlTVs?=
 =?us-ascii?Q?jfESKU+5oaq8IqkrEsiWSjpRFoKMtbylhWiB5RHYhvxeqg3wJ0B9ywD8Y0Es?=
 =?us-ascii?Q?fUyfvyl/J5PqOogwApIxgsryBCPb/4xy2NewtQtlXcwYuXZEWdaw5jewe9/i?=
 =?us-ascii?Q?NRrOdogNqzAjaHIAHKHk8/5+NbR6cyqaWX3YIXruBQUSrT4DRYAB5hy12UnH?=
 =?us-ascii?Q?1xSCQgmklYfMxWCcANZ8BZsdKWjh/YScjVRHmvjyVz73LFkNvAmEq0fIUeuV?=
 =?us-ascii?Q?e9Zcw0lrwvdPaLRU+TMzpny4vS0CsYfnoGgOV1b4HE1c7h4EOvAvPYXneRTW?=
 =?us-ascii?Q?H+LP0+SZ/Qj8KyGPF5RJQzCi/SFgHX9S3z2RWOvIHf+//I9QM6MangmlGuxT?=
 =?us-ascii?Q?PpDP0ms3L6bY+bvDmA5YqpghWGN+O9hmxcqeDt/xTYid0+41xSeabx63FWRK?=
 =?us-ascii?Q?s4CzBhPrB1Ja1Of1gUDehS/C5U6WOTvOITEXB79cT+ysVD0ILDAr9tjRZUUV?=
 =?us-ascii?Q?9fG4qWngcYZeATwRVhEh0ans1XbJtnc1ImTPYHgayA/jka+pOUJkfY3Ax0/2?=
 =?us-ascii?Q?dOz2YuHZP46UYNcZNRyhxRzqlXEwYTwdx8q38RnR2j3X4sc5O0C1lZgHOyqx?=
 =?us-ascii?Q?F1WDYWZOTFTpXrOcz5cTFG+PQ7OpgLOFoQsBWJJC5krRfibAwYC3VjF8bxyy?=
 =?us-ascii?Q?4KliH7eOLp+NXXGPLQAq+OqxI6dwRod4sCyOQ5dCrBvBCOAybmE72b7nyjiy?=
 =?us-ascii?Q?QTBn4ldrKMIe/gQbmlqQpkZaNLDN27LoSYLiyxHPRqjHHTNdnNkWVSXGD/01?=
 =?us-ascii?Q?qsYvEREYftaFrcSEy6F0afisTTIVWuI/39JSXh5g0zARB9BLi8yRACb0An7r?=
 =?us-ascii?Q?XX1tlGPeEXgK1jc+4ioOHZ4frh/RCkystl8yS7iJuzafXNnSpn4R+CY0V4fO?=
 =?us-ascii?Q?4/d/CkTI4XZxw2lTNXf0CUlxUDgT58aHguah5sccW25+Vhz5sRzlS6yqetto?=
 =?us-ascii?Q?x3J8cFURk/oH/n63+F7M0EEGWnoQAxnKP322tiW1wtz0Fu/KDHOqBikVIuvV?=
 =?us-ascii?Q?98Evo+/wV/GN/3rVOEyyvJpH9+d+BVrs?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?B0TYdkUw+lvjbz+4hanI/9Rbz7ToiVwmRTuJOeSczCQBtLzutdzpxSjdGL3z?=
 =?us-ascii?Q?cuEw0sdDvQzTVr2MuBT0uZTyMOjY4usPl7s8Gf2wF1iR8ghsZQAlBsgLy/tZ?=
 =?us-ascii?Q?6SaX9B4zHsFk+XvYk5CBd3/UZ1z36hicYAR7e70QF+SokIJ24uX+2dw4jH2Q?=
 =?us-ascii?Q?7ByJxK6z4cS/7UEfxq9WASjLzB/A21BxTMpdKAO0jjFOQI/PBUaU9cX7bgAP?=
 =?us-ascii?Q?3XlPBwc9or3Iwsy+ym+5Deo86kMJY3t592nd+2kNhY5J22GsIihb70I44NIl?=
 =?us-ascii?Q?d2FzqqnLxRQBYiH0dj+9RT8NbbPcxi68+xSSeqBPrFtLEaMrtLQAuS4lrrux?=
 =?us-ascii?Q?3t6/WP/pYCBuaa50vN51uAd73vcpU+lYfFTAl3N/sD3/t8NVOLNSBtmDA5EI?=
 =?us-ascii?Q?SSpN6dKjPTDvgWU8DajDBRBJL5XZ/htbDWNk7FWP+jjJXjpEcqDCAmNwY1aJ?=
 =?us-ascii?Q?Re/MaX2CM6xKFtVvUPoJT4oIDDrEUB1G+c19JhA2KiNsbZa2e+vQkpSKZA3N?=
 =?us-ascii?Q?J1ohLGY/MWPThqBgqyGqjhYYUeLYfm17XqwzCJlaJOaNwHTeYy/lHKp8Bxl9?=
 =?us-ascii?Q?0dQQNUtFfDaCKqRxAA6kljjBm7tTXaIXfyGRPWkYAEZnSw4APTLdAOMVJj3z?=
 =?us-ascii?Q?Nyw51UhI7ID4eGdWNqDHUajUjQ3TbLNx0lbzpTUbBiwSw5K/pBEuVE1uaUTs?=
 =?us-ascii?Q?0TYEqPvK1hGn7mggNztPEmg9yYRUnZZ+39e5w2iKbSHxsNq1qE0s5bYfRC1S?=
 =?us-ascii?Q?/nOAe1cTXuUwsbxVxYk1XzVRo5TeuSH47r5WcAMvchpkxrJKe6curw3Kl2bV?=
 =?us-ascii?Q?p+QwTgId6yKxgR0iTnKIbNV+4vR0d5ghQg91kaj6oOfNSPjRubgkD2+OzS6o?=
 =?us-ascii?Q?mMZr7LO3R64XOk4Ziz98EZDp2wwYI9THQ+hvhKm3s8nu97tH0+cvgHeQH72R?=
 =?us-ascii?Q?wnYQBsjDpn5IwwhCGwawrdTUqDOJOjipsMOWzran8YaBkosvrYM0fZTLoUFa?=
 =?us-ascii?Q?ueyEzH0Yi4UaQ3sVwXuaI43ok6Daq0eBD8N8Nh8DIIr579Nzf7M9vxiv0w1L?=
 =?us-ascii?Q?/cDQxo+OqBg4XIUPDTgyLNNL7VM/hVpCxBkkibg0Z8qtbQnnBPexGypHufOm?=
 =?us-ascii?Q?Ijx9+wPEhezfI9tPNHWe0eeR3KXHzUxO9UV2wDtj3v21ojGiUPCFM6ykhsf9?=
 =?us-ascii?Q?AbOiJZpesQWN6o2upC3oQi40JfZ+NNRE+mmhJU3Vrp2Cf2w4lMSO3sZD/ItG?=
 =?us-ascii?Q?mBXeurECZ56rKOkzU4xYO7rUZVCLNI283ktUe/cbJytkxH7sdYOhPOaQFW6d?=
 =?us-ascii?Q?CEyuDzZDVxuThlpEB7udCnv/MAf5ewLD/Fs8aN8gOseGJMC4YCSPR2MYJBxr?=
 =?us-ascii?Q?oSGhpJtH9BmiOnLUobv7OJ/a8mFlE0TCuvh9WQ+aGDdUaS1fWwAs+RjRQDdR?=
 =?us-ascii?Q?3PTOvapVA1xzp/hKYmJKdBB5/z7C3s/fImZAtf5VcmZ7lwKzPvF6HdvGTfty?=
 =?us-ascii?Q?yWjgHprYZw+af3ps21XG63HWv/5zUWCNIPqB4BkII7onasMAsuvuYTsa4YHU?=
 =?us-ascii?Q?G001gr+TmbqDMLruuzviEn5iqs2FdmLx3vNZCn17R5vmf9K2rEQyatmpQeGz?=
 =?us-ascii?Q?hA=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d1df2da-5ef4-4bab-6faa-08dd4b3dca3e
X-MS-Exchange-CrossTenant-AuthSource: DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 08:18:11.6343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uZ0f0AhEM5oiR+Qb2oSL54/qM/Vus8ci0yG2M/WWq58F7eWlKkInIwFq0YRev4yU+D333v01BhFvG7ubCgNnH3A0kbIqce0KHyaluOGO6bQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR10MB7863
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 08:18:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115441

On Mon, Feb 10 2025, Khem Raj <raj.khem@gmail.com> wrote:

> Thanks for your contribution, since this recipe depends on systemd, it
> would make it specific to that being in distro features so it can be
> safely ignored on
> non-systemd distros.
>

IIUC, you're asking me to add

REQUIRED_DISTRO_FEATURES = "systemd"

to the recipe? Yes, that makes sense.

Rasmus


