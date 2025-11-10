Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FEBCCCF9E3
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 08:09:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43710.1762762131987248332
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 00:08:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=ftPGUMJJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=340974e612=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA4oY3U2885602
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 08:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=8TbKLeO1EuqiK545gxFNvf
	bNFMJN+6eGYQdtgpHTSWM=; b=ftPGUMJJV2LBA6kKLkhg2Ri0HAoGFFVrgd1pVC
	S3UYutNQ5pCDLQonNvsTt70h041CZ08iF8WgHT0/RYbL3ky/0cegHJe5FNgjxH/2
	auRTb9O9oN/1++GAtaclBZ9PpjIuUXABRwD4Z13fz2615k4KXNrgGYGe7pAv77dC
	cGSRFI32xj7nzI16T6nzw+zotZ2uFkwceR+5F2jVmF42ffvZPWYW61D4tddAn3xT
	GyIIqAE6SDyXfpdrWs6bAtFy5e7/5Kpd4hlnJcjKo0L88sU7mwpPFa9ccxzE1hdi
	R4QvADplMoiuUKEgNDYvw2fx7u2jQraIIyHGk0Itu7x9KsGA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011044.outbound.protection.outlook.com [40.107.208.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9u2x1pq3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 08:08:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhR8qFvYlVYBbov9Hq7MplHJFiIuBdGiIHKrb/mKdAF6QGzq6SgAdjo0f5iQ+/9+Nc8+sino/8DHx++M9ofKyssw4qv6qoS6Sv3SzzgVUIi8xyjFpDJeQ22G9HeXQI0ijiF7/szENJXYci45bmc4fZl354jVEDDP2HVCNVa57+7XcX8EK0ZPmETrasFMu1H9qv3glA4ywrjfRio1AvNo11PfE+IQpmHI6lncfNoEijD8+hRE6FezNLRaKAEmna4TbXSWrehmAVRX+zZiCCBhhhMnNr1qf1T00C6e/2KzdEsB3VarT4+jZqW04FIcgkrpXCtMA0QPhgSrzsO+3NZcJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TbKLeO1EuqiK545gxFNvfbNFMJN+6eGYQdtgpHTSWM=;
 b=WaEWVIAkKVvOx2aBS+yFt3C51DWpIRBiUcE2ub8iK1Wy5nr4u2t6rtAoruzzmq3qIuo1wYUG3c8+6fPacQ/h0C3cUNVxfqzNu1AMdc7rB7Ra3iJd5RaDBz6h39xLv45eb+YUMZOwMHqQa/UjU7BRTI9HakKFi83ooH9cAmlGZoMVH5sOZonmWwzXd+N8LRpFc4/kgWs3hI3DLEMEV1NnW9+GDVSzPWk7v+Eeu52dZae1wbdv8EWoVyQSipVheAoQhY5A9so1WJW94b77fTbXqNY2BH5RCSr9U1IgjeSP2kY9AMI51E1LkLghcNotXTepT1MTCViAVd8mMnJk+SeFjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW4PR11MB5912.namprd11.prod.outlook.com (2603:10b6:303:18a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 08:08:47 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 08:08:46 +0000
Content-Type: multipart/alternative;
 boundary="------------drMNcKwDJn41XTPL1BkJ7x8Z"
Message-ID: <26b4e765-9fd2-47d6-8ee1-639c253c0df6@windriver.com>
Date: Mon, 10 Nov 2025 16:08:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-xfce][PATCH] menulibre: add UPSTREAM_CHECK_URI
To: Yoann Congal <yoann.congal@smile.fr>, yi.zhao@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
References: <20251108141838.259595-1-yi.zhao@windriver.com>
 <CAMSfU+7HK8QKBFjpCRt1J2aNLWjPN0Xzc_ObzY7Nqx4KWo0=Zg@mail.gmail.com>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <CAMSfU+7HK8QKBFjpCRt1J2aNLWjPN0Xzc_ObzY7Nqx4KWo0=Zg@mail.gmail.com>
X-ClientProxiedBy: TYCP301CA0045.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::18) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW4PR11MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fde7607-31a4-4677-54dd-08de20305f54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R1NKbU4xY01HakVqYXFLb0RxWjN0VkI0dGh5dm9RcFBISWtMMVJnelBiaE5o?=
 =?utf-8?B?Y2hlVXJwWUZWNFZlVXpSdEl0TmZhbUczZGUyNjdnTHJSVERvUFowTEE4UERM?=
 =?utf-8?B?WjBxMC80WUJqeDFqRzFNRW1hSW5CbGxyOWVYSS92Q0pQWDVDNjEvaUZURlZz?=
 =?utf-8?B?VkF6ZVB3bHQ5dmRsaHhjZWhMVjJMRFdhTElBVG5LUXpuN2ljV2ZWOS9Dc0tz?=
 =?utf-8?B?QkdZN3VOeUp0Z2JFYkhWV29HSy9MUC8yNld6YmdrbDZPbG82ZU1Pem9SUHN1?=
 =?utf-8?B?WGdNUlh3YmlLMFd1T3dHQTg2aUdkTldwOSt0T3dmZms4cnQxL3NWTktnTE5K?=
 =?utf-8?B?cXhveTJCNVhsNmhHcmIzc1h4NkJVODVTcmN4MzJvZGQ0ZEJiRlRVWlhteUNm?=
 =?utf-8?B?MlZJdUlUU2RUbGgrK1RhdEQyVWt5VE9SU0JhWWNDWHA1V1NqOXpJWUpHd242?=
 =?utf-8?B?VzRLWS92cGNDR3M2b2ZTOGFoczNVT0Rhanc4ekJ4WkRpNjdTU3V1NWJtdnZr?=
 =?utf-8?B?d2wrMWcvWDU3anlDVGxveDdJdUNEdk9qeWoySk5ZNERmL3hrakljUmd4aDM2?=
 =?utf-8?B?d08wdkNmR3JoVklVYnRURVNkNmYxQVFzTGNnSDlrYXl2TDBWZ0pwZGN2cUdM?=
 =?utf-8?B?eDlFS1lwako2V25pSlcwbnovM0doVGlYUU0xcVcyR0hxQ2czUUQ5L3VNYzVQ?=
 =?utf-8?B?T0prdjZ4S2dTb08wWmFBa3RvT0E0Nk9HZ1AySE1NVFRyVTBFUFJhczBzMTZW?=
 =?utf-8?B?aU9RUllodzFyeldGTnpPcHR3ekJWb1AyOGkvdFN5MVBHQWJmSHJrUi9Jclpx?=
 =?utf-8?B?OGZoZm13N3NMQ2NKL3FXL0pEWmVYTzYyZ0poMzZxQlVIKzF3ak1mOTJJVUNy?=
 =?utf-8?B?a2x6MW9ZSWVUQjJ5M3ZRanNza0FXL1gxNm54YlNybC9zMEhLR0JIVk1mVzJq?=
 =?utf-8?B?dFJ4TEcwNEVUZkZsNmtuYndVc290aG5nb2JhZzZuZkpaTlBXdUZNM3FlMW9r?=
 =?utf-8?B?M050YkF4QUxIY3JLZzFuUzVWdHJSOTU5TnlSeDM2RWZHeFpRWnNPeC9yUzBF?=
 =?utf-8?B?S1NOdEJmMzVrdWNwM0VHYVhBWWVlM2VHYWV5UXFjY2RqL2JxS3Q1d2Q0T2pD?=
 =?utf-8?B?YXlERjB0MUJNRkVkN2xpWko3RGdDTk4ySmVVbnRWWDdFTFJCQVNJa1l3MTlG?=
 =?utf-8?B?d3BmRU1XMG5BaE1nK0cxT2UxVHJpTzVra1IwdU9wcDU3UHRIeWNWbk9hNTlh?=
 =?utf-8?B?NThHdm1icE96UXhKWm53NXFwMWxJZDRqdHloVDgwbSt1MU0rRzFKVXpmL1hG?=
 =?utf-8?B?TW1uQmlvanRBWUhQcUVGemtObzFGYjVUNWF5VStHMkk5N3NEQWJrUFA2cFV6?=
 =?utf-8?B?dVpDTzd2MWxjWnRaWXRZam1JSjlHb2tlQmtPWkgyckxGL21lWkFJT2FUVFJ0?=
 =?utf-8?B?WWdUbDMzaHh3K1dRUElBUVhmSFpmQ1M2WUl6MElQbm9qazBXNEdYRVdkVlNU?=
 =?utf-8?B?ci9FamdOeGxMRDFMRTJYdGVDUU1ud0FMbjJKbUVSSjlEdkpyQmNMdy96OFZz?=
 =?utf-8?B?YnovNVdBRTQ2S1hzNTV4ME0rWVJreFpsNURFaGVldGJiWEFHN2Y3RFIxWTl1?=
 =?utf-8?B?d1JmTWJSVlB6N3Y3eFY0TVEwOUlmMVBHN0E4ai9tTDhNQzdrOGQxWWkxZCt1?=
 =?utf-8?B?MVc0SWxaK013UURhWXZoL0JYeDBRRjZlSnFQcDZLeW5MM3pSMitCanp6T05m?=
 =?utf-8?B?UUkybVh2NjZaTU92VG8rQlU5V0Y5R1h1SkwyUHNoQ3JFcXFiR0M5OGoyZ0Fz?=
 =?utf-8?B?WHZobXBQNVhPVGdnVVIyL1pJZEJKRkM5dC9VbVU0VGhPVnVjUlNvVlNvbEg5?=
 =?utf-8?B?blAxQ1pScDB2V3o5KzRkRyt4QVRiSXUxak1wbTFiMnlmc2c9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dDRRSE9OVDZHcVhnYVBDci9GT3Q0TkRCdWZaQzJVYjZhbzlZS2kvOG9PSStr?=
 =?utf-8?B?MHptZFA4RlQxSmJtcVpjMmlJcWd1UFJ0V01XYXBPclY1V1lybnplUFZBeURK?=
 =?utf-8?B?Q293OU1ZdWZiM042MlltNGxBaHUxa25FRlkxaTZZa2JNTVRHMUlCVXdHK2tZ?=
 =?utf-8?B?WlA3VWxOdVZPVk1IcDhvbzd1Mm9VTmFzNGJ3QlFxU2wydXhhZHU0Ykt6Qmhs?=
 =?utf-8?B?SUNYTWE0dEVJOEZWRVEwZFlCS1ZtQVNpYnNrdE1GZ05PejhicXlpNCs2Skpp?=
 =?utf-8?B?VGV4RDBGZzdMZVIwVXZ5N1pCekVYbE5HazNZZTloRXZINFh6c1dSMjVIU01C?=
 =?utf-8?B?SnlvTnJ6bjVkcFUwL1RyZGY0OEV1Ni9nL2pTV08ycCtGQmQxdUtNbTAvTlRx?=
 =?utf-8?B?bVJ2R3FySTVlTVhYaWhrZXo2cjNwSWQrY29aL3pDV1JWV1dsYjJISVU3MUYx?=
 =?utf-8?B?QURWOFNoN2sreHdJY29nMjJCQkVDamFzd1NyY2lqZW0zWkQrTWpHY0lsMExO?=
 =?utf-8?B?N3E0aEd6YUZDT3FPSzcwOEpJQmVqUFh1ZmxzWkc2TzlqeDl3Q0hlcVhCSkxq?=
 =?utf-8?B?NEZmbERteVpwd0NXYXlETDdtOTNUQ2tySU1TRWpFNWFnVUhOWDVEL29od0RH?=
 =?utf-8?B?WWNnQXVJdkQ0enFsQUxxcGdRbkVkQmJmRkNVcUlIcHU2Zzg1bWQweHZYeUNq?=
 =?utf-8?B?S29oVnZCOXl6Y2QyZ3VRaGVRcHM5TUtSZ1FrbnRxUnZLaGlMcjVpdFJTTGJL?=
 =?utf-8?B?OEZFOEdNOUtMUHZYUTM2U0hhNUJiQ1ZqY21aY01RYXRpbFNDTTAzZW1MSVo1?=
 =?utf-8?B?Mm9yZVFLbHpqTlY5M05DYnJkaHlOMjV6VXlsTCtKTEExMXhLUXZBZ3ZYRW9i?=
 =?utf-8?B?MjQrN21HZmQrRmlYZUIyRzdRZEU3cDA3aW8yZ0h3TWR6SU5ielgxRW5vdTZa?=
 =?utf-8?B?RkNiME0yRGhBbm5Ram5IY0JyZ3djNVUwaDBPYUZxL1dVZTZ2TnBDcUFGWXZl?=
 =?utf-8?B?ODVSTFpzVWxPT2xKL2ZlUnpKMG9iRmgva0hXV1lxak9qbVVYSjhhZ1BWSkRw?=
 =?utf-8?B?QWEwQnZXUmdKNUlZQXl5N2U5a1FlVElDMmt2RXFJbHcrWEljK0xlaFV6Rkhx?=
 =?utf-8?B?cmpYQ0EzRmExMGJTbW1KNW8wOVdsN2h6N2hIcVpnbitENE9PRERLK3g5alJk?=
 =?utf-8?B?ZXZQVzZKUW9Fam9EVVZyRWExa1prQUloVENNeXI2eGlUa3l3QzV4Z1FoTk10?=
 =?utf-8?B?R1hZbS9DdE9kQWJWeTVqbzdoQURYUDJEaDB4SnI0U1UxcnpJM1BoZDBaYVUy?=
 =?utf-8?B?SGMvanFNdWNoZkxianNlVVZEcjdoeDcyTmV0bUx1NUZ2VkZ4ZHJBSklMcEx4?=
 =?utf-8?B?Y1RqNklTME5yY090SFREc1YrdmwrUldTZmFNaUJGZWIrWUV5YlNHRDRMekds?=
 =?utf-8?B?SHZxaTdVREhjczRLR3JzSWc2QW5zRjZaKzcxaGNhSTR0L21Yeis1b3ZXZEJw?=
 =?utf-8?B?UUtZOFF6eTcrdUNlVE1OYW54TXZKM01HeldaaGlUQyt0ZjdVVzR6SnJGditk?=
 =?utf-8?B?aEFZaEFJRG02djZkazJEUXpqeTQ5MVpFbkl1WittVlE2VjdFSWF0YjFmSjdt?=
 =?utf-8?B?TkozbTN4Wk0xY1VmZ25scHZjbGtCNFVKZDlrcHhFNmxMM1E5Y2FqK1JmNndm?=
 =?utf-8?B?dDYvN2hnaFExSzVkNmZ3Zjkyd3dIOU9JeUNGalNuZnNnZ3IyN0NjN1FqbS9M?=
 =?utf-8?B?V0ROSy9pZG9QMHpVZ0dOQnlmVFZUMk5VeXhoQTdoZ1h4V3cyOHBoUUErQ09n?=
 =?utf-8?B?MlFXTXMxRkhuUnZMUzVLWjgzL0VSdXRCcjA3Qkw0b0RpcWhvVnduVWZTMUhr?=
 =?utf-8?B?cGpyYitObngwVUE0VW1yZUJCY0tab3p3bDcxaENDTHFtMmNCdE1OUWUxcE9K?=
 =?utf-8?B?M0xYbHFRNkl6eVZYalh6bnJvS1p0b1ZYUi80bElNcVl2azFRQ0RLaU1OTnpp?=
 =?utf-8?B?WUNJK0tYTGF5UVArL3B3TUovdS8wSE1aOUlSakV4c0NnZDlBcTNwYys4TTg5?=
 =?utf-8?B?dEZqcU9qeGRNRURjVFVSYXVLN1ZtcjN1RE16UlF1VEV2ZWtEWlNZYm1ZZjcy?=
 =?utf-8?Q?j4c1ddUt8X8N/rLbImZbImCdJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fde7607-31a4-4677-54dd-08de20305f54
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 08:08:46.4914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9lhEJyYFa5LDKijTzYVrWP33dXZ6KvBO+avn82cP4iAfLRmiT/nJwnQe/v9mfUiOytTCPOfndjbN5XTWycjP3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5912
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA3MSBTYWx0ZWRfX13/om3nk606f
 m4QYNIlZlIJHHFTzTP0/7CJDgcjrUdmWDuoOlR7mBw/2m5GrIwtWgAy5AaOR4RoO4jlsXSV3hC6
 9HXhOg38HwxTwy9IhGEgDHwGcxblodBcnTGnSFFtKFWV7IgQCii7A3P83DeVzJSHE7q93s31lKx
 S0brG5ThAQpdfbaDID1kWUZEmGzZzc+5EEMjjk0oPDA8QDD5p9Cb8eppy2gnu1h8+CdC4KwbqI2
 6q9evFXxW+URnP+YmgUjnj9jhZxZd6WU0ReCX98c9pg8i0MM68wNveTq4E79xze/YLOpt5HqWL3
 rkzq0877Vlyv4Ubv7VyPqNyUdt57lfN6u56apl0mk07pcWVaqAud7GAL94D5OvCVWC/yJTMkC8n
 wGdEE6N7JiSgc1aE7b0pYDIALb4OYg==
