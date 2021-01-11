Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.82])
 by mx.groups.io with SMTP id smtpd.web11.35015.1610377018137465135
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jan 2021 06:56:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=cMIl6pgO;
 spf=pass (domain: spinetix.com, ip: 40.107.5.82, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PWLsQsrsNFJSoatmIpSa72qDBTVVx2uzBmhOJ4cRtPpJuJSrxy7kC+fbcxOxmcEzCJQMKE12mIu/8npb2uvX5OQeb7BHA0C9TRC3p9t22y89/uS1XRB5eiJXcy+eP38T2ww1cauMLLtHCi5ODMnKU2sxRyzL/mWInr9djuxpeo9KVFaucCFzcUnAF0lBC8IrmPUrJ0ASMLnifTl4XNae4FD0BUMWbjG5MsTV2I2d0TowOglMk6G5PAkF+4O2LbZQxjhueuBdENXJRr7+fnMEy6Xu7FiYYOoqoT3ilzxfMBjdrdxOzAULfEmBoHb3DHoErxZDxGQMFokbzcP2WwbYnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=padQ3pxzWWUArPR5AW015lRfwTNSBu4CJTZqm0Gue0E=;
 b=YNFvgCWPA+ii0Hbtgzrzsh3inILvNzRbAJ8iB/O6NatN8gQHHTuTqbz0chnzaehphJL+3vMMmEM1IVLnzUqXbbK97CPy/HoN6SqYLx4Inq/Hn6gUDKOQt00y7Mvhcy1MBxpSG0W9Hj/QU5EfJwmOWasW9y1KucuBvJA2aW7FWLgjzDioXN305SK9geVk13tsPlKhRGnMr7YMwBdDK22dtKOGqH+10IR7UbQFXddMUjxiZ3yqHyaBgcEwV3k96dBakKECnQgFoyG4sjKSR2Qw4EF1d2GBQDmijRNG9GoQ0z7nCBzi4Iv5Ev2jqJddmCeFCdOWxY2Ivc9xT+zEAQBKLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=padQ3pxzWWUArPR5AW015lRfwTNSBu4CJTZqm0Gue0E=;
 b=cMIl6pgO5RzxmqxmX9a0QCcqeCmDULClGtW/188qKFNhJJXHPvUd3wEMiJYSRYOUq2dp1Z2Aq/r8020HOz777mZpKBsaSkmXlP0q9OIzJkdhBjoWCnlIyEOl2AUa2JxX2dimzQb7pP/uwJeP/3wAWmmH8CDAvbrbctoJ5IKJEyY=
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DB7PR01MB4790.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:57::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.11; Mon, 11 Jan
 2021 14:56:55 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c880:793c:c5b1:c7a8]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c880:793c:c5b1:c7a8%5]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 14:56:55 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: akuster808 <akuster808@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [gatesgarth][meta-multimedia][PATCH 2/2] gupnp: Upgrade to 1.2.2 -> 1.2.4
Thread-Topic: [oe] [gatesgarth][meta-multimedia][PATCH 2/2] gupnp: Upgrade to
 1.2.2 -> 1.2.4
Thread-Index: AQHW5SRLRfnFL8dXMUaXSk1L+UtH56oihw8AgAABbLA=
Date: Mon, 11 Jan 2021 14:56:55 +0000
Message-ID: 
 <DB6PR0102MB2630A0AE28C1DC4D987BA8E788AB0@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
References: <20210107183743.28823-1-Diego.SantaCruz@spinetix.com>
 <20210107183743.28823-2-Diego.SantaCruz@spinetix.com>
 <7f548ed4-7717-601e-a22c-d757ff730e94@gmail.com>
