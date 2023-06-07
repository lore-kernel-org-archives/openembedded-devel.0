Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3BEC77B7A
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 15:35:25 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.70])
 by mx.groups.io with SMTP id smtpd.web10.1331.1686152119190180041
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jun 2023 08:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=hpThA82/;
 spf=pass (domain: arm.com, ip: 40.107.6.70, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEkbi6LsQtgpeyqUjdMcEzufiiraYMKQOSSzt0pz0xI=;
 b=hpThA82/3DBOXVZ4ywjtYOrOHPwTxhO64MSi+11BW5Iw7vJpXHJXhmZapWbQd9E3A+/qxm7Lcuhb35E6owzdjtVi8Od0fe1O7HApA9lEKFOPMbNPki3WAhBJ1sPh6tPOXqcDy+oyiHcTlapYrjEYT9dtBay2QrDn6FxjCIoua2s=
Received: from AM0PR04CA0095.eurprd04.prod.outlook.com (2603:10a6:208:be::36)
 by GV2PR08MB8271.eurprd08.prod.outlook.com (2603:10a6:150:b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 15:35:16 +0000
Received: from AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:be:cafe::e8) by AM0PR04CA0095.outlook.office365.com
 (2603:10a6:208:be::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Wed, 7 Jun 2023 15:35:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT063.mail.protection.outlook.com (100.127.140.221) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.22 via Frontend Transport; Wed, 7 Jun 2023 15:35:15 +0000
Received: ("Tessian outbound 5154e9d36775:v136"); Wed, 07 Jun 2023 15:35:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c324bc284283b8f3
X-CR-MTA-TID: 64aa7808
Received: from 752163ef6454.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 714F4E5D-6F51-40FA-B5F6-E3BBFD0606FB.1;
	Wed, 07 Jun 2023 15:35:08 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 752163ef6454.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 07 Jun 2023 15:35:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJ8JXe66Rs9Jyp3UpoGalB24E3WrnFGhj0n6Z566WdgVbTHKriFU9irYeaSn7v086TYWgheFGHryD0cBBrdgEZksQ1Ihfa4SMPP5uoZ9u9V7WrGHpW+J/gRkr2l4sa/SYehBRFoe+Tn+MYhPX80oywdgAY72qRHtIr8frf2Uksy38+6CG+1kpzNiEylqtHvJrvqb0UzVkXR4N7HXQmzd+KZlb2lWVZ1sLtxmMm9L2M2N+UK77JVPI3DC4a7SFqCqNUfa7Y8V+2CpMie08FfoI++Lc9REUz73Pdpu8rLsmyvukWyh3GG9+bgxk8yt7Onzpk5oyLjk3edZqKw5tO+DOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SEkbi6LsQtgpeyqUjdMcEzufiiraYMKQOSSzt0pz0xI=;
 b=adhW52zCr3JhySBb8RCMRB1fhxK/aaWzNbqV03E1NE3F2bM7AUrrAXO/7d+rIGfG0YM39xNxm7Iyeqz0tSxuJXLkySPFkKpvYMKQEkQeOOevhwk3PdXFZqL4frAW0Gr50W/QFaS1YyoCvv6V6uDvZcxkO+2IjCglGKBbMAygsNl9z50txvnXD0txsQ9sYPZmceSUicxZdVpt2jhtUaCeQacCFOdkBIaQ/Iur2NLeOpVCBURvLAcNa+pqm5dmHKzk7dWseUI+TluUmC/vXA2wq24gxDRFI0i/vIAnablEW/FQbCbSIX2XXwL9fgC/q5kmj3bh9thSDsI5r/5h9E+BCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEkbi6LsQtgpeyqUjdMcEzufiiraYMKQOSSzt0pz0xI=;
 b=hpThA82/3DBOXVZ4ywjtYOrOHPwTxhO64MSi+11BW5Iw7vJpXHJXhmZapWbQd9E3A+/qxm7Lcuhb35E6owzdjtVi8Od0fe1O7HApA9lEKFOPMbNPki3WAhBJ1sPh6tPOXqcDy+oyiHcTlapYrjEYT9dtBay2QrDn6FxjCIoua2s=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB7822.eurprd08.prod.outlook.com (2603:10a6:150:3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Wed, 7 Jun
 2023 15:35:04 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 15:35:04 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: =?utf-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Tim moto-timo Orling
	<TicoTimo@gmail.com>, Derek Straka <derek@asterius.io>
Subject: Re: [oe] [meta-python][PATCH 2/2] python_mesonpy: New class
Thread-Topic: [oe] [meta-python][PATCH 2/2] python_mesonpy: New class
Thread-Index: AQHZmQ0rqqmfUcrtTE6ilIxEGXAtYa9/GsYAgAAYSgCAAACiAIAABDQAgABBNgA=
Date: Wed, 7 Jun 2023 15:35:04 +0000
Message-ID: <12635BEA-BDB6-46DB-A29B-54B501B4A4CA@arm.com>
References: <20230607065547.128661-1-zboszor@gmail.com>
 <20230607065547.128661-2-zboszor@gmail.com>
 <C15808F7-1E10-415B-9281-82CD6FE46FC8@arm.com>
 <782e17f9-9ae6-b6db-6b61-f41e670d4030@gmail.com>
 <8236819D-4370-4B6E-AFD1-845010C00239@arm.com>
 <cdd1f449-d73e-edb5-4572-563818dbbbb8@gmail.com>
In-Reply-To: <cdd1f449-d73e-edb5-4572-563818dbbbb8@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB7822:EE_|AM7EUR03FT063:EE_|GV2PR08MB8271:EE_
X-MS-Office365-Filtering-Correlation-Id: 77bdc3d7-6627-4fbe-9e99-08db676cca5f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 5PhJanirQ1IvwlUwDGr6RnXtaz7aWgVgBZ54LG9GaRz/FHdI8iHXuQ757CIQCD8qNvsb6xOji9BO+Lk0jxHJQGJ91MI8MpWp9IFH2pNqpz1YpPdwfysnqv//G/ZLim8gx0Lq4WtRaVHUSgnsgnY8UgMdNWVxhUKGR8N4n74LyrIeZI7bMq6oJAz+EFVIAiJcr3qNT6iHsry3ug0eWQogbkT+bGozep1Aq2NwMJcuITiOKwF3R51MLKN8QPw4fgMArkzdzwFyJckaO5s/31MEwUqpXA5ugRPiB5dTMLHrPbKF4/D2DN9964hqwqJdQj4yUeeq3MXXbXoBJ1tOfA1/y+wdM6LqEDgc/bp16gz8qmU0IalTk/tgfPQCG8CwbA59/PLRE+2qltAjzl4ItrU0yN1bcKRg+/nQQzoyj6QVutjf1cO4lQABiskRGXN0/akr24mLyrl8uUEgswjoSgHBpYN627h1mr7KNBZHYu2R7OQAX/GZI/H85nJnddCaQpvGK8EWXtVU7EYIXa7oF3Dv+JeWwf1hHHbNTynsRPU7oo+9h32Y5poJqkGflwBw8hNUJG/TLQosBKbdQCz3LzLx6svhjzSrgBQAgIwaWXRBxu0FrOppIhIidTlTvHv4jq56wPuUTkk3zQsw+ZqvpWQvCg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(451199021)(54906003)(478600001)(33656002)(8676002)(8936002)(41300700001)(316002)(38070700005)(91956017)(66946007)(76116006)(66556008)(66476007)(66446008)(122000001)(64756008)(38100700002)(5660300002)(4326008)(86362001)(6916009)(36756003)(6486002)(2906002)(71200400001)(6512007)(186003)(6506007)(26005)(53546011)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BEBE5B56166F384E93CC1BDAD06B3D09@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7822
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2ca5b7d3-9a06-4bfa-1761-08db676cc413
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cKxXuZZOah6RfFbRqKHdDXqmC8hTJD2LdTU+QgiRPf2hhczn5lNGRRhs9RHfjnxfpvfp6AB3ebKEdxNLSHpyWglpp9PBuKgEF67sE3oVUmfZhK1ok9Nu/8lSIFpjJsIwGZ2GMZynScSuCJDUm5VFIomRMsfr98a6CLo+G22DWx5dw7kRwJASuyhDF9zK7nTnJhvSZSNgryiWNdvBuhtUrMgZ4Q/e7zgtkw87Hgwv3fy1KZ1v8czJWZM6ThoKP0jKIVFlQfvNmQICBDcr3ncdR2aMtv22e1kfF2Txp+jTgoEipXpcJz7e9vP2rGQMy/Ro+6dvU2lLnErly8ThbBSIBVx9pqXO7ZEJIdtki5eI7joFfuJnvdPd0H4eenvERgtYgSOtn3rGLd8Vf4eY6yV2MbYl3yTIbH5AmsgOJZxDvnxUyPSLZAIbVEs08ofiaIdLRCFv+Ey/w9lO+iWhm7gZKlgDBBP3H3Nv9nxP2B/0/BgH/1BwlNocKlkNsQqAVOK2hls/f7PZ8QZmwsmgYvk6oUj4MWbE4iLBpUlHNrMdAOPh+w2rmK91IZrCYyEegGrlPWHtt9YY2QpWWcrJ2/ZYe2cSoCZIMazEaJNrheC7178NF6M+dszncKfO45k89od1VK++yA8OtXJmUUoOQ4o00snqHaNvu0Cj19YJf0yPaYvi8gHwkil+H8zfOhgIG4VEtrxf2++sjz5WXsOsjReLDvRtqGhxuEBOI1/5eBpTqkw=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(39860400002)(136003)(451199021)(46966006)(36840700001)(40470700004)(70206006)(70586007)(6862004)(36756003)(8676002)(8936002)(5660300002)(4326008)(54906003)(478600001)(40460700003)(316002)(41300700001)(6486002)(40480700001)(82740400003)(81166007)(356005)(53546011)(47076005)(6506007)(26005)(186003)(6512007)(36860700001)(336012)(2616005)(86362001)(82310400005)(33656002)(2906002)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 15:35:15.1981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77bdc3d7-6627-4fbe-9e99-08db676cca5f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8271
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 15:35:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103178

T24gNyBKdW4gMjAyMywgYXQgMTI6NDEsIELDtnN6w7ZybcOpbnlpIFpvbHTDoW4gPHpib3N6b3JA
Z21haWwuY29tPiB3cm90ZToNCj4gDQo+IDIwMjMuIDA2LiAwNy4gMTM6MjYga2VsdGV6w6lzc2Vs
LCBSb3NzIEJ1cnRvbiDDrXJ0YToNCj4+IE9uIDcgSnVuIDIwMjMsIGF0IDEyOjI0LCBCw7ZzesO2
cm3DqW55aSBab2x0w6FuIDx6Ym9zem9yQGdtYWlsLmNvbT4gd3JvdGU6DQo+Pj4+PiArIyBUaGlz
IHByZXZlbnRzIHRoZSBtZXNvbiBlcnJvcjoNCj4+Pj4+ICsjIEVSUk9SOiBHb3QgYXJndW1lbnQg
YnVpbGR0eXBlIGFzIGJvdGggLURidWlsZHR5cGUgYW5kIC0tYnVpbGR0eXBlLiBQaWNrIG9uZS4N
Cj4+Pj4+ICtNRVNPTk9QVFM6cmVtb3ZlID0gIi0tYnVpbGR0eXBlICR7TUVTT05fQlVJTERUWVBF
fSINCj4+Pj4gSWYgbWVzb25weSBldmVyIHN3aXRjaGVzIHRvIOKAlGJ1aWxkdHlwZSB0aGVuIHRo
aXMgd2lsbCBicmVhaywgcmlnaHQ/ICBNaWdodCBiZSBiZXR0ZXIgdG8gcGF0Y2ggbWVzb25weSBp
bnN0ZWFkLg0KPj4+IFdoeSB3b3VsZCBpdCBicmVhaz8gSXQgZG9lcyBub3QgYWZmZWN0IHdoYXQg
bWVzb24tcHl0aG9uIGlzIGFkZGluZyBpbnRlcm5hbGx5Lg0KPj4+IA0KPj4+IFRoaXMgb25seSBy
ZW1vdmVzIHRoZSBzZXR0aW5nIGltcG9zZWQgYnkgbWVzb24uYmJjbGFzcw0KPj4+IGFuZCBvbmx5
IG5lZWRzIHRvIGNoYW5nZSBpZiBtZXNvbi5iYmNsYXNzIHN3aXRjaGVzIHRvIC1EYnVpbGR0eXBl
Lg0KPj4gTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IG1lc29uLmJiY2xhc3MgaXMgcGFzc2luZyDi
gJRidWlsZHR5cGUgYW5kIHRoZW4gbWVzb25weSBpcyBwYXNzaW5nIC1EYnVpbGR0eXBlLg0KPiAN
Cj4gQ29ycmVjdC4NCj4gDQo+PiBUaGlzIDpyZW1vdmUgcmVtb3ZlcyBhbnkg4oCUYnVpbGR0eXBl
IG9wdGlvbiwgc28gaWYgbWVzb25weSBjaGFuZ2VzIHRvIHVzaW5nIOKAlGJ1aWxkdHlwZSBpbnN0
ZWFkIG9mIC1EYnVpbGR0eXBlIHRoZW4gX2JvdGhfIGJ1aWxkdHlwZSBvcHRpb25zIHdpbGwgYmUg
cmVtb3ZlZCwgd2hpY2ggaXNu4oCZdCB3aGF0IHlvdSB3YW50Lg0KPiANCj4gV3JvbmcuDQo+IA0K
PiBUaGlzIG9ubHkgcmVtb3ZlcyB0aGUgLS1idWlsZHR5cGUgc2V0dGluZyBmcm9tIE1FU09OT1BU
UyBzZXQgYnkgbWVzb24uYmJjbGFzcy4NCg0KT2theSwgSSB0YWtlIGl0IGJhY2ssIHRoYW5rcy4N
Cg0KUm9zcw==

