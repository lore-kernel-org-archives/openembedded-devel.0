Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95110CDB482
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 14:39:32 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.64])
 by mx.groups.io with SMTP id smtpd.web10.13554.1697121567102370177
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Oct 2023 07:39:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ywjCTuMm;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ywjCTuMm;
 spf=pass (domain: arm.com, ip: 40.107.20.64, mailfrom: luca.fancellu@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXccwR0IgQZFPkO8puwa9PTbL5+/rOFDstx1evoje9s=;
 b=ywjCTuMmqnIIz9Da1IGdA80rdIEoArj9VFdXx69vxgZb+F6wQ13MJmDblAvRC9Tbnd/TCFWxcnz8taN5lO29unzNjQ0LQsbozBdgv/8pZGMhxZ4En3GSIVQ1AYnLJz0iyu9IJ30Wg80+5kiBSZeyhnIXUYcLgNjXuG+DDUk/9wY=
Received: from DB9PR01CA0020.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::25) by PA4PR08MB6142.eurprd08.prod.outlook.com
 (2603:10a6:102:ee::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Thu, 12 Oct
 2023 14:39:23 +0000
Received: from DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d8:cafe::94) by DB9PR01CA0020.outlook.office365.com
 (2603:10a6:10:1d8::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.42 via Frontend
 Transport; Thu, 12 Oct 2023 14:39:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT035.mail.protection.outlook.com (100.127.142.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.27 via Frontend Transport; Thu, 12 Oct 2023 14:39:23 +0000
Received: ("Tessian outbound ee9c7f88acf7:v211"); Thu, 12 Oct 2023 14:39:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ca9fe2e65b0cd807
X-CR-MTA-TID: 64aa7808
Received: from 98f26f352996.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DA47CBDA-B75F-4FD3-9C97-7818D0AC0848.1;
	Thu, 12 Oct 2023 14:39:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 98f26f352996.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 12 Oct 2023 14:39:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WIx19kzCjnppB2l5BoWYJsTDS88Yi+t6bZD2Nt70FnZQNLl9spq/Z7ho8pdfpksVSvBKjGrJb8Hk45sbRymh9fo0aE2XmBPSj5p45Vgysn7glHPFMKST5CvEVC48HC4UsXB/T0pXpHWf6qr01gw7YXRhBEizuJU0kQf9AXPQJSklBGFzoz8JDGSo+eUUOduIj0lCj1VoDtXM4nDEvYeN6eDwoAaBz5SFPCRUBVQEv9DOZI3cYY/+5PYrgVorbGPnYNchB7RkoJt41ZmCoNNO67hDHD6iouO867i6Q2Jx69ay2XKchxN/eu5YB4GKp/4FkFY+Lfi53+FlrhpQWJrnjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXccwR0IgQZFPkO8puwa9PTbL5+/rOFDstx1evoje9s=;
 b=npzrlO8o455NDs9RA53q6/WGUoIueAHVKivJOCuD+FcaTCbbRd0FUvx0lS17aUhnlaVycgJyLNxsW3eDQQSI9e7AaFksr4WIjI9liGo0RgS130ZhMm44jVPdH0J5qn6+32dNaGbk/ll70y6EhxE14mYApmwdLooUygX8s2n4qssVBagBiIAzLBVyZNt1JAyoeOnp+51lN23yRm6Qw3WwJcVE5pcTsX3n9GhqYqpLPMqwKGGL4WazkEiPpsLRkzxU7iZUxVNQtjM7GikzZrC99bmltCanEEwQIhCD92Zdv7t5afr7X7mY8NL7UrqR5JgPgdxKqssBLIh7JHy7zUf4sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXccwR0IgQZFPkO8puwa9PTbL5+/rOFDstx1evoje9s=;
 b=ywjCTuMmqnIIz9Da1IGdA80rdIEoArj9VFdXx69vxgZb+F6wQ13MJmDblAvRC9Tbnd/TCFWxcnz8taN5lO29unzNjQ0LQsbozBdgv/8pZGMhxZ4En3GSIVQ1AYnLJz0iyu9IJ30Wg80+5kiBSZeyhnIXUYcLgNjXuG+DDUk/9wY=
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS4PR08MB7556.eurprd08.prod.outlook.com (2603:10a6:20b:4fe::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Thu, 12 Oct
 2023 14:39:10 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::501a:489c:410b:338]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::501a:489c:410b:338%7]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 14:39:10 +0000
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Diego Sueiro <Diego.Sueiro@arm.com>, Rahul Singh <Rahul.Singh@arm.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH 3/3] linuxptp: add systemd services
Thread-Topic: [oe] [meta-oe][PATCH 3/3] linuxptp: add systemd services
Thread-Index: AQHZ/GdyAyCpKBloHk6qHTQwtJqbLbBF6+WAgABKSICAAASxAA==
Date: Thu, 12 Oct 2023 14:39:10 +0000
Message-ID: <2E85458C-8CC7-4422-9EC7-48AF2F5A945E@arm.com>
References: <20231011163346.1856498-1-luca.fancellu@arm.com>
 <20231011163346.1856498-4-luca.fancellu@arm.com>
 <CAMKF1so89orai-uOFF3pKRUze2v9BEC6s5Yy7K8DFjWFH_CPyQ@mail.gmail.com>
 <0AF6ED9B-AD74-4DC5-B65F-F1EE861818AA@arm.com>
 <CAMKF1soL+SMx5cHLTBnTZQ5x_YKbYSr2TnCTdBqkEut9Ly=Kug@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soL+SMx5cHLTBnTZQ5x_YKbYSr2TnCTdBqkEut9Ly=Kug@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM6PR08MB3749:EE_|AS4PR08MB7556:EE_|DBAEUR03FT035:EE_|PA4PR08MB6142:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d34c410-46eb-4abb-1685-08dbcb3106f1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 YlnA2rW9VZrwqVeA1B1/F0SI6yjBpWoTueSS4QuNZL73qvO177+10XU+94ak/Vuss8mIVW3E+vs7tn/9qr6F/Jg4rN7V905iC69kl6PQQLrnJ4TGUG4u66hgjF85tdYQbrAe20aYwCIBukYj4zVbJJVDM/KpvWlo1QCFj/BzoeMPxuMsrkuaLVSA+twxY/R3ovF8w+Wr9AyJmXUS4eTa8OtXEyLr5BonF+CoUVLjdVN8kiG0QETk3SjiQZCt1oGHGb7IN01oQJjg0HjQVknrfqyyxwlDS1iZKWQuW2vses5JzAniy3MOjZxX9MyXUBZADThq8xDbZTQr0EN3TpFOt0tWuRu5U2uNPJdfzZPzPcGuQKmQssWUX+wqg1p0Pp3bEnXlLJo0GUzXuoe3l3aRARFC/GPFE/Ol6ZfqmpkGQeD0WygsXnZUS8KZeYsQXn75bj73jv4hluw1BN0byVJiZ19HH80p+mJNvfo2Ki/dPSJWIx0bCdE6IsP2CnJiIkvFOpZ7TayzILa5fMmrx/AzSS+RPSR4GWzCbL+pzGrmPedZPAGCAgG1KF31D9XboS8KqRXza3E2nWlmPrQkpSDXa0BYA8yfE5+srpS0z3va6HhoYH3c60u2vYuGltbGBmkgfmFSfggHZnh/ZBed3yLncw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(39860400002)(136003)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(26005)(83380400001)(76116006)(6916009)(66946007)(5660300002)(8936002)(66446008)(316002)(4326008)(8676002)(66476007)(41300700001)(66556008)(86362001)(54906003)(64756008)(91956017)(2906002)(33656002)(6506007)(478600001)(71200400001)(6486002)(38100700002)(2616005)(122000001)(36756003)(6512007)(53546011)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <51605695E4D82F4888C78E6E73F8E679@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7556
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	df5b3f66-c0e5-4764-bbb9-08dbcb30ff5f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	//5myOXzEHJkqvbRQLS/6EomzZQK3lC0JrXHFmxDtPm9gtupzJAH0wwrcDZBBG3Ju1HeVaWxli25r1d/cYrLTSeK0qDLeYBgCMe/2wvwCWfJNSD5gzyV1TvXxeS4qnmWpqDCEEjlQY0oZhI0Fy+qbze42cVjsmt0B6lRM0nCA89oet3CJ554IF+L2g3+odmRuU0EVuCy57wSGpuAHYsB6Rtg1YQD4gGx4pBlUhXEtuYGn+xEys7SyOxh/FouAeZKLddXlX/rEdgXmWD3PpfPM6CyFbjFCx1HIDK1673MdAKja/MtI2OLkWp1jWWhg2+kBcQrfAJw6vH6XB2ZFeVtUXqy6T6BAsCVxzGcJPuN7LuefswW3ZMTGagawWsT6RghQDvIOitpGLgtuXSQT2XrPn3cCPEOt4r1jx4xw6qWfQALmzNC3DrPlG08gJydaPmfO3U63ZD1XaelYHQp9ZAma4sJhOcTsALy/qAXxi5jt3bYbju0rBSRodU4Se1jNQsXIye8cWKxwcLTbiBnROFwgx+9q3ZJCvceRHGGdxJlXj/SAiay/p8AphNIhAAa+5L3KN7ZSWWcvDhDSM4lyvFCHQ5d8Ean28dEnPsNHuqRCxxS0+9aa45T6FR/0Rh3UDWMntp8gdkTic9VT2vTfk2QCH/EzpC+6wgCSgKv6AQQaXtustHeLl/PTbSbU7oI1bB8KAkXaFunyo4m3UWUQrxdpUsqcE8Xof4v7kpOnqv5bjY=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(451199024)(1800799009)(82310400011)(64100799003)(186009)(40470700004)(46966006)(36840700001)(36860700001)(40480700001)(40460700003)(6512007)(6506007)(70586007)(70206006)(478600001)(316002)(54906003)(86362001)(41300700001)(82740400003)(36756003)(2906002)(81166007)(5660300002)(6862004)(356005)(4326008)(8676002)(8936002)(33656002)(6486002)(47076005)(83380400001)(2616005)(26005)(336012)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 14:39:23.3200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d34c410-46eb-4abb-1685-08dbcb3106f1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6142
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 14:39:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105456

