Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0F9CCD185
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 02:04:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3577.1760148280526167826
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Oct 2025 19:04:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=scNrnrhW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2379325bac=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59B1qv7B4020163
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 02:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=sBuxUcTXSbCQNoJy0oWB9/
	4nM65xQOiuTN30EcA0xWo=; b=scNrnrhWATTy4KoC3KyXySymOl73INBBHEb2v9
	Qx+bxQtOetb5QekpWzlI0kb2ojycfECXiitD8moDWYixuo7rXzFKRYMORqcHjjLX
	cP1SlhoSSWru64HngHYcIwuf15RJ8wWBrhnwiPn7IuZpLiZ4i+PFPFv4DwKsioj7
	gL2zV/0o1NeQr7ZMOPsBVC24e7aetTa6b1rr46GnlGvchCOBcS3YTlmLsNDiexMS
	6zv3fKZD9ut0ikqYnINyVtiIaNWlicr9CDzl9ZcN/KfgDKNcpdo7geYDyCOrw8vw
	9XLGZ4xIiRkKFpm/7y94W2kkOMl81dTlzCWScBMBNtB0Tp6Q==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011052.outbound.protection.outlook.com [40.107.208.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49nx37tts6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 11 Oct 2025 02:04:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GOoH1bOe8sCHiST2eYtgGl2wh70ww4W0LRcVFd87NIO1A+Fbdhb5Mm+IZwK54JYNG/gnVzKPKq0oBfitM7ecB2baNEHkUiW3sTLqSoBoCtTIRAJUzSMtp1tA1lp/bkXjW9H5Mu8rnjkJk4bGDEjCYejKN1DhO6S6oK5BULyZ3hgV8M+CvBPSpzb5pD5VXTGBOnTfPz2Bcw1iB2k/lX17gKTJOYswjC/kwp4ppGCgo3iCjw8TRadWKlpVm83h0l9UpQ1QP0/H3fkxxfLEVRTkPdmHO2KohzgNR9sl8IIZn/8gfKzaqTUQ3zf9AbXCzc/VAYtoSM2xGoyTwSrNVdOqFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBuxUcTXSbCQNoJy0oWB9/4nM65xQOiuTN30EcA0xWo=;
 b=P1AXJX9yeh13FOUm5jq13ybMBCt13qGQC06Y4mRAtp7k9TpFhI6jRPlPPs1SYTjYiMrHnQxcv82E9QeNDlDfTyQ63GqxQoC1SLFvfM/gYt1Xz7Q7LdjKX0KTGDs7yt2iBOgTS7AlaCOB62GET0JGjtj9hZOnMFFVTnlAKSPn5URvoZLLkDoA9UOibF86CRdsBAyNQcH0sla5IlakwojarDLKjMvb1avbtWXKP8QaaE+uK8GpFRAvNnSB1k9NmLO9dVGpU2OplFdOXLC93nt32BQNf7d5iS/yZTRv0Faf0S8g535SakbzCrUvtquFbQFp5qmhkQ/kaLV7zYpBi2UFWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH7PR11MB6474.namprd11.prod.outlook.com (2603:10b6:510:1f2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Sat, 11 Oct
 2025 02:04:35 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9203.009; Sat, 11 Oct 2025
 02:04:34 +0000
Content-Type: multipart/alternative;
 boundary="------------mOHoiJSOf0Pmujn8e29uyTxc"
Message-ID: <3fb55984-0078-468f-8908-e91ccb23a4de@windriver.com>
Date: Sat, 11 Oct 2025 10:04:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH V2] doxygen: fix reproducibility issue of
 doxygen-src
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
References: <186D1A99E7CAB2E7.15959@lists.openembedded.org>
 <186D4D2D26934862.13356@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <186D4D2D26934862.13356@lists.openembedded.org>
X-ClientProxiedBy: TYCPR01CA0118.jpnprd01.prod.outlook.com
 (2603:1096:405:4::34) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH7PR11MB6474:EE_
X-MS-Office365-Filtering-Correlation-Id: 0887ecdb-2a6d-41f1-2e36-08de086a8638
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TEJFbS9abHpWZFFMOG1zeEpwWWJCeFM2MXd6c0swcDdOc1lBbUx3YjNWc202?=
 =?utf-8?B?ZnhBaG9IR1dhVnFEQmIrU2FtYXVEMitZZGZRbXozWnpMemdLUVd1UVJTSDFp?=
 =?utf-8?B?ZTJMS3ZqT1NyZ09mZXJ0R2pqaUFUY2ZrT1FFa0RxSjk0SVZPN2QwR2VtLzR3?=
 =?utf-8?B?KzZSdkFEbXpFWk0wdkVJTXNZRUlaKzVFTkhLYmhtVHoyd0JoRjV4UlNMMTli?=
 =?utf-8?B?TDk0L2lscXpWY2dEbUF4ZHVkajZBMEtHWkUvWmxTamxEVncrTTgxNS9VVkhG?=
 =?utf-8?B?bnZ0QmVudDN3VHdQWS84TmZ0UHVHeFlNaXJkNnBHZjJQNnNTb3hYbHpVT3Vs?=
 =?utf-8?B?dHFURG9nUkxHWW1ENVkzZDV4bHozZ1VyVmlLNUs3UkNrSzNQdkM2OHFyaVU0?=
 =?utf-8?B?ZjNrbHV6VXdFcUo4cy91NHBuRlZxOVh3a0ZqVXowTWQ5M0hLR1ZCcS9zZWU3?=
 =?utf-8?B?elpiTXE2NnIzaXkrczVwb0xvdjcyMDRSbzlWVUtXOUdZU0xkbDEraG51a2o5?=
 =?utf-8?B?RDlUbEhVbVFSU0pWV0U2cFdSL05icU1SQXExeUE1b2g0Z3lpNjU3OWxEb2xX?=
 =?utf-8?B?QTBhcUlkNFZpNVh3NVlTdTJ0MnlmY0l3NVFYTE41cnl3bFo5ZTNUajRaZzNu?=
 =?utf-8?B?N09ydDhXYlNJT2wzeGVXdWJVV1lYV3ZPQiswSmpheXpzTk5JcWtzaUJpb1dV?=
 =?utf-8?B?anBQd2d6Ymg3c0ZLQlVoKy9WWENwVzhXakpLdVk2UVR5UDcveHpseXlRUWNp?=
 =?utf-8?B?UmJzeVpGWmhjcTMvcTRieW5lMys0L3hON0h3YTFxWTdhODlMczdjYXZGd095?=
 =?utf-8?B?Y3ZSbWpsSmRtWHBHNVdqV1NwTDUvcmNWTFN4Zmx0cFcrdnQrV05aLzBIRldz?=
 =?utf-8?B?VTQ3ZGxXOHhLVGRSUmZRc1JWN0R4Z2hBS0I3dE8rdUNmeGE0QVB5R0ZqUi9M?=
 =?utf-8?B?SDdoSzBXdG9vVW9lcGVtTjdUekV3aUpMTCtHT0ZjOU42Y0RueFRVU1FLZlZU?=
 =?utf-8?B?RWNyQWQyd2V1MzdtdVBXSEVOOGF3c2J3SWJxZU5rd2V6Y1JjM3hwdDd1YjJs?=
 =?utf-8?B?T0JlM0dZQ0RiMnQzRURUblhDczRJQTl3c3VOYnJyODl4VzRzNVBVbzN1U2ZI?=
 =?utf-8?B?VWI0R3RKYkNXTWJkenI5VC9vZVdBNjQ3bE9YczAvRXlLS1k2cmh4U2Jzb0Zo?=
 =?utf-8?B?cnRqWnExdEFOK2Y1a3Znak55TjBNZzBMOXVSZGY1c3R1cWhXWjZ3VnVvMWxT?=
 =?utf-8?B?MDNjM2ZWMFovQ0ZveUVrazYxWFV0MmZId0h0ZUlueUI3V3g2TlR1WDFzblJV?=
 =?utf-8?B?ZldNQzJieCtVNFZpZGk2Y3BrOUxuWVNvQVZDR0xkSXpxOFhXVFUydUFtQ2da?=
 =?utf-8?B?VCtJRmZiT2dlUGtiSjh0UjNTQnF4SWIwV2RUZnVLWU5zbjVuUTRLR2Q2MEdI?=
 =?utf-8?B?aitRb2lUeVd0R2xaNzVaSDBuTUc4TS83ZVJadlBvcG44ZHB5cjBtbERONUpm?=
 =?utf-8?B?OThYU3Z4bjJxOS8xdzEwbHgxb1F4ZGVOeVZZMm1qMjlKRTB0K1NsRDVIcU42?=
 =?utf-8?B?Rkw0ckMrbUk2YXZKZDV5VlRkVWxKY2tIOWZsaVdwRE1oTGpDemZGdWY5djk1?=
 =?utf-8?B?RTkrd25EeXpwZ0JuZm1ZWjlXbUs5aEF4UVFSOUVieDh6QjVIL3phSVphNzlG?=
 =?utf-8?B?OTVBUVc4RkZzd2JNbXl2Y0dmdWlYZmc2RUZJWWQ1T256N1dCUXZiZGNuZXpZ?=
 =?utf-8?B?bmhqZm01alBrQ2JrbGpFaHVMQmxTRkRuUis1NjZvRHlDWDFqN1crZ280YWFK?=
 =?utf-8?B?dkNFQitSMWU2UzZ0cU5mM1c3aUNNeEk1b21TaHpLZHNyWEsvMXo1TFdvRVpa?=
 =?utf-8?B?NTlhZlBSRlo4NDdmb004YlB4TTU5b3RUMVgzQ0pBKzhWNmc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OFROK1N0K0R3ZkgwTjlUMWkvdUlySjFPVU12bFJhSUJiM2ZQTHp2Y3AzaXZC?=
 =?utf-8?B?WTh2eXVpWk5wcDR1NnpwcGtHOTZxTUZaaGUzRm92bndMYlhvdnNSYkw4VlRn?=
 =?utf-8?B?SnJET08rUCtyK3ltaVNERW4welBSdk5WNmU0RW01bzIyNGh6K0R6TkpXZDQ4?=
 =?utf-8?B?M01UQlBnb0h3QXc4bHYvT1l5eWtzZFFQZm9VVFF5bGtqWXFtYlcxL3YyVkR6?=
 =?utf-8?B?UEo1WThrRzhUTWtnV3R2ZlZPZXVhRElXRGEySkNPbW9iTHl6ZXVBNnpScklM?=
 =?utf-8?B?OVRSWEw1WUJjTUNac2xqR3R4VlVEOW9IaTZCOVNTZkpRU1VvOTcwa2hJczNs?=
 =?utf-8?B?UTBiR0l6NWtSMmtkVVFpUWJrcWg3S3k0bjJSWlNsSm9xaGJ5VmVnM05GUEhs?=
 =?utf-8?B?dUs3eGtDNkZGQjZRQVB4eTZCU0p6Z0ovdnZsaGJXZHVhOVNwV0VKRmQrcXdx?=
 =?utf-8?B?Z3VBRVZYR3VkQjM0cGRkQkxqSDd3c2RMd2YwMHQ1M0lRVmlIVFNGdkZYaWJZ?=
 =?utf-8?B?WkpKZHBnSFdNTHR4WnMzSnNQSVFFdE4zRU92QlpCdS91UitBczRWeExheXBI?=
 =?utf-8?B?KzVqUFBta0RZQ09hLzRoRkZ2aEU0VVY1LzhBU3Vud1Y3TlNUV0lJQi9OSnZU?=
 =?utf-8?B?ckNwb0lwZW9nUWlPS2h6TXZkYzA0MGVOSjBmQWI1RFZjME5qc0UzVzc3WUVu?=
 =?utf-8?B?UG5oTHp6d3lQVTlEcWQvZ3BQclhJSVcyRElXQThvWUpya3BuTWdQazhCRzlq?=
 =?utf-8?B?dmlxbUtGeVpqVGhycFZyV2FkdWdJTHFxVGxqdDZJS0Z2eGlFdHprc1dIOVZJ?=
 =?utf-8?B?RGIvNWxJZkhSc3ZWR0J1Zk1nZHhIeVNFdXc0d2V6Q2htQTJDWXhrcSt6NXk0?=
 =?utf-8?B?bE9pQlFDUnBoNFZyWlE2UFVLVlEyTmJJdEt1TUZzT0o3YzZiL1FudDh3OGJK?=
 =?utf-8?B?R25RbzlOY080TmRFRHVkM0VGT0lSeHViTVVxMWNoL1JnTFovOEIvV1RCaDhp?=
 =?utf-8?B?SlZaRHpnUHN5ZzV6bE1XaHlaalJiMWFWVS9tRExQMlM5cEZlWXhvUUR2MEJr?=
 =?utf-8?B?OUpJRFhGWE1KQlNaM2ZDem5XOWZsY21jUGdPTFNKNmFGMUxDQTFONmNQTUsz?=
 =?utf-8?B?M2VDR0NwNW1UUUdNTDBsWDBTcEJaVy9aVVFIcFZEQWtRR21vdDB5ek95ZXNl?=
 =?utf-8?B?dGUxSTFtQmZIK0VHQlpOYUhlU2lPOGk2REZZUU5weUxUZ1dwcG5JOWdicXla?=
 =?utf-8?B?SWFiT1VOMkUrb2VzU0JieG1rZVBuRFpibTdOOU1kc1FrVk9kMVVhOHZBcXJV?=
 =?utf-8?B?bVVkcVVJQ3hheXc2N3poM3VtT1FCc3pZMGxaSDVqRGhTUDFJMEU0QjY0eTNz?=
 =?utf-8?B?Q2RVb3ZiVmVJc3duSUZGdm5sVDFpeVdlZk1jTnI2Yjlmai9yQ1JOYjFYc1ZO?=
 =?utf-8?B?cituYU04SVd1V2d6UnJGeS9Qd1VSYnA3bkdjYU5CVFlDbmwxcHk5L1VMMTVr?=
 =?utf-8?B?NGo1aEUvaUJqNHhGbFJqS0NjR3MrNE9PbHhhbTdyNUljV0RhL1ducGZ1Y0xh?=
 =?utf-8?B?THd6blBqVWtMK2loR0F4TldxTnFBYVRGQjZRRkhQbEYzRmYrc3VacDZyL0sy?=
 =?utf-8?B?c3lwQURENHQyVjN6ZXVUcCtuZ0FacU0vSjNQWDZZaUxKbCt6QTdkSVRaNDF6?=
 =?utf-8?B?bEQwdXFtajhqUk1pT1diMUVlRmlVUUZTWVdiN3NGdGw0TXFBckdCczgrd0tZ?=
 =?utf-8?B?cmFlNjJXdlBBaHdqMmx1TDQ0VHdESVczTW5vNFJ2TUJ3TmJsd3lvcFQ2a0k4?=
 =?utf-8?B?RFpvY1BhQWZ2RHh2RkhDODNrNi9Mb1haWjV2OWF2WHNkQTBhbFlaQ2lOMXYz?=
 =?utf-8?B?K0ovYW5XNWUzcVF1aElSWkZGV1FkV1BadFJNcGtjTWJKWDBXL0VtUE5LQ2Ja?=
 =?utf-8?B?OFpPcmdwbkxwTUZmZ1Q0d3pVMGNSMzh3ZHFDN1dtcXZDZXcybzJ4dFJrckZ3?=
 =?utf-8?B?UGJkTmsyVXZRaDlaRGtiNUd3Z2o2b2tPZGZRdFRtcGJkb1Z6cU5tZWdGcXhU?=
 =?utf-8?B?WWxzOVZkYkxWbEUxM2p0WHAzTVB1N25WQXF1TzQyZlpxbEdta3czMjNYbWRw?=
 =?utf-8?B?dWpjaTQ1QkIvb1B2bkp2OUJlSzdGRGE4YmM5U2hxQllQdmN2ajE4UitkcXpI?=
 =?utf-8?B?bWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0887ecdb-2a6d-41f1-2e36-08de086a8638
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 02:04:34.7493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BoNSpE7HW/cx+htkGePXMYLy82pznKK+/5SCJxJRbHGzGHfa/+xgkydsFDCNphFMnFDPZb5I+rK/abzsR83QsjasejoAqhKaBK/wMKLIENQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6474
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=M9tA6iws c=1 sm=1 tr=0 ts=68e9bb37 cx=c_pps
 a=DEJEzXtY41/hIaqkAZCRpw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=BC3osz9UxrQAUIc3H5IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dAAgDao2ka2zaJf8ESEA:9 a=MfN04mCT60-i-tlc:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: k-954jypjaGvc4K7O8LYDWTuA_N6AaEb
X-Proofpoint-GUID: c8Z9Q5h_Vfh-RmfSXDsHO0KFbYvvTBML
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxMCBTYWx0ZWRfX5gyv+Ind1KH8
 iI3AfNfowoGh3HrZzXzKhc64jlWdvMsZ4MnxH6bf1vGYmgBgT+QpMMF0n+4bnV+mkqwiQ/EvUDq
 F32SMEKAyFytw6hEMsQMLPiLb6w4wl/Sh+U6/PzsabQ7mfHoCoLPCEfbNyHCj8MLqjAiuixf9Ze
 hgrR2Z2nPbTvJHgAhtiXG6FXDogwxoaq31SQ6BLvbIYanO+h+tN58z4gp8jlQfjqaTaWFo3n3+K
 HvCkoONTTVE6CSJLeQpbZP4cmeXOjq0K05c+QFTDyaU2M26WTELUoHSBEALTXjEZs/AFsbKavbc
 9ExNPg69dTALwjVH3mnSc7nCjOncOESXV1ovIIvn1se2dvk2DjxxRC3dNWNA00qhidpgV/Sf3OQ
 Vp1ePcvTq19Fe7xne1weUw+hdsH2wA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510110010
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 02:04:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120488

--------------mOHoiJSOf0Pmujn8e29uyTxc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 59B1qv7B4020163

Hi, Khem

I do 2 changes for this patch,=C2=A0 and I noticed this patch is on=20
master-next, could you please help to update it, sorry to bother you.

Changes in V2:

* Add space before #ifndef to avoid it is taken as comment, and missed=20
in commit message

* Remove doxygen-src from OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES

Thanks

Changqing

On 10/11/25 09:58, Changqing Li via lists.openembedded.org wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> [ snip of CMakeLists.txt ]
> BISON_TARGET(constexp
>               ${CMAKE_CURRENT_LIST_DIR}/constexp.y
>               ${GENERATED_SRC}/ce_parse.cpp
>               COMPILE_FLAGS "${YACC_FLAGS}")
> [ end of snip ]
>
> bison embeds full paths in its generated headers, eg:
> bison -o /full/build/path/generated/example.cpp ...
> The header will include:
>   #ifndef YY_FULL_BUILD_PATH_GENERATED_MSCGEN_LANGUAGE_HPP_INCLUDED
>   #define YY_FULL_BUILD_PATH_GENERATED_MSCGEN_LANGUAGE_HPP_INCLUDED
>
> This make doxygen-src not reproducible, fix by replacing full build pat=
h
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   meta-oe/conf/layer.conf                            |  1 -
>   meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb | 10 ++++++++++
>   2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> index 5b9ceb424e..56aea73b15 100644
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -138,7 +138,6 @@ OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES +=3D " \
>       dhrystone-src \
>       directfb \
>       directfb-dbg \
> -    doxygen-src \
>       edid-decode \
>       edid-decode-dbg \
>       editorconfig-core-c-dev \
> diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb b/meta-=
oe/recipes-devtools/doxygen/doxygen_1.14.0.bb
> index 512a63549e..73594fc09f 100644
> --- a/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb
> +++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb
> @@ -22,4 +22,14 @@ EXTRA_OECMAKE +=3D "\
>       -DBISON_TARGET_ARG_COMPILE_FLAGS=3D'--no-lines' \
>   "
>  =20
> +do_install:append() {
> +    sed -i -e 's;^#ifndef.*GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED$=
;#ifndef GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED;g' ${B}/generated_src=
/mscgen_language.hpp
> +    sed -i -e 's;^# define.*GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED=
$;# define GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED;g' ${B}/generated_s=
rc/mscgen_language.hpp
> +    sed -i -e 's;^#endif.*GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED.*=
$;#endif;g' ${B}/generated_src/mscgen_language.hpp
> +
> +    sed -i -e 's;^#ifndef.*GENERATED_SRC_CE_PARSE_HPP_INCLUDED$;#ifnde=
f GENERATED_SRC_CE_PARSE_HPP_INCLUDED;g' ${B}/generated_src/ce_parse.hpp
> +    sed -i -e 's;^# define.*GENERATED_SRC_CE_PARSE_HPP_INCLUDED$;# def=
ine GENERATED_SRC_CE_PARSE_HPP_INCLUDED;g' ${B}/generated_src/ce_parse.hp=
p
> +    sed -i -e 's;^#endif.*GENERATED_SRC_CE_PARSE_HPP_INCLUDED.*$;#endi=
f;g' ${B}/generated_src/ce_parse.hpp
> +}
> +
>   BBCLASSEXTEND =3D "native nativesdk"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120487):https://lists.openembedded.org/g/openembedd=
ed-devel/message/120487
> Mute This Topic:https://lists.openembedded.org/mt/115699816/3616873
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub [=
changqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------mOHoiJSOf0Pmujn8e29uyTxc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p>Hi, Khem</p>
    <p>I do 2 changes for this patch,&nbsp; and I noticed this patch is on
      master-next, could you please help to update it, sorry to bother&nbsp;
      you.&nbsp;</p>
    <p>Changes in V2:</p>
    <p>* Add space before #ifndef to avoid it is taken as comment, and
      missed in commit message</p>
    <p>* Remove <span style="white-space: pre-wrap">doxygen-src from </span><span style="white-space: pre-wrap">OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES</span></p>
    <p>Thanks</p>
    <p>Changqing<br>
    </p>
    <div class="moz-cite-prefix">On 10/11/25 09:58, Changqing Li via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:186D4D2D26934862.13356@lists.openembedded.org">
      <pre wrap="" class="moz-quote-pre">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

[ snip of CMakeLists.txt ]
BISON_TARGET(constexp
             ${CMAKE_CURRENT_LIST_DIR}/constexp.y
             ${GENERATED_SRC}/ce_parse.cpp
             COMPILE_FLAGS &quot;${YACC_FLAGS}&quot;)
[ end of snip ]

bison embeds full paths in its generated headers, eg:
bison -o /full/build/path/generated/example.cpp ...
The header will include:
 #ifndef YY_FULL_BUILD_PATH_GENERATED_MSCGEN_LANGUAGE_HPP_INCLUDED
 #define YY_FULL_BUILD_PATH_GENERATED_MSCGEN_LANGUAGE_HPP_INCLUDED

This make doxygen-src not reproducible, fix by replacing full build path

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta-oe/conf/layer.conf                            |  1 -
 meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 5b9ceb424e..56aea73b15 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -138,7 +138,6 @@ OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += &quot; \
     dhrystone-src \
     directfb \
     directfb-dbg \
-    doxygen-src \
     edid-decode \
     edid-decode-dbg \
     editorconfig-core-c-dev \
diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb
index 512a63549e..73594fc09f 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb
@@ -22,4 +22,14 @@ EXTRA_OECMAKE += &quot;\
     -DBISON_TARGET_ARG_COMPILE_FLAGS='--no-lines' \
 &quot;
 
+do_install:append() {
+    sed -i -e 's;^#ifndef.*GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED$;#ifndef GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED;g' ${B}/generated_src/mscgen_language.hpp
+    sed -i -e 's;^# define.*GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED$;# define GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED;g' ${B}/generated_src/mscgen_language.hpp
+    sed -i -e 's;^#endif.*GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED.*$;#endif;g' ${B}/generated_src/mscgen_language.hpp
+
+    sed -i -e 's;^#ifndef.*GENERATED_SRC_CE_PARSE_HPP_INCLUDED$;#ifndef GENERATED_SRC_CE_PARSE_HPP_INCLUDED;g' ${B}/generated_src/ce_parse.hpp
+    sed -i -e 's;^# define.*GENERATED_SRC_CE_PARSE_HPP_INCLUDED$;# define GENERATED_SRC_CE_PARSE_HPP_INCLUDED;g' ${B}/generated_src/ce_parse.hpp
+    sed -i -e 's;^#endif.*GENERATED_SRC_CE_PARSE_HPP_INCLUDED.*$;#endif;g' ${B}/generated_src/ce_parse.hpp
+}
+
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#120487): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/120487">https://lists.openembedded.org/g/openembedded-devel/message/120487</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/115699816/3616873">https://lists.openembedded.org/mt/115699816/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------mOHoiJSOf0Pmujn8e29uyTxc--

