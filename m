Return-Path: <prvs=95684d004=Alistair.Francis@wdc.com>
X-Greylist: delayed 601 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 01 Mar 2019 00:25:46 UTC
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail.openembedded.org (Postfix) with ESMTP id 864DB6D268
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Mar 2019 00:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1551399963; x=1582935963;
	h=from:to:cc:subject:date:message-id:content-id:
	content-transfer-encoding:mime-version;
	bh=gTfCC/oHgIz7xVAEGjZKw0w/ek1r+UtG+GWJf9EFT/g=;
	b=adFD9DBINMlMdln9g/DGZyTzc8lGbgExmX3qykG/yNaNpdSIaGdmCzrg
	62vOSxwjN8K4mXzr43Q62MseLlKpbvPksi26A4d6LBpKyOmyO+wXMgml8
	AVD1OL0cpDFCaCcSbNI1lnKaRY81fm8ClmvWLJUnc4EK/PpK4axKIji9C
	I8Ua3vMfHjBbzpunZKybY2vJFVZnQLgftc8VVvmnSg7sC0sdU9BGsSg4t
	kyB+Lo5VrCelzVh4FjJjgPuldsp+fRRZ55SD2+Yl0KJ3IOlhC/xIbLoJd
	x0pwz+k9qymbVhB1Feul+cCVj8POQ6H1UrTLJVof1AXSep7EM8ZcEe2ZR g==;
X-IronPort-AV: E=Sophos;i="5.58,425,1544457600"; d="scan'208";a="200854136"
Received: from mail-dm3nam05lp2050.outbound.protection.outlook.com (HELO
	NAM05-DM3-obe.outbound.protection.outlook.com) ([104.47.49.50])
	by ob1.hgst.iphmx.com with ESMTP; 01 Mar 2019 08:15:47 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=gTfCC/oHgIz7xVAEGjZKw0w/ek1r+UtG+GWJf9EFT/g=;
	b=BIrAU4o3P8Uy7oM8yhi5NI7K7CuxSJMmgdCvzstxKKH/m8rcQRhmeIiXRUrk4Ft3B44KvcgOm3VuJc/XyZDhggqu8QqELvkz4jbTbFIcaV9oSkz4rnyd21pyVhhp4qP5jYj0JaSMGH1DJEb73D/t5Hv+FdH9fpWwdXxuz/1HBkc=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0734.namprd04.prod.outlook.com (10.172.167.147) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1643.20; Fri, 1 Mar 2019 00:15:44 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::f55c:272b:6401:1b8c]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::f55c:272b:6401:1b8c%10]) with mapi id 15.20.1643.022;
	Fri, 1 Mar 2019 00:15:44 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH] mimic: Initial commit of version 1.2.0.2
Thread-Index: AQHUz8PpMsKjf3ziZ0y5bn8Fy98mwg==
Date: Fri, 1 Mar 2019 00:15:44 +0000
Message-ID: <20190301001504.4459-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR11CA0084.namprd11.prod.outlook.com
	(2603:10b6:a03:f4::25) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15815c3b-0850-4107-e60a-08d69ddb0bf9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0734; 
