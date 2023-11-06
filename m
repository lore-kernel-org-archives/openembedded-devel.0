Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3EF4C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 08:24:28 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (APC01-PSA-obe.outbound.protection.outlook.com [40.107.255.121])
 by mx.groups.io with SMTP id smtpd.web10.50013.1699259066380050421
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 00:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=O01r171F;
 spf=pass (domain: aspeedtech.com, ip: 40.107.255.121, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6N8aGwONIB7+M3NWtqUyMp4VRa3MkFWRocHzPRRZqPIBBzvCZNgQPs/OrkjRxvlAI+a3QZuqJ/bI8rHFyZ4eZoNFDgFB65U+CAQqLhZ3GuUKFGwyEh10ktvbukcnoC+P7UXCUifql/3CssLrQkQQrvalH3CVYqoKFVStCXq94atetvCAmO2kQSnt9vFyXeFpPJ+WkZ8roK8r/ShOtKpJ8kmYvT/oxYKqQijkL3q9TCjftIN8/9kj1plbE/pcs+RPMJXOippCHJF9dsjGSPjeBBoxDR2p44wmn9BVQHdt5oULX07wDCjMtI1Nc7RiA3eZfGhoxfiUsznmHF+2AIATw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VtyV0R3XCYJCmW2zgjmBR+41xi5307sbU77CfanOHbc=;
 b=eZRwdrpe3QHRFdCHb9HDlRupUYcZ36BFKMTv6UfYVTQPB7nWdEx0rj8nu6JMNOfjS27PGhMgrCzxtGH8HtBpi5WlXSiMiXAOMMzCiohCQesADlT3awUsPdc1+sVw2FfdJYtuqBmB+0H3rx6x7yycxc+2QHF0ZSwuKe20yRR5WDywG5IqqBrXtAEjrzXUI+PfklnbyWSgxCnP/5OlMnsSlzLL5FnthVZmD7I7WMMsepnw5yj1QEIHwYIIQNUeacaD8QGMnmy9gX1RdBD9QE3LbsKRYP5VIiyRP+ZCDjbHQM+euwd4CiV7WFd/gHnDa23Y0MFOrccpZM7ekv/5o05teA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VtyV0R3XCYJCmW2zgjmBR+41xi5307sbU77CfanOHbc=;
 b=O01r171F+qqoVrbnsyMbCrc6VGn74cnyDDBvcVcMmPgGMU0IjGO9++Yi9KwGcNZP6cHYpQ0reclipL1RD3puyr+U3uwMNHP5VTAoKIXCnW7HoQ+PIIOv3+DwVR2/7A3qOkbdvML6x8aRgy1Zx1v0qTl7x9hY+MO15ixhILwo1wOWloQFf2U76PNkA71sNcpMBz0rRSPXlmt5I92kioRVRLwHclTAqeTZNqweNBRRvL7eyDCVXgappb7Fdqj7ahITWHeZxqEx0v8+uoHi5EnCf8t2uxvLuDg8tHKO/A0i2l/3KW50hsR+F+sZtP4zqqPixVhtlhSinUAf3VV1lB8THQ==
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com (2603:1096:4:1a4::6) by
 TYSPR06MB7019.apcprd06.prod.outlook.com (2603:1096:400:46a::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.25; Mon, 6 Nov 2023 08:24:20 +0000
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::5459:bda3:7997:ebe3]) by SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::5459:bda3:7997:ebe3%7]) with mapi id 15.20.6954.025; Mon, 6 Nov 2023
 08:24:20 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [PATCH v1 1/1] Brotli: fix build failed if the path includes
 "-static"
Thread-Topic: [oe] [PATCH v1 1/1] Brotli: fix build failed if the path
 includes "-static"
Thread-Index: AQHaDkoxRFKEdhY2t0KjofpEegtxl7BoyTeAgAQvL5A=
Date: Mon, 6 Nov 2023 08:24:20 +0000
Message-ID: 
 <SI2PR06MB504100AA5A1E8947F92A05A2FCAAA@SI2PR06MB5041.apcprd06.prod.outlook.com>
References: <20231103052919.3649613-1-jamin_lin@aspeedtech.com>
 <CAMKF1so05LhZv11-jM398QvnJk0VkSA0oKe6Y7Qdvq5vravQwg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1so05LhZv11-jM398QvnJk0VkSA0oKe6Y7Qdvq5vravQwg@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5041:EE_|TYSPR06MB7019:EE_
