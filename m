Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8275C636D3
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 18:04:06 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (APC01-SG2-obe.outbound.protection.outlook.com [40.107.215.43])
 by mx.groups.io with SMTP id smtpd.web10.16593.1676225025327040631
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Feb 2023 10:04:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=ON5gxKq3;
 spf=pass (domain: advantech.cz, ip: 40.107.215.43, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPiSkCsOKPumIWECgsWkBET4UuEm6Vl6gAKS9HHoy7dvUNanAmL94FvGlEjl5G2YM3gt+U3S6RsEp6SQGi/o5aCq5juK/Mon02pZrzcfPpnj0IEV271s/78k9smZA2jwXJTTPHS6i9J21NvoJPjmzPGYCkgvYrPvwRIXv++ridnTtjfpwffsTZGICBid7/1Oon6w45pqaI29VqiOIAqYbTzFUUWDi7yANXstx+NjbjrgmOm7eXdO5o0PByLYge85x6qQYSGHmO2gQ+eg7C103IGHeBXL0Kzaw0cRCKi2B3ketE0x5j91xvWQRHBUWYZk7ZW70P4/xjTuUq4bQfgiWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAyanIRe3yCTSwsbGD6gv6SmNdZUx82T12dZM3Uzv/Q=;
 b=U5NPmJpRw5MvqpIvooyM0hvdBBQyOvuc1S1CSDttK9txk4JxWiBgaTXXVY0zKC9DjyrxbfAfCTcLMeMMgtZGJT/Mc7ix6XMtuipag1DJa7Q+j1Us/QfR+QtzuZ5ftM3FCNmJAw0GkST6BcktMAoyQ6kOT4QwfiEJZLx2CzqQq7oWjXtr6F+kpK56bP04os4qUucjc6tQG9vXtCYJWEA5J0rrLzZPj3Afl8h30UqlAaY6fl08hB4GWu9sRlpUHNUVVEoL9bycXCWOuLrWgelIRVXTsAdenTwact1VwD+5yQKaBOOIIbdERxkn1jzh/VIBdbGKRJoOZWJV1Jxt/q24EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAyanIRe3yCTSwsbGD6gv6SmNdZUx82T12dZM3Uzv/Q=;
 b=ON5gxKq3LtiVsPnowjLo7XKjwKAuUyWYt18x7amnLuGj9Fy9OlK1ikCslrbbUlS5/wDv30OBPMOOjMxbt+iP0tAj1VLnj51yn3GfSFDM7QiaN6PJm4K5vCB3xl951ugwQ4jb3k7tIUU9MX8dvB1yYaZlfFamo4Mp7hdFeXrzL0hf+dKcDD3JqY4ukvRpmYrckKfRVUusHVSFwZEsnxhONHm1pCb4k5djtLATzk6hKc0ryUspOy35zysqVExURLSS7XkYoTkTgSeSw4I9bQawt6i7l+ctHcR08XQZsm0rhx8uA0WXz+9Ultb3U+vmwUbbGMg/nC/F8okcvUw/9xeLJg==
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com (2603:1096:404:b7::12)
 by SI2PR02MB5067.apcprd02.prod.outlook.com (2603:1096:4:15d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Sun, 12 Feb
 2023 18:03:51 +0000
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::e2f4:d03b:1736:e417]) by TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::e2f4:d03b:1736:e417%7]) with mapi id 15.20.6086.023; Sun, 12 Feb 2023
 18:03:51 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/3] libmbim: upgrade 1.26.4 -> 1.28.2
Thread-Topic: [meta-oe][PATCH 2/3] libmbim: upgrade 1.26.4 -> 1.28.2
Thread-Index: Adk/COuGXN3iv6HjQDO7EUNHRGsT0A==
Date: Sun, 12 Feb 2023 18:03:51 +0000
Message-ID: 
 <TY2PR02MB367837142FF6F4E91D3F814481DC9@TY2PR02MB3678.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR02MB3678:EE_|SI2PR02MB5067:EE_
