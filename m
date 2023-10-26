Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66858C25B6B
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 17:00:18 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (APC01-SG2-obe.outbound.protection.outlook.com [40.107.215.72])
 by mx.groups.io with SMTP id smtpd.web10.205893.1698339613364587762
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 10:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=cAfflsAO;
 spf=pass (domain: advantech.cz, ip: 40.107.215.72, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RT/nFW86rRC8AQ4agmKJAmjDzRGWExjZ3EueU0YTxI2mG6SK8s5QqO8LIZRHPzGMEedZX8mcmcUupYzV9mz4by01THV/X5t7NXV0cMn7Vm+UrmEFxeHIMpTs6lKH5XMCroWnPvLLELkNI1xdabuM3s+9hEFEj6/FpAZijBvljOoSHFAwc/WB/Ml+2wCabf0LbFdL/lX5pdkVTkCRWNcVEcMGlnRFBCVpafk/mG0zBZd93r85r4zJ8An/+XpOQAqsaHCSDeLeqeYxZ4uj47TiNftA6rqsNTyy9NfP/a7fAGvozVFAFH7LIC7rlZk7NI3vO4ugtUSeY0ySl9ke6bElPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZjlIj803qzShh/Q4n8bVTzdatXrusyZh6+9j0u5uQo=;
 b=azhiyyyyjfYeJvauFzlWbaBEa2yRQ2QbuKUVCg20A6rNsOobHbsCmVZSbEKhNjFfrtCGZVq5pXmC4D/fIj46DFmVRn8rWFtNykxcU5In+EGYhagU3a4rntYK6r24JLhWEDNis91pKzLe4znYgycAyhWPFl8Nni174dryiQunzXIBRZ0+Te+QjOtJXKXzNKKEBXo4eAEwP5tZI3mlgM6fx97Ws5BpoGBr7w9nhCXKdUqxL413CTHjM5YODWMgsucsFRaydKQcggmJTVP/XWqZmAjMc2Mgva+uesr5cROsaZxVO4gADBoC2k88zO4OH1knBfq4IKsJXnUXcgYpwsW+tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZjlIj803qzShh/Q4n8bVTzdatXrusyZh6+9j0u5uQo=;
 b=cAfflsAOa1sRZFhvqwpvVg8QTM16Uzb2sPNqhP112ChNj237fmGc3d9Xd32pJoC6OzeYXT024hq1glyozAG7HWXv6dGD4O0i0n21XcKeZz0C71sLxAd+xknxKx7w2eTVNx5E9Xnw9o3Ntbfx0UqR22SQic38k6DSK5EMvanP0EzrVHurxWGCSCjc2bdhSKI4LMeIidhg/LNd1Qgg5pD1BH357OVnJOF26c/Jp4rZw7GiF5yBo7aTrz4YREySW1zs1DEKo8wW4liCz6gvn/1kim98k2AOKtNWQETM0YT+fQIz+w6ZbSfhBR6iP6w8c2XjqBVdOjRZzW4DKlyx8W4Wbg==
Received: from SEYPR02MB7699.apcprd02.prod.outlook.com (2603:1096:101:1e0::7)
 by KL1PR02MB4867.apcprd02.prod.outlook.com (2603:1096:820:5d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.23; Thu, 26 Oct
 2023 17:00:10 +0000
Received: from SEYPR02MB7699.apcprd02.prod.outlook.com
 ([fe80::942:8056:62be:9656]) by SEYPR02MB7699.apcprd02.prod.outlook.com
 ([fe80::942:8056:62be:9656%4]) with mapi id 15.20.6933.019; Thu, 26 Oct 2023
 17:00:10 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] modemmanager: upgrade 1.20.6 -> 1.22.0
Thread-Topic: [meta-oe][PATCH] modemmanager: upgrade 1.20.6 -> 1.22.0
Thread-Index: AdoILV54IlnoBOxBSfSsiweoCA0TWw==
Date: Thu, 26 Oct 2023 17:00:10 +0000
Message-ID: 
 <SEYPR02MB7699255CD3945CEBC1E7183781DDA@SEYPR02MB7699.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR02MB7699:EE_|KL1PR02MB4867:EE_
x-ms-office365-filtering-correlation-id: e7387cf2-2c9b-43d7-c31f-08dbd64503c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 wkP3s22jSqcHzvQtiMSf87yZ0O1V5ni+1bc6A3KOTe0D8SMeRSFka1itb1Ch/gfZHKQ6Lq8Y6Lu8T/uOfEhZuKrHgiYbHIO6QcscRgBOYlKko4hfglZVREEzYAefGSlnimyagmsiz7XrliFQg7kHPEAlJ/BYAFOeBkvfUP18Gva+sYEZbVR36VNpQvvBk3uaRzgn/YKlE4cmqdeK/SbAagFTw3Fpd2P5+nFY6zDPwVKOeX4xHgJ/XEJf96Co2ATmDXq1JdHDHGIHcB/wkXs8Nt7j/YBtV+5DCNHrfG8sWhM0OX4GnGcPf7xmGREkMLYlRze8u3ri1lJty96nySIfvWiLT0la35MUW3/34PfJRpE5mkLDQe21nYc/6+E5f7NgDdUMcO6AwcMvR22z9D0IpMdPu3eJzfEXGyEpwcXatRBzkyW8BoPBg4WegUyIIMK1Cl8cxNPpFJeK5+z1dheqTYF8rKG71arrS26MALrnvRgWgP6W5KmZuSa1IOqDDjbd0gQzUe09Hgpgmt8tM2j52qYU+qoYQwywmav2tJI0XWWvtmE6A+EJh/urNbVS2EICYa8mQX57rNmTTL+7W7z5FNCOmr2MWlyZ1gKQksut3q4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR02MB7699.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(366004)(376002)(136003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(122000001)(52536014)(38070700009)(38100700002)(55016003)(83380400001)(41300700001)(44832011)(8676002)(8936002)(66946007)(66556008)(2906002)(76116006)(5660300002)(66476007)(316002)(86362001)(66446008)(6916009)(64756008)(478600001)(33656002)(71200400001)(966005)(6506007)(7696005)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dXVoRm1Xd0lVSllFdXdHeDlqVVJqTVRHNkJVQnpiYUVhOGdkanR1bnVkdW9u?=
 =?utf-8?B?Z2cxTTQvT2lCRUtORmFVaU9uNkE3Q2tob1R4TTdPekc1ZTJLa1hMRkFDWXFH?=
 =?utf-8?B?MVpWSUdlNTU4d1luUkMyL01tVGUzUEl0cExGOXd5OUR0aGtLYTkyV1pSMmdq?=
 =?utf-8?B?TW1DSFV2MThRSzFFR1pKVlp5dTZZWUVOU3dUMDIrbm92YitOb3VIanI0N0Vv?=
 =?utf-8?B?YTBVMjZLaVR5clc3d2pVQUpNZm51cU5qQVF2OGpLR1BJS09XUlNSOUI4TlJy?=
 =?utf-8?B?VG5DMFU5VStvb0gzOTJNYzBQQjBnK055aDE1ZjJUQ3kxaDFnSU9zR0FSTWxB?=
 =?utf-8?B?WXgra3ZZcW1WRDZYcFAxSHJSYXFNdng2cGRaMGpBQ1hCNkhnRUx2VE52b25h?=
 =?utf-8?B?R2lKbEdGQ2JlQTZEWjN1NXpHRHM4Sm9WZzFQY2Vpa3BhM0R4V3hSY2xraThz?=
 =?utf-8?B?RmhQVjNDdk1FdXJaZEN3aXloWjV0UlRLZXNaT2gyTU9JbzRyaXR3MjAzRXJF?=
 =?utf-8?B?emVUc240eWJNUm9WeWcwS0w0TGcxRER4bEVWbzZ4SHVWM2V4YU1YZHltZmMz?=
 =?utf-8?B?NVFLZFplR1RzR1V1VmRoZ3JkWG4xK093QUtUMEU5VlZIbEZodm9wOUQ1ZjFu?=
 =?utf-8?B?V2JiZGlFbEo1cU5kelpudWI2d2dyaGE1YVB5WTJpc0pVc09IYUNJVit4UENp?=
 =?utf-8?B?bnEvQUxleldoalZuTlJGYy9GVjRiWjhCMWJvMjVZeDRSK1hzTjNOQ0J4MWts?=
 =?utf-8?B?RmI0eGhycXMwRmRxbkJDRUpkYzh4UHJZYWdpeFhOcFFPUW81OEZIL3VQcENR?=
 =?utf-8?B?TlZWcEEvL1ZqYUR2VHQzZGNwaUI0NzdwM3FDcUJHMENkTVp5TUZIQW84TGhs?=
 =?utf-8?B?RzZhY0JCSDg0cW4zamdtZFZ2NXBnYTNqWWJGc2dDNVpqblRvYWxISEczMmRU?=
 =?utf-8?B?ZWVOVU5qQWkrU28vRXIya1Z3cmdpQTB5L0E0S016UGd5YmxBWE8xNnR3Q24z?=
 =?utf-8?B?dlBUVW83MzNzOUVsVUVjcVE5MlZDeUo0Z21NTExaZ3I0N2tFZC9rblJ2b2d2?=
 =?utf-8?B?TmROdWdnaGpPRVBQcEdNc3luRHBQMUlVdkZ1cmh5R1BHTjNyTm13T01GMFc0?=
 =?utf-8?B?YnNhMmlzNzZNYU1tQjU0b2pLNnI0YkpJTW1udFRNNkczc2FmN2lXdU90WEtM?=
 =?utf-8?B?QlNjQXdkeW15b20vTUgreTVFcngvdkp3M01NeTljTHM4QTlDSUI3Zm1GN2pl?=
 =?utf-8?B?VDdGWEZaSy9nSmlmNURCOWlZSklBV0NPMWxwbWE4dWF2OGh0K1BjSUZJQmlE?=
 =?utf-8?B?cjVtSm4rVkt5dGtwOUJjcGV5SjJ1TTJ2dE81T2VCZUhDSzN1SGFvanlSazhN?=
 =?utf-8?B?dFFZRmJGZ2ZiMWtmQ0dPRHBsVU05cFNSM2ZhS3lGcnBaVlJNWTRXZ3N5UjZz?=
 =?utf-8?B?SHJnanlMM1hIYXYwVDREM2FDMXo1aFRRWHAxTllzN2JTWWNLRk9XY0xkL1NP?=
 =?utf-8?B?TlNqSXJVcko2YmdFallZajZtZ2VYSnRhbGI1Ry9oZnkyUmpHV0hhU0ZDbk5p?=
 =?utf-8?B?SldWcVU4OWZqU0NwZ2RUOFdNTWJocjNUSjV3UWs0KzdYQUZ4Z3YzMlB0aEVu?=
 =?utf-8?B?TW5YWGJXL3RDbDBjZlRPcFovVFplcmZHL3NrdkZSdTN3d0F3Q2xSR052VlhJ?=
 =?utf-8?B?WEt6b0V5ZXFRVUpwYVlCeWxaZFlCdXZnUGMyYkpoT01tQnVERW1hVk93NXdt?=
 =?utf-8?B?eVZUR25ncEdJZEEvTmk4UWhUTUVZU040VnFzdms2QXA4dmpibjAyOXppeFBl?=
 =?utf-8?B?YUh6Y1E0dGdkQzduSXFad1hBVGFBZXBLS01zWHlkdzZRTFJWcitkN0k2a2Nv?=
 =?utf-8?B?WkZGZ2NpSVN3OUQya3pPemFiWnJiNkdpWGpjUWdZclNPUnFxYnRYcW55Rzly?=
 =?utf-8?B?TFdFVGRMRHhnbFJIWXdPTW9OZlpCQmdGUnNuUXgrNVVZcm5uMTJyc2JCSXpm?=
 =?utf-8?B?NmtWdFJ1UkRTT0Jpd1V2Y3ZkdmhUMnJ1dWpHZGR5eVlHWE92bjZKVFM1N2Ew?=
 =?utf-8?B?QllHUDlSN2JQRkIwNWtBbUJoRDhidkcwV1p2OTJmck5FdGNzQVJ2bjVDRFRT?=
 =?utf-8?Q?uTxM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB7699.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7387cf2-2c9b-43d7-c31f-08dbd64503c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2023 17:00:10.7016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RfKCXZqYpCVA52FmOXitzPopXfRrSP1/HHVt84CO2yMfiZdavjQ82Cs+iQLG2QW97W8tn1QD/PJK0z7wh6arF96xkBI3b2Ysf6E8SFY9mec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB4867
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 17:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105760

DQpDaGFuZ2Vsb2c6DQpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbW9iaWxlLWJyb2Fk
YmFuZC9Nb2RlbU1hbmFnZXIvLS9ibG9iLzEuMjIuMC9ORVdTDQoNClNpZ25lZC1vZmYtYnk6IFBl
dHIgR290dGhhcmQgPHBldHIuZ290dGhhcmRAYWR2YW50ZWNoLmN6Pg0KLS0tDQogLi4uL3ttb2Rl
bW1hbmFnZXJfMS4yMC42LmJiID0+IG1vZGVtbWFuYWdlcl8xLjIyLjAuYmJ9ICAgICAgICB8IDQg
KystLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQog
cmVuYW1lIG1ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbW9kZW1tYW5hZ2VyL3ttb2RlbW1h
bmFnZXJfMS4yMC42LmJiID0+IG1vZGVtbWFuYWdlcl8xLjIyLjAuYmJ9ICg5NSUpDQoNCmRpZmYg
LS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L21vZGVtbWFuYWdlci9tb2RlbW1h
bmFnZXJfMS4yMC42LmJiIGIvbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tb2RlbW1hbmFn
ZXIvbW9kZW1tYW5hZ2VyXzEuMjIuMC5iYg0Kc2ltaWxhcml0eSBpbmRleCA5NSUNCnJlbmFtZSBm
cm9tIG1ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbW9kZW1tYW5hZ2VyL21vZGVtbWFuYWdl
cl8xLjIwLjYuYmINCnJlbmFtZSB0byBtZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L21vZGVt
bWFuYWdlci9tb2RlbW1hbmFnZXJfMS4yMi4wLmJiDQppbmRleCBiYTgyZDIxNTAuLjk1ODg0ZjQ0
YyAxMDA2NDQNCi0tLSBhL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbW9kZW1tYW5hZ2Vy
L21vZGVtbWFuYWdlcl8xLjIwLjYuYmINCisrKyBiL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZp
dHkvbW9kZW1tYW5hZ2VyL21vZGVtbWFuYWdlcl8xLjIyLjAuYmINCkBAIC0xMiw4ICsxMiw4IEBA
IGluaGVyaXQgZ25vbWViYXNlIGdldHRleHQgc3lzdGVtZCBnb2JqZWN0LWludHJvc3BlY3Rpb24g
YmFzaC1jb21wbGV0aW9uDQogDQogREVQRU5EUyA9ICJnbGliLTIuMCBsaWJndWRldiBsaWJ4c2x0
LW5hdGl2ZSBkYnVzIg0KIA0KLVNSQ1JFViA9ICI2YWEwZmY1ODNkMDRhZWE4OGI0ZGE3YTFjMjAw
NDlmNTcwNjJkYWI2Ig0KLVNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9t
b2JpbGUtYnJvYWRiYW5kL01vZGVtTWFuYWdlci5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1t
LTEtMjAiDQorU1JDUkVWID0gIjAzZjc4NmNlNjYzNjBkNjdjNjY5ZjRmMTIyZjhhYTQ1OGU2ZjAx
ZWEiDQorU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21vYmlsZS1icm9h
ZGJhbmQvTW9kZW1NYW5hZ2VyLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bW0tMS0yMiINCiAN
CiBTID0gIiR7V09SS0RJUn0vZ2l0Ig0KIA0KLS0gDQoyLjM0LjENCg0K

