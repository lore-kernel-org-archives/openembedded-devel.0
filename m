Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E3EBE9371E
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 22:10:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1818.1696457424494244465
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Oct 2023 15:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=buGV4lgW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=864146c999=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 394AxoSH021064
	for <openembedded-devel@lists.openembedded.org>; Wed, 4 Oct 2023 22:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=Mt9jGlSGg6X49yqPaDy9IJDz8coqhZP0UIkUTQ2eHIQ=; b=
	buGV4lgWL4N1YVnjfgv4YpatAobDuLHulPoC0SfFHPFu0claVimnN5uYStnfCr/W
	cB1BNq/I99SchP6Z53yAF04T0FP02/Fwc9fn3ztVpCEExM59s8H7p+A5sVcpqvCL
	mPnAqZO7dMKwKG23KsVcpkCGR6warXxVKVcCP4JsbbTVOVfGU9gPmQt1Dn5km6af
	C/I1Q8Zn+bOukPWsgbI2KLZdOGh4goTtDGp+WDUmv3fnGOdwODnxjwvx0jHzuN/9
	udCLvczjUrVQ3KpEuECyO9aOCL4qvNDqhOKlbsXzIQFmXHQiSiRAFMhJeOh9gYg7
	O7MfcINSHkiFMsAOpjvqsw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3te8vxmf4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 22:10:23 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 394M6BSU020994
	for <openembedded-devel@lists.openembedded.org>; Wed, 4 Oct 2023 22:10:23 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3te8vxmf4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Oct 2023 22:10:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxE+xQ/Af1/4fa6WR48jTUhaO9X79fN6ju7snT7CQdmYB8IIaJ7tozBkxV+eEDNtfrMZ8MflLIjPPsD2rMcvboem+uE1SAUuaCAYKyBpKM2E7KnbQ0g4YGz4l+4HeauVeQSaRasHLAelxrKZoS+fA+3QIBXon4evHVkhpyG4R0MGImNW1ldllly1CMCiQhfq7ENTME9hbNglJEI9zKf5TQHNvcb1Y6603Qz9oNshzJrr3e/lEOoDaWCYQ8amAmVpa/DC3H429nJVGZTkN/bUM+IJuxXcfMgToEAoVaiTa78bgo/zoSrJoEMr9f9BSzJF/+Kugd+jDztsKFfW3K97zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mt9jGlSGg6X49yqPaDy9IJDz8coqhZP0UIkUTQ2eHIQ=;
 b=Ytq0LmJkK+zqG05/hR5Rh8YXYTdmD2g+C1z/6nxE+BIYxItBCVAIGSwq4gRXwjCWX0OObmLl4Mrlgm61tJp5TrXieUPEMFpv9YDn3ecJOg+YuVv9v6IUvQs/IxYfjCwfjM9jlIo+gyGqoEPZMj239kiZ6hk/SpQB2ujAMKwP5AzxoQLA0h89ZBOXpXFpqVOrLpScqR1oBBglH86fxP2Pis9XLBuyy9AYs4Mf+gqoSAZdnFBe2NvftLVnc/ICLVvDOWkIFaYUFZgei4fkijM8a+qgcDYwLY0WV/PgbxIEm+aG9h8L0IVs5OMya8wVC3+OONJXE1/96bR46CZEKH2R3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by LV8PR11MB8723.namprd11.prod.outlook.com (2603:10b6:408:1f8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Wed, 4 Oct
 2023 22:10:19 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::87ef:89ae:6902:377a]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::87ef:89ae:6902:377a%4]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 22:10:19 +0000
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: RE: [oe] [meta-webserver][PATCH 1/1] nginx: add configure option
Thread-Topic: [oe] [meta-webserver][PATCH 1/1] nginx: add configure option
Thread-Index: AQHZ9t3HRitlYpWA+k22eLQ+DF27JrA52g+AgABU/nA=
Date: Wed, 4 Oct 2023 22:10:19 +0000
Message-ID: 
 <BY5PR11MB399238FDE970085D917982B388CBA@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <20231004161345.322169-1-joe.slater@windriver.com>
 <CAMKF1spFprH3HOwJ=3PdpiSA3-H-U4qDGOG4EsK2ViBTaPEtGg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spFprH3HOwJ=3PdpiSA3-H-U4qDGOG4EsK2ViBTaPEtGg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB3992:EE_|LV8PR11MB8723:EE_
