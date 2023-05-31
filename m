Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE2AC77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 16:00:39 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (APC01-PSA-obe.outbound.protection.outlook.com [40.107.255.62])
 by mx.groups.io with SMTP id smtpd.web11.879.1685548837026086972
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 09:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=lpmTGTvi;
 spf=pass (domain: advantech.cz, ip: 40.107.255.62, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNcvmVFlcN00eLf5ZwVW7D/vvjaM2IJaNxHWWebWhzrdNIZg3tp4PNe1toDaT9pOc480TvHdfmcqqRqSrdj1JUNDsbmhR+Gsemu/msUzmR6qp8jHe+p+qI0GRR2nhxaC9Va9s+gHT7mUBe5aaeIX456DOfOujZoLH8q0Mn1v4yeq+Fdu90IJakRKlWT5x3QnwBSqYkdkaqN4LdNXKwPIW97hZOjPeW1CA5KCgOJ1AlLV7tu0g3p/F3ujtbqLsixEAXExpgLE5iS2hPnmGJ7MkbE63faTiNufWPNubwi9Griu32+NLHDUgNO5j1AiNcuMacNxd7lpHrWX2w8XhrzV2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOP3xZyGbAKHuVyFBQ067uUdaFRyM0/VzrEtQNd13wo=;
 b=NBcGraH0/OnEeIEC2ClrLJ6IDNDnSlRPrb4dNu4ccRzCv6ly6mD7n/kA/BLsYLQKGM3m8fIFHpc4H0Us3yOAdR0di/MeQLaR+uuF+6TURmefYAP6Mv4eii5jVUbDKoTHgN8Vgsk6mgrBTjDpkRJfyT/G+dFRBKRwLYY7aDhK9KQiPasP47EJDE/gQ60ddZqf02dOUykRwJ4JkJYvNxa7E4oyK/xkJJXI8TJRkuouTblvCJAdKvCF6+rqCdoea3zjURu9SQV0A9fqqkq0eXT8yljuuQCmvw3/ijCY7nvTOjaCaDKpT6MoKI5byBULJ1HbMT8nF0bRV5U1y4UmUoCpQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jOP3xZyGbAKHuVyFBQ067uUdaFRyM0/VzrEtQNd13wo=;
 b=lpmTGTviyf/TAxyE69B0cSJwWYjYpGyloeSYOku5JA0nyspcvKecevlJ9Gm5e/RAf+E258BgN1xloIymTY0X0vNcv/2+C7tTaSUwZYItO+VkRrKfKtBngdUee08NmXWwJvdahHVkqkCHYkqwz6TqJ8ehWwJV6FcXOnQ1Ae6z9LeuTtRS9FUQ+HT7GxMD5mTybpbAtXzVl3SlrY6yifVcciuiyXdsm3lDjpm1woAVU/6sX55gPx20Yo56NQi/Z0qlWdgany0K7787k+MQz6Qet3nq8jCj07pAevXPSdTTEaEePNo6BmiB+iLFUGmHIPTWcJHZ2zxsNnWAZJbtvhG34w==
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com (2603:1096:404:b7::12)
 by TYZPR02MB6383.apcprd02.prod.outlook.com (2603:1096:400:41a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.21; Wed, 31 May
 2023 16:00:32 +0000
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::5cf4:682d:c31c:c147]) by TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::5cf4:682d:c31c:c147%7]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 16:00:32 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: DISTRO_FEATURE gobject-introspection-data or gobject-introspection?
Thread-Topic: DISTRO_FEATURE gobject-introspection-data or
 gobject-introspection?
Thread-Index: AdmT1lXjZdjk4tl0Qj6u06bX0aFTJw==
Date: Wed, 31 May 2023 16:00:31 +0000
Message-ID: 
 <TY2PR02MB36782A89BAFA8FCEAF1ECC4681489@TY2PR02MB3678.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR02MB3678:EE_|TYZPR02MB6383:EE_
