Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 309BEC83F07
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 02:35:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.50613.1751855710466030978
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Jul 2025 19:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9283af41ed=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5672ABcO004341
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Jul 2025 02:35:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47pu19h6r2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 02:35:08 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5672XHNB007063
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Jul 2025 02:35:07 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2049.outbound.protection.outlook.com [40.107.95.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47pu19h6r0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 02:35:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ExjmpQH7awDOasSpPmPSDP2MJaELjzmTQl83lFDmtLcLs5O0QwnvCTWyBCprsM3rTFsk0gpJrXuXSHudGjtKDM/XVGX7pqGH+CejNjgV07etqqGmr1AAy1OoKC6//MR333HiHXanXL/Hy9JswQEtbVfbTyJC0g8+4GysHyOr7aTj5Npm1HkGwW88Tc/PPtfePrTCfNkLFePYWgf2Cbw/Bkzl2dTdKDXnXOSS6llvoU6r1p0OUoW6LwTCp2SB5ZwXNeYVMQDjsmmNu69Rw/33EKr58Jo0KtagEwveuLenlnOjoXLs8xyCAG9s+BVHTIC80byVU2BHpDdnGTmj7MRJHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TljjpFZC0z7/4lQG0puB41sx5xJ22doF+fMlD+IGoD0=;
 b=vg3YkSUKmYNzm+yzl4AjyauEmEDkdEoBS62/lQvdvSK4+3psQmO/kQMtJhYMLJf8mROj+ojXzq6de4SjEzX7DMJ1KuGO8NQgc42IJP+dlohJzDWzsWXmrHSGpzkQLjnQv8mtMA8Nzd+sv7sOSkNYwJqm2JDsHDXtV9NEKRpBTl5N6ku8vHPoZWptTRMJBNpU+DzMAWeZnwQ/gg4dLswFxSVTbSNwJWvnLQ851GPdZuKhNJBO9qH7IotL3IQlXcbXpBcHyqYn05AQXz51ynTneVkwonSljX1eRR8Z3pcV0MSbLvaCB/Uf3olX8yKMd2V4cmuJAE7CN+OSHc5Fc/K52Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH0PR11MB7660.namprd11.prod.outlook.com (2603:10b6:510:26f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Mon, 7 Jul
 2025 02:35:03 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%6]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 02:35:03 +0000
Content-Type: multipart/alternative;
 boundary="------------L3hu49h3FU4jf4owTZK5rYQg"
Message-ID: <3fa49252-3348-41b1-91cf-e52784046c55@windriver.com>
Date: Mon, 7 Jul 2025 10:35:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [scarthgap][meta-webserver][PATCH] phpmyadmin: upgrade 5.2.1
 -> 5.2.2
To: openembedded-devel@lists.openembedded.org,
        akuster808 <akuster808@gmail.com>
References: <184790D8263E94F1.17668@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <184790D8263E94F1.17668@lists.openembedded.org>
X-ClientProxiedBy: SI2PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:195::9) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH0PR11MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: 3798b173-88a8-40e2-fa2f-08ddbcfee07a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|4022899009|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TzVXenB5THZhd1NPQVlUZTJLWGNzZ2hsMUt5VHdIdUxiUmFXdU9keE1FdTMv?=
 =?utf-8?B?eGpxS1hsMU1LV0h1R2hpdDNSeVFsb0lQUWNiTWlyNUNSYnN5RDhuUzQ3ZjlR?=
 =?utf-8?B?ZnpoMUVBNVBham9aUDhDNGRHYlpNR2QxcmxZK3BObVBjRlFhaXBiNVc4K2ZV?=
 =?utf-8?B?REFEWlErMjAyNHZjaCtCdkpTcWhtenJoWWFJTlFLSHlRb1A3OFFFNFRKcjRt?=
 =?utf-8?B?NVNUclVSWC9EMmxncG1NMWpHNEV5aGtHbkd2ZWprcHNSR3JnOWNpNUFKYzNU?=
 =?utf-8?B?aW1ZT1FXVTM5bGhEaEdFYm94eEkzQVNUWFRnVEZUYTlSM1FiQlRlZm80RjE2?=
 =?utf-8?B?TFpBVzZqZWpZSytqdHBXZGw0SmlGZnphbG5WYTM4S1lDcnJORDVvc2Y2QURn?=
 =?utf-8?B?M2c4MFc5S3RoMnJ5UDl4TzFYdTVST0Mzc1g0bzhQQzlhNUxyWi9oaVB3cjkx?=
 =?utf-8?B?ZW9aOTltSkRpRm5KalE0cTUxQlhRZnlNV1p3YUI4clVWaGdDb2UzeEJlV2Vy?=
 =?utf-8?B?anF2ZllUNUlNTkZab1NNbGlXOUE4ZW5Ta1E2VFMvUU9xM3hSTWsxNDkvK1F3?=
 =?utf-8?B?YmVOdmtaRlRQZGp6NE4xRlNhV3ExdDFraHVhdk43d1JlTGVnOHBhY2l4OENM?=
 =?utf-8?B?anQrT0RtQkJhU1c2bGxxeWVSbVhYaWVPU25uaUIwNFBsTGhBWGVlVjI3d1RR?=
 =?utf-8?B?a0NGVUVGRytxWlo4YnlGQVdodXFxNTlSQkpST0tBRXU5L0h5ZW0zaUdJRnZF?=
 =?utf-8?B?RzRoQXRRaklhNU5OQy9naWNOMUJxSlJ5M1JXYzBETFkzckV2dVZrZndkSmgz?=
 =?utf-8?B?K0lQK1ZrcDlBc25XbG80cVhtVmJMVGxJN2dSc0R5amxiWEk3OC8raGYza1F6?=
 =?utf-8?B?dGxhQ1ZzVThWMFRCRVhDV0pMalJDTHdyejJqNkk3ckNPbE5RNDVoM2VqT0ly?=
 =?utf-8?B?dkp5TTdNaWc3YldxSUF1TDZRWmRQUzZ1d3VPd2NEUy9raHZuMzZCSUtjdy80?=
 =?utf-8?B?R3hDakVHMkhhMU5OSzNEVnc0eHJCb3NXaHdqaGpRT2RqWGNFWTJRK1FPY0U0?=
 =?utf-8?B?T3VXQmM2dnJ5V1lpemVlM0JFRUlWMVhGcFJNdDROREQ4aFBTeHR5YkJwZWR0?=
 =?utf-8?B?NXV5KzVyZlFrVEJBVGdxUzM2cTBlTlZkTUVrdTBSOUI4bEVkNVBzeU53WE4y?=
 =?utf-8?B?ZzdjVWNWUnJMZWo0RTFOZUdXbWdDdlIxL0xJaTJmTlpCSkJwWVZRa2JjTEVa?=
 =?utf-8?B?bnp3a2NaeVlkNmtkU3lEdWRWR3ZrZjFxQ3F4ZzNBN2tWa2RIUUlhbDNUNngw?=
 =?utf-8?B?MDNnUTcvVGwrM3RMSUdWRjhFQmFaL2ZseEY4c2tERStNeW9ONGY5QXlvRytu?=
 =?utf-8?B?ZTFQc0syRXdpa0lHNHdkWjJHejB5cEJhRUd2eEZlaERmakREdklhby81NHhh?=
 =?utf-8?B?cXE4KzdiSFhTMjdCMzl0cy9zbDUwTlRVL2orL09iQ0NYdU1KYUx4SEphL2hP?=
 =?utf-8?B?NEUvR2pWdzVNSHpxWUN2U0dUNUYxQUFRRXFydFVGdUVHLytNTksrM1FBTXdm?=
 =?utf-8?B?aitYZnBJeEYzSytmRU1GUE1CQlRZUWtGdGJndjBFVDBwWUMxNXRQVWVHMU5r?=
 =?utf-8?B?akRSbFdvYVVkbEtsZElIMTFlcmZ2QjZXMndiMGd5bTdJdHNnR1ZZZVc0RkZY?=
 =?utf-8?B?YUxPYVlrWVIxQmM4VTdJNy9YUWJKYVl2TFljQVdTN3lEYStQMDVhanRwMEgv?=
 =?utf-8?B?WlNXK2ZrL2ZDSWtyeTEvN2RPWElYU0s0R1BvVm9VUEl4Nm9xcU5Qb1ZPV3RT?=
 =?utf-8?B?cEh5S3BCaDh5UnpEQTBDRUpSNTAzZFhoZ21STEViQXpIcFFQVmJiVE4zODJW?=
 =?utf-8?Q?K2IXDvHVVvVLc?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ckhIdVFBZTh2QjZROFZvazYzaERxZG1kajZTbGNndjlTR1JvUEo4M2tUOXpn?=
 =?utf-8?B?YWh6SmNML2xrMjNGVUFvQWVBaTIxMnJ1QWpQQjlTOEROYzV0QTJudlhIZjZN?=
 =?utf-8?B?RllFWjFoM2pSaFJSZERtWTgzdHZ5aE5iazZ2Qmd0dlpmeVFObE1TbnJlOXVW?=
 =?utf-8?B?MWczNFNFMHdQSi9NOVkxR0w2K09DTk84RDFjZzB6amFyUkxZcXpKZEhyaU5o?=
 =?utf-8?B?OFZvRFZxSHEyb0l6U2Nna2RpUnc4bCtMeGhCODJXVG03MitZeklRM0JoR1Jp?=
 =?utf-8?B?OVFWdFJzU2ZEaEFOTXdwcEtZWlJKc1NDbElJRXp1b1RrTXcxQlo3c2RsTUhh?=
 =?utf-8?B?N2VoMDJDL1NteEJML3k0aitUZVh5RTVPT1pnc0syU0NDbVlQSkQvRDcvQU55?=
 =?utf-8?B?TDNpRU9TVFFCT3NUenNGR1QvSjZaekFuejBPK0xUdUZTTWFsNFIwK3Bvdkc4?=
 =?utf-8?B?emR5UFVOYURRUEx6OWllWVlEOFFIejRZUzdramQvT3JsNFZMZDBZUDdOVndS?=
 =?utf-8?B?WWJzUVhDQ0xCWnBweEJ3a2Q0eDdGbkYrZHpaNkFnQ01PRkNBZm5HSWVPcVVS?=
 =?utf-8?B?NVZPN05EME5iV1FGSFptbEwvSGJOWFVXV3czbWxlY2VJOWkrSE5DLzFBVXhF?=
 =?utf-8?B?S0RSZzNGOFczNFZqK0EzR2g0UHViOXNNQWhOMjV3amJqRzdqMlFzUjNGV2V4?=
 =?utf-8?B?ZVp6dE1aUk8zdFJCVzdLaisyckQzdUVUQmZjbG01R1dRQjJYd1ZQOGtrUkk5?=
 =?utf-8?B?WjhsUnRydERXdkVjWUt0aklWV2VzYkZ1SXZ0RGxxdUJrZnRDd2RUTVpYRkZh?=
 =?utf-8?B?RW9OeThSaWNoSE1taE4yeldWWGpJczFhOElWYVRzdVIrZWE3cnl5OTgxUVNz?=
 =?utf-8?B?NHg5M0RFWDd5dHpUVkRVUEFKVExqRzQ1cUk0TkVicCtzZUdBNkJRUTZJWTlU?=
 =?utf-8?B?cnZHT3I3OUpBcUJFalR2UVFJc0tpUEJjbHI5WWhwMUJFdklSdk9vSlRNcnM3?=
 =?utf-8?B?WUNpT3Vhd1Z0RnJMbzBvTVdxaFRDVEUzbjM1WFJpTkovZ3g0MWxRMmVCNVdG?=
 =?utf-8?B?TDluM3MyWEMxdStwOStXTlcrdzZoa3AxazZDcG1zZmprQ25TM0Z0RkhTSHF3?=
 =?utf-8?B?RTl5Vk1VMnRtRVIzaG1YTml2MHVUd2FpWWxnbEgzdHg2ZW8zRUp3RGdGRk10?=
 =?utf-8?B?ZjBrVHZVMU1FRWRmczhYRVlJRjVXNGVXdDJBRGpCM01ycnQzZ09yS29aVVNl?=
 =?utf-8?B?c3pYYjd5NUJoZEp5SlV3dU5kM29COHo3cTlvSlBhb09hVHV4ckl0eEF6c0pt?=
 =?utf-8?B?WWp6NW5lVW91Q1hOUDNDWWhUT1RSQzY2OExDeVJTMFBENk5ETGk5ZkZjVlN3?=
 =?utf-8?B?Rm5QWkxTQ3JYM2ZvZ3BtY040TklpaGFqWVlNSEpZZTNIRXVORHIwcHFPbGdV?=
 =?utf-8?B?Z2xuaHlEbHBDRnNuTUIzcEMxWUYzbWt1V1JDWUI0c2IrUlhLZmxob2xMbTE1?=
 =?utf-8?B?K3hpTjEyU1dUT0I3aUkweHFnUWw4Yjg5T1RIamhlbDFXRFJiZ2E0S0JtUXhY?=
 =?utf-8?B?d0VWcWQreFhOTVZGbXVLYkhReDhjTTFENnlVelIvbDFYOTZ4UFpONnJ6d3pQ?=
 =?utf-8?B?U0ZiQjd5M0FhS1hYbXpLR09HSjkrRzduN1YwVy95VjZoYU1oakM0Mm9mdVJX?=
 =?utf-8?B?cm0veXlDeWFJejNHK2FhT2c1K3RTWVBLdDdNS21CdUczNFlJL1VMV1k5RzRp?=
 =?utf-8?B?ejd2Zkx4RFpyUVF6bEFxZmF3MDgwU2t4Wi83RVF0eWJzUzl3MHRQcUd0enJp?=
 =?utf-8?B?OEdaclUvVyt2VGZFOEpacEdody9CQi8zQlAyMmhYTkhoaTBsbUxYMXdSam5C?=
 =?utf-8?B?TDJ3dmlWUjBmaUlNVHFZOWVoUGdDaFR6UGVRUEdiRjNhRnNwa082ai9Yc0t4?=
 =?utf-8?B?Tmx3ZG5RU0VlaTJCTHVDLzJ5aGVDbTRNUlltbWVneHlXb1BYM3lmQW95T0ZG?=
 =?utf-8?B?Y2pBRThGb1Q4dG9mWmo0eHhhQmVQY0pocGpjYzlFL2NmSmIyTlNoeVpBQzhl?=
 =?utf-8?B?Q2t3aFR2clRRa09aSVduODhTSWI2bUVPNFdGMUxOVytlZ28ydHQrZFIwMGxp?=
 =?utf-8?B?b24xa2FuSzMyRXVHYXBZNjM4TUdhUDgrVU1NTjFmSThPZXlrbE1POHRmcTdE?=
 =?utf-8?B?RUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3798b173-88a8-40e2-fa2f-08ddbcfee07a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 02:35:03.3885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IFbbx4sVfhfNt5pPcsxaGVfKLz9FzEy6AxFFqtlIg3ePSDHUWgBdRHLjIKd5gSig8gqJJqkZuubk5HUq8xb71akrZbP0AeFF97jYN944iak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7660
