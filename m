Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2CF5C83F11
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 15:13:23 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (APC01-PSA-obe.outbound.protection.outlook.com [40.107.255.43])
 by mx.groups.io with SMTP id smtpd.web10.28926.1693149196571119856
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Aug 2023 08:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=WCTdu49x;
 spf=pass (domain: advantech.cz, ip: 40.107.255.43, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKAdjUWe8IiaJD9ZtEG4fxt4Yvj81rLsuXfi6pjUXpZ6hkO7FHheA9o58DNPlAy9CVGFRB2JUvU1lYipnw9MDhG9PVvOpKaF27htgGDBlsmuAL5GlcPexqjWGnaL6OpL+JiAygzQvQyeB+TNfqnYamidLO6Ll9m6KniRubvv4Z3KAqZwIj9tNoJPK6Kgj8kWsD+VO22DlkXtUnLV4CcAGhrku85EBzEGutqs7+6MusOtkYbQwvjLK7wpGYyK4AU05v492WXXAKs/7DPfptM7WQeJIPdgkDnYoOT1WPi73NUkSzGK6/Z/439m8aMgHvSMmLYcT3r6f/1+zPk21mT27Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=biw4LAG/BWGV8/2DMm3DuaniY5sopZeX7/kOICTZr28=;
 b=CiSlsc/ba4mX9R1TrRBQCmWM6et/NEnkjfdY4jUdo3LBCnX6zm2hE4DrfGd89DAx5AOS16U8T3VF6ckwFiD4yBzk99MAS0faeYHw3K9w3MLn00Lri6Tws0yVI5lsm4ZCIB9ptNcHTkQ72xOooJS9SLbbW1H9lT/viB4fnvpwzbxisaX9r/cYB5rJbDybcL+sLpQkxiLV88X9KBjrblbxirkf/6mE1AtwtUVU92REBcrUQUZ5XNME+UVpx0iCgj0/sR8MsO1sYSQUv3vy1egOJ7kCX8jdyTIaRahE2YFpYaDnJmOk0YlGmzllSZBqjuMJA08VKBoLTooPsUl0MmuOhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=biw4LAG/BWGV8/2DMm3DuaniY5sopZeX7/kOICTZr28=;
 b=WCTdu49xeHxbhGBxIYd0QQogxcxQyZ5XyZCUZ+xlf9aKyx78VBQ/tVPqvJPkxcSNycDeLntJtRMVyIbLcGsESWNDadadtzpwZCxvf3F7Cr9bRf+rHxkQFh5UWQOGvS+YP5yXxzXca6fO16yMwbyeXxErsLq3u0JG5wbtihFIzeSbHyRWQpXOifkJm7jBNSsTc5wVTqOBnRweau+YGL2Nm6EfOm9GyAEccUVKTJ3c5bESOONhLC4Vb5Qp4IvMwx2ttONlKuXmcB2+kEQi0q6A/yZ/H6jRz5YY33N1uoeoP2ZxYDxSG3J7W9lexUQ/adYHE7RxbFNoYQmvket16MLBXg==
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com (2603:1096:404:b7::12)
 by SEYPR02MB6338.apcprd02.prod.outlook.com (2603:1096:101:13e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Sun, 27 Aug
 2023 15:13:08 +0000
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::5974:168:dff:f88c]) by TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::5974:168:dff:f88c%7]) with mapi id 15.20.6699.034; Sun, 27 Aug 2023
 15:13:08 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-sdbus: add recipe
Thread-Topic: [meta-python][PATCH] python3-sdbus: add recipe
Thread-Index: AdnY+E/BCDUV4CwYSTCNRmKXlrRkPQ==
Date: Sun, 27 Aug 2023 15:13:08 +0000
Message-ID: 
 <TY2PR02MB3678A5299B6D4775A7FF4FF181E1A@TY2PR02MB3678.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR02MB3678:EE_|SEYPR02MB6338:EE_
