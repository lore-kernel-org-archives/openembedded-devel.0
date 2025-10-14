Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D366ACCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 21:13:26 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.16])
 by mx.groups.io with SMTP id smtpd.web10.728.1760476403419364840
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 14:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=KOE8WR/C;
 spf=pass (domain: siemens.com, ip: 52.101.69.16, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ubMSC0rczozxafnF3vx611lswrVt3bwld9hXXbfKdlFSB5y7eekOrtiV9rqSXVwK4N84a875oQS/F8f1kO46P30PvOwcLSWLmSCr23kDmKNZ+F7asZrVxGqbhcWUi5YfT7Q+WdevyOoO6QN6Gj7nHubWUv7lH3fGNu+vhGn6mQ+jjGIrg6I0fbhqVNMWwjdL91YpTamDFlaSOfhOruuwOaMaY/VcJUjuHL5IbnFE1Afq/tXM30x86401jXQMtX+nuC73KhlLg2KGAGrnLLstOQTHX8y2pLjkdh3V0u3JB86NV90p6CndiNatGkSFqMaBArcFPFKRXTMqbNPGiTaqBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GA6IRFlzjMkhCFQZSn8wtkDkHq12tHgo2LMbOW0Lwk=;
 b=BGURJ+kBMAA+5aYTw8BL9SpGSiDyf85KdvlRL0rOqXNqeepQERtyx7a/GcnyH4kx9l+NxEMPpqC+EPISPJ876prHcXDbrqWJX+0c23V125DEcDJK45jMOtGw6xVKNgIuqvb6VlMtEm87OFTo5erzPf0LAUTQGGVMKpHBNXPZpxEKpjrToBock/UWXWiClhB1m77vJusHBgwIerFp0c86rpo+xqr8yz8XIGJDD/LghpxL5MZ+rjAIs2kb1Rbc0QFsffJswVkMOW9QN6apWr/1rdAqw/4Ayyy1luTrVYTf1+hX0N+gbkMj6RwaO5y5r+ij/c31fdz713xTJmnrY1dA5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GA6IRFlzjMkhCFQZSn8wtkDkHq12tHgo2LMbOW0Lwk=;
 b=KOE8WR/C84ucMcNHaNISA7ViKWRndWjyc8QhqCKibOHwO5zdcw+wcQQahcL+Gr2AjPK+7DeGov5vFr9toOGnqDhTvhc+6ZZ6rAogQ8MaXTUbBHdznsTQTa3Yz+c+zoEL+SbzEVoO0MrbT1N+SspP6B78u6/jajKkqUSP9GkL7EdBa746ZcgAiw4t9HWbBQGiJlKjcf66BLYKnv0ZOhLHd4f01U1UgSA6TEHRZyAi5BLghwCRovQFc0w+Gx+ewDL4YnD7DNZbKaZizbadiLLDdaI9fkBCgsgmiQD0rv5weXqQEshbPdEvN4XCQMIHRNE3rRHPEizsdsEM/HKaLU/mNg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB8247.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4c6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 21:13:20 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 21:13:19 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-networking][kirkstone][PATCH] squid: mark
 CVE-2025-59362 as patched
Thread-Topic: [oe] [meta-networking][kirkstone][PATCH] squid: mark
 CVE-2025-59362 as patched
Thread-Index: AQHcPUpQR7DJNpTWMUid9vltQoNhsLTCInGAgAABk2A=
Date: Tue, 14 Oct 2025 21:13:19 +0000
Message-ID: 
 <AS1PR10MB56970B1DB3E377213CB479F7FDEBA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251014203704.585165-1-peter.marko@siemens.com>
 <3c5e211d-f25e-4516-a59d-b082f5400482@gmail.com>
