Received: from esa10.fujitsucc.c3s2.iphmx.com (esa10.fujitsucc.c3s2.iphmx.com [68.232.159.247])
 by mx.groups.io with SMTP id smtpd.web08.34725.1629171598719719235
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Aug 2021 20:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@fujitsu.com header.s=fj1 header.b=Aq/p9VBm;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.247, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1629171598; x=1660707598;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=4k9hYAhKrZUZpThhQifv8JGTbCqYedt4PTssa49At7A=;
  b=Aq/p9VBmpAdRkz85IBc5IZyK/6XQgYLxjVJvpwi8AgtIljM8L/q+cZug
   eU0WaDS11Zc83OoRIfDaa60cOACCzoTIev7/2q1jL2SAq7v4RAAkKEPC9
   2GmXI7QDC8/5+l5L+V9YDzN1hso7XWiYPjGsiG84TnUUe0JNtvF+gsr+8
   ehh4ADRk2fe6U5FYObQqZP6WslQ2bBZmtbBTzp8aqiyZSt1EeT/EI2fNK
   x49pXGvhuCSsBB4Ntz+tRyBkdn7ViN1MoZkprrOBoiTCtedkwvHzh+MDP
   CwnBobYVye3u9I9nU6hWQvfanM59Vav89JjlG8tdwJ/4j7vZZzIP88D8x
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="36824134"
X-IronPort-AV: E=Sophos;i="5.84,327,1620658800"; 
   d="scan'208";a="36824134"
Received: from mail-os2jpn01lp2050.outbound.protection.outlook.com (HELO JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.50])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2021 12:39:54 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYWDGghn3dv+4icPvu+RBhCj8Fp6piBa7OzcpXsv+/rNHG+wnkKV9GSNwNnrWDGRTOXRuLFDFK0j4I32AW1nWvG5Um+pY56NgOd4Nehroa+AKmBFP6RCFLFOy2O6vzp/tEfPQ+n9+yGBeqiuYbN1mgkLkdsBWEgHEQRQajEs/qZx7iHJ+g0KloLKMQpVg3bQxBleW+MSec8z4aUn17Ehk9nI9EkW+2mx0C70+rG7N3UYSizLDTw7Z0CYi2vRbQltqCntoIv/f9aNidmUsZmQrJ/oNO79axQYE4O6z05/IOPu0EtcOUsUBcxJlTp4mXf4ThcCjoGq5Y8ZqCX4fjKuqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4k9hYAhKrZUZpThhQifv8JGTbCqYedt4PTssa49At7A=;
 b=XrVdvDLbsvgD5s4G/DV2KV00BZAGm5rltgHsDEyE1di0HId5iuZhnYAfYD5q7qw2jO7wPAhEcZCHtb9Vg0GAAsQs12U3mdX1jVlNyM8vrVPu3sO15nBmjWvyzm8AHeVy+ZpuOhzLtWTuBh9qT9AhQQdBFy0mQ2FnoIbEPFsehHm1RZ1OYP4ImtUUFEcuz3oS73U4MdXv8SxJOXd5sjEk7DWb9CA8bHcT//jbZv6kqqXKecrJ3OsnxrJ/Y/hyuSdQ0sYU9U1A7Cyf7YoXTGoaUg5+eDVq21hNhj5B1ceo0/vKhd5+ANwhVP64Qxw7QAehSYH44l8eZwCva13a0+p0CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4k9hYAhKrZUZpThhQifv8JGTbCqYedt4PTssa49At7A=;
 b=D8FqbYZlfNl3oP/7DdG/LS74u8nN6tJUhXzPFBYxMXioUXqbR7DL5rYE50MBD2FyPm28nARHkyLHitM9Xrx/5NsgpCPkSY0Uwl2pSdJVgoHRYfwA1iTs1hagwPd8lvJDirHKurBKcd1PpOT27SNKkYRyUmvx1qb0R5YSAF/MrrQ=
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by OSYPR01MB5446.jpnprd01.prod.outlook.com (2603:1096:604:88::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Tue, 17 Aug
 2021 03:39:52 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::b8c0:9704:899b:2b3d]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::b8c0:9704:899b:2b3d%6]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 03:39:52 +0000
From: "leimaohui" <leimaohui@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH v2] [PATCH] takao-fonts: It should be in ttf-fonts directory as the other ttf fonts.
Thread-Topic: [oe] [meta-oe][PATCH v2] [PATCH] takao-fonts: It should be in
 ttf-fonts directory as the other ttf fonts.
