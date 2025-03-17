Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6CB5C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 15:33:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.55804.1742225579992850899
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Mar 2025 08:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5171f7bca2=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HBvHnh016706
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Mar 2025 15:32:58 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45d0h92783-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Mar 2025 15:32:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tkwSSKjhHyji4ipbxWMDcjOlP+22lnMUa6aAXuiQbpRHISCEasjvU6hTnZga9iZofFYWOuaXrogkw0Jn0MS1CwsviiBS91ReGlStigrmhSlwX2Lm4bWJeCqnpyPlGqltf/8Ib0Lrzr6S+aOXRugpmqMXI3ox2JAz/4Sz2bE/nqjKsZxeLrQJFmaBTodDQcNnr01Wt8NMkIJG6oxsWYKJ8uRct8aWUJYgSfNJb0XVv8wh8d7k2AA3jbtqxAXFRafUWthTExgK0QFXIimo7a5PLteQIAR1itptOt0AP60sQhHkb1PAWo4dHiAukiT8YbRyJFvV3uDfX0QmKEZWTouMxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ez61ms4ubmMiVf9mcPRN39pPcwDf9L1zFeXOwPIIllA=;
 b=YMS/LXSpTvpM/SdX9c4UtSxcFtoKQLu5w1tEu+ygiiZJ2wkbyEsOPOJBFsIhCptZIwtUIygOeEtTmdUKmHbHUWf+j5PsFX5fGA93fo/zCKI493LRok6wjWZIwh9ut3Pvg5R2d6YglcJFL3shLW7WaXxab7r6Dlxf0l9xepf0m7ALCn4Jw20xcuX7A4HTTOrwsy3iMQ8VuDhfqBMAqAQKqEqJwSC4EMpgTQ3tVCe7S7w202XD86wQju8rr9WQ8K8q5RhLcNB/R3kaUNbvE7AFzXwkUM+Lr5RqAYoOtZTzrvvCJSkp+RjHtiNRo7/pId1wW9tpNOt02n/59s7ivK7CLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM4PR11MB5994.namprd11.prod.outlook.com (2603:10b6:8:5d::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.33; Mon, 17 Mar 2025 15:32:55 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 15:32:53 +0000
Message-ID: <6f3d6071-94ab-49ef-a001-d073a9f8b1bf@windriver.com>
Date: Mon, 17 Mar 2025 23:32:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] minifi: upgrade 0.15.0 -> 0.99.1
To: openembedded-devel@lists.openembedded.org
References: <182DA0BA907AAAF4.29351@lists.openembedded.org>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <182DA0BA907AAAF4.29351@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::15)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM4PR11MB5994:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f502c52-edae-4901-b781-08dd6568fbf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aUhxREdqelpQV0RNT3F5dmUxOVFhdTlSNWFadVVNVW14WnFZa3N2Mmlsd2tY?=
 =?utf-8?B?L2FqYlZPYkJFU0d1TWdoSXRrV29ld3FCRXJZWWZBZFZDT2c2QVJCVHNubnJO?=
 =?utf-8?B?TXhBOW9YWFZiY3I2YktGbTA2d0V3YjMxdndSdk1RcHFYZlVZUEdiMUduVDNV?=
 =?utf-8?B?VTEzNHlwUkdqRjNMVmlldzN3YVpwT1hPbjFOKzZpWG5uZDlRdmg4ZlEyMGdu?=
 =?utf-8?B?c0MwdDhUUTlYaWt2WGxQSDFWWUdRQ1NXQTRMTkVFZlNGeWs0SVN6OTIxN2h4?=
 =?utf-8?B?ZDVuelNOTWNCYUc0TjFiUmxBZkRHWXNURXpoZ0dJTjBCd0ZoV2dIR1UxVmRi?=
 =?utf-8?B?cTd1Q1V2cnJ2aG9USkdRVWQ5R3ZxaHZja1J6eHA1c1pOZHBLbzBhNEtnb04z?=
 =?utf-8?B?cGdydCtFWDYvZmJTQkVtL20wVC9ZTXd0d0ZhT3NPSjcvSE01M0lmNUVEbnIv?=
 =?utf-8?B?T0hHaENiUTFiL0djbVdLNy84amkrcUd6Q1VvcVJBWWhMS0FJL2crRmozYTl0?=
 =?utf-8?B?VG1DU2lOazViMGM2Wm9hbXU5L1FmcGE4ckNKWEw2a2M3V2o2UlFIeGF2MHgr?=
 =?utf-8?B?ZTlDbmpnZ3hUR3dIdGNxZ1BXQURQbFErdnVhT0EvNWpENDNlMzM1dDVxWUtm?=
 =?utf-8?B?dzMrTWhKZ2FRV1hmNFp2T2ovR1B2Uk1QdlJJcG9RNGYycncxZFJxbzNDSk1T?=
 =?utf-8?B?SnNXUkhwSHJoMU01c29pUXZlR3gxQzJMT2FsbGhMaWZQZ1pmZUNlT0NKclJy?=
 =?utf-8?B?RzZud01JdGV1Yi9HdUhKcVJQRDZxYXhHZzBIK3JlN0pMelBZc3V3M1FJaTZk?=
 =?utf-8?B?SkhKZUhvWVUvWlhGSDgxeFAyVlZzYW5VckxDRTN6ZTRPUG5jY01YTFg3eHVx?=
 =?utf-8?B?UHVzQUxEZENGM3Y4NDloMU9ocnlpUEZsd1FLZWZ1Qk9IZVFpalQvY014ei82?=
 =?utf-8?B?WEg3MDA2UGc5OUpvdkVha0x4Q0g2OUVsNUpyR2NBS3BvZStHdXJVMmNaRVdJ?=
 =?utf-8?B?MVgydUgxYjNjc1pIMURLRStUVDBqOCtpcFpsMi9YV2I2TWVRT2dlbWVoV0Jo?=
 =?utf-8?B?N3lDLytNb255V0NzeVZRNnBVRFpGUHVDQkkxTHd4d3IzVmVCclZwS3lMOFgx?=
 =?utf-8?B?OHE4U2tPWC9MRDF2a0xsSTR2ZmZ0YWZRUWE4d3VYL3pCcHBxZ1p3N05mVjV4?=
 =?utf-8?B?OWdSSjgzaFFhMmZQUEV3ZjhYNkVSck5tSytiMXZWOXAvYlJGdTJ5NmN4WU4v?=
 =?utf-8?B?SzNsaFZtYXQrME9zVmxyTTdnRkRJZGZjRTVGYzhsWmlXY3pCcUliWU9aVEt5?=
 =?utf-8?B?WmNhOWdtWmJsaER1VkhYdVZxUzlROVRzRmlsc3J6amV0cWJxMktSQ3UyZU9a?=
 =?utf-8?B?cVYwaXdCVkk3Y2ZJUWdQUGhPMnZpc0cxZzNxb2I0MWZjVVBqbndOTTBjL1NN?=
 =?utf-8?B?MndLOUNBMFFIVXk2SEhnZkxoV1JYNmd1d1Y1dkZsb1BLVUVZR1JZTlVPL1c0?=
 =?utf-8?B?VytURG9OWFRjVFB1U0FpL2xsb0MwajBKdGhzYVpVbGp3ZCtoRlpvaExwRStO?=
 =?utf-8?B?MCs0Y3hncVJ0cHlwdVd2Z1pUY0tXSmF3Q25xRXJ2RDlwdkxGV1lwWDZueG13?=
 =?utf-8?B?R2JQbytYdUhJSnN3YUw3TGlIbVRvSTNSUDhIbWxHUW1zaWNrTlc4SU1JU0Fj?=
 =?utf-8?B?WXNad29VM3VsQVdONXVsbHFDWGQ4c1I2cUFUTVAvdXFmMW1lMUJlOW50WGJq?=
 =?utf-8?B?bkhLOGVhWHVCbi9HMjg0TmtHQVAwWFZUY0lOYWY0WWY5NHVVMlB3Wm83a1pt?=
 =?utf-8?B?Nk1Hem4vQU1jNnBpUUZOUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bFhnRS8rc1lNR0duL1hENThHQkpDL204YWVtRm16ZWM0aWtxK08wM2xJUlVL?=
 =?utf-8?B?dzVaUzd0VG5YSEtDKzJKRVFsK1VXUlNnRHoraXM3U3pBTFhTbFhIUkw5TkxH?=
 =?utf-8?B?MkFhWGE4cnZTUm9tQ1JYdERTUzk1SmZhV0NlNTBaUlpveWV5OXZlNUZqdWpa?=
 =?utf-8?B?VlpTWFRNZHNsaUpySDhFcmlaemM2UVZLRVNtRE9DVWZieWlrYTNrWHhIZGhn?=
 =?utf-8?B?K3QzbElGcG54R2tRTmVtMjN1SUtadTh1WndDemZFaTd6WlV3VWlDMHB4Y3BX?=
 =?utf-8?B?R0IwQnZaalJjS2FzQ1cyMEtqUDNBMjlpZFVmek5DS05zL08wVjhqRkQ3L2tu?=
 =?utf-8?B?R3d3NXRLU2lULzFTeEV1TnpkY0hIZXhWRVdFTFV3TDl5NEQ4T2JNaFF5T2wz?=
 =?utf-8?B?OExQVEVxT29nVnl2N1NqclY1Q2NON0Z2UFZ0UXNCeGhTOG5nU1JFcnJsek05?=
 =?utf-8?B?NEVpcGpSZUY1RXlhdk0zR3hYUFNCdGpXREdGQmZ3STRwRWc0Z09rT1dBbjJl?=
 =?utf-8?B?Z2pQUFZrY1Nad2VjOUZMR0hML1dtQzlJUHdEMDgvVGVzeWpkQXV3QytVSDhl?=
 =?utf-8?B?ZGQvMVVrTkhKbnhuYks1ak44RDVOM0ZReS9mYXVCZ0VMK0VzS21laEdmVUVK?=
 =?utf-8?B?UFFkdTIwRnczVGUwemZiS3BTM1hEMFpmK3o5Znc2ZTk0UDVjbkpVSDFmOXUv?=
 =?utf-8?B?TVgzbERlYUtPdlU0cmJCdDExTStzc0tkWjFhWlJxTTltQ0kwSElJbzI4UUJo?=
 =?utf-8?B?NVJ0cjV1U2k0ZEtqNHlTaGxkeDNzTTl6bE9WR2NFT1VhWjRMRnNYMTg4N2ZD?=
 =?utf-8?B?ajdnNDFJeHZ0OXh4eDc1ZWtwMHRGS241RVF3VWpvWFB6dkxEZ2VkdEk1UlNh?=
 =?utf-8?B?Tm1uWmN5em1OalJOYUQ1WnFRRDlja1p2dmJWejNMQUZFVHkwMGM4aCtaRUEx?=
 =?utf-8?B?LzVjd2Y3cWlpT3JzaGhVb2o4R0Y0djl0NzFPWXZMU2NBWjJySzNaRk1jMld2?=
 =?utf-8?B?SER5UFNmK2granlPOHNwSVpDSXN4bWc5Z252cVNMbzBzWi81WndTTjNsM3B4?=
 =?utf-8?B?S3B6MkFoaEROM3ZOajliZGJQZHJ1NmhWSFM4NVczL1kzdXo2MWRkclUzcmRv?=
 =?utf-8?B?MkJDa3M5YlR6NG5FdGN6OUxNbjI1K0VEYTh1djZOdnMrTzRhTmJpLzdJVUwy?=
 =?utf-8?B?WDlmMEUxSDBhaXFLUkZhbE0ycU1oSXdoODVUVTBrT2YyZFV0bW5Ib0J0dUpi?=
 =?utf-8?B?M0dZbHBGQnFsUEhVVC9DejA1T3BSUzhvREZFVFVYd0hDd2IxSnhySTV6ZnV1?=
 =?utf-8?B?aWhHdngrOXY0SS9jT3RkWVZuRngwbGJqejBvbXRmRGRMSG1McjA5K1h4TVF3?=
 =?utf-8?B?Z1FLTjNXTFBUa3Z2MGhMOENzckJudHF0a3FrbURodkJvT1BEMGE3enFDY1M5?=
 =?utf-8?B?K0lsMmkybmpGaS85YjU4eE13bmRtdmxOWG03TmJMVjZ6ZkxPdkhlbVFVc3d3?=
 =?utf-8?B?UVdRWEVQbkM4ODdhejI4NWpVN3VsamtTWWp4MkNjai9FWkIrcUNiTW9udGND?=
 =?utf-8?B?dDl5M1l1anBSS01jZTlTNlF4QldrM2hUS3p5c09YNUlpSlVHc1NrcDNwY2R0?=
 =?utf-8?B?YUN2YVRYWmRkTDlyeSs0UFlmTFlVczNhY0VNcS9FK0NWKzJLcUQwTS9hYUpB?=
 =?utf-8?B?eEV3WC9hZnFtUUcyZDRNRjNZQXhlQnlMYUxmSEJlRTIrMWxMem56SS81dDJW?=
 =?utf-8?B?MEdOWlhIbkRzQ2FXK01weVpZbnpObzFPUzlScHhNQmp4VGllaTJ0Y0I2MlB6?=
 =?utf-8?B?WkJHMjVXbVF1YVRqVzVMTVo1ejhtTk5sc3VKQVY0TlluWkNNMTB4eXk5aktU?=
 =?utf-8?B?T3BLbUQ5UDByNjdpSE9EQ2g0Rm5oN2orbHo4dzBTbXVpeFUwU2pPMzl0YVRi?=
 =?utf-8?B?OHR3ek1FNnZpTmRvUzM0REduRW9BbTlOdmJuUGFvbE5yS2xzZEdKdVNiSVNE?=
 =?utf-8?B?NXVmb29jYVlWVStBQ3ZoMFNZZGFpZ2tRb2xpUUo3VE15ZzAyRVZtQktJejJB?=
 =?utf-8?B?eHZXQWVSL1lxS09pNnlscWI2d01FUjlPbDFDS0FJMDh5WjREbEU4R0Q5ZEtC?=
 =?utf-8?Q?dnAjIR5qe/wEMweuehvrCFcf9?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f502c52-edae-4901-b781-08dd6568fbf4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 15:32:53.8026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NAMIRq5VtYGjZuRrD07ErY2IDpaxO0I+ddfn425kuzAbcAQSoJc3w+H/81ve9DBjUF1kc8zk/MzTnnllkblDdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5994
