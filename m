Return-Path: <libo.chen.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6BB8F8E4B4
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 07:07:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37184.1776409626052237607
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2026 00:07:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Caz2oIgp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=856723d307=libo.chen.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H5ug6i3559018
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 00:07:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=xOU3/HSgbqg7BGoS4A+ol0ZkAw+0IvIQwA/zsP89OeI=; b=
	Caz2oIgpLLIAaNo49KfmmHsOsEfYeZHmL8iyRcB91vHSrK6VmGTb+y5b4GdxcajW
	diZgvnmsn629QhZ5UenXNa6fLP/qXQ9iQ7nmQdb8nGZcOEl9WclQGOxfxCJnq2Xz
	P2/ZpbX1/wRpuuhMxFPijpc+6xk8eXhYTfJeYv84Y1VtVx1Y7/3YLqjqvmFg4zba
	pY/65V9NQBEBhYaKiBfppEEpiijW09Y0MPSxx1+YwLaaY1imIPMkHssHNAzte3nc
	VDlOZlLgcn6+pQzeIZm6xEjEK90rp9O0+uDyDhRP73Ii/wGwm1hDELjOgGgAj2tj
	KxH5sDatcUkIOGaKpSHXHw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010022.outbound.protection.outlook.com [52.101.85.22])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh87mvps4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Apr 2026 00:07:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHWoEKDce4fRhaHh8e2fkXg9+689jqFqzA/DdVHYadG8jWpiLBPhR2msxQKrS4v+2sAJkzaNG+qmnagVYjfp7+XJv3DY+9cqzuxxTZtrfPFPKYejMVGM8QLSSFDQrh8ur1dmpKto29BH41D38R6tzzrhufDG5Eb3LnbXTciz8cCtVDyMd0OLd1YYyvVAOAUmsixt4w1dN23Ezkzeku+Et8ZkOSSJFuD4mU2QfRdyk1WpS2zfRHjMQMRpxY8q/5OWi5puVR/fgCAp6+QWRahc0MdEhIMFdlbX4UoiJ6c7RVucPa8rVLYH0QDdOhfX2GzW6nSibLh0S4kqj4ly/zsukg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOU3/HSgbqg7BGoS4A+ol0ZkAw+0IvIQwA/zsP89OeI=;
 b=PAlmQ+W3RmVQfE4VQRe+dslfzoVKna4IgOsDejeolXtedbb3kdUGLZ8YnPu8nVGM7wXzfJt8LWsjZob/XI3RXguhr1leoeQQKGdhA/wFFFR+lRLVY30NIZnncp8pjnh4qJEpaYGvtDLpc6tZHA5sChF9g0QA+u/CieeC9zUmlqfcFggl0IgRWmfKi1HHh1B9qQsJ8YUlOVcvPx81GlCyeADlLs23YARmF4DvhGhdes7xPFI0P4yxIcvH1HQgIF6fWx/NZ71xPKblQeb5YAFy31H4BTVEcwOZzP9HvwCVP+4LkCblU9HtDjY1vJxbBFY45DlS007aglszqaR2y1aWzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN9PR11MB5354.namprd11.prod.outlook.com (2603:10b6:408:11b::7)
 by SJ5PPF3F833FA49.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::823) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 07:07:02 +0000
Received: from BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::4a0e:caa8:c2fa:8700]) by BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::4a0e:caa8:c2fa:8700%3]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 07:07:02 +0000
From: "Chen, Libo (CN)" <Libo.Chen.CN@windriver.com>
To: "anuj.mittal@oss.qualcomm.com" <anuj.mittal@oss.qualcomm.com>,
        "Wang,
 Jinfeng (CN)" <Jinfeng.Wang.CN@windriver.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][scarthgap][PATCH v2 08/11] hdf5: fix CVE-2025-2308
Thread-Topic: [oe] [meta-oe][scarthgap][PATCH v2 08/11] hdf5: fix
 CVE-2025-2308
Thread-Index: AQHcyLkjFb1kBXfg8UapYQUXdAXj3bXf0cyAgAMN+xA=
Date: Fri, 17 Apr 2026 07:07:01 +0000
Message-ID: 
 <BN9PR11MB5354B725CCC029112F10F0D1DE202@BN9PR11MB5354.namprd11.prod.outlook.com>
