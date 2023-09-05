Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1896FC83F3E
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 10:57:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18560.1693911430794466950
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 03:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kYbQOGPD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7612aa2b58=narpat.mali@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3859ucUZ022442
	for <openembedded-devel@lists.openembedded.org>; Tue, 5 Sep 2023 03:57:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=QZdFtuJ6Wjg5PqotZvoKFeM52BwNMKT6kwG4bzphgKg=; b=
	kYbQOGPDYhSebEGbc7e1jJVmbgxD/xl1VwEud0xUxuoCXHfkWAorHDvHkQKLxRXY
	3YXRZbfvtXdCzOh+Nzvao0JanydZe47gO1rjxiJe5v9Yj9VG/BIKkUL8RpBFJdif
	xBCy84S+yaGHROLDFtK46C2IWeQwUY7GHGUi3kqzn4fdHaZ6Q+L48ZuUGQMUcMGs
	Xc64fuBm/IusypQBhQ6+5hiD4vwOkrTQie5yVPWbhahX6zSzhngec1f02d/AiM83
	LnF4P9k4dfUdt8GkzrMV7/Q0zw9Jg+xfXIy5vFKeVlv9huFsStWcpaJpGTBObk8+
	8r5Ydv9jgVZDncKxL2w8BA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sv4jg219x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 05 Sep 2023 03:57:10 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 385Av9sK031399
	for <openembedded-devel@lists.openembedded.org>; Tue, 5 Sep 2023 03:57:09 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2042.outbound.protection.outlook.com [104.47.57.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sv4jg219v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Sep 2023 03:57:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPmZLg0sj/r6nfYpYQqm+mdZ++8FoChrhHL+kXncRE+G2fAilzD9lH3CH7hxFVXEIWHoOFyURD2qTDEtxpqYkQLZCck0KxGhTo4HZczHJTf/EpQ6RBjb6ArJ+O386EsU04csxUowfNNBPFwoyaAnXFhm8ky5k2v++djkOjkOApcCYIFAUDg39EKRGncrMuzKtuZWvXMQMarOUjAZ1C5QG8LZG6eRiigkJ9rzLbbC5tfDMs0DQU7zMaCGPsYrG0bLqhj3ZR6og89N5cUme36GLS+I65A3BR5Xb8dQeQxEV84jHFzgfrEF7lZhZ/tTZZxIVSOQ9GKMW7uWfhhYzQaajQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZdFtuJ6Wjg5PqotZvoKFeM52BwNMKT6kwG4bzphgKg=;
 b=Op1XmN1SpaAPzPzwHYP/jxAfvM049bkGXLHz4M8FVRDCJ6anig7aRpZB22YwUOCvlO976cR2zwY8XtgULPT6NWwF9s7mKWRvLKuWYb/uRiXX7DNqeasaAc2Kh6ZJ1hNudeJuH3XcQ5MPO1Ru7foNpfj9bRQIu8ew2+YHFw8cgA35OdHtzXCSbSmDE/ePOaP/CuZKeoEDmVwdloovVb3vF9dkPIJOgFuFR48xvqpuAE7mKAUIZjij+rP6+78r31hmwZBnctzA9ve8R1I8efWzi4o42Ntm7dkb/9GYGCwOMD4rwpBI36AywQ/RgER7zKcXydBYHWiRXaJwdxJbpOvTfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by SA2PR11MB4810.namprd11.prod.outlook.com (2603:10b6:806:116::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 10:57:06 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::219e:cc26:ef6d:1b4a]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::219e:cc26:ef6d:1b4a%4]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 10:57:05 +0000
