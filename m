Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617F4C3ABBF
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 11:21:04 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.65])
 by mx.groups.io with SMTP id smtpd.web10.73388.1746530460464098508
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 May 2025 04:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Z74t5yvo;
 spf=pass (domain: siemens.com, ip: 40.107.241.65, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qrIcII4iqzE645Mho5rKPtorHYEMwB4ak9KdF/HjxvLeNirjsHWgYX59co6omkrhcCTcjoX1RAYRIVBdO3y9qt5Wjq8+nH5wtqnxShaSYO4wk5g8atG6tgHzLWtVmJNEnXawXIQZ8Ivkl63YpgScC4NQ9ClX9fEViUAzznbLYEld72WIXy8Db3db1QFbm0GwIhu8lFQdQG+UU5RDnkoeYmon/u0AOcV3eWoO//Ut5ObD1oXJ2wbwdNMMQMlZDSBDybGGAmXeNjqn1gs12F9Ldxt5dKxEDdqXASxwAm6DSwYZlW5EvSS4AYj5yoLqpXBTSK5mxyzr72j2aqIj9Uk3vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csXqZiMQx2xIR4u+2JlgB63RJM5P5+6OA7PUigofd24=;
 b=ViSfFLfiEBtF/7998rUsWvXCaYSgfY6eMpnKGZSNUWMKruFPJupcag7wCF5kTWNdLxWBysuL6mrtCMSEJr4G9Di9OxUdMO34PNfqv+bCQJz/Ijg2tvO753u7u/pcX/vfsamcq5jBvEqOC48VZk3MbQtszMxorDY53ZUA3xi50lgGDIgvbQ7WHDBuipZKfMwxmcPq2WlO3hfS8nca/r1ALV9m4MH5GS8ucu6F9SntkDvKxakKFeDXI7ZeuS8WFGH4bhvFyz7r0J7H3V5OLmcUPql39ftXEr1q2K0gAUcWfM7QcB0OPfgckA3Wplbe2uMVvTtt3Muhz4Ee3flEYmCaAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csXqZiMQx2xIR4u+2JlgB63RJM5P5+6OA7PUigofd24=;
 b=Z74t5yvonUoTzcftS+jVtlakM/bA/ZywthHu4AKjTJcVZ5lBNJVVd8IDVlJtFt1Wvk3XVR6DdKVoOtqZp25KTPvRi5BGvIs7VK03/0k+3DJYwWamLkFa20rGadXJqnLN6ogYxamJD8soQ00T6AGK6vdasPqdh+27uvcSx9krq+A7yOoonp12+ftglJDdLfLCSu5OBPxbwdXGDvrQ3QTHQUgWyiOfbK4R9EooVdndl1I1q20UxI0vLgdrunhpJnt/EraBdpWZTt/x7ob0Il/k91Dpg1+vgZLOC6OVD1vdF+v82MvTPZeoXdGOPpW/dxnblKzWqPWylmqWm3oVPlglYA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS4PR10MB6064.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:583::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 11:20:56 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8699.019; Tue, 6 May 2025
 11:20:56 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "jasper@fancydomain.eu" <jasper@fancydomain.eu>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] sdbus-c++: Upgrade to 2.1.0 release
Thread-Topic: [oe] [meta-oe][PATCH] sdbus-c++: Upgrade to 2.1.0 release
Thread-Index: Adu5yILqKIvrVlGiQf2TAGRvkxgivQAF/OeAAARF2EABIXbIgAAATEQw
Date: Tue, 6 May 2025 11:20:56 +0000
Message-ID: 
 <AS1PR10MB5697B1BA9ADE22A6CA5EA880FD89A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <AS1PR10MB569738A15FBFD3B281F3C14DFD832@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <7063.1746529801979084877@lists.openembedded.org>
