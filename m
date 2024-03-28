Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29DEC54E64
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 09:49:07 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.82])
 by mx.groups.io with SMTP id smtpd.web10.11844.1711619342243750586
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Mar 2024 02:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=z27qJGUf;
 spf=pass (domain: siemens.com, ip: 40.107.22.82, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R85pSqEinlfpxjG/PXY0dWbB6ryiGjQd2z1hpUo1ftZDmHXgXJS4ro9mTdXZhSsVlNbAVaOV/gALLBdHG38ahwuV1wwTMXp9lCC2UfjAjlixFnBemkuPHy+wUomDy5yx1OzHx9cgR4Xkx4cxh6O5htXfWTdYF2ns8Dy+Kg6MtAFug62ai+qYo1+7x3q62JAtATqotJS5NqLpO770OrJMY5vEuN6cIg3EBlYK/2zXy0/KeOtyDCzFlsPyvivXUVpI2rxtQvuowTLXv5LRcfk+5NS5ct98q5nFHBmWZZc9vu6PHDO98BRNYRCJIes4lVtzuM0jgyFVQ5Hin2N17p2oqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1b+1k9/Dd4khPKxNT5Ndpp17ux3LXg+IJNsDUhttV3k=;
 b=LDLoNccDlsIoEVnSCIdd5DSlSrFMyFvOeIq2GukAq+jwcpLjTA/UymqUOi0NGIa6jgxN6X2datqcUHAhgCozi+0I0v+0fJu0mTkWMJ6mnfViStUpz3fDIxfrDMXo9D0SFAPx9EvOqyMmGd9/3robCbHmsAXngXbZ/LjXmG6ULDBTHyciFucnhQRtIsDGfvz8dePQIQ8f/oqNTiA9AiTtgyIEOnQYj08DbHdPE5uiz0/ChwwwvURnHQKkpP1TQgeMnvFe2+UycQNEvaPrM87v9ZeMPDZ5ieCTVQKCmDhOm3fQ1otW4jMjuBcQyAdT0Frp9uStm4hMu5cDxa+rNxt+uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1b+1k9/Dd4khPKxNT5Ndpp17ux3LXg+IJNsDUhttV3k=;
 b=z27qJGUfhL19e/PeLx40flx0COlxIrbgUfSSHTzI9+stDCn+ssxh6hKqrnOqf+OvI/+Z3TgZMpDFOoXS+384lpsojC15vcxcqeMbEsWSEFVSBUcdn6fuvydpDjKFfpgDZ5QpGwmK22HrydJxZ/VdHxi4erpDhpVpxUc6CdsRG1akNasbzrJjG04cfbyu4VFHwDLsQwGg45QzV62T3gQRH5DAefi2fRvbpIuIUJC1M+x27K1oaRAWjFnE9X+ZCa80/Bm1XvbrfK+9QeUcJjWn9RaX/l7Ct8cLzK7fojSoQfyFh5VCubbHmdaZc/UJ2/5/s6sp3P8dar9MjuFnj9fhEg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAVPR10MB6814.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2ff::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 09:48:58 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fd78:3502:7564:1891]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fd78:3502:7564:1891%4]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 09:48:58 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH v3] microsoft-gsl: add new recipe including
 ptest
Thread-Topic: [oe] [meta-oe][PATCH v3] microsoft-gsl: add new recipe including
 ptest
Thread-Index: AQHagJuTxL13/BUgbUmnPOl4uodXHLFMkKIAgABXHeA=
Date: Thu, 28 Mar 2024 09:48:58 +0000
Message-ID: 
 <AS1PR10MB56973F70AEF71312F08CA572FD3B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <CAMKF1so8Zc4w9WuD94+H360HJtnYmG_Qt50cPh8BdB+LxdKN3Q@mail.gmail.com>
 <20240327230647.694952-1-peter.marko@siemens.com>
 <CAMKF1sq8PuRhJHV9=k_C5jtn7DZXYFD-ExX3M_2dP0DGCytT2w@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sq8PuRhJHV9=k_C5jtn7DZXYFD-ExX3M_2dP0DGCytT2w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=9737f64f-b8f7-4692-8618-2032f9a24b79;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-03-28T09:44:08Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAVPR10MB6814:EE_
