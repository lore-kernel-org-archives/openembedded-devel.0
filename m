Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B94C76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 14:14:19 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.56])
 by mx.groups.io with SMTP id smtpd.web11.55850.1680272052165142417
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Mar 2023 07:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=0CQmdXNY;
 spf=pass (domain: arm.com, ip: 40.107.22.56, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKEwiqqnKRiIyNWxIhVZy3arzDmE4XSU8V3ZIA2kTSQ=;
 b=0CQmdXNYDnlkpemhGkjbu+qJAnbk35p7FlkBuev+Q+4nuGQO8QTAUOuk7iHN16LOzvelrOtt/GwcGGdJARLvFatRE6Fq2yvnUuox/Udp47hXRyEvVXAp75Bd8LoUfvtIM3kLbz4SnkrPYeGZeTm7SPsQq/+t/6kC7KOIgNZ+Oxs=
Received: from AS9PR06CA0079.eurprd06.prod.outlook.com (2603:10a6:20b:464::13)
 by DB9PR08MB7584.eurprd08.prod.outlook.com (2603:10a6:10:308::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Fri, 31 Mar
 2023 14:14:08 +0000
Received: from AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:464:cafe::fb) by AS9PR06CA0079.outlook.office365.com
 (2603:10a6:20b:464::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22 via Frontend
 Transport; Fri, 31 Mar 2023 14:14:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT051.mail.protection.outlook.com (100.127.140.64) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.16 via Frontend Transport; Fri, 31 Mar 2023 14:14:08 +0000
Received: ("Tessian outbound 99a3040377ca:v136"); Fri, 31 Mar 2023 14:14:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 40609e8657671901
X-CR-MTA-TID: 64aa7808
Received: from 15cd0e73ebf3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 38583891-32EC-49A4-80AF-708EC1A2F1C0.1;
	Fri, 31 Mar 2023 14:14:00 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 15cd0e73ebf3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 31 Mar 2023 14:14:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GSRrEkruaoOOkhXzed9ZL8ztl4gEKixKNZoMGoTnljZPziKweSdP3VpH971dANEIHs7AjkvKeCUPlS8UTRhMAVkd+s3/oWZEiGAZ2lOS0wCsCSNX8yCn2kM/UNCSdVh8q+OWj2G0kfab02zdS644h6WcZq6mpWErbvvNWk4GUQAUvO0c69GZ6MlEH1n516jc0+vf50YDPZIvI/VZA6WqDrXXwU4f9gyLM9irI+AIuU7KX/f3Wu1QMDKa3YIFq64iEmnC7brHOdUPO9CGg/k1e/Dm1gWUt02dsmQelKYpQRqijpZ5+l1TDQYeREclI/k5G1Y7E/s4geD1/n/dXb+2Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKEwiqqnKRiIyNWxIhVZy3arzDmE4XSU8V3ZIA2kTSQ=;
 b=JZOmEzY/Dy3D1caOpOAeWgewAmsF8QawYVqsBls/6hHSfpZqppMBY1RR1YPRg/lf00vEZXPndgxqn+wjo2QpPlDI/MnwuOhYL00HYEEjf69y59xFlaabfzsU64ZDjAABDmfRLkcYeNeUW1EynXT0Jco9S0vzDOIk+2t2zTUwfroUopOvl7UKYLO9359ujYE8LzwwsZ6E/WjDU+1409tdmHDTtEFNRwVY6gRfOg4OFQTUCkIvQg9I86tnK+h22ZoeIwyhSRk0e0foumtEeQ9R0OZzW1vgptGabI+5oHf2RwW/MXTl6UxEBiWrA0lfk6L677m1tuVkGmYs9Y10JDhg7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKEwiqqnKRiIyNWxIhVZy3arzDmE4XSU8V3ZIA2kTSQ=;
 b=0CQmdXNYDnlkpemhGkjbu+qJAnbk35p7FlkBuev+Q+4nuGQO8QTAUOuk7iHN16LOzvelrOtt/GwcGGdJARLvFatRE6Fq2yvnUuox/Udp47hXRyEvVXAp75Bd8LoUfvtIM3kLbz4SnkrPYeGZeTm7SPsQq/+t/6kC7KOIgNZ+Oxs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB6513.eurprd08.prod.outlook.com (2603:10a6:20b:366::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Fri, 31 Mar
 2023 14:13:53 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ba7:a556:599f:4369]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ba7:a556:599f:4369%5]) with mapi id 15.20.6222.035; Fri, 31 Mar 2023
 14:13:53 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Khem Raj <raj.khem@gmail.com>, openembeded-devel
	<openembedded-devel@lists.openembedded.org>, Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
