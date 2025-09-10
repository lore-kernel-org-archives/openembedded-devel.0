Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC2CCA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 07:20:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11514.1757488849690489087
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Sep 2025 00:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=MKa1tvNU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13488e94a6=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58A3mdAb3454108
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Sep 2025 07:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=+T+69teTZWF/SINbhPlQIg
	Ffb0LNdoGwNOoo9YNFbJg=; b=MKa1tvNUv2ugv+A3DWYihyviRL8pF5CZ7E5gNf
	v+kzp1ROefjLPiuOhSd1SBmW1zKAwOnmO+/Tb7IuhLE2rW+2Kc8qJwYMH51lJhdJ
	kkVTKbfQvaCKRBgWsUdrJXWFTNF+fJiEJf1CEpzoojVVoR1DBUt2FDKbFmbekjGr
	Lk3qY+QoTEqrYjeEvs/RzmWINiHSpPvSM4fq1ODe1qtBf+OE2P6rAncIqdf8AMB0
	7niLIRKIc+ph+Skc8hMuQX2yTRlTHVi+iSRAeqIwBUihX91sGcScssrO5o/6+bKC
	vhCKq74ICiWXx87yIlyt9OD1P1kYZ06i4vLohGTm9oPFB5QQ==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 491ve32dwd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 07:20:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhQ0zm7l62ivvQBgpX7TWlKb0ysYzNT+w4/MP/MMbEf16oYpxOjVWwR8DGobl/k9mxe7wrXggbRdZR2Soet1RERyTqOgTdWv0KhGy2Uzyxhawh/u3XiaOmQmZVTrXXh38OTUDRV5hf1CjJisoqUZyhyVo0JmB24FJe/lqq7hDHlw2XRbISLD77EFoetRS2p3WRAz2eyhjZzTmjol6OiXmNw6AfWc2LKqF6DZ/AL8LyprLa2NARwdvAB44I28THteAuKBx+bs5eBgIEllNcBPB0aQQ/Nh9ugsmzUhuOueSZQX/8gp1KK/psrcpnFxk58UIRkv+t2B5htSD3QBADiwAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+T+69teTZWF/SINbhPlQIgFfb0LNdoGwNOoo9YNFbJg=;
 b=TjYr7MYhWrDaZHVRPcGlYv0ly1/Y0maC5Bo5m/6JCqKpKxcX0eUlU5CRN+EuOXHOJqthtfcZrObI3C+Qleij2cP2WpJVaLtObiB5/ELW5i5Xi9ooQWtbrsy/laScg5Rol35ndrlbJlLKTLKJGEYHV+SFoYyl5SBxcAjsH8wKOPO0Wi4slSlCStcqmW0eIXaI/9u7SLossMVbH9skjd9PqJosEKG1cs1TozK+8K+UIvftiMUFh9UvYErC/P0e1egxu4z2oRO830+wTBGXWYN0+ddrVzeTaljXG/MlZfQhdsknFzQkNbgV21B+hqarVLpO6ZvO83Y8usFaQ6UodZR8LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DM6PR11MB4660.namprd11.prod.outlook.com (2603:10b6:5:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 07:20:45 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 07:20:45 +0000
Content-Type: multipart/alternative;
 boundary="------------02A0OdBNTcAV040Ci8WiyD30"
Message-ID: <8abfbb6f-528c-4c22-9f20-8e4750dde2d9@windriver.com>
Date: Wed, 10 Sep 2025 15:20:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH] python3-frozenlist: disable the support
 of ccache
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250828064523.114335-1-changqing.li@windriver.com>
 <CAMKF1spT8fpahqJ98FPE5H+GQ4FFd=P3f3PM1__ygrUnj7tdfg@mail.gmail.com>
 <782082d0-9cc5-4478-bbe0-38f5be967d95@windriver.com>
 <CAMKF1squvavkkY171jKT_8zAx87Rw1x=2jNVfW=CrNtrjr6UmA@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CAMKF1squvavkkY171jKT_8zAx87Rw1x=2jNVfW=CrNtrjr6UmA@mail.gmail.com>
