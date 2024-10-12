Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33DDFD1A451
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 08:15:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6816.1728720933285237680
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Oct 2024 01:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0015263500=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49C8022X028997
	for <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 08:15:32 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 427eb1g885-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 08:15:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cRBW+ssI065KH1nWGpSCkP6LJJYhbUR2GvmODv5qGQgdBEmg8RKIccsCZJt4Gl+SGhyinVAiFpnE9KtFAeXkBYtHB5bJBgqRiAae0MEqfBdDtRYxdW3GK2Lhs2DNlqUXTWGXx1+DqwicGmiqIf2mfeJhjOnyMJ7WwxMlrfBu+5X4pnrSMZqQW+MPZBb0t6fvgc8AA6euPct/CBs9tYHLkENPl3Sin3uUhysSCLc+Grl1GrKFK2bakxvbFoRD3F3akAo0k87zBcAP0qpB89g7wRxg59P6n1BZAOLBz+zHXRpekCBuecXEIrhRGwwy+ObbNMiTvZ46I2m//Avake+oiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4gRBI2bJcr+TGgjdWdmzqSSEATgHmkN15iooCYMeZbc=;
 b=vVQFE3fyat3mE37I1VCgvQgOKiZKfxYUMFHik/FAKiRRZYpvSCZgPOogpbvyv4YjRd1Uv7zsWN6E4VaoQZqNmeQqfmmqcV6XcyDiDqMfyE0rnGBDDFLTfnc51XORZ4Qy2F4blW//+qBC7TqKZ1FSU8rIQf4KjjpZTSyL6GThUD92DTrvbgoEVTc4KTPVdz2ACrxLQa1T18wN/9E1pEIVvUQs9qTjiSq0mvNni8waoM5ZYtBFp2YTlUx+k4L4DbLjy9y3UlWMVuP2FVCaRKXr1jmfygK1XRRf5XAh7TYBEcR/VZxjPFVH3Lm0cAV2v+IqFpjcbEeWyAUPLL70moli+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by LV2PR11MB6022.namprd11.prod.outlook.com (2603:10b6:408:17c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Sat, 12 Oct
 2024 08:15:28 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976%6]) with mapi id 15.20.8048.020; Sat, 12 Oct 2024
 08:15:27 +0000
Message-ID: <ebe5b7e8-75e5-4a7d-84eb-49af0b5db37c@windriver.com>
Date: Sat, 12 Oct 2024 16:15:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 1/2] libtoml11: Add new recipe
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>,
        openembedded-devel@lists.openembedded.org
References: <17FDA5588C5B4673.4702@lists.openembedded.org>
Content-Language: en-US
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <17FDA5588C5B4673.4702@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0182.apcprd06.prod.outlook.com (2603:1096:4:1::14)
 To CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|LV2PR11MB6022:EE_