x-ms-office365-filtering-correlation-id: 5db4d8ad-8911-4595-ece9-08dc4f0c4a11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ERwpoKkyDSdDr1tY4fleAqElmGn3oLacxY99CpqjZ1FwY3lw0kNTG1VGSEo+z1mtsX/bT9qDe+9Uu/3RF5tDaidk6dHFeex9q/Lp5MVonb03NKTZ+IN0XuCCgLiEId/p7iBsd4J4c90nTk2woGlhg8Rpt7lXsfO+lx9rEfNh9rXvpDQ/i36wUFl6Ha/A+zgB5q8zoNhRaDwN3tRIw7+0AIyTDbJ4ap1khxIIQvwnOMV3u2PIs1dbeo36v+lhrJYt+9mofjsM6nP6gdzHUwY9fr+vrJFTe8mamJm3cDQh85bfJAQgnR73pheKMLqy/dUKU5JMi2iDNSDIKXVjJOyl/mVbO/VcnxiaeuWcD+Z7DBhZvZ6QscyDTNoJgrxuPGDI9S0YXoAoXusT2BwTnziLZrRPhedXHtEKvpUPUe8gM413bQPNP094TrGwyXt+xwyS/Mok9XxDE/Z2X1S9lJdMstizwwbkppt6e9JnwQRsgTIAhVHAb2lmHO6Eu5an9ENP2275mcqDPA8gMRM3n6PKXEFF57uDLkTCbo2qCNhgrC8YTZz4nJyik3Pg9krB3YW2IhcFmPO7+nUcsjUHrhi0dfkIbJk1v6ep2rK+Q1IKnYvKAPtuYOXYwp4Py7RIdSKj8KvZ7R7FkGVZ8+RHaHoumaXLWvn0pdtgK5h8/VvDrzY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QWUwa2ZHVUFiQWNZNk8vMzZ0UWpyeXd0SlI2T0V0QVlQVmt0Wm1FREZxNE8y?=
 =?utf-8?B?YVY5YWJ4cFFjMFBsQVdkeXh5NlFidUMrc0FTcysrcjFFRnUybkJEL3RVU0Qr?=
 =?utf-8?B?bDZtbElmRHRGRE1XQ2l6ZlVxR2ZZQWRpS20xcGxhSnBBSTBFdDVuOXFSaTNT?=
 =?utf-8?B?SHVOT25KQ0Ftd05hN0UrallJL1ZjZTE4ZEE1VGMwdzdtSDgrVktDNXA2WWdW?=
 =?utf-8?B?TERKQjVhMHhvTXdwNWN4ZjBnN2ppcFcybDk4UkRpR1RGM1ZmcEE3Z1pBS1BN?=
 =?utf-8?B?M0w0NEV0ODY0MEhJK0pLbERFQVh6Z3phRTNkWGtGTkxQZGx3SmI4L1lFMG1k?=
 =?utf-8?B?UlNqZDc2aUR2eXc0U0VvaTdzK1htcTlSZkhscUdmeUltazBvblkwMnFXK01i?=
 =?utf-8?B?RzhtU0NJVHUvVVl5WDlkd29McndndnRuZFd0NzFjM1JjajErZVFJWWtBY25y?=
 =?utf-8?B?Q0JNMkJDRkJDeWhMSFNwMytKUjZNcExDV0o2bzlXbnJCN1QwWFZmeUtBZHZz?=
 =?utf-8?B?YmhJVWljWVJWcER2ZXJNSVEwc2RBWG1nRnpIK20zTGhHb1RUb1NMNGE3WXNx?=
 =?utf-8?B?VXpsa0xiNEJNMDVya1AyWHkxd1ZudTlIRVdtbXdONFp1d1BpcU4veWxVY08r?=
 =?utf-8?B?SERMUFZ3K3N4M24xVzllT2U1SC8vcGhpcmhsNTQ5VTI4Y29IcytMeDUzYk52?=
 =?utf-8?B?MHJraEtwT21iSjhPaVRXS2JoNkVyZWpJY01yVU90Y00yQzRscWdEL0xyWWR0?=
 =?utf-8?B?dTVmZmdQVTF2Q1hSY3Fpb24xbm1BdjV0S1IrYkZCYlFZbmtJWXNvTG1FSnlj?=
 =?utf-8?B?QzR3N1dnc3Y2OEhmZUxORjNIWE1LT3gzck4xb0VYdlgxY1N2bExLL0pmR2pt?=
 =?utf-8?B?bkNiWlVWcHhDLzlZNlhrS2tvYkdJR0xHWlpsTmVGekV0M0NIU3ovQ3h6Sllo?=
 =?utf-8?B?RGp5OUJDWGJ3UFVGVG1ZSG5OMGo4VFhKUE96VEhlTVpwalFKV3RNZlM0cENw?=
 =?utf-8?B?a3RvMlltblRaeXRqd0NuWmgwbHNtR1pzTzlnV3NBa2Y2QW1DMjdUVklTUTdY?=
 =?utf-8?B?d1ZOTTRnT25zTkFCTk84ekVoTWh2V05NRjh1MGowTkRyTmZCYlVkY05Feis5?=
 =?utf-8?B?OWlJWTFjTkRmZ1RSallGZW0zSkRYNVZHdWEzTXhWZ0plY0ZqeVJSeUtBVG9F?=
 =?utf-8?B?elByQ3hHcFhzN1pQQ3laaGYxak92bmZoSFNrSFNqQVZ2VzVzZC9qMTRGWlB0?=
 =?utf-8?B?ejNLTStXVC9TeFZRandYTFpOZUkwb21wRGs5RXNUK3Fja0wvSEdZeFhhRW5l?=
 =?utf-8?B?U3BabjZIbXdQdjZ3MXp3bWFUVUlsVDFrSlMwUDNDMlNPMkRsSWlCZE1pdWxP?=
 =?utf-8?B?UkQvbDNOQ3RXVTFhVG9hbzVmclU3Q3NNVWQ0ejJ2TmZjSE1ocW1Rb1gyQmFy?=
 =?utf-8?B?Z1NuRm9XNFp2bVpyU0Y5eDdFVlVjL3hJcENNZndGWkJZRHBTS0liZk5QUXBk?=
 =?utf-8?B?TVhZcnorTThER3c5QjFjclhPQ3VmVllFRFk4MXd3R1B3RDlPUTRCeWE5RStt?=
 =?utf-8?B?TWpjL3k0RXJTdkU1UGpPTk04eVRWbCsrK3l4ZmFFQWxLNW4xRjlVZ1JUN05i?=
 =?utf-8?B?UkZaNjN4S2dDNEJNS09VYlJ3NG9QTFQ0TUNYdW5NdUd6Zmc3NXJScDZmQzd2?=
 =?utf-8?B?YUNuTld4dzVwM2JZaXd6Z0RsTHIrdnAvajRpOGh5d2NtbTkvUk1zdjhPam5s?=
 =?utf-8?B?WnJMRlhlSE4yWlNVL3Nrd0MrdHplNE13Q0tHWTVWeGp0d0NHWHBGWG5WQXdi?=
 =?utf-8?B?VGFpTis2ZDhDcHByeFYzZ1d0dnFNLzFSaWdZKytwTEtPNEkvVFpBVmJpVXRW?=
 =?utf-8?B?WnJqU09ucGNpOVlCWEFmenVoMEM0cUhVRkhhQ1RuMkdtRmFRN1JoQjNuMTND?=
 =?utf-8?B?K0Y5UnRWaWFvZnhCb25hQmhLMVcwd2FtSmw4QzQ3aWlnZTRtOStoblpPeDBI?=
 =?utf-8?B?bndaVk01WWtHTXJrU3M2TStLQVAvV0J5L01uNTU5cW5nTG1TY1pXeUR5MEl0?=
 =?utf-8?B?QmFSdHYzRjRmcDFyeDY3Z3B3UHZOcUtiajhrUjRWUS9zTWtvNE5VWlllTE5k?=
 =?utf-8?Q?2FwYDFw5+qugDTCyl9cObNASR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db4d8ad-8911-4595-ece9-08dc4f0c4a11
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2024 09:48:58.0341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QxTli/EDQjJKE3NkD7zMpENiQrRL0xEJQ0qcAYHSGX94CDzxQ6JZSddiyMpncQ0GelngDZoZLfkxmI3rb35HtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB6814
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 09:49:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109658

