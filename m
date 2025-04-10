Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903ABC369A4
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 09:11:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.29859.1744276289955701233
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 02:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=61959408fd=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A3n8BR030929
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 02:11:29 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45u41m66t6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 02:11:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbGPg/CipDeft1Spj/Ih504TBJSIyFUfuMHXo5m9WzvvvBgf995Ebamfue1RLMIsRtjDbWTtcF98mRaq0wI6qkTggM3A0Cawa3b3n0xpa4cc7y6Y8cd3miWyYW9LHAUlUHgGnbjfupCnRy5uvNX5THcm5K8YL13k63/posIpsO1WyYHCVU3ilRl1gq3S8qOPaFsxOpt+3cAcoIlZTAeYDH8LOL7iRICg5RBLXZ4ooBdh6sNxEn12fe16lJdwie1/nR7I0pOQxi3kLWOk44duZ+ah9wqNXHf7LGqjUoXeJk+gEz7nTJtkLucHM+ifwmOqmC1ec6YN/Fq1VSv2WAcb5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q39tiAKBT3duqFXqMNay+mauRBuN/njqzDxyTpErMmY=;
 b=dU4KrYpHig6f3BDX3EzWpbDjj9TDACLye1BACbkV9LKJvd4+umCq8wxI9LKCFEXb5auI9J+BgP8gj/B/B2x3L3ZW8SJXrtKCBubLrKYGqLXi/9Fb3m2TRKiDCjAQ5Ftu3LsiQx0e+EQNJxRNvOqt91vfD+ysTaqZbuIcFnLnPSQtpI6Gzf+YVYzlAXaoOWXdowfC3AIh9SjnnL3mW0UebhJqqBGK52ZnVinS3Q6udNE2S08dbJ4LlIFiPE8Z8xJiGDI0O8sI6wjG0Mf5emoHAR2YTtwOCNV5LZy2/+uEkc8ikfqLXx+9h4cEIAbDjEHCarhqAlMw2+75zaLFm3Tx+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by PH0PR11MB5141.namprd11.prod.outlook.com (2603:10b6:510:3c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 09:11:26 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%4]) with mapi id 15.20.8632.017; Thu, 10 Apr 2025
 09:11:26 +0000
