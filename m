Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE09C7EE21
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 00:30:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7709.1683073801790242160
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 May 2023 17:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=sTTudoPt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=448760842c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 342NU3Or013714
	for <openembedded-devel@lists.openembedded.org>; Tue, 2 May 2023 17:30:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=a+rx0LnP8qMqMO5Dgu1mey2ZSLvoqsUzYEeB6Fii7b0=;
 b=sTTudoPtQwIXAhJtOq5iH9VyVRzLU4cMCw9NPKiJva7mrHwtTdHKd4/FE1yfmpQFmhCE
 WE4eTizy7DUe2Ig9N620EqoYfbub61KlfybFjqQKpwrlexhCeDzLad38lG5TuCyRKFhK
 XIQMGRXvTJZfv7NipUnQhpKCKkBjOOhaDZ0lozzA+o/XxlguSj9lVvpG1b5wHgh0uy+N
 PcOucwz7fzmew0/CVm8P+0F6UDEAFfDCEgNdJ30JJnFNo98PY+bM0XwtwvbnSuPf8yh9
 rEzi480YpyRuZ4aGANOricuBk8LbaL33K3Cs9bYIBnd7PtU6OiO48x9op3gBB/SOWtmr yg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q92rnb11n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 17:30:00 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3430U0oQ014316
	for <openembedded-devel@lists.openembedded.org>; Tue, 2 May 2023 17:30:00 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q92rnb11j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 May 2023 17:30:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=abNFtzU8NsPZ+7LZAUr+ruxQk2ZumDT9Ei0yiQeeb/sZaZ1RJcf7vxLYcHDHzrYlt9Ybmnrbo97rPMisitUQTVv5zLrooNGPdmCGWYyAxr2iu09kT9zOtTgAmz8Vd8wochQsoGmZoq1pgV4ycIn2I6O5F9QzEIMMtOplEAnoeEl2f2lX5OP924RiFeqeaUOU14RE3Ff42Q9hlHhLmKasY96TcLzBx6xKAVptuVRcXWzqrCYoFuZhnmW+sP7G6YlgvgPqcuhkQQbXJXBlUsNgGLGQbmdorOrHoF92icxfyQMY3a2iLb2OEuqUBVv8bx7pEGeYTmX6CWxNL60oMAUovg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+rx0LnP8qMqMO5Dgu1mey2ZSLvoqsUzYEeB6Fii7b0=;
 b=PMnssbkyBA9QfhGl5hbVKMBCdryw/6mvb2sIPm17Ww3+84gmvtvzBHGlexXWyruTmzUntbxJTcJsqyOaFK0T36BkEjjfR5ODsg30MFeQ95LekLHpFCpLbw/f20Qk94A+b5UDVqS0U+cP1fR3SoONj9J9/tZ8WDaMd92P0e+vSnhsBA4L3cGigX3OoKYpGQ528a6wDoN2MFomQqf5sPXsUNdOUcNao+Y3MqBJ/HVEzQTYeoYxQUyRM3zoyO2VpbA3f503QFpqFlG+ilxb9gZ9nKyZiikP/c88TYCxMzaPkhkkdEXYiOTdct5spgn8tu9XRXYKabnWEqEJ8UFJ+O/+HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB3998.namprd11.prod.outlook.com (2603:10b6:208:137::21)
 by SA1PR11MB6661.namprd11.prod.outlook.com (2603:10b6:806:255::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Wed, 3 May
 2023 00:29:57 +0000
Received: from MN2PR11MB3998.namprd11.prod.outlook.com
 ([fe80::bfd4:5bb6:b790:80e1]) by MN2PR11MB3998.namprd11.prod.outlook.com
 ([fe80::bfd4:5bb6:b790:80e1%5]) with mapi id 15.20.6340.030; Wed, 3 May 2023
 00:29:57 +0000
Content-Type: multipart/alternative;
 boundary="------------55zT8r5MWMazCV7C0ryCttIU"
Message-ID: <87ce05ec-ff31-146a-a675-cd815a1651c1@windriver.com>
Date: Tue, 2 May 2023 20:29:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [oe] [meta-oe][kirkstone][PATCH 1/1] python3-werkzeug: fix for
 CVE-2023-25577
Content-Language: en-CA
To: narpat.mali@windriver.com, openembedded-devel@lists.openembedded.org,
        Armin Kuster <akuster808@gmail.com>
Cc: hari.gpillai@windriver.com
References: <20230502133352.2074733-1-narpat.mali@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230502133352.2074733-1-narpat.mali@windriver.com>
X-ClientProxiedBy: FR1PR80CA0059.lamprd80.prod.outlook.com (2603:10d6:202::21)
 To MN2PR11MB3998.namprd11.prod.outlook.com (2603:10b6:208:137::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3998:EE_|SA1PR11MB6661:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d990432-4945-424b-aa74-08db4b6d8583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5IcVpZouUWrTrwbZDz8ZyYIA/cM+yQvgCKHGJMxsgOKkESQAdYu2cwr1b7zgtVWyUB/Mg4UKliKBP72PXmhQKNuUwinrkAVdJblBnxHsF3zzanak5z1Xosvf6oaXN/iKIESmdHvz7sLYe4uob9vfUxylbJkyvC5uVA3cBn/RZiEDSXmot2GN+c/4kSvR1m1KtehXtZ94bn7H+dyHPfqLbE77lKX1dcpo37HNmOOD8GWSTFSKx+2kOUhml/7KpkKO/egsG2gaMGNzMINAgZEIYAKGq2asdfSYVNK36mDLpFgcmRol91g3G+7v3GoqjFj23zgavYYRGrSaGVONnBQFtDOmbvRHiJABh4qtfMZ4nyu9CBQLSt1PA3GEeosF6IXz29s1ftRM0ESTwuGAbGQsdByrollV215CndIWcEml/vdtjruhUegvlqWnji3eSlCOYKqHOZVsGdRicZePpL+JLFvKhDBOgCUpKIxxVe8d5o2p7OELBwQ1CD4s6zvJATZPbkPfq3jqOyV1r+jp3GIKI43ySLB/zdS+Y5yhXaJtCLVQtSwST0eKcBPojtUp/yW88D3Dov7RNqtjqWVmXu8CDFTMq/3J6eRXLWpz/fyJwNMxymjsgUKF0f745RNdcoH4VeGxfIEdhJUHU2I0cjtw/u9px6gX0XkYLWSj2QSYJgU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3998.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39850400004)(376002)(396003)(136003)(451199021)(31686004)(186003)(30864003)(38100700002)(2906002)(31696002)(478600001)(966005)(8676002)(8936002)(26005)(6506007)(6512007)(166002)(5660300002)(53546011)(66899021)(41300700001)(6486002)(33964004)(2616005)(66946007)(66556008)(86362001)(6666004)(83380400001)(6916009)(66476007)(4326008)(36756003)(107886003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cWFCTVJGekFscEVRZ3NnZUwzZDNnOCticnlPNExtbHovaXkybEVVdUpld3ox?=
 =?utf-8?B?NHFFNWJPL01ROFhFcHl0Um9sRm1nSXhhY3hObHJhVHN4UVJwMVJIQlRHd04v?=
 =?utf-8?B?RmprMHlYMUdCdlhjM0RRMHBranFzT084RjY0clA3dGtlY2NFbFQrSDcvQm9y?=
 =?utf-8?B?N2g2elplZEthb0ZobVpuZmFKT3NtcHpHTmdZdDEwcnVuV1EyQmt3SC9JK2ZE?=
 =?utf-8?B?dldadVlFYUsza0tmYWFBZy9FalZsUmszbEZZcHhvTGpMcVdIaURzbmE2MWxo?=
 =?utf-8?B?UUVyTW1vQXNnd25TVVlRVVhibW43bFJCZjdiUnF0d0c0NUxHQ1RoYlJTeUY1?=
 =?utf-8?B?aUdVZG9JSENRUTJzeWpWaGVsck45UUJFVU9CYkVyS3FlOW9KVFBOWWkzTStX?=
 =?utf-8?B?RlpKbHlQbjhIL29ieHpubWI2Tk5PWFFLNXNPOWM0TUI1Q3hEUHhNZXhzVVVI?=
 =?utf-8?B?WFV1Qm5sOFVxQThNS3AzQkxCNUFOMGIwZkp5UlJ0ZWVxU3hxdE9LZW9JYk1J?=
 =?utf-8?B?SDExc3ZzZ0VVVUxJZVRwaTB4bnhKcWdyVVBwVEZ2R2xsVENnQUFKbVFVN1Fn?=
 =?utf-8?B?aXh2NmRhcGlOL0pkRUlwNTlnWXgzSDJ1WHFjd2NxdXVpWTZwSHVWSGYrY0hY?=
 =?utf-8?B?ckZad0lBamlOV2FRVjlBelBYYkRsU0F0U0Y1T0o3Q0VLRTNSUkEzam0rUG5y?=
 =?utf-8?B?WmVoMnc0QnBicnZQcm1JZWU1WDJRSWI1dWhZR3FxSXgzU2t0NXhRTlQ0UWhZ?=
 =?utf-8?B?eXJGMXN0anBSdTBGYkJmc00veGY2SWp5Wm9ocDY5TWU4S0ljSldyRHhuZzh1?=
 =?utf-8?B?YmZBZUNJQStXNXlNclp4cjl1dWUxQzBDVGxzRHBaQi91NVN3VTVFanFEVS9J?=
 =?utf-8?B?K3l1eUhSblJRWTE1cG5VRDY0djBiaTNRMERndmxSc2crYVQybWQ5Z3g1eGs1?=
 =?utf-8?B?N0N2cmRiKzErUm95NlVJaWR6TFc0cWZuTkN2Z3YvRGsxSjBUSnNUZEJYTWpy?=
 =?utf-8?B?Nmt2bWllb255TEgrZmNneWVSNVRnRGNwS1FKR0paMlExbXVoQ3hWNVNENFBX?=
 =?utf-8?B?YTdBOG4yblIxaUd0dHJ0emU0aGNFdUJKYTdFKzhLaXU5SWpsM0R0dHlWVHZT?=
 =?utf-8?B?YW9RTm40dy9DVkJWUGhDTWhOdm1YVzk2OEhXWHNwLzI5WXMrS2JSdG9PODVJ?=
 =?utf-8?B?OElvQjIzdFFHQ083aE1kRHdrQWhzajJCdjRwK0phR2hyUHhiRTNHSzdpdzdI?=
 =?utf-8?B?a2p3SWo5QW8rYmlCQzB4Q1JzclNHeWlqMnlzNGYzVnJhNFhPcjVkdWJqdHdj?=
 =?utf-8?B?d3kyZE1qWmdLYTZrMHhvUHdmeG8xM2hPUTg3VFlLQUEvVGhITElIZy9oeE9h?=
 =?utf-8?B?WVZQVE16bmtHYXdkRzRZcGFCOUVDanhGU1l0TTNacTdmeUcvNUt4eXovakVM?=
 =?utf-8?B?KzdmaWRwL2UwK2V3SDhHMS8wMXRhUlZlMXF5U21rcTdjUzJJVVZQcWpORTZO?=
 =?utf-8?B?SHZKbFQyN0o2bTFOeHlaRXF1R0xQaFNib1ROYXBzWFVxbEhoOVdNZWJ3MVVF?=
 =?utf-8?B?cmVzMDJ3Wm5POTlGSGVET1A1NExkcHdYSWxWTzRvRytyRERQSEsvdFRxazBD?=
 =?utf-8?B?dTQwQWlDVldEZ3pzR0M0Z3hsQ3g3RlZpQS83K0hoYWttSk5sYmRHZzN2emE2?=
 =?utf-8?B?YW9Ta3VML0tkZmdPOG1vTFJWTVFIUVpraEhMajI2VWdEeGt2MU01a25xRHBu?=
 =?utf-8?B?bS9adjh2UG9oTW9lOU9qbTZzaS9Ycmc1c2dKZ1RkTmR0dUNRUG5hWmllNUhU?=
 =?utf-8?B?SmdGTUl6MGtEZXg1U0FhV3FOenlxQWFtNHpWYWNFZTZCQkZLZDlDdW5MUVNw?=
 =?utf-8?B?VEVtVFlmR0xGbjJqN04wU1I1OWhBd2taSEVwTWluNXV2UlNUaVVxTGRiUFpG?=
 =?utf-8?B?VDFlNFRCRDZLUUM5WVZLR29RK1lOOW1kODFTR3FzekkrTVR1WVFUdDRhTExG?=
 =?utf-8?B?Ry9wbUxuM1NqT09kKzlJNnpZaEl4Ui9RR1NhKy9lMTc3QWxZZURnUmNKdVJY?=
 =?utf-8?B?YUc0MVU5VitXK1YyS3R3Y3JKSis3U3o4djJIN0dHd2xiOEhpTm9qRE9CNjEr?=
 =?utf-8?B?L3RTQWVtTm9QOURJNFYxdFUxMTZxWFJsdkk4WlhFemtZaEttU1ZSVnZpS1NG?=
 =?utf-8?B?UXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d990432-4945-424b-aa74-08db4b6d8583
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3998.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 00:29:56.9143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mRtPPSoD+ErsY3Wi0VJCzJDuPq/zXtyucUJaYNDvvOVpE5jeowq7ZilzoIFhtLWQ07r4InA1977Xc8YyGZc8ZWwSlRr4LzTvmgKkrTyoq3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6661
X-Proofpoint-ORIG-GUID: jYwkFuDyql08xMLEhxd4uLp19eM0accS
X-Proofpoint-GUID: 9EVJHY63xPJDC4vRPXTkapyxyZeNNiS0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_13,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2305030001
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 00:30:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102283

--------------55zT8r5MWMazCV7C0ryCttIU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 342NU3Or013714

Added Armin.

On 2023-05-02 09:33, Narpat Mali via lists.openembedded.org wrote:
> From: Narpat Mali<narpat.mali@windriver.com>
>
> Werkzeug is a comprehensive WSGI web application library. Prior to
> version 2.2.3, Werkzeug's multipart form data parser will parse an
> unlimited number of parts, including file parts. Parts can be a
> small amount of bytes, but each requires CPU time to parse and may
> use more memory as Python data. If a request can be made to an
> endpoint that accesses `request.data`, `request.form`, `request.files`,
> or `request.get_data(parse_form_data=3DFalse)`, it can cause unexpected=
ly
> high resource usage. This allows an attacker to cause a denial of
> service by sending crafted multipart data to an endpoint that will
> parse it. The amount of CPU time required can block worker processes
> from handling legitimate requests. The amount of RAM required can
> trigger an out of memory kill of the process. Unlimited file parts
> can use up memory and file handles. If many concurrent requests are
> sent continuously, this can exhaust or kill all available workers.
> Version 2.2.3 contains a patch for this issue.
>
> Signed-off-by: Narpat Mali<narpat.mali@windriver.com>
> ---
>   .../python3-werkzeug/CVE-2023-25577.patch     | 232 +++++++++++++++++=
+
>   .../python/python3-werkzeug_2.1.1.bb          |   2 +
>   2 files changed, 234 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-werkze=
ug/CVE-2023-25577.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2=
023-25577.patch b/meta-python/recipes-devtools/python/python3-werkzeug/CV=
E-2023-25577.patch
> new file mode 100644
> index 0000000000..02109c2050
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-255=
77.patch
> @@ -0,0 +1,232 @@
> +From 5a56cdcbaec2153cd67596c6c2c8056e1ea5ed56 Mon Sep 17 00:00:00 2001
> +From: David Lord<davidism@gmail.com>
> +Date: Tue, 2 May 2023 11:31:10 +0000
> +Subject: [PATCH] Merge pull request from GHSA-xg9f-g7g7-2323
> +
> +limit the maximum number of multipart form parts
> +
> +CVE: CVE-2023-25577
> +
> +Upstream-Status: Backport [https://github.com/pallets/werkzeug/commit/=
517cac5a804e8c4dc4ed038bb20dacd038e7a9f1]


That's the merge commit:

=E2=9D=AF git show 517cac5a804e8c4dc4ed038bb20dacd038e7a9f1
commit 517cac5a804e8c4dc4ed038bb20dacd038e7a9f1
Merge: cf275f42 babc8d9e
Author: David Lord <davidism@gmail.com>
Date:=C2=A0=C2=A0 Tue Feb 14 12:08:57 2023

 =C2=A0=C2=A0=C2=A0 Merge pull request from GHSA-xg9f-g7g7-2323

 =C2=A0=C2=A0=C2=A0 limit the maximum number of multipart form parts

I think you want to reference:

https://github.com/pallets/werkzeug/commit/fe899d0cdf767a7289a8bf746b7f72=
c2907a1b4b



> +Signed-off-by: Narpat Mali<narpat.mali@windriver.com>
> +---
> + CHANGES.rst                      |  5 +++++
> + docs/request_data.rst            | 37 +++++++++++++++++--------------=
-
> + src/werkzeug/formparser.py       | 12 ++++++++++-
> + src/werkzeug/sansio/multipart.py |  8 +++++++
> + src/werkzeug/wrappers/request.py |  8 +++++++
> + tests/test_formparser.py         |  9 ++++++++
> + 6 files changed, 61 insertions(+), 18 deletions(-)


=E2=9D=AF git show fe899d0cdf767a7289a8bf746b7f72c2907a1b4b | diffstat
 =C2=A0CHANGES.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0 4 ++++
 =C2=A0src/werkzeug/formparser.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 13 ++++++++++++-
 =C2=A0src/werkzeug/sansio/multipart.py |=C2=A0=C2=A0=C2=A0 7 +++++++
 =C2=A0src/werkzeug/wrappers/request.py |=C2=A0=C2=A0 11 +++++++++++
 =C2=A0tests/test_formparser.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0=C2=A0 9 +++++++++
 =C2=A05 files changed, 43 insertions(+), 1 deletion(-)

I'm out of time for today so can you look at the diff between the=20
patches and
explain that and/or submit a v2 ?


Some whitespace errors if you're into fixing them:

meta-oe.git on kirkstone
=E2=9D=AF git am /tmp/narpat-w.eml
Applying: python3-werkzeug: fix for CVE-2023-25577
.git/rebase-apply/patch:40: trailing whitespace.

.git/rebase-apply/patch:48: trailing whitespace.

.git/rebase-apply/patch:56: trailing whitespace.

.git/rebase-apply/patch:94: trailing whitespace.

.git/rebase-apply/patch:95: trailing whitespace.

warning: squelched 14 whitespace errors
warning: 19 lines add whitespace errors.

I think you said that for the commit you sent to oe-core,
the whitespace noise was coming from the devtool workflow.
If so we should at least open a bugzilla defect or if it's
simple to fix, just send a patch. Please comment so we know
what to expect.

../Randy


> +
> +diff --git a/CHANGES.rst b/CHANGES.rst
> +index a351d7c..6e809ba 100644
> +--- a/CHANGES.rst
> ++++ b/CHANGES.rst
> +@@ -1,5 +1,10 @@
> + .. currentmodule:: werkzeug
> +
> ++-   Specify a maximum number of multipart parts, default 1000, after =
which a
> ++    ``RequestEntityTooLarge`` exception is raised on parsing. This mi=
tigates a DoS
> ++    attack where a larger number of form/file parts would result in d=
isproportionate
> ++    resource use.
> ++
> + Version 2.1.1
> + -------------
> +
> +diff --git a/docs/request_data.rst b/docs/request_data.rst
> +index 83c6278..e55841e 100644
> +--- a/docs/request_data.rst
> ++++ b/docs/request_data.rst
> +@@ -73,23 +73,26 @@ read the stream *or* call :meth:`~Request.get_data=
`.
> + Limiting Request Data
> + ---------------------
> +
> +-To avoid being the victim of a DDOS attack you can set the maximum
> +-accepted content length and request field sizes.  The :class:`Request=
`
> +-class has two attributes for that: :attr:`~Request.max_content_length=
`
> +-and :attr:`~Request.max_form_memory_size`.
> +-
> +-The first one can be used to limit the total content length.  For exa=
mple
> +-by setting it to ``1024 * 1024 * 16`` the request won't accept more t=
han
> +-16MB of transmitted data.
> +-
> +-Because certain data can't be moved to the hard disk (regular post da=
ta)
> +-whereas temporary files can, there is a second limit you can set.  Th=
e
> +-:attr:`~Request.max_form_memory_size` limits the size of `POST`
> +-transmitted form data.  By setting it to ``1024 * 1024 * 2`` you can =
make
> +-sure that all in memory-stored fields are not more than 2MB in size.
> +-
> +-This however does *not* affect in-memory stored files if the
> +-`stream_factory` used returns a in-memory file.
> ++The :class:`Request` class provides a few attributes to control how m=
uch data is
> ++processed from the request body. This can help mitigate DoS attacks t=
hat craft the
> ++request in such a way that the server uses too many resources to hand=
le it. Each of
> ++these limits will raise a :exc:`~werkzeug.exceptions.RequestEntityToo=
Large` if they are
> ++exceeded.
> ++
> ++-   :attr:`~Request.max_content_length` Stop reading request data aft=
er this number
> ++    of bytes. It's better to configure this in the WSGI server or HTT=
P server, rather
> ++    than the WSGI application.
> ++-   :attr:`~Request.max_form_memory_size` Stop reading request data i=
f any form part is
> ++    larger than this number of bytes. While file parts can be moved t=
o disk, regular
> ++    form field data is stored in memory only.
> ++-   :attr:`~Request.max_form_parts` Stop reading request data if more=
 than this number
> ++    of parts are sent in multipart form data. This is useful to stop =
a very large number
> ++    of very small parts, especially file parts. The default is 1000.
> ++
> ++Using Werkzeug to set these limits is only one layer of protection. W=
SGI servers
> ++and HTTPS servers should set their own limits on size and timeouts. T=
he operating system
> ++or container manager should set limits on memory and processing time =
for server
> ++processes.
> +
> +
> + How to extend Parsing?
> +diff --git a/src/werkzeug/formparser.py b/src/werkzeug/formparser.py
> +index 10d58ca..bebb2fc 100644
> +--- a/src/werkzeug/formparser.py
> ++++ b/src/werkzeug/formparser.py
> +@@ -179,6 +179,8 @@ class FormDataParser:
> +     :param cls: an optional dict class to use.  If this is not specif=
ied
> +                        or `None` the default :class:`MultiDict` is us=
ed.
> +     :param silent: If set to False parsing errors will not be caught.
> ++    :param max_form_parts: The maximum number of parts to be parsed. =
If this is
> ++        exceeded, a :exc:`~exceptions.RequestEntityTooLarge` exceptio=
n is raised.
> +     """
> +
> +     def __init__(
> +@@ -190,6 +192,8 @@ class FormDataParser:
> +         max_content_length: t.Optional[int] =3D None,
> +         cls: t.Optional[t.Type[MultiDict]] =3D None,
> +         silent: bool =3D True,
> ++        *,
> ++        max_form_parts: t.Optional[int] =3D None,
> +     ) -> None:
> +         if stream_factory is None:
> +             stream_factory =3D default_stream_factory
> +@@ -199,6 +203,7 @@ class FormDataParser:
> +         self.errors =3D errors
> +         self.max_form_memory_size =3D max_form_memory_size
> +         self.max_content_length =3D max_content_length
> ++        self.max_form_parts =3D max_form_parts
> +
> +         if cls is None:
> +             cls =3D MultiDict
> +@@ -281,6 +286,7 @@ class FormDataParser:
> +             self.errors,
> +             max_form_memory_size=3Dself.max_form_memory_size,
> +             cls=3Dself.cls,
> ++            max_form_parts=3Dself.max_form_parts,
> +         )
> +         boundary =3D options.get("boundary", "").encode("ascii")
> +
> +@@ -346,10 +352,12 @@ class MultiPartParser:
> +         max_form_memory_size: t.Optional[int] =3D None,
> +         cls: t.Optional[t.Type[MultiDict]] =3D None,
> +         buffer_size: int =3D 64 * 1024,
> ++        max_form_parts: t.Optional[int] =3D None,
> +     ) -> None:
> +         self.charset =3D charset
> +         self.errors =3D errors
> +         self.max_form_memory_size =3D max_form_memory_size
> ++        self.max_form_parts =3D max_form_parts
> +
> +         if stream_factory is None:
> +             stream_factory =3D default_stream_factory
> +@@ -409,7 +417,9 @@ class MultiPartParser:
> +             [None],
> +         )
> +
> +-        parser =3D MultipartDecoder(boundary, self.max_form_memory_si=
ze)
> ++        parser =3D MultipartDecoder(
> ++            boundary, self.max_form_memory_size, max_parts=3Dself.max=
_form_parts
> ++        )
> +
> +         fields =3D []
> +         files =3D []
> +diff --git a/src/werkzeug/sansio/multipart.py b/src/werkzeug/sansio/mu=
ltipart.py
> +index 2d54422..e7d742b 100644
> +--- a/src/werkzeug/sansio/multipart.py
> ++++ b/src/werkzeug/sansio/multipart.py
> +@@ -83,10 +83,13 @@ class MultipartDecoder:
> +         self,
> +         boundary: bytes,
> +         max_form_memory_size: Optional[int] =3D None,
> ++        *,
> ++        max_parts: Optional[int] =3D None,
> +     ) -> None:
> +         self.buffer =3D bytearray()
> +         self.complete =3D False
> +         self.max_form_memory_size =3D max_form_memory_size
> ++        self.max_parts =3D max_parts
> +         self.state =3D State.PREAMBLE
> +         self.boundary =3D boundary
> +
> +@@ -113,6 +116,7 @@ class MultipartDecoder:
> +             % (LINE_BREAK, re.escape(boundary), LINE_BREAK, LINE_BREA=
K),
> +             re.MULTILINE,
> +         )
> ++        self._parts_decoded =3D 0
> +
> +     def last_newline(self) -> int:
> +         try:
> +@@ -177,6 +181,10 @@ class MultipartDecoder:
> +                         name=3Dname,
> +                     )
> +                 self.state =3D State.DATA
> ++                self._parts_decoded +=3D 1
> ++
> ++                if self.max_parts is not None and self._parts_decoded=
 > self.max_parts:
> ++                    raise RequestEntityTooLarge()
> +
> +         elif self.state =3D=3D State.DATA:
> +             if self.buffer.find(b"--" + self.boundary) =3D=3D -1:
> +diff --git a/src/werkzeug/wrappers/request.py b/src/werkzeug/wrappers/=
request.py
> +index 57b739c..a6d5429 100644
> +--- a/src/werkzeug/wrappers/request.py
> ++++ b/src/werkzeug/wrappers/request.py
> +@@ -83,6 +83,13 @@ class Request(_SansIORequest):
> +     #: .. versionadded:: 0.5
> +     max_form_memory_size: t.Optional[int] =3D None
> +
> ++    #: The maximum number of multipart parts to parse, passed to
> ++    #: :attr:`form_data_parser_class`. Parsing form data with more th=
an this
> ++    #: many parts will raise :exc:`~.RequestEntityTooLarge`.
> ++    #:
> ++    #: .. versionadded:: 2.2.3
> ++    max_form_parts =3D 1000
> ++
> +     #: The form data parser that should be used.  Can be replaced to =
customize
> +     #: the form date parsing.
> +     form_data_parser_class: t.Type[FormDataParser] =3D FormDataParser
> +@@ -246,6 +253,7 @@ class Request(_SansIORequest):
> +             self.max_form_memory_size,
> +             self.max_content_length,
> +             self.parameter_storage_class,
> ++            max_form_parts=3Dself.max_form_parts,
> +         )
> +
> +     def _load_form_data(self) -> None:
> +diff --git a/tests/test_formparser.py b/tests/test_formparser.py
> +index 5fc803e..834324f 100644
> +--- a/tests/test_formparser.py
> ++++ b/tests/test_formparser.py
> +@@ -127,6 +127,15 @@ class TestFormParser:
> +         req.max_form_memory_size =3D 400
> +         assert req.form["foo"] =3D=3D "Hello World"
> +
> ++        req =3D Request.from_values(
> ++            input_stream=3Dio.BytesIO(data),
> ++            content_length=3Dlen(data),
> ++            content_type=3D"multipart/form-data; boundary=3Dfoo",
> ++            method=3D"POST",
> ++        )
> ++        req.max_form_parts =3D 1
> ++        pytest.raises(RequestEntityTooLarge, lambda: req.form["foo"])
> ++
> +     def test_missing_multipart_boundary(self):
> +         data =3D (
> +             b"--foo\r\nContent-Disposition: form-field; name=3Dfoo\r\=
n\r\n"
> +--
> +2.40.0
> +
> diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1=
.bb b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
> index 476a3a5964..324a4b7996 100644
> --- a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
> @@ -12,6 +12,8 @@ LIC_FILES_CHKSUM =3D"file://LICENSE.rst;md5=3D5dc8830=
0786f1c214c1e9827a5229462"
>  =20
>   PYPI_PACKAGE =3D "Werkzeug"
>  =20
> +SRC_URI +=3D"file://CVE-2023-25577.patch"
> +
>   SRC_URI[sha256sum] =3D "f8e89a20aeabbe8a893c24a461d3ee5dad2123b05cc6a=
bd73ceed01d39c3ae74"
>  =20
>   inherit pypi setuptools3
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102260):https://lists.openembedded.org/g/openembedd=
ed-devel/message/102260
> Mute This Topic:https://lists.openembedded.org/mt/98638627/3616765
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  =
[randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------55zT8r5MWMazCV7C0ryCttIU
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 342NU3Or013714

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Added Armin.</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2023-05-02 09:33, Narpat Mali via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20230502133352.2074733-1-narpat=
.mali@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">From: Narpat Mali <a class=3D=
"moz-txt-link-rfc2396E" href=3D"mailto:narpat.mali@windriver.com">&lt;nar=
pat.mali@windriver.com&gt;</a>

Werkzeug is a comprehensive WSGI web application library. Prior to
version 2.2.3, Werkzeug's multipart form data parser will parse an
unlimited number of parts, including file parts. Parts can be a
small amount of bytes, but each requires CPU time to parse and may
use more memory as Python data. If a request can be made to an
endpoint that accesses `request.data`, `request.form`, `request.files`,
or `request.get_data(parse_form_data=3DFalse)`, it can cause unexpectedly
high resource usage. This allows an attacker to cause a denial of
service by sending crafted multipart data to an endpoint that will
parse it. The amount of CPU time required can block worker processes
from handling legitimate requests. The amount of RAM required can
trigger an out of memory kill of the process. Unlimited file parts
can use up memory and file handles. If many concurrent requests are
sent continuously, this can exhaust or kill all available workers.
Version 2.2.3 contains a patch for this issue.

Signed-off-by: Narpat Mali <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:narpat.mali@windriver.com">&lt;narpat.mali@windriver.com&gt;</a>
---
 .../python3-werkzeug/CVE-2023-25577.patch     | 232 ++++++++++++++++++
 .../python/python3-werkzeug_2.1.1.bb          |   2 +
 2 files changed, 234 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-werkzeug/=
CVE-2023-25577.patch

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug/CVE-202=
3-25577.patch b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-=
2023-25577.patch
new file mode 100644
index 0000000000..02109c2050
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-25577=
.patch
@@ -0,0 +1,232 @@
+From 5a56cdcbaec2153cd67596c6c2c8056e1ea5ed56 Mon Sep 17 00:00:00 2001
+From: David Lord <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:david=
ism@gmail.com">&lt;davidism@gmail.com&gt;</a>
+Date: Tue, 2 May 2023 11:31:10 +0000
+Subject: [PATCH] Merge pull request from GHSA-xg9f-g7g7-2323
+
+limit the maximum number of multipart form parts
+
+CVE: CVE-2023-25577
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://github.com/pallets/werkzeug/commit/517cac5a804e8c4dc4ed038bb20dacd0=
38e7a9f1">https://github.com/pallets/werkzeug/commit/517cac5a804e8c4dc4ed=
038bb20dacd038e7a9f1</a>]</pre>
    </blockquote>
    <p><br>
    </p>
    <p>That's the merge commit:</p>
    <p>=E2=9D=AF git show 517cac5a804e8c4dc4ed038bb20dacd038e7a9f1<br>
      commit 517cac5a804e8c4dc4ed038bb20dacd038e7a9f1<br>
      Merge: cf275f42 babc8d9e<br>
      Author: David Lord <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:davidism@gmail.com">&lt;davidism@gmail.com&gt;</a><br>
      Date:&nbsp;&nbsp; Tue Feb 14 12:08:57 2023<br>
      <br>
      &nbsp;&nbsp;&nbsp; Merge pull request from GHSA-xg9f-g7g7-2323<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; limit the maximum number of multipart form parts=
<br>
      <br>
    </p>
    <p>I think you want to reference:<br>
      <br>
      &nbsp;
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/pallets/wer=
kzeug/commit/fe899d0cdf767a7289a8bf746b7f72c2907a1b4b">https://github.com=
/pallets/werkzeug/commit/fe899d0cdf767a7289a8bf746b7f72c2907a1b4b</a><br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20230502133352.2074733-1-narpat=
.mali@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">+Signed-off-by: Narpat Mali =
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:narpat.mali@windriver.c=
om">&lt;narpat.mali@windriver.com&gt;</a>
+---
+ CHANGES.rst                      |  5 +++++
+ docs/request_data.rst            | 37 +++++++++++++++++---------------
+ src/werkzeug/formparser.py       | 12 ++++++++++-
+ src/werkzeug/sansio/multipart.py |  8 +++++++
+ src/werkzeug/wrappers/request.py |  8 +++++++
+ tests/test_formparser.py         |  9 ++++++++
+ 6 files changed, 61 insertions(+), 18 deletions(-)</pre>
    </blockquote>
    <p><br>
    </p>
    <p>=E2=9D=AF git show fe899d0cdf767a7289a8bf746b7f72c2907a1b4b | diff=
stat<br>
      &nbsp;CHANGES.rst&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; |&nbsp;&nbsp;&nbsp; 4 ++++<br>
      &nbsp;src/werkzeug/formparser.py&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 13 ++++++++++++-<br>
      &nbsp;src/werkzeug/sansio/multipart.py |&nbsp;&nbsp;&nbsp; 7 ++++++=
+<br>
      &nbsp;src/werkzeug/wrappers/request.py |&nbsp;&nbsp; 11 +++++++++++=
<br>
      &nbsp;tests/test_formparser.py&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 9 +++++++++<br>
      &nbsp;5 files changed, 43 insertions(+), 1 deletion(-)<br>
    </p>
    <p>I'm out of time for today so can you look at the diff between the
      patches and <br>
      explain that and/or submit a v2 ?</p>
    <p><br>
    </p>
    <p>Some whitespace errors if you're into fixing them:<br>
    </p>
    <p>meta-oe.git on kirkstone<br>
      =E2=9D=AF git am /tmp/narpat-w.eml <br>
      Applying: python3-werkzeug: fix for CVE-2023-25577<br>
      .git/rebase-apply/patch:40: trailing whitespace.<br>
      &nbsp;<br>
      .git/rebase-apply/patch:48: trailing whitespace.<br>
      &nbsp;<br>
      .git/rebase-apply/patch:56: trailing whitespace.<br>
      &nbsp;<br>
      .git/rebase-apply/patch:94: trailing whitespace.<br>
      &nbsp;<br>
      .git/rebase-apply/patch:95: trailing whitespace.<br>
      &nbsp;<br>
      warning: squelched 14 whitespace errors<br>
      warning: 19 lines add whitespace errors.<br>
    </p>
    <p>I think you said that for the commit you sent to oe-core,<br>
      the whitespace noise was coming from the devtool workflow.<br>
      If so we should at least open a bugzilla defect or if it's <br>
      simple to fix, just send a patch. Please comment so we know<br>
      what to expect.<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20230502133352.2074733-1-narpat=
.mali@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
+
+diff --git a/CHANGES.rst b/CHANGES.rst
+index a351d7c..6e809ba 100644
+--- a/CHANGES.rst
++++ b/CHANGES.rst
+@@ -1,5 +1,10 @@
+ .. currentmodule:: werkzeug
+=20
++-   Specify a maximum number of multipart parts, default 1000, after wh=
ich a
++    ``RequestEntityTooLarge`` exception is raised on parsing. This miti=
gates a DoS
++    attack where a larger number of form/file parts would result in dis=
proportionate
++    resource use.
++
+ Version 2.1.1
+ -------------
+=20
+diff --git a/docs/request_data.rst b/docs/request_data.rst
+index 83c6278..e55841e 100644
+--- a/docs/request_data.rst
++++ b/docs/request_data.rst
+@@ -73,23 +73,26 @@ read the stream *or* call :meth:`~Request.get_data`.
+ Limiting Request Data
+ ---------------------
+=20
+-To avoid being the victim of a DDOS attack you can set the maximum
+-accepted content length and request field sizes.  The :class:`Request`
+-class has two attributes for that: :attr:`~Request.max_content_length`
+-and :attr:`~Request.max_form_memory_size`.
+-
+-The first one can be used to limit the total content length.  For examp=
le
+-by setting it to ``1024 * 1024 * 16`` the request won't accept more tha=
n
+-16MB of transmitted data.
+-
+-Because certain data can't be moved to the hard disk (regular post data=
)
+-whereas temporary files can, there is a second limit you can set.  The
+-:attr:`~Request.max_form_memory_size` limits the size of `POST`
+-transmitted form data.  By setting it to ``1024 * 1024 * 2`` you can ma=
ke
+-sure that all in memory-stored fields are not more than 2MB in size.
+-
+-This however does *not* affect in-memory stored files if the
+-`stream_factory` used returns a in-memory file.
++The :class:`Request` class provides a few attributes to control how muc=
h data is
++processed from the request body. This can help mitigate DoS attacks tha=
t craft the
++request in such a way that the server uses too many resources to handle=
 it. Each of
++these limits will raise a :exc:`~werkzeug.exceptions.RequestEntityTooLa=
rge` if they are
++exceeded.
++
++-   :attr:`~Request.max_content_length` Stop reading request data after=
 this number
++    of bytes. It's better to configure this in the WSGI server or HTTP =
server, rather
++    than the WSGI application.
++-   :attr:`~Request.max_form_memory_size` Stop reading request data if =
any form part is
++    larger than this number of bytes. While file parts can be moved to =
disk, regular
++    form field data is stored in memory only.
++-   :attr:`~Request.max_form_parts` Stop reading request data if more t=
han this number
++    of parts are sent in multipart form data. This is useful to stop a =
very large number
++    of very small parts, especially file parts. The default is 1000.
++
++Using Werkzeug to set these limits is only one layer of protection. WSG=
I servers
++and HTTPS servers should set their own limits on size and timeouts. The=
 operating system
++or container manager should set limits on memory and processing time fo=
r server
++processes.
+=20
+=20
+ How to extend Parsing?
+diff --git a/src/werkzeug/formparser.py b/src/werkzeug/formparser.py
+index 10d58ca..bebb2fc 100644
+--- a/src/werkzeug/formparser.py
++++ b/src/werkzeug/formparser.py
+@@ -179,6 +179,8 @@ class FormDataParser:
+     :param cls: an optional dict class to use.  If this is not specifie=
d
+                        or `None` the default :class:`MultiDict` is used.
+     :param silent: If set to False parsing errors will not be caught.
++    :param max_form_parts: The maximum number of parts to be parsed. If=
 this is
++        exceeded, a :exc:`~exceptions.RequestEntityTooLarge` exception =
is raised.
+     &quot;&quot;&quot;
+=20
+     def __init__(
+@@ -190,6 +192,8 @@ class FormDataParser:
+         max_content_length: t.Optional[int] =3D None,
+         cls: t.Optional[t.Type[MultiDict]] =3D None,
+         silent: bool =3D True,
++        *,
++        max_form_parts: t.Optional[int] =3D None,
+     ) -&gt; None:
+         if stream_factory is None:
+             stream_factory =3D default_stream_factory
+@@ -199,6 +203,7 @@ class FormDataParser:
+         self.errors =3D errors
+         self.max_form_memory_size =3D max_form_memory_size
+         self.max_content_length =3D max_content_length
++        self.max_form_parts =3D max_form_parts
+=20
+         if cls is None:
+             cls =3D MultiDict
+@@ -281,6 +286,7 @@ class FormDataParser:
+             self.errors,
+             max_form_memory_size=3Dself.max_form_memory_size,
+             cls=3Dself.cls,
++            max_form_parts=3Dself.max_form_parts,
+         )
+         boundary =3D options.get(&quot;boundary&quot;, &quot;&quot;).en=
code(&quot;ascii&quot;)
+=20
+@@ -346,10 +352,12 @@ class MultiPartParser:
+         max_form_memory_size: t.Optional[int] =3D None,
+         cls: t.Optional[t.Type[MultiDict]] =3D None,
+         buffer_size: int =3D 64 * 1024,
++        max_form_parts: t.Optional[int] =3D None,
+     ) -&gt; None:
+         self.charset =3D charset
+         self.errors =3D errors
+         self.max_form_memory_size =3D max_form_memory_size
++        self.max_form_parts =3D max_form_parts
+=20
+         if stream_factory is None:
+             stream_factory =3D default_stream_factory
+@@ -409,7 +417,9 @@ class MultiPartParser:
+             [None],
+         )
+=20
+-        parser =3D MultipartDecoder(boundary, self.max_form_memory_size=
)
++        parser =3D MultipartDecoder(
++            boundary, self.max_form_memory_size, max_parts=3Dself.max_f=
orm_parts
++        )
+=20
+         fields =3D []
+         files =3D []
+diff --git a/src/werkzeug/sansio/multipart.py b/src/werkzeug/sansio/mult=
ipart.py
+index 2d54422..e7d742b 100644
+--- a/src/werkzeug/sansio/multipart.py
++++ b/src/werkzeug/sansio/multipart.py
+@@ -83,10 +83,13 @@ class MultipartDecoder:
+         self,
+         boundary: bytes,
+         max_form_memory_size: Optional[int] =3D None,
++        *,
++        max_parts: Optional[int] =3D None,
+     ) -&gt; None:
+         self.buffer =3D bytearray()
+         self.complete =3D False
+         self.max_form_memory_size =3D max_form_memory_size
++        self.max_parts =3D max_parts
+         self.state =3D State.PREAMBLE
+         self.boundary =3D boundary
+=20
+@@ -113,6 +116,7 @@ class MultipartDecoder:
+             % (LINE_BREAK, re.escape(boundary), LINE_BREAK, LINE_BREAK)=
,
+             re.MULTILINE,
+         )
++        self._parts_decoded =3D 0
+=20
+     def last_newline(self) -&gt; int:
+         try:
+@@ -177,6 +181,10 @@ class MultipartDecoder:
+                         name=3Dname,
+                     )
+                 self.state =3D State.DATA
++                self._parts_decoded +=3D 1
++
++                if self.max_parts is not None and self._parts_decoded &=
gt; self.max_parts:
++                    raise RequestEntityTooLarge()
+=20
+         elif self.state =3D=3D State.DATA:
+             if self.buffer.find(b&quot;--&quot; + self.boundary) =3D=3D=
 -1:
+diff --git a/src/werkzeug/wrappers/request.py b/src/werkzeug/wrappers/re=
quest.py
+index 57b739c..a6d5429 100644
+--- a/src/werkzeug/wrappers/request.py
++++ b/src/werkzeug/wrappers/request.py
+@@ -83,6 +83,13 @@ class Request(_SansIORequest):
+     #: .. versionadded:: 0.5
+     max_form_memory_size: t.Optional[int] =3D None
+=20
++    #: The maximum number of multipart parts to parse, passed to
++    #: :attr:`form_data_parser_class`. Parsing form data with more than=
 this
++    #: many parts will raise :exc:`~.RequestEntityTooLarge`.
++    #:
++    #: .. versionadded:: 2.2.3
++    max_form_parts =3D 1000
++
+     #: The form data parser that should be used.  Can be replaced to cu=
stomize
+     #: the form date parsing.
+     form_data_parser_class: t.Type[FormDataParser] =3D FormDataParser
+@@ -246,6 +253,7 @@ class Request(_SansIORequest):
+             self.max_form_memory_size,
+             self.max_content_length,
+             self.parameter_storage_class,
++            max_form_parts=3Dself.max_form_parts,
+         )
+=20
+     def _load_form_data(self) -&gt; None:
+diff --git a/tests/test_formparser.py b/tests/test_formparser.py
+index 5fc803e..834324f 100644
+--- a/tests/test_formparser.py
++++ b/tests/test_formparser.py
+@@ -127,6 +127,15 @@ class TestFormParser:
+         req.max_form_memory_size =3D 400
+         assert req.form[&quot;foo&quot;] =3D=3D &quot;Hello World&quot;
+=20
++        req =3D Request.from_values(
++            input_stream=3Dio.BytesIO(data),
++            content_length=3Dlen(data),
++            content_type=3D&quot;multipart/form-data; boundary=3Dfoo&qu=
ot;,
++            method=3D&quot;POST&quot;,
++        )
++        req.max_form_parts =3D 1
++        pytest.raises(RequestEntityTooLarge, lambda: req.form[&quot;foo=
&quot;])
++
+     def test_missing_multipart_boundary(self):
+         data =3D (
+             b&quot;--foo\r\nContent-Disposition: form-field; name=3Dfoo=
\r\n\r\n&quot;
+--=20
+2.40.0
+
diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.b=
b b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
index 476a3a5964..324a4b7996 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
@@ -12,6 +12,8 @@ LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E"=
 href=3D"file://LICENSE.rst;md5=3D5dc88300786f1c214c1e9827a5229462">&quot=
;file://LICENSE.rst;md5=3D5dc88300786f1c214c1e9827a5229462&quot;</a>
=20
 PYPI_PACKAGE =3D &quot;Werkzeug&quot;
=20
+SRC_URI +=3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://CVE-2023-=
25577.patch">&quot;file://CVE-2023-25577.patch&quot;</a>
+
 SRC_URI[sha256sum] =3D &quot;f8e89a20aeabbe8a893c24a461d3ee5dad2123b05cc=
6abd73ceed01d39c3ae74&quot;
=20
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#102260): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/102260">https:=
//lists.openembedded.org/g/openembedded-devel/message/102260</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/98638627/3616765">https://lists.openembedded.org/mt/=
98638627/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------55zT8r5MWMazCV7C0ryCttIU--