x-ms-office365-filtering-correlation-id: 9ca08b4e-8fb6-451d-77e8-08dba7101f10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 QP0zpdAryPnJYxTejSpK2swssVx/rZgPQZGLM0PP6xlTXQPae7GbOr/NprtHMq7nrauZM19Or8wRP2PHvKEv0HTgsdV8gqDTxxnKMnDPPPtw+Ra4IXn1L/DDgqj8e0QzAKb9uxQVIxPTHekTX0XkjAlD46usuBwcazLRoELSZFFLutoqFtv3R5C7lRWqDHLf/x3/tMgHuVd0iLKb3EnLwNQGCwjtN34rXfwzsulaMl96PzvLTIA8w/t3178nFzlusm0qI3g6MPc4oEOmEBQsN3zVRc4twKRXBbAquS+VAJo09XqIq6KH7qScwjKAzDi9CnCXcpO3nb9tnJLGFi1050LybnOE2YCQxDjO1HmsvReDigJ5BacvxKcg+uejA6rZuukOi5oqz2jFAq/WJqklSg0z15iJBED/IfQ4HhAUOFtGJnJQFUBsS4xmPLcQ0njeGfR4U9z/yslDvgijAOzcz8NsnAt8QXk+KW6Bryee1z1mzhceNSwxHkefrnqv/WhqUESyk3TuQNccPIWdYiFg64q+rK6AvAG6JwArkHZEUbucPzgTBNuo94Kwd7DM/htoDvNWCUzcb1g+hLMXQDDIzmiz191SfHIjm2sEJLJJinw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR02MB3678.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(346002)(39840400004)(376002)(186009)(451199024)(1800799009)(41300700001)(122000001)(38100700002)(38070700005)(86362001)(966005)(478600001)(71200400001)(26005)(9686003)(7696005)(6506007)(55016003)(76116006)(316002)(66446008)(6916009)(2906002)(33656002)(64756008)(66476007)(66946007)(66556008)(5660300002)(8676002)(8936002)(52536014)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WEtDYzkybzNMeFZxZXZFWm5sKzMxNGtmbzFQeXE1c1oyYmlLY0pHTmxJNUtw?=
 =?utf-8?B?Q1NJZ0c0SG5KV09qN04zVEVKTUt0S2JObjlITFg4T2lYenhiMnBIU2NvbHJp?=
 =?utf-8?B?clJPSHJWY09RR2hGUzZhN3BVQjUvQWY5bEk1ZjFOckhPY3UrSTJhNnhFRGFm?=
 =?utf-8?B?Z3pXVzVhc25LdTNwY3d2R01xUFdrdldhMVE1RFNXT0hNUTFZek45T0svVnJX?=
 =?utf-8?B?RW5DOUFCdXpjRXhiR3NXOE5odGVXNU5sUGdWdUNwS1VHSmh3cWNzZFpCdkZ3?=
 =?utf-8?B?di9Ha082MTRVL3RCQXo4K1VZVngwOHI4YWR4YW50VStISitERDVDVFB5MUZj?=
 =?utf-8?B?UTJZNG92OG5oWk1sbVRmdEJRNzNDMnNDbUo2Wkc0T0k0R2pQUk9FQ3BrZmg1?=
 =?utf-8?B?VUVHVStWMjJ4ZkNjZ2xsY1VKRldtNXRnbjlmelZncGVYU0JDanBCMEpFYkhv?=
 =?utf-8?B?VDMraVcxdlFsNzUrZ1NmMnRhYVQ4L0wyWmpneHhiTDFET1EvTWJXUE1maDFo?=
 =?utf-8?B?MGdEbTRCR1JtdUFOTGhMdytKMGNpbmJNUzBxTGpTNzRwUlh6YitNNUdHN2xz?=
 =?utf-8?B?b2VpQjRoNkhVdWtPL21PUG9UZDdMY24zaUVNOERpdDdpMUwrMjhwTm1WUVBL?=
 =?utf-8?B?YXFhM2tsRDM1OW5SaXVqMVFsSVBWSlFiSGl1Q2ZmSXNDdUJ6ZmxhT0tUelI5?=
 =?utf-8?B?eWVSUVpRblpCeFplWkQySFhxSU1PSEYvZExGYWVLa25KQktmRmJVcW5odHFP?=
 =?utf-8?B?alR0YityVUIwaHpVM2pjd0NYUTJVbFdKZDZWRjd0azZsRnU0WE95NExwUjhL?=
 =?utf-8?B?bTJFUjJ4UWYxWUNTU0h3TkF4cnZhcm5QV1hCb3ZhNEVzbVpwY2ZNd2lZbUJR?=
 =?utf-8?B?N2hnQ21JS0hrYjFOdlVVdkhsdGRyUCtjTzhDN0QxWVE2bi9iTXJqMXIzK1I5?=
 =?utf-8?B?ZlVNYzQyekhFS1N6U0FwY2lCRmMxamZ4YTl0N2psK3R1c3pobHNCRWlxbThl?=
 =?utf-8?B?dEUwQjFXNTRPYjdaZVQ0Z2Nwa2R1N0tZckdSeGdhU3dxdmlhWG1oWGJWSEpI?=
 =?utf-8?B?Rk54bngvNy9EK3RRU28zNUNvcTNwQ29mM3VXMkhOZmhzeFNNYW1HaU1wNVlM?=
 =?utf-8?B?RTJQNkVVRmpMWlZHN3pMcURoRUNMVlRZZkhZNEx5dld4Q212RUNTWTk0UUto?=
 =?utf-8?B?UUs4bCtFdW5GVEg3dEQ5dU1PVUpBaFo2NTZrL0VHV3lSSENjYyt2UzAwUzky?=
 =?utf-8?B?clZHOUl1ZHBaaiszZVJwVFQwK3hrdUx3c2F0ekdBQ1VFSVhHRnYzSFdyNFVG?=
 =?utf-8?B?ZXdxMmRjMU5wOHhBVEYzZytQK1pPRy9Sa09Gem1JOFBQMWpXZDBhelNETnMy?=
 =?utf-8?B?eXh4Q2d0dkREUXpSTFZWOTBqQ0luYjZLNkJScXZUY2xTRFdXVG05Y2JGdVZK?=
 =?utf-8?B?cXY2TzM5VGJuTmhvUnlyeGR3ZnZhcU12emRwV1lGeHQ2Z3VndEZnbktid0VI?=
 =?utf-8?B?ekJuZnlvK2F0Q3NCcjNrMG1UZWF3WlJVaHMxT1dBU3BoeFhYdzMxZENrWFNE?=
 =?utf-8?B?MU8rM0xZN2ZFanRqWHY0ZWpHai9nQVltVUhPdFFhUDN5VGY3V2ZsaHVVRGxy?=
 =?utf-8?B?R2t2TTJaWEMrWUZuNkVPY0I3NlNLNUZ4bzU3Rm5SQk5oSWxkMWMzVnV4VVR1?=
 =?utf-8?B?RzhZTnRyaUNQSWVTaVgyaHkxeFRZbTh4aVZZVkxCeXI5aFl4d1luTjNvenFj?=
 =?utf-8?B?ZWhBRVloZ1lHbFEyOWZGeG92c0pOZ3BaQ1JUVnJyVVRDUlNHZVk1aU9yZy9S?=
 =?utf-8?B?aFNBZGFjL0NrQzFuTEVYb1RuYmJVbjAxcjdUU2haa2F5Nkd5eEJsbWFQQWF4?=
 =?utf-8?B?TDF3N0UyS1hYWE1TY3MxMFRDT3ZFbzF5Nk5wTlFiQ3QzTlZtK0NEUnZ4RHFL?=
 =?utf-8?B?SzczRDl3bUFUVS9XYXNMK2ZUV2pTdFE1Z0RqSGVsdWNtamEweEtrSVhwMTdp?=
 =?utf-8?B?NUhFQ0J6cUg0cjdqaDZSN0NJY0ZxQThQZEovSkFUc1hIVU9pcXlWbG02OHdr?=
 =?utf-8?B?NmlDZnBTUENmelgrZG93Mk84cndPdFExamVqa3dSMk5hclVpOFJNMk11dnFQ?=
 =?utf-8?Q?qRx/CtGrItHQvW8eP+N8REoWv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3678.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca08b4e-8fb6-451d-77e8-08dba7101f10
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2023 15:13:08.5131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ND7ESiDHqnW+/2arcNRAC7Mt1efirK8S4ePNJLB+YnyYkAifAIuWORLCAHept+w2R8IYnK92Ou5ZAr992cGFNi/wvug/xytVdHfTmX/mjg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB6338
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Aug 2023 15:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104626

