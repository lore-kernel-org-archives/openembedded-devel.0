Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE12BE77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 14:07:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.20919.1736258828556073753
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 06:07:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=31028c9742=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507Bkald030000
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Jan 2025 14:07:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43xt70k3ve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 14:07:07 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 507E4eoP006758
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Jan 2025 14:07:06 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43xt70k3vd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 14:07:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emmLENaAqWZCJ9R3OZZJUGzLSBclsLHls8/d3VL/KK3s8csdiB3nJjGtz6t1Lb8xr/HghhRv0uKWn0mANtFdtnnjzwbNXRDttlZxTCCalMaUDOInrFuDDUjnnWnQ9mtAC+Vc4JfjLlkpeR4PNuUX2cgux9xQgkUODmTf4H9m7CiD8WZZBS7Yys8kfhqSV+VMIMyZ7C7r8m3LwRWEG38THvC8/kNLEhIPFV1BTz0QfiRcgsL5P1RFzTEYkDhWECyTm4jrl9hLcx00R7Jq7z/euyYTCKh4RznQYb7HxABXzX5PXzVqZZoqU1A1JLmIAh27LASpA4h+PJm+xIR2/i6S2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1d+Y5D5JqSVB1rA14IQcALJVCQwq5kt+MBsrQrzR5Xw=;
 b=khuDbmfxTQ0J1dLH2FqmYaEuhngK1hvLsYXyqeylcvsVkNk0iADhzvNwhJTmXrbNuJWISBbFCFCgpjrKQ5mXTrSpcalD397CXoU38TbEUS3bkAWRDfWUtTJzkKGSlcDakkTYWHjN47iTeX8Yy35wAwi3HiIzlCg2r+5gCVEAU3a7CP5Zxzv8dEk1T4accPEjurkckHPGTSZ6e49zB87WOt3ZLddsaDhRv+YBq2X7VdqtoKCYIed3NKqaMGraon/j9yIFTv2CY6QtqMI8QaO+gl9vEPc99thvhrf+wUSMHsGYLEevvZTfUq2DfFElBxa4ZmHx/NdAZn8+93BvL8FWHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by SJ1PR11MB6251.namprd11.prod.outlook.com (2603:10b6:a03:458::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 14:06:58 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%7]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 14:06:58 +0000
Content-Type: multipart/alternative;
 boundary="------------RggKkDzmqGQp0lcN8mS4lQxM"
Message-ID: <e8c59a00-571a-4452-af2f-d57b1422ae26@windriver.com>
Date: Tue, 7 Jan 2025 22:06:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] lapack: fix TMPDIR reference in
 do_package_qa
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250103084525.1990937-1-peng.zhang1.cn@windriver.com>
 <CA+chaQe7QsX5-ZMfRYFDpY8CRJ3Cp2fU=TArP9Ucm_OK55K7DQ@mail.gmail.com>
Content-Language: en-US
From: Peng Zhang <peng.zhang1.cn@windriver.com>
In-Reply-To: <CA+chaQe7QsX5-ZMfRYFDpY8CRJ3Cp2fU=TArP9Ucm_OK55K7DQ@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0032.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::10) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|SJ1PR11MB6251:EE_
X-MS-Office365-Filtering-Correlation-Id: d070a2c8-fb63-49ed-6fde-08dd2f248c92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|4022899009|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WWprWHlLeXpBdnNCbzRSSS9ubkJHVU1UTzZmeGdUVTZvZG1BVEV2UjZ5WkE4?=
 =?utf-8?B?L1FDaXpCcTZLMTBsYkYyWFhacVg1OEF0WFhUYXhuaWxoajIwMnBCOEp5TFdC?=
 =?utf-8?B?enh3Z0RKTzZrclE1c01NZHl1UjB6MkRhUzBPWXZkS0xnMGtYeTNuVGpBcFFJ?=
 =?utf-8?B?cExKVFh6MjRPNDhyZE50cUhUbHFPdFFEVzlZR1QyUE4wamc3bGlLdTExcUlS?=
 =?utf-8?B?RzU4OUxDZU1adTJoRk1ZSlM1ZjdIT1N0SWNLYm9CYmYyWmIwT2tFUzNjZVVM?=
 =?utf-8?B?NllsRk9UdlhwaXdaVnZkL2Jxc3l0UkZFYTM5MGwyVXhESStuVGhhSUE5Tmxr?=
 =?utf-8?B?TU1Ca3lhNW1LaVBUclVLdFcvNjExNkFiclJXWnNOT2JNRlB5Z3lVYjRQM2FB?=
 =?utf-8?B?MTZHcWYyS3RDUUxQRXYzWDZTRDM3L0xMaGEwVW1tV2ZKNmhtc2gzcS9DZHBD?=
 =?utf-8?B?Z2EwY1pieVdxUUtpeEJEU016Q1JOZDJ6NHk4eWM4VVcxVVdVWjRTaEgyVmp6?=
 =?utf-8?B?R20zZ0dqYW9pMEFJbHFPM05ibmhhN2NMM2JTVndNamJxVmRXYStjOHc5NXpl?=
 =?utf-8?B?M2FMSnp2S1Y2R1VvZWMvMngrYWYraU0zNVM5UFBHYzRQbnpzelQ5eUdMS0dX?=
 =?utf-8?B?VU85cEhkOUFYMFBhZjNiNW05ZXBocFp2RTdYVlJEMFFWTnNGNHd5RFhmM3BB?=
 =?utf-8?B?aHBreGJoeGFhSXp4S0NaWTN4OENNQmVwY0kxRlkzQm56bnhLM21BVlI1Mlhp?=
 =?utf-8?B?NWJvYTIvSjlraGI0QldNRUtPTUFhbFhvMTk4ZUhZL2doelRkT2Ryb3BTdEtj?=
 =?utf-8?B?UkJRTXdjQ2dMaU43a21ONjJvVXpXbDRIeUQzTEcxUWhEcHVKOXUwSUwyOTFY?=
 =?utf-8?B?anNvNHZzL1JnV0ZXeEtuaXlKcnlmQ2xQMnF1amhqMzlnZkVtUjMvWU1WQnc2?=
 =?utf-8?B?cFFLUk5IRDRWMXRjK2MvbHBwaUJPUUtuWW9oWVprOHFFaUt1cmhXS3Y1LzhI?=
 =?utf-8?B?RWhqNkIvb2RnL2JRdWkzVjY0WnFTaXVzY3dJN3hGSVhyTTIxS1pENWtNeGZz?=
 =?utf-8?B?UFdwT1B2ZnZ1RSs3R3hIVENkNkNjMG9kTXNZS3cvUUdJWmJLcnZoYS8zOFNo?=
 =?utf-8?B?MlBxWlJEMFZlYmx5bTJCNC9CYW5aRTZrSDN6OHVSMVJLVzBDT3h1UjlKTGdr?=
 =?utf-8?B?eDRXYlVyN0tESTFJb1VwYm1IVW1sRzZpSDgxR2R4S2NoaUpVeFN6dnl3a21a?=
 =?utf-8?B?UVBjVVJsaHFKcCtnd1dpdGpabFN4MTJTTmo4bHNVZWhmbVNzMGI3QXIrZXl0?=
 =?utf-8?B?bGFzd1pTbG5PNnduc3lnY3cxQlM5TE9JcWFUeHlNTkpNcGM2YVh1M3RHL1JU?=
 =?utf-8?B?M1RLSTFIMDJhVDhaeXVid0VPWUMyWDREYlp3UFJ1aFIwLzJKMEdUNFdnM3U5?=
 =?utf-8?B?RVk2N1d4eTI2bmgrOUlzNHZBMUtlNWp2UVZ0Q05WNFZyNnFQNFhab1F3Z3dL?=
 =?utf-8?B?TnlyOXpDQWs4WGxubXJqYkVkbFBTZDBWZ3h2dW5DT0lTV3BLc2J6MkwxZHdY?=
 =?utf-8?B?QVVocVRCVnNhRzV1SHJTZG9QWXlNUmYxV1JwTU9JSmR4NnlvU3crTWVJbHMw?=
 =?utf-8?B?ZkdMdWxxMGpBeDlUeDVPdzZsb0pwZWpodjY2OUNER3ZnaXhkRkRtRU53bUtr?=
 =?utf-8?B?d21GL0Y3MGhYRmc2VktrNnc0RzlsZWxsdUo0c0pjc2RMOHQxQXd1VXNmU0lL?=
 =?utf-8?B?ZXNZUEsrOUowazRXUmVZcitJajZaYWh3d0RScWcrUmFFS3I4dWIzbzJYWDRD?=
 =?utf-8?B?bHNWLzE5bHRmSENpUWQvQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(376014)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TnViWXNwL0x3VFRwbDUvVW5ZWS9oUCtnZldNcFFnS2duRGlSUzY4TitHN1V6?=
 =?utf-8?B?SDlPaUxxaTRqYmdTTjk1UE1zYW8vSVE3RExSMlgvdHBSMlB2S3ZRcTFlUlpo?=
 =?utf-8?B?NCs2SFRhK0psQlRmdENRTFR2UUFqL0E5aitBaG5pN2lTWTgzZlR4Y2pTaGZz?=
 =?utf-8?B?Q1lOSGxtbGIrQTlKWkd0bEkvb1BFYkdweDh5N1RQcmR0WmVKYVExdUdxK1VT?=
 =?utf-8?B?TE0vVEV3RDBNeUhxMXdKOWszSkpFcmo5MkxYei9DQUg4TkxIcU1ZUk16Q2o2?=
 =?utf-8?B?WjM3dkNsMVlqeTF2L2htTjlwbElZMGlMdFBFaC8vU1htQzNKbTY0RlBkREVI?=
 =?utf-8?B?T29SYThlOVdBSzhlalpyYkJzR3NOOVYzYW1EZU1NenY2M1BVWFE5Q0NFS3lj?=
 =?utf-8?B?U09NZGlSTHNidWZZVm04Qnc3MDM0RTJTakRQMW95V3BBZ0taSnZYM2VITkxa?=
 =?utf-8?B?MnRhWG8wVzNYeVdGN24zSWdVRWtiRDZEanNuS2ZiU3RrZ3k5dHRKWStWUm15?=
 =?utf-8?B?WXVhbUJsSmw3d3NpYlBwVmZZakRFU3FRTlA4aTZBZnJpdmR5blBvemZuUHdJ?=
 =?utf-8?B?SHUySDlKUDhtWFMyMGh2Sjh2WWJmME9pODhER2s5TTJqMFM0SmN1RWlRMVEr?=
 =?utf-8?B?MG1MdkZWUVFDOUNqTE1peS9QcjBEZUJyZ0RhdlRRdHBEMm1XVFlyRGZsZGNC?=
 =?utf-8?B?N3JQaWkxdktLNXRmdEg3U1dNR3JJdHBLMUZGYmJwUkE4SHJCZDdxVVNJSmxR?=
 =?utf-8?B?enBUNDB0S0xFMGZwWjZLZ1NldkFXZkgrazBUSDdEMW4yYzQzZVBLMDRLeW0x?=
 =?utf-8?B?aHVhVW9Sb0J2SzgvTjMveWhSSWZ6ZWRobDJYYU5sSDJCeXVndjFuTUVuaGRZ?=
 =?utf-8?B?UTNRZy96SDV2K21wU0ZqQUhGYkdPRGlpTnozYzB1UVR2MVNwUWtNTUNQSWsv?=
 =?utf-8?B?YlhKeDdnVk1lVmFlQm9kajNQN1RQaHVodzhvbTRrUHpCb2JQWHg3QXdSZitW?=
 =?utf-8?B?bzVGTk02TTQ2d2R4dlN3b1RjUHVuNllTcE5WbGs0dXpGd21WZEdwdkZIc3ln?=
 =?utf-8?B?ek5MWEpkdmlOd3NUYTI2S1FvZC9SWjUvbmd6R1grV2FCUmpqc05KeUVLaFFE?=
 =?utf-8?B?TEdjR2RRSVF6WkVsQTJzNDYxRzFzY3FxMGxuTURxa3B3K1JPUVlZTVVjRWk1?=
 =?utf-8?B?VkpFLyt3bVNJTm5ERVM1cGZ0R0pXR3RMZ1VJVnRpQnl6SGVZMjExaHVQSndU?=
 =?utf-8?B?UktwWUVRYWlBcEhzV29yQW5LSDlRQTArbUlRZlZyQWVyWGFBdXRIQlo5TjZz?=
 =?utf-8?B?bGhlWGhibDhjWUpVeGxWL25qMXdWWDlFRVdUZDI3UHNYa1BlVXpsU0UzbXBt?=
 =?utf-8?B?NVpCc1hiQ3ZLYmV3bEFsYWxzRndLdmEvalU5S1cyTkVrTVBCTDhJS0Jnb1V1?=
 =?utf-8?B?ZE1hZzhBZXlMQWMvKzBSSDNQdEcrZllyNTM3MStudEJ0elQ5Z3I3R21tOE16?=
 =?utf-8?B?ZVQwSU5lb1I0Smwvemtnb01ZcDFRSWpMWnF3QmdjWVhpOVNRSFJtNFBibGZh?=
 =?utf-8?B?MDhVRHhFWWYxMzZnUytVcjhYNGx3VlRNZTNLTUNEZ1ZUOFd2Rzh0V1JTZnJW?=
 =?utf-8?B?OGVEMmdIOWRDcklaODVDVzA3TS94UFk0SUhZdlFXQWp2YlBQT3ZzQ1RqZE1D?=
 =?utf-8?B?UlYyKzlmNi9QVTdHUEJXRmRVSWxqeWZsVWUvNnhhNGtnR1NvK2V4bjVnTVNx?=
 =?utf-8?B?Mi9tL3NyNW5NcytRTVJZejAraU1Cc1ByclRQVEllRXBWanR0bXI3eUhIZ0lL?=
 =?utf-8?B?U0N3MDltdGM1OHRJUmswUXIvblFOY05kQkZYWFlObTNGVGtJbWVoVWk2R1hC?=
 =?utf-8?B?bkE1ZWpPNFA1aXhtWXF2RzZraWVWZDVBQklubm1IZStSM092ZncwWk5kS0xL?=
 =?utf-8?B?b1VqbDBWZ0VhYmJOZjF5U2ZZV0hjMEZTbTNHa3ZBRTdTM0xYTEswVlZrc05m?=
 =?utf-8?B?VXpqenduSUtYOFlSK3E2SnFqY0pRRStIQ0lpWUNscHhrT2RZdloyL21tdVV1?=
 =?utf-8?B?M1VtU2htbWxSQklKY3FKQkd4aFpHc283Z200VE43VVNXVDFpTHhrODc4VUJl?=
 =?utf-8?B?c0Uzc3YzQmc1OFhwMWJlaFpzT2wwRktic0Jic2ZlVFNOSDB0Mm5WOWkvNVVW?=
 =?utf-8?B?UEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d070a2c8-fb63-49ed-6fde-08dd2f248c92
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 14:06:58.2755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Mnle+/dhJiOs+E5dePLOOdd7By778j52Rlf3yySgocUTpy0AiDYkwAV2e9WyEz702tFhtXFmOhWD/mXzMwOfqOYsiN8bVnWSCZTHG3GBuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6251
X-Proofpoint-GUID: iGTQL3nrJ2Wzx6dw-LFRKFUULXn8FI32
X-Proofpoint-ORIG-GUID: Ru3zO7WN9F6lLjLznBN9ElXaFpRM2RUa
X-Authority-Analysis: v=2.4 cv=T/l2T+KQ c=1 sm=1 tr=0 ts=677d350b cx=c_pps a=2TzYObwzRp/N0knVItohZg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=E-fnscIRhXj8kBO34RkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iaZW5-mRKTR581f75CcA:9 a=o_eN4lIbblTFT9rq:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-07_02,2025-01-06_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501070118
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 14:07:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114706