SSBkaWQgbm90IHNlZSB0aGlzIHdoZW4gYnVpbGRpbmcgbG9jYWxseSB3aXRoIHBva3kgZGVmYXVs
dHMgKHVzaW5nIDUuMF9NMyksIGJ1dCBmcm9tIHNjcmVlbnNob3QgSSBzZWUgaXQncyBmYWlsaW5n
IHdpdGggbXVzbC4NCkknbGwgdHJ5IHRvIGNvbWUgdXAgd2l0aCBhIHBhdGNoLCBidXQgSSBoYXZl
IG5ldmVyIHdvcmtlZCB3aXRoIG11c2wgc28gZmFyLi4uDQoNClBldGVyLg0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4gDQpT
ZW50OiBUaHVyc2RheSwgTWFyY2ggMjgsIDIwMjQgNTozMg0KVG86IE1hcmtvLCBQZXRlciAoQURW
IEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtvQHNpZW1lbnMuY29tPg0KQ2M6IG9wZW5lbWJlZGRl
ZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1v
ZV1bUEFUQ0ggdjNdIG1pY3Jvc29mdC1nc2w6IGFkZCBuZXcgcmVjaXBlIGluY2x1ZGluZyBwdGVz
dA0KDQo+IFRoYW5rcyBmb3IgcmV3b3JraW5nIHRoZSBwYXRjaCwgdGhlcmUgaG93ZXZlciBpcyBz
dGlsbCBvbmUgZXJyb3IgcG9wcGluZyB1cCB3aGVuIHB0ZXN0cyBkaXN0cm8gZmVhdHVyZSBpcyBl
bmFibGVkDQo+DQo+IGh0dHBzOi8vc25pcHMuc2gvZi9iZnR2ejRBTk82DQo+DQo+IFRoaXMgcGF0
Y2ggZml4ZXMgaXQsIGJ1dCBJIHdvdWxkIGxpa2UgdG8gc2VlIGlmIHRoaXMgd2FybmluZyBpcyBh
bHJlYWR5IGZpeGVkIG9yIGNhbiBiZSBmaXhlZC4NCj4NCj4gaHR0cHM6Ly9zbmlwcy5zaC9mL3BS
VmFyOGhsaWYNCj4NCj4gT24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgNDowN+KAr1BNIFBldGVyIE1h
cmtvIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxwZXRlci5tYXJrbz1zaWVtZW5zLmNvbUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCi4uLg0K

