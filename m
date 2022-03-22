Return-Path: <richard.leitner@skidata.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6AA4C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 08:16:55 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.100])
 by mx.groups.io with SMTP id smtpd.web11.7240.1647937011794153122
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 01:16:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=z4/OdLTr;
 spf=pass (domain: skidata.com, ip: 40.107.21.100,
 mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVWE2Y4vrGFfIgiU1aG5MlXce4nZoh7/W+uYrqDNEeoxGJYUBhuy8iFhbIGApUE4E8fKyhVefb4tB5vM1KC1/fjVaoBS8MKNfZfQxZ+8P6dfxc5aU6Cm9POKFRJRtYtV6mSidZE9QfWvG76tppar0vnqAlwIyYRk60jBRAkNwvkM/p6yUVAP35/5KwjkQe0nPfVmEzb56Hh/zRO/o89i5sDcgWjRl04INIlSF+c0jkHLyZgaURiPwPtWwrzVcwmcFBggqyPAQ4RqZWD+dPvCfM4980N0V3WMIcOMgZUvK9bYJyB0V/Y1XM0ouxaqpqrsI4gdC6KPExnasxPKNQRnYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7G5asdgWujAwFBAD8aMlB5yzfL4h4IPiNyCqFYmrXM=;
 b=NeQkMzOzkxXS/d3JGfSNcC08qWiiZ6Yqn5ZmvmyE1enTJNEBoc0KuNnhWepivUMN4d5pD+jO0TxKZO3Ng/9Ygfz/OjLgCBxjnBFcbxC6C5CqwCEeJJ2lPxJxq26DSi3RrkaOng6ee9wVPp8VnisezWmAEEwnqg/aB96XPpO+SKzxItzQPzrF/9h+XyOcR9Jb3J1s0X+jMCpGo2RqobSFEzVBtnLJf/K/pxG/qWM7P674hDsgwIvhbHnn+BpXMgEpWmzwvidsCPOYRBuO55IOha8oVkvdVlX4TcXcbqN/TvWwKdYRp67QUvVYqwf7aY6oe0RSmgRjJwEqoK2Y8suwug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7G5asdgWujAwFBAD8aMlB5yzfL4h4IPiNyCqFYmrXM=;
 b=z4/OdLTrJOPYX+iSB1pAMByGHV29QYNaIxqzhDKWyVXuNc1I9HRvJZP9hhBWZpCdzlqGk6rGSxrC4sgA0fyK383r086U+JfBmbaxu1HWjUHMUGTbEF9/LTWMHnVFwYHMXOERCwJKZ0lVLK2Sowv1+LdRZ7nrYVmFL2fPRMvzZ6F+D3za59WJTE26ylyrN32ZTaRWUOiK7Yh7H49uq8Guy/iZE4IWQF3omUsXwg7bcguf0EmUqII302SoPoUE1Y6d/yjqqvYd8cSt6MiH8TrVGUBdlH30DBvPLZ8xRNkDSBL9btw3JM1/De/maBt8URfbg/w7vF2a5BiHIe7EWxPX5Q==
Received: from VE1PR05MB7376.eurprd05.prod.outlook.com (2603:10a6:800:1b3::19)
 by AS8PR05MB8502.eurprd05.prod.outlook.com (2603:10a6:20b:3cf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.23; Tue, 22 Mar
 2022 08:16:47 +0000
Received: from VE1PR05MB7376.eurprd05.prod.outlook.com
 ([fe80::980:e7b9:5c2d:ece3]) by VE1PR05MB7376.eurprd05.prod.outlook.com
 ([fe80::980:e7b9:5c2d:ece3%9]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 08:16:47 +0000
From: Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
To: "zboszor@pr.hu" <zboszor@pr.hu>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Henning Heinold
	<henning@itconsulting-heinold.de>, Otavio Salvador <otavio@ossystems.com.br>,
	=?utf-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Subject: Re: [oe] [meta-java][PATCH] classpath: inherit pkgconfig
Thread-Topic: [oe] [meta-java][PATCH] classpath: inherit pkgconfig
Thread-Index: AQHYPaw+b5ZjNJT1GUuVm+YBovgc0qzLDvuA
Date: Tue, 22 Mar 2022 08:16:47 +0000
Message-ID: <YjmF6aa8kI9m7/Jd@ltleri2>
References: <20220322051740.2214007-1-zboszor@pr.hu>
In-Reply-To: <20220322051740.2214007-1-zboszor@pr.hu>
Accept-Language: en-AT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skidata.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7179cd5-1db6-47fd-d92d-08da0bdc4f16
x-ms-traffictypediagnostic: AS8PR05MB8502:EE_
x-microsoft-antispam-prvs: 
 <AS8PR05MB85025F6F43DC152B5F83D846F0179@AS8PR05MB8502.eurprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JjtxLpbiWy7aA7B2eNrq6Hk7+GPZ1if+/+tA7ClzTJX5Y/L08Vk/wv26Z0h/ZjW8pS+HkqvgBR/iU3pn2eLy6fwpO83+GqT1+XRcKRsirbstLXSPMe2xs/UfUOOa8w5mGmfreT5jTtePcUW1eADFk/sIz+IbgvHmoHHI9SrqOKs+Gap8V5i4azGWAI6t+FVbfhyADY8PC6BRlXJbDsDzLKW7xReKho5szG++Gm0n3OWGUX6W5rhgWGI9E0WqHpgxufXeChUNC4o2tVY87rmHqX1REjvEuWl/mklWaWHnsvkiMmEXGrS1wx+QUuFoWSJwd4oGV+F14oS9Q5UZimHdPumeOy017FYlQy5qqgaTxt4h1eJDMRYWslI0ZPWZlpGH0SH4b9X66T0yedrmTBntuADYVKznX1cdiZSxWD9Sbj6W+ZqYF/KLqeYorpVUk005p06uY4spv2CLWPvKniEA1blWILHsMjuHfvMI4YyHel5xw2t5g7Dukm/bKKem7tZ0u8wim9wvvSWJRjkW/XG6DOMSIvRhfWBNYekscVFysW4AGwlcN+9nWqkJBE+RunJ8E9UbU6T4w+D2xFYQR+uaQtjkn55Eyhm9cvhgZrbOS1hyAtlZfyj2vnm7ppiXBaI/okgarhT+uyHuVhhNH0SbaKi1+INHmSubQkZZ3rWrlec8Yk0XfvrQDymnC1po3L5pdzLbzA8retFVYCXFB8fO9Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR05MB7376.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(26005)(86362001)(186003)(76116006)(66946007)(316002)(91956017)(2906002)(8936002)(5660300002)(6512007)(83380400001)(6506007)(66574015)(8676002)(4326008)(66446008)(64756008)(33716001)(71200400001)(508600001)(66556008)(38100700002)(66476007)(6486002)(9686003)(38070700005)(122000001)(54906003)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VUYrQXA3QjVLSUsvMTVuT3N5YTZmcjF4TWY5YUsrSUtXd1BQZmRnak1zNi83?=
 =?utf-8?B?TkNTRnp1Z0F0U0pYUEdCMWE4ZHhLd0JiVUs5ZVdPaGcrcm5GK2VRdUZobzdv?=
 =?utf-8?B?ZnVyaXhuaDh1dUxmOHJ4cUVuZDVuR3k0T3NHRnFvY0hTaUNzZkN1dGZaNEVm?=
 =?utf-8?B?YS9JaVBFWU1lR2pyMkw1WmdET3JjQmpDZjVsZFh2N2EvWjZzN21LMUpFR0Vk?=
 =?utf-8?B?UjFzZkZVdGpGcnlVNXVrVUFLWWdmc1NhQzREOTZodGxnZXFVdjdIY0g5RzNI?=
 =?utf-8?B?Tm90MEMzeWM3SFhaZHRJQkE4WnJRZUtBa3VCNjNDeTZ1UkJSM2tWZjJPYkdN?=
 =?utf-8?B?OFcwYTZYYjdMMGtrNm1VWnhhemN2dWFiOEFQREdra0FKQVI2UTRQU1c0ZzJV?=
 =?utf-8?B?ZEdUbjM2dFVpZFF2akQyU29INC9NNjRHTHRjdHA4czE4cVFiSVJCMUx3T0NM?=
 =?utf-8?B?d2pUTm9takptcDhUZGN4TW9TMWJUd2taYXhtZ1dqdGRuR1VWMDQwenFKOFFu?=
 =?utf-8?B?RnN0cGM4akUzUkx5eUxUbFpOTTRGSWxqUGVjN0I0eUFka2tlYVFwQVMyU0hW?=
 =?utf-8?B?alBsK3ZTSENTK1VzTmFDR2M3SCtEaDFiU1lyUlJnam53WHNJWWRQQmxJcElW?=
 =?utf-8?B?bG44Ri8rUjdNUGZRQ1BhYTc1S2RrTkdyTGVQWXdKMWhDMzVrK1UyVzNLRFBh?=
 =?utf-8?B?VmU1UjNTd2FOSEVQbnZydmcxVnd5dkZkb1V1Y3I3ZTNaUjlTMnc2KzF6cVJJ?=
 =?utf-8?B?NmcwK0R1N3drUnUvaEpUWXFpdFkrWnpabndVUHhHcHQzOU9sOTRpKzY2YkdL?=
 =?utf-8?B?SjVpd2lFRHI3UGtJSnZQRlk4d1IvOVdVOFYxcDFyckJ3MjYyQkROZ0JmS1ZY?=
 =?utf-8?B?d0Y3d0hUSjlFUFJrT3ZzQkkzZ1J2V2J1MnJDZ0VGQTFrRnRxVVR5MlpwNG1v?=
 =?utf-8?B?WEFWY25tZWJFbFR2UXhRRmNGbWhSelBPSEJMMWNVTkNTY1h3SGJydVZ5UW43?=
 =?utf-8?B?NFVreGhrREJ1aDh6ZTRLdFNndEVLYTV3SlQrMlMvUUV4UjBDQzBpRXR6VlVx?=
 =?utf-8?B?OW9wc2hGRjNCNGJyTzhOc0VFL2VWYTR0TWpZYWg0ajAzWkJWbDc3NXJHV3Vl?=
 =?utf-8?B?M3lidS91SXUySktlMG0zZ3Z3dUlXN2pSeWxDdHdmNzNGdHJpVmx5clVhcVJF?=
 =?utf-8?B?QjdGMWJYQ3VJcjJSMnRicW9BUTE4emduOWx6TmROYmowREwrNGhwMG1GVW8y?=
 =?utf-8?B?a0NkSmVJRE42M2w4TlFFdUdPcGVLRXR0Y1paVUFpWHk4aklVeEFQTy9DN3h4?=
 =?utf-8?B?WTlLSUVRYkRsRHpHdjAzbjNuWjJzQklmSmxhTm1pcnNDVVBZejdFdHNkR0pl?=
 =?utf-8?B?eFJrK1lOS2RId3hYTW5qazYvL2RzR3Rkays3TkJqd2VJdE9ZOU4zWE5DMmdp?=
 =?utf-8?B?SVlZODkxN2IyMlBKSmh1TzBibWl0Ykphd2FrMDRkV2dwbllRNlpIaUlBUkhW?=
 =?utf-8?B?WExvVmpIMmRJYmFjejcwZTVtSGgvdzBXRWpUa3lJRnJPdkhuaFk2OCtZS1hq?=
 =?utf-8?B?L3RLK0JXUGVFM0ZOODBwZjQwbXFkamk3YkYwYnNxOHlrYTkxdWVKWjJ1OEtp?=
 =?utf-8?B?cHJxK3NzN3U0cTJ6dSt1c2lpYitpQVpnUERnWU5JcC9Wd0l0QWdXaDNGY1F6?=
 =?utf-8?B?bndCQ0o1bmVPNVlEZWlUdGk5Y3VzRjllZyt5K0RPalA2dGVpVlpZT3g3aUdh?=
 =?utf-8?B?RnBYTXRFVnZ3eG93MVYrekd6NitnQlpBbVdnM2NVcHU0RTR1K2NGUTgxbWIv?=
 =?utf-8?B?UldhWUx0V2VvT3liQUNiV1J4NFlpTlhBbFgxRkVUd1NHTER6KzY1RkVOaDZC?=
 =?utf-8?B?bnorK0h2Z2VXbjUzL1dHckNtTXpCM3NCVVFPSDNTTWxXdlFTdStuYXVjOXhL?=
 =?utf-8?B?MzBVSjZTdVgyNGZJMXVzWDF2eFJkRnBaWU14VVk5dHR0RjdhWEM3cDBvbXha?=
 =?utf-8?Q?jBwrWmElLi/9DyIBo+L5JiuDu5F0ys=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D91A2F0C4336549A8D04F6F1568136C@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR05MB7376.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e7179cd5-1db6-47fd-d92d-08da0bdc4f16
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2022 08:16:47.2861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 tGf+PnW6wNd6GzYmQgwDGXQ8buZJZJsjVv/xzRG5FOiI5Rcvyi4nDCkTD/MQ/CkPAdGipcaMlKn7UQhwp8PjZ/hyYCjFBHwFI5GBk8aCMsU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR05MB8502
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 08:16:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96133

SGkgWm9sdMOhbiwNCg0KdGhhbmtzIGZvciB0aGUgcGF0Y2ghIEkndmUganVzdCBhcHBsaWVkIGl0
IHRvIG1hc3Rlci1uZXh0LiBBZnRlciBzb21lDQp0ZXN0aW5nIGlzIHdpbGwgbGlrZWx5IGdldCBt
ZXJnZWQgdG8gbWFzdGVyIGFuZCBraXJrc3RvbmUgYnJhbmNoLg0KDQpyZWdhcmRzO3JsDQoNCk9u
IFR1ZSwgTWFyIDIyLCAyMDIyIGF0IDA2OjE3OjQwQU0gKzAxMDAsIFpvbHRhbiBCb3N6b3JtZW55
aSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gRnJvbTogWm9sdMOhbiBCw7Zz
esO2cm3DqW55aSA8emJvc3pvckBnbWFpbC5jb20+DQo+IA0KPiBJdCBmaXhlcyB0aGlzIGVycm9y
Og0KPiANCj4gfCBjaGVja2luZyBmb3IgcGtnLWNvbmZpZy4uLiBubw0KPiB8ICoqKiBUaGUgcGtn
LWNvbmZpZyBzY3JpcHQgY291bGQgbm90IGJlIGZvdW5kLiBNYWtlIHN1cmUgaXQgaXMNCj4gfCAq
KiogaW4geW91ciBwYXRoLCBvciBzZXQgdGhlIFBLR19DT05GSUcgZW52aXJvbm1lbnQgdmFyaWFi
bGUNCj4gfCAqKiogdG8gdGhlIGZ1bGwgcGF0aCB0byBwa2ctY29uZmlnLg0KPiB8IGNvbmZpZ3Vy
ZTogZXJyb3I6IExpYnJhcnkgcmVxdWlyZW1lbnRzIChndGsrLTIuMCA+PSAyLjggZ3RocmVhZC0y
LjAgPj0gMi4yIGdkay1waXhidWYtMi4wKSBub3QgbWV0OyBjb25zaWRlciBhZGp1c3RpbmcgdGhl
IFBLR19DT05GSUdfUEFUSCBlbnZpcm9ubWVudCB2YXJpYWJsZSBpZiB5b3VyIGxpYnJhcmllcyBh
cmUgaW4gYSBub25zdGFuZGFyZCBwcmVmaXggc28gcGtnLWNvbmZpZyBjYW4gZmluZCB0aGVtLg0K
PiB8IE5PVEU6IFRoZSBmb2xsb3dpbmcgY29uZmlnLmxvZyBmaWxlcyBtYXkgcHJvdmlkZSBmdXJ0
aGVyIGluZm9ybWF0aW9uLg0KPiB8IE5PVEU6IC4uLi93b3JrL2NvcmUyLTY0LW9lLWxpbnV4L2Ns
YXNzcGF0aC8wLjk5LXIzL2J1aWxkL2NvbmZpZy5sb2cNCj4gfCBFUlJPUjogY29uZmlndXJlIGZh
aWxlZA0KPiANCj4gU2lnbmVkLW9mZi1ieTogWm9sdMOhbiBCw7ZzesO2cm3DqW55aSA8emJvc3pv
ckBnbWFpbC5jb20+DQo+IC0tLQ0KPiAgcmVjaXBlcy1jb3JlL2NsYXNzcGF0aC9jbGFzc3BhdGgu
aW5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvcmVjaXBlcy1jb3JlL2NsYXNzcGF0aC9jbGFzc3BhdGgu
aW5jIGIvcmVjaXBlcy1jb3JlL2NsYXNzcGF0aC9jbGFzc3BhdGguaW5jDQo+IGluZGV4IDQyYzVk
YWYuLjM1ZTdkYjMgMTAwNjQ0DQo+IC0tLSBhL3JlY2lwZXMtY29yZS9jbGFzc3BhdGgvY2xhc3Nw
YXRoLmluYw0KPiArKysgYi9yZWNpcGVzLWNvcmUvY2xhc3NwYXRoL2NsYXNzcGF0aC5pbmMNCj4g
QEAgLTcsNyArNyw3IEBAIExJQ0VOU0UgPSAiR1BMLTIuMCAmIFNBWC1QRCINCj4gIA0KPiAgUEJO
ID0gImNsYXNzcGF0aCINCj4gIA0KPiAtaW5oZXJpdCBhdXRvdG9vbHMgamF2YSBnZXR0ZXh0DQo+
ICtpbmhlcml0IGF1dG90b29scyBwa2djb25maWcgamF2YSBnZXR0ZXh0DQo+ICANCj4gIERFUEVO
RFMgPSAidmlydHVhbC9qYXZhYy1uYXRpdmUgZmFzdGphci1uYXRpdmUgemlwLW5hdGl2ZSBnbXAg
YW50bHItbmF0aXZlIGd0aysgZ2NvbmYgbGlieHRzdCBmaWxlIg0KPiAgDQo+IC0tIA0KPiAyLjM1
LjENCj4g

