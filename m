Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C29CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 07:20:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6846.1758698399826794846
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 00:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=X7NFod9b;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1362cdd5f6=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58O6aGpg973595
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 00:19:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Ytf430/wEAIXmSnUteP3G+J9o2g+rVS1iI4MgdcnA+c=; b=X7NFod9bppxo
	49JQqUzi/yFpwi8rBBSlu6GeOJrnJWeHsXTAaNxsHGYoqUoY95apKeUvEJ9Q/MIe
	m9G3b7PZ/9KjFpAH3j8yJwOX4I8NywTe7+VZ3fjKT8qSKlBIUYmnn3kItzpp8tWO
	XANTOFwZM70s7bsNSUeWys8TFEtI/Qe29aoNUTRjXBZI0Nt14PjHhqA6TgmHQ4D1
	K6VonWCB81vRfeez/3x8HMRUxac5HNYlm9DWmjbs7J3YiJAQa4BN99oByjQoDKkO
	ZTj0on3t97qNIKr6GvW3gZzoV/cuuRrfJ3E4lOoGkzH5rImsOIitlWmVJSGZmJpZ
	kb51vLVvvw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011017.outbound.protection.outlook.com [52.101.62.17])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499qj2v9v7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 00:19:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=alakrDkXOE3plNO7J9lEUopnYh6cpEpWa6OQ5SFBln+B60ONmp3N2QLs3kkfBOIwJudC36RuOEHmzJqfzjYiWR/eXzo6xXfHM5mHYkiEh2Sm3PpKIu/p8mwHZUDcdF0rKEwzFUbHvRI+W1UO5XkmhXar67lTFFLef9wqgnjupoYRmC1V+ShtXBm5Q3I2zzB9zj5psvlw7djORnQWzbMYm4NRTVbP7pYAB4CZUwGt/SF1poFsIktrREw5FYEYVlutiWSCfdkU9SgSe2GXdJ9j+MxIFRXPYzE3gDm0B73OGjOH2mgSphXl9Ravl5IuDkjmPoGj+v2eyjAPwkO+q7FUJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ytf430/wEAIXmSnUteP3G+J9o2g+rVS1iI4MgdcnA+c=;
 b=ddKtoyz9r2zSDZmO41dE/lLE9kA7D5FOGhON60X9wUdNbAPOQJ9+tkX1OsdiIvTc+xB2SUBGXHmggHwTBUDNl8+ujii94l44O9nxQ/ybjmVkf510McKKbPQsItxO+jjo+x1LDa0pkzgzUE8d3wI7xK5SUoa4xFE+2mysX0C2XQ/HO0SXrtUcjDT3HgFXp20wQHG0LxC0x6Hp/AdnrVeNnz5Wv7NAZ89+SrrmKzDjdtbQkiz45rYifLSea3kC4jk7kUnC2H7P3rWW3LK0Y/udw6JCkja9hsiI0ZGYmmZHTNlvBMsy8DmduHBfKLxyYkzxvcfIHs+glY5v4K1bzOgw8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) by
 DM3PR11MB8713.namprd11.prod.outlook.com (2603:10b6:0:45::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.21; Wed, 24 Sep 2025 07:19:56 +0000
Received: from DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd]) by DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd%6]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 07:19:56 +0000
Message-ID: <7bb20390-6927-4984-ad1e-72c00e9e368f@windriver.com>
Date: Wed, 24 Sep 2025 15:19:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][scarthgap][v2][PATCH 1/1] mariadb: upgrade 10.11.9
 -> 10.11.12