From: haixiao.yan.cn@eng.windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] lmsensors: Clean stale files for sensord to avoid incorrect GCC header dependencies
Date: Thu, 10 Apr 2025 17:11:11 +0800
Message-Id: <20250410091111.82723-1-haixiao.yan.cn@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCP301CA0082.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::20) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|PH0PR11MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c590992-ee82-46b5-7600-08dd780fac1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UDArYVdza01YMXlrYm9CblQ1c01KYkdpQnNtLzF3bXZOWFpFZlpLNk1ZMlR4?=
 =?utf-8?B?OVh3ejY1MVJYZjB1L1V2Qk1OR1NhelRheWpYTDdXdVllK3pzKzNrZVFMUUZn?=
 =?utf-8?B?KzJkbWJIcHdNanl4UE5oZFJwVHpXMlB5QlA5UElzZExROWRiUXM2M28xazd1?=
 =?utf-8?B?VWZVbW8wM29VcldwUzBSWWJ5RXpJeVBkNFlxNHJWTUVSVDNJcUkrOGRzUVFo?=
 =?utf-8?B?UCtZQkhPTG14NnYwMS9mQkttSFEyZGZCcnk5KzNpOEFOQUtsdlVaU2t2TzNo?=
 =?utf-8?B?S3ptMjR3UnBjYWxtc2hsa09HbHZSTVJjWllkeE50dUNhRURaTlJiSTFrRmlo?=
 =?utf-8?B?NFBpSDlmVzZKdlB3UjUycC9FODNOTUtkL09ldTlzdnpFZ21VbHlRMUIrdWQ5?=
 =?utf-8?B?N1kzV3Rtb0M4dS96TkFkWEY2ZmZCRUZFWWx4WkV2eUw0TDRUbUVWS1AyMHV2?=
 =?utf-8?B?YjFlaG9lY1VOVkdMZEgrR0xwZ1A0K0tZVVAyZW1EUWErWTlScjlBUUhGaHdW?=
 =?utf-8?B?bDVpKzJmSVRnSWxROGprdWZyVThTbEloMTdUR1QxQy9XeW1Oem85R0pBdUdM?=
 =?utf-8?B?Nk1pWVVwT1U4dHhmS1ROUkNXOVhiVFNacGhTVVR3a3U0ZlBxOXlqb2xIWXNP?=
 =?utf-8?B?eEM2aS94dDEycitaWmpOUlFzMWZRczdVOVh2NVBkVTcwWUMwRUE3dW9YNk1t?=
 =?utf-8?B?SVNLRU5VTDFGcnRxSjg1QUtGR2huVmU5R0oyL1Y1TjRLK1pZWStDb0FTRzhF?=
 =?utf-8?B?dmhiWnJzV0xnSDluL0RhNnlyYkVjTHFoM2N5ZHduN2RQWFROMjZISUtIRm5u?=
 =?utf-8?B?V3FPMHNBczh1ZG1WbTVnU3o4ZGtNdjFPTFcrLzhQdkxDdXpNSUpHSlIzRGEr?=
 =?utf-8?B?T2xwWmxVc2p2OGZlaldtaEhDTVUvYmJTYVRIa1ZCT1RYSFB1M090VDJIcXkx?=
 =?utf-8?B?dFYybVdvaFBFOG9BT0Q3MjFtNXpWd25ydDd3d0RKdzdsK0JYNVE1UzBkNDdo?=
 =?utf-8?B?YlFXdld2WVovajEyZ2tvS2FiL0RmN09tYmpVQkM1UVJzQ2RINE90QjY2ekNG?=
 =?utf-8?B?Wk1RaFhPL0J3TnZMZHZKVE9JdE1MN2hsKzVHRFRKdTVJZXdWMDJwT2lBclVY?=
 =?utf-8?B?NlhRMjJ3d1M2dkhqamoycG1SaWJ2YjBWQUt5MlhRT2JVNzRuZE92Z0F0aE1k?=
 =?utf-8?B?STd5c2djV1BldC96OHdLbS9oQmRlbkZHNjZnNFkvT0Vsc093MlprWlZPUWFt?=
 =?utf-8?B?a2cvQTRIcS9SaDkwb01lODJsZjdkR3dWWnZqMEkxblloQ25BQTNZN0Q3RWQ2?=
 =?utf-8?B?NjNDSENiRlpPY0R6a1FDb3pjYytyMlkrMm9WVktRSVVjR25TYklrU2t0S0Za?=
 =?utf-8?B?OFlnN3YwRzZaWVVXM2RuSzNmSVBvb0hCVG1pV0NkSnhleXlaRXJsQitjc3Iv?=
 =?utf-8?B?d0t0dFFzZVdrdGI5a3hHWEp3SXM5RTJadnlvdS95VURYMDFscnN3WnA4aFE2?=
 =?utf-8?B?OHlGWks3TmFMWFdTMFRLaUNndkJtQlpVeDlqVUV6R09CN1FqZ1BZajJCKy83?=
 =?utf-8?B?ZWN0VmwxZmxONkNEelhidTRRTTVJSHhXQmZEcmdza3Z5cXM3SUx6dUtZY1E2?=
 =?utf-8?B?TnlqK3JXVFNZQnRuM28wTmFNUlJRb1lhUUxkTUN5QVE3OGUrUWJOMXkrTk01?=
 =?utf-8?B?aVRyUTJYQWtNWFQxY0VPbFYzdzBBV2I4UStwYjFPcUZhdDNKYW1IY1IzbVgz?=
 =?utf-8?B?ZHg4bGNaRWFXdk9jM2xVY2txWUo0Z1JQTFdJL0VEc1VRVGV4VjZBWXhnekpp?=
 =?utf-8?B?d2ltT0NYZm9hZTdIRzhNZS9jMnAzcm5XQ0pGOEdvd04xa252clJENWczT0FN?=
 =?utf-8?B?b0hzUVNZeFFJMzlSMFYyRHlHbEsvVG5jcnZ4b1V5RGhnR3NodjNCUGErZmxK?=
 =?utf-8?B?L0NJbTJBZFB2NlJRNXZCVFk3UEVTTGJFQ0xrZE1LaFZkSFp0ODRGS3BJeTRE?=
 =?utf-8?B?VXlob3FvTGFBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cEc0NkVUbk9SNG9ySndWakRLci9GSTY0dVlMZmpqVnFpR0dNYnNlQ3IyRlRJ?=
 =?utf-8?B?ZWtpT2pUelNMTUZ6bmZ5MXVzQS9KQkdITzdpd0NSZ1czUDVyR1RxTHkvd1ky?=
 =?utf-8?B?clVvREI1RG5GYUZCNXhkMGs5Z2JDRlNJZEJrb1krVlY4Ym5sbk4yaUdGYjIz?=
 =?utf-8?B?empFOVV2ZS9LRTFVV1BVdWttL21wRG5YVzNpcS9YVTRvbkVVaEZadmQySEZG?=
 =?utf-8?B?aXFpMmtBcThQalN2b1JLN2EwQ2NSU3kvc2NRbTN1MDFTR256bDZvaGFFSDN5?=
 =?utf-8?B?cklRYUpzRklXWmRuSnFyMlB5MldJeklWNUc5cDVGNDZJSWNzUlFuRFRoYzRN?=
 =?utf-8?B?MlBNSUFScHlVUkZYeXVyMWg4aEN5Q0dYTjYvZ1RPK2N3SmNwUDBmam4wVGVu?=
 =?utf-8?B?YmJ6ZEkrcGtSYVFadUJsc3dha29Cc2dEdXBrQzF5bmpDQlZPcmZGeHJFbTRw?=
 =?utf-8?B?SWR6MDZHQ2c4S0RzQ0FSTGdyODlIVjNCWGJzUmtXNXhpOXF6cFJRVVZBTEZv?=
 =?utf-8?B?TDFSaEs1SFZyc2R1MElNREg3azd1UjRaM25mcmZXc1k2VHJiSlJuSS94RVo2?=
 =?utf-8?B?bi84cjMrUzVwaWg3OTZYSzRUVysreFlKL2dpMFlqNmNycVFKZFR2Z1BOQzlH?=
 =?utf-8?B?VmVJb1l1dGpsZk9hemEvMzAzR3h1NVNZbGNJdDd2TThzbnVRR0UzVUlJdVpX?=
 =?utf-8?B?Nmg4Tnh2bE4xZ1pBMkZxZ205TUFZMm1lbjlhekhRL2g5VFRGZTN1Rm9jc3Zy?=
 =?utf-8?B?RDVjQkg0a2NrUWZMQkd2V0cvM2dXZUZOcThGcy9Md25vMzNJY045R3E5dWpw?=
 =?utf-8?B?OTcwQUh1VzF5T0JvYXp3Q2ZGS2JzQ09BTmhNSVliUGR5RDVLUmYwN2xCcWFl?=
 =?utf-8?B?R3FwY3VPUjJtclNKTnY0M0hSQVFESjZjOGxJcVZpNzQ2L0JQWm1iWVZtYkJ6?=
 =?utf-8?B?RElrUTJ6TUxya2k4Nm5HcUk0MVI1ckdERHEybVQ2WTdINkdFWi95RGU0Z2VE?=
 =?utf-8?B?QlZrWHZRSmZ4eGRrNlROalZMR3pNa0pWckZ5T25jdGQwUnc2UWpNeExjWGRz?=
 =?utf-8?B?OElhanZmRFppSml3TklieHZiUDRaN0lYS0RJY1h4c2E1Ujl1ZnhOUU9hY29u?=
 =?utf-8?B?Q0pNS1Mza1ZNRnZ4QUxSVVl0RW1LK3gzWTNRK0ZMblFXditWOGRLeDJPbVJW?=
 =?utf-8?B?ODJFMkJ0em4yV1N1T1cySUYrbDRyTEg3RUppVkozcUdNSjJyU2VKMzBmbTRn?=
 =?utf-8?B?cVlxVnMxRE5GQW9tYXpDV0ZJWnRVNEllMEVlV3BBczJBdUp0QjRkSzBBcnpw?=
 =?utf-8?B?SEx3Uy83N1VHTVBEaGpsWUFvRThucVYxSHFMWDJTM3Y5OW1yWks4cWg0M2xC?=
 =?utf-8?B?T3JyQVl3bHpERGFjbHFoTVJQeks2U2lmL1ZWY0lNL0xSVkN0anUyWkNkc2hn?=
 =?utf-8?B?L1NBNUtTeWU0Z044eTVVTnhMRnVpTFQ5RUloREdVZ2k5R0l1Qi9qZS81Sng2?=
 =?utf-8?B?Q3NtYnNSSDVHWHNqbUpLUm90cmppWGtENERsTHIvNE1Wd3VnbmNtY3o2VUtw?=
 =?utf-8?B?Q2J0NkRGa1VKdVBkdWlTSTZVRFZ4OXdYQ0U1ZXZ1TzVlcUNSV0xpbmR6dkVr?=
 =?utf-8?B?YmVSZFM5ZHJGVGpYQzM1djJDbFlGWVk5MHc3TXRGKzNPZUpJQ3pINEdTTmdF?=
 =?utf-8?B?SXJWNW1TRUZEUGo4TFJSNzZCbjgrdVRacFd5UFZlMU1nKzYrUi9OTkw0eWRr?=
 =?utf-8?B?YVpjT3UvRVpORUlwaVNVZUdSQmhxNWtwbE5WQjFGcW5xdWlPc20zeDBrcHJW?=
 =?utf-8?B?Q0ZGdE51cnNWYmI2bERVRERaT3FpNDlwNTJHVWI3TWF2bW5xUVNxR1ppQVJH?=
 =?utf-8?B?NklQOVZjL0dMbUMwS2ZLR3BPUjhxM3poVG1scHN0VDF6NURZeDlFNHgzU3Yw?=
 =?utf-8?B?b0x6NzlrUFJjMy9uRGNhSmZkSk10TFZteHZ5WU52dCtWQytCclNUTURMOUM1?=
 =?utf-8?B?R1V1OExxNytneEJ0b1RweklNaU94S0pvR3l6UUJ2L0szQXQyV3JYejgzbVdj?=
 =?utf-8?B?VW81MCt6ZDBiNXVPeHZDQ2hreS9ORjFGTzJaMHdoS3RaZjN3bXJLSXBoQldO?=
 =?utf-8?B?TmVGdEo5TUV6VDhZdloydDhWc1dUMDI0RlFVQURZdTk0ZU9STXNtbkVBcHg5?=
 =?utf-8?B?cVE9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c590992-ee82-46b5-7600-08dd780fac1a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 09:11:26.5798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cwKEtPeBdbR3eiNjthI46le9SSJeHL5UX13/BHEdS1HqbO31uuKZYOC2DGp1Jb4ssxWVvfY0QV0MVjh0NlOcGKrt3RIS1LBOGJq63vUY7Zs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5141
