Return-Path: <richard.leitner@skidata.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39542ECAAD8
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 15:10:25 +0000 (UTC)
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (CHE01-GV0-obe.outbound.protection.outlook.com [40.107.23.119])
 by mx.groups.io with SMTP id smtpd.web08.12863.1661872214700588518
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 08:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=HinY509a;
 spf=pass (domain: skidata.com, ip: 40.107.23.119,
 mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZqlHcVSGkcpPf9AIi/U3tEKKP+i6prfpd4XWtXOM3M/pokrSZBskqILkgRQWRlRAA9Vhu5yMP5i5KIbNfHyln+2xrBhBZWKcXb4xa3o+92LrsJhenRo8P69COTgYSGiwTUKyUpb9EZEcOVUGG2JLyCTsHM5ZhsWjRz0TKB6YqJtEtrn9fyIFJ4+6ULxqsatcCxU1IsetQzdVSfqxET2jWQAptWKMU/nHqFp3lk/Wy+sD5e1nrz1+kUCy7nuGNQCZtEEYAwXxiXsTUsZX9ULjzd29UST4cjZT/DAy3ZOXe2R/n76/6bMVD7Hja5vBokBqbTG7ZsmI0wEJhnmlLYJHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwwkQw7eOJ7XVIBm46QT5d7C/8EK72h514SBhqIC5yE=;
 b=XnMixLXBQNlz9xJbEHkTSzLOpCNgMdePN3qgC7RVmWewATvscfJkA54OtQKdRQsqY/XxQV4avOXzVKmW0SxBE1EINdxPYqllceuhvHQd3MvR//2J2weW7t4+rB6XR5BlE68vI6Udd79IKrst2vDQDICILD0Kq3uLK0aCZR3TOLOenj5OsdYcPFJWyeWeljgBMFhUmh+X/+MryITWiXV9t5nPCe0xRgLbIWTb1YNLUVJq/ektsfzmKl3r9k2L6n/KIYHsmAqtyHzI1OVCO+e4pe7wa5tSuzgS6HsAFdADOeeL73bVn1LvZcMwKb1+NJeo3kuZb25RG7KdmFqNDLfOZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwwkQw7eOJ7XVIBm46QT5d7C/8EK72h514SBhqIC5yE=;
 b=HinY509auwWxEhKjBhnGsWzC8/wE4JRLB+9XC4IsoEMTppqS4ubDr3WsSMOUnf7RdLCBss/jrEtpOS8q6AhhmYkH3noaFc0ketrpadGwrJbqJuVciBMUO4EgUmvRnlJdc3cNHsem1OfJINX0w7FFuvetG5z5w9s4YNmAMtuShSwzkGhinuk3zcmog3uO1Xqil/7il0FIuNhJzEvkBfnMFCGUxDbRIFhY9Qz8+jyEnleh40dNA80OkURiygxCGRnJQh9tMZWcXJs3jJ1KpXphePqfLoxeZxb2+HE9xxvSD1dmoqI6gVKjDw3ttK1C3fBPpKf5qPlgOvsfAkpVVnNBwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skidata.com;
Received: from GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:30::7) by
 ZRAP278MB0464.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:29::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Tue, 30 Aug 2022 15:10:11 +0000
Received: from GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM
 ([fe80::296c:8ac0:a30c:a0d]) by GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM
 ([fe80::296c:8ac0:a30c:a0d%3]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 15:10:10 +0000
Date: Tue, 30 Aug 2022 17:10:08 +0200
From: Richard Leitner <richard.leitner@skidata.com>
To: Andrei Gherzan <andrei@gherzan.com>
Cc: openembedded <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java][PATCH 1/3] classpath: Use an include file for
 x11 feature check
Message-ID: <Yw4oUE5IPP5Ph0Ky@skidata.com>
References: <20220817114308.347965-1-andrei@gherzan.com>
 <YwMyZdfwL6KGQ3Bv@skidata.com>
 <e7fb7e92-9040-4137-9e02-d83d57b0d581@www.fastmail.com>
 <YwM7IAvEulD79BzG@skidata.com>
 <894c6ed7-e7cb-4434-b132-861ba83a913d@www.fastmail.com>
 <YwRYL6yEEusxD0gn@skidata.com>
 <5b7a7520-f4c7-49c8-b71c-2bb0cb7b01b8@www.fastmail.com>
 <20b725e0-e666-4252-b00b-b8551d9d803c@www.fastmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20b725e0-e666-4252-b00b-b8551d9d803c@www.fastmail.com>