X-MS-Office365-Filtering-Correlation-Id: 27977ae5-cc11-4008-ea99-08dcea96073b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MDZyNFIrQzQ2djdXcHpJRVNBZFMzZ2EzM2YwVUp3WDdaWWpDaVJhSmwybW9R?=
 =?utf-8?B?azFzekxKYVZPOVl6dDVrUElJdVZuQkxCUFZ2c0V2dE96OFBpSTAydm1POVFW?=
 =?utf-8?B?bkVsMkJpQU94VXNVTjJRdVBZcDNERVBURGtoZy9mQmpDRDZtM2xrTlNNcXll?=
 =?utf-8?B?N1NTclMrK1g0K1U3elh2eU82SHpNak5CdjBjT1prenhHdlIvN01nVktKaGxK?=
 =?utf-8?B?aDQxL1NINXhHZlVaNDZheVpMRnplZW0xVG5TczdCNTVCaENOd0dLdXBIT0Fr?=
 =?utf-8?B?RDJVUUF2b3hpWTZXWklZaUFDTkJOY21rbDhFZ1ljV29Fait2cUZTQXRjeTVa?=
 =?utf-8?B?eWtkazFwUlJXeE4wSm5VQWd4Q3psS0NieGdoWWprVzIzU2JNeEU2a0tzTXp6?=
 =?utf-8?B?YnlyVW5rTUtVSkQwQ001TzY2WG9MU1BrSlE2bEI3dUhUL1pFaHhxdUtQSmph?=
 =?utf-8?B?aGs1WUZsQzRRUjhZTE9CVnNRSyttMXNuL2tKemlabHpLUVJ3akpBV2NncWR5?=
 =?utf-8?B?MlQ4L1RpOE1LQytmalFhU0lvZzJIbCtiNUVuNEhWc0IwRmNSeGRjU1MyczVH?=
 =?utf-8?B?T1hQL09PbGVLSlJVeXJIUVg2c2dLbkhJa09jRUJyM0xaaVJJMnM1QWp4QS9r?=
 =?utf-8?B?TGVSU3NTZUNUQTdiSDBIRlBnZFdKakRMbHRpK2NBVVF5WFZOQ1Uxdkxaam81?=
 =?utf-8?B?Um9udVFNZEgzc212NXArd3pVUWlOQ0lGTWJ3WnV6VWNodlg2RWQrMjZFNHdm?=
 =?utf-8?B?UC96NXRON2tvZHMyOTJhVEpZdUdwTEUzdk1HbmdJL1k4U0p1SXhpcTVEWkJI?=
 =?utf-8?B?SDduVkJOcC9XaDZZYVRTcWVCS1lsM2RPT2YrbzlpWkNxSUI0L0c1aFplY2Jy?=
 =?utf-8?B?V1NjdXpaMkwzMGFjUjZCOXlONjhiQitSOXhaYWhrMkp2OVNGMmkxT1h3ZU9r?=
 =?utf-8?B?aVo1emEzRUMrV0hBUmMvWG5mTGVJbGt2eHo4MlYzNHhMNUlGS1B3THFjcWR1?=
 =?utf-8?B?NEhFTHVUYjhKZVV6dEorVW1VUExRa2lGUm9xOTV5SDd6ZU04cHo3NHNtWjhw?=
 =?utf-8?B?bURSdmc5K3NTdzN5QmxUQ01TL1JqNS9NdGZodnZUNmFWbFY3NE1jelYyTTMr?=
 =?utf-8?B?SXpjL056a3B2bkxZQjFWUG5LdzVDRFBkQ3VncUlOKzVBRzh6TFlVaDBCVWtL?=
 =?utf-8?B?NEdBR1JOeEpwZW9LYStQN2h3c3Y3aHpqaEwySjJiODI2UG5lekFGM0RWdGdv?=
 =?utf-8?B?eVJtQkxhNGRKUS9QcGZEVHRxNmFyQ1pLNDhjTTRwQXNtTnBPSitkVkM4b0JM?=
 =?utf-8?B?VTdZaDdpQ0pzcWliVmJIU1B0RWpRb1ZHd29Xd3plSDdHYmxvM1ZZdElrOEVY?=
 =?utf-8?B?aXE0TXdoUCttTUQ1bVFnbkNTaXErSEVOb3JVY3Q3bm9wU1IySlpHT0NSYkdm?=
 =?utf-8?B?NEZUWXkwZ0JyKzJFOU5IU2NBSkpuSENtVExDYUpPTjNodlBVU1Q3d0NxTnFZ?=
 =?utf-8?B?a0RxZTB4OTZ2NEEzTjhHVnJVRkZ6NG9acU9iMFZraXpVY3J3SkRkSFE5UzN4?=
 =?utf-8?B?YmJoejBZVFJBWGpDdjkySGRZQ0R5bW10T1pXNDBVWWppZmp5Y3htKzRqMWdK?=
 =?utf-8?Q?RiyC1E2LB9wpQofDACtA6i7cy2dhRHINr7+TFL6SwxlY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S1BNUnJPSTZhWDRRUDcrb3J5OGx4MTVLWHB4OVBpNXl0b0NLbUg4TUV1cXFC?=
 =?utf-8?B?UllTWDNQaUUxT2tiSXNMcFBHNVZySEFPaWdKWnM0M1AvUUdQUnFveFRWcWVv?=
 =?utf-8?B?N0lUQWdLZ1NCd255dnMwd0daaDMvUlJPVWxlYVdmOEJ4RSt6b3VMdjNuWlFX?=
 =?utf-8?B?ZmYzUitKeVBWR0tPL3QrQURPM3ZlMjNzZ3l3cFBmSTFuNjJlTkNZbnNqdndV?=
 =?utf-8?B?ZmNIZjZpbWxFY1hUd2Z0Q21DLzlpMFpzd0c2RVhpQlVtakhPbzNDcC8rN1NF?=
 =?utf-8?B?cU5VTGhEM0NCVGUzOWRoVE1na3ZUd2UyWjhSeW1hLzVKR0FOeW9SaStJdFBW?=
 =?utf-8?B?bUl5UXRTaVZkU1RqRTM3NU5lTG44VWNpeW5vUlQ4S1huSXIvRGtjK1JaZFhh?=
 =?utf-8?B?bmhnUmppQ1ZNL0NsSC9sNTllekFDdE1jKzRmaitHdjZyVE5Bc1k3K0J4MUR0?=
 =?utf-8?B?UE92ZDFjL2tKcE5NN3BBZ1VHMnIvWU1NVjc3b3A0MExmV2FiSk85ay9IN1hX?=
 =?utf-8?B?YTFIOFJiZzdBMk5CYWQ2NG82aUEzcGJxaVhqMDhkUFJOWkNaQ2xTUEs3dyt3?=
 =?utf-8?B?Z1BvYlhLeElTS0dXM3ZxV1A3R0Y5Ynk3MTY4ZjNOL1lWOGI2VElTQ21GRWV3?=
 =?utf-8?B?ejh4RFVVZXZocUNwaC8zajdqK3pHVGRwLzlybUFvenA3QVZrSnJKWjlQenpQ?=
 =?utf-8?B?NG80dDlFaWhldnJnWVFGaVBBRGwxSmtjTWRyZEpVcVBaQzlsbDJwbk05Lytl?=
 =?utf-8?B?WEtjS2FjejVQSE1FRW1rS3ZsRmdZTUdrN0M4K2REdkxlRWN2U2YyOTJTeCto?=
 =?utf-8?B?Y2dUakwrTUJWOC9tRmhSSmRrNzRKUlR1a0R0MnB0SEJCaWZHbnVPTkxyWEZu?=
 =?utf-8?B?MzdHeVhtUDdNSEk1akN2cGQ4OG94dGUrQmxBSUtsWW1BUEFQQ2FjOE91Zjdo?=
 =?utf-8?B?MUVSZ2grK3ZsSndKeHZQTDQzZERQOFpkc1RITWM0aHJ0MEc4OEZOZnBpMHo3?=
 =?utf-8?B?NzIzM2hnV2FvSEk5UENvaXFrL082WGdPdkFERCtRN0d4VzdjT2JwY0x1emF4?=
 =?utf-8?B?TWk3Ykd6NEw4VFNYQVFvNHpIMmdpZ1pCMmxSOWNraHlHT0VZOTh0STJjVVM1?=
 =?utf-8?B?bitlcC9ycnpDZjZRS2dBUFRFRGl1bndkTEYzcW54NDJIelIwSkc1dnpFYVFV?=
 =?utf-8?B?OGlBR21ka25NL2FSTjBjVzRuYkhJNjZzSEhSNzJVazJxK1pJTS9VcVptMFo4?=
 =?utf-8?B?Vm5QbFBZelhVSHVOcGR6RDFVeTg1cUZTdVRIVEtpVDZKZnpLaFNMMkpiT0Jk?=
 =?utf-8?B?TzQ5cVYwM0M4OTR2U2d5K2MzeUdXWmZueGlIcURBTC9PdFpRTmtTTGE4eHlw?=
 =?utf-8?B?NC9qSU1zVUtPazVjWk9Td3NuS0FGTlNNck5qMUdXcHNQWEpFYXJrNVdOdjkv?=
 =?utf-8?B?bEJDSWJ3NkMvdVpzYU04elJReUVtTGNsRmZ1OU1PYVVVTTJoSmVHVWdMc3g1?=
 =?utf-8?B?Rk9xT3YzVU94L1JnZWxwMnhxQmFqNXQ0dGo4TFNwbkJuNEZNSDljOGlWVGQv?=
 =?utf-8?B?Y0Q3S2hLSUl0TVp6WVhjeWFSWXVQazJuN203dEpJbWp2WExlRmJETDFObEJ4?=
 =?utf-8?B?WVFmSVhwK2ZzV3RlTnp3TnNScm9JUTUzMThDMHVsQXBKSnFsMTRHYzBnZkdW?=
 =?utf-8?B?aXVJRUpVdk5NcGpGM3ZGRTFPSGI5Z01hcm93NU42eGtMNUI1SVRJd3kyMUpG?=
 =?utf-8?B?Qm1KOU5LaWhIVDRPbWNpNVJXK1hXbkd4ME1BY2pnakR5Zjh1WVM5OGJaRDBt?=
 =?utf-8?B?SGpsak9hNmwwYnl2TjZmWWhPMHp2WDc3amdwWGc0UHRvbllTWGJVQnNUaVRU?=
 =?utf-8?B?QmNDRmw2UzNFYzR6VW5NZnlJYmRlVWpqT2o5US9lQ1JGMURHVXNaWkorWlhs?=
 =?utf-8?B?amNFUHlNTzc4K3AvM1R6bUxOcWEzQUZwcWhYNE1lS0xhOE0reVN6Rmsra2M5?=
 =?utf-8?B?RWMxVVAveFBhNVRTckZ6QmNadXRiSzlKa0FMTktNWUZrb2pZRWxDelVBU0t1?=
 =?utf-8?B?Z1Z6OHFYK0xEWCtCZ2VVTHYvY1ZMZVZYaDlJZEYvbTZSaW1TY2k0YUcvYk4w?=
 =?utf-8?Q?66l53xdMN4tliut0OKqZ7G3Vd?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27977ae5-cc11-4008-ea99-08dcea96073b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 08:15:27.0320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V2Zdqv/w+K1QCofPSavKhAqDT+0oeuZWZV5jbK0zinj4xR76EPYYf+HBEeNYIwU8nG8agA43xh3Xm4u6rdTn/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6022