X-Proofpoint-GUID: PZW7MJYykbbFz3LqJpElzHTSgg7SdY4r
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=69119d92 cx=c_pps
 a=cEhcA1GRg4KA0mca7hj4fQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=0zhiEtMHAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=_JqIscp19tioEmraxXwA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=PFHkVJ5q8pE_tLx7cu0A:9
 a=gswCoK6b3xNclQNz:21 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=v7CeC1Rd8Ef7gCqLsajQ:22 a=FdTzh2GWekK77mhwV6Dw:22 a=XEML4NSlLLheEyuNP6hX:22
X-Proofpoint-ORIG-GUID: y0XfeQdtAq8WSWWaLPTv5kDOHyN4lBq0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 08:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121450

--------------drMNcKwDJn41XTPL1BkJ7x8Z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5AA4oY3U2885602


On 11/10/25 15:55, Yoann Congal wrote:
>
>
> Le=C2=A0sam. 8 nov. 2025 =C3=A0=C2=A015:18, Yi Zhao via lists.openembed=
ded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA1=
5JdzRmFLAvPgmRlNwcN40j7$>=20
> <yi.zhao=3Deng.windriver.com@lists.openembedded.org> a =C3=A9crit=C2=A0=
:
>
>     Add UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX to check the correc=
t
>     latest stable verison.
>
>     Before the patch:
>     $ devtool latest-version menulibre
>     INFO: Current version: 2.4.0
>     INFO: Latest version:
>
>     After the patch:
>     $ devtool latest-version menulibre
>     INFO: Current version: 2.4.0
>     INFO: Latest version: 2.4.0
>
>     Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>     ---
>     =C2=A0meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
>     <https://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8=
EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA1=
5JdzRmFLAvPgmRlN81Wey67$>
>     | 3 +++
>     =C2=A01 file changed, 3 insertions(+)
>
>     diff --git a/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
>     <https://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8=
EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA1=
5JdzRmFLAvPgmRlN81Wey67$>
>     b/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
>     <https://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8=
EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA1=
5JdzRmFLAvPgmRlN81Wey67$>
>     index 71d3ab4d29..4c52249fed 100644
>     --- a/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
>     <https://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8=
EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA1=
5JdzRmFLAvPgmRlN81Wey67$>
>     +++ b/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
>     <https://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8=
EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA1=
5JdzRmFLAvPgmRlN81Wey67$>
>     @@ -15,6 +15,9 @@ REQUIRED_DISTRO_FEATURES =3D "x11
>     gobject-introspection-data"
>     =C2=A0SRC_URI =3D
>     "https://github.com/bluesabre/${BPN}/releases/download/${BP}/${BP}.=
tar.gz
>     <https://urldefense.com/v3/__https://github.com/bluesabre/$*7BBPN*7=
D/releases/download/$*7BBP*7D/$*7BBP*7D.tar.gz__;JSUlJSUl!!AjveYdw8EvQ!bK=
Y-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRm=
FLAvPgmRlN4rVMobI$>"
>     =C2=A0SRC_URI[sha256sum] =3D
>     "d906acf9cc13b0e15b8e342ae9aab8b0680db336a382d0c42f5d5f465f593c9f"
>
>     +UPSTREAM_CHECK_URI =3D
>     "https://github.com/bluesabre/menulibre/releases
>     <https://urldefense.com/v3/__https://github.com/bluesabre/menulibre=
/releases__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1=
RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN2yK_rrE$>"
>     +UPSTREAM_CHECK_REGEX =3D "releases/tag/menulibre-(?P<pver>\d+(\.\d=
+)+)"
>
>
> Have you thought about using the=C2=A0github-releases class?
> https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe=
/github-releases.bbclass=20
> <https://urldefense.com/v3/__https://git.openembedded.org/openembedded-=
core/tree/meta/classes-recipe/github-releases.bbclass__;!!AjveYdw8EvQ!bKY=
-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmF=
LAvPgmRlN7VVUaMq$>

