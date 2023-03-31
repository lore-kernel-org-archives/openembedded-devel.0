Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F097DC76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 13:11:28 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.52])
 by mx.groups.io with SMTP id smtpd.web10.54239.1680268282424286120
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Mar 2023 06:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=G0xI6FCh;
 spf=pass (domain: arm.com, ip: 40.107.22.52, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37OiE6vaU07CVjOXlFruY3LPRGeRWdhiJ0TUVDKu6qs=;
 b=G0xI6FChyIKQ39b6tKV6yuEg4IPCpJh2hkkFgvXu7/UDBfIaf1L9Lt2fDNRDe0+PwT0YxoRppcK9UZnOxcxS3ZySY+r8Yx18BJMKFcTSjGCXpSDLMLmUXZuRHMkPgowICerBQsjxl2OYE3vACz8pu/WSjQyyVjQ4KHcREU2xkbw=
Received: from AS9PR05CA0138.eurprd05.prod.outlook.com (2603:10a6:20b:497::22)
 by AS4PR08MB7454.eurprd08.prod.outlook.com (2603:10a6:20b:4e5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Fri, 31 Mar
 2023 13:11:08 +0000
Received: from AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:497:cafe::76) by AS9PR05CA0138.outlook.office365.com
 (2603:10a6:20b:497::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22 via Frontend
 Transport; Fri, 31 Mar 2023 13:11:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT053.mail.protection.outlook.com (100.127.140.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.15 via Frontend Transport; Fri, 31 Mar 2023 13:11:07 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136"); Fri, 31 Mar 2023 13:11:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 51288cff51f3a93a
X-CR-MTA-TID: 64aa7808
Received: from 491d098210a3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CE952EFD-2EB5-4E47-B2E7-6AB634EF1788.1;
	Fri, 31 Mar 2023 13:11:01 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 491d098210a3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 31 Mar 2023 13:11:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gs93dECaUVyParo/uTzRrhqT0xsGkSouxMl/WuMbe2C5zCocpKCch0VwKo7RPJIsIthv3EbhbtitTGUK0smByiOPOcc17/gqUum7Xk0WJDCEFhxkPLzbt6UxpLcIydhzLFfZPTDHOV2i3c9C62FehDm7tz+Wunwzfpi8JBLS+U/bDxEXyhPZnH5uS0wg70N85ZeivOrxmi8/LsTZE5/scjz8KF+/uQkfsAoN1SIZp1fIJGI282nLQUNIG1vffRiEtA0fJvzdyE1axycNRN42EYfsAhb6OsdjphrG8qzqk83yNLsmq+w9Ohf8eCjPWwLhtP0yH2bd6oYTv3xt4gvMeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37OiE6vaU07CVjOXlFruY3LPRGeRWdhiJ0TUVDKu6qs=;
 b=L0BWDIP6tdAP+cGPsSGqzt/Mha3IyIWr7QkO5+6gtCKocyJux4/9iLi2KEtOUfgArh8ItW8vQBLBGZhslD85qLDPfZjlHxUmq0TrfIVGPxt8osY55QtmLIzZLr3x3DaX+I0QlwEFgpfgsB3ABXfibWB4BPQRwZYdwe6EvksKoRMo48CEdRU6xuD5gUrP0LwUq3/2evwq+IPg8qq1xBVcgppd+sZhN6rmQXJsJR9yaZfsm1hOzgLnGmhio9NxI2jjFlEotuBH8CWcdJKp3QD2YWK3ANkjmg6WKOvTJ48u++rF9rNS0XF5pgP24atTyyo0PHnOcv5LUAjeJ20ngwQDpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37OiE6vaU07CVjOXlFruY3LPRGeRWdhiJ0TUVDKu6qs=;
 b=G0xI6FChyIKQ39b6tKV6yuEg4IPCpJh2hkkFgvXu7/UDBfIaf1L9Lt2fDNRDe0+PwT0YxoRppcK9UZnOxcxS3ZySY+r8Yx18BJMKFcTSjGCXpSDLMLmUXZuRHMkPgowICerBQsjxl2OYE3vACz8pu/WSjQyyVjQ4KHcREU2xkbw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB7502.eurprd08.prod.outlook.com (2603:10a6:20b:4e6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.23; Fri, 31 Mar
 2023 13:10:59 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ba7:a556:599f:4369]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ba7:a556:599f:4369%5]) with mapi id 15.20.6222.035; Fri, 31 Mar 2023
 13:10:59 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Khem Raj <raj.khem@gmail.com>, openembeded-devel
	<openembedded-devel@lists.openembedded.org>, Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
Subject: Re: [oe] [PATCH] reboot-mode: put the build artifacts in ${B}
Thread-Topic: [oe] [PATCH] reboot-mode: put the build artifacts in ${B}
Thread-Index: AQHZY8zSaSwjO4BaBEK0zdny5sEDDK8U3NEA
Date: Fri, 31 Mar 2023 13:10:59 +0000
Message-ID: <4E0B1FB2-9294-4E87-B055-A048B8A8151A@arm.com>
References: <20230331123153.292738-1-brgl@bgdev.pl>
In-Reply-To: <20230331123153.292738-1-brgl@bgdev.pl>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS4PR08MB7502:EE_|AM7EUR03FT053:EE_|AS4PR08MB7454:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d1efaac-1ba2-43b6-1033-08db31e96426
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 4tsX3NMeq+TDsjYkwyKMtbBciUniHJ7QzL+0nUIdSIEsPg9yEdqA5jgbV5CBq92HYY0VgyzEEaOS6DH1dxqxlMtsCzNUmBRRTqvNDNPfdVikkxOQhs1LxbP62NdJuHYbyseSJxFdVpqhr7jFqH60tCDqiTnFScXqQElrQc7OBqyzu3FQgZj5+7CKHOMmU0ep+aTMWfalozx8GNKK5txoxjRu8HvuIC6iRGnTHMvXNy4q3ssERW/XEH9KS9J3tPVw53UTdhXvQ0NwjDtdjneLn14DamKr3obZ+JltkZ7e3iUdoTd3kYdZykcQIbGZdiaFc2rIWdtsFtn60cyk0/ACt4jBp7uEY1rfEbr3a6caapbvA9l+avb+Kx5xaNJQHR6O1Jk7CIhoERFevcn9p4iTJw36CXZAMbnTYQ5Otea2tLgWbGiyfZuqQ9lbIb/HFH0aw/8PHWm37D52yRSG26RuVr/NEFMdsfaThLfVmjMubm6bDGhDpAToyfRNOtGHkVaDSdbBU1Bls18PpQ+degSh5SWoSIc10J+UuNgFUyfv1AGnjKdfDMJ9Z4zYIfMvjejxYu1fuE42h99qmMoRDhI0nrpl4PASDH+DHxWN22Q3jqy+JEdIeF8NXFyxFtUhoNZAi/rugn6t/c2E/vrORSFeQ/iEIjEHNC6stlh9a4IoSkQ8aK0WUzF9+en5T39xhvgH
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(451199021)(4744005)(5660300002)(2616005)(53546011)(26005)(6506007)(122000001)(186003)(6512007)(38100700002)(38070700005)(86362001)(8936002)(41300700001)(36756003)(71200400001)(33656002)(478600001)(54906003)(6486002)(66476007)(6916009)(8676002)(66446008)(66556008)(4326008)(76116006)(66946007)(64756008)(316002)(91956017)(2906002)(228453006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <01884D94B3C03E4F8578684E46000C08@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7502
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9a76ee6e-59e9-40f8-5668-08db31e95ed2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	T/mGPF0iN3a0PV7IUuiNcAKnjOsBvi42GWvqxJ1QPmt+X0KWO3vvkqigoHlxaZaA8US0hKW/6o2lvTwB79mNV8qQ1OMhDb8KtKOgf8CJHIh9cV+fWEQW1znyUE7yAKYfXqM/AwE3f+6Z93/8XAX6d22iiAG7rA0/fuc043scAN55EluB7HbHcIy1idW9pIjLwqPSYf2DQwisx9QLXdkMZeJSrSYvR9eRwk3g1lUkUbja0wvmXlmmwpG9rhWQcLQ1i4TMFWyy95hdVV0afO4KfI0/I4Pd/pS0mpDLgT/FtrPPHCYBTkPwCTkb7uZ3GqGJADQk6Yo917N0gdxgH/NMfe8hBc3vIXL0RDgsSx6ttX6nnoafB8SboAyufjOEVCarHVqLMYQjW+pF2pSfhJcoSzpmAQbi6d2lzTvq79l2TjmYi9Qb13/gud0sasY9NMyz65vvQK9GFgPirYnTk4/rLv+foKHx1lFxZqBhawn25YOcFSzEhDC3YAREC60EWNzSvLhkfezE/IwYXXcIXpurrbI62Sh/EENd3dDzf7QBv+6sfWRYaKuB3gAiwEXywt6981eFPnh6H3Eggu99CEfrQevBw5PNOLTZQSvdQ/yB/vp43TAQDQbkOGklWL9+0FGZ2MmYfOnYBVldFULzd1VBAHQlvDTSTKtpla2nsqjWMyVMemakFxC/2h+gZgoSOZK83cDK7u4afU4maOzhOQ+QniHCREQKxKYvDd6GNmkTf3c=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199021)(40470700004)(36840700001)(46966006)(47076005)(2616005)(107886003)(336012)(6486002)(53546011)(36860700001)(186003)(6512007)(316002)(26005)(478600001)(6506007)(54906003)(2906002)(82310400005)(40460700003)(4744005)(81166007)(8936002)(6862004)(356005)(33656002)(40480700001)(70586007)(70206006)(41300700001)(82740400003)(8676002)(4326008)(36756003)(86362001)(5660300002)(228453006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 13:11:07.9789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1efaac-1ba2-43b6-1033-08db31e96426
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7454
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 13:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101855

T24gMzEgTWFyIDIwMjMsIGF0IDEzOjMxLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHZpYSBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnIDxicmdsPWJnZGV2LnBsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiANCj4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3Nr
aUBsaW5hcm8ub3JnPg0KPiANCj4gV2Ugc2hvdWxkIG91dHB1dCB0aGUgY29tcGlsZWQgZXhlY3V0
YWJsZXMgaW50byAke0J9IGFuZCBpbnN0YWxsIHRoZW0NCj4gZnJvbSBpdCBhcyB3ZWxsLiBDdXJy
ZW50bHkgd2UgcHV0IHRoZSBidWlsZCBvYmplY3RzIGluIHRoZSBzb3VyY2UNCj4gZGlyZWN0b3J5
LiBXaGlsZSBhdCBpdDogZG9uJ3QgYXNzdW1lIHdlJ3JlIGFscmVhZHkgaW4gdGhlIHNvdXJjZQ0K
PiBkaXJlY3RvcnkgYW5kIGluc3RlYWQgcHJlcGVuZCB0aGUgc291cmNlIGZpbGUgd2l0aCAke1N9
Lg0KDQpCeSBkZWZhdWx0IEI9JHtTfSwgc28gdGhpcyBoYXNu4oCZdCBjaGFuZ2VkIGFueXRoaW5n
Lg0KDQpSb3Nz

