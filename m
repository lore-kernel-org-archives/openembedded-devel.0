Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 931AFC4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 08:05:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10219.1714464354319596740
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Apr 2024 01:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=fbRmnLYK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5850663722=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43U6F3Xp023428
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Apr 2024 01:05:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=LlMtvNxXFOnJqn7WabBKjdZbQSGz4UcpFmWxkGZZ3ss=; b=
	fbRmnLYKiwIDNQurrfccefNAejzwZyUf6W3xWI1JwR1GmUJLlepRv8tSRNC3jX/H
	kbkrPiHsERjJREH9ihMOt7jrmp+Vxdjz4fJHNV36gN+ywJ4X0hJCObYGNm+sDfzS
	RHRy8M/pbF/mjudiqv6F50h+MERDDIWkrKOjPNMyM196P6iCc0jn8LIBE9tATe6x
	zgpgBCKTUA0dcwUaOQX3C60prgOuahxAE7KHW6zmO6KnGCQsd+2tJbJsMnmFTjuq
	L+Q2Gf/XOwKdTrk+gCL5FT0LfCjiKjmkdF9ygAPQmcZfkq9sDkyKuOmL4k5Z0rIx
	bzijL8pD4diPaZu8NnAOAQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xs0vftuvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Apr 2024 01:05:53 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 43U85r9V009527;
	Tue, 30 Apr 2024 01:05:53 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xs0vftuva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 01:05:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BU1MPgbzn3grj1/ep1cBvO3pBwvPzR/79R/NNRVT0QtOfSL6UMmV3k5F/wgCyloGR+st2ut6Vd+SVaTpSQdeBqWU/ijkzNhMX2bFX2ETkwkazXW6i7W6m49fOSdyJZCaq1sef0StSH/aoOa/hsBj82yLWrPL0ufq/s6ZWG396iF2+4TN7QwOVM7AX3ZrAEwxVMvZCvTQRTYkw/3VgFgbyT2BJJ5Nh4DalJjiCQY6P4gVecIJ5apI3Rs21nvh3Arv2QFcW57SV0mCIAYc5GlFZXRoPfCHYLYH/GHATPbKNzkKMiyAAjy2GIBAayqVwEAwvom0Z+9o66uzT5Ym4czOJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlMtvNxXFOnJqn7WabBKjdZbQSGz4UcpFmWxkGZZ3ss=;
 b=hunsjzpqmz4hes5x+C1OoyKAsNYEWyCa+aBhGjzbVjky5xKvN95m5Y0v8xgAKn+0UKA+vm35HzPFH+douDjkFpzjYl0zDfhBeVJ4G8z2kd86hyL6axdTDhJq5Kzu/PYLW8TpfJ9fiNxzBXz4dmfFwvEe8b9Hyp9hbfj0RSsUpscRCU8cxIgVp6CGEBZH/xqJaaWMV3hxcxuzimEG+eR8b+aCL8FX234qXK3t+3F7GkcApe8x8kZPzmoN0GELykp6yANHBRqNaTA9h5yFj8sabXJpje0ejAJEYiH4OVttn6EfT2GYnYKUb+JSdI3KqxfYo/akdtn/WHqeqecwzmQtNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CO1PR11MB4819.namprd11.prod.outlook.com (2603:10b6:303:91::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Tue, 30 Apr
 2024 08:05:50 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b792:3207:f838:98a1]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b792:3207:f838:98a1%4]) with mapi id 15.20.7519.031; Tue, 30 Apr 2024
 08:05:49 +0000
Message-ID: <ef4e1549-d7be-48f1-a2e5-03bdf25464fb@windriver.com>
Date: Tue, 30 Apr 2024 16:05:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][kirkstone][PATCH 2/3] python3-pyyaml-include:
 switch to pytest --automake
Content-Language: en-US
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "Yu, Mingli" <mingli.yu@eng.windriver.com>, tim.orling@konsulko.com,
        Ross Burton <ross.burton@arm.com>,
        openembedded-devel@lists.openembedded.org
