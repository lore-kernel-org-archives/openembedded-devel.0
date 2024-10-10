Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DD8CEDDB7
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 01:59:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.34114.1728525550444384832
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 18:59:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=00130c5401=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A0EWpA024568
	for <openembedded-devel@lists.openembedded.org>; Wed, 9 Oct 2024 18:59:10 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4234ykvsdn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 18:59:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4qk1QondzfGTt676eXn3uQewMfdh5PvWZ1r+MR/v6r8ytu18gbdc/GS+8i3bViRNG4XqpJ7UnJdnEiIjKriOc9dk8GeKdsWg0eO2dtqVRMI5jgTwxpf0tk5L6oSap/QdUFkCPzSlbqLSdwXchBSS4Z+Z/CQ5oN5DulTWAZzLuQWzWBQQLNvg+hhtFFwVhB8jZINW7ZiN0zC/Fh/Mmjk7zfRYEqCvT6PZ2ZKepn0O0cX79sgS200lF9HiKgE4iHTJwPAONqTT7aTtMvr8QKbZNZcZpfdLVZgCnXEzc3/QJQGK8dCF+q1INud/UKI7M7rIHk6iOIGZSBIoug9xDro2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qywF3CQpWECO1ef6SW2Q6KFMlGxaCIYLr/aF/HKcuv4=;
 b=eK7qgcFj5nNxCQ3/0FXINWJP6N+dm5tAZBzncoJGm6EdYHcGI002vK1ZC/xoRBuo2wHavxNU3LiR199a5yAsY+bg5MsRDW8XfK95iKKphBsQe5orgogLDtU95K5rbz5Tnb2TJSHwB/uheM1BSVraMCS6uZBFNMkGgYAKP/L+2W8L+zTIfRGQJ1q64WaV1jSByY1Hl6ZDCq+n8HMuOyrlBGM1TAA0ayIGs7HEh1CGmTvI6t7wlHotNK6bVol70jrcuHFg7JeMPF/hx4X2gwRqfxvZJWVwtZWu9lOo+NlyYr1YB3VTCsSv5i2OWy14OuIZLF1y7vtt8c0kvjF9+ML4Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA1PR11MB8491.namprd11.prod.outlook.com (2603:10b6:806:3ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Thu, 10 Oct
 2024 01:59:06 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8026.020; Thu, 10 Oct 2024
 01:59:06 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2 V2] redis: upgrade 7.2.5 -> 7.2.6
