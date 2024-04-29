Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F960C4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 01:44:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10532.1714355089654426475
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Apr 2024 18:44:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QBmRA+3w;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5849c6acd9=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43T0jD69002943
	for <openembedded-devel@lists.openembedded.org>; Sun, 28 Apr 2024 18:44:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=2Q5EJmIkHsDu0uj0vebbTQ2Q3nBDyYsQf83WHHApnIg=; b=
	QBmRA+3w3ZE0YVUp96bBA+cJXyFTkiVtfhMySRfyjJ/AgnXYFq408f8DmY2RZ4pL
	hpc9hHvvoxZDBAzrKYg422LmjKz8hOlSToCBBAcf5B0PJlZ0/YFhFZs0f84qQZWb
	IZF3z5iS3oadNt08xJF7mSjjCWAYOwRLjwXEeGm2r9BPxd/npMBuUPyaEU2Yuu+B
	UrJnaaG32QfxfGgIw7MlkzA3s86FIhnaX3iEFQJrtjp1K1tAVKBIuQiVNE3kiZnJ
	mrPDebaXZu8hzvue28Rjg+qC4XRJf1pwgyLYItRVq4XS8zcpxTMCUEtuE4yHdLvq
	o7ZnWYKyGxyULGY2A4OKeg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xs0vfry9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 28 Apr 2024 18:44:48 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 43T1imsS016660;
	Sun, 28 Apr 2024 18:44:48 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xs0vfry9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Apr 2024 18:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyucyeRZO25+xUmm4/9u7vPIA7npIaFyLpTnWlKS/40HwH/8nvt0ymgOGm9wfEL/de0kjYCAWVd/JJlKqsMb9+PGNBLzfydfAFo/v3Y2KtmRFYg+11kavYsdphxtn8VauHLTCvhCf1H9GZrqTl2EpnDPhVMI2yeVIZbjsJjEhWvLB4QIOGC1165aO4SUaWVfW3eKJZKCYH7QgyCDsbabm1FEmAhiK6w2nn+wYyv477ndDHy65X6fj25VM9aWxZmq4H/mnaA/xmbRoFD0kRN0oXq5JrosVlZjiF6Hz4bdgiNf4mzgfWsoB7pH6kGG7NOgkAIYEOot/czyBV0m8F4qsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Q5EJmIkHsDu0uj0vebbTQ2Q3nBDyYsQf83WHHApnIg=;
 b=cge8JHX/5iMIwhx+73x/bcHD3wgltLLLk+Vdtk2d62j8JmBAjscURNi/nqSVomK7qjI8WCROX9Qp50xEO14Gl6QWjcyjjH8LFGSXhST1zuMEXmtq3CLo+kfMyTsjMiWjh4MVzcdqm7hgdxfr34C6eKMQ2A0yRU/GJhEFjLkK0UBp+OcTBWDyq4HYnFXEdcaNZ8TrTpyw2DJL8mh+Q2cJFkVgtO/TtoHK8gf71NEw2Ea3NDR4CqFi7u0c3WvdKJUtcXiciTIJ35m+sdqJrRuWoX0D4c2zW+KfFc6YdTG6Ei9U8rtTIL9K2OM1VLcPSNn5FjFFe6KDYxpQIPs0deqTJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 CH3PR11MB8362.namprd11.prod.outlook.com (2603:10b6:610:175::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.34; Mon, 29 Apr 2024 01:44:43 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::b674:9f45:8150:6b0]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::b674:9f45:8150:6b0%7]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 01:44:43 +0000
