Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.84])
 by mx.groups.io with SMTP id smtpd.web12.8256.1592871420364845722
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 17:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=SOO0cXfm;
 spf=pass (domain: xilinx.com, ip: 40.107.68.84, mailfrom: ckalluri@xilinx.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQWRfbr2MBJ9sYQrrkW2WSCyJ6vF/YMiqayzt3wYCZ3zxOuf2ArbQ+lSKIOe/at98VqD6DXCt2+D5zGHMGT6RvnRVq0cs1r0Id+PPv5Ed8kGAONSQ6kDjr8chvGSgzhuedHHR1NGeh5EptYCRFr8b+ct0J3FoJAZVb6GNZN0bb2yHnx7a3VVDB3CeQy0RSMDtkwMbIVi5VhzQPkufJUm4o8DdnaufklOhgxoZkcE7s0/dRVlEZQCsYHiIpuAKGy4ba5nVicidjgWmrd80A0HHpQ7kGsUIxP1JjqXetRpYt6Rzip3WKTQraoXkNavwCgInQfA7x/hEGZiH42eZLQWnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37FjqdxKsCmkTxdgTV8CXEGzcl/eexfO1pmfMrmPr+Q=;
 b=UrL2DEzLjliCWe+1O75G7qDwHbvNdePfB7Gz/nVhQkUvCHYRmMvd16lWr3KrlBdoDWIVQlZzXXfMyTFcSHTMT+iGl2wRqnPH89hKWNOS5qH0Jxp8yIHudTixfyAAEuQR/WWbEYRJTvY5Q8R4C8TTKGvYPrObJNyYtMu7v/gSjiwsqLb9oG2N88VGkHQV17rFDwWcCoT7TDigP6ZKqEXl1egs7BbvcsC4S2zb+5qpLTm0T+fMNMzf6fUXRcVBp9b45M3mlaqxZd6N4H/cdj/T2BqM89H6SHqnszeRe/N3tyLmHLD2oeENC+pwif2RWoMARfUeiJGPRy8dpeWI1M8AcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37FjqdxKsCmkTxdgTV8CXEGzcl/eexfO1pmfMrmPr+Q=;
 b=SOO0cXfmn8mQyfhFjrjv3baG8PRuMsEfatEU5L1RMjeBZ0IZn0RkMV2QeIArmAR97XDGxvZK6s1lTmJ3qPNrKOH7Q3vtlZPwf83xDRKAhV2bDiX0LFmPMjNnJ3lYL8wjJMoflTvq1kPQmzdhfcPmavOjaOYwSUUfzZfsmoQsXCk=
Received: from BYAPR02MB5926.namprd02.prod.outlook.com (2603:10b6:a03:11e::19)
 by BYAPR02MB5814.namprd02.prod.outlook.com (2603:10b6:a03:11a::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Tue, 23 Jun
 2020 00:16:57 +0000
Received: from BYAPR02MB5926.namprd02.prod.outlook.com
 ([fe80::747a:5ccd:410a:4175]) by BYAPR02MB5926.namprd02.prod.outlook.com
 ([fe80::747a:5ccd:410a:4175%6]) with mapi id 15.20.3109.027; Tue, 23 Jun 2020
 00:16:57 +0000
From: "Chandana kalluri" <ckalluri@xilinx.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>, Alexander
 Kanavin <alex.kanavin@gmail.com>, OpenEmbedded Devel List
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-browser][PATCH] chromium.inc: Use python3native.bbclass instead of pythonnative.bbclass
Thread-Topic: [oe] [meta-browser][PATCH] chromium.inc: Use
 python3native.bbclass instead of pythonnative.bbclass
Thread-Index: 
 AQHWSOHBdXVun0hWN0yNjYpRKkfY1qjlM+SAgAAEUwCAAAKkgIAAAxPggAAHIICAAA+WUA==
Date: Tue, 23 Jun 2020 00:16:57 +0000
Message-ID: 
 <BYAPR02MB59262DD054B50BC9527A4ED8B0940@BYAPR02MB5926.namprd02.prod.outlook.com>
References: <1592863740-4473-1-git-send-email-chandana.kalluri@xilinx.com>
 <CANNYZj-irMbwZptvXfiT047fNwzzgK98z04kLoDRAO=aPM1xKA@mail.gmail.com>
 <20200622223220.GJ17660@denix.org>
 <b0a58e1f-04e4-44f5-62ff-a4810826e578@linux.microsoft.com>
 <BYAPR02MB5926B4D4B776B27284BD4C3AB0970@BYAPR02MB5926.namprd02.prod.outlook.com>
 <20200622231817.GK17660@denix.org>
In-Reply-To: <20200622231817.GK17660@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: denix.org; dkim=none (message not signed)
 header.d=none;denix.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 53991372-10aa-4f87-42d8-08d8170abe05
x-ms-traffictypediagnostic: BYAPR02MB5814:
x-microsoft-antispam-prvs: 
 <BYAPR02MB5814CD6FD82365891CF3EBCCB0940@BYAPR02MB5814.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 04433051BF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cZuvnmt93tfhqgyFKTjxmEIZh/7zeor92DnzC4/w3XuwjWHXQNpFvKV8F3l1TyfGCPLAv/b3WMbNNwTvFNCS2hfEdaVdul84XlcwbiegenKu4Tg0et5XwsNEw43KG2600HhFp4ENvoGEBb5l62VUv6hH6+9wSyMM7xySKIVs0pj36OTGkviBMhxqKIWJ2v65zcsC+37kY7snOIqz2cHrfGX3O3vjAJP+wjFtlbTP4yHRCU0zbugpkLotdWT8K3Big765TR1TdmuZHsMl7rDYTGW1z0XlmK+vMagJphlyYi034AV4xvUtz22vYZqQo5I3qVuOG3anLOUaCnyVIxeFSDfo0SazG2EFeUcyq+HTh2tnJPvJQC7srQRoIfBqInE904CCNrmcCit3WrtoZhLBKqxewNB2el3Uckdc7KluSPcWJoa3VrAlCv/OkkYDjQMylzAsoSL0mu+TY5PkBh07ag==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR02MB5926.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(376002)(136003)(39860400002)(396003)(6506007)(53546011)(6916009)(33656002)(66476007)(66556008)(64756008)(2906002)(66446008)(83380400001)(26005)(86362001)(71200400001)(52536014)(8676002)(8936002)(5660300002)(966005)(66574015)(7696005)(478600001)(66946007)(54906003)(186003)(76116006)(316002)(4326008)(55016002)(9686003)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 9+ZpN0jXR7nRGHr0awv2dSVmGypFaNP66fi9VnyTXx5B5P8fhC25VEQWm2y9yMLYC7vY4XWposPiKdEKbIIjw0yF+7KP+2qHaqPJKLV5QJ2a6vwP0tIE2wjVxrkHJRWs3jQRoPT2gXscOjrL03Wjt4TbH30BdjOfH0Pjw3UXqLqOc52euqnL5iu9PSP5ZWvHqHBSCpNDd88XF77ScMVvu5K35JaON1PsFLJYJoplygFhW9MY0jGYptS4ywQmnxzWpHNf8UbnDMoGokGcGPXHgabvHMPZipPO8TDa6cFraWwyQOisW95MUUiZNGkQ/3vy70YYrr9+bJCckZJIuD1sR3Bp6CvCbO8BEf8Q60FMz0+1fLqxv4NWE4nN38I6XhWRKKKgVhaNsUoNqdmGjKX/BcAMpTzGOLRFqAs/fgvoUPi3xrtt6biSQlovLnEwqw8aBjZv2w8Yn6bl0cd3PrH2KAXETD5c9Z7bxOCvpCu3gAfPxaUv4KoEoC9wYfkUZ/lP
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53991372-10aa-4f87-42d8-08d8170abe05
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2020 00:16:57.6783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VhGB84Qmp0tLr8gQFtlPTzKdOFmkDSfGwVrpu7/rLw61x5CVrSQ2B53egH76We1YQGaDkWtWGzuYsip8gIORUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5814
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IERlbnlzIERteXRyaXllbmtv
IDxkZW5pc0BkZW5peC5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgSnVuZSAyMiwgMjAyMCA0OjE4IFBN
DQo+IFRvOiBDaGFuZGFuYSBLYWxsdXJpIDxja2FsbHVyaUB4aWxpbnguY29tPg0KPiBDYzogQWxl
amFuZHJvIEhlcm5hbmRleiBTYW1hbmllZ28gPGFsaGVAbGludXgubWljcm9zb2Z0LmNvbT47IEFs
ZXhhbmRlcg0KPiBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPjsgT3BlbkVtYmVkZGVk
IERldmVsIExpc3QNCj4gPG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
Pg0KPiBTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1icm93c2VyXVtQQVRDSF0gY2hyb21pdW0uaW5j
OiBVc2UNCj4gcHl0aG9uM25hdGl2ZS5iYmNsYXNzIGluc3RlYWQgb2YgcHl0aG9ubmF0aXZlLmJi
Y2xhc3MNCj4gDQo+IE9uIE1vbiwgSnVuIDIyLCAyMDIwIGF0IDEwOjUzOjA5UE0gKzAwMDAsIENo
YW5kYW5hIGthbGx1cmkgd3JvdGU6DQo+ID4gSSBhbSBidWlsZGluZyB0aGUgbWV0YS1icm93c2Vy
IGxheWVyIGFnYWluc3QgcG9reS9tYXN0ZXIgYW5kIGN1cnJlbnRseQ0KPiA+IEkgYW0gc2VlaW5n
IHBhcnNlIGVycm9ycyBhcyBweXRob25uYXRpdmUgYW5kIHNldHVwdG9vbHMgY2xhc3NlcyBhcmUg
bm8NCj4gPiBsb25nZXIgc3VwcG9ydGVkLiBIZW5jZSB0aGUgcGF0Y2guDQo+IA0KPiBTbywgaGF2
ZSB5b3UgaGFkIGFueSBzdWNjZXNzZnVsIGJ1aWxkcyBvZiBjaHJvbWl1bSBhZnRlciB5b3VyIHBh
dGNoZXM/DQo+IA0KSSdtIGFmcmFpZCBJIGhhdmVuJ3QgZ290dGVuIHRoYXQgZmFyIGluIGJ1aWxk
aW5nIGNocm9taXVtIHJlY2lwZXMuDQogSSBqdXN0IHN0YXJ0ZWQgdG8gdXBncmFkZSBvdXIgbGF5
ZXJzIGZvciBkdW5mZWxsIGFuZCBnYXRlc2dhcnRoIHdoZXJlIEkgaGF2ZSBiZWVuIHJ1bm5pbmcg
aW50byBwYXJzZSBlcnJvcnMgZm9yIHRoaXMgcmVjaXBlIGR1ZSB0byBpbnZhbGlkIHB5dGhvbm5h
dGl2ZSBjbGFzcyBpbmhlcml0YW5jZS4gDQoNCj4gDQo+ID4gSG93IGFyZSBldmVyeW9uZSBlbHNl
IGJ1aWxkaW5nIHB5dGhvbjIgY2hyb21pdW0gYWdhaW5zdCBwb2t5L21hc3Rlcg0KPiA+IHdoaWNo
IGRvZXNu4oCZdCBoYXZlIHN1cHBvcnQgZm9yIHB5dGhvbjIgcmVjaXBlcy9jbGFzc2VzIGFueW1v
cmU/DQo+IA0KPiBZb3UgbmVlZCBtZXRhLXB5dGhvbjIgbGF5ZXIgdG8gZW5hYmxlIFB5dGhvbjIg
c3VwcG9ydC4NCj4gDQpJIHdpbGwgdHJ5IHRoaXMgb3V0Lg0KIA0KVGhhbmtzLA0KQ2hhbmRhbmEN
Cj4gDQo+ID4gVGhhbmtzLA0KPiA+IENoYW5kYW5hDQo+ID4NCj4gPg0KPiA+IEZyb206IEFsZWph
bmRybyBIZXJuYW5kZXogU2FtYW5pZWdvIDxhbGhlQGxpbnV4Lm1pY3Jvc29mdC5jb20+DQo+ID4g
U2VudDogTW9uZGF5LCBKdW5lIDIyLCAyMDIwIDM6NDIgUE0NCj4gPiBUbzogRGVueXMgRG15dHJp
eWVua28gPGRlbmlzQGRlbml4Lm9yZz47IEFsZXhhbmRlciBLYW5hdmluDQo+ID4gPGFsZXgua2Fu
YXZpbkBnbWFpbC5jb20+DQo+ID4gQ2M6IENoYW5kYW5hIEthbGx1cmkgPGNrYWxsdXJpQHhpbGlu
eC5jb20+OyBPcGVuRW1iZWRkZWQgRGV2ZWwgTGlzdA0KPiA+IDxvcGVuZW1iZWRkZWQtZGV2ZWxA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZz47IENoYW5kYW5hIEthbGx1cmkNCj4gPiA8Y2thbGx1cmlA
eGlsaW54LmNvbT4NCj4gPiBTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1icm93c2VyXVtQQVRDSF0g
Y2hyb21pdW0uaW5jOiBVc2UNCj4gPiBweXRob24zbmF0aXZlLmJiY2xhc3MgaW5zdGVhZCBvZiBw
eXRob25uYXRpdmUuYmJjbGFzcw0KPiA+DQo+ID4NCj4gPiBTb21lIG9mIGl0IGlzIGFscmVhZHkg
cG9ydGVkLCBidXQgaXQgZG9lc24ndCBsb29rIGxpa2UgaXQgd2lsbCBiZSBmaXhlZCBzb29uLCBp
dHMNCj4gZWFzaWVyIHRvIGRlcGVuZCBvbiBweXRob24tbmF0aXZlIGJ1dCB0aGF0IGNyZWF0ZXMg
YSBkZXBlbmRlbmN5IG9uIG1ldGEtDQo+IHB5dGhvbiBhcyB3ZWxsIGFzIGl0IHVzZXMgRU9MIGNv
ZGUuDQo+ID4NCj4gPiBJZiB5b3UgZG8gdGhhdCB5b3UgaGF2ZSB0byBtYW51YWxseSBwYXRjaCBs
b3RzIG9mIHN0dWZmIG9uIHRoZSB2OCBlbmdpbmUNCj4gKGFuZCBvdGhlciBjb21wb25lbnRzKSB3
aGljaCB0cnkgY2FsbGluZyAvdXNyL2Jpbi9weXRob24gc3BlY2lmaWNhbGx5LCBidXQgaXQNCj4g
d2lsbCB3b3JrLg0KPiA+DQo+ID4gQWxlamFuZHJvDQo+ID4gT24gNi8yMi8yMCAzOjMyIFBNLCBE
ZW55cyBEbXl0cml5ZW5rbyB3cm90ZToNCj4gPg0KPiA+IFllYWgsIG5vdCBnb25uYSB3b3JrIC0g
bWFueSBwZW9wbGUgYXJlIHdhaXRpbmcgZm9yIHRoaXMgdG8gaGFwcGVuLCBidXQNCj4gYWxhczoN
Cj4gPg0KPiA+DQo+ID4NCj4gPiBodHRwczovL2J1Z3MuY2hyb21pdW0ub3JnL3AvY2hyb21pdW0v
aXNzdWVzL2RldGFpbD9pZD05NDI3MjANCj4gPg0KPiA+DQo+ID4NCj4gPg0KPiA+DQo+ID4gT24g
VHVlLCBKdW4gMjMsIDIwMjAgYXQgMTI6MTY6NTFBTSArMDIwMCwgQWxleGFuZGVyIEthbmF2aW4g
d3JvdGU6DQo+ID4NCj4gPiBXYWl0LCBkaWQgeW91IGFjdHVhbGx5IHRlc3QgdGhpcz8gQ2hyb21p
dW0gaXMgbm90IHlldCByZWFkeSBmb3INCj4gPiBweXRob24zLA0KPiA+DQo+ID4gYW5kIGJ1aWxk
cyB3aWxsIGZhaWwuDQo+ID4NCj4gPg0KPiA+DQo+ID4gQWxleA0KPiA+DQo+ID4NCj4gPg0KPiA+
IE9uIFR1ZSwgMjMgSnVuIDIwMjAgYXQgMDA6MDksIENoYW5kYW5hIGthbGx1cmkNCj4gPGNrYWxs
dXJpQHhpbGlueC5jb20+PG1haWx0bzpja2FsbHVyaUB4aWxpbnguY29tPiB3cm90ZToNCj4gPg0K
PiA+DQo+ID4NCj4gPiBGcm9tIGR1bmZlbGwgb253YXJkcywgcHl0aG9uMiByZWNpcGVzIGFuZCBj
bGFzc2VzIGFyZSBub3Qgc3VwcG9ydGVkLg0KPiA+DQo+ID4gSW5oZXJpdA0KPiA+DQo+ID4gcHl0
aG9uM25hdGl2ZS5iYmNsYXNzIGZvciBjaHJvbWl1bSBpbnN0ZWFkIG9mIHB5dGhvbm5hdGl2ZS5i
YmNsYXNzDQo+ID4NCj4gPg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2FpIEhhcmkgQ2hhbmRh
bmEgS2FsbHVyaQ0KPiA+IDxjaGFuZGFuYS5rYWxsdXJpQHhpbGlueC5jb20+PG1haWx0bzpjaGFu
ZGFuYS5rYWxsdXJpQHhpbGlueC5jb20+DQo+ID4NCj4gPiAtLS0NCj4gPg0KPiA+ICByZWNpcGVz
LWJyb3dzZXIvY2hyb21pdW0vY2hyb21pdW0uaW5jIHwgMiArLQ0KPiA+DQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4NCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9yZWNpcGVzLWJyb3dzZXIvY2hyb21pdW0vY2hyb21pdW0uaW5jDQo+ID4N
Cj4gPiBiL3JlY2lwZXMtYnJvd3Nlci9jaHJvbWl1bS9jaHJvbWl1bS5pbmMNCj4gPg0KPiA+IGlu
ZGV4IDE0ZDc2MmYuLmE0ODNlYzQgMTAwNjQ0DQo+ID4NCj4gPiAtLS0gYS9yZWNpcGVzLWJyb3dz
ZXIvY2hyb21pdW0vY2hyb21pdW0uaW5jDQo+ID4NCj4gPiArKysgYi9yZWNpcGVzLWJyb3dzZXIv
Y2hyb21pdW0vY2hyb21pdW0uaW5jDQo+ID4NCj4gPiBAQCAtMTgsNyArMTgsNyBAQCBUT09MQ0hB
SU4gPSAiY2xhbmciDQo+ID4NCj4gPiAgIyB0byBidWlsZCB0aGUgbmF0aXZlIHJlY2lwZXMgKGUu
Zy4gR04pIHdpdGggY2xhbmcgdG9vLg0KPiA+DQo+ID4gIFRPT0xDSEFJTl9jbGFzcy1uYXRpdmUg
PSAiY2xhbmciDQo+ID4NCj4gPg0KPiA+DQo+ID4gLWluaGVyaXQgcHl0aG9ubmF0aXZlIHNldHVw
dG9vbHMNCj4gPg0KPiA+ICtpbmhlcml0IHB5dGhvbjNuYXRpdmUgc2V0dXB0b29scw0KPiA+DQo+
ID4NCj4gPg0KPiA+ICAjIENocm9taXVtIGl0c2VsZiBpcyBsaWNlbnNlZCB1bmRlciB0aGUgMy1j
bGF1c2UgQlNEIGxpY2Vuc2UuDQo+ID4gSG93ZXZlciwgaXQNCj4gPg0KPiA+ICAjIGRlcGVuZHMg
dXBvbiBzZXZlcmFsIG90aGVyIHByb2plY3RzIHdob3NlIGNvcHlyaWdodCBmaWxlcyBhcmUNCj4g
PiBsaXN0ZWQgaW4NCj4gPg0KPiA+IC0tDQo+ID4NCj4gPiAyLjcuNA0KPiA+DQo+ID4NCj4gPg0K
PiA+DQo+ID4NCj4gPg0KPiA+DQo+ID4NCj4gPg0KPiA+DQo+ID4NCj4gPg0KPiA+DQo+ID4NCj4g
Pg0KPiA+DQo+IA0KPiA+IA0KDQo=
