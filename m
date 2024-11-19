Return-Path: <Liyin.Zhang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D02B6D60D0A
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 01:32:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10733.1731979959997247538
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 17:32:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1053c339d9=liyin.zhang.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ1CsPn013780
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 17:32:39 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xusq27p5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 17:32:39 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AJ1WcjO010662;
	Mon, 18 Nov 2024 17:32:38 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xusq27p3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 17:32:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBj14PRs7vXe6K5NEqyY2u2DfSRP+KPRRcdDbNrj8IHJUxAFKUDFBVLfPSSQ2sr69TotyzFwRJXT15tVM6GMJtVXFCnlnlds2qE4VSt1I++P/YlpNspsB0iUoDB6DkcEA1r+nkljtt7TXGLNw2cCUr20csjTNpIomgy44iCVmuB1r2o96XOg0eb85X0nP/oyf2jQpIQYjf6OwZEm8JvLX/vjbeA2ytmiP6fdK3DxNvRZAqkIChFtP1ME+wkKZSyOkLf+1gPJSleM/F0u1fQRu9vyWFfMz1gtbJXd9Lv6bjIc/LiZI6r1v3wQOrzPIime+b7Y2g1zuy/I/usGfr4tnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GalrzYaLdfCdS9nRlrhhUcIeKjNy6Xg+COeRFRCFnzg=;
 b=oT2/xwqlXPFG563G6Qzy5A+L/VeZKtfexjORhp2n/YSlrtDwnqk6sVK0OOhWzCfn9cCA+SLDR0xWnplX2s0lkHhqX2jP+QauV/KJgrq405OLK/s9AnI0iwTGVQwS7AjqFxKWCQ4zOUWCgxXIwDlyE4SCkQZdiXqAcCjEnb+sEa2ePWOwHE8c3BSDKNY8IUYmtqQRvSb8Y68sS5xsSdxBnhcyyfY0N/C7CeYX6DwcAE2XITzDKN1HNHD8iiVuQdgkttUdAE3gVUvq1G0djvSot8YybldPezPADzVUJzREuiXR442kmKYXtX9wvNh3JMvJLndc1DIeoT9GoIzHFZ3iFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW3PR11MB4682.namprd11.prod.outlook.com (2603:10b6:303:2e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 01:32:34 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 01:32:34 +0000
Message-ID: <7a80e2e2-622a-419d-8ea6-7c29e2a2a992@windriver.com>
Date: Tue, 19 Nov 2024 09:32:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] lttng-ust: backport patch to fix
 cmake-multiple-shared-libraries build error
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
References: <20241114111829.1182716-1-liyin.zhang.cn@windriver.com>
 <ZzX0di8r1p4zh_PO@bootlin-mathieu>
