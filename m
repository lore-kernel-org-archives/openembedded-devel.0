Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04156C4167B
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 11:00:56 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (NAM02-DM3-obe.outbound.protection.outlook.com [40.107.95.64])
 by mx.groups.io with SMTP id smtpd.web10.10908.1699441254029605974
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 03:00:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector1 header.b=SorSMLJ1;
 spf=pass (domain: infinera.com, ip: 40.107.95.64, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UU/xIm1AL0zbsOW7mKtxJBD5y2swpVn8xTAoI+nbbeAobqD7cb5c7BRXcFO6rSMZj/R2E4ojZV9zygfkVLIbBbevmSkEC9RRkpJ8Oos8bTLRX1T3d6A3QItNOyHbR3aQozoSQRqAw9TnaAlA6TR8eCKaBzArN5niiNfFu8dOlkzdlvESCFboK1U0VKdUjlXgPULnpQUXZJLTaynsI4jZYW8i1o0PbcfxKBju96ZQkgk5P9YUeYZUOt1KUAVIBkaaWDzzh0ciUk/pck+N4orIBkp+Z1cyyoj0wE0i3gFEKundtPAlkDq6QUBGUymQqIAmAvmAXU+1lg6HsrGHXvAiBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTFTasvklq0cv2US9pGwXHtY9cfA1rKUTJCoDVaDn4I=;
 b=LumW0J/ovd5Qp+MXU7n5+LxWBvv1vlPt5oeTjqdZxh9izz7xPIZsFysflezQpFJvrtrJI0DwehFPzIHWk9ud9o5bGDXXaqNdFU3/2AcMmyCITrjzl5sAsJH0KNeUV3e2FBrO77QFYolzn4wHqAaSv+JGpkfd6dOKLu/m75GULQTu9vJCmm493xuN9RaDR16yFUhyLcYZPpuSOXIAcq53sHBrBY3NsJYO25h+tde7bCvHwCg3FZfdCsK2gP2oDQvq70Lppv2x6ttY9mrQzH8VAK1so7qAQBnNNc6JZcknjb/OL7UjNheRSWGVc3Wwx0m8Q39/cedw/R14y+xllKAWWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTFTasvklq0cv2US9pGwXHtY9cfA1rKUTJCoDVaDn4I=;
 b=SorSMLJ1jwP18jL416OaUB+oSu+yw+cYJxK1M2OoL4nfzypNzGGQUflrGGI/Sf2Zoo/5wNmRshH05aREfjuroVhufuvl5ay7cy4M2NrkdWrt0sbtbkuWEIImze3Ip3ak0vIP8XTtoBMhbiEqi4297AuRVxcoXgIwcEmrWsifv4v+b3Z7A1m1wRPkzRzSxsMjbj8JIHmeRONeTWChnpnO/HEOWcngEPl2WDFBQAoxVfUveo+P8wDxQS7rk4yaz4Oo5qgtS223kKvSYpBv0Tza2N61Wcp2A7WBYL3vlZFxQdNE97yMQPRKZuVFpl02GGSUuZMXUKDL2lcLngHoUxo/Yw==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by BLAPR10MB4913.namprd10.prod.outlook.com (2603:10b6:208:307::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Wed, 8 Nov
 2023 11:00:51 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::86e6:23e4:41ae:35c5]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::86e6:23e4:41ae:35c5%6]) with mapi id 15.20.6977.018; Wed, 8 Nov 2023
 11:00:51 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "joerg.sommer@navimatix.de" <joerg.sommer@navimatix.de>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH] [meta classes] sed -i destroys symlinks
Thread-Topic: [oe] [PATCH] [meta classes] sed -i destroys symlinks
Thread-Index: AQHaEbhzR/sp9kL3u0GeKyalP756yrBwPnQAgAADxgA=
Date: Wed, 8 Nov 2023 11:00:51 +0000
Message-ID: <5d002bb0556f030ce6746dc9783b2e525a77b3be.camel@infinera.com>
References: <20231107202439.2647261-1-joakim.tjernlund@infinera.com>
	 <37d34916-b09b-4fee-a57f-6d7b01eacd3a@navimatix.de>
