Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5220BC001E0
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 15:32:38 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (APC01-PSA-obe.outbound.protection.outlook.com [40.107.255.84])
 by mx.groups.io with SMTP id smtpd.web10.19714.1687966351117957205
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jun 2023 08:32:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=CwnGhyiM;
 spf=pass (domain: advantech.cz, ip: 40.107.255.84, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUZxV7F3qN4rGVNiZcfVJbXntbsbkkzYRPbPZXg9s+llqq1f03Gn9qiUJQH/jw3KhqvaryIemIraESrq0AOsGVG3nUiaCZaFwVgyUoEQl5uFZdMGdamtFCuR9kGWFuiIzAcjldQskch5be14bNdhPfAwi68AK76x3PkfSiP4Anx9omeI6N8BaV+yP4pd6V7bxyzu+lmTBfb49cLpqSQZhQfZP/78b1xxUJNpuPrlAs7AyJDeT1Ev/UMJEJlxx1RUiqQVwUQ4gcDGYqIT2H+mxtr09WYXzYLYQKtpqAbWktD6jqbfoqdsjW4vDrkuMuThKFJXauMYtqPadEp6FJ7ZHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUE8yLng7Ykii26koyoBigfG6PX6M1bAPOfRWpj2/uo=;
 b=LbAc4YPyWEjhpsMbrJURCfCY1gP3nnZ9zgo9pkdIKHqEjRE9BlD1GqnUL00+7P6pPLKdF/9TnvvJOhnLGUd9gCi+4FwQhDH/Fl7Z4s3J7JONFP83l9MkSanTn991H2u1wReLx43RmW6RM+4imYgUSLP0rHlWcycEY+XWV5c9luTvOikT/UKGw4iNtlHGNFuwvK7mTdq5bQDxpNGMZC98q/tm35zNbjO4NPGB6sYgOIn2mHZtNTWGxN3xBoiaIEtF/F1BniH1Sh7hJyOKjSRlwC0Twc2mnmrd8YXVA+n/ds+iRbd5dqKXGoWLzWiUfg1gbzitbzT/cD4hLrAElD6xJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUE8yLng7Ykii26koyoBigfG6PX6M1bAPOfRWpj2/uo=;
 b=CwnGhyiM1wNtPI3c3yi4GttJ+ebhhOsAkimtCd6J0qHeaiSz0MYPIlPAP3JPuoNsWYR3YTHy2TlKfz59JJ7YfZ48C5HgMHjIL4ffczMF+u32poKkjWZinDwsVmcFMvd9x/SoyCCjSYX4kD5q9xX9MB/DRe+J+/d3nSWzW7pHi03f5TqB3pAm6Twd37Xr6rWIYpbsL2/QUcP7LnG2xCJKksnksjpR0MY8IVqjHbBMEmpj52vLvv/NMrGEaghqHSJZyRrXE8ycIbAbRjOiapX41ps4iYBKi+XipfoKDofwgFFu7NCCpyVoO4XoqHvCFO3G7aU/5noV5fccDX+GOQGnhQ==
Received: from SL2PR02MB3676.apcprd02.prod.outlook.com (2603:1096:100:47::18)
 by TYZPR02MB4637.apcprd02.prod.outlook.com (2603:1096:405:6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Wed, 28 Jun
 2023 15:32:26 +0000
Received: from SL2PR02MB3676.apcprd02.prod.outlook.com
 ([fe80::843e:9515:21d4:f24c]) by SL2PR02MB3676.apcprd02.prod.outlook.com
 ([fe80::843e:9515:21d4:f24c%6]) with mapi id 15.20.6521.026; Wed, 28 Jun 2023
 15:32:26 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-pyroute2: upgrade 0.5.19 -> 0.7.9
Thread-Topic: [meta-python][PATCH] python3-pyroute2: upgrade 0.5.19 -> 0.7.9
Thread-Index: Admp1T/MrirM+5cZSmC8x9vN7wuvxg==
Date: Wed, 28 Jun 2023 15:32:25 +0000
Message-ID: 
 <SL2PR02MB36760242EC121C5EC93ECBE58124A@SL2PR02MB3676.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2PR02MB3676:EE_|TYZPR02MB4637:EE_
x-ms-office365-filtering-correlation-id: ef87a027-ea55-419b-6bf4-08db77ece034
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 b/T3JOsiLWHtFPq/HTyA6WJWuZz8v/g5WO8clAhcWk4LSbZ9b+Ytm6lketE3XJ8xucQh1MksgJ9mdwxttq3pezqEK9ds681dZI11Fj4jaiuKn7WdyX618Ge8twXY+CWiw9WtPAnaZQHxMnrLQmnmJTNq7thUvhWi/cQd90ThCvoKs7QcKCgJrg29ngq/9oq8VCYDrLDUdvs1xMsoCnf/w1n99wXUUcqVHRLUG/+DZjvbUhrLr1hNyy+7VgWWzZi/BZc4md8Bti3nQyC6GgzDf4hFFZOG9GAvd5Df9K04WnQ3AW9JO7VBfoxs9t5nyklKgYpwsGA9Rk7Hsbog/3iyqil/ftfvQdwbdBOjoqlwsyGg9r0ImuDQyidrJHEcEqb8io0UOwXWQmPVCnJiYOlOXGJaGhmQOLhl3en4FrVSgBKtxppVGyN4CpRsxsST2gaVz/z7OYAy6yeD9sHahHPO4WiJRb/jyMLWBRpLAjHAsNTXPYnI6BjW8r11++TZ5b9rq6TO0YmbMX4J9uAk87wc0bogjg9lWWiwW5xvkAtq90D0LwQQmu4ADNOsYBYANBLswncYVVcgC/5Guzocvv0EMvUbxQeqbQLCPj2G+miKzPc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR02MB3676.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199021)(2906002)(186003)(44832011)(26005)(55016003)(38070700005)(8676002)(33656002)(6916009)(316002)(86362001)(7696005)(478600001)(966005)(38100700002)(122000001)(71200400001)(52536014)(9686003)(5660300002)(66476007)(8936002)(41300700001)(66446008)(83380400001)(64756008)(66556008)(66946007)(76116006)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SlllMWtBRHlBTVlIWStXK1pKc1JzMjRDZjlnODZtZVRHVStsMHUzNW5wTExU?=
 =?utf-8?B?aGJNRjlNSHRhQjhlZWo1Y0J5c2tjd0J5V0xGNXphaEZJUy8rbGR3OGFnZ0Nu?=
 =?utf-8?B?aGk1aERtTDhoV3Z5b3pCSktUdHBzTUdtR1ZCcHk1bmppVXlaOWxxekpJSTZP?=
 =?utf-8?B?Y3l3RVg2bUJKK2UyQitDZkIvWW9QOUY0SW9LWDNSY2lLR2FGNGtwWVlKMk4v?=
 =?utf-8?B?OVowV1JYYWtFWmNMdElVU25qSFpiak9KTXhoUEk5WVRIR1BhQng3VUFiVlhI?=
 =?utf-8?B?VkJRbDFRUEdTTXgrMTlLY1h2NEh1bjVPQVBpVmM0Ri8wbGc0QXJyOG1pVVpv?=
 =?utf-8?B?Q05RQVJXemJkK3c4b0hsTEtESGxPOStGSk9TdjE4VHJTd0p3N05qYjhIS0lW?=
 =?utf-8?B?REFtQUFsYVRTN2hNN0Y1cTVrbUlJZ2NLNit2dUJ6MUlnaTBtcjdYbFU1TzVn?=
 =?utf-8?B?QXRhSDhRWkhYdFlEZHhIM3E5QTlpd01CaFNPRHJyazRWek5TbGJoenIvUUZy?=
 =?utf-8?B?eEMvRDd2ZkIyVlpuOG1vVnROWjRWSjF3ekt2UHdIR3M0b3dSRUlmZXR5eHVM?=
 =?utf-8?B?TGdhWTlhelhTUDVIT2xrcEI0L0Y0SmxhTnl1M1UraG8vNDN2OTgxSWhxV0RT?=
 =?utf-8?B?TlBGQVI0WENRNFN3aDVCTk40MjZmTmZhcnFWRC9hdURIWUlWRVVaQ0UxSHNI?=
 =?utf-8?B?MkEwTlgvL1lHWE5WbTYxQmVEMHZUSHhrSFJMRnhuYkVKblE1aHVLRW5HeHVY?=
 =?utf-8?B?TVphQXI2anhMVDJxbDZ0YkwrVXo3V1Z5RVVvMXE0cjZ4TVIzNHVJclo1bUlj?=
 =?utf-8?B?MXVGaWFXcVFQV2FsWWtiZlhNSzJneHM0SVlFcm1kZ2RYMzJPTStqWXlGU242?=
 =?utf-8?B?cDR1T1ZsT3didndLdHgrZHk1R04vWjFJM0RDMHJ1NGtKZzRBNnY2MitLQXVk?=
 =?utf-8?B?ZXRaQWR0ak1uNUcySklFcWhOdnJBLzVLaVFubU5TeStOYkp2d2x2cXZPY01D?=
 =?utf-8?B?akw3ZnV0WG9xMDZUK0dPcmVMU1YwTEt5akNxTmhkaEFib2FtUVlIZUl1djIr?=
 =?utf-8?B?UGJ2OHdkL1JMVHZTQ0gwQ1BYL3RES0krcDFpc0w0dnNZaFZpYnhYRkx3SGsw?=
 =?utf-8?B?NGZiQS9DUEM4ODVUNm15ckhqY0N5U0VMVmFtd1hHTXBndCtpdXlYLzhrNDZo?=
 =?utf-8?B?Qm1IZE13cThrVC91VkNLcHQ3Wnh4RldJd2NIN0tzUk9wUjdXRVZNd2VtOWlR?=
 =?utf-8?B?STZla3FyKzFIdGZpbVZxSzRaZktDZnFmdU1RZHpwVTd1RlN4b011RzFlTVVN?=
 =?utf-8?B?a3B2UFNGWDNJSEV0UEg4REp3cUNPTjQ5N1pqaTVYMWdEVGdqNFg5dmVTZlQ1?=
 =?utf-8?B?aG4ySlgwdlJpcHZVTllGaENWOW1qWWNWQjlVblFlTUYxMS9maXphUlF6TEdq?=
 =?utf-8?B?SkErRFMxZkN0ZnlqalFEVjRoYXFUOG1hTUtKUjVOZVkxVGZtcUJJbXRxbXpV?=
 =?utf-8?B?RlMyQ2d1eHhIQjlQU1FpRXJPZmNjVXBUS09OMjdobVlmSnB6RURpV0JEZlhW?=
 =?utf-8?B?cmttS1E0MnU2Y3cybVNRb3ljdjNzRHRGSzVPVzA2cnE5M1k5ZURTWXZIdzZV?=
 =?utf-8?B?RGY0dGpCdHVQenc5cythOTY3V2xuNmYwZ3JYa1Rza29TU1J1MWE5djNEZkM3?=
 =?utf-8?B?TXJnSVVjVzhNZGpmRjYwMTlubjk5Unkvd3BtdHBwaGhGK0FXUHJxWSt6RGZY?=
 =?utf-8?B?L25yTXRNUnBTR0NsZms4VTNpVVUzOXhrRVIvV2hiU2RPUnJSV0F2QSs1bkJp?=
 =?utf-8?B?MUF4cGNLN1ZGeGdjWHMyaHR6SnNtMEdpNDlWL21JdCttS1g3R21jRW4vYjhM?=
 =?utf-8?B?cG5NSGFyR0pnUGVWS3ByZEhlbU5qc0RaSlhaYXVRWGU3bENHdngya1FwUCta?=
 =?utf-8?B?bGMwaWlqVGd2bklKTWROcUpTZTNMbDl2VHc2TFVyaGRuelhnQjJVYWNKWWZX?=
 =?utf-8?B?dG5BMFRPRTVoSlhxenh1VTliQ1VBQzdaWEhLTXVIaHBHTjFlMG1FZ2MybXBw?=
 =?utf-8?B?VmFGd0xNZDh5alVEY096WHh3YnVSZG5vVVl2MUtHQk9jUjF4QUdqd1JCTml1?=
 =?utf-8?B?blFzNXBBMFA4cDc5MHBaS0ZaK0J4bjlIOVY4R3VzZDcyMVROL0hTcDRkOHVY?=
 =?utf-8?B?TEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2PR02MB3676.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef87a027-ea55-419b-6bf4-08db77ece034
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2023 15:32:26.0311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GnwUIEFEGcPnm3H49QpLopmEzJ3HZfwiaJcz5+e2VUNb+oazEk+pxFMq3XnV2f8AlN6pEFJ/QeAphN5agfQEtEtJx/pDlnEaXYz8nkbhLEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB4637
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 15:32:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103630

TGljZW5zZS1VcGRhdGU6DQogVGhlIExJQ0VOU0UgZmlsZSBub3cgZXhwbGljaXRseSBzYXlzICJH
UEwtMi4wLW9yLWxhdGVyIE9SIEFwYWNoZS0yLjAiLg0KDQpDaGFuZ2Vsb2c6DQogaHR0cHM6Ly9n
aXRodWIuY29tL3N2aW5vdGEvcHlyb3V0ZTIvYmxvYi9tYXN0ZXIvQ0hBTkdFTE9HLnJzdA0KDQpT
aWduZWQtb2ZmLWJ5OiBQZXRyIEdvdHRoYXJkIDxwZXRyLmdvdHRoYXJkQGFkdmFudGVjaC5jej4N
Ci0tLQ0KIC4uLmhvbjMtcHlyb3V0ZTJfMC41LjE5LmJiID0+IHB5dGhvbjMtcHlyb3V0ZTJfMC43
LjkuYmJ9IHwgOSArKysrKy0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQ0KIHJlbmFtZSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi97cHl0aG9uMy1weXJvdXRlMl8wLjUuMTkuYmIgPT4gcHl0aG9uMy1weXJvdXRlMl8wLjcuOS5i
Yn0gKDYxJSkNCg0KZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtcHlyb3V0ZTJfMC41LjE5LmJiIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1weXJvdXRlMl8wLjcuOS5iYg0Kc2ltaWxhcml0eSBpbmRleCA2
MSUNCnJlbmFtZSBmcm9tIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcHlyb3V0ZTJfMC41LjE5LmJiDQpyZW5hbWUgdG8gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1weXJvdXRlMl8wLjcuOS5iYg0KaW5kZXggOGMxOTJkMjk2Yy4u
MjYzYWNkMDZjNyAxMDA2NDQNCi0tLSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtcHlyb3V0ZTJfMC41LjE5LmJiDQorKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5cm91dGUyXzAuNy45LmJiDQpAQCAtMSw5ICsxLDEw
IEBADQogU1VNTUFSWSA9ICJBIHB1cmUgUHl0aG9uIG5ldGxpbmsgYW5kIExpbnV4IG5ldHdvcmsg
Y29uZmlndXJhdGlvbiBsaWJyYXJ5Ig0KLUxJQ0VOU0UgPSAiR1BMLTIuMC1vbmx5ICYgQXBhY2hl
LTIuMCINCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLkdQTC52MjttZDU9YjIz
NGVlNGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMgXA0KLSAgICAgICAgICAgICAgICAgICAgZmls
ZTovL0xJQ0VOU0UuQXBhY2hlLnYyO21kNT0zNDI4MWUzMTIxNjVmODQzYTJiN2QxZjExNGZlNjVj
ZSINCitMSUNFTlNFID0gIkdQTC0yLjAtb3ItbGF0ZXIgfCBBcGFjaGUtMi4wIg0KK0xJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWRjY2JmZjc4ZDdkNzlhZTdlNTM5NTNkNDM0
NDVjNmU2IFwNCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFLkdQTC0yLjAtb3It
bGF0ZXI7bWQ1PWIyMzRlZTRkNjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIFwNCisgICAgICAgICAg
ICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFLkFwYWNoZS0yLjA7bWQ1PTM0MjgxZTMxMjE2NWY4NDNh
MmI3ZDFmMTE0ZmU2NWNlIg0KIA0KLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0NTQ2MGQxMmVkMmE1
Y2FmMjcyYTM1N2EzMzYwYjM2ZDFlMzQ2ZjE3YWZlMTQyNWI2NmZjMjFkNzBmNDYyYjI5Ig0KK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICJiNjlkODJmMTQwYjA3NzQzMTdkN2JhNDBmNmM1ZmExZDc1NTA5
OGJhM2YzZWI2MTk5ODJkMTZlNzUwZGM2MzFhIg0KIA0KIGluaGVyaXQgc2V0dXB0b29sczMgcHlw
aSBwdGVzdA0KIA0KLS0gDQoyLjM0LjENCg0K

