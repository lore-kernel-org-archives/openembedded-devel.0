Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 935C1C5478C
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 20:56:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.34463.1709324419496697970
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Mar 2024 12:20:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=njzeHgvo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=37909bf631=william.lyu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 421Bm4Od018760
	for <openembedded-devel@lists.openembedded.org>; Fri, 1 Mar 2024 12:20:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=pcgp9D6BhfbVu1UVP3vO8XJYLhQB8ENEGkoRU7Bdwx4=; b=
	njzeHgvoMbgnnW27q+u16hK+N4cX9eY8IAmFWQIj5WQWFdb1uZ1zU8NgTvwlvxaM
	d8elARoOn/CTM9wYv7eEBxxfa2Hy9D4AA5EI8TepTd/d7g8haECoqBqV+brv07EX
	PcltIbT92CvnBxmW8rUi2cBUmZVNpoIBtA9HcLuJm1B6/DW63SSS0Cvot4/vIckl
	4TuAdN6pztolrlaKooDf41Jsnysnr6nED+s10Z0yvLAIj12710tapSrF1fq1ImVO
	/PdD80P8TpAD9L/diAsGLucZNMYUaU9iD5B49qMcx+wn5paiYntO8GXoI6Ty3BIv
	kUntN7pESTobLtuZj+xJqg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wk755gs1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 12:20:18 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 421KKEiU023391
	for <openembedded-devel@lists.openembedded.org>; Fri, 1 Mar 2024 12:20:18 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wk755gs1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Mar 2024 12:20:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elW1CmC1yiEQxAyegts8gCCslgHftnbZTwBJ3xc84vOUdcTgHWwX88iua8fCyzHAjqdBaTGSGVLBre/hrbg5bV/UAWxocpHLU9GrG5oojONeO7qDHv6huCOW0uWY1gEfsr5t3VYdnFW0EIWIKFSEO43i+sXFqcYbRQ5Nm6jHpUi5LD3eK2DG9TQBgic1V/WhrtWbhlfM2q35f1mRdUhGJZu4uXi7+oe4zR8XLwSTR/Bmg+SBmfHxqR6cE1oA7NjGPSD7X3jbS1lE+7M9Qi6raJVhmhbYRcxt+te///QaG8TPe9LlJnYNLMYnB2R9USZqjAnxb7jOKlyi3aXLYV/yYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcgp9D6BhfbVu1UVP3vO8XJYLhQB8ENEGkoRU7Bdwx4=;
 b=BzhqsfFAw9gBUkpSf9m3ubtNy70ods/eqpD7bkM6GblcnifOItCLGw4jP+hXyDdQSpOKY8nksUd8G2UpG57ld4u9Nv+EZo+vmj3+TUPBERSdb/0Xq+c2bxB+oRc7ZZIEFj6mc60mmjpPRaS40pPYMObl04haEo+s/pYRWnyVS969UJTinmuU1LABM7i1bu/c7feM077S/sTLT6DLV/boocrCKrTb3SudtdTcOZE/1XtKroPamLGNu6sc1a0DP1gYVpDKP/C8k3nentV6Xo1iqP1EqMKiAdOOQMRYL/1W6MVvXnfLdvi1o1n4NKzvvqtFDd29gttj75rxVipgGHNaEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8767.namprd11.prod.outlook.com (2603:10b6:408:215::11)
 by SN7PR11MB8110.namprd11.prod.outlook.com (2603:10b6:806:2e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.18; Fri, 1 Mar
 2024 20:20:15 +0000
Received: from LV3PR11MB8767.namprd11.prod.outlook.com
 ([fe80::6f05:dac:daa:e491]) by LV3PR11MB8767.namprd11.prod.outlook.com
 ([fe80::6f05:dac:daa:e491%7]) with mapi id 15.20.7339.024; Fri, 1 Mar 2024
 20:20:14 +0000
From: "Lyu, William" <william.lyu@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-filesystems][PATCH] e2tools: Add ptest
Thread-Topic: [oe] [meta-filesystems][PATCH] e2tools: Add ptest
Thread-Index: AQHaZZTs0A/IUlhr/kO3en9qbkWCQ7Ef9LMAgANrjCA=
Date: Fri, 1 Mar 2024 20:20:14 +0000
Message-ID: 
 <LV3PR11MB8767C8BB2545D95BF7131C3FEE5E2@LV3PR11MB8767.namprd11.prod.outlook.com>
