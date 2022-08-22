Return-Path: <richard.leitner@skidata.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC4F7C28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 08:15:43 +0000 (UTC)
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (CHE01-GV0-obe.outbound.protection.outlook.com [40.107.23.123])
 by mx.groups.io with SMTP id smtpd.web12.15643.1661156134894792427
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Aug 2022 01:15:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=i/ScriWH;
 spf=pass (domain: skidata.com, ip: 40.107.23.123,
 mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hboy7Awqsod94Ibux2GMePJdxvVkx9Ynu/2HVlWdzMNLNA+XaZNnmzFDVLT8ZCl+G0rJSwcxcEmcjoGCPWwlnNWyVpD3i+AG4hviKiwDEzl7nKjliQH00ztyJFYn2eyp/IGaLsWl+K1+arpgayYz8vziq7ytjWvi5hLl/na/DB0OPQdaMeFsGHpM7cOcKcpjCpOtYetTypmdoxMN8n2wMlTFr124uXEHhWVNLoYYyR9Xsn1QhC552r98Bop/geJuD0uD5J+JxtT7tYZIHYKp79IBiiiZlV+7uC8R7KUXlKW1oF/AB9HaihVut/tkRVvFvgh87xdCAIjtlAT4vGGJEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWhqABvPosjSj0o1YiqnYr51ZAZ89Shytkt28luhs90=;
 b=CknjGBws3Oz2b0fWKzow8j45dTdGBP3k1vSpfsX20eRDZ5TMGoLASuNSyxVpafCi8vBc9XbYoNRZDjSn1YyCJSiWIeE3n4vr44UiqilqV6wVaAvCwKmMWHier54VNbLu+oXTVUYP6mj0sR74NZhvDStvajIMro9fe2nSqCX6WMMC6oqk8PWPhHD4tlLm0fG82pYGf3GeHI/xWPMZ8MFwF7s+iApWfJgrlLgJEuEEPZC5BgvbcDeeyuDufpdA8vnmuGT47LaXG+zCxwS/w+lAsM6AvRJxdnvjL17eM3WKMyGohn81N+NozNJnQkHbnYsa80mozek57isYNRUiwUM8OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWhqABvPosjSj0o1YiqnYr51ZAZ89Shytkt28luhs90=;
 b=i/ScriWH04yuGIlCdyXFrpzzkQhDMpI8PSWImwra0IVB0FF1/U/Xq0BZwdXEsoB5z/WYQCiOeqOBRpqdUlQUd3ivc3LWV0+lzqnZMzileOztVMyDLxH85Rh9pHdGb7qeeiN0y68F5T1NRoOnbfXDdmia0gtilvvH0pdtr3ymPVzU8fLBLsiYT9YiCIheA2KZKjPONevA6ORon7gFEN7G1d7pIUMjerP1fJ7uoXnshI/BCEwfAssIYHYERPPGMqeTir5Aqzv9d2xzbF1rgGsU5bbKnB8H5s7mKpN+1D+m6JWhH2tolmAWo5qma23TJh/DAMvoJeADoNaroo8viiCJDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skidata.com;
Received: from ZR0P278MB0798.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:43::8) by
 ZR0P278MB0380.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:35::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.19; Mon, 22 Aug 2022 08:15:31 +0000
