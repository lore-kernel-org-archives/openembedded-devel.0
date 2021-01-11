Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.78])
 by mx.groups.io with SMTP id smtpd.web11.34957.1610376731350310799
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jan 2021 06:52:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=uG8jvFAM;
 spf=pass (domain: spinetix.com, ip: 40.107.1.78, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLdq2MQulFRX5yBB3AM5S116DBjxZ4kyKMgGWazulTplx+KBp/kEnTk7UxLX8yIyp0zD2g8KIajMsgHqYJFhMpizKHLxCqbd7zrY935xv2RBf+qF5qCWP9xNLd/tRzzRsRnPz/TBHpFedy5z8MXURaf5LXcxbuKtPDyss3D+oJeIBlL3rBn02PCBteaJxAZiOG50gQb9zoNOvj5OgmEHXl2UTJFY4h3hO7VhdtlsmQaCq3HBBlJ48gQ9DEEiRFv4bPd/Wk0LMrPmxr4u1wedxL5oxW20Wvu6jN4JP2Qw21oKYwZPAqyPAu7BBIeZecnjhO4B23G7ppdwQnX/LAcj8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDIAxChbv/1+hklB5yXXoGteemcjR05c2jkFtIIVvXQ=;
 b=XMXf1Jevn3QrLS4JrqepHZ9x48oF4D7bYhTL8mZvMIdNMB6GlNqDgSRnlm+trOybuMDfMumqu9CeUO059VU7G6qHtDjUE6GKXrrMybDIdKmF2taUXfwvZJQHq+DlZAnHUm6KdqtX4bQHajDPhHbP9n4Y+RmQPEehcQh2iuNuXdGyI5RFh/ZONF82tZInUFt6fQPzTERzjEbhxer5ek+kb/bmU4xx8eKwpokSsx4P6OJd3/h5ZlCmCEnrdbmy72gMQxfmXT6wGvFAdGOVe849ar00fzaq8rnaoQRlNGzwVucss2yHOFz6CemGI7jCwTav7kPFx8eTW+kEU4La5+PxJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDIAxChbv/1+hklB5yXXoGteemcjR05c2jkFtIIVvXQ=;
 b=uG8jvFAMFyCHt1wz73skWeJeRe2lN3P7D4AdNFJzObKxJqdkYXgUq+SeXI+4QUWtCh6o7uoeREWdQmNzHKVXdCE32LXiHdKYegjRI7bPm/SLIZ83C3TK57AjAsyNCiSRWAF/lQWxmytF7Qsa3joYu8eDnOCpYB005yspQunFHAU=
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DB6PR01MB2949.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 14:52:08 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c880:793c:c5b1:c7a8]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c880:793c:c5b1:c7a8%5]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 14:52:08 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: akuster808 <akuster808@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [gatesgarth][meta-multimedia][PATCH 1/2] gssdp: Upgrade to 1.2.2 -> 1.2.3
Thread-Topic: [oe] [gatesgarth][meta-multimedia][PATCH 1/2] gssdp: Upgrade to
 1.2.2 -> 1.2.3
Thread-Index: AQHW5SRF3nv9Bucj/EWBIj3L5BcN66oihuwAgAAAN2A=
Date: Mon, 11 Jan 2021 14:52:08 +0000
Message-ID: 
 <DB6PR0102MB26301088AE72EDF1F07AEF5088AB0@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
References: <20210107183743.28823-1-Diego.SantaCruz@spinetix.com>
 <7ef6b205-3759-737c-6c16-677556062757@gmail.com>
