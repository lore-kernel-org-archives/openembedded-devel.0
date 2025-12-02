Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCDBD116F3
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 02:10:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8629.1764641396001493070
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 18:09:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=jzrXE2Ei;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4431f0713e=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B201YGY3079295
	for <openembedded-devel@lists.openembedded.org>; Mon, 1 Dec 2025 18:09:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=7r98Mm+43juOVvbl6i3FtH
	WpUcXdI+Ow2IPFBfFP/8s=; b=jzrXE2Ei0E8vsGC5eTb4Ix6y7mh/n7BZ3vPcjV
	MF+Gkv851nEGv5gRmG7hohLhRShxj3uXn2Vho00h8NS2Ji8fdX1/8iKtHWsIE3p0
	5L+SqtE1wkoUSaeagKi1q2ZFZbcgrU9KTMAHjVCvJWplDHVxJgRKUvgkEK5Uavcj
	rePQHHcqVCt17LFh+zG/OIMsgKjmJWNqKrXmztgUmQv4V8kbZQL6FbSBaTM2ctXy
	BOuDHnD7dIFCa3CKzuRtP9OCgU9sP9bxsJqidb291pdzQQI3tSmd7YN3rL8jyA3p
	LiVDOp9Q8gAVc46U44nX8YYh752+CW9viZBQmVmDubw+rGcw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011024.outbound.protection.outlook.com [52.101.62.24])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqw05jeav-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 01 Dec 2025 18:09:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fl+eGa+RwApfbzSwsSXlZn+3vZ0axXxF5HMjXALGqcVO+PxMmokZ81CpkmsTZp2CE45/qznL1kBCUiKgHwIwRTLitzKWYDQYt1yM+nZGnsKTM31mV1gmRIt793n/9lSg0XIvXQseQ000IEBiFBnsKRT8yMm4iDaqZLsVCGHLjLQ6xwFkZSSkSDrQnCiYUi+fuUyUolJPkUMhWCByR6As7jRPcBiiQAKxoswDHpwFZzWVOb3YtvtY8vz01cvCWewh79YImJHipLyQvj/R7kNNqfT2Dzi5DTjM57Cxx4sN88clMAHQckQqkvpQtDFstPs/5m25Z4bw+Qw+lVAqBullNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7r98Mm+43juOVvbl6i3FtHWpUcXdI+Ow2IPFBfFP/8s=;
 b=Fq6QmOwZI0cASDN9oLfcusGm8DYIyzHrHsw4tUzCVWXAw9DUtUnPYKVAoMGsAlK8JJUhb6ST5eRqTG7tbhwDYiFV96alWHDrniFogE63LXRHKnTf4I+o6pQEUD5KX9BDXxXXoeHiI1BZNcpMXN08P1F3+zYGxtMBCoVo/SR0+YywzuAUJ80EUOXFhkIuXKRuIv7hJPkpG+98MQb8bp4UCk76Wofqw7b7LkCNdjq7o9V9KApMY/Jkk+uqiTzDKq0x/VGdtJksN70VVErJlMi0g7tLVUBesaNKP0JGMW8xXd+SnDa4EMbFyX8oKk1gmWBAvjYqiTR01A4HqEES/kc7QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DM4PR11MB7400.namprd11.prod.outlook.com (2603:10b6:8:100::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 02:09:52 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 02:09:52 +0000
Content-Type: multipart/alternative;
 boundary="------------kQZOzm1RPzvz6YUgIUpJMLnM"
Message-ID: <fd3080d2-e200-4b6c-bb75-25ac0255c180@windriver.com>
Date: Tue, 2 Dec 2025 10:09:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] hdf5: add pkgconfig-native as DEPENDS
 explicitly
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20251201062620.2517114-1-changqing.li@windriver.com>
 <76EB605C-6B49-48E9-84F0-77AD6B8E95E7@arm.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <76EB605C-6B49-48E9-84F0-77AD6B8E95E7@arm.com>