X-ClientProxiedBy: SG2PR06CA0188.apcprd06.prod.outlook.com (2603:1096:4:1::20)
 To DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DM6PR11MB4660:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dbc0b61-e4ba-460d-1248-08ddf03a8efd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|4022899009|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z0YrT3NrTXZjcitGaXloaTM2dzlmY2ZkOURsRHJwWmFZTm41ditZdThDK1gz?=
 =?utf-8?B?NVkyeEp3ZTZVZ0JnREh0QTFudHdnako1L1FzNENUcEFtcDVPYlVkZUZadTNs?=
 =?utf-8?B?bXAyMGxwclV2em0ycTZGbk9wa1N4OWxsa1RpZHZoSng4MGdTVVJTc2hoY29K?=
 =?utf-8?B?aUZ5a2NCOVcrdnI2Mmw2enhKUFM3R1VMNDFjTktMQ0ppejIxNGtkcndINDJ5?=
 =?utf-8?B?bVJXSUJBenhzaGZSbmhwbG51U1FUM0VpR3o5UzVaQmZMSEhiWTBTODRWRklk?=
 =?utf-8?B?UFNWRjFwU0RuZ3Y2UXRzbnNsRE5URmMySEZENU4rOFF0ZGg2SjIrMkdYTkhx?=
 =?utf-8?B?SUNod0lLVU93UnIwQkM5dklCdjZ5S2ZiNFgwS0pIOXpFNUtacG5VZHVKY2U5?=
 =?utf-8?B?czBIQ0xadDlWL1BYWVE1UTRkdCt0dzhSOUxUc1cxRUlSRjNjcFZpT2pnY1Rt?=
 =?utf-8?B?c1ZUWmZsYit1UnYyVjBZbW5sSjM2NTlRSFo3bktFZ2RPRHFBbVJGQlhaRDdq?=
 =?utf-8?B?UXNwZUo0eHlQcWtTZEtlZlYzQ3d6YnB3bDk1eDh0YkorSzZWTmJ3aXE5ZnNW?=
 =?utf-8?B?TmNwSmVhVkY3bnZDaW52ckpaZ3NDYlkybVgvN0FEN0xTc1pvR0RlNEZiaHpk?=
 =?utf-8?B?OUcxSUdvRW5PWEJjSzNzbVdLU3lKNi90ZmhOMDFWM1ZwR2Z3d1Y4NFJVS2dG?=
 =?utf-8?B?dGNDMzVYZlpPQitMTS85WTdzS3VxTWFwRDhkV0NKbXBlazZFZ0tETU9rWXVq?=
 =?utf-8?B?MGJDZVlZTmtkRVpQZmZOOXl6eGFiZ0FTaTNhc0JRR2d4NzJtbXhhTk5uc1h5?=
 =?utf-8?B?R21pSk8vcGtuenJUbUNTMk14TlB2NkdrYmdOOE4reEM1SFBaQWtlVEZkNGNY?=
 =?utf-8?B?WHd2aVFlUzhFNG90OHhVbjQ5Vm1FSXFrMzBXaURBNmRWbnhDSzR5YWlyaDhM?=
 =?utf-8?B?Y1lHZDFJSWp6U3dES25YMWFISVJmQnFGOFZUdEg5T3VFVVdoalo1TEtlU0xV?=
 =?utf-8?B?UXkwem92cURkMkNFelgxUHBDRjY5YXRMaU93VWZtZWRZZnIrczh4QVA1WmNn?=
 =?utf-8?B?NWZqUHhmMEZ5ejQ4clVuVHppNHFpTjhydkd6QnEvT0xFY25CTXNvaGZ5M3VT?=
 =?utf-8?B?cUJrTHpzNG5QUWg2a3BmVUJWeERETHd3UkFXQ0NTMStXb1B3NkJWY0RZQmlo?=
 =?utf-8?B?N0Y4NlJvdFJNYVJnYUJtRVlhMVJxSUFEMUduTnBlRzJvbENXWlVRVXVxMENO?=
 =?utf-8?B?S0JIVGROQUN4UmFlb0ZnRDllcmlMdzFFbFd3dzVqYzNKakpkQm15ZjRHNjFE?=
 =?utf-8?B?YnBNb3I5WDdxMWJLdVRqeFJrTHFCK1U2cmZaTHlaZFo1WWVyQjRna25JQm1Y?=
 =?utf-8?B?MlE2b0JrTVJmM3lJUTErMkNVWkcxOVdBeDc0bkNwd0lNbHVzUGtlb1hKUjIv?=
 =?utf-8?B?ZVFaWVZORWFvcDAwTU1nSXVFd3NMU2NOYWh0WFQ5WFpWcHlOYmFSSGo2aHl5?=
 =?utf-8?B?djVmUkZ2M25Maml0V1NFL3ZjcDcrQlVPeWN0WWNCa053eEc3YkdOa3pvbjdR?=
 =?utf-8?B?Q2ZCQ3BPNi9tRzYycitWblk4djhrNmdqakJ5SVkveStUK0JzZ24vTCt3em15?=
 =?utf-8?B?UGRoM3IvT09BTDV0eDZQaG1tbGdsS0hMMnhBSm1CcWFvcC9LZkVzWjBmSlAv?=
 =?utf-8?B?cWplSWgxZldwVDZycDRZZlp3ZFJscVY3d2VIaHZneS9ZQzB2Wm5qWkl6MXMy?=
 =?utf-8?B?WVFVSGFrdkpwWEx0ZjFMR043MEVoNzl5Y3FTVjhVbCtOazE0MytibXpZRmNx?=
 =?utf-8?B?bjBEeXRnR0Rya3NqTUZzeml6R2x3Sm9oRVc3ZmNHMmRIZnJOOFVKKzk4TlZ1?=
 =?utf-8?Q?0YOuKmnbxa0IR?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NGpaSTEvcGhpVkhEYW9ZK0lwZENyUnNwUDlYcWVwSU9WSnphMkwyZ0M2YUtx?=
 =?utf-8?B?bEpORk0yWlV4YWxUNlBYYmR4Q09mZWpHay9naG5ZaHQ5bHJJdDJWMnNiZDRG?=
 =?utf-8?B?ZzN2UHVueXNEbnFjY2tINzlON0VUY0lBdFNuMC83NWFUaTk5K2FvTHc5TjBM?=
 =?utf-8?B?UGtTV1h4YkdVZlR6ck84UDVIUXYrOTZxTFdGVGtTRHBLUmNoOFZtYy9VM0dP?=
 =?utf-8?B?ZXZSRlU4MElVeFdTbFYvTEFuUzVZY0I1Nzc1RmJDK0R0ajNuNEdBcFZHWm8w?=
 =?utf-8?B?WVdDdjNNVHdkWW9JUU96dkdQWEZleHdIUUNyRm1FcFhzalM0SURrSXVrcDJQ?=
 =?utf-8?B?MVIvc050MzRVUlBMcy8vKy92V0w5TXhhSVNKSlRWamY0b2sxSkgyVEdBRGlV?=
 =?utf-8?B?RGFLNEZ5U0ZyRmxPRFMycHlGUUx0Nm5LUXF3LzlkV0YveWNHK1pHc3ZaV3pJ?=
 =?utf-8?B?Y3F3SW5ZWTdIa2pnRlorSEQrN1F0ekFPbnpKcmhYOTFTZ0pVSU5GVHg5N0xl?=
 =?utf-8?B?T0F1M1VXbU0zUG54a3VGaUVIMk1jakw2QVRBVUd1UERSL2tHWml0dk5STVc2?=
 =?utf-8?B?SlYvZ1p6UnkrNG1xdGdPWWpLSFN3Rkc4cTNVUGhnTXlteHhyZEVQQ1ZBV2l5?=
 =?utf-8?B?YkdOdzdFcmtoU3grNVpDOFVuZFNtbGZMSkl1bkNUVEVVUW9uUXp5WEZIK045?=
 =?utf-8?B?M0Z2VG4vVFYvN3JUL0QxVU1mL09ySHJRb0IySGZXUWhxbkhteEF4ZTlXazB6?=
 =?utf-8?B?WjQwU1Bpb2VYVmd0RjN6cnJwNUFOWUo3YXdaZ0Z3ZVFRMTEvVXVlMElzK0tI?=
 =?utf-8?B?L0VQMDBDdkNLVS81SHRocHAxSStJUU5pL0pJaWx1cmV4M056ck04R05ORW1O?=
 =?utf-8?B?dUR5K25LOGpLWFYzV2s3cG9kMW80ZFVnTXo3UkdjZGNuWW1rQTZHSERJN1p0?=
 =?utf-8?B?U01IQ3VZclEybk8rNGVpMEY4S2c1ZnREK3dYZ3FuZFlzZS9GSlZhek0xV2Na?=
 =?utf-8?B?ZVMwWTR5bWFubFlzSWtsdm9ydUErWDZ4cE5lc05menlsdHlHbTBnT2NVbEFs?=
 =?utf-8?B?MC81OVVLMGIwU1ptSWNQZzkzQVZKRjl4U2N0ZVVSbjJ6RkNON25RbitSYTAw?=
 =?utf-8?B?ZWo5ZUdwT2xzbW0wR2FJYWNYSXdxV2NWQm8xak1LaEgzUUpEYlRWS2ROOXhC?=
 =?utf-8?B?elRkWWZrRjVCSlRBa0VqajNGS2JPWDc3ZzJVemN5UzFWQ3F6RXdsWHk0MVo5?=
 =?utf-8?B?aWNkVko0bVNDemJGc21DUWZES0JqYnpuOU9OQmZCaDlGY3ZTOUljTGQrb2lB?=
 =?utf-8?B?dzVoeXJoTzJyVWxTUlBia3hPa0ZkVm5qMG9mVEsxWmdwTElHWGY5ZTkyeERB?=
 =?utf-8?B?aVJvYVNCMzBVZEp4MCtNRWo4NEhDYkpEV3dkblVUTWNEZ3VYbkZyZ0NPSFUx?=
 =?utf-8?B?b0o2Q2w1Uk1mMHpFYlRPYXFQaUVmT2xabHd5VW9OdDUzM3FHT0tUZ0xpZ0Ft?=
 =?utf-8?B?RGVFaEIxeEttTUxzTG9lY2xheGFkMXJGODVtdVZIVlBFRGJQUE52dThuaWpp?=
 =?utf-8?B?RFBrcEJ1TWY2ZDhFMkRFZWZWcm0zNndhbGI2NHpPWThTeUluTjZDTTRPbFVD?=
 =?utf-8?B?NC83WjlROGI3NUI5VVllMnNxNlJwYjNxQkpiNDBTaFpHK3BncFZDMkd5T1kw?=
 =?utf-8?B?NHpxWGVrWjFVQ3kwVEYwVmpCVzF1WmNGM0NNbGt4aXpvL0tyQytncEZPdkZ0?=
 =?utf-8?B?Skl0YklnTzA4cVdWYmpmRXl6SGRDbG1JREROM2tmZEVJTjFORkgxckF0bkdk?=
 =?utf-8?B?d0dsNzM1YTJmYW9xTVJsTWdYa0JoTHZPTzlWekx3M1lmZjFHemJRU2ZiY09T?=
 =?utf-8?B?Y2hTQjFScXBHMnhLK3hTeVN5TnhoOGM5UzYyRldpeWZLL1kwS3pyazJBOE0v?=
 =?utf-8?B?TXNBbjYwS2t0bGtOWmIyYmJmSlFOUlFjRnhwQXFWOVJqalpRNEo3dDgxbkYz?=
 =?utf-8?B?MEl6OWJLbURiMlhQMmFQbHViYWZSN0hHSmxFR1kvc0RpOVpEZ2EzQmNBaWxF?=
 =?utf-8?B?dnNyVHNvbHAyMjJtYm02M0ZHdVhHNHVUVzA3eHVCVjllZm83Vk1tWStZV0tX?=
 =?utf-8?B?YTRSTVNnTEhxSmd3OW5IdDIxcW1JMnoxcUVUVDJRdEhnM09GN3NyMHRaUFhH?=
 =?utf-8?B?cVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dbc0b61-e4ba-460d-1248-08ddf03a8efd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:20:45.5568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dycz1eU7KYDdVv2vkv3oX2v81ZKfq5wCHDUjfW7Wo3CYnraXs4t9lJJAMfaTwvuWwj/ZDymDwFEhyNq+JMC9MWczPXxvMh5s7SG6EYPCniU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4660
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: LbIcVc63rSjQUr8iHv3YLbnBVRqZTXa8
X-Authority-Analysis: v=2.4 cv=U4mSDfru c=1 sm=1 tr=0 ts=68c126d0 cx=c_pps
 a=6OJZajHV9Y36iw+II7C7og==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=z8vU8Gr3U-nLPclttLsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=52mdeZd8sWgJSgSe30wA:9 a=5N_rI_m6ce6agC-7:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: VlhXr_BMm0Q844-phMC5MqAXx-QM6q9r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDA2NSBTYWx0ZWRfX/7GbrRHPy7wu
 BBMO9XQF8jPgMG+NTk9bMZck0X1ST6wzlYh4WzjwxpePqyFhpowogD9SRQytNWlRAQDF/4geQQX
 i1ll06QN/zFJiYqf35EeSxXYRJl4Rdv/9yOVVXvS7Y5YfTIaVsUb3gXfsTCQTrUmbRqTbiA09Zm
 +uNzH75AShjeuZJxBGPvhdFqJ/EU5nVP91++Yr4G77rXce5qa2HpIwpWc6RWdf3lmNCdc2CEQQg
 3YnFjFvzIbbScf1N9P64XU1OZIxxd7iHLK9q11KSq5RU4zKu3snPUIJijCguyj7W3TwvnmgMIuq
 QQfGFQUYguyKr5YGKpqrPWqRTs3o5fQRKLT4u+vhYBpzhIFIPjM+c5hN6UXaLI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Sep 2025 07:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119346

