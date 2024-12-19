Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C1AE77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 09:53:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.126172.1734602005713836941
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 01:53:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=208387d3b6=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ7ev0f002883
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 01:53:25 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43h6685f3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 01:53:25 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BJ9rOlq001049
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 01:53:24 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43h6685f3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 01:53:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCAunjzoGXLOBhTJs9qLtaolEXWjRrlE7T/zeNhg6pgJYyLl4uOpO7O4tM8GGYpiiRHC28goIMzFfcTLElH5twx6CzFWxloYNVoyoWJEc09TCKLQMgAATeGx8C+pRe89DmkPNDrm6Hx3KQZIBytFIqwe5m3AZ7hAweArF0gE8/OFVEGt/a3MGj/rnHB40MTH7/ul6AUzI7y/sJ1EALy3SEoNZqjmKZMKzRgOdrECnmJtMpEM2kOW9f0ofntQUqDvmyZmmr0fnexUFmBnhDy1pVLI0E8zeAUaJ4zFzlb5nY9lGfsq5oAoViYr+0iKakD6iMXXr+Y+X12dswMqLtk/Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIGy2Qk0dOsIhZXpqYs4WvZ1Pl6u4Jz7CSvdgQKRuu8=;
 b=hN8CxaJ5DDiIbCCSLCfappjIZUwqH7P0OPpWL+J67c49tXBbBeCratqPe/IFGV/weoVdJIBfCuxuf9brAyL48PcWZnhqygi0J9krOC3pz/+fvuTVSMSVKSFxj1qbIxF7jD8SGPideIO3ZSSwL91ncKx5gsRK0CNWD8fxQE3v0IU1XXOsiTrK3IuVoa4xUkrqCn5QAKmjBmBmB3gxYMRUijpRJGmGTKO98rI3XXZ9OFFIWWY+FY4t/05C1NL5mVepw6vDHGV+/NI0Uz54yLQ9Axte/tbLrIwugkgPCLCNDCNtlioYRGSx+eNAqK5raMhl7TNM4OvkfehBCl/wvv8dCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB8264.namprd11.prod.outlook.com (2603:10b6:806:26c::17)
 by SA0PR11MB4736.namprd11.prod.outlook.com (2603:10b6:806:9f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 09:53:21 +0000
Received: from SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569]) by SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569%5]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 09:53:21 +0000
Message-ID: <deffd86a-654a-4fce-8ba5-c32cf951356a@windriver.com>
Date: Thu, 19 Dec 2024 17:53:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-xfce][PATCH 1/5] xfconf: 4.18.2 -> 4.20.0
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <20241216103618.4078816-1-kai.kang@windriver.com>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <20241216103618.4078816-1-kai.kang@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0013.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::20) To SN7PR11MB8264.namprd11.prod.outlook.com
 (2603:10b6:806:26c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8264:EE_|SA0PR11MB4736:EE_
X-MS-Office365-Filtering-Correlation-Id: a10783d1-19de-4048-4da2-08dd2012f882
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WitGN3lHTHJ6TFg1Z05WcXZjR0dScEpXMkg1bklKbktQV1hQVFAwT1dLblla?=
 =?utf-8?B?Y0luOXJOVzY0bTBuN29aT0hsZ2dZejJZMk1JVlFBbGVqN3JoSjhPN1FCUlJ5?=
 =?utf-8?B?S2FSbDRVYzAyb2p6UTRiY3NLL0ozMm0vaUI2SUR2Wnlhd3phVm43aGdMcDE5?=
 =?utf-8?B?MjZnWDRPcGRGWlpRb3NkdDZzamd3V0JwQ2NJQVdsUXAzdlBxVFZ6K05Hc0Mx?=
 =?utf-8?B?OUhtVGVJUzliazIvWVRMSjY4T0VGeE40cGhwSUhuMEV2R0YrbjJLdVRiWVFS?=
 =?utf-8?B?YjIyaTdlRHNyMWVpcWZIT3cyZGxZaXFQemk3NmxUNk1xQkpoSEhtOGFRN3hN?=
 =?utf-8?B?YUdxbVJQQzN5bkJjbjEzTWQ2VDhmME1ick03NmFBS215UVB1bzZTWnhUbWNN?=
 =?utf-8?B?aEExZzBENCsyNDFaS0plN3VENEFaL3ZiNTNnSWlGRDUwcEI3KzU5bUVwWnVl?=
 =?utf-8?B?ZFFqTFJXbmVzQ245a1FHKzhBNUFtdHlnczhFRDR0ejBNWWdNWFdrTVJLQkwx?=
 =?utf-8?B?UGg3WnprV3FKUW9nZGwrODNQMUFGSXdnaXpZdXhHT1N0SmttMlAwYkhCMFR5?=
 =?utf-8?B?QzJOQUwwUXlIaVVpN3N5V0ZWdFc2bEhBUTRkYXhPQ1BqQUFGL1llbzZQeHpQ?=
 =?utf-8?B?Z2lLUlhmS2RlMzZubkRidjNvM2plN1lCTW4zODgxK1pXMHl2YXhTSlhVaGw1?=
 =?utf-8?B?YWxISnRWRS9kOVdKOGhHSGcvZzBUdkk5MU8wK1JUNzgyMnR2OEY5QkFtVndJ?=
 =?utf-8?B?eWFDN0YwMkV2N2FVSkVGZmUyaUNaRVJKWGVqand6WkFwdFpBZ1RkSjFuY1VG?=
 =?utf-8?B?WVp0dk1NTWtCVzFlUjlnUkdzMmUvMWJIZWZFT01SbkNXQ3ZvaWUxNExqZE5l?=
 =?utf-8?B?MEkvZkZiRHE5dlR0YWh0WEc1K2YwQ0dBeS9LZGdQZkRlWTNYNGxyWHBNN1BU?=
 =?utf-8?B?S0NRVXlKbmxubUNvYjdvbWw1OWV6R2h3ZnIzZ0NSTDVKZTdWK2pMdkQvQmNi?=
 =?utf-8?B?UlV3UWlmU3dDQ1NRMlVzQnVPYWdLTDUrb2JSUHB1dDZ1V0ZyV04zQTFWR0dC?=
 =?utf-8?B?b0M3alNLbkNleWd6SUFNRFlGMGMycFJ5aDUvQmZoc0E3Qm0rOEI0Z0NVQ2Ez?=
 =?utf-8?B?UTdLdmozcHhkYjdzWVZxOW1nMFBFR1RVb1RSZ2lEK2VLejBGQ0dJejVmWDQy?=
 =?utf-8?B?OGdNUlBGS0pHTWdiVzNCNGxkWEVQTGRFN2ZVaGJKWCt4MUJrMmx0MWc3VzRk?=
 =?utf-8?B?eUQ0NkJUQTNKWFlvQXZNS3J5VThrL0FwOGIyTXZGMGw3Tmt5b3RoNkFBVmtt?=
 =?utf-8?B?S1E4bGl1L1dBOFpnUVk3VVRwSU00azdCNGwvNmJNeWZGRUptZ09uYWI2aFRS?=
 =?utf-8?B?Nnp5ZERRUlRhWWh1TE81cmRUNnlEU28xUExYeGh0cms5b1psMzliMUtaYytF?=
 =?utf-8?B?VGtnOVVTNlNlRVNVL0dwRFBKMW9EVUl2eDVUbnVqYmdCTmI3eWJBUHFyNUhP?=
 =?utf-8?B?Y0dSNXFrNU15d0NLUVlwZXg1aEcyb3VySXo4OTgyemFTL1dFaUgrMCtiNEdL?=
 =?utf-8?B?Wmx3bHBSZ1M3eGpXWmx2a3hjem85UU9PU3k5R01QOEdqbmI0SXdZMTdFSWY0?=
 =?utf-8?B?K045d0h2MmlianJIKzZNeGNVTUdxNmFrNmhyZUpONHg1blhrbjB2U0xrbldz?=
 =?utf-8?B?djJuUnZDQ0tTdkF5MzZkVnJDTktkUEJTRnFkL1FqenF6QVdvR2pRNnRHOG5r?=
 =?utf-8?B?SnVZd2Vjd2dwM1JQRXJScmQ4MzJxUnVaRTZCd0FvZENoeHdzVEVLWTJ6K3o3?=
 =?utf-8?B?UmtaQmFXa0NSM3BqaEZHQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8264.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OWxwRGk3cUZzYVhDNVV2c1RCQ0RFb1F5eEw2c2QrZ242aXRNYURyUDBJMFUy?=
 =?utf-8?B?Q2VEbWJLZGROMjBFSG9rSjgvM1hNQzE1QTcvaXdmczRxMmg1UDFtcXR6ZUli?=
 =?utf-8?B?R2grZGxFcUJpU21MeHV5MlFpWlYzZElkY2FVRURJNU52QXk2SEsyMGxBMDZt?=
 =?utf-8?B?dTRWa3pEY0llNzBsc25rSERUYjBjMnpDUFBTc0J0UEZpSFB2eDR4eWpwSnBp?=
 =?utf-8?B?L0lFRGpVaE85TThTTENuSEJEcWgvNVlPbC85QklJUHdLYmltU1dEZGs4RTlN?=
 =?utf-8?B?QkxhTnRoSEJlQUQ4ZW42VXF5L0VVbHEvbEwvQjFTd0VUSzNMWk1YZC9RN01l?=
 =?utf-8?B?RXo4cmttVW5QcGh3TlRVTThkcThNUytaV0twU1ZJajltK3hQVnFuWDZhb0lE?=
 =?utf-8?B?cG5tTEdVbnREUEtPdnpyb2lQVlRjOWt5WUtHWllCTGpEWlJ5aGwvYlJqd3dn?=
 =?utf-8?B?RE1BV01pdUhZZU1QUkNtRWFRT0loTlluRk9mL2tySHg0RGgvZGEvUVVvRXp0?=
 =?utf-8?B?TitaVE93cDFXOFZvRTlseEk4ckpqSzh0Yi9pcmpKbXZlekJMZ0hKU291OG16?=
 =?utf-8?B?Yjk3aXE0SVcwV0lLYXBGNHczU0VrekJFQ1RoRlgvSGNtNjRHYnhkQVJjWWdm?=
 =?utf-8?B?ak5LQ3phZlBPTXBYRDlQVmZnVGNyVTlLRDFVNFBkdzA2RlBOUzZkdDI3L24z?=
 =?utf-8?B?NHpxODBlZlF2YzVsQ1VlcXlBbUdOY0poVXppNmRONVRyOHd3aWhINXBGckp2?=
 =?utf-8?B?MjdEQlFRaTNIMmZLMmQ2eTViRVhvQ1NiSmlxYldqalBkSVYxdmJEN1lyKzJN?=
 =?utf-8?B?RFBhSUx4RW8zVlBqbG9HaG04SVZQVENvc2VBRVkzTVRwbTJYQW9qcGVlZWdO?=
 =?utf-8?B?S3p4SVBEbjcreHhEa1FUdWROQmp1YnZabXhSSEFUalFMZjFyWExoM0R0a1Ro?=
 =?utf-8?B?USs0bXNkbGZlM2Z1ckdsY3k1M1Z4MlYyZExERjVURUIrZlNQNUxvc0s1dkdm?=
 =?utf-8?B?TkQ3Rkh6NWc0UTlFRE9Camp6R04rUEZ5dFhYM3dlSUgwQ1Bocmppd0tFaVE0?=
 =?utf-8?B?U2pwbHRYMUpQT2ZqNklKeURZY0RMdnZ4QldjdzcxRDRSTXgrVDZOL0tlL1Bp?=
 =?utf-8?B?QzdQNTJXSytzbkE1d3M3VUxTVjRQcGtBekl0MHN5ZUJZTG9CMG5VLzZRd0J6?=
 =?utf-8?B?Tzl2ODAvUHpPK1dhWnd0ODkrK0ljUEVWN0wydkFEZyt3YU14OW1HWEtOWlQ3?=
 =?utf-8?B?bHpLZFdQRVJnM0xWOGVsQWVGNStXME5XSXFLYjFJZVZZWk5Fdy9zZTlycFlm?=
 =?utf-8?B?SHpjUkJEVi9sd256OWVJWUxWSllFZTV6bzFZZEVBOGxYeE5OUlphUEl2THF2?=
 =?utf-8?B?RDVYTUF6UjhxeDh6em92WnRKNG9yVzBIMGNSL20rUW1QcTR4Ly9qTERCZnZL?=
 =?utf-8?B?VFVXQkpubUQ0ZWtGWks3Ri9jRWlGTHBzeUFEMFZxUlJBc0NQMzRMb3Z5TDZR?=
 =?utf-8?B?alN1cGViVXE4Z01mVWYxb3U3bDZZWWhuU01qYTVHRE1KWU5sY29CeU1SSTA0?=
 =?utf-8?B?S2txTkRZMm9GeDliOFFTWWF1ZnF3UXVtTHRRNlFsNHgrVGRvT0szdEJNd1l0?=
 =?utf-8?B?SDY0UnBZR09aeE56WUpBUDMzVmxoMDVuZTFoZUI2cGwyeGxnZ0JBejhFSmZ6?=
 =?utf-8?B?d0hiT0RNb1lPTGkrVHBOQVYwZUFHU3JzdEJxeS9RendVMU4xdVpiN3hveHda?=
 =?utf-8?B?clplSGNSZzJWVGVranlWMkZtR25UUW10MEN0NytDNjNMdTArbzhGVGlVRFhW?=
 =?utf-8?B?QmFGNTNFS3hDRUg1aVIyL1R0K3c3bis3bkdhT1p3d2JsbzRuV21iZ291NkNN?=
 =?utf-8?B?c3duV0pHa1dJaDJBbFMvR29IY0kycXhvNDVTeElwdUZqZlJZZ3RaNWtpMTBu?=
 =?utf-8?B?OEdJS3QwMGRMNmFBMXdvYktacEUxWEdMc2NPTE5pRTAzKzgyRXkwQ05vRWZC?=
 =?utf-8?B?aHQydUJnaTBGWEVpNktJUXIvci9ubzY1L2gwL2ZyaTVYYzE4VVE2VnFiRVY2?=
 =?utf-8?B?VUpkODZNY0htdHhnL1huemsydldOQ3VlaWw3b3oyVlF4M3cvQkcwSjhVVTRK?=
 =?utf-8?Q?cilMPY9h1klfzB+ovxOJBNtdP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a10783d1-19de-4048-4da2-08dd2012f882
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 09:53:20.9785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: US7XZQd48b+6IxDFsmNo+d9MfKi5SxOqAM7cy7WBSlM1tJ9v94U/6d0jJDg9M6ettXcddIaqQnM0In9Zw3/r/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4736
X-Proofpoint-ORIG-GUID: IVhuE1VYufCPbYrdZCyEK9bUwWGqf9VX
X-Authority-Analysis: v=2.4 cv=K5XYHzWI c=1 sm=1 tr=0 ts=6763ed15 cx=c_pps a=DnJuoDeutjy/DnsrngHDCQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10
 a=O24Aq5uEAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=__H1mnEvJVR0NBbCVoAA:9 a=QEXdDO2ut3YA:10 a=SYBONWESK5muIIdMMRMZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: lQYATrgNjSpYf_rM9Mw9Gw8coFAwppI7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-19_04,2024-12-18_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412190080
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 09:53:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114386

On 12/16/24 18:36, Kai Kang via lists.openembedded.org wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Update xfconf from 4.18.2 to 4.20.0:
>
> * update EXTRA_OECONF to remove legacy perl setting, and add config for
>    gdbug-codegen
> * handle the systemd service file
>
> The change log is at:
>
> https://gitlab.xfce.org/xfce/xfconf/-/blob/master/NEWS
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   .../{xfconf_4.18.2.bb => xfconf_4.20.0.bb}    | 19 +++++++++++++++----
>   1 file changed, 15 insertions(+), 4 deletions(-)
>   rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.18.2.bb => xfconf_4.20.0.bb} (49%)
>
> diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.2.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.20.0.bb
> similarity index 49%
> rename from meta-xfce/recipes-xfce/xfconf/xfconf_4.18.2.bb
> rename to meta-xfce/recipes-xfce/xfconf/xfconf_4.20.0.bb
> index 39694cd0b..750a40627 100644
> --- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.2.bb
> +++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.20.0.bb
> @@ -4,15 +4,26 @@ LICENSE = "GPL-2.0-or-later"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>   DEPENDS = "libxfce4util perl intltool-native xfce4-dev-tools-native"
>   
> -inherit xfce gtk-doc gobject-introspection bash-completion vala
> +inherit xfce gtk-doc gobject-introspection bash-completion vala systemd
>   
> -EXTRA_OECONF += "PERL=${STAGING_DIR_TARGET}/usr/bin/perl"
> +EXTRA_OECONF += "GDBUS_CODEGEN=${STAGING_BINDIR_NATIVE}/gdbus-codegen"
>   
> -SRC_URI[sha256sum] = "dce24fb0555e9718d139c10e714759e03ab4e40a7ffcf3c990f046f7a17213cc"
> +SRC_URI[sha256sum] = "8bc43c60f1716b13cf35fc899e2a36ea9c6cdc3478a8f051220eef0f53567efd"
>   
>   FILES:${PN} += "${libdir}/xfce4/xfconf/xfconfd \
>                   ${libdir}/gio/modules/libxfconfgsettingsbackend.so \
> -                ${datadir}/dbus-1/services/org.xfce.Xfconf.service"
> +                ${datadir}/dbus-1/services/org.xfce.Xfconf.service \
> +                ${systemd_user_unitdir}/xfconfd.service \
> +                "
> +
Hi Khem,
> +SYSTEMD_SERVICE:${PN} = "xfconfd.service"
> +
> +do_install:append() {
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'false', 'true', d)}; then
> +        rm -f ${D}${systemd_user_unitdir}/xfconfd.service
> +        rmdir --ignore-fail-on-non-empty -p ${D}${systemd_user_unitdir}
> +    fi
> +}

The systemd user mode service file should not handled like this. Please 
drop it and v2 will be sent.

Sorry for inconvenience.

Regards,
Kai

>   
>   FILES:${PN}-dev += "${libdir}/gio/modules/libxfconfgsettingsbackend.la"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114326): https://lists.openembedded.org/g/openembedded-devel/message/114326
> Mute This Topic: https://lists.openembedded.org/mt/110142309/3616933
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [kai.kang@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
Kai Kang
Wind River Linux