References: <20240327071636.2207445-1-mingli.yu@windriver.com>
 <20240327071636.2207445-2-mingli.yu@windriver.com>
 <CA+chaQdkCsa2P-qJ5A-fQ5=n-sAmeHXLooBW3nsbrrLHPgSLjw@mail.gmail.com>
 <97b9c07e-0d17-4c9b-9449-212bc9ee78f3@windriver.com>
 <CA+chaQe=-D2t+T9j9=cppJLJZufhKuTiUuqDH0eC6+aCsbdt-w@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <CA+chaQe=-D2t+T9j9=cppJLJZufhKuTiUuqDH0eC6+aCsbdt-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:196::16) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|CO1PR11MB4819:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f4cf396-2022-472b-ed1a-08dc68ec591a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cEdMSStUNlBwZWlkUFNpY2plV3JDZ24wV3pESkc3VlViRmJwbTJpR1dINHFr?=
 =?utf-8?B?NW9jTjVlUEpFVzlMRHBBRSt6VndTdE00NlZFS0dadzY4SVk4aVU2ZldzTU1X?=
 =?utf-8?B?ci9GT3Nid01tSUtsNUVTWHFiWnpOZDYxSnNMS2VoWWJqRnZLWDNtT3BLL0NH?=
 =?utf-8?B?RittWFFBTzFWdGRQU1Bkb2tFNkNRSkRtY2tqeHZsTXFKcTdOMzVUVHJvZk0r?=
 =?utf-8?B?RU9KOU5QSXlidUpoUkE0NzNHUDVGMTJ1QVhlYjdSdzQ5NXZBd0hvMWV3TDNC?=
 =?utf-8?B?QjdPdEwrVklXS3VrVkFSMm5IcXhVbzREbExHeGxSTEFwNHZKWThYbjJFTHM4?=
 =?utf-8?B?cUhPcnRNNzh3ZWVoWGVORjFZdEYwN2YwelJSUnl2QlFkd1g3OWM4OW8yWS9D?=
 =?utf-8?B?NzVuZkFIMjFScGI4Y20xN1dhakM0d0lrUmYzYXVTbzRwMnhyMGh2dXVCcW96?=
 =?utf-8?B?SEpKZ3V2ZWRiNkU5YzlJNHdMcW5CdUMvKy94eVQ5ZW15cmlYTHRzNXJwQjVz?=
 =?utf-8?B?MzcwRFZROG5yNHMvaVhaMmFhcTVZNEZrSjlNOWlnUWx4WWlHdXpYVUZNRDVT?=
 =?utf-8?B?aGtZb0szTWVtOUVJZHk5MzYrVEx6T0VLeElsUW5WejY0dlh1UDVMTXpEMHMx?=
 =?utf-8?B?S2ZXV2J5ditOa0dVS0xVZWFHckUvU2RvVlZDUnVLMnVhNVB2VkJIOUtzV01Y?=
 =?utf-8?B?MnBhMzFrSUYzejBQNXJvc3diTkpHbTBqandmTjByL0djZG5haEU0K2NRcGJG?=
 =?utf-8?B?cUptdklydUhDdUpuMDI1VjVveG9zdDhJck1KNFB2R09vOHdwNjd6allUeWFL?=
 =?utf-8?B?bi94WWcwL1VCU3BISUgyY0dZZ2o4MWV5M1JEU0ZtRkpPY2luWUxJTmFkSU5P?=
 =?utf-8?B?M1ZVMWdRY3AwM0ZwcHZQdDN6OEVzUHMyN2k2Yys2TURDTlE1Y1dLcUI0TjhZ?=
 =?utf-8?B?SVM4UklCbXBlaVJQZ1FvRkdrb01YRHNXNUt5elFPNVk0RE9MM0JRM3ovMnlE?=
 =?utf-8?B?NlFUK0dmbTRQTCtreTBlMlhuMlRlRHVhNkdDSXpSK2JMWUg4cjZnMzYyQU8r?=
 =?utf-8?B?QUZMWkVYYXdlTFhreFR0eGJxOEY2WVBUQXpiKzBnMkdYUnAzNU9vYjdMUjM0?=
 =?utf-8?B?NXBRU1o2Q0c5ZjlnQVRDQWRCY1pQUng4KzcrREF0endXbW1oNy8wTm0yQzdr?=
 =?utf-8?B?OTZNNklFL1JoRHBlS3BmVzVNOXBmNDAySGUvdmc5UUZZdmZhaTh5SlBwMnd6?=
 =?utf-8?B?bFllcnhwOEFBUytQbDZwbnNua3J3UHhSeHVEUTVJTDd0YU1SZHYxcnM2OTNW?=
 =?utf-8?B?RmhxamcrTDR5L2RWOHhKRkFTd0dWWTFobVRjRm5OVXhvUDVzdW94blZCd1li?=
 =?utf-8?B?dE5pbUpTbnV4a241ZEU2QUlMaUp2R0dnSmhuNjRjei9mbEtUVExtQWxJNkVH?=
 =?utf-8?B?bTNHUWZ2RHI0Z0gzdmI4bTVETDA1U2dJbE0wQkhndU5RcnBDK2VuZ2FLa2RJ?=
 =?utf-8?B?bW9aKzhhT0ZwVWdNbFM2Y1dQQVVFNGg0TUNHbHZKR2t0M0FxSFpaWDRidTF6?=
 =?utf-8?B?dXRGajZQR3cvdEM2RTJCcFlwMkwzcFhPSDdzSk52MEdrc3BtYklwcDhCS2hD?=
 =?utf-8?Q?znzQPd2A8wqkUWXU0TbwyDgZtlj8je09OXIyHOlIQYXE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c3NNRUhQdWJ4dDhrV3p3MmR1eG80TWN4VGR3bzhMQjNWVDBWalp2R2gvT2Ew?=
 =?utf-8?B?Wmd3UHRIN0s4dVplVXM4L002UXUwRTBLRWM5MDhQMEdpQUlqRWV6T2N2LzV6?=
 =?utf-8?B?SG1pTll3ZnJiVVROLzVPaHBwRndzUkNYNHVVeGdLYm40cEFxZVZEd01RakY4?=
 =?utf-8?B?V1hYdjVDb3dVZWJOd1ptbE0zNVNRVktOU0U3MHZlSjRqSXJjTUVwZWxSYkV5?=
 =?utf-8?B?aEhPTEhJMFdMY05VK3VYbThZTTJwQkNJVFEvNmlZTFYraUQrbU51Q0FkNUY3?=
 =?utf-8?B?eUQwVnp5L05rWFNROWxQckthQzIzNXBGZkZHcFpoaGgvNi9HU3RuZk1jcXRO?=
 =?utf-8?B?WnBFc3Q1YVdONXAzS2grdG8zWTlmQzJGZm5QSFZCRDhLTUVYL2pMY2NnbnN5?=
 =?utf-8?B?MW02akNxT3Z5S2Y2UHR6VHVsOXVpTUN4UHVPU0ZtSXFvajR0dWcrQnMzdFFH?=
 =?utf-8?B?Q3NSNXVMRzE2VGNzZUtEaVVCMGZJYmxMTEc3TDllN21sQi92VW9uS2lKMU0x?=
 =?utf-8?B?WFhnNnJ1RWNWNitrdlZnVnJaOGxEd01PaW9hZXFnZm1YeFMxYmhuRFhya2R1?=
 =?utf-8?B?Z2ZKRmkxRmY0VW12YUdNWU14UUZDN0gyUW1YYU95VXNnbXpDKzVCWExOWk9G?=
 =?utf-8?B?bHJ4b3JSMHpiSDNobzloenplbzA4dWJwRnVxNlJjS1p1U3hGam5LZlZIK0Q0?=
 =?utf-8?B?SldqdUpVeTd5UVFSeEZYdkRUZm12cGs3eUptS0REelc1NGQyQVRTZXNHMk1a?=
 =?utf-8?B?SE8zaTRKVjFmVFdIeVR2cXNtS1BZL0Ftd1dUY3pkRWlGZEd2akc4Z3VMbTNy?=
 =?utf-8?B?a2xpc3FUdWRSOFBmMFErMEl3TklTL3hQZHVVYUFiWXhWU01yOXVacTcwOWsx?=
 =?utf-8?B?MDdJYXhteDB1ekl4WkEwNmVKaklLNXlBa1JHTnRkRDlWVmx5VjNSVkMvS290?=
 =?utf-8?B?VHI1TjZ6eEhRMGpOZUZUZjJic0gyK3FlTjBoYjZ6cHBqaVR2QTNrN3NGWlJD?=
 =?utf-8?B?bEpEa2hPZUVybkNYb1JRK3B4STh3OVd2WXRDckQ5VE1Fc3pJOWNycU9NbU14?=
 =?utf-8?B?cmQzSUJwSit2TGg2cXpGTDNCUWtFTmtlWUZ1RnNJYVZEeEp3U01haHdadkxM?=
 =?utf-8?B?TUNSZkQ3U3BvM01NRi9iNFllQ2tkNnJ1dDlGK242NWpTQ2F0OENGOE5DczJN?=
 =?utf-8?B?N3oxTm1FeFNyTjZXMHUrSnZKWEN5ZVhDeHVKdlFWN2ZlSVoxc25rOExzM0U0?=
 =?utf-8?B?Tm1ROHdoUER6ODQzSjFoeW9XckNYZHNudEZFZGN1MitDVUtkMWduTzhUWFVN?=
 =?utf-8?B?b2tVUWdCTTl3QTYyNTJhTm16Z2c4MlQySTh4c2Rlc201aGo3UmVnb01vRXNF?=
 =?utf-8?B?M2R3R0N5cUxiMjE4VHlpQjdSUU5Va1VtbU5QRlR6eDZ0K0hFcU5GV1A5RURP?=
 =?utf-8?B?d2VUaHRrTE1pajQwVWxUdHlZQUcrOWlONmMrMWZCNWl5alpTa0FUNW9TbzBO?=
 =?utf-8?B?VG1seXlXV1J6RmZhR0hlZDBiNWx6Vko5d0RFaXU2Z0pjQ3BCRVVxdFVpd29U?=
 =?utf-8?B?SWhOWFBySzhwL282MFhKS1FvR0s3eUpxUGhGbmI5b0tFSStudFlTT3JVT3ZZ?=
 =?utf-8?B?V1dFSmx5TEFwc0hYZDJVRklTdkhaQW5DM2YzRE1zaTFJU3Z1ZWloaDZKMTdz?=
 =?utf-8?B?WlcrOFZsRVh4dllzcTN6QWkvcS92WFFBT3pJQ3I0MmVuZW1kQVRSUE1qR1dG?=
 =?utf-8?B?eXY4MFgzM3ladlB6RmdKWXU2TVhOcVdDTnplMzBycUtKYTRUQTRRTWZIbVBa?=
 =?utf-8?B?MTFzT2ZlcUdJSXg2bGx2ajRxTkNHNlRxYTVpNVF2WlBKTkdYdkdaSE85UW5W?=
 =?utf-8?B?RmprdmhjOC9wMnRjMm5CM1R3YzRpVHoybnplSHBxKzFLMTFiSmVrSkNIKzVJ?=
 =?utf-8?B?ZDVCY1VzTlNGbzVzQ2RXaGR6dXo1NkJ4RkJqbEY4WFB3VXhRRlFnQzB1UE5P?=
 =?utf-8?B?R29aNngzWjRobnFjM2hSTUM5dnRGbTRDVXk2QUJ4UTIwSndRa0FnMkdvTW5N?=
 =?utf-8?B?UkZ5QXNPZ2RJNFJLZWxQV3VQM0diS0I3Yk5ZSThwK2dLUlFuaTc4R0VURjYr?=
 =?utf-8?B?ZmdrcFNjakJqeDZDb1RMMi9HbWhVYUZBSDVjUmFBeVg1UENYNUQ5TDlwcXZK?=
 =?utf-8?B?RXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4cf396-2022-472b-ed1a-08dc68ec591a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 08:05:49.8700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3QuygXxuwvgYPTE2uZZBhXGp1AznfGaDpBH0a2rN0bZ+TwsYmgDgrbfh5LAIt209DcbZNHw0uQiY7RB5oMa+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4819
