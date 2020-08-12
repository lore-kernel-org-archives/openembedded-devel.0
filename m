Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.40])
 by mx.groups.io with SMTP id smtpd.web11.17586.1597246889674865184
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 08:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mF7tktyp;
 spf=pass (domain: windriver.com, ip: 40.107.236.40, mailfrom: joe.slater@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XptZQv12g5IgwJuWzyMorojRUG/IBmwrgu0+VpdTmwzvffkeqmDWqrxigSA40IZsW7wsOU8xABeOJF3hyA+spvmLkfdc42Ktrlz3m+wkxarlfdI51QNujtErKKiRUxRrm9k4NgOjmSSo+nnl8rurMhOUMK3z4Mf8Pd+LQEW7HS22VG/fsrQwaoOYIpfXR2B0KbdYAqHIRutOuCROrrLle+gu5wWdefU6R7VyO26Z2U3f4d3ZFNRztRDee3Pn5M65ngXXtcn5JtqfCquGelFqFY2+t0fnnJu2ZskuBcEhP+tEY2NH3q1OsZF7WUy59r5Kx4VPHEE2rSsxD21+Z2ik7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3obgsNfgjSaKp9HkX/yQENGbMPhYOBQkZ/o8BqxabYU=;
 b=df530lPk+pKUIJatd0WUxqNR/hl1YEueFkngkw9JN09Z5Fcvz4rIZJcTKweTWhrmc7p+lig7aa/lnNIUfEpO2uhXV52hPqIhRQ3I7QljeF9s4w3/gGNTa40r5ikKJf8wnk7giUzyG8nPMh9pKMEwnDK+FE6v54CLJ1qvZ6XX4r/yDkUquJ98oPeQLF9Qc1V4t35/braa5ERf9yuA4jJCn33dXYepwJi+l3ALQBrLvWp+qqO16uGzd5G0fdrxJi/P9L/ebbVH5d/hjrpkvyiHVpclL4f6xtmEj0W8sKbE3f7FNJhAnHVw+lWP/WQTxT5iQmSghwxjk4m4L27J+zPQ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3obgsNfgjSaKp9HkX/yQENGbMPhYOBQkZ/o8BqxabYU=;
 b=mF7tktyp0tjSwIXJ/FNxk7TEf/0XqGrz+Awc2zqgbMu+s/oPRrt50rQ+7i8RmTsyzAGokmc6R1WtCZQH/Hht4O8EfIZboSLIkA4KJSufDDmy5ml7LEr/HO4VTENXvNUE7UBchB24m1QID/OmWZoilB9Q54QtQyYJFhnIwMJIlTw=
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BYAPR11MB3590.namprd11.prod.outlook.com (2603:10b6:a03:b2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Wed, 12 Aug
 2020 15:41:27 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::d93e:4c0f:e4a9:dfc6]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::d93e:4c0f:e4a9:dfc6%2]) with mapi id 15.20.3261.025; Wed, 12 Aug 2020
 15:41:27 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>, "MacLeod,
 Randy" <Randy.MacLeod@windriver.com>
Subject: Re: [oe] [meta-oe][PATCH 1/1] mozjs: specify TMPDIR
Thread-Topic: [oe] [meta-oe][PATCH 1/1] mozjs: specify TMPDIR
Thread-Index: AQHWcCK8NS873I7fsE+rSnL7CTHG0akzhy+AgAEOoQA=
Date: Wed, 12 Aug 2020 15:41:26 +0000
Message-ID: 
 <BY5PR11MB399200D5752C7637C2CF603588420@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <20200811210229.93989-1-joe.slater@windriver.com>
 <CAMKF1sqUt6+-5AhPB1j8LtQgY0=gjAm4jNoXEx5txCChr0xzMQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqUt6+-5AhPB1j8LtQgY0=gjAm4jNoXEx5txCChr0xzMQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