--------------02A0OdBNTcAV040Ci8WiyD30
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58A3mdAb3454108


On 8/29/25 12:38, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu, Aug 28, 2025 at 8:30=E2=80=AFPM Changqing Li<changqing.li@windr=
iver.com> wrote:
>>
>> On 8/28/25 22:24, Khem Raj wrote:
>>
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.
>>
>> On Wed, Aug 27, 2025 at 11:45=E2=80=AFPM Changqing Li via
>> lists.openembedded.org
>> <changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>>
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> With ccache enable, python3-fronzenlist do_package_qa failed:
>> ERROR: python3-frozenlist-1.7.0-r0 do_package_qa: QA Issue: File /usr/=
lib64/python3.13/site-packages/frozenlist/.debug/_frozenlist.cpython-313-=
x86_64-linux-gnu.so in package python3-frozenlist-dbg contains reference =
to TMPDIR [buildpaths]
>> ERROR: python3-frozenlist-1.7.0-r0 do_package_qa: QA Issue: File /usr/=
lib64/python3.13/site-packages/frozenlist/_frozenlist.cpython-313-x86_64-=
linux-gnu.so in package python3-frozenlist contains reference to TMPDIR [=
buildpaths]
>>
>> Although we have set -ffile-prefix-map, the buildpaths is not replaced.
>>
>> Its not clear why this is happening. Can. you try doing a rebuild
>> after cleaning sstate and ccache for this package alone ?
>>
>> Hi, Khem
>>
>> Thanks.  I did some tests according to your suggestion,  it turns out =
that:
>>
>> 1.  For clean project with ccache enabled,  bitbake python3-fronzenlis=
t build successfully
>>
>> 2. For clean project, disable ccache, bitbake python3-fronzenlist, it =
will build successfully,
>>
>> then, with the same project, I enabled ccache in local.conf with follo=
wing config, then
>>
>> bitbake python3-fronzenlist will failed with do_packge_qa error.
>>
>> INHERIT +=3D "ccache"
>>
>> CCACHE_DIR =3D "${TMPDIR}/ccache/${MULTIMACH_TARGET_SYS}/${PN}
>>
>> Can you give some suggestion about this issue?
> Try moving ccache outside TMPDIR, I have
>
> CCACHE_TOP_DIR =3D "/mnt/b/yoe/master/build/ccache"
>
>   Keeping CCACHE_DIR out of ${TMPDIR} prevents the cache path itself
> from being found by buildpaths.

