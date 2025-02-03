Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D74C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 17:37:42 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.54])
 by mx.groups.io with SMTP id smtpd.web11.93993.1738604260598816865
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Feb 2025 09:37:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=o0qkyCIh;
 spf=pass (domain: siemens.com, ip: 40.107.21.54, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYPgaCunQVeZ0/vhSkW+1j8/3ITjCCF3QXxtgT6d5UKbNSkSr0aHIl2tXn/+nC/+qUYBmnizBFVXdQarvY2a9m1UtfeFiPpyPMpDDt+QfFPneP9FNaVmg65EqjkUH2F2w6t18jskj84EVjFinUDnkdDrp8Lnufi4xSHwueLvsI/lw8+ZENVLuhnbIHZ0YtvxswKZq/lhKgNFAgA0VtT07vwUfz/IgYrQZNMpW5DbvFAD0jl6bErTlIyRQuujt46xoW38nmQU1oBClwQbXijTa5/sAGWJGNVQgVX5PncL8jD+8+wFs7Fm7TWxbriJ7kk8liXLEBjfILSQeTGu7UYieQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlaoORHn9fE6FIPZmLA4f4M8C7dqnVip+gqvhnWFPR0=;
 b=V6EXTQXJND04JxdK/why68LDsHCNLU3drncDJfaiq4ZORJbJFML95+SFUpI06L8Je0HedWqD3JWmTtG4JRLx6XEtyu6zFjgnNB1swLnw44Q8z899m6WtTLQKs/OTaxaUklAzIJvM2JZ+kzvco1xxxfRfR6mG6xLXkAGwMmiGWK3AJD+SWbeMGzQhn5eDdrqfHPLoskKNWMItaYVPAgqJvLN9W76xfJFKuGcT//JyPprDXqefriqHVZ/eSXdUznYlMsn131N1+7RPjLhzGL/TBDyIlMDIprriUubeP4Tn7gOMYNssE/TbIjpVCLcN3J7/U308SwTy/cMoLAWGqPKTRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlaoORHn9fE6FIPZmLA4f4M8C7dqnVip+gqvhnWFPR0=;
 b=o0qkyCIhW37hV3r5VI1u4h92z7wJ0XvOyswAeknpgcYa6kTqeh2jRb41/7Dcgs5tWwMYnC0kji9VzWbvf17SG15qSmQigQ+dZ3ZbCn90bl2XTrgbGcr++NgSormkqEoMtma09B7wWhkC7Xdt/XMXoFrSrn7iukLpHgWZphwQ9wAJ3lcA/v6j5H85TTkgUylU44abvbZdnRtUOf9cdCUZWMm6H0jjMpWYV3+J8Mbe5MENZyj7ZeV39pfI05OB0rhxX4MgaCOoxg3s3uzejuF66eq9OlyzFjNLR09HiiRK50i3Kzs1IqbbsoMxO4zBhJi8FMMaWWybP5F7+N6o4VUzMQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GVXPR10MB8059.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:111::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.8; Mon, 3 Feb
 2025 17:37:36 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8422.005; Mon, 3 Feb 2025
 17:37:36 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH 3/8] protobuf: use system jsoncpp
Thread-Topic: [oe] [meta-oe][PATCH 3/8] protobuf: use system jsoncpp
Thread-Index: AQHbdbsJBM3SjMaiE0qvDxp4b0ArRLM1JpSAgACp26A=
Date: Mon, 3 Feb 2025 17:37:36 +0000
Message-ID: 
 <AS1PR10MB5697A9255B73647165F3B004FDF52@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250202213910.284312-1-peter.marko@siemens.com>
 <20250202213910.284312-3-peter.marko@siemens.com>
 <CAMKF1squvrD1YQsFv3jJRJgbfEArPSm-5KcG-SKMBruLHdLs0g@mail.gmail.com>
In-Reply-To: 
 <CAMKF1squvrD1YQsFv3jJRJgbfEArPSm-5KcG-SKMBruLHdLs0g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=1d66dc2d-4305-40c1-b832-23a9e4434467;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-02-03T17:06:21Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GVXPR10MB8059:EE_