Date: Thu, 10 Oct 2024 09:58:45 +0800
Message-Id: <20241010015845.4140358-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241010015845.4140358-1-yi.zhao@windriver.com>
References: <20241010015845.4140358-1-yi.zhao@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCP286CA0092.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::10) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA1PR11MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: 486b5251-d933-4422-471c-08dce8cf1e9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Q2dkcmZpVUkrRWVmNE9NbEJORUZuUHlQSFFTa0I5bmNESEY0WXVqNXpDSFFp?=
 =?utf-8?B?RllmT050MEt4SmJ5YWt2SXdMNHJVWFVvQXAyVWZ2WVhibzRVdkJZdHZXdjdY?=
 =?utf-8?B?eGwzMjR2MFgxNUxCNTlHNG1EaFh2a1dlYlpjTkovR2FxeWxuajZ2TGxXQWZR?=
 =?utf-8?B?R1BoZ3FjT3oyMXl1b1FTa0JiSjFuekNPaGswS2J3cnp2UDQxQmYzSTRpbzd6?=
 =?utf-8?B?bWtnUTZNRDVQL3U3MnpYaHVVZWZ6STVtMG1rbDlIOGQvM00zT05xOHhYazJJ?=
 =?utf-8?B?b0pBNlpYd3o5Q05UVHdlcEU1S3JGKzRBWGY3SkJ0b0pHdm9hemZSNHo5V3lL?=
 =?utf-8?B?aGFNWkVqTnhreStQMkRtaWtlVDVkdnZMdnUzS1VpZWJQeEE1OTJVb2NMWXA5?=
 =?utf-8?B?cDJyNk9CYjhlRnZlU25mMElIYjlqZkJVUnZWZ3B4bk1TNnZmSEVmNXY5WFNB?=
 =?utf-8?B?WG5ITWFNU0FGcjdGZGd6ZllYU3ZLNlNCTzBxZFFZYVVFbmNvd3k1ZUZoNTJk?=
 =?utf-8?B?UG5nbmdmVGpqTk1Kamt6WUFOSzBrU3dpZVZqVy9hQWxvdm55bm1ZeWF2bnlF?=
 =?utf-8?B?M08rYkdZTXdPVG1EZUpxMDlkbGlQdDFkUkpjUHNFSjMzbjR5QTVZMjYrNHlE?=
 =?utf-8?B?RE4wV1JrQkN2YlZBa1ZzNE50TUEwenM2Q3JyU0pMQU5ILzB0bi9sKzNyMnZK?=
 =?utf-8?B?WTA1dXFGWnRpbm81VHFPOTUwd3Foc202TG5YdFFyQUxMdTBIOGhaT3VGYVhF?=
 =?utf-8?B?UUUwc2lkMHBZUmM2SHd1T2RpQnBGUDkvaTBFMXBHVG1XNGw5b3YrbnZaTmNU?=
 =?utf-8?B?cUtoK0JoVlMwZ0hrQWk1Skg3NkVRYjNsZlpuaHcwT3l2bFhDTVpOeThjWEJP?=
 =?utf-8?B?djVxRldkbTlDWUUycDRrbTVNVm8raUx2OFNlQ05RTW92dWdUMXB4RVRYZkdv?=
 =?utf-8?B?d3c5eHpZdFFYbUM0ZEFDRUdOU2JURXZiWjRLWEkrQlZRR2Z0ZlZoQU5RTWZ1?=
 =?utf-8?B?RlRxYWpuL2ZVbWZGSnptUE9jYzRLZVNxL01sYzJZcmREWDk3UmVKTnhTbFdl?=
 =?utf-8?B?cTBkN0doVGlEakx6bjIxUWJ5RVExTGxJR0xtRXRabzgxNWdYY3Z1SW9nUks0?=
 =?utf-8?B?eW1LUkMrNkU2Nk5oUGZxeXk5cmNaK1BuMGNZWDhRVDRlakE0UUJxRkVmWit2?=
 =?utf-8?B?aDhVWW1RNGRCeXRBZG9wL1NmcW1ZSmpueVVoeDVlTTMwaXJGYys2MTlFdHFt?=
 =?utf-8?B?UGlQUDFycUM0aVYzTm5XbXZJV2R4L3h2VmtKazRtU2R0VjVxYmN3RGs4NU13?=
 =?utf-8?B?RnYwU1NWZE81NXcrL0xLcHhpNkNFOC9ob3owenVWbSt3aWo5QThyUmFZdmNQ?=
 =?utf-8?B?OXN2N0xKVDFDSUZmMUl0dTBpMDExWGIwMXc0QXd2T3cxWS9OQW8zWGJ5L1lh?=
 =?utf-8?B?RmJ5TitrVEJmb1Iva1FOYk5tNzZ3dzdMNnBIZzRwNmUvaHJ0NVdlMjF4b2tX?=
 =?utf-8?B?cjRJUTNwMmNVNEJoZ2lKVU9QbDZkVklJdHpDTW13VVFNYXA1QXdaMTZwZnVL?=
 =?utf-8?B?UzIwVjhrMzJqTTM2L2Rrbm9LdkVCVWR0T2ptRGd6N1dEM1VOZFJDcHg0dXdY?=
 =?utf-8?B?TGxoS3VuSHRBbS9BV0xDS1h6cU90R0hsd0pCcjA1QzhxTlAwT2xNNTlMZkx5?=
 =?utf-8?B?UGJWeUZZUlJLa254M3E1VHpPdVBRTlNMTGhUcTIxNG01RG9ic2s1bXhBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TFlLSGRCR2ZaWWNFTTFEdkZJSWt2OWc5K1VMK0hpNWJVS2s4T3M5YXJoaGZo?=
 =?utf-8?B?ek90VHoxNlBqVEdCRU4weDR5YTVSTC9NNVpyTlhCeHd2MnNBbFp5N3N0TmFO?=
 =?utf-8?B?WDBuQzJPYzdCQ2RaT3hnM1BLWFlGRnV2N1R1TEg0SjNWZk0zOVBuejlCaTky?=
 =?utf-8?B?SUs5bTZiajNPc0g3ZXpQTGdCRElzNkJqWE1BV3prbmRXamRGd1VGZEtGRFky?=
 =?utf-8?B?TGE0WjJMUE8yWFNzUW1IYkVOV2R3Wk1ia2tiYUVNRXRyMkozVVhVTjZUVVdV?=
 =?utf-8?B?Uk1yZHpZT0pYKzRGSy9tczNLbGdnY0ZGUjlQUzB0QnVOem5ScWNWak9xanBX?=
 =?utf-8?B?c0NyTnEwT09yNVhSdHUrNG1UYkRGUzN6Yzhoamx0TFgzMkZKNUgvNnkxWU9H?=
 =?utf-8?B?TS9XNlBlclBDQzBtNmxxUExpY1pNQ2c4bG5DeUl0VUdYYlp3RXJyWTlNYUhx?=
 =?utf-8?B?dFExOTlBTFEzcndadXZUd0JpOG5QVTg0MlN3d3A0cjhuNE9EZTFncU1heWxE?=
 =?utf-8?B?MW1DaUQyUzNCR2xtRERtOTk1WkxBdk1zTG1xK2RaNnRvNDVxUnBQK21HSGhk?=
 =?utf-8?B?bzRiVklTN3hzWXdhcFNZTHA2ZG9xd1VvR2tNYjBzbmJHMEZSanVmZGlheVJ4?=
 =?utf-8?B?UmVDbk5kMEczZllzTmVaRC9aNzJGeVIrM2VEQjkreUtlbzI3Rnd1SHhYc2lV?=
 =?utf-8?B?NE5vbGlJdm1wUjZlZk9wL2JDSk1ISmw5VUZTRGpuSy90MXptM1VNclE4QzND?=
 =?utf-8?B?WjFWaUVBeURYbEhWWnpmalc0TlJweEw1MU14ZUlGUWZKTHN4MldpdS8vTHhH?=
 =?utf-8?B?MXl4T1BXZU1oNkJRSzhFT0ttUmRSSU9HeFFOQnVpYzg1ODBPNnBhN0h4U1pL?=
 =?utf-8?B?ZkRQbzhKUk9kN3BobU1MYmRqZHVQMTArckVSSlord3NxVGxQaThycUJRQm8v?=
 =?utf-8?B?WGpDNXdJbkJuM0JtQzhyRk9GaTIvaUI4eG9zS2Y2OFlIWXRtYXdwS0Rka0dU?=
 =?utf-8?B?WXlYdGpuMkxhWmdMY3crSFBXZllMNkJxY01OaEFzRjRvSDNXMlNjV1YwUWlY?=
 =?utf-8?B?VkgxSXlnRStyVytaUG4wWDI1M0habGVINEpGbDhPOGhxWk4rcHF6SUhtQjF0?=
 =?utf-8?B?K0E4TVQwNy92ZUxUOXEva0ZlVFBFM2w1N0JyVmFTVXRxTzAvMy85dmZlRUhI?=
 =?utf-8?B?K0loaGd1YXhRL2tTT0lsUjRYVnMraEdEbDc1dHQ2aTdnMTEvOXRXTEdBbXFs?=
 =?utf-8?B?dnk1eVNWMmI4anE1UGhlcGsyTFVuTGFCQXBvK0R4RnU4dy84M0MyMWE0Z25Y?=
 =?utf-8?B?cGZyc3J6WWNKdVJjeDVGWGpLUGdiYzFuTXhMZHVqN01ybGw5K2VTVEpjMWxL?=
 =?utf-8?B?ZnBrb0IvdTF0U2F0OW9TeDhUdDNIT0hRQndDVDZnamJSTVRtTW5zZ0w2K1pU?=
 =?utf-8?B?bndPRzhybkwrRWxVSGZZY3hlaFlraHVVQ2k0OHNTNGsreVFNaEJPeVAyU1l1?=
 =?utf-8?B?OGpvcnpFRmRsZ2ZMb2tyNHlTTEpGMk9OWlE3MkxRdk9FMzZ6Y3dJcTRhWkFs?=
 =?utf-8?B?bW9SdVBiOURJbW0wNzg1S3VwR2FwanJ2elFIU0dzaFJjeEhnNkxFZEhFZ29j?=
 =?utf-8?B?cDZGd1BFYlo0M213clF6aGpsRFlHd1RVd0gwMFFnOXcwVnR5WnFjMEkzWDZz?=
 =?utf-8?B?YXNrQVppck1KeE1yaFY1TXdhZ0U2bFY2RnlKaks2ZTYrNlIySTh6Nk1JZTBr?=
 =?utf-8?B?OWVIait6ZzhpdU05VkhtRlV0V0psWkFLSGNweXZzRThpZ09yWjBYU3Q1WTVV?=
 =?utf-8?B?RXJqVkl3RzNLajh2YzN5RWZQT01PK3ZUd2hhSWc3YUI5VFdVWm1zWTZVQUF6?=
 =?utf-8?B?T2dvUWVKR3BxMzNOZVdPYWRKVkgwRGErS29aOE1ZRlgvcXZTUVV3Mk1iamhR?=
 =?utf-8?B?eWNDcTBvQXo3OTg1YjhiTUtudjdwY3NlUXJ1UFhhbU5JVlV3WGFuSHJWKzN6?=
 =?utf-8?B?bnppZStCNmhhMVRTS29WYkpIMTByaHZmRnVydFBIM0J0cDUxREZjZ1JLcm16?=
 =?utf-8?B?bGNzMnJ2dTQ2dVZ6aTZvK1poNjMvcFpkb0lYQnhSb3U5Z2tHc05vN0tiazhY?=
 =?utf-8?Q?TpfP6l8Gw82EzNPfhTn2Zq/QR?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 486b5251-d933-4422-471c-08dce8cf1e9d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 01:59:05.0864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wNTM2XI6CdOXbGtf6VmCtAdtb7J1T8yxuwqxqggBVfaTU/1JuYUmfGcgYWnJDPvAR5CgZpZl4ox9k2RzBudojA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8491
