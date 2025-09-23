Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 172D9CAC5A5
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 06:18:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10410.1758608284696472780
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Sep 2025 23:18:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WN1ecesy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1361603e9f=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58N506X82117219
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 06:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=5lQP2UO43XwtUxYVkDW6hN
	FwZ9zJ2/KJjZP7YSHQaXg=; b=WN1ecesy4mL6AhHC8e/KKByLBAaSNm4JtcVJnh
	FlwXkWvzqGZ+QONaDlfI/ku5sVuf3XxW6jOcWswkXWzn30BwyUlilmf82fr4qD3q
	s/KHavBbGMHNS663SVddLMiFLL+33qRQgOy3jUiImc0msdTlmIRUFsm6Gh1c4fLv
	v7UxklsIqpCpmWDCEFxwCbpFpMwyrp++Q3x3KqePHalyjFxtYicA4XjP77c4dZRE
	CvTT03cdxeS4giaUThzbmIJqmXk1+2ERN7h1w2C2WavprLBLiKhqbjUQGuPWf6Xc
	PdbWy7wGsAqB3/xqtZdu1seOZT3Stkr9oUJqf+5ZrxuknlmQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011067.outbound.protection.outlook.com [40.93.194.67])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499hg1jsxc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Sep 2025 06:18:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pG92KDJ22NhDFQu2QdXME3Hwhx+kkJfLWYuY42ftsZzV2O1cV/dxnlVWrHxMzPyALuCp/J9JgqjzXI92ryHBoA1JnRbapHeqJpx7eygCpj4g6W2Nlor10EifwmnbFeKY8p2fNW47yLnG3iGoRdMDIFE5Fjlss4cCA7+7jFiSJKNH5MqKB4CgqYYDgjFimnE+7x13JpuUiD4U04SQczekDfPWoHNn5KjvUZpUO17NFoCkpzLaLgc2IV+HmZY+RhxIDDOm0sWJe+SQMKE6rjvUiDfkRk+yofleQZun2zddCWT9b8zz1IAKbtEtu4s8T+SuSYyYjB8R71rp9XUzq+upsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lQP2UO43XwtUxYVkDW6hNFwZ9zJ2/KJjZP7YSHQaXg=;
 b=sHjy236e+FeSJ4c8EDEP83pmfevyTysG3Iy4Ex/rDZU3Y+BnKd642LNPv+K0FZZ6+NiGYL6wvopm5u5tIeMP+stDC7duSiNm0FhQEwh6zAiFGRBAT/UDmGNm0tJ7i5g3IlmPK3p2RNEyG6Oe8wyFhteW8WCRxoeyj+FUz/k3zHCiJBvkDEYDEMWmsVcaYklCFfZ6PZ1CuWNkB7jnAP7ipiFrikmqchr32NaBWFq308rl3spFS5GoKEZeprtbVhkqPlGWUlqAswGqwvREA/72P3cQVy3JwDvOHaFeIUXTWo3K84/ml4kKb3ZHOxb9Z83HbFtahaxjxFtLEceQkOerjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY8PR11MB7921.namprd11.prod.outlook.com (2603:10b6:930:7d::15)
 by DS0PR11MB8020.namprd11.prod.outlook.com (2603:10b6:8:114::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 23 Sep
 2025 06:17:59 +0000
Received: from CY8PR11MB7921.namprd11.prod.outlook.com
 ([fe80::9050:ad4d:49e1:e11a]) by CY8PR11MB7921.namprd11.prod.outlook.com
 ([fe80::9050:ad4d:49e1:e11a%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 06:17:59 +0000
From: "Sambu, Soumya" <Soumya.Sambu@windriver.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-python][kirkstone][PATCH 1/1] python3-twisted: Fix
 CVE-2024-41810
Thread-Topic: [oe][meta-python][kirkstone][PATCH 1/1] python3-twisted: Fix
 CVE-2024-41810
Thread-Index: AQHcJwlVMjOLGiFQsk6tDXCqBmt3x7SYMMEAgAghAYw=
Date: Tue, 23 Sep 2025 06:17:59 +0000
Message-ID: 
 <CY8PR11MB7921B12CBCE9736AD7025E7D811DA@CY8PR11MB7921.namprd11.prod.outlook.com>
References: <20250916125600.1274823-1-soumya.sambu@windriver.com>
 <b7132aa6ff32871bfd278cc97c643caff7c41314.camel@intel.com>
In-Reply-To: <b7132aa6ff32871bfd278cc97c643caff7c41314.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: anuj.mittal@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-09-23T06:16:55.801Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7921:EE_|DS0PR11MB8020:EE_
x-ms-office365-filtering-correlation-id: 365adfe5-3a2e-4bfc-c72a-08ddfa68f1b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|4022899009|366016|376014|13003099007|8096899003|38070700021|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?81DvoJeC1gu+wWGWcDXf0MlLo84BCPYtLq/8x1JceidWeU53037OboA4lvAw?=
 =?us-ascii?Q?q0v9GR6acMbTMIu6p1XoqdN5X07IK3u20B9mBxevrox2ztJO33fTF0YD8xrd?=
 =?us-ascii?Q?Y5GNocVSl8SOr6zjt07v+0KCSU96or8JWcGBXg6olpgPeLFCKn4SAAkXg1H9?=
 =?us-ascii?Q?i3nl8XsAub/w53534sRkA9VJOLINgLyWDqskJHVRqbDMYJ3IllEZAq7jgP5w?=
 =?us-ascii?Q?WT7x2aAsKz6FfoDXOMt+vIoSCFU/7exIU6yfFgw+KK7LyV5SRVFIfZWZT13K?=
 =?us-ascii?Q?YYdC8Q8LqZs7afMzQtlysJxPWlzdYvx9XUj6HkhmiOgK0nWN57GcfpPvtIfK?=
 =?us-ascii?Q?vjFpdXCMv1ciGjMGHAc/CmIIz9+fBkslCHaFRK/aUQNQiNF04MsFFY8M7ASw?=
 =?us-ascii?Q?YJKWFCd5dw/ZbwIbmcmSJZehYFNsUifNhvUpX2ee2VD6YoXdZ9r6X40b+NE1?=
 =?us-ascii?Q?OX90Oyfljuhn//TnMXdIbI7mK8aPKXWhtsoyAB4n9LwFervN97erTU6Cu2G2?=
 =?us-ascii?Q?2QDk9596OKGrE6ZzBAKDNWH4VFQQVgdUSp6hwCydp8PuvxIj1Gyqot5qjHp9?=
 =?us-ascii?Q?FCVkfmiBu0kl0DzaWKO4kGN9rNA1tEh7RXpgzhClOjpI1wx1k+N1+ZerV763?=
 =?us-ascii?Q?+6lMvP+vMe0nlQ/y86XLsxKHz3BcaNkfPwzq7h8bH3hhEK760fwWkuRwin8v?=
 =?us-ascii?Q?4QXnlNEApLH8WAf4HRasqFpNy85TWZ58kycUw0h+AB6QGwcFiA9+mjPatoYu?=
 =?us-ascii?Q?3DK+LNAlcppFTCXrm6ZYZ5OokO/QsknzYMbaXwmiS1LsCPRjulHayuDarOSQ?=
 =?us-ascii?Q?tFa96GQFKQWZsD4453MFWx4hyasTPfWaIy711UVTgzQG23AzmnxNxHDD7vxu?=
 =?us-ascii?Q?0WTSfHBD9PkhUBBFMNsguc+9xDBAjHo/aS4Sd7V8iuTCi+poCB/vqRTYVu+7?=
 =?us-ascii?Q?zAB+8tE5BYg3YuNYZc46O/k/jH7NmHu2CLX3K+WjRf4YIU8TIVNkXryM8us9?=
 =?us-ascii?Q?sRaNjCvzXNg/TIAS2TiJ6a3PPrTaRpNLSVMm0CF1y7HAJga2o0cBDv1yq5ZI?=
 =?us-ascii?Q?YgKjKBaU3lIV8Sa0aoZ5PY0qf/ksjzz3PcicxU92HPhdasiI4KEL6/2++0Tx?=
 =?us-ascii?Q?n5uyuzG52RYC7mhkBThxCPvtHSFI70qc8JCuGJ3gFiJCtVWTyAVdY9Zs3pdY?=
 =?us-ascii?Q?jkLFwPJotrgQgrckE7uUja/PoeW5EDRHhz65PEUEfnc6Jeq+030UiScsDpLB?=
 =?us-ascii?Q?KNAdB+sVDyxXsHLyu5CtfbdssL3zamzjGj2f5XmsI0zMnBeW4fZKYBUcIFDu?=
 =?us-ascii?Q?0eT2urHRIEzEZEQkDRg25hn3sPtO9C4kgo0RwQdr1rZ/SuW73sXshhJc4uHY?=
 =?us-ascii?Q?UlrKTBHIkRbR0p+gEG3tmnI6llw9jHW0L8Cym0vwiFb0bM739FRsPj3weknB?=
 =?us-ascii?Q?eL7LrEhevo8=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7921.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014)(13003099007)(8096899003)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?tULe6UBwktagCR+u6a7BiXpvd1orRt9HRPSEfY86qMfUsMl/GfmwJ6BDiBQH?=
 =?us-ascii?Q?pi60u4RVSVFVLS5qDWRbd7sd/0uDoAluiI5fXSW55oLyAC/zNHulYGmjkXig?=
 =?us-ascii?Q?rPYPCPfqi8lADjiABipPUpAesZ5Ju8HclFcO9fAUOmMqb9mSvC995u3ZwJzl?=
 =?us-ascii?Q?Vnxh6khjGrqpxrVjVS4YJpb48SOFahClz3sRWYz9TNLjMnGwDYK1KRG7wIRC?=
 =?us-ascii?Q?agLVotHDwuLt+b1LQ6di6LcSAOQ7XxtwheHXDu2sMbjefraJrYih2hjUvtXu?=
 =?us-ascii?Q?s8s/IOlBWNJDe70lsFjny8Yzlfy4YHgffsBtsEGmIW1sDCNUNMqAxPC/Z5MZ?=
 =?us-ascii?Q?9edp06O9pwYnMrJGO6vbajrBl6RfFHEKpkblSYUGbZMFCwiyKhOOedkfDxpB?=
 =?us-ascii?Q?RsWS27IMcJyqbN8s6NNrR4gkegbU4DnKW2jr4GaA/UETSl4+Laa5C0qMTmra?=
 =?us-ascii?Q?A2QQ9uL+7/tHEzI+SKHfBlFK/bYO+YSiZYoxWwpN8MMDRTRRg9eBxcWT1tID?=
 =?us-ascii?Q?NipEVTRt5zzpZmPJ8rBg8WKyXNXekofktTOdwxQMAtvzQ4/ZLufQ/3u84AYv?=
 =?us-ascii?Q?zHW03to/2dZfcTjByTWxEKS2RkMaZubh7r77c3kNeX+Q5qu8g8IFDqtvukqw?=
 =?us-ascii?Q?g6Bp8/KBgOg33dmiV053g9emr2391hGZoRZv8g4ow+pHLe4AhAUOpOa2vpvA?=
 =?us-ascii?Q?FCIfDWO7MuqazerbHlGz79E8qKmMfzqBj5XsmN+o+zJqGx7K4rlsYFEuPtLI?=
 =?us-ascii?Q?LaqgzPp7+xHY5ZCQZ44pjdSeS4bjZj5Jw1VMZJWmE0zz/mY5qN7ZF4rn2fgD?=
 =?us-ascii?Q?W+2LPV8StmYKLuvpXDO/00v+R8/oa5jectOIEt1/pguhbLYY3OQ4lI2a/eZd?=
 =?us-ascii?Q?l9eu1NP8PGyazt94RHEdvnSW6ZTKYfzdJ1mWYZiNWVuN8C6PryjH7mIF+yhc?=
 =?us-ascii?Q?6A0PxUx/PXUtp+rKT4BenjmKrvBpoIBYj5oBZi431oEYmblV3h9URcKUEkWJ?=
 =?us-ascii?Q?1d4WghouCfSnCP5r+rwahfoAnazY98pKB2upEDCCIkZax9LG5bwRbfXLB1EM?=
 =?us-ascii?Q?EhPt+aPJhMUmyO0XiQ4l1TmCAk3yVxEO3ZZ+LdhK9j+ogfownxzCeUi0MK6x?=
 =?us-ascii?Q?AmGFxcOeceqwt1t3dakb2H2KWpB+sLtaID6M1ogKG9m4uE7Cxn7jEuf6d+lx?=
 =?us-ascii?Q?6PD4qfhQCgpbqYunH1ysVvcOIrTM8+K2ejyveYt+jEOO6pHS0EPIu+Ei6usp?=
 =?us-ascii?Q?l8lb2vZsCTpcrymKJgXY1T4vrn71j7No+wdfHlWy++rlcHUEpnTCSxGdbW8E?=
 =?us-ascii?Q?nm8UbELeKCDxxfWTPhhkvq6gd/rkrWpPNmRv51tIMadBoDb4NZLlw8c8KwmZ?=
 =?us-ascii?Q?9qfILYc7ok4lWW8dtGdNSeGEsuaa+KUUsfp5QNbRNIymbevhQYW64d7wLZ+B?=
 =?us-ascii?Q?Zq93nn44bkf1KPsPion5ac4CdMMel9yc7RfICNhB+xzPm+Q8B9Khl/94C468?=
 =?us-ascii?Q?JpxJ+RN27//u3PRONWvAQA2NbRvhf7ACMLWLbNkYb+zgkBT04BMjj4hysIb7?=
 =?us-ascii?Q?wU8znJZsgi9TUCNIoscrx+oBmZyuh90GKxt68Whx0moHPesjxh5MXMRX+/gd?=
 =?us-ascii?Q?cA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_CY8PR11MB7921B12CBCE9736AD7025E7D811DACY8PR11MB7921namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7921.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 365adfe5-3a2e-4bfc-c72a-08ddfa68f1b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 06:17:59.5410
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rGiffIIIXj102DS4kmVLQUjIcfiIgiIKo9t8kOBNCFwuEallUPlikO6D51zKezP7d0YM8vHd1QXG/3MEJioivWDfchWWhkNE6xkyhaZZ17o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8020
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: xhbFMFqocWxRwdaFEVwQLUADw2X_N4ns
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDA1NyBTYWx0ZWRfX87rtSuKyMVP6
 NG1z8jycPINyok+eSmKLdKbSfWpS4Cbi+6/Ka9rQWS0cYRB4Zyti/4aGvUgcxCDDINav1+7Qur7
 SxxKS0MxIVtJmmfcNJbyw5SAhfyaudDpppQo8DaFlK80UyeebtkZZkDb+2b2W6nYVp/y7PnzsXq
 056a9kjcpPRR1FVFCImbkpH71NR2dwD20gt7j627OpBTERc9371Kik++yQtyXSIrpKJ4053dqhq
 yT+3DdnEkG90j2FAGUoyIgFguvrRTVqRpHkizokiLyhNhqAC5dmBv6FMvRvitO75pR0yTgQOxhb
 YaUVcs07WOlNl4IDKp25Bbn4W9aaF5XpqA8qhWaufFXo5u3IaCvvYsGF6VMr7s=
X-Authority-Analysis: v=2.4 cv=Yfi95xRf c=1 sm=1 tr=0 ts=68d23b9b cx=c_pps
 a=m7Xu73pz8xWBtfo2USfVfA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=Q4-j1AaZAAAA:8 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=A1X0JdhQAAAA:8
 a=PmPdvnPKAAAA:8 a=QyXUC8HyAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=d9hvpmU5ACsOOUNXA58A:9 a=Ft01igJXj0jPiUNu:21 a=L03L2QfmqWoA:10
 a=1WNtSb5ECZgA:10 a=CjuIK1q_8ugA:10 a=4yogH_tMpKF3yPcCbG4A:9
 a=BMrdGH4Wr5Xx2cU3:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=ZCh4QoaBVut9GMebS46n:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: cQQTaCYvt8VEmIH1pDqQvz0BnXH7nMGQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 06:18:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119649

--_000_CY8PR11MB7921B12CBCE9736AD7025E7D811DACY8PR11MB7921namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

@Mittal, Anuj<mailto:anuj.mittal@intel.com> Thanks for pointing this out. W=
hile CVE-2024-41810 was previously addressed in CVE-2024-41671-0001.patch<h=
ttps://git.openembedded.org/meta-openembedded/tree/meta-python/recipes-devt=
ools/python/python3-twisted/CVE-2024-41671-0001.patch?h=3Dscarthgap> for th=
e scarthgap branch, I've now submitted<https://lists.openembedded.org/g/ope=
nembedded-devel/topic/meta_python_scarthgap_patch/115390026> a dedicated pa=
tch to improve traceability.

Regards,
Soumya
________________________________
From: Mittal, Anuj <anuj.mittal@intel.com>
Sent: Thursday, September 18, 2025 7:26 AM
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>; Sambu, Soumya <Soumya.Sambu@windriver.com>
Subject: Re: [oe][meta-python][kirkstone][PATCH 1/1] python3-twisted: Fix C=
VE-2024-41810

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Tue, 2025-09-16 at 18:26 +0530, Soumya via lists.openembedded.org
wrote:
> From: Soumya Sambu <soumya.sambu@windriver.com>
>
> Twisted is an event-based framework for internet applications,
> supporting Python 3.6+.
> The `twisted.web.util.redirectTo` function contains an HTML injection
> vulnerability.
> If application code allows an attacker to control the redirect URL
> this vulnerability
> may result in Reflected Cross-Site Scripting (XSS) in the redirect
> response HTML body.
> This vulnerability is fixed in 24.7.0rc1.

This CVE is applicable to scarthgap too. Can you send a patch for that
branch as well please?

Thanks,

Anuj

>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2024-41810
>
> Upstream patch:
> https://github.com/twisted/twisted/commit/046a164f89a0f08d3239ecebd750360=
f8914df33
>
> Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> ---
>  .../python3-twisted/CVE-2024-41810.patch      | 109
> ++++++++++++++++++
>  .../python/python3-twisted_22.2.0.bb          |   3 +-
>  2 files changed, 111 insertions(+), 1 deletion(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-
> twisted/CVE-2024-41810.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-
> 2024-41810.patch b/meta-python/recipes-devtools/python/python3-
> twisted/CVE-2024-41810.patch
> new file mode 100644
> index 0000000000..c0842304dc
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-
> 41810.patch
> @@ -0,0 +1,109 @@
> +From 046a164f89a0f08d3239ecebd750360f8914df33 Mon Sep 17 00:00:00
> 2001
> +From: Adi Roiban <adiroiban@gmail.com>
> +Date: Mon Jul 29 14:28:03 2024 +0100
> +Subject: [PATCH] Merge commit from fork
> +
> +Added HTML output encoding the "URL" parameter of the "redirectTo"
> function
> +
> +CVE: CVE-2024-41810
> +
> +Upstream-Status: Backport
> [https://github.com/twisted/twisted/commit/046a164f89a0f08d3239ecebd7
> 50360f8914df33]
> +
> +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> +---
> + src/twisted/web/_template_util.py          |  2 +-
> + src/twisted/web/newsfragments/12263.bugfix |  1 +
> + src/twisted/web/newsfragments/9839.bugfix  |  1 +
> + src/twisted/web/test/test_util.py          | 39
> +++++++++++++++++++++-
> + 4 files changed, 41 insertions(+), 2 deletions(-)
> + create mode 100644 src/twisted/web/newsfragments/12263.bugfix
> + create mode 100644 src/twisted/web/newsfragments/9839.bugfix
> +
> +diff --git a/src/twisted/web/_template_util.py
> b/src/twisted/web/_template_util.py
> +index bd081bd..3fb56e5 100644
> +--- a/src/twisted/web/_template_util.py
> ++++ b/src/twisted/web/_template_util.py
> +@@ -92,7 +92,7 @@ def redirectTo(URL: bytes, request: IRequest) ->
> bytes:
> +     </body>
> + </html>
> + """ % {
> +-        b"url": URL
> ++        b"url": escape(URL.decode("utf-8")).encode("utf-8")
> +     }
> +     return content
> +
> +diff --git a/src/twisted/web/newsfragments/12263.bugfix
> b/src/twisted/web/newsfragments/12263.bugfix
> +new file mode 100644
> +index 0000000..b3982ca
> +--- /dev/null
> ++++ b/src/twisted/web/newsfragments/12263.bugfix
> +@@ -0,0 +1 @@
> ++twisted.web.util.redirectTo now HTML-escapes the provided URL in
> the fallback response body it returns (GHSA-cf56-g6w6-pqq2). The
> issue is being tracked with CVE-2024-41810.
> +\ No newline at end of file
> +diff --git a/src/twisted/web/newsfragments/9839.bugfix
> b/src/twisted/web/newsfragments/9839.bugfix
> +new file mode 100644
> +index 0000000..1e2e7f7
> +--- /dev/null
> ++++ b/src/twisted/web/newsfragments/9839.bugfix
> +@@ -0,0 +1 @@
> ++twisted.web.util.redirectTo now HTML-escapes the provided URL in
> the fallback response body it returns (GHSA-cf56-g6w6-pqq2, CVE-2024-
> 41810).
> +diff --git a/src/twisted/web/test/test_util.py
> b/src/twisted/web/test/test_util.py
> +index 996b0d0..87282ce 100644
> +--- a/src/twisted/web/test/test_util.py
> ++++ b/src/twisted/web/test/test_util.py
> +@@ -5,7 +5,6 @@
> + Tests for L{twisted.web.util}.
> + """
> +
> +-
> + import gc
> +
> + from twisted.internet import defer
> +@@ -64,6 +63,44 @@ class RedirectToTests(TestCase):
> +         targetURL =3D "http://target.example.com/4321"
> +         self.assertRaises(TypeError, redirectTo, targetURL,
> request)
> +
> ++    def test_legitimateRedirect(self):
> ++        """
> ++        Legitimate URLs are fully interpolated in the `redirectTo`
> response body without transformation
> ++        """
> ++        request =3D DummyRequest([b""])
> ++        html =3D redirectTo(b"https://twisted.org/", request)
> ++        expected =3D b"""
> ++<html>
> ++    <head>
> ++        <meta http-equiv=3D\"refresh\"
> content=3D\"0;URL=3Dhttps://twisted.org/\">
> ++    </head>
> ++    <body bgcolor=3D\"#FFFFFF\" text=3D\"#000000\">
> ++    <a href=3D\"https://twisted.org/\">click here</a>
> ++    </body>
> ++</html>
> ++"""
> ++        self.assertEqual(html, expected)
> ++
> ++    def test_maliciousRedirect(self):
> ++        """
> ++        Malicious URLs are HTML-escaped before interpolating them
> in the `redirectTo` response body
> ++        """
> ++        request =3D DummyRequest([b""])
> ++        html =3D redirectTo(
> ++
> b'https://twisted.org/"><script>alert(document.location)</script>',
> request
> ++        )
> ++        expected =3D b"""
> ++<html>
> ++    <head>
> ++        <meta http-equiv=3D\"refresh\"
> content=3D\"0;URL=3Dhttps://twisted.org/&quot;&gt;&lt;script&gt;alert(doc
> ument.location)&lt;/script&gt;\">
> ++    </head>
> ++    <body bgcolor=3D\"#FFFFFF\" text=3D\"#000000\">
> ++    <a
> href=3D\"https://twisted.org/&quot;&gt;&lt;script&gt;alert(document.loc
> ation)&lt;/script&gt;\">click here</a>
> ++    </body>
> ++</html>
> ++"""
> ++        self.assertEqual(html, expected)
> ++
> +
> + class ParentRedirectTests(SynchronousTestCase):
> +     """
> +--
> +2.40.0
> +
> diff --git a/meta-python/recipes-devtools/python/python3-
> twisted_22.2.0.bb b/meta-python/recipes-devtools/python/python3-
> twisted_22.2.0.bb
> index da83f0123a..ef602890ea 100644
> --- a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
> @@ -12,7 +12,8 @@ SRC_URI[sha256sum] =3D
> "57f32b1f6838facb8c004c89467840367ad38e9e535f8252091345dba5
>  PYPI_PACKAGE =3D "Twisted"
>
>  SRC_URI +=3D "file://CVE-2024-41671-0001.patch \
> -            file://CVE-2024-41671-0002.patch"
> +            file://CVE-2024-41671-0002.patch \
> +            file://CVE-2024-41810.patch"
>
>  inherit pypi python_setuptools_build_meta
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119466):
> https://lists.openembedded.org/g/openembedded-devel/message/119466
> Mute This Topic: https://lists.openembedded.org/mt/115272024/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub [
> anuj.mittal@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

--_000_CY8PR11MB7921B12CBCE9736AD7025E7D811DACY8PR11MB7921namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<a class=3D"tWKOu mention ms-bgc-nlr ms-fcl-b" id=3D"OWAAM759778" href=3D"m=
ailto:anuj.mittal@intel.com">@Mittal, Anuj</a>&nbsp;Thanks for pointing thi=
s out. While CVE-2024-41810 was previously addressed in
<a title=3D"https://git.openembedded.org/meta-openembedded/tree/meta-python=
/recipes-devtools/python/python3-twisted/CVE-2024-41671-0001.patch?h=3Dscar=
thgap" id=3D"LPlnk619752" href=3D"https://git.openembedded.org/meta-openemb=
edded/tree/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-416=
71-0001.patch?h=3Dscarthgap">
CVE-2024-41671-0001.patch</a>&nbsp;for the scarthgap branch, I've now <a ti=
tle=3D"https://lists.openembedded.org/g/openembedded-devel/topic/meta_pytho=
n_scarthgap_patch/115390026" id=3D"LPlnk566753" href=3D"https://lists.opene=
mbedded.org/g/openembedded-devel/topic/meta_python_scarthgap_patch/11539002=
6">
submitted</a>&nbsp;a dedicated patch to improve traceability.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Soumya</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Mittal, Anuj &lt;anuj=
.mittal@intel.com&gt;<br>
<b>Sent:</b> Thursday, September 18, 2025 7:26 AM<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;; Sambu, Soumya &lt;Soumya.Sambu@windriver.com&g=
t;<br>
<b>Subject:</b> Re: [oe][meta-python][kirkstone][PATCH 1/1] python3-twisted=
: Fix CVE-2024-41810</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Tue, 2025-09-16 at 18:26 +0530, Soumya via lists.openembedded.org<br>
wrote:<br>
&gt; From: Soumya Sambu &lt;soumya.sambu@windriver.com&gt;<br>
&gt;<br>
&gt; Twisted is an event-based framework for internet applications,<br>
&gt; supporting Python 3.6+.<br>
&gt; The `twisted.web.util.redirectTo` function contains an HTML injection<=
br>
&gt; vulnerability.<br>
&gt; If application code allows an attacker to control the redirect URL<br>
&gt; this vulnerability<br>
&gt; may result in Reflected Cross-Site Scripting (XSS) in the redirect<br>
&gt; response HTML body.<br>
&gt; This vulnerability is fixed in 24.7.0rc1.<br>
<br>
This CVE is applicable to scarthgap too. Can you send a patch for that<br>
branch as well please?<br>
<br>
Thanks,<br>
<br>
Anuj<br>
<br>
&gt;<br>
&gt; Reference:<br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2024-41810">https://nv=
d.nist.gov/vuln/detail/CVE-2024-41810</a><br>
&gt;<br>
&gt; Upstream patch:<br>
&gt; <a href=3D"https://github.com/twisted/twisted/commit/046a164f89a0f08d3=
239ecebd750360f8914df33">
https://github.com/twisted/twisted/commit/046a164f89a0f08d3239ecebd750360f8=
914df33</a><br>
&gt;<br>
&gt; Signed-off-by: Soumya Sambu &lt;soumya.sambu@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../python3-twisted/CVE-2024-41810.patch&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 109<br>
&gt; ++++++++++++++++++<br>
&gt;&nbsp; .../python/python3-twisted_22.2.0.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 3 +-<br>
&gt;&nbsp; 2 files changed, 111 insertions(+), 1 deletion(-)<br>
&gt;&nbsp; create mode 100644 meta-python/recipes-devtools/python/python3-<=
br>
&gt; twisted/CVE-2024-41810.patch<br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-<=
br>
&gt; 2024-41810.patch b/meta-python/recipes-devtools/python/python3-<br>
&gt; twisted/CVE-2024-41810.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..c0842304dc<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-<br=
>
&gt; 41810.patch<br>
&gt; @@ -0,0 +1,109 @@<br>
&gt; +From 046a164f89a0f08d3239ecebd750360f8914df33 Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt; +From: Adi Roiban &lt;adiroiban@gmail.com&gt;<br>
&gt; +Date: Mon Jul 29 14:28:03 2024 +0100<br>
&gt; +Subject: [PATCH] Merge commit from fork<br>
&gt; +<br>
&gt; +Added HTML output encoding the &quot;URL&quot; parameter of the &quot=
;redirectTo&quot;<br>
&gt; function<br>
&gt; +<br>
&gt; +CVE: CVE-2024-41810<br>
&gt; +<br>
&gt; +Upstream-Status: Backport<br>
&gt; [<a href=3D""></a>https://github.com/twisted/twisted/commit/046a164f89=
a0f08d3239ecebd7<br>
&gt; 50360f8914df33]<br>
&gt; +<br>
&gt; +Signed-off-by: Soumya Sambu &lt;soumya.sambu@windriver.com&gt;<br>
&gt; +---<br>
&gt; + src/twisted/web/_template_util.py&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-<br>
&gt; + src/twisted/web/newsfragments/12263.bugfix |&nbsp; 1 +<br>
&gt; + src/twisted/web/newsfragments/9839.bugfix&nbsp; |&nbsp; 1 +<br>
&gt; + src/twisted/web/test/test_util.py&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; | 39<br>
&gt; +++++++++++++++++++++-<br>
&gt; + 4 files changed, 41 insertions(+), 2 deletions(-)<br>
&gt; + create mode 100644 src/twisted/web/newsfragments/12263.bugfix<br>
&gt; + create mode 100644 src/twisted/web/newsfragments/9839.bugfix<br>
&gt; +<br>
&gt; +diff --git a/src/twisted/web/_template_util.py<br>
&gt; b/src/twisted/web/_template_util.py<br>
&gt; +index bd081bd..3fb56e5 100644<br>
&gt; +--- a/src/twisted/web/_template_util.py<br>
&gt; ++++ b/src/twisted/web/_template_util.py<br>
&gt; +@@ -92,7 +92,7 @@ def redirectTo(URL: bytes, request: IRequest) -&gt;=
<br>
&gt; bytes:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; &lt;/body&gt;<br>
&gt; + &lt;/html&gt;<br>
&gt; + &quot;&quot;&quot; % {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b&quot;url&quot;: URL<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b&quot;url&quot;: escape(=
URL.decode(&quot;utf-8&quot;)).encode(&quot;utf-8&quot;)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return content<br>
&gt; +<br>
&gt; +diff --git a/src/twisted/web/newsfragments/12263.bugfix<br>
&gt; b/src/twisted/web/newsfragments/12263.bugfix<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000..b3982ca<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/src/twisted/web/newsfragments/12263.bugfix<br>
&gt; +@@ -0,0 +1 @@<br>
&gt; ++twisted.web.util.redirectTo now HTML-escapes the provided URL in<br>
&gt; the fallback response body it returns (GHSA-cf56-g6w6-pqq2). The<br>
&gt; issue is being tracked with CVE-2024-41810.<br>
&gt; +\ No newline at end of file<br>
&gt; +diff --git a/src/twisted/web/newsfragments/9839.bugfix<br>
&gt; b/src/twisted/web/newsfragments/9839.bugfix<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000..1e2e7f7<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/src/twisted/web/newsfragments/9839.bugfix<br>
&gt; +@@ -0,0 +1 @@<br>
&gt; ++twisted.web.util.redirectTo now HTML-escapes the provided URL in<br>
&gt; the fallback response body it returns (GHSA-cf56-g6w6-pqq2, CVE-2024-<=
br>
&gt; 41810).<br>
&gt; +diff --git a/src/twisted/web/test/test_util.py<br>
&gt; b/src/twisted/web/test/test_util.py<br>
&gt; +index 996b0d0..87282ce 100644<br>
&gt; +--- a/src/twisted/web/test/test_util.py<br>
&gt; ++++ b/src/twisted/web/test/test_util.py<br>
&gt; +@@ -5,7 +5,6 @@<br>
&gt; + Tests for L{twisted.web.util}.<br>
&gt; + &quot;&quot;&quot;<br>
&gt; +<br>
&gt; +-<br>
&gt; + import gc<br>
&gt; +<br>
&gt; + from twisted.internet import defer<br>
&gt; +@@ -64,6 +63,44 @@ class RedirectToTests(TestCase):<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; targetURL =3D &quot;=
<a href=3D"http://target.example.com/4321">http://target.example.com/4321</=
a>&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.assertRaises(Ty=
peError, redirectTo, targetURL,<br>
&gt; request)<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp; def test_legitimateRedirect(self):<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Legitimate URLs are fully=
 interpolated in the `redirectTo`<br>
&gt; response body without transformation<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request =3D DummyRequest(=
[b&quot;&quot;])<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; html =3D redirectTo(b&quo=
t;https://twisted.org/&quot;, request)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; expected =3D b&quot;&quot=
;&quot;<br>
&gt; ++&lt;html&gt;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &lt;head&gt;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;meta http-equiv=3D\&q=
uot;refresh\&quot;<br>
&gt; content=3D\&quot;0;URL=3Dhttps://twisted.org/\&quot;&gt;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &lt;/head&gt;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &lt;body bgcolor=3D\&quot;#FFFFFF\&quot; text=3D\=
&quot;#000000\&quot;&gt;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &lt;a href=3D\&quot;<a href=3D"https://twisted.or=
g/\">https://twisted.org/\</a>&quot;&gt;click here&lt;/a&gt;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &lt;/body&gt;<br>
&gt; ++&lt;/html&gt;<br>
&gt; ++&quot;&quot;&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.assertEqual(html, ex=
pected)<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; def test_maliciousRedirect(self):<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Malicious URLs are HTML-e=
scaped before interpolating them<br>
&gt; in the `redirectTo` response body<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request =3D DummyRequest(=
[b&quot;&quot;])<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; html =3D redirectTo(<br>
&gt; ++<br>
&gt; b'<a href=3D"https://twisted.org/&quot;&gt;&lt;script&gt;alert(documen=
t.location)&lt;/script">https://twisted.org/&quot;&gt;&lt;script&gt;alert(d=
ocument.location)&lt;/script</a>&gt;',<br>
&gt; request<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; )<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; expected =3D b&quot;&quot=
;&quot;<br>
&gt; ++&lt;html&gt;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &lt;head&gt;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;meta http-equiv=3D\&q=
uot;refresh\&quot;<br>
&gt; content=3D\&quot;0;URL=3Dhttps://twisted.org/&amp;quot;&amp;gt;&amp;lt=
;script&amp;gt;alert(doc<br>
&gt; ument.location)&amp;lt;/script&amp;gt;\&quot;&gt;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &lt;/head&gt;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &lt;body bgcolor=3D\&quot;#FFFFFF\&quot; text=3D\=
&quot;#000000\&quot;&gt;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &lt;a<br>
&gt; href=3D\&quot;<a href=3D""></a>https://twisted.org/&amp;quot;&amp;gt;&=
amp;lt;script&amp;gt;alert(document.loc<br>
&gt; ation)&amp;lt;/script&amp;gt;\&quot;&gt;click here&lt;/a&gt;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &lt;/body&gt;<br>
&gt; ++&lt;/html&gt;<br>
&gt; ++&quot;&quot;&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.assertEqual(html, ex=
pected)<br>
&gt; ++<br>
&gt; +<br>
&gt; + class ParentRedirectTests(SynchronousTestCase):<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
&gt; +--<br>
&gt; +2.40.0<br>
&gt; +<br>
&gt; diff --git a/meta-python/recipes-devtools/python/python3-<br>
&gt; twisted_22.2.0.bb b/meta-python/recipes-devtools/python/python3-<br>
&gt; twisted_22.2.0.bb<br>
&gt; index da83f0123a..ef602890ea 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb<br=
>
&gt; +++ b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb<br=
>
&gt; @@ -12,7 +12,8 @@ SRC_URI[sha256sum] =3D<br>
&gt; &quot;57f32b1f6838facb8c004c89467840367ad38e9e535f8252091345dba5<br>
&gt;&nbsp; PYPI_PACKAGE =3D &quot;Twisted&quot;<br>
&gt;<br>
&gt;&nbsp; SRC_URI +=3D &quot;<a href=3D""></a>file://CVE-2024-41671-0001.p=
atch \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a=
 href=3D"file://CVE-2024-41671-0002.patch&quot;">file://CVE-2024-41671-0002=
.patch&quot;</a><br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a=
 href=3D"file://CVE-2024-41671-0002.patch">file://CVE-2024-41671-0002.patch=
</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a=
 href=3D"file://CVE-2024-41810.patch&quot;">file://CVE-2024-41810.patch&quo=
t;</a><br>
&gt;<br>
&gt;&nbsp; inherit pypi python_setuptools_build_meta<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#119466):<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/message=
/119466">https://lists.openembedded.org/g/openembedded-devel/message/119466=
</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11527202=
4/3616702">
https://lists.openembedded.org/mt/115272024/3616702</a><br>
&gt; Group Owner: openembedded-devel+owner@lists.openembedded.org<br>
&gt; Unsubscribe:<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/unsub">=
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<br>
&gt; anuj.mittal@intel.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
</div>
</span></font></div>
</body>
</html>

--_000_CY8PR11MB7921B12CBCE9736AD7025E7D811DACY8PR11MB7921namp_--

