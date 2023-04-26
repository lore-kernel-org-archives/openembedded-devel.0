Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29745C77B60
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 10:43:38 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.77])
 by mx.groups.io with SMTP id smtpd.web11.4716.1682505810261285688
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Apr 2023 03:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=aBTX2z8m;
 spf=pass (domain: arm.com, ip: 40.107.21.77, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Zfjny8KSxffJreLV9Arb1cCdD4dOfVayEacvzAbh/o=;
 b=aBTX2z8m9VkgQtpc8emY6q/JWZcN3V0P2iCTt1JoeaLRmNCCKsLFWz7E3goGhxGrpOYgx432t2c8ytjjLMFpTKmZmde5jggIm0fkWjcQJLPU9oSCwQBJ4Q328joMW1uqSDOzT9kOyDoRjQ9InKYKcq98gMTqnSn7Z4HZRe+n9UM=
Received: from DB6PR0802CA0048.eurprd08.prod.outlook.com (2603:10a6:4:a3::34)
 by VI1PR08MB5341.eurprd08.prod.outlook.com (2603:10a6:803:135::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 10:43:26 +0000
Received: from DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::15) by DB6PR0802CA0048.outlook.office365.com
 (2603:10a6:4:a3::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34 via Frontend
 Transport; Wed, 26 Apr 2023 10:43:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT039.mail.protection.outlook.com (100.127.142.225) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.20 via Frontend Transport; Wed, 26 Apr 2023 10:43:25 +0000
Received: ("Tessian outbound 945aec65ec65:v136"); Wed, 26 Apr 2023 10:43:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 970f7fcaf82e48bf
X-CR-MTA-TID: 64aa7808
Received: from 9c0611b51c92.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3D54B26D-3828-4FD7-9E0F-7333784D0043.1;
	Wed, 26 Apr 2023 10:43:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9c0611b51c92.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 26 Apr 2023 10:43:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jtxnWJAtAW9cFwOex9gzX94HOpy2i2Mc6fRjUNX+a+vVrSMd//oSXzkg6eeA8IpM2k69kF22eWifD47rsUKmm5c647LmVjEQ4RJcNLxOS52tiLJSOzDln+L0+zSoh31b0auA92eda08IY9u36dE+BnDUPDDEl1Z7/guxbYirgh5R65pTLJFESaSi06lEsgkD/0teTfq6+QS7z7SVffgSMjbGRs97AdMEcaGAELUgqb6xxMosNnSv9p1XssXg/vuJYpIWoc5LlOIVxytHzXPiVOpqTNLTq8OGYw+x7FcUvvt2+Fx6GUBfHutrmJ66fkowXbyeAwBlk7gwi0ksd4CkCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Zfjny8KSxffJreLV9Arb1cCdD4dOfVayEacvzAbh/o=;
 b=G2PTxcAsX2n4CEu8J2pw5LcflWkafr1VarruLrnZ5a55UdVBuOzZEXdii0oozgS04pUPZww1h/gz6JuzwnczQoEMkhhiBXxBwiA1LW3OeTmQjGm5Ns/Pk38PR0yBU0qUZzzg/mwKyKHJmitSybmZFbd6gqLnPy1lio7KeragXVZu9ILdQsbTKMj/mGi2BxPV5PWlZvdDLo1bcz1mVq53z69ortgessKb/psc0v7lxBkWO+ruRsMY0QvisGjYBJFTygmksOEPN+lCEA7mEH4WfkmTpfdGw1YiRRU2DJFA7Y8+XgIwrcNJXrW3P1MECg3IfAx+qY8Mxh3nyuIiCfCy2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Zfjny8KSxffJreLV9Arb1cCdD4dOfVayEacvzAbh/o=;
 b=aBTX2z8m9VkgQtpc8emY6q/JWZcN3V0P2iCTt1JoeaLRmNCCKsLFWz7E3goGhxGrpOYgx432t2c8ytjjLMFpTKmZmde5jggIm0fkWjcQJLPU9oSCwQBJ4Q328joMW1uqSDOzT9kOyDoRjQ9InKYKcq98gMTqnSn7Z4HZRe+n9UM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU2PR08MB10130.eurprd08.prod.outlook.com (2603:10a6:10:493::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Wed, 26 Apr
 2023 10:43:17 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%5]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 10:43:16 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "dev@loewen-email.de" <dev@loewen-email.de>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe] sharutils: Build error
Thread-Topic: [oe] [meta-oe] sharutils: Build error
Thread-Index: AQHZeCiO7mlPUSq8OUaRLvgr0O1KEK89Z3MA
Date: Wed, 26 Apr 2023 10:43:16 +0000
Message-ID: <7045583E-1D29-4184-9057-C2A76EEBFD0C@arm.com>
References: <wgQe.1682504345848324808.V9RJ@lists.openembedded.org>
In-Reply-To: <wgQe.1682504345848324808.V9RJ@lists.openembedded.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU2PR08MB10130:EE_|DBAEUR03FT039:EE_|VI1PR08MB5341:EE_
X-MS-Office365-Filtering-Correlation-Id: cbaa4e1f-9726-4e17-4d72-08db46431080
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 4Nq5T5GZx+xTQQ4QNhMvumDbSEp7APGmIND6QilOx5mS0uPmGaoid/P6V5oZJLEoQy3nE7Mx82YgbEfraZlBuWcjLuPk/NMVJ0qAua21geb4c7uMqbjfeWcyzgL5nVOk9WYeZVLcsF8lPLjBZgpl9m2IWeUjCAt2SG2yEvLaLmVdpbhH9dFFTA4eIhu89IJd9ybdSWG6W9zQubYA8eEzNNtyDB1gAJV98zcVbSbNsQHUkzax46T8p6Q6vEiOR/Tq+0nIE3Agpx04HN+ycyZSobd/ahFVcymvGkAvzc9fB1P/mEkQL6/o3cgp2D1VcWpElZ6cOwJUB7MRhIbbkDWoxOuOMXoUwzmFZMpGvsC0HlJGRddhL48BlA5Pd3bSlhR/A54T9V9igQXdjGsekhP8m2sPBWNBomTz6xTlAtfLNpNUn08mWDjH0sf44cnI4av4cK/fNhdhltxuNPlcwvs4waHIOEJ7Q96MKMIPmcINKEQ5bnpGqun8mXNeyHrTkOYFe3f8adT0WDoFaMUB93O45wLoAIbHeNVdToeh4bXAYqFnjHKmIRgnCJZGreBxI4iiSpbGLw7+qQ7hqsIRwIb41+dryhbAodGu/TWXQJcsi1g8wEIlC2RRG/76qyGW5GakFJR0tsYz5IGS+95qWQ2isQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39850400004)(376002)(136003)(396003)(366004)(451199021)(83380400001)(5660300002)(8676002)(38100700002)(316002)(71200400001)(41300700001)(122000001)(64756008)(66446008)(66946007)(2906002)(2616005)(6916009)(76116006)(66556008)(66476007)(38070700005)(4326008)(33656002)(91956017)(8936002)(478600001)(86362001)(36756003)(6486002)(966005)(186003)(53546011)(26005)(6512007)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E20A407632A88741ADB70E0FC8182155@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10130
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4a80dba5-13ec-4ecc-fc16-08db46430b3f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BiybCHKIhFVrpZz9BgJtbmaK/tssVAFxfYIeLxr7pw3nLZARiwAOyl9YxpCrZxfrOsIGLit5attVA1JGG6qTkqZx9FfwlSVTZdeLwDLkILJ+Y0PW8v3jqyz8XWHJhb4nBGfr2DJFlrFK0ThW90Qu7ni4vz8No9xyOEnIApaoz5y3N6t41PtG33wdXTa2kZ12VbSuXGbgHt3CDf32OT0Cg9UHtG3isNEyXVwBYj7WhcV/18SQh7op4/Gx/vKBCE6sZeCB0AruMy5LUi2odzKXjjjEbvJgURbUDTnGwCSMpYvjaU9KRyKXBlosAJVUjy6zFLDkwb+LIzfP1iXH+k9VW/Jv97n34rqD6pCBOXQHokZ8JqObn0AIl9aGbN6jtYTgGeNJduYN7madXvy5VrD43/9D3GczI+YeYPcp7J2GQRd7ZCKiPFukfn62Kr6/GCSjvW/13DhYuBNiB1ADLyRwqzmUxK/b/PYCI/GnjF9EMiHQBiZC9bbxUy2qEH8Uj2Ag5cXIHlYmIHESdqSw87kjwFbEi+elt/1UhRgqDNm0c9zoUAUQ3mlRkBBx1hqRrHKx2/bGPTdxRvcVeNwgzqbu+Gu1aklmsS1qkEc+LknpibVABp0E3kyZmlv80TxrfAxoCZes1E5h/CvVlg6xflPXp3GiTh2Lv3779FHj6HNnUQDbywbI0XcNzTxwGkpy/AGYpqnj9JkVPEoE2rYcpDyp5wfMBXLPwXzFdIYbLyAa5IY=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(396003)(39850400004)(451199021)(46966006)(36840700001)(40470700004)(53546011)(26005)(6506007)(6512007)(186003)(2616005)(966005)(336012)(40480700001)(82310400005)(83380400001)(36860700001)(6486002)(40460700003)(36756003)(316002)(41300700001)(5660300002)(34070700002)(356005)(82740400003)(2906002)(33656002)(478600001)(86362001)(4326008)(8936002)(47076005)(6862004)(81166007)(70586007)(8676002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 10:43:25.6654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbaa4e1f-9726-4e17-4d72-08db46431080
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5341
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Apr 2023 10:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102196

T24gMjYgQXByIDIwMjMsIGF0IDExOjE5LCBkZXYgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcg
PGRldj1sb2V3ZW4tZW1haWwuZGVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IFRo
ZSBzdHJhbmdlIHRoaW5nIGlzIG1vcmUgdGhhdCBpdCBzZWVtZWQgdG8gd29yayBpbiBteSBob25p
c3RlciBzZXR1cCBiZWZvcmUuIEkgbGF0ZWx5IHVwZGF0ZWQgdGhlIGJ1aWxkIG1hY2hpbmUgZnJv
bSBVYnVudHUgMTguMDQgdG8gVWJ1bnR1IDIyLjA0LiBUaGVuLCB0aGUgYnVpbGQgc3RpbGwgd29y
a2VkLCBidXQgYWZ0ZXIgZGVsZXRpbmcgdGhlIHNzdGF0ZSBjYWNoZSwgaXQgZGlkIG5vdCBidWls
ZCBhZ2FpbiBhbmQgZmFpbGVkIHdpdGggdGhlIGVycm9yIGFib3ZlLiBTbywgc2VlbWluZ2x5LCBz
b21laG93IGl0IHNlZW1lZCB0byBidWlsZCBiZWZvcmUgd2l0aCB0aGUgc2FtZSBtZXRhIGRhdGEu
IFNvIG9uZSBxdWVzdGlvbiBpcyB3aHkgaXQgYWN0dWFsbHkgd29ya2VkIGJlZm9yZS4gTXkgYmVz
dCBndWVzcyBpcyBzb21laG93IHRoYXQgdGhlIGhvc3QgZ2xpYmMgbWlnaHQgaGF2ZSBiZWVuIHRh
a2VuIGludG8gdGhlIGJ1aWxkLCBzaW5jZSBVYnVudHUgMTguMDQgdXNlcyBnbGliYyAyLjI3LCBi
dXQgYXMgc2FpZCwgdGhhdCBpcyBvbmx5IGEgZ3Vlc3MuDQoNClRoYXTigJlzIGEgbmF0aXZlIHJl
Y2lwZSBzbyB0aGUgaG9zdCBnbGliYyBpcyB0aGUgcmVsZXZhbnQgZ2xpYmMsIHRoZSB0YXJnZXQg
Z2xpYmMgaXNu4oCZdCByZWxldmFudC4NCg0KPiAgIExvb2tpbmcgZm9yd2FyZCwgSSB0ZXN0ZXQg
dHdvIGRpZmZlcmVudCBzdHJhdGVnaWVzIHRoYXQgYm90aCBzZWVtZWQgdG8gd29yazoNCj4gICAx
KSBBZGRpbmcgYSBwcmUtY29uZmlndXJlIHN0ZXANCj4gSW5zcGlyZWQgYnkgaHR0cHM6Ly93d3cu
bGludXhmcm9tc2NyYXRjaC5vcmcvYmxmcy92aWV3L3N2bi9nZW5lcmFsL3NoYXJ1dGlscy5odG1s
LCBJIGFkZGVkIHRoZSBmb2xsb3dpbmcgbGluZXMgdG8gdGhlIGJiIGZpbGU6DQo+ICAgZG9fY29u
ZmlndXJlOnByZXBlbmQoKSB7DQo+ICAgICBzZWQgLWkgJ3MvSU9fZnRyeWxvY2tmaWxlL0lPX0VP
Rl9TRUVOLycgJHtXT1JLRElSfS8ke0JQTn0tJHtQVn0vbGliLyouYyAgICAgICAgJiYNCj4gICAg
IGVjaG8gIiNkZWZpbmUgX0lPX0lOX0JBQ0tVUCAweDEwMCIgPj4gJHtXT1JLRElSfS8ke0JQTn0t
JHtQVn0vbGliL3N0ZGlvLWltcGwuaCAmJg0KPiB9DQo+ICAgICAyKSBBZGRpbmcgdGhlIGRlYmlh
biBwYXRjaA0KPiBBcyBhIGJldHRlciBvcHRpb24sIEkgYWRkZWQgdGhlIHBhdGNoIGZyb20gZGVi
aWFuIHRvIHRoZSByZWNpcGUgaW4gbXkgc2V0dXAgYW5kIGl0IGJ1aWx0IGFzIHdlbGwgd2l0aCB0
aGF0Lg0KPiBUaGUgcGF0Y2ggY2FuIGJlIGZvdW5kIGhlcmU6IGh0dHBzOi8vc291cmNlcy5kZWJp
YW4ub3JnL3BhdGNoZXMvc2hhcnV0aWxzLzE6NC4xNS4yLTUvMDItZml4LWZ0YmZzLXdpdGgtZ2xp
YmMtMi4yOC5wYXRjaC8NCj4gICBUaGUgc2Vjb25kIG9wdGlvbiBzZWVtcyBsaWtlIGEgZ29vZCBz
b2x1dGlvbiwgYnV0IEkgdGhpbmsgaXQgc2hvdWxkIGJlIHJlcHJvZHVjZWQgYW5kIHZlcmlmaWVk
IGJ5IHNvbWVvbmUgZWxzZSBhcyB3ZWxsLiBBbHNvLCBJIGRvbid0IGhhdmUga25vd2xlZGdlIHJl
Z2FyZGluZyBsaWNlbnNlcyBldGMgd2hlbiBpdCBjb21lcyB0byBwb3N0aW5nIHBhdGNoZXMgZnJv
bSBvdGhlciBkaXN0cm9zIHRvIE9FLCBzbyBpdCB3b3VsZCBiZSBuaWNlIGlmIHNvbWVvbmUgZWxz
ZSBjb3VsZCBwb3J0IHRoZSBwYXRjaCB0byBPRS4NCg0KQWRkaW5nIHRoZSBwYXRjaCBpcyB0aGUg
YmVzdCBzb2x1dGlvbi4gIFRoZSBwYXRjaCBpcyBiYXNpY2FsbHkgYSBjaGFuZ2UgaW4gZ251bGli
IHRoYXQgbmVlZHMgdG8gYmUgc3luY2VkIGludG8gdGhlIChhcHBhcmVudGx5IG5vdyB1bm1haW50
YWluZWQpIHNoYXJ1dGlscywgc28gdGhlIGxpY2Vuc2UgaXNu4oCZdCBhIGNvbmNlcm4uDQoNClJv
c3M=