x-ms-office365-filtering-correlation-id: 54b9b791-c623-4c64-cc17-08dbdea1c68f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YEIZihq0H3jvaPD0Gf8OanQbsHY/ScYGSiFv6W8rWoiu0+lydHXpsqYS+ri23XXHOHZwPqZ5l70E0L1bKNeHlYbZ4d5OC3Y0xoxd7RQ1sNcxziomktu5uLGRm/7th46CmHtgclehvwO3oGrE790R+qfWytDKlQrmSy3FMmoLnuDhINJFT29zTs8qnT7O7tPsLNXTl5l1odKD1Wu0/QF0WtVDhYtL/nTuXdeCBy0piWa7pKSMPU4Vgqu8aHax8cUQzsO3pKW6ihaPRo0I6CixHEZn2wAS+jHsJzYigSloyq0JKfMbt8ebFe01dySZP+t3vJa0zTVSOZ4UZQyT6cFXCOSWtNleik0u1MkjXps3hSp/Pzj5sNth2ZJ/wK7MsfCS6QwafO+KfvPvSXrolxhzwLsfdM7bzx8JzM2cGHPbFkKlFKn2IDj0ZJb0jWSZnz+QC7S2Ie9+GpB7+UBknsUcptgCNp391QheKsQkRMN+9N3SJjq6iOiekB548K8CgVarFg0/7W9icFW68J8rnecPZMJg6KKuxnZEDR/lTIAIQbKAWhnTsH+K1iGfmMGn3vlT0Kb2frXDdj4z66hwq3WWpgfNyajY9slB2QXqFXZM9sU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5041.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39850400004)(366004)(346002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(55016003)(33656002)(6916009)(38070700009)(86362001)(66899024)(6506007)(26005)(9686003)(5660300002)(2906002)(53546011)(71200400001)(316002)(76116006)(966005)(64756008)(66446008)(66556008)(66946007)(66476007)(7696005)(478600001)(41300700001)(38100700002)(4326008)(8676002)(8936002)(52536014)(122000001)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RHBiWUZnYm1iUTFqcklKMFNBQ0V0S1k0MW9LZXI1bk01ZXJnRHlVRW1sNWR6?=
 =?utf-8?B?M2lGajBoWHdHdlJkTnFXejZadDdSWFlpMjNaUTU2K2thR0pvenhIaE1BK0FB?=
 =?utf-8?B?clVuUmc5QVJ6anR3T2xwcHVYNERYUENCMnVpVngyWllMQ21kTmZQa0RvN0xy?=
 =?utf-8?B?STZMb1BvYVp0ckU1U3I4Y1pFYVpJQkcwWnFVUkdCUVJpMktzSjU3VXFmRkRV?=
 =?utf-8?B?dlYxYVByNzB1Q1JJK3NoaHJRYlh4ZEJDUHdJVXFOMHgyb2NMVE5nZUdNRHVU?=
 =?utf-8?B?VXRsb1Zidlp0Tm1RTkZMN0wrREgwUGdjZ1JGZ0VNN0ZWNXNKUWRKbE9MOHJE?=
 =?utf-8?B?U3ZPRXVQVUFtM3hwR1ZiUG5jWmZrQm9rTUNOL0FzUFF3bFlyRWhxWGlRNnYr?=
 =?utf-8?B?WWozWlU2aWdNdzJZK3hQZEhHWDNnZTRKZTdmMERwV3RUVHF2aGd3UVVBWndG?=
 =?utf-8?B?Q2U3dDNkSjNUT3NnRFU0eWthbGJuRkFBYTZ4TElpM1BCTDRJMkF5WlZ3Zlgr?=
 =?utf-8?B?cGJGZmhCZEZReWx0UExvN2hJQ3d6L290eHMvc1N3b0k0a29hMVhOdGRFSXNr?=
 =?utf-8?B?dFdJMUEvU3JrQnl5RDc4V1F2dnF5OEt4cnYxQTFualU5akJqdkpqNFJJZlpH?=
 =?utf-8?B?YWdOUzM5aGpYbkZqOFhDaXIydjBJTXlpUXBXY0JrQXhHREJvZmVSYWNPVUpj?=
 =?utf-8?B?ZFVKeTlUc2VMU09zUGI4OVNaWXZtOU1XTWEreS96MFJVUVR1ek1lTG90SzZ6?=
 =?utf-8?B?UXprTVM5MGI2bG5TclB0SFpZeW5PWDZ5cU9BaWhESUYxVkJLT2Z6dkloOXdD?=
 =?utf-8?B?M0h3UDJwbEw3bjByMWFwdU1BNm5XbGtKMHU3NVNNSWhXUmVIT01hY2pMYjNJ?=
 =?utf-8?B?VnlYRk9rYkVCMDhXV1Y3SjJaR1RjTWRZbi9WOGVBbFp4SWs4ZnNVcXZqYmg3?=
 =?utf-8?B?SFpoRytVSXRaVTFONTNQU3g2MGpudWxEOGhTOEhlekg5Y1EwWHJnVThRVkkz?=
 =?utf-8?B?ZEhueVdkNnB5dUVPL0h1VFFhOG9hZUROZ0tLc3BlM0Rmc0IyYWMvNkpDUXVp?=
 =?utf-8?B?Wkd4bHRsRFd6ejhENjBFZGE5WitDWnJ0cjNBdUowRTNqMytTYkRoRmE2Mzhv?=
 =?utf-8?B?NjZZc083VzNURldlOTlhSjA5M2hISzlBNUp6TDFHMk1QWlMxQURDcStwNThM?=
 =?utf-8?B?bVNWdGdYcVplODl5SS9RU21xMjdtUWhlZkRLaGVwY3BucW9LWHRMTGJOdnpF?=
 =?utf-8?B?WUFsR1RvbWRyL2dwNWtUQVY1dlV3enV2WUtHZmwwZ3U0RFFoc04zM0tLdzZs?=
 =?utf-8?B?eTBOclRiZXlRQ3FUMDZwRldBZWVGb2ZRQkRBeVQxUUFkdjU2UEIwNjJ3cWtQ?=
 =?utf-8?B?NHBYQjdsb042SnBzNVExUTBvQm4ySUFFdWR3SnViSTQvRWo4Sm5DUElkV2VP?=
 =?utf-8?B?MXdiejVMcS9LVUtDdHJaY3UwdXVKN0VXdFkxeUUxUWJ5MjVBcTdLSXJ2eWhu?=
 =?utf-8?B?ek5Cbk5FK3BicnJHV2hDUklvcW55TTBKS282WGR5aWJ3bTdxeldDbUVuQ0RZ?=
 =?utf-8?B?WHlhb1JTdDNTSnlvdGRjRGt4ODZHSjFZVlVORE1vYXZqdzNmdFl2RjFIZ1Ft?=
 =?utf-8?B?SHJvSHU3bEhCdkNLazVWMThHNEMwaTB1cGtIN2dWWElZbHJBYmM1cUJwZzZw?=
 =?utf-8?B?eGV2Qjl2NExkcmRMeDQyeno2c1B4a2lCWUJjKy8xU0VlUWExanNORXhyV1Vu?=
 =?utf-8?B?UFhqanZ2YWgzNTV0N1ZjeEt4Q0Z0ckxjelpuWkZLZUV0Y3ZScmZVMXRpd0c1?=
 =?utf-8?B?Sko0ZnF2dWd3V2hYWitEYW1vU2FDNE8zTEFUUXBXblkwMjdINWFyOUtBQkFX?=
 =?utf-8?B?RWwvWSt4dk5HLy9MTjZMM1BWWXZPYkZuVktnekVRbW1EVTN3TVFVd2pqMDV4?=
 =?utf-8?B?UC84MTBlV2paVGVRdE5SVXdCZlZFLzRaQnhUZ2VDb3pIeVFtYml0RmwyZHQx?=
 =?utf-8?B?MUZsRytTT2lOVjhQRHBzSUh6d1VoWmVDQk5XcXd5aTFNT3hPb3hZQjloSy9X?=
 =?utf-8?B?N1RFRGl3VlFNTUQ0UGhGSFIwMm8rVUtlUmZSNkRDZnJabUFMTWpqZE5JalNa?=
 =?utf-8?Q?9BLYjV3BFSlyzdTHI8a0bzOeI?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5041.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b9b791-c623-4c64-cc17-08dbdea1c68f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 08:24:20.5417
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wde56s57/pvJx86+qfN3NAtMtmVypVFf0oVe8L8AHB7qejPjlJ9avcqEnjXWZYfB9X8IQEjgafaRe1CjWrLcErN94ImSJRy/rSQPuiWSxGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7019
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 08:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106399

VGhhbmtzIGZvciB5b3VyIHJldmlldy4NCldpbGwgZml4IGl0DQoNCg0KRnJvbTogS2hlbSBSYWog
PHJhai5raGVtQGdtYWlsLmNvbT4gDQpTZW50OiBTYXR1cmRheSwgTm92ZW1iZXIgNCwgMjAyMyAx
MjoyOSBBTQ0KVG86IEphbWluIExpbiA8amFtaW5fbGluQGFzcGVlZHRlY2guY29tPg0KQ2M6IG9w
ZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW29l
XSBbUEFUQ0ggdjEgMS8xXSBCcm90bGk6IGZpeCBidWlsZCBmYWlsZWQgaWYgdGhlIHBhdGggaW5j
bHVkZXMgIi1zdGF0aWMiDQoNCk9uIEZyaSwgTm92IDMsIDIwMjMgYXQgNDozN+KAr0FNIEphbWlu
IExpbiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8amFtaW5fbGluPWFzcGVlZHRlY2guY29t
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPg0KPiBJdCB3b3VsZCBsaWtlIHRvIHJl
bW92ZSAiLXN0YXRpYyIgaW4gdGhlIG5hbWUgb2Ygc3RhdGljZSBsaWJyYXJ5IGF0IA0KPiB0aGUg
ZG9faW5zdGFsbCB0YXNrLiBGb3IgZXhhbXBsZTogcmVwbGFjZSBsaWJicm90bGljb21tb24tc3Rh
dGljLmEgDQo+IHdpdGggaWJicm90bGljb21tb24tc3RhdGljLmEgSG93ZXZlciwgaWYgdGhlIHBh
dGNoIG9mIHRoaXMgc3RhdGljZSANCj4gbGlicmFyeSBpbmNsdWRlcyAiLXN0YXRpYyIsIGl0IHdv
dWxkIGJ1aWxkIGZhaWxlZC4NCj4gKGV4OiBzZXQgbXkgYnVpbGQgZGlyZWN0b3J5ICJidWlsZC1z
dGF0aWMiKSBDaGFuZ2UgdG8gcmVtb3ZlICItc3RhdGljIiANCj4gaW4gdGhlIGJhc2UgbmFtZSBv
ZiBzdGF0aWMgbGlicmFyeSB0byBmaXggdGhpcyBidWlsZCBmYWlsZWQuDQo+DQo+IFNpZ25lZC1v
ZmYtYnk6IEphbWluIExpbiA8amFtaW5fbGluQGFzcGVlZHRlY2guY29tPg0KPiAtLS0NCj4gIG1l
dGEtb2UvcmVjaXBlcy1leHRlbmRlZC9icm90bGkvYnJvdGxpXzEuMC45LmJiIHwgMyArKy0NCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlm
ZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9icm90bGkvYnJvdGxpXzEuMC45LmJi
IA0KPiBiL21ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9icm90bGkvYnJvdGxpXzEuMC45LmJiDQo+
IGluZGV4IDRlMjgxM2RkZS4uNjQ5MmIxOTQzIDEwMDY0NA0KPiAtLS0gYS9tZXRhLW9lL3JlY2lw
ZXMtZXh0ZW5kZWQvYnJvdGxpL2Jyb3RsaV8xLjAuOS5iYg0KPiArKysgYi9tZXRhLW9lL3JlY2lw
ZXMtZXh0ZW5kZWQvYnJvdGxpL2Jyb3RsaV8xLjAuOS5iYg0KPiBAQCAtMTYsNyArMTYsOCBAQCBp
bmhlcml0IGNtYWtlIGxpYl9wYWNrYWdlDQo+DQo+ICBkb19pbnN0YWxsOmFwcGVuZCAoKSB7DQo+
ICAgICAgICAgZm9yIGxpYiBpbiAkKGxzICR7RH0ke2xpYmRpcn0vKi1zdGF0aWMuYSk7IGRvDQo+
IC0gICAgICAgICAgICAgICBtdiAtdiAiJHtsaWJ9IiAiJChlY2hvICR7bGlifSB8IHNlZCBzLy1z
dGF0aWMvLykiDQo+ICsgICAgICAgICAgICAgICBiYXNlbmFtZT0kKGJhc2VuYW1lICR7bGlifSkN
Cj4gKyAgICAgICAgICAgICAgIG12IC12ICIke2xpYn0iICIke0R9JHtsaWJkaXJ9JChlY2hvICR7
YmFzZW5hbWV9IHwgc2VkIHMvLXN0YXRpYy8vKSINCg0KVGhpcyByZXN1bHRzIGluIHBhdGggd2l0
aG91dCBhIHNlcGF0b3IuDQoNCkVSUk9SOiBicm90bGktMS4wLjktcjAgZG9fcGFja2FnZTogUUEg
SXNzdWU6IGJyb3RsaTogRmlsZXMvZGlyZWN0b3JpZXMgd2VyZSBpbnN0YWxsZWQgYnV0IG5vdCBz
aGlwcGVkIGluIGFueSBwYWNrYWdlOg0KICAvdXNyL2xpYmxpYmJyb3RsaWVuYy5hDQogIC91c3Iv
bGlibGliYnJvdGxpY29tbW9uLmENCiAgL3Vzci9saWJsaWJicm90bGlkZWMuYQ0KDQo+ICAgICAg
ICAgZG9uZQ0KPiAgfQ0KPg0KPiAtLQ0KPiAyLjM0LjENCj4NCj4NCj4gLT0tPS09LT0tPS09LT0t
PS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMg
Z3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTA1ODU0KTogDQo+IGh0dHBzOi8vbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC9tZXNzYWdlLzEwNTg1NA0KPiBN
dXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMDIzNjA4
NjIvMTk5NzkxNA0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWRldmVsK293bmVyQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC91bnN1YiANCj4gW3Jhai5raGVtQGdtYWlsLmNv
bV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4NCg==

