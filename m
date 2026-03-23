Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B73EC01CF
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 11:42:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15352.1774266131979964553
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 04:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Z0p6Zssq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7542b98c32=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N5kqHJ3731459
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=kcGiMvQzdui1JDhY/7eIvMJu2fIBry1MNwhsbJnxgZk=; b=Z0p6Zssq4/J9
	FRSjO0sYUCSS7i6NnBEtYfAnf+1mKeTwzDvCxMKBVLaFbJhe+y/yjx8+RH/tytrg
	CoMNcd9eUy8OluCdv9xekS+ePBLytIzL6O3o+ZglumpsLtPhMaHP9zObIF0oRrbF
	Fo0sBbtaGi85PBWg/VdI0+LzB148VDRcx6Dg93I4h4bBeXVMj9BkCVRtOucPCR1q
	H/x1UevoheibByiO3MY1eCGZtH0fAW5WyLB7xkYc7UIzkPJORsP8wiB8AWAlzkWw
	JhRV4yMQgjD9mxpGrkF5r0UmKbJtI7jN13+B6VtjSk5szKVTR1OzrlVyBWwf2N2K
	STNJLvLLZA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012003.outbound.protection.outlook.com [52.101.43.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1pky9k2h-6
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EjWstSUIaZ7iP6RS+kPJv0O4w1Dc3s40nb2PtcjIdf1LxyslSzl/DWYAr2t2jeyZY98+09rhxkiDWzLmE2uo4BUXpYKaYlQisk5X4pP1ikF2PQ/nqozan67HfKj8cTyj8eZl7/tI+bJBNhiJjdLird+yPEdDSbN6pzwvNFYxuI6u/qg6vPR52eKcveVrufU599st1VvADxF81/HtF+/wmkCuchPfg7dmhgQzkBeuyl44hEdUTLX3kXknp10EK6kO5IPxctKUJ1gLw7d5+b6blxnUI0tsEI+2CesF78XU245MMwTLMdIL372M7gGYk+O5UvXNpRhc6YXdoHdfF3IARA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kcGiMvQzdui1JDhY/7eIvMJu2fIBry1MNwhsbJnxgZk=;
 b=W4qSTgjBXkbdgWCiOHtVrz/wlyGobFjtOgWg/y61I8ZBEtNyPRaltkdABPK2ERHZgt7KFnb6a9j0Ye8Tk9Wc+a46KPpvpzSeyD+EB3W2C2sQ9Op6Wzuhmr0BkrDaDOWwJs4BIZQDMr4FVkPM5cm7uvZCQLnfNVvNVvIVoIE6jywKTNn8jRdsYX/c1R9/mu7QTRi3OWMLdAVZ2JKK5KRjPFkwBknkp6etdHnp3LlQRsajMMbDRyBkiyTK4YqNA0NcvrFFV0/mGPSjJ0hqXIF9qGPpJazwVHnOwcDja2ktlVUaAyP5/H70RJUxQiGuPfcNUdQ+dbdZm5DAjTkPMxi8UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CH3PR11MB7763.namprd11.prod.outlook.com (2603:10b6:610:145::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.10; Mon, 23 Mar
 2026 11:42:10 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Mon, 23 Mar 2026
 11:42:09 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 05/15] xfce4-session: upgrade 4.20.3 -> 4.21.1
Date: Mon, 23 Mar 2026 19:41:42 +0800
Message-Id: <20260323114152.4178269-6-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
References: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCP286CA0108.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::14) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CH3PR11MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: ede3447c-4456-424e-a905-08de88d13791
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	epe2V4ENWhApLWBs+/VAlpcsXy+JDG8Ahwzxp/6c8IgDBTQvqLlwiqHGdMQe6PwdzxH2Yyx8wVcZFVHoXtAo6lpBJrsCG5Fp3g/uYu+SBy8uIh1ZU5cp2acFzl7WWG/81zasE8NM1OuNPDZbZegDbpFJgU/vet9CW4KKtT9SikxvQyPUxAYrmD/6e7X3sViPjAntrod66oyUpawMFP2xPySfF0mlLhHMRC8AgVkNE8Q3dNSNYbRo+VPZfceunmC5S7pYB+uifaOatuJVqokgV/QdOBZE0mojyyvncgLuB56qtePKss6CZkubKsZZxvuYgypthGEXE7F08NezCSjNA2iGeAztQLc1SQKJEhy+aU1AzZMqd3NVJlNJJMqfYvHZgjmdLBcMngez61ITLN582lGIRmzNBVFlmW1vm/FSEdZ4/3W2xEYIvLPv/pkvtqH2QeFvHM12jOB6IeHYXy7h+RAeYnhTWQRGq1P2fIA31mI4gjNCSwBkBqgQyJDv5cgPChxBt/shSoKouEMByFqt8LMbI7oh7e/kCMdfCvclhNHr9Fabm/mewS0GL/dRkcxx/k1ntD/MkEg1jl7qUD+up4LbQ+WbbgEThIWXmj94j9CaX7nn7fb7vlenkFWUEdlD/5TiI2cusHjlxEF70hLoLKkFqPrau4R/1TGPDUfxf6rA+ThOamsPsM/CJJiHvRiDp+LRWprvSiddRA9Hmw2crYFibGfw0w4plMwIfcJzZjLovD8LZxONf4dvuDBfUUBxSI2B9pH8Ok4dQlHAIO85q0zCbWaU6BwF/7oIxDsX6lw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YlZoaHhlcXFMYjREb2ZxMHlwdkpiMnBlcVdrTjI2c24vQWlpa2VMTittMk9X?=
 =?utf-8?B?QmFMekZ3bTBIRVREWkJBek15Q0pGd3plaTMrdzY4eVlPdWlhajRLQWpKY0JF?=
 =?utf-8?B?eGJZekpjRFpUTXdHY2FoYmpYSVZiTUlpRjgveGMvUTFsY25mbXlQc2V1NHRi?=
 =?utf-8?B?L1E4SzRkeHJLNHNGelpmcmxGK3hRUEVlT2hqNmFhbERvYVYrdDlITXVSRnNy?=
 =?utf-8?B?OWJrRGN6Y0FLcGgzVEZqRUVERzNab3lFZjBoTmQvMEF1eFZhbGtEckpKc05w?=
 =?utf-8?B?eFFCejE2M3VEQ1N2QTNJK1J4Q3doKzdRTVBaeElQbzM1UVJzd0Q1NXBXWDR3?=
 =?utf-8?B?elR2UXZBQ3paUTkzTFVtQWZSeHFvaFNlaTQ2SmZHWlJTMVczS3RRZUx2Nnlw?=
 =?utf-8?B?UTA5K1F6OGFxTVBCYkl1d3hKeUxkd3l0R05wNDRFdExYSExLSFVrSGEyYTRK?=
 =?utf-8?B?eWM0ZlRveEZmb2FsR2lWZUFzN2tlQ0pWU0Y3TEJNVWVrYjRFZmdLeUJKSVQ0?=
 =?utf-8?B?bFlVNjJ5bHRndDYzK2MvY0FGZ0Z3c2ZDVmZTMmZaSFpRdzRiQURBaWtiazEx?=
 =?utf-8?B?T0crSGV1aWJmbkZiR1FhMjlmNVJXQXk0a1MyRnZQR0VQUUNkVjNaVlpPdHRR?=
 =?utf-8?B?WklGUklyb0hGTDlPR3FseHVoMk5nbEo0M2RGd3AzR2ZlclZFR3liU0h5RWpP?=
 =?utf-8?B?QXh4OEE5NWprKytCRmtHdU1wSFZvYTJ5Tks5WWlKMkJXeGkwc0JKNytrYU9w?=
 =?utf-8?B?MzFyQ2JMcC9iQ0lldU5LTnpGSTRVdnVqNDZ2L1JGYzdtTlFRcmtrU2wwNWZQ?=
 =?utf-8?B?K2Q5N3ZWcENxaC9KYUlMV0g2d0h5c1JsbDAxaFRvK1huK3d3Sm1iVDViVENv?=
 =?utf-8?B?VDZ6RXczWEFYNUdFMVVFTE8rbWU1VFoxU014dGZFUTRQZVpCMkFSQlk3ZSt1?=
 =?utf-8?B?NDl5UTdicy9VenlUb09SWVZtRHVWZVhOQlJ6MHhCNzhLYWZPcnhnVW5zUmM4?=
 =?utf-8?B?dVNTS01QcG92UG9nM2RoaU5TWnh4MWZrblBTQ1FPa0xzRk5GMWdjNi9kbjhJ?=
 =?utf-8?B?TDlZc1ZQVkRWTDBaVFQ3NE9VNHBmWm5lVEJ0ZElMbFBWbzllSjhrUlBKYXVp?=
 =?utf-8?B?YXZDQ0VtcDFlZWlxeGVZVm1jNXRpUEFudExnV3lVcGpLa3ZvbzRrVGpvSGZV?=
 =?utf-8?B?eExZR1ZnQzV2OEZxcS95bjhUL3NkTFYrVnE0Wlo2RmlEQVp5Zzl6a3NrY1RQ?=
 =?utf-8?B?QmFrTkdveE9LNCs1amVRSWtWU09KMTlDaUQ3MWhZeWRIWHNRa1lWeTRmc3gr?=
 =?utf-8?B?NWlyWGxEYWxySEU4WTB0QnYzdDJyVVVVNVB3UzN5YmVQMWNKc25TMVFFUUZo?=
 =?utf-8?B?UG9ia3dRUlNPc09ETXgvTzJOVVZESld3WFRmZTFIUUFLVDlmcy9jbUV4NzFU?=
 =?utf-8?B?N1JENy9OMVo5V2tKa3c3NER5S013YUdYbmVPUy8vb3M5NlB4cWZlR0d6bDlv?=
 =?utf-8?B?K1QxSWZxbXB1Zzhwd0lnc3BpUmtlOVdhaWdsMTVJdGxyZU13YmxxT1NqY2Zr?=
 =?utf-8?B?TnM5ZXcvV3NKZ29QOWRHMUJOODRiYURJMnJVNTgxRG8yc2d5dzJYQ09BVzJZ?=
 =?utf-8?B?ZDZ5TUdpWGltb2o2T0N1cWxiOURXbWRvTHp1YjU1RzQ5ZDRmRzQ1SThwMzhs?=
 =?utf-8?B?SCsrVGtmN1BZUUVJcDhPV0l6aXJFL3czQkdxMDZSQ3RsQ2tEaW9XSkRldW5z?=
 =?utf-8?B?MTRVQzJWdmY0MU5wODFFb2dQSU11NTNZVW13UWxMOTVUN1RnT25zTG41WWtx?=
 =?utf-8?B?UE00MXlTZ09hYXFQaTZOVjBsR3FjVWRJanpCa3hXS1hsN2htejMzMkZtby9s?=
 =?utf-8?B?L0VDcUt3dkVuYlpXVkpjZU5WakdOWlZoUEtQUUJHUWQ0aUg2em1pRDVydDFF?=
 =?utf-8?B?SVNNOS9rSXpaMkJIbWV2WUlZYmM1TlY5YzZjQlFvUXp2R1lMTzc2bzAybE80?=
 =?utf-8?B?dXk1WjIvWEYza05RZDUzcWN5Q2kwQUVCVHBMbTNsRGhkbkJoYlh1dG5MUm51?=
 =?utf-8?B?MHVBa2xmM3JQVEZXVHRyNUtKMmgwS3JnU0hzdlJ1dEdROUlOR0hGaVBRUXcv?=
 =?utf-8?B?ZnRWbU8zUG5NbnpxV0ErRHNrbk9KbXVNRjhGRWx5eFM4aHBtcUZFTWZrQU55?=
 =?utf-8?B?ODlZN2s0RnhtMXVuYlpCekF4UWF0MmpqZm8wM0M4VlhwYVVnZUhCRjVCT2Jq?=
 =?utf-8?B?VXo4RDhXd21lNnhZK042WktTTGZ0aDZvL1VZNFdaVGo1TjhpNlJWWnJNUlBD?=
 =?utf-8?B?bWVDbG53RXczcWQwSkVldk9udzg3dGpOcFRNNktSN2c1MzdUaENBbjJJTUxC?=
 =?utf-8?Q?ZHDTye3mq8FHnoaw=3D?=
