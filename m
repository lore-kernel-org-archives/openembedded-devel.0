Return-Path: <richard.leitner@skidata.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376EDC4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 06:10:38 +0000 (UTC)
Received: from CHE01-GV0-obe.outbound.protection.outlook.com (CHE01-GV0-obe.outbound.protection.outlook.com [40.107.23.102])
 by mx.groups.io with SMTP id smtpd.web10.36830.1670825432508310702
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Dec 2022 22:10:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=1GhqYW4q;
 spf=pass (domain: skidata.com, ip: 40.107.23.102, mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVyO0wT6+qyvDuGR4q3kXCe3PJzAf1A62EQblWZ/qPEe84vc1kMBb123jQ0HtzRDJl8k4F3vzAbzf1c4esUEZgzafJtd69cqV0dWiHJkVzByftsy73XKQSPP3imHzVoAqA6aemupnlwUbDGEGMeJqeILG51LNSZkWVY8Ypt22aflMpoRxIvGPYQ2q718VQBrxxxJyyDuFdCFpF5oBcNQ1gokvuMIeQSPq/YQfpvFmFvtFvSFFhZDL+hssi3Y5aW8Aj8BMPKSeFCKayPaKJPnKiEuBXfvyU+wTXGDZ0xh/uVDbL27N2+CLcSNnRDoCsi832QUWITy9XU3NOyZoW7ANw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kIEJXw7UfUVDEQTIGzBH4WEIIbTEG59XDsC1tx2oAOQ=;
 b=EqR4e6mAnrCxreQRGnhaQUh/HgJBQw2BJsLRBIabhsqy0w0f96SZ87RSYXRR5xO9rqYM93JXPAiDdXol9MlsVbRlD1NH5Bs4UFGOfsGvw2ztdUEWbKYj013zncQfmczugEAXRHKOFGgKqXC4n/qdfs2U+u+5l9C4tzkx8Fbm9Gx+zU1vI0Nw2CWmYkRU322w2Q+vM+qJOprGUkDD9+EcX2wrQKlzZklVtKzl1Kl94qb+fT5HlKR6z0021feTBQTqhugu3m4W8NUR6qr1OzLJGan3R7rSPvtstU6UM18+Xm00uFDMXNIgdZ1CIeFL4kaXygz6xwagap7g99PiPni2zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kIEJXw7UfUVDEQTIGzBH4WEIIbTEG59XDsC1tx2oAOQ=;
 b=1GhqYW4qOoE+KM5cjKj2uY4k8GMHYGHQNM8TkWzvwQ+Jt57/F+BDUqO+uUJ+6IQidj6mNRmTQRjeCH3YKBigwKVJd1i5CxeXbOjecIBF58wWZw6Uvc73jGOtXlaxe9g8UMOPjRmFaA/juS6NolmLZaJLScD4pfRnL/IxMr9xv2c2fE5kNQrAwDN6BGfc7Ijey4T8lUspNtXVhrvrdtjyI7bf3FpMQcFm18Tg6hh9h511+1ymG7yitcOLr2db1U0I4nsx/7dpI3EzLEXpqaKmxHBocfGGOB0g/PA73eh9IM0GIS3yWD503gpPCmA8Eu6+b3qlo0slqwBo/8xwCIt6OQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skidata.com;
Received: from GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:30::7) by
 GVAP278MB0103.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:21::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.19; Mon, 12 Dec 2022 06:10:28 +0000
