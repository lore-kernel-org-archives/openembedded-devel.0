Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B71D5F532E7
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 12:59:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19064.1774357185406353908
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 05:59:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YJlnwJPF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7543866fef=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O4QQh71225806
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=lupGPABsAHys0dgsto+K
	5yaqZuzQrxqNmqNrbwkCnac=; b=YJlnwJPFd0i3JnWXrZtncmUQ+4T5hsFIK01D
	JcdsPz1xPgJKpuvZkqbxykU4lqHg7B7syUQuyLyhjd4ZA0CwHG9hfBh1D7nICGAU
	5heH8l8kHqOwydTBkJ1A0z45H9KQiFPN7+k0jtD2A8ODzFCLusXmTYbjwhFGtP4V
	IngktscIYDsrF3lhFNtKdU0ShV3l0wYv0CFRyXlmfyINgQoolhnqUFIuXRbzRuYl
	+4PhQpZtPEiQeR64ssaEfswp/OnL/8T/QzAZDmSUbu/UIN7U6sz2G6l0ceqQV6l4
	JqjitFJw9nlRTXo7rod4eUnEUvq4UqxHgyZFNJWC52oWjSeYNw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012011.outbound.protection.outlook.com [40.93.195.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1gj83d7r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0qFNg7/0C3MECAiqJ3jcHgnpWWD6OKs2InRMp5Mzquk5KhkOC+1tKkY/0HSXNbchzuudAQIj6oCZi24/taZiaK0vPa96uxBQz1cRTNHq9UHs/XZHt21r+FhAQAn/aiJ0eO+L6AznIvCOtZHI4F0ekQQOGE+uOyw8qZ8cbNtmwxMwquEUorvXviUr+F3VcPJjeNt7aaUyhs/dKR9ucUW6T+CgxyK++1pR96ZgjIOVNOlNHpoDTFS2myvU1JUC9otB8y54TI61j0y1L0toKH5/yFrsLEF7y0j6GyUbWpTaKd9ZajXABh4Oj3Ct08Jd4jPZRLKbsY2BvzBxR30eo1yXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lupGPABsAHys0dgsto+K5yaqZuzQrxqNmqNrbwkCnac=;
 b=SSPNQIkKFdzLsC4T3+RjKBDGk6SJONcnSsRJxKk2b7MJCDE2odrMEJliEd6ghnJd8Q4Vjqs/njauEGPi66xLNhmELPeEFzpo/IFTec4xcRujSs1E9XhrL2UKTFugMcdy5uxjQZwJa4KGt+Caycx/ShDfiaqSjLbcNgKWSp9vaTJQly93+SA07s06F91JmMzkOw+QbTdAj4692HzOWXo1ozn3RmgwWrvJIBD6I73BVKKmiLrdQlbr0SdToS14MH4AxeUqCziCQ0koDOWVk06KOuqQzXzIQ8wGbQKExo6chxp2T+fD6ChEwSQFpkIVkLbQrceZMAU+VK+yU7+/9N/9Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS7PR11MB6128.namprd11.prod.outlook.com (2603:10b6:8:9c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Tue, 24 Mar 2026 12:59:41 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Tue, 24 Mar 2026
 12:59:40 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH v2 00/15] meta-xfce: upgrade core components to 4.21.x and fix cascading build issues
Date: Tue, 24 Mar 2026 20:59:12 +0800
Message-Id: <20260324125927.1070644-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0114.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::18) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS7PR11MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: 256e7b22-2aec-4155-da73-08de89a5362e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	5dEcRxz9tZ5Vpf1hZcRR5MWs7mUwkNQ5j7k7dEpsCFcIhb5Ud0bVnQ12d+8FTdd6Jjcl5Td+7FQpDpXpCDPsnj6vT3zGGXdcDczZDRSrhwoI//vC2QOddiDxm8g2INvpIFUaeF1rKlsBi89+mvlhc9Qwm8dH60RFDWHkaTj92rpGfDcs66lvzz3ZbZx3OPTBhsxv39LJRFseZeasymdDF3H0rUpRWLVEA1sYBTJac2wsg0iXYeLgqFuhLXGSJ0Hz5q2BH2LOWArKUkI6FUkAlu9Enn8wZCa0qfL5nwGgUUNDe+Z47J29Dp4wX0B/Iibhdd7aoBMir1BXR38OE8RWx5K3vcIYU6A0EaEG4yRYyDSFl+1d906JkVyhuoC8OTHY5h07OrJ6o6B6HjQ/PO4K0ekk0shTOrmcGHp/V1M0rZr+FvP8zg3aww0PklmMOFxeU0a3qcEmDzbfDlKAtZebI2UAnIummhDxhyDCjQ+CAeAY0HXY8Yc9M2hpJ01ZBt6cNVD47MIN8j9YImPRge8mBU9CMDrMJDrnQdvuSvsEkf7+HF98gkQqtRIdIvd4f1Gb6rlhINvZCeg5vIQz1kmpfvdnQkvk25b+axHYju0z0Rkr6ovlVbn4o41qTi5lLIavsOW6e8vZ2oJ3eY5XUlE19Tc4WjBoKxQgs3qJs/vq+dWNzqGmva0C4RaG7yRbMAa5BBzVoS2xymn+oy47rCu84ssHUuK/TUKRMWWToLadb38njLkaizaBcZabtGvCLNoq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b3V6MXFvcGVsZGhhUGl1RktEZDJXZ3l3akd3a2JDbUR1L3ZNS2ErWk4xZnJY?=
 =?utf-8?B?c0hyTTg3YStJSTNHMTM0SEZUdUtNSjFHTWxnWFVkb0JZOWFEWkhaTGwyY25Z?=
 =?utf-8?B?Y3RraDFhSXZCNmo0ZkdKanZYa21MNFduNlM1b0ZLYjg4NWxuM203N2Uzbkhh?=
 =?utf-8?B?Y1FSbVhWdTZ1MklYTzM2M3BGVmJXMUREbzUraW1RUzBJYjhxZ3dXRkpqdzd1?=
 =?utf-8?B?YlVqOG5hL3BHWGpCeVphTHNwTXRTYVFTUHowUG5pZ3IvYVQ3MnFTS1JoT2RD?=
 =?utf-8?B?UThGK3NoNnBUeWZCZHdPQy9UTXA5bnZOb3E5TXBidXBMazVEQ3Qvb0x2Q0Rn?=
 =?utf-8?B?K0pVaHJ1YU1YRzFqanZTd1RVOVZJV2doNHlhZ3hYaTVVT3VXYjU4S1dGdnFv?=
 =?utf-8?B?MGozcjA0V0ZPUzFGUmpwWDlGWGh3SFlMblpEbDlmZm1UWEIrblBpUmRRWnVx?=
 =?utf-8?B?SzhYaXZsenhlNGRGdEZTeDZXSlM3eWZFNHYzeGovdi9PM1VWc0E4VElQMzEr?=
 =?utf-8?B?UnNjSE85YjhCTndLbndUc1ZuSCtpbFFWbURqaERVd0FVa0pVaElxdTNWQWxK?=
 =?utf-8?B?RElBMmRLY2RmM3JMVlRVcGR3MitOVEdVZUZlZFhWY2gxSXN2OWdPMU82K0JD?=
 =?utf-8?B?YlM2U2czVE91Rmx5UFFYT1N6U0ZaY0NBNS9ySnFlVmUzbjRNT1pnSGF2eENE?=
 =?utf-8?B?bTZoaHlBdkFjdDZrRmgwY2NlRVQ3MHRJN1FqV0VqK3FXRTJwV01xME5zc3NY?=
 =?utf-8?B?QXU2dlVhT1dFVnp0YU9oT0x5Z3RNME80WXd0V3ZZR1g3NEVDTnBIcFpjZkY3?=
 =?utf-8?B?TDlCZmpiVWxVMzlVZm5QY1QyS2YwaFQwWWxMM3pSSjFMK1pXNVFKaXVKaUE4?=
 =?utf-8?B?S2hRQmRDMU9rQU96YVlqYXFyQUg0V3VMUHNydlFVVkRjNmgyN0hLb29ib2lZ?=
 =?utf-8?B?YTNYbW15RWk1T2xvRW1DNTVhTGJlMlE4UUlwU3gzcWxQN3Brc2pLM3lVV2xB?=
 =?utf-8?B?Z0E3N1FucTFnbWRzdzNjd1VwbUN1Qm5Pa2pheXc4cGRaZWFUOEF3R1ZreWdq?=
 =?utf-8?B?Yk1kZnlOS3c3K3JLbytIbXhNSDlFNTJ4VVlWL3JLZUVWOXpOYVdqcDVnRFh3?=
 =?utf-8?B?R0N6S2sxcTQ0T3k5c2UwTGo3dTEzdzdaMmd0MWFJOHYwMkhaWGpvYnhHN2dl?=
 =?utf-8?B?ZjZXSjJPOXZKbDI2SnEyYlJPSW14ZWd2YUZrM2pSc3gwZ25nWC9ObjIrUWdz?=
 =?utf-8?B?M3pkWlZaaksxdmQ2bURKODFEWm5PSmtMVjhIZ3NESk0wZmlVZmc4MGtkL3F2?=
 =?utf-8?B?SnM5K1NQcU1EKzNTWUxnaExrbjl2WUxjNEFhV1lPWldsVVF1d1I1V0tmWURu?=
 =?utf-8?B?b3ZrUmZKcm1LcUxIUTZ3dmJuemRnZzEvSlhnbVRUVnhjV2cvcmJtZ0Fia0pB?=
 =?utf-8?B?RGtBeTBHdGkzUDA5bndFWWFIRVZoaHRxN2tObDBNT1c4TjFQemFLa1ZhTmpD?=
 =?utf-8?B?U05zczBLMW0ybXVVbm5tdVhodFh6RFU4NUdvMkwvZndtc3laK1Bla1VzUEtH?=
 =?utf-8?B?Q0VPYWNpUVVzM1dyaUpJUGN5bmVKZ0l2TWxlZVJtVlpNZFNBZStJYkJVblJF?=
 =?utf-8?B?NFdCOFhZTjJUUzRjakF6R2k3dE1FbHUzaUdJN2ZlWi81c3QxdHRUSXR4Ylhw?=
 =?utf-8?B?aVoxY0YzNVd3NFQ2SXllNzRZYzBZVWpuWUdYU3FTcGl0YXgyekZibUF4SHFK?=
 =?utf-8?B?d2kzbGJaSDN3SE5nMEdkT2NkckZ0VXBrb3E0dUg1VWpGdWJZM1YybjRrQmZL?=
 =?utf-8?B?aWZqUnQyUnBnZkhCRjVveEVBZ2oySHA0Y0NuQ0F5c3hRbmJ1STg5dnBvK0NY?=
 =?utf-8?B?THBscDlUY3QzL00yRkUwMHVhdzBvOUUvOWtsY0krSzBqclRqMDY3YXR2RDll?=
 =?utf-8?B?dWNENkpxUHNkU1Y4WW4veGxBZkY2OHJvREF1Z2poaTFRWEw5Ui9JK0FIUGpW?=
 =?utf-8?B?NVJkWURsdWZXajloMXljaGc2cFU3d0FYQzhFUEV6NXV3U0xQUmQ0TkJPRG50?=
 =?utf-8?B?YzNmcm44RE5vdm9DcHRKS29RT012UlJqL2lwM3ZqaWJlNmNsRmVtcTloOHhs?=
 =?utf-8?B?cUJ4OWVPVjlmVEJCWmF5R0VFamFJYWdWVlpCR1R4VnBURGIxN1czNUxzS2tD?=
 =?utf-8?B?RmkwbE40S0NickZvT2ttK2VOVFZoaFZJVGtVY3BtenA2emZnd25UVzRpd093?=
 =?utf-8?B?MS9iK1pxTUN6TnJTN1dJTUVOYmgycHpFK2llRVdVMmtrUVJrVGpFdWZOaDVi?=
 =?utf-8?B?U1VuTkdBcjZOU2doMTVuamdDUVRrOU5KVEMybmR6cTFRMmJSM3h0cWxNdWZL?=
 =?utf-8?Q?f5bwTyuX0kkwGc5U=3D?=