X-ClientProxiedBy: TYCPR01CA0203.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::12) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DM4PR11MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: 0422b2d2-c855-4f67-dfdf-08de3147e11e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RlBkbHJJRDJ2UldJeXFtOGZ0aUtLOVRHd2dYWERVWWVXL0g0bFd1NnRTbnZs?=
 =?utf-8?B?NmZMSHFlVFkzbFYvY3dXUzFiNmFUQ3pyYVpNZFVMdEV5ZnRHdjdkbStXRUF0?=
 =?utf-8?B?SitIOW96aWgyemhHVk9NaVI1azdCVzJlUnlYaGNMclROMWUvbmpLS3hZenJi?=
 =?utf-8?B?U05ZdDRQKy9jWFArajRyREVBL011ZzFLVFpLREY1SmYySFc1NkRVQVM1cmFh?=
 =?utf-8?B?OW9LMEJleVFhNGRFcjc4M3FrNjQ2SWthck1xaU9OTWR3R0dsM3dwN3RzbWVt?=
 =?utf-8?B?MjBmNDFpYXQ0Rmwza3kyWFpLNi9IM3B3czFhVCt2QjQ5SzZyeGpQUzdic3g3?=
 =?utf-8?B?V0M4ejlZc2Uxeis3TU11UFVYNndpZ0RPQ2tzU0hGOE9KNG0xNEMxVzQrOFZJ?=
 =?utf-8?B?QlRpQWh0MHhjZTlCVUlmSTBmcSs5NXZGNHRUaEZyamVvU0x2YWxWMDZhZGxt?=
 =?utf-8?B?aWNWbzQxOHBzRG5sSnNjSmlwQ3R6OHU4T3hJdFdySkRoWGRSeEFEWjJqWVF6?=
 =?utf-8?B?MnkxVDdZaTRSalVrZ1BaajNPSnpFUmJFN2RYVG56MFNjTkZLL3FQd2s0d1hU?=
 =?utf-8?B?b1ZPME4xb3ZXdldNUk5OTDZJNTZQQWxlckRTbHZrdkxtVTVralhGQUNnczFn?=
 =?utf-8?B?b1lOYTZmZyt4eHo4bmJaN3dDUjVPb2lFYk95MDlJaVVjTmpuZmZFL0VoOFcz?=
 =?utf-8?B?RldISHlHQU5tZEJOMlc4OXJ0d1NtMkYvVjBmT1hJYVFxQ2ZvUHJlOExUZEMr?=
 =?utf-8?B?WUVhaTNMb05ENTZ3UkxDTkFqWUpML3lJRzEvdlJVeGRTbzBoV0FMaU1MSERL?=
 =?utf-8?B?NC9BdEdldkJjd1ViTUZXcWVCQnZ0VGNabExQdlBLb0R6L0pKb0JKcDhab2xR?=
 =?utf-8?B?Mm9rOXhKOTVxWDVSb3BjWUxJc3htVUZMM2ppYUNzbDl5UnN5VEdTNUtoem5p?=
 =?utf-8?B?c2cvcXdNVkxiVm92V0pmT2laU0xaSXBMZEl0ZVR5MFZBcS9rRy9xSXhWSEhE?=
 =?utf-8?B?c3ZZN2hmSEllMEw2U3NWaGlVSGUvcm1zRVdudnN1S0N6Umh1dWlRc2QvdmFU?=
 =?utf-8?B?MHhkRGs1ellZc1Q0dmc3ZnFGYmlkVmZUNlh4YW5wSllWdkFCL3N3MjZISXlT?=
 =?utf-8?B?bTIwRWlKczFNMVZJTlNONDNkSStHWEJQZENzL0RLUGYvei9iQnJXQUovRkRi?=
 =?utf-8?B?N0F1TnRZMFRuczJVUmNPVzF4cjIzNkt1UlBHZTIyeUxXM0xhaUhocDFIWGNW?=
 =?utf-8?B?eHNodHVOczhacE15UU8wdVdnQ3huZTZTa1Uza3I1Ryt3eW9XMmx6ZjdQVExN?=
 =?utf-8?B?K0pKRWszT2ZtL1E2QURJaWZmc3VGRWl5dFVlUk5PUjVNSXZQU1pVSTRQTWl6?=
 =?utf-8?B?eTN4a0dkMnVXcjErQ2h0dVM3T0ZWU2EycjFOaWswaEc1YThwYUFtQWh5ZjV3?=
 =?utf-8?B?K2g2enNMMEtXNEpYZTU5a3Fvc0dBVkpvL2x6eDNsVXJMUk53RTlxVzNYenJF?=
 =?utf-8?B?aVBGUlBsOUNGcjdLV0xtQzFQU1BUWkVmbnNvNTF5V1pyY21XL0lrOHAzMTIr?=
 =?utf-8?B?bEFadmJrM3ZOM2V6L1Nia0QxelBaV05UZURhcWx2ZVMwTkw1TjhWWUJzY05i?=
 =?utf-8?B?VmVwUElmdGxSYXBIVGFkNmFvR0J3dDNMaVVEeDNNZDNKS3d0OFBQKzdwVEdo?=
 =?utf-8?B?WFdua0FJZDU4Zi9DZDJ6MnVFZkxjRkJMVlM3TFVYdHVSZ1BCK1pnNlhMK2x5?=
 =?utf-8?B?MEkzQW9HbmVpNW1wdkpzbVBmSU55alA0YVpzZk1kck9MaC96ZDRuc1Rxa3pu?=
 =?utf-8?B?Q1cxR0VjM1BTWSsrbGNtTGdXQTQvZlA1bVMyTnZTdFRSQnFITm9FN21aZ294?=
 =?utf-8?B?SUZBRGpGdlpKbnEvMEJBd1lLZWJtdVE1VEN2V09VN2tHdTdoeFZNZ3EwRWRB?=
 =?utf-8?Q?LBCcRMCLEbWqxjLdCowuNabU3AVM1bHv?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RXhGaERRNjhpdmh6ZWt3VHVJSmZxS28wb3QrSzlwNjF6UWhyd1FQa1VtVUtL?=
 =?utf-8?B?Y2dPUmY2b25YOTMrcGN2b3UwT1planF1N1dHVkl0WVloZGU5TGNuUzdGVEQv?=
 =?utf-8?B?b1h4bUJpQk83cVhxczVXZkZPbHFDYW5vdTd6VGF4K0cyNk14SjdTcW5ySUda?=
 =?utf-8?B?OFpIVDE3bkhxOG1FMVZyM2xyclo5VXd3SWVpTHFKK0kycnVQakhLZUQ3b0Qw?=
 =?utf-8?B?amw3V0hQaDdaWGlKKzJMQnNYU0tQdVY4anpFaDVQei85Y2h2VXBDcVdTUTVZ?=
 =?utf-8?B?aElhRnBHbTdUN25ERldydzAzV0VjR3ZtcEhzdGM4ZXp6REFGOFRuVU9LNEd3?=
 =?utf-8?B?aDdIWEdudVMwRjJXNXFLdUgyb3Y2RzltUHVucWtzSEFOL0FyR1VLZDdZS3dz?=
 =?utf-8?B?cHFRTWFiYmljaUxKZnZxWkU1WEhFN2xBYTB0NnZjN0N5S08xZUVVMnkrUjlG?=
 =?utf-8?B?dFc1VXNwY0hKWmNoMEpnNmRUNnVXeHBoMjdCd0NTeDBWa1FUbUZxVEV1Z0di?=
 =?utf-8?B?Q3QxNEtycWJPZmJ6U3BqUzZPNnlVOXNialQwenNidG12bUQxSVoyeG90eUxo?=
 =?utf-8?B?cFlYR0gzaTFiUG55MGEzRjVpRDhHWklXYlZNeWVKcXFDMWljdW5Ed3p0N29M?=
 =?utf-8?B?REhnOTdld0owMHVUbmZuMlNFV1JyRzNUdTA0OXlhWFpQbXN3MDdKczhlZUVv?=
 =?utf-8?B?UTBaN21lNUFGTWRXMjFXeEZOMVhEeW5uUWZqMUdCblZvUnZTNWFsOGd1c2hV?=
 =?utf-8?B?TFZySlF6RHZTeFEvbW9TVGhSak5laDFCTHR0ZmZadCtLbGNZcWptTUx2N2k2?=
 =?utf-8?B?Z2ZDUjVKZjk4elRvN0NzMkxmRTk2WnFiTVNCdE15NURhSjBHZERsMk9jUjdu?=
 =?utf-8?B?SWFTZGt3TVRnaTRhUm96Y21nY1VOQ2ZtbzV4QWNnTnl6Q3ZFMXpNVktWZUdT?=
 =?utf-8?B?ZlVJNi9jTi9XaHZZRWdueG4wc09od1B2UnpPSlNrSEV3VnFBNEsyWTkxWmxp?=
 =?utf-8?B?TlJPbGNVeGpqVC8yR3NneTNZeEl6eWQ3ZG9GUzBjOTZsY2dWTklWbVNhZW15?=
 =?utf-8?B?NVNVME1LZy9RSWxxMVVoTk5LdTA5WDBwNDRoTjlaYVE4dU85RXQvUXhQdXh5?=
 =?utf-8?B?eWZlV2I5YVQzSyt6V0RBU094WndSYWlYcktLUGxWeHBqSUZxOElxNW1xNStE?=
 =?utf-8?B?TENPZkVXUllTUDVuRDlrbWEzQUVjLzRJdXk5N1ZZTjlzMDFnYmR4bVNOaHA1?=
 =?utf-8?B?dHNpL2xoclNURXpBREw1cTZBdVI4MFg5UllMRXFuQ3RnNXd6QUN5TnBURVNn?=
 =?utf-8?B?TXQyR1o4b2ZPcDdjNDN2S204Y2VVVnIwOXUyd0IzVzlPQzBmY3A4YkJyTEFu?=
 =?utf-8?B?RlZNRGtFTm5TRXRjc1JMbWhsSk1rVmttV29YdnpobC84N3JQZWNheGlodGFE?=
 =?utf-8?B?Yk93TVZFRUVZWTRuYjFlTGdnSjZlNmErODlZUEFXK3djMGFzZVNVSWxVV1p4?=
 =?utf-8?B?TXFYVGw2ZWJvYnZTTURlU2xvTVZSWUd3bWFXc2xhbUszdnlPdVNZMTFzZWhN?=
 =?utf-8?B?M0k5VVVJbHZQcW5VV1VyWDEvNjF3SUFYWDE0NWJML2FxNW1DVnVPSmRVOWpr?=
 =?utf-8?B?Wis3U0wvWEV3cTRBWUwrUnUyTG9ZMmN4c2pZSGxMcGoxbTN6MWxCZVFkM3Zs?=
 =?utf-8?B?THZRTjJLRWtzc1R0VGFtRnJlYndPVVBkSk9CMjBKZ0ltMFlFSHVFY0JKOXN5?=
 =?utf-8?B?aGx5Vzk2V1JOUXhPWUVRdlZKWkY0dGZQTlhjSW9HcUFBeHNHaVVLTDJUZ05o?=
 =?utf-8?B?K2xCL1QwYm9xMHdoZWd5Zm1OVVZhdkR3UldIeldZaE5UK09LdG1xeFRpa3dm?=
 =?utf-8?B?RVUyMExVR01DeElQZ2dudWxiS2liNVErUWQrdkcwNHczSVRNajA5VWtKMjFE?=
 =?utf-8?B?OXRSL3FHNTVaTDcvNlVuQ3B1Q0w1eDZiKzdMalQxR0dEQ1MwL05hMlIyWDZL?=
 =?utf-8?B?VVFpUjFMR3FNMkxNbzBTdkZxbVVTbXUzL0NBc1NyNnRsc3JqL3FkRHA2bjdu?=
 =?utf-8?B?N1d1VlQ1R2ljSmVjQitWVnlBS3FvWWRLVVB6TDl5eVRML1IrOWtDV2l5SzM2?=
 =?utf-8?B?YXRTYVJiTDNXYUFQd0FWWFpLN0xWQ2tFUjhFRFZ1OHZicE8rVjltUXpwbldM?=
 =?utf-8?B?SEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0422b2d2-c855-4f67-dfdf-08de3147e11e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 02:09:52.6077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ldd/BCPK4M8QYiftmGInHIdcJ2G8vh6ISz3yxGyQmZ27BGnBhCqxqTqymZzNl3AEb2ujCsJ56f5GH/LeYPTlgc65s10JBKdnuUYFgsnu3v8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7400
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: TL46TBsigSwo1icZqt5umhMbjctOKZyQ
X-Authority-Analysis: v=2.4 cv=ddyNHHXe c=1 sm=1 tr=0 ts=692e4a73 cx=c_pps
 a=oVQupeHHWlONJbG3R3cvFA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=a7AUxbQSPtfVGCUZpQcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=zZCYzV9kfG8A:10 a=7CQSdrXTAAAA:8
 a=ktOyJPztaX449sVuNHoA:9 a=RHHDjNczw2cBQHdd:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: pZAE0uveaQAghPFnzj8I4__zW1ypQq9X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDAxNSBTYWx0ZWRfX+x/9yqKvvO9a
 Ai6xzy2Nnob2+Hf8wFdv3zLCDmbKzr+1pbKY85M87mO6nE9AP6oPu0uNXd5CddjYTqVtf34++qR
 NW4dP2YUmus2bJSAwoy/D4mHNptfa/Tg5f22jKhw4pGHLgm6iP5Do2/d531/JUihihibRNGKmPw
 VsUAxsLjdiZtSCK43/WaHS2n6SeeZl106Ahi3ked5ujvWnY9lq4+FUDYCbeiVW3192RuxQfau0R
 qGRHbeRd/zhPmWgBSjdhqT+aNdzYh0hMsfyR8SyDGcP9n+HuBMACjErt8ikiTTkcoJy6b6j3zty
 Br4mr5aCZNZk2vrukmtgvSAPLlCbi7YYCVFyC5ztR4nMog07ikpZjeSzqmJ2IoQDzGpibca3Wr0
 ZcknPMk0DsM6e9zFyAeK7rI31rv7QA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020015
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 02:10:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122224

