Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A5AC19F2A
	for <webhook@archiver.kernel.org>; Sat, 30 Jul 2022 19:33:06 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.43])
 by mx.groups.io with SMTP id smtpd.web11.6277.1659209578628484843
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Jul 2022 12:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=kvco1KKg;
 spf=pass (domain: arm.com, ip: 40.107.5.43, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=KNT6TQsXK4y0Lv00O59ESqit/iERkZ8qGSi02feMaOBQlaXcVOwpb/4++4fpjVjrbECnBFjf3fack3V6ino99hWDsRKAbs+p1Cr1axMlX3q165MGdSeRBu77hRvVWypZr8Pg6aJb8sTFdJ9E+faP4pczmANX9BQUNJD5JaKOrisREERWNsxSCbYoD/JCujhgHzbe/a9TctD6Buq4g94hQ6sq9ab4T8TtPkKbX5x3LevOXSPLtkf7zFBvfBxmvZehgF3/RdTe+sHezScfPHfRs+4qsQ6HkRsm0NCozlfEUaMa8yN+pW399MfJ/p+PdZRmX1Iw6UH9xpAl47yO8oJDTQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5jIOv79+2j08Nk8L1oqHJ6gOQ1ANVuUXTQF2INSGNs=;
 b=Qx7wYW65yspqB5b9jcuz/GCKGpgx6XCSmlUBhSSeq4eMyXAt7MVL+9PIoeQoR4o9GeX4RnJA7WtiAf8Mxf5nD1S2sX44Q9PeIRym6aXytmB2e/Ifwhn850JXKAb+6onGNITEAPT1hr1i4V4UPh7o2qUbB8qTqDWZOBwpYPAE3VCY8rPd+xxTzz2G6HDPkjPNntKjqDKSsMw2cwc07J7N2QH1RNxGfNRAxhkzzdv/nVzvygFVsP+cRsnMb3DvsZxmYVR5GsgGhiDPhrqrE7fR2DeFMfz7IHu7vRilaARun4dfAPVYyDUGRAI0AA9FpsMBZlcw4kCdYjqXMqOaFrkZ7A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5jIOv79+2j08Nk8L1oqHJ6gOQ1ANVuUXTQF2INSGNs=;
 b=kvco1KKgkUH6/WmWkwzG27YeH1PSsZkV3qwsepNPvydnG3MsQscjuruVZwIA9tKB2g/mWIFdkgEoZIdoHKgObNp9dFVDZEqZVHikPvRIhhnMjopIrti3fgRsBBahuWg/IOsSTKugTyqqMy3RiiRLV2j6Pc0JFUXs+wpKnSAdKIE=
Received: from AM6P192CA0019.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::32)
 by VI1PR0801MB1648.eurprd08.prod.outlook.com (2603:10a6:800:5b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Sat, 30 Jul
 2022 19:32:53 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::19) by AM6P192CA0019.outlook.office365.com
 (2603:10a6:209:83::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10 via Frontend
 Transport; Sat, 30 Jul 2022 19:32:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12 via Frontend Transport; Sat, 30 Jul 2022 19:32:53 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Sat, 30 Jul 2022 19:32:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: eb428e69bf3d8b60
X-CR-MTA-TID: 64aa7808
Received: from e9eccd97ec4b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0D2247C3-D344-4B66-BC81-EF9439437418.1;
	Sat, 30 Jul 2022 19:32:46 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 e9eccd97ec4b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sat, 30 Jul 2022 19:32:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKJQxCSo+3tTV+xbBk6kk/0iqSGldtnwYiCnCv38SvKaR6TCGLfH4txrBFg1wcirncCaW/Gix4DGjr14n7jlpA2ZSUwIMu/ZFychuDakx749BDVHBAhu+YgFwLVbkG2/P+8RX2pbrKf0F2r1FP5+dyELLkp9HZOZ2O90s04nyMY4dX+l7uuNzALsUnQzBBSuLswTGENCzB5SHdUxnlhUkY2jsCscXyZJGRdvB6wDDWI66KgyW00UxxPIox2dG8m87NjTf4jQJjFnXU2PvzjLxZb1OgwEftalENDRg1U2KoOEvqOjYZLR33KVtGibA7nLlfYvJHYDiDy7AfxgZ3YUcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5jIOv79+2j08Nk8L1oqHJ6gOQ1ANVuUXTQF2INSGNs=;
 b=OTA7E86BrLXLJcS4TTpVplg4/pK3H+PRLlcS0teFsI6gJ/JdPHDrilhYX+gg2JFU0T6L3Sh5iJAvOHDNdIgnjFe8hK1chvNOD+WUxKIyd02K71tO71KW4ZR+IxMkHmMQlbyiSoIJkyCqPhydUplAK9Xrh009vU5csrZQIWIeiVOEixtsgMTTKR5EhqObQO8gvJZCQG7hL8dljPZqknDHV7Wt/8gX3pQ6cNLhqeOtEekp4rWEmERIOu365y9bvFxbfFP6WhgWrOTBWwC0rJPs/5IXpmIwbfio23wnI9vihNPx1KcxpP4wqpdBDiri2/HIa1S1vfEl54punhaC+ijtVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5jIOv79+2j08Nk8L1oqHJ6gOQ1ANVuUXTQF2INSGNs=;
 b=kvco1KKgkUH6/WmWkwzG27YeH1PSsZkV3qwsepNPvydnG3MsQscjuruVZwIA9tKB2g/mWIFdkgEoZIdoHKgObNp9dFVDZEqZVHikPvRIhhnMjopIrti3fgRsBBahuWg/IOsSTKugTyqqMy3RiiRLV2j6Pc0JFUXs+wpKnSAdKIE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB5569.eurprd08.prod.outlook.com (2603:10a6:20b:1de::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10; Sat, 30 Jul
 2022 19:32:45 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::29f3:60b1:981a:c24b]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::29f3:60b1:981a:c24b%7]) with mapi id 15.20.5482.014; Sat, 30 Jul 2022
 19:32:45 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "vince@underview.tech" <vince@underview.tech>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-multimedia][PATCH] vlc: add virtual/vlc alias