X-Authority-Analysis: v=2.4 cv=AKB5nO5v c=1 sm=1 tr=0 ts=670734ed cx=c_pps a=zz2QubYGG/9FVtTd3zWqHQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=1KubnttrAAAA:8
 a=JF9118EUAAAA:8 a=pGLkceISAAAA:8 a=7UKGVgRVAAAA:8 a=szgukyCE4hRqUtCBftgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=H0t3PWKhy-h45uLjrunQ:22 a=xVlTc564ipvMDusKsbsT:22 a=8Ox4Rr8FuIIqx5qz5MW0:22
X-Proofpoint-GUID: wZ68tSn-M4e0ONxrlq4u6ODxjvPDzbRc
X-Proofpoint-ORIG-GUID: wZ68tSn-M4e0ONxrlq4u6ODxjvPDzbRc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_23,2024-10-09_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 priorityscore=1501 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2409260000
 definitions=main-2410100011
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 49A0EWpA024568
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 01:59:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112755

ChangeLog:

Security fixes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* (CVE-2024-31449) Lua library commands may lead to stack overflow and
  potential RCE.
* (CVE-2024-31227) Potential Denial-of-service due to malformed ACL
  selectors.
* (CVE-2024-31228) Potential Denial-of-service due to unbounded pattern
  matching.

