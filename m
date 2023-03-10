Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E26F0C6FD1E
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 22:39:11 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (APC01-TYZ-obe.outbound.protection.outlook.com [40.107.117.45])
 by mx.groups.io with SMTP id smtpd.web11.33583.1678487949013443680
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Mar 2023 14:39:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=aBPDxBr/;
 spf=pass (domain: advantech.cz, ip: 40.107.117.45, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6Zbl4hSJi3VWpA28x+QIu95CgL9tmJOvQmdZ7GPNJ9xmeTvClW6wXOp1TeI1zKc+SCUwziwEtwvjtBX/OdkaLmoM9Xl3xPnGXl79kItxkWTUb6TgEnRQYLHhXk19SrU1uY54sDosjYlT+4s6b/7sbRNpzpy1/AUaxBTAir5X7809oNAOZmthLYwRiJLUtDLu/riViq7a7kP7f1psY+MWpEZJ0WP7MOIazW5iroVt5R8Rm5enbsiypK3Li47BJQCFrMnLBJyNcnNh3SiiHWn2HIC17y3PdPJpbhxfxthc9zI4D3DmN48GwWdQgb0/se/zUIVR2qT2j+5pIbKZ6wKxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxZYmkp/0KLMqjzI70stzag4PnDuZZAhepy2IROEEyY=;
 b=lKOXMC3aW6Abys7+z+xxxB1dvMojkOJPczTwbpbidRXFhGroXgrI0xjqsrp+zgBi5v6H1UpfrEhzjQA/5s7RsQiywZUlY2LbnTKZLZmGur3ogKc3qaAglmNYfY8YZuZCXjUXwlZ0c1OhB9Pv8+8+QImSnGh0ZU12UF4yvjd9GmnJdAQklwnc6PdR/F1yPY7JYhEG/3unQ1vtizo9lAIr5E3Dy1HDPN3j2FcDWhXAqu/3017fIwkNNpRFR5X6b1plUu4qzE5H1wL3nmt4X52BZXcMQpMXtkUNHKby8OUZcyGdY0GjS4P8j0DqtD/faczo3EjaG3kQ9W3AgyOdfVuMQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxZYmkp/0KLMqjzI70stzag4PnDuZZAhepy2IROEEyY=;
 b=aBPDxBr/Tgmlh6fzjlemOJVV0lCzGOFIO8tVAHrQ4GjmIc/4sCROrlevnQerFVLsn4jwH5TgOiQfIh0/U5t3V98X6I3MoatQyGlEuucyMpB2UfMshgH1hAdHMBP4ycCGU1tcL++/DkpyyaBiC7p2jG5fRcwlv6tpZt8sOf8OSAsNzfFYjuZ8yGROeyt0yOnsI9jGqV8pmE5sGde5BuSDEqGkdylfSThC7ZxwcTyl7vei6PZVm5M8QNKslkyBSk0QUXxxTY0oaPULdsRqNCGy9k9b+6J+Idk7MTOv7E/XKXMUBwyU+oNwfprbMcW5+U93Xep15bJjnZVv4HHjpLaBGA==
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com (2603:1096:404:b7::12)
 by SI2PR02MB5658.apcprd02.prod.outlook.com (2603:1096:4:1aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Fri, 10 Mar
 2023 22:39:05 +0000
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::6a6:5f44:5e23:596d]) by TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::6a6:5f44:5e23:596d%5]) with mapi id 15.20.6178.022; Fri, 10 Mar 2023
 22:39:05 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libqmi: upgrade 1.32.2 -> 1.32.4
Thread-Topic: [meta-oe][PATCH] libqmi: upgrade 1.32.2 -> 1.32.4
Thread-Index: AdlToH0CELdxfNagT66+o1TIxe7P0g==
Date: Fri, 10 Mar 2023 22:39:05 +0000
Message-ID: 
 <TY2PR02MB36782B1B99ACAFF9985D8F2E81BA9@TY2PR02MB3678.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR02MB3678:EE_|SI2PR02MB5658:EE_
