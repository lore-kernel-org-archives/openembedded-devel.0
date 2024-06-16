Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50ABDC27C53
	for <webhook@archiver.kernel.org>; Sun, 16 Jun 2024 19:18:09 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.77])
 by mx.groups.io with SMTP id smtpd.web11.40258.1718565480268892724
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jun 2024 12:18:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=DYC3LrkC;
 spf=pass (domain: siemens.com, ip: 40.107.21.77, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDqZgwg5rzjsbCtRexH9tIK6G0BAam5Snmn/eeiwkxL1UKVsjnLc0FG6hbtGotaRKcmGcoKouAh+LbLxTJuhmxMyuLm/dohSPWINA/5lPn6zdnFIybByqiPMSkg26V83exvCXrB00stk8xhRT9JS9FdINdMh4skTDecNqVGit/PKZBKQc2BgOS9KCc97GiOqPUiFTBMZDkq6Rr7EXJMp36HyacE/kcRxK8u4xlhvBO7poMkvrxYPhMQpnsLFsRBxdqYfl6dC2IuJu7Bj36VTzzROnnmgJr4pV78UiFaTieJu+zlLOJ6eN2Vs/u28B67zhg8jLC0Lh8eVDXR7kciReA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMl2biMj7HlM44+UfsxTjoNt9kluWsuJd+rpMWuH5Xk=;
 b=jYeIiI4uQTvrpPWWxQaA+mi2IviWoDueWed7FSBfKjQlPP/XnpBQcaIqOMhWk1shJO65jSlEuS6tXKsaayuDHBDp5wqqQf99yQuuV9jPfCG2OFbnhLwjPiho0kQTyELtrFhOxQ6Kxj0CTMAEAFMUaShiMm7GFmQzBsMj83kWqeozNjmEo27gWpABTDbHvkM1VYq+8UUbQysj4w5q7tExkzBVXKsOZIWWh5kcnOoFHatA4tM5ZtyjfdzF8z608cVaUmwhMCXDk/Oo6sbFZdZZInvPndCcHBcPaw9G+OoQ3/a0zcG4wMS+defDYmaM83ovVlLwN1MNsGzeqtYgFTf2Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMl2biMj7HlM44+UfsxTjoNt9kluWsuJd+rpMWuH5Xk=;
 b=DYC3LrkCAXXo/RqYombcDA4IljYXeVmEpAKNA4jKEnHLx4wLW44qyZeMTv0TolIBxWj7i2Ec7JB+nodWpovuBC6fY/qbCl+yhNr1bifB14WZW6LTENFgRBMYwKjeHbGIi/XPHTi49bLydHT44abTeY06/1qgfVYKN1iUdaduNxYH9kkQr53AcuGuc6gIZ/JRadZgxaI/CgSVe/HMmXB+3wY6rJkpUY04H5qMJAlb6j3URIvxw85oBL/8huV8KQecaQ+BImDCVt/IxJJg8CCfOzNgT7Im8oXc/A5r/SW+jS+Lbeie188RQLIlP9js9hxDx2PLBPo5PxcGIdyQOhVGiA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAWPR10MB7368.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Sun, 16 Jun
 2024 19:17:56 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7677.029; Sun, 16 Jun 2024
 19:17:56 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][scarthgap][master][PATCH] re2: remove dev
 dependencies from main package
Thread-Topic: [oe] [meta-oe][scarthgap][master][PATCH] re2: remove dev
 dependencies from main package
Thread-Index: AQHaoTk+GH44EaHSxUm43hPKQLiNzbGTmeWAgAEqnwCAAKCxAIA1m+1A
Date: Sun, 16 Jun 2024 19:17:56 +0000
Message-ID: 
 <AS1PR10MB5697611FEE5C52970602067FFDCC2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240508111609.4157976-1-peter.marko@siemens.com>
 <DB5PR02MB102130DD69A5E5A8236BE2033EFE12@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <AS1PR10MB569796A83B44FB15E1C4DA9FFDE22@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAMKF1sp8AKAxiZSFG+zBkbBF-GivsjzrC3Q+nHitQJrG7OVr5Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sp8AKAxiZSFG+zBkbBF-GivsjzrC3Q+nHitQJrG7OVr5Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=dceb671c-5fb5-4c04-9e01-1e35697eb79a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-06-16T19:17:12Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAWPR10MB7368:EE_
