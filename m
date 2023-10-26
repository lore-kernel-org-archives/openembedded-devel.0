Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F167CC25B6E
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 18:54:08 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.41])
 by mx.groups.io with SMTP id smtpd.web11.79477.1698346438682370593
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 11:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=FjApfT2h;
 spf=pass (domain: axis.com, ip: 40.107.13.41, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WY7P8teqnmShkvfP+t6ZmrJYMZZ13Qiz2jxxB+95snhSuvHx8dtGlPWNnhTrnBy9hf0UKM3D3JpdpuKl5D2twE124FWQIfKwzBbSNQlIp3qBGugemJtEi0j/CVr5E8zQacQf68NCoet/47eOR/7DiCiHwRcVkUa0CZ46OKE1VXNtta2OWNlUiYnttkAnxcObcH1/RmSnauTHT8YnZ44fY9CRN6u2KiEZi6lZKdCiUoMYIc1rN3nseXddpvuCbSILEm1DmgcPX6Ob+15n5qDfD51rt5JeTte5bbWm843Yweb53FZcnJOmXI2KfPpuHN1RGUaSYsmQjXffDb2EcjGAlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6GFLkUcQXZfCo3yyILq3QPYNrFDsJPPvUQqYqNDnbQ4=;
 b=aZ/REd0DzZAj+5eWIY6cA4DEUzA0G9A591g5qpyq+oOJHKhGqjA26kUcXwD4nFrkz6YmaF0l6ybD7bkJGo1t/zv9F7V/xImqmkhkZloKk6qlMtdknv6rWlwJr7dNgFWZsQHF3iulmQ9vqmK3I3LQwqOv2B39gAm8b1olUnFhR4xAJs4aDZMdrRJXvJe44BcO7ixaPD/FdG309Ok4ozWg+eJqHChQzB259oRwk9zav34mMT4n5FVHl8/f0q57jS6/uebrQaKsURvjf/PGkSvp4cCcP8sn9SKJIksX6a6z+fspWTzukeEj3VvB5STPDuDaWsDM+5bEqmROKi7Auj/4ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6GFLkUcQXZfCo3yyILq3QPYNrFDsJPPvUQqYqNDnbQ4=;
 b=FjApfT2h1DV5lJdLCB5Uyco0VM9iqCCAdivVToexwq6hcfFs5ClQ1qFkfADRQLWl1V3vVFN0C2tbYYNcSA2x48ERPHFwZsUIFyNQL26gQaBUrpU798XMTEEgNn8gLhyp9UBBfPdfXscZ3AIRwE2JGf7hwekSLLzh57srZoCXpBA=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS4PR02MB8694.eurprd02.prod.outlook.com (2603:10a6:20b:58d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Thu, 26 Oct
 2023 18:53:55 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1b86:94ad:137d:4093]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1b86:94ad:137d:4093%6]) with mapi id 15.20.6907.032; Thu, 26 Oct 2023
 18:53:54 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Marek Vasut <marex@denx.de>, Martin Jansa <martin.jansa@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Fabio Estevam
	<festevam@denx.de>, Khem Raj <raj.khem@gmail.com>, Michael Opdenacker
	<michael.opdenacker@bootlin.com>
Subject: RE: [oe] [meta-oe][PATCH 1/2] lvgl: lv-drivers: Allow empty package
Thread-Topic: [oe] [meta-oe][PATCH 1/2] lvgl: lv-drivers: Allow empty package
Thread-Index: AQHaAe637TVMVfLme0qRlCBFgkUcTbBP6FIAgAAIHwCADISTQA==
Date: Thu, 26 Oct 2023 18:53:54 +0000
Message-ID: 
 <DB5PR02MB10213161EB1938ED3E5B56B0AEFDDA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20231018181221.87138-1-marex@denx.de>
 <CA+chaQcet4HaWkoHp1XvjPUGWUxVAJanMhLnASq_hHSgpKN2-A@mail.gmail.com>
 <44d8a126-5a80-4a27-90f0-309555e5fd35@denx.de>