Thread-Topic: [oe] [meta-multimedia][PATCH] vlc: add virtual/vlc alias
Thread-Index: AQHYo7w3CerewGuLFEC9Nmdin2iiMq2XTtCA
Date: Sat, 30 Jul 2022 19:32:45 +0000
Message-ID: <8D884F32-A736-495B-B9A0-AB06F11DE265@arm.com>
References: <20220730022855.50524-1-vince@underview.tech>
In-Reply-To: <20220730022855.50524-1-vince@underview.tech>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 619ee9ed-65fb-4130-9c1b-08da72624c00
x-ms-traffictypediagnostic: 
	AM8PR08MB5569:EE_|AM5EUR03FT061:EE_|VI1PR0801MB1648:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 pBgG0QnCZkeuJIGTlEsugA/v75/YYnzeQytspyR733/niEAICMH+a1m/OpL2DywrOxCUOh+cJGhXXucrYuLxaFG1/QOvbikJJ8ELmYziaOyZFOL7aRkysy2MZL0874b6lQ8nza52nkroIdZh3lfsSlTGD7qAgDjdNgeqf2Yq1D6M4hO4iWaaEp1h2ofNI1VO9PjFpEJnUpZkhyQ8J6K0GVSNKpdZ/BdPxd5KlBQZUtBysFzob2vqpax3TgzKrLwm0yV4Klp5VGw7rfNRG+il1aJbDUY13ipK3+V3+muO44iNQfUz43Hi5ly182JurveywV7bIrBTR9ktCGQfz0OemMvf2Ha9olilTNZ9Cr8cp0UYA4w0KBKjO+4FxspT1vlnimQd3twCtZEPcKjvEltQoNizkt1uMeBhMbwu2NJxygvU37kud2GmS9Qc+3Pm8iI1pHvapxwVvrT4vk6fYkhosYmB7S4U8YVNXN/yTa3jY5RDWR58QydueiD2fFBjRJ59Hga8PWIebcdvt6VXsBcWWrNIMprIYWHMwthaT4nGwWZabOK7qyukzhz2dpUDIZviUS2+vuoR3ji0AbuTfUY7CHNmmFeZKpz14r1IUSTwuChOyRiTJ5aK6lVnJ3AKba0T2KYeUJgIVXtzpM2dzPykRjrZq/nsc8NVFdyXdxT+iwlPC5v+oQtYzaf6F/ZRnWHWHBe5eJWtZZJo7Q6K52U/s3lSICUt2UaR3jtFFS79qahnKSk6qd/98RPY9spEANQe9T+8s5fGWHorwlEleOpiXYKLVDYSWwYdqThU3JFRwKUEW48jqSUIH1rzR6w7cZDSLHUTJlRjIPcEgJtyr0dshA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(38100700002)(41300700001)(122000001)(8936002)(478600001)(4744005)(6486002)(38070700005)(186003)(71200400001)(2616005)(91956017)(5660300002)(66476007)(66446008)(64756008)(66556008)(76116006)(66946007)(4326008)(8676002)(6512007)(6506007)(316002)(53546011)(6916009)(2906002)(36756003)(86362001)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE5DA02CFF771342AC6B4A141EE2CCB4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5569
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dd6620e7-37e0-4876-a3eb-08da72624734
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6t5FnlrHw9sbGepUkoAbSWzmh69GuNc7auCRQiCPbQTIV2k2W0tAz7wnWv5gGMMqBxNMXHPPtNw91+uS19GOK6eOI+CO3AC79qjEBsLIDK1AUUxAMgqV0bpdxEWggNQYq196nsm5cKNMfXRjuln+QqASDyv8Rf/okumIK08tlcllmpmAV5h+4KXRIcr4Iz5cflwJ1T5OCsqoaP7DepootsaWWDReCzt1+7SbLWKotAeuMOr4xiwUPnB09JAVawnjVASgBb/IqqubmfMN3Z1d1QJQd3kNgHYDWceNvXhI1EqW80aFmyAOpWKMffq1S2B6536WWhEbI6yQ9TyGe3OaueUtT3BTYlPu9mDtHR83p+uT0q+GcWPPTfzr/cpvNjXJGtE9gtMzsR/V/jemoyRnwcXl3dBX3tGADex4QvuPGaq03mljLWrTT96Au82ZXtFLuU/BvYuUZPEb3EKnI6YiQokYfwdJzDKy9PSz44XfzP0orFbc0DVEsZdxbYGgVx8m9Q7+iqiYd3eIx2tUNT5izuEITxQi2D09AjlpJ0qwBrHo8mWCWlcN0D6LYANlpo6nD8VQBKVXy06mJlJvE8nDNtGB3uhgTJrbjVD/kfbhdpwBIQjy9npwTZ39goH0F0J4f0YCh0DlpFARlUtJfNlqqk1r0ruh8pRfCjkSjcJlmWVm1OLlNKoVsQqaQv/veDktAWbVmTVRgALFc0mrumFqeQkVw0nICxVto//oGFNge4Ij4P5AxqcAKiInNkQjV4mOj14FGR1d0m83G5kv5czdtw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(39850400004)(376002)(346002)(36840700001)(46966006)(5660300002)(8936002)(8676002)(70586007)(4326008)(6486002)(86362001)(6862004)(478600001)(70206006)(40480700001)(36860700001)(6512007)(26005)(33656002)(47076005)(336012)(2616005)(186003)(2906002)(4744005)(82740400003)(356005)(81166007)(41300700001)(6506007)(82310400005)(53546011)(316002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2022 19:32:53.3191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 619ee9ed-65fb-4130-9c1b-08da72624c00
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1648
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Jul 2022 19:33:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98060