c2RidXMgaXMgYSBtb2Rlcm4gUHl0aG9uIGxpYnJhcnkgZm9yIEQtQnVzDQpodHRwczovL2dpdGh1
Yi5jb20vcHl0aG9uLXNkYnVzL3B5dGhvbi1zZGJ1cw0KaHR0cHM6Ly9weXRob24tc2RidXMucmVh
ZHRoZWRvY3MuaW8vZW4vbGF0ZXN0L2luZGV4Lmh0bWwNCg0KU2lnbmVkLW9mZi1ieTogUGV0ciBH
b3R0aGFyZCA8cGV0ci5nb3R0aGFyZEBhZHZhbnRlY2guY3o+DQotLS0NCiAuLi4vcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1zZGJ1c18wLjExLjAuYmIgICB8IDExICsrKysrKysrKysr
DQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQg
bWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZGJ1c18wLjExLjAu
YmINCg0KZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc2RidXNfMC4xMS4wLmJiIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1zZGJ1c18wLjExLjAuYmINCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAw
MDAwMDAwMDAuLjg0YjQxNzhmNw0KLS0tIC9kZXYvbnVsbA0KKysrIGIvbWV0YS1weXRob24vcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZGJ1c18wLjExLjAuYmINCkBAIC0wLDAgKzEs
MTEgQEANCitTVU1NQVJZID0gIk1vZGVybiBQeXRob24gbGlicmFyeSBmb3IgRC1CdXMiDQorSE9N
RVBBR0UgPSAiaHR0cHM6Ly9weXRob24tc2RidXMucmVhZHRoZWRvY3MuaW8vZW4vbGF0ZXN0LyIN
CitMSUNFTlNFID0gIkxHUEwtMi4xLW9yLWxhdGVyIg0KK0xJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL1BLRy1JTkZPO2JlZ2lubGluZT04O2VuZGxpbmU9ODttZDU9ZTc3OTg2ZGM4ZTJlZTIyZDQ0
YTdjODYzZTk2ODUyYWUiDQorDQorU1JDX1VSSVttZDVzdW1dID0gIjljYzYzMTdhY2MxNGRiYjg5
ODk0NzE5ZTA2ZTRiMGZmIg0KK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmODZmYmFkYWU1NGZlYTY0
NDFlYzJmMjdkYzI5ZGFmMDg1MjY5ZDY2YzVkOWRmMWE0ZmJjOTQ3NGEyNGI5MWQwIg0KKw0KK0RF
UEVORFMgKz0gInN5c3RlbWQiDQorDQoraW5oZXJpdCBweXBpIHNldHVwdG9vbHMzIHBrZ2NvbmZp
Zw0KLS0gDQoyLjM0LjENCg0K

