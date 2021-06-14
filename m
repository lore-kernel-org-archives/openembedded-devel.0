Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.134])
 by mx.groups.io with SMTP id smtpd.web11.1038.1623706310442231136
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jun 2021 14:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=fVC3MK5H;
 spf=pass (domain: skidata.com, ip: 40.107.20.134, mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O00SB5/j3qtfX1H500uA+9t/6eB8aZTBCd4zi21I6UvMJpHOZ8xEWqR7KTmnyBeJj0NPfzhKiB9Kk5dEoVl374txEP8j9MemiKmemqGRLJUxNfcD3Pghs1k6JZqebl+f7pi1bgFVFPI3BWHwuMCnbkuq4/RFyd3u7Q/paxOEmMWA3J8lX99hsv3G9dPhfWfmH0vk/dTf3dxb3zFzG1Dgipp318G9j72h/sVSZ+C8mpZ5GurOsHwl6g/cZOafGPkFqkJ8Z6vuDI5fDcsBnjFxM42de8mYI7h8OP7ByESojdqCbh4kWneJGqztsXRzp2GyvsD4BXi1BTXkB5Ukpzzeaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8+OaAl8vT3AWvVIY6XzXhK+vCWYcn98c8lsRINe5Jo=;
 b=Yd6JuPc7MoruxGp7Md72cKPHIkEpGWNylRi7ZRvKVmWy7v2cBZYj6XdsPF1x5b8JNq0jaClu/KSCqy9U2twOLigl49+3j1Ho0kV3Rqk3+cyN1o+XySzougtLZjy6RY3xIOou8fY8PxdFxDFNyrl/dxIvtZ738nX/o/jZkWzxNi2pBAMD9IoUkR2io6tsK9E6zRZR1txVoj5RS49c4qcgSxjzAioaMVDOuGS/73xJlUPAwpxOjRlwczBIVYYHZieQ8oCUx5hCKkYOcs6ZWR10WJhtcAfnXxpk7rHgk1DyRXiI0kQqqaz6rajpLX8AA/3tdwlRaYu+Adt0R0UspWn1Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8+OaAl8vT3AWvVIY6XzXhK+vCWYcn98c8lsRINe5Jo=;
 b=fVC3MK5HIJJikl5Fm7kSiHRswmcdRfILx41zrHCENnVltyYRuMBsvUwJmhSUpPHhcGVzUdPlAoZ2VQ02EO1I7gcWUJB4o4qQ7hurVT45EP11NUmYY9X++JONxZg1stVdq1Bzzk94nX0ZXw7ZZxGMeUnauPNzGlzGeyXCC3Pz1+ae3BfHouNnjlUtoKCKcoSGhNpUqqiwAtcJZJuxIUHbaGd3qwnGz+2I0A0vjalegzJCuGPZPREKBvEpfLZdrWmDK6AH5DWh5YZqIZt2lWMOP4m2kKbV6Xqm9NxqWRFDy4D1p1R/6rokerwrzTSjuUmtH5lTLWH8eHgpfJP2hU6x1A==
Received: from AM9PR05MB8796.eurprd05.prod.outlook.com (2603:10a6:20b:433::9)
 by AM9PR05MB8892.eurprd05.prod.outlook.com (2603:10a6:20b:43b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Mon, 14 Jun
 2021 21:31:48 +0000
Received: from AM9PR05MB8796.eurprd05.prod.outlook.com
 ([fe80::55b4:3e9e:14ab:9d63]) by AM9PR05MB8796.eurprd05.prod.outlook.com
 ([fe80::55b4:3e9e:14ab:9d63%9]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 21:31:48 +0000
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Alexander Kanavin <alex.kanavin@gmail.com>, "George.Mocanu@rinftech.com"
	<George.Mocanu@rinftech.com>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] [meta-java] icedtea7 fetching error
Thread-Topic: [yocto] [meta-java] icedtea7 fetching error
Thread-Index: AQHXXCzuuhyiXazm20y2Dxj27Z1lLKsM9QIAgAcIMQCAAAJJgIAAEYWA
Date: Mon, 14 Jun 2021 21:31:48 +0000
Message-ID: <YMfKw9F6qY7daERE@brokenbit>
References: <98hT.1623132594082542882.bzIp@lists.yoctoproject.org>
 <CANNYZj9r_eZ8ZHEo801viRNuBekefmvKuqtLfKsKTQncw+uw-w@mail.gmail.com>
 <YMe6JtmeJc1NiRYZ@brokenbit>
 <ec0d85da208aa26517a50ea998b855a5aa0d1455.camel@linuxfoundation.org>
In-Reply-To: 
 <ec0d85da208aa26517a50ea998b855a5aa0d1455.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=skidata.com;
x-originating-ip: [83.215.125.121]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1852f138-a65c-4a88-bf11-08d92f7bd0e4
x-ms-traffictypediagnostic: AM9PR05MB8892:
x-microsoft-antispam-prvs: 
 <AM9PR05MB88925EFF8837D70BC3965575F0319@AM9PR05MB8892.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yne/o5D+6mgB+NmLO7lB9/yM1wVsKL6YKhAc5boRUbNT925iIYkh7Tb6bbS/UG5Mz0/Mb2nbO6/IFWgOEnEHRolEc6LWgU4hqUCH2qXQ5PyYYImL5VzEjfwEo1psNBhCXUOOBm70aeo3C1t/+dt9rdrWMD33PntG7oQaMG01sBT5qRcyiCvjeIRnHDzbx5UAMgBJntG/qVf/QXwsoKpW8S/MLFU01TjJXADiF1KnlNRZyjSj7Q/CA6x2y2vQ+bqFvUVGhAhbup7iz+aCfM5F3iRKVYPp1wRh6DqAsSFgWUtZdzwsJyYUvSrg5Xr2XNPhhiJiR5HmxEk0Ko+2Is8c5yZ3BMSrXr30FwFS3+tISwK6/PYjPrehHdRkZHDNOqbx2aWJN1Lbs7jNqGQh0Y27LjIV6BWoR+suEeJT6vVoatL92fLLVfxbZIOVWq80F/1JBKgYxMwnOVloO9ENgH9faeo2k5M2x8CR6RoX/Qk44rWxjBEDYbfdl1efVzYQcsWFeL9oLRwDglhQNSQKyVL7X2KRIQmMlqDEJcqpi/fMh/b9rydN/3gcD5YW5NbLiHQljnqF4b4qvR7GBL2Cc3G+Hj+a1M2CYOFPSNwDZqSVUhl2OP+aByqem9C9zMonJZcF+3u69sleE5DkcVAXqCekjvzkgglK6SYSYAf7Ss9qmdt43nvbBSjcUxDpI9xON2zTJUEMkjCxBtoMdWqSokOgnw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR05MB8796.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(136003)(396003)(366004)(39850400004)(346002)(26005)(186003)(6506007)(8936002)(316002)(966005)(6486002)(54906003)(8676002)(33716001)(122000001)(38100700002)(83380400001)(4326008)(71200400001)(5660300002)(6512007)(66946007)(9686003)(86362001)(6916009)(66476007)(66446008)(66556008)(478600001)(2906002)(64756008)(91956017)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OHpuOEZQZmxQaHNvWUpISGZtYjNuVDVDcXhuazBRWkwzMGd3c0E0MWk5OS9o?=
 =?utf-8?B?akdzcTZwaHIrR3M2MXV5dVpEV0tzNFBOYjNGTmp4VDdSN0Y3bHVOTW90ZGQw?=
 =?utf-8?B?c0ZGWFZTUU54UGN4a3NvcXRVbnZTU2dxQU1EUFJ5ZkhMVDVrbkFWdzJYZVJI?=
 =?utf-8?B?M01iOTVmNlZybHhWdE9qZXNNampCWTlralNXbnNldjlEdVl5R2NIQWFDdzdk?=
 =?utf-8?B?ZENiZVIxR2k2WE1yamhzV0JqaDdXOE9oZXpvRVpPeUZIMjM1QnFKcjZUdm9t?=
 =?utf-8?B?bXR1Z0wrUTdMZDlJckozZnY0NVBDQVJCUS9mekdpMkhnQkRRaHNnT0JWdTIv?=
 =?utf-8?B?TXEyVXJJTk43SFpkUEZ5SnBkVWQ1cmpHZ3o2TGwrVTA2QW9zdU5aVkdDSFZF?=
 =?utf-8?B?RFFMMjlwRUNOcUZGRVFpYlBPaXBSY0xkekhWRGtlTWd0NXUrVzdxeStVOUp0?=
 =?utf-8?B?MEpTL2xlc1VicWFBekUydGpaMy9XRUFrNWtvMG5mbU1HWnkwUnhyZGdUaHhM?=
 =?utf-8?B?QUN3RnRnNUpaSXZDWmE5dGt3Z3pxK3B0YzYxV3VHMS9qRnMwNTBwV1hBYUYy?=
 =?utf-8?B?d015N3FuMlI3SW1mSDZVUU5aV2M1a2xYc01NVGNzZVlJaWZsam5MZG1XNEFj?=
 =?utf-8?B?VEZOeWRjU05pMXNuS29FYkQveG9OTmdiMUJsVWJZV3cvVTBRcTA5RkJQcGVk?=
 =?utf-8?B?TXUyM1luNW9VWUJtZ2t3YUUzcnprSFFtSWRDa0ZrVDJINGdPTXZxVUtDcGdW?=
 =?utf-8?B?NUtFRkZBUno0UDI2cmpjVDdYMlkvN0hOOFpqS3JnQ2t1cFk4UjZOQ3pHa01T?=
 =?utf-8?B?Wk5hRWZmRUVMNnhXVzFzcGdVUVdIdWp6UFJLVXhleU5nVGhhWmFWc2ZvU2U4?=
 =?utf-8?B?QnZJSEdKWTlzcXpjVnFvWktqdHBTbTJxbkZtVzN0U0MzUCtkenJEbU5zTnFK?=
 =?utf-8?B?Y3A4SmxUbGduK1lqa3JxZ2dNUXY3bm5SV2F3cnNUbmUycGovMk5EdDlZZEdn?=
 =?utf-8?B?dFpQcUluQ3o4TXlDeVZmdkZFcU9haDRjUnpua0d0TVZ0dGowY2c2Zmg3S012?=
 =?utf-8?B?cG4zWlRMRHl3eDZTVHNIT09zYy9GUnc4c0FvL2U2YWFZRVFsTTVMaUxQNkFT?=
 =?utf-8?B?TUJSMFBETndaZGJCcFlueHkwNUhmK25xeDQ4Q1drYmdFUndKVkVsL2JFZjNz?=
 =?utf-8?B?aExSM2ZUMkNXN2N3d3VVWklmTWtydVdZUURzTDExVUhVRWdBY0w2TmwwNE16?=
 =?utf-8?B?THQrTVFmMEE5TmtNWUJOY1lPMWNBVmZZSHNJRGhQc0EwUVQxeHFKSkxaL1hY?=
 =?utf-8?B?U1VQai84VGR3dW5GVU9iaStxN2VrWlkwTk03L21vbVBjRFBlUWlOejBPMWU0?=
 =?utf-8?B?UnpGa3B4S05jMmVFa01TcE4ybC8xTGtsQ0dyZ2p1RDZqZnZjYU5xQlhzUGdM?=
 =?utf-8?B?NE5XYWRCSndDZzNDdHhXK0loSEIwb1hXU1ptU05aTnBOdDNkZFJZZDUwZ0VB?=
 =?utf-8?B?aU5GaGhjODFrY1NWSTFkQmYvM3BiYTlISWpvRnVra1JyNkE2Umttd3gyS2N0?=
 =?utf-8?B?b3RYbTRhWEZ1N1dPQjduTklFTlNiYW5yN3M5YU5uYVArV25pd2ZyQjQvYnhP?=
 =?utf-8?B?VDNKd2l1L3JaeWVNVTRKcHFldjRRRVhlZDhWaEFhWUdveE9UTEhFTzdmRzVm?=
 =?utf-8?B?QlRKY3NQOExKT1BaUFl3T1cvV010Y0ZZSUlhWFpTSmtUUm53OHJ1Nk1MY0ln?=
 =?utf-8?B?NzlWd0FYcnlLQVdQTGZnZ25sV0dra25vNDdiQmppbjZTRXFoMFFNRVdQbjZ5?=
 =?utf-8?B?Q3BlSzErQ3JkYUwxN29QZz09?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR05MB8796.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1852f138-a65c-4a88-bf11-08d92f7bd0e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2021 21:31:48.0894
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /HL/1HF2PqBFMP1ZHCXtfcG0LsxbhM1TvVIHUfz5fYjTeIKaAGolCour3UyJUrpmL/YVyKP2zo9YhptyrsfREgE5uJLfNqGz4EjQv6m9M0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR05MB8892
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <1D6B1863DA17774AAE277D63ADEB5725@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gTW9uLCBKdW4gMTQsIDIwMjEgYXQgMDk6Mjk6MDVQTSArMDEwMCwgUmljaGFyZCBQdXJkaWUg
d3JvdGU6DQo+IE9uIE1vbiwgMjAyMS0wNi0xNCBhdCAyMDoyMCArMDAwMCwgUmljaGFyZCBMZWl0
bmVyIC0gU0tJREFUQSB3cm90ZToNCj4gPiBPbiBUaHUsIEp1biAxMCwgMjAyMSBhdCAxMDo1Nzo0
NkFNICswMjAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90ZToNCj4gPiA+IEkgaGF2ZSB0aGUgdGFy
YmFsbC4gSSB0aGluayB3ZSBzaG91bGQgdG9zcyBpdCBzb21ld2hlcmUgc2FmZSBhbmQgdXBkYXRl
IHRoZQ0KPiA+ID4gcmVjaXBlLCBhcyBpdCBpcyB1bmxpa2VseSB0aGUgb2xkIG1lcmN1cmlhbCBy
ZXBvIGlzIGNvbWluZyBiYWNrLg0KPiA+ID4gDQo+ID4gPiBTdWdnZXN0aW9ucz8NCj4gPiANCj4g
PiBTb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHksIEkgd2FzIG9uIHZhY2F0aW9uIPCfmIkuDQo+ID4g
DQo+ID4gTm90aGluZyB0aGF0IGNvbWVzIHRvIG15IG1pbmQgZGlyZWN0bHkuIERvIHlvdSBrbm93
IG9mIGFueSBob3N0aW5nDQo+ID4gcG9zc2liaWxpdGVzIGZyb20gWVAgb3IgT0UtQ29yZT8NCj4g
PiANCj4gPiBAUmljaGFyZDogU29ycnkgZm9yIHB1dHRpbmcgeW91IGluIHRoYXQgY29udmVyc2F0
aW9uIHdpdGhvdXQgd2FybmluZy4uLg0KPiA+IEJ1dCBtYXliZSB5b3UgbWF5IGd1aWRlIHVzIGlu
IGEgZGlyZWN0aW9uIHdoZXJlIHRvIGhvc3QvbWlycm9yIHNvbWUgImxlZ2FjeSINCj4gPiBtZXRh
LWphdmEgc291cmNlIHRhcmJhbGxzPw0KPiANCj4gSWYgc29tZW9uZSBwb2ludHMgbWUgYXQgdGhl
IHRhcmJhbGxzIEkgY2FuIHByb2JhYmx5IHNvcnQgc29tZXRoaW5nIG91dCB3aXRoDQo+IG91ciBz
b3VyY2UgbWlycm9ycy4NCg0KVGhhbmsgeW91IHZlcnkgbXVjaCBSaWNoYXJkIQ0KVGhlIG9wZW5q
ZGs4IHRhcmJhbGxzIGFyZSBub3cgaG9zdGVkIGF0IGh0dHBzOi8vZG93bmxvYWRzLnlvY3RvcHJv
amVjdC5vcmcvbWlycm9yL3NvdXJjZXMvDQp3aXRoIHRoZWlyIGxvY2FsIGRvd25sb2FkIG5hbWVz
Lg0KDQpVbmZvcnR1bmF0ZWx5IEkgY3VycmVudGx5IGRvbid0IGhhdmUgdGhlIHRpbWUgYW5kIHJl
c291cmNlcyB0byBwcm92aWRlIGENCnBhdGNoIGZvciBmaXhpbmcgdGhlIFVSTHMgYW5kIGFkZGlu
ZyB0aGUgbWlycm9yLg0KU28gaGVscCBpcyBncmVhdGx5IGFwcHJlY2lhdGVkIQ0KDQpyZWdhcmRz
O3JsDQoNCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCj4g