Bug fixes
=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Fixed crashes in cluster mode (#13315)

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
V2 change: fix build on riscv2

 ...1-hiredis-use-default-CC-if-it-is-set.patch} |  7 +++----
 ...file-to-use-environment-build-setting.patch} |  6 +++---
 ...0003-hack-to-force-use-of-libc-malloc.patch} |  7 +++----
 .../0004-src-Do-not-reset-FINAL_LIBS.patch}     |  4 ++--
 ...URCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch} |  6 +++---
 .../0006-Define-correct-gregs-for-RISCV32.patch |  4 ++--
 .../init-redis-server                           |  0
 .../{redis-7.2.5 =3D> redis-7.2.6}/redis.conf     |  0
 .../{redis-7.2.5 =3D> redis-7.2.6}/redis.service  |  0
 .../redis/{redis_7.2.5.bb =3D> redis_7.2.6.bb}    | 17 +++++++++--------
 10 files changed, 25 insertions(+), 26 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis-7.2.5/hiredis-use-default-C=
C-if-it-is-set.patch =3D> redis-7.2.6/0001-hiredis-use-default-CC-if-it-i=
s-set.patch} (95%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.5/lua-update-Makefile-t=
o-use-environment-build-setting.patch =3D> redis-7.2.6/0002-lua-update-Ma=
kefile-to-use-environment-build-setting.patch} (97%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.5/oe-use-libc-malloc.pa=
tch =3D> redis-7.2.6/0003-hack-to-force-use-of-libc-malloc.patch} (94%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.5/0001-src-Do-not-reset=
-FINAL_LIBS.patch =3D> redis-7.2.6/0004-src-Do-not-reset-FINAL_LIBS.patch=
} (92%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.5/GNU_SOURCE-7.patch =3D=
> redis-7.2.6/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.pa=
tch} (88%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.5 =3D> redis-7.2.6}/000=
6-Define-correct-gregs-for-RISCV32.patch (97%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.5 =3D> redis-7.2.6}/ini=
t-redis-server (100%)
 mode change 100755 =3D> 100644
 rename meta-oe/recipes-extended/redis/{redis-7.2.5 =3D> redis-7.2.6}/red=