PiBPbiAzMCBKdWwgMjAyMiwgYXQgMDM6MjgsIFZpbmNlbnQgRGF2aXMgSnIgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPHZpbmNlPXVuZGVydmlldy50ZWNoQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiANCj4gRm9yIGxheWVycyB0aGF0IHdhbnQgdG8gcHJvdmlkZSB0aGUgYWJp
bGl0eSB0bw0KPiBzZWxlY3QgYSB2ZXJzaW9uIG9mIFZMQy4NCg0KVGhlcmXigJlzIG5vIG5lZWQg
Zm9yIHRoaXMuDQoNCklmIHRoZXJl4oCZcyBqdXN0IGRpZmZlcmVudCB2ZXJzaW9ucywgdGhlbiBo
YXZlIHZsY18xLjIuMy5iYiBhbG9uZ3NpZGUgdmxjXzEuMC4wLmJiIGFuZCB1c2UgUFJFRkVSUkVE
X1ZFUlNJT04uDQoNCklmIHlvdeKAmXZlIGdvdCBhIGZvcmssIHRoZW4ganVzdCBuYW1lIGl0IHZs
Yy1mb29fMS4yLjMuYmIgYW5kIHVzZSBQUkVGRVJSRURfUFJPVklERVIuDQoNClRoZXJl4oCZcyBu
byBuZWVkIHRvIHVzZSB2aXJ0dWFsLyB3aXRoIFBSRUZFUlJFRF9QUk9WSURFUi4gIHZpcnR1YWwv
KiBzaG91bGQgb25seSBiZSB1c2VkIHdoZW4geW91IHdhbnQgYW4gYWJzdHJhY3QgdGhpbmcgYW5k
IHRoZXJlIGFyZSBtYW55IGltcGxlbWVudGF0aW9uLCBzdWNoIGFzIHZpcnR1YWwvbGliYywgd2hp
Y2ggY2FuIGJlIGdsaWJjLCBuZXdsaWIsIG11c2wsIGV0Yy4NCg0KUm9zcw==

