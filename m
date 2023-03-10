Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E54C6FA99
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 22:39:51 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (APC01-TYZ-obe.outbound.protection.outlook.com [40.107.117.88])
 by mx.groups.io with SMTP id smtpd.web10.33525.1678487982668423508
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Mar 2023 14:39:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=F5476nEC;
 spf=pass (domain: advantech.cz, ip: 40.107.117.88, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bji9LOtGGDXYqGFCXfrawQysFJZefDSiP1tXSdAZbfgIQh5XADMBXtOjHm7EloIJo3FKZz86kQoaO+BxmOXLcqhSx/FJZmL+wgEU9JqFTlGafQ6sJExdCWAVcfv1HBscEy6MDCtJsvqR6tlJuLM4VVig5ys2QhC5mKyZY9w5jDNnyTUMmROSAwNpc2Nfk97SdP+fy9T5ckGp8YLiZp7Rrf5RkZYsx/4Mmg356bPm0reCO2YZlXXPROid9EDuy52dixgTciB8VhZRWphaDWHgZRTwHybeANbeQQ/l2q1EoCmUyIk9CzU4mVZ5kSJtX9JkKfjMJUunayph3LZfGEDqBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUaGjf2KDSl5kpPN0SiKuZC5sXRyfmXUNstISA5qBX4=;
 b=TAtjq8qeSYKG2Q0vcqCHtJLyZhgC8NgeOUJQsTU1yvdV4eh0DFfQn1yfx1NzP2D/cdN/++hlAGUW8257B7G2OftXJPsYmTYJfDplSxZBtqinR65+xdBOlU48BrQCS03j/L1oifbbMST4IC8XmMFVHma035iYYplt31qrCjRsmVmXp2xjzcoJLPSIruWFg3BrnnS6l3GZdtUqp68k7VV6RcaPgBP6/QehVSb1VZpdUIKwZjwURXlkg2quStFX07ze0CFlNg9E45D2qbcplEXI+wGK/5kQFp/6TQrmwkrghj2PoUTMF5DDNWb/ourqKP3BWgJCPRPlkm3QBnqRNidSjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUaGjf2KDSl5kpPN0SiKuZC5sXRyfmXUNstISA5qBX4=;
 b=F5476nECn3hX6dPj6oOrq2GEUuXX+ggP9SMufSveQuVMJmA1j7D7FHaS39TM0Lsl/nMVYi0Gt35rxIGArUZ6dPCKuO7v8sUHbeJbK9JznUzoHq33g5VmBVcansc3vvUJHisUpe8RY0nwH9RIekIRjCIWSECe03iZVDO5Eh5uyn4rlqFBE+UDYaiZmeXs6AkBYZjWkWNcgdn0snRCYZeMnBLE1EUletqC46Te+2yvLGWQg/e/rjMpQz+IAbQnYtJlSGEIFvqMAMhyiXSd9xiN88tVzrxip4zSmiCn4QrZEzuG2fOfrnPfTSH61kVSf670Y5txhPpk2o12s9VCJ6D4GA==
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com (2603:1096:404:b7::12)
 by SI2PR02MB5658.apcprd02.prod.outlook.com (2603:1096:4:1aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Fri, 10 Mar
 2023 22:39:40 +0000
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::6a6:5f44:5e23:596d]) by TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::6a6:5f44:5e23:596d%5]) with mapi id 15.20.6178.022; Fri, 10 Mar 2023
 22:39:40 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] modemmanager: upgrade 1.20.4 -> 1.20.6
Thread-Topic: [meta-oe][PATCH] modemmanager: upgrade 1.20.4 -> 1.20.6
Thread-Index: AdlToCQlmVeWVSOvQ2u6/pQ0iJbIqw==
Date: Fri, 10 Mar 2023 22:39:40 +0000
Message-ID: 
 <TY2PR02MB3678061DE639CFBE378BCACB81BA9@TY2PR02MB3678.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR02MB3678:EE_|SI2PR02MB5658:EE_
