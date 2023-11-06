Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92819C001B5
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 08:26:38 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (APC01-SG2-obe.outbound.protection.outlook.com [40.107.215.102])
 by mx.groups.io with SMTP id smtpd.web10.50035.1699259197653809109
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 00:26:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=C8Syg2VH;
 spf=pass (domain: aspeedtech.com, ip: 40.107.215.102, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWMubPlTF+CHG1QFapSEsNdVuxj1CuaUUhW+hl5+iH4mO0enaV4IG4TP2EqvEtvBg49eG7Sm3Mn1EG112WHGGHNYx/6jZGdeb3fiiXo17kLQLsniFxWT4ra/WR/6bh5fFkJm6jGd5evvFrW/XkW4jqtSDoDDSFE1jQ4qFZItaPcus9RyWYK9+ONF5p2ZRkfg3le/J9ay+C+2485JxiWVI776zF3CdStpAHQh4D5MPQyvTxIf2JtP4Bw7x5lOplRbhHIoND2GA5KCuX+2Ps5lnxdivUxyv8eYshEhxWyRLSDZjJ10X+6ljkl3obdBaHXP4/3OC+39Kejy8wdsM5bnIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMf5tsCJjPaRvbMJljsKAtKHmLzA3T+kdjBPxzjYqrI=;
 b=O7E09CdjdQfwBjQfdoFG5iTXtkPWqLM2Kyoo4BBSSFqRZNRwuhX6TErSj3T0mIuXAnK8DjVvhJ8qQAPpJ3+OFSuxztFq3F1NzHXjjW7yJmZ56k7JyK4OLbdwuGxHZJY8q4ellZ1MlWoEMDIEndbpi3EUDqFvMmsgOOLQ1iw/rdSx+Ya7TFRdDbqmzdmkv7ZhHuJyX0UvqL2wKwAsWIgdQxjp/KUpVIMhraM1j6io2UGhTOoz/cLxnNwnTLr12a5BarecCn8WUSproz2E1UtpdJtrCLMfawJH4V86xPZpfRSTwhi/whT00TCKtFbw7aI7Lvt0BOR1dOczTQFZeiXwzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMf5tsCJjPaRvbMJljsKAtKHmLzA3T+kdjBPxzjYqrI=;
 b=C8Syg2VHXOAq4FRt4gsgtUfsiHZAVP3W+ZgdWatE8QUbThY3hTqzwaqwGQzwznNI+yYZ4EwGm9JW0oDR6/adkxJm9vjRMIo2vIo7uMmcoAl/48MVj2SCALp+T763zOmyrgn2JSqwxzQmR/au/stI1I/YfyuYnJ1t3fKuWplHNtDHmdEGLA7/QL9xRNdPdACPgVlr5spFf7dlX1SXntrFtX0jZNFC78mgFu/p2eKKwG113xOH2DU6UcAMhLYJYVngw1YkQxXxhPQ0rn1oP3dmZE7ZPVqPKpKDnx83Sqj0o/iBDA0qOE+0V9QH+qwglKGnbNqO1a7j3MD9KVbOaU0wwg==
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com (2603:1096:4:1a4::6) by
 TY0PR06MB5235.apcprd06.prod.outlook.com (2603:1096:400:204::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.27; Mon, 6 Nov 2023 08:26:32 +0000
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::5459:bda3:7997:ebe3]) by SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::5459:bda3:7997:ebe3%7]) with mapi id 15.20.6954.025; Mon, 6 Nov 2023
 08:26:31 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Tim Orling <ticotimo@gmail.com>, Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] ast2600:emmc: unsigned rot image align
 block size (512bytes)
Thread-Topic: [oe] [meta-oe][PATCH] ast2600:emmc: unsigned rot image align
 block size (512bytes)