X-Proofpoint-ORIG-GUID: t7zX5UysWI7ZietexqyLqGNpdNyMXZ25
X-Proofpoint-GUID: ss-Oirf_yWSRLJPUiySvUTOdKJzQo6pt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_04,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 clxscore=1015 adultscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300058
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 43U6F3Xp023428
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Apr 2024 08:05:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110194



On 4/30/24 15:45, Martin Jansa wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>=20
> On Tue, Apr 30, 2024 at 9:28=E2=80=AFAM Yu, Mingli <mingli.yu@windriver=
.com> wrote:
>>
>>
>>
>> On 4/30/24 15:16, Martin Jansa wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
>>>
>>> On Wed, Mar 27, 2024 at 8:16=E2=80=AFAM Yu, Mingli <mingli.yu@eng.win=
driver.com> wrote:
>>>>
>>>> From: Tim Orling <ticotimo@gmail.com>
>>>>
>>>> * Also replace ${PYTHON_PN} with python3
>>>>
>>>> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> (cherry picked from commit 182f31a182f6572a3538b875cec7ee761e2da1e6)
>>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>> ...
>>>> diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-incl=
ude_1.3.2.bb b/meta-python/recipes-devtools/python/python3-pyyaml-include=
_1.3.2.bb
>>>> index 9bfaa2194..3a5bd99a7 100644
>>>> --- a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3=
.2.bb
>>>> +++ b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3=
.2.bb
>>>> @@ -2,7 +2,7 @@ SUMMARY =3D "Extending PyYAML with a custom construc=
tor for including YAML files w
>>>>    HOMEPAGE =3D "https://github.com/tanbro/pyyaml-include"
>>>>    LICENSE =3D "GPL-3.0-only"
>>>>    LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd32239bcb673463ab874e8=
0d47fae504"
>>>> -DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
>>>> +DEPENDS +=3D "python3-setuptools-scm-native"
>>>>    SRCREV =3D "36b6975aa8fc7a6cbf37de40aa2ed6d996b2f7be"
>>>>
>>>>    SRC_URI =3D " \
>>>> @@ -20,9 +20,10 @@ do_install_ptest() {
>>>>    }
>>>>
>>>>    RDEPENDS:${PN} +=3D " \
>>>> -    ${PYTHON_PN}-pyyaml \
>>>> +    python3-pyyaml \
>>>>    "
>>>>    RDEPENDS:${PN}-ptest +=3D " \
>>>> -    ${PYTHON_PN}-pytest \
>>>> +    python3-pytest \
>>>> +    python3-unittest-automake-output \
>>>>    "
>>>
>>> This was now merged to meta-oe kirkstone, but the
>>> python3-unittest-automake-output isn't available in oe-core kirkstone=
,
>>> causing:
>>> ERROR: Nothing RPROVIDES 'python3-unittest-automake-output' (but
>>> meta-oe/meta-python/recipes-devtools/python/python3-pyyaml-include_1.=
4.1.bb
>>> RDEPENDS on or otherwise requires it)
>>>
>>> python3-unittest-automake-output was added to oe-core in mickledore:
>>>
>>> openembedded-core $ git log --oneline --
>>> ./meta/recipes-devtools/python/python3-unittest-automake-output_0.1.b=
b
>>> db0e82135c python3-unittest-automake-output: upgrade to 0.2
>>> 961e4f3fc7 python3-unittest-automake-output: add new recipe for ptest
>>> integration
>>>
>>> Please revert this (if the newer python3-pyyaml-include works without
>>> this change) or add python3-unittest-automake-output to kirkstone as
>>> well.
>>
>> The python3-pyyaml-include did works without
>> python3-unittest-automake-output, but the python3-pyyaml-include ptest
>> needs python3-unittest-automake-output and I also sent the patch to
>> oe-core(kirkstone)[1].
>>
>> [1]
>> https://lore.kernel.org/all/20240327072236.2221619-1-mingli.yu@windriv=
er.com/T/#mda91919809cf156aba24f099bef65142067cd318
>=20
> [1] was rejected by Steve, so what's the plan now?

Is it okay to add python3-unittest-automake-output in=20
meta-openembedded/meta-python(kirkstone)? If okay, I will send the patch=20
then.

Thanks,

>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110193): https://lists.openembedded.org/g/openembed=
ded-devel/message/110193
> Mute This Topic: https://lists.openembedded.org/mt/105173183/3618448
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[mingli.yu@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

