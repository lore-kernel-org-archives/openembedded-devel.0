Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E991C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 22:41:16 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.74])
 by mx.groups.io with SMTP id smtpd.web08.29.1668033670683680934
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Nov 2022 14:41:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=wS5L48BJ;
 spf=pass (domain: arm.com, ip: 40.107.7.74, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=DpWHcz0OqwBfGbktg5t5kjC3h/95tmHXdvZIrBE6uAKZwNBu1B6uztIemVYsZWeHXValKOFIS1INqikmaXBnlv54Mj0q0mAriKHdKDy4XIoWPEKd5bRfkj/FSPX38KsZAZrzU46bv2QFCvk6CNrxfnLAEfaoJTlZ6mWudUgUBwN0BQYybHvSaZWWhJa9W+YjLGwJJzkg7SqycjhXtF4AlU2S2qOloYhoetDc4shP4+tfUbVP7G7gZ34aEZgw+jrd0TutpkEaHT4bzTV0ZcphgE5oDJgFMCWGrDQxKS/w20Q9tEXjxBhTQmFev+uVigOpIOcqp5qEf5Qsw74rxyfYIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpcRkMkBvs5v3tE9Rq/6lfcpp0DymXiPZKoPPzNNy1o=;
 b=GLVBlCRDino3P1ioJPbCVjJZTfWR+MSNPJqqHLNO1H+TW0plgqOZlBhESzECsG7cG/YDuwiaEeSN16vrlg0EEuJfEvLjra3uKznSx5EOePoE8yB6GlfgnvTUu8RYyUbBcP/aKptKLt5DpOdxyXtQm4GeocT2fs6PIKjDyi8QYNF3k7KgP4HYLGuKErzJP61FjX0XOftjqXRQTTyntkEPeewUTN49JxsDgdEmAZMC37ATOTdz3Wt1d0t/OQSc5vk0CA8yYrZuBzU/zfv4SEdE4ZVWOMhvlcqr9anCxCS7fQxek8TPBjAomGnejCiN9ixE+SuBnFE8BsfUHbFdEYvUrQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpcRkMkBvs5v3tE9Rq/6lfcpp0DymXiPZKoPPzNNy1o=;
 b=wS5L48BJUmEu3HPpyAbhl5PnCTuJkdHsnhmW9dpqHzF0t2VKzyQuAXz6F/ZrgMatuHzgKaqPBEJPaWeCGHpo+3WfHFXanTP7y45p1/1Asi2BNvyakK8EPbMr7sRJZlq16uliadonAms/7KeU/eL/nPzo2Aw6vd5ZANsefjvdxmU=
Received: from AS9PR04CA0141.eurprd04.prod.outlook.com (2603:10a6:20b:48a::11)
 by PAXPR08MB6526.eurprd08.prod.outlook.com (2603:10a6:102:df::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Wed, 9 Nov
 2022 22:41:07 +0000
Received: from VI1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:48a:cafe::b3) by AS9PR04CA0141.outlook.office365.com
 (2603:10a6:20b:48a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12 via Frontend
 Transport; Wed, 9 Nov 2022 22:41:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT015.mail.protection.outlook.com (100.127.144.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Wed, 9 Nov 2022 22:41:06 +0000
Received: ("Tessian outbound 0800d254cb3b:v130"); Wed, 09 Nov 2022 22:41:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9973fcccc974f410
X-CR-MTA-TID: 64aa7808
Received: from 09db7f0e2dab.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A7CF8C49-1292-4E5C-80CB-75455FEEA74B.1;
	Wed, 09 Nov 2022 22:40:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 09db7f0e2dab.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 09 Nov 2022 22:40:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CdjvAhqW5cpClnabzY3dy947yKSb9/1AQ2EklC+CJM+cqs5iCJagC+C8YX+Wkkb0wxy2zkdm2ZHrogIpKd2EqnTO5nsyZKmjVs5t979mOeukGDuszkQxnBPe0me+LMHKtVWAIt9M7nFd65mZMSTuCdU/aAyObzIi2QtzowofyUJuPtGSm7xPJ3z3DIDdN0su2KcM2Jw9rh6ZfBmkCVPV5hNyPLpX8rz05B/+KcqAELdB4etTYkV2Bap9eJe3Ih/ADxctV5JhoKBUxckieALiRNU478rKUlAHpYQYPiBQgtbbtyWSjqZYC72kDO21VfMiCR26ZFDRcDJf61TtR07iSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpcRkMkBvs5v3tE9Rq/6lfcpp0DymXiPZKoPPzNNy1o=;
 b=oaa22QStq/ymEo1Orv1iQFMq8IR4HtqCdGTUSCdiUkFUjitd0Ry2jU74+NOdxCiuV86Cef1yHG9Njnd5jfpCJB6kR+eAh/p0ErzIt2OWsDcVcgFmWyKS7Sl3e9KpMg2NN/zPr6Gknrd78jWGl1Sxh34wuVRdTpw+XLcFL5j91CPPejUUzy3aanxlI587EYxoDZMTPZDNKWOgdyzmeXsGPNDSwh7WzMPE3vPca2RvpgHkMoNdZpFdHLaRK/NVyoTjtMUuSapRH8mPrf4cq4ZjjB1Gt+X+M0XRyR+/j+mmSW3LiX5yc8YGUB9wUsjzWlecOCibMp1lOGeyCWXB0SasbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpcRkMkBvs5v3tE9Rq/6lfcpp0DymXiPZKoPPzNNy1o=;
 b=wS5L48BJUmEu3HPpyAbhl5PnCTuJkdHsnhmW9dpqHzF0t2VKzyQuAXz6F/ZrgMatuHzgKaqPBEJPaWeCGHpo+3WfHFXanTP7y45p1/1Asi2BNvyakK8EPbMr7sRJZlq16uliadonAms/7KeU/eL/nPzo2Aw6vd5ZANsefjvdxmU=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by DB9PR08MB6570.eurprd08.prod.outlook.com (2603:10a6:10:251::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Wed, 9 Nov
 2022 22:40:57 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::2044:53b2:87b3:eb0b]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::2044:53b2:87b3:eb0b%5]) with mapi id 15.20.5813.011; Wed, 9 Nov 2022
 22:40:56 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Markus Volk <f_l_k@t-online.de>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] hwdata: allow to build native and nativesdk