Thread-Index: AQHaDnhCDbt3Y2Pzx0q4etJSo8/+irBo63gAgAQNRKA=
Date: Mon, 6 Nov 2023 08:26:31 +0000
Message-ID: 
 <SI2PR06MB504128DF0B04B4BF8B4B6E6BFCAAA@SI2PR06MB5041.apcprd06.prod.outlook.com>
References: <20231103100246.3899364-1-jamin_lin@aspeedtech.com>
 <20231103100246.3899364-2-jamin_lin@aspeedtech.com>
 <CAMKF1sqiEcDb1XZ5ur_q211SKC95v+qSZA53Q9-0n0UGJ8rdmQ@mail.gmail.com>
 <CANx9H-CyW0-cb_cau0F-NAqAw8AfHmX9-x7Zq0jAj=QZg8kmOQ@mail.gmail.com>
In-Reply-To: 
 <CANx9H-CyW0-cb_cau0F-NAqAw8AfHmX9-x7Zq0jAj=QZg8kmOQ@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5041:EE_|TY0PR06MB5235:EE_
x-ms-office365-filtering-correlation-id: 9ceadbb6-597f-4fd3-b833-08dbdea214d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YYyf5a/iAlhf1NjWoO/1X/sf2KnpoPL870W5bmqOT9aarhoGIX9UsGZfswDPEYLirs+oJYl9qj9CSeQWqs28CVh+S2CLrsS4A43kkiBYeSncw2ZgNEFYL1xDFshD0Avf++ay1I7Cvvxe0e60+8F3a4ygTpLmDWMTrQfi3c2FVIiOSrh1LYiKgBnMih+kCgQU1uDNdmhZRx56mBYl8RCt29aEkDerUk1hZNxftf9Dh1YKxPBwsncEiE8G16svaDVifDoUe8FruEx9r3eW2hKQHNvqAFGUGNgpIFoa+lwHJfCSTn5hfe3Ii1FaCpKL5NxFG0nELmuswOH+vXboam/nWOfBfNirm/HLrypk//muvARH2Iq3WFir5++K5UJWgalhqMeDc75u4HMLGWy7MgFA1SgJIo8JxTvwh0kmT48wguikLTpZsEovn9fEqUxTQLcr2X3w6CYUKELGmNdD594PXXTGAcAqYurouX221rtnaYQIme3fmgvU1b1zLX+csze0+CYlUAYXLa1BZ+Z8t1O1qay4lmHJjpcTCMrmG+lXx4DBdIwGWLvCVdtuAC06R2aG/i44pPPZ6XmoKspLqTGbFvM6AWKHyI9wkSWFwqbnRo0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5041.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(136003)(376002)(39850400004)(366004)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(2906002)(478600001)(41300700001)(9686003)(53546011)(6506007)(7696005)(966005)(71200400001)(52536014)(316002)(83380400001)(8936002)(64756008)(8676002)(4326008)(26005)(5660300002)(76116006)(66476007)(66446008)(110136005)(66946007)(66556008)(86362001)(38100700002)(122000001)(33656002)(55016003)(66899024)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Zk9BWlpMNlBXTlJRM3FtNWkwUEp3akxOV25jcHBMVTNjY2dXUjJPMElUSUVX?=
 =?utf-8?B?UVluSms0aDVxRTlMamVNL3J0bVMrelpWV2lFWENYZjFuekwvWnZoWlpHZWcr?=
 =?utf-8?B?cFJGRDRURktNOGd6bFJEOS8zWjlQeFIvSXR5dnBXdU45aVF6Q2paeTRQbWFo?=
 =?utf-8?B?eSs5ZFdRazltL1VVbTBIRWcyRHpoTDBxandoTHR5SUJJdjVXT2N3bTNXeHAv?=
 =?utf-8?B?MW04amZWemVkcHJiZXE2VUYrUmtEWXVsaGhXUmtSZ1oxWGdPNS9LMVBLMkFa?=
 =?utf-8?B?bUJPd0N4Tk40a09BSUxwcHFqN0J6dXdDd3hsd3BRRmRDK1ZDM3VGSExvWWxp?=
 =?utf-8?B?WEI1MUhjanI3dUMzbm5MakNSZ2tNUi9FbXk3Y0tveXY0TUlnUEcrWE1KWlho?=
 =?utf-8?B?Q3VLOXA3cVZnRWkwa2J6V0lTZnJnRllocDJNNE1peWI3S0FLU3QzcjJKNHBT?=
 =?utf-8?B?MFJycjcweFZDbXVtQ0c1ZU93SHY3WGZsdnFxNm1EUk1xMEp0Unh4VVI0Rlkr?=
 =?utf-8?B?dzJSWWNJWEVDVG8relVGb2t3RGsyZlJ5TGhQRlFsU3FqNEhnOXRVRTVnOTM3?=
 =?utf-8?B?czJldVpXcitaa0ZCZ3F6YWl3cXlEWlNaR1lGZTRHSmVnVDYvaGJQQjkxTkNO?=
 =?utf-8?B?SHNKS3ZjSk85N2lPaHJZclMzaHZhYUhxWmxiZ0xudEpzTnluVVlwVmpaT2lj?=
 =?utf-8?B?d3ZVM1N5OWpwdE93ZmoyTzBHVUJjdFRnd1BoWkF2RHRLdGpaTHdkUjRqTnBx?=
 =?utf-8?B?QVdxQytKekFiWG1FUDR6NWFtV21LZ2pCM0NPSWRpMm1MaDJnTE5CSTEwOFBC?=
 =?utf-8?B?NjdXRFhtQWt5R01ySzJqL0dnRGgzL2ZlRVZLVjJRK08xbWo2N2pQQ2Z0dmRi?=
 =?utf-8?B?S2RINEV4bENFV0VwbWh6dWUwSFJOQ2dGeVFJWndKaFRmTGlLV3oyQlhIM2wy?=
 =?utf-8?B?U0wzMlE3WGR5Z1lMK3VVTnYwNWVkZXFUekRFamZaZm8vRjZEejJ1eERBcHFQ?=
 =?utf-8?B?bFRxQnVrVlc4NXhoUDg2UERiODhHTlI0TUdqTXdFblpWbXIxaXdLcWpML21L?=
 =?utf-8?B?MVhzNFh3M1FvUU5xTEdmdWhHUkJMblNKRklQN1FNVCs3cFRSUmYvVW1FS1J5?=
 =?utf-8?B?M3AyOTgwd1BITFhQRkEyMUxUUG5lZ1JtdHJHOXBlNDdLS2xuVUR3cHB5WldW?=
 =?utf-8?B?NGRVVFpIZGRwSTl0bjdvMFkvUTlpUUdBeWZUbG5hMm5kWVNhbDU0djFCSFhx?=
 =?utf-8?B?RXFnQitJQXc0Nks1UG9WNkRmcFBXdWZJcWIzbzhCRHVpOGRISDNmaUxGR3J5?=
 =?utf-8?B?VmVBODViY3ozUU5obDFsN2k2U1ZjTnRRWHZjSDlEbFBPaDRNNkl5dllqeXJW?=
 =?utf-8?B?VEJTd3ZKb0FPMGQrV2dNbFFPdlN2Z2hYZWIyOENZYzJuRWNpK2tvWnFneG9m?=
 =?utf-8?B?dmJzQ1JDTTlCU2hoZW9iaWRyTVFhWGdURUtOMVdlTnZ5WGlXSlhtK2VYWC9K?=
 =?utf-8?B?V3pGTzVxOCtJYUp2Z2Y1ZzlXdkEvL1dKRjNrcGJMZEdsWWdyMEFWaXR6WE1j?=
 =?utf-8?B?NEg2ZlVJL3hQMlRPbndZcVNOakRKV3FxRVRCNHR3RHlOb3REYUhPVUtKalZj?=
 =?utf-8?B?RUpMYnRsdUVTbGlCekhNR09vdFpBWTJ6dVNacmx6WXJPVUUyNForaGlxMVI5?=
 =?utf-8?B?VFdqR1FJcTF5V3QwMFYwaUJwckI5clF6QmZkN24xdllwUTUzZUZzdmNZQ1NC?=
 =?utf-8?B?L0hsaGhEbXRxYkZJWTdlQkJiVVZVRmM5NGJBdk5BTXBCZ3ozUlgvaVZVZkt5?=
 =?utf-8?B?RzF6QkcvNDdXVG0ydU9Gb1RKQkpVMXFEVytEdHVabGd6TFVrdkZlaVlkdE8v?=
 =?utf-8?B?Q2x5U0VTRFFyL1cvUnpSc3Z0Q1lYckd1cW43RkZqcEN2N3J2NjJSS0NoenhB?=
 =?utf-8?B?K1IweE52US84U2hjNmYxaHR3Q1lGdU8rT2xsWk9oKzNnK2pacjVITlpsd2ky?=
 =?utf-8?B?Y1haNGhmWTF2OUxGdWZyYnhSUFlJV0IvczRpZzNDMXVucUlkYW93aWdRNTl0?=
 =?utf-8?B?MDh1bWFIMGRVbUd2czFRNDZFSFhscVQxM0hIWkR6dHRhcnAxR1RsN3BRSHlQ?=
 =?utf-8?Q?u6UVdZKGdGJezy33wpd3esGG5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5041.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ceadbb6-597f-4fd3-b833-08dbdea214d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 08:26:31.8559
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8l8NyL39iTtGfIWylDcpiD6hg71R5EBn92Q/mdrwLiYuSNMntPXHWuiA1EFGeL1qLb9vJCI0yYzT4z9o7kbO6Yu53xYqeYvVuimkk5N8w/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5235
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 08:26:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106401

