Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF2FCFB441
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 13:27:33 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.45])
 by mx.groups.io with SMTP id smtpd.web11.53009.1728307652541713387
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Oct 2024 06:27:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector2 header.b=EoWqVLrS;
 spf=pass (domain: infinera.com, ip: 40.107.237.45, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6txRpe4X5DDBhZ56ED1wdJKx3DPykPs6X+RIvKCatKAWWJyDoxz/FQgXaCtyX6sClQrGYJiTs+AyXcFvO/utAx7rrtl9nl0y+CIAJM5x0mM1aFa9Gd+Ld7DCTYaci7WBZf4g+FfkZuI/JlNw6oGXkGBOOcSm0vYgbABQ1AywU1N+/3gvfXazObIosHv16QiRb+o73H/8El9TYknto4uUim4h1uUjt3qfnBFqyTiuH+/zs4wxvHjMsfpGVrhwzwDOx7q6MIJn3euhl2cxYL686fZlfzQon8pxtcC5zEnQdcrsr2mqP/o/NKCrPBSNphBzFwNiwS8v54lMy7HGvm5nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hjr4XE5T43qcLKZAHDp3MpVcMwkYXnsljR3Es+LWfE=;
 b=H+GTQRZBLgD6Z/AnFaxyZ6ECF07k2XRDyOJGGCmhVGPWzvMAVK7GIkr+pYit4iY+t36tbyUUfZxZFb3LxOTdtzEDfjxzlxAmhozDaftjBTU87ZQmN2yF4peI0e0C75kwDbBIyWB/pD9fM3bTzgRrhA39W08F5I8E0sqrLEzgK+j5K5r/5GLmmmlNGPQfWK/txNuUGwE8+lgHMmagJnZVEWV39ahnQxvhVaJA3TiXV0WGc3eQNEFzjf8zup/S6P08+BeFZE/QA3GZryrQHLaSs2sWSQKt541LQaPZA2nQ0TgNGH1EHhWyB40Nlilsn2Z/dB/7KEI2lvKFaADtSTumuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hjr4XE5T43qcLKZAHDp3MpVcMwkYXnsljR3Es+LWfE=;
 b=EoWqVLrSL+2PZ2RZYHuSzCqTNiNW7I8BocXvSlczZBbZT8rql7KBNtYBtnaRhJoTMKFEcBLfSphguNwhptGX+S6kzyozoiPmerTqYijYZMAErBuuGF/RoQBf11Yqewm5VVtAmcn5bdud09+ylryDsSIi4Wp4Go1v3XrrRDeiAoWK6R4o7XG0+Fqj6w4rAYQeu9PYsQFixBKhibPHewfMsxa6AN/qzMMwdgBVXK+paY2wb15z3+yAabK+gLaroH8DEfqCt/pZSLMFeA4bclR2re4Tz7/cnKoyYevgmQlKicli+OFrx0kx3Nk5w/ltX6s/8/bO8fHhszu1qgpKZqUHXw==
Received: from DS7PR10MB5197.namprd10.prod.outlook.com (2603:10b6:5:3ab::19)
 by BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Mon, 7 Oct
 2024 13:27:28 +0000
Received: from DS7PR10MB5197.namprd10.prod.outlook.com
 ([fe80::9b1b:e457:4852:c406]) by DS7PR10MB5197.namprd10.prod.outlook.com
 ([fe80::9b1b:e457:4852:c406%6]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 13:27:28 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: scarthgap: How to revert zstd from ipk ?
Thread-Topic: scarthgap: How to revert zstd from ipk ?
Thread-Index: AQHbGLynh7wCkgiOPUGUNhn1PYPf2Q==
Date: Mon, 7 Oct 2024 13:27:28 +0000
Message-ID: <ae23174dc7aa9aa7cd5e8fbfbc912bf8d6a3e4db.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.0 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR10MB5197:EE_|BLAPR10MB5075:EE_
x-ms-office365-filtering-correlation-id: df81ab35-0896-4430-213a-08dce6d3ca2b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?eGxQNUladVFMSDVXdmZFY0MyYmZoTDJmWk1MU29VSDZIZEZKK3I4a2ZKMURM?=
 =?utf-8?B?Y3dHWFhlV0VYM2RNcWVOamtjNTBneHpsalV2MEVtRnlFNjZ4cjAzdzJlWWVo?=
 =?utf-8?B?Q1dwdnlyT093Vy9PMEV3Q1BPazdydkZ2TWFXNk9IcHBiSC9ZeDBGMGg0Lytz?=
 =?utf-8?B?Y2pGMFkyY1hlTHpqdXdiVlR0Rk5DOG9wOUM2cEpOcUZMYWdmRUVmT0ZHRkh3?=
 =?utf-8?B?RlBlbFdGQkNRTHNwekFzOFNaT2VoQWxjei9jb0tvN2NIdGVwUTVybHpHczJv?=
 =?utf-8?B?Y21hcTlEckFEQWFBejFUWFJtTnh4MDVQV1I0NG43NWF0TU9NWkFHc3c1K2pV?=
 =?utf-8?B?WVNlUzJYcHZQMmJ2UHBpYzMvK1JlSzkreHZZbGwxVEZYejdkcnkxRkFtR3lo?=
 =?utf-8?B?Uy82WEN2R2xXbS9oclB0RmZDS2lvcEw1RklBVlNDZVNNWHlMVHNPYzNlRk5z?=
 =?utf-8?B?TVFNVGxXUVdGS3FrV3RkUm9pUUxhVFljMEQzWlBEUy83NlZTcWpiSTRWQU16?=
 =?utf-8?B?L1hwSjg2MHBjTzdPUHkwS0lDcmN4TW1ZWjV3dHNFdHJXdGlweisrZUJSaU1Y?=
 =?utf-8?B?aHdwRTdjUU8zM1pKLzJBbE1sUVVsSW9GTmtRNU1WM3A3dzVseTJ5eHVwdWlS?=
 =?utf-8?B?NEhwTWQ0bHc5RGZ2WHFnMkhhUGVHdGp2VDVkTXl2NlJwWmEyR2dJK29yc25Y?=
 =?utf-8?B?MnkvRjUrbUQ3REJCeEdwMGxaekVueHI4TUZEOTdiNzd5ZlhRSkhITUZqM0Na?=
 =?utf-8?B?VkNRd0xRQ1FRTTRhMmNvY2E2anFTeHRIZFN6OEF1L1oxbi9nVVdvSTBaWDFX?=
 =?utf-8?B?dmp5a0djNWk1bEZ3SnhRZytJNm1yaHc4STltSHp6UDBwTFVYUnhLZWVwNjRQ?=
 =?utf-8?B?ZkdCSk1ISkdPQjQ2M2JsVU1RSmpaeWE1RXozQjk2Q0x4S3p4aXZJMW9LK2xo?=
 =?utf-8?B?MVdXdVI2S2Jkc3JPekkwTFpaMzgyVFZMVU43UXdkVUZ1NkR0bWtweDFxNkcx?=
 =?utf-8?B?RWZEeTdqQVlMWHpnVU8vNHpjQnRXSmwxMnhXc2JEZFpXZHZIOGJ2dEc0bWZr?=
 =?utf-8?B?czM4ZTlyWXdyUlp0cFJ0cHMwa2ZCRUxCclgxdEtaOFdHbVYyQk9MdFZYUHpS?=
 =?utf-8?B?YnM0clhTQzlDekRwZjhaNkxKR3d4ZmZYcWxNU1MycWRnVUZqUVNHNC9JbUZU?=
 =?utf-8?B?N0tUSWc1YkU1M3MxRW5qbytUandBRGdISXZIb0RiYldEaW1RVGo0UHNvYTha?=
 =?utf-8?B?d2ZubW1QSkJKcEttVE5ZNTkyMFU2ZVBXQkc4eW5sQldJdDZzVWZCVXMrZy9o?=
 =?utf-8?B?TXlRbGVyMnMwTk9NeHZCSldaYWlIdHFmSEpYZThjM280MTZtU3lPZXQ1TFNS?=
 =?utf-8?B?Mm1CUnh2RzZTZkswdTlXM3o4R1NvNkpJdGJGakxSU3g4TTNmc1pRdVY0RG9V?=
 =?utf-8?B?SEUxWFZEUk1VMUowQ1FpWVFmQ2xWTHpsRy8ybUt4eUNUbGVoMDMzQWJWOTRC?=
 =?utf-8?B?a01OVXRTQXU3aDYyalZTbURRSFcwa2RiSytzbG5sUEYxTGJOOHVibjB1TzNt?=
 =?utf-8?B?ZEx5bHZTMzllU2hTdkp5LzBjQzFEYzk3ejZDTlR3Q1MzSTZaSVBObkVVQTFk?=
 =?utf-8?B?c3dJUFlKUVVwMmZoaGZpOW9ZZEtxYnJ2ZUR6enRIQU05c0c3VXFOdmhaa2Jt?=
 =?utf-8?B?NlZKTDd5dmVCVVlTTnJLVEhMTDNrdXEySTVrTWp0T0U3eTNQU1VxTWNORG5T?=
 =?utf-8?B?UUlmS3l2b0g0YXhReXFOd0I2emVhcksvemdELzltbDZhak9jY0VSeWFyMk55?=
 =?utf-8?B?NFlwS25zNkREZ25UY3F6dz09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5197.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aWZYZElwNTAvRGR1TDlsSmh2QlN1UlEvdExVdFJPZUZEZ2R0OTBqQ1doRGQ4?=
 =?utf-8?B?eFZZT0FJbFB5ckcrYi9YVW5Odys2SUovZkhIdXVvaEpVRUVkQWNBL0hOOG1F?=
 =?utf-8?B?ZnZnV3FOT09ScHAwWlM2UzVIR1lPR3hQUGZhZHpSMnk4U0RWOGp4QkhtR1JV?=
 =?utf-8?B?ZHdNZmpUWVlpUWdrMWFHTEVNS2MreTFWam9LMU0zL1JWNjQ3SGswbjFneFZT?=
 =?utf-8?B?VGVycEwySk8yQkEyRlc5bm93aFlOc3loNDdqOVJYK2JqdTdhMWNTc25WWGVR?=
 =?utf-8?B?TFpwSG5ZdDJ1dTJ3L0ZVM0IxRmc4MG16QlN0bkxReStRUWxEMHlBZk5kdlhY?=
 =?utf-8?B?aEJVWEowM0JtcXJ0c0djOFlkRlpxTVh1SGRxaU1ZVjRmWVhnc2tmWThuTUZC?=
 =?utf-8?B?T1RaNmRjTU81cXMvaUExcFFaZ2N0bnBsMWwzWktGUGdpTStMRElIOTI5ZXp3?=
 =?utf-8?B?UHRpMkZUNGJkMllQeE5pdGNFWTEyY2ttUTVHd2M1eUQ3Z3YxSWlNQnRCaDhp?=
 =?utf-8?B?U1I2TUZyckluZUVQUEtPK1R5Tm41WVdDSWVtNUh1dnlDdGY0MzRKaXpheU9j?=
 =?utf-8?B?enRrNXdkbTEyYmdQcTN4RU5GWUsycXdNS0pBd1NzZ3NwL2wrOTQrZ0JFd2lN?=
 =?utf-8?B?U1BlVG4xTThjbXNZQjBSWTZOLzAwQ0xXbEwrandDT3ErQllHSjl2QnF3Zmky?=
 =?utf-8?B?NmZ0N0ZSTVZOeXVSL1k3ajQ1WExJWmIwdUVyNk9EUzJta3ZGWUU4YnJFQWlY?=
 =?utf-8?B?eWRmRmNZenN1cC9pTHErSEJWSU14cDNCNUZiY0cwaFF5dWdCekRYYlVzQlZX?=
 =?utf-8?B?VkpMWUtnVlBaSWRwQTAxL3ZGenc3cWduWVYvVm1heG9ZMi9rUEFkNXRrT2Np?=
 =?utf-8?B?eEt5M2phZUlGR1ZRWkhKZjBvcGQ0UmxZK1JWcjU5MlI0cHQvbDdWMitCSG1N?=
 =?utf-8?B?cUJ2TE9HQThBZEU3d3ZSQVpwMVc5RVlpZlZ6aDQ4OXRyNmMrL2laN0FZZkZ6?=
 =?utf-8?B?Z2hTTzFKbFRER0hsYlp3MEZrMnZ5eUI0Q0FtSGhaeFArUyt3cDZHWm9abmJr?=
 =?utf-8?B?Tkg1YnNrMWVPcWRlQXhDQiswS3h6b2xpbWcwM3pPbGRWQVkwaXhyRWgwZDZt?=
 =?utf-8?B?em1VQWN4aXkrWmZHaEF6NTZmaXdTUkpyM1VVNzV0czRhamZQWllNSHZpMGV4?=
 =?utf-8?B?dzY0dlNZSXNxM3BpbHpLNHdvZUJCTkZRYzJmb3ZlVFQveDY3dG9sUGUrTzZH?=
 =?utf-8?B?c2x1M0FCc0tOMStCblFFa08xd3ZhL0tsRDhqYmg2YmVHRE1NMU1uWTNyUjds?=
 =?utf-8?B?WjFxcTAzZUpwbHZMTDUrSXVxZEJlLzNlMWdGRE9WVVJ3V2NxRjVqWjZETW1X?=
 =?utf-8?B?SVBnRmNBb0lrV2FTU2hyV0VjbG5jbnp1UjVDZldyMURtYyszcHFhUEp0UXlW?=
 =?utf-8?B?bmR4amxrWDZhd0ZKdk4xUUF1RUpxczIrck9BeWlUc3N6ajVMallkd2l0cmdq?=
 =?utf-8?B?SzNITUoxcnhNVWcrWFU5OWp4ZS9aSFkwbVpMU2dnOHRnT2c1TkF1QmxQTWpQ?=
 =?utf-8?B?WlhiYWwycENrZ3BibjAvaS84QjdqVnNEQW9tTDdRZWNnc25kd2Y5ZXdCc1VD?=
 =?utf-8?B?c08yaXM4eGMvblllRmZhSWV2MlowRkJTcUxaS0dGOHJqVjltMytFRmQwRGtJ?=
 =?utf-8?B?d1UwdFA3K1lhQ25INkhYK3VQZDNvOFE5WkZxa1g0UTdpN2lIR3JPNVUvb2xn?=
 =?utf-8?B?QUFzd3p5U0x6SXJFdk15ajl0bGN6N2h1SGwyRHBkeEovZ1VKaGc4UWFVVjZY?=
 =?utf-8?B?Y1F0c04xT3R0MVdTMHFsdmp6UUZBZ25zcEVXVk13SWE2azExblFCMlM2NE9a?=
 =?utf-8?B?dzlDM05wVW8rWEF2UWFZUTl4YlZXK2xhY013Qk45bG0rQ2hJWllMMElYMDlx?=
 =?utf-8?B?eXA0OVRyZURFcjVBNG9Jc1M1cGl6MklBdjdxNWhHRERsYzJlMWRxKzkzTXh6?=
 =?utf-8?B?NzNORXpUU3luSVZ2dy9ic3RsN2p1ZkxFQ2hjek10YVRwV1dNbEpLOEs5RzBV?=
 =?utf-8?B?ZW1IM3Z3MU9OVzFHV3JrUzZuS2xEMk90dkp4N1pLWEpaMVdKU2JueWNROVZS?=
 =?utf-8?Q?QRLTfTgTmJxQJNHwY/wE6fqsx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5BDD2853A1F59D41995A04CDBA9E77DE@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5197.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df81ab35-0896-4430-213a-08dce6d3ca2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2024 13:27:28.4003
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2j6WLLQsJUCoJz7h/Kz8zU9EkRPQrSgUyh5qoIiTtqNYKmzXmezLED4rclpk2hcv3+gdhNwDiajSZgRpCfiI/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5075
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Oct 2024 13:27:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112695

V2UgZG9uJ3QgaGF2ZSB6c3RkIG9uIG91dCB0YXJnZXQgYW5kIHNpbmNlIGl0IGlzIHJhdGhlciBs
YXJnZSB3ZSB3YW50IHRvIGF2b2lkIGl0Lg0KVHJpZWQgdG8gYmFjayB6c3RkIG91dCBieSBkb2lu
ZzoNCg0KQWRkZWQgb3BrZ18lYmJhcHBlbmQ6DQogREVQRU5EUzpyZW1vdmUgPSAienN0ZCINCiBF
WFRSQV9PRUNPTkY6cmVtb3ZlID0gIi0tZW5hYmxlLXpzdGQiDQphbmQgc2V0Og0KIFBBQ0tBR0VD
T05GSUc6cG4tbGliYXJjaGl2ZSA9ICJ6bGliIGJ6MiB4eiINCmluIG91ciBvd24gZGlzdG8uY29u
Zg0KDQpCdXQgYml0YmFrZSBzdGlsbCBidWlsZHMgKmlwaydzIHdpdGggenN0ZCBjb21wcmVzc2lv
biwgd2hhdCBhbSBJIG1pc3Npbmc/DQoNCiAgIEpvYWtpbQ0K

