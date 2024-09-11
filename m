Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC832EE49A6
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 13:14:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.21407.1726060469242473898
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Sep 2024 06:14:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=998409ca54=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B8V5Q2016524
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 13:14:28 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gc214m50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 13:14:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBK/XgZSDMYYVxnEPJ6212/iuFhIkoQ7LMnnDHOM6hx+Gia3D/RUf+Khj+BsNVCGzu7oFioA66W71/6kawjj22lgcGUKAKNhk/NwBpETG9d/eXombR3bszoEqY0dwcAsNBy5GOOnRofFEH/2l6yzxchCSzg+0iNxH6Yc85jhCvU1gn03JD7YeIoDp+keoWuoudWHS1uwUa3RdN7z2cb3lJtH+Kkn5MWmtiqNrFTGKgOfRLKx2rnHbSUi1LH1sKuyW81ELeL2720Ss+krUSb85Oj6ueKoN9XCTT/lsNTw3SrLtK2Rs12MtK+sV/U2JGLpqVRbGTPOysXT9kH110tyqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QBa6/mrazohxxzHNHTCQxmINmC/GMBUrmcNhuzawnV0=;
 b=hJ7L2Mtxyu2+z5HzMo7nA56g5J0rK556m11ZVQlIWfr/HoR6YchKnxDd98FIVfplKq/ooYW6L3RPvCjy0B67UlwpffCdLk/SNiCyPgnv0xgi76pkYBCvqv/WrFJ+71bMIfcgwtVBA9sdrkQMfO0yYSydsRAA9JAW/9FhX1UP+2xM8PFV+tNSxztFhs7x0Dgt2ifd56cPk5FPrrGMvu86yeV7CQXBrFMdeBimLuWxVmg5agnev0ioM2cugCXegFBeZJKQYbKes0JgQ4ljbHuWMPssylnnbeeieKQi5JYPunbe6FbDK4QsuERjvRsuzekXMpeqBVXzugYPgnX75mWwrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Wed, 11 Sep
 2024 13:14:26 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%4]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 13:14:25 +0000
Message-ID: <dd7294ec-c2be-4883-834b-927e273e6c27@windriver.com>
Date: Wed, 11 Sep 2024 21:14:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH v2 0/1] classes: Print bitbake branch and revision
To: openembedded-devel@lists.openembedded.org
References: <cover.1726059965.git.liezhi.yang@windriver.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <cover.1726059965.git.liezhi.yang@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYAPR01CA0019.jpnprd01.prod.outlook.com (2603:1096:404::31)
 To LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|BL1PR11MB5978:EE_
