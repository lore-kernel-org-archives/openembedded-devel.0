Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13576C02188
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 07:24:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15805.1736925884598618262
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 23:24:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3110a90dd8=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F5fnol004599
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 23:24:44 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443s1pkjj0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 23:24:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OtntbYQsKLQc1uJc7UHQjMK+LxkDj4y+wlZv4QeTXQP/T3QC01Se+oduuioAkQE5pqhmGxnkSqLGyXgYJ5DXDFCM2fbR2wdflVru8imnXL6vYLH8wo7Ly7R3t0EO/JwC1WffD23B6+0kfze5JvUkNQcopS3BPfwnEYOVD9W9dMkOX8kq7JGr1b2f7dJ+v5kLyhKANWlLj+9cBVHV/fCxoyCMMqneE/DI+fmG1NSlOXJwC5Lgpf8IFZH6DaQzlcFWzoe+Ud7PwI68X1OpNIIUSJD4MgeMoxlEYYQRELOCObb0tcRAQAmpY7ge8UF1JAPcuVg4DyDcMhg5JC96ysbMqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oM8OHWu86jTeeQ4Dk0iRGMMNDeEaU2oeJiXFPJfRKKY=;
 b=LGR3Mth2obmUQ+5JPDf++ae+GYg49aufJ3NQAo4kk1ZUwBHbIDtQsA1V+A0Wtv54+379eIJ1EnFxGkQlxesUIIYM56mYucKN7nnWF+qsJdxmzZpk1qQ3u+wHAuMGJchnNBZWOMM7xffEidN64B34XffAb5ElLGcu+0ZK/o+pFIdwuwb0csNcRKat3x6C+slFcub7d4M42tifjurUGFbCtA9vj4lgFVDS57j8yaHIPJEgGnT9ynD3zunuoSWU6wPHH1KJjdvG888ZgMXfK2od/Jf4hABXRkADViFBvfn8gAaJZtMdidLk6GDjl4g5k+Y2PkQ5HmAmq8IUAxhc7/eqdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 07:24:41 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%7]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 07:24:41 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/8] opensc: fix CVE-2024-8443
