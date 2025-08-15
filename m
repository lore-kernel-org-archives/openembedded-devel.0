Return-Path: <d.schultz@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D19CA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 22:55:18 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.94])
 by mx.groups.io with SMTP id smtpd.web10.24133.1755298513550834011
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Aug 2025 15:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=R+y6pghj;
 spf=pass (domain: phytec.de, ip: 40.107.20.94, mailfrom: d.schultz@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aPpSdK7FpjTxA+VenJKkWHnEDLC3HMvegGsyY5XHtIB15Xu0BVxkm3kRbmHbGwXoQPwu0CHhRtre6UAdw6HLehXws1IRYUXCBHXkX+OrdYdbuBUr0PeJDqWNpfIowTrnLMvRSM5GamYiDk/0FBYbZ15RZcX2vbtHHQCgriXkYgdULk5Yymgb+7swRqIg9aW8xAehKhWM2h8NdGXIXDzKlTXKoR+8Q5Y/wgWguuLA3xYhTg5nBjE0U6UNV9Jg9T8PlrWzNXVEu6bjsULqiu0fxuzqrEQZ3yl5bGcJNU3t5Ki1aFQFshUuKAIA0MWhavrORnOGmVh3nduIA07C8mQSzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/a9Ky3ZXVT+p41fnvDALPKGpTfT69TiL9fr43jSlP0=;
 b=LD/ljRVHKJrGCMpRkZSxr2fVb6hzeIe/FTla9i1Zi9TT8wuFyDRAttRVAZiU3ReplKSrxY6Kim51aDdKw09ybBr57VcqEjmnvy05nam/5cXPTT1zcJOgZnW8cKDom6Ee0zCT9oNXToR41FZYfWukxseambsBwyrHs7ZQxCVoyo6Q+eIJ/49lKnPja2H8vFDv5EEmVyvSI2az7rQPumnuzHNItsXnO/FZvpTgU6xsKrmBv3K9bpbNvqZL27sNYozUlprZUX5JqaOBlsjNZS61eRaRk1qGMgEKK4S0zrd8xK7Gi673amvzX/p77pLtlNrkle+P7+fjAnInst/che1Eag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/a9Ky3ZXVT+p41fnvDALPKGpTfT69TiL9fr43jSlP0=;
 b=R+y6pghj2Zw+rgSrRND3PilO12OjPdJ4Jc3lbyGk9xLRQpJb/jGf+n8dwEVPljWjKhbLZrzeVJ5pWJDe/BDRwQLo5nxKuD8WRT2aXwkvRAnHgLxZ/0plFtElMKDY9hkwcA49Tw6PrzdCV0hmHBe/9cqovNGNsAhIyxw+mY00eeWuTwxt8xxrFBnqB0hzGSorrz7iVsuMMU0l6hwss+D0/wFhaV42RpRu/Q1z2eo7wae+F00sxRpQgFd1NMad9AZqH8miyvnR6uBpWXEaxZQkGeMZZmLJtYKURt2o1cMW9l/xYKjugMEixbn4L5uroeKctyf3dYEiUKPxgBSCDKglOw==
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:248::6)
 by VI1P195MB0494.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:158::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 22:55:08 +0000
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981]) by VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981%5]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 22:55:08 +0000
From: Daniel Schultz <D.Schultz@phytec.de>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>
Subject: Re: [oe] [meta-networking][PATCH] meta-networking: mbedtls: Remove
 tag from SRC_URI
Thread-Topic: [oe] [meta-networking][PATCH] meta-networking: mbedtls: Remove
 tag from SRC_URI
Thread-Index: AQHcDW3nN2Ofg+vGIku09hGxrLp8kbRi93UAgAFc+YA=
Date: Fri, 15 Aug 2025 22:55:07 +0000
Message-ID: <d698e473-a955-4f19-b0f4-6226ee1978f2@phytec.de>
References: <20250814225042.3310913-1-d.schultz@phytec.de>
 <CAMKF1sqM_bVMcSJ+929XJ8DK_4_NDhDN75KtnTtF=Rz+bRkFgQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqM_bVMcSJ+929XJ8DK_4_NDhDN75KtnTtF=Rz+bRkFgQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0P195MB2484:EE_|VI1P195MB0494:EE_
