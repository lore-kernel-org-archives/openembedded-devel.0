Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A950C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 18:14:12 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.66])
 by mx.groups.io with SMTP id smtpd.web10.95301.1738606449821691291
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Feb 2025 10:14:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=nOemVUnw;
 spf=pass (domain: siemens.com, ip: 52.101.69.66, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jYtlKyPDSk+uO8vo5pJga/Fq/xBMybtuSCPt2ke/ZOnqvW5N8it5mBQo18+OPH4j/laxXrsD4D6vY4O5xaGDMN6McLB0W2gaot1MqrIneVZb1jITKNk5QnXvSH92AVfcS60RmlZ7nD3LjkaQpYGj1Im45dmR5041JotpHoaIMsrpQwKlKftg9mUpiEgmJcL93H1UfIpZGwWrqnP/Htda271zPYG/MEky9w6m0WtGylEDnaLh0Q5dR2oEp3pPFVGfja1yn8O0j69kHz7Yu+7rf+QCyu/aHbq4eMDRtfhyKbJR9wIpm5eAFbu56eNbKnCpyvndH3WJ6WvePA+mzFNkZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/rjSo82BpbEROTZrkikhy6A8xZ7CQ/dPZ264p+0pbdI=;
 b=XoIEbvqwDljxDwZJb8Jio/HgfKwkt6PoDipHb4oRZto3NDjrmSaUtfhlIt7RwaunLbMLzzelcMyrOBbV+g9z4ZayXkAQvwGqbk+ZYgaRHnBIRyYpPutDgRdpFmuG4W7pyjK9OxWX+puFtA96RqVJy5lrIF6xmZK9DFw7IZjmLtLJH4B209DDXGof61PsU+OlrqabVgdf29b2GxRTdOOXUnc9eoD977cK8Bk4EGwbkVRZfWr2wm33D8hsN/tDeQCg9ijBaRoUE/dpgLrFjt0o5PGaBUWdrSaJ9uuOpSMdDakV8GVw6mAzJN/t+6TmYzCOUSvnkDqPR40SC1oC2k0E0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/rjSo82BpbEROTZrkikhy6A8xZ7CQ/dPZ264p+0pbdI=;
 b=nOemVUnw3SjMw6z1emyhwRweEmIYIiLaRj/EeA7VwD1i5ScbLwLp4NNj5AxMe53vGlx8N2ZmnR/Rf7ly1zqJcSWOx3TvDqNs7kjr/ngUO0Rc0UK7JweDUItyz0Sds451u2kHoSNFRpTL30COnLNlPFLNmqWsuNfkcaFS0uK08jvfOBATNDhpzAQSrnaVGe2HrxYR4zwubsB7itldK4Xd+puNxxf0DRcjchg9qIyTABZD7z41/4NhY/LKuyB8ed+qFefdoCQVjIkGoHoJBBpRfHoCfc2T7kvNsPxYhIuhK0+LGChIT9nbgjJnYbDf3OChNHp8MMmS8iky3ZJWWyW5WQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GVXPR10MB8198.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:113::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.8; Mon, 3 Feb
 2025 18:14:05 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8422.005; Mon, 3 Feb 2025
 18:14:05 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH 1/8] protobuf: remove unneeded atomic linker
 flag
Thread-Topic: [oe] [meta-oe][PATCH 1/8] protobuf: remove unneeded atomic
 linker flag
Thread-Index: AQHbdbsC78OfOV5LTUSlC2ZUabthXrM0u58AgAEVFYA=
Date: Mon, 3 Feb 2025 18:14:05 +0000
Message-ID: 
 <AS1PR10MB5697FF5346CE3E966DD5D32CFDF52@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250202213910.284312-1-peter.marko@siemens.com>
 <CAMKF1srD+9NqL9ntuMrGDa3ys_Gn3YnqazO_7KWb8cTnwk1CHQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srD+9NqL9ntuMrGDa3ys_Gn3YnqazO_7KWb8cTnwk1CHQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=3a37c13e-e039-4e9b-9dbc-8bf833b663f8;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-02-03T17:07:19Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GVXPR10MB8198:EE_