--------------RggKkDzmqGQp0lcN8mS4lQxM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 507Bkald030000


On 1/6/25 20:43, Martin Jansa wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Thank you for looking into this.
>
> I've tried your change and with ptest in DISTRO_FEATURES I'm still
> seeing quite a few errors:
>
> NOTE: recipe lapack-3.12.0-r0: task do_package_qa: Started
> ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
> /usr/lib/lapack/ptest/bin/xlintstrfs in package lapack-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
> /usr/lib/lapack/ptest/bin/xlintstrfd in package lapack-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
> /usr/lib/lapack/ptest/bin/xblat3c in package lapack-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
> /usr/lib/lapack/ptest/bin/xblat2d in package lapack-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
> /usr/lib/lapack/ptest/bin/xlintsts in package lapack-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
> /usr/lib/lapack/ptest/bin/xlintstrfz in package lapack-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
> /usr/lib/lapack/ptest/bin/xlintstd in package lapack-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
> /usr/lib/lapack/ptest/bin/xblat3d in package lapack-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
> /usr/lib/lapack/ptest/bin/xlintstc in package lapack-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
> /usr/lib/lapack/ptest/bin/xlintstrfc in package lapack-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
> /usr/lib/lapack/ptest/bin/xblat3s in package lapack-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
> /usr/lib/lapack/ptest/bin/xblat1z in package lapack-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
> /usr/lib/lapack/ptest/bin/xblat3z in package lapack-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
> /usr/lib/lapack/ptest/bin/xblat2c in package lapack-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
> /usr/lib/lapack/ptest/bin/xlintstz in package lapack-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
> /usr/lib/lapack/ptest/bin/xeigtstd in package lapack-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
> /usr/lib/lapack/ptest/bin/xeigtsts in package lapack-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
> /usr/lib/lapack/ptest/bin/xeigtstc in package lapack-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
> /usr/lib/lapack/ptest/bin/xblat2z in package lapack-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
> /usr/lib/lapack/ptest/bin/xblat1s in package lapack-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
> /usr/lib/lapack/ptest/bin/xeigtstz in package lapack-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
> /usr/lib/lapack/ptest/bin/xlintstds in package lapack-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
> /usr/lib/lapack/ptest/bin/xblat1d in package lapack-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
> /usr/lib/lapack/ptest/bin/xblat1c in package lapack-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
> /usr/lib/lapack/ptest/bin/xlintstzc in package lapack-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
> /usr/lib/lapack/ptest/bin/xblat2s in package lapack-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lapack-3.12.0-r0 do_package_qa: Fatal QA errors were found, fail=
ing task.
> ERROR: Logfile of failure stored in:
> /OE/build/oe-core/tmp/work/core2-64-oe-linux/lapack/3.12.0/temp/log.do_=
package_qa.3908379
>
> Can you please check with ptest enabled?
I had not focused on the ptest enable before. After checking with ptest=20
enabled, I found that a total of 26 files contain the TMPDIR issue, as=20
shown in your log.
Regarding the patch, I consider it a workaround rather than a proper=20
solution. I also raised the issue here [1], but there hasn=E2=80=99t been=
 a fix=20
yet. I would appreciate help from OE experts to see if there are any=20
other possible solutions to address this. I=E2=80=99ve also made a reques=
t in [2].
For the ptest issue, I could fix it using the same method, but it would=20
be much rougher as more files need to be handled.

[1] https://github.com/Reference-LAPACK/lapack/issues/1087
[2] https://lists.openembedded.org/g/openembedded-devel/message/114624

Thanks very much

//Peng

>
> On Fri, Jan 3, 2025 at 9:45=E2=80=AFAM Zhang, Peng (Paul) (CN) via
> lists.openembedded.org
> <peng.zhang1.cn=3Dwindriver.com@lists.openembedded.org>  wrote:
>> From: Zhang Peng<peng.zhang1.cn@windriver.com>
>>
>> When building the `lapack` package, the following QA error occurs:
>> "File /usr/lib64/libblas.so.3.12.0 in package lapack contains referenc=
e to TMPDIR [buildpaths]"
>>
>> The issue arises because the `xerbla.o` object file embeds the absolut=
e host path of `xerbla.f`.
>> This occurs during compilation, where the build command in `build.make=
` (generated by CMake) specifies:
>> `gfortran -c <absolute path>/xerbla.f -o`.
>>
>> As a result, the absolute path is included in `xerbla.o`. Unfortunatel=
y, `gfortran` does not support
>> flags like `-fdebug-prefix-map` or `-ffile-prefix-map` to remove such =
paths.
>>
>> To resolve this, the fix involves replacing the absolute path of `xerb=
la.f` in the generated
>> `build.make` file with a relative path before the compilation step. Th=
is ensures that the
>> resulting `xerbla.o` does not contain any references to TMPDIR, passin=
g the `do_package_qa` check.
>>
>> Signed-off-by: Zhang Peng<peng.zhang1.cn@windriver.com>
>> ---
>>   .../recipes-devtools/lapack/lapack_3.12.0.bb  | 23 +++++++++++++++++=
++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb b/meta-o=
e/recipes-devtools/lapack/lapack_3.12.0.bb
>> index fef9d3a80e..ef5726eeaa 100644
>> --- a/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
>> +++ b/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
>> @@ -33,6 +33,29 @@ OECMAKE_GENERATOR =3D "Unix Makefiles"
>>   inherit cmake pkgconfig ptest
>>   EXCLUDE_FROM_WORLD =3D "1"
>>
>> +# The `xerbla.o` file contains an absolute path in `xerbla.f.o`, but =
the options
>> +# `-fdebug-prefix-map` and `-ffile-prefix-map` cannot be used because=
 gfortran does not support them.
>> +# To address this issue, we manually replace the absolute path with a=
 relative path
