Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC969C3064D
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 15:53:29 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.69])
 by mx.groups.io with SMTP id smtpd.web10.177425.1719330802625747721
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 08:53:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=iA+2hScP;
 spf=pass (domain: siemens.com, ip: 40.107.249.69, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVeB3pfDCjkLGnwPqXeKDZG6NTiZZUFDeIDZNbaEW4msZ7j+YbaT6tBPFvUCpR/EAhJQ39I09YDUNS1UO1baxcc2qiTO9FUOMbyga5rQTlSUCN2YhGhmna60X2cBPRGRkaFtL7fKJm4fTCYcMVml2tQ0+n057kQ9xXrM8MjQrB1uppj7uR9DFhbmLzjubIkY2a/lSfbdluVglKpS9tWFzUQrVJwAmdS3aQKYn4M2D1DSS7ZWTYc/vPyjoSk02jBFpEcYjPFWVGi50V4zac15SaENHf7+eMFowakHw1Ena37sQs+kY5ve+mgT3YclKdGjCbF3PHRXqwJueS7g2ukYhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRSxJUjKEhldr+m/Lv6P/P02dhbABnaGN6//eiEr+lc=;
 b=MB2G9MWqnDtZQM7YTjZKzagVs9qRMZXf/2U7bdn9OXAkjJZoFLvtZb7DOscw76Ghj44V/imrdgmRC9d5swtL6Ppn//oLRy13bG5WYQS55/CBoMI+ux6t+hVQv5vUvrIyDOMx4E3ryK3egnShgul+XHgevz+Yy8EKtZ18nFlnyhLX4EAiMyLC6j3Smyqs9tJi0yANfUnQmjwUfmVx2iRRp1sMCkWzqaSyDVOxKkiesjL64NCUwR/tgd6QWBjGi5tRWLojsQYt1YSk9umvxA1PKS0HhIEQnHh6R+I92oCYfjaAO85fVzJsVMCbiOwhcGYJMn43jRnxKaT/oAxFKgMMnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRSxJUjKEhldr+m/Lv6P/P02dhbABnaGN6//eiEr+lc=;
 b=iA+2hScP1bGWgm81gtWwcs75gATxxg9dppThwtxczicj+fsiGmIIL2UmwN0CHYN74/Mq0QHtPSGmCgy4QAzAzlikiSMUdMJ4HCrzQC68mpaeOgkj0ebhpOInHWot0jAb4JwuBxQg5GW0VWV/wV5jffG+nHBSSSmLGpW+nU1uR59X55h/q3Jcl8V7wuvmDsf5KN2HKICTSckvb+BEFAsruchMn/sjUvXEFgxwtCzARtescGzJSCJfDUCWCSDs8ZoSMM3bVLFJP0vAd8a3BR8oF3viIfF/DkiZp1P2tjrOjgIx8iDT3sgVdScuTVWj7R5pbdw5QGVgTDRkQ61VJZX68w==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PA1PR10MB8796.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:451::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Tue, 25 Jun
 2024 15:53:19 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 15:53:19 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][master][scarthgap][PATCH] cjson: fix buildpath
 warnings
Thread-Topic: [oe] [meta-oe][master][scarthgap][PATCH] cjson: fix buildpath
 warnings
Thread-Index: AQHaxtehwGEbuDVBtUeTNLgm32UO9LHYnUIAgAAEQkA=
Date: Tue, 25 Jun 2024 15:53:19 +0000
Message-ID: 
 <AS1PR10MB56973A2808A599A7AF0C174CFDD52@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240625081259.1785605-1-peter.marko@siemens.com>
 <CAMKF1sqAuENdwTOSwSwCM7uCkAjAKmC5eCbPzdu9GT71UFJEMw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqAuENdwTOSwSwCM7uCkAjAKmC5eCbPzdu9GT71UFJEMw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=5322cd8e-870a-4ac5-9946-2ed299733f03;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-06-25T15:51:54Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PA1PR10MB8796:EE_
