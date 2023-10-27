Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86890C25B48
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 16:10:47 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.86])
 by mx.groups.io with SMTP id smtpd.web10.10951.1698423042226607676
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Oct 2023 09:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Lg43TRJi;
 spf=pass (domain: axis.com, ip: 40.107.20.86, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHtVl77oWp85KgmbSjiDVqA2TfLkXyFt0R5FjW2/SXtRCWXl1o3Bmo1PohyHP3a+jtMOuKxsjL6czotWHVr6CZQiGpqBYeQNJuuw1yPABkR+7Y+EarbRzKbcd8s1UPc8reWtf9hUCfHMoLYYuug5lb3iANmito7HBRk8eeIpo/keYAjWLiUzcjq4WJfbPaJWXx70cmjkOXG2oBErdfsUYxQJcKajXp13qAUm1nC9m88VWnMR+R+4/oaewKnWSoD6UCuZ7mjCamR14TFydvI/oP5TRLhr/Pnehkenj6kKfBGoRBTrJhD6bOujWru0Kuz+pu7qmy+uUjNGPiLJReVcKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nF+xmEYedYCxSSbepTNf8Uefe38F/FrAdlm7PJihh/M=;
 b=iBHOPJLR9fajT738BWhC2mybZcboyA7yCPuubLONcVyi87UjcEVaIdJl1Z/7bEqUqLJhaiyOJ2QpLRXyap8A7lBTwvtMIVpZHF58iDTHs1RQEMl87P8TSpnocaTbL13+QGeRK3fjQ7j+JCG/s3oyRXFTt1wHm8qMhJmXgFw8VjzkaNO0/c2HjAObSoykFQoX7m1ivZNgMmWiu6oZgcdvNrZgCIFfGITwge2l0nrnZV3winNgLTQibWS87C1Cv6mct+SYVAAWP4G83VOh5LwcFKlA+elA6D2npQshBIxEtgXuaqvnpFLOGnXpUvY6UjnFs/mM3aqwRU9Ui3S4KA3XVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nF+xmEYedYCxSSbepTNf8Uefe38F/FrAdlm7PJihh/M=;
 b=Lg43TRJi3U++xlbjTobz6b59hfwZS4+Yu6/A5UuALDm6gwZgIlgv0ieLPRBZ58l4F4fgK9EP9gZIe+D+/f/WAw5IlkIjmuLkjlWaylh3dfQNwVCBXqubwjivgPAH7uqISAuYC614xYCJAx+qJ/AHiSxoft0gWDlxC6PgvqRQBN0=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AM7PR02MB5927.eurprd02.prod.outlook.com (2603:10a6:20b:dc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Fri, 27 Oct
 2023 16:10:39 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1b86:94ad:137d:4093]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1b86:94ad:137d:4093%6]) with mapi id 15.20.6907.032; Fri, 27 Oct 2023
 16:10:39 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-networking][PATCH 2/2] mosquitto: Support building for
 native again
Thread-Topic: [oe] [meta-networking][PATCH 2/2] mosquitto: Support building
 for native again
Thread-Index: AQHaCEjIx0I0IJVUbUiFlBOaV1vTvrBdEU1wgABCfgCAAHpokA==
Date: Fri, 27 Oct 2023 16:10:38 +0000
Message-ID: 
 <DB5PR02MB10213A5E4491D1D392B1F61C4EFDCA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20231026132203.3840009-1-pkj@axis.com>
	 <20231026132203.3840009-2-pkj@axis.com>
	 <2cbe64d28d7e2655f109b45d0fcf8b4317367c72.camel@linuxfoundation.org>
	 <DB5PR02MB10213D8CAF3145B001F1BC75FEFDCA@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <dd6e6c3fd32a5dceca5cdbfd2e957a078f8551d5.camel@linuxfoundation.org>
In-Reply-To: 
 <dd6e6c3fd32a5dceca5cdbfd2e957a078f8551d5.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AM7PR02MB5927:EE_