x-ms-traffictypediagnostic: MWHPR04MB0734:
x-ms-exchange-purlcount: 2
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtNV0hQUjA0TUIwNzM0OzIzOnMrY1pTSXhUWHZiV1ZDVTk2Sld5ZEpKWElU?=
	=?utf-8?B?TTRwRHh1UGUvSVZ6NUlwanNNTDhDaHNrMndhcVU0ajA2Y1kzbUtaUlYyQWRY?=
	=?utf-8?B?UnhhQXZPcUc1Q3FTaFZNekx3L3p1V3U2RkNmeklzRW1BU3V0SlFuUU1zWTIr?=
	=?utf-8?B?cjdNQTZGbkFIdlF3WTBOdzJkbGNFc2lBV2NhV2sxUDRRdHMyYVNZSEdXQU9k?=
	=?utf-8?B?LzhPczNsV1hHd1oyS3oxSGFVcDQvNEszcW95YkEyYVRxMjd2WHcvMVNVQ2lE?=
	=?utf-8?B?UW1mcnNrQVJNeGsybGxMcHpZMlU2Y3FZa0JaeUpxQzQyVDAxMDMrbENmUXRm?=
	=?utf-8?B?aWFaTUtOUFBabjhyQVlDUEdZckk2NWFOZ3dLY291MnZhelY2MWdEdGVocUhv?=
	=?utf-8?B?amJ5TzMrQVY2OUtOVUEwN2xUK2FiNUZ2ZTdCZU5tQzZDTEJrR3EvN0daQWdj?=
	=?utf-8?B?Qko1T2xIc1ZuSDk5eDB4QjhQOGJmTXJZSzNmTkMzOEN2aS9XRzhScnN2S1B1?=
	=?utf-8?B?TDE0ZTV5ei9iS0g3WmI1ZnNMV3VjbFpKbXAwbThwRXFDeHplQWdHRG1rUFBH?=
	=?utf-8?B?TVh6UHBVRGhEaHNmU1dzYzFzamsrZ3FEbE53VUt1WjV6bVhJM29LWGludVIv?=
	=?utf-8?B?S3lkZ0dCQXBrdmxzalhOWWZDelcyU0dqQVozSVFHcGcvZWoxZXNibTRYclZk?=
	=?utf-8?B?VlFBanl1dlZIYlpPM0kxZk9rZmtJYjhKS01hb1gvTm44d1NqbWJxZUY3VTVO?=
	=?utf-8?B?M0VyMlpYV2VycGpUVHVHOHFQNDNUeitobkVIRGVuTWwyR0ZKZ01CU05Bb2Vk?=
	=?utf-8?B?anJFM3Q2RXkrbDRzMk1YUEdNckRWM1RsdFo1K2V1c1VlVStpNW9YN1I1NzFB?=
	=?utf-8?B?WUJKNzY0YkhpSm9VUTAwQ2hZMFErR2lKNUtLQS9DZjVRbUp5OHdOK0g1WUNp?=
	=?utf-8?B?SDhQZ3ErSDdxZXlyekxOVVhjSVpKYmh5RGxtQWpYWStMVTVrMWtuTVNuaCtD?=
	=?utf-8?B?ZjJKTXJlTUFNZi80WGxRbjk3eHl3eXVmNTBtUGRnM21pN2NpQlFsR1lmMEtn?=
	=?utf-8?B?SkZyTElBVzVhT0d5NEpjY2FyKzZJOWFrV2I5SU0wSWFFWmpIUVJwenY2eW5u?=
	=?utf-8?B?MUdjcmxaVEZHUG40bGxvM09TTWw0L29YSnRyY0kwZEI5UkR1SWV5QjZzaUpQ?=
	=?utf-8?B?WHppVm5JUC9CMnYwWVlEbnQ1cllqMFd4MkloSkZBeVNGT2RPazB5Nk5Gc1FZ?=
	=?utf-8?B?Mk0zVXdLSFdsVGQzU2xmd24vblk2N28xdk9UZlBmbTRzei9aaldtTFZjbDZS?=
	=?utf-8?B?V2RGeVJBdFJpQVNpRWZIeU9pRkhyYUZSM2cvTm10SEsxZmxxZjI4Q09LTmRG?=
	=?utf-8?B?NGQ4VjFPb0pXdTNsSnJYWTVqa29nbExiZlFxb2d3Rm5KTFVrUFhwb3R0QjF4?=
	=?utf-8?B?QlZYd0VzZFI3a1JDTXg5a05pZmZMbDNhSWZnbXNvWjcxT3ovdjRNeHoydWxF?=
	=?utf-8?B?N213RlQyRDFYb0ZreFNEY1RxVjFxU3JrZE15U1RycU1ReVNZVWJvSTd1NHl0?=
	=?utf-8?B?cjNHOHNOM2ZSSkRLMTFFU3p6dkN3bmlMOGZhY3lteGdaZHdiR3BiOVVUbXNT?=
	=?utf-8?B?VW1sNnJ2enpwMlZpMCtDOThuK21DRDhGdUQ2V3hqMzA1Y01BTC9kY004ZDBT?=
	=?utf-8?B?cGZaRy93NnY5OUpzUk94RmVqd2tuRFc3VnQwbmF2WW85aW9ZWlJzSHNTVWVC?=
	=?utf-8?Q?LH03i/9CjVlnlN8c2IWyF0wHQmBCCi+8xRfyA=3D?=
