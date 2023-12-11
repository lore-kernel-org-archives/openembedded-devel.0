Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFBFC4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 11:22:12 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.57])
 by mx.groups.io with SMTP id smtpd.web11.6165.1702293723153436286
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Dec 2023 03:22:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=GIoA7Za/;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=GIoA7Za/;
 spf=pass (domain: arm.com, ip: 40.107.21.57, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=b4cPmLzhGysYOotyr4qY/vIGZ9X8LLQcq8eeJoatDM3d1FOrf2vfnM14l71wc2G1RkgC1t30QdyCtAzYE1Vguv1OYCQAkMmqHrn+4WIKD5NvSViNhe0oXJeUFDrqcU0xYbnmI+nyiPZpmFNujV1ggstlt29orwhVnKlx7LvsrxbpG7Tt3l5je0Bnr4aXjpYdXCSPpabNokPRp25WtHq7Wcfwe6nEHp/xCdCpmxwLSyKnIv8qbLQQ/eDH0EkqC0PzPLRON/WHxU8IFlcBRovQEqScHW5+jQzOeHzJQN229MgKEmbyNkyXECgpkm9odzZxLrrNhOZfQa8gt2m9ZHAw0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFE0RFjgxHYuwKjb2w+xNBNro/d80UzYN3PLVSqIM28=;
 b=hyJvBuNiN0OXEfipmNxBqViXyCzx0IXOcOyQo7iYvxMkPN49qNHvPMLcrDzDxmo4k6j09xLMh70sMtRRjvLJVdUUylDv3BjUAEMKD+2fgZMDN5j5G1+CIW827JXbC3I0kLbuJgPB9B5khhGr8viwkfvNho9g0jQEIcvuYFXUShd/XxUjQ3pjslpL9zuGuf+cTb/gzdB3i+/U+bOaN3j3PzNkFBJHiTW1dFLgI3QCAAoepK5LnIJcyUUggDreMxrDKwUsny1TB5Q/JlRdVcPEqaGvSrBLW6nfOlgwK/cQuujXm1AtSPRf8DOC9Us+lm9bGNb2gSC9ttr+WqK8xXBexA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFE0RFjgxHYuwKjb2w+xNBNro/d80UzYN3PLVSqIM28=;
 b=GIoA7Za/CYfjG2M5ZzSAYPAuDtp2f5e7EgewYOAUbTG0jhYuAxYL/t/ZWyOwc5AYOrozyipvMqhW94cphjIhyP/gjnVQlZRI7o1uEycqLVKd6JyQmLvSex3DRZDe/XRyKqW/uXcZvgV3sVLLikNXVlLLpxqWcxpb2/jiakcd6lU=
Received: from DB7PR03CA0098.eurprd03.prod.outlook.com (2603:10a6:10:72::39)
 by DB9PR08MB6729.eurprd08.prod.outlook.com (2603:10a6:10:2ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 11:21:57 +0000
Received: from DU6PEPF00009529.eurprd02.prod.outlook.com
 (2603:10a6:10:72:cafe::d4) by DB7PR03CA0098.outlook.office365.com
 (2603:10a6:10:72::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 11:21:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009529.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.21 via Frontend Transport; Mon, 11 Dec 2023 11:21:57 +0000
Received: ("Tessian outbound 7671e7ddc218:v228"); Mon, 11 Dec 2023 11:21:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6eb83ec47a75e585
X-CR-MTA-TID: 64aa7808
Received: from ab15977a2b48.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 056ED9D4-7272-4BB8-AC23-A7F9C0B54786.1;
	Mon, 11 Dec 2023 11:21:50 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ab15977a2b48.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 11 Dec 2023 11:21:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YbCsxkyp/Oy9uyy2FJXBVO2X2e2laewEY2XL4BKacVyi+ZxbtfipSQhzB+Xzx37HzmFSBc52109eCPhhDA4jMJ4f4oB1o26pP4qXU7FDvpdqOCdERuVkVPOktHBQYG0QrzpRgyKVdKQwh55t36+FYQKetaSPCs17nGzQ/jq6O+0H1YxPUvqwSo7SIlHmQPOmf6ZyIkUaX5KGuY5dSENC5sfB+EHwrRrA9hwg84Mz3OAXOMn2jkVxFvxxZ2K6wOaKkGNCREzoYQbXYbYKlCMSqeoiePgE7j5YxkA9NC0MqK1zPi3/A5yqYdKFEzCU41tTdZqRyTrfXU+H3zKmqCTF5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFE0RFjgxHYuwKjb2w+xNBNro/d80UzYN3PLVSqIM28=;
 b=M+mDa8v9x1Tww0ympE7UtZVEjxWOTOi3nRYEMekR2cdnWo19PrY0jxC2mi5AtgSoA1y3Ly7rCMAo30XFGQ7fngw4HUuiLoqoYFT9o69f+eSAkzwD0LcLpAyvHFYV+8tpGgm9Q2yyrbcQSeyaDis1yyyOdGGC77N6zi2e8L2mg7OGGK1LwDpFz4WwzqZA1Ibkm87YW0TQXjfOpjEjsFOMujknN5FnGmpDjZflD+OiR1v60qS5Dnlk6xBXIAeTnARoKQY3YzY+y5fWEC6KdNQXTOe4jgAdUmz5jc5CEU/SFj/dUilFXF/gcc986WeE5d922U511LEvQSwkB7m8KARKJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFE0RFjgxHYuwKjb2w+xNBNro/d80UzYN3PLVSqIM28=;
 b=GIoA7Za/CYfjG2M5ZzSAYPAuDtp2f5e7EgewYOAUbTG0jhYuAxYL/t/ZWyOwc5AYOrozyipvMqhW94cphjIhyP/gjnVQlZRI7o1uEycqLVKd6JyQmLvSex3DRZDe/XRyKqW/uXcZvgV3sVLLikNXVlLLpxqWcxpb2/jiakcd6lU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB5633.eurprd08.prod.outlook.com (2603:10a6:20b:1d3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 11:21:48 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 11:21:48 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "f_l_k@t-online.de" <f_l_k@t-online.de>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-gnome][PATCH] tracker: dont inherit gsettings
Thread-Topic: [oe] [meta-gnome][PATCH] tracker: dont inherit gsettings
Thread-Index: AQHaKsJm2TClAixLWEG+tTxcg5gjDLCj4cIAgAAQsYCAAAByAA==
Date: Mon, 11 Dec 2023 11:21:48 +0000
Message-ID: <FD896675-7CF8-4941-8CD4-66141EF2A49A@arm.com>
References: <20231209170903.672584-1-f_l_k@t-online.de>
 <135B2975-FC8C-4280-BA48-1C8644375621@arm.com>
 <F52I5S.RH4KCS811OGK@t-online.de>
In-Reply-To: <F52I5S.RH4KCS811OGK@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB5633:EE_|DU6PEPF00009529:EE_|DB9PR08MB6729:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ff2a0d-2c6b-4d55-d3a9-08dbfa3b632b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 vU4SIibikynTclTO/2VWFllAIiZUnOG5y2NlRqITPkZExG7GUZDSk4joEfNeOjnO8UmX0TW5FC0SNazLMZR7OEbeCFkixHYbHA5JFN0lcGHtjg85htQc9oKTsbmMwsaJGwpH0ZwoHmGIjS4EQtng7JJviPmPu2tC5Jx6eZyp8BRz2sslfq4rkWQ4ff5F8sn6p864sbJiW+0HUp26Bd9tfqOARO8RlQsfYvWQyXtCRxupgXg6DSPF1Ed97PFoO1NQ4ZHv4CAOjnWFMKj4wI/+Qvj1uffkhU6POGo3CrnOk9eu716BfF1oos58gL+SklIpMg8/U5xxdKuQ5U0mw+1dB1lnHx6Xbl3dOVzxZMjNaNMMmYJ7bku9jGRFhy1c+TH98nY4UW/c8NGCMRaNNYqEHrHxWI/5zh2tdKJ7IH32DIyOUt8sUBwyqlZPLPAumgkiDeeLy7eBnMi/hotB8fQBOEv4aMksLY8wwLLS4t5xHs+VCbxtF9Bs4trGQ1GWCLGoWk3PbdaHBjAyQIbz5QsbhAjZcOLSNhlGz+5k4smALxjkXjH1e6pojVz8HjS+R1tHTXFCaH+N2P+HuCB10zITcqpJmmdXv/0jc3pVO2PoeKADfWIdbshtX+sm9A54rfuQuI/F32IWY5MMCtVDxvDsB4GSxEawlInERElckr+63wm93fE87rn9u5Py5Mk2Q3WH
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(376002)(136003)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(66446008)(36756003)(53546011)(6506007)(2906002)(478600001)(71200400001)(83380400001)(26005)(6512007)(2616005)(6486002)(4326008)(8936002)(8676002)(5660300002)(38070700009)(4744005)(91956017)(66946007)(76116006)(6916009)(64756008)(316002)(33656002)(38100700002)(122000001)(86362001)(66476007)(66556008)(41300700001)(192303002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B08B537E4FA445439971486C17E46C62@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5633
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	29cf2dd6-6e7b-424a-ed0c-08dbfa3b5d99
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tV3reOOe4bJ9A0QhGUA8ONSn13Rugk55kAJFy2V8fJT4o381VHiUgtdIbl2fnIvBXaHeb+ydegFXg+JPKnl+tt9Y0CtSwE0ykQk4KHe9m/paLOOh9jcrpFTN/gYzI5TrM+3Rh+pSLVGLF+S60ONBtlMdfzqsneYteWYcRr5UVoekoeoPfk/DwTSWjYlGBNLzTLcnBCViKq8Cp7hxPpOcTbEDrCJ0j8F9VPuUY4N2OYWzu+/1AzqnaVh65I//hR7pF4Jc2FdVRXRgJQz4bmdGAk7KP0gmTzUSnZfJ8FHsz6ms7pqzfIZ+8uuRuZI+uD/z4f7ikP6+7LOhH7aCvXA/sPMJywqayWFqmD1mtAmsUeYjCoZHYpOxMod9ri8YyuNgvkD+l1pPWdWzvUApugEYFW2O9FQ1BsczKNRRjRYxIKrJX3ybcg39n/o+TVVavbE3KNMJXbbJ89uDSyOIyF57Vi6YNVhHKuikhHWbO3zTVjFFqHR8XxhdUDQfg6NTSmhCc8iGp7fPE9pqXkKSXqrhb55ta1smrrBK7hatri27G4fje229VqxE2wqM6VcCuN2yhpjp+0i9PxodoD1wlHsPp+X7qwny2xvDzd4nXUX9l5cvNZbv8/huIyWrrCc5giqZS+ifijmVnyPS4aS0VY1ej6HCL1/L7QxaSJEoHe902lhuZTUNMQCqhOGaCEzujw/8a1EFjcmWsh8qW5y5/ouafaZN615DPQWdRPyQeM7SgoRYsmgQERoteMNFYanCnHsT7LAraO+RsKFeTST1zjRetA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(451199024)(1800799012)(186009)(82310400011)(64100799003)(40470700004)(46966006)(36840700001)(40460700003)(26005)(2616005)(336012)(6506007)(47076005)(6512007)(53546011)(36860700001)(83380400001)(5660300002)(4744005)(41300700001)(2906002)(4326008)(478600001)(6486002)(8676002)(8936002)(70206006)(70586007)(6862004)(316002)(82740400003)(81166007)(86362001)(33656002)(356005)(36756003)(40480700001)(192303002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 11:21:57.6731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ff2a0d-2c6b-4d55-d3a9-08dbfa3b632b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6729
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Dec 2023 11:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107325

T24gMTEgRGVjIDIwMjMsIGF0IDExOjIwLCBmX2xfa0B0LW9ubGluZS5kZSB3cm90ZToNCj4gDQo+
IE9uIE1vbiwgRGVjIDExIDIwMjMgYXQgMTA6MjA6MjkgQU0gKzAwOjAwOjAwLCBSb3NzIEJ1cnRv
biA8Um9zcy5CdXJ0b25AYXJtLmNvbT4gd3JvdGU6DQo+PiBEaWQgeW91IGNvbmZpcm0gdGhhdCB0
cmFja2VyIGRvZXNuwrR0IGluc3RhbGwgZ3NldHRpbmdzIHNjaGVtYXM/IFRoaXMgc21lbGxzIGxp
a2UgYSB3b3JrYXJvdW5kIHRoYXQgaGFzIGNvbGxhdGVyYWwgZGFtYWdlLiBSb3NzDQo+IA0KPiAN
Cj4gaGFkIGEgbG9vayBhdCBnc2V0dGluZ3MuYmJjbGFzcyBhbmQgaXQgd2FudHMgdG8gcnVuIA0K
PiANCj4gZ3NldHRpbmdzX3Bvc3RpbnN0cm0gKCkgew0KPiBnbGliLWNvbXBpbGUtc2NoZW1hcyAk
RCR7ZGF0YWRpcn0vZ2xpYi0yLjAvc2NoZW1hcw0KPiB9DQo+IA0KPiANCj4gJHtEfSR7ZGF0YWRp
cn0vZ2xpYi0yLjAgaXMgbm90IGluc3RhbGxlZCBieSB0cmFja2VyDQo+IA0KPiANCj4gSSBndWVz
cyB0aGF0cyB0aGUgcmVhc29uIGZvciBleGl0IDENCg0KU28gdGhlIGNsYXNzIGlzIHJlZHVuZGFu
dCwgeWVzLiAgQ2FuIHlvdSBhbHNvIGFkZCBhIGNoZWNrIHRvIHRoZSBnc2V0dGluZ3MuYmJjbGFz
cyBzbyBpdHMgaGFybWxlc3MgaW5zdGVhZCBvZiBjcmFzaGluZz8NCg0KUm9zcw==

