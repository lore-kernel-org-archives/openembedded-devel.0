Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17148C7EE22
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 08:14:41 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (APC01-TYZ-obe.outbound.protection.outlook.com [40.107.117.60])
 by mx.groups.io with SMTP id smtpd.web11.83218.1684138469689324400
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 May 2023 01:14:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=R2ApSpSN;
 spf=pass (domain: advantech.cz, ip: 40.107.117.60, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUZzMOBPaEfQdA9zeT/DZU2qlne2dmQfwcmtYjKO4vZZkRnDF3CDsUOfrPW86fnErQPwzbHAmz1FhP7TEV+fF3dazIo9Q+7DL0CwjJe01F9vy3akT/+AJiXjRKjr7opR/BbwPgKluvUwCWlL2rMKL5ceCZGGQkImHDdbf/EZI9c2Gm84JtbtGmCuoAcekZjJdMlHJLKY7qN0sWZ6iCyq8II6NHabHKHgUtAnfvIlCl1AwEMZszkqHnPiq0hYhuRH/qkXsPAQwV5jt1FB4VvDTtrvShXz0tcBeqiCyexKfnZqfdz3k9bNOBf8iozX6W/pAR9V/8kJChVEWbHwCdHEmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x37f4E+2+WLT6zeCKCa30gJ+vVDo4TMFkAOnTMejtSE=;
 b=Mcy8lqnRyuB2L7tKt4Ea6Ae6ENvBcpU2229eHGg8TIKn5mp2CCCJoCh3L/BNdKlalARNYN9AP+nXOr4uzkfU1PKjtAF4kc/CvsgS1Hv+A/OTnX6z6aoaDdT7UTe6ET6ntkk+5diUME8FCoxoj7RHu0SevsZrBO/zqQ36sRFzXdn3UZTWXO6t0tXJE+NHXtflPqWkwrUiOKBFa/fuH87fxpoTFAoqhjed9XAfjHXQ+JAA2hU6LZNo8DLITZfHv2zjW2GpR6tI85YGtcotRJ4/PNE0KAaxnlRbX77qkVs73zRQBtoebwO+MATTYb7EHuu09klHLX/uaajgzTM5zXPwnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x37f4E+2+WLT6zeCKCa30gJ+vVDo4TMFkAOnTMejtSE=;
 b=R2ApSpSNdKN3F6vV4o/J6pcDdJZ14JehqPBmsiRQxzV4t2GsuAdTP9h0UOuO1chicmS7n5yauDvuLGzzMVHCU/4PEevYqG45CxhoMxjtANsHgf3QQVH2O4Qd+rN0F0iC3+u6jEySsYju2qYAgkTI2AgM5jjA3inUMI2YM8VFcTgLb6jkswVEOuBZ3t1bPH2pHj55on59Bxl+KuVYZtjF2onI+CmODMT9ve7sekVqBCrgLJLcwHW4r+i5suBxnCt5UNKYsQ9PB/YSyqjKW3QJyHyB/fyWZMA469uChlESG65R7tYI+tIyKDrFfMP3IfUWGjhcWBu5CF9NiY7RKOui1w==
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com (2603:1096:404:b7::12)
 by SEZPR02MB5805.apcprd02.prod.outlook.com (2603:1096:101:49::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.12; Mon, 15 May
 2023 08:14:25 +0000
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::3e74:b6f0:fad1:4598]) by TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::3e74:b6f0:fad1:4598%5]) with mapi id 15.20.6411.014; Mon, 15 May 2023
 08:14:25 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH v2] networkmanager-openconnect: add new
 recipe
Thread-Topic: [meta-networking][PATCH v2] networkmanager-openconnect: add new
 recipe
Thread-Index: AdmHBQHgFIDMAVEpTp6VfsHiUqh35g==
Date: Mon, 15 May 2023 08:14:25 +0000
Message-ID: 
 <TY2PR02MB367837F139614C961F7093B881789@TY2PR02MB3678.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR02MB3678:EE_|SEZPR02MB5805:EE_