X-Exchange-RoutingPolicyChecked: 
	pFAo+hwIAedVh2Vjc4Yu2i67srlOzNTGVQn7OiTj7wX/rBk/ByJVZoI+bj7LaDaIDfjCFhyr91heQw/kXzlw8WnFTklQ17/4V96hAPACyC+zS0NYHwxLPYJnW4+kN69/lBcxnnboUuAFkpYaVeVsxehOyffCdcnQV17ObE2aWpcQE+suVhNs2aoBCfffvc61PdR8vAOZWqpzHgsasY+c8lQeTwkgOtRh5u5HT+tSPgIVMqKbwDWVr+ef/RbhJyMDV05m0Du5CCtvsLvW4Gchfdw1Fd03Craqzix+jtiwZ5YbcJ1mOE+5aol14m7uMn4C/CGdBYZHNsTHnZyBAJy7ZA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 256e7b22-2aec-4155-da73-08de89a5362e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:59:40.7167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+FUMaru4B/p68hu+gxQxYz4A7xNCVK1omGYXMLX6Qi/Umf3F9m2YUJpoODIbTOPEwaDaGzARqy8KKhXDvB7SOkcijRLpH11j2jiLnU1pj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6128
X-Proofpoint-ORIG-GUID: zGdVt3LzT1a2wSjHw7Ci-0-rqUJ3waS-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMyBTYWx0ZWRfX7qSMve8+dzPI
 /uurMSqWoqSTRR+TkFlKKIKzHGcMA8W9ySHK2wfHJ0+2THc/N3ppZ98xm0KYLI9XhCyP4nVwILl
 vregmsP3ioh4J8RhY1q0UP7kD8qpXKPnu8IfG12Hem5VQ0uC9atOF+UjK/xOZLx6frqdvXI1umd
 xFKPouKJPw/N+BcE1VYEI+d88fUlysmKhVgh2Ol4+/nEyrHO90qlEDa3qCz7et30A0FiBSO0dci
 A6S344TKppoNmpzyLn1ug3h3PrctcMIAWpiE2nSPmRXmQ/8m536WcsYQdjNf1Tp0YTB08UdJvgO
 LRqWowmZj+KtFLSzCRcmzUVWnyZo9+DF7jdo7PKe+Ir/3zm9VQTdvOXEPSyFeBNq7aimQS3awZz
 kEtTvmZshO8Q8Ynw5KW8je2TqppT4foc+S3bIJw6eCt5sg1lB6mlGo4LTtPJPfwOTYZx6qGirc5
 8SBkD4v0rj0Ubt4JSbQ==
