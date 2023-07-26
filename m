Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B5E5C001DC
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 08:46:19 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.70])
 by mx.groups.io with SMTP id smtpd.web11.6829.1690361171621488082
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jul 2023 01:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=bmNQrAKo;
 spf=pass (domain: siemens.com, ip: 40.107.20.70, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vj/krzwxBSF0DaQBVy2XRc30Ydpy31eAD8QnyVvsY8jIOD0Nq756vbwu4ksK9QHfFuk1ZbJ3oWnHwC3JuyvZ+CxUQGj5iW/2nC8pPPW54/SnIO5XYDOThmXihEwFHewN7k2kvfDnogb771KL/S6Tcp4tJuR7WuB/f4d/8+4UIIIMklMj5ddKIBpsgXnAGq7MUhly0yBXMFrHQum+CHahq7Lwh2PkGoD90GRwhtglB60qpNl6cDeDolqNt1yGxIydlrOqHn1PEsuaoanS6DE9bnzRnIEXcNN2bjkgOc3YwDbL+NQXEqzRnEat77W7CxBo1ArLmMo+2Pb9Yb8lvNYMJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zw5IJ6KryFRQW0ym+PUqix3FXsggmIkbFhgDC7PiFEI=;
 b=WJ96Vzh9cvrY9mfGquthheaMtvY7atEX3IPHbmnSVbzQNVZhvberXrgFV/uNJsVK02kDgjergnimedRZ6A2LeJuRQH4nudkfD14vCOXg57fZBZjLWoOYsPCpnloBqhY8YKP1rUb6Y9leul8rMtQKAUgu0Q7WKyypUyz88wkf6bW+hvUKKuc9Qh8AHNPik9cMhQ3m9EJ5KiamSqImHlPe8fMQGFPmHxjdc18cJqTExyGMUqCaSfjBwzOLyDG6+Ot4R3aopZaD/y7xLVbz5oo1FNdoe8Cr4pinEre3Wbf2JIjoNtgYhu2WZLb0x+MOxExWvlsXhl2ESVh+usx7ZtV9bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zw5IJ6KryFRQW0ym+PUqix3FXsggmIkbFhgDC7PiFEI=;
 b=bmNQrAKo2BfGEK4Av89/LzVTF6NuwZjRAeM2j4zz706+DB3qj16cJ+Bvz9Eh8201Wue/gE20hg3XnRNknLYsbZqdFY2DYoagHkCIS6bHi8ibCdyiHoyIcf+CIqQjkQ/SlOVxyQN7S0ZUj3Kxs6ev30MSLEq+CtXBk96rJxEMmFizY8DaI6eaw6onGNez28amjt5pG3dQab7lh2uWGkasaZVTyJfKfuizPWA6hOY7UrYJHDpC9Yl2kP2AgSfndEd7bms33BkhnW+ZyU/PkckFpk9guATESydvy2Uu7wW8Sgxg8GIUEgadTrvVXfF2j3olzMsIHDwVctCb+Z4GIgkKVQ==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by GV1PR10MB6194.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:95::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 08:46:08 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1b9e:6317:5a95:9edb]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1b9e:6317:5a95:9edb%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 08:46:08 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cve_check: convert CVE_CHECK_IGNORE to
 CVE_STATUS
Thread-Topic: [meta-oe][PATCH] cve_check: convert CVE_CHECK_IGNORE to
 CVE_STATUS
Thread-Index: AQHZviMBksx6c2MNRUOdjk989bvkwq/LtJ4AgAAGXoCAAAP6gA==
Date: Wed, 26 Jul 2023 08:46:07 +0000
Message-ID: <0ef0267c66a001318d7dfac1543b3b70bc665c51.camel@siemens.com>
References: <20230724113527.141274-1-andrej.valek@siemens.com>
	 <23f21fb658e12efe80dce29b82c1fa87cd60874d.camel@siemens.com>
	 <CAMKF1sq0SUzD6EG1OoqwD-3uuC5j1BczOKQjb8a6=wKJJRf6jw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sq0SUzD6EG1OoqwD-3uuC5j1BczOKQjb8a6=wKJJRf6jw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3977:EE_|GV1PR10MB6194:EE_