x-ms-office365-filtering-correlation-id: b1db000a-f835-4c7b-481c-08db21b84115
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /dUlX3i9OWYXm9jSXlWNpCbU3DU0H1yNXJwH0bMgAMPmrUsedRkTON6VACYqXHzfCyNxERpryOmoVsEwMC4vy0suTEbuWVLlq3p9iw5hAjXilI3QOiO/z7wlkfy93gjNKs7H0tztLDJ0EreNYjYGo/m9nVx8yYwWd5MubvA6ArBeq1oJtQtVGQiJCSTN13BMyoqnCOImsg4Rq7cNedOjoZhwdS8aEOEH1hLKph0PLn5W0VlKwICuKCvBKX+jAlc/8762mPY2dYyqwXnvswonOE4HtfNgbI3s/AptflxpmqF+OvePH2bwQpLahVHy06SWaXdwI++xCNGrxCEHQJVFqIM6yyYcwMQtn6d9w13+uJ+tt9Nmwc3vw1v6n4OkyJnXj/ge9Um99l8ONN889AEaaYz6/9nZ3N6prDkRvLK2px7UqU5WHqmUQ7JK2HWU21DFv5TL3N8BMI6d2WVqxIKlPVeOsV3PY2H5sohDSw/MjMHGvOMxULA8lm/XeRnaPsYW0tBQ0J8vDU4abpzemN5/HkgBV1lg2p3sMf4QGkNL8ZfO4ZGJlycrEDAgaSF5MYh7SfWQ8ZQwyqY0Lb83gnfGfCfB7yIQiCl+nUFs+Fw/jH7esYoEV6QoiTjUkhfqOVYNer3dnkibM7fIh0Z/ltGrXw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR02MB3678.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199018)(33656002)(186003)(316002)(478600001)(966005)(71200400001)(7696005)(5660300002)(52536014)(66946007)(44832011)(64756008)(2906002)(8936002)(66446008)(76116006)(66476007)(8676002)(41300700001)(6916009)(66556008)(55016003)(122000001)(26005)(38100700002)(38070700005)(9686003)(86362001)(6506007)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TUNFYmQwU2VoRHBFTHI4bm1nam5SYWVMbVBXZ2hDSE5tMjBISkhQTkV6emFG?=
 =?utf-8?B?aW96Y1ZVSU53QUxJTjZnNng0cVlDaGpUMjdrd0ZGWnNzcElsbngyRjFmMDY0?=
 =?utf-8?B?NWJFeExmY1Z0TkpydXJ2WTRsZGVlMlRxeHhSZXpEZE44MU13eEJVYXU5OTND?=
 =?utf-8?B?ZVRjbVl3Y3RPWFl1NDJtVzlQVGNudVA5RFlFRHlmRnFrNVFGVnh5S0l6RCs3?=
 =?utf-8?B?dzM5RjU5ZmNaT1UxRWt5VW0zc1loNkFMRCswS01aZUQzNzdoSzhneUxDbFkv?=
 =?utf-8?B?cmlIZFNEbWx3dTVzODB1Nk9sdHM2WllsMWw5eWxrcjBMbTBMRnh0ZEI3Z3pj?=
 =?utf-8?B?MUxEWTJuT2oxUnpjLzdGTXFaZ2lSSG1xRkN5SW1KMGtzRzlqUFZMb2Z5U1VX?=
 =?utf-8?B?aVlGU0tQSnZ4T1JabFgrNFlGOWNDeGs2VFVRRGpLcDVJQ3NQMjNyakxtdTY3?=
 =?utf-8?B?SnRKMUc4MWNLaEJrVVM4aDBwd09kUDAwRENQWmVkbTIyMjVMblcxcWpYVm5j?=
 =?utf-8?B?VVMwTG1VU3VKeXEwcWZPY1VZQ0VTbkw4VGdrcStqRHVEdmtuZE9qc1JGNVUy?=
 =?utf-8?B?ZHFIQmJjY0VZNGtzWHZ1VktqWlZTWC9HWGJQdEE0SGp2VVZXOTVxZ0ZwWkVu?=
 =?utf-8?B?UDhzOXllamgyWEF6VVpkMmRabmxrRUxPNEg5WGg5emxEaXhNK2w5Mk1OQUJF?=
 =?utf-8?B?RjlCRUFGeFZ4TEgvdUV5YjE4SUViQTJZem1OS0NtVFdubThUYXE0Ty9uWWJ4?=
 =?utf-8?B?ZVFjbWw0bUdNQktyYVU0NFZnRGFTOUxZTjVqdGtOQ3VnSEJkZ3VQd21MbkhM?=
 =?utf-8?B?L2d5U3hWNmR4K3oxUjh2emM4U004MStKZnJrYzZqSExZUEFWUDgrMHc0bTAr?=
 =?utf-8?B?UzZObit2RFpTQlBwblRTNkZYMHZmOFlZR2grdVVuZWhyTFF0UTJsOFBybTdK?=
 =?utf-8?B?aHNsc25TSHNKb2QwN1FBSnJKSENJSWxxNjVMMkdpdGtkblVYV2F5NmxENGZo?=
 =?utf-8?B?NzJpL2ZzOXYzSk0yQVdnUjZxaTlpREEvNy81TVBHUW5uYWRWWStCbWN1QWR5?=
 =?utf-8?B?bVBHbnBGTTk2bENJRFhSZ3F5OXRvdzdlRUU5U3h0RTd1ckY3dVBhQ2FONk9h?=
 =?utf-8?B?YXc1OEVCYnJnczJVZ1E2OGcvSEFQbWNVUThuL2JoM3gycEsxQXR2eE42YWRk?=
 =?utf-8?B?TzgyU3g1TSs4RnNGOHJxUTVYQnNpZ0M3SjlNdllvcFNDbnVmL1BaNFFPUTBp?=
 =?utf-8?B?L0lSRnZ1RFhZYy9MR1J4TlpZem94OHBLZWg4cTh6Wjc3UGMydEliMnFuazBB?=
 =?utf-8?B?TmxJemdhWGQ2RjB0M1BtNWZ3cmFsODhqbzJleVJYdGswUElTYlNoVVlHTkwx?=
 =?utf-8?B?QzVEQUJmMksrai9GcE8ySG5seFBUT0ZUMFpYQWh3eFA5cjIvSzJYeksxamRr?=
 =?utf-8?B?UFJ2K3Rma2kvRFRzVlZMYUlleHVhdjJ3bFVyeDluZkhQdUpMMjBCNmkwU1I5?=
 =?utf-8?B?a2dMY3pXdXN3MHh6TmcxcC93N0VXU0JMSTlLYnJPRmQvWE1vSDlVNTF2MjNE?=
 =?utf-8?B?alNhSXNiZ1FZU1k2bk9pYjlhL2YyRTZKTFNvVXF1RDdhRDV1RXJwa0p6Kyt1?=
 =?utf-8?B?a3ZjaEViT09OZVZsOUxNRWRvbE1WQkdHNUJ5anNvMlhQNXU1RHJwa2tOak9Z?=
 =?utf-8?B?TWF1ZmltRlNnaG9NSGNxalpJVExvMlAyWm12QmlUR2QzalRpd0wvU3YxL1Jv?=
 =?utf-8?B?WUZBN3dzNldlRGNYcXFVcG5BNGY4a2ZINUphbHhDV0JlcDZ5Y1dCYWFMbHVD?=
 =?utf-8?B?NURRaEJ0UWZ5M3dUMVhDR1ZRb2dYTytjcVZoR2ZZdUlIMHBFVVJMM3VIRmdL?=
 =?utf-8?B?NkxCUmtBZHkwL3NQUitWUTNVcEJVMnlLSHhuVDh2bmhKUVlHdk5OSEdtOEtH?=
 =?utf-8?B?d3Q3UjM3YWdkQ1N5R0xKUDZQZEVhS0VLTUFNUXZxcWk1SXYwMWpKMFFBd0lO?=
 =?utf-8?B?N2dOeHV3ZE9rbEsrZ3NGczNMMjd6eXYvNmNKRXZ3TTFDei96SHFGNFlnUUxS?=
 =?utf-8?B?NVhRcTNQZU9OczJCaFM4a1NBM29SbERwVXlHMVA5aUZnSFkvYXdldXhHbThk?=
 =?utf-8?B?NWtEK2Z6UG1uM0Y2ZmY0YlF2MXlPVUtIR1lyWWN5dytIUUh6SjZON0JQRkZs?=
 =?utf-8?B?V2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3678.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1db000a-f835-4c7b-481c-08db21b84115
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2023 22:39:05.1888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XtxdCnPFxW5sEA2O4T54OqYrUl3hqHxJLQ2Y3J3znpy2MljiA1+hR3mOSRckNvgozAXF27jY4M2WtN3kY6BMhZhpM2FRvEh6NTp163K1zVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR02MB5658
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 22:39:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101499

