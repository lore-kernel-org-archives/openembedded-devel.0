Received: from esa17.fujitsucc.c3s2.iphmx.com (esa17.fujitsucc.c3s2.iphmx.com [216.71.158.34])
 by mx.groups.io with SMTP id smtpd.web09.18606.1629077574855532125
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Aug 2021 18:32:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=QzqYtoBI;
 spf=pass (domain: fujitsu.com, ip: 216.71.158.34, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1629077576; x=1660613576;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=E6Ozy/VUpfVHzShSaF2Ce9cUFiqjoIcVH1Ls6PYSc44=;
  b=QzqYtoBIDwHtNX+N2UNSSCeVFiSmV6BTFgOBZ0LJaz/3ROCaByoxNwoy
   GAqVULkRA2OQK5lp3MxeaIooVs0IRApiVFn3yndNR8K1KBG0hIm59QKXG
   O0fT5CV06G4Sl5+fTCGuz4YEvqNkd0f3ShXxpUEVGFrMMpnsd+Al2sh7L
   UMVVkZ5X6NxgIRZuPYyylDXiG0KhrB8cyR/WPLPEAVema85OVG59fRO/2
   BFEuV37mCHcMUXNmJeLWQ/1WI7XPlX26weqAltFfWe6IQ4nHMZjGlZMjo
   K5OC5J2DsfcrR8LfSXKFFwcw+Zg9f5cfLjQEkm+tCmGJqaJamobuf6P3Z
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="36589462"
X-IronPort-AV: E=Sophos;i="5.84,324,1620658800"; 
   d="scan'208";a="36589462"
Received: from mail-os2jpn01lp2057.outbound.protection.outlook.com (HELO JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.57])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2021 10:32:52 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Du9k/4Q7/85qKFK38wdqRGhrZ6ij2mgPOPZ0GMXfluj7zrisYBot5ZxXiIjaCiUS2oEvB2Zibz/bEi96ApUbBVW3dsKBpzvipqpCTqV07GTvrni04KwpBhoY1w68nriZGcOBh+t2xtwX9buY2R4q/S7RBnUzHhS47PeduqZM3fMCDgTkvGy9H09WR9I5xnLeciTMZWGQjnIxGFcoXoeFNUAGZOoGt221FzL5PQbDSqgYregj1Yytl1ewID/2oSTkXMUGI56DsK4GY35E3eIGJM02gzCbHdB1DmcTo306CPhIPwLHtHesQxdprQTn4a9KBzb0CONuy6eUWKeN19Vz7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6Ozy/VUpfVHzShSaF2Ce9cUFiqjoIcVH1Ls6PYSc44=;
 b=GARszedF36Cg1wkuKcLKwTPq17RbfO8facTaIEqmiZP4FBJ6mCMex8H6MvEyGzEUBAkN+05Yg/tkxZJTX0MLldV9CI5sj2wL0R0azEpehFkY/lAjI2qZiTF3GwD1AuQ7dn6lKaPVNf1vlp/4xgMPLc/8bwz2HTD8KUIPHhnQbYu0+s4y0FhmKKoyKPJ/zHHzu7KKf239ZwPFY8gEdVzFlb+eH49RTMV5Ac7/RND9i5EVDkJV1vZEnQOQUnjAsuxKzSYjOitqzixgr7kx7uTu0gMVdDTcuou4ZbZNyhKH99JxXSQxmM1Wf7A3CISD6hNNqS40USKbpUHUg5ZTEmP61w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6Ozy/VUpfVHzShSaF2Ce9cUFiqjoIcVH1Ls6PYSc44=;
 b=GGTGiXEFkfDWg4eErW2nb4tolTUugc4ZEFUUIfDIhDBgoBZzbZPp7oe4yCwuhF1v1HWYkizFtq6OiW3VCYkzXBJ8cGBGk0NCZ8HmH0T9RzS1A0rbQ/td9Mnz5tbqNwNaGaSSYqOBbvhzIu6Io4TP37A7KfLaGGqFY5/5jWkQR/4=
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by OSAPR01MB1841.jpnprd01.prod.outlook.com (2603:1096:603:32::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.21; Mon, 16 Aug
 2021 01:32:49 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::b8c0:9704:899b:2b3d]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::b8c0:9704:899b:2b3d%6]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 01:32:49 +0000
