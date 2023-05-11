Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25884C77B7C
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 16:33:27 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (APC01-PSA-obe.outbound.protection.outlook.com [40.107.255.58])
 by mx.groups.io with SMTP id smtpd.web10.1225.1683822802857870532
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 May 2023 09:33:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=WDBq9trQ;
 spf=pass (domain: advantech.cz, ip: 40.107.255.58, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AkGC9h02RfwwXbYVaigQqvqOIxsfx4cJYeVsAnOIYyWtuWa7lPL4ecOzUzqyFMWvEYO83PKp4yKlWx8fhLt6H0+IQQpFldJ08ZWrMwTwmUMLNnTuPcMdywsqffk3252XmOggRaAU1hVgYjYz2lKoZ3REK3WkF3F6+v6dpuvkRGwcKVbmevXWkIFbFk8mlbPw2JumJpS3ofu8+Qkun5H/JavZ/cODlKV0bgceTmqOHWoVy9LFbAEmkwvDTKzICQZUiGc2zMlLIJKTDxvvfoSzYzanefZRWQZhku8M0Bjie2KV80NraxmGnwz+inhwE6DCeu4Ol5R64oeSc947ECX7bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KmIZQPvyY/YF5E3zMcLzxrqrQFvWPmUhsDDhVQezGc=;
 b=nMooXONWgn/1/WCa8Q9eb+lreWyqJvsFyzDREounDE7rGDJoil2rrqyC427OdiZ5Wjh/0bgctqeF/adgfw1Z5Z61JE/8XRiZ5HJ3pi2vbav80VAP8s5JT4XPz1e4uN7e3qaybJX/Ls8Mau21HFniJMoSSqN0KmyPzS0S3WWqj65TRdsj0mMqw3mknEBFZk2TCZ5wDjFE4x52ww43+y8C9l5uJ2RseA3Au8v/Jgo3EYthptLF4jFao97CQRulmydfI1KMnM0Cvq4ZMFA7x1gXXJvaLUBqFdG/oj3zBJG+FTrHtZ8MWLf3cjWRSLpiECkes/U9qGP4GeMM3pyPrtUUPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KmIZQPvyY/YF5E3zMcLzxrqrQFvWPmUhsDDhVQezGc=;
 b=WDBq9trQ6vwUpxd3M+KpMGsQGKQUIJOZJePMepdtPBsm/qeW7at6QBcM2SYEC42dZ3kMBOxs4bEgF/2BFD3C3L/qMw978lUzBiyKFoGSfd5+fhx1zuY2Vm+lMW211FRG59aeKJ6/eae7RdCIlXVfUA4xtYpGfX7iF+9kacRyxQ/MhwkNU9j3hl0D1pd2Lgmq1THIEpJcd9ai/4QBbwrUxu37me3s+3xQfqkHIXpC3A8WelsKlw6xoYXQqEIyh6ZsIM0mMiqyUH4lkkpUxrZ1TQLaCcsT98QZ7Y3Bkb9tst+Y2d+q3iAfk6DaZOE877AsVciHRTvWCpZeKQKwPDXR/Q==
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com (2603:1096:404:b7::12)
 by PSAPR02MB5061.apcprd02.prod.outlook.com (2603:1096:301:86::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.7; Thu, 11 May
 2023 16:33:18 +0000
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::3e74:b6f0:fad1:4598]) by TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::3e74:b6f0:fad1:4598%4]) with mapi id 15.20.6387.021; Thu, 11 May 2023
 16:33:18 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] openfortivpn: add new recipe
Thread-Topic: [meta-networking][PATCH] openfortivpn: add new recipe
Thread-Index: AdmEJNPk26b7PQAlQuGBX17aqzn9Eg==
Date: Thu, 11 May 2023 16:33:18 +0000
Message-ID: 
 <TY2PR02MB367859735163870EE76A95A981749@TY2PR02MB3678.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR02MB3678:EE_|PSAPR02MB5061:EE_
