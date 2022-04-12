Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02BECC38A2B
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:40 +0000 (UTC)
Received: from esa14.fujitsucc.c3s2.iphmx.com (esa14.fujitsucc.c3s2.iphmx.com
 [68.232.156.101])
 by mx.groups.io with SMTP id smtpd.web10.5463.1649725664052359929
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 18:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=X5FaeeMw;
 spf=pass (domain: fujitsu.com, ip: 68.232.156.101,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1649725665; x=1681261665;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=6sxj2okl03r+mPVe9VstZiXD+AfHgeEIjeaOsBSEfxg=;
  b=X5FaeeMwo+i9oHuMR22RRY9h0ObCeClIYrf+vxXkGqaC7cVQkiJp6ZlM
   dkU0wjsX4lbpsLPiBIwKaiBg0cBEEazlekhy6Z0vDFMYm87gJd7p6GpRG
   aA9yTjDwDJMrbCmIexBZvGUs2Tuv0H+IW0ZeXNMs5EE+a/Wx9It2GAggg
   LWHRABH8OpqhkCh+qYcVleBjVvsAoWN9maHXjrKm8ytVDmjJwLu5FzrzM
   EnClPF9nMY/7Gdq2mMclPHxUE6WvN8+gMorUwkWySzo+n87dyQcdChQF7
   Gxn3tSAqLLokI96km/pegO+DScbPb4ADZ3dYoax6IhfETjwgeKnMFnR24
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="53543594"
X-IronPort-AV: E=Sophos;i="5.90,252,1643641200";
   d="scan'208";a="53543594"
Received: from mail-os0jpn01lp2106.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.106])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 10:07:40 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+Rq5ICFP7YOeVk1HBmlbGfY3+Txb+mPT+RpzoKfZVxnD9s9EHGChHOR9luI75QmeG1eWTxNBhDvHV6fnm4yvlII0F+3S76+krhjb7uhZrQw+DrmlIkT4T2Am95J2hkLEYQoNbfMjNE6VZiPHcI0huhATVSVYTsf1f9qM9HPYiAAXRBFDYShv29Kn6uSFVwv4jNWV2C6P9/ME6Tw2fspVAQWzuBCpYMwueQe7N1vvvJlFtykzqvPZh/OfgVUnevbFQjeWhfG3EHNyPd0dgPYIiFVZJ6+jy9RwDJP1G++vRP8/x2573vcZhhee8ggtwGvgVzbyExjkw5eSJkqAY6pjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6sxj2okl03r+mPVe9VstZiXD+AfHgeEIjeaOsBSEfxg=;
 b=BaMroNMF6kwKrmwFzAzwtBZQfp5NCjL+r2KNQ0iLTe6LnMfB5usx9x+H4Uaj8wofOeZy5Fe0yoxXgaiEq7f372B20D2uGT8JLCvy7nKKvHa/cqNBKfqwmUqJ1P2Rb6rgT4s4rHqgpLb7OZj/r4Li463S6cAd+UYAmSXpqD0J+ScmrrsebC/BUoUucmVKTwFOYacjJqWRWE7isYYCma9umSgSrKu+07Nb2a/YEb1XFhoel4A0e/ssZjAcaObXUEPmu08LRQdteNRREfF4wEtpxI8AlD7uCPcV5BDMrhiQ2Mjrj2XzeCNM3sGImk+WyVbOqxPwcuAHFEqBnu/2GZ9PlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6sxj2okl03r+mPVe9VstZiXD+AfHgeEIjeaOsBSEfxg=;
 b=OWeQjcB0W6Y/sTwd+H8mySjKl2yI5Wd3IPYZyHorBRjG+ATQB64ez7JZ5LOSZCsjgVkX8Yli8j3fvHi9vIFxVqSowfNoaKTJqWL3YozLtNZk17/yo/M9K1N9LQ7VGl/c4KPsShriqN2SkDrTwSZsx/+SUXNhidoUqKCZ0vEYdaE=
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by OS0PR01MB5746.jpnprd01.prod.outlook.com (2603:1096:604:be::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.30; Tue, 12 Apr
 2022 01:07:37 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::b8ca:d7c2:54cb:348a]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::b8ca:d7c2:54cb:348a%4]) with mapi id 15.20.5144.030; Tue, 12 Apr 2022
 01:07:37 +0000