X-Proofpoint-GUID: aGju8MlxW_6dxKwWQ7EmBC1sOdl3prCB
X-Authority-Analysis: v=2.4 cv=ce6ArWDM c=1 sm=1 tr=0 ts=670a3024 cx=c_pps a=clyc6YhGvfCRRXf4btgSWw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=20KFwNOVAAAA:8 a=Q4-j1AaZAAAA:8 a=xvJxTmjR2GhmGHUt-WMA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: aGju8MlxW_6dxKwWQ7EmBC1sOdl3prCB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-12_04,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410120057
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 08:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112824

Miss SOB, v2 is sent.

Thanks,

On 10/12/24 15:53, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> toml11 is a feature-rich TOML language library for C++11/14/17/20 [1].
> 
>   # ./run-ptest
> PASS: test_comments
> PASS: test_datetime
> PASS: test_error_message
> PASS: test_find
> PASS: test_find_or
> PASS: test_format_floating
> PASS: test_format_integer
> PASS: test_format_table
> PASS: test_get
> PASS: test_get_or
> PASS: test_literal
> PASS: test_location
> PASS: test_parse_array
> PASS: test_parse_boolean
> PASS: test_parse_datetime
> [snip]
> 
> [1] https://github.com/ToruNiina/toml11
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   ...issing-zero-initialization-to-region.patch | 34 ++++++++++++++++
>   .../libtoml11/files/run-ptest                 | 12 ++++++
>   .../libtoml11/libtoml11_4.2.0.bb              | 39 +++++++++++++++++++
>   3 files changed, 85 insertions(+)
>   create mode 100644 meta-oe/recipes-devtools/libtoml11/files/0001-fix-add-missing-zero-initialization-to-region.patch
>   create mode 100755 meta-oe/recipes-devtools/libtoml11/files/run-ptest
>   create mode 100644 meta-oe/recipes-devtools/libtoml11/libtoml11_4.2.0.bb
> 
> diff --git a/meta-oe/recipes-devtools/libtoml11/files/0001-fix-add-missing-zero-initialization-to-region.patch b/meta-oe/recipes-devtools/libtoml11/files/0001-fix-add-missing-zero-initialization-to-region.patch
> new file mode 100644
> index 000000000..b779d493a
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/libtoml11/files/0001-fix-add-missing-zero-initialization-to-region.patch
> @@ -0,0 +1,34 @@
> +From 9c7cef94a551cfdbbe2cce262c29221e22643d84 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Ale=C5=A1=20Mat=C4=9Bj?= <amatej@redhat.com>
> +Date: Mon, 19 Aug 2024 06:35:03 +0200
> +Subject: [PATCH] fix: add missing zero initialization to region
> +
> +Fixes below error:
> +
> +/build/tmp-glibc/work/core2-64-wrs-linux/libtoml11/1_4.2.0-r0/git/include/toml11/fwd/../fwd/../fwd/region_fwd.hpp:49:5: error: '<unnamed>.toml::detail::region::first_' is used uninitialized [-Werror=uninitialized]
> +   49 |     region(region&&)      = default;
> +      |     ^~~~~~
> +
> +Upstream-Status: Backport [https://github.com/ToruNiina/toml11/commit/9c7cef94a551cfdbbe2cce262c29221e22643d84]
> +
> +---
> + include/toml11/fwd/region_fwd.hpp | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/include/toml11/fwd/region_fwd.hpp b/include/toml11/fwd/region_fwd.hpp
> +index b40317d..26f1a9b 100644
> +--- a/include/toml11/fwd/region_fwd.hpp
> ++++ b/include/toml11/fwd/region_fwd.hpp
> +@@ -34,7 +34,8 @@ class region
> +     // a value that is constructed manually does not have input stream info
> +     region()
> +         : source_(nullptr), source_name_(""), length_(0),
> +-          first_line_(0), first_column_(0), last_line_(0), last_column_(0)
> ++          first_(0), first_line_(0), first_column_(0), last_(0), last_line_(0),
> ++          last_column_(0)
> +     {}
> +
> +     // a value defined in [first, last).
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-devtools/libtoml11/files/run-ptest b/meta-oe/recipes-devtools/libtoml11/files/run-ptest
> new file mode 100755
> index 000000000..9bc480aa7
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/libtoml11/files/run-ptest
> @@ -0,0 +1,12 @@
> +#!/bin/sh
> +
> +cd tests
> +for atest in test_* ; do
> +    rm -rf tests.log
> +    ./${atest} > tests.log 2>&1
> +    if [ $? = 0 ] ; then
> +        echo "PASS: ${atest}"
> +    else
> +        echo "FAIL: ${atest}"
> +    fi
> +done
> diff --git a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.2.0.bb b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.2.0.bb
> new file mode 100644
> index 000000000..758e258a5
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.2.0.bb
> @@ -0,0 +1,39 @@
> +SUMMARY = "TOML for Modern C++"
> +DESCRIPTION = "toml11 is a feature-rich TOML language library for \
> +               C++11/14/17/20."
> +
> +HOMEPAGE = "https://github.com/ToruNiina/toml11"
> +
> +SECTION = "libs"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=44d1fcf70c7aa6991533c38daf7befa3"
> +
> +PE = "1"
> +
> +SRCREV = "cc0bee4fd46ea1f5db147d63ea545208cc9e8405"
> +SRCREV_json = "9cca280a4d0ccf0c08f47a99aa71d1b0e52f8d03"
> +SRCREV_doctest = "ae7a13539fb71f270b87eb2e874fbac80bc8dda2"
> +
> +SRC_URI = "git://github.com/ToruNiina/toml11;branch=main;protocol=https \
> +           git://github.com/nlohmann/json;destsuffix=git/tests/extlib/json;name=json;branch=develop;protocol=https \
> +           git://github.com/doctest/doctest;destsuffix=git/tests/extlib/doctest;name=doctest;branch=master;protocol=https \
> +           file://0001-fix-add-missing-zero-initialization-to-region.patch \
> +           file://run-ptest \
> +"
> +SRCREV_FORMAT = "json_doctest"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake ptest
> +
> +EXTRA_OECMAKE += "-DTOML11_PRECOMPILE=ON \
> +                  -DTOML11_BUILD_TESTS=${@bb.utils.contains("DISTRO_FEATURES", "ptest", "ON", "OFF", d)} \
> +"
> +
> +ALLOW_EMPTY:${PN} = "1"
> +
> +do_install_ptest () {
> +    install -d ${D}${PTEST_PATH}/tests
> +    cp -r ${B}/tests/test_* ${D}${PTEST_PATH}/tests
> +}
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112822): https://lists.openembedded.org/g/openembedded-devel/message/112822
> Mute This Topic: https://lists.openembedded.org/mt/108963713/3618448
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [mingli.yu@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

