Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3FBC4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 11:09:47 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.65])
 by mx.groups.io with SMTP id smtpd.web10.29164.1701860981142141125
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 03:09:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=I1xJqZu2;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=I1xJqZu2;
 spf=pass (domain: arm.com, ip: 40.107.104.65, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Jwvv9TXMtbXT0AiGu9/Wwr2NbCIruuBwyEIA9+6p9FGQ22ZDdlPmOhQmMKbc/MQQ8rBmx0x+iM3oCtJwVk6qMgX/5mPr/mOnqwV8zLGA5/NwwNR4B95toUYCMVxSdBnBs6mVQddcYZOG4YzlIedauJqz/UkQKhTSDRwtV/9h4+7TzniX8TE0C87iYkrpi39VDRUJgSDuEjNiUct8cfBUSmn0gqyYfqVv8GsP2RZ+aS6qdNg+VGmPTG49QfebeaAm1N1aQhfhb4IZQ6Jx5H68Y03IXIRPPSdusOT37K5X7njjpHgMet08KHMJ78jCzrR0N3brrKwaGyL1tCG92VNz5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGzLQ36qHukh+FjGLGx9vDEEB38djbNoC31vJSzgfCs=;
 b=KjPav2Liy3DR7vNcbPIlBfS7Z+vNC4zMGCZJ2bUWrKBgq6cNvGEkv7ZDXaFSItYWMLs6k5VB692TfbLDwjb7dptNqNtbhS4TWHF7w/AOmk+tOtXLUPDgVpm6B4+fqhn72eFLuPrH9r3wn7aNOiEZW+TpMn7rSvGooP1/mZRfKrU+mApzZt9M+IpgKVy9Qy6o3vCb7YzEWgdjnX9ZomZ4pCH8+WkkPqmmFpJmmIUhkJv4K/0mNtxHPvgMT6dySv2X7STXO8epls5RVzP+uedWe/klb08FgKdOCpC8DzPBnR42EvUACPv4cFJFQz8/Iw/8WtUhMyiJ9EtNb0X+6JU8qA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGzLQ36qHukh+FjGLGx9vDEEB38djbNoC31vJSzgfCs=;
 b=I1xJqZu2jGkR0317joKRji3UPx7V5hbzF9H+JmyNrmhVU5Boen1FKq3czWcPzTxQK9pL042pq/NqwZauPYQcL8MhE9oh6d1xvXb9bbNGgoyktNcIWQKJkBhhmzAqPRLeOTevExmm9pzzTios8Q91U0TcaglXgg31WnBjPgNQfpc=
Received: from AS9PR06CA0246.eurprd06.prod.outlook.com (2603:10a6:20b:45f::12)
 by AM9PR08MB6066.eurprd08.prod.outlook.com (2603:10a6:20b:2d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 11:09:35 +0000
Received: from AMS0EPF000001A0.eurprd05.prod.outlook.com
 (2603:10a6:20b:45f:cafe::b) by AS9PR06CA0246.outlook.office365.com
 (2603:10a6:20b:45f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Wed, 6 Dec 2023 11:09:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A0.mail.protection.outlook.com (10.167.16.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Wed, 6 Dec 2023 11:09:35 +0000
Received: ("Tessian outbound 26ee1d40577c:v228"); Wed, 06 Dec 2023 11:09:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e3a86df7db84352f
X-CR-MTA-TID: 64aa7808
Received: from 2cfcaeefd9d7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EE7EC497-A719-4073-8F82-841C15BF7C22.1;
	Wed, 06 Dec 2023 11:09:28 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2cfcaeefd9d7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 06 Dec 2023 11:09:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QAH24x6AAXqUYd9a95Q/M2B0YFbUfL5Z92DUKPRjSysNqfCgOQBAlFhrwSKDL8irkBhBdeBvRUWe93kPOl2LrIkBLf/Spgwu7P/QikuNcz/o2yQG22NXJNLmlQYTqe4zMnoWMUSRR/RliKyZakA4PoNxAY3dTvFVScpJwLNpx+E7fijAVBHEaAsV+TQa3F/4FF90d7mtbd/RuNQ9H0S5Xy6uCYlFbpULCqXBwCvhU83TbgIl+GgANSEH1FNv3P4JsT2m7FLSFojf+Dkd3heYZ+nfB6IN8qZC12/BHK3LhFnOVoYXiqUBJUEUp+bkECAsKeLio24MFLuZSdpM+Qefiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGzLQ36qHukh+FjGLGx9vDEEB38djbNoC31vJSzgfCs=;
 b=KQqCaNcoqz99PFRZ+HMPT3Dz5O0mskxt4a00z8uVVusJnrEnV9ISmHSL6i59jG4fRQOTZ7Jzqlqhlk8yyZejVYLTLbt0pHAmu31lPdev+42cM0OmKOL+kI3gP4yI8IZp/VxdW8DiiwhNn83/X3tmP4yRchNzAf/Kd/y5Cv6OxzO9ehw1EUJeXCFZYkG6/ZCOUam7320MyGGf5z9AAKQZoUzKN8TatILkBz34FcvwbQhZriMAxrrwlsvH4gyVOdfzUZFN80a1qJCzwDLo8NCZ7pXl9yeGIq5hU54OXQhfqsOMF09AUQj3PRlzdBfhl3SLX9dB9mx4TuuOQ7v8ImgXSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGzLQ36qHukh+FjGLGx9vDEEB38djbNoC31vJSzgfCs=;
 b=I1xJqZu2jGkR0317joKRji3UPx7V5hbzF9H+JmyNrmhVU5Boen1FKq3czWcPzTxQK9pL042pq/NqwZauPYQcL8MhE9oh6d1xvXb9bbNGgoyktNcIWQKJkBhhmzAqPRLeOTevExmm9pzzTios8Q91U0TcaglXgg31WnBjPgNQfpc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB8209.eurprd08.prod.outlook.com (2603:10a6:150:1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 11:09:22 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 11:09:22 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: =?utf-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
CC: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	=?utf-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH v2] zenity: Upgrade to 3.99.91 (4.0 RC2)
Thread-Topic: [oe] [meta-gnome][PATCH v2] zenity: Upgrade to 3.99.91 (4.0 RC2)
Thread-Index: AQHaKA7ymUxN/43HaUK47fZLdzM9MLCcGSoA
Date: Wed, 6 Dec 2023 11:09:22 +0000
Message-ID: <3AC073BC-F68F-4A45-A6F2-0E8E2E15261F@arm.com>
References: <20231206063902.152089-1-zboszor@gmail.com>
In-Reply-To: <20231206063902.152089-1-zboszor@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB8209:EE_|AMS0EPF000001A0:EE_|AM9PR08MB6066:EE_
X-MS-Office365-Filtering-Correlation-Id: 78ee97b0-be6a-4447-883d-08dbf64bd4d6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 dB3CrCpyXYtWYRhpq78bUClJxQU/Q+eLTZLjpDHE+6kVp9iQw0AlwZOpm9wetNXJYdBnrNa7naExpnNdH5JmbMBEb+WLtdCbTOcBLUK8JFRbaBTOBDNCmyImj8+OjPPUlvSwPB6R7JOmtXL+Z0nki2PS4z+tuo1MTU2k9VwOlsXTAaWP17JVglrW1aQ9i0C1nFktdpWhjopkwsVlHBxBmmue8+c5WVsaYtvaMJpl3ZPMbFayh3hZ4XpDeegh3NfjvkVHXoCrmfSQyqmgdtUisAZJNmXA/q2d5MHjA7FAkmLSPqi2mBySM2ae+5P6Rt20bRK5TA+68k8J2htDDt73ZLFm+FsFCk6eu2F7j5zwFoq02p9NRjCr0BV88ruWSenF3k7cxvyXaJKGqj+FMEJu8DNiFHuW+ZNPW967sVNouW6tgA1sRCJk0SvJPnghiaPsU2rQazCjZxc4gB3aKCX0ZHKUTbzy5Pl7GbyaBUUvTp92NiIsPd2YaGmiQIRD9Yi/0ObXunLs0jW1N33IfHoF7pIZoVn9zBK4QiPkuK3nv5tJNOUBskjFMt4V3sXSB2SxSWZN9RyK78lRaBGkpXrvaTaVxUY2dJqxD/qdLCrmb21b/ZZ1fcCPOE2319BH5XnbKy9DdoO9dkZbxBNISHY/ZeaQ/KluC9sOg6/QHhJ9sRk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(366004)(376002)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(8936002)(8676002)(4326008)(66899024)(71200400001)(36756003)(53546011)(966005)(26005)(2616005)(6512007)(6506007)(6916009)(64756008)(91956017)(54906003)(66446008)(66556008)(66946007)(66476007)(76116006)(6486002)(316002)(41300700001)(478600001)(38070700009)(5660300002)(2906002)(86362001)(38100700002)(66574015)(122000001)(33656002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <ABD3D4E02CD6E444B3AFCB81F274A755@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB8209
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	385ed4f7-629c-4558-b0d7-08dbf64bccf5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nwvinHbKp19vQWPDlSmnwP/+0lxrD5eG/ZxPkdV4xVbrcfu+VBHY8YB03pTVDZ/I//A8rAO/Y5eHF/1A68HPo2ZSIRQvDjTSOI5OlitUAdXQiOgWI3Lit30biDCe7ogD014JIo3sUVTrmlRTbG1MotT6pbLynMfN6ipY+/tTsTY8im7gCMbtju11CF1PhWrazZde8zVGnVkUKyTKrSC2zQXGpRbsUCdVQDP+byVx5VBbKtTr4+fBGP9tIR5oAku9FvcKNRB9IQYk/NOQMcfOQbmldkFd2azy+M0PxCISDluyRYjSD7t85cWy59Rqh2V+OPkOFVhu1oxkdnR+HxI4kGgj5pQvfkCN6sOHfXBOZLb3yUzRQ5+V7uds9oGAybWwPsXLULM9v9YQUIN6KyGsM9uRP5MiS4oEf/AOi9kWswJ1BqkSedpbPwtjJkQfep47I+47cEYim+fEO5szZrAMR8YKdnijTba6qL6tGlsO+sQ4aWcMnNdfkBjkd8s9XvABZ8hrM9SWn0wrbj3aNmLsIaN+s/7cxQBYEjTPik2qaCJOOVfL1I7xeHD+Zv7XSzOeGTVJi9ajhL8ShLeyTJqL6QLXc/kHaUlvi/RMLdrAeNvRJ9dGIVEU/1ZOAioxttR4VSmfEpvh1t8ms+L5hx+BUSi0YDQ8Q2sATZaGFd/L24v/rn4zROsLoa7Q+ElPob+tGHDcpHCFBIg4761TzEFiC4idkvnSP9J2TUiN9J1ADZspOE3P/2J7fiKflaZCi0VCn8IKmd9lSWqoQ6y6xWFNmQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(346002)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(82310400011)(36840700001)(46966006)(40470700004)(36860700001)(66574015)(83380400001)(966005)(6512007)(82740400003)(40480700001)(86362001)(54906003)(336012)(26005)(2616005)(70586007)(70206006)(316002)(6506007)(81166007)(4326008)(53546011)(356005)(6486002)(478600001)(47076005)(107886003)(8936002)(8676002)(6862004)(40460700003)(5660300002)(33656002)(66899024)(41300700001)(36756003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 11:09:35.6085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ee97b0-be6a-4447-883d-08dbf64bd4d6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6066
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 11:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107238

V2h5IGFyZSB5b3UgdXBncmFkaW5nIHRvIGEgcmVsZWFzZSBjYW5kaWRhdGU/DQoNClJvc3MNCg0K
PiBPbiA2IERlYyAyMDIzLCBhdCAwNjozOSwgWm9sdGFuIEJvc3pvcm1lbnlpIHZpYSBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnIDx6Ym9zem9yPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gDQo+IHplbml0eSA0LjAgbm93IHVzZXMgR1RLNCBhbmQgR1RLNC1iYXNlZCB3
ZWJraXRndGsuDQo+IA0KPiBUaGUgcGVybCBiYXNlZCBnZGlhbG9nIGlzIG5vIG1vcmUsIGl0cyBz
dWJwYWNrYWdlIHdvdWxkIGJlIGVtcHR5Lg0KPiBEb24ndCB0cnkgdG8gZ2VuZXJhdGUgdGhpcyBz
dWJwYWNrYWdlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWm9sdMOhbiBCw7ZzesO2cm3DqW55aSA8
emJvc3pvckBnbWFpbC5jb20+DQo+IC0tLQ0KPiB2MjogRml4IEdUS0lDX1ZFUlNJT04gc28gZ3Rr
KzMtbmF0aXZlIGlzIG5vdCBidWlsdCBhbmQgcHVsbGVkDQo+IA0KPiAuLi50by1hdm9pZC1wb2lu
dGluZy10by1idWlsZC1zeXN0ZW0tcy0ucGF0Y2ggfCAyOCAtLS0tLS0tLS0tLS0tLS0tLS0tDQo+
IC4uLi97emVuaXR5XzMuNDQuMi5iYiA9PiB6ZW5pdHlfMy45OS45MS5iYn0gICB8IDE2ICsrKysr
LS0tLS0tDQo+IDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzNyBkZWxldGlvbnMo
LSkNCj4gZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEtZ25vbWUvcmVjaXBlcy1nbm9tZS96ZW5pdHkv
emVuaXR5LzAwMDEtSGFyY29kZS1zaGViYW5nLXRvLWF2b2lkLXBvaW50aW5nLXRvLWJ1aWxkLXN5
c3RlbS1zLS5wYXRjaA0KPiByZW5hbWUgbWV0YS1nbm9tZS9yZWNpcGVzLWdub21lL3plbml0eS97
emVuaXR5XzMuNDQuMi5iYiA9PiB6ZW5pdHlfMy45OS45MS5iYn0gKDYyJSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9tZXRhLWdub21lL3JlY2lwZXMtZ25vbWUvemVuaXR5L3plbml0eS8wMDAxLUhhcmNv
ZGUtc2hlYmFuZy10by1hdm9pZC1wb2ludGluZy10by1idWlsZC1zeXN0ZW0tcy0ucGF0Y2ggYi9t
ZXRhLWdub21lL3JlY2lwZXMtZ25vbWUvemVuaXR5L3plbml0eS8wMDAxLUhhcmNvZGUtc2hlYmFu
Zy10by1hdm9pZC1wb2ludGluZy10by1idWlsZC1zeXN0ZW0tcy0ucGF0Y2gNCj4gZGVsZXRlZCBm
aWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IGUwNTRmZjc0NC4uMDAwMDAwMDAwDQo+IC0tLSBhL21l
dGEtZ25vbWUvcmVjaXBlcy1nbm9tZS96ZW5pdHkvemVuaXR5LzAwMDEtSGFyY29kZS1zaGViYW5n
LXRvLWF2b2lkLXBvaW50aW5nLXRvLWJ1aWxkLXN5c3RlbS1zLS5wYXRjaA0KPiArKysgL2Rldi9u
dWxsDQo+IEBAIC0xLDI4ICswLDAgQEANCj4gLUZyb20gYzhiZTBkNWU3ZDE3OTMwZDgxOTYzNWRm
NjU3MGZhNTMzMWE1ZGVkZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4gLUZyb206ID0/VVRG
LTg/cT9BbmRyZWFzPTIwTT1DMz1CQ2xsZXI/PSA8c2Nobml0emVsdG9ueUBnbWFpbC5jb20+DQo+
IC1EYXRlOiBNb24sIDEwIEphbiAyMDIyIDIwOjE4OjAwICswMTAwDQo+IC1TdWJqZWN0OiBbUEFU
Q0hdIEhhcmNvZGUgc2hlYmFuZyB0byBhdm9pZCBwb2ludGluZyB0byBidWlsZCBzeXN0ZW0ncyBw
ZXJsDQo+IC1NSU1FLVZlcnNpb246IDEuMA0KPiAtQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBj
aGFyc2V0PVVURi04DQo+IC1Db250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0DQo+IC0NCj4g
LVVwc3RyZWFtLVN0YXR1czogUGVuZGluZw0KPiAtDQo+IC1TaWduZWQtb2ZmLWJ5OiBBbmRyZWFz
IE3DvGxsZXIgPHNjaG5pdHplbHRvbnlAZ21haWwuY29tPg0KPiAtLS0tDQo+IC0gc3JjL2dkaWFs
b2cuaW4gfCAyICstDQo+IC0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pDQo+IC0NCj4gLWRpZmYgLS1naXQgYS9zcmMvZ2RpYWxvZy5pbiBiL3NyYy9nZGlhbG9n
LmluDQo+IC1pbmRleCAyZmM0NjMzLi5mODkxODYxIDEwMDc1NQ0KPiAtLS0tIGEvc3JjL2dkaWFs
b2cuaW4NCj4gLSsrKyBiL3NyYy9nZGlhbG9nLmluDQo+IC1AQCAtMSw0ICsxLDQgQEANCj4gLS0j
IUBQRVJMQA0KPiAtKyMhL3Vzci9iaW4vZW52IHBlcmwNCj4gLSANCj4gLSAjIGdkaWFsb2cgLT4g
emVuaXR5IGNvbnZlcnNpb24gd3JhcHBlcg0KPiAtICMNCj4gLS0tIA0KPiAtMi4zMS4xDQo+IC0N
Cj4gZGlmZiAtLWdpdCBhL21ldGEtZ25vbWUvcmVjaXBlcy1nbm9tZS96ZW5pdHkvemVuaXR5XzMu
NDQuMi5iYiBiL21ldGEtZ25vbWUvcmVjaXBlcy1nbm9tZS96ZW5pdHkvemVuaXR5XzMuOTkuOTEu
YmINCj4gc2ltaWxhcml0eSBpbmRleCA2MiUNCj4gcmVuYW1lIGZyb20gbWV0YS1nbm9tZS9yZWNp
cGVzLWdub21lL3plbml0eS96ZW5pdHlfMy40NC4yLmJiDQo+IHJlbmFtZSB0byBtZXRhLWdub21l
L3JlY2lwZXMtZ25vbWUvemVuaXR5L3plbml0eV8zLjk5LjkxLmJiDQo+IGluZGV4IDkyYjlmNjY1
NS4uMzRkMzM1ZDI4IDEwMDY0NA0KPiAtLS0gYS9tZXRhLWdub21lL3JlY2lwZXMtZ25vbWUvemVu
aXR5L3plbml0eV8zLjQ0LjIuYmINCj4gKysrIGIvbWV0YS1nbm9tZS9yZWNpcGVzLWdub21lL3pl
bml0eS96ZW5pdHlfMy45OS45MS5iYg0KPiBAQCAtMywyNSArMywyMyBAQCBTRUNUSU9OID0gIngx
MS9nbm9tZSINCj4gTElDRU5TRSA9ICJMR1BMLTIuMS1vci1sYXRlciINCj4gTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUx
NmMiDQo+IA0KPiAtDQo+IGluaGVyaXQgZ25vbWViYXNlIHBrZ2NvbmZpZyBpdHN0b29sIGd0ay1p
Y29uLWNhY2hlIGZlYXR1cmVzX2NoZWNrIGdldHRleHQNCj4gDQo+IERFUEVORFMgPSAiIFwNCj4g
ICAgIGRlc2t0b3AtZmlsZS11dGlscy1uYXRpdmUgXA0KPiArICAgIGhlbHAybWFuLW5hdGl2ZSBc
DQo+ICAgICBoaWNvbG9yLWljb24tdGhlbWUgXA0KPiAtICAgIGd0ayszIFwNCj4gLSAgICBndGsr
My1uYXRpdmUgXA0KPiArICAgIGd0azQgXA0KPiArICAgIGd0azQtbmF0aXZlIFwNCj4gKyAgICBs
aWJhZHdhaXRhIFwNCj4gIg0KPiANCj4gQU5ZX09GX0RJU1RST19GRUFUVVJFUyA9ICIke0dUSzNE
SVNUUk9GRUFUVVJFU30iDQo+ICtHVEtJQ19WRVJTSU9OID0gIjQiDQo+IA0KPiAtU1JDX1VSSVth
cmNoaXZlLnNoYTI1NnN1bV0gPSAiM2ZiNWI4YjEwNDRkM2QxMjkyNjJkM2M1NGNmMjIwZWI3Zjc2
YmMyMWJkNWFjNmQ5NmVjMTE1Y2QzNTE4MzAwZSINCj4gLVNSQ19VUkkgKz0gImZpbGU6Ly8wMDAx
LUhhcmNvZGUtc2hlYmFuZy10by1hdm9pZC1wb2ludGluZy10by1idWlsZC1zeXN0ZW0tcy0ucGF0
Y2giDQo+ICtTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJlOGM4MGFlMWUyYTRkN2IyZWIz
OWM0ZmI4YzRiMTQ4MTQ1MzBmMzc5OTdiNDlmNGMxODRiZjJmNzEyNGQ4NGQyIg0KPiANCj4gUEFD
S0FHRUNPTkZJRyA/PSAid2Via2l0Z3RrIg0KPiAtUEFDS0FHRUNPTkZJR1t3ZWJraXRndGtdID0g
Ii1Ed2Via2l0Z3RrPXRydWUsLUR3ZWJraXRndGs9ZmFsc2Usd2Via2l0Z3RrMyINCj4gK1BBQ0tB
R0VDT05GSUdbd2Via2l0Z3RrXSA9ICItRHdlYmtpdGd0az10cnVlLC1Ed2Via2l0Z3RrPWZhbHNl
LHdlYmtpdGd0ayINCj4gDQo+IC1QQUNLQUdFUyA9KyAiJHtQTn0tZ2RpYWxvZyINCj4gLUZJTEVT
OiR7UE59LWdkaWFsb2cgPSAiJHtiaW5kaXJ9L2dkaWFsb2ciDQo+IEZJTEVTOiR7UE59LWRvYyA9
ICIke2RhdGFkaXJ9L21hbiAke2RhdGFkaXJ9L2hlbHAiDQo+IC1SREVQRU5EUzoke1BOfS1nZGlh
bG9nICs9ICJwZXJsIg0KPiAtLSANCj4gMi40My4wDQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0t
PS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMg
Z3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTA3MjM1KTogaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvMTA3MjM1DQo+IE11dGUg
VGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEwMzAwODY5Ni82
ODc1ODg4DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL3Vuc3ViIFtyb3NzLmJ1cnRvbkBhcm0uY29tXQ0KPiAt
PS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiANCg0K

