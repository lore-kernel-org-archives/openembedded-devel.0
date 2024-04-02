Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE248CD1284
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 23:14:54 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.94])
 by mx.groups.io with SMTP id smtpd.web11.2235.1712099688669077852
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Apr 2024 16:14:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=nDPvdqLF;
 spf=pass (domain: siemens.com, ip: 40.107.20.94, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgbB7QkBuPvWvHbljMu1Mrz8wiCpxhhxhevUGl6pldAnBrTlJAvaYIZWKHeWWd/PZczDbqVoGisoRenM0BlAlN18kctT/tNy/8TudCY6SfiEWNHXCMO0K9hk4XcmSoVdbb7yOR0RTAG3iIOEZ97heslh6flyO2w9o+ZHddpKM2Hzcv0vV/OQ8KZ8UOA3VnAak/FYWbUgaJiRkj4OMPUo86SwEwN6aq5MMOiXCEgK2O33u299qgXKhqsiUtVoM/jD2wnGy28ZiDp50oM6YR/8uJx5qGsunxvUU1ZhOnR+pbQuIP9OzzpHYF1vWrQBF3bkmQKiTauqcQZj91mLoJkqlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/QMmnOqA+qo1tPQ14Uol61kVPO/p/JPcQ6Ryw61Z40=;
 b=gG/994fJlqrw+twagZfrytP7ptDSWs1vJ1ljHiDMDnQ5FiqjnGNPztdmH6sLJH0ERcETOSyP9XSRcMFfeWQMa0n10pqzw0gqtpjc8Q+UBfwn8OKJJiGZq4GkpSAUgWEECGARWpDF1UmNd5W+TXeVLRR7rky7xwxXb57eH4bNgE3om5YZRM+T+ajS63GO7kD0Hxl+7hWYbhAviYmlWyq8gsIsBK2OdKy7sPkUdui0jXYbh/t9svr0sQjY5PFBpkKpT65njFJWIpb54qKbXdDL0JxZoXws4jAhDODF3sTbDg98VUepbyXL1PHHbh7qXs9JI9nGfZ1Gv3YNteCBA/izTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/QMmnOqA+qo1tPQ14Uol61kVPO/p/JPcQ6Ryw61Z40=;
 b=nDPvdqLFI4azbLpWXGee+onS7Dd1bSJRS1dKC3R4meS7+mLScD3YxU9jmuKqvF7d/X8GroqALmNdpRT77sjoH9aq0lP8tRPPoGDGFfmBMuhNJMdCp4lGTdlxvcji+BkuTc3/xgF+TaWlRz193QABcg//njyNOR0VS4cVPNodkkoEvjcCZzbmA7FFUijHnIgp6yfO2Dg7J8uiiemyBmYt+IM47jJ37v2Ba6oe+/HTrVVOjFyOlqTe9Xra+bu7va72AYQin+iY8HmQhLl1My3v8OB/Pq6EUEHhrvxZvl6J92x186qSbY36NMcmOqPuKVf3VerCI2M3ZHm+inyiKcwHIw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAWPR10MB6854.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:33a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 23:14:45 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fd78:3502:7564:1891]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fd78:3502:7564:1891%4]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 23:14:45 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH v3] microsoft-gsl: add new recipe including
 ptest
Thread-Topic: [oe] [meta-oe][PATCH v3] microsoft-gsl: add new recipe including
 ptest
Thread-Index: AQHagJuTxL13/BUgbUmnPOl4uodXHLFMkKIAgABXHeCAAJMaQIAAHTOAgAgCbZA=
Date: Tue, 2 Apr 2024 23:14:45 +0000
Message-ID: 
 <AS1PR10MB5697FB8EBE74205D71E3196EFD3E2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <CAMKF1so8Zc4w9WuD94+H360HJtnYmG_Qt50cPh8BdB+LxdKN3Q@mail.gmail.com>
 <20240327230647.694952-1-peter.marko@siemens.com>
 <CAMKF1sq8PuRhJHV9=k_C5jtn7DZXYFD-ExX3M_2dP0DGCytT2w@mail.gmail.com>
 <AS1PR10MB56973F70AEF71312F08CA572FD3B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <AS1PR10MB5697007C6F526B1C3182134FFD3B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAMKF1sqZr-Y7=jdkmBAvaTq39e2pFxMoxYoE6hLUhXQYJOSh7Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqZr-Y7=jdkmBAvaTq39e2pFxMoxYoE6hLUhXQYJOSh7Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=7d54cb45-4a22-43fb-82c2-aa6b5f73f187;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-04-02T22:33:55Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAWPR10MB6854:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qciYlHHSRmD6F+L0hE5msENw/11cJQyJ5EoL2tGvkCmlqgwxd3+W0J4N6nT9mh7M412NrrpaGba9Cp9Qs9XI5wTgSNU5SSQ+CtR3uONFG+AfeXLMnTWRhAuFTV7IOSNzWVLOzIOCnEBFpiqNGGFlsl5ySUqwlkv98KMEfip/occGk7dA7EWaYeuIKBfIbsUr9QdcoOA6823URSguYIvq4Tu4cHYtPplsTU8QSKc+vD5dVdGdxkoMSoks3Z2pYR1EOUwW+AKMC8j8gNM3Kt8qT7RbXTodYhyCIDHd0JXCb6OKtWKYqgfmymSdNuselnK0WlpJ7sh2kxa9/pD7vax4p8Ti7LSRvbB/6Z+LCEdDePowLpJIc8vDFQyKPWyiJiW5qZZskvju1XF5qe2WhXRZHYE6KlSpUdyMU/VJjZvODGM8VLCldDUXFQ64o8Q8tjK0R3oEAqpha3cZzGjGTciDCrZqrvCZ2bQlvXjGtyLaBl1MC898foFz0th96ZLSR1yeB9hqofVXdWXPQGEScI+GPGhN/PK5t9sQZmxi8f8GDkeb7mlZgf2sixR+UbC+O43D90LNzRmgpEJhJIe4+119iF9IgAtofMOuXDjvFV8GKJ0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?a05FOUpPOGFMS1VsSHp4RlU3Z3pqYlZteEVFa1hwWDc4TElEblpiSzU2bHhO?=
 =?utf-8?B?dDlydmtvWENJa2o0UVRCYjVudUs1dnNMa2E5N0VnczloaUVpcC9GZTVkajRj?=
 =?utf-8?B?emtBVWJOaS9SVWlpNHNORkJQdHVhZjRRem1zMk0vSE16aHZwZytjMFFrWElq?=
 =?utf-8?B?ZVg5RFViWmY2SE03MStLK3k5aTJqNFFRYWJuMXVpeU4vWURsaGs5SWVUUTBB?=
 =?utf-8?B?VHpORDZrNEZpNi9qb2dBRkNPWHdqY0EzUDBVRVQ5bVBwUlUxS3gvZFBhUXNa?=
 =?utf-8?B?amJFc1R2aXdCSUgxNko1NnZaVURHQTk2Z1RnYjBZTTJaMXBLZUIvRFJVK3hU?=
 =?utf-8?B?ZDRoWXdGNG9mdEFjSGc5d2VTcnpDZUVpU215SGNsVWMzSHk2cEN6b09lUTFQ?=
 =?utf-8?B?V1BMMTlOSGVoU2YxVUI1a1NGdXNiQUVmenZxc2pWdVlFN0k5My84Q0pXYkpo?=
 =?utf-8?B?dTBoOG0wVjl4cTNUeUtuR2tIMnROTXF1bTcwbklaNFl2MFNER3pwbE92Z1RG?=
 =?utf-8?B?dG0xTU9mblRCUlJMbHpwdUhBWHVjeUsvSi9OblY3QXQ0d2NBd3FkQW40eXlj?=
 =?utf-8?B?TFB3ZHAvT0FteENZYy92eCtMSm5Xay9TV2RUbzZYZzFmNW81bU4yVEdtN3Nw?=
 =?utf-8?B?ZjE4elZja2hBSGlnZVNqT1ErcGNPMUtBNjNrSEFYUHQyQVEvVDMrbHJvNzJL?=
 =?utf-8?B?THpMMTcwWFBUUVdjWlVGNTduMjdwTWpUbE9jZG41RVVyeW1lbFF4M1ZJdDlk?=
 =?utf-8?B?cFhqcjU4eEd1YnRhV0ZxZ25iK01ONjhBVGEvSWl3UFZFLy8rbjRVUU14L0NU?=
 =?utf-8?B?Y2lpSllrdzZlSVpZYklHcUxMQVI1OVVvNnNIc3lHWE45clBzVmZGVlRkQVFp?=
 =?utf-8?B?VlBVY05WYzBuNUNEMUpVUURJVGh2TmdZUDhjTGhXQzFSQjlyMStyODUvRjZW?=
 =?utf-8?B?UFpPTVhzZE15ZllwaUtDMFRZWVBsRnpvZDIwMUJRV1pkblN6VXBKblYzanNY?=
 =?utf-8?B?Z2dZK0t6VzJBTnl4K0IyMmJVWXN5dTZTdWs0N0NEU1p5M2JJZkJqWkl6MmdF?=
 =?utf-8?B?Vm5MTjB2eVpueGhDTHVHTndENHN3M2dpaFViWTNpZXE5QU5FbDV4V1pzQ0RV?=
 =?utf-8?B?N0VDRittZWNoYWNCMHpKWDRXWmZXaWt1ZTJFaWZ6YUxkVEZURnlNM3NsMDJo?=
 =?utf-8?B?TmVWdXVBWFpMUHJ2NG9lWHFZMVFpNkR2aGNIRWZERzJ4NlNTWW5MWmNwV2Vr?=
 =?utf-8?B?ZTBpTTUzWWUzMjF6NG1mWEErSUxxQXhYYnZKMnVMRG9zZnptOFhzYlJNektB?=
 =?utf-8?B?ZjNCOE5ldFczYUtyNWpxWi9QZ2xncDZsWWFXSXBma0p4M0x3Rkc5VjYvdzZV?=
 =?utf-8?B?K05ZS1hrelhLRW5nSklwNnJpZWtlTjErYjVEcE5vWTlIMDlnODFVZXI5bWVj?=
 =?utf-8?B?OFpNQzBSYVdlTEtuQ0pLbmtGeTROSzNzMjhqeGgvYXFDcUpWdk5ZSUNicHc0?=
 =?utf-8?B?S3M3ZzY1bDZCYVFCak1lMFovcFdVbHNUVytoL0dWWVd4dElRaTVoZTFBSnBL?=
 =?utf-8?B?bmwrZVZYREJSMEE5RDB3UW5oNExwLzFGeDF3SlJsWWZDd1ZOb0NMNURXa0FE?=
 =?utf-8?B?YzhHZi8rSFJ6UFpVTmxTMmxVVWY2akJJbFlpdFFicG5ua0ovZmdid0hCTUdp?=
 =?utf-8?B?S0IwMXUzeE9OcWpYYVVvcWpvYnZ4TlNYeU9WY0R5bzlwMWh0UkJzVHJrVXJ4?=
 =?utf-8?B?Ty9RcnVRejdldVhZaHpNOThXOHRsaDdBMUZCc1c4ZWZlWWxUQlZFek5hdzdj?=
 =?utf-8?B?Z1NVdlcvZ1l1ZWJTanNUczlidWdiOHlLeHlQd0lpKy9yV3JZT2haSzJJdkZD?=
 =?utf-8?B?QTE2ZWZ0S2dUWHZtVVhOWWg2VGJHR25lRHV0Vk13b1pEQ2dEZ2hKbXp5YlVY?=
 =?utf-8?B?UWtjQmpaZkJtTmRFWlVsSC9vN1YxM1Q4VnhzK3FQalhLWHU2L0NoOHNlVWh5?=
 =?utf-8?B?V0FnNjFxOHlwNTVwa3EwOWxEd0dFZG9DT1c4ZmtuRWpCREdUMmhTMTByeEdM?=
 =?utf-8?B?cElvYnBmUlVZSXdlS2tIR3R0Y1JpSStlNU9UeVJYaFFZd2x4NCtxbTdjUHF0?=
 =?utf-8?Q?7xznWjDgQBPqDLFBdgJyfz+7K?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f9f328-af1a-4cb8-cddd-08dc536aaf54
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2024 23:14:45.2435
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +XqCXutgkeM5s55anvB+2VnEvlehz6l78+nWYCk2EFhKOtzpDepPxfwPb/gLBjwXkTg6J9a2w9BrO1fpsudCIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB6854
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Apr 2024 23:14:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109790

SSBoYXZlIGNoZWNrZWQgdGhlc2Ugd2FybmluZ3MsIGFuZCB0aGUgcm9vdC1jYXVzZSBpcyB0aGF0
IGdzbCBzZXRzICItV2V2ZXJ5dGhpbmciLg0KVGhhdCdzIHN1cGVyIGNvb2wgdG8gYmUgYWJsZSB0
byBjb21waWxlIHdpdGggdGhpcyBzd2l0Y2gsIGJ1dCByYXRoZXIgYmFkIGlkZWEgd2hlbiB0cnlp
bmcgdG8gcG9ydCB0aGF0IHRvIG5ldyBwbGF0Zm9ybXMgKGxpa2Ugb3VyIGNsYW5nICsgbXVzbCBj
b21iaW5hdGlvbikuDQoNCkkgY2FuIGFsc28gZml4IHRoaXMgYnkgbW9kaWZ5aW5nIG11c2wgc3Rk
aW8uaCB3aXRoaW4gdGhlIHJlY2lwZSBzeXNyb290IHRvIGhvdyBnbGliYyBoYXMgc3RkZXJyIG1h
Y3JvIGRlZmluZWQuDQpUaGF0IGluZGljYXRlcyB0aGF0IG1heWJlIHRoZXJlIGNvdWxkIGJlIG9w
dGltaXphdGlvbiBwb3NzaWJpbGl0eSB3aXRoaW4gdGhlIHVzZWQgbGlicmFyaWVzIChtdXNsIG9y
IGdvb2dsZXRlc3QpDQoNCi0tLSBhL3JlY2lwZS1zeXNyb290L3Vzci9pbmNsdWRlL3N0ZGlvLmgN
CisrKyBiL3JlY2lwZS1zeXNyb290L3Vzci9pbmNsdWRlL3N0ZGlvLmgNCkBAIC02NSw3ICs2NSw3
IEBAIGV4dGVybiBGSUxFICpjb25zdCBzdGRlcnI7DQogDQogI2RlZmluZSBzdGRpbiAgKHN0ZGlu
KQ0KICNkZWZpbmUgc3Rkb3V0IChzdGRvdXQpDQotI2RlZmluZSBzdGRlcnIgKHN0ZGVycikNCisj
ZGVmaW5lIHN0ZGVyciBzdGRlcnINCiANCiBGSUxFICpmb3Blbihjb25zdCBjaGFyICpfX3Jlc3Ry
aWN0LCBjb25zdCBjaGFyICpfX3Jlc3RyaWN0KTsNCiBGSUxFICpmcmVvcGVuKGNvbnN0IGNoYXIg
Kl9fcmVzdHJpY3QsIGNvbnN0IGNoYXIgKl9fcmVzdHJpY3QsIEZJTEUgKl9fcmVzdHJpY3QpOw0K
DQpCdXQgSSdtIHVuc3VyZSBpZiBpdCdzIHdvcnRoIHRvIGludmVzdCBmdXJ0aGVyIGVmZm9ydCBp
bnRvIHRoaXMgZHVlIHRvIHRoZSBkYW5nZXJvdXMgLVdldmVyeXRoaW5nIHNldHRpbmcuDQpUaGlz
IGlzIG15IHNtYWxsIHJlcHJvZHVjZXIgd2hlcmUgaXQgYWxzbyBmYWlscyB3aXRoIHRoZSBzYW1l
IHdhcm5pbmcvZXJyb3IuLi4NCi4uLiBmb3IgY2FzZSB0aGF0IHNvbWVvbmUgd2FudHMgdG8gZ28g
YW5kIGNoZWNrIHdpdGggbXVzbCBvciBnb29nbGV0ZXN0IGRldmVsb3BtZW50Lg0KDQokKENYWCkg
JChDWFhGTEFHUykgJChMREZMQUdTKSAtV2FsbCAtV2Vycm9yIC1XZXZlcnl0aGluZyAtV25vLWMr
Kzk4LWNvbXBhdCAtV25vLWMrKzk4LWNvbXBhdC1wZWRhbnRpYyAtV25vLWdsb2JhbC1jb25zdHJ1
Y3RvcnMgLVduby1taXNzaW5nLXByb3RvdHlwZXMgLWxnbW9ja19tYWluIC1sZ21vY2sgLWxndGVz
dF9tYWluIC1sZ3Rlc3QgdGVzdC5jcHAgLW8gdGVzdA0KDQojaW5jbHVkZSA8Z3Rlc3QvZ3Rlc3Qu
aD4NCmludCBmKGludCBpLCBpbnQgaikge3N0ZDo6Y2VyciA8PCAiVEVTVCI7IHJldHVybiBpL2o7
fQ0KVEVTVChNeVRlc3QsIEV4cGVjdERlYXRoV2NvdmVyZWRTd2l0Y2hEZWZhdWx0KSB7IEVYUEVD
VF9ERUFUSChmKDIsIDApLCAiIik7IH0NCg0KUGV0ZXINCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+IA0KU2VudDogVGh1cnNk
YXksIE1hcmNoIDI4LCAyMDI0IDIxOjE1DQpUbzogTWFya28sIFBldGVyIChBRFYgRCBFVSBTSyBC
RlMxKSA8UGV0ZXIuTWFya29Ac2llbWVucy5jb20+DQpDYzogb3BlbmVtYmVkZGVkLWRldmVsQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLW9lXVtQQVRDSCB2
M10gbWljcm9zb2Z0LWdzbDogYWRkIG5ldyByZWNpcGUgaW5jbHVkaW5nIHB0ZXN0DQoNCj4gTm8g
d29ycmllcywgSSBoYXZlIHNlcGFyYXRlZCBpdCBpbnRvIGEgc2VwYXJhdGUgYWRkaXRpb24gd2hp
Y2ggd2lsbCBiZSBlZmZlY3RpdmUgZm9yIG11c2wgYmFzZWQgYnVpbGRzIGFsb25lIGluIG1hc3Rl
ci1uZXh0LCBsZXQgbWUga25vdyBpZiB5b3UgaGF2ZSBmdXJ0aGVyIHN1Z2dlc3Rpb25zDQo+DQo+
IE9uIFRodSwgTWFyIDI4LCAyMDI0IGF0IDExOjM14oCvQU0gTWFya28sIFBldGVyIDxQZXRlci5N
YXJrb0BzaWVtZW5zLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBEdWUgdG8gZWFzdGVyIGhvbGlkYXlz
IEkgd29uJ3QgaGF2ZSB0aW1lIHRvIGFuYWx5emUgdGhpcyB1bnRpbCBtaWQgb2YgbmV4dCB3ZWVr
Lg0KPiA+IElmIHlvdSB3YW50IHRvIG1lcmdlIHlvdXIgcGF0Y2ggbWVhbndoaWxlLCBwbGVhc2Ug
YWRkIGEgbmV3IGNvbW1lbnQvbGluZSBmb3IgaXQuDQo+ID4gTXkgY29tbWVudCB3aXRoIGdvb2ds
ZXRlc3QgUFIgcmVmZXJlbmNlIGlzIG9ubHkgdmFsaWQgZm9yIHN3aXRjaC1kZWZhdWx0IGZsYWcu
DQo+ID4NCj4gPiBQZXRlcg0KPiA+DQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
PiBGcm9tOiBNYXJrbywgUGV0ZXIgKEFEViBEIEVVIFNLIEJGUzEpDQo+ID4gU2VudDogVGh1cnNk
YXksIE1hcmNoIDI4LCAyMDI0IDEwOjQ5DQo+ID4gVG86IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+DQo+ID4gQ2M6IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+ID4gU3ViamVjdDogUkU6IFtvZV0gW21ldGEtb2VdW1BBVENIIHYzXSBtaWNyb3NvZnQtZ3Ns
OiBhZGQgbmV3IHJlY2lwZSANCj4gPiBpbmNsdWRpbmcgcHRlc3QNCj4gPg0KPiA+ID4gSSBkaWQg
bm90IHNlZSB0aGlzIHdoZW4gYnVpbGRpbmcgbG9jYWxseSB3aXRoIHBva3kgZGVmYXVsdHMgKHVz
aW5nIDUuMF9NMyksIGJ1dCBmcm9tIHNjcmVlbnNob3QgSSBzZWUgaXQncyBmYWlsaW5nIHdpdGgg
bXVzbC4NCj4gPiA+IEknbGwgdHJ5IHRvIGNvbWUgdXAgd2l0aCBhIHBhdGNoLCBidXQgSSBoYXZl
IG5ldmVyIHdvcmtlZCB3aXRoIG11c2wgc28gZmFyLi4uDQo+ID4gPg0KPiA+ID4gUGV0ZXIuDQo+
ID4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IEtoZW0g
UmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQo+ID4gPiBTZW50OiBUaHVyc2RheSwgTWFyY2ggMjgs
IDIwMjQgNTozMg0KPiA+ID4gVG86IE1hcmtvLCBQZXRlciAoQURWIEQgRVUgU0sgQkZTMSkgPFBl
dGVyLk1hcmtvQHNpZW1lbnMuY29tPg0KPiA+ID4gQ2M6IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPiBTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1vZV1bUEFU
Q0ggdjNdIG1pY3Jvc29mdC1nc2w6IGFkZCBuZXcgcmVjaXBlIA0KPiA+ID4gaW5jbHVkaW5nIHB0
ZXN0DQo+ID4gPg0KPiA+ID4gPiBUaGFua3MgZm9yIHJld29ya2luZyB0aGUgcGF0Y2gsIHRoZXJl
IGhvd2V2ZXIgaXMgc3RpbGwgb25lIGVycm9yIA0KPiA+ID4gPiBwb3BwaW5nIHVwIHdoZW4gcHRl
c3RzIGRpc3RybyBmZWF0dXJlIGlzIGVuYWJsZWQNCj4gPiA+ID4NCj4gPiA+ID4gaHR0cHM6Ly9z
bmlwcy5zaC9mL2JmdHZ6NEFOTzYNCj4gPiA+ID4NCj4gPiA+ID4gVGhpcyBwYXRjaCBmaXhlcyBp
dCwgYnV0IEkgd291bGQgbGlrZSB0byBzZWUgaWYgdGhpcyB3YXJuaW5nIGlzIGFscmVhZHkgZml4
ZWQgb3IgY2FuIGJlIGZpeGVkLg0KPiA+ID4gPg0KPiA+ID4gPiBodHRwczovL3NuaXBzLnNoL2Yv
cFJWYXI4aGxpZg0KPiA+ID4gPg0KPiA+ID4gPiBPbiBXZWQsIE1hciAyNywgMjAyNCBhdCA0OjA3
4oCvUE0gUGV0ZXIgTWFya28gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPHBldGVyLm1hcmtv
PXNpZW1lbnMuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+IC4uLg0K