Thread-Index: AQHXkj2OwBjRsaIJmEOVNIQA64aDnKt1rBuAgAFhL4A=
Date: Tue, 17 Aug 2021 03:39:52 +0000
Message-ID: 
 <OS0PR01MB617882F9E8FB088B1E679EE0A0FE9@OS0PR01MB6178.jpnprd01.prod.outlook.com>
References: <1629109498-55444-1-git-send-email-leimaohui@fujitsu.com>
 <1629109498-55444-2-git-send-email-leimaohui@fujitsu.com>
 <5cf0af51-e13f-1420-938c-e4e45ee98838@gmail.com>
In-Reply-To: <5cf0af51-e13f-1420-938c-e4e45ee98838@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10a9347f-7d68-4d66-db8f-08d96130ac3f
x-ms-traffictypediagnostic: OSYPR01MB5446:
x-microsoft-antispam-prvs: 
 <OSYPR01MB54462AC15B90A78B2D65BED1A0FE9@OSYPR01MB5446.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 DR+QQpPGINdUFsJLjaUXJUdYZI6aT4s/e24ugoEK66dDgSKuRIcUu2cbQ3E7ytDWmtx7i0ezfjhOx5lSkLJjnCj8EQdHMHCBTnig79VtldUVLVhN1btDKE4h4ip9R7G3YbxrESD3T6cDFmN/WvVcEdynmS8rIFWAL0QKGuHhi8bDGjqZjEJQ/XqcrZgFyqNCBlzKkExcoQvF+kdr88t/DVipdKTItvLc5V9bQKumTj0O5aXUH45I8voMcKy6RcIgrM1Mdbsid8o5xDa2UrOcmJkcX5/qwDgc/LneU/9gKZxUBkrClVrYGYsBIQbZst2QiB2o0yLmert0v0rwDfFMOp5pHXy3SgcGEvGfbZB7bMJoS8/XdBzIWUWnPOfb2Fygy5+v2WVkhX+kK2aqB2F7Akdr6/cahakAgq+PMOpJ69/HeGZnHA4u7wB0iu/KU3yUuskJ68FhmoWVfJ9MX0sLt344e2IoDnvTmqw13EdNgQ/XiWMMAtCYLY3bcvkYP5e0sKjVVKoAc3ydMmykhOteau/9ym45GTFEF3r9oUTGFrr8pyLF72FF86gaZsyBWESen4EJnTVv04XwPxo77akPZysEjmqv8Qv3ydJCp2+ukEDgubCTpb44IVWYTZ/YpSnVHjH2JwzDgxGrDYs3c5Qbrsja07/jWnv6ChFNOB1ezl5wYgCZMvnRni/CRl+96zkb+3NHSfBrG3wlpRvJmftmMT9Rdgcf6E2tcP4TaQ1Ir2RqeLvYuvh552gHXzZHasRQQe2F/6tc+zqDuwQsXswYAkDs0Cnu8xX8PrK0k1pQmS1OOhIpo4PG0ITo+NANd9cJ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(478600001)(2906002)(110136005)(64756008)(7696005)(66556008)(5660300002)(66446008)(66946007)(66476007)(966005)(9686003)(33656002)(8676002)(76116006)(316002)(6506007)(26005)(83380400001)(38070700005)(53546011)(85182001)(55016002)(52536014)(8936002)(186003)(71200400001)(122000001)(86362001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VmhJZ2JyTVNjQnlZNFkyRFdOQzl0SnNnQjRrMmdGYlpGZHpqaysxR0s0cFVt?=
 =?utf-8?B?Q2JDckhLT3Q1M251NTR2Z1FFTVVJSE84cGZIZ2FuN1pXOFU3aDhyTVl4ZzNX?=
 =?utf-8?B?b3ozRTdpY3Q5R3JaNXFWUXlOSjlTak1DYVRlLzQ2dEVoaXcxdFk1RDdKOEsz?=
 =?utf-8?B?b0RXc3pnQkNVZFEyK0FrbWppNjVMNmVNa0dVUXFDa0ZmbEVURExJTjBLL1BL?=
 =?utf-8?B?YTgyR3NBRldOWkx6b3BKSERhTlF0d25jN2tkRWovYTI0YkNGVU85NnQxc0Za?=
 =?utf-8?B?SExpdW11TlFXVzB1Y05JYXVIckUzMnpudG93cWN4TGdmd3Q3N2tKTTVVT05D?=
 =?utf-8?B?UnFxb2QxQXBFNkd3MzZDanl5WGN5aVVKOWRFMGJIaGNaMDBXZXd3YVZWSC85?=
 =?utf-8?B?RmluOGZScjRpeFE3WjJIS25vSFFmckVUREpZVXBkYmNqMytaMGdtOFB0SlVV?=
 =?utf-8?B?WEczNEhXdXhzU3kyYlJjRVk5RHFyVG81VG5nTXhBWlNPWjhEcmVFV2pyUnRq?=
 =?utf-8?B?YnFtRDNZL0VVNFYwaE5SZENBYlgvUjJheXhyUFRwMi9OYjBHZlRKaE1lMThD?=
 =?utf-8?B?dmVSTGdzdG9ibDhzdFdnbFlnREs5bFEvUjFWOElIUDBvVHZ2dnJaRlNxb29w?=
 =?utf-8?B?RGFIU2FFek9icFpMOHZMQWtaczhYUWMwU0RqaGtQWndoeFZrek55Q0VGQzZ1?=
 =?utf-8?B?WkVwZUNsY0hjaTdLbGFlOFNzS2dGaW9nRVUxZ3JHdDNUOFV0UnVyRnBZYk1L?=
 =?utf-8?B?TkxURDJVOHlXaWVSYlpjWG1jeE9KeDdVNEdEM1prNTdkVXFzNiswMHdxQmc1?=
 =?utf-8?B?Wng1QmlKTUZ6by9oeCt4YndibmlLRHFkZlc4NExWMTVlcWViekd3SHRUTGxi?=
 =?utf-8?B?Q2FpcHV4R2ZZZloweUkxREZqSDUyUWY4am9icExCVlZwTFB5NWY5Z0tiaUh4?=
 =?utf-8?B?UllISk8xRVF5aFZ1SFQ3bUpQeVdvZnh2WUJYd1pqMHhUK0hUaEN6VldWa0la?=
 =?utf-8?B?dS9tV1JubnBCK1VUUkw0QlgrYWxPeEdvcGNaN0dtRzdreDNxMnlpOXVwMUR3?=
 =?utf-8?B?dzVMSmtwR2RwSDhEdmN3NDQ0SzIvUEovUS9yRnhLUDhQTEhGTnBzY3NWcEM5?=
 =?utf-8?B?Sk91ZmJZc3NzYjRWWk5FNEJjTXBKdWUwZmJHYkFER2hzL0lPSThPNHh5ZlF5?=
 =?utf-8?B?RHN4dmlJaGdobTFwQW9RWFczWjMwdWJlQUk3QXlzcnJIc3doYWVtUHZFVXdS?=
 =?utf-8?B?cTY0cVZnQjRpTEVsYm5UcEFvcW1GazdOR2k4UkVOR2ZnU1NNelpMelF2cnJW?=
 =?utf-8?B?UXFMZVhEUWhGQWt4bFhiRFlCMGl4cGk5SlN4ME56Q2llbE9FdUduSmdWek5n?=
 =?utf-8?B?dUdsamFVaHNIcWI5SndMcHl4WVM1WTkwNmtaVEhZMTRLV2FxSTVzZ2N6ODVv?=
 =?utf-8?B?eEdkbzJ3R2hrSWpBaFhyT0Z3VWx6SFR5Z2dkTDhIVWhZWkh2MzJuOXZrcnNl?=
 =?utf-8?B?c1JQKy9QMityMDZZN2ZVWDNhMDd2a2tkMzdwQjNGUHFXZ3VvaTFkSE8vb0o5?=
 =?utf-8?B?L3RjQUNTUHF0WE94OGZPZnBUa2RDRlVDeGdHenpsWERTWVc1UnZxV2xOa1Bx?=
 =?utf-8?B?NnlKNmdvSmVqS3JkV3gvNmZaMjdWMGoza0U0Ky9FbkY3L3RNMGVkMFFLUmtS?=
 =?utf-8?B?dDVJV1AydXBxOTJ1Lzk0cUhiUUloc2R0NkpoWU5HbGZGb3Vtd2E2bGJ4MC8x?=
 =?utf-8?Q?ZlCenyfEgldJqgkFk0=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a9347f-7d68-4d66-db8f-08d96130ac3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2021 03:39:52.5049
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5b4YyzrqLiGYbpUJqRhBi8KKA8AIAFKluPN3hr8tMbIYETcbgrnwDI/S7RR+lV7qhSR4kxadAxy8IbbZcb0K6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5446
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgS2hlbSwNCg0KDQo+IEkgdGhpbmsgdGhpcyBpcyBzdGlsbCBub3QgYSBjb21wbGV0ZSBmaXgg
dGhlcmUgYXJlIG1vcmUgcmVjaXBlcyBpbg0KPiBtZXRhLW9wZW5lbWJlZGRlZCByZXBvIHdoaWNo
IGhhdmUgZGlyZWN0IGRlcGVuZGVuY3kgb24gdGhpcyByZWNpcGUsIHBsZWFzZQ0KPiBjaGVjayB0
aG9zZSBvdXQgdG9vLiBJIGRpZCBtZW50aW9uIGZ1bGwgbGlzdCBpbiBteSBsYXN0IG1lc3NhZ2UN
Cg0KSSdtIHNvcnJ5IHRoYXQgSSBmb3Jnb3QgdG8gc2VuZCBhbm90aGVyIHBhdGNoIHRvIGZpeCB1
aW0gd2hpY2ggZGVwZW5kcyBvbiB0YWthby4gDQpJIHRoaW5rIGl0IGlzIGEgbWlzcyB0aGF0IGFk
ZGVkIHRha2FvIHRvIERFUEVORFMgb2YgdWltLiBTbywgSSBzdWJtaXR0ZWQgYSBwYXRjaCB0aGF0
IGRlbGV0ZWQgdGFrYW8gZnJvbSB1aW0gREVQRU5EUy4NCg0KQmVzdCByZWdhcmRzDQpMZWkNCg0K
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPg0KPiBTZW50OiBNb25kYXksIEF1Z3VzdCAxNiwgMjAyMSAyOjMxIFBNDQo+IFRv
OiBMZWksIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPjsNCj4gb3BlbmVtYmVkZGVkLWRl
dmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtvZV0gW21ldGEtb2Vd
W1BBVENIIHYyXSBbUEFUQ0hdIHRha2FvLWZvbnRzOiBJdCBzaG91bGQgYmUgaW4NCj4gdHRmLWZv
bnRzIGRpcmVjdG9yeSBhcyB0aGUgb3RoZXIgdHRmIGZvbnRzLg0KPiANCj4gDQo+IA0KPiBPbiA4
LzE2LzIxIDM6MjQgQU0sIGxlaW1hb2h1aSB3cm90ZToNCj4gPiAtIE1vdmVkIGl0IHRvIHR0Zi1m
b250cyBkaXJlY3RvcnkuDQo+ID4gLSBSZW5hbWUgdG8gdHRmLXRha2FvLg0KPiA+IC0gVXNlIHR0
Zi5pbmMgaW5zdGVhZCBvZiByZXdyaXRlIGRvX2luc3RhbGwuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBMZWkgTWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5jb20+DQo+ID4gLS0tDQo+ID4gICAu
Li4vcGFja2FnZWdyb3Vwcy9wYWNrYWdlZ3JvdXAtbWV0YS1vZS5iYiAgICAgICAgfCAgMiArLQ0K
PiA+ICAgLi4uL3R0Zi10YWthb18wMDMuMDMuMDEuYmJ9ICAgICAgICAgICAgICAgICAgICAgIHwg
MTYNCj4gKysrKysrKysrKystLS0tLQ0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRp
b25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiA+ICAgcmVuYW1lDQo+ID4gbWV0YS1vZS9yZWNpcGVz
LWdyYXBoaWNzL3t0YWthby1mb250cy90YWthby1mb250c18wMDMuMDMuMDEuYmIgPT4NCj4gPiB0
dGYtZm9udHMvdHRmLXRha2FvXzAwMy4wMy4wMS5iYn0gKDU2JSkNCj4gPg0KPiANCj4gSSB0aGlu
ayB0aGlzIGlzIHN0aWxsIG5vdCBhIGNvbXBsZXRlIGZpeCB0aGVyZSBhcmUgbW9yZSByZWNpcGVz
IGluDQo+IG1ldGEtb3BlbmVtYmVkZGVkIHJlcG8gd2hpY2ggaGF2ZSBkaXJlY3QgZGVwZW5kZW5j
eSBvbiB0aGlzIHJlY2lwZSwgcGxlYXNlDQo+IGNoZWNrIHRob3NlIG91dCB0b28uIEkgZGlkIG1l
bnRpb24gZnVsbCBsaXN0IGluIG15IGxhc3QgbWVzc2FnZQ0KPiANCj4gPiBkaWZmIC0tZ2l0DQo+
ID4gYS9tZXRhLW9lL3JlY2lwZXMtY29yZS9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vncm91cC1tZXRh
LW9lLmJiDQo+ID4gYi9tZXRhLW9lL3JlY2lwZXMtY29yZS9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vn
cm91cC1tZXRhLW9lLmJiDQo+ID4gaW5kZXggZDQ2NDQ3ZDMzLi5iN2FiZTIxOTcgMTAwNjQ0DQo+
ID4gLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWNvcmUvcGFja2FnZWdyb3Vwcy9wYWNrYWdlZ3JvdXAt
bWV0YS1vZS5iYg0KPiA+ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1jb3JlL3BhY2thZ2Vncm91cHMv
cGFja2FnZWdyb3VwLW1ldGEtb2UuYmINCj4gPiBAQCAtNDkzLDcgKzQ5Myw2IEBAIFJERVBFTkRT
OnBhY2thZ2Vncm91cC1tZXRhLW9lLWdyYXBoaWNzID0iXA0KPiA+ICAgICAgIHBhY2thZ2Vncm91
cC1mb250cy10cnVldHlwZSBcDQo+ID4gICAgICAgcXJlbmNvZGUgXA0KPiA+ICAgICAgICR7QGJi
LnV0aWxzLmNvbnRhaW5zKCJESVNUUk9fRkVBVFVSRVMiLCAieDExIiwgInN0IiwgIiIsIGQpfSBc
DQo+ID4gLSAgICB0YWthby1mb250cyBcDQo+ID4gICAgICAgbGVwdG9uaWNhIFwNCj4gPiAgICAg
ICBsaWJ2bmNzZXJ2ZXIgXA0KPiA+ICAgICAgIGxpYm1uZyBcDQo+ID4gQEAgLTUzNyw2ICs1MzYs
NyBAQCBSREVQRU5EUzpwYWNrYWdlZ3JvdXAtbWV0YS1vZS1ncmFwaGljcyA9IlwNCj4gPiAgICAg
ICB0dGYtbm90by1lbW9qaS1yZWd1bGFyIFwNCj4gPiAgICAgICB0dGYtc2F6YW5hbWktZ290aGlj
IFwNCj4gPiAgICAgICB0dGYtc2F6YW5hbWktbWluY2hvIFwNCj4gPiArICAgIHR0Zi10YWthby1w
Z290aGljIHR0Zi10YWthby1nb3RoaWMgdHRmLXRha2FvLXBtaW5jaG8NCj4gPiArIHR0Zi10YWth
by1taW5jaG8gXA0KPiA+ICAgICAgIHR0Zi10bHdnIFwNCj4gPiAgICAgICB0dGYtcm9ib3RvIFwN
Cj4gPiAgICAgICB0dGYtd3F5LXplbmhlaSBcDQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvbWV0YS1v
ZS9yZWNpcGVzLWdyYXBoaWNzL3Rha2FvLWZvbnRzL3Rha2FvLWZvbnRzXzAwMy4wMy4wMS5iYg0K
PiA+IGIvbWV0YS1vZS9yZWNpcGVzLWdyYXBoaWNzL3R0Zi1mb250cy90dGYtdGFrYW9fMDAzLjAz
LjAxLmJiDQo+ID4gc2ltaWxhcml0eSBpbmRleCA1NiUNCj4gPiByZW5hbWUgZnJvbQ0KPiA+IG1l
dGEtb2UvcmVjaXBlcy1ncmFwaGljcy90YWthby1mb250cy90YWthby1mb250c18wMDMuMDMuMDEu
YmINCj4gPiByZW5hbWUgdG8gbWV0YS1vZS9yZWNpcGVzLWdyYXBoaWNzL3R0Zi1mb250cy90dGYt
dGFrYW9fMDAzLjAzLjAxLmJiDQo+ID4gaW5kZXggOWRkZmM2YWU3Li5iZTBlNTQ0Y2MgMTAwNjQ0
DQo+ID4gLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWdyYXBoaWNzL3Rha2FvLWZvbnRzL3Rha2FvLWZv
bnRzXzAwMy4wMy4wMS5iYg0KPiA+ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy90dGYt
Zm9udHMvdHRmLXRha2FvXzAwMy4wMy4wMS5iYg0KPiA+IEBAIC0xLDMgKzEsNSBAQA0KPiA+ICty
ZXF1aXJlIHR0Zi5pbmMNCj4gPiArDQo+ID4gICBTVU1NQVJZID0gIlRha2FvIEZvbnRzIGFyZSBh
IGNvbW11bml0eSBkZXZlbG9wZWQgZGVyaXZhdGl2ZXMgb2YgSVBBDQo+IEZvbnRzLiINCj4gPiAg
IERFU0NSSVBUSU9OID0gIlRha2FvIEZvbnRzIGFyZSBhIGNvbW11bml0eSBkZXZlbG9wZWQgZGVy
aXZhdGl2ZXMgb2YgSVBBDQo+IEZvbnRzLiINCj4gPg0KPiA+IEBAIC02LDE0ICs4LDE4IEBAIFNF
Q1RJT04gPSAiVXNlciBJbnRlcmZhY2UvWCINCj4gPg0KPiA+ICAgTElDRU5TRSA9ICJJUEEiDQo+
ID4gICBMSUNfRklMRVNfQ0hLU1VNID0NCj4gImZpbGU6Ly9JUEFfRm9udF9MaWNlbnNlX0FncmVl
bWVudF92MS4wLnR4dDttZDU9NmNkMzM1MWJhOTc5Y2Y5ZGIxZmFkNjQ0DQo+IGU4MjIxMjc2Ig0K
PiA+ICsNCj4gPiAgIFNSQ19VUkkgPQ0KPiAiaHR0cHM6Ly9sYXVuY2hwYWQubmV0LyR7QlBOfS90
cnVuay8xNS4wMy8rZG93bmxvYWQvVGFrYW9Gb250c18wMDMwMy4wMS50DQo+IGFyLnh6Ig0KPiA+
IC1TUkNfVVJJW21kNXN1bV0gPSAiOGNkM2ZlNzI0ZmFhNTAzNGE5MzY5ZTk4Y2YxMDhkMmQiDQo+
ID4gICBTUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAiZTk4NzFmNzJhYzY5YWNiM2UyNzdhZWJiZWU3
Y2EwMWZiZWJmNTQ4MDA3MzNlMjlmYWZkYzQ2MTMzZmMzNTUyZiINCj4gPg0KPiA+ICAgUyA9ICIk
e1dPUktESVJ9L1Rha2FvRm9udHNfMDAzMDMuMDEiDQo+ID4gLWRvX2luc3RhbGwoKSB7DQo+ID4g
LSAgICBpbnN0YWxsIC1tIDA3NTUgLWQgJHtEfS8ke2RhdGFkaXJ9L2ZvbnRzDQo+ID4gLSAgICBp
bnN0YWxsIC1tIDA2NDQgLXAgJHtTfS8qLnR0ZiAke0R9LyR7ZGF0YWRpcn0vZm9udHMvDQo+ID4g
LX0NCj4gPiArDQo+ID4gK1BBQ0tBR0VTID0gInR0Zi10YWthby1wZ290aGljIHR0Zi10YWthby1n
b3RoaWMgdHRmLXRha2FvLXBtaW5jaG8NCj4gdHRmLXRha2FvLW1pbmNobyINCj4gPiArRk9OVF9Q
QUNLQUdFUyA9ICJ0dGYtdGFrYW8tcGdvdGhpYyB0dGYtdGFrYW8tZ290aGljIHR0Zi10YWthby1w
bWluY2hvDQo+IHR0Zi10YWthby1taW5jaG8iDQo+ID4gKw0KPiA+ICtGSUxFUzp0dGYtdGFrYW8t
cGdvdGhpYyA9ICIke2RhdGFkaXJ9L2ZvbnRzL3RydWV0eXBlL1Rha2FvUEdvdGhpYy50dGYiDQo+
ID4gK0ZJTEVTOnR0Zi10YWthby1nb3RoaWMgPSAiJHtkYXRhZGlyfS9mb250cy90cnVldHlwZS9U
YWthb0dvdGhpYy50dGYiDQo+ID4gK0ZJTEVTOnR0Zi10YWthby1wbWluY2hvID0gIiR7ZGF0YWRp
cn0vZm9udHMvdHJ1ZXR5cGUvVGFrYW9QTWluY2hvLnR0ZiINCj4gPiArRklMRVM6dHRmLXRha2Fv
LW1pbmNobyA9ICIke2RhdGFkaXJ9L2ZvbnRzL3RydWV0eXBlL1Rha2FvTWluY2hvLnR0ZiINCj4g
Pg0KPiA+ICAgRklMRVM6JHtQTn0gKz0gIiR7ZGF0YWRpcn0vZm9udHMvKi50dGYiDQo+ID4NCj4g
Pg0KPiA+DQo+ID4gDQo+ID4NCg==