Message-ID: <14cf5175-7086-0726-764d-e0a1ec01d7cc@windriver.com>
Date: Tue, 5 Sep 2023 16:23:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [oe] [meta-networking][kirkstone][PATCH 1/1] frr: Fix
 CVE-2023-41358 and CVE-2023-38802
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
References: <1781FB0EE7A4CA80.31888@lists.openembedded.org>
Content-Language: en-US
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <1781FB0EE7A4CA80.31888@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0083.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::9) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|SA2PR11MB4810:EE_
X-MS-Office365-Filtering-Correlation-Id: 31f8532b-88d5-41d4-84f5-08dbadfed7a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AlxhUFVBGuYsTxW+h1u4jLpFacOjkxHxcVGMW2UmEba2pgLbeLWl0mI3lVXv4kErvX1yP47wRzSU5Gce05La1bN4Qnz/0b73FzMM3uv/pyGZclxn1vnNo+VmsvI/KlCTKrfAiWaXnJKXXLaDSrGDUxWa6gDUWOHH+cLHL+Ssg8JNHL9gaUj4A6bxDkdk3p4wPICva0hhxwr04+aRJSAxHEXVDdPsNlA2CEPxgGCyZfEpNDmf5eu6kUjD9khqlX1lf4oFN+kaBTAzFb8atJJ2wtiL3TYmdKEEtS5BmjovfbhR59gTmsFRUMvBPv2KCspkz2DrOiwYmG+AXP0h5Gn/4dEe84XQFUe4rOKXHirKz93Ua53wsX/tpeXPiGP7RvFmpyX3m8gDFjHl3chIQxI+D90uSBCsDQh8uUSz76H1RgxMTHWlIK8KMvV2428JZZLjJXyZHm1Eqes13/uQ+I0giEEUF1zuLXVx3fWVK3vycCjr8mQHRgHA5R/T77d8ShzjC0D1GrGX49rME1W4vHiT2LRRQU+cwhlIIV6QoesvUFV96qdlvMJDeY5Gk/x6e2iQBFse1khRUTzqmwGqdje9vkpI9d2Yl1mM07CQia45dIM4pB8FCX6P8QJAHo0WH+uRiu2MkEYLl8410nNAhZgYKfz2MMyVYCOAsKO+U13smkg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(396003)(346002)(376002)(366004)(186009)(1800799009)(451199024)(66476007)(8936002)(66574015)(41300700001)(83380400001)(8676002)(478600001)(6666004)(19627235002)(66946007)(66556008)(6512007)(966005)(53546011)(2616005)(6486002)(6506007)(316002)(2906002)(38100700002)(30864003)(86362001)(31696002)(5660300002)(36756003)(31686004)(66899024)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?enJqZG1XTktZYStrMEYxdzRSblhwbzZlVk14cWVVT0FhVEVnZDJYL2NQeWM1?=
 =?utf-8?B?ZVpSWWI4OEpZeUFtbGVsRzlKeFNxZFVqYVVPd0J0akZsWDNTU05LcDlTVWZq?=
 =?utf-8?B?bVpmdjhvbW8xWVlCQzFVazROM1VWa095SUtSK1F2bWoyOTdQbnE4OHJnbHBN?=
 =?utf-8?B?TkhkT1p1SFpuSEdUU0owRktBY01hSDUrMGttdk9CUzNnUXQ3Uk9HMWFwUVd2?=
 =?utf-8?B?dGJBcDYzRkhGU3p6bWNkVXFza3NPMUpORklHTnhnN2pVNjJEMHhzd2hnTXdB?=
 =?utf-8?B?SGtGMVVKSytocHl4aVhJUDVneWNJQ2ptV042QkdrQkZzNUIvVEc0K3JmeWpV?=
 =?utf-8?B?WU9FQXMyWllvQm03OW9hNVRvUHdUYTVWMndxRlJ5c2JQQjFiQmFadTRuVThK?=
 =?utf-8?B?QVE5dFozTXRBcWJzblZYZ20yNTVQZzFZZDVNK0NRRitrbGdkZzN3VEU4Ukp1?=
 =?utf-8?B?azdrV2VXR2tQTXJXZFB1MlRDMVl1cHViVXErLzFVSEhvempIb2JTUjYzblRz?=
 =?utf-8?B?aW1zejlVR3REYldHTmNyeVQ4elFkdlV1azZlM1ltMmVES3QzRG9FQlBWVkpK?=
 =?utf-8?B?UGRkdEt4czlVV1NzUnkyajk5VFBIOFdaUFUyRHF0VWprYmhESHRzSEJxaHNm?=
 =?utf-8?B?Q0Q1K2dvc05rMjEvaUVSakdPWmJ5anlsdDdHaFVCZkpSSlcwbzlVcFZaelJv?=
 =?utf-8?B?aTRCSW9JV2Y1a1U2WFJwSkEvMm1wNzM3R3NxOGMrK1VFMmRuSVA0VWJQQTRH?=
 =?utf-8?B?cktNOHROcTYxMHQvZVo0elJDcXlrcUdWUEljUTJ5Wjlac1ZMa2w3NFRBb090?=
 =?utf-8?B?Ly9hRjRaNjR6K2o4RVJPZ1NXK3ZjQ05aM0FTVG1GU0djMFBuZVBtMy9YeXA3?=
 =?utf-8?B?RVhSUTBrSkc3KytwWC9NUmErUnc2WGZicDZDUC9qa3hnTmRCSXMrMzMvaUlr?=
 =?utf-8?B?d21xKytsaXI0Z09tZjV4MFM4dE1QUENBN1hqRjJwMnhqMWhqLzZRTnFmeWdh?=
 =?utf-8?B?S1hvUVVGU3ozZzFJL0RYeEhCVFhtbXhkTHVIK0ZmeUtQQUtUamxqMFNwdW9r?=
 =?utf-8?B?aXNXOENEN29ESUdMMEc5NGM1cFBJMDhyVS96VFZ0dkd6YnB3M0NHSDg0MkhB?=
 =?utf-8?B?WTMyaGhPb2tZUmN6c3V1NyttQ1lnNmx6VjVTdXlCa21vTm9CdmpNSVc4U0Yy?=
 =?utf-8?B?cVVNUmhBaGdxQUEvczI3cXE1bVpzTGdwaEFybDFHWlVBenRwQng4N1BHYmxU?=
 =?utf-8?B?ejZvbEVjUUdza1VqTmxVa2JCVGpLQWRxQVh4c0xRVzhGVDZhTlNOaFNvUHJy?=
 =?utf-8?B?ekRiaGhOb3kxZm9iZjVPUVlYRzA4bmFFWnc0eHgxNVVoS3FIbnVzb2pDSVRQ?=
 =?utf-8?B?LytEc1JrczZXTW5INHdjOUU1cVFaaHJjK3FINnpOWjRiUEV2YitaSUdFd2hi?=
 =?utf-8?B?NlNzUWF1L0IyODR2NWdKOFZ4SjZGaEE4SVBmVGlEZFYzZEpuMDY5SUZOY1kz?=
 =?utf-8?B?Q01USktsOXZzeDNCOE8xZ0FQb1o3L1lHVjFMaDJHZjZrN1VCOWo0NElydW1O?=
 =?utf-8?B?ZEZpNXoxYlhUbTR2VVQ3cC9TRG5VN29uRnFsMkZHZGVpZG5HR3RaVTZQV0FB?=
 =?utf-8?B?SVExR0Y0bmxWUVJULzR6RU5kWHd2WU1mbk5zWnN2LzcyeTByYUJVTWkwanlL?=
 =?utf-8?B?NzFyajRaNjhsYS95UFFXM2ozeEJGU2RTd2Q5b3FsNUMvcVNtOTNDWkd3eU1i?=
 =?utf-8?B?QXY4NWF1Sjl4UysvbHBRb0VxSU1obUpydUFDYmNXa2RIZG9JbzRJcnRkbk9h?=
 =?utf-8?B?UUdOYXZwRlRQZUNBQTNFSTc0bXRtNDNUYStPVFVpVHNwNE5BZnI4Y2t5QkhV?=
 =?utf-8?B?am5EUjV5NXhRdGtreVN1UFZnOE1qYVdGVkZwVXNGcURaYkdIeUZDbmhiUFhu?=
 =?utf-8?B?LzZTb1dPQUFXWkRaYjRkWnZ0S3ljb2J0MFhLVGw2cHh3ZytyN093eUVqb1lY?=
 =?utf-8?B?QTdndGFYc1VSUkpYNEk3UjZrSGlsK1g5TWUzVzBnMm1kejhSQm02Z1JhT1gz?=
 =?utf-8?B?aHV6UTlNbFFZckUxenJjQWNRSUtZeG4xK3N1YjJiZ0ZXZ0p1M1NsQWJQN0JN?=
 =?utf-8?B?SmVJMWVtK3ZaWXRxMjJVbGQ0NXZkM0h3cTRSVEx2ZTEvWVpxVklPb0huUG9l?=
 =?utf-8?B?RzA0QnprMWd1Ulp0QThtTHFxaGpqZkNmNnhoSVRIUkN6RmFvL2cxMXlRR24y?=
 =?utf-8?B?SnJ3bC9yL1Y5WnZ4YlNqNjJZTzR3PT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f8532b-88d5-41d4-84f5-08dbadfed7a8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 10:57:05.8289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NEgKjpDUvKFTPe/LzumuRrthKd3yTn6klH6G1aPp58Y+Vya6IlVotQ734ySuGikU5+3LgxMSXVLzNi0yLzvOweuQJxPgeWMmzyxA+ln5QKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4810