Hi, Khem

Thanks. I tried with CCACHE_TOP_DIR out of ${TMPDIR}, but it not works,=20
since the path caused the qa issue is not CCACHE_TOP_DIR.

Here is the strings in .so, it seems that these headers path is added by=20
the backend of pyproject-build.

$strings=20
./usr/lib/python3.13/site-packages/frozenlist/_frozenlist.cpython-313-x86=
_64-linux-gnu.so=20
| grep poky
../../../yocto/builds/test/tmp/work/x86-64-v3-poky-linux/python3-frozenli=
st/1.7.0/recipe-sysroot/usr/include/python3.13/object.h
../../../yocto/builds/test/tmp/work/x86-64-v3-poky-linux/python3-frozenli=
st/1.7.0/recipe-sysroot/usr/include/python3.13/cpython/tupleobject.h
../../../yocto/builds/test/tmp/work/x86-64-v3-poky-linux/python3-frozenli=
st/1.7.0/recipe-sysroot/usr/include/python3.13/cpython/unicodeobject.h
../../../yocto/builds/test/tmp/work/x86-64-v3-poky-linux/python3-frozenli=
st/1.7.0/recipe-sysroot/usr/include/python3.13/cpython/longintrepr.h
../../../yocto/builds/test/tmp/work/x86-64-v3-poky-linux/python3-frozenli=
st/1.7.0/recipe-sysroot/usr/include/python3.13/cpython/listobject.h
../../../yocto/builds/test/tmp/work/x86-64-v3-poky-linux/python3-frozenli=
st/1.7.0/recipe-sysroot/usr/include/python3.13/cpython/dictobject.h
../../../yocto/builds/test/tmp/work/x86-64-v3-poky-linux/python3-frozenli=
st/1.7.0/recipe-sysroot/usr/include/python3.13
../../../yocto/builds/test/tmp/work/x86-64-v3-poky-linux/python3-frozenli=
st/1.7.0/recipe-sysroot/usr/include/python3.13/cpython
/usr/include/c++/15.2.0/x86_64-poky-linux/bits
/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include

