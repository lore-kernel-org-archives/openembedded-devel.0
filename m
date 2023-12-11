Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B6D9C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 11:42:13 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.72])
 by mx.groups.io with SMTP id smtpd.web11.6450.1702294927627539461
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Dec 2023 03:42:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=NSlrYslY;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=NSlrYslY;
 spf=pass (domain: arm.com, ip: 40.107.13.72, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=n68Qe3NgjbAGDBI6aEfut14vH14EC7WV5rAPVz/ixTaw+ZG4BzkRn933UqLBS1sa5HACu/7jTSFbVTQRNILDZZX2PTtDU32iuNnkV549kMIiQZUPnEly0xvnJAEDnVyR87zlaCfbsbSGHf0wE4dNOO3P4UMsstQcsOOaFtEY45yBj5+TcRfMe4UGEtp74OCOfwQrptXi0FHT11D5Pm1p9OwB7tZ9YiOSRh7CKhGMh1RsBIX9d0JVuwMXck/XhRFr6aMAVAcopFgdM2EhUAegFfWKDZVL1HzGgh9y7TFFTT+tNq03E7zrEKkpFowO8IF5czigRwnjLR7RYajxOhaNwg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgsydDeBE8cEAKujvcdLGvFp/xYWxkGpZQ1BFdohwSM=;
 b=iN/bo1Mz35I4cZCKZSnqv8E90p5bXIqCb9qvjb//rQwXb7zwLrwfmf3tyuIcxNgnST7gGohtGNLizCTMfdGK27vPVjCnxr9Ygmn4HRF5aU+U187bud8fNI3Yj/TbSHljX73KPZUlU+GDzihhXK/PTGC7VY+3sZBgjTcbFX4INuQUhr975jYFnv+k4Sdqr0KKvQKlPpKAbRmstsRFaJ1wXQuX/QvLNFtHx7AjNJcr4aiTs38BSQ/YqpezOL/Id8Xl/fcQYjbW/ZeftCWbbSo6w6EftCBKnbOuN2j2KTSWSAiRX/q/zJv3lHp4cPNNJzFKM8G0bC3msZQNGs6+JGB7OA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgsydDeBE8cEAKujvcdLGvFp/xYWxkGpZQ1BFdohwSM=;
 b=NSlrYslYkVbk0FBuCCBryodUVAmNAjlF3DL/jcex/0GTJ1ii4vsquLfR0xyWqf4XnQoTGOrNiJf7m+Ai14NZ0Cktrg1+UGs1p6jOpm8Sfrjfo/nb26dMhOYJsVbsC6sCQYGWmjOjdoe+nlWWqqJh4Y9CgrVy4GKaW0dy+14uAbA=
Received: from AS9P250CA0010.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::13)
 by AS8PR08MB8112.eurprd08.prod.outlook.com (2603:10a6:20b:54e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 11:42:03 +0000
Received: from AMS0EPF000001A8.eurprd05.prod.outlook.com
 (2603:10a6:20b:532:cafe::34) by AS9P250CA0010.outlook.office365.com
 (2603:10a6:20b:532::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 11:42:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A8.mail.protection.outlook.com (10.167.16.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023 11:42:03 +0000
Received: ("Tessian outbound 5d213238733f:v228"); Mon, 11 Dec 2023 11:42:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ae67e6cb3282c42c
X-CR-MTA-TID: 64aa7808
Received: from ee4b2eb11c0f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6CF2D1D0-0DAA-41CB-A963-30B939C0E494.1;
	Mon, 11 Dec 2023 11:41:57 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ee4b2eb11c0f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 11 Dec 2023 11:41:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThWi9yFOBwRpAE3k07FwH47pHaN8AjKVBa+UzSf2WLwPBpVsMXdWGb+yLx++wmWNzQpTf24e4pUWjbIBLvVXAv+FXaX2zxuiqQrxu7okTArE4Q1hFWWCrEXz90tQ81lIUdIqC5rhxrGNdhqiULL+VhG8yv43mbvEJJzAj/aMoE+XLR8SaNlQHVliNQO6bKHoP/6X336QautBjpSqIjM8ND0y8k4HAcV9Xw2lfZUMmuatVixl1XNfemSRNDhrruknn8Y8Ww0+N0UtSMs+9wUoIBxsuzoCtlL8uwFsfsDjQkudlQrp/WuDJgt8gtLBVv1SMBiES3G6yRP6K9Ts1EQG8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgsydDeBE8cEAKujvcdLGvFp/xYWxkGpZQ1BFdohwSM=;
 b=OxTCDl4R7oYEre3PhydCg7sZMZZYHkZomB2vVVxyurGAOjTdzwYXxDD03p2SAG7gBL+CCcCMjwRH4Y1UZarEwx4fqfXE3mqGQhELxMFYpyJ2Qhb8y2YqWDlRT7RdQ5wEFgRhe+Qsu5r5PDQtTjjT8tgaQ/6zVi6vW0c0m831Ww2CtnLUIac9qANnJd7Pd0S7PMa6IFbT5bodbHWN00oXKHG4yZ0SxIuQGkN6kUq4jx4BIb7x0tz9n+8KAUXzeT5+rOlmJ1OHJ3tC35Q3f8Rc+FbGlBqECvf60g/ar70LjNrjeLqI13gyupKL+bjGYMcfmJDn1V1M/6LNHC/P7BSAGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgsydDeBE8cEAKujvcdLGvFp/xYWxkGpZQ1BFdohwSM=;
 b=NSlrYslYkVbk0FBuCCBryodUVAmNAjlF3DL/jcex/0GTJ1ii4vsquLfR0xyWqf4XnQoTGOrNiJf7m+Ai14NZ0Cktrg1+UGs1p6jOpm8Sfrjfo/nb26dMhOYJsVbsC6sCQYGWmjOjdoe+nlWWqqJh4Y9CgrVy4GKaW0dy+14uAbA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS1PR08MB7658.eurprd08.prod.outlook.com (2603:10a6:20b:479::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 11:41:50 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 11:41:50 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "f_l_k@t-online.de" <f_l_k@t-online.de>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-gnome][PATCH] tracker: dont inherit gsettings
Thread-Topic: [oe] [meta-gnome][PATCH] tracker: dont inherit gsettings
Thread-Index: AQHaKsJm2TClAixLWEG+tTxcg5gjDLCj4cIAgAAQsYCAAAByAIAABJAAgAABB4A=
Date: Mon, 11 Dec 2023 11:41:50 +0000
Message-ID: <9FBC4ED2-02A3-4DF6-B5D5-C396BE4EF003@arm.com>
References: <20231209170903.672584-1-f_l_k@t-online.de>
 <135B2975-FC8C-4280-BA48-1C8644375621@arm.com>
 <F52I5S.RH4KCS811OGK@t-online.de>
 <FD896675-7CF8-4941-8CD4-66141EF2A49A@arm.com>
 <AZ2I5S.WGET5THHKY043@t-online.de>
In-Reply-To: <AZ2I5S.WGET5THHKY043@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS1PR08MB7658:EE_|AMS0EPF000001A8:EE_|AS8PR08MB8112:EE_
X-MS-Office365-Filtering-Correlation-Id: 823c3deb-4f12-45dc-1866-08dbfa3e31ee
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Lhu0n2p/ONNp2gnuy8hVNfaEtFZ6t3GLSPvNThDWW7dPlU110EuHkLKGU3M8qKiy+Abhg2PcjiYyLBQ+IghdW3ttqKhv3K+dqqB0XKnzyfLZPBcFCgoLJLf8x6xcFcdJnk5bsiQhq0/E7kNgs7XkLogs7erUWFGTFMt+r+Z+0cychsVljkpT8wzyzJkXFKxbyahX9s8neorKdoj+K0xvYo4k355Yvj6kFglyLXGjw5oW8nJzmd6r0cywIw47jD5xoJRAbBiK7ma36EO2FL55cPzYoQT+lIKUSArs5Vwfdpd7zVXjb1fJq7WHmXaO31hjOEX2JBS8nEYp+K7M4OH1An/ycRIGhdX6TbFfm2gTVG/ASnti2eirUvKUfjdd78KR5M6dRORGiI7/8AMbyBjES2Y8maKGY3JvuQoczi096ecT6IgXggxtPNhRHuji3VbJXtP3zSQ09LF5pif3Rrov4yia4xoGETeVCXj8ua+g6/XRvUMPlnOQQNBp+CBaIILF2qpgECSYWlwQ4garLHmCRNwPwa65X9oVj4ZCxukMchaDPlws5Ky6mhqe1mAT/dgD9tQ3q5ei4ZrplkGq3pbpc71bkUWNLryfHwV1/IE4JI4k81rMNJJhKKcLcmvkdcoZdPJUEpe/XtuwHko7APf/BP/3RiR15Ix1voZ42E+yxzRgQzo0Nm+Lw41DDPEAtQLH
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(376002)(136003)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(66446008)(36756003)(53546011)(6506007)(2906002)(478600001)(71200400001)(83380400001)(26005)(6512007)(2616005)(6486002)(4326008)(8936002)(8676002)(5660300002)(38070700009)(4744005)(91956017)(66946007)(76116006)(6916009)(64756008)(316002)(33656002)(38100700002)(122000001)(86362001)(66476007)(66556008)(41300700001)(192303002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D293EEC6B2CD894A9D3EA39B06D4E39D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7658
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ef012a1a-9a49-4ed1-47f4-08dbfa3e29e9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hXN6rwcXbLD9AVxyStdHmNbInZk2gCTmsjU7gG6gQ9ponBCbxwNAK5rvxTRBleHlqfl62IyhDgQ5X2k8Uf74ICqfpP8Oj6KrZq/f2sZEKFiNPy/m9uYC602iF/htVSALVLAU0dDOEPmxxgNlOcZILBulOU8+WArBmFi/C/zsnY4++d2YW/Ed4Vhym3hOdVwjC78OsCFyOQ1dJIF2/TqLQQ/Qub3TvhebmNq1eQjY7l8WVTmImnI+PQSOTwT0wULa3hhsoxRomO4oEz2tnR8SUDRskoGvzZCO8W1IVLIc3qX9RlM2T9w5wiiKfTM6dPXo87ot7QV2/paqNo9Rkd8wNjBFU+zb9/N07ZOPzt6X13RwEENUcgtXfRHWMagQ+n1ALER0xBhAhz852kD43TDE00BQvFv1sUX5D5cXCDLJIfzM8HFmvb+EY4bo5bQfGt3sAndqIwxUj+RjJb3c/czwrBKVE3VOF2/mpSnig0oPNfteMY/VIWeoNYretp8lsh1VxeMtxKwsB+1pBF1LbsIjpsuMe/tSDlHiwzcsUjGw8Gu99cUs1B44nm6W02UO0BQPtyo4oLqflgJkG/ASKYLsYL5ITyHG6SJ/E5YBI3baCabQUv3fi1DsfWezGQdlQ6viGc+lC3QAaiOMXdVC9Nxo4MAZFewzv9V1EgWP/Y0mniqhhG97ukOq3eU+iTTuvhGhKExh9J9ryJMHMJGiWOUpcsHLxOzMrCQLVi5liNNSky9pLEWQJgCM/WOmVqMckzzIsZOcaAGx5C0Q4lPOdwGQ2A==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(346002)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(82310400011)(36840700001)(40470700004)(46966006)(40460700003)(336012)(26005)(2616005)(6506007)(6512007)(53546011)(36860700001)(83380400001)(47076005)(5660300002)(41300700001)(4744005)(2906002)(4326008)(6862004)(478600001)(6486002)(8676002)(8936002)(70206006)(70586007)(316002)(82740400003)(81166007)(33656002)(86362001)(356005)(36756003)(40480700001)(192303002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 11:42:03.5192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 823c3deb-4f12-45dc-1866-08dbfa3e31ee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8112
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Dec 2023 11:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107327

T24gMTEgRGVjIDIwMjMsIGF0IDExOjM3LCBmX2xfa0B0LW9ubGluZS5kZSB3cm90ZToNCj4gDQo+
IE9uIE1vbiwgRGVjIDExIDIwMjMgYXQgMTE6MjE6NDggQU0gKzAwOjAwOjAwLCBSb3NzIEJ1cnRv
biA8Um9zcy5CdXJ0b25AYXJtLmNvbT4gd3JvdGU6DQo+PiBTbyB0aGUgY2xhc3MgaXMgcmVkdW5k
YW50LCB5ZXMuIENhbiB5b3UgYWxzbyBhZGQgYSBjaGVjayB0byB0aGUgZ3NldHRpbmdzLmJiY2xh
c3Mgc28gaXRzIGhhcm1sZXNzIGluc3RlYWQgb2YgY3Jhc2hpbmc/DQo+IA0KPiANCj4gc29tZXRo
aW5nIGxpa2UgdGhpcz8NCj4gZ3NldHRpbmdzX3Bvc3RpbnN0cm0gKCkgew0KPiBbIC1kICREJHtk
YXRhZGlyfS9nbGliLTIuMC9zY2hlbWFzIF0gJiYgZ2xpYi1jb21waWxlLXNjaGVtYXMgJEQke2Rh
dGFkaXJ9L2dsaWItMi4wL3NjaGVtYXMNCj4gfQ0KPiANCj4gZ2xpYi1jb21waWxlLXNjaGVtYXMg
aGFzbid0IGFuIG9wdGlvbiB0byBub3QgZmFpbCBpZiB0aGUgZGlyZWN0b3J5IHdhcyBub3QgZm91
bmQNCj4gDQo+IEJ1dCBtYXliZSBjcmFzaGluZyBpc24ndCB0aGF0IGJhZC4gSGVscHMgdG8ga2Vl
cCB0aGUgcmVjaXBlcyBtb3JlIGNsZWFuIEkgdGhpbms/DQoNCkNyYXNoaW5nIGlzIGJhZDogZmFp
bGluZyB3aXRoIGFuIGVycm9yIG1lc3NhZ2UgaXMgYmV0dGVyLiAgQW5kIHJlY2lwZXMgbWF5IGhh
dmUgYW4gb3B0aW9uIGZvciBnc2V0dGluZ3MgKHVubGlrZWx5LCBJIGFkbWl0LCBidXQgcG9zc2li
bGUpIGFuZCB0aGVuIHRoZXnigJlsbCBuZWVkIHRvIG1lc3MgYWJvdXQgd2l0aCBjb25kaXRpb25h
bCBpbmhlcml0cy4NCg0KUm9zcw0KDQo=