Thread-Topic: [oe] [meta-oe][PATCH] hwdata: allow to build native and
 nativesdk
Thread-Index: 
 AQHY9B7Gyuz6ptEObUC3T3flD/vmxa42iwiAgAAO0kqAAA4zgIAAGMaAgAALuACAABSyAIAATyIA
Date: Wed, 9 Nov 2022 22:40:56 +0000
Message-ID: <CDDECDFC-F9F2-484F-BC3D-7BE01702B584@arm.com>
References: <20221109093534.2718027-1-f_l_k@t-online.de>
 <D7B0F690-42BF-4D57-9A34-FB8650CBB7C7@arm.com>
 <1725ECAD7BE80329.32043@lists.openembedded.org>
 <C123LR.D2SJ40BPAVYN@t-online.de>
 <9CE090EB-662D-4CCB-B3EC-D103E13575FA@arm.com>
 <JI83LR.6DI8KX778AKI@t-online.de>
 <6DDF75A0-A98E-4E64-A718-87232BE33CDD@arm.com>
 <WVD3LR.DM4P4WUIIJ2L1@t-online.de>
In-Reply-To: <WVD3LR.DM4P4WUIIJ2L1@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|DB9PR08MB6570:EE_|VI1EUR03FT015:EE_|PAXPR08MB6526:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cd0a876-95f8-4519-4a72-08dac2a37db6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 7Ekt8ZabFUs4o/a6gIRXVClp6yp/yohlHSqB8vUWSovp1d5OsjoPue747B4hC0zgyAZU6wtophN7j6DqUugkK3L2f7apWrhDO3k5/qjjdKzBFBmcUDkKse8lfrEaXTq+f9fqcc3EB+huKP1LcxlMr6st4j8Pg39VvGsB8kkE+xcRxQDhyORKo2dSMc9M1xa6iwBb4l3bZ7KDttGSVTCFUYhrNWzNB0Mo4ywbBsefMdBPN9xnlmEZb4GJRvQv+8QYhHfKVBTOsXiCxrKpzXNib1mjce2nCswYO2GCZKub58WPgMK09bl9bi4f+whs2fuxolX5O62FnWLiivmJpYw6vG/G2qaEVfivxqijL58ld7J6mM8RgYW+hRUCDdc3UXcKtdi7cqR8GXfENoYCifPo4sK4OglJka9dEOjH+oGFE+mI52OQr6Kei1rqqGr3ncKSToWlPemL7InYFcCKmlYPX8md6aSswJ7c1kO6TZI4L28Q/foBWamLiEQR0f0wzAGBy6odQwKmsoSgs6BEotzouUoISmY6RPnnYhRkUPNMwOOy+xXhdTk5xDVkC+o6qPaT44YwE74qIRIrP8FdmfExha6fGfbJYAi0TV4o+kO6QD4Uq0yUHSVveza36GKPjZtLB/6rzFcVAD7dmexmr9bYwGb803dVL+apFD3AJva3TehcQ9C8p9bOlVErI2+7371PMQ+FMx+ioTLN5eI/ISQar4wgprHAkKV/WgCjXT+CuPbCizrKZehEj1doXlO96PaYGsvqIJr7EJd47seRw9/TR1brkj3mp6moWKrSmGy6vAA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199015)(2616005)(186003)(41300700001)(33656002)(8936002)(4744005)(83380400001)(6916009)(5660300002)(36756003)(316002)(38100700002)(71200400001)(38070700005)(86362001)(478600001)(66446008)(66556008)(66946007)(6486002)(66476007)(76116006)(8676002)(4326008)(91956017)(53546011)(6506007)(6512007)(26005)(64756008)(2906002)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <329C59AFBE1DAA469B5A1E986A2138ED@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6570
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2ce00674-544b-4d50-c4c5-08dac2a377a0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3eBsP7bs/eDqjn4oz/7Oa1fzoL1VG/YeNfnctNm9E/yexmL+NZEX0MFvOUmfz6k+3oWfdII6G1dviXPmt47qX4EuR+CveEmkubqjlx0nYwXS1O+kIJ2NXPqTkvVwRt0W4hjdPPyvRj1d+hrC4P98apFKPMS8nUXKd6TNXVMcHeA1Fuuaa42GnF2iXAkDaneQrxLhs3oh98qqDAX+SsKfOPbypiCtIx9HdTrm7n7ddK6J05BBa9k+QTuGDB3bCs5p4CHE9dvkSL1PqOnAZNaRLdsARWjC1l9mbMZaXGv2pZQ1Q77UTyOE25WyvnJRNBfBpfnsx3g13JoDvwB7AgeGhTgyQBBkDUY0veSjSUJq2uuMvRcZtbiLL7gnhNP0SRyPHvyZC4T7x/ztteAIEpCZMKnWLZtcPKEHbgudyZiFGFMNlTOnLBfVrodcYfOWrbLlrkT+E4cu+3kKCz64nGJ8zzo1Td27E9G20mZGViXVGVuFg9d6zuSLzBZNsJbUO+tZzZm+2XgNWl1E8hHOweaZRpVlJcV/8GNgWQILOFrija+s7FlOK6W+vgW6E18QkD8nfxHuEHyV2LwLG1BE09PNh89sFK8URo5gKQtBDSTXGYpfrdFfZCRjrN17cEzCIGdoRvOjbNIJF+GyGM9nyMP1NWqbz9fTeKfR0NI084k7SeMtOay47NSu+GE1SW0qLooKxJQaNxsq1pCBvYQXM7X/L0NmDSQ7HMDo5ypbc5yMBzOMX9D4SjAtYOqRg+WHJgBvqRcLQgY52LP6SmvN8K4Ehg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(33656002)(2906002)(316002)(4326008)(8676002)(70586007)(5660300002)(478600001)(40480700001)(6486002)(36756003)(4744005)(8936002)(41300700001)(6862004)(36860700001)(70206006)(83380400001)(81166007)(356005)(82740400003)(53546011)(86362001)(26005)(6512007)(6506007)(2616005)(47076005)(40460700003)(336012)(186003)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 22:41:06.9809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd0a876-95f8-4519-4a72-08dac2a37db6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6526
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 22:41:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99516

On 9 Nov 2022, at 17:57, Markus Volk via lists.openembedded.org <f_l_k=3Dt-=
online.de@lists.openembedded.org> wrote:
>=20
> Got it. You suggest fixing hwdata .pc file first.
> I didn't know about the pc_sysrootdir variable, thanks for pointing it ou=
t.
>=20
> With this gehangen wlroots is built when 'native: true' is removed.
> Would this be good enough to send upstream ,or should i create a patch fo=
r the hwdata recipe?

Both? Send upstream, apply patch to the recipe until we upgrade.

Ross=