x-ms-office365-filtering-correlation-id: f9fa8fda-af92-4bbf-f06d-08db0d237f7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 oZJSax7bzL+/gHp/ic+C4EyPvSOzY0yZZZ+UMNXz3Bd3wuHf6jZ03vB/ghTFX2C6V9s6r/aw8WVFvvFuW6AfWvd3RVOsaJ6q7d493Lh7xskyMoQAdFHyE3amNXez9tTBIqdxtdyOzPTEPGUQ/A42nTQdQIGkHho+xd+UQbpvOq7NglgvQUHujQDNO8Aw5Q6e9QNDccp1X6hGuDcLO4EqupgFZ2jaejd0lNZdzRaML+QJkQsI0NFKUVBKGfOn8hmal6uQtr2ShZh3u0tpH6c0Pa62b+z15ewGQA0MKzi3hYBaSkjhI3EPkfo4NOz2TULAFfQwHKY74gwu2hNDpHiEXDOUq7iTi6tsnP3aE7v9qKQz8QM1z9Fz5ZOWJyHsKQS+Tq+ezTL4PY6RGPWiPd1yMx93M5MlH+ioTnbO37Nqi2ODYlbmkehbIzhW9MU2MrVHV5OWyaG/y8BH57+8jIPs1vMLKeYk9ThwYyPvTq1a7MXqhfwV4bkDyA1S684DawYFkvuVeByniH0hnXuDqf9SLSVhI110cqGUSl32uoatl8tBEb8l+VL+/gg76EWUa2J5HhZqRQYwuGqQAXnbsvMyZIkhAzKssU/AxEh2JlE9UxG37LAtIERzWrylnH9D1WnJFMsSA/4aw51r2uwd96NFpw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR02MB3678.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(396003)(366004)(39850400004)(346002)(451199018)(8676002)(8936002)(71200400001)(7696005)(52536014)(38100700002)(55016003)(44832011)(2906002)(5660300002)(86362001)(122000001)(9686003)(26005)(186003)(6506007)(41300700001)(966005)(478600001)(316002)(66946007)(76116006)(6916009)(66556008)(66476007)(64756008)(66446008)(38070700005)(33656002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TitSVmpOZnRpR3pFdTFnUkZDalBaVzlUQytkdk81anZGaitxdmRhWitRU1Zm?=
 =?utf-8?B?djkyZURaWXpET3pScm9NVlVUeW95RE5pZmxXLzErNlRsbFZLUERzV0pBd2F2?=
 =?utf-8?B?Qkdmb3hWQWNCQWtGVjJObXgrMmo1MnRuYlVBalQ2dVFvelpuOEhDYzliakNL?=
 =?utf-8?B?Sit5dEQzYmJmMXY4MjB4ZFVxMHZtQUttRmZ2bWJZelRMbkdGMmp5eUs0RFY0?=
 =?utf-8?B?TjNEcUVDVmJzUlJXaVovL0Z0eGp2aUdmQTJMd0NMNFNWZlZobFhvSFNmYTZ4?=
 =?utf-8?B?bTh3SjZNbUZLTkRKWjY5TDZSVkRiRVBhLzdKYVBzRFl2MEduR1BSbjJFVXNj?=
 =?utf-8?B?SzBBZlliWXpoRnZQVU04QTJSVTh0ODlheEM4ak5MVzh3SGVTdlN4M25hd1dD?=
 =?utf-8?B?VldpOEhrSC9KU01xMTZ5WGJRVlVGL0JWeTRMMThrdXNqZm90dEtEc2t0MXU1?=
 =?utf-8?B?bHJnWVgxdmowdllwNXNiTEp1WGM2cnllTkVqNVhxRURCSzJRTW9mVVFTNHYv?=
 =?utf-8?B?REQ3OXZVRFRuckFzZCtLb0NEQm9JSTlaWkIyQ04vSXBmREJHNUJSQ2tlbHlj?=
 =?utf-8?B?cU0yeERXOVpNOFFwS3JkUFBra01mN0ViUmwvbXpRc295aXNxMUNDcGdmbzRY?=
 =?utf-8?B?UXZpYk5ISlJhR1RwWk5YTlJoc0Q1UW8wL1NERTY3eVlIWG9EYU0wS090N0Ji?=
 =?utf-8?B?dTYzWDNHMFcxV3FZaFhXT3lQbER3WHdRSFI2Z0JlK2M3QTYremxyWDZsZ1pa?=
 =?utf-8?B?RWwxZy9FbUpBM0tSQVljWkxuUUtidGdiU2ZZazY0NjJDYWVyeTJZd1ErQWhZ?=
 =?utf-8?B?S3VPNytudTN6dWxra3hiK2RjMXk2aU1yUmFkbmVnanpvZ1FEOUdkcVg2YXQy?=
 =?utf-8?B?SkJqWEdqTkwwazN5b09OQVBXcmJtTTVYRXJzUDREUFN3ZlBSeW1oZk56THdx?=
 =?utf-8?B?ZXhRM3BRNy94bndVUWYvdzhNQytOLyszbHR4WGZ4blJMRVQycFpQT0Zkb0h2?=
 =?utf-8?B?UDdXMFQxYlNoU2wyc1dITUVFSTl1dyt4Q1hINGI4cjB2NGIvY29EbVhEaUZj?=
 =?utf-8?B?cng3bVY0Sk1OR2tlc0xHVVBTdXNiYXZYdDNFTVR4ZmhPNTQyNXlEdmVsWkYx?=
 =?utf-8?B?b0JUaE1CY08rQzZiOG1QVmkwTEFXenp5TTVtZnRUYmNYeiszd002ZnYzVEFv?=
 =?utf-8?B?ZEdYS2VKMW1UWkRLT0VsWWs1YWkvY2JOejZkVFVEMHdJTFFjRlp4Mm45emZQ?=
 =?utf-8?B?QURycklNTHJaQzc3QnUyNHVpZkFRQWh6UE9hR1E4N0tEMVNmNmYram5LL2Ns?=
 =?utf-8?B?ZFh5aHpDc1BOdUpNZm5aa09pU2xDVkN6S2ovdGZVamJUUDVSWldOQjR2dmFI?=
 =?utf-8?B?ZUU1RVBzZ2ttVS9lN2VOZ0cxQXptSUUzNVpiQ05rNGsxYXFZUi9UNDcvZTU3?=
 =?utf-8?B?ZFdpemg0T3MwYUZ5SHNEVUVLMEJlN3FuTW9odTJjaDFVMlpYdWs2eHU2L21o?=
 =?utf-8?B?d0VoQlJhd2o0M0NNcmhrQzEyNmc2MzBINklEcXNKZEo1NEp1R1llQTZySTZx?=
 =?utf-8?B?Q09Mcm9NYUxDc0RiSW5kamZ0TExXbWZUaXpqWnE2UjBXN2RLUkVMb1kvR2tx?=
 =?utf-8?B?MUF1S0hHR28rVTdzWmpQTHExSTEvYksyK04wZE1qQXNQc1ZFR2IwZlY2djBl?=
 =?utf-8?B?eWpyQUVsWjVYWWlwQktnOGRKY0JaMTR3SjUxL0RzQ0JQaUorOXY4d0RsOU8v?=
 =?utf-8?B?Qk1CV2RLRmNnSFU3RnhOUk9HanZKS2xBQ2hPMVhQdlBjeHFhM0FvN3R1aDRH?=
 =?utf-8?B?eWFKd21MYUNCd1FVSDZPVmpaNXRvN1kwWWNHRjN2VWZUeHFCemRma01WZXo4?=
 =?utf-8?B?Y2VRRHRvaklRdmlaaERUdjRtN1ozRHdtUGV3R1lsVHlVeDVEejJRLzRTMkNi?=
 =?utf-8?B?QUV0NGtJZWExRVpjK1hYanR1SWpxNVRUNzNOK2RreERiUFVEb1Q5bDB0NW9w?=
 =?utf-8?B?d0VaeDJZM3ZtenFXMkdBTUVpL05RN2JhWEtRK2VIc2tqZHo3K0M1VU1wSnBT?=
 =?utf-8?B?TDRVOGxPNVdQRDRVNTZXeFBnaDNBODlWK1F2TUYzVVpRS1VFWXpJdEF1TlVG?=
 =?utf-8?B?ZXk2Y1piQWhDcnpiZCtWRXN5SGMvWFZ4OXliUm92c0xCMExERjJOWm9XL242?=
 =?utf-8?B?elE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3678.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9fa8fda-af92-4bbf-f06d-08db0d237f7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2023 18:03:51.6630
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u0UxLYmmTfQgEqeWKzTL0WSmJqZy6zcTK2Vbc4ielTKDIyRPS3Pk0WOYgY+4KrJii3gksoUnvb52LZv9mb8dnddRXh7Nj9HygCUEJI7aXjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR02MB5067
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 18:04:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101058

VGhlIEdOVSBhdXRvdG9vbHMgc3VwcG9ydCBoYXMgYmVlbiBmdWxseSByZW1vdmVkLCB0aGlzIHJl
bGVhc2UgcmVxdWlyZXMgdGhlDQp1c2Ugb2YgdGhlIG1lc29uIGJ1aWxkIHN5c3RlbS4NCg0KQ2hh
bmdlbG9nOg0KaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21vYmlsZS1icm9hZGJhbmQv
bGlibWJpbS8tL2Jsb2IvbWJpbS0xLTI4L05FV1MNCg0KU2lnbmVkLW9mZi1ieTogUGV0ciBHb3R0
aGFyZCA8cGV0ci5nb3R0aGFyZEBhZHZhbnRlY2guY3o+DQotLS0NCiAuLi4vbGlibWJpbS9saWJt
YmltXzEuMjYuNC5iYiAgICAgICAgICAgICAgICAgfCAxNSAtLS0tLS0tLS0tLS0tDQogLi4uL2xp
Ym1iaW0vbGlibWJpbV8xLjI4LjIuYmIgICAgICAgICAgICAgICAgIHwgMjIgKysrKysrKysrKysr
KysrKysrKw0KIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25z
KC0pDQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGli
bWJpbS9saWJtYmltXzEuMjYuNC5iYg0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2xpYm1iaW0vbGlibWJpbV8xLjI4LjIuYmINCg0KZGlmZiAtLWdpdCBh
L21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlibWJpbS9saWJtYmltXzEuMjYuNC5iYiBi
L21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlibWJpbS9saWJtYmltXzEuMjYuNC5iYg0K
ZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCA5N2YzZjY4MjUuLjAwMDAwMDAwMA0KLS0t
IGEvbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJtYmltL2xpYm1iaW1fMS4yNi40LmJi
DQorKysgL2Rldi9udWxsDQpAQCAtMSwxNSArMCwwIEBADQotU1VNTUFSWSA9ICJsaWJtYmltIGlz
IGxpYnJhcnkgZm9yIHRhbGtpbmcgdG8gV1dBTiBkZXZpY2VzIGJ5IE1CSU0gcHJvdG9jb2wiDQot
REVTQ1JJUFRJT04gPSAibGlibWJpbSBpcyBhIGdsaWItYmFzZWQgbGlicmFyeSBmb3IgdGFsa2lu
ZyB0byBXV0FOIG1vZGVtcyBhbmQgZGV2aWNlcyB3aGljaCBzcGVhayB0aGUgTW9iaWxlIEludGVy
ZmFjZSBCcm9hZGJhbmQgTW9kZWwgKE1CSU0pIHByb3RvY29sIg0KLUhPTUVQQUdFID0gImh0dHA6
Ly93d3cuZnJlZWRlc2t0b3Aub3JnL3dpa2kvU29mdHdhcmUvbGlibWJpbS8iDQotTElDRU5TRSA9
ICJHUEwtMi4wLW9ubHkgJiBMR1BMLTIuMS1vbmx5Ig0KLUxJQ19GSUxFU19DSEtTVU0gPSAiIFwN
Ci0gICAgZmlsZTovL0NPUFlJTkc7bWQ1PWIyMzRlZTRkNjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYz
IFwNCi0gICAgZmlsZTovL0NPUFlJTkcuTElCO21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhi
MzY0NTE2YyBcDQotIg0KLQ0KLURFUEVORFMgPSAiZ2xpYi0yLjAgZ2xpYi0yLjAtbmF0aXZlIGxp
Ymd1ZGV2Ig0KLQ0KLWluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBiYXNoLWNvbXBsZXRpb24g
Z29iamVjdC1pbnRyb3NwZWN0aW9uDQotDQotU1JDX1VSSSA9ICJodHRwOi8vd3d3LmZyZWVkZXNr
dG9wLm9yZy9zb2Z0d2FyZS8ke0JQTn0vJHtCUE59LSR7UFZ9LnRhci54eiINCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiZjY4OGNlYzRjNDU4NmExNzU3NWY1ZTMyNzQ0OGNlNjJmMjAwMGVmNmEwN2M5
ZTQ1ODk4NzNkNGE2ODU2OGFkOSINCmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2xpYm1iaW0vbGlibWJpbV8xLjI4LjIuYmIgYi9tZXRhLW9lL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2xpYm1iaW0vbGlibWJpbV8xLjI4LjIuYmINCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQpp
bmRleCAwMDAwMDAwMDAuLmE1NDliZGVkOA0KLS0tIC9kZXYvbnVsbA0KKysrIGIvbWV0YS1vZS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJtYmltL2xpYm1iaW1fMS4yOC4yLmJiDQpAQCAtMCwwICsx
LDIyIEBADQorU1VNTUFSWSA9ICJsaWJtYmltIGlzIGxpYnJhcnkgZm9yIHRhbGtpbmcgdG8gV1dB
TiBkZXZpY2VzIGJ5IE1CSU0gcHJvdG9jb2wiDQorREVTQ1JJUFRJT04gPSAibGlibWJpbSBpcyBh
IGdsaWItYmFzZWQgbGlicmFyeSBmb3IgdGFsa2luZyB0byBXV0FOIG1vZGVtcyBhbmQgZGV2aWNl
cyB3aGljaCBzcGVhayB0aGUgTW9iaWxlIEludGVyZmFjZSBCcm9hZGJhbmQgTW9kZWwgKE1CSU0p
IHByb3RvY29sIg0KK0hPTUVQQUdFID0gImh0dHA6Ly93d3cuZnJlZWRlc2t0b3Aub3JnL3dpa2kv
U29mdHdhcmUvbGlibWJpbS8iDQorTElDRU5TRSA9ICJHUEwtMi4wLW9yLWxhdGVyICYgTEdQTC0y
LjEtb3ItbGF0ZXIiDQorTElDX0ZJTEVTX0NIS1NVTSA9ICIgXA0KKyAgICBmaWxlOi8vTElDRU5T
RVMvR1BMLTIuMC1vci1sYXRlci50eHQ7bWQ1PWIyMzRlZTRkNjlmNWZjZTQ0ODZhODBmZGFmNGE0
MjYzIFwNCisgICAgZmlsZTovL0xJQ0VOU0VTL0xHUEwtMi4xLW9yLWxhdGVyLnR4dDttZDU9NGZi
ZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMgXA0KKyINCisNCitERVBFTkRTID0gImdsaWIt
Mi4wIGdsaWItMi4wLW5hdGl2ZSBsaWJndWRldiINCisNCitpbmhlcml0IG1lc29uIHBrZ2NvbmZp
ZyBiYXNoLWNvbXBsZXRpb24gZ29iamVjdC1pbnRyb3NwZWN0aW9uDQorDQorU1JDUkVWID0gImM5
NGI4NThkMWM1YTk4MjM4YWRmMGU2MDA2ZTQ1M2M5ODRjOGU1ZDUiDQorU1JDX1VSSSA9ICJnaXQ6
Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21vYmlsZS1icm9hZGJhbmQvbGlibWJpbS5naXQ7cHJv
dG9jb2w9aHR0cHM7YnJhbmNoPW1iaW0tMS0yOCINCisNCitTID0gIiR7V09SS0RJUn0vZ2l0Ig0K
Kw0KK0VYVFJBX09FTUVTT04gPSAiIFwNCisgICAgLURndGtfZG9jPWZhbHNlIFwNCisgICAgLURt
YW49ZmFsc2UgXA0KKyINCi0tIA0KMi4zNC4xDQoNCg==

