Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id A37086193C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2020 01:30:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2020 17:30:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,505,1574150400"; d="scan'208";a="231742659"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
	by fmsmga007.fm.intel.com with ESMTP; 01 Mar 2020 17:30:40 -0800
Received: from orsmsx154.amr.corp.intel.com (10.22.226.12) by
	ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Sun, 1 Mar 2020 17:30:40 -0800
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
	ORSMSX154.amr.corp.intel.com (10.22.226.12) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Sun, 1 Mar 2020 17:30:40 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
	by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Sun, 1 Mar 2020 17:30:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=LCTPwvUWeRkxrv0DZ7Zj5W7aMB+zB37SLqVXRp9TFOSHKLXFUIjeBN/ccWgQbsNa2/WzbeYm3I5tTknGgpyY/sEtrgQHRXTiwpmMDzRs1SYlZNNesDN2xFzVcnRWZUUUn0LEgOV/065WF6q6aZyyr/Ur/M5sK46VU0+TVUmnSPhWCPcEaHIKejSpGpD9Vto5ivp6yuCJSZT6pxxA+V0GrWVj3kMJ4O04swn+cBkjb8xnZvYRh5FbLZZuO6RQXMd/EuBa6fOxfXI+P/9lTD67T+JSANn5WeiCOc38U9bUs3VrsX98gGwJGEidHmYMTOO7ih2tc1ZKi0G2C5TQxNaoQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Fajmo1SES5fI5qXG/sqcfG/BWyHPXk5SnNM4k1OcoMk=;
	b=eDmO3jfu4gK8OREW2BC0e9KlgTpBydJPvWBE22f30sPpVIG9dNtj5EnmdVZZ6HD1YUYbPK+QU4zgtXMj+l3KbWkeSho3KLj4DXGoWkq6ttmNQALm/VlG9yaG3zXjAnn0d+M5KNHfE+AErlpKeGMn3FXWoIbfGwMQmEXTFiZc4ddYQJMsWZzH+wZZWLheA0hxEJV2OqArsN1GsP41GpyHTL8JtRWc+8dtmDJwKzFpjSJy3M+8UTwyhkmLk36qKXBdcyRomc4RfEypgaXa16LCHsUSt6CkfWoIuiSoc9ZGI4R/xXy0LakrldeGeVKngTxA8TSMRxUhC/TJHArFDdPIJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com; 
	dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
	s=selector2-intel-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Fajmo1SES5fI5qXG/sqcfG/BWyHPXk5SnNM4k1OcoMk=;
	b=HSoIuDXHHvEeRpeW6ecWTF6iApjshmjHoKALCJ0sOgNJEUQbn6u4Jm9OWJ5v9nHFlFLksuWu3vD0TKfvjXKMtK9/ud/ErVdzod70mMg7m8Zz6S1DT76xtNGKhhgDZ2w/LqcOUQ1sdkoo4WXdJVgn2R2G+mI5QvsAMllZx2nV82E=
Received: from BN7PR11MB2721.namprd11.prod.outlook.com (2603:10b6:406:ba::29)
	by BN7PR11MB2803.namprd11.prod.outlook.com (2603:10b6:406:b5::13)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15;
	Mon, 2 Mar 2020 01:30:38 +0000
Received: from BN7PR11MB2721.namprd11.prod.outlook.com
	([fe80::dde7:a568:6f2c:7493]) by
	BN7PR11MB2721.namprd11.prod.outlook.com
	([fe80::dde7:a568:6f2c:7493%4]) with mapi id 15.20.2772.019;
	Mon, 2 Mar 2020 01:30:37 +0000
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [PATCH 1/5] opencv: Enable pkg-config .pc file generation
Thread-Index: AQHV72EJNAp+kJopA0C2D93Dhbq4QqgzBsGAgAF+WkA=
Date: Mon, 2 Mar 2020 01:30:37 +0000
Message-ID: <BN7PR11MB2721FC59B0578AAAAA707543C8E70@BN7PR11MB2721.namprd11.prod.outlook.com>
References: <1583022782-6527-1-git-send-email-ee.peng.yeoh@intel.com>
	<CAMKF1soxc=WDStbrVAjZzf5CKprvPb4zZW=OVjOB32dtpE944w@mail.gmail.com>