X-Proofpoint-ORIG-GUID: t09tKoY01Y7li5hpBb8tNgt2SleUrqad
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDAxNCBTYWx0ZWRfX1JdpXv24v+6d uGmJ8lQMzAC5Li6XviDBbrBH7Gg54eXMHtKKFDTPHEgX/KqYZJoq5KpopRQ1BbJPR51eHMBDI1c Pxjvk8/67khxa2F3c7BhlL9O/wyS/n2CGsecENyaUjhy++KCyc5G8n5UNjj/uEr0NkRaqxPSSM+
 9wv2WEw5oXp4ax+O0z0acHD63F5yGdPMccWhiRvcFa61qK9VJ9QcS5jS8vT17grqBA4Ywy7QjzE z4SZE6gMToq1sGg6cw06GCSJfcQwPi8cyFno6tb89dNiY/YyDAwYSANK/EbpB8ouDSc5ozC8ktu M0hGBuY9sb5KbyxVrZMiX8IjM3xHFUtLD1s/Hjn9QZ84Lx2xYX14zxsnu225KcTbndGtpXk6Nk1
 C6iQmjF8PljweN/xOV4VKjKZKSOcfm9t/WnAtFA6PD7ZAsQQxqgwHl4H6zXS+abXd1Hbp2jE