x-ms-office365-filtering-correlation-id: 4272d247-1c0c-42a2-ff79-08dd447972cd
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?b1grWGNVOU1hVjZnWlA5ZmhpMXgxMTBFWFNTT1hidHFZVUhUWXJhWUZ6Yksy?=
 =?utf-8?B?Y0ROSkUxYi85TnZuMjhsTExudVNVeDdsbFNONG9ReXV3aGtPa2sxYnNaVHJY?=
 =?utf-8?B?MElsSHBBeUpNb0pFYWdoUThjSmNwaGRMV0luOThkK3czQUN6NExKM0xSbS9j?=
 =?utf-8?B?OVNraHdDQS94TXozaUFoYW9kVXpIaTJicllVTzlrcFQvSC9MZFhLTlAramJJ?=
 =?utf-8?B?azhYQTlYSzZIVjNqeVBhd2c0ZFJPUHVGWStJblZRblZJTE9obDE5Y05yaWI5?=
 =?utf-8?B?VnA0dDFXZDVwL1ZlNkFoOWIweWo4M3pucE9xS1RYWDFuYlA4NUtPbWlPNGlU?=
 =?utf-8?B?SmkrdU41VDFzeDZXcVBiZ3VTOVRYQnp3a3lQUlZ3cytNODdidmVFeW1PMW9H?=
 =?utf-8?B?MnlBVnQ0VHlkOG5SViswT3d5ejBnRmtET2J0a0kxRnVxVVR1WU04elZaTWYx?=
 =?utf-8?B?eEVNRnZGYkJOU3I4Tk51Mzc3ZmIvUDFkbk8zWGl2MXFvRXNhYmFYaGpnemYw?=
 =?utf-8?B?YmFHWStjbkZ6ZFB4anp4L0F4Qzl2RGsxQTk5ZXpnU01IN2dvWHY2alNndU9H?=
 =?utf-8?B?MnFIellzSldBUFBndFJ3eEpqYUgvVkNLTDEwaVB4aUtIalJBcFpHU1dZckpo?=
 =?utf-8?B?TFRZcGVZRzhHYjdvbkVybnVPODdTdnZoNDFqaFFKTE0zb091ZjR2R294bm5B?=
 =?utf-8?B?Qy91anpMMkJwaUJRQjBTWVp0dzNHKzcwalZUODZGVXpSNDhhOU9jZ0sxQ0Zh?=
 =?utf-8?B?cFZ6elIrMnpRcmRtRXhHckdGdCtyNjU2Q1d6WHRtdjVtZTZUbVlNWE42N3U5?=
 =?utf-8?B?TWdNRFdkSzFZUGhwa0ZIQjFrdkNIK0pwMnVMMFVvdFJhakxFdnlNQWdZOWRi?=
 =?utf-8?B?dFV1dTZhcXIwdzMvb2wyVWRsdXduTzNDOXU0dXdNUU1EaWlHeDR5WHRWOGZw?=
 =?utf-8?B?RDI5Z2QwUGhCd3lEdWxJcGU3ODliV29rdUpMMUJBcTlVeEh0ZVZFOWlWQzZS?=
 =?utf-8?B?QnB4UDkxYUdBcG84YkVUTlF1Q1kvL0ZuYUZ3K090Z05FMzRJbGNlN2dkQm8z?=
 =?utf-8?B?UVZjK1ROZEpKNWZYMTNnNnA4L1Q5eEM1MkFNa2Qrd0ZLdjgvZXBYaHRyYXRF?=
 =?utf-8?B?Q0tjc2hFbnlQMlRBQXJtZFdmaVdoM1BvTUJNQlI5bDBaQ1hzb1VBZjdENkg1?=
 =?utf-8?B?WWI0bGFuV1phS3ZYWjBvWGhZUkVaTVdYaituQnJpNEp3aUFlSXE5M1kvZmVj?=
 =?utf-8?B?Q2NHMmRRU2U0NDcrZHBWV2IzaFU4ZkQvMm91MDd4WnFwZTJocThJMUd2RUQy?=
 =?utf-8?B?Sks0N21wdlBkWnpHODNrRWNPQU9EVTJTeTRNVXdRU0lWYXZORjZVZWJpUlRy?=
 =?utf-8?B?enNzRnB1UnN1dGhSRWlYNlRQU2QxK2Y5eCtsS3ArUlNQKzlvNjV5R243ZXFH?=
 =?utf-8?B?eFUvNFRNdlQzc1dXcWZrNzZYY0lxZ1pKTVNyNE0rUXIxODVSMjU1T0tGRG5y?=
 =?utf-8?B?UlRwc0hNWExaME80VGR2Wi85elowVVgrUTJaSmRlSE5iR3hDM2RtTlRXNENC?=
 =?utf-8?B?NTJzRFVUV3JKRGVmYVovWjgxdlJPWXVsUG5BWDFIelU2SkU5aDhUR0dhd2xw?=
 =?utf-8?B?WlFHZXRvczFubDhZYllWdmZJaDNLV29MVUllM1BrMHEzdHpXS3JZZ1R2ajhl?=
 =?utf-8?B?VkhORk44eUYxdTFudkFLY2lhTUk0bjFzKzdqRDFUeDNRdUxNTWpGRUdNSy9H?=
 =?utf-8?B?MDQveU9CWGJISzE5NUtPa1E3dmt0S3NuTnRMQ3RwRDI3elR6UFQrVWxibkN4?=
 =?utf-8?B?MUFLR3dhSTFKeHhwUUJMMXpLcG9uRzNtTzg4UXRqeVYwcHNLS0tuUS9sS0ZJ?=
 =?utf-8?Q?BvMwSiS3fuScd?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SVZpZ01CVXlRblNJMENmL3VWeExTYzc0SDhoV1pNNW9MbndEbS9ZNkt3NnZG?=
 =?utf-8?B?RXNVTk5PZ2x1ZkdMN1kwRlFTOXNXcHFMUGFlMGFlTE1PTXVocisyQXBQOWFD?=
 =?utf-8?B?VHl6Vkt5VGNUbHlhMlhWR21JeWltd0VXZlp1OFVxM0ZtQk5DcEtKaGxZalhB?=
 =?utf-8?B?bDlvcDd4OFBvQlJhR3RRbFErYlN6aXZ0M3dwL3gwWE5EdHZZKzNQc1RUZUZC?=
 =?utf-8?B?ckdHQ043MGl0aFZoandOR3RlYkhpenhOZzAwQUcxc09zcTkxTFZLK1RLT1Nl?=
 =?utf-8?B?VXUycGQrZnNkcFl2WGNTcUlxTGVmeEpLRWdyZ2V2bVZ2b1RZc2E4WjczVUFL?=
 =?utf-8?B?enAyOGZkOVJaUWR5UUMwUzl0Ulc3SW9rbW95K2ZaLzRDOXc1dDhVSWQweEJy?=
 =?utf-8?B?eXJPUmp6RkdieXo3aDN0alU1YTVYcGlGcFcwWk8rUndhNms4c3Z0RGtWUVNV?=
 =?utf-8?B?aDJtalQ4VmU0Q0dURzhja2Y4V3lINWR4K3dGckQycEtkYkNINGFmVmZlRGxM?=
 =?utf-8?B?RDNobVlYYTVjYnc5QzNqcjA5TENFelZpTHZMQjR6MzBPaDRNd3NqM3o5UjBn?=
 =?utf-8?B?UHRYTnF4bmZkbFkwbGlVKzBUamNlTjNxWUEzNi9QaWpuZnhnYmsxSHU4c1NP?=
 =?utf-8?B?WTZZUDFlZ3M0eHVEL3d0TS9IbE5FVUVUYnlsaHNwWVdEZGJxbDRmU1NDS2Z4?=
 =?utf-8?B?c1pia3NNdEs0VTkrTWhNOVhlY1VzcHlnUzBhS3d5blVFOFdFcmM4emduZXQy?=
 =?utf-8?B?VmRwTlVsOG5oRlo5aVEyK2pEL3JqQlBraUM3b1BFeWF4L0pIU1BYTFc4eEdE?=
 =?utf-8?B?TmVJaXp1R1ZiWU1NZm9WNWJieGZFSU83TGRvUXh3eXBXNE9Ob3RVNmVkQ1gz?=
 =?utf-8?B?Z3RZZmlCWFJocml2WG92dlVTdXZzL1IzMEl0czN2NkI1SjFmaHhTNlhwSnpY?=
 =?utf-8?B?MHpmM1hXKzM5QmhScmJQU3d3VXdLYVg1eDY3S0gzbnB1WVdhR2RvbzMzMVNR?=
 =?utf-8?B?VnVuWmZrSXlHRGczWVFZc3BRUm1wMk0rWXhxOEhzU0pMR2RUbG1Pb2FFZW0y?=
 =?utf-8?B?WmxXK3dMNUFIOUtzSE5xSzFyclAwTk9EZU5hRHVKYUZGY2Qxc0cyT2RzbjIw?=
 =?utf-8?B?MmMrSHVXNGlBUVNxbFdMTG45Ylg3SkhleW9NaUZCVXE4WmUyZzJvRU9mTHNa?=
 =?utf-8?B?aFZSZitqUFBVQVEzTngydzlyYWNPUjlFUHQ0aGJoZGpla01nKzB3Q0FjOXph?=
 =?utf-8?B?eFUzS0FZVTY1eVFVTXV1UUd5TzhPQjUyRnI2d1cyV3l6WlRMcWNhdVd2dDJn?=
 =?utf-8?B?VnNQSnd1eEJrNHlVdnhycTBiVStqMWQ3QklIcDlaUVdPU3B2c3JUajZwZi85?=
 =?utf-8?B?TnJWR3BodWVZeGh1VGx3R1lVbjVXZi9vVm5nKzljSkdWNDJGaWhIWFpMZity?=
 =?utf-8?B?NjN1Z2RzLzBadGV4RXBBdmVLcTlEUlpHYXYrWENZNnNuanBLRHhydUNlNUFr?=
 =?utf-8?B?dWIyaXZ4ZmtqK2ZSM1hwSHZWak9PMWlnVFY4cW5waGF2Q0pHMmtST1B3Yllq?=
 =?utf-8?B?RmxtcXNDVUV6RUZLV1NUZjRodUNVNG44M0ZGUHdFTWpGWlVUOENnVlhjNVFn?=
 =?utf-8?B?TGFnNHR3ZW9CRDhRZk8xbDZJclM4R2ZZZ2d3elFzZWR2RVFNMzdWbDFmcjRw?=
 =?utf-8?B?R0ViUXJDLy9STWVpeFc5emY1RC9vb2grMkYvanc4U0dYTXhTcFg1b3J3T0NH?=
 =?utf-8?B?Q2RqUG1DOVJSdU90REswaTVIK01ZVDNJTXpxc2xWR01QT3lEaUIzb2RkRVVD?=
 =?utf-8?B?M3RiYmxkSlJDd3VSU0FTbnJWazhWRlBlZG5QVWpqRFZCVzJaWEEvM0dMM2dH?=
 =?utf-8?B?RXlDRDBUd0oydUc4Nnd3OGRrMWZCWi8zbnVWVGhKdVBtTWxmc2tPbGFSYjV2?=
 =?utf-8?B?SDJFMkdaeUlSZ1V0Z0lEZmozMjB2TXJHMVk0SndKZTVhVDZOTXYySkFzVGpa?=
 =?utf-8?B?UUNrZnRPN2VGdGVTV0ZNMnBWeWpaZVBUeWdYc21nWWJ2UHVFdDMrbkloOUdD?=
 =?utf-8?B?dThxTWh1dkZodmY2UTU0d0liT1VwM0tZZDZXdm02NjVKUjlmanY4dTBBTkYr?=
 =?utf-8?Q?S6msRVtOO5c0xch7JPrlCeT8u?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4272d247-1c0c-42a2-ff79-08dd447972cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 17:37:36.3892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c+TEILm0R5kMlqF/vRfPckmuE8c4hkonBXIUIllv3dfz2Y6br7e+B5DhW1NM/VjxvwGO9JV4mAPNPBLlcVdOOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8059
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 17:37:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115242