x-ms-office365-filtering-correlation-id: f23c6915-efc6-4dc2-5577-08dddc4ec834
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|4022899009|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?b2xaanY2Zm9Ec25sQ2ErMHlGYlVTSHhXUWxsc3BibGdSQzZkaE1JYy96eHQ4?=
 =?utf-8?B?UHdoOGV6LzNRN0FaamEwa1JIQmFLNWlreWozRit4ek5RRVpQRFZrakRpUFdX?=
 =?utf-8?B?WEwvVHRJYld2UWdYZGRJSGZpTFIxOGRWMlpZZ1ByQlJieDcrb3JVYmNxaUpp?=
 =?utf-8?B?QWV0b3orS0FpN3hLZ1hpVzY2bFhHbGp4L3NBMGl1My9GdnhlT1QyYVlxV2ly?=
 =?utf-8?B?Q21jYnlhdXJER2pUZUNmVFlTcEhETnlwN2ZqRW5TQy9PeWdaVjYveG1venA2?=
 =?utf-8?B?dHFGblc3UDdNUVYvNFYwMjJDUktTREZEZ0xNTHhhV2lyU3psVUs3ZTdkRmlG?=
 =?utf-8?B?d3ZLNWZVU0plZmhGWjhOaGlGZmlRaDhNZ1NpT2dueWYvWlF6MHlUSlR4NC9a?=
 =?utf-8?B?ek1ucjNqVklUMVBMQWgzak83S3QxcEJJOVR1N1VoYzNtd2c1ZXBMRks4UElY?=
 =?utf-8?B?b2JtdFRxdVpwTGttUTlEWWJsUkdaT3JIYmhtRGh0MjhENmdya20yd24xUkh4?=
 =?utf-8?B?dmFLcG5xZE94cXQrRzVFK21Ib0lVeTRSUG1nOFFsRjFEc0pGSFpPNmU3Q0xh?=
 =?utf-8?B?N2JtYzN3N3dZY2EybndtbFo4STFkVVg2QmNpeTVhNHdlVnlsVW5NNDA5RXhv?=
 =?utf-8?B?ZEZ4K01SZVNrMThIbnB6Uktwd3hmZjcrc0xtZXFkUFNiYnZVbmdJcnVxeVBR?=
 =?utf-8?B?bGRPaDM5N1FMSDk5YVpoMVdIQ0NydmRIaThpYmFTWGJWcE1SSTBZS2JGQ3dE?=
 =?utf-8?B?T3F2Ym5UblczZER1dGQ3SU5sQSsvdFdFRmpYcDh0SHkrYlh2eGhVYUdDUy9z?=
 =?utf-8?B?RU51YXhsbGYwR1pMQ1JnTFhQMEQ0SlhDVlRLcFVzdTU3d1pRS3J0em5pbXhN?=
 =?utf-8?B?WTNHT25weHpSbHdTQWp6RzBVMHRQOHhzRER3eEhRaXAyRTMwd3JrdEtYQlpT?=
 =?utf-8?B?K1JPOHgrem1odldwd1k3WDhWdlNxUDBxeHZwWGdRMUVQb0xRZE5FeFYvUnYx?=
 =?utf-8?B?cWVFU1VYNGdLNVJEWWp2RDNOd0NYc3hXV3dUQ0ZoeG9tMWMzN3grazU3OFlE?=
 =?utf-8?B?NzNsSSt6dkZKYXBWZ0krRzdNek1oOVA5cEVhRnd4d29aMEw3YW1NR3k3TjlB?=
 =?utf-8?B?NVhseUpPWWgxN25hbXplcENIdlZHUkFoVlAyZDVoUXJmSHlSRFloQTdubVJG?=
 =?utf-8?B?QzZmMUZJQXB5b1ozVll6Q29IWkFyNE8vYzk4L3dTcEZ2WGFFdDd3UnFVV2hN?=
 =?utf-8?B?dmdLYzFWbzJrZUVFZVRaZy9zVmc3Vm50ZWYzWUpKbGFCMVF0bDl4dFRFUEJO?=
 =?utf-8?B?aExxWHNtZCtzb09IdlQvS1ZhZHI0dnRwZ2plVCtZZndKUGNsK0tXdlZwZGtU?=
 =?utf-8?B?a1A4ZjNuOXpEOUNzblBZNFFNYjNjREo4ZzdjM2FJa3RzUjZRL084SzFsUUlk?=
 =?utf-8?B?WkFMTEQvR1V1aXBSaVhqN2dQRDRwb2l3MTkvTjBzYU9aOEdvRC9SNy93d3ov?=
 =?utf-8?B?dTE4Ry80KysxOThDOVcvZ2FLVmJ3WER0UmlMd0hsSGdZcW1oM3ZyQXFYaHN6?=
 =?utf-8?B?ZEw3RGZuSVFmdGlaTzFTS01tRXFXaU50RlMzZlpzQXlLUEQvc1JueDFCTnZU?=
 =?utf-8?B?THkrdVZ1ajhnb1E5MmVObFFTUVpKQ1VsSFpubG5HZmxwemtuaU53VnFaaCtL?=
 =?utf-8?B?YW9rWlNCT1lQanFKeUhneS9sOGUzMzdJWW5QWUVZR05nTWtzdlg5NTQ0QWsz?=
 =?utf-8?B?TzR1bnlGeC9ncndVQWcyemR4S3hvOGptVVVJR1ZjK1cyeDRBWE83US9uRFZX?=
 =?utf-8?B?VTZyRXhWZm10eDhPWmJBcXlCM1dDcWZRVElUZ3hVYzB3TnluVHg2ZmlLU082?=
 =?utf-8?B?WG9ad3RrU254YWd4NjNvU0I5WnBjT0p5bTBMaGJwL1BEZHFQUitUU0tpbVhv?=
 =?utf-8?Q?irYU3e5ymRM=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P195MB2484.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?N2xNN0lzZjFnbUNGUzRlUXpEWThCK09zMjdNOUk3UDdFRGZVMTlSQ0hxa3F3?=
 =?utf-8?B?UlhaTXloOGtFUTNURE9iTWxpMFpzT2ZhZjZJZlNVc01qQXJpeElJNXBpaDBD?=
 =?utf-8?B?S2c4S2c2MVAwb01jMHhvL3lFc3ZvZDgyUjBLZnZKYk8rYUpXOG1YMmh5dnlk?=
 =?utf-8?B?eDlkVjRrVTcyNThrV1FwTEF6OW82QWJ1WUVwaVdvZjNuUWlST3ZhMVcrL0ta?=
 =?utf-8?B?Z21aTXRKRk9XZkN4WFpFM1ZHamdXY3Y5VFBsZW9UckRXRzBncFNydGJlc1hw?=
 =?utf-8?B?U0lxSUJBeXBUMDJsQmg1amp1cnByL2NxUkwvTlRlc2dDckFKNFRFZ1dZb2lu?=
 =?utf-8?B?dDk2MEdxQXBFOCtTL2JvZk1Wb2MxY2lVU1g0N1YwK2FISmxBbzMxbTdtZVZI?=
 =?utf-8?B?THB0K0tNRU1va2lsMDhKOVRFNHJOY0ZIQnZBcERNem1uQ1RyWmtiaHgzL0or?=
 =?utf-8?B?WDZzSm5QTWJyYjRlT1l3QmlrVm9tTlUvS2RLNXVtTDR1RlRkK3BBMStlRDVw?=
 =?utf-8?B?bDBRZlN3amtUVkNmbWFpbjMvZkJQRVFzYWVRZnBxcmVkcFJsUlpXdGMwNWhU?=
 =?utf-8?B?UzYzRDJCakZ1U0hUTEtnRVhoRU52RlU0cWhzNnZudjJPaUtQMDN5NUt1VVFi?=
 =?utf-8?B?bFl6eW04TkNQWnZGakgrbk5ycFlwYkxkSWNIYk9xeWx6N3ZleTFLTjRGSGsz?=
 =?utf-8?B?K3hEU3BVbFVHOG8zUHJ3bzFORzlwakVYWFcvajQ1Nm1icXYrVE5wZUNMNGN3?=
 =?utf-8?B?US9oUkZxR1M1YTBmRytnTTNvdHdjQ0xNMjl2YjErT0tvMEM3QVBDdy9RYUcx?=
 =?utf-8?B?bFJrK1pDNUxYa2hTV0VFc1ZkVzF5eThReWhKckZIVGVLQmJUZjl2Y2RpUUdx?=
 =?utf-8?B?RmIrN2k2QytQeFpsc1BqVHAzV0s0VWVsbFhUU1N3QjBXOXhoSXdPeDZZQm5m?=
 =?utf-8?B?SUduQlYrL2ZNNFRLK0E5L1NNZnRLSjhDeGxiOHd6K1JFRzlhYmZZYzI3SjRW?=
 =?utf-8?B?TlN6UlkyUnpKalE2M1ZpdmNORFVvQzNHaThqczhTYkxQanVwRm12WG43Tk5J?=
 =?utf-8?B?U2QzRllTYURacXdJMlpZVG1xN1orblJBczBRT1ppdU1wenlhalJ1VXNXTWJP?=
 =?utf-8?B?c04wVk1NL2ozTVVpTUZpbXdRdUpqZDdyQi9ocWlabW95eWxXaXU3U3pyWlo4?=
 =?utf-8?B?SUQzTVNKNEV6b0Z0RUhhZmt4enNBUFFpcHkzdGdmdUpOT05yQ3UzSyt1eCth?=
 =?utf-8?B?SVBsSjEzVFVqMGlRYWtHM1Q3YTkybnJpYzRnWm9TSUNZTjdlQnA0cUhwajlJ?=
 =?utf-8?B?NmxXbGU3S1pBQlMyWUJ5aVB2WDJiMXk2eFdzR3V5RDBVM1JPV2tSWFNTeU9W?=
 =?utf-8?B?Z3BINnBGTGdhYVg2Y1AzZ2NUUzZ0dGkzZVFCdFkxanVuQm02UDF5K0tHelBi?=
 =?utf-8?B?WVJET2svRjBPZ2s1MGhrOHBqUGNseGZ5aVV3ZkdKRGE0a0NLdmZKbXNaaW9l?=
 =?utf-8?B?SlU0cVRTdVJKZngza0k5TmhnWDgzYzRwYlJsOThnVFh5cDByY3dXcEZPSk4r?=
 =?utf-8?B?SmdWL2lreTF6MXZTZDFjV1FiQjd5amJkMmhJWC9mMmZQbGFpK3FwUGh5MVRj?=
 =?utf-8?B?N2VtQzh5cFJocldjZHEzek81VHNIUTJQV0l3UjNBWnc1WHJPVTdkdUE3UXF4?=
 =?utf-8?B?alp3NjdrTGI5OC93aUd6a3QwMFV2cXQwdmk2MGtuZEVQZ3BSTWUvaUJqVkM2?=
 =?utf-8?B?blpWM1hMMHorai9JSUp6YmlSNjVDRjBsSC9pdCtaV1J0OGdWUDkwNUdlS2Ru?=
 =?utf-8?B?K1FiUExtUkJ5OUsvQ0hRWlBKSnI4SHBUaEFqY1p2bkwveVRPa0dpcXRQTDNm?=
 =?utf-8?B?T2VtZm9DbThIUW9PeFpYRTV2MG55WjZwOWY1YXE2R0ZTaFIrYnFRM1d3SS9V?=
 =?utf-8?B?N2JEVEdPY1hPWW1LbW9sN1FvQ280czFMWW5JRFRiNUdIQ0xOVDRSSlozVzVr?=
 =?utf-8?B?aWQ5U1RObEFPa3NRNmM4bmthRnBCdzY4QlNpNFN6aFN4SVRBR2NqZjdERVNK?=
 =?utf-8?B?MXY0TzlpSU9aSFI1M0FUSFoydVhIYk40MkxSNzlvVkhLSFQ3bFlOR0JnMStZ?=
 =?utf-8?Q?5s0E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <60AF5DB8E2A087418417C64AB1C6B5B7@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f23c6915-efc6-4dc2-5577-08dddc4ec834
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 22:55:08.0614
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zSenaa7bVv/e/JKlNq9/RQ9K2ucc/FKQMMyDra90ccQg7ofm30ze1kI85Q0LcwiDIf8gYo3svWhfrta8bJF2uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P195MB0494
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 22:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118976

