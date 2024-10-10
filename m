Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E9ECF07B3
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 06:35:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.37409.1728542122150695953
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 23:35:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0013aa6c8c=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A4pxon008596
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 06:35:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 422tp45e99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 06:35:21 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49A6ZKiI026619;
	Thu, 10 Oct 2024 06:35:20 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 422tp45e98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 06:35:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MC/Cb+n0/+r8L+pVEhGWKWni7fxZn7BTkLyDtXCxPA8fXNupRlKHrmELZLVfo31VivXe8AN7c3JOTxn5rSFQajzKYI1HoDe0g1GvjqY6NxmgofdLGY3N7l1qTa8eLhD5ugRe8smg6vnRXHNLMdmD5pD3l5ILPmXpWtFH4MQMlTupedC/XbPIi87xHCHPpVaAEa69MP3tV45OMGSRmveAJMHsPa381KTSgP6wYZk0EV8ynOcMlf32YVKo5QTmg8wV6+YzcCmNMazN8kLmJtZ+foxbGeygL4SOc1ykPxy5uKWdVDRx9/0UEjHkpiXdZrXUDnzYdMhhATxPEeHIJUXOTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQRkTLFIPpxyb/yzvyzh+w1nF4DFdvXht4VBpgGxRrw=;
 b=JBFm4ZzpZgNSmlqG+UiI8vrzIDYDZ6oPZXR2NyFPz0V9hPJO6GMZlqIVc+xJX+qKSrq2ZyDkHTRxRCab5ue88R42ObM6bN2q8IIWfG+XVPbSIR7X6z+JppR1BrRJIsYRgba77cCvRxG8evaaA0AZ9c4UiU+Wa+d1c4s+Howjcv5WHfKTRCG2IFvo5jXTywrY8RbMHHmfyRvo1tWiIhrOM+QN7aw5ADdln47JZAbVLm3puDBqcUxObaTzUOg7prV6zifhbKdoHAdhMvKAFGp5qbHXhqUIQtQnsqT1ahC3H5+7bKDEHh8ENuUUfRw4q7rFMoORRMBO6NJmONHhvtd22g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5014.namprd11.prod.outlook.com (2603:10b6:510:31::17)
 by BY1PR11MB8008.namprd11.prod.outlook.com (2603:10b6:a03:534::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.26; Thu, 10 Oct
 2024 06:35:17 +0000
Received: from PH0PR11MB5014.namprd11.prod.outlook.com
 ([fe80::ac1b:a129:7c3a:1f0]) by PH0PR11MB5014.namprd11.prod.outlook.com
 ([fe80::ac1b:a129:7c3a:1f0%7]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 06:35:16 +0000
Message-ID: <c5c69ed8-d448-42e1-aadd-80760e88c628@windriver.com>
Date: Thu, 10 Oct 2024 14:34:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] asio: Add ptest support
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, mingli.yu@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
References: <20241009092512.3615190-1-mingli.yu@windriver.com>
 <CAMKF1sor2yCfGJKLj+JDWH2-C_QOjpkfP7gMfbTVLuVR1iW+jA@mail.gmail.com>
 <CAMKF1sq4kG88rsstW+nxCpqz5RPoWC1indsPTkuaRWjdAp0SPQ@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <CAMKF1sq4kG88rsstW+nxCpqz5RPoWC1indsPTkuaRWjdAp0SPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYWPR01CA0047.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::12) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5014:EE_|BY1PR11MB8008:EE_
