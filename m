Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7FA7C54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 16:31:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.27817.1709656288539450530
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Mar 2024 08:31:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lV2bglhF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3794f145c1=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 425BIwoc003816
	for <openembedded-devel@lists.openembedded.org>; Tue, 5 Mar 2024 16:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=vySkwKf/ymHz8Ej1Cdw9XqiUx8fR5bxkOGz6cVNQxSM=; b=
	lV2bglhFAKyAuqFTGijDJDsho9Re4xEni49TElVnef4bRMoY3JjbX7PoQxiGTLJ+
	0P/H+qOC3gukb9mq+dCL1xUQz2MmS7Kx8XiuUeqS5YibSE8JMlYdKCnoO6+De834
	DbP05OS9m950xY2iwW0rb3AANdUB530TKcjmq/tEC6u+ZzigJoDISk7HZjAogsKo
	Bo48abAS9EwUe0OCtj3HrJ3Ugeby4sBPjCe55Ht/tTcig3mKQrCdOe3MCtlQXF6U
	6PKi8a7zWaLPokR0N8xJ3uB829HpiRSja7KfsW8YRLfViwzT773dmvYNOxOgZ+55
	76Ge2P4XPvHGUjXErfpOCw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wksawu24n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 16:31:27 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 425GQx9c016792
	for <openembedded-devel@lists.openembedded.org>; Tue, 5 Mar 2024 16:31:27 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wksawu24m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Mar 2024 16:31:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jORcfgJZCTNL9GqHRxn5E8Xs9x0h7G2fvRqBc/InUgzJ2/Z4yndko9dkTdoaeF3x8xu3v0uw5A/LmwTqMWDT/OGix/1Gi8a73H7TXAC5cTmORpr6dKOtrlavDzCy+Arf+VKgiRY3znZu+I5N7lXM5giC7R/2HVVdWH/EJPwdxx+lNr0MZCIa2WDGrWGsEBMqbTZ4r4cTlUcD3mZWRymTZ89rVJPbvrT1teZb2rnNpYxons1nnCgw5Pt/GKouLoOsgtuOv5povlmuLe0Dycu99gZB/7+aG1U9QGC3sjhKLUCVs63oO5SvUNdJ5tXhTZ70r/vBh5vBX696WpQBzKKwYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vySkwKf/ymHz8Ej1Cdw9XqiUx8fR5bxkOGz6cVNQxSM=;
 b=LwS3a9oZuf4n5DKpF2LUqtPcXtC0L5G4IYrEUxL/Ge71gP469pSfhpbTxNv0Uk10p7qUXX5rKFBm1KeRcU7gWxo+2Szsuh9qN4HlxvMeGBT5SYpvYP2MxPVxB0xogJqBAhJmQrVkJljar3x/wAj2iV8qSloC6G2tYMvZgzJ/fnNmd8TFD4GaZ16ixcD0GZ4V/EziLKTzgXn0y2PJNejJ4DF+jzie1XyG8Zkk7JzHzs8dcRgmhACnqbhTqaZk46jAVgoRJWK/r4Uha/DHON9ZhfRLyDMeGyvePOxmh+pTIgR3xxnWXRC/AaZtAjaL84VjxyYYZpULP+XNPz1XMgZzuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by PH8PR11MB6801.namprd11.prod.outlook.com (2603:10b6:510:1c9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Tue, 5 Mar
 2024 16:31:24 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::155e:72e0:2122:f82d]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::155e:72e0:2122:f82d%5]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 16:31:24 +0000
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: RE: [oe] [meta-oe][PATCH 1/1] googletest: allow for shared libraries
Thread-Topic: [oe] [meta-oe][PATCH 1/1] googletest: allow for shared libraries
Thread-Index: AQHabn3zQo/IIPhe+kaZ6mKA+lwNObEoQDcAgAEV03A=
Date: Tue, 5 Mar 2024 16:31:24 +0000
Message-ID: 
 <BY5PR11MB3992D4DE0161EEE482A2C27088222@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <20240304215014.4191019-1-joe.slater@windriver.com>
 <CAMKF1sqND1HW4vubUN7AMpvQvWwXGHTKygR36zkzQuZAoVP3tA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqND1HW4vubUN7AMpvQvWwXGHTKygR36zkzQuZAoVP3tA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB3992:EE_|PH8PR11MB6801:EE_