x-ms-office365-filtering-correlation-id: c3030ed1-62a0-492d-f8d6-08dbc526b23f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ATahpAU0JMiajUA47sm90sL/NjKYtfrdRmryspAhblCB6GjGXcWuld2rZflc6pe2LGz0YAl0ZrxbcTeP1k9dcrCsOIcYhbwAmt3sSwyPondxz7voULEEvBWjYHPPc7GHvzAElv+xfj6FMZ8zJwX9QRaI9Tj83r3QeRmftBVWwecwPlhJtwWve4aqeNkrYXFFbdAsvAItuKMPNKxXX7QJdU0O42GFYiQS9QlL8ak6t/KKrLgE7LF5fuQ+phDQhnteTfbIC5fOuQr0UpSJPHYKlnDSFBFGOryFNADwXM76OAgSES9nUoUnfageX4V/tklPgIkES6qbvt2duHw26tK7LDL10CxpOAbL8r10h9dkMZ1MgCM00bmLd2uK1xQya67sSqDJLAFQ5HY09ojKWLdfjzOXicd6WOo/6eEKXPRZ/GNgJv2l+7ZTpThg8t3PWsWEhd4IPnx99qwb9jReH3HI19mOCaIQTrtqurSou/wkA4hCbPVLTej06u2hD09G/zewn3ZIzLnnkh5jz4MRoOMNR4hrxJc4o7P8ibKWYUagdQTTe9v+6NAEZ59NtoPy4tnF0noVtbygl1drMUOHx5dWSbT+mcyLj0PEYClBsR87GGY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(376002)(39850400004)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6506007)(71200400001)(53546011)(966005)(7696005)(478600001)(26005)(9686003)(83380400001)(107886003)(2906002)(6916009)(41300700001)(66446008)(316002)(52536014)(4326008)(76116006)(66556008)(8936002)(66946007)(54906003)(5660300002)(66476007)(8676002)(33656002)(64756008)(38070700005)(86362001)(122000001)(38100700002)(66899024)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MEZoUFJLYXFzUkMxQm5NUEF6N0VENkVDc1V2VERPVG13UzZUaEVJbloweml5?=
 =?utf-8?B?NGxEQ2hMYnlReS9tNXJrQnJ2bVM0dDU2UFpIV3NteEVCeW9YY1h3aFdnSnZT?=
 =?utf-8?B?V3JSZXQ1ZWFCRjFZSmw0Z2tuZXExQmRNeElQMVRpRzlQUDRoUHhKenNhWFpV?=
 =?utf-8?B?YVZXajVySnU4N0Q0RjFXY3FRWFVPWlJ2WGNxZG1uNzJYMngxVW9EYXczajdT?=
 =?utf-8?B?SnpQSkE0V1VsVTcrUkxLVEZoeGNWMStRcTdXbnZFL2g3UUZCYXZ6RVl1NkFR?=
 =?utf-8?B?VlliUUhRR1dUWlp5dTFKQWJpMGNaRU9qNTVHdjZDUy9oQmZKMXZ0M3MwMk91?=
 =?utf-8?B?RW8yZ0RxQ2VNdWFKTkhlaDBreVpFczFXWmJMWk1mN0hYeHBOd0NmTW5qNkZt?=
 =?utf-8?B?WWJiRjBPQ2ZORDlsYUJHMWhNRlY5WTlJQVhzZHJxemRVb0k2MUswTmJjSlc3?=
 =?utf-8?B?VUhjRm55VVI4T3ZSZUVVZWpxalRtQ3BnL2hrUU9jSGJqaUs3S0VRUE0yWlov?=
 =?utf-8?B?bFFLV0F3V3NnZThtWWF0ci9iRVVQTHp3QWsvL0ZJbkFNOGUyQnkvV2RRRFpZ?=
 =?utf-8?B?WUgweXE0dHBQQ2RwZTN4VW9jT0svcVVWUjBkTUljem9ibEhkZHNTRHhQMHlK?=
 =?utf-8?B?Nmpkbi9iZENhSmtTakFkNXNFQTQrZmRUMXFOUWN0OVBiNG5DT1FBbVRKNHpB?=
 =?utf-8?B?dTlxeEdlMEFMUCtJcGJueXBWKzdCRk5SK2JzczNvRFh5SWNEYTlkaGVQcjhs?=
 =?utf-8?B?Z3Rhb0JoeGNtVy9ycUN0SnhOdTJLR2sxZTY3UVBkby9uSy9sV2NjekxRQVU3?=
 =?utf-8?B?SUgyc2duRVNyUEZvdHFOaTA3ckRIdlk1MDhzOVNSaUlYaTJhc1d0NjgrRGJl?=
 =?utf-8?B?VitTUkM3TjVjSVphSVdVdUp4NXRNdEtsYldGRjFrdHk2cE9WRXFrakw2Y2hJ?=
 =?utf-8?B?VHJUOE9uUmpMWGdnaXVWdEJtZzRwb0psRlZPMTZldlpNWkFVNFRXdnd6dld6?=
 =?utf-8?B?ZzhZcisrZStZeW9UOVVEMGtrRUs3bTduakNKTUtxeDVoWHNYRnRWbmVtLzVo?=
 =?utf-8?B?NE1YeFdEYVVuQ3R2WFFzT1pERWg1RXBpalhYWnFIb2dXZFRxRWNlQTdYU2lY?=
 =?utf-8?B?MWVmeW9QTC9tRnovOWZVS3Q4bDlhaFBEWjk4ZmVTN2JKRTNLbVVPbzNHTFJJ?=
 =?utf-8?B?eUVFeEN4SjJFSXFXaWVQSVVYb0dvQ09pUi82c2UzQnRpQ2F3WEV6WUtBbng2?=
 =?utf-8?B?OFBNYnBzSmdxZk93ZEs4OU1aTjl2Wk5ydUozdFNSZHRRZXZlVWFYV1FZc1BH?=
 =?utf-8?B?TGZCRnBqaXE2Ti9mVmwyRjZzU05jcjNrUlJpeW81K29WWWtiRUI3dUYybUZl?=
 =?utf-8?B?VmhmQ0kyR2lUWnhnVG5LL0hLT2x0MTl3Wk9qcFdYTjB1c1RjckpHSDRZdVJR?=
 =?utf-8?B?Z2ZoWVdxaFZSaDlwMTJYdjJXOHMxWGxPOWpWb0Y3UHh1U0tkdms5VTFYNkRY?=
 =?utf-8?B?ZTBnZGdsQlpuUUh5TkMvYUkxTDFub0JzdHUzbCswMEVORXlFREduZmlxOUxM?=
 =?utf-8?B?Nm1YNzR3cDd4MXBDYXEyaE1aYUs5VTVPN25WNVJ2UThrTkhVM0VwM3l6aHZW?=
 =?utf-8?B?MnFST2ZKSGRQbHhWUTJxR1hXUTd0dFNsN1JBV014QVZBalRDY2xlcHdhNTE3?=
 =?utf-8?B?NjhiT1NENHZHcVBkM1pDYlZSQ2gyTGtyemRSc0VPL2p2S2t1eEx0RWdPVUpU?=
 =?utf-8?B?NGluaElSZU5rYTdsMzBna2F0S3lqVWp5OXdvQldmZ0tzb2NWbWQzb3Z0Nnla?=
 =?utf-8?B?RXkwb3BuUEJQTTJQUUVoMXFjeUh5TUFrWlFXOXUwdzNGZEFmLzNvU2FZNDd0?=
 =?utf-8?B?SGhXRWlJNkQvTEZKVGVkczFvQXM2dUZtQnpaTDJKUW1LbWpCekRhVTJMU2dk?=
 =?utf-8?B?VXNqTlp5WmlGZGlSMzZiSUJidThyM0duTkhDU2x1Mmp5a21NR3pmSUhFMitD?=
 =?utf-8?B?MERvUEdvSHNEdVpmY3RlZHcyRGt1TXVySGM1TzNiTjFzRFlaS0ZxdzVCUGU0?=
 =?utf-8?B?OXU0Tk0rcW9BQ1NiSVI3b0tLcXY2U0pkWmVlcGJSWGFDRVd3aDl2a2Y3L3VV?=
 =?utf-8?Q?BYQ4HvAtxJDzCYV2Zq9lrDvG3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3030ed1-62a0-492d-f8d6-08dbc526b23f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 22:10:19.2454
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EmJ3lKYRHiq7cGIVZkGp0MWwxuXZ/PWiYNyvb1pKba9VZ7tossSqesfuX2116TDux0nsc3MQEdHs/dvi+XikaQ1m5CTpfMNyew8E79DTcSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8723
X-Proofpoint-GUID: P3O-NEEddmPBsIdFY-7aPbGq7_igZRgs
X-Proofpoint-ORIG-GUID: _xC27Wri2SRbup1pZOGJTSFgkcmFuEuM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_13,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 mlxlogscore=999 adultscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310040163
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 22:10:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105345

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDQsIDIwMjMgOTo1OCBB
TQ0KPiBUbzogU2xhdGVyLCBKb3NlcGggPGpvZS5zbGF0ZXJAd2luZHJpdmVyLmNvbT4NCj4gQ2M6
IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyBNYWNMZW9kLCBSYW5k
eQ0KPiA8UmFuZHkuTWFjTGVvZEB3aW5kcml2ZXIuY29tPg0KPiBTdWJqZWN0OiBSZTogW29lXSBb
bWV0YS13ZWJzZXJ2ZXJdW1BBVENIIDEvMV0gbmdpbng6IGFkZCBjb25maWd1cmUgb3B0aW9uDQo+
IA0KPiBPbiBXZWQsIE9jdCA0LCAyMDIzIGF0IDk6MTPigK9BTSBKb2UgU2xhdGVyIHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxqb2Uuc2xhdGVyPXdpbmRyaXZlci5jb21AbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBKb2UgU2xhdGVyIDxqb2Uuc2xh
dGVyQHdpbmRyaXZlci5jb20+DQo+ID4NCj4gPiBTdXBwb3J0IC0td2l0aC1odHRwX3hzbHRfbW9k
dWxlIGNvbmZpZ3VyZSBvcHRpb24gdmlhIGEgUEFDS0FHRUNPTkZJRw0KPiA+IG9wdGlvbi4gIFRo
ZSBvcHRpb24gaXMgbm90IGFkZGVkIHRvIHRoZSBkZWZhdWx0cy4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEpvZSBTbGF0ZXIgPGpvZS5zbGF0ZXJAd2luZHJpdmVyLmNvbT4NCj4gPiAtLS0NCj4g
PiAgLi4uL2ZpbGVzLzAwMDEtY29uZmlndXJlLWxpYnhzbHQtY29uZi5wYXRjaCAgIHwgMzkgKysr
KysrKysrKysrKysrKysrKw0KPiA+ICBtZXRhLXdlYnNlcnZlci9yZWNpcGVzLWh0dHBkL25naW54
L25naW54LmluYyAgfCAgMyArKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMo
KykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gbWV0YS13ZWJzZXJ2ZXIvcmVjaXBlcy1o
dHRwZC9uZ2lueC9maWxlcy8wMDAxLWNvbmZpZ3VyZS1saWJ4c2x0LWNvbmYucA0KPiA+IGF0Y2gN
Cj4gPg0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL21ldGEtd2Vic2VydmVyL3JlY2lwZXMtaHR0cGQv
bmdpbngvZmlsZXMvMDAwMS1jb25maWd1cmUtbGlieHNsdC1jb25mDQo+ID4gLnBhdGNoDQo+ID4g
Yi9tZXRhLXdlYnNlcnZlci9yZWNpcGVzLWh0dHBkL25naW54L2ZpbGVzLzAwMDEtY29uZmlndXJl
LWxpYnhzbHQtY29uZg0KPiA+IC5wYXRjaA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4g
aW5kZXggMDAwMDAwMDAwMC4uN2JhMmExZmI4NQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysg
Yi9tZXRhLXdlYnNlcnZlci9yZWNpcGVzLWh0dHBkL25naW54L2ZpbGVzLzAwMDEtY29uZmlndXJl
LWxpYnhzbHQtDQo+ID4gKysrIGNvbmYucGF0Y2gNCj4gPiBAQCAtMCwwICsxLDM5IEBADQo+ID4g
K0Zyb20gMGMzYzY2OTQ2NGE1MTRjZjhkMGNhYzA4MjgyZWNiMmI0ODZmNDQwZiBNb24gU2VwIDE3
IDAwOjAwOjAwDQo+ID4gKzIwMDENCj4gPiArRnJvbTogSm9lIFNsYXRlciA8am9lLnNsYXRlckB3
aW5kcml2ZXIuY29tPg0KPiA+ICtEYXRlOiBUdWUsIDMgT2N0IDIwMjMgMTk6MjE6MTcgKzAwMDAN
Cj4gPiArU3ViamVjdDogW1BBVENIXSBjb25maWd1cmU6IGxpYnhzbHQgY29uZg0KPiA+ICsNCj4g
PiArTW9kaWZ5IHRvIGZpbmQgbGlieHNsdCByZWxhdGVkIGluY2x1ZGUgZmlsZXMgdW5kZXIgc3lz
cm9vdC4NCj4gPiArDQo+ID4gK1Vwc3RyZWFtLVN0YXR1czogUGVuZGluZw0KPiA+ICsNCj4gPiAr
U2lnbmVkLW9mZi1ieTogSm9lIFNsYXRlciA8am9lLnNsYXRlckB3aW5kcml2ZXIuY29tPg0KPiA+
ICstLS0NCj4gPiArIGF1dG8vbGliL2xpYnhzbHQvY29uZiB8IDQgKystLQ0KPiA+ICsgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiArDQo+ID4gK2Rp
ZmYgLS1naXQgYS9hdXRvL2xpYi9saWJ4c2x0L2NvbmYgYi9hdXRvL2xpYi9saWJ4c2x0L2NvbmYg
aW5kZXgNCj4gPiArMzA2M2FjNy4uZWI3Nzg4NiAxMDA2NDQNCj4gPiArLS0tIGEvYXV0by9saWIv
bGlieHNsdC9jb25mDQo+ID4gKysrKyBiL2F1dG8vbGliL2xpYnhzbHQvY29uZg0KPiA+ICtAQCAt
MTIsNyArMTIsNyBAQA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICNpbmNsdWRlIDxsaWJ4
c2x0L3hzbHRJbnRlcm5hbHMuaD4NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAjaW5jbHVk
ZSA8bGlieHNsdC90cmFuc2Zvcm0uaD4NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAjaW5j
bHVkZSA8bGlieHNsdC94c2x0dXRpbHMuaD4iDQo+ID4gKy0gICAgbmd4X2ZlYXR1cmVfcGF0aD0i
L3Vzci9pbmNsdWRlL2xpYnhtbDIiDQo+ID4gKysgICAgbmd4X2ZlYXR1cmVfcGF0aD0iPS91c3Iv
aW5jbHVkZS9saWJ4bWwyIg0KPiANCj4gRm9yIE9FIHVzZWNhc2UsIHRoaXMgbWlnaHQgYmUgZW5v
dWdoLCBob3dldmVyLCB1cHN0cmVhbSBtaWdodCBzdXBwb3J0IGRpZmZlcmVudA0KPiBjb21waWxl
cnMgb3IgZXZlbiBvbGRlciBnY2Mgb3IgY2xhbmcgd2hlcmUgc3lzcm9vdCBzdXBwb3J0IGlzIG5v
dCB0aGVyZSBvciBhcmUNCj4gY29uZmlndXJlcyB3aXRoIHN5c3Jvb3Qgc3VwcG9ydCBkaXNhYmxl
ZCBzbyA9aW5jcGF0aCBzeW50YXggbWF5IG5vdCB3b3JrDQo+IHVuaXZlcnNhbGx5LiAgUGVyaGFw
cyBhZGRpbmcgYSBuZXcgY2FzZSB3aGVyZSBQUkVGSVggaXMgc2V0IHRoZW4gcHJlcGVuZCB0aGF0
IHRvDQo+IHBhdGggaWYgbm90IHRoZW0gcHJvY2VlZCBhcyBub3JtYWwgbWlnaHQgbWFrZSBpdCBl
YXNpZXIgdG8gbm90IHJlbHkgb24gdG9vbA0KPiBmZWF0dXJlcy4NCg0KVGhlIG9ianMvTWFrZWZp
bGUgaW4gdGhlIHNvdXJjZSBjb2RlIHVzZXMgdGhlICI9IiBzeW50YXggdG8gYWRkIHRoZSBsaWJ4
bWwyIGluY2x1ZGUgcGF0aCwNCnNvIHRoYXQgd291bGQgYnJlYWssIHRvby4gIEkgaGFkbid0IGNo
ZWNrZWQgdGhhdCBiZWZvcmUuDQoNCkpvZQ0KDQo+IA0KPiA+ICsgICAgIG5neF9mZWF0dXJlX2xp
YnM9Ii1seG1sMiAtbHhzbHQiDQo+ID4gKyAgICAgbmd4X2ZlYXR1cmVfdGVzdD0ieG1sUGFyc2Vy
Q3R4dFB0ciAgICBjdHh0ID0gTlVMTDsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICB4c2x0
U3R5bGVzaGVldFB0ciAgIHNoZWV0ID0gTlVMTDsNCj4gPiArQEAgLTEwMCw3ICsxMDAsNyBAQCBm
aQ0KPiA+ICsgICAgIG5neF9mZWF0dXJlX25hbWU9TkdYX0hBVkVfRVhTTFQNCj4gPiArICAgICBu
Z3hfZmVhdHVyZV9ydW49bm8NCj4gPiArICAgICBuZ3hfZmVhdHVyZV9pbmNzPSIjaW5jbHVkZSA8
bGliZXhzbHQvZXhzbHQuaD4iDQo+ID4gKy0gICAgbmd4X2ZlYXR1cmVfcGF0aD0iL3Vzci9pbmNs
dWRlL2xpYnhtbDIiDQo+ID4gKysgICAgbmd4X2ZlYXR1cmVfcGF0aD0iPS91c3IvaW5jbHVkZS9s
aWJ4bWwyIg0KPiA+ICsgICAgIG5neF9mZWF0dXJlX2xpYnM9Ii1sZXhzbHQiDQo+ID4gKyAgICAg
bmd4X2ZlYXR1cmVfdGVzdD0iZXhzbHRSZWdpc3RlckFsbCgpOyINCj4gPiArICAgICAuIGF1dG8v
ZmVhdHVyZQ0KPiA+ICstLQ0KPiA+ICsyLjM1LjUNCj4gPiArDQo+ID4gZGlmZiAtLWdpdCBhL21l
dGEtd2Vic2VydmVyL3JlY2lwZXMtaHR0cGQvbmdpbngvbmdpbnguaW5jDQo+ID4gYi9tZXRhLXdl
YnNlcnZlci9yZWNpcGVzLWh0dHBkL25naW54L25naW54LmluYw0KPiA+IGluZGV4IDFlYTMyZjdj
OTQuLjg4OTBlMGJlYTEgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS13ZWJzZXJ2ZXIvcmVjaXBlcy1o
dHRwZC9uZ2lueC9uZ2lueC5pbmMNCj4gPiArKysgYi9tZXRhLXdlYnNlcnZlci9yZWNpcGVzLWh0
dHBkL25naW54L25naW54LmluYw0KPiA+IEBAIC0yMiw2ICsyMiw3IEBAIFNSQ19VUkkgPSAiIFwN
Cj4gPiAgICAgIGZpbGU6Ly9uZ2lueC12b2xhdGlsZS5jb25mIFwNCj4gPiAgICAgIGZpbGU6Ly9u
Z2lueC5zZXJ2aWNlIFwNCj4gPiAgICAgIGZpbGU6Ly9uZ2lueC1maXgtcGlkZmlsZS5wYXRjaCBc
DQo+ID4gKyAgICBmaWxlOi8vMDAwMS1jb25maWd1cmUtbGlieHNsdC1jb25mLnBhdGNoIFwNCj4g
PiAgIg0KPiA+DQo+ID4gIGluaGVyaXQgc2l0ZWluZm8gdXBkYXRlLXJjLmQgdXNlcmFkZCBzeXN0
ZW1kIEBAIC00Nyw2ICs0OCw4IEBADQo+ID4gUEFDS0FHRUNPTkZJR1tpcHY2XSA9ICItLXdpdGgt
aXB2NiwsIg0KPiA+ICBQQUNLQUdFQ09ORklHW3dlYmRhdl0gPSAiLS13aXRoLWh0dHBfZGF2X21v
ZHVsZSwsIg0KPiA+ICBQQUNLQUdFQ09ORklHW3N0cmVhbV0gPSAiLS13aXRoLXN0cmVhbSwsIg0K
PiA+DQo+ID4gK1BBQ0tBR0VDT05GSUdbeHNsdF0gPSAiLS13aXRoLWh0dHBfeHNsdF9tb2R1bGUs
LGxpYnhzbHQiDQo+ID4gKw0KPiA+ICBkb19jb25maWd1cmUgKCkgew0KPiA+ICAgICAgaWYgWyAi
JHtTSVRFSU5GT19CSVRTfSIgPSAiNjQiIF07IHRoZW4NCj4gPiAgICAgICAgICBQVFJTSVpFPTgN
Cj4gPiAtLQ0KPiA+IDIuMjUuMQ0KPiA+DQo+ID4NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09
LQ0KPiA+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3Vw
Lg0KPiA+IFZpZXcvUmVwbHkgT25saW5lICgjMTA1MzM3KToNCj4gPiBodHRwczovL2xpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvbWVzc2FnZS8xMDUzMzcNCj4gPiBN
dXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMDE3NTg2
NjYvMTk5NzkxNA0KPiA+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5l
bWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvdW5zdWINCj4gPiBbcmFqLmtoZW1AZ21h
aWwuY29tXQ0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4NCg==