x-ms-office365-filtering-correlation-id: c2e1019c-2f84-41b3-0064-08db61f02989
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1WHozRebXz0DfEOXRQeJjimuMxFY4hgnybIphDfKkb1eBJ5IWqo2qIwoWmXEQKO1HqsSk04kSEgZZgU3fm5nUU+YAgviYLcJVtilzjTAEk1ZSlmYPK1imhZfianigljvicwNtnPrUk7F4uUwP6SJYqhaUIFRUGdZJ2sV4nUE5F6pY5rfbJr687AgM3FH4uKLa9KHt/ymIagzvW/K8ZLjIzynzNQdmWqKCBQ+7zyNsRtnAOHtf1xABZd0fs5FTtJ9yoQnYEX83mcD3lBAAN6EqVsk6TByEfICzXx12DMbgn8xVswNqLqRQnFMD3dm77FiLE/+iyEEfyGxUj3XUWCzlbJa3Cp5ZV+f5zZG+JZPZ3aCxZDSeJSfrz7Tx0CdMS33lf0xRCknBAo6gJ2+Xy3FwmbZYlLjJ6vUWqJ1fUKF0moGuQdo5gB7GdCvcH0lqfwhmklFOaVKV3jBgpXpOz57xhlZEFMQeGbHjh52wfQHJ68NPYywXMWSacGqZXK4lsYqrjgt0FAE61kZjaEVUUJ/s7ULyDo9eEepZQc4Hes+mPffCdxpgaEsfUNROt3NcCucr9H8ep4k0sbsqPdMJUXLUuFXLlRt5C5NBYpAAkYBgIiePevD9Lc4kk7jtP9Hjm/g
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR02MB3678.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199021)(122000001)(4744005)(2906002)(8676002)(5660300002)(52536014)(44832011)(38100700002)(38070700005)(86362001)(33656002)(55016003)(8936002)(66476007)(64756008)(66446008)(66556008)(66946007)(76116006)(6916009)(9686003)(6506007)(26005)(7696005)(478600001)(186003)(71200400001)(83380400001)(41300700001)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cnZncGQwSjl0bVloTzZpKytDL2QrRm1LNWxhVSs3NHNMemRlZytlc3B1TE1o?=
 =?utf-8?B?RkIwVkNpRXliR1A4dCtQeFptOXAzT1V6UDAwTFo3MGEwNWdiUFVzYnRqeG9M?=
 =?utf-8?B?c0c4NVJpUE13c1ZiTGVHbVdidjVWUkV6MlFkMGZrUDdXVW5BdkVsRTFoVXpD?=
 =?utf-8?B?Ryt5NngrR1JHMDZpSitiT3JyVFJpcE4zRXIvTXV4SXpsdE1ZS1p5cklJWCt4?=
 =?utf-8?B?RVBWdklvQmxYaXF1Wnl3MlNaUTFzOTd6YUxxWThtbCt6UGZqU0xGbnl0MVRp?=
 =?utf-8?B?SFYxTkFVbFJ3Rkt2bzhWY2kwRmlMdUorNDV5UWdtTWZhU0tjOUJYQ1hmb242?=
 =?utf-8?B?TTh0Mm9CaEpNSzVneTJ6RkZzWkwvSzFZL283eXAzaDJxaTZqZkhNNGU2d1FF?=
 =?utf-8?B?cUYvSkYvOFJ3MVM3VENUL3A0Tk43M2ZwK211TUpSbm9CYWd0amNVamtJd2kr?=
 =?utf-8?B?V2lEZmZSanlBVWRQUSsrRUtodm9zbHFub3d5VUJCMmRjNGk4UmdhOXVVeUU5?=
 =?utf-8?B?akZoTzc5cXRVQUJ5Wjd4dkFMN2N0N0xIaVdGM0p4dGZvRWtPc2l3Tnh0UmUx?=
 =?utf-8?B?bGVpa1VQYkp4cHpOcGFtOFo1Znl3aXBZTW4raFJaZlNYOTdMc1lqVFpVVWdG?=
 =?utf-8?B?NE9rR3BBcEpQTUZQdzJHSi8wYVlyWGFsVW1kcVBoKzZBbFJPajdabXJmL0dK?=
 =?utf-8?B?RkRTdEp2dGNKZ0tWMWtzRjNlSnNnVGEySEh1akhSR1BaTDdIWHRzbE9USllY?=
 =?utf-8?B?RVR4NTVPVm8wL3RoeG96dE41ZjVIY2pyMVU2UHFQRVBKYmFiMUJ6SkFkTTNm?=
 =?utf-8?B?a0NweUE2amRwT0M0RVh3dWRIMDdsMDJ6Nk50VTJUUi9VeXdrVkdheGVkak9i?=
 =?utf-8?B?U1Y3TGh0elYvdlB3dEtEQ3NXSXJSWmgyTmtYcUVhbWxDQnRXZ3Q4VlRJRysy?=
 =?utf-8?B?NmRXQk9HREs5ZHM4ZlZ3bHM3QjFnYWtMOXlsb1lDNlJQaGd0TmtjL3o0YjF2?=
 =?utf-8?B?OW9FZGZVajdPMzZxR1ZZVGdVVXB4WmpoVDBGUENuSHpyWEFWNEVteFlrNkpB?=
 =?utf-8?B?WG9WRFpEMlRoWUxqcjFUOFgvMld5U3RmL2xYbGVsTWo1V2JSR2xZSGRzRW5k?=
 =?utf-8?B?eElnTE1uVFhHcHB5bXIwMmxqQnE4UU5LWTFwczRZb1hveSthdnViTCtMak8x?=
 =?utf-8?B?SVpuc09YOWxuK0tiUU5iK05mdHVGY1FmSGoxMno2QmpZNUtqcWkrbjJyRFg0?=
 =?utf-8?B?OGgyL3RtNFZhS2xpcTB4TVpvbEVqcjlYbWRzcHBycGtWeVZwMDFJb0Y3L3hW?=
 =?utf-8?B?bXJDRU1vU1dKRXNWdDR2K0syczdGWUU5SzYzT21JSGpvM2FmL1N6Tkl6SERH?=
 =?utf-8?B?T3ZpKzAzQWt5Yi9kaU1Hanc1d3hrU2krYmNBblNndUlIMlVwSktGMUpRRHcv?=
 =?utf-8?B?djcrL2lmSTJSRzFBcDBRb2RvbGpxcktJQkw2bHBlRUMyVTFVRFI3MXloTTNY?=
 =?utf-8?B?QTA4Z0w5SzJkVkdwVVNxOGh3czIzY0FoejUya1IzUUMrcjVOYzhNZFNnaSta?=
 =?utf-8?B?VW9jRitJUXZpMUdrNUw1QzlRTXlKKzBQR01SbUVkTGdEazdhbHg4VFZJM3ND?=
 =?utf-8?B?dVpEaFJRSWRKYSt0amZwbEFFdE5DeUd1Z0psZXdmdFlDODZ2bzErWEo4c3RJ?=
 =?utf-8?B?VVNRZWNueEs2Q3lSUjFFNjdDdjdvOXpWTnBnN2hhN1h2dDlhM2c1eHV2ODVo?=
 =?utf-8?B?dzZ5SENvNzdkUWcyWCt5TVFzRHR6S0V0aS9HNWN4K2VmSlJQU3pNa29KdGN0?=
 =?utf-8?B?ZjI1bElDU3J0aGJ0ZXg3d1R3aVl6dlpLaU5ESHdOTzl2cXRENm5XdlI1ZUFZ?=
 =?utf-8?B?VFV6WkUrV0ZsRGdwY0ErZHZBTWhMb0tDWGkyMi9TTVBhSGZ1Z0J6dXBKc1ll?=
 =?utf-8?B?T2s3RFNJNktDT29uS3pqUkc3NFJETFlvOFVUN0Jpb3lWcFcrTDBZTVIxN1Y1?=
 =?utf-8?B?MnB6YVNEcUowd0xLL0lldHVpbzlXNUFyWWRSMzZpNE5xdC9xQVp4Mkp6djRW?=
 =?utf-8?B?bUU2NUFCaVR6dko5aXExeE8wSURRckJSVVZZaUUzZlVxYms4ZmRiZGNZbFE0?=
 =?utf-8?B?WWdrT2J1Q1I1Y1lMOEhjSHp6ajAvVWw1OG1tSFFLcTFLNGlZUXhnWmdqZkpK?=
 =?utf-8?B?SHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3678.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e1019c-2f84-41b3-0064-08db61f02989
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2023 16:00:31.9457
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h53gGAoHxnSizME6sCS6S+DtpTjWqc3JDlXc7fNpUhlbVu3rED0tlK/JDfMxIsSBYt/Y6vvjdL+7UqkJqU27M+tVjAzMPNMv4H12p+JIbGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB6383
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:00:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103069