x-ms-office365-filtering-correlation-id: 9226d691-7427-43dc-755b-08db523d6da8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hUilllBNbpGKC6p9ujyJXBjsAOU8CQRD7Py/yEcf3S4+xc0DitLOjhZ5TmmkW+Ch4v6+kN3BNTVE5AtWW4YlKe1eeSbYWW5ONX1hkfKmKWmEP0WAf2UzTIDsf4dg5kebODFV+Hn3dfccMVRwV2b3fTUjdi1QspsnTwT5hVJeSTv/F2hPiALCjEJyTSYWx5P+WJ6ZE5GnJavo1TAEdP3MbVPyW0CXPMDwPn4/A3mslzRdg9Nw5uYIvEhjJkw6Klf6l/ojnbk56Wn0+DQzLm9uTlZ/r7Np6n3WlB6CYg1QLrRXXFYRofjKfgUCEuRVX5FpFmMJ+6hPHyVKYg5y3/RTC1563wng643RqENX/4eLjXxNGrP3t19TaJTo5hwOTvJw5pdYKknmeUhssVwkrr7ICA65VTmTr4cNCT3ykzeueJh8rYx0W8JhbVJsN8jquWHjU7laIDtogMYUH3oeGoi8dTtLjLOQWWYveNfQMpGt3ipGk3bzkppU0nzdHPzi1vwilLCNWkj9cNHU+b5TA/gZXZ7/F79/wjVi5W2DIySGsgGzibj2Ws6Y9J2F+ITWJk9/+qiakPlHGiHyls8JDg28+69uNanIVwNmY8kp4vP+YMU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR02MB3678.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(451199021)(186003)(55016003)(478600001)(86362001)(966005)(33656002)(7696005)(71200400001)(38100700002)(122000001)(2906002)(5660300002)(52536014)(44832011)(8676002)(8936002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(38070700005)(6916009)(41300700001)(316002)(9686003)(6506007)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Wk5oM1RWK3pWMjJFRWNQYUgvWHdkZW42aXhYY2c1Y0pOZW9LeEd1S3Z1SDlR?=
 =?utf-8?B?S0pJcjlyOWJzYnhvZm1DaWZKWGprb3FKbmdXRkxzcEZjbTMwUEZLKzllMEh5?=
 =?utf-8?B?ZUE5ZVBOS1J3UXlvOXI1Yi9VYmQvRXJQaHo2M01kdm5FNGdXQ2JjQkdZNnhr?=
 =?utf-8?B?a2lOQ2c3OEM1V3RHSFJHbWd6d3hjR0YzV0FubGhXWXFXVDU0d3lhSDdFNG4r?=
 =?utf-8?B?OHRncjZtSnRJNHN5NDRSUnhocnVYQS9Sd1h2dEJCK1NvMVYvLzBBK3BNblI4?=
 =?utf-8?B?ci83QXNMOUZKY3FDQ0lZUTE5RlZ0c3FNbjIwTE1Eb0xPODluN2FDRWo5akZW?=
 =?utf-8?B?QThPWkgwMEJkaE1oNEtsWlFSenFac29MSWhiWE5nZlJmZVJrNndiMjVHUno2?=
 =?utf-8?B?MzlXMzhiTFFBMHd2SThOR1RuS1o0SFN1dzVTREdFekFndU9kZHpzUGppS2xQ?=
 =?utf-8?B?OGJJU3AxMDZOZ3ZyUGQwdkxvUmxhTEZ0aTZYZ2lpMTZwZlNyQ1NEOEl3a2pQ?=
 =?utf-8?B?dzVZbksyYjV3NFlRbUxiQjFWK1RocUVDT2QrTml0azNIaENjcmdtWnBCVDcr?=
 =?utf-8?B?b0tETFJZVkhocDNJVDh1WncxM291cU9QRWJ4dXliTEtHcEFkWkE4ZWMwVWxr?=
 =?utf-8?B?WmM2U2NDRUh1Y3FSQ2RiQ25PMEVIZGdwYkFGMUtnYUhiWHcrZEYvOWN5NDdn?=
 =?utf-8?B?ZHJsdDBXYUpmRVJFZWpoVUFGV2VBOXRWcmhGYllVM3lCWXRiVlJnTzNoa2Y1?=
 =?utf-8?B?VjlPd2ZnM0ZJQXUycGkvUnpIOE9RY2NxZkJJcTlvd0x4T21RSU8rVkxObXpJ?=
 =?utf-8?B?NEJQTjdpRFNVK1l2SG5sSnB2WnVscFpzSFRJUW1FcEdYUm1yVTk2eWwxTFJ2?=
 =?utf-8?B?KzdXOVdOUnhDeU9aVG1ldDBnTUJqR0E2aUZ1Y0ozeTdVbHZ4c2JLazVPMnNu?=
 =?utf-8?B?MlN4UFpBUFdFY3c4c1c2cFEyQ1ZOZGxyNmxOYWZCd2swd3Rtbm1LUFN1cm1r?=
 =?utf-8?B?cVpnbi9JR2d3OVdwNnhJR3Ewa2RhUlkrTnZDU0pERXVxd2RKckV4ZHlkR285?=
 =?utf-8?B?bGh6UGg3UnZnMTFDdWRibXNPZ3VMSk1wVG5sdXZiNyt6eXNmbklHRWxZK3JJ?=
 =?utf-8?B?OXNaOXlaclM0dEFueWltUWozTW9SR0ErRVBhQUl6cnJLYm11S2wxZHNnUFl2?=
 =?utf-8?B?aFJ4MUlscWR6RkpGZlM5V3Q5cVZaOGw1eFRkbVJ3NEZEYTVzTy9majNjaDQ4?=
 =?utf-8?B?aXdJRGJGS3ZZS1FYOU9QWjd3VjhpOGRxWDR0MDJjdFM2MDJkYTF1UDgxaGIw?=
 =?utf-8?B?dnpQbWpONU1XK1h6cUFiSjlFM3BuL083TVdEbk5qR3U5RXRoTC9XSnNQbDhp?=
 =?utf-8?B?bWJpSkxibzNBT2Z6NXZ5Y0dScjhuVTQzTW9ETTI3eVBQU3lyZkp5anhkWmh0?=
 =?utf-8?B?bnphWWthZTRzbW9IQVY1QW0zSWRkb3hQWUgvWmptbW5vWEVOOFdla3c4QklM?=
 =?utf-8?B?ZU5vcTA1cXEza1FCQUZ2aytTTVRyZ3hybStPTnRvOG1QT0JQd1U4a0RwT29J?=
 =?utf-8?B?MGF4ZEZUZitSM2RhQis0NzY5UHJjVFhTMnBzQTJDeHQ5WE15Nyswc3dPMU83?=
 =?utf-8?B?QWxSVVBZQXRtSENIcFpyNGhiSlRVN3pnSndiaG5KYUJLQ1pBY2EzSGMwNGoz?=
 =?utf-8?B?bzgya04yUkJYWk1neWlERmRvRyttU0hsVUE5UHRHNDhtQnc4Zjlsb3NldWpB?=
 =?utf-8?B?bHNWc3F0UGY2dXpxeXh0S2pCakZPL2VCODJzSzJKUzhseVdKMGRmUnVaMkMr?=
 =?utf-8?B?SzI0Z1B5bkJBQktINktSRFBBNGljaTNOeWxQUW9WOWVFVnlablAvMDBDMzlM?=
 =?utf-8?B?WkdIY1RtUFU2Q2dnT3dKbDFIYlJVN1cyWitIbjlpY3Z0YTMzM2lVNEpuMmdL?=
 =?utf-8?B?RUVvcnFYaENYSmJSczB1VEtjclIvQ29adWxsbk5lOHV1dnJyK3VjaFMzanZw?=
 =?utf-8?B?bzdkUHdCcE5oOTlLVXJIWDR0aGh5cmtET05KZ051RFI4Nk9NQ1RoeGgzVStY?=
 =?utf-8?B?bmJ6ZGZKWmVtWmMrdkJHOTNRYzg4MEhNWVlZcmt2RGNNOFlsbHFIenlyckNV?=
 =?utf-8?B?TFBub1pZdjJYSDVaTHIwZElpckFWNzBIcDRXeVpiWVdRWjZIQ0JRRCsvcnFh?=
 =?utf-8?B?YkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3678.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9226d691-7427-43dc-755b-08db523d6da8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2023 16:33:18.9139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OiVr7Ld6JGkjLq3/y8MPwQYREy19JYhbO1vvCN9jgVhH4DcxVuKmONgP0uNrRi8pP+QmESm3MFi4GJuLl2P4Q6Kw+D2PRz3EheN6fSjKqpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR02MB5061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 16:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102547

QSBjbGllbnQgZm9yIFBQUCtTU0wgVlBOIHR1bm5lbCBzZXJ2aWNlcywgY29tcGF0aWJsZSB3aXRo
IEZvcnRpbmV0IFZQTnMuDQpodHRwczovL2dpdGh1Yi5jb20vYWRyaWVudmVyZ2Uvb3BlbmZvcnRp
dnBuDQoNClNpZ25lZC1vZmYtYnk6IFBldHIgR290dGhhcmQgPHBldHIuZ290dGhhcmRAYWR2YW50
ZWNoLmN6Pg0KLS0tDQogLi4uL29wZW5mb3J0aXZwbi9vcGVuZm9ydGl2cG5fMS4yMC4zLmJiICAg
ICAgICAgIHwgMTYgKysrKysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRp
b25zKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9vcGVuZm9ydGl2cG4vb3BlbmZvcnRpdnBuXzEuMjAuMy5iYg0KDQpkaWZmIC0tZ2l0
IGEvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5mb3J0aXZwbi9vcGVu
Zm9ydGl2cG5fMS4yMC4zLmJiIGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5
L29wZW5mb3J0aXZwbi9vcGVuZm9ydGl2cG5fMS4yMC4zLmJiDQpuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KaW5kZXggMDAwMDAwMDAwMC4uODRlZjhmODBkNA0KLS0tIC9kZXYvbnVsbA0KKysrIGIvbWV0
YS1uZXR3b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5mb3J0aXZwbi9vcGVuZm9ydGl2
cG5fMS4yMC4zLmJiDQpAQCAtMCwwICsxLDE2IEBADQorU1VNTUFSWSA9ICJDbGllbnQgZm9yIFBQ
UCtTU0wgVlBOIHR1bm5lbCBzZXJ2aWNlcyINCitMSUNFTlNFID0gIkdQTC0zLjAtb3ItbGF0ZXIi
DQorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9M2Q1NzUyNjJhNjUxYTZm
MWExNzIxMGNlNDFiZjkwN2QiDQorDQorU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2Fkcmll
bnZlcmdlL29wZW5mb3J0aXZwbi5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciINCitT
UkNSRVYgPSAiNDVjYjhlMGY5OTg0ZjFkNTRiNjQ4ZTQ5OWJkYTYzN2Q5NjU2ODkwOCINCisNCitE
RVBFTkRTID0gIm9wZW5zc2wiDQorDQorUyA9ICIke1dPUktESVJ9L2dpdCINCisNCitpbmhlcml0
IGF1dG90b29scyBwa2djb25maWcNCisNCitFWFRSQV9PRUNPTkYgPSAiLS13aXRoLXBwcGQ9JHtz
YmluZGlyfS9wcHBkIC0tZGlzYWJsZS1wcm9jIg0KKw0KK1JERVBFTkRTOiR7UE59ID0gInBwcCIN
Ci0tIA0KMi4zNC4xDQoNCg==