DQoNCj4gT24gMTIgT2N0IDIwMjMsIGF0IDE1OjIyLCBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwu
Y29tPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gVGh1LCBPY3QgMTIsIDIwMjMgYXQgMjo1NiBB
TSBMdWNhIEZhbmNlbGx1IDxMdWNhLkZhbmNlbGx1QGFybS5jb20+IHdyb3RlOg0KPiBIaSBLaGVt
LA0KPiANCj4gPj4gDQo+ID4+IGRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2xpbnV4cHRwL2xpbnV4cHRwL3N5c3RlbWQvcGhjMnN5c0Auc2VydmljZSBiL21ldGEtb2Uv
cmVjaXBlcy1jb25uZWN0aXZpdHkvbGludXhwdHAvbGludXhwdHAvc3lzdGVtZC9waGMyc3lzQC5z
ZXJ2aWNlDQo+ID4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4+IGluZGV4IDAwMDAwMDAwMDAw
MC4uZGQyNTEyYmRjYTExDQo+ID4+IC0tLSAvZGV2L251bGwNCj4gPj4gKysrIGIvbWV0YS1vZS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9saW51eHB0cC9saW51eHB0cC9zeXN0ZW1kL3BoYzJzeXNALnNl
cnZpY2UNCj4gPj4gQEAgLTAsMCArMSwxMyBAQA0KPiA+PiArW1VuaXRdDQo+ID4+ICtEZXNjcmlw
dGlvbj1TeW5jaHJvbml6ZSBzeXN0ZW0gY2xvY2sgb3IgUFRQIGhhcmR3YXJlIGNsb2NrIChQSEMp
DQo+ID4+ICtEb2N1bWVudGF0aW9uPW1hbjpwaGMyc3lzDQo+ID4+ICtSZXF1aXJlcz1wdHA0bC5z
ZXJ2aWNlDQo+ID4+ICtBZnRlcj1wdHA0bC5zZXJ2aWNlDQo+ID4+ICtCZWZvcmU9dGltZS1zeW5j
LnRhcmdldA0KPiA+PiArDQo+ID4+ICtbU2VydmljZV0NCj4gPj4gK1R5cGU9c2ltcGxlDQo+ID4+
ICtFeGVjU3RhcnQ9L3Vzci9zYmluL3BoYzJzeXMgLXcgLXMgJUkNCj4gPiANCj4gPiBDYW4gdGhl
c2UgcGF0aHMgYmUgZGVyaXZlZCBmcm9tICR7c2JpbmRpcn0gZHVyaW5nIGRvX2luc3RhbGwuDQo+
ID4gDQo+ID4gDQo+ID4+ICsNCj4gPj4gK1tJbnN0YWxsXQ0KPiA+PiArV2FudGVkQnk9bXVsdGkt
dXNlci50YXJnZXQNCj4gPj4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZp
dHkvbGludXhwdHAvbGludXhwdHAvc3lzdGVtZC9wdHA0bEAuc2VydmljZSBiL21ldGEtb2UvcmVj
aXBlcy1jb25uZWN0aXZpdHkvbGludXhwdHAvbGludXhwdHAvc3lzdGVtZC9wdHA0bEAuc2Vydmlj
ZQ0KPiA+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjFi
YWQyZDcyZGY2Yg0KPiA+PiAtLS0gL2Rldi9udWxsDQo+ID4+ICsrKyBiL21ldGEtb2UvcmVjaXBl
cy1jb25uZWN0aXZpdHkvbGludXhwdHAvbGludXhwdHAvc3lzdGVtZC9wdHA0bEAuc2VydmljZQ0K
PiA+PiBAQCAtMCwwICsxLDExIEBADQo+ID4+ICtbVW5pdF0NCj4gPj4gK0Rlc2NyaXB0aW9uPVBy
ZWNpc2lvbiBUaW1lIFByb3RvY29sIChQVFApIHNlcnZpY2UgZm9yICVJDQo+ID4+ICtEb2N1bWVu
dGF0aW9uPW1hbjpwdHA0bA0KPiA+PiArQWZ0ZXI9c3lzLXN1YnN5c3RlbS1uZXQtZGV2aWNlcy0l
aS5kZXZpY2UNCj4gPj4gKw0KPiA+PiArW1NlcnZpY2VdDQo+ID4+ICtUeXBlPXNpbXBsZQ0KPiA+
PiArRXhlY1N0YXJ0PS91c3Ivc2Jpbi9wdHA0bCAtZiAvZXRjL2xpbnV4cHRwL3B0cDRsLmNvbmYg
LWkgJUkNCj4gPiANCj4gPiBDYW4gdGhlc2UgcGF0aHMgYmUgZGVyaXZlZCBmcm9tICR7c2JpbmRp
cn0gYW5kICR7c3lzY29uZmRpcn0gYml0YmFrZSB2YXJpYWJsZXMNCj4gPiBkdXJpbmcgZG9faW5z
dGFsbCA/IFRoaXMgc2hvdWxkIG1ha2UgdGhlbSBtb3JlIHBvcnRhYmxlDQo+IA0KPiBZZXMgSSBj
YW4gZG8gdGhhdCwgZm9yIGJvdGggJHtzYmluZGlyfSBhbmQgJHtzeXNjb25mZGlyfSwgSSBzZWUg
dGhlIG1ha2VmaWxlIHNldHMNCj4gc2JpbmRpciA9ICQocHJlZml4KS9zYmluLCB3ZSBhbHJlYWR5
IHBhc3MgJHtwcmVmaXh9IGluIHRoZSBtYWtlIGNvbW1hbmQgbGluZSwNCj4gZG8geW91IHRoaW5r
IHdlIHNob3VsZCBwYXNzIGFsc28gc2JpbmRpcj0gdG8gZW5zdXJlIGNvbnNpc3RlbmN5Pw0KPiAN
Cj4gSSB0aGluayBpdCBpcyB0aGF0IHdlIHN0b3JlIHRoZSBvcmlnaW4gc2VydmljZSBmaWxlIGFz
IGEgdGVtcGxhdGUgbGlrZSBzZXJ2aWNlLmluIGFuZCB0aGVuIHdoZW4gaW5zdGFsbGluZyBpdCBk
dXJpbmcgZG9faW5zdGFsbCBzdWJzdGl0dXRlIHRoZSBwYXRocyB3aXRoIG9yaWdpbmFsIHZhbHVl
IG9mIHRoZXNlIHZhcmlhYmxlcyB0aGVyZSBhcmUgbWFueSBleGFtcGxlcyBvZiB0aGlzIGluIG1l
dGFkYXRhIA0KPiANCj4gDQoNClllcyBvZiBjb3Vyc2UsIHRoYXQgcGFydCBpcyB2ZXJ5IGNsZWFy
LCB3aGF0IEnigJltIGFza2luZyBpczoNCg0KU2luY2UgdGhlIE1ha2VmaWxlIGhhcmRjb2RlIHNi
aW5kaXIsIGlzIGl0IGVub3VnaCBpZiBJIHJlcGxhY2UgJHtwcmVmaXh9IGFuZCAke3N5c2NvbmZk
aXJ9IGluIHRoZSBzZXJ2aWNlPw0KDQpGb3IgZXhhbXBsZSBoZXJlOg0KPiA+PiArKysgYi9tZXRh
LW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpbnV4cHRwL2xpbnV4cHRwL3N5c3RlbWQvcHRwNGxA
LnNlcnZpY2UNCj4gPj4gQEAgLTAsMCArMSwxMSBAQA0KPiA+PiArW1VuaXRdDQo+ID4+ICtEZXNj
cmlwdGlvbj1QcmVjaXNpb24gVGltZSBQcm90b2NvbCAoUFRQKSBzZXJ2aWNlIGZvciAlSQ0KPiA+
PiArRG9jdW1lbnRhdGlvbj1tYW46cHRwNGwNCj4gPj4gK0FmdGVyPXN5cy1zdWJzeXN0ZW0tbmV0
LWRldmljZXMtJWkuZGV2aWNlDQo+ID4+ICsNCj4gPj4gK1tTZXJ2aWNlXQ0KPiA+PiArVHlwZT1z
aW1wbGUNCj4gPj4gK0V4ZWNTdGFydD0vdXNyL3NiaW4vcHRwNGwgLWYgL2V0Yy9saW51eHB0cC9w
dHA0bC5jb25mIC1pICVJDQoNCkl0IHdpbGwgYmU6IEV4ZWNTdGFydD1AUFJFRklYQC9zYmluL3B0
cDRsIC1mIEBTWVNDT05GRElSQC9saW51eHB0cC9wdHA0bC5jb25mIC1pICVJDQoNClNvIHRoYXQg
aW4gZG9faW5zdGFsbCBJIGNhbiBkbyB0aGUgc2VkIHN1YnN0aXR1dGlvbiB1c2luZyAke3ByZWZp
eH0gYW5kICR7c3lzY29uZmRpcn0NCg0KDQo=