In-Reply-To: <44d8a126-5a80-4a27-90f0-309555e5fd35@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS4PR02MB8694:EE_
x-ms-office365-filtering-correlation-id: 3d4a5b13-f09a-4e79-0d1a-08dbd654e746
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jxmBQdEW6n2MvybI042Nq9bvbz0jYa/OkZLDWJdM43zZ7H+tJX85L04odcUih2C+yE002uSFyPUX6gEZN4Vg+bfUegBA9vjcM6n8C+0zRS43hlKUBiBK0ZQEBjcb/X9VRK8VW05vWaxFax2N+JADIF12YgdhSa6ovXrJ8+WX9sSHipcrs+QrK6oZn4PcAjh5EefslJR21jam613cihejhrF5jBI1uGnmIGGLlWWOo0DC7OPaMMP0ZFh3AE8Ohp16cB6ZaPUm4qE+973iOaUiowQO5+wLZ+Z1cNVbjh8KbCnSh+PzGsAINh/ARqTaYU78IsBMwLmC5pP7QDYVide1sMzYOPcvUcjfd34HVpuM2M+gMOjvHxefO8q5ggq8tBqbY/viY5fSVP6Mue4p149X3tmnA6t8vlOyeSwOOxZLc/tOYg+cbaVpyn180xddo2cuLYiBC6BGSvp+7pi8VI0VNGZB7BjmvLk+YBQ9m8jFnVseF4X6sjTH7jjB+vinwoaItLQHI8ajjdVmb5+n1EirsBP7qLj0nD++fcLAIZtFRlJW7YwDdT0zVLN/FgDCJtY43ETCMk7JY3KzHkJapDDwpCTH5h4jE/TfHHslLTH17eQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(376002)(136003)(346002)(396003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(110136005)(26005)(76116006)(478600001)(316002)(6506007)(86362001)(66446008)(66946007)(38100700002)(66556008)(66476007)(64756008)(54906003)(38070700009)(33656002)(7696005)(966005)(44832011)(2906002)(71200400001)(122000001)(52536014)(83380400001)(4326008)(8676002)(8936002)(5660300002)(9686003)(55016003)(41300700001)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UzNCbm5USzFsejg5TVh5NUw4aXZvdE5ld2lYTkJUdFUvUEgzaXJWYUhZRzFl?=
 =?utf-8?B?WnNJUnRNeDlMeUR4azhYdzZneUFFT1RKQlIwd3hFVjdrUzVnWWZYWVNic1gv?=
 =?utf-8?B?dGhZcEZEY3ZVdWtOUkJtdXpJeUxYWm1qaU5KbmdnTTdLeUsyMDhJdEhZMnFy?=
 =?utf-8?B?enQ2V0VmTWs0MExDSXF2RHZTNy85YUc1Mll0UndWd2Q0QUhhSk5jY3VDNHFq?=
 =?utf-8?B?aFZzVEdPbmc4QlNoYjgxOTdkamluZ3Z2eERpaXNiMWlqelhWdWdGdU5BZlAv?=
 =?utf-8?B?SDV3NlZiRlFOUCtpam9vOU5QUXZZaFpOMGFETXRwdEM1Sk44SHEvWHUrQy9G?=
 =?utf-8?B?MlVWcityRTFDTlBHdzdBbGY4QWViZFFuM1QwakxNNDBrcTNwbVAxQWVyQkk3?=
 =?utf-8?B?aVVTVXpJUG9JaFlUSi8xTjRBSy9TQTZvR3JpSmNSQUs5V2VBMXo0VFdraDN6?=
 =?utf-8?B?aVY5QjU2enFpOUJZWHkrejMza0EwMytSYmZ3S1R3R2xORzAyZHNGNmR2aER5?=
 =?utf-8?B?NjVtWGozWjA5MGRQby8zVVk4dG51Mnh2NmpySXBFRjZuK2I4ZkJuOWlZT2lo?=
 =?utf-8?B?VFFaVWdGNDRRdGZDd2lKc0FYMkR6bVNWMkxoYUd3K3VkQXMvV0tEOVYwbHha?=
 =?utf-8?B?SWw5Q0FNeHVrMEFmaURmUXYxRExTbzZwdk8xTDhFRHIyb2E1UUtySzBkSDF0?=
 =?utf-8?B?Q1lycVNvZmthdEtIbUVYSGVPMUcyczNHRzdNbTZpWmxRZFR5b25FZVd6d0J3?=
 =?utf-8?B?TlZBeXozSGM3L0dod0JhWTN4SGViSTlwa044bTJTUjJSK3RJaXVJeEEzVWRP?=
 =?utf-8?B?V1hadERnaVZDUURCbjFUV01ZMExvdGp1Qlp6ekcxK29qVVpWYVo5TVBERWRY?=
 =?utf-8?B?UGNvQUFSaURYWDBVK1Z2c2JCL0NzOXNTcHU5MTljek9yenI2SFNPWSt6bG1P?=
 =?utf-8?B?N2dTdlFHK05pZ2VLcDg4ZStDWVp5R2MrZUZOUHVVbXZHWVR6cU54QmtpZ3BK?=
 =?utf-8?B?UnllUkpJUDhjMkdZZFVOSUFqV2MzZnF4S3duZnovMlBxaFVZOFU2UlpUSXl5?=
 =?utf-8?B?SEkvOGpFUy9pVkRGNlJjZjUvUXhjZHNYeWRnbkl4dXpRUFNkdHExNmZjdHp1?=
 =?utf-8?B?Zk1kekNVeXVibnlaVW5PMmFBV1JQenRvSXZRdVB5NjhqNnBvTkIrUkZPcWQ4?=
 =?utf-8?B?K29MQjh6Ky9sZmg2THp4VmZCZElDOVJRZ2pNQWxLR3FMVGlPcFVoaGRMUkk3?=
 =?utf-8?B?U255akYydzB0aVVxLzMrTkNRQmpiM2Q0Q0ZzVUh0czU2RktmUUxVRHBiWTN1?=
 =?utf-8?B?WE1mU1JkbHZ2aU85UTAxRDE4RDRISDFTMUpRUVZFeE8yL0o3VkEzMmhLR3R6?=
 =?utf-8?B?RzFja25TNFpGU0V3RHdPdVNLYnYvci9ZdnR5b3VldW1OelBUdWp4elRCNU4r?=
 =?utf-8?B?Q3VKbFFqZkRkalY5bCt6OXVOaTl2R2lHeE1kWkdqVUJNRTJQVGNzZFNGNFBn?=
 =?utf-8?B?Tzc4czAybEVoNEJnMnAyN1VqUFBETEV4QkdjWWFZWU4zbGxBL2tQdkc0dzZw?=
 =?utf-8?B?bTczd3k5VFhEY2xGcDM2MlNWM2lyTWRYWXM2dnJ0d2QyOTZPWm9zTXNtb1I4?=
 =?utf-8?B?S1N4NzdKVW01YkRsVHlKY2R4c1A0S3ZXbG1kL3BOSDlpRlhmblU2V0dzYTNi?=
 =?utf-8?B?cDRVR2xJL2VjN1dJTFJ0YjlkcEpEb012d3E0YnNuNXp3NTNDUm9ZN3NiRk56?=
 =?utf-8?B?dEo3dHpLY2p2VloyZWhuaWkyZlNZSjhmMlFiZXVhUXB2THdqL1dGRThFTm9t?=
 =?utf-8?B?bDR5VG44M0lZNkNEZys4MlAwYXFxRnpGV3BXT3RpTExMSVM2cGNnQmpBZ2kv?=
 =?utf-8?B?dlRQZ083S05heG1NSWloSlBPVDNBNndqN1NMbElNeUtpdkhWcHFtOUFKM1cw?=
 =?utf-8?B?Ukt3TmZqVVpXSnZoNDcxeUdGbDRqYzhXbzlZNW9xVG9admkySDhkTFE2dW5Y?=
 =?utf-8?B?alpoUlM4UHFIallFdWVxVGZwRDZ2SlJ0MHZJSmNqSHIxV243YkhYTE9tT2oz?=
 =?utf-8?B?UTZ0WWFtdHB5SEJHZ0F6SEIrQUlxQlhYR1NVNldhVXNHc3dYaTNkTEo1ZEI3?=
 =?utf-8?Q?TUAs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d4a5b13-f09a-4e79-0d1a-08dbd654e746
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2023 18:53:54.8282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d56yPF4tZzFNtxmsmTkGK1fsL+fIHvPLTnkS0J9oe0H0tekqejWXdeIt8MmzoQc0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8694
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 18:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105763

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWxA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBkZXZlbEBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgTWFyZWsgVmFzdXQNCj4gU2VudDogZGVuIDE4IG9r
dG9iZXIgMjAyMyAyMTozNQ0KPiBUbzogTWFydGluIEphbnNhIDxtYXJ0aW4uamFuc2FAZ21haWwu
Y29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7IEZh
YmlvIEVzdGV2YW0NCj4gPGZlc3RldmFtQGRlbnguZGU+OyBLaGVtIFJhaiA8cmFqLmtoZW1AZ21h
aWwuY29tPjsgTWljaGFlbCBPcGRlbmFja2VyDQo+IDxtaWNoYWVsLm9wZGVuYWNrZXJAYm9vdGxp
bi5jb20+DQo+IFN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLW9lXVtQQVRDSCAxLzJdIGx2Z2w6IGx2
LWRyaXZlcnM6IEFsbG93IGVtcHR5DQo+IHBhY2thZ2UNCj4gDQo+IE9uIDEwLzE4LzIzIDIxOjA1
LCBNYXJ0aW4gSmFuc2Egd3JvdGU6DQo+ID4gV2hhdCBpc3N1ZSBkb2VzIHRoaXMgYWN0dWFsbHkg
Zml4Pw0KPiA+DQo+ID4gSXMgaXQgcmVsYXRlZCB0bw0KPiA+IGh0dHBzOi8vbGlzdHMub3BlbmVt
YmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTg4MzgzID8NCj4gDQo+IE5v
cGUNCj4gDQo+ID4gSSdtIG5vdCBmYW4gb2YgZW1wdHkgdXNlbGVzcyBwYWNrYWdlcyBjcmVhdGVk
IGp1c3QgdG8gbWFrZSBwYWNrYWdlIG1hbmFnZXINCj4gPiBoYXBweSB3aGVuIHNvbWV0aGluZyBl
bHNlIGhhcyB1bmZvcnR1bmF0ZSBkZXBlbmRlbmN5IG9uIHRoZW0uDQo+IA0KPiBJIGhhdmUgYSBk
b3duc3RyZWFtIHJlcG8gd2hlcmUgYSB0b29sIERFUEVORFMgb24gbHZnbCBhbmQgaXQgYnVpbGRz
IGFuDQo+IFNESyB0b28sIHRoYXQncyB3aGVyZSBpdCBibG93cyB1cCBvbiB0aGUgZW1wdHkgcGFj
a2FnZS4NCg0KVGhlIHJlYXNvbiBJIGtub3cgb2Ygd2hlcmUgdGhpcyBpcyBuZWVkZWQgaXMgZHVl
IHRvIGxpY2Vuc2UgYWdncmVnYXRpb24uIA0KSW4gb3VyIGNhc2Ugd2UgdXNlIHRoZSBpbWFnZSBt
YW5pZmVzdCB0byBkZXRlcm1pbmUgdGhlIHBhY2thZ2VzIHRoYXQgDQp3ZW50IGludG8gdGhlIHJv
b3RmcywgYW5kIHRoZW4gZ2F0aGVyIHRoZSBsaWNlbnNlIGluZm9ybWF0aW9uIGZvciB0aG9zZQ0K
cGFja2FnZXMuIElmIHRoZXJlIGlzIG5vIHBhY2thZ2UsIGUuZy4sIGZvciBzdGF0aWMgbGlicmFy
aWVzIG9yIGhlYWRlciANCm9ubHkgbGlicmFyaWVzLCB0aGVuIHdlIG1pc3MgdGhlIGxpY2Vuc2Ug
aW5mb3JtYXRpb24gZm9yIHRob3NlIHBhY2thZ2VzLCANCnVubGVzcyB3ZSBhbGxvdyB0aGUgZW1w
dHkgcGFja2FnZXMgdG8gYmUgY3JlYXRlZCBhbmQgYWRkIGV4cGxpY2l0IHJ1bnRpbWUgDQpkZXBl
bmRlbmNpZXMgb24gdGhlbS4gOiggSSB3aXNoIHRoZXJlIHdhcyBhIGJldHRlciB3YXkgdG8gaGFu
ZGxlIHRoaXMsIA0KYnV0IHNvIGZhciB1c2luZyBlbXB0eSBwYWNrYWdlcyBpcyB0aGUgb25seSBz
b2x1dGlvbiBJIGhhdmUuDQoNCi8vUGV0ZXINCg0K

