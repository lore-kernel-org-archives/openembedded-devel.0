Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE073C433F5
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 02:08:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.2521.1634695718676141010
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 19:08:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hnJu9Ycv;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=59272ead14=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19K1pqbR010242
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 02:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=rwcNrORmDiawqrOGp5wRjaEon6igV0Y5A9TapIPpyE8=;
 b=hnJu9YcvWaVOiMXgVYA+aBNvjwLJ1EKNK3fTK70GQybfTPtcVGBEbcaBEP0SwY/gcvBy
 NEAYcQoAqj7I4+U6ZwqLxSDIcdEDGsi2DWCjPXDdIiT6YUdhW6Ow1uG8OZmQis1+15Xx
 lSi84cp6Tf7YbYm8hcNLM4Vt3E2q4/gIw+xbzkVvcoBpg5us17NJGgLI43VB0IxB6t7n
 J3Fgo8do29MVuxh5WjA+AT+UgIazthNnCir3Fgog17kz9275UJfuEqpi3ee2ZIIXvYfT
 qaLvP8C6R3KIRUk9y2X32cPJXs7ITufQQGUwfOCtcaFQFNjlFFDMJRLEHyi10FU1VT9D nw==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bt6pg83y4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 02:08:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLRBtYQEakH2ileuVRnxZRS99h0PVcHN0rYgSyawYxejkwOLmMXBnt6LHZBDloCXB9TSIGSI51dFDnhKwrajE5PjKGKZVatNCn/0qeBsEhpvrwq+pFf5Dkc+5hioGwocKywlSYxO3kFex8Ih4xhKCPkjp20G/7sPcOrif59uQNhcC68s1FyOTntd6TAO/E2e2gaTyMeX7mJPYSLjTJ2z6YOMUt7mwXlAgOc1oXyanLky6rRWQNIugWlIlVj69jfw6f9FnxmFa2yuGBFjpGnLCFMOHDwerd9q4b3z5m2xXoLF3VL+d8RCLMw4VxPEo6x4JDPZ/6hiJh09EWVuTkiiIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwcNrORmDiawqrOGp5wRjaEon6igV0Y5A9TapIPpyE8=;
 b=GjHIL+c8zRwb1j1BdDAOS3lKaoK2BMRdsg2zsthPf+DeC/V9WbacqF9yjM9nNYWPeJPq3nWZK6175NZubguh20SHjeC9aKm2JzzneBqYE0Ap0srhfaKgdIHi+zLWgAp/77aJb9ED8io5ZIxfren+FoKwP3qXT/5yHdIlVpxoMOvUcKmli45zHIVp38NsiOJa1Q0AGexnFKB4k4Y221w4nSJ8n3ROSdobu7TXFh3yb4YgeRYbpkusYntM4/DhfWLnZS6g+VURuKuuE9P8pI3q4rTFUOMF0RIKrwgg4Uw7cdnCurPkr/ZvCX3Lca4ycqIfFce3b2DCKKMiGQICUveK4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB2896.namprd11.prod.outlook.com (2603:10b6:805:d9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Wed, 20 Oct
 2021 02:08:35 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::a544:19b6:196b:f339]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::a544:19b6:196b:f339%5]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 02:08:35 +0000
Subject: Re: [oe] [PATCH 2/2] postgresql: upgrade 13.3 -> 13.4
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
References: <20211011033745.32284-1-changqing.li@windriver.com>
 <16ACDCD603E52F57.10559@lists.openembedded.org>
Message-ID: <d3819130-968e-6ac4-41ed-eb2fd1493573@windriver.com>
Date: Wed, 20 Oct 2021 10:08:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <16ACDCD603E52F57.10559@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------F4F9E8B03D2D579A0FFF9A4B"
Content-Language: en-US
X-ClientProxiedBy: HK2PR06CA0019.apcprd06.prod.outlook.com
 (2603:1096:202:2e::31) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