It doesn't work because the website address doesn't conform to the=20
format in github-releases.bbclass:

--2025-11-10 16:04:14-- https://github.com/menulibre/menulibre/releases/
Resolving github.com (github.com)... 20.205.243.166
Connecting to github.com (github.com)|20.205.243.166|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2025-11-10 16:04:14 ERROR 404: Not Found.

INFO: Current version: 2.4.0
INFO: Latest version:


There is no https://github.com/menulibre/menulibre/releases/ , but=20
https://github.com/bluesabre/menulibre/releases


//Yi

>     +
>     =C2=A0do_compile[noexec] =3D "1"
>
>     =C2=A0do_install:append() {
>     --=20
>     2.34.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#121387):
>     https://lists.openembedded.org/g/openembedded-devel/message/121387
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/message/121387__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W=
58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN8KIZAVT$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/116187911/4316185
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1161=
87911/4316185__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqb=
rXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN6CRz5Io$>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/unsub__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTz=
wRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN-vzl8RS$>
>     [yoann.congal@smile.fr]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
> --=20
> Yoann Congal
> Smile ECS
--------------drMNcKwDJn41XTPL1BkJ7x8Z
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5AA4oY3U2885602

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 11/10/25 15:55, Yoann Congal wrote:=
<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMSfU+7HK8QKBFjpCRt1J2aNLWjPN0=
Xzc_ObzY7Nqx4KWo0=3DZg@mail.gmail.com">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        <br>
        <div class=3D"gmail_quote gmail_quote_container">
          <div dir=3D"ltr" class=3D"gmail_attr">Le&nbsp;sam. 8 nov. 2025 =
=C3=A0&nbsp;15:18,
            Yi Zhao via <a href=3D"https://urldefense.com/v3/__http://lis=
ts.openembedded.org__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTz=
wRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlNwcN40j7$" moz-do-not-send=
=3D"true">lists.openembedded.org</a>
            &lt;yi.zhao=3D<a href=3D"mailto:eng.windriver.com@lists.opene=
mbedded.org" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">eng=
.windriver.com@lists.openembedded.org</a>&gt;
            a =C3=A9crit&nbsp;:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add
            UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX to check the
            correct<br>
            latest stable verison.<br>
            <br>
            Before the patch:<br>
            $ devtool latest-version menulibre<br>
            INFO: Current version: 2.4.0<br>
            INFO: Latest version:<br>
            <br>
            After the patch:<br>
            $ devtool latest-version menulibre<br>
            INFO: Current version: 2.4.0<br>
            INFO: Latest version: 2.4.0<br>
            <br>
            Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windrive=
r.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-f=
reetext">yi.zhao@windriver.com</a>&gt;<br>
            ---<br>
            &nbsp;meta-xfce/recipes-apps/menulibre/<a href=3D"https://url=
defense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rIn=
c8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN81=
Wey67$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">men=
ulibre_2.4.0.bb</a>
            | 3 +++<br>
            &nbsp;1 file changed, 3 insertions(+)<br>
            <br>
            diff --git a/meta-xfce/recipes-apps/menulibre/<a href=3D"http=
s://urldefense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!bKY-Z8h=
DPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvP=
gmRlN81Wey67$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tr=
ue">menulibre_2.4.0.bb</a>
            b/meta-xfce/recipes-apps/menulibre/<a href=3D"https://urldefe=
nse.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8Ga=
ffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN81Wey6=
7$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">menulib=
re_2.4.0.bb</a><br>
            index 71d3ab4d29..4c52249fed 100644<br>
            --- a/meta-xfce/recipes-apps/menulibre/<a href=3D"https://url=
defense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rIn=
c8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN81=
Wey67$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">men=
ulibre_2.4.0.bb</a><br>
            +++ b/meta-xfce/recipes-apps/menulibre/<a href=3D"https://url=
defense.com/v3/__http://menulibre_2.4.0.bb__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rIn=
c8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN81=
Wey67$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">men=
ulibre_2.4.0.bb</a><br>
            @@ -15,6 +15,9 @@ REQUIRED_DISTRO_FEATURES =3D &quot;x11
            gobject-introspection-data&quot;<br>
            &nbsp;SRC_URI =3D &quot;<a href=3D"https://urldefense.com/v3/=
__https://github.com/bluesabre/$*7BBPN*7D/releases/download/$*7BBP*7D/$*7=
BBP*7D.tar.gz__;JSUlJSUl!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPu=
TzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN4rVMobI$" rel=3D"norefe=
rrer" target=3D"_blank" moz-do-not-send=3D"true">https://github.com/blues=
abre/${BPN}/releases/download/${BP}/${BP}.tar.gz</a>&quot;<br>
            &nbsp;SRC_URI[sha256sum] =3D
            &quot;d906acf9cc13b0e15b8e342ae9aab8b0680db336a382d0c42f5d5f4=
65f593c9f&quot;<br>
            <br>
            +UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://urldefense.c=
om/v3/__https://github.com/bluesabre/menulibre/releases__;!!AjveYdw8EvQ!b=
KY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzR=
mFLAvPgmRlN2yK_rrE$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=
=3D"true">https://github.com/bluesabre/menulibre/releases</a>&quot;<br>
            +UPSTREAM_CHECK_REGEX =3D
            &quot;releases/tag/menulibre-(?P&lt;pver&gt;\d+(\.\d+)+)&quot=
;<br>
          </blockquote>
          <div><br>
          </div>
          <div>Have you thought about using the&nbsp;github-releases clas=
s?</div>
          <div><a href=3D"https://urldefense.com/v3/__https://git.openemb=
edded.org/openembedded-core/tree/meta/classes-recipe/github-releases.bbcl=
ass__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM=
7ujmUTbNXw-L7ZA15JdzRmFLAvPgmRlN7VVUaMq$" moz-do-not-send=3D"true">https:=
//git.openembedded.org/openembedded-core/tree/meta/classes-recipe/github-=
releases.bbclass</a></div>
        </div>
      </div>
    </blockquote>
    <p><span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><sp=
an class=3D"ryNqvb">It doesn't work because the website address
            doesn't conform to the format in github-releases.bbclass:</sp=
an></span></span></p>
    <p>--2025-11-10 16:04:14--&nbsp;
      <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/menul=
ibre/menulibre/releases/">https://github.com/menulibre/menulibre/releases=
/</a><br>
      Resolving github.com (github.com)... 20.205.243.166<br>
      Connecting to github.com (github.com)|20.205.243.166|:443...
      connected.<br>
      HTTP request sent, awaiting response... 404 Not Found<br>
      2025-11-10 16:04:14 ERROR 404: Not Found.<br>
      <br>
      INFO: Current version: 2.4.0<br>
      INFO: Latest version:&nbsp;</p>
    <p><br>
    </p>
    <p>There is no&nbsp;<a class=3D"moz-txt-link-freetext" href=3D"https:=
//github.com/menulibre/menulibre/releases/">https://github.com/menulibre/=
menulibre/releases/</a> ,
      but <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/b=
luesabre/menulibre/releases">https://github.com/bluesabre/menulibre/relea=
ses</a></p>
    <p><br>
    </p>
    <p>//Yi</p>
    <blockquote type=3D"cite" cite=3D"mid:CAMSfU+7HK8QKBFjpCRt1J2aNLWjPN0=
Xzc_ObzY7Nqx4KWo0=3DZg@mail.gmail.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote gmail_quote_container">
          <div>&nbsp;</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            +<br>
            &nbsp;do_compile[noexec] =3D &quot;1&quot;<br>
            <br>
            &nbsp;do_install:append() {<br>
            -- <br>
            2.34.1<br>
            <br>
            <br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#121387): <a href=3D"https://urldefense.co=
m/v3/__https://lists.openembedded.org/g/openembedded-devel/message/121387=
__;!!AjveYdw8EvQ!bKY-Z8hDPZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7uj=
mUTbNXw-L7ZA15JdzRmFLAvPgmRlN8KIZAVT$" rel=3D"noreferrer" target=3D"_blan=
k" moz-do-not-send=3D"true">https://lists.openembedded.org/g/openembedded=
-devel/message/121387</a><br>
            Mute This Topic: <a href=3D"https://urldefense.com/v3/__https=
://lists.openembedded.org/mt/116187911/4316185__;!!AjveYdw8EvQ!bKY-Z8hDPZ=
1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPgmR=
lN6CRz5Io$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>https://lists.openembedded.org/mt/116187911/4316185</a><br>
            Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lis=
ts.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">openembed=
ded-devel+owner@lists.openembedded.org</a><br>
            Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://l=
ists.openembedded.org/g/openembedded-devel/unsub__;!!AjveYdw8EvQ!bKY-Z8hD=
PZ1rInc8GaffPbWE8O3W58q7MPuTzwRhNqbrXy1RUExnM7ujmUTbNXw-L7ZA15JdzRmFLAvPg=
mRlN-vzl8RS$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e">https://lists.openembedded.org/g/openembedded-devel/unsub</a>
            [<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_blank" m=
oz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">yoann.congal@smil=
e.fr</a>]<br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            <br>
          </blockquote>
        </div>
        <div><br clear=3D"all">
        </div>
        <br>
        <span class=3D"gmail_signature_prefix">-- </span><br>
        <div dir=3D"ltr" class=3D"gmail_signature">
          <div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</=
font>
            <div><font face=3D"Raleway, regular">Smile ECS</font></div>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------drMNcKwDJn41XTPL1BkJ7x8Z--