SGVsbG8uIElzIHRoZXJlIGEgRElTVFJPX0ZFQVRVUkUgImdvYmplY3QtaW50cm9zcGVjdGlvbiIg
b3IganVzdCAiZ29iamVjdC1pbnRyb3NwZWN0aW9uLWRhdGEiLCBwbGVhc2U/IE9yIGJvdGg/DQoN
ClJlY2VudGx5IHRoZXJlIHdhcyBhIHNldCBvZiBwYXRjaGVzIGNhbGxlZCAicmVxdWlyZXMgZ29i
amVjdC1pbnRyb3NwZWN0aW9uLWRhdGEgRElTVFJPX0ZFQVRVUkUiLCBidXQgZm9yIHNvbWUgcmVj
aXBlcyBpdCBhZGRlZCAiZ29iamVjdC1pbnRyb3NwZWN0aW9uIiBpbnN0ZWFkLCB3aGljaCBpcyBu
b3QgZGVmaW5lZCBhbnl3aGVyZSBhbmQgaGVuY2UgdGhlIGJ1aWxkIGZhaWxzLiBXYXMgaXQgYW4g
aW50ZW50aW9uLCBvciBhIHR5cG8/DQpUaGUgcmVjaXBlcyBpbiBxdWVzdGlvbiBhcmU6IGZpcmV3
YWxsZCwgYmx1ZW1hbiBhbmQgc3lzdGVtLWNvbmZpZy1wcmludGVyICh3aGljaCBjb250YWlucyBi
b3RoIGdvYmplY3QtaW50cm9zcGVjdGlvbi1kYXRhIGFuZCBnb2JqZWN0LWludHJvc3BlY3Rpb24p
DQoNCg0KUmVnYXJkcywNClBldHINCg0K