x-ms-office365-filtering-correlation-id: c550149c-7cb3-4645-eada-08db551c6595
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hygErkuiDBnbH0aPFivMEcPcsLi0N4nrIy7K7c2WpGoDnCTEQVvqu6UApIfLkbU1tzhA0Ut4bdbTO5GXigBXyCeh3Y42e7w7rKI6TweeZrmbSgjMEgwuLwt+FwVbFaN+C8p2rTZFvGZQjXhj+v84D8FQSKQIBNlqcCd4K67eajWZv+Y6LVfviLbhtqHKMzM2R0WLjj2IhDAa51uT7cGEk66e/Fgu+5NikMXEwn+nuFVShzmXwrzds3y/o8hTrZdRI3H8KYh19wZIK2728hENHJf4gyp7xZKRwzd27p4dNlRDg8m2Wl52ir6vOulePny4LL0FxCbuMBfLCJ5tTy0V/46NQxBq9EnFqETtNMcBGubs7ZoUtykedAm3AMKRqQzMHpzDkHjD0y6e8uGuTQsKd34Ewy+nQbBc+vbv/vHAoNOi+6TJ9D530LFsjVQW/KtdPKZKJIllspe3oJzAOPf/bPDnzbGeitNTbb4O/e3HUikMsqSNQ1IsYFkmSh+9cQDkZr2LhQQvOcZgtWoMr39Jn7kJFMR2/gjfGqeawHPugzAhn2voZAgrqzEiXMnzVX3iQcIBm9690JD63TfoXtnAugQwVPj1nfJv7CYas5fGEhU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR02MB3678.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(451199021)(64756008)(66476007)(66556008)(66946007)(66446008)(76116006)(55016003)(9686003)(26005)(6506007)(966005)(7696005)(478600001)(71200400001)(186003)(44832011)(52536014)(5660300002)(86362001)(8676002)(8936002)(2906002)(33656002)(41300700001)(38070700005)(6916009)(316002)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OFJDVk5TcHRFMVpkdUVFRWZsU2dpSlZjQVVjcmZvY0x4VDl5MUkwVGt1YlpK?=
 =?utf-8?B?L0NBZml5U3dIZ2U0WVpYNjVnbzRreGR3YXVSdTBCR1c1RGkwL2wrdURxT2V3?=
 =?utf-8?B?czRpVCswZXp2YlNXNHZhdWt1OTRiV2xyQnlBVVlhUW16d0h6N0hVRko0N0F5?=
 =?utf-8?B?MEx0MTQ1SHFmN3IzSmdJUFB0VEFWMEhScURQb2l1Qm5KcFNEeHRWNUY3RTBK?=
 =?utf-8?B?R3FHZm9jVUpScWdnK2hEejJQV3VpUzJtWEFVZS9RNkZIN3RlRGdJeVR2Q2kz?=
 =?utf-8?B?eStOZzArQWI5OXNQVFNmYlJNV0JzaFdGU3lnRUhPRDBUOGU5RHlRb0Y1Q2du?=
 =?utf-8?B?aTN1N0IrZjA4dGxCbUVIYmtVdGV3UVpTRDlma2VNZVpIUmtTeXZlY3RxM3pr?=
 =?utf-8?B?ODE2YU5sRlhJMWtEZFdVT2ZuUFdlT1hOakZaZ0ZNM0txSVJaMXB4ZlhhOGtv?=
 =?utf-8?B?ODE5K2UrOUJ2Rm9NSW1vS1dPM2xNK2RsZkhKQUJ5TUFJM2tLclNlTlo4d3g3?=
 =?utf-8?B?T1lLN25RdHRvWktacXJBcXBKR1lXRVR4VjMrUDJKdUVqYm12TjQzZGViTnMr?=
 =?utf-8?B?TUtyandBYTJUb3FxUjVHRDBXaXd1b1BBVm9zNUhreTNlWmpraEFKWUZKM1Jt?=
 =?utf-8?B?cXl5K0UzZDJoenV5ZXprTEd4NHlWbkR0eDJIKzZVTFpMdmRnejFOc21TRFlO?=
 =?utf-8?B?a244bjFzNXBMdng1bGZmazdvNWJDdlFEMnpGQ0VlaHFNcHlITXFEQTFaMzBy?=
 =?utf-8?B?R3pGejlNRnM0MitsZzd1NFBPc0RManZTWjRwOFNkWGxEekxxd2ppald2Unl0?=
 =?utf-8?B?RGhRQkdBYkJoZnVBbG9TZWpla0FBbUVCaEtuRnZlblNHRXdnakVkTVB1ZHVm?=
 =?utf-8?B?aUdtLzJzejlneEkwNHJCSkZtTlNESEFqbjNIMk00V2NFaVBHcnRMY0tqZDR3?=
 =?utf-8?B?cHhYZE5iajZGdXlkVTVDMFlxY0xnTlVYYzI3U2FVUDA1aE1kaU9wNzJKZlJ0?=
 =?utf-8?B?VE15ak94RjNqSzkyck1SZmtVcGJOZW5OWkc0ZkxHRVFnMFFCZEdnME9VZDV3?=
 =?utf-8?B?bkQ0T3hMYkU1WEMyQ3dPbmUvUXNTL2hVcWc3c3BHSVEzc3N3MjFzQnF3d2gv?=
 =?utf-8?B?Y1VKM2FiWHhBU2VoYmNrRXlhZ09wK0g5dGd1WHJjTXYzekdCc296dnI0ZFRF?=
 =?utf-8?B?Y2Z4L3Z6U2thSlNhcHJqSElnM2YzODljUTJuYjhLbC9vVUI1eFFQU3ZId2F1?=
 =?utf-8?B?TVgxaFIxV2VrRWZHajZtSW1DVVdIYlBNbkZINVZjcGh3b2VSREFoWWVZTEc4?=
 =?utf-8?B?bXpyQzJEbmFkR1B2S21wZ0o2UXNUMWVoYTFpWkIxRzlla3ZFVi90cFNmTkpW?=
 =?utf-8?B?a3ZGbEczWlhhT2RReW40YlA5amY5V0I3NzY3VmtzK2RmTGQxLysxMUo4dWNh?=
 =?utf-8?B?bjMyNEM3NC9uTHQ4aDZTUkhwM3NTMDBxNWcydiswQnRDK2dIQ2hWZmpkb3Nv?=
 =?utf-8?B?QVZMYk1WbHJTL25RYjFaS2RwYXd6dWVxc3B0SnE1dUsrdTE1d05xU29mU3Qr?=
 =?utf-8?B?a2l2NXlWbWFkNStjVjRMRUI0TDAzQVM0RVlLemhrN1FoVGlTc3pJNnQwZDNS?=
 =?utf-8?B?MFF3cTJYYUJ2bVltUUFtc3RKNFgvbWJFRXNZbTEvcWpXa2crdWxMUHNnUTNk?=
 =?utf-8?B?Snc4QjhNVHkyS0d4STFqS1hhK2xoQ3dEdGROWGthdUFQaWZDSlZtN0tacmN5?=
 =?utf-8?B?Q25VQXhEMEx5YWdwbi9QclNHWHVocGdQODRuTExEeHlFUm5zLy84d2hnSlp0?=
 =?utf-8?B?YmxUTVkrTWtLUEYxdWF6b1lOWUg2Z000YWg1SWNjTGhmS3B2cit6Q0I0Ykh1?=
 =?utf-8?B?NWNFbzF1WWdHa2d5eWEwOUhQL0RacDJpU3RNaStuL3QrTkpEeEI4cTcxZG9E?=
 =?utf-8?B?ajFLc0RPc3pZa1NIUmR1Y1d4M3lBenhiaEE4aGNUTk9EZzdidXhMK3VwNDdB?=
 =?utf-8?B?RVJ3K2w0OVdaZHplNXkzQ3lMYzR3bHRLVTBCNGtHaHdJempMMzd4TmpySmx1?=
 =?utf-8?B?dUg0b3JYQU9qYVB3VzRCSFRpV0REbng2aGE3K1orUUUwMjh4bDlEWkFYVmxB?=
 =?utf-8?B?Sm1YTWZkVWZZZzhkNk5ubTl2TlJXM0dMZmlQWVdKMHN5bjdLcFhwUUF2amRw?=
 =?utf-8?B?UFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3678.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c550149c-7cb3-4645-eada-08db551c6595
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2023 08:14:25.4749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NOR8JAOC+VgDMHr9sdOapOe5MV55r1gAH5YG1fi1p6nvm3icDmy77xHJrrATOEYCheXonCwB5Nw3280oePl2S8iBngoUMBJK+28MqB+C23s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB5805
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 08:14:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102597

