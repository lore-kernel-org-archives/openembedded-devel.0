Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B18C25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 04:52:03 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.61])
 by mx.groups.io with SMTP id smtpd.web11.449.1698382322706111024
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 21:52:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=L5eWOn+o;
 spf=pass (domain: axis.com, ip: 40.107.249.61, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQkPhga00tfkMau86nPzR9hrBz9n41c0MzSuIqkK3CKn2g57Kcmtw3uCyES7fWiSe7xTMQk3dm8GzO+YkFKc1iWpLZpyExngI66zPtqwGNcQgSrwQj5trSZzPBvU+WBYzmHjD+5UQvS+4MgOgh14ilXcCw2vwIqjcAkjOc4/k7jvkAEy89zpPH7XxfCYGbQAwOOmvO4qUhcyfNnosfawsC/Ok/rzVWNLgW0uaCL/V3mleLznv6l+OJEV+ESo1ZtGgNA6vXRXGxxIjMV8Dq4iBYpMeWW0+ZOyEKJApPRMDM4u3MO/vdbF1rLtwXwpOs+NeTf/ZOJFdkwnNAGBBVD/CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmfegYFR2lLK6PYdrNWgBkV5d0eczn87sB0OwCdP8rI=;
 b=dlS+N73RBRUC/GD/K+n98vYSgByrkBBBX2W1+FdCtXqCGGSo/w6ePAVwTetO+KeeT8O+SI/srvjFC62xcP9/Nrrm2haZUensVsreqg/6YAuderS0zzHpSkjOXQ5GCTkWkoOW7PsA3JxhD3+1GFUs3JtwhoJ98MzZ3+pn0XAmVIcmSSG9lbZBsZLH3rfwaDpU/T339mUxHRIfMadJGEBTF1y3OVyC6yN3JKpcCBVr2TjOO54NFx0QIGWv0cUtueXulY9QWkiOAp++p5RaEDls+1HfoQd7MS403BMW/zZB7xIYEhhiMCYf5VpAZ1DRJFANzZKtmxhU+akgUILfGV3awg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmfegYFR2lLK6PYdrNWgBkV5d0eczn87sB0OwCdP8rI=;
 b=L5eWOn+o2z87ZzsWXyuicutNKaycr81v0M/oipG3ZZg7RGFQu8+eEpBQc+yzZdeJyc2b0jlO0c7NWSSUF2hQu7zNW/uzkqZhGCBqZ4mx+3nnKOPa/1kAd5fHaE+o1ARlako3T4BhB9jl8ppt/6XiLRK4KPJa/UqZ9xgD2YIdOuQ=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by GV2PR02MB8673.eurprd02.prod.outlook.com (2603:10a6:150:78::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.22; Fri, 27 Oct
 2023 04:51:57 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1b86:94ad:137d:4093]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1b86:94ad:137d:4093%6]) with mapi id 15.20.6907.032; Fri, 27 Oct 2023
 04:51:57 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-networking][PATCH 2/2] mosquitto: Support building for
 native again
Thread-Topic: [oe] [meta-networking][PATCH 2/2] mosquitto: Support building
 for native again
Thread-Index: AQHaCEjIx0I0IJVUbUiFlBOaV1vTvrBdEU1w
Date: Fri, 27 Oct 2023 04:51:57 +0000
Message-ID: 
 <DB5PR02MB10213D8CAF3145B001F1BC75FEFDCA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20231026132203.3840009-1-pkj@axis.com>
	 <20231026132203.3840009-2-pkj@axis.com>
 <2cbe64d28d7e2655f109b45d0fcf8b4317367c72.camel@linuxfoundation.org>
In-Reply-To: 
 <2cbe64d28d7e2655f109b45d0fcf8b4317367c72.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GV2PR02MB8673:EE_