X-MS-Office365-Filtering-Correlation-Id: c7009276-6431-4f4b-99fb-08dcd263a899
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RzB5QUlVUHFObVdGRVlHeWtORVpwM0VZNHlQQi91ODNwWW9jaHVFeGc3Uno3?=
 =?utf-8?B?OEhqQU1ERVFqamlSeEtvYTB5K1dGT2gxOWZVL1hjY0t2NnFjTUxTY2pDRkJJ?=
 =?utf-8?B?WTAzaU1FbjNza0x6VVZwcjAvN0plNjljK2VRa09abWMwMVUyc1RVSTdncWw1?=
 =?utf-8?B?OHBFQ04wUCtpUjZ2YVhHUm5IWDgrTnpVUTNJTU8xcWVScDlVNHhpSlBFTDdW?=
 =?utf-8?B?Qk9TQmVtckg2OXhqTjlKVlkrU1BJNWZ0YUQ1UnhCdHp5N2wxdDU1dWhUcHBJ?=
 =?utf-8?B?SCtrV1VuQWlUOVRaVWxLMmt3TFdQMFBsbGh0SzY3WGNtN0hCYlNKSnJMS0Qy?=
 =?utf-8?B?cWllM0NsTUQrWWVSNzhDSUw0WEovZzd2SmVqZGdpZFNXN3JnUFBzbHFtTk5Z?=
 =?utf-8?B?WFpVTVkrVEx2bFRGZU10SlV0TFA0Nkc3U3Q2Skdoc3VkVnRoZ1dneGx4czN4?=
 =?utf-8?B?ZTVBSHFLbGdVcTFmSHFSU012MnR2ZWMwVlBMVXBDTk83MjFvTVZUOGtnekRl?=
 =?utf-8?B?djBNZUM2aDIvM0NtMGJNQ1puQXh2ZEVyWCtDRUx3MHR1anVNMjV4dHRJcktr?=
 =?utf-8?B?Ri92TWUrTkR2TDlvd1podWN2ZVhPc2FRcnpUdHpScXlrOUVsd1RvcXNETGNt?=
 =?utf-8?B?N21KZXNxekdhVnBhdVdpckhzNzExQ1hBSXRHSGNSU1hnYVhHWitZdXF6NWI1?=
 =?utf-8?B?d1l2MGFXMTU3dUhTTjBKT0dVOWd1RnQ3eUFReWtQeFVERTF4TlR6K2xENnd6?=
 =?utf-8?B?MUN1Y3RBNFZwNlJ1NVZZcCtHQU1aWW83a3VmMEFJZnlXMDhZV3oxY0p0dWJS?=
 =?utf-8?B?Qll3KzhFRmVkVTZoeERzdU1vNVEwNmJmaTFzcFJZWDNOZ3BqQm10dCtOdGhK?=
 =?utf-8?B?WHVqMFBkZnJqZG1JUlVkZzVQR2xjbzRYVlc0ZmZmKzZKeUhrV3JrblhVSnFO?=
 =?utf-8?B?TUx4cjlxbmsyZkEwSElid1dpdGhEWVYzYkxDMy90ZzNLRkRoMjBIK0xlRWlI?=
 =?utf-8?B?UlVXREo5S1d0UFBGMW03RFQ0OE81ekNOY2d1emRxYnVRMFVpNmdFdldFTGNF?=
 =?utf-8?B?S0lyVkVET1BWTlZ2WWNxTFpVSUs4dWNUSTBFSVV1U0ZmTWR1emlRMVNsNTBN?=
 =?utf-8?B?WEp0Qm5YcmdlazdFSUVYWERxd0Y1WFpSUVlUbW9zVlF4T1lSVk1uV2dkL0M3?=
 =?utf-8?B?em82bVU4U1luNmJDTW1ubkNQclQ2aE5wNnc2ZEFmaDZIeEgvZmloZE1Femp6?=
 =?utf-8?B?ZHJ2UGVmSkRvTkk5WHppR0pKQmt0cENnVE9PK2NEdElhVWlXNklGVmxUaEhS?=
 =?utf-8?B?bzdMbHFSNjFiaE1GUXVpZk9VMkZrdnh0bGU4YjhDeThGemdKV2tOSUVsSjli?=
 =?utf-8?B?TU5XNEFBMzRVanVpSUc2WUNmbnNnaGJxWDJtTk1MbjlQb1JXNThnRURGVWU0?=
 =?utf-8?B?c1RHNDUrV0NsNkZqQWoxVkU1ZXhzZUJsVGRONHlrV3NpNVlNeDRyamkwSVR5?=
 =?utf-8?B?aDFGUzlBUjRkUW9RbVdyRmdRdlZIbTlzZE1OcDhKUWNXTFpTdHUvYXp4aGV3?=
 =?utf-8?B?S3NxV2dLbzJndXU0N29FN1d6UThPTm9IaVZFS2xxZnRsOWZ1cXBybUFUUUF5?=
 =?utf-8?B?eElZSXArZzlaU3BmMmdqVzBBM2grVmVVWFl1Ulg2ckw1MHFyK3BYRHJINHQ2?=
 =?utf-8?B?NTBDY09kWVg2RmVaazA4cy9WQ0RDV0Q1UlNPZE1rT2UzV1RtcXZsOENReGlE?=
 =?utf-8?Q?2dxNoh5cGTqoDQGZZw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bUNyeXgvUlFhTXFYWEg2NTFia1k5REFsTG93dklXTVVHajlxaDNMM0NnNlhn?=
 =?utf-8?B?Mm55cHhTOElhZ2pzdGZhdXA5d0FVWDd5bDhyRkU4VVFvbk9Qb3dnQjdiRkRZ?=
 =?utf-8?B?L1BaR2hQeFROZ3RwQlIxdTFwWU1vUFV6Rll4R2I5MkpHVXF0ekgzWmdUZ1dG?=
 =?utf-8?B?eHo2bkF1MFZoa0c4d0x2MEJobHo4ays4TzNFdzFpNmVnZHBZMFQxYVVKQUFp?=
 =?utf-8?B?UmExUHNQdDdBZ3pJSm1OWTZPc2h4aFFYZEZXQjZ0cE5leXFUSkVkT1c3STQ5?=
 =?utf-8?B?dDRyMGJhaDRBZDRZS09HeXA0UDVicUlJc09yY3liN1VaSnpBTlMrbVBiRTFm?=
 =?utf-8?B?Q3FQcnJTejJrM2JiYXdyNjVXQjI3N2JyNzVtRUJ1ekY1aFlQTzIxRDVUVUtv?=
 =?utf-8?B?cVlOUFRqZlBBaHA2NjZlOUs3MDRRd2JuWlFXcWg1cytpcExablhTcDkyd25h?=
 =?utf-8?B?d3VUdVRackVLRktFZFJLYUZxTjdBYmxmeDAvZm9WUzVpSEF5bll0eGRaWDVB?=
 =?utf-8?B?WjhxSW9kVHZsTGdxRHdCYmVST0pobkQ2YmdFNUY5c1E5dEtSd25BdHJMYVJs?=
 =?utf-8?B?NjZUb09pL0E1SmRqKzBMQ25VMlV3N3g3OEFqTTNDdTVmM3Jib3UrRHY2QmV4?=
 =?utf-8?B?emtKWFBvRDl2Nm9ZeTRPd1FIeVRpTWV4akRuR25WR3Q5VStnZm9jSlgzUmZE?=
 =?utf-8?B?dW5wRmszck5pUXlUOVB5d2d0b2NtU0M5QkdpcjZuL2lYdDBrQ0xVMnphUEti?=
 =?utf-8?B?Nm55cE1HOXdBWHlaa0hBVVA5SmlZdjhPaTRkd05IRE5CWEJySnZJN0ZrQVJD?=
 =?utf-8?B?UkJ5Mk9JL081NEd1em9JZmhuNVVpR3RhMDlwSFJHYWxaditCcWsxTGVjd0VS?=
 =?utf-8?B?ajZjK2hOUFRSNm1xZzA3UmNCL1NUb1hqaXhMWnlMMDRpb0lHYXBTZjJ6WWZQ?=
 =?utf-8?B?RlpsYzBuLzcrWXQ1ZjNhV3ZMejN4Vm1HcjltYTQ4VFN2bzJRY3EzMHEybFMy?=
 =?utf-8?B?b2dvdUQ1RDVyUW5lUDc5NXBzVkhBaWhSQTd1MjZuVU1EWXRRMGZhSmU0VDNM?=
 =?utf-8?B?TVorTWhXR3I0OU13WHJVOHpuUzFaRmxkVVEzS0RWSDd1L01JQlZKUWdRYmpk?=
 =?utf-8?B?N0dqTkUwblVvbVdZdXRtaGliQnB5dC9RVkwzb096ZnN5UXhxZnFTMDU2RWdV?=
 =?utf-8?B?SnR0blBPS0tCb0JSYXRZQmZxMncrakN3WjZrd05CWHpybmIrTUpuNHF2em5t?=
 =?utf-8?B?YS9qY1kydmZaU3JKeFY0ZlBoK2xNblF4cWIwd0RNanRIcmFpR2xyemQxSDRV?=
 =?utf-8?B?K0Urd3l4UkJRai9OdFBTbVVVVlZHMDhxenN4Q20rMlJJK0t5QXYzdlFENmlH?=
 =?utf-8?B?bkcwYXdBa1AxTkhyU3l4T09oUmJ4bVBNQldCM1I1NlhsSTVxbVpMNktZOHVH?=
 =?utf-8?B?WFFnczVBTEZoSGg2alplTXBOSG1RMURTVitaRkt0U1lQckw5TjBRSitqaEZs?=
 =?utf-8?B?UmVVT29VM0ZCcFh0S0ZjT0pUaHlOU0g4UnJnNHo5Q0x5dzR4ekhyZlhneXB1?=
 =?utf-8?B?a0ZhcmpkOWNDS3d5aldlNFdEaDJFTTFGYTIzYUpydkc4L0FLb3dXRisyOS96?=
 =?utf-8?B?NmtiMHQyektpY3JuQXRNOHlIQlozN0lNeHpXdlZYcHhFTTlnQXZNd1dtVWFF?=
 =?utf-8?B?NFBUZmVNbXJkV3dIampDNDBuNS9ydG92OXAxWnF1OXRzNENjSmxDZHJQR3Q5?=
 =?utf-8?B?dTQ0Y25oak9DcVlmTEhTd05HWGcxYXhiQWxaM0c1c3MyY1RmMVBnVzNOeWVY?=
 =?utf-8?B?QnErc2JVZCtYT2Mvclp0bWNZbzZua2EzaFVaaDBBU091eko0eEJxazJLOFhI?=
 =?utf-8?B?SVFGTTdodWx4aG53OGgrLzVXaGtGT0YwSE1JOG1jdGtPNGQ1Mk5XTlI2Mmw4?=
 =?utf-8?B?QVdXZlJRVG9PWWJBYjVOQ3dOYlRIbDZWUksxOGlaT0hrMCt2cmRZWDFld2p4?=
 =?utf-8?B?MEh0dFM0RXZVOTZyNnRDS3R5ZGVUNVdtRmdTbVpTc08yMmpjRGhxeFFLVFp2?=
 =?utf-8?B?L2FNSitTUjdDUjVmanJZY0NGaUJqdWJTQ3d5VEpqR0lkTVJIdE04Z1lGcTFP?=
 =?utf-8?B?NnJ2ZTByNmFsRWZTM2JEUUZCelRWTWdaQ0xtYzFlV0xOSWJJNjA2L004V3or?=
 =?utf-8?B?eXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7009276-6431-4f4b-99fb-08dcd263a899
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 13:14:25.4269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JuqZvP0tP9Yu7M32RU+vzlX+6woAJ6vogpXbORVgjYcW+91eSHL6fEeCO2rN2S156iUzcjnYxGkq7Ghiqk4yIufme1YgSPIqJEHlFdFVOoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5978
X-Proofpoint-ORIG-GUID: oA6dhkuuPvHpl98JBwKmWT3IaLAezo3Z
X-Authority-Analysis: v=2.4 cv=PvDBbBM3 c=1 sm=1 tr=0 ts=66e197b4 cx=c_pps a=gHjWyi4SN+6fNgZLRl0D7Q==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=QWVuhMiOO1qIlBb1pIEA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: oA6dhkuuPvHpl98JBwKmWT3IaLAezo3Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_12,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409110099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 13:14:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112245


