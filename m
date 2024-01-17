Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E68C47DA2
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 12:43:08 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.52])
 by mx.groups.io with SMTP id smtpd.web10.952.1705495379282539902
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jan 2024 04:43:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=r8w/z7Ha;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=r8w/z7Ha;
 spf=pass (domain: arm.com, ip: 40.107.14.52, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SAN8i7RUQwLKcSYajrVV3laU0UpD0UPA24uQSB5/6NDv8bg/LphYesPFeTeJdWTpYdq/vx1xBCk9kGarsNQhtRfjbJ1gN1HaRRAjxNi0dhJOSRbrDSfcLYwmefQbndUPRWP5Sf7rS+sQNEoKybUVDwglybbzJYnHWHYW6AIsaAvX2v0zSaGXXqvdQZDfEBuOkn16FZBhzEr5d/kpuAXxSptIyqMIU4OkyUrae7Hd0vOW+bzjWcG6YrRRTuZOByF3ZaN5NernM1bv9uHm9ryB9f8XY5mmG0MtK+8tWVaNkYATogJfqFWJUJysllpwNqY1kK/qSaywi9NeujFyW713+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQrrySLP3Tien3QoolmusQmEeq91xkJFDRSpVv2GfX8=;
 b=cjcHq1HpgEeNvLDDwc34l3TNVIJ0/Epf9l44/e6z7teUxoLxOmgNcXBG1IRUoOOOnbC05EGPg6eRhEVAC00hsEQlejVrMhBd1BUru0d5g+HoHoXylcZD38IQAtHvU2ufi028Hn6/rPw+KD3Ax/ObaG1i0XVfBF4kzVLi3ZhvVnbxGrQvzrdfZraGmmuNDSApdANazlm0mnvV4Su6ttL8ujXgACP7YWmvPLITIorYMojH3+wZClHq7Z5RXj7wQzt/YrcDO2XBdXrZPFLdGL1nNLUQ8lIG5Or5vxsCL/2BFGjRx+UqLhqAnqotl265sX8dzy8nd871jzEvRPhG4fOzMg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQrrySLP3Tien3QoolmusQmEeq91xkJFDRSpVv2GfX8=;
 b=r8w/z7Ha2YxkmCaOyhbxScrQm/J8/l/vQed7mQA2Kp6mZQsISw2Ti+l/U7omhDhv5Xo/X0M0jsNtBp9lmH0QPEF9x1LM3UElX80+PmerHmPLvaLkXRn5FB9/t1K7Tu+90wgKWoijzHE+y2dTRC67goCWWVgdq+OnveXLJzvzIxc=
Received: from AS9PR06CA0365.eurprd06.prod.outlook.com (2603:10a6:20b:460::17)
 by GV1PR08MB8569.eurprd08.prod.outlook.com (2603:10a6:150:81::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Wed, 17 Jan
 2024 12:42:55 +0000
Received: from AM1PEPF000252E1.eurprd07.prod.outlook.com
 (2603:10a6:20b:460:cafe::1c) by AS9PR06CA0365.outlook.office365.com
 (2603:10a6:20b:460::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23 via Frontend
 Transport; Wed, 17 Jan 2024 12:42:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252E1.mail.protection.outlook.com (10.167.16.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.16 via Frontend Transport; Wed, 17 Jan 2024 12:42:54 +0000
Received: ("Tessian outbound c87008563c51:v228"); Wed, 17 Jan 2024 12:42:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 17383023943f9980
X-CR-MTA-TID: 64aa7808
Received: from 2438a0f7da95.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 23270C94-4398-44FB-AF22-B0C9D09940C4.1;
	Wed, 17 Jan 2024 12:42:48 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2438a0f7da95.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 17 Jan 2024 12:42:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AyBiBKKphRXGU0QNgQlq+scwabhYmK50lJQBfKOXg7y4L0zLiwPxU+u+ZrJjiVm1TYW5NJeBt5sZ295nkbXhXVW1WUFwo5Wmf5ROH4ypjwyTfSZBdAHzGvMbZ7jbjmNsEw1dvbe/wVmv2R3y+jWd8dyLO2xwd1163MLQw7c1CMZxfFcWHdr1azwYB3ROZxW3C3gw39v3Hpg/GYHB8SN/F2S0idO6WV9JX0cCgTTAWOENgqGJxlrhKvz63AKdUKqeXRDq9D5o6uiFESu7BKH4sOUVdmx9MbPicyU3HHX8bPV/+8RrnCbTNIAKpUbq5Xdai/Uv590ntrqsv3vzLaceoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQrrySLP3Tien3QoolmusQmEeq91xkJFDRSpVv2GfX8=;
 b=g9I4VzvOq9FpjkCMt1kXVgTjHXWYqe8Iv36feWEP9xYYLU1o2FEZ6GBLsCBs5IPYIEzAHI41IK/Dh3Q0xbVo+puHxdaO8/TsCEM2vtBgcDfmpjj9Cxvko8JFwk05XROYI+ZIkNVYd1nYi5PXNZbtm2BkSAHGjiRPZ70+gaZkXiWZjIsb1PvbVFqKpgpCr8MJO/mS4J7IjgTpxeghIfER9EptQap9iiDw3W2X7PmYw3pvotRqCojwk7e+tg2Fw0mAdBulh3bEycFDFw2s1ylal338npCNqZs3RUWdZJmGEQKtRpNcmYQu53e69ys5DWJC5h16juorFAYvzaybCioPaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQrrySLP3Tien3QoolmusQmEeq91xkJFDRSpVv2GfX8=;
 b=r8w/z7Ha2YxkmCaOyhbxScrQm/J8/l/vQed7mQA2Kp6mZQsISw2Ti+l/U7omhDhv5Xo/X0M0jsNtBp9lmH0QPEF9x1LM3UElX80+PmerHmPLvaLkXRn5FB9/t1K7Tu+90wgKWoijzHE+y2dTRC67goCWWVgdq+OnveXLJzvzIxc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB6508.eurprd08.prod.outlook.com (2603:10a6:10:262::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Wed, 17 Jan
 2024 12:42:45 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06%3]) with mapi id 15.20.7202.020; Wed, 17 Jan 2024
 12:42:45 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "zboszor@gmail.com" <zboszor@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [ANNOUNCEMENT] New layer for parallel installable PHP
 versions and misc modules
Thread-Topic: [oe] [ANNOUNCEMENT] New layer for parallel installable PHP
 versions and misc modules
Thread-Index: AQHaSSlHUOkHy207g0S8+kTL4Nh8UbDd8vyA
Date: Wed, 17 Jan 2024 12:42:45 +0000
Message-ID: <F9845F01-2233-416E-B0A3-97EF5E48FB0A@arm.com>
References: <415ef717-ab15-4bcf-a8d2-2e8d8fb37a25@gmail.com>
In-Reply-To: <415ef717-ab15-4bcf-a8d2-2e8d8fb37a25@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB6508:EE_|AM1PEPF000252E1:EE_|GV1PR08MB8569:EE_
X-MS-Office365-Filtering-Correlation-Id: a17fd56e-a0e9-407b-87aa-08dc1759d373
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 E5nOccVJVCPDEmVSmWg74cIqCzYlz/3QI1d0wYofJOXg1ue2Gxf+wE0bDJ4+3bB5tW2oDsnlHy4JQqjER9lRG7NYXDJinlvAN9zaX+4bOvvUaxPJo65smii6gDpihlEH+7uEFUsODdwbDZ0lQKGJ074+WuWBYoREgfb5gzAPujSGwVE9RO+uFWDGRu8Ag7pH3n+bRw7Fw6XSmt2EFPExXVM1DN3KClcwnGH/JtGahg64nIGP2rQKPdpwRrelOp+Rzyu419r+Gw9oD2/LhPbgVSFR2foh7P3HzhgQr+PLZmeLtFtPtFW+gqG3xM9KL4dGsutznsdk+9GYPtNJuQzxD9t+HfMZ0A3vQnuqRIofFq4qvN0/xzZId/5Z/1118NHHNWICq7eFac1+vCocH5Q4tzhJozrz3/ZZ49jQr53lFZAh3TIvUd+LT1AyqDAHoi5F0kbEjqJGp7E1J0RdBBfPvXR0YEF7IHShIGfE5Uygf4bk82Y6DsrztNoLkmP95cj+UhNUAt/9vJ5BEYuaugX7gskewT2+igc7FHWs3OoldQLaz8Kkn/77adIHxcteqLhDpKWpuVIQRzkG7se8eyPJHQDtUoZ3pYsSGbEvx1qpomx1Ud56RO1u6SRYHHUOob6wT/550CNfVFOCQv1VGU9GUQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(41300700001)(122000001)(38100700002)(38070700009)(36756003)(558084003)(33656002)(86362001)(91956017)(316002)(66556008)(6916009)(66476007)(66946007)(76116006)(64756008)(2906002)(66446008)(8936002)(5660300002)(4326008)(2616005)(71200400001)(26005)(966005)(6486002)(478600001)(53546011)(6506007)(6512007)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BE4260EF74BED142BCDA692B2E6BD10F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6508
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9fd5f1aa-f577-4bfa-286a-08dc1759ce1a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/yoz6ktoULeHKRQ9mwo6izMi0aZQBcfvgTukgssG/DZkr7DMh7OYDTZQYNbKAulhJ+cB3ORlysoKdK73+em6OPERjBgdxBiP8DWFfbVNYbbC/gWjpNG2jyHwIvi/CyFX++FxfJZ00hE4puijy1ZfYBN+UQAHGZwkD3ptD/sAqRDcPMXMwT/lalhY8wvkFe6PjZFnjzelxCQJ/LDjbyxXBtaPoMuRmEbSMN+jc0HcPRKh4JtbFpo8azxlqGego+D6Gf4bA6xlS+RtGWSyUUyPGdy8vtf9jC8eXfJZrHjh6iPhZA2ip9s+zI83/jFytr7Ub/M1PenCI4hg3tyGnI+F+qz038bc6AbGRgZ9P5XXlKkBkYd5LfOVH4fpQmw7yYtLHJY0XpdWo/gxVU01h03bR+H5huKkRCaShHw4ji02nCpndBpvNFZojIq88lh8+En39BMkspWzbTI9n2kMUDDADwJZdBhpK7h7pF29+MBGiQf1hZeF97dM43V871TqWSJOhtd9iDNzgKjYwdi9dhzlvyqTpEyTfOVWxBTt/DY3l50/HqYEtt/lzxPYatqnnA8Tn6OW7LpB/KngHW+koGZtgrAirqirTM+UGeaFd+HjVrqzfYauUhcWUprxyGx0O3uqibERfkUBSEPtZzJTA3F2bk5x3dXNa1NB8X1gO3vBg3SpHTnoRI5KDYBSwGEcVXxcaHKPsD5TpTGBIix0J0XPt1R1+Yhx+QFsv3q9rhYTrPg=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(39860400002)(136003)(346002)(230922051799003)(186009)(82310400011)(451199024)(1800799012)(64100799003)(46966006)(36840700001)(40470700004)(558084003)(33656002)(86362001)(6512007)(2906002)(53546011)(6506007)(26005)(4326008)(6862004)(8676002)(316002)(70206006)(70586007)(8936002)(478600001)(5660300002)(2616005)(336012)(966005)(6486002)(82740400003)(41300700001)(81166007)(356005)(47076005)(36860700001)(36756003)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 12:42:54.6234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a17fd56e-a0e9-407b-87aa-08dc1759d373
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8569
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 12:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108330

On 17 Jan 2024, at 09:40, Zoltan Boszormenyi via lists.openembedded.org <zb=
oszor=3Dgmail.com@lists.openembedded.org> wrote:
> These recipes are now public at https://github.com/zboszor/meta-parallel-=
php

Can you submit the layer to the Layer Index at https://layers.openembedded.=
org/?

Thanks,
Ross=