In-Reply-To: <7063.1746529801979084877@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=c97b6b37-3659-4276-8050-b345c2e92236;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-05-06T11:18:32Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS4PR10MB6064:EE_
x-ms-office365-filtering-correlation-id: 439e78cc-415f-46f7-cd0c-08dd8c901251
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MlJ5dXNPMFFieDBGRlMzWjJNZGUrQjAxYXJBVjN2cDFjMHk1OW8wZlppUy9R?=
 =?utf-8?B?a2pPVkw4WG4yaWdmbWM4UEgrSERFZzIzR0MxcDZXTlF3WHhUUWU1YVE3ellu?=
 =?utf-8?B?OTdMSDhjbm5qMjYxS09ZTXkwaWsxeW5KSnNWWnpDS3NFb3NPelg1NXlYMWdz?=
 =?utf-8?B?NnJaRnU5anNTU3VsaVIyNGsyYXZ1emc3OEp6aUdsNXdMTzFRVEg5Zmo4VEtC?=
 =?utf-8?B?b1NabVIrZ0RrSFpFVk5OQTcyUTlibnZYOUY1UkIrdVBBZElXQzlTZm5rQjdS?=
 =?utf-8?B?S2l3WlRDRm5wL3NGM0F3bzU5dWl1V0pwVXdaVzBwT2paVEozbnFhRzZpazVY?=
 =?utf-8?B?VmtUbXBON0RwcjB6MHY4UkhrcURYS0E2WnFMbEFFc05hOU9jSEtZcHBwWHJo?=
 =?utf-8?B?bkNCcURnakhFOUV2RklaR1pWQlI0NUNBWkRWZ2xHbjlMV1BKZUNuOFpMclpL?=
 =?utf-8?B?UnJ1amhuNlo1eURrMVdKTGRtUlo4VTZqUzNoQ2RlZHI0SFQyWXJuWnIwVTVB?=
 =?utf-8?B?amhIektoaWlNR21KWkRVMEZuOEdjbVBQS3p6Nk8vTmNUZ3pjZWxyVmdzdVBV?=
 =?utf-8?B?WTRWcjlWeURvendSd25OYmgvSmlNanlRcjdQRnFET2NkY0lpb1c2K0NsVzIv?=
 =?utf-8?B?dHlMVzNGcXZJSkw2bVhxUHg3VDNJN29nc1RwbU54cnBhZTJxUUN1bDBxemY3?=
 =?utf-8?B?aDdVa2xtdXF1b0w3T0lNckxZMGhoYzJSZStvNzdxSWtDc3puMlZqNXNFNkJs?=
 =?utf-8?B?Y3J1UUduKzVuWnZLbUJ0N2NNRlE5anFQeE9RZ013RnBHMHZwbXd4S0Z6V1Y4?=
 =?utf-8?B?RHRWdzNNeXJzNmd1NU9rWXhMaFk3TWFWZmhhUTZBblBnNmVtUGQzTWlBWU1t?=
 =?utf-8?B?L2tsOVlha3RjNXJSMW91eUxRcE9OOEFCa2Y4VDBSalNTanJZUHpoVEdMcVIr?=
 =?utf-8?B?bVZUNTZGaUJDSFV4WnYwTS9LT3N3M0FxM1BQaGQyNTVxbmFHZ0hYNXY5ajcw?=
 =?utf-8?B?VkZJZ0ZEZk9zZnAvRDdrTHd3YlBkb3ZNRUhCOGo4dlUrWkF6c2tWN3h4SXBw?=
 =?utf-8?B?ZVJwWkxpUU81OUM2bkhpaVAzbm92V0k3amRFV0RMTXJBdHpwRzVLL0RLWG96?=
 =?utf-8?B?Sjk5dkNxdE9la25JUmlTS2xxNUdOWmdpMG10Wmg1SlprZXErSTZKQ055OTZy?=
 =?utf-8?B?aUtXanRESmVVQ2orUHArMVM0cDdYZTFKRDhBUGlKRDBRT0tLOHo0ck9vSWxw?=
 =?utf-8?B?a2h2VStBeTBkMGcwQ0s3M2pGTE1JZTdpaU9nUngwMFQ0UjBHNExDenY5STdN?=
 =?utf-8?B?WFExZHUyL2pmekhkc0szVEFKYWU2T3BKalBCTXZoN3B1YlVjOWlmYnpDZzY5?=
 =?utf-8?B?b0VyWThZeElUTk80Vk1weUlMTVRJR0JsUTFBd09HMGxFcms2RnJqSmxseHVv?=
 =?utf-8?B?S2h3Wnk4RVJCcG83bmtMaWo0MmxRc0x2TFhoYTR0VjJvMDFjcGdJWlYvay8v?=
 =?utf-8?B?MFJkeWtIUVRxeVRqbnM4a1k3RWQybzFjL2J6Qit4aTVLeFFxRWpjMHJnN09U?=
 =?utf-8?B?RGRGR1FURkcyRm1rMFF1MWdBdjNOUXRpMHl1TWdtVUMzbEEyNmlQWDVCREh5?=
 =?utf-8?B?cGlRZGNnbkZpWDdtelFiaDBkUXFaeTBIQlVHTytPbStOcm5zU0RIWGUxT0VU?=
 =?utf-8?B?aDNjajh6U0tYdjRaMGNZTzlaT3Bjc0Y0VTBaUXVNeDE1UXVjNjVZS29VbHBT?=
 =?utf-8?B?ZnorSTVhdTdRa2doZ1pGQ2haTVZ5UllJZFdJMEpyRDZUVlUwd0l3OHoyRFd1?=
 =?utf-8?B?VFdSUEdBd21VYzkyVmZLRFBBeUlOa21MUzFWN0YxZDNqUjJmc3VUNVNhaSto?=
 =?utf-8?B?eHZybEZxbzBMWmdyQm1VQzVMVnE2T3J4ZDFSblZRVVMzWnRuMWYyelZiUTJu?=
 =?utf-8?Q?dWKXcphzaE8=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YjhiTzd3TC9NTVBuK1l1RGhWUGFvWk9tL1p6Tmt0YXNEb1R6S0RUcFhqWWpm?=
 =?utf-8?B?UVRjeUplWXRuNUpWeFM1R05JSE41dXZFbnJwMUVkK3NrNWtuc2V2b3hDeENI?=
 =?utf-8?B?MHZHNUhmdHFGS3JseXB3RU8vOUhvRW8vc1M5c3lxbWp5ZVQ0Z3JuVjJraXAy?=
 =?utf-8?B?eUs4dUJiREpwSjRRVnJGK2phODJUQndsc0JidUZLd3ZjWEhldjJ4Z2F6SzUw?=
 =?utf-8?B?WUNkUW5qNEU2b0FBZnd6Nkk3Y2hoUFJuV3RiVkNnKyt3Q3pYeWtZcWtmQTFP?=
 =?utf-8?B?dGN0djJNODkvTElyNTVsRGYwWWJUZ204cnpnbVdzcTRRRFBycWx2ZXdxOWxD?=
 =?utf-8?B?aVJ0MjVib3VMeXZWQmdRQjQrUnJVZGVkTTNNL2pENnB3UVFTY0tSNlUxVERV?=
 =?utf-8?B?ZzZGSXp6S29mUXJSY1JScWRneHppWjh5VjBWNWs3V3pmYmxadWs5TytiZWdB?=
 =?utf-8?B?UHlsM3JVNG1UbHpGb0o5KzB5dkZFTUtlWHZMbVVTTDEwamMrM0d1L3dxeDE3?=
 =?utf-8?B?dmJKN3ZobUhpWkFSMjBLNjdpWm9xcXpWTVFHS0NVUVZaRXQ1TitYNmpQTGlv?=
 =?utf-8?B?ZElGT3U5V3hpSnM1UXlKZ3I2c09xWWRmN2tvZ1RMOWt3WjFwVUNwOFpIOXdY?=
 =?utf-8?B?Mmp4cUU0NFBwcFVFdkt5SUNvbklwTThzZFE5T1ZLTGhqVWd5MzJ3MU1CL0pF?=
 =?utf-8?B?RmluR2Juc0lCK3VhTWo2WmtzRWdlWlJaSmZLS2ZBNlJzMmduS2xJeHBnYnp0?=
 =?utf-8?B?Z1FUMGpmTi81Y056dGRiUm5CVVVkYkUrVlc0bDRuQzBVdlArM2NJRW1vQ3VV?=
 =?utf-8?B?M0dRc09kWDl3RDZCMXpUZDN5YzNkRzdGR2k1YmlzSXlQNllSZktZSDRSYjJM?=
 =?utf-8?B?OHV3YWJqdjgrY3FwS2QzR3l6MTVIV0UzN1VWNGF1MEhsOWR1RTV4QnRtY2xJ?=
 =?utf-8?B?ZUdIN3ozUlVYeFJhNEl4aWIwblNpUHM3alVKc1ZhSk9STzFTVkR5UXROVVZL?=
 =?utf-8?B?RDVpK09Zd2c2dVVYaTFXWmJjbjQ4SU5iTDNNTWZhZ0tPbGpaOXFjbE02eTNi?=
 =?utf-8?B?V0ZuUlM3MnZTSmVPSUxxNW9seGxNMHo4TE40YjBYUHhyVkl4SDB1c1F4R3M3?=
 =?utf-8?B?Q0VDM1FSZ2x4L1RKOTYzN0p0NkZpdzJKTWhUWFNIYW5YY05MaGdyVEYzWlZG?=
 =?utf-8?B?UUZrSHRGRE9EYkdjVHV0T3dCWWJZZDBCdFZtdWt0VTYrSmtQM2V0WlZGbTBu?=
 =?utf-8?B?MVhVWUhERG9IcTlmVDdGMHF5amsrKzNEMnV1dUdveGI2TUYvd1Ivak1mdUtL?=
 =?utf-8?B?N2RuMHJ0dDUrWGZtcTlkRFBRRGM2cGtETUFCdXMrUEhrSXNRbHFxdlh6K2lj?=
 =?utf-8?B?R3E0bzVHNDNkTnpPQ29Eek1KaGJBL0MwNFp1V1FaZGZ0LzU1RFlaTjAxNnJ3?=
 =?utf-8?B?RXJoaHRCajR6VHRmanM0QlZSQklZejF3NVRhblV1ZXZvZFRCR0QwTDdpN3Q1?=
 =?utf-8?B?TGdmQUxtM1kvTS9nU1hFeEw2bUoxYXhKbTIzdDlrNSs3QThoNFlEbGxHNEJx?=
 =?utf-8?B?K0ZrTldkQWplQ1pQaHl4b3I1Y2QxY1FyNmFSUG9maTh4d2JuRHFEQmo4V0to?=
 =?utf-8?B?SlVteHF4aWZaTDRxQTlMRWhpTHVPOW5RcmtUSHU5NHl0VUVRMm9UYmlPenJS?=
 =?utf-8?B?WFJqR25iZm5WeVY5bG5jUUZCM0tFU2dBWTlac1g2VkFBcW9MYk5abzVpRjFS?=
 =?utf-8?B?QjRjaEpTN1BCL2NBTWhYRmxsTnhHTTV5eWNQKzlWS1JhWEJaTS95VFQvNGpR?=
 =?utf-8?B?b29QWXNYK0lROTVFTkt6R002VGZ1NW1sYkhFclRCc2I1R3U0OXNYQm1GZlk5?=
 =?utf-8?B?d21CNnN4RWZHUFNwSVkreHFvYUxFSEVTeEwwU0tJSTF6Vkp6Z3BjQkNSOE4w?=
 =?utf-8?B?SEwwVDFvNm5XQzd1Z04xdlVac24wNldrblRUVnRuQ056aytUTG02bHFTZFQ1?=
 =?utf-8?B?cFJTcG1jdFV2REs4YUhqVWduM1djWDdMbnhLSXlrSEhSd05DQ1RXRkJ5WWlH?=
 =?utf-8?B?VjdlS1FibHdvTEFnMHpMRm9tMTM5STh1YjYrcnNKdmgraFJXdUliWG5VYkFO?=
 =?utf-8?Q?ncgOvJu9VpIhcwMl7lksL1m50?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 439e78cc-415f-46f7-cd0c-08dd8c901251
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 11:20:56.6509
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hfRkxqiqVKoQ0xS3NnZGxnk9Z/OcG7gtdiQQRf8ZNcpSdvGwOa5QSxxXwE7k/GDu29bSfQSPbwm+LBHaihIMvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6064
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 May 2025 11:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117347

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5lbWJlZGRlZC1kZXZl
bEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGRldmVsQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBKYXNwZXIgT3JzY2h1bGtvIHZpYQ0KPiBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IFNlbnQ6IFR1ZXNkYXksIE1heSA2LCAyMDI1IDEzOjEwDQo+
IFRvOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0
OiBSZTogW29lXSBbbWV0YS1vZV1bUEFUQ0hdIHNkYnVzLWMrKzogVXBncmFkZSB0byAyLjEuMCBy
ZWxlYXNlDQo+IA0KPiA+IEFuZCBhZGQgdGFnIHRvIFNSQ19VUkkuDQo+IA0KPiBBRkFJSyB0aGlz
IGlzIG5vdCBwb3NzaWJsZSAvIGJhZCBwcmFjdGlzZSwgdW5sZXNzIHRoZXJlIHdlcmUgc29tZSBy
ZWNlbnQgY2hhbmdlcw0KPiB0byBPRSB0aGF0IEkgYW0gdW5hd2FyZSBvZi4gWW91IGNhbiBlaXRo
ZXIgc3BlY2lmeSAicmV2IiBkaXJlY3RseSBpbiB0aGUgU1JDX1VSSSBvcg0KPiBTUkNSRVYsIG5v
dCBib3RoLiBTbyBpZiB5b3Ugc2V0IHJldiB0byBhIGdpdCB0YWcgaW4gU1JDX1VSSSwgeW91IGNh
bm5vdCBzZXQgYSBnaXQNCj4gY29tbWl0IGhhc2ggd2l0aGluIFNSQ1JFViwgdGh1cyB5b3UgbG9z
ZSByZXByb2R1Y2liaWxpdHkgc2luY2UgeW91IGFyZSBub3cgb25seQ0KPiByZWZlcmVuY2luZyBh
IGZsb2F0aW5nIHJldi4gU2VlIGFsc286DQo+IGh0dHBzOi8vc3RhY2tvdmVyZmxvdy5jb20vcXVl
c3Rpb25zLzc4MTI3MzA5L2hvdy10by1zZXQtc3JjcmV2LWZvci1naXQtdGFnLWluLQ0KPiB5b2N0
by83ODEyNzM1NCM3ODEyNzM1NC4NCj4gDQo+IFNvIHNldHRpbmcgdGhlIGdpdCBjb21taXQgaGFz
aCBpbiBTUkNfVVJJIGFzIHJldiBvciBkaXJlY3RseSBpbiBTUkNSRVYgaXMgdGhlIHdheQ0KPiB0
byBnby4NCg0KWWVzLCB0aGlzIGZlYXR1cmUgd2FzIGludHJvZHVjZWQgbGVzcyB0aGFuIDIgbW9u
dGhzIGFnby4uLg0KaHR0cHM6Ly9naXQub3BlbmVtYmVkZGVkLm9yZy9iaXRiYWtlL2NvbW1pdC8/
aWQ9ZDU5MWQ3NjMzZmU4ZDczOWVjMDAzOTU5MjBlNDQ5MTBiMGI3N2UyNw0KUXVvdGU6DQpUaGlz
IG1lYW5zIHdlIGNhbiBzdGFydCByZXF1aXJpbmcgcGVvcGxlIHRvIHB1dCB0YWdzIGluIGdpdCBT
UkNfVVJJcw0Kd2hlbiByZXZpc2lvbnMgYXJlIHVzZWQsIG1ha2luZyByZXZpZXcgYSBsaXR0bGUg
ZWFzaWVyIHRoYXQgaXQgaXNuJ3QNCnNvbWUgcmFuZG9tIHJldmlzaW9uLg0K