>> +# in the generated `build.make` file.
>> +#
>> +# An issue has been reported:https://github.com/Reference-LAPACK/lapa=
ck/issues/1087,
>> +# requesting a fix in the source code.
>> +#
>> +# This workaround resolves the TMPDIR [buildpaths] issue by convertin=
g the absolute path
>> +# of `xerbla.f` to a relative path. The steps are as follows:
>> +#
>> +# 1. Locate all `build.make` files after the `do_configure` step is c=
ompleted.
>> +# 2. Compute the relative path for `xerbla.f` based on the current bu=
ild directory.
>> +# 3. Replace the absolute path with the calculated relative path in t=
he `build.make` files
>> +
>> +do_configure:append(){
>> +    for file in `find ${B} -name build.make`; do
>> +        sed -i -e "s#\(.*-c \).*\(/xerbla\.f \)#\1$(grep '\-c .*xerbl=
a\.f' $file | awk -F'cd ' '{print $2}'| \
>> +                awk '{src=3D$1; sub(/.*-c /, ""); sub(/xerbla\.f.*/, =
""); obj=3D$0; print src, obj}' | \
>> +                while read src obj; do echo "$(realpath --relative-to=
=3D"$src" "$obj")"; done)\2#g" $file
>> +        done
>> +}
>> +
>>   do_install_ptest () {
>>       rsync -a ${B}/TESTING ${D}${PTEST_PATH} \
>>             --exclude CMakeFiles \
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#114623):https://lists.openembedded.org/g/openembed=
ded-devel/message/114623
>> Mute This Topic:https://lists.openembedded.org/mt/110403421/3617156
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub =
 [martin.jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------RggKkDzmqGQp0lcN8mS4lQxM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 1/6/25 20:43, Martin Jansa wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQe7QsX5-ZMfRYFDpY8CRJ3Cp2fU=
=3DTArP9Ucm_OK55K7DQ@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes from=
 a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Thank you for looking into this.

I've tried your change and with ptest in DISTRO_FEATURES I'm still
seeing quite a few errors:

NOTE: recipe lapack-3.12.0-r0: task do_package_qa: Started
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xlintstrfs in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xlintstrfd in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xblat3c in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xblat2d in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xlintsts in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xlintstrfz in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xlintstd in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xblat3d in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xlintstc in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xlintstrfc in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xblat3s in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xblat1z in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xblat3z in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xblat2c in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xlintstz in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xeigtstd in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xeigtsts in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xeigtstc in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xblat2z in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xblat1s in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xeigtstz in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xlintstds in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xblat1d in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xblat1c in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xlintstzc in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xblat2s in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: Fatal QA errors were found, failing =
task.
ERROR: Logfile of failure stored in:
/OE/build/oe-core/tmp/work/core2-64-oe-linux/lapack/3.12.0/temp/log.do_pack=
age_qa.3908379

Can you please check with ptest enabled?</pre>
    </blockquote>
    <div data-slate-node=3D"element" style=3D"position: relative;"><span da=
ta-slate-node=3D"text"><span data-slate-leaf=3D"true" data-sent-id=3D"V5dLy=
Ek7re" class=3D"null"><span data-slate-string=3D"true">I had not focused on=
 the ptest
            enable before. </span></span></span><span data-slate-node=3D"te=
xt"><span data-slate-leaf=3D"true" data-sent-id=3D"zyq17nOwvz" class=3D"nul=
l"><span data-slate-string=3D"true">After checking with ptest enabled,
            I found that a total of 26 files contain the TMPDIR issue,
            as shown in your log.</span></span></span></div>
    <div data-slate-node=3D"element" style=3D"position: relative;"><span da=
ta-slate-node=3D"text"><span data-slate-leaf=3D"true" data-sent-id=3D"e2aZy=
KNE3B" class=3D"null"><span data-slate-zero-width=3D"n" data-slate-length=
=3D"0">
          </span></span></span></div>
    <div data-slate-node=3D"element" style=3D"position: relative;"><span da=
ta-slate-node=3D"text"><span data-slate-leaf=3D"true" data-sent-id=3D"eEJyp=
5D4dV" class=3D"null"><span data-slate-string=3D"true">Regarding the patch,=
 I consider it
            a workaround rather than a proper solution. </span></span></spa=
n><span data-slate-node=3D"text"><span data-slate-leaf=3D"true" data-sent-i=
d=3D"Bowl7AO74B" class=3D"null"><span data-slate-string=3D"true">I also rai=
sed the issue here [1],
            but there hasn=E2=80=99t been a fix yet. </span></span></span><=
span data-slate-node=3D"text"><span data-slate-leaf=3D"true" data-sent-id=
=3D"V0wgy6vyre" class=3D"null"><span data-slate-string=3D"true">I would app=
reciate help from OE
            experts to see if there are any other possible solutions to
            address this. </span></span></span>I=E2=80=99ve also made a req=
uest
      in [2].</div>
    <div data-slate-node=3D"element" style=3D"position: relative;"><span da=
ta-slate-node=3D"text"><span data-slate-leaf=3D"true" data-sent-id=3D"eJ5yj=
8QjOB" class=3D"null"><span data-slate-zero-width=3D"n" data-slate-length=
=3D"0">
          </span></span></span></div>
    <div data-slate-node=3D"element" style=3D"position: relative;"><span da=
ta-slate-node=3D"text"><span data-slate-leaf=3D"true" data-sent-id=3D"BXxkL=
R7LxB" class=3D"null"><span data-slate-string=3D"true">For the ptest issue,=
 I could fix it
            using the same method, but it would be much rougher as more
            files need to be handled.</span></span></span></div>
    <div data-slate-node=3D"element" style=3D"position: relative;"><span da=
ta-slate-node=3D"text"><span data-slate-leaf=3D"true" data-sent-id=3D"BXxkL=
R7LxB" class=3D"null"><span data-slate-string=3D"true"><br>
          </span></span></span></div>
    <div data-slate-node=3D"element" style=3D"position: relative;"><span da=
ta-slate-node=3D"text"><span data-slate-leaf=3D"true" data-sent-id=3D"exv87=
nO7dz" class=3D"null"><span data-slate-zero-width=3D"n" data-slate-length=
=3D"0">
          </span></span></span></div>
    <div data-slate-node=3D"element" style=3D"position: relative;" data-sla=
te-fragment=3D"JTVCJTdCJTIydHlwZSUyMiUzQSUyMnBhcmFncmFwaCUyMiUyQyUyMmNoaWxk=
cmVuJTIyJTNBJTVCJTdCJTIyaWQlMjIlM0ElMjJWNWRMeUVrN3JlJTIyJTJDJTIycGFyYUlkeCU=
yMiUzQTAlMkMlMjJzcmMlMjIlM0ElMjJJJTIwaGFkJTIwbm90JTIwZm9jdXNlZCUyMG9uJTIwdG=
hlJTIwcHRlc3QlMjBlbmFibGUlMjBiZWZvcmUuJTIwJTIyJTJDJTIyZHN0JTIyJTNBJTIyJUU2J=
Tg4JTkxJUU0JUI5JThCJUU1JTg5JThEJUU2JUIyJUExJUU2JTlDJTg5JUU0JUI4JTkzJUU2JUIz=
JUE4JUU0JUJBJThFcHRlc3QlRTUlOTAlQUYlRTclOTQlQTglRTMlODAlODIlMjIlMkMlMjJtZXR=
hZGF0YSUyMiUzQSUyMiUyMiUyQyUyMm1ldGFEYXRhJTIyJTNBJTVCJTVEJTJDJTIydGV4dCUyMi=
UzQSUyMkklMjBoYWQlMjBub3QlMjBmb2N1c2VkJTIwb24lMjB0aGUlMjBwdGVzdCUyMGVuYWJsZ=
SUyMGJlZm9yZS4lMjAlMjIlN0QlMkMlN0IlMjJpZCUyMiUzQSUyMnp5cTE3bk93dnolMjIlMkMl=
MjJwYXJhSWR4JTIyJTNBMCUyQyUyMnNyYyUyMiUzQSUyMkFmdGVyJTIwY2hlY2tpbmclMjB3aXR=
oJTIwcHRlc3QlMjBlbmFibGVkJTJDJTIwSSUyMGZvdW5kJTIwdGhhdCUyMGElMjB0b3RhbCUyMG=
9mJTIwMjYlMjBmaWxlcyUyMGNvbnRhaW4lMjB0aGUlMjBUTVBESVIlMjBpc3N1ZSUyQyUyMGFzJ=
TIwc2hvd24lMjBpbiUyMHlvdXIlMjBsb2cuJTIyJTJDJTIyZHN0JTIyJTNBJTIyJUU1JTlDJUE4=
JUU2JUEzJTgwJUU2JTlGJUE1JUU2JTk4JUFGJUU1JTkwJUE2JUU1JTkwJUFGJUU3JTk0JUE4JUU=
0JUJBJTg2cHRlc3QlRTUlOTAlOEUlRUYlQkMlOEMlRTYlODglOTElRTUlOEYlOTElRTclOEUlQj=
AlRTUlODUlQjElRTYlOUMlODkyNiVFNCVCOCVBQSVFNiU5NiU4NyVFNCVCQiVCNiVFNSU4QyU4N=
SVFNSU5MCVBQlRNUERJUiVFOSU5NyVBRSVFOSVBMiU5OCVFRiVCQyU4QyVFNSVBNiU4MiVFNiU4=
MiVBOCVFNyU5QSU4NCVFNiU5NyVBNSVFNSVCRiU5NyVFNiU4OSU4MCVFNyVBNCVCQSVFMyU4MCU=
4MiUyMiUyQyUyMm1ldGFkYXRhJTIyJTNBJTIyJTIyJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNU=
QlMkMlMjJ0ZXh0JTIyJTNBJTIyQWZ0ZXIlMjBjaGVja2luZyUyMHdpdGglMjBwdGVzdCUyMGVuY=
WJsZWQlMkMlMjBJJTIwZm91bmQlMjB0aGF0JTIwYSUyMHRvdGFsJTIwb2YlMjAyNiUyMGZpbGVz=
JTIwY29udGFpbiUyMHRoZSUyMFRNUERJUiUyMGlzc3VlJTJDJTIwYXMlMjBzaG93biUyMGluJTI=
weW91ciUyMGxvZy4lMjIlN0QlNUQlN0QlMkMlN0IlMjJ0eXBlJTIyJTNBJTIycGFyYWdyYXBoJT=
IyJTJDJTIyY2hpbGRyZW4lMjIlM0ElNUIlN0IlMjJpZCUyMiUzQSUyMmUyYVp5S05FM0IlMjIlM=
kMlMjJwYXJhSWR4JTIyJTNBMSUyQyUyMnNyYyUyMiUzQSUyMiUyMiUyQyUyMmRzdCUyMiUzQSUy=
MiUyMiUyQyUyMm1ldGFkYXRhJTIyJTNBJTIyJTIyJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNUQ=
lMkMlMjJ0ZXh0JTIyJTNBJTIyJTIyJTdEJTVEJTdEJTJDJTdCJTIydHlwZSUyMiUzQSUyMnBhcm=
FncmFwaCUyMiUyQyUyMmNoaWxkcmVuJTIyJTNBJTVCJTdCJTIyaWQlMjIlM0ElMjJlRUp5cDVEN=
GRWJTIyJTJDJTIycGFyYUlkeCUyMiUzQTIlMkMlMjJzcmMlMjIlM0ElMjJSZWdhcmRpbmclMjB0=
aGUlMjBwYXRjaCUyQyUyMEklMjBjb25zaWRlciUyMGl0JTIwYSUyMHdvcmthcm91bmQlMjByYXR=
oZXIlMjB0aGFuJTIwYSUyMHByb3BlciUyMHNvbHV0aW9uLiUyMCUyMiUyQyUyMmRzdCUyMiUzQS=
UyMiVFNSU4NSVCMyVFNCVCQSU4RSVFOCVBMSVBNSVFNCVCOCU4MSVFRiVCQyU4QyVFNiU4OCU5M=
SVFOCVBRSVBNCVFNCVCOCVCQSVFOCVCRiU5OSVFNiU5OCVBRiVFNCVCOCU4MCVFNyVBNyU4RCVF=
NSU4RiU5OCVFOSU4MCU5QSVFNiU5NiVCOSVFNiVCMyU5NSVFRiVCQyU4QyVFOCU4MCU4QyVFNCV=
COCU4RCVFNiU5OCVBRiVFNCVCOCU4MCVFNyVBNyU4RCVFOSU4MCU4MiVFNSVCRCU5MyVFNyU5QS=
U4NCVFOCVBNyVBMyVFNSU4NiVCMyVFNiU5NiVCOSVFNiVBMSU4OCVFMyU4MCU4MiUyMiUyQyUyM=
m1ldGFkYXRhJTIyJTNBJTIyJTIyJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNUQlMkMlMjJ0ZXh0=
JTIyJTNBJTIyUmVnYXJkaW5nJTIwdGhlJTIwcGF0Y2glMkMlMjBJJTIwY29uc2lkZXIlMjBpdCU=
yMGElMjB3b3JrYXJvdW5kJTIwcmF0aGVyJTIwdGhhbiUyMGElMjBwcm9wZXIlMjBzb2x1dGlvbi=
4lMjAlMjIlN0QlMkMlN0IlMjJpZCUyMiUzQSUyMkJvd2w3QU83NEIlMjIlMkMlMjJwYXJhSWR4J=
TIyJTNBMiUyQyUyMnNyYyUyMiUzQSUyMkklMjBhbHNvJTIwcmFpc2VkJTIwdGhlJTIwaXNzdWUl=
MjBoZXJlJTIwJTVCMSU1RCUyQyUyMGJ1dCUyMHRoZXJlJTIwaGFzbiVFMiU4MCU5OXQlMjBiZWV=
uJTIwYSUyMGZpeCUyMHlldC4lMjAlMjIlMkMlMjJkc3QlMjIlM0ElMjIlRTYlODglOTElRTQlQj=
klOUYlRTUlOUMlQTglRTglQkYlOTklRTklODclOEMlRTYlOEYlOTAlRTUlODclQkElRTQlQkElO=
DYlRTglQkYlOTklRTQlQjglQUElRTklOTclQUUlRTklQTIlOTglNUIxJTVEJUVGJUJDJThDJUU0=
JUJEJTg2JUU4JUJGJTk4JUU2JUIyJUExJUU2JTlDJTg5JUU4JUE3JUEzJUU1JTg2JUIzJUUzJTg=
wJTgyJTIyJTJDJTIybWV0YWRhdGElMjIlM0ElMjIlMjIlMkMlMjJtZXRhRGF0YSUyMiUzQSU1Qi=
U1RCUyQyUyMnRleHQlMjIlM0ElMjJJJTIwYWxzbyUyMHJhaXNlZCUyMHRoZSUyMGlzc3VlJTIwa=
GVyZSUyMCU1QjElNUQlMkMlMjBidXQlMjB0aGVyZSUyMGhhc24lRTIlODAlOTl0JTIwYmVlbiUy=
MGElMjBmaXglMjB5ZXQuJTIwJTIyJTdEJTJDJTdCJTIyaWQlMjIlM0ElMjJWMHdneTZ2eXJlJTI=
yJTJDJTIycGFyYUlkeCUyMiUzQTIlMkMlMjJzcmMlMjIlM0ElMjJJJTIwd291bGQlMjBhcHByZW=
NpYXRlJTIwaGVscCUyMGZyb20lMjBPRSUyMGV4cGVydHMlMjB0byUyMHNlZSUyMGlmJTIwdGhlc=
mUlMjBhcmUlMjBhbnklMjBvdGhlciUyMHBvc3NpYmxlJTIwc29sdXRpb25zJTIwdG8lMjBhZGRy=
ZXNzJTIwdGhpcy4lMjIlMkMlMjJkc3QlMjIlM0ElMjIlRTYlODglOTElRTklOUQlOUUlRTUlQjg=
lQjglRTYlODQlOUYlRTglQjAlQTJPRSVFNCVCOCU5MyVFNSVBRSVCNiVFNyU5QSU4NCVFNSVCOC=
VBRSVFNSU4QSVBOSVFRiVCQyU4QyVFNyU5QyU4QiVFNyU5QyU4QiVFNiU5OCVBRiVFNSU5MCVBN=
iVFNiU5QyU4OSVFNSU4NSVCNiVFNCVCQiU5NiVFNSU4RiVBRiVFOCU4MyVCRCVFNyU5QSU4NCVF=
OCVBNyVBMyVFNSU4NiVCMyVFNiU5NiVCOSVFNiVBMSU4OCVFNiU5RCVBNSVFOCVBNyVBMyVFNSU=
4NiVCMyVFOCVCRiU5OSVFNCVCOCVBQSVFOSU5NyVBRSVFOSVBMiU5OCVFMyU4MCU4MiUyMiUyQy=
UyMm1ldGFkYXRhJTIyJTNBJTIyJTIyJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNUQlMkMlMjJ0Z=
Xh0JTIyJTNBJTIySSUyMHdvdWxkJTIwYXBwcmVjaWF0ZSUyMGhlbHAlMjBmcm9tJTIwT0UlMjBl=
eHBlcnRzJTIwdG8lMjBzZWUlMjBpZiUyMHRoZXJlJTIwYXJlJTIwYW55JTIwb3RoZXIlMjBwb3N=
zaWJsZSUyMHNvbHV0aW9ucyUyMHRvJTIwYWRkcmVzcyUyMHRoaXMuJTIyJTdEJTVEJTdEJTJDJT=
dCJTIydHlwZSUyMiUzQSUyMnBhcmFncmFwaCUyMiUyQyUyMmNoaWxkcmVuJTIyJTNBJTVCJTdCJ=
TIyaWQlMjIlM0ElMjJlSjV5ajhRak9CJTIyJTJDJTIycGFyYUlkeCUyMiUzQTMlMkMlMjJzcmMl=
MjIlM0ElMjIlMjIlMkMlMjJkc3QlMjIlM0ElMjIlMjIlMkMlMjJtZXRhZGF0YSUyMiUzQSUyMiU=
yMiUyQyUyMm1ldGFEYXRhJTIyJTNBJTVCJTVEJTJDJTIydGV4dCUyMiUzQSUyMiUyMiU3RCU1RC=
U3RCUyQyU3QiUyMnR5cGUlMjIlM0ElMjJwYXJhZ3JhcGglMjIlMkMlMjJjaGlsZHJlbiUyMiUzQ=
SU1QiU3QiUyMmlkJTIyJTNBJTIyQlh4a0xSN0x4QiUyMiUyQyUyMnBhcmFJZHglMjIlM0E0JTJD=
JTIyc3JjJTIyJTNBJTIyRm9yJTIwdGhlJTIwcHRlc3QlMjBpc3N1ZSUyQyUyMEklMjBjb3VsZCU=
yMGZpeCUyMGl0JTIwdXNpbmclMjB0aGUlMjBzYW1lJTIwbWV0aG9kJTJDJTIwYnV0JTIwaXQlMj=
B3b3VsZCUyMGJlJTIwbXVjaCUyMHJvdWdoZXIlMjBhcyUyMG1vcmUlMjBmaWxlcyUyMG5lZWQlM=
jB0byUyMGJlJTIwaGFuZGxlZC4lMjIlMkMlMjJkc3QlMjIlM0ElMjIlRTUlQUYlQjklRTQlQkEl=
OEVwdGVzdCVFOSU5NyVBRSVFOSVBMiU5OCVFRiVCQyU4QyVFNiU4OCU5MSVFNSU4RiVBRiVFNCV=
CQiVBNSVFNCVCRCVCRiVFNyU5NCVBOCVFNyU5QiVCOCVFNSU5MCU4QyVFNyU5QSU4NCVFNiU5Ni=
VCOSVFNiVCMyU5NSVFNCVCRiVBRSVFNSVBNCU4RCVFNSVBRSU4MyVFRiVCQyU4QyVFNCVCRCU4N=
iVFNyU5NCVCMSVFNCVCQSU4RSVFOSU5QyU4MCVFOCVBNiU4MSVFNSVBNCU4NCVFNyU5MCU4NiVF=
NiU5QiVCNCVFNSVBNCU5QSVFNyU5QSU4NCVFNiU5NiU4NyVFNCVCQiVCNiVFRiVCQyU4QyVFNSV=
BRSU4MyVFNCVCQyU5QSVFNSU4RiU5OCVFNSVCRSU5NyVFNiU5QiVCNCVFNSU4QSVBMCVFNyVCMi=
U5NyVFNyVCMyU5OSVFMyU4MCU4MiUyMiUyQyUyMm1ldGFkYXRhJTIyJTNBJTIyJTIyJTJDJTIyb=
WV0YURhdGElMjIlM0ElNUIlNUQlMkMlMjJ0ZXh0JTIyJTNBJTIyRm9yJTIwdGhlJTIwcHRlc3Ql=
MjBpc3N1ZSUyQyUyMEklMjBjb3VsZCUyMGZpeCUyMGl0JTIwdXNpbmclMjB0aGUlMjBzYW1lJTI=
wbWV0aG9kJTJDJTIwYnV0JTIwaXQlMjB3b3VsZCUyMGJlJTIwbXVjaCUyMHJvdWdoZXIlMjBhcy=
UyMG1vcmUlMjBmaWxlcyUyMG5lZWQlMjB0byUyMGJlJTIwaGFuZGxlZC4lMjIlN0QlNUQlN0QlM=
kMlN0IlMjJ0eXBlJTIyJTNBJTIycGFyYWdyYXBoJTIyJTJDJTIyY2hpbGRyZW4lMjIlM0ElNUIl=
N0IlMjJpZCUyMiUzQSUyMmV4djg3bk83ZHolMjIlMkMlMjJwYXJhSWR4JTIyJTNBNSUyQyUyMnN=
yYyUyMiUzQSUyMiUyMiUyQyUyMmRzdCUyMiUzQSUyMiUyMiUyQyUyMm1ldGFkYXRhJTIyJTNBJT=
IyJTIyJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNUQlMkMlMjJ0ZXh0JTIyJTNBJTIyJTIyJTdEJ=
TVEJTdEJTJDJTdCJTIydHlwZSUyMiUzQSUyMnBhcmFncmFwaCUyMiUyQyUyMmNoaWxkcmVuJTIy=
JTNBJTVCJTdCJTIyaWQlMjIlM0ElMjJlM1BseVlueW1WJTIyJTJDJTIycGFyYUlkeCUyMiUzQTY=
lMkMlMjJzcmMlMjIlM0ElMjIlNUIxJTVEJTIwJTIyJTJDJTIyZHN0JTIyJTNBJTIyMS4lMjIlMk=
MlMjJtZXRhZGF0YSUyMiUzQSUyMiUyMiUyQyUyMm1ldGFEYXRhJTIyJTNBJTVCJTVEJTJDJTIyd=
GV4dCUyMiUzQSUyMiU1QjElNUQlMjAlMjIlN0QlMkMlN0IlMjJpZCUyMiUzQSUyMlZPbm9tMHZt=
d2UlMjIlMkMlMjJwYXJhSWR4JTIyJTNBNiUyQyUyMnNyYyUyMiUzQSUyMmh0dHBzJTNBJTJGJTJ=
GZ2l0aHViLmNvbSUyRlJlZmVyZW5jZS1MQVBBQ0slMkZsYXBhY2slMkZpc3N1ZXMlMkYxMDg3JT=
IyJTJDJTIyZHN0JTIyJTNBJTIyaHR0cHMlM0ElMkYlMkZnaXRodWIuY29tJTJGUmVmZXJlbmNlL=
UxBUEFDSyUyRmxhcGFjayUyRmlzc3VlcyUyRjEwODclMjIlMkMlMjJtZXRhZGF0YSUyMiUzQSUy=
MiUyMiUyQyUyMm1ldGFEYXRhJTIyJTNBJTVCJTVEJTJDJTIydGV4dCUyMiUzQSUyMmh0dHBzJTN=
BJTJGJTJGZ2l0aHViLmNvbSUyRlJlZmVyZW5jZS1MQVBBQ0slMkZsYXBhY2slMkZpc3N1ZXMlMk=
YxMDg3JTIyJTdEJTVEJTdEJTVE"><span data-slate-node=3D"text"><span data-slate=
-leaf=3D"true" data-sent-id=3D"e3PlyYnymV" class=3D"null"><span data-slate-=
string=3D"true">[1] </span></span></span><span data-slate-node=3D"text"><sp=
an data-slate-leaf=3D"true" data-sent-id=3D"VOnom0vmwe" class=3D"null"><spa=
n data-slate-string=3D"true"><a class=3D"moz-txt-link-freetext" href=3D"htt=
ps://github.com/Reference-LAPACK/lapack/issues/1087">https://github.com/Ref=
erence-LAPACK/lapack/issues/1087</a></span></span></span></div>
    <div data-slate-node=3D"element" style=3D"position: relative;" data-sla=
te-fragment=3D"JTVCJTdCJTIydHlwZSUyMiUzQSUyMnBhcmFncmFwaCUyMiUyQyUyMmNoaWxk=
cmVuJTIyJTNBJTVCJTdCJTIyaWQlMjIlM0ElMjJWNWRMeUVrN3JlJTIyJTJDJTIycGFyYUlkeCU=
yMiUzQTAlMkMlMjJzcmMlMjIlM0ElMjJJJTIwaGFkJTIwbm90JTIwZm9jdXNlZCUyMG9uJTIwdG=
hlJTIwcHRlc3QlMjBlbmFibGUlMjBiZWZvcmUuJTIwJTIyJTJDJTIyZHN0JTIyJTNBJTIyJUU2J=
Tg4JTkxJUU0JUI5JThCJUU1JTg5JThEJUU2JUIyJUExJUU2JTlDJTg5JUU0JUI4JTkzJUU2JUIz=
JUE4JUU0JUJBJThFcHRlc3QlRTUlOTAlQUYlRTclOTQlQTglRTMlODAlODIlMjIlMkMlMjJtZXR=
hZGF0YSUyMiUzQSUyMiUyMiUyQyUyMm1ldGFEYXRhJTIyJTNBJTVCJTVEJTJDJTIydGV4dCUyMi=
UzQSUyMkklMjBoYWQlMjBub3QlMjBmb2N1c2VkJTIwb24lMjB0aGUlMjBwdGVzdCUyMGVuYWJsZ=
SUyMGJlZm9yZS4lMjAlMjIlN0QlMkMlN0IlMjJpZCUyMiUzQSUyMnp5cTE3bk93dnolMjIlMkMl=
MjJwYXJhSWR4JTIyJTNBMCUyQyUyMnNyYyUyMiUzQSUyMkFmdGVyJTIwY2hlY2tpbmclMjB3aXR=
oJTIwcHRlc3QlMjBlbmFibGVkJTJDJTIwSSUyMGZvdW5kJTIwdGhhdCUyMGElMjB0b3RhbCUyMG=
9mJTIwMjYlMjBmaWxlcyUyMGNvbnRhaW4lMjB0aGUlMjBUTVBESVIlMjBpc3N1ZSUyQyUyMGFzJ=
TIwc2hvd24lMjBpbiUyMHlvdXIlMjBsb2cuJTIyJTJDJTIyZHN0JTIyJTNBJTIyJUU1JTlDJUE4=
JUU2JUEzJTgwJUU2JTlGJUE1JUU2JTk4JUFGJUU1JTkwJUE2JUU1JTkwJUFGJUU3JTk0JUE4JUU=
0JUJBJTg2cHRlc3QlRTUlOTAlOEUlRUYlQkMlOEMlRTYlODglOTElRTUlOEYlOTElRTclOEUlQj=
AlRTUlODUlQjElRTYlOUMlODkyNiVFNCVCOCVBQSVFNiU5NiU4NyVFNCVCQiVCNiVFNSU4QyU4N=
SVFNSU5MCVBQlRNUERJUiVFOSU5NyVBRSVFOSVBMiU5OCVFRiVCQyU4QyVFNSVBNiU4MiVFNiU4=
MiVBOCVFNyU5QSU4NCVFNiU5NyVBNSVFNSVCRiU5NyVFNiU4OSU4MCVFNyVBNCVCQSVFMyU4MCU=
4MiUyMiUyQyUyMm1ldGFkYXRhJTIyJTNBJTIyJTIyJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNU=
QlMkMlMjJ0ZXh0JTIyJTNBJTIyQWZ0ZXIlMjBjaGVja2luZyUyMHdpdGglMjBwdGVzdCUyMGVuY=
WJsZWQlMkMlMjBJJTIwZm91bmQlMjB0aGF0JTIwYSUyMHRvdGFsJTIwb2YlMjAyNiUyMGZpbGVz=
JTIwY29udGFpbiUyMHRoZSUyMFRNUERJUiUyMGlzc3VlJTJDJTIwYXMlMjBzaG93biUyMGluJTI=
weW91ciUyMGxvZy4lMjIlN0QlNUQlN0QlMkMlN0IlMjJ0eXBlJTIyJTNBJTIycGFyYWdyYXBoJT=
IyJTJDJTIyY2hpbGRyZW4lMjIlM0ElNUIlN0IlMjJpZCUyMiUzQSUyMmUyYVp5S05FM0IlMjIlM=
kMlMjJwYXJhSWR4JTIyJTNBMSUyQyUyMnNyYyUyMiUzQSUyMiUyMiUyQyUyMmRzdCUyMiUzQSUy=
MiUyMiUyQyUyMm1ldGFkYXRhJTIyJTNBJTIyJTIyJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNUQ=
lMkMlMjJ0ZXh0JTIyJTNBJTIyJTIyJTdEJTVEJTdEJTJDJTdCJTIydHlwZSUyMiUzQSUyMnBhcm=
FncmFwaCUyMiUyQyUyMmNoaWxkcmVuJTIyJTNBJTVCJTdCJTIyaWQlMjIlM0ElMjJlRUp5cDVEN=
GRWJTIyJTJDJTIycGFyYUlkeCUyMiUzQTIlMkMlMjJzcmMlMjIlM0ElMjJSZWdhcmRpbmclMjB0=
aGUlMjBwYXRjaCUyQyUyMEklMjBjb25zaWRlciUyMGl0JTIwYSUyMHdvcmthcm91bmQlMjByYXR=
oZXIlMjB0aGFuJTIwYSUyMHByb3BlciUyMHNvbHV0aW9uLiUyMCUyMiUyQyUyMmRzdCUyMiUzQS=
UyMiVFNSU4NSVCMyVFNCVCQSU4RSVFOCVBMSVBNSVFNCVCOCU4MSVFRiVCQyU4QyVFNiU4OCU5M=
SVFOCVBRSVBNCVFNCVCOCVCQSVFOCVCRiU5OSVFNiU5OCVBRiVFNCVCOCU4MCVFNyVBNyU4RCVF=
NSU4RiU5OCVFOSU4MCU5QSVFNiU5NiVCOSVFNiVCMyU5NSVFRiVCQyU4QyVFOCU4MCU4QyVFNCV=
COCU4RCVFNiU5OCVBRiVFNCVCOCU4MCVFNyVBNyU4RCVFOSU4MCU4MiVFNSVCRCU5MyVFNyU5QS=
U4NCVFOCVBNyVBMyVFNSU4NiVCMyVFNiU5NiVCOSVFNiVBMSU4OCVFMyU4MCU4MiUyMiUyQyUyM=
m1ldGFkYXRhJTIyJTNBJTIyJTIyJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNUQlMkMlMjJ0ZXh0=
JTIyJTNBJTIyUmVnYXJkaW5nJTIwdGhlJTIwcGF0Y2glMkMlMjBJJTIwY29uc2lkZXIlMjBpdCU=
yMGElMjB3b3JrYXJvdW5kJTIwcmF0aGVyJTIwdGhhbiUyMGElMjBwcm9wZXIlMjBzb2x1dGlvbi=
4lMjAlMjIlN0QlMkMlN0IlMjJpZCUyMiUzQSUyMkJvd2w3QU83NEIlMjIlMkMlMjJwYXJhSWR4J=
TIyJTNBMiUyQyUyMnNyYyUyMiUzQSUyMkklMjBhbHNvJTIwcmFpc2VkJTIwdGhlJTIwaXNzdWUl=
MjBoZXJlJTIwJTVCMSU1RCUyQyUyMGJ1dCUyMHRoZXJlJTIwaGFzbiVFMiU4MCU5OXQlMjBiZWV=
uJTIwYSUyMGZpeCUyMHlldC4lMjAlMjIlMkMlMjJkc3QlMjIlM0ElMjIlRTYlODglOTElRTQlQj=
klOUYlRTUlOUMlQTglRTglQkYlOTklRTklODclOEMlRTYlOEYlOTAlRTUlODclQkElRTQlQkElO=
DYlRTglQkYlOTklRTQlQjglQUElRTklOTclQUUlRTklQTIlOTglNUIxJTVEJUVGJUJDJThDJUU0=
JUJEJTg2JUU4JUJGJTk4JUU2JUIyJUExJUU2JTlDJTg5JUU4JUE3JUEzJUU1JTg2JUIzJUUzJTg=
wJTgyJTIyJTJDJTIybWV0YWRhdGElMjIlM0ElMjIlMjIlMkMlMjJtZXRhRGF0YSUyMiUzQSU1Qi=
U1RCUyQyUyMnRleHQlMjIlM0ElMjJJJTIwYWxzbyUyMHJhaXNlZCUyMHRoZSUyMGlzc3VlJTIwa=
GVyZSUyMCU1QjElNUQlMkMlMjBidXQlMjB0aGVyZSUyMGhhc24lRTIlODAlOTl0JTIwYmVlbiUy=
MGElMjBmaXglMjB5ZXQuJTIwJTIyJTdEJTJDJTdCJTIyaWQlMjIlM0ElMjJWMHdneTZ2eXJlJTI=
yJTJDJTIycGFyYUlkeCUyMiUzQTIlMkMlMjJzcmMlMjIlM0ElMjJJJTIwd291bGQlMjBhcHByZW=
NpYXRlJTIwaGVscCUyMGZyb20lMjBPRSUyMGV4cGVydHMlMjB0byUyMHNlZSUyMGlmJTIwdGhlc=
mUlMjBhcmUlMjBhbnklMjBvdGhlciUyMHBvc3NpYmxlJTIwc29sdXRpb25zJTIwdG8lMjBhZGRy=
ZXNzJTIwdGhpcy4lMjIlMkMlMjJkc3QlMjIlM0ElMjIlRTYlODglOTElRTklOUQlOUUlRTUlQjg=
lQjglRTYlODQlOUYlRTglQjAlQTJPRSVFNCVCOCU5MyVFNSVBRSVCNiVFNyU5QSU4NCVFNSVCOC=
VBRSVFNSU4QSVBOSVFRiVCQyU4QyVFNyU5QyU4QiVFNyU5QyU4QiVFNiU5OCVBRiVFNSU5MCVBN=
iVFNiU5QyU4OSVFNSU4NSVCNiVFNCVCQiU5NiVFNSU4RiVBRiVFOCU4MyVCRCVFNyU5QSU4NCVF=
OCVBNyVBMyVFNSU4NiVCMyVFNiU5NiVCOSVFNiVBMSU4OCVFNiU5RCVBNSVFOCVBNyVBMyVFNSU=
4NiVCMyVFOCVCRiU5OSVFNCVCOCVBQSVFOSU5NyVBRSVFOSVBMiU5OCVFMyU4MCU4MiUyMiUyQy=
UyMm1ldGFkYXRhJTIyJTNBJTIyJTIyJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNUQlMkMlMjJ0Z=
Xh0JTIyJTNBJTIySSUyMHdvdWxkJTIwYXBwcmVjaWF0ZSUyMGhlbHAlMjBmcm9tJTIwT0UlMjBl=
eHBlcnRzJTIwdG8lMjBzZWUlMjBpZiUyMHRoZXJlJTIwYXJlJTIwYW55JTIwb3RoZXIlMjBwb3N=
zaWJsZSUyMHNvbHV0aW9ucyUyMHRvJTIwYWRkcmVzcyUyMHRoaXMuJTIyJTdEJTVEJTdEJTJDJT=
dCJTIydHlwZSUyMiUzQSUyMnBhcmFncmFwaCUyMiUyQyUyMmNoaWxkcmVuJTIyJTNBJTVCJTdCJ=
TIyaWQlMjIlM0ElMjJlSjV5ajhRak9CJTIyJTJDJTIycGFyYUlkeCUyMiUzQTMlMkMlMjJzcmMl=
MjIlM0ElMjIlMjIlMkMlMjJkc3QlMjIlM0ElMjIlMjIlMkMlMjJtZXRhZGF0YSUyMiUzQSUyMiU=
yMiUyQyUyMm1ldGFEYXRhJTIyJTNBJTVCJTVEJTJDJTIydGV4dCUyMiUzQSUyMiUyMiU3RCU1RC=
U3RCUyQyU3QiUyMnR5cGUlMjIlM0ElMjJwYXJhZ3JhcGglMjIlMkMlMjJjaGlsZHJlbiUyMiUzQ=
SU1QiU3QiUyMmlkJTIyJTNBJTIyQlh4a0xSN0x4QiUyMiUyQyUyMnBhcmFJZHglMjIlM0E0JTJD=
JTIyc3JjJTIyJTNBJTIyRm9yJTIwdGhlJTIwcHRlc3QlMjBpc3N1ZSUyQyUyMEklMjBjb3VsZCU=
yMGZpeCUyMGl0JTIwdXNpbmclMjB0aGUlMjBzYW1lJTIwbWV0aG9kJTJDJTIwYnV0JTIwaXQlMj=
B3b3VsZCUyMGJlJTIwbXVjaCUyMHJvdWdoZXIlMjBhcyUyMG1vcmUlMjBmaWxlcyUyMG5lZWQlM=
jB0byUyMGJlJTIwaGFuZGxlZC4lMjIlMkMlMjJkc3QlMjIlM0ElMjIlRTUlQUYlQjklRTQlQkEl=
OEVwdGVzdCVFOSU5NyVBRSVFOSVBMiU5OCVFRiVCQyU4QyVFNiU4OCU5MSVFNSU4RiVBRiVFNCV=
CQiVBNSVFNCVCRCVCRiVFNyU5NCVBOCVFNyU5QiVCOCVFNSU5MCU4QyVFNyU5QSU4NCVFNiU5Ni=
VCOSVFNiVCMyU5NSVFNCVCRiVBRSVFNSVBNCU4RCVFNSVBRSU4MyVFRiVCQyU4QyVFNCVCRCU4N=
iVFNyU5NCVCMSVFNCVCQSU4RSVFOSU5QyU4MCVFOCVBNiU4MSVFNSVBNCU4NCVFNyU5MCU4NiVF=
NiU5QiVCNCVFNSVBNCU5QSVFNyU5QSU4NCVFNiU5NiU4NyVFNCVCQiVCNiVFRiVCQyU4QyVFNSV=
BRSU4MyVFNCVCQyU5QSVFNSU4RiU5OCVFNSVCRSU5NyVFNiU5QiVCNCVFNSU4QSVBMCVFNyVCMi=
U5NyVFNyVCMyU5OSVFMyU4MCU4MiUyMiUyQyUyMm1ldGFkYXRhJTIyJTNBJTIyJTIyJTJDJTIyb=
WV0YURhdGElMjIlM0ElNUIlNUQlMkMlMjJ0ZXh0JTIyJTNBJTIyRm9yJTIwdGhlJTIwcHRlc3Ql=
MjBpc3N1ZSUyQyUyMEklMjBjb3VsZCUyMGZpeCUyMGl0JTIwdXNpbmclMjB0aGUlMjBzYW1lJTI=
wbWV0aG9kJTJDJTIwYnV0JTIwaXQlMjB3b3VsZCUyMGJlJTIwbXVjaCUyMHJvdWdoZXIlMjBhcy=
UyMG1vcmUlMjBmaWxlcyUyMG5lZWQlMjB0byUyMGJlJTIwaGFuZGxlZC4lMjIlN0QlNUQlN0QlM=
kMlN0IlMjJ0eXBlJTIyJTNBJTIycGFyYWdyYXBoJTIyJTJDJTIyY2hpbGRyZW4lMjIlM0ElNUIl=
N0IlMjJpZCUyMiUzQSUyMmV4djg3bk83ZHolMjIlMkMlMjJwYXJhSWR4JTIyJTNBNSUyQyUyMnN=
yYyUyMiUzQSUyMiUyMiUyQyUyMmRzdCUyMiUzQSUyMiUyMiUyQyUyMm1ldGFkYXRhJTIyJTNBJT=
IyJTIyJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNUQlMkMlMjJ0ZXh0JTIyJTNBJTIyJTIyJTdEJ=
TVEJTdEJTJDJTdCJTIydHlwZSUyMiUzQSUyMnBhcmFncmFwaCUyMiUyQyUyMmNoaWxkcmVuJTIy=
JTNBJTVCJTdCJTIyaWQlMjIlM0ElMjJlM1BseVlueW1WJTIyJTJDJTIycGFyYUlkeCUyMiUzQTY=
lMkMlMjJzcmMlMjIlM0ElMjIlNUIxJTVEJTIwJTIyJTJDJTIyZHN0JTIyJTNBJTIyMS4lMjIlMk=
MlMjJtZXRhZGF0YSUyMiUzQSUyMiUyMiUyQyUyMm1ldGFEYXRhJTIyJTNBJTVCJTVEJTJDJTIyd=
GV4dCUyMiUzQSUyMiU1QjElNUQlMjAlMjIlN0QlMkMlN0IlMjJpZCUyMiUzQSUyMlZPbm9tMHZt=
d2UlMjIlMkMlMjJwYXJhSWR4JTIyJTNBNiUyQyUyMnNyYyUyMiUzQSUyMmh0dHBzJTNBJTJGJTJ=
GZ2l0aHViLmNvbSUyRlJlZmVyZW5jZS1MQVBBQ0slMkZsYXBhY2slMkZpc3N1ZXMlMkYxMDg3JT=
IyJTJDJTIyZHN0JTIyJTNBJTIyaHR0cHMlM0ElMkYlMkZnaXRodWIuY29tJTJGUmVmZXJlbmNlL=
UxBUEFDSyUyRmxhcGFjayUyRmlzc3VlcyUyRjEwODclMjIlMkMlMjJtZXRhZGF0YSUyMiUzQSUy=
MiUyMiUyQyUyMm1ldGFEYXRhJTIyJTNBJTVCJTVEJTJDJTIydGV4dCUyMiUzQSUyMmh0dHBzJTN=
BJTJGJTJGZ2l0aHViLmNvbSUyRlJlZmVyZW5jZS1MQVBBQ0slMkZsYXBhY2slMkZpc3N1ZXMlMk=
YxMDg3JTIyJTdEJTVEJTdEJTVE"><span data-slate-node=3D"text"><span data-slate=
-leaf=3D"true" data-sent-id=3D"VOnom0vmwe" class=3D"null"><span data-slate-=
string=3D"true">[2]
            <a class=3D"moz-txt-link-freetext" href=3D"https://lists.openem=
bedded.org/g/openembedded-devel/message/114624">https://lists.openembedded.=
org/g/openembedded-devel/message/114624</a></span></span></span></div>
    <div data-slate-node=3D"element" style=3D"position: relative;" data-sla=
te-fragment=3D"JTVCJTdCJTIydHlwZSUyMiUzQSUyMnBhcmFncmFwaCUyMiUyQyUyMmNoaWxk=
cmVuJTIyJTNBJTVCJTdCJTIyaWQlMjIlM0ElMjJWNWRMeUVrN3JlJTIyJTJDJTIycGFyYUlkeCU=
yMiUzQTAlMkMlMjJzcmMlMjIlM0ElMjJJJTIwaGFkJTIwbm90JTIwZm9jdXNlZCUyMG9uJTIwdG=
hlJTIwcHRlc3QlMjBlbmFibGUlMjBiZWZvcmUuJTIwJTIyJTJDJTIyZHN0JTIyJTNBJTIyJUU2J=
Tg4JTkxJUU0JUI5JThCJUU1JTg5JThEJUU2JUIyJUExJUU2JTlDJTg5JUU0JUI4JTkzJUU2JUIz=
JUE4JUU0JUJBJThFcHRlc3QlRTUlOTAlQUYlRTclOTQlQTglRTMlODAlODIlMjIlMkMlMjJtZXR=
hZGF0YSUyMiUzQSUyMiUyMiUyQyUyMm1ldGFEYXRhJTIyJTNBJTVCJTVEJTJDJTIydGV4dCUyMi=
UzQSUyMkklMjBoYWQlMjBub3QlMjBmb2N1c2VkJTIwb24lMjB0aGUlMjBwdGVzdCUyMGVuYWJsZ=
SUyMGJlZm9yZS4lMjAlMjIlN0QlMkMlN0IlMjJpZCUyMiUzQSUyMnp5cTE3bk93dnolMjIlMkMl=
MjJwYXJhSWR4JTIyJTNBMCUyQyUyMnNyYyUyMiUzQSUyMkFmdGVyJTIwY2hlY2tpbmclMjB3aXR=
oJTIwcHRlc3QlMjBlbmFibGVkJTJDJTIwSSUyMGZvdW5kJTIwdGhhdCUyMGElMjB0b3RhbCUyMG=
9mJTIwMjYlMjBmaWxlcyUyMGNvbnRhaW4lMjB0aGUlMjBUTVBESVIlMjBpc3N1ZSUyQyUyMGFzJ=
TIwc2hvd24lMjBpbiUyMHlvdXIlMjBsb2cuJTIyJTJDJTIyZHN0JTIyJTNBJTIyJUU1JTlDJUE4=
JUU2JUEzJTgwJUU2JTlGJUE1JUU2JTk4JUFGJUU1JTkwJUE2JUU1JTkwJUFGJUU3JTk0JUE4JUU=
0JUJBJTg2cHRlc3QlRTUlOTAlOEUlRUYlQkMlOEMlRTYlODglOTElRTUlOEYlOTElRTclOEUlQj=
AlRTUlODUlQjElRTYlOUMlODkyNiVFNCVCOCVBQSVFNiU5NiU4NyVFNCVCQiVCNiVFNSU4QyU4N=
SVFNSU5MCVBQlRNUERJUiVFOSU5NyVBRSVFOSVBMiU5OCVFRiVCQyU4QyVFNSVBNiU4MiVFNiU4=
MiVBOCVFNyU5QSU4NCVFNiU5NyVBNSVFNSVCRiU5NyVFNiU4OSU4MCVFNyVBNCVCQSVFMyU4MCU=
4MiUyMiUyQyUyMm1ldGFkYXRhJTIyJTNBJTIyJTIyJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNU=
QlMkMlMjJ0ZXh0JTIyJTNBJTIyQWZ0ZXIlMjBjaGVja2luZyUyMHdpdGglMjBwdGVzdCUyMGVuY=
WJsZWQlMkMlMjBJJTIwZm91bmQlMjB0aGF0JTIwYSUyMHRvdGFsJTIwb2YlMjAyNiUyMGZpbGVz=
JTIwY29udGFpbiUyMHRoZSUyMFRNUERJUiUyMGlzc3VlJTJDJTIwYXMlMjBzaG93biUyMGluJTI=
weW91ciUyMGxvZy4lMjIlN0QlNUQlN0QlMkMlN0IlMjJ0eXBlJTIyJTNBJTIycGFyYWdyYXBoJT=
IyJTJDJTIyY2hpbGRyZW4lMjIlM0ElNUIlN0IlMjJpZCUyMiUzQSUyMmUyYVp5S05FM0IlMjIlM=
kMlMjJwYXJhSWR4JTIyJTNBMSUyQyUyMnNyYyUyMiUzQSUyMiUyMiUyQyUyMmRzdCUyMiUzQSUy=
MiUyMiUyQyUyMm1ldGFkYXRhJTIyJTNBJTIyJTIyJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNUQ=
lMkMlMjJ0ZXh0JTIyJTNBJTIyJTIyJTdEJTVEJTdEJTJDJTdCJTIydHlwZSUyMiUzQSUyMnBhcm=
FncmFwaCUyMiUyQyUyMmNoaWxkcmVuJTIyJTNBJTVCJTdCJTIyaWQlMjIlM0ElMjJlRUp5cDVEN=
GRWJTIyJTJDJTIycGFyYUlkeCUyMiUzQTIlMkMlMjJzcmMlMjIlM0ElMjJSZWdhcmRpbmclMjB0=
aGUlMjBwYXRjaCUyQyUyMEklMjBjb25zaWRlciUyMGl0JTIwYSUyMHdvcmthcm91bmQlMjByYXR=
oZXIlMjB0aGFuJTIwYSUyMHByb3BlciUyMHNvbHV0aW9uLiUyMCUyMiUyQyUyMmRzdCUyMiUzQS=
UyMiVFNSU4NSVCMyVFNCVCQSU4RSVFOCVBMSVBNSVFNCVCOCU4MSVFRiVCQyU4QyVFNiU4OCU5M=
SVFOCVBRSVBNCVFNCVCOCVCQSVFOCVCRiU5OSVFNiU5OCVBRiVFNCVCOCU4MCVFNyVBNyU4RCVF=
NSU4RiU5OCVFOSU4MCU5QSVFNiU5NiVCOSVFNiVCMyU5NSVFRiVCQyU4QyVFOCU4MCU4QyVFNCV=
COCU4RCVFNiU5OCVBRiVFNCVCOCU4MCVFNyVBNyU4RCVFOSU4MCU4MiVFNSVCRCU5MyVFNyU5QS=
U4NCVFOCVBNyVBMyVFNSU4NiVCMyVFNiU5NiVCOSVFNiVBMSU4OCVFMyU4MCU4MiUyMiUyQyUyM=
m1ldGFkYXRhJTIyJTNBJTIyJTIyJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNUQlMkMlMjJ0ZXh0=
JTIyJTNBJTIyUmVnYXJkaW5nJTIwdGhlJTIwcGF0Y2glMkMlMjBJJTIwY29uc2lkZXIlMjBpdCU=
yMGElMjB3b3JrYXJvdW5kJTIwcmF0aGVyJTIwdGhhbiUyMGElMjBwcm9wZXIlMjBzb2x1dGlvbi=
4lMjAlMjIlN0QlMkMlN0IlMjJpZCUyMiUzQSUyMkJvd2w3QU83NEIlMjIlMkMlMjJwYXJhSWR4J=
TIyJTNBMiUyQyUyMnNyYyUyMiUzQSUyMkklMjBhbHNvJTIwcmFpc2VkJTIwdGhlJTIwaXNzdWUl=
MjBoZXJlJTIwJTVCMSU1RCUyQyUyMGJ1dCUyMHRoZXJlJTIwaGFzbiVFMiU4MCU5OXQlMjBiZWV=
uJTIwYSUyMGZpeCUyMHlldC4lMjAlMjIlMkMlMjJkc3QlMjIlM0ElMjIlRTYlODglOTElRTQlQj=
klOUYlRTUlOUMlQTglRTglQkYlOTklRTklODclOEMlRTYlOEYlOTAlRTUlODclQkElRTQlQkElO=
DYlRTglQkYlOTklRTQlQjglQUElRTklOTclQUUlRTklQTIlOTglNUIxJTVEJUVGJUJDJThDJUU0=
JUJEJTg2JUU4JUJGJTk4JUU2JUIyJUExJUU2JTlDJTg5JUU4JUE3JUEzJUU1JTg2JUIzJUUzJTg=
wJTgyJTIyJTJDJTIybWV0YWRhdGElMjIlM0ElMjIlMjIlMkMlMjJtZXRhRGF0YSUyMiUzQSU1Qi=
U1RCUyQyUyMnRleHQlMjIlM0ElMjJJJTIwYWxzbyUyMHJhaXNlZCUyMHRoZSUyMGlzc3VlJTIwa=
GVyZSUyMCU1QjElNUQlMkMlMjBidXQlMjB0aGVyZSUyMGhhc24lRTIlODAlOTl0JTIwYmVlbiUy=
MGElMjBmaXglMjB5ZXQuJTIwJTIyJTdEJTJDJTdCJTIyaWQlMjIlM0ElMjJWMHdneTZ2eXJlJTI=
yJTJDJTIycGFyYUlkeCUyMiUzQTIlMkMlMjJzcmMlMjIlM0ElMjJJJTIwd291bGQlMjBhcHByZW=
NpYXRlJTIwaGVscCUyMGZyb20lMjBPRSUyMGV4cGVydHMlMjB0byUyMHNlZSUyMGlmJTIwdGhlc=
mUlMjBhcmUlMjBhbnklMjBvdGhlciUyMHBvc3NpYmxlJTIwc29sdXRpb25zJTIwdG8lMjBhZGRy=
ZXNzJTIwdGhpcy4lMjIlMkMlMjJkc3QlMjIlM0ElMjIlRTYlODglOTElRTklOUQlOUUlRTUlQjg=
lQjglRTYlODQlOUYlRTglQjAlQTJPRSVFNCVCOCU5MyVFNSVBRSVCNiVFNyU5QSU4NCVFNSVCOC=
VBRSVFNSU4QSVBOSVFRiVCQyU4QyVFNyU5QyU4QiVFNyU5QyU4QiVFNiU5OCVBRiVFNSU5MCVBN=
iVFNiU5QyU4OSVFNSU4NSVCNiVFNCVCQiU5NiVFNSU4RiVBRiVFOCU4MyVCRCVFNyU5QSU4NCVF=
OCVBNyVBMyVFNSU4NiVCMyVFNiU5NiVCOSVFNiVBMSU4OCVFNiU5RCVBNSVFOCVBNyVBMyVFNSU=
4NiVCMyVFOCVCRiU5OSVFNCVCOCVBQSVFOSU5NyVBRSVFOSVBMiU5OCVFMyU4MCU4MiUyMiUyQy=
UyMm1ldGFkYXRhJTIyJTNBJTIyJTIyJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNUQlMkMlMjJ0Z=
Xh0JTIyJTNBJTIySSUyMHdvdWxkJTIwYXBwcmVjaWF0ZSUyMGhlbHAlMjBmcm9tJTIwT0UlMjBl=
eHBlcnRzJTIwdG8lMjBzZWUlMjBpZiUyMHRoZXJlJTIwYXJlJTIwYW55JTIwb3RoZXIlMjBwb3N=
zaWJsZSUyMHNvbHV0aW9ucyUyMHRvJTIwYWRkcmVzcyUyMHRoaXMuJTIyJTdEJTVEJTdEJTJDJT=
dCJTIydHlwZSUyMiUzQSUyMnBhcmFncmFwaCUyMiUyQyUyMmNoaWxkcmVuJTIyJTNBJTVCJTdCJ=
TIyaWQlMjIlM0ElMjJlSjV5ajhRak9CJTIyJTJDJTIycGFyYUlkeCUyMiUzQTMlMkMlMjJzcmMl=
MjIlM0ElMjIlMjIlMkMlMjJkc3QlMjIlM0ElMjIlMjIlMkMlMjJtZXRhZGF0YSUyMiUzQSUyMiU=
yMiUyQyUyMm1ldGFEYXRhJTIyJTNBJTVCJTVEJTJDJTIydGV4dCUyMiUzQSUyMiUyMiU3RCU1RC=
U3RCUyQyU3QiUyMnR5cGUlMjIlM0ElMjJwYXJhZ3JhcGglMjIlMkMlMjJjaGlsZHJlbiUyMiUzQ=
SU1QiU3QiUyMmlkJTIyJTNBJTIyQlh4a0xSN0x4QiUyMiUyQyUyMnBhcmFJZHglMjIlM0E0JTJD=
JTIyc3JjJTIyJTNBJTIyRm9yJTIwdGhlJTIwcHRlc3QlMjBpc3N1ZSUyQyUyMEklMjBjb3VsZCU=
yMGZpeCUyMGl0JTIwdXNpbmclMjB0aGUlMjBzYW1lJTIwbWV0aG9kJTJDJTIwYnV0JTIwaXQlMj=
B3b3VsZCUyMGJlJTIwbXVjaCUyMHJvdWdoZXIlMjBhcyUyMG1vcmUlMjBmaWxlcyUyMG5lZWQlM=
jB0byUyMGJlJTIwaGFuZGxlZC4lMjIlMkMlMjJkc3QlMjIlM0ElMjIlRTUlQUYlQjklRTQlQkEl=
OEVwdGVzdCVFOSU5NyVBRSVFOSVBMiU5OCVFRiVCQyU4QyVFNiU4OCU5MSVFNSU4RiVBRiVFNCV=
CQiVBNSVFNCVCRCVCRiVFNyU5NCVBOCVFNyU5QiVCOCVFNSU5MCU4QyVFNyU5QSU4NCVFNiU5Ni=
VCOSVFNiVCMyU5NSVFNCVCRiVBRSVFNSVBNCU4RCVFNSVBRSU4MyVFRiVCQyU4QyVFNCVCRCU4N=
iVFNyU5NCVCMSVFNCVCQSU4RSVFOSU5QyU4MCVFOCVBNiU4MSVFNSVBNCU4NCVFNyU5MCU4NiVF=
NiU5QiVCNCVFNSVBNCU5QSVFNyU5QSU4NCVFNiU5NiU4NyVFNCVCQiVCNiVFRiVCQyU4QyVFNSV=
BRSU4MyVFNCVCQyU5QSVFNSU4RiU5OCVFNSVCRSU5NyVFNiU5QiVCNCVFNSU4QSVBMCVFNyVCMi=
U5NyVFNyVCMyU5OSVFMyU4MCU4MiUyMiUyQyUyMm1ldGFkYXRhJTIyJTNBJTIyJTIyJTJDJTIyb=
WV0YURhdGElMjIlM0ElNUIlNUQlMkMlMjJ0ZXh0JTIyJTNBJTIyRm9yJTIwdGhlJTIwcHRlc3Ql=
MjBpc3N1ZSUyQyUyMEklMjBjb3VsZCUyMGZpeCUyMGl0JTIwdXNpbmclMjB0aGUlMjBzYW1lJTI=
wbWV0aG9kJTJDJTIwYnV0JTIwaXQlMjB3b3VsZCUyMGJlJTIwbXVjaCUyMHJvdWdoZXIlMjBhcy=
UyMG1vcmUlMjBmaWxlcyUyMG5lZWQlMjB0byUyMGJlJTIwaGFuZGxlZC4lMjIlN0QlNUQlN0QlM=
kMlN0IlMjJ0eXBlJTIyJTNBJTIycGFyYWdyYXBoJTIyJTJDJTIyY2hpbGRyZW4lMjIlM0ElNUIl=
N0IlMjJpZCUyMiUzQSUyMmV4djg3bk83ZHolMjIlMkMlMjJwYXJhSWR4JTIyJTNBNSUyQyUyMnN=
yYyUyMiUzQSUyMiUyMiUyQyUyMmRzdCUyMiUzQSUyMiUyMiUyQyUyMm1ldGFkYXRhJTIyJTNBJT=
IyJTIyJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNUQlMkMlMjJ0ZXh0JTIyJTNBJTIyJTIyJTdEJ=
TVEJTdEJTJDJTdCJTIydHlwZSUyMiUzQSUyMnBhcmFncmFwaCUyMiUyQyUyMmNoaWxkcmVuJTIy=
JTNBJTVCJTdCJTIyaWQlMjIlM0ElMjJlM1BseVlueW1WJTIyJTJDJTIycGFyYUlkeCUyMiUzQTY=
lMkMlMjJzcmMlMjIlM0ElMjIlNUIxJTVEJTIwJTIyJTJDJTIyZHN0JTIyJTNBJTIyMS4lMjIlMk=
MlMjJtZXRhZGF0YSUyMiUzQSUyMiUyMiUyQyUyMm1ldGFEYXRhJTIyJTNBJTVCJTVEJTJDJTIyd=
GV4dCUyMiUzQSUyMiU1QjElNUQlMjAlMjIlN0QlMkMlN0IlMjJpZCUyMiUzQSUyMlZPbm9tMHZt=
d2UlMjIlMkMlMjJwYXJhSWR4JTIyJTNBNiUyQyUyMnNyYyUyMiUzQSUyMmh0dHBzJTNBJTJGJTJ=
GZ2l0aHViLmNvbSUyRlJlZmVyZW5jZS1MQVBBQ0slMkZsYXBhY2slMkZpc3N1ZXMlMkYxMDg3JT=
IyJTJDJTIyZHN0JTIyJTNBJTIyaHR0cHMlM0ElMkYlMkZnaXRodWIuY29tJTJGUmVmZXJlbmNlL=
UxBUEFDSyUyRmxhcGFjayUyRmlzc3VlcyUyRjEwODclMjIlMkMlMjJtZXRhZGF0YSUyMiUzQSUy=
MiUyMiUyQyUyMm1ldGFEYXRhJTIyJTNBJTVCJTVEJTJDJTIydGV4dCUyMiUzQSUyMmh0dHBzJTN=
BJTJGJTJGZ2l0aHViLmNvbSUyRlJlZmVyZW5jZS1MQVBBQ0slMkZsYXBhY2slMkZpc3N1ZXMlMk=
YxMDg3JTIyJTdEJTVEJTdEJTVE"><span data-slate-node=3D"text"><span data-slate=
-leaf=3D"true" data-sent-id=3D"VOnom0vmwe" class=3D"null"><span data-slate-=
string=3D"true"><br>
          </span></span></span></div>
    <div data-slate-node=3D"element" style=3D"position: relative;" data-sla=
te-fragment=3D"JTVCJTdCJTIydHlwZSUyMiUzQSUyMnBhcmFncmFwaCUyMiUyQyUyMmNoaWxk=
cmVuJTIyJTNBJTVCJTdCJTIyaWQlMjIlM0ElMjJWNWRMeUVrN3JlJTIyJTJDJTIycGFyYUlkeCU=
yMiUzQTAlMkMlMjJzcmMlMjIlM0ElMjJJJTIwaGFkJTIwbm90JTIwZm9jdXNlZCUyMG9uJTIwdG=
hlJTIwcHRlc3QlMjBlbmFibGUlMjBiZWZvcmUuJTIwJTIyJTJDJTIyZHN0JTIyJTNBJTIyJUU2J=
Tg4JTkxJUU0JUI5JThCJUU1JTg5JThEJUU2JUIyJUExJUU2JTlDJTg5JUU0JUI4JTkzJUU2JUIz=
JUE4JUU0JUJBJThFcHRlc3QlRTUlOTAlQUYlRTclOTQlQTglRTMlODAlODIlMjIlMkMlMjJtZXR=
hZGF0YSUyMiUzQSUyMiUyMiUyQyUyMm1ldGFEYXRhJTIyJTNBJTVCJTVEJTJDJTIydGV4dCUyMi=
UzQSUyMkklMjBoYWQlMjBub3QlMjBmb2N1c2VkJTIwb24lMjB0aGUlMjBwdGVzdCUyMGVuYWJsZ=
SUyMGJlZm9yZS4lMjAlMjIlN0QlMkMlN0IlMjJpZCUyMiUzQSUyMnp5cTE3bk93dnolMjIlMkMl=
MjJwYXJhSWR4JTIyJTNBMCUyQyUyMnNyYyUyMiUzQSUyMkFmdGVyJTIwY2hlY2tpbmclMjB3aXR=
oJTIwcHRlc3QlMjBlbmFibGVkJTJDJTIwSSUyMGZvdW5kJTIwdGhhdCUyMGElMjB0b3RhbCUyMG=
9mJTIwMjYlMjBmaWxlcyUyMGNvbnRhaW4lMjB0aGUlMjBUTVBESVIlMjBpc3N1ZSUyQyUyMGFzJ=
TIwc2hvd24lMjBpbiUyMHlvdXIlMjBsb2cuJTIyJTJDJTIyZHN0JTIyJTNBJTIyJUU1JTlDJUE4=
JUU2JUEzJTgwJUU2JTlGJUE1JUU2JTk4JUFGJUU1JTkwJUE2JUU1JTkwJUFGJUU3JTk0JUE4JUU=
0JUJBJTg2cHRlc3QlRTUlOTAlOEUlRUYlQkMlOEMlRTYlODglOTElRTUlOEYlOTElRTclOEUlQj=
AlRTUlODUlQjElRTYlOUMlODkyNiVFNCVCOCVBQSVFNiU5NiU4NyVFNCVCQiVCNiVFNSU4QyU4N=
SVFNSU5MCVBQlRNUERJUiVFOSU5NyVBRSVFOSVBMiU5OCVFRiVCQyU4QyVFNSVBNiU4MiVFNiU4=
MiVBOCVFNyU5QSU4NCVFNiU5NyVBNSVFNSVCRiU5NyVFNiU4OSU4MCVFNyVBNCVCQSVFMyU4MCU=
4MiUyMiUyQyUyMm1ldGFkYXRhJTIyJTNBJTIyJTIyJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNU=
QlMkMlMjJ0ZXh0JTIyJTNBJTIyQWZ0ZXIlMjBjaGVja2luZyUyMHdpdGglMjBwdGVzdCUyMGVuY=
WJsZWQlMkMlMjBJJTIwZm91bmQlMjB0aGF0JTIwYSUyMHRvdGFsJTIwb2YlMjAyNiUyMGZpbGVz=
JTIwY29udGFpbiUyMHRoZSUyMFRNUERJUiUyMGlzc3VlJTJDJTIwYXMlMjBzaG93biUyMGluJTI=
weW91ciUyMGxvZy4lMjIlN0QlNUQlN0QlMkMlN0IlMjJ0eXBlJTIyJTNBJTIycGFyYWdyYXBoJT=
IyJTJDJTIyY2hpbGRyZW4lMjIlM0ElNUIlN0IlMjJpZCUyMiUzQSUyMmUyYVp5S05FM0IlMjIlM=
kMlMjJwYXJhSWR4JTIyJTNBMSUyQyUyMnNyYyUyMiUzQSUyMiUyMiUyQyUyMmRzdCUyMiUzQSUy=
MiUyMiUyQyUyMm1ldGFkYXRhJTIyJTNBJTIyJTIyJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNUQ=
lMkMlMjJ0ZXh0JTIyJTNBJTIyJTIyJTdEJTVEJTdEJTJDJTdCJTIydHlwZSUyMiUzQSUyMnBhcm=
FncmFwaCUyMiUyQyUyMmNoaWxkcmVuJTIyJTNBJTVCJTdCJTIyaWQlMjIlM0ElMjJlRUp5cDVEN=
GRWJTIyJTJDJTIycGFyYUlkeCUyMiUzQTIlMkMlMjJzcmMlMjIlM0ElMjJSZWdhcmRpbmclMjB0=
aGUlMjBwYXRjaCUyQyUyMEklMjBjb25zaWRlciUyMGl0JTIwYSUyMHdvcmthcm91bmQlMjByYXR=
oZXIlMjB0aGFuJTIwYSUyMHByb3BlciUyMHNvbHV0aW9uLiUyMCUyMiUyQyUyMmRzdCUyMiUzQS=
UyMiVFNSU4NSVCMyVFNCVCQSU4RSVFOCVBMSVBNSVFNCVCOCU4MSVFRiVCQyU4QyVFNiU4OCU5M=
SVFOCVBRSVBNCVFNCVCOCVCQSVFOCVCRiU5OSVFNiU5OCVBRiVFNCVCOCU4MCVFNyVBNyU4RCVF=
NSU4RiU5OCVFOSU4MCU5QSVFNiU5NiVCOSVFNiVCMyU5NSVFRiVCQyU4QyVFOCU4MCU4QyVFNCV=
COCU4RCVFNiU5OCVBRiVFNCVCOCU4MCVFNyVBNyU4RCVFOSU4MCU4MiVFNSVCRCU5MyVFNyU5QS=
U4NCVFOCVBNyVBMyVFNSU4NiVCMyVFNiU5NiVCOSVFNiVBMSU4OCVFMyU4MCU4MiUyMiUyQyUyM=
m1ldGFkYXRhJTIyJTNBJTIyJTIyJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNUQlMkMlMjJ0ZXh0=
JTIyJTNBJTIyUmVnYXJkaW5nJTIwdGhlJTIwcGF0Y2glMkMlMjBJJTIwY29uc2lkZXIlMjBpdCU=
yMGElMjB3b3JrYXJvdW5kJTIwcmF0aGVyJTIwdGhhbiUyMGElMjBwcm9wZXIlMjBzb2x1dGlvbi=
4lMjAlMjIlN0QlMkMlN0IlMjJpZCUyMiUzQSUyMkJvd2w3QU83NEIlMjIlMkMlMjJwYXJhSWR4J=
TIyJTNBMiUyQyUyMnNyYyUyMiUzQSUyMkklMjBhbHNvJTIwcmFpc2VkJTIwdGhlJTIwaXNzdWUl=
MjBoZXJlJTIwJTVCMSU1RCUyQyUyMGJ1dCUyMHRoZXJlJTIwaGFzbiVFMiU4MCU5OXQlMjBiZWV=
uJTIwYSUyMGZpeCUyMHlldC4lMjAlMjIlMkMlMjJkc3QlMjIlM0ElMjIlRTYlODglOTElRTQlQj=
klOUYlRTUlOUMlQTglRTglQkYlOTklRTklODclOEMlRTYlOEYlOTAlRTUlODclQkElRTQlQkElO=
DYlRTglQkYlOTklRTQlQjglQUElRTklOTclQUUlRTklQTIlOTglNUIxJTVEJUVGJUJDJThDJUU0=
JUJEJTg2JUU4JUJGJTk4JUU2JUIyJUExJUU2JTlDJTg5JUU4JUE3JUEzJUU1JTg2JUIzJUUzJTg=
wJTgyJTIyJTJDJTIybWV0YWRhdGElMjIlM0ElMjIlMjIlMkMlMjJtZXRhRGF0YSUyMiUzQSU1Qi=
U1RCUyQyUyMnRleHQlMjIlM0ElMjJJJTIwYWxzbyUyMHJhaXNlZCUyMHRoZSUyMGlzc3VlJTIwa=
GVyZSUyMCU1QjElNUQlMkMlMjBidXQlMjB0aGVyZSUyMGhhc24lRTIlODAlOTl0JTIwYmVlbiUy=
MGElMjBmaXglMjB5ZXQuJTIwJTIyJTdEJTJDJTdCJTIyaWQlMjIlM0ElMjJWMHdneTZ2eXJlJTI=
yJTJDJTIycGFyYUlkeCUyMiUzQTIlMkMlMjJzcmMlMjIlM0ElMjJJJTIwd291bGQlMjBhcHByZW=
NpYXRlJTIwaGVscCUyMGZyb20lMjBPRSUyMGV4cGVydHMlMjB0byUyMHNlZSUyMGlmJTIwdGhlc=
mUlMjBhcmUlMjBhbnklMjBvdGhlciUyMHBvc3NpYmxlJTIwc29sdXRpb25zJTIwdG8lMjBhZGRy=
ZXNzJTIwdGhpcy4lMjIlMkMlMjJkc3QlMjIlM0ElMjIlRTYlODglOTElRTklOUQlOUUlRTUlQjg=
lQjglRTYlODQlOUYlRTglQjAlQTJPRSVFNCVCOCU5MyVFNSVBRSVCNiVFNyU5QSU4NCVFNSVCOC=
VBRSVFNSU4QSVBOSVFRiVCQyU4QyVFNyU5QyU4QiVFNyU5QyU4QiVFNiU5OCVBRiVFNSU5MCVBN=
iVFNiU5QyU4OSVFNSU4NSVCNiVFNCVCQiU5NiVFNSU4RiVBRiVFOCU4MyVCRCVFNyU5QSU4NCVF=
OCVBNyVBMyVFNSU4NiVCMyVFNiU5NiVCOSVFNiVBMSU4OCVFNiU5RCVBNSVFOCVBNyVBMyVFNSU=
4NiVCMyVFOCVCRiU5OSVFNCVCOCVBQSVFOSU5NyVBRSVFOSVBMiU5OCVFMyU4MCU4MiUyMiUyQy=
UyMm1ldGFkYXRhJTIyJTNBJTIyJTIyJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNUQlMkMlMjJ0Z=
Xh0JTIyJTNBJTIySSUyMHdvdWxkJTIwYXBwcmVjaWF0ZSUyMGhlbHAlMjBmcm9tJTIwT0UlMjBl=
eHBlcnRzJTIwdG8lMjBzZWUlMjBpZiUyMHRoZXJlJTIwYXJlJTIwYW55JTIwb3RoZXIlMjBwb3N=
zaWJsZSUyMHNvbHV0aW9ucyUyMHRvJTIwYWRkcmVzcyUyMHRoaXMuJTIyJTdEJTVEJTdEJTJDJT=
dCJTIydHlwZSUyMiUzQSUyMnBhcmFncmFwaCUyMiUyQyUyMmNoaWxkcmVuJTIyJTNBJTVCJTdCJ=
TIyaWQlMjIlM0ElMjJlSjV5ajhRak9CJTIyJTJDJTIycGFyYUlkeCUyMiUzQTMlMkMlMjJzcmMl=
MjIlM0ElMjIlMjIlMkMlMjJkc3QlMjIlM0ElMjIlMjIlMkMlMjJtZXRhZGF0YSUyMiUzQSUyMiU=
yMiUyQyUyMm1ldGFEYXRhJTIyJTNBJTVCJTVEJTJDJTIydGV4dCUyMiUzQSUyMiUyMiU3RCU1RC=
U3RCUyQyU3QiUyMnR5cGUlMjIlM0ElMjJwYXJhZ3JhcGglMjIlMkMlMjJjaGlsZHJlbiUyMiUzQ=
SU1QiU3QiUyMmlkJTIyJTNBJTIyQlh4a0xSN0x4QiUyMiUyQyUyMnBhcmFJZHglMjIlM0E0JTJD=
JTIyc3JjJTIyJTNBJTIyRm9yJTIwdGhlJTIwcHRlc3QlMjBpc3N1ZSUyQyUyMEklMjBjb3VsZCU=
yMGZpeCUyMGl0JTIwdXNpbmclMjB0aGUlMjBzYW1lJTIwbWV0aG9kJTJDJTIwYnV0JTIwaXQlMj=
B3b3VsZCUyMGJlJTIwbXVjaCUyMHJvdWdoZXIlMjBhcyUyMG1vcmUlMjBmaWxlcyUyMG5lZWQlM=
jB0byUyMGJlJTIwaGFuZGxlZC4lMjIlMkMlMjJkc3QlMjIlM0ElMjIlRTUlQUYlQjklRTQlQkEl=
OEVwdGVzdCVFOSU5NyVBRSVFOSVBMiU5OCVFRiVCQyU4QyVFNiU4OCU5MSVFNSU4RiVBRiVFNCV=
CQiVBNSVFNCVCRCVCRiVFNyU5NCVBOCVFNyU5QiVCOCVFNSU5MCU4QyVFNyU5QSU4NCVFNiU5Ni=
VCOSVFNiVCMyU5NSVFNCVCRiVBRSVFNSVBNCU4RCVFNSVBRSU4MyVFRiVCQyU4QyVFNCVCRCU4N=
iVFNyU5NCVCMSVFNCVCQSU4RSVFOSU5QyU4MCVFOCVBNiU4MSVFNSVBNCU4NCVFNyU5MCU4NiVF=
NiU5QiVCNCVFNSVBNCU5QSVFNyU5QSU4NCVFNiU5NiU4NyVFNCVCQiVCNiVFRiVCQyU4QyVFNSV=
BRSU4MyVFNCVCQyU5QSVFNSU4RiU5OCVFNSVCRSU5NyVFNiU5QiVCNCVFNSU4QSVBMCVFNyVCMi=
U5NyVFNyVCMyU5OSVFMyU4MCU4MiUyMiUyQyUyMm1ldGFkYXRhJTIyJTNBJTIyJTIyJTJDJTIyb=
WV0YURhdGElMjIlM0ElNUIlNUQlMkMlMjJ0ZXh0JTIyJTNBJTIyRm9yJTIwdGhlJTIwcHRlc3Ql=
MjBpc3N1ZSUyQyUyMEklMjBjb3VsZCUyMGZpeCUyMGl0JTIwdXNpbmclMjB0aGUlMjBzYW1lJTI=
wbWV0aG9kJTJDJTIwYnV0JTIwaXQlMjB3b3VsZCUyMGJlJTIwbXVjaCUyMHJvdWdoZXIlMjBhcy=
UyMG1vcmUlMjBmaWxlcyUyMG5lZWQlMjB0byUyMGJlJTIwaGFuZGxlZC4lMjIlN0QlNUQlN0QlM=
kMlN0IlMjJ0eXBlJTIyJTNBJTIycGFyYWdyYXBoJTIyJTJDJTIyY2hpbGRyZW4lMjIlM0ElNUIl=
N0IlMjJpZCUyMiUzQSUyMmV4djg3bk83ZHolMjIlMkMlMjJwYXJhSWR4JTIyJTNBNSUyQyUyMnN=
yYyUyMiUzQSUyMiUyMiUyQyUyMmRzdCUyMiUzQSUyMiUyMiUyQyUyMm1ldGFkYXRhJTIyJTNBJT=
IyJTIyJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNUQlMkMlMjJ0ZXh0JTIyJTNBJTIyJTIyJTdEJ=
TVEJTdEJTJDJTdCJTIydHlwZSUyMiUzQSUyMnBhcmFncmFwaCUyMiUyQyUyMmNoaWxkcmVuJTIy=
JTNBJTVCJTdCJTIyaWQlMjIlM0ElMjJlM1BseVlueW1WJTIyJTJDJTIycGFyYUlkeCUyMiUzQTY=
lMkMlMjJzcmMlMjIlM0ElMjIlNUIxJTVEJTIwJTIyJTJDJTIyZHN0JTIyJTNBJTIyMS4lMjIlMk=
MlMjJtZXRhZGF0YSUyMiUzQSUyMiUyMiUyQyUyMm1ldGFEYXRhJTIyJTNBJTVCJTVEJTJDJTIyd=
GV4dCUyMiUzQSUyMiU1QjElNUQlMjAlMjIlN0QlMkMlN0IlMjJpZCUyMiUzQSUyMlZPbm9tMHZt=
d2UlMjIlMkMlMjJwYXJhSWR4JTIyJTNBNiUyQyUyMnNyYyUyMiUzQSUyMmh0dHBzJTNBJTJGJTJ=
GZ2l0aHViLmNvbSUyRlJlZmVyZW5jZS1MQVBBQ0slMkZsYXBhY2slMkZpc3N1ZXMlMkYxMDg3JT=
IyJTJDJTIyZHN0JTIyJTNBJTIyaHR0cHMlM0ElMkYlMkZnaXRodWIuY29tJTJGUmVmZXJlbmNlL=
UxBUEFDSyUyRmxhcGFjayUyRmlzc3VlcyUyRjEwODclMjIlMkMlMjJtZXRhZGF0YSUyMiUzQSUy=
MiUyMiUyQyUyMm1ldGFEYXRhJTIyJTNBJTVCJTVEJTJDJTIydGV4dCUyMiUzQSUyMmh0dHBzJTN=
BJTJGJTJGZ2l0aHViLmNvbSUyRlJlZmVyZW5jZS1MQVBBQ0slMkZsYXBhY2slMkZpc3N1ZXMlMk=
YxMDg3JTIyJTdEJTVEJTdEJTVE"><span data-slate-node=3D"text"><span data-slate=
-leaf=3D"true" data-sent-id=3D"VOnom0vmwe" class=3D"null"><span data-slate-=
string=3D"true">Thanks very much<br>
          </span></span></span></div>
    <p>//Peng<br>
    </p>
    <p></p>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQe7QsX5-ZMfRYFDpY8CRJ3Cp2fU=
=3DTArP9Ucm_OK55K7DQ@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

On Fri, Jan 3, 2025 at 9:45=E2=80=AFAM Zhang, Peng (Paul) (CN) via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:peng.zhang1.cn=3Dwindrive=
r.com@lists.openembedded.org">&lt;peng.zhang1.cn=3Dwindriver.com@lists.open=
embedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
From: Zhang Peng <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:peng.zha=
ng1.cn@windriver.com">&lt;peng.zhang1.cn@windriver.com&gt;</a>

When building the `lapack` package, the following QA error occurs:
&quot;File /usr/lib64/libblas.so.3.12.0 in package lapack contains referenc=
e to TMPDIR [buildpaths]&quot;

The issue arises because the `xerbla.o` object file embeds the absolute hos=
t path of `xerbla.f`.
This occurs during compilation, where the build command in `build.make` (ge=
nerated by CMake) specifies:
`gfortran -c &lt;absolute path&gt;/xerbla.f -o`.

As a result, the absolute path is included in `xerbla.o`. Unfortunately, `g=
fortran` does not support
flags like `-fdebug-prefix-map` or `-ffile-prefix-map` to remove such paths=
.

To resolve this, the fix involves replacing the absolute path of `xerbla.f`=
 in the generated
`build.make` file with a relative path before the compilation step. This en=
sures that the
resulting `xerbla.o` does not contain any references to TMPDIR, passing the=
 `do_package_qa` check.

Signed-off-by: Zhang Peng <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:peng.zhang1.cn@windriver.com">&lt;peng.zhang1.cn@windriver.com&gt;</a>
---
 .../recipes-devtools/lapack/lapack_3.12.0.bb  | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb b/meta-oe/rec=
ipes-devtools/lapack/lapack_3.12.0.bb
index fef9d3a80e..ef5726eeaa 100644
--- a/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
+++ b/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
@@ -33,6 +33,29 @@ OECMAKE_GENERATOR =3D &quot;Unix Makefiles&quot;
 inherit cmake pkgconfig ptest
 EXCLUDE_FROM_WORLD =3D &quot;1&quot;

+# The `xerbla.o` file contains an absolute path in `xerbla.f.o`, but the o=
ptions
+# `-fdebug-prefix-map` and `-ffile-prefix-map` cannot be used because gfor=
tran does not support them.
+# To address this issue, we manually replace the absolute path with a rela=
tive path
+# in the generated `build.make` file.
+#
+# An issue has been reported: <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://github.com/Reference-LAPACK/lapack/issues/1087">https://github.com/R=
eference-LAPACK/lapack/issues/1087</a>,
+# requesting a fix in the source code.
+#
+# This workaround resolves the TMPDIR [buildpaths] issue by converting the=
 absolute path
+# of `xerbla.f` to a relative path. The steps are as follows:
+#
+# 1. Locate all `build.make` files after the `do_configure` step is comple=
ted.
+# 2. Compute the relative path for `xerbla.f` based on the current build d=
irectory.
+# 3. Replace the absolute path with the calculated relative path in the `b=
uild.make` files
+
+do_configure:append(){
+    for file in `find ${B} -name build.make`; do
+        sed -i -e &quot;s#\(.*-c \).*\(/xerbla\.f \)#\1$(grep '\-c .*xerbl=
a\.f' $file | awk -F'cd ' '{print $2}'| \
+                awk '{src=3D$1; sub(/.*-c /, &quot;&quot;); sub(/xerbla\.f=
.*/, &quot;&quot;); obj=3D$0; print src, obj}' | \
+                while read src obj; do echo &quot;$(realpath --relative-to=
=3D&quot;$src&quot; &quot;$obj&quot;)&quot;; done)\2#g&quot; $file
+        done
+}
+
 do_install_ptest () {
     rsync -a ${B}/TESTING ${D}${PTEST_PATH} \
           --exclude CMakeFiles \
--
2.34.1


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#114623): <a class=3D"moz-txt-link-freetext" href=3D"htt=
ps://lists.openembedded.org/g/openembedded-devel/message/114623">https://li=
sts.openembedded.org/g/openembedded-devel/message/114623</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.o=
penembedded.org/mt/110403421/3617156">https://lists.openembedded.org/mt/110=
403421/3617156</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openembed=
ded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.open=
embedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.opene=
mbedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/op=
enembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D"m=
ailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------RggKkDzmqGQp0lcN8mS4lQxM--