../../../yocto/builds/test/tmp/work/x86-64-v3-poky-linux/python3-frozenli=
st/1.7.0/recipe-sysroot/usr/include/python3.13/internal


In general, we use -ffile-prefix-map to replace the buildpath, but when=20
ccache enabled, the replacement not works well.

Besides, I should had make some mistakes during last test, I tried=20
several times today, with clean project, enabled ccache, I can

reproduce this error.

Regards

Changqing

>
>> Regards
>>
>> Changqing
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>>   meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb | 2 =
++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-frozenlist_1.=
7.0.bb b/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
>> index 7d813a026c..363dab969e 100644
>> --- a/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
>> @@ -11,4 +11,6 @@ DEPENDS +=3D " \
>>       python3-expandvars-native \
>>   "
>>
>> +CCACHE_DISABLE =3D "1"
>> +
>>   BBCLASSEXTEND =3D "native nativesdk"
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#119127):https://lists.openembedded.org/g/openembed=
ded-devel/message/119127
>> Mute This Topic:https://lists.openembedded.org/mt/114930913/1997914
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------02A0OdBNTcAV040Ci8WiyD30
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58A3mdAb3454108

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 8/29/25 12:38, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1squvavkkY171jKT_8zAx87Rw1=
x=3D2jNVfW=3DCrNtrjr6UmA@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Thu, Aug 28, 2025 at 8:30=E2=80=AFPM Changqing Li <a class=3D"moz-txt-=
link-rfc2396E" href=3D"mailto:changqing.li@windriver.com">&lt;changqing.l=
i@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">

