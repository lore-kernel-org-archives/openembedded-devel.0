Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6C2CD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 17:02:30 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.116])
 by mx.groups.io with SMTP id smtpd.web10.5503.1712768548988490660
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 10:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=O6Wn8gJW;
 spf=pass (domain: siemens.com, ip: 40.107.104.116, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPRmz7RsxO9Gz2bylU4Uchp1HDQVzv3lxlsInEckyKLuUZC/CsocbvcKVU5O54zNhvtbPMew58mviupzn20Xk7JUI5FpgZjU1+CU8Sv7gzuFCIR+mzs3uLaco24+7X8KP5Zmr0US9dmBMU9xCQvu7LSbrbo2bhDxyOUu7gc/dCI88VYWisqgbNLFEHhaPWBmv16jjqVwRHltilAzO9NMg0M5aGjpRO7D23iQq7WLQ6yxj9yNg09/qetZHmjr02yHUKJxNCpuMRaDB05rrql9p9HeyOv1N7MP9JMxRAKYIozuOJQxnRILpeYNFW9x8eR7l4SyX919lXoYdK3BxFh1SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qsmy2zB/ki6T5YHMfhmNyVWjEIBJ+Co1Epnc3drKGkE=;
 b=fnnMccMxIIv0CinKjpCeM2qNKBv50Ls4TWbioKcBZeKPGmEtYtAqMeYypKXiZL/kq4SkVEPzfJyEkDO4AMyo1HIPw0Pc/tg0DkwIgBgHAO8qMchuY1vq7wmqIbAz7Stw58YNehjd9mIbViuJfo5fSOo/wvn+P9qpj0OITTlF78gadN8Mo0kAxRAuZXx+8hUXOmzH+czXvWjR53IqslSoW6/vsnTHKsZoKUWlqgEZxayveTNpv+WGxL8z3B6kVFcNWqezLoXQr/9x3911mkN8aJAlxIZ7mJLJ2hXKQYrbMoOnZEpcTDhAf51Tkdmj71W8qtnLth48sHRvk7NRY0GM2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qsmy2zB/ki6T5YHMfhmNyVWjEIBJ+Co1Epnc3drKGkE=;
 b=O6Wn8gJWQyQq13WyInbFJB1uhhfZSpXqA2l25DY2d0eeuZjJN61CCLUk3iTMPCzNulAuJ6G4wN2jtMb72/9DJd6dU15OtmNFDuysPPguDtGdz6y6lkMBkAienoVjkiAN0aGRsOrBdAmew/Z9HWQfmO5pDvttpPqXcT9OcNjkuSOgfjur7Gg1Upd3wKPTN19vLoEJ8vtMeg3YSJeJTGBdFtc6sGN4XV0H9pS8lX+LZwak4gJq2y4ION+SndEQ2rEbTOeRnxzCuHgyG5lAlF/SWbAHc5daP2h6lCgll437P3WxhZdb1tj1Bv83IYUOAq0eA1sNrvbcPPUzOTIfXCfnIw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PRAPR10MB5374.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:298::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.45; Wed, 10 Apr
 2024 17:02:26 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fd78:3502:7564:1891]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fd78:3502:7564:1891%4]) with mapi id 15.20.7409.053; Wed, 10 Apr 2024
 17:02:26 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Beniamin Sandu
	<beniaminsandu@gmail.com>
Subject: RE: [oe] [meta-oe][PATCH] libtorrent: remove CVE mention
Thread-Topic: [oe] [meta-oe][PATCH] libtorrent: remove CVE mention
Thread-Index: AQHah2vilX/7YRQN2UCnw3lwwfR1kbFc9a0AgATMlqA=
Date: Wed, 10 Apr 2024 17:02:25 +0000
Message-ID: 
 <AS1PR10MB56975FD5C4814FCFF378A635FD062@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240405151335.55698-1-beniaminsandu@gmail.com>
 <171250415788.900727.6749515569891043462.b4-ty@gmail.com>
