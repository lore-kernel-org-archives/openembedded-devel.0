Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65436C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 17:00:18 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (APC01-SG2-obe.outbound.protection.outlook.com [40.107.215.40])
 by mx.groups.io with SMTP id smtpd.web11.76362.1698339609047731929
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 10:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=VmXAnc1n;
 spf=pass (domain: advantech.cz, ip: 40.107.215.40, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTcjiyC/NTBwzd9xw6giKDmQvKYBRv8nv2pH+Y4MSd17PfNP+UARLBXmtqFTUNH+QEwsuFYrh0f0TP30eZIdgvakXtn2kVkJ7OEdMc4kbAdNwHh+J0p46kt4u2u7OXal+n7GjuiQzYiWNSPw4PLtRABa28Gamq4b/I7mO4A8vMK124xzWL5CjwvwUEbj5Agn4AAbkeUsRLuvzNmLilqpMeKB7u72wqjj+QHqvOigD3483NlI7NlciqDhnFu71uGXaI3uRYP/vH4oUuJRCadhuoiyXnCPyDUkepWYwbgQe/8l+uBq5w5Bnn8umlaMs024uRDX3BJwbJj3S4UQMOpy+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKTlrnCduK+0jzgtrf3Px3DgaQDt+aYd3JN1nVrTW7I=;
 b=Wm3Ty5cUWxQQDJy3UyWsPg5PDxjonEWVD18ENREwJmgSsITOPWCRdny9lwSLaTVHQczdpo+SbpJoMJ1ZnLdIPPA+Zo6FAPtCLIJNe8N078J7tA/XnBH+7+YGtwdXZjFym7fYZOSmIZaB3Y2/dtAJ3xQqP4cRYCMUkRUf+oQXlmpgS564f96ovA1arNFVxJ9RsKunMxf8g3bTCHUjcNY4L+WZXyCSO0K/kNEZ3CHEwM6142o4nhXGfGH4vkYFWK5UqN7r5ebV+jT2SitySVwbYSesHwuYOWNo6mQ0jWgyn/G/TngclmsdqPgx28uPiPS25DdlF5xiC4FGb+t20FxW6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKTlrnCduK+0jzgtrf3Px3DgaQDt+aYd3JN1nVrTW7I=;
 b=VmXAnc1nFy3WQmcWsOjpZeTzzcEUHVHqkPzozRkl3QULJcGuJ2IUmoTMpj9WAtg80vDkaj9+KkEoOr4qtgzoBbAsrjxK53iONZAzsjR7nhsHZP0X5CQDoWCwsdbHcZ9maA10sw80M5tLkBq3rwTSUIWUH05QxCpUy6YydX8MFI6LTZYrY1IC4CQPUqOEvng4kH2xrC4K79nx06t41ysv7YsO6bTLYGhOxTfdG1boa11SvLIJd7f2MpiybVCmqQsqaSEpXl/8tZuaFrrdBIg++dBWyLLTp4naT3vWM9c42Zl3M7wrqGbw4eSiXKVK8hLx4BAu1ZVUHtjB/MNTtxENGA==
Received: from SEYPR02MB7699.apcprd02.prod.outlook.com (2603:1096:101:1e0::7)
 by KL1PR02MB4867.apcprd02.prod.outlook.com (2603:1096:820:5d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.23; Thu, 26 Oct
 2023 17:00:01 +0000
Received: from SEYPR02MB7699.apcprd02.prod.outlook.com
 ([fe80::942:8056:62be:9656]) by SEYPR02MB7699.apcprd02.prod.outlook.com
 ([fe80::942:8056:62be:9656%4]) with mapi id 15.20.6933.019; Thu, 26 Oct 2023
 17:00:00 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libmbim: upgrade 1.28.4 -> 1.30.0
Thread-Topic: [meta-oe][PATCH] libmbim: upgrade 1.28.4 -> 1.30.0
Thread-Index: AdoILSmdVayMFLngTui8FbAufSfIkg==
Date: Thu, 26 Oct 2023 17:00:00 +0000
Message-ID: 
 <SEYPR02MB7699D19CC5E18F6D9B3C387881DDA@SEYPR02MB7699.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR02MB7699:EE_|KL1PR02MB4867:EE_
x-ms-office365-filtering-correlation-id: 994b5718-8971-4c7a-7966-08dbd644fd97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3YSPxEawJKuGiCXAUDL+B2mH9Jg9vefNKRapwwJFKHa4mFAS2LGw30I1JG3qG+ZQVg0+8hQ3LoxnItP+5229Q1ssy8jiz6E8Ol7pX01Dm7JStlIsPsVWowNW3AJld5Hin4IurD2/Qr2qE8mpM5OiOJcwRE/kQ+FkPolNuRb/Zqr7yOJpqpKdfjNirQkSI1Pwy+s+AU2XOFElZJPpRgGb0GwNveMCH7U1o6Zbt0yVH6kNQ2V7thEVZL7HQB8IJ0t4l+KgP5GP+hAWUKOcMWBEUye/dXkuGoviCqHDdV2GtfWeM45lTMBPc/qV+jwRH/Me6LgiENTUuNrTosPjhsg52Fng91HuKpl0i4exTJro33vf5bBdYxuDqwko21Uu5o+r0acLf98+uxefbd8GWOrgR+oNt/k6vdmPF9YSQHDkzET/AhbTT3PaWiqmen14V4KjlCnJrp6Rye7Dlv16jETxMzKF8MmVdYrrftI38eJXmzdDahXGvEjJsclOLZBI1r301eiBoLRMlG4uffMZfuZBVq9arhnViwghPJ7l7QgBaKe7QVhb9dNMG9TcaaCgm+kEQqzNYGht8+h1lxLUMM3F/auiOJx3/BJ/nXD3654vI3A=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR02MB7699.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(366004)(376002)(136003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(122000001)(52536014)(38070700009)(38100700002)(55016003)(83380400001)(41300700001)(44832011)(8676002)(8936002)(66946007)(66556008)(2906002)(76116006)(5660300002)(66476007)(316002)(86362001)(66446008)(6916009)(64756008)(478600001)(33656002)(71200400001)(966005)(6506007)(7696005)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bjFDNnlsRlR6bUdtTXRxVjM0SzhHaUw0dktqRzd1NGNlL3JmY3paTyt4YURU?=
 =?utf-8?B?TktBNWFDTUhPY2M5c045SzZON1lrVVoxMVI4cnQxVDZFckRKcjlDQnM1am92?=
 =?utf-8?B?QlZic0pKWlBVdTlMbUhvYmhENTdmaC9sbFpTQzQ0UVFTOWRLNGtDZmE3K3RR?=
 =?utf-8?B?STREdEYyaURUMks2cVd6NVpucDErYmkxTDBTbFVFRDlkUFdWODhJS1M2RXdZ?=
 =?utf-8?B?eEFxRi9CTFpqR201WDJZTmJObGZ0SDdZMTNaWHBoRk14ZnlTM1dpM29vVFhG?=
 =?utf-8?B?cXVhamU5NEszc3Z2Z0Z3YU4rT2RqaGkzYmFrNWlVd016dysrU1laRERZSUJL?=
 =?utf-8?B?RFhWM2tBamR6cUt1YThsMW8rS2g5K01ZbnJPVzczUGpHMmpTdG1scENBcmls?=
 =?utf-8?B?QWM4dVJqcFp3MUNkSVdVeWNybzhtWW9sWmpmaU9PNHRRdU5SQ1h0eWMrVytU?=
 =?utf-8?B?TUFQaW12aFZBUUNqQWk1VTROeUNDYUhoMUl3aGR3R1p5UklnUXFucmF2R1lM?=
 =?utf-8?B?dXpYdjRMV2ZONTNzYTdjd3BKSjBFZm1USlNyVDRjREJwVFJ3UTAvOFE3MkR4?=
 =?utf-8?B?U3VhaWsxUGxhc0N2VktaRm5halpiN0pvaW12KzNhK0d2TXBiZ3NkTGlXSkNR?=
 =?utf-8?B?MmZkRW13Sk9XYjIwMzlPUFBaajBIdm1JUnE1VFg1bk9HM0xKdDVDcFJuVDh6?=
 =?utf-8?B?YVgrZmt1K0d5K0EvMHdFNXhvL0YvRE1Jc3VwTWJEMUEySkVRZndBSDFmZTcx?=
 =?utf-8?B?blVTb0xBRnUzdG5RSGVQU1dlZFpKRDNrUG9aSmF3ZDVNRWxjT2trM1JVVlNq?=
 =?utf-8?B?ZWlFK1RFQXRleE04VjBuZFI3N1gzN2Rma3RWNC9uSGluYS83bFBBNnkxVG83?=
 =?utf-8?B?NE9sOFNONVd2aVZHMm1JRjZBc2JxWFhVa2g1WFZLbE1vTUtYMmptY0VydmVK?=
 =?utf-8?B?djlqNW9NT3ZlYWVqcmF3MGthSFFIb1JOdENRMyt0UC8xQnVQZy9HSmtxNWdD?=
 =?utf-8?B?ZzdsM0N6WWw2MVIzTGd2VTNlNVNKd3pOaVJYQkRaOERUaGgzZ0xBbkhVMlB5?=
 =?utf-8?B?dXpZZm9yOEVYM0ZQZkhVQi9NVVFJWnFwOURCM1lTd0FhUFZ2L1FzcnQ5QkEx?=
 =?utf-8?B?eWxUTmZ1a2xTUEZnVXpvQjYza0g3N1VyZWc5VzhaTmZJZ3QwNVdsUTFsTG1I?=
 =?utf-8?B?QklEb3FKbWEzR0xZcjV0ZUVRQ2RsWEVJZHQxYzduWENFc1E3MHFoRnFUMXp0?=
 =?utf-8?B?UkIwZGxjOEppT1I2QXc3Y2NDTFlBQStEd2pjM0FZTjAyUDJqejZtQW14a09V?=
 =?utf-8?B?ZHRBVC9RdkNVQnFGYVIwUEJhQlhhT2EvTXVUZDV1clhVdTkzdUdTbzRBK1JD?=
 =?utf-8?B?b3R3NFlKNDVjVS9FMlRiQW9oTU5idWUrc3pHL2lNNE9ZUXphWDgvdmtjd1Y5?=
 =?utf-8?B?amRkSTZkNVF2R1d5SHVTN3VxZXB1VjZndmRRT3phNitUUUlKdlFiZGh6VnA2?=
 =?utf-8?B?UTQ2YmZFcWl0OENSd2grSTRGbmw0T0NCV0N3RTgzZURBZ1VVU2tVUFRqY3d6?=
 =?utf-8?B?UENkY1kxQzFuSERWZGQzT3B0K0pwekxxZ2VwRGt2S01ZV3VKd2ZXZWY3djFs?=
 =?utf-8?B?eGNnc1prM1pjT3dUQnIyVnpMMHVWUEFLaGRzejBXSEE5TnNIQWVRYldEdlRO?=
 =?utf-8?B?L2pneVl0UnVLRXFPQjZaWGhZdC82NjZQaFZkWWFsQnJZdVFDYzRLWDJsR0kw?=
 =?utf-8?B?VDNsMFlqSkpoY3pDQ2M2RzRkdk8xOUV6cExCU3J5ZElWcDdrYWdEMFBUR2to?=
 =?utf-8?B?bFM0TUExWkNocTVzdW12TXJuMzNIb0xEdFdKdnlSSnhLbXNJSXNTc3E3NjV2?=
 =?utf-8?B?d3dnbmY1UmpTcWVlK3pmWU1iL0dDS2JxNnM4OEQyazEydktwOGZvclRmdDVl?=
 =?utf-8?B?Y2JaZkNRMmFwOGdCemI2Y1h3aXpWVGxUdUc2Mm1WaEw1Q1dJQUxoQzdLV2J5?=
 =?utf-8?B?MUFwV2xWdHc0K3JmOStuZDYyTkRuZlVYTkE3UWlaUEUwUkZnSTRpdW9HQnBw?=
 =?utf-8?B?cmZvRGJ1YXhQL3ZKcFk3Ky85Q3NzWlZsYjkydjZhWW9QcmpzNlIwZVpsSE1Q?=
 =?utf-8?Q?U9/k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB7699.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 994b5718-8971-4c7a-7966-08dbd644fd97
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2023 17:00:00.3541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xZ43qzeZPsc4H/HPMn+FsQDqnSfUStxCoJ9UOa8gi+uNqoXw32Uzrjnexp0zAlj8ezFco8jDe25mk0aDLhNtmdGSGHPU/66JakffotxbyGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB4867
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 17:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105759

Q2hhbmdlbG9nOg0KaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21vYmlsZS1icm9hZGJh
bmQvbGlibWJpbS8tL2Jsb2IvMS4zMC4wL05FV1MNCg0KU2lnbmVkLW9mZi1ieTogUGV0ciBHb3R0
aGFyZCA8cGV0ci5nb3R0aGFyZEBhZHZhbnRlY2guY3o+DQotLS0NCiAuLi4vbGlibWJpbS97bGli
bWJpbV8xLjI4LjQuYmIgPT4gbGlibWJpbV8xLjMwLjAuYmJ9ICAgICAgICAgIHwgNCArKy0tDQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCiByZW5hbWUg
bWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJtYmltL3tsaWJtYmltXzEuMjguNC5iYiA9
PiBsaWJtYmltXzEuMzAuMC5iYn0gKDg5JSkNCg0KZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBl
cy1jb25uZWN0aXZpdHkvbGlibWJpbS9saWJtYmltXzEuMjguNC5iYiBiL21ldGEtb2UvcmVjaXBl
cy1jb25uZWN0aXZpdHkvbGlibWJpbS9saWJtYmltXzEuMzAuMC5iYg0Kc2ltaWxhcml0eSBpbmRl
eCA4OSUNCnJlbmFtZSBmcm9tIG1ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlibWJpbS9s
aWJtYmltXzEuMjguNC5iYg0KcmVuYW1lIHRvIG1ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkv
bGlibWJpbS9saWJtYmltXzEuMzAuMC5iYg0KaW5kZXggYTM1ZDk4OThlLi41OWQ1ZTg3YjggMTAw
NjQ0DQotLS0gYS9tZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYm1iaW0vbGlibWJpbV8x
LjI4LjQuYmINCisrKyBiL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlibWJpbS9saWJt
YmltXzEuMzAuMC5iYg0KQEAgLTExLDggKzExLDggQEAgREVQRU5EUyA9ICJnbGliLTIuMCBnbGli
LTIuMC1uYXRpdmUgbGliZ3VkZXYiDQogDQogaW5oZXJpdCBtZXNvbiBwa2djb25maWcgYmFzaC1j
b21wbGV0aW9uIGdvYmplY3QtaW50cm9zcGVjdGlvbg0KIA0KLVNSQ1JFViA9ICI3ZjFjNzkwN2M0
NjU0YmE1YzYxOWE2MzVjZWY1NDc1Y2ExNjFkMDI3Ig0KLVNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9tb2JpbGUtYnJvYWRiYW5kL2xpYm1iaW0uZ2l0O3Byb3RvY29sPWh0
dHBzO2JyYW5jaD1tYmltLTEtMjgiDQorU1JDUkVWID0gIjg0MTU2ODdlNGYzMGFlNWUzNmY0MDdm
MTc5YzgxNDdmMTUyOTcyNWMiDQorU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL21vYmlsZS1icm9hZGJhbmQvbGlibWJpbS5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1i
aW0tMS0zMCINCiANCiBTID0gIiR7V09SS0RJUn0vZ2l0Ig0KIA0KLS0gDQoyLjM0LjENCg0K

