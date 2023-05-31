Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0AE1C77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 20:33:28 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (APC01-PSA-obe.outbound.protection.outlook.com [40.107.255.80])
 by mx.groups.io with SMTP id smtpd.web10.5148.1685565205767093009
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 13:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=EfO0e9dt;
 spf=pass (domain: advantech.cz, ip: 40.107.255.80, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9Y5uUOvJUUx8q07gpA+yCi4e9I7+03oa1uH+bj+RT/j3mMvEMJ8lsVsORs3AQRUKUVw1WTX5dmF4y63HpXHhzUZQZmqgsep79sViro+5vO2LNz3Uinmbwaw3eBYrNJ+FlPpA1N9o+m3Kf6rjX2ibj2EZvCJR4dupShCyyZxglEpJeNqD3J/Vq8jQgCKusCFk6ilDyZpRlGBJS3aw15/iV+H1Ay6XzLO8fJf0RCOQAaNWi7s/DJFDqVA1qTHMOd9YEFfPaeg5Ho/K+oN3MA6/LAMVz/gd1xJtYB8rX4Ve7O7+qFWre8JC2er+57BuemLCiESjIHk1m01KuDFVbarLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=foHqyJTcoKwEh7iZRxIZsrd0srhxjA2NeMpzkXyifjY=;
 b=MfwReWuFHIdJdQPZI9ZLd2kAn5HtuRLhdkMLC0mGh0glBO1BgNoKcG3ypjpctsdySon9Dh8DGyxIQcazL2yUV7ugrT3Yawt3EaDE9uTmJD27ClzdGO/wHQvKjkCHV6Jcap5XwTyTRmDYQSM2zU7Ni8dmAAcZNGazwxYT3p14UAOsFW2oed/pBu12t6qHJLQqgxgPcco5CCeooWD21N2MbFGJyrJgC9A6bvxGkP7PK5c+InQDtxT7/AGiY5zZeRMqZu4pgROR8pvaTwYeF3o7e51tZ+/XNSBQhi+Ad1nTxGI9WM0wPklnZsYRwR+jCB+llTBpUVHR0aniKxX2kcWKLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=foHqyJTcoKwEh7iZRxIZsrd0srhxjA2NeMpzkXyifjY=;
 b=EfO0e9dtS1xaXHCaCH2RjqHI+SnF5Llvt8UFs/n9Y5By+EF00w1kon3ead4qBNp+jQ3eA6U6ZN2eaVfG7gddyz0lSyqU+Kl5VPvBMW+POtW8nX/XbVOmCu/Mlqh0y+5z0TPBDRp1vSAtRYh7Ks1fzlclIPsq8L72bRPjWtD+9OyFJ2g52aGBJ45V8n1CV1Q/L0Y0y5Nj0/jZmwHw/7n4dBHjGWkfSD3kAQtGcMbaB35m3YlKXh2kIgV+8iXWvGvzVEKR0z/01XA0tc1hY1E3R+B1irpl1xNPeOHxlBzX1/Ui8U62gqc/b5pIiNlaaCuQIWLweZ7oe0HqiYssyETZHA==
Received: from SL2PR02MB3676.apcprd02.prod.outlook.com (2603:1096:100:47::18)
 by KL1PR02MB4660.apcprd02.prod.outlook.com (2603:1096:820:36::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.8; Wed, 31 May
 2023 20:33:21 +0000
Received: from SL2PR02MB3676.apcprd02.prod.outlook.com
 ([fe80::2dcf:3f1b:7609:d74e]) by SL2PR02MB3676.apcprd02.prod.outlook.com
 ([fe80::2dcf:3f1b:7609:d74e%3]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 20:33:21 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] DISTRO_FEATURE gobject-introspection-data or
 gobject-introspection?
Thread-Topic: [oe] DISTRO_FEATURE gobject-introspection-data or
 gobject-introspection?
Thread-Index: AdmT1lXjZdjk4tl0Qj6u06bX0aFTJwAE/8AAAATwcJA=
Date: Wed, 31 May 2023 20:33:20 +0000
Message-ID: 
 <SL2PR02MB3676A689F3E27EF11CF2988281489@SL2PR02MB3676.apcprd02.prod.outlook.com>
References: 
 <TY2PR02MB36782A89BAFA8FCEAF1ECC4681489@TY2PR02MB3678.apcprd02.prod.outlook.com>
 <CANNYZj9Ldo1PxzVKKu8-SPV=HZo_4uMT0qUP6SYjLge42F6dgA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9Ldo1PxzVKKu8-SPV=HZo_4uMT0qUP6SYjLge42F6dgA@mail.gmail.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2PR02MB3676:EE_|KL1PR02MB4660:EE_
x-ms-office365-filtering-correlation-id: 41773b90-e8b8-469f-5686-08db621645dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 sL6kwDP2HCWq2VldOQqafSJvcyOTneYrTyepJaZphW4VSkKkrI7FcdLsf/fYKyd0oMiu+f31qnp6wmNJsYEFAatAIghvtC0tTtaseUCnk+hm4O0BOSQzIVBgNWpHqeXUBa+Khqd6FT1HBPbe4y59/up57u7J/d+k9hhQNQaia2ijykogqvAmiwGuOLnRlKedyTUZ9ushnMthduB5DSMYp2svE4UyCyl1B7wnumriD2RKv1ZHAfpAZy+7fUo5cByusBJ1egfGe/koD4KfFNIbERmhLqzcRXqrwhhU/cSSIQBg2Q2CX3qkxD5mA6qSk4xN1AX0Q3Ukcay+HmL5uVU+IXrDSUWlA/qLFEcDjYCa682gkdaDtj0wclSqs92dHgb189KJY3WY+IOgLwC/JjPtjOvBtmnxpHokVuXubRk5vEaw9BbERqWUo7jQ+6UzVv22kzGcCweMdSyQKjworJHJk3rRa6ttOfvGrJDbksnOLsAlWj+dPN1Yn3Jr0X61/qK8XtnGKhBhzxwwRkeLZfo/7OoODMoGYhTTCDLkQ0XMFvpynuR7AOhO6Y/KbAgQt17UZBOJ52hqMSi3njD40Rh8R/VvwQ7gmpz8WTtWegPgYDI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR02MB3676.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(366004)(136003)(346002)(39860400002)(451199021)(55016003)(83380400001)(66946007)(6916009)(64756008)(66446008)(66476007)(66556008)(76116006)(9686003)(71200400001)(26005)(7696005)(6506007)(966005)(478600001)(186003)(86362001)(44832011)(4744005)(52536014)(5660300002)(8676002)(8936002)(33656002)(2906002)(122000001)(4326008)(41300700001)(38070700005)(38100700002)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YlQydXJoUDBYNWc5SjZYNlJudE5rV0poUHd0S2lXNEx2L2Z4dGR4Vkt6cm9j?=
 =?utf-8?B?UlhCYjJhS2hneTFnd3dEUFU3bUVBRFNtcEdTMmkwUlk3SUFWN0p3ZUZNOW5x?=
 =?utf-8?B?SzJab1FnNFI2Z0hGUG1ML1RpOURleDVOaW9NYnpjM2dwb2xoU2RTYUg5NWpL?=
 =?utf-8?B?eFdRWXR6Mm1CY1ZqWGpqaS9idSs5enk4NkVIOVViV05jOFVJZEZtdlp2T0lU?=
 =?utf-8?B?RzBHbHlPMlZoMlo1MEFDY0xjRnNvQ2Fzak8rMlNYMDRPaStTR2JwMGszcytF?=
 =?utf-8?B?eDk5TGx6R0VmSEM4Y015WEZYYkh1dklJbWwwdFdFYWZKNzlpd29nL1ZFZVRo?=
 =?utf-8?B?ZFBFZ0djb3BrVjZnVjZqT3BBbVRIU1YxWWcwcmM5dDh1eEZNRFp4L2tZRllX?=
 =?utf-8?B?d2RDYXIvK1E0ZERhUHpHYUdlMU42R293SlNkSE1RS1dEc2ljYnBxSnJTRVFG?=
 =?utf-8?B?a3N0RWdLVnRsUStVOGlKQ0hScDNUWGJhRFJFYzVQemJjSDNzZGNTaTNONDVO?=
 =?utf-8?B?Rk5Lek9EVXBoZFRLamhUTU1kYjVuSGs5dG42alg1N09PeWZwUVVFUEx4OHlN?=
 =?utf-8?B?cGNEblBOQ2NmdjRONUwwbTFYNEhBWUo3TzlEUmhYZmNFVTI3NG9tMFY1MU8y?=
 =?utf-8?B?Wk1FS3c2dUtZRnlGK2ZtTXlaaGxzNURuQThMMk5ZRUEzU1pFN1RFeWJPakRx?=
 =?utf-8?B?bmdVR0xxWFg5eTNJRE1XdGxuV0FpR1lleDZCU295TGFyNW1zUzhlMHRIM3NS?=
 =?utf-8?B?bjYyd0k3NmQrRmRrT0psbFo5eGV5NGgzQUcydUduSzFjdUVFZ2w2OVRhZzN2?=
 =?utf-8?B?bDBDZjVtMHRVQkN3UC9ETys3SVc2Tk9ncTd4YjYwdXFHakI4N1BlYWZIZ0Ji?=
 =?utf-8?B?VzR4SUdTUWR6VWVsSHN2SWp6b0FaUStIKzFnaUtDeGhTdmFNai9uWWp1a3V1?=
 =?utf-8?B?UWxodEZEZVBCUmFQR1VlU2htM0NSeDRPWUdJZDlGNFlUMEJtWFJoTXpYdk9l?=
 =?utf-8?B?cytvTmExOUprcnZrZzl6WVgvWG1wUzgrUlJTUFdURi81UThYZ2Y3M25lbEVG?=
 =?utf-8?B?SnBWOWQwdkk0bHh5ZytTRTBva1R2OUE5QTdIOEdOOG5ZeEl0MVR6bEFuSFZD?=
 =?utf-8?B?Rm9MNDhYdTEvKzgwSW4xOXJheW5wSjc4eENFb1BaM2hyRlpwQjBacmVrbFJ1?=
 =?utf-8?B?Vmt0UUxRcFQ0Mk8waVpxTis0UHZBbDIxaVQzNkZLck5NVDQ0bnRBa2lCaEgx?=
 =?utf-8?B?dWNtbVkxR0UwNWJlVnJMTVhCTHQyMFBnYnJ0UEVYOWlydkNyYUI5bk9ka1JW?=
 =?utf-8?B?cDlTc3FDY09GZVNRcWVvWTc2ZHZsb3dERDN3MUpoS1hjaUpTaCs3T1hPMmNK?=
 =?utf-8?B?Sm4yOTVIb3lMZUxZNW5KVmdvSHdWTnlmeVRsRm1sMDEvS2toRUpKWlVKRzRa?=
 =?utf-8?B?WStOTUlRODdOVGUxWVU0RmdtK0FKZ05YS0k5bFRmdUJ0UTNFdXRTUFJaRGF0?=
 =?utf-8?B?a2MwU3lvMUZkeEttbnY1UFZNck1XR2R0UkpBOCtnOUJ3K0xad2ZOejNUb2hh?=
 =?utf-8?B?VVR1ZkVScmxZdzNYeXZDMDRWV3pJdDcrUUlGWnYrTjRMSWphS1hpc0FkSW5j?=
 =?utf-8?B?bjA3dE5La3pSeHBQbDh6Q1ZOUUZGNE5UWjJkM0ZBd216VjRLT3kxVTYyS0t3?=
 =?utf-8?B?U2JEdGdqYjBXaVUzT1ZDQk5FYkFMWHNtaTMvclBwV3RDeFdDQ2VsSlRmZXg1?=
 =?utf-8?B?amIxNEUrcXhRM2YxR0hMcGV4bzRTWGdIUllCb0lkRWtrUklVeUVHOVZpd282?=
 =?utf-8?B?b0V6ZXJ2RXN3NVpHNjdjN0lpM1lYVjN6SmZMQmJnbk91ZTJka1cydFJ5eDNR?=
 =?utf-8?B?dGVWbEh3OGlhMTVzWHh3QkFVWmRRSndNRklNSVRub3ZrRlk1SjlaaS91bDgw?=
 =?utf-8?B?Mm92MjJvMWpVREJweCtBZmZZUVBkbEFDMUpFZHdmdE52a09hQzMzTFVzL2gy?=
 =?utf-8?B?Q2V2dHB0OUxTQ0VUR1lkRXBSc3k5WW5nY2Z2bXRQY1lwM2lkQXRDeGlJaGMw?=
 =?utf-8?B?QlBlVTliYU96YndJOUFrZTNPWXZuMzYvWkZJOWVLazIxVTFUYkw5QUpQZHAy?=
 =?utf-8?B?VWN5SmZkMnpvbzN1QjdGK2p0cXdMQ3B2WGl3L1lPclZtc05PSUlZZ0hKNkUx?=
 =?utf-8?B?K3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2PR02MB3676.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41773b90-e8b8-469f-5686-08db621645dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2023 20:33:20.3431
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a3nEw5aSwUFO/t4ibWefBXqoTOzVYiBq52jf/7jjlXqUayHTmNczMjoEQdv9PUKssrzIXQVeYasZMPJT49eIeSyvcivrZ4kJnOi1sJzONc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB4660
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 20:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103071

PiA+IEhlbGxvLiBJcyB0aGVyZSBhIERJU1RST19GRUFUVVJFICJnb2JqZWN0LWludHJvc3BlY3Rp
b24iIG9yIGp1c3QgImdvYmplY3QtDQo+IGludHJvc3BlY3Rpb24tZGF0YSIsIHBsZWFzZT8gT3Ig
Ym90aD8NCj4gPg0KPiA+IFJlY2VudGx5IHRoZXJlIHdhcyBhIHNldCBvZiBwYXRjaGVzIGNhbGxl
ZCAicmVxdWlyZXMgZ29iamVjdC1pbnRyb3NwZWN0aW9uLWRhdGENCj4gRElTVFJPX0ZFQVRVUkUi
LCBidXQgZm9yIHNvbWUgcmVjaXBlcyBpdCBhZGRlZCAiZ29iamVjdC1pbnRyb3NwZWN0aW9uIiBp
bnN0ZWFkLA0KPiB3aGljaCBpcyBub3QgZGVmaW5lZCBhbnl3aGVyZSBhbmQgaGVuY2UgdGhlIGJ1
aWxkIGZhaWxzLiBXYXMgaXQgYW4gaW50ZW50aW9uLCBvciBhDQo+IHR5cG8/DQo+ID4gVGhlIHJl
Y2lwZXMgaW4gcXVlc3Rpb24gYXJlOiBmaXJld2FsbGQsIGJsdWVtYW4gYW5kDQo+ID4gc3lzdGVt
LWNvbmZpZy1wcmludGVyICh3aGljaCBjb250YWlucyBib3RoIGdvYmplY3QtaW50cm9zcGVjdGlv
bi1kYXRhDQo+ID4gYW5kIGdvYmplY3QtaW50cm9zcGVjdGlvbikNCj4gDQo+IFRoZSBjb3JyZWN0
IGFuZCB0aGUgb25seSBvbmUgaXMgZ29iamVjdC1pbnRyb3NwZWN0aW9uLWRhdGEuIElmIHlvdSBj
YW4gc2VuZA0KPiBwYXRjaGVzIHRvIGZpeCB0aGlzLCB3b3VsZCBiZSBhcHByZWNpYXRlZC4NCg0K
V2lsbCBkbywgYWx0aG91Z2ggSSBhbSByZWFsbHkgY29uZnVzZWQgYmVjYXVzZSBLaGVtIFJhaiBh
ZGRlZCBSRVFVSVJFRF9ESVNUUk9fRkVBVFVSRVMgImdvYmplY3QtaW50cm9zcGVjdGlvbiINCmlu
IHRoZSBjb21taXQgaHR0cDovL2NnaXQub3BlbmVtYmVkZGVkLm9yZy9tZXRhLW9wZW5lbWJlZGRl
ZC9jb21taXQvP2lkPWRmNDdkODcxYzdmM2JiZTNmZGQ4YjBlZDcyMzBkM2JmYjhkYWY2ZmQNCg0K
DQpQZXRyDQoNCg==