X-ClientProxiedBy: PR3P251CA0004.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::16) To GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:30::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd10da73-40f8-4298-0c41-08da8a99bb89
X-MS-TrafficTypeDiagnostic: ZRAP278MB0464:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	h8uqSFbzezM8xYWOA7bUGasaEQ8e04umhCA40wYSJ9DEofS5eBY5dlyu2Agm7HRLuQIicl00YqcOaV1mv73FPJRtlmTmoTw4SgeqH0ieNxdyPBp3dqtDrxWdxQFR4LnFPNZu3NlJWkNdpWrV78V3bvsydwB4oyg3OmF7KY2/9QOCraESjEiA0FC36oinzOy6H2fWvmCyrzeHEybA0STE37Mzhx/R/ruuvlk/xP0ZtOwm/P0wEwnMpnsOc97xrP+5JCkvp/1Hv/yqiSxGQNjvlee2eVOJwVZWyKG1uGhEIFhEndOT8eLcIYhSr9EWvemjjMJvCarWAVijwNpxrzsk4g7BqJHwPQ0IxyZZlg5VYPE/l52oKkwax3Ra2SgwM7TTiDJKFUPknllkeySth5QSZoGjqAJN9vapuHx2unHUUbas32QbadqeZdrIRAdcYH23R7XuLHaT+8Y6xH8YnN7hcTKuL6t3cK5pGNVzBh+Ux/+MZvREgAkqwjIFnwI/LF5FtUEZ9rJMqj3wpw16AAoUPc6gyGiWkzeYm3tcsmHHgHXUiVsf/eRSKciKINkXFdfLkXVvYkxPhQAnm4z0Z+yUmpuNjmjn6PWcedTbT9C7Dkfz2189AXSj/vrf3ef/I7u6ImQxE/7is/xKobPBkrb1VxnSPF5bfXJKfYcq9LkWDyCnurk/kuNgoZoxlWE9aPFKmgXlAZP8pEhAwW8OsukuMA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(86362001)(6506007)(186003)(38100700002)(36756003)(316002)(6916009)(2616005)(478600001)(4744005)(26005)(5660300002)(66556008)(8936002)(4326008)(66946007)(66476007)(6486002)(8676002)(6512007)(41300700001)(44832011)(83380400001)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l2fu8Oms3kVAI3LBLDmixghb0lnlG1NPxEOdxstmaQbfj1igGaI6MpWAcq02?=
 =?us-ascii?Q?RRnMsEACQ6yR1oT1WiZyjEnXVW2Han2HmJSpbolYRiZmWBoaA0IE3Z60HF7f?=
 =?us-ascii?Q?gL6VK3U9hgxDwZCyfJgJ4VxQvtkp/ppivuRIDbEUja/HRbyTVn3WxaggEUqb?=
 =?us-ascii?Q?CXP+kjs0AVm86q67tpHwWXCPGQDTJRqIgZsWTcdt1j7Lz6EbT+55jX+osRWJ?=
 =?us-ascii?Q?f2MJlRMs2KOvIM6ljH6l5CcKWheD9lhCDk/YHfn6xQk6UpkB/7OmCXeZeed5?=
 =?us-ascii?Q?eaZPSnS6v6m+/PN+wHii52xJ8Qx8TV0d9ujVaVTR9SlcMMKhTYbIGb7xg8Sv?=
 =?us-ascii?Q?jlczbKfRMHLiLmmgvIzVf7LPV1bUtTpbiACQNQI5tO7KoJ7ga7sq5JMOaVSC?=
 =?us-ascii?Q?43Np46vurEPxvSbRXAsfZYmogdsSeBIbzw0GW2+IZiYXnzi+urGMJ8WofFIn?=
 =?us-ascii?Q?GjPVxiYhnm0cw2s/ws4Khn7NCHU8J9+BhA4O7rZ9XXNuwEQJuJfhBW2SyNsR?=
 =?us-ascii?Q?unm5kKdgIRweQFrHIqrFOSbJT/QbS8RN6hfOGKAcgx0lw6vE9aEZRIl2zfRL?=
 =?us-ascii?Q?aaMY2sOPLQQ4Gs+g3AuUJyRZOXfuANfp5P53DDm3DomIpMBvaDucBJCxSLkY?=
 =?us-ascii?Q?zSCuD5HE5vp6vOia4HijRNXFxB1I9btUvACuXnaZnUL2UWbVRkCpPiz16Xqy?=
 =?us-ascii?Q?9Q8nfJWwuWRCjosnxQBKhEhQLAuNfu4Mi3tan7wFYdQC06FFWQx/IAvg1Cf2?=
 =?us-ascii?Q?jcHlZqCrIkcFVvLmkNV9emFBkeQaZKQtIx/QuJQARSFCNklUflbs0NEY2A4h?=
 =?us-ascii?Q?XXbXAGLfp9JAyKdAALXgmf5Ldv/V/dHsUam+CR8bBsmLJ3QQIUu1ksdT//XL?=
 =?us-ascii?Q?SPyYPI/tduOonZ11ctFhWnFJdEOx0QWRKfryU0bKLAtDlFAHuwMH67ISFkWU?=
 =?us-ascii?Q?fgi4pmCYJhVkHWTrSgvohVI34LUadMXVFjWBhf4wPkFY+FS5x2wQXuXGlBbQ?=
 =?us-ascii?Q?EwFFtk/fMzI6jrVdCTB2nzhaMEJanvocTDaa6FKPnxVE1SodUyJ/yF1IN+TF?=
 =?us-ascii?Q?wAyaWRoAxLFJT44qlRP1RgAiHzee6WqBsEobIxhdv8Cq3u1WwiI2gieEOfYw?=
 =?us-ascii?Q?0dH3yYzLvXSENUhNgQ8uF/KiIrN6kZfH5mZtmPZARq9VluOmhpuVgLoXKiSP?=
 =?us-ascii?Q?XGm9ib/5j5oCCaSh8o5krnKALume4adiRlv7iwRHbqVExxYdmnOT9NbOWzhW?=
 =?us-ascii?Q?Jsr6byUvE+gX7Ow6jppM4xhqFZSU+Amxg4Fq/tPVJH4c80VMYzaOJLKmh1KE?=
 =?us-ascii?Q?2krPuC4UyAkT4Ey+Z71mRTe9URulkcvj1UFfZ5feIIrd1PXdeIOSWu7tLLLB?=
 =?us-ascii?Q?ffFO3nW5JG3pQZ+98yiwGpUt7hW+v8xMq3Na7h8V7sfWAgzSa3GtDwHkhbM/?=
 =?us-ascii?Q?/3wq3xg3PUYsYxq36yzhXlhLQ6IIkq+DnWELIWo8bjOJGYG5gQYs4/q26UXL?=
 =?us-ascii?Q?3KviWYiEXpCLH+hn7/0delBYnor/CS3X0vPijHK92dBfz5ck+tGEizA0+c1g?=
 =?us-ascii?Q?3AcC1C4/C9k1PyJ18JsO8eC/Sgx1jzw1qX+pwFz6W/lv0A6pRBGuDn/O39yw?=
 =?us-ascii?Q?TA=3D=3D?=
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dd10da73-40f8-4298-0c41-08da8a99bb89
X-MS-Exchange-CrossTenant-AuthSource: GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 15:10:10.8547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PyecGwmrA8eBALgjn+WMD3NpZ8/PctSzHQz01hBD01nMlQjOIQazmj9SEAhvO9zd5LyX1nYeLs9Lz7Dv+rv7OQxGzs0YJjS/N+8row5SyUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0464
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 15:10:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98562

On Tue, Aug 30, 2022 at 10:31:04AM +0100, Andrei Gherzan wrote:

...

> Do we have any updates on this patch set? It would be great if we could get it in kirkstone soon.

I'm currently facing problems with some of the tests/builds for arm64. I
hope to get them sorted out today or tomorrow.

I'll give you a ping as soon as those tests are finished successfully.

regards;rl

> 
> Thanks,
> Andrei

