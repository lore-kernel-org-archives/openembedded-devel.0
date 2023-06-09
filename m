Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8421C7EE2E
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 12:51:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12550.1686315093191492596
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jun 2023 05:51:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=n1xfa7X7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=552458d4ef=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 359CU31h004154
	for <openembedded-devel@lists.openembedded.org>; Fri, 9 Jun 2023 12:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=MR0H2IZ8XHcbRkpVKMyNqsLGOHSSvffgUpFzsW6U3Jg=;
 b=n1xfa7X73ACsR00hD9tMWLgjLCxVZMjzXOu6ymEORSde18QQTCuH+KG3Iqrse9Ri7mZl
 y6JvIgf4kdqyvZ7+H508Qgi758Q6wPVBb/rw8l5xee/QAPM3p4X8uAFKFllFYCaoyEBN
 cnX8vrl8EaNgkQGREaiid9aDcm2xE5/B2QDN6AzI8eau4FJ1az6HrcJeRCktV3lm+760
 reh8dRC16fixfk+8ZEjansanAQtpK8dtGMkc4MsnpDkeSwvFS+B06Eh6q4cdVc36KKJI
 2pLqMXgDeLEGqEWFOmlgTO0qdKo1MIceb86soO71m9wdtuZsasHDTefNTysB844MtKta dQ== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r2avq2ptr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jun 2023 12:51:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VMy5c/3VDEdUL0labVThnaZShOdauLJHXvLxNTI8OlIzKBBX6ykxy7JHYxBaFroa1PY7LU1Ufp3OnBRpCM+VsLWjzXi6C+1jUADGmIEllqsQAwZ/toYew6nQS11MMQQ1XlemoYO3y7S8+1C1nnwNJf3vbtNHad2WrjxPSFWRAdoHI8XDyEW1NmOLoxyVViYedYXmK75V/yEKRAJ2bT1sePtLUa2BUIZey17OETEKkOCt7zfP+jOqjbH/92Wg3nnQ3wWltYaD+1VOSLNFJYHsV0ZMQu6PJMBC5bWuXpQstYlTnAL2YkAtV7nnFzTafnwi1IIa8n7Sa7XNaLe27CPgoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MR0H2IZ8XHcbRkpVKMyNqsLGOHSSvffgUpFzsW6U3Jg=;
 b=hTLcjf/mOD/Pwro4ZcaoLYpGlw4hBHj4MVq3KxDy/EYRoD5ijqtimhKDWVn2KzvgxEJr3iOPG0RkUw3TpcCB74cSgX/4XqFV4NQKdyALDzF2Sd9xnPmW7n1/o+4W5WFSatOGmQ7CoLc/3kuDAYRA08u7V3HkNuF1psuyCuUzGsWjnj33kJAaXT49muTtxg3NewsjirwTcTUaGstMC6Eq8zgLAHQ2Qz0H+BEIgurqbPdOm93PoysRZTdcJLTUClgL0r3MxN0MWmzVw+rmczfbsiOeeYa5qGZJRtV+Bi+vSAZwXBTazdMjIAFUwNwsvGAEec47xf1l6rbJyog6B09cNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by IA1PR11MB8097.namprd11.prod.outlook.com (2603:10b6:208:457::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 12:51:30 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::deef:c312:c6d2:187e]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::deef:c312:c6d2:187e%5]) with mapi id 15.20.6477.016; Fri, 9 Jun 2023
 12:51:30 +0000
Message-ID: <f1b9b777-1fe6-6aba-6046-39938d911d17@windriver.com>
Date: Fri, 9 Jun 2023 18:19:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [oe] [meta-oe][kirkstone][PATCH 1/1] python3-werkzeug: fix for
 CVE-2023-23934