X-Authority-Analysis: v=2.4 cv=ZrntK87G c=1 sm=1 tr=0 ts=686b325c cx=c_pps a=yon3pwas+gv+LWsOvvvfWw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=sntlU3ZaAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=cY79GYoYLLl-gvcmQFcA:9 a=QEXdDO2ut3YA:10 a=ZHp1PDvQXKyvBHuofP0A:9 a=Rz2EsLKzmxOnHNoF:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=xslW_GA4FUbfK35qJ43B:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: tQtPD301XuF3GBUCDH2h0i0_YTjjUPAC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507070014
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 02:35:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118241

--------------L3hu49h3FU4jf4owTZK5rYQg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Kindly ping, thanks

//Changqing

On 6/10/25 11:30, Changqing Li via lists.openembedded.org wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> License-Update: License year updated
>
> This upgrade include security fix for:
> CVE-2025-24529
> CVE-2025-24530
>
> Release note:
> https://www.phpmyadmin.net/news/2025/1/21/phpMyAdmin-522-is-released/
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   .../phpmyadmin/{phpmyadmin_5.2.1.bb => phpmyadmin_5.2.2.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_5.2.1.bb => phpmyadmin_5.2.2.bb} (91%)
>
> diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.1.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.2.bb
> similarity index 91%
> rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.1.bb
> rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.2.bb
> index 34b710e885..c98ce4585b 100644
> --- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.1.bb
> +++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.2.bb
> @@ -3,7 +3,7 @@ HOMEPAGE ="http://www.phpmyadmin.net"
>   # Main code is GPLv2, vendor/tecnickcom/tcpdf is under LGPLv3, js/jquery is under MIT
>   LICENSE = "GPL-2.0-only & LGPL-3.0-only & MIT"
>   LIC_FILES_CHKSUM ="file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 \ - 
> file://vendor/tecnickcom/tcpdf/LICENSE.TXT;md5=d0ff7e060074497f34481cf574e8a581 
> \ + 
> file://vendor/tecnickcom/tcpdf/LICENSE.TXT;md5=72bda492a00ee8c4121987c6afdefc07 
> \ 
> file://js/vendor/jquery/MIT-LICENSE.txt;md5=de877aa6d744cc160ff41c26a8e4811f 
> \ "
>   
> @@ -11,7 +11,7 @@ SRC_URI ="https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-la 
> file://apache.conf \ "
>   
> -SRC_URI[sha256sum] = "373f9599dfbd96d6fe75316d5dad189e68c305f297edf42377db9dd6b41b2557"
> +SRC_URI[sha256sum] = "f881819a3b11e653b0212afaf0cc105db85c767715cb3f5852670f7fc36c9669"
>   
>   UPSTREAM_CHECK_URI ="https://www.phpmyadmin.net/downloads/"
>   UPSTREAM_CHECK_REGEX = "phpMyAdmin-(?P<pver>\d+(\.\d+)+)-all-languages.tar.xz"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117793):https://lists.openembedded.org/g/openembedded-devel/message/117793
> Mute This Topic:https://lists.openembedded.org/mt/113564026/3616873
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------L3hu49h3FU4jf4owTZK5rYQg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p>Kindly ping, thanks</p>
    <p>//Changqing<br>
    </p>
    <div class="moz-cite-prefix">On 6/10/25 11:30, Changqing Li via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:184790D8263E94F1.17668@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

