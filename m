Return-Path: <chris.paterson2@renesas.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61505C71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 09:27:50 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com (OS0P286CU010.outbound.protection.outlook.com [40.107.74.10])
 by mx.groups.io with SMTP id smtpd.web10.14572.1750152465148141490
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Jun 2025 02:27:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@renesas.com header.s=selector1 header.b=YEbE4h1Z;
 spf=pass (domain: renesas.com, ip: 40.107.74.10, mailfrom: chris.paterson2@renesas.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMDXIi/t2g2auYi9G7KsuHzEBL+9lp5Vva/THwr5wsBTMCFfFCWubYQ6G54IUrvdHr9+g5q6//XBlVPIg0vFvgpHOBQPlkohglvD515Eb3+IvSmBQZXAIm8MpigsLN95sT0vaEfYSPomfYg7SN/cfQyM77nIXngLP6UR3dbqT69ke5dxkwaJ0/y3rzzdkjX26SxfAd3GDsDv87S8QrpkmYU/H64/ULBDF4b/9YR5dH5OTCwX4wDHR+yANj3FyCk5Jn2QpUfKfFEvkcM5BFZCXpZ2fb3YSrq2wfUKeREqKDa8tF2odFRSwB+f5q9vgBQlbFUePVMloHh92TxXmpY4wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8ZMP36X6NqEQYG6Dt6GLcHnxS2fy1fh2wmpK847FFU=;
 b=n2EmdFqFhrLWb5OMvIXL3PIZCubpH6eAVsVgWKLtFRRDToRhKCJ61E/QcDM57WhpXHPBYej1mYOSZxoyN8z4xfswEwpe4JrrWTEZHfOPuRh+eC4bzJLlizW0DIfSbfYhDFThIW5OkQR4IE9i93Vzv04YRntBtPh7huP91sqdM7szxzAbPoY5vKftNRreTA6qvpyb+/KWI3B2xFhsAogWQoalWD9ScxFsPy3i0m3P+uXdotEZBLCOFYRsEdo2D8j+/E6Fzcfdf6EX/ilj8raK/OB1VjL90BF98MPb4RY/ZExZ0lLJcnA+XWM67zOKLdzJNq/zK4TEpQWoycrpbNIpAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8ZMP36X6NqEQYG6Dt6GLcHnxS2fy1fh2wmpK847FFU=;
 b=YEbE4h1Z0lTi8U1/tR1GFhuCg/1YTvRaOcj7dp02UbbpijSxOQ7Y1sOO/2Gnb3gyV9+/zP4qhOBuEdW1sxZSg2ltfDGKOdNfIzsTqLjj9d07gJBcLC0bbKMniJUFM3oBHqMn2Rz+4/N2zwLOkEZvWoL9+3bbDcjRAflwa9VGY1Q=
Received: from OS7PR01MB15130.jpnprd01.prod.outlook.com
 (2603:1096:604:370::13) by TYCPR01MB11196.jpnprd01.prod.outlook.com
 (2603:1096:400:3c4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 09:27:40 +0000
Received: from OS7PR01MB15130.jpnprd01.prod.outlook.com
 ([fe80::2c4:bb3f:57b4:5812]) by OS7PR01MB15130.jpnprd01.prod.outlook.com
 ([fe80::2c4:bb3f:57b4:5812%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 09:27:40 +0000
From: Chris Paterson <Chris.Paterson2@renesas.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] smarty: Drop allarch
Thread-Topic: [oe] [meta-oe][PATCH] smarty: Drop allarch
Thread-Index: AQHbydGJlvpwV08t0EWj9RpD1xBwBLQHFBCwgAACaoCAAA+1cIAAD66AgAAJEZA=
Date: Tue, 17 Jun 2025 09:27:40 +0000
Message-ID: 
 <OS7PR01MB1513013E3DFDC671B68CA6727B773A@OS7PR01MB15130.jpnprd01.prod.outlook.com>
References: <18415ACCB9C1FC11.11990@lists.openembedded.org>
 <OS7PR01MB151309CB28F4D907420E19720B773A@OS7PR01MB15130.jpnprd01.prod.outlook.com>
 <2a08db91-f139-4bd7-ac0f-14c89a0dc784@gmail.com>
 <OS7PR01MB15130647C07EB7E8967CC9532B773A@OS7PR01MB15130.jpnprd01.prod.outlook.com>
 <45d975c1-45ba-4046-986d-3be24b38f6b9@gmail.com>
In-Reply-To: <45d975c1-45ba-4046-986d-3be24b38f6b9@gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB15130:EE_|TYCPR01MB11196:EE_
x-ms-office365-filtering-correlation-id: 3344bb73-5a44-4e08-0c43-08ddad8134db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Z1NvTU1ObUMxOWZEeGtEcVZBSDVoSkdQRGx4TXNPTWRXZVBncnRHcG1ZVmJt?=
 =?utf-8?B?WHd6clFHcDVWQWlCc1EvaUJVTE5pVVpXQm9GSXM0UU5VOHBBNGtvZUZwZzA4?=
 =?utf-8?B?WXV6THBRNVpla2I2NzFzS3lBM0hzalh0V3Y3MEswWEtDbkllTXhkaEs3eGdJ?=
 =?utf-8?B?YTkvYURLYUFPb0VtK01xcnZGOTVqcmtKZ2VtempVV1ptbUM4MVB3Q2lWTFFL?=
 =?utf-8?B?WDQ5R1lSZVlLNkZ1SmMxMUs1TXpZMDIxVExsRXVyT3VYZklpQTJiV2JrcHVr?=
 =?utf-8?B?dTRZU3g5WVJwa0N4QlV5UlNiNndzUWRUWmtxVDdQV1liSXkyOFJLZ2lvQ1pG?=
 =?utf-8?B?RDh3OHpjYTRVV1h0clR1TEpqaWUwVzMvZFF6TXkrazgzempiTGFWTkJCMk5q?=
 =?utf-8?B?ZUJPRjNUMHVsT0pkY3l5ak16blF5N3QvSExqRDlMZE5kZnVZYjZkZDVCU0F6?=
 =?utf-8?B?dlp6K2RFWEVLMkZqNDhBTDR2cFF2NnVOU25uZjhPd1NyL0UyeFF2Z2MwRjJq?=
 =?utf-8?B?ZUVwZXRYMmNadWdPSUo4MXdid3d3dGM4N3Yyc3FZaFFLSVFKMHdsZjl3aUY3?=
 =?utf-8?B?bHAreFVpd1BlQXpOUTJCV1RKZy9HSlZJYTNmWlh6TVM3ZTEwc1hmUnJ2UVJG?=
 =?utf-8?B?b2VEbUdXV2cydXlYeTcyejdIZG1wUXBSNzhNNkVpS21zN0tuZkdVMDJZMEdS?=
 =?utf-8?B?ZmI0SVVXY09CK2tqaFFNcVQ1Mk5aYjZQUGxqV0tlN1Z6OWFvM1lGWklGMHls?=
 =?utf-8?B?b0xLWDZldGJTVFRZRTNDQXhrL1hsbENpajlQcWYyUXdaM2lyWWZsSDc4Nk5I?=
 =?utf-8?B?NTd2VkFTeXJEQ3VhTVhIWjRZbkVvNU9taTArK1NaUDVEemVoSlFWL2VDUlJU?=
 =?utf-8?B?K0tCb1lOb2RNVDM0REFBcjN6VStmcytJc1dUUnVGMTkwc2wzbmxIdzJxaGVs?=
 =?utf-8?B?NExyaTV4d1UzRXpXRWFKUkxhamgvcHU3ZFh2UUtGdHhMaTE1M2hxaWtkUzk0?=
 =?utf-8?B?VnltLzBDU245K0djSWROQnRET1BxbXg1NXlqZktpSzVQSUxCdGYwSU9kT2NB?=
 =?utf-8?B?ck1HTTc4OUhnbkZGOTNuWkFDY0JiSHM0UnE0ZTk5QnN3QVRkbDRjNGdCZkNh?=
 =?utf-8?B?bG96NXhtQS9PRHVOcjhhOVJUS3JwVlJwTUdZeEJVMVZHRDFlZXl5RWdVbGtt?=
 =?utf-8?B?cmlLa2RybENiOFhtUDlmYmJhbVhSK3VjeHNCOGFoZ0lBc2YzSytFN1IxaFh5?=
 =?utf-8?B?bVpqUmNGLzVvRGZTYVQ1eTYrTTF1ZTZrOU5iRWRMd0FUWGRwenkrQTMwc1BW?=
 =?utf-8?B?d1FaUldWMUhzZWlLRm5XQk56aWYyV1hwaWlyUUg1QTRObGlWUS9xRjlSdGwz?=
 =?utf-8?B?dFM5SzBRTEEwL0JuUVJTdWd3KzcramVsRTVCdDlwNHJhTXhQUG81TzkweEg2?=
 =?utf-8?B?QmJTVUxpL2FzN3BBbWR5bVVJNzFUZWY0Y3FDVkNjakdCeWV3ZVNiWUp0L1d3?=
 =?utf-8?B?MjEzRWJSL3NyZWtjM3FKMDY4Skc0N3A3UllTemJnWjRHVEh5d2tGcjV0bEZn?=
 =?utf-8?B?NERCRHRJbmJZRWNkcHVmdWkrMFdRNndtMnoxbTk2NXpqTFkyeSthWGJnQUQy?=
 =?utf-8?B?S2JGZnhtd2kwdXlOeS9SNis2NlRLWmZTUzRJZ01xRkozR3hNekgrUUw0L2lt?=
 =?utf-8?B?QTBYUFNmOWdKUjNWeUp0UVBuYndyMmE4WGlndDdmcis3WXl6Q0R3d0FJcXlN?=
 =?utf-8?B?WHY0WGhnVUFaMTlqWHRsT0lUSFJEd0pJSkhPbEt5akdGNmxScDdiNGc5b2gy?=
 =?utf-8?B?TVhNUlNQZlVGNXQvVWk5V1hwczhTeGJTbTd5aUxYWWNVeUl3ZXBoWmQ3WFI2?=
 =?utf-8?B?MXJLS0VZWlpEdWVtMWhhNGlBTlZQanlQNG1STWpmRXBuU2ZoeHZGMktCbHhl?=
 =?utf-8?Q?GFEi2wMbxeQ=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB15130.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?S3pDVXBtWC9TY01rR1RMdDdUWnllSDlValdyQ2I4bEYxdk10RThTaXhWUUpV?=
 =?utf-8?B?UDFLMFpZR2xRcnFUeWdVbGRLU1F6cFVHNW1ZR1ZXMkhkKzZPc2F5NDdVb0Jm?=
 =?utf-8?B?WmFmMElvSGplNndRWWJ0b0xMc3ZyY29JS1ZYY1gwcDNscjVlUDdqakVCei9t?=
 =?utf-8?B?dCs1L3krQ252NkNkZ1lkSjY3d29zU2VEVmZqM0RBNXZyaGIwaHgwQ2xKSlE1?=
 =?utf-8?B?RFNteGtoQUhsaFA5a3ZLWmgvdG5ZRUNnRmt0ZnNSTzAyNll3VmFlclE4RHUx?=
 =?utf-8?B?ZXV1Y3gvai9ubHpkMXRwSk10YnQvbGU3dmdnRFBMRHg3SklPL3Q3R2dFYys1?=
 =?utf-8?B?SmQ2alVXQnZab3NxbWtySjREaDQ4Q3dDVDF3M3FWdi9sa0QrWVRkazl2emEr?=
 =?utf-8?B?RlB6WWsvYTMzdWZWVE1NeXRTYzhtMWMzYUVrNUNFTUZaVlMxZGRXeXFUT29w?=
 =?utf-8?B?WjcxTmo3ZWtyTmEyRWVtZC91TFNvMTFtVGVDSWRRUXFuQTF2Z3NpR3h1M0xN?=
 =?utf-8?B?OW1MVy96WktmWHJlbDRoZzJ5TlhPSGxpZmdwOW82dEpNYmVBM3c5VzlMc29O?=
 =?utf-8?B?UlFXSzJ5dERQKzZNYWdSdE1Fa2k0bjNGR1VzdFkrWE9aK0RsYThUcjA2OVdF?=
 =?utf-8?B?em03K1NNamhaUGxINytuZ3kvNGRuUXpuSWdUcUVaQUNlWHVXTEorWUZlNkZw?=
 =?utf-8?B?N2ozMEhGeXd5QU9TWVlQaFdxS1JvMFFFMGw1VE01a0Y2NlBCVDZGNVREUTFk?=
 =?utf-8?B?ME9kdVBFeDI4cDBNQVNBQWlWbFh6WG01dC9ZWDMvNlhBZzZNRVQ5d2xXcUNq?=
 =?utf-8?B?KytZeE9ncEtjckVaanNEYklKdkNxYitjQ056dWdaTks2T2QyMzFVdGYvNGpm?=
 =?utf-8?B?MjhYby8yMG52eU1zdjVxenkrSjlvSWl6ejVrMHdqaEhwWDVKSnpSWk56a09q?=
 =?utf-8?B?OW9VdDBwMWdyaU1YU0Z1Ti8waUU3YXVwUVA3NXpBNklKLy9DbDdrQlRmdmRT?=
 =?utf-8?B?N0JjaG9rWms4NGtzR25QdUkyMHpxdXdEYUNoTjZYWVk3eFpqWjVtVE5rRWVQ?=
 =?utf-8?B?ZGlqYllYNzM3dFJTZEIrdTR2TFppRGRETUk0TWV5R0RVazhHNGpzTjNuNFlN?=
 =?utf-8?B?NjlIYzZKUngrcVQ1RTFrYUdzcG5STVUxYU9rSEJUVEdJU2NkUVNkMk1sVis4?=
 =?utf-8?B?OVZ4d1BYbHZLVjNWNVZLcjdxQ2ZNRmp0aUhwZ05jWkViTGFwd0NWRmhCd0xT?=
 =?utf-8?B?a3JBNFFNMUVsTHNWcmp1RVI3bUdvbUpCQ0lmcTJqWHVLTjY3dEpzVCtYZlMy?=
 =?utf-8?B?QXB0MFdoS21VYUxvM1c2VU9lRWx0M21ZNnc1ejVIM2Y3eWs4Q2IyUFkzbVBt?=
 =?utf-8?B?VGloaTMyNlVhYVhCS1V1QXE4LzRZVkZsYjFHU0FjLzN5RWdCYjE0MVpiVmxU?=
 =?utf-8?B?ZWtDc3JDK1BwUVpQUERwR2plSlhsd3VhUEtjSFl1eVB2N0Q2MGJZS09leUxo?=
 =?utf-8?B?WEhZTXBlMDlTRnR2NURkREZ4YWhUOFcxbFNqUktjQ2JzSVcvWHlpVXFGSlhQ?=
 =?utf-8?B?RitDRFVPWDRmSXllZG5pVWZkdjJ0UEVGRnNWZnFhQmxFZ3g1S3doenR4Q2Fh?=
 =?utf-8?B?QUVFVnVmaTg4NVJrU01DUkVpL1VLcDN4YVNxRVNEV0paTmhITHVQNWVuakU5?=
 =?utf-8?B?dC8rRVVLbXhIV0VmM1VRR3BoOGZ0SGVlTFBETTM4elVQMnIzN01wazFEUi96?=
 =?utf-8?B?SHZzazd4RjNTN2xON0FQcFg4bUhWMWIweVhCc1Fsanl4SW5sNzlkT2JJTm14?=
 =?utf-8?B?VktkbDFyNk90eGZxWUlrN3NGcTJPdXhDTnpUY05vYzJ2MHVkRFdva1pnRjUr?=
 =?utf-8?B?aWlmM3JBbnQvaG1wUjBGeVpOMkFtRzNlb2EvUTJSRjV3Y2lkYzYzMEVjckZB?=
 =?utf-8?B?RDZIdHdxbEFFaHpGTmNuMVdGUnppQWt0dDR2RDRiV24wODJzS1hra2JpcUNq?=
 =?utf-8?B?Y042d3E1TzhPMUZPN2xWRGhzdzlOdHd4UTE3UWVGMmxEQ2l2ZXlHOUVIWVd1?=
 =?utf-8?B?MmNDcHk1YWpNK09aYXZzb0h3TVU0ekVnWEhlTmJtVlFSdWFodTRJa0NpMHFk?=
 =?utf-8?B?N2lrUERiMVJJelFFc3NJcVNLcmlsenB3UVJ4RnQ2TGhodjNMdDdLWWpZQTlu?=
 =?utf-8?B?cmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB15130.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3344bb73-5a44-4e08-0c43-08ddad8134db
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 09:27:40.5376
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rqW9HCKRNtsfYf4MQqzgKXB5/LhAg1ZKfJPUY+B5iCYLvW4JkM0DX9ByQT7lAdbMoVyTdEZ/hArnfcQpbofAkfkEjxjt0JlDs5hrEyuhTDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11196
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jun 2025 09:27:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117923

PiBGcm9tOiBHeW9yZ3kgU2FydmFyaSA8c2thbmRpZ3JhdW5AZ21haWwuY29tPg0KPiBTZW50OiAx
NyBKdW5lIDIwMjUgMDk6NTANCj4gDQo+IE9uIDYvMTcvMjUgMDk6NTUsIENocmlzIFBhdGVyc29u
IHdyb3RlOg0KPiA+IEhlbGxvIEd5b3JneSwNCj4gPg0KPiA+PiBGcm9tOiBHeW9yZ3kgU2FydmFy
aSA8c2thbmRpZ3JhdW5AZ21haWwuY29tPg0KPiA+PiBTZW50OiAxNyBKdW5lIDIwMjUgMDc6NTcN
Cj4gPj4NCj4gPj4gT24gNi8xNy8yNSAwODo1MCwgQ2hyaXMgUGF0ZXJzb24gdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+ID4+PiBEb2VzIGFueW9uZSBoYXZlIGFueSBvcGluaW9u
cyBvbiB0aGlzIHBhdGNoPw0KPiA+Pj4gSGF2ZSBJIG1pc3NlZCBhIHN0ZXAgaW4gdGhlIGJ1ZyBy
ZXBvcnRpbmcvZml4aW5nIHByb2Nlc3MgZm9yIG1ldGEtb2U/DQo+ID4+Pg0KPiA+Pj4gSSBhbHNv
IHNlbnQgc29tZSByZWxhdGVkIHBhdGNoZXMgb24gdGhlIDIyLzA1IGJ1dCBJIHdvbid0IHNwYW0g
dGhlIE1MDQo+IGJ5DQo+ID4+IHBpbmluZyB0aGVtIGFsbCByaWdodCBub3cuDQo+ID4+DQo+ID4+
IFRoaXMgaGFzIGJlZW4gcGFydCBvZiBtYXN0ZXIgYnJhbmNoIHNpbmNlIGEgd2hpbGU6DQo+ID4+
IGh0dHBzOi8vZ2l0Lm9wZW5lbWJlZGRlZC5vcmcvbWV0YS1vcGVuZW1iZWRkZWQvY29tbWl0L21l
dGEtb2UvcmVjaXBlcy0NCj4gPj4NCj4gc3VwcG9ydC9zbWFydHkvc21hcnR5XzUuNC41LmJiP2lk
PTFlNTcxZmRkZGVlNTUyZDZhNTRhNzJmNWE2OTI2ZWM2NWEzZDM5MmUNCj4gPiBTbyBpdCBpcyEN
Cj4gPiBTb3JyeSBmb3IgdGhlIG5vaXNlIQ0KPiA+DQo+ID4gSSB3YXMgZm9vbGlzaGx5IG9ubHkg
Y2hlY2tpbmcgdGhlIFdhbG5hc2NhciBicmFuY2ggYXMgdGhhdCdzIHRoZSB2ZXJzaW9uDQo+IEkn
bSBjdXJyZW50bHkgYmFzZWQgb24uDQo+ID4NCj4gDQo+IFRoYXQncyBhIGJpdCBkaWZmZXJlbnQu
IFdoZW4geW91IHN1Ym1pdCBhIHBhdGNoLCB0aGF0IHdpbGwgZ28gdG8gbWFzdGVyDQo+IGJyYW5j
aCBieSBkZWZhdWx0LiBJZiB5b3Ugd291bGQgbGlrZSBhIHBhdGNoIHRvIGFwcGVhciBpbiBhIHN0
YWJsZQ0KPiBicmFuY2ggbGlrZSBXYWxuYXNjYXIsIHRoZW4geW91IG5lZWQgdG8gc3VibWl0IHRo
ZSBwYXRjaCBzcGVjaWZpY2FsbHkNCj4gZm9yIHRoYXQgYnJhbmNoIChpbiB0aGUgcmVhZG1lIG9m
IHRoZSBzcGVjaWZpYyBicmFuY2ggaXQgaXMgZGVzY3JpYmVkDQo+IGhvdyB0bywgaXQganVzdCBu
ZWVkcyBhbiBleHRyYSB0YWcgaW4gdGhlIHN1YmplY3QpLiBOb3QgYWxsIHBhdGNoZXMgYXJlDQo+
IGFjY2VwdGVkIGluIHN0YWJsZSBicmFuY2hlcywgYnV0IHRoaXMgcGFydGljdWxhciBwYXRjaCBs
b29rcyBsaWtlDQo+IHNvbWV0aGluZyB0aGF0IGlzIHJlcXVpcmVkIHRoZXJlIHRvbywgc28gdGhh
dCdzIG5vdCBzb21ldGhpbmcgdG8gd29ycnkNCj4gYWJvdXQuDQoNClRoaXMgSSBkaWQgYXQgdGhl
IHNhbWUgdGltZS4NCg0KPiANCj4gKFRob3VnaCBtYXN0ZXIgYnJhbmNoIHN1Ym1pc3Npb25zIGFw
cGVhciBxdWljayBpbiB0aGUgcmVwbywgc3RhYmxlDQo+IGJyYW5jaGVzIGFyZSBtZXJnZWQgb25s
eSBvbmNlIGEgbW9udGgpDQoNCkFuZCB0aGlzIGlzIHByb2JhYmx5IHdoeSB0aGUgc3RhYmxlIHZl
cnNpb24gaXNuJ3QgbWVyZ2VkIHlldC4NCkknbGwgYmUgbW9yZSBwYXRpZW50IDopDQoNClRoYW5r
cyBhZ2FpbiENCg0KS2luZCByZWdhcmRzLCBDaHJpcw0KDQo=