U3RpbGwgdGhlIHNhbWUgZXJyb3IuIEkgY2FuIGFsc28gc2VlIHRoaXMgaXNzdWUgaW4gb3VyIG5p
Z2h0bHkgYnVpbGRzIA0KYW5kIHRoZXkncmUgZmV0Y2hpbmcgZnJvbSBzY3JhdGNoLg0KDQotIERh
bmllbA0KDQpPbiA4LzE0LzI1IDE5OjA2LCBLaGVtIFJhaiB3cm90ZToNCj4gSSB3b25kZXIgd2h5
IGl0IHdvcmtzIG9uIGF1dG9idWlsZGVyLiBDYW4geW91IHRyeSB3aXRoIGJpdGJha2UgLWNjbGVh
bmFsbCA/DQo+IGFuZCBzZWUgaWYgZmV0Y2hpbmcgd29ya3MuIEkgY2FuIHNlZSB0aGUgU1JDUkVW
IGlzIHNhbWUgYXMgdjMuNi40IHRhZy4NCj4NCj4gT24gVGh1LCBBdWcgMTQsIDIwMjUgYXQgMzo1
MeKAr1BNIERhbmllbCBTY2h1bHR6IHZpYQ0KPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxkLnNj
aHVsdHo9cGh5dGVjLmRlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IHdyb3RlOg0KPj4gVGhp
cyByZWNpcGUgdXNlcyBTUkNSRVYgYXMgd2VsbCBhcyBkZWZpbmVzIGEgdGFnIGluIHRoZSBTUkNf
VVJJLg0KPj4gT25seSB1c2UgU1JDUkVWIHNpbmNlIHRoaXMgd2lsbCBnZW5lcmF0ZSBhbiBlcnJv
ci4NCj4+DQo+PiBGaXggZm9sbG93aW5nIGVycm9yOg0KPj4gICAgWy4uLl0gRmV0Y2hFcnJvcjog
RmV0Y2hlciBmYWlsdXJlOiBDb25mbGljdGluZyByZXZpc2lvbnMNCj4+ICAgIChjNzY1YzgzMWU1
YzJhMDk3MTQxMDY5MmY5MmY3YTgxZDZlYzY1ZWMyIGZyb20gU1JDUkVWIGFuZCB2My42LjQNCj4+
ICAgIGZyb20gdGhlIHVybCkgZm91bmQsIHBsZWFzZSBzcGVjaWZ5IG9uZSB2YWxpZCB2YWx1ZQ0K
Pj4NCj4+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBTY2h1bHR6IDxkLnNjaHVsdHpAcGh5dGVjLmRl
Pg0KPj4gLS0tDQo+PiAgIG1ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tYmVk
dGxzL21iZWR0bHNfMy42LjQuYmIgfCAyICstDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9tZXRhLW5ldHdvcmtp
bmcvcmVjaXBlcy1jb25uZWN0aXZpdHkvbWJlZHRscy9tYmVkdGxzXzMuNi40LmJiIGIvbWV0YS1u
ZXR3b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5L21iZWR0bHMvbWJlZHRsc18zLjYuNC5iYg0K
Pj4gaW5kZXggODhiNTBhNDA2Yi4uYTBkYzZhNjg5YSAxMDA2NDQNCj4+IC0tLSBhL21ldGEtbmV0
d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tYmVkdGxzL21iZWR0bHNfMy42LjQuYmINCj4+
ICsrKyBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tYmVkdGxzL21iZWR0
bHNfMy42LjQuYmINCj4+IEBAIC0yMyw3ICsyMyw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0xJQ0VOU0U7bWQ1PTM3OWQ1ODE5OTM3YTZjMmYxZWYxNjMwZDM0MWUwMjZkIg0KPj4gICBT
RUNUSU9OID0gImxpYnMiDQo+Pg0KPj4gICBTID0gIiR7V09SS0RJUn0vZ2l0Ig0KPj4gLVNSQ19V
UkkgPSAiZ2l0c206Ly9naXRodWIuY29tL01iZWQtVExTL21iZWR0bHMuZ2l0O3Byb3RvY29sPWh0
dHBzO2JyYW5jaD1tYmVkdGxzLTMuNjt0YWc9diR7UFZ9IFwNCj4+ICtTUkNfVVJJID0gImdpdHNt
Oi8vZ2l0aHViLmNvbS9NYmVkLVRMUy9tYmVkdGxzLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9
bWJlZHRscy0zLjYgXA0KPj4gICAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXA0KPj4gICAg
ICAgICAgICAgICINCj4+DQo+PiAtLQ0KPj4gMi4yNS4xDQo+Pg0KPj4NCj4+IC09LT0tPS09LT0t
PS09LT0tPS09LT0tDQo+PiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8g
dGhpcyBncm91cC4NCj4+IFZpZXcvUmVwbHkgT25saW5lICgjMTE4OTUxKTogaHR0cHM6Ly9saXN0
cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvMTE4OTUxDQo+
PiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMTQ3
MDk1NDcvMTk5NzkxNA0KPj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1kZXZlbCtvd25lckBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+PiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL3Vuc3ViIFtyYWoua2hlbUBnbWFpbC5j
b21dDQo+PiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPj4NCg0K