References: <20260410070508.1104455-1-jinfeng.wang.cn@windriver.com>
 <20260410070508.1104455-9-jinfeng.wang.cn@windriver.com>
 <CA+s=J=ztc7LcbsPH-QsFCSduqQX7Abqt=4Ve2S4s1ZSK4+DQkA@mail.gmail.com>
In-Reply-To: 
 <CA+s=J=ztc7LcbsPH-QsFCSduqQX7Abqt=4Ve2S4s1ZSK4+DQkA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=18e66673-d749-4eac-8c47-cc83d362aab6;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-04-17T07:05:46Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5354:EE_|SJ5PPF3F833FA49:EE_
x-ms-office365-filtering-correlation-id: 0fbce73b-e699-4ad0-0b8f-08de9c4fecc1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info: 
 wUOx+6Zpb369h5Xu0VXL0AuHy6QFi1M+H8WmTQV5U5HS5k+g6hNjH6ooXhpsCIiaImK1cw1ze+tlsfqFQWZmgIrB1Usxgw5YiOCFg2+gB3hKaoNKq+38xveSWyiX3h1P1b9Ari7RgShWp+8DYtcFjRrULMLwcgp/qjJb41hxEvGQpyaTcBoin1LlpVbqZDPWeIpia/Xc+qWIUxDwMI8ZRIckbiPUTFCBvU/+hK3o0cZ/OW+t7iH1rpHNt/py/cNhLPDIB+2ipldWU0drH7cjORbbMuzQhfdG92Y9MqnSMjvGXrFasc5EFtpWWQ4WsMSiu+cLeRsOjj3R5WS+H4lhgKkLTBugPxTu/p9O5e3fwR+Q+KYE/17kTDNXEdBAD09SYAsP4YRSO9aGAL4NvoWi86VDToYO5S8j+BwifnmK1cyye0sJVBd2fqeVwCb2MrXo2LiKCUEAmcmK79K+ToGy5OiZuSpLo5Fb/p4/Y2GmhDl17M8kAMIMN+v/AUvbdgROrBqDxiVTk9LCy9T09Kdvaky6dzzwPe42MskyEsj7tBoOZWbO81aBVVX4OJ6aQG2lZvSVuNgnq3K6ddc/PGpZq6hp7Z+i3qs+DLyMUyYlm5AaEeLJX9ZMmUJSd+OVBZYjItR3LJomjp7RXQm+F1WP0/lsMG2abX8bFuY9PW/Wsl7wbl2fG0AGRTvw77T1g8cUGzAVbwHiKk89AlUZ4HYts4HEdMaiQmP/6aEqFtf58cIiHt5fvO9sDUVHufb8JZTfdPUDla5p3ZWdSAfGAs7uLgkAaw57aRufp0V3oX74NVdt3hLjFG6qMSJflDdQoHjg
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5354.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?d1FjMDlYbjRHUDgzenQ5WHppM2dDSkhSY2lBUGRYUDVPTm5wQlBIWXNuMUxI?=
 =?utf-8?B?dzE2VVAraTl5VmtRMkxYcUhuRE9TMUJKZFRmcWJPS2lMNWZMbk9YQlllVy9Q?=
 =?utf-8?B?cC9jK21xOSsxc0h1d052U0ptTEZhejhXYUxBaUtBUmRWK3BWTGNJVGt3YnNh?=
 =?utf-8?B?YlV5eCtsT2pTbW9FL3NQc1hYL2o3b3F5UGJOd0JnMENWRFQwT2hyVFlSOXFr?=
 =?utf-8?B?azNaUGRkQ1ZRNGtFWlRaMStWQXdkTUszSGN6WVhDRUFqc0dUdEhVbXBNYmZU?=
 =?utf-8?B?SnIrVGZBeGNDc3ZIUVZZTGQ1SFlEL2c5Z2htTjc5UkpuVHh2Uk5aMUExQTRp?=
 =?utf-8?B?MVdCbEk5ZXdmd2k3eExMWWxUTTNmbkRIZ2J4OXYvOXRyUFNPdnE1anBpNDkr?=
 =?utf-8?B?bndaUGNDMDJ4M0xHYVBuOTNRWGtxWUQ0SFJQaTN1eUQ3WUIwb1JKMTVaSitZ?=
 =?utf-8?B?SXQ3a3F4bTZyVWdnZ1FhaVVHVjZaM3dGNFFUUElMSmExVVp6cWQrOVhlMUN1?=
 =?utf-8?B?cXF6QW5YVmI1NkFxVWJ1bW0wZG9teTNabDM3Q2xza0pGbUpEWmtYckZuU3F1?=
 =?utf-8?B?Um5sZ1pGR3B1Qzc3T2Q0Nk8rOWhBRHU1cEN0OWJWaW1vSEdNY2JhQTMrSGNa?=
 =?utf-8?B?bkdyaXN3eFBWRHhqVytEZkNyekFjUkZzQ3lKWk1XeDBHL2lHclVFeWlVcUpW?=
 =?utf-8?B?c1BScUY5L3lEQlBhQmJ3M0k5UHdIOHNodE9MZk1jd2pYQWNyMXRjTk9zTnMy?=
 =?utf-8?B?UjUwNDNybDVmNWxraFpGQm4rU25oc2NTRjhQcUQyWm9Qdkh3THJoa0EwaUZQ?=
 =?utf-8?B?Nk9rTGdWWTRpWUt6R0lLQmgxRWsrRnNBVnVlN0RiMXptdzBBaldTZ2RjcFNL?=
 =?utf-8?B?Nk1Obys0Q1ZoNlIzTEJlRXhJT2s0KzhPUlBVSHFFSFhIVThFczY3eTRuemlJ?=
 =?utf-8?B?Vk92MGFlSzZqblExQTlzSUthWWJKUGJYZGJ0QjlYQWh2bGdYN0V2cHFxQzY0?=
 =?utf-8?B?dDExMU9RNUlVRmFlU2NRYXFSR0JOYURBNExpLzRJdmZ6eGVmRDJ2SjNYaGd2?=
 =?utf-8?B?QjhVaHFjTmMvQ3ZweXV5YktKR05sMHJwZEkrSFhyL3l4VEMrd3J4TUJ4WW52?=
 =?utf-8?B?VTBaWklMZTZ5b0lONHJCQUkvNy9UT2x0bXh6ZFRGQjhYTU5mSE8vL3BwY0FZ?=
 =?utf-8?B?QnJlbjZUdmMwUmVKR29jQzA2YjFnMW1nWXU1ZjdxdHpIN21Lc29SUmxSSkpO?=
 =?utf-8?B?SzRzbGJqVzcvLzB1S0YxcHExVnZlYXY0UjNPSEh3QVBQcmRpejdzenFZdXpi?=
 =?utf-8?B?ZENGSEc5L09hTlVvUWxManNycTUxM3hOUEp1dlFQMkZlRXpCd2VLVWhsd0FL?=
 =?utf-8?B?V08xWE4xWEtaeW1ON3JmaU85MHhFdFh4cS9FMHIvenB1U1ZxbElMVEwwdkoz?=
 =?utf-8?B?bGM4ejcyZDZ5VnpUTDJHdUkvam9YaEpVcDlLejZ6aWRXTWluWmpEZEdvNTEx?=
 =?utf-8?B?d2RIbmVqMGJHV1ZhQzFHeW5jZ2s3TW94T2J6TVVkamp6S2xzNGxraGZ2NitU?=
 =?utf-8?B?UUQ2R2R1TWpDa2RCODhxNVU5MExxU2YzQ1FjRVozRG51aXpUcVM5bnVBUDl2?=
 =?utf-8?B?ZDNKcGJvbFVzYWNrVXNBOHd0SVp2TlA0dGppcEw3S240UVZlTHBublBQOHM1?=
 =?utf-8?B?V3VnajhWZWVuVHlaaXY3N21NRXNaNG1RcC9qbVhMM2c4VmZmeHZZQkNuR3hY?=
 =?utf-8?B?TXNjYUxLNjN1VjVrQkRiOUdEZFlFRlIrNXErMFlJT2VyZ1BiWEU3aUZBN2xO?=
 =?utf-8?B?QkRTUjJNTzk3ZktHSDI1d0FRMnlCeExaU3VTV1N6RE0vSjlldWExeFNmK3Nn?=
 =?utf-8?B?VzBLS2pBNVNkd1oxUjA0OXZoaTBjR3Y4T2xSVittcU84eTRrR3lieVlQSEVC?=
 =?utf-8?B?dWVxWGJxS2Znc3ZRaSs1NXNVb2M3K1Y0cnJJN1R4ZDNsMURMVkt3cEZreVpI?=
 =?utf-8?B?bEpjcDkxUENYZXVzN1RQSWJrb0pZWVNFamNHTlpEczRBUmY3VUYyWXNia1hF?=
 =?utf-8?B?UzRiQmVoK3hXK2R2VThlc1VuRzhmTW9Jcnd5NDJUVHNYUkd6SEg4Y0thY3lu?=
 =?utf-8?B?M0dMMnN0UFVTeHBMZ1Y4WEQxT0pyNGFxTCtqWFpEbnkzUitDZHdPSzI3UVNa?=
 =?utf-8?B?QXdxL1lwemdvaXhDWU5rRm5RU3JNZ2RvY0RzNGZSd1dHcXZnTVhVV2oxSDRw?=
 =?utf-8?B?VkVWU05sRWQ5RmJNa1RMWDNoNUNMT3JyMEt5cGtxQk5ZTjQzN0JWa2xvZ1Mv?=
 =?utf-8?B?U0U3Yis0cERvYW1Cbld4NmZOYmVCV2FPemFsaWU1a1dHOFlpVElBQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	NcrkzqpZ08ekuxuxFoVFV5SheVgYKxwDI9NLlDsIwO2Tmf1d5I1hVUWdp/ajeWbVXD5h/AenveTsu63mAbj4dqoxOPniJ72yVBkDQRA0NCyGp2VYfB/TF/kVB/NWB/5d4arViBg1mBwZaoTIt+ldEG1Thhmp96ofRYk8GYDIXF5Jb+pXOlUQolj9F+AVBGEXcs6QYtLbIjP0tYJl4XWQ1REpc3nXhytB5Rsljc5RZWgoz2U9uRm5dZK7W4PJLNIifnF7pDseoRRyRPdHIZxTnbR6BDctpL/+AfOsOn2Q8Ap4RCeB6Dqzfp3RfZTX6AUCZG5TObaNEupB+EGngk2BoA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5354.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fbce73b-e699-4ad0-0b8f-08de9c4fecc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2026 07:07:02.1597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XGS/h0q4KirVB70/lzJ/tikmEbQu3c9qlZ+bfd6ME7ujzkqasR3WcsKIaJp5/pPFH9LrbyRfyQWmrt7njnWGF722SjLdxfe6uo0brJNxfkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF3F833FA49
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA2OCBTYWx0ZWRfX+yIzLych/QKh
 yoc6fwylfUYDHSPEIjqy1QF8L4+ipA0CoIsAWraH8VQBWsMezbhfr3VDqwE2HW9AaU4Y8vhNNUX
 Kn0aDdzh3XowoNnXOyAg48IrAvBSbzoQnDNjnTTkk+wY1HxN+zmAzqhePj8GUpb616ewSTqGlyK
 RMc/jn3gthEJbH3Ezx0IflMCCueeextvn3wOGg/0AI040BdtcdD+o4cZh6ACdjHkBhR8OtyaN51
 0yvdXeqZm9yhjHYTcWFqoPvt6+gE+jlotgjRzvtxLByNmekqyUDaiF/9lnrGEQwpQy/JVX6aCZC
 OEFBwCzO0ynPO7UsOhsgraUVdkW/kw9QQrXrH9qfk+GBrphcoHbgQZv09LWCyl5JCnNpx0pCdjp
 IFsiG/GXQXh6f6Sq6nK77DHiqL0Rha60dR9/FgnR3qlvFCSE7jsIPCuGt/Q1nYGcyUcyRCtg7q0
 NFcqRSrH9eki+UWWuEA==
