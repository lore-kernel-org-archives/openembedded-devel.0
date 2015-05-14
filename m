Return-Path: <B40290@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0134.outbound.protection.outlook.com [157.56.111.134])
	by mail.openembedded.org (Postfix) with ESMTP id C370D7226D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 May 2015 06:46:11 +0000 (UTC)
Received: from BY2PR03MB441.namprd03.prod.outlook.com (10.141.141.142) by
	BY2PR03MB441.namprd03.prod.outlook.com (10.141.141.142) with Microsoft
	SMTP Server (TLS) id 15.1.160.10; Thu, 14 May 2015 06:46:10 +0000
Received: from BY2PR03MB441.namprd03.prod.outlook.com ([10.141.141.142]) by
	BY2PR03MB441.namprd03.prod.outlook.com ([10.141.141.142]) with mapi id
	15.01.0160.009; Thu, 14 May 2015 06:46:10 +0000
From: Guo Chunrong <B40290@freescale.com>
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Devel List
	<openembedded-devel@lists.openembedded.org>, Martin Jansa
	<martin.jansa@gmail.com>
Thread-Topic: [oe] [meta-networking][fido][PATCH] lmsensors-config: fix a
	warning about not existant S
Thread-Index: AQHQgXO/mdx+Jn0PiEGGMDmvzitLc51iQkOAgBjeHSA=
Date: Thu, 14 May 2015 06:46:09 +0000
Message-ID: <BY2PR03MB4412580C69DE9CAB48135A984D80@BY2PR03MB441.namprd03.prod.outlook.com>
References: <1430198723-7927-1-git-send-email-b40290@freescale.com>
	<CAP9ODKpqxGuYYWndomz2VdVrKSm6RonyJKR6O_goXWQAg+kkvA@mail.gmail.com>
In-Reply-To: <CAP9ODKpqxGuYYWndomz2VdVrKSm6RonyJKR6O_goXWQAg+kkvA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ossystems.com.br; dkim=none (message not signed)
	header.d=none;
x-originating-ip: [199.59.231.64]
x-microsoft-exchange-diagnostics: 1; BY2PR03MB441;
	3:4TA3vc3kum4vZYwYswhVuEzAHWM2Cit29K3S/oGT482xRRFFRmZ65HUbfwPZO9gMagvnyWIutPds6KVzN5/5TRNN5A577+aXM9gfZyn1Pf5/jqrixy+tywTB2KHVFVaaIUgxEpdT8g0kvDdFZYnIuA==;
	10:4ejvD5t8zvoTthNGpXYc2uM1kO3yKNCaFun1miENG4Sn2z8UMC7f9dLrHnEuB56tO/9/xufHth3F03FOpLQH68E1BX8FsB39b2qbLkAA6Ss=;
	6:a93V1EDfFkX2R7JOZtuTuVV6RpreXnZ+YE63jqFtx1SeSsngwZiDEVyt5CvjLDtW
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB441;
x-microsoft-antispam-prvs: <BY2PR03MB44122D8BD84FABD5B72591C84D80@BY2PR03MB441.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BY2PR03MB441; BCL:0;
	PCL:0; RULEID:; SRVR:BY2PR03MB441; 
x-forefront-prvs: 0576145E86
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(13464003)(24454002)(51704005)(377454003)(106116001)(74316001)(87936001)(40100003)(2656002)(122556002)(16601075003)(76576001)(33656002)(575784001)(86362001)(54356999)(76176999)(50986999)(66066001)(62966003)(77156002)(19580405001)(19580395003)(5001960100002)(107886002)(99286002)(92566002)(102836002)(77096005)(15975445007)(5001770100001)(189998001)(2900100001)(2950100001)(46102003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR03MB441;
	H:BY2PR03MB441.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2015 06:46:09.2985 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR03MB441
Subject: Re: [meta-networking][fido][PATCH] lmsensors-config: fix a warning about not existant S
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 May 2015 06:46:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UGluZ3MhDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBvdGF2aW8uc2FsdmFk
b3JAZ21haWwuY29tIFttYWlsdG86b3RhdmlvLnNhbHZhZG9yQGdtYWlsLmNvbV0gT24gQmVoYWxm
IE9mIE90YXZpbyBTYWx2YWRvcg0KU2VudDogVHVlc2RheSwgQXByaWwgMjgsIDIwMTUgNzowMSBQ
TQ0KVG86IE9wZW5FbWJlZGRlZCBEZXZlbCBMaXN0OyBNYXJ0aW4gSmFuc2E7IEd1byBDaHVucm9u
Zy1CNDAyOTANClN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLW5ldHdvcmtpbmddW2ZpZG9dW1BBVENI
XSBsbXNlbnNvcnMtY29uZmlnOiBmaXggYSB3YXJuaW5nIGFib3V0IG5vdCBleGlzdGFudCBTDQoN
Ck9uIFR1ZSwgQXByIDI4LCAyMDE1IGF0IDI6MjUgQU0sICA8YjQwMjkwQGZyZWVzY2FsZS5jb20+
IHdyb3RlOg0KPiBGcm9tOiBDaHVucm9uZyBHdW8gPEI0MDI5MEBmcmVlc2NhbGUuY29tPg0KPg0K
PiAgIFNldCB0aGUgUyB2YXJpYWJsZSB0byAkV09SS0RJUiB0byByZW1vdmUgdGhlIHdhcm5pbmcg
YWJvdXQgUyBiZWluZyBub3QgZXhpc3RhbnQNCj4gICAod2hpY2ggaXMgdHJ1ZSBmb3IgdGhpcyBw
YWNrYWdlLCBzaW5jZSB0aGVyZSBhcmUgbm8gb3JpZ2luYWwgc291cmNlcyBmb3IgaXQpLg0KPg0K
PiBTaWduZWQtb2ZmLWJ5OiBDaHVucm9uZyBHdW8gPEI0MDI5MEBmcmVlc2NhbGUuY29tPg0KDQpU
aGlzIGlzIGV4YWN0bHkgdGhlIHNhbWUgY29tbWl0Og0KYWRkZmIwYjc4NmM5MDMzM2E3MDg3M2Ji
NzE1ZDg0Yzk3NDEyYjNjOSBzbyBpbnN0ZWFkIG9mIHJlZG9pbmcgaXQsIHlvdSBzaG91bGQgY2hl
cnJ5LXBpY2sgaXQuDQoNCk1hcnRpbiwgcGxlYXNlIGNoZXJyeS1waWNrIGFkZGZiMGI3ODZjOTAz
MzNhNzA4NzNiYjcxNWQ4NGM5NzQxMmIzYzkNCmFuZCA0YTRiOWQyNWRiODYxMTE4NzJjNzNkYWFh
MjExNmFkZGZiM2QyNmUxDQoNCi0tIA0KT3RhdmlvIFNhbHZhZG9yICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBPLlMuIFN5c3RlbXMNCmh0dHA6Ly93d3cub3NzeXN0ZW1zLmNvbS5iciAgICAg
ICAgaHR0cDovL2NvZGUub3NzeXN0ZW1zLmNvbS5icg0KTW9iaWxlOiArNTUgKDUzKSA5OTgxLTc4
NTQgICAgICAgICAgICBNb2JpbGU6ICsxICgzNDcpIDkwMy05NzUwDQo=

