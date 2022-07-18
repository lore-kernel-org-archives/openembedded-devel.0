Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A11C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 09:33:41 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.45])
 by mx.groups.io with SMTP id smtpd.web11.25049.1658136819839509281
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 02:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=8c50f+8s;
 spf=pass (domain: arm.com, ip: 40.107.22.45, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Sf14yiLixnRQxWUhxioXokWBZSvf2DSBewBIKQaQTC/yPwo7T89kU28Tnw5CYN/dIRBLRMYQHJAzGth8LvbwQ6pJfHaPhRVrMWOVB6X3j9ja4KqHXNER8NAQCbIuX++hrZNeobFS6DIcvNh74zicwc3VhY3Gq69ebMZzX9pUghtTskuiuqvKgmDbdZ3GDC20YWqItLfDnMlBylMbJRV1UHU9CBQ5cOfL7hty0T7F1iExui+7pgfsCXp8pxWz8Iyee/XPOpUOU8MqJng62QtoygmvgW9es+KwEZaacHjdrR+1eHKLIuMaJPQi7ngIlOugjP3MenJU7peTd7WOCuSe7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08OxIbHBrVivhWMwryLdeOte10JnJ0tPlo6FGYPgBhc=;
 b=BlILQKlikJaTp71UBqTloYni8gH0Rn3uEIAwiEIo5IDFPZ4ueu4akdsgfv17S/4qpOQW11e045OC/NUnCoFQaBLXxsXIux5Eupo9b8fJOdv6Vv5YHUcVj8Tvhc7IrYai1aBXnWiOB/kuhAbJy7zsLBw5Y5vcLudY8VDPz6cW2v6Q86aOCu5xXPIYTtOt2chj2rMFpi8XBLPLFxAwigjYaqcAiPzxpiPOerQAffJih4qxQm7kY3B1/syioFVMSCCfbCmSy0kVVx0eW64LdCGTEBnyE/0xz8tn4FncIIZfjHz+1VBQc+3pjHubw0HNAy2KNVtHR3+Tlrd+/2szE1uRnw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08OxIbHBrVivhWMwryLdeOte10JnJ0tPlo6FGYPgBhc=;
 b=8c50f+8suSGzDZVIdorOArPDZmlce59NiIG7ErgNgKorflOw4U1i4ftesBnLOchWq7eH6a5XpZueHbmWjH5tYxVxt0eiWxqKLhRd6upd/Q7My5vFme/SDouQ1KDHRFJCzSKe+83LguVBJHvpKFsP6yZQPcTkanAm0woiF+SOsYc=
Received: from AS9PR06CA0619.eurprd06.prod.outlook.com (2603:10a6:20b:46e::33)
 by VI1PR0802MB2304.eurprd08.prod.outlook.com (2603:10a6:800:9f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 09:33:36 +0000
Received: from AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46e:cafe::1d) by AS9PR06CA0619.outlook.office365.com
 (2603:10a6:20b:46e::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17 via Frontend
 Transport; Mon, 18 Jul 2022 09:33:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT039.mail.protection.outlook.com (10.152.17.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Mon, 18 Jul 2022 09:33:35 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Mon, 18 Jul 2022 09:33:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7d32c7a5337bb076
X-CR-MTA-TID: 64aa7808
Received: from 097f64424ef6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A8EF3922-FC37-4E7E-BAA9-FE5407238637.1;
	Mon, 18 Jul 2022 09:33:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 097f64424ef6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 18 Jul 2022 09:33:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+79mlOV3zVvqLPm3CNzuJY4ktWzXrSDij+RtKqFjvDfrY7ZLqBqsBiFO8M57tza3toKzUEwyuKhBKsX8tGqdm4hTLJcwkMGMiQDBj8SP0WmFDCF4wp/uFNKn1qG57XAEFpgJZXLfzjI8VNYcIqBnu+mZQWHYGzqfkq2MPgJkDYVbrXN5Ie69X5OCIKAcIchP85fcmIhK1aFfY/7harnvX84L2TE6yYlmiiBCP87vXLda9ruxcw+WlxiEMGRwcb+B/JVBR0vNcIfDm6JsDtg+zWhcgOJcUbazsUuNNW+8FpIlMccwboKuGePg56i2r9+nBK1JYKYY+qOqtib/4hyfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08OxIbHBrVivhWMwryLdeOte10JnJ0tPlo6FGYPgBhc=;
 b=NXQPX8lpcvTDJfhJmegFHOOuVsR0/+jL4CsfosDAmCuzDgyZipHFkz8IiwoLsD4oB9t9hH81wnwjPJfLmyIh99cqJoRa3vvJ/h3SyFP98/BNd57TR3tG01PI+Jf5avWJ96H/KJAdlPxUD0KEM1FvbJdHLS73z/tl0zqoqLV4pPCSVYukuP6dSqBY7y5+Ebi0xQADnSJON6zUP66M3UGHgrsbAZk5UEnAZwXZVvU6Eiy1bZSVy+CXRyvhsW0h2sgO8CgNBNwydW0yPD3peXcAzL8bMpLTDQGQdYcBkE8hH75LBLrZHkI8bCkn+dSvNLhojfpKeWPKwcI0ztaZbkqzww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08OxIbHBrVivhWMwryLdeOte10JnJ0tPlo6FGYPgBhc=;
 b=8c50f+8suSGzDZVIdorOArPDZmlce59NiIG7ErgNgKorflOw4U1i4ftesBnLOchWq7eH6a5XpZueHbmWjH5tYxVxt0eiWxqKLhRd6upd/Q7My5vFme/SDouQ1KDHRFJCzSKe+83LguVBJHvpKFsP6yZQPcTkanAm0woiF+SOsYc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB8PR08MB5100.eurprd08.prod.outlook.com (2603:10a6:10:e8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21; Mon, 18 Jul
 2022 09:33:26 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72%9]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 09:33:26 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH 3/3] python3-pycups: Inherit setuptools3
 instead of python_setuptools_build_meta
Thread-Topic: [oe] [meta-oe][PATCH 3/3] python3-pycups: Inherit setuptools3
 instead of python_setuptools_build_meta
Thread-Index: AQHYmMI50u3lEzO0akuhQsSF9GVvM62D4VeA
Date: Mon, 18 Jul 2022 09:33:26 +0000
Message-ID: <D981D817-D78E-4CEC-A685-7BABEF22530F@arm.com>
References: <20220716031434.4021879-1-raj.khem@gmail.com>
 <20220716031434.4021879-3-raj.khem@gmail.com>
In-Reply-To: <20220716031434.4021879-3-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 733432dd-1299-4534-d8e5-08da68a09666
x-ms-traffictypediagnostic: 
	DB8PR08MB5100:EE_|AM5EUR03FT039:EE_|VI1PR0802MB2304:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 +315pKFfvC27NcgD/qnl1sKaLZmwuENBxvNZuCAZVi1NezvvaTeGrkmEP/QZcu8mh6vDdiOaigMC8HpGv3NIFp+T9NhNna44+dfAJI/wxd9WbSvKMnxZ2jHEQspBliyrHoS7vWCn8fNk/gDbx4Kj7OIkFkIOqTURiyVk1/tUIRB7bBdKdWR7zee0HjjZFbH3SKaxk6WH6PSg5oqMlFDsBIB3JrG1nBgjtRL8Bg3y5RRMtkoX6o/PB6+KtsVXMCQYyzlgLa+qpBETKUIpVZ77wGUHWY5DtFP4l1rsbFHXSMwXtsUt4mO7BPvWIWVbUUFQP1fyC4HGWIjNQFP8C634kYn6vEOLJIgBDn8Ky6lgqU9wJgfuxRvfQY641vvNpL1mfD/+j9SgDsHyzjB7cmvluoGzkditYvCRVh8EpoO0dA2QXoCTRReN4jdwIei1+STtA9/pNjlYIEXjj0i4ndd0AFSbQT5mkIIwJxWnJKjgn+LR491kL3y3iPs9BlHtqoB6JrR8NtqKYqlT+6hvpf4BGPYu/skAVlhasc4eqLyyagbXvNHSqjmistk+QEciOT8zClSmUdKGwpTXJGpVW8/F4RiNbiiyWz9rquvc1cZuhTdhGCah2vwUFiZho5e6MNENa+jiYpaPj0A9giJyjZEuRx+TbE/9CUcdJfk4y+7gwweYHmwvpzicUVMsm44xOinQKkQlTBujmCSMfvphFl44el956mvEUzelOKwtw0LgAKh0k+z1Z3uq5f2JQiLqQ9QRLSw2r8WwMcbKQEzbcfIlf8pqEbyrYHd0ADh6Jf0wucaWStuUymrW3H5SuOp6BRIPpV6rQACJcZNtrbbEmSiyaiI//ITf9eCCpP2rEGVhbD4=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(33656002)(8936002)(86362001)(38100700002)(4326008)(8676002)(66556008)(66476007)(66946007)(66446008)(76116006)(64756008)(91956017)(36756003)(38070700005)(6916009)(53546011)(6506007)(316002)(26005)(83380400001)(4744005)(41300700001)(186003)(2616005)(478600001)(71200400001)(5660300002)(6486002)(2906002)(122000001)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <28DBC105064C7F4D8F138994A55BAFE8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5100
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b15891ac-4597-4ab5-0d4e-08da68a090e4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WjHjcMhQ7Ic7J7MQDHj//FCy1DeqN04VTBg965R+moDMXN5LCmWo9dAj+Ebi2dt6aI4n0TD2wR+cGygUOM/E32GGRAVZabsBhiq40oylquWy0g9EoHt9CMY4ePFYQr/FkQmJFddul0KKiDKQGXpGafR4eJvlXREzCURyjgYIgP1wAfCYugv0PJ10/ToJnCwys2wxrckvRSKWL7vmTvn0HS3VQbcZG8Bork/t4aLvlsFGsLLpKbIHrOxiFXQUfyL+AgqgjXNwhPeE32AAGfXIULSoYkxEr3mx/12c5uQjju7TgsZzB9zx9jB5hgctuiGQodIT95hu49PK8EjdsRwFN4ubqJTvlLaJN4Tn0LGUWP1fWKyoej3v6ChBCPy7RdoU/nqNDkQSsNrosl/Mitv/Ru8Ea/JmOxCOIoFX7Awq5jtAH8MYXz8B4wSXkh8pjcrp4xeOQrMgRzu3uREJcdKZiVnsA5FP6B4C8ao5kVq34nXkqWAowkdMLE90sENuXaCooYPdR13mT7wHTFauvyVlVs/UYxdvQ+FmNxg8CTVvkUvzyKEsGYXJUm5EncMdvsGO5iMxl6iszRxqnCTIBpC9ivtw/W11hNzJYAxvrqa2QhpfaOVSKz9g4KzJ6D/MrqctfpZ9qctbtoOKbUDbPpm2HznHzJThQVdIH9PrgTcSSyVkeyt62WJ14QsIZJLtolcHptlFDxMWJ4cOH5Gp5Fje0J77pqIy2BJn4AHJcP/UY3nflW6QNm1CFel2lglmdyYHIA1bALxelfOaCRgLeWS9UJuUKjf0i1yaK6q7z6nRWPA+pdHQC5y5uA1rIZBzrHnv
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(376002)(39850400004)(346002)(36840700001)(46966006)(40470700004)(8676002)(41300700001)(6862004)(36860700001)(33656002)(4326008)(186003)(83380400001)(81166007)(4744005)(356005)(8936002)(36756003)(86362001)(478600001)(53546011)(6486002)(82740400003)(82310400005)(40480700001)(40460700003)(70586007)(6506007)(2906002)(6512007)(316002)(336012)(26005)(70206006)(5660300002)(2616005)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 09:33:35.2787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 733432dd-1299-4534-d8e5-08da68a09666
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2304
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Jul 2022 09:33:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97868

DQoNCj4gT24gMTYgSnVsIDIwMjIsIGF0IDA0OjE0LCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiANCj4gQWRkcyBtaXNzaW5nIGRlcGVuZGVuY3kgb24gcHl0aG9uMy1waWNvYnVpbGQt
bmF0aXZlDQoNCkVybSwgbm8uDQoNCnB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEgaW5oZXJp
dHMgcHl0aG9uX3BlcDUxNyB3aGljaCBkb2VzIERFUEVORFM6YXBwZW5kID0gIiBweXRob24zLXBp
Y29idWlsZC1uYXRpdmUgcHl0aG9uMy1pbnN0YWxsZXItbmF0aXZl4oCdDQoNClRoZSByaWdodCBm
aXggbWF5IGJlIHVzaW5nIHRoZSBzZXR1cHRvb2xzMyBjbGFzcyBhcyB0aGUgYnVpbGQgaXNu4oCZ
dCBwZXAgY29tcGxpYW50LCBidXQgdGhlIGNvbW1lbnQgaXNu4oCZdCBhY2N1cmF0ZSwgYW5kIHRo
ZSBwaWNvYnVpbGQgMC4yIHVwZ3JhZGUgcXVldWVkIGZvciBvZS1jb3JlIGltcHJvdmVzIOKAnGxl
Z2FjeeKAnSBzZXR1cHRvb2xzIGJ1aWxkcyB0b28uDQoNClJvc3M=

