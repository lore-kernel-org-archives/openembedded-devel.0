Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C52DC61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 18:08:46 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.61])
 by mx.groups.io with SMTP id smtpd.web11.611.1678903719495029652
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 11:08:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=OBe4R8Kp;
 spf=pass (domain: arm.com, ip: 40.107.21.61, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qD0eRq/AQj2a8BNYUGN6zlk4W9KxtxFqlwYLePLbjVo=;
 b=OBe4R8KpyBKbw8i3Kzrm9ochycdCde8typn23LfwX9xYRWCX7rlNrDQHl7dVe4grIVOH4dIEQ3x6Wchk/cj1KyCgE4Pk2KGiAL42X9gJSg8+ygzyOSKq4yjWAdMLkqV0XCY6QSQ1gJw8xEOHy12PF0kFHbCOGMuDqH26NcToUHo=
Received: from DB9PR06CA0016.eurprd06.prod.outlook.com (2603:10a6:10:1db::21)
 by AS8PR08MB10195.eurprd08.prod.outlook.com (2603:10a6:20b:629::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Wed, 15 Mar
 2023 18:08:35 +0000
Received: from DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::86) by DB9PR06CA0016.outlook.office365.com
 (2603:10a6:10:1db::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29 via Frontend
 Transport; Wed, 15 Mar 2023 18:08:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT064.mail.protection.outlook.com (100.127.143.3) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.16 via Frontend Transport; Wed, 15 Mar 2023 18:08:35 +0000
Received: ("Tessian outbound cfb430c87a1e:v135"); Wed, 15 Mar 2023 18:08:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fae58e1e78045e63
X-CR-MTA-TID: 64aa7808
Received: from 473ff79848ec.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C8E3C7D8-F76F-4329-8F74-9EF3DE27B98D.1;
	Wed, 15 Mar 2023 18:08:28 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 473ff79848ec.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 15 Mar 2023 18:08:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0GeRE79mJv5qFYwvj1uhfDv+1zVec/07BGvgIl8ob+g6G/p9kT56Q6T4+IwaWwXKA1KU00Yh/HksZTFQ2fxbIbrbuhUJBMwAkqjr69QnHDenert/kjvsWW9sFeLVpzupefy6ekpgfGy1l1uNnYgCgMn816HhNYv1Cj9Wd8+wI78/hKP2tdVCHpjnaQAZwsTMovesJ8WFxAPJflv9aArghV4HodaTcHmtIHoenm83qmQt4Ry01AUhcf53Zxme7NnYCr60Ck2YZTidlYNDG6enFFkAYHbbEU7D8cxo2fAKjKViU/HXqxII2k7qbowO1kcSLRM2TNIBDTXm/eNl5KE+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qD0eRq/AQj2a8BNYUGN6zlk4W9KxtxFqlwYLePLbjVo=;
 b=O7GQ1VPZWnYmeZ292+rtQrxbPjEzCCCgIqOKHxHmLy57TXGNfBPS8rYFbz79N02UxRt3JiHoPXBeZkst/RqzoLW7s1SBTlV2rBkKY4t0OktpwLLmqpG6Fta7qNDeG5lTpKm30F2S0nLRzQXVaDYV6EmYam7fKZoTiduNjDj+TuEji41AwoTip+V6zqXmoGFPx2PrNCdta6BGYEjKSI0PI9j/g5Rw5U0/jCSuOwKffw7RRachrb2k2QrCeS7SmplBW/z8pJYR4DMI+46mn/aVdD8fwQxgfRaRjOf50cOlxBoeYoNSYRBbF4X0Zw/jOK29cwN5Q5bi7mG9dYV/2+QRjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qD0eRq/AQj2a8BNYUGN6zlk4W9KxtxFqlwYLePLbjVo=;
 b=OBe4R8KpyBKbw8i3Kzrm9ochycdCde8typn23LfwX9xYRWCX7rlNrDQHl7dVe4grIVOH4dIEQ3x6Wchk/cj1KyCgE4Pk2KGiAL42X9gJSg8+ygzyOSKq4yjWAdMLkqV0XCY6QSQ1gJw8xEOHy12PF0kFHbCOGMuDqH26NcToUHo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9524.eurprd08.prod.outlook.com (2603:10a6:20b:60c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.30; Wed, 15 Mar
 2023 18:08:27 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6178.024; Wed, 15 Mar 2023
 18:08:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: =?utf-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH 1/4]
 python_setuptools_build_meta_mesonpy.bbclass: New class
Thread-Topic: [oe] [meta-python][PATCH 1/4]
 python_setuptools_build_meta_mesonpy.bbclass: New class
Thread-Index: AQHZVxTO7h3lJuGPbki1zHmLmrgMya77yf6AgAAZcwCAAEChgA==
Date: Wed, 15 Mar 2023 18:08:27 +0000
Message-ID: <114986A0-9EE9-4739-8E16-A5F43607A52C@arm.com>
References: <20230315080429.2722555-1-zboszor@gmail.com>
 <25DB9C8C-6830-4DBB-9B27-4FB04C393F38@arm.com>
 <ef5796b4-41a9-1eb4-fa5b-8a30d12c509e@gmail.com>
In-Reply-To: <ef5796b4-41a9-1eb4-fa5b-8a30d12c509e@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9524:EE_|DBAEUR03FT064:EE_|AS8PR08MB10195:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d5124f6-2651-404d-e448-08db25804ba3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Zs0kpEVBjqgLgBYgeuTY4TcFiVZpLsWpZm2irUkdjMtGVMMwlbeIpxu4huCMHLZXpheUx8GeObd8Th0oErTiNgDSa+VqdeRkhLgBZwZ9BogiuQiddLiFOMbdI4/6AuAN+paR7p0dTwXh5qdbUsqLBCS+ybh/ouTl7Ieos23fBWToV9WwrgYtXOgwFyK6nizGl1r1NDJfJh3byiZ/QKOL4r8/E/Q8kCjXDxAdp3iRZl92Ii8pr9m3v+DFX+NmlzLS5o3DS/eZzzCm7pxrzbKVxDjCIhKC7unJSCPUDsJUgiFdMuwLmw00MoxXFDufaUr5YgHtvioFUgZyWv2/vZcss99WAp3uNSPWITQORtDUeXgTA1cJW7b9DRqPd36vNtVUxkjviTlYBtX/TmUQfArL/quqb10Eapb/KeEDtDkA6yfHFFz0qZvJB5oJLzFeMlQZq99WenpejBy9jRqS0wc3Cv7W840+wbYVpSXOi4X33rwAmtu0N1dtJRhzTFj1vrCX58NlZnQLS6XY8UyFJaZUxPfQ/SutAwhNrU/ealb++yjWi5AAYS+HPSzEwBgr8UFRqFUiRpUWb46yAhFzGGABLjENdWd3QjPXJmWAxxj5PUsHMNKM0RMjJsWlBpr9xZdCyACXdplMzIOliiBtX2aoMVDAUrhehUDq16mITZelokddloNW6/oY3Ko3ST67ICMq4f8Tq9u5wlPCBsgZgL5B6tJ+wCj82LqzdohV8HGbaHg=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(451199018)(8936002)(6916009)(8676002)(5660300002)(41300700001)(4326008)(33656002)(86362001)(36756003)(38070700005)(38100700002)(122000001)(2906002)(478600001)(83380400001)(53546011)(6506007)(6512007)(71200400001)(966005)(6486002)(66574015)(66476007)(66446008)(64756008)(66556008)(66946007)(76116006)(91956017)(26005)(316002)(186003)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1DBC6537E42EE040A55F61EFBEC92ACF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9524
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a9cc7802-8d3e-40d3-2e60-08db258046a1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	D7EJaGvVwp5e0Nn9aqTw/v4wK5Gd5ViIQ0NaP+GlCobD7ZVmG/3xKl9dY9DmObECws9feEUnYdUojOPOp67kSWgJ7YVbDfRJneC86pjhrbhfU4LH4yRg8ycDDbviZZB9m3Hn/Dp6iL/hF2n4UMHvwsBCRdZMJNVl0iKJ8JU0v0NRLocmpqS+7bWRZKB/FRqBVpz9E4GSp8bs0IEkRTghTF7wl4pv1M1RJtJrdZ4GiMDIXwpBeSAg4EUvq6C7b2tjTjCZOoQlS1zAjkbuYl17ii8yZn+tCbAg+QQLWVJ+gv7fp/nUIM5hPTFx1ZRPA//bpT9bmRHJ2p49KLpZD6billKLAkSb9eG10bKn2Q8dVn9L6bg8NEpRZCYMXcrzi0RQ6reCyRWUaVykHXHO59lgefmM1Eo85HPOAnquyyVklrzi0EABJbxNE1RScGqy/D32j1eSeG58zvr0OQcCP2Ul1yu4FplkM0kB1FJve5/VcBwxQcPO1DCB54ibLdafNwyptsI/ZjGzvq9SjXTcWJ+CHWTeXJoj0FCRr1P4Vos+SiPModcEQ4doecW4tCBCaswDHpynPn8Ima4994fvFrCEUWrfO12ypUOYqp85YdIvWlMwxbhxtZPO5YS1hawcu2nq6J5RWz79kzvRXUz2AyLBY41i8IGUE3UsvS7wW5ABTjxIq9ATOr1tsKDoEDUWI9CH
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199018)(36840700001)(40470700004)(46966006)(966005)(6486002)(53546011)(6506007)(2906002)(83380400001)(26005)(47076005)(36756003)(41300700001)(8936002)(40460700003)(5660300002)(186003)(86362001)(6512007)(8676002)(33656002)(356005)(40480700001)(2616005)(6862004)(336012)(70206006)(66574015)(70586007)(4326008)(478600001)(316002)(82740400003)(82310400005)(81166007)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 18:08:35.8130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d5124f6-2651-404d-e448-08db25804ba3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10195
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 18:08:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101566

T24gMTUgTWFyIDIwMjMsIGF0IDE0OjE2LCBCw7ZzesO2cm3DqW55aSBab2x0w6FuIDx6Ym9zem9y
QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiAyMDIzLiAwMy4gMTUuIDEzOjQ2IGtlbHRlesOpc3Nl
bCwgUm9zcyBCdXJ0b24gw61ydGE6DQo+PiBPbiAxNSBNYXIgMjAyMywgYXQgMDg6MDQsIFpvbHRh
biBCb3N6b3JtZW55aSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8emJvc3pvcj1nbWFpbC5j
b21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+Pj4gU29tZSBweXRob24gbW9kdWxl
cyAoZS5nLiBTY2lQeSwgc2Npa2l0LWltYWdlKSB1c2UgbWVzb24tcHl0aG9uDQo+Pj4gKGEuay5h
LiBtZXNvbnB5KSBpbiBweXByb2plY3QudG9tbDoNCj4+PiANCj4+PiAgICBbYnVpbGQtc3lzdGVt
XQ0KPj4+ICAgIGJ1aWxkLWJhY2tlbmQgPSAnbWVzb25weScNCj4+PiANCj4+PiBUaGlzIGNsYXNz
LCB0b2dldGhlciB3aXRoIHB5dGhvbjMtbWVzb24tcHl0aG9uIGFuZCBpdHMgZGVwZW5kZW5jaWVz
DQo+Pj4gd2lsbCBhbGxvdyBidWlsZGluZyBzdWNoIG1vZHVsZXMuDQo+PiBTbyB0aGUgcGVwNTE3
IGJ1aWxkIHRoaW5nIHByb3ZpZGVzIGRlcGVuZGVuY2llcyAod2hpY2ggd2UgaWdub3JlKSwNCj4g
DQo+IERvZXMgdGhpcyBtZWFuIHJlY2lwZXMgdXNpbmcgdGhpcyBjbGFzcyB3b3VsZCBzcGVjaWZ5
IHRoZQ0KPiBidWlsZCBkZXBlbmRlbmNpZXMgdGhlbXNlbHZlcyBpbnN0ZWFkIG9mIGhhdmluZyB0
aGVtDQo+IGJyb3VnaHQgaW4gdmlhIHRoZSBjbGFzcz8NCg0KWWVzLiBUaGF04oCZcyBleHBsaWNp
dCBhbmQgaW50ZW50aW9uYWxseSB0aGUgZGVzaXJlZCBiZWhhdmlvdXIuICBEZXBlbmRlbmNpZXMg
YXJlIGRlY2xhcmVkIGluIHRoZSByZWNpcGUuDQoNCj4+IGJ1aWxkIGlzb2xhdGlvbiAod2hpY2gg
d2UgZGlzYWJsZSksIGFuZCBhdXRvbWF0aWMgdXNlIG9mIHRoZSByaWdodCB0b29saW5nICh3aGlj
aCB3ZSBoYXZlIHRvIHNwZWNpZnkgbWFudWFsbHkpLg0KPiANCj4gTm90IHN1cmUgd2hhdCB0aGlz
IG1lYW5zLCBwbGVhc2UgZWxhYm9yYXRlLg0KDQpUaGUgcHl0aG9uIOKAmGJ1aWxk4oCZIHRvb2wg
Y2FuIGRvIGJ1aWxkcyBpbnNpZGUgYSBtaW5pbWFsIHZpcnR1YWwgZW52aXJvbm1lbnQuIFdlIGRl
bGliZXJhdGVseSBkb27igJl0IGRvIHRoaXM6IGRlcGVuZGVuY2llcyBhcmUgZXhwZWN0ZWQgdG8g
YmUgaW4gdGhlIHN5c3Jvb3QgdmlhIERFUEVORFMsIGFuZCB0aGV5IHNob3VsZCBiZSB1c2VkLiBi
dWlsZCB3b27igJl0IGJlIGFibGUgdG8gZmV0Y2ggYW55dGhpbmcgZWxzZSBkdXJpbmcgZG9fY29t
cGlsZSBhbnl3YXksIGFzIHRoZSBuZXR3b3JrIGlzIGRpc2FibGVkLg0KDQpidWlsZCBhbHNvIHJl
YWRzIHRoZSBweXByb2plY3QudG9tbCB0byBkZXRlcm1pbmUgd2hhdCBidWlsZCB0b29sIHRvIHVz
ZS4gIEFzIHdlIG5lZWQgZGVwZW5kZW5jaWVzIHVwIGZyb250IHRoaXMgaXNu4oCZdCBwb3NzaWJs
ZS4NCg0KPiBQbGVhc2UgaW5zdHJ1Y3QgbWUgd2hhdCBjbGVhbiB1cCBpbiB0aGlzIGNsYXNzIHRv
IGdldCB0aGlzIGFjY2VwdGlibGUuDQo+IA0KPiBtZXRhLXNjaXB5IGhhcyBhIHF1aXRlIG9sZCBT
Y2lQeSB2ZXJzaW9uIGFuZCB0aGUgbGF0ZXN0IHZlcnNpb24gdXNlcyB0aGlzIHRoaW5nLg0KPiBJ
IGhhdmUgYSB3b3JraW5nIHNjaWtpdC1pbWFnZSAwLjIwLjAgcmVjaXBlIGFsc28gdXNpbmcgdGhp
cy4NCj4gDQo+PiBTbyB3aGF0IGRvZXMgdGhlIG1lc29uLXB5dGhvbiBpbnRlZ3JhdGlvbiBicmlu
Zz8gIENhbiB3ZSBqdXN0IHJ1biBtZXNvbiBkaXJlY3RseT8NCj4gDQo+IFVuZm9ydHVuYXRlbHks
IG5vLg0KPiANCj4gbWVzb24gaXRzZWxmIGRvZXMgbm90IHByb3ZpZGUgYSBQRVA1MTcgY29tcGxp
YW50IGJ1aWxkIGJhY2tlbmQuDQo+IG1lc29uLXB5dGhvbiAobWVzb25weSwgaHR0cHM6Ly9weXBp
Lm9yZy9wcm9qZWN0L21lc29uLXB5dGhvbi8pIGRvZXMgdGhhdCBhcyBhIHdyYXBwZXIgb3ZlciBt
ZXNvbi4NCg0KUmlnaHQsIGJ1dCBpZiB3ZeKAmXJlIGp1c3QgY2FsbGluZyBtZXNvbiB0aGF0IGlz
buKAmXQgcmVsZXZhbnQuDQoNCj4gSSB0cmllZCBqdXN0IHVzaW5nIG1lc29uLCBidXQgd2hpbGUg
aXQgdGhlIC5zbyBwYXJ0cyB3ZXJlIGJ1aWx0LA0KPiBub25lIG9mIHRoZSAucHkgZmlsZXMgd2Vy
ZSBwcm9wZXJseSBvd25lZCBhbmQgbm8gZWdnIG1ldGFkYXRhDQo+IHdhcyBnZW5lcmF0ZWQuIFdo
aWxlIHRoZSBmaXJzdCBpc3N1ZSBpcyBmaXhhYmxlIGluIHRoZSByZWNpcGUsDQo+IHRoZSBzZWNv
bmQgaXNu4oCZdC4NCg0KU28gdGhlIHBvaW50IG9mIG1lc29uLXB5dGhvbiBpcyB0byB3cml0ZSB0
aGUgcGFja2FnZSBtZXRhZGF0YSwgcmlnaHQuDQoNCkl0IHNlZW1zIHZlcnkgb3ZlcmNvbXBsaWNh
dGVkIGZvciBzdWNoIGEgc2ltcGxlIGpvYiwgYnV0IGZpbmUuDQoNCknigJlsbCBnaXZlIHRoaXMg
YW5vdGhlciByZXZpZXcgdG9tb3Jyb3csIGJ1dCBmeWkgeW91IGNhbiByZW1vdmUgdGhlIHNldHVw
dG9vbHMgZGVwZW5kZW5jeS4NCg0KUm9zcw==