X-Proofpoint-ORIG-GUID: Bcmp3m_PtRx2dyZxpuF419YHa03aDy_R
X-Authority-Analysis: v=2.4 cv=GupyPE1C c=1 sm=1 tr=0 ts=69e1dc19 cx=c_pps
 a=0Qqeoa/8LQ4SOC89qm8Uhg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=Nv9ropGlmozstVHnj6sA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 5aZGNDhvBJayfgg8X8ItzDkkOt0RzPMc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 07:07:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126428

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IG9wZW5lbWJlZGRlZC1kZXZl
bEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+PG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgQW51aiBNaXR0YWwgdmlhDQo+bGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPlNlbnQ6IFdlZG5lc2RheSwgQXByaWwgMTUsIDIwMjYgNDoyNyBQTQ0KPlRv
OiBXYW5nLCBKaW5mZW5nIChDTikgPEppbmZlbmcuV2FuZy5DTkB3aW5kcml2ZXIuY29tPg0KPkNj
OiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPlN1YmplY3Q6IFJl
OiBbb2VdIFttZXRhLW9lXVtzY2FydGhnYXBdW1BBVENIIHYyIDA4LzExXSBoZGY1OiBmaXggQ1ZF
LTIwMjUtMjMwOA0KPg0KPkNBVVRJT046IFRoaXMgZW1haWwgY29tZXMgZnJvbSBhIG5vbiBXaW5k
IFJpdmVyIGVtYWlsIGFjY291bnQhDQo+RG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNo
bWVudHMgdW5sZXNzIHlvdSByZWNvZ25pemUgdGhlIHNlbmRlciBhbmQga25vdw0KPnRoZSBjb250
ZW50IGlzIHNhZmUuDQo+DQo+T24gRnJpLCBBcHIgMTAsIDIwMjYgYXQgMzowNeKAr1BNIFdhbmcs
IEppbmZlbmcgKENOKSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPjxKaW5mZW5nLldhbmcu
Q049d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+DQo+PiBG
cm9tOiBMaWJvIENoZW4gPGxpYm8uY2hlbi5jbkB3aW5kcml2ZXIuY29tPg0KPj4NCj4+IEFjY29y
ZGluZyB0byBbMV0sIEEgdnVsbmVyYWJpbGl0eSwgd2hpY2ggd2FzIGNsYXNzaWZpZWQgYXMgY3Jp
dGljYWwsDQo+PiB3YXMgZm91bmQgaW4gSERGNSAxLjE0LjYuIFRoaXMgYWZmZWN0cyB0aGUgZnVu
Y3Rpb24NCj4+IEg1Wl9fc2NhbGVvZmZzZXRfZGVjb21wcmVzc19vbmVfYnl0ZSBvZiB0aGUgY29t
cG9uZW50IFNjYWxlLU9mZnNldCBGaWx0ZXIuDQo+PiBUaGUgbWFuaXB1bGF0aW9uIGxlYWRzIHRv
IGhlYXAtYmFzZWQgYnVmZmVyIG92ZXJmbG93LiBBbiBhdHRhY2sgaGFzIHRvDQo+PiBiZSBhcHBy
b2FjaGVkIGxvY2FsbHkuIFRoZSBleHBsb2l0IGhhcyBiZWVuIGRpc2Nsb3NlZCB0byB0aGUgcHVi
bGljDQo+PiBhbmQgbWF5IGJlIHVzZWQuIFRoZSB2ZW5kb3IgcGxhbnMgdG8gZml4IHRoaXMgaXNz
dWUgaW4gYW4gdXBjb21pbmcgcmVsZWFzZS4NCj4+DQo+PiBCYWNrcG9ydCBwYXRjaCBbMl0gZnJv
bSB1cHN0cmVhbSB0byBmaXggQ1ZFLTIwMjUtMjMwOA0KPj4NCj4+IFsxXSBodHRwczovL252ZC5u
aXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyNS0yMzA4DQo+PiBbMl0NCj4+DQo+aHR0cHM6Ly9n
aXRodWIuY29tL0hERkdyb3VwL2hkZjUvY29tbWl0LzJjZTdmZGM0Y2YxNDdkMjgwYWE2ZDQ5Njg2
Mjk3Zg0KPj4gYWFjYzI1MGU0MA0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IExpYm8gQ2hlbiA8bGli
by5jaGVuLmNuQHdpbmRyaXZlci5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKaW5mZW5nIFdhbmcg
PGppbmZlbmcud2FuZy5jbkB3aW5kcml2ZXIuY29tPg0KPj4gLS0tDQo+PiAgLi4uL2hkZjUvZmls
ZXMvQ1ZFLTIwMjUtMjMwOC5wYXRjaCAgICAgICAgICAgIHwgMjEyMA0KPisrKysrKysrKysrKysr
KysrDQo+PiAgbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvaGRmNS9oZGY1XzEuMTQuNC0zLmJiIHwg
ICAgMSArDQo+PiAgMiBmaWxlcyBjaGFuZ2VkLCAyMTIxIGluc2VydGlvbnMoKykNCj4+ICBjcmVh
dGUgbW9kZSAxMDA2NDQNCj4+IG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2hkZjUvZmlsZXMvQ1ZF
LTIwMjUtMjMwOC5wYXRjaA0KPj4NCj4+IGRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtc3Vw
cG9ydC9oZGY1L2ZpbGVzL0NWRS0yMDI1LTIzMDgucGF0Y2gNCj4+IGIvbWV0YS1vZS9yZWNpcGVz
LXN1cHBvcnQvaGRmNS9maWxlcy9DVkUtMjAyNS0yMzA4LnBhdGNoDQo+PiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMC4uMTNiMDRiZjhhMQ0KPj4gLS0tIC9kZXYvbnVs
bA0KPj4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvaGRmNS9maWxlcy9DVkUtMjAyNS0y
MzA4LnBhdGNoDQo+PiBAQCAtMCwwICsxLDIxMjAgQEANCj4+ICtGcm9tIGNiY2U0YzJlY2Y2ZjU1
NTc2MDU4OTBlZWMxMjVlY2ZhYTQzNzExMzEgTW9uIFNlcCAxNyAwMDowMDowMA0KPj4gKzIwMDEN
Cj4+ICtGcm9tOiBMaWJvIENoZW4gPGxpYm8uY2hlbi5jbkB3aW5kcml2ZXIuY29tPg0KPj4gK0Rh
dGU6IEZyaSwgMzAgSmFuIDIwMjYgMTY6NDM6MDQgKzA4MDANCj4+ICtTdWJqZWN0OiBbUEFUQ0hd
IEZpeCBDVkUtMjAyNS0yMzA4ICgjNTk2MCkNCj4+ICsNCj4+ICtBIG1hbGZvcm1lZCBmaWxlIGNh
biBjYXVzZSB0aGUgc2NhbGUtb2Zmc2V0IGZpbHRlciB0byBoYXZlIHRvbyBsaXR0bGUgaW5wdXQg
ZGF0YQ0KPmNhdXNpbmcgYSBoZWFwIGJ1ZmZlciBvdmVyZmxvdy4gQWRkaXRpb25hbCBjaGVja3Mg
b24gdGhlIG1heGltdW0gYnVmZmVyIGxlbmd0aA0KPmFyZSByZXF1aXJlZCBkdXJpbmcgdGhlIGRl
Y29tcHJlc3Npb24uDQo+PiArDQo+PiArVGhpcyBQUiBmaXhlcyBDVkUtMjAyNS0yMzA4Lg0KPj4g
Kw0KPj4gK0NWRTogQ1ZFLTIwMjUtMjMwOA0KPj4gKw0KPj4gK1Vwc3RyZWFtLVN0YXR1czogQmFj
a3BvcnQNCj4+DQo+K1todHRwczovL2dpdGh1Yi5jb20vSERGR3JvdXAvaGRmNS9jb21taXQvMmNl
N2ZkYzRjZjE0N2QyODBhYTZkNDk2ODYyOQ0KPj4gKzdmYWFjYzI1MGU0MF0NCj4+ICsNCj4+ICtT
aWduZWQtb2ZmLWJ5OiBMaWJvIENoZW4gPGxpYm8uY2hlbi5jbkB3aW5kcml2ZXIuY29tPg0KPj4g
Ky0tLQ0KPj4gKyBzcmMvSDVac2NhbGVvZmZzZXQuYyAgICAgIHwgIDE3NyArKy0tDQo+PiArIHNy
Yy9INVpzY2FsZW9mZnNldC5jLm9yaWcgfCAxNzgxDQo+PiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPj4gKyAyIGZpbGVzIGNoYW5nZWQsIDE4ODYgaW5zZXJ0aW9ucygr
KSwgNzIgZGVsZXRpb25zKC0pICBjcmVhdGUgbW9kZQ0KPj4gKzEwMDY0NCBzcmMvSDVac2NhbGVv
ZmZzZXQuYy5vcmlnDQo+DQo+Q2FuIHlvdSBwbGVhc2UgZml4IHRoaXMgcGF0Y2ggYW5kIHJlc2Vu
ZD8NCj4NCj5UaGFua3MsDQo+DQo+QW51ag0KW0xpYm8+IF0gU29ycnksIGl0J3MgbXkgbWlzdGFr
ZS4gSSB3aWxsIHNlbmQgdGhlIGZpeGVkIHBhdGNoIHNvb24uDQo=