X-Proofpoint-GUID: hRRIlVD4rNGKQdOxOHjj-uxffqs3oIWn
X-Proofpoint-ORIG-GUID: hRRIlVD4rNGKQdOxOHjj-uxffqs3oIWn
X-Authority-Analysis: v=2.4 cv=QOZoRhLL c=1 sm=1 tr=0 ts=67f78b41 cx=c_pps a=MPHjzrODTC1L994aNYq1fw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=AJs-ryozdUd9o3ahdBkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=751 bulkscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504100068
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53A3n8BR030929
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 09:11:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116765

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

After upgrading GCC=E2=80=94for example, from 14.1.0 to 14.2.0=E2=80=94bu=
ilding lmsensors that
was previously compiled with GCC 14.1.0 may fail with an error like:
lmsensors/3.6.0/recipe-sysroot-native/usr/lib/x86_64-wrs-linux/gcc/x86_64=
-wrs-linux/
14.1.0/include/stddef.h can't find, which is needed by 'prog/sensord/args=
.rd'.

This occurs because prog/sensord/args.rd still references stale headers f=
rom the
older GCC version.
The root cause is that stale *.rd and *.ro files under prog/sensord are n=
ot
properly cleaned during do_configure. This patch ensures those files are =
removed
to prevent broken dependencies when GCC is upgraded.
Also remove the same statement in do_compile.

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/=
recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
index 07027225c58b..9b072d70b20e 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
@@ -51,8 +51,11 @@ EXTRA_OEMAKE =3D 'EXLDFLAGS=3D"${LDFLAGS}" \
         LIBDIR=3D${libdir} \
         CC=3D"${CC}" AR=3D"${AR}"'
=20
+do_configure:prepend() {
+    sed -i -e 's:^#\(PROG_EXTRA\):\1:' ${S}/Makefile
+}
+
 do_compile() {
-    sed -i -e 's:^# \(PROG_EXTRA\):\1:' ${S}/Makefile
     # Respect LDFLAGS
     sed -i -e 's/\$(LIBDIR)$/\$(LIBDIR) \$(LDFLAGS)/g' ${S}/Makefile
     sed -i -e 's/\$(LIBSHSONAME) -o/$(LIBSHSONAME) \$(LDFLAGS) -o/g' \
--=20
2.34.1