x-ms-office365-filtering-correlation-id: 26d63b94-7ae6-4970-8fd1-08dbd707427a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KGEe9CTVH/csQ/87alS5uU/wZ7WUUX8qbL+hOtuS3t1CXv983/EEhbvuvRo1FJ1Ume8DYTgKEbflCwq4TaEVvurzu0haP7hZ6ElQqpdvBLqIDGWXg9GgHzagfv1BRQgKjBwF3mwr+MqaY+Yu0N9r9NdYsD3EboqwW8Bu7pgUs8tifRtr6ZQGLM8FWKb7KRgojmHphLHTb9dWEAk56hUY+FhaoU5Q1qPUuopPAuw2ANWCqzf+xO+zvAFMrNQIzEh4vXwREqdzn0JkiBhTBMeXg9/6B6EDxO2xUefXPlgj18Br495+15+wp9+fGhRuJjYsUomDXnAR//iw/Xc4Z79fTuQ6UsGeoLr7BfzYCyV61jjkIxC81u+LnwJwq/8xXlLhSvBKOscVKyU4M1S/jR2N5ZIOHaRrxWzxVxYmsUcbOdO8uC9AUpiEk/5Lotp/0oeBxdERtt6HL09CB6u+09KAyekaUo+Uq1bAXPu5eZ5Evlg+tkOvepqmkxjz6h5Y0jP/nfenPzaVSIAp7PFL6X962/GvT58sXCrl30ErvCn8RUVLeLzi8tStShyXHhRRidF1bf/X3Xz7NepshTzB5EYJe7L5xlSFkY/sYKIpxc1uLI1zPdqopCL8vGjbb8t/+xfa
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(366004)(376002)(136003)(346002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(64756008)(66446008)(66476007)(66946007)(316002)(38100700002)(66556008)(110136005)(122000001)(478600001)(52536014)(76116006)(41300700001)(86362001)(44832011)(8676002)(71200400001)(8936002)(5660300002)(9686003)(53546011)(6506007)(7696005)(33656002)(38070700009)(4001150100001)(2906002)(55016003)(83380400001)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?c3lLZUZlTG1ER0tINGRiWmtEZWlCWkpsSm4veERxUkZXQUpadkt6bkVuYnFz?=
 =?utf-8?B?TVNhc2QzL0hPcC9QdGJnQ0FsOFRwdmlzOG1aUGx0N1FQRmIyTmJ5WUpuaHZ3?=
 =?utf-8?B?TmwzTW5NWTVuWVVqanR5L1hOa1RwZURqb2lPc1h6SGx1dEd1ZFFocnBBQ1ZG?=
 =?utf-8?B?K0hNelFUWGRRRmRYUkNMazIwTGc0WlhJZVg2dEZOaXZlNWlZOHVzSEdyQWJs?=
 =?utf-8?B?MEhxRUZUa1BSeWF1eEJYMTRrbUtWTWpZNzFQVDJXUGt6OHQ1REFHZ1FJVHhw?=
 =?utf-8?B?c1hpb2RHWWVKZDNuVjNpMUlzTVN0bkJJMVlGeHdDN3F4M0FHWUwyNlcyK3Fh?=
 =?utf-8?B?Vkd3aE9qRUpYSWswRVQyclo1Y3craUhobjdwRjA0c1Y5UXlZNFdXM0tPeGNv?=
 =?utf-8?B?dytsdzVOR055ekROZm1XdUJjQUYyelZId01rUFRyWVpRR28xc3FiVHIxMEg2?=
 =?utf-8?B?ejUwcnlCZDU5MEJHTXVWa1E2cGsvTVg1TTRDTWlwRTVyZEdPZ0Zpc05qV3dm?=
 =?utf-8?B?TWI1VmIzcjdTS25PaW9ZWElyTWRvZDAwWU1ueFhhNFRvWE5rL0RwQTRVYVpE?=
 =?utf-8?B?bWs5Y3JYUHNQaEZwK1QxaG5Jd0E1QUJVTkNtSmZ4NEdack9EUEZaRVBSOUFW?=
 =?utf-8?B?OVduK3I0aEVBSmFZUzZ1Z3dMNWloa0daNlAwZzZTV2RZZkFneXlVdVluL24y?=
 =?utf-8?B?NWJPMy83OXdzNi9lWk45VDJYYzYrS3ZBeWQ0OENLQzBSeEZtNDVFMGszbFVB?=
 =?utf-8?B?dmNlVzVHbEVCZnlmYVRQUXp2ZlFZZzV0QVlQNzlsVVRaSDRQN0pjdlZDVVBL?=
 =?utf-8?B?SGZmWlhxSGlOZ0wzaHNBNWQrZ3FlaTF4aytPMVhDNjkzai9ialYxVUsycHo5?=
 =?utf-8?B?RTZ0YW00WmJxcWxleU9uYXRSSDUrNHl5TXkvVDVCS2NPdE9CN3pGUi9wb2xH?=
 =?utf-8?B?NmpnaXI4c3QvYUNsTjZnakI3OUE2QjIxdm5WSGNycFRNU1NRNzFMRXE0TGdJ?=
 =?utf-8?B?T2luTStkUXBMZlFid3ZKY3U2N0psbWV2dExaNnF6VXpCLzRyaGdGNHA4eVBE?=
 =?utf-8?B?NStheVBKVW1JMzRFYTdHM0tNZys1YzFRaFEzTW1sUno5OStPWFhWcWhaY3M5?=
 =?utf-8?B?WHRwM2ZieUpGYlJWUisySllvTkZLOWJSWmRmSmpXdE1uUmlIWkFHdWp0MllO?=
 =?utf-8?B?UzQ4a1FVRnNqdEdJZ08yYWE3UE1xYVFTSTM1YXBzcFBGL2ltWW9venVOYnpJ?=
 =?utf-8?B?YzArTTBxZW9wOTJtTDBuamF6RjRYU3haM3J2MGhLN250Q2VaUmlVMFBlcTBw?=
 =?utf-8?B?S1pzV0x4Uk5wWkxHK3V5MGMwYnFyK0dGZThBZ0hWcUJodTg0bGVuQXVVT3E0?=
 =?utf-8?B?RFB3TnB6aXluQ3d6QW9ZdmZsRGlQMCt5TlBpOHQ2ZHNhMG04NFRXYmNxNVAv?=
 =?utf-8?B?cnY2NVJLZHhRaUZ0QmFmckgxNEJtZUdsVHgvL25GKzlWUEI4WVIxU1dNdERw?=
 =?utf-8?B?TElvT25WdGRjQ1RkdWhlU1ByZ1dzQ3BEd2ZSSmI2aThEQ3g4SjZ3bVh6bXlp?=
 =?utf-8?B?cFZVZmM5a3ROY3JWUVFGN0RwS2ZmMm1VQ1lZbDFnY3hNVXZId0JvSjQ5NWw1?=
 =?utf-8?B?MEVCaEVWTXpsWS9lbXVZOFo0eHJWQ1BiSXQ3TitkOGdCL0ZQU3dWd0taN1pm?=
 =?utf-8?B?MEtxb1lJSnloTVN0d0tvaWlsNGgyMFE4SGpsWmRiUm5FSFhHcFRTSzVMem8v?=
 =?utf-8?B?Z2hLMStXbFhia1FZK3JuNnlCYmtST2s5dnpPbUdKT0d0eFpLNXlKSjMvMTAw?=
 =?utf-8?B?ajl6NWRxSFJsRzJrSlkvb1hrN1dndzNlb1VrNUwydXdTZCtDUmhiTTlmbkFY?=
 =?utf-8?B?MVZLY2dKdTNucVNzTytrbEIrZmRBREFNd2lES1k5SjRPOUZRTGFkenNnNDlm?=
 =?utf-8?B?TnFLbzR6bktYKyszNXJrQm9oRTZQOVJOWmVNOEJvSUNsWWZDWkh4SlppaG8w?=
 =?utf-8?B?Uk1MMms2MHVLeTdRc0plYkdYZ0RhVk1OZlh2aWhSVDNGREx1ZDRhV0hSNnJO?=
 =?utf-8?B?TzQ3Rms4UFJ2d3BDSW1qa21pZ1pLOU1jRXQ4MG1OV3o2OWdFOEMwN3h1eklF?=
 =?utf-8?Q?4n+w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d63b94-7ae6-4970-8fd1-08dbd707427a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2023 16:10:38.2964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yv0gf7WZsGGcsxJRoQ3BOL9xFyNBM0UPy1R4/HHNDIna3NeK3bY/ZuayIc8OaQ6o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5927
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 16:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105777

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogZGVuIDI3IG9rdG9iZXIg
MjAyMyAxMDo0Nw0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRA
YXhpcy5jb20+OyBvcGVuZW1iZWRkZWQtDQo+IGRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
Cj4gU3ViamVjdDogUmU6IFtvZV0gW21ldGEtbmV0d29ya2luZ11bUEFUQ0ggMi8yXSBtb3NxdWl0
dG86IFN1cHBvcnQgYnVpbGRpbmcNCj4gZm9yIG5hdGl2ZSBhZ2Fpbg0KPiANCj4gT24gRnJpLCAy
MDIzLTEwLTI3IGF0IDA0OjUxICswMDAwLCBQZXRlciBLamVsbGVyc3RlZHQgd3JvdGU6DQo+ID4g
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogUmljaGFyZCBQdXJkaWUg
PHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+ID4gPiBTZW50OiBkZW4gMjYg
b2t0b2JlciAyMDIzIDIyOjEzDQo+ID4gPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5r
amVsbGVyc3RlZHRAYXhpcy5jb20+OyBvcGVuZW1iZWRkZWQtDQo+ID4gPiBkZXZlbEBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+ID4gPiBTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1uZXR3b3JraW5n
XVtQQVRDSCAyLzJdIG1vc3F1aXR0bzogU3VwcG9ydA0KPiA+ID4gYnVpbGRpbmcNCj4gPiA+IGZv
ciBuYXRpdmUgYWdhaW4NCj4gPiA+DQo+ID4gPiBPbiBUaHUsIDIwMjMtMTAtMjYgYXQgMTU6MjIg
KzAyMDAsIFBldGVyIEtqZWxsZXJzdGVkdCB3cm90ZToNCj4gPiA+ID4gU3VwcG9ydCBmb3IgYnVp
bGRpbmcgZnJvbSBuYXRpdmUgd2FzIHJlbW92ZWQgaW4gY29tbWl0IGUxYjMzMmYyZQ0KPiA+ID4g
PiAobWV0YS1uZXR3b3JraW5nOiBEcm9wIGJyb2tlbiBCQkNMQVNTRVhURU5EIHZhcmlhbnRzKSwg
bW9zdA0KPiA+ID4gPiBsaWtlbHkgZHVlDQo+ID4gPiA+IHRvIG5vIHN1cHBvcnQgZm9yIGJ1aWxk
aW5nIGxpYndlYnNvY2tldHMtbmF0aXZlLiBUaGF0IHN1cHBvcnQgaGFzDQo+ID4gPiA+IG5vdw0K
PiA+ID4gPiBiZWVuIGFkZGVkLCBzbyBpdCBpcyBub3cgcG9zc2libGUgdG8gYnVpbGQgbW9zcXVp
dHRvLW5hdGl2ZQ0KPiA+ID4gPiBhZ2Fpbi4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+ID4g
PiA+IC0tLQ0KPiA+ID4gPiDCoC4uLi9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tb3NxdWl0dG8vbW9z
cXVpdHRvXzIuMC4xOC5iYg0KPiA+ID4gPiB8IDIgKysNCj4gPiA+ID4gwqAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspDQo+ID4gPg0KPiA+ID4gSSdtIGEgbGl0dGxlIGN1cmlvdXMgaG93
IHRoaXMgd2FzIGJlaW5nIHVzZWQgZ2l2ZW4gdGhhdA0KPiA+ID4gbGlid2Vic29ja2V0cy0NCj4g
PiA+IG5hdGl2ZSB3YXMgbWlzc2luZz8gTG9jYWwgY2hhbmdlcz8NCj4gPg0KPiA+IFdlIGRvIG5v
dCBoYXZlIHRoZSAid2Vic29ja2V0cyIgUEFDS0FHRUNPTkZJRyBlbmFibGVkLg0KPiANCj4gVGhh
dCBleHBsYWlucyB0aGluZ3MsIHRoYW5rcy4NCj4gDQo+IEluIHNvbWUgd2F5cyBhIGJldHRlciBm
aXggbWlnaHQgaGF2ZSBiZWVuIHRvIGNoYW5nZSB0aGUgbmF0aXZlDQo+IFBBQ0tBR0VDT05GSUcg
YW5kIHJlZHVjZSBkZXBlbmRlbmNpZXMgYW5kIGJ1aWxkIHRpbWU/IFRoYXQgYXNzdW1lcyB5b3UN
Cj4gZG9uJ3QgbmVlZCB0aGUgbmF0aXZlIGNvbmZpZyB0byBlbmFibGUgdGhlIHRhcmdldCBvbmUg
d2hpY2ggSSBoYXZlIG5vDQo+IGlkZWEgYWJvdXQgdGhvdWdoLg0KDQpVbmZvcnR1bmF0ZWx5LCBJ
IGhhdmUgbm8gaWRlYSB3aGF0IHdlIG9yIGFueW9uZSBlbHNlIHVzZSBtb3NxdWl0dG8gDQpmb3Iu
IEkganVzdCBtYWtlIGl0IGJ1aWxkLiA7KSBTbyB3aGlsZSByZWR1Y2luZyB0aGUgZGVwZW5kZW5j
aWVzIGlzIA0KZ2VuZXJhbGx5IGEgZ29vZCBpZGVhLCBJIGRvIG5vdCBrbm93IHdoYXQgdGhlIGNv
bnNlcXVlbmNlcyB3b3VsZCBiZS4NCg0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQoNCi8vUGV0
ZXINCg0K

