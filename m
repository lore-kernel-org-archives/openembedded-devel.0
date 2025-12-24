Return-Path: <Liyin.Zhang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15C9E75446
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:45:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.117649.1766569513775837861
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:45:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Qd2FOQNo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=445348927d=liyin.zhang.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO8s5xx1466350
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 01:45:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=2y438bjrbYScu3f66f1ulBdfru6gl8hpsA6jsEpH6bo=; b=Qd2FOQNo9j26
	pWTiSgXHFAfY3M9T182Cqrn5KtdTDMXPmBWyXlVHef0n7iYT6bkWIOJb+ye2eUWR
	sMDPg0NHoW/AAsg/pmsSyivijZPN0v32elHX/uu2bJ1gmEa3yF3GIS/jHAn759ts
	CZu3/9G1K3AglQ8uC0szpghwjMIgJVVkN+ttgKLnpwNwoafpOtzHTVBA/2CsEDvG
	l8KSGVhRn+y/MnydqG53Y7A6qH60YC1qDUDSoP3X2VZMAQM2dnwNBc13XjTlZZIC
	wwF77HNy7qDGrPV5XLJRjBif7bpuYwaj1NHOPOdgQ2e0oPTk8jGeHRo07DC0Yo49
	DkORqglOLg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012019.outbound.protection.outlook.com [52.101.53.19])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5v6hbs42-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Dec 2025 01:45:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COZtMlqak3q+D9XJwD1oG6ToETkzoOtquN8w3YBXmn2haGvDlS4t96s898cHYlgcBxpYV27Sv464ZOeJXwWLisPMDTEkl0s37irPqKPyjahV9oeUjTWEB+L2emt9H4q+KSZ9C3JMkEMEj1b+VAFbsSYEeGVZof5k/0dWsvizE9raJ8FoKkizBeRfSFF+iRzPlOVkOtNuHKASpVP2OQOlcN1lMuSK+QazyHCNdX1svmY8hVa0BQcaRLTfKMBgAuzyabWfZdfby2NTPJwPMKScWlXqfTWb0QTnrJhBwuCf6J6LdgZaxzy+c0B64jVMUKBqs3rqtIyBG57y1cuEnEDcWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2y438bjrbYScu3f66f1ulBdfru6gl8hpsA6jsEpH6bo=;
 b=VCD3ZifLm2+koN3o6xAQDleVuaV3JscXdQDSSE4Gramq4ebzUq6LNxEpgYlXMM7TpF8VFmSPmEyiHjr8rmup4YfBiNWecpg+adiSxhySJwDL/O8CW+iQ9+hcXj+DHJavxQspoL1ORmyg1xnTiDl9KdZU8yOVebo9v3naya2ZGayXxw+qCFLReQF7FMIPKDTYQuuGDNpkiVFatMoV0F55asnBfTTody6WpkIUL6RzVhQkrxPv+2QSPSK+Jf+4RVcrdDwSZRn61DgExTtnvpKvpIKkvns87c0hep9/cpE1icVOfc7faeI2iiJYH/37foSWfuj1zUvj4hwPuVydpUbhjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW4PR11MB7077.namprd11.prod.outlook.com (2603:10b6:303:223::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 09:44:55 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 09:44:55 +0000
From: "Zhang, Liyin (CN)" <Liyin.Zhang.CN@windriver.com>
To: "valeria.petrov@spinetix.com" <valeria.petrov@spinetix.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        Khem Raj <raj.khem@gmail.com>
Subject: RE: [oe] [meta-oe][scarthgap][kirkstone][PATCH] apache2: upgrade
 2.4.65 -> 2.4.66
Thread-Topic: [oe] [meta-oe][scarthgap][kirkstone][PATCH] apache2: upgrade
 2.4.65 -> 2.4.66
Thread-Index: AQHcaIcgJCXmgxNgY0Og2bEuL+Z9ubUwoTTw
Date: Wed, 24 Dec 2025 09:44:55 +0000
Message-ID: 
 <CYYPR11MB8430C5040A442964D7BE733BD7B2A@CYYPR11MB8430.namprd11.prod.outlook.com>
References: <20251208205128.1274030-1-valeria.petrov@spinetix.com>
In-Reply-To: <20251208205128.1274030-1-valeria.petrov@spinetix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=3d961e8d-d39a-411b-9991-ae45d7bfffad;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-12-24T09:38:59Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8430:EE_|MW4PR11MB7077:EE_
x-ms-office365-filtering-correlation-id: 4b6fd19c-131e-4123-3b15-08de42d11805
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?q+ep4JwO3QMafECLc6/kruY2WZrwiu1ySSqclMLTlWTXBcnKCnYPIW1DeEtG?=
 =?us-ascii?Q?4IclhE3FegcTRIZTaVouG0gnVzDYfyasUHG0y6Sy6BSv7pIH1T6znvgmJeZ2?=
 =?us-ascii?Q?B+bfOtdg33CFcaFn+n1oGMr/m4Zl6jUEmxVv7I3mPz2eQ5dRJ3p7uZsA1HhO?=
 =?us-ascii?Q?By9tc75DUzsAKSn+4g8t7V82/am5Y7bIJCPUwrtFKU6anlCROavMTulizD2S?=
 =?us-ascii?Q?R3iYVQ8o4y+aH3jKS59/m2i1kWbkDtu2RP//pZYrChGGz7jvRl4E/qcifKem?=
 =?us-ascii?Q?Nbe5LRMouU5bi5wxL+MHQQIm2UXhn70XltIVuT1d5iB4JcxCX8TLb5P7siJp?=
 =?us-ascii?Q?Q8AwFEKUy9S8ErxZbbygRfAxnfJtLRM9lTxEH6qzOtuw8RZ4TidcDtUXtk2x?=
 =?us-ascii?Q?v0d+fgdcNq3SnW2LRc6k4HRwfMwrTTjxrJjAQ4dGreSRO3AWu5SkBwNWcKqr?=
 =?us-ascii?Q?NkPmK6HOmhTvXKsh//ZSChygdOkfNm9yx1MF09HC5F7pM2OVgiw75IzoPZMD?=
 =?us-ascii?Q?4FFPPSTY1nvz+Lmu2w/fabjAFdixPjMKgCkH3QrWUkzm3vNayWmxijEfm/VA?=
 =?us-ascii?Q?HEVhudYr57D926wkZOjVh9PiB2fVY9rp8272N3w1LeQNbgN9/Cln9nVTZv65?=
 =?us-ascii?Q?ZlgOF36Bqnx4N1tIqLB5isI63DRWlLM64rIIJQHxUtwdFYgcnnwm8HPGTMNb?=
 =?us-ascii?Q?evHpK3wGL6Y1kQh71sJD22L0NaSeLQ2R6Giujzaqi4IjQ41JYPWfvYwGQGj9?=
 =?us-ascii?Q?0XXh2cfFmAwTCPE86E9cogUHs51Qf5Lz6laqdaVEfV8ly3vtLwgDet6ia2qB?=
 =?us-ascii?Q?xrZ0WRkPGVbhJ5aRerWeINVAikfnuQ0aOmaIhuQl5Bu9CUAc+3JsAe28pgTs?=
 =?us-ascii?Q?D2pnDuv6n5RnJH6DDE/GgsKM5QRFDeN6CTg4MP5PPDZr2SyMQcRyOfGZGEbB?=
 =?us-ascii?Q?d7vh4FmdU+Uj8lygBrBJIcV85iZUC7qLVOaNyRavv1porpPD2NCroUHqUOIw?=
 =?us-ascii?Q?E8Ug4anKhSWX2HNXAMRbHRGBYtSrczdLS683AMYkq1buCKR57l6wxhsHPyuP?=
 =?us-ascii?Q?mDe7IVuInuOOdCo25Fa49On3eC7mKqRm/G5SuBp6Qm0idlV1XBa4BZcajCLg?=
 =?us-ascii?Q?BoosJybI0qrVTUpAtV1B/8DzITzQIjzRsm8JvSwEkfdbc17Y6nUrh62MwR3M?=
 =?us-ascii?Q?nYbBaNKximoRwv/OkmZ4zWskwuZfE7Ps5v7SjNbFDuBv8DMWVC5EEUdDPHOl?=
 =?us-ascii?Q?m3Hedsqj+2vfX7RIaV0uSf5hwg+RDH+mmlNFVe6RQCOYTWMVPx2uikHCL27Y?=
 =?us-ascii?Q?ZCMPYZyDjppdkv5cIUlKvw38vdvg2ZY4wX+mASmgaGvlAzrC9xuCX2+8KHtK?=
 =?us-ascii?Q?mfx71EJeTvJAInA+tIPyHoYSmOXIPbif7ePoXKTKizCytS789twt6msW0rB8?=
 =?us-ascii?Q?9CnC+uukX12WtC8/UVMLcXdwLw1YD+AyqkAOWOQVSZcJWqXJg22Ri1g1654S?=
 =?us-ascii?Q?Dj9N5c/u7UD+kSDr8KQ/KtFlMLvTuawoT+uf?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?1iYPR5nQQ4QyIY3LlGMusplLcAqso0pe8lADZ1uLtrsgLewWApgM5coKoemu?=
 =?us-ascii?Q?mR4twUToXEiG0UIsnKdmuCIlczFSVF1YrppdRmjeZUBLAvIIzDyBQxm2WDe5?=
 =?us-ascii?Q?yDzZwOoE5XxvaA5J/5ITEETxSX5LhO3N2zttTXSw3zZRZxjSgcAYUL34xWrN?=
 =?us-ascii?Q?6dcr6xOeHezpPFqyzXg13Qwdx8Xb6zJqd+vkClCONpNogqCR2c96O2iN2HK8?=
 =?us-ascii?Q?RiIdqtL9KdmEWDv9T1wHke5LUbATKo2lDr3cHqcyPNHTzvX9cfJdSiQc36FX?=
 =?us-ascii?Q?831e5PIOquV3+nY18fK4IZExmhc4Jvar/r1oqdKlbJWA1ZsGBUGs7zSSlH74?=
 =?us-ascii?Q?IW2rKtGa8xiotAXRWuoxSBIbKH+UbrXleODVhyDEesy8I2ADQLA68yTpjyA3?=
 =?us-ascii?Q?1AC2Nx7hhVtV5bXVcCLGKdKcYWnMaBPCItBI3E2zSj1wbPJQt+XaaTwghyKI?=
 =?us-ascii?Q?/wK/B2BlKam0Zk2rru/8d49j97Pzrbtb1Lb71TRz/T9MuCn9N6PWxIQuLG9U?=
 =?us-ascii?Q?0PFfoucjeIMd0ky/urennPhMItxR3TzmiIqQ1nfq+ArgJRDx1pXboogD4z9Z?=
 =?us-ascii?Q?r6hYSCQz9KuZvT+ZzTD/MRi88ItlhSzJNEZ1oP1KxKoKB0MhG9I0Ht1Vq4t9?=
 =?us-ascii?Q?nBrvs8PwrLBJIyr80jGO2lL512opv3T1eJIqOFvv45BsOEPVClTDADgZQ/u6?=
 =?us-ascii?Q?miwz8IWNGoQLaguciKz9ajEpZBc1WA5oqsQuSxnMUVwEUCoo7PZryfRZkxHh?=
 =?us-ascii?Q?4VEXiDjvS+gogHbePYzZK82PTn5pejhLpLF3+VdoGKIQtucwHQqDun5LCPzt?=
 =?us-ascii?Q?fodtvvDGsK7pwpTaoq3MJSCpWLhNIVM2WyKp8lTIxHRQg+fLaV/V5qmvoNT8?=
 =?us-ascii?Q?n79Xw6clRIijmoe8Soyk2FTo50YnyC6Gqgg8fhrCuhfdGfHUCsNQRZmYqyDH?=
 =?us-ascii?Q?OkVAPOcOP9uaeAErvKD2lkez7tzU/pSVTuxj3a6UgkWMRdINCG4XFlBAv3va?=
 =?us-ascii?Q?YlZE6sJRPpUqkbskgljeyINjXTyHLCdDaRJ0LokpaRYgeqmEOFlpPm3Oy5j6?=
 =?us-ascii?Q?FAgXx6KZWR/VjSsugorsFeCN++PwhqfCzsg4BNLk536HxeGuAqwXa4knpiyC?=
 =?us-ascii?Q?Qlsuh9nnRTnHdKgZckE6koggIXPucGYQ9QIFxVxPdlEXBuXLJh2DrFxiq9Ej?=
 =?us-ascii?Q?cxw/zvBXicnvPE/pASUKHpgCcN/rlN6j6fYx4AjdIvqtHsNlHmb1PSHM9gD2?=
 =?us-ascii?Q?EB0/8DdlGxJVWSfLJTAq/emN/NJ2DJOS6bUxeIwKIi/su1kWw7V+xuIIj6Sb?=
 =?us-ascii?Q?62YODX2Wakko4htFn9x/1c0mvuvYm/ffnBMO1RVtvEKfC7uCRFpxMx2ihsFF?=
 =?us-ascii?Q?PsFB7RAuWKfAb0mUHNesXoFpE+2q5icQJ1/+FRBp10narWuGoDq2Gi9dDyYI?=
 =?us-ascii?Q?jeXtxOqwYiQj6ox3rtTIwLpKoB8BZT0fsbpZ+yYJYNdYH5V6/m1Msgrf93Hj?=
 =?us-ascii?Q?gWx7kk/4gxIVzR2nJZ5LW+18v/EAjFwNqM2S2zYIidqBkVWzZKwJ4HGTNHsS?=
 =?us-ascii?Q?bHK1jhvma+V7WYmGAg52GDuWfyS5479ULXqrKqS6GNVstUmKmqLFtAnpyf6K?=
 =?us-ascii?Q?vSdmwHDfVVLQfWV6+1IykchxMy6E/96bVz6CmMQLY4S9d6CSGtbZGGbMsD2f?=
 =?us-ascii?Q?YK+WEU0MdDrBYuZ2PMl/o+okW5WPmJv3uSM6Av2xa8qZllP83/39GSYRM18T?=
 =?us-ascii?Q?16+FHuJAyA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b6fd19c-131e-4123-3b15-08de42d11805
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2025 09:44:55.1761
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1ydC3KCGUkfeDwU06P26I8taM36errsuEOX2mVVJEijXuEX4FHPMsvADacLB0Zb+xLdqpTI0soVuWJwA6Xr1e31zwnDIF2x8WzhF4fw6nAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7077
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MiBTYWx0ZWRfX/2aqc8KDlZw8
 baEn/08a+D2SFKSxRMcpTaKoyPzqQMHrDGs0Y/wFCfaN0w/IFKXkUtSA6moAH5kPjKGy3zZTJK1
 7MOpkIA2hO6nBEMyN7CXTopXsCoVzTGYQJPG2j6Sl/CgNg4jtleVvD4+62m1E5KiL2DUQioyF1j
 pEkITFglxyTCBIQAWN2S9EDnqL9agLEdXq9vw0uzhk9dihG4y8S3xLGpU3X1bTvlH6tbsq6GaQT
 UlNApx00iksprVncu1y2Bp/+WlFhDByySDcbwiTH+SL0M0HMNOlWDLGvL4bVgDLJ80fjs5bY2Ya
 6pGzAG4wcdpVNDfBrCsZOw3GnTePEIxsmX7KalaavwmFqkubZcofHs7Ks/YsHTKP/ka9IEFchcO
 cHsi4F8wu0MrHTbCUZJ8o7egwdr+4LHLddu4VrLRWeGHfHgQEHd+e+I9kIZaMfmlaYFECr4Hrn6
 MxGUgLcxYUi7ShGcu1w==
X-Proofpoint-GUID: 2X7ZAKwk6I470ZnrpPHCyfGQkx8CBr4A
X-Proofpoint-ORIG-GUID: FlRZFgZg0BYZU_Pi-BOR0pw9XFOU9VoV
X-Authority-Analysis: v=2.4 cv=KYffcAYD c=1 sm=1 tr=0 ts=694bb628 cx=c_pps
 a=zrUOGFyhpnkGsAL0isy7CA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=mV9VRH-2AAAA:8
 a=NrUJFPGUAAAA:8 a=pGLkceISAAAA:8 a=yj-aMKAYKbz0kkd27lYA:9 a=CjuIK1q_8ugA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=liIJVMK5xV7nxcgYItiW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240082
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122879

Hi,

May I ask why this CVE patch didn't merge in kirkstone branch?
https://git.openembedded.org/meta-openembedded/tree/meta-webserver/recipes-=
httpd/apache2?h=3Dkirkstone
It is still apache2_2.4.65 in kirkstone.  We need this fix in kirkstone as =
well.

Thanks,
Liyin

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Valeria Petrov via lists.openembedded.org
Sent: Tuesday, December 9, 2025 4:51 AM
To: openembedded-devel@lists.openembedded.org
Cc: Valeria Petrov <valeria.petrov@spinetix.com>; Khem Raj <raj.khem@gmail.=
com>
Subject: [oe] [meta-oe][scarthgap][kirkstone][PATCH] apache2: upgrade 2.4.6=
5 -> 2.4.66

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

From: Valeria Petrov <valeria.petrov@spinetix.com>

Security fixes:
- CVE-2025-66200
- CVE-2025-65082
- CVE-2025-59775
- CVE-2025-58098
- CVE-2025-55753

See: http://www.apache.org/dist/httpd/CHANGES_2.4.66

Signed-off-by: Valeria Petrov <valeria.petrov@spinetix.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../apache2/{apache2_2.4.65.bb =3D> apache2_2.4.66.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)  rename meta-webserver/recip=
es-httpd/apache2/{apache2_2.4.65.bb =3D> apache2_2.4.66.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb b/meta-=
webserver/recipes-httpd/apache2/apache2_2.4.66.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb
index 98b2215f44..0e96643fc3 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target =3D " \
            "

 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbddeddfac80b2c9a882241d008bb41c=
3"
-SRC_URI[sha256sum] =3D "58b8be97d9940ec17f7656c0c6b9f41b618aac468b894b5341=
48e3296c53b8b3"
+SRC_URI[sha256sum] =3D "94d7ff2b42acbb828e870ba29e4cbad48e558a79c623ad3596=
e4116efcfea25a"

 S =3D "${WORKDIR}/httpd-${PV}"

--
2.25.1


