Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FEB8CCFA04
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 07:22:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4025.1762327320299190454
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Nov 2025 23:22:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=LWxwj2pE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3404438c32=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A55O3JH2153137
	for <openembedded-devel@lists.openembedded.org>; Wed, 5 Nov 2025 07:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=X8Tl/PLj78Nwt3FlWsJRU7eq/J7a8Ut2FN4eDuEIWIQ=; b=LWxwj2pETVW4
	hz2Lt8enZ4x8WhNyxt6bxCeQi8u+vxy+v2HaB2iRhNtykxdjUxfzCmmq6GaeUIfi
	PSpUsI80QpDjnjySX9ayWjvVlYIcoCHQqlMP2hKLUIvCHsFxqpuwFkXfrdZVPdlW
	Q6q88AOh8PrnbOvnXtd14xDhxjBT5XQmzLzIGyc+1x1odZTZJC4iuCZwekluv5XX
	8Xcb9pDdOBaFnQ6962AXBm+PBmrMI6cq97ec4PYKVj9opyZR6o2sbt6Q6mhWm1vU
	BL3ji1lBZj8Acm6wi5VrL64mRKn1S5yX4KCm5ituTeIgoKS1uzMjZLG79jnerPj/
	1o10w+5Dqw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010009.outbound.protection.outlook.com [52.101.46.9])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a7war86sb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 07:21:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ha/qBNDLWaO+NsJSZacvT/1J+acjEFYr4vljPzd/jRpZ9lYI/9v33zRPMKhFO7o+ul521T4hvr7FOinfxkNN31wly1EbEmqnVqz3HQxnvap6sEW0Xd10xYypD3lcTTOM7AhijBiwB4/ZnG2/BMj7PBE5DNlb/ls0Z03KP+hvOPNl6i0QJbxn8hnf5aXFQZNZRKfABcVHyHz8kcBapZt+n8kaIGFUNhdoaS2XKyo/WtL0nt+qSqhoHzdqtP6agEuvtHaf3NM10LRIykpdlzl3sDNMBgHxyAeV8TR9Nz5hv51KaWJ0sDvT65dItEqLdQq7tn2Z/gfiy5XyDl4kJGITeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8Tl/PLj78Nwt3FlWsJRU7eq/J7a8Ut2FN4eDuEIWIQ=;
 b=qfxUFIskUEnuy3fSA31GYCqLhkme9eVcXVjF5HKQIaWmxAQBgeayZTnzVg8B4U7QHhJKCjek+kpQaKy0LJdlOvZvsxhraZz2paPBqkWW37zQfrDq2mLByZjT77xbjyIeioWy40H/vYBDcAkH0b4X+YV9m1LXUeBxlbU9j50lUpqXtfKLnCl+vsxQhLL/ggxNth8/4A3AJt5aL3HVUVzEFScu+9ri61tYSwB6b0t2WFVz2fm0QM40umL2IUnP9u2b+tu77ls8y04THbDybCx1ezrpdpqpWOmbs157AGe9XQvUm3lw0HtT6nsXP5WSWEgt6AtujIGNOtYxW4A/EnLzlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by MN2PR11MB4760.namprd11.prod.outlook.com (2603:10b6:208:266::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 07:21:57 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 07:21:57 +0000
Message-ID: <e5a64246-41ed-477f-a013-8a0abce14fe0@windriver.com>
Date: Wed, 5 Nov 2025 15:20:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][krikstone][PATCH] mbedtls: fix fetch failure due
 to branch name mismatch