x-ms-office365-filtering-correlation-id: fe6b98d2-81f8-4657-d5e0-08db21b85612
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 m4Je13IuLk9lKHqEOG+3NmLdqzkaVXBC80lJUERGsLo2d1NMmv86IepWeFu0DRrnvoon7JhkJMda6WR4KJIbr7U6qku23+IkvsZ/DGJUO/ZLWHy1aOJhRp9L0gmpI7onLysjOAOtApBT/d4MlIBHwAMlJWesgSif8Sfg5eecyILQ1SZk3/ou47C7Z5mei2w9VY1gikCE7vt6ngcilYYgJvfYBlSM5io2U7aI+b1Yhn9FWc76VLPu3oiwoVuhd18E2EEs66Haq4dHcivcY8n6h0soH2fBSCc1vbOkrLBT/s2z81j2sjqISYCJc2aneVCyg1v8iOeB+PZ5IN3pgmWkYaGTvNvh+L7LkwSEd0DGrG3fjzm7xbW9ZGSkSrvCOXsAu6BPWaOQmWJYYsfu0PjFdbWuu4jWHtfeI4KZMgyNotgLvnYkEkl66QyXhYw9r9SnrOVnyiFmutc1yvJ0xiFvxPp5/Hhor+8JeqHwn6nkwmX5owhv6G+zbmUxQ7HBRUstirJg5PVkVnkWNlpj9bbm8NMIiEqha/A82Lkuv0zt1E1mgyYDR79q8M+AE4zdMqzcfIb3w0+UiaqopxbjYapkKWRqx/gF6O8gJzIFuR9BqaCdBpmw1aec/Wt6fM7DcjBrCgS4XHezH2IwHw8qkz4NeQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR02MB3678.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199018)(33656002)(186003)(316002)(478600001)(966005)(71200400001)(7696005)(5660300002)(52536014)(66946007)(44832011)(64756008)(2906002)(8936002)(66446008)(76116006)(66476007)(8676002)(41300700001)(6916009)(66556008)(55016003)(122000001)(26005)(38100700002)(38070700005)(9686003)(86362001)(6506007)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?d3J5K1dzV2dxd25FNUZuUGdjUU9RSVowV3BnOXZZclpObTUwd2JGcW9UWWhx?=
 =?utf-8?B?WlZYN0laM3dMZkV0TFluVDRtdHZxRzlHcjNIR29NMThOZlRaWFlqQjBoMjRR?=
 =?utf-8?B?VmhIUjg4YWlyS2daS0ZvWkt3dHNiSnBRc0hQVFpOTndKc293MEdQV0ZVeTQ5?=
 =?utf-8?B?dG9TYWRkWXVNNUlPa2J4QVBjMXlELy8wQ1lNYjcxenZOYkVCRW1vVnEyTVl5?=
 =?utf-8?B?VVQxQUFEaEhTamloQzk0cXkzSmcybXQ5Wi9DQVRpSjIzRDZXQ1hWdUc0aHo3?=
 =?utf-8?B?Q1JuSDdPUGNEakYyUVpmYXVCVFh6eHlGeTZteWF1UlRKOURCem52MmJ3NDB5?=
 =?utf-8?B?dGhHdFU5UytiRFhPMW5qNDc0WkJQMktiRG1hNGRhRWx2UkJtWFU4TFNrbzM3?=
 =?utf-8?B?Nlo3U2Rnd0FhMVlZZzlFdTB5ejlNellSUWE5U2FVVXdRaUllcFNvUWErM25D?=
 =?utf-8?B?elZXZU1YbnIyTTJaUGE5Uy9lTmNPZkVyQkZxL0dDeDg1dXdBbks1V2p1emlq?=
 =?utf-8?B?Umw5QWFxZWQxcHZCRzZ5SU1INmZVN21WVE1PVlRDRVFwNTlzYWk1am9WN2Mr?=
 =?utf-8?B?Y0Z6V3VLeVZLWm9WNzRFRXBrL3Z5WUxNOGE4OThmenJyYzBKbnhhZWQyekVp?=
 =?utf-8?B?QVNtMko2UDNOajNsMkZLR2VJUE1GYkRrZXNRSlFrVFVBVStPVE1MSGZsOXc0?=
 =?utf-8?B?dlk5MzdsZ0lsQ2xJU3lLSjNDTDRWcnlXeWs1LzBuSWNFeGZKVFRGRjFKd3Vu?=
 =?utf-8?B?V0JsNDdwcm1lNW5NMHcxRFJla1Fia1FVbGlKWE85TDhhbmxFTHdtMjNCS3FG?=
 =?utf-8?B?NGJ5dzd4eWR6Z3preHYyRlRTNnZZY25yOGdRZXpHSGZJc0lHSVJ0RGUzU0hO?=
 =?utf-8?B?T3VBd3RWMGdJcm5JMEtHM0ZmZlZiZDg4a2d4Mlh6RGVWU3owVVpTQ1JCM0Rl?=
 =?utf-8?B?RThETEhZYTBoNlU1Z3VtaWtGeDhaSnRpL2EvZnJJamtCajQrNmJDMFpOSEhs?=
 =?utf-8?B?Szd0M2YxMTdIMk5Ha25EZnJvYm10dWFQNWJtRUVFcVNDaXNzdE1tMEs4NTZQ?=
 =?utf-8?B?MGh6dUVyalJQVUsrMjdjdUgxZkNPUGlCZFNkWEhHNFNjL3g4VmI1OGFyOHhl?=
 =?utf-8?B?UEk3ellGQnNSb1FZdHZmdDJjWGxZM0R1aGhnOUtva05zZnFRc2tmaUNwRU82?=
 =?utf-8?B?azFMZzB4bCtCUnVoZ3JRcUxGYUdJYnFnYklwSlEyeUl0cjNZWVlrVHptSVF5?=
 =?utf-8?B?VXFhb0thWUl2Z29IVEtVUlBnNmhmRXRIVUNaZHJJaDU0YmpIUFVqQjJMUXFR?=
 =?utf-8?B?cjlpUWVnWWdneDFUbmlqTk8ra09UVGJnYXpONEhUcUlYTE1IQ1o4Nm0yY2NM?=
 =?utf-8?B?RTZRY3FXMFBJK0JBSzBYcWdTUlpwcUVyZXIzT0tqMXp4K3pCWU5mS2lyL2Nm?=
 =?utf-8?B?OHhmL3VUWTN3RDdsU0puMU5saGVaaC92Tlo3c2h5YXNKdTEwNmhJZGMwRGFv?=
 =?utf-8?B?eHQxQndRWURBbE9JZ1FQSTdKZDhlWUtneWNDZ0YxUzNqcWlHRnVxMnIxeFk0?=
 =?utf-8?B?THA3a3JTdmtqdFlvRERJakdWVW02UjFScitaNFlWTjhTcktwSFNpVzJiQUc3?=
 =?utf-8?B?bjZYZitldlMrWDZmNFNManJUV3pxdEIwckIvNmFQTkNsRXZzVm5TZXhIcUdZ?=
 =?utf-8?B?ZGpWUlluYU5rUjhiOHRTWXduYml6NGg5S0hQdEFZWTdSekFyeTRzd3ZKWXhj?=
 =?utf-8?B?cndvNkxZRFZnb2Vzc0kxQ04rTDQrblV5djJJVkZpcDNmcHk1c0tXNVU2VVRN?=
 =?utf-8?B?YVJyWmp5RGd2MERCVjFRd3haUmNZRU9LVW5yeUJ3WlVBUllJbUpPNDAyTGdY?=
 =?utf-8?B?dG1hY0V1MkM1Nm5RZzlXT2hJaEtnZmZ5aEZSRXJTcUVtLzdlYUR0VURtN3RX?=
 =?utf-8?B?Wjkva0IwRzVlZTJiejdTbFFBR1VWTkpiRHRwSXpMd2dPNlE2Z2pITWoyR1Y1?=
 =?utf-8?B?SmhkRVQzVXBLTlZOQ3F6WkxBelF6S0hmU2FPeVdQNWhHVWVNZU9kZkhaamNY?=
 =?utf-8?B?RUlqL29oTXZzb1BhdGlYWUhWUHJObEZ6Wnp5TjN5cU1mWkswamxxcmNSMExl?=
 =?utf-8?B?bUhBZUYveUovb2JmdmVtNysyM1l4LzhRUEJhQ2JObjFtTEV0N2gzYmRHdTUx?=
 =?utf-8?B?bkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3678.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe6b98d2-81f8-4657-d5e0-08db21b85612
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2023 22:39:40.4518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yZ8Oh1KZxp9xbo7jRjbN0Jl0kjSRfOX3Pgi2poAtLoW+DiMKrLcZVfm7NBcZH+v1cM4QSzjCM8m9c/Dw+Nvf1sl7hzBhfRcyLE8h56p4ZPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR02MB5658
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 22:39:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101501