Content-Language: en-US
Cc: openembedded-devel@lists.openembedded.org
From: "Zhang, Liyin (CN)" <liyin.zhang.cn@windriver.com>
In-Reply-To: <ZzX0di8r1p4zh_PO@bootlin-mathieu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0187.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::8) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW3PR11MB4682:EE_
X-MS-Office365-Filtering-Correlation-Id: 99def4a1-2ed3-403c-dd47-08dd083a0add
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NTRXM21IczlwYUNhbVhqZ0JnVU9xYmZKWk5SbnVsK05xL3lPZmZjY202Unhm?=
 =?utf-8?B?THVFKzFhQ3VwMzBVeFJ6dzRjMWdjaUVDV0REcGhvVSttSkVPYk5xTnlmRE1I?=
 =?utf-8?B?eEZWV0pxZU5DOWVaVzV2MExGbzNvOVlRZ0lpTW0zK0ZNNGhDaG9XWVBFUi9h?=
 =?utf-8?B?Sk1WbHRNcVRnS2xoRlpSSmE5YXBhRk5BZVVhb1pUc2ltSEt0QXFNempMbHYz?=
 =?utf-8?B?eFNRZ3BBVTNBRkdGR0Y0S1dtZWNGMWg2ZTJwbjJNUG5yajNiZ0hJeWVzNzJX?=
 =?utf-8?B?Q1lTMmxRVGNMREUybFdjVGNBalMwSk9mU1VmTkNvcHJoN2kzRWx2dHFVRmo2?=
 =?utf-8?B?amd0RXFGdUxEdnF2YXhkSHVDSEpzb2F4R21taXgySGlQQkpzeTJjMVoxQnV1?=
 =?utf-8?B?OVE5R0hOZDdUQXA3eCtpcUlDS3lLQkI0WWVyQ3E2MnhqZGVGK1UyN0luNFUy?=
 =?utf-8?B?RXNjTlAyNkw4UU1qdm1CSzBWUWZlV2V3NHAvQ0VGcjJZZmdRT0JrRlMzRlNt?=
 =?utf-8?B?MkZDT05JUmFsT1E5UVJPWWU3NGdjRlRtSGRaZ1hvRkUzK3Vjbi8wQ1FmQ1Aw?=
 =?utf-8?B?OUZySVRxRk96eUNOYW5yS1dtb1JVUFlGRE5QaWNGTERRMWYwZjBEQmdjOFBB?=
 =?utf-8?B?Nm1lMmNxNHBJNXh4SUZoRS95MlgxMm1JbGtvNkNVbDFUY0VYVTlpTWhqeDMx?=
 =?utf-8?B?QVUvcFNsYkNUMTRTUWtYMWRuRjJOY0JaaFhlcXhqK0JTQ0VhRkhmK0t0REZG?=
 =?utf-8?B?VUJGd0tac0MvR01aSDhGemdqYXByUEdJOUR0eWZRR3lBNUZCWXhwYjM2dVpj?=
 =?utf-8?B?WW4wMnFUVDNOanMvSE9nYWgzMEt3aW4yMysyaW9VM1ZOTzJHekdoM0ZhU3V3?=
 =?utf-8?B?VXhRUlNRZFJDbE90Snk3Z0RYT0JRenluYWhRTlA2VlpGa1FiYWhycnhhRVRW?=
 =?utf-8?B?YWRFeWdBOTh5d2dtRlVTMHN5c3FaLzBxb2k4b20wZk5xZ2xjVHdDVExyY09J?=
 =?utf-8?B?eXNGbmRsVXlkNDh1dnArR0NQS2JrdEg1bHNIMmhpTVI2K0c5Vlk1YllaVk1W?=
 =?utf-8?B?VVdFT2RLY3VKdmo4R0dRZHhFdVFSb2NyT1BENS9NWW00RXFSZHgyOU1KSTY1?=
 =?utf-8?B?N2hWTmZIQ1Z2cVFITUppNzU0b3hUdFJ1a2hTTlRGdW5NWWFkSk01WDM3YSs0?=
 =?utf-8?B?VVJ3Ni9CTG83alplT0E5SWZMZHh1clFDWlVNa1RwVHJkMGR6QXpCbDdlSVYv?=
 =?utf-8?B?RksrY2hYRzZEM0QzT095VnRQWFhqNVFVZS8yQjBJa1pvcWF6SEpHald1YkRS?=
 =?utf-8?B?cU5SU3pDRXRScUlyaUxOTnU1NmdwTURBN3V4YjBJU1ZrWU5PejNvaGVPUGNR?=
 =?utf-8?B?QWc3RGJka2dSSmh1U0pZOGRxRkF1ZkwwdzZTVVpURkVIaVZmZHB1Y3dXRHJR?=
 =?utf-8?B?NGZBbHJWMG1PU1N1a2VBTlRmd1dnRWFBeE5nV09GdS9wdkJkT2lpWXZLbE9O?=
 =?utf-8?B?Q1I3VGpPNDRHbnVwdjIrWXQyMVdRL2ZLbkhTdWgzbHpmVzdiS2VDdEJ1SmM3?=
 =?utf-8?B?RmRFenhLT0xpeDIzU096czNUOFprNlRFNENDMm1kTmFZYXg5QlY2YWF0VHVw?=
 =?utf-8?B?c1NVME16NU8xZkJiZml6Ly9TcE1aZVlybXQvWUNabU10S2tSSGxtNjRNelFt?=
 =?utf-8?Q?e7MVQlDLW3Bkk0Dep+y3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZVZNa1pDVUlhN20vOVhRbmhqOGZWc1haTzFxWkZxWjJPRFRhUVp4KzZ4NFVJ?=
 =?utf-8?B?b3lqVmozM0hDUjcxeWdyd2ZBdS81OVBUbE43UVg2Q2JDc094Vm5sL0k0SjNa?=
 =?utf-8?B?TCtlNUFyVFlKV0kxWjlsWk9heXUwdzFCQzY0KzdaTHc5TlBuRXE3enhJcnhV?=
 =?utf-8?B?RG03eEVFTWFvN0JiQWpoNmtXLzRRanB4OXh0ZVNXY1ZKZVRZL09lanN4K3lD?=
 =?utf-8?B?Vm5Nc1Mwb0FnTHRDOGNmd08yTkxpOG5KOE9SU3FRN1JuM3pPTGxlUFltZ24z?=
 =?utf-8?B?WGJCQUNQVG5ZMjYxMVh4cHV5QzBmcllVb2twbEkxZUx3ZTJ3V3htenR1RWFy?=
 =?utf-8?B?dEZGcDgrdEFxemJZZGZQYTU2MTA0eFBSVmZkY3hwcXNKQ1FDTjdnbzhBdlh1?=
 =?utf-8?B?aEFCQ3p0RVJrY2IxK2psK1VkRFR1dSs3Vy9OczFhRzE0Z2FWZythSUd6bFJQ?=
 =?utf-8?B?c3JpNVRMaUxFdFI4REp3ZTRIODYwNlFNeHJUeXZOZGdlYndjLzM2SXVXVmpO?=
 =?utf-8?B?OElrSEJwRG1zR1pEc3BGKzVLZy9VQVI3QnVreG10SjQ0Y2hENENLRG1ScEQ0?=
 =?utf-8?B?NGV0VWJVMkpUWFB6QVl4QXA4Zkg1VE15UW9vY2RGZ3FIVkFpbWdwR0h4aXpE?=
 =?utf-8?B?ZTdJdlV1cUNvT2NhdXZMUXV4RXVMWTRGTXlsS1N3RjEyUkhKalQ4clJyZWM0?=
 =?utf-8?B?aG9MR3IyRkJKcXZoY093Rm5CR09lQzFPWEZOeC9oR1NEbGl6MDA0Yjk5aEww?=
 =?utf-8?B?K3hXMVYyRXFPT0ZFMnF3by9pU3dqNEY2SGxsZnN4OHNaZG1HVlhoTUpTa1BP?=
 =?utf-8?B?Qnpmd1FLZXByaURqUTFmWldJeFhZS1Eycmw2UllpK2tlNldqZHJkdnlxcDh2?=
 =?utf-8?B?Znh6cDZxMS9DOGNicDBpSWNzbnhFN0kvVWwySFovYXl6d2ZBNU1zVStpTHpI?=
 =?utf-8?B?enlGZG9HS2FHV1ZtQVlBd0tKYWRXNHBHWlhGRXY0QXE3RThlRGUwNm9ScGdE?=
 =?utf-8?B?U3lkWS96ZmhiMUpIY0lkeUhPN3JySDBBRlFKakNUdkNrMXNMUGFJOFNHNDdL?=
 =?utf-8?B?ZE5MU09vU0w4aUwzNVNXQUg4TWwrUnZjbTVqc01jbHIwYTd6WFJnNkxXeTYz?=
 =?utf-8?B?WWV1RHdXaTBYTFpxamtaWDNuU3ZKM1ZzV1ROMTVMZys0TUZvdnd0bVpUUVR2?=
 =?utf-8?B?T0EyTTNleWxQYWcwdkE1Z3c4VW40QWJyM3A5SXBJb0p0dkttc0pJdVkzRVpa?=
 =?utf-8?B?cE5YaG9mRDI4d0haL05hdFROcjVZL2dnRXpQY2NLeHpNQTJZQ0V6T0JVU3hG?=
 =?utf-8?B?b09jemsrVGI4L282ZDl5NTJ0WmU0My9IVXJ0ZnhTNnhlOU9aWmM5cXdBeEZv?=
 =?utf-8?B?eU1JY25pNWhVT1hzUzRwbzVPSVhLdEMxSjYwSlJnTVpJcDRkbkRPSHM2Q0Ji?=
 =?utf-8?B?V01iaXRQQWxSbHhaVVAyVmtOUy8vZFVLbEwyMEJCUXJ4VC9Pa0JLUFNHRHF2?=
 =?utf-8?B?bXlzL1Y1YlY2ejhJL0xwR3JQblQ3LzlZZHBBd3g1ZHZlcXNqTXdMWTlZQ0lB?=
 =?utf-8?B?ZVF3QTdvU0pDUWF4L1I4NnJQa2dhK0NFVEJrdkl5L1ZvNVJZWGhUZFlYOC9B?=
 =?utf-8?B?VEJiazQ2WlhPVkJsQUNDbG5qU0M4di9KN0l5QnZlc1R3a05IUWFycVZ3RlNO?=
 =?utf-8?B?bmlDMmtZc2cvYzRwdG5tTUQ1S1d0Q3RZTVVlMzJOdlpVVnRlcytEMGFOVFpq?=
 =?utf-8?B?ajRZZVdtczFvdEJOWmxsTnpBT2FsZ0JpSGJUUHp3OFVWSGJ2WlIyejBiYzN2?=
 =?utf-8?B?KzBycTVkaFdtbUp1a3hrUjVidkg1cml6L2Era3ZKank4azdqeXM1OStWb1FF?=
 =?utf-8?B?cjN3R04zQnFSUUVhd29BUjlhQXpVQ2tuQnFiMXI5T25mNXYrbzhkRUJtQ2cr?=
 =?utf-8?B?dGV6eWFJUklFNUw3R01hazNlclR6ZlJPZEp6SmZrZStxZVhIcGFmVVBLdUdk?=
 =?utf-8?B?SDZtY0t4eWYvck9iTWZKK3lDRDRsMi9obVkzdjlYNTlrMGJ4ZjhvVUo0dEVn?=
 =?utf-8?B?Z2RNWG0yS1VqWWU4dzVlekZqTWs0dzhGSHErU282ZE5oMTFzd0UzN1NHU0xt?=
 =?utf-8?B?c2Z2M3g3M2VPQlhsL29MRFVPK1dSeUZTMEJYSGVCcDhUUm4zN1YyZjFZams3?=
 =?utf-8?B?bmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99def4a1-2ed3-403c-dd47-08dd083a0add
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 01:32:34.2596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8fbAggGDSEdpT2tKDoOnHuk+qs97PHJLq/1f30SAzAwxJ5/urzjmiERHXkAkTIEGQkVtvuK6BJqzVCRH7WN9+RgEc9YxpKJEPERsYPwLBA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4682
X-Proofpoint-GUID: EtacRswQ-8EpecqCqB6wV7bgEXO1UtCG
X-Proofpoint-ORIG-GUID: yDUlPKDrIYGiosh6ygVLD5IpclTocYLi
X-Authority-Analysis: v=2.4 cv=d9mnygjE c=1 sm=1 tr=0 ts=673beab7 cx=c_pps a=dIBsZBmI1wyUZqnlzmwqRg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10
 a=Q4-j1AaZAAAA:8 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8 a=ag1SF4gXAAAA:8 a=JMyG7Bbq_w3QNgmaqpgA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=d3PnA9EDa4IxuAV0gXij:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-18_17,2024-11-18_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 impostorscore=0
 phishscore=0 clxscore=1011 malwarescore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411190012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Nov 2024 01:32:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113907