is.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.5 =3D> redis-7.2.6}/red=
is.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_7.2.5.bb =3D> redis_7.2.6.b=
b} (82%)

diff --git a/meta-oe/recipes-extended/redis/redis-7.2.5/hiredis-use-defau=
lt-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-7.2.6/000=
1-hiredis-use-default-CC-if-it-is-set.patch
similarity index 95%
rename from meta-oe/recipes-extended/redis/redis-7.2.5/hiredis-use-defaul=
t-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.6/0001-hiredis-use-def=
ault-CC-if-it-is-set.patch
index 7785acca5..63bf40341 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.5/hiredis-use-default-CC-i=
f-it-is-set.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.6/0001-hiredis-use-default=
-CC-if-it-is-set.patch
@@ -1,4 +1,4 @@
-From 41efa2f0cf08c91ff935bbb2d16ab233df7f5811 Mon Sep 17 00:00:00 2001
+From af4fc632c03b2a68be4206b4896f27fc4bb865ae Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Fri, 8 Feb 2013 17:39:52 -0600
 Subject: [PATCH] hiredis: use default CC if it is set
@@ -9,6 +9,8 @@ Content-Transfer-Encoding: 8bit
 Instead of trying to automagically figure out CC, which breaks with OE
 as CC has spaces in it, just skip it if one was already passed in.
=20
+Upstream-Status: Pending
+
 Signed-off-by: Venture Research <tech@ventureresearch.com>
=20
 Update to work with 4.0.8
@@ -16,10 +18,7 @@ Signed-off-by: Alistair Francis <alistair.francis@wdc.=
com>
=20
 Reworked for 6.0.4
 Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
-
 ---
-Upstream-Status: Pending
-
  deps/hiredis/Makefile | 2 --
  1 file changed, 2 deletions(-)
=20
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.5/lua-update-Makefi=
le-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redi=
s/redis-7.2.6/0002-lua-update-Makefile-to-use-environment-build-setting.p=
atch
similarity index 97%
rename from meta-oe/recipes-extended/redis/redis-7.2.5/lua-update-Makefil=
e-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.6/0002-lua-update-Make=
file-to-use-environment-build-setting.patch
index 20708eda1..46330f506 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.5/lua-update-Makefile-to-u=
se-environment-build-setting.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.6/0002-lua-update-Makefile=
-to-use-environment-build-setting.patch
@@ -1,4 +1,4 @@
-From aa3d31355f3cc140b1dc2f4fcff8e3c0aa261549 Mon Sep 17 00:00:00 2001
+From 45ae5eb5c3482054073e06ab1a78e0aa9b96447f Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Fri, 8 Feb 2013 20:22:19 -0600
 Subject: [PATCH] lua: update Makefile to use environment build settings
