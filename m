Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD5CFF60C8
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 05:55:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13992.1774936543935869452
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 22:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=AZEQ/LFq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8550d9304b=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V4SHhn2006267
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 05:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=s9EZQZWrIXAz/dQKurBjeflYWLc7/iz4gRVyvu9NPKM=; b=AZEQ/LFq7W5M
	4XBfhZPl0q6hlPX4WcwXzhJwWa+Sb+KBwbq25kVSAk3UqC65FE3F1T7GLeadVr1U
	myjj49zXNZNz0c/pEWkAYfsSbcOr07Y7/ANrLgFkfIE9Kz+QXZa0gim4rT2iqh0F
	OuovKgiuMCRGvJ0vkcVPJvONTXJ0CyiPqw8Xnw0p1i6TqC73G6FLA0YZxuy43ZgS
	ixwyX9KCdKkzJV9M0rcVGlkIAS56ICKnb70ZKd74o3c8GNy6flLMHAjbJUIzJam9
	H3SVVkZZsAKSlPrfaZkaV+fuwUhmk5vwo9gxVoCawGh9Aj9B8+6OQnoF4O4Cju5y
	F3oUdjFCqg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011045.outbound.protection.outlook.com [40.93.194.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d646vu76d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 05:55:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PeFaSNdeLEMetMOp6Y8nDXgxOq0rhOeW7ztax9arSknqkQegL4Akgx/pcgA/ZaCQgbjvjPMPv5KGkFaWohWxbKAm0sXu/eGyxyQIvnO1lSLnmgkB+aV/uW9wjVkCe/BnGOqJAy4iIhJ6hWvXZZ47U65WPYdRCApHm7mo/ycM2ozpw0olZpO2beOH/nGuiHlZnHP+I76rcjLJSuLc7OfMNZ2v8Tkj1IwGSePVWQ+D7Tspmxe/kU9almQ9Bd/DtHnrOhJb+SS/unmgQ3Q8pBpcY1HikQLGq3UdIUpD0E4bUzddR+NYpX4H2wuoxcJYw1X7A2bZbPGS9hsAbbVU4YfHiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9EZQZWrIXAz/dQKurBjeflYWLc7/iz4gRVyvu9NPKM=;
 b=HnlCDVLpLoXoB+GAPXfiXfhr+eNR5MqE/vYLVgm7lLGZU5AcU5E2jtoWJsKTr0z2rkh8akXaBTtjtL3GeDyex6qISwwdPz/w0OiA5puXlO5boKsEJOpX5jBcAyJ4E9tLc6mrwVNWBcK1N6dPY6XryJY+8Yw28pL0ICLRCEa8gxORPhJ2UOU9033BASPLcK+AlfOesgH81aA+wGuqassyNV1+glD9lwHd32EgRuVdJpqsBot7YFFDpnGYUdgUebk8aaFbt+f09l7TANJdsRTXiLXUbq91e7To+wbzjBD8ahh4dgDpdgsMb29i6Wldskt5UlgvhyPxNa9V8saRoaYXHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH7PR11MB6748.namprd11.prod.outlook.com (2603:10b6:510:1b6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 05:55:39 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 05:55:39 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/4] libgdata: remove unmaintained recipe
Date: Tue, 31 Mar 2026 13:55:19 +0800
Message-Id: <20260331055520.444552-3-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260331055520.444552-1-changqing.li@windriver.com>
References: <20260331055520.444552-1-changqing.li@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: IA4P221CA0002.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:559::8) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH7PR11MB6748:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d2be321-73ca-4473-5f12-08de8eea22ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	XAXT+WI5V32/EkD52OW6xusRJp1lIYhkgtMokFcGpKaM8TzI4jADzHHtSnXUqPAF0cmI4Je1dhIZl/RAoFg8214miAhY5mqtfGoZZWZWfgSMAouSxc7VjiCSo7IFM5+ptRmmaK0ldb0PxvLjSYltJhCKCjRv3ofNv0pQ1TgHCP1xb9LwalRNFHmft5M0l6z2mQiNdJAn4r3zlCQMEWj9kaRrGEgd9pHkMyxfoMCLpy/Zpu+ntdKjuUCJB40m6VBdg+Qkfb0puHOrMFPOMQQeqRy2g+6Luu13Y59SndqhUmQ3byMlBUxlfJUKwvArfXnikLRIOrgJnQnHgX7LLPia1O/vZrTsVsHm6YIrJxg46pH+lRSj/BAPjEv1e0VfTPY6hYKSuHVpcW/2FWQnB9PLpfhFn/NWjOGY+P/TTBt8tSfEWCukdHIPnku9Vy3F2upII2dV//SSTjY8Bai66qcV1NghUkaxkMP6fnVTSZaCiCsEfDxwuRz75BJvS9rKO/rhYrq+wmC4CRtYyFw+XWtb/rYqgWkX/4pqI+kw0KkXdezIlX5ZPjgx7jvmCvk47ok7LiBuvCIOYIs7CV+VlwON8iYoNUBh2tqOBNu19Mz/bAOCs23K1uEttTyNL1t1BmA4/Bv34/KJJWp3BNcdQhodvChZQAhsMse8e8y258KjH9rgmLcN4wPh9cUIUdLdHStWdU4QMJY1jncsM9Gmqc0/BMoCchhWZ/PfT9Y5+7ofZE0gFnqvrfZf4a8OE9VPF8mT
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eUEwZmQ0OUxmYjhmTGpCWFFUWjRJOE14MXJ2d2lNTFlCUXN4aTV3bi9ESERV?=
 =?utf-8?B?UXI1Mmg1RCtYSDNHTUVXbmFOclJzZGNtdkFub0Z1VmNNSCtLbmpEM29UWU1m?=
 =?utf-8?B?cDhKaGFsd2NNRzNadjJnT1F5azA5dk82aGYwVHJvS2hmR3hLUERpT3ArUk83?=
 =?utf-8?B?KzE1ZEdVQmRybWlNZEx2blJCbjdpdnVrcXZENnZCM0w0OGNIUVFWTXFsWjBh?=
 =?utf-8?B?VGtyWG1UUXUwS0kwdE5QVHIybjQrTjFUenYyRGdrSmFJZ0Joc1FpRENKNmMr?=
 =?utf-8?B?ZDF2bWVpdG5vN2VOZkVJc2o5V1lFTlA3YzFEL1NuNUltNWZoUk94bG1JbG9V?=
 =?utf-8?B?c1o2NlVxTHN4Um80NS8xcFhMU3ZENWM4TXBpdkxhcGhrVjBpdkZrL2NNcEg5?=
 =?utf-8?B?NFRxWXZoYmV1eURQT2RvS1VvTGMrY3Z1am4yOTU4Ujh6RWpQOVZpNkYwcE54?=
 =?utf-8?B?bmoyT0QvcXdHeEFYajBzV21BQ0hFUlkySVZOaGMyVVlkclpUQ1haZUE3OXhN?=
 =?utf-8?B?Z2t3U0VtK0ZTZzhSU1AxclMwVXVlZW9IazBrL3YwYUpqZDBIaWdpREk1VWlz?=
 =?utf-8?B?MnM0ODVaUDVDTnlvT2FwYUFYTEJFTno2dWhpUm1PSXo4OFE4Rk5zK0Z1cy9D?=
 =?utf-8?B?czhXNHFmL2VmNC9vd0hIUmxkRzI4VEkyT2dKTXB1dmVPZmFNVDlmMHBoaTJL?=
 =?utf-8?B?a1BzQWRZS0o0MGhCb1pGYyswWEdpT29WaWNWM2twZjFCSFA3YmZOTmRVcExs?=
 =?utf-8?B?VGpSc0FSaE5Bd3BMdVJJK1pSV0FYdUhEMk8vRW9SMG9iNHlFbjAvTVRQcUV0?=
 =?utf-8?B?bHdDbm8yeUtkN05SV3BHU3RxK0p5cGcwRjc2NHhSSytoVk8zY1ArSnlOTEZR?=
 =?utf-8?B?QjZ4UzBsKzdFNGRsak8yK1k5OVVJT1VIRHJOQms2bkdlajVWRjJSbXE4VDds?=
 =?utf-8?B?K0M3dVU2VGw5WmJ6RURxUkI1T3Q3TC9IZm5rcm9DMkdGUExqdU9QVldvbnFz?=
 =?utf-8?B?Ri80dkpVc3puazlmNUNMZ2ZVUUdmN3FBMTl3WVVRcVliUy9QczkrdjRKcmRI?=
 =?utf-8?B?M3FDRkFRU2pPQSt3Q2twY3c1OUVrQlRybTl2U3J1YTI0ZU9lRlBIcmt5cG9U?=
 =?utf-8?B?c3lnS283enMzK243R2F1Qk5FRkFtZnFHVkJycmUraEdpYmt2QkhxaElTWHdu?=
 =?utf-8?B?MEw4eG8zeElKQ3BLRCtqRzRFczBYWDVoTjZ5OXpNdkFoMUlVR1poVXZHRXBl?=
 =?utf-8?B?SG91R1J2bTI1MDhFa0VZMDNPUzM5elZhTlJHQmRTeTlzQjNLM1d6Q0hGSnY2?=
 =?utf-8?B?TFQ3ck9wNGhZNWxvVDcwK29NZ3lvZnNRb1QrbVp0eWVKY3IrTFRXTUJsSVdN?=
 =?utf-8?B?QUJNcm5rZkRpYVhkL096M09EZEo0WEZkd1NxWCtiTEcvNi9RbUVHZHNyWEpv?=
 =?utf-8?B?eDRtYkxtUjV0N1pVU3RxN3dXazI0a3UzeWhPdWZ6OFRtci9DYWYyQjhnLzRT?=
 =?utf-8?B?Y25jSmxWN1VMMDU2QXNmL1ZGcE5ONGRIMmdGbGdJeVBIVUR6T3d6Zkl3UGFm?=
 =?utf-8?B?ZlBDS2YzclJzMjZNQndmZE9wTWcyTFFPSkY4aGt0Yjc2SHd3L1V5aHB0bUpa?=
 =?utf-8?B?RXFka3ZmZXpTSUhtcVhwZmdWeVM0bEdSNlFqaUYrb1NkOEx6ZTV6czBjcVFF?=
 =?utf-8?B?UUt0QXFEWTYveHRvL0JFOXE4ZFNveGQ2Ri9XaWsxWGhVSktmcG1BbTZxajBE?=
 =?utf-8?B?N3kvRGNVYW5xTEFDS3RWK29pbStIcGg3UnkrMmJOVk9uQWFjaW1HdDlsQWht?=
 =?utf-8?B?UlVLV3cwdm1BcWdybHhOcEFYWkZ5MCtpNnM5RjN4bEZFeGpEVVNtTzRBS2Fl?=
 =?utf-8?B?M1JXR2ZxSkJlQjhoL1JvMFd1WlhwVUhwenVQOUdpZ3hSeFF5bjdpUlFnblc0?=
 =?utf-8?B?b2VESy9OUzFBZ3RFbUp6WDJ6WFdlb2VrNmsvV3NMSE96VlV3MVJUekQ5WHhP?=
 =?utf-8?B?dEdFelNaeS85UnpCNzFVUDNvV3huTnl2SHJlNndxZWtwNE9yTElJbnA1MWlW?=
 =?utf-8?B?M0o1YlEzRHB2SmdqZXlCUUhBODlrL0FwTXlmMmZTcTdmZXdVTzdZbkZtR1lT?=
 =?utf-8?B?UFFDMmpjN2RsN0xDZE4zQVpEeUY3V0JiVzdDUkduZEt0ZGRMRXNOZW41djhI?=
 =?utf-8?B?Q0ZML25RcTV3OC9GTC9kZ2JYTnVITFVQL2hITDZVazBiOEswRmZuWHFlZ2gz?=
 =?utf-8?B?cmQ2Zkl4ZEZRbnc4ZTBGRWwrbVp3ZythMVVhTVR0Y2tZUVlGMUpnTTJPV2hv?=
 =?utf-8?B?citIYktydkxKWlZWdjFJeXhrRXJscm5Mb1I4MHR0R2FVbGthQjhMNWpZT29s?=
 =?utf-8?Q?DJTwsrkK2cceKgZw=3D?=
