Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.web10.10000.1595294088285178609
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2020 18:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=J8uBpoo4;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: jpitti@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=6504; q=dns/txt; s=iport;
  t=1595294088; x=1596503688;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0AJ7blD0i7ntASHoaFLYnmqnaTKoIxErU7iNsBX+yKo=;
  b=J8uBpoo4f7hpT7ExXN2zP0jZhzHjGtHWH15zm6xoc/ejfXtmNaSRp1XH
   xS5wMgY6/XGYxX4yrSNNEummpb3dXha4Ik7eU+CKwvV4vZt90hLs7OImv
   h5xwgwA7GSVsYMrZUFHODhFrvTBSip2ISjzbZNcvsr/PuQkkgiT8EWJjP
   0=;
IronPort-PHdr: =?us-ascii?q?9a23=3AZolRCRwTseRXXGDXCy+N+z0EezQntrPoPwUc9p?=
 =?us-ascii?q?sgjfdUf7+++4j5ZRWDt/pohV7NG47c7qEMh+nXtvXmXmoNqdaEvWsZeZNBHx?=
 =?us-ascii?q?kClY0NngMmDcLEbC+zLPPjYyEgWsgXUlhj8iK0NEFUHID1YFiB6nG35CQZTx?=
 =?us-ascii?q?P4Mwc9L+/pG4nU2sKw0e36+5DabwhSwjSnZrYnJxStpgKXvc4T0oY=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CvAACxQBZf/4oNJK1gHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQFAgTgFAQELAYFRUQdvWC8shDODRgONS5hegS6BJQNVCwEBAQw?=
 =?us-ascii?q?BASMKAgQBAYRMAheCCAIkNgcOAgMBAQsBAQUBAQECAQYEbYVcAQuFcQEBAQM?=
 =?us-ascii?q?BEhERDAEBNwEPAgEIEQMBAgECAiYCAgIwFQgIAgQOBSKDBYJLAw4gAQ6hTwK?=
 =?us-ascii?q?BOYhhdoEygwEBAQWFFxiCDgkUeioBgmmDVYYzGoFBP4NsNT6CXAWBIzgYgn+?=
 =?us-ascii?q?CYI9FgxGidQqCXYhWkQ0hn0iSAYonlFgCBAIEBQIOAQEFgVoCMYFXcBWDJAl?=
 =?us-ascii?q?HFwINjh6DcYd6glx0NwIGCAEBAwl8jA+CRgEB?=
X-IronPort-AV: E=Sophos;i="5.75,377,1589241600"; 
   d="scan'208";a="804094317"
Received: from alln-core-5.cisco.com ([173.36.13.138])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 21 Jul 2020 01:14:46 +0000
Received: from XCH-ALN-001.cisco.com (xch-aln-001.cisco.com [173.36.7.11])
	by alln-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id 06L1EkMt009680
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 21 Jul 2020 01:14:46 GMT
Received: from xhs-rcd-003.cisco.com (173.37.227.248) by XCH-ALN-001.cisco.com
 (173.36.7.11) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 20 Jul
 2020 20:14:46 -0500