References: <20240222134140.2367805-1-William.Lyu@windriver.com>
 <CAMKF1spgXkbYj446g_ujSO41hrR9kUx14SF-iyw1y33-4Y7x3g@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spgXkbYj446g_ujSO41hrR9kUx14SF-iyw1y33-4Y7x3g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8767:EE_|SN7PR11MB8110:EE_
x-ms-office365-filtering-correlation-id: 0b6825cd-d4fa-40dd-08cf-08dc3a2d0144
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 mPwGbMReIl+aS+uircNVdtgOWKqKB5U5PPsxddE345zFWi5rFLDeUlyGAcqJOgDB4lIyXKp9F/Amvo5JmzpzLkCJup4rWYi6mSqI1RJz7qb1cU7YA1RMetDJtiEFPyHVwbPoOi1tSFsX2xRi+6JIbuo1bzj5Dy96krrKcK2MHq1Q2UpUh1LrlqyL1CGpMqyfsDHGtgiHe36WpVoYquBKEy7j5L2e9oTem/O0uypclHVdiwyy5rKcwAIBnyxpRmvlgdASHLGkQJsIXEgUaO9Jcdw8yHnxQONWV8r/v7P/IQNr8RH8VxjZvuxcUYNH4bjjz96Z8L2YSJyMgK6cQzoKFUQHAVJhZcmXPkGAng7cEIEHUgYdCCbRHpU/2p7SL6rbPxmp9iuajkAsuHmaF9MHeXdXUfqawNrZ9piejtfndLP4VgCEi5y/mHyWDtWkTLOu7LeZjWxyAwQtho7i08hAfYhsudVWRT1G6lWvxB+zYl5CQ9Q3h2O78kIQGmb8bvT76GZK2oAVabxiyrDe+HX/7EvmG5w/2pBg0hJXxxXw96Vgai63acSkSAJJxzTGGvg57iQY4yyfbXYIUCbo6AL1Shirp85z9EpL2dQnpErg6fzqu37UCQCx1TLsnYDctJcmWU7csTEP5HbySSPdz6OCRpqKez10mVXpuE/MJcLSPeI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8767.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?d1R2Q1lheHBXMnk4WCtZcnY2SGI0bFdWMlZUQ0orRHZtWEhEckJJSElQUjNo?=
 =?utf-8?B?Z3JRenplR2VSa0xoNmNsbWcrd3dYRFREZjJWN1pBUytRNlFMQStCOWUrVXVB?=
 =?utf-8?B?b1lxR2pqNUxub2EwdndUNUIwN1FHRkFiT1orZ3k0bTNhSCtzZGk0Y2RZMFZm?=
 =?utf-8?B?Y29XaytFZlBkWDhoa1NGZExLajZlQ1g1SzRUeS9iTlorT080cmNkTGkvcVNU?=
 =?utf-8?B?STY3Y0NYY0ZmSG5ibmxVVmF4YXVtRFJqMks3NDE0NEpSeUd1eTV4dTVlTU9D?=
 =?utf-8?B?UE9WNWFSOEhYRTN2WW1VSEZ1WW5JMDAreDNLZ2RLV242ejdXL2FIUlRjb0RG?=
 =?utf-8?B?Rjh4ZVVKMzFSSENtTUR5WTVZMmYrQW85V2VZNmYwRlA3Qnp3UlVmUGsrVytu?=
 =?utf-8?B?SnloeHFWM2lxaVZWa0YxUGFPbmhrVHhRbXUzWGs5OWZRcTVTTkJzUnRsQ21p?=
 =?utf-8?B?SzQzeVJLRVBMZElCUVpwT0d5SlJtdSsxTVNDWkNJS2JGVFVrNFNaK0JrSktM?=
 =?utf-8?B?OU8xb1lMZzR6QnVJQUhIWVVZTkw0aG8xZnVxdjhBdTkrME43akJNczI5LzRy?=
 =?utf-8?B?c1kzbHNuNVdwN2ZFRVRFMTBQNlJNcmJuMnQwRStEQnJ4NUNGTjd5cVlKTWR1?=
 =?utf-8?B?b0dQSlFGeHZ0S04rbDJEWjZuZUZ1Y3JWZDk4Zm5BbXoxdVd6eTRjdkxGYTZq?=
 =?utf-8?B?SmNXaFhtRE53b2ZKYzg0d0JlMUpaRzRuUm9rTVc3U3M1cGx2dUFwaUZYRTBi?=
 =?utf-8?B?bmc1S3phd1A1anlTODZpRmx0ekVrbjgvWU8rTVRweEM4ZU0yUWpvamtzZVJv?=
 =?utf-8?B?VXRXbUN3OUVWL0RyU082V3Y3ZlpqbXZjaTBqdGdkRmpadWJieklURmZtM29N?=
 =?utf-8?B?Yno3d08zbG1JNmgxZksxUUdmYjZqVkhFbW5scFg2NDRXZDlwa3V6Y1B5Njd3?=
 =?utf-8?B?aUFuWWVuTWtoVFZpK0hGVDhwZ1AxNG5jSXAybi81VGJtUVdyak1ya2NVQnFK?=
 =?utf-8?B?WlN4RzR5YjFsbENCME9yampJcXRLeWxWSEFWRExxcnd2R1oxSTNrdVRDcHh1?=
 =?utf-8?B?d2ZOa05nMmI4WWRzcGp0aFc0L2M4SS9CenJJR1hxWWpiaThNbkwwaGNiVHQ1?=
 =?utf-8?B?UHZNMTM0ZTlVN1pRakFLb0hLWjhVZ3ZZRXY0WUVPN2ErMkg3RVN2VjgrRG5S?=
 =?utf-8?B?WGR1WXlpTGVTUFhXS3RGUnQ2RDF6TU9DU3ZNQ0RVQ2x5QWpPYWFjd1Y0VXh4?=
 =?utf-8?B?Q25MZjM1VHptSURnTmNvcHA4b0JLV3VQV2R4T0RIT0J0WXNBSDdPTHJUVita?=
 =?utf-8?B?Qlh5dlYzWmlGbDMxOGtrMTFUajMxVHZwb0JxWTVpeU9YL0E1ejNLeUZMbFJE?=
 =?utf-8?B?U1djOEFuMER2WkdzVUVOZllaQWlYRE5adG53YndFaFk0MkZ3eW1CWEtYNEtD?=
 =?utf-8?B?U1EyTjFyU3pGdWpKNWNwWncxd2NpbnVUMkVVRURtYlRpVUF3bWJDaHc1VXRv?=
 =?utf-8?B?NTgzQlZ4cURGdUE3MlFnb1JVMy9kQTc5Q3dtRjJPaEZOR0ZQNmVuSjI0NGdB?=
 =?utf-8?B?dFN0dWh2UElIem9ZcUJMZXUyNTkvbUtLVk9ERTdheHBFNW42Q1lKVks5UXBV?=
 =?utf-8?B?VHM5M3B3MmtLeHlOWnoxUU0vWHB2SnJGMk0wRnFSekNTZVRtRHZhdU9NWmwy?=
 =?utf-8?B?UFF2WWhZZlA5NHhqWjBwT2lJYXFIa2w0ZHl6dE42dFNWbVpGUFpHcnhXQlVi?=
 =?utf-8?B?eW1TTUM5aWZydjl3bVoyTno0QzlzeXg0VWZYa1pDU1QvMW9KbWtMT0pNS2Zi?=
 =?utf-8?B?VVpZWDhoNVNkUDJnY3Jla3hzc0daTU13dEtTN3RQUmljZW1iQ1gwdzdjTk9Z?=
 =?utf-8?B?ckhCcGoremYyWHZ6d09XL3MwY0Yzb1BVRWZGRXVYNklRZEc4a0xPc2hZTEdN?=
 =?utf-8?B?Y2czbzRYRlFEaU4rZTJaL2g4azNVTUNSdmp5Y3ZsbXVVT0Z1YXJBSGhtbnRj?=
 =?utf-8?B?TmNabVZ5TE1sYVpDZTBVd3RuQWdLbFNuZVJBWmkyaG1GL3JaRzcxdXVwMUtE?=
 =?utf-8?B?RG5ZMm9CWTR3TTBUcUV6K3lsMDYxK1phcG1Jdi9pVzEzNHNOcHlPZkd5NjFB?=
 =?utf-8?B?dEFGQldTNVU4dHcyKzBRdUVMVzBYbVJKMGwwSVAwS1dKUVlPVWJaUGt6VlVz?=
 =?utf-8?B?N3c9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8767.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6825cd-d4fa-40dd-08cf-08dc3a2d0144
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2024 20:20:14.8879
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sDtME2ePPiOPd/NwwDZ+CjbvRtjogSc8EO51uaOBId0n+ppM+6zuYsq2elCl6IhFReOryR8A4VCIHlBibE4CZpjtD2L7pk+XRpcAFtIxMG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8110
X-Proofpoint-ORIG-GUID: ZdDPVFGyvpd8qxtPJHYC-5_YTaWOGuxM
X-Proofpoint-GUID: 8YKNE8u31zEjJnLWvE6mabaeCIxHVWaA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-01_20,2024-03-01_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403010168
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 20:56:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109084

