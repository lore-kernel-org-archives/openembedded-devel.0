Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D3CC433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 01:22:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.22013.1658107361203905439
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jul 2022 18:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=DH1k0k5V;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=4198530481=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26I1IWRW024990
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jul 2022 18:22:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=Eu7E+Jej/PkQoLsKaFG3CjsxWIcLO0oVvKHvuL45rLM=;
 b=DH1k0k5V64OjAN5DCPkKesihD8sH6Py3OR/5r1ab/O8J3BG5vpmqS11/RUnAQpALmDgJ
 iOyl/hZFdAhE60hPfCLiIstvj6vuq5gxuEWzid1xE+3zR6v4/TRMUI92RhvhYnZhcAwY
 5QgkMUkbK+rNt6UbXcA6nLXNQtu2SRHBvkce3GitzIDuZl7wRteoR0axLy4pVEu8goZs
 yFDMbnFRcQE9QT+5kiSsTdsCHL+cdDtrO9yQGPVINypQoNo+HAvTtGoTzWG5EmLZL9l3
 FURA7O1dGQGItWc/lN++so7a8bOwncAgsrRVxML5rzat3N5vgP32CdPrbYJ0B7Rs7Yzq 0A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hbrm80wvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jul 2022 18:22:40 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26I1MeG0000731
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jul 2022 18:22:40 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hbrm80wvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 Jul 2022 18:22:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IN/L5BwS99EHRQrUAdwbjacGhoRkpPkaYblHtVgyu8uU37pjiQ932t61aTFoxGZRDWsty+SXJ3DTkqaIo7Dn7LFr8xv+hBStWErrxdALUotXx5gsKLBJC0vkYxOHjowSS/HehJxKdS4+UF6bsfxmmi3+QbA0Ji8VOlCNm2ZrJ2fxHIBdxkeSMvvNnTyik2xFAFUMJbntrMUH60FHGsJdpxLnzoqakCDLli3+qDymtGT0rnxVonxlOixxMhw/GuVbU/j7l38ML9pnHd8NIV55Sc8kpeQKYpQn81C6W99Fd/wJvZEX04wIse5Eb4tRFhqwb6BXINsczkvT51qksFTmfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eu7E+Jej/PkQoLsKaFG3CjsxWIcLO0oVvKHvuL45rLM=;
 b=M5dDjKyx2KrtIJO33JGEOBpYjELFHLH0JH+S9qy81dTl1k0EVlt20eL7LYXbjRh8VHViWB+cw4YRIEm8eTIufXspGqrLVcWv0gEkDeif2qTyM0iJaLx1DeU0O02yLjtoEdjMyJkASrlzfIpXguntAkgel4L6vwNEyKKw/tt/72GyWsNMjy+sUAlrmUoug8/RAyg68NrZNITHZE4UEEvhV8B5C/bTQl80sdx5+hZ6nJKiaKs4Z4+d4jUMCL3aBLPLz2JmOn0hfdzx74b5x+2GW1sRkL5Zw74KPwntSGj8pSPYD8lITt3uJyH6ujFxaDpStCRzbcHLNCluVy4GhRwFqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by PH0PR11MB4967.namprd11.prod.outlook.com (2603:10b6:510:41::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 01:22:38 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::b15a:47d5:1944:4a86]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::b15a:47d5:1944:4a86%5]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 01:22:38 +0000
Subject: Re: [oe] [kirkstone][PATCH] apache2: upgrade 2.4.53 -> 2.4.54
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org,
        akuster808 <akuster808@gmail.com>
