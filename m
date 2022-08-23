Return-Path: <richard.leitner@skidata.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AF3C25B08
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 04:31:59 +0000 (UTC)
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (CHE01-GV0-obe.outbound.protection.outlook.com [40.107.23.133])
 by mx.groups.io with SMTP id smtpd.web09.28069.1661229111131816609
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Aug 2022 21:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=HYEmx4LB;
 spf=pass (domain: skidata.com, ip: 40.107.23.133,
 mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZemJVzBGYAKLtGmk3b/zA62OD1Fa8MFiXGgJxFihh022eGnW7ls76DUUG9+sXCmvO5sq132D0W9getysXIcuUYFoYGiXmRrlUe4bo0GlwHOwFAv47nATs+ZA9mHkLHQJ6AH8LE5HkpKQ+6l9LeDPtfUXPgKdSwKAJIOQwnsblytplq/PpzKMKu4TqGglTSoAOSuFShq68mUzbEs6R9pDk9ppGrEOGwtLoybBKfV1UEIdSpb9IJ63eaVypinbpyy3/mXJCGxdwm6hMqZfTY5vzDci+KS7z1CtSQ5EgjSskn2PusQ8kw/YVQbMMK03P+9fh0kz0Q52KQzN2k7ZxyiRmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IiUHQllvxWUqbGR+XjtmHL8av9unjzPkFUJiIPsRGGE=;
 b=cDzmIx7GVKBYqVJrFFhDmhWILnajugyqBNfdWsbCGTRLVZAPc/g5gBgi2JMcY6s9lRnhASjUFQnBI4Ce4mnOTVL0s/Ky+/+5xFwRjiXbXVK4+Cj2yqgbxMp3KVSyGVvttWCTU4czdZTHVYVWwEBlKrgA/arEIDQAp0Ji5yDKGuVe2MndkUsF/NRuR388VClCH5wBneIvUSYiHD8NpGMPVk9Cfn8wO/CNwMjac+bty1y3QNK91mJ3gFxL8R2ET9Ne661UOY2WEs0DS1W2ydSiAdW+yqbQfWrJi4rNpqi5/Hhenm0ZXCHzHwqfwVkB/V7M5WDiZ54xf+M36N1kSQup0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiUHQllvxWUqbGR+XjtmHL8av9unjzPkFUJiIPsRGGE=;
 b=HYEmx4LBHzLGHKfR/fJMmywxh9gQ6TD5K7t+k97bispDeFM5Q5ncA9BfaIT/HSnaTzbNXYTMEcOx8o5czYpBaSgCzNLyTfxAomlp6k5HEnlJ5aq0u2TzytcKeK+wP+6JOjZkHXm5/67K3Opt0aDYVVwGii4wr7p4o4Flv/mn1/mJgiqA57AyqrdmOhn7DOl85OTXOi2b3UD0YmvyWOSH8yrpULhKeLTeUx9+542oksxoPFle6zi00LUjwSMB1iVPsIUqHhy/yR9XNv9CRDdegTtxtML73pJGTlaZuPsGBrkPHZeHLqPGsdGVum+pqPcNzdcuODxCC+GEaghNgrgPTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skidata.com;
Received: from ZR0P278MB0798.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:43::8) by
 GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:2e::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.16; Tue, 23 Aug 2022 04:31:46 +0000
Received: from ZR0P278MB0798.CHEP278.PROD.OUTLOOK.COM
 ([fe80::91f2:a7f5:699b:388f]) by ZR0P278MB0798.CHEP278.PROD.OUTLOOK.COM
 ([fe80::91f2:a7f5:699b:388f%9]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 04:31:46 +0000
Date: Tue, 23 Aug 2022 06:31:43 +0200
From: Richard Leitner <richard.leitner@skidata.com>
To: Andrei Gherzan <andrei@gherzan.com>
Cc: openembedded <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java][PATCH 1/3] classpath: Use an include file for
 x11 feature check
Message-ID: <YwRYL6yEEusxD0gn@skidata.com>
References: <20220817114308.347965-1-andrei@gherzan.com>
 <YwMyZdfwL6KGQ3Bv@skidata.com>
 <e7fb7e92-9040-4137-9e02-d83d57b0d581@www.fastmail.com>
 <YwM7IAvEulD79BzG@skidata.com>
 <894c6ed7-e7cb-4434-b132-861ba83a913d@www.fastmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <894c6ed7-e7cb-4434-b132-861ba83a913d@www.fastmail.com>