In-Reply-To: <CAMKF1soxc=WDStbrVAjZzf5CKprvPb4zZW=OVjOB32dtpE944w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=ee.peng.yeoh@intel.com; 
x-originating-ip: [192.198.147.206]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc16fee3-7ef1-42ab-53cc-08d7be494ffa
x-ms-traffictypediagnostic: BN7PR11MB2803:
x-microsoft-antispam-prvs: <BN7PR11MB2803B7DAC215D04CDA2BDBD4C8E70@BN7PR11MB2803.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 033054F29A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(39860400002)(346002)(136003)(376002)(366004)(199004)(189003)(71200400001)(5660300002)(6916009)(33656002)(52536014)(26005)(186003)(8936002)(86362001)(81156014)(8676002)(81166006)(64756008)(2906002)(66476007)(66556008)(7696005)(478600001)(316002)(66946007)(4326008)(66446008)(55016002)(6506007)(9686003)(76116006)(54906003)(53546011)(142923001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN7PR11MB2803;
	H:BN7PR11MB2721.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hvu9/YuIecoRk17cA6ttA2iRT4yZahXTXwYw417wp0Zq3ddjfeSziSGJjlQBqOe4o0EReVtIC65nidkOQ2B4UuL9dw7Lm1IafACzdEyYj9uJ70GlzvSdCedGj0KcrFrmpbaO8Zs6GtwqZToWFFF+fHc7zuAQcpxGtse5WTIqGtYYHKF5bvB0Fch6zYma2baWRCMg2ltR6rgpnAfMZhtlywLQrQ9T46qT+BV1nY/hDfVAWhK/4LGp9HdPzRDnlumDdDZddR5KTkechefyrtlNVpFS2mUQaZag+myCucideN/RKp4cyPuZiJdL4TlkZKzeVepznuc15wGtt4TIGzwwU1rP6r5TljTVKrpSS4wNO39znMFzVzjpRwcgvP9Aiqgpp7Cacrmh9WFIKA5CQcD4JHF7+yl5X773oT1Pp9QNMU7kfPKwIM+6gomN6Y62YiI7DeZkh5wRVYyffVY2xkfaiqiDTI5XxC+qMbxvOuYxhSSKhjCBYYl3QIWfQbRyYYvI
x-ms-exchange-antispam-messagedata: xOZittpOpRj+SImp8nalwNnJWcblBoLHaLT8gjujZg8P3xdMC6EX8BtsWxU6K7amsEV+1f++M5RM2gUQGf/IH6PRss1xJeXklzCNKcJ4LOTyMRMtYr7B1yjw6Rk1xDP3B4foylR0eTLHQ/a8THntKA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bc16fee3-7ef1-42ab-53cc-08d7be494ffa
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2020 01:30:37.4353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JyeeozU9axmqNWG8PQM0le1OYTT1JpJw4X+V3mXG/OTJrzSciToj3enQ/SUCCZsotkNr2uzoFBvOHw+dV3Yb8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2803
X-OriginatorOrg: intel.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/5] opencv: Enable pkg-config .pc file generation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Mar 2020 01:30:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WWVzLCB5b3UgYXJlIHJpZ2h0LCB0aGVzZSBzZXJpZXMgb2Ygb3BlbmN2IHBhdGNoZXMgYXJlIGJh
Y2twb3J0IGZvciB6ZXVzIGJyYW5jaC4gSSBtaXNzZWQgdGhlIHByZWZpeCB3aGlsZSBwcmVwYXJp
bmcgYW5kIHRlc3RpbmcgdGhlc2UgcGF0Y2hlcy4gSSBoYWQgcmVzZW50IHRoZW0gd2l0aCB0aGUg
emV1cyBicmFuY2ggcHJlZml4LiBUaGFuayB5b3UgZm9yIHlvdXIgY29ycmVjdGlvbi4gDQoNCi0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwu
Y29tPiANClNlbnQ6IFN1bmRheSwgTWFyY2ggMSwgMjAyMCAxMDo0MCBBTQ0KVG86IFllb2gsIEVl
IFBlbmcgPGVlLnBlbmcueWVvaEBpbnRlbC5jb20+DQpDYzogb3BlbmVtYmVkZWQtZGV2ZWwgPG9w
ZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPjsgQ2FybG9zIFJhZmFlbCBH
aWFuaSA8Y3JnNzQ3NUBtYWlsYm94Lm9yZz4NClN1YmplY3Q6IFJlOiBbUEFUQ0ggMS81XSBvcGVu
Y3Y6IEVuYWJsZSBwa2ctY29uZmlnIC5wYyBmaWxlIGdlbmVyYXRpb24NCg0Kd2hpY2ggYnJhbmNo
IGlzIHRoaXMgaW50ZW5kZWQgZm9yPyBpdCBkb2VzIG5vdCBsb29rIGl0IGlzIGZvciBtYXN0ZXIg
c2luY2UgaXQgc291bmRzIG1vcmUgbGlrZSBiYWNrcG9ydCwgcGxlYXNlIGFkZCBpdCB0byBzdWJq
ZWN0IHByZWZpeCBzbyBzdGFibGUgbWFpbnRhaW5lciBjYW4gZ2V0IG5vdGlmaWVkIGFib3V0IGl0
Lg0KDQpPbiBTYXQsIEZlYiAyOSwgMjAyMCBhdCA0OjMzIFBNIFllb2ggRWUgUGVuZyA8ZWUucGVu
Zy55ZW9oQGludGVsLmNvbT4gd3JvdGU6DQo+DQo+IEZyb206IENhcmxvcyBSYWZhZWwgR2lhbmkg
PGNyZzc0NzVAbWFpbGJveC5vcmc+DQo+DQo+IEluIE9wZW5DViA0LCAucGMgZmlsZSBnZW5lcmF0
aW9uIGlzIGRpc2FibGVkIGJ5IGRlZmF1bHQuIFlldCwgb3RoZXIgDQo+IHNvZnR3YXJlIHN1Y2gg
YXMgR1N0cmVhbWVyIGFuZCBGRm1wZWcgcmVseSBvbiB0aGUgLnBjIGZpbGVzIGR1cmluZyANCj4g
YnVpbGQgdGltZSBjb25maWd1cmF0aW9uLiBFeHBsaWNpdGVseSBlbmFibGUgLnBjIGZpbGUgZ2Vu
ZXJhdGlvbiB0byANCj4gbWFrZSBzdXJlIHBrZy1jb25maWcgY2FuIGJlIHVzZWQgZm9yIGdldHRp
bmcgaW5mb3JtYXRpb24gYWJvdXQgT3BlbkNWLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBDYXJsb3Mg
UmFmYWVsIEdpYW5pIDxjcmc3NDc1QG1haWxib3gub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBLaGVt
IFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBZZW9oIEVlIFBlbmcg
PGVlLnBlbmcueWVvaEBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgbWV0YS1vZS9yZWNpcGVzLXN1cHBv
cnQvb3BlbmN2L29wZW5jdl80LjEuMC5iYiB8IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspDQo+DQo+IGRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9vcGVu
Y3Yvb3BlbmN2XzQuMS4wLmJiIA0KPiBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L29wZW5jdi9v
cGVuY3ZfNC4xLjAuYmINCj4gaW5kZXggNzdiNWRkNi4uNWU4OWRiMCAxMDA2NDQNCj4gLS0tIGEv
bWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvb3BlbmN2L29wZW5jdl80LjEuMC5iYg0KPiArKysgYi9t
ZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9vcGVuY3Yvb3BlbmN2XzQuMS4wLmJiDQo+IEBAIC02NCw2
ICs2NCw3IEBAIEVYVFJBX09FQ01BS0UgPSAiLURPUEVOQ1ZfRVhUUkFfTU9EVUxFU19QQVRIPSR7
V09SS0RJUn0vY29udHJpYi9tb2R1bGVzIFwNCj4gICAgICAtRENNQUtFX1NLSVBfUlBBVEg9T04g
XA0KPiAgICAgIC1ET1BFTkNWX0lDVl9IQVNIPSR7SVBQX01ENX0gXA0KPiAgICAgIC1ESVBQUk9P
VD0ke1dPUktESVJ9L2lwcGljdl9sbnggXA0KPiArICAgIC1ET1BFTkNWX0dFTkVSQVRFX1BLR0NP
TkZJRz1PTiBcDQo+ICAgICAgJHtAYmIudXRpbHMuY29udGFpbnMoIlRBUkdFVF9DQ19BUkNIIiwg
Ii1tc3NlMyIsICItREVOQUJMRV9TU0U9MSAtREVOQUJMRV9TU0UyPTEgLURFTkFCTEVfU1NFMz0x
IC1ERU5BQkxFX1NTU0UzPTEiLCAiIiwgZCl9IFwNCj4gICAgICAke0BiYi51dGlscy5jb250YWlu
cygiVEFSR0VUX0NDX0FSQ0giLCAiLW1zc2U0LjEiLCAiLURFTkFCTEVfU1NFPTEgLURFTkFCTEVf
U1NFMj0xIC1ERU5BQkxFX1NTRTM9MSAtREVOQUJMRV9TU1NFMz0xIC1ERU5BQkxFX1NTRTQxPTEi
LCAiIiwgZCl9IFwNCj4gICAgICAke0BiYi51dGlscy5jb250YWlucygiVEFSR0VUX0NDX0FSQ0gi
LCAiLW1zc2U0LjIiLCANCj4gIi1ERU5BQkxFX1NTRT0xIC1ERU5BQkxFX1NTRTI9MSAtREVOQUJM
RV9TU0UzPTEgLURFTkFCTEVfU1NTRTM9MSANCj4gLURFTkFCTEVfU1NFNDE9MSAtREVOQUJMRV9T
U0U0Mj0xIiwgIiIsIGQpfSBcDQo+IC0tDQo+IDIuNy40DQo+DQo=

