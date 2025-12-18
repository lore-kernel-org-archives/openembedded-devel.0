Return-Path: <m.schwan@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9026D68BEE
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 08:25:12 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.132])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37080.1766046304582829218
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 00:25:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=DWO6JyHa;
 spf=pass (domain: phytec.de, ip: 40.107.162.132, mailfrom: m.schwan@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u9sgT6NrXHP0WBqjvdnHm8tUghHfdM/3z1CgOu5cqUZIIskemIhyEkqnKWryeqs7hldKynX8eJJIghe7AM3dfXZ9Ddk5e0/yTNhbYDaFpn2R4yZVqOJJteiAVdUoDHr1EfAaFSJh88/3Jc2Zo7mmeHL910T+I/YSjRGIvDYxWEb4Uz4TNC0ZTSJ+osqzR+A+rCdrI2jP3FuUQJ7eNSb8v5R+uNTV3d+j9gSwdeUCPB89/656fpowwkkfoNzRKhWZeJziRy/foBFXzrlBkVxWz1nU+uYOA7qHzPHaK0lM4aTFZmLOrmV/2NYnKATqHdFZBlAvad+Vaqmm+h5aAVkIjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFDd4zfngKJrRHazHoVY9QPaVBG72n9cU7KTbiw/QVY=;
 b=swu8vWR2VYkh/3uduezNRsGHszhPEF2xCtTnh4Qne3SpAD1tG2cYIDXBpQqdDRlpvUA+Y8r9/E+nse+c7LmBQ0CQaKsYQSyasdNubHfYeziM/loGcJsaZYPQueUxpPyo/t/IQvkB8yVOc/D8P5+AI4GLnRNsN1K73yxFxCC0z9UYYbWunkzNOncPtgH2MpI3LZngHus4nZsvLsx9FfhfYqHkhYGiX8cNUfDdy2O+4VS7wAD1nV2F3yWbSV+SXC+5K4GWivibqnTWaZ/Uxp04oAIIa3YBnwVDLdw0SQinE2gwWk+7Q/VW1mSFB1Ujs4ZwhW4GddmED9maUsMHnQN+ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFDd4zfngKJrRHazHoVY9QPaVBG72n9cU7KTbiw/QVY=;
 b=DWO6JyHa08VpNpAWR3deSR5e2pIp7HhN0NOXGLk9XsEX0LOEy5Mr9iSNo/QEFgRAY2nLuvdw7KBAl+L36teyGRqymKDXU0sG/zk3/AvNL+KhAm3QDzXLa5Il5XprS88GkXVJhKoYSjE7W7jn98xikoekXGqs2+APLAF/Pf7DNlTajFleBMJLejryQviLwgvG8wtaD08qcpge55Et7zTbz/UXMXFI5pFF3a1MwYqFEvTKdZtBpCeuit5tTc/9f4X4ZWFalHwuFPBImJjXnU248aARbWxJVr7B7dhhsBQ2YAhWGI5L+0o2E7XIN6f09gZeQ0q9NpjOZOXC2CI/5XkFeQ==
Received: from VI2P195MB2489.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:22f::12)
 by DU2P195MB2465.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:49c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 08:24:59 +0000
