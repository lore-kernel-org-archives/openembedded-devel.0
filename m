Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C98C77B7F
	for <webhook@archiver.kernel.org>; Sat, 13 May 2023 13:17:19 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (APC01-TYZ-obe.outbound.protection.outlook.com [40.107.117.89])
 by mx.groups.io with SMTP id smtpd.web11.46813.1683983828541182682
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 May 2023 06:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=NhN6PluJ;
 spf=pass (domain: advantech.cz, ip: 40.107.117.89, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hARWDk5sEZT9h7B2OA93ITEgiPO+PqOzurQ5uI0+GlGlFlRz0dS2OPT2Ir9TSz1dObBGaTN6jg2JL6ozzgzrPgjIRYCb/XcbXIHZ9aezOlJptvcxGXs6HYCEQQI4PoqEuz0k37I07RWj7miKoSo+a8ylHlsszxUUuXd5tnv6Oh4kZ9dYIqXkDAb02JYHrtzXZprX2lQtTr8AJJ3Xk8WfIY8rRPGspbHEBldTp9MoSie5zVrrGcKebL60hG7kBHTycUnZHiIeBhLE5sMnwGyxcH/e54QAVT6f/oqgnhaB5q8rGV6Sq32e8DRmENix69wD/TwfLDtD5JegL2iqsKBzuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owSemk7jmKVfJGXemEIZMRCbxDb8Xl46iTYCSFl3ChY=;
 b=PVmVhmBBPpUnSPrE8GBdjCJDBLlluLnz7ClnEnm2HcDAgYUYkweiEexRYT+/Jwq2J2vveNMdUh25jPusDw6ItIxwRcnnfoMqEWNb2l0PVprnKH4UwrEzLmF2mPIh4/LKjV1D4jeWEERQtft3J8MjTCBWeSwnDr+RcHd4Ur6KnuXDkhhHG5UsHfNUkF3jSuAsim6TWfSDlByNbOKhqxFzOXri0y66LtRrPY6kWLiVrJGXA/KOXve2UBaEYCywXeu0x+HxpkurWJ1IN1ke/R9XZrZqjxefxyNIkeiO7LqiBv8yv3WuWsb82D6ggpgStc+wqc+UZiJerxDgir/InjcJzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owSemk7jmKVfJGXemEIZMRCbxDb8Xl46iTYCSFl3ChY=;
 b=NhN6PluJgeC7IPXQvMjjIKbTtMJkqm0pPJFYCdmSpkCq8tadZtJQ8W115P/YkLid//IdLT0SsQDUwGrGVt0bR4bBMktynKQf9AugKJ5mnrjQaNxfaFLowFw9kTRLn37kbfjkehzoJD3GHeOl/WR6fpfuTHOgjObGeLuorwlpjONYbFTzrxIUU/IGE9v4tYpwEcLivrO1zvGJRhCpld2PDD3bpJ0tcqzRFJ4fCJwqw9EBZv9b4I4dvZJtTbF7nFCFiEMFkGSBRE33pcM0YWIVfCCWXBGPTYlPi7PXpQ9yTPkpVruRqzOdvV26A8TZyrzVsCJMX5x9ZazzDjd2HxshGA==
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com (2603:1096:404:b7::12)
 by SEYPR02MB6339.apcprd02.prod.outlook.com (2603:1096:101:13a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.11; Sat, 13 May
 2023 13:17:02 +0000
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::3e74:b6f0:fad1:4598]) by TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::3e74:b6f0:fad1:4598%5]) with mapi id 15.20.6411.011; Sat, 13 May 2023
 13:17:02 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH v2] openfortivpn: add new recipe
Thread-Topic: [meta-networking][PATCH v2] openfortivpn: add new recipe
Thread-Index: AdmFnQRuiyzHOadZQTOizzUiOeyZDw==
Date: Sat, 13 May 2023 13:17:01 +0000
Message-ID: 
 <TY2PR02MB3678782F00D00359FD526A17817A9@TY2PR02MB3678.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR02MB3678:EE_|SEYPR02MB6339:EE_
