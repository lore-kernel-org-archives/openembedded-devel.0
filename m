Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B092CD11DD
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 18:35:26 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.117])
 by mx.groups.io with SMTP id smtpd.web10.4315.1711650923634283563
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Mar 2024 11:35:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=BClB7ExY;
 spf=pass (domain: siemens.com, ip: 40.107.6.117, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GfvAipuTuB6pbN+7EPl5sNmng3nbO8X3xVslQhPA+LptMbGJl5fZr32C4KO0dPCo09CUOGVAXGIm0WxoQea8W2g+fyeq7fAvT2WmNvRlvlbdceHb6w2oCH0mWBlXksQaCYK/9HIccjIxe2VsdLlYuFE8zkhWy5x6hA+zQMDCj5lDYYzCMcbORS8eGejcBzRTM2vjyNWTJTkhxJxSOh7nQ024w+ng1cSSQPnvvonCtkypscLOlr2PVxgqFQjSaW7ygIsggx6I+6+D5UmYr+p7cZX3Mu1xifDIRzNjt60eTt6rf+HsAOLnVa1Tpq3PHeBcyBH5FFItd+vEXTCaGsCAbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYJ5VGvEPmh2ulwfpFuUSrGYDTMsKFYDR32W7wH6zKc=;
 b=MyWCidVHtAHN2valZ4VOikF0gTaYwlOAsOt8mwtuuPGliax+rllYyNId8u75nCtXWWM8Yan4I5CfftXRBCJe3BQG5sQmFDyfhK5gztAHmqAr+4Dxx+RgMoTBAa7L4DFpuDWl/+b0izph76ck+I2KcOMioJhYxJk+hZTbqEcu4jKzbLa2Qrt95uz4ECgwmTuSNBbetcCueaTWCuYedHi698A4SiHa0mRGX4xDVcf54VYhhOuh/kktudyEzUzptZwO3Hzw2WnZo+RhIi79OL+GVPN6fbYcDqpHLaith+Suphkxsu56Mh2bZjckVtFSvb1tkAFdvl5tIml//RvlcfgBnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYJ5VGvEPmh2ulwfpFuUSrGYDTMsKFYDR32W7wH6zKc=;
 b=BClB7ExYycB45tOXomViU9dUOCMTMjg1c/QtheT+Uw4FmUpJXHo7SdqoYk56j69QOQ5sRwRF48KslIRfKKpWd/0chKe/jbvoXBKoyLAlxiLZ1eMOz0DMck17R8OoAMi01sdZxwodHMLSnJVbaE90QRUSp87VVdzyfQobZ6f31i+tUbYk21m/J7Ldusgj8OgiN7NHuhSnsdpileOwnEOV0PmG6pRxduMnJiX7sshA99+qAp1hTQyRMVKYzwHxD+npgl/51fduVAm250UyKTMzndBVVnohXqcjVR6s+YkF8uDp32Dx1h61GcECvTWBvMO9WMcmrlqImMWZEvfLmUxVCA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAWPR10MB7771.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:363::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Thu, 28 Mar
 2024 18:35:21 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fd78:3502:7564:1891]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fd78:3502:7564:1891%4]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 18:35:21 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH v3] microsoft-gsl: add new recipe including
 ptest
Thread-Topic: [oe] [meta-oe][PATCH v3] microsoft-gsl: add new recipe including
 ptest
