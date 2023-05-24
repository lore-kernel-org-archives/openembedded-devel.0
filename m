Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A61C7EE23
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 14:08:25 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.78])
 by mx.groups.io with SMTP id smtpd.web10.9820.1684937298561535223
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 07:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=zi+MidA0;
 spf=pass (domain: arm.com, ip: 40.107.241.78, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=og0DLcdImeCfN7zMvfQkjGPie4JZqOT64/O0CdjCA1M=;
 b=zi+MidA0fBLVME3QEHl/DFNH/YCd8WtFZtaJXWK1QFpYIwalyatYbysy1f6hl5DqlkyuWWSOqqz/OQvK+6DTu7Zj9g+DnZKmfLOyNlZDn3yXdepkYW/oYIjnkca4qwW+nCjoTJgVfRlDDCQycFcs60fZBZe5PJytc6Uych330zU=
Received: from AS9PR06CA0691.eurprd06.prod.outlook.com (2603:10a6:20b:49f::8)
 by AS8PR08MB6504.eurprd08.prod.outlook.com (2603:10a6:20b:336::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Wed, 24 May
 2023 14:08:15 +0000
Received: from AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49f:cafe::cb) by AS9PR06CA0691.outlook.office365.com
 (2603:10a6:20b:49f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29 via Frontend
 Transport; Wed, 24 May 2023 14:08:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT053.mail.protection.outlook.com (100.127.140.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Wed, 24 May 2023 14:08:15 +0000
Received: ("Tessian outbound 3570909035da:v136"); Wed, 24 May 2023 14:08:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f74102fb8445cae6
X-CR-MTA-TID: 64aa7808
Received: from 42f9df27add0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 429BBC19-303C-4C4F-8F5C-39FDB20A47D6.1;
	Wed, 24 May 2023 14:08:07 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 42f9df27add0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 24 May 2023 14:08:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjcPFYkRg1NEZg5BRYGLODRjKKIld1ZLWboAT7Xb6Q2Ymip1+5y13X0Q7uoRQfdq8VwamRlKbV38L/vOqIKTvw1gNZlTGMqPcmqhGPTQGisjGR7m1kkW3flsnSlJm5HlY+UOFgg8ac1jlqb0oXcnlRUegU3BzLAOU+nJsY9PNtv0tVJtZaqnjFt6zGFbvHldnN4Cbg5EXTK7R78xWKjXXtPugQnBFOPAgOwGYgH2SKnvq85VzEaJHCy4YnlH8xNS0TAV1Aa8/0Tb1hH1p3oRJ5g9SdDURAeNYDKsWTudeXB7uoltamj99DamSGfw652EShuEpxXW+dXmM4sv7tZJEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=og0DLcdImeCfN7zMvfQkjGPie4JZqOT64/O0CdjCA1M=;
 b=ONKRJw+FtE70gz30F9fIoI8Dz9GBysXiiRkjwYKPfduMXaNSUDbILpB3a0W5V6+LF1e0RXTBOVPUUJXZ7MWdMMSjEtFWUEzAR/q3xFKTI15THH+5k9TGD8VL+ewOBp2EjMmKduqkeCwBy1Ipl793PAP+8wI6r5azcP4oTV3ODdnLRDTxZPFpAxlD8tf13cq35u9inpJSQPu2abNhrJHJPQoC7YvFb6qg3n3iG8fDWrXO4Z4iWDgOfEH5TmZJo7K+YbkyNDUGzDzwP+BggL7py77Q7BTPilDkKZJsFVa3X//cuNEFatkBvb3J5AL/Qdu87NttyginC6CW0HppXeRXXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=og0DLcdImeCfN7zMvfQkjGPie4JZqOT64/O0CdjCA1M=;
 b=zi+MidA0fBLVME3QEHl/DFNH/YCd8WtFZtaJXWK1QFpYIwalyatYbysy1f6hl5DqlkyuWWSOqqz/OQvK+6DTu7Zj9g+DnZKmfLOyNlZDn3yXdepkYW/oYIjnkca4qwW+nCjoTJgVfRlDDCQycFcs60fZBZe5PJytc6Uych330zU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5557.eurprd08.prod.outlook.com (2603:10a6:10:1a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Wed, 24 May
 2023 14:08:06 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 14:08:06 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH 3/3] gutenprint: rewrite recipe and update
Thread-Topic: [oe] [PATCH 3/3] gutenprint: rewrite recipe and update
Thread-Index: AQHZjXC+oVajBelol0m9z/q8LwU4ka9o7iuAgACJOIA=
Date: Wed, 24 May 2023 14:08:05 +0000
Message-ID: <4224374C-0C23-4E8B-8520-80EB5B06E597@arm.com>
References: <20230523121831.1877208-1-ross.burton@arm.com>
 <20230523121831.1877208-3-ross.burton@arm.com>
 <CAMKF1spFeyaU-Ym699XLNOV+cFsG4uvBwRdFx5rnke3jYCYCjg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spFeyaU-Ym699XLNOV+cFsG4uvBwRdFx5rnke3jYCYCjg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5557:EE_|AM7EUR03FT053:EE_|AS8PR08MB6504:EE_
X-MS-Office365-Filtering-Correlation-Id: dacbc1be-e727-4797-14d6-08db5c605129
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 cmSj3wpJKcDzWU9gPYBIx6oY+jpixXdfiGk1ZZSGudIW9G8Ibs81TGNpXB1IaDirmcQUMwnu4pLB80Ixa2RC+BhI6Y3JMNfKW3otJP1McQ/cuxFTXj+jXjqMkayVNzIWcBzMod1dgMShav434gLR+0czG24lJO1SPXoSy36i2tfF11NhRwFN8jVdHev04YlKAadk5jmUlFW35brNK/zml8raMtes980uLkQwRBe/xErXP/Dg/nUJMu1xHol3A9gskvlppbRFaT3cX8NNOqbrlAj5xStd5UnkShfk8lYgV1GUv/ZDjsW/ZllobXsEMippowfFg+R4UhmiuknbRmQzOlifdHfHCrEWT2uXKArCJeU9prqRatOMUejSA8PU4FiT48UkzoODLxv++yz6b7LfW7g8AbqSZ7G0D6hMGCEaImcfMecRNCtNdKSlOJcnvMSM2fUATw1YT0jsxuU9yoIKKhwwqbru7geYb6V/6bigfQN1IjAtUHFPbHU5utsk281f7/wAEJJigMY0tSVU8c3MpZO6Oh8ZdkrBveCi7IqAQeYdOc3eNWXcDXJWDf4iZbUE68gE6ZRrPlCjbTveX043g4zdtVU0TRUt3nNX6/eTX+0gyXYtori7maxZ4qoQSeDWSuafjJUDWerU4adtRyb3Xw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199021)(38100700002)(6512007)(83380400001)(53546011)(122000001)(26005)(6506007)(36756003)(2616005)(186003)(2906002)(33656002)(4744005)(316002)(4326008)(71200400001)(64756008)(66476007)(66946007)(76116006)(6916009)(91956017)(66556008)(66446008)(41300700001)(6486002)(478600001)(966005)(38070700005)(8676002)(86362001)(8936002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <702B54D35844D342996BF0A4AA5C5C20@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5557
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3ddd81a0-5edb-44ec-b1c1-08db5c604b81
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r+bnm0nFLSeKNW8VLpIYD2g3O7L+XZg8UIGj728AGv9V1CJlAzi6GzERVTzgH+VhoaEE4mPI/eYZbx5iW7z3SwdJMLxqP7nlxhb/sTbR38FiPN26TbNFxAJBFD8aEIIX20Kzp88DWmF8rtPkxENWJCbHLmjCCGAzNpqnU4EmB1wkkcldo2cdhb+oIzc0whTkxUb8tRwZ6EsUCfY2m65Cxar9LrpAoFV3UkPCZ/4i061nDyWOyIw0RbSSOg4oE2i4o9loPoCs1KTPuNEXgv61qmeaEb10fkq8yTMYzVVwj75KhGVmXtKNnvyssnPz6H9qG7wvaIbESF4jhaaOgKAnb6dTy9SBBTC6yEWDwiILOWAGvuftZFJBbuuaby6gwSUaUy9QtG17MhQZGQWGTAo/hCiEPOc/LbuSNcP16AHUQxA3W4FYEUOznxYCOaxSrUHE2jZaO9HdfUtqrl7JwmYfYmgZXUazagdr70Iwc14BVnePVxJ2epG5VNhjSbZvrQDRfMHC9HBC0B+mYVHBPi2I7zcjSKdstt99xVZR5xl8Ih2D55o+T1ZVrBrjChHruLZUA9gFBLRNMY5f5fjERDholRZPCy/JcDdYm0bL9NOOhqRJsISMIdDsoPC7tJOUiLJ93cVgli8YNfop4wRiCg0eoUbtWP1VhSeLmN9YzQFK4CDrhX253j0y9Kr4+0mqFfYhJOUXOdd11ghICnDjkFIyCp7gZUuDMki255gW1McMvzs=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199021)(40470700004)(36840700001)(46966006)(966005)(36756003)(186003)(2906002)(4744005)(2616005)(5660300002)(40480700001)(8676002)(8936002)(40460700003)(6512007)(6506007)(26005)(53546011)(82310400005)(478600001)(70586007)(70206006)(4326008)(86362001)(6862004)(82740400003)(356005)(41300700001)(6486002)(83380400001)(47076005)(336012)(316002)(81166007)(33656002)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 14:08:15.0694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dacbc1be-e727-4797-14d6-08db5c605129
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6504
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 14:08:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102778

T24gMjQgTWF5IDIwMjMsIGF0IDA2OjU2LCBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3
cm90ZToNCj4gc2VlaW5nIHRoaXMgZXJyb3INCj4gDQo+IGh0dHBzOi8vZXJyb3JzLnlvY3RvcHJv
amVjdC5vcmcvRXJyb3JzL0RldGFpbHMvNzA0ODk1Lw0KDQpObyBpZGVhIGhvdyB0aGlzIHdvcmtz
IGZvciBtZSwgYXMgaXTigJlzIHRyeWluZyB0byBmaW5kIGdsaWItbWtlbnVtcyB0aGF0IGlzbuKA
mXQgaW5zdGFsbGVkIGFueXdoZXJlLiBJ4oCZdmUgYSBmZWVsaW5nIGl0IGlzIHNvbWVob3cgZXNj
YXBpbmcgZnJvbSB0aGUgaG9zdHRvb2xzIGFuZCBmaW5kaW5nIGJpbmFyaWVzIG9uIHRoZSBob3N0
LCB3aGljaCBpcyB3b3JyeWluZy4NCg0KQW55d2F5LCBmaXhlZCB3aXRoIGEgREVQRU5EUy4NCg0K
PiBhbHNvIHRoaXMNCj4gDQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy90
eXBob29uLyMvYnVpbGRlcnMvODgvYnVpbGRzLzI3NjcNCg0KV2VsbCB0aGF04oCZcyBlbWJhcnJh
c3NpbmcuICBSZS1hcnJhbmdlZCBzb21lIGxpbmVzIGJlZm9yZSBwb3N0aW5nIGFuZCBtYW5hZ2Vk
IHRvIGRlbGV0ZSBjcml0aWNhbCB3aGl0ZXNwYWNlLg0KDQp2MiBzZW50LCBzb3JyeS4NCg0KUm9z
cw==

