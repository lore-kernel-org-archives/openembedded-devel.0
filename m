Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82360C7EE23
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 17:56:44 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (APC01-SG2-obe.outbound.protection.outlook.com [40.107.215.68])
 by mx.groups.io with SMTP id smtpd.web11.15822.1685987797946009066
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jun 2023 10:56:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=YVSZDlkV;
 spf=pass (domain: advantech.cz, ip: 40.107.215.68, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2lQ9Oj6diwE0VFZTdnO/8+73jIWTAFCrDGnNHOr9569DvwzI5NaUY7tek4jGmGN0V6he3R47eOMNDgT/EytO8DEmiwCRHBIU8gisJfcB1eDYNtnvRK8HkhdNINHmT+dMqZ75acJghywKN/tbdfucdHiYAeptyjZTGbvM0D+O7Y9KozhFl9osQh9Kc1oGZHvXajm5+UzX1/YeQAqrp2AqANQpd+/jEP0QHXmpoIdogwXXlfxK5U60d/legsqQ+s4qYy+VRIoBfpJ0Cb9dl4tCPZrygL+ewY0FAcNWIlsesRb7cJQNuTA1+v88JWlpKfNuweE7qc+XsFYrfwSlyX+fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vF7S8ULIWVV1l1+ZkA/jMQ/o/iV5Go5QasBSE8/l8IM=;
 b=MwOsbPj4cI2y09AoziqkxcImbNBjpmPw75MrtpL5rI2LUU6o1JpBliZ4Gncn6m4rbLeOYk1yt7iMWYHNrc9hNVWYu/tEfVJJLOHR33znpo8rb0jonXHasVNvy3GXi01tqCFpFWbUzEPUV3EUxPvtkiUuB0Oxzvjp2rj0BiUH4LXLAtaQg+pqjLs5nok18jqGxopxZBs6SfnLgUVn/upaW3wzNIzIcE/3E1ARkG9s9RVYFtHGSshxorXWJ9paIvtH/LvLaLXrrSNcUduoA5HZPSEqM6P+Blz226d+FJCBH4Cj6xnLQdptgcy/goQJKz8BX461cIJDmfoAFqSriE4u/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vF7S8ULIWVV1l1+ZkA/jMQ/o/iV5Go5QasBSE8/l8IM=;
 b=YVSZDlkVMJbu5zql12Rb8+2+CG5vOg6moRtE10C2e8hB/fXn75b7bwKxRLR3g4aW/1igu8mOK+HJafxd1sdU1njjmDLLeChrKqS5hy9tAR9ReM/iU+q0jWKpafPUmyP4E5zYOIH9WGdn2z481bvxjGJwEsSADjLViMkIaSQtYnd1x8zgagqJYf3uX2+iEs3ZjQ8kF97SMZw51b3TOuaKCEnsfax0+W+BwVXV0aY+0KWQLaOEhC3UdkaA0IkaLLeaOFGZs4pCpjMXcwPsQW4xrV5Z25oh902AN3OqkE0JRgkXgg3O8ccSxFR0aONlND9m9w71Rf9NOjhOEREWUl7DDg==
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com (2603:1096:404:b7::12)
 by SG2PR02MB5843.apcprd02.prod.outlook.com (2603:1096:4:1b7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.18; Mon, 5 Jun
 2023 17:56:32 +0000
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::92d1:234c:7ffa:27b7]) by TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::92d1:234c:7ffa:27b7%4]) with mapi id 15.20.6477.016; Mon, 5 Jun 2023
 17:56:32 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] firewalld: upgrade 1.2.0 -> 1.3.2
Thread-Topic: [meta-networking][PATCH] firewalld: upgrade 1.2.0 -> 1.3.2
Thread-Index: AdmX1osCSC9m4NmjRNetfHv+qaEGog==
Date: Mon, 5 Jun 2023 17:56:32 +0000
Message-ID: 
 <TY2PR02MB3678FC4C459691FAE198A727814DA@TY2PR02MB3678.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR02MB3678:EE_|SG2PR02MB5843:EE_