Received: from GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM
 ([fe80::8882:5734:7f7:7a3c]) by GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM
 ([fe80::8882:5734:7f7:7a3c%6]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 06:10:28 +0000
Date: Mon, 12 Dec 2022 07:10:24 +0100
From: Richard Leitner <richard.leitner@skidata.com>
To: a.fatoum@pengutronix.de
Cc: openembedded-devel@lists.openembedded.org, ejo@pengutronix.de
Subject: Re: [oe] [meta-java][PATCH] conf: layer: add free(1) to
 HOSTTOOLS_NONFATAL for icedtea7-native
Message-ID: <Y5bF0N5/tJqKxOpr@skidata.com>
References: <20221028161634.3383205-1-a.fatoum@pengutronix.de>
 <2966af9c-15a9-2e8c-44aa-0c13b32a87d1@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2966af9c-15a9-2e8c-44aa-0c13b32a87d1@pengutronix.de>
X-ClientProxiedBy: VI1PR04CA0117.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::15) To GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:30::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV0P278MB0211:EE_|GVAP278MB0103:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ebbd71e-4569-4f00-c66c-08dadc079118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bxqC4ZxA6dun3MTQa0BBoRDz3f+xHUBBcHUZtsPOO81T5UEfn7b6lT6bPKkGKK+lIERnw4Ip9mSHO362BKkv9OY7WR6DWnm8XwqUosCd/OY4AJb6+r5GjieyBreqAmrKgsap5kK8eBOK0M8rxLwBd21qUdHnBxJAfekpXTJJ2ZAVdLJDWfQobuhrPZ50C9GzNjEI/QvrDZ6UtpWT7Evrd4PgjsoMLzgjmFPa+JxrbshBkvB3OzoDZYJSEnUE4G7ueW60K3EDWGNIDPTvhDsrPYsS6Vtv3HkGbUuQ8b1xARJ9bj1Qo4tekhnuZFy5a2kw9HsW3pmSoE0JsTOO2wNv5IGDQsETcDjTBlDbKMSq3LglApuVhHjAEcXfKwulwN14gsAGgyko6y+7S4JGH3dAWKgyVBXll9TID26gtMz7Sw7m2NbSGoKqwDe46MAVkPWYVtpXgkY7Wc+XGICPiUk/7AmD2SfIZEDRceq9fIq/tkCXF0zeoEw1EiJZCQ/BJswbWhUrwKx3SII8CmSjjWuDU45RvxIPjEjKY4tX3I3gUcrchIAHsyuOENczb/mce7OPbh6xhCUaAIvx5jGXdhF3vfK09aFu6xGbAXoKyamgCAinrR1qW9mCMbzasA5ni9EUVCJMcb87F6dLHEPGY0lB0Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(376002)(396003)(136003)(346002)(366004)(451199015)(36756003)(86362001)(66476007)(66556008)(2906002)(5660300002)(44832011)(38100700002)(66946007)(478600001)(316002)(2616005)(6916009)(8676002)(4326008)(41300700001)(8936002)(6486002)(6666004)(83380400001)(186003)(26005)(53546011)(6506007)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GVIpBxwLC5pGbeH2W0vJ1NSQgmODf2itk3Ddx0SRdklI2JKoxLUTLeE85I9g?=
 =?us-ascii?Q?3LqeE8pDgRKrl+v9AkKZ2k/L1CWf62sHXlRv4vBXsV1xOjYS/xAxUZYmPQvX?=
 =?us-ascii?Q?ghnOCCgh3AgtOBUfBAruUDq6i71rlDqcR+M5Ccf7RkFcNBlke15KnwJOssr4?=
 =?us-ascii?Q?ds+aTYF1lfVTFiYcQu0HIOqtp0KKe090P8jve7Ho7SY3xC3zsnJBNmn0LDp7?=
 =?us-ascii?Q?VWBS0U8Yc2jUoSawkzPjt9eqhzFIhMWJkwIc2vUakEFHDMGGEzY2kIZNCrPK?=
 =?us-ascii?Q?t7BIxvoEL6/w3YkpIg5B43gdB9VKbatr2Sc0iNXXew3isfu6kiA3bDiHtT3A?=
 =?us-ascii?Q?cDQ2t3ClsHgWbXm6aeLNYLOn0hRAEs/KlX9caD2J70O/WrCgC0w5RUAkI4B1?=
 =?us-ascii?Q?oqUdskFHomIz9ghHIJ8ozGxP+ciKm9A+4jpeCK8adomknFPDH2hlPOzuLSl4?=
 =?us-ascii?Q?bshOjXIBEEZk5BrgZaf7iP234f5aWKO4kKg02n7KN8v7BiJ+ad+i5bcgqVh2?=
 =?us-ascii?Q?5vF5UeApSCVq0/Dxp7aT6gpcmvzxHbmGLHyd1Z5kmCgYPfCTTiS4jegZrS0g?=
 =?us-ascii?Q?p6ukhCeCz4GgbA9e2JyEP3v1PDTrOW2hFVOA3luw5e/OwpK+sHAW03pgwo50?=
 =?us-ascii?Q?I5FyJ14qyO279HDV7UJuBPort8WuwXUInmHy3cEn/604cx9tiJoxB0sBf++W?=
 =?us-ascii?Q?763XHqh1nci/vZScQv/LCLHx4v26FDVD/L0gxlyvC6vgJXEgP7UanCMKe9Lb?=
 =?us-ascii?Q?pvSs0AVdWX2v1muYYwy/IxsdzJwCWNSLcXbNbYnm/Waivs5glikuFkD3KEMg?=
 =?us-ascii?Q?NFxolUHk6w3Dk9B8ouzqNMZybmUqNfXRd1PgK3HcP5SsMAIVdRCLolfYwAZJ?=
 =?us-ascii?Q?0DOZTg1+Hap4hwXN+Ptsw10Dw4ZLysLxcP5Ajb7VagYdMKaC15NeqZPWku2w?=
 =?us-ascii?Q?WLpU1KsF1a9yph1vk6wo947jwbZop8DQQ+zEOCio0eHd57C77wMZ9CE+Km/X?=
 =?us-ascii?Q?fjMmT9dffM1tB5gE0Zo98oudtmC2OI71AdF6vDEGy4sJMUVEd3U4O/Bt70vZ?=
 =?us-ascii?Q?H/U/REJzCYD5pNQAM09cYS7QP60zxaR6A5SEa5gDD1MAlS2tbrJ3u3tVO9tx?=
 =?us-ascii?Q?jVA1QWL3Oqgl6x3yljUZQAehxqwV3t4EeB5i4MeS6Yyjp/lgiS8GomLolOUl?=
 =?us-ascii?Q?sD0RBlHkQuC145fl3bdfKZQiue/uyGOIsDimN2Zhs7rG0A8OeHp8j4lr/Qfy?=
 =?us-ascii?Q?7VRV2g3zhEUyUnVluykBFW4vhR33hQrrh9Ijbbpc0VP1RZkJ3dBEHW6h0isZ?=
 =?us-ascii?Q?RB7+1VO1+8caNv2YdhGC6cX+JhlGCB16NvcRornQf7VuJi0IpUawLDVaRnPI?=
 =?us-ascii?Q?g0pIKZfdGhScLPajZgpN7CvPfljsmIUaBfaCafcU8fRylOJh6TCLnb1kQT5q?=
 =?us-ascii?Q?WzLPKMDrmix9EdxtNGOT+90Ye8QxwdpSUB1MXs4vQIGQsF83RRzh+NEFh8Gy?=
 =?us-ascii?Q?AQ3DYZ0kV8XQy/5LA36iDyEX+CHcZghMJQCXY6mpPhbvQRqSguU5TLjz+/EP?=
 =?us-ascii?Q?zClDxjMvKpqayoF15a6u1i/Ydljh/i5IUjLGFuWRctt+l9+IC7J1KTqw1dDx?=
 =?us-ascii?Q?oA=3D=3D?=
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ebbd71e-4569-4f00-c66c-08dadc079118
X-MS-Exchange-CrossTenant-AuthSource: GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 06:10:28.5892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Teq1fHzcS2io4Nf2rTH58wCZRw0jzGcUQXpSsH4E7fOEZ3G16G9GnlRS+Rfl+oqhy659mnN1Dmh/VjpEjixRFJyAsCU77Vlk/sBtfqIGE+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVAP278MB0103
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 06:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100034