X-MS-Office365-Filtering-Correlation-Id: d4b4692d-ff79-4e4e-b2ca-08dce8f5ac1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|4022899009|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SnJ4dVBsYk9kOXpmR1FZa3RMclBzaVZNbTY5UUNldkg2Vk5iK0xXR3g2Q0s5?=
 =?utf-8?B?STZWRGpHTmdPUlBCSGd4RFhZc3QwMVQ1UlhiU1dnYll3VXZadW5IUFUwOERL?=
 =?utf-8?B?ZExmTkVPcVptTEhSK2NrYm04Zk9LcFh1ZnhVaHFmNmM1b0NQNm9FWGdKM2hn?=
 =?utf-8?B?Ykp6eDBPbDhXcEtYdisvVU9YVmFnWjlqTVppaTVYUWJWZVRycUhLT0N2WFhx?=
 =?utf-8?B?d3R3WEJ6SGFiWVc0WWg3cnBjVmZqYlpqM3ZBdnhOc2Z1eEc0VnYvdS9JK21w?=
 =?utf-8?B?R1JwSHhzWFJDeEEyRDEvWGhXdG4vT09TNnZMa3BMYUlCQWJUMjhjYlZKeTJG?=
 =?utf-8?B?bFdoMGJ4Mkp5TzZkNUFnOUZUSVMwaUlDOUJGOEJIbTN3SzRKU0VVdmVUR20y?=
 =?utf-8?B?V2JxeUZiaWhMQ3pmRUVtOEFsZWE4ekpOcXFGVVBuL2t3eWpUUUtKMWRyQSt4?=
 =?utf-8?B?V2szVHU5UWgzZi9iSHNCSlhBcWFDWFVtUXpZZXJNd2Nna2orNG1OZ1ZXNnZ4?=
 =?utf-8?B?TTZUcVAxdksxbHB0SGJwZEc2dEtzRHprOERVSkJDZUxJZnNWZXVpVzdFa0Uz?=
 =?utf-8?B?L3FsUHRSRXVRbUF2MjhLMHg1akIzakRjVmtmS1hwT1E5QitNYlBIK3Vib21x?=
 =?utf-8?B?cU5UckJhelcwVmpqUlV5OFRaZ0JPaHZaUUlqY1duMjNyajZxaVZlRDlsUE0w?=
 =?utf-8?B?WTdqeEphcks5clR6bWIyQzhFcXR0UkVobG5pVGV3azFBVG1JOXJaTDFHMU5v?=
 =?utf-8?B?ZzVzRTdWZEt2TnRVdForemNhbWJZSTNWN3hORThmT0J4M2d4b1lRNnpqcG1m?=
 =?utf-8?B?L3VocE5KazJYdnEyKzB4OUNFVkN5SkNjRS9obysrMzFzdkQ2M1ZZbXdZdUJQ?=
 =?utf-8?B?NXlQNFh4cDNucmtnUVR0bnQxT25NZXczV3R0dmxRa3ExbU82QVZVelhQbWFJ?=
 =?utf-8?B?eWlIdkRTLzd6bkV1YnhmYU5MT2VvUWxZYnUzSk92TVdjWjFSNitsV0FuRjU0?=
 =?utf-8?B?WFhNZm90OW5MUUhXN1owVHJRYjRib20zRmFiaGRzWHBwUFVvZlV3MmhhNzcr?=
 =?utf-8?B?bzNTSjZsMjBkNkZkY3o5cVo2UDBhQVp2TlZmT1hNdXROUm8rOXV6YTQ1S0N4?=
 =?utf-8?B?OGQvNklhY21wWWJPRGFjbXZ3OEl2aC9mMEJmR1Z2bC9aQi9BMlFOa2d4VHph?=
 =?utf-8?B?Q1BDR3J6Y3ptWjdSclNROWN2Z01VUXFBSTU4dXdrY1dZc0ZJZ0N2VFdpSmtu?=
 =?utf-8?B?OUhjNW9PTjB1QXExamFHZFRXclc2RGluYXhtb2tYdlp2OVIwc1d2OUxxdnR2?=
 =?utf-8?B?cmY5VGhrN0xvRTd0V3g5YnJud29KNmVMNndlSnpEZTAvd3VrUy9hQ0ZzeDVP?=
 =?utf-8?B?VXNRcDR0eXY4S08walkyc3Ywb1BrUkJTMjFFc2NEaUZWNk1CajdlQlZpQ3RY?=
 =?utf-8?B?WHVrQlA0VVZRQVM1ODMyVnM1WTFmSjZEZ1ZJVVBYdEoxSDNZZ3IxTll4RW5B?=
 =?utf-8?B?RDA1b3JXMW9oMHZFeFUrY3lRUTlMcW82NFVGUitlSDN4YmRDUkVjOXF1a0VF?=
 =?utf-8?B?MEVmSjJmbEJvR0xDKzN2U2ZsRFpmWjcvYmZZb2s0cGozci9NOFVUQWw4Q2dY?=
 =?utf-8?B?a2xHVm5jeHVSSktoQ1IyNkYrZkFza2c9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5014.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NXgwVHpTbjRHSElMUFZ6TXVjcVV1aWhEbnpIemZWc2xZUXlOR3o4ak0xcC96?=
 =?utf-8?B?MGl0cHc1VisxZk1kVWx2dDlZMDloVGgxeW9mVjdUeXF6aUJLQXZGcXRUeEsx?=
 =?utf-8?B?YzlkL1gvR1JKTXFJZFg4MmtXRTFPQzhuVE5qci9zTVFGdEJZSzUzTVlEZnF0?=
 =?utf-8?B?K2oxdG1QRkcwK1d0WWJVNlhzQzZyWjlKVytnZWxlZWR0bVNOa3BhTlE5VS9h?=
 =?utf-8?B?eEYzRFVCZy9PZUlLT3ZXNHJkOERMUE9nQ3NQQkJ1UDJmTW9wS215c2hhR1dK?=
 =?utf-8?B?aWNWdHFpbVNzRkpxV2RuMDdBWWpzdlNBT21qWDdTRDVTeFQwQmdTVU5tVmIv?=
 =?utf-8?B?SUZFZGhOSi9WOXVKMUI5cEVMNytzQWpGQUM1d2JxaUhqN2dLVzFFdC9aUVFi?=
 =?utf-8?B?dVNNejJzMTdZTi9sUzBRdzdLVGJQdS9RRjdzWVJzcEc4MytQdklTUUdwKzVM?=
 =?utf-8?B?ZU5yMHA1Z014enduY3ZkaHNLcWZERnc3RWN0a3pZZjV0bSswQzdxNkl6RnpQ?=
 =?utf-8?B?SDkzWVd6eHBDU1ltS1VYK1AvcmtReWl4NzNLbENWa2xWZTV5eVhRTHp1SmJZ?=
 =?utf-8?B?SGg3cmdpWVRoUEhPT0VQVVRQMVlRbnBvREdQb1lMR0pmNWJZNUJsYlJtWkZ4?=
 =?utf-8?B?czZjY0NrcXdFdi91TlRmVWF5WFhjWE9HN1h6ZXU5YXJVTkpjSDd5bHFwSlBq?=
 =?utf-8?B?ckVMV29PMGlQUFJJV2hFZGZHZ1FQRWJYUGRSMjZtaktUK1dJc2I0cFJucHdr?=
 =?utf-8?B?OG1WVEJIeldadkplaDduMGc4YWVUYUhZenUzMFc5TjJKZTVnRnJsUFNiWjA0?=
 =?utf-8?B?NWdrT2Z4Y0dDRVk0TXg0Q1BjVXBsWFg2TGFUVUlZUkw3cjQ4WDhzaitGWlhx?=
 =?utf-8?B?M09UcWo4Ly9WUmJJSTNpNUxMOWZ0MnhGdzNINGUxRWNXUlhWbnplcCs5bWVS?=
 =?utf-8?B?Z01USlBPY3c3R08xbVI4eEhVbk5QQ2lxNEFuZWlRSFVnQzREbnRtUEhZRExu?=
 =?utf-8?B?NnA1WmpsQmt6d0hhOW5PSzlsQlNPM2lzTVNpRFRWemtXNWJvRkM2UWZkTXdV?=
 =?utf-8?B?eVMwL01CR2V2aVorVytlZEkybFpnVDV1M3RETkJrMGR6OWthS1ZHTGY4NUdo?=
 =?utf-8?B?d0ZlbWZDT2tPd0M2QUpRbXNGdWpEMkV3UTByei80c2NZeEVpQ0twejVpK1hG?=
 =?utf-8?B?UGpNdXVucjNRM3g0Q2ZHQkIzK2o0dG9DUzBOanBRSXlvNDJQS1ROeG9zaDBK?=
 =?utf-8?B?WTJ3eEtzL2FENEZha0FYNXlJYThCYnd2S3VjVktUK0RieVFyQ0RHczdHLzRa?=
 =?utf-8?B?ZXVqZldrbjVrbGR6QXNQUjR5aVpaODhtdVVNLzk2Z0h0blQ5SEdkUGI3bnNo?=
 =?utf-8?B?amtCajlrZk56ekpQM3VlU01OaXIzWGEwbjBSbjNrbVBtSWMvVUY1VlUybS9K?=
 =?utf-8?B?K0VXVjBxd0lhakkyQ0N1aVhoT0p6cDJwMVFLNm9xeHJueUVFZFgvUmp5Q2pW?=
 =?utf-8?B?OGtNenFmcmtTYVVRYi9zTnk4V0ZjMzAxU295enRrbWIxN3NiRlRQOFpKL1lt?=
 =?utf-8?B?bVFQalM3SXJ6d2s2T0FUWXV2aHBZVnkrNyt5WHB1Q1YyTHlzYVNrak5mV1dK?=
 =?utf-8?B?enpqTXVBREFNQk9QTlo1SW9YQUhEamF3b0FoN0FQVmhERzMwaDRYZExIcHJM?=
 =?utf-8?B?Z25DN2hneUR2Zm9qV09ZZGFDNHN1QmVHUXlSZkdsQnc4RHRrSktUOWJrWGdw?=
 =?utf-8?B?ZTBXSjZlekpYTENJbG1jTjF5cFllL0Z5YzNRNEhwTndHMU5iVU5yOHFaTnFV?=
 =?utf-8?B?NDMxMFBMa3pmVk14YXd3cmJ5NVNDdjhSOFUxTWZsWGN6N2R2TVFEOE82S1B6?=
 =?utf-8?B?NWZHdUJpbi9kN3haaDZuQzJCVEN5NXpEQXdpMXRMM1JDU2hXcUpldXVvZUtD?=
 =?utf-8?B?NGZQWFJIY2JuWXA0YUJwcStjNzl0ckJrUEJXSDQxSkFDUHN3RDhaRGgwcFVU?=
 =?utf-8?B?Y1Q0OTMxWEFSaGYyUGhJSkZsNHNyVVBCOTlPTjRRclIrWFVZbHRka3pCMmtC?=
 =?utf-8?B?MjIwK0ZwV2hGdWFsMC9EWXJ0K2lOaWZEeDhZeUdUK3FCYzRKUDJqY2xPM1dr?=
 =?utf-8?Q?3n/MmWDPCftOrS+gHqGxu7mhr?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b4692d-ff79-4e4e-b2ca-08dce8f5ac1c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 06:35:16.8541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NIrLigxW8wJFIwZ6K2Of3yOEPlS26CTFT+Y+pAk/rO7MuEuJjIp2eF5FGA8O5f4/yXGT3LozvjHQk9qv1i39gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8008