In-Reply-To: <171250415788.900727.6749515569891043462.b4-ty@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=46de5805-2368-413e-bdec-f9c91800a8e0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-04-10T17:00:12Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PRAPR10MB5374:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 2fIDZT8AEycEiXrxgKBcJiAr4nQtxtxnxSQ0nEb72QuLcSngZpCUJE0YAFzNkkRrQVJaurEbUUFCdwEVWDoXxz3qtr9HHZ+CbCNEMwPFu6MI2qiN90zgTCScpVwr9vH9/b2hLsZvHx5Fup3J+XawB6Lf+l3OO4VN3Vmtkdb4LpxUJiXW8aEqAR984mGS5TY2k9nWuG5Zo00pYZgx3pMhys2hpcj8LWJ3R0nEF7OvpFDV2SJJCKCI5FMgpDDdvLsVi27M9iIQefwNg8wrDwHUZv/oTkX6M9RPB2rrjrMVga2aOCC23J0k1s7SIJr5uLl2IYn+8Om/jW+kzkFqHU/KG0PNwY97AHGbr1bXOXZ5Ufc2AMDELDer246w9SI4UyTVLpBZuSWfIZj/Yh8VrWRhJSnH0fCOxMtjr+z537+fllp9z+5bfhBBBpiMIci+7f4DLmOyBPCkcf/cNRAkgMFciFHhAPH5ovUcJ6oF9OMlaxMnTW/Rxm0zbe92S67myWvXPphQn5Z0eSQEqgnY5y3T6S/AUb8UyJ97NZrZFIkBkMbZR5YWYL5iCgu+AyvFX1zQrlDxaX1Kme97QXxUlLUDl2QzPLDCeP5YNv/ki+CUR78=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VFBRQTFmNDg2QzNpaS9LUE5UTHNSWUUwRkJiVUZhKytsQVJGTVN3SmFqWXNE?=
 =?utf-8?B?cGZIa25uL0h4UnhrVHdWLy9xZ0padGRMNGpBK3lIRTRNSjhJaFNCNGVrelNr?=
 =?utf-8?B?RFBPRkFreERxNjJ0WHpOVW1tY3RRWWRSNXU2dzNEYmFoUTdTSmJSRUVZbWty?=
 =?utf-8?B?bHp6ak1tRVBUTW45RVpxNVhxZnVQZnR0allWd3lPNktrY3Rka0FMSStZSnVu?=
 =?utf-8?B?cFZ5eW1UWllxbW9hYmMyZWVqQS9ENld5c0FKMTlvenNlM3dpWWZXcHpYbTdh?=
 =?utf-8?B?YnYyRGVxVDI3cTFsWFc0WEt3WTVDSXB5TDh5Zk12bkNPeXZwTzlhTmtSWXlG?=
 =?utf-8?B?Wkw0dnFxR21XckVadzVhTFd5MGJ6WWQwVzlvamxMVnMzNXQzdDBtM1cyNmRa?=
 =?utf-8?B?VmRobFh5QkhwM29TTlFUaTlRTjlLd2t5YVZFdWEzb0IrRDFUWHJNd0s0b01m?=
 =?utf-8?B?YWp5SXZ2RlphRHpXWXpLOCt3Z25QMW4welFHbTIzK1orVEs5ajROYUNMbTBU?=
 =?utf-8?B?aHc1K0g2UkxLT3dVd29RN05qNjNtaGNZQ2xjM0VzcE5hWFRCOENheEdKUWs2?=
 =?utf-8?B?SGVTL1hrNkdPOWhESUFNMGlJQWxsTXRWdjlraE9PcGFFZTdtKzNacFpNdmE3?=
 =?utf-8?B?VHNZWHErb2JKVnh0ZlRHYzZKUERmV25KcHgrUFhXYWl0SEg4TE0rZTZsamVs?=
 =?utf-8?B?M3pqc3ZEUTlrY0ZlK0JFVUlxSmgyK29pNnF5VVRQbTNVVTdnR0Y5UHpmVDNt?=
 =?utf-8?B?dmFRUjFNbHVuVGJpN0RwU2lxVXdhdVlNSmFTd1hyZ01XWjNCclFzaCtVRmFk?=
 =?utf-8?B?MzJrZnRZREp1NWFUN0x5MzhneThFT240UVNlam1YT3BTb2lwR0NabGltc2Zy?=
 =?utf-8?B?VFR6TnIwWU05QkM3aHNjYkJMcGcxWlJndHl6UkRRT0hHS3ZaR0JlWFl2Umdm?=
 =?utf-8?B?MnVxRTQ5SFJZVUQ1eWJ6V0E0QzZ5V2lCRDhkNmNnc2ErSmVraFU3NXRPbHpE?=
 =?utf-8?B?R0k2YnRXU0dzdmpjREhNRzdFVHpRWUFaNzZwSGVucmc3Z2VUeDF6aDlSTmhV?=
 =?utf-8?B?R3NKbHJIV0tITGVPMTdNT1FIc1o3eE1pbGtuRzl6ZTNqSm0zUUF3QXNsOG9Z?=
 =?utf-8?B?dVVKZ2V4d2VOT1ZvaENuWFI2dmZhU2dhUUg1NDZTbkJsek9FNVVrL0hJVjlV?=
 =?utf-8?B?Rmx0RmJxQVBxeWFaOHZqRnNPMTVhWGxjaGtOdkVrTGF5QXdwd3hIV1FHRVhZ?=
 =?utf-8?B?VkIraStDWUtpdmZZY1Q4WG43ZDgxMEtnL0NIRGIvN1J5dEVBUk84UTdISjUz?=
 =?utf-8?B?Y2FBWUppZUVPWjJmZ2NzVkp6K1N5OTdTOG5LZGd6aWx4eHkySUczaVVOR2U4?=
 =?utf-8?B?dFdhK1dCZUtadkRPRmZxVWlXNXE2NEJCemIza2VZNjg0eUxNbitZVFlHanBa?=
 =?utf-8?B?VjIxZmswUkZETmxVV2RuK2dOUE1ESHlPQVFXRkZWUUhIU0dQblo2MldPRjN1?=
 =?utf-8?B?QkJkeCt2V25FVjBQR0k3VmNFSVVLMzhvTStjVmF3TGsrL2ppVzg1c3lKNmlt?=
 =?utf-8?B?bTRqa1JXSmM3d0diYUQ2RUc1SWdmSURoWngxUUk1bzZENGxLbmtOT0F5Q3J3?=
 =?utf-8?B?dEJ2VllvZVVPZ2pCSjZFOEppQmtxWG1DVDl6Z1hkay9hRHpsL1RFbmgrTzU4?=
 =?utf-8?B?M0hKZ2gwYzZQekxhOCt4WW9CZmgwZ1lzQjdnOFlwTTdlY3hyUzRhN1BsRjV2?=
 =?utf-8?B?VVg2TnorLzJPK0lWRzlDeUx3RjMzQ0oxRW9XTEVyMTVDQjZNcmtUOGNDekVu?=
 =?utf-8?B?NjVsazVHd25wQmxEYnBFdnJJclN3MkM4YmkySkxMWlNZUml4TWhIVVlvaWhh?=
 =?utf-8?B?eDZQam52WlBPM3l6WVhRY3Y2SDc0b1VqL1M3TlFEUS85cHBBUkZpWWpjeVgx?=
 =?utf-8?B?OWwwVlVTZFRmczVoQjBxVmU0TXZVSlZLSnFrZjJSVjk5VTZxSkJYNzcxT3F3?=
 =?utf-8?B?RE51bHN1cGJmckl6c3dkL2o2bHZONFlpV1VIQ3RCQ1BZZHhHVkIxdXdRc0p5?=
 =?utf-8?B?VDZnUXB2WDF1Z1pZWmxpc01tZjFIcWI4QXkxZ0JLUUtrY2QzVFc3NXBDSzBx?=
 =?utf-8?Q?Beg3J1GZZWTlpE50Csup5Ku2e?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac0c83c-352b-4bc0-2bea-08dc597fff6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2024 17:02:26.0109
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +aNOLHskm5nRQ8+y0mUxGJAlNOTcq/SvSyGso1FUwfJIPtOIZxUx3YEjJlouj0ykP//ZwzpvlqQWZSzZO0N6+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5374
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 17:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109906

