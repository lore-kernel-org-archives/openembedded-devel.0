Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6928EC98321
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 14:03:40 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8904.1790345013038828038
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2026 07:03:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@de.bosch.com header.s=selector2 header.b=IO2cWtYS;
 spf=pass (domain: de.bosch.com, ip: 40.107.130.60, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWmWbVctO2cdJioRP1dLaoUT7penQedBebDb7tgMa2F/uFh8+uf1MAkJYvFI7jQtRmY4wMGl/3c+UyEqceEWQFamRP1N1fD6KueCfbhh3IBeGR8cs2SEBAORR9biBIH4FX8rQpgu5IubykyTpnwTkIU2K/TwXuD2LJF11ZumP1CE2cplTMAUan9H+xguLkW5JtC3403zpmOHPBYDYKQyK9qiG/vcaUSz3zn7CKrJu+0nInmB7dM9K7COjC/shWQpkrXs/rT3FK6k+S58+d8rChMvRkfyu4ASWAzNqonaXZWkXQ1DKwFM4RqG6pknzTF0JZ18dLI7BeZ6fKGviR4S+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8QiUv4AhmjHXUOOysfoUhRI5AWFWDoW3k/vlvZgEls=;
 b=bq55tscdqR9jMvREHGCw9zM0uNwWU+xs6Ws5hEf/4Y3PHozo5oNNSYYjX1BY2hXowN5mTk8L13NGRMK1HUulBYQeo64rzjOuTaQEoklOoo4bghfTeAKJp0iQEGmT6Geo9Y8s6vAlNl8NjMHygRsePWHIyh101Sr88aseMuVKMIp+OO1pca9mWY5ZhxFK3bGbXO2R+LB8V73pM1+A0f0UqEwZU1kvcnlkgX+tYajNwSQZcyxUBs5druVCO3dt9gDMtU/eqOXi3aSHNCCrAZscbjCGYOJhJAulwinL/t6no/NhfuwOxbLSfVoO1w0D0QVwqi6M8DhctZvKA8fTNmVdBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=de.bosch.com; dmarc=pass action=none header.from=de.bosch.com;
 dkim=pass header.d=de.bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8QiUv4AhmjHXUOOysfoUhRI5AWFWDoW3k/vlvZgEls=;
 b=IO2cWtYSLazh9Wh9MXUxLQU94MHu9zGH0cc4xdbUjnFiSpziu1YvDM3Vdg1c1IN9Gb8JOboC2cn5AYiUCRQJHPk+AmE1Xr5sx9KLS+z89fDEDgfsmVKBZubDzb9YEJx/Z6PTUo+xx2Olz/KjIhKZsi+3BALCYMtOSeWjlllUK+sBHJqQsz42LecQsJku7pF9jclz6RK4Mj6sGnwLtdF5T/ax4KO+WDMzPlxg2k3d89FpxjWHsdpD73li9IUnZYjM+tS/AV2eBW2JQtjMcz9IdcCm/VguVFyy4NCo/gdQEVqj2Hhs0AnWadswjlj1GFsIOXuvVFBh/1qutgRFFdHBBw==
Received: from DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:338::11)
 by AMBPR10MB148947.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:7b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 14:03:28 +0000
Received: from DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5dd6:d284:1ca8:ee9f]) by DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5dd6:d284:1ca8:ee9f%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 14:03:28 +0000
From: "Jonas Mark (BT-EL/ESW1)" <mark.jonas@de.bosch.com>
To: Bartosz Golaszewski <brgl@kernel.org>
CC: "bartosz.golaszewski@oss.qualcomm.com"
	<bartosz.golaszewski@oss.qualcomm.com>, "khem.raj@oss.qualcomm.com"
	<khem.raj@oss.qualcomm.com>, "Simoes Ricardo (BT-EL/ESW2)"
	<Ricardo.Simoes@pt.bosch.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "Jonas Mark (BT-EL/ESW1)"
	<Mark.Jonas@de.bosch.com>