To: openembedded-devel@lists.openembedded.org
Cc: hari.gpillai@windriver.com
References: <175DCC61AD9C7482.14362@lists.openembedded.org>
Content-Language: en-US
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <175DCC61AD9C7482.14362@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0127.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::12) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|IA1PR11MB8097:EE_
X-MS-Office365-Filtering-Correlation-Id: d2f1cea3-2577-48c1-1865-08db68e83f30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rr/8LlCQkVJNZ70i/xYiroZuF3l3Pc9+Sk8nJfKE8yDcLK4qU/q/Bn8NqMCFihgaC3rJWctB2TJXMxD/tlZCFo3WGVAzLkCZriR/adtJPgOhIC/ZuwnCVII16vqrYnMm0HhOMVt63IMeEf/oC/P+URXN8VxNiNitnhAhgYINI14FDKk1zycmqo71HzICXuCc1TKIoBtnLx18euVmH+jayvoD2PCigToorKdZ+CjhOcUg5WS98NHYZRKK1UwmfSGwxOFdnLuSNhOQjqRleJ2fskmqm4C3+DT/ehFPuhhJtlAgzFTgjbSUvmWMXN4ellsCe+uUcmB9wwFdsXZKZrI5QUADM/TWKu+0j4Rsk5L9qpwgK4XUlwLcNjmTu9xoChYwWSuG/cPQctxpe/x9si5ybTyqwzwgfNomtPl0LH66meuDTUed1jyRJsYW9NgvS1Fh2tCh9YmgHC+f19rqrjKTRZ5cDGzZtGCowFEw8qG3OO/qcJlIc5DGoeygysQdsPey6nTkQbsCQuILl0NfqjtHcM0avPE0GbOgfeFUkot2RbddaDPohJkrBie6dO5iKbFA8NcJjfLD6HX1fyAePnfEonBR236v8/GaIcObfzhY5piVG6mRcSaS98kheDLX3MXX0w9CP+CygKc0BBgYw77CGA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(366004)(346002)(136003)(396003)(376002)(451199021)(83380400001)(5660300002)(38100700002)(186003)(53546011)(6512007)(6506007)(26005)(107886003)(66574015)(2616005)(2906002)(6666004)(478600001)(966005)(6486002)(31696002)(8676002)(36756003)(66556008)(66476007)(31686004)(6916009)(4326008)(8936002)(66946007)(86362001)(41300700001)(316002)(66899021)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bHEvNzFDckxlMmRrdGVkb0I4OTNERXJCZEozQVArdjlPc21xV3k2eDVPQVZL?=
 =?utf-8?B?ZmtSNG8wTm1ub3JHQ0w2c2FZUmMyN3dSMUtkKzc1SGFwaWRoRHNlYzFvSHRJ?=
 =?utf-8?B?V3V4alJHUEZrWHk0TkFXdkIrM3ozVUF1ZHo2UHRRTkx5c1RZaHVib0xBVms5?=
 =?utf-8?B?RXMyZWJkL3JkdDN2ZDZPZVEyMlJ3dU4zRERSbHpYK3VRWkpMd3pwd1E1Y3g4?=
 =?utf-8?B?STNoblVsRDREd3I4Vms5b1BtMnlPcjNuWVZGVzBWbU9EUlJuYTYvMmdvckhI?=
 =?utf-8?B?amFOeGx0cnNIZE1KcGwzYWJiQVBHM0JHd3hqR0MxeG0yYUxjZnhVdEpobWNV?=
 =?utf-8?B?S0VwRG5CeFB1MlNsTkFHQWVJQW9iblQ3RVA3RVhOTUdPWSs0WFJIQ2NVRXV4?=
 =?utf-8?B?UGs0TFQxeEJXYjRIb3ozalIrY2VwMWdDb1FXcWFSUXRaNm9nZTBuTENNWmUw?=
 =?utf-8?B?cGFjNmJ6Tk9FdDBHaE9zQXlyZmlvM005akxuSW9sbGplWjNqNFFKWVk5REJU?=
 =?utf-8?B?WklMclZJc2JCMmRGRzAwRDV3R0JrZHlxYTFrZ1o3VTZxYmxzVHFDS0VNejBC?=
 =?utf-8?B?UXc3empQem9xeVNyaWhXVXgyRG9iamZhb2hDZzMxYWtvbWx5cXBCekh0cE1x?=
 =?utf-8?B?bDQwODkwVTFhSzJsc1E4SzhhU253UWNXTjdxTkhaM1pLcXY5MUNtUm1nWGMy?=
 =?utf-8?B?QXdQUG4rREhaZW1UWFNTcUdvckVvdmVJTnBFbWw2aW8yTFFPOWNTbWFZeUpk?=
 =?utf-8?B?OGRMRlNXc2JTWXBnbUxDTHl4QlN4akJ3c29zZWFRYzc2N3FUOFg5c1ZPYjBi?=
 =?utf-8?B?dUI4VTIyVzVtU1hOYzE1aGVDYllXNXN4ZitnVTExRlRkRXJjRGhvU1diejcx?=
 =?utf-8?B?OWFMdjlFUU1KbUh6Z0RiRVlCcmhaMHZ0OGhhVUNoQ3l5a0gwZVJMTExjdG0w?=
 =?utf-8?B?WjZSajVNMGxWU2Z4dHZVSEM0QmpNZ0dja0JWaDlZWnBkbjlJTDNVSmlmWFUz?=
 =?utf-8?B?Z1p4SlcrVUpDS3prWWFtb1ZvNWx6N25PT2k3aExLUFkzUjdacFI0dnI2L0do?=
 =?utf-8?B?SlVXbzl3SW9Fd2ovOFBjR29KejdmdTd2OHo1Q0I2OGY1eDlZcmY1dUkzMStO?=
 =?utf-8?B?c0l0d3RaclAvdkVLK3ZSVXEveXA3SGxEdno2b2N0aWt4Z1hDanp3S1orVmhj?=
 =?utf-8?B?MWNmeXdNWXRGRnZqYUZaSk94eW15NDhUUFZUejMzZTVPK2RCWG1PenVuelhG?=
 =?utf-8?B?QW1lNXpzL0xEbFIzcUgxTnRXQ2sxQUVyYkliQ1JNbUNVK2ZrMEpjRnNyNEZF?=
 =?utf-8?B?dGJZb3NNSmFJMU1zeUYreVlmNDNnOUxaT285MmFxT292WENRM0ZrM2Y3WjJC?=
 =?utf-8?B?ekR3WUE3aUhYcFh0YjQ4c0ZDWHB2RmRTNFdlTURXS2kvVFRONnVzZ0tBMStZ?=
 =?utf-8?B?UlZnRXd0dkNUYlBjOVpNS2d1TTBHRFRTS3pzTW9MNUhQK2hsdjQvTnB4L1Zx?=
 =?utf-8?B?aWdRbUJWbWkreitCeitrL3U1MmRrZEZpTVg3eFlONUdNKzQvdjkyRGV5djIz?=
 =?utf-8?B?aWVYa2poRDZ1K0M4bXV3THhvQkw3MnlQUVNybDgyRVJBZjREcmgwY2dNQ2J2?=
 =?utf-8?B?K09uZnNuU1FXOGdISEw3V05GUFdlejJUSXhObmtxRGxkQTNzS3BsQUk1elA4?=
 =?utf-8?B?T2R4VEludmw4TUlFS0xlS3dwbDdFbTVmVEtCdW5OeGgxSVpDeFI1STE3YTNH?=
 =?utf-8?B?aFpIWXdzRVI1dEdsNHpBQVcwcjFwN1cxdkZRbS9zQVV6RE9PeEpsazEzaVhs?=
 =?utf-8?B?WVBlQm90dXQwWkRuak0xSUc3OE5JaVBRc1FjVnVhajQ4ZWVoL1BYQkpoazJT?=
 =?utf-8?B?NWxpRk5maG1PbVlqQTR2SXVtVFVQKys2SlJwOHlXTlhmLzdQaFVBN1ZLdGtm?=
 =?utf-8?B?U2dZQkVFVzRINE5pMVVESkdYb2wybStSZTdzTXA2UWlUSWRuelNVVmFjcmQ1?=
 =?utf-8?B?cTN0SGVjUG85T09XNWVzczB3RU0zSzRybmlhbExadGZJY2VNQXNNbXdTWnRX?=
 =?utf-8?B?QWlUNWJSTEhhUWlmUnF6QWhEUnhlZGxROXU3Wk5Kb1BUcDNEUUpMT1R5WjBj?=
 =?utf-8?B?bTlhTTV5Rk00R2NKUStZR3NUYWxZbGhQWFQ3dE5UdDFpMG1IRGw2aloydTBO?=
 =?utf-8?B?U3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2f1cea3-2577-48c1-1865-08db68e83f30
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 12:51:30.6328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xmd6P41R2HRgDbg1Ndt1VhSOqOhAGEAtxtV9/QDSSKx/qJzrwPVWAu5WztsKfYr5ODfiau2445rj8/XtIi8QSn7IGRK0gHFWcNOljHsSIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8097
X-Proofpoint-GUID: gQKg7LonGXwO2tmEeSxrOAa01YcnraMo
X-Proofpoint-ORIG-GUID: gQKg7LonGXwO2tmEeSxrOAa01YcnraMo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_08,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306090108
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jun 2023 12:51:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103198


