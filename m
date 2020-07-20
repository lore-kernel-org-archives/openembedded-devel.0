Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.87])
 by mx.groups.io with SMTP id smtpd.web11.6671.1595283365273137685
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2020 15:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OAwpOH/s;
 spf=pass (domain: windriver.com, ip: 40.107.236.87, mailfrom: joe.slater@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8g94fhWPRPdjNXd/3fC4pWEfxusYLEMgskFs6zSEmxL1rJibRPxgVbmXBTwtrOrxzPzG+1gciAWAtnoy91sxYjaliekbZiPjVtAaOhnQfknGbLSnp7ACLpfbTwLOhvUsWtsSvixbxNNS3dYQ9htMSRBgz/3Y127az0G8dl5kx+9z2bZ2nkjKwF6ww8C6jE8R+jjyeL4yLEoSwP4t5A93VNBILOnaiAvr7sOl+P68BMPTFDD0j2ZZYLwu9Q6I26HIoJ9Bmm4V3KGnrwPxyvNhQMki73czHejk/zA/t0R3EbENgkfl5+tolllcGhaPEj+YeD43r5Ek8VZsYgedL6IVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFc3sHLb/ykHKnQ43+NC9LK6ba7Q5h6jZSWwnA59sKk=;
 b=XNB+bEtLsbpgSXhwHLcDyCT5cP3c5xIxRgXTPM/nnb1gIHW3m4OzjdG35mQylPpINlYAv4a4gGWOfWGGPrGxG1hPzRyT54V3UNBdfJhp8k6Yao7UA2AqckXfd9ieLXYeHdHLj5v/1gxoUVn8XsvzHJeZT0KzdHnB1yEhCIRml5XiGj3pbuQylwOkd+C8h3zSiAcgXnvh4uODLpFYA5oBfbbngqW9IqYovVD1B/IBRRsU1E3VwgZaBz/nUzCRbA/zLm+O3ZHaZVAvdTjidAFk0vXt05QgyBPReVZbZwureNmdLar9eXOYice3mQ/8VtaqDZsQXXhr58e/VMhZInuWPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFc3sHLb/ykHKnQ43+NC9LK6ba7Q5h6jZSWwnA59sKk=;
 b=OAwpOH/sOcCFTTidSjrawvGXUCvvkol7jfFI8ZOuP6e4zMbr1NOA5NmqfhBDiT1iAOuBTVjYC1egAJf+II/Z0e/Xd77z/yLF2H80roVQ76PMgOCCpkNLKUsZRAtsXT1EWs2UlicUDGyvwQqyfU45OBDEsp5yE83wOcuXUWXhRy8=
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BY5PR11MB4168.namprd11.prod.outlook.com (2603:10b6:a03:181::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25; Mon, 20 Jul
 2020 22:16:02 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::90e6:1883:a2fd:98ef]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::90e6:1883:a2fd:98ef%6]) with mapi id 15.20.3195.025; Mon, 20 Jul 2020
 22:16:02 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>, "MacLeod,
 Randy" <Randy.MacLeod@windriver.com>
Subject: Re: [oe] [meta-oe][PATCH 1/1] lvm2: reproducible binaries
Thread-Topic: [oe] [meta-oe][PATCH 1/1] lvm2: reproducible binaries
Thread-Index: AQHWXH1AqFi6n8G0MUmZV0klxfJjvKkRA7qAgAAGz2A=
Date: Mon, 20 Jul 2020 22:16:02 +0000
Message-ID: 
 <BY5PR11MB39925BE679AF15A585088706887B0@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <20200717205956.131825-1-joe.slater@windriver.com>
 <CAMKF1so2eu6NJA3nfX6=96dF5NX7orT-wmdHEn5HJCGoMtwPrg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1so2eu6NJA3nfX6=96dF5NX7orT-wmdHEn5HJCGoMtwPrg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
