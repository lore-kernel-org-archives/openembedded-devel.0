Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D8ACD98CE
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:35:51 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50710.1781195745248402318
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:35:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=KZXTLEv7;
 spf=pass (domain: axis.com, ip: 52.101.66.48, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DUjzo3BsOaPwK3fxqLMws+t7ElPbnp/wrEGu8uvK/1XOx7R3NXANS7FkAOXQ/o405a923x2Em0lOlQ7GAeiqJPwsfKKTcWOx2sF5n6/Z+b4fw4UkqQxJh75BB+j/0J2l50PteIhcyhPQiqLD0Qa4y1BKjy2OyMQndKXyx6HFSVhSHjnr4myJBQEkRmeQUeaxyklR403Hf1YlM1GNyJVvURlSzqI6yeoRKElawqwas6Lk+FLx2WbqSd/NK9JfbqjaTBUtz17Ahd9rYr3ErqAnp/KSTqpb2/lna7scCPpm3Ycr4IaHAADz5jGZb9Rvhj62qGR/4qCDIfR6Grj1h4U7ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhrkZXeJKcNfzSaEM4K+7VrGkFvIthU4fy6NslR0Zpk=;
 b=aKr5g6vobK8qfCsVdCUVSy8gcBek0f3zqXoDqQif4YBa5hX4hZ6ZD1kYc2Lvn3fsartBXkdlHWZm0wh/EysHlTLZeCTIrvqDPaBFiBBJdW7D7493SeAaczFfaUv/LJjAwSuxkWr6HCbalFEU+YEt2X7WT8bvzmuobti/KAT5yCvb+Zbbq8I1VXVoPvRnfewlho4JX4BsyZ1pes/auvUk0FKnsi30AkXBBGK90lh7+nLKWWehxnBHH0tckdHVAKJIPpnxPOdrlXYnvmBOUWUFvN/KYttrlzgEom+G5H3fBBg6BFZem8KetXJ9MGrTb+3V7in85Z2QHvRqodqdW5rBTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhrkZXeJKcNfzSaEM4K+7VrGkFvIthU4fy6NslR0Zpk=;
 b=KZXTLEv7r6zfwWIA9tkopmRGDJmLBDnl0LKTr/q/qEAVadn5MnnJb6buXJp1hsIyMyF0OmX0qOI/zXMdc33iOBUpX8DwOwEp7xPtsBA4J6fP+pjXCDvPXUS5jbPxGQwFBm6uIdBjhGAJIy1JBmauc2elBlo2cdMy8embL+m6EcQ=
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com (2603:10a6:20b:63d::6)
 by PAWPR02MB10000.eurprd02.prod.outlook.com (2603:10a6:102:2ea::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 16:35:38 +0000
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::670:3815:35f6:ba2c]) by AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::670:3815:35f6:ba2c%6]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 16:35:38 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"raj.khem@gmail.com" <raj.khem@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: RE: [oe] [meta-networking][PATCH] python3-scapy: Replace
 oe.utils.all_distro_featuresc with bb.utils.contains
Thread-Topic: [oe] [meta-networking][PATCH] python3-scapy: Replace
 oe.utils.all_distro_featuresc with bb.utils.contains
Thread-Index: AQHc+B8k/iNOORgeJUK6z32afKKeT7Y3jY0AgAIA1fA=
Date: Thu, 11 Jun 2026 16:35:38 +0000
Message-ID: 
 <AS8PR02MB10201184CCE7BEA3F46D555B5EF1B2@AS8PR02MB10201.eurprd02.prod.outlook.com>
References: <20260609144855.1473568-1-khem.raj@oss.qualcomm.com>
 <e036c6714991459d21fafd6993fa9495b6d92d9f.camel@linuxfoundation.org>
In-Reply-To: 
 <e036c6714991459d21fafd6993fa9495b6d92d9f.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR02MB10201:EE_|PAWPR02MB10000:EE_