Thread-Index: AQHagJuTxL13/BUgbUmnPOl4uodXHLFMkKIAgABXHeCAAJMaQA==
Date: Thu, 28 Mar 2024 18:35:20 +0000
Message-ID: 
 <AS1PR10MB5697007C6F526B1C3182134FFD3B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <CAMKF1so8Zc4w9WuD94+H360HJtnYmG_Qt50cPh8BdB+LxdKN3Q@mail.gmail.com>
 <20240327230647.694952-1-peter.marko@siemens.com>
 <CAMKF1sq8PuRhJHV9=k_C5jtn7DZXYFD-ExX3M_2dP0DGCytT2w@mail.gmail.com>
 <AS1PR10MB56973F70AEF71312F08CA572FD3B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB56973F70AEF71312F08CA572FD3B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=9737f64f-b8f7-4692-8618-2032f9a24b79;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-03-28T09:44:08Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAWPR10MB7771:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YcnlX7YMZEYpXJRwjoQpvGfY1EeOvMj03r+JPBJyG+d8a/DUQd0dMv0mDU5PWUdPdS2cWrdNRHziD0nmZlDNTkvNwZIpY7v5mtiB4H+k+0ovk+KXJNQXzZ1Orb/mlSFPr95SiwfjH37FvsEHbM3j3bBU41GORQdnDnoW/YGeBnFLLbADXkOS+KTCRAAPrYiLkOp4X3SujhsJFcXx3T/Y5dXo1b9YHWkY1gFQ7DLE47zh2W5/VjZrGifN/BTOPXhBE/pg9mAjU0pt+GRE38CblscUTclWwooGSi0IIeSv3ijrCwby6bnb64Cj9w2dFHuVwxIhns4i6DOdPzdSfyWUA0JgWaMP0+YXK0gIHpzPoDUkDJDP1SCZyHXGZP/JbboDRhkkSfVr2EefrHa7m6im4MEHJXQknVhET5mpeLiDzfcoLDGJIi1gs7X4Bo/7Qcp7We3UFVcznA9i1nu5tqibFUae7+2JoQ0s28sxlCq93XGPPyQlnMHSW3YyFVWLyvf8GppNOWwGNQVu6c2OBuOMOu1wPE/+yfKP1BWLar7w+7o520jy07ledJoKqU3IFkrMy+OMizVuzih6nclhjcUPlQ2IUxcytCRTmzXseqKIsk4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RjJGRUdoeFBjK3d1TCtWSzRYQnJUZmsrMlJxRWxOdkRmTVJMU1haVldNWnhQ?=
 =?utf-8?B?Y3pWRnc2Snk2S3VLZnpnR0VCNUFUaXFhdlJBS0I2cTRQaTAyaE95MlhLUUdL?=
 =?utf-8?B?dFVVd0lvTDY2bkQxRGFDbXl1bVpURjhiME1wVmRtNURQb2ZiWGlPVWVkemtO?=
 =?utf-8?B?c1dEMDVLbCszL3V3UkpHMTFFZDNjZUVodTJseGtVSXRlRldJWWJJSFF3M0pI?=
 =?utf-8?B?U0RRdXRTQ1hOOHVodnBOSEtwcU5zcVg1ZmZ0bk02alNhRmlabzFNQVFIc29a?=
 =?utf-8?B?a3c3dlpFZmZRaGpsTXlBM3M5VmpLVEZCcHIyWTlJcC9vZ0xoanBVNmpNN2xH?=
 =?utf-8?B?VDlkcWhpKzdNVzAwR1NJKzJTWGU5SUEzT01TY0lJRzVTclFNT0NEK1ViNTZC?=
 =?utf-8?B?blA1V0N2NnJjaHVCVXBXTnN5b3I4T28zL0pvOTc1eWpQZUEyYzEvSEo1WEFP?=
 =?utf-8?B?eWh4REIrL0FZaWhKa2dwZW9FK213ejNsbnQzVkRRWDNHQ0QxYUpVdkNhRURR?=
 =?utf-8?B?WXlRbkc2NGZjaGNrZXphU0RoZldCbDRqbEJWdUlVN0pSNi9uNHByRzk5b085?=
 =?utf-8?B?dWxoSXIrQkhvQmZnL1RmQWlvclpGV29SWWtPem1abmVjQWJGbnhsQktMZE5o?=
 =?utf-8?B?SjBjZk5TL1FWeW9LOFplM040ZmZKNnkvZVh4Y1F4eHpON2JmQ1FSemovY3RR?=
 =?utf-8?B?UytGUzluZVpaUUdubGJza0liaTZoVG9ZcnJvRUNSd1RuakpOdUhxOU9wSW9u?=
 =?utf-8?B?Qm1ZQXZoL09KSENpbSs5OFo4cEs3dSszOC96R0hhcnpKd2xmdmhHaUNSSzdH?=
 =?utf-8?B?cXpBTzFjZGZmOUJoOUVmNVB2QnZGc1g3eU1nbG1OK0UxOUM3N3ZaUmZIZnFQ?=
 =?utf-8?B?OGVwb05uUUJ1eWpYcGYrNW1Zbm5Hd0cvRkp5N25VRit2Yi9jeTFkWS9CeEti?=
 =?utf-8?B?MmxQUzkzYWNtK0Exek1qVnFZSUFVaVljaGRSQi85WHlQL1BaMUZWVGhtV0FW?=
 =?utf-8?B?Y0FtT0ZnakczK01TcUhqVHBmRXNMRC9RWkYxNm9uYTlLZFpkYmUrNkN2ZHRX?=
 =?utf-8?B?UlJBYWwxa1MyNDRBZkJBRXlZNXV2R1VKOUZWWkN5OTdFdlFuWGpPZk9YKy9T?=
 =?utf-8?B?NDM0aG5rMkcwZS85THdVRW84RWhZOUY0ZHZSL1UvUEdMaUgxZkx0NnE3MUFU?=
 =?utf-8?B?anVXTmJiQi96SW1SZFphN0hJVWxFU2EzaXFTdXljR3VsNzB2WlF3UjZabTdp?=
 =?utf-8?B?MGtFbDR3aDRaaHRoa1RkWlZBNlYrWmlLL1AvMUhDM1cyRHZlTm5NQUVTamdY?=
 =?utf-8?B?alNFczR0dHh4ci9OdjdBUGlhaGx5Q1AwQmNkT2t0MkllM1JrRDRWNXN5V2xj?=
 =?utf-8?B?V05GUVNvU2NKMWFXU1RIamltMXNuUDNxODFjTmplR1YwelQranF4MVV1akdB?=
 =?utf-8?B?enhpTTI2cmlNK2xLNGQ2UTdySGhlNlI5V0tadHFVbUVhZWpGalgvai9DLyti?=
 =?utf-8?B?ZGp6eUREMkJrYmp4clUxM3JXV3FkSkZRRFh2Y1J5RkRjaTNDb2RmN2RBd04x?=
 =?utf-8?B?eVhZTHVLbCs1OEtoR1FlRGYybythemRYdWh0dCtXenhkUlZodTF0VnZQMUVi?=
 =?utf-8?B?UkRxSGFWdnVkOXBMOGhmNmRPdWJ1WVJSZXFpQW4rYzRXaTVCZWVyNXMydFgw?=
 =?utf-8?B?bkRXUHRmdkR2N2JWYUZEUCsvWHFLTUQ2RWFnUUVFTldWcllrenl0MmJOSWtS?=
 =?utf-8?B?VDlXajk5NlFuSDhEc2xUVXRVRzZpdzBXNnVUZWlLMXMwOThvb01QNlYxRDFp?=
 =?utf-8?B?UzBuRnBhMmhzbSszUG9qUUZQTFUvNzlxMStnU3pXZ1ZvWjRwUElwL3JMVmM3?=
 =?utf-8?B?aUJZZWFINWkzL0grcHl0MzNsQzlkN01vVzhocWpMRTk5SEFqYlR5TXhKVWpo?=
 =?utf-8?B?emRSMFJGTUp1cDJ1aXV3RnZJRjFMU0wyY0g3UDJqSFhZVlNyaFdTYzduaFdi?=
 =?utf-8?B?M0ZpQmhPWFUyektVb0tVc0h2VXBaKzNwQU9Na2JpKy8raE9yWmp6T2kyL1Ny?=
 =?utf-8?B?Wkx5QXhEUFJ3cHlXbmlpdFI0QzBlQklFbTZiZC82Z2NZQkw2azVRUElVakti?=
 =?utf-8?Q?V0SzWKr2C1vLJE/Pt/EtPjF0j?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 07175a6c-9a19-4b42-4b0c-08dc4f55d2fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2024 18:35:20.9823
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u19TcLKCY/0xsC1Sgy0qjhKy8iAaliHhM8hNaFD3l3fqBqO+nSKfhy3J2rFDEfNkQ8kDIDHX+ozamIAdIaEK4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7771
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 18:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109676

