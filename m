Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD8CC4167B
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 02:20:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3668.1702509056179271390
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 15:10:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JocOcY/z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0711bab2e0=william.lyu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BDMvJQt018194
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 23:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=iW/Vyc+WFFfM99lPFIxdcc/hQodW+d8gWM/6WUu2lOY=; b=
	JocOcY/z5qZsosEWkBthK4HxVA22IImK9pv+bE+3oJ0Ncdvs5PHuZaZwSfFNG0Pk
	lPYeaOdQnYTUccJYfflzQ32145HBoUbomqplDuM83j1GZsnpvD8hVmOkM5Hakjke
	Wo0KlEIIHciQ3AhHxKOjrHnqrQqi7V2GyxY3A+q6kyHphEYqSNK4d+aWYHsmugbE
	nLCni9m3sxxwaCbwp9K8rPigyAgdbNLLsYEyeRI0y+hL50IE9PirgpL6UBWKveqt
	4HH8Fzt/6bTV+b7bMk3kZi7JTAYNCydpAU4b43hxTsej8/2s7SWs9bTCTF9hkomf
	JTO5BXIvplbW4ZJQWqstEA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uvdexvrk6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 23:10:55 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BDNAsKw001722;
	Wed, 13 Dec 2023 23:10:54 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uvdexvrk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 23:10:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LuzVs+yAi8sATHg+87DPf3pCjNyWmBwdh0Qja8AtEgk5mlmrGpHVYaQ2aGYUbHxYLGBoeRI3ExwIsI+8Fia0vRe6ApJNk0QAxmlDKA0f7dy4KGNvAQWREp52lh5fjGOZ2Gaaxa3asFRvBUkKQeiQXrTwEf5VVzACthimyQaKPxsOCE6zeV0Ij0wa8Ef/Iak2t8LcyI7XYtU6oirNzqMfDwJV5lB58S2uGNz/ZGiUtSW8XaQ4yS+8WHe4CZ6WPg8Qo0yKUafwVBcoX7yaerwA5TuSidl9Z3q8im6U2hyWz3AXFH8SxYIkdk0tIq/ZxArX6nFvjZsC6G8Y86uvLJAe7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iW/Vyc+WFFfM99lPFIxdcc/hQodW+d8gWM/6WUu2lOY=;
 b=UF1sFnC6S0MSd9XxhI58Q2Em3RCzkVrd4tzn5CAPCTdoR8oUz33zz1HPbTmDMU59XnQ/uYXY+tc1+3m93SqURc413kLQ94SGd6kKfkT3PY6pBuNRQt2xHypcxCGSDZXc3QCdFguLngZvpE9t3ZISxK4bJUkrYRNfLi5TSlfG5Zf0DbWPDiFb8YUNQYrJMjJTwRnpM5BwMcUaivAJ1nwabB9rphUN56ZsrgDXOrG3MF3C1rVHpH7Lop0s+neU6w2gV72W6TyJbL6Out4sU/xfc5Sqf9PJXBarcCfrK8Lt0cvtufFSc0psLsrg3eA0uFSb0cHiRDzEVRAvYYGOeUCIgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY5PR11MB6342.namprd11.prod.outlook.com (2603:10b6:930:3d::20)
 by SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Wed, 13 Dec
 2023 23:10:50 +0000
Received: from CY5PR11MB6342.namprd11.prod.outlook.com
 ([fe80::dcd6:34af:90b7:15df]) by CY5PR11MB6342.namprd11.prod.outlook.com
 ([fe80::dcd6:34af:90b7:15df%3]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 23:10:50 +0000
From: william.lyu@windriver.com
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-networking][PATCH] networkmanager: Improved SUMMARY and added DESCRIPTION
Thread-Topic: [oe] [meta-networking][PATCH] networkmanager: Improved SUMMARY
 and added DESCRIPTION
Thread-Index: AQHaLG33sFStczJGFUG1iZnYrV7B57CmDkYAgAHLzZA=
Date: Wed, 13 Dec 2023 23:10:50 +0000
Message-ID: 
 <CY5PR11MB634244757C0FC85753D3BE4DEE8DA@CY5PR11MB6342.namprd11.prod.outlook.com>
