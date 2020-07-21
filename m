Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.web10.6306.1595368421532675109
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2020 14:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=ggrnL3Uk;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: jpitti@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=10010; q=dns/txt;
  s=iport; t=1595368421; x=1596578021;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ac+BXunwEwCWQUB2DYCh8x2jN4H77IkABbSxvToVV3M=;
  b=ggrnL3UkFTmHzZb364heNO7x/w5kyxudbBmuSJqXyfK1sBxmJD8x21oh
   x/tWO6MVZ35mWXm+knMrz+iIijPDehqnCp9eB18OgKkz02xRE4Pxn3RGt
   eNCO6g95fLGTtU0VIyWdDTX6ttYV2paPdxWnFfqjL4Uj5HSOfvhXHLfZB
   c=;
IronPort-PHdr: =?us-ascii?q?9a23=3AkUfaXR2LO+grn8IdsmDT+zVfbzU7u7jyIg8e44?=
 =?us-ascii?q?YmjLQLaKm44pD+JxWGuadiiVbIWcPQ7PcXw+bVsqW1X2sG7N7BtX0Za5VDWl?=
 =?us-ascii?q?cDjtlehA0vBsOJSCiZZP7nZiA3BoJOAVli+XzoPk1cGcK4bFrX8TW+6DcIEU?=
 =?us-ascii?q?D5Mgx4bu3+Bo/ViZGx0Oa/s53eaglFnnyze7R3eR63tg7W8MIRhNhv?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AnAAAZYxdf/5NdJa1gGwEBAQEBAQE?=
 =?us-ascii?q?BBQEBARIBAQEDAwEBAUCBNwUBAQELAYFRUQdvWC8shDODRgONTZhegS6BJQN?=
 =?us-ascii?q?VCwEBAQwBAScGAgQBAYQIRAIXgXICJDUIDgIDAQELAQEFAQEBAgEGBG2FXAE?=
 =?us-ascii?q?LhXEBAQEEEhERDAEBNwEPAgEIEQMBAgECAiYCAgIwFQgIAgQOBSKDBYJLAy4?=
 =?us-ascii?q?BDqFvAoE5iGF2gTKDAQEBBYEzAQMDg1kYgg4JFHoqAYJpg1WGMxqBQT+DbDU?=
 =?us-ascii?q?+glwBBIEjOAEXgn+CYI8cERiDEZIZkFwKgl2IVpENIYJ6iT6TEJIBiieUWAI?=
 =?us-ascii?q?EAgQFAg4BAQWBVQE3gVdwFYMkCUcXAg2OHgwXg06FFIJmglx0AgEBBywCBgg?=
 =?us-ascii?q?BAQMJfIx4gkYBAQ?=
X-IronPort-AV: E=Sophos;i="5.75,380,1589241600"; 
   d="scan'208";a="804509651"