x-originating-ip: [24.4.218.114]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e116b079-e7b8-4d5e-97e5-08d82cfa7d0e
x-ms-traffictypediagnostic: BY5PR11MB4168:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BY5PR11MB4168D2DB41190A3F2C203FF9887B0@BY5PR11MB4168.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 BlWKl617GxtvrtX8WSVTtcW2/eHouLpn7K1l6s6A/sdVkqzUN7CDWe6/v3eBjjRQiN5Flb3rC8UgIHlM/BbbDASYgwHMs8uiHAvzyRIG15QN189PWNrbRT115SrNHAGyTz0MrBFBmxMZ8EEMOi+8oEey8Zswg2p0lSFzu1BgOllDrw2Xn5aPtnKb99TE/e+XoxHkxGH9avY13mjhEh8gWNiMTPgmW8B/98GH1ygb62e5arGNL2EVGoSurIeh2DZQFyD3DKR7nKcw33AJXO461H69p2uWCKtvvuA6bf5P9Z5YKnIUka34kPfehwxqvQUPb9AuTYDaV+GCzO3ABBhIIgJwZeIwV0SyjRsYzZQiVIEDmIp3VwZXWy73eyjJN2e/8131ORsiYIwqLVsgNzNmlg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(396003)(39850400004)(346002)(376002)(136003)(6916009)(7696005)(2906002)(26005)(52536014)(5660300002)(54906003)(33656002)(186003)(966005)(478600001)(83380400001)(86362001)(71200400001)(53546011)(6506007)(8936002)(8676002)(4326008)(55016002)(9686003)(66946007)(107886003)(66476007)(66556008)(64756008)(66446008)(316002)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 6Tb6HqmpCWtwfPeBbJdADb2RvhJRCh229ALtmNAGmSj14c+lwznTy3FX/sxk1sblzFbM3ih9vKgIQ/iEyq0I2xCRAyTP2dWGun7KiS3F6JynhGzRlhkyjSxQgeoKInUH27iXQHqRTArDD9cDXVMBHF1/VRvQ6vDp4wUGPMiO+H9FEjMKFBgCcFL3HHSO5fhU+CYNRIwiWZmy68Olf6L3gGC7QrYXty6Jchd/YCl2FFAIihMRp2nq6tTT7XxaBUoWdM9qcESGjfUsjOBAaspR8GHlq4rQF4Sk5flerI0Mm7UVU9r1lyenf/80e5d6re1709WhB8btCc53JzMbw554BtSKEZmNt8IRo7+Dg319Iw9HElfVwApyXIrubjTOJXe1lhZxCCvbaNIB4s2SUVEdhY9g8VetXa2xAngdOl5ssi2HBQUMV1ENxaKCcuI35e0CZn8jwMPtjhEBpDdz+fjITo78d6DdKCzYLwDAL908Dco=
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e116b079-e7b8-4d5e-97e5-08d82cfa7d0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2020 22:16:02.2810
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1WfVfpNK+usQWjmsksh24hwQnRAVp7Cib6XscwAvVDeH9HHsyKrf4bHg+ktPzhmKJZrz14IkAfRXsuC1gy8w/Z59ujZcfdIPJgg2cw4h6ns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4168
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBoYXZlIG5vdCBsb29rZWQgYXQgd2hlbiBpdCBpcyBwcmludGVkLCBwcm9iYWJseSBmb3IgLS1o
ZWxwIG9yIC0tdmVyc2lvbiwgYnV0IHdlIHdvdWxkIG5vdCBiZSBhYmxlIHRvIHNlZSB0aGUgY29t
bWFuZCBsaW5lIHRoYXQgaW52b2tlZCBjb25maWd1cmUuICBUbyBtZSwgdGhhdCdzIG5vdCBtdWNo
IG9mIGEgbG9zcy4NCg0KSSBvcmlnaW5hbGx5IGhhZCBhIHBhdGNoIHRoYXQgd291bGQgYWxsb3cg
dGhlIGRlZmluaXRpb24gb2YgQ09ORklHVVJFX0xJTkUgaW4gY29uZmlndXJlLmFjIHRvIGJlIG92
ZXJyaWRkZW4gYnkgc2V0dGluZyBpdCBpbiB0aGUgZW52aXJvbm1lbnQuICBXZSBjb3VsZCB0aGVu
IGRvIHRoYXQsIG9yIG5vdCwgaW4gdGhlIHJlY2lwZS4gIE1heWJlIGV2ZW4gbWFrZSBpdCBhIHBh
Y2thZ2Vjb25mIG9wdGlvbi4gIEkgY2FuJ3QgcmVtZW1iZXIgd2h5IEkgc3dpdGNoZWQgdG8gY29u
ZGl0aW9uYWwgcGF0Y2hpbmcsIGJ1dCBJIGNvdWxkIGFsd2F5cyBzd2l0Y2ggYmFjay4NCg0KSm9l
DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPiANClNlbnQ6IE1vbmRheSwgSnVseSAyMCwgMjAyMCAyOjQwIFBNDQpUbzogU2xh
dGVyLCBKb3NlcGggPGpvZS5zbGF0ZXJAd2luZHJpdmVyLmNvbT4NCkNjOiBvcGVuZW1iZWRlZC1k
ZXZlbCA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+OyBNYWNMZW9k
LCBSYW5keSA8UmFuZHkuTWFjTGVvZEB3aW5kcml2ZXIuY29tPg0KU3ViamVjdDogUmU6IFtvZV0g
W21ldGEtb2VdW1BBVENIIDEvMV0gbHZtMjogcmVwcm9kdWNpYmxlIGJpbmFyaWVzDQoNCk9uIEZy
aSwgSnVsIDE3LCAyMDIwIGF0IDI6MDAgUE0gSm9lIFNsYXRlciA8am9lLnNsYXRlckB3aW5kcml2
ZXIuY29tPiB3cm90ZToNCj4NCj4gRm9yIHJlcHJvZHVjaWJsZSBiaW5hcmllcywgY3JlYXRlIGEg
c3RhdGljIENPTkZJR1VSRV9MSU5FIGR1cmluZyANCj4gY29uZmlndXJhdGlvbiByYXRoZXIgdGhh
biByZXBvcnRpbmcgdGhlIGNvbW1hbmQgbGluZSBpbnZva2luZyANCj4gY29uZmlndXJlLg0KPg0K
DQppcyB0aGVyZSBhbnkgZG93bnNpZGUgb2YgYXBwbHlpbmcgdGhpcyBwYXRjaCB3aXRob3V0IGNv
bmRpdGlvbmFsIGRlcGVuZGVuY3kgb24gcmVwcm9kdWNpYmxlIGJ1aWxkcyA/DQp3aGF0IGRvIHdl
IGxvc2UgPw0KDQo+IFNpZ25lZC1vZmYtYnk6IEpvZSBTbGF0ZXIgPGpvZS5zbGF0ZXJAd2luZHJp
dmVyLmNvbT4NCj4gLS0tDQo+ICAuLi4vbHZtMi9maWxlcy9yZXByb2R1Y2libGUtYnVpbGQucGF0
Y2ggICAgICAgICAgICB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysNCj4gIG1ldGEtb2UvcmVj
aXBlcy1zdXBwb3J0L2x2bTIvbHZtMi5pbmMgICAgICAgICAgICAgIHwgIDIgKysNCj4gIDIgZmls
ZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IA0KPiBt
ZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9sdm0yL2ZpbGVzL3JlcHJvZHVjaWJsZS1idWlsZC5wYXRj
aA0KPg0KPiBkaWZmIC0tZ2l0IA0KPiBhL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2x2bTIvZmls
ZXMvcmVwcm9kdWNpYmxlLWJ1aWxkLnBhdGNoIA0KPiBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0
L2x2bTIvZmlsZXMvcmVwcm9kdWNpYmxlLWJ1aWxkLnBhdGNoDQo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0DQo+IGluZGV4IDAwMDAwMDAuLmRiNTk4YTgNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9t
ZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9sdm0yL2ZpbGVzL3JlcHJvZHVjaWJsZS1idWlsZC5wYXRj
aA0KPiBAQCAtMCwwICsxLDI0IEBADQo+ICtjb25maWd1cmUuYWM6ICBvdmVycmlkZSBDT05GSUdV
UkVfTElORQ0KPiArDQo+ICtGb3IgcmVwcm9kdWNpYmxlIGJpbmFyaWVzLCB3ZSBuZWVkIHRvIHJl
cG9ydCBhIGNvbnN0YW50IENPTkZJR1VSRV9MSU5FLg0KPiArVGhpcyBwYXRjaGVkIGlzIG9ubHkg
YXBwbGllZCBmb3Igc3VjaCBidWlsZHMuDQo+ICsNCj4gK1Vwc3RyZWFtLVN0YXR1czogSW5hcHBy
b3ByaWF0ZSBbb2Ugc3BlY2lmaWNdDQo+ICsNCj4gK1NpZ25lZC1vZmYtYnk6IEpvZSBTbGF0ZXIg
PGpvZS5zbGF0ZXJAd2luZHJpdmVyLmNvbT4NCj4gKw0KPiArDQo+ICstLS0gZ2l0Lm9yaWcvY29u
ZmlndXJlLmFjDQo+ICsrKysgZ2l0L2NvbmZpZ3VyZS5hYw0KPiArQEAgLTE1LDcgKzE1LDEwIEBA
IEFDX1BSRVJFUSgyLjY5KQ0KPiArIA0KPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+ICsjIyMjIyMjIyMjIyAg
ZG5sIC0tIFByb2Nlc3MgdGhpcyBmaWxlIHdpdGggYXV0b2NvbmYgdG8gcHJvZHVjZSBhIA0KPiAr
Y29uZmlndXJlIHNjcmlwdC4NCj4gKyBBQ19JTklUDQo+ICstQ09ORklHVVJFX0xJTkU9IiQwICRA
Ig0KPiArK2RubCBUaGUgZGVmYXVsdCBDT05GSUdVUkVfTElORSBoYXMgYmVlbiBvdmVycmlkZGVu
IGZvciByZXByb2R1Y2libGUgDQo+ICsrYmluYXJpZXMgZG5sIENPTkZJR1VSRV9MSU5FPSIkMCAk
QCINCj4gKytDT05GSUdVUkVfTElORT0iY29uZmlndXJlIHBhcmFtZXRlcnMgYXJlIG5vdCBhdmFp
bGFibGUgZm9yIHJlcHJvZHVjaWJsZSBidWlsZHMiDQo+ICsrDQo+ICsgQUNfQ09ORklHX1NSQ0RJ
UihbbGliL2RldmljZS9kZXYtY2FjaGUuaF0pDQo+ICsgQUNfQ09ORklHX0hFQURFUlMoW2luY2x1
ZGUvY29uZmlndXJlLmhdKQ0KPiArDQo+IGRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtc3Vw
cG9ydC9sdm0yL2x2bTIuaW5jIA0KPiBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2x2bTIvbHZt
Mi5pbmMNCj4gaW5kZXggMDFjOWRmNC4uYWI2MThiNCAxMDA2NDQNCj4gLS0tIGEvbWV0YS1vZS9y
ZWNpcGVzLXN1cHBvcnQvbHZtMi9sdm0yLmluYw0KPiArKysgYi9tZXRhLW9lL3JlY2lwZXMtc3Vw
cG9ydC9sdm0yL2x2bTIuaW5jDQo+IEBAIC0xNSw3ICsxNSw5IEBAIFNSQ19VUkkgPSAiZ2l0Oi8v
c291cmNld2FyZS5vcmcvZ2l0L2x2bTIuZ2l0IFwNCj4gICAgICAgICAgICAgZmlsZTovLzAwMDEt
QXZvaWQtYmFzaGlzbXMtaW4taW5pdC1zY3JpcHRzLnBhdGNoIFwNCj4gICAgICAgICAgICAgZmls
ZTovLzAwMDUtZG8tbm90LWJ1aWxkLW1hbnVhbC5wYXRjaCBcDQo+ICAgICAgICAgICAgIA0KPiBm
aWxlOi8vMDAwNi1zdGFydC1sdm0yLW1vbml0b3Iuc2VydmljZS1hZnRlci10bXAubW91bnQucGF0
Y2ggXA0KPiArICAgICAgICAgICANCj4gKyAke0BiYi51dGlscy5jb250YWlucygnQlVJTERfUkVQ
Uk9EVUNJQkxFX0JJTkFSSUVTJywnMScsJ2ZpbGU6Ly9yZXBybw0KPiArIGR1Y2libGUtYnVpbGQu
cGF0Y2gnLCcnLCBkKX0gXA0KPiAgICAgICAgICAgICAiDQo+ICsNCj4gIFNSQ1JFViA9ICJiOTM5
MWIxYjlmMGI3MzMwM2ZhMjFmOGY5MjU3NGQxN2NlNGMyYjAyIg0KPiAgUyA9ICIke1dPUktESVJ9
L2dpdCINCj4NCj4gLS0NCj4gMi43LjQNCj4NCj4gDQo=