--------------kQZOzm1RPzvz6YUgIUpJMLnM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5B201YGY3079295


On 12/1/25 17:53, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 1 Dec 2025, at 06:26, Changqing Li via lists.openembedded.org<changq=
ing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> Add pkgconfig-native as DEPENDS explicitly, this can avoid install
>> conflict when enable multilib when pkgconfig is installed on host,
>> and also improve build reproducibility
> Convention is to inherit pkgconfig.

Thanks Ross,=C2=A0 I will resend the patch with subject "hdf5: inherit pk=
gconfig"

Changqing

>
> Ross
--------------kQZOzm1RPzvz6YUgIUpJMLnM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/1/25 17:53, Ross Burton wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:76EB605C-6B49-48E9-84F0-77AD6B8E95E7@arm.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On 1 Dec 2025, at 06:26, Changqing Li via lists.openembedded.org <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li=windriver.com@lists.openembedded.org">&lt;changqing.li=windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Add pkgconfig-native as DEPENDS explicitly, this can avoid install
conflict when enable multilib when pkgconfig is installed on host,
and also improve build reproducibility
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Convention is to inherit pkgconfig.</pre>
    </blockquote>
    <p>Thanks Ross,&nbsp; I will resend the patch with subject &quot;hdf5: inherit
      pkgconfig&quot;</p>
    <p>Changqing<br>
    </p>
    <blockquote type="cite" cite="mid:76EB605C-6B49-48E9-84F0-77AD6B8E95E7@arm.com">
      <pre wrap="" class="moz-quote-pre">

Ross
</pre>
    </blockquote>
  </body>
</html>

--------------kQZOzm1RPzvz6YUgIUpJMLnM--