x-ms-office365-filtering-correlation-id: 0243fc54-6daa-44d7-9d70-08dc3d31b2d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 XknTKc0IjomWi/BJy3wqC5vUcADMrjmBbVUyy13NnQSAR5RlY+fFhm3/EgEfoi1Q//q+RuCqCUUsEdxhD2b19CEpJy25ygeVO05Vn9LfL1a3Cd7l25FlDwdivm1PPE7qDJLCIFrcQYFKSoZJnO1uuoL0RKM2WBaHvP/Y/VRF4LDtHvB5B0vFJHSX1+ibYieWxxTu40LoED+zmleWHHIk+O4JojAfkpxQc4e+QBfQaBcETY42+fu/ZzWPDlJRB5tPEpk6IMmiyyVN61i8Gwo7D8+Iggjh3WR0OBxFSzgvlcL+paJPZGqQ/Szr9OX4wPB2sBzULUVsx1DMa3jt3j2ODvb9LdCyl78ihf7g0YxICLv/PWYsIuX5GPqv6047GIvtVETDpx1okh0fUcKVtNH4GAfTlgXSxwWCAP6T+a0fjhxoRWbyRsDGqsU4Jsnv2WoMG0zPON6rzjgU43M8STf6o3rEXnWMLr87aHOxkidpnnmRvrsnatEC58lDTBG/YG5+WZCNkXmdG/SV3sEEjjPbxVOR8b78bNdTpuwO7xfYz31+0X5P62y7uvYAtXsL7P9yP8kwJQwlHTJE1i/o6yv2PuSbPMLfjjaJj+qjRudojJ77L9ufYc/086IMFJUO9gZBJK5Axjzf8ij/GOu0Lg9gx0V/TbXdwlbvuE2Nv+r4usSv0YWDP7NZngYv7biroRlW
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZGVFbFVrZ2FOYnF5QXJwT0taRC9zZTJwdkRDQlk2Z3YyWWNGcHh3WGpsazJw?=
 =?utf-8?B?N0ZKblc0aXRHU2VOOUtQYjl4eE9kT1c3MTdMNkVQRERNMVBIUk8rdzVIZHk5?=
 =?utf-8?B?QWRQNE9OZ2d2amFXMkdzREZhczNyTlNWVmF2NStZL3hueS82SnNQQlpsbmhm?=
 =?utf-8?B?b3c3ODNSdDVCdHF2eittUWVFcEFwcVZ6dTlaL0g4VU9ZdFRWcVNnVmNyVUN1?=
 =?utf-8?B?MUd0TWxWZGpFWFlRTFluVTk5emNMRUhYbC8rb0hSYTNTMGk2R05LWTJpK2Zx?=
 =?utf-8?B?VXVXa0U5VjBPZXY4Vk9rMlMzYTJudkdKTFJ2eTNSbGtMUzh5OW9uZGEzUUNn?=
 =?utf-8?B?d0FLOGJUUmV6WGVzdERieStadGFqdHhoTWIwa3VLUHpSdGU3ZS9LdDJ3SllJ?=
 =?utf-8?B?SjlqeUxTUW1SbUU1L0RnVlJyTER5b2JJRnhGalhTNzVydnJWZTZORjZ0a1BB?=
 =?utf-8?B?QmhIZXBmYXV5SHAzTzhiWm9YL3hrZVRLcFhadVlmRVRHdy8veFBEUnBHSkIv?=
 =?utf-8?B?OTd3MmY4TzF5WmhjZGxRekpWakxsK0R3S1VPNUNWNGs0dWRRbHZka3JrbjBI?=
 =?utf-8?B?YnFzYm9NR2lmNXJTckJKbGVuQmVXYTh6YXI4Tmd2aWpHaHJXQWpPUUhzL1Q3?=
 =?utf-8?B?clZpdUs2dkF1dWgxM0JTcVhtL1NLTjZsbWhGSDZQb1o0OFpzK2swN3lkVlN5?=
 =?utf-8?B?b0d3ajIyc2I4K1FxQVY0Rk9TSElIVjNrbWZqcmU0U2wyY2pXQzJkdU1GTFZR?=
 =?utf-8?B?bVNzOTJoNDY4bmk2SHZ1aTdSaXl2alNKS2xVbUNrN3R6ekhnVEJXVXpBYVRt?=
 =?utf-8?B?MlZmVEV1ZVpESldpUjVCRDF3ZHA0WGllN2VPbGxxcGFiSHNBeEtkcytjU2FC?=
 =?utf-8?B?ZXRaVVdVTFFkNE5ZaWhKSjUycndHMWo3ODRyRXV4VSt5WlVYcUtqOU9NRmcy?=
 =?utf-8?B?a01md05zS0xtanJBVkdTSGgrQjNMby9wbEluSG9lZUhLay9hNE9jVWdsd2k5?=
 =?utf-8?B?Y2xiRjB0YlpKU0plWUZ4Rll6UW5CTlM2MXdsTUxnb2pKTmp4YXV1ZEJnMW1M?=
 =?utf-8?B?VlRvYzQxc1ErUHFjVUZ4RW81OGxVeWNaT2MwT2k0R09vRk1Wd0l1OU5UTjlT?=
 =?utf-8?B?QzZ6OWRIZHpUbW91QzJNaEd3S0VaSzNTSkNFL1kxU2s4NEp2S1dnMnVRTHB5?=
 =?utf-8?B?MUxneE85bVd6ZUpNWTdqVkVKUnpQclJURmU2RWZtQngyelpBeTZTNXZ0TnMr?=
 =?utf-8?B?eVVkWnR2RWIyL0o3RS9pM1pzaGpUbGhuNVVVQmxWdHlCTG5jbFpxa09YY1ZK?=
 =?utf-8?B?dmxWUys4WmJaUGt5TlBQeTFMK28weEFiVkFVVGhBNUh2STM3Szl0QWlELzNa?=
 =?utf-8?B?UjRlRlFRRTF1anVBR1FaZ2FFenRwc3hGUGV0Zk5GSXJKRm1raVBzdVM0bnZu?=
 =?utf-8?B?eURTVEh0SmRtMlprUkVPNXdRbW1kWlhlL0E4c1J1TWZHT1lHMDNUQ1JqQVY4?=
 =?utf-8?B?Z1grVzFlZWdhY01nMlFqUTBJQ0NYQnZ0cDJaWkVYc2hBRm13V21aMVE4WTNl?=
 =?utf-8?B?TFNPR0pLc3pPaEF5QkFuWDNUU0tEUkpSdmUyUUZoY0tsMTRUc3VqMmw2NlhR?=
 =?utf-8?B?bnJTSFBVQngrRDEzWjFtOVJZbW1KalFOSHc4RE5VTWF6Z084NVE1bm1yd3VN?=
 =?utf-8?B?dHZhUmMyNDZhZG1yMlU0TFBRZHVGRkMyL2NmcjVlMDFWNElSbnA4dGsvblZO?=
 =?utf-8?B?OFJ4RjhyM29nZ0gvZVh6bFEyMmtnU0Zra25Uc1VEV2VFWUREUFFkZ2tRWXUw?=
 =?utf-8?B?dXpkQ0VPZVQrbUVEYXpiV2NmWC9YQXQ4ejJKVERvMTgvT0xOVUN6ZmtiOVYx?=
 =?utf-8?B?WFU3NjN1YnJwZklzcE90bXJiTXRnVWx1SjZVSFFGMUJBb1BHK0IrcDM3b0FU?=
 =?utf-8?B?MmkrcG44YUQ5dU01WTFueXhJUCtIMW1URU5jNGV1S2hRWGpibm5Cbmc2UDlJ?=
 =?utf-8?B?MXJ0UStFc2Fic1VMNnNmbC9TNmtsRFowQVJKQXM0MlJ3STNkQ3p1c1NsdjBN?=
 =?utf-8?B?QW5EU3R3dXFTREN4b0VTWUZFS3VadHNWekxKNHBUNS9HSjRGdmNjYjZQZSsr?=
 =?utf-8?Q?NJHOxDLF+AIwFxbSOtxb7goPh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0243fc54-6daa-44d7-9d70-08dc3d31b2d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2024 16:31:24.2407
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TTDUyfFlVX1w8ThfmqMjT6uZXLP5kp5ZgH8BANwrL9L5vj7FOA9Zns9M8S/NeD77m7qVfV1/Nc5H7oaezsgmKh1iZTq/o4wWczqB0O1XDgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6801
X-Proofpoint-ORIG-GUID: qp2f3fr9qhycs-t18m5qO4YxcR5bCaqB
X-Proofpoint-GUID: _Hp60_7QDnWHaad-Q7BeBvVz0Oa2Bear
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-05_13,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403050132
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 16:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109125

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4NCj4gU2VudDogTW9uZGF5LCBNYXJjaCA0LCAyMDI0IDM6NTAgUE0NCj4g
VG86IFNsYXRlciwgSm9zZXBoIDxqb2Uuc2xhdGVyQHdpbmRyaXZlci5jb20+DQo+IENjOiBvcGVu
ZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgTWFjTGVvZCwgUmFuZHkNCj4g
PFJhbmR5Lk1hY0xlb2RAd2luZHJpdmVyLmNvbT4NCj4gU3ViamVjdDogUmU6IFtvZV0gW21ldGEt
b2VdW1BBVENIIDEvMV0gZ29vZ2xldGVzdDogYWxsb3cgZm9yIHNoYXJlZCBsaWJyYXJpZXMNCj4g
DQo+IE9uIE1vbiwgTWFyIDQsIDIwMjQgYXQgMTo1MOKAr1BNIEpvZSBTbGF0ZXIgdmlhIGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gPGpvZS5zbGF0ZXI9d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPg0KPiA+IEZyb206IEpvZSBTbGF0ZXIgPGpvZS5zbGF0
ZXJAd2luZHJpdmVyLmNvbT4NCj4gPg0KPiA+IEFkZCBhIFBBQ0tBR0VDT05GSUcgb3B0aW9uIHRv
IHByb2R1Y2Ugc2hhcmVkIGxpYnJhcmllcy4NCj4gPiBBbGxvdyBzdGF0aWNkZXYgdG8gYmUgZW1w
dHkgaWYgbm8gc3RhdGljIGxpYnJhcmllcyBhcmUgYnVpbHQuDQo+ID4NCj4gDQo+IHdoeSB3b3Vs
ZCBiZSBub3QgYnVpbGQgc3RhdGljIGxpYnMgPyBhbmQgaWYgd2UgZG8gbm90IHRoZW4gd2h5IGRv
IHdlIG5lZWQgdG8NCj4gY3JlYXRlIGVtcHR5IHBhY2thZ2UgPw0KDQpJZiB3ZSBzZXQgLURCVUlM
RF9TSEFSRURfTElCUz1PTiBzdGF0aWMgbGlicyB3aWxsIG5vdCBiZSBidWlsdCBhbmQgLXN0YXRp
Y2RldiB3aWxsIG5vdCBiZSBjcmVhdGVkLCBzbyAtZGV2IHdpbGwgcHJvZHVjZSBhbiBlcnJvciBp
ZiB3ZSB0cnkgdG8sIGZvciBleGFtcGxlLCBwb3B1bGF0ZSBhbiBzZGsuICBJIGd1ZXNzIHdlIGNv
dWxkIHB1dCBzdGF0aWMgbGlicyBpbiAtZGV2IGFuZCBnZXQgcmlkIG9mIC1zdGF0aWNkZXYsIGJ1
dCBJIGRpZG4ndCB3YW50IHRvIG1lc3Mgd2l0aCB0aGUgcGFja2FnaW5nLg0KDQpKb2UNCg0KPiAN
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKb2UgU2xhdGVyIDxqb2Uuc2xhdGVyQHdpbmRyaXZlci5jb20+
DQo+ID4gLS0tDQo+ID4gIG1ldGEtb2UvcmVjaXBlcy10ZXN0L2dvb2dsZXRlc3QvZ29vZ2xldGVz
dF8xLjE0LjAuYmIgfCA4ICsrKysrKystDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lw
ZXMtdGVzdC9nb29nbGV0ZXN0L2dvb2dsZXRlc3RfMS4xNC4wLmJiDQo+ID4gYi9tZXRhLW9lL3Jl
Y2lwZXMtdGVzdC9nb29nbGV0ZXN0L2dvb2dsZXRlc3RfMS4xNC4wLmJiDQo+ID4gaW5kZXggOGM3
NWY5MzZkZS4uMWIwNWYzZDMzNiAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMtdGVz
dC9nb29nbGV0ZXN0L2dvb2dsZXRlc3RfMS4xNC4wLmJiDQo+ID4gKysrIGIvbWV0YS1vZS9yZWNp
cGVzLXRlc3QvZ29vZ2xldGVzdC9nb29nbGV0ZXN0XzEuMTQuMC5iYg0KPiA+IEBAIC0xMCwxMSAr
MTAsMTcgQEAgUyA9ICIke1dPUktESVJ9L2dpdCINCj4gPiAgU1JDUkVWID0gImY4ZDdkNzdjMDY5
MzYzMTUyODZlYjU1ZjhkZTIyY2QyM2MxODg1NzEiDQo+ID4gIFNSQ19VUkkgPQ0KPiAiZ2l0Oi8v
Z2l0aHViLmNvbS9nb29nbGUvZ29vZ2xldGVzdC5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0
cHMiDQo+ID4NCj4gPiAtaW5oZXJpdCBjbWFrZQ0KPiA+ICtpbmhlcml0IGNtYWtlIHBrZ2NvbmZp
Zw0KPiA+ICsNCj4gPiArIyBhbGxvdyBmb3Igc2hhcmVkIGxpYnJhcmllcywgYnV0IGRvIG5vdCBk
ZWZhdWx0IHRvIHRoZW0gIw0KPiA+ICtQQUNLQUdFQ09ORklHW3NoYXJlZF0gPSAiLURCVUlMRF9T
SEFSRURfTElCUz1PTiwtDQo+IERCVUlMRF9TSEFSRURfTElCUz1PRkYsLCINCj4gPiArDQo+ID4N
Cj4gPiAgQUxMT1dfRU1QVFk6JHtQTn0gPSAiMSINCj4gPiAgQUxMT1dfRU1QVFk6JHtQTn0tZGJn
ID0gIjEiDQo+ID4NCj4gPiArQUxMT1dfRU1QVFk6JHtQTn0tc3RhdGljZGV2ID0gIjEiDQo+ID4g
IFJERVBFTkRTOiR7UE59LWRldiArPSAiJHtQTn0tc3RhdGljZGV2Ig0KPiA+DQo+ID4gIEJCQ0xB
U1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayINCj4gPiAtLQ0KPiA+IDIuMjUuMQ0KPiA+DQo+
ID4NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+IExpbmtzOiBZb3UgcmVjZWl2ZSBh
bGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiA+IFZpZXcvUmVwbHkgT25saW5lICgj
MTA5MTAzKToNCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVk
LWRldmVsL21lc3NhZ2UvMTA5MTAzDQo+ID4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcvbXQvMTA0NzMyNDEzLzE5OTc5MTQNCj4gPiBHcm91cCBPd25lcjog
b3BlbmVtYmVkZGVkLWRldmVsK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBVbnN1
YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRl
dmVsL3Vuc3ViDQo+IFtyYWoua2hlbUBnbWFpbC5jb21dDQo+ID4gLT0tPS09LT0tPS09LT0tPS09
LT0tPS0NCj4gPg0K