On 8/28/25 22:24, Khem Raj wrote:

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Wed, Aug 27, 2025 at 11:45=E2=80=AFPM Changqing Li via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li=3Dwindrive=
r.com@lists.openembedded.org">&lt;changqing.li=3Dwindriver.com@lists.open=
embedded.org&gt;</a> wrote:

From: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:chan=
gqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

With ccache enable, python3-fronzenlist do_package_qa failed:
ERROR: python3-frozenlist-1.7.0-r0 do_package_qa: QA Issue: File /usr/lib=
64/python3.13/site-packages/frozenlist/.debug/_frozenlist.cpython-313-x86=
_64-linux-gnu.so in package python3-frozenlist-dbg contains reference to =
TMPDIR [buildpaths]
ERROR: python3-frozenlist-1.7.0-r0 do_package_qa: QA Issue: File /usr/lib=
64/python3.13/site-packages/frozenlist/_frozenlist.cpython-313-x86_64-lin=
ux-gnu.so in package python3-frozenlist contains reference to TMPDIR [bui=
ldpaths]

Although we have set -ffile-prefix-map, the buildpaths is not replaced.

Its not clear why this is happening. Can. you try doing a rebuild
after cleaning sstate and ccache for this package alone ?

Hi, Khem

Thanks.  I did some tests according to your suggestion,  it turns out tha=
t:

1.  For clean project with ccache enabled,  bitbake python3-fronzenlist b=
uild successfully

2. For clean project, disable ccache, bitbake python3-fronzenlist, it wil=
l build successfully,

then, with the same project, I enabled ccache in local.conf with followin=
g config, then

bitbake python3-fronzenlist will failed with do_packge_qa error.

INHERIT +=3D &quot;ccache&quot;

CCACHE_DIR =3D &quot;${TMPDIR}/ccache/${MULTIMACH_TARGET_SYS}/${PN}

Can you give some suggestion about this issue?
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
Try moving ccache outside TMPDIR, I have

