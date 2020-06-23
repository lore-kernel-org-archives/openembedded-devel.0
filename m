Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.82])
 by mx.groups.io with SMTP id smtpd.web12.8264.1592871451377418846
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 17:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=A0rsWXMZ;
 spf=pass (domain: xilinx.com, ip: 40.107.93.82, mailfrom: ckalluri@xilinx.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ge3GHebym5qDIzWSWlH6Q1UWDupCsXEqkfz3slUzvw2ryiRSrNpiIA8PIk3o3aWK0TMdeIcUBkMYEvqaFs7WCvjTkYX4nhilyACUkRJlQjl4wztcLuhtIEc/FsUm2FPiCQGyJvZy+gN/4W6/tv6vv+vRqwkUDpBI4Rl8rmdN1kmv3sksznONc1e6vgHAAiW8jRuiitKgsjVxemtrSZUDzD7NOOdX6W/j+6YhB86yL/CF02zC8FMhtEMMIgu0nfYzcww9o9GbQelPPDiS5ZVuLdMNQ4ZPa9JGzW8Irrz135Pa7Wewm7ONdWRxFAbcPVXjvpWLT1ECHmnogtHZBO3CFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ayn4b3RgjDrgZIxzkrVGbt/u+E6uqR/zr4/PWNFfCyM=;
 b=J2WSepFSY+yGsIXJAFMltN02cXx/MNJCFZA74rTjpPx3bW9DJmXxmqoEWmAKlO0QzjIbl/seVPYMExOlX97jEsjSZSWpGB5WhGjeHdFAbTgt8XIZ+2lhUuNB33HkpifUqQXQWPLWSUpKxAptsvLdckDhBQdm6QS6FfLmr2R9c0qsz0JNqdVQfAYAHylGepJBRE0NJPa1iK98jE4apnHoNSJTY/BThfyaLVqZdi6MnVdwQzz+rJSbc2mvjCVWvcOpnWKPhplaBwpuOkgLq4RFRvUjcPIvEfT47OYVvjufQkG8kkjHAMgaMCbDEolgb5rBOJe7tx2Tr170NjYiLep0fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ayn4b3RgjDrgZIxzkrVGbt/u+E6uqR/zr4/PWNFfCyM=;
 b=A0rsWXMZWsKFrpx/xCRaFCYHzIl7LbnIuBfJit7zBSTgi0+lNsK8tl1kFAxG3o4V9HLNqxLqfDKAJDAcWG5SDrIZNTHisLO2HgHtsdNi1MGPZ+o5QvIGr3IVV1na6fYvt8D2Fx8kyK6bB84syVdwZqIGVjLOwMVELww5PV2wj2A=
Received: from BYAPR02MB5926.namprd02.prod.outlook.com (2603:10b6:a03:11e::19)
 by BYAPR02MB5814.namprd02.prod.outlook.com (2603:10b6:a03:11a::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Tue, 23 Jun
 2020 00:17:30 +0000
Received: from BYAPR02MB5926.namprd02.prod.outlook.com
 ([fe80::747a:5ccd:410a:4175]) by BYAPR02MB5926.namprd02.prod.outlook.com
 ([fe80::747a:5ccd:410a:4175%6]) with mapi id 15.20.3109.027; Tue, 23 Jun 2020
 00:17:30 +0000
From: "Chandana kalluri" <ckalluri@xilinx.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-browser][PATCH] chromium.inc: Use setuptools3 instead of setuptools bbclass
Thread-Topic: [oe] [meta-browser][PATCH] chromium.inc: Use setuptools3 instead
 of setuptools bbclass
Thread-Index: AQHWSOIogXx7EnyTskaUwy6dryhOaqjlT1WAgAAGJEA=
Date: Tue, 23 Jun 2020 00:17:30 +0000
Message-ID: 
 <BYAPR02MB59264D717671083FEB1010BDB0940@BYAPR02MB5926.namprd02.prod.outlook.com>
References: <1592863905-5241-1-git-send-email-chandana.kalluri@xilinx.com>
 <9c218a48-a624-0e3f-fad8-88d994efd0ed@gmail.com>
In-Reply-To: <9c218a48-a624-0e3f-fad8-88d994efd0ed@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8bd4d6ba-74fa-43b1-65c8-08d8170ad15a
x-ms-traffictypediagnostic: BYAPR02MB5814:
x-microsoft-antispam-prvs: 
 <BYAPR02MB5814EECD8998F5483662C6D5B0940@BYAPR02MB5814.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 04433051BF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 SmVzJ1WZoovJl6LL196N5owBJJDkCEcULJXdLqoh5XEr5XTB7w7XbKLT8XIqysvIULUsPVOEKzqY5dLnZxThnlWssATJearu8QTScWVMF+bOvwX72kF14xNAs2Ut7vwBLSqU03bgtFQpp7b/L22YdGcGO4kpbP/l6GfYdE8+sFnmUevjkojwo/Qn9tw3g9b7HYKqcGEugEX8xQfe7hobe+vmIInHiIZNRJuDN61GaBeyZSsIlcrW1oimj1SUgQt6DtS7+oWoZp3jn0+WJSfTXLSR4GUWsf2p8MMpQKya+MqGsLpKEhiJuOvkvj8L1MAz2fvi4lHsSKqaZIoljgdG2DKNsaZsNBtJS1zZGMiaqfDefebrRpJUYXTzEZwKdWuOP5NSDSvwOnx9eKzKpqLdtw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR02MB5926.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(376002)(136003)(39860400002)(396003)(6506007)(53546011)(33656002)(66476007)(66556008)(64756008)(2906002)(66446008)(83380400001)(26005)(86362001)(71200400001)(52536014)(8676002)(8936002)(5660300002)(966005)(66574015)(7696005)(478600001)(110136005)(66946007)(186003)(76116006)(316002)(55016002)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 6iRgMPbFwk0Mr0uVmaQEqjabYWh3eiuEn/f/v3mf4/QCpgqfkukqXje+Wy6VGjMclLjoxGi5A4ZGrAgh4yNP0zqT6M8ziciOUQY27I+N58Xo2swCAIINThwlbRPo+Jn+z98i7Zu5BR+opLJmAxujswHvvrDL36Qj55gDPdoTgySuGm+nC0ttLtTKis+7M6Z3wEN0SiP8efW/8z6I2RNkwoiWzK10dvVF99kQeKhHvBaCGwnMQP/X8IWQxTsebznDaRRTEDztnjh92Hnp0zG7M147eHqwTXvzdZ6Lg7g+6HkixifaB9R/GgebzUtc/QB+DUSPlp/VL3yhzANi/Sh9EzipJ645kfMWdVm9yfZptvieK9N2N6d6UaFsiYp5gBp9wHgbg87pW8MjnoWzeL/Jl6juonWUI7Ozu48cbPIUTM5kV/hK3sY2/KSep0us/iXVf2GUQMLTUdyzXu6nn68s8wHfjk9pef8yzhG5HrMWO0Pw2ziW1W4oHLEL7mXgK5ha
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd4d6ba-74fa-43b1-65c8-08d8170ad15a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2020 00:17:30.0900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zY9z+r7ZsNfsYbJRgqoAMLqfyrOFdmepPVs5Gwi7r0aPfkvOtUtF8wvNe/EAeEbZRrQzgsSGeK4layVH6sm81g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5814
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEtoZW0gUmFqIDxyYWoua2hl
bUBnbWFpbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgSnVuZSAyMiwgMjAyMCA0OjU1IFBNDQo+IFRv
OiBDaGFuZGFuYSBLYWxsdXJpIDxja2FsbHVyaUB4aWxpbnguY29tPjsgb3BlbmVtYmVkZGVkLQ0K
PiBkZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IENjOiBDaGFuZGFuYSBLYWxsdXJpIDxj
a2FsbHVyaUB4aWxpbnguY29tPg0KPiBTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1icm93c2VyXVtQ
QVRDSF0gY2hyb21pdW0uaW5jOiBVc2Ugc2V0dXB0b29sczMNCj4gaW5zdGVhZCBvZiBzZXR1cHRv
b2xzIGJiY2xhc3MNCj4gDQo+IA0KPiANCj4gT24gNi8yMi8yMCAzOjExIFBNLCBDaGFuZGFuYSBr
YWxsdXJpIHdyb3RlOg0KPiA+ICBGcm9tIGR1bmZlbGwgb253YXJkcywgcHl0aG9uMiByZWNpcGVz
IGFuZCBjbGFzc2VzIGFyZSBub3Qgc3VwcG9ydGVkLg0KPiA+IEluaGVyaXQgc2V0dXB0b29sczMu
YmJjbGFzcyBmb3IgY2hyb21pdW0gaW5zdGVhZCBvZiBzZXR1cHRvb2xzLmJiY2xhc3MNCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFNhaSBIYXJpIENoYW5kYW5hIEthbGx1cmkgPGNoYW5kYW5hLmth
bGx1cmlAeGlsaW54LmNvbT4NCj4gPiAtLS0NCj4gPiAgIHJlY2lwZXMtYnJvd3Nlci9jaHJvbWl1
bS9jaHJvbWl1bS5pbmMgfCAyICstDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9yZWNpcGVzLWJyb3dzZXIv
Y2hyb21pdW0vY2hyb21pdW0uaW5jDQo+ID4gYi9yZWNpcGVzLWJyb3dzZXIvY2hyb21pdW0vY2hy
b21pdW0uaW5jDQo+ID4gaW5kZXggYTQ4M2VjNC4uNDk5NDdiZSAxMDA2NDQNCj4gPiAtLS0gYS9y
ZWNpcGVzLWJyb3dzZXIvY2hyb21pdW0vY2hyb21pdW0uaW5jDQo+ID4gKysrIGIvcmVjaXBlcy1i
cm93c2VyL2Nocm9taXVtL2Nocm9taXVtLmluYw0KPiA+IEBAIC0xOCw3ICsxOCw3IEBAIFRPT0xD
SEFJTiA9ICJjbGFuZyINCj4gPiAgICMgdG8gYnVpbGQgdGhlIG5hdGl2ZSByZWNpcGVzIChlLmcu
IEdOKSB3aXRoIGNsYW5nIHRvby4NCj4gPiAgIFRPT0xDSEFJTl9jbGFzcy1uYXRpdmUgPSAiY2xh
bmciDQo+ID4NCj4gPiAtaW5oZXJpdCBweXRob24zbmF0aXZlIHNldHVwdG9vbHMNCj4gPiAraW5o
ZXJpdCBweXRob24zbmF0aXZlIHNldHVwdG9vbHMzDQo+IA0KPiBpdCBzdGlsbCBuZWVkcyBweXRo
b24yLCBiZXR0ZXIgcGF0Y2ggaXMgdG8gYWRkIG1ldGEtcHl0aG9uMiB0byBtZXRhLWJyb3dzZXIN
Cj4gbGF5ZXIgZGVwZW5kZW5jaWVzDQo+IA0KPiBlLmcgaW4gY29uZi9sYXllci5jb25mDQo+IExB
WUVSREVQRU5EU19icm93c2VyLWxheWVyID0gImNsYW5nLWxheWVyIGNvcmUgb3BlbmVtYmVkZGVk
LWxheWVyIg0KPiANCj4gDQpXaWxsIHRyeSB0aGlzIG91dC4gDQoNClRoYW5rcywNCkNoYW5kYW5h
DQo+ID4NCj4gPiAgICMgQ2hyb21pdW0gaXRzZWxmIGlzIGxpY2Vuc2VkIHVuZGVyIHRoZSAzLWNs
YXVzZSBCU0QgbGljZW5zZS4gSG93ZXZlciwgaXQNCj4gPiAgICMgZGVwZW5kcyB1cG9uIHNldmVy
YWwgb3RoZXIgcHJvamVjdHMgd2hvc2UgY29weXJpZ2h0IGZpbGVzIGFyZQ0KPiA+IGxpc3RlZCBp
bg0KPiA+DQo+ID4NCj4gPiANCj4gPg0K