Received: from xhs-rcd-001.cisco.com (173.37.227.246) by xhs-rcd-003.cisco.com
 (173.37.227.248) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 20 Jul
 2020 20:14:45 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (72.163.14.9) by
 xhs-rcd-001.cisco.com (173.37.227.246) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Mon, 20 Jul 2020 20:14:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2r6aLmCYFMyz6lQY2+gd1vgPu71WpSTWBuO+qhxAEHUx6tf4rFn0Ye0ff9YwsIhsXwDk2V6mRxm9R9fkZq66CPN42SMkKZYkpjdxu3BWrUEBOCEzxyVAqPxFZjn3M2Qgp2tvljSoydIpoXYmwV1mUHvWyDL2MtlPgVBkR/tMrEbsvReGApBNsjQYIDOlyT79tuA6yRdL63Rhn6S/E+29rKKh9UKOtbLNL+IUawoOL+OJ+gPTKdyYeUddIaCKR90ZTRrQyWuAvdo6t5TsWM8Hxm+hJSK5m9KpcgJu1mx9f3qUeo0nc+d1p5q84wvIysCIHnmLyly3pPEvBbEIpbP7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0AJ7blD0i7ntASHoaFLYnmqnaTKoIxErU7iNsBX+yKo=;
 b=CQzYpN3SihWc4KrO0s3v4nrOq2/7z8tb0BLIiAUOYUttAvqQBPWO45k4L6DerLrlmeYxTEiZZgDB+sGo9NhOcW8D7whr0ihPHuAieFzo2OVasNU9JHOXbvYZT1c2a5Ns5NEw+uOb7Zq4oLBjEg9TiuZoeuTZkUL7swx824vrtkCOrlxCjreLHTO0WKh9uPuxGNp7jLp41687JYCZth0UYiJpZQHtd7ZEqYMxVlL6/Gw6J7xxpIHcaR4uY7nrCmeADWkimuRXySwUTK4QnKW20iu/szLRvbBelmDw9rVExK2IVCh3MQCbz+nJd8X+aMgw5I91esVccntjfsiurE4xzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0AJ7blD0i7ntASHoaFLYnmqnaTKoIxErU7iNsBX+yKo=;
 b=golnTImhqYJNoVzDrrCN5Of/lzOWhQaZL06nog1tJxwFZkIgQmhp1Sb+50G6aRzydP6Dj4lTn1RqgOvIA907lB6sgV9c7Nh9zmFe/De1+PnqIYfbN9bQDNXtyP9jKQchqYp20E4SWjVntkPRSjLeFkS9qujLndt8F935qN0+9HU=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BYAPR11MB2806.namprd11.prod.outlook.com (2603:10b6:a02:c7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25; Tue, 21 Jul
 2020 01:14:44 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::182e:91a7:1007:7dc6]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::182e:91a7:1007:7dc6%7]) with mapi id 15.20.3195.025; Tue, 21 Jul 2020
 01:14:44 +0000
From: "Julius Hemanth Pitti" <jpitti@cisco.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "xe-linux-external(mailer list)"
	<xe-linux-external@cisco.com>
Subject: Re: [meta-oe][PATCH] netkit-telnetd: Fix buffer overflow in netoprintf
Thread-Topic: [meta-oe][PATCH] netkit-telnetd: Fix buffer overflow in
 netoprintf
Thread-Index: AQHWXuT3/aVpNnp89E+5xd3GAY/Bg6kREeuAgAAo6gA=
Date: Tue, 21 Jul 2020 01:14:44 +0000
Message-ID: <ad4d0d2661b08a6c6a278d54a8bf5eb1af3fa3f7.camel@cisco.com>
References: <20200720221946.33011-1-jpitti@cisco.com>
	 <CAMKF1squtZehqYZADc91pDLZjT6a+QYBRive=6jed7SM5THPNQ@mail.gmail.com>
