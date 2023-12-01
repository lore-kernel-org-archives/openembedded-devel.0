Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C16C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:09:26 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.79])
 by mx.groups.io with SMTP id smtpd.web10.22195.1701436164434987155
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:09:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Duu4bAks;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Duu4bAks;
 spf=pass (domain: arm.com, ip: 40.107.7.79, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FW7r/ZnV/pL7AgkkkcwhNRdq+EGJBE+hUPcEGrWUmh86VZDJ4lnM/jWpDyPNgCUmuNLZg2bndiZEPsP6O3yPjHSZUpXopblEe4D8ZS6m/x7o+kg1xEw55q3uo5jmks+oikt1JTYYUW1Xdz3cKryLrANUfHP3nmMVpuys1z1wm3utMjJP48pHNQl//PNyF4oVAIKnxHJh5Fae9/NPq7J0fes6FBcBIORxtXIWnYNs5sMGNOoIu1xO4FDBMFGFVsxF7O+1vZ1Gs76J2f+K9cOhQbf/V+a0OGENfFOOJPMehcIqF/3PA+FXewB+cjNTOfyRU7YXfNvZmHicLGu3vyJSPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MeqHDWzObd1Vycl95jJtmYpOH5nO7g+vWu62phPuN4k=;
 b=VM3FjQ7j1h9LyGSs0heoXk0bTeGQokdQbsItArqTzacsQDwe/I3FId9bCQwLNWyLhFNRDij7Be36mABrMOQW69DcamzrEnv8kAkxglVEn0UA+W6PGDtTx+QTEIS2e06V/boAShwcxwTcPx5OD2MqR3wq0dX7ORu+RiYclJIo86ZQiKlWzKhLODT29HqahiRAIRkbpIr/tmNos1iRXAUD4uvEvHctOvo/YIKp2eD4Ml38p5PR6vLGYvUYwWJ3ot0AsDv4KAgQ5x5Gp1lfe6crX7tzyO1am8vPa1VOWkwmEa+ax7HchUv7dUCmpIQA2eKLdJfLKJ66Obtb7FP2bljuTw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MeqHDWzObd1Vycl95jJtmYpOH5nO7g+vWu62phPuN4k=;
 b=Duu4bAksjjL3r0U7m/2efHm6mPonYTlBj5pJm0qfKv/nNYoCA4/s58fwAnQMenxuYhFiigrNlWJ01BY5tSF2SUsE4PxQtiXu/CniOXfJl2ZJkv6kjFpWosj3MQiFSKlhWKat8SD/RL0U3fR0EbRopWAIYhBY/DbqdD9djO7aHzg=
Received: from AS4P195CA0011.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::15)
 by DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Fri, 1 Dec
 2023 13:09:19 +0000