To: Yogita.Urade@windriver.com, openembedded-devel@lists.openembedded.org
References: <20250721094053.196062-1-yogita.urade@windriver.com>
Content-Language: en-US
From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
In-Reply-To: <20250721094053.196062-1-yogita.urade@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP301CA0003.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::9) To DM4PR11MB5533.namprd11.prod.outlook.com
 (2603:10b6:5:38a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5533:EE_|DM3PR11MB8713:EE_
X-MS-Office365-Filtering-Correlation-Id: aa1b886f-ffd8-4aa0-6092-08ddfb3ac343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YWo2Nll1SHUxcFg3d0pXVkpjSUxFdDg0WU1iMDR2aUdLMG9sRDlJRkNxRzly?=
 =?utf-8?B?Ym9YQlNEaHp5cU5KRzJPT2o3ZDlFTFA3SzVpQjU1MDUvb2h1aDVQMHpsdWYz?=
 =?utf-8?B?bWhxTVpEeUVRNytDVXZJQk5XRStqNzZSRkpVdWxSNFA5cUhOa1F2ZUZNRUxk?=
 =?utf-8?B?bEFHaDU0OE1CekJjdW9PbkFSZDZXWXd2ZHJqWmo4bGZSL095N3lEVDFBV0tT?=
 =?utf-8?B?Z0xyNHowY2NoWnhFSmhaTFdGMERsOG5TZDNrQzU4Sm9ZV05nWGs1NTFOTnNl?=
 =?utf-8?B?Sm9TMDYzWWdXTkFRM0duK1MybDEvY2pPbVN6Ly9kOFgwTEJoQnk3emtvaUp0?=
 =?utf-8?B?Wk9BcnlJWlUyN2dUc2pmYnpEck9NeGUxMzY2Tnhpd0lhWVU2RFpZTm5yVE9S?=
 =?utf-8?B?dzZMQW5Ea0E3c2IvR0ZhamFMWWd3Vk10UlFnbUVQOU1WaWdrUTI4QU5acnlz?=
 =?utf-8?B?ajN5M2t0MEJzeWgzWmt3RUhRRGRYeThjelhIMFdDODU4c3E5NjhyZjJnektC?=
 =?utf-8?B?U0tBZTloVWE2UEl3YTNybXNrWkJaMU5YSCt4MTMxZkxsMTNsRWJ4NlpFTURT?=
 =?utf-8?B?ODl1a2hHUUxXN3E4OHh4Z3VocVlCSjFaYitOMU9oY0FjcWZSaWFRVTJ4WmVr?=
 =?utf-8?B?ekpvRlVTZ0JiYXRqcDdzS0pRSmJuZGxTUWVaZXN2cFpNWm1QaHZWS1NlQzA3?=
 =?utf-8?B?S0N4R1RoOFpyK2NKa0tnY2pBcDQ3a2NxUC9CVG5MM2xVUGNjdmVUOTVNY1pV?=
 =?utf-8?B?UTUvNmFpTnZHY29ZSU9TTnZRQThxWm0xcy9NVFVzNjE5czNSalU3UmkyeWtE?=
 =?utf-8?B?YzJoaWdIcWlZZmZOdzV5d2RKZDkzK0tsSklxNGN4Z1FhdlNrQi9MclhnM3JT?=
 =?utf-8?B?dy95ZXBIQjIwTFoxYzJSU2tLRjE1VzJ0aFc1TXNGRzJyd1ZEcTVuZHp0eDRE?=
 =?utf-8?B?UGZJRWI0Mm9BZlBqNW9IOXptSy81N1dYazhQSUszSVkvNVF6bWdGbGhZSUJO?=
 =?utf-8?B?KzN3SkFqcE10bUNCYytLZThnREdiMUcwSUM2NWhIOG52RGdBTDBVL2w3aUNt?=
 =?utf-8?B?MXJCM1I2TDJnUE1WNzVLT1pmVVNRSm9mNnNJZE53RGJXVGU2dTBjNUVDcTEw?=
 =?utf-8?B?K29kT1ZnQkpyeVBxWENsU3U1amx5K0l0T0VoM1RkUkJNMTBMdnRmMGh6L3ZW?=
 =?utf-8?B?VHdSOHJoWHVWZ0NkcW5HM0tIcjJZWGJxSmZ5VThNTndnWS91VDY1TWY1M1BQ?=
 =?utf-8?B?TmYwbEVmbVZxUzI5aTB1MzNzSlBGd2xjQjFEWWxqejQ4czc0MlZlSTVBQVdr?=
 =?utf-8?B?NEVGbW9wK2hGdlpjVEJDVHQ3VENQRXpBUUtZd0p0U28ydDBNemlQNkxCZVNm?=
 =?utf-8?B?UkRUV25uOXVqN2k0bko2UXVnbURacnU4eHc3alFsbTVOVDUzeDRlUFF5aFNO?=
 =?utf-8?B?VUw5UlMyUzExTlUzZHVka1ovaUpPVWFoU1BOMy9RNEZHYTZlZHY3QmJ3ZStR?=
 =?utf-8?B?aFhhaGJWSFJ3ZXRkcXpkRFBPL1U0T3lKSWdxRFo2dmNwaWs2R3Q0cTdZQXRZ?=
 =?utf-8?B?dXNRVVpIeVdzZUdYSEhQUWVjbVJiOGpDRnorWWU0YUFzMVNKMk01c3c1ckRE?=
 =?utf-8?B?NEw4azVWOUh3bGF3T3ZUOXh0dFFmWXJJa2xESG9LSXpDbFZXU1lwKzJjTFUv?=
 =?utf-8?B?NHpEb1FmM3Z0bm5WZ2VmdjY1WEU0eEJiSUY2SUJQb2kyUm13UnZ6SkV0MzJP?=
 =?utf-8?B?RCtRZnpNeDZCa2grUFgzSldJNlczOFlYVjJSN3FjN0Jjb0RTMXN6eWhBMzN3?=
 =?utf-8?B?MFpNMHNPT0xqUnYvaEdXb0Vic2hwUjdmeXgxQnd1aTE3QllXSmFVTWV2QlZP?=
 =?utf-8?Q?jN7U8Bcj6QDvR?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5533.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MkdvdHlFTHdTSlpuRkpJMUF6ZEt4SEZVbVI4L0Q4OFNaK3NiZ01WUnMvSEl4?=
 =?utf-8?B?ZUp0MVBVZ25IbW45aGUwWlNhdU43Mnk5MURJc2FnYno5Y1d2UzYwaEJpNGdq?=
 =?utf-8?B?UFNkenpySld2aXhRc3FvSTg2anpoU3E5ZnFMZHNualBiemZBQXFyZDZ1bTBK?=
 =?utf-8?B?czREemVkNmVwY1JtdUxNRW1ZbFI5YWc2bkxZUHZLdkhCN3F5dUkwWHQ2WGVY?=
 =?utf-8?B?aXU0bVFJbDVkQkFYcEI5S3hxTlhCZUhuVExiRFFwK0tmbE1RRjRlelRFVmJO?=
 =?utf-8?B?NmxDdDZRWEdVbjI3Z3pXY2o5N2oxTWk4V2JScDA3YmwvR3ZCTkJjaXg5WSts?=
 =?utf-8?B?cFh6NGZUN2hJbnJzOFBPU051M2kzMExEOU00SFhwZGNwYXI0R1JvazJKK0d2?=
 =?utf-8?B?Wk02K1NQRmZnVTgxMUNUYVpFdUUzM3g3MzJNU25LcjhDa1V3VmxOcTFiQTJ1?=
 =?utf-8?B?eWlsck95QmFnRkdJQi9EZVVCRTV4em95cG0ybEVnSngzZnF5RXFFS0NQMVl5?=
 =?utf-8?B?ZnpCdnNFZFNoY1AySmoyMEM4dVFnc0xYRlBXdm5aTEF0bEhTd0JQZVBUTlBX?=
 =?utf-8?B?ZVBwZUxSbVBBckFQMWxyamlCMkpieWl5NEVpblpnV0dCdnBtRzFtRzdvWUk1?=
 =?utf-8?B?RjRvYUZHeW5uVHdjaURjOFUxUmNUclJNOUk0ZjJ2ZFB2LzFjYm9sRXJzUjJv?=
 =?utf-8?B?NWRtTkRjVzJZNlhQdWYyZXEyRklSNkdZUmhhOEZlaXZXSkplRjNjT3NTVElQ?=
 =?utf-8?B?TTFTKzFFMGNrVGJCOTdKM0xrbjZINVVFL1lPZWw4a2wxL281bDhpVVJiTjZS?=
 =?utf-8?B?R3hjT0tLd29wMTJsS3lzUnVOVytIb2xIRXlUNzRLd1ArdENVR3owT0wyZVlP?=
 =?utf-8?B?ZDdjdGJyTW5UejhyRWxRVlB1dDlybDZGbmE2dDdTTGlXRm8vZHQ4MWlhb3Fs?=
 =?utf-8?B?ajZEV1E5Yk9FVUlZaXBGK3NtV3FhV1JiUTFudmpIZzgrb3QzRUpwd2M5a2Uz?=
 =?utf-8?B?TE94TGxpbjFWVW1pcXAvSEszcFBWSm5LT3BWRTZnNnh3NWUyWTRNZzcxZmFi?=
 =?utf-8?B?NzFSS0x0bU41dVhGNThNazd4MWpoYVNGdlQ0ekJPbm1nekh6S1BkRlBVN2JN?=
 =?utf-8?B?Uk5QQXhUOHVVTzI1NjJQM09tK0t4RGJsTm5FbHVuaXY3WmNMbmw3bVJVdHox?=
 =?utf-8?B?VXA3M1U5d2lmVzlrdWNHL0FnUmFXZ0UyNkIrSUh0NUlSZG9CQ245aVFaZzIv?=
 =?utf-8?B?aWlqQm92WGVlelV1Mkhqck5xU3l4eEFyNEVpVjVxZ0FiNTU4Uzg4YnJoSFVw?=
 =?utf-8?B?aGFZcTUvY3R1YWtRb1RlTkkvQjQvMjcvVzhDTkNKMWJSSEJnSDJGWlBmWHVG?=
 =?utf-8?B?T0FJNWpGM0hOaDFzdExGOFdaOGEyd3V3OGdWV0p1SFVSK0s2LzRlTDR4UUpv?=
 =?utf-8?B?dndIWkhEaTUyNGFZd0t4NU4rOTk0eHR0OSs3dWhwaDlEVzR0WFhHV0NMZ3VJ?=
 =?utf-8?B?VVRZOHJwaUhnaTA3MEt1Z2VRTHV3a3JxRVJrNUZOOXRxR2dWVGFYRWo5M0Mw?=
 =?utf-8?B?L2s4NU1kb091cHZDdXp3bGgzb2ZzSEdsMnJ0NVlNeTBscE5Gck40MDBDZ3p2?=
 =?utf-8?B?RmxIRjM1dFpPYW8zTnp0YUp3RVNJb2VSdkFRTTA5Z1FzUVNmb283K2RNWlpv?=
 =?utf-8?B?eTVselg4azZSUnd3VTJlQ2lsRGQvelhYR05oSTZxM0dHMzYvMCtnMm9oTlRX?=
 =?utf-8?B?WFppNWdnRStKWnB4ZWxSb0xIbDJiQUFUb3l5ZU1rNFdVeTNuQzlwU21QNGJh?=
 =?utf-8?B?ekVRdE5oblR1c3BldjM3bXFCREJlaUozWW81YnFuOU1yU0xveCtyNnJSdVNO?=
 =?utf-8?B?M0tvbFpUZzQrTkJlTHdBNmwyNzhDbVdRcXhINnNlQ29YOGlGZFp2VVV5MU01?=
 =?utf-8?B?Qm8xYVZmVy9MNFdJdk9jN2o5bFNBS0dGZzRNS0hmbTFrdnA5Q3U0czhIRUJF?=
 =?utf-8?B?QWpQd3orUHpqblpJdkNtSVRGdVdxR1lNMUdyb3NoOWxOTDhCUG9LTnFGVDJG?=
 =?utf-8?B?Tjd0MEFyeENKcWRCR25kS0tXZmRJb0tDbmk4YTFDUFFYTDQvYlI1bGVmQm1z?=
 =?utf-8?B?RHMzRUczcHZocEl5VFFSVmV5NVg4YWZ5NjAxV0tIS21RMm93ZWoxZS9wZThj?=
 =?utf-8?B?R1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa1b886f-ffd8-4aa0-6092-08ddfb3ac343
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5533.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 07:19:56.1347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STmnmNFz5TuXR9RmfOypTpHRuZ+T+cEygw9VqqhnxXayPEj3rn2Wpz1CGyFef1A9on9CpiCdBe6zt2fvhY8jJpCoRQxLZY3e8hZ3ibRUNDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8713
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI0MDA2MCBTYWx0ZWRfX/9j5KEKr9pH8
 60d71wbNzRG2OuGhsthKuiGUOzPtgAlHoNAZbg/nXn+LhVPnFhpk6vU4S7P7Ck/cS1YMwSON+en
 LxaGxSTRWDigB7pKL1+Vrua6twJCmT/fiXqYPjJlbFj40eK9yr5nH28d+kAAcNjkyOCA5myvprC
 lSPBHjaMxKqOrtE0KtL7P5SAr6dYTA0zviZuOk63m2Tz25pXHWpjniBpk1TJZ+QU+Cl9qfcOtmf
 qTwdgMtndwIrHiR4PCYE+owAzm1MvkRnsKuoh0+8OPm+qsA/pOO9XcGPQoVvqw+xVA0CT+07wiO
 wvAOSxjNNZbbesWavLii4uFR+X0gWzqUhoc+UYWHXsUOFwI23OL7HBl4oSG8DI=
X-Authority-Analysis: v=2.4 cv=btpMBFai c=1 sm=1 tr=0 ts=68d39b9f cx=c_pps
 a=ixsBY7txtd2I+GiPRIsFOw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=jpp-Wi3FAAAA:8
 a=NEAV23lmAAAA:8 a=hkEv4HZQAAAA:8 a=kmYkUENqAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=ippx-B2vI3PLoAZ7FiwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3HWhRrkoiJongTt84g_J:22 a=NA03pvyaApPJG5valX87:22
 a=p9kz6gysRiz6SGr9lVkz:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: R6DmDb8crra56ntMd0Zxtjsy2Kz5ho9a
X-Proofpoint-ORIG-GUID: R6DmDb8crra56ntMd0Zxtjsy2Kz5ho9a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1011
 phishscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58O6aGpg973595
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 07:20:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119753

With this patch, I failed to start mysqld with systemctl. The errors are=20
bellows:
 =C2=A0 =C2=A0root@qemux86-64:~# systemctl start mysqld
 =C2=A0 =C2=A0Job for mysqld.service failed because a timeout was exceede=
d.
 =C2=A0 =C2=A0See "systemctl status mysqld.service" and "journalctl -xeu=20
mysqld.service" for details.
 =C2=A0 =C2=A0root@qemux86-64:~# cat /var/log/mysqld.log
 =C2=A0 =C2=A0ERROR: 1436=C2=A0 Thread stack overrun:=C2=A0 8380392 bytes=
 used of a 299008=20
byte stack, and 32000 bytes needed. Consider increasing the thread_stack=20
system variable.
 =C2=A0 =C2=A02025-09-24=C2=A0 6:56:07 0 [ERROR] Aborting
 =C2=A0 =C2=A0250924 06:56:31 mysqld_safe Starting mariadbd daemon with d=
atabases=20
from /var/lib/mysql
 =C2=A0 =C2=A02025-09-24=C2=A0 6:56:33 0 [Note] Starting MariaDB 10.11.12=
-MariaDB=20
source revision cafd22db7970ce081bafd887359aa0a77cfb769d server_uid=20
Z7CcUMa7l6MwVomwugQ7SNTawWM=3D as pr7
 =C2=A0 =C2=A02025-09-24=C2=A0 6:56:34 0 [Note] Plugin 'FEEDBACK' is disa=
bled.
 =C2=A0 =C2=A02025-09-24=C2=A0 6:56:34 0 [ERROR] Could not open mysql.plu=
gin table:=20
"Thread stack overrun:=C2=A0 8366424 bytes used of a 299008 byte stack, a=
nd=20
81920 bytes needed. Consider d
 =C2=A0 =C2=A02025-09-24=C2=A0 6:56:34 0 [ERROR] Can't open and lock priv=
ilege tables:=20
Thread stack overrun:=C2=A0 8367720 bytes used of a 299008 byte stack, an=
d=20
81920 bytes needed. Conside.
 =C2=A0 =C2=A02025-09-24=C2=A0 6:56:34 0 [ERROR] Fatal error: Can't open =
and lock=20
privilege tables: Thread stack overrun:=C2=A0 8347032 bytes used of a 299=
008=20
byte stack, and 81920 bytes ne.
 =C2=A0 =C2=A02025-09-24=C2=A0 6:56:34 0 [ERROR] Aborting
 =C2=A0 =C2=A0250924 06:56:34 mysqld_safe mysqld from pid file=20
/var/lib/mysql/mysqld.pid ended

After I added one line thread_stack =3D 16M in /etc/my.cnf , it is ok to=20
start mysqld.


Thanks.

Jinfeng

On 7/21/25 17:40, Urade, Yogita via lists.openembedded.org wrote:
> From: Yogita Urade <yogita.urade@windriver.com>
>
> This upgrade includes fix for CVE-2023-52969, CVE-2023-52970
> and CVE-2023-52971
>
> Changelog:
> https://mariadb.com/kb/en/mariadb-10-11-12-changelog/
>
> refresh 0001-Add-missing-includes-cstdint-and-cstdio.patch
>
> Droped mm_malloc.patch and ppc-remove-glibc-dep.patch (Commit ID:
> https://github.com/MariaDB/server/commit/dff354e7df2fa774ce4da77202a17e=
2cae99ac59)
> as these changes are available in 10.11.12
>
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
>   ..._10.11.9.bb =3D> mariadb-native_10.11.12.bb} |  0
>   meta-oe/recipes-dbs/mysql/mariadb.inc         |  4 +-
>   ...-missing-includes-cstdint-and-cstdio.patch | 43 +++++++-----------=
-
>   .../recipes-dbs/mysql/mariadb/mm_malloc.patch | 13 ------
>   .../mysql/mariadb/ppc-remove-glibc-dep.patch  | 43 ------------------=
-
>   ...mariadb_10.11.9.bb =3D> mariadb_10.11.12.bb} |  0
>   6 files changed, 16 insertions(+), 87 deletions(-)
>   rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.9.bb =3D> mari=
adb-native_10.11.12.bb} (100%)
>   delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
>   delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc=
-dep.patch
>   rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.9.bb =3D> mariadb_10.=
11.12.bb} (100%)
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.9.bb b/meta=
-oe/recipes-dbs/mysql/mariadb-native_10.11.12.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.9.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.12.bb
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-db=
s/mysql/mariadb.inc
> index f52947f359..83a3a1cafd 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -17,15 +17,13 @@ SRC_URI =3D "https://archive.mariadb.org/${BP}/sour=
ce/${BP}.tar.gz \
>              file://0001-innobase-Define-__NR_futex-if-it-does-not-exis=
t.patch \
>              file://0001-aio_linux-Check-if-syscall-exists-before-using=
-it.patch \
>              file://ssize_t.patch \
> -           file://mm_malloc.patch \
>              file://sys_futex.patch \
>              file://cross-compiling.patch \
>              file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.=
patch \
>              file://lfs64.patch \
>              file://0001-Add-missing-includes-cstdint-and-cstdio.patch =
\
>             "
> -SRC_URI:append:libc-musl =3D " file://ppc-remove-glibc-dep.patch"
> -SRC_URI[sha256sum] =3D "0a00180864cd016187c986faab8010de23a117b9a75f91=
d6456421f894e48d20"
> +SRC_URI[sha256sum] =3D "d61f23090cfc14f43e8a27c2d3ce7f80247e74481bb26a=
2d3a6308b8d194e167"
>  =20
>   UPSTREAM_CHECK_URI =3D "https://github.com/MariaDB/server/releases"
>  =20
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-include=
s-cstdint-and-cstdio.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-m=
issing-includes-cstdint-and-cstdio.patch
> index f8ccb998be..fa580d039a 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdi=
nt-and-cstdio.patch
> +++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdi=
nt-and-cstdio.patch
> @@ -11,27 +11,14 @@ Upstream-Status: Pending
>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>   ---
> - .../rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h   | 1 =
+
> - storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h   | 1 =
+
> - .../rocksdb/rocksdb/table/block_based/data_block_hash_index.h    | 1 =
+
> - storage/rocksdb/rocksdb/util/slice.cc                            | 1 =
+
> - storage/rocksdb/rocksdb/util/string_util.h                       | 1 =
+
> - 5 files changed, 5 insertions(+)
> + storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h  | 1 +
> + .../rocksdb/rocksdb/table/block_based/data_block_hash_index.h   | 1 +
> + storage/rocksdb/rocksdb/util/slice.cc                           | 2 +=
-
> + storage/rocksdb/rocksdb/util/string_util.h                      | 1 +
> + 4 files changed, 4 insertions(+), 1 deletion(-)
>  =20
> -diff --git a/storage/rocksdb/rocksdb/db/compaction/compaction_iteratio=
n_stats.h b/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_st=
ats.h
> -index 963c1d8e..73487edd 100644
> ---- a/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats=
.h
> -+++ b/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats=
.h
> -@@ -5,6 +5,7 @@
> -
> - #pragma once
> -
> -+#include <cstdint>
> - #include "rocksdb/rocksdb_namespace.h"
> -
> - struct CompactionIterationStats {
>   diff --git a/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkp=
oint.h b/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
> -index c7f93b4c..3c2ab805 100644
> +index 7fb9d489..f7b4e6f0 100644
>   --- a/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
>   +++ b/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
>   @@ -8,6 +8,7 @@
> @@ -55,20 +42,20 @@ index f356395f..32152217 100644
>    #include <vector>
>   =20
>   diff --git a/storage/rocksdb/rocksdb/util/slice.cc b/storage/rocksdb/=
rocksdb/util/slice.cc
> -index 6db11cc9..c26b6a21 100644
> +index 3c3656de..b18d7f5d 100644
>   --- a/storage/rocksdb/rocksdb/util/slice.cc
>   +++ b/storage/rocksdb/rocksdb/util/slice.cc
> -@@ -8,6 +8,7 @@
> - // found in the LICENSE file. See the AUTHORS file for names of contr=
ibutors.
> +@@ -12,7 +12,7 @@
> + #include <stdio.h>
>   =20
>    #include <algorithm>
> +-
>   +#include <cstdint>
> + #include "rocksdb/convenience.h"
>    #include "rocksdb/slice_transform.h"
> - #include "rocksdb/slice.h"
> - #include "util/string_util.h"
> -
> -diff --git a/util/string_util.h b/util/string_util.h
> -index 55d106fff02..11178fd1d7b 100644
> + #include "rocksdb/utilities/object_registry.h"
> +diff --git a/storage/rocksdb/rocksdb/util/string_util.h b/storage/rock=
sdb/rocksdb/util/string_util.h
> +index 7794dbb0..b480177e 100644
>   --- a/storage/rocksdb/rocksdb/util/string_util.h
>   +++ b/storage/rocksdb/rocksdb/util/string_util.h
>   @@ -6,6 +6,7 @@
> @@ -80,5 +67,5 @@ index 55d106fff02..11178fd1d7b 100644
>    #include <string>
>    #include <unordered_map>
>   --
> -2.25.1
> +2.40.0
>  =20
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch b/meta-o=
e/recipes-dbs/mysql/mariadb/mm_malloc.patch
> deleted file mode 100644
> index 6aa6c84882..0000000000
> --- a/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -Upstream-Status: Pending
> -
> ---- a/storage/rocksdb/rocksdb/port/jemalloc_helper.h
> -+++ b/storage/rocksdb/rocksdb/port/jemalloc_helper.h
> -@@ -5,7 +5,7 @@
> -
> - #pragma once
> -
> --#if defined(__clang__)
> -+#if defined(__clang__) && defined(__GLIBC__)
> - // glibc's `posix_memalign()` declaration specifies `throw()` while c=
lang's
> - // declaration does not. There is a hack in clang to make its re-decl=
aration
> - // compatible with glibc's if they are declared consecutively. That h=
ack breaks
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.pat=
ch b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
> deleted file mode 100644
> index 3787b74ad1..0000000000
> --- a/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -Upstream-Status: Pending
> -
> -Remove glibc specific function dependencies
> -
> -Sourced from: https://git.alpinelinux.org/aports/tree/main/mariadb/ppc=
-remove-glibc-dep.patch
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -diff --git a/include/my_cpu.h b/include/my_cpu.h
> -index f2e26fca..94599b74 100644
> ---- a/include/my_cpu.h
> -+++ b/include/my_cpu.h
> -@@ -24,17 +24,16 @@
> - */
> -
> - #ifdef _ARCH_PWR8
> --#include <sys/platform/ppc.h>
> - /* Very low priority */
> --#define HMT_very_low() __ppc_set_ppr_very_low()
> -+#define HMT_very_low() asm volatile("or 31,31,31")
> - /* Low priority */
> --#define HMT_low() __ppc_set_ppr_low()
> -+#define HMT_low() asm volatile ("or 1,1,1")
> - /* Medium low priority */
> --#define HMT_medium_low() __ppc_set_ppr_med_low()
> -+#define HMT_medium_low() asm volatile ("or 6,6,6")
> - /* Medium priority */
> --#define HMT_medium() __ppc_set_ppr_med()
> -+#define HMT_medium() asm volatile ("or 2,2,2")
> - /* Medium high priority */
> --#define HMT_medium_high() __ppc_set_ppr_med_high()
> -+#define HMT_medium_high() asm volatile("or 5,5,5")
> - /* High priority */
> - #define HMT_high() asm volatile("or 3,3,3")
> - #else
> -@@ -72,7 +71,7 @@ static inline void MY_RELAX_CPU(void)
> -   __asm__ __volatile__ ("pause");
> - #endif
> - #elif defined(_ARCH_PWR8)
> --  __ppc_get_timebase();
> -+  __builtin_ppc_get_timebase();
> - #elif defined __GNUC__ && (defined __arm__ || defined __aarch64__)
> -   /* Mainly, prevent the compiler from optimizing away delay loops */
> -   __asm__ __volatile__ ("":::"memory");
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.9.bb b/meta-oe/rec=
ipes-dbs/mysql/mariadb_10.11.12.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.9.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.12.bb
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118655): https://lists.openembedded.org/g/openembed=
ded-devel/message/118655
> Mute This Topic: https://lists.openembedded.org/mt/114265400/8617462
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[Jinfeng.Wang.CN@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

