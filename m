Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E79C7618A
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 12:43:20 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.83])
 by mx.groups.io with SMTP id smtpd.web11.6787.1678884195119132712
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 05:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xHtvYOJN;
 spf=pass (domain: arm.com, ip: 40.107.6.83, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88QH6zNAfD7aozrRjXZX0xhs3vb1DOgV3ArP+7Zrqmk=;
 b=xHtvYOJN+4oARWgwHHL0JNn2P+hStf8tD5iLuhmo9WMc1yCpfcLpNo7VKDxWNdQZYbytrR2PmXadx9g14QLEfOwgWzYytFaBFDrb7UD7yziT88a99H/BJLtlaGpw7xXFfjl35f4B4f1oaWtwl9XQ4pG3cZQrrmxI12d/oU+yr44=
Received: from AS8PR07CA0020.eurprd07.prod.outlook.com (2603:10a6:20b:451::13)
 by DB5PR08MB10309.eurprd08.prod.outlook.com (2603:10a6:10:4a9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 12:43:07 +0000
Received: from AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:451:cafe::87) by AS8PR07CA0020.outlook.office365.com
 (2603:10a6:20b:451::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29 via Frontend
 Transport; Wed, 15 Mar 2023 12:43:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT018.mail.protection.outlook.com (100.127.140.97) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.11 via Frontend Transport; Wed, 15 Mar 2023 12:43:07 +0000
Received: ("Tessian outbound fcd8b5fba459:v135"); Wed, 15 Mar 2023 12:43:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bf01860eea499744
X-CR-MTA-TID: 64aa7808
Received: from 13bea9159ff1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2FD5081E-FEF0-4DD8-9F18-BA2460D0FA19.1;
	Wed, 15 Mar 2023 12:43:00 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 13bea9159ff1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 15 Mar 2023 12:43:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmUXxlz0Sq+EmQYmAdaKC3AGRyajMb0Wklyoa2Fikp34uYzEI2lFAPnhL1KViAe0L8jZfd3PTdAo5xA6J7GAP13RdlzleCQ6JyxaPmvVfu/XAp2IBm2/JROYCxfwfrBCTakkgdNLvrIrYf9dOPzpwc4P1Wc42mI0lu8iaP01EXY0G9xHA3vRcsoPBDj6B1VI6pINBoLsYALcC538J9W6hGXp92JiTQZ8l5iP+tr1a83DXTW13rlvz1O5NJhAyQIhQTuPmWp/uR5FwpHP5emQ8qqyU3GiyaT0l8PQ0sNvTjAzdPfgi/V8hmj5c77TFI1iErKAFHFXNZ/nIcP+YTDJsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88QH6zNAfD7aozrRjXZX0xhs3vb1DOgV3ArP+7Zrqmk=;
 b=SupDB6SrvhpoUP63EkKYpu5VrUeMpMCjTOfW0BYnWNb1dc3oBIhlJdLw6y29TC9OOLNzyy1vtTf1dkgfdZeAtJtgAv8oqv+NAmLisvBvn/WSUwzfNh8YvnS7zHzVLiqw81yTasnd6wsof+2TiOHrXhFzrwGKiF14GpnvFPN3w15B6qBXaxVChjsWEwly/fj3T1z9KMWiMDriKKoApsy4sRgMPK7zVYIa/aEYOwBoX0x+UhYcOwSOKbEGzpw1DNwxgZ9zfPjRdiEvTnBxeZFZak/Jn/T8EjLL4zn3QYf2/N8WeY7YAhoaXXYQ/IBzjJnt9neJg/h6heH7jGM0tNYpnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88QH6zNAfD7aozrRjXZX0xhs3vb1DOgV3ArP+7Zrqmk=;
 b=xHtvYOJN+4oARWgwHHL0JNn2P+hStf8tD5iLuhmo9WMc1yCpfcLpNo7VKDxWNdQZYbytrR2PmXadx9g14QLEfOwgWzYytFaBFDrb7UD7yziT88a99H/BJLtlaGpw7xXFfjl35f4B4f1oaWtwl9XQ4pG3cZQrrmxI12d/oU+yr44=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB8577.eurprd08.prod.outlook.com (2603:10a6:10:3d6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 12:42:58 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6178.024; Wed, 15 Mar 2023
 12:42:58 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: =?utf-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH 2/4] python3-patchelf: New recipe
Thread-Topic: [oe] [meta-python][PATCH 2/4] python3-patchelf: New recipe
Thread-Index: AQHZVxTVxyIhNY9KhEWzV3UA5TSj9K77ySCA
Date: Wed, 15 Mar 2023 12:42:58 +0000
Message-ID: <D47E7172-2A7E-4B2A-9F1B-CFEE77D06563@arm.com>
References: <20230315080429.2722555-1-zboszor@gmail.com>
 <20230315080429.2722555-2-zboszor@gmail.com>
In-Reply-To: <20230315080429.2722555-2-zboszor@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB8577:EE_|AM7EUR03FT018:EE_|DB5PR08MB10309:EE_
X-MS-Office365-Filtering-Correlation-Id: 29dbb8db-2404-4f3d-6c6f-08db2552d3bf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 C650pSxPyEbnLAjGAGqgYSAeDi5JYKo43H3rDFLL3O5P0ajPFuf7FjgxHSVdZ3hGyrHLVXnqrbs8qxGwklgTQrttViuDUz+DMIMU7hW26xdQH/Iqfff1pxo8bPAzy0/VykBvTkh3Q+YU95SdV3Pm1Yk6St/ecJVhYEZqSqyPNvDi9TtUEdRjxNfNuX3alEQxZlmTdjlnraPi9zrHV2hBIqucoVC+CFixPju+7FM/ed6WWfDgv3zrmuE5mPFxAl78Ec+ffuL6YQvQuc+lImJm6/pr4XEREJdphDEbO6VQfdq6bm1Eic0erOHBTzb+khz1ujWP3HiT1rUzyV75p+Lz0rUdjkLJ55iyfY6/fStFH9mVemfFuPaj2EocZdFy7rZ4FUzlO+QE9L2HrgMD+BYOIA7y9RFYztzGsYVfqCgEWirVcJsxekNcd5wGPXrkJQypw6RJq64TxNfJktjCTr9WMej+Um1oPsdSPFybj9uucakpSqTXiEQkC8vz6KROStYxTaUNfwPfLCdJiuwnoAMe8IkEHDjxtKvbQ4htu3LdBuP6/DFSbXDio7hLadzLXudCeTgVakxq1yzwt/kyRSctWao7dFc7gmqkw4EtqJVY7OaPecgWFml5Ovi/Q+AV+wA8oP+OuP9mbxzuynrB+tB/5ldUBwmD638ty1D4rd2NVOvnO3ziNpdajgyhQJkYFLZW6hS2FY+pZ/AzU4EPiToazG+zI0GJPkK8ipfV3t+HQsA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(39860400002)(136003)(376002)(396003)(451199018)(33656002)(71200400001)(6506007)(6512007)(26005)(6486002)(36756003)(76116006)(64756008)(66446008)(66946007)(66476007)(66556008)(122000001)(478600001)(83380400001)(4326008)(8676002)(91956017)(316002)(38100700002)(2906002)(86362001)(186003)(4744005)(53546011)(2616005)(5660300002)(8936002)(6916009)(41300700001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2DB04BFEAC08B7479C6A21BD93005368@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8577
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7fbc4dff-0326-47e5-096c-08db2552ce77
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KhX53ego0uxQtE9nReBPETFWq8JKCMJxmn2qr5k5yl7cZlSGBVcJiU7sZ203G1zDK7ckTxncsYpSUnXqwfuHc+AVoWZayT+9qF+l0zW4bCThU/Hy6aDA+XAm2651sfBPaFp21Xnk+oy1IWFsgSp1R7z2znmfPAEQwIw4HJlfn0qIyB+G7KE4xhe8jEz/5VkacmSRMamQC0jE7duiaFvL0qOUNmuUtA1FKZQk7G5w2P12EZl9Gqf3cvLpOjDw17J7bSYfUxZAIS22+4rnp8hHC11Y7u07W/+h9xnYAob+CcZOQrq0252wTCV7TDuC+BWK07BidADH+QDINVOBO22fMWpGv2e9+/h+cjsYhqhVzyglJrL2exk14YWPha6WRaMH91ZigUq3aRp5OWCxDNcofN4moiiTLjfsF/9Nk1DIsXn/Z9Wzf07ZYYMvKpt/Y7hD+ZCHHFd5cvzqtpAl+QZ0Y+ssrucXbASsPiJ1BBBJhh84lqcF1qpN2B/vMFd57fOedI1VYRjn/68SjJn9NsX2VMaMxHFWLfIC29suBcpfkHuIBimSrMVC8NNiAQP7K/z0/RjN0Bnqb1ROkVl1aSrAxxXTSmBe7PGEy8IuOSLeTZywXyQh6XiUTNG4ONrTg4melEFSsb6tpYP/YZTATeGJVSgDnSuE4FWK1mxwdnedQqn9GwqLsEgXg7WHYx6spIDCh8RU2J1R3OsENZgnHVu+dg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(39850400004)(136003)(346002)(396003)(451199018)(46966006)(40470700004)(36840700001)(33656002)(356005)(36756003)(36860700001)(82740400003)(81166007)(8936002)(41300700001)(2906002)(4744005)(6862004)(5660300002)(40460700003)(4326008)(82310400005)(40480700001)(70586007)(186003)(53546011)(26005)(2616005)(86362001)(6506007)(6512007)(83380400001)(316002)(336012)(47076005)(8676002)(6486002)(478600001)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 12:43:07.2515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29dbb8db-2404-4f3d-6c6f-08db2552d3bf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10309
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 12:43:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101536

T24gMTUgTWFyIDIwMjMsIGF0IDA4OjA0LCBab2x0YW4gQm9zem9ybWVueWkgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPHpib3N6b3I9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiArKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXBhdGNoZWxmXzAuMTcuMi4xLmJiDQo+IEBAIC0wLDAgKzEsMzEgQEANCj4gKyMgVGhpcyBp
cyBhIGR1bW15IHBhY2thZ2UgbmVlZGVkIGJ5IHB5dGhvbjMtbWVzb24tcHl0aG9uDQoNCkkgbm90
ZSB0aGUgd29yZHMg4oCcZHVtbXkgcGFja2FnZeKAnQ0KDQo+ICtERVBFTkRTID0gInB5dGhvbjMt
c2Npa2l0LWJ1aWxkLW5hdGl2ZSINCg0KV2hlcmUgaXMgdGhpcyBkZXBlbmRlbmN5IGZyb20/DQoN
Cj4gK1BZUElfUEFDS0FHRSA9ICJwYXRjaGVsZiINCj4gK1BZUElfQVJDSElWRV9OQU1FX1BSRUZJ
WCA9ICJweXBpLSINCj4gKw0KPiAraW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxk
X21ldGENCg0KV2h5IGlzIGl0IGRvd25sb2FkaW5nIHN0dWZmPw0KDQpXaHkgaXMgYW55IG9mIHRo
aXMgbmVlZGVkPyAgQ2Fu4oCZdCB3ZSBqdXN0IGNvbW1lbnQgb3V0IHRoZSByZXF1aXJlbWVudCBm
b3IgcGF0Y2hlbGYsIG9yIHdyaXRlIGEgcHJvcGVyIHN0dWIgcGFja2FnZT8NCg0KUm9zcw==