Date: Wed, 15 Jan 2025 15:24:22 +0800
Message-Id: <20250115072428.3667416-2-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250115072428.3667416-1-peng.zhang1.cn@windriver.com>
References: <20250115072428.3667416-1-peng.zhang1.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG2PR02CA0112.apcprd02.prod.outlook.com
 (2603:1096:4:92::28) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|SA3PR11MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 81a88c42-9150-446a-b052-08dd3535acee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c1FrMkVKZVlVVTYxdlgrRU9NeHVHU2F5YllNV0tFS2dVSjczTDJxU2xPZnNx?=
 =?utf-8?B?b2RVb0gxaVpUWldBbENBWiszdjJ0eXJEYnRUVlpBdTZVTEJoSTVJWit4VC9H?=
 =?utf-8?B?ZzJNbGJ4ejR2Rkh6eGFuUEhiei9PMGg0Z1RjU0dHMHRydXF1eVlManUzMjAz?=
 =?utf-8?B?QVJRWGEzWFpBemZkd1NyaWlRdmVtbzdYdXF2cGRjTjhTL1p2cW9mSzl5YnVa?=
 =?utf-8?B?c3V5dkUybGY2dktqRXIyay93bGVWcE9Ob2JrVjQwZ0kwR0FRVVlsYTUrMllj?=
 =?utf-8?B?RUxyVHVRT3FrOWNYUU5DYWo4R0NrYkRaQ3ZuSlJGd202NW1xWER2TXl6dnBF?=
 =?utf-8?B?RDljV1VKaVU3WDRJQVVIZ05FenlRVGY5eEFyVWMwU3UvbmJ1TUk2QTZUT0Rp?=
 =?utf-8?B?WUl0MUlyZzB3UjJVN2lxZ3NJUUpicWNMdlJqQ1ZRb2VrM0hRUVdab2YyampV?=
 =?utf-8?B?b1V2SEgvRXQrSUt0azlvL2kzN1BHeWIyYUZGck5IcCszKzlJb1h3dE5tdHVZ?=
 =?utf-8?B?MGVCMjVra0x0YmF2YVJ2bWlVbGx5SEp5N21XclBvOWszMmpCMlJ3YU4wTklJ?=
 =?utf-8?B?WXE1ZXhjbG1nSnp1U2FqMVlRUllLRzlmQ3RSbERKWjhMdnczaWpaZGkvTkpx?=
 =?utf-8?B?MG9nVCtBU20rNGxEYktxYXpLcUo3dGVLb1MxQnFZUWJvbnJPcVBDOGNsY0Vu?=
 =?utf-8?B?VmIyekd2QWIwS2RKcmo0NXVON1U3YUpDWFNRMU0zdk1iUk9xRUtLQ1lUQy82?=
 =?utf-8?B?RW5ucldvQ0dEWUdvek9vcDdlMFBXOWxPZFQwZEFLcG5NWjRua0xycHFib1NF?=
 =?utf-8?B?RnduTGhTNjVGMkhsejFUcU01MElEN3QrclJuU21ndE1ubHhIZ2hXTEhSN1lY?=
 =?utf-8?B?NW81bTd0UCtCWkZFSkd4SksvV3ZzYW9OUWk5Y0cyTzlLMFQ4cVVlbytlclhs?=
 =?utf-8?B?Tkh0WnM0Z2Q4dU9qcnptaHBWeDVyWGN5cTgwQ2xUNHlYVGNuWmdCU0RjUzUr?=
 =?utf-8?B?dHVyWjlGUWJRTEZzbHNDNUQ5ZndvQXdqazdldHJ0Y3dLVXVITnVBa2xiczFH?=
 =?utf-8?B?T016eXNBQmtyWXBjRi92cmdrN1pWVHI4amhvTXRHVGJ0OFNpR2lMTlgraEVY?=
 =?utf-8?B?VTlnMU94QWhRM0RUR2hWVkloamZnelhxRFJNaXh4eC9uV0JpdWFqb3N3bU10?=
 =?utf-8?B?T21ESS9reWYvQmY4ZTJKclBScE5lclZYa1pDRzN6a25aSmFYZzVoTk5ZZkpG?=
 =?utf-8?B?ZkZkYTlac0xEUG8ycFZleFdPSXM0Sml5VmZHOEVwUGlhUzN4aVRvcnkwWG54?=
 =?utf-8?B?SXJMSGtKc3RhVkpZdkF6VUl0ME55NGZIeHVvVXd5NlNydUF3NnBxL08vK3Y1?=
 =?utf-8?B?ZW5LV1J5bFlvOFhtbFZtUXkzQ243ZldxT3Nsd045akd6Ymxteko1NzMzUmRP?=
 =?utf-8?B?VWptZWN4VzF3TVZNUFlVeEpRZ2pnVXdlUmFTeERrOXRRTFMvUklNQXVHa3N6?=
 =?utf-8?B?SnVBdVFyYVgxbHlhQlczUEJ2OEFnQ1R1ajFpR29wTUllUE1CQ0E5aFVGWTFP?=
 =?utf-8?B?NVhpV2kyeDNBMk92c0NlK0FwaXJiVEVGd2dmT3BQRFdMeVc1R2tYSXlZS0hV?=
 =?utf-8?B?eVliUk5QV0hJdmVFVFdCQWJUNGdHcENBNU1MZnJtbURJeWFkemEzMGdLYjU3?=
 =?utf-8?B?Wk85WDVLeFpxcFgyRSs0b3RndU5CcktEVXJUbXNRSktPaDh2am5aQWFLc0FG?=
 =?utf-8?B?SmZDRUNDekZ0NC9Qa1F0ZTA5NmVuSzZ2a0JjYzU2ZXk1WkRLMzllb3I1MmJV?=
 =?utf-8?B?OGl3blV0amxVVkNCNHFZOXBKUnhUa2s4a09MWFJscUh6eHB4VmM0bWVKbnh4?=
 =?utf-8?B?WGl2TG9aSTJIOHZTeHlKeFJ5RHU3cER3SGh4c0c1QVRDTFE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M0lscE1vQ21mZFZ3WFhMOW8ydWxSL0czajRlWEcvNkxzSEI1TC9oS3NEMFRw?=
 =?utf-8?B?NUFQZFI5U1U4SmZaajEvcUxZZ3JWdTFGQVFSS1FiMWViSWo1bElCdnovenRH?=
 =?utf-8?B?V294RzUyU1BFU0dzN2FFcmlrZTEyQnVza3JIM0RJaUhEQW5CR0hDQ3dTSkZm?=
 =?utf-8?B?L2Z5LzZ0SGx4TFJnQTFVZlJJQy9qa2ZMVzRDRDUwTS9hRlJZb3dzUUNDUy9H?=
 =?utf-8?B?UExML1I3QnFwWHIxSUVWK0FtV0lFdXhUeXZVbWhWWFJRY1krZndBcjQ2WHJ4?=
 =?utf-8?B?eDdHbktIVXI1UVUrY3FMWng5dHFEcjhHL0JINzBqRytpNS9NZDY5TFF4MDAx?=
 =?utf-8?B?cDRSOTlVWUJxeFRuSWJOWHZmbFhra01BUEwycVVqTXcyMm1aTUpZTEtYRUxG?=
 =?utf-8?B?UGxWcVFzOGFvU0JQRVdDbEtPMUd6UEQycUw5MytncTFvTmtHSzFkY0hNQU1r?=
 =?utf-8?B?Z1ExVXFRZ3JHaWVvYkFuWDVKQTQ1QTlWM2FSaHVlVDlJWVlRc0x2WmloWWxH?=
 =?utf-8?B?TVFOWGFZeVNQU3dpVFZjc2VrU3gyczRHNCtkTmppa2Y1dnhpczAvQy8xNnFp?=
 =?utf-8?B?b3ZGWVVZdXIxaWtrdjZINk1waUIreWxHNVd3bHFCeEpRTWYyWHY1cEs3ZHlK?=
 =?utf-8?B?Y1FsaEFENVE5TkNoR2xXRWQvc3BWanYrSm1vZEtjbEVGWWs2a0txVTlKR2h0?=
 =?utf-8?B?VGtzeUp2aUo1N0IxUldWSE90OU1Nbm9CZVVvLzlhYmI4S0w3Z2N3V2o3K1Rh?=
 =?utf-8?B?U0NyempwNDhGU0xJdGNOam1ic1Q5YytuMzFHTWxhd1BTck5tbnVrUitvYS9C?=
 =?utf-8?B?M3N1L0hUclBQeWlnNTlSaGo2K1J1amQzYjF2RTJ1MkFzM1JlYjJPbWVsUDh6?=
 =?utf-8?B?UVQvYURTT1ZMTHgvaHArT2lka3hJT1U0VVU5bEZ1bkpUMXM3NzlaWnNFUHZi?=
 =?utf-8?B?MVN0TzBTbTFzNzBsL1NzckJ3eDlYYVRBS3ZqQ2tnMS9CcU82S2g5L09Qc043?=
 =?utf-8?B?OVNZeW84blpJcTg4ZTJlU1hUL0VnMWp2MmZ0NEZkYWlnL2tERG9PVHl3dThj?=
 =?utf-8?B?NGI2TGU0OUdwMW1OV0QxVTlCcVNOYVF4SnpkdUswY0phMUQzYlZDdGxBbmVH?=
 =?utf-8?B?WVVFY1pnV0duWmI0Wm5paWVnZFVMYzNpVlNLZEx5alJTd3ZpNXZaZE96NmpM?=
 =?utf-8?B?TUNrb1dMVzR3eVR5VEJZc0lnT0cwem5YVldiTmp0TkVqT0ZvWlg2bzBCekk1?=
 =?utf-8?B?UzBnd2FSeXpQY2VmblJjR1lCVE5GT3pXckRNU3pNTjN1ZFlCYVVNMmhtZnNI?=
 =?utf-8?B?Vms2QndveFdBeVNFVDN6czBsN2RnUW5FQndlNFUvR01VYWxMS0NGa2IveHdI?=
 =?utf-8?B?SlArcDJidmUzUklhaGVyQlpuYmdOd08rb29hRUFMQTZVQk93dEFZdVZHTWRt?=
 =?utf-8?B?TWxmb3BsZGZ6a3NEWHg0ZjN6ay80eDAwSTBpbkVYL0ZWbE1NZFRrN0kwMWJU?=
 =?utf-8?B?OExnWXNzV21RajFWbjVZdHF5UWZNblJPeWU0Ukx6RGJ6UlhXOXN1aEhmdG1y?=
 =?utf-8?B?ZHVHNkM2OXFBeWxMSTJyaStKcXpjZDI1VFBrVTBCeGhtWEZGd2lPQ1V6SWx6?=
 =?utf-8?B?Ty9GdDlZS2IzMEREYnFQQ3c0aXcxWDdtcm5qRDlhdUNiemRUU3lOemZHeWlT?=
 =?utf-8?B?WUpMUG4ybnlOTjN4UEowQllqVm9QenJWTVpCTG9Od0dvSkxSbDNUTWplcXhB?=
 =?utf-8?B?RWwwVmROb0sxQTcrTGZSVkE3NzhFTWN1UGloeHdHc0Q0UlpqU1hVQzhxK21L?=
 =?utf-8?B?bmlVbVFDcVk3K1p2TWtPOUM3ZnpyTmdSSGQ3TXJzQTJna2xBdXZqWFlqWEQ4?=
 =?utf-8?B?RDV6L1FPUFZDdmFOMWcrdFprOFZjaUhlcWYyNkN3OUJXdm5pbmgwaE1pUmR4?=
 =?utf-8?B?Y1RJemtwekxEWlJGWWFCUU5LL2hKWG5VMlBwRUQ1R1plOHM4c1hPbVdFZTV3?=
 =?utf-8?B?MDVjS1pTU3RudVpTazBkNTN6dmVhRnYwejgrbzh5TmV1Mnp3UTFqVGVZdDdM?=
 =?utf-8?B?T2JRaGQrOTRTK1NwenB0VHZQaDF1Vkl1MGxiRXRoVmJPVnNGcTFxN2x5SCty?=
 =?utf-8?B?TDBwT1NDdDIveEgxMDd0OXY0RnNKb0sveVZFWG5JUTFOOGhNNWhGeExKdk1n?=
 =?utf-8?B?clE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a88c42-9150-446a-b052-08dd3535acee
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 07:24:40.8885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l7D6V0JPppK4SSlHtwZm18fakqU3FIsr1ZNLyjTpRS5bsseYHHTtEapw9bdloz6c0aeWlEZYojCQ62qoXW7+IVgBEUeL7yXuiFJ/gjFAMzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8046
X-Authority-Analysis: v=2.4 cv=DdLtqutW c=1 sm=1 tr=0 ts=678762bc cx=c_pps a=2bhcDDF4uZIgm5IDeBgkqw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=cm27Pg_UAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=7p7RPr-GalsxoHJJx9wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: m8ey9Zyh9nFzWaveGrrd5iTrpJioPpbX
X-Proofpoint-ORIG-GUID: m8ey9Zyh9nFzWaveGrrd5iTrpJioPpbX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_02,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501150054
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 50F5fnol004599
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 07:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114886

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-8443:
The Easy Mega Menu Plugin for WordPress =E2=80=93 ThemeHunk plugin for Wo=
rdPress is vulnerable
to Stored Cross-Site Scripting via the =E2=80=98themehunk_megamenu_bg_ima=
ge' parameter in all
versions up to, and including, 1.1.0 due to insufficient input sanitizati=
on and output
escaping. This makes it possible for authenticated attackers, with subscr=
iber-level
access and above, to inject arbitrary web scripts in pages that will exec=
ute whenever
a user accesses an injected page. Please note that this was partially fix=
ed in 1.1.0
due to the missing authorization protection that was added.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-8433]