Sorry, I sent this to the wrong mailing list, please ignore it.

// Robert

On 9/11/24 21:10, Robert Yang via lists.openembedded.org wrote:
> From: Robert Yang <liezhi.yang@windriver.com>
> 
> * V2:
>    - Move the code out of get_layer_revisions() as Alexander suggested
>    - Always print bitbake branch and revision to make the output consistent
>      whenever bitbake is in a separate repo or not.
> 
> * V1:
>    - Initial version
> 
> // Robert
> 
> The following changes since commit 918e2b266eba6779f19f65349f85caa880ba45e7:
> 
>    libedit: Make docs generation deterministic (2024-09-11 11:56:34 +0100)
> 
> are available in the Git repository at:
> 
>    https://github.com/robertlinux/yocto rbt/bbrev
>    https://github.com/robertlinux/yocto/tree/rbt/bbrev
> 
> Robert Yang (1):
>    classes: Print bitbake branch and revision
> 
>   meta/classes-global/base.bbclass     | 10 +++++++---
>   meta/classes/buildhistory.bbclass    |  5 +++--
>   meta/classes/image-buildinfo.bbclass | 13 +++++++++++--
>   meta/lib/oe/buildcfg.py              | 13 +++++++++++++
>   4 files changed, 34 insertions(+), 7 deletions(-)
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112243): https://lists.openembedded.org/g/openembedded-devel/message/112243
> Mute This Topic: https://lists.openembedded.org/mt/108393076/7304958
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [liezhi.yang@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