X-Proofpoint-ORIG-GUID: Rw6yujFMggWemaQs9ZDJL5fJxqr7Bvrd
X-Proofpoint-GUID: JmQS7rmbAS3O_EbANRUpHiJXkjb8d2Od
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_08,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309050098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Sep 2023 10:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104721

Please ignore this, sending a new patch.

../Narpat

On 05-09-2023 16:19, Narpat Mali via lists.openembedded.org wrote:
> From: Narpat Mali <narpat.mali@windriver.com>
>
> CVE-2023-41358:
> An issue was discovered in FRRouting FRR through 9.0. bgpd/bgp_packet.c
> processes NLRIs if the attribute length is zero.
>
> CVE-2023-38802:
> FRRouting FRR 7.5.1 through 9.0 and Pica8 PICOS 4.3.3.2 allow a remote
> attacker to cause a denial of service via a crafted BGP update with a
> corrupted attribute 23 (Tunnel Encapsulation).
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-41358
> https://nvd.nist.gov/vuln/detail/CVE-2023-38802
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>   .../frr/frr/CVE-2023-38802.patch              | 136 ++++++++++++++++++
>   .../frr/frr/CVE-2023-41358.patch              | 105 ++++++++++++++
>   .../recipes-protocols/frr/frr_8.2.2.bb        |   2 +
>   3 files changed, 243 insertions(+)
>   create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-38802.patch
>   create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-41358.patch
>
> diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-38802.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-38802.patch
> new file mode 100644
> index 0000000000..b86407b3d7
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/frr/frr/CVE-2023-38802.patch
> @@ -0,0 +1,136 @@
> +From f8a663076fc354914c57c861d4333779a296ea79 Mon Sep 17 00:00:00 2001
> +From: Narpat Mali <narpat.mali@windriver.com>
> +Date: Mon, 4 Sep 2023 15:23:52 +0000
> +Subject: [PATCH 2/2] bgpd: Use treat-as-withdraw for tunnel encapsulation
> + attribute
> +
> +Before this path we used session reset method, which is discouraged by rfc7606.
> +
> +Handle this as rfc requires.
> +
> +Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
> +
> +CVE: CVE-2023-38802
> +
> +Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/bcb6b58d9530173df41d3a3cbc4c600ee0b4b186]
> +
> +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> +---
> + bgpd/bgp_attr.c | 61 ++++++++++++++++++++-----------------------------
> + 1 file changed, 25 insertions(+), 36 deletions(-)
> +
> +diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
> +index 5d06991e2..b10a60351 100644
> +--- a/bgpd/bgp_attr.c
> ++++ b/bgpd/bgp_attr.c
> +@@ -1310,6 +1310,7 @@ bgp_attr_malformed(struct bgp_attr_parser_args *args, uint8_t subcode,
> +	case BGP_ATTR_LARGE_COMMUNITIES:
> +	case BGP_ATTR_ORIGINATOR_ID:
> +	case BGP_ATTR_CLUSTER_LIST:
> ++	case BGP_ATTR_ENCAP:
> +		return BGP_ATTR_PARSE_WITHDRAW;
> +	case BGP_ATTR_MP_REACH_NLRI:
> +	case BGP_ATTR_MP_UNREACH_NLRI:
> +@@ -2411,26 +2412,21 @@ bgp_attr_ipv6_ext_communities(struct bgp_attr_parser_args *args)
> + }
> +
> + /* Parse Tunnel Encap attribute in an UPDATE */
> +-static int bgp_attr_encap(uint8_t type, struct peer *peer, /* IN */
> +-			  bgp_size_t length, /* IN: attr's length field */
> +-			  struct attr *attr, /* IN: caller already allocated */
> +-			  uint8_t flag,      /* IN: attr's flags field */
> +-			  uint8_t *startp)
> ++static int bgp_attr_encap(struct bgp_attr_parser_args *args)
> + {
> +-	bgp_size_t total;
> +	uint16_t tunneltype = 0;
> +-
> +-	total = length + (CHECK_FLAG(flag, BGP_ATTR_FLAG_EXTLEN) ? 4 : 3);
> ++	struct peer *const peer = args->peer;
> ++	struct attr *const attr = args->attr;
> ++	bgp_size_t length = args->length;
> ++	uint8_t type = args->type;
> ++	uint8_t flag = args->flags;
> +
> +	if (!CHECK_FLAG(flag, BGP_ATTR_FLAG_TRANS)
> +	    || !CHECK_FLAG(flag, BGP_ATTR_FLAG_OPTIONAL)) {
> +-		zlog_info(
> +-			"Tunnel Encap attribute flag isn't optional and transitive %d",
> +-			flag);
> +-		bgp_notify_send_with_data(peer, BGP_NOTIFY_UPDATE_ERR,
> +-					  BGP_NOTIFY_UPDATE_ATTR_FLAG_ERR,
> +-					  startp, total);
> +-		return -1;
> ++		zlog_err("Tunnel Encap attribute flag isn't optional and transitive %d",
> ++			 flag);
> ++		return bgp_attr_malformed(args, BGP_NOTIFY_UPDATE_OPT_ATTR_ERR,
> ++					  args->total);
> +	}
> +
> +	if (BGP_ATTR_ENCAP == type) {
> +@@ -2438,12 +2434,11 @@ static int bgp_attr_encap(uint8_t type, struct peer *peer, /* IN */
> +		uint16_t tlv_length;
> +
> +		if (length < 4) {
> +-			zlog_info(
> ++			zlog_err(
> +				"Tunnel Encap attribute not long enough to contain outer T,L");
> +-			bgp_notify_send_with_data(
> +-				peer, BGP_NOTIFY_UPDATE_ERR,
> +-				BGP_NOTIFY_UPDATE_OPT_ATTR_ERR, startp, total);
> +-			return -1;
> ++			return bgp_attr_malformed(args,
> ++						  BGP_NOTIFY_UPDATE_OPT_ATTR_ERR,
> ++						  args->total);
> +		}
> +		tunneltype = stream_getw(BGP_INPUT(peer));
> +		tlv_length = stream_getw(BGP_INPUT(peer));
> +@@ -2473,13 +2468,11 @@ static int bgp_attr_encap(uint8_t type, struct peer *peer, /* IN */
> +		}
> +
> +		if (sublength > length) {
> +-			zlog_info(
> +-				"Tunnel Encap attribute sub-tlv length %d exceeds remaining length %d",
> +-				sublength, length);
> +-			bgp_notify_send_with_data(
> +-				peer, BGP_NOTIFY_UPDATE_ERR,
> +-				BGP_NOTIFY_UPDATE_OPT_ATTR_ERR, startp, total);
> +-			return -1;
> ++			zlog_err("Tunnel Encap attribute sub-tlv length %d exceeds remaining length %d",
> ++				 sublength, length);
> ++			return bgp_attr_malformed(args,
> ++						  BGP_NOTIFY_UPDATE_OPT_ATTR_ERR,
> ++						  args->total);
> +		}
> +
> +		/* alloc and copy sub-tlv */
> +@@ -2527,13 +2520,10 @@ static int bgp_attr_encap(uint8_t type, struct peer *peer, /* IN */
> +
> +	if (length) {
> +		/* spurious leftover data */
> +-		zlog_info(
> +-			"Tunnel Encap attribute length is bad: %d leftover octets",
> +-			length);
> +-		bgp_notify_send_with_data(peer, BGP_NOTIFY_UPDATE_ERR,
> +-					  BGP_NOTIFY_UPDATE_OPT_ATTR_ERR,
> +-					  startp, total);
> +-		return -1;
> ++		zlog_err("Tunnel Encap attribute length is bad: %d leftover octets",
> ++			 length);
> ++		return bgp_attr_malformed(args, BGP_NOTIFY_UPDATE_OPT_ATTR_ERR,
> ++					  args->total);
> +	}
> +
> +	return 0;
> +@@ -3332,8 +3322,7 @@ bgp_attr_parse_ret_t bgp_attr_parse(struct peer *peer, struct attr *attr,
> +		case BGP_ATTR_VNC:
> + #endif
> +		case BGP_ATTR_ENCAP:
> +-			ret = bgp_attr_encap(type, peer, length, attr, flag,
> +-					     startp);
> ++			ret = bgp_attr_encap(&attr_args);
> +			break;
> +		case BGP_ATTR_PREFIX_SID:
> +			ret = bgp_attr_prefix_sid(&attr_args);
> +--
> +2.40.0
> diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-41358.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-41358.patch
> new file mode 100644
> index 0000000000..1bfefed916
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/frr/frr/CVE-2023-41358.patch
> @@ -0,0 +1,105 @@
> +From ad7e0b1ab424a2d13f0528f76dfdd6e214e5ee0a Mon Sep 17 00:00:00 2001
> +From: Narpat Mali <narpat.mali@windriver.com>
> +Date: Mon, 4 Sep 2023 15:06:09 +0000
> +Subject: [PATCH 1/2] bgpd: Do not process NLRIs if the attribute length is
> + zero
> +
> +```
> +3  0x00007f423aa42476 in __GI_raise (sig=sig@entry=11) at ../sysdeps/posix/raise.c:26
> +4  0x00007f423aef9740 in core_handler (signo=11, siginfo=0x7fffc414deb0, context=<optimized out>) at lib/sigevent.c:246
> +5  <signal handler called>
> +6  0x0000564dea2fc71e in route_set_aspath_prepend (rule=0x564debd66d50, prefix=0x7fffc414ea30, object=0x7fffc414e400)
> +    at bgpd/bgp_routemap.c:2258
> +7  0x00007f423aeec7e0 in route_map_apply_ext (map=<optimized out>, prefix=prefix@entry=0x7fffc414ea30,
> +    match_object=match_object@entry=0x7fffc414e400, set_object=set_object@entry=0x7fffc414e400, pref=pref@entry=0x0) at lib/routemap.c:2690
> +8  0x0000564dea2d277e in bgp_input_modifier (peer=peer@entry=0x7f4238f59010, p=p@entry=0x7fffc414ea30, attr=attr@entry=0x7fffc414e770,
> +    afi=afi@entry=AFI_IP, safi=safi@entry=SAFI_UNICAST, rmap_name=rmap_name@entry=0x0, label=0x0, num_labels=0, dest=0x564debdd5130)
> +    at bgpd/bgp_route.c:1772
> +9  0x0000564dea2df762 in bgp_update (peer=peer@entry=0x7f4238f59010, p=p@entry=0x7fffc414ea30, addpath_id=addpath_id@entry=0,
> +    attr=0x7fffc414eb50, afi=afi@entry=AFI_IP, safi=<optimized out>, safi@entry=SAFI_UNICAST, type=9, sub_type=0, prd=0x0, label=0x0,
> +    num_labels=0, soft_reconfig=0, evpn=0x0) at bgpd/bgp_route.c:4374
> +10 0x0000564dea2e2047 in bgp_nlri_parse_ip (peer=0x7f4238f59010, attr=attr@entry=0x7fffc414eb50, packet=0x7fffc414eaf0)
> +    at bgpd/bgp_route.c:6249
> +11 0x0000564dea2c5a58 in bgp_nlri_parse (peer=peer@entry=0x7f4238f59010, attr=attr@entry=0x7fffc414eb50,
> +    packet=packet@entry=0x7fffc414eaf0, mp_withdraw=mp_withdraw@entry=false) at bgpd/bgp_packet.c:339
> +12 0x0000564dea2c5d66 in bgp_update_receive (peer=peer@entry=0x7f4238f59010, size=size@entry=109) at bgpd/bgp_packet.c:2024
> +13 0x0000564dea2c901d in bgp_process_packet (thread=<optimized out>) at bgpd/bgp_packet.c:2933
> +14 0x00007f423af0bf71 in event_call (thread=thread@entry=0x7fffc414ee40) at lib/event.c:1995
> +15 0x00007f423aebb198 in frr_run (master=0x564deb73c670) at lib/libfrr.c:1213
> +16 0x0000564dea261b83 in main (argc=<optimized out>, argv=<optimized out>) at bgpd/bgp_main.c:505
> +```
> +
> +With the configuration:
> +
> +```
> +frr version 9.1-dev-MyOwnFRRVersion
> +frr defaults traditional
> +hostname ip-172-31-13-140
> +log file /tmp/debug.log
> +log syslog
> +service integrated-vtysh-config
> +!
> +debug bgp keepalives
> +debug bgp neighbor-events
> +debug bgp updates in
> +debug bgp updates out
> +!
> +router bgp 100
> + bgp router-id 9.9.9.9
> + no bgp ebgp-requires-policy
> + bgp bestpath aigp
> + neighbor 172.31.2.47 remote-as 200
> + !
> + address-family ipv4 unicast
> +  neighbor 172.31.2.47 default-originate
> +  neighbor 172.31.2.47 route-map RM_IN in
> + exit-address-family
> +exit
> +!
> +route-map RM_IN permit 10
> + set as-path prepend 200
> +exit
> +!
> +```
> +
> +The issue is that we try to process NLRIs even if the attribute length is 0.
> +
> +Later bgp_update() will handle route-maps and a crash occurs because all the
> +attributes are NULL, including aspath, where we dereference.
> +
> +According to the RFC 4271:
> +
> +A value of 0 indicates that neither the Network Layer
> +         Reachability Information field nor the Path Attribute field is
> +         present in this UPDATE message.
> +
> +But with a fuzzed UPDATE message this can be faked. I think it's reasonable
> +to skip processing NLRIs if both update_len and attribute_len are 0.
> +
> +Reported-by: Iggy Frankovic <iggyfran@amazon.com>
> +Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
> +
> +CVE: CVE-2023-41358
> +
> +Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/28ccc24d38df1d51ed8a563507e5d6f6171fdd38]
> +
> +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> +---
> + bgpd/bgp_packet.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/bgpd/bgp_packet.c b/bgpd/bgp_packet.c
> +index 0166dc6a2..2fd28aae3 100644
> +--- a/bgpd/bgp_packet.c
> ++++ b/bgpd/bgp_packet.c
> +@@ -1767,7 +1767,7 @@ static int bgp_update_receive(struct peer *peer, bgp_size_t size)
> +	/* Network Layer Reachability Information. */
> +	update_len = end - stream_pnt(s);
> +
> +-	if (update_len) {
> ++	if (update_len && attribute_len) {
> +		/* Set NLRI portion to structure. */
> +		nlris[NLRI_UPDATE].afi = AFI_IP;
> +		nlris[NLRI_UPDATE].safi = SAFI_UNICAST;
> +--
> +2.40.0
> diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
> index 1897eb2abd..703eedf9fe 100644
> --- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
> +++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
> @@ -18,6 +18,8 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.2 \
>              file://CVE-2022-43681.patch \
>              file://CVE-2023-31489.patch \
>              file://CVE-2023-31490.patch \
> +           file://CVE-2023-41358.patch \
> +           file://CVE-2023-38802.patch \
>              file://frr.pam \
>   	      "
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104720): https://lists.openembedded.org/g/openembedded-devel/message/104720
> Mute This Topic: https://lists.openembedded.org/mt/101166594/7199376
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [narpat.mali@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