X-ClientProxiedBy: FR0P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::13) To ZR0P278MB0798.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:43::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f02dd05e-81ed-4eb6-1f34-08da84c06371
X-MS-TrafficTypeDiagnostic: GV0P278MB0516:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	e88A4+TCkwEAPV17N2LRrG9ABUqLsycWmNI24O1MHJqnLshYs5KceYUbMb8/eIYlapSk5M6h0MrvkOX0k9JeYIlPW4SlOMYU/DIgCB5K3n/tQmqQJOT7GECSSk4o5ffHb/TSUarAmoi2RElRLhSwR0YsmjHQ5KZzlurHwjRV7Tswq1ZEZdcTc8YagCq+lWmcL0JOlYBo3NEMLiqNFzkPQSJdlSj+HoXnf7VTEASP8wSeflKFks3NDjsXlpU4Uji3ZTZTfF46dBIxK7uYI604cdq4xSczG5yduUor88tvwAeuQZ4V1q5ebE4CVlK3fj+pijocYSwCjkfCdLdhjXMRqTc+DqEV27uNR+5JOy6cULKEMJeJeAuq7AXj69VkXU3iebrYyLnFYYtLTu5n4XGel27gau6uDhYAtj54rF92JJooFApYiBjVTxSfFZGRzwTCsuRBajkdS4jeC8Ya194moTGSnZdXPNS5OMgBPWdVCgWroqZGc5xTG9EzB5yAK1jfXDVAMO7Im9YEvjAiwke2WuvsmbU/C3X61a6auHwXc5UrRWTjwpgWB5eIkf/SJdHnde51EpECLiXHLlz/lY2fRg9ldLmssq2LTupZa9QVXZMaxQE3BFqWPrdRJ03PMa0xkukoATk4jYEvSEWMAiZqso+dJTxW8gfKi9a2T2o5RbHLTYVqXerPCWxDusfDBujphHnF54g4/A85BIizzq32BA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0798.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(186003)(2616005)(6506007)(6666004)(6512007)(5660300002)(4744005)(8936002)(44832011)(478600001)(86362001)(36756003)(41300700001)(6486002)(6916009)(8676002)(4326008)(2906002)(316002)(38100700002)(66946007)(66476007)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8bJvZvbFNIAI95uMgG2WPN85hgrwHBMLutHSPG1CKg44+NhhViRbk4cus++1?=
 =?us-ascii?Q?4/LTZbWm6w+019G35BMhGzkFvhUJsNEFi45UsF0mACM+A5YMY/jZetHbLYtA?=
 =?us-ascii?Q?I5xUDjiQ7WOFH0WjaQHAez1nTTGcO6EaLpxFuHHIhVFdD3Y+WClmr1VtUNUz?=
 =?us-ascii?Q?EXwp5Omrlo+mfH2BVGdduKU57aYA3inzpZagrw/y7AlkzZqZBQ0B8KLrz695?=
 =?us-ascii?Q?1Jyne7Gb+3/jyXFGBmQ9oSpfgLVF+eM9qXeKjpYHQU8aoXOL913hoqVf/+VT?=
 =?us-ascii?Q?D+I2ctZJ+X0u+DEpZ+TtPYkezWJ3De+89UjaLy7OCt5O0HpBan7KqeHrcPS4?=
 =?us-ascii?Q?MRH8Xs1FKUsSp2MAqadmb5MDPV1k6ZjJ8g3lxZ8ypaERI4KUavLAQUBF64Mi?=
 =?us-ascii?Q?NtzqLWFtA5z+v8UtsPHdBcPrgqsoPYG1721V0t29KARKyaFG5IHdNRRbfxZE?=
 =?us-ascii?Q?Diwv6ZEWBkAFiLX3SvvQX7P8o1l3E/+07w1sze4RNgfmiEjDof/o0OagLo4c?=
 =?us-ascii?Q?nCGMPVe+uxfWPTcO0Fb/djmzlSyPsGlzoT8RaZsgjl/CRlnAFW5pTrzX+PJs?=
 =?us-ascii?Q?WwCiVF+dgtr4t9272HCnHy2SDCWS2P3fXZx+RcIcnogu/JPBdGPDA3t3ZLq2?=
 =?us-ascii?Q?sL2WNOiJ3BGjWFr7/pxtHqW+nzlI74k3U/TBd/CTLrLPtEVsLrzUPGrqYJ6Z?=
 =?us-ascii?Q?Cwa8vcCjR7t0/u/DgAGjobyoYkP4Vjz6yet9UWJDBPUQT35KoTvC5mJY2QdO?=
 =?us-ascii?Q?1Mea6ey1MmedN7+o+U1koL63NAeJUB0Yb0/BpncmIEhQrx2GQO+38ybeLymu?=
 =?us-ascii?Q?fF8+dx3HxGsPkBtqsBbNje71W7O7ZhdvfSSbcWOjRmlLj2qPijHwk/XATdLH?=
 =?us-ascii?Q?LxOSh+Wo2zcQb19+/eG909G891ueSCJGU3pcat5Gch6DyZuxRKnbvktDspO/?=
 =?us-ascii?Q?GEa736vwXDv2Lh1wA+ksvxp2XcqxFxSpnrkvKzb2hA1DL+BKYWGVungwPRJF?=
 =?us-ascii?Q?ULNAev7xvquu3ybQq4zceqRLDXTDS0Hw+R/+f9deHOpjPZRzAJJ6slJFQZoA?=
 =?us-ascii?Q?6OxFKI1B28jmS10O/nb7BhnHhRyNthpnkSe3ij/sfzGBnPCSmRjHuZpnb4Zw?=
 =?us-ascii?Q?/nZmhwrZDEUsWu2Mxjgqa/6tPbK+jtIexUEJqBCE8Zvpa7PVoF9dvBS+ChJm?=
 =?us-ascii?Q?MdvGoy90N8ODL24uXCGBsEGjTgDem/s03NChCZPhLxXfDeKTqDleBHdloX+M?=
 =?us-ascii?Q?mps9Ml/DvgSHQCq36Flpujsrx1tqSz5QZr3B2QTDFr/0viSoIlymJECIEmpT?=
 =?us-ascii?Q?XIu1AQS74xQSGGbVVovDNqhnxW0jk6sqaMPNas84bahCzRVGbSIH9H8BkrBZ?=
 =?us-ascii?Q?s62dMF9+8Id76N+xxROwuyqa9ijGhzTmPV/RqQ4gUUjPC+zUdwsNHv278uHx?=
 =?us-ascii?Q?Z9QnnzJEuQrXrgYHRKikuaUCYoFb+NeTLrim7D5pRu4j3o7RxQq/9UQtmUga?=
 =?us-ascii?Q?fnO46nrK4MYvXBamAqe5SM5EEDL+BAqY9hrNrS0pxqZ050WeNvTCcASH8Qu1?=
 =?us-ascii?Q?pQapME+r69TAG6vvDBc0W1dVWtW26bkyTmnq3UrgEnW+8gsQCz8lVQalxduf?=
 =?us-ascii?Q?zLmK4iMQv825IRUnbexiDfL9TxGajOxgZp3lfKx3RD8m3LqjM6M1kqnxmzDe?=
 =?us-ascii?Q?lp8N7A=3D=3D?=
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f02dd05e-81ed-4eb6-1f34-08da84c06371
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0798.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 04:31:46.4384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 j7Rb+SKM0N64Echj0+x0bytQmzO8ol0VqnVJk/DgalvplfjasImJ4xRbBSN6Q+rVt2+asAnq6OYCzMZYxHAq5Fi851SmNHgDrDfJ0wkTX9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB0516
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Aug 2022 04:31:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98376

On Mon, Aug 22, 2022 at 10:28:34AM +0100, Andrei Gherzan wrote:
> On Mon, 22 Aug 2022, at 09:15, Richard Leitner wrote:
> >
> > Unfortunately the testing infrastructure is not public available :(
> 
> Got it. That's fine. I'll just keep an eye on the repo.
> 
> >
> > But ideas/offers where to host a public test runner are highly
> > appreciated ;-)
> 
> What is the current testing plan for the layer?

It's basically running the image tests for arm, armv7, arm64, x86,
x86_64 and ppc with the mejate and mejate-musl distribution.

I can prepare and share a repository containing those kas and gitlab-ci
configurations if that's interesting to you?

regards;rl

> Andrei