X-Exchange-RoutingPolicyChecked: 
	aRiHWv/9vcXOghdi50eniXME1tPxOr037A39p2RlIzpiQV3UH3qsCnb4ENdvRb+sHH0amDFAjsL1znMqrXI2yYNjjmBhleyQ8V3iZN5HAlBjjAGgXcn9SzMBEBdgKhOcJ4qwu47N8A4NaDc0uMNfbmVJvGIadVvLBYANmjOz/mKNQ6sxxumicq5saXh9CQOBrjm5Lwtc6IVYDrGoFskr1Fh6Fsc8x4G6Mty8qk/Dog5dP+JDVN+TWNUyK0KIecfZ40mJiiJ7IyL451t3INPe1L8Kul4zAXjW3ze2H8nyz4fYDqnGv9IZGkG/3J2VPPl/kJcIhQLjUbmIISGadFlChA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ede3447c-4456-424e-a905-08de88d13791
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:42:09.9263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x7JJCMHcdpi7e6CuTt6nsJpl3GfYcfxbEV19xX06cox3FgvMHDmidR57k45MawNoxoid469zDKxtJScqOnbSkV5E2ovnnTfTVR9FczhnqHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7763
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5MSBTYWx0ZWRfX9yVU1JWiKKkx
 3e9Zq01y7E6TzC8usrMga4U4vnIB0tKWg1KRKM9EgkFcTN3A19PJF0RFMJ7cTT+Xb2bysv8gUzP
 t83JCVcaLuDFJ4OXL2v2+MCi6U06SnAwGLByLIUwyQJW3Gk24EsrA1j6CDNHM8MFZ+JUWLwwOdb
 iAfpU071DEcHe176YqNFFmewlS/COJTWWs8/CoPZSfXQ5x93ULfqwad/bySEmAVAATAGAN2TtVF
 YGokYbgdB+DCEXgJHyHUFY3nLfQY0ijTM59namxiKrL8bvetGujtZGKs9hFh1g3H55zk0M6zvIj
 MTxhRxYXgGfdHJivIN10fFkDCShNxrLyLa8i0NodQch1yWdcLBAaxIE5OdJwWgTFyvwSzA0BzvI
 UTs3fQYYtu32tSwiXrO4mZ2ostDsZLZe6Y+afJ+DLCDpZUI35D3CiSzFeWexCF9cXjBySce6rHY
 JrRC8wqNUOJmTfD6j5A==