Subject: AW: [oe] [meta-oe][PATCH 2/2] libgpiod: add missing CC0-1.0
Thread-Topic: [oe] [meta-oe][PATCH 2/2] libgpiod: add missing CC0-1.0
Thread-Index: AQHdTPN3WLALM/CAgE2+esrOlsXGi7bfUayAgAAAUTA=
Date: Fri, 25 Sep 2026 14:03:28 +0000
Message-ID: 
 <DB9PR10MB5354348A5D98BF744C883337AD802@DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM>
References: <20260925133929.1991-1-mark.jonas@de.bosch.com>
 <20260925133929.1991-3-mark.jonas@de.bosch.com>
 <CAMRc=MeH8bFxdrrA3MA6+Zz90As_ZP=nOCyoeToSH8NzAU-5Nw@mail.gmail.com>
In-Reply-To: 
 <CAMRc=MeH8bFxdrrA3MA6+Zz90As_ZP=nOCyoeToSH8NzAU-5Nw@mail.gmail.com>
Accept-Language: en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=de.bosch.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR10MB5354:EE_|AMBPR10MB148947:EE_
x-ms-office365-filtering-correlation-id: f1e2f31e-e4f3-4fd1-5510-08df1b0dc61d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 uJXMhSFxqpJ/ujHX+ylLjBPZVYD5UlOW8iw36MdSc71rfJKYEk4vt4RPH1vovOnjyh52HN31diBXE2+Uj4yMEhpFQrowDuzxxv5GKGZjeUaLwAimGA7DpO9NPY5TfPMyys/UOun8RjWcbxFcc8uYy/1dYGM1fpLlH2wBuf5vm/oiQCg8HNtFZKmio8dVk/kTuMnbPxjrp89pPM6ivVeijJspw1/4296wkq/G5WJ3BWU7ILU2PxoMXev+clg0+9PYVPpPmOBD+rbUY/x0LrZdYUN4UfzsiO3lghIvpxBNWxmLTZ8rycvdTB2MPk5ECtGyT9AMOnmZ6XBbxH2+3fy44hikHRfH743n4rIFpVf4eqqNTdrC6L21Y6gghRxOMMl+fk01i+UiFd57+ScKdQ8DSSuKGZJrNeLxRB85+Ur8Q0he3Jr2/fc1PmYQsAv6Z9x9hyc/EY6S/tHqXyoIHTdNGHT9JcL2Sc+PRhDlsHOU9qJjaGg7uP0s6R37t8BZG09RmrK6kgPvRocf5BRiES2lhUNbT1UB0XEcTZFxXJsgiGmU00wcdSiU91LPVVPSsH3XH5nkdEcv5vXx7YB2FT1C+02pYiJ/2FPlv5TyoNwkAk7iXREggNRnG1/KLXMtqRQT73SDtqDYeQxlXRB6J6sPD6dAycWuQCAHJxYJLiVbReOuwa5yCh5qkumsdT1cyC2YmSxuEgJcuoyOasuMwt0YkOpogn+7yiAqv1HBYUYu7rg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZzMxcWRPb0J3SlA0WStjeVBKWXdKdy9qUDIvaTNuK2V0R3JzeTV6c3ZIRUNB?=
 =?utf-8?B?MUhZUjFQdTZaejd3R0xiTFVnTmxsS1ZFSy9OVmU4d1ZnVVlPNGtwTDRIR2hi?=
 =?utf-8?B?bGNzNXNteEhBeTR3eTI1YkVDdXJpMllkaEhCbnhHZFRtZ1BSbnBIK3dJSnlU?=
 =?utf-8?B?QXBYeHdOaEdOZExSQ1YzNTdMWEcwaTljV01ENnY2WFI3OTJPZTM1RmRUTTNv?=
 =?utf-8?B?NXBDQnBRUG5BVkxEYkpNZDJTck54dlZWOFQ4SW1pdlg4NmY3WWhzem5CWmNQ?=
 =?utf-8?B?aW02R1RPZHcvOVVXcHFwc0ovQXZzWDJUckZrcnNWYUIvVjFyVlJWUUNkanVw?=
 =?utf-8?B?QzgveE1kTjB4L2xhR1BOYzdBc2crTXIvSzRzblltOGZGZWIyRlhTNXdyZVQx?=
 =?utf-8?B?cDRRY3VCeU5YZHBlSFNuTU1EMFVUb2J0Q1puUDVrbDRldzZ1NWFHVVdOL3Jl?=
 =?utf-8?B?TmRGanJkdUpFZzV0YUg0NytWUW5oMFFtY21MSUp5UGdWaUJ6dVdwNlZtS093?=
 =?utf-8?B?VGZ6emlqMW05TXlyWTk5cXl4RUFXdEJUSi8waTJxdDZIRWRWbVV3NFV4S3FH?=
 =?utf-8?B?OHpldjB5RkdLL2t0aVpMaW5ZRUlod295RzZxVFZrYWRVNFNHUWxMQlNyRUpE?=
 =?utf-8?B?RjlMdHhYQ0ZPUWlmeEUzTXI0dm9KRTVma05yT0dSZnRkbDkvSUU0REdKQmo5?=
 =?utf-8?B?cGZORUNiam5PWjVuc0ZBMzhYTXZOc05tUlovbDR4UVVmUTFVbEJ3WVpzVE9s?=
 =?utf-8?B?WU8vUml1Z1huSUpHcDNzNVZTRWcwLzNOZ3J2RXM2N0tscmtpL2d5QnQvVDR1?=
 =?utf-8?B?L3hvK29uODdoZEdZZmRxS25lOGNBVXdaNG5KZVJGQTFRcjNFZFV5bzFlbitH?=
 =?utf-8?B?a1FISUJZUTU3Y09BQnJnNVp2MFBzbm9tb2pyczFNUnRRQ0RRRjZJVVdYWE4z?=
 =?utf-8?B?N3JkTndxRDNvOGNwNGJwUzNyUHZZazU3R1dMQzNibEJtdGcwT3JCQkFJSlFV?=
 =?utf-8?B?ZXl1alpyVVZhZi9QdGVqWjNrcXpHVm1pUmVEeVpnZlFidFcvakhTeUs4czRQ?=
 =?utf-8?B?Sm5wbG16OE9INU4yTVlxbFgxWW45cUF2bE56RTVnU1d0RWtaVUlMczEyOWRV?=
 =?utf-8?B?Zm5Kd2hNMFBnaEp4azQ3WE5qVmlxYzdMWVFUUW9LdzFtb1FTZXorekJVMnV2?=
 =?utf-8?B?YXNwTWdoMHAxMWlra3pib2hIbEpDNlhtbnl6NllKeXBheXQzbGVVZXhlbnhD?=
 =?utf-8?B?dmZLSmR1U0dqeEVrY3JxMkFlZTlFaTY2a1Q1TEZKNjRNVHhnTEp6Wnh1N2Nj?=
 =?utf-8?B?cFZxUHpkOEdYRnZHREh4WHIrNWhmYmgvc0tHUDVkK0QxaFRSYlFLUzlORHVk?=
 =?utf-8?B?bzk5VWhRcTk3ZHpIZS9WenI0QWtPUDF2Rmk3OVUzK1oxVmVrMDB3MWFOaCtI?=
 =?utf-8?B?QUJBd0E4UmJiby8vRHd2OEZ5dCtreTlkZ2p1Z2RYOU8weHJ4ajVBdHl0dG1q?=
 =?utf-8?B?NCszMFExamNpblBvUGpqcmJ0NllKT29sQ2xIZDAzdklMTjRqSnNDVDhyTjND?=
 =?utf-8?B?dTJNMEdGbFlSV1hJNk5LTENjS1VsK3NScG1RT1FKQ3Z5Umtyc21jZ3RHTEF2?=
 =?utf-8?B?WkQ4U3JTNjZXVm40UzlNZDhYOVcxRlZMZUhTempmMzBFdFpLZW00eEpLQyt0?=
 =?utf-8?B?ZURzWTJNbWdwOUdKWlpJT2NWL3B4REwxeUVFRmxhMEhIWE5RaXkwTVFNS0N4?=
 =?utf-8?B?V1U2M0VqQ2NGZ09TZ01DSjVoNDA5V1AySkJpQnQ4ZENGb09GVVNXY2lBaGtY?=
 =?utf-8?B?dkxETWl0RmppS2NpRjJZMEVPRDd4S1c4dmhlaW9GdGMwWnhldFBPOVdWQ1ZZ?=
 =?utf-8?B?eWx2dk16ZElXYW5WNTQvYmc2VXhvS1BEN1NMTHg2aXFHWWwvM0VOdkZaSlVC?=
 =?utf-8?B?UWV6OWs0S1pxalJGbFZnbUwxY0s0cVF3bTB0SENCMFR4Qk9NR1FYeWVQOVZO?=
 =?utf-8?B?bWFIeG5HdC9VNHYreFd3VE95RGxBTDZDVU9BNS9SbHhKMTI3MGdqbmdFSGI3?=
 =?utf-8?B?aWgwT3BEVkRIL29FYjZIK1pwLzRpVjljdGZqekpTL2MyWFV3YkxoV3FxOHY0?=
 =?utf-8?B?U2RWRVBOMkRVak9laXM2ZUk2V0QveGxmYTBJSlNZeHYrcWZpS2Q2RENXQ081?=
 =?utf-8?B?Y3NyZnR4aytseUJsYkRodzlkVExzZ0tkY2szS2oybVQ2STI0N0tRaURyUEND?=
 =?utf-8?B?b3F4OTlUd1NCRysxaFliYTVvUzAzNFpnZEhyY1pHVU1menFZTXhwVnNRYUV2?=
 =?utf-8?Q?n/UCA6IdN9TzkQpjA6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e2f31e-e4f3-4fd1-5510-08df1b0dc61d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2026 14:03:28.1565
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CXyokJGvmFhHVXoEoaK0k8DFm/hZDIue1aPd6N4saEG5L8geiFeRP2ItlA1TyKEqV8FeIUdMv3OM2ENk4xQwXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR10MB148947
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 14:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130303