Reminder.

On 10-05-2023 19:18, Narpat Mali via lists.openembedded.org wrote:
> From: Narpat Mali <narpat.mali@windriver.com>
>
> Werkzeug is a comprehensive WSGI web application library. Browsers may allow
> "nameless" cookies that look like `=value` instead of `key=value`. A vulnerable
> browser may allow a compromised application on an adjacent subdomain to exploit
> this to set a cookie like `=__Host-test=bad` for another subdomain. Werkzeug
> prior to 2.2.3 will parse the cookie `=__Host-test=bad` as __Host-test=bad`.
> If a Werkzeug application is running next to a vulnerable or malicious subdomain
> which sets such a cookie using a vulnerable browser, the Werkzeug application
> will see the bad cookie value but the valid cookie key. The issue is fixed in
> Werkzeug 2.2.3.
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>   .../python3-werkzeug/CVE-2023-23934.patch     | 116 ++++++++++++++++++
>   .../python/python3-werkzeug_2.1.1.bb          |   2 +
>   2 files changed, 118 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.patch b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.patch
> new file mode 100644
> index 0000000000..0be97d2888
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.patch
> @@ -0,0 +1,116 @@
> +From b070a40ebbd89d88f4d8144a6ece017d33604d00 Mon Sep 17 00:00:00 2001
> +From: David Lord <davidism@gmail.com>
> +Date: Wed, 10 May 2023 11:33:18 +0000
> +Subject: [PATCH] Merge pull request from GHSA-px8h-6qxv-m22q
> +
> +don't strip leading `=` when parsing cookie
> +
> +"src/werkzeug/sansio/http.py" file is not available in the current recipe
> +version 2.1.1 and this has been introduced from 2.2.0 version. Before 2.2.0
> +version, this http.py file was only available in the "src/werkzeug/http.py"
> +and we could see the same functions available there which are getting modified
> +in the CVE fix commit. Hence, modifying the same at "src/werkzeug/http.py" file.
> +
> +CVE: CVE-2023-23934
> +
> +Upstream-Status: Backport [https://github.com/pallets/werkzeug/commit/cf275f42acad1b5950c50ffe8ef58fe62cdce028]
> +
> +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> +---
> + CHANGES.rst               |  4 ++++
> + src/werkzeug/_internal.py | 13 +++++++++----
> + src/werkzeug/http.py      |  4 ----
> + tests/test_http.py        |  4 +++-
> + 4 files changed, 16 insertions(+), 9 deletions(-)
> +
> +diff --git a/CHANGES.rst b/CHANGES.rst
> +index a351d7c..23505d3 100644
> +--- a/CHANGES.rst
> ++++ b/CHANGES.rst
> +@@ -1,5 +1,9 @@
> + .. currentmodule:: werkzeug
> +
> ++-   A cookie header that starts with ``=`` is treated as an empty key and discarded,
> ++    rather than stripping the leading ``==``.
> ++
> ++
> + Version 2.1.1
> + -------------
> +
> +diff --git a/src/werkzeug/_internal.py b/src/werkzeug/_internal.py
> +index a8b3523..d6290ba 100644
> +--- a/src/werkzeug/_internal.py
> ++++ b/src/werkzeug/_internal.py
> +@@ -34,7 +34,7 @@ _quote_re = re.compile(rb"[\\].")
> + _legal_cookie_chars_re = rb"[\w\d!#%&\'~_`><@,:/\$\*\+\-\.\^\|\)\(\?\}\{\=]"
> + _cookie_re = re.compile(
> +     rb"""
> +-    (?P<key>[^=;]+)
> ++    (?P<key>[^=;]*)
> +     (?:\s*=\s*
> +         (?P<val>
> +             "(?:[^\\"]|\\.)*" |
> +@@ -382,16 +382,21 @@ def _cookie_parse_impl(b: bytes) -> t.Iterator[t.Tuple[bytes, bytes]]:
> +     """Lowlevel cookie parsing facility that operates on bytes."""
> +     i = 0
> +     n = len(b)
> ++    b += b";"
> +
> +     while i < n:
> +-        match = _cookie_re.search(b + b";", i)
> ++        match = _cookie_re.match(b, i)
> ++
> +         if not match:
> +             break
> +
> +-        key = match.group("key").strip()
> +-        value = match.group("val") or b""
> +         i = match.end(0)
> ++        key = match.group("key").strip()
> ++
> ++        if not key:
> ++            continue
> +
> ++        value = match.group("val") or b""
> +         yield key, _cookie_unquote(value)
> +
> +
> +diff --git a/src/werkzeug/http.py b/src/werkzeug/http.py
> +index 9369900..ae133e3 100644
> +--- a/src/werkzeug/http.py
> ++++ b/src/werkzeug/http.py
> +@@ -1205,10 +1205,6 @@ def parse_cookie(
> +     def _parse_pairs() -> t.Iterator[t.Tuple[str, str]]:
> +         for key, val in _cookie_parse_impl(header):  # type: ignore
> +             key_str = _to_str(key, charset, errors, allow_none_charset=True)
> +-
> +-            if not key_str:
> +-                continue
> +-
> +             val_str = _to_str(val, charset, errors, allow_none_charset=True)
> +             yield key_str, val_str
> +
> +diff --git a/tests/test_http.py b/tests/test_http.py
> +index 5936bfa..59cc179 100644
> +--- a/tests/test_http.py
> ++++ b/tests/test_http.py
> +@@ -427,7 +427,8 @@ class TestHTTPUtility:
> +     def test_parse_cookie(self):
> +         cookies = http.parse_cookie(
> +             "dismiss-top=6; CP=null*; PHPSESSID=0a539d42abc001cdc762809248d4beed;"
> +-            'a=42; b="\\";"; ; fo234{=bar;blub=Blah; "__Secure-c"=d'
> ++            'a=42; b="\\";"; ; fo234{=bar;blub=Blah; "__Secure-c"=d;'
> ++            "==__Host-eq=bad;__Host-eq=good;"
> +         )
> +         assert cookies.to_dict() == {
> +             "CP": "null*",
> +@@ -438,6 +439,7 @@ class TestHTTPUtility:
> +             "fo234{": "bar",
> +             "blub": "Blah",
> +             '"__Secure-c"': "d",
> ++            "__Host-eq": "good",
> +         }
> +
> +     def test_dump_cookie(self):
> +--
> +2.40.0
> diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
> index 476a3a5964..ca8705146e 100644
> --- a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
> @@ -12,6 +12,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
>   
>   PYPI_PACKAGE = "Werkzeug"
>   
> +SRC_URI += "file://CVE-2023-23934.patch"
> +
>   SRC_URI[sha256sum] = "f8e89a20aeabbe8a893c24a461d3ee5dad2123b05cc6abd73ceed01d39c3ae74"
>   
>   inherit pypi setuptools3
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102533): https://lists.openembedded.org/g/openembedded-devel/message/102533
> Mute This Topic: https://lists.openembedded.org/mt/98806142/7199376
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [narpat.mali@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

