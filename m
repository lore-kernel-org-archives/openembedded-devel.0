Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B24EB64DB
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 15:01:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.20900.1686841258130998965
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 08:00:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=sO9zKVBr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55300b703e=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35F7Idkd030671
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 15:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=rgjfZkhl2ak8jyNhJUMJRdbi1pyt5z137A9rrwZ/RoE=;
 b=sO9zKVBrmhhqxjrOfRHKhrEA5iGuYOLekHzNCQXzU9fnGONou5OPEMzyd8A5NYVTjY+3
 kOl3LKSln2ssN8cEI+Ex5lRPa0a1sL0h4jn7o8mrZ3dBbm5rMZP/kdKrMtTjueSWtjUx
 Zso1wRRpXEIVESQiWs/lG5dt8F6ZoDWfLlYKO5vI8fcfM955YLb4EoupePau8nMh6yIP
 +2HuiRdWIpqXkhhaPzz9bj19QqRu3xYKCyYG5458b+Goqz8SzDVnueaqLFOAe13s0e7H
 hqLu1QbQIy+1Gu3ooz7so75bMr9+CF/nAq2qQbY5r6Tu3XCej5gVT3YR8AObo+B5+Rs7 Tg== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2045.outbound.protection.outlook.com [104.47.73.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4g5850t7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 15:00:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLozM+ZWl91ywjalDk6I2dIJG3bBoF+TVbNU5+m/RBry0NC+tJ/MkcM5VOQEfxW02+m1I++a3vgqg1MTOEdU/Adb5EkuXfwDr3aPE9dQj17z+yLMScAPe2o27DgViBGqNTgpJuLuRZm865v3r16KfvTxJnYQaa/Ftlw4PCYbIa9rGsGzjkDQ8SADcgHEU9FPg+YJF5kELaZyfX96amSTMeIcRUSNiZ4sUeAhGcRJxiKl+mGu3u9PVeFohnP8Q7oS1R3S2aJm+rXmRxqVvLNv44DAmMIUyD/pK5s2a7L2CCWEolP/uqXPlw/nQr9JfCgrZksAT485z2NE9agr1ajMkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgjfZkhl2ak8jyNhJUMJRdbi1pyt5z137A9rrwZ/RoE=;
 b=gnJhhwkiXURFvccqcPGtbloOEEvErXILx4vFuw7Mf80ZBZiDZzFaR+/z8XhEIqGoTSTMq7MXwZiTxa4O66kmQBWI/FfloF8VVHJHYmWJi6uQo5QkjhzkxK1jguj8KF5yL9awG9DwU/7G1pVy8d6i9hTFYNVBrJxmVeNqrrCCc53lk5q4/aW+AP7v1UzPgFc/e2sZXvcZreh78IG2MUJexmBo8L/ilCjBme4ZsEs2RbhM2zrHZFeEJdWhL3pEKG3FDK7FmJBxkvQrQgdV3e2My8Y0/bwj6auYJ2gBT8fiuXUbz18E0yWqJmC46NTuC/vBptIF0ycpEWlzbDTDk7rCOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by PH0PR11MB4999.namprd11.prod.outlook.com (2603:10b6:510:37::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Thu, 15 Jun
 2023 15:00:53 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::deef:c312:c6d2:187e]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::deef:c312:c6d2:187e%6]) with mapi id 15.20.6500.025; Thu, 15 Jun 2023
 15:00:53 +0000
Message-ID: <9f56042a-37ef-79d1-e3ad-9e9f6a784663@windriver.com>
Date: Thu, 15 Jun 2023 20:28:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [oe] [meta-python][kirkstone][PATCH 1/1] python3-django: fix for
 CVE-2023-31047