On 11/14/2024 9:00 PM, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Thu, Nov 14, 2024 at 07:18:29PM +0800, Zhang, Liyin (CN) via lists.openembedded.org wrote:
>> From: Bin Lan <bin.lan.cn@windriver.com>
>>
>> There are the following error when building doc/examples/cmake-multiple-shared-libraries:
>> ld: warning: liblttng-ust-common.so.1, needed by lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
>> ld: warning: liblttng-ust-tracepoint.so.1, needed by lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
>> ld: warning: liblttng-ust-common.so.1, needed by lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
>> ld: warning: liblttng-ust-tracepoint.so.1, needed by lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
>> ld: lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_common_alloc_tls'
>> ld: lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_after_fork_parent'
>> ld: lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_after_fork_child'
>> ld: lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_after_fork_parent'
>> ld: lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_tp_probe_unregister_queue_release'
>> ld: lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_cancelstate_disable_pop'
>> collect2: error: ld returned 1 exit status
>>
>> This change set removes the old patch file 0001-Makefile.am-update-rpath-link.patch,
>> adds a new patch file 0001-Fix-Build-examples-when-rpath-is-stripped-from-in-bu.patch.
>>
>> Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> (From OE-Core rev: 89394da1cbe98652e1d0bd59c762ff7da2d6a113)
>>
>> Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
> Hi,
>
> This patch looks like the same as the patch merged last week:
> https://git.openembedded.org/openembedded-core/commit/?id=89394da1cbe98652e1d0bd59c762ff7da2d6a113
>
> Is there any difference ?

Sorry, I forgot branch name. Please merge it into [scarthgap].

Thanks.

>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