References: <20231211200926.1365050-1-William.Lyu@windriver.com>
 <CAMKF1so2bn7KT+-B1uKquph2BkX5=3YNq_x80rnF-+qsxdrAhw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1so2bn7KT+-B1uKquph2BkX5=3YNq_x80rnF-+qsxdrAhw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6342:EE_|SN7PR11MB8283:EE_
x-ms-office365-filtering-correlation-id: 636a05a4-9219-434b-ae62-08dbfc30bf44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UTUPqmdgSQT5r5BvVFXyGVWM8RywtpAaALHMe2cW4TaIj/8WTJMW+InRfBWq/PZEO0vIphecFcJWSoFv3/hhXo/wVYhhXus2BziGGHHjyr4uIVV9OpCuM2l8l3QV/kqSBczzMph2Mz2Te8kIDmcSamumFoKSAwnWF8DdkILYHKiQO21QbnivMIgeLExMCR0lsgk8gWsUy9YraO9b7IBNWjdQ6RfZgPhWnYPyDXN0FTGBj6IN8UJDzD4mDi1KVuLoNXaXCZ/EWtw5i7j27DtwvbXzCZM2lVkR5F3DHxryo4nEt8KpFB47sd2eZ9lZdjk0k4OBCssx0rb/bd6ruisSLFon6oSD2wbJUhTXKgz7ErU2uJqSyb0pUExvni8oEVsHl7yGHh2r2EYWTVIJxaCPNNmvHomE8s9nvbKJseH+8cnAaFWy8T3r58bWwjylKBasik6L6xYyPyazrhVkDzSQ9XoGCgQYy1H12I5T9W7X/aAesW5FICt2VF/P5dgn9ueSzau/Yjr3y3Bqe/X9/mCZ1GQAvDQuf6fiz8eVtsQOROYujYLlJqHtUsAZ40cYrnVHAYiqdMiQIuWfe98djwnCTh4sJj+ounXikivyElYGIrHpPlk8FqDLOFOKCcNGMTAwt4M8+uKl2qk1RIjVJVJNyXKoPExYEvmEDa51xbE4W55sNAddFeB/jzuDJE3ak1Bj
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6342.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(376002)(366004)(136003)(230922051799003)(230273577357003)(230173577357003)(64100799003)(451199024)(186009)(1800799012)(66446008)(64756008)(66946007)(66556008)(66899024)(66476007)(9686003)(53546011)(7696005)(6506007)(71200400001)(26005)(38070700009)(38100700002)(122000001)(86362001)(83380400001)(33656002)(966005)(41300700001)(478600001)(52536014)(8676002)(8936002)(76116006)(2906002)(4326008)(55016003)(5660300002)(6916009)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U3FUNzBmdmFZT2Z0cmNjSmlOd3lIa0hIL3hVbVpBWldJMzZVd3ZhRTFzY1ZN?=
 =?utf-8?B?VFN3MCtmKzJxTU8yOEU5eWhWSmNRUXJiek1mb0VIbFJpaEw5NUFCRGpaaVQ5?=
 =?utf-8?B?Nnc1bG9rZ2F0b3VaODJHemVoeWVtdG1lNGlZZmszWm4wWm9RN0ZVMFE2blJy?=
 =?utf-8?B?OWtLODBqQUYweGZTbU54SkFQQXlnR0w3bm9mR1pONmlUc3BlcjRFd3NLajdi?=
 =?utf-8?B?MWtxOXMzbjhML0pYczMwOEw2Y01hZWtaa3UvaUJaSFlXelU2YkVHcDJRcGgv?=
 =?utf-8?B?dlM4QVd0ekFwb0YyWUhham15QnBRUEJoN0VueEpIdDVRR01DemhlQzVNRVFj?=
 =?utf-8?B?UkZ1TExHUkpuclFYc1BjaGVDcGdJa0VPNkFvZDJUeGtETXhWbTJCU2E1cVA3?=
 =?utf-8?B?aWxFZlY2TVRUcGNORGlDK25sNEw3cDRWOVUrQlZGandsZ09yQkZwVGtLVTh3?=
 =?utf-8?B?cUV6TTBMdlFreHYrT0kzTGhNT20vQjZYR3c2TmY4Y1dIVUZOK3JrVlRQcHlj?=
 =?utf-8?B?T0NFK2xXNi9JUnlLa05FRnJaUWxWOEtSM3ZlOFJsYVRuckNFc0FxR2c3Qkxx?=
 =?utf-8?B?NWJ5NVRMQ3JpL2tSYzFlRkhONGtQZDYzNHVmbGJnWWQ2Q3RjRUZ3ZkFZUG05?=
 =?utf-8?B?KzJPcE5PSTZBUTVXWmtYOWpqU1JmckwyWFM0cEdHb1JWSmtHRFNYM1ZiU2R0?=
 =?utf-8?B?NUhhYmVPSlpCUFFreWkwTVRWOEhPbDFRVjk3UTB3MnByRVA4R2N5RzFMeW1L?=
 =?utf-8?B?ZExaMitIQzFEcHJFdjF5dTNDZlRBYmh2U1M1cmlUUkNUTkh3LytpVGxvOHVa?=
 =?utf-8?B?ekdYT3d3TVN1TTBtZTNmcGU0NWpYTlR2UDVyazRJcEIrb2oxaXNuUlM4ZHlo?=
 =?utf-8?B?eElGY3ZjczJHcHF1cklkZUp4ODZsS2lWWG5qOUFDUzhYVVZPL2svQWFkVG8r?=
 =?utf-8?B?VGo3bmY5WG1ZZjlTb2Y3VmNPRExjT1d2OWNXb0RDcWpNK2g4TjJhN2M1VWZR?=
 =?utf-8?B?dktkcmhvOXdJa1dPcmQwb09oNmtiZ2UyRVhCcVk0Q1J0MnllcGtXeEljNkUv?=
 =?utf-8?B?encyMFhXMyt2NnFOK0JxMUVRc0phRHZxb3VUNFpIUGtQYUJzTzBGYzBHd3ht?=
 =?utf-8?B?aHVTbFU3ckRDNzVxb1BSRnJBSWpsenAzbmdYeGpMZ1FYTFBXblQ0VzI1MUdY?=
 =?utf-8?B?VGwxM2EraE5nVjMwalgzSEsrUkQ4aTh2RktyVVNnR0R0aStRdE8zSXZZcCtx?=
 =?utf-8?B?T3VKb2JOYUNhOHlLY0xSSGVYWnZocHVZbll1VHAxdGZZMzBWdENCUEFLRFFq?=
 =?utf-8?B?Nm9HZmRkYXY2Y2xWTTlZVUZpREdKZGpBTjlPb20xKzQwYUFEaTZickM4V1NH?=
 =?utf-8?B?SUlGTE80MU1HTnNiYWNMaHVMYjE0dlEzYWcySEZDRXp6SDJIbzVqZStBTHpm?=
 =?utf-8?B?ZGVTM1kvb2NJcEtaMk10U1hvTk1VSE04NWw4cThrc1dUV1RLemdVSGNybXhL?=
 =?utf-8?B?bmV4dDJjZnJQYTBnOVpLZ1gwVkV4RTJCV29aejQwZDRkNXRwejZzT1BNT2lB?=
 =?utf-8?B?NU5yMWlvUGo0d05IbTltZWwweTlaUjRQOXdHZmpMeE1jV3hRQng4SkJnSENi?=
 =?utf-8?B?M0NqUTREaXdlSWRNRlhPNDlEdXlPSDh4WW54Ull3YVJ5ZTBjMUNkNk02N0xM?=
 =?utf-8?B?N2FaOXVUTit6UURkTGI5SWw4elJLSTROYnowaG5rb2hqMFB2MlB3Tld5d3hK?=
 =?utf-8?B?Q0FPWDRLVDA2eXgyVXgxQ21PS2pEbW1KeHgrMmlDa3plY2lCdzFJNVIwREg2?=
 =?utf-8?B?OTBnWDNNWFYxNzhLOGZLMnJKOVpZMFVGMC9jK25jcWZKaXdRT09VT20wN3c3?=
 =?utf-8?B?MzNxTUtnUlJieC9UaFZGdkJ4Tm8xam9nUmRhN1BGTStWSlltN3lqdEdpaW5r?=
 =?utf-8?B?L3h1Rk5pYlNWOUJTWGE0ajdXR3Z6d0NJaVRTNm9tNTV2TWxVNTdwcEh5ZDhK?=
 =?utf-8?B?ZjU0dFJGdEozNTdNUGx3SUlHa0lqeU9yY1oyazExK0FvdWQwUnJxSXh6bEhW?=
 =?utf-8?B?Q2wwSUpmTEVITmhmN3EybUVvTkdWUXQ5WGZoaHhZM2VSNURCSDVIQ2dEejdo?=
 =?utf-8?Q?K/GNhSx+Fm8TGTtM2xx9QDcRF?=
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6342.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 636a05a4-9219-434b-ae62-08dbfc30bf44
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 23:10:50.0278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fBJJoxyPEJvb8nu0zxSZk+H96Hs1IDs3PRZepqrKfeafCNO9AYJDEvBL64B7+RqM9GU2QKfPZer4Ch12kATiMelZbjDLn1Q+n1ahUyF0MUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8283
X-Proofpoint-ORIG-GUID: px6Pt9ooj2DlgBHmZc7PnoaclzeL7FJ7
X-Proofpoint-GUID: -AkvVub1KdBEtOjz1D6qc_PFp82gSC_a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=743 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130164
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 02:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107407

