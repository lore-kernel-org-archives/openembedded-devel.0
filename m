Return-Path: <richard.leitner@skidata.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED730C433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 17:02:00 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.107])
 by mx.groups.io with SMTP id smtpd.web10.9921.1637168518410399733
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 09:02:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=F8GbbjT0;
 spf=pass (domain: skidata.com, ip: 40.107.1.107,
 mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaH9vu2DLNgLyQAdQJUPd3TreLXJV5405pJPP3z58J2jRFqZzCdRg7VJ1bViOOiWMZjJgU1JLy2tUPiV9arsyQW2xOElJfomUE7I3aMbVfqbGzM73VI0gVFLXf+e4VaSRsuvX2iZMUGrsAJasLNTTrMayaYpYjwXDExCjnqik+WIcJkVPXZyTP1Q35aGEmA3y7FAPEMJ05BK/0k5dFxBYpxh+izKZVVV3AvI3yo58NBF5K18rRD7/HkCDcPy5Hdgzc4+KapdCrPoeaMV4/SIGxtY55kC5fAKwGXYCPXe9MgRnU2LIWnpkXwNtzeCJ3yErYblWAG9EQUQLL4tiTiQZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCs8DuTOQG0YeM8ABeKXB/5ZS51JPfM18/9NiHpe38Q=;
 b=jWdRnNKUhCMMX6Sd4YB6m/hXbwRbS+DKHudjLOjibFRG7XaKJpVltPqWf8P00+WJ+thFf14bRtDp3HnbgFHf4YCvs1BcjsPwMYiVwCP14edkV+DDYksn7b+iwSNU5mLyyCnHPUyrhuMWknihZ7kKxwzYS1z2GQcm7kPsfzGFZzBIeWhK0Y0TUlBBqbAPCliBrHUaSesy9+TWwu16OFtA0nbEoB53CzcyTrK8x5E5ys2wNSIMA+V3zk9uO4uHgiroI705HN/x8iEiqDY1fPUZ/r5vX/kXTFHIij28TE43u5ZNco9tB6TPUfPAH7VQfMA5BPYoC+GK4GvmadZIIp2wTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCs8DuTOQG0YeM8ABeKXB/5ZS51JPfM18/9NiHpe38Q=;
 b=F8GbbjT0rdmDk46CejJsxj3giAfJwtns5uyg1OUoI/XGpzSt/bwexRWO7Q5jEO/ch4GqgNyMAmlLrbhYw3ZKUssWued4sTuW0zT+EA9fn1aK/oZ34hnqy944V9jRP0rLKjAgfpTZOb2D67iYpq2rxKK9NoPiab1uOENMQYat8RW9ypIDshAcq0oBDon+ejGTC/tv+nwrCOo/q/ZrxkJscG6AmL8DorXaaTO6EnSowALasq6MKeyPhKwa6H297X/yiM1/WbrNo6pgNB5OVhs946jEseDIchkqQtX8xsj/z/un7gpEsTDOAQ6oxLFArHzjxT4qWdcpW2ZnpK6GDSXhAA==
Received: from VE1PR05MB7376.eurprd05.prod.outlook.com (2603:10a6:800:1b3::19)
 by VE1PR05MB7246.eurprd05.prod.outlook.com (2603:10a6:800:1a5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 17:01:55 +0000
Received: from VE1PR05MB7376.eurprd05.prod.outlook.com
 ([fe80::21d9:e4fb:d0ff:8596]) by VE1PR05MB7376.eurprd05.prod.outlook.com
 ([fe80::21d9:e4fb:d0ff:8596%4]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 17:01:55 +0000
From: Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java][PATCH 1/2] jamvm: Set git branch
Thread-Topic: [oe] [meta-java][PATCH 1/2] jamvm: Set git branch
Thread-Index: AQHX24I2fZTiyAsDVUWzXS5W9y0QNKwH5vIAgAAKtgCAAAD5gA==
Date: Wed, 17 Nov 2021 17:01:55 +0000
Message-ID: <YZU1g39dkx2XgoFt@ltleri2>
References: <20211117070958.64782-1-jacob.kroon@gmail.com>
 <YZUrtnrEbKpjceM2@ltleri2> <c9c3e984-21d1-4547-abdd-2defa9e66bf4@gmail.com>
In-Reply-To: <c9c3e984-21d1-4547-abdd-2defa9e66bf4@gmail.com>
Accept-Language: en-AT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skidata.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b15dd805-d28d-478f-f35d-08d9a9ebf5f2
x-ms-traffictypediagnostic: VE1PR05MB7246:
x-microsoft-antispam-prvs: 
 <VE1PR05MB72462C94D79FF630B38BA3EBF09A9@VE1PR05MB7246.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9r2bQehDSLcZlvTp1v+aZvVMfAiHPaqjrkjIjZrJrdiGLoJAfaFH+2PelbtI7NEmzPh0AQFqKkYYFqcwK5J39NYM6Sb69+WvaA2et8hykULrPtM+iFiraWGL6lZrospAFLC3RUSEZ94Qsl4VtHe8oM8yZQl8XlO8/XRfmS7AsAjVy3aEj2hSsiAQ7Yi0bEUE4YYMHmM/dkGiJewuxTpVlKMNESOuMXgWFFoxMxxH2xmk36fBA3sqG1LpIEtwKPv44LRVBOj+E8mBqYV2TE9fQcwdYSElFAOTxsg2O0KxEneVXLhHf9fm690UwkEXukllm4HNLj0HyyFGmEsDySotFSeBzwzgUyCYVYZDJtIrFgOoilvzo9t1ne6yvPd4XP6a6FNvyvoSJ6sxfmsLGUGnSE33YW5AxONiK9mnrOeKbBRqdX2ebC1/knJK0S3SBruzT7rpP1TYL4Hy+2x8WJGtbDVKjK7TDc1w/+OnzH38gAJHYKZsIkJLJ/+OC73dVu1dlURdTZG6aLNXO8f5mkG9S5Bn6cLSClMLOWcotXLwkYHxGIHM5+WxlXdzMSv4LeUF4fCK5hxFmtghOljIvU/LaBvzxP8lkn+FN/xy+tfIUmt8otIrkcXd0plIdHRr58+nppJbwlF8/VmUbZM++vWGEoXVTinnju8il6gUeRrr3ha/vQ92AJLd4aJaTh4XLxyXj5vpxgOcFVVzAQiNXu5W/A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR05MB7376.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(38070700005)(122000001)(26005)(91956017)(38100700002)(6486002)(53546011)(76116006)(66556008)(66946007)(6512007)(66476007)(9686003)(83380400001)(33716001)(64756008)(316002)(86362001)(4326008)(2906002)(5660300002)(6916009)(186003)(4744005)(508600001)(6506007)(8676002)(71200400001)(66446008)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MnJhc1p0SFVxZlQwZjkzOWYvM1ZNaUorMWlmNTNGUGlKMUpFa3EzcHFKckFU?=
 =?utf-8?B?ZXo2eThRbUVyU3Jkc0JrYWc2a3JuWWpFWGZ1S0o0YlI0QU1tWVJEUnRta1Nz?=
 =?utf-8?B?dlFPR2Y1eUxRSmdhU05HdStVbW1xV29OYU1kanc2OFVtb3FjTnRVYiszd3hl?=
 =?utf-8?B?VU91ZnFxVFNodVdiRDZDTmtNY1Jya0JTbXNVS1E4N2tLM21JZ0oweUdwekRx?=
 =?utf-8?B?SllNdk1BQlJSdksrQm94T2FZZitsYUdrdnF0T2k2czRoazN0aFJEeGtrblVp?=
 =?utf-8?B?ZTRmb1VZMUlJRFFuZkxUUlB2MldyZzhudDJXNUdZWi9FRmxIaHoxQ0hTYTNF?=
 =?utf-8?B?OU1mRSsyempibFQzQ1gwRnE4MS9telVRQ3drenJvTFlXZkIrdzcxcTk5eTlw?=
 =?utf-8?B?a3dCaUVtZS9UOVF2UG52M3RQMVFVNm5zb0t6ZHNSTWhscng1bEErbnFOcGJa?=
 =?utf-8?B?dXN0cVp6MExCZGdjcHBKSXdUMURvOUpQYmZDczYyRlVyUmpyRmc4WVNxUGhL?=
 =?utf-8?B?Qk9nTWNjQUZCZEZxeU51TmUxcTFaQkloWTlyd1FKRE8yMmJ0a2lOaW1JVUhD?=
 =?utf-8?B?ZWNNSDNrVEdWRGJBRTVEa2ZXaUJBMzRxYWM0SW9yempQVTZSSDZxUVlJRm1s?=
 =?utf-8?B?bGNIZXhHUWxpZ0dXbC9teTI1UUR2RnVYdWtIenBiMldrQlluTWIzQ1BGR3ox?=
 =?utf-8?B?Z2hHaXdpUXVhRlZkSjVEak9mSDF4QURjWWpTV0dhUURFS3RlYkRBTEovc2RO?=
 =?utf-8?B?TjlZT1ZpdFFZY1FFRjRucGp1aVFPbnJKYjdueUoxUVNiSE5UMmZCa0xHVEJr?=
 =?utf-8?B?bjVMbFUwUkluWS9wc3RrQ0ppL2lyMEVUN2J0N1BnNGdXRVV5cEpPSUVDblZT?=
 =?utf-8?B?cGZQNzB5MURWV2J2RTBhTW9QOHZqWVlraHJyUEczaENQNHdlQmpLRHV0RUtO?=
 =?utf-8?B?Y1dWTlpSV00xTktVb0E5NENWY2hxd1JnL0FmZmlWeXhHV1ltYU83dWJJelBV?=
 =?utf-8?B?aW41Rko1Y0x0cmkwVCtCMUxvN09UQkNpNjFwM0hQajEwVyt1TlVMTzByc2hh?=
 =?utf-8?B?bzIwaTZUTjhYQndpNW9KK3hYckhxSTdpSUJaR3hmRkZUMGh4QytQdTFzNEVq?=
 =?utf-8?B?ZXIrdTJQM3JFQnY5Z3RWQmFUdkpIL0ZoQ1g5VUNhaGt1ZXlIMGU2WEMwN2Ns?=
 =?utf-8?B?aUl1azBQOGY3eFVnbmVZS2M5QzA2MzUrUm5rMnF3TnNzNE93L1N3dUFSeHJn?=
 =?utf-8?B?VEhHbDVDSFJrUXgxRmJOdDZMb0dlb0wwWXRRY3MxL2pWZ0tYK3Jhd2hXMjhk?=
 =?utf-8?B?alJLSTRyMnFmanJNSGFNTk9lOVNHZjIyczhJaWFzaE9TRnEvOXZMa3ZpSUVP?=
 =?utf-8?B?bFh3ZzlKS21vcHk2UGQ5UGRxTVNVL29oSTVhYVIzbDlwZi91VGZmTTZiLzAw?=
 =?utf-8?B?ajlSS1pnM2hhc3o1S2FLamxBTkNCeHdud1RYT20zUGVsd3BhMUp5MTVwYWFC?=
 =?utf-8?B?bTBVTDYwdk5lbktMeW93V0o1M081U1JKVHJFYjJrb0NEZkxtZ1dUL0Y3QjU4?=
 =?utf-8?B?dkFBcHpmU0lETXRjTXYrVzNpdVhEYnhTRUVwTnpCQngvSzZMNk9KNjBXM0Za?=
 =?utf-8?B?TkQyWTBaVXJOaW9tQmFpUDltU0NPYVdwcGttRW8vOTBSSmtRTFhqTU5kRThw?=
 =?utf-8?B?V3ZOR3I3MUFNOUVjNjVmU0drTVplRzN2ZmdDN2ZVTnh2alo3TTZ2ZitqcjFO?=
 =?utf-8?B?SGUvMjJLSVgrZHQwU0tDdWN0SittRUxTVisxWlRwdE5GZnJ0Z0Mva1NQb3NS?=
 =?utf-8?B?Z0tMck9ibktvOUFQY1ZkUGt4TGJkdXZDd1BSdVIrdVBOeG10R2pvMnMrTmM1?=
 =?utf-8?B?NVQ5VjhOQjdVWXZ6Q01Oa2FacmlNVm5JYmJ4aXJzUTdZTy9ndEJxZmZ5SlVi?=
 =?utf-8?B?ZGZERVBnamtXMkpTSGI3MDFUeG54WkJzY1dyNEpVTXJISlcyQWFsSVcyaDJG?=
 =?utf-8?B?bjdyS1h5U2ZYemd6cjRJR2o0QTNua0V4L0c1bVE1ZHJXTDg5QnBjenpqY1hI?=
 =?utf-8?B?bWtCeTQ1TEIyTTNWeXdKa3pJNUROVkM3R2VYZlJwNUt5eTJUejhZdnpCdXFO?=
 =?utf-8?B?M0ZEYkZrWVZ6cFJEK1ZGcnY4UjFFMEh1RXhTWHJFd2dSMlBwVmVENHVxeUw2?=
 =?utf-8?B?WVNsRy9DUlZkeUp4ekhQcTlkZldpcXRkM1NoVlo5aUhmOEFZN096cDVrMHFw?=
 =?utf-8?Q?eH5aY1WtAmfU6O/T0LLvAKRJKRUlUEdR4M6pulCyVQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <09FD0DF8A027B240BD6426799C66D4E5@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR05MB7376.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b15dd805-d28d-478f-f35d-08d9a9ebf5f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 17:01:55.7777
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Q6QQV5txbi6ug01kCU8HvjYz4tiVp0CS83qZ2rTBvHpak9m8AhmfjIUCoDYNFcOJ8CnajLc9Au9h0HjeyxtC/ikwZ7ReacZfAHJ2oJb3nUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR05MB7246
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Nov 2021 17:02:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94006

T24gV2VkLCBOb3YgMTcsIDIwMjEgYXQgMDU6NTg6MjZQTSArMDEwMCwgSmFjb2IgS3Jvb24gd3Jv
dGU6DQo+IEhpIFJpY2hhcmQsDQo+IA0KPiBPbiAxMS8xNy8yMSAxNzoyMCwgUmljaGFyZCBMZWl0
bmVyIC0gU0tJREFUQSB3cm90ZToNCj4gPiBIaSBKYWNvYiwNCj4gPiANCj4gPiB0aGFua3MgZm9y
IHRoZSBwYXRjaGVzIQ0KPiA+IEkndmUganVzdCBhZGRlZCB0aGVtIHRvIG1hc3Rlci1uZXh0Lg0K
PiA+IA0KPiA+IEFub3RoZXIgcXVlc3Rpb24gYXMgeW91IG1pZ2h0IGtub3cgYWR2aWNlOg0KPiA+
IEhvdyBtYXkgSSBhcHBseSB0aG9zZSBtZXNzYWdlcyBmcm9tIGdyb3Vwcy5pbyB1c2luZyAiZ2l0
IGFtIiB3aXRob3V0DQo+ID4gaGF2aW5nIHRvIGFkYXB0IHRoZSAiRnJvbToiIGZvciBldmVyeSBz
aW5nbGUgbWVzc2FnZT8gSXMgdGhlcmUgYW55DQo+ID4gInRyaWNrIiB5b3Uga25vdyBhYm91dD8N
Cj4gPiANCj4gDQo+IEhtbSBzb3JyeSBubywgSSBkb24ndCB1c2UgdGhlIGdyb3Vwcy5pbyB3ZWIt
aW50ZXJmYWNlLiBJIGZpZ3VyZWQgbWFpbnRhaW5lcnMNCj4gdXN1YWxseSB1c2UgdGhlaXIgbG9j
YWwgbWJveDplcyB3aGVuIGFwcGx5aW5nIHBhdGNoZXMgZnJvbSBlbWFpbCA/DQoNClllcywgSSB1
c2UgbXkgbG9jYWwgbWJveCBvZiBjb3Vyc2UuIEJ1dCB3aGVuZXZlciBzb21lYm9keSBkb2Vzbid0
IHB1dCBtZQ0KaW4gQ0MgSSdtIGdldHRpbmcgdGhlIG1lc3NhZ2UgZnJvbSBncm91cHMuaW8gd2l0
aCB0aGF0IGNyaXBwbGVkICJGcm9tOiINCvCfmJUNCg0KTm9uZXRoZWxlc3MsIHRoYW5rIHlvdSBm
b3IgeW91IHJlcGx5IQ0KDQpyZWdhcmRzO3JsDQoNCj4gDQo+IC9KYWNvYg==

