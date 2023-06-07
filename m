Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F453C77B7A
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 11:27:07 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.80])
 by mx.groups.io with SMTP id smtpd.web10.5907.1686137216536871580
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jun 2023 04:26:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=tNWCTc8o;
 spf=pass (domain: arm.com, ip: 40.107.241.80, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEypEddhNO99Y6RmgqVOvZ72FKN+xeKQPvix2UjFE14=;
 b=tNWCTc8ohZxh7VniN2DjeAdeYpBLDPMKdzoc5FjUau9kphrv3LSb3U3illqjrjFPlEImSNpYWZQJI1BMwE9QgKRPg3IepaCDBlZUCjJQqIlKC/i3/JWeHq23rBpU10TeHENP/63YtA3HxM2gWtnsH7SfwfdwwHbnwzq4RBdFq6I=
Received: from DB6PR07CA0007.eurprd07.prod.outlook.com (2603:10a6:6:2d::17) by
 AM0PR08MB5505.eurprd08.prod.outlook.com (2603:10a6:208:18e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 11:26:49 +0000
Received: from DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::49) by DB6PR07CA0007.outlook.office365.com
 (2603:10a6:6:2d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.18 via Frontend
 Transport; Wed, 7 Jun 2023 11:26:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT005.mail.protection.outlook.com (100.127.142.81) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.19 via Frontend Transport; Wed, 7 Jun 2023 11:26:49 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136"); Wed, 07 Jun 2023 11:26:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2e55dad013e106cc
X-CR-MTA-TID: 64aa7808
Received: from 577677a75b22.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D4AC0118-E7CD-4B5C-9D0E-88CF9CC004D2.1;
	Wed, 07 Jun 2023 11:26:40 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 577677a75b22.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 07 Jun 2023 11:26:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0jnflRYO2pqjEBDTPJC0hSCjfjADKbxbjsLpp1Ioxyd/b0xMOiFS7HMJ0h5HRKoshmyvZA5+bN2Fq4COkYv2WRDcnEmzhwuDp4P6hpbTyxfEinbSSI7xdXm7BtRLVqrX5+N3/p5v1bJEcU50d9UeM3Q7CWs7w/vm2sy2KJshbCj3hbMWU1TNobRxM/b2FoHk/EgLzcHl+gyCWZg3Vng49+iz5gizIHaqu4VJGZ+vDKBKLmJ8AwGT35T0CVRDK/0wynNXXoxeeX2omwOTTvwzV2RPwJW8x1Ohkicv99g93KcI3Up0CMWonefgunorwyPv3KwqV3+IUlgV+vMtq59ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEypEddhNO99Y6RmgqVOvZ72FKN+xeKQPvix2UjFE14=;
 b=L/kgCo8zuf7kPSeObmGYEFRBC7yJGR3RkRgMEssn39G0YS8+eJ4u9sMjJj1CldbE/V0fVS5JcqWHOtmiVe37Tx7Z63205QcDtb4ZWReTtKHTv7PV/0+69mIPqrinsQpYxmmBtPirhblNPYxAuP8u2+cKH5DMTPHf6HUNpQo5mZ9fEr5JV/cjcE85yvtxCSHxb5YRbw9t+9I/uQlLNB3f6SeYGKvyaZelrR82UQ7FeKmIjhrjklpOd9W1LT/SGGRSnY5wMSd1K0WF04OTcZfjVNzGrH1eksl6eB4WdSKEwfrdCyViy9GriTVOF5c2KsRwn3QAZhGPj07hV4J7wXFaQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEypEddhNO99Y6RmgqVOvZ72FKN+xeKQPvix2UjFE14=;
 b=tNWCTc8ohZxh7VniN2DjeAdeYpBLDPMKdzoc5FjUau9kphrv3LSb3U3illqjrjFPlEImSNpYWZQJI1BMwE9QgKRPg3IepaCDBlZUCjJQqIlKC/i3/JWeHq23rBpU10TeHENP/63YtA3HxM2gWtnsH7SfwfdwwHbnwzq4RBdFq6I=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9138.eurprd08.prod.outlook.com (2603:10a6:102:30d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 11:26:39 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 11:26:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: =?utf-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Tim moto-timo Orling
	<TicoTimo@gmail.com>, Derek Straka <derek@asterius.io>
Subject: Re: [oe] [meta-python][PATCH 2/2] python_mesonpy: New class
Thread-Topic: [oe] [meta-python][PATCH 2/2] python_mesonpy: New class
Thread-Index: AQHZmQ0rqqmfUcrtTE6ilIxEGXAtYa9/GsYAgAAYSgCAAACiAA==
Date: Wed, 7 Jun 2023 11:26:38 +0000
Message-ID: <8236819D-4370-4B6E-AFD1-845010C00239@arm.com>
References: <20230607065547.128661-1-zboszor@gmail.com>
 <20230607065547.128661-2-zboszor@gmail.com>
 <C15808F7-1E10-415B-9281-82CD6FE46FC8@arm.com>
 <782e17f9-9ae6-b6db-6b61-f41e670d4030@gmail.com>
In-Reply-To: <782e17f9-9ae6-b6db-6b61-f41e670d4030@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9138:EE_|DBAEUR03FT005:EE_|AM0PR08MB5505:EE_
X-MS-Office365-Filtering-Correlation-Id: 33130cc3-96f1-42f0-c8f4-08db674a1594
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 LyNYVjoae4qONI/o2S72WinIeTsOopzqsWAv4NVvTFKS0yMjOOKfqT906QpPi/zYk++vZ97+j4kioY6OByHAsKlG3A/jxQ6pv7Z3tVD3DZm9ZNTEiFEuv0hyxvVbJST17MObsujpchSIKHu6lWoLrBoZGQ8t+JjdrTO/ZL7k5TzXJ+GMdqnoWa36AB2RJniapsVgufvKJfhjn34tsaGk/tLaEdtjOnRppH+9BtOPanOzWq7Inh17sDcYmxaWkH0EcU6R1Wvy/BmhpWab/v8IQa4k9DFpLEKJFQ8+L16dzV++gJUNXv3itR47wlpXL3/dwUQTn7l1lFvbjxwGX3iVFkHMVPm8mbJviOTgloYxgNbyEJXT/aVo7y+bKJJd5YzFbLOsxXYRpCgaW58LiWG5C/60OiOTi1y0I8DUeatD3tIC7ExwpBdJj3bT3zv5ONvms1y1/kz2lXjLN7rQb4YklzQaUp/DzsRcsDveutoU+IGpvS+AF0Jmx23q+Ub6FY8vtGczpdP0i1j1BOckUsDx6x6H0ujWP9MgWHoJloP2j+0VCNxyRHIopbs7xeDs7tl0gXMGyzSciA/jkOsXAG7+33/Eu3olyyjvhyzdmfFrwHsOcP+TlLlweFlfCPZZztXLoF4eD8FPxdkStqgRsKgg4fgWvjBwItKrQJ89tiN88wF3HrskG12B+UDn2AUcRwkE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(451199021)(71200400001)(478600001)(66556008)(8936002)(54906003)(8676002)(5660300002)(36756003)(38070700005)(33656002)(86362001)(4744005)(2906002)(76116006)(66946007)(6916009)(66446008)(66476007)(122000001)(64756008)(316002)(91956017)(4326008)(38100700002)(2616005)(41300700001)(53546011)(6512007)(6506007)(26005)(6486002)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D4ABF0185AD454B86CC2D458DD8CBC7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9138
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2010902b-2971-455c-903b-08db674a0f9a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RBiUS5dLsy4GgM3kGcGXhSTVQs21t8b6UOynX494qyJQvGTHk+NDW4BmC9UPvvMIn+Xt30fvfgasKv6DwGFx8/d2mcz/nOx7Q5V/Xvaa0Ph6j4VbZQF9JYlG2AUh00hCkMOz1ZGEWoJVt5KyKOXF+3uAdu10AASWP59VBTvpx4o7+qSKosJfiZ5D1DfjI3wueUqaDewHAo5e6v531au/qOvTWxziNOczdUJ0PZTFgAnXbPBcrNVqICGKKR66VNNcRmRJNwKm8v2LV9eYHyXasmQteM/UoUGOaG6aTzaa+L4FBUqmHC8KBH+fsdJBFLB3+l8EWVi+b7sMK/CbjyAiofueF0xAtAEV5lba9NCg6owPLMcmeoqj2RFeDMaTgYXXMC68LuL/3gHD6q2VpwswEoHXFWYoemcWFVzPUWvwuJs7Z6WmlK6suR0vYuVTtZQaivlQjJ/TAwpLxRsRN+51fnKq/wIK30Y1fbKPPAeIyL7TrrA9x4vw4fiQCq3BSPp+n3WWDLiWyYtGjc8uEMEvAM1fyaJGON8O2x0AlK3aR6E7hXGlAJWJSyKsWmUsCOocHJfwBZX2sNoj0SOG5ymep91z97jeITofezZnWRnMXx3vni01b3dJmN4eieE0r7btFQlJnii/OLKlEfua0UURt5uAURZyc10A+cXcOxuyTNl7GNK5aRfbmqY8h/ZpvcWtnDq0Nxfz7Ow0LXfAPUcm1u9X6nHHJ9y01gxgFvmegjU=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(6862004)(356005)(5660300002)(316002)(81166007)(4326008)(70206006)(70586007)(8676002)(8936002)(41300700001)(86362001)(33656002)(36756003)(82310400005)(4744005)(2906002)(40480700001)(53546011)(2616005)(336012)(6512007)(107886003)(26005)(6506007)(186003)(47076005)(6486002)(54906003)(36860700001)(82740400003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 11:26:49.0214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33130cc3-96f1-42f0-c8f4-08db674a1594
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5505
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 11:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103175

T24gNyBKdW4gMjAyMywgYXQgMTI6MjQsIELDtnN6w7ZybcOpbnlpIFpvbHTDoW4gPHpib3N6b3JA
Z21haWwuY29tPiB3cm90ZToNCj4+PiArIyBUaGlzIHByZXZlbnRzIHRoZSBtZXNvbiBlcnJvcjoN
Cj4+PiArIyBFUlJPUjogR290IGFyZ3VtZW50IGJ1aWxkdHlwZSBhcyBib3RoIC1EYnVpbGR0eXBl
IGFuZCAtLWJ1aWxkdHlwZS4gUGljayBvbmUuDQo+Pj4gK01FU09OT1BUUzpyZW1vdmUgPSAiLS1i
dWlsZHR5cGUgJHtNRVNPTl9CVUlMRFRZUEV9Ig0KPj4gSWYgbWVzb25weSBldmVyIHN3aXRjaGVz
IHRvIOKAlGJ1aWxkdHlwZSB0aGVuIHRoaXMgd2lsbCBicmVhaywgcmlnaHQ/ICBNaWdodCBiZSBi
ZXR0ZXIgdG8gcGF0Y2ggbWVzb25weSBpbnN0ZWFkLg0KPiANCj4gV2h5IHdvdWxkIGl0IGJyZWFr
PyBJdCBkb2VzIG5vdCBhZmZlY3Qgd2hhdCBtZXNvbi1weXRob24gaXMgYWRkaW5nIGludGVybmFs
bHkuDQo+IA0KPiBUaGlzIG9ubHkgcmVtb3ZlcyB0aGUgc2V0dGluZyBpbXBvc2VkIGJ5IG1lc29u
LmJiY2xhc3MNCj4gYW5kIG9ubHkgbmVlZHMgdG8gY2hhbmdlIGlmIG1lc29uLmJiY2xhc3Mgc3dp
dGNoZXMgdG8gLURidWlsZHR5cGUuDQoNCk15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBtZXNvbi5i
YmNsYXNzIGlzIHBhc3Npbmcg4oCUYnVpbGR0eXBlIGFuZCB0aGVuIG1lc29ucHkgaXMgcGFzc2lu
ZyAtRGJ1aWxkdHlwZS4NCg0KVGhpcyA6cmVtb3ZlIHJlbW92ZXMgYW55IOKAlGJ1aWxkdHlwZSBv
cHRpb24sIHNvIGlmIG1lc29ucHkgY2hhbmdlcyB0byB1c2luZyDigJRidWlsZHR5cGUgaW5zdGVh
ZCBvZiAtRGJ1aWxkdHlwZSB0aGVuIF9ib3RoXyBidWlsZHR5cGUgb3B0aW9ucyB3aWxsIGJlIHJl
bW92ZWQsIHdoaWNoIGlzbuKAmXQgd2hhdCB5b3Ugd2FudC4NCg0KUm9zcw==

