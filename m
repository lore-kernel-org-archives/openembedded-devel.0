Return-Path: <richard.leitner@skidata.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E860C4332F
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 16:47:41 +0000 (UTC)
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com (CHE01-ZR0-obe.outbound.protection.outlook.com [40.107.24.100])
 by mx.groups.io with SMTP id smtpd.web11.28559.1669308457288304761
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Nov 2022 08:47:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@skidata.com header.s=selector1 header.b=aOof4vkL;
 spf=pass (domain: skidata.com, ip: 40.107.24.100, mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cEVHDfn4a3AGkhL2mF9jexd6SUlXFg601+emYtgl1Y39lXsSRBm8pbB4+15Ii2oDWoejN8PUqOFb6eQzr/r1MIvnTwBMFCcswEO4Z2q0subqmz9a9V9ukpDBanblYmji1E+z10N1bCGLC5JGFc4z21bnt0/dZAAQUK54K/aaO2jjRejjmtHU/EoqiQ/2BOOiPqSQHHCTDTPvtuCOv2AqC2C7HHW54x9ANT3rFYkjpPGs2CcqRoTrE0E8mMTuMsa/LuV7GIFRVcrqrTf2W9kSD1n6L31BKjz0dHm+G+g8fbpJAYdoytxVMcWQuY0NnexdWeGCdNx0fhEmGIJGKbqtqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/retckeWQ0tAMkbiv0AdzItNYD4LZKzFUfPbcbYUiwo=;
 b=gL9iZlvS2z8DJFE4Wo7BccCAUp7+aw5irEHnUzGjF3qO/7/0A9ZeCkBmIAyUb3q4mUsmWEKFsMjenD7Wn3CZbCqTHwJvVb3Tmf5rcmohM4Sh0TlsL9Y/CoeEWgqOBSr8hjRjQCLQ73LwMMdMLrqwJbGSZSwIc21NST3T7sTacRsO+aqOiG5n+PQgBSMr/l+ScmX1iPAgpcZHNB/ZK1ZruOMuR8ijFoaUXqhozJsyjbtsvnUuH9niPLGvRT2XxP1lIES4jNADxUqs8aI+efe0riqVdNKIyzXpMjbCpd436H5H/BO3HE8CGtntxafhnND04vqhTHk7oHdiPG1dU0EreQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/retckeWQ0tAMkbiv0AdzItNYD4LZKzFUfPbcbYUiwo=;
 b=aOof4vkLDxhpQ4Sds5rft7mPfknN8FkV+lArXbLEMxIbkb3fGUGuuAlDrWXrBKMe5QSZ34yNM21kaXn5rA3bcQzjPqBIo4gWPlkUisyZ+jg6R2smLzPN0tBhgJSZj5aAesDQoQ6BN7WjMcuAobtfUwE2AnMbbW+HG8bnva4aaXayaKqCXeNE/7gi5PP8Mev3vuhYhyMK5XL3OunufboFQiFR2Iz4XEc72r2GGL5AZdnSeAO28raa+/2bz4FAdZubSsX7Jl0LoueQRO7CyIZDxXGv6tkHNhMsRbafHp20acgS/5HrgG27okXE5FDJmsf7Ne9S0pdDRE0WcFU2cw9icg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skidata.com;
Received: from GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:30::7) by
 GVAP278MB0150.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:3b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.19; Thu, 24 Nov 2022 16:47:34 +0000
Received: from GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM
 ([fe80::8882:5734:7f7:7a3c]) by GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM
 ([fe80::8882:5734:7f7:7a3c%4]) with mapi id 15.20.5857.017; Thu, 24 Nov 2022
 16:47:34 +0000