Received: from rcdn-core-11.cisco.com ([173.37.93.147])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 21 Jul 2020 21:53:38 +0000
Received: from XCH-ALN-005.cisco.com (xch-aln-005.cisco.com [173.36.7.15])
	by rcdn-core-11.cisco.com (8.15.2/8.15.2) with ESMTPS id 06LLrcfn016415
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 21 Jul 2020 21:53:38 GMT
Received: from xhs-rcd-003.cisco.com (173.37.227.248) by XCH-ALN-005.cisco.com
 (173.36.7.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 21 Jul
 2020 16:53:38 -0500
Received: from xhs-rcd-001.cisco.com (173.37.227.246) by xhs-rcd-003.cisco.com
 (173.37.227.248) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 21 Jul
 2020 16:53:38 -0500
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (72.163.14.9) by
 xhs-rcd-001.cisco.com (173.37.227.246) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Tue, 21 Jul 2020 16:53:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekmDOltlGC5SMlztoTVWl3uDyAFwbzwEJc7691xzD+xmuiz5vJDJD4fLt7krKiZ9bLP5NrY6GsOtdeA97bxFPR/tSOYoX1FLomB3ecGZNy9ApKQ4JqnSlLFQKlqma/7U5L85McaZWWKVSYs1dGdZJPKg11xBLaRs6lFsmHYu3ThhLrKLR2dEG/5eFyeeruZWQ7VG2M/oE6XpHOab3JSh9CoTx+KruUR1vN7vMlcDvJYrsAul8jkSWeMksyZk4aqampkNAkgZGicBP0uDeBiAE5FuGlrLCicJOLVC6sDKBP4BKsyI2Ix9WIa/VVUetETvcVUXbQeKvuQBSQaDrmI7QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ac+BXunwEwCWQUB2DYCh8x2jN4H77IkABbSxvToVV3M=;
 b=TFfZAxBgl8hwfESQO1z0jg0wNCQxRJ/mgugKgf/aFa3GTNnnYaOtSbcd+7LuF8S/QyHjNHq0hbNXUjX441mgQExK4hxxCGAcRSE1fmOtQj04DIK+D/7xRcX+en7peiF0f5dziIHatMKFCcPiXTeq7U8RgUyE2zqukVLiiZ07hoPJ92yTIwpRfSiuhb806AyhpdIPF3n3y+TdthL2bPgqu2UwcfCkLzOyi8yDybbdpeDSPsxUi7ApnXlFFL5LFkEShxfYYgor56fNHuFIXyktVkmrONXjVmIar883aEVHD9jvNQih3K1K/uqZfLbz8fNZCKV5mOjvQi6r1V3k9SPCTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ac+BXunwEwCWQUB2DYCh8x2jN4H77IkABbSxvToVV3M=;
 b=l7rEt8i1xoakBRQD2dYwDJ65yRT4FoAOC8RnVqRnNBxapcdB/YsTZY1JzCPGa69MNRqZ/cciO5nHBCariNuKfS9Cmp5SvhLwGSsul0f7ASC4NizzW8UW0dpYFp+7vWDlxFM+JNoNj6lYL3vZoZ/Q51r2mnlTahUeV82FvksrFPQ=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BY5PR11MB3895.namprd11.prod.outlook.com (2603:10b6:a03:18e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.24; Tue, 21 Jul
 2020 21:53:36 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::182e:91a7:1007:7dc6]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::182e:91a7:1007:7dc6%7]) with mapi id 15.20.3195.026; Tue, 21 Jul 2020
 21:53:36 +0000
From: "Julius Hemanth Pitti" <jpitti@cisco.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "xe-linux-external(mailer list)"
	<xe-linux-external@cisco.com>
Subject: Re: [meta-oe][PATCH] netkit-telnetd: Fix buffer overflow in netoprintf
Thread-Topic: [meta-oe][PATCH] netkit-telnetd: Fix buffer overflow in
 netoprintf
Thread-Index: AQHWXuT3/aVpNnp89E+5xd3GAY/Bg6kREeuAgAAo6gCAACbDAIABM2GA
Date: Tue, 21 Jul 2020 21:53:36 +0000
Message-ID: <e493412775a0bf298790198380631b5b4f4abe7b.camel@cisco.com>
References: <20200720221946.33011-1-jpitti@cisco.com>
	 <CAMKF1squtZehqYZADc91pDLZjT6a+QYBRive=6jed7SM5THPNQ@mail.gmail.com>
	 <ad4d0d2661b08a6c6a278d54a8bf5eb1af3fa3f7.camel@cisco.com>
	 <CAMKF1spKtU6Q-ejeMgVoUiGrPxmiFBEzTuVRSo=+G+dSjW0OWQ@mail.gmail.com>