Hi Ahmad,

On Fri, Dec 09, 2022 at 02:52:02PM +0100, Ahmad Fatoum via lists.openembedded.org wrote:
> Hello,
> 
> On 28.10.22 18:16, Ahmad Fatoum wrote:
> > icedtea7-native build uses free -m (from the procfs suite of tools) to
> > determine memory bound during compile. This always fails for us,
> > because free is not passed through from the host environment.
> > This results in a few warnings in the logs:
> >
> >   /bin/sh: line 1: free: command not found
> >     [..snip..]/Sanity-Settings.gmk:195: WARNING: MB_OF_MEMORY should not
> >     be empty [Sanity-Settings.gmk]
> >
> > But otherwise this is handled gracefully. Problems arise when building
> > icedtea7-native on hosts with more modest RAM sizes: Build process
> > will consume so much RAM that the OOM killer is invoked. Let us avoid
> > this by passing through free from the host environment.
> >
> > We use HOSTTOOLS_NONFATAL instead of HOSTTOOLS as to not break
> > currently working setups that have enough RAM but lack free(1).
> > This needs to be done globally due to the way HOSTTOOLS_NONFATAL is
> > evaluated, we thus stick it into the layer.conf.
> >
> > Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > ---
> > If patch is deemed acceptable, can this be backported to kirkstone too?
> > Thanks.
> 
> Any news on this patch?

Thanks for the reminder. LGTM. Just merged it to master and kirkstone.

regards;rl