x-ms-office365-filtering-correlation-id: ffe832d0-c196-40b2-f94e-08db53b456b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rHzqzZYufraG4Y400+OlaXrEesJjoPPR8Lgl0E3w5VRESKjtwppHWb1FRBiwRxsrE8xjeRnPdZn83/gjaFUJOqSZYn8CdcURu2JXgo9DIgnajVfAdEUS0gQmZH4OYLLtSchQPU/RPJP2NsvEa2i3ijWCCdXSQlzow48AfO2BribRdnbykheV//ZLhH9Grvg7eWzXTYyvHmZdwgSrQZyRXQmtLFEc5RiV9sw2s6AtdoZw8lrVueHAyrrLX6WTssJKOxMpxGpXbG+Ur9ovrxzerQ0YrYCbxBCosVC9uJzNVtVfz6kiv0n+OM5Ky6HIj5e+3exPKDHQOBm5Qt5K5hMNUrDVQpj7elBXejiuzTuPGyxwbuni6P0ARZ4S34QxsizuYXrgK/iMi8YKGw0Txj9JMCkxbMlOcqjAK9qB/+68OrRBKSHxNmo3loXxOe+Tti1pP/kPW34Nk6T4AquYNoCoNJHus+Z+TDHO33T25/xFhLMnA5XUHp9MAl7HFJZgWSwPG6Qim5lztHAZSiGJO1ZlJdMTsbV3Da4bfAk012ObUVL5hemJcwary+NsyEx2nMqgvGG+sOVzhhMBEG6Eyqa4rixZll/TVDNdWm5LEIUCZMI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR02MB3678.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39850400004)(136003)(376002)(396003)(346002)(451199021)(8676002)(478600001)(316002)(44832011)(5660300002)(8936002)(52536014)(2906002)(86362001)(38070700005)(33656002)(122000001)(76116006)(6916009)(66476007)(66446008)(66556008)(64756008)(66946007)(55016003)(38100700002)(41300700001)(186003)(83380400001)(9686003)(6506007)(26005)(7696005)(71200400001)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?a1ovTTRJZDFSYkpDRTJiMnNyME1HV1dKR3VYWUZ4YTNiNjJRak5hYXJDc0lV?=
 =?utf-8?B?c3Ftb2o1bkFGc2tBMk1zWE9YVjI0RytHYjVla1pOMWpQa1JFcmlYb1NXRmxw?=
 =?utf-8?B?b1JMcEZYOGY0aTZHK0d2SGR3Q0hYZ3laTVlrTi9pejhRVzBnYTZSYWNTZGlz?=
 =?utf-8?B?aHEvbnZPVmVMS00zMTlYNmc1aUhQcFZNZlJLOHZ6UUNmQTlDc0VYYnRycFo2?=
 =?utf-8?B?WmpvdExxSlFSVmJCQy9zaUNWa0p1NmVrQmVseUlYRzNmZ0VYV3pwOFoxTEJ1?=
 =?utf-8?B?WUIvZEFCcVJ6ZUhQeE1RUHF5VHdVMndLVXk4ckJBTHJqOHhuNmNnRkV3azE1?=
 =?utf-8?B?V1JOMFVxTzRSZ0F4NS93bEpLdmlsZVc2TGszanRuTlZKSGFmYWRTMVhvUE5i?=
 =?utf-8?B?RWRSN245RUd3YzlxWktXdFBPcDRvZUhxSDFsRkV0ZDhlYmp0QVFBNjRaWnZD?=
 =?utf-8?B?VU9nNXppa0w5RGhCK0VwbTVQWHB4M3ZIdEpNekxhMGFodEdlS0k2clNOaUh6?=
 =?utf-8?B?aDdhY3hEMkVEQmtxbVZNZ1ZHL0R2YXhZeVJFM1ZyTXpSZFAyVWVXRU90cExu?=
 =?utf-8?B?OEQ2VEQ1Y2QwVDF6TlBYU1BweW9ZdkdQM0loM0toYXRQTnpDSDlOVW5WcExM?=
 =?utf-8?B?VG1QeDVuYmIzbWFOUmNWNEdDMk5sZUNFZlFvdlRtbnZ6ekkwUW0reDl0VE84?=
 =?utf-8?B?ak9SUWJNdTZkZU5Ia3ZTVDh4WXR4M1V5UTB0TTRmTjQrQ0xDYWlYbnJwWkhO?=
 =?utf-8?B?eFJGQlZycGZ0cjk4RkNYcWZJckluMUkzM2V1UUFzOG1lUFpGTVhudVRQdmVK?=
 =?utf-8?B?Y1JiY0lUeEdjQ0h4eksvY1NJY1k4QU0zMmNGVitIYnRzU3dPOHZCdTZnSlVl?=
 =?utf-8?B?eDdlM2JuWEtBQkRoRW5lZ0krOWZDU1p2NWZLWmJHWVJFQUczRDBoMU5SVW9u?=
 =?utf-8?B?bWdLRmNFai91SGJIYjBGUGNsU0lPbTljcEYyZjc0bWdQMG03N2JxMkZldWNM?=
 =?utf-8?B?OHhvR2s4UEFPbHFOMkJhZHBPVmZaV1JQaVIyeW5MTjRMWEJJZmhFNGN3SU1z?=
 =?utf-8?B?bVNvVy9hUlZBaTdqM2M2S0cvSk1RTHYrWFo5Qk9CWW4xSmk2UXh2YkJ6MUgr?=
 =?utf-8?B?NzNqUURjdDJKdllWRlE2VjlqZGJ6N0tHa1k0Z3JpUHFPZHUwWFRGa3pvK210?=
 =?utf-8?B?cXdCeFFpdENSOVd4UzR4WWpQVmMrejZTTHUwb29qVUYrZk85OFhsN3Q2RW9N?=
 =?utf-8?B?dUxGZSszNlpsR2dvVUpWOTBHZHRzeEl2V2QzR3BLMDJPVUhKS2JsZEljbFhw?=
 =?utf-8?B?VktGbGtyVFFycDFoQUhINFdHWnppL1B0QVJrbmdyTWh0Z2pid0tNSE5uUDJl?=
 =?utf-8?B?V0ROTkd3NE5TWEhHaVVHTU9pMXp4c01QNjR1M2NLM1FiNGx4WWRMY0xlSmJ1?=
 =?utf-8?B?c2NKWTdKWHg0VGdkNys0ZG1jOEJxZGlpdjJFeFV0dXhycDR5anQxTHZhRCtz?=
 =?utf-8?B?SHJrSjdnOHluU3FLdzA3WVA5aHMwUFlwSW5ham56RFVnQ1Vla1RjZDkrT0Nl?=
 =?utf-8?B?eTZGWVh2RklsblBBRStrbHpXem9mU3V6WEZzQTNxZlMrQWxBc1JxSk9WVzJp?=
 =?utf-8?B?WFNtMU14VUp4R3V3a0gwK1A5ZWQrT0ZBNVV5UVZwTFBHK2xleHU3M0wwOXFs?=
 =?utf-8?B?KzhDS1BBRnhDNXUvT0VNL3dpVkxYT2JsSEN2SmJwSmc4R080anZoOHI0dmN6?=
 =?utf-8?B?Y1N2RGFTOEg5WENsb0tjUnBrOVBFNjZiK1AyV1EyQlo0Mkd3SlRwYndyVmNu?=
 =?utf-8?B?SXRpeG8xeW1xN2tGdWZHOEMycVpGVEJOak5uVzBMY2J4MzhZNXBUbDFFQ3p2?=
 =?utf-8?B?Y2wvbk84cGJmN2E1RzFvVlZnbGdRMkg1UmV5eWZxWUMzTXVGT1lMc3RENWRC?=
 =?utf-8?B?Nmh5RXpNOEY5L2psVHZjMGd1Qy9sWnlqN2FZU2t5NFZYU2RZRFdtQ1dUaFl2?=
 =?utf-8?B?d3JtdHVNWnVRdlhmdmN2NkFsU2hZTVE0Qjd3Y2FEczl0OGZpbEpQZTVEdDly?=
 =?utf-8?B?RmxkYm1Ddm1LQTlJTUtXS0o4cjk4d09wZTFZY3pUS0ttV2NjdURXcG11aHNN?=
 =?utf-8?B?cjRXOEtpQnVpd1d5VjE2SnRoNTE5MDBmd0pHNDF6YUs5MEJRTDMwQVlpUzRT?=
 =?utf-8?B?N1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3678.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe832d0-c196-40b2-f94e-08db53b456b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2023 13:17:01.6731
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yxz1uveEit0jbsiDL+9KgWBBnXMNczs9L6O4HaGx8wDA8UktDdf2O1gTzV2Q8rAEkeHJSwXBCXydD8DVP0A+y8x7/m3dFo9KtRLbMKILFyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB6339
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 May 2023 13:17:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102561