Received: from ZR0P278MB0798.CHEP278.PROD.OUTLOOK.COM
 ([fe80::91f2:a7f5:699b:388f]) by ZR0P278MB0798.CHEP278.PROD.OUTLOOK.COM
 ([fe80::91f2:a7f5:699b:388f%9]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 08:15:31 +0000
Date: Mon, 22 Aug 2022 10:15:28 +0200
From: Richard Leitner <richard.leitner@skidata.com>
To: andrei@gherzan.com
Cc: openembedded <openembedded-devel@lists.openembedded.org>,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: Re: [oe] [meta-java][PATCH 1/3] classpath: Use an include file for
 x11 feature check
Message-ID: <YwM7IAvEulD79BzG@skidata.com>
References: <20220817114308.347965-1-andrei@gherzan.com>
 <YwMyZdfwL6KGQ3Bv@skidata.com>
 <e7fb7e92-9040-4137-9e02-d83d57b0d581@www.fastmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7fb7e92-9040-4137-9e02-d83d57b0d581@www.fastmail.com>
X-ClientProxiedBy: AM6PR10CA0082.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::23) To ZR0P278MB0798.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:43::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9aaf2e02-b28b-4766-92fe-08da84167aea
X-MS-TrafficTypeDiagnostic: ZR0P278MB0380:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vEOW/XRWXNyGdNlPtpv8bUDl7lLmct9CsPkOc78e1vJzNvXQo+vrtDYHNj8sHhlrLS0N6w7ESESidcxgeP08cC7ZwBbxPKlECyy3tqO8oN7hq0u8TeBUvL77htKbMaRJIJRHGTRBbgQf6+F2YuAiOmDYu484NRtNLeU1ZfEAvDrAUuemi9PLuLOZcWJZzQy+KTx2K4MmCq6bLauQBiKWIjOL2k7C5HY6fVY65CEQODYl1jmsQWObg7yqJEfJzyd/jUH28tTuKY3g5aWuYCx+TgezAqR8zb67Tm1GDfJA5S6J/aldf1lA1By76qOB0dqyS3FxiC9wxepEGkmm7ieQYEEtGXb5VVuAappRnDKZWmCqFzzoev/04Cy2XnScAnVBk96cuZG+OIUYy9FNNz8XAPkmVvIG5+Qk9+jAJ/7RnnDVreez0moHODCmkKiWhd2pwmk261UhHk5PXFIxlr+tRMgirzKVU3LnhVAM+gGPiyykWlLqnoVpvOYL3dOfJCbWAeoS/oJl6u/IeISuHR8ElF6ditdCFVz44fz+605vrMUYI7i2E1unPyo0FTc2NBfFj+cFIG50xTc7+qlk1hntmqR84a86BHG39xazRv/eo2/J8EdkfUUMuXTYdQj7QLP4blz6e4//wzyk6PbORinXRuvdRzSER9N7hOLhRNahZ5IMRj2PntZUldJJmZvvZPP4z5jHzFl0yg3uR/CMAA4bGg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0798.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(376002)(39850400004)(346002)(366004)(6506007)(6666004)(6486002)(41300700001)(478600001)(186003)(83380400001)(6512007)(26005)(2906002)(2616005)(5660300002)(44832011)(8936002)(316002)(54906003)(6916009)(66556008)(4326008)(8676002)(66946007)(66476007)(86362001)(38100700002)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XFvt5iGvRAf6uj495M4bUQD4d0nA6Jy7Y9yvdUDdlmXvRX61Ochn/ogq2BWv?=
 =?us-ascii?Q?HIiE4npOWKdGdDMcvTl1YcfiZNV4ZCE0FG0LJbezH9g/WzjTxua47r4fZ2+g?=
 =?us-ascii?Q?U8PQdv4xXligIcyx+d0dBGg1uqLWPTlN29aD45fYJ3ZgAiZhKw5pHD69mKW0?=
 =?us-ascii?Q?ft8AKJK1Qsw67G06j0J3QTqDIXsW/1Bly70tC4pKw1r6ukbeOImUwQE6YumO?=
 =?us-ascii?Q?naw2qa+rgE8VLx0hcTwSUDgAfLTFziX2qrEIyduxWdTVnn/DNvBnzSSqyWhY?=
 =?us-ascii?Q?y/8J6UlXODVI6i3TTlYUdatqsCsQbRhmMhlulnKigWPiQKuiaHPxzsV4CHqs?=
 =?us-ascii?Q?QeytKi5k7hhRWo8Z8sVEsWw6l2a+DkZlV95VvsyihJ6G65rIQGBg1wqRNwa5?=
 =?us-ascii?Q?Ocjw8GM5LC45V4k0UTdF/5FY68604zrg5UCfQyR8fMyhgQCnSM4J9SPo6os0?=
 =?us-ascii?Q?v92NKSTXSi6lrj0qbE2dyRqCttEyU8ylYnh8EyXA1RsQR2wbONsMDDnFypnC?=
 =?us-ascii?Q?ER0fUMI2O0jrmFEHP3TdKs/jjNoNacpSqhHiFvXWkE22UxXB5Y8XjRzClfpS?=
 =?us-ascii?Q?RBVeEF8W9Lbg2O5IGiDNQN6T/ASNUNfl8RK6gkT6teM33LzZDL694vfJ5Ukz?=
 =?us-ascii?Q?McO3vrqeEtI60yqyjnvhoTXtdTnJwr63uBo35aeLU0DAcS9gncD8FOWkySqp?=
 =?us-ascii?Q?kSEuB8HZtyefb6yAswP9bpJouTXJ+cR6w8OHovDSMLnP/9q7KxNGeYQtloIQ?=
 =?us-ascii?Q?NPJPXJkWYd8HF5c8ale31pRXa3M+KSiebgQ94cgUthSCx6H65kxm587b2h8M?=
 =?us-ascii?Q?y6ufomm3Emt0naqx2/zS2XiQkEHObPRYVjoTKQZJvMeD6DzFXP2zurfgQ8vY?=
 =?us-ascii?Q?/UIa+nbloeJbCodBDd9PD2DJv9DklhBfVjl82uS1LxbDprQYz/bqQV6wLaxy?=
 =?us-ascii?Q?4eJ/KsLgpf5UiacuSB2UVyWhH+2GNLrAo+LOiCDoOQQ8m/BlWI5cDiG3ijNv?=
 =?us-ascii?Q?Oz0WMZhK86tgQIuGCVEGco3I9rmlH0egGiNCbVw2YdoPfFqGeePrnfm8U77P?=
 =?us-ascii?Q?IsvYh2tn2VdygS64rv80b6DATvjvHiWduCbpEndtbLmzSO9VcvKrootnhozJ?=
 =?us-ascii?Q?+spTBiW/FKz89rGqQhb5nha2w+UOvKkL7vx0EO++yeHJfsOnvPnsvcvAHGMe?=
 =?us-ascii?Q?OKdnDbUdpbgEMss96FAn9xqj7jVkyQAgUkAVmkTbDrAkJS8P3J78Zheqbbi7?=
 =?us-ascii?Q?Qi+27MFXK8qZhqteSZ6xJxcm0pbSu9yek8/JiNsWHzJL+UwrbKlWBgM+e/8b?=
 =?us-ascii?Q?muPiuBA7lOCPSTWLjsN+Z1UZC4fEdV0bM9VxcM0kuSEp1twyn1aQ1AG1GdKH?=
 =?us-ascii?Q?0nfYj3SPkqjictONpV2zsKMotjQzde4LyVI71LyaOx4ShhyGhEcr5t89nyX2?=
 =?us-ascii?Q?INzk3FxRMxeBFzEQ5EWRpyZmMpwA5c7pDgjs93vApp2XB55zaVbPnAJotTJv?=
 =?us-ascii?Q?3njdMKN9hRkDaYT4seZTpL+cu/simIYGzZc4QCsKPnDCN/yohWpekoitYMNV?=
 =?us-ascii?Q?ap9xF15Do/rg+1YZ6AZrJ3xH7CDzpDhRBeCvfI9J53WLPXtJX2gGYJ4r6oBL?=
 =?us-ascii?Q?Dg=3D=3D?=
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9aaf2e02-b28b-4766-92fe-08da84167aea
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0798.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 08:15:31.3777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 F+sDDfli6195Zqk//TQVP6pLADL88bccixG3KYLWT1xun49Fi81vHMTcJfPZQc9M8AB6pUfSs6H/GCFYA+ZN5dAGbu/vnl8fT67hqh23wMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0380
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Aug 2022 08:15:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98359

On Mon, Aug 22, 2022 at 08:46:45AM +0100, Andrei Gherzan via lists.openembedded.org wrote:
> On Mon, 22 Aug 2022, at 08:38, Richard Leitner wrote:
> > On Wed, Aug 17, 2022 at 01:43:06PM +0200, Andrei Gherzan via 
> > lists.openembedded.org wrote:
> >> From: Andrei Gherzan <andrei.gherzan@huawei.com>
> >
> > Hi Andrei,
> >
> > thanks for the series. I've just applied them to master-next. As soon as
> > some testing happened I will merge them to master.
> >
> > If you have any question please just drop me a line.
> 
> Thanks, Richard. I've also sent the series against kirkstone. It'd be awesome if we could do the same there. Is the testing something automated that I can check out logs on?

As currently master and kirkstone are the same I will simply merge
kirkstone with master as soon as the changes were merged to master if
that's OK with you?

Unfortunately the testing infrastructure is not public available :(

But ideas/offers where to host a public test runner are highly
appreciated ;-)

regards;rl

> 
> Andrei


