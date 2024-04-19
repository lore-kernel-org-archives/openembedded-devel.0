Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A28C4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 15:40:53 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.50])
 by mx.groups.io with SMTP id smtpd.web11.24540.1713541247192576944
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Apr 2024 08:40:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Z97DlzN9;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Z97DlzN9;
 spf=pass (domain: arm.com, ip: 40.107.7.50, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bItGV1jsFH18Vbu9qKmIKL4zy0o0z5rPi99q/nX23n1m7OFVMwH8NC4vLo57uHowrexmqNSkTnsZbYCrdcPzHkjwiPVDJNedVXWnKWvYNalxAI3nG9hefuLm8vqCyrMWcg/uAvfE/Hr4e/ay+HC9GUz4TFWe+zjqL3ov9yIPblmqVkjGubd2R3HsyJBQxzTX62Y53y8sPon/QS8DPY3dvhtTCoxWdAOROyWhM7iBcAK9sreXcugiytbRyTLw+iB0IdhfJvdgF0Rp6wzHgkhpil7wXODbogLk4iqfRDrTCC2WjFgwV7W7UQEZ+/G7Y6wHMJpbUpW0Bign2dj0672WBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFUgzjldj9PmvOeKK3Pn+i9MLFX72zC3CGgJtWDvpNI=;
 b=dUlmD10RpC7FtuawqQedDUduFrGWPgvl6U7zzgl+Q0F9lP9vyfmXKpRWtPvF0hpHNCY3Q6b2nYvUxGcYfr2Z0nJapgZIWTNvlH9ArMyAqUKfGpyYCEej9hAfQWo8+cTSzPRpcZGedaQtGeSnsCjkG+IM+OU64pXkc+Ovs83B45QSHTtgh+uzNis/8grk83W5f7Vrneme0nkKE2MGndSk70MCIaAyu3AMQevbd2wmA6oGCoSGPUG26s0/kts6NAJ2vw6nfNTNFeKH1OOhowOlVkOxw0nnqSUh9n9zO8ILESbrWDIS41C/++1EP3LsXzgszyvOJQabbG+hOE37vJGtvw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFUgzjldj9PmvOeKK3Pn+i9MLFX72zC3CGgJtWDvpNI=;
 b=Z97DlzN9+n9ObNyigzKnJ+XJw09NK5l5UYNN1oPcrVQfDcIK4L4HJFoKuVnnjh60MRdYmpRrdlPvSqcgxOX1c1PM0xier7Gus9ARgkicdNDla9HKb2qdZNpuFfukZUzvTg4w43VSKpWAbyNsUfsAcKycuM5tVjxPedQqOJLoP7c=
Received: from DUZPR01CA0121.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::11) by AM9PR08MB6004.eurprd08.prod.outlook.com
 (2603:10a6:20b:285::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Fri, 19 Apr
 2024 15:40:42 +0000
Received: from DU6PEPF0000A7E0.eurprd02.prod.outlook.com
 (2603:10a6:10:4bc:cafe::f1) by DUZPR01CA0121.outlook.office365.com
 (2603:10a6:10:4bc::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.31 via Frontend
 Transport; Fri, 19 Apr 2024 15:40:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7E0.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22 via
 Frontend Transport; Fri, 19 Apr 2024 15:40:41 +0000
Received: ("Tessian outbound 93e51b94fd50:v313"); Fri, 19 Apr 2024 15:40:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2e8c883439c5a273
X-CR-MTA-TID: 64aa7808
Received: from 6c8c2e069f33.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FE15948F-37CA-4877-BCEB-3F72893F5DFF.1;
	Fri, 19 Apr 2024 15:40:00 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6c8c2e069f33.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 19 Apr 2024 15:40:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGBWuGhTvBhwDQME1Z44EZoJyEEB9hCn/zhp8ldsmnLcL3PFHYqPp7fxZOg8Y7JI9QBWppmKLzbXhU8ED2wZzaU8DTEad6eHloEnNMBKGuTPLeZcclPY9SdilVSyrK2MBMvpDtfxY5x7uT8Nrjdiq9MJ0LZhmJlsylMLkwwNbgtrOs19+Wzp5dizz+piQ3L1Owr1zGN02uEvyxUSyDFdT9yLm9ZknGphzBdgGDsssNE6cWdBL7oCB87tVe+omv/qMfuVuY+3U9GXpML1PNHl3istBGCsm6jRDp7tei5/0GBHyhZVtAlQCTez58nvQ2hJwChQvCbGFyyV4/Xoq5BBmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFUgzjldj9PmvOeKK3Pn+i9MLFX72zC3CGgJtWDvpNI=;
 b=e9NuQPVvntI/Q2iFGfth+5tG21rn3UL1NSpNn8sGsvaZv/KJCVWKG0McNQpBkRggotVNVS9rl4GrMyQDl0hlKLxBqpQO4/4Xm3QtkD0jfP0A9egI2USxO1ZowZbn/HCG9B1xzjNSs+EiT7o8SQ10BuU0cfuxvVDXM9yJVjMXnHCD9pXrsM/DZ+tmgHRPkzJQjiTteGQxIe6EYF70ej1jPYfZ6pK35x9+OIqqc7D9ZjveQUY8L9eAZuHWg4ibl/5GEO7GxuC0myMJOu9t4RmY6KzWkUFr2qBkrWKZDwVFLtyP6tRWVjHiDDU1lF+m1vnmmEuruUhRYiBzec8IBIBFDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFUgzjldj9PmvOeKK3Pn+i9MLFX72zC3CGgJtWDvpNI=;
 b=Z97DlzN9+n9ObNyigzKnJ+XJw09NK5l5UYNN1oPcrVQfDcIK4L4HJFoKuVnnjh60MRdYmpRrdlPvSqcgxOX1c1PM0xier7Gus9ARgkicdNDla9HKb2qdZNpuFfukZUzvTg4w43VSKpWAbyNsUfsAcKycuM5tVjxPedQqOJLoP7c=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9595.eurprd08.prod.outlook.com (2603:10a6:20b:609::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.43; Fri, 19 Apr
 2024 15:39:57 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7472.042; Fri, 19 Apr 2024
 15:39:57 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "perceval.arenou@ptxtrimble.com" <perceval.arenou@ptxtrimble.com>
CC: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>, Perceval Arenou
	<perceval.arenou@gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] aravis: new recipe aravis is a
 vision library for genicam based cameras. aravis project allows to stream
 from genicam and GigE cameras
Thread-Topic: [oe] [meta-multimedia][PATCH] aravis: new recipe aravis is a
 vision library for genicam based cameras. aravis project allows to stream
 from genicam and GigE cameras
Thread-Index: AQHakmqH+ieEDtDi2EeFB6nlgy/gRrFvuscA
Date: Fri, 19 Apr 2024 15:39:57 +0000
Message-ID: <CA0E3994-47F0-424B-8116-445FE9A13982@arm.com>
References: <17C71645B7063D93.20815@lists.openembedded.org>
 <CAC=Bj8jjRVm_6DkhJN15ikuVobP+N0eN9QwKM_d9ZQ5yo6QWzg@mail.gmail.com>
In-Reply-To: 
 <CAC=Bj8jjRVm_6DkhJN15ikuVobP+N0eN9QwKM_d9ZQ5yo6QWzg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9595:EE_|DU6PEPF0000A7E0:EE_|AM9PR08MB6004:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e29b796-85fd-42ae-61e4-08dc608711b5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 qdJ1sdGJoJ5Z1bqqpkjt3YvT55iI3v5cJBZD49Es2EP08yCpP0l/2GUf6om4rHishXI2adbP5ZnWYehJ6aewq51Dq2gxxMubcRdB6UQt4awiGq6DdmYyJ25S8LpCTMkN0VizMasrCFuQD/eIdRNs4ll1rv/Kr9I7sLD0+IoIbprJqA7PehDXkr3Va7UQi2lcYbH+tNPomlZokinM8Eiv+cxoNMc7W3Oh3Mxr2siShUvalNYIrxxWOrGnNRKiRImriKBjC8HREqM0neCxn5tbdU28bBxqYiExBLaIh2K6XxHvx6fVc1vCQbzQ5IzJKXmAKYVgEAHQeRZPI8Wvm4mdD4rDXwRTQ3gEXGG/JrkAGBQZBPKvImqPoXIki9mKSZaIO4kG5Mo85PYsxNyUmAs1iT8Mq0QkytWH7saRd3Db54vaey+AV2TXB172VqrFJoGT7Ke4wFzoHPiOzqrNrnbWFUVGrrynvIYqX/Rh/JX3iF49TimP/xvHtR0QrdtZ0zS4jGSm9PjPqZfcgJAFXvQTscmpEjWS7YbTRPrJomLgQ0FobnYbLehuPWny8BAP6Q/kUUxDpMsaLDS4+O4cxOZwWK0yu/VJgpFfOx4AKosdtGlANG/pQFCKoDGzNNxyM/uVJIWMnRIuz45he6B326tnJnZoUzmfwpsq1ft1GD48orWpDSmRx+i+wikqK2N+66ATlUiHIyzI6FtvWN7n2DcBdk78ffYeTBz7M1tIZH/emKU=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C45CF16AF226647B33C74C97C8FD59B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9595
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9f843948-26dd-42f3-f48c-08dc6086f78b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oQrM2sw7KZPAY53L8ewfbd+/KyKAwC8KC3kufnxmH8sStw1M+7kQYoyMXjfKJXZ29Twsz0OkG1mfL1r1vKyufsmHR73sLAj8qiA75AlW0pf95eNXakJ8Q8aqRx93XHpDdFig+nQcCBSVcxWcTzNyI80DD8bOpHrtl6wgaDRo6NFkrC01Y5g/sw867NDnRD0hzrG5ItPyj/46WTsYVGWJ8fckligMuKz13cDIYNdKZn4DNbRwdcXXYohnWzoobWKZo2Cp4Ma7YBQFi1WlDgGaWpcbF/6j+PT57uRVnp+azsXolS7gxWsRaMeChhigb38elSjuRbxuG3Ry2gGON6Hwfi92F6w4NEfWZP56gpiOpOK4IOE46n8DHqvTYxO4kQ0Wx7NDJEcESnEj+CfP9xdLL6tFRrtyAFKLCtWMSjOeT9IV4gdpS3IyBxZOQrGiyNd28aaR368Hcom3kN7M2dfKHmhjTAZEuRSaFNn83lLxkVe9qB0143g1joJ/sqNn4QIJJ9OdZI3Ju2aSKblciwkupfOay3SVRCF4p7N8bz8Vd3FGXivhxShY9ZLXHeipwSSlHu9VZCOy5tTWiiE43pmGWR1QPDN9aBVAospXURFIEXCuIJb2SdG1qqq1kMZhQSXi0S5fjQ7cNndsdtkzEn54vuA8Nlu3H+CFGk7l+Hk/nNlwRWdqQ3sgIkujrwNWR9jKDFbZV1veIcmq8jE/+WCEbPfqBA7rdEnFiWb9eU9R79U5en7oZB6nrs/XyZBIrkeX
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 15:40:41.3719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e29b796-85fd-42ae-61e4-08dc608711b5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6004
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Apr 2024 15:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110063

T24gMTkgQXByIDIwMjQsIGF0IDE1OjU4LCBQZXJjZXZhbCB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cGVyY2V2YWwuYXJlbm91PXB0eHRyaW1ibGUuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiArIyBUaGVzZSBvcHRpb25zIGFyZSBmb3VuZCBpbiBBcmF2aXNQcm9qZWN0
L2FyYXZpcyBtZXNvbl9vcHRpb25zLnR4dA0KDQpObyBuZWVkIHRvIGNvbW1lbnQgd2hlcmUgdGhl
eSBjYW1lIGZyb20sIHRoaXMgaXMgdGhlIG9ubHkgcGxhY2UgdGhleSBjYW4gYmUgZGVmaW5lZC4N
Cg0KPiArRVhUUkFfT0VNRVNPTiArPSAiXA0KPiArICAgIC1EZG9jdW1lbnRhdGlvbj1kaXNhYmxl
ZCBcDQoNCklmIHdvdWxkIGJlIGdvb2QgdG8gdXNlIHRoZSBnaS1kb2NnZW4gY2xhc3MgYW5kIHJl
c3BlY3QgdGhlIGFwaS1kb2N1bWVudGF0aW9uIERJU1RST19GRUFUVVJFIGluc3RlYWQgb2YganVz
dCB0dXJuaW5nIHRoaXMgb2ZmLg0KDQo+ICsgICAgLURmYXN0LWhlYXJ0YmVhdD1mYWxzZSBcDQoN
CkRlZmF1bHQgdmFsdWUsIHJlbW92ZS4NCg0KPiArICAgIC1EcGFja2V0LXNvY2tldD1lbmFibGVk
IFwNCg0KQ2Fu4oCZdCB5b3UgbGVhdmUgdGhpcyBhcyB0aGUgZGVmYXVsdCBhbmQgbGV0IE1lc29u
IGRldGVjdD8NCg0KPiAraW5oZXJpdF9kZWZlciBtZXNvbiBwa2djb25maWcgJHtAYmIudXRpbHMu
Y29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCAnaW50cm9zcGVjdGlvbicsICdnb2JqZWN0LWludHJv
c3BlY3Rpb24nLCAnJywgZCl9DQoNCk9ubHkgZGVmZXIgZ29iamVjdC1pbnRyb3NwZWN0aW9uLCBu
b3QgdGhlIG90aGVycy4NCg0KPiArUEFDS0FHRUNPTkZJR1tpbnRyb3NwZWN0aW9uXSA9ICItRGlu
dHJvc3BlY3Rpb249ZW5hYmxlZCwgLURpbnRyb3NwZWN0aW9uPWRpc2FibGVkLCBnb2JqZWN0LWlu
dHJvc3BlY3Rpb24s4oCdDQoNClRoZSBnb2JqZWN0LWludHJvc3BlY3Rpb24gY2xhc3Mgd2lsbCBk
byB0aGlzIGZvciB5b3UsIHJlbW92ZSB0aGlzIGxpbmUuDQoNClJvc3M=