x-ms-office365-filtering-correlation-id: 85fd3971-c0b1-469c-890a-08db8db4c136
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7DKfrg2bsttWo+DrGdOMy+tL4Aie1Epy3whEwNhMUk3z40vV8h2puBjBlURwj8sRd7u4pvZSfbX0oPt340zFXGmheIMwFpW4rgnkA7yGF7lxwfU179Ze1S/vw2GbkfW1OcCNc7hg03Ahaox0nWqWuPQ9Me+5AbjbARHdG0zjCSukcdUGZGHBiZHtbq3FjK8rRY/Ffzj5edgX+3zqo1IwzdfszTfwnt5Ywi74slwMJmNrREYUIXRzGQbq8y0Yb3lJfEEmTsfQ4cj1dbkdPppjbj/02/aRAVq2lNqx7bNiCG9HhF11OXxXvtpGzy8Q1/szkDOQ2R12jeiBphNWLlMwTVPhgEvsDwAc35+QOiC9bSswvz52r3qPxSlpvHqHV/kg2zJasy76XAcEtt8hCsK9ZLtPHZyvQJcsLY4zwWO8iysteOWLU35sZkfIHDqExV6nSCsppoi0UB3NGjF0EjeEIj/04REJrBlMQKF3LBk0dl53/BqgMydCHkKxpvlxw7BKt2hOC89b0yqxq0KyKM0fJHa8JOh53k+AxheILs5SyARTXlfmlIfrzW7Fimh2avmzzd2EHVr3gt6ee6Nfo1epiaENANxFuR+OpAKw7/clKdo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(39860400002)(366004)(136003)(451199021)(8676002)(8936002)(5660300002)(41300700001)(316002)(4326008)(2906002)(4744005)(6916009)(64756008)(66446008)(91956017)(6486002)(76116006)(66476007)(66556008)(66946007)(6512007)(53546011)(26005)(71200400001)(186003)(966005)(6506007)(478600001)(82960400001)(86362001)(2616005)(36756003)(38070700005)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QVBYdTBLNno0Wm5aZm1MekN4a3RpL21OTW5QU21sUXN2K3N6YTVrWUp0UEpv?=
 =?utf-8?B?LzBYWFU2djF3Rk5DK0o0bnVjQ3ZQZDNRZWxjQlJuTlJFdXVLdjFUYW9kQU9G?=
 =?utf-8?B?ZE1Ra0ZHQjQwemlST0RzN2JvLzFwZ1VRQWp6Sm0weG1Gb2ozVlhMK3VXcDB6?=
 =?utf-8?B?aGt2TDBCYnFlRmxSVGNBWFkyT2pmcHVJUE04Y1NVVzQyaFI1a0FrcHp2Nmls?=
 =?utf-8?B?cis3WDJuc0dQZjFQTVZuRmk3aXFOLzRtQmVsWGppWGpkbzN6VlVHcGwvOS9i?=
 =?utf-8?B?cVBoRnNvandveU5pTlJpd2ExaURaenF1NHFFSFJHb1d6UGRieWxRWEFYNGRX?=
 =?utf-8?B?bDFUS0UvbTFWbGtSdUdsdXZwVWJQUyt0a1J5cWV3dy9Xd1h4YUZBVHVNeis0?=
 =?utf-8?B?c1hoUXhPeVpNekZrSWVNdThWVjdjVGRIa3pBdXgxb3I5QXlRRDJocjdBcmNN?=
 =?utf-8?B?UEN6b1VxTE1vbkJDcDZibzF4SXoxbmlKREZmV1VVanJrQ3FGblduRzFwUjNl?=
 =?utf-8?B?eGJJRkdaYXFrUUl0b2l2eXlrMjN0U0RrQ2l5T0xtekgyUTl0ZU5PUWZBWUlM?=
 =?utf-8?B?aW5NTStjZkQ1bVZMVHpMblRLZ0ozaEZkOW0vMzUwaTNmM0I4cTZMSkhvTGQ2?=
 =?utf-8?B?RGxsb0ZXdFRPNFZYWWtYQ2d0VUV4bElkTkVOUmpHVFFGSlZZVW82N3NoeW53?=
 =?utf-8?B?aldVSU1XRjZqdjJyTkxjT0RwSmZOL21GVEo5LzhWUkJDeERWRjV2L1RSckxO?=
 =?utf-8?B?RlRya2taM2ppS2Q4UXlmWTZsQS9jNjlDb2dKYUdSbXFjSlpNZVlVZlN1Z1B0?=
 =?utf-8?B?V01hQnRRVXZNeWFCcVZmOC90WG43bkdrbGRabUtDb2RIOERwTTFON2ltM2Fl?=
 =?utf-8?B?M0JtQ2lTaWlRVUVrUFJuSm95MmZjeFRGcnBhYktJQVY2ajk1bGZjQ29lN0U2?=
 =?utf-8?B?U2dPaHhXT2NUTUo3R0ZmeWFUL3JhOGZURkxBMiszWkNiM0czZWFhTytXTFQy?=
 =?utf-8?B?V2x6REd6QjhoYUlONG12Qk1EOTdxekVQMitVb0RLNHB5WFdqSm5GaDRzMTd2?=
 =?utf-8?B?eTZNcWcwa2JucWpBR3BvL3JUMFVkNjhyTFJaekRiang3Ui9sZWtmbjBSTzM2?=
 =?utf-8?B?RmNkdmJnNDY3R0o3aGdsVDdYeGY0ZyszeHBqVmcrazdUK0FkM0ttMnVXQy9O?=
 =?utf-8?B?clZvcS9JSEFJblJtbmE5N21nbWhucSsrbDlYcXZ4bnVoNCtMd1BlODNVM1M3?=
 =?utf-8?B?K1dha2o1aHFzcFRpWWJMVUd3UUswMzE5VTBOWnNtYmlYSThyYkVQaGJ2eXBk?=
 =?utf-8?B?SGQvR043eG9kMko0R1hVYitSRjBzbjJldjdNT3BWTXVsdlZHUWNKajNQSUxZ?=
 =?utf-8?B?YkpWcmtDdEgyem1mTFNheXNNa0IxRGhxMk1qMldkY0h4Y0h0OXc2OFRlWjdG?=
 =?utf-8?B?ZXZOU3JZY3dNd3FhVEdtQ04xZ3AycXgwdXpYNTZOVytwUExQT2pPcTAwZFpO?=
 =?utf-8?B?ODUyelpTeTl6cU1nNEp1Mk5ETXJmdHk3QUpMa0k2UzJlaEtWZEs3WnB4cXhT?=
 =?utf-8?B?bWFLZ0sxUC96bWNwUHFUYmtUZ3pUNGZwUWVHbkkySEFkcExIZFFFWldZSTBT?=
 =?utf-8?B?VUhvWldhZ1NFTXJqYzdhMjZNUC9xdUl0dm42Vnp0QStPbjEwbG9FMGVUU21W?=
 =?utf-8?B?UkM0Z1dvN3d3WnUvdnNVckp0d3NlYnozeG5MQjR5d1ZXK1IwMW8xZmwyYXZN?=
 =?utf-8?B?VU5qbmgweWYvaEFrVHpVc05rM292NVB0SUIrRndWMXl3S055NVBWS3lJMmVt?=
 =?utf-8?B?QXpNc0syOGdBM1p1YUVYeEdCbWxnM3k0Y1hPYXBxNHZMemdtMGUvRlk5RjZC?=
 =?utf-8?B?QXYwa1NKTThibG5nRURWNytjeER0U0RCLzlMWTV5NnBteUJnMkxha1lEdVhS?=
 =?utf-8?B?NTFaektkMHdRU2ZpMlZHOEQyeFBXRVl2d0N2QnpnZ3htM1R5YXZTMVVNRVln?=
 =?utf-8?B?UWdScDVGekFhS2tqK2FEeUNSa1lJcGE0c2UxT0t0V21hVTh2S2RldTBlUmZP?=
 =?utf-8?B?NVFNWk1XU1VSSFVrbVRJYUxpSktsd0NaVEJaVVEvTXYraDZBWDBiZTlzSFZW?=
 =?utf-8?B?Y1BaWGtIaXpMQzBzaTRQSFUxa05zOU13RlpwMFVGVTNwWDM1UjlNWDdaMkNN?=
 =?utf-8?B?MHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <177877B147F70542BF8ECFF5F1E380D1@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 85fd3971-c0b1-469c-890a-08db8db4c136
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 08:46:07.8123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 92hwPtSdr0xFNqXkkWFDutcxa4Bw0bQpoKwmde6bIttq/0HN//Us6cBhRHDjOYnUSWajFoA/8UTqLVa3rIB0QdKX4JM7QxcRkXJdlZt4fMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6194
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jul 2023 08:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104033