To: openembedded-devel@lists.openembedded.org
References: <1875076B41F3452B.363297@lists.openembedded.org>
Content-Language: en-US
From: Haixiao Yan <haixiao.yan.cn@windriver.com>
In-Reply-To: <1875076B41F3452B.363297@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR01CA0146.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::26) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|MN2PR11MB4760:EE_
X-MS-Office365-Filtering-Correlation-Id: 7513ac0a-fbc6-4dba-95cf-08de1c3c00ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|4022899009|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SmtsaFYrQ2R0V0hHV0U1NkV3NUZia2w0SkZKV3l2ZVAvN2k2Q1gvbTFLMEFX?=
 =?utf-8?B?eXVWR3hIMkl4cXNJQjVJVGpRTnVJb1I5aEtWdklPcUFiN1Z1anBsZ2ZEZDJq?=
 =?utf-8?B?bldpVjNrTE9TTm5ZS2lZM3N3aW5XUXdpR3FXV1FTbGxRdnJrTjFVL29EV2d2?=
 =?utf-8?B?UGo4ZnJQcjJJUFlOT3FIbkJ4RktOMENyNk41VTJObEtVTGpsU1E2a25MeFh5?=
 =?utf-8?B?V1U5czdOdnRwU0R5aEJnL0xhVzBWa1JyYm9zM09GTTlyMDdXNUFmampOQnZs?=
 =?utf-8?B?dDdWbFVLQXEvWDAzd3RweEkvd3B4V1drb1kxbjNTcm9ZVVBXY3poUmRZT0Qv?=
 =?utf-8?B?UDVqTlllcWZVSEkzbEwzZHRHRGFtTmdIOElmK0ozcnQ3Tm40Um14RUFuUGJF?=
 =?utf-8?B?SU9EYVJ5NnVhOVBaa1l6RU5HOE9BcXA1WHRaL0NLakFPMUVBZ0g3SDRNU1ZJ?=
 =?utf-8?B?Wkt1djh0NW9SaitoSmF0eDN3dnpvaVF5NXRxQUpqNVllV0phdElhbmxRUlNE?=
 =?utf-8?B?cDlDVVZBZG0wK0RzMzZWUWw5U3Nmc2dYQ1FmVDhWNHJ2UjhKWk0zTGluWEl2?=
 =?utf-8?B?ZE5JbTlRaWtUZG9PN000VS9mYm00dEttTy91V0FMK0I3cjlvZit5YVN0eWhw?=
 =?utf-8?B?Z3grOTAvYVJZcXZwUUduUllQWC9jNkFhN2VJYVNjSFM2QU1scTU1V2NXOEly?=
 =?utf-8?B?a0VCSjJrbDU1YmR3d0JJTGJRQ0xXa0UxK3YveWxZRWRhYnpvYm5hazJ0bFdj?=
 =?utf-8?B?UzA1UFovQjQvOGg2YkwvNE82bkRNbEJOOFZJL3dMK2Rld2Qxamx0K05VL2NH?=
 =?utf-8?B?aDc2NkpNQ1hjK3M3UWE5R3N4bEZTTkw0Z1BSaUNwZlByQkloQUo3b1BQL1hX?=
 =?utf-8?B?bklqS04rd1daY1JmbGxybVA5aFNPUEdjbTFnbFN0YVBQb3FCdm9sMWIwK0dH?=
 =?utf-8?B?L09ndjNSSDU0ZlhmNG9vaDFrRkR5NGh6MEZGL2pLRUZWa3VJTG0yQ1ROaU5p?=
 =?utf-8?B?OTcxck53Z0EwTGEyOXp2ZnZlWFlUeUpScHFSa3F2Y21QUTJkYTF2SjR2K1RU?=
 =?utf-8?B?Y2wzVWE0SFRGcy83dU9yc3pHcGNEUjRQOWJGdW9laEJPVVhwbC9SVm9XeC9K?=
 =?utf-8?B?RFlDYzloMnhBM05BNWk0MkM3azdzekVMMHhlOHN2cnllS044MWF1TFV4eTR5?=
 =?utf-8?B?YkJrZE9HS0NUa2h2aFdoR1NYQllwK1E1T2RyRW1WUUJOd3p6RUpHQ1lGTFVr?=
 =?utf-8?B?WDk4b2VWV3dzeUdWeDcvTXBVRDVtcEtWTWNMZnRhNDZKdUdZSm1HMmR1aUli?=
 =?utf-8?B?VVRMbldlcUFkMGYzS3hZc1pRcWNUSnlOekppTXJWSGxydktxZU5QeEx5VFQr?=
 =?utf-8?B?QUNyWVVpMXlKeHJ2cC9pYU1zYXBLZzVlcStTN2JjVGN5UHoyWHBpUjVqc1Bt?=
 =?utf-8?B?Yjk5ZnRQekYwdENJckJXL2hEWmlIYjIyTTVtUzdrU1lKMzBHcjZQU2lhSFVS?=
 =?utf-8?B?c1VIang5R3RIZXcwVno3Mzg5M1M2emFrRE84cnlHRjJROElXR21hYW1ldzV6?=
 =?utf-8?B?a0V3YlpOSzdmOUNlcmZBSVNmSjJQbjFQZmNXMlcyRUtUM0VTMThDRDFQOFZ0?=
 =?utf-8?B?QmtUQ1Bid1RPWmN0QjF4VFhFQzdZV1htTWQvTER3MnZkRUljdlhaREcwT01i?=
 =?utf-8?B?NDUxTVRTWGdRWWtHMHk2eGtYTUt4SUZKZkpnTXNrY3dCVjFVQndrRlpqbU5z?=
 =?utf-8?B?TWRiQmlJaTBJVm1qdXhNclFBbjNCbmFwRHIyYUxUc1Bxb1F3M1VjVzgwaHg0?=
 =?utf-8?B?SXJ4clhLSHZWUDFUZWZSOVpKaXBLcTdFTjJ1TjhsY2diWjhNdEhFUzFBcTdj?=
 =?utf-8?B?ZWNLclNqMkFkSFRnSUNhbHFzU0lVZzRQZm1sVUpaenBWbFE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U3E0TUxSOEwvRmJWMi9KNXRjcURxd001MUs0OVlDRkFqY2E3dHdWUnpWTnhq?=
 =?utf-8?B?UmVENUoyUGIxMFJPdzVpSUtLaUVqdjBIRHA0MUZWaW5Vc1NEUEtNQmJpVVBa?=
 =?utf-8?B?UjB0YUJuWktOZXRPdVRDNG9hYUxWNVpJdWl0eXV2dWNwMnZCM01IMTdGY29l?=
 =?utf-8?B?QmxPVFNiVlEvUHNXKzBDMlRqZW5FK0c4TWFUcnNTckdCR1VvUjNLazBJR090?=
 =?utf-8?B?dWl1U3hhL3oxZVBZUWtGVGVCRHM5Y3pKMVNQTU8zRVpFc0RVc3FOS2l4a2do?=
 =?utf-8?B?WVNWNmRoUWZZbkhLMHA5UmZlcjVlTlBkN1JqRm14Q2VwUG9PbTIvdUNkYVZl?=
 =?utf-8?B?NFBLUHBBbFI0S3I0V3huWXVVcVNETmN1dzlnSk8vdXRyRDRTSDVwN0UvZzVS?=
 =?utf-8?B?eFdyNlRsRlJ2NU1VM1VUQ1RKbG8xTE9OWXQ3NTFrZnN4WldxNDdGbVYyck9G?=
 =?utf-8?B?dmRqSWc3cWZhS3JFUm83endVZkVoeHBnbGpvZUsvODBmTEh2SmZxS0VTYkto?=
 =?utf-8?B?RUlDUlljVUZTOVFuVzE5RzZ5ZzBHL1BTR2VDU0JxQVhvY25iVTl1UnNZdFo3?=
 =?utf-8?B?NGQxYnMzWnBCUkFPUmNkMTJVRkg2YnpxTm9aUFFyZnU4ZnM0dUc4OVlNeUF5?=
 =?utf-8?B?UGR0ZGhPbWc3c1RkUUhKS21MMG1TQUE3Y3V2NEpzQW15TGtILzFUQlNnWElp?=
 =?utf-8?B?OStkYkY5SzI3czZRZ0xpME5NUmVnYkticU90K1RiblQ1YzlKL3BJMkhDY09u?=
 =?utf-8?B?YUhXd25wUTZHcmMvZGlhQlVTRVI3MmNqb2JOM2p4SmkwUjBwaEIxcTVaSGY1?=
 =?utf-8?B?T0I3bFp4UUN3ZzdadXNnOEV0azlPV1Nudjc2V0NnQmowZ1dCSkJXSkZsY3lV?=
 =?utf-8?B?bkIwUUJ6RFpPSGRJYk9JcXh6d1hidVoxMGpWdmtLZEJyclhwT0Z1WklLRDJn?=
 =?utf-8?B?R1lRZmpwRWZ6RVd6Mjh6YjcxZUJlYzNZd0NVQTk1dW9TNWJVdzFtUmQzUnhO?=
 =?utf-8?B?SnY1SXlYVUg2SDkxdnI5UjNWVGpvWWJyV0JSTEo4a2xXNHdFVGxqRllqQy9n?=
 =?utf-8?B?QzB2RU9UanBGVDA1UFI0cnVTOTVkSEwrWU45dTJVTElhRkhkeVJaUXlmeXZy?=
 =?utf-8?B?MXo2b2RNOVZ6dVM4Q2tjWDh4UjFnL0N2cC80Rmdac1RIdTB4amphYjNQVFBK?=
 =?utf-8?B?ZnBPazNMUGpPVnlWNjUrUGI1ekpNQ0Z3QTNLRVB6TnJvdGRPUXpBR0VZMVBE?=
 =?utf-8?B?U3J3a1BpOCt0RHZLMFIvNVJXeFJMb0UxbVE3OGFmZ0tGSWRNSUhmTUliK1VX?=
 =?utf-8?B?MUhLTFZNSUlUTS83Z29kVmVGSUhyNktuU0Jxc2RzMW5BcDBLanp1VG9HK1Zp?=
 =?utf-8?B?cXBmUzczWTliU3B3aCtqSDlIWHZuMmxnMm53OTNrRm02VDZFY3hmZkxVc3Y5?=
 =?utf-8?B?NWlsYzR3Q1JjVVBLaWV1Z01nR3dGUE4wbXdyeVN1MkRNdjNGVDQzNGxRWE9q?=
 =?utf-8?B?cWsyRTRRRHlSNHZaNm5nWW1PWENqT3dEQkxiTmZzYWVqcUUxbGFETUs1cFZu?=
 =?utf-8?B?YmJPNHhhSFRCbFd3NGEyTUxqMHM4QU1IU2V3ZTFVL1B5Wjk2bU12WWhHdXJW?=
 =?utf-8?B?d1ZzWjE2QkRPYlozVW9tR3NtQ3hjNXpzMXN0L0RDNFRHOTgrZERiY2grNE04?=
 =?utf-8?B?MEhDMlVVZkJyYlBhaXBCS2hwUmk4ZEZxT2pUbmxVOEVHWnROZVd2SlhvOE9U?=
 =?utf-8?B?dXBWYXFMeDBjYnBrb3NHbnR2aUJRQk5MQUk5OTNwOHV1MFBzck5tcUVmUkYv?=
 =?utf-8?B?TWpkOUFObXBSRU13THJ6TThoMXVmR3lWUEgxUUdnS2h4cVZZMTlwWEZhWWI1?=
 =?utf-8?B?Y1Z6ZVNQa3RLTDNzVXNSQ04rQzVzamNFVEJURjFJN08vK2E4YWFwanlRVnlr?=
 =?utf-8?B?NlFNRFo0YVc3ckw3c0NKRkVkRlY0Zi9OeUE2KzAzN0MxZlFQZndKVHFqTXYz?=
 =?utf-8?B?TVR2N1RFUVJ3eU9UV0N3S2RMaUozTHAveTRPWjN1dDQwdlJ2MmJEamVPdkta?=
 =?utf-8?B?MjV5QVFPYXl6L2Fidi9FaTA5RXl2a3hrUjEya3Iwd25wMWxZVlNVNU5KS1N5?=
 =?utf-8?B?eUk2MXE4S2tpSitJYjRnTnd2bjR0NkQ2clF1eDNIRGhTWm9oR1VzVXVlbDdM?=
 =?utf-8?B?UGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7513ac0a-fbc6-4dba-95cf-08de1c3c00ae
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 07:21:57.1984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MuOGDjaotomGX0mg4yDqW2ySRSc3L9okI03yoGdFlMtZ8QmDy1aClxJIiKZdzZ+UR/NN4jpQrt2eBrkBDMdqAzRyuP3SmIPdbArhwDNDUz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4760
X-Authority-Analysis: v=2.4 cv=UYJciaSN c=1 sm=1 tr=0 ts=690afb17 cx=c_pps
 a=aX6hwv3pUrsX0fnHaj1tZQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=0BqbwtPeYpmjIg4-Sc4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA1MiBTYWx0ZWRfX2ZiGr+UW9aaP
 Y+WWzujS1L5ojUJKm8K3AKvGrSYTd44acPqlOx0QfUrEJcMqe/98AdAZl27CQw3ucemfhnzXri6
 +8Jdb3NMBHUTBsha9DAny0KG8bZrn349V0mO2H2qrZdsfnlfr83XYNiKIl/5UKwaeNOtWv/Sh+X
 ZWiFpz8gAndjhtg/ep8ars1HYUeFsRtWKqhcXfeMpw7sRaqq6rE+eA+FDnCGlPOhrr6qXQtuNQa
 z2yIH0NrOXp17ux/hc24/O0iD4QOxhp2FtEpBi2hk5i6uFci4duUbAwwCzYoxbbioMIXj6MFQ7O
 kTBNxmelIKUb0H32olDQj2T4QjBiwF55JF7+u05G9BgbXzmm1qn1W4wP9IL/8v0O4ltwHahro/N
 NAdqidwal3dETZ6bst8WvdK0UFtLyA==