In-Reply-To: <3c5e211d-f25e-4516-a59d-b082f5400482@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=961f1579-7209-4a43-9b6a-981eafd097d8;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-10-14T21:12:50Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB8247:EE_
x-ms-office365-filtering-correlation-id: cf729345-878f-4528-112a-08de0b668036
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|4022899009|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?VHlmQVhRcUFtbmNIR2NZNm9zb3lEVWRVSWhTdVFzcGRac292TkJXZlRYMEs1?=
 =?utf-8?B?Rzh0WEIyZ3ZrSW02L0NkdWZNckZTVWZSTjlTSURVeGR0blBWSWxWVDRCcUEv?=
 =?utf-8?B?UEdzZjNJZHhlZFBiU2NzMXdVSXF4emI0UGlVcFg1WXNUb0RBd1k4cU1HUFN1?=
 =?utf-8?B?ZExuWklEdFdxZUhVTTF0KzZ0M2JJV3BQSW40NGRwbDcxM0dBaURXbTlvemVN?=
 =?utf-8?B?eWlFZndHV2ZVVDNDT3JWNWFGRVJ6RGR0UHp0d01nWFZKMElQWXlrODVxUG9T?=
 =?utf-8?B?TTdvZUpjMGtISWhHQnBwNHhrU0xHd0tSZFlGejYvSGRhVHhGYXMvOWh6azc2?=
 =?utf-8?B?N3JWR2FYZ05MYXlJTVpaaEQzTmNxT3h1UVRFOUdHUnJVWGwvYnVJc2I3RlVB?=
 =?utf-8?B?RzhubmxOL2swdVBoTmNUYWNhcHZYaGZxUzh4R0h4bFNnQWo0b2xFYXphblNj?=
 =?utf-8?B?UTcrRWVLUWxLS21xNlFJKzhTM2txUE8wanAvTVkxc0FsUlA2TUtpR2dnWE1y?=
 =?utf-8?B?aFRZRDdnbnVKTUFDc0tEVUd5dlpQamZkaGxiWFZyVnByUTF5QVVlZURVWVV5?=
 =?utf-8?B?MTE3cHp5RmtWUTVWY0N1bFFYbm1YRFRMVWlsZDM1OEVqQVZabFBhWUF0S1FM?=
 =?utf-8?B?Ull4aFMxRS9LYUNORERnQjJYTWdvRWdzUUV5RFFaWWxZNlp3VnZwRVFIUFB1?=
 =?utf-8?B?Z3hzSXk5L0xVME9oS3ZIeEozMEpBMUdHOHV5NHFSRndzY2lVVHBZZ2FwUGhP?=
 =?utf-8?B?WE5TRjFEalBoTkhyc3JjQjFjRWI5YkN3MDFBL1JOS3Zyb05oTkVNL1FCeTUz?=
 =?utf-8?B?NlVmZWw1bFE3Yy93elFiaEUyQkFGbHJDYlh4RXhYZFVzYVJCZGtsUnhsNENB?=
 =?utf-8?B?aGYwMGNGcUptdGdWVFNQZHA0Y1JXSnhOZTZSNXRrQzcxSnlWcEJuRHFYOUxB?=
 =?utf-8?B?RnhKemJQc2ZwMGdrWHd2ZnhWSStDTGtaM3h3Mkdvdmxib0VYMmt4dW1mQ2hi?=
 =?utf-8?B?dlhXcHk5T3pBMkhJSFl5NW5qZ1FDVjFLUFhxcXZzS1NYb05KNWhPLzlkeFBv?=
 =?utf-8?B?S3lIRzlSVDlla3dFSDFOL1ZvdnNTeno3UnMxdXFJS0I0ZzhCTm9YdmFaVU5z?=
 =?utf-8?B?eFJCT2dXbVlFcDVhQTUreVFqRmJvb1ZMZzFoZFB5a3cyb00rOHZHeldCcCtW?=
 =?utf-8?B?d1I2dXNIaVlHVmVuTTVxTEFyMVM5VWhDRGRSQlBZMW05TXpLR1JFYnpOSnNl?=
 =?utf-8?B?emJ6UnFUVkUxQ3kxekIwcVVnOGgyWnNHK1psYjcwTWlFV3IyVmNFMTRYSXZB?=
 =?utf-8?B?OGhMUjVBSFNWYWt4cndsYTVpMVBMMmI1ZUlGeE9SUldMYUsvVWx3ejhNUUFh?=
 =?utf-8?B?RnRySVIyak9raVJjSG1hcnl1UGY4K1MzS2RLTk5Xdm1tc1VnaTJ0UVNaNHIr?=
 =?utf-8?B?bExTMmxOanRuU2tLMkROWTdRdGMyRmp0U1BrNWlhelg4c2VUMktqYXpQWWgy?=
 =?utf-8?B?Qll5YW0xY0grV1NBOE94ZThLRUtqTDdFY0t6amNyWDNGM3hHYThnUUlVV21n?=
 =?utf-8?B?ZjN2ZTB2L3dqa0ZieEMxRG5MUGh3ajlwc1FONWZLaXV1VWxTejB1cklxOCt2?=
 =?utf-8?B?SExaZGJGeW8rWWpXY3VOd0VyaGFPUWpueEszL3lhUm1xeEhWZEdqWnZDeWZQ?=
 =?utf-8?B?ZWQySWJpenpmalF1MGZpU2hEREhsSmgxTFRJSXY4djBTbDJJWEVmL0xkaHZ2?=
 =?utf-8?B?WksyMjM4VzNYSVlzbUZ1R1M2alVtUEZVdnMwblZQalhmY0p6L05jZHFXdEta?=
 =?utf-8?B?dTQ1QWNxQWIwdEFNY1hkNU4rZWQ4SFFtcjlEelJkakJ6NFpuWkNoZkUxa1A5?=
 =?utf-8?B?Mkx6VG93S2Rnd1dleFdIOUlGTi91cUxzQncrcDk1YUQ1a3Y4ejhlYnBaNjVo?=
 =?utf-8?B?Z1VHMkdodlFjN0tVbUJ6dnNnREJTckczWUM5QVQ3MGl3NFZxM3I1ZEgySERm?=
 =?utf-8?B?WmRmc2NFOEJnPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QjRnbk93cjZSaGg1TTFsT0ZkSFZzSVhVaXp1eVlOWnNKNFdKM2xHbnFMM2ZZ?=
 =?utf-8?B?T0dQZTBlYjFscXh5dnlNRWtCOXpjRitjaDh4aTEycU15SlVDOGljVHp1Z2dm?=
 =?utf-8?B?Y0k0N1hpZVFKd1J4eXNvK0FPNXRFUnpwcTFNNzlZM2RsOXJzVUE4WGVmUlhT?=
 =?utf-8?B?aUxxQmIvOFhYVXZRWkQ3MDhUOWsyc0pmTWNNZUdYbHUzQ2VKbHFuM2VuaDZN?=
 =?utf-8?B?emZXaVFTc21rVFUzSUlyYVZ1cTJ1V1hVbFl6djVaVVRJVW9ldGNlTVNVWm9z?=
 =?utf-8?B?REJqZE1iWEcydWJvSHdSQUtGN29ScUlGUGRnREZwNUE1K3BDMWd5VkRKMmZM?=
 =?utf-8?B?UFpESi9send1TGIyeUZUYmhyVmhiYWR5RGFLNVpsdU9vMHpmYUk1T0tvbGhC?=
 =?utf-8?B?RDgxL01vQTFNWlJQUVgvaFUxdXFDS3FDNHVxYWx2QzE3YjJ2Y3lYNExYUHho?=
 =?utf-8?B?QlFMYW54RnN0TVgvRnB5RndnS3ltYkZlZlNMUDB1VmRocXpuajdYWmpxRDk2?=
 =?utf-8?B?ZytwRUthL0o0THFUbWVocWVxaEhKY3lJWHN6QUs1QzRjcVN2dDFHRmpLUUFp?=
 =?utf-8?B?UzBuaTNDV2RoVW4weVc4MkZPNU5oVmhLdS81Wmxna1ZVbHVodVlNUmZ4cG9U?=
 =?utf-8?B?QkRoeG9PVmJLK2Ntc3ZOOGp0RXdHelFxanZGWGhHTkU5NXhyVkdHMEVEbGhw?=
 =?utf-8?B?NThMQTVIUCtOaktHdFZnZFpBNWJReEFoNUpyNDhNWEtpamZCbk5NNWlzSlg5?=
 =?utf-8?B?ZnIySjd3OUUwUUxuaVg2ek10SmVGWE53Qm9mRnNEanNDWktqeGtFZkIwTjY3?=
 =?utf-8?B?OWFWUCsvTkYzOXpITmRaYUFxcWkrS2ZXUzd2czBZcFJwck1rSWdJaHU5WDdp?=
 =?utf-8?B?Q0UzUWhOTmVtQzVjdk9VZy9iT2x6NzE1Z3NSUm15NUJzdDJaQ2dYcGJrQ3l5?=
 =?utf-8?B?UHRqQUptMjk1NUJaYU1MZ0I0cW9NWVZyQ2s2dG5MdFBzalErdGxrczk5NlJB?=
 =?utf-8?B?Qzg2dGxlbHJXVTZsNzk4N0RDcWxIbzFhdmdLcGUwOFltRU9mVGpabWFXRk5l?=
 =?utf-8?B?UkJwMXV1YmdtTFgyR2VCT0N4d3ZMUkdlZU04RlYrVGlScGtLcUFFSVF6dG1o?=
 =?utf-8?B?cFhONUZhR2ZjZjZydkpWRG5kbFA4eWRqRUEyS251THRnRW9qNGcvenNhL2pV?=
 =?utf-8?B?a0tRTTR2MFc1NFZGV3YzcWVNWGxON01PeHlORDB0U1hreklUMVZrOUNvSTdR?=
 =?utf-8?B?azhDSVB0dGNpMTE4dDl1R015dUU1NFBTYVZFQmFWQ1dUb0UvWWRsRFdyNHIz?=
 =?utf-8?B?L3lCTDI0cGFLa3lwRWlSdnp1Kzh3bjBXOXFySWRlZ1lwem9WNG1MLzZtRkhP?=
 =?utf-8?B?WHU4bU1JcmRLZ3IzNE4rZXpsTFJYK2diRGMxV0FyZWlDMXdqU3diK1F0ZElz?=
 =?utf-8?B?enJ6VTRRaVJrTUl3UTVNU1J4WUxVRjA4eE91YW8xYUlXK0cwNDJJK1hjeEI3?=
 =?utf-8?B?enRHUEQra2E4eDJQd3hySTNZby83WUNXNXdmWEV4cEJuTDk3bjNEclI1Rmp5?=
 =?utf-8?B?OUdrMUVhY0VwSmNneE5mMmQyeGpDNlRZcU1mWFBMNU1Gb2p4SSt2UDR6SHNN?=
 =?utf-8?B?R3dCY3gwRnJkdDVKcy81UDh5RjhTL2ZpZ3RyNjBrRC9GQ0NqSjFnVmpYOGpq?=
 =?utf-8?B?cGtOZlp6MjE5dVAwbFVNdGx0bnVoRS92SW1KMGljREgwd0duZHFYV1NyVnVN?=
 =?utf-8?B?RFFlemlKQnowa1pmTnNPd2JITjlhaE91OFZhQVQ3V0l5SVFZS2V4dXVjMGh0?=
 =?utf-8?B?TlRUSlJTbndLQ2duaTAyOXZyT0thTzhrZlVNVFovYWR1eWdDb0s0alBhZ1Nm?=
 =?utf-8?B?clRUK1RrY09jQlV2L1N5YXhPZFVNbFVGT1IrRnh5aHF0a3Y2dlBrN3BYMzN4?=
 =?utf-8?B?SXlWUEFCWmJtOE5KQXdCWTFaVDRud3BaOWIyOXVybEY3Q2xFMEJscGsxVElk?=
 =?utf-8?B?aXpndTZQZE1WYjR0MWFFaE02cE4rM0dBd0htZndneTZRWUI4L3lzUWwvZ2pZ?=
 =?utf-8?B?aWQrT1NURXJqTWhlZTJaTmFlYm4wM0FFYmtEOEd2c1FxQzI5M0tsbmpzRXFv?=
 =?utf-8?Q?hrYgMbh1niAB4XkMggqox3Jta?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cf729345-878f-4528-112a-08de0b668036
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2025 21:13:19.8541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +XA7Y2SafTTP5Cf3esEKY+U/O76S/ewuQtIf3/GmU6xIBTp3LVPCkR/VKUlL/J1geeqxK51aAienZlpP25J3BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB8247
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 21:13:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120655