In-Reply-To: <7ef6b205-3759-737c-6c16-677556062757@gmail.com>
Accept-Language: en-GB, fr-CH, fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=spinetix.com;
x-originating-ip: [178.198.240.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f58e79be-7952-4716-2424-08d8b6407853
x-ms-traffictypediagnostic: DB6PR01MB2949:
x-microsoft-antispam-prvs: 
 <DB6PR01MB2949D5BF555F85A8B75256D488AB0@DB6PR01MB2949.eurprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 2IWgyD/CMF2Vj/A0hUPE0UM45HYHdA1enS7PibiyBbCFrDitnSsKUalPD5PTkxYQOQqQ9fwVnbm6VLhA13C/CxOMAOcwvAacokuXjWQhoJu7BEqt5OcglQWb6VfzXS1vFALlFKjlTziXyMRBXXFIdjR6LTb5XFe2X1xwkhaLgaWfDAm/eZyOSsHR7xHGIa8Uwk0wC53dY9BkxTzwyIqJiqx0VBIjaGj+5FWqP+JE6Qlekg6L0ObUrpdhFr9q1fQUau27iuWJFewIT7mYS347Zo0ga+tN4lXXGyaRS7A4XPDRl36JWxf4w3I7wmkMn4yRgUv2y8Dff4QgdcIJuj9ojq0HXe4Anw1ulcRI2cSFX++gn8QytR1K0wxGDSn5EB9xoN80AHaKuQis7D+WT/sirjYqeAS9XXe8iZEaC3YTSA/mC+MsTKnqXGX60FQDsTDZFBrbYXZhJxnat/+GW3BSbQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(376002)(39830400003)(396003)(5660300002)(52536014)(9686003)(2906002)(966005)(7696005)(76116006)(110136005)(83380400001)(86362001)(478600001)(66446008)(71200400001)(8936002)(66946007)(316002)(53546011)(55016002)(66556008)(186003)(66476007)(6506007)(4744005)(33656002)(64756008)(26005)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?U3NDbUJWUXFIRE9WelBnK1hSZ0hjUmxKc0p0WjYrajhVSTJwdElyWVl1Kzhp?=
 =?utf-8?B?L21iQ1lTS1ZxUis1VUx1OTg1OSs2Rlg4ZHhRNTFwUjhEL0J0M1VFak1qaXMx?=
 =?utf-8?B?Q3o1cGNmWUVnamFObjFqWGpTSjZDb2dKOGpoTHRMaUxlYStZbE1nTStKeHMv?=
 =?utf-8?B?VTg5dEhkaXlDTVBUMWZzTk1HTTNmSkkvOGhiYzNPKzdpVnRVRExQMDhkMkxx?=
 =?utf-8?B?bStlRGZhZjVoZTg4YXEzYVVsMWZlRmlkMzJ3MWs2ODVVaXJxcjJJdTVTNFVj?=
 =?utf-8?B?VXRpSnhiWVB5L2R2UlhnWHJhQzZNTmZOOWRjQXoySGtiRitpcUNzSGpTa1pl?=
 =?utf-8?B?NTRvWVVlNVRLS3E5Q2NjQ2x1aGwyOUp6Si9HOThDbEh0K1Nsa3hNaTd4a1hH?=
 =?utf-8?B?alBhNzJjaE1yekQ5YjBCNzVHam1xQTYxR29jTGY1MGFDcGdycWJRODYzS3Rw?=
 =?utf-8?B?aTNHeVowVm9veGdKSWhVaTlNWjgybGdlbjNtSE9vKzcvbCtveDBSM1dySkpm?=
 =?utf-8?B?Zy9PanU4bkc5YUgzMXlSTlkxMHR2NTB6eUxmZWw1L0JEZmdnMnkvQ0xJaCth?=
 =?utf-8?B?Tk1NQ3hLNkpWS3ZJTXpJRWw1TkIrN2tTbFFTYzcyRFBQWXU3SWhDY2ljdExL?=
 =?utf-8?B?WEZCd0trRTh1RDJCOUNFclptTVBVWGxuNmZlUE8wN2x0TEJLMzdEWkkzRHpx?=
 =?utf-8?B?YUFPbW1nU09UbHlwK3FVVDZ6bDI5RVBacFdCK0pqQUVJRmQ0OUdSNis3ajVH?=
 =?utf-8?B?R3ZvaFdTaEYwUTlkYWZDZTBoMWp5UDhZSzdabmZKZ3B0RjIzaDF4TmpXQW5t?=
 =?utf-8?B?Sy9RTUc3Q0NUM3lCRDk4dG9WR0VFVExXeFBOWjBFWG4xVHVEQlpCVVRBM2NY?=
 =?utf-8?B?MTJaa2FHV1l1R0hQMWpyUUZmNlF6WncrcnY1dEU4Ujh4eEFQVmZ2dFl5U2Np?=
 =?utf-8?B?T0lpUllxNndJaE9JV0tiSHQvMFRnVk85ZmZ2ajlYZytuMlhpYjE1NEtWTk1H?=
 =?utf-8?B?NjE2c2tiZUJ6TDROMlJrVC9OWStIakRCeDlXRk5kMzBLL1hrcm9OamJmK0Rl?=
 =?utf-8?B?RHZjVFpZS2c1R0k3ZjBXL256bk1kT0RBekp2b04raTg4dXJtZm9VdzVmc1ha?=
 =?utf-8?B?U3Uwd2dtRmxhMEYvK01XVDhwbzJPcjZDckNXMzNtL1A3OFAyN1k0R2FpcGhK?=
 =?utf-8?B?bVNmTjhyUXV1Z01PVERXL1orR1plUjU4d0krUEpSVURmd29CYnVvVE9NanNr?=
 =?utf-8?B?U0dEQTR2cnd0OGtTV1k5bHozbDJQTWJ1dk5zUW4rQS91Ni9wUjQ3aHlwRi95?=
 =?utf-8?Q?hi5N74kT2tCvw=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f58e79be-7952-4716-2424-08d8b6407853
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2021 14:52:08.5402
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ksbf++Ld8HUkIVi0SgU5Yd9Y6Ee8lO1CtA+VnfJEX5F3eY3OiA6hrwsk1chqxLIFiO4NAl8/GL0O1va6fxDiNgRxiJ/fqHDs/fZGOb8MCP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR01MB2949
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBha3VzdGVyODA4IDxha3VzdGVy
ODA4QGdtYWlsLmNvbT4NCj4gU2VudDogMTEgSmFudWFyeSAyMDIxIDE1OjQ3DQo+IFRvOiBEaWVn
byBTYW50YSBDcnV6IDxEaWVnby5TYW50YUNydXpAc3BpbmV0aXguY29tPjsgb3BlbmVtYmVkZGVk
LQ0KPiBkZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbb2VdIFtn
YXRlc2dhcnRoXVttZXRhLW11bHRpbWVkaWFdW1BBVENIIDEvMl0gZ3NzZHA6IFVwZ3JhZGUNCj4g
dG8gMS4yLjIgLT4gMS4yLjMNCj4gDQo+IA0KPiANCj4gT24gMS83LzIxIDEwOjM3IEFNLCBEaWVn
byBTYW50YSBDcnV6IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+IERlcGVu
ZGVuY3kgb2YgZ3VwbnAgMS4yLjMNCj4gDQo+IFdoYXRzIGluIHRoZSB1cGRhdGU/DQo+IA0KDQpG
cm9tIHdoYXQgSSB1bmRlcnN0YW5kIGZyb20gaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01F
L2dzc2RwLy0vYmxvYi9nc3NkcC0xLjIuMy9ORVdTIA0KICogQnVnZml4ZXMNCiAqIE9uZSBBUEkg
YWRkaXRpb24gdG8gc3VwcG9ydCB0aGUgZml4IC8gbWl0aWdhdGlvbiBmb3IgQ1ZFLTIwMjAtMTI2
OTUgaW4gZ3VwbnANCg0KLS0gDQpEaWVnbyBTYW50YSBDcnV6LCBQaEQNClRlY2hub2xvZ3kgQXJj
aGl0ZWN0DQpzcGluZXRpeC5jb20NCg0K