x-ms-office365-filtering-correlation-id: b11400f1-2634-4605-a859-08dc952eef7d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230038|366014|376012|1800799022|38070700016;
x-microsoft-antispam-message-info: 
 =?utf-8?B?aXNST055K2NQdEJEZVl4MEc1OEpUcmdXVkx0MnFLdTBiUUFFOXFrQTVoNnpT?=
 =?utf-8?B?ZWNkUzN6c3llUzgrZWUwVTlEQjRZNE1CbmVycjFZVTVrYy9qSFdGM2RxdktJ?=
 =?utf-8?B?TE5VTDYralVvZjFMcU9lNFNKd2Q3Qjl6ak5qMWpvbkJ4RkplYmhTc2NtMTVz?=
 =?utf-8?B?cU1JWXlpZjh6ZXNzR3pOQXN4SU1HVEdIWi83amF1SnJpTWVkUnNBZVpiZkE5?=
 =?utf-8?B?bVpmREJBK29ya0JtUnczZFBuL01BcjhYbnhDQlFKdVF1SHU3cVZRSFphaCsv?=
 =?utf-8?B?eGRVNUNrbjhEUkV3Z1R6eC9hL2Jxai8zTTZIWkQrcHZRY2FHS0QzRVQyOG11?=
 =?utf-8?B?UFRkT2lKVzZHUG5YRUFDakVHcUs1bUQwUWl4R1lVRDNGYWR2MEgrUksvcGlv?=
 =?utf-8?B?OHBzSGV5ZUliMElVa2dFTGc1OGFyS0JBeTN0bUZFZS94aThEY1p0RkZNQVlL?=
 =?utf-8?B?RUxLY1FWWFBjV3pzTUtOT1BjSXFNc2tXN1I2cVVRQWx4M0k1NVBSbzZuRkl4?=
 =?utf-8?B?bXhCNjBEbEo1Qmgzdms1RERnWkgveWxyenFxRmQzM0xpUGFGaTlUTU1VWm5n?=
 =?utf-8?B?ZG1Ed1RWekNkOEhEUkpRNUI0RERWL3NzMUlpaFIySWNlek1jckEzRDNSMnZT?=
 =?utf-8?B?SVdWc1BSRmNRREo0MDJzakgvRGludE9TSHVCaVhEcGYybmhhK3Z0NTl4QWta?=
 =?utf-8?B?R05aLzRoT1FUWlBIc2tnU3FSR1RUVlhYUWx0ZzJjeFc1V0o5akRuS2tDN1J3?=
 =?utf-8?B?QmN3Zkh2MUxCR1E2SmMraVNHb2ZiU2xteDl2QlZHZjFTenFMaFFnQ3VGRlhS?=
 =?utf-8?B?QUZwRVdCNWVLTktvU0cyblNlVndReUFOZlkyOUZscHArd09LYkJhRDhYdEc0?=
 =?utf-8?B?YTR2RWpzMlg0STZEeEs1MktEMDNwNU1GVjlGUk9MRFdlbkRBczQxOWo5Q29C?=
 =?utf-8?B?NkFQVWhBVHJKL3JSZmUzVEFTR0l0YVpIV2NoRFZEOEo0UVRmSzlqbFdaUUhW?=
 =?utf-8?B?T2dNMm1HcEdQQWRleXdSZGhmQkhyVUxVQytUYk5GQk1aTGxndS9nSzNldmhx?=
 =?utf-8?B?ZmIrWWRaWFcvMkl1QVhTYlprM0NHbitESTY0enAyVVBXNTBGM290YzBFejVC?=
 =?utf-8?B?Slk5UHhaT1RsSW9hVTM0NlVpdncrR0ZMblQzUXVOYjZhMnR4Qm1aN3ZWUlRK?=
 =?utf-8?B?MUhZcDJ4dE1HNTVZS3dkWU84Qi9rVTdlT3BwK1JpMVA4bURKcDcyVTNiaFlu?=
 =?utf-8?B?NGFodSs4Y3pZcEJRcDdUZWh2d0RsOWFIeUN6alY0UmhIUXdYL1FOVnFMT1Av?=
 =?utf-8?B?RWo1MVVtWktlMTZUU0tzZk4xWjhZTFJWdTBRNHFITFVTUlZNSXVRT1pZbEx6?=
 =?utf-8?B?WGkxZHU5NU1LaCt3bUpBTG1UdnFqRXh3WG9WbEZkeUxaVTFneHo2L1VWL2Rp?=
 =?utf-8?B?SjJGL2s4NnFHSE01VHRudVoxQ2ZqSitnK0RZRU14ODBHQ0pxZVIwK1Judk5J?=
 =?utf-8?B?SGFDWWdsZ2ZLUlVEYTBtWXF1Ykx0dUFUYmVSWDlIUUtkZVM5Y0VDVzRzUVF2?=
 =?utf-8?B?bnA2cEprMmRzMUpxSHJMOGFNSHdsV3VOZzR6eHlsMDlIUDN3ZFFqdTAzd0dR?=
 =?utf-8?B?OWJqRXl3Yy9QajYzOXd1THJORkZ0anIzdkRNNHVGdXQrWW5yckFsQjM0VjJE?=
 =?utf-8?B?RnBucmYvVnVoejVVRkJpdVFYdytQTUdrckFuOFp5VUdUQnJ5MG16cFUzWjlk?=
 =?utf-8?B?UUxmUVdJSDMxZyszaHlPcFFFdE9yd2N3d3V4Mmt6cXEyaTlZcXhJN0EvMDBy?=
 =?utf-8?Q?YhGEs14aSJN5M9NHUxElb0pC5SDVlT57OgwwU=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230038)(366014)(376012)(1800799022)(38070700016);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dEF3L2VienFrTFR6TlJYM3RyNlI0UlozaENCYWt3K3lPUXU4OVhabks5NXhL?=
 =?utf-8?B?ZG9xRTZaNVJYNzVmbXNvdzFaUkR0c21mWWhTSFJTQmpmaDhLTHkwSU83Um9T?=
 =?utf-8?B?eTY4aW0xa0g2WjltVlVQVG9rbWVXMTBjeUEvYW5JZno2ZEZMUUJNNlRzQlhL?=
 =?utf-8?B?VXRSTVFqbjFVNWNLNzhacnVycjZZUHBkTHZ6R1J5M2U0bVRkN29jcmxnVURB?=
 =?utf-8?B?c2QvMmZVUGpFeUg3SnlNd2VHaTh3Q2pCZ3lpeXhvZWVZQnRMdERGRjN2RmdI?=
 =?utf-8?B?Tmh6dkJuYitJd2F2ZEJJN3o4Rmw0RU1uNHI4emR3Wkw2RGV4dTJxd2R3VXdn?=
 =?utf-8?B?U3YwMW1ZdmllUElzcTdkQXlmOEtkUE5SS1Z4R0NRaUVvNnFaSnY5UlZPSFI5?=
 =?utf-8?B?aGRpeStkUHlFd0VzZjZwRHIzZmVoYTRicGVmRmJOV3dDQ21pWW5NdUJEdGRW?=
 =?utf-8?B?ai9RT2VjN0Fzblp1Z1RUdERSL084N09EbW9UN0JDQ284YTN5bnNEaXpCZlJZ?=
 =?utf-8?B?R3duZkRCcnZPakVVc1dRbHR2dHM1UTNBdE9zdVhSc1BsdnRiOG0xZHYrYjQx?=
 =?utf-8?B?L0x2WGZVc2Q3bXB4NnVES0dFUGpRME8zUm1tUHBDOEw2ekR4OGtDSjNObFZR?=
 =?utf-8?B?NmpwQkdxYzUzN2piOEtJVytaeWgzdElZUXdMRXpZZEtRYS9YWUlyVk16cE54?=
 =?utf-8?B?OWd2UXFqKzVsQTdTZW1nVEV1d3Q2aXg4bzBDMDJoS3ZNdGlZMkhsV3VnaDlv?=
 =?utf-8?B?eHJ4YVFGTG5LREVpU1BOWTNNQjJndFNMUTNWR21EOUpEYVQvanEyNDdoZS9M?=
 =?utf-8?B?aDM3SmZGR2xFVFNpMEc3RGNXSUswZE5NeVBQR21RUCtMc09ZdGpIQkhKeVRP?=
 =?utf-8?B?QitqYU80T1E4anZsOC9GNnRLMGZkdDJUQW9GZ0kyRFJIczN5U3YxN3ZXWUJP?=
 =?utf-8?B?ZFhMVHJOVnFLVGVqWllKeXB6THhaR3BGZHZ2MFl5TkRwZmlabnUvVENHY2N1?=
 =?utf-8?B?d0tGU21Mbmh5RGsrRFAwRGRKa1lwUGlwMXB4NEx1aWxsZTRmYUNVdS9za0pZ?=
 =?utf-8?B?dHh6NkwwTjNUdGt2UEpwdFkvbHN4bVBRQlhKUzFwVHR5VkFQZ0xIYVd0THpy?=
 =?utf-8?B?MXhjcWplRXoxSlFsU0lXZkI4V3FYRzVHc2tPMFhPa1FTZ1JRQWNnbThJNUFL?=
 =?utf-8?B?clIzaTNkN1h5WW5kYTd5a2dPamhSRnVYNUNOZThkTFFiUEJiL2xXS29WemFx?=
 =?utf-8?B?ZXRlSzRsbXZkcnJSTHFqUW11a1UwelhtM2ZWVmdnLy9vQ3VRTXE1NU51bzNO?=
 =?utf-8?B?eWdRNGRGSzZlN1lXWDVWRzBzVm9SaWJlZGpBQmlydHlYQ2ptWXhQMmhyajJ4?=
 =?utf-8?B?TzhjNDRzNm5GQkRoaGJMTitPVSs5R0NlNGJsNitRTCtHWnRnM1psblpSdDAv?=
 =?utf-8?B?cGsxWitEVVRIQ24zUVo4RFlRaHhnNUsyTmVpRkswZ3gvRU9vbnFlK1pDS2Vr?=
 =?utf-8?B?RGRMNVhnbmgwL251TjNLbjdMWHllT1ppT3hrSWNVTG1CMHZsKzJrL2xUQ2w2?=
 =?utf-8?B?SXNwd1Q0UmFtSThyOGxNdVdseFZoSXozdDNDRlUwOEttZmljV21FTXBXckpm?=
 =?utf-8?B?aHZTM3g1ZXA5YzZ2aWZ3Z1UvbzcrTlN3VnAyUjQ2NVlYc1dNWUhhUEZSNjdK?=
 =?utf-8?B?MGRLWExiSW1TWUhCSVNsR0tCcGZnVUEvL25pSmFuSC96b0NKUzU5ZXJXdXd3?=
 =?utf-8?B?M3g0eHRpQnNUbTZzVmN5ZDI4VzdiUFIzQWJiT3Vjdk8vRWJHaUk2aVBJQXBH?=
 =?utf-8?B?aDRLc1pJZnNLYlRNSmNCbnJaSGdrcjF0allLbjVEalc5TEZ1U3ZIbWl0U3BZ?=
 =?utf-8?B?alBnTm9nVDFudzFHM3BIclBPeGNudE9PZ2FEUFJSQkZPVUZ0OTR0bHhjMjBk?=
 =?utf-8?B?VWhzTEhSdmFMUldDSVRBdFVGdmVldUZHQUcvWWZyS1I1cU1lVFltb0hpb09L?=
 =?utf-8?B?K3ptS29QQnBnS2FRVk1DOEV0WHRGVU1BVVMzK0k2dlBFZTJEV3JEVStHL0xv?=
 =?utf-8?B?SnNMZGl5dlhtRHBXc29zakdYaGpXWEtQbUhhTWQ2VFBXYzVNMlJmRytPZEdX?=
 =?utf-8?Q?fx+p4G/Dv/nUgFvDACbYt0cnH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b11400f1-2634-4605-a859-08dc952eef7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 15:53:19.8172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rrkm6mBVRzv8JOb3fsK8WrBIUfti3Tb6ZZYMra7zTaJ5UlgT+6Xq++3nRFg1KnwkzxuO41956Es3ic7Y5k6loQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8796
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 15:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111075

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+IA0KU2VudDogVHVlc2RheSwgSnVuZSAyNSwgMjAyNCAxNzozNw0KVG86IE1hcmtvLCBQ
ZXRlciAoQURWIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtvQHNpZW1lbnMuY29tPg0KQ2M6IG9w
ZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW29l
XSBbbWV0YS1vZV1bbWFzdGVyXVtzY2FydGhnYXBdW1BBVENIXSBjanNvbjogZml4IGJ1aWxkcGF0
aCB3YXJuaW5ncw0KDQo+IEl0IGRvZXMgbm90IGFwcHkgb24gbWFzdGVyIGJ0dy4gSSBoYXZlIHRv
IG1hbnVhbGx5IHRyYW5zcGxhbnQgaXQuDQo+IFBsZWFzZSBsb29rIGludG8gdGhlIG9uZSBpbiBt
YXN0ZXItbmV4dA0KDQpJIGhhdmUgc2VudCBhIG5ldyBvbmUgZm9yIG1hc3Rlci4NCkJ1dCB0aGUg
b2xkIG9uZSBzaG91bGQgYmUgc3RpbGwgdmFsaWQgZm9yIHNjYXJ0aGdhcCwgY29ycmVjdD8NCg0K
UGV0ZXINCg0KPiANCj4gT24gVHVlLCBKdW4gMjUsIDIwMjQgYXQgMToxNOKAr0FNIFBldGVyIE1h
cmtvIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxwZXRlci5tYXJrbz1zaWVtZW5zLmNvbUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCi4uLg0K

