Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.59])
 by mx.groups.io with SMTP id smtpd.web09.18648.1611692262203569560
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jan 2021 12:17:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=n2Z+aW21;
 spf=pass (domain: siemens.com, ip: 40.107.7.59, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idcMdM/5TDXnbkOOMRDOGqXXJUpITnhzlvkNN+MGFeR7MnMusXET0QkRWGSBXBf2UY5lBA7h0iYqV37pGihIFaHx5IDMkp2SqiNUYQhAoAxGf4BK+hNoHbNqpYMAXmsOLtN7SKZNbBlel5JhG5U71Y0hrBtbaVPXJopA2SNLIUOMUVg7LXS0DrVnSk2m2+l3ws2eIP+T0wEl/PBKLkV2HGtEIuiadY0idhmPgF3kKrVP9sqAT+PZe3LnWC83OLuzO638aSEJiIwaL4rgvh3u5MQS1fWEG9AhlH144wts18WxYJ0rgOq3t4tW3KM0tYZu8csxLe3OIlju3zIkB2cZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fBmLPwxMIIEAE3OcBhqbqUI/jkvbiuXMoC64sSrEB4=;
 b=J25zYNtk8iLCAgL0HuGlC5wGVWnvRbilsuKgRDvLSbLB+LsSkHFz7RsaoAq1AE0fFYl62W0ap5OARPuYp47oE8QjIeL/HAn4IAcTxe+RlovJLZdm8S54ltadObzcx6ENKPyHPM6toQKDGDDx0U+UbhrL4WObBYhWwhLEubt/miC09WO9FAw+MpPPi9pte4XIz/fY3uJJlSUEB4TR5/yKWesSLFgClxbfSqSca21EOyaw9nXycUpdZLRX7KjeA2UCtgpBLuImL7gazAuH3a26KbiRnw8xPDwcxyXzvoo4DgR1r+uDiJSdR+Oi4gdrN/cXZlBJV8krVc5yozKXq7cDig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fBmLPwxMIIEAE3OcBhqbqUI/jkvbiuXMoC64sSrEB4=;
 b=n2Z+aW21PvMScMMCvJsp4tzzRqxILo0UecU6tMR7+KTT5CPaGF/DNTtJ4b1W2AAkd0VD4YcL7fRvyBi0euJ9wluhU944Z0Dibl31xg3UCRAQjzODxZITKPp0qauVbQxpMK1a5rnXMTi/C5zjIgjEIykJV2tdsRicK2ch3tZqfwE=
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by DB8PR10MB3129.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:111::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Tue, 26 Jan
 2021 20:17:39 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2525:2f79:76c1:f154]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2525:2f79:76c1:f154%7]) with mapi id 15.20.3784.019; Tue, 26 Jan 2021
 20:17:39 +0000
From: "Adrian Freihofer" <adrian.freihofer@siemens.com>
To: "schnitzeltony@gmail.com" <schnitzeltony@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-networking][PATCH] networkmanager: add missing readline depends
Thread-Topic: [oe][meta-networking][PATCH] networkmanager: add missing
 readline depends
Thread-Index: AQHW8zeUtWi15CLwM06BkKUOWu1Gp6o4kx6AgAABvYCAAcVJgA==
Date: Tue, 26 Jan 2021 20:17:39 +0000
Message-ID: <5ef6c37e826f06c47f93bce8eb4ad338e7828bbe.camel@siemens.com>
References: <20210125163136.2497652-1-adrian.freihofer@siemens.com>
	 <CALbNGRR2FXO1MRnfUpfND_N+rBrRZ9AO4fV0cGK1UWfPc=pU8g@mail.gmail.com>
	 <CALbNGRR3G29swaE0kTVaNjobtwOt1tpX07XUJZcutt7jd40WRg@mail.gmail.com>
In-Reply-To: 
 <CALbNGRR3G29swaE0kTVaNjobtwOt1tpX07XUJZcutt7jd40WRg@mail.gmail.com>