CCACHE_TOP_DIR =3D &quot;/mnt/b/yoe/master/build/ccache&quot;

 Keeping CCACHE_DIR out of ${TMPDIR} prevents the cache path itself
from being found by buildpaths.</pre>
    </blockquote>
    <p>Hi, Khem</p>
    <p>Thanks. I tried with <span style=3D"white-space: pre-wrap">CCACHE_=
TOP_DIR out of </span><span style=3D"white-space: pre-wrap">${TMPDIR}, bu=
t it not works,  since the path caused the qa issue is not  </span><span =
style=3D"white-space: pre-wrap">CCACHE_TOP_DIR.</span></p>
    <p><span style=3D"white-space: pre-wrap">Here is the strings in .so, =
 it seems that these headers path is added by the backend of pyproject-bu=
ild.</span></p>
    $strings
./usr/lib/python3.13/site-packages/frozenlist/_frozenlist.cpython-313-x86=
_64-linux-gnu.so
    | grep poky<br>
../../../yocto/builds/test/tmp/work/x86-64-v3-poky-linux/python3-frozenli=
st/1.7.0/recipe-sysroot/usr/include/python3.13/object.h<br>
../../../yocto/builds/test/tmp/work/x86-64-v3-poky-linux/python3-frozenli=
st/1.7.0/recipe-sysroot/usr/include/python3.13/cpython/tupleobject.h<br>
../../../yocto/builds/test/tmp/work/x86-64-v3-poky-linux/python3-frozenli=
st/1.7.0/recipe-sysroot/usr/include/python3.13/cpython/unicodeobject.h<br=
>
../../../yocto/builds/test/tmp/work/x86-64-v3-poky-linux/python3-frozenli=
st/1.7.0/recipe-sysroot/usr/include/python3.13/cpython/longintrepr.h<br>
../../../yocto/builds/test/tmp/work/x86-64-v3-poky-linux/python3-frozenli=
st/1.7.0/recipe-sysroot/usr/include/python3.13/cpython/listobject.h<br>
../../../yocto/builds/test/tmp/work/x86-64-v3-poky-linux/python3-frozenli=
st/1.7.0/recipe-sysroot/usr/include/python3.13/cpython/dictobject.h<br>
../../../yocto/builds/test/tmp/work/x86-64-v3-poky-linux/python3-frozenli=
st/1.7.0/recipe-sysroot/usr/include/python3.13<br>
../../../yocto/builds/test/tmp/work/x86-64-v3-poky-linux/python3-frozenli=
st/1.7.0/recipe-sysroot/usr/include/python3.13/cpython<br>
    /usr/include/c++/15.2.0/x86_64-poky-linux/bits<br>
    /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include<br>
    <p>../../../yocto/builds/test/tmp/work/x86-64-v3-poky-linux/python3-f=
rozenlist/1.7.0/recipe-sysroot/usr/include/python3.13/internal</p>
    <p><br>
    </p>
    <p><span style=3D"white-space: pre-wrap">In general, we use </span><s=
pan style=3D"white-space: pre-wrap">-ffile-prefix-map to replace the buil=
dpath, but when ccache enabled,  the replacement not works well.</span></=
p>
    <p><span style=3D"white-space: pre-wrap">
</span></p>
    <p><span style=3D"white-space: pre-wrap">Besides,  I should had make =
some mistakes during last test,  I tried several times today,  with clean=
 project,  enabled ccache,  I can</span></p>
    <p><span style=3D"white-space: pre-wrap">reproduce this error.</span>=
</p>
    <p><span style=3D"white-space: pre-wrap">
</span></p>
    <p><span style=3D"white-space: pre-wrap">
</span></p>
    <p></p>
    <p>Regards</p>
    <p>Changqing<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1squvavkkY171jKT_8zAx87Rw1=
x=3D2jNVfW=3DCrNtrjr6UmA@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">
Regards

Changqing

Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0=
.bb b/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
index 7d813a026c..363dab969e 100644
--- a/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
@@ -11,4 +11,6 @@ DEPENDS +=3D &quot; \
     python3-expandvars-native \
 &quot;

+CCACHE_DISABLE =3D &quot;1&quot;
+
 BBCLASSEXTEND =3D &quot;native nativesdk&quot;
--
2.34.1


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#119127): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/119127">https:=
//lists.openembedded.org/g/openembedded-devel/message/119127</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/114930913/1997914">https://lists.openembedded.org/mt=
/114930913/1997914</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------02A0OdBNTcAV040Ci8WiyD30--