U2VudCBuZXcgcGF0Y2guDQpUaGFua3MgZm9yIG5vdGljaW5nLg0KDQpQZXRlcg0KDQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEd5b3JneSBTYXJ2YXJpIDxza2FuZGlncmF1
bkBnbWFpbC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMTQsIDIwMjUgMjM6MDcNCj4g
VG86IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMxKSA8UGV0ZXIuTWFya29Ac2llbWVucy5j
b20+Ow0KPiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW29lXSBbbWV0YS1uZXR3b3JraW5nXVtraXJrc3RvbmVdW1BBVENIXSBzcXVpZDog
bWFyayBDVkUtMjAyNS0NCj4gNTkzNjIgYXMgcGF0Y2hlZA0KPiANCj4gQ291bGQgeW91IHBsZWFz
ZSBmaXggdGhlIHN1YmplY3Q/IEl0IHJlZmVycyB0byBDVkUtMjAyNS01OTM2MiBpbnN0ZWFkDQo+
IG9mwqBDVkUtMjAyNS01NDU3NCAtIGl0IHRvb2sgYSBiaXQgb2Ygc3RhcmluZyB0byBzZWUgd2hh
dCdzIGdvaW5nIG9uIDopDQo+IA0KPiBPbiAxMC8xNC8yNSAyMjozNywgUGV0ZXIgTWFya28gdmlh
IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+ID4gRnJvbTogUGV0ZXIgTWFya28gPHBl
dGVyLm1hcmtvQHNpZW1lbnMuY29tPg0KPiA+DQo+ID4gUGVyIFsxXSBDVkUtMjAyNS01OTM2MiBp
cyBmaXhlZCBpbiBwYXRjaCBmb3IgQ1ZFLTIwMjMtNTgyNC4NCj4gPiBUaGF0IHdhcyBhIGNvbXBv
c2l0ZSBwYXRjaCBmcm9tIG1vcmUgY29tbWl0cy4NCj4gPiBXaGVuIGNoZWNraW5nIGl0LCBpdCBy
ZWFsbHkgY29udGFpbnMgYWxzbyBjb21taXQgWzJdIHdoaWNoIGlzIG1lbnRpb25lZA0KPiA+IGFz
IGZpeCBmb3IgQ1ZFLTIwMjUtNTkzNjIuDQo+ID4NCj4gPiBbMV0gaHR0cHM6Ly9zZWN1cml0eS10
cmFja2VyLmRlYmlhbi5vcmcvdHJhY2tlci9DVkUtMjAyNS01NDU3NA0KPiA+IFsyXSBodHRwczov
L2dpdGh1Yi5jb20vc3F1aWQtDQo+IGNhY2hlL3NxdWlkL2NvbW1pdC9hMjdiZjRiODRkYTIzNTk0
MTUwYzdhODZhMjM0MzVkZjBiMzViOTg4DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBN
YXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4gLS0tDQo+ID4gIG1ldGEtbmV0d29y
a2luZy9yZWNpcGVzLWRhZW1vbnMvc3F1aWQvZmlsZXMvQ1ZFLTIwMjMtNTgyNC5wYXRjaCB8IDIg
Ky0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtZGFlbW9ucy9zcXVp
ZC9maWxlcy9DVkUtMjAyMy01ODI0LnBhdGNoDQo+IGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMt
ZGFlbW9ucy9zcXVpZC9maWxlcy9DVkUtMjAyMy01ODI0LnBhdGNoDQo+ID4gaW5kZXggNDk0NjA2
MDMxMy4uNmE1OGI1NmE5ZSAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBl
cy1kYWVtb25zL3NxdWlkL2ZpbGVzL0NWRS0yMDIzLTU4MjQucGF0Y2gNCj4gPiArKysgYi9tZXRh
LW5ldHdvcmtpbmcvcmVjaXBlcy1kYWVtb25zL3NxdWlkL2ZpbGVzL0NWRS0yMDIzLTU4MjQucGF0
Y2gNCj4gPiBAQCAtOCw3ICs4LDcgQEAgRGF0ZTogICBUdWUgTm92IDIxIDEzOjIxOjQzIDIwMjMg
KzAxMDANCj4gPiAgICAgIGJhY2twb3J0DQo+ID4NCj4gPiAgVXBzdHJlYW0tU3RhdHVzOiBCYWNr
cG9ydCBbUmVkSGF0IFJIRUw4IHNxdWlkLTQuMTUtDQo+IDcubW9kdWxlK2VsOC45LjArMjA4MDYr
MDE0ZDg4YWEuMy5zcmMucnBtXQ0KPiA+IC1DVkU6IENWRS0yMDIzLTU4MjQNCj4gPiArQ1ZFOiBD
VkUtMjAyMy01ODI0IENWRS0yMDI1LTU0NTc0DQo+ID4gIFNpZ25lZC1vZmYtYnk6IFZpamF5IEFu
dXN1cmkgPHZhbnVzdXJpQG12aXN0YS5jb20+DQo+ID4NCj4gPiAgZGlmZiAtLWdpdCBhL3NyYy9B
Y2Nlc3NMb2dFbnRyeS5jYyBiL3NyYy9BY2Nlc3NMb2dFbnRyeS5jYw0KPiA+DQo+ID4gLT0tPS09
LT0tPS09LT0tPS09LT0tPS0NCj4gPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNl
bnQgdG8gdGhpcyBncm91cC4NCj4gPiBWaWV3L1JlcGx5IE9ubGluZSAoIzEyMDYyNSk6IGh0dHBz
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC0NCj4gZGV2ZWwvbWVzc2Fn
ZS8xMjA2MjUNCj4gPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9tdC8xMTU3NjAyNTkvNjA4NDQ0NQ0KPiA+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQt
ZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJlOiBodHRw
czovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvdW5zdWINCj4g
W3NrYW5kaWdyYXVuQGdtYWlsLmNvbV0NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+
DQoNCg==