@@ -6,6 +6,8 @@ Subject: [PATCH] lua: update Makefile to use environment =
build settings
 OE-specific parameters, instead of overriding all of these simply use
 the ones that are already passed in. Also configure for only Linux...
=20
+Upstream-Status: Pending
+
 Signed-off-by: Venture Research <tech@ventureresearch.com>
=20
 Updated to work with 3.0.x
@@ -14,8 +16,6 @@ Signed-off-by: Armin Kuster <akust808@gmail.com>
=20
 updated to work wtih 6.2.1
 Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
-
-Upstream-Status: Pending
 ---
  deps/Makefile         |  1 -
  deps/lua/Makefile     |  1 -
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.5/oe-use-libc-mallo=
c.patch b/meta-oe/recipes-extended/redis/redis-7.2.6/0003-hack-to-force-u=
se-of-libc-malloc.patch
similarity index 94%
rename from meta-oe/recipes-extended/redis/redis-7.2.5/oe-use-libc-malloc=
.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.6/0003-hack-to-force-u=
se-of-libc-malloc.patch
index 7b601e02a..1f97f9783 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.5/oe-use-libc-malloc.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.6/0003-hack-to-force-use-o=
f-libc-malloc.patch
@@ -1,4 +1,4 @@
-From 38a5f403b033d03cdac3ff814687d83f61527d8e Mon Sep 17 00:00:00 2001
+From 7a98e3ac480413ce7db3a5edd5dc70458b921b29 Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Wed, 6 Feb 2013 20:51:02 -0600
 Subject: [PATCH] hack to force use of libc malloc
@@ -9,14 +9,13 @@ removed in favor of magic.
 Note that this of course doesn't allow tcmalloc and jemalloc, however
 jemalloc wasn't building correctly.
=20
+Upstream-Status: Pending
+
 Signed-off-by: Venture Research <tech@ventureresearch.com>
=20
 Update to work with 4.0.8
 Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-
 ---
-Upstream-Status: Pending
-
  src/Makefile | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
=20
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.5/0001-src-Do-not-r=
eset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-7.2.6/0004-s=
rc-Do-not-reset-FINAL_LIBS.patch
similarity index 92%
rename from meta-oe/recipes-extended/redis/redis-7.2.5/0001-src-Do-not-re=
set-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.6/0004-src-Do-not-rese=
t-FINAL_LIBS.patch
index 01e53e3f2..974cf5169 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.5/0001-src-Do-not-reset-FI=
NAL_LIBS.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.6/0004-src-Do-not-reset-FI=
NAL_LIBS.patch
@@ -1,4 +1,4 @@
-From d9d1f9a501ef7caa80d1e6595218898e9989ec2b Mon Sep 17 00:00:00 2001
+From 50fc46a12f6cf97e7b927d3ea29eecc9ebdea34d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 10 Sep 2019 20:04:26 -0700
 Subject: [PATCH] src: Do not reset FINAL_LIBS
@@ -9,8 +9,8 @@ environment to get it going
 e.g. -latomic is needed on clang/x86 to provide for 64bit atomics
=20
 Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
=20
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.5/GNU_SOURCE-7.patc=
h b/meta-oe/recipes-extended/redis/redis-7.2.6/0005-Define-_GNU_SOURCE-to=
-get-PTHREAD_MUTEX_INITIALIZER.patch
similarity index 88%
rename from meta-oe/recipes-extended/redis/redis-7.2.5/GNU_SOURCE-7.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.6/0005-Define-_GNU_SOU=
RCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
index 6e07c25c6..8e5f30993 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.5/GNU_SOURCE-7.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.6/0005-Define-_GNU_SOURCE-=
to-get-PTHREAD_MUTEX_INITIALIZER.patch
@@ -1,4 +1,4 @@
-From a22512ac1cbd6de1f5646219722e49752d1f60ac Mon Sep 17 00:00:00 2001
+From acd832d76002a1916b3128ac05bc0296425aea6d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 21 Dec 2019 12:09:51 -0800
 Subject: [PATCH] Define _GNU_SOURCE to get PTHREAD_MUTEX_INITIALIZER
@@ -9,14 +9,14 @@ Fixes
 |       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~
