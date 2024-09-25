Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31926CF9C69
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 02:17:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6015.1727230635815789309
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Sep 2024 19:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=99989a8a2b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48P2CiXw013037
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 02:17:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41um6hhcpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 02:17:14 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48P2CKBl012324
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 02:17:14 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41um6hhcpd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 02:17:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yw8jIIiO9wKib7O1CZcG3cPS1ueLrzMQ0p4YsPDt3GVi4g53cqdRIx57lpOGt9CAaruyX58sqqvKwEqHI4G1qx5fozGuutMXvPOhjV78olYxxZT3n6KJjSKOKNAvpRCjiEKfRLk4EW8hzxtj4gLepikfTaxpAlfPMeh4QpwwDFz8C0+bdAIvvVFtC1CvoLHZHkn6K1S37LMlu1C1MZJ3bj9s3NknOrrW8nRTSNsRqWppU6c8iM9l0WYH+oaeNboWh+7eNTlK8vGt/3Qf/8VqMU7phC1yvEODhfuqtTvEPshIiyND+R2MoOKx6b9x9TcKZMrv9jqP2XFi3UsrLGTFLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4OU3Qzm6ZliQD+zgA9cGnZdY39U2ypfSKEkp0kZmAQ=;
 b=u7A5znPw1rPQl/DSl1scWHcn5tCvN+mBzNYWc/6LVJ9n1SnwIkKTEcVDvlSgS6Xm4aFKcqsz/norNgYJ9dh2qS5QNltDlVbCfPzMy2EROzLkRSbvlKRIDbUfOhEzOyBXpthBfF65E0IuRBGsGZutvZz7d0U/47aakdZi5xOnB/dgoYe6tnweg/OW2sc3mxbBmj2L/B+isCHnKC3SU8na3Ow3VH+GYaotU9lgFXq53jKx0TcZ30DszScw4739x1AZWIx+4VHzFVbrggkUkGb2GGGRmop4XHc9+xcNydJqHkBj5QoBFE4s0CXG54e1zMo21xphYnhA22SdA7pFqNf2MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10)
 by BY1PR11MB8125.namprd11.prod.outlook.com (2603:10b6:a03:528::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.24; Wed, 25 Sep
 2024 02:17:10 +0000
Received: from IA1PR11MB6396.namprd11.prod.outlook.com
 ([fe80::79e6:58f0:788d:b45]) by IA1PR11MB6396.namprd11.prod.outlook.com
 ([fe80::79e6:58f0:788d:b45%7]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 02:17:10 +0000
Message-ID: <202aa218-94f5-46bb-a514-6118ad457078@windriver.com>
Date: Wed, 25 Sep 2024 10:17:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to RDEPENDS
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        Yi Zhao <yi.zhao@eng.windriver.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20240922073618.1359707-1-yi.zhao@windriver.com>
 <DB5PR02MB102135305A71D2997E959868FEF6F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <DB5PR02MB102135305A71D2997E959868FEF6F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0252.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::10) To IA1PR11MB6396.namprd11.prod.outlook.com
 (2603:10b6:208:3ab::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6396:EE_|BY1PR11MB8125:EE_
X-MS-Office365-Filtering-Correlation-Id: 25cdf1f7-7d87-45ed-750a-08dcdd08293e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NWZMeisrSzgvMEY2US9hK2hFNWZqSG1ocUpOUktBaXpWbjFBMXByZ0Q5ZkFP?=
 =?utf-8?B?RFVCOXBvc2dWdnd2Vnh1MmRjVG43eUlWSGhrMzNVSCtEdHN3TXJ6blgwNWc3?=
 =?utf-8?B?M2E0MjBxK1kzb0xPMGIxdWRVdjhoM2g0WDhtV3k2TENvdUdqK2JXWmZ6V2lh?=
 =?utf-8?B?UVJleDFOODZFVnk4dnRqV0RYclJyWmpXSjNBbldKN2hFYW83UnhXcXk4SmhP?=
 =?utf-8?B?RXZwVDFrVXVNN0R2OWpiL1dCY0QrQ1ZSUEx4aHFlWEd2cjh5UXorK2Fsc1BY?=
 =?utf-8?B?UjlEblg4dmsxYUlqc08yL215aklORWVJZ25jTmJyWlhxVzNabE5xczU5RzdD?=
 =?utf-8?B?N1RMalB6QXZLbFF5Ymw4NXV6YlBZMUVjQVBIekdaYlRVcFMvbDU2b2dwclV5?=
 =?utf-8?B?d1dxeVhKUGpaSU14aUxWbW0zWHlOdVQvRHN5QmMrTmlIK2NoRUdrTEdMczVh?=
 =?utf-8?B?K1Zudm11eXU1emt3dmVhc3JwMmd0RUtCejhJQ2F1MTg2Yjd2MlRRcUpPai9z?=
 =?utf-8?B?aGpUdlIrd3F3YS85K2ZTN21wRDd1c0drWDI2a2g3ODR4Nm1GZ21DOHBuMEZ6?=
 =?utf-8?B?OHFrcmZEOHN0dUhTekJhbkJRQTBjUklEMDM0NFRNT3U0NmtGTmJRYnhYOEpO?=
 =?utf-8?B?alZoQ0k0TUc3ZmpOdEROTGEyNEw3eHlKaWhrVnBBSjlkbnVWN082aUl2R3dN?=
 =?utf-8?B?K0JNOWYyd1N1WStObGNHY3Robk00STdVSEJNd0YwZUx0M1hQQXl1eHF3aUZn?=
 =?utf-8?B?V2FlSXNZYXc3V1JRbzV3anE4NHQ2K3k5cjVwRGhYYzhwcEJ1d2luYUVFNE9G?=
 =?utf-8?B?aEd6YURkb3l5T2cyZEJyOUt0Smp1R2pEUVNDZFQ2Zk01aU5aY2k0MUZLTS9H?=
 =?utf-8?B?OTJJQzlUWDBmb2xPK2tpMWtjaEVrWXhJZVJYUmJBMFh6U1pxU01Yd0hMcDBo?=
 =?utf-8?B?c0xKZzBCcFI2YjYvVDdqQTlHOGxWSXVVMlN5UFNYcXREK1prQ3NZR0hnTU0v?=
 =?utf-8?B?Y1kvMTJUUnQrRjR1dHlscEo3dlFDM3JLWkpZeEJlZGpWT1JLMnI1alJaMDVH?=
 =?utf-8?B?Z0cvL0lHR3RNaDhKUDMvU0tqbkw1TDJUamdIOTVuaWl2MmFnNVhvbzlJTTQ0?=
 =?utf-8?B?UXZvbUlrUms3QjNaemtSQjhXV0gxSWh3QlRyV1hxSVl4b2pRZkhScTVtSGNP?=
 =?utf-8?B?SWN1cVJidDBFS0VaQ1ZtM0hpRko2MWRxWm9SNW8wZ2tTUSsrSmpVdUVZOVNY?=
 =?utf-8?B?NlcyZ3lZOTJ4ODhtdEMyZGs2VStrZE5VTkpUc25vQTBKamZhUFNEQllFdCtH?=
 =?utf-8?B?T2YzQ0x4bDhTM3ZpclI2Um1HTnhpWVY5QWRxc3NXK0YvNU9IUDVIS1R4d3JN?=
 =?utf-8?B?Q2tZK0dCa0pCbnlOQjM5RnJMMFVOL0FyUXZaS3lBdy9weWtDbnVncHErVng2?=
 =?utf-8?B?d01OM2VHbGk1Z0hFaWRkUkNPNWxhVjRIb3Y4VmJzdlpnbjRENFI5QVRZcXV5?=
 =?utf-8?B?TVIybEdhNVZBcWMyMWZtTkxQbmx3Y04vUk5oejZWUlJpMXdrdlVDRWVNTk1z?=
 =?utf-8?B?S1o5R212YlBQMkdUdW01M2hDL0kzZWU3eFV3ZUs0NFhMekJwSlNiZmUrejJn?=
 =?utf-8?B?S3N2VzhCSWlxaXVkRTM1TUZhek0wNS84djZ3N3FBZUJUcU94a25EbkRSeEpq?=
 =?utf-8?B?akEwQ2J6YVpFbzZhYk50MVljYmYvdENad283dTUreHVMQUs1K25FNE5VZ2Iv?=
 =?utf-8?B?UExhUndOOG1Ib3IxV3RJSVVUc1I3SWMyUEpVd3UwTFh5MzdMWk9jMzNFTDB2?=
 =?utf-8?B?emtuekFBMDA4S3phMVdDQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6396.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a2lFUHZ0bDlhajhBQUFaSDlPaTQxMHdyV05QODA2dXJEMlBsbit5eEdSeXR5?=
 =?utf-8?B?dktRVzNrWnQ5a2Z6bTgvdE03eHpiWElTcktGNUJHaXg3T3V6UXpYVGVqVjlr?=
 =?utf-8?B?WkZLN3hnYlFDak82SmpDMmlYSlhMdkdMbnpCL3VXYUhERGJNRXQ2SzNZdndm?=
 =?utf-8?B?MGg5L2pEMFY0SnlKWnRINW4za0IxR2ZzR1RvMzZqdHovd3h0bFF5TitWYTNE?=
 =?utf-8?B?VGdIRjdOeUdLbEE4MzVGVE82MnZmRXVCVXc4OVU4OFRXNzd6NmJwNnNKZnRh?=
 =?utf-8?B?TUdxYVMvVDk3QTk3YVM2Qjdmem1FR2NjOGJIMkl5YVZYQjV1ZlFML1pvb0Er?=
 =?utf-8?B?b3pDUVNIWGV2a3ZDSlovOEFJRHNiMTUvRGxWcjlsK2RPdTJqNGdTTXZNV1Jx?=
 =?utf-8?B?WDU5V25Ob3FKbnQzcDF4eFdaUy9kU3lCMmZhMjJrbWZVWEdoWGpITWMzRkU2?=
 =?utf-8?B?cnNKenpUQURGb1lwb1BaUjJSRzZvUHNBYUZ5S083cW81a1FLVDdXYzhTSENa?=
 =?utf-8?B?YWxVekxldzk3ZG5Hb0FYT1FQam8zT2VQZmZ5Wjh2eXpNeVhtcDNzV3didi95?=
 =?utf-8?B?VjMwMnlGTVQ3ZFNmRC9rTm5Mc2lyb0M3OWhiZWRnbncwSkJnVmxpRzdFZHZj?=
 =?utf-8?B?QXR0bjA5dGRJSkNaZDE2dGxubC9nNk1xS3lncHR6OCtDeUxvQkxoWWh0MFAw?=
 =?utf-8?B?TTNhT3lBcjBoNXh1QUUzcklmMkovZUYwZGxoYWJqZGtNYy83Y3kxbEpxa3By?=
 =?utf-8?B?VGE2R3d4MXdmVVJaMDRiQUhJdWd5Z1pna0J1STFYQ1l2RTdGNzVzQ09FWDdo?=
 =?utf-8?B?eng4eWhjVTlEOTJ4cFNOSVZaV3ZoRVF5a3hxWEVmNGlYV2tEeGZ5Wk8xQkFP?=
 =?utf-8?B?Y1RmZy9nVEVqZ0ZtZlpQNkg4WFRHZUUwYWh5MFRURll2UGpobjN4Y21YM3pp?=
 =?utf-8?B?SFRVQUpYK3hYWjRSTEYzUThGN1daN21zM3VUUVprNVJmVElmMjVBLzFuanRY?=
 =?utf-8?B?TjIycFA4eVErWWd5ckFlR0xrRnFGL0xqR2hJT2pNQnIzYWhBSjN6aWlQejVX?=
 =?utf-8?B?bjJCcjd1QSt6UCtPK0NxZGVLN2QwY2o3bjRWdmZlQVU3cUNLQVlxOUgzRDd1?=
 =?utf-8?B?cUNDREdRdytrNjBXdHBmbFNwS1dyYjFNQUdKMEF6ZFRHNjZ2NGMzdGhnQ3d2?=
 =?utf-8?B?eDVJVm5GV3lNYnRzZ1I2TnE2VHVscjNKaUg4bVUveGd1MEZPaWlFK2NLTks1?=
 =?utf-8?B?T1VBMGdmUld6UXhBdU5UMEJjS1R5bE1oUFBpOXNqZFdiSDdWRDhNUFRVakQw?=
 =?utf-8?B?NmdxSlNySkNYTzBXdHBKN2F6N01rU1QwbmN5eTRBZ2RwUHZlNDFzVWtKYlN1?=
 =?utf-8?B?bXpkYnFVNnFKRzkyU0dZUGh1ZDlxeVZCaVZiemRaa25KSUd5ZXdoM1dIZklK?=
 =?utf-8?B?bm9UckVtN3IwQTR1WHF2bWt3enpQY1R6ZHowa2RHMnVnbU9wVldXSzBCeSth?=
 =?utf-8?B?SERBSi82bnRDOHpHMnZDeVZzRVpQcXkveTNzZjF6bUFqdTg2R3BBazY3VGZ0?=
 =?utf-8?B?UGh2U3d5RnN6ZTYvNmlLV2Zhdmp0cko0S1E2M1VVT3ZRcHNjTHlBTnBEOWc0?=
 =?utf-8?B?Uk1OUnNDdWpCam1saS95bGJEWmRGSGpoYWtCNklqZlc4aUIrYTJYNFVRT2xj?=
 =?utf-8?B?M3FsUHROZHdTdUltckdMNkgyb1ZQNHJaU0FFeXRDbWtneGN3QXNId2k5ZFVZ?=
 =?utf-8?B?RHo1cldOOEdHOU5PSndtelMwcG8vdDNCN3JabVovWk1UMkQycVNzT1JZd0cz?=
 =?utf-8?B?M2pMazh6S2FEMFk2OUtoVC8wcGl4WEFzYktzdC9YWVQvenJqUTYwcHcvMUtr?=
 =?utf-8?B?OEV5Sm9mcFBhaFJlSEZjNU9jZHJ2ZFlnKzFSMlBZbGdNUUJqck80M0hQMmY2?=
 =?utf-8?B?QTlFNE4zeEZ3Yis5YlpSK1QvWXVnSzhISVFldkFrYnd3WFVMd3NkdkxOZUtm?=
 =?utf-8?B?djBZRVRkMnp1QlFKYmE1L1ZsMXFTS1VwMERlR1owN3lQTFVlK2VPWkFsQkhy?=
 =?utf-8?B?MndqbnpCQVdrckRqNW81NUdJSWRrb3VTaVI1WHlMaHB3SnZRczlXSUR3NndD?=
 =?utf-8?Q?NMZBJ5yIIOvmH55t2t73SL+eW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25cdf1f7-7d87-45ed-750a-08dcdd08293e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6396.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 02:17:10.3864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZcLCDBAKk8A2hvMg4Tc44W/80OwXbMeyptIhL7Il9dORYogFcuz+g9RHx15Q7u4XWdXz+r+t9UJ2ljSMbf6kQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8125
X-Proofpoint-ORIG-GUID: 5OZz-5mGhw-VKmHHq6GTbtXSdj6dRAjk
X-Authority-Analysis: v=2.4 cv=bas5U/PB c=1 sm=1 tr=0 ts=66f372aa cx=c_pps a=o9WQ8H7iXVZ6wSn1fOU0uA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=rlACdV7B8InZ1Wx4SccA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ofT10FCr7wNXswxYwjUqlTYNcLVGEiBB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-24_02,2024-09-24_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409250016
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 02:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112483


On 9/24/24 03:02, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org> On Behalf Of Yi Zhao
>> Sent: den 22 september 2024 09:36
>> To: openembedded-devel@lists.openembedded.org
>> Subject: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to RDEPENDS
>>
>> Since commit[1], the libraries of abseil-cpp have been splitted into
>> separate packages. When protobuf is installed into the image, only 48
>> abseil libraries are installed as runtime dependencies. But the output
>> of 'pkg-config --libs protobuf' lists 66 abseil-cpp libraries are
>> required. Add abseil-cpp to RDEPENDS to ensure that all required
>> abseil-cpp libraries are installed.
>>
>> [1] https://git.openembedded.org/meta-openembedded/commit/?id=dd6421e65eb75c35a904f4b487ba022075035ecc
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
>> index cc5204de4..354b3213a 100644
>> --- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
>> @@ -106,6 +106,8 @@ FILES:${PN}-lite = "${libdir}/libprotobuf-lite${SOLIBS}"
>>   # CMake requires protoc binary to exist in sysroot, even if it has wrong architecture.
>>   SYSROOT_DIRS += "${bindir}"
>>
>> +RDEPENDS:${PN} = "abseil-cpp"
>> +RDEPENDS:${PN}-lite = "abseil-cpp"
> This defeats the whole purpose of splitting up the abseil
> libraries. What triggered this change? Was it an actual
> runtime error, or were you only looking at the output
> from pkg-config --libs protobuf?
>
> Since the .pc files are in the protobuf-dev package, which
> depends on the abseil-cpp-dev package, all abseil libraries
> should be available if you are actually building on target
> or with an SDK.


Our customer reported this issue. Here is his description:
The abseil libraries will be included in the SDK, but not on the target. 
The application is building with SDK. The yocto build is adding protobuf 
to the image (no explicit abseil libraries are added). If an application 
then are built using the SDK it can not be executed on target as 
libraries are missing.


//Yi

>
>>   RDEPENDS:${PN}-compiler = "${PN}"
>>   RDEPENDS:${PN}-dev += "${PN}-compiler"
>>   RDEPENDS:${PN}-ptest = "bash ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-protobuf', '', d)}"
>> --
>> 2.25.1
> //Peter
>