RHVlIHRvIGVhc3RlciBob2xpZGF5cyBJIHdvbid0IGhhdmUgdGltZSB0byBhbmFseXplIHRoaXMg
dW50aWwgbWlkIG9mIG5leHQgd2Vlay4NCklmIHlvdSB3YW50IHRvIG1lcmdlIHlvdXIgcGF0Y2gg
bWVhbndoaWxlLCBwbGVhc2UgYWRkIGEgbmV3IGNvbW1lbnQvbGluZSBmb3IgaXQuDQpNeSBjb21t
ZW50IHdpdGggZ29vZ2xldGVzdCBQUiByZWZlcmVuY2UgaXMgb25seSB2YWxpZCBmb3Igc3dpdGNo
LWRlZmF1bHQgZmxhZy4NCg0KUGV0ZXINCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZy
b206IE1hcmtvLCBQZXRlciAoQURWIEQgRVUgU0sgQkZTMSkgDQpTZW50OiBUaHVyc2RheSwgTWFy
Y2ggMjgsIDIwMjQgMTA6NDkNClRvOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KQ2M6
IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSRTog
W29lXSBbbWV0YS1vZV1bUEFUQ0ggdjNdIG1pY3Jvc29mdC1nc2w6IGFkZCBuZXcgcmVjaXBlIGlu
Y2x1ZGluZyBwdGVzdA0KDQo+IEkgZGlkIG5vdCBzZWUgdGhpcyB3aGVuIGJ1aWxkaW5nIGxvY2Fs
bHkgd2l0aCBwb2t5IGRlZmF1bHRzICh1c2luZyA1LjBfTTMpLCBidXQgZnJvbSBzY3JlZW5zaG90
IEkgc2VlIGl0J3MgZmFpbGluZyB3aXRoIG11c2wuDQo+IEknbGwgdHJ5IHRvIGNvbWUgdXAgd2l0
aCBhIHBhdGNoLCBidXQgSSBoYXZlIG5ldmVyIHdvcmtlZCB3aXRoIG11c2wgc28gZmFyLi4uDQo+
DQo+IFBldGVyLg0KPg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLaGVt
IFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiANCj4gU2VudDogVGh1cnNkYXksIE1hcmNoIDI4LCAy
MDI0IDU6MzINCj4gVG86IE1hcmtvLCBQZXRlciAoQURWIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1h
cmtvQHNpZW1lbnMuY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtvZV0gW21ldGEtb2VdW1BBVENIIHYzXSBtaWNyb3Nv
ZnQtZ3NsOiBhZGQgbmV3IHJlY2lwZSBpbmNsdWRpbmcgcHRlc3QNCj4NCj4gPiBUaGFua3MgZm9y
IHJld29ya2luZyB0aGUgcGF0Y2gsIHRoZXJlIGhvd2V2ZXIgaXMgc3RpbGwgb25lIGVycm9yIHBv
cHBpbmcgdXAgd2hlbiBwdGVzdHMgZGlzdHJvIGZlYXR1cmUgaXMgZW5hYmxlZA0KPiA+DQo+ID4g
aHR0cHM6Ly9zbmlwcy5zaC9mL2JmdHZ6NEFOTzYNCj4gPg0KPiA+IFRoaXMgcGF0Y2ggZml4ZXMg
aXQsIGJ1dCBJIHdvdWxkIGxpa2UgdG8gc2VlIGlmIHRoaXMgd2FybmluZyBpcyBhbHJlYWR5IGZp
eGVkIG9yIGNhbiBiZSBmaXhlZC4NCj4gPg0KPiA+IGh0dHBzOi8vc25pcHMuc2gvZi9wUlZhcjho
bGlmDQo+ID4NCj4gPiBPbiBXZWQsIE1hciAyNywgMjAyNCBhdCA0OjA34oCvUE0gUGV0ZXIgTWFy
a28gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPHBldGVyLm1hcmtvPXNpZW1lbnMuY29tQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KLi4uDQo=