To: openembedded-devel@lists.openembedded.org
Cc: hari.gpillai@windriver.com
References: <1762B546620A9F5C.16338@lists.openembedded.org>
Content-Language: en-US
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <1762B546620A9F5C.16338@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR03CA0284.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::19) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|PH0PR11MB4999:EE_
X-MS-Office365-Filtering-Correlation-Id: 08bc3831-98db-4125-1013-08db6db15061
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	40S7baJzhxoFvmvuR+qIz98WK3qbElvJTyHMv+BLaYngdeiwy9GjVZIdINaGGLwsod7I99fhv9MWmBK82z96P0mN9aothmSa9asyeC1JQnw5gZb9ffoQIVqgy1fCnT8f/6WaoX+I5srK4dz3B0eqME9WzRpa0cCaN0NmDX28pc+Gre6A0ccmr9VNDataPoXxIa3x7nxWLtTkCBBQYPK21EnCNGvbnxtJEmuirQ8AGh3jQQny8achzNSF7XMgxEw804Hz/gBP0iyhIeX1pCf13qygUZLa0z25qKOvkg9nf0VM+SrSWid1aR7o7v/5r10tVffwpxj2gizIXaUejUHQss3DRls70EGTYhouKhdoEWsOyr9aOOjmrKu7sN8BMrkz0zLjC4P+BQL8u4TJoDivZVaIEYVsNkd+4bUn0K/e6S8wbAuhZZiGBKrX76oGohCNmo5mm91zJdpDiiLw0N4UnwyeAkNQLN1MGsaQ8tvatbAgIG7yDrqukMbf+SJdROdaDCqmBdQaVZFJQS+z0c7cQF+e/UJ496PHPxYdkdHoDybvZxJDKWn7XbJsb6SEPr1QOTaF/LK6KgZ91+7lN9OhFVaO6HbrVQ0GcXpz4JOi957vpX2FnRs9cVTqqE84WoqTTCkj/F3ZwcRzhPWydD8yWA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(346002)(366004)(39850400004)(451199021)(30864003)(2906002)(66899021)(186003)(2616005)(83380400001)(66476007)(66556008)(66946007)(6666004)(6916009)(4326008)(966005)(41300700001)(6486002)(316002)(31696002)(86362001)(478600001)(38100700002)(36756003)(31686004)(6512007)(6506007)(26005)(53546011)(8676002)(8936002)(107886003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MldaSnRTZktnbzVmRW1oRmhiL0hWT2VHNmkzSnFvSlc4N3B0amZkY2U1Wk1v?=
 =?utf-8?B?S1V3YUtlZmZmNVZtbXowMzBza0s3Q1hDMXNsdlNJVXB2ZkhHZXJ3RGtiUGZF?=
 =?utf-8?B?VzBqbkYvWHFNZld3cVJueDkxZ1FuaDhSaHpJS1pSY2tpVFE3TFRCbktGMnUy?=
 =?utf-8?B?bHpnRHdpM0xRWnluSFpMUlgraWtJRFpZdWp3MmV5Zll2Wk5kODZCWU15ZmdR?=
 =?utf-8?B?YlU4V1NVZDRmUllNRmd5RVNrdVFWYVlVdUhiWFRIb2h2bzlhMzU2b0NuYXNu?=
 =?utf-8?B?WFdVRlpVS1JBZFU4bXJWdDBjck9WenRuMDV2d3IxeURnSUFqaHlVbmZqdnIw?=
 =?utf-8?B?NmkzcmtGemtEaEIzRDFJRkpDbjR3eHZnNzJiS244VWRtZi9pR05QS0gxQmU3?=
 =?utf-8?B?aExZbEpxdHNnL1E2dzNmbmlLcWJZLzlqOHZxWlErRW9GMkRTNjJUL28vZC9I?=
 =?utf-8?B?d2tra2kwZVFJUldncFkwbWtxbjVpWWc3dzNwMzBQUFNXRDZOcWt2c1h5TjBt?=
 =?utf-8?B?bXNiWmFZbEM4SFUrNE5XaDFWMVd5NnJpUjJnRkpUZEJYQ1p1MmtyK2N2dUVi?=
 =?utf-8?B?UGZ4VGxMSjMrK2V3bEs1U2pWQThOUTRZTlFUZDM3ZDlMOGF0KzdEWXlSem5I?=
 =?utf-8?B?QlpCRm9XUnJtMGpaVVFzVFB4YzRHUVV0Mko5SjNXVHU1aVp2YmU5RnA5eVA1?=
 =?utf-8?B?WXFMMnNCWGxZYXBEc09TNlRHbGt4QnQ3eS93T0xJRWZnbjhxWkRlYWxGREJN?=
 =?utf-8?B?TW5kY1F6TEduODlOZmZDVXZsRm83SkVqT1Q0d0planl4TEVzUkx3ZGdjMzQ5?=
 =?utf-8?B?WG5zMndxdXBldHhQeXgzVnJFVTFrOHBmbVNlNlZ5dlhSd2tRTGlCNXRoR0di?=
 =?utf-8?B?c1Nrc1E1TUttQ01VeW9WWXlaeFZaSTBzekNwQ0pyM0xzcXAzdWJzYmRSaTVt?=
 =?utf-8?B?dHpuWStvaDE4WjdxNzlBRzlBeTA4dzNTaktSbk1MNXE1b01YU3pXU2pyMkdm?=
 =?utf-8?B?d2pMQlNWaW51TXJZZTBVYkZTa1Z4UVhtY0pmUWZ1V2ZCdWY2TEdON1NSbXVi?=
 =?utf-8?B?Nkl5OFVQQzlTN01oZnE0RmI5NVdRdTVVT3k4Ui95VGI5L3FnV1U5NVNPd215?=
 =?utf-8?B?MXJZVUtmeTR2WVRtUGhObVJQY2NTTVdoSG1LeEhLempGRktic1N2T2NmQ2ZZ?=
 =?utf-8?B?Y3plUWZXSnlqKzBVa0tzcGxVNzhlZytKK1Z1U29La054eldkM0phRmFIQkpP?=
 =?utf-8?B?SDR6TCtMQ0xWT3Fqb3paRS9DV25mditqcjZsWEh6djhkalBQNUxLWWIxRVFW?=
 =?utf-8?B?bkNrQ04yT01YdVVZZml1OTVJOGdkTGZPYm9EVzgvTXZpV1RwVDdMYStuMWg5?=
 =?utf-8?B?ZG9HbCs3MlJGUVpaZzhYaVlJSTdBVWNXUTk4MDNsTkw1c0RhaU1xZU9yNEVM?=
 =?utf-8?B?Kys1V1NDVVNLTThoYmVlMGVDeHZpNGVwZzQzb1JjcWZlU1BYSTlKLzZnWVBU?=
 =?utf-8?B?ZkRpNUpJM1NTNGUvVnNiblVjbTNCOEhsdVNUcWhQeWpkb3hVUEpmNGZrMzkx?=
 =?utf-8?B?L1JiOWttNEVGY1VYT2FVRnFzcGRDZVpjMEVKSlpqMnV3T1JrTytSZ2VGVmtm?=
 =?utf-8?B?clJ3bmhnWDdpaVBJcEltMXlYSnVoVDdoYllzby9UcFNTb3hmU2xrSUFObTNG?=
 =?utf-8?B?WHRBUktLMmNvNm1XbXpZdG1DemNnbWZndWl5cFliM1FyRSt5RGk3RVBLOEZB?=
 =?utf-8?B?MW95N00wSjdtcHZoTGpuOThDUFdiaUVXbFlMcHFoYVRDbVFMNFdNdGRPT3NQ?=
 =?utf-8?B?ZDBYcEloamx4VU5UOUZWVXZLcTNTZzByb1p4SEk1Y2pxcUhuTjJZV0JGbC9Q?=
 =?utf-8?B?MkUwSTFEamdManBVbm9US1JEWmsrNXJtNWJpbDZVRmVHYlpaQ2pmZmRNOXVD?=
 =?utf-8?B?R2dCWmpLTXdYVFE2aG1raUdsdTRTNngxQXVDVEU4QWhwdksyQnJobExueFFU?=
 =?utf-8?B?SFh2eWxkaGVkZnErNmdPZ25CeWtrRHd1b25ldUtianNQSmZYTUhKTXorVFVN?=
 =?utf-8?B?RHRVSVZHVGRQT3duY1BYMmRyeUNyeFZTWWFlUWxuWitEQXNQZDZkbjJiYnk3?=
 =?utf-8?B?Z0ZsZy9WNFRVaDk0TFhHMmgxeUdJSng4cE94aWFoL3lod0NwT01QUkdBWUxD?=
 =?utf-8?B?RXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08bc3831-98db-4125-1013-08db6db15061
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 15:00:53.4032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sM/8/BxhLNDQ8jmzU2NaJoRiK9RXWLzpeLchZCTbPiolfZw3HrYe/K8WvM9oK04Ca6QID7BfHkiSCg1JzYEDfHn6eEMwYGEuPSchYqmItFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4999
X-Proofpoint-GUID: kYy62KWt6m4jG_bbKXpT_h4f-4t8nzk1
X-Proofpoint-ORIG-GUID: kYy62KWt6m4jG_bbKXpT_h4f-4t8nzk1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_11,2023-06-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1011 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306150130
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 35F7Idkd030671
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 15:01:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103309

Reminder.

On 26-05-2023 19:11, Narpat Mali via lists.openembedded.org wrote:
> From: Narpat Mali <narpat.mali@windriver.com>
>
> In Django 3.2 before 3.2.19, 4.x before 4.1.9, and 4.2 before 4.2.1,
> it was possible to bypass validation when using one form field to
> upload multiple files. This multiple upload has never been supported
> by forms.FileField or forms.ImageField (only the last uploaded file was
> validated). However, Django's "Uploading multiple files" documentation
> suggested otherwise.
>
> Since, there is no ptest available for python3-django so have not teste=
d
> the patch changes at runtime.
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>   .../python3-django/CVE-2023-31047.patch       | 352 +++++++++++++++++=
+
>   .../python/python3-django_2.2.28.bb           |   2 +
>   2 files changed, 354 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-django=
/CVE-2023-31047.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-202=
3-31047.patch b/meta-python/recipes-devtools/python/python3-django/CVE-20=
23-31047.patch
> new file mode 100644
> index 0000000000..ab29a2ed97
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-django/CVE-2023-31047=
.patch
> @@ -0,0 +1,352 @@
> +From fd3215dec5d50aa1f09cb1f8eba193524e7379f3 Mon Sep 17 00:00:00 2001
> +From: Mariusz Felisiak <felisiak.mariusz@gmail.com>
> +Date: Thu, 25 May 2023 14:49:15 +0000
> +Subject: [PATCH] Fixed CVE-2023-31047, Fixed #31710
> +
> +-- Prevented potential bypass of validation when uploading multiple fi=
les using one form field.
> +
> +Thanks Moataz Al-Sharida and nawaik for reports.
> +
> +Co-authored-by: Shai Berger <shai@platonix.com>
> +Co-authored-by: nessita <124304+nessita@users.noreply.github.com>
> +
> +CVE: CVE-2023-31047
> +
> +Upstream-Status: Backport [https://github.com/django/django/commit/fb4=
c55d9ec4bb812a7fb91fa20510d91645e411b]
> +
> +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> +---
> + django/forms/widgets.py                       | 26 ++++++-
> + docs/releases/2.2.28.txt                      | 18 +++++
> + docs/topics/http/file-uploads.txt             | 65 ++++++++++++++++--
> + .../forms_tests/field_tests/test_filefield.py | 68 ++++++++++++++++++=
-
> + .../widget_tests/test_clearablefileinput.py   |  5 ++
> + .../widget_tests/test_fileinput.py            | 44 ++++++++++++
> + 6 files changed, 218 insertions(+), 8 deletions(-)
> +
> +diff --git a/django/forms/widgets.py b/django/forms/widgets.py
> +index e37036c..d0cc131 100644
> +--- a/django/forms/widgets.py
> ++++ b/django/forms/widgets.py
> +@@ -372,17 +372,41 @@ class MultipleHiddenInput(HiddenInput):
> +
> +
> + class FileInput(Input):
> ++    allow_multiple_selected =3D False
> +     input_type =3D 'file'
> +     needs_multipart_form =3D True
> +     template_name =3D 'django/forms/widgets/file.html'
> +
> ++    def __init__(self, attrs=3DNone):
> ++        if (
> ++            attrs is not None
> ++            and not self.allow_multiple_selected
> ++            and attrs.get("multiple", False)
> ++        ):
> ++            raise ValueError(
> ++                "%s doesn't support uploading multiple files."
> ++                % self.__class__.__qualname__
> ++            )
> ++        if self.allow_multiple_selected:
> ++            if attrs is None:
> ++                attrs =3D {"multiple": True}
> ++            else:
> ++                attrs.setdefault("multiple", True)
> ++        super().__init__(attrs)
> ++
> +     def format_value(self, value):
> +         """File input never renders a value."""
> +         return
> +
> +     def value_from_datadict(self, data, files, name):
> +         "File widgets take data from FILES, not POST"
> +-        return files.get(name)
> ++        getter =3D files.get
> ++        if self.allow_multiple_selected:
> ++            try:
> ++                getter =3D files.getlist
> ++            except AttributeError:
> ++                pass
> ++        return getter(name)
> +
> +     def value_omitted_from_data(self, data, files, name):
> +         return name not in files
> +diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
> +index 43270fc..854c6b0 100644
> +--- a/docs/releases/2.2.28.txt
> ++++ b/docs/releases/2.2.28.txt
> +@@ -20,3 +20,21 @@ CVE-2022-28347: Potential SQL injection via ``Query=
Set.explain(**options)`` on P
> + :meth:`.QuerySet.explain` method was subject to SQL injection in opti=
on names,
> + using a suitably crafted dictionary, with dictionary expansion, as th=
e
> + ``**options`` argument.
> ++
> ++Backporting the CVE-2023-31047 fix on Django 2.2.28.
> ++
> ++CVE-2023-31047: Potential bypass of validation when uploading multipl=
e files using one form field
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ++
> ++Uploading multiple files using one form field has never been supporte=
d by
> ++:class:`.forms.FileField` or :class:`.forms.ImageField` as only the l=
ast
> ++uploaded file was validated. Unfortunately, :ref:`uploading_multiple_=
files`
> ++topic suggested otherwise.
> ++
> ++In order to avoid the vulnerability, :class:`~django.forms.ClearableF=
ileInput`
> ++and :class:`~django.forms.FileInput` form widgets now raise ``ValueEr=
ror`` when
> ++the ``multiple`` HTML attribute is set on them. To prevent the except=
ion and
> ++keep the old behavior, set ``allow_multiple_selected`` to ``True``.
> ++
> ++For more details on using the new attribute and handling of multiple =
files
> ++through a single field, see :ref:`uploading_multiple_files`.
> +diff --git a/docs/topics/http/file-uploads.txt b/docs/topics/http/file=
-uploads.txt
> +index 21a6f06..c1ffb80 100644
> +--- a/docs/topics/http/file-uploads.txt
> ++++ b/docs/topics/http/file-uploads.txt
> +@@ -127,19 +127,54 @@ field in the model::
> +             form =3D UploadFileForm()
> +         return render(request, 'upload.html', {'form': form})
> +
> ++.. _uploading_multiple_files:
> ++
> + Uploading multiple files
> + ------------------------
> +
> +-If you want to upload multiple files using one form field, set the ``=
multiple``
> +-HTML attribute of field's widget:
> ++..
> ++    Tests in tests.forms_tests.field_tests.test_filefield.MultipleFil=
eFieldTest
> ++    should be updated after any changes in the following snippets.
> ++
> ++If you want to upload multiple files using one form field, create a s=
ubclass
> ++of the field's widget and set the ``allow_multiple_selected`` attribu=
te on it
> ++to ``True``.
> ++
> ++In order for such files to be all validated by your form (and have th=
e value of
> ++the field include them all), you will also have to subclass ``FileFie=
ld``. See
> ++below for an example.
> ++
> ++.. admonition:: Multiple file field
> ++
> ++    Django is likely to have a proper multiple file field support at =
some point
> ++    in the future.
> +
> + .. code-block:: python
> +     :caption: forms.py
> +
> +     from django import forms
> +
> ++
> ++    class MultipleFileInput(forms.ClearableFileInput):
> ++        allow_multiple_selected =3D True
> ++
> ++
> ++    class MultipleFileField(forms.FileField):
> ++        def __init__(self, *args, **kwargs):
> ++            kwargs.setdefault("widget", MultipleFileInput())
> ++            super().__init__(*args, **kwargs)
> ++
> ++        def clean(self, data, initial=3DNone):
> ++            single_file_clean =3D super().clean
> ++            if isinstance(data, (list, tuple)):
> ++                result =3D [single_file_clean(d, initial) for d in da=
ta]
> ++            else:
> ++                result =3D single_file_clean(data, initial)
> ++            return result
> ++
> ++
> +     class FileFieldForm(forms.Form):
> +-        file_field =3D forms.FileField(widget=3Dforms.ClearableFileIn=
put(attrs=3D{'multiple': True}))
> ++        file_field =3D MultipleFileField()
> +
> + Then override the ``post`` method of your
> + :class:`~django.views.generic.edit.FormView` subclass to handle multi=
ple file
> +@@ -159,14 +194,32 @@ uploads:
> +         def post(self, request, *args, **kwargs):
> +             form_class =3D self.get_form_class()
> +             form =3D self.get_form(form_class)
> +-            files =3D request.FILES.getlist('file_field')
> +             if form.is_valid():
> +-                for f in files:
> +-                    ...  # Do something with each file.
> +                 return self.form_valid(form)
> +             else:
> +                 return self.form_invalid(form)
> +
> ++        def form_valid(self, form):
> ++            files =3D form.cleaned_data["file_field"]
> ++            for f in files:
> ++                ...  # Do something with each file.
> ++            return super().form_valid()
> ++
> ++.. warning::
> ++
> ++   This will allow you to handle multiple files at the form level onl=
y. Be
> ++   aware that you cannot use it to put multiple files on a single mod=
el
> ++   instance (in a single field), for example, even if the custom widg=
et is used
> ++   with a form field related to a model ``FileField``.
> ++
> ++.. backportedfix:: 2.2.28
> ++
> ++   In previous versions, there was no support for the ``allow_multipl=
e_selected``
> ++   class attribute, and users were advised to create the widget with =
the HTML
> ++   attribute ``multiple`` set through the ``attrs`` argument. However=
, this
> ++   caused validation of the form field to be applied only to the last=
 file
> ++   submitted, which could have adverse security implications.
> ++
> + Upload Handlers
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +diff --git a/tests/forms_tests/field_tests/test_filefield.py b/tests/f=
orms_tests/field_tests/test_filefield.py
> +index 3357444..ba559ee 100644
> +--- a/tests/forms_tests/field_tests/test_filefield.py
> ++++ b/tests/forms_tests/field_tests/test_filefield.py
> +@@ -1,7 +1,8 @@
> + import pickle
> +
> + from django.core.files.uploadedfile import SimpleUploadedFile
> +-from django.forms import FileField, ValidationError
> ++from django.core.validators import validate_image_file_extension
> ++from django.forms import FileField, FileInput, ValidationError
> + from django.test import SimpleTestCase
> +
> +
> +@@ -82,3 +83,68 @@ class FileFieldTest(SimpleTestCase):
> +
> +     def test_file_picklable(self):
> +         self.assertIsInstance(pickle.loads(pickle.dumps(FileField()))=
, FileField)
> ++
> ++
> ++class MultipleFileInput(FileInput):
> ++    allow_multiple_selected =3D True
> ++
> ++
> ++class MultipleFileField(FileField):
> ++    def __init__(self, *args, **kwargs):
> ++        kwargs.setdefault("widget", MultipleFileInput())
> ++        super().__init__(*args, **kwargs)
> ++
> ++    def clean(self, data, initial=3DNone):
> ++        single_file_clean =3D super().clean
> ++        if isinstance(data, (list, tuple)):
> ++            result =3D [single_file_clean(d, initial) for d in data]
> ++        else:
> ++            result =3D single_file_clean(data, initial)
> ++        return result
> ++
> ++
> ++class MultipleFileFieldTest(SimpleTestCase):
> ++    def test_file_multiple(self):
> ++        f =3D MultipleFileField()
> ++        files =3D [
> ++            SimpleUploadedFile("name1", b"Content 1"),
> ++            SimpleUploadedFile("name2", b"Content 2"),
> ++        ]
> ++        self.assertEqual(f.clean(files), files)
> ++
> ++    def test_file_multiple_empty(self):
> ++        f =3D MultipleFileField()
> ++        files =3D [
> ++            SimpleUploadedFile("empty", b""),
> ++            SimpleUploadedFile("nonempty", b"Some Content"),
> ++        ]
> ++        msg =3D "'The submitted file is empty.'"
> ++        with self.assertRaisesMessage(ValidationError, msg):
> ++            f.clean(files)
> ++        with self.assertRaisesMessage(ValidationError, msg):
> ++            f.clean(files[::-1])
> ++
> ++    def test_file_multiple_validation(self):
> ++        f =3D MultipleFileField(validators=3D[validate_image_file_ext=
ension])
> ++
> ++        good_files =3D [
> ++            SimpleUploadedFile("image1.jpg", b"fake JPEG"),
> ++            SimpleUploadedFile("image2.png", b"faux image"),
> ++            SimpleUploadedFile("image3.bmp", b"fraudulent bitmap"),
> ++        ]
> ++        self.assertEqual(f.clean(good_files), good_files)
> ++
> ++        evil_files =3D [
> ++            SimpleUploadedFile("image1.sh", b"#!/bin/bash -c 'echo pw=
ned!'\n"),
> ++            SimpleUploadedFile("image2.png", b"faux image"),
> ++            SimpleUploadedFile("image3.jpg", b"fake JPEG"),
> ++        ]
> ++
> ++        evil_rotations =3D (
> ++            evil_files[i:] + evil_files[:i]  # Rotate by i.
> ++            for i in range(len(evil_files))
> ++        )
> ++        msg =3D "File extension =E2=80=9Csh=E2=80=9D is not allowed. =
Allowed extensions are: "
> ++        for rotated_evil_files in evil_rotations:
> ++            with self.assertRaisesMessage(ValidationError, msg):
> ++                f.clean(rotated_evil_files)
> +diff --git a/tests/forms_tests/widget_tests/test_clearablefileinput.py=
 b/tests/forms_tests/widget_tests/test_clearablefileinput.py
> +index 2ba376d..8d9e38a 100644
> +--- a/tests/forms_tests/widget_tests/test_clearablefileinput.py
> ++++ b/tests/forms_tests/widget_tests/test_clearablefileinput.py
> +@@ -161,3 +161,8 @@ class ClearableFileInputTest(WidgetTest):
> +         self.assertIs(widget.value_omitted_from_data({}, {}, 'field')=
, True)
> +         self.assertIs(widget.value_omitted_from_data({}, {'field': 'x=
'}, 'field'), False)
> +         self.assertIs(widget.value_omitted_from_data({'field-clear': =
'y'}, {}, 'field'), False)
> ++
> ++    def test_multiple_error(self):
> ++        msg =3D "ClearableFileInput doesn't support uploading multipl=
e files."
> ++        with self.assertRaisesMessage(ValueError, msg):
> ++            ClearableFileInput(attrs=3D{"multiple": True})
> +diff --git a/tests/forms_tests/widget_tests/test_fileinput.py b/tests/=
forms_tests/widget_tests/test_fileinput.py
> +index bbd7c7f..24daf5d 100644
> +--- a/tests/forms_tests/widget_tests/test_fileinput.py
> ++++ b/tests/forms_tests/widget_tests/test_fileinput.py
> +@@ -1,4 +1,6 @@
> ++from django.core.files.uploadedfile import SimpleUploadedFile
> + from django.forms import FileInput
> ++from django.utils.datastructures import MultiValueDict
> +
> + from .base import WidgetTest
> +
> +@@ -18,3 +20,45 @@ class FileInputTest(WidgetTest):
> +     def test_value_omitted_from_data(self):
> +         self.assertIs(self.widget.value_omitted_from_data({}, {}, 'fi=
eld'), True)
> +         self.assertIs(self.widget.value_omitted_from_data({}, {'field=
': 'value'}, 'field'), False)
> ++
> ++    def test_multiple_error(self):
> ++        msg =3D "FileInput doesn't support uploading multiple files."
> ++        with self.assertRaisesMessage(ValueError, msg):
> ++            FileInput(attrs=3D{"multiple": True})
> ++
> ++    def test_value_from_datadict_multiple(self):
> ++        class MultipleFileInput(FileInput):
> ++            allow_multiple_selected =3D True
> ++
> ++        file_1 =3D SimpleUploadedFile("something1.txt", b"content 1")
> ++        file_2 =3D SimpleUploadedFile("something2.txt", b"content 2")
> ++        # Uploading multiple files is allowed.
> ++        widget =3D MultipleFileInput(attrs=3D{"multiple": True})
> ++        value =3D widget.value_from_datadict(
> ++            data=3D{"name": "Test name"},
> ++            files=3DMultiValueDict({"myfile": [file_1, file_2]}),
> ++            name=3D"myfile",
> ++        )
> ++        self.assertEqual(value, [file_1, file_2])
> ++        # Uploading multiple files is not allowed.
> ++        widget =3D FileInput()
> ++        value =3D widget.value_from_datadict(
> ++            data=3D{"name": "Test name"},
> ++            files=3DMultiValueDict({"myfile": [file_1, file_2]}),
> ++            name=3D"myfile",
> ++        )
> ++        self.assertEqual(value, file_2)
> ++
> ++    def test_multiple_default(self):
> ++        class MultipleFileInput(FileInput):
> ++            allow_multiple_selected =3D True
> ++
> ++        tests =3D [
> ++            (None, True),
> ++            ({"class": "myclass"}, True),
> ++            ({"multiple": False}, False),
> ++        ]
> ++        for attrs, expected in tests:
> ++            with self.subTest(attrs=3Dattrs):
> ++                widget =3D MultipleFileInput(attrs=3Dattrs)
> ++                self.assertIs(widget.attrs["multiple"], expected)
> +--
> +2.40.0
> diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.=
bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
> index 9ef988176e..77a1a2a740 100644
> --- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
> +++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
> @@ -5,6 +5,8 @@ UPSTREAM_CHECK_REGEX =3D "/${PYPI_PACKAGE}/(?P<pver>(2\=
.2\.\d*)+)/"
>  =20
>   inherit setuptools3
>  =20
> +SRC_URI +=3D "file://CVE-2023-31047.patch"
> +
>   SRC_URI[sha256sum] =3D "0200b657afbf1bc08003845ddda053c7641b9b24951e5=
2acd51f6abda33a7413"
>  =20
>   RDEPENDS:${PN} +=3D "\
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102871): https://lists.openembedded.org/g/openembed=
ded-devel/message/102871
> Mute This Topic: https://lists.openembedded.org/mt/99149928/7199376
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[narpat.mali@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