x-ms-office365-filtering-correlation-id: 668d8664-476b-4dfc-94d6-08db65ee3273
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tfW7bFK4SeCflVUVxWXN5z5s4oxWGG39YpVktEUeaT/5rQejG0I37yfzrUpMAVPYZ5l3ForBzooHEUJrtOUx/2wWEqkKiYZcUH92Pu6uYleHqhZX86dNPSfoFpKUbBDFvOMhlFxjn3AG3ZhQmMou1zpq0drHtP9dOLLkP4z2/qXSq+838mxav6SsktwOKi/D9tt3TX4vRnFBuj9kU2VzCsG4pIbkOX3atVNAAwyRLO04zpaGI+wJ4v+wzwyjuIxfiRxIISJJM3nVn5+iMhCJdrjwaMAfojK4OJRIjXtUDU3JVJUcMvwIT6i5tBYzT5leQygAwcxidBqZQLFRPyafONAoZXhJHBuMjYoBsAaULvPBiFzhJ/ON0Jwl3k08l2SMXLn3HNwCVGXoBVN1XysYHVtdg3zRPUJb+8U/TJoLt3JcXEf9ppjEsrx8Rfzo/qjjbTh/9CFJm8g/kMACCj1frMktP5fFFi81F9edJaHyi8wIK/V3vGoEM0ZxOPZGZJQ5CLfLPrj5QjX0sBB6D1MzoCXYg78OxwcNdA9OZ24SiePyFc2rdT4eiv39XCN3iq0yOrYdFb1DVZw5XKQ9xav2VQmrDiZnsrnoR6u/TVZrEb0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR02MB3678.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(366004)(136003)(39860400002)(376002)(451199021)(9686003)(26005)(6506007)(966005)(83380400001)(33656002)(122000001)(86362001)(38070700005)(38100700002)(186003)(55016003)(41300700001)(44832011)(2906002)(66446008)(478600001)(76116006)(66946007)(66476007)(8676002)(6916009)(8936002)(64756008)(316002)(52536014)(5660300002)(7696005)(71200400001)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OVVCMCtqdVc1T3JZZTJoTktGS09uRC9LNTE5QktIMTB1b3JWVXFveEhST0Mw?=
 =?utf-8?B?eHVXYnBRckVkWmdueFl5UFZTUVRMbWEzdklVOEZ3dTRxelRCZVJkN21hampn?=
 =?utf-8?B?aGUrRTlZL2VCMDhwc2ZzdFpLM01GYjhaL3p6Mk5RcGVCN1Fnb2U1a3lLYmJz?=
 =?utf-8?B?V1VIbEpsYjJrSS9yYUlubGszU0p0dk1aeFhmMzlZcEx0Nmc5OUNyR0k3ejJG?=
 =?utf-8?B?ZDMrNjU5REY2TWtRbldUZEtybDdGR3pvSkR0WUd4WnAwelhRQnMwZjJBOFdl?=
 =?utf-8?B?ZGllZEVYNSswTVNJRkZ2djM2MzFjQS9DRWdBbDEzcHVNNzZ3SmQvaFRUVnNu?=
 =?utf-8?B?V2hQcktkTEEvcUV5RjhEWVBZd3l1UzhDTHpCMUxZdEovL1pGcHZoKzVDWTlm?=
 =?utf-8?B?a2d6eVQremcrNWl1MzRUWUsvV0tFQmRrTzVNN1NaV2RsNC82SVRRK3ZiR0Vs?=
 =?utf-8?B?RW9DeTFOb3pRZUxMVStWMDlwY092L2MzTFVjTStHdGlnNVlqS1B5TEpxUEYw?=
 =?utf-8?B?OFUzS1VLczEzKzJSTjVpdXdDWFdOejI1QklOWFhUdTlpQzdtbCthV0l4S09q?=
 =?utf-8?B?ODdQVDhDSVI4YkM1OXVSbDZsUVdmdkJmWTFqYmpFTGVYN0lLdldkQ2ZyN3lq?=
 =?utf-8?B?QTU5YnJNMVJOUklmMnVBMUpYZjhwaXptYTdDYm5QU3U4bStTUTkvdExVWks5?=
 =?utf-8?B?M2lTdURJQmhHUnlVZGtXWnB4akQzV1h3M25XQy9xMlltVWp2RXVNR0E1KzU5?=
 =?utf-8?B?d21qckxNMDlYbm1WYzMxNEpSclZKckIvNTRSVWJUY29UbUl1YTRUWFBNWmk5?=
 =?utf-8?B?SkNTVjlxa1pJdGw4aXg3dVUvdndBRElRSzZ3ZDdEeWZXb0plZ2d1VExoaWZk?=
 =?utf-8?B?Ymc5L3BhNlVVRjJaODM3K3AxOUNOeU1SdnBJOEdWaGhJSU1NdFFxYVpqRk5S?=
 =?utf-8?B?N09ZTzFFVVE2K1ZZR1AvRUFuQXZ2ckh0UUNxdzc5c0NyUTMvaVMxdzR4YWp3?=
 =?utf-8?B?THdZTlZnZmFkbHFiWDJiejJFcE5GRTdXM1VFL2FQd0FqOVBXUHFZMlVWdkdR?=
 =?utf-8?B?MEdWY2IwZEJFcjRUUFljcTNhVnZaeHl3VkpMUzdxTExGK21iNVoxdlpQYm9z?=
 =?utf-8?B?SUZrSWxKU3NnVCtlN3dTdVp3SFZqK0NMMXZ4RHM2VFFWZ0pyQ1BKUSs5WGJl?=
 =?utf-8?B?L2FwUFdXY0R6Q2d3bTBPeHhNM0hBRVJpcjBzT04zUmJYekt3L2ljSHgvQ1Fs?=
 =?utf-8?B?NkVtWDZPeGhucllrOVRReTJnMW1XL2xzdk51UFdtU213d0NuWjgySVBuSW1R?=
 =?utf-8?B?aTJmbmlaZldXaGlqQ0E1K0VBUm9CL240Sy9qNFJ1Sjhsc3dGUWhHNEpPMzV2?=
 =?utf-8?B?Y0ZiUWt3MjVDTGZVNjJFbGhhVWkwaDBkSFBUelVPb0NnYWhMd3RXTTR0a2oz?=
 =?utf-8?B?bmJweEhaNUNFVDNBNHpLSWowVWExT3QyUno2eHZNanhCS1FvZ2xaQXhVdHky?=
 =?utf-8?B?ZCtPUUJPdHhaN3B2Q1NNUkkzekdwODlHTEl6V1M2TDh1dmlXRVN4NEdDQjFQ?=
 =?utf-8?B?N29OY0JmOFArRkpXY0hIdG44VmZqS25aRlpRYS9VUGc2YUs3QVpmcWdMeVhW?=
 =?utf-8?B?Y3VYb21kYUc0YXJJZXRTMHNQZThsYVk3LzZlTGp4QTFsb2FEcHEvb01MQnFh?=
 =?utf-8?B?aWVPaG5MeTNneVJONzNvRkZFMDlzd083YTlVM21FTGFDN0pRcWtvYVpOcHFH?=
 =?utf-8?B?em9NWGppNEVJeWZON0Q1SnU2QWNkeGpYWkZYdlNpaHpGY2IvcWNnUEExMWxX?=
 =?utf-8?B?QkpCV0pTQ1dlaXUvNVJQSGFmblZ0Y3NzNzg2aDRVTDVaOXp0L3FqWUdVZ0kv?=
 =?utf-8?B?MWlCNWxQQ3RmN0haVXhPRXFiSExReE1XZFR0dzY0Mi9pUlNZYUxQQ0cyblYy?=
 =?utf-8?B?czd0SlAzYTU1VWJydjgvTFJpczh6VTJWc3AxTEFCc2tnT09TZFF5cTByWldY?=
 =?utf-8?B?SE94QlQ0TzJQWHd0aURyanVTWDk3SGpmSVVnRHBOczVRZHVWNXhJSnVLbVow?=
 =?utf-8?B?YmFOUkNEWVRXWUgzOXp3cVhUTkZNMVZqOUp2czlHNXF2QTN3RndVcWtPSkdt?=
 =?utf-8?B?MUYzNE5tWnV3NTgxMW1USk1yZTNYQTM4RmVLcVBuMkFYam5iazI5WHJzQ1ZW?=
 =?utf-8?B?U3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3678.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 668d8664-476b-4dfc-94d6-08db65ee3273
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 17:56:32.5817
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o3HoAuNPoQrkGC4O6MvWgBd/oB6FcTOAoRoqcfApwXv6jRpmbHPWEWZGlfpIb/USyRgweEiT6GtR+ODhXcZ55BH3+Kcwk957PhEBa7/jmXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR02MB5843
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jun 2023 17:56:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103129