Received: from AM3PEPF0000A79B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::64) by AS4P195CA0011.outlook.office365.com
 (2603:10a6:20b:5e2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24 via Frontend
 Transport; Fri, 1 Dec 2023 13:09:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A79B.mail.protection.outlook.com (10.167.16.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.17 via Frontend Transport; Fri, 1 Dec 2023 13:09:19 +0000
Received: ("Tessian outbound e243565b0037:v228"); Fri, 01 Dec 2023 13:09:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e57111da5afee1c8
X-CR-MTA-TID: 64aa7808
Received: from 4cc7c8cb2dec.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 36542511-6B00-4CB2-BA58-345648CFCF03.1;
	Fri, 01 Dec 2023 13:09:13 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4cc7c8cb2dec.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 01 Dec 2023 13:09:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxVySE8ibLaCAch2hCa8kDZQqlUx7dnH/AWmBz9MlFaWH/bsCZwQf/iWyK0rHQLjuEtcW0LR3LUiO2n8Nq69/NFjisJgZ51KbTu9sEmoQ7adXDuigb5gIJrKWFxApLJYYppYqgLtsEL0M1T0NXhS910lDUli/fknhQy6doNleCDuiniq1iQSCYWGTSZnF6CfANnCcEqUTSzXSg01AoFHI+4M/WcpswFMR6CBWlFa/2R2Vgy03RLxx/9tKicdeULfHO7YYb8uYbZVbGZse/DL/W1weEWeCaQWrU5U3wJ9fEOGZBPHRLiz/Y9nCzG0lQZXIiA8ctcAstk1Hmqwzwxw/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MeqHDWzObd1Vycl95jJtmYpOH5nO7g+vWu62phPuN4k=;
 b=gWX4pewELTKvYelv/CJ35br85K54o62u11MGm9STt1d1Flu1MriUccgpv0jz0SltRPMB2Y/kzViYMAfV8GpONoR9dLeYnPFGle+7gYjJ+K2ClZCfQpQmtw3DfOOpzvk56y6JYQeLi++7KtVuU6h6WChKlXvSgeFh9S+z7n7bBJGN6wZCvW7ynr3ZWBwRx9kCL7CHS4kdm5BnaCXBkuVbTezz6DYOHAQwyV162HGo+otTDFHvv1AxQqaForSN0ZHmAUM1bPk6IMsl0gdr6Db4W2ufZZHiw70mlIt9xWPpmV6KHf4ChfO6oppSXThRfraPdXXbBR3nvfj5ZoZGHCxKXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MeqHDWzObd1Vycl95jJtmYpOH5nO7g+vWu62phPuN4k=;
 b=Duu4bAksjjL3r0U7m/2efHm6mPonYTlBj5pJm0qfKv/nNYoCA4/s58fwAnQMenxuYhFiigrNlWJ01BY5tSF2SUsE4PxQtiXu/CniOXfJl2ZJkv6kjFpWosj3MQiFSKlhWKat8SD/RL0U3fR0EbRopWAIYhBY/DbqdD9djO7aHzg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA4PR08MB6095.eurprd08.prod.outlook.com (2603:10a6:102:ec::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.26; Fri, 1 Dec
 2023 13:09:10 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7046.024; Fri, 1 Dec 2023
 13:09:10 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alperyasinak1@gmail.com" <alperyasinak1@gmail.com>
CC: Khem Raj <raj.khem@gmail.com>, openembedded-devel
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] libpwquality: upgrade 1.4.4 -> 1.4.5
Thread-Topic: [oe] [meta-oe][PATCH] libpwquality: upgrade 1.4.4 -> 1.4.5
Thread-Index: AQHaI9NNO1SfPA97Mkexc3KiRONXcLCTnV+AgACXjICAADKGgA==
Date: Fri, 1 Dec 2023 13:09:10 +0000
Message-ID: <B81FA7E6-F572-4B7B-847C-6B6B1BCFBEF7@arm.com>
References: <20231130212143.3192153-1-alperyasinak1@gmail.com>
 <CAMKF1spC5zOVEkhbk6fUqw33zeWTHVMXgMX5eY1wkx+eNYOPSQ@mail.gmail.com>
 <CAGpma=4FFBa0hLYhxg3W3aPk-D5kO9ODSAHwtbFL0=rZOyEvsA@mail.gmail.com>
In-Reply-To: 
 <CAGpma=4FFBa0hLYhxg3W3aPk-D5kO9ODSAHwtbFL0=rZOyEvsA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA4PR08MB6095:EE_|AM3PEPF0000A79B:EE_|DU2PR08MB10037:EE_
X-MS-Office365-Filtering-Correlation-Id: ca6007ad-21e1-4c01-d31b-08dbf26eba85
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 MRR/X/mH5Rlbi8NI+n1CNcQ0OmkOrURLOgl+p8s0cNkJw9tH/VGfcInL3B/Kys1TbZKePjm/rNZD5+TRASbnar4hoogxmcP+m1pxCPC44tF3YwWwrI0UjzM1f0AQx3lEutWaDOO9Vvht9m6B+XeUOUoOjGcXqHiajrLWIzvb9cwG+6rawPJ+UBjIjGvHhiX73QkQzrWhEY4f7Ua3OuB7qcULHI3wAhmWFjETPzd9Dt1B4F8jfk7ANJy2SLWTtd2mgg08/aXbr84DXxtT4UH1YdFmRjgDQBaQrnHdeVBmZU61/2iccn5yRGC89utiwY6uPZQCauPBW1G+1Y/HEGRXczYbQYouY0WtvwRS1vqBUoMmhzzg1DKS0Q8iCyHGB3R0FX0gvP1tHUee5wdIazwcdNCDnczs0/iNo41PLkVlVTYs9S5FogHnB7ouuk0EQCsVR33+jZmIXyufznCoUhhHqpehPvPAwUbyYwOvgAjWdylpU4OYUryb5ORmPToavhjpPDJzm6nwmyqNRgB+v5r7P1wOANqU4zoZOokIyvac3Ue9RJnmoHrEPzRs+TWUxW/iyAU/lTExJryUx+NHR2y9ch6w4LdFIs+OeSljNtPd56HSV1ZeIpzI9++7M3v25+2DJ1axcDdF0JUsVdDMKIFsFI2cCFEBQ5rI7H16HSAM0M0=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(396003)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(6512007)(5660300002)(4744005)(38100700002)(86362001)(36756003)(33656002)(2906002)(41300700001)(2616005)(4326008)(966005)(26005)(6486002)(53546011)(71200400001)(8936002)(8676002)(478600001)(6506007)(66556008)(66446008)(64756008)(76116006)(66946007)(66476007)(54906003)(91956017)(316002)(6916009)(122000001)(38070700009)(10126625003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9CC6D6D76E0C034D9F4A1B5A04D42A40@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6095
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	372c5bfc-2e1d-4429-aa7b-08dbf26eb51f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1eUA20/XmzEjLrhkoW3fqjxcoCFjJKUkPjHFmob3dXE/SMKOoMR95pSn0aLmt7OHwd8TJ47h0YB7DgmXNKTrGVAeDDRjkV0wXoJrSSHKjpndAb1I9LwzrMTFRVDsLHEZ7TtLdWKVRbvkh9ZGd2850hPok8Pc2xyheOs7J5JzeyeEbtK7A8FV2U0eZblL4pB2JQt7cHAb3Vxx07C9ETX4ZPtcSJGxsgv+XWYsyNA298NFsdbV2XMK66vtPQt1gy7T23XQ8bNc7iIfLWFuiQLt15k9Cv6bwbViCqKSnF7WP/OFVjykqMZS8SzlpiGt7cq6sx5LpwjsVLODREPg3eYKLYOKApy3izw15ZeGXF7wwADiboSjepTQi5FhjAkXcKn3sSnlbiFx/GfMQiSfzETWOloqZKibYRDUskLuT7rOuQksTmyYBP7RDeBcSQZDreV51ssy5Hpv21NtpvaWvBUKDcQ6ydoZbaZgaGis3RHmTaqREh9ZoXVegjijmtkPpB8yUZ/7+JaIt9EiVvaqK1QY/LTcJgvAr2rErpRcnrk6S56SSKm/6MlLKObRwadrS6ZJ0N3hIpe4FEcVUeo0KSUu3XlobT0Bx/7E6qg64LDnm2ru3fl0b1nUKlFWUGjI4UakK9sH3qjYJEYoszs2mdHnZOQ+uMzM8yKJVvKhQMAL7pUULkMoFBhhk0DADW9s5+m1i09Sum1f+cxHAmUkOf33nYZjp82sUJAXYeC2DKANRpU=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39850400004)(346002)(396003)(376002)(230922051799003)(186009)(1800799012)(82310400011)(451199024)(64100799003)(36840700001)(46966006)(4744005)(36860700001)(54906003)(70206006)(316002)(86362001)(6512007)(41300700001)(2906002)(40480700001)(356005)(81166007)(82740400003)(5660300002)(47076005)(33656002)(70586007)(336012)(26005)(966005)(6486002)(2616005)(36756003)(478600001)(6506007)(53546011)(8936002)(6862004)(8676002)(4326008)(10126625003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 13:09:19.2088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6007ad-21e1-4c01-d31b-08dbf26eba85
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10037
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Dec 2023 13:09:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107188

DQoNCj4gT24gMSBEZWMgMjAyMywgYXQgMTA6MDgsIEFscGVyIEFrIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxhbHBlcnlhc2luYWsxPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gDQo+PiBJ4oCZZCBhbHNvIHRyeSB3aXRob3V0IC1icm9rZW5zZXAgYW5kIHNl
ZWluZyBpZiBpdCB3b3JrcyBub3cuIElmIGl0IHN0aWxsIGRvZXNu4oCZdCB0aGVuIGZpbGluZyBh
IGJ1ZyB1cHN0cmVhbSB3b3VsZCBiZSBzZW5zaWJsZS4NCj4gDQo+IFRyaWVkIHdpdGhvdXQgLWJy
b2tlbnNlcCBidXQgaXQgZGlkbid0IHdvcmsgLT4gaHR0cHM6Ly9wYXN0ZWJpbi5jb20va1NwTWMx
SjkNCj4gSXQgaXMgbG9va2luZyBmb3IgdGhlICIuLi9zcmMvcHdxdWFsaXR5LmgiIGZpbGUgaW4g
YnVpbGQgZGlyZWN0b3J5IGJ1dA0KPiBjYW4ndCBmaW5kIGl0LiAicHdxdWFsaXR5LmgiIGlzIGxv
Y2F0ZWQgYXQgc291cmNlIGRpcmVjdG9yeS4gQiA9DQo+ICIuLi9idWlsZCIsIFMgPSAiLi4vZ2l0
IiBzbyBpZiB3ZSBkbyBCID0gIiR7U30iIChpLmUuIGJyb2tlbnNlcCksIEkNCj4gaW50ZXJwcmV0
ZWQgdGhhdCBpdCBzb2x2ZXMgdGhlIHByb2JsZW0uDQoNClBsZWFzZSBmaWxlIGEgYnVnIHVwc3Ry
ZWFtLCB0aGF04oCZcyBqdXN0IGEgc2lsbHkgbWlzdGFrZSBpbiB0aGVpciBtYWtlZmlsZS4NCg0K
Um9zcw==

