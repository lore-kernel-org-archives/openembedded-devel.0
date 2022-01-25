Return-Path: <ernst.sjostrand@lists.verisure.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBEDC433EF
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 08:14:13 +0000 (UTC)
Received: from mx08-00271601.pphosted.com (mx08-00271601.pphosted.com
 [91.207.212.217])
 by mx.groups.io with SMTP id smtpd.web08.4473.1643098451166944917
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 00:14:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@verisure.com header.s=pp16032020 header.b=HxjZkF3D;
 spf=none, err=permanent DNS error (domain: lists.verisure.com,
 ip: 91.207.212.217, mailfrom: ernst.sjostrand@lists.verisure.com)
Received: from pps.filterd (m0107397.ppops.net [127.0.0.1])
	by mx08-00271601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20P4LJsA000385;
	Tue, 25 Jan 2022 09:14:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verisure.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pp16032020;
 bh=3tAanWAt6aquU5mJUQZG+yvI5kzezaKxah3ja13wmaE=;
 b=HxjZkF3DcrdSWlvnQy6MSHE0M8jwDCoxcJWiNomTbFnCoTQ0PVxv4HiUuNV42rYxcE4q
 ouBasgSa62nZZ1jytdtiw+BaeAmMxkC/w1PVpxP2tN/HV4a1CZ+TEfGL6ozYHw9Z17tF
 1K55SKv840y2GyGDdBhZFbwjme8trcfH2P7+oJ8FAUF7Hu7lqXPEThMd0c6tk4XhMOUa
 cAlnuwlAw2kFq8SwBAYK9OgEqhWCI+TVkPaSFdNCVomBX1rZ1omCKSEq9txhNSdBibWa
 B58HelP15RgDW5D1gXD2rH1EPGpQMXXdQJDZ/SLn/Mf6aCsXC4vMhbTqEs0BpPGwyrhX Kw==
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50])
	by mx08-00271601.pphosted.com (PPS) with ESMTPS id 3dsr83rdsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jan 2022 09:14:08 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmzglccGbPSiKyjYP635t9AhbNz+VpEpQPpTVMD34P1yzC5NsEQi0FeyoCQKJ6WtH1AJMddFowYNZKtzob7rr5/brRO76rqnC5y5OwHp6PaPZYn3jfNLTd/6lSeOyhLs7nYeBnwRtISG2jifxnAuhuJVEit74zrbb33WXnaJhh1xAWbaMA0paZPGqm/aKri2x35+/jYG28BdIaWS0RC8C1M3qdflT787DvZLrPBbQjEvAosEESd8jL13ULpNFHhcyGrfe8xlfcp0RfXG+ZpuEJgA+8p3DakFFe1dAlYUxmio55BUcTA12q8IH0xnKqwB4UZhx9NylQ+6sGKwAJYu2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tAanWAt6aquU5mJUQZG+yvI5kzezaKxah3ja13wmaE=;
 b=SslFcgPcEIvl3GTtYN2DdiXHjKERFA67ouPDfosAD6aAWFTK/PLeusi/QShRndFPO+CB21/w1axc+4qTt+i02Rokqp5L/fY6xjP6eo86Y4Sv1N/kfL0tVLIQPFNHoGi+ga9sxfzS93N23xfSe90Sqt+e3/qLBnpaOLogNV9HMyzX9U4k2ZyQqCbIIrk/+PbD7pRHSQSrcGcZEkhKknj9dY67jzXYn7mBsdIo9VU3M0lGEQKkz/JrKRaKb0HhlW3yap5fU903Qwa82eZvg5b0WlzfXRElsSLBPnbHJvA/UHQpNlkhfyo8nkL92IJFAtoDG/ojOJhg3v3mYSqx3fOKIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:43b::18)
 by AM7PR10MB3253.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:10c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Tue, 25 Jan
 2022 08:14:05 +0000
Received: from AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::81af:9a10:8ac3:a75e]) by AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::81af:9a10:8ac3:a75e%6]) with mapi id 15.20.4930.015; Tue, 25 Jan 2022
 08:14:05 +0000
From: =?utf-8?B?RXJuc3QgU2rDtnN0cmFuZA==?=
	<ernst.sjostrand@lists.verisure.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "akuster808@gmail.com" <akuster808@gmail.com>
Subject: Re: [meta-oe][dunfell][PATCH] c-ares: Fix forgotten PV bump to 1.16.1
Thread-Topic: [meta-oe][dunfell][PATCH] c-ares: Fix forgotten PV bump to
 1.16.1