Subject: Re: [oe] [PATCH] reboot-mode: put the build artifacts in ${B}
Thread-Topic: [oe] [PATCH] reboot-mode: put the build artifacts in ${B}
Thread-Index: AQHZY8zSaSwjO4BaBEK0zdny5sEDDK8U3NEAgAAQsoCAAADggA==
Date: Fri, 31 Mar 2023 14:13:52 +0000
Message-ID: <AA158C05-3D1D-4F6E-85DD-F90FD0C836C0@arm.com>
References: <20230331123153.292738-1-brgl@bgdev.pl>
 <4E0B1FB2-9294-4E87-B055-A048B8A8151A@arm.com>
 <CAMRc=Mfmqp2o8j4dKdZWnQRKaTVjrdGfp9KX6M0w+yNfTH82JQ@mail.gmail.com>
In-Reply-To: 
 <CAMRc=Mfmqp2o8j4dKdZWnQRKaTVjrdGfp9KX6M0w+yNfTH82JQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB6513:EE_|AM7EUR03FT051:EE_|DB9PR08MB7584:EE_
X-MS-Office365-Filtering-Correlation-Id: b06e872d-c530-4c2a-8907-08db31f2313f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 arUWi7BVUc0XfTJssL0evtSqR3df959+AWmPclJAPLfFID96mrIzCYM5taYlEsS/P+ftkKdtKclam2c49EMTAMW88ojIGjw74JhadSNmkr0O+TCJuFhofFCTP3lK+LAPmtuEKhIIQeOJt0EnSWW5BKOiOcMDst3b6IovbG31VOFs8UxncQv5YwZb8rNgZyrQMRTeurJLXKXo/PechDgmf6afLr3eCnA2smpp5PRj/bcpi2AHNj4suID+3d99XX60kPrMx0wkRmzxh5P15zVI7AGxhkf3/XruJgjmuEBtBfgD4RQaSc6ikKTE2vFl/POFZiiQvJMONxIoTr1kSFuMh7D24dmzVaAh9GMG3WV0YRxi4V8tiTRvAZLkzm4iNfGAWhejL1IpvNQW4U/gRB7qepJ7f8mRFdJUcs2JBzKMImCTikMTjz6+hhRI53DenHyYMTBWmXZ4iZR+yKG7vlIuUlZ3WedmuXaMs7r5zCF1ISFwS9MkJUsZDs12ApJU2LzvTkIR6+lVtLRz+2lidiM1mUnxzgfLCoAcCrIEm1merz5Oy2rseyZ2EGk/bqBaY7M5GAjQk4RUAVZJfXtT8f1ZUWhTd6a3/hk3GBVjx5+ea8IdfdQpK1CTj825oFcvdW7S6VHm03OvWk9rPF8GUhd+6dPjYUOTUBvSThdNUshWSoRacN9w3REfCOF8zvYfQ5RR
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(451199021)(38070700005)(33656002)(122000001)(36756003)(6916009)(38100700002)(4744005)(86362001)(4326008)(66946007)(5660300002)(76116006)(66476007)(8676002)(41300700001)(66556008)(64756008)(66446008)(6486002)(53546011)(2616005)(91956017)(26005)(71200400001)(6512007)(2906002)(6506007)(316002)(54906003)(186003)(478600001)(8936002)(45980500001)(228453006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B9D358899E3B941BD51436CA4683BA0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6513
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7a14be02-56e8-403e-8d53-08db31f2281b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AhNCnEz7k2a3OCoJvdecGLNQSOGV3BZ3rznFhUcXSsyhmJPQIyct7URKK4TmPfSgvj6jKeF1O4afDg6UMa1KK87I2eQz9nApn3n78Hi0b9cFwVtbB8GNVQU+e/DSyavyt/GibWuqohxMhpeCwYxPFU8P0rYGG9J/cku+LD/BpgXVR8PCrMWAaIcMFwg4yI+WMnHySX1fq+23eZczrNpHVGQAJkCEIQL26sDDjdIJxDlEo02gyV53zX05QPCiBtTtmuuzgyy1ZZ8IIP0el14MSNpZV3Dlp9W40m3iMiT8ElqrC3eI4SNeYv67xhrvPScdaRZl1lStwb96p2Q54QoratUgJSACsAMtP/AI3tg6JXGNcOM6nI5vqENme6W8Xcmo1QHXALhQAgTrxJwAf2PGV0qbCijAR5L1qfdCCLlcQG1AudrnS1zaqlheQEI2SNa/XxSs6HYWm1R0Iz7aiHz4L7g6N8rqhnOCy+ag7JH4JnyLOo/49bxBGZYTN6baV7pkwtiMQHaeUh8ADHAfJgcwmiNzoheBOKhBFBBVlCqcZVXEDNaqPevFD4a7oTLphyYXruyHr2NdDEaP/mFTNV5nbk6h0WGe/AWvwDiS8ZRuRzxaIqZHS/8VKdwdfee6LH5tePEN/hHkScRSfElrALKzb2yZCphEqhxRIkIUDiCSx0jBTZwM4l823+L1ZCouTvjBZt2NBuX5kfSL4Zxxj6zyoDMsEHDIeqoMkgWnJ9N2+3c=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199021)(40470700004)(36840700001)(46966006)(86362001)(40460700003)(336012)(478600001)(2616005)(26005)(6506007)(6512007)(47076005)(82310400005)(81166007)(82740400003)(107886003)(40480700001)(356005)(186003)(53546011)(36860700001)(41300700001)(70206006)(36756003)(6862004)(8936002)(5660300002)(54906003)(4326008)(6486002)(33656002)(8676002)(70586007)(316002)(4744005)(2906002)(228453006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 14:14:08.0526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b06e872d-c530-4c2a-8907-08db31f2313f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7584
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 14:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101857

T24gMzEgTWFyIDIwMjMsIGF0IDE1OjEwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2
LnBsPiB3cm90ZToNCj4gDQo+IE9uIEZyaSwgTWFyIDMxLCAyMDIzIGF0IDM6MTHigK9QTSBSb3Nz
IEJ1cnRvbiA8Um9zcy5CdXJ0b25AYXJtLmNvbT4gd3JvdGU6DQo+PiANCj4+IE9uIDMxIE1hciAy
MDIzLCBhdCAxMzozMSwgQmFydG9zeiBHb2xhc3pld3NraSB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8YnJnbD1iZ2Rldi5wbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+PiAN
Cj4+PiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFy
by5vcmc+DQo+Pj4gDQo+Pj4gV2Ugc2hvdWxkIG91dHB1dCB0aGUgY29tcGlsZWQgZXhlY3V0YWJs
ZXMgaW50byAke0J9IGFuZCBpbnN0YWxsIHRoZW0NCj4+PiBmcm9tIGl0IGFzIHdlbGwuIEN1cnJl
bnRseSB3ZSBwdXQgdGhlIGJ1aWxkIG9iamVjdHMgaW4gdGhlIHNvdXJjZQ0KPj4+IGRpcmVjdG9y
eS4gV2hpbGUgYXQgaXQ6IGRvbid0IGFzc3VtZSB3ZSdyZSBhbHJlYWR5IGluIHRoZSBzb3VyY2UN
Cj4+PiBkaXJlY3RvcnkgYW5kIGluc3RlYWQgcHJlcGVuZCB0aGUgc291cmNlIGZpbGUgd2l0aCAk
e1N9Lg0KPj4gDQo+PiBCeSBkZWZhdWx0IEI9JHtTfSwgc28gdGhpcyBoYXNu4oCZdCBjaGFuZ2Vk
IGFueXRoaW5nLg0KPj4gDQo+PiBSb3NzDQo+IA0KPiBJJ2Qgc2F5IGl0J3Mgc3RpbGwgbW9yZSBz
ZW1hbnRpY2FsbHkgY29ycmVjdCwgbm8/DQoNClBlcnNvbmFsbHksIEkgcHJlZmVyIHRvIHVzZSBT
L0Igb25seSBpbiB0aGUgY2FzZSB3aGVyZSB0aGV54oCZcmUgYWN0dWFsbHkgZGlmZmVyZW50IGRp
cmVjdG9yaWVzIGFuZCB0aGUgbGF0dGVyIGhhcyBiZWVuIHdpcGVkIGNsZWFuIG9uIGV2ZXJ5IGJ1
aWxkLg0KDQpSb3Nz