x-originating-ip: [24.4.218.114]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73006297-1646-45ee-7e74-08d83ed62cf4
x-ms-traffictypediagnostic: BYAPR11MB3590:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BYAPR11MB3590AD3F6AB5D1800590EED888420@BYAPR11MB3590.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xRCSq0FptWLwS3OKSTG/a9JHRSpWlmSHqyDu0CLjqAdF5QSUMkP/o7NHvBVkXRhx74wC40oiHtqvkzFI4ZUkzdUJMlFkZBSFjeIfOv9WaitSMJJyw6MA83JodD48qegmGQIS8j2+9nyvzsrQTIi1Au7cltuW0k/30AmJG3cPbRmLqCkom6v5fDPQ5adc0nwThq2BvoO0MH6z3Zl1LejMjPYPKxrDRsErqZvkD7tkHnqHz3iYdDooUd2fG7s1Vb5OCRtVSerQr2YoxJfLFA1lf3Wdupj5TJJfGg+zchKwtKqjXsKOdyFpux9T20hLZg/9s7CLkKrbCG/o2wnfuyjeD6a5C6UOlVfVS8/uIHt7C0bQMllAklLwB2fJHPY5JQYzRJxZl3pj9Z7nYn4s6Ugczg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(396003)(136003)(346002)(376002)(366004)(8936002)(8676002)(316002)(107886003)(33656002)(6506007)(9686003)(53546011)(26005)(71200400001)(7696005)(186003)(55016002)(6916009)(54906003)(966005)(64756008)(76116006)(478600001)(83380400001)(66446008)(66556008)(66946007)(52536014)(5660300002)(66476007)(4326008)(86362001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 xMzGhDzSelt8S46x/VOnwePK0yF3z265r1YXuiT/tegNcTpk9SF5DKSxyfqngkGFdtCfjFGG5RV+2PGeqaJNA/eMb18AP+XoL8S18owu7yi2F4CVrDYvJBeEe5w4/r1W2YlEX2DzeA5/MZUmRedEGwrrSPF1A5LEaAxZPtpo3x5GtqhFy5IWAmMFt0zAF+8l1jtgPElaQy+pxnW3ZqiONaDJ3PwwNrFDu6r9ZshzjriafsmOOPTrRmARZr3YS7gxvUbxZWKjaPUWRzm44v06pEgxlKLWwNNZaiX9D5S3rMcyvsv3UsKaCtPdp/TJrr8kOBPHoPQbRIeRr9SYbcnGosTZ+hLa61Gu55XpMNYItbrH19hxRCZUAZ7PTQ5GaBu6yPoqV4GBMsPyUl4YkDJKKkuDTvBzoLqAisPc0AeOIiQrlwu4bwlXVXneJT8Qp+XBHxWov2EX6DrAzYg/+BSk9CCs4b3HMgdMr+1TInFxp4GeX3QQacG3gibbhEGOUZiulrfhbW0wuao06sXW+uiDL26eIarD+A3AuiW229jDab1DZrkdYo7JgbdR9TjdF0jgpSMXuJI607YDjqiZuzKatBfR1HeQCQ8ImPEEsvPJlcf49XOGI3WhUErPnBrVaf6OC6Dh6h/DNquq3krsd/T6Xg==
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73006297-1646-45ee-7e74-08d83ed62cf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2020 15:41:26.9879
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7n/d170lev60E4OVe+q3dl2HHMthO4HQpNMBU7vlSgs5CLMLmGBcFz7/woa/ougjfoshEv00BlXloSJRhX7hHx4VHBcvTLD3aVJw3RxYUHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3590
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIHN5bXB0b20gc2VlbXMgdG8gYmUgdGhhdCBzb21ldGltZXMsIHdoZW4gYSBsb3Qgb2Ygc2lt
aWxhciB0ZW1wZmlsZXMgYXJlIGNyZWF0ZWQgdW5kZXIgL3RtcCwgYSBmaWxlIHdpbGwgYmUgY3Jl
YXRlZCB0aGF0IGNhbm5vdCBiZSByZWFkIG9uY2UgdGhlIG9yaWdpbmFsIGZkIGlzIGNsb3NlZC4g
IE1vdmluZyB3aGVyZSB0aGVzZSBmaWxlcyBhcmUgY3JlYXRlZCBtaWdodCBhdm9pZCBzb21lIHVu
ZGVybHlpbmcgcHJvYmxlbSwgYnV0IGl0IGFsc28gbWlnaHQganVzdCByZWR1Y2UgdGhlIGZhaWx1
cmUgcmF0ZSB0byBzb21ldGhpbmcgc28gbG93IHRoYXQgeW91IG5ldmVyIHNlZSBpdC4NClRoZXJl
IHNob3VsZCBwcm9iYWJseSBiZSBtb3JlIGludmVzdGlnYXRpb24gaW50byB3aGF0IGlzIGdvaW5n
IG9uLCBidXQgaXQgaXMgaGFyZCB0byBwdXQgbXVjaCBlZmZvcnQgaW50byBkZWFsaW5nIHdpdGgg
c29tZXRoaW5nIHRoYXQgKHVzdWFsbHkpIG9jY3VycyB2ZXJ5IHJhcmVseSBhbmQgaXMgZWFzaWx5
IGF2b2lkZWQuDQoNCkpvZQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogS2hl
bSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4gDQpTZW50OiBUdWVzZGF5LCBBdWd1c3QgMTEsIDIw
MjAgNDowNCBQTQ0KVG86IFNsYXRlciwgSm9zZXBoIDxqb2Uuc2xhdGVyQHdpbmRyaXZlci5jb20+
DQpDYzogb3BlbmVtYmVkZWQtZGV2ZWwgPG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPjsgTWFjTGVvZCwgUmFuZHkgPFJhbmR5Lk1hY0xlb2RAd2luZHJpdmVyLmNvbT4N
ClN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLW9lXVtQQVRDSCAxLzFdIG1vempzOiBzcGVjaWZ5IFRN
UERJUg0KDQpPbiBUdWUsIEF1ZyAxMSwgMjAyMCBhdCAyOjAyIFBNIEpvZSBTbGF0ZXIgPGpvZS5z
bGF0ZXJAd2luZHJpdmVyLmNvbT4gd3JvdGU6DQo+DQo+IEFsdGhvdWdoIGl0IGlzIGV4dHJlbWVs
eSByYXJlIHRoZSBmb2xsb3dpbmcgdHlwZSBvZiBlcnJvciBjYW4gb2NjdXIgDQo+IGR1cmluZyBj
b25maWd1cmF0aW9uOg0KPg0KPiBDcmVhdGluZyBgL3RtcC9jb25mdGVzdC5pNTNjbG00ei5jcHBg
IHdpdGggY29udGVudDoNCj4gLi4uDQo+IHg4Nl82NC13cnMtbGludXgtZysrOiBlcnJvcjogL3Rt
cC9jb25mdGVzdC5pNTNjbG00ei5jcHA6IE5vIHN1Y2ggZmlsZSANCj4gb3IgZGlyZWN0b3J5DQo+
IHg4Nl82NC13cnMtbGludXgtZysrOiBlcnJvcjogL3RtcC9jb25mdGVzdC5pNTNjbG00ei5jcHA6
IE5vIHN1Y2ggZmlsZSANCj4gb3IgZGlyZWN0b3J5DQo+IHg4Nl82NC13cnMtbGludXgtZysrOiBm
YXRhbCBlcnJvcjogbm8gaW5wdXQgZmlsZXMNCj4NCj4gU28sIHNwZWNpZnkgYSBsb2NhbCBkaXJl
Y3RvcnkgYXMgVE1QRElSIGR1cmluZyBjb25maWd1cmF0aW9uLg0KDQpEbyB3ZSBrbm93IHRoZSBy
ZWFsIHVuZGVybHlpbmcgaXNzdWUgPyBpdCdzIG5vdCBjbGVhciB0byBtZSBmcm9tIGRlc2NyaXB0
aW9uDQoNCi90bXAgaXMgYWx3YXlzIG1vdW50ZWQgb24gbGludXggYnVpbGQgc3lzdGVtcyBzbyBJ
IGFtIGFzc3VtaW5nIGl0cyBoaXR0aW5nIHNvbWUgc29ydCBvZiByYWNlIGNvbmRpdGlvbiBzaW5j
ZSAvdG1wIGlzIG1vdW50ZWQgdXNpbmcgdG1wZnMgaXQgbWlnaHQgYmUgbW9yZSBldmlkZW50IHNp
bmNlIGl0cyBmYXN0ZXIgd2hlcmVhcyB3aGVuIGl0cyBwb2ludGluZyB0byBjdXN0b20gZGlyIG9u
IEhERCBpdHMgaGlkaW5nIHRoZSB1bmRlcmx5aW5nIGlzc3VlLg0KDQpJT1cgaG93IGlzIHRoZSBw
cm9ibGVtIG1hbmlmZXN0ZWQgYW5kIGhvdyBpcyB0aGlzIHBhdGNoIGhlbHBpbmcgPw0KDQo+DQo+
IFNpZ25lZC1vZmYtYnk6IEpvZSBTbGF0ZXIgPGpvZS5zbGF0ZXJAd2luZHJpdmVyLmNvbT4NCj4g
LS0tDQo+ICAuLi4vZHluYW1pYy1sYXllcnMvbWV0YS1weXRob24vcmVjaXBlcy1leHRlbmRlZC9t
b3pqcy9tb3pqc182MC45LjAuYmIgDQo+IHwgNCArKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgDQo+IGEvbWV0YS1v
ZS9keW5hbWljLWxheWVycy9tZXRhLXB5dGhvbi9yZWNpcGVzLWV4dGVuZGVkL21vempzL21vempz
XzYwLjkNCj4gLjAuYmIgDQo+IGIvbWV0YS1vZS9keW5hbWljLWxheWVycy9tZXRhLXB5dGhvbi9y
ZWNpcGVzLWV4dGVuZGVkL21vempzL21vempzXzYwLjkNCj4gLjAuYmINCj4gaW5kZXggZjEzYTE4
NC4uNjI5YzY1MiAxMDA2NDQNCj4gLS0tIA0KPiBhL21ldGEtb2UvZHluYW1pYy1sYXllcnMvbWV0
YS1weXRob24vcmVjaXBlcy1leHRlbmRlZC9tb3pqcy9tb3pqc182MC45DQo+IC4wLmJiDQo+ICsr
KyBiL21ldGEtb2UvZHluYW1pYy1sYXllcnMvbWV0YS1weXRob24vcmVjaXBlcy1leHRlbmRlZC9t
b3pqcy9tb3pqc18NCj4gKysrIDYwLjkuMC5iYg0KPiBAQCAtMTAwLDcgKzEwMCw5IEBAIGRvX2Nv
bmZpZ3VyZSgpIHsNCj4gICAgICBhdXRvY29uZjIxMyAtLW1hY3JvZGlyPSR7U1RBR0lOR19EQVRB
RElSX05BVElWRX0vYXV0b2NvbmYyMTMgDQo+IG9sZC1jb25maWd1cmUuaW4gPiBvbGQtY29uZmln
dXJlDQo+DQo+ICAgICAgY2QgJHtCfQ0KPiAtICAgICR7U30vanMvc3JjL2NvbmZpZ3VyZSAke0VY
VFJBX09FQ09ORn0NCj4gKyAgICAjIHVzZSBvZiAvdG1wIGNhbiBjYXVzZXMgcHJvYmxlbXMgb24g
aGVhdmlseSBsb2FkZWQgaG9zdHMNCj4gKyAgICBta2RpciAtcCAiJHtCfS9sY2xfdG1wIg0KPiAr
ICAgIFRNUERJUj0iJHtCfS9sY2xfdG1wIiAgJHtTfS9qcy9zcmMvY29uZmlndXJlICR7RVhUUkFf
T0VDT05GfQ0KPg0KPiAgICAgICMgTWFrZSBzdGFuZGFyZCBNYWtlZmlsZSBjaGVja3MgcGFzcw0K
PiAgICAgIHRvdWNoICR7U30vanMvc3JjL2NvbmZpZ3VyZQ0KPiAtLQ0KPiAyLjcuNA0KPg0KPiAN
Cg==
