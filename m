Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.76])
 by mx.groups.io with SMTP id smtpd.web11.13405.1600223115754878886
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 19:25:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Igm0+ReZ;
 spf=pass (domain: windriver.com, ip: 40.107.237.76, mailfrom: haiqing.bai@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mtQ5AONxNvoQ1vZDuuGDVGG3OSH28NifV/bqBqREe4RfS7taSY8wSgNSu4EUJxpowiNOqw/rmmES4vgHvn3BTvisnsfxD8kufM/BxWrvb7H1L0VL3umA+S5b69C7RZptIeAatBRD9jCBUCO9cbO6C/c2psHyyNLmQD+PJT3+fLungf1f7LJmBEfrM6ezCTIadJRHney1oyr66yBFFUjOn2oltHtw7MqNcKmbLy88O/8lpBor20NQMWRJURm24lTpwPe2tCiXdZRXBpXy0qb94EHYoFOZ085zcmK/muQrrXOVyh7Aa1XZk+UmMtF/hvHGprrQAODKrYKorq7bVe5nAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9T6/FyGwqi3XpsdMvL4bZP1c2xtKbRMlPKf8CVmgMmk=;
 b=Q0PAa090odEndGcHK4ytY33Q6sk8CzfbkP33f2A1ChZRofGPaLCs7rrZ04F3WTikwuAo8ea/ucBSDlKrz6kTA6QXOEzkFGoXJP+PZ/QGZ+5+qFWemyOh4xZuvQBi39VTBRiXM7T27CjFoxwxFXVSh4cLZjqkyEHlWorbdeRDlQhXeOSlDN2r6EVXEwvRt4o0QYM1/v5ILv24s/2BuvH4uVnClxtnvU8loAgO9QXkrUkuBKFdzcrMoxBRlArudlqLPsuwcpgTi6xE1RgJz6eF7ejGyo3mRAJLBBq+1QzjzZnFa4LPZIDrx6JZAl1zSVDMid/dTWasky0ArV1VcSlU1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9T6/FyGwqi3XpsdMvL4bZP1c2xtKbRMlPKf8CVmgMmk=;
 b=Igm0+ReZC730KaujCc6TfmfT40tTV+5ROEpJlyUkJb4CbIJPWFKZGMPAfbygKTdxF3IAMPKQoeUeUSuYC45k/PO2kprHzHB2CJuhPJDspTzvzzgQXK1VP53uvUlBosTeXuWJqHy0WF+UbG9sPxfN46XliAomRWc7CoZ2tFmGxEg=
Received: from BN7PR11MB2561.namprd11.prod.outlook.com (2603:10b6:406:af::33)
 by BN8PR11MB3698.namprd11.prod.outlook.com (2603:10b6:408:8a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Wed, 16 Sep
 2020 02:25:12 +0000
Received: from BN7PR11MB2561.namprd11.prod.outlook.com
 ([fe80::9d34:9a2:3755:4bff]) by BN7PR11MB2561.namprd11.prod.outlook.com
 ([fe80::9d34:9a2:3755:4bff%5]) with mapi id 15.20.3370.019; Wed, 16 Sep 2020
 02:25:12 +0000
From: "haiqing" <haiqing.bai@windriver.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-oe][zeus][PATCH] rsyslog: fix wrong option of PACKAGECONFIG[valgrind]
Thread-Topic: [oe][meta-oe][zeus][PATCH] rsyslog: fix wrong option of
 PACKAGECONFIG[valgrind]
Thread-Index: AQHWi0Fd4Tu8IffsXk+XMqGjLA+svalp4E0AgACqF/A=
Date: Wed, 16 Sep 2020 02:25:11 +0000
Message-ID: 
 <BN7PR11MB2561A0CDB61F1AA97419E519EE210@BN7PR11MB2561.namprd11.prod.outlook.com>
References: <20200915091850.215655-1-Haiqing.Bai@windriver.com>
 <28f8f9cc-985e-f457-8d2e-99c62147f264@gmail.com>
In-Reply-To: <28f8f9cc-985e-f457-8d2e-99c62147f264@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
x-originating-ip: [60.247.85.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af18dcb8-a174-42c8-578e-08d859e7bd48
x-ms-traffictypediagnostic: BN8PR11MB3698:
x-microsoft-antispam-prvs: 
 <BN8PR11MB369882D31DDE06CE646C8C0AEE210@BN8PR11MB3698.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 VymKIyscciX27d5Cq9TmRQo4MRkdVz9SYI95T2wnoHZbg9ZXZqn0Qi3O9+y2Aok0+WuAs4Zs1bVWdu0j5W12LXbEUnKg5qEEiQi8V3prqs3dQ11IzrZSVLC1b7XnutCu++q1DHNbFiaV+nrvd4khyM1b4WtAJh4UlV4x7eys3mpB2fLNXWjHwczflWI/dpjI5LrsyAvsaqUVji2maRkh0wSCJ8OEKx1gZK10J3cApAPMmi381EEjEuZF+iKzf9onYhqW8W5JyXY01/lziB25pWNr1mIhOeKpWQC0wov2oo4Z0ZctUb5gfDV+uGs4dm6M3JWWAH0DYADXGmC34ZVF7hc6pTKZ9eklUFGwUNBIKOTdoM3P/YZjCHFB8Lw24inO
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR11MB2561.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(396003)(136003)(39850400004)(316002)(86362001)(5660300002)(52536014)(66946007)(76116006)(7696005)(8676002)(55016002)(110136005)(66446008)(64756008)(66476007)(66556008)(71200400001)(9686003)(478600001)(53546011)(8936002)(6506007)(2906002)(186003)(26005)(83380400001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 CRYMjm0gDyNBnPCcqn4R6JmJdx4UGGQrc1P3/wHxaILqtOdD4byjwi9f+oGFaEtkhZSKLemUHZIyjnFRQStmob8OOUydaCr+e5J+vGBpChe5H2zFOm6LLAtt4BhrMm5yLAD7ElCwaor07NVaJgPj13J8wUcwL4mUWz73mivXAac8MIz63s9viNhjfdAdX9f7CGAMXyzbOJLPCfULB0oaABpn+wW+V2vi4Ay6XJ8QLLfAUILVRyP3Umo4/rX7OTzUhB2FUKg8C9RIc+VAn9vcW+7w7xqbmdFCkgEBGVD2H2kenK65RH/pf8PowzmgHch0syAw3Qm9MWyvTwAeVetsuTZYwRH/ijYVQqREjPdyJ/xgH6xAAd8o9kZldWZQ2hTwcTztXC69DW7Mr1Fh17C7H7S4dgEm5ONkEv1QG0yqiWLAARmvsgAceJ2T66+NOfuObr/nf0Vxh8NCneNhBxilGFBZEUZwytzcbpXGNGVULxnHZyxk/VV+arJ/yARCI/PzFwEb6KuRjgllZlJ1ORkTWk6tAmHyuWMO/dRFvvesPW8IriMDaEC9UHv3nP8BkPpeTklzMnUQDA/W/QwtNzat6lV25EUwGhgaOEZ8xNVQGNymOgKOpsek1tQs8Dep7jEKyBcOGEjlscxB8BzYYnV8FQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2561.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af18dcb8-a174-42c8-578e-08d859e7bd48
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2020 02:25:11.9758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aHmm2aXBRFgy2pvdg1yjdSX7wuzMpdQqaysyDyzLnfAVQaJAbmf+eJO3YbEtMPFB0l0JiCRSLiSGKNnuA6eyOJm8lStoDF3+paoW9iC9/JM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3698
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WWVzLCAgbWFzdGVyIGFsc28gbmVlZCB0aGlzIGFuZCB0aGUgcGF0Y2ggY2FuIGJlIGFwcGxpZWQg
b24gbWFzdGVyLiAgVGhhbmtzLiAgDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9t
OiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVk
LWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBLaGVtIFJhag0KU2Vu
dDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMTYsIDIwMjAgMTI6MTUgQU0NClRvOiBCYWksIEhhaXFp
bmcgPEhhaXFpbmcuQmFpQHdpbmRyaXZlci5jb20+OyBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtvZV1bbWV0YS1vZV1bemV1c11bUEFUQ0hd
IHJzeXNsb2c6IGZpeCB3cm9uZyBvcHRpb24gb2YgUEFDS0FHRUNPTkZJR1t2YWxncmluZF0NCg0K
dGhpcyBzZWVtcyB0byBiZSBhcHBsaWNhYmxlIG9uIG1hc3RlciBhcyB3ZWxsLiBDYW4geW91IGNo
ZWNrIGlmIHdlIG5lZWQgaXQgb24gbWFzdGVyLg0KDQpPbiA5LzE1LzIwIDI6MTggQU0sIGhhaXFp
bmcgd3JvdGU6DQo+IFRoZSBzb3VyY2UgY29uZmlndXJlLmFjIHNob3dzOg0KPiAtLWVuYWJsZS12
YWxncmluZDogRW5hYmxlIHNvbWVzIHNwZWNpYWwgY29kZSB0aGF0IHJzeXNsb2cgY29yZSBkZXZl
bG9wZXJzDQo+ICAgICAgICAgICAgICAgICAgICAgY29uc2lkZXIgdXNlZnVsIGZvciB0ZXN0aW5n
LkRvIE5PVCB1c2UgaWYgeW91IGRvbid0DQo+ICAgICAgICAgICAgICAgICAgICAgZXhhY3RseSBr
bm93IHdoYXQgeW91IGFyZSBkb2luZywgZXhjZXB0IGlmIHRvbGQgc28NCj4gICAgICAgICAgICAg
ICAgICAgICBieSByc3lzbG9nIGRldmVsb3BlcnMuDQo+ICAgICAgICAgICAgICAgICAgICAgTk9U
IHRvIGJlIHVzZWQgYnkgZGlzdHJvIG1haW50YWluZXJzIGZvciBidWlsZGluZyByZWd1bGFyDQo+
ICAgICAgICAgICAgICAgICAgICAgcGFja2FnZXMuDQo+IA0KPiAtLXdpdGhvdXQtdmFsZ3JpbmQt
dGVzdGJlbmNoOg0KPiAgICAgICAgICAgICAgICAgICAgIERvbid0IHVzZSB2YWxncmluZCBpbiB0
ZXN0YmVuY2gNCj4gDQo+IFBBQ0tBR0VDT05GSUdbdmFsZ3JpbmRdIHNob3VsZCB1c2UgJy0td2l0
aG91dC12YWxncmluZC10ZXN0YmVuY2gnDQo+IEFuZCBhZnRlciB0aGlzIGZpeCwgdGhlIGNvZGUg
d2hpY2ggcmVtb3ZlcyB0aGUgdmFsZ3JpbmQgZGVwZW5kZWQgcHRlc3QgDQo+IGNhc2VzIGZvciBh
cm0sbWlwcyBpcyBubyBsb25nZXIgbmVlZGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSGFpcWlu
ZyBCYWkgPEhhaXFpbmcuQmFpQHdpbmRyaXZlci5jb20+DQo+IC0tLQ0KPiAgIG1ldGEtb2UvcmVj
aXBlcy1leHRlbmRlZC9yc3lzbG9nL3JzeXNsb2dfOC4xOTEwLjAuYmIgfCA4ICstLS0tLS0tDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9yc3lzbG9nL3JzeXNsb2dfOC4x
OTEwLjAuYmIgDQo+IGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3JzeXNsb2cvcnN5c2xvZ184
LjE5MTAuMC5iYg0KPiBpbmRleCA4Mjg3ZDJiN2YuLjViOGFmOGQzNyAxMDA2NDQNCj4gLS0tIGEv
bWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3JzeXNsb2cvcnN5c2xvZ184LjE5MTAuMC5iYg0KPiAr
KysgYi9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvcnN5c2xvZy9yc3lzbG9nXzguMTkxMC4wLmJi
DQo+IEBAIC03NCw3ICs3NCw3IEBAIFBBQ0tBR0VDT05GSUdbbXlzcWxdID0gIi0tZW5hYmxlLW15
c3FsLC0tZGlzYWJsZS1teXNxbCxteXNxbDUsIg0KPiAgIFBBQ0tBR0VDT05GSUdbcG9zdGdyZXNx
bF0gPSAiLS1lbmFibGUtcGdzcWwsLS1kaXNhYmxlLXBnc3FsLHBvc3RncmVzcWwsIg0KPiAgIFBB
Q0tBR0VDT05GSUdbbGliZGJpXSA9ICItLWVuYWJsZS1saWJkYmksLS1kaXNhYmxlLWxpYmRiaSxs
aWJkYmksIg0KPiAgIFBBQ0tBR0VDT05GSUdbbWFpbF0gPSAiLS1lbmFibGUtbWFpbCwtLWRpc2Fi
bGUtbWFpbCwsIg0KPiAtUEFDS0FHRUNPTkZJR1t2YWxncmluZF0gPSAiLS1lbmFibGUtdmFsZ3Jp
bmQsLS1kaXNhYmxlLXZhbGdyaW5kLHZhbGdyaW5kLCINCj4gK1BBQ0tBR0VDT05GSUdbdmFsZ3Jp
bmRdID0gIiwtLXdpdGhvdXQtdmFsZ3JpbmQtdGVzdGJlbmNoLHZhbGdyaW5kLCINCj4gICANCj4g
ICBURVNURElSID0gInRlc3RzIg0KPiAgIGRvX2NvbXBpbGVfcHRlc3QoKSB7DQo+IEBAIC05OCwx
MiArOTgsNiBAQCBkb19pbnN0YWxsX3B0ZXN0KCkgew0KPiAgICAgICAjIGZpeCB0aGUgYWJzX3Rv
cF9idWlsZGRpcg0KPiAgICAgICBzZWQgLWkgJ3MsXlwoYWJzX3RvcF9idWlsZGRpciA9IFwpLios
XDEke1BURVNUX1BBVEh9LywnIA0KPiAke0R9JHtQVEVTVF9QQVRIfS8ke1RFU1RESVJ9L01ha2Vm
aWxlDQo+ICAgDQo+IC0gICAgIyB2YWxncmluZCBpcyBub3QgY29tcGF0aWJsZSB3aXRoIGFybSBh
bmQgbWlwcywNCj4gLSAgICAjIHNvIHJlbW92ZSByZWxhdGVkIHRlc3QgY2FzZXMgaWYgdGhlcmUg
aXMgbm8gdmFsZ3JpbmQuDQo+IC0gICAgaWYgWyB4JHtWQUxHUklORH0gPSB4IF07IHRoZW4NCj4g
LSAgICAgICAgc2VkIC1pICcvdWRwLW1zZ3JlZHVjLS9kJyAke0R9JHtQVEVTVF9QQVRIfS8ke1RF
U1RESVJ9L01ha2VmaWxlDQo+IC0gICAgZmkNCj4gLQ0KPiAgICAgICAjIGluc3RhbGwgdGVzdC1k
cml2ZXINCj4gICAgICAgaW5zdGFsbCAtbSA2NDQgJHtTfS90ZXN0LWRyaXZlciAke0R9JHtQVEVT
VF9QQVRIfQ0KPiAgIA0KPiANCj4gDQo+IA0KPiANCg==