In-Reply-To: <37d34916-b09b-4fee-a57f-6d7b01eacd3a@navimatix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.1 
autocrypt: addr=joakim.tjernlund@infinera.com; prefer-encrypt=mutual;
 keydata=mQENBFp0f28BCADPn4XzN2HEzkY4BZKE6/T/S4M/Qjlf01K6gmECJZi5LQgOt0jOUAdvsXVd8yKYeqCq+eWvlfrLU9OXPGoCqwj95P2YjMsttqaPBEAnf4XyBs67Snz2wHyBDONoRxGoyq2Ondy+TPicWEm0mh404h9EzKxRNxwrRyKhsjWoVeaucuybAiGbJvqQj0CLmuMCl4PUBYDmXFzt3yx0g54z8E9/8ON+z0J7yZbA0aftZAjFLv6nn0Th/2dpD8d3vWtkJw4yBjLX2KFvlzJfQqkd6RI4Cn1OP9sguXDob123dMiMk/5XbjXz+0C21QFxejxt3HGisvKes+8swplyni7KdiDtABEBAAG0MEpvYWtpbSBUamVybmx1bmQgPGpvYWtpbS50amVybmx1bmRAaW5maW5lcmEuY29tPokBVAQTAQgAPhYhBFtMG/jmfqy7x0aBp4VMQ6CbDpcaBQJadH9vAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEIVMQ6CbDpcasFAH/j64dpHpjY55tVoUg5yK8hcmxS/buKQQP9H3e2DdHeYrK0qeQ97AXiWTh63UvzvEXchiKjua6kYhUUkDObaltmwkKgPv0qb9lP6yfFBzvllriS6LrdIMCOLgtnQW2x28m5mC1hYT08jlqEXluYDoj2dTll9HGMsqn0JkhRjBsuzTXq8VyJjjnNLpzsAlTOGEQoAi7SqtDHs9PSNyOAKH5jRjATdNbPAsTKuI1veJf7Zzyc98yG0ya43Hqal1scoa+9GJZXNQPRaMVkyxKGbEEncdtnQl9e/DUMH4SUQ5vbM/+U4WvkX5Cvc+KwI6JAm1PhrAaVHSkDNAU5LqUqEbbHY=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|BLAPR10MB4913:EE_