X-Authority-Analysis: v=2.4 cv=LtqfC3dc c=1 sm=1 tr=0 ts=69c28ac0 cx=c_pps
 a=ekzRQQX7ZilozLPATeYkEg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=H5Xgqx-34dbRE03u-v0A:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: zGdVt3LzT1a2wSjHw7Ci-0-rqUJ3waS-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240103
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125559

From: Zhang Peng <peng.zhang1.cn@windriver.com>


v2: Rebased onto the latest master branch.
 - tumbler: Include a fix patch that is not yet part of the 4.21.1 release. This patch was previously submitted to
the mailing list but has not been merged yet. https://lists.openembedded.org/g/openembedded-devel/message/124664
==========

Upgrade meta-xfce core components from 4.20.x to the 4.21.x
development series.

This patch series must be applied as a whole and individual patches
should NOT be cherry-picked independently, because of the following
dependency chain:

libxfce4ui 4.21.x moved libxfce4util-1.0 from Requires to
Requires.private in its pkg-config file, so `pkg-config --libs
libxfce4ui-2` no longer emits -lxfce4util. This causes DSO missing
link errors for autotools consumers that use libxfce4util symbols but
rely on libxfce4ui to pull in the link dependency. As a result, all
downstream components that depend on libxfce4ui must be upgraded
together, and several packages require additional build fixes:

- xfdesktop: switch to meson build system to correctly declare
  libxfce4util dependency and avoid the DSO link issue
- xfwm4: backport patch to add missing libxfce4util build flags
- xfce4-datetime-setter: fix link failure due to missing libxfce4util
  dependency
- xfce-polkit: fix link failure by adding missing gtk+-3.0 dependency
- xfce4-datetime-plugin: fix build with xfce4-panel 4.21.x API changes

Recipe upgrades (patches 01-10):
  libxfce4ui        4.20.2 -> 4.21.7
  garcon            4.20.0 -> 4.21.0
  xfce4-appfinder   4.20.0 -> 4.21.0
  xfce4-power-manager 4.20.0 -> 4.21.1
  xfce4-session     4.20.3 -> 4.21.1
  xfce4-panel       4.20.1 -> 4.21.1
  xfce4-settings    4.20.1 -> 4.21.1
  tumbler           4.20.1 -> 4.21.1
  thunar            4.20.7 -> 4.21.4
  xfconf            4.20.0 -> 4.21.2

Build fixes (patches 11-15):
  xfdesktop, xfce4-datetime-plugin, xfwm4,
  xfce4-datetime-setter, xfce-polkit

Zhang Peng (15):
  libxfce4ui: upgrade 4.20.2 -> 4.21.7
  garcon: upgrade 4.20.0 -> 4.21.0
  xfce4-appfinder: upgrade 4.20.0 -> 4.21.0
  xfce4-power-manager: upgrade 4.20.0 -> 4.21.1
  xfce4-session: upgrade 4.20.3 -> 4.21.1
  xfce4-panel: upgrade 4.20.1 -> 4.21.1
  xfce4-settings: upgrade 4.20.1 -> 4.21.1
  tumbler: upgrade 4.20.1 -> 4.21.1
  thunar: upgrade 4.20.7 -> 4.21.4
  xfconf: upgrade 4.20.0 -> 4.21.2
  xfdesktop: switch to meson build system
  xfce4-datetime-plugin: fix build with xfce4-panel 4.21.x
  xfwm4: backport patch to add missing libxfce4util build flags
  xfce4-datetime-setter: fix link failure due to missing libxfce4util
    dependency
  xfce-polkit: fix link failure by adding missing gtk+-3.0 dependency

 ...d-missing-direct-dependency-on-gtk-3.patch |  52 ++++++++
 .../xfce-polkit/xfce-polkit_0.3.bb            |   7 +-
 ...g-direct-dependencies-to-fix-link-fa.patch |  35 ++++++
 .../xfce4-datetime-setter_3.32.2.bb           |   6 +-
 .../datetime/xfce4-datetime-plugin_0.8.3.bb   |   2 +
 .../{garcon_4.20.0.bb => garcon_4.21.0.bb}    |   8 +-
 ...splay-full-path-in-generated-headers.patch |  38 ++++++
 ...xfce4ui_4.20.2.bb => libxfce4ui_4.21.7.bb} |  25 ++--
 .../{thunar_4.20.7.bb => thunar_4.21.4.bb}    |  12 +-
 ...here-there-are-no-plugins-gracefully.patch |  57 +++++++++
 .../{tumbler_4.20.1.bb => tumbler_4.21.1.bb}  |  25 ++--
 ...er_4.20.0.bb => xfce4-appfinder_4.21.0.bb} |   5 +-
 ...splay-full-path-in-generated-headers.patch |  36 ++++++
 ...-panel_4.20.1.bb => xfce4-panel_4.21.1.bb} |   9 +-
 ...splay-full-path-in-generated-headers.patch |  36 ++++++
 ....20.0.bb => xfce4-power-manager_4.21.1.bb} |  13 +-
 ...nfigure.in-hard-code-path-to-iceauth.patch |  43 -------
 ...eson.build-hard-code-path-to-iceauth.patch |  49 ++++++++
 ...sion_4.20.3.bb => xfce4-session_4.21.1.bb} |  12 +-
 ...splay-full-path-in-generated-headers.patch |  36 ++++++
 ...ngs_4.20.1.bb => xfce4-settings_4.21.1.bb} |  17 ++-
 ...gdbus-headers-are-generated-before-i.patch | 116 ++++++++++++++++++
 .../{xfconf_4.20.0.bb => xfconf_4.21.2.bb}    |  12 +-
 .../xfdesktop/xfdesktop_4.20.1.bb             |  12 +-
 ...build-Add-missing-libxfce4util-flags.patch |  59 +++++++++
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.20.0.bb  |   5 +-
 26 files changed, 611 insertions(+), 116 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/xfce-polkit/files/0001-configure.ac-add-missing-direct-dependency-on-gtk-3.patch
 create mode 100644 meta-xfce/recipes-apps/xfce4-datetime-setter/files/0001-build-add-missing-direct-dependencies-to-fix-link-fa.patch
 rename meta-xfce/recipes-xfce/garcon/{garcon_4.20.0.bb => garcon_4.21.0.bb} (68%)
 create mode 100644 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui/0001-build-Do-not-display-full-path-in-generated-headers.patch
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.20.2.bb => libxfce4ui_4.21.7.bb} (61%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_4.20.7.bb => thunar_4.21.4.bb} (63%)
 create mode 100644 meta-xfce/recipes-xfce/tumbler/files/0001-Handle-cases-where-there-are-no-plugins-gracefully.patch
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_4.20.1.bb => tumbler_4.21.1.bb} (63%)
 rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.20.0.bb => xfce4-appfinder_4.21.0.bb} (72%)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-panel/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.20.1.bb => xfce4-panel_4.21.1.bb} (84%)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-power-manager/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_4.20.0.bb => xfce4-power-manager_4.21.1.bb} (77%)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-configure.in-hard-code-path-to-iceauth.patch
 create mode 100644 meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-meson.build-hard-code-path-to-iceauth.patch
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.20.3.bb => xfce4-session_4.21.1.bb} (75%)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.20.1.bb => xfce4-settings_4.21.1.bb} (67%)
 create mode 100644 meta-xfce/recipes-xfce/xfconf/xfconf/0001-build-Make-sure-gdbus-headers-are-generated-before-i.patch
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.20.0.bb => xfconf_4.21.2.bb} (64%)
 create mode 100644 meta-xfce/recipes-xfce/xfwm4/xfwm4/0001-build-Add-missing-libxfce4util-flags.patch

-- 
2.34.1