QSBjbGllbnQgZm9yIFBQUCtTU0wgVlBOIHR1bm5lbCBzZXJ2aWNlcywgY29tcGF0aWJsZSB3aXRo
IEZvcnRpbmV0IFZQTnMuDQpodHRwczovL2dpdGh1Yi5jb20vYWRyaWVudmVyZ2Uvb3BlbmZvcnRp
dnBuDQoNClNpZ25lZC1vZmYtYnk6IFBldHIgR290dGhhcmQgPHBldHIuZ290dGhhcmRAYWR2YW50
ZWNoLmN6Pg0KLS0tDQogLi4uL29wZW5mb3J0aXZwbi9vcGVuZm9ydGl2cG5fMS4yMC4zLmJiICAg
ICAgIHwgMjYgKysrKysrKysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRp
b25zKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9vcGVuZm9ydGl2cG4vb3BlbmZvcnRpdnBuXzEuMjAuMy5iYg0KDQpkaWZmIC0tZ2l0
IGEvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5mb3J0aXZwbi9vcGVu
Zm9ydGl2cG5fMS4yMC4zLmJiIGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5
L29wZW5mb3J0aXZwbi9vcGVuZm9ydGl2cG5fMS4yMC4zLmJiDQpuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KaW5kZXggMDAwMDAwMDAwMC4uYmZkNTFmN2Y3MA0KLS0tIC9kZXYvbnVsbA0KKysrIGIvbWV0
YS1uZXR3b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5mb3J0aXZwbi9vcGVuZm9ydGl2
cG5fMS4yMC4zLmJiDQpAQCAtMCwwICsxLDI2IEBADQorU1VNTUFSWSA9ICJDbGllbnQgZm9yIFBQ
UCtTU0wgVlBOIHR1bm5lbCBzZXJ2aWNlcyINCitMSUNFTlNFID0gIkdQTC0zLjAtb3ItbGF0ZXIi
DQorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9M2Q1NzUyNjJhNjUxYTZm
MWExNzIxMGNlNDFiZjkwN2QiDQorDQorU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2Fkcmll
bnZlcmdlL29wZW5mb3J0aXZwbi5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciINCitT
UkNSRVYgPSAiNDVjYjhlMGY5OTg0ZjFkNTRiNjQ4ZTQ5OWJkYTYzN2Q5NjU2ODkwOCINCisNCitE
RVBFTkRTID0gIm9wZW5zc2wiDQorDQorUEFDS0FHRUNPTkZJRyA/Pz0gIiR7QGJiLnV0aWxzLmZp
bHRlcignRElTVFJPX0ZFQVRVUkVTJywgJ3N5c3RlbWQnLCBkKX0iDQorDQorUEFDS0FHRUNPTkZJ
R1tyZXNvbHZjb25mXSA9ICItLXdpdGgtcmVzb2x2Y29uZj0ke2Jhc2Vfc2JpbmRpcn0vcmVzb2x2
Y29uZiAtLWVuYWJsZS1yZXNvbHZjb25mLC0td2l0aC1yZXNvbHZjb25mPURJU0FCTEVELCwiDQor
UEFDS0FHRUNPTkZJR1tzeXN0ZW1kXSA9ICItLXdpdGgtc3lzdGVtZHN5c3RlbXVuaXRkaXI9JHtz
eXN0ZW1kX3N5c3RlbV91bml0ZGlyfSwtLXdpdGhvdXQtc3lzdGVtZHN5c3RlbXVuaXRkaXIsLCIN
CisNCitTID0gIiR7V09SS0RJUn0vZ2l0Ig0KKw0KK2luaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZp
ZyBzeXN0ZW1kDQorDQorRVhUUkFfT0VDT05GID0gIiBcDQorICAgIC0td2l0aC1wcHBkPSR7c2Jp
bmRpcn0vcHBwZCBcDQorICAgIC0tZGlzYWJsZS1wcm9jIFwNCisiDQorDQorU1lTVEVNRF9TRVJW
SUNFOiR7UE59ID0gIm9wZW5mb3J0aXZwbkAuc2VydmljZSINCisNCitSREVQRU5EUzoke1BOfSA9
ICJwcHAiDQotLSANCjIuMzQuMQ0KDQo=