From: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe] [PATCH] byacc: upgrade 20211224 -> 20220128
Thread-Topic: [oe] [meta-oe] [PATCH] byacc: upgrade 20211224 -> 20220128
Thread-Index: AQHYTWw2bahfHHT2CUiuXFK2mVw/8qzq3VoAgACae8A=
Date: Tue, 12 Apr 2022 01:07:37 +0000
Message-ID: 
 <OSBPR01MB184564889C1BC259A145753EDCED9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1649423791-29819-1-git-send-email-wangmy@fujitsu.com>
 <1649423791-29819-2-git-send-email-wangmy@fujitsu.com>
 <7080173b-b85f-b0d0-237e-54e7e37cd30f@gmail.com>
In-Reply-To: <7080173b-b85f-b0d0-237e-54e7e37cd30f@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d60a9e53-3f74-4e1d-089e-08da1c20d57d
x-ms-traffictypediagnostic: OS0PR01MB5746:EE_
x-microsoft-antispam-prvs: 
 <OS0PR01MB5746AEB414017495A3E820ABDCED9@OS0PR01MB5746.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rM+6U5+Irhq5AkIW37QMygWCdjuKRcPRUF0HOI5TcR4wwP/Uk5x8FE7j0fvLAqJNX9bWEtbu5g9WHcyP//9LLgBiD0X7TQZH3X9WKBIXT3W5SDGetWdq0mfQ9L7l5NebyoYAfjFUW8zxSsoXlcGrxTd78uaCgpSCCaCcTp93bNpaFvflqgAgz9svzersu4flKymvHqcO8LtDQSsIXqLEa63CkXxod2JXBbSsjU9s7tV57f7o9zqYNDQruBLeMQZz2l0JMTomR9PDvA+2ROb/yuulRBk+zynv7trc7Cwl3/8riwyXb0ftGRYlDAm/qq6CllAt7PvnVzbjLUBtGHWoIVBtXtTywWpGy7/vHud2s2F3Lo/YWcpFsmxkt0ocDZm0OIEIap2WpQAyKHLvxu4VbpgAmlsGUGo1/KWtShIF84RFdq9BkW6k9ybQe7xlclglq5HwfR6RL6LcUdwxXXoP1GC4LWhQe1YmIE846FSEU855vs3P4BbpKeVLwOZ3ndIeuC6eqX6x4exyFyoUfCxa+jC4hgMfOIjlo3fhkcq8uu8vz0IuzcgEEQo3W2x6tyVgNiF6DivfH0kqAt4wTpNV/60vmBnAAenR7RYbZxGR6DRwd2Co0IjtG6t2+XUS84Kyl1Gd4Td/DNCBb/h5mCqnMx/qe+N462PX6c7Ql11CGa9Xw+ZV/0BBgTN+Re0uQSd+E5Lba+ZvM/msU5Bh9NDUxyReSzn8EJPNH2EbKCNOYD5OgEmk1ec8owzqz2dQhhHuFoTdPRVOLl1tDOaycFJdLzzJG1Lxt29wf0BCYIsfqq8EBFiIuGPn7YSU3WN+4hu5HUWi0X6IL9Pp/ZqKhAgU/g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(110136005)(316002)(82960400001)(26005)(122000001)(52536014)(85182001)(2906002)(8936002)(6506007)(66556008)(66946007)(55016003)(186003)(64756008)(66476007)(9686003)(76116006)(83380400001)(33656002)(5660300002)(66446008)(508600001)(38100700002)(966005)(38070700005)(8676002)(7696005)(53546011)(71200400001)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UEFrdHNReXFjYkVzUGthU3lIaXdXUlh5Ym5id3lJckVoRnlKclY0SWVXQWJL?=
 =?utf-8?B?K3dNSlVxU1Fudm80SG5ZcEhqSDNMSmZMVlNUT3VCakhBSzZFZFA3Q0gvVGdF?=
 =?utf-8?B?TWxIUnM5dWhQSml3VGNCZFd0YURIWWdVYmpKQjZ3RE91cHVWQlZINlAyMHV6?=
 =?utf-8?B?TEFIb2NWNW5icUxCWkxER0FwS081MzFBRUUzWWdWZjE1L2F1dWgwZWF0RlZh?=
 =?utf-8?B?WkFaRGhDbzlmeEZYOEd1N2hpT2V5dW91VnNwYktuZmt1cjNZaXZRNWZYb1VG?=
 =?utf-8?B?TVBKVlVDTkRZMGFrZ2ZoemlPREJrNUVVdVVhNGhKZ1pRbmRLanFtWkpnZkNN?=
 =?utf-8?B?eGlYY0RhWWZreWRQNEIvdnlJc1h4QkN0Y3c5NS9paU43NklqZWU4QTJVL2xi?=
 =?utf-8?B?L095OEI3UVMyb21ZQVFuMk1BbUhKVDNONUxrYWpCcEpzM3VScmJlZHZWdGV6?=
 =?utf-8?B?QjVaUzl4VDJWd0dicEc0b0ExOTdETkZFY1pBczJ1ZGtEUDJKM3kwcFJ5aTJU?=
 =?utf-8?B?ejB4WWJiK0o4R2VlL1BObFNXR2gyRXp4UXRFVkh3UWNlRlZ4WjhtTWRyRHI3?=
 =?utf-8?B?MStlR0dSRVFicTNnUkRlRmEra1lFckQ5MyszN3dDWjNTK080Z2h2NWY5SkdI?=
 =?utf-8?B?T1BjYTlOYnNzUFdxcmtQdWd3MmNrMkxxMjlzZVZ0S1JTdkdyVzRwUEZQNlEr?=
 =?utf-8?B?SEgyM2NmeUs4WGo0Y2VzL2d0Y3JDOGR2NWtVeXI5dGVkZWlsM0U5YmJRdktW?=
 =?utf-8?B?NmdOeUNDaTVMbGlqSnJhTk9FeDJzZC9xRlNuVnVacTN0TUJ4cTVobXhsTkNL?=
 =?utf-8?B?aUhDNDkwTURYNnNSQU1KRUcwdnFhZFk2Q2srYm43TVpuK29qNnVDV0pZRGFj?=
 =?utf-8?B?ME04VXFObmcrZHRJUzNrR1FJWE9UaUU2SEc3ZktxaGJTQkNTTFFpNE9EdXdR?=
 =?utf-8?B?UUo1UEkrTk1MVDRzeUFzWmp1UXlISzRoZE8yM1ByNHNITWM3Qm16TFIyOHBL?=
 =?utf-8?B?UmhYL2I2TnY5ZlpYbE9XSTVyS2NqSmdjc2g0akVqSzFlOFdUcldJVWY5Qk54?=
 =?utf-8?B?emxXUks3OFl6MEhNb1drUVdTWExQakFyWmJ1MzBjYmFDZWcybVVnNmFsVFZx?=
 =?utf-8?B?Y1l3a2FwMUF5NzJybkduSURaYWlhQXE5ZDVDcHNuZlcvcms5czVxcEN2K3M2?=
 =?utf-8?B?MHJwOE9QU1hTTC9MSGY2WExtWm94WnBrb2VyTkpvOW5xTnp3b3VYU01sMldU?=
 =?utf-8?B?ciswcUEveit6dzM5R2U0K3BCSkhBaDhJUVNmRFFCRVFjWFdmY2E0ZWR3Mk8v?=
 =?utf-8?B?MEFNckJmdEpIbXBZL2JCTDlPam5HdnMyR29jeU9LZTRVTkhvQXp6K0xjRHkw?=
 =?utf-8?B?NVJBVDZTTUFUSytHdUdEUk9nNmlXdHUveVRneEdvazBaaStuUUgxVVB3THIr?=
 =?utf-8?B?a2dLVnQ4U2xuWWJ3UnpNQklzTjloTk84ZkxVeERKQ3MrcGwvV01zbjNub1pF?=
 =?utf-8?B?a0xPQWtRSVk3cFJMbEhzcGN5bElGa1JubzdnS0RZY0tLbURodG55ME5aQ3lT?=
 =?utf-8?B?VkpNUlZFMDhxYW1pb3RYbU1xYWFOZDJOUHFTYnBsTHFLQWtEL1U5VGQzVHVI?=
 =?utf-8?B?VHM4OFFjNWdKRERiaDJPVFI4NDZ1eWhPZUdGRUs5cEtXc3F2eGhDcDR6LzFC?=
 =?utf-8?B?djV0R0JXV2tNekhSSEx4T21xWGcvMzdLNCtBVVZzZDd5MUtTR0dxRi9HVU5k?=
 =?utf-8?B?TEdEWXRLTjAzQ3VKaFJCaEdnSkZIMXhQazRzcEtDc1BXSENNUzU4d20wVW5B?=
 =?utf-8?B?UHNONHFXcFBRTXVZS3JmREMzeVlDeExtV1NwVXRJcy9PYmVDK0lqaGdEdjVB?=
 =?utf-8?B?bjZLR3pxajYxekdxOUhLYmNpbjlxakhZSWVyZnVvNEF4OHhhVXBiRnRwOW43?=
 =?utf-8?B?eDRINWwydDR0bTFDYUZiOXhJM2wydnBLSitiMFdZRm9iYWFTNXdjQVNEM29D?=
 =?utf-8?B?YTVZNUxucE15T2k3cWg1UHZ6RExTekhvVDliOTVHcEFINGhCWWx3eC84ZmFr?=
 =?utf-8?B?Wm4rL1hMTkNmNStCN3RxcjZHL3Fnc1RjMUY3Q3k5YUoybWJXclYrcXhTMkw2?=
 =?utf-8?B?VXdoR2NQOUNLdUxsSTBwZE1rdUtsOTd4Mnowdk0rTmQ5QThQa1RzdEU5OFhZ?=
 =?utf-8?B?NFlBbnFyRC90VHVxVWlucFdWTTRBQkcwWDQ3eHp5VGM2TXdFS0doSHMyUUpk?=
 =?utf-8?B?ZnozK3lJRWFscWkxTlRSbU42bjlQSGg5OXJrcmFIcGtwS0t5cGcyR3Q3UXFT?=
 =?utf-8?B?RXUrLzZRbk1BMWxHUkhvcXJXek10aEJMOEY5VVFDaEZuQ1p0RElRUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d60a9e53-3f74-4e1d-089e-08da1c20d57d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2022 01:07:37.1681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 /Y+bGkjiyjzR9k8mRwc5n2sEo8GJ6t4s412msvPWfVaIVbYRRaPqL/GQ5WANvc4uEOQIQjPwbXx01eGnmSmK7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5746
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96558