In-Reply-To: <7f548ed4-7717-601e-a22c-d757ff730e94@gmail.com>
Accept-Language: en-GB, fr-CH, fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=spinetix.com;
x-originating-ip: [178.198.240.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d69841d9-889f-4e47-a301-08d8b6412332
x-ms-traffictypediagnostic: DB7PR01MB4790:
x-microsoft-antispam-prvs: 
 <DB7PR01MB4790A3D13E29EF60D83649C688AB0@DB7PR01MB4790.eurprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 webfHjOMjgimKXA9R8n4h605rivCgGxSr1Y3hGIeTBGlVYu1ZctW3M1bh6c50CfEL8+2oNuZqOVFu9KDkvJSF7g8HsiGw9YB5/ufflm8RSVCmIcbEz/6smF+G8E6UI6KPzcA8f2YMmduYTUvcg/cLq9T+c98+gPJpu/iKOTWAQoDLDfEFpvNzmZ6d1vkmehBtsRbSHj8XVyyzHLYYUdpx0YDhfOsQd5ACHTNz7ayKKklIjgNVKq0q4U5r3cXhel+AAx84kz3yUPIfAyxe6h592ro158EUwkALbGjLwpq4JlSxOPoSRnpmkgtZSjXs0bq/iyikzrqbsirPwNYsqwq7ZsL+1hvfOu0pIUr0m6jHyFCo80FXYupkxY4T7opD2K37deOP5HFtM03oNjzFTsyaos4IRZsl2T8fB7OYIiI73gv07zpBzKIPGDvkIMWWIbW/Y+955bLkvHsp1W4hjBOMw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(39830400003)(396003)(376002)(186003)(66946007)(76116006)(316002)(64756008)(478600001)(26005)(83380400001)(966005)(2906002)(55016002)(53546011)(9686003)(86362001)(6506007)(71200400001)(7696005)(8936002)(66476007)(33656002)(5660300002)(52536014)(4744005)(66556008)(110136005)(66446008)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?U3ZTWCtlZDRRTk1lU09BK2xGRm8vWE1wSDlwd05XNWM5RVA1b2k3dE9lU1pi?=
 =?utf-8?B?VXd0OGk4WlpCdEsxVUsxb2RRYVJxVlZmbStYd0tjVGlQb0hFWlhocTRadVJt?=
 =?utf-8?B?cWZoNG91N3A2MVJDMk9WV0NraEpTdHUxUXBIMjZVZGVMTUt2L2o1MHZuVkFH?=
 =?utf-8?B?N1lJdGY2Y1NzMnZ0cWJPQjU2TXdBMHowbmJMRDV4V0EvUURSUWtkbGtJOTZk?=
 =?utf-8?B?enhReDQxbkRQZEVOSDZEZTk4NjByUHRaMlV4bjM2WE53dFF6K0ZMTlc5OHJX?=
 =?utf-8?B?cTFsTW8xTVBTMFFEZkwreFhQWVNxaG1Dd25TSmZZc3JNV1FFRUJkdHFTOXUz?=
 =?utf-8?B?NU96b0M5MEhybEczSXY5SW1BNmo0RVYzS3AydTF1dUxpZytQeVZhWXRXM3hl?=
 =?utf-8?B?bm4xc2kyWHNkR3g0NUFvUjAwV25PTUtERW9XUEhvdDhrUGs3blRCT0M0NWxv?=
 =?utf-8?B?S0pKdEVGNmRKeXV4dFFyNWVzc2hVRHZYd1hNUDBqNmFldFVvd0dTbFUzNWNm?=
 =?utf-8?B?R3dOOG9MYjNGV3VLS1RQa3hzalJzU1ZXb2JzWUw1MG56YW1HK0NZM3dwTjFB?=
 =?utf-8?B?ODFxRjl4aVVtN0lyMlE5ZHVPelc3STBYL3I0ZVZLVzM2UVJ5dFRQTm5hbWlO?=
 =?utf-8?B?SGR0UnA0T0ZCM0M1cHN4TkQ1ekJ0Yys2Z2VGSVhod3hhQWtpRGN3TDlQMldJ?=
 =?utf-8?B?WWEzRVAwbGRwblV5T2dVSEZJZWxjR2ZMQ01lWlY0NGFrTVlweVRFaGc1MkZ0?=
 =?utf-8?B?dE5JS0JHWHpaY1k3UkJBOHZ1d0VZOHljTWhmUlZZaE0wTFUrWEdHT1EwdnV4?=
 =?utf-8?B?VzI2anlyZmZNKzc3WWpiR0Y3a0RXOWJsWkRyanpWWDI5K1lhZ2ROMkxvRUhi?=
 =?utf-8?B?MW14bi9WNTRRK1ZiTWI1VU81dlpnYll5ODVwYUwwRnVNYmpwZGVzS01jRGV0?=
 =?utf-8?B?UjNtUFI4TlhPZFpsZnEvT0lKeXRyWEVJL01ob2tUblBtWWdRWUhjQmpkSDE2?=
 =?utf-8?B?NlM0UVg4QjQvdXZLU2txUUtmaDJGZC9ST2l4NjAreHZMZzhiZDFLMUJuMDZK?=
 =?utf-8?B?cGhDMWRhaE5WNjY1UFZyUEdCYnVUbktwdC91Vm1pZmVUNlE2d3dKZ3ErZDZQ?=
 =?utf-8?B?YUZTSlVoNlkvYVF5RnhCUjVzRmdqZ1dsK2lJK2JOdVlvK2NVelpYMFZVeGt2?=
 =?utf-8?B?KzJibk9KTVU0R01zUWkrcXdScjIwTkxuMU1JQnRsMFdqMDFVZWVoYkNVc3Jo?=
 =?utf-8?B?Y2Z4dERmZ1pBUVVldlMxcVhIVzJ0MjFQaVVJSXZFczBwaDNMRm9lYlgzY1ho?=
 =?utf-8?Q?fC4x/JIoxvMz8=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d69841d9-889f-4e47-a301-08d8b6412332
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2021 14:56:55.1956
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 48YSrRTTYEENJMx8b6Duy5CZ9D706LrqWbe0MrT9bl3Gk4GI13SWQ7ezoVLCq55en+6yZvR5rEN6QhxGTjirxksbKxG2YD8KE9Pksbqtv/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR01MB4790
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBha3VzdGVyODA4IDxha3VzdGVy
ODA4QGdtYWlsLmNvbT4NCj4gU2VudDogMTEgSmFudWFyeSAyMDIxIDE1OjQ3DQo+IFRvOiBEaWVn
byBTYW50YSBDcnV6IDxEaWVnby5TYW50YUNydXpAc3BpbmV0aXguY29tPjsgb3BlbmVtYmVkZGVk
LQ0KPiBkZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbb2VdIFtn
YXRlc2dhcnRoXVttZXRhLW11bHRpbWVkaWFdW1BBVENIIDIvMl0gZ3VwbnA6DQo+IFVwZ3JhZGUg
dG8gMS4yLjIgLT4gMS4yLjQNCj4gDQo+IA0KPiANCj4gT24gMS83LzIxIDEwOjM3IEFNLCBEaWVn
byBTYW50YSBDcnV6IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+IGd1cG5w
IDEuMi4zIGFkZHMgbWl0aWdhdGlvbiBmb3IgQ1ZFLTIwMjAtMTI2OTUgKENhbGxTdHJhbmdlcikN
Cj4gDQo+IGlzIHRoYXQgdGhlIG9ubHkgY2hhbmdlIG9yIGlzIHRoZXJlIG1vcmU/DQoNClRoZXJl
IGFyZSBhbHNvIGEgZmV3IGJ1Z2ZpeGVzLiANCiANCkZyb20gd2hhdCBJIGdldCBmcm9tIGh0dHBz
Oi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9ndXBucC8tL2Jsb2IvZ3VwbnAtMS4yLjQvTkVXUw0K
ICogSW1wbGVtZW50IFVEQSAyLjAgQXByaWwgMTcgMjAyMCBBZGRlbmR1bSAoUGF0aWFsIGZpeCBm
b3IgQ1ZFLTIwMjAtMTI2OTUpIA0KICogQWRkaXRpb24gb2YgYSBHTGliIGF1dG9mcmVlIGZ1bmN0
aW9uIGZvciBHVVBuUFNlcnZpY2VQcm94eUFjdGlvbg0KICogVmFyaW91cyBidWdmaXhlcw0KDQot
LSANCkRpZWdvIFNhbnRhIENydXosIFBoRA0KVGVjaG5vbG9neSBBcmNoaXRlY3QNCnNwaW5ldGl4
LmNvbQ0KDQoNCg==
