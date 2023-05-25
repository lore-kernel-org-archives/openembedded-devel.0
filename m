Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E77C77B7E
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 12:15:19 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.79])
 by mx.groups.io with SMTP id smtpd.web11.10038.1685016909389964299
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 May 2023 05:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=TQQ2tizg;
 spf=pass (domain: arm.com, ip: 40.107.21.79, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5dpKTwSRVIk61FVPPFJotGwltkgXTIIvg9khUm/hnM=;
 b=TQQ2tizgjIcf/yBHOp4px2lYajwD3U8QDWsbjeLyRpCLGyucPRadtl7tIIr8vJ0q0NFUYCsYcKJ6ZFf9lg47zsNfST6ogbISmrzaopf/Sppf1fpzAZPNnYZ9pZCZHuecmyRraBrssPmZJpcHq7SuacJ+qEKtmZgszB7aBsxpuRI=
Received: from AS9PR07CA0047.eurprd07.prod.outlook.com (2603:10a6:20b:46b::23)
 by AM7PR08MB5512.eurprd08.prod.outlook.com (2603:10a6:20b:de::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Thu, 25 May
 2023 12:15:04 +0000
Received: from AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46b:cafe::82) by AS9PR07CA0047.outlook.office365.com
 (2603:10a6:20b:46b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16 via Frontend
 Transport; Thu, 25 May 2023 12:15:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT045.mail.protection.outlook.com (100.127.140.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Thu, 25 May 2023 12:15:04 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136"); Thu, 25 May 2023 12:15:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9a38e4f07eb29838
X-CR-MTA-TID: 64aa7808
Received: from e94bfac7e62f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6ED111D9-1A3C-4E89-BAA3-40B4D2F42D10.1;
	Thu, 25 May 2023 12:14:57 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e94bfac7e62f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 25 May 2023 12:14:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PeccQnglYExFDhro3L/LIbxGV6pgFP42UZ0zWhu9ngrJ/fKSIKm+0LwSaPh7hWV8z1RDmEAeddct6BU4PHkns++sSsY4CHpZCpSHHmVDA/XfvHVUWHk4AEp4+QgA0NktC9qemQKmhdijQsuqTSkKqzf2bRkEVgV4rCcHcrnMPOhJxtDtbXeylwgdXxA2zNmw4j4f44bY4OZNDj1AuNlhM/NCHJBNOZDErUggY1ZQsWBarpL08k4cTs9NnoGtGJwVkTH73tLd02TwawuOKPr11WIMe45YydDSPXzwM/yQj10f/6JCdYA6QMd2X+0ZeM0koxgGtEH43B6F7o3pLyJNKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5dpKTwSRVIk61FVPPFJotGwltkgXTIIvg9khUm/hnM=;
 b=D4FF/9pOawHMWPef+9kZpwNHeJMGxYXo7SLK3jtpGJG2ncOEBs3sFXdHzREhHcxOjrDvfP002avRe/Z6/eDFnKr3BhjjPd7U8bpmKapCps1INaiR9NszQnFwbpPemJzchrgIUE8KuoNvN09gK0fWK78mYpeYezveoR5wysF4N0dAqRR8BpRL3ZzwOn+2ErfeWDSaVBf+Kv9NcmIss3Hd+KAIrz9mZsdh2q5rbXO/ChxrVesJYNu6jxOTJ8OzWxvpPtzs6WYVkBcv0Nr6uaAOCrHPXeLRhCwOnoU6QthaR4+PsQYH1TicoEPabkieRTAUy4jmUc08ETsIbxyRgl/FTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5dpKTwSRVIk61FVPPFJotGwltkgXTIIvg9khUm/hnM=;
 b=TQQ2tizgjIcf/yBHOp4px2lYajwD3U8QDWsbjeLyRpCLGyucPRadtl7tIIr8vJ0q0NFUYCsYcKJ6ZFf9lg47zsNfST6ogbISmrzaopf/Sppf1fpzAZPNnYZ9pZCZHuecmyRraBrssPmZJpcHq7SuacJ+qEKtmZgszB7aBsxpuRI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9597.eurprd08.prod.outlook.com (2603:10a6:20b:61b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 12:14:55 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 12:14:55 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH 3/6] firewalld: add features_check on
 gobject-introspection-data
Thread-Topic: [oe] [PATCH 3/6] firewalld: add features_check on
 gobject-introspection-data
Thread-Index: AQHZjmNIm9HD1Xly2kSee/rX0hdM9K9qDEmAgADb7IA=
Date: Thu, 25 May 2023 12:14:55 +0000
Message-ID: <4EC547BC-CAD7-4004-B434-B09C911653C4@arm.com>
References: <20230524171438.122588-1-ross.burton@arm.com>
 <20230524171438.122588-3-ross.burton@arm.com>
 <CAMKF1soXa-2H8=mdoMURtW5E1Jfh7hHvXy5zHgBQT6PXKbJ2=g@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soXa-2H8=mdoMURtW5E1Jfh7hHvXy5zHgBQT6PXKbJ2=g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9597:EE_|AM7EUR03FT045:EE_|AM7PR08MB5512:EE_
X-MS-Office365-Filtering-Correlation-Id: ecd3f5ac-b402-400d-0fe6-08db5d19ac07
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 GLy8aNm0PBZG3J2yOelDU4aKQDjj4UeWCIQQ3DQsEQGubV7J6U6v/cKZRpKp/wdYgvDnpbd+tPjRODso9dbcFgK0Bop6SeJsPv/doTeLKVWDRpHvfq2BHuP+yjHLxV54NGN5PfXIPj9qufWRkG+tERsFrwI+N9Q+VlVmqglLBibpIoLAGgy9KPUofxHPqI8UjxvlLv5z4VrUFdKdYdlCHvWcgz3FpqLhrwxZ7tB6hafM8gwLftrBr3RwNESe/BNduInSYZvPnfFHMZojFFO/TQZjU/0B8lcAwWsijGHygCaDW1nGrHz3gU8ja6IbQ+Ws7QHdXl0DKyv3kI8HOl6LAp4rz9nFn6KSGifFJWlQ3JINLlN4ff5OJAo4xQKOKNQ+I1aQuoJHAm15ieNrEM+Z4CPJTPW7Xx6/m/qylmj8mQ3cJix7pjs5qAOik5L8mYUKyZdE3/nAOU/adr4aEHIvYR/lun1GELfnY9hlG2i5ENzJ72lHeaf58USmYNxG4EscD8ZkzYYQ1Ki6CAbylpMlZXYfHRIbwxaGDLsaFlI7mcJauqlVBMOBjzHJGVkK+q+qcrso1AIOPxa1x6x1ObLyOo1f7zTmNHn6YZvbAs7SImZ0zgdxgRfSrCKyX73jAs++UG23ZGQEsT7U3OzDjSqy6w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(451199021)(26005)(4326008)(64756008)(66446008)(2616005)(66476007)(6916009)(6506007)(6486002)(966005)(53546011)(6512007)(66946007)(66556008)(76116006)(91956017)(478600001)(316002)(66574015)(66899021)(83380400001)(186003)(41300700001)(71200400001)(8936002)(8676002)(5660300002)(2906002)(122000001)(38100700002)(36756003)(33656002)(86362001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D6683BE0C92EE549A2BFB05D690A378C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9597
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	56d989d5-1874-4c27-eef1-08db5d19a697
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G37djMnB8d4t9TjqmLeOR6ubci8bCRRkEaf0oYT0TJQ63CQRZvpogAkauWamukoYw2VFl08Wz83OY4nmDdKZ1hAGNg3qYUlAaJ+Y4zQ11rjAxy4xJz5DEQvhkuemC7P3XDQdOUPiktK92gEOYUdm3GAP6fRSS+FzcRXNA3RkFlZOhoK1NkgilKAY7BMBLZaz41WcKsrYia7boEqyMJyISmVNWpxFlHMGRIv3QCJwdkcd9k7EmlcJxYrXCaJM9PzQVQ6tan1V1p+K0DqecY5FFs32rjUTlF/XMZsX9F5zo0ObRADdovhX4PD/MgsgZ8cfbc5nCQMWRxkL2KqQagN0Qh0TtuE5b0kb9S5Z1uDFBSSDv7DZhZBG1Oi4aHL7YQ9WCBzPEZYMe4Uyb7mX1VPkA5P2ePzEfuTXAdd/YslPra6T2Qkr9yw4OYNtMZ9GiiPHcv8x5Kpc5gpmKo56RAcqIZL6CbTclvYdU85RszyM0tAORxi+k3kdPPNCHhqbJXxpXGQzEoR4Qulxxa1bIZyM/gsJLq6LaMzAJnJ9G4sgm8Z0u1PeeZiyoCOoUTljznsHoJz5a6QaGrcSDeHa66kXoNedrxaoRjdsJ3nPrijz1ERaRO6frw6EYkOtgBnqQTmGsoFiA4CXPQk2aEXTTjKKwLPaqS+BBBReGSqboeE0j2dZHzuJZ0oZ4dg/dPv2QNkJ5rbVrbrJ97I/Re9pC6oCfCdXBHZbZyu5510Ol2gft+w=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(186003)(26005)(2906002)(6506007)(40460700003)(6512007)(356005)(40480700001)(81166007)(53546011)(66899021)(83380400001)(82740400003)(36860700001)(70206006)(5660300002)(82310400005)(70586007)(41300700001)(4326008)(316002)(8936002)(6862004)(33656002)(36756003)(8676002)(66574015)(47076005)(336012)(2616005)(6486002)(478600001)(966005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 12:15:04.4141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecd3f5ac-b402-400d-0fe6-08db5d19ac07
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5512
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 12:15:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102858

SSBkaWQgYSB3b3JsZCBidWlsZCB3aXRoIEctSSBkaXNhYmxlZCwgcGF0Y2ggYm9tYiBzZW50Lg0K
DQpSb3NzDQoNCj4gT24gMjUgTWF5IDIwMjMsIGF0IDAwOjA3LCBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPiB3cm90ZToNCj4gDQo+IEkgc2VlIHNvbWUgbW9yZSBmYWxsb3V0cyB3aXRoIHRo
aXMNCj4gDQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy90eXBob29uLyMv
YnVpbGRlcnMvODgvYnVpbGRzLzI3NzINCj4gDQo+IE9uIFdlZCwgTWF5IDI0LCAyMDIzIGF0IDEw
OjE04oCvQU0gUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+IHdyb3RlOg0KPj4gDQo+
PiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4NCj4+IA0KPj4gVGhpcyBw
cm9qZWN0IHVzZXMgZ29iamVjdC1pbnRyb3NwZWN0aW9uLCBzbyBkZXBlbmQgb24gdGhlIERJU1RS
T19GRUFUVVJFLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0
b25AYXJtLmNvbT4NCj4+IC0tLQ0KPj4gLi4uL3JlY2lwZXMtY29ubmVjdGl2aXR5L2ZpcmV3YWxs
ZC9maXJld2FsbGRfMS4yLjAuYmIgICAgICAgICB8IDQgKysrLQ0KPj4gMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvbWV0
YS1uZXR3b3JraW5nL2R5bmFtaWMtbGF5ZXJzL21ldGEtcHl0aG9uL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2ZpcmV3YWxsZC9maXJld2FsbGRfMS4yLjAuYmIgYi9tZXRhLW5ldHdvcmtpbmcvZHluYW1p
Yy1sYXllcnMvbWV0YS1weXRob24vcmVjaXBlcy1jb25uZWN0aXZpdHkvZmlyZXdhbGxkL2ZpcmV3
YWxsZF8xLjIuMC5iYg0KPj4gaW5kZXggOTg3Y2M2NDBlMS4uOGVmYmQzOWY3NCAxMDA2NDQNCj4+
IC0tLSBhL21ldGEtbmV0d29ya2luZy9keW5hbWljLWxheWVycy9tZXRhLXB5dGhvbi9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9maXJld2FsbGQvZmlyZXdhbGxkXzEuMi4wLmJiDQo+PiArKysgYi9tZXRh
LW5ldHdvcmtpbmcvZHluYW1pYy1sYXllcnMvbWV0YS1weXRob24vcmVjaXBlcy1jb25uZWN0aXZp
dHkvZmlyZXdhbGxkL2ZpcmV3YWxsZF8xLjIuMC5iYg0KPj4gQEAgLTE1LDcgKzE1LDkgQEAgU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjI4ZmQ5MGU4OGJkYTBkZmQ0NjBmMzcwZjM1MzQ3NDgxMWIyZTI5
NWQ3ZWIyN2YwZDdkMThmZmEzZDcNCj4+ICMgZ2xpYi0yLjAtbmF0aXZlIGlzIG5lZWRlZCBmb3Ig
R1NFVFRJTkdTX1JVTEVTIGF1dG9jb25mIG1hY3JvIGZyb20gZ3NldHRpbmdzLm00DQo+PiBERVBF
TkRTID0gImludGx0b29sLW5hdGl2ZSBnbGliLTIuMC1uYXRpdmUgbmZ0YWJsZXMiDQo+PiANCj4+
IC1pbmhlcml0IGdldHRleHQgYXV0b3Rvb2xzLWJyb2tlbnNlcCBiYXNoLWNvbXBsZXRpb24gcGtn
Y29uZmlnIHB5dGhvbjNuYXRpdmUgcHl0aG9uMy1kaXIgZ3NldHRpbmdzIHN5c3RlbWQgdXBkYXRl
LXJjLmQgcHRlc3QNCj4+ICtpbmhlcml0IGdldHRleHQgYXV0b3Rvb2xzLWJyb2tlbnNlcCBiYXNo
LWNvbXBsZXRpb24gcGtnY29uZmlnIHB5dGhvbjNuYXRpdmUgcHl0aG9uMy1kaXIgZ3NldHRpbmdz
IHN5c3RlbWQgdXBkYXRlLXJjLmQgcHRlc3QgZmVhdHVyZXNfY2hlY2sNCj4+ICsNCj4+ICtSRVFV
SVJFRF9ESVNUUk9fRkVBVFVSRVMgPSAiZ29iamVjdC1pbnRyb3NwZWN0aW9uIg0KPj4gDQo+PiBQ
QUNLQUdFQ09ORklHID8/PSAiJHtAYmIudXRpbHMuZmlsdGVyKCdESVNUUk9fRkVBVFVSRVMnLCAn
c3lzdGVtZCcsIGQpfSINCj4+IFBBQ0tBR0VDT05GSUdbc3lzdGVtZF0gPSAiLS13aXRoLXN5c3Rl
bWQtdW5pdGRpcj0ke3N5c3RlbWRfc3lzdGVtX3VuaXRkaXJ9LC0tZGlzYWJsZS1zeXN0ZW1kIg0K
Pj4gLS0NCj4+IDIuMzQuMQ0KPj4gDQo+PiANCj4+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+
PiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4+
IFZpZXcvUmVwbHkgT25saW5lICgjMTAyNzg3KTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvMTAyNzg3DQo+PiBNdXRlIFRoaXMgVG9w
aWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC85OTExMzM5NS8xOTk3OTE0DQo+
PiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWRldmVsK293bmVyQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9v
cGVuZW1iZWRkZWQtZGV2ZWwvdW5zdWIgW3Jhai5raGVtQGdtYWlsLmNvbV0NCj4+IC09LT0tPS09
LT0tPS09LT0tPS09LT0tDQoNCg0K