Received: from VI2P195MB2489.EURP195.PROD.OUTLOOK.COM
 ([fe80::83ab:361:2a81:b582]) by VI2P195MB2489.EURP195.PROD.OUTLOOK.COM
 ([fe80::83ab:361:2a81:b582%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 08:24:59 +0000
From: Martin Schwan <M.Schwan@phytec.de>
To: "ankur.tyagi85@gmail.com" <ankur.tyagi85@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] thingsboard-gateway: upgrade 3.7.4 -> 3.8.0
Thread-Topic: [oe] [meta-oe][PATCH] thingsboard-gateway: upgrade 3.7.4 ->
 3.8.0
Thread-Index: AQHcb4al6sb2kSEB0UOblflKQFJzZLUnEIuA
Date: Thu, 18 Dec 2025 08:24:59 +0000
Message-ID: <4f9b1f95484016c4bfb080c0f925ef66bdf0a100.camel@phytec.de>
References: <20251217093235.3469955-1-m.schwan@phytec.de>
	 <CADySD0Hk82EA+vMqGz31jibMbTbcnKr92Uhf_N2x5WH4tqvZ6Q@mail.gmail.com>
In-Reply-To: 
 <CADySD0Hk82EA+vMqGz31jibMbTbcnKr92Uhf_N2x5WH4tqvZ6Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2P195MB2489:EE_|DU2P195MB2465:EE_
x-ms-office365-filtering-correlation-id: d811dcc8-e936-4d37-8cbd-08de3e0eef53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?U0JzQ21ndENqVjBlbTcxS1RtZnJSRklYMzhlQ1prSEFyTXlPZ3FLOHI2Z3lo?=
 =?utf-8?B?RnN0MUZqMDFINlFyQWZ1bEkyOFhFTTQxc2FqYlhWQzFEZGNBaWp1Z1Z2dlRT?=
 =?utf-8?B?ajJSNnMxYzROS3QzNDFXUzVZYmJ2Y1hONGtWMzRSbjRNZi9KSGFEQll1SjF0?=
 =?utf-8?B?aHhWeHVXY2g4ZENSajY0RHoxT1RXOU9oSjc1bzBaSDB6dDBXQVFKOVNPd0FN?=
 =?utf-8?B?VG95eDArQTZ6dmU3TzdqZEJGcnpKOXo0RWxKQk9iRWJHMm1wNXZrdUY4KytZ?=
 =?utf-8?B?Z1I2R0RGaUpvZ2JlZDFSUnN3MHJmVE1pbFF3MGpmZUpSSStzZFVocUJNUHBS?=
 =?utf-8?B?MnppVFdzWmY2Vk1KaFpEcEQ1T2x4RHlQd3hLejcya0hCUjN6RnZpYTI4N0xT?=
 =?utf-8?B?Z2d2anZaVnNoZXoxWW11NmNVNDlZT0lNc0tmdnZmUTF6MDQ3RHFRUms5RkN0?=
 =?utf-8?B?UmJlRFdnVVkzM0tuV3RORzJyNktwZm1zRGZoRklXV25wdXpFOFBqZnV2UXFL?=
 =?utf-8?B?N2VlMmlsKzJYdHV2RElnd091NkZKRW4xR002bHRWckJCNjdZeXZqWnY1VGQ4?=
 =?utf-8?B?dEFwczRYcnZEUEhqaE02a2w5V3hVZC95TVo2d0ZhM29PN1NReGNOOEQ1REZH?=
 =?utf-8?B?UFpUWkVrUEk3NWpJNjFWWWJwT2tnaFYxZlV3akJMdlBKeGFQdkdQNkNuUUcx?=
 =?utf-8?B?cjBPMHJ6Mm03VVc4WTdCN0RxQ2tzTm1wV3NlelRBdEhpVkNyQnB2ODkxYW82?=
 =?utf-8?B?MjMwV1dmNmlsOWoyc0RJZ1oxVXYxZmRlR2NrQmpWVWQ0bU9rMExrTVdWVS90?=
 =?utf-8?B?MVlGcm1EMVFNSXpSejJwdEQvNXRaMkNXVmk3N2JoU1pPMnlxNnR2OFBxdzRW?=
 =?utf-8?B?bmJheFp1ZXYyTGNtY0ZrZzFEb3RKR0k5Ulc4RVdtNEVFcFExTHJnWTR3cTdX?=
 =?utf-8?B?LzVLayttZ1drNGFiejVUZTQzNk83eDl5Z1F4VjVOT1lNODBFeDhKYzRsRDVx?=
 =?utf-8?B?ekdOcUl4Y08vbzBxOGV4SVNKeFRENnhxSWwrWHYwRDlHVmh3UHo1ejYvdWhQ?=
 =?utf-8?B?b0dZY1ZpMzlPaFpBTUpJam1TbXEzUkJKTEtHMFNkRFFrUjJPQlEvR2hDeUxO?=
 =?utf-8?B?VERKVDVxUS9iekY2S0xqNnY1VEJva3hXd0E5aXFRcm0vYXVxM2JJdmJTRlZx?=
 =?utf-8?B?SUsrcFdNWWVXUDZIYWZ0TEZ6QXZVaXMvSVkzY2FoTlluY05zUTJFL3I0Y1Yz?=
 =?utf-8?B?U3NGaXdPeVU4V05RUXRyT0VXb2s3N3VyNlhjV0xrT3RvNlpocTNUeHA4NGRQ?=
 =?utf-8?B?ZVB2RzVvNUphVEt3SUwvSHRVOUEwQ2JzdzFtQzBZTUJsRWRIeVhydFViZWhE?=
 =?utf-8?B?akk2M2FhWVRoeEdNSDk5WWplemVBMHRtdTFZREVBcGZ1dG9kaC9nMVdZeE1E?=
 =?utf-8?B?MTBZQVJtbEx3V1RaeVVVays2ZVhpaVU2akw3aTZBQ252blFEcTJqNklsZDNV?=
 =?utf-8?B?SzdqVTAzYUkvMjVPekIyMEZ4MWt5OHk3MlI1azR2cElYQjV4VWdsWFlxUG1X?=
 =?utf-8?B?Q0hZckpkN0lFZHhGTUducXJQd2hHZVh6R3pRNEoveGZ6ckpScldPcDhFSnI2?=
 =?utf-8?B?REJqMlJ6MUJ5aEVaVUwvTzhxV0hHdnlBUnI0N3RrNGFiSWVVbXQxSmFxRGZJ?=
 =?utf-8?B?VTZObVVQVHltTzJYNlFqUHlNSExwd2FkKzdSV3hrYkFreVF3REpwSU5Sc0s5?=
 =?utf-8?B?NkFVaVRsZmVCWTdFOStPUGxsQ0FjeHZ3aXNDeEh3WGE3YWdiOXJrcCs4SERz?=
 =?utf-8?B?V3JoYmxkY1B1bCtsNFV2eTE4YmphQmV2Um9jZVBSM0J3VXM4OXRNVW1zazNo?=
 =?utf-8?B?UFRBcG9jOVB0N056ZjIxNllLTE5kYTRRZHhDbkRadUdrTU5YSUw2UFdZMHJ4?=
 =?utf-8?B?UnYraFBER3kwZjEvS3hzRTdvemFlUjV6Tk15dzY3NFRBVm1kZEVmTWhrN2xZ?=
 =?utf-8?B?WTd4ZW5ORzJRPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2P195MB2489.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?a3ZmL0RuRGJPZnJBZU5QbVV1a2grR2dsenRxY0t5Rk9vK0RnZEhnQmVFNEwv?=
 =?utf-8?B?NDVtNnpXdWJzUU5BK2NML214Q0dsOFlVODEwbnM3dTdVT0NTQUpxVXMxYXdy?=
 =?utf-8?B?cFFwSmxOUTBua0x1ay80T0h4ZzZTS1hSdzFLRE5RdDRFSnZseFRQc2hkR1pl?=
 =?utf-8?B?Z0VKS1FJSythNDgzQkJtTnJ2ckdjbzA4Q3k5TDhveS9saE5UdmVITHQ2WCti?=
 =?utf-8?B?VTZsMTJTWjBkd0ozakpidDhjMUhHV1kyYzNpRkl4cWhJTFg4WWl2R1lud2U0?=
 =?utf-8?B?Q3Jxc3hHRm14Z3B6bnlhVEFTN2FmVFhDd2pGZ1ZoaXArb3JUMlJUM21wcmlX?=
 =?utf-8?B?eTR1R1JybCtwOXhsR1FJYWRrNTV1MTR3MEpZcVBRZUNaa3AxYW9iRTQ1Zllp?=
 =?utf-8?B?dmVKbnJoWktMY25KZkIzUjQvOFd3a2J1TkU0cmx1SjkxcXZzaG9iNFdGOFNZ?=
 =?utf-8?B?UTI3L1BXd0E5OXVHcWVxT0MvSUV5RDhSUG5xQ2VFR2haWXROYTJ0TFkzdzd4?=
 =?utf-8?B?M2k5cUJob1pneUhvTzdERjJyR2xwMUZqYk5jN2ZRY0NFQzJ5ZDNKamhyT0sv?=
 =?utf-8?B?UUd5RitrOTFTMjFOZ2NIZ1dNNDZnWjlkTVVaS1Y5WUJISm1yR0RTQ05xbzFy?=
 =?utf-8?B?aHNiYW9XSG4xY1pwcVRYTlArWlpjRHlFTmRBU3BQRjd0T2VTczAvMWxMT3JF?=
 =?utf-8?B?SSsrSTMzOG9PaEg5cTBaSkMzR0dGUTJKVEFqanhDaTlzNGRHamFvRTJ0aHoy?=
 =?utf-8?B?R2IvQ1JHRkRjb1BITDFGdXRxbDlldlNPcHkwL0sxOTUvNW9WbjhKQndMcHg1?=
 =?utf-8?B?aTIwZXc5ZkU0OUtwU0FHTjNtS2JyTXlZWUVMMlhpb0JNY3V0VEVFR2VhZ1VN?=
 =?utf-8?B?M01jVzNDQk5CeWtWMHd1QUU5K2t5N2lIMjZzOXdKMHhWN1Vtb2pvek05WGky?=
 =?utf-8?B?OWNZOVRtVExCVFFYdnUwL2hrRUZxVlhUTVNrdUVlTUZMbC90dzZyK2lxWVRX?=
 =?utf-8?B?V3g0MDRJbVovM2ZOb1dFRGpDQVgranZvajdmN21wSzRxNGlHTVNEeGxGSnpJ?=
 =?utf-8?B?aU1xMi8wZmloZlU3SkZCZVRGMHorNksvNFpWbkZzSExkNU1GYmtyenp3YWhX?=
 =?utf-8?B?aUVwTzJlU3l5T09abHFiclJ4eTd5SllqVUpYUHBVeWdwdGNwOXhNVi93UVlm?=
 =?utf-8?B?cDZ3QkhqYUJYQldFODducGRiZHVpdHIyZTVDMDlKZjRXR2ZHZ3hZTjQyLzV2?=
 =?utf-8?B?QXFQbU9HYWpDbHF4RkpqS2hQZ29sL1dGYlY5TlBLOU5GRGNtNnpmalh4aUlC?=
 =?utf-8?B?a0M3S2RpZEdvVnlkY3JsWnJNYThONVdnbzJnNklwdWN1OVgzYXJmQUdFRE5Q?=
 =?utf-8?B?TFNrNXhPVXVGM0dmSGlGUUozZTFRRExLeG1RR29aVUdFbXpzUjVZNGVOTEdo?=
 =?utf-8?B?amg3dmxwWURza20rVEZXeEhFMkVITDRsK3lmeWs1S05lalpyTWlOYjBNM0dr?=
 =?utf-8?B?N2pWQ1R3SHFveXUyelJYYTJCODBPWUtVampMdy82eTNWNlRPY1lweHVKbmpq?=
 =?utf-8?B?anNGV0lTSXlNZ1lHQ09pbkdkdEJTZ2FNKzFKSlJqSHJyb0ZINGVVblM5WitB?=
 =?utf-8?B?eTh1SXRaazU1RWVNdHgwekpmNjl2QmUyU1ljNHJsdXFqYURWZW5FVFJ6dGhF?=
 =?utf-8?B?VVFsbUd2a3VpZlBqRm96aFdXKzJGTGRPU1kranJQNmhSQUpIbVhFTEc5TmNh?=
 =?utf-8?B?a3pxeUtUS0p2Nk5aOFdtc1lyM0FvNld3OVNVTUhMNHFCbW81Q2JmR2duNlI4?=
 =?utf-8?B?a0V0aDdrenRjV1lpVE51VjhjV25HMS9UME1vVmJiLzFPY2N0ZzBhTDJBWVpF?=
 =?utf-8?B?Wmg2NXYvZVEyTDJCWU9NNUtsWTdUUDJweS9PdDFNZG8zdzh1RVhWazRMOXNP?=
 =?utf-8?B?MW16Zk5vblQ3SC9aMXJ5NVF6Y1pjSkVCRXJzdGxWUkd0UGtzVE9GOUxNL3Yv?=
 =?utf-8?B?aUtqTE5SeXhHRG1ybTB4bUpIUFF3Q1R4MWY5aTV4ckd2emdJMko0VFZGeklZ?=
 =?utf-8?B?OEZ5clBwMjRsYWRnMjQrOEtOUGJTaE1ZWUVPeXMxNm5SVVFLRTcxd0FuM2x4?=
 =?utf-8?Q?YKrk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9720ABC45BEE3F42BD4ADA20BAD83BD3@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI2P195MB2489.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d811dcc8-e936-4d37-8cbd-08de3e0eef53
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 08:24:59.8349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZaZsHG9bXP+9g2afnqBo2F1bR6mIvHjBVBAN7s6M57PS8RG9iOWrOil3ggs4/K6jqGMEt/5WSvfuPoX3UvZK7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P195MB2465
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 08:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122734

T24gVGh1LCAyMDI1LTEyLTE4IGF0IDAwOjI0ICswNTMwLCBBbmt1ciBUeWFnaSB2aWEKbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZyB3cm90ZToKPiBPbiBXZWQsIERlYyAxNywgMjAyNSBhdCAzOjAy4oCv
UE0gTWFydGluIFNjaHdhbiB2aWEKPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxtLnNjaHdhbj1w
aHl0ZWMuZGVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4KPiB3cm90ZToKPiA+IAo+ID4gV2l0aCB0
aGluZ3Nib2FyZC1nYXRld2F5IDMuOC4wLCB0aGUgc291cmNlIFVSSSBtdXN0IGJlIHNldCB0byB0
aGUKPiA+IHByb2plY3QgR2l0IHJlcG9zaXRvcnksIGFzIHNvdXJjZSByZWxlYXNlcyBhcmUgbm8g
bG9uZ2VyIHByb3ZpZGVkCj4gPiB2aWEKPiA+IFB5UGkgZm9yIHRoaXMgcHJvamVjdC4KPiA+IAo+
ID4gU2lnbmVkLW9mZi1ieTogTWFydGluIFNjaHdhbiA8bS5zY2h3YW5AcGh5dGVjLmRlPgo+ID4g
LS0tCj4gPiDCoC4uLnNib2FyZC1nYXRld2F5XzMuNy40LmJiID0+IHRoaW5nc2JvYXJkLWdhdGV3
YXlfMy44LjAuYmJ9IHwgNgo+ID4gKysrLS0tCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPiDCoHJlbmFtZSBtZXRhLW9lL2R5bmFtaWMtbGF5
ZXJzL21ldGEtcHl0aG9uL3JlY2lwZXMtCj4gPiBjb25uZWN0aXZpdHkvdGhpbmdzYm9hcmQtZ2F0
ZXdheS97dGhpbmdzYm9hcmQtZ2F0ZXdheV8zLjcuNC5iYiA9Pgo+ID4gdGhpbmdzYm9hcmQtZ2F0
ZXdheV8zLjguMC5iYn0gKDk1JSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL21ldGEtb2UvZHluYW1p
Yy1sYXllcnMvbWV0YS1weXRob24vcmVjaXBlcy0KPiA+IGNvbm5lY3Rpdml0eS90aGluZ3Nib2Fy
ZC1nYXRld2F5L3RoaW5nc2JvYXJkLWdhdGV3YXlfMy43LjQuYmIKPiA+IGIvbWV0YS1vZS9keW5h
bWljLWxheWVycy9tZXRhLXB5dGhvbi9yZWNpcGVzLQo+ID4gY29ubmVjdGl2aXR5L3RoaW5nc2Jv
YXJkLWdhdGV3YXkvdGhpbmdzYm9hcmQtZ2F0ZXdheV8zLjguMC5iYgo+ID4gc2ltaWxhcml0eSBp
bmRleCA5NSUKPiA+IHJlbmFtZSBmcm9tIG1ldGEtb2UvZHluYW1pYy1sYXllcnMvbWV0YS1weXRo
b24vcmVjaXBlcy0KPiA+IGNvbm5lY3Rpdml0eS90aGluZ3Nib2FyZC1nYXRld2F5L3RoaW5nc2Jv
YXJkLWdhdGV3YXlfMy43LjQuYmIKPiA+IHJlbmFtZSB0byBtZXRhLW9lL2R5bmFtaWMtbGF5ZXJz
L21ldGEtcHl0aG9uL3JlY2lwZXMtCj4gPiBjb25uZWN0aXZpdHkvdGhpbmdzYm9hcmQtZ2F0ZXdh
eS90aGluZ3Nib2FyZC1nYXRld2F5XzMuOC4wLmJiCj4gPiBpbmRleCA3YTgyNDE0OTM3Li41Y2E1
N2FiYTQ0IDEwMDY0NAo+ID4gLS0tIGEvbWV0YS1vZS9keW5hbWljLWxheWVycy9tZXRhLXB5dGhv
bi9yZWNpcGVzLQo+ID4gY29ubmVjdGl2aXR5L3RoaW5nc2JvYXJkLWdhdGV3YXkvdGhpbmdzYm9h
cmQtZ2F0ZXdheV8zLjcuNC5iYgo+ID4gKysrIGIvbWV0YS1vZS9keW5hbWljLWxheWVycy9tZXRh
LXB5dGhvbi9yZWNpcGVzLQo+ID4gY29ubmVjdGl2aXR5L3RoaW5nc2JvYXJkLWdhdGV3YXkvdGhp
bmdzYm9hcmQtZ2F0ZXdheV8zLjguMC5iYgo+ID4gQEAgLTcsMTIgKzcsMTIgQEAgSE9NRVBBR0Ug
PSAiaHR0cHM6Ly90aGluZ3Nib2FyZC5pby8iCj4gPiDCoExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIK
PiA+IMKgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vJHtDT01NT05fTElDRU5TRV9ESVJ9L0Fw
YWNoZS0KPiA+IDIuMDttZDU9ODlhZWE0ZTE3ZDk5YTdjYWNkYmVlZDQ2YTAwOTZiMTAiCj4gPiAK
PiA+IC1TUkNfVVJJW3NoYTI1NnN1bV0gPQo+ID4gIjU4MTFhM2M1YTIzMzRlNDE3NzZmMjQ5ZGYy
MGMxZDZhMGRlZjYyYTZlMTFlNzdiZjJhYmVhYTAyZjI3MjUyNjAiCj4gPiArU1JDUkVWID0gIjQy
MTVhMzAyYzY0OWY4ZmUzNzM5ODE0ZTM2NWIwZDZhZjcyMmI2NmIiCj4gPiArUFlQSV9TUkNfVVJJ
ID0KPiA+ICJnaXQ6Ly9naXRodWIuY29tL3RoaW5nc2JvYXJkLyR7QlBOfTtwcm90b2NvbD1odHRw
czticmFuY2g9bWFzdGVyIgo+IAo+IHdpbGwgYmUgZ29vZCB0byBpbmNsdWRlICI7dGFnPSR7UFZ9
IiBpbiB0aGUgUFlQSV9TUkNfVVJJCgpUaGFua3MgZm9yIHRoZSBoaW50LiBJIHdpbGwgc2VuZCBh
IHYyLgoKUmVnYXJkcywKTWFydGluCgo+IAo+ID4gK1BZUElfUEFDS0FHRSA9ICJ0aGluZ3Nib2Fy
ZC1nYXRld2F5Igo+ID4gCj4gPiDCoGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwo+ID4gCj4gPiAt
UFlQSV9QQUNLQUdFID0gInRoaW5nc2JvYXJkLWdhdGV3YXkiCj4gPiAtCj4gPiDCoFJERVBFTkRT
OiR7UE59ICs9ICIgcHl0aG9uMy1qc29ucGF0aC1ydyBcCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHB5dGhvbjMtcmVnZXggXAo+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBweXRob24zLXBhaG8tbXF0dCBcCj4gPiAtLQo+ID4g
Mi40My4wCj4gPiAKPiA+IAo+ID4gCj4gPiAKPiAKPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQo+
IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLgo+IFZp
ZXcvUmVwbHkgT25saW5lICgjMTIyNzMxKToKPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvbWVzc2FnZS8xMjI3MzEKPiBNdXRlIFRoaXMgVG9waWM6
IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMTY4MjQwODYvOTk0NzExMQo+IEdy
b3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zwo+IFVuc3Vic2NyaWJlOgo+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5l
bWJlZGRlZC1kZXZlbC91bnN1YsKgWwo+IG0uc2Nod2FuQHBoeXRlYy5kZV0KPiAtPS09LT0tPS09
LT0tPS09LT0tPS09LQo=