PiBJIGFtIHJ1bm5pbmcgaW50byB0aGlzIGVycm9yIG9uIHNvbWUgYnVpbGRlcnMgb24gQUINCj4N
Cj4gc3RkaW86IEVSUk9SOiBUYXNrDQo+ICgvaG9tZS9wb2t5YnVpbGQveW9jdG8td29ya2VyL21l
dGEtb2UvYnVpbGQvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZXhpZi9saWJleGlmXzAuNi4yNC5i
Yjpkb19wYWNrYWdlX3FhKQ0KPiBmYWlsZWQgd2l0aCBleGl0IGNvZGUgJzEnDQo+IHN0ZGlvOiBF
UlJPUjogZTJ0b29scy0wLjEuMCtnaXQtcjAgZG9fcGFja2FnZV9xYTogUUEgSXNzdWU6DQo+IC91
c3IvbGliL2UydG9vbHMvcHRlc3QvZ2l0Ly5naXQvaG9va3MvdXBkYXRlLnNhbXBsZSBjb250YWlu
ZWQgaW4NCj4gcGFja2FnZSBlMnRvb2xzLXB0ZXN0IHJlcXVpcmVzIC91c3IvYmluL3NoLCBidXQg
bm8gcHJvdmlkZXJzIGZvdW5kIGluDQo+IFJERVBFTkRTOmUydG9vbHMtcHRlc3Q/IFtmaWxlLXJk
ZXBzXQ0KDQpGaWxlICJ1cGRhdGUuc2FtcGxlIiBpcyBmcm9tICIuZ2l0IiBkaXJlY3RvcnkuIEkg
ZG8gbm90IGFjdHVhbGx5IG5lZWQgdGhpcw0KZmlsZSBvciBhbnl0aGluZyBmcm9tICIuZ2l0IiBk
aXJlY3RvcnkuIEkgb25seSBuZWVkIHRoZSBzb3VyY2UgdHJlZSBmb3IgcHRlc3QNCnRvIHJ1bi4N
Cg0KSG93ZXZlciwgSSBhbSBhIGJpdCBjb25mdXNlZCBhYm91dCB0aGlzIFFBIGlzc3VlIGJlY2F1
c2U6DQotICAgSSBkbyBub3Qgc2VlIGFueSBmaWxlIHRoYXQgaGFzICIjIS91c3IvYmluL3NoIi4g
RXZlbiAidXBkYXRlLnNhbXBsZSIgaGFzDQogICAgIiMhL2Jpbi9zaCIgYXMgdGhlIGZpcnN0IGxp
bmUuIFRoZXJlIGFyZSBmaWxlcyBpbiB0aGUgc291cmNlIHRyZWUgKG5vdA0KICAgIHVuZGVyICIu
Z2l0IiBkaXJlY3RvcnkpIHRoYXQgaGF2ZSAiIyEvYmluL3NoIiBhcyB0aGUgZmlyc3QgbGluZS4N
Ci0gICAiL2Jpbi9zaCIgaXMgcmVmZXJyaW5nIHRvIHRoZSBkZWZhdWx0IFBPU0lYIHNoZWxsLCBh
bmQgdGhlICJiYXNoIiBpbiB0aGUNCiAgICBSREVQRU5EUzplMnRvb2xzLXB0ZXN0IHNob3VsZCBh
bHJlYWR5IGZ1bGZpbGwgdGhpcyBydW50aW1lIGRlcGVuZGVuY3ksDQotICAgSSBhbSBub3QgeWV0
IGFibGUgdG8gcmVwcm9kdWNlIHRoaXMgaXNzdWUgdXNpbmcgcG9reS4gSSBhc3N1bWUgdGhpcyBp
cw0KICAgIGJlY2F1c2UgdGhlIFFBIElzc3VlIGNoZWNrZXIgImZpbGUtcmRlcHMiIGluIHBva3kg
ZG8gbm90IGNoZWNrICJzaCIgYnkNCiAgICBkZWZhdWx0IChleGNlcnB0IHRha2VuIGZyb20gIm1l
dGEvY2xhc3Nlcy1nbG9iYWwvaW5zYW5lLmJiY2xhc3MiKToNCg0KICAgIGlmICJmaWxlLXJkZXBz
IiBub3QgaW4gc2tpcDoNCiAgICAgICAgaWdub3JlZF9maWxlX3JkZXBzID0gc2V0KFsnL2Jpbi9z
aCcsICcvdXNyL2Jpbi9lbnYnLCAncnRsZChHTlVfSEFTSCknXSkNCiAgICAgICAgaWYgYmIudXRp
bHMuY29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycsICd1c3JtZXJnZScsIFRydWUsIEZhbHNlLCBk
KToNCiAgICAgICAgICAgIGlnbm9yZWRfZmlsZV9yZGVwcyB8PSBzZXQoWycvdXNyL2Jpbi9zaCdd
KQ0KICAgICAgICBpZiBiYi5kYXRhLmluaGVyaXRzX2NsYXNzKCduYXRpdmVzZGsnLCBkKToNCiAg
ICAgICAgICAgIGlnbm9yZWRfZmlsZV9yZGVwcyB8PSBzZXQoWycvYmluL2Jhc2gnLCAnL3Vzci9i
aW4vcGVybCcsICdwZXJsJ10pDQogICAgICAgICAgICBpZiBiYi51dGlscy5jb250YWlucygnRElT
VFJPX0ZFQVRVUkVTJywgJ3Vzcm1lcmdlJywgVHJ1ZSwgRmFsc2UsIGQpOg0KICAgICAgICAgICAg
ICAgIGlnbm9yZWRfZmlsZV9yZGVwcyB8PSBzZXQoWycvdXNyL2Jpbi9iYXNoJ10pDQoNCldpbGxp
YW0NCg0KPiBzdGRpbzogRVJST1I6IGUydG9vbHMtMC4xLjArZ2l0LXIwIGRvX3BhY2thZ2VfcWE6
IEZhdGFsIFFBIGVycm9ycyB3ZXJlDQo+IGZvdW5kLCBmYWlsaW5nIHRhc2suDQo+IHN0ZGlvOiBF
UlJPUjogTG9nZmlsZSBvZiBmYWlsdXJlIHN0b3JlZCBpbjoNCj4gL2hvbWUvcG9reWJ1aWxkL3lv
Y3RvLXdvcmtlci9tZXRhLW9lL2J1aWxkL2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGlu
dXgvZTJ0b29scy8wLjEuMCtnaXQvdGVtcC9sb2cuZG9fcGFja2FnZV9xYS4zMTE0OTYxDQo+DQo+
IE9uIFRodSwgRmViIDIyLCAyMDI0IGF0IDU6NTbigK9BTSBMeXUsIFdpbGxpYW0gdmlhDQo+IGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPHdpbGxpYW0ubHl1PXdpbmRyaXZlci5jb21AbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+Pg0KPj4gRnJvbTogV2lsbGlhbSBMeXUgPFdpbGxp
YW0uTHl1QHdpbmRyaXZlci5jb20+DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogV2lsbGlhbSBMeXUg
PFdpbGxpYW0uTHl1QHdpbmRyaXZlci5jb20+DQo+PiAtLS0NCj4+ICAuLi4vcmVjaXBlcy11dGls
cy9lMnRvb2xzL2UydG9vbHNfZ2l0LmJiICAgICAgfCA1MSArKysrKysrKysrKysrKysrKystDQo+
PiAgLi4uL3JlY2lwZXMtdXRpbHMvZTJ0b29scy9maWxlcy9ydW4tcHRlc3QgICAgIHwgIDUgKysN
Cj4+ICAyIGZpbGVzIGNoYW5nZWQsIDU0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtZmlsZXN5c3RlbXMvcmVjaXBlcy11dGlscy9lMnRv
b2xzL2ZpbGVzL3J1bi1wdGVzdA0KPj4NCj4+IGRpZmYgLS1naXQgYS9tZXRhLWZpbGVzeXN0ZW1z
L3JlY2lwZXMtdXRpbHMvZTJ0b29scy9lMnRvb2xzX2dpdC5iYiBiL21ldGEtZmlsZXN5c3RlbXMv
cmVjaXBlcy11dGlscy9lMnRvb2xzL2UydG9vbHNfZ2l0LmJiDQo+PiBpbmRleCBjYWYwMDI1Yzgu
LmE4MGI2ZjU5OCAxMDA2NDQNCj4+IC0tLSBhL21ldGEtZmlsZXN5c3RlbXMvcmVjaXBlcy11dGls
cy9lMnRvb2xzL2UydG9vbHNfZ2l0LmJiDQo+PiArKysgYi9tZXRhLWZpbGVzeXN0ZW1zL3JlY2lw
ZXMtdXRpbHMvZTJ0b29scy9lMnRvb2xzX2dpdC5iYg0KPj4gQEAgLTksMTcgKzksNjQgQEAgU0VD
VElPTiA9ICJiYXNlIg0KPj4gIExJQ0VOU0UgPSAiR1BMLTIuMC1vbmx5Ig0KPj4gIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWIyMzRlZTRkNjlmNWZjZTQ0ODZhODBmZGFm
NGE0MjYzIg0KPj4NCj4+IC1ERVBFTkRTICs9ICJlMmZzcHJvZ3MiDQo+PiArREVQRU5EUyArPSAi
Y29yZXV0aWxzIGUyZnNwcm9ncyINCj4+DQo+PiAgUFYgPSAiMC4xLjArZ2l0Ig0KPj4NCj4+ICBT
UkNfVVJJID0gIiBcDQo+PiAgICAgICAgICAgICBnaXQ6Ly9naXRodWIuY29tL2UydG9vbHMvZTJ0
b29scztwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIFwNCj4+ICsgICAgICAgICAgIGZpbGU6
Ly9ydW4tcHRlc3QgXA0KPj4gICINCj4+ICsNCj4+ICBTUkNSRVYgPSAiZmQwOTI3NTRhNmI2NWMz
YTc2OWY3NGY4ODg2NjhjMDY2ZjA5YzM2ZCINCj4+DQo+PiAgUyA9ICIke1dPUktESVJ9L2dpdCIN
Cj4+DQo+PiAtaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnDQo+PiAraW5oZXJpdCBhdXRvdG9v
bHMgcGtnY29uZmlnIHB0ZXN0DQo+PiArDQo+PiArZG9fY29uZmlndXJlOnByZXBlbmQoKSB7DQo+
PiArICAgIGdpdCAtQyAiJHtXT1JLRElSfS9naXQiIHJlc2V0IC0taGFyZCBIRUFEDQo+PiArDQo+
PiArICAgICMgVG8gaW5zdGFsbCBwdGVzdCBmb3IgdGhpcyBwYWNrYWdlLCBzcGVjaWFsIGNvbmZp
Z3VyYXRpb24gbmVlZHMgdG8gYmUNCj4+ICsgICAgIyBkb25lIGJlZm9yZSBkb19jb25maWd1cmUo
KS4gU28sIGRvX2NvbmZpZ3VyZV9wdGVzdCgpIHdoaWNoIGlzIHNjaGVkdWxlZA0KPj4gKyAgICAj
IGFmdGVyIGRvX2NvbmZpZ3VyZSgpIGNhbm5vdCBiZSB1c2VkLg0KPj4gKw0KPj4gKyAgICAjIFdl
IG9ubHkgZG8gc3BlY2lhbCBjb25maWd1cmF0aW9uIGlmIHdlIGFyZSBpbnN0YWxsaW5nIHB0ZXN0
IGZvciB0aGlzDQo+PiArICAgICMgcGFja2FnZS4NCj4+ICsgICAgaWYgWyAiJHtAZC5nZXRWYXIo
J1BURVNUX0VOQUJMRUQnKX0iIC1lcSAiMSIgXTsgdGhlbg0KPj4gKyAgICAgICAgIyBTaW5jZSB3
ZSBndWFyYW50ZWUgcnVuLXRpbWUgZGVwZW5kZW5jeSB3aGVuIGluc3RhbGxpbmcgdGhlIHB0ZXN0
IGZvcg0KPj4gKyAgICAgICAgIyB0aGlzIHBhY2thZ2UsIHdlIGRvIG5vdCBuZWVkIHRoZSBjaGVj
ayBtYWNyb3MgdW5kZXIgc2VjdGlvbiAiY2hlY2tzDQo+PiArICAgICAgICAjIGZvciBwcm9ncmFt
cyIgaW4gImNvbmZpZ3VyZS5hYyIuIFBsdXMsIHRoZXNlIGNoZWNrIG1hY3JvcyBzZXQgdGhlDQo+
PiArICAgICAgICAjIG91cHV0IHZhcmlhYmxlcyB0byBpbmNvcnJlY3QgdmFsdWVzIGFzIHRoZXNl
IGNoZWNrcyBhcmUgcGVyZm9ybWVkIG9uDQo+PiArICAgICAgICAjIHRoZSBob3N0IGVudmlyb25t
ZW50LiBTdGlsbCwgd2UgbmVlZCB0aGVzZSB2YXJpYWJsZXMgb3V0cHV0dGVkIGZyb20NCj4+ICsg
ICAgICAgICMgdGhlc2UgY2hlY2sgbWFjcm9zLiBTbywgd2UgaW5zZXJ0IHRoZSBmb2xsb3dpbmcg
bGluZXMgdG8gbWFudWFsbHkNCj4+ICsgICAgICAgICMgc2V0IHRoZXNlIG91dHB1dCB2YXJpYWJs
ZXMgdG8gdGhlIGNvcnJlY3QgdmFsdWUgaW4gImNvbmZpZ3VyZS5hYyIuDQo+PiArDQo+PiArICAg
ICAgICAjIE5vdGUgdGhhdCBIQVZFX0REX0NPTU1BTkQgYW5kIEhBVkVfTUtFMkZTX0NPTU1BTkQg
YXJlIG9ubHkgZXZlciB1c2VkDQo+PiArICAgICAgICAjIGluIHRlc3RzL01ha2VmaWxlLWZpbGVz
IHdoaWNoIGRldGVybWluZXMgd2hldGhlciB0byBpbmNsdWRlIHRoZSB0ZXN0DQo+PiArICAgICAg
ICAjIGNhc2VzLiBBcyBmb3Igb3V0cHV0IHZhcmlhYmxlcyBDSE1PRCwgREQsIGFuZCBNS0UyRlMs
IHRoZXkgb25seQ0KPj4gKyAgICAgICAgIyBwb2ludCB0byB0aGUgcHJvZ3JhbXMgd2hpY2ggdGVz
dCBjYXNlcyBuZWVkIHRvIHJ1bi4gU2luY2UgdGhlc2UNCj4+ICsgICAgICAgICMgY29tbWFuZHMg
YXJlIGd1YXJhbnRlZWQgdG8gYmUgcHJlc2VudCBkdWUgdG8gUkRFUEVORFMgYW5kIGFyZQ0KPj4g
KyAgICAgICAgIyBndWFyYW50ZWVkIHRvIGJlIGFjY2Vzc2libGUgdW5kZXIgUEFUSCBlbnZpcm9u
bWVudCB2YXJpYWJsZSBvbiB0aGUNCj4+ICsgICAgICAgICMgdGFyZ2V0LCB3ZSBvbmx5IG5lZWQg
dG8gc3BlY2lmeSB0aGUgbmFtZSBvZiB0aGVzZSBwcm9ncmFtcy4NCj4+ICsNCj4+ICsgICAgICAg
IHBlcmwgLWkgLTA3NzcgLXBlICdzLyheZG5sXHMqPStccypeZG5sXHMqQ2hlY2tzIGZvciBjb21w
aWxlciBmbGFnc1xzKl5kbmxccyo9KykvDQo+PiArQUNfU1VCU1QoW0NITU9EXSwgJ2NobW9kJykN
Cj4+ICtBQ19TVUJTVChbRERdLCAnZGQnKQ0KPj4gK0FDX1NVQlNUKFtNS0UyRlNdLCAnbWtlMmZz
JykNCj4+ICtBTV9DT05ESVRJT05BTChbSEFWRV9ERF9DT01NQU5EXSwgW3RydWVdKQ0KPj4gK0FN
X0NPTkRJVElPTkFMKFtIQVZFX01LRTJGU19DT01NQU5EXSwgW3RydWVdKQ0KPj4gK1wxL21zJyAi
JHtXT1JLRElSfS9naXQvY29uZmlndXJlLmFjIg0KPj4gKyAgICBmaQ0KPj4gK30NCj4+ICsNCj4+
ICtkb19pbnN0YWxsX3B0ZXN0KCkgew0KPj4gKyAgICBybSAtcmYgIiR7RH0ke1BURVNUX1BBVEh9
LyoiDQo+PiArICAgIGNwIC1yIC4uL2J1aWxkICIke0R9JHtQVEVTVF9QQVRIfSINCj4+ICsgICAg
Y3AgLXIgIiR7U30vYnVpbGQtYXV4IiAiJHtEfSR7UFRFU1RfUEFUSH0vYnVpbGQiDQo+PiArICAg
IGNwIC1yICIke1N9IiAiJHtEfSR7UFRFU1RfUEFUSH0iDQo+PiArfQ0KPj4gKw0KPj4gK1JERVBF
TkRTOiR7UE59LXB0ZXN0ICs9ICJiYXNoIGNvcmV1dGlscyBlMmZzcHJvZ3MgZTJ0b29scyBnYXdr
IG1ha2UgcGVybCINCj4+DQo+PiAgQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUiDQo+PiBkaWZmIC0t
Z2l0IGEvbWV0YS1maWxlc3lzdGVtcy9yZWNpcGVzLXV0aWxzL2UydG9vbHMvZmlsZXMvcnVuLXB0
ZXN0IGIvbWV0YS1maWxlc3lzdGVtcy9yZWNpcGVzLXV0aWxzL2UydG9vbHMvZmlsZXMvcnVuLXB0
ZXN0DQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwLi4zZDRkZDlj
ZjMNCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL21ldGEtZmlsZXN5c3RlbXMvcmVjaXBlcy11
dGlscy9lMnRvb2xzL2ZpbGVzL3J1bi1wdGVzdA0KPj4gQEAgLTAsMCArMSw1IEBADQo+PiArIyEv
YmluL3NoDQo+PiArDQo+PiArc2V0IC1lDQo+PiArDQo+PiArbWFrZSAtQyBidWlsZCBjaGVjaw0K
Pj4gLS0NCj4+IDIuNDMuMA0KPj4NCj4+DQo+PiANCg==