X-Proofpoint-GUID: XxZgFDJbrn3qW_QYxdLRrkQIyJ5yNsT1
X-Proofpoint-ORIG-GUID: XxZgFDJbrn3qW_QYxdLRrkQIyJ5yNsT1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050052
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5A55O3JH2153137
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 07:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121321

Please ignore this patch,=C2=A0 fix the issue in the patch [krikstone][PA=
TCH]=20
mbedtls: upgrade 2.28.9 -> 2.28.10.


On 2025/11/5 14:09, Yan, Haixiao (CN) via lists.openembedded.org wrote:
> From: Haixiao Yan <haixiao.yan.cn@windriver.com>
>
> The branch is changed from mbedtls-2.28 to archive/mbedtls-2.28 in
> mbedtls repo, so changes the branch name accordingly to fix the do_fetc=
h
> error.
>
> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> ---
>   meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.=
9.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb
> index d935cb233122..f5c2cf979a07 100644
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb
> @@ -24,7 +24,7 @@ SECTION =3D "libs"
>  =20
>   S =3D "${WORKDIR}/git"
>   SRCREV =3D "5e146adef63b326b04282252639bebc2730939c6"
> -SRC_URI =3D "git://github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps;br=
anch=3Dmbedtls-2.28"
> +SRC_URI =3D "git://github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps;br=
anch=3Darchive/mbedtls-2.28"
>  =20
>   inherit cmake update-alternatives
>  =20
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121319): https://lists.openembedded.org/g/openembed=
ded-devel/message/121319
> Mute This Topic: https://lists.openembedded.org/mt/116130971/8599992
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[Haixiao.Yan.CN@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

