Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D12CCD19A
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 08:37:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10983.1760690247823050640
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 01:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XlXO8Wt/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=238598bdad=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59H4c0SH2000357
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 01:37:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=KzbcDKwh3xJ6p4DpJmy4qT
	afA7kpqvzTwLzEnMSEnH0=; b=XlXO8Wt/bwUcCVQwjQJ0DkJyDvKcedVmDoM5wq
	zQhKFSOqeVjHMUNrNg9/QOpM4TzwIxLXabfIONutZ9CAHP/82JiGPGxHkpf+wUwy
	00/SMd/0r1Q8DDqsfqDIf5qzPNXQaVIsc9GTR+KuRNN1kXgU0Wt18O+NNzVfszJK
	PYoIYFkb8TyTRRa89iMXbYhJbvNiR3gUQpWU8TDpK2e9/RQwTQnq996TJEnDqi8S
	eQf1GYeqamUcYZoc79usVqoAUujoJkBo0bgbt9Bhdpw8aBQr3famvfWnK6PEjg5i
	LsDOCeYU1R7I1ezco908nVHt5F4CTWFxKlAwMmIVurwXrdqw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013042.outbound.protection.outlook.com [40.93.196.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qjh1q5ua-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 01:37:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pcZJ3Xz/oO5JBMqjOXsgAIiVtExSjN6Sc16Jkott5kA2HW/W+egqCWQpveREtXCB8VxCeABHqVc5S0iHeyupLGvYOKJkT6k03+dmeVJKpHT0OGF2ZrbrorHmg31APa92+130nkv29YpZeVvWr/L5UR3FwZp1sykrScY9jDI9UoXrXPuIzRJTv0JYZkPunCBDBV0jiL0bab4ixTF/6DRporFcGCF2srE/LskTYL91QUiMwyidFMBp9aOesoLNGQI/rIc4lm6wtQ9kn5cO6FPn0ZdA+qr7ipfEGEEPapbKXN6QKcEUU+EaxEx32cub1tJIdRKfmnjyfdyBCzDsNutoAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KzbcDKwh3xJ6p4DpJmy4qTafA7kpqvzTwLzEnMSEnH0=;
 b=LT2dhkGHHendCp6zdrl2Tst6jDLMERSJPmURX0B4FyfSTq4/ftjubxKCyUQwR576fN4ksamivKHLaWBgV4h8BkmDxskSnpR5RaP/gvOD8mB/ytcWwLHMJKVUTOeqlxUazkjht4QqwO2VhroLRmFCk3UC/DEOpGEAXGpeNJOt86niKEfPjGC+nvSVLdCy8+hIhFrNzyIA8O2M/QTEdgTD3uwIDKiuDwj+aVia4fUHjrhwVcb/sn7Ah6DGyPI1Mc23ceqtn0lsXEmulrdoqSpcCPwUJPirBzCy4kyiy9IjBSVOTd7QcBjPnAlX5tUavjWdWjiRzw3G1jr5UPnjjzfAUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY8PR11MB7169.namprd11.prod.outlook.com (2603:10b6:930:90::14)
 by SA2PR11MB4970.namprd11.prod.outlook.com (2603:10b6:806:11f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 08:37:24 +0000
Received: from CY8PR11MB7169.namprd11.prod.outlook.com
 ([fe80::c173:acfb:56ef:8120]) by CY8PR11MB7169.namprd11.prod.outlook.com
 ([fe80::c173:acfb:56ef:8120%3]) with mapi id 15.20.9228.010; Fri, 17 Oct 2025
 08:37:24 +0000
Content-Type: multipart/alternative;
 boundary="------------eis0CtYA0yZ0kK6GTSBHoR1u"
Message-ID: <e0b7c7f8-dbe1-4dfd-9117-998f8dad93a1@windriver.com>
Date: Fri, 17 Oct 2025 14:02:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][walnascar][PATCH 1/1] poppler: fix CVE-2025-52885
To: openembedded-devel@lists.openembedded.org
References: <186F3A1F5AB7792F.31929@lists.openembedded.org>
Content-Language: en-GB
From: "Urade, Yogita" <yogita.urade@windriver.com>
In-Reply-To: <186F3A1F5AB7792F.31929@lists.openembedded.org>
X-ClientProxiedBy: MA5PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::14) To CY8PR11MB7169.namprd11.prod.outlook.com
 (2603:10b6:930:90::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7169:EE_|SA2PR11MB4970:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c256fca-3bee-4456-01ca-08de0d586544
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|4022899009|8096899003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R1kxQ21kc0xCNWZhVWd4d3FUZU5qM1VtNkMwTyt2NzQ3OGhKZExaL0crSmxU?=
 =?utf-8?B?SmxLNjBYbFRucUh6ejBFVVhQQjRELzJwZlhodWRCenhlK2lwRUtQeWx0SEYx?=
 =?utf-8?B?UDhKK3NlckJ1S3FDQTRjeE9jUVYybld2RmhJYVhqNGRObWx3SW8rYkFONlVT?=
 =?utf-8?B?Ymd1ekVpbSs5dzU2OWwwSUY5dVl2bThuaHNWSVowTU9rMnJKM2E3SDkrTi9i?=
 =?utf-8?B?c0JOZUtiZTZOd25lbWtFSXM2dktjNUlxM05EcVplQ0czRmloek10Z1VjL3pM?=
 =?utf-8?B?TTR1blFwZFZCMFl5SlZSNDV1YjhSTkVpczMzRE01QmVuKzBNWDhEVFd3VnZM?=
 =?utf-8?B?S0s3aE8xYXJNWFltTkVPSktBU2hhOHZiMG1sZENxRU5kY3UxQkJNdnRhSFZk?=
 =?utf-8?B?ZHlYcGNITlFlek5tSFkvb3llMFp2b005ZEtra2Vlam9ESzVzaWdtVHdUV0xq?=
 =?utf-8?B?TDBHSVJWUytSZDhWS2Q3QlRSQUZJbHc5NmJkb3FjUXNXaWRsWkh4YlRsZWp0?=
 =?utf-8?B?S0dpRXVla05ockxNdm5lZ1QrOUt1VVQrSmFhVnJFbWF5KzdsRDNNMGlxR3pn?=
 =?utf-8?B?YlhDWTNYLzg5VE5CdTFHZGpNejJlcTBwemordjIvT2tZdjVEYmxtaDBqMnY4?=
 =?utf-8?B?RW1PVGdSN2pKdFJYOGRVR3luNjJ3QmZrWThBU1h3elBtd2U5bVNJTy9PbmdQ?=
 =?utf-8?B?Y1lOVE1CUFFNQ2pSNEl1bkVZVEdIMnlGWmdCZ3VCQWw4cno3WnNSSlpSRm5x?=
 =?utf-8?B?aUdYTjBWUHpQVmtxWU01UENGV0oveE1IeUdWNWpYR1NQNjZEZnZiYm9GYkcw?=
 =?utf-8?B?SWhMY0RDd3d3OU1zN3NjV2JFSTY0MTZpZkUreWhFTFFiNW9VcDE4ZHJ3engx?=
 =?utf-8?B?R3pvUUxYNVBobGlXNGpNcEhhQkNhaC9qcGsxZU5TZnQ2Unl1b3dxVjBNUVRT?=
 =?utf-8?B?Z3hha1pqNWlaaCt5aXluazhSUXhDY1ZHT1hHMHVycklDVFdWKzlranFIT2lR?=
 =?utf-8?B?aVUzR0lzZCtKM0ZoS0FWZkRBN2c0MlBJSndTS295VFBnUlVWU0FjWGJNV0dS?=
 =?utf-8?B?Snp2aU8xZlpkS0Zxc1cva0RYU2htWkNyT3ZOQjRnVzBsUk4relhJM0dnL3Vs?=
 =?utf-8?B?bkE0dUNsTndqOUdQeFNlc3JDS0oyUlorN1Q1UlJQb1luZk1KbWJpNnBsaG8w?=
 =?utf-8?B?czd1SnBNRk5zU1lrRksrQzdodkZHdTg4alJncTA1QzFIbVVuY2hlcnhPTTBa?=
 =?utf-8?B?Zmh2T3pCZkNJQllZZHk2REpXT3ZMS3RraTFTalcveEpsVGJ3QUczdEFjZUM3?=
 =?utf-8?B?ZjVPanNQV0trQVRma3J0RGM2Z2k0K3JKSm1za0x4cHdSWm9tU3dBWFlhYzdy?=
 =?utf-8?B?UXhUbUpMOG5GUGZsQXA5Qk9lMHdWUjAyVHRzSjQvbnpNTlFFNWpyNDJONnBi?=
 =?utf-8?B?aGRpV25kTjlzc1luTWJQWlowRXh3VVZxN2I4ZnpOSi9FYnlEYkNPODJLdFBK?=
 =?utf-8?B?dHR4Mmp6cmcxQ1AzZkxrUHB4c3NrTUtLNk1aK1BQT3dJejNaWXQ5eXpvOGpZ?=
 =?utf-8?B?dC93QkZNVG14dkNrczlnMnhBSE5ITU8rd2dqc2RPcHY1NlBsa28xR083NXhu?=
 =?utf-8?B?MW9iNlFqWDFUdTdiTW41bVo5ZFZQOVdVUjFSME9RMEVKeW5lN1ZRd0xiTUNC?=
 =?utf-8?B?QlhIbE4wclFZWitJdmVvLzFLYTVjN3F1S1JQaitRQU5JYWp5ajlQVitENDV4?=
 =?utf-8?B?TnJGR1VYdjlpTzFMWDdRZEdHQmFucFhqdHRNMUQvcklTcC9EZGx6Mzc0VVow?=
 =?utf-8?B?bXhzcUsyeExySkd2TmRwNkllQXAzRDFydlVLY1Fvd2RXdmh4bEZGUW15MStZ?=
 =?utf-8?B?cm5IZHhuS21zaXVyN1pxL0U3TmlENHM2VHMvWjFROWJ0M1dJZkR0MDhzMzcw?=
 =?utf-8?B?OFhnTjdYQml1K3BXd3ZKVTJYTlhLNFJBcEhRYTRBRXZCV09aY3I2aTMyUFpi?=
 =?utf-8?B?NXZhN0NtWDdBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7169.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(4022899009)(8096899003)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YU1OdVlRTVlYYkFoRElTcThyREx2U0Nxd2JiY2sxRjR6dkh6bFovZUR0a2kz?=
 =?utf-8?B?M2FrVS9jNFRGTU9KZjJaMzFOWVoyLy9uWmdGcGtxYjhLTEJwUkRIV1h1b08w?=
 =?utf-8?B?V3NraGVlbnRRZjNMR3NEQnloUnFLN1AvYXNFRVVTRytZVGhYU0dDUURDbGlh?=
 =?utf-8?B?Yi9jVUlQQUVQaEdnK2pzbG9ZS0V1amF5bHBlSk5XTW5HMXNZdTMxR0lVRUQ4?=
 =?utf-8?B?ejJxTDNLSHJWK2EzM2JlbWx5TlV6UGM3Njc5YklkNFpUeEVvMVArWmVuMHM2?=
 =?utf-8?B?amg4S3JqVVZWNTRiSDFTdG1mMUdVRGZEL3lVejd5S01tdWEyck1pSTNyN1Vt?=
 =?utf-8?B?VHhQNW1oZitXVkREVFhpNFRzOVoyWmVobjRGSHBYbEZWdjNXaWl2ZnMzbGYz?=
 =?utf-8?B?RncvVGJZdnhlRHBhSWV1R0crMXUxVjA4dUhSblUvY1VPMFNuSEJGK0Z1YTNM?=
 =?utf-8?B?WTNwMjliR1BIemZZWHZqQVNDQ2IvdVdxVmxvWXdFamtiaXFEOCszaVo4WVhN?=
 =?utf-8?B?eGVVQkU4cm4wZEVIdDlqZDZWWklIRnFBaS9kRnVEL1oyYkxUZWRuV3p3eERm?=
 =?utf-8?B?dVZUcy85ZkdBR0YxbUdJQk5rRmJvMkVXTFE4YzF2WjhMSjVxak5RRXppTVN4?=
 =?utf-8?B?NEE3MFk0RlExVTBjSmM4enFoSTdwSzlHTTFTUzNBQXB0OUdCL29uc2k1YjJw?=
 =?utf-8?B?WVpVTnlFeDRva05DalRRblorYzljWmVqYzF4ZHBweTFYK3pBeklEQ1hiOVZ4?=
 =?utf-8?B?S0lmRmFkT3RtV1Q0RUNwMFA1M1IzWVdtVVdmMnZqY3hJeGplZWhuMXIyb01M?=
 =?utf-8?B?NjdWSDAzdHJKM1dnVWxlWEF0L0RBREUvRXJSaUdHYXpUeW94RjcyaDJFamNY?=
 =?utf-8?B?WWM0NDBZaU5nalRIMDdGaHRHY3RaOUZVR1lDN2hHRmxIeXcrbEN4cmMvL1d2?=
 =?utf-8?B?WkJnRCtudi9ISk9TQnVoOGRnbU52aHcvczZKMDJEUExEZlV2cURWOXNKdFVH?=
 =?utf-8?B?LzBxSU4wYUNkM2RuODEzbk9Sd0dTS2NNWXlHay8zY09LZWhlYVdkY3FROVd5?=
 =?utf-8?B?aDRiZEIvdW5TY2FxbzRjcW8rRDBhZFIxRlNqNVdXd016TGZZeFQ0MlJyNE5F?=
 =?utf-8?B?cHo5MDhsVHlhUzFmUkpNMlR5M0swUy82ZHh2SHIwMnVPNkNtd3cwRS9Ga1Vs?=
 =?utf-8?B?RFFGV0JFbVpCYjJRK2drRGtrS2ltUGlUNHJUdVVTbW1RMTRiL3FzVFVmdXVw?=
 =?utf-8?B?clpYL09pYWJRL3I4cWhKNWxFZnRRejlmZVpzVVFLYU9sY2RUeEM4UEdRTUZu?=
 =?utf-8?B?Q2VFWHlnYW00eUdXRThPclV6YytqREJaVFBHeWQvWDZuSERtWlAyOWNpQm9j?=
 =?utf-8?B?aTZwa0pUaGVTbXpaU1YyZC9ESjBQQ2xabDlxQnl4QlVKdEw0TTdoREMyT0Ro?=
 =?utf-8?B?bGJPRktlczJUSlA3bE45OEpFeTk1Nkg0dXRTZmgwT3hxT1FidXppN3ppT0RF?=
 =?utf-8?B?NFJzcUtjZlBpNkZmU0s3ajIzbWMzYUp3KzlqcEUrTTZ2RDdrOTBRL3NIelVU?=
 =?utf-8?B?Z3VxUWVoamFjR01WL2FicGpacWczNERvK2h5R0hFSWRtM1dCb01qdTJjaTFF?=
 =?utf-8?B?TXFmQTdjeEJkY2VMNmpiRjAwbVBsTzI1QzFibnhMMkViUUhvVVNXUDN3eWxo?=
 =?utf-8?B?VEJSK3lnZG02cnpJZjcrWDR2UlR1b0daT0I0WEVZUGZIeDVTUUlRMWYwQWFE?=
 =?utf-8?B?VGd3VEJ6Mk9ETWRmOW1nNVNiMmNIend3ZGxKK3AzTDhGd2duaTlKRjdBSXBq?=
 =?utf-8?B?c09YTFBhSE80cmRxZFV3ejh4SEU5RGJHbUJlRFErQ1U1cDR0UXRQR1FpcEdi?=
 =?utf-8?B?VVBGbEVKWndpUEMrNXBOVDExS2VIS0ZZMFVZM2FGbys1SlpmRlMrL3lKZGkz?=
 =?utf-8?B?OUxPZXlzdWJUSldsU0lQOWlpc0hkUS9UaTdVYlpjL3ZKZUgyalRHb3BzMkIw?=
 =?utf-8?B?QlNzaExaMmtNa05ESENuYUhvUGxZeE4xajJwdUR5RXhYbzRFWnJ5c3dpcFl1?=
 =?utf-8?B?Mk4xc0lzRUY0UnZQaHBMVHNWbWkzRk9KMHlrUmRxQVRuY2ZFZ0NidmVFNzVT?=
 =?utf-8?B?eVVrZkNHcW1oaHJSZHAyOHNXUVVmVHJBc29iVjlqdXFQQ0VranVwaFB5RllZ?=
 =?utf-8?B?cWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c256fca-3bee-4456-01ca-08de0d586544
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7169.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 08:37:24.4119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4CnDXwx7YLWpDoWRltl8qfLy0pKW0V1AWuz5Lu1QivOrwv7KlAM/JvIy7UUAMxK3Hl8pf+qfOYxwm83/BNcinw0Ippq6B/HnvopV9RWkLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4970
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE3MDA2MyBTYWx0ZWRfX6QKmXQ5Pa6dl
 TszYvjRAA3GtWSBbbSeja4VP+KRocEXMDQRrHeHdazfWpHB24WjXb3l1jCM6NVOUJ6wyfx0ohNG
 t7+vy7INhSXX9uTh9m23o7vk5B0AKfDWqVnOVYg4QT0nOrT9uHsB+Hjr9fLYtMOwtW8gOnKit72
 7xqg71hY0mQT7nFew3CmgAWmvbJYvhNRJrxuEl7kORofiFI7TgRRU0OEN4XYOSueXrEHRaHVzOX
 DprOr0wrKoR5XIlyFgWm4CosZQ5v0G1g7V1lZCaWjwINYQGiiNMEqQ0bB08RWrN+CejX9ruJ6Cq
 9HDbBVzawJ5NRZSbYxPH3BWl9MweR1fdrBFff+dpBpuTis+e9cDPIUCGx/+cjD11JOpg4w48B+l
 qBu3utDJLGuTXdoHM/fOVGmX8HTUlA==
X-Proofpoint-GUID: 5VgZlgFwW9tVRtZYKi_e_Te_aTP9E-H0
X-Proofpoint-ORIG-GUID: 5VgZlgFwW9tVRtZYKi_e_Te_aTP9E-H0
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=68f20047 cx=c_pps
 a=BmBYDrMhH73hh332m6kGpQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PYnjg3YJAAAA:8 a=e5mUnYsNAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=DWrw7PxMFUCRN0bawuAA:9 a=QEXdDO2ut3YA:10
 a=2YvzGzAQeT9XHQoIYAYA:9 a=nTLJSJklYcleiTOX:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=Vxmtnl_E_bksehYqCbjh:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510170063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 08:37:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120745

--------------eis0CtYA0yZ0kK6GTSBHoR1u
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Kindly ignore this one.
By mistake, walnascar was added instead of scarthgap.

../Yogita

On 17-10-2025 14:01, Urade, Yogita via lists.openembedded.org wrote:
> From: Yogita Urade<yogita.urade@windriver.com>
>
> Poppler ia a library for rendering PDF files, and examining or
> modifying their structure. A use-after-free (write) vulnerability
> has been detected in versions Poppler prior to 25.10.0 within the
> StructTreeRoot class. The issue arises from the use of raw pointers
> to elements of a `std::vector`, which can lead to dangling pointers
> when the vector is resized. The vulnerability stems from the way that
> refToParentMap stores references to `std::vector` elements using raw
> pointers. These pointers may become invalid when the vector is resized.
> This vulnerability is a common security problem involving the use of
> raw pointers to `std::vectors`. Internally, `std::vector `stores its
> elements in a dynamically allocated array. When the array reaches its
> capacity and a new element is added, the vector reallocates a larger
> block of memory and moves all the existing elements to the new location.
> At this point if any pointers to elements are stored before a resize
> occurs, they become dangling pointers once the reallocation happens.
> Version 25.10.0 contains a patch for the issue.
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2025-52885
>
> Upstream patch:
> https://gitlab.freedesktop.org/poppler/poppler/-/commit/4ce27cc826bf90cc8dbbd8a8c87bd913cccd7ec0
>
> Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
> ---
>   .../poppler/poppler/CVE-2025-52885.patch      | 30 +++++++++++++++++++
>   .../poppler/poppler_23.04.0.bb                |  1 +
>   2 files changed, 31 insertions(+)
>   create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-52885.patch
>
> diff --git a/meta-oe/recipes-support/poppler/poppler/CVE-2025-52885.patch b/meta-oe/recipes-support/poppler/poppler/CVE-2025-52885.patch
> new file mode 100644
> index 0000000000..a48b2c01a6
> --- /dev/null
> +++ b/meta-oe/recipes-support/poppler/poppler/CVE-2025-52885.patch
> @@ -0,0 +1,30 @@
> +From 4ce27cc826bf90cc8dbbd8a8c87bd913cccd7ec0 Mon Sep 17 00:00:00 2001
> +From: Kevin Backhouse<kevinbackhouse@github.com>
> +Date: Wed, 3 Sep 2025 14:36:54 +0100
> +Subject: [PATCH] Check for duplicate entries
> +
> +CVE: CVE-2025-52885
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/poppler/poppler/-/commit/4ce27cc826bf90cc8dbbd8a8c87bd913cccd7ec0]
> +
> +Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
> +---
> + poppler/StructTreeRoot.cc | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/poppler/StructTreeRoot.cc b/poppler/StructTreeRoot.cc
> +index 47adac9..10db9aa 100644
> +--- a/poppler/StructTreeRoot.cc
> ++++ b/poppler/StructTreeRoot.cc
> +@@ -137,6 +137,10 @@ void StructTreeRoot::parseNumberTreeNode(Dict *node)
> +                 }
> +                 int keyVal = key.getInt();
> +                 std::vector<Parent> &vec = parentTree[keyVal];
> ++                if (!vec.empty()) {
> ++                    error(errSyntaxError, -1, "Nums item at position {0:d} is a duplicate entry for key {1:d}", i, keyVal);
> ++                    continue;
> ++                }
> +
> +                 Object valueArray = nums.arrayGet(i + 1);
> +                 if (valueArray.isArray()) {
> +--
> +2.40.0
> diff --git a/meta-oe/recipes-support/poppler/poppler_23.04.0.bb b/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
> index c7287f42c5..b56a4cf6b1 100644
> --- a/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
> +++ b/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
> @@ -20,6 +20,7 @@ SRC_URI ="http://poppler.freedesktop.org/${BP}.tar.xz \ 
> file://CVE-2025-52886-0002.patch \ file://CVE-2025-50420.patch \ 
> file://CVE-2025-43718.patch \ + file://CVE-2025-52885.patch \ "
>   SRC_URI[sha256sum] = "b6d893dc7dcd4138b9e9df59a13c59695e50e80dc5c2cacee0674670693951a1"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120743):https://lists.openembedded.org/g/openembedded-devel/message/120743
> Mute This Topic:https://lists.openembedded.org/mt/115804232/7312273
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub [Yogita.Urade@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------eis0CtYA0yZ0kK6GTSBHoR1u
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html data-lt-installed="true"><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body style="padding-bottom: 1px;">
    <p>Kindly ignore this one.<br>
      By mistake, walnascar was added instead of scarthgap.</p>
    <p>../Yogita</p>
    <div class="moz-cite-prefix">On 17-10-2025 14:01, Urade, Yogita via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:186F3A1F5AB7792F.31929@lists.openembedded.org">
      <pre wrap="" class="moz-quote-pre">From: Yogita Urade <a class="moz-txt-link-rfc2396E" href="mailto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>

Poppler ia a library for rendering PDF files, and examining or
modifying their structure. A use-after-free (write) vulnerability
has been detected in versions Poppler prior to 25.10.0 within the
StructTreeRoot class. The issue arises from the use of raw pointers
to elements of a `std::vector`, which can lead to dangling pointers
when the vector is resized. The vulnerability stems from the way that
refToParentMap stores references to `std::vector` elements using raw
pointers. These pointers may become invalid when the vector is resized.
This vulnerability is a common security problem involving the use of
raw pointers to `std::vectors`. Internally, `std::vector `stores its
elements in a dynamically allocated array. When the array reaches its
capacity and a new element is added, the vector reallocates a larger
block of memory and moves all the existing elements to the new location.
At this point if any pointers to elements are stored before a resize
occurs, they become dangling pointers once the reallocation happens.
Version 25.10.0 contains a patch for the issue.

Reference:
<a class="moz-txt-link-freetext" href="https://nvd.nist.gov/vuln/detail/CVE-2025-52885">https://nvd.nist.gov/vuln/detail/CVE-2025-52885</a>

Upstream patch:
<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/poppler/poppler/-/commit/4ce27cc826bf90cc8dbbd8a8c87bd913cccd7ec0">https://gitlab.freedesktop.org/poppler/poppler/-/commit/4ce27cc826bf90cc8dbbd8a8c87bd913cccd7ec0</a>

Signed-off-by: Yogita Urade <a class="moz-txt-link-rfc2396E" href="mailto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>
---
 .../poppler/poppler/CVE-2025-52885.patch      | 30 +++++++++++++++++++
 .../poppler/poppler_23.04.0.bb                |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-52885.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/CVE-2025-52885.patch b/meta-oe/recipes-support/poppler/poppler/CVE-2025-52885.patch
new file mode 100644
index 0000000000..a48b2c01a6
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/CVE-2025-52885.patch
@@ -0,0 +1,30 @@
+From 4ce27cc826bf90cc8dbbd8a8c87bd913cccd7ec0 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <a class="moz-txt-link-rfc2396E" href="mailto:kevinbackhouse@github.com">&lt;kevinbackhouse@github.com&gt;</a>
+Date: Wed, 3 Sep 2025 14:36:54 +0100
+Subject: [PATCH] Check for duplicate entries
+
+CVE: CVE-2025-52885
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/poppler/poppler/-/commit/4ce27cc826bf90cc8dbbd8a8c87bd913cccd7ec0">https://gitlab.freedesktop.org/poppler/poppler/-/commit/4ce27cc826bf90cc8dbbd8a8c87bd913cccd7ec0</a>]
+
+Signed-off-by: Yogita Urade <a class="moz-txt-link-rfc2396E" href="mailto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>
+---
+ poppler/StructTreeRoot.cc | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/poppler/StructTreeRoot.cc b/poppler/StructTreeRoot.cc
+index 47adac9..10db9aa 100644
+--- a/poppler/StructTreeRoot.cc
++++ b/poppler/StructTreeRoot.cc
+@@ -137,6 +137,10 @@ void StructTreeRoot::parseNumberTreeNode(Dict *node)
+                 }
+                 int keyVal = key.getInt();
+                 std::vector&lt;Parent&gt; &amp;vec = parentTree[keyVal];
++                if (!vec.empty()) {
++                    error(errSyntaxError, -1, &quot;Nums item at position {0:d} is a duplicate entry for key {1:d}&quot;, i, keyVal);
++                    continue;
++                }
+
+                 Object valueArray = nums.arrayGet(i + 1);
+                 if (valueArray.isArray()) {
+--
+2.40.0
diff --git a/meta-oe/recipes-support/poppler/poppler_23.04.0.bb b/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
index c7287f42c5..b56a4cf6b1 100644
--- a/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
@@ -20,6 +20,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://poppler.freedesktop.org/${BP}.tar.xz\file://CVE-2025-52886-0002.patch\file://CVE-2025-50420.patch\file://CVE-2025-43718.patch\+file://CVE-2025-52885.patch\">&quot;http://poppler.freedesktop.org/${BP}.tar.xz \
            file://CVE-2025-52886-0002.patch \
            file://CVE-2025-50420.patch \
            file://CVE-2025-43718.patch \
+           file://CVE-2025-52885.patch \
            &quot;</a>
 SRC_URI[sha256sum] = &quot;b6d893dc7dcd4138b9e9df59a13c59695e50e80dc5c2cacee0674670693951a1&quot;
 
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#120743): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/120743">https://lists.openembedded.org/g/openembedded-devel/message/120743</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/115804232/7312273">https://lists.openembedded.org/mt/115804232/7312273</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:Yogita.Urade@windriver.com">Yogita.Urade@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
  <lt-container></lt-container>
</html>

--------------eis0CtYA0yZ0kK6GTSBHoR1u--