x-ms-office365-filtering-correlation-id: 638a3a2a-b65a-48b3-b089-08dd447e8ba0
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Qk1FdWpiM3RaRE9lNS9mUXdFRUVJcTJBSGRKYXdPRVYwdzR1NTVRc0FkS1Nh?=
 =?utf-8?B?Um12bzJkTi8zemxkcXZicUNKYU1pUlh0NkI3SjcvcHo4cGxqWHpUaU1oZVpq?=
 =?utf-8?B?MTFwOTA1NTlYUVZHRjhEY1hGSVQ2WmNhRUd3V1JzVk1xQytKUUNoMi84d2hG?=
 =?utf-8?B?aFp5OFhYTEJVM2tGbkpFSlJkajFVY3N1SHMvOUluVlVTRzJqb1BzTDZTNCtp?=
 =?utf-8?B?eEFyUjZCM3VqMUhUbGdla1V3UUZVWVQxenZ1ZWo1c0tOdXZjcWpPaFM2ZEUw?=
 =?utf-8?B?SlloempmY0Z6ZFVHbHdFNmVpZXpGRTdiREh1UTRyWXUzNWl0Ylp5WWlUNzF2?=
 =?utf-8?B?YTF2Vk5Qb3R1ZVJZK2IwdzhPSG5FQldXSUNrWEU3c2FUeW01VnF4NXJiVTBW?=
 =?utf-8?B?Q3QzWDFMSXRhbm5BSDJUcEYwVE1CYmlXUE53emFkM3pBNWFNUGdoNEtpcDFj?=
 =?utf-8?B?RHpic2ZoQU5rZkhmeVkrU1c1RjRGa01XUE8yVlRYMEthdzh5dTB0U051Wlht?=
 =?utf-8?B?QmlVNmR1QzBJOUx6V3VTaTlXK3RONG5QbXYwYlR2NGtReVFuWGVEazQyenBP?=
 =?utf-8?B?a0lqRjVnOGhlZnhtUFJCbkI0Z01hVWIvYzNjMnJLV0Y3aFIxbEhRUzdEL1Jw?=
 =?utf-8?B?VU9nQVQweHJmOTlRSmlPUzdsVVhzd2wxV1lSQm1TRW9YaWNMdjZQNE9RWUY0?=
 =?utf-8?B?NkdocDFKbTRUV3dFQWxYVGduK2RjQThUdXZyWG8vMUxHMFQ2dHJ2TlN0U2dP?=
 =?utf-8?B?Wk5hemdzMzg1ZUlrY3QwaVdHZGpOR1JmL0N0NEhMNGsxZGdNU2NxK3d4VG56?=
 =?utf-8?B?b3FVQXNPLzlCMDZ2UnI5Sjg1SEM5VDkzQ3kvczJaMkNFNHYvZzJESi9NNm93?=
 =?utf-8?B?NlZDT1FrV2QyZVMvUDY2MlJYY1EvMXAyZHZoVEJlTHV3RkxscVZtb3hCRnF1?=
 =?utf-8?B?ejFPQlo2Z3hCZEp0TGxtVDE0V2RqTkkrU1U1MUxhZXdiek1FQWwyZ3JkdGt3?=
 =?utf-8?B?eWZzekw2dkhSVjdKZWlrV0NEZW9HVFpjTmlXNERjQ0N1WUZiSTJZcGxobGow?=
 =?utf-8?B?YVFCRlZ1V3NhK08zeFBFOTI4L3JsYmVrMWF4MVU2MFVxT0hsclFHMFJaNlRl?=
 =?utf-8?B?Uk93b0lzMUZkbUNkb2p3RXBkcDQyUnl6NFh2QUF5ajBKV1l1TmlJS00rS0hW?=
 =?utf-8?B?ZTZ0ZElBNFoyTlY5L3ZaUU9UWGJZeHVJRktIM2xtWDY5OWViRTFrclNFL0lr?=
 =?utf-8?B?L2RNQW4yYUJWMUI0ejFpWVQ0L3lSdXRJbXcwT3NMSkplUTRoOXFlZFlYQnUw?=
 =?utf-8?B?ZFkxVWdLdFdhQXNjdW9mWGJRbVZyQ3dPSklJTHZRc05xbk5veHVkdm9Sc0NQ?=
 =?utf-8?B?bU1pV2RLazZXaHROUHJvSjk5R0RpYUIwK0RweS9UeXFEOUkzQjhIb0IwNmlU?=
 =?utf-8?B?ays3V0hlTEpNR3FxZFZJTFIwT2krcC80VjVsN1VUVk9MQTBhVkpRZjBLLzZU?=
 =?utf-8?B?c01ybmhJYjBVNGFOTjBVbWFvL1RMUEFPZlhOZUFPa3p4ODZqUG8vOEI4aEky?=
 =?utf-8?B?eE9nVE4zeGpjQUhFVnA3S2hmMmQzdmlqQTh1bHFsb3RyMXlBN0FmTmw1ZmEy?=
 =?utf-8?B?ZTBoaXF0L1cvNzhFcXFZdGNTVWk3dU9kbkpGdENCM0NyWVRVeVV0ZTJjbWJm?=
 =?utf-8?B?SytVNkt0Wkt4cWk1dzhNR0pGQ3YxQURvWDEybU1qaGtMV0RiM2dZRVVwdlpY?=
 =?utf-8?B?WVJEYkRoUmFyWU9qUS9mS1FwRWptb1o5d25HNzRIL1krY2hVUXBRT05ENXJh?=
 =?utf-8?B?cDVVNll4MWlzQ0dkcFdibEFmZlhSalpDYTJZVVlBeU5qWHpKWUhvM2ZKK0RE?=
 =?utf-8?Q?8bpWmMIVp25Yp?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MHZFdkVYQm9CY25tR2N1Y0daWFhpNjUva0QxdHJaS3I3d1M2YUU0dWNwUWZ2?=
 =?utf-8?B?UTNEb1NNNjNEYlkvMU5wSDZCNWdleDFDQ3UvL01zblZwLzc5bDFsTFZScjlK?=
 =?utf-8?B?RmtyMWQxbUl6UUxpbHN0UUE1TjR2cnM0ZklOajJCVGxJNDFQQTQrY2owdWgw?=
 =?utf-8?B?RXkzbVpWUFlhbUNsR2pBWVdEZDJqbC92TkI0V2NXMTJOb05oUlpwSWlWcVdu?=
 =?utf-8?B?NVphby9DY3Q0QWo5ZForR3k3ZXdPeXI5VGhPTVg0N3FtSmgwNTVKd21Rdi9E?=
 =?utf-8?B?NGtRQSs4am9aQTJtMGFsekNMVjZPaS9aMUhyWnhySFFYaE9pbHA1RkQ4dWhM?=
 =?utf-8?B?K1BoQmpSTVRPNnBmdk04b1NPYkRNanRSb1VyNDFxUHlFTHViRzA5M0ppSWts?=
 =?utf-8?B?MXRTS3dUZ0NzYjJ2RHk5b2kwQlZTem1kYWZVRFVFa1AzeHRrdmlOeHRXWGNn?=
 =?utf-8?B?TWRia0xTaHFOUUxiY0taNXNJT1VGZWtNYStqQWJQaTQ4cEw1RWF5dFY3czR4?=
 =?utf-8?B?MkdTQWNpRkxkNFBPYzZIS2ZMZ0xTck1xcEZNZnM5b0tkeGFqREFhM1RZTFpJ?=
 =?utf-8?B?SFBFVWYyNFNRMmtmWng4aTFDbHlKOE9JM0U5SGt0MVdEdFlqWmlTY3NNMytR?=
 =?utf-8?B?SEFqa2ozN1lqcUlyY0I2amlSbXBKbGpvQkdNckVSS3REakdNSGVKQmJ1UEly?=
 =?utf-8?B?cHhnck1mYXViZldhZUo5eVlMWlA0WTJtanMrdytpbWdsYkE4SHdvWWxMZS9M?=
 =?utf-8?B?elI1bHZzVStiemVrcmRvRGxSQ0kzbmtaQmtBelk4bWhjTXM2WEtLMDFjTkcw?=
 =?utf-8?B?c001dHk0OE1ZbHFvS2swajJZL1lGYlVpVEs1ZDg2bzJZdUt6ZjZJdUY5QXkx?=
 =?utf-8?B?cU1Pdm5YRHVQV1FiTWdZNGFEZ2VpS2FvYzJ4S3NSVFUrb01pYXhOWmFOdzJO?=
 =?utf-8?B?UFRqcUZOY20vNVZ5a1g4MVVodVVmQ0hHMktoYlViQ0xYTmhVVytwRzZqcHQ4?=
 =?utf-8?B?Y3ArMXJSWXVSK2o1Tm1saVlOekpkYjVsMWdzYzJBcVlaTkVMM3RCT1Bvckt3?=
 =?utf-8?B?dWxKRUZKdWdPUUo4VW1OS2tGd0lXRFIvZjdCVEVnTHVPcUxMcmE2WkFOMTVy?=
 =?utf-8?B?N2lodGdXZzl0MTZxODl5VlZ1TmYrNW82NEpEd3JVbi9Kd2lEeFNJVnNRMUlV?=
 =?utf-8?B?YmI5b3JWbVk0Q1RjQ3RabndlcEFPOFNqR3BxRTNYUTRXYmJta2VDSGwzS21h?=
 =?utf-8?B?VTIwNXdvM3NhOGNuaGEyNmRPYUZaL1Z3c3FQdFBDWkhobXhHTFZaakMycXFw?=
 =?utf-8?B?cWh3NVp5cTRSWWFRVHNab2VidTNYZzdUWG5hWWJUQ1JCZ3V6WlQvcTh1cW5s?=
 =?utf-8?B?blAvQ0xvZHVMVzZBc1l1OFF3UWtaK2k2YTkySlg1RlMrYkM4Z2lZNUJvQm1M?=
 =?utf-8?B?enpITUQwYjBoMjN3b3VuSkJNYTREclk5b3lhUDZ4Mm9GM0VmQmJlaEk4ZXZz?=
 =?utf-8?B?aklhMnhGUUhlRzNqY2N5Z1NUWCtuSTBuaTRWTEFMS1VjSzNaQUE2QmtiVW5R?=
 =?utf-8?B?dGVVb0JDaHlaVWZ4c0h4ays0U1BxblJCeDZKZTAxQ3c4bjFDektMcWFSdVNW?=
 =?utf-8?B?djBhajNnbUNWY29sY2VOSU4wdHgyN2g5cm9uUEp0bzgyNHlYcVdycUErQm56?=
 =?utf-8?B?bDlVcEtaRXdNb0E5enFlTFFOWUZSUWxacXNLTjBsdURHYzNUckJJUVlqOGxP?=
 =?utf-8?B?QjdyQVRUbi9qQ08yVTJObFhKMzBaaG0rTzhEazBJZEl5QXYrR0FzQ0pacnRr?=
 =?utf-8?B?UmVpUTM2NkE3aHdxNWl6Z0hXTTkxQVpGeEdDR0FVQ2wxV0FGeXp6UFIwS3dK?=
 =?utf-8?B?R1RPYXBZemRXWlVMVVRpT3BvWUs0UlhsYUlBd1FaUVhDSW9HNnovNXdQb3NR?=
 =?utf-8?B?TUdzVTNyWHVNZGhBMlN6YWE3RU9PT3ZXRXVmMDJPdWpCam5ha2dKVFJ0TmVx?=
 =?utf-8?B?dkFmNFVOMldDc2syZ21TY1JmSC9hZjh0OWplalVSODZhaWJLODgvMm1LOVNO?=
 =?utf-8?B?Y1k0LzBYL0xMUWYzVU9TY1A4TjhSemxzZUxuaXRHNkxxR3U4WmdHSUVnQVA2?=
 =?utf-8?Q?XvJDf9Wnfy+AS+ik+r5MV7wHC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 638a3a2a-b65a-48b3-b089-08dd447e8ba0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 18:14:05.5138
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UAQ+7vLVCv8luZ9eAub+klxZRkUi8aRUetI18Wd1uri/RVEdw0lJ8zFct8EfajLddcF9lF3YOnDz3m3HNqp0LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8198
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 18:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115244