WWVzLCBJIHdhbnQgdG8gc2VuZCB0aGlzIHBhdGNoIHRvIE9wZW5CTUMNClNvcnJ5IGZvciB5b3Vy
IGluY29udmVuaWVudA0KDQoNCkZyb206IFRpbSBPcmxpbmcgPHRpY290aW1vQGdtYWlsLmNvbT4g
DQpTZW50OiBTYXR1cmRheSwgTm92ZW1iZXIgNCwgMjAyMyAyOjMzIEFNDQpUbzogS2hlbSBSYWog
PHJhai5raGVtQGdtYWlsLmNvbT4NCkNjOiBKYW1pbiBMaW4gPGphbWluX2xpbkBhc3BlZWR0ZWNo
LmNvbT47IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0
OiBSZTogW29lXSBbbWV0YS1vZV1bUEFUQ0hdIGFzdDI2MDA6ZW1tYzogdW5zaWduZWQgcm90IGlt
YWdlIGFsaWduIGJsb2NrIHNpemUgKDUxMmJ5dGVzKQ0KDQoNCg0KT24gRnJpLCBOb3YgMywgMjAy
MyBhdCAxMDowOOKAr0FNIEtoZW0gUmFqIDxtYWlsdG86cmFqLmtoZW1AZ21haWwuY29tPiB3cm90
ZToNCndlIGRvIG5vdCBoYXZlIHRoaXMgcmVjaXBlIGluIG1ldHMtb2UuIERpZCB5b3UgaW50ZW5k
IHRvIHNlbmQgdGhpcyBwYXRjaCA/DQoNCk15IGd1ZXNzIMKgaXMgeW91IGludGVuZGVkIHRoaXMg
Zm9yIG9wZW5ibWM/DQoNCg0KT24gRnJpLCBOb3YgMywgMjAyMyBhdCAzOjAz4oCvQU0gSmFtaW4g
TGluIHZpYSBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPGphbWluX2xpbj1tYWlsdG86
YXNwZWVkdGVjaC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+DQo+IFNpZ25l
ZC1vZmYtYnk6IEphbWluIExpbiA8bWFpbHRvOmphbWluX2xpbkBhc3BlZWR0ZWNoLmNvbT4NCj4g
Q2hhbmdlLUlkOiBJOWI4MmYxMWNkZjNlODUyNGI5OWY4ZGZlNmExMDJmZWRmMmI4N2U1Zg0KPiAt
LS0NCj7CoCAuLi4vcmVjaXBlcy1hc3BlZWQvaW1hZ2VzL2h0dHA6Ly9hc3BlZWQtaW1hZ2UtZ2Vu
LXNlY3VyZWJvb3QuYmLCoCB8IDggKysrKysrKysNCj7CoCAuLi4vcmVjaXBlcy1hc3BlZWQvaW1h
Z2VzL2h0dHA6Ly9hc3BlZWQtaW1hZ2UtZW1tY2Jvb3QuYmLCoCDCoCDCoCDCoCB8IDUgKysrKysN
Cj7CoCAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBh
L21ldGEtYXNwZWVkLXNkay9tZXRhLWFzdDI2MDAtc2RrL3JlY2lwZXMtYXNwZWVkL2ltYWdlcy9o
dHRwOi8vYXNwZWVkLWltYWdlLWdlbi1zZWN1cmVib290LmJiIGIvbWV0YS1hc3BlZWQtc2RrL21l
dGEtYXN0MjYwMC1zZGsvcmVjaXBlcy1hc3BlZWQvaW1hZ2VzL2h0dHA6Ly9hc3BlZWQtaW1hZ2Ut
Z2VuLXNlY3VyZWJvb3QuYmINCj4gaW5kZXggN2E2YWUxZmEwYi4uZjBkMDQ2YWU1OCAxMDA2NDQN
Cj4gLS0tIGEvbWV0YS1hc3BlZWQtc2RrL21ldGEtYXN0MjYwMC1zZGsvcmVjaXBlcy1hc3BlZWQv
aW1hZ2VzL2h0dHA6Ly9hc3BlZWQtaW1hZ2UtZ2VuLXNlY3VyZWJvb3QuYmINCj4gKysrIGIvbWV0
YS1hc3BlZWQtc2RrL21ldGEtYXN0MjYwMC1zZGsvcmVjaXBlcy1hc3BlZWQvaW1hZ2VzL2h0dHA6
Ly9hc3BlZWQtaW1hZ2UtZ2VuLXNlY3VyZWJvb3QuYmINCj4gQEAgLTE5Myw2ICsxOTMsMTIgQEAg
bWFrZV9yZWNvdmVyeV9pbWFnZSgpIHsNCj7CoCDCoCDCoCBweXRob24zICR7U1RBR0lOR19CSU5E
SVJfTkFUSVZFfS9nZW5fdWFydF9ib290aW5nX2ltYWdlLnB5ICR7U30vJHtHRU5fSU1BR0VfTU9E
RX0vJHtTUExfSU1BR0VfTkFNRX0gJHtTfS8ke0dFTl9JTUFHRV9NT0RFfS9yZWNvdmVyeV8ke1NQ
TF9JTUFHRV9OQU1FfQ0KPsKgIH0NCj4NCj4gK21ha2VfZW1tY191bnNpZ25lZF9yb3RfaW1hZ2Uo
KSB7DQo+ICvCoCDCoCBpZiBbIC1mICR7U30vJHtHRU5fSU1BR0VfTU9ERX0vJHtTUExfSU1BR0Vf
TkFNRX0udW5zaWduZWQgXTsgdGhlbg0KPiArwqAgwqAgwqAgwqAgcHl0aG9uMyAke1NUQUdJTkdf
QklORElSX05BVElWRX0vZ2VuX2VtbWNfYm9vdF9pbWFnZS5weSAke1N9LyR7R0VOX0lNQUdFX01P
REV9LyR7U1BMX0lNQUdFX05BTUV9LnVuc2lnbmVkICR7U30vJHtHRU5fSU1BR0VfTU9ERX0vZW1t
Y18ke1NQTF9JTUFHRV9OQU1FfS51bnNpZ25lZA0KPiArwqAgwqAgZmkNCj4gK30NCj4gKw0KPsKg
IG1ha2VfYm9vdF9wYXJ0aXRpb25fZXh0NCgpIHsNCj7CoCDCoCDCoCAjIEdlbmVyYXRlIGEgY29t
cHJlc3NlZCBleHQ0IGZpbGVzeXN0ZW0gd2l0aCB0aGUgZml0SW1hZ2UgZmlsZSBpbiBpdCB0byBi
ZQ0KPsKgIMKgIMKgICMgZmxhc2hlZCB0byB0aGUgdXNlciBkYXRhIGFyZWEgYXQgYm9vdCBwYXJ0
aXRpb24gb2YgdGhlIGVNTUMNCj4gQEAgLTYxNyw2ICs2MjMsOCBAQCBweXRob24gZG9fZGVwbG95
KCkgew0KPsKgIMKgIMKgIMKgIMKgIGJiLmJ1aWxkLmV4ZWNfZnVuYygibWFrZV9yZWNvdmVyeV9p
bWFnZSIsIGQpDQo+DQo+wqAgwqAgwqAgwqAgwqAgaWYgYXNwZWVkX2Jvb3RfZW1tYyA9PSAieWVz
IjoNCj4gK8KgIMKgIMKgIMKgIMKgIMKgIHByaW50KCJNYWtlIGVtbWMgdW5zaWduZWQgcm90IGlt
YWdlIikNCj4gK8KgIMKgIMKgIMKgIMKgIMKgIGJiLmJ1aWxkLmV4ZWNfZnVuYygibWFrZV9lbW1j
X3Vuc2lnbmVkX3JvdF9pbWFnZSIsIGQpDQo+wqAgwqAgwqAgwqAgwqAgwqAgwqAgcHJpbnQoIkRl
cGxveSBtbWMgaW1hZ2UuLi4iKQ0KPsKgIMKgIMKgIMKgIMKgIMKgIMKgIGRlcGxveV9tbWNfaW1h
Z2UoZCkNCj7CoCDCoCDCoCDCoCDCoCBlbHNlOg0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1hc3BlZWQt
c2RrL3JlY2lwZXMtYXNwZWVkL2ltYWdlcy9odHRwOi8vYXNwZWVkLWltYWdlLWVtbWNib290LmJi
IGIvbWV0YS1hc3BlZWQtc2RrL3JlY2lwZXMtYXNwZWVkL2ltYWdlcy9odHRwOi8vYXNwZWVkLWlt
YWdlLWVtbWNib290LmJiDQo+IGluZGV4IDRmYWYwZDAzMmMuLjllYjkxZThiMDAgMTAwNjQ0DQo+
IC0tLSBhL21ldGEtYXNwZWVkLXNkay9yZWNpcGVzLWFzcGVlZC9pbWFnZXMvaHR0cDovL2FzcGVl
ZC1pbWFnZS1lbW1jYm9vdC5iYg0KPiArKysgYi9tZXRhLWFzcGVlZC1zZGsvcmVjaXBlcy1hc3Bl
ZWQvaW1hZ2VzL2h0dHA6Ly9hc3BlZWQtaW1hZ2UtZW1tY2Jvb3QuYmINCj4gQEAgLTYxLDYgKzYx
LDExIEBAIGRvX21rX2VtbWNfYm9vdF9pbWFnZV9nNigpIHsNCj7CoCDCoCDCoCDCoCDCoCBpbnN0
YWxsIC1tIDA2NDQgJHtTT1VSQ0VfSU1BR0VfRElSfS8ke0FTUEVFRF9FTU1DX0lNQUdFX1VCT09U
X1NQTF9JTUFHRX0uJHtVQk9PVF9TVUZGSVh9ICR7T1VUUFVUX0lNQUdFX0RJUn0NCj7CoCDCoCDC
oCBlbHNlDQo+wqAgwqAgwqAgwqAgwqAgaW5zdGFsbCAtbSAwNjQ0ICR7REVQTE9ZX0RJUl9JTUFH
RX0vJHtBU1BFRURfSU1BR0VfVUJPT1RfU1BMX0lNQUdFfS4ke1VCT09UX1NVRkZJWH0gJHtTT1VS
Q0VfSU1BR0VfRElSfS8ke0FTUEVFRF9FTU1DX0lNQUdFX1VCT09UX1NQTF9JTUFHRX0uJHtVQk9P
VF9TVUZGSVh9DQo+ICvCoCDCoCDCoCDCoCBpZiBbIC1mICR7REVQTE9ZX0RJUl9JTUFHRX0vJHtB
U1BFRURfSU1BR0VfVUJPT1RfU1BMX0lNQUdFfS4ke1VCT09UX1NVRkZJWH0udW5zaWduZWQgXTsg
dGhlbg0KPiArwqAgwqAgwqAgwqAgwqAgwqAgaW5zdGFsbCAtbSAwNjQ0ICR7REVQTE9ZX0RJUl9J
TUFHRX0vJHtBU1BFRURfSU1BR0VfVUJPT1RfU1BMX0lNQUdFfS4ke1VCT09UX1NVRkZJWH0udW5z
aWduZWQgJHtTT1VSQ0VfSU1BR0VfRElSfQ0KPiArwqAgwqAgwqAgwqAgwqAgwqAgcHl0aG9uMyAk
e1NUQUdJTkdfQklORElSX05BVElWRX0vZ2VuX2VtbWNfYm9vdF9pbWFnZS5weSAke1NPVVJDRV9J
TUFHRV9ESVJ9LyR7QVNQRUVEX0lNQUdFX1VCT09UX1NQTF9JTUFHRX0uJHtVQk9PVF9TVUZGSVh9
LnVuc2lnbmVkICR7U09VUkNFX0lNQUdFX0RJUn0vJHtBU1BFRURfRU1NQ19JTUFHRV9VQk9PVF9T
UExfSU1BR0V9LiR7VUJPT1RfU1VGRklYfS51bnNpZ25lZA0KPiArwqAgwqAgwqAgwqAgwqAgwqAg
aW5zdGFsbCAtbSAwNjQ0ICR7U09VUkNFX0lNQUdFX0RJUn0vJHtBU1BFRURfRU1NQ19JTUFHRV9V
Qk9PVF9TUExfSU1BR0V9LiR7VUJPT1RfU1VGRklYfS51bnNpZ25lZCAke09VVFBVVF9JTUFHRV9E
SVJ9DQo+ICvCoCDCoCDCoCDCoCBmaQ0KPsKgIMKgIMKgIGZpDQo+wqAgfQ0KPg0KPiAtLQ0KPiAy
LjI1LjENCj4NCj4NCj4gDQo+DQoNCi09LT0tPS09LT0tPS09LT0tPS09LT0tDQpMaW5rczogWW91
IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NClZpZXcvUmVwbHkgT25s
aW5lICgjMTA1ODcxKTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVk
ZGVkLWRldmVsL21lc3NhZ2UvMTA1ODcxDQpNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZy9tdC8xMDIzNjA4NjMvOTI0NzI5DQpHcm91cCBPd25lcjogbWFpbHRv
Om9wZW5lbWJlZGRlZC1kZXZlbCUyQm93bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClVuc3Vi
c2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2
ZWwvdW5zdWIgW21haWx0bzp0aWNvdGltb0BnbWFpbC5jb21dDQotPS09LT0tPS09LT0tPS09LT0t
PS09LQ0K