Received: from [128.224.162.189] (60.247.85.82) by
 HK2PR06CA0019.apcprd06.prod.outlook.com (2603:1096:202:2e::31) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17 via Frontend
 Transport; Wed, 20 Oct 2021 02:08:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c59820a-451e-4c26-3583-08d9936e8628
X-MS-TrafficTypeDiagnostic: SN6PR11MB2896:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB28966122F0ACEFB7E475394482BE9@SN6PR11MB2896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:312;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YgJn1rHjEzEZv0vixihlYzgfA8nrzf++jLNhjLs4Rx4wjQvmkiXObYZ3WZjHugAL+dvuTln547B96L/g+V0fCUo+MDQ7ZZaCgGAMyewDKtUr9ypc2k65prmvBMiFuhJW7Ww1fAf4yp+JaV485iOmbe/VRV+Ki/DieDUsKkhGvlUuqMgEFW8qzB/R1LkqeDcUNOnxfkbIJcr5afUfXlQ43vYocLhlGYKe1G888gsRvLNwTCoPAQkI+qFJTlLL/wKj/r/C3QFMPxDIvwW1CscLQ1eBKCUgnF0wGJNfdkAnTCwseEzcbXReFtv3zFZQK6yN8yr9vD4tv38kNfE5CTJepVSI/hIwDzdCgVtWjkyLD6btWCmKcCwEBpElmpJ3SHd7kLvwpQjKnmiZwGKxA1PkC5kd4xfSoBbDKGp4+4b106uThyim79b2IGWTR4k6qarKIKLq3R8bHuHskxoUbLSSveI4uHqT20yn+FB4UsC1+MHA8C3HtWu8z6Tn6jrzd9/vbZmAdZLVEzd9bXKVPEAF8V2I97LZ6LO766CPyCG9ipZo/JTUf3U1cxdMhm+72zjw2Z06jSHsOszKLV7OZ+PmUIcnQQkzsrVcZxonD7WG+lUcYI3RsY7jAMq226m7YLLDglziA77YJhLwdptadSLc+9cVYzrYAEnrQkz/LwCbYQEqlhzHRShxfFecv4zgNNcfjR6WD5BIKpTR+jTDmKXf1NdPDVrfydP0J4f/jM6rEsGwxMTN91+wvjCIftL4uIGxwfhUAkfYfL+cUUnoi7DYzbtYs6BFNwmashFhhIC5lyGssrfh4o6ma1ngkhVUsqyNOG2SMjc9muBfTQBVrvMkECw4NrL9NBsOIL4opVIF8cJsxVB5BtWBaoByRB0o5oVBZLXDOHObm7dcXWcHEU2fN8/MVxjzWXNhqChYFbLtZew=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(26005)(52116002)(6706004)(6666004)(66476007)(33964004)(38350700002)(44832011)(6916009)(8936002)(31686004)(83380400001)(966005)(66946007)(316002)(16576012)(956004)(36756003)(508600001)(53546011)(6486002)(86362001)(166002)(38100700002)(8676002)(5660300002)(2616005)(66556008)(2906002)(31696002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ajBHU0NFdFFiOGFuOFVPVTBDWkw1blZNVGwxakd5MFUzOWJ4c3U4cFcwNXhQ?=
 =?utf-8?B?ZTJJTFYwMTlzV3lUUWh6UGxKbVk4ZzVrckw1TStTczVSZEpEUEh3Yk4xQ2l4?=
 =?utf-8?B?NjZ6eEh3elR2c3hKazIyRXppSFNsOFBrVGgvcS85amdIMnVvUkN4dzUxVmpG?=
 =?utf-8?B?ZjdtR3QzNUNEazRSWnBEbU1rSmRMQ1gxYkFKS0FacmxwSFhnejB4M1QraFlC?=
 =?utf-8?B?czBJcnV2aU00NG0zQzFySWxOUEtIMk5SS2RFRS9Fdk9Pell5YkZCS0pIenZz?=
 =?utf-8?B?TEdTcFRyZnUybFF2THgrWE52cGdTcjJ4djE4VjRsazJYL3NOSitUVHVzSjJ2?=
 =?utf-8?B?d1ZqU2tuT0VNQVBDTXpQM2cwWUZXU1FCMGxRWHozSEpUTVlQdCtnVTJ5Tjl0?=
 =?utf-8?B?Ym5jenBHS0ZlWjBmaFA4aU9XSFRMVFkzT2YxSjhZaUM3aURrUlFJZElVNmgz?=
 =?utf-8?B?cnI2RTdKS3NKWW55d0hmNnc3WXJzeFNQMVBIbXR2S1JCYXVic3VxaEI4TUMw?=
 =?utf-8?B?c3RRSVdFNHZIeHdiU2hsVmc4dWRUb3M5dWJBcWVLaTZiaC9ybE1LdDV5TEVm?=
 =?utf-8?B?RTVWZ1RwZkxxKzVHOG1sNWlhbEM4ZmtxdjROcXNNNFR2RkdQWllGSDVJeFUw?=
 =?utf-8?B?TXRsc2h1Y0dDTnY2dVdTR1d4L2tLOVRzUmE3YWx4TVpmNEdCVlp1ckJzaVh4?=
 =?utf-8?B?ZnNHYkQ3QmxiL3A1WHFNbktQOGZxZHdnZDJuUUVyU3JOeUZZaVRtQndWTCtq?=
 =?utf-8?B?UDc0NllOOFZINkpJdHlVMGYxZHk4djBFdk96cDhENmZCdUZFUUF4M290eG1s?=
 =?utf-8?B?NUhlVW8rWlVtWHpTcHdRRWRITTBEczJwNlFoMWZxejU4WmZvOHZaSlVIN2ls?=
 =?utf-8?B?cThFRi83V1dLVVRFbDZtRUdWNFpGZVFBV0dLV0I1dnFBWE9nbjhnbFBJbGZ5?=
 =?utf-8?B?NDdqMDJCQytsSlM0MXBON0lWemt6eGRFTHJ6Q2FIRlYxNGk2SEc3VkFIN0xM?=
 =?utf-8?B?USsrSTQ4d29EMXJuSFFYcmJ3MGlBdDhpT0ZZbnhzK2VJbit6QnVxalRzRk1K?=
 =?utf-8?B?K2tQZGg1Z2FCT2xwVTh2VDZxbXN2Rkt2M3BtakxsKzREajNzRWtOMERJY1VB?=
 =?utf-8?B?UFFSQnZkMlB0NEpJV0pBQm1Hd2JtTUZkNUswNUxJSEhFeXpzWDdXc1JVZ2ZW?=
 =?utf-8?B?WFZlL3h5c1NPTWYxakJJeUVzNktJTkF6MFd0U3Z4NmVrVEpUUXFvUy9vbmlo?=
 =?utf-8?B?WUhzSnNlb2tqaW1iUEd3SUhxUUMya1lTck9RaWJMUzFqVzVDWWx4WE1naklh?=
 =?utf-8?B?d1FXb1k4MExQWjRleEFlUUIyMThOaDRJbWV0SXBBTmUrWitXVmMyZmJGWUVE?=
 =?utf-8?B?MG4rRkNJS0lqWHZBTUJFU0xKbi9aS1VtdTFXbEE0Y3ZpNkRyM3FncE5hNVR2?=
 =?utf-8?B?V0pTOFFBY0hWcmhSRllFNVA1b1dGQzVBZXRzVDV1L3BhT1k3Y1BmK1phcmhp?=
 =?utf-8?B?clV1Q1JPVk40KzVsRGptM2dSUzMyUmZuMXNXNnJHUWlRZC9pWXE1RlR4WUNX?=
 =?utf-8?B?MGt3NHQwUWFEOHJRUHVHSEVZbFl0RExHUDRTQ2lJTEI5bEVLOXVxUWpNWjVF?=
 =?utf-8?B?STBkamZxbnJ2bVhOMEhjYUZPN2g3VGNQbWlHYnVpdFRJbnRSY2xwQ1Y0Z1lQ?=
 =?utf-8?B?QVl0N3Y5RkUwaDVzU1lkOWZCRUFnS292MFZtU3g5VjhVd0hFTGlPUUt2T3dz?=
 =?utf-8?Q?tqNZ82iLWydWNSm9H0Igpl/3y+iqxHnCB4tIdBL?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9c59820a-451e-4c26-3583-08d9936e8628
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 02:08:35.7242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nezd/j2L22BRYqXQO889KOCACjDO10ZjYE5GJpIsLOas72T+Fga3596/S/N+V+SXmxzP+/+qrabFMGYQdY3ENKKbfFmYX3dciKBZCnwsFuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2896
X-Proofpoint-GUID: 350JNkV25oxPfO1HW70xFkkJA_IVZ-G4
X-Proofpoint-ORIG-GUID: 350JNkV25oxPfO1HW70xFkkJA_IVZ-G4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-19_02,2021-10-19_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110200007
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 02:08:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93476

--------------F4F9E8B03D2D579A0FFF9A4B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 10/11/21 11:37 AM, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   ...figure.in-bypass-autoconf-2.69-version-check.patch | 11 ++++++++---
>   .../{postgresql_13.3.bb => postgresql_13.4.bb}        |  2 +-
>   2 files changed, 9 insertions(+), 4 deletions(-)
>   rename meta-oe/recipes-dbs/postgresql/{postgresql_13.3.bb => postgresql_13.4.bb} (78%)
>
> diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-autoconf-2.69-version-check.patch
> index 45f283a02..db9769f82 100644
> --- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-autoconf-2.69-version-check.patch
> +++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-autoconf-2.69-version-check.patch
> @@ -1,4 +1,4 @@
> -From 7177d8334a3c28ab0ec5c90e0656f43414929659 Mon Sep 17 00:00:00 2001
> +From eba2c940afcd83521f591ccf6b49eca06908ea8e Mon Sep 17 00:00:00 2001
>   From: Yi Fan Yu <yifan.yu@windriver.com>
>   Date: Fri, 5 Feb 2021 17:15:42 -0500
>   Subject: [PATCH] configure.in: bypass autoconf 2.69 version check
> @@ -12,11 +12,13 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
>    configure.in | 4 ----
>    1 file changed, 4 deletions(-)
>   
> +diff --git a/configure.in b/configure.in
> +index fb14dcc..a2b4a4f 100644
>   --- a/configure.in
>   +++ b/configure.in
> -@@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch un
> +@@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
>    
> - AC_INIT([PostgreSQL], [13.3], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
> + AC_INIT([PostgreSQL], [13.4], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
>    
>   -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
>   -Untested combinations of 'autoconf' and PostgreSQL versions are not
> @@ -25,3 +27,6 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
>    AC_COPYRIGHT([Copyright (c) 1996-2020, PostgreSQL Global Development Group])
>    AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
>    AC_CONFIG_AUX_DIR(config)
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_13.3.bb b/meta-oe/recipes-dbs/postgresql/postgresql_13.4.bb
> similarity index 78%
> rename from meta-oe/recipes-dbs/postgresql/postgresql_13.3.bb
> rename to meta-oe/recipes-dbs/postgresql/postgresql_13.4.bb
> index 862dd61bd..f63d23dbe 100644
> --- a/meta-oe/recipes-dbs/postgresql/postgresql_13.3.bb
> +++ b/meta-oe/recipes-dbs/postgresql/postgresql_13.4.bb
> @@ -9,4 +9,4 @@ SRC_URI += "\
>      file://0001-configure.in-bypass-autoconf-2.69-version-check.patch \
>   "
>   
> -SRC_URI[sha256sum] = "3cd9454fa8c7a6255b6743b767700925ead1b9ab0d7a0f9dcb1151010f8eb4a1"
> +SRC_URI[sha256sum] = "ea93e10390245f1ce461a54eb5f99a48d8cabd3a08ce4d652ec2169a357bc0cd"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93212): https://lists.openembedded.org/g/openembedded-devel/message/93212
> Mute This Topic: https://lists.openembedded.org/mt/86229291/3616873
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

--------------F4F9E8B03D2D579A0FFF9A4B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>ping <br>
    </p>
    <div class="moz-cite-prefix">On 10/11/21 11:37 AM, Changqing Li
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16ACDCD603E52F57.10559@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
---
 ...figure.in-bypass-autoconf-2.69-version-check.patch | 11 ++++++++---
 .../{postgresql_13.3.bb =&gt; postgresql_13.4.bb}        |  2 +-
 2 files changed, 9 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_13.3.bb =&gt; postgresql_13.4.bb} (78%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-autoconf-2.69-version-check.patch
index 45f283a02..db9769f82 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-autoconf-2.69-version-check.patch
@@ -1,4 +1,4 @@
-From 7177d8334a3c28ab0ec5c90e0656f43414929659 Mon Sep 17 00:00:00 2001
+From eba2c940afcd83521f591ccf6b49eca06908ea8e Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <a class="moz-txt-link-rfc2396E" href="mailto:yifan.yu@windriver.com">&lt;yifan.yu@windriver.com&gt;</a>
 Date: Fri, 5 Feb 2021 17:15:42 -0500
 Subject: [PATCH] configure.in: bypass autoconf 2.69 version check
@@ -12,11 +12,13 @@ Signed-off-by: Yi Fan Yu <a class="moz-txt-link-rfc2396E" href="mailto:yifan.yu@windriver.com">&lt;yifan.yu@windriver.com&gt;</a>
  configure.in | 4 ----
  1 file changed, 4 deletions(-)
 
+diff --git a/configure.in b/configure.in
+index fb14dcc..a2b4a4f 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch un
+@@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [13.3], [<a class="moz-txt-link-abbreviated" href="mailto:pgsql-bugs@lists.postgresql.org">pgsql-bugs@lists.postgresql.org</a>], [], [<a class="moz-txt-link-freetext" href="https://www.postgresql.org/">https://www.postgresql.org/</a>])
+ AC_INIT([PostgreSQL], [13.4], [<a class="moz-txt-link-abbreviated" href="mailto:pgsql-bugs@lists.postgresql.org">pgsql-bugs@lists.postgresql.org</a>], [], [<a class="moz-txt-link-freetext" href="https://www.postgresql.org/">https://www.postgresql.org/</a>])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
@@ -25,3 +27,6 @@ Signed-off-by: Yi Fan Yu <a class="moz-txt-link-rfc2396E" href="mailto:yifan.yu@windriver.com">&lt;yifan.yu@windriver.com&gt;</a>
  AC_COPYRIGHT([Copyright (c) 1996-2020, PostgreSQL Global Development Group])
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_13.3.bb b/meta-oe/recipes-dbs/postgresql/postgresql_13.4.bb
similarity index 78%
rename from meta-oe/recipes-dbs/postgresql/postgresql_13.3.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_13.4.bb
index 862dd61bd..f63d23dbe 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_13.3.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_13.4.bb
@@ -9,4 +9,4 @@ SRC_URI += &quot;\
    <a class="moz-txt-link-freetext" href="file://0001-configure.in-bypass-autoconf-2.69-version-check.patch">file://0001-configure.in-bypass-autoconf-2.69-version-check.patch</a> \
 &quot;
 
-SRC_URI[sha256sum] = &quot;3cd9454fa8c7a6255b6743b767700925ead1b9ab0d7a0f9dcb1151010f8eb4a1&quot;
+SRC_URI[sha256sum] = &quot;ea93e10390245f1ce461a54eb5f99a48d8cabd3a08ce4d652ec2169a357bc0cd&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#93212): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/93212">https://lists.openembedded.org/g/openembedded-devel/message/93212</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/86229291/3616873">https://lists.openembedded.org/mt/86229291/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------F4F9E8B03D2D579A0FFF9A4B--