Accept-Language: de-CH, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5 (3.36.5-2.fc32) 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=siemens.com;
x-originating-ip: [62.32.0.69]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c066ad24-5319-4424-b57a-08d8c2376dc0
x-ms-traffictypediagnostic: DB8PR10MB3129:
x-microsoft-antispam-prvs: 
 <DB8PR10MB3129A086D7E4CBD33D46F8518EBC0@DB8PR10MB3129.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +QPoCWkeqlynbZE1nDpubvgbl6coDJio8vl/IFiPFZXEjmAPaT5rnAUO2uYwQWxyOuslGjseAQiA3CfwfRYgORC2fhw1nlhcvpvnc9jVB9G7w5Oz/sScxS17P5ziYaQG4XPc8nSimPZCVQwiPfJAsN4TJTFmt7KQY02mWYW88ytxZ5sSoCN1RXurR0Kfa6/VfIVfycrp5Yuglq63Ap4sk87UaT7tkZee/sKTGqB0Xs4xR4SZ2m3r/uPfbUR082D5f1xcPP9rADIMp4u+KiNcYZHAeQRZapd+4H5J+A5MV0L/mgQg3npxNrhN0aHtIg7kfXtZPj6/dNGCxwqy/wK6kfXyIvG9zfug0zaq0U7+yJnqIcXHtBHxnBt0NeuiaqxfQDjFfxudrqIrwc52ME1f7NCPfa46DTwlmM4m1Zwra2YFfxtyafX4nI+WgPH6F9mcUA5aJ2ebvdI/dkmlH57JQnu+KFbaWwQJ5zsy+tIC6Xtu6+CHwpl3L9CWDw1bsq/jSX6nHM3vcii9NoTO96DSlw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(6486002)(6512007)(316002)(478600001)(91956017)(6916009)(4326008)(186003)(64756008)(76116006)(53546011)(66946007)(86362001)(66476007)(66446008)(66556008)(8936002)(26005)(71200400001)(2906002)(6506007)(8676002)(2616005)(66574015)(36756003)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?QUUvSS8weEdXcmkyR1pZNWlXbnJVQlZFK0JBZGtrYlZmMW1YZmY1a0hiMGRw?=
 =?utf-8?B?c2tqMlptcmMzekdSOEc5Q04vYU5xMmhpankxWTYrZ2dLVlJkanZiSGNWUnVG?=
 =?utf-8?B?Y29GL2tFdVNlTGdYeVpDMWdpUWdtOUxjdXZ1ZmV6aGVVODI1TGo3S0JDNGNM?=
 =?utf-8?B?OUpwSThVUXR4M1pZWGd5SUR1TzZiNG15Y0tpOE9YRkluViszQVlFaUZHUHdo?=
 =?utf-8?B?K3l5RFRueDRKTGptaEhnUm14YmY0Zml3VTNzaTZmMUFyZTZYZ3U4aXFJWnBi?=
 =?utf-8?B?UUtRbjNVMDJ5YnpGbWtqZG4xMFZEV1k2Y28zUDRTbHUzSmIwWlA5dG42b2py?=
 =?utf-8?B?cUVhUG41WEtqS2UrU1RQeHpPVjJsR2FJbG04U3lYNk5FTGRlUmp0NG16UnVQ?=
 =?utf-8?B?YmhzUEg3WUJuNGtrNmppcDlsb2dzMW0yaktaM3k2VGNWcUpwQ0ZJVWE4bkx1?=
 =?utf-8?B?NTdUSTdicFR5Y0RJTXAyTmh2MGpCeU9VM2cwb2prWXNIek9iZDdzYnV1S2Zw?=
 =?utf-8?B?cExsM205NmMyc1JOM2VoNUtXaC94K1lLak9qbitoS0o0N3dzcnROSXUrTWRW?=
 =?utf-8?B?MUIveVpEQm1hazJIeU5KTjI5N24wNDc5YnJrUVlrd2xPSjluRVpnNUIwSmI3?=
 =?utf-8?B?RTVTbFRNdVd4eXIvaUJIQ3NOa1h6emVzQ0t0cGM2RjhiallUZ08zS2hnYk9S?=
 =?utf-8?B?MzlLbjdzOGZCak0vVnJmYWFQbzR0WnRCZE8rNUVaNlFYczE2NEJ4QTEramJC?=
 =?utf-8?B?SW91WTJIdGl3bFJZYjEyQVdoYVVvSnNVaXdlVEtBdjRPY2tPMGJiQTl0eHNB?=
 =?utf-8?B?aTJpUFl5M3Z4ajFkTVZkc2FVcnNZc05uWXJjMVZIOElGZDV1bHVlVDFqQ2o1?=
 =?utf-8?B?RXdDZDhEYjN5eEx4WGNEdFFFVmVyWUZhNXdrZXdBWlR1VmZDeVBXbElzN1FJ?=
 =?utf-8?B?cndzV2tFdkViOWd1RzFseGZwK2I3ZXlEUGV1bk5TVk1Ob2QvUkkrNmtDZmVB?=
 =?utf-8?B?YXNTTThkdFhMVWZOSnh3bU1CSlcwWno2SnA1MkZLSVlOZ1krM3ZwaXZXamw3?=
 =?utf-8?B?cm5UMjRjRThoczVkNHdkME1rNUpVWkk3S3ZBVWI4d2wrMjBUdlZTeGNENGNk?=
 =?utf-8?B?WThXYy82OEtYbE5VZk85QzdZMGd1bzkyNkhoWXNqZVN2U2ZYUGIxNWxjMHJy?=
 =?utf-8?B?T1hHRTBvMjE4Q1VKZnl0MFdrenhEeDhNb1ZIdmRlYThJTy93UDNYSXV5RnAv?=
 =?utf-8?B?TkhOWHpibVZra1pDODNCaVFDZ1BqbE5QaWtwZWRPVTgrUm9JeU1sdDc5SzZD?=
 =?utf-8?B?L1BlenRQVWtkSk1GM1lxOENwWGozeGZaWk9lcnQ1WFFSL1RKRkUzNVZjMUlO?=
 =?utf-8?B?UWRtOGxrclMxS3Y2MFRQSzBQZ0YyZnlhRnhxS0o4cVZqL3dxRE5UaUNoRlhI?=
 =?utf-8?Q?mPZL8fkN?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c066ad24-5319-4424-b57a-08d8c2376dc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2021 20:17:39.3041
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 93VXGZOJQdmX0Uccu58CLYCkvQMwYXxfQ9cDCcRA5blu/Eh4bjJ/CfEUr6dagtEjWp4vheL5rgoj+vt79h8wANBbYGf1DANz0c7ZqpjvT3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3129
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E0C9AE456CF24B448FC0DE96BD32DBD9@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