X-Authority-Analysis: v=2.4 cv=XPtiShhE c=1 sm=1 tr=0 ts=670775a9 cx=c_pps a=OemXRkCljtmPz/OzEC+nkg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=iGHA9ds3AAAA:8 a=pGLkceISAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=irdLlQJWP1kuHba5kOEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: c9TNSG8qdlXSZaEncTjDZKFEETQSE_65
X-Proofpoint-GUID: wi64pAGpDjHnqaXV2a0vpYENH0g8BZ0I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-10_03,2024-10-09_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410100042
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 49A4pxon008596
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 06:35:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112757

Will sent v2.

Thanks,

On 10/10/24 06:42, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>=20
> also fails to build with clang
>=20
> https://errors.yoctoproject.org/Errors/Details/807571/
>=20
> On Wed, Oct 9, 2024 at 10:53=E2=80=AFAM Khem Raj <raj.khem@gmail.com> w=
rote:
>>
>> Thanks for adding the tests, this is really helpful in many ways to
>> keep quality of recipe. I would also suggest to add it
>> to per package ptest image mechanism in
>> meta-oe/conf/include/ptest-packagelists-meta-oe.inc, if it is quick
>> then put it
>> in PTESTS_FAST_META_OE else put it in PTESTS_SLOW_META_OE
>>
>> After doing this you can run the ptest for just this recipe by doing
>>
>> bitbake meta-oe-image-ptest-asio
>>
>> On Wed, Oct 9, 2024 at 2:25=E2=80=AFAM Yu, Mingli via lists.openembedd=
ed.org
>> <mingli.yu=3Deng.windriver.com@lists.openembedded.org> wrote:
>>>
>>> From: Mingli Yu <mingli.yu@windriver.com>
>>>
>>>   # ./run-ptest
>>> PASS: address
>>> PASS: address_v4
>>> PASS: address_v4_iterator
>>> PASS: address_v4_range
>>> PASS: address_v6
>>> PASS: address_v6_iterator
>>> PASS: address_v6_range
>>> PASS: any_completion_executor
>>> PASS: any_completion_handler
>>> PASS: any_executor
>>> PASS: any_io_executor
>>> PASS: append
>>> PASS: as_tuple
>>> PASS: associated_allocator
>>> PASS: associated_cancellation_slot
>>> PASS: associated_executor
>>> PASS: associated_immediate_executor
>>> PASS: associator
>>> PASS: async_result
>>> [snip]
>>>
>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>> ---
>>>   meta-oe/recipes-support/asio/asio/run-ptest | 19 ++++++++++++++++++=
+
>>>   meta-oe/recipes-support/asio/asio_1.30.2.bb | 18 ++++++++++++++++--
>>>   2 files changed, 35 insertions(+), 2 deletions(-)
>>>   create mode 100644 meta-oe/recipes-support/asio/asio/run-ptest
>>>
>>> diff --git a/meta-oe/recipes-support/asio/asio/run-ptest b/meta-oe/re=
cipes-support/asio/asio/run-ptest
>>> new file mode 100644
>>> index 000000000..d37db0b31
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-support/asio/asio/run-ptest
>>> @@ -0,0 +1,19 @@
>>> +#!/bin/sh
>>> +
>>> +ptestdir=3D$(dirname "$(readlink -f "$0")")
>>> +cd "$ptestdir"/tests || exit
>>> +
>>> +tests=3D$(find * -type f -executable)
>>> +
>>> +rm -rf test.log
>>> +
>>> +for f in $tests
>>> +do
>>> +    if test -x ./"$f"; then
>>> +        if ./"$f" > test.log 2>&1; then
>>> +            echo "PASS: $f"
>>> +        else
>>> +            echo "FAIL: $f"
>>> +        fi
>>> +    fi
>>> +done
>>> diff --git a/meta-oe/recipes-support/asio/asio_1.30.2.bb b/meta-oe/re=
cipes-support/asio/asio_1.30.2.bb
>>> index 6930381ec..ae0baadc6 100644
>>> --- a/meta-oe/recipes-support/asio/asio_1.30.2.bb
>>> +++ b/meta-oe/recipes-support/asio/asio_1.30.2.bb
>>> @@ -8,9 +8,11 @@ LICENSE =3D "BSL-1.0"
>>>
>>>   DEPENDS =3D "openssl"
>>>
>>> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
>>> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2 \
>>> +           file://run-ptest \
>>> +"
>>>
>>> -inherit autotools
>>> +inherit autotools ptest
>>>
>>>   ALLOW_EMPTY:${PN} =3D "1"
>>>
>>> @@ -22,4 +24,16 @@ PACKAGECONFIG ??=3D "boost"
>>>
>>>   PACKAGECONFIG[boost] =3D "--with-boost=3D${STAGING_LIBDIR},--withou=
t-boost,boost"
>>>
>>> +TESTDIR =3D "src/tests"
>>> +do_compile_ptest() {
>>> +    echo 'buildtest-TESTS: $(check_PROGRAMS)' >> ${TESTDIR}/Makefile
>>> +    oe_runmake -C ${TESTDIR} buildtest-TESTS
>>> +}
>>> +
>>> +do_install_ptest() {
>>> +    install -d ${D}${PTEST_PATH}/tests
>>> +    # copy executables
>>> +    find ${B}/${TESTDIR}/unit -type f -executable -exec cp {} ${D}${=
PTEST_PATH}/tests/ \;
>>> +}
>>> +
>>>   BBCLASSEXTEND =3D "native nativesdk"
>>> --
>>> 2.34.1
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#112724): https://lists.openembedded.org/g/openemb=
edded-devel/message/112724
>>> Mute This Topic: https://lists.openembedded.org/mt/108905838/1997914
>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [raj.khem@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>