x-ms-office365-filtering-correlation-id: aad52744-d560-4581-789e-08dbe049f8ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Bnzxe3hfse3bfLVQVDCy94SCgidYKJuSniLYhLPghA16a91xxbmLZCVrsYHUBGLpYsBSHnDXQN9xl39MVb9tbNL09zv69pWWcDSqvLbN8NaqFknlmfztRCgEqQJX63iQxzj1ER036efJzqkdqNjIwED08s69x7Qi93FPuivb9UsmLpX+V8HncD6AQ1fQI+wei2TCY4zmXZlfM2HpfGRFI8axiDSrUpdLtULYPfKv9qHzDmiWDgiTBcPyS6jXlF1orqclm0jXTmMzY5zIqHp5uRmqKMsau/B4UnZQgyvUryzyu47ug/AxxLBcaa3wd/xdJQrlh5NSNkQ3pHXTKq2Is7YuYW/qJvyQ0nk5wDpx616su3sSi7rtj+/+sMCljOQgLnYMAun1m89Nr1tLPVnBXmG6HiX0aD/6avP4USzU+coDMCAtANNbrgnEV07FBihqF25TSkqCf2xM5bHT/6nsgSg8ooReqKfxHqABjZ3B/0g/baqpdih/v4OA8g5BipxU/dNBIOYQl/NN43PbKLtkzgxIr94VzNVlapBaqX6ix3G6mtAbz6mn/9hiAoc+76AOWR+9frQOJL8dZkR5RElgqByo7yidXLx/ikgIm/jKVjnP039CHMPnDnfu08KChq+a
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39850400004)(396003)(136003)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6486002)(71200400001)(86362001)(478600001)(6512007)(53546011)(6506007)(316002)(91956017)(66556008)(76116006)(66446008)(66476007)(64756008)(110136005)(5660300002)(66946007)(38100700002)(122000001)(36756003)(8936002)(4744005)(8676002)(2906002)(2616005)(38070700009)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bmFUUDhkZ0pzM3ZjZzFuL0c3YjRicElremViT0VYL3FmVEdIRmJ1L29MazBx?=
 =?utf-8?B?SXkya2JzUWdIVm8xYk9vbG45NG1oU3EvYmd5VnJjZDA2VXJObmlJR0pnaloz?=
 =?utf-8?B?akIwTHlMRGMwbmFrSUI3QnFBdmRvaDMvRUlOS1B0a3JCSzlaMDVvMkE3SmpR?=
 =?utf-8?B?MHlYdGlQcFJOaUE3Vzg3R1d0VWJwakFCWHgwZ0huRVJ1YitJWGVsRFUxVUVS?=
 =?utf-8?B?VitQbGE0NkZGdmd0cUdGUDhVY3RMdUV5c2FNVm9hZFJ6aXg1Qm03SEFaenB0?=
 =?utf-8?B?Qkx3Vi9iMXJuVmp2cndETDhyV2pSR09UekNBSzkxWE9CdGdyeVdyMHVUbFcz?=
 =?utf-8?B?eE40bWlCT1UxeHhEN21SMkFaM3BFMnZvWjF6VUN1L1VvMm82R1BTdEZOUWJO?=
 =?utf-8?B?UWV5MjgxRTg0bTlvQ0pGeGtLRHRBbkUrWS9LNEY3QzZ0c3RmNTgxQWRuMkQv?=
 =?utf-8?B?d1dQWTZsTjdYRW1JU1RHSFllekxvMGtXUjZ2eS9FYzZiQy9KckhJUVJ6Vzlr?=
 =?utf-8?B?SWo0V0thb0ZqRU9PbVM0R1hEb2NVeG1oKzhyc1lGNFZZZFdGQWN3bGpqSzhp?=
 =?utf-8?B?TFpaNUJ2WXRJWWV6YXVBVDRLdVF3bUhZRDlLSTJLTEoxWVhWMHlHUFg1Rm5u?=
 =?utf-8?B?eUQyZCtoaXNkWnQ0bUpiYkFjaUg3dVE5MjRQRHQ4dlMxYTJIeFVTTlR5TzVY?=
 =?utf-8?B?MzRUYXhsV0dIamtmdHBjTXlLN1FRS3orZXlSZ1Q5N3lVWGM2SmtWZDVFNU4v?=
 =?utf-8?B?QnVSTDBOUWdSdG9PMDRaRlYvMTdXa0EwWjh1cFpLR3NkWjJZcVRQYlNBVlhp?=
 =?utf-8?B?QUZaTTVwaU4rSXkwQXRXbTFsZ05IS0FEalc4SlVTMWJoVjllVFk3bjJ6ZkVz?=
 =?utf-8?B?UHpKTnl5OE5yTnhDOXRpaGI4ckkxL0dIVTlTZ0tCeGVtaGgwSThVeklWZE5L?=
 =?utf-8?B?bnBmZS9UQk5FUndHN0J1Wm5iTThzK1Q0eGxYMzhlYVZKVGVhY2pmaVpDSlVu?=
 =?utf-8?B?VStnd2VRRUFQdWJBREVXNXhwUHl0ZU0xaWltWGowNjNJSGF4NDlzRGo5UGRC?=
 =?utf-8?B?T2N6aGZsS1NhMVZHNWZkYytjQnVlaFdzbWdMblZxV0tjT1gvZW42bzRiazg0?=
 =?utf-8?B?Mmxnb0VqTDZ5L3pYZUYxc2FkN2Y3R0hYZE5RNTZxZEVwMUlkeW9USWoxSWFj?=
 =?utf-8?B?b0tyb1MzRHFwVTJnNFAyYnFjbTJnSUd6UCtPR2I1UVV5YTNudE01LzF3Q25D?=
 =?utf-8?B?SlpLVDRNWEJ1N08yVXExMWVPUzYxZmpQcUV3ZXhpRzAxSmNpNGFvU0k2dTBC?=
 =?utf-8?B?U2VYc1YyaCtFbVBEOTdqaTdoVzZCbENOL3VYTVJORldCS3NEYmdxREhua04x?=
 =?utf-8?B?d0lsM0VHNVA0cWpIQmJQQkdBUmJNMFovdHZYSjF0dmZIY1kxVGJSQUZISndm?=
 =?utf-8?B?UTNUZEdLTllMRGppSGc1bW1MUW1CMnE0M1l3ZTZ3N1pPRnhYcnhoSXQ0bEZS?=
 =?utf-8?B?LzNuTis2YU5ITTltQTh2T2dXNTZpTk1NNU5YV2F3Q2w5NFpIY2lERERqL2oz?=
 =?utf-8?B?b2p3VnRrNnl4OXN5VVMrS3l4U09XS2ZXNVB5V1hNT1IyK3AyZU1iR0w3NjFQ?=
 =?utf-8?B?KzM1aWFYUkVkejFBQnlZWWJiUGw4NnJ1OHdnbG5xVzBrL2dXbEdXNDgxdDlZ?=
 =?utf-8?B?by9WSDM0bUFwWHk3Z1FhcnRVUUxqeVJOcGp4eVZCTjQxM3hVdjYvYXpmVWl1?=
 =?utf-8?B?Sm82RVJYT1FqTVNWcTY2T1Z1di8ydW1QQzZMS1lRUjJFUEVsU2ZlT1ZOajh2?=
 =?utf-8?B?VUo2MnE4SUozUUJQWUtnZDFLVXAya3g2cElobnhCVGlKQ0hCRmNoSVpHVjJE?=
 =?utf-8?B?MUsxZ1BLeWpYYnZKQmhoYlltaklGdExKVVl5aWV4T0xoTHhhODlwc3hjdUt4?=
 =?utf-8?B?bzRnZUV0ZkN2QlJWUlJETjdJUzlDa1lZYWJjSHZtNGVFeXcwTTlqNzllUGVD?=
 =?utf-8?B?QnRDUjQ4cVJINHJMVVRmNXFHUmJWZzBQZ0tUNjM2cXFKZGdYMVl2Ym9QMndW?=
 =?utf-8?B?Q2RsSkltSko2amlVWkhCWTNkZk9PRmZ0Rno2WDBmNmVqc3p0Z1ZEc1FVVjZT?=
 =?utf-8?B?TlMxOXAzSTdiWDAvYWd2d21jQ0VwaTNNZmp6dHBFTVpvdkpDSUY1VzBlRHVm?=
 =?utf-8?Q?sWsU0a7B3i3nw5css1ltikgyVpkbDKj0SO455skyoUqA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B95066CEA78854A9D254F141F6AD74F@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aad52744-d560-4581-789e-08dbe049f8ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2023 11:00:51.6374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U+e7lywS38uOUxdVBGaPWhNttuYbfXbDCLq9bdgcMl6K12L6IhW14fefWGzm2vcduflvYCZZihDXQujYesEzfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4913
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 11:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106473