X-Proofpoint-ORIG-GUID: qk1SbUm3SwL6JDTRNJjCWQ6R86zDZKoq
X-Authority-Analysis: v=2.4 cv=Scr6t/Ru c=1 sm=1 tr=0 ts=69c12713 cx=c_pps
 a=ayBBURk7jZ4GzqZFlR2IhQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=O24Aq5uEAAAA:8 a=t7CeM3EgAAAA:8 a=mK_AVkanAAAA:8 a=f8LJXPsAXp_22yhX5GYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=3gWm3jAn84ENXaBijsEo:22
X-Proofpoint-GUID: qk1SbUm3SwL6JDTRNJjCWQ6R86zDZKoq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230091
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62N5kqHJ3731459
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 11:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125508

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Changelog:
https://gitlab.xfce.org/xfce/xfce4-session/-/tags/xfce4-session-4.21.1
https://gitlab.xfce.org/xfce/xfce4-session/-/tags/xfce4-session-4.21.0
https://gitlab.xfce.org/xfce/xfce4-session/-/tags/xfce4-session-4.20.4

Refresh patch to algined with meson build.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...nfigure.in-hard-code-path-to-iceauth.patch | 43 ----------------
 ...eson.build-hard-code-path-to-iceauth.patch | 49 +++++++++++++++++++
 ...sion_4.20.3.bb =3D> xfce4-session_4.21.1.bb} | 12 ++---
 3 files changed, 55 insertions(+), 49 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-session/xfce4-session/00=