SW50ZWdyYXRpb24gb2YgdGhlIE9wZW5Db25uZWN0IFZQTiBjbGllbnQgdG8gdGhlIE5ldHdvcmtN
YW5hZ2VyDQpodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvTmV0d29ya01hbmFnZXItb3Bl
bmNvbm5lY3QNCg0KU2lnbmVkLW9mZi1ieTogUGV0ciBHb3R0aGFyZCA8cGV0ci5nb3R0aGFyZEBh
ZHZhbnRlY2guY3o+DQotLS0NCiAuLi4vbmV0d29ya21hbmFnZXItb3BlbmNvbm5lY3RfMS4yLjgu
YmIgICAgICAgfCA0NiArKysrKysrKysrKysrKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDQ2IGlu
c2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L25ldHdvcmttYW5hZ2VyL25ldHdvcmttYW5hZ2VyLW9wZW5jb25uZWN0XzEu
Mi44LmJiDQoNCmRpZmYgLS1naXQgYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1jb25uZWN0aXZp
dHkvbmV0d29ya21hbmFnZXIvbmV0d29ya21hbmFnZXItb3BlbmNvbm5lY3RfMS4yLjguYmIgYi9t
ZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmV0d29ya21hbmFnZXIvbmV0d29y
a21hbmFnZXItb3BlbmNvbm5lY3RfMS4yLjguYmINCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRl
eCAwMDAwMDAwMDAwLi5jOTc4ZGVmYmJmDQotLS0gL2Rldi9udWxsDQorKysgYi9tZXRhLW5ldHdv
cmtpbmcvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmV0d29ya21hbmFnZXIvbmV0d29ya21hbmFnZXIt
b3BlbmNvbm5lY3RfMS4yLjguYmINCkBAIC0wLDAgKzEsNDYgQEANCitTVU1NQVJZID0gIk9wZW5D
b25uZWN0IFZQTiBjbGllbnQgZm9yIE5ldHdvcmtNYW5hZ2VyIg0KK1NFQ1RJT04gPSAibmV0L21p
c2MiDQorDQorTElDRU5TRSA9ICJHUEwtMi4wLW9yLWxhdGVyIg0KK0xJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PTE4NmU4YjU0MzQyZGE0Zjc1M2E2MmI3NzQ4Yzk0N2RiIg0K
Kw0KK0RFUEVORFMgPSAiZ2xpYi0yLjAtbmF0aXZlIGludGx0b29sLW5hdGl2ZSBsaWJ4bWwyIG5l
dHdvcmttYW5hZ2VyIG9wZW5jb25uZWN0Ig0KKw0KK2luaGVyaXQgZ25vbWViYXNlIHVzZXJhZGQN
CisNCitTUkNfVVJJID0gIiR7R05PTUVfTUlSUk9SfS9OZXR3b3JrTWFuYWdlci1vcGVuY29ubmVj
dC8ke0Bnbm9tZV92ZXJkaXIoIiR7UFZ9Iil9L05ldHdvcmtNYW5hZ2VyLW9wZW5jb25uZWN0LSR7
UFZ9LnRhci54eiINCisNCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWRlZGFhNzg1ZDgyZDhlMjM5
ZGRkMDgyYmZhYzUyNTBjNjkxZTk2NDQ2NGJlMTgwN2I2ODI3MjYzNjMzY2RjYyINCisNCitTID0g
IiR7V09SS0RJUn0vTmV0d29ya01hbmFnZXItb3BlbmNvbm5lY3QtJHtQVn0iDQorDQorIyBtZXRh
LWdub21lIGluIGxheWVycyBpcyByZXF1aXJlZCB1c2luZyBnbm9tZToNCitQQUNLQUdFQ09ORklH
W2dub21lXSA9ICItLXdpdGgtZ25vbWUsLS13aXRob3V0LWdub21lLGd0ayszIGdjcjMgbGlibm1h
IGxpYnNlY3JldCwiDQorUEFDS0FHRUNPTkZJR1tndGs0XSA9ICItLXdpdGgtZ3RrNCwtLXdpdGhv
dXQtZ3RrNCxndGs0LCINCisNCitkb19jb25maWd1cmU6YXBwZW5kKCkgew0KKyAgICAjIG5ldHdv
cmstbWFuYWdlci1vcGVuY29ubmVjdC5tZXRhaW5mby54bWwgaXMgY3JlYXRlZCBpbiBzb3VyY2Ug
Zm9sZGVyIGJ1dA0KKyAgICAjIGNvbXBpbGUgZXhwZWN0cyBpdCBpbiBidWlsZCBmb2xkZXIuIEFz
IGxvbmcgYXMgbm9ib2R5IGNvbWVzIHVwIHdpdGggYQ0KKyAgICAjIGJldHRlciBzb2x1dGlvbiBq
dXN0IHN1cHBvcnQgYnVpbGQ6DQorICAgIGlmIFsgLWUgJHtTfS9hcHBkYXRhL25ldHdvcmstbWFu
YWdlci1vcGVuY29ubmVjdC5tZXRhaW5mby54bWwgXTsgdGhlbg0KKyAgICAgICAgbWtkaXIgLXAg
JHtCfS9hcHBkYXRhDQorICAgICAgICBjcCAtZiAke1N9L2FwcGRhdGEvbmV0d29yay1tYW5hZ2Vy
LW9wZW5jb25uZWN0Lm1ldGFpbmZvLnhtbCAke0J9L2FwcGRhdGEvDQorICAgIGZpDQorfQ0KKw0K
K1VTRVJBRERfUEFDS0FHRVMgPSAiJHtQTn0iDQorVVNFUkFERF9QQVJBTToke1BOfSA9ICItLXN5
c3RlbSBubS1vcGVuY29ubmVjdCINCisNCitGSUxFUzoke1BOfSArPSAiIFwNCisgICAgJHtsaWJk
aXJ9L05ldHdvcmtNYW5hZ2VyLyouc28gXA0KKyAgICAke25vbmFyY2hfbGliZGlyfS9OZXR3b3Jr
TWFuYWdlci9WUE4vbm0tb3BlbmNvbm5lY3Qtc2VydmljZS5uYW1lIFwNCisiDQorDQorRklMRVM6
JHtQTn0tc3RhdGljZGV2ICs9ICIgXA0KKyAgICAke2xpYmRpcn0vTmV0d29ya01hbmFnZXIvKi5h
IFwNCisiDQorDQorUkRFUEVORFM6JHtQTn0gPSAiIFwNCisgICAgbmV0d29ya21hbmFnZXIgXA0K
KyAgICBvcGVuY29ubmVjdCBcDQorIg0KLS0gDQoyLjM0LjENCg0K