From: "leimaohui" <leimaohui@fujitsu.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
CC: Khem Raj <raj.khem@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] takao-fonts: It should be in ttf-fonts directory as the other ttf fonts.
Thread-Topic: [oe] [meta-oe][PATCH] takao-fonts: It should be in ttf-fonts
 directory as the other ttf fonts.
Thread-Index: AQHXkBLr5njOIHF64UyRpKSHGHBcd6txoaSAgAM3r4CAAIKnQA==
Date: Mon, 16 Aug 2021 01:32:48 +0000
Message-ID: 
 <OS0PR01MB61785C58F46571F73A84A147A0FD9@OS0PR01MB6178.jpnprd01.prod.outlook.com>
References: <1628871245-5054-1-git-send-email-leimaohui@fujitsu.com>
 <7ec64059-4784-0bbe-4ff0-49542fa645dc@gmail.com>
 <CAMKF1sqr=tUTE=NqN0T4e99UN5Waw3B14rGTWOQGyqhZagMA3A@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqr=tUTE=NqN0T4e99UN5Waw3B14rGTWOQGyqhZagMA3A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c360e9a-811b-4796-a32e-08d96055c1d4
x-ms-traffictypediagnostic: OSAPR01MB1841:
x-microsoft-antispam-prvs: 
 <OSAPR01MB1841FF3CD5D588381B3F4572A0FD9@OSAPR01MB1841.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JhiD7AntZW+4K+wxER0joSoy8ifebp6ZpBJpmFi4Bqko2w2pANX7onMf8KfKJ+UCUUTVRkIx5qC0GReADWp1yuQKHGSh524Jd13vO1pW6SYFJoZaJOkoCMrjuKcviB2VnUuljjxm5NNjYlLiOfkxn91nzN/aMCQHEo/dhDhOiGYkn9SAAP7yxUPxHZZ2BBCdmSNBQ+qBHZOtHAHGzDy2+zd5gbcpMlyJ3cNcEaOpX03Wd9J+pnpteYw1XSbEPiJwhQbyPSKf6m1+1+nBhfvVjWRINcB7+SUueWBUmW+RmeHHGTb0ve22ACHOB4OOmXa76aprxQlCRw8Qhu/5sh7pIrqL3ZqTFSxBLJ+ZLcSKbThn5zVns5H5fFKKRDFQGStl9fsZWmvGeg6TjNHTu4lCUymrscRTn2NbNQGps/sjW5Zw+IH1sOb9yCK2DYA8CaLinT62YH1NjFanb9eI5KHGIb+QHBEBMERMcTOJktHt2HXz5EjTBW52Rwlsk+QbWJ9Ak7BffWgsghnDfYN5sZ48NJWm9e/Id7G/sALNwJTGwnIad0qt7VmYWRkxWTr2YPCC2hnQniKGTUmTn+oLm8lNxiM87M3RzXGRR84HB2wIdHDPHnLNk1eSUddhVzDWVG66QwEkU1xH3S8CiNN4zAWXAzjncOxEUnYL7swOGmQS9akz7SsoJlDCjOrCiChWMwlkHyrAJGGI/wGhmzU6HtdY6MJM8nTMng2+iglbrlhlGlKFO36dOAzDPJH3LCtE/k9Y1dV6XXRHIimLJ6TCnlH2BH06/Tp3YrAVqj7Hwi7ZA70DfE3X3BlR7a9sqk/aJdgq+L4dRC3631gq0Gk6RrRFMA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(478600001)(7696005)(86362001)(52536014)(71200400001)(38070700005)(122000001)(5660300002)(83380400001)(966005)(66476007)(316002)(6506007)(53546011)(64756008)(38100700002)(66446008)(66556008)(26005)(76116006)(66946007)(8676002)(8936002)(186003)(4326008)(85182001)(9686003)(55016002)(2906002)(33656002)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OGtPQk9wYmY2dmxHS1JzakgrQ0RTUjlFUHBPeFlVdDRWc3R1Ly8vVjBKQTVl?=
 =?utf-8?B?TmIrak5qRG1obHpoNFZnTko0R2NvSGpnTVVXQ2hmZzk2L0NZYnVpZDdEYk1Q?=
 =?utf-8?B?K0pJU1owaUI5M2h2R1JYSkNzTHBXa1hNSUlxenRvSHhCYThkWGI4WUQrNGNP?=
 =?utf-8?B?QmEzMjArV3h2YTR6L0RMWUZXeEdyWnFPVWtoWkpJUzd5T2tWY0pndlEyMmdv?=
 =?utf-8?B?RkF6S3lLeU13V3RqMTduWk91YVRMdE1LYW9kaTJPR3RFOHZEamNVK2FhQnJH?=
 =?utf-8?B?KzQ2WUhIS0ppUFZJYTQwblBzb3dDRlVpUEFPa3pLZ2ZpVUwzK21CZVpqa3pR?=
 =?utf-8?B?NWczZ0p6MzBxNFhjbmdjbzdac0NJODZsSHNWSnhLT0QxWjA0akU5S1VxUzRz?=
 =?utf-8?B?WktPUm1ZOFhoeHVOUklWaWh5c1BXWFM2ZHBiYTJ4TGFuYkZqdjEySDRycXYz?=
 =?utf-8?B?OG5IOXRtUnY0SHgrVWVhVXFmNmNoRFhiOEpQSzZkdFd3TGxxMzV2TVozQWdV?=
 =?utf-8?B?S1FTek1pY1ljTjRQSkxacldmb2VhSFUvbmdLV09FTGt3cFZWZG1ZU29pOWRJ?=
 =?utf-8?B?TEpjZ3drdE1FY2l2RWJLQXlRTmd2RWFZNzNRRUFlL0JDL0dZcmNZaXl1Smc3?=
 =?utf-8?B?NnpEWFkrWFZrUzFBbUpuWVI2OGh3cHNOcytOZ0VmWFNTaUdkMzdIYWNOdlFV?=
 =?utf-8?B?eGJNTk9oTXkxczlrZVgrWkNWOG55RHhTU3M1WnFuT1J5ejJlcXFVd3hHQjJ6?=
 =?utf-8?B?djZ6TVF2S3Y1WGhNcDhMVCtPczdUMWIyRVV6QVBYVGhHcWNJWjdIaDlpTnU3?=
 =?utf-8?B?aTV6WXJQY0RyWlh5N1NDL1NyZG5qdStjRzRraHh4eWlOQnJZZlZ6Mlpsblcw?=
 =?utf-8?B?UXNZUnJjVlZ5d3hCRThaMGxrZG4raG83ek5FdC93b3IzQk5qK0taVWROZXVJ?=
 =?utf-8?B?ekRmaEt4QjVSL3ZSV2p1TTIzTGxKdDdlZ2EvcmNiZ0JOSi9RVHlNVC9hT1Bk?=
 =?utf-8?B?ankwNDNkb1BTaWV0YWdDVDk0dzJHaGt4dDRoWHNMclVsRWRqbmxIeS82Z1RS?=
 =?utf-8?B?TEFmdHlMNi9OU0l0MnpYLzFFbElxdTY4Zm5XZ3ZTeWNZdUVma2JUMm9EM1RB?=
 =?utf-8?B?UHdYUVpmLytsOStmUGMyeWFrcXErZHE5dDBBQytmSUxlT2ZYUVZSQ2tmN0li?=
 =?utf-8?B?cU0zNlpBY2JrMjNFcVVaTjNOdmhPNXAveVU4VDRyMTZhQmRNYnh1cXNseHBG?=
 =?utf-8?B?U1IwZGZLclNsWTRBeGZQNEdSYndwTDc1Znk4UzV0blpoTFlJektBK2hSa3Mz?=
 =?utf-8?B?S3FIdHMxQ0FBUXZDYnQ4RmVoRFptSy9aWHZNMFdVK2lGbE96ZFRZTDFuMFg1?=
 =?utf-8?B?OGZUZi9YaWJpUlNDMjVNYXQ5bENwM2lqRHB2Tko0ZVRaS1hxODVhbmNLN3Nn?=
 =?utf-8?B?ZnY4QVZYYWtLVkNSZ0VwYWJSdVVKZXJHNmlMOFBvVVJaREhSL243RFV1aFRt?=
 =?utf-8?B?UEQzSkpvYnhFUFlMa0o1YVVPeUhDdHMrS3lSLzUxQ3UwS2VwdWZXeDhqanJO?=
 =?utf-8?B?WHkxM0lkWTR3NDhXdjFBVWE4NEd1dmhCQXV2MzEwaTNQd3dWbTlnU1M4Y01J?=
 =?utf-8?B?NWhWVzZ4THh0N2YxV3BhWlpySHJCdVpmdHZiejAxS0Y2RXZRam9BeWd6K09F?=
 =?utf-8?B?V0VXTTd3QkN6bmhpTUI3QkRobVhFMVFyVmE2dXBLSWFSZUhBenNMSFVWUDdL?=
 =?utf-8?Q?ePc8rfdNmVuNhmqz6ipZw6xtbpUo6q/m4fPihIs?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c360e9a-811b-4796-a32e-08d96055c1d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2021 01:32:48.9264
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PUpv1qwOI6HdAFVul67AEco6q2QASk1KxBlO5AFI3byzMOEvggKcEII4gpWYVa6gVAaVVZzOZ39cxikw2Bi3dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB1841
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VG8gS2hlbQ0KDQpUaGFuayB5b3VyIGZvciBjb21tZW50LCBJIGhhdmUgZml4ZWQgdGhlc2UgaXNz
dWVzLCBhbmQgc2VudCBwYXRjaCB2Mi4NCg0KDQpCZXN0IHJlZ2FyZHMNCkxlaQ0KDQoNCg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21h
aWwuY29tPg0KPiBTZW50OiBNb25kYXksIEF1Z3VzdCAxNiwgMjAyMSAxOjQxIEFNDQo+IFRvOiBM
ZWksIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPjsgb3BlbmVtYmVkZWQtZGV2ZWwNCj4g
PG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KPiBTdWJqZWN0OiBS
ZTogW29lXSBbbWV0YS1vZV1bUEFUQ0hdIHRha2FvLWZvbnRzOiBJdCBzaG91bGQgYmUgaW4gdHRm
LWZvbnRzIGRpcmVjdG9yeQ0KPiBhcyB0aGUgb3RoZXIgdHRmIGZvbnRzLg0KPiANCj4gVGhlcmUg
YXJlIGFkZGl0aW9uYWwgcmVjaXBlcyB3aGljaCBkZXBlbmQgb24gdGhpcyBwYWNrYWdlIGFuZCB0
aGV5IHNob3VsZCBiZQ0KPiBhZGp1c3RlZCBhY2NvcmRpbmdseSBhcyB3ZWxsIHNlZQ0KPiANCj4g
ICBtZXRhLW9lL3JlY2lwZXMtY29yZS9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vncm91cC1tZXRhLW9l
LmJiOg0KPiB0YWthby1mb250cyBcDQo+ICBtZXRhLW9lL3JlY2lwZXMtZ3JhcGhpY3MvdHRmLWZv
bnRzL3R0Zi10YWthb18wMDMuMDMuMDEuYmI6SE9NRVBBR0UgPQ0KPiAiaHR0cHM6Ly9sYXVuY2hw
YWQubmV0L3Rha2FvLWZvbnRzIg0KPiAgbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvdWltL3VpbV8x
LjguOC5iYjpERVBFTkRTOmFwcGVuZDpjbGFzcy10YXJnZXQNCj4gPSAiIGludGx0b29sLW5hdGl2
ZSBndGsrIGd0ayszIHVpbS1uYXRpdmUgdGFrYW8tZm9udHMiDQo+ICBtZXRhLW9lL3JlY2lwZXMt
c3VwcG9ydC91aW0vdWltXzEuOC44LmJiOlJERVBFTkRTOnVpbS1hbnRoeSA9DQo+ICJ0YWthby1m
b250cyBhbnRoeSBsaWJhbnRoeTAiDQo+IA0KPiBwbGVhc2Ugc2VuZCBhIHYyIHdpdGggdGhlc2Ug
Zml4ZWQgdG8gcmVmbGVjdCB0aGUgcmVjaXBlIHJlbmFtZSBjaGFuZ2UgYXMgd2VsbC4NCj4gDQo+
IE9uIEZyaSwgQXVnIDEzLCAyMDIxIGF0IDk6MzMgQU0gS2hlbSBSYWogPHJhai5raGVtQGdtYWls
LmNvbT4gd3JvdGU6DQo+ID4NCj4gPg0KPiA+DQo+ID4gT24gOC8xMy8yMSA5OjE0IEFNLCBsZWlt
YW9odWkgd3JvdGU6DQo+ID4gPiAtIE1vdmVkIGl0IHRvIHR0Zi1mb250cyBkaXJlY3RvcnkuDQo+
ID4gPiAtIFJlbmFtZSB0byB0dGYtdGFrYW8uDQo+ID4gPiAtIFVzZSB0dGYuaW5jIGluc3RlYWQg
b2YgcmV3cml0ZSBkb19pbnN0YWxsLg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IExlaSBN
YW9odWkgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gICAuLi4vdHRm
LXRha2FvXzAwMy4wMy4wMS5iYn0gICAgICAgICAgICAgICAgICAgICAgfCAxNg0KPiArKysrKysr
KysrKystLS0tDQo+ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQ0KPiA+ID4gICByZW5hbWUNCj4gPiA+IG1ldGEtb2UvcmVjaXBlcy1ncmFwaGlj
cy97dGFrYW8tZm9udHMvdGFrYW8tZm9udHNfMDAzLjAzLjAxLmJiID0+DQo+ID4gPiB0dGYtZm9u
dHMvdHRmLXRha2FvXzAwMy4wMy4wMS5iYn0gKDU3JSkNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0
DQo+ID4gPiBhL21ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy90YWthby1mb250cy90YWthby1mb250
c18wMDMuMDMuMDEuYmINCj4gPiA+IGIvbWV0YS1vZS9yZWNpcGVzLWdyYXBoaWNzL3R0Zi1mb250
cy90dGYtdGFrYW9fMDAzLjAzLjAxLmJiDQo+ID4gPiBzaW1pbGFyaXR5IGluZGV4IDU3JQ0KPiA+
ID4gcmVuYW1lIGZyb20NCj4gPiA+IG1ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy90YWthby1mb250
cy90YWthby1mb250c18wMDMuMDMuMDEuYmINCj4gPiA+IHJlbmFtZSB0byBtZXRhLW9lL3JlY2lw
ZXMtZ3JhcGhpY3MvdHRmLWZvbnRzL3R0Zi10YWthb18wMDMuMDMuMDEuYmINCj4gPiA+IGluZGV4
IDlkZGZjNmFlNy4uMmMzNzNmOTQ2IDEwMDY0NA0KPiA+ID4gLS0tIGEvbWV0YS1vZS9yZWNpcGVz
LWdyYXBoaWNzL3Rha2FvLWZvbnRzL3Rha2FvLWZvbnRzXzAwMy4wMy4wMS5iYg0KPiA+ID4gKysr
IGIvbWV0YS1vZS9yZWNpcGVzLWdyYXBoaWNzL3R0Zi1mb250cy90dGYtdGFrYW9fMDAzLjAzLjAx
LmJiDQo+ID4gPiBAQCAtMSwzICsxLDUgQEANCj4gPiA+ICtyZXF1aXJlIHR0Zi5pbmMNCj4gPiA+
ICsNCj4gPiA+ICAgU1VNTUFSWSA9ICJUYWthbyBGb250cyBhcmUgYSBjb21tdW5pdHkgZGV2ZWxv
cGVkIGRlcml2YXRpdmVzIG9mIElQQQ0KPiBGb250cy4iDQo+ID4gPiAgIERFU0NSSVBUSU9OID0g
IlRha2FvIEZvbnRzIGFyZSBhIGNvbW11bml0eSBkZXZlbG9wZWQgZGVyaXZhdGl2ZXMgb2YNCj4g
SVBBIEZvbnRzLiINCj4gPiA+DQo+ID4gPiBAQCAtNiwxNCArOCwyMCBAQCBTRUNUSU9OID0gIlVz
ZXIgSW50ZXJmYWNlL1giDQo+ID4gPg0KPiA+ID4gICBMSUNFTlNFID0gIklQQSINCj4gPiA+ICAg
TElDX0ZJTEVTX0NIS1NVTSA9DQo+ICJmaWxlOi8vSVBBX0ZvbnRfTGljZW5zZV9BZ3JlZW1lbnRf
djEuMC50eHQ7bWQ1PTZjZDMzNTFiYTk3OWNmOWRiMWZhZDY0NA0KPiBlODIyMTI3NiINCj4gPiA+
ICtQUiA9ICJyMCINCj4gPg0KPiA+IGV4cGxpY2l0IFBSIHNldHRpbmcgaXMgbm90IG5lZWRlZCBo
ZXJlLiBJIGhhdmUgcmVtb3ZlZCBpdCBiZWZvcmUNCj4gPiBzdGFnaW5nIGJ1dCBrZWVwIHRoaXMg
aW4gbWluZCBmb3IgZnV0dXJlDQo+ID4NCj4gPiA+ICsNCj4gPiA+ICAgU1JDX1VSSSA9DQo+ICJo
dHRwczovL2xhdW5jaHBhZC5uZXQvJHtCUE59L3RydW5rLzE1LjAzLytkb3dubG9hZC9UYWthb0Zv
bnRzXzAwMzAzLjAxLnQNCj4gYXIueHoiDQo+ID4gPiAgIFNSQ19VUklbbWQ1c3VtXSA9ICI4Y2Qz
ZmU3MjRmYWE1MDM0YTkzNjllOThjZjEwOGQyZCINCj4gPiA+ICAgU1JDX1VSSVtzaGEyNTZzdW1d
ID0NCj4gImU5ODcxZjcyYWM2OWFjYjNlMjc3YWViYmVlN2NhMDFmYmViZjU0ODAwNzMzZTI5ZmFm
ZGM0NjEzM2ZjMzU1MmYiDQo+ID4gPg0KPiA+ID4gICBTID0gIiR7V09SS0RJUn0vVGFrYW9Gb250
c18wMDMwMy4wMSINCj4gPiA+IC1kb19pbnN0YWxsKCkgew0KPiA+ID4gLSAgICBpbnN0YWxsIC1t
IDA3NTUgLWQgJHtEfS8ke2RhdGFkaXJ9L2ZvbnRzDQo+ID4gPiAtICAgIGluc3RhbGwgLW0gMDY0
NCAtcCAke1N9LyoudHRmICR7RH0vJHtkYXRhZGlyfS9mb250cy8NCj4gPiA+IC19DQo+ID4gPiAr
DQo+ID4gPiArUEFDS0FHRVMgPSAidHRmLXRha2FvLXBnb3RoaWMgdHRmLXRha2FvLWdvdGhpYyB0
dGYtdGFrYW8tcG1pbmNobw0KPiB0dGYtdGFrYW8tbWluY2hvIg0KPiA+ID4gK0ZPTlRfUEFDS0FH
RVMgPSAidHRmLXRha2FvLXBnb3RoaWMgdHRmLXRha2FvLWdvdGhpYyB0dGYtdGFrYW8tcG1pbmNo
bw0KPiB0dGYtdGFrYW8tbWluY2hvIg0KPiA+ID4gKw0KPiA+ID4gK0ZJTEVTOnR0Zi10YWthby1w
Z290aGljID0gIiR7ZGF0YWRpcn0vZm9udHMvdHJ1ZXR5cGUvVGFrYW9QR290aGljLnR0ZiINCj4g
PiA+ICtGSUxFUzp0dGYtdGFrYW8tZ290aGljID0gIiR7ZGF0YWRpcn0vZm9udHMvdHJ1ZXR5cGUv
VGFrYW9Hb3RoaWMudHRmIg0KPiA+ID4gK0ZJTEVTOnR0Zi10YWthby1wbWluY2hvID0gIiR7ZGF0
YWRpcn0vZm9udHMvdHJ1ZXR5cGUvVGFrYW9QTWluY2hvLnR0ZiINCj4gPiA+ICtGSUxFUzp0dGYt
dGFrYW8tbWluY2hvID0gIiR7ZGF0YWRpcn0vZm9udHMvdHJ1ZXR5cGUvVGFrYW9NaW5jaG8udHRm
Ig0KPiA+ID4NCj4gPiA+ICAgRklMRVM6JHtQTn0gKz0gIiR7ZGF0YWRpcn0vZm9udHMvKi50dGYi
DQo+ID4gPg0KPiA+ID4NCj4gPiA+DQo+ID4gPiANCj4gPiA+DQo=