Date: Thu, 24 Nov 2022 17:47:30 +0100
From: Richard Leitner <richard.leitner@skidata.com>
To: u.oelmann@pengutronix.de
CC: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [oe] [meta-java][PATCH] openjdk-8: refresh patches
Message-ID: <Y3+gIsdJXrLnjEkT@skidata.com>
References: <20221124163254.3142763-1-u.oelmann@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221124163254.3142763-1-u.oelmann@pengutronix.de>
X-ClientProxiedBy: FR0P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::20) To GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:30::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV0P278MB0211:EE_|GVAP278MB0150:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b3ffcd9-4bec-424d-a1fd-08dace3b95e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	K4/2xBFUtkvulyZbtWx2gK0w0A9tspqmTML1Ywpo6+g/cHuFqLBuQu5d7v6clAD5kRJgId3TLyUrBYqTbMQWywkroLnzwA+17OtxaaQVyZtRARgm72AkO2tihddaKgZ5q2K46rgOem2JI0HzeqZE0fqNYSAh/tEb+wr82Un/ujSrwPpsPC5kg3LC8FJzt8wKBXKSiPYXLrgAahp4Z52v2yAxmP8Vqi3pY4yxBmOIxnMSDQpnH4zUcvoxsVSQ9BeZYk/WISFmAXdisLRXMyu1n1eC8epPhnzTt1KW5A6Rcpy4Q/Abn0DfQEzaXBzA+luw29RBkxTUltv49sk4UUb51G8aRnZl6F0RxWdm2u/L6x1yhbPaIz258nnG9G7p7QbfjBNNDS1zaoFyXSPwOwE0bGvjp0/7YOe9PZC+iV+UIvbGL15E3IC51NcxWdTnCMvGC2t5uLna2IAdvmRZeWvIW3qESowk/UoHRqTxDqs689XQgiaayOC+6enW8SaHdNB+psPoGpSDoZnmYOwRAjLZv4JGH9452MVzI4CskMJGd5Pih8MRUa1DA9MUFhzMY1yYd4MRP/IRw+tnkmdxYDq7TXOzlNpLIDUNukJgYBNYjgIGN9hAZVu+dCjcwnmo9TL9EFDxYWmhyqZANYIQmmQlECK9BJLF6j7jEWQpQlFuUHSF4NCougV8R2EJXxADotJ9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(366004)(346002)(396003)(39860400002)(451199015)(6916009)(316002)(6486002)(6666004)(6506007)(6512007)(4326008)(8676002)(478600001)(66556008)(66946007)(66476007)(5660300002)(4744005)(66574015)(44832011)(186003)(8936002)(83380400001)(36756003)(2616005)(41300700001)(2906002)(86362001)(38100700002)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jrgQpE4dthZY0D8wn78sUvaqss8oskAkDFJhjgDPqizXmFhvYwl0+jakiMW2?=
 =?us-ascii?Q?aDe1Ltyhozjyeflf4wjyiT67WKHy4Wxdv8sonoJJdU+E/Kn/xa92l3hxmjv0?=
 =?us-ascii?Q?0rMFqnRcdDoAstEQHDulYewG2ygy1E9iu152NIy1WFivobrJ62pHvKT+bxLk?=
 =?us-ascii?Q?5AZ+UwZX4oQx5ga/fwXpvwJu0MTQjy9E7vggckuDh9KNVXeNNyTB0HeREDT7?=
 =?us-ascii?Q?P1xjEWQjPvJU+yZ0+jyzvWAW79qXnzn4G6Bu3DpI5fBvI5awp9/KvILZAFsT?=
 =?us-ascii?Q?h7d/DlHFzIssg6Oe8dB8JUe4G1SHpdvg+SlEovyWFEAVHVsofduz7SeGr3Ut?=
 =?us-ascii?Q?Sw24R3GxgK0eDFMtQnY0CpW8WRTL3CrcS8IfB5v32O/2b/LOPiAz+vCIaMxU?=
 =?us-ascii?Q?+7M5RgICIRJwolenVMwoLYmpe0R8DhJmwmKakSk+5hR+x57ltlmApWWuApZD?=
 =?us-ascii?Q?NZJshOJtS4ZgipBDThGiHVlXlGKzOTn6vT2t0wlR8EJNKh8wQjJk7fMDtSGe?=
 =?us-ascii?Q?2D0YwSfE5lcIKDjwTSjTbltRGHmfB/pweeoo0rwCPhSqTTKqGVfZcBiLkGt9?=
 =?us-ascii?Q?HuxzQVEVpz7p/vzpeyuTQ8Pa+2AG/cvPjA5xLYAMMm1gtA57D9KKEc2dIIwJ?=
 =?us-ascii?Q?ojOJ6FKb2xxwr7NtpTto8URemp7Dv6UsqKsZ7a67xliMewcYS6Z52xm1n6MN?=
 =?us-ascii?Q?sv2sCOF6vRROB/96G1oUEC663yGFpXI/3XVvtycaRSUd1pjk/4Dy1RpOwr+w?=
 =?us-ascii?Q?NOyE3Qf+OmzezfrIPFN5ochTQwjBm3rWXtpPsv76OMlkQjMwUMxQrWJRI6GN?=
 =?us-ascii?Q?SvrwYKiZjUzPwfsnHZsas9bHhVU6dVOMToIbINsxB2EaqvKVGTSemAURxae5?=
 =?us-ascii?Q?SdKwQCv6GQ4KhxtWMNVlRhua6TMx/ggMz+yhFghZWuFvqJpIokPdTifKn+sR?=
 =?us-ascii?Q?F7qknV2mG4dQ194Pb7yXqfXY1giqIQqeZ9e8ytW9BzN5sIHyBN0+ofloJYK7?=
 =?us-ascii?Q?+jHPAZZsCFzxTNNxOrIyTTbUNc1UTcYtNy/JqnRbrrIugYmg45+nFQ8TvjQM?=
 =?us-ascii?Q?dP9hePCQwGjENdlGDNxydjNmH/RbZlAhzqus+P9n28jqGMC42d+hW3EGvW4w?=
 =?us-ascii?Q?Y4KTJP/4zH33XCf9nGcYhxSoQJ1KvL2tG7jf1jFARzvfpjCiUJ6sEeLaPJmG?=
 =?us-ascii?Q?ycKQbStwuhk1jVi5ejAjakjorrokneMzGIwFnp0i2/s55ZxKvGlL6bmxkYU0?=
 =?us-ascii?Q?n9m7BzYL8A12Bt1IcDUB+GJpbbvOKgmUc1BoyBEuJRH5mntha3keMtH0dX73?=
 =?us-ascii?Q?WRfPmjhPkSXtGhfNRXkMhqhOPyFYe4lS4GZuXDjobnjVpC7Kp87yLZegd0tT?=
 =?us-ascii?Q?cGlYk3SIUTmYZZo9OfgX8WL8OXZXmhsvaF3Cj27CReAQR6E32jKojcMCdjdA?=
 =?us-ascii?Q?4XAWemb3qjyd9c9++Njx9UrDq8wGmrvukD54ghbQ7NDcFl/gwkwHphDevL/7?=
 =?us-ascii?Q?vzmtZrKpe4fahQ/ZMFDNdEAMNAlg3+ASqbb+igavdhW64J3rovgd9ZLjF4Bm?=
 =?us-ascii?Q?69zuUcqY7gJgfJ/ioWRwXVOsBBtQe0GWkzaH7RTNBezbFL34BIYmOFcDbL2j?=
 =?us-ascii?Q?2ZMhbAcwD10MZ+xDRYC+XRjLOdT+lN1IHPzy8FSBE+BLQJfuItZzO1GlA5My?=
 =?us-ascii?Q?C2r9mA=3D=3D?=
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b3ffcd9-4bec-424d-a1fd-08dace3b95e0
X-MS-Exchange-CrossTenant-AuthSource: GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 16:47:34.0983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Slp//ByghQKYB3aZVCApsgi07vm8vtPfOVy/TydwJ3ytMj2fc670RPSYuo1x8+27qV6jdZLBIJlRswc2+jYdGR/Pkdjti3SO4PNKaZwIJ6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVAP278MB0150
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Nov 2022 16:47:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99718

Hi Ulrich,

On Thu, Nov 24, 2022 at 05:32:54PM +0100, Ulrich =C3=96lmann via lists.open=
embedded.org wrote:
> Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
> ---
>  .../0013-autoconf-remove-Werror.patch         | 22 +++++++++----------
>  ...pot-Turn-on-the-Wreturn-type-warning.patch | 20 ++++++++---------
>  .../1010-hotspot-fix-shark-build-common.patch | 12 +++++-----
>  .../1012-hotspot-enable-Wno-error.patch       |  4 ++--
>  4 files changed, 29 insertions(+), 29 deletions(-)

Thanks for the patch. I've merged it to master.

If you have any question please answer to this thread. Thanks.

regards;rl