SSB3aWxsIGFkZCBuYXRpdmVzZGsgc3VwcG9ydCAgdG8ganNvbmNwcCByZWNpcGUgaW4gdjINClBl
dGVyDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogPHJh
ai5raGVtQGdtYWlsLmNvbT4NCj4gU2VudDogTW9uZGF5LCBGZWJydWFyeSAzLCAyMDI1IDc6NTgN
Cj4gVG86IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMxKSA8UGV0ZXIuTWFya29Ac2llbWVu
cy5jb20+DQo+IENjOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiBTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1vZV1bUEFUQ0ggMy84XSBwcm90b2J1ZjogdXNlIHN5
c3RlbSBqc29uY3BwDQo+IA0KPiBFUlJPUjogTm90aGluZyBQUk9WSURFUyAnbmF0aXZlc2RrLWpz
b25jcHAnIChidXQNCj4gdmlydHVhbDpuYXRpdmVzZGs6L21udC9iL3lvZS9tYXN0ZXIvc291cmNl
cy9tZXRhLW9wZW5lbWJlZGRlZC9tZXRhLQ0KPiBvZS9yZWNpcGVzLWRldnRvb2xzL3Byb3RvYnVm
L3Byb3RvYnVmXzQuMjUuNS5iYg0KPiBERVBFTkRTIG9uIG9yIG90aGVyd2lzZSByZXF1aXJlcyBp
dCkuIENsb3NlIG1hdGNoZXM6DQo+ICAgbmF0aXZlc2RrLWNqc29uDQo+ICAgbmF0aXZlc2RrLWpz
b24tYw0KPiAgIG5hdGl2ZXNkay1uY3ANCj4gDQo+IE9uIFN1biwgRmViIDIsIDIwMjUgYXQgMTo0
MOKAr1BNIFBldGVyIE1hcmtvIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxwZXRlci5t
YXJrbz1zaWVtZW5zLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPg0KPiA+
IEZyb206IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPg0KPiA+IFdl
IHNob3VsZCBub3QgdXNlIGFkZGl0aW9uYWwgdmVuZG9yZWQganNvbmNwcCB1bmxlc3MgcmVxdWly
ZWQgZHVlIHRvDQo+ID4gY29tcGF0aWJpbGl0eSBpc3N1ZXMuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4gLS0tDQo+ID4g
IG1ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9wcm90b2J1Zi9wcm90b2J1Zl80LjI1LjUuYmIgfCAz
ICsrLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL3Byb3RvYnVm
L3Byb3RvYnVmXzQuMjUuNS5iYiBiL21ldGEtDQo+IG9lL3JlY2lwZXMtZGV2dG9vbHMvcHJvdG9i
dWYvcHJvdG9idWZfNC4yNS41LmJiDQo+ID4gaW5kZXggYzdlOTQwODg3MC4uNDcwYzM2OGNmMyAx
MDA2NDQNCj4gPiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvcHJvdG9idWYvcHJvdG9i
dWZfNC4yNS41LmJiDQo+ID4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL3Byb3RvYnVm
L3Byb3RvYnVmXzQuMjUuNS5iYg0KPiA+IEBAIC03LDcgKzcsNyBAQCBTRUNUSU9OID0gImNvbnNv
bGUvdG9vbHMiDQo+ID4gIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlIg0KPiA+ICBMSUNfRklMRVNf
Q0hLU1VNID0NCj4gImZpbGU6Ly9MSUNFTlNFO21kNT0zN2I1NzYyZTA3ZjBhZjhjNzRjZTgwYThi
ZGE0MjY2YiINCj4gPg0KPiA+IC1ERVBFTkRTID0gInpsaWIgYWJzZWlsLWNwcCINCj4gPiArREVQ
RU5EUyA9ICJ6bGliIGFic2VpbC1jcHAganNvbmNwcCINCj4gPiAgREVQRU5EUzphcHBlbmQ6Y2xh
c3MtdGFyZ2V0ID0gIiBwcm90b2J1Zi1uYXRpdmUiDQo+ID4NCj4gPiAgU1JDUkVWID0gIjlkMGVj
MGY5MmI1YjVmZGVlZGExMWY5ZGNlY2MxODcyZmYzNzgwMTQiDQo+ID4gQEAgLTM3LDYgKzM3LDcg
QEAgRVhUUkFfT0VDTUFLRSArPSAiXA0KPiA+ICAgICAgLURwcm90b2J1Zl9CVUlMRF9URVNUUz1P
RkYgXA0KPiA+ICAgICAgLURwcm90b2J1Zl9CVUlMRF9FWEFNUExFUz1PRkYgXA0KPiA+ICAgICAg
LURwcm90b2J1Zl9BQlNMX1BST1ZJREVSPSJwYWNrYWdlIiBcDQo+ID4gKyAgICAtRHByb3RvYnVm
X0pTT05DUFBfUFJPVklERVI9InBhY2thZ2UiIFwNCj4gPiAgIg0KPiA+DQo+ID4gIFRFU1RfU1JD
X0RJUiA9ICJleGFtcGxlcyINCj4gPg0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4g
TGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+ID4g
Vmlldy9SZXBseSBPbmxpbmUgKCMxMTUyMjIpOg0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvbWVzc2FnZS8xMTUyMjINCj4gPiBNdXRlIFRoaXMg
VG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMTA5NTk5MTkvMTk5Nzkx
NA0KPiA+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvdW5zdWINCj4gW3Jhai5raGVtQGdtYWlsLmNvbV0NCj4g
PiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+DQo=