VGhpcyBDVkUgcmVhcHBlYXJlZCBpbiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvLmlvL3B1Yi9u
b24tcmVsZWFzZS9wYXRjaG1ldHJpY3MtbWV0YS1vZS9jdmUtc3RhdHVzLW1hc3Rlci50eHQNClNv
IGl0IHNob3VsZCBub3QgaGF2ZSBiZWVuIGFwcGxpZWQuDQoNClBldGVyDQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJl
aGFsZiBPZiBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU2VudDogU3VuZGF5
LCBBcHJpbCA3LCAyMDI0IDE3OjQzDQpUbzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc7IEJlbmlhbWluIFNhbmR1IDxiZW5pYW1pbnNhbmR1QGdtYWlsLmNvbT4NCkNj
OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KU3ViamVjdDogUmU6IFtvZV0gW21ldGEt
b2VdW1BBVENIXSBsaWJ0b3JyZW50OiByZW1vdmUgQ1ZFIG1lbnRpb24NCg0KDQpPbiBGcmksIDA1
IEFwciAyMDI0IDE2OjEzOjM1ICswMTAwLCBCZW5pYW1pbiBTYW5kdSB3cm90ZToNCj4gVGhlIENW
RSBtZW50aW9uZWQgaW4gdGhlIHJlY2lwZSBhcHBsaWVzIHRvIGEgZGlmZmVyZW50IGxpYnRvcnJl
bnQgDQo+IGxpYnJhcnksIGZyb206DQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9hcnZpZG4vbGlidG9y
cmVudA0KPiANCj4gDQoNCkFwcGxpZWQsIHRoYW5rcyENCg0KWzEvMV0gbGlidG9ycmVudDogcmVt
b3ZlIENWRSBtZW50aW9uDQogICAgICBjb21taXQ6IDA1OTdjOTMxZmZiYWRmMmEyMjQyZDhlZDlj
Y2NiODU2Nzk1M2Q0ODkNCg0KQmVzdCByZWdhcmRzLA0KLS0NCktoZW0gUmFqIDxyYWoua2hlbUBn
bWFpbC5jb20+DQo=