01-configure.in-hard-code-path-to-iceauth.patch
 create mode 100644 meta-xfce/recipes-xfce/xfce4-session/xfce4-session/00=
01-meson.build-hard-code-path-to-iceauth.patch
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.20.3.bb =3D=
> xfce4-session_4.21.1.bb} (75%)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-conf=
igure.in-hard-code-path-to-iceauth.patch b/meta-xfce/recipes-xfce/xfce4-s=
ession/xfce4-session/0001-configure.in-hard-code-path-to-iceauth.patch
deleted file mode 100644
index 0e20143f10..0000000000
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-configure.i=
n-hard-code-path-to-iceauth.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From a629b051f4e5462150c77b95574bbc7a33bc9666 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
-Date: Mon, 31 Dec 2012 16:35:29 +0100
-Subject: [PATCH] configure.ac: hard code path to iceauth
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-workaround AC_PATH_PROG which was meant to find programs required at bui=
ld-time
-not at run-time.
-
-Upstream-Status: Inappropriate [config]
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
-
-Rebase for xfce4-session 4.20.0.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- configure.ac | 8 +-------
- 1 file changed, 1 insertion(+), 7 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 81b362f..ccde685 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -136,13 +136,7 @@ if test x"$ENABLE_X11" =3D x"yes"; then
-   AC_CHECK_FUNCS([_IceTransNoListen])
-   LIBS=3D"$ac_LIBS"
-=20
--  dnl Check for iceauth
--  AC_PATH_PROG([ICEAUTH], [iceauth])
--  if test x"$ICEAUTH" !=3D x""; then
--    AC_DEFINE_UNQUOTED([ICEAUTH_CMD], ["$ICEAUTH"], [path to iceauth])
--  else
--    AC_MSG_ERROR([iceauth missing, please check your X11 installation])
--  fi
-+  AC_DEFINE_UNQUOTED([ICEAUTH_CMD], ["$bindir/iceauth"], [path to iceau=
th])
-=20
-   dnl Find a location for the session desktop file
-   AC_MSG_CHECKING([what xsession-prefix to use])
---=20
-1.7.4.4
diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-meso=
n.build-hard-code-path-to-iceauth.patch b/meta-xfce/recipes-xfce/xfce4-se=
ssion/xfce4-session/0001-meson.build-hard-code-path-to-iceauth.patch
new file mode 100644
index 0000000000..0a34f8f039
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-meson.build=
-hard-code-path-to-iceauth.patch
@@ -0,0 +1,49 @@
+From d3561f125e6e6d6bfea0b41ba1ea02d14eb07244 Mon Sep 17 00:00:00 2001
+From: Zhang Peng <peng.zhang1.cn@windriver.com>
+Date: Tue, 17 Mar 2026 17:14:33 +0800
+Subject: [PATCH] meson.build: hard code path to iceauth
+
+Workaround find_program() which finds the native iceauth during
+cross-compilation instead of the target path.
+
+This is the meson equivalent of the autotools patch that modified
+configure.ac to hard code the iceauth path.
+
+This patch is replace the patch 0001-configure.in-hard-code-path-to-icea=
uth.patch
+
+Upstream-Status: Inappropriate [cross-compile specific]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ meson.build               | 2 +-
+ xfce4-session/meson.build | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 7ab81ae5..c54ebafd 100644
+--- a/meson.build
++++ b/meson.build
+@@ -75,7 +75,7 @@ if enable_x11
+     feature_cflags +=3D '-DHAVE__ICETRANSNOLISTEN=3D1'
+   endif
+
+-  iceauth =3D find_program('iceauth', required: true)
++  # iceauth path is hard-coded below for cross-compilation
+
+   xsession_prefix =3D get_option('xsession-prefix')
+   if xsession_prefix =3D=3D ''
+diff --git a/xfce4-session/meson.build b/xfce4-session/meson.build
+index 56a297f9..e36885e4 100644
+--- a/xfce4-session/meson.build
++++ b/xfce4-session/meson.build
+@@ -42,7 +42,7 @@ c_args =3D [
+
+ if enable_x11
+   c_args +=3D [
+-    '-DICEAUTH_CMD=3D"@0@"'.format(iceauth.full_path()),
++    '-DICEAUTH_CMD=3D"' + get_option('prefix') / get_option('bindir') /=
 'iceauth' + '"',
+   ]
+
+   session_sources +=3D [
+--
+2.50.0
diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.3.bb=
 b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.21.1.bb
similarity index 75%
rename from meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.3.bb
rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.21.1.bb
index af7ab98ae5..61a059f051 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.21.1.bb
@@ -6,18 +6,18 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263"
=20
 DEPENDS =3D "libwnck3 libsm libxfce4ui libxfce4windowing virtual/libx11"
=20
+XFCE_COMPRESS_TYPE =3D "xz"
+XFCEBASEBUILDCLASS =3D "meson"
+
 inherit xfce update-alternatives features_check
=20
-SRC_URI +=3D "file://0001-configure.in-hard-code-path-to-iceauth.patch"
-SRC_URI[sha256sum] =3D "dbf00672c5316a30b7001fe852e6a5ba9f889afeab8a2475=
45a160d4302f1fa2"
+SRC_URI +=3D "file://0001-meson.build-hard-code-path-to-iceauth.patch"
+SRC_URI[sha256sum] =3D "a8fe873fdb20366a44f1345400bfb29c2ff0cfe89dfefd85=
2e2575464b80567c"
=20
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)}=
"
-PACKAGECONFIG[polkit] =3D "--enable-polkit, --disable-polkit, polkit"
-
-EXTRA_OECONF =3D "GDBUS_CODEGEN=3D${STAGING_BINDIR_NATIVE}/gdbus-codegen=
 \
-                GLIB_COMPILE_RESOURCES=3D${STAGING_BINDIR_NATIVE}/glib-c=
ompile-resources"
+PACKAGECONFIG[polkit] =3D "-Dpolkit=3Denabled,-Dpolkit=3Ddisabled,polkit=
"
=20
 ALTERNATIVE:${PN} =3D "x-session-manager"
 ALTERNATIVE_TARGET[x-session-manager] =3D "${bindir}/xfce4-session"
--=20
2.34.1