Q2hhbmdlbG9nOg0KaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21vYmlsZS1icm9hZGJh
bmQvTW9kZW1NYW5hZ2VyLy0vYmxvYi8xLjIwLjYvTkVXUw0KDQpTaWduZWQtb2ZmLWJ5OiBQZXRy
IEdvdHRoYXJkIDxwZXRyLmdvdHRoYXJkQGFkdmFudGVjaC5jej4NCi0tLQ0KIC4uLi97bW9kZW1t
YW5hZ2VyXzEuMjAuNC5iYiA9PiBtb2RlbW1hbmFnZXJfMS4yMC42LmJifSAgICAgICAgICB8IDIg
Ky0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCiByZW5h
bWUgbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tb2RlbW1hbmFnZXIve21vZGVtbWFuYWdl
cl8xLjIwLjQuYmIgPT4gbW9kZW1tYW5hZ2VyXzEuMjAuNi5iYn0gKDk3JSkNCg0KZGlmZiAtLWdp
dCBhL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbW9kZW1tYW5hZ2VyL21vZGVtbWFuYWdl
cl8xLjIwLjQuYmIgYi9tZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L21vZGVtbWFuYWdlci9t
b2RlbW1hbmFnZXJfMS4yMC42LmJiDQpzaW1pbGFyaXR5IGluZGV4IDk3JQ0KcmVuYW1lIGZyb20g
bWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tb2RlbW1hbmFnZXIvbW9kZW1tYW5hZ2VyXzEu
MjAuNC5iYg0KcmVuYW1lIHRvIG1ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbW9kZW1tYW5h
Z2VyL21vZGVtbWFuYWdlcl8xLjIwLjYuYmINCmluZGV4IGZlNDRlZjk2NS4uYmE4MmQyMTUwIDEw
MDY0NA0KLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tb2RlbW1hbmFnZXIvbW9k
ZW1tYW5hZ2VyXzEuMjAuNC5iYg0KKysrIGIvbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9t
b2RlbW1hbmFnZXIvbW9kZW1tYW5hZ2VyXzEuMjAuNi5iYg0KQEAgLTEyLDcgKzEyLDcgQEAgaW5o
ZXJpdCBnbm9tZWJhc2UgZ2V0dGV4dCBzeXN0ZW1kIGdvYmplY3QtaW50cm9zcGVjdGlvbiBiYXNo
LWNvbXBsZXRpb24NCiANCiBERVBFTkRTID0gImdsaWItMi4wIGxpYmd1ZGV2IGxpYnhzbHQtbmF0
aXZlIGRidXMiDQogDQotU1JDUkVWID0gIjY5MjY0NTk1MDBmZDkyN2U3Y2NlYjU4OWE5ZTQxMTNk
NGVkYjA0ZTYiDQorU1JDUkVWID0gIjZhYTBmZjU4M2QwNGFlYTg4YjRkYTdhMWMyMDA0OWY1NzA2
MmRhYjYiDQogU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21vYmlsZS1i
cm9hZGJhbmQvTW9kZW1NYW5hZ2VyLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bW0tMS0yMCIN
CiANCiBTID0gIiR7V09SS0RJUn0vZ2l0Ig0KLS0gDQoyLjM0LjENCg0K