Message-ID: <f754ba19-fc2f-4212-aa4b-bb63a5b77459@windriver.com>
Date: Mon, 29 Apr 2024 09:44:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH v2] apache2: fix multilib files confliction
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        Kai Kang <kai.kang@eng.windriver.com>,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20240425030721.1613035-1-kai.kang@windriver.com>
 <DB5PR02MB102136209B5AD04A5B968A792EF142@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <DB5PR02MB102136209B5AD04A5B968A792EF142@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:404:56::13) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|CH3PR11MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: ed541126-8faf-494a-93fa-08dc67edf131
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UjJWNmk1WERkT0Vselh3ZTVmbDZnc3AvSFZqTEN4N2hVbmxiZU0xRVJhQW5Y?=
 =?utf-8?B?TFdWQmg0R2lWcWNlamZEZm8zTXRZOWxjdnFVQ2lDRzR4Q01CNEhlT3RjSW8v?=
 =?utf-8?B?TWVSRzdaNHEyd2F6R1g5S1Y1ZkRPa0VlWlBicjF0NzJrNGFhY1h6dDhUY2Vk?=
 =?utf-8?B?b3F2bkc0L3F4SE42MDNTKzAvNmlsc09LUnE1VThjd3YxSkQ2cHFJZjgvbjBj?=
 =?utf-8?B?Vk1FT05zY2JLSWZrQjNJZDNrUklMZzZ6ckgrdlBSUGVXWGFKbkJBRjJzc3ZG?=
 =?utf-8?B?ZnlOTk5OQ3UwejNrS2tielRhZkRxcytYaW9iSVJxUWdrT0lCUHI3RW50Ynhl?=
 =?utf-8?B?THFsSWtqNWIrV2x3N3Z4RU90VGNBSDVBRWh6VmpXc1BLa2JsVUtLbDQ4ME52?=
 =?utf-8?B?TjA5aVBnT0hja0NBR3JweitsUzdFN1RSVnh6SDlIMU8rNlZEVUd3a1k2eW5J?=
 =?utf-8?B?MzBVWEdqNHJHRmZ4TjJYTHNtZkVIR0lMMUhpNTJCaHNKcjU3bzJpaUdyV2Qr?=
 =?utf-8?B?RDRyenRad2NBZDVhbnFkaHpMZkFDSjlCQXBlQzh4SjZnMit5Y01FTzQvVU1I?=
 =?utf-8?B?TDdBTXU5M3hBM2Jxd0R0RzJnMDNTdXJkdEt1NlhwTWxKeFlHOEo4b0c2bllG?=
 =?utf-8?B?a1M5Wk0ydWFSZCtOaEg4bUtzWExrN2pYUHJPNWRSc3hqZHdNYm4xTmtZbGJE?=
 =?utf-8?B?UWFVY3M2UnBWUTVnVGtmeW9kcFNHSEVkc1VjVVBEYU10TmNvNU9xQ3JEWGNr?=
 =?utf-8?B?bis5SnZvUWhPWkZpNFlFRzc3cDZXOUFDSGhod0Y3Ti9QOG94TWVzODcvcjB2?=
 =?utf-8?B?VXVadDRVSXQ4YlVpUVBzSGhGbURCY3dqYVd1NWFYYk5ITjhUS2FPOVBNbWJo?=
 =?utf-8?B?OHJKcVdhT3lYd0NuNlZXVUxOeUVhc3o1QlhjZFp4NjFWeWpZT01CK0JscU4z?=
 =?utf-8?B?TTlRak9vZ05TU25HSmNoQmtLWURXb2ZFMXVPbU9PTVRXMklGN0diZldvYU5N?=
 =?utf-8?B?UUE0SXBURVVyMUtQOExreDJpb0xEcURKNmJMLzdqSFpjaVFXWEQyR1gxTU1r?=
 =?utf-8?B?WVlUMmF1Q25aYXRxKzJQbkU0TTN1L3QyazJuV1VsVkR6L0Z6eTE3bmR5VE04?=
 =?utf-8?B?Y295NW1EV3FWQlF2NC9IaHFNL29NZkgxS0lLYXFiYzg2RGtXTFJLZjMxOUJV?=
 =?utf-8?B?ZnQ2VjFWVFRzWUVrUXBidnRrVktSa3lVblFvNDVwclVQUVljUXcvWVF1OHNS?=
 =?utf-8?B?aTRkOWhyYklna0czckNnSjdCRHVxcW10TWRseHFoVTlDNGhmWnpSSHYwZzZr?=
 =?utf-8?B?OXNORnBkd3hEM1BXS291TXFtR1QrL1V6bm8vbFJVbERScm5UUTZyK0lhb1lk?=
 =?utf-8?B?Y25qM1d2RlFtY1ZVT011R1Zib2M5cUZMU203S3pnb1ltUDI3VXRWM094NFRt?=
 =?utf-8?B?UmtIZUVzU3R3NXUzeWpHaVNoaTRHOHNGNFVxTndQTjMyL1hyNlZWLzNEN1VE?=
 =?utf-8?B?aEpPOVM0VnVudFVIdXBmYkhFNCtib0FyNXRoTTFUYnNJdjVqdUEwMnF0VDdk?=
 =?utf-8?B?NXRmYVBieEhkQkp2djdoODlBMy9LYi8zblNscmE2Y2FkT2NOdXhsZDNLeHhE?=
 =?utf-8?B?cjB3UGFrQzhWYkFXOUh0ZWExYkpUdER3Z1dFa3QwdDRsYzFvN1ZPb1JCbGI0?=
 =?utf-8?B?SHQ5Z2tEUEp6eUo1MDMwWlhKMlV6dWFKd2xNZENpczBKak5DbGNRZ0J3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bWZISUdpVW1jSG5tanJtMEdSVUpyeGVxUWhWcVh5bDNmZUtnaDFqK3FiODlS?=
 =?utf-8?B?UjJ3SllQRHlQVGVHUVNiUnl6a1FGUVBxNm52ZFJkNDYvOUl3ajl0OUxTejhX?=
 =?utf-8?B?MU91QkQyZExCekRUM3ZEVWJpZGdkL3JaSWJjcTBYVFhrRDN4c3M5a25yOEtp?=
 =?utf-8?B?OHA0WXFoa3IzTzZmT2dpQ1QwaUNQYnJvbUwwREdWYWQ5dnlDYWliSmhONFhG?=
 =?utf-8?B?OXliNXh3WlRQSXk4Z25nbjY0ZWtraldyWHFPR1ZWLzdPK2JhS2Q5MWNlNUM1?=
 =?utf-8?B?L29pM1VxSThaZ2VGb3Z1MHdNdDZrci9ta09xaEQxVFFHM3QzREc4RWpxWTQ3?=
 =?utf-8?B?RXA5V2QxYU5nY1FnY3RKUjY2c2d0ZUR0anlSZk9YVktLS21tZTNsWmhXN3Jw?=
 =?utf-8?B?VXU0TEFYWVMya1phZEpuWVlWZ0JYRWJYb01yYkhjRmx0Y2xZdWVSUmp2TjUy?=
 =?utf-8?B?U1hoS2tzRW1HWmtIRi9xZk1kMXBPamNRRFgxcTBVM1FiZVZyV1I3K0FnWFJ6?=
 =?utf-8?B?Z1oxbTJIMWJNLytvSDRNM0ZXTVAvb1NOKzZlVHFxQ2JTK0dNcWxVOVkwRnBl?=
 =?utf-8?B?RHFNWU9zZmk1K1I5b291aXZYNStRRnhyTXhDRTBsbzlobldlTDMrVi9kSDJN?=
 =?utf-8?B?ZmRlbGZmNzlMK0UvVTA5ajltWExicUx2TDU2RTlYTlpZeWo1L0kyK0lCK0J3?=
 =?utf-8?B?UFF2dTA4amdMa2FUSTRwZk1ldXB2QldsSkhFbEJpNllaekZBcklnK2x4Tkcw?=
 =?utf-8?B?ak5WdVRpSnVXU0U2YXpnSm84MnRmT2szcWhNZWV3ODVnb2dUcTZHNTVlSkJp?=
 =?utf-8?B?QWVqZHJTWWxkYWJKMCtERTFZZ1B4bGsrTVdUV1ozaWphVmhqd3lZbCtqWXNY?=
 =?utf-8?B?cXZKdy8rR2ozSHFNQ09ad05KOGJ4dmUrS2F2d1FRU0xpMUl3cmZncGdjdHht?=
 =?utf-8?B?WUdnRVhCTndPbzE2RmZnWDgzU1lJZ2U0WWN1dit4eFhqeXF4WWpvZmp1NHk2?=
 =?utf-8?B?OUhhUFNsQlNVcWhldHFpWkJaRm9XYm85MXROQTkwc3VLNG9yOVFXenUxTGRp?=
 =?utf-8?B?aFJGQStkNUJxZ2k2dGJFVkxrS1prWkwxTlNVN1dDMEw1VEhxOHlWNjQ4Y2xw?=
 =?utf-8?B?N09zRjVxT1N3KzdBdjhhSlRFUmIrVWRUQXN6VnJMeEZTYWJsR3BQdk1OODdU?=
 =?utf-8?B?WFJUYkNTVjhtOElUYk0wcTZDaTNhM1dKU0lCbEhxK2RLaWI3OE45a285T2pK?=
 =?utf-8?B?WWZwamZwOXRBaGNYWFZkRlBLenNueUVmZTlFWC9lQkZsUCtJWWZTMWNZOXoz?=
 =?utf-8?B?UjEyWU8rYU9oUkVGUXJoUnNHeG9ac1hDUTNsa3JyTHVYeGU2eVFMRG9yOUJa?=
 =?utf-8?B?bW5XMXNRcEhEL0RDYUF0RHVYOXBlS1hPVWhzNmljcW9wRkdWc1FUUGExSkVm?=
 =?utf-8?B?MDJCVmVpYjFrTVVZUURQVnhPeU9vbW1IREh0V2hwYU94OVJoV0dtc0tYaHAr?=
 =?utf-8?B?Q1FtTE5ybHRpeDdCc05pc2ZsdDA0dkV3Wks3bWdaUTR0MHdiK2F5QTBGQ3NF?=
 =?utf-8?B?Rk9taklUWkhOaVFXM0JrQXFwRkZFMVRDTHlUU2pSbFdwNmZCUWo3L0IvOU5F?=
 =?utf-8?B?NXNXd0MwVUJWTzJhdTkwbXpUbFhIcEZoK29mbGkwVm9sWEZRcUhWQ3ZPR2Vl?=
 =?utf-8?B?WXFmR2d3bkpRb0NEY2NJY2xZQnlsWE5iRWl1N001NUtqZEczZlNhZzlhQ25o?=
 =?utf-8?B?S3hHTVZNanFuY2VtZHdtUlovK0VNeTNNcm1xSXlrK3QxU1ZWaVFEc21VZXlo?=
 =?utf-8?B?bGp0dnJtMkZkeU5RS0lSMExFanRlTEh6VlpVQW9wQTducTl3eTYzNXkwM1RJ?=
 =?utf-8?B?RTRwTWV6TmxGVFI4ekFMMENRRTd4OXVGaDBBc0puVVJ5Z1RLOGhCVkpVZnFW?=
 =?utf-8?B?S05vT0hORzRMMTNHWlU5dE5nK0IxZE5iak1nVy9IM2lPdmxBYlZ0dlBROXhE?=
 =?utf-8?B?ZjQ0WE8zVGY1anErQkc2M0V6UXRCcTZvSkRxM3REZEZCTnh2VjBhb01ITm4r?=
 =?utf-8?B?Z1pJbEkyMUM4QmIxdWpmT0FKMWtxRG8yVFg4ZFRHUjJUK2hNc1dDVUgwc045?=
 =?utf-8?Q?ftiAbZVKGRIQNgpe4RLfRLG+8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed541126-8faf-494a-93fa-08dc67edf131
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 01:44:43.2918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: glSEt9TkQFNfkaug//GNkUBcY4753TG7mwVUGs1XcB6AECzkuejkdiaGd4jMLS2AorS9dWF0lAN7zL34uPOZxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8362
X-Proofpoint-ORIG-GUID: cK7BNKUr3ABESThKjfKBUBvyzGcyhWhr
X-Proofpoint-GUID: 910i_6_7N6_KZdkqc4MilGNydGNGst6L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-28_19,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 clxscore=1015 adultscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404290010
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 01:44:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110165