x-ms-office365-filtering-correlation-id: 5cf4e14a-b29e-45ad-eea7-08dbd6a87302
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ByK/ZnVqurlA54NMHErdNv5pEDQ90eLzZm0gAbh6cgo7QH4Y2dqeVgg4fw4HkGqao09R5A2NcYK2/oTF5PtiOtp9kyM49xAL6U3ywr0o33d1RpwVFcQQx21zU581l6XiGmqR4eP3ww38J+KNaRmA+TqdJg4FktvKIn5hqB7SbBJfWBLmJ43PHAVF8PtqX5TRhivtvtb1Hjj5fRwXC4N+1my+YVXQ0EToGH6BfCZtxmeuwxmzQW0y/kI13+3tpqMN/diTojzsOpnaKh8RVDjwxYP7SCusrLYHSx5FjReE7zdObpMw8KZbgrKyIYZrTNQfO5TvY+OId/VO6C5rWkfsXI2zFfSy6X6EoXS7DeJxrQR2lfIzczSglmI0B71UsMDJs6xL+HyDe4tyJx/keduvpn5DA5A0VAIHaPVi6i8is3gVus82zrdD9ix0wR6rhHHsB7j42AQZ80sIw0n6bquMdIXaLJQI3Iu6Kb/LLx/Y+VYM9gdHqhqnXneMQ+BY8W/Ic9sJHzcvJceGAe/Ab8VXviihHmubx3hvjIJvxCiCGgGHilMv68NG+md38tTBXN5BESX9sjRNDx0vJ5PqzyERYmD/Yd2p/T6ca9LWQ3Caua+DkH7ZuhkcewEA4f90eKuD
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(39860400002)(396003)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(5660300002)(4001150100001)(2906002)(55016003)(33656002)(86362001)(4744005)(38070700009)(122000001)(38100700002)(6506007)(7696005)(8936002)(8676002)(66946007)(66556008)(66446008)(76116006)(110136005)(66476007)(64756008)(53546011)(9686003)(316002)(26005)(71200400001)(41300700001)(44832011)(478600001)(52536014)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VVJGYVVNNzVPQkVjYTBpbkJLb0c2S0cvVXdrNDc5ZlNVTGw3YnZ1SklNclF0?=
 =?utf-8?B?S0cvejdRVzBnZTBWdlpqNXNDSHFxMTMwMDh5R2Q1cVhpS2MzTW1ocWVVK0RV?=
 =?utf-8?B?b0VNeGIvUnBNdmtVeThvUmpXVnlkOHdWTlY3VThSYlZqRTdqTGNQWHlJTkNi?=
 =?utf-8?B?b0E2K3dabDFYMTIzeUNiS01Ib1FBQUdqNWhXdFFVeTBOZUtWK08xM1p5aWhw?=
 =?utf-8?B?TWx3SW4ya1hOUU9LTllDam1lMGFNS3F6ZmtzSnRwdEVSUnpnQ1lPZThtZ0ZL?=
 =?utf-8?B?VXBFWDBwUEt1dmFoRG1GSWg2U3dkNyt0SmNJdlJiWmRLU1M2cjRwZzhPVEZn?=
 =?utf-8?B?ZVFJZTEyQkFQdG9Hc0I3Z3BNT1hjODBTU1JtNG9PWGhuMmVwc3o5a3BMOUpC?=
 =?utf-8?B?SmJ6aGtPNWhMUDVGUmdzaEdRY2N4QWdGa0p6L1VPcjZ2MGJhWmZ4Y2VLSDVV?=
 =?utf-8?B?MzVYSk4yZ0ZDLzZNaCt2Z2JMM1pQbkF3M2tpWkplRWsxbXl1Zk54NVg2MnFm?=
 =?utf-8?B?UjBGaDd6dmZzVnpGOEd3V0Y5OC84RklVb09nc1dERGs3cldZelJXZythUEZN?=
 =?utf-8?B?Q25tTmdqaUptWHoycWR0Tnd5eEFmaU96YVIvODFpdUtJL0RkYWpNNG5YVVp6?=
 =?utf-8?B?UXMvT3ZuaU0ySUhhZFl6N3RUTFFoRm9JMHBSWm9pb2NpdkJmZTBTQ2tGNWp0?=
 =?utf-8?B?Z2hwWmFsNUllR0R2d0VSaE9ibUxMOUR3alRlSkJ4V1o0MVVWeHQ0YzB5cnNr?=
 =?utf-8?B?QjRBNExDbVlhaGg5N1NaWnJjbHcwOWRTSUg5aFhETm12b3hPaUZMeHIwMnlC?=
 =?utf-8?B?NGtKckVkUnBBTFFka2dWVzM3UTYySGtPeldMcEFkQXpwa09LSHJxVW4zWWt5?=
 =?utf-8?B?ZEoySCtrWGhFQ3o0ZGM4UzhjNFB5N1ZBZ2NSR1QxMkJIS2dWdXJTbldGS0Vh?=
 =?utf-8?B?djlOQS85ZURwTFd6R3ErMGhYT1FGMFlqajg2dkhQUXU1T2tSV0V3Tmw0Sitv?=
 =?utf-8?B?bzBtUWJNWlh4TTdxeHJVejZxQzV5Z1BPdVNLVDFIQ085Uys5WjRIUG1vWE1l?=
 =?utf-8?B?QWxYY3Z0RHgvYkhjbzIxVE9SWVk1bDR3cDZySTF0WlhuYjBOalNIcElvYVJi?=
 =?utf-8?B?TE4wOWdtV0F6NUUxZWVoU0VjaUw1WmNLNnk0MGdMZUdHOUMwemVFajZhdngy?=
 =?utf-8?B?YWFSczUyemM3UTM3SnBtR2xjWDFIUmE5ZE9OUTg3NFRjM0NwWU1pY29uT1px?=
 =?utf-8?B?WkJqaVkyMlM2U0NOa0I3WVhXNTU5OHdQRTJVaEdmOUdxN2NqVFBNTFdYYXNk?=
 =?utf-8?B?cG95OXZyUGRZS1B3d2UyNVREbFFrSlA2VHlmeVRSdFJnandYUlBOWTVhQzln?=
 =?utf-8?B?UjNNczVoZmlLdzN2TkE1TkQ1aWZLMWpuSFppZGpCeHdhNUZaNTdrYmN2Njc5?=
 =?utf-8?B?bW9ZNG5kdXVGZVp0cFVDOUQyNmphVUtWYUZuUTB4RllhOTN6eTl5Wi9CNGxK?=
 =?utf-8?B?RlVTSGpKZytUTGtQbTJ0VWptUC9LV05VYk4zZWVnWUFRWmtqb1FKTjJXTVNt?=
 =?utf-8?B?dU9rY0R3c3JScTlBOG1aWjNqbDBtOTFid3Z0Q1MxSmQ0RngrNEpqOExXUW83?=
 =?utf-8?B?VTNTY3N2Vk9uMjdpaE9mbXNsMFlxSXRVYnZENjJkeDJ1T09EemVpRUR4TU9x?=
 =?utf-8?B?NE9iMWRERHd3blg1T1JVQXk2YitiYy9SOU1XQW1OSVVMaWVmMzcyTm1pbTdN?=
 =?utf-8?B?Q3drSUw2U2VPWFZ6Ti9Fb1hOOURUTW4rTWt1M1p2bktzVU1Cb2VnUkFiWldC?=
 =?utf-8?B?UzZySlArY09ZUmtFZ0N5SitDR3FwMFlML3ZqRlcwblZhTjhzbmdTbEtoOEJF?=
 =?utf-8?B?WVc2dEtTZU1idnNBbGZYMmMwbUJzcytxZHh3WFZhY25BdVFMYjFYZktNNW9h?=
 =?utf-8?B?cnVzaEdnWWNUa1BLNStQeVJCeGN4OUgvam10SWk3bWo2c0NMdllaQUdoa3ph?=
 =?utf-8?B?TFdQUnpmQitKSVFsUEI4SHRwKzN1ajFBVkRTRGdZY3F0VHVYajIySGZDZXdX?=
 =?utf-8?B?VnRQdC8wMVdxZlpnTm1aNXQ2TTNvbzNGTkNoTHpLQVdpOWh4TXBwZjJyYVZo?=
 =?utf-8?Q?vSaE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf4e14a-b29e-45ad-eea7-08dbd6a87302
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2023 04:51:57.5274
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cFdXapBRxh04tieNH9+aP1gMcH6sBMOId5X4GjEWKggVbJbgLod6SyzQvM/cnL6L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB8673
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 04:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105766

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogZGVuIDI2IG9rdG9iZXIg
MjAyMyAyMjoxMw0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRA
YXhpcy5jb20+OyBvcGVuZW1iZWRkZWQtDQo+IGRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
Cj4gU3ViamVjdDogUmU6IFtvZV0gW21ldGEtbmV0d29ya2luZ11bUEFUQ0ggMi8yXSBtb3NxdWl0
dG86IFN1cHBvcnQgYnVpbGRpbmcNCj4gZm9yIG5hdGl2ZSBhZ2Fpbg0KPiANCj4gT24gVGh1LCAy
MDIzLTEwLTI2IGF0IDE1OjIyICswMjAwLCBQZXRlciBLamVsbGVyc3RlZHQgd3JvdGU6DQo+ID4g
U3VwcG9ydCBmb3IgYnVpbGRpbmcgZnJvbSBuYXRpdmUgd2FzIHJlbW92ZWQgaW4gY29tbWl0IGUx
YjMzMmYyZQ0KPiA+IChtZXRhLW5ldHdvcmtpbmc6IERyb3AgYnJva2VuIEJCQ0xBU1NFWFRFTkQg
dmFyaWFudHMpLCBtb3N0IGxpa2VseSBkdWUNCj4gPiB0byBubyBzdXBwb3J0IGZvciBidWlsZGlu
ZyBsaWJ3ZWJzb2NrZXRzLW5hdGl2ZS4gVGhhdCBzdXBwb3J0IGhhcyBub3cNCj4gPiBiZWVuIGFk
ZGVkLCBzbyBpdCBpcyBub3cgcG9zc2libGUgdG8gYnVpbGQgbW9zcXVpdHRvLW5hdGl2ZSBhZ2Fp
bi4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2pl
bGxlcnN0ZWR0QGF4aXMuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vcmVjaXBlcy1jb25uZWN0aXZp
dHkvbW9zcXVpdHRvL21vc3F1aXR0b18yLjAuMTguYmIgICAgICAgICAgfCAyICsrDQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gDQo+IEknbSBhIGxpdHRsZSBjdXJpb3Vz
IGhvdyB0aGlzIHdhcyBiZWluZyB1c2VkIGdpdmVuIHRoYXQgbGlid2Vic29ja2V0cy0NCj4gbmF0
aXZlIHdhcyBtaXNzaW5nPyBMb2NhbCBjaGFuZ2VzPw0KDQpXZSBkbyBub3QgaGF2ZSB0aGUgIndl
YnNvY2tldHMiIFBBQ0tBR0VDT05GSUcgZW5hYmxlZC4NCg0KPiBDaGVlcnMsDQo+IA0KPiBSaWNo
YXJkDQoNCi8vUGV0ZXINCg0K