x-microsoft-antispam-prvs: <MWHPR04MB07347E3E590EC9448C00975E90760@MWHPR04MB0734.namprd04.prod.outlook.com>
x-forefront-prvs: 09634B1196
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(39860400002)(396003)(346002)(376002)(366004)(189003)(199004)(24433001)(68736007)(54906003)(305945005)(8676002)(5660300002)(106356001)(99286004)(86362001)(36756003)(2906002)(66066001)(44832011)(26005)(81156014)(386003)(81166006)(2351001)(71190400001)(6506007)(71200400001)(2501003)(52116002)(105586002)(25786009)(102836004)(7736002)(2616005)(4326008)(6436002)(256004)(186003)(6916009)(6486002)(476003)(486006)(6306002)(5640700003)(6512007)(50226002)(1076003)(14454004)(53936002)(316002)(8936002)(6116002)(478600001)(72206003)(97736004)(966005)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0734;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GXxxrfz67loVQKTlq6xuCn0yQwND+U5uVp6CUFBN5dqpVkbbM8EBgxeeON1PWnX2ys6jB24pFc3z1WjLpMZFr4qHb9fNWoUbc48r7Q0QVKhyft1RNfry7WCJ1fanb2d1oe3t2riurxvkXyteNIeEAEP236SU6AgO94z8eSSMkderbOu/FfC57UwshbCTOXAfwnlFjPNlJPa6YzPHB9jqH/kUenB2HD8XP+USevOs89z55P8RppDjyvEJNRbADuyULN7rDhRVb4Mpc5sayceU+pnmJmsMJ5sMyV7kQJINFt6u0UCsGmhW13n08FI2IvprfxP7tk8IPDHpZ6m2eOlYGP+yGbqA4W1lfyIAK6Dos1cMbpZVSbQ0+AuAnSQHMXOdqmUspRhRmKWpESn7Nzsg8nGz35Uha03nUZoTT4v5kK8=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15815c3b-0850-4107-e60a-08d69ddb0bf9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2019 00:15:44.2508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0734
Subject: [PATCH] mimic: Initial commit of version 1.2.0.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Mar 2019 00:25:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <24D2816258485643B0368A0EEF18412B@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

U2lnbmVkLW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29t
Pg0KLS0tDQpJIHdhcyBub3Qgc3VyZSB3aGF0IHRoZSBsaWNlbnNlIHNob3VsZCBiZSwgaXQncyBh
IGxpdHRsZSBjb25mdXNpbmc6DQpodHRwczovL2dpdGh1Yi5jb20vTXljcm9mdEFJL21pbWljL2Js
b2IvZGV2ZWxvcG1lbnQvQ09QWUlORw0KDQogLi4uL3JlY2lwZXMtbXVsdGltZWRpYS9taW1pYy9t
aW1pY18xLjIuMC4yLmJiICAgIHwgMTYgKysrKysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2Vk
LCAxNiBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtbXVsdGltZWRpYS9y
ZWNpcGVzLW11bHRpbWVkaWEvbWltaWMvbWltaWNfMS4yLjAuMi5iYg0KDQpkaWZmIC0tZ2l0IGEv
bWV0YS1tdWx0aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRpYS9taW1pYy9taW1pY18xLjIuMC4yLmJi
IGIvbWV0YS1tdWx0aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRpYS9taW1pYy9taW1pY18xLjIuMC4y
LmJiDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwLi5iZDQzZmUzODkNCi0t
LSAvZGV2L251bGwNCisrKyBiL21ldGEtbXVsdGltZWRpYS9yZWNpcGVzLW11bHRpbWVkaWEvbWlt
aWMvbWltaWNfMS4yLjAuMi5iYg0KQEAgLTAsMCArMSwxNiBAQA0KK1NVTU1BUlkgPSAiQSBmYXN0
IGxpZ2h0d2VpZ2h0IFRleHQtdG8tc3BlZWNoIGVuZ2luZSINCitERVNDUklQVElPTiA9ICJNaW1p
YyBpcyBhIGZhc3QsIGxpZ2h0d2VpZ2h0IFRleHQtdG8tc3BlZWNoIGVuZ2luZSBkZXZlbG9wZWQg
YnkgTXljcm9mdCBBLkkuIGFuZCBWb2NhbGlELCBiYXNlZCBvbiBDYXJuZWdpZSBNZWxsb24gVW5p
dmVyc2l0eeKAmXMgRmxpdGUgKEZlc3RpdmFsLUxpdGUpIHNvZnR3YXJlLiBNaW1pYyB0YWtlcyBp
biB0ZXh0IGFuZCByZWFkcyBpdCBvdXQgbG91ZCB0byBjcmVhdGUgYSBoaWdoIHF1YWxpdHkgdm9p
Y2UuIg0KK0hPTUVQQUdFID0gImh0dHBzOi8vbWltaWMubXljcm9mdC5haS8iDQorU0VDVElPTiA9
ICJtdWx0aW1lZGlhIg0KKw0KK0xJQ0VOU0UgPSAiQlNELWxpa2UiDQorTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NDE2ZWYxY2E1MTY3NzA3ZmUzODFkN2JlMzM2NjRhMzMi
DQorDQorREVQRU5EUyA9ICJjdXJsLW5hdGl2ZSBpY3UiDQorDQorU1JDUkVWID0gIjY3ZTQzYmYw
ZmE1NjAwODI3NmI4NzhlYzM3OTBhYTVmMzJlYjJhMTYiDQorU1JDX1VSSSA9ICJnaXQ6Ly9naXRo
dWIuY29tL015Y3JvZnRBSS9taW1pYy5naXQiDQorDQoraW5oZXJpdCBhdXRvdG9vbHMNCisNCitT
ID0gIiR7V09SS0RJUn0vZ2l0Ig0KLS0gDQoyLjIwLjENCg0K

