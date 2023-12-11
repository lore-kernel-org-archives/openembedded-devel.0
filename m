Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB2EC4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 10:20:52 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.83])
 by mx.groups.io with SMTP id smtpd.web10.5405.1702290047127730520
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Dec 2023 02:20:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=0u2Me0h4;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=0u2Me0h4;
 spf=pass (domain: arm.com, ip: 40.107.21.83, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ZgtLoHqD5SB32tl6wiAPz9+1u4VJsrW4jVGm1hLm4SE/oAN+YPT1RcZTFtqdcCSeYWi67KBrHGsq9398qNVy+cuY7ZNrJkPxlTx165dw4d8lH48ZpWbFupHc48p/emK1XYSRPIwdyH38ntn/JwUxTn910yewymoF/F20s7ZnP1WO8DC7yvpl+3t9W3UTomFNkXfr7FBudsb99xknu2qlAjspuO6u1PrQ0VjWzHBj6JuBX1Ss2zPGyLvwAiKD7udZm022N+GblDFYZix0Q7zpoY/DGj80OLzaCJKxAwOJhG/TEzPwnASOE+CSsNVakXT/gIuaWyJ24EEnQ+IpzXVA8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKd3/HLuSHkI9U64arJ6UwOH/0NVLTh0TXNQe6BiAYg=;
 b=cuTyq5+37/E6jHhJq3jrHeuYCaqbReNfcjJiAvgqsu6wGt4AOaB8n49nskJDucnpMJ4lPP8S3/RzpA+2ee8414Gt4/KeRJJyHrikpcsRkRPzQMlh1Q+2jGK/Fa0xQQ8sECgUWw0nuY8PI6xtXQDcmQvAcan3qtNZai/Z0WujQ+w5NhuNKvKrQJ+tJbf805yEvfXLzSBucsHogARqGJO3sGV464XdfHVt5BZ10+RRcpPYpb7KbDCRYTF1e5y3LESJqBhJyhx9Ru/ezdu0xmg33aFtvXc5vRkGzb2dgyN3RqulS3goQhvzQOG7JLHu/8mxZ5ZNbTXFbSt7AzDmxr2v3A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKd3/HLuSHkI9U64arJ6UwOH/0NVLTh0TXNQe6BiAYg=;
 b=0u2Me0h4Ns1Nn/9gJ84KbWYsEWn4ro2JTEksd7jqA2JqujB0ZgGK7TQjRLg3Dd0lqC9f9ulwlAj9IMdd9bMPHCui9ZDEXy+whbus9vRNui7cExI7CXHRahAICYm1lQjLRSueX/Qy8i3gfPgSA7ZDAesfJFwsYg5lwqffBqgO6xo=
Received: from DB3PR06CA0025.eurprd06.prod.outlook.com (2603:10a6:8:1::38) by
 AS2PR08MB9974.eurprd08.prod.outlook.com (2603:10a6:20b:643::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Mon, 11 Dec
 2023 10:20:41 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:8:1:cafe::a0) by DB3PR06CA0025.outlook.office365.com
 (2603:10a6:8:1::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 10:20:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C6.mail.protection.outlook.com (10.167.8.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.20 via Frontend Transport; Mon, 11 Dec 2023 10:20:39 +0000
Received: ("Tessian outbound 5d213238733f:v228"); Mon, 11 Dec 2023 10:20:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8dfe7d2b9b851cac
X-CR-MTA-TID: 64aa7808
Received: from f2783f2f2592.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 627D8481-8FC3-4F1C-AB89-B54428D30175.1;
	Mon, 11 Dec 2023 10:20:33 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f2783f2f2592.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 11 Dec 2023 10:20:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nrp5lXoX5BOJ3VM8fEfZrKwO4rxiJtQbWGDkzifysVHyuEqxwdXHTW2YUroMkyISncAGfTafXvb8lGROEWqj3IWfLI17iqF9OVueC18j/wyQfFG0qdgz++625SWmizq0OjbUTwjdd3ONV7wfnHlqb30c1VRL/cmFN6eBFniU+V1S4w+Sk2TdTpDWxKnRogX61uY3GbWXP54mTNFNJ7aaOPu1YT6WDLEFr59JasiIdHV3tLX1vRd0OOm09OdoiaXeROOnijzTThwkP7naq7Gd0w1KYykS1KnAkPnMwnlRFh8c7P/ufRiWi9SN4V/lcvDL7D56IVBHB4PqDFzYJ3dg1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKd3/HLuSHkI9U64arJ6UwOH/0NVLTh0TXNQe6BiAYg=;
 b=BCdanlWWV29PN6fzMFIvStYmQSiTROWdkwshHgstz6+b3RX8Z8uuNBkhIvsDmtRe7AnM92ujtYTnLaOFzagmmJGyWQHymlOH4IxEw+/y7iKlV/SwyRVDnVAXafDtWKt4MNqFJEPvN2+IxNYUaYZLrG3DDUA4x4ersPwkwww/35XdujdijNCf0GLzuvuDURAcvztc/NBQdkJjoV+jw+U0YBDhQje97eKdjl+0OeloxAkPoHAlBxf+CCFEIqQ6lPutuMJD+8mHDYDWrXfQCi2VmERvIZ2fxHubZOzYZL5nWupgQouhUusXrwFpLJZ3dQg7yC8JTAOpVDHt+xw9BD17/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKd3/HLuSHkI9U64arJ6UwOH/0NVLTh0TXNQe6BiAYg=;
 b=0u2Me0h4Ns1Nn/9gJ84KbWYsEWn4ro2JTEksd7jqA2JqujB0ZgGK7TQjRLg3Dd0lqC9f9ulwlAj9IMdd9bMPHCui9ZDEXy+whbus9vRNui7cExI7CXHRahAICYm1lQjLRSueX/Qy8i3gfPgSA7ZDAesfJFwsYg5lwqffBqgO6xo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB8PR08MB5516.eurprd08.prod.outlook.com (2603:10a6:10:f9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 10:20:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 10:20:29 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "f_l_k@t-online.de" <f_l_k@t-online.de>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-gnome][PATCH] tracker: dont inherit gsettings
Thread-Topic: [oe] [meta-gnome][PATCH] tracker: dont inherit gsettings
Thread-Index: AQHaKsJm2TClAixLWEG+tTxcg5gjDLCj4cIA
Date: Mon, 11 Dec 2023 10:20:29 +0000
Message-ID: <135B2975-FC8C-4280-BA48-1C8644375621@arm.com>
References: <20231209170903.672584-1-f_l_k@t-online.de>
In-Reply-To: <20231209170903.672584-1-f_l_k@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB8PR08MB5516:EE_|DU2PEPF0001E9C6:EE_|AS2PR08MB9974:EE_
X-MS-Office365-Filtering-Correlation-Id: 10b526ce-0e25-4672-d11a-08dbfa32d2fb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 V4ysxHyDt6bWnIZVYzKBd9HIZ+q/r25GYNYCaJ+qgkhhPwjuPVMvejQIxn8BYTxkBIgb6YwyDTlhzURiM95hvDBEAdHX2iMl5Q+xf1iDBG3/68muExYz/5eRftA+91kFLwt4ikKD0UQAfi/p6ex1WIHYPNaM4KjxCLkrebPuFuj7aEGW8xga1owVnR4bY0HMIUi0xVu4aDroNMScY3dW1/WtF0NyZe9T29Xe+tZzHY4ENSgNsne4092IUV0yDBY9EJ46QnDWjkGLuyy6X6NiYdnFLkwKrwQ3tfrZ/4P0WHOoWnZYbYTF1YMiU0t7NTMLa529geioi7c3mTWVdT6+Q5qXKZkC64Do9Vdk3Ye+Ziw7VwYJU7ectsVYYC5pmLkJPWgF+XOKtUpdGj6ZBgBlq/c3S/592xXVemofvB0wAl1HhUd/x7lKto/FouXsq5QgfZ7gVUxnLc7SMSD0NTUyUeumKiTx5ahgGVWtdtO7ZLNQikuKrjRXEbIwA+w9YDDa0vaG0BQTeEi7xAJ2Zy1rg5HXXZhIAiLqcnN+w9l2yVX1TF+nacse4JGOSV7BJHz4PxOqFmVTpjyqELHv/uzeBtADuRONO/+3OyuJBMQYYiiobCXyEMSUM+6lZKq8H/6a3hBRdxLdztbLOs0MmeWtEBkEgMjVTr6lYVn1N5TLvRnPdOIAg86eA6qgM3SmX+Vf
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(376002)(346002)(366004)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(26005)(2616005)(122000001)(36756003)(38100700002)(33656002)(86362001)(38070700009)(83380400001)(5660300002)(6512007)(71200400001)(53546011)(6506007)(8936002)(8676002)(91956017)(76116006)(66946007)(6486002)(66446008)(66556008)(66476007)(316002)(64756008)(6916009)(2906002)(4744005)(41300700001)(478600001)(4326008)(192303002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0AA659EF02A7547AEECE7F2972433E2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5516
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f3f60404-8d98-473a-00ec-08dbfa32cca5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/ySCXm5huZBFGJqq/bcS74kyby+1kAKZGu9mKGBkvkPU4xDNUb59R1BLbLmN94dRRYsmMzf/eSJu+ziy0HZTvqjuOQN3P4uc4+jySHPqRvjUPCWuHxlMlHOHboAG7pLmAoCsrXXCvk75AxSNbR/XkZfebAdexbyOmXiwI95J2P/JFbCGpjHeufoEuHg48tMd0Qagh/0F+/sNfF2KjlPKw+UdSJORSi2AFD4ExmdR61+Z2RJLtfg7ZpDsMXD713MvrSz28dp09VvVhTcqn9b8u8TegOp1oymYn74PnuVdlFjRzKjE0rebkOgu7pb7sH8WO8ElIzknXUUDCsFrmXlbbWqbkFB/3E0ShP6M7DTEbnXAHK5pscF/ji2zhkG7oBYUGB9Yq0SVAtTjDv+MTSmPsTPGtfXo4NGmC9bB7BbOwoiVOdw/yJIN3rnhf+mt/GBBZopx69b86SOTNLVxnJXsOMGfO01caz6AyzC6ofu4/yKchVTelX8cK5KaWpcSasbojVaVRpiEQixZsiEt5YfMLZPRXIPOWiH8wsEZVnH81T3Q9Ia4QsHyFQimhXqyyrO3q0Bv5Z7tu6JHWkDlWMbh/oQ7lLZB8T6TaX0LegeZN0uszZ+5iPhHlHSoVmTclYxrRVgv025rJ8FAstQyLwoi7nOz863/qtZ8ByIG45MMFdCfgp5bksnJUgM8eVlWKw0pX2aiJvypn9GHp4wjD+iK6WjfeUOcH4qztvC5jWbhkj6hOcWP0GzSmxDwhu6kURdoFl0CPRJ5f5hUhy5XoZq2VA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(376002)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(82310400011)(40470700004)(36840700001)(46966006)(2906002)(4744005)(40460700003)(6486002)(70206006)(6512007)(8936002)(8676002)(4326008)(6862004)(478600001)(5660300002)(86362001)(316002)(70586007)(81166007)(47076005)(83380400001)(33656002)(40480700001)(36860700001)(26005)(82740400003)(36756003)(336012)(356005)(41300700001)(2616005)(53546011)(6506007)(192303002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 10:20:39.8084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b526ce-0e25-4672-d11a-08dbfa32d2fb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9974
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Dec 2023 10:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107322

T24gOSBEZWMgMjAyMywgYXQgMTc6MDksIE1hcmt1cyBWb2xrIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxmX2xfaz10LW9ubGluZS5kZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToN
Cj4gDQo+IHRoaXMgZml4ZXMgYW4gaXNzdWUgSSBlbmNvdW50ZXJlZCBvbiByYXNwYmVycnlwaTQt
NjQgYXQgZG9fcm9vdGZzOg0KPiBFUlJPUjogaHlwcmxhbmQtaW1hZ2UtMS4wLXIwIGRvX3Jvb3Rm
czogUG9zdGluc3RhbGwgc2NyaXB0bGV0cyBvZiBbJ3RyYWNrZXInXSBoYXZlIGZhaWxlZC4gSWYg
dGhlIGludGVudGlvbiBpcyB0byBkZWZlciB0aGVtIHRvIGZpcnN0IGJvb3QsDQo+IHRoZW4gcGxl
YXNlIHBsYWNlIHRoZW0gaW50byBwa2dfcG9zdGluc3Rfb250YXJnZXQ6JHtQTn0gKCkuDQo+IERl
ZmVycmluZyB0byBmaXJzdCBib290IHZpYSAnZXhpdCAxJyBpcyBubyBsb25nZXIgc3VwcG9ydGVk
Lg0KDQpEaWQgeW91IGNvbmZpcm0gdGhhdCB0cmFja2VyIGRvZXNu4oCZdCBpbnN0YWxsIGdzZXR0
aW5ncyBzY2hlbWFzPyAgVGhpcyBzbWVsbHMgbGlrZSBhIHdvcmthcm91bmQgdGhhdCBoYXMgY29s
bGF0ZXJhbCBkYW1hZ2UuDQoNClJvc3MNCg0K