SGkgS2hlbSwgDQoNCkkgd2lsbCBzZW5kIGEgbmV3IHBhdGNoIHdpdGggbmV3bGluZSBjaGFyYWN0
ZXJzIGFkZGVkLiANCg0KQmVzdCwNCldpbGxpYW0NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KPiBTZW50OiBUdWVz
ZGF5LCBEZWNlbWJlciAxMiwgMjAyMyAyOjQ0IFBNDQo+IFRvOiBMeXUsIFdpbGxpYW0gPFdpbGxp
YW0uTHl1QHdpbmRyaXZlci5jb20+DQo+IENjOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1uZXR3b3JraW5nXVtQQVRD
SF0gbmV0d29ya21hbmFnZXI6IEltcHJvdmVkIFNVTU1BUlkgYW5kIGFkZGVkIERFU0NSSVBUSU9O
DQo+IA0KPiBDQVVUSU9OOiBUaGlzIGVtYWlsIGNvbWVzIGZyb20gYSBub24gV2luZCBSaXZlciBl
bWFpbCBhY2NvdW50IQ0KPiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1
bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNh
ZmUuDQo+IA0KPiBPbiBUdWUsIERlYyAxMiwgMjAyMyBhdCAxMTo0M+KAr0FNIHdpbGxpYW0ubHl1
IHZpYQ0KPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDx3aWxsaWFtLmx5dT13aW5kcml2ZXIu
Y29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPj4NCj4+IEZyb206IFdpbGxpYW0g
THl1IDxXaWxsaWFtLkx5dUB3aW5kcml2ZXIuY29tPg0KPj4NCj4+IFRoZSBTVU1NQVJZIGFuZCBE
RVNDUklQVElPTiBhcmUgdGFrZW4gZnJvbSBBcmNoIExpbnV4IHdpa2kgcGFnZToNCj4+IGh0dHBz
Oi8vd2lraS5hcmNobGludXgub3JnL3RpdGxlL05ldHdvcmtNYW5hZ2VyDQo+Pg0KPj4gU2lnbmVk
LW9mZi1ieTogV2lsbGlhbSBMeXUgPFdpbGxpYW0uTHl1QHdpbmRyaXZlci5jb20+DQo+PiAtLS0N
Cj4+ICAuLi4vbmV0d29ya21hbmFnZXIvbmV0d29ya21hbmFnZXJfMS40NC4wLmJiICAgICAgICAg
ICAgICAgICAgIHwgNCArKystDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBl
cy1jb25uZWN0aXZpdHkvbmV0d29ya21hbmFnZXIvbmV0d29ya21hbmFnZXJfMS40NC4wLmJiIGIv
bWV0YS0NCj4gbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZXR3b3JrbWFuYWdlci9u
ZXR3b3JrbWFuYWdlcl8xLjQ0LjAuYmINCj4+IGluZGV4IGQyMTNlZjY1MC4uMDg1N2Q2M2IxIDEw
MDY0NA0KPj4gLS0tIGEvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5L25ldHdv
cmttYW5hZ2VyL25ldHdvcmttYW5hZ2VyXzEuNDQuMC5iYg0KPj4gKysrIGIvbWV0YS1uZXR3b3Jr
aW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5L25ldHdvcmttYW5hZ2VyL25ldHdvcmttYW5hZ2VyXzEu
NDQuMC5iYg0KPj4gQEAgLTEsNCArMSw2IEBADQo+PiAtU1VNTUFSWSA9ICJOZXR3b3JrTWFuYWdl
ciINCj4+ICtTVU1NQVJZID0gIk5ldHdvcmtNYW5hZ2VyIGlzIGEgcHJvZ3JhbSBmb3IgcHJvdmlk
aW5nIGRldGVjdGlvbiBhbmQgY29uZmlndXJhdGlvbiBmb3Igc3lzdGVtcyB0byBhdXRvbWF0aWNh
bGx5DQo+IGNvbm5lY3QgdG8gbmV0d29ya3MuIg0KPj4gK0RFU0NSSVBUSU9OID0gIk5ldHdvcmtN
YW5hZ2VyIGlzIGEgcHJvZ3JhbSBmb3IgcHJvdmlkaW5nIGRldGVjdGlvbiBhbmQgY29uZmlndXJh
dGlvbiBmb3Igc3lzdGVtcyB0byBhdXRvbWF0aWNhbGx5DQo+IGNvbm5lY3QgdG8gbmV0d29ya3Mu
IE5ldHdvcmtNYW5hZ2VyJ3MgZnVuY3Rpb25hbGl0eSBjYW4gYmUgdXNlZnVsIGZvciBib3RoIHdp
cmVsZXNzIGFuZCB3aXJlZCBuZXR3b3Jrcy4gRm9yIHdpcmVsZXNzDQo+IG5ldHdvcmtzLCBOZXR3
b3JrTWFuYWdlciBwcmVmZXJzIGtub3duIHdpcmVsZXNzIG5ldHdvcmtzIGFuZCBoYXMgdGhlIGFi
aWxpdHkgdG8gc3dpdGNoIHRvIHRoZSBtb3N0IHJlbGlhYmxlIG5ldHdvcmsuDQo+IE5ldHdvcmtN
YW5hZ2VyLWF3YXJlIGFwcGxpY2F0aW9ucyBjYW4gc3dpdGNoIGZyb20gb25saW5lIGFuZCBvZmZs
aW5lIG1vZGUuIE5ldHdvcmtNYW5hZ2VyIGFsc28gcHJlZmVycyB3aXJlZA0KPiBjb25uZWN0aW9u
cyBvdmVyIHdpcmVsZXNzIG9uZXMsIGhhcyBzdXBwb3J0IGZvciBtb2RlbSBjb25uZWN0aW9ucyBh
bmQgY2VydGFpbiB0eXBlcyBvZiBWUE4uIg0KPj4gKw0KPiANCj4gbWF5YmUgYWRkIHNvbWUgbGlu
ZSBicmVha3MgaGVyZQ0KPiANCj4+ICBIT01FUEFHRSA9ICJodHRwczovL3dpa2kuZ25vbWUub3Jn
L1Byb2plY3RzL05ldHdvcmtNYW5hZ2VyIg0KPj4gIFNFQ1RJT04gPSAibmV0L21pc2MiDQo+Pg0K
Pj4gLS0NCj4+IDIuMjUuMQ0KPj4NCj4+DQo+PiANCj4+DQo=

