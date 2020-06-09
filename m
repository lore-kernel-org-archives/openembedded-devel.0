Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.70])
 by mx.groups.io with SMTP id smtpd.web11.1076.1591681560802023790
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2020 22:46:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=k5Y5jFxD;
 spf=pass (domain: windriver.com, ip: 40.107.93.70, mailfrom: yongxin.liu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VolrsSSlXgF9VHOlpe6M7QwYxe1iPN46hrngxfDFEjf07snn69Kob2sA0dJwBpULUsFC1d7WeaNJUNBDPbtKFA3YjEboKdfUqsS2Tbcq6BQMxPMDxB8PkWEg/9LZewfedBb5D/qckYBjau6Z5SlBW/jTul2OFlRA3ij8tzYltkd2Rvb3IVvDruCvT5F9uEx49zI1Q21KNVDardYvFD1gyQ+nmvQDmlWl6SGrWCdzWzQSzBO8ogrDg9MV0DNymMkGnjjxS618ZdctEd4GQ0oFql70jJIvHIQsY/athRKRd44xRYyVJjdQtp1Vsg1LpKlKZpfgSlCxB5RxmyHWLIHFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fslvcbNEwt1/Tz31v8SXp/5EDlN10a28BMqRi8Tings=;
 b=Vkgm2nVIP3dyjzEWTtwwRkVEItYdOql+1yGPCfWY4TrnbOJB59ZFbwR3bUPU67zFgpSolw8yONoVg9jC0qFwgHm3tkfBunzgbuvA45JrQB9zJctsEWOBxnkuKMaLR+K4Qm/FMD2yhJtdJ+81UToDHs2BleYkwVO+5ak1Kmdg4CRAdtLLmMvfTvF6VqIw2YE4ilMUtyFV/zgMgrtGBPiodjsTDI2mbciEo/pUWYmb10aSFQXBgfA/OG9ursZf5Gm7rm/gEH5JsQganuBAF9UbFuhnhzTwsjat2vmbTdJLktO7u3uAJqL4Vla7j875oJqUwMHS8QC9mu435Yn+aBSFIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fslvcbNEwt1/Tz31v8SXp/5EDlN10a28BMqRi8Tings=;
 b=k5Y5jFxDl8eQy7Pkdr99VIvxgG/Pt6d5DuJDD8U6b8gavIt/IDpGLGq1eORUaq8DQsFLdlu9F8OJqdQqDQqfruNBkXw/0UBrrC2kX2uPYHgWN3Vtud4L5jEu7xhS6ryOcdlyyfw9K1rxKCF/fp8NNHZzltqHfLvTcRUG5mNAr80=
Received: from DM6PR11MB4409.namprd11.prod.outlook.com (52.132.250.158) by
 DM6PR11MB3817.namprd11.prod.outlook.com (20.178.230.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18; Tue, 9 Jun 2020 05:45:59 +0000
Received: from DM6PR11MB4409.namprd11.prod.outlook.com
 ([fe80::1def:a9ab:efd4:90dc]) by DM6PR11MB4409.namprd11.prod.outlook.com
 ([fe80::1def:a9ab:efd4:90dc%5]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 05:45:59 +0000
From: "Yongxin Liu" <yongxin.liu@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-oe][PATCH V2] intel-speed-select: Add new recipe for the tool to validate Intel SST
Thread-Topic: [oe][meta-oe][PATCH V2] intel-speed-select: Add new recipe for
 the tool to validate Intel SST
Thread-Index: AQHWPhpnc5HS2POrlUW81eqkjd+7p6jPxiRg
Date: Tue, 9 Jun 2020 05:45:59 +0000
Message-ID: 
 <DM6PR11MB44092139C8773F3B223205A7E5820@DM6PR11MB4409.namprd11.prod.outlook.com>
References: <20200608205935.14937-1-yongxin.liu@windriver.com>
 <CAMKF1spzbjoXUiTeYyiA6ZefSEh5_0QPEUBKzOkNkhcCVnD+Mg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spzbjoXUiTeYyiA6ZefSEh5_0QPEUBKzOkNkhcCVnD+Mg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
x-originating-ip: [60.247.85.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 023374ce-8ac8-41f9-523a-08d80c386305
x-ms-traffictypediagnostic: DM6PR11MB3817:
x-microsoft-antispam-prvs: 
 <DM6PR11MB3817CEC4308D12AC09B5088DE5820@DM6PR11MB3817.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 042957ACD7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 h9WNHl6dQbvxZzJPu9/IjV1MtsUAOtsSapp0zpWjY9qBjXNbKna03q+GBpF6ZjP+S7c+tAOx7c7aslEPNmQfsJ1K6CMOiGzCuqYu2Nx0ZzbEQruG/r7YC3hwIEhuarfF44kdEkpuF/mY2OjHeCIHjl5SBzm/z4LEdeq1rys7shGZPccuqME+9EhfHfVLPGXjxnAwBhoWXyX9aRzIYpwFJYIaPMANy/iEqUQNsRBx8F91DV38fEjvNVi62e0AjmIc49ApeO6xeJ9MiWwjc6GmV9UAMq352FvVzylzlkVaL4CEkq0Wr6edqIup0yKE3nzBmzxqo1yJ0yBwWTnPOeJuOQglzot5HiafAuwLpx2Cd1Lj/mYxbzTFUHkfw7X/8C4T8DyOL2Clvk6nXk1S3BM2ow==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4409.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(396003)(39850400004)(366004)(136003)(376002)(6506007)(6916009)(53546011)(86362001)(8936002)(966005)(478600001)(55016002)(8676002)(33656002)(26005)(9686003)(66556008)(5660300002)(71200400001)(15650500001)(52536014)(2906002)(66476007)(64756008)(66946007)(83380400001)(76116006)(316002)(7696005)(66446008)(186003)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 vid3njEwam+aWyUSmaFpvt11io2DANf40MRtecF+/AEa+wLI1YA6Byx/BaYrY1L54IRd7dDl0vqfACMsPXgwHLaPFvBoRTTd9jL918SrBzr/XasS3Hu2XHF4ig9v+EeDau/bKA41ivzwMgkz+i4+K5coiZBa3g3c3jzr1acQNqQN+5qLe+HEVcVLOgxlXI5RxWoBWU85jJvIZY74If09cwpk22JHWlhUrCp0mD7pvoQ8i045vLOeETzJPoHc56OWvCX8vVrd4w1oKDj3+wHF2Bj+DbPiA9fAGOYRuAXbbIakX2+aX1Rj7pGLLvx2VFNtr9ecKr+UMF19IjnwC1Ncdxv1oxl2XVQ/CIDPKY0CyeVAozqYthIH0uO2R1WdqnLvXJ5MeLjHzTMXCJ5Ug6XaLiUEyL2q0bhS4/UED1YmlaftRKnyTStNky6fSBIZcBX0li9tCJUp0+mn5gDHjBvI7QkpjNFIehvxn0rtrxZZFic=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 023374ce-8ac8-41f9-523a-08d80c386305
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2020 05:45:59.0720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TBY3ihKZ3tJNmtlIgN0IT3PNIslbLKfOFcPO4Vl6pRA0T48tKvSfY0rcIyzBjVoknfjgp5ITC015B3i2n33h0hOtvXwNOEfLRUmzgJoxx4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3817
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSB3aWxsIGFkZCAiIENPTVBBVElCTEVfSE9TVF9saWJjLW11c2wgPSAnbnVsbCcgIiBpbiBWMyB0
byBmaXggdGhpcy4NCg0KVGhhbmtzLA0KWW9uZ3hpbg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+IEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQo+IFNlbnQ6IFR1
ZXNkYXksIEp1bmUgOSwgMjAyMCAxMjo1Ng0KPiBUbzogTGl1LCBZb25neGluIDxZb25neGluLkxp
dUB3aW5kcml2ZXIuY29tPg0KPiBDYzogb3BlbmVtYmVkZWQtZGV2ZWwgPG9wZW5lbWJlZGRlZC1k
ZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KPiBTdWJqZWN0OiBSZTogW29lXVttZXRhLW9l
XVtQQVRDSCBWMl0gaW50ZWwtc3BlZWQtc2VsZWN0OiBBZGQgbmV3IHJlY2lwZQ0KPiBmb3IgdGhl
IHRvb2wgdG8gdmFsaWRhdGUgSW50ZWwgU1NUDQo+IA0KPiBmYWlscyB0byBidWlsZCBmb3IgbXVz
bA0KPiANCj4gaHR0cHM6Ly9lcnJvcnMueW9jdG9wcm9qZWN0Lm9yZy9FcnJvcnMvRGV0YWlscy80
MTU3MzEvDQo+IA0KPiBPbiBNb24sIEp1biA4LCAyMDIwIGF0IDI6MDIgUE0gWW9uZ3hpbiBMaXUg
PHlvbmd4aW4ubGl1QHdpbmRyaXZlci5jb20+DQo+IHdyb3RlOg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogWW9uZ3hpbiBMaXUgPHlvbmd4aW4ubGl1QHdpbmRyaXZlci5jb20+DQo+ID4gLS0tDQo+
ID4gIC4uLi9pbnRlbC1zcGVlZC1zZWxlY3QvaW50ZWwtc3BlZWQtc2VsZWN0LmJiICAgICAgIHwg
MjkNCj4gKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjkgaW5z
ZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBtZXRhLW9lL3JlY2lwZXMt
a2VybmVsL2ludGVsLXNwZWVkLXNlbGVjdC9pbnRlbC1zcGVlZC1zZWxlY3QuYmINCj4gPg0KPiA+
IGRpZmYgLS1naXQNCj4gPiBhL21ldGEtb2UvcmVjaXBlcy1rZXJuZWwvaW50ZWwtc3BlZWQtc2Vs
ZWN0L2ludGVsLXNwZWVkLXNlbGVjdC5iYg0KPiA+IGIvbWV0YS1vZS9yZWNpcGVzLWtlcm5lbC9p
bnRlbC1zcGVlZC1zZWxlY3QvaW50ZWwtc3BlZWQtc2VsZWN0LmJiDQo+ID4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAuLmEzNGYzNzliNA0KPiA+IC0tLSAvZGV2L251
bGwNCj4gPiArKysgYi9tZXRhLW9lL3JlY2lwZXMta2VybmVsL2ludGVsLXNwZWVkLXNlbGVjdC9p
bnRlbC1zcGVlZC1zZWxlY3QuYmINCj4gPiBAQCAtMCwwICsxLDI5IEBADQo+ID4gK1NVTU1BUlkg
PSAiQSB0b29sIHRvIHZhbGlkYXRlIEludGVsIFNwZWVkIFNlbGVjdCBjb21tYW5kcyINCj4gPiAr
DQo+ID4gK0RFU0NSSVBUSU9OID0gIlRoZSBJbnRlbCBTcGVlZCBTZWxlY3QgVGVjaG5vbG9neSAo
SW50ZWwgU1NUKSBpcyBhDQo+ID4gK3Bvd2VyZnVsIG5ldyBcIGNvbGxlY3Rpb24gb2YgZmVhdHVy
ZXMgZ2l2aW5nIHlvdSBtb3JlIGdyYW51bGFyDQo+ID4gK2NvbnRyb2wgb3ZlciBDUFUgcGVyZm9y
bWFuY2UgXCBmb3Igb3B0aW1pemVkIHRvdGFsIGNvc3Qgb2Ygb3duZXJzaGlwLiINCj4gPiArDQo+
ID4gK0xJQ0VOU0UgPSAiR1BMdjIiDQo+ID4gKw0KPiA+ICtpbmhlcml0IGtlcm5lbHNyYw0KPiA+
ICsNCj4gPiArQ09NUEFUSUJMRV9IT1NUID0gJyh4ODZfNjR8aS44NikuKi1saW51eCcNCj4gPiAr
DQo+ID4gK2RvX3BvcHVsYXRlX2xpY1tkZXBlbmRzXSArPSAidmlydHVhbC9rZXJuZWw6ZG9fcGF0
Y2giDQo+ID4gKw0KPiA+ICtCID0gIiR7V09SS0RJUn0vJHtCUE59LSR7UFZ9Ig0KPiA+ICsNCj4g
PiArRVhUUkFfT0VNQUtFID0gIi1DICR7U30vdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNl
bGVjdCBPPSR7Qn0NCj4gQ1JPU1M9JHtUQVJHRVRfUFJFRklYfSBDQz0iJHtDQ30iIExEPSIke0xE
fSIgQVI9JHtBUn0gQVJDSD0ke0FSQ0h9Ig0KPiA+ICsNCj4gPiArUEFDS0FHRV9BUkNIID0gIiR7
TUFDSElORV9BUkNIfSINCj4gPiArDQo+ID4gK2RvX2NvbmZpZ3VyZVtkZXBlbmRzXSArPSAidmly
dHVhbC9rZXJuZWw6ZG9fc2hhcmVkX3dvcmtkaXIiDQo+ID4gKw0KPiA+ICtkb19jb21waWxlKCkg
ew0KPiA+ICsgICAgICAgb2VfcnVubWFrZQ0KPiA+ICt9DQo+ID4gKw0KPiA+ICtkb19pbnN0YWxs
KCkgew0KPiA+ICsgICAgICAgb2VfcnVubWFrZSBERVNURElSPSR7RH0gaW5zdGFsbCB9DQo+ID4g
LS0NCj4gPiAyLjE0LjQNCj4gPg0KPiA+IA0K
