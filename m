Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E25D2D4979D
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 05:21:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.167718.1733116910109746763
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Dec 2024 21:21:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2066b44c8d=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B24IC9L007349
	for <openembedded-devel@lists.openembedded.org>; Sun, 1 Dec 2024 21:21:49 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43833q19b5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 01 Dec 2024 21:21:49 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4B25Lmks002421;
	Sun, 1 Dec 2024 21:21:48 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2042.outbound.protection.outlook.com [104.47.56.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43833q19b3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 01 Dec 2024 21:21:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbhygRqGfWnaLqS++J7yRLwT54+wewt475IQFS8DrV5uZIf+HlSOpxAVizjHJt/no+fWzKRnUj98faMmuxqxC7w/UVOD+qGKj/iJtNjT7iuUk1fl1wDs2tbYp2QOos+hTIe3VGTTdmdYZEejRqr95vdRtXWX2ajNd+KS8iUNr5zsYc6V/axvhdxj50BZKbB0bOlgbKpV55Q6fL/cZxUPupetpZRxNZbaTsYQfyGxiCRx2wtdRwsEbRrcpLWJOdkUkGou4Xk5CHXbPlpSZo9nP5j8oXLxRQjPDlWcRvG14FXOuKAdE19FudoCEwOsRRLcmlmKUQAbfg00W5rNuyOglA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vech3ceIdb5B8UTTlJBnuJEuI4MrgPyw3714rzXmwnw=;
 b=cRq36s3xCJqCAPjVXFmShWzWNjK3Cv/ZkSR+NG8rC0C0ubk+jIa0g/Pz2MDkkH9SbKOnhQx+JKu0A2atnprIgLI+57Y/b/vfYUBSVTdordry5S6plKwshbwR8ZVdRMk25acUUeErrAf+35lUU4bEG9pxfevU/yY7EgrWYOxKC5Yv5v9m8QAms+4nuyOSrT8FFgUFE/GRMkOcKX4UijpKBRo09Q0MoFwDLhF/p3n+DaYFLobqSqYFh6C1ZxzF4rKIWDlaEYryrEhcuJWWR/cFAjO3iyoHQEeKV7PrOojpW+HwSvHcNhbXDLsAEalQyBKefenDYhUK2F+dny0XhqSGtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH8PR11MB6877.namprd11.prod.outlook.com (2603:10b6:510:22b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Mon, 2 Dec
 2024 05:21:44 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 05:21:43 +0000
Message-ID: <8646f992-a4f6-475f-adaa-f49404671b10@windriver.com>
Date: Mon, 2 Dec 2024 13:21:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to RDEPENDS
To: peter.marko@siemens.com,
        "peter.kjellerstedt@axis.com" <peter.kjellerstedt@axis.com>,
        Yi Zhao <yi.zhao@windriver.com>, Yi Zhao <yi.zhao@eng.windriver.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20240922073618.1359707-1-yi.zhao@windriver.com>
 <DB5PR02MB102135305A71D2997E959868FEF6F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <202aa218-94f5-46bb-a514-6118ad457078@windriver.com>
 <DB5PR02MB1021337FE7EFF0AE0B9BC1CB7EF772@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <AS1PR10MB56979DF6B1DA72BE50B9D217FD772@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <AS1PR10MB56979DF6B1DA72BE50B9D217FD772@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BYAPR01CA0019.prod.exchangelabs.com (2603:10b6:a02:80::32)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH8PR11MB6877:EE_
X-MS-Office365-Filtering-Correlation-Id: b709e2f2-1cdc-4d96-f29e-08dd129135be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QVVaTnhFUk1wTmhibVM0T0hFNHdWOU11T0o3Q25aRi9aZmhwNVV2ZUorQ2NT?=
 =?utf-8?B?VUl4ZUhTK2lHZGh4MUt5d2MvRmJhZ0IwYlVoaXI5ZGI3QktuZDByUGpaUFZL?=
 =?utf-8?B?Rm1NcS9ubWI0ZG16c2I5YkhCMG5RNVJiR1N1WG9DaEd4WUpDeUdrbnB0dnRx?=
 =?utf-8?B?R1RJQzFySERGRDNmU3doT204OWovN3ZjU1g1N3B2MFFGaDBXUTFtcEF3VExq?=
 =?utf-8?B?WWxOeHFES2NaNGZoeHdsVm1UOUdEbnBzd0tTMWRRVWxZSUlxbFVvM3FhUGZw?=
 =?utf-8?B?UUQrV3lhSnhRcDR0Z0p5amZ0QVF6b25JM29la2ZwV0x6aktubmh3WDVDU1Q5?=
 =?utf-8?B?di96bzhtRGZBSzcwNnNuMm9oQ0NEODJ1MlpsQzc5ZjBZOFNaUGIvSzUxV0hQ?=
 =?utf-8?B?ZHRrTktFdlBodGJPWHFORzZxaVYzQ2pmSktqY09abE8vRlQ2cktvdHpLOEhX?=
 =?utf-8?B?UDNJQmZ4TSsrU0VudU1EOG5ESTdKYUR2ckRKbDhDK3UvSEI5ajQ1OHg4YlZ1?=
 =?utf-8?B?ajdVb01abGd4a2o1STlkVGorOER4eU55OHpjK2JESlBYSEVkVFBwbGRWZVBU?=
 =?utf-8?B?cktTUVhPNUJyV29VSlo3OGRMbDVmVjNXcWlHbjMxbkxTbWRWREVrQ1ZHWDEw?=
 =?utf-8?B?RlJiMmIxZVBETDF4dUpTUVRBbmdwNEhhdGFyUXU5K2pRQWI3ak41aURURmNt?=
 =?utf-8?B?Yk90dER3TFNyTnN2RzB3M0l5MndMU2pXUEw1YkRNdFlwNVhuNzlUMWNmcDZX?=
 =?utf-8?B?Ukg4VklrU0hTditySnAzNzRDU3FWQUVUQ0QwMnhpN2RiUnIxbTVNU24vdmJy?=
 =?utf-8?B?dlBjY2xPUHVReVFNMWM2SDBqaktqTjF0Y2FHbjl3VmdxeE5Xb0xReHRlSGph?=
 =?utf-8?B?cy8yMUhPYURoN0hkZnoyWWRRSnVRQmU2V3dESGVDY2NIaURlL0ZrZUVGY1pY?=
 =?utf-8?B?VEpWMTBSNlFRWmxscncwUnM2a3RlRURhTm1KbWd5M0xDNW9oOTdtQzVReFpw?=
 =?utf-8?B?bVhTcEk0SlRpam03MHh0ODlzbTZBblhTVjBWNlBWcGFLMVZXZG9sTFhGVnRL?=
 =?utf-8?B?Nkc1dFRIc3UySTJMLzRVQktsR0JJZHl6RFV6TTJHdXZUeEhDNzFnN1ErZWVM?=
 =?utf-8?B?VC9mK0lHZk9FNk93aHBRek5UekhEREhCeHN6R0hHdHJwN3NCdTNvTytieHhk?=
 =?utf-8?B?T0ZxUGVTL0Q1bG5VK2JQeTNEVWhVTC96ZzJ1Q0lSbzlwMkEwMVRaVUdBbWlM?=
 =?utf-8?B?MkZ2dDFTeXlhZG1qL1hZZ2oxRGVwM3hiejZaWU0zZzRoUTJ2RVF4UCt0YzFi?=
 =?utf-8?B?ZmtSbHR2UkJvR3FMYmI3V1BJQVpZdUM1QjlhTUMzc3g3SHBuTHJ2N0tVdEJw?=
 =?utf-8?B?WHVuWnE2NHdLOWtua3djK3hIQWIwK0E0ZlZCNFR6Y25WcVF2RXBCaUplNXFD?=
 =?utf-8?B?Um9aSUI4WE9KR0ZOd09ibVJ4T0VUZXVlQURJVE9QYlliMGJLcklOWWJHWVNy?=
 =?utf-8?B?ZEJSc2gzWEtJK1BiRjE0ZWszT25wUjJvbFkyK2h4ZzZUdWF3Y29sbFRMTjNO?=
 =?utf-8?B?ajNwdklIR0FPd0ZTNzZXVElmQU9xTFZmb0RwV3hocnFacVRKWnJvUERIUEd5?=
 =?utf-8?B?RmI1WG5iaFl6TEkxQnNVcCtHUWxaZWpxc2pqN29BRW9uLzk4cEt5SUI4cTlo?=
 =?utf-8?B?L2pkQnFJeUFiRVFYQWRxNExBMVRPT3RxR0hrcVJ0a1FkRXQ5Y3hvQTRrRmpO?=
 =?utf-8?Q?14q2t0pf0T+pgU3U4E=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TmsxQmVaSlVJN0djWklDUlhFdTVndFdTaUFraWtZMzNKVWxBa1o4QURWSVlr?=
 =?utf-8?B?dE8xUlRHM0pISFZ0bkdBY2tNOTRPS3NTejJMUUJkNEJWcVY1RWIyTThCTytU?=
 =?utf-8?B?YTZaVDZsZVlDcGxXME9PbDBLTTFFWWc1VS9RS0tMY083alN1UUJFbjBmZk9O?=
 =?utf-8?B?YU1DWnFXZDkrbGFERXpqalAzTEpYYnhLWUxjc2hrNytqVVQvc0NJMXM5Z1RS?=
 =?utf-8?B?ZGliT2dYSFAzYjBTVjU1WVRxa1F0dzNJTEVVMzV0eXRiVk1IRGlLRGdYaGE1?=
 =?utf-8?B?ZW1MaW4zZHlIcXB1TEtla0Z1VGY0bzNJWHg1dlR3a2xiMEFsNUswYmRTOWUw?=
 =?utf-8?B?d05UN1hSdTZBY2dtbE1RK0dGZ3VtcXRLWU5aZFBVMkRFRy81UHRscnN2bUdt?=
 =?utf-8?B?Rkp2NVJXNS8vajlyWEdrTnVreXl0by9kK0lRdnlhMmZQTG1PditMSGF3Yk45?=
 =?utf-8?B?cm9qd1RBMDN3cFovWVdPaUJFM0lCcFFFdUdRaFJoUW53NmJwK2czamZ0aksv?=
 =?utf-8?B?Zk1oNEdpVjdIMzdDS2JUK2tvR3N6Rmt3MzlSSTZRbjZJcFJyZFoxTFFTaUc0?=
 =?utf-8?B?WDVMQWNDKzVoU255d2liYld0SHVMd295cy94cjJkUGlXRWhBaFJkTktHR2lk?=
 =?utf-8?B?dURiZWJobUZuMGJEbGltU3Boci9tekw5cnhGaUI1Nko3bUk0WFpDRjNNTVdB?=
 =?utf-8?B?b2lzdWtyM05pMG9BSnJEa01acDg4U0dPZi9sVjJabndKN0RaRDdKa0d0TjV6?=
 =?utf-8?B?b3JhNUhyc3BKVlJ5MkF5RHV3SGprdkVweHRDdXN3UGEyNm91RkEvRXo0MENH?=
 =?utf-8?B?U0JzbFRaREFuNnUwMmRRMUNiTGdNcFlNK0swQWl5cTl5Y0RySjZDRmVpNmhD?=
 =?utf-8?B?czVJSTJsWWJ6ZXRHc1BGZVFRaXE5SGFEZTNJVmxnYWJ1Y1JWb0JFNEc3UjRt?=
 =?utf-8?B?dFBkejB1ZjhPWERiQXk5cFhZNGdFNk8wQzh4Y2xyNnl2MnhQU1FDV25QckpO?=
 =?utf-8?B?SVVDUE82VitvbGN0OFh6alJ4OEFwQmh6bkhRNmZMV3M5MlBpZ2FVaEdDbHpL?=
 =?utf-8?B?eGxmNU81OFdNRkhHcnM1eTB4RDV3M0ZraTNRd3djU2NRblJpTkV2MTUyVS81?=
 =?utf-8?B?Y0VHd2JITHFRMEdicDY1RnNOckxTTzkzbStoU3hJOTBVb0VmbEJrcW0zNStH?=
 =?utf-8?B?TjRNUlhmQTF1QVJ1QWg0d3ZZTzc0TUtMb2lBNzQyeEx3TmZjTmZJZ1JnU0Ru?=
 =?utf-8?B?UHBiMEpsYjdYVDd4VDJNMlJHSnIxSkVEMjFscVVOSEZvSmdMemJNdEg3NGVS?=
 =?utf-8?B?dk16T2ZwcG9vcUpvQmFORk80U1BRVjFsa05Pa1RGcHQ2VC9Ib2tMbzQ2d1Vx?=
 =?utf-8?B?ZEdteVN5eE5PNFFrbUdBamNIcFJuOENQcE9XZ04rUFV4UVZQMnJhRXpMU1E2?=
 =?utf-8?B?VGxnQzVWUHZWZCtQbG9aUjNiaVJISFBwZGwrSEFNbVpaOVJxVjhMMzVtakpM?=
 =?utf-8?B?b3N4VWdoSGx2aFk4RUI5cGtXbU5kd0UwWWptYTZzOXVUVmkveENzWVQwVk5o?=
 =?utf-8?B?amlFRnlXazZUS0wvaS8vc2VpL3ZxQmt5UG91bGdKT2lhN0RtVGp5cFltcWdY?=
 =?utf-8?B?YVphYUU4bmlZclU5cG5yUHVIOUlSb3VjRTBDVFdPeklNS2MzTFl2K0FvZ2Rz?=
 =?utf-8?B?eWJMQUQ0TENxc1A5SlVMbXVKcmZqdlk4R09BMllIc1pOSTNqQXVpek1CVzh6?=
 =?utf-8?B?Nks5SFl5dDVHK3JJR0w1eUs0emhCTUZadU1pL0l6MXdaak4vS1l1OVJnbVlT?=
 =?utf-8?B?eFJ1cHZ6TkFic3BrZ09YZEN2MnpNZ2ozZ1pQT3hTb29oZCsvNVR5Z01PbG1p?=
 =?utf-8?B?OVB1dUwraHZRUjhidXBBUmdpdGpsNkozNzNWcnZIR0ppM3k4NUlqY3VxTnR6?=
 =?utf-8?B?MVB5WkZ0UHlvT1g1aUxwVEZ4dkRZUXZ0dmZWRFpQRGFSRHpIeUtMSXp5TVhj?=
 =?utf-8?B?eWlxY3lBOHZRQVBoekRkNWkzVFVyTEJzOXBUVmZ3QTJXdWJNNytJNWczVm9Y?=
 =?utf-8?B?RktSWWYrMUxibG1yQk1odDcrN0xTcTRXRm1GUGFrc2kwKytPYkdZODNkNzM2?=
 =?utf-8?Q?eQvNLUPgZEE8p02zZM9Z9dTqU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b709e2f2-1cdc-4d96-f29e-08dd129135be
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 05:21:43.8970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vN25rdcqxpweJH3uZ3cUrv/eVp9qUzhi8z2NLTPXPi4BOOXPJVxN8Ue3FO7ZOAI+cfLy4i5+1a2zlA9orAFH9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6877
X-Proofpoint-ORIG-GUID: 4n4yEvaAeN2VOB82fbjyrXPonndBHsmn
X-Authority-Analysis: v=2.4 cv=bqq2BFai c=1 sm=1 tr=0 ts=674d43ed cx=c_pps a=ruI+LRy+bJmAUyIDade2ZQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10
 a=NEAV23lmAAAA:8 a=MO2eYF9NAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=3-RhneuVAAAA:8 a=Vw8dkFEt5nxdUCdTBMYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=P0Bp-009Bj7CKDYx-y5u:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-GUID: wKTk_ZVsUhk2fh409dF4s67wnXn7voqa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-02_02,2024-11-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2412020045
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4B24IC9L007349
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Dec 2024 05:21:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114133

I'll explain in more details what the problem is and why this patch is=20
correct, given the current status of abseil-cpp recipe.

In protobuf's abseil-cpp.cmake file, there's a hardcoded list of absl=20
targets used by protobuf:
https://github.com/protocolbuffers/protobuf/blob/main/cmake/abseil-cpp.cm=
ake#L56

This value in turn is parsed and used to replace the=20
@_protobuf_PC_REQUIRES@ in protobuf.pc.cmake.

Here's the generated probobuf.pc file's contents:
"""
$ cat=C2=A0 ../build/protobuf.pc
prefix=3D/usr
exec_prefix=3D/usr
libdir=3D/usr/lib64
includedir=3D/usr/include

Name: Protocol Buffers
Description: Google's Data Interchange Format
Version: 25.3.0
Requires: absl_absl_check absl_absl_log absl_algorithm absl_base=20
absl_bind_front absl_bits absl_btree absl_cleanup absl_cord=20
absl_core_headers absl_debugging absl_die_if_null=20
absl_dynamic_annotations absl_flags absl_flat_hash_map=20
absl_flat_hash_set absl_function_ref absl_hash absl_layout=20
absl_log_initialize absl_log_severity absl_memory absl_node_hash_map=20
absl_node_hash_set absl_optional absl_span absl_status absl_statusor=20
absl_strings absl_synchronization absl_time absl_type_traits=20
absl_utility absl_variant utf8_range
Libs: -L${libdir} -lprotobuf
Cflags: -I${includedir} -DPROTOBUF_USE_DLLS
Conflicts: protobuf-lite
"""

Let me use "absl_hash" and "absl_absl_log" in the above list as examples.

"""
$ find ../../../abseil-cpp/20240116.2/packa
ges-split/ -name "libabsl_hash.so.*"
../../../abseil-cpp/20240116.2/packages-split/libabsl-hash/usr/lib64/liba=
bsl_hash.so.2401.0.0
../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-dbg/usr/lib64/.d=
ebug/libabsl_hash.so.2401.0.0
$ find ../../../abseil-cpp/20240116.2/packa
ges-split/ -name "libabsl_absl_log.so.*"
$
"""

See? The current package splitting of abseil-cpp does not match what=20
protobuf assumes. And I thinks protobuf's assumption is correct, because=20
there's really a absl_absl_log.pc file generated by abseil-cpp.

And there's the contents and location of absl_absl_log.pc:
"""
$ cat=20
../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-dev/usr/lib64/pk=
gconfig/absl_absl_log.pc
prefix=3D/usr
exec_prefix=3D${prefix}
libdir=3D/usr/lib64
includedir=3D/usr/include

Name: absl_absl_log
Description: Abseil absl_log library
URL: https://abseil.io/
Version: 20240116
Requires: absl_log_internal_log_impl =3D 20240116
Libs: -L${libdir}
Cflags: -I${includedir} -DNOMINMAX
"""

And there's the contents for the absl_log_internal_log_impl:
"""
$ cat ../../../abseil-cpp/20240116.2/packag
es-split/abseil-cpp-dev/usr/lib64/pkgconfig/absl_log_internal_log_impl.pc
prefix=3D/usr
exec_prefix=3D${prefix}
libdir=3D/usr/lib64
includedir=3D/usr/include

Name: absl_log_internal_log_impl
Description: Abseil log_internal_log_impl library
URL: https://abseil.io/
Version: 20240116
Requires: absl_log_internal_conditions =3D 20240116,=20
absl_log_internal_message =3D 20240116, absl_log_internal_strip =3D=20
20240116, absl_absl_vlog_is_on =3D 20240116
Libs: -L${libdir}
Cflags: -I${includedir} -DNOMINMAX
"""

We can then find the absl_log_internal_conditions library:
"""
$ find ../../../abseil-cpp/20240116.2/packages-split/ -name=20
"*absl_log_internal_message*"
../../../abseil-cpp/20240116.2/packages-split/libabsl-log-internal-messag=
e/usr/lib64/libabsl_log_internal_message.so.2401.0.0
../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-dev/usr/lib64/li=
babsl_log_internal_message.so
../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-dev/usr/lib64/pk=
gconfig/absl_log_internal_message.pc
../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-dbg/usr/lib64/.d=
ebug/libabsl_log_internal_message.so.2401.0.0
"""

What does all above mean? It means that abseil-cpp is not splitted=20
reasonably. This could be proven by the absl_absl_log.pc file as=20
described above.

So, given the current situation of abseil-cpp, Yi's solution is correct.=20
Before abseil-cpp is re-splitted according to its pc files, which then=20
could possibly lead to automatic parsing of the protobuf.pc file to add=20
extra RDEPENDS automatically in protobuf recipe, we need to have Yi's=20
solution. And we need to use RDEEPNDS instead of RRECOMMENDS (see the=20
'Requires' directive in corresponding .pc files).

Regards,
Qi

On 10/1/24 20:42, Peter Marko via lists.openembedded.org wrote:
>> -----Original Message-----
>> From: openembedded-devel@lists.openembedded.org <openembedded-
>> devel@lists.openembedded.org> On Behalf Of Peter Kjellerstedt via
>> lists.openembedded.org
>> Sent: Tuesday, October 1, 2024 14:00
>> To: Yi Zhao <yi.zhao@windriver.com>; Yi Zhao <yi.zhao@eng.windriver.co=
m>
>> Cc: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to
>> RDEPENDS
>>
>>> -----Original Message-----
>>> From: Yi Zhao <yi.zhao@windriver.com>
>>> Sent: den 25 september 2024 04:17
>>> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Yi Zhao
>> <yi.zhao@eng.windriver.com>
>>> Cc: openembedded-devel@lists.openembedded.org
>>> Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to
>> RDEPENDS
>>>
>>> On 9/24/24 03:02, Peter Kjellerstedt wrote:
>>>>> -----Original Message-----
>>>>> From: openembedded-devel@lists.openembedded.org <openembedded-
>> devel@lists.openembedded.org> On Behalf Of Yi Zhao
>>>>> Sent: den 22 september 2024 09:36
>>>>> To: openembedded-devel@lists.openembedded.org
>>>>> Subject: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to
>> RDEPENDS
>>>>> Since commit[1], the libraries of abseil-cpp have been splitted int=
o
>>>>> separate packages. When protobuf is installed into the image, only =
48
>>>>> abseil libraries are installed as runtime dependencies. But the out=
put
>>>>> of 'pkg-config --libs protobuf' lists 66 abseil-cpp libraries are
>>>>> required. Add abseil-cpp to RDEPENDS to ensure that all required
>>>>> abseil-cpp libraries are installed.
>>>>>
>>>>> [1] https://git.openembedded.org/meta-
>> openembedded/commit/?id=3Ddd6421e65eb75c35a904f4b487ba022075035
>> ecc
>>>>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>>>> ---
>>>>>    meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb | 2 ++
>>>>>    1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
>> b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
>>>>> index cc5204de4..354b3213a 100644
>>>>> --- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
>>>>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
>>>>> @@ -106,6 +106,8 @@ FILES:${PN}-lite =3D "${libdir}/libprotobuf-
>> lite${SOLIBS}"
>>>>>    # CMake requires protoc binary to exist in sysroot, even if it h=
as wrong
>> architecture.
>>>>>    SYSROOT_DIRS +=3D "${bindir}"
>>>>>
>>>>> +RDEPENDS:${PN} =3D "abseil-cpp"
>>>>> +RDEPENDS:${PN}-lite =3D "abseil-cpp"
>>>> This defeats the whole purpose of splitting up the abseil
>>>> libraries. What triggered this change? Was it an actual
>>>> runtime error, or were you only looking at the output
>>>> from pkg-config --libs protobuf?
>>>>
>>>> Since the .pc files are in the protobuf-dev package, which
>>>> depends on the abseil-cpp-dev package, all abseil libraries
>>>> should be available if you are actually building on target
>>>> or with an SDK.
>>> Our customer reported this issue. Here is his description:
>>> The abseil libraries will be included in the SDK, but not on the targ=
et.
>>> The application is building with SDK. The yocto build is adding proto=
buf
>>> to the image (no explicit abseil libraries are added). If an applicat=
ion
>>> then are built using the SDK it can not be executed on target as
>>> libraries are missing.
>> Can we at least change the dependency to a recommendation so
>> that it can be avoided via BAD_RECOMMENDATIONS? Because as it
>> is, it penalizes everyone that use protobuf for the case where
>> one provides an SDK with protobuf.
>>
>> My suggestion would be to change it to:
>>
>> # Recommend abseil-cpp so that all its libraries are installed in case
>> # protobuf is provided as part of an SDK. Everyone else should add
>> # BAD_RECOMMENDATIONS +=3D "abseil-cpp" to their configuration.
>> RRECOMMENDS:${PN} =3D "abseil-cpp"
>> RRECOMMENDS:${PN}-lite =3D "abseil-cpp"
>>
> I think that's also not the right way to do this.
> Adding unnecessary stuff to release images to satisfy SDK needs is wron=
g.
>
> I also wonder if the problem is not at the SDK level.
> If you build an sdk, there is explicitly installed package base and add=
itional required dependencies of those packages.
> The dependencies may not be complete and fully usable, only their parts=
 sufficient for the explicitly installed stuff is present.
> Are the sdk users assuming that full abseil-cpp is installed and thus u=
sing also parts not needed for protobuf?
> The proper solution would be probably to include abseil-cpp explicitly =
in SDK used in that way.
>
> Peter
>
>>> //Yi
>>>
>>>>>    RDEPENDS:${PN}-compiler =3D "${PN}"
>>>>>    RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
>>>>>    RDEPENDS:${PN}-ptest =3D "bash
>> ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-protobuf', ''=
, d)}"
>>>>> --
>>>>> 2.25.1
>>>> //Peter
>> //Peter
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112631): https://lists.openembedded.org/g/openembed=
ded-devel/message/112631
> Mute This Topic: https://lists.openembedded.org/mt/108587631/7304865
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[Qi.Chen@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