Thread-Index: AQHYB4L1QRBLMZVAakGgZxPYikg+gaxzeAOA
Date: Tue, 25 Jan 2022 08:14:05 +0000
Message-ID: 
 <27975ca43acf3dc36a1ef63a7002c60df6bf38b2.camel@lists.verisure.com>
References: 
 <c8e43ea446a08e64fa028a1b74bb6f529a5d3cfe.camel@lists.verisure.com>
	 <CAMKF1spWmhaEmVFcJzzGbONTL0HR4Ghh84pm2ZzkXMaTZBfNcQ@mail.gmail.com>
	 <0173f3da37397b1c9fb379b677310f379fba5fec.camel@lists.verisure.com>
In-Reply-To: 
 <0173f3da37397b1c9fb379b677310f379fba5fec.camel@lists.verisure.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af8319d7-bd22-4901-6089-08d9dfdaa798
x-ms-traffictypediagnostic: AM7PR10MB3253:EE_
x-microsoft-antispam-prvs: 
 <AM7PR10MB32530E09395469E80D175F53CB5F9@AM7PR10MB3253.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 b9iFwXhJI+i9gHhNoSr+KCZfN2/E2kyzbXYQpbcpdDqg5Y3zccBmgLRrfYTdQzwwg21VBDszG3eTcgYJVdV7/OTZKfKIwrhWo4qzE5Y4xUCS8mGzvsEpEssyjA34zCCioo099Jv4tOjEUdp3zn6dvhY8Aql8NaBb2ZyhL13l1K/GSFlsz1rFGx5C+tfYVYR4OR/mOrFn4i/dFeXZ+1ifyYiQOEbizQenRhx/+7ZYEr78jN6s6VPFUc7qIq9YB9Q7x+Y4U9cYvIW1SOH/+dr9Nkp9GQ2jBqLRMlnxI7pswMirAryyrg8xPuUPyiEocybTBwNMipbN+tZirpmiGRnwDlW/9s3hmqQ0FEy5LrrNjzM9kK2c6d0K2XzWnRq8fDgesySstyCLOn+QAw9VUFUgZTm7l/KYpXG1D5v1bRwElI2PSPbFJHYr2xLH3un7uQ/IwaAYeulmUiCWNhCVDuQUJOUN9HNpNTCLjlkfA2VinmTXfaSjLTUpGAJd0hgn1+6i5AZCuJV43uLODnOS4xuUJqeBSFi5RQ6O7fmzFDkcyDZy6ri4fEZD4v6Ae5JSFvJVeg4JTSK21t+XDcLnEuTHkRTvFAHjDmVtMg2WcvGuF44On+M6zi8UD4YcCzC0w/sANCg88+bRhbFfegb1vks+GNSJJK1O8tW/HyOXskua6r3Ag4uciQCO7MAZ0E0Oa0/pxvmEp3OMQ7t9VNc1OsxUVA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(91956017)(76116006)(4326008)(2906002)(66556008)(38100700002)(66476007)(66946007)(64756008)(66446008)(26005)(508600001)(5660300002)(2616005)(6506007)(71200400001)(110136005)(122000001)(86362001)(4744005)(316002)(8936002)(38070700005)(8676002)(6512007)(186003)(6486002)(83380400001)(85202003)(85182001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bWxqSUlQZWNrRjU1dWNrR3RVSVFyQ2h0MHV5WnBXT3NaY3JBMTJJTHh4RXVa?=
 =?utf-8?B?OTVrVVJOdU41M0UrckMzSWNqRFFOSEdyV1BzbDVSTGkvRUdmMnNpTE83TGl2?=
 =?utf-8?B?ZktYVWR3cldrb2NIZCsxMDhWZFd3ek9sNmU1QU52dHg2YjRDeEtrcitETGZi?=
 =?utf-8?B?dGlTM1lhTXArckJQeWZzM1VzcnY2QmU4OTFVaEt3QzZDZnFscWl1cEJBMWRt?=
 =?utf-8?B?YUZDdGtEVnYrWi9LZENOWkZQcWM0cDU2MzlRYkU0NGZCekhpS0FSb1R3cXNM?=
 =?utf-8?B?TWZxN1RxTndmM0doSVRaa2hNMHFySllkRE5zSnBWZDFVY1dTcE1RMnZSTUdQ?=
 =?utf-8?B?dE1MMVlPZXduajI0bi9IUnZ4TGVCcHBtYTNPY2lRWkczbkZUK2xUV0RrT05J?=
 =?utf-8?B?Rm9lK1lpdk90b01ldjBYTFRyQkdkNHhkSy9oYnhpWmtySWR1MXc3R1VRampG?=
 =?utf-8?B?UXl0dEpLbzEvZ0FoRlRWYm1LZjNJVENGR0R4c2sraW9RaEI1R1BwSWFyZ2F1?=
 =?utf-8?B?WnlvTjdJbThUMktkZXJYb0QyR0tJZHBDN0NVMFlhcVM1Zks2M3NmUEdiU1dB?=
 =?utf-8?B?L0tHQWc5N1RGeDNuSXlpOGtrbmhrTEhzOEE0ejFMbXk4bDRjUFpQWm1Fa0xt?=
 =?utf-8?B?cTRsYzlNRHErVEZxMjZINE1Vb1d1TWZvQjV2cHlpdklhTk9zaFFLRDhLMHRL?=
 =?utf-8?B?aFNnNnNhNWxuTUhNWG4zQVJGdGFZc281bHVBeFZOanI3VlBxeUllMkQ3WHdF?=
 =?utf-8?B?cEpVQmx2dWRRazBlVU1DZVpCMk51a2kvS29MTjhXb3Y5MHhoNTNHT1NOTHl1?=
 =?utf-8?B?N1l5QlVYUU1HMDNGTms1L2x2MG5IaFZCN2NKZGZoTkdQSTFBY1k4NXF5eU9Y?=
 =?utf-8?B?NG5jc2RSNkhyaTd0bmY3czVqbVByM0Vaekd5WmpDUHlkaUhqQ1F1R2c5WmFw?=
 =?utf-8?B?YU14d1hudW5xZkRoam9hVk8xN3RmaWZCejBVaUYzR0I4QTBCcWFuR1FNa2tK?=
 =?utf-8?B?L3hXdE10cCs4NjlmMHhoY3ZHTFFheVhncU05TUQxaGkySjRGc1dlQ0JKVzZv?=
 =?utf-8?B?bW91WWZiSE9MUTcwNmg0TTllTUFCVlVLUko0d05HSURwdjNhNmlSNjZHVzEv?=
 =?utf-8?B?djhxeWVUMDE2OVlYOUhzZmU0UDMrNUdnNWJIMDN1Z2h4em81aXpYalNhL2FR?=
 =?utf-8?B?cnBNUWpDV2Y4a08vK2hQb2o1UG1jSFR4VDdiZFkwcWpwOGF2VDVxYVVneHFv?=
 =?utf-8?B?dHJ2b1pJc2ZZKzU3bG9FSkZUODFGcmJiNzExMGo0eSttUzVqalY1eWhweWpV?=
 =?utf-8?B?UFlsNFl0ZCs1U2JXV0lHYTFhRm9WanhqN25YcEtjSjNnc3ArOUllSzlUWWNw?=
 =?utf-8?B?Uk8vUmxIMm5Pb1lKc3lIYmZITllQcVhRdEZwVDM2eXJ4UXc0UWdLMTRicXdq?=
 =?utf-8?B?UlZ2ZVdDdnFJaktwZHVPelZSU3ZwOStoVnU4WGNaVDBCTFF4ak83OTA0TGNt?=
 =?utf-8?B?VDZIdDVzZWxRZ1FoZ1c0b1gwWGJaeU51WTRxZVV2L2dYRGhBalh0TnVBbkcx?=
 =?utf-8?B?RUMvTk5oa2xEelZaNzYwRVVoUis5dzdCeXpXZUU5ZnRsKzVKUGtQTnpFU3E0?=
 =?utf-8?B?SG1GWVBvNElUODlBNmZ0MHorWlhqSnozbk5qOTlEZHlwc0tlZy80c0x4WTVH?=
 =?utf-8?B?TWswWmIzVzF6MkdiWnJ3eHdid09DbVRZYnZucnYrdGJzOTN2aU5WTXp1WmZG?=
 =?utf-8?B?SUljYWlEcG1uUnhZSlZlVm5YNlJQclk2SHRSS1hZQTJBdUdWa3YvVm9nZGt5?=
 =?utf-8?B?Qlh2ZURhT0x4VlI4UTVIcjVrNzNiSHEyOUMvZEQ2bDdDOFc5dm9NczF5c1hF?=
 =?utf-8?B?YU5tSUFUSkNxdHhkWHdobmkrdXgzWjRhYUg0SU0vUGdsT3R3VDZubFQ0SmlW?=
 =?utf-8?B?Vzg2MkJkejdvOHRzMzFsL3dIRXQ1NmFwMGZVaEtkMzZPYUV0VGJhbHRSbTZl?=
 =?utf-8?B?REtzRlIwUjZiQmk0OWc3UVhWWUVCVTBXOUpPbTJCSG5kZDBib0g4eVlSbVVU?=
 =?utf-8?B?ZjhxcjVZQmVtbTdvZ1N6K1ptbytlM29QT3pyTlRKUWU0OWJqL2dKNzREQ1Zj?=
 =?utf-8?B?YkNhdG9ucHdxOVdabUxXMkpvSmVZR3RMVnQzYkRFV1dTVGJGb1cyVlFSNjIz?=
 =?utf-8?B?cmdOVnJBZVhCNi9BNGR5THh0Y1oybnBGV3Q2SHY2RHk0Nk4yRVZ6MzhtWFdS?=
 =?utf-8?Q?HbHLrqp58ygPh8Vbtwsys6b5zOKGoppXPtM7DBQ4VY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A46698499163464298F3DBD0C319F8F4@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: lists.verisure.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 af8319d7-bd22-4901-6089-08d9dfdaa798
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2022 08:14:05.6307
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3055fa7f-a944-4927-801e-a62b63119e43
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 hS2LkR1CLw5wA32gSqReqwgGAsmzsXboUalaFVHzTjOnVuH2CAwt8UnSTXW87yht3jieTvtfsuZv46WoBLpWPKOmz2qZQmey6HU3crp/iYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3253
X-Proofpoint-GUID: OyXCGc-HZX9tFmCc5XzFgLZ3D53e4xr8
X-Proofpoint-ORIG-GUID: OyXCGc-HZX9tFmCc5XzFgLZ3D53e4xr8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-25_02,2022-01-24_02,2021-12-02_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 08:14:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95054

SGkgQXJtaW4sDQoNCmRpZCB5b3Ugc2VlIHRoaXMgdXBkYXRlZCBwYXRjaD8NCkl0IGp1c3QgYWxp
Z25zIHRoZSBQViB3aXRoIHRoZSBhY3R1YWwgdmVyc2lvbiwgYW5kIGl0IHNpbGVuY2VzIGN2ZS1j
aGVjayBhbHNvLg0KDQpSZWdhcmRzDQovL0VybnN0DQoNCk9uIFdlZCwgMjAyMi0wMS0xMiBhdCAw
ODowNiArMDEwMCwgRXJuc3QgU2rDtnN0cmFuZCB3cm90ZToNCj4gU2luY2UgU1JDUkVWIGlzIHBv
aW50aW5nIHRvIHRoZSByZWxlYXNlIHRhZyB3ZSBjYW4gZHJvcCB0aGUgUFYgcGFydCBhbmQNCj4g
anVzdCB1c2UgaXQgZnJvbSB0aGUgZmlsZW5hbWUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBFcm5z
dCBTasO2c3RyYW5kIDxlcm5zdC5zam9zdHJhbmRAdmVyaXN1cmUuY29tPg0KPiAtLS0NCj4gIG1l
dGEtb2UvcmVjaXBlcy1zdXBwb3J0L2MtYXJlcy9jLWFyZXNfMS4xNi4xLmJiIHwgMiAtLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1v
ZS9yZWNpcGVzLXN1cHBvcnQvYy1hcmVzL2MtYXJlc18xLjE2LjEuYmIgYi9tZXRhLQ0KPiBvZS9y
ZWNpcGVzLXN1cHBvcnQvYy1hcmVzL2MtYXJlc18xLjE2LjEuYmINCj4gaW5kZXggYjc3NjA0Nzk3
Li40NjJlZDVjNDUgMTAwNjQ0DQo+IC0tLSBhL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2MtYXJl
cy9jLWFyZXNfMS4xNi4xLmJiDQo+ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2MtYXJl
cy9jLWFyZXNfMS4xNi4xLmJiDQo+IEBAIC01LDggKzUsNiBAQCBTRUNUSU9OID0gImxpYnMiDQo+
ICBMSUNFTlNFID0gIk1JVCINCj4gIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0Uu
bWQ7bWQ1PWZiOTk3NDU0YzhkNjJhYTZhNDdmMDdhOGNkNDhiMDA2Ig0KPiAgDQo+IC1QViA9ICIx
LjE2LjArZ2l0ciR7U1JDUFZ9Ig0KPiAtDQo+ICBTUkNfVVJJID0gIlwNCj4gICAgICBnaXQ6Ly9n
aXRodWIuY29tL2MtYXJlcy9jLWFyZXMuZ2l0O2JyYW5jaD1tYWluO3Byb3RvY29sPWh0dHBzIFwN
Cj4gICAgICBmaWxlOi8vY21ha2UtaW5zdGFsbC1saWJjYXJlcy5wYy5wYXRjaCBcDQo=