SGkgQW5kcmVhcw0KDQpPbiBNb24sIDIwMjEtMDEtMjUgYXQgMTg6MTUgKzAxMDAsIEFuZHJlYXMg
TcO8bGxlciB3cm90ZToNCj4gT24gTW9uLCBKYW4gMjUsIDIwMjEgYXQgNjowOSBQTSBBbmRyZWFz
IE3DvGxsZXIgPHNjaG5pdHplbHRvbnlAZ21haWwuY29tPiB3cm90ZToNCj4gPiBPbiBNb24sIEph
biAyNSwgMjAyMSBhdCA1OjMxIFBNIEFkcmlhbiBGcmVpaG9mZXINCj4gPiA8YWRyaWFuLmZyZWlo
b2ZlckBnbWFpbC5jb20+IHdyb3RlOg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIEZyZWlo
b2ZlciA8YWRyaWFuLmZyZWlob2ZlckBzaWVtZW5zLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gIC4u
Li9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZXR3b3JrbWFuYWdlci9uZXR3b3JrbWFuYWdlcl8xLjI4
LjAuYmIgfCAxICsNCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gPiA+
IA0KPiA+ID4gZGlmZiAtLWdpdCBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9uZXR3b3JrbWFuYWdlci9uZXR3b3JrbWFuYWdlcl8xLjI4LjAuYmIgYi9tZXRhLW5ldHdvcmtp
bmcvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmV0d29ya21hbmFnZXIvbmV0d29ya21hbmFnZXJfMS4y
OC4wLmJiDQo+ID4gPiBpbmRleCAxMDUzYmRkNDIuLjczMzgyOTBlMSAxMDA2NDQNCj4gPiA+IC0t
LSBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZXR3b3JrbWFuYWdlci9u
ZXR3b3JrbWFuYWdlcl8xLjI4LjAuYmINCj4gPiA+ICsrKyBiL21ldGEtbmV0d29ya2luZy9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9uZXR3b3JrbWFuYWdlci9uZXR3b3JrbWFuYWdlcl8xLjI4LjAuYmIN
Cj4gPiA+IEBAIC0xNyw2ICsxNyw3IEBAIERFUEVORFMgPSAiIFwNCj4gPiA+ICAgICAgbGlibmV3
dCBcDQo+ID4gPiAgICAgIGphbnNzb24gXA0KPiA+ID4gICAgICBjdXJsIFwNCj4gPiA+ICsgICAg
cmVhZGxpbmUgXA0KPiA+ID4gICINCj4gPiA+IA0KPiBIaSBBZHJpYW4sDQo+IA0KPiBwcmVzc2Vk
ICdzZW5kJyBhY2NpZGVudGFsbHkuLi4NCj4gDQo+IHJlYWRsaW5lIGlzIGFuIG9wdGlvbmFsIGRl
cGVuZGVuY3kgZm9yIG5tY2xpLiBTaW5jZSByZWFkbGluZSBpcyBHUEx2MywNCj4gbm90IGV2ZXJ5
Ym9keSBpcyBoYXBweSBoYXZpbmcgaXQgaW4gdW5jb25kaXRpb25hbGx5LCBJIHN1Z2dlc3QgeW91
DQo+IGludHJvZHVjZSBhIFBBQ0tBR0VDT05GSUcgZm9yIHRoYXQgLSBkZWZhdWx0IGFkZCBvciBu
b3QgaXMgdXAgdG8geW91DQo+IChvciB3aGF0IGRvIG90aGVycyB0aGluaz8pDQo+IA0KPiBDaGVl
cnMNCj4gDQo+IEFuZHJlYXMNCg0KSGkgQW5kcmVhcw0KDQpUaGFuayB5b3UgZm9yIHRoZSBzdWdn
ZXN0aW9uLiBJIHdpbGwgc2VuZCBhIHYyIHBhdGNoIHdpdGggYQ0KUEFDS0FHRUNPTkZJR1tubWNs
aV0uIEJ1dCBzaW5jZSBubWNsaSB3YXMgc3BsaXQgaW50byBhIHNlcGFyYXRlDQpwYWNrYWdlLCBp
dHMgcG9zc2libGUgdG8gY29tcGlsZSBubWNsaSBidXQgbm90IGluc3RhbGwgaXQgaW50byBhDQpy
ZWxlYXNlZCBmaXJtd2FyZS4NCkhvd2V2ZXIgSSB3b25kZXIgYSBsaXR0bGUgYml0IGhvdyBvdGhl
cnMgYXJlIGNvbXBpbGluZyBOZXR3b3JrTWFuYWdlci4NCkF0IGxlYXN0IGluIG15IGNvbmZpZ3Vy
YXRpb24gdGhlcmUgaXMgYSBidWlsZCBlcnJvciB3aXRob3V0IHJlYWRsaW5lIGluDQpERVBFTkRT
Lg0KDQpSZWdhcmRzLA0KQWRyaWFuDQoNCg==