=20
 Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
=20
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/zmalloc.c | 1 +
  1 file changed, 1 insertion(+)
=20
 diff --git a/src/zmalloc.c b/src/zmalloc.c
-index ba03685..322304f 100644
+index bbfa386..93e07ff 100644
 --- a/src/zmalloc.c
 +++ b/src/zmalloc.c
 @@ -32,6 +32,7 @@
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.5/0006-Define-corre=
ct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis-7.2.6/0=
006-Define-correct-gregs-for-RISCV32.patch
similarity index 97%
rename from meta-oe/recipes-extended/redis/redis-7.2.5/0006-Define-correc=
t-gregs-for-RISCV32.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.6/0006-Define-correct-=
gregs-for-RISCV32.patch
index 93c359526..700904817 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.5/0006-Define-correct-greg=
s-for-RISCV32.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.6/0006-Define-correct-greg=
s-for-RISCV32.patch
@@ -1,14 +1,14 @@
-From 634f62be6c135ece93cb4e44a69ce3cb66f394ca Mon Sep 17 00:00:00 2001
+From dd3ecb07bbf80b986b8f2c656ea11d1346e212f6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 26 Oct 2020 21:32:22 -0700
 Subject: [PATCH] Define correct gregs for RISCV32
=20
 Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
=20
 Updated patch for 6.2.8
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
 ---
  src/debug.c | 26 ++++++++++++++++++++++++--
  1 file changed, 24 insertions(+), 2 deletions(-)
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.5/init-redis-server=
 b/meta-oe/recipes-extended/redis/redis-7.2.6/init-redis-server
old mode 100755
new mode 100644
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.5/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-7.2.6/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.5/redis.conf b/meta=
-oe/recipes-extended/redis/redis-7.2.6/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.5/redis.conf
rename to meta-oe/recipes-extended/redis/redis-7.2.6/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.5/redis.service b/m=
eta-oe/recipes-extended/redis/redis-7.2.6/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.5/redis.service
rename to meta-oe/recipes-extended/redis/redis-7.2.6/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.5.bb b/meta-oe/reci=
pes-extended/redis/redis_7.2.6.bb
similarity index 82%
rename from meta-oe/recipes-extended/redis/redis_7.2.5.bb
rename to meta-oe/recipes-extended/redis/redis_7.2.6.bb
index 930c1cd9a..dcfd532cf 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.5.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.6.bb
@@ -10,19 +10,20 @@ SRC_URI =3D "http://download.redis.io/releases/${BP}.=
tar.gz \
            file://redis.conf \
            file://init-redis-server \
            file://redis.service \
-           file://hiredis-use-default-CC-if-it-is-set.patch \
-           file://lua-update-Makefile-to-use-environment-build-setting.p=
atch \
-           file://oe-use-libc-malloc.patch \
-           file://0001-src-Do-not-reset-FINAL_LIBS.patch \
-           file://GNU_SOURCE-7.patch \
+           file://0001-hiredis-use-default-CC-if-it-is-set.patch \
+           file://0002-lua-update-Makefile-to-use-environment-build-sett=
ing.patch \
+           file://0003-hack-to-force-use-of-libc-malloc.patch \
+           file://0004-src-Do-not-reset-FINAL_LIBS.patch \
+           file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZ=
ER.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
-           "
-SRC_URI[sha256sum] =3D "5981179706f8391f03be91d951acafaeda91af7fac56beff=
b2701963103e423d"
+          "
+
+SRC_URI[sha256sum] =3D "fb10d67a2fe2b4556f6cb840064dd6e6e3175ce8ca035f07=
26990ec2da9f3d0e"
=20
 inherit autotools-brokensep pkgconfig update-rc.d systemd useradd
=20
 FINAL_LIBS:x86:toolchain-clang =3D "-latomic"
-FINAL_LIBS:riscv32:toolchain-clang =3D "-latomic"
+FINAL_LIBS:riscv32 =3D "-latomic"
 FINAL_LIBS:mips =3D "-latomic"
 FINAL_LIBS:arm =3D "-latomic"
 FINAL_LIBS:powerpc =3D "-latomic"
--=20
2.25.1


