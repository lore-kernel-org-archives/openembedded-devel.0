Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F16F2C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 14:47:37 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.56])
 by mx.groups.io with SMTP id smtpd.web10.23221.1703083654593875187
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 06:47:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=kAGCzpkx;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=kAGCzpkx;
 spf=pass (domain: arm.com, ip: 40.107.22.56, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=K8ayvGDSTZT9nvPdNwuNrmHoHdTE//cFTLfo2ZUimQ85I5qzelW3/Kehe9ZhzTbjLe0bzO6FV9xyFhUAC09DSmW7eMdlSnfCFFhMVtiWZeD/v5hT+kge8J/O9fF9VMAk/Pcvv25eORAPoLfYxumVHA4nPVEXVXf6SqVWBdXrwShi4O91lIeIiFUum7gK9edSE2nck8Og8RTFuVmR0XRXwl/K3s/Zlll04qkhWjqzOWbGS5PnXg9g15FbhML8oSXkirN4nvhyTBzuDw7z/8QmYD+YH4VL7Da/TnphfzDMe2htYJNsvLH2U7l9QAnL7aF2LL8p/z4bkRyOnrMJBzZLUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsmUFusRMKmPKQaW9Hp6mwrYNcTJPR6Rinipb7uajYA=;
 b=ViQeRiKVpCOMkLA7bczV83RE0F5vkM/rTu82Fr1CCEjgxbGgNuVYOET8kro3dzzoayweQicVjxgM44xGHa7GbdYbjLCB8YxbevONiD3R/Up4z+vof2uf28T3No2gE4szqPNC7i5wO9KNDlExrGMWXCvskVePMVPsAgz6Mn+MRUv0ku7i+ycna6eldexOCcNqfV+ALy8UmRZBe77nYa9vnwB59Tz5h7BcFCe9b7ohFu2Px4WBkBLZA7BOGN9VmL21q9AL+ENg45HNIQPmA4osPDDyUDgVAA3CKzRBT82Syh2zc+bR5cg65M3gdl+WH8XKqg2G4HD2ttIkjhaSVZthwA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsmUFusRMKmPKQaW9Hp6mwrYNcTJPR6Rinipb7uajYA=;
 b=kAGCzpkxQWMS7w4hwy/lmZ2M/XCyTDzRFPGKdP0/qzhNVtXfqUa9qAFNtp1wAsWrbNZIHJ5vRw7f8D2ma+59LY6gFccRaFZml5edGrqTL7jto2cztDuPjTx7yI39vll9MaJMUYrtneWAMdw6dxYPwUGBfO/d0nWmVUTU/PupzW0=
Received: from AS9PR06CA0106.eurprd06.prod.outlook.com (2603:10a6:20b:465::14)
 by GV1PR08MB10672.eurprd08.prod.outlook.com (2603:10a6:150:168::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 14:47:31 +0000
Received: from AMS0EPF000001A8.eurprd05.prod.outlook.com
 (2603:10a6:20b:465:cafe::d1) by AS9PR06CA0106.outlook.office365.com
 (2603:10a6:20b:465::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.40 via Frontend
 Transport; Wed, 20 Dec 2023 14:47:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A8.mail.protection.outlook.com (10.167.16.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.14 via Frontend Transport; Wed, 20 Dec 2023 14:47:30 +0000
Received: ("Tessian outbound 8289ea11ec17:v228"); Wed, 20 Dec 2023 14:47:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 93479293fe0c9d9c
X-CR-MTA-TID: 64aa7808
Received: from de76914d31a7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7AAA2567-EA82-4643-AA68-1E5372093413.1;
	Wed, 20 Dec 2023 14:47:24 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id de76914d31a7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 20 Dec 2023 14:47:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mo4lts9qutZwQkMzZh2nOMmpRv1Dvioo+N68mrwr4IV+mIbXknjUD37nf7WOrTXdNLZ9ok2+nLw2tIYXWFaJOF8NGB3kDWjVsWduYxlz8xjm9d6wq99Lmb+9CjSANrRGEEkg0znGL6Kk70ElZcudoPcVjJ+KlMmB857hzgjFXQvG0ijibui/U3BsDfScpwACCx7ZDn/OU7KdNjfsEt4qQJy/HZlTSo7lnceeunera6yD+P9DG8nRNAxsgpuzPmdVY7OGObDM7oSeaqrg1x8tOxYKYYuNSQUMCoRe8sJct+RF39X3Xfu7mF6D3YNGcxOxQysMh1/q90+wfAIfwbkDYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsmUFusRMKmPKQaW9Hp6mwrYNcTJPR6Rinipb7uajYA=;
 b=S306JnlfgAgfLC2qZEkKPh2NBXx29L5vZ5bSdnZR949TAIa5vSGiffPCXNXILrH/321d1EPQcoEqQAw6N/yA1GaDyTfLvbJkNjs9/N+4hkuYLQeVgLLKtjoZ3GF7CfYkdEYrIzrYFe+ROcw0w0DVwxfx6X4Mv8wn86GaISGLIfmaxG5UoUBPrf2Afp8Dvn8S96zUnGWQyA01Pi69yP3FfdMTq/HhwVfp+zsjoNhbpU2nuqkNHtuEYxQrPOrrkVeh3ZJ2RF4TXZXUydpM1VGmZtZ0Nk/i1sPxRDi6PaSj7BXFbJ+Uv+/fRt6NDkArvCzLazFPAbgKHl1FRx+yoW3T2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsmUFusRMKmPKQaW9Hp6mwrYNcTJPR6Rinipb7uajYA=;
 b=kAGCzpkxQWMS7w4hwy/lmZ2M/XCyTDzRFPGKdP0/qzhNVtXfqUa9qAFNtp1wAsWrbNZIHJ5vRw7f8D2ma+59LY6gFccRaFZml5edGrqTL7jto2cztDuPjTx7yI39vll9MaJMUYrtneWAMdw6dxYPwUGBfO/d0nWmVUTU/PupzW0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB9590.eurprd08.prod.outlook.com (2603:10a6:102:2e8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Wed, 20 Dec
 2023 14:47:22 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7091.034; Wed, 20 Dec 2023
 14:47:22 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "thomas.perrot@bootlin.com" <thomas.perrot@bootlin.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-networking][PATCH v2] networkmanager: fix some missing
 pkgconfig
Thread-Topic: [oe] [meta-networking][PATCH v2] networkmanager: fix some
 missing pkgconfig
Thread-Index: AQHaM08ULuzzCbI62UCRgk+31kh0p7CyQDqA
Date: Wed, 20 Dec 2023 14:47:22 +0000
Message-ID: <908FC099-C100-423D-B82D-3CCD25254A6C@arm.com>
References: <20231220141550.1777282-1-thomas.perrot@bootlin.com>
In-Reply-To: <20231220141550.1777282-1-thomas.perrot@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB9590:EE_|AMS0EPF000001A8:EE_|GV1PR08MB10672:EE_
X-MS-Office365-Filtering-Correlation-Id: 375fd341-9e12-487c-abef-08dc016a981a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Otv3Mg3oxixxlAWz7nXkTZwiie5UKcRp/4UXwJ2HCByzXQq4Z8jir8hEkxdUbD4YGPlAfzSpRVLdwwQ4hTkM6JVXxV2z3HHixy2+hoFzgJxjhO7hPSlmTKOI5utYBDS3m45csaCRmEG3aMhFbqdveJbiWq2c0oe9m8ax5ooyEoXpTz4eafqXkm1jqGIxXfefBPq5dDOmTY5GrFq75Al6NbLqm8qnwoomje/cSdk8F15n1e/IO1mifCy/I7AL5imkDwIQTfobP7bvrKhxBpzgpDXDNWIxyNG98ZGToP/M3ifmr5Fg5fZ9Cuiv0WzL+Dq6uyxWf1tESwmQsKuq3fhaEY/xdASKGm6zHxfpQo4FP/JV8Lq91LIFo4ZyoN9d+dKMQSV15iPaFGu87i/THEMXnV+4rn1EsugPajIkGaYpuOAMb2dkZHDQcTls7UGUmxshS9ObGO4axz7vsguJMhHGwS1kkbRge5IIinA39qdxy8GMVXzqxdw/OH+UUK2NXyGEiPBEaPq1wRJ1e2ExnpTGzLoU3DdydTNDdVgoRI0ncyvoFF01QjznVO3D9E9qEoGgFcliHkJn+Ml/qdcsqzBO+1/v6UVc0znjmj1bAa5dnKwpIJWcS489+pc9/ZqqgR2S2j38J/dz4WXtEQltd19XiQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(136003)(346002)(39860400002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(33656002)(36756003)(38070700009)(26005)(2906002)(2616005)(4744005)(6506007)(8676002)(64756008)(53546011)(91956017)(66446008)(4326008)(6512007)(6916009)(76116006)(66476007)(66556008)(478600001)(316002)(66946007)(8936002)(71200400001)(38100700002)(6486002)(966005)(5660300002)(41300700001)(86362001)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F56C3BC2DE7723499656DEF81C661844@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9590
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	659b2e79-e030-4a60-c1ff-08dc016a92fa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BsGf13jk4EkpPbBy5C66S6Oxe/YRcjIuN56kDv0XhRLJBzI2Z1gof8VX9L98wSjVBAgMV0EpsHAKH0ERLiEuibdPx6B0NBcq26qzHnWm3Nd87chS6sguDYe+abRlG15mAvk3TFEOSpCfA6S0f8+Fb+ciDHrypfltXkUAg4C2gX4P0G/xtomflTIl30d1QQCpNOKfwv0xYIFaAZ6aWVP57zpqaijmjjOdX+ZlUplLWpuHohHbhx15W2IfHLRgMuHYXTXj1iRQhSLJ/svsgc3O89Appt5MLEIIJXTBC+XQkNIS/1TcoRpEfRITD6GoGBJwUHFu+yRLGb7FB2fXEwKgReogO1nysKpokrLBaPxurMCz/OjKLlOy0rDxj4aO3PaB/1CO7Fd08CJfnxxJPtlNuaj8iuN2mO8xag+dUt2t7kyDZKul3UC16TmXWpS0sn0Akg7fHtVG3o/LEJy+jmInqtPfAnct2DXcZHkmwEwZh5dwu9zYJY5GLSau2xDFMVfmrvx0Qpf2h97NVBf+vhLQ26RnjDGpuwgPlZo5hVtzd2A7pLWDSN7Jcmk2KDaQOZa4Bhl9DoZdmAMpeME27aBIblp1RmQsxSWgOLfhWEgMoLNRNOxKQaXXx2TsRZXiaCLWmfLle1FFCXVYt2AjBiDEO5BucuC0C8A3KhJcXQgm8nB3PkauJaFaLfk59GlbsNl45SzX0OnwZGYm6Rk+5TW5VM7puXk74GOWMVRa6oN431g=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(82310400011)(186009)(46966006)(36840700001)(40470700004)(6862004)(8676002)(8936002)(47076005)(4326008)(4744005)(36756003)(82740400003)(81166007)(86362001)(41300700001)(33656002)(2906002)(356005)(36860700001)(5660300002)(26005)(2616005)(966005)(6486002)(53546011)(40480700001)(6512007)(478600001)(40460700003)(70586007)(6506007)(70206006)(316002)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 14:47:30.9188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 375fd341-9e12-487c-abef-08dc016a981a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10672
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 14:47:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107661

T24gMjAgRGVjIDIwMjMsIGF0IDE0OjE1LCBUaG9tYXMgUGVycm90IHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDx0aG9tYXMucGVycm90PWJvb3RsaW4uY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiANCj4gK1JERVBFTkRTOiR7UE59LW5tdHVpICs9ICIke1BOfS1kYWVtb24g
JHtAYmIudXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCdubXR1aScsJ2xpYm5ld3QnLCcn
LGQpfeKAnQ0KDQpNeSBwb2ludCBzdGlsbCByZW1haW5zOiBpdCBsb29rcyBsaWtlIG5tdHVpIGxp
bmtzIHRvIGxpYm5ld3QgZGlyZWN0bHkgYW5kIGRvZXNu4oCZdCBkbG9wZW4sIHNvIHdoeSBpcyB0
aGlzIG5lZWRlZD8NCg0KaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL05ldHdvcmtNYW5h
Z2VyL05ldHdvcmtNYW5hZ2VyLy0vYmxvYi9tYWluL3NyYy9saWJubXQtbmV3dC9tZXNvbi5idWls
ZD9yZWZfdHlwZT1oZWFkcyNMMjkNCg0KUm9zcw0KDQo=