T24gV2VkLCAyMDIzLTExLTA4IGF0IDExOjQ3ICswMTAwLCBKw7ZyZyBTb21tZXIgd3JvdGU6DQo+
IE9uIDA3LjExLjIzIDIxOjI0LCBKb2FraW0gVGplcm5sdW5kIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIHdyb3RlOg0KPiA+IEluIC9ldGMvcGFzc3dkIGlzIGEgc3ltbGluaywgc2VkIC1pIG9u
IHNhbWUgZmlsZSB3aWxsIHJlcGxhY2UgdGhlDQo+IA0KPiBJIHN1c3BlY3QgdGhlIMK7SW7CqyBz
aG91bGQgYmUgYW4gwrtJZsKrDQoNClllcyA6KQ0KDQo+IA0KPiA+IHN5bWxpbmsgd2l0aCBhIG5l
dyBmaWxlLiBQcmV2ZW50IHRoYXQgYnkgZXhwYW5kaW5nIHRoZSBmaWxlIHdpdGggcmVhbHBhdGgN
Cj4gPiBiZWZvcmUgZ2l2aW5nIGl0IHRvIHNlZC4NCj4gDQo+IFVzaW5nIGBzZWQgLWlgIGNvdWxk
IGJlIHVzZWQgaW4gbWFueSBwbGFjZXM7IGUuZy4gL2V0Yy9ob3N0cy4gTWF5YmUgdGhlDQoNClll
cywgdGhlcmUgYXJlIG1vcmUgcGxhY2VzIGJ1dCBJIGRvbid0IGludGVuZCB0byBmaXggdGhlbSBh
bGwgaGVyZS4NCg0KPiByZXBsYWNlbWVudCB3aXRoIGEgc3ltbGluayBzaG91bGQgaGFwcGVuIGFm
dGVyIGFsbCBvdGhlciBzY3JpcHRzIGFyZQ0KPiBkb25lLiBXb3VsZCB0aGlzIGJlIHBvc3NpYmxl
Pw0KDQpJIGRvbid0IHNlZSBob3csIHRoZSBzeW1saW5rIG5lZWRzIHRvIGJlIGluIHBsYWNlIHdo
ZW4gYnVpbGRpbmcgcGtncyBhZGRpbmcgdXNlcnMvZ3JvdXBzIGV0Yy4NCg0KQW55aG93LCBJIGhh
dmUgcmVkaXJlY3RlZCB0aGlzIHRvIG9lLWNvcmUgYXMgaW5zdHJ1Y3RlZCwgcGxlYXNlIG1vdmUg
ZnVyaGVyIGNvbW1lbnRzIHRoZXJlLg0KDQogIEpvYWtpbQ0K

