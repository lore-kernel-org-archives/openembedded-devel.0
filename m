Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8015D5E370
	for <webhook@archiver.kernel.org>; Sat,  9 Nov 2024 13:54:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.17016.1731160487735901284
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Nov 2024 05:54:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1043947ab9=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A9Dcabp004128
	for <openembedded-devel@lists.openembedded.org>; Sat, 9 Nov 2024 05:54:47 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42t84pr13y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 09 Nov 2024 05:54:46 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4A9Dskdt027562
	for <openembedded-devel@lists.openembedded.org>; Sat, 9 Nov 2024 05:54:46 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2048.outbound.protection.outlook.com [104.47.58.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42t84pr13x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Nov 2024 05:54:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mlfApy+SB87cabDTCqqv5Iru2i/BkOd16IeZICoaTcvxumAkytyLBjxSKUBFhtOC7d1/RpYCv7llXLSRabctksJkNo0s4oEtN5qxGDDs68L+clh8kXZf310yGoOr80csJvtbTls8vHi5pBvHo77ABGBLOaZ+UHymCJe0M7QEpAbfoIVdgQDnYpbG6+I6+hbGy1euEZLc3F5A22zFrGinZTu88n0aOSe6ZLLYUFgpskam6Mi/OQyW5dQNjqU9CPzmNWzc+gAabjBY9E8VCqzefSXutzVNHT1BCR2erX6Q1aGtj4Z5qlyWX96akkpniD9FQBfp0/FPCpHeWFsqn7LyxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/JRHw2Rhp70v+eCjjgPlAx05cFX1LfWWBbzEVN7OR4=;
 b=UFJTmHsawTTJBB0ilvvCpQfq1uzBbwLgfFKM44Jjb0SnABTxi9H9GYSOzppmVrx6QX2m6hwK5GgBCDXCJJ8DLL1LYI48F0F6ko7wA2TYHcbxCigrjbU9/OC+3OrVLI9gATa8A7HN7kQjLAKyCdRYzVe5FHbvyI30OzihGgMVLYnJ3ciljUq2nnv3ZzCtKW5QvoczlabvGHzaiZ8H/aVRWSVKK5qSeXwGCkhyL8mEx2sqkynafH6/fQgXpVBlD+JY/4LgAlZg2j4TdfUCKa25tTX0mL3cLItgKYY0aZVThTP7eyfrKbuYbrU+KU+hPU82ksQ8JUVMnVF8AfYYw04ZAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CH3PR11MB8546.namprd11.prod.outlook.com (2603:10b6:610:1ae::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22; Sat, 9 Nov
 2024 13:54:42 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.8114.028; Sat, 9 Nov 2024
 13:54:42 +0000
Message-ID: <f920a0b1-d75f-44ea-8e10-714f830f731e@windriver.com>
Date: Sat, 9 Nov 2024 21:54:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v3] parallel: Add recipe for GNU Parallel
To: Rasmus Villemoes <ravi@prevas.dk>,
        openembedded-devel@lists.openembedded.org
References: <20241106110311.1657900-1-peng.zhang1.cn@windriver.com>
 <87fro3gv2x.fsf@prevas.dk>
Content-Language: en-US
From: "Zhang, Peng (Paul) (CN)" <peng.zhang1.cn@windriver.com>
In-Reply-To: <87fro3gv2x.fsf@prevas.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR02CA0120.apcprd02.prod.outlook.com
 (2603:1096:4:92::36) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CH3PR11MB8546:EE_
X-MS-Office365-Filtering-Correlation-Id: fef29ad7-123e-4cd5-eb67-08dd00c60f63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cHpGTHBKeDVOQk5YNmpweU5IOVE4dkkrcHIyM0FNSk5HMWF0cWkrOHRwQW43?=
 =?utf-8?B?eHJ1bnV4bW1HQUtnVHZ5RlFBUlV6YnpjQzczdmNZemYvQnNDb3YzZGtNSWtC?=
 =?utf-8?B?YVhRRUlVYkpiNHk1ZzRZTFE1WEpWMmU4T0NFK09SRTVhbXRNdW9TNFQ2d2E4?=
 =?utf-8?B?WmFSMkNxdjhkT0xmSldwSzl5eGEwUFk2cTQ1azN1S01tdU4zd0RRNnFLcTcv?=
 =?utf-8?B?eFFORDR2TnVoU2hnZmdRSHVqT3IyR3dTS0p6WFB6cU0vb1lmNXBTTTFBM1pU?=
 =?utf-8?B?T3RhYkUxakFvRTB4RWprSFhnUGh4eldmWmpNWXRBUDJsYlE3bzNoTmI0L0hu?=
 =?utf-8?B?cHJiNlUyb1BKdXVnY2JoV0tDcGF1TEc0MHk4aGhXVFgvdXdtYUNJLzZDQUpS?=
 =?utf-8?B?R09oWjlOKzRTSTFYUEo5ckM0YVh3Y201enJPcG9FVHVVaVZLS1ZLdm9jbUpP?=
 =?utf-8?B?S3kzd3hBN1dlWTNUN0pXRjBqK0xUN1VNdmthMnp3ajZBa0lxN3ZKZlNDNDNC?=
 =?utf-8?B?dUpoQjlQN1QwUllvVjQvUEdBazZndTFhS2JneWlxcTlqZjN0bWthUG14SkdJ?=
 =?utf-8?B?OTNLWXk4TGp2ZmRIdnpTRzlHTXlZNVVXUG0xNVRjTTlGM2JFVU9SQ0FOTDd0?=
 =?utf-8?B?TVlLeU1HRDNJVmNRTW9IZHlFa2wrUFNZaXZycFZETHhScXpDWi84MUtqcGpj?=
 =?utf-8?B?bC9MQnZuSGdXclNCTUpPNjFOUDdVUTYzbDhGelRSRmw3bHZmYTJZVzUzNmdw?=
 =?utf-8?B?UlVWZkdQcmUxYi9nY3o1MTY4V2EycXZxbTRVbDlKcnd5RWhDdFM1ejlSSUVM?=
 =?utf-8?B?TXJKTDlRbW5ySGRHeU05Q1ExNWRBSG9EbFJDL3pmNmpQMFpPbnhRaXM1T1Nk?=
 =?utf-8?B?cDF4Qm94VmtUZk9aQUE3RVpxVERpQ0hrRGN2Y2FLQW5TSlE2dEZ0QndOTm1n?=
 =?utf-8?B?dzNYOGs3aExJSmNTQ0JkY0pHaVhiWGRKV1QwQk8zWmUySHluZWROdFIxSVR5?=
 =?utf-8?B?WU8xQlFVOCtaaDlzYkxwOXpMaCswTUVTbElydmVLUE1mcUpEMDhMV3NWL3dH?=
 =?utf-8?B?eUxadTVSSE9ncG4yeVQ1eWVLajgyOGN6dmJ3ZWVuMUVKU3JWbldlWmpIcHdm?=
 =?utf-8?B?aDR0Sms4YXJBNjN2SlFGb2pORGpSZW5LQ3R2bDRkVjNLZGhNd0lsYmovNHQv?=
 =?utf-8?B?dUFQSTFCRVFvdmZVQmhGL2JNMXJHV09ySzlrY1BVRCtiU2owcXI2bHNCczVE?=
 =?utf-8?B?U0lxY0k5eWx2RFdMVjV1WDNRWmlTYmJMTFVUd3VOTWR0K0tIZ1lQREFGWW9x?=
 =?utf-8?B?K1BrZXRXQVR2N3RiczhiNjErYk9XdHlVV1NDUnhTdmE1NnQwRDk0U2YyZHJn?=
 =?utf-8?B?Y3ZremQzR1VRUkQ2NDNvZ2M0eXFsTlZBeW8vZTlNdCtVNllWMEtucHZ2aUxF?=
 =?utf-8?B?ZjlsU3d4UDJ1TUllT3FxaDMza0hlR3lCMDhNQjgvUm5zd3kybStCWkVuMmlT?=
 =?utf-8?B?L3ZnRmt4V3phbXQzMXRkTmZFdU1hdU5pRVc0QmwzSnRKdTMwRkpHOG5NK0I5?=
 =?utf-8?B?VHp2R1p1cHI0MlFvTGVmT1lJVjFncllmYVV2RmNWcDhraGw4dDY5a09CeUM0?=
 =?utf-8?B?Q3dPVFdpNjAyeW5SdnE3QnVkNytseFZ1Q3hQczFSblFaR3FadEdwSkg3OHFi?=
 =?utf-8?B?K0owRXVXc1NUSHczd2tuRnM4dDk5TkFvTi84MWVVc05OTzN4Z0t5bzEzU0Zh?=
 =?utf-8?Q?Ct7xEEFq+Q3TvrcYt/4yRMVUOIrIinuDL5rUv7k?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MWQvZG1YdkF0MGQzTGMzQ2tEMnZqejAyNHFBT0E5R1NmSDRjdEFtUDJnR2Mx?=
 =?utf-8?B?TVhKc2dwdnhJbUZCKzBpaTNrUUNoeGtHR0x6MXViVUVEOXVxVkhOQWY2VVox?=
 =?utf-8?B?Yi9VZ2JlUlNNYng0cTZBdkJJN0hkK2FkbDdqZGI3bW1PR1VlalBKQk01QXdw?=
 =?utf-8?B?d2ZEWFFxemFsTzNETmxXWXZlRjVER3JFMUdUdTg3dzF0bDl2UG5TNHVoZVUr?=
 =?utf-8?B?SndIZFR2UVVqelJ0cDNyamtqVFM5NEFyN0EvVUEyQ0FUd3kyYzlIajl0Rzgy?=
 =?utf-8?B?WWl5dXlCWGZQZVB5YlVud0JYRHBUdVJodVVhd05raHhTN29yQllGdkRkSGFr?=
 =?utf-8?B?TzNEekxxRUlTWG5Qb1pDenM2TGJ1UlVRamFxcC9TTDY3QmZjbmlOZXZpY1lY?=
 =?utf-8?B?a1hTdzFmQUQyMmdnNWJXMVo3VnZTdEpYdHY1cU5lMUJTclhlby80cnFoQWc0?=
 =?utf-8?B?K0N4NG1kc01TdFRvQUYvbGZpcGdhb2lFM21FWEpIVEZKVWVGVEhjYWE0LytK?=
 =?utf-8?B?NjFRUVpqRnozWXU0Y3A0RGo5Tml2dEJyQXB4Vit1aEhheEp2UHh5cUczdUU5?=
 =?utf-8?B?K1NzZ2dGQXNqN3hNa3lZdmpBdTdEc01yQm9hTVdlZTJHV05XVVFnT0ViOU1W?=
 =?utf-8?B?TnVWY1hiT1dMVGx4V0hEd0lnTDRxTHFORzF5anlsUWhraldHQSszcG9MR2R6?=
 =?utf-8?B?cUd0M3ZUSThqR1IrM01qT3pNbHRFbU04TUpCR3BWRjljT0Z6aEt6Q0JUaFRS?=
 =?utf-8?B?RFp2b2RXKzhLcElrNVg0ZW14c3RIWnVuVzdrUExWR2s3amoycGVkdnhKUDBF?=
 =?utf-8?B?ZTF6cml5VUNuZHBtWEJzaWhWOFI5dWdSOXVqUmkxT2g2ZGVLejZNZlNDcjFi?=
 =?utf-8?B?V2NuRGU2Sm5xblJuRU9LVk00dmFmMCtMdGRiVWFhY1VhYm1GVEJJMldLZWhh?=
 =?utf-8?B?UDk0aGY1dFYzLzNVR3pQOFRaSkFjS1dCU2lYMCtPTkg1dmdLVG1NS3RpUGJx?=
 =?utf-8?B?WWZmTkhjTTgwODRwTWVML0taQWdML2VQLzJ6Z05vdHMwVUNIVFNpSXhqamky?=
 =?utf-8?B?RDBDcHFlMjdvdktPOXQyWlRpbVJxZUhBVDJ6WkxsWGZEWThuTmorWVZ4Vkpk?=
 =?utf-8?B?azNjYkwxZVMrenErbnBYS3pLVlBCa2lMWmlsNzFIaHFjdnFYNFVRRFVlWGRV?=
 =?utf-8?B?eWYzMmhMbm9RSUtCbVVYTUkxTzN4VjhLVlhkUnZ1MGtzRzcycUxPSXA5eUY5?=
 =?utf-8?B?REtWdExuQlZSU3FDUzk2ZUE2WW93aHFrNzRiRXRGNHhwbXVydHRqYURqVzhm?=
 =?utf-8?B?TjdZbG13Q0Y0YkJ5NHdxZ2Jrdk5JWnBKb2ZQemxwVG5RVDVNQXhhT0ZxTm5X?=
 =?utf-8?B?dlJFYzl0aDczaDlLUFZjVlFEd09vMjFESjZKT0xxZXhIcHkrQ0ZFb2VIMFp4?=
 =?utf-8?B?UzYrZ1FWcndwMWF0RFM0ZWhKRGprbzVBK082Yzdlb01BbmlNRzZYaEEvWDV1?=
 =?utf-8?B?NHZ4MFpOd0lMcSt3QTFRSzNBY2pMejZBb0VaOWttNEVmOVNHeDJoRmxYcXMy?=
 =?utf-8?B?Rk5ORzhkOGpvSVJrazZ0MmM3enVGaGowcDVZUjNrSzZBa2t0WkttYmYrbWYr?=
 =?utf-8?B?MEJ1a3BtQU5NNWFERndrdTNFVXFlbFZDdlJ5eUNEYURvZEdPT1ZpdXVGbVUx?=
 =?utf-8?B?Vi9taEQ4c1FURnFVRi9tUXpVeStXR0V1TWxaZzh5L1ArSnZTYjh2TFhEMk40?=
 =?utf-8?B?anhTSGhQU0s0dHpOZ0ExRTdSWXNLNmVrdk5BY2VwR0U1NUwzV1E1RUxrdGJQ?=
 =?utf-8?B?VWdhNFBiVGdwRDFMM2dzbytpNVhPVnVwcWZlRTdEZHRZVUY5ZHl3Y0pubVNO?=
 =?utf-8?B?RUFsb2JvOEtTUVlyOWRTNGpXU2c5NmM5alRmenNHNFBSUjZUMXlJaWowcml6?=
 =?utf-8?B?TGlkY3FOM1JmbEt4d1RRMUI5YmlFVng1MHFoUmxSU1hXZ1ZGaWhXRWZWR0Vr?=
 =?utf-8?B?aHcxc0J1Z0pRTER2cEtJT3ZpZmtqWmgrYUU2bG4zQ0VycjRTTXJyeEhxUFdy?=
 =?utf-8?B?MGpEN290QXBobmpIWkpHb0hZQUV2ODE1Tzl5SnlobFR0R2ZQZExEc0ZUVzVz?=
 =?utf-8?B?SHNHTStpcUVLamF4Mi84N3dWOElRY2NJMFFlb0tIayt6ZUdkTXc2Z0M3a2Nu?=
 =?utf-8?B?QlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fef29ad7-123e-4cd5-eb67-08dd00c60f63
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2024 13:54:41.9297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4aT/smUOEJQFhuwKSVx2s1wQ3sTRJ2i21Txu0nCzQdP6xVPI7rejsIzo8itVup0QR0W8l47e1Fcq8YDFAnjrdsveTauOp87fNiXqB5LbHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8546
X-Authority-Analysis: v=2.4 cv=IrVMc6/g c=1 sm=1 tr=0 ts=672f69a7 cx=c_pps a=IJ1r+pqWkCYy+K3OX67zYw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=u8TgNiw41JEVHko8vrcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Mosbvhgip4IwnT8txcy87yQrNCrV-Y4O
X-Proofpoint-GUID: 6u3NnHfsib658uP92Ht58XlcKx5wpzCk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-09_13,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 mlxscore=0 mlxlogscore=990 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411090118
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4A9Dcabp004128
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 Nov 2024 13:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113772


On 11/7/2024 7:08 PM, Rasmus Villemoes wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, Nov 06 2024, "Zhang, Peng (Paul) (CN) via lists.openembedded.or=
g" <peng.zhang1.cn=3Dwindriver.com@lists.openembedded.org> wrote:
>
>> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>>
>> This recipe adds the parallel package, a shell tool for executing jobs
>> in parallel using one or more computers.
>>
> ...
>> +
>> +inherit autotools bash-completion
>> +
>> +DEPENDS +=3D "perl"
>> +
>> +RDEPENDS:${PN} +=3D "perl \
>> +        perl-module-ipc-open3 \
>> +        perl-module-getopt-long \
>> +        perl-module-file-temp \
>> +        perl-module-filehandle \
>> +        perl-module-file-glob \
>> +"
>> +do_install:append() {
>> +    rm -rf ${D}${datadir}/zsh
>> +}
> Why remove this rather than just putting it in a package by itself, as
> other recipes seem to deal with this.
>
> PACKAGES =3D+ "${PN}-zsh-completion"
> FILES:${PN}-zsh-completion =3D "${datadir}/zsh"
>
> even saves a whole line :)
Currently, Yocto does not provide a recipe for zsh completion, but=20
bash-completion does. Even if I were to add the zsh completion package,=20
the only advantage would be enabling users to quickly install it on the=20
target machine, and unfortunately, I am unable to verify this functionali=
ty.
=EF=BB=BFThat said, I have decided to remove the section on zsh completio=
n.

However, I appreciate your suggestion, and after considering it, I think=20
it's a solid approach. I=E2=80=99ve decided to incorporate it into the pl=
an in=20
v4 version.

//peng

> Otherwise, LGTM.
>
> Rasmus