SGkgQmFydCwNCg0KPiBCZXRyZWZmOiBSZTogW29lXSBbbWV0YS1vZV1bUEFUQ0ggMi8yXSBsaWJn
cGlvZDogYWRkIG1pc3NpbmcgQ0MwLTEuMA0KPiANCj4gT24gRnJpLCAyNSBTZXAgMjAyNiAxNToz
OToyOSArMDIwMCwgIk1hcmsgSm9uYXMgdmlhDQo+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmciDQo+
IDxtYXJrLmpvbmFzPWRlLmJvc2NoLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBzYWlkOg0K
PiA+IEZyb206IFJpY2FyZG8gU2ltb2VzIDxyaWNhcmRvLnNpbW9lc0BwdC5ib3NjaC5jb20+DQo+
ID4NCj4gPiBUaGUgcGFja2FnZSBQTi1tYW5hZ2VyLWNmZyBpcyBzaGlwcGVkIHdpdGggdGhlIGZp
bGUgOTAtZ3Bpby5ydWxlcywNCj4gPiB3aGljaCBpcyBsaWNlbnNlZCB1bmRlciBDQzAtMS4wLg0K
PiA+DQo+ID4gVGh1cywgaW5jbHVkZSB0aGUgQ0MwLTEuMCBsaWNlbnNlIHRvIHRoZSByZWNpcGUu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBSaWNhcmRvIFNpbW9lcyA8cmljYXJkby5zaW1vZXNA
cHQuYm9zY2guY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IE1hcmsgSm9uYXMgPG1hcmsuam9uYXNA
ZGUuYm9zY2guY29tPg0KPiA+IC0tLQ0KPiANCj4gU2hvdWxkbid0IHRoaXMgYmUgc3F1YXNoZWQg
d2l0aCBwYXRjaCAxLzI/DQoNCldlIHRob3VnaHQgd2Ugc2hvdWxkIG1ha2UgaXQgb2J2aW91cyB0
aGF0IHdlIGFyZSBhZGRpbmcgYSBsaWNlbnNlLiBXZSBkaWQgbm90IHdhbnQgdG8gc25lYWsgaW4g
dGhlIENDMC0xLjAgbGljZW5zZS4NCg0KU2hhbGwgd2Ugc3F1YXNoPw0KDQpDaGVlcnMsDQpNYXJr
DQo=