On 4/29/24 05:32, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org> On Behalf Of Kai Kang
>> Sent: den 25 april 2024 05:07
>> To: openembedded-devel@lists.openembedded.org
>> Subject: [oe] [PATCH v2] apache2: fix multilib files confliction
>>
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> There are files confliction of apache2 when multilib enabled:
>>
>> Error: Transaction test error:
>>    file /usr/share/apache2/build/config.nice conflicts between attempted
>>      installs of apache2-dev-2.4.58-r0.cortexa57 and lib32-apache2-dev-2.4.58-r0.armv7vet2hf_vfp
>>    file /usr/share/apache2/build/config_vars.mk conflicts between
>>      attempted installs of apache2-dev-2.4.58-r0.cortexa57 and lib32-apache2-dev-2.4.58-r0.armv7vet2hf_vfp
>>
>> Install the 'build' directory to ${libexecdir} to fix the confliction by
>> setting 'installbuilddir'. ${libexecdir} is not populated to sysroot by
>> default, but command apxs requires these files, then add the dir to
>> SYSROOT_DIRS to populate them.
>>
>> And inherit bbclasses multilib_script and multilib_header to fix follow
>> up conflictions:
>>
>>    file /usr/bin/apxs conflicts between attempted installs of
>>      apache2-dev-2.4.58-r0.cortexa57 and lib32-apache2-dev-2.4.58-r0.armv7vet2hf_vfp
>>    file /usr/include/apache2/ap_config_layout.h conflicts between
>>      attempted installs of apache2-dev-2.4.58-r0.cortexa57 and lib32-apache2-dev-2.4.58-r0.armv7vet2hf_vfp
>>
>> Since multilib_script inherits update-alternatives, remove it from
>> inherit line for beautification.
>>
>> Fix buildpaths warning as well:
>>
>>    WARNING: lib32-apache2-2.4.58-r0 do_package_qa: QA Issue: File /usr/share/apache2/build/config.nice
>>             in package lib32-apache2-dev contains reference to TMPDIR [buildpaths]
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>> v2:
>> * still populate `.../build` directory after installed to ${libexecdir}
>> * fix buildpaths warning
>>
>>   .../recipes-httpd/apache2/apache2_2.4.59.bb   | 38 ++++++++++++-------
>>   1 file changed, 24 insertions(+), 14 deletions(-)
>>
>> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
>> index b96e8b4e1..5b170fac3 100644
>> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
>> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
>> @@ -31,7 +31,7 @@ SRC_URI[sha256sum] = "ec51501ec480284ff52f637258135d333230a7d229c3afa6f6c2f9040e
>>
>>   S = "${WORKDIR}/httpd-${PV}"
>>
>> -inherit autotools update-rc.d pkgconfig systemd update-alternatives
>> +inherit autotools update-rc.d pkgconfig systemd multilib_script multilib_header
>>
>>   DEPENDS = "openssl expat pcre apr apr-util apache2-native "
>>
>> @@ -80,7 +80,10 @@ EXTRA_OECONF:class-native = "\
>>       "
>>
>>   do_configure:prepend() {
>> -    sed -i -e 's:$''{prefix}/usr/lib/cgi-bin:$''{libexecdir}/cgi-bin:g' ${S}/config.layout
>> +    # only modify layout Debian which is adopted
>> +    sed -i -e '/Layout Debian/,/\Layout/ s#\(cgidir:\s*\).*#\1${libexecdir}/cgi-bin#g' \
>> +        -e '/Layout Debian/,/\Layout/ s#\(installbuilddir:\s*\).*#\1${libexecdir}/${PN}/build#g' \
>> +        ${S}/config.layout
>>   }
>>
>>   do_install:append:class-target() {
>> @@ -119,14 +122,15 @@ do_install:append:class-target() {
>>              -e 's,-fdebug-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g; s,-ffile-prefix-map[^ ]*,,g' \
>>              -e 's,${HOSTTOOLS_DIR}/,,g' \
>>              -e 's,APU_INCLUDEDIR = .*,APU_INCLUDEDIR = ,g' \
>> -           -e 's,APU_CONFIG = .*,APU_CONFIG = ,g' ${D}${datadir}/apache2/build/config_vars.mk
>> +           -e 's,APU_CONFIG = .*,APU_CONFIG = ,g' ${D}${libexecdir}/${PN}/build/config_vars.mk
>>
>>       sed -i -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
>>              -e 's,${DEBUG_PREFIX_MAP},,g' \
>>              -e 's,${RECIPE_SYSROOT},,g' \
>>              -e 's,-fdebug-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g' \
>>              -e 's,APU_INCLUDEDIR = .*,APU_INCLUDEDIR = ,g' \
>> -           -e 's,".*/configure","configure",g' ${D}${datadir}/apache2/build/config.nice
>> +           -e 's,${WORKDIR}/recipe-sysroot/,,g' \
>> +           -e 's,".*/configure","configure",g' ${D}${libexecdir}/${PN}/build/config.nice
>>
>>       if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
>>           install -d ${D}${sysconfdir}/tmpfiles.d/
>> @@ -143,6 +147,8 @@ do_install:append:class-target() {
>>
>>       rm -rf ${D}${localstatedir} ${D}${sbindir}/envvars*
>>       chown -R root:root ${D}
>> +
>> +    oe_multilib_header apache2/ap_config_layout.h
>>   }
>>
>>   do_install:append:class-native() {
>> @@ -152,20 +158,22 @@ do_install:append:class-native() {
>>
>>   SYSROOT_PREPROCESS_FUNCS:append:class-target = " apache_sysroot_preprocess"
>>
>> +SYSROOT_DIRS += "${libexecdir}/${PN}/build"
>> +
>>   apache_sysroot_preprocess() {
>>       install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
>>       install -m 755 ${D}${bindir}/apxs ${SYSROOT_DESTDIR}${bindir_crossscripts}
>>       install -d ${SYSROOT_DESTDIR}${sbindir}
>>       install -m 755 ${D}${sbindir}/apachectl ${SYSROOT_DESTDIR}${sbindir}
>> -    sed -i 's!my $installbuilddir = .*!my $installbuilddir = "${STAGING_DIR_HOST}/${datadir}/${BPN}/build";!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
>> -
>> -    sed -i 's!^APR_CONFIG = .*!APR_CONFIG = ${STAGING_BINDIR_CROSS}/apr-1-config!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
>> -    sed -i 's!^APU_CONFIG = .*!APU_CONFIG = ${STAGING_BINDIR_CROSS}/apu-1-config!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
>> -    sed -i 's!^includedir = .*!includedir = ${STAGING_INCDIR}/apache2!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
>> -    sed -i 's!^CFLAGS = -I[^ ]*!CFLAGS = -I${STAGING_INCDIR}/openssl!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
>> -    sed -i 's!^EXTRA_LDFLAGS = .*!EXTRA_LDFLAGS = -L${STAGING_LIBDIR}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
>> -    sed -i 's!^EXTRA_INCLUDES = .*!EXTRA_INCLUDES = -I$(includedir) -I. -I${STAGING_INCDIR}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
>> -    sed -i 's!--sysroot=[^ ]*!--sysroot=${STAGING_DIR_HOST}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
>> +    sed -i 's!\(my $installbuilddir = \)"\(.*\)"!\1"${STAGING_DIR_HOST}\2"!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
>> +
>> +    sed -i 's!^APR_CONFIG = .*!APR_CONFIG = ${STAGING_BINDIR_CROSS}/apr-1-config!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
>> +    sed -i 's!^APU_CONFIG = .*!APU_CONFIG = ${STAGING_BINDIR_CROSS}/apu-1-config!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
>> +    sed -i 's!^includedir = .*!includedir = ${STAGING_INCDIR}/apache2!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
>> +    sed -i 's!^CFLAGS = -I[^ ]*!CFLAGS = -I${STAGING_INCDIR}/openssl!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
>> +    sed -i 's!^EXTRA_LDFLAGS = .*!EXTRA_LDFLAGS = -L${STAGING_LIBDIR}!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
>> +    sed -i 's!^EXTRA_INCLUDES = .*!EXTRA_INCLUDES = -I$(includedir) -I. -I${STAGING_INCDIR}!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
>> +    sed -i 's!--sysroot=[^ ]*!--sysroot=${STAGING_DIR_HOST}!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
>>   }
>>
>>   # Implications - used by update-rc.d scripts
>> @@ -178,6 +186,8 @@ SYSTEMD_AUTO_ENABLE:${PN} = "enable"
>>   ALTERNATIVE:${PN}-doc = "htpasswd.1"
>>   ALTERNATIVE_LINK_NAME[htpasswd.1] = "${mandir}/man1/htpasswd.1"
>>
>> +MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/apxs"
>> +
>>   PACKAGES = "${PN}-utils ${PN}-scripts ${PN}-doc ${PN}-dev ${PN}-dbg ${PN}"
>>
>>   CONFFILES:${PN} = "${sysconfdir}/${BPN}/httpd.conf \
>> @@ -200,7 +210,7 @@ FILES:${PN}-utils = "${bindir}/ab \
>>   # We override here rather than append so that .so links are
>>   # included in the runtime package rather than here (-dev)
>>   # and to get build, icons, error into the -dev package
>> -FILES:${PN}-dev = "${datadir}/${BPN}/build \
>> +FILES:${PN}-dev = "${libexecdir}/${PN}/build \
>>                      ${datadir}/${BPN}/icons \
>>                      ${datadir}/${BPN}/error \
>>                      ${includedir}/${BPN} \
>> --
>> 2.34.1
> The above breaks if you use another layout than Debian. We have the following
> in our apache2_%.bbappend:
>
> EXTRA_OECONF:remove = "--enable-layout=Debian --prefix=${base_prefix}"
>
> EXTRA_OECONF:append:class-target = " \
>      --enable-layout=RedHat \
>      --sysconfdir=/run/${BPN} \
>      --libexecdir=${libdir}/${BPN}/modules \
>      ...
> "
>
> and with the above patch it now results in:
>
> | sed: can't read .../tmp/work/cortexa9hf-neon-poky-linux-gnueabi/apache2/2.4.58/image/usr/libexec/apache2/build/config_vars.mk: No such file or directory
>
> Due to the fact that these changes are done using sed with an
> :append:class-target, it is hard to override them in a subsequent bbappend.
>
> Do you think you could introduce a variable for this path, e.g.,
> installbuilddir = "${libexecdir}/${PN}/build"
> (which should be ${libexecdir}/${BPN}/build to match the other paths) so
> that it can easily be corrected if using another layout than Debian?

I am sorry that I didn't consider other layout than Debian. I'll fix it 
with v3.

Regards,
Kai

>
> //Peter
>

-- 
Kai Kang
Wind River Linux