VGVzdCBidWlsZCB3aXRoIGFybStjbGFuZyB3YXMgc3VjY2Vzc2Z1bC4NCkkgaG9wZSB0aGF0IGhl
bHBzIGFuZCByZW1haW5pbmcgYXJjaHMgd2lsbCBiZSBjaGVja2VkIG9uIGF1dG9idWlsZGVyLg0K
DQpOb3RlIHRoYXQgYnVpbGQgd2l0aCBwdGVzdCBlbmFibGVkIGZhaWxzIHdpdGggY2xhbmcgaW4g
ZG9fY29tcGlsZV9wdGVzdCBkdXJpbmcgbGlua2luZyB3aXRoIGFic2wsIGJ1dCB0aGUgc2FtZSBo
YXBwZW5zIHdpdGhvdXQgdGhpcyBwYXRjaCwgdG9vLiANCg0KUGV0ZXINCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0K
PiBTZW50OiBNb25kYXksIEZlYnJ1YXJ5IDMsIDIwMjUgMTozNg0KPiBUbzogTWFya28sIFBldGVy
IChGVCBEIEVVIFNLIEJGUzEpIDxQZXRlci5NYXJrb0BzaWVtZW5zLmNvbT4NCj4gQ2M6IG9wZW5l
bWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbb2Vd
IFttZXRhLW9lXVtQQVRDSCAxLzhdIHByb3RvYnVmOiByZW1vdmUgdW5uZWVkZWQgYXRvbWljIGxp
bmtlcg0KPiBmbGFnDQo+IA0KPiBPbiBTdW4sIEZlYiAyLCAyMDI1IGF0IDE6NDDigK9QTSBQZXRl
ciBNYXJrbyB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8cGV0ZXIubWFya289c2llbWVu
cy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBQZXRl
ciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4NCj4gPiBUaGlzIGlzIGhhbmRs
ZWQgaW4gcHJvdG9mdWYgY21ha2Ugc2luY2UgMy4xNToNCj4gPg0KPiBodHRwczovL2dpdGh1Yi5j
b20vcHJvdG9jb2xidWZmZXJzL3Byb3RvYnVmL2NvbW1pdC81NWVkMWQ0MjdjY2MwZDIwMDkyNzc0
DQo+IDYzMjlhYzliODExZGVlNzdiOQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgTWFy
a28gPHBldGVyLm1hcmtvQHNpZW1lbnMuY29tPg0KPiA+IC0tLQ0KPiA+ICBtZXRhLW9lL3JlY2lw
ZXMtZGV2dG9vbHMvcHJvdG9idWYvcHJvdG9idWZfNC4yNS41LmJiIHwgNiAtLS0tLS0NCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDYgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0
YS1vZS9yZWNpcGVzLWRldnRvb2xzL3Byb3RvYnVmL3Byb3RvYnVmXzQuMjUuNS5iYiBiL21ldGEt
DQo+IG9lL3JlY2lwZXMtZGV2dG9vbHMvcHJvdG9idWYvcHJvdG9idWZfNC4yNS41LmJiDQo+ID4g
aW5kZXggODllMTA3MWI1OS4uZWZkNzBkNjQ3NCAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhLW9lL3Jl
Y2lwZXMtZGV2dG9vbHMvcHJvdG9idWYvcHJvdG9idWZfNC4yNS41LmJiDQo+ID4gKysrIGIvbWV0
YS1vZS9yZWNpcGVzLWRldnRvb2xzL3Byb3RvYnVmL3Byb3RvYnVmXzQuMjUuNS5iYg0KPiA+IEBA
IC0xMTUsOSArMTE1LDMgQEAgUkRFUEVORFM6JHtQTn0tcHRlc3QgPSAiYmFzaA0KPiAke0BiYi51
dGlscy5jb250YWlucygnUEFDS0FHRUNPTkZJRycsICdweXRob24nLCAncHkNCj4gPiAgTUlQU19J
TlNUUlVDVElPTl9TRVQgPSAibWlwcyINCj4gPg0KPiA+ICBCQkNMQVNTRVhURU5EID0gIm5hdGl2
ZSBuYXRpdmVzZGsiDQo+ID4gLQ0KPiA+IC1MREZMQUdTOmFwcGVuZDphcm0gPSAiIC1sYXRvbWlj
Ig0KPiA+IC1MREZMQUdTOmFwcGVuZDptaXBzID0gIiAtbGF0b21pYyINCj4gPiAtTERGTEFHUzph
cHBlbmQ6cG93ZXJwYyA9ICIgLWxhdG9taWMiDQo+ID4gLUxERkxBR1M6YXBwZW5kOm1pcHNlbCA9
ICIgLWxhdG9taWMiDQo+ID4gLUxERkxBR1M6YXBwZW5kOnJpc2N2MzIgPSAiIC1sYXRvbWljIg0K
PiANCj4gVGhleSB3ZXJlIG5lZWRlZCB3aXRoIGNsYW5nIElJUkMsIGRvZXMgaXQgd29yayB3aXRo
b3V0IGl0IG5vdyA/DQo+IA0KPiA+DQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPiBM
aW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gPiBW
aWV3L1JlcGx5IE9ubGluZSAoIzExNTIyMCk6DQo+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC9tZXNzYWdlLzExNTIyMA0KPiA+IE11dGUgVGhpcyBU
b3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExMDk1OTkxNy8xOTk3OTE0
DQo+ID4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1kZXZlbCtvd25lckBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQo+ID4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9nL29wZW5lbWJlZGRlZC1kZXZlbC91bnN1Yg0KPiBbcmFqLmtoZW1AZ21haWwuY29tXQ0KPiA+
IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4NCg==