References: <16FCF2B8F548537C.28546@lists.openembedded.org>
Message-ID: <5cc76c28-e047-5cef-ab35-179c4181aea4@windriver.com>
Date: Mon, 18 Jul 2022 09:22:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <16FCF2B8F548537C.28546@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------077F63F7AC7F8868C2B9058E"
Content-Language: en-US
X-ClientProxiedBy: SG2PR01CA0133.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::13) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34f15771-43b7-424a-8320-08da685c006f
X-MS-TrafficTypeDiagnostic: PH0PR11MB4967:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iLKD4Q1nBFPFFmcP66v/9fOW0c7B4o7ouKfm9tGHPxJOgriqzteURoCFfMxy+MGQ6FHIJ1PYEQIOYKR/f/ziq88Ydr5v0DzyUK2JiL6bqvefpa0pxTsm4746pprBwHy6WnZ/aYiaSWUzmge3k+fGmIq4ppJDoNTSKE08UYF1giyN8hnBMTU0OoDvncIdaA3XTI0J2IUMItEt0nCtdrgeoN9DqZJ4EMQIScPa8MKJUApNrq/v9frQ8v9LxEGUsJKdMu+zlwUPaqlsdFOUZj9klHvLjy1uq+yzu1+PHR1Gap5FhA92K/qy2HHK6hTLYCyNuSSkMI6L7ZBsQIW6rg6tdv43lvirItzGeN5o+HfBGd7NhwAV773zPBYxiH8tw1gSxoXr02w0qH5EjTEp2UYO0K+L6QE//OQsWEg3ujLk2N1qOiHp/g5qGA72uGW7bFOCPZPlwOdayysfpIrpt0lU9MUmHd0rBvCtqFGgiRxohXl5KcqbyaaRhT23+rR/b4vLRPCUswdQQqRlurZw7/w5soMuZfbVbB1f69PSq06VLJOcN0RyqDTtzFg7GuL+ZpZshFKH+wfkiRZG8vZdNElg/3HoBcPnSYfF1PQNHFVZx8DUt1Vd/UJN8rZxBKjVWqZtza2fuGqqIpJn1hJ1K6dYVfGqxRNoafY4JkQ3D81vJGkJ1bdffueVApzpwiO2+pEwsFM0dEQEv4Ex4aIQ8vdNSbLi9omPpIV9Lar7Uz8I50Mi7glkd9wgq1WHJtGlETnxVGykNJg3QVpKeAZS0gN41wkcUHpXK1O72j8izl33aiztVPHOwNPpNCrE1dHYtVtsJ10j6eVYABtTztQPqzTYp+th8vGC6hEgCsYZuXyK0Z/W03LHtf45ik1M3p/pQkMIqhu7FiOzS6uxHuV+kBDmELdvvynr2xiCVi9sSm4zFqdWVa+EIr9V+BzJVKbobh3Z
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(346002)(136003)(39830400003)(366004)(8936002)(44832011)(5660300002)(8676002)(66476007)(66556008)(66946007)(2906002)(36756003)(31696002)(38100700002)(38350700002)(2616005)(166002)(6486002)(966005)(41300700001)(478600001)(6666004)(316002)(6916009)(186003)(83380400001)(53546011)(6506007)(52116002)(26005)(6512007)(33964004)(31686004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UkhuZ0hlaXJjV3dlZ2ZGeDB2bndKTlR2WDA5VmoraC94dGFMUXZqbWp3MHN1?=
 =?utf-8?B?Q2x6Q1g0QlRGSGNCcE1VTUF1V1NZZWN0THJub0VpYnJiYlVWZ01mK2k0bDJs?=
 =?utf-8?B?UDl4dmlkNVJiYTZHK2tHa2EvTkJ6ZHBrWjBBWHdmVHV1SXVjcEdEYmZPRGhS?=
 =?utf-8?B?eEJ0b3o2Q2NnTXJiSXFhbmNBYStTVFkrNG1Lajk2VUFoNVRyajRzdUVOcGsx?=
 =?utf-8?B?UytNZGlzemlwVEZEZW1Pd0xVUFdGUEVIWEppWDh6UENLM1dsK3ZnK1JMaHEy?=
 =?utf-8?B?SEI0NFYvNzhVV0JMd2VTTlVaSVhqM1g4T3hTRkIwVHlKWDdGQ0tiVmU2QXN2?=
 =?utf-8?B?S0FiQXpKR3VUVmZ5cHl0bVlqbnJFY3c1TTVoVEZ4SVBMMFJoakhCdi93WExr?=
 =?utf-8?B?bDE4bDc3Q3NaamN0Z1crN2xhc3kvaEdXakpIc2JuWlJrSnQxZXhaL1pmb0wz?=
 =?utf-8?B?Mm83R2FDTkZLNFJXV2NzTXBFM1BXMFp4QXJBaGNtV2MxdklLYU44VW43TTZs?=
 =?utf-8?B?c2NCczB1Z1ZOOVBGZHNOVjlxU3c4Qk1hNDVWSUpsTXBrTlEzek4wQ0x2U1Aw?=
 =?utf-8?B?MXVVOGwxWkk1elczS2p3cVdtS3YySFNtNlZZdGdjc1ljZ3pMak9ZYWJrZ1lz?=
 =?utf-8?B?ZDhtMXlRYmdoaHpLK0s4R3pQdldpK3dYMU9Jank5dnRFeDNBVVBlNkhEZys1?=
 =?utf-8?B?dzRzMVhyNUx3UWhlU0xpbTlRYk41MmhaUTJEbEllbGFSbFFLUVQwSkk0WEIy?=
 =?utf-8?B?eVFUWGxtWWM3WkhtR0JpVTQ3NktnM0tQWm5VZEczZ2lHSzdHVkRBekdrdEYw?=
 =?utf-8?B?OFVZbW9QRkdzK3pBQ2RFQzdnOU9lM1Rkcm5CZk5nRVRoeEhJR1E2TFJnUUtG?=
 =?utf-8?B?cWpxZzgrSkNHR0VCaXM0cEJzL0pCRXRLTFhSbUFvNWJiTm1FVDdWR2VZbFBD?=
 =?utf-8?B?MkRmSmlQTkFLNnhycEZ2czlBOW1sRUJoRGFHNlhjcGxrbXBMN21FRkE1RTgx?=
 =?utf-8?B?RlBHM3VsMVY2MFY4TmlmVkx4eG1JRmFsc1M3WVNxWW00TzFRYnJybktKaWVP?=
 =?utf-8?B?TElNbFE4dGxrWFhLaDlCcGhnRDFWbGpZRmtMV2NZUisxR0h6TEdEQVJac000?=
 =?utf-8?B?cTZCbngyQ2dUOENjVTNvdGlxaGQyYStBKzd4Snd4aDhPMm4vOEJheXV5amxn?=
 =?utf-8?B?TC84SDRXMVlkcEV5MVdpNmlkeVJJNWY5bGtSR1dYRDUvOVA3bjREdkRDeUVJ?=
 =?utf-8?B?aStzRmZJdSthKzhyTytGM3BxOFNxcjZMRWtGSnR6cTh4Y0lRUm5iaGkyeUJE?=
 =?utf-8?B?ZDVSVU9ta2RSMjZzSlk5TzZFcUVHR3JZWmkyRDVPWGpLMFFoMngxck9IQUJi?=
 =?utf-8?B?RC83VGNSODhSUW8xcWsweEY3VzlaNks2Z0xRUDJMczdWR1A0WlhzZFM4SE45?=
 =?utf-8?B?OTF6bGFvSkFzQnFTcnRsZ1Z3VjRnZUN3WEVvSWl3d2xHaGJCck4rNFpweTFB?=
 =?utf-8?B?Z3htSS9HWC9RaGhHSHJ4L3ZrRDVXTVkrT0FPdDlDZXNsRmRYN2tXMTFwVFpP?=
 =?utf-8?B?Tld2ajRxM0g4VFdJSnF3K1Z4azFaSEp2emZhS0VUQ3JBcDJFWmlodzYyMk03?=
 =?utf-8?B?Z0p3enR3RDBzdmZYU2p1N2VVMGpEMnV5K242NHhKZXF0YytuQjREVk9kdWo0?=
 =?utf-8?B?UC91L2kyeGtYTHVvQ0hEZC9LbWJYSEQzQmlPQkJKU2VHRjZCVlRaT0VZd0Fs?=
 =?utf-8?B?K3BxdDhpZTBFZk1xbVFDU21neE0vSkZZS2NMVzEvT1hnVUpxUzcxVHltd1Bl?=
 =?utf-8?B?d1pXZ3pQb1V0RzU2UU1IZitUWm1rN240aWF0ODF1b1NtOW5MdjhHUFIwUHJO?=
 =?utf-8?B?dkhVVXg5RDJOak1kandnY2o0YUdSSXdKQlQ5bU1QbFBFMnEvdTZIallWaHFH?=
 =?utf-8?B?M1hhUThCdEdsWThyVnFtOFV6WTBoRTMzTS9tZnFYMDBtUGtiemE5WjUzMWVn?=
 =?utf-8?B?ZlNnR3N5ZU13T2JrQkUwS3ZhMW8xL01ZQU9McG1aT3dEY05MR3UvV1lSZkl0?=
 =?utf-8?B?VHpTdUxZODBmTTJTeWcyV0IzdkZZQitjNnhwWURER1ZaZ0s2QXlPa2FXWVhF?=
 =?utf-8?B?Uit5eFNLNlVwT29VSkRkV3pJbGRoa3laSlhVUGFXNHducVdya3ZpMUg4MkxG?=
 =?utf-8?B?QlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 34f15771-43b7-424a-8320-08da685c006f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 01:22:38.2746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RZuXJZaUYW79w9Hi8ejjvHRX49C3oSG3vD8B1gZ6KblDyN3Ck/HNwyE1BRKJpiFp5X2S6aLDDofWpApmIusfEWexazUo9PZ0fz2IEkm5E+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4967
X-Proofpoint-GUID: YGBUtwuh3SaY5QID58msWj9ZigOPZmC9
X-Proofpoint-ORIG-GUID: DeVICM_XsHlRTynv2Z9IDjeuGS2rqH00
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_01,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207180004
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Jul 2022 01:22:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97864

--------------077F63F7AC7F8868C2B9058E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 6/29/22 9:20 AM, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> This upgrade include CVE fixes:
> CVE-2022-30522
> CVE-2022-31813
> CVE-2022-28615
> CVE-2022-30556
> CVE-2022-29404
> CVE-2022-26377
> CVE-2022-28614
> CVE-2022-28330
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   .../0004-apache2-log-the-SELinux-context-at-startup.patch | 8 ++++----
>   .../apache2/{apache2_2.4.53.bb => apache2_2.4.54.bb}      | 2 +-
>   2 files changed, 5 insertions(+), 5 deletions(-)
>   rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.53.bb => apache2_2.4.54.bb} (99%)
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch b/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
> index 5d8291968..a652b7969 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
> +++ b/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
> @@ -1,4 +1,4 @@
> -From 37699e9be04d83c5923644e298f400e077f76e85 Mon Sep 17 00:00:00 2001
> +From abd5b40c9b094e721e91a5d75132639149d7952f Mon Sep 17 00:00:00 2001
>   From: Paul Eggleton <paul.eggleton@linux.intel.com>
>   Date: Tue, 17 Jul 2012 11:27:39 +0100
>   Subject: [PATCH] Log the SELinux context at startup.
> @@ -14,7 +14,7 @@ Note: unlikely to be any interest in this upstream
>    2 files changed, 31 insertions(+)
>   
>   diff --git a/configure.in b/configure.in
> -index c799aec..76811e7 100644
> +index ea6cec3..92b74b7 100644
>   --- a/configure.in
>   +++ b/configure.in
>   @@ -491,6 +491,11 @@ getloadavg
> @@ -30,7 +30,7 @@ index c799aec..76811e7 100644
>    [AC_TRY_RUN(#define _GNU_SOURCE
>    #include <unistd.h>
>   diff --git a/server/core.c b/server/core.c
> -index 3020090..8fef5fd 100644
> +index 4da7209..d3ca25b 100644
>   --- a/server/core.c
>   +++ b/server/core.c
>   @@ -65,6 +65,10 @@
> @@ -43,7 +43,7 @@ index 3020090..8fef5fd 100644
>   +
>    /* LimitRequestBody handling */
>    #define AP_LIMIT_REQ_BODY_UNSET         ((apr_off_t) -1)
> - #define AP_DEFAULT_LIMIT_REQ_BODY       ((apr_off_t) 0)
> + #define AP_DEFAULT_LIMIT_REQ_BODY       ((apr_off_t) 1<<30) /* 1GB */
>   @@ -5126,6 +5130,28 @@ static int core_post_config(apr_pool_t *pconf, apr_pool_t *plog, apr_pool_t *pte
>        }
>    #endif
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
> similarity index 99%
> rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb
> rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
> index 8413f5379..4b0ed2f62 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
> @@ -26,7 +26,7 @@ SRC_URI:append:class-target = " \
>              "
>   
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
> -SRC_URI[sha256sum] = "d0bbd1121a57b5f2a6ff92d7b96f8050c5a45d3f14db118f64979d525858db63"
> +SRC_URI[sha256sum] = "eb397feeefccaf254f8d45de3768d9d68e8e73851c49afd5b7176d1ecf80c340"
>   
>   S = "${WORKDIR}/httpd-${PV}"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97614): https://lists.openembedded.org/g/openembedded-devel/message/97614
> Mute This Topic: https://lists.openembedded.org/mt/92057317/3616873
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

--------------077F63F7AC7F8868C2B9058E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>ping<br>
    </p>
    <div class="moz-cite-prefix">On 6/29/22 9:20 AM, Changqing Li wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16FCF2B8F548537C.28546@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

This upgrade include CVE fixes:
CVE-2022-30522
CVE-2022-31813
CVE-2022-28615
CVE-2022-30556
CVE-2022-29404
CVE-2022-26377
CVE-2022-28614
CVE-2022-28330

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 .../0004-apache2-log-the-SELinux-context-at-startup.patch | 8 ++++----
 .../apache2/{apache2_2.4.53.bb =&gt; apache2_2.4.54.bb}      | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.53.bb =&gt; apache2_2.4.54.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch b/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
index 5d8291968..a652b7969 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
@@ -1,4 +1,4 @@
-From 37699e9be04d83c5923644e298f400e077f76e85 Mon Sep 17 00:00:00 2001
+From abd5b40c9b094e721e91a5d75132639149d7952f Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <a class="moz-txt-link-rfc2396E" href="mailto:paul.eggleton@linux.intel.com">&lt;paul.eggleton@linux.intel.com&gt;</a>
 Date: Tue, 17 Jul 2012 11:27:39 +0100
 Subject: [PATCH] Log the SELinux context at startup.
@@ -14,7 +14,7 @@ Note: unlikely to be any interest in this upstream
  2 files changed, 31 insertions(+)
 
 diff --git a/configure.in b/configure.in
-index c799aec..76811e7 100644
+index ea6cec3..92b74b7 100644
 --- a/configure.in
 +++ b/configure.in
 @@ -491,6 +491,11 @@ getloadavg
@@ -30,7 +30,7 @@ index c799aec..76811e7 100644
  [AC_TRY_RUN(#define _GNU_SOURCE
  #include &lt;unistd.h&gt;
 diff --git a/server/core.c b/server/core.c
-index 3020090..8fef5fd 100644
+index 4da7209..d3ca25b 100644
 --- a/server/core.c
 +++ b/server/core.c
 @@ -65,6 +65,10 @@
@@ -43,7 +43,7 @@ index 3020090..8fef5fd 100644
 +
  /* LimitRequestBody handling */
  #define AP_LIMIT_REQ_BODY_UNSET         ((apr_off_t) -1)
- #define AP_DEFAULT_LIMIT_REQ_BODY       ((apr_off_t) 0)
+ #define AP_DEFAULT_LIMIT_REQ_BODY       ((apr_off_t) 1&lt;&lt;30) /* 1GB */
 @@ -5126,6 +5130,28 @@ static int core_post_config(apr_pool_t *pconf, apr_pool_t *plog, apr_pool_t *pte
      }
  #endif
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
index 8413f5379..4b0ed2f62 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
@@ -26,7 +26,7 @@ SRC_URI:append:class-target = &quot; \
            &quot;
 
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3">&quot;file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3&quot;</a>
-SRC_URI[sha256sum] = &quot;d0bbd1121a57b5f2a6ff92d7b96f8050c5a45d3f14db118f64979d525858db63&quot;
+SRC_URI[sha256sum] = &quot;eb397feeefccaf254f8d45de3768d9d68e8e73851c49afd5b7176d1ecf80c340&quot;
 
 S = &quot;${WORKDIR}/httpd-${PV}&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#97614): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/97614">https://lists.openembedded.org/g/openembedded-devel/message/97614</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/92057317/3616873">https://lists.openembedded.org/mt/92057317/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------077F63F7AC7F8868C2B9058E--