Q2hhbmdlbG9nOg0KaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21vYmlsZS1icm9hZGJh
bmQvbGlicW1pLy0vYmxvYi8xLjMyLjQvTkVXUw0KDQpTaWduZWQtb2ZmLWJ5OiBQZXRyIEdvdHRo
YXJkIDxwZXRyLmdvdHRoYXJkQGFkdmFudGVjaC5jej4NCi0tLQ0KIC4uLi9saWJxbWkve2xpYnFt
aV8xLjMyLjIuYmIgPT4gbGlicW1pXzEuMzIuNC5iYn0gICAgICAgICAgICAgICB8IDIgKy0NCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCiByZW5hbWUgbWV0
YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJxbWkve2xpYnFtaV8xLjMyLjIuYmIgPT4gbGli
cW1pXzEuMzIuNC5iYn0gKDk1JSkNCg0KZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvbGlicW1pL2xpYnFtaV8xLjMyLjIuYmIgYi9tZXRhLW9lL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2xpYnFtaS9saWJxbWlfMS4zMi40LmJiDQpzaW1pbGFyaXR5IGluZGV4IDk1JQ0KcmVu
YW1lIGZyb20gbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJxbWkvbGlicW1pXzEuMzIu
Mi5iYg0KcmVuYW1lIHRvIG1ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlicW1pL2xpYnFt
aV8xLjMyLjQuYmINCmluZGV4IDNhOTFhNWJkNS4uN2I3YTNiMjM1IDEwMDY0NA0KLS0tIGEvbWV0
YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJxbWkvbGlicW1pXzEuMzIuMi5iYg0KKysrIGIv
bWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJxbWkvbGlicW1pXzEuMzIuNC5iYg0KQEAg
LTEyLDcgKzEyLDcgQEAgREVQRU5EUyA9ICJnbGliLTIuMCBnbGliLTIuMC1uYXRpdmUiDQogDQog
aW5oZXJpdCBtZXNvbiBwa2djb25maWcgYmFzaC1jb21wbGV0aW9uIGdvYmplY3QtaW50cm9zcGVj
dGlvbg0KIA0KLVNSQ1JFViA9ICJjNmIzOGNjMjc1Mjg3M2MwYzZjMWY4YzQ3MmQ5ZGRlYTJiMzRl
YzcyIg0KK1NSQ1JFViA9ICI2ZTI0OGFjZWI2NmY1M2I0NjdiMzQzYmNhMWM0NjdhODIxMWRkMzBk
Ig0KIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tb2JpbGUtYnJvYWRi
YW5kL2xpYnFtaS5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPXFtaS0xLTMyIg0KIA0KIFMgPSAi
JHtXT1JLRElSfS9naXQiDQotLSANCjIuMzQuMQ0KDQo=