License-Update: License year updated

This upgrade include security fix for:
CVE-2025-24529
CVE-2025-24530

Release note:
<a class="moz-txt-link-freetext" href="https://www.phpmyadmin.net/news/2025/1/21/phpMyAdmin-522-is-released/">https://www.phpmyadmin.net/news/2025/1/21/phpMyAdmin-522-is-released/</a>

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 .../phpmyadmin/{phpmyadmin_5.2.1.bb =&gt; phpmyadmin_5.2.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_5.2.1.bb =&gt; phpmyadmin_5.2.2.bb} (91%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.1.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.2.bb
similarity index 91%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.1.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.2.bb
index 34b710e885..c98ce4585b 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.1.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.phpmyadmin.net">&quot;http://www.phpmyadmin.net&quot;</a>
 # Main code is GPLv2, vendor/tecnickcom/tcpdf is under LGPLv3, js/jquery is under MIT
 LICENSE = &quot;GPL-2.0-only &amp; LGPL-3.0-only &amp; MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263\-file://vendor/tecnickcom/tcpdf/LICENSE.TXT;md5=d0ff7e060074497f34481cf574e8a581\+file://vendor/tecnickcom/tcpdf/LICENSE.TXT;md5=72bda492a00ee8c4121987c6afdefc07\file://js/vendor/jquery/MIT-LICENSE.txt;md5=de877aa6d744cc160ff41c26a8e4811f\">&quot;file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://vendor/tecnickcom/tcpdf/LICENSE.TXT;md5=d0ff7e060074497f34481cf574e8a581 \
+                    file://vendor/tecnickcom/tcpdf/LICENSE.TXT;md5=72bda492a00ee8c4121987c6afdefc07 \
                     file://js/vendor/jquery/MIT-LICENSE.txt;md5=de877aa6d744cc160ff41c26a8e4811f \
 &quot;</a>
 
@@ -11,7 +11,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-lafile://apache.conf\">&quot;https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-la
            file://apache.conf \
 &quot;</a>
 
-SRC_URI[sha256sum] = &quot;373f9599dfbd96d6fe75316d5dad189e68c305f297edf42377db9dd6b41b2557&quot;
+SRC_URI[sha256sum] = &quot;f881819a3b11e653b0212afaf0cc105db85c767715cb3f5852670f7fc36c9669&quot;
 
 UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://www.phpmyadmin.net/downloads/">&quot;https://www.phpmyadmin.net/downloads/&quot;</a>
 UPSTREAM_CHECK_REGEX = &quot;phpMyAdmin-(?P&lt;pver&gt;\d+(\.\d+)+)-all-languages.tar.xz&quot;
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#117793): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/117793">https://lists.openembedded.org/g/openembedded-devel/message/117793</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/113564026/3616873">https://lists.openembedded.org/mt/113564026/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------L3hu49h3FU4jf4owTZK5rYQg--