In-Reply-To: <CAMKF1spKtU6Q-ejeMgVoUiGrPxmiFBEzTuVRSo=+G+dSjW0OWQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [2001:420:c0c8:1005::31b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd9207c6-2a05-43b9-6d5c-08d82dc08543
x-ms-traffictypediagnostic: BY5PR11MB3895:
x-ld-processed: 5ae1af62-9505-4097-a69a-c1553ef7840e,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB3895E36A46E20B10A4093750DA780@BY5PR11MB3895.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RPZbccsMZMG0SwzWiUZD9fYlNa9GABY4VIKjT2unJQCKhiYk3Ii/gd9OnReiw3ksQfiXwvvPiyJXsYO3zk+V5xV6aiPAfZbraDnoEjVhtDwiPhMgH0cS6dtU+xpk62Aj1gRsdaswqjzGuW9u03S7ViT2lRoaitdGGVpM1pYgspfHVb2Trx1CRdQdF8JCH7L7z9PV97jxHdiUMricvp3QF3ZJGOVPx+giwA1q2tThZLJzlNY6qjMUoNfdHHWSrjRA2pGs7izJDslDMi0asxMakIakKArh6atK29KYT3xLYEt71s2+pgmmFh/KZidUrN8+7I6+Kzt/46kZr39ITfU8Zowz8r88Oqqe1KsiANpDmKbR65yf5w7KvAqlYFvBfz4l7sXKTGFK8IvoOZjK+iDdf3SsjW4VMLT3EuFqVmTk92Pz3SGhJyyYcxu2U1TScQiBA17bRDFSOtRkTmAzU0+cKw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4182.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(396003)(366004)(376002)(39860400002)(76116006)(86362001)(6916009)(83380400001)(71200400001)(66446008)(66556008)(5660300002)(36756003)(6512007)(478600001)(966005)(8936002)(2616005)(107886003)(6506007)(6486002)(2906002)(66476007)(54906003)(53546011)(4326008)(186003)(64756008)(316002)(8676002)(66946007)(99106002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: qvyQn2w/P7aRSZpUszQ/Bgf+w2POzCLBwfJUlp9UnQFi8VvDRakgGazdSyrAFozhuSzF2JYZQIaKB1uwkw7OqkXF9+jgyRkUj8U5jSGrH8E21fjYZM7s7EHSLOKgQjJY228t2XAA7R5did6wuFMm7+3dxR/+BdUqXi2GoAFmPwAQYJC+3Owx/sUgHHEphnWbE+Za7Rbz4ziWyxniUIHqu+cHmYHJXSUr4sPq7NJAHm1mcPoXAk3ep6NCtDWjIY6MMuDwayLR4ktcs4C/70GGCy5WYm0cV2D2JxkH9xhN9I0QSTos84UomUszIBm666mKWp36WcAdJo9RGrVSdDFCIWx4lBsCCPrF0Ds8jZwHFitYSBjkW8+qoDpc8xy1J2tlrYNB9adkju3dxPOMoAdm/gV+/nLHA0vninlgYCvX2DVI+4rge6zjqqhNDlXkPXQt0xZE9XkAhMPzBbiqOrgEdDynmY5bpGDNZgBUgpzjCx5BllP73i3+OFIUgsgGS43Lk+YeD25Idz2ufXwTFWfPsg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd9207c6-2a05-43b9-6d5c-08d82dc08543
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2020 21:53:36.3265
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qVCPyjoAYtismVkJEaDka+SIbZtIu5WXoKGTAOcVoH7NWheyToWG5poT3gIGfeVSA65QyZ2ZnEwm5iNZxq4KLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3895
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.15, xch-aln-005.cisco.com
X-Outbound-Node: rcdn-core-11.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <263EF161ECB88B46B181E810AAD8A9F9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDIwLTA3LTIwIGF0IDIwOjMzIC0wNzAwLCBLaGVtIFJhaiB3cm90ZToNCj4gDQo+
IA0KPiBPbiBNb24sIEp1bCAyMCwgMjAyMCBhdCA2OjE0IFBNIEp1bGl1cyBIZW1hbnRoIFBpdHRp
IChqcGl0dGkpIDwNCj4ganBpdHRpQGNpc2NvLmNvbT4gd3JvdGU6DQo+ID4gT24gTW9uLCAyMDIw
LTA3LTIwIGF0IDE1OjQ4IC0wNzAwLCBLaGVtIFJhaiB3cm90ZToNCj4gPiA+IE9uIE1vbiwgSnVs
IDIwLCAyMDIwIGF0IDM6MjcgUE0gSnVsaXVzIEhlbWFudGggUGl0dGkgPA0KPiA+ID4ganBpdHRp
QGNpc2NvLmNvbT4gd3JvdGU6DQo+ID4gPiA+IA0KPiA+ID4gPiBuZXRvcHJpbnRmKCkgd2FzIG5v
dCBoYW5kbGluZyBhIGNhc2Ugd2hlcmUNCj4gPiA+ID4gcmV0dXJuIHZhbHVlIG9mIHZzbnByaW50
ZiBpcyBncmVhdGVyIHRoYW4NCj4gPiA+ID4gInNpemUiKDJuZCBhcmd1bWVudCksIHJlc3VsdHMg
aW4gYnVmZmVyIG92ZXJmbG93DQo+ID4gPiA+IHdoaWxlIGFkanVzdGluZyAibmZyb250cCIgcG9p
bnRlciB0byBwb2ludA0KPiA+ID4gPiBiZXlvbmQgIm5ldG9idWYiIGJ1ZmZlci4NCj4gPiA+ID4g
DQo+ID4gPiA+IEhlcmUgaXMgb25lIHN1Y2ggY2FzZSB3aGVyZSAibmZyb250cCINCj4gPiA+ID4g
Y3Jvc3NlZCBib3VuZGFyaWVzIG9mICJuZXRvYnVmIiwgYW5kDQo+ID4gPiA+IHBvaW50aW5nIHRv
IGFub3RoZXIgZ2xvYmFsIHZhcmlhYmxlLg0KPiA+ID4gPiANCj4gPiA+ID4gKGdkYikgcCAmbmV0
b2J1Zls4MjU1XQ0KPiA+ID4gPiAkNSA9IDB4NTVjOTNhZmU4YjFmIDxuZXRvYnVmKzgyNTU+ICIi
DQo+ID4gPiA+IChnZGIpIHAgbmZyb250cA0KPiA+ID4gPiAkNiA9IDB4NTVjOTNhZmU4YzIwIDx0
ZXJtaW5hbHR5cGU+ICJcMzc3Ig0KPiA+ID4gPiAoZ2RiKSBwICZ0ZXJtaW5hbHR5cGUNCj4gPiA+
ID4gJDcgPSAoY2hhciAqKikgMHg1NWM5M2FmZThjMjAgPHRlcm1pbmFsdHlwZT4NCj4gPiA+ID4g
KGdkYikNCj4gPiA+ID4gDQo+ID4gPiA+IFRoaXMgcmVzdWx0ZWQgaW4gY3Jhc2ggb2YgdGVsbmV0
ZCBzZXJ2aWNlDQo+ID4gPiA+IHdpdGggc2VnbWVudGF0aW9uIGZhdWx0Lg0KPiA+ID4gPiANCj4g
PiA+IA0KPiA+ID4gaXQgc2VlbXMgbGlrZSBvbmUuIENhbiB5b3UgYWxzbyByZXByb2R1Y2UgaXQg
d2l0aCBzb21ldGhpbmcgbGlrZQ0KPiA+ID4gZmVkb3JhID8NCj4gPiA+IA0KPiA+IA0KPiA+IEkg
bG9va2VkIGF0IGxhdGVzdCBjZW50b3MgYW5kIHVidW50dSwgdGhlaXIgcmVmYWN0b3JlZCBjb2Rl
IGRvIG5vdA0KPiA+IGhhdmUNCj4gPiB0aGlzIGJ1Zy4NCj4gDQo+IEkgd291bGQgcHJlZmVyIHRv
IHNoYXJlIHRoZSByZWZhY3RvcmVkIGNvZGUgd2hpY2ggYXZvaWRzIHRoaXMNCj4gcHJvYmxlbSAN
Cg0KQ2VudG9zL0ZlZG9yYSBhbmQgdWJ1bnR1IGhhdmUgdGhlaXIgb3duIHJlZmFjdG9yZWQgY29k
ZS4gVGhlaXIgcGF0Y2hlcw0KZG8gbm90IGhhdmUgbXVjaCBpbiBjb21tb24uIElmIHdlIGRlY2lk
ZSB0byBzaGFyZSB0aGVpciByZWZhY3RvcmVkIGNvZGUNCnRvIGF2b2lkIHRoaXMgYnVnLCB0aGVu
IEkgcmVjb21tZW5kIENlbnRvcyB3YXkgYXMgaXQncyBjbG9zZXIgdG8gb3VyDQpzb3VyY2UuDQoN
CmNlbnRvcy9mZWRvcmEgcmVmYWN0b3JlZCB0aGVpciBjb2RlIGEgbG9uZyB0aW1lIGFnbyBpbiBw
YXRjaCAidGVsbmV0LQ0KMC4xNy1zYS0wMS00OS5wYXRjaCINCihSZWY6IA0KaHR0cHM6Ly9zb3Vy
Y2UuaXBmaXJlLm9yZy9zb3VyY2UtMy54LzRiMzE5NWQ3M2I0N2Q5NGQ3NTYzMDA0Njg3MWZjYWRk
N2JjZTg5YTkvdGVsbmV0L3BhdGNoZXMvdGVsbmV0LTAuMTctc2EtMDEtNDkucGF0Y2gNCikNCkkg
bG9va2VkIGF0IHRoZWlyIHBhdGNoLCBhbmQgdGhlIHdheSB0aGV5IHNvbHZlIGl0IGxvZ2ljYWxs
eSBkZXJpdmVzIHRvDQp0aGUgc2FtZSByZXN1bHRzLg0KDQpUaGVyZSBpcyBvbmUgcGFydGljdWxh
ciBodW5rIGluIHRoaXMgcGF0Y2gsIHdoaWNoIEkgZG8gbm90IHVuZGVyc3RhbmQNCndoeSBpcyBp
dCBkb25lLg0KSGVyZSBpcyB0aGUgc25pcHBldCwNCg0KZGlmZiAtdXAgbmV0a2l0LXRlbG5ldC0w
LjE3L3RlbG5ldGQvdGVybXN0YXQuYy5zYS0wMS00OSBuZXRraXQtdGVsbmV0LQ0KMC4xNy90ZWxu
ZXRkL3Rlcm1zdGF0LmMNCi0tLSBuZXRraXQtdGVsbmV0LTAuMTcvdGVsbmV0ZC90ZXJtc3RhdC5j
LnNhLTAxLTQ5ICAgICAgMTk5OS0xMi0xMg0KMTU6NTk6NDUuMDAwMDAwMDAwICswMTAwDQorKysg
bmV0a2l0LXRlbG5ldC0wLjE3L3RlbG5ldGQvdGVybXN0YXQuYyAgICAgICAyMDExLTAxLTIwDQoy
MjozOTo1NC4wMDAwMDAwMDAgKzAxMDANCkBAIC0xMjgsNyArMTI4LDYgQEAgc3RhdGljIGludCBf
dGVybWluaXQgPSAwOw0KICAgICAgICB2b2lkDQogbG9jYWxzdGF0KCkNCiB7DQotICAgICAgIHZv
aWQgbmV0Zmx1c2goKTsNCiAgICAgICAgaW50IG5lZWRfd2lsbF9lY2hvID0gMDsNCg0KICAgICAg
ICAvKg0KDQpVbmZvcnR1bmF0ZWx5IHRoaXMgcGF0Y2ggZG9lcyBub3QgaGF2ZSBhbnkgY29tbWl0
IG1lc3NhZ2Ugb3IgY29tbWVudA0Kd2hpY2ggZXhwbGFpbnMgd2h5IHdlIG5lZWQgdGhpcy4NCk1h
eWJlIGl0IGhhcyBzb21ldGhpbmcgdG8gZG8gd2l0aCBwcmV2aW91cyBwYXRjaGVzIGluIHRoZSBz
ZXJpZXMsDQpwZXJoYXBzIHNvbWUgYnVnIGZpeCwgd2hpY2ggdGhleSBzcXVhc2hlZCB0b2dldGhl
ciBpbiB0aGlzIHBhdGNoPyBub3QNCnN1cmUgdGhvdWdoLg0KDQpJZiB3ZSBkZWNpZGUgdG8gdGFr
ZSBhYm92ZSBodW5rIGFzLWlzLCBob3cgZG8gd2UgZW5zdXJlIHRoaXMgZG9lc24ndA0KaGF2ZSB1
bndhbnRlZCBlZmZlY3RzPw0KDQpXaXRoIHRoaXMgZGV0YWlscywgSU1PLCBJIHRoaW5rIHdlIHNo
b3VsZG4ndCBzaGFyZSBqdXN0IHRoZSBwYXJ0IHRoYXQNCmF2b2lkIHRoaXMgcHJvYmxlbSwNCg0K
V2Ugc2hvdWxkIGVpdGhlciBkcm9wIGFsbCBvdXIgY3VycmVudCBwYXRjaGVzKGluIG91ciByZWNp
cGUpIGFuZCBqdXN0DQpwaWNrIGFsbCB0aGUgcGF0Y2hlcyBmcm9tIGNlbnRvcy9GZWRvcmEgb3Ig
dWJ1bnR1LA0KICAgICAgIG9yDQp3ZSBtYWtlIGEgcG9pbnQgZml4IG9mIHRoaXMgaXNzdWUgbGlr
ZSB0aGUgcGF0Y2ggSSBzdWJtaXR0ZWQuDQoNClBsZWFzZSBzdWdnZXN0Lg0KDQo+ID4gDQo+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IEp1bGl1cyBIZW1hbnRoIFBpdHRpIDxqcGl0dGlAY2lzY28uY29t
Pg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIC4uLi5jLUZpeC1idWZmZXItb3ZlcmZsb3ctaW4tbmV0
b3ByaW50Zi5wYXRjaCB8IDU2DQo+ID4gPiA+ICsrKysrKysrKysrKysrKysrKysNCj4gPiA+ID4g
IC4uLi9uZXRraXQtdGVsbmV0L25ldGtpdC10ZWxuZXRfMC4xNy5iYiAgICAgICB8ICAxICsNCj4g
PiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IG1ldGEtbmV0d29ya2luZy9yZWNpcGVzLW5ldGtpdC9uZXRraXQtDQo+ID4g
PiA+IHRlbG5ldC9maWxlcy8wMDAxLXRlbG5ldGQtdXRpbGl0eS5jLUZpeC1idWZmZXItb3ZlcmZs
b3ctaW4tDQo+ID4gPiA+IG5ldG9wcmludGYucGF0Y2gNCj4gPiA+ID4gDQo+ID4gPiA+IGRpZmYg
LS1naXQgYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1uZXRraXQvbmV0a2l0LQ0KPiA+ID4gPiB0
ZWxuZXQvZmlsZXMvMDAwMS10ZWxuZXRkLXV0aWxpdHkuYy1GaXgtYnVmZmVyLW92ZXJmbG93LWlu
LQ0KPiA+ID4gPiBuZXRvcHJpbnRmLnBhdGNoIGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtbmV0
a2l0L25ldGtpdC0NCj4gPiA+ID4gdGVsbmV0L2ZpbGVzLzAwMDEtdGVsbmV0ZC11dGlsaXR5LmMt
Rml4LWJ1ZmZlci1vdmVyZmxvdy1pbi0NCj4gPiA+ID4gbmV0b3ByaW50Zi5wYXRjaA0KPiA+ID4g
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+ID4gPiBpbmRleCAwMDAwMDAwMDAuLjhmOTgzZTQw
YQ0KPiA+ID4gPiAtLS0gL2Rldi9udWxsDQo+ID4gPiA+ICsrKyBiL21ldGEtbmV0d29ya2luZy9y
ZWNpcGVzLW5ldGtpdC9uZXRraXQtdGVsbmV0L2ZpbGVzLzAwMDEtDQo+ID4gPiA+IHRlbG5ldGQt
dXRpbGl0eS5jLUZpeC1idWZmZXItb3ZlcmZsb3ctaW4tbmV0b3ByaW50Zi5wYXRjaA0KPiA+ID4g
PiBAQCAtMCwwICsxLDU2IEBADQo+ID4gPiA+ICtGcm9tIDljODFjOGU1YmM3NzgyZThhZTEyYzA3
ODYxNWFiYzNjODk2MDU5ZjIgTW9uIFNlcCAxNw0KPiA+IDAwOjAwOjAwDQo+ID4gPiA+IDIwMDEN
Cj4gPiA+ID4gK0Zyb206IEp1bGl1cyBIZW1hbnRoIFBpdHRpIDxqcGl0dGlAY2lzY28uY29tPg0K
PiA+ID4gPiArRGF0ZTogVHVlLCAxNCBKdWwgMjAyMCAyMjozNDoxOSAtMDcwMA0KPiA+ID4gPiAr
U3ViamVjdDogW1BBVENIXSB0ZWxuZXRkL3V0aWxpdHkuYzogRml4IGJ1ZmZlciBvdmVyZmxvdyBp
bg0KPiA+ID4gPiBuZXRvcHJpbnRmDQo+ID4gPiA+ICsNCj4gPiA+ID4gK0FzIHBlciBtYW4gcGFn
ZSBvZiB2c25wcmludGYsIHdoZW4gZm9ybWF0ZWQNCj4gPiA+ID4gK3N0cmluZyBzaXplIGlzIGdy
ZWF0ZXIgdGhhbiAic2l6ZSIoMm5kIGFyZ3VtZW50KSwNCj4gPiA+ID4gK3RoZW4gdnNucHJpbnRm
IHJldHVybnMgc2l6ZSBvZiBmb3JtYXRlZCBzdHJpbmcsDQo+ID4gPiA+ICtub3QgInNpemUiKDJu
ZCBhcmd1bWVudCkuDQo+ID4gPiA+ICsNCj4gPiA+ID4gK25ldG9wcmludGYoKSB3YXMgbm90IGhh
bmRsaW5nIGEgY2FzZSB3aGVyZQ0KPiA+ID4gPiArcmV0dXJuIHZhbHVlIG9mIHZzbnByaW50ZiBp
cyBncmVhdGVyIHRoYW4NCj4gPiA+ID4gKyJzaXplIigybmQgYXJndW1lbnQpLCByZXN1bHRzIGlu
IGJ1ZmZlciBvdmVyZmxvdw0KPiA+ID4gPiArd2hpbGUgYWRqdXN0aW5nICJuZnJvbnRwIiBwb2lu
dGVyIHRvIHBvaW50DQo+ID4gPiA+ICtiZXlvbmQgIm5ldG9idWYiIGJ1ZmZlci4NCj4gPiA+ID4g
Kw0KPiA+ID4gPiArSGVyZSBpcyBvbmUgc3VjaCBjYXNlIHdoZXJlICJuZnJvbnRwIg0KPiA+ID4g
PiArY3Jvc3NlZCBib3VuZGFyaWVzIG9mICJuZXRvYnVmIiwgYW5kDQo+ID4gPiA+ICtwb2ludGlu
ZyB0byBhbm90aGVyIGdsb2JhbCB2YXJpYWJsZS4NCj4gPiA+ID4gKw0KPiA+ID4gPiArKGdkYikg
cCAmbmV0b2J1Zls4MjU1XQ0KPiA+ID4gPiArJDUgPSAweDU1YzkzYWZlOGIxZiA8bmV0b2J1Zis4
MjU1PiAiIg0KPiA+ID4gPiArKGdkYikgcCBuZnJvbnRwDQo+ID4gPiA+ICskNiA9IDB4NTVjOTNh
ZmU4YzIwIDx0ZXJtaW5hbHR5cGU+ICJcMzc3Ig0KPiA+ID4gPiArKGdkYikgcCAmdGVybWluYWx0
eXBlDQo+ID4gPiA+ICskNyA9IChjaGFyICoqKSAweDU1YzkzYWZlOGMyMCA8dGVybWluYWx0eXBl
Pg0KPiA+ID4gPiArKGdkYikNCj4gPiA+ID4gKw0KPiA+ID4gPiArVGhpcyByZXN1bHRlZCBpbiBj
cmFzaCBvZiB0ZWxuZXRkIHNlcnZpY2UNCj4gPiA+ID4gK3dpdGggc2VnbWVudGF0aW9uIGZhdWx0
Lg0KPiA+ID4gPiArDQo+ID4gPiA+ICtUaG91Z2ggdGhpcyBpcyBEb1Mgc2VjdXJpdHkgYnVnLCBJ
IGNvdWxkbid0DQo+ID4gPiA+ICtmaW5kIGFueSBDVkUgSUQgZm9yIHRoaXMuDQo+ID4gPiA+ICsN
Cj4gPiA+ID4gK1Vwc3RyZWFtLVN0YXR1czogUGVuZGluZw0KPiA+ID4gPiArDQo+ID4gPiA+ICtT
aWduZWQtb2ZmLWJ5OiBKdWxpdXMgSGVtYW50aCBQaXR0aSA8anBpdHRpQGNpc2NvLmNvbT4NCj4g
PiA+ID4gKy0tLQ0KPiA+ID4gPiArIHRlbG5ldGQvdXRpbGl0eS5jIHwgMiArLQ0KPiA+ID4gPiAr
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4gPiAr
DQo+ID4gPiA+ICtkaWZmIC0tZ2l0IGEvdGVsbmV0ZC91dGlsaXR5LmMgYi90ZWxuZXRkL3V0aWxp
dHkuYw0KPiA+ID4gPiAraW5kZXggYjlhNDZhNi4uNDgxMWYxNCAxMDA2NDQNCj4gPiA+ID4gKy0t
LSBhL3RlbG5ldGQvdXRpbGl0eS5jDQo+ID4gPiA+ICsrKysgYi90ZWxuZXRkL3V0aWxpdHkuYw0K
PiA+ID4gPiArQEAgLTY2LDcgKzY2LDcgQEAgbmV0b3ByaW50Zihjb25zdCBjaGFyICpmbXQsIC4u
LikNCj4gPiA+ID4gKyAgICAgICBsZW4gPSB2c25wcmludGYobmZyb250cCwgbWF4c2l6ZSwgZm10
LCBhcCk7DQo+ID4gPiA+ICsgICAgICAgdmFfZW5kKGFwKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiAr
LSAgICAgIGlmIChsZW48MCB8fCBsZW49PW1heHNpemUpIHsNCj4gPiA+ID4gKysgICAgICBpZiAo
bGVuPDAgfHwgbGVuPj1tYXhzaXplKSB7DQo+ID4gPiA+ICsgICAgICAgIC8qIGRpZG4ndCBmaXQg
Ki8NCj4gPiA+ID4gKyAgICAgICAgbmV0Zmx1c2goKTsNCj4gPiA+ID4gKyAgICAgICB9DQo+ID4g
PiA+ICstLQ0KPiA+ID4gPiArMi4xOS4xDQo+ID4gPiA+IGRpZmYgLS1naXQgYS9tZXRhLW5ldHdv
cmtpbmcvcmVjaXBlcy1uZXRraXQvbmV0a2l0LQ0KPiA+IHRlbG5ldC9uZXRraXQtDQo+ID4gPiA+
IHRlbG5ldF8wLjE3LmJiIGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtbmV0a2l0L25ldGtpdC0N
Cj4gPiA+ID4gdGVsbmV0L25ldGtpdC10ZWxuZXRfMC4xNy5iYg0KPiA+ID4gPiBpbmRleCAwZTky
YWRkNjMuLjA4ZGQ1MzJiNiAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvbWV0YS1uZXR3b3JraW5nL3Jl
Y2lwZXMtbmV0a2l0L25ldGtpdC10ZWxuZXQvbmV0a2l0LQ0KPiA+ID4gPiB0ZWxuZXRfMC4xNy5i
Yg0KPiA+ID4gPiArKysgYi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1uZXRraXQvbmV0a2l0LXRl
bG5ldC9uZXRraXQtDQo+ID4gPiA+IHRlbG5ldF8wLjE3LmJiDQo+ID4gPiA+IEBAIC0xMyw2ICsx
Myw3IEBAIFNSQ19VUkkgPSAiDQo+ID4gPiA+IA0KPiA+IGh0dHA6Ly9mdHAubGludXgub3JnLnVr
L3B1Yi9saW51eC9OZXR3b3JraW5nL25ldGtpdC8ke0JQfS50YXIuZ3ogXA0KPiA+ID4gPiAgICAg
ICAgICAgICBmaWxlOi8vMDAwMS10ZWxuZXQtdGVsbmV0ZC1GaXgtcHJpbnQtZm9ybWF0LQ0KPiA+
ID4gPiBzdHJpbmdzLnBhdGNoIFwNCj4gPiA+ID4gICAgICAgICAgICAgZmlsZTovLzAwMDEtdGVs
bmV0LXRlbG5ldGQtRml4LWRlYWRsb2NrLW9uLQ0KPiA+ID4gPiBjbGVhbnVwLnBhdGNoIFwNCj4g
PiA+ID4gICAgICAgICAgICAgZmlsZTovL0NWRS0yMDIwLTEwMTg4LnBhdGNoIFwNCj4gPiA+ID4g
KyAgICAgICAgICAgZmlsZTovLzAwMDEtdGVsbmV0ZC11dGlsaXR5LmMtRml4LWJ1ZmZlci1vdmVy
Zmxvdy0NCj4gPiBpbi0NCj4gPiA+ID4gbmV0b3ByaW50Zi5wYXRjaCBcDQo+ID4gPiA+ICAgICAg
ICAgICAgICINCj4gPiA+ID4gDQo+ID4gPiA+ICBVUFNUUkVBTV9DSEVDS19VUkkgPSAiJHtERUJJ
QU5fTUlSUk9SfS9tYWluL24vbmV0a2l0LXRlbG5ldC8iDQo+ID4gPiA+IC0tDQo+ID4gPiA+IDIu
MTkuMQ0KPiA+ID4gPiANCg==