x-ms-office365-filtering-correlation-id: 05a8de36-e11a-4979-ea85-08dec7d77837
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|6133799003|38070700021|18002099003|22082099003|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info: 
 nCzNEjwGirycDH42Yh9CdLtR//Pf3ybd/jIM3eLjU6qbGAvqttHwOlgCglYdG+KcervnUa1Pdo3U1GgMKKeRXY6O2vFdni0Nx2P5qil5duv20pVswcVj6oKdTYpCg0B4Tojaa961kbIJ0J1xBHg5r9+mQOi+uIV1sOh+73uZKf0GWHv/+ZHCDYE7+RRJSlU2DX4lLCSGT2TVVA72QMq9b7r6PdQbHt0IOihguZBTnZx80F1ixBY63350bayQ6WLcX0jbxmCjCJkrumi0e2HNbiObCkK+Ah1vFCnzAkO2HHWotkhRY1BXFTK+N7vOUge3bq+AWcMHAnq+mRP6/R3dAan9e526MoB6oF41vyupxk3XgJKY/rz0IhnQVTiZGKxuglUwu5jT9v/bJKY6T5KCrZOm9BoUSePlVBUg11KAGRtLv6Qo2n0DdNZrY3ex/2qeIwIuUpjvv6DCeqt/u3SxbeFpw8apduyi+BrkoH+YooCM3vLX9L3xwxQ6TBFzwzUjkEmt7RPM8141EEk4c/UkJHoDump4leQFvuFVB0EdUne6V7//hmoSsJ2RHj+2/Av6QymDPax3ygmMdpgqXcL6+zBxvQYJRU6eavMowKfLgs6uAvAtfQikmOFVXjr26Bf3jG6y1AEs6CY/+GbZ1kkwxrtxy1oj6Yq2hfSedXysOgm6DPYXyA5Gd0N99aZwaT0Be6g0qPGhgKMyQ0jxe3+ORG1NE4xduvdiwt3SPaP/DNml/XishQEvMCz3/ALsrvZ1
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB10201.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(38070700021)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WmQrRllFWkJGRS9hRXY1eEhPa0NrZVhHUUVQWUI2Y2tzNTBScHpodFFMYTFB?=
 =?utf-8?B?d2E2aVZGSnpoOFlrRnlGeWZlKzB0NmdVdG5Ba1FqbEZ0MU1YNVB5U1ppWC9N?=
 =?utf-8?B?VEkySHFpcUViZ0RObVArcE5oMGpNMjhiQnNmeDc1a0FsUEhuZUhKdVdRcWZr?=
 =?utf-8?B?YmRhQ0QzK2g5eXdpRkgyS3BRajZNRWRtYkYzNUJLMGUvMVRLTDJOSnRTbUJ3?=
 =?utf-8?B?L094YnJPQ1R2djBBSjJpR3haRGFDS3A4OVloam5CMlNYTUx4a20zYlAzTWox?=
 =?utf-8?B?Sko4M1pjN1F2clMwZkM0d3BnOGJpbXViS2l5dlkyTG9NZ251b2ExV0Z0bWto?=
 =?utf-8?B?ZTVIRXRNSjFiRk15bGU2UGNvc2Z3R3FnK0owR0cwVVJUSDVJWmd0cG5oQVZo?=
 =?utf-8?B?N05PQ3FLeUxoMWVYUHJBaFBnbWxiby84OUVDVmduWGxyOGRDbDBwb2lJK3N3?=
 =?utf-8?B?T0hiN2poWUN3RlFzVkJxT2wySS9EbkEvYWNTZ0VFM3Znb0NxUWZGYWxGOFFN?=
 =?utf-8?B?dzUyOXJvc3J6OTNHVzZDdTBKZjA5RzJVVHljWGpYcE8rSjltN2tac29IUWVI?=
 =?utf-8?B?ZGVJbjNlU2orbzVqbFBqUVBwYmpDTDNUQlo4ZzVRZDcycDRCTE1kRFk3dlR1?=
 =?utf-8?B?dm1LYm5vUjg3NzI3VUhYUjdqMjdhQ2dCb3pPTjBMWlBrWG9ZUExDWUV1QUJi?=
 =?utf-8?B?S3ptdVlleHFBTHRvN1l3K2s4MytzYi96N2R3R0dJTmxieU5DMTBPa0hNaXhX?=
 =?utf-8?B?T1hkYXZVdWRBdWdaVzV5dWtZNnhuN0hoN1kxR0tNU2lsdWRqRGJLWG0zWDRz?=
 =?utf-8?B?WlQrYWJ5WXA3S0dqNzI1WE1aRXp3azRJcG9qMGJrODRvNFpoS0ZoUW95c25h?=
 =?utf-8?B?d09CdHFJR0srdFJ1WjIzZGRNZ043YkJscGp0OFVla3BQZk9PUzRVcGxJK091?=
 =?utf-8?B?d2Nlckp3SW5kYWtBR1RHUWhlZGtreGNVUFJMMXJScGtGSzhYWDIyVXppRUoz?=
 =?utf-8?B?eFovUkxFSGdTU0dxSW8ycnZPYWtsQ1ZoNUR5Q3g0WGJIa0JKNHhzNit0Qy9r?=
 =?utf-8?B?RFppdm9veGg5MmhGTmlhKzEzRUx4cWgyRmtkS1VadERDZXJiZThROGhnYTRO?=
 =?utf-8?B?T3EzQXVYQ05VZlhaVnNPZmdITllMa01CYURLMjlhaThSaDVLWTVCaUVEaCtt?=
 =?utf-8?B?TXVMUXhMbmV3OHlrNzBKUmZtZ0hqRlJJQ1ZDaUJaU0hIa1d0K0pRRVZXWUJS?=
 =?utf-8?B?VHJrem9JZS8ySVpWdE5RcXVETkNRbWtDRGE5Y0kzSHNsZlpNZmhsdEY1S2M4?=
 =?utf-8?B?SmZVSEpjVFdqYVZBNTZMT3VjMnJjczBKZUdJei8rbjFWRlFIbkc3ZXpISHBF?=
 =?utf-8?B?aUtYcGQ4SytmMFlHdUtqYnF2SEVPaDZNUzhGTkZQRm5vdUVFMEczYzRVK0pD?=
 =?utf-8?B?eFJhRVVOV1MvY2xiZ01HNkhGK0VTQVVqc0pBVll5Z0ZIUEpLZDNydjVTSlla?=
 =?utf-8?B?YVVMT0h0Um1MNHVzVFZEK1M1Tkk3a3FmR1UyaDM4cEdWUktranE5TjQ2Wkx0?=
 =?utf-8?B?MktqSVMwbjhHSVJ2dE10U2RFNHlySTFncWFzUTlXZkpxQkloeC92eUNMa1dG?=
 =?utf-8?B?MUhPVDBzbkhERUs4QUtza0czSjBURWdMUUNUR1V2NWQ2VTJsQzcxNmpLTVl1?=
 =?utf-8?B?cHpaTmprRkhMVEtoT0YraGVTd25mbDJSdU5qOFZrVXMveXR1VHBzSDR3cHps?=
 =?utf-8?B?VWFTaktPQklRa2hkYjh4Tm9SQ2Q0M3BWYUtHU2Zjbm4reXVCVEk3a3ZzMDQv?=
 =?utf-8?B?VXV4dUhPQW5GZXVjdUtGREhLZHN0WXpkZnFTL3R2ZVgwYXVnb1JlV1kwTzdw?=
 =?utf-8?B?QVFsK0VERG43SzNmcUY0TCtFcFB0dkF4SG82UVpOT0JidFhHcnl2K1NpVUIx?=
 =?utf-8?B?VFJ4djFtY1ZLZFhIN0JzU1c0TjZMYVRNT2pKaUhramNOOXFCTU8wT3Q2cUFq?=
 =?utf-8?B?SHRMRE5ZS3YwVFE4N1IvczRYR0hOSlFnOXgvdFcxV05ka0xGdG9zcjVsM0cz?=
 =?utf-8?B?QUZBNEc0L0luKzREdHRDdzR3S0JyVzBLY3lDTVJWVEFTeUJpeGxqamlvMU9P?=
 =?utf-8?B?VHcwd2RtejZsTTlQZnZITEZmUGJhcEw1R3RhYXFsaUFtN01SS05veFBYb3RL?=
 =?utf-8?B?WXBHMXU2WWZGVEMrdEF0NWwrU1ZVbFZBd1MyRklUSWRybWp3N2NDYjhncmlq?=
 =?utf-8?Q?oXc8dmg5aF+zl3WxzTb8aY6gvCLm3lhGLBrZHuRABE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB10201.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a8de36-e11a-4979-ea85-08dec7d77837
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 16:35:38.1127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MBKsPrZqr6+s+HMXkNI3gEiCOP3fv+M7nwQlpBJQk2IUnoozsslL7KIF1Wodjn3w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB10000
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 16:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127532

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWxA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBSaWNoYXJkIFB1cmRpZSB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiBTZW50OiBkZW4gMTAganVuaSAyMDI2IDExOjUzDQo+IFRvOiByYWoua2hlbUBn
bWFpbC5jb207IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IENj
OiBLaGVtIFJhaiA8a2hlbS5yYWpAb3NzLnF1YWxjb21tLmNvbT4NCj4gU3ViamVjdDogUmU6IFtv
ZV0gW21ldGEtbmV0d29ya2luZ11bUEFUQ0hdIHB5dGhvbjMtc2NhcHk6IFJlcGxhY2Ugb2UudXRp
bHMuYWxsX2Rpc3Ryb19mZWF0dXJlc2Mgd2l0aCBiYi51dGlscy5jb250YWlucw0KPiANCj4gT24g
VHVlLCAyMDI2LTA2LTA5IGF0IDA3OjQ4IC0wNzAwLCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyB3cm90ZToNCj4gPiBvZS51dGlscy5hbGxfZGlzdHJvX2ZlYXR1cmVzIGlzIGJl
aW5nIHJlbW92ZWQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8a2hlbS5yYWpA
b3NzLnF1YWxjb21tLmNvbT4NCj4gPiAtLS0NCj4gPiDCoG1ldGEtbmV0d29ya2luZy9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNjYXB5XzIuNi4xLmJiIHwgMiArLQ0KPiA+IMKgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c2NhcHlfMi42LjEuYmIgYi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1zY2FweV8yLjYuMS5iYg0KPiA+IGluZGV4IDY3OGFlYzAxMzUuLmZhYzE0MjIxYzUg
MTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtc2NhcHlfMi42LjEuYmINCj4gPiArKysgYi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zY2FweV8yLjYuMS5iYg0KPiA+IEBAIC00Miw3ICs0
Miw3IEBAIGRvX2luc3RhbGxfcHRlc3QoKSB7DQo+ID4gwqDCoMKgwqAgIyBub3RlMTogaWYgaXB2
NiBpc24ndCBlbmFibGVkLCBza2lwIHRoZSByZWxhdGVkIHRlc3QgKGFkZCAnLUsgaXB2NicgYXJn
dW1lbnQpDQo+ID4gwqDCoMKgwqAgIyBub3RlMjogdG8gbWFrZSB0aGlzIHRlc3Qgd29yaywgeW91
ciBJU1AgYWxzbyBtdXN0IHN1cHBvcnQgaXB2NiAtIHRoZSB0ZXN0IGlzIHRyeWluZw0KPiA+IMKg
wqDCoMKgICPCoMKgwqDCoMKgwqDCoCB0byBwaW5nIGdvb2dsZS5jb20gdGhyb3VnaCBpcHY2Lg0K
PiA+IC3CoMKgwqAgaWYgWyAiJHtAb2UudXRpbHMuYWxsX2Rpc3Ryb19mZWF0dXJlcyhkLCAnaXB2
NicsICd0cnVlJywgJ2ZhbHNlJyl9IiA9ICJmYWxzZSIgXTsgdGhlbg0KPiA+ICvCoMKgwqAgaWYg
WyAiJHtAYmIudXRpbHMuY29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycsICdpcHY2JywgJ3RydWUn
LCAnZmFsc2UnLCBkKX0iID0gImZhbHNlIiBdOyB0aGVuDQoNCkZvciB0aGUgcmVjb3JkLCB0aGF0
IGNhbiBiZSBzaW1wbGlmaWVkIHRvOg0KDQogICAgaWYgWyAteiAiJHtAYmIudXRpbHMuZmlsdGVy
KCdESVNUUk9fRkVBVFVSRVMnLCAnaXB2NicsIGQpfSIgXTsgdGhlbg0KDQo+ID4gwqDCoMKgwqDC
oMKgwqDCoCBzZWQgLWkgJ3MvVVRzY2FweS5weS9VVHNjYXB5LnB5IC1LIGlwdjYvZycgJHtEfSR7
UFRFU1RfUEFUSH0vcnVuLXB0ZXN0DQo+ID4gwqDCoMKgwqAgZmkNCj4gPiDCoH0NCj4gDQo+IFRo
YW5rcywgIEkgd2FzIGdvaW5nIHRvIHdyaXRlIHRoYXQgcGF0Y2ggYWZ0ZXIgeW91ciByZXBvcnQg
YnV0IHlvdSBiZWF0IG1lDQo+IHRvbyBpdCENCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQN
Cg0KLy9QZXRlcg0KDQo=