X-Proofpoint-ORIG-GUID: 6tJmlvxuVVwveu-khsTy6bw9C1B_CcWB
X-Authority-Analysis: v=2.4 cv=ROOzH5i+ c=1 sm=1 tr=0 ts=67d840aa cx=c_pps a=6L7f6dt9FWfToKUQdDsCmg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=mV9VRH-2AAAA:8 a=NEAV23lmAAAA:8 a=3ngDpdnhAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=95DwTBdXAAAA:8 a=GSlNDt3XXq8majF40pMA:9 a=QEXdDO2ut3YA:10 a=aupxLwd5jg1hj7vrjLfh:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=Z7Plre_t_Rr_WjS3YmDd:22
X-Proofpoint-GUID: 6tJmlvxuVVwveu-khsTy6bw9C1B_CcWB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_06,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503170112
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Mar 2025 15:33:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116032

Please ignore this.


//Yi

On 3/17/25 23:28, Yi Zhao via lists.openembedded.org wrote:
> ChangeLog:
> https://cwiki.apache.org/confluence/pages/viewpage.action?pageId=65145325
>
> License-Update: Drop the license for cxxopts and add the license for
>                  argparse(MIT)[1].
>                  Update the license for protobuf(3-Clause BSD) and add
> 		the licenses for RE2(3-Clause BSD) and c-ares(MIT)[2].
>                  Drop the license for ios-cmake[3].
>                  Add the license for Lua(MIT)[4].
>                  Drop the license for libcoap[5].
>                  Drop the license for uthash[6].
>                  Drop the licenses for LightPcapNg and PcapPlusPlus[7].
>                  Add the licenses for HdrHistogram(CC0-1.0) and
> 		llhttp(MIT)[8].
>
> [1] https://github.com/apache/nifi-minifi-cpp/commit/1dfab222d44100186e3450cd0fc964f04708734b
> [2] https://github.com/apache/nifi-minifi-cpp/commit/20d281adafb95fc88d9e58ed47e527b1188f8ad3
> [3] https://github.com/apache/nifi-minifi-cpp/commit/1815c018ce928db30f3a36f49aeb43ea94834088
> [4] https://github.com/apache/nifi-minifi-cpp/commit/3d7262a883dff57b7e0999a20f6e745d1197f480
> [5] https://github.com/apache/nifi-minifi-cpp/commit/3bbaa0789a142e95edb45a73ad68cd8c620a1495
> [6] https://github.com/apache/nifi-minifi-cpp/commit/78af9f665ae00ea1e14f96a3bed95ed3877d5403
> [7] https://github.com/apache/nifi-minifi-cpp/commit/37891aafb8b2220622a97c29a13a854388193b0a
> [8] https://github.com/apache/nifi-minifi-cpp/commit/bd1182eb8cc6121a958d28db41ab27d24d6f54bc
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>   .../0001-Do-not-use-bundled-packages.patch    | 238 +++++++++++++-----
>   ...-mutex_-to-mtx_-member-of-Concurrent.patch |  37 ---
>   .../files/0002-Fix-osspuuid-build.patch       |  24 +-
>   .../files/0003-Fix-libsodium-build.patch      |   8 +-
>   .../files/0004-Fix-spdlog-build.patch         |  44 ----
>   ...ch => 0004-Pass-noline-flag-to-flex.patch} |  12 +-
>   ...erateVersion.sh-set-correct-buildrev.patch |  32 +++
>   ...06-CMakeLists.txt-do-not-use-ccache.patch} |  12 +-
>   ...d-missing-header-cstdint-for-int64_t.patch |  36 ---
>   ...iler-attributes-after-including-arm_.patch | 141 +++++++++++
>   .../files/0008-libsodium-aarch64_crypto.patch |  38 ---
>   ...ifi-cpp_0.15.0.bb => minifi-cpp_0.99.1.bb} |  90 ++++---
>   12 files changed, 425 insertions(+), 287 deletions(-)
>   delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-libminifi-Rename-mutex_-to-mtx_-member-of-Concurrent.patch
>   delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0004-Fix-spdlog-build.patch
>   rename meta-oe/recipes-extended/minifi-cpp/files/{0005-Pass-noline-flag-to-flex.patch => 0004-Pass-noline-flag-to-flex.patch} (75%)
>   create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0005-generateVersion.sh-set-correct-buildrev.patch
>   rename meta-oe/recipes-extended/minifi-cpp/files/{0007-CMakeLists.txt-do-not-use-ccache.patch => 0006-CMakeLists.txt-do-not-use-ccache.patch} (77%)
>   delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0006-OsUtils.h-add-missing-header-cstdint-for-int64_t.patch
>   create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0007-libsodium-aarch64-set-compiler-attributes-after-including-arm_.patch
>   delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0008-libsodium-aarch64_crypto.patch
>   rename meta-oe/recipes-extended/minifi-cpp/{minifi-cpp_0.15.0.bb => minifi-cpp_0.99.1.bb} (74%)
>
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not-use-bundled-packages.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not-use-bundled-packages.patch
> index b997d6ce7d..68fd1ee3e0 100644
> --- a/meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not-use-bundled-packages.patch
> +++ b/meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not-use-bundled-packages.patch
> @@ -1,4 +1,4 @@
> -From 65923a872e44cb461ef1a03374057351f0bc5efe Mon Sep 17 00:00:00 2001
> +From 4952f03d150770ff06f9a12ff42d8de680407649 Mon Sep 17 00:00:00 2001
>   From: Yi Zhao <yi.zhao@windriver.com>
>   Date: Tue, 19 Mar 2024 19:39:04 +0800
>   Subject: [PATCH] Do not use bundled packages
> @@ -10,60 +10,27 @@ Upstream-Status: Inappropriate [embedded specific]
>   
>   Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>   ---
> - CMakeLists.txt                       | 23 ++++++-----------------
> - extensions/libarchive/CMakeLists.txt |  7 ++-----
> - 2 files changed, 8 insertions(+), 22 deletions(-)
> + CMakeLists.txt                       | 3 +--
> + cmake/GetBZip2.cmake                 | 3 +++
> + cmake/GetCatch2.cmake                | 4 ++++
> + cmake/GetCivetWeb.cmake              | 3 +++
> + cmake/GetFmt.cmake                   | 3 +++
> + cmake/GetLibCURL.cmake               | 3 +++
> + cmake/GetLibXml2.cmake               | 3 +++
> + cmake/GetOpenSSL.cmake               | 3 +++
> + cmake/GetRocksDB.cmake               | 4 ++++
> + cmake/GetSpdlog.cmake                | 4 ++++
> + cmake/GetZLIB.cmake                  | 3 +++
> + cmake/GetZstd.cmake                  | 4 ++++
> + extensions/libarchive/CMakeLists.txt | 6 ++----
> + 13 files changed, 40 insertions(+), 6 deletions(-)
>   
>   diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 13a2b992..8a1dd6d9 100644
> +index 50e31d871..fc1718dfd 100644
>   --- a/CMakeLists.txt
>   +++ b/CMakeLists.txt
> -@@ -222,9 +222,7 @@ else()
> - endif()
> -
> - if (NOT DISABLE_BZIP2 AND (NOT DISABLE_LIBARCHIVE OR (NOT DISABLE_ROCKSDB AND NOT WIN32)))
> --    include(BundledBZip2)
> --    use_bundled_bzip2(${CMAKE_SOURCE_DIR} ${CMAKE_BINARY_DIR})
> --    list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/bzip2/dummy")
> -+    find_package(BZip2 REQUIRED)
> - endif()
> -
> - if(NOT WIN32)
> -@@ -247,9 +245,7 @@ endif()
> -
> - # OpenSSL
> - if (NOT OPENSSL_OFF)
> --    include(BundledOpenSSL)
> --    use_openssl("${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_BINARY_DIR}")
> --    list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/ssl")
> -+    find_package(OpenSSL REQUIRED)
> -
> -     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DOPENSSL_SUPPORT")
> -     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DOPENSSL_SUPPORT")
> -@@ -262,9 +258,7 @@ set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DSODIUM_STATIC=1")
> - set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DSODIUM_STATIC=1")
> -
> - # zlib
> --include(BundledZLIB)
> --use_bundled_zlib(${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_DIR})
> --list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/zlib/dummy")
> -+find_package(ZLIB REQUIRED)
> -
> - # uthash
> - add_library(ut INTERFACE)
> -@@ -272,9 +266,7 @@ target_include_directories(ut SYSTEM INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/thir
> -
> - # cURL
> - if(NOT DISABLE_CURL)
> --    include(BundledLibcURL)
> --    use_bundled_curl(${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_DIR})
> --    list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/curl/dummy")
> -+    find_package(CURL REQUIRED)
> - else()
> -     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DDISABLE_CURL")
> -     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DDISABLE_CURL")
> -@@ -285,8 +277,7 @@ include(BundledSpdlog)
> - use_bundled_spdlog(${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_DIR})
> +@@ -265,8 +265,7 @@ include(GetSpdlog)
> + get_spdlog()
>    
>    # yaml-cpp
>   -include(BundledYamlCpp)
> @@ -72,27 +39,162 @@ index 13a2b992..8a1dd6d9 100644
>    
>    # concurrentqueue
>    add_library(concurrentqueue INTERFACE)
> -@@ -357,9 +348,7 @@ include(Extensions)
> - add_subdirectory(libminifi)
> -
> - if ((ENABLE_OPENWSMAN AND NOT DISABLE_CIVET AND NOT DISABLE_CURL) OR ENABLE_ALL OR ENABLE_AZURE)
> --    include(BundledLibXml2)
> --    use_bundled_libxml2(${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_DIR})
> --    list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/libxml2/dummy")
> -+    find_package(LibXml2 REQUIRED)
> - endif()
> -
> - if (ENABLE_ALL OR ENABLE_PROMETHEUS OR NOT DISABLE_CIVET)
> +diff --git a/cmake/GetBZip2.cmake b/cmake/GetBZip2.cmake
> +index 2a7d47e9e..754122895 100644
> +--- a/cmake/GetBZip2.cmake
> ++++ b/cmake/GetBZip2.cmake
> +@@ -23,5 +23,8 @@ function(get_bzip2 SOURCE_DIR BINARY_DIR)
> +         message("Using CMake to build bzip2 from source")
> +         include(BundledBZip2)
> +         use_bundled_bzip2(${SOURCE_DIR} ${BINARY_DIR})
> ++    elseif(MINIFI_BZIP2_SOURCE STREQUAL "SYSTEM")
> ++        message("Using bzip2 provided by system")
> ++        find_package(BZip2 REQUIRED)
> +     endif()
> + endfunction(get_bzip2)
> +diff --git a/cmake/GetCatch2.cmake b/cmake/GetCatch2.cmake
> +index d6c1d6acc..ec11b0a77 100644
> +--- a/cmake/GetCatch2.cmake
> ++++ b/cmake/GetCatch2.cmake
> +@@ -23,5 +23,9 @@ function(get_catch2)
> +     elseif(MINIFI_CATCH2_SOURCE STREQUAL "BUILD")
> +         message("Using CMake to build Catch2 from source")
> +         include(Catch2)
> ++    elseif(MINIFI_CATCH2_SOURCE STREQUAL "SYSTEM")
> ++        message("Using Catch2 provided by system")
> ++        find_package(Catch2 REQUIRED)
> ++        add_library(Catch2WithMain ALIAS Catch2::Catch2WithMain)
> +     endif()
> + endfunction(get_catch2)
> +diff --git a/cmake/GetCivetWeb.cmake b/cmake/GetCivetWeb.cmake
> +index f30d22289..8fc39a0e2 100644
> +--- a/cmake/GetCivetWeb.cmake
> ++++ b/cmake/GetCivetWeb.cmake
> +@@ -22,5 +22,8 @@ function(get_civetweb)
> +     elseif(MINIFI_CIVETWEB_SOURCE STREQUAL "BUILD")
> +         message("Using CMake to build CivetWeb from source")
> +         include(CivetWeb)
> ++    elseif(MINIFI_CIVETWEB_SOURCE STREQUAL "SYSTEM")
> ++        message("Using CivetWeb provided by system")
> ++        find_package(civetweb REQUIRED)
> +     endif()
> + endfunction(get_civetweb)
> +diff --git a/cmake/GetFmt.cmake b/cmake/GetFmt.cmake
> +index f4f28458d..579a63897 100644
> +--- a/cmake/GetFmt.cmake
> ++++ b/cmake/GetFmt.cmake
> +@@ -22,5 +22,8 @@ function(get_fmt)
> +     elseif(MINIFI_FMT_SOURCE STREQUAL "BUILD")
> +         message("Using CMake to build Fmt from source")
> +         include(fmt)
> ++    elseif(MINIFI_FMT_SOURCE STREQUAL "SYSTEM")
> ++        message("Using Fmt provided by system")
> ++        find_package(fmt REQUIRED)
> +     endif()
> + endfunction(get_fmt)
> +diff --git a/cmake/GetLibCURL.cmake b/cmake/GetLibCURL.cmake
> +index afd38f3c9..0eac59ec4 100644
> +--- a/cmake/GetLibCURL.cmake
> ++++ b/cmake/GetLibCURL.cmake
> +@@ -23,5 +23,8 @@ function(get_curl SOURCE_DIR BINARY_DIR)
> +         message("Using CMake to build libcurl from source")
> +         include(BundledLibcURL)
> +         use_bundled_curl(${SOURCE_DIR} ${BINARY_DIR})
> ++    elseif(MINIFI_LIBCURL_SOURCE STREQUAL "SYSTEM")
> ++        message("Using libcurl provided by system")
> ++        find_package(CURL REQUIRED)
> +     endif()
> + endfunction(get_curl SOURCE_DIR BINARY_DIR)
> +diff --git a/cmake/GetLibXml2.cmake b/cmake/GetLibXml2.cmake
> +index 5915b117d..18048715d 100644
> +--- a/cmake/GetLibXml2.cmake
> ++++ b/cmake/GetLibXml2.cmake
> +@@ -23,5 +23,8 @@ function(get_libxml2 SOURCE_DIR BINARY_DIR)
> +         message("Using CMake to build libxml2 from source")
> +         include(BundledLibXml2)
> +         use_bundled_libxml2(${SOURCE_DIR} ${BINARY_DIR})
> ++    elseif(MINIFI_LIBXML2_SOURCE STREQUAL "SYSTEM")
> ++        message("Using libxml2 provided by system")
> ++        find_package(libxml2 REQUIRED)
> +     endif()
> + endfunction(get_libxml2)
> +diff --git a/cmake/GetOpenSSL.cmake b/cmake/GetOpenSSL.cmake
> +index 58132c6bf..2b142f94e 100644
> +--- a/cmake/GetOpenSSL.cmake
> ++++ b/cmake/GetOpenSSL.cmake
> +@@ -23,5 +23,8 @@ function(get_openssl SOURCE_DIR BINARY_DIR)
> +         message("Using CMake to build OpenSSL from source")
> +         include(BundledOpenSSL)
> +         use_openssl(${SOURCE_DIR} ${BINARY_DIR})
> ++    elseif(MINIFI_OPENSSL_SOURCE STREQUAL "SYSTEM")
> ++        message("Using OpenSSL provided by system")
> ++        find_package(OpenSSL REQUIRED)
> +     endif()
> + endfunction(get_openssl)
> +diff --git a/cmake/GetRocksDB.cmake b/cmake/GetRocksDB.cmake
> +index 0968afc38..3ca1fe565 100644
> +--- a/cmake/GetRocksDB.cmake
> ++++ b/cmake/GetRocksDB.cmake
> +@@ -30,5 +30,9 @@ function(get_rocksdb SOURCE_DIR BINARY_DIR)
> +             list(APPEND CMAKE_MODULE_PATH "${SOURCE_DIR}/cmake/rocksdb/sys")
> +             find_package(RocksDB REQUIRED)
> +         endif()
> ++    elseif(MINIFI_ROCKSDB_SOURCE STREQUAL "SYSTEM")
> ++        message("Using RocksDB provided by system")
> ++        list(APPEND CMAKE_MODULE_PATH "${SOURCE_DIR}/cmake/rocksdb/sys")
> ++        find_package(RocksDB REQUIRED)
> +     endif()
> + endfunction(get_rocksdb SOURCE_DIR BINARY_DIR)
> +diff --git a/cmake/GetSpdlog.cmake b/cmake/GetSpdlog.cmake
> +index 747894984..6255e31bf 100644
> +--- a/cmake/GetSpdlog.cmake
> ++++ b/cmake/GetSpdlog.cmake
> +@@ -27,5 +27,9 @@ function(get_spdlog)
> +     elseif(MINIFI_SPDLOG_SOURCE STREQUAL "BUILD")
> +         message("Using CMake to build spdlog from source")
> +         include(Spdlog)
> ++    elseif(MINIFI_SPDLOG_SOURCE STREQUAL "SYSTEM")
> ++        message("Using spdlog provided by system")
> ++        find_package(spdlog REQUIRED)
> ++        add_library(spdlog ALIAS spdlog::spdlog)
> +     endif()
> + endfunction(get_spdlog)
> +diff --git a/cmake/GetZLIB.cmake b/cmake/GetZLIB.cmake
> +index 6e7bea1e3..c15e2246a 100644
> +--- a/cmake/GetZLIB.cmake
> ++++ b/cmake/GetZLIB.cmake
> +@@ -23,5 +23,8 @@ function(get_zlib SOURCE_DIR BINARY_DIR)
> +         message("Using CMake to build zlib from source")
> +         include(BundledZLIB)
> +         use_bundled_zlib(${SOURCE_DIR} ${BINARY_DIR})
> ++    elseif(MINIFI_ZLIB_SOURCE STREQUAL "SYSTEM")
> ++        message("Using zlib provided by system")
> ++        find_package(ZLIB REQUIRED)
> +     endif()
> + endfunction(get_zlib)
> +diff --git a/cmake/GetZstd.cmake b/cmake/GetZstd.cmake
> +index a0334b02d..0e7600c22 100644
> +--- a/cmake/GetZstd.cmake
> ++++ b/cmake/GetZstd.cmake
> +@@ -23,5 +23,9 @@ function(get_zstd)
> +     elseif(MINIFI_ZSTD_SOURCE STREQUAL "BUILD")
> +         message("Using CMake to build zstd from source")
> +         include(Zstd)
> ++    elseif(MINIFI_ZSTD_SOURCE STREQUAL "SYSTEM")
> ++        message("Using zstd provided by system")
> ++        find_package(zstd REQUIRED)
> ++        add_library(zstd::zstd ALIAS zstd::libzstd_static)
> +     endif()
> + endfunction(get_zstd)
>   diff --git a/extensions/libarchive/CMakeLists.txt b/extensions/libarchive/CMakeLists.txt
> -index 2b89d3ea..49e13e21 100644
> +index bf7b2a7f5..eb6b71091 100644
>   --- a/extensions/libarchive/CMakeLists.txt
>   +++ b/extensions/libarchive/CMakeLists.txt
> -@@ -22,13 +22,10 @@ if (DISABLE_LIBARCHIVE)
> +@@ -22,12 +22,10 @@ if (NOT ENABLE_LIBARCHIVE)
>    endif()
>    
> - if (NOT DISABLE_LZMA)
> --    include(BundledLibLZMA)
> --    use_bundled_liblzma(${CMAKE_SOURCE_DIR} ${CMAKE_BINARY_DIR})
> + if (ENABLE_LZMA)
> +-    include(LibLZMA)
>   -    list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/liblzma/dummy")
>   +    find_package(LibLZMA REQUIRED)
>    endif()
> @@ -104,5 +206,5 @@ index 2b89d3ea..49e13e21 100644
>    include(${CMAKE_SOURCE_DIR}/extensions/ExtensionHeader.txt)
>    
>   --
> -2.25.1
> +2.34.1
>   
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-libminifi-Rename-mutex_-to-mtx_-member-of-Concurrent.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-libminifi-Rename-mutex_-to-mtx_-member-of-Concurrent.patch
> deleted file mode 100644
> index a09a17bf2c..0000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/files/0001-libminifi-Rename-mutex_-to-mtx_-member-of-Concurrent.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From cd2b5362fe2e63dff3666ce72da27979fe06a519 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 28 May 2024 22:24:52 -0700
> -Subject: [PATCH] libminifi: Rename mutex_ to mtx_ member of ConcurrentQueue
> -
> -Fixes
> -libminifi/include/utils/MinifiConcurrentQueue.h:48:75: error: no member named 'mutex_' in 'ConcurrentQueue<T>'; did you mean 'mtx_'?
> -|    48 |     : ConcurrentQueue(std::move(other), std::lock_guard<std::mutex>(other.mutex_)) {}
> -|       |                                                                           ^~~~~~
> -|       |                                                                           mtx_
> -| libminifi/include/utils/MinifiConcurrentQueue.h:140:22: note: 'mtx_' declared here
> -|   140 |   mutable std::mutex mtx_;
> -|       |                      ^
> -| 1 error generated.
> -
> -Upstream-Status: Submitted [https://github.com/apache/nifi-minifi-cpp/pull/1803]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - libminifi/include/utils/MinifiConcurrentQueue.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/libminifi/include/utils/MinifiConcurrentQueue.h b/libminifi/include/utils/MinifiConcurrentQueue.h
> -index 8abc0ec93..1db58080b 100644
> ---- a/libminifi/include/utils/MinifiConcurrentQueue.h
> -+++ b/libminifi/include/utils/MinifiConcurrentQueue.h
> -@@ -45,7 +45,7 @@ class ConcurrentQueue {
> -   ConcurrentQueue(const ConcurrentQueue& other) = delete;
> -   ConcurrentQueue& operator=(const ConcurrentQueue& other) = delete;
> -   ConcurrentQueue(ConcurrentQueue&& other)
> --    : ConcurrentQueue(std::move(other), std::lock_guard<std::mutex>(other.mutex_)) {}
> -+    : ConcurrentQueue(std::move(other), std::lock_guard<std::mutex>(other.mtx_)) {}
> -
> -   ConcurrentQueue& operator=(ConcurrentQueue&& other) {
> -     if (this != &other) {
> ---
> -2.45.1
> -
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0002-Fix-osspuuid-build.patch b/meta-oe/recipes-extended/minifi-cpp/files/0002-Fix-osspuuid-build.patch
> index 65c52c6337..537beb85d3 100644
> --- a/meta-oe/recipes-extended/minifi-cpp/files/0002-Fix-osspuuid-build.patch
> +++ b/meta-oe/recipes-extended/minifi-cpp/files/0002-Fix-osspuuid-build.patch
> @@ -1,4 +1,4 @@
> -From 4e8e1943541d3b887ba86dc1b488cbb058c7d1cd Mon Sep 17 00:00:00 2001
> +From 429b2b357e5142e2b845da95bdd38e8fc1229831 Mon Sep 17 00:00:00 2001
>   From: Yi Zhao <yi.zhao@windriver.com>
>   Date: Tue, 19 Mar 2024 20:48:25 +0800
>   Subject: [PATCH] Fix osspuuid build
> @@ -16,7 +16,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>    create mode 100644 thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch
>   
>   diff --git a/cmake/BundledOSSPUUID.cmake b/cmake/BundledOSSPUUID.cmake
> -index c4fa1523..1faf2e5c 100644
> +index 747e52c27..fb6e2164d 100644
>   --- a/cmake/BundledOSSPUUID.cmake
>   +++ b/cmake/BundledOSSPUUID.cmake
>   @@ -23,10 +23,12 @@ function(use_bundled_osspuuid SOURCE_DIR BINARY_DIR)
> @@ -33,16 +33,16 @@ index c4fa1523..1faf2e5c 100644
>    
>        # Define byproducts
>        set(BYPRODUCTS "lib/libuuid.a"
> -@@ -39,7 +41,7 @@ function(use_bundled_osspuuid SOURCE_DIR BINARY_DIR)
> -     ENDFOREACH(BYPRODUCT)
> -
> -     # Build project
> --    set(CONFIGURE_COMMAND ./configure "CC=${CMAKE_C_COMPILER}" "CXX=${CMAKE_CXX_COMPILER}" "CFLAGS=${PASSTHROUGH_CMAKE_C_FLAGS} -fPIC" "CXXFLAGS=${PASSTHROUGH_CMAKE_CXX_FLAGS} -fPIC" --enable-shared=no --with-cxx --without-perl --without-php --without-pgsql "--prefix=${BINARY_DIR}/thirdparty/ossp-uuid-install")
> +@@ -45,7 +47,7 @@ function(use_bundled_osspuuid SOURCE_DIR BINARY_DIR)
> +     if(APPLE)
> +         string(APPEND ADDITIONAL_COMPILER_FLAGS "-isysroot ${CMAKE_OSX_SYSROOT} ")
> +     endif()
> +-    set(CONFIGURE_COMMAND ./configure "CC=${CMAKE_C_COMPILER}" "CXX=${CMAKE_CXX_COMPILER}" "CFLAGS=${PASSTHROUGH_CMAKE_C_FLAGS} ${ADDITIONAL_COMPILER_FLAGS}" "CXXFLAGS=${PASSTHROUGH_CMAKE_CXX_FLAGS} ${ADDITIONAL_COMPILER_FLAGS}" --enable-shared=no --with-cxx --without-perl --without-php --without-pgsql "--prefix=${BINARY_DIR}/thirdparty/ossp-uuid-install")
>   +    set(CONFIGURE_COMMAND ac_cv_va_copy=C99 ./configure --host=${HOST_SYS} --build=${BUILD_SYS} "CC=${CMAKE_C_COMPILER}" "CXX=${CMAKE_CXX_COMPILER}" "CFLAGS=${PASSTHROUGH_CMAKE_C_FLAGS} -fPIC" "CXXFLAGS=${PASSTHROUGH_CMAKE_CXX_FLAGS} -fPIC" --enable-shared=no --with-cxx --without-perl --without-php --without-pgsql "--prefix=${BINARY_DIR}/thirdparty/ossp-uuid-install")
> +
>        string(TOLOWER "${CMAKE_BUILD_TYPE}" build_type)
> -     if(NOT build_type MATCHES debug)
> -         list(APPEND CONFIGURE_COMMAND --enable-debug=yes)
> -@@ -47,10 +49,8 @@ function(use_bundled_osspuuid SOURCE_DIR BINARY_DIR)
> +     if(build_type MATCHES debug)
> +@@ -54,10 +56,8 @@ function(use_bundled_osspuuid SOURCE_DIR BINARY_DIR)
>    
>        ExternalProject_Add(
>                ossp-uuid-external
> @@ -56,7 +56,7 @@ index c4fa1523..1faf2e5c 100644
>                UPDATE_COMMAND ""
>   diff --git a/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch b/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch
>   new file mode 100644
> -index 00000000..b8d7b0bb
> +index 000000000..b8d7b0bba
>   --- /dev/null
>   +++ b/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch
>   @@ -0,0 +1,13 @@
> @@ -74,5 +74,5 @@ index 00000000..b8d7b0bb
>   +         if [ ".$opt_o" != . ]; then
>   +             if [ ".$opt_t" = .yes ]; then
>   --
> -2.25.1
> +2.34.1
>   
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0003-Fix-libsodium-build.patch b/meta-oe/recipes-extended/minifi-cpp/files/0003-Fix-libsodium-build.patch
> index a08962724e..10d9965ef4 100644
> --- a/meta-oe/recipes-extended/minifi-cpp/files/0003-Fix-libsodium-build.patch
> +++ b/meta-oe/recipes-extended/minifi-cpp/files/0003-Fix-libsodium-build.patch
> @@ -1,4 +1,4 @@
> -From 1c697e4d75f0045d5364d622960ff8047a4ad3ec Mon Sep 17 00:00:00 2001
> +From a19e548826e65a95a55ac6b9c12a83d3dcc0010d Mon Sep 17 00:00:00 2001
>   From: Yi Zhao <yi.zhao@windriver.com>
>   Date: Tue, 19 Mar 2024 20:56:05 +0800
>   Subject: [PATCH] Fix libsodium build
> @@ -14,7 +14,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>    1 file changed, 2 insertions(+), 4 deletions(-)
>   
>   diff --git a/cmake/BundledLibSodium.cmake b/cmake/BundledLibSodium.cmake
> -index 3a3daf41..d851f753 100644
> +index 98d05b737..4f0faa879 100644
>   --- a/cmake/BundledLibSodium.cmake
>   +++ b/cmake/BundledLibSodium.cmake
>   @@ -58,14 +58,12 @@ function(use_bundled_libsodium SOURCE_DIR BINARY_DIR)
> @@ -26,7 +26,7 @@ index 3a3daf41..d851f753 100644
>    
>            ExternalProject_Add(
>                    libsodium-external
> --                URL "${LIBSODIUM_OFFICIAL_MIRROR_URL} ${LIBSODIUM_GITHUB_MIRROR_URL} ${LIBSODIUM_GENTOO_MIRROR_URL}"
> +-                URL "${LIBSODIUM_OFFICIAL_MIRROR_URL}" "${LIBSODIUM_GITHUB_MIRROR_URL}" "${LIBSODIUM_GENTOO_MIRROR_URL}"
>   -                URL_HASH ${LIBSODIUM_URL_HASH}
>                    BUILD_IN_SOURCE true
>   -                SOURCE_DIR "${BINARY_DIR}/thirdparty/libsodium-src"
> @@ -35,5 +35,5 @@ index 3a3daf41..d851f753 100644
>                    CMAKE_COMMAND ""
>                    UPDATE_COMMAND ""
>   --
> -2.25.1
> +2.34.1
>   
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0004-Fix-spdlog-build.patch b/meta-oe/recipes-extended/minifi-cpp/files/0004-Fix-spdlog-build.patch
> deleted file mode 100644
> index 177c6adee6..0000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/files/0004-Fix-spdlog-build.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From 8a5fe73f722718aa5c9a467c28a26913771f7208 Mon Sep 17 00:00:00 2001
> -From: Yi Zhao <yi.zhao@windriver.com>
> -Date: Tue, 19 Mar 2024 20:57:37 +0800
> -Subject: [PATCH] Fix spdlog build
> -
> -* Specify CMAKE_INSTALL_LIBDIR to fix multilib build.
> -* Do not download spdlog source during compile.
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ----
> - cmake/BundledSpdlog.cmake | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/cmake/BundledSpdlog.cmake b/cmake/BundledSpdlog.cmake
> -index 974cbbaa..c0c45688 100644
> ---- a/cmake/BundledSpdlog.cmake
> -+++ b/cmake/BundledSpdlog.cmake
> -@@ -35,11 +35,12 @@ function(use_bundled_spdlog SOURCE_DIR BINARY_DIR)
> -     endif()
> -
> -     # Set build options
> --    set(SPDLOG_SOURCE_DIR "${BINARY_DIR}/thirdparty/spdlog-src")
> -+    set(SPDLOG_SOURCE_DIR "${SOURCE_DIR}/thirdparty/spdlog-src")
> -     set(SPDLOG_INSTALL_DIR "${BINARY_DIR}/thirdparty/spdlog-install")
> -     set(SPDLOG_LIBRARY "${SPDLOG_INSTALL_DIR}/${BYPRODUCT}")
> -     set(SPDLOG_CMAKE_ARGS ${PASSTHROUGH_CMAKE_ARGS}
> -             "-DCMAKE_INSTALL_PREFIX=${SPDLOG_INSTALL_DIR}"
> -+            "-DCMAKE_INSTALL_LIBDIR=${LIBDIR}"
> -             "-DSPDLOG_BUILD_EXAMPLE=OFF"
> -             "-DSPDLOG_BUILD_TESTS=OFF"
> -             "-DSPDLOG_BUILD_TESTING=OFF"
> -@@ -49,7 +50,6 @@ function(use_bundled_spdlog SOURCE_DIR BINARY_DIR)
> -     # Build project
> -     ExternalProject_Add(
> -             spdlog-external
> --            URL "https://github.com/gabime/spdlog/archive/v1.8.0.zip"
> -             SOURCE_DIR "${SPDLOG_SOURCE_DIR}"
> -             CMAKE_ARGS ${SPDLOG_CMAKE_ARGS}
> -             BUILD_BYPRODUCTS "${SPDLOG_LIBRARY}"
> ---
> -2.25.1
> -
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0005-Pass-noline-flag-to-flex.patch b/meta-oe/recipes-extended/minifi-cpp/files/0004-Pass-noline-flag-to-flex.patch
> similarity index 75%
> rename from meta-oe/recipes-extended/minifi-cpp/files/0005-Pass-noline-flag-to-flex.patch
> rename to meta-oe/recipes-extended/minifi-cpp/files/0004-Pass-noline-flag-to-flex.patch
> index 53939131ff..344e8839e7 100644
> --- a/meta-oe/recipes-extended/minifi-cpp/files/0005-Pass-noline-flag-to-flex.patch
> +++ b/meta-oe/recipes-extended/minifi-cpp/files/0004-Pass-noline-flag-to-flex.patch
> @@ -1,4 +1,4 @@
> -From 083babbd6c6cc6f31530fbac0227c1d426fb0863 Mon Sep 17 00:00:00 2001
> +From 229137659501ae51774dcb3249f94545bdd6e21f Mon Sep 17 00:00:00 2001
>   From: Yi Zhao <yi.zhao@windriver.com>
>   Date: Tue, 19 Mar 2024 21:00:59 +0800
>   Subject: [PATCH] Pass --noline flag to flex
> @@ -14,18 +14,18 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>    1 file changed, 1 insertion(+), 1 deletion(-)
>   
>   diff --git a/extensions/expression-language/CMakeLists.txt b/extensions/expression-language/CMakeLists.txt
> -index 775b4116..84edc617 100644
> +index c179ab3ef..7f507b03a 100644
>   --- a/extensions/expression-language/CMakeLists.txt
>   +++ b/extensions/expression-language/CMakeLists.txt
> -@@ -77,7 +77,7 @@ flex_target(
> +@@ -103,7 +103,7 @@ flex_target(
>        el-scanner
>        ${CMAKE_CURRENT_SOURCE_DIR}/Scanner.ll
> -     ${CMAKE_CURRENT_SOURCE_DIR}/Scanner.cpp
> +     ${CMAKE_BINARY_DIR}/el-generated/Scanner.cpp
>   -    COMPILE_FLAGS --c++
>   +    COMPILE_FLAGS "--c++ --noline"
>    )
>    
> - add_flex_bison_dependency(el-scanner el-parser)
> + set(EL_GENERATED_INCLUDE_DIR ${CMAKE_BINARY_DIR}/el-generated)
>   --
> -2.25.1
> +2.34.1
>   
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0005-generateVersion.sh-set-correct-buildrev.patch b/meta-oe/recipes-extended/minifi-cpp/files/0005-generateVersion.sh-set-correct-buildrev.patch
> new file mode 100644
> index 0000000000..2e78b1087e
> --- /dev/null
> +++ b/meta-oe/recipes-extended/minifi-cpp/files/0005-generateVersion.sh-set-correct-buildrev.patch
> @@ -0,0 +1,32 @@
> +From 1861170c6de3dd851324debf3a6eaeff4d8d8bce Mon Sep 17 00:00:00 2001
> +From: Yi Zhao <yi.zhao@windriver.com>
> +Date: Fri, 14 Mar 2025 20:26:38 +0800
> +Subject: [PATCH] generateVersion.sh: set correct buildrev
> +
> +Since this script is run outside the source directory, git log can not
> +get the commit id, so buildrev is not set correctly. Fix the issue by
> +adding -C option.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + generateVersion.sh | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/generateVersion.sh b/generateVersion.sh
> +index ff25afba8..0b50a1693 100755
> +--- a/generateVersion.sh
> ++++ b/generateVersion.sh
> +@@ -28,7 +28,7 @@ buildident=$8
> + date=$(date +%s)
> +
> + if [ -d "${src_dir}"/.git ]; then
> +-  buildrev=$(git log -1 --pretty=format:"%H")
> ++  buildrev=$(git -C "${src_dir}" log -1 --pretty=format:"%H")
> + else
> +   buildrev="Unknown"
> + fi
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0007-CMakeLists.txt-do-not-use-ccache.patch b/meta-oe/recipes-extended/minifi-cpp/files/0006-CMakeLists.txt-do-not-use-ccache.patch
> similarity index 77%
> rename from meta-oe/recipes-extended/minifi-cpp/files/0007-CMakeLists.txt-do-not-use-ccache.patch
> rename to meta-oe/recipes-extended/minifi-cpp/files/0006-CMakeLists.txt-do-not-use-ccache.patch
> index 73a59f2a84..055a3e7b57 100644
> --- a/meta-oe/recipes-extended/minifi-cpp/files/0007-CMakeLists.txt-do-not-use-ccache.patch
> +++ b/meta-oe/recipes-extended/minifi-cpp/files/0006-CMakeLists.txt-do-not-use-ccache.patch
> @@ -1,4 +1,4 @@
> -From 44867a8e4100a7296b98e0e850d950d24b980959 Mon Sep 17 00:00:00 2001
> +From bbe5c95ef1755c4804c4561c03cafedeb004cb36 Mon Sep 17 00:00:00 2001
>   From: Yi Zhao <yi.zhao@windriver.com>
>   Date: Thu, 21 Mar 2024 10:18:39 +0800
>   Subject: [PATCH] CMakeLists.txt: do not use ccache
> @@ -11,10 +11,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>    1 file changed, 6 insertions(+), 6 deletions(-)
>   
>   diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 8a1dd6d91..8a5314544 100644
> +index fc1718dfd..70c94c2ff 100644
>   --- a/CMakeLists.txt
>   +++ b/CMakeLists.txt
> -@@ -82,12 +82,12 @@ if (USE_REAL_ODBC_TEST_DRIVER)
> +@@ -84,12 +84,12 @@ if (MINIFI_USE_REAL_ODBC_TEST_DRIVER)
>    endif()
>    
>    # Use ccache if present
> @@ -31,8 +31,8 @@ index 8a1dd6d91..8a5314544 100644
>   +#    message("-- Found ccache: ${CCACHE_FOUND}")
>   +#endif(CCACHE_FOUND)
>    
> - # Use gold linker if instructed
> - if (UNIX AND USE_GOLD_LINKER AND NOT APPLE )
> + # Check for exec info before we enable the backtrace features.
> + CHECK_INCLUDE_FILE("execinfo.h" HAS_EXECINFO)
>   --
> -2.25.1
> +2.34.1
>   
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0006-OsUtils.h-add-missing-header-cstdint-for-int64_t.patch b/meta-oe/recipes-extended/minifi-cpp/files/0006-OsUtils.h-add-missing-header-cstdint-for-int64_t.patch
> deleted file mode 100644
> index 38893e74ac..0000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/files/0006-OsUtils.h-add-missing-header-cstdint-for-int64_t.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 08d1b4b66fedde97eefb5e3ff6aa98fd02be7c21 Mon Sep 17 00:00:00 2001
> -From: Yi Zhao <yi.zhao@windriver.com>
> -Date: Wed, 20 Mar 2024 10:03:14 +0800
> -Subject: [PATCH] OsUtils.h: add missing header <cstdint> for int64_t
> -
> -Fix build with musl:
> -libminifi/include/utils/OsUtils.h:31:1: error: 'int64_t' does not name a type
> -   31 | int64_t getCurrentProcessPhysicalMemoryUsage();
> -      | ^~~~~~~
> -libminifi/include/utils/OsUtils.h:22:1: note: 'int64_t' is defined in header '<cstdint>'; did you forget to '#include <cstdint>'?
> -   21 | #include <system_error>
> -  +++ |+#include <cstdint>
> -   22 |
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ----
> - libminifi/include/utils/OsUtils.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/libminifi/include/utils/OsUtils.h b/libminifi/include/utils/OsUtils.h
> -index a7117233..5e623d1a 100644
> ---- a/libminifi/include/utils/OsUtils.h
> -+++ b/libminifi/include/utils/OsUtils.h
> -@@ -19,6 +19,7 @@
> - #include <string>
> - #include <optional>
> - #include <system_error>
> -+#include <cstdint>
> -
> - struct sockaddr;
> -
> ---
> -2.25.1
> -
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0007-libsodium-aarch64-set-compiler-attributes-after-including-arm_.patch b/meta-oe/recipes-extended/minifi-cpp/files/0007-libsodium-aarch64-set-compiler-attributes-after-including-arm_.patch
> new file mode 100644
> index 0000000000..792a7888e3
> --- /dev/null
> +++ b/meta-oe/recipes-extended/minifi-cpp/files/0007-libsodium-aarch64-set-compiler-attributes-after-including-arm_.patch
> @@ -0,0 +1,141 @@
> +From 3a59f8e5331bb6be5d298bc5c136a79102196c1d Mon Sep 17 00:00:00 2001
> +From: Frank Denis <github@pureftpd.org>
> +Date: Fri, 20 Oct 2023 13:47:57 +0200
> +Subject: [PATCH] aarch64: set compiler attributes *after* including
> + <arm_neon.h>
> +
> +Fixes #1321
> +
> +Upstream-Status: Backport
> +[https://github.com/jedisct1/libsodium/commit/8f453f41f8834e0fe47610f2a3e03e696ddb3450]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + thirdparty/libsodium-stable/configure.ac             | 11 ++++++-----
> + .../crypto_aead/aegis128l/aegis128l_armcrypto.c      | 12 ++++++------
> + .../crypto_aead/aegis256/aegis256_armcrypto.c        | 12 ++++++------
> + .../aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c   | 12 ++++++------
> + 4 files changed, 24 insertions(+), 23 deletions(-)
> +
> +diff --git a/thirdparty/libsodium-stable/configure.ac b/thirdparty/libsodium-stable/configure.ac
> +index df83ef512..be67d3417 100644
> +--- a/thirdparty/libsodium-stable/configure.ac
> ++++ b/thirdparty/libsodium-stable/configure.ac
> +@@ -398,11 +398,6 @@ AS_IF([test "x$EMSCRIPTEN" = "x"], [
> +     have_armcrypto=no
> +     AC_MSG_CHECKING(for ARM crypto instructions set)
> +     AC_LINK_IFELSE([AC_LANG_PROGRAM([[
> +-      #ifdef __clang__
> +-      #  pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
> +-      #elif defined(__GNUC__)
> +-      #  pragma GCC target("+simd+crypto")
> +-      #endif
> +       #ifndef __ARM_FEATURE_CRYPTO
> +       #  define __ARM_FEATURE_CRYPTO 1
> +       #endif
> +@@ -411,6 +406,12 @@ AS_IF([test "x$EMSCRIPTEN" = "x"], [
> +       #endif
> +
> +       #include <arm_neon.h>
> ++
> ++      #ifdef __clang__
> ++      #  pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
> ++      #elif defined(__GNUC__)
> ++      #  pragma GCC target("+simd+crypto")
> ++      #endif
> +     ]], [[
> +       vaeseq_u8(vmovq_n_u8(0), vmovq_n_u8(0));
> +
> +diff --git a/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aegis128l/aegis128l_armcrypto.c b/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aegis128l/aegis128l_armcrypto.c
> +index 825de8a1c..a01f60cbe 100644
> +--- a/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aegis128l/aegis128l_armcrypto.c
> ++++ b/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aegis128l/aegis128l_armcrypto.c
> +@@ -17,12 +17,6 @@
> +
> + #include "aegis128l_armcrypto.h"
> +
> +-#ifdef __clang__
> +-#pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
> +-#elif defined(__GNUC__)
> +-#pragma GCC target("+simd+crypto")
> +-#endif
> +-
> + #ifndef __ARM_FEATURE_CRYPTO
> + #define __ARM_FEATURE_CRYPTO 1
> + #endif
> +@@ -32,6 +26,12 @@
> +
> + #include <arm_neon.h>
> +
> ++#ifdef __clang__
> ++#pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
> ++#elif defined(__GNUC__)
> ++#pragma GCC target("+simd+crypto")
> ++#endif
> ++
> + #define AES_BLOCK_LENGTH 16
> +
> + typedef uint8x16_t aes_block_t;
> +diff --git a/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aegis256/aegis256_armcrypto.c b/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aegis256/aegis256_armcrypto.c
> +index e1ebd577a..058e2072b 100644
> +--- a/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aegis256/aegis256_armcrypto.c
> ++++ b/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aegis256/aegis256_armcrypto.c
> +@@ -17,12 +17,6 @@
> +
> + #include "aegis256_armcrypto.h"
> +
> +-#ifdef __clang__
> +-#pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
> +-#elif defined(__GNUC__)
> +-#pragma GCC target("+simd+crypto")
> +-#endif
> +-
> + #ifndef __ARM_FEATURE_CRYPTO
> + #define __ARM_FEATURE_CRYPTO 1
> + #endif
> +@@ -32,6 +26,12 @@
> +
> + #include <arm_neon.h>
> +
> ++#ifdef __clang__
> ++#pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
> ++#elif defined(__GNUC__)
> ++#pragma GCC target("+simd+crypto")
> ++#endif
> ++
> + #define AES_BLOCK_LENGTH 16
> +
> + typedef uint8x16_t aes_block_t;
> +diff --git a/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c b/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c
> +index 0a5a12811..aa76f5cd1 100644
> +--- a/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c
> ++++ b/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c
> +@@ -19,12 +19,6 @@
> + #define __vectorcall
> + #endif
> +
> +-#ifdef __clang__
> +-#pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
> +-#elif defined(__GNUC__)
> +-#pragma GCC target("+simd+crypto")
> +-#endif
> +-
> + #ifndef __ARM_FEATURE_CRYPTO
> + #define __ARM_FEATURE_CRYPTO 1
> + #endif
> +@@ -34,6 +28,12 @@
> +
> + #include <arm_neon.h>
> +
> ++#ifdef __clang__
> ++#pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
> ++#elif defined(__GNUC__)
> ++#pragma GCC target("+simd+crypto")
> ++#endif
> ++
> + #define ABYTES    crypto_aead_aes256gcm_ABYTES
> + #define NPUBBYTES crypto_aead_aes256gcm_NPUBBYTES
> + #define KEYBYTES  crypto_aead_aes256gcm_KEYBYTES
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0008-libsodium-aarch64_crypto.patch b/meta-oe/recipes-extended/minifi-cpp/files/0008-libsodium-aarch64_crypto.patch
> deleted file mode 100644
> index c2c51148f6..0000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/files/0008-libsodium-aarch64_crypto.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -Move target #pragma after arm_neon.h include
> -
> -Fix per android/ndk#1945
> -
> -If the pragma is done before the header include,
> -when using clang compiler attribute may apply to the functions in arm_neon.h
> -
> -Upstream-Status: Submitted [https://github.com/jedisct1/libsodium/pull/1321]
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---- a/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c
> -+++ b/thirdparty/libsodium-stable/src/libsodium/crypto_aead/aes256gcm/armcrypto/aead_aes256gcm_armcrypto.c
> -@@ -19,12 +19,6 @@
> - #define __vectorcall
> - #endif
> -
> --#ifdef __clang__
> --#pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
> --#elif defined(__GNUC__)
> --#pragma GCC target("+simd+crypto")
> --#endif
> --
> - #ifndef __ARM_FEATURE_CRYPTO
> - #define __ARM_FEATURE_CRYPTO 1
> - #endif
> -@@ -34,6 +28,12 @@
> -
> - #include <arm_neon.h>
> -
> -+#ifdef __clang__
> -+#pragma clang attribute push(__attribute__((target("neon,crypto,aes"))), apply_to = function)
> -+#elif defined(__GNUC__)
> -+#pragma GCC target("+simd+crypto")
> -+#endif
> -+
> - #define ABYTES    crypto_aead_aes256gcm_ABYTES
> - #define NPUBBYTES crypto_aead_aes256gcm_NPUBBYTES
> - #define KEYBYTES  crypto_aead_aes256gcm_KEYBYTES
> diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
> similarity index 74%
> rename from meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb
> rename to meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
> index 6f5cd49116..d35b5d5df8 100644
> --- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb
> +++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
> @@ -5,54 +5,64 @@ management, focusing on the collection of data at the source of its creation."
>   HOMEPAGE = "https://nifi.apache.org/minifi/index.html"
>   SECTION = "console/network"
>   LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c62efdfb90a8aa4cc3bc15f56baa30b7"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4c5fc3bbd872752266d21f5f167ce297"
>   
>   SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;protocol=https;branch=main \
>              git://github.com/martinmoene/expected-lite.git;protocol=https;branch=master;name=expected-lite;destsuffix=${S}/thirdparty/expected-lite-src \
>              git://github.com/ericniebler/range-v3.git;protocol=https;branch=master;name=range-v3;destsuffix=${S}/thirdparty/range-v3-src \
>              git://github.com/Neargye/magic_enum.git;protocol=https;branch=master;name=magic-enum;destsuffix=${S}/thirdparty/magic-enum-src \
> -           git://github.com/jarro2783/cxxopts.git;protocol=https;branch=v2_2;name=cxxopts;destsuffix=${S}/thirdparty/cxxopts-src \
> +           git://github.com/p-ranav/argparse.git;protocol=https;branch=master;name=argparse;destsuffix=${S}/thirdparty/argparse-src \
>              git://github.com/gsl-lite/gsl-lite.git;protocol=https;branch=master;name=gsl-lite;destsuffix=${S}/thirdparty/gsl-lite-src \
>              git://github.com/HowardHinnant/date.git;protocol=https;branch=master;name=date;destsuffix=${S}/thirdparty/date-src \
>              git://github.com/chriskohlhoff/asio.git;protocol=https;branch=master;name=asio;destsuffix=${S}/thirdparty/asio-src \
> +           git://github.com/fmtlib/fmt.git;protocol=https;branch=master;name=fmt;destsuffix=${S}/thirdparty/fmt-src \
>              git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x;name=spdlog;destsuffix=${S}/thirdparty/spdlog-src \
> -           git://github.com/civetweb/civetweb.git;protocol=https;branch=master;name=civetweb;destsuffix=${S}/thirdparty/civetweb-src \
>              ${DEBIAN_MIRROR}/main/o/ossp-uuid/ossp-uuid_1.6.2.orig.tar.gz;name=ossp-uuid;subdir=${S}/thirdparty \
>              https://download.libsodium.org/libsodium/releases/libsodium-1.0.19.tar.gz;name=libsodium;subdir=${S}/thirdparty \
>              file://0001-Do-not-use-bundled-packages.patch \
>              file://0002-Fix-osspuuid-build.patch \
>              file://0003-Fix-libsodium-build.patch \
> -           file://0004-Fix-spdlog-build.patch \
> -           file://0005-Pass-noline-flag-to-flex.patch \
> -           file://0006-OsUtils.h-add-missing-header-cstdint-for-int64_t.patch \
> -           file://0007-CMakeLists.txt-do-not-use-ccache.patch \
> -           file://0008-libsodium-aarch64_crypto.patch \
> -           file://0001-libminifi-Rename-mutex_-to-mtx_-member-of-Concurrent.patch \
> +           file://0004-Pass-noline-flag-to-flex.patch \
> +           file://0005-generateVersion.sh-set-correct-buildrev.patch \
> +           file://0006-CMakeLists.txt-do-not-use-ccache.patch \
> +           file://0007-libsodium-aarch64-set-compiler-attributes-after-including-arm_.patch \
>              file://systemd-volatile.conf \
>              file://sysvinit-volatile.conf \
>             "
>   
> -SRCREV = "9b55dc0c0f17a190f3e9ade87070a28faf542c25"
> +# minifi-cpp: 0.99.1
> +SRCREV = "78d53ed154c71f1fabbaff0366d44ed3b32754e6"
> +# expected-lite: 0.6.3
>   SRCREV_expected-lite = "c8ffab649ba56e43c731b7017a69ddaebe2e1893"
> +# range-v3: 0.12.0
>   SRCREV_range-v3 = "a81477931a8aa2ad025c6bda0609f38e09e4d7ec"
> -SRCREV_magic-enum = "e1ea11a93d0bdf6aae415124ded6126220fa4f28"
> -SRCREV_cxxopts = "302302b30839505703d37fb82f536c53cf9172fa"
> +# magic-enum: 0.9.6
> +SRCREV_magic-enum = "dd6a39d0ba1852cf06907e0f0573a2a10d23c2ad"
> +# argparse: 3.0
> +SRCREV_argparse = "af442b4da0cd7a07b56fa709bd16571889dc7fda"
> +# gsl-lite: 0.41.0
>   SRCREV_gsl-lite = "755ba124b54914e672737acace6a9314f59e8d6f"
> -SRCREV_date = "6e921e1b1d21e84a5c82416ba7ecd98e33a436d0"
> +# date: 3.0.3
> +SRCREV_date = "5bdb7e6f31fac909c090a46dbd9fea27b6e609a4"
> +# asio: 1.29.0
>   SRCREV_asio = "814f67e730e154547aea3f4d99f709cbdf1ea4a0"
> -SRCREV_spdlog = "7c02e204c92545f869e2f04edaab1f19fe8b19fd"
> -SRCREV_civetweb = "d7ba35bbb649209c66e582d5a0244ba988a15159"
> +# fmt: 11.0.2
> +SRCREV_fmt = "0c9fce2ffefecfdce794e1859584e25877b7b592"
> +# spdlog: 1.14.1
> +SRCREV_spdlog = "27cb4c76708608465c413f6d0e6b8d99a4d84302"
>   
> -SRCREV_FORMAT .= "_expected-lite_range-v3_magic-enum_cxxopts_gsl-lite_date_asio_spdlog_civetweb"
> +SRCREV_FORMAT .= "_expected-lite_range-v3_magic-enum_argparse_gsl-lite_date_asio_fmt_spdlog"
>   
> +# ossp-uuid: 1.6.2
>   SRC_URI[ossp-uuid.sha256sum] = "11a615225baa5f8bb686824423f50e4427acd3f70d394765bdff32801f0fd5b0"
> +# libsodium: 1.0.19
>   SRC_URI[libsodium.sha256sum] = "018d79fe0a045cca07331d37bd0cb57b2e838c51bc48fd837a1472e50068bbea"
>   
>   S = "${UNPACKDIR}/git"
>   
>   inherit pkgconfig cmake systemd
>   
> -DEPENDS = "virtual/crypt bison-native flex-native flex openssl curl zlib xz bzip2 yaml-cpp"
> +DEPENDS = "virtual/crypt bison-native flex-native flex openssl curl zlib xz bzip2 yaml-cpp zstd lz4"
>   
>   OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
>   
> @@ -61,10 +71,8 @@ LDFLAGS:append:riscv32 = " -latomic"
>   EXTRA_OECMAKE = " \
>                    -DCMAKE_BUILD_TYPE=Release \
>                    -DHOST_SYS=${HOST_SYS} -DBUILD_SYS=${BUILD_SYS} \
> -                 -DGCC_AR=${STAGING_BINDIR_TOOLCHAIN}/${AR} \
> -                 -DGCC_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${RANLIB} \
>                    -DFLEX_TARGET_ARG_COMPILE_FLAGS='--noline' \
> -                 -DBISON_TARGET_ARG_COMPILE_FLAGS='--no-lines --file-prefix-map=${S}=${TARGET_DBGSRC_DIR}' \
> +                 -DBISON_TARGET_ARG_COMPILE_FLAGS='--no-lines --file-prefix-map=${S}=${TARGET_DBGSRC_DIR} --file-prefix-map=${B}=${TARGET_DBGSRC_DIR}' \
>                    -DENABLE_ENCRYPT_CONFIG=ON \
>                    -DENABLE_LUA_SCRIPTING=OFF \
>                    -DENABLE_PYTHON_SCRIPTING=OFF \
> @@ -73,40 +81,49 @@ EXTRA_OECMAKE = " \
>                    -DENABLE_GCP=OFF \
>                    -DENABLE_KUBERNETES=OFF \
>                    -DENABLE_MQTT=OFF \
> +                 -DENABLE_GRAFANA_LOKI=OFF \
> +                 -DENABLE_GRPC_FOR_LOKI=OFF \
>                    -DENABLE_ELASTICSEARCH=OFF \
>                    -DENABLE_SQL=OFF \
>                    -DENABLE_PROMETHEUS=OFF \
>                    -DENABLE_PROCFS=OFF \
>                    -DENABLE_SPLUNK=OFF \
>                    -DENABLE_OPC=OFF \
> -                 -DENABLE_LIBRDKAFKA=OFF \
> -                 -DDISABLE_CURL=OFF \
> -                 -DDISABLE_BZIP2=OFF \
> -                 -DDISABLE_LZMA=OFF \
> -                 -DDISABLE_JEMALLOC=ON \
> +                 -DENABLE_KAFKA=OFF \
> +                 -DENABLE_BZIP2=ON \
> +                 -DENABLE_LZMA=ON \
>                    -DSKIP_TESTS=ON \
> +                 -DMINIFI_OPENSSL_SOURCE=SYSTEM \
> +                 -DMINIFI_LIBCURL_SOURCE=SYSTEM \
> +                 -DMINIFI_ZSTD_SOURCE=SYSTEM \
> +                 -DMINIFI_BZIP2_SOURCE=SYSTEM \
> +                 -DMINIFI_LIBXML2_SOURCE=SYSTEM \
> +                 -DMINIFI_CATCH2_SOURCE=SYSTEM \
> +                 -DMINIFI_ZLIB_SOURCE=SYSTEM \
> +                 -DMINIFI_FMT_SOURCE=BUILD \
> +                 -DMINIFI_SPDLOG_SOURCE=BUILD \
>                    -DFETCHCONTENT_SOURCE_DIR_GSL-LITE=${S}/thirdparty/gsl-lite-src \
>                    -DFETCHCONTENT_SOURCE_DIR_DATE_SRC=${S}/thirdparty/date-src \
>                    -DFETCHCONTENT_SOURCE_DIR_EXPECTED-LITE=${S}/thirdparty/expected-lite-src \
>                    -DFETCHCONTENT_SOURCE_DIR_RANGE-V3_SRC=${S}/thirdparty/range-v3-src \
>                    -DFETCHCONTENT_SOURCE_DIR_MAGIC_ENUM=${S}/thirdparty/magic-enum-src \
>                    -DFETCHCONTENT_SOURCE_DIR_ASIO=${S}/thirdparty/asio-src \
> -                 -DFETCHCONTENT_SOURCE_DIR_CXXOPTS_SRC=${S}/thirdparty/cxxopts-src \
> -                 -DFETCHCONTENT_SOURCE_DIR_CIVETWEB=${S}/thirdparty/civetweb-src \
> +                 -DFETCHCONTENT_SOURCE_DIR_ARGPARSE=${S}/thirdparty/argparse-src \
> +                 -DFETCHCONTENT_SOURCE_DIR_FMT=${S}/thirdparty/fmt-src \
> +                 -DFETCHCONTENT_SOURCE_DIR_SPDLOG=${S}/thirdparty/spdlog-src \
>                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-DENABLE_SYSTEMD=ON', '-DENABLE_SYSTEMD=OFF', d)} \
>                   "
>   
> -PACKAGECONFIG ??= "civetweb libarchive rocksdb expression-language"
> +PACKAGECONFIG ??= "libarchive expression-language"
>   
>   # rocksdb is not compatible with libc-musl:powerpc & armv5
>   PACKAGECONFIG:remove:libc-musl:powerpc = "rocksdb"
>   PACKAGECONFIG:remove:armv5 = "rocksdb"
>   
> -PACKAGECONFIG[civetweb] = "-DDISABLE_CIVET=OFF,-DDISABLE_CIVET=ON"
> -PACKAGECONFIG[openwsman] = "-DENABLE_OPENWSMAN=ON,-DENABLE_OPENWSMAN=OFF,libxml2"
> -PACKAGECONFIG[libarchive] = "-DDISABLE_LIBARCHIVE=OFF,-DDISABLE_LIBARCHIVE=ON,libarchive"
> -PACKAGECONFIG[rocksdb] = "-DDISABLE_ROCKSDB=OFF -DBUILD_ROCKSDB=OFF,-DDISABLE_ROCKSDB=ON,rocksdb"
> -PACKAGECONFIG[expression-language] = "-DDISABLE_EXPRESSION_LANGUAGE=OFF, -DDISABLE_EXPRESSION_LANGUAGE=ON"
> +PACKAGECONFIG[libarchive] = "-DENABLE_LIBARCHIVE=ON,-DENABLE_LIBARCHIVE=OFF,libarchive"
> +PACKAGECONFIG[expression-language] = "-DENABLE_EXPRESSION_LANGUAGE=ON, -DENABLE_EXPRESSION_LANGUAGE=OFF"
> +PACKAGECONFIG[civetweb] = "-DENABLE_CIVET=ON -DMINIFI_CIVETWEB_SOURCE=SYSTEM,-DENABLE_CIVET=OFF,civetweb"
> +PACKAGECONFIG[rocksdb] = "-DENABLE_ROCKSDB=ON -DBUILD_ROCKSDB=OFF -DMINIFI_ROCKSDB_SOURCE=SYSTEM,-DENABLE_ROCKSDB=OFF,rocksdb"
>   
>   SYSTEMD_PACKAGES = "minifi-cpp"
>   SYSTEMD_SERVICE:${PN} = "minifi.service"
> @@ -146,9 +163,9 @@ do_install() {
>       install -m 755 ${WORKDIR}/minifi-install/usr/extensions/*.so ${D}${libdir}/minifi-extensions
>   
>       install -m 755 -d ${D}${libexecdir}/minifi-python
> -    for i in examples google h2o; do
> -        cp -rf ${WORKDIR}/minifi-install/usr/minifi-python/${i} ${D}${libexecdir}/minifi-python
> -    done
> +    install -m 755 -d ${D}${libexecdir}/minifi-python-examples
> +    cp -rf ${WORKDIR}/minifi-install/usr/minifi-python/* ${D}${libexecdir}/minifi-python/
> +    cp -rf ${WORKDIR}/minifi-install/usr/minifi-python-examples/* ${D}${libexecdir}/minifi-python-examples/
>   
>       sed -i "s|MINIFI_HOME=.*|MINIFI_HOME=${MINIFI_HOME}|g" ${D}${MINIFI_BIN}/minifi.sh
>       sed -i "s|bin_dir=.*|bin_dir=${MINIFI_BIN}|g" ${D}${MINIFI_BIN}/minifi.sh
> @@ -202,6 +219,7 @@ FILES:${PN}-dev = ""
>   FILES:${PN} += "${libdir}/libcore-minifi.so \
>                   ${libdir}/minifi-extensions \
>                   ${libexecdir}/minifi-python \
> +                ${libexecdir}/minifi-python-examples \
>                  "
>   
>   INSANE_SKIP:${PN} += "dev-deps"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116030): https://lists.openembedded.org/g/openembedded-devel/message/116030
> Mute This Topic: https://lists.openembedded.org/mt/111751832/7283133
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [yi.zhao@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