x-ms-office365-filtering-correlation-id: 02304bbe-5689-419c-31cd-08dc8e39071d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230037|366013|376011|4022899006|1800799021|38070700015;
x-microsoft-antispam-message-info: 
 =?utf-8?B?WGhKQ0xkM3Jkek03VVR3bld4d0wrR1F3M2NvYkhZNlRaOTJsTUZlOG5TUFR1?=
 =?utf-8?B?cFFYNFhMc2Yyd0lNcHZUMUFSaXlTUXliSTgwYUNqT3o2QjdkOVFlYXVMY3Zz?=
 =?utf-8?B?cU5NczBzUTMyVWVabnpwa0xhSHBsd0ZBK2pLY08zR2srcGVySXdvZU5FRFoy?=
 =?utf-8?B?Z1JWeTJBazRrSXlTYnpTUnh3Q0hYOGc0bHo3ZG1weFdONFVKY29WeGZ4T3Ax?=
 =?utf-8?B?bU5mZXN0ZlczTVZFaFZZTEd6c3N0SVMzaVdqOWhlb1hQaFZzWEJFZUhFQmlG?=
 =?utf-8?B?ZElveDZyREdaWW8zY01yM2hDU1VKZ0MyamVpUjFtd2tCTko2WDBVWkZnN3N6?=
 =?utf-8?B?TlFhRUxFNmRnTnlHVmhEUzRmSDZiMEx6dnV3RzVFdjJBN1E2VnA4Wkk1Z3pl?=
 =?utf-8?B?SGRHL3dUdU04K1JDZU9JaDVIUlJvUW04MW9IRE1kTUx5dVM0SUh1TVFXanJj?=
 =?utf-8?B?NjFXTEVoaW9pKzVGcmN4YkpDT2w4UHpzOEFad2VDUFZVYTVQNU9PMzlTU0k5?=
 =?utf-8?B?RzZFTU5ESTRTZlN3eGFjL1RBL2gwaytlNzI5Z056RStjVW13S3J6RU9pait1?=
 =?utf-8?B?NmNMZTlDMnNwV2s3TzdlQmpYSFJ2NXFGZ1IyNXpZUzNMYmVaUzFJcUJXbnZp?=
 =?utf-8?B?ZlhYV29XblFJZVFIYnE5dzh2ZitCRkhmQmhVSDlmNEFIQnlhbzFiV3pkQzRv?=
 =?utf-8?B?TjM0ZVVxZUkwR1BqNHE0R3hSQXZpRXl6UDdkaWhFbllua3VaSTg1NmNhVmsv?=
 =?utf-8?B?dnlhamphZ3VEMWRzcko5UlBRSTVBUlJYejdkQndJakxJRkRyYUd6c2w2K0VH?=
 =?utf-8?B?VlVnTTBQU3VmQ0JyYzFBeUlKVWhIWTVZL1JEdzRSblRvMlIrZzBka2VJWnNn?=
 =?utf-8?B?bWxtc0tUaExaZ0FSWlExN0VBSG83RXhOTDlCZzFwRm41S1d5WFlrOU1SYnZE?=
 =?utf-8?B?L1Y2V3ZoVkZ4dGlaWWtwQUl5YWtsdGRlWG50akZpM1lhOWw4UWl4QU1uRGRi?=
 =?utf-8?B?VEhLZHNrSHpGUTkxZjFMUXI1NkxOY0QzK0p0U1Fza3o2NlhRVS84N2lRRHBL?=
 =?utf-8?B?OFpseFhtdi9ka00vU1c3ME1IS2QwZnpJdXBrWnBCUUl5SFRhbGJGbEMrK3U2?=
 =?utf-8?B?WURBWUpaakNSaHJNVktSbmZ2T3g0ZkNsNFZ6WFp4SHBVR2FaOGZVcnpHOWNQ?=
 =?utf-8?B?NmFhWnQ3cjVFbTVyOFd2a1prK2liTVJTU2NnS1ZRNDYwYjBuUkYyOGwrTW94?=
 =?utf-8?B?SlhSc212dEJkU3lnUFJ1Q2tTc1JUOXZ2ZWJNWDdaTldOUXYwWG9vQUhYSVdN?=
 =?utf-8?B?em1FWDhJSlczdHVjSEltVTlUZGZqSnBSYjlqaGlFL2NBUXpwTTFXS2Q1OHZ2?=
 =?utf-8?B?V2RmUW1JSlhsSGhGRHZXRUpHN2xZQWp2WUlzNFJsdVFscXVTK1BSdUJNN2Zm?=
 =?utf-8?B?OVFwQ3Z2UVl1VWtxQTZ3R1hockYvbmp2dVhjWWtNS3UwdE9xcDc1eGVvclFv?=
 =?utf-8?B?Y1pRRG1oNVJBY2lnUjdZU084VG52UUk3OHZqdkVFNlRFeHhYMExEVUFac3U0?=
 =?utf-8?B?cEVXRDR3czZQT1VwVzNYdVpQRDZsZnZzSy9TeHF6Ri9GRmNnRzNhbVdvNHY2?=
 =?utf-8?B?NitnV2RibCtTcC9LbU9WN0JqWHh4cUNpZzBxQUgxVlRBU0lDNUZkYzliQlBu?=
 =?utf-8?B?bVAvZ0RsWWY5WWpFOERrWEJoYnFpemEySnBxcHVYb2xPUHNpamhLcWRKbUVp?=
 =?utf-8?Q?bBNB5xNbv8rGroe52M43YQcDTWOB1ugRrSafB2c?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(4022899006)(1800799021)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZkdoYzdEY2J3OHR0NXlkZ3d3T1dodk5zRWNuLzcxVXRmYktKUU1NMjVOVHZa?=
 =?utf-8?B?eEt3Ykg2dEhKV2Y3MHV1VmFRQlZrWVBCelRFc3pBMFd2NjlSKy96cTdBRVdC?=
 =?utf-8?B?UFpXTHhqTHFHNkFrOHVFajVCMWl2TlV4Sk04V28vOGU3STYyVk5Ec0ROTDA2?=
 =?utf-8?B?TDd3WVNVUHRQK005cnFtWUxtTnZRbittT0pPeEt6QmlzZll1Y2kvc213NU9l?=
 =?utf-8?B?aElRUTIwZWIzYjJZbkE2QldTMTB0c2pkTVltT0xzNzV1ekxyMEJFVlcvcFZF?=
 =?utf-8?B?MER6V0lIdURFMVluNmNHdWJ0OWprVllvNFhTQnp4bEsxZENjVCs3dy84ZWpG?=
 =?utf-8?B?cktNaEJNQUdUOGJPVTJRK0ZVWElqaGs0UlFkN3BUOWVlcGZmVFVZazVTbjho?=
 =?utf-8?B?c0puRUlud21zOEF4cnBKOXRmTC8yWFhtWWxTQ3NVWmNRTDU3TjJ5MC9ETFNt?=
 =?utf-8?B?U1FBT3JacEFFT1BRQlR2OUdqMVdmbml6a25pZXZ2R2VmU21iUHpSTnh1b0wr?=
 =?utf-8?B?Q1htY2FsOHhiVXBhWWhxYXJIRW1SVDFTL3hVeFV0MU5HeEcxOTV2SXE1bjNJ?=
 =?utf-8?B?Vnl5VUUrbCt5R3czWFhvclB1cDlxaVFUb2VSRkNrUHpSVjV3ZEVtTHF4VHR0?=
 =?utf-8?B?bW5jb2JTQVlhWGF3QXN6MjZwUXJQRUJwVEliOWRCTWNaYzJvd0JaMmw0VUZl?=
 =?utf-8?B?ZHpKN0w5WjYySVBCTkZXN0R1Vlp3eEFsaWN1bWw2ejliNmxzeEEvdUVUTGtx?=
 =?utf-8?B?Umcvd1pQOTA2WnA0TDFnK0dNSUdtVWxpdjd3aVdTbDFsek9qMHVtbWJDUElp?=
 =?utf-8?B?RXB6SHptN2VhbmRsaEliU2RMTW9pR1g4Q1hrNlc3NGxrbjJha09rR2xlTld5?=
 =?utf-8?B?N21RRURncVNiY00vWHRBQW9JalFMMlVDMTV6Skhpelk2ZGZnVFROQ05KRUpp?=
 =?utf-8?B?TFNvRklnZXJjK1dKb2plaTVOMlFjZk9YZG45bk9rdnNRN3VEYmtJd1RjblhO?=
 =?utf-8?B?WVovNDE4cFMyZzI3ZWo4ZXgxTS9LSEFrNitUVHRWcjZZNDFiMDhmWnphRHlp?=
 =?utf-8?B?MUR4V29OR21rTktoWjZmeFh4OGRpUFFKUk8wUE1wTlQ0TkhyQ2VSK29WSUpK?=
 =?utf-8?B?TjNvUjZuY0ZCYXBPQmJ4SURWOUp0cHRQb2kzd1N4UFpUeGxJYUpPWS9wVUtP?=
 =?utf-8?B?K042UkNwWlhqKzBCNmR5VGlWTFRqR1JUMXZiMXgrUytEL3VhdFE3b3c5Sjk1?=
 =?utf-8?B?UzQrVFpPZ3B3d2puMTNiY1VJTGxDOExKVHExTGpOQ05vczhUZmJXa3ZYMHZH?=
 =?utf-8?B?b2F1a1RUYXh4bXlPK2pmSTVlZ05Nci96bWFOd1c4b0c3QVoyM0tvSWN3anVz?=
 =?utf-8?B?dklueUo2eTJnTE9MaHNWTlczZmNIWWZVdFg0c3pGWmhINnR4Y2N4Vk1GZkdZ?=
 =?utf-8?B?elNPNXl4YnB0WlNxQ1ZqUWJ6Tng1Y0F4S012NWY2MDRlK2ZVVk9pVDJZd3hF?=
 =?utf-8?B?Q29Ha0FIYTRIT3pDcng5K2lZQUxOdDB0ZmtzbHhnUjk0NkkzRE5OTmQzdDJx?=
 =?utf-8?B?S0FtajlxajZVQzYrZzcwQitGUStPRmtGN3Z0QjlBSzJsNnQ3Y1RteE5tdUMr?=
 =?utf-8?B?Uit0K1R1V2pIZFU0ZElzdkFTL2NIbWtqRHJyNWdnRTNuVDRXLzUvNWhJeVI1?=
 =?utf-8?B?V2g0eksrZE82MXJtNG9KVGpMbTN3MmJLR0RoQTFTNkwxWFpaRVE3QlRLNzBq?=
 =?utf-8?B?djQ5YlpsaDF5NmxhcER0dDNFeVRSZzVIVTBZNUtnL2tOQ0xDc0h0bThhSHM5?=
 =?utf-8?B?ZDZMMzlVTDRUdG5HOGpuNzNpcC8wemtjek93NWVoWUVVKzFwallLRHFGOGxP?=
 =?utf-8?B?UWU3ZXEyNU51dUhkcWJjZXVKRXhnYVBGYnd2aDZXZkl2NmwyQnpEbmp6a2hY?=
 =?utf-8?B?U0ZYWldQUE1OYUtkVTBnYnJTZUZsOVZqWWl4NGVSdnN0Q242YVNVaHF2UHhv?=
 =?utf-8?B?YkhDSGJGS2hrWHN4U3IrN1FzS3I5ZVpkMnJaeCtYK29xdmlIdEpXZENBcUtl?=
 =?utf-8?B?UG5rYmxZVzYzV1J0Sytna1RBenNoLzQwSjBUSk1zSnUwRDdwaXVhNHVjNlhQ?=
 =?utf-8?Q?ZLD/hYVBiWOOhTfDgyqKb48vO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 02304bbe-5689-419c-31cd-08dc8e39071d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2024 19:17:56.3173
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kMCciMS+0oasJGO+K+EJ5Kl4brVrva55+UxTTMukF//M6PgGo5qA5MDQyUF1jw/YvmC5aMlSf55OkXlzHUG8TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7368
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jun 2024 19:18:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110922

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+IA0KU2VudDogTW9uZGF5LCBNYXkgMTMsIDIwMjQgMTg6MzcNClRvOiBNYXJrbywgUGV0
ZXIgKEFEViBEIEVVIFNLIEJGUzEpIDxQZXRlci5NYXJrb0BzaWVtZW5zLmNvbT4NCkNjOiBQZXRl
ciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT47IG9wZW5lbWJlZGRl
ZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1v
ZV1bc2NhcnRoZ2FwXVttYXN0ZXJdW1BBVENIXSByZTI6IHJlbW92ZSBkZXYgZGVwZW5kZW5jaWVz
IGZyb20gbWFpbiBwYWNrYWdlDQoNCj4gT24gTW9uLCBNYXkgMTMsIDIwMjQgYXQgMTI6MDfigK9B
TSBQZXRlciBNYXJrbyB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8cGV0ZXIubWFy
a289c2llbWVucy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiA+
ID4gICMgRG9uJ3QgaW5jbHVkZSBzbyBmaWxlcyBpbiBkZXYgcGFja2FnZSAtRklMRVM6JHtQTn0t
ZGV2ID0NCj4gPiA+ID4gIiR7aW5jbHVkZWRpcn0gJHtsaWJkaXJ9L2NtYWtlIg0KPiA+ID4gPiAr
RklMRVM6JHtQTn0tZGV2ID0gIiR7aW5jbHVkZWRpcn0gJHtsaWJkaXJ9L2NtYWtlICR7bGliZGly
fS9wa2djb25maWciDQo+ID4gPg0KPiA+ID4gVGhpcyB3b3VsZG4ndCBiZSBuZWVkZWQgaWYgRklM
RVM6JHtQTn0gd2Fzbid0IHNldCB1c2luZyBGSUxFUzoke1BOfSA9ICIke2xpYmRpcn0iIGVhcmxp
ZXIuDQo+ID4gPg0KPiA+ID4gQSBiZXR0ZXIgd2F5IHRvIGFjaGlldmUgdGhhdCAqLnNvIGZpbGVz
IGFyZSBwYWNrYWdlZCBpbiB0aGUgYmFzZSBwYWNrYWdlIGlzIHRvIGRvOg0KPiA+ID4NCj4gPiA+
IFNPTElCUyA9ICIuc28qIg0KPiA+ID4gRklMRVNfU09MSUJTREVWID0gIiINCj4gPiA+IElOU0FO
RV9TS0lQOiR7UE59ICs9ICJkZXYtc28iDQo+ID4gPg0KPiA+DQo+ID4gVGhlIHBhdGNoIGlzIGFs
cmVhZHkgbWVyZ2VkLCBzbyBJJ20gbm90IHNlbmRpbmcgYSB2MiBhbnltb3JlDQo+DQo+IFBsZWFz
ZSBhZGRyZXNzIHRoZSBmZWVkYmFjayBpbiBhIG5ldyBwYXRjaCBzaW5jZSBpdCBpcyBhbiBpbXBy
b3ZlbWVudCwNCj4geW91ciBwYXRjaCBmaXhlZCBhbiBpc3N1ZSBhbmQgd2FzIGluIGEgbWVyZ2Ug
cXVldWUNCj4gdGhhdCBoYXMgYmVlbiB0aHJvdWdoIGEgZmV3IENJIGN5Y2xlcyBhbHJlYWR5LCBz
byBJIGRpZCBub3QgcmVtb3ZlIGl0LA0KPiBob3dldmVyLCB0aGF0IGRvZXMgbm90IG1lYW4gdGhh
dCBpdCBjYW4gbm90IGJlIGltcHJvdmVkIHVwb24uDQo+DQoNCmh0dHBzOi8vbGlzdHMub3BlbmVt
YmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC9tZXNzYWdlLzExMDkyMSBzZW50IG91dA0K
DQo+IGJ1dCB0aGFua3MgZm9yIHRoZSBoaW50IGZvciBteSBmdXR1cmUgcGF0Y2hlcy4NCj4gPiBJ
IHdhbnRlZCB0byBkbyB0aGUgbGVhc3QgaW50cnVzaXZlIGNoYW5nZSBhcyBJIGRvbid0IHVuZGVy
c3RhbmQgd2h5IHRoZSBzb2xpYnNkZXYgYXJlIG5lZWRlZCBpbiB0aGUgbWFpbiBwYWNrYWdlLg0K
PiA+IEFuZCBsYXJnZXIgcmV3b3JrcyB1c3VhbGx5IHRyaWdnZXIgdGhvc2Uga2luZCBvZiBkaXNj
dXNzaW9ucyB3aGljaCBJIHdhcyBub3QgcmVhZHkgdG8gYW5zd2VyLg0KPiA+DQo+ID4gUGV0ZXIN
Cj4gPg0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4gTGlua3M6IFlvdSByZWNlaXZl
IGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+ID4gVmlldy9SZXBseSBPbmxpbmUg
KCMxMTAzMzUpOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQt
ZGV2ZWwvbWVzc2FnZS8xMTAzMzUNCj4gPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZy9tdC8xMDU5Nzg3MTYvMTk5NzkxNA0KPiA+IEdyb3VwIE93bmVyOiBv
cGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IFVuc3Vi
c2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2
ZWwvdW5zdWIgW3Jhai5raGVtQGdtYWlsLmNvbV0NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09
LQ0KPiA+DQo=

