Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C3AC7618A
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 16:26:35 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.59])
 by mx.groups.io with SMTP id smtpd.web10.19255.1679329595109648859
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Mar 2023 09:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=thQmdre0;
 spf=pass (domain: arm.com, ip: 40.107.7.59, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IV78ZnXDadCQ1v3AAUjtGyh+SZOXxeQ+BNSoVmqBPf8=;
 b=thQmdre0hlZ+6HEz0QJlj0WfQVJYKTffys/lWU+HLjS0O98ExhT0iK0+JZuVvOaogHCp+lfzMcqcSKW8Oz3i/4rEunLYlRg+kYvdSWH2kdsoHaBxS/30nUOHozBoqWQn2DdnmIYdKS5GL1JuIKJxkjXj12Jtc2UWVFXKzod0Dyw=
Received: from FR3P281CA0088.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1f::16)
 by AM0PR08MB5505.eurprd08.prod.outlook.com (2603:10a6:208:18e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 16:26:19 +0000
Received: from VI1EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1f:cafe::33) by FR3P281CA0088.outlook.office365.com
 (2603:10a6:d10:1f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.15 via Frontend
 Transport; Mon, 20 Mar 2023 16:26:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT041.mail.protection.outlook.com (100.127.145.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.15 via Frontend Transport; Mon, 20 Mar 2023 16:26:23 +0000
Received: ("Tessian outbound c2bcb4c18c29:v135"); Mon, 20 Mar 2023 16:26:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b8196b5ea884cc90
X-CR-MTA-TID: 64aa7808
Received: from 9142d38c4182.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5D5FB03B-FB2A-477A-A00A-5FE7BAEF34CE.1;
	Mon, 20 Mar 2023 16:26:16 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9142d38c4182.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 20 Mar 2023 16:26:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQaX+iMv8+c7ARYRr4f3CDINXWVEUSDgaGb+acwmwWOKlhpaFbLK4vU0+XKencZCH32NMzkkqnCituRJgKtdP3xYNemOtBMTj370u9s7OQ0zjI8YheXXz5v15hOe+9yPjhsSljU97NOq/L5y7l4Yldgw6+OK/xS7m6I05wcpjOY7hGeO5ZlMcQqcGrhQ0xLTsRR6HxoajdeOkjC5n2SRCqMqeRDAElzMcBBUYMjez5WkLkRZJZQB6uWHCfwG7osHBPYUHBMhKd1xY3PedseF6nQI1LarfNf9zIHgOWssFHLVn5PyTQXtKsk1veCC84aCaWX807a0bzl6z24Ins75Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IV78ZnXDadCQ1v3AAUjtGyh+SZOXxeQ+BNSoVmqBPf8=;
 b=l0RwcSusEl2O7iZN+V9R1UmSyBMXXMLsYsaMRr0hPHiMg3sIkbcy3JQS93jvlWEYEvFh1sZffe82bili1I1mKXubrmWzaYknsRfQRSIjNpwLX86U6ze1LfDDhZwZ8I8SgsNnDigFAqVw33J0huCRk5fDx4lcWMNfGqQfcZmUzRJS4FUWL9neRyco3l1JDbcFfSIAwpfXD3uH7+KQQdBuHseE6Ii0ISh0a9gkOJQsJU7tiPz69QVDV0rprF8Uvx1nNEI3e/LBMkK/5Deg6VFYqfldHMfBz0PnYF0w1TC7AhrFkQs1xjitQYROPxQEPzt/I6R9vXIfKVOrcZ/la71nSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IV78ZnXDadCQ1v3AAUjtGyh+SZOXxeQ+BNSoVmqBPf8=;
 b=thQmdre0hlZ+6HEz0QJlj0WfQVJYKTffys/lWU+HLjS0O98ExhT0iK0+JZuVvOaogHCp+lfzMcqcSKW8Oz3i/4rEunLYlRg+kYvdSWH2kdsoHaBxS/30nUOHozBoqWQn2DdnmIYdKS5GL1JuIKJxkjXj12Jtc2UWVFXKzod0Dyw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9299.eurprd08.prod.outlook.com (2603:10a6:10:41e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 16:26:07 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6178.024; Mon, 20 Mar 2023
 16:26:03 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: =?utf-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH v2 1/4] python_mesonpy.bbclass: New
 class
Thread-Topic: [oe] [meta-python][PATCH v2 1/4] python_mesonpy.bbclass: New
 class
Thread-Index: AQHZWKG983aWdu54VUucEenfeZ6i9a8DxDyAgAAERQCAABeIgA==
Date: Mon, 20 Mar 2023 16:26:03 +0000
Message-ID: <39A18BD0-B6AD-4EF0-806B-578EDB2D3DC4@arm.com>
References: <20230317072547.1031123-1-zboszor@gmail.com>
 <6646B534-8948-4706-9E8A-DAEA4111B694@arm.com>
 <14fa0c81-90ec-18c0-9bbf-a1769cfb743f@gmail.com>
In-Reply-To: <14fa0c81-90ec-18c0-9bbf-a1769cfb743f@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9299:EE_|VI1EUR03FT041:EE_|AM0PR08MB5505:EE_
X-MS-Office365-Filtering-Correlation-Id: 3439836a-ba99-420d-b625-08db295fd876
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ZWQDRzfeJHZTRhtvqitCXFwxEKQvjf1eOW9VYqmiv94TGzdaaX79+Yh+HkmMBPXWlG763bP6BCTYKowoRPHVz0JjFbnQyjLRHOD0OEE4TqpUL3nLFvzXWlxJcgpUekV8hSQAJG4H3WZLXPItOI1YgpOfA7weg6gTz1YdqkLn8FxRuwRn02+VIp171S0n8tAIWbKw9cF/kjRWpB2mW5ManIxqnVwtNEPluAmX25c4XamBgRsNFu24/FwUQAxuU6upp1MydLP/7ZRVhBByEKspEGcTfM1FTxWluBF5aU0zygr4uAOzhzjhYZyFErfYzJQNMKdLx56v380aZNyuncGMIroRmh2QS+vqf8q//qDhLrJ04AnTzumrIh76eIrzUAFsDudL4QIpKsf6ZdfIeY/oh4sjaqdz7ADdrwCxBwxvh6zloGUxqznGP2M8IN6OZL2HWC4xjsNZa2MVxC/ZAkVPdmp1KM9ZyZvZih5obcfKSRbd3KrkDZ0R3oWcf7HKl5LuruGaKJJ3TP80cGwlsUoM+xgzcSRbR5aUeKqEx7qUFpnoTif1xWHlCYaMa/uyoK4YPb1DlWytrg9KcXV0ZTxqKOT4Ob1y2QYwWCYRybEn0PR0PeMCOrcoWGKGiqxp/WPZwSI0NxcUPb3WIlikc/4RNrUT1hWVcjLvaVXU05yIOdQ3AtcxPkS4+UpIE7d2goqzW0KEVOoegW0ygBo5e/xg8IACaIO8+i6z6NPZznlbyLY=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(451199018)(38070700005)(2616005)(6486002)(186003)(53546011)(6506007)(6512007)(26005)(71200400001)(38100700002)(66574015)(478600001)(2906002)(86362001)(122000001)(83380400001)(8936002)(33656002)(316002)(4744005)(8676002)(5660300002)(66556008)(4326008)(66446008)(66476007)(41300700001)(64756008)(6916009)(91956017)(36756003)(76116006)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C36E18BFF97FA147BD988269632FD96C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9299
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8374a897-52c5-4189-1d04-08db295fcc8f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SRUgu0aWZMKtOcnWQ7Edes03+LZxavrYMkhGCr80Xl6p8on+Xipo6tNatcLgc9/g7IKzhgcES4PGac3ImTNYHrGvNeze4bTzs3SkrBR8uWpb1+KOpKbdhTQJd215qb3uOA4pBeO8VbZiPe+q22oKoTXCG38rApMhmwPghstmzvLVcP4r71bxp7Xx3WwgfaYZSxIso6FjScfIxSynmjKCh/UyzLdm1PyUF6KBf0no7ObX5aTMm70lglgPdPxMA8uiGQe8zILxMxATFw0scL6VCrhLGWXtvVCcWqdFPFt5cdy6BzuGbUA+/l6P99z6yeDacS6xJTJf5q9N1a57iIJud6iio9qxLjM4jEJfVWGfPBAeb0BsZinLItnGXosGKDobWPsfi43A/7HQmhmnZ/22crQ1YJFkIpw1IlzrXvgguv3jqQAuMAE1BQjg7FPMfo5T33EpBiwuWEP+RVYMLAUTQmFbaSvnxilxlKxJsf3dhK8HmRtaTrfcLFHG8IQkxfgVkAMTYlkGj8+nJzCpXBq82LwbqweoQ1HdZKBRak7UQkqTn11WJmca6Yg62vm7ZG3vubZ50HWeBWJanBBM6TpEG/zon8Q6si5Zw0fqr4kxcFThRq4xHkAPkyEhERN8WH49WDWx80g66hjXXOoOxMbBJNqz6f164PA7y5EXnSQO/+c52XKRy7EAxM3d/mP0MsjxhFvirtDTcbV/YQovFd5Jww==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(346002)(136003)(39860400002)(451199018)(40470700004)(46966006)(36840700001)(316002)(86362001)(2616005)(83380400001)(66574015)(336012)(356005)(36860700001)(47076005)(82310400005)(81166007)(82740400003)(40460700003)(478600001)(6486002)(53546011)(186003)(40480700001)(26005)(6506007)(36756003)(33656002)(6512007)(2906002)(4744005)(8936002)(6862004)(41300700001)(4326008)(5660300002)(70586007)(70206006)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 16:26:23.2253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3439836a-ba99-420d-b625-08db295fd876
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5505
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Mar 2023 16:26:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101614

T24gMjAgTWFyIDIwMjMsIGF0IDE1OjAxLCBCw7ZzesO2cm3DqW55aSBab2x0w6FuIDx6Ym9zem9y
QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiAyMDIzLiAwMy4gMjAuIDE1OjQ2IGtlbHRlesOpc3Nl
bCwgUm9zcyBCdXJ0b24gw61ydGE6DQo+PiBPbiAxNyBNYXIgMjAyMywgYXQgMDc6MjUsIFpvbHRh
biBCb3N6b3JtZW55aSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8emJvc3pvcj1nbWFpbC5j
b21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+Pj4gK2luaGVyaXQgc2V0dXB0b29s
czMtYmFzZSBweXRob24zdGFyZ2V0Y29uZmlnIHB5dGhvbl9wZXA1MTcgbWVzb24tY29tbW9uDQo+
PiBJIHN0aWxsIGRvbuKAmXQgc2VlIHdoeSB5b3UgbmVlZCB0byBzcGxpdCB0aGUgbWVzb24gY2xh
c3MgdXAuDQo+IA0KPiBTZWUgdGhlIG90aGVyIHRocmVhZC4gRm9yIHNvbWUgcmVhc29uLCBtZXNv
biBhbHdheXMgd2lucw0KPiByZWdhcmRsZXNzIG9mIHRoZSBpbmhlcml0YW5jZSBvcmRlciwgc28g
ZG9fY29uZmlndXJlIGhhcw0KPiBtZXNvbl9kb19jb25maWd1cmUgaW5zdGVhZCBvZiBwZXA1MTdf
ZG9fY29uZmlndXJlLCBldGMuDQoNCkFkZCBhIG5ldyBkb19jb25maWd1cmUgdG8geW91ciBjbGFz
cyB3aGljaCBzaW1wbHkgY2FsbHMgdGhlIHJpZ2h0IG9uZS4NCg0KUm9zcw==