X-Exchange-RoutingPolicyChecked: 
	QtVTcULq1V3kjmaZYPDUVaZZkDY0rOgmUq5gwNv8oOlQSHqnqTvtDORxF4dSwoUTUL0vTkqoY+duu4FF7+fVQT/2glOSvAgp+MWM4OtG67JQz3q4ijeUxtUoU+Bi4qi4PkII7ThooOwga6qJuiyIrTtEnmWRaZF++2KeSvXapr1sla8Td7JUc+qX+tQ1VyxqgUZw4MwZOdk9Ti7OuOJSrGrE1ipD6giY5L6dFotRcDzxWnMtWWjGuD1Rhhx3NrjA1gpgh/SECRE61syoJq/RgZig68NKwAqEH4ISRwmINQ+pRqnZTjmSaT0LdgXrVb+4pUlztoBDjIJPUt6B4q06nw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d2be321-73ca-4473-5f12-08de8eea22ec
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 05:55:39.8541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+orZGbMhUnnhIPXR/X8FJVf1Qy2ts1qUjeXbqX30pjGyKYcz4ID6xf8QIK50uAdzix0IQPPYKTsktN5AE6LGibdtX2bgHTBzEVA1Gc8KgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6748
X-Authority-Analysis: v=2.4 cv=Zqjg6t7G c=1 sm=1 tr=0 ts=69cb61de cx=c_pps
 a=z/rjtr9/JqYX5j7IdmSYkQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=GHR8O2WEAAAA:20 a=SFbbONLXAAAA:20 a=1XWaLZrsAAAA:8 a=3g80flMcAAAA:8
 a=aiIX5UjjAAAA:8 a=t7CeM3EgAAAA:8 a=V2sgnzSHAAAA:8 a=pGLkceISAAAA:8
 a=A1X0JdhQAAAA:8 a=Pkdk1CNixluC7fb_OmcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3urWGuTZa-U-TZ_dHwj2:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-ORIG-GUID: G1JZafOnkmmy_6H1qoOhH6zT-AxFoBqf
X-Proofpoint-GUID: G1JZafOnkmmy_6H1qoOhH6zT-AxFoBqf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA1MyBTYWx0ZWRfX1oYGF9kHAa+n
 SgaKLpd+KadvEfILD52zE1D6H7+/z/wV3QEnSeJ5YygPqUwcYU/7jVbTblGu3AIPY7zg8lIfY9q
 PK7jI0z028AcTFOjbmvZ/EvPiYcOxAG4dTyTbwCUsVCFv3nif9CjMV6kpNIHN2siU2C3ZyIqHON
 TydWdzpbjxwT/C4gpQ9c96rlgaYFR7X6HV2VGcSVTPo4QpS2MXz3kR96fGlq/xfGMdbf1HosAxv
 vmBEOnsQiNCXFia/+RgsBzSNiNbFwgSGEtj/p8AYE8VhysLDbaOs69BjfL5HzLaaAR8IgYMPJHv
 izKHiQR/Ucj8hEb02QDQK0ZPxHgab0MRbKrvePyar2bPgKKM3a0VKwvIZhN1QOjBdjZ5ef6d9Vq
 UpZIxZENkkkarpTa9k/04H23kwPUaZvGG1pM5yZZgZc4S2BanGpQAyrGGP2qQQCRpfxt7plgSd9
 SP6dEWCveQvVHSeQW1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310053
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62V4SHhn2006267
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 05:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125875

This recipe is unmaintained now, and gvfs already disable google
option, so remove this recipe.

[1] https://gitlab.gnome.org/GNOME/gvfs/-/merge_requests/266
[2] https://gitlab.gnome.org/Archive/libgdata/-/merge_requests/49

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...01-Drop-usage-of-deprecated-GTimeVal.patch | 1134 -----------------
 .../recipes-gnome/libgdata/libgdata_0.18.1.bb |   34 -
 2 files changed, 1168 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/libgdata/libgdata/0001-Drop-=
usage-of-deprecated-GTimeVal.patch
 delete mode 100644 meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb

diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata/0001-Drop-usage-o=
f-deprecated-GTimeVal.patch b/meta-gnome/recipes-gnome/libgdata/libgdata/=
0001-Drop-usage-of-deprecated-GTimeVal.patch
deleted file mode 100644
index 6fb52d6d52..0000000000
--- a/meta-gnome/recipes-gnome/libgdata/libgdata/0001-Drop-usage-of-depre=
cated-GTimeVal.patch
+++ /dev/null
@@ -1,1134 +0,0 @@
-From ef8722baa444958601bfddfee3a977ccf4f7c02c Mon Sep 17 00:00:00 2001
-From: Daniel Kolesa <dkolesa@igalia.com>
-Date: Tue, 16 Mar 2021 17:22:08 +0100
-Subject: [PATCH] drop usage of deprecated GTimeVal
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libgdata/-/com=
mit/ef8722baa444958601bfddfee3a977ccf4f7c02c]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
-
----
- demos/calendar/calendar-cli.c                 | 90 ++++++++++++-------
- demos/tasks/tasks-cli.c                       | 31 ++++---
- demos/youtube/youtube-cli.c                   |  9 +-
- gdata/gdata-access-rule.c                     |  4 +-
- gdata/gdata-batch-operation.c                 |  8 +-
- gdata/gdata-oauth1-authorizer.c               |  6 +-
- gdata/gdata-parser.c                          | 48 +++++-----
- gdata/gdata-service.c                         |  5 +-
- .../services/calendar/gdata-calendar-event.c  | 18 ++--
- .../services/calendar/gdata-calendar-query.c  |  6 +-
- .../contacts/gdata-contacts-contact.c         |  4 +-
- .../services/contacts/gdata-contacts-group.c  |  4 +-
- .../documents/gdata-documents-query.c         |  8 +-
- .../picasaweb/gdata-picasaweb-album.c         |  8 +-
- .../services/picasaweb/gdata-picasaweb-file.c |  8 +-
- gdata/services/youtube/gdata-youtube-query.c  | 18 ++--
- .../services/youtube/gdata-youtube-service.c  | 10 ++-
- gdata/tests/calendar.c                        | 60 +++++++------
- gdata/tests/contacts.c                        | 22 +++--
- gdata/tests/general.c                         |  7 +-
- gdata/tests/perf.c                            | 15 ++--
- gdata/tests/picasaweb.c                       | 14 +--
- gdata/tests/youtube.c                         | 14 +--
- 23 files changed, 231 insertions(+), 186 deletions(-)
-
-diff --git a/demos/calendar/calendar-cli.c b/demos/calendar/calendar-cli=
.c
-index a1d84f67..4f601f48 100644
---- a/demos/calendar/calendar-cli.c
-+++ b/demos/calendar/calendar-cli.c
-@@ -38,13 +38,13 @@ print_usage (char *argv[])
- 	return -1;
- }
-=20
--/* Convert a GTimeVal to an ISO 8601 date string (without a time compon=
ent). */
-+/* Convert a unix time to an ISO 8601 date string (without a time compo=
nent). */
- static gchar *
--tv_to_iso8601_date (GTimeVal *tv)
-+tv_to_iso8601_date (gint64 tv)
- {
- 	struct tm *tm;
-=20
--	tm =3D gmtime (&tv->tv_sec);
-+	tm =3D gmtime (&tv);
-=20
- 	return g_strdup_printf ("%04d-%02d-%02d",
- 	                        tm->tm_year + 1900,
-@@ -81,8 +81,9 @@ print_event (GDataCalendarEvent *event)
- {
- 	const gchar *title, *id, *description, *status, *visibility;
- 	const gchar *transparency, *uid;
--	GTimeVal date_published_tv =3D { 0, };
--	GTimeVal date_edited_tv =3D { 0, };
-+	GDateTime *tmp;
-+	gint64 date_published_tv;
-+	gint64 date_edited_tv;
- 	gchar *date_published =3D NULL;  /* owned */
- 	gchar *date_edited =3D NULL;  /* owned */
- 	guint sequence;
-@@ -95,10 +96,14 @@ print_event (GDataCalendarEvent *event)
- 	title =3D gdata_entry_get_title (GDATA_ENTRY (event));
- 	id =3D gdata_entry_get_id (GDATA_ENTRY (event));
- 	description =3D gdata_entry_get_content (GDATA_ENTRY (event));
--	date_published_tv.tv_sec =3D gdata_entry_get_published (GDATA_ENTRY (e=
vent));
--	date_published =3D g_time_val_to_iso8601 (&date_published_tv);
--	date_edited_tv.tv_sec =3D gdata_calendar_event_get_edited (event);
--	date_edited =3D g_time_val_to_iso8601 (&date_edited_tv);
-+	date_published_tv =3D gdata_entry_get_published (GDATA_ENTRY (event));
-+	tmp =3D g_date_time_new_from_unix_utc (date_published_tv);
-+	date_published =3D g_date_time_format_iso8601 (tmp);
-+	g_date_time_unref (tmp);
-+	date_edited_tv =3D gdata_calendar_event_get_edited (event);
-+	tmp =3D g_date_time_new_from_unix_utc (date_edited_tv);
-+	date_edited =3D g_date_time_format_iso8601 (tmp);
-+	g_date_time_unref (tmp);
- 	status =3D gdata_calendar_event_get_status (event);
- 	visibility =3D gdata_calendar_event_get_visibility (event);
- 	transparency =3D gdata_calendar_event_get_transparency (event);
-@@ -155,20 +160,25 @@ print_event (GDataCalendarEvent *event)
-=20
- 	for (; times !=3D NULL; times =3D times->next) {
- 		GDataGDWhen *when;
--		GTimeVal start_time =3D { 0, }, end_time =3D { 0, };
-+		gint64 start_time, end_time;
- 		gchar *start =3D NULL, *end =3D NULL;  /* owned */
-=20
- 		when =3D GDATA_GD_WHEN (times->data);
-=20
--		start_time.tv_sec =3D gdata_gd_when_get_start_time (when);
--		end_time.tv_sec =3D gdata_gd_when_get_end_time (when);
-+		start_time =3D gdata_gd_when_get_start_time (when);
-+		end_time =3D gdata_gd_when_get_end_time (when);
-=20
- 		if (gdata_gd_when_is_date (when)) {
--			start =3D tv_to_iso8601_date (&start_time);
--			end =3D tv_to_iso8601_date (&end_time);
-+			start =3D tv_to_iso8601_date (start_time);
-+			end =3D tv_to_iso8601_date (end_time);
- 		} else {
--			start =3D g_time_val_to_iso8601 (&start_time);
--			end =3D g_time_val_to_iso8601 (&end_time);
-+			GDateTime *tmp;
-+			tmp =3D g_date_time_new_from_unix_utc (start_time);
-+			start =3D g_date_time_format_iso8601 (tmp);
-+			g_date_time_unref (tmp);
-+			tmp =3D g_date_time_new_from_unix_utc (end_time);
-+			end =3D g_date_time_format_iso8601 (tmp);
-+			g_date_time_unref (tmp);
- 		}
-=20
- 		g_print ("    =E2=80=A2 %s to %s (%s)\n",
-@@ -416,8 +426,7 @@ command_insert_event (int argc, char *argv[])
- 	GDataAuthorizer *authorizer =3D NULL;
- 	GDataGDWhen *when =3D NULL;
- 	gboolean is_date;
--	gchar *start_with_time =3D NULL, *end_with_time =3D NULL;
--	GTimeVal start_tv =3D { 0, }, end_tv =3D { 0, };
-+	GDateTime *start_tv =3D NULL, *end_tv =3D NULL;
- 	gint i;
-=20
- 	if (argc < 7) {
-@@ -454,25 +463,38 @@ command_insert_event (int argc, char *argv[])
- 	event =3D gdata_calendar_event_new (NULL);
- 	gdata_entry_set_title (GDATA_ENTRY (event), title);
-=20
--	start_with_time =3D g_strconcat (start, "T00:00:00Z", NULL);
--	end_with_time =3D g_strconcat (end, "T00:00:00Z", NULL);
--
--	if (g_time_val_from_iso8601 (start, &start_tv) &&
--	    g_time_val_from_iso8601 (end, &end_tv)) {
-+	start_tv =3D g_date_time_new_from_iso8601 (start, NULL);
-+	end_tv =3D g_date_time_new_from_iso8601 (end, NULL);
-+	if (start_tv && end_tv) {
- 		/* Includes time. */
- 		is_date =3D FALSE;
--	} else if (g_time_val_from_iso8601 (start_with_time, &start_tv) &&
--	           g_time_val_from_iso8601 (end_with_time, &end_tv)) {
--		/* Does not include time. */
--		is_date =3D TRUE;
- 	} else {
--		g_printerr ("%s: Could not parse start time =E2=80=98%s=E2=80=99 and =
end time "
--		            "=E2=80=98%s=E2=80=99 as ISO 8601.\n", argv[0], start, en=
d);
--		retval =3D 1;
--		goto done;
-+		gchar *start_with_time, *end_with_time;
-+
-+		g_clear_pointer (&start_tv, g_date_time_unref);
-+		g_clear_pointer (&end_tv, g_date_time_unref);
-+
-+		start_with_time =3D g_strconcat (start, "T00:00:00Z", NULL);
-+		end_with_time =3D g_strconcat (end, "T00:00:00Z", NULL);
-+
-+		start_tv =3D g_date_time_new_from_iso8601 (start_with_time, NULL);
-+		end_tv =3D g_date_time_new_from_iso8601 (end_with_time, NULL);
-+
-+		g_free (start_with_time);
-+		g_free (end_with_time);
-+
-+		if (start_tv && end_tv) {
-+			/* Does not include time. */
-+			is_date =3D TRUE;
-+		} else {
-+			g_printerr ("%s: Could not parse start time =E2=80=98%s=E2=80=99 and=
 end time "
-+			            "=E2=80=98%s=E2=80=99 as ISO 8601.\n", argv[0], start, e=
nd);
-+			retval =3D 1;
-+			goto done;
-+		}
- 	}
-=20
--	when =3D gdata_gd_when_new (start_tv.tv_sec, end_tv.tv_sec, is_date);
-+	when =3D gdata_gd_when_new (g_date_time_to_unix (start_tv), g_date_tim=
e_to_unix (end_tv), is_date);
- 	gdata_calendar_event_add_time (event, when);
- 	g_object_unref (when);
-=20
-@@ -507,8 +529,8 @@ command_insert_event (int argc, char *argv[])
- 	print_event (inserted_event);
-=20
- done:
--	g_free (start_with_time);
--	g_free (end_with_time);
-+	g_clear_pointer (&start_tv, g_date_time_unref);
-+	g_clear_pointer (&end_tv, g_date_time_unref);
- 	g_clear_object (&inserted_event);
- 	g_clear_object (&event);
- 	g_clear_object (&authorizer);
-diff --git a/demos/tasks/tasks-cli.c b/demos/tasks/tasks-cli.c
-index c795761a..ef4ae900 100644
---- a/demos/tasks/tasks-cli.c
-+++ b/demos/tasks/tasks-cli.c
-@@ -67,35 +67,42 @@ print_task (GDataTasksTask *task)
- {
- 	const gchar *title, *id, *description, *parent_id, *position, *notes;
- 	const gchar *status;
--	GTimeVal date_published_tv =3D { 0, };
-+	GDateTime *tmp;
-+	gint64 date_published_tv;
- 	gchar *date_published =3D NULL;  /* owned */
--	GTimeVal due_tv =3D { 0, };
-+	gint64 due_tv;
- 	gchar *due =3D NULL;  /* owned */
--	GTimeVal completed_tv =3D { 0, };
-+	gint64 completed_tv;
- 	gchar *completed =3D NULL;  /* owned */
- 	gboolean is_deleted, is_hidden;
-=20
- 	title =3D gdata_entry_get_title (GDATA_ENTRY (task));
- 	id =3D gdata_entry_get_id (GDATA_ENTRY (task));
- 	description =3D gdata_entry_get_content (GDATA_ENTRY (task));
--	date_published_tv.tv_sec =3D gdata_entry_get_published (GDATA_ENTRY (t=
ask));
--	date_published =3D g_time_val_to_iso8601 (&date_published_tv);
-+	date_published_tv =3D gdata_entry_get_published (GDATA_ENTRY (task));
-+	tmp =3D g_date_time_new_from_unix_utc (date_published_tv);
-+	date_published =3D g_date_time_format_iso8601 (tmp);
-+	g_date_time_unref (tmp);
- 	parent_id =3D gdata_tasks_task_get_parent (task);
- 	position =3D gdata_tasks_task_get_position (task);
- 	notes =3D gdata_tasks_task_get_notes (task);
- 	status =3D gdata_tasks_task_get_status (task);
--	due_tv.tv_sec =3D gdata_tasks_task_get_due (task);
--	due =3D g_time_val_to_iso8601 (&due_tv);
--	completed_tv.tv_sec =3D gdata_tasks_task_get_completed (task);
--	completed =3D g_time_val_to_iso8601 (&completed_tv);
-+	due_tv =3D gdata_tasks_task_get_due (task);
-+	tmp =3D g_date_time_new_from_unix_utc (due_tv);
-+	due =3D g_date_time_format_iso8601 (tmp);
-+	g_date_time_unref (tmp);
-+	completed_tv =3D gdata_tasks_task_get_completed (task);
-+	tmp =3D g_date_time_new_from_unix_utc (completed_tv);
-+	completed =3D g_date_time_format_iso8601 (tmp);
-+	g_date_time_unref (tmp);
- 	is_deleted =3D gdata_tasks_task_is_deleted (task);
- 	is_hidden =3D gdata_tasks_task_is_hidden (task);
-=20
- 	g_print ("%s =E2=80=94 %s\n", id, title);
--	g_print ("   Published: %s\n", date_published_tv.tv_sec !=3D 0 ? date_=
published : "unknown");
-+	g_print ("   Published: %s\n", date_published_tv !=3D 0 ? date_publish=
ed : "unknown");
- 	g_print ("   Status: %s\n", format_status (status));
--	g_print ("   Due: %s\n", due_tv.tv_sec !=3D 0 ? due : "not set");
--	g_print ("   Completed: %s\n", completed_tv.tv_sec !=3D 0 ? completed =
: "not yet");
-+	g_print ("   Due: %s\n", due_tv !=3D 0 ? due : "not set");
-+	g_print ("   Completed: %s\n", completed_tv !=3D 0 ? completed : "not =
yet");
- 	g_print ("   Deleted? %s\n", is_deleted ? "Yes" : "No");
- 	g_print ("   Hidden? %s\n", is_hidden ? "Yes" : "No");
- 	g_print ("   Position: %s\n", position);
-diff --git a/demos/youtube/youtube-cli.c b/demos/youtube/youtube-cli.c
-index 37ff4afc..e3e0e3dc 100644
---- a/demos/youtube/youtube-cli.c
-+++ b/demos/youtube/youtube-cli.c
-@@ -46,7 +46,8 @@ print_video (GDataYouTubeVideo *video)
- {
- 	const gchar *title, *player_uri, *id, *description;
- 	GList/*<unowned GDataMediaThumbnail>*/ *thumbnails;
--	GTimeVal date_published_tv =3D { 0, };
-+	GDateTime *tmp;
-+	gint64 date_published_tv;
- 	gchar *date_published =3D NULL;  /* owned */
- 	guint duration;  /* seconds */
- 	guint rating_min =3D 0, rating_max =3D 0, rating_count =3D 0;
-@@ -57,8 +58,10 @@ print_video (GDataYouTubeVideo *video)
- 	id =3D gdata_entry_get_id (GDATA_ENTRY (video));
- 	description =3D gdata_youtube_video_get_description (video);
- 	thumbnails =3D gdata_youtube_video_get_thumbnails (video);
--	date_published_tv.tv_sec =3D gdata_entry_get_published (GDATA_ENTRY (v=
ideo));
--	date_published =3D g_time_val_to_iso8601 (&date_published_tv);
-+	date_published_tv =3D gdata_entry_get_published (GDATA_ENTRY (video));
-+	tmp =3D g_date_time_new_from_unix_utc (date_published_tv);
-+	date_published =3D g_date_time_format_iso8601 (tmp);
-+	g_date_time_unref (tmp);
- 	duration =3D gdata_youtube_video_get_duration (video);
- 	gdata_youtube_video_get_rating (video, &rating_min, &rating_max,
- 	                                &rating_count, &rating_average);
-diff --git a/gdata/gdata-access-rule.c b/gdata/gdata-access-rule.c
-index 9fd1ce95..0064623f 100644
---- a/gdata/gdata-access-rule.c
-+++ b/gdata/gdata-access-rule.c
-@@ -257,12 +257,10 @@ gdata_access_rule_constructor (GType type, guint n=
_construct_params, GObjectCons
- 	/* We can't create these in init, or they would collide with the group=
 and control created when parsing the XML */
- 	if (_gdata_parsable_is_constructed_from_xml (GDATA_PARSABLE (object)) =
=3D=3D FALSE) {
- 		GDataAccessRulePrivate *priv =3D GDATA_ACCESS_RULE (object)->priv;
--		GTimeVal time_val;
-=20
- 		/* Set the edited property to the current time (creation time). We do=
n't do this in *_init() since that would cause
- 		 * setting it from parse_xml() to fail (duplicate element). */
--		g_get_current_time (&time_val);
--		priv->edited =3D time_val.tv_sec;
-+		priv->edited =3D g_get_real_time () / G_USEC_PER_SEC;
-=20
- 		/* Set up the role and scope type */
- 		priv->role =3D g_strdup (GDATA_ACCESS_ROLE_NONE);
-diff --git a/gdata/gdata-batch-operation.c b/gdata/gdata-batch-operation=
.c
-index f78801ed..212fcb0b 100644
---- a/gdata/gdata-batch-operation.c
-+++ b/gdata/gdata-batch-operation.c
-@@ -598,7 +598,7 @@ gdata_batch_operation_run (GDataBatchOperation *self=
, GCancellable *cancellable,
- 	GDataBatchOperationPrivate *priv =3D self->priv;
- 	SoupMessage *message;
- 	GDataFeed *feed;
--	GTimeVal updated;
-+	gint64 updated;
- 	gchar *upload_data;
- 	guint status;
- 	GHashTableIter iter;
-@@ -638,9 +638,9 @@ gdata_batch_operation_run (GDataBatchOperation *self=
, GCancellable *cancellable,
- 	message =3D _gdata_service_build_message (priv->service, priv->authori=
zation_domain, SOUP_METHOD_POST, priv->feed_uri, NULL, TRUE);
-=20
- 	/* Build the request */
--	g_get_current_time (&updated);
-+	updated =3D g_get_real_time () / G_USEC_PER_SEC;
- 	feed =3D _gdata_feed_new (GDATA_TYPE_FEED, "Batch operation feed",
--	                        "batch1", updated.tv_sec);
-+	                        "batch1", updated);
-=20
- 	g_hash_table_iter_init (&iter, priv->operations);
- 	while (g_hash_table_iter_next (&iter, &op_id, (gpointer*) &op) =3D=3D =
TRUE) {
-@@ -658,7 +658,7 @@ gdata_batch_operation_run (GDataBatchOperation *self=
, GCancellable *cancellable,
- 			g_free (entry_uri);
-=20
- 			gdata_entry_set_title (entry, "Batch operation query");
--			_gdata_entry_set_updated (entry, updated.tv_sec);
-+			_gdata_entry_set_updated (entry, updated);
-=20
- 			_gdata_entry_set_batch_data (entry, op->id, op->type);
- 			_gdata_feed_add_entry (feed, entry);
-diff --git a/gdata/gdata-oauth1-authorizer.c b/gdata/gdata-oauth1-author=
izer.c
-index 7b857ac0..6d5fd5ec 100644
---- a/gdata/gdata-oauth1-authorizer.c
-+++ b/gdata/gdata-oauth1-authorizer.c
-@@ -471,7 +471,7 @@ sign_message (GDataOAuth1Authorizer *self, SoupMessa=
ge *message, const gchar *to
- 	gchar *uri, *signature, *timestamp;
- 	char *nonce;
- 	gboolean is_first =3D TRUE;
--	GTimeVal time_val;
-+	gint64 time_val;
- 	guchar signature_buf[HMAC_SHA1_LEN];
- 	gsize signature_buf_len;
- 	GHmac *signature_hmac;
-@@ -494,8 +494,8 @@ sign_message (GDataOAuth1Authorizer *self, SoupMessa=
ge *message, const gchar *to
-=20
- 	/* Add various standard parameters to the list (note: this modifies th=
e hash table belonging to the caller) */
- 	nonce =3D oauth_gen_nonce ();
--	g_get_current_time (&time_val);
--	timestamp =3D g_strdup_printf ("%li", time_val.tv_sec);
-+	time_val =3D g_get_real_time () / G_USEC_PER_SEC;
-+	timestamp =3D g_strdup_printf ("%li", time_val);
-=20
- 	if (parameters =3D=3D NULL) {
- 		parameters =3D g_hash_table_new (g_str_hash, g_str_equal);
-diff --git a/gdata/gdata-parser.c b/gdata/gdata-parser.c
-index c1cfe00d..d6ab92e2 100644
---- a/gdata/gdata-parser.c
-+++ b/gdata/gdata-parser.c
-@@ -207,21 +207,22 @@ gboolean
- gdata_parser_int64_from_date (const gchar *date, gint64 *_time)
- {
- 	gchar *iso8601_date;
--	gboolean success;
--	GTimeVal time_val;
-+	g_autoptr(GDateTime) time_val =3D NULL;
-=20
- 	if (strlen (date) !=3D 10 && strlen (date) !=3D 8)
- 		return FALSE;
-=20
- 	/* Note: This doesn't need translating, as it's outputting an ISO 8601=
 time string */
- 	iso8601_date =3D g_strdup_printf ("%sT00:00:00Z", date);
--	success =3D g_time_val_from_iso8601 (iso8601_date, &time_val);
-+	time_val =3D g_date_time_new_from_iso8601 (iso8601_date, NULL);
- 	g_free (iso8601_date);
-=20
--	if (success =3D=3D TRUE)
--		*_time =3D time_val.tv_sec;
-+	if (time_val) {
-+		*_time =3D g_date_time_to_unix (time_val);
-+		return TRUE;
-+	}
-=20
--	return success;
-+	return FALSE;
- }
-=20
- gchar *
-@@ -240,21 +241,24 @@ gdata_parser_date_from_int64 (gint64 _time)
- gchar *
- gdata_parser_int64_to_iso8601 (gint64 _time)
- {
--	GTimeVal time_val;
-+	g_autoptr(GDateTime) time_val =3D NULL;
-+
-+	time_val =3D g_date_time_new_from_unix_utc (_time);
-=20
--	time_val.tv_sec =3D _time;
--	time_val.tv_usec =3D 0;
-+	if (!time_val)
-+		return NULL;
-=20
--	return g_time_val_to_iso8601 (&time_val);
-+	return g_date_time_format_iso8601 (time_val);
- }
-=20
- gboolean
- gdata_parser_int64_from_iso8601 (const gchar *date, gint64 *_time)
- {
--	GTimeVal time_val;
-+	g_autoptr(GDateTime) time_val =3D NULL;
-=20
--	if (g_time_val_from_iso8601 (date, &time_val) =3D=3D TRUE) {
--		*_time =3D time_val.tv_sec;
-+	time_val =3D g_date_time_new_from_iso8601 (date, NULL);
-+	if (time_val) {
-+		*_time =3D g_date_time_to_unix (time_val);
- 		return TRUE;
- 	}
-=20
-@@ -479,7 +483,7 @@ gdata_parser_int64_time_from_element (xmlNode *eleme=
nt, const gchar *element_nam
-                                       gint64 *output, gboolean *success=
, GError **error)
- {
- 	xmlChar *text;
--	GTimeVal time_val;
-+	g_autoptr(GDateTime) time_val =3D NULL;
-=20
- 	/* Check it's the right element */
- 	if (xmlStrcmp (element->name, (xmlChar*) element_name) !=3D 0)
-@@ -499,14 +503,15 @@ gdata_parser_int64_time_from_element (xmlNode *ele=
ment, const gchar *element_nam
- 		return TRUE;
- 	}
-=20
--	/* Attempt to parse the string as a GTimeVal */
--	if (g_time_val_from_iso8601 ((gchar*) text, &time_val) =3D=3D FALSE) {
-+	/* Attempt to parse the string as a GDateTune */
-+	time_val =3D g_date_time_new_from_iso8601 ((gchar *) text, NULL);
-+	if (!time_val) {
- 		*success =3D gdata_parser_error_not_iso8601_format (element, (gchar*)=
 text, error);
- 		xmlFree (text);
- 		return TRUE;
- 	}
-=20
--	*output =3D time_val.tv_sec;
-+	*output =3D g_date_time_to_unix (time_val);
-=20
- 	/* Success! */
- 	xmlFree (text);
-@@ -911,7 +916,7 @@ gdata_parser_int64_time_from_json_member (JsonReader=
 *reader, const gchar *membe
-                                           gint64 *output, gboolean *suc=
cess, GError **error)
- {
- 	const gchar *text;
--	GTimeVal time_val;
-+	g_autoptr(GDateTime) time_val =3D NULL;
- 	const GError *child_error =3D NULL;
-=20
- 	/* Check if there's such element */
-@@ -935,14 +940,15 @@ gdata_parser_int64_time_from_json_member (JsonRead=
er *reader, const gchar *membe
- 		return TRUE;
- 	}
-=20
--	/* Attempt to parse the string as a GTimeVal */
--	if (g_time_val_from_iso8601 ((gchar*) text, &time_val) =3D=3D FALSE) {
-+	/* Attempt to parse the string as a GDateTime */
-+	time_val =3D g_date_time_new_from_iso8601 (text, NULL);
-+	if (!time_val) {
- 		*success =3D gdata_parser_error_not_iso8601_format_json (reader, text=
, error);
- 		return TRUE;
- 	}
-=20
- 	/* Success! */
--	*output =3D time_val.tv_sec;
-+	*output =3D g_date_time_to_unix (time_val);
- 	*success =3D TRUE;
-=20
- 	return TRUE;
-diff --git a/gdata/gdata-service.c b/gdata/gdata-service.c
-index fce970ec..40fbaf84 100644
---- a/gdata/gdata-service.c
-+++ b/gdata/gdata-service.c
-@@ -956,12 +956,9 @@ __gdata_service_query (GDataService *self, GDataAut=
horizationDomain *domain, con
-=20
- 	/* Are we off the end of the final page? */
- 	if (query !=3D NULL && _gdata_query_is_finished (query)) {
--		GTimeVal updated;
--
- 		/* Build an empty dummy feed to signify the end of the list. */
--		g_get_current_time (&updated);
- 		return _gdata_feed_new (klass->feed_type, "Empty feed", "feed1",
--		                        updated.tv_sec);
-+		                        g_get_real_time () / G_USEC_PER_SEC);
- 	}
-=20
- 	/* Send the request. */
-diff --git a/gdata/services/calendar/gdata-calendar-event.c b/gdata/serv=
ices/calendar/gdata-calendar-event.c
-index a3a4d713..4cdf2700 100644
---- a/gdata/services/calendar/gdata-calendar-event.c
-+++ b/gdata/services/calendar/gdata-calendar-event.c
-@@ -37,7 +37,7 @@
-  *	GDataGDWhere *where;
-  *	GDataGDWho *who;
-  *	GDataGDWhen *when;
-- *	GTimeVal current_time;
-+ *	gint64 current_time;
-  *	GError *error =3D NULL;
-  *
-  *	/<!-- -->* Create a service *<!-- -->/
-@@ -58,8 +58,8 @@
-  *	gdata_calendar_event_add_person (event, who);
-  *	g_object_unref (who);
-  *
-- *	g_get_current_time (&current_time);
-- *	when =3D gdata_gd_when_new (current_time.tv_sec, current_time.tv_sec=
 + 3600, FALSE);
-+ *	current_time =3D g_get_real_time () / G_USEC_PER_SEC;
-+ *	when =3D gdata_gd_when_new (current_time, current_time + 3600, FALSE=
);
-  *	gdata_calendar_event_add_time (event, when);
-  *	g_object_unref (when);
-  *
-@@ -374,12 +374,10 @@ gdata_calendar_event_constructor (GType type, guin=
t n_construct_params, GObjectC
-=20
- 	if (_gdata_parsable_is_constructed_from_xml (GDATA_PARSABLE (object)) =
=3D=3D FALSE) {
- 		GDataCalendarEventPrivate *priv =3D GDATA_CALENDAR_EVENT (object)->pr=
iv;
--		GTimeVal time_val;
-=20
- 		/* Set the edited property to the current time (creation time). We do=
n't do this in *_init() since that would cause
- 		 * setting it from parse_xml() to fail (duplicate element). */
--		g_get_current_time (&time_val);
--		priv->edited =3D time_val.tv_sec;
-+		priv->edited =3D g_get_real_time () / G_USEC_PER_SEC;
- 	}
-=20
- 	return object;
-@@ -554,7 +552,7 @@ date_object_from_json (JsonReader *reader,
- 	if (json_reader_read_member (reader, "dateTime")) {
- 		const gchar *date_string;
- 		const GError *child_error;
--		GTimeVal time_val;
-+		GDateTime *time_val;
-=20
- 		date_string =3D json_reader_get_string_value (reader);
- 		child_error =3D json_reader_get_error (reader);
-@@ -567,13 +565,15 @@ date_object_from_json (JsonReader *reader,
- 			return TRUE;
- 		}
-=20
--		if (!g_time_val_from_iso8601 (date_string, &time_val)) {
-+		time_val =3D g_date_time_new_from_iso8601 (date_string, NULL);
-+		if (!time_val) {
- 			*success =3D gdata_parser_error_not_iso8601_format_json (reader, dat=
e_string, error);
- 			json_reader_end_member (reader);
- 			return TRUE;
- 		}
-=20
--		date_time =3D time_val.tv_sec;
-+		date_time =3D g_date_time_to_unix (time_val);
-+		g_date_time_unref (time_val);
- 		is_date =3D FALSE;
- 		found_member =3D TRUE;
- 	}
-diff --git a/gdata/services/calendar/gdata-calendar-query.c b/gdata/serv=
ices/calendar/gdata-calendar-query.c
-index 37779bbe..dd019529 100644
---- a/gdata/services/calendar/gdata-calendar-query.c
-+++ b/gdata/services/calendar/gdata-calendar-query.c
-@@ -37,7 +37,7 @@
-  *	GDataCalendarCalendar *calendar;
-  *	GDataCalendarQuery *query;
-  *	GDataFeed *feed;
-- *	GTimeVal current_time;
-+ *	gint64 current_time;
-  *	GList *i;
-  *	GError *error =3D NULL;
-  *
-@@ -47,8 +47,8 @@
-  *
-  *	/<!-- -->* Create the query to use. We're going to query for events =
within the next week which match the search term "party",
-  *	 * ordered by last modification time (descending). *<!-- -->/
-- *	g_get_current_time (&current_time);
-- *	query =3D gdata_calendar_query_new_with_limits ("party", current_tim=
e.tv_sec, current_time.tv_sec + 7 * 24 * 60 * 60);
-+ *	current_time =3D g_get_real_time () / G_USEC_PER_SEC;
-+ *	query =3D gdata_calendar_query_new_with_limits ("party", current_tim=
e, current_time + 7 * 24 * 60 * 60);
-  *	gdata_calendar_query_set_order_by (query, "lastmodified");
-  *
-  *	/<!-- -->* Execute the query *<!-- -->/
-diff --git a/gdata/services/contacts/gdata-contacts-contact.c b/gdata/se=
rvices/contacts/gdata-contacts-contact.c
-index 4f511315..eb4148d0 100644
---- a/gdata/services/contacts/gdata-contacts-contact.c
-+++ b/gdata/services/contacts/gdata-contacts-contact.c
-@@ -582,12 +582,10 @@ gdata_contacts_contact_constructor (GType type, gu=
int n_construct_params, GObjec
-=20
- 	if (_gdata_parsable_is_constructed_from_xml (GDATA_PARSABLE (object)) =
=3D=3D FALSE) {
- 		GDataContactsContactPrivate *priv =3D GDATA_CONTACTS_CONTACT (object)=
->priv;
--		GTimeVal time_val;
-=20
- 		/* Set the edited property to the current time (creation time). We do=
n't do this in *_init() since that would cause
- 		 * setting it from parse_xml() to fail (duplicate element). */
--		g_get_current_time (&time_val);
--		priv->edited =3D time_val.tv_sec;
-+		priv->edited =3D g_get_real_time () / G_USEC_PER_SEC;
- 	}
-=20
- 	return object;
-diff --git a/gdata/services/contacts/gdata-contacts-group.c b/gdata/serv=
ices/contacts/gdata-contacts-group.c
-index 055f4255..2059369a 100644
---- a/gdata/services/contacts/gdata-contacts-group.c
-+++ b/gdata/services/contacts/gdata-contacts-group.c
-@@ -266,12 +266,10 @@ gdata_contacts_group_constructor (GType type, guin=
t n_construct_params, GObjectC
-=20
- 	if (_gdata_parsable_is_constructed_from_xml (GDATA_PARSABLE (object)) =
=3D=3D FALSE) {
- 		GDataContactsGroupPrivate *priv =3D GDATA_CONTACTS_GROUP (object)->pr=
iv;
--		GTimeVal time_val;
-=20
- 		/* Set the edited property to the current time (creation time). We do=
n't do this in *_init() since that would cause setting it from
- 		 * parse_xml() to fail (duplicate element). */
--		g_get_current_time (&time_val);
--		priv->edited =3D time_val.tv_sec;
-+		priv->edited =3D g_get_real_time () / G_USEC_PER_SEC;
- 	}
-=20
- 	return object;
-diff --git a/gdata/services/documents/gdata-documents-query.c b/gdata/se=
rvices/documents/gdata-documents-query.c
-index e589b524..4797718f 100644
---- a/gdata/services/documents/gdata-documents-query.c
-+++ b/gdata/services/documents/gdata-documents-query.c
-@@ -37,7 +37,7 @@
-  *	GDataDocumentsService *service;
-  *	GDataDocumentsQuery *query;
-  *	GDataFeed *feed;
-- *	GTimeVal current_time;
-+ *	gint64 current_time;
-  *	GList *i;
-  *	GError *error =3D NULL;
-  *
-@@ -51,9 +51,9 @@
-  *	gdata_documents_query_add_collaborator (query, "example@gmail.com");
-  *	gdata_documents_query_set_show_deleted (query, TRUE);
-  *
-- *	g_get_current_time (&current_time);
-- *	gdata_query_set_updated_min (GDATA_QUERY (query), current_time.tv_se=
c - 7 * 24 * 60 * 60);
-- *	gdata_query_set_updated_max (GDATA_QUERY (query), current_time.tv_se=
c);
-+ *	current_time =3D g_get_real_time () / G_USEC_PER_SEC;
-+ *	gdata_query_set_updated_min (GDATA_QUERY (query), current_time - 7 *=
 24 * 60 * 60);
-+ *	gdata_query_set_updated_max (GDATA_QUERY (query), current_time);
-  *
-  *	/<!-- -->* Execute the query *<!-- -->/
-  *	feed =3D gdata_documents_service_query_documents (service, query, NU=
LL, NULL, NULL, &error);
-diff --git a/gdata/services/picasaweb/gdata-picasaweb-album.c b/gdata/se=
rvices/picasaweb/gdata-picasaweb-album.c
-index 40fd8cfb..fd6d0abc 100644
---- a/gdata/services/picasaweb/gdata-picasaweb-album.c
-+++ b/gdata/services/picasaweb/gdata-picasaweb-album.c
-@@ -507,13 +507,13 @@ gdata_picasaweb_album_constructor (GType type, gui=
nt n_construct_params, GObject
-=20
- 	if (_gdata_parsable_is_constructed_from_xml (GDATA_PARSABLE (object)) =
=3D=3D FALSE) {
- 		GDataPicasaWebAlbumPrivate *priv =3D GDATA_PICASAWEB_ALBUM (object)->=
priv;
--		GTimeVal time_val;
-+		gint64 time_val;
-=20
- 		/* Set the edited and timestamp properties to the current time (creat=
ion time). bgo#599140
- 		 * We don't do this in *_init() since that would cause setting it fro=
m parse_xml() to fail (duplicate element). */
--		g_get_current_time (&time_val);
--		priv->timestamp =3D (gint64) time_val.tv_sec * 1000;
--		priv->edited =3D time_val.tv_sec;
-+		time_val =3D g_get_real_time () / G_USEC_PER_SEC;
-+		priv->timestamp =3D time_val * 1000;
-+		priv->edited =3D time_val;
- 	}
-=20
- 	return object;
-diff --git a/gdata/services/picasaweb/gdata-picasaweb-file.c b/gdata/ser=
vices/picasaweb/gdata-picasaweb-file.c
-index 53aab33b..96db23a6 100644
---- a/gdata/services/picasaweb/gdata-picasaweb-file.c
-+++ b/gdata/services/picasaweb/gdata-picasaweb-file.c
-@@ -690,13 +690,13 @@ gdata_picasaweb_file_constructor (GType type, guin=
t n_construct_params, GObjectC
-=20
- 	if (_gdata_parsable_is_constructed_from_xml (GDATA_PARSABLE (object)) =
=3D=3D FALSE) {
- 		GDataPicasaWebFilePrivate *priv =3D GDATA_PICASAWEB_FILE (object)->pr=
iv;
--		GTimeVal time_val;
-+		gint64 time_val;
-=20
- 		/* Set the edited and timestamp properties to the current time (creat=
ion time). bgo#599140
- 		 * We don't do this in *_init() since that would cause setting it fro=
m parse_xml() to fail (duplicate element). */
--		g_get_current_time (&time_val);
--		priv->timestamp =3D (gint64) time_val.tv_sec * 1000;
--		priv->edited =3D time_val.tv_sec;
-+		time_val =3D g_get_real_time () / G_USEC_PER_SEC;
-+		priv->timestamp =3D time_val * 1000;
-+		priv->edited =3D time_val;
- 	}
-=20
- 	return object;
-diff --git a/gdata/services/youtube/gdata-youtube-query.c b/gdata/servic=
es/youtube/gdata-youtube-query.c
-index 212a0d10..bb5cff15 100644
---- a/gdata/services/youtube/gdata-youtube-query.c
-+++ b/gdata/services/youtube/gdata-youtube-query.c
-@@ -572,22 +572,20 @@ get_query_uri (GDataQuery *self, const gchar *feed=
_uri, GString *query_uri, gboo
-=20
- 	if (priv->age !=3D GDATA_YOUTUBE_AGE_ALL_TIME) {
- 		gchar *after;
--		GTimeVal tv =3D { 0, };
-+		GDateTime *tv, *tv2;
-=20
--		g_get_current_time (&tv);
--
--		/* Squash the microseconds; they=E2=80=99re not useful. */
--		tv.tv_usec =3D 0;
-+		/* don't use g_date_time_new_now_utc (squash microseconds) */
-+		tv2 =3D g_date_time_new_from_unix_utc (g_get_real_time () / G_USEC_PE=
R_SEC);
-=20
- 		switch (priv->age) {
- 		case GDATA_YOUTUBE_AGE_TODAY:
--			tv.tv_sec -=3D 24 * 60 * 60;
-+			tv =3D g_date_time_add_days (tv2, -1);
- 			break;
- 		case GDATA_YOUTUBE_AGE_THIS_WEEK:
--			tv.tv_sec -=3D 7 * 24 * 60 * 60;
-+			tv =3D g_date_time_add_weeks (tv2, -1);
- 			break;
- 		case GDATA_YOUTUBE_AGE_THIS_MONTH:
--			tv.tv_sec -=3D 31 * 24 * 60 * 60;
-+			tv =3D g_date_time_add_months (tv2, -1);
- 			break;
- 		case GDATA_YOUTUBE_AGE_ALL_TIME:
- 		default:
-@@ -596,9 +594,11 @@ get_query_uri (GDataQuery *self, const gchar *feed_=
uri, GString *query_uri, gboo
-=20
- 		APPEND_SEP
-=20
--		after =3D g_time_val_to_iso8601 (&tv);
-+		after =3D g_date_time_format_iso8601 (tv);
- 		g_string_append_printf (query_uri, "publishedAfter=3D%s", after);
- 		g_free (after);
-+		g_date_time_unref (tv);
-+		g_date_time_unref (tv2);
- 	}
-=20
- 	/* We don=E2=80=99t need to use APPEND_SEP below here, as this paramet=
er is
-diff --git a/gdata/services/youtube/gdata-youtube-service.c b/gdata/serv=
ices/youtube/gdata-youtube-service.c
-index 75134e57..35994c54 100644
---- a/gdata/services/youtube/gdata-youtube-service.c
-+++ b/gdata/services/youtube/gdata-youtube-service.c
-@@ -684,14 +684,16 @@ standard_feed_type_to_feed_uri (GDataYouTubeStanda=
rdFeedType feed_type)
- 	case GDATA_YOUTUBE_RECENTLY_FEATURED_FEED:
- 	case GDATA_YOUTUBE_WATCH_ON_MOBILE_FEED: {
- 		gchar *date, *out;
--		GTimeVal tv;
-+		GDateTime *tv, *tv2;
-=20
- 		/* All feed types except MOST_POPULAR have been deprecated for
- 		 * a while, and fall back to MOST_POPULAR on the server anyway.
- 		 * See: https://developers.google.com/youtube/2.0/developers_guide_pr=
otocol_video_feeds#Standard_feeds */
--		g_get_current_time (&tv);
--		tv.tv_sec -=3D 24 * 60 * 60;  /* 1 day ago */
--		date =3D g_time_val_to_iso8601 (&tv);
-+		tv =3D g_date_time_new_now_utc ();
-+		tv2 =3D g_date_time_add_days (tv, -1);
-+		g_date_time_unref (tv);
-+		date =3D g_date_time_format_iso8601 (tv2);
-+		g_date_time_unref (tv2);
- 		out =3D _gdata_service_build_uri ("https://www.googleapis.com/youtube=
/v3/videos"
- 		                                "?part=3Dsnippet"
- 		                                "&chart=3DmostPopular"
-diff --git a/gdata/tests/calendar.c b/gdata/tests/calendar.c
-index 4d70d1b7..87fb0b81 100644
---- a/gdata/tests/calendar.c
-+++ b/gdata/tests/calendar.c
-@@ -495,7 +495,7 @@ test_event_insert (InsertEventData *data, gconstpoin=
ter service)
- 	GDataGDWhere *where;
- 	GDataGDWho *who;
- 	GDataGDWhen *when;
--	GTimeVal start_time, end_time;
-+	GDateTime *start_time, *end_time;
- 	GError *error =3D NULL;
-=20
- 	gdata_test_mock_server_start_trace (mock_server, "event-insert");
-@@ -512,11 +512,13 @@ test_event_insert (InsertEventData *data, gconstpo=
inter service)
- 	who =3D gdata_gd_who_new (GDATA_GD_WHO_EVENT_ORGANIZER, "John Smith=E2=
=80=BD", "john.smith@example.com");
- 	gdata_calendar_event_add_person (event, who);
- 	g_object_unref (who);
--	g_time_val_from_iso8601 ("2009-04-17T15:00:00.000Z", &start_time);
--	g_time_val_from_iso8601 ("2009-04-17T17:00:00.000Z", &end_time);
--	when =3D gdata_gd_when_new (start_time.tv_sec, end_time.tv_sec, FALSE)=
;
-+	start_time =3D g_date_time_new_from_iso8601 ("2009-04-17T15:00:00.000Z=
", NULL);
-+	end_time =3D g_date_time_new_from_iso8601 ("2009-04-17T17:00:00.000Z",=
 NULL);
-+	when =3D gdata_gd_when_new (g_date_time_to_unix (start_time), g_date_t=
ime_to_unix (end_time), FALSE);
- 	gdata_calendar_event_add_time (event, when);
- 	g_object_unref (when);
-+	g_date_time_unref (start_time);
-+	g_date_time_unref (end_time);
-=20
- 	/* Insert the event */
- 	new_event =3D data->new_event =3D gdata_calendar_service_insert_calend=
ar_event (GDATA_CALENDAR_SERVICE (service),
-@@ -540,8 +542,8 @@ G_STMT_START {
- 	GDataGDWhere *where;
- 	GDataGDWho *who;
- 	GDataGDWhen *when;
--	GTimeVal start_time;
--	GTimeVal end_time;
-+	GDateTime *start_time;
-+	GDateTime *end_time;
-=20
- 	event =3D gdata_calendar_event_new (NULL);
-=20
-@@ -555,11 +557,13 @@ G_STMT_START {
- 	who =3D gdata_gd_who_new (GDATA_GD_WHO_EVENT_ORGANIZER, "John Smith=E2=
=80=BD", "john.smith@example.com");
- 	gdata_calendar_event_add_person (event, who);
- 	g_object_unref (who);
--	g_time_val_from_iso8601 ("2009-04-17T15:00:00.000Z", &start_time);
--	g_time_val_from_iso8601 ("2009-04-17T17:00:00.000Z", &end_time);
--	when =3D gdata_gd_when_new (start_time.tv_sec, end_time.tv_sec, FALSE)=
;
-+	start_time =3D g_date_time_new_from_iso8601 ("2009-04-17T15:00:00.000Z=
", NULL);
-+	end_time =3D g_date_time_new_from_iso8601 ("2009-04-17T17:00:00.000Z",=
 NULL);
-+	when =3D gdata_gd_when_new (g_date_time_to_unix (start_time), g_date_t=
ime_to_unix (end_time), FALSE);
- 	gdata_calendar_event_add_time (event, when);
- 	g_object_unref (when);
-+	g_date_time_unref (start_time);
-+	g_date_time_unref (end_time);
-=20
- 	/* Insert the event */
- 	gdata_calendar_service_insert_calendar_event_async (GDATA_CALENDAR_SER=
VICE (service),
-@@ -587,7 +591,7 @@ test_event_json (void)
- 	GDataGDWhere *where;
- 	GDataGDWho *who;
- 	GDataGDWhen *when;
--	GTimeVal start_time, end_time;
-+	GDateTime *start_time, *end_time;
-=20
- 	event =3D gdata_calendar_event_new (NULL);
-=20
-@@ -601,11 +605,13 @@ test_event_json (void)
- 	who =3D gdata_gd_who_new (GDATA_GD_WHO_EVENT_ORGANIZER, "John Smith=E2=
=80=BD", "john.smith@example.com");
- 	gdata_calendar_event_add_person (event, who);
- 	g_object_unref (who);
--	g_time_val_from_iso8601 ("2009-04-17T15:00:00.000Z", &start_time);
--	g_time_val_from_iso8601 ("2009-04-17T17:00:00.000Z", &end_time);
--	when =3D gdata_gd_when_new (start_time.tv_sec, end_time.tv_sec, FALSE)=
;
-+	start_time =3D g_date_time_new_from_iso8601 ("2009-04-17T15:00:00.000Z=
", NULL);
-+	end_time =3D g_date_time_new_from_iso8601 ("2009-04-17T17:00:00.000Z",=
 NULL);
-+	when =3D gdata_gd_when_new (g_date_time_to_unix (start_time), g_date_t=
ime_to_unix (end_time), FALSE);
- 	gdata_calendar_event_add_time (event, when);
- 	g_object_unref (when);
-+	g_date_time_unref (start_time);
-+	g_date_time_unref (end_time);
-=20
- 	/* Check the JSON */
- 	gdata_test_assert_json (event, "{"
-@@ -1099,7 +1105,7 @@ static void
- test_query_uri (void)
- {
- 	gint64 _time;
--	GTimeVal time_val;
-+	GDateTime *time_val;
- 	gchar *query_uri;
- 	GDataCalendarQuery *query =3D gdata_calendar_query_new ("q");
-=20
-@@ -1111,15 +1117,15 @@ test_query_uri (void)
- 	g_assert_cmpstr (gdata_calendar_query_get_order_by (query), =3D=3D, "s=
tarttime");
-=20
- G_GNUC_BEGIN_IGNORE_DEPRECATIONS
--	g_time_val_from_iso8601 ("2009-04-17T15:00:00.000Z", &time_val);
--	gdata_calendar_query_set_recurrence_expansion_start (query, time_val.t=
v_sec);
-+	time_val =3D g_date_time_new_from_iso8601 ("2009-04-17T15:00:00.000Z",=
 NULL);
-+	gdata_calendar_query_set_recurrence_expansion_start (query, g_date_tim=
e_to_unix (time_val));
- 	_time =3D gdata_calendar_query_get_recurrence_expansion_start (query);
--	g_assert_cmpint (_time, =3D=3D, time_val.tv_sec);
-+	g_assert_cmpint (_time, =3D=3D, g_date_time_to_unix (time_val));
-=20
--	g_time_val_from_iso8601 ("2010-04-17T15:00:00.000Z", &time_val);
--	gdata_calendar_query_set_recurrence_expansion_end (query, time_val.tv_=
sec);
-+	time_val =3D g_date_time_new_from_iso8601 ("2010-04-17T15:00:00.000Z",=
 NULL);
-+	gdata_calendar_query_set_recurrence_expansion_end (query, g_date_time_=
to_unix (time_val));
- 	_time =3D gdata_calendar_query_get_recurrence_expansion_end (query);
--	g_assert_cmpint (_time, =3D=3D, time_val.tv_sec);
-+	g_assert_cmpint (_time, =3D=3D, g_date_time_to_unix (time_val));
- G_GNUC_END_IGNORE_DEPRECATIONS
-=20
- 	gdata_calendar_query_set_single_events (query, TRUE);
-@@ -1130,15 +1136,17 @@ G_GNUC_BEGIN_IGNORE_DEPRECATIONS
- 	g_assert_cmpstr (gdata_calendar_query_get_sort_order (query), =3D=3D, =
"descending");
- G_GNUC_END_IGNORE_DEPRECATIONS
-=20
--	g_time_val_from_iso8601 ("2009-04-17T15:00:00.000Z", &time_val);
--	gdata_calendar_query_set_start_min (query, time_val.tv_sec);
-+	time_val =3D g_date_time_new_from_iso8601 ("2009-04-17T15:00:00.000Z",=
 NULL);
-+	gdata_calendar_query_set_start_min (query, g_date_time_to_unix (time_v=
al));
- 	_time =3D gdata_calendar_query_get_start_min (query);
--	g_assert_cmpint (_time, =3D=3D, time_val.tv_sec);
-+	g_assert_cmpint (_time, =3D=3D, g_date_time_to_unix (time_val));
-+	g_date_time_unref (time_val);
-=20
--	g_time_val_from_iso8601 ("2010-04-17T15:00:00.000Z", &time_val);
--	gdata_calendar_query_set_start_max (query, time_val.tv_sec);
-+	time_val =3D g_date_time_new_from_iso8601 ("2010-04-17T15:00:00.000Z",=
 NULL);
-+	gdata_calendar_query_set_start_max (query, g_date_time_to_unix (time_v=
al));
- 	_time =3D gdata_calendar_query_get_start_max (query);
--	g_assert_cmpint (_time, =3D=3D, time_val.tv_sec);
-+	g_assert_cmpint (_time, =3D=3D, g_date_time_to_unix (time_val));
-+	g_date_time_unref (time_val);
-=20
- 	gdata_calendar_query_set_timezone (query, "America/Los Angeles");
- 	g_assert_cmpstr (gdata_calendar_query_get_timezone (query), =3D=3D, "A=
merica/Los_Angeles");
-diff --git a/gdata/tests/contacts.c b/gdata/tests/contacts.c
-index e4f72deb..f70cee25 100644
---- a/gdata/tests/contacts.c
-+++ b/gdata/tests/contacts.c
-@@ -304,14 +304,12 @@ test_contact_insert (InsertData *data, gconstpoint=
er service)
- 	GList *list;
- 	GDate date;
- 	GHashTable *properties;
--	GTimeVal current_time;
- 	gint64 edited, creation_time;
- 	GError *error =3D NULL;
-=20
- 	gdata_test_mock_server_start_trace (mock_server, "contact-insert");
-=20
- 	contact =3D gdata_contacts_contact_new (NULL);
--	g_get_current_time (&current_time);
-=20
- 	/* Check the kind is present and correct */
- 	g_assert (GDATA_IS_CONTACTS_CONTACT (contact));
-@@ -752,13 +750,13 @@ static void
- test_group_insert (InsertGroupData *data, gconstpointer service)
- {
- 	GDataContactsGroup *group, *new_group;
--	GTimeVal time_val;
-+	gint64 time_val;
- 	GHashTable *properties;
- 	GError *error =3D NULL;
-=20
- 	gdata_test_mock_server_start_trace (mock_server, "group-insert");
-=20
--	g_get_current_time (&time_val);
-+	time_val =3D g_get_real_time () / G_USEC_PER_SEC;
-=20
- 	group =3D gdata_contacts_group_new (NULL);
-=20
-@@ -780,7 +778,7 @@ test_group_insert (InsertGroupData *data, gconstpoin=
ter service)
- 	/* Check the properties. Time-based properties can't be checked when r=
unning against a mock server, since
- 	 * the trace files may be quite old. */
- 	if (uhm_server_get_enable_online (mock_server) =3D=3D TRUE) {
--		g_assert_cmpint (gdata_contacts_group_get_edited (new_group), >=3D, t=
ime_val.tv_sec);
-+		g_assert_cmpint (gdata_contacts_group_get_edited (new_group), >=3D, t=
ime_val);
- 	}
- 	g_assert (gdata_contacts_group_is_deleted (new_group) =3D=3D FALSE);
- 	g_assert (gdata_contacts_group_get_system_group_id (new_group) =3D=3D =
NULL);
-@@ -850,12 +848,12 @@ test_contact_properties (void)
- 	gchar *nickname, *file_as, *billing_information, *directory_server, *g=
ender, *initials, *maiden_name, *mileage, *occupation;
- 	gchar *priority, *sensitivity, *short_name, *subject, *photo_etag;
- 	GDate date, *date2;
--	GTimeVal current_time;
-+	gint64 current_time;
- 	gint64 edited;
- 	gboolean deleted, birthday_has_year;
-=20
- 	contact =3D gdata_contacts_contact_new (NULL);
--	g_get_current_time (&current_time);
-+	current_time =3D g_get_real_time () / G_USEC_PER_SEC;
-=20
- 	/* Check the kind is present and correct */
- 	g_assert (GDATA_IS_CONTACTS_CONTACT (contact));
-@@ -984,7 +982,7 @@ test_contact_properties (void)
- 	              "subject", &subject,
- 	              NULL);
-=20
--	g_assert_cmpint (edited, =3D=3D, current_time.tv_sec);
-+	g_assert_cmpint (edited, =3D=3D, current_time);
- 	g_assert (deleted =3D=3D FALSE);
- 	g_assert (photo_etag =3D=3D NULL);
- 	g_assert (name2 =3D=3D name);
-@@ -1751,7 +1749,7 @@ static void
- test_group_properties (void)
- {
- 	GDataContactsGroup *group;
--	GTimeVal time_val;
-+	gint64 time_val;
- 	GHashTable *properties;
- 	gint64 edited;
- 	gboolean deleted;
-@@ -1768,8 +1766,8 @@ test_group_properties (void)
- 	g_assert (gdata_contacts_group_set_extended_property (group, "foobar",=
 "barfoo") =3D=3D TRUE);
-=20
- 	/* Check various properties */
--	g_get_current_time (&time_val);
--	g_assert_cmpint (gdata_contacts_group_get_edited (group), =3D=3D, time=
_val.tv_sec);
-+	time_val =3D g_get_real_time () / G_USEC_PER_SEC;
-+	g_assert_cmpint (gdata_contacts_group_get_edited (group), =3D=3D, time=
_val);
- 	g_assert (gdata_contacts_group_is_deleted (group) =3D=3D FALSE);
- 	g_assert (gdata_contacts_group_get_system_group_id (group) =3D=3D NULL=
);
-=20
-@@ -1785,7 +1783,7 @@ test_group_properties (void)
- 	              "system-group-id", &system_group_id,
- 	              NULL);
-=20
--	g_assert_cmpint (edited, =3D=3D, time_val.tv_sec);
-+	g_assert_cmpint (edited, =3D=3D, time_val);
- 	g_assert (deleted =3D=3D FALSE);
- 	g_assert (system_group_id =3D=3D NULL);
-=20
-diff --git a/gdata/tests/general.c b/gdata/tests/general.c
-index 30604ba1..39478713 100644
---- a/gdata/tests/general.c
-+++ b/gdata/tests/general.c
-@@ -3502,11 +3502,12 @@ static void
- test_gd_when_escaping (void)
- {
- 	GDataGDWhen *when;
--	GTimeVal start_time;
-+	GDateTime *start_time;
-=20
--	g_time_val_from_iso8601 ("2005-06-07T01:00:00Z", &start_time);
--	when =3D gdata_gd_when_new (start_time.tv_sec, -1, FALSE);
-+	start_time =3D g_date_time_new_from_iso8601 ("2005-06-07T01:00:00Z", N=
ULL);
-+	when =3D gdata_gd_when_new (g_date_time_to_unix (start_time), -1, FALS=
E);
- 	gdata_gd_when_set_value_string (when, "Value string & stuff!");
-+	g_date_time_unref (start_time);
-=20
- 	/* Check the outputted XML is escaped properly */
- 	gdata_test_assert_xml (when,
-diff --git a/gdata/tests/perf.c b/gdata/tests/perf.c
-index 2749d40d..60f3dcc1 100644
---- a/gdata/tests/perf.c
-+++ b/gdata/tests/perf.c
-@@ -78,23 +78,24 @@ test_parse_feed (void)
- static void
- test_perf_parsing (void)
- {
--	GTimeVal start_time, end_time;
-+	GDateTime *start_time, *end_time;
-+	GTimeSpan total_time, per_iteration_time;
- 	guint i;
--	guint64 total_time;  /* microseconds */
--	guint64 per_iteration_time;  /* microseconds */
-=20
- 	#define ITERATIONS 10000
-=20
- 	/* Test feed parsing time */
--	g_get_current_time (&start_time);
-+	start_time =3D g_date_time_new_now_utc ();
- 	for (i =3D 0; i < ITERATIONS; i++)
- 		test_parse_feed ();
--	g_get_current_time (&end_time);
-+	end_time =3D g_date_time_new_now_utc ();
-=20
--	total_time =3D (end_time.tv_sec - start_time.tv_sec) * G_USEC_PER_SEC =
+
--	             (end_time.tv_usec - start_time.tv_usec);
-+	total_time =3D g_date_time_difference (end_time, start_time);
- 	per_iteration_time =3D total_time / ITERATIONS;
-=20
-+	g_date_time_unref (start_time);
-+	g_date_time_unref (end_time);
-+
- 	/* Prefix with hashes to avoid the output being misinterpreted as TAP
- 	 * commands. */
- 	printf ("# Parsing a feed %u times took:\n"
-diff --git a/gdata/tests/picasaweb.c b/gdata/tests/picasaweb.c
-index eecf1b78..19978e3c 100644
---- a/gdata/tests/picasaweb.c
-+++ b/gdata/tests/picasaweb.c
-@@ -782,7 +782,7 @@ typedef struct {
- static void
- set_up_insert_album (InsertAlbumData *data, gconstpointer service)
- {
--	GTimeVal timestamp;
-+	GDateTime *timestamp;
-=20
- 	data->album =3D gdata_picasaweb_album_new (NULL);
- 	g_assert (GDATA_IS_PICASAWEB_ALBUM (data->album));
-@@ -791,8 +791,9 @@ set_up_insert_album (InsertAlbumData *data, gconstpo=
inter service)
- 	gdata_entry_set_summary (GDATA_ENTRY (data->album), "Family photos of =
the feast!");
- 	gdata_picasaweb_album_set_location (data->album, "Winnipeg, MN");
-=20
--	g_time_val_from_iso8601 ("2002-10-14T09:58:59.643554Z", &timestamp);
--	gdata_picasaweb_album_set_timestamp (data->album, (gint64) timestamp.t=
v_sec * 1000);
-+	timestamp =3D g_date_time_new_from_iso8601 ("2002-10-14T09:58:59.64355=
4Z", NULL);
-+	gdata_picasaweb_album_set_timestamp (data->album, g_date_time_to_unix =
(timestamp) * 1000);
-+	g_date_time_unref (timestamp);
- }
-=20
- static void
-@@ -1757,12 +1758,12 @@ test_album_new (void)
- 	GRegex *regex;
- 	GMatchInfo *match_info;
- 	gint64 delta;
--	GTimeVal timeval;
-+	GDateTime *timeval;
-=20
- 	g_test_bug ("598893");
-=20
- 	/* Get the current time */
--	g_get_current_time (&timeval);
-+	timeval =3D g_date_time_new_now_utc ();
-=20
- 	/* Build a regex to match the timestamp from the XML, since we can't d=
efinitely say what it'll be. Note that we also assign any order to the
- 	 * namespace definitions, since due to a change in GLib's hashing algo=
rithm, they could be in different orders with different GLib versions. */
-@@ -1795,9 +1796,10 @@ test_album_new (void)
- 	xml =3D gdata_parsable_get_xml (GDATA_PARSABLE (album));
- 	g_assert (g_regex_match (regex, xml, 0, &match_info) =3D=3D TRUE);
- 	parsed_time_str =3D g_match_info_fetch (match_info, 2);
--	delta =3D g_ascii_strtoull (parsed_time_str, NULL, 10) - (((guint64) t=
imeval.tv_sec) * 1000 + ((guint64) timeval.tv_usec) / 1000);
-+	delta =3D g_ascii_strtoull (parsed_time_str, NULL, 10) - (g_date_time_=
to_unix (timeval) * 1000 + ((guint64) g_date_time_get_microsecond (timeva=
l)) / 1000);
- 	g_assert_cmpuint (ABS (delta), <, 1000);
-=20
-+	g_date_time_unref (timeval);
- 	g_free (parsed_time_str);
- 	g_free (xml);
- 	g_regex_unref (regex);
-diff --git a/gdata/tests/youtube.c b/gdata/tests/youtube.c
-index 5fefbaf8..b2732680 100644
---- a/gdata/tests/youtube.c
-+++ b/gdata/tests/youtube.c
-@@ -1537,13 +1537,17 @@ test_comment_properties_parent_comment_uri (void=
)
- static gchar *
- build_this_week_date_str (void)
- {
--	GTimeVal tv;
-+	GDateTime *tv, *tv2;
-+	gchar *ret;
-=20
--	g_get_current_time (&tv);
--	tv.tv_sec -=3D 7 * 24 * 60 * 60;  /* this week */
--	tv.tv_usec =3D 0;  /* pointless accuracy */
-+	/* don't use g_date_time_new_now_utc (squash microseconds) */
-+	tv =3D g_date_time_new_from_unix_utc (g_get_real_time () / G_USEC_PER_=
SEC);
-+	tv2 =3D g_date_time_add_weeks (tv, -1);
-+	g_date_time_unref (tv);
-=20
--	return g_time_val_to_iso8601 (&tv);
-+	ret =3D g_date_time_format_iso8601 (tv2);
-+	g_date_time_unref (tv2);
-+	return ret;
- }
-=20
- static void
---=20
-GitLab
-
diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb b/meta-=
gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
deleted file mode 100644
index 5f5d5834a7..0000000000
--- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY =3D "GLib-based library for accessing online service APIs using =
the GData protocol"
-HOMEPAGE =3D "http://live.gnome.org/libgdata"
-BUGTRACKER =3D "https://bugzilla.gnome.org/"
-
-LICENSE =3D "LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982=
c24 \
-                    file://gdata/gdata.h;endline=3D20;md5=3D079a554efcf6=
5d46f96a515806e7e99a \
-                    file://gdata/gdata-types.h;endline=3D20;md5=3D7399b1=
11aac8718da13888fc634be6ef"
-
-DEPENDS =3D "libxml2 glib-2.0 libsoup-2.4 intltool-native liboauth gcr3 =
json-glib"
-
-GTKDOC_MESON_OPTION =3D "gtk_doc"
-
-inherit gnomebase pkgconfig gettext gtk-doc vala gobject-introspection m=
anpages features_check
-
-SRC_URI +=3D "file://0001-Drop-usage-of-deprecated-GTimeVal.patch"
-
-ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
-REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('PACKAGECONFIG', 'goa=
', 'opengl', '', d)}"
-
-do_compile:prepend() {
-    export GIR_EXTRA_LIBS_PATH=3D"${B}/gdata/.libs"
-}
-
-# goa is required for gnome-photos
-PACKAGECONFIG ??=3D "goa gtk vala"
-PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse"
-PACKAGECONFIG[goa] =3D "-Dgoa=3Denabled,-Dgoa=3Ddisabled,gnome-online-ac=
counts"
-PACKAGECONFIG[gtk] =3D "-Dgtk=3Denabled,-Dgtk=3Ddisabled,gtk+3"
-PACKAGECONFIG[vala] =3D "-Dvapi=3Dtrue,-Dvapi=3Dfalse"
-
-EXTRA_OEMESON =3D "-Dalways_build_tests=3Dfalse"
-
-SRC_URI[archive.sha256sum] =3D "dd8592eeb6512ad0a8cf5c8be8c72e76f74bfe6b=
23e4dd93f0756ee0716804c7"
--=20
2.34.1