QWZ0ZXIgY2hlY2tpbmcsIGl0IGlzIGZvdW5kIHRoYXQgbGljZW5zZSBpcyBzdGlsbCBQdWJsaWMt
ZG9tYWluLiANClNob3VsZCB3ZSBjaGFuZ2UgZmlsZSBvZiBMSUNfRklMRVNfQ0hLU1VNIHRvIExJ
Q0VOU0U/DQoNCsKgIC0tDQpCZXN0IFJlZ2FyZHMNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KV2FuZyBNaW5neXUNCkRldmVsb3BtZW50IERlcHQu
SQ0KTmFuamluZyBGdWppdHN1IE5hbmRhIFNvZnR3YXJlIFRlY2guIENvLiwgTHRkLihGTlNUKSBO
by4gNiBXZW56aHUgUm9hZCwgTmFuamluZywgMjEwMDEyLCBDaGluYQ0KVEVMOiArODYrMjUtODY2
MzA1NjYtODU2OA0KQ09JTlM6IDc5OTg4NTQ4DQpGQVg6ICs4NisyNS04MzMxNzY4NQ0KTUFJTDog
d2FuZ215QGZ1aml0c3UuY29tDQpodHRwOi8vd3d3LmZ1aml0c3UuY29tL2NuL2Zuc3QvDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdt
YWlsLmNvbT4NCj4gU2VudDogTW9uZGF5LCBBcHJpbCAxMSwgMjAyMiAxMTo1MiBQTQ0KPiBUbzog
V2FuZywgTWluZ3l1L+eOiyDpuKPnkZwgPHdhbmdteUBmdWppdHN1LmNvbT47DQo+IG9wZW5lbWJl
ZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbb2VdIFtt
ZXRhLW9lXSBbUEFUQ0hdIGJ5YWNjOiB1cGdyYWRlIDIwMjExMjI0IC0+IDIwMjIwMTI4DQo+IA0K
PiANCj4gDQo+IE9uIDQvOC8yMiA2OjE2IEFNLCB3YW5nbXkgd3JvdGU6DQo+ID4gQWxsIGNoYW5n
ZXMgZnJvbSAyMDIxMTIyNCB0byAyMDIyMDEyOCBpbmNsdWRlZCBpbg0KPiA+IGh0dHBzOi8vaW52
aXNpYmxlLWlzbGFuZC5uZXQvYnlhY2MvQ0hBTkdFUy5odG1sDQo+ID4NCj4gPiBMaWNlbnNlLVVw
ZGF0ZToNCj4gPiAtLS0tLS0tLS0tLS0tLS0tDQo+ID4gLSBBZGQgRm9ybWF0LCBVcHN0cmVhbS1O
YW1lLCBVcHN0cmVhbS1Db250YWN0IHRvIGJ5YWNjLg0KPiA+IC0gQWRkICJDb3B5cmlnaHQ6ICAy
MDAxLTIwMjEsMjAyMiBieSBUaG9tYXMgRS4gRGlja2V5IiB0byBhbGwgZmlsZXMgb2YNCj4gPiAg
ICBieWFjYy4NCj4gPiAtIENvcHlyaWdodCBvZiBhY2xvY2FsLm00IGFuZCBwYWNrYWdlL2RlYmlh
bi8qIHVwZGF0ZWQgdG8gMjAyMi4NCj4gPiAtIE1vZGlmeSBMaWNlbmNlIHRvIExpY2Vuc2UuDQo+
ID4gLSBBZGQgIkNvcHlyaWdodDogMTk5Mi0yMDIxIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwg
SW5jLiIgYW5kICJMaWNlbnNlOg0KPiBHUEwtMyINCj4gPiAgICB0byBjb25maWcuZ3Vlc3MgY29u
ZmlnLnN1Yg0KPiANCj4gSXMgdGhlIG92ZXJhbGwgbGljZW5zZSBzdGlsbCAnUEQnIGFmdGVyIGFs
bCB0aGVzZSBjaGFuZ2VzPyBDYW4geW91IGNoZWNrDQo+IA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogV2FuZyBNaW5neXUgPHdhbmdteUBmdWppdHN1LmNvbT4NCj4gPiAtLS0NCj4gPiAgIC4uLi9i
eWFjYy97YnlhY2NfMjAyMTEyMjQuYmIgPT4gYnlhY2NfMjAyMjAxMjguYmJ9ICAgICAgICAgICAg
fCA0DQo+ICsrLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pDQo+ID4gICByZW5hbWUgbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL2J5YWNjL3ti
eWFjY18yMDIxMTIyNC5iYiA9Pg0KPiA+IGJ5YWNjXzIwMjIwMTI4LmJifSAoNjUlKQ0KPiA+DQo+
ID4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9ieWFjYy9ieWFjY18yMDIx
MTIyNC5iYg0KPiA+IGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL2J5YWNjL2J5YWNjXzIwMjIw
MTI4LmJiDQo+ID4gc2ltaWxhcml0eSBpbmRleCA2NSUNCj4gPiByZW5hbWUgZnJvbSBtZXRhLW9l
L3JlY2lwZXMtZXh0ZW5kZWQvYnlhY2MvYnlhY2NfMjAyMTEyMjQuYmINCj4gPiByZW5hbWUgdG8g
bWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL2J5YWNjL2J5YWNjXzIwMjIwMTI4LmJiDQo+ID4gaW5k
ZXggODVlNTA3MjcxNi4uOGFhODc2N2QzNyAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhLW9lL3JlY2lw
ZXMtZXh0ZW5kZWQvYnlhY2MvYnlhY2NfMjAyMTEyMjQuYmINCj4gPiArKysgYi9tZXRhLW9lL3Jl
Y2lwZXMtZXh0ZW5kZWQvYnlhY2MvYnlhY2NfMjAyMjAxMjguYmINCj4gPiBAQCAtNCw3ICs0LDcg
QEANCj4gPiAgICMgU2V0dGluZyB0byBQRCBhcyB0aGlzIGlzIHdoYXQgdGhlIHVwc3RyZWFtIGhh
cyBpdCBhcy4NCj4gPg0KPiA+ICAgTElDRU5TRSA9ICJQRCINCj4gPiAtTElDX0ZJTEVTX0NIS1NV
TSA9DQo+ICJmaWxlOi8vcGFja2FnZS9kZWJpYW4vY29weXJpZ2h0O21kNT1lMTNkZDMyNjYzZTMx
NTkwMzE2MDhkNTM2NTMwYTA4DQo+IDAiDQo+ID4gK0xJQ19GSUxFU19DSEtTVU0gPQ0KPiAiZmls
ZTovL3BhY2thZ2UvZGViaWFuL2NvcHlyaWdodDttZDU9NjJjMzdhMTBhMmZhZjkwMjM1ZWU2NDI4
MGFkNzI3MzcNCj4gIg0KPiA+ICAgcmVxdWlyZSBieWFjYy5pbmMNCj4gPg0KPiA+IC1TUkNfVVJJ
W3NoYTI1NnN1bV0gPQ0KPiAiN2JjNDI4NjdhMDk1ZGYyMTg5NjE4YjY0NDk3MDE2Mjk4ODE4ZTg4
ZTUxM2ZjYTc5MmNiNWFkYzlhNjhlYmZiOA0KPiAiDQo+ID4gK1NSQ19VUklbc2hhMjU2c3VtXSA9
DQo+ICI0MmMxODA1Y2M1MjkzMTRlNmE3NjMyNmZlMWIzM2U4MGM3MDg2MmE0NGIwMTQ3NGRhMzYy
ZTJmN2RiMmQ3NDkNCj4gYyINCj4gPg0KPiA+DQo+ID4NCj4gPiAtPS09LT0tPS09LT0tPS09LT0t
PS09LQ0KPiA+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdy
b3VwLg0KPiA+IFZpZXcvUmVwbHkgT25saW5lICgjOTY1NDQpOg0KPiA+IGh0dHBzOi8vbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC9tZXNzYWdlLzk2NTQ0DQo+ID4g
TXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvOTAzODk1
MTMvMTk5NzkxNA0KPiA+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJlOg0KPiBodHRwczovL2xpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvdW5zdWINCj4gPiBbcmFqLmtoZW1A
Z21haWwuY29tXQ0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4NCg==