QXBhcnQgdGhlIGJ1Z2ZpeGVzLCB0aGUgMS4zLjAgaW50cm9kdWNlZCB0aGUgZm9sbG93aW5nIGZl
YXR1cmVzOg0KDQogIGZlYXQoc2VydmljZSk6IGFkZCBXYXJwaW5hdG9yICg2ZGUzZjE4KQ0KICBm
ZWF0KGRidXMpOiByZXNldCB0byBkZWZhdWx0IHNldHRpbmdzICg0ZDMyN2M1KQ0KICBmZWF0KHNl
cnZpY2UpOiBhZGQgYmFyZW9zLWRpcmVjdG9yIGJhcmVvcy1maWxlZGFlbW9uIGJhcmVvcy1zdG9y
YWdlICg3NTUyMDk1KQ0KICBmZWF0KHBvbGljeSk6IG1hc3F1ZXJhZGU6IGFsbG93IGluZ3Jlc3Mg
em9uZSB0byBoYXZlIGludGVyZmFjZSAoZDhlYmUxZCkNCiAgZmVhdChzZXJ2aWNlKTogYWRkIE5l
YnVsYSBzZXJ2aWNlICgzZjU5Y2U5KQ0KICBmZWF0KHNlcnZpY2UpOiBhZGQgQ2VwaCBQcm9tZXRo
ZXVzIGV4cG9ydGVyIChlZjlkNTFmKQ0KICBmZWF0KHNlcnZpY2UpOiBhZGQgT01HIEREUyBzZXJ2
aWNlIGRlZmluaXRpb24gKDlhZDNkMzcpDQogIGZlYXQoc2VydmljZSk6IGFkZCBsbG1uci1jbGll
bnQgc2VydmljZSAoMGFlNzY1YykNCiAgZmVhdChzZXJ2aWNlKTogYWRkIHBzMmxpbmsgc2Vydmlj
ZSAoNmQxNTg2YykNCiAgZmVhdChzZXJ2aWNlKTogYWRkIGRlZmluaXRpb24gZm9yIHN5bmN0aGlu
Zy1yZWxheSAoY2FiMGQ0MykNCg0KU2lnbmVkLW9mZi1ieTogUGV0ciBHb3R0aGFyZCA8cGV0ci5n
b3R0aGFyZEBhZHZhbnRlY2guY3o+DQotLS0NCiAuLi4vZmlyZXdhbGxkL3tmaXJld2FsbGRfMS4y
LjAuYmIgPT4gZmlyZXdhbGxkXzEuMy4yLmJifSAgICAgIHwgNCArKy0tDQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCiByZW5hbWUgbWV0YS1uZXR3b3Jr
aW5nL2R5bmFtaWMtbGF5ZXJzL21ldGEtcHl0aG9uL3JlY2lwZXMtY29ubmVjdGl2aXR5L2ZpcmV3
YWxsZC97ZmlyZXdhbGxkXzEuMi4wLmJiID0+IGZpcmV3YWxsZF8xLjMuMi5iYn0gKDk5JSkNCg0K
ZGlmZiAtLWdpdCBhL21ldGEtbmV0d29ya2luZy9keW5hbWljLWxheWVycy9tZXRhLXB5dGhvbi9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9maXJld2FsbGQvZmlyZXdhbGxkXzEuMi4wLmJiIGIvbWV0YS1u
ZXR3b3JraW5nL2R5bmFtaWMtbGF5ZXJzL21ldGEtcHl0aG9uL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2ZpcmV3YWxsZC9maXJld2FsbGRfMS4zLjIuYmINCnNpbWlsYXJpdHkgaW5kZXggOTklDQpyZW5h
bWUgZnJvbSBtZXRhLW5ldHdvcmtpbmcvZHluYW1pYy1sYXllcnMvbWV0YS1weXRob24vcmVjaXBl
cy1jb25uZWN0aXZpdHkvZmlyZXdhbGxkL2ZpcmV3YWxsZF8xLjIuMC5iYg0KcmVuYW1lIHRvIG1l
dGEtbmV0d29ya2luZy9keW5hbWljLWxheWVycy9tZXRhLXB5dGhvbi9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9maXJld2FsbGQvZmlyZXdhbGxkXzEuMy4yLmJiDQppbmRleCA5MTBkODJmY2Q4Li41MjE1
N2NmOWE4IDEwMDY0NA0KLS0tIGEvbWV0YS1uZXR3b3JraW5nL2R5bmFtaWMtbGF5ZXJzL21ldGEt
cHl0aG9uL3JlY2lwZXMtY29ubmVjdGl2aXR5L2ZpcmV3YWxsZC9maXJld2FsbGRfMS4yLjAuYmIN
CisrKyBiL21ldGEtbmV0d29ya2luZy9keW5hbWljLWxheWVycy9tZXRhLXB5dGhvbi9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9maXJld2FsbGQvZmlyZXdhbGxkXzEuMy4yLmJiDQpAQCAtNiwxMSArNiwx
MSBAQCBMSUNFTlNFID0gIkdQTC0yLjAtb3ItbGF0ZXIiDQogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9YjIzNGVlNGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMiDQogDQog
U1JDX1VSSSA9ICJcDQotICAgIGh0dHBzOi8vZ2l0aHViLmNvbS8ke0JQTn0vJHtCUE59L3JlbGVh
c2VzL2Rvd25sb2FkL3Yke1BWfS8ke0JQfS50YXIuZ3ogXA0KKyAgICBodHRwczovL2dpdGh1Yi5j
b20vJHtCUE59LyR7QlBOfS9yZWxlYXNlcy9kb3dubG9hZC92JHtQVn0vJHtCUH0udGFyLmJ6MiBc
DQogICAgIGZpbGU6Ly9maXJld2FsbGQuaW5pdCBcDQogICAgIGZpbGU6Ly9ydW4tcHRlc3QgXA0K
ICINCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjhmZDkwZTg4YmRhMGRmZDQ2MGYzNzBmMzUzNDc0
ODExYjJlMjk1ZDdlYjI3ZjBkN2QxOGZmYTNkNzg2ZWViNyINCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiYWJhMGQ4Y2U5NjE3YjkwNmVhNDg2NmJmMGJkZmIyYzJkNTMxMmY1M2I4ZTllOGU5ZTRkNDli
ZjMzMGRhNWI1ZSINCiANCiAjIGdsaWItMi4wLW5hdGl2ZSBpcyBuZWVkZWQgZm9yIEdTRVRUSU5H
U19SVUxFUyBhdXRvY29uZiBtYWNybyBmcm9tIGdzZXR0aW5ncy5tNA0KIERFUEVORFMgPSAiaW50
bHRvb2wtbmF0aXZlIGdsaWItMi4wLW5hdGl2ZSBuZnRhYmxlcyINCi0tIA0KMi4zNC4xDQoNCg==