QXJlIHlvdSBzdXJlPw0KDQpJIHNlZSBpdCBoZXJlIDopDQpodHRwczovL3BhdGNod29yay55b2N0
b3Byb2plY3Qub3JnL3Byb2plY3Qvb2UvbGlzdC8/c2VyaWVzPSZzdWJtaXR0ZXI9MTc4JnN0YXRl
PSomcT0mYXJjaGl2ZT1ib3RoJmRlbGVnYXRlPQ0KaHR0cHM6Ly9wYXRjaHdvcmsueW9jdG9wcm9q
ZWN0Lm9yZy9wcm9qZWN0L29lL3BhdGNoLzIwMjMwNzI0MTEzNTI3LjE0MTI3NC0xLWFuZHJlai52
YWxla0BzaWVtZW5zLmNvbS8NCg0KUmVnYXJkcywNCkFuZHJlag0KDQpPbiBXZWQsIDIwMjMtMDct
MjYgYXQgMDE6MzEgLTA3MDAsIEtoZW0gUmFqIHdyb3RlOg0KPiBPbiBXZWQsIEp1bCAyNiwgMjAy
MyBhdCAxOjA54oCvQU0gVmFsZWssIEFuZHJlaiA8YW5kcmVqLnZhbGVrQHNpZW1lbnMuY29tPg0K
PiB3cm90ZToNCj4gPiANCj4gPiBIZWxsbyBSYWosDQo+ID4gDQo+ID4gTm90IHN1cmUgaWYgeW91
IHJlYWxpemVkLCB0aGF0IEkgbWFkZSBhIGh1Z2UgImNvbnZlcnNpb24iIGZvciBtZXRhLW9lIGFz
DQo+ID4gc2FtZSBhcw0KPiA+IGhlcmUNCj4gPiBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3Jn
L3Bva3kvY29tbWl0Lz9pZD1jMTVlNTA2YTQ2NzRlNTU4OTIyYzVhNzU1MTJjYTJiNWMyOTZjZDQ0
DQo+ID4gLg0KPiA+IA0KPiA+IENvdWxkIHlvdSBwbGVhc2UgdGFrZSBhIGNhcmUgb2YgaXQ/DQo+
IA0KPiBUaGlzIHBhdGNoIGRpZCBub3QgYXBwZWFyIGluIHBhdGNod29yayBwZXJoYXBzIHNvbWUg
aXNzdWVzIHdpdGggc2l6ZQ0KPiBtYXliZSBJIGhhdmUgbm8gaWRlYS4NCj4gQ2FuIHlvdSByZXNl
bmQNCj4gDQo+ID4gDQo+ID4gVGhhbmtzLA0KPiA+IEFuZHJlag0KPiA+IA0KPiA+IE9uIE1vbiwg
MjAyMy0wNy0yNCBhdCAxMzozNSArMDIwMCwgQW5kcmVqIFZhbGVrIHdyb3RlOg0KPiA+ID4gb3Bl
bmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiANCg0K