In-Reply-To: <CAMKF1squtZehqYZADc91pDLZjT6a+QYBRive=6jed7SM5THPNQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [2001:420:c0c8:1005::31b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ccc44b4b-eef4-4e9e-ac39-08d82d1373d0
x-ms-traffictypediagnostic: BYAPR11MB2806:
x-ld-processed: 5ae1af62-9505-4097-a69a-c1553ef7840e,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB2806677929A2D97F35A4BED9DA780@BYAPR11MB2806.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MPEuFHQKKr5+nflAPgFPKu86ZEoMEtLNlrOp+iHr7LqcKkWKQM++pqTR1IDYOvTaK8Px7wrFeWuOctNtmjXeIdR7lSbfAVmI1UdLwVACMAHkV/woy5iq5ZF7MpUXDao56b1uDZhJLVyWMbR/UokNS8ywo3+VkzuKqKiN/SrS2qCrUBFitx+wOFFcKLV7cE1EmvXcMCm5ntgnEAiDRMuEb0/SB+k9qsUO5JKpGGuEiduybamp/MhYfY4kEaRbzA06jIKFmmCNDbXzW/1raS6XFYUucilyXQMU+7OZAXRnraVDCYhX9dAldatD+reV6UP/nG3lCxfcTH+hdD6GuLq204iE+fKRh0d/O6/wwtRGkiYfVO9cR5Ss+fshB3UqfxlkCyNlgz+cAt7+bRYTXjzhE78EqkkirgkB/LO/U/lMO9WXPKBQbi59M+STYNmpfH1MwDtQ/KTacNxoTi9i1obLJQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4182.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(4326008)(6512007)(71200400001)(6506007)(53546011)(8676002)(8936002)(76116006)(316002)(86362001)(107886003)(6486002)(66476007)(66556008)(64756008)(66446008)(66946007)(2616005)(2906002)(36756003)(6916009)(186003)(83380400001)(478600001)(966005)(5660300002)(54906003)(99106002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: o9VAxcwUuZsba/WRWIMI4yZIXH3AiWnuitZwOksy6JHO7eitNyK4TO1gfuXC9IlUgplXr9rC39cty98G9+HixKloo6fxqOiA/H2n3ixjUUpc3bIitk/PnuoJheIf1ry+4NGa8bV9CidN+RzjNhBy2i2iFW2pnSzUqeUhmKfM9DZzQJ/Z0ZBtrfHytvVapeD0cIF+MUYxX2DrSO9dhWkqBfNwS3HaTRYATpN0RlNdLeU+Pdve8SvuEkc2VltqU/CWDtzvBI9+YP0WvZUbr4xwvirKUQ/pzbHvEI7KktBOzYysIC1r+RIYvAX5odB2nP9lO5WWKIxEgtV8O6ellnbWuMLUjnXJAdDKT3IE9evNVBc0aEU8XtCmgIvXF0KGJgsfVt9nOEn8MgRDrMeFebsZcYVcuwlCa+3zGgDS8RR6saeMztL+7DPUrEUtv40qysoaVzbt12xJrtKXoccv/LkifPWmu7fHMLKpiBGLOboBLOYtAqeeEU3IXsNEETomggtnAlpo5bcIV82aoKNgC71HJg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc44b4b-eef4-4e9e-ac39-08d82d1373d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2020 01:14:44.1960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YX8W4uXVG6WDdfj61hVY9mMiQCLaZ5/MmSw9n0SNpMo5J97+C+Gze6t3Bv6kt5CFUknuSqX8ka2uN+4b+Klghw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2806
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.11, xch-aln-001.cisco.com
X-Outbound-Node: alln-core-5.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <D72BD3E38F54B14EACFD420B92AB7278@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDIwLTA3LTIwIGF0IDE1OjQ4IC0wNzAwLCBLaGVtIFJhaiB3cm90ZToNCj4gT24g
TW9uLCBKdWwgMjAsIDIwMjAgYXQgMzoyNyBQTSBKdWxpdXMgSGVtYW50aCBQaXR0aSA8DQo+IGpw
aXR0aUBjaXNjby5jb20+IHdyb3RlOg0KPiA+IA0KPiA+IG5ldG9wcmludGYoKSB3YXMgbm90IGhh
bmRsaW5nIGEgY2FzZSB3aGVyZQ0KPiA+IHJldHVybiB2YWx1ZSBvZiB2c25wcmludGYgaXMgZ3Jl
YXRlciB0aGFuDQo+ID4gInNpemUiKDJuZCBhcmd1bWVudCksIHJlc3VsdHMgaW4gYnVmZmVyIG92
ZXJmbG93DQo+ID4gd2hpbGUgYWRqdXN0aW5nICJuZnJvbnRwIiBwb2ludGVyIHRvIHBvaW50DQo+
ID4gYmV5b25kICJuZXRvYnVmIiBidWZmZXIuDQo+ID4gDQo+ID4gSGVyZSBpcyBvbmUgc3VjaCBj
YXNlIHdoZXJlICJuZnJvbnRwIg0KPiA+IGNyb3NzZWQgYm91bmRhcmllcyBvZiAibmV0b2J1ZiIs
IGFuZA0KPiA+IHBvaW50aW5nIHRvIGFub3RoZXIgZ2xvYmFsIHZhcmlhYmxlLg0KPiA+IA0KPiA+
IChnZGIpIHAgJm5ldG9idWZbODI1NV0NCj4gPiAkNSA9IDB4NTVjOTNhZmU4YjFmIDxuZXRvYnVm
KzgyNTU+ICIiDQo+ID4gKGdkYikgcCBuZnJvbnRwDQo+ID4gJDYgPSAweDU1YzkzYWZlOGMyMCA8
dGVybWluYWx0eXBlPiAiXDM3NyINCj4gPiAoZ2RiKSBwICZ0ZXJtaW5hbHR5cGUNCj4gPiAkNyA9
IChjaGFyICoqKSAweDU1YzkzYWZlOGMyMCA8dGVybWluYWx0eXBlPg0KPiA+IChnZGIpDQo+ID4g
DQo+ID4gVGhpcyByZXN1bHRlZCBpbiBjcmFzaCBvZiB0ZWxuZXRkIHNlcnZpY2UNCj4gPiB3aXRo
IHNlZ21lbnRhdGlvbiBmYXVsdC4NCj4gPiANCj4gDQo+IGl0IHNlZW1zIGxpa2Ugb25lLiBDYW4g
eW91IGFsc28gcmVwcm9kdWNlIGl0IHdpdGggc29tZXRoaW5nIGxpa2UNCj4gZmVkb3JhID8NCj4g
DQoNCkkgbG9va2VkIGF0IGxhdGVzdCBjZW50b3MgYW5kIHVidW50dSwgdGhlaXIgcmVmYWN0b3Jl
ZCBjb2RlIGRvIG5vdCBoYXZlDQp0aGlzIGJ1Zy4NCg0KPiA+IFNpZ25lZC1vZmYtYnk6IEp1bGl1
cyBIZW1hbnRoIFBpdHRpIDxqcGl0dGlAY2lzY28uY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4uYy1G
aXgtYnVmZmVyLW92ZXJmbG93LWluLW5ldG9wcmludGYucGF0Y2ggfCA1Ng0KPiA+ICsrKysrKysr
KysrKysrKysrKysNCj4gPiAgLi4uL25ldGtpdC10ZWxuZXQvbmV0a2l0LXRlbG5ldF8wLjE3LmJi
ICAgICAgIHwgIDEgKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDU3IGluc2VydGlvbnMoKykNCj4g
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtbmV0d29ya2luZy9yZWNpcGVzLW5ldGtpdC9uZXRr
aXQtDQo+ID4gdGVsbmV0L2ZpbGVzLzAwMDEtdGVsbmV0ZC11dGlsaXR5LmMtRml4LWJ1ZmZlci1v
dmVyZmxvdy1pbi0NCj4gPiBuZXRvcHJpbnRmLnBhdGNoDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBh
L21ldGEtbmV0d29ya2luZy9yZWNpcGVzLW5ldGtpdC9uZXRraXQtDQo+ID4gdGVsbmV0L2ZpbGVz
LzAwMDEtdGVsbmV0ZC11dGlsaXR5LmMtRml4LWJ1ZmZlci1vdmVyZmxvdy1pbi0NCj4gPiBuZXRv
cHJpbnRmLnBhdGNoIGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtbmV0a2l0L25ldGtpdC0NCj4g
PiB0ZWxuZXQvZmlsZXMvMDAwMS10ZWxuZXRkLXV0aWxpdHkuYy1GaXgtYnVmZmVyLW92ZXJmbG93
LWluLQ0KPiA+IG5ldG9wcmludGYucGF0Y2gNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+
IGluZGV4IDAwMDAwMDAwMC4uOGY5ODNlNDBhDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBi
L21ldGEtbmV0d29ya2luZy9yZWNpcGVzLW5ldGtpdC9uZXRraXQtdGVsbmV0L2ZpbGVzLzAwMDEt
DQo+ID4gdGVsbmV0ZC11dGlsaXR5LmMtRml4LWJ1ZmZlci1vdmVyZmxvdy1pbi1uZXRvcHJpbnRm
LnBhdGNoDQo+ID4gQEAgLTAsMCArMSw1NiBAQA0KPiA+ICtGcm9tIDljODFjOGU1YmM3NzgyZThh
ZTEyYzA3ODYxNWFiYzNjODk2MDU5ZjIgTW9uIFNlcCAxNyAwMDowMDowMA0KPiA+IDIwMDENCj4g
PiArRnJvbTogSnVsaXVzIEhlbWFudGggUGl0dGkgPGpwaXR0aUBjaXNjby5jb20+DQo+ID4gK0Rh
dGU6IFR1ZSwgMTQgSnVsIDIwMjAgMjI6MzQ6MTkgLTA3MDANCj4gPiArU3ViamVjdDogW1BBVENI
XSB0ZWxuZXRkL3V0aWxpdHkuYzogRml4IGJ1ZmZlciBvdmVyZmxvdyBpbg0KPiA+IG5ldG9wcmlu
dGYNCj4gPiArDQo+ID4gK0FzIHBlciBtYW4gcGFnZSBvZiB2c25wcmludGYsIHdoZW4gZm9ybWF0
ZWQNCj4gPiArc3RyaW5nIHNpemUgaXMgZ3JlYXRlciB0aGFuICJzaXplIigybmQgYXJndW1lbnQp
LA0KPiA+ICt0aGVuIHZzbnByaW50ZiByZXR1cm5zIHNpemUgb2YgZm9ybWF0ZWQgc3RyaW5nLA0K
PiA+ICtub3QgInNpemUiKDJuZCBhcmd1bWVudCkuDQo+ID4gKw0KPiA+ICtuZXRvcHJpbnRmKCkg
d2FzIG5vdCBoYW5kbGluZyBhIGNhc2Ugd2hlcmUNCj4gPiArcmV0dXJuIHZhbHVlIG9mIHZzbnBy
aW50ZiBpcyBncmVhdGVyIHRoYW4NCj4gPiArInNpemUiKDJuZCBhcmd1bWVudCksIHJlc3VsdHMg
aW4gYnVmZmVyIG92ZXJmbG93DQo+ID4gK3doaWxlIGFkanVzdGluZyAibmZyb250cCIgcG9pbnRl
ciB0byBwb2ludA0KPiA+ICtiZXlvbmQgIm5ldG9idWYiIGJ1ZmZlci4NCj4gPiArDQo+ID4gK0hl
cmUgaXMgb25lIHN1Y2ggY2FzZSB3aGVyZSAibmZyb250cCINCj4gPiArY3Jvc3NlZCBib3VuZGFy
aWVzIG9mICJuZXRvYnVmIiwgYW5kDQo+ID4gK3BvaW50aW5nIHRvIGFub3RoZXIgZ2xvYmFsIHZh
cmlhYmxlLg0KPiA+ICsNCj4gPiArKGdkYikgcCAmbmV0b2J1Zls4MjU1XQ0KPiA+ICskNSA9IDB4
NTVjOTNhZmU4YjFmIDxuZXRvYnVmKzgyNTU+ICIiDQo+ID4gKyhnZGIpIHAgbmZyb250cA0KPiA+
ICskNiA9IDB4NTVjOTNhZmU4YzIwIDx0ZXJtaW5hbHR5cGU+ICJcMzc3Ig0KPiA+ICsoZ2RiKSBw
ICZ0ZXJtaW5hbHR5cGUNCj4gPiArJDcgPSAoY2hhciAqKikgMHg1NWM5M2FmZThjMjAgPHRlcm1p
bmFsdHlwZT4NCj4gPiArKGdkYikNCj4gPiArDQo+ID4gK1RoaXMgcmVzdWx0ZWQgaW4gY3Jhc2gg
b2YgdGVsbmV0ZCBzZXJ2aWNlDQo+ID4gK3dpdGggc2VnbWVudGF0aW9uIGZhdWx0Lg0KPiA+ICsN
Cj4gPiArVGhvdWdoIHRoaXMgaXMgRG9TIHNlY3VyaXR5IGJ1ZywgSSBjb3VsZG4ndA0KPiA+ICtm
aW5kIGFueSBDVkUgSUQgZm9yIHRoaXMuDQo+ID4gKw0KPiA+ICtVcHN0cmVhbS1TdGF0dXM6IFBl
bmRpbmcNCj4gPiArDQo+ID4gK1NpZ25lZC1vZmYtYnk6IEp1bGl1cyBIZW1hbnRoIFBpdHRpIDxq
cGl0dGlAY2lzY28uY29tPg0KPiA+ICstLS0NCj4gPiArIHRlbG5ldGQvdXRpbGl0eS5jIHwgMiAr
LQ0KPiA+ICsgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+
ID4gKw0KPiA+ICtkaWZmIC0tZ2l0IGEvdGVsbmV0ZC91dGlsaXR5LmMgYi90ZWxuZXRkL3V0aWxp
dHkuYw0KPiA+ICtpbmRleCBiOWE0NmE2Li40ODExZjE0IDEwMDY0NA0KPiA+ICstLS0gYS90ZWxu
ZXRkL3V0aWxpdHkuYw0KPiA+ICsrKysgYi90ZWxuZXRkL3V0aWxpdHkuYw0KPiA+ICtAQCAtNjYs
NyArNjYsNyBAQCBuZXRvcHJpbnRmKGNvbnN0IGNoYXIgKmZtdCwgLi4uKQ0KPiA+ICsgICAgICAg
bGVuID0gdnNucHJpbnRmKG5mcm9udHAsIG1heHNpemUsIGZtdCwgYXApOw0KPiA+ICsgICAgICAg
dmFfZW5kKGFwKTsNCj4gPiArDQo+ID4gKy0gICAgICBpZiAobGVuPDAgfHwgbGVuPT1tYXhzaXpl
KSB7DQo+ID4gKysgICAgICBpZiAobGVuPDAgfHwgbGVuPj1tYXhzaXplKSB7DQo+ID4gKyAgICAg
ICAgLyogZGlkbid0IGZpdCAqLw0KPiA+ICsgICAgICAgIG5ldGZsdXNoKCk7DQo+ID4gKyAgICAg
ICB9DQo+ID4gKy0tDQo+ID4gKzIuMTkuMQ0KPiA+IGRpZmYgLS1naXQgYS9tZXRhLW5ldHdvcmtp
bmcvcmVjaXBlcy1uZXRraXQvbmV0a2l0LXRlbG5ldC9uZXRraXQtDQo+ID4gdGVsbmV0XzAuMTcu
YmIgYi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1uZXRraXQvbmV0a2l0LQ0KPiA+IHRlbG5ldC9u
ZXRraXQtdGVsbmV0XzAuMTcuYmINCj4gPiBpbmRleCAwZTkyYWRkNjMuLjA4ZGQ1MzJiNiAxMDA2
NDQNCj4gPiAtLS0gYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1uZXRraXQvbmV0a2l0LXRlbG5l
dC9uZXRraXQtDQo+ID4gdGVsbmV0XzAuMTcuYmINCj4gPiArKysgYi9tZXRhLW5ldHdvcmtpbmcv
cmVjaXBlcy1uZXRraXQvbmV0a2l0LXRlbG5ldC9uZXRraXQtDQo+ID4gdGVsbmV0XzAuMTcuYmIN
Cj4gPiBAQCAtMTMsNiArMTMsNyBAQCBTUkNfVVJJID0gIg0KPiA+IGh0dHA6Ly9mdHAubGludXgu
b3JnLnVrL3B1Yi9saW51eC9OZXR3b3JraW5nL25ldGtpdC8ke0JQfS50YXIuZ3ogXA0KPiA+ICAg
ICAgICAgICAgIGZpbGU6Ly8wMDAxLXRlbG5ldC10ZWxuZXRkLUZpeC1wcmludC1mb3JtYXQtDQo+
ID4gc3RyaW5ncy5wYXRjaCBcDQo+ID4gICAgICAgICAgICAgZmlsZTovLzAwMDEtdGVsbmV0LXRl
bG5ldGQtRml4LWRlYWRsb2NrLW9uLQ0KPiA+IGNsZWFudXAucGF0Y2ggXA0KPiA+ICAgICAgICAg
ICAgIGZpbGU6Ly9DVkUtMjAyMC0xMDE4OC5wYXRjaCBcDQo+ID4gKyAgICAgICAgICAgZmlsZTov
LzAwMDEtdGVsbmV0ZC11dGlsaXR5LmMtRml4LWJ1ZmZlci1vdmVyZmxvdy1pbi0NCj4gPiBuZXRv
cHJpbnRmLnBhdGNoIFwNCj4gPiAgICAgICAgICAgICAiDQo+ID4gDQo+ID4gIFVQU1RSRUFNX0NI
RUNLX1VSSSA9ICIke0RFQklBTl9NSVJST1J9L21haW4vbi9uZXRraXQtdGVsbmV0LyINCj4gPiAt
LQ0KPiA+IDIuMTkuMQ0KPiA+IA0K