Upstream patches:
[https://github.com/OpenSC/OpenSC/commit/02e847458369c08421fd2d5e9a16a5f2=
72c2de9e]
[https://github.com/OpenSC/OpenSC/commit/b28a3cef416fcfb92fbb9ea7fd3c71df=
52c6c9fc]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../opensc/files/CVE-2024-8443-0001.patch     | 60 +++++++++++++++++++
 .../opensc/files/CVE-2024-8443-0002.patch     | 55 +++++++++++++++++
 .../recipes-support/opensc/opensc_0.22.0.bb   |  2 +
 3 files changed, 117 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-8443-00=
01.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-8443-00=
02.patch

diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-8443-0001.patc=
h b/meta-oe/recipes-support/opensc/files/CVE-2024-8443-0001.patch
new file mode 100644
index 000000000..7d80aba76
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-8443-0001.patch
@@ -0,0 +1,60 @@
+From b28a3cef416fcfb92fbb9ea7fd3c71df52c6c9fc Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Mon, 12 Aug 2024 19:02:14 +0200
+Subject: [PATCH] openpgp: Do not accept non-matching key responses
+
+When generating RSA key pair using PKCS#15 init, the driver could accept
+responses relevant to ECC keys, which made further processing in the
+pkcs15-init failing/accessing invalid parts of structures.
+
+Thanks oss-fuzz!
+
+https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=3D71010
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+
+CVE: CVE-2024-8443
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/b28a3=
cef416fcfb92fbb9ea7fd3c71df52c6c9fc]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/card-openpgp.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/libopensc/card-openpgp.c b/src/libopensc/card-openpgp.c
+index fad32f0ce..f99ec0db9 100644
+--- a/src/libopensc/card-openpgp.c
++++ b/src/libopensc/card-openpgp.c
+@@ -2877,6 +2877,9 @@ pgp_parse_and_set_pubkey_output(sc_card_t *card, u=
8* data, size_t data_len,
+=20
+ 		/* RSA modulus */
+ 		if (tag =3D=3D 0x0081) {
++			if (key_info->algorithm !=3D SC_OPENPGP_KEYALGO_RSA) {
++				LOG_FUNC_RETURN(card->ctx, SC_ERROR_UNKNOWN_DATA_RECEIVED);
++			}
+ 			if ((BYTES4BITS(key_info->u.rsa.modulus_len) < len)  /* modulus_len =
is in bits */
+ 				|| key_info->u.rsa.modulus =3D=3D NULL) {
+=20
+@@ -2892,6 +2895,9 @@ pgp_parse_and_set_pubkey_output(sc_card_t *card, u=
8* data, size_t data_len,
+ 		}
+ 		/* RSA public exponent */
+ 		else if (tag =3D=3D 0x0082) {
++			if (key_info->algorithm !=3D SC_OPENPGP_KEYALGO_RSA) {
++				LOG_FUNC_RETURN(card->ctx, SC_ERROR_UNKNOWN_DATA_RECEIVED);
++			}
+ 			if ((BYTES4BITS(key_info->u.rsa.exponent_len) < len)  /* exponent_le=
n is in bits */
+ 				|| key_info->u.rsa.exponent =3D=3D NULL) {
+=20
+@@ -2907,6 +2913,10 @@ pgp_parse_and_set_pubkey_output(sc_card_t *card, =
u8* data, size_t data_len,
+ 		}
+ 		/* ECC public key */
+ 		else if (tag =3D=3D 0x0086) {
++			if (key_info->algorithm !=3D SC_OPENPGP_KEYALGO_ECDSA &&
++					key_info->algorithm !=3D SC_OPENPGP_KEYALGO_ECDH) {
++				LOG_FUNC_RETURN(card->ctx, SC_ERROR_UNKNOWN_DATA_RECEIVED);
++			}
+ 			/* set the output data */
+ 			/* len is ecpoint length + format byte
+ 			 * see section 7.2.14 of 3.3.1 specs */
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-8443-0002.patc=
h b/meta-oe/recipes-support/opensc/files/CVE-2024-8443-0002.patch
new file mode 100644
index 000000000..30a7e63a7
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-8443-0002.patch
@@ -0,0 +1,55 @@
+From 02e847458369c08421fd2d5e9a16a5f272c2de9e Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Thu, 15 Aug 2024 11:13:47 +0200
+Subject: [PATCH] openpgp: Avoid buffer overflow when writing fingerprint
+
+Fix also surrounding code to return error (not just log it)
+when some step fails.
+
+Thanks oss-fuzz
+
+https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=3D70933
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+
+CVE: CVE-2024-8443
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/02e84=
7458369c08421fd2d5e9a16a5f272c2de9e]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/card-openpgp.c | 17 ++++++++++++-----
+ 1 file changed, 12 insertions(+), 5 deletions(-)
+
+diff --git a/src/libopensc/card-openpgp.c b/src/libopensc/card-openpgp.c
+index f99ec0db9..3957440de 100644
+--- a/src/libopensc/card-openpgp.c
++++ b/src/libopensc/card-openpgp.c
+@@ -2756,14 +2756,21 @@ pgp_calculate_and_store_fingerprint(sc_card_t *c=
ard, time_t ctime,
+ 	/* update the blob containing fingerprints (00C5) */
+ 	sc_log(card->ctx, "Updating fingerprint blob 00C5.");
+ 	fpseq_blob =3D pgp_find_blob(card, 0x00C5);
+-	if (fpseq_blob =3D=3D NULL)
+-		LOG_TEST_GOTO_ERR(card->ctx, SC_ERROR_OUT_OF_MEMORY, "Cannot find blo=
b 00C5");
++	if (fpseq_blob =3D=3D NULL) {
++		r =3D SC_ERROR_OUT_OF_MEMORY;
++		LOG_TEST_GOTO_ERR(card->ctx, r, "Cannot find blob 00C5");
++	}
++	if (20 * key_info->key_id > fpseq_blob->len) {
++		r =3D SC_ERROR_OBJECT_NOT_VALID;
++		LOG_TEST_GOTO_ERR(card->ctx, r, "The 00C5 blob is not large enough");
++	}
+=20
+ 	/* save the fingerprints sequence */
+ 	newdata =3D malloc(fpseq_blob->len);
+-	if (newdata =3D=3D NULL)
+-		LOG_TEST_GOTO_ERR(card->ctx, SC_ERROR_OUT_OF_MEMORY,
+-			"Not enough memory to update fingerprint blob 00C5");
++	if (newdata =3D=3D NULL) {
++		r =3D SC_ERROR_OUT_OF_MEMORY;
++		LOG_TEST_GOTO_ERR(card->ctx, r, "Not enough memory to update fingerpr=
int blob 00C5");
++	}
+=20
+ 	memcpy(newdata, fpseq_blob->data, fpseq_blob->len);
+ 	/* move p to the portion holding the fingerprint of the current key */
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb b/meta-oe/re=
cipes-support/opensc/opensc_0.22.0.bb
index 834b83d68..822e0ab97 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
@@ -24,6 +24,8 @@ SRC_URI =3D "git://github.com/OpenSC/OpenSC;branch=3Dma=
ster;protocol=3Dhttps \
            file://CVE-2023-40661-6.patch \
            file://CVE-2023-40661-7.patch \
            file://CVE-2024-1454.patch \
+           file://CVE-2024-8443-0001.patch \
+           file://CVE-2024-8443-0002.patch \
           "
=20
 # CVE-2021-34193 is a duplicate CVE covering the 5 individual
--=20
2.34.1


