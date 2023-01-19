Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE808C46467
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 11:34:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.42970.1674128059432053996
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jan 2023 03:34:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=SJcFkjWm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0383287c4c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30J95kXj008391
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 11:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=2qruqy18SmM5Qzihu7GgJ6EqcTdJpV+k+gwCLoP8its=;
 b=SJcFkjWmA7T7BxccXN570rpVM0klcez+GMUSqQSzB1WOzDzxSdloEIfZeZ7vysfwoJvx
 bPOncJslgD3VSXVn8a5FDzh7hXfaOqnikLVV46jK703FS63Qk9Yt1VQVrqlHS7uoTVEC
 QzoneTuZux4kgnR1tLaT0EmiJqh6/Gg196eyPYhKpyzaUhOemYTr8IG+eqUX5zfLTUxD
 9ERRPW1Sght6Nh/fjEIME4wg0uZcZRY0caAYj6oXdCFaNzQ2d1IFO57HrOH13+l909p5
 1W9cd6CQdOM8M+0+bpEGMpCHqOMMpqwBqbyp84xLjY4p4cRXVximqf49uEfza4FRexBL lQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3jx6n66m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 11:34:18 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30JBVfLl014726
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 11:34:18 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3jx6n66k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jan 2023 11:34:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1dDNoxne7jIobFslX+DlW2xydfjJb3zgSYr2w0EbnxbS3xyWnPLNkrIFYXFJ5957MlXlTrzmaXxpzQIT452cJLjhqCjg68RpO0g/PmdMZmnzwwk5JDKGop69IyTFbayO8IjRaF8JeZHFlZdrDU9goSODh5VPanlsRmqi7RkwN+LYgKYhUlEOqIdFlow4OUaJNev2qTyRbIuvgjggHx4EgZo94bpc5qiGa2oncRMH3B9R2xt0zmXVkrsCLILcnL4sGqjyrFPw4afoRtlPdUggp/a5EvjFGqPv63B57mzNLzILkmPf+wzUJbBKyfAIBYxMkWeJJemjIP0O3U6FHXDPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qruqy18SmM5Qzihu7GgJ6EqcTdJpV+k+gwCLoP8its=;
 b=Ty+rBxFhm94K3nj2EkMAkWQp5FR9w9LkTmI65aqFYH3EDW138Xbu99r8JXlVvVSHFKBdxvkMv+VSTtYl8/Au/sIFdz02UOqvNoUkndb6IRQbST6ta0d69/KecOYbZHwoLPt3NfgH7sc0umIF/tS55V61g6KyEaNx52/Lfsdui6PndhkS1wWfEH5SlomGuvUceKe0qcYy5nJmKUM1T5VZJAaP+yXCzDyp4hokT8p5h3UPxT8BZa/h3tWGWbRItE6HthrSNjlHioDaJJaWxJgr6QMnTBRNaRfyvCpwYPlXdMvTQDlZJMPm7dMnWFOUl5q/1Uiz3y/4fdwG2fBbG6lTUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM4PR11MB7301.namprd11.prod.outlook.com (2603:10b6:8:10a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 11:34:14 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%7]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 11:34:14 +0000
Message-ID: <dd74601a-abc5-b262-8cc5-68042d4d25db@windriver.com>
Date: Thu, 19 Jan 2023 06:34:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-networking][PATCH] crda: remove recipe
Content-Language: en-CA
To: kai.kang@windriver.com, raj.khem@gmail.com, troth@openavr.org
Cc: openembedded-devel@lists.openembedded.org
References: <20230119083744.33977-1-kai.kang@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230119083744.33977-1-kai.kang@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::29) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DM4PR11MB7301:EE_
X-MS-Office365-Filtering-Correlation-Id: 6befb188-affb-4206-3c69-08dafa111736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+cVaoy5NR7cyytfYWQIDicaQhNdeugtSTHzyOvU6psEQTRug5k3ZaT9DEb2b/x80LRPA1NWwLh7E/cmhZUrR7Bj+xhN1vKNFBlghYt8RifDYmISutgGnVseyhF1D++300piCZLz3WlutMDtaEi4A95I8C3FAscltP0vS0zQlLEKmg5wRZb0hCvKiYEmWMpPd1cUV4vSVltBkyV1dtMEzkP/yDlKBBQRhZNa6FYcVQeTRE5e8xAnXoUOzsvn4AB4DASNKM6ySHu1GelITOFmavGMiSx9EsU7koSvq1U2DHB2ivdJVH0wLJbPoVlmTMTamhBMbgCJ8sJgCq6yyc1dm1l945sVXJlWkWFHnlF+lK7cHSN44F5WKO7L+tPkKAY5RoK44cEN70F+ZmmhITNs03GKqA19W9qM5actU68boTGhXEzxQb0IQCXJN9Oaglljo3dauLglC5Hlx5e5iMGqrLtZWrAYt1U7gXNHd6L+IgtlI9bSC27aVRTzLQKxmbHIcP8Atji0f4W2UP5ZsJm+9HHBSFPCqyygzXVZ6WDaq5YTA9q5iZ2iwIsV32Jr5vOMyjxDj1CfNWWR2CH/pk6sWfX4hn62zkFFjCZdeFcmK3CgdkBpeaojpl+UU+UpjmE/fBGeP16YJfTetZ6D84Ym0vDBx0EO3ZrWAdpTie1wqKiy9IZLSulug+vKC55uSc08c67Hkfb5+8ffyJQheExlK69ljRgtM2cgwhZcVNXijsLnHL4Q/PdDvxJqO83C1xVdrJ/Ha5vfnldpN3bvyoZfdzVXmLrEasgae1xJL4DRx7vQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(396003)(376002)(346002)(366004)(136003)(451199015)(86362001)(316002)(53546011)(6506007)(6666004)(31696002)(6486002)(966005)(478600001)(36756003)(8936002)(5660300002)(30864003)(66476007)(66556008)(66946007)(38100700002)(4326008)(8676002)(41300700001)(186003)(26005)(6512007)(2616005)(2906002)(4001150100001)(66574015)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TU1SSk9BV09sWGRrRTVXUkNwRXZtTHk5dWNldGF5a2p6bEM4TFNPZmkwOXc0?=
 =?utf-8?B?SUhhNXJwTmcrNUE1NmlEdEpQTjYwbDFIOVhCbnNLVUJMblA2T1hIQmhDMEdw?=
 =?utf-8?B?RGdxRUF3ZFUxclJ6QXQxdG93SHRRUDFqSTJXYkpZVW1nSWc2OGN1amNOK0Nx?=
 =?utf-8?B?UjBQK0VESGlFTjROcjNqWmxKWGVwRU95TGJIbmVySHQvWmRiaEFVWkM0cTQ1?=
 =?utf-8?B?RHViNy9MT3ZPQmdOamx0aXkwZGpFTlV6R2NFOXBHWWhNYVZSbkJFTlRoYW1y?=
 =?utf-8?B?NkM0WjJXN1BwcjNJWXBpeDExN290TldydXlpTUo5ZlRIQTV1c2ZaRXlMWDdZ?=
 =?utf-8?B?ek8yajc4Ui9tK3ptVEJ5RjlFRTZaYkRncFpuOWgzd2JTZVBSZ0JSRDVpeTNi?=
 =?utf-8?B?MFJEZGJ4U1VvSjFQNHR4Z2ZpVTBHWlJEYXlHQ3RhMVBjSWRLeC9CQWdhM3Bz?=
 =?utf-8?B?ZkE2N1hWOEQ4eVVYcE05Qnd5aHlGSzJLSHFibDcydG52YXcvQTduYm9rS2R1?=
 =?utf-8?B?Qm9INzNkc2pKNDA0L1dPdUcrb3JjL1YxT0lHV1lwZVJZVGpjQ3I3amVwemd1?=
 =?utf-8?B?UTFCeG1oN013YW5ZQlNsakFxTjB1L0RhRnlidXIyRkVTL2hxRmFyc3oyT0pn?=
 =?utf-8?B?TU4xWUxEcVJWR3JndHdYdVdueG9FcnNYa0tlWTVYZnJPNHFHM1hEbXpCVDJt?=
 =?utf-8?B?L3R2YzRTbzNGOVZTd29TVFdmRTdrbVRGNE9QRUk4RytmNjBqbnlxWHZEc3By?=
 =?utf-8?B?cEg3THl1TTFGdUQ2cjZDRXJGNXowcjdRSEVOMFZ0Z2dmbURCRGVWYm9Mcnkv?=
 =?utf-8?B?TzJDSzhwTzFaUDExNXhwTngycmVGU2tGUEVXdEpmMkY2ckZSbDI5MUpTRG5y?=
 =?utf-8?B?QVN5a2h3VXhuQ0t1TGNpcmx6QkMwaXg0TkpnNy9ibjRSc1hQdThUeEQzK1RH?=
 =?utf-8?B?ZmJHSmZnbkZWVDZvL3RvYUtIWCtrMXF0VTIzazY2QkdmSlNSZDluZG5NbFZK?=
 =?utf-8?B?VTFWbzZzdkR0eUpWbko4dHc0OC8rZUpEckU1K2R6aHlEaHdueVZhQU13azJa?=
 =?utf-8?B?blI1UnM3eHZ5VGZnL2Uwc2p6RmVvYWxiUWJ6c3BLSVl1MXd5QkxOQmdibjA5?=
 =?utf-8?B?YURCT2VvM1B4OS95MTE5azljU3JRWEI1RVZJTzFQUHpmU3p2aEVsOGU3NWtO?=
 =?utf-8?B?NE4rY2JTamdtMnp2WlZxRGRvdGd0ZkVJeGJFWUJpRjRIVnNpMHdBdWxKdy9V?=
 =?utf-8?B?SVIyZ1VSVERrSEFEbGxkc2RjQ00wcWh1anlYTFZWRk5yUmYrOEY0Vk5QU2M4?=
 =?utf-8?B?NCtmV2lMd1V2SmxyUlg5ZE9BdWZVZnV2dy9WUXlrRkRVWHZXVFBqR3NBdHhQ?=
 =?utf-8?B?dGNFZUVndFN3cnp2RFUydys0ejRMZjYrbnNLV0Q5WlJ1dUtMTzFCZFlaazVW?=
 =?utf-8?B?c1VNRnNuT3VVRW9COVpHK3JVS2FUcngzKzFpNkFwMm9pVGpCaGVuSW0wcThN?=
 =?utf-8?B?aEFaMlRpZFdvYzh6bHFUN3V4ZlVCUG5xZ3BkRG5ST05NbGFKQmF2OEdwSHNP?=
 =?utf-8?B?WWhiL2Q3MzZ5UzJjWlJYN0NpZ2ZWREZIaWRqbThBVysybG1Yd1RzT1hJUEJC?=
 =?utf-8?B?UG9YTTdyZkdBYWExbXZ6VWg5T0pVM0trNEJ0Qkk0TmVlVFpacG5TZWFScUIr?=
 =?utf-8?B?TllQYkFXc29TZkZ3eENESFNQYU4rUGtxdUdKZ2Q5Q005S0tTK3RFOWNsa0hT?=
 =?utf-8?B?Y3NDVE1FN0JEUzBNVkVuUHBrdy8ydU5jTFI2emU0Y3RqdENNM04yNUZYeGJ0?=
 =?utf-8?B?cXEwd0EzOUxoTnlJdEptMm1TdEp6WVBmcTFVemhKZW5PWE9BcHlLUFJucVBW?=
 =?utf-8?B?dWJNU0VhWUN6NlYxNDVzOVNpOUZBelZhSUhzMCsybS95VlRDWko1V0dqeG8y?=
 =?utf-8?B?RFdnTndyNHBPV0N2MkFpTDVVQWRQOWpMcXNFb3N6Wm9GSURyZlBTa0d5b09V?=
 =?utf-8?B?cVBwQUIzeHNYQWFFYUc1QzZTTVVKZHZRMHh3NnkrSUhXS0hLdDNLUVMzbzdT?=
 =?utf-8?B?S3NMYnpxVFA2TExvM0l3RHpjK2tHQnJudUdqU3dwTTdKb3RKUFAzbGlKYjdP?=
 =?utf-8?B?di9GdWJ1ZXQwd0JkVlZWYXdpMXN0cjdnckJEUEdiaVA1SVlhbTM0NzN1Smxy?=
 =?utf-8?B?UXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6befb188-affb-4206-3c69-08dafa111736
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 11:34:13.9977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zI8N2DdyoJteMjm2mjs3k2qOKz0tf2lfD0I5jq6XHjtLJfDlWGBf7moLch43edcLQjqgpTCAit0ehYoB+73VF09AnFh3tfnfwUC3zPPbzlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7301
X-Proofpoint-GUID: yMLlP3N3LONk81Qx1pPB6d84zQ8ZDzCp
X-Proofpoint-ORIG-GUID: V1bZ0j51Ao3x-9ZpEnBb6XnBO9oQ2HE_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-19_09,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301190090
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 30J95kXj008391
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 11:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100656

Add Theo, who changed crda earlier this year:

   https://lists.openembedded.org/g/openembedded-devel/message/97671

Does anyone really still need crda?

../Randy

On 2023-01-19 03:37, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>=20
> CRDA is no longer needed as of kernel v4.15 since commit 007f6c5e6eb45
> ("cfg80211: support loading regulatory database as firmware file") adde=
d
> support to use the kernel's firmware request API which looks for the
> firmware on /lib/firmware. Because of this CRDA is legacy software for
> older kernels, remove the recipe.
>=20
> It could change regulatory domains with iw and wpa_supplicant.
>=20
> Refs
> 1. https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/crda.git/tree=
/README#n8
> 2. https://wireless.wiki.kernel.org/en/developers/Regulatory/CRDA
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   ...-Make-alpha2-to-be-3-characters-long.patch |  31 ------
>   ...-Makefile-respect-LDFLAGS-for-libreg.patch |  29 -----
>   .../0001-reglib-Remove-unused-variables.patch |  59 ----------
>   .../crda/crda/crda-4.14-python-3.patch        | 101 -----------------=
-
>   ...o-not-run-ldconfig-if-destdir-is-set.patch |  21 ----
>   .../crda/fix-gcc-6-unused-variables.patch     |  11 --
>   .../crda/fix-issues-when-USE_OPENSSL-1.patch  |  58 ----------
>   ...-linking-of-libraries-used-by-reglib.patch |  57 ----------
>   .../recipes-connectivity/crda/crda/make.patch |  25 -----
>   ...e-target-word-size-instead-of-host-s.patch |  34 ------
>   .../recipes-connectivity/crda/crda_3.18.bb    |  40 -------
>   11 files changed, 466 deletions(-)
>   delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes=
-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch
>   delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes=
-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch
>   delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes=
-connectivity/crda/crda/0001-reglib-Remove-unused-variables.patch
>   delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes=
-connectivity/crda/crda/crda-4.14-python-3.patch
>   delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes=
-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch
>   delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes=
-connectivity/crda/crda/fix-gcc-6-unused-variables.patch
>   delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes=
-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
>   delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes=
-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch
>   delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes=
-connectivity/crda/crda/make.patch
>   delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes=
-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch
>   delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes=
-connectivity/crda/crda_3.18.bb
>=20
> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connect=
ivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch b/meta-net=
working/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-Ma=
ke-alpha2-to-be-3-characters-long.patch
> deleted file mode 100644
> index f1d2cbc5a..000000000
> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/c=
rda/crda/0001-Make-alpha2-to-be-3-characters-long.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 078e962d345fd0536fe7ba797485ee1a4159c032 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 4 Feb 2022 09:18:30 -0800
> -Subject: [PATCH] Make alpha2 to be 3 characters long
> -
> -Fixes buffer overflow
> -reglib.c:969:9: error: 'sscanf' may overflow; destination buffer in ar=
gument 3 has size 2, but the corresponding specifier may require size 3 [=
-Werror,-Wfortify-source]
> -                      alpha2,
> -                      ^
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - reglib.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/reglib.c b/reglib.c
> -index e00e9b8..8565a0b 100644
> ---- a/reglib.c
> -+++ b/reglib.c
> -@@ -958,7 +958,7 @@ reglib_parse_rules(FILE *fp, struct ieee80211_regd=
omain *trd)
> - static int reglib_parse_country_dfs(char *line, struct ieee80211_regd=
omain *rd)
> - {
> - 	char dfs_region_alpha[9];
> --	char alpha2[2];
> -+	char alpha2[3];
> - 	int hits;
> -
> - 	memset(rd, 0, sizeof(*rd));
> ---
> -2.35.1
> -
> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connect=
ivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch b/meta-net=
working/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-Ma=
kefile-respect-LDFLAGS-for-libreg.patch
> deleted file mode 100644
> index 16800d506..000000000
> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/c=
rda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 1e1a78b7b4fa1662b4447aa19c15b1e839b7e9db Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Stefan=3D20M=3DC3=3DBCller-Klieser?=3D <s.mueller-kl=
ieser@phytec.de>
> -Date: Wed, 24 Aug 2016 10:58:45 +0200
> -Subject: [PATCH] Makefile: respect LDFLAGS for libreg
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de=
>
> ----
> - Makefile | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/Makefile b/Makefile
> -index 2879896..1650db8 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -116,7 +116,7 @@ keys-%.c: utils/key2pub.py $(wildcard $(PUBKEY_DIR=
)/*.pem)
> -
> - $(LIBREG): regdb.h reglib.h reglib.c
> - 	$(NQ) '  CC  ' $@
> --	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIBREG) =
$^ $(LIBREGLDLIBS)
> -+	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIBREG) =
$^ $(LDFLAGS) $(LIBREGLDLIBS)
> -
> - install-libreg-headers:
> - 	$(NQ) '  INSTALL  libreg-headers'
> ---
> -1.9.1
> -
> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connect=
ivity/crda/crda/0001-reglib-Remove-unused-variables.patch b/meta-networki=
ng/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-reglib-=
Remove-unused-variables.patch
> deleted file mode 100644
> index c6c3c53f1..000000000
> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/c=
rda/crda/0001-reglib-Remove-unused-variables.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -From 1bd6ff9d10c83afbc9954fc38b953e9167e6d4a9 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 28 Aug 2022 14:01:55 -0700
> -Subject: [PATCH] reglib: Remove unused variables
> -
> -These counters are not used anywhere therefore delete them
> -Fixes
> -reglib.c:1015:15: error: variable 'i' set but not used [-Werror,-Wunus=
ed-but-set-variable]
> -        unsigned int i =3D 0;
> -                     ^
> -reglib.c:1062:15: error: variable 'lines' set but not used [-Werror,-W=
unused-but-set-variable]
> -        unsigned int lines =3D 0;
> -                     ^
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - reglib.c | 4 ----
> - 1 file changed, 4 deletions(-)
> -
> -diff --git a/reglib.c b/reglib.c
> -index 8565a0b..6c62c2c 100644
> ---- a/reglib.c
> -+++ b/reglib.c
> -@@ -1012,7 +1012,6 @@ static int reglib_find_next_country_stream(FILE =
*fp)
> - {
> - 	fpos_t prev_pos;
> - 	int r;
> --	unsigned int i =3D 0;
> -
> - 	while(1) {
> - 		char line[1024];
> -@@ -1030,7 +1029,6 @@ static int reglib_find_next_country_stream(FILE =
*fp)
> - 		line_p =3D fgets(line, sizeof(line), fp);
> - 		if (line_p =3D=3D line) {
> - 			if (strspn(line, "\n") =3D=3D strlen(line)) {
> --				i++;
> - 				continue;
> - 			}
> - 			if (strncmp(line, "country", 7) !=3D 0)
> -@@ -1059,7 +1057,6 @@ struct ieee80211_regdomain *reglib_parse_country=
(FILE *fp)
> -
> - FILE *reglib_create_parse_stream(FILE *f)
> - {
> --	unsigned int lines =3D 0;
> - 	FILE *fp;
> -
> - 	fp =3D tmpfile();
> -@@ -1076,7 +1073,6 @@ FILE *reglib_create_parse_stream(FILE *f)
> - 		if (line_p =3D=3D line) {
> - 			if (strchr(line, '#') =3D=3D NULL) {
> - 				fputs(line, fp);
> --				lines++;
> - 			}
> - 			continue;
> - 		} else
> ---
> -2.37.2
> -
> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connect=
ivity/crda/crda/crda-4.14-python-3.patch b/meta-networking/dynamic-layers=
/meta-python/recipes-connectivity/crda/crda/crda-4.14-python-3.patch
> deleted file mode 100644
> index 9125d0ab9..000000000
> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/c=
rda/crda/crda-4.14-python-3.patch
> +++ /dev/null
> @@ -1,101 +0,0 @@
> -Imported from Gentoo
> -https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=3D9c50acec16bc7c3=
3d6dc122c007d713e7fbecf9c
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ---- a/utils/key2pub.py
> -+++ b/utils/key2pub.py
> -@@ -1,22 +1,22 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> -
> - import sys
> - try:
> -        from M2Crypto import RSA
> --except ImportError, e:
> -+except ImportError as e:
> -        sys.stderr.write('ERROR: Failed to import the "M2Crypto" modul=
e: %s\n' % e.message)
> -        sys.stderr.write('Please install the "M2Crypto" Python module.=
\n')
> -        sys.stderr.write('On Debian GNU/Linux the package is called "p=
ython-m2crypto".\n')
> -        sys.exit(1)
> -
> - def print_ssl_64(output, name, val):
> --    while val[0] =3D=3D '\0':
> -+    while val[0:1] =3D=3D b'\0':
> -         val =3D val[1:]
> -     while len(val) % 8:
> --        val =3D '\0' + val
> -+        val =3D b'\0' + val
> -     vnew =3D []
> -     while len(val):
> --        vnew.append((val[0], val[1], val[2], val[3], val[4], val[5], =
val[6], val[7]))
> -+        vnew.append((val[0:1], val[1:2], val[2:3], val[3:4], val[4:5]=
, val[5:6], val[6:7], val[7:8]))
> -         val =3D val[8:]
> -     vnew.reverse()
> -     output.write('static BN_ULONG %s[%d] =3D {\n' % (name, len(vnew))=
)
> -@@ -34,13 +34,13 @@ def print_ssl_64(output, name, val):
> -     output.write('};\n\n')
> -
> - def print_ssl_32(output, name, val):
> --    while val[0] =3D=3D '\0':
> -+    while val[0:1] =3D=3D b'\0':
> -         val =3D val[1:]
> -     while len(val) % 4:
> --        val =3D '\0' + val
> -+        val =3D b'\0' + val
> -     vnew =3D []
> -     while len(val):
> --        vnew.append((val[0], val[1], val[2], val[3], ))
> -+        vnew.append((val[0:1], val[1:2], val[2:3], val[3:4]))
> -         val =3D val[4:]
> -     vnew.reverse()
> -     output.write('static BN_ULONG %s[%d] =3D {\n' % (name, len(vnew))=
)
> -@@ -81,21 +81,21 @@ struct pubkey {
> -
> - static struct pubkey keys[] __attribute__((unused))=3D {
> - ''')
> --    for n in xrange(n + 1):
> -+    for n in range(n + 1):
> -         output.write('	KEYS(e_%d, n_%d),\n' % (n, n))
> -     output.write('};\n')
> -     pass
> -
> - def print_gcrypt(output, name, val):
> -     output.write('#include <stdint.h>\n')
> --    while val[0] =3D=3D '\0':
> -+    while val[0:1] =3D=3D b'\0':
> -         val =3D val[1:]
> -     output.write('static const uint8_t %s[%d] =3D {\n' % (name, len(v=
al)))
> -     idx =3D 0
> -     for v in val:
> -         if not idx:
> -             output.write('\t')
> --        output.write('0x%.2x, ' % ord(v))
> -+        output.write('0x%.2x, ' % (v if sys.version_info[0] >=3D3 els=
e ord(v)))
> -         idx +=3D 1
> -         if idx =3D=3D 8:
> -             idx =3D 0
> -@@ -118,7 +118,7 @@ struct key_params {
> -
> - static const struct key_params keys[] __attribute__((unused))=3D {
> - ''')
> --    for n in xrange(n + 1):
> -+    for n in range(n + 1):
> -         output.write('	KEYS(e_%d, n_%d),\n' % (n, n))
> -     output.write('};\n')
> -
> -@@ -136,7 +136,7 @@ except IndexError:
> -     mode =3D None
> -
> - if not mode in modes:
> --    print 'Usage: %s [%s] input-file... output-file' % (sys.argv[0], =
'|'.join(modes.keys()))
> -+    print('Usage: %s [%s] input-file... output-file' % (sys.argv[0], =
'|'.join(modes.keys())))
> -     sys.exit(2)
> -
> - output =3D open(outfile, 'w')
> -@@ -154,3 +154,5 @@ for f in files:
> -     idx +=3D 1
> -
> - modes[mode][1](output, idx - 1)
> -+
> -+output.close()
> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connect=
ivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch b/meta-networ=
king/dynamic-layers/meta-python/recipes-connectivity/crda/crda/do-not-run=
-ldconfig-if-destdir-is-set.patch
> deleted file mode 100644
> index 3ef35ee54..000000000
> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/c=
rda/crda/do-not-run-ldconfig-if-destdir-is-set.patch
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -From: Ben Hutchings <ben@decadent.org.uk>
> -Date: Sat, 23 Aug 2014 12:27:34 -0700
> -Subject: crda: Do not run ldconfig if DESTDIR is set
> -
> -Upstream-Status: Backport [http://www.spinics.net/lists/linux-wireless=
/msg126028.html]
> -
> -Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> -Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> -
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -132,7 +132,9 @@ install-libreg:
> - 	$(NQ) '  INSTALL  libreg'
> - 	$(Q)mkdir -p $(DESTDIR)/$(LIBDIR)
> - 	$(Q)cp $(LIBREG) $(DESTDIR)/$(LIBDIR)/
> -+ifndef DESTDIR
> - 	$(Q)ldconfig
> -+endif
> -
> - %.o: %.c regdb.h $(LIBREG)
> - 	$(NQ) '  CC  ' $@
> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connect=
ivity/crda/crda/fix-gcc-6-unused-variables.patch b/meta-networking/dynami=
c-layers/meta-python/recipes-connectivity/crda/crda/fix-gcc-6-unused-vari=
ables.patch
> deleted file mode 100644
> index 747804d34..000000000
> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/c=
rda/crda/fix-gcc-6-unused-variables.patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> ---- crda-3.18/utils/key2pub.py.orig	2016-06-18 09:54:23.671326113 -040=
0
> -+++ crda-3.18/utils/key2pub.py	2016-06-18 09:54:34.387326300 -0400
> -@@ -115,7 +115,7 @@
> - 	.n =3D _n, .len_n =3D sizeof(_n),	\
> - }
> -
> --static const struct key_params keys[] =3D {
> -+static const struct key_params keys[] __attribute__((unused))=3D {
> - ''')
> -     for n in xrange(n + 1):
> -         output.write('	KEYS(e_%d, n_%d),\n' % (n, n))
> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connect=
ivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch b/meta-networking/dyn=
amic-layers/meta-python/recipes-connectivity/crda/crda/fix-issues-when-US=
E_OPENSSL-1.patch
> deleted file mode 100644
> index 1bb5c638f..000000000
> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/c=
rda/crda/fix-issues-when-USE_OPENSSL-1.patch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -From 8d2164a090f17286ea8291f30a123595cf447dc3 Mon Sep 17 00:00:00 2001
> -From: Haiqing Bai <Haiqing.Bai@windriver.com>
> -Date: Wed, 30 Nov 2016 10:27:36 +0800
> -Subject: [PATCH] crda: fix issues when 'USE_OPENSSL=3D1'.
> -
> -Fxed the below issues if configured with 'USE_OPENSSL=3D1':
> -a. keys-ssl.c uses BN_ULONG but doesn't include the openssl headers le=
ading
> -   to build failures:
> -   keys-ssl.c:2:8: error: unknown type name 'BN_ULONG'
> -   static BN_ULONG e_0[1] =3D {
> -
> -b. The large unqualified constants also break building:
> -   keys-ssl.c:8:2: warning: overflow in implicit constant conversion [=
-Woverflow]
> -     0x63a2705416a0d8e1, 0xdc9fca11c8ba757b,
> -
> -c. keys-ssl.c: error: 'keys' defined but not used [-Werror=3Dunused-va=
riable]
> -   static struct pubkey keys[] =3D {
> -
> -Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> -Upstream-Status: Pending
> -Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> ----
> - utils/key2pub.py | 5 +++--
> - 1 file changed, 3 insertions(+), 2 deletions(-)
> -
> -diff --git a/utils/key2pub.py b/utils/key2pub.py
> -index 401d58a..3ae00b8 100755
> ---- a/utils/key2pub.py
> -+++ b/utils/key2pub.py
> -@@ -24,7 +24,7 @@ def print_ssl_64(output, name, val):
> -     for v1, v2, v3, v4, v5, v6, v7, v8 in vnew:
> -         if not idx:
> -             output.write('\t')
> --        output.write('0x%.2x%.2x%.2x%.2x%.2x%.2x%.2x%.2x, ' % (ord(v1=
), ord(v2), ord(v3), ord(v4), ord(v5), ord(v6), ord(v7), ord(v8)))
> -+        output.write('0x%.2x%.2x%.2x%.2x%.2x%.2x%.2x%.2xULL, ' % (ord=
(v1), ord(v2), ord(v3), ord(v4), ord(v5), ord(v6), ord(v7), ord(v8)))
> -         idx +=3D 1
> -         if idx =3D=3D 2:
> -             idx =3D 0
> -@@ -60,6 +60,7 @@ def print_ssl_32(output, name, val):
> - def print_ssl(output, name, val):
> -     import os
> -     output.write('#include <stdint.h>\n')
> -+    output.write('#include <openssl/bn.h>\n')
> -     if os.getenv('TARGET_BITS') =3D=3D '64':
> -         return print_ssl_64(output, name, val)
> -     else:
> -@@ -78,7 +79,7 @@ struct pubkey {
> -
> - #define KEYS(e,n)	{ KEY(e), KEY(n), }
> -
> --static struct pubkey keys[] =3D {
> -+static struct pubkey keys[] __attribute__((unused))=3D {
> - ''')
> -     for n in xrange(n + 1):
> -         output.write('	KEYS(e_%d, n_%d),\n' % (n, n))
> ---
> -1.9.1
> -
> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connect=
ivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch b/meta-netw=
orking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-link=
ing-of-libraries-used-by-reglib.patch
> deleted file mode 100644
> index 812e98379..000000000
> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/c=
rda/crda/fix-linking-of-libraries-used-by-reglib.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -From 890f5bf2654b695a866262d72bfa9750af921a3b Mon Sep 17 00:00:00 2001
> -From: Ben Hutchings <ben@decadent.org.uk>
> -Date: Sat, 23 Aug 2014 12:26:37 -0700
> -Subject: [PATCH] Fix linking of libraries used by libreg
> -
> -The math and crypto libraries are called by and need to be linked to
> -libreg.so, not to the executables.
> -
> -Upstream-Status: Backport [http://www.spinics.net/lists/linux-wireless=
/msg126027.html]
> -
> -Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> -Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ----
> - Makefile | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index a3ead30..da2dcc3 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -30,7 +30,7 @@ CFLAGS +=3D -std=3Dgnu99 -Wall -Werror -pedantic
> - CFLAGS +=3D -Wall -g
> - LDLIBREG +=3D -lreg
> - LDLIBS +=3D $(LDLIBREG)
> --LDLIBS +=3D -lm
> -+LIBREGLDLIBS +=3D -lm
> - LIBREG +=3D libreg.so
> - LDFLAGS +=3D -L ./
> -
> -@@ -40,13 +40,13 @@ all_noverify: $(LIBREG) crda intersect regdbdump d=
b2rd optimize
> -
> - ifeq ($(USE_OPENSSL),1)
> - CFLAGS +=3D -DUSE_OPENSSL -DPUBKEY_DIR=3D\"$(RUNTIME_PUBKEY_DIR)\" `p=
kg-config --cflags openssl`
> --LDLIBS +=3D `pkg-config --libs openssl`
> -+LIBREGLDLIBS +=3D `pkg-config --libs openssl`
> -
> - $(LIBREG): keys-ssl.c
> -
> - else
> - CFLAGS +=3D -DUSE_GCRYPT
> --LDLIBS +=3D -lgcrypt
> -+LIBREGLDLIBS +=3D -lgcrypt
> -
> - $(LIBREG): keys-gcrypt.c
> -
> -@@ -116,7 +116,7 @@ keys-%.c: utils/key2pub.py $(wildcard $(PUBKEY_DIR=
)/*.pem)
> -
> - $(LIBREG): regdb.h reglib.h reglib.c
> - 	$(NQ) '  CC  ' $@
> --	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIBREG) =
$^
> -+	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIBREG) =
$^ $(LIBREGLDLIBS)
> -
> - install-libreg-headers:
> - 	$(NQ) '  INSTALL  libreg-headers'
> ---
> -2.7.4
> -
> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connect=
ivity/crda/crda/make.patch b/meta-networking/dynamic-layers/meta-python/r=
ecipes-connectivity/crda/crda/make.patch
> deleted file mode 100644
> index 0b737852c..000000000
> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/c=
rda/crda/make.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -These headers are not related to any Make rule but they do appear in
> -compiling of libreg.so, specifying .h files in compiler cmdline is fla=
gged
> -as error by clang
> -
> -| clang-4.0: error: cannot specify -o when generating multiple output =
files
> -| make: *** [libreg.so] Error 1
> -
> -This is how we see headers in cmdline
> --O2 -fpic -std=3Dgnu
> -99 -Wall -Werror -pedantic -Wall -g -DUSE_GCRYPT -DCONFIG_LIBNL30 `pkg=
-config --cflags libnl-3.0`  -o libreg.so -shared -Wl,-soname,libreg.so
> -regdb.h reglib.h reglib.c keys-gcrypt.c -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -Wl,--as-needed -L ./ -lm -lgcrypt
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ---- a/Makefile.kk	2016-11-15 04:54:53.338670000 +0000
> -+++ a/Makefile	2016-11-15 04:55:07.718670000 +0000
> -@@ -114,7 +114,7 @@ keys-%.c: utils/key2pub.py $(wildcard $(
> - 	$(NQ) '  Trusted pubkeys:' $(wildcard $(PUBKEY_DIR)/*.pem)
> - 	$(Q)./utils/key2pub.py --$* $(wildcard $(PUBKEY_DIR)/*.pem) $@
> -
> --$(LIBREG): regdb.h reglib.h reglib.c
> -+$(LIBREG): reglib.c
> - 	$(NQ) '  CC  ' $@
> - 	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIBREG) =
$^ $(LDFLAGS) $(LIBREGLDLIBS)
> -
> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connect=
ivity/crda/crda/use-target-word-size-instead-of-host-s.patch b/meta-netwo=
rking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/use-targe=
t-word-size-instead-of-host-s.patch
> deleted file mode 100644
> index 100b765f2..000000000
> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/c=
rda/crda/use-target-word-size-instead-of-host-s.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From c1c42513edd27c97341f2033af77c13a4724eb8f Mon Sep 17 00:00:00 2001
> -From: Haiqing Bai <Haiqing.Bai@windriver.com>
> -Date: Fri, 25 Nov 2016 16:48:01 +0800
> -Subject: [PATCH] crda: Use target word size instead of host's.
> -
> -In key2pub.py, the codes check the wordsize
> -of the host machine but not the target's, this fix
> -fetches the wordsize of target from the build system.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> ----
> - utils/key2pub.py | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/utils/key2pub.py b/utils/key2pub.py
> -index 3e84cd2..401d58a 100755
> ---- a/utils/key2pub.py
> -+++ b/utils/key2pub.py
> -@@ -58,9 +58,9 @@ def print_ssl_32(output, name, val):
> -     output.write('};\n\n')
> -
> - def print_ssl(output, name, val):
> --    import struct
> -+    import os
> -     output.write('#include <stdint.h>\n')
> --    if len(struct.pack('@L', 0)) =3D=3D 8:
> -+    if os.getenv('TARGET_BITS') =3D=3D '64':
> -         return print_ssl_64(output, name, val)
> -     else:
> -         return print_ssl_32(output, name, val)
> ---
> -1.9.1
> -
> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connect=
ivity/crda/crda_3.18.bb b/meta-networking/dynamic-layers/meta-python/reci=
pes-connectivity/crda/crda_3.18.bb
> deleted file mode 100644
> index 2f4d4dac9..000000000
> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/c=
rda/crda_3.18.bb
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -SUMMARY =3D "Wireless Central Regulatory Domain Agent"
> -HOMEPAGE =3D "http://wireless.kernel.org/en/developers/Regulatory/CRDA=
"
> -SECTION =3D "net"
> -LICENSE =3D "copyleft-next-0.3.0"
> -LIC_FILES_CHKSUM =3D "file://copyleft-next-0.3.0;md5=3D8743a2c359037d4=
d329a31e79eabeffe"
> -
> -DEPENDS =3D "python3-m2crypto-native libnl libgcrypt"
> -
> -SRC_URI =3D "https://www.kernel.org/pub/software/network/${BPN}/${BP}.=
tar.xz \
> -           file://do-not-run-ldconfig-if-destdir-is-set.patch \
> -           file://fix-linking-of-libraries-used-by-reglib.patch \
> -           file://fix-gcc-6-unused-variables.patch \
> -           file://0001-Makefile-respect-LDFLAGS-for-libreg.patch \
> -           file://make.patch \
> -           file://use-target-word-size-instead-of-host-s.patch \
> -           file://fix-issues-when-USE_OPENSSL-1.patch \
> -           file://crda-4.14-python-3.patch \
> -           file://0001-Make-alpha2-to-be-3-characters-long.patch \
> -           file://0001-reglib-Remove-unused-variables.patch \
> -"
> -SRC_URI[md5sum] =3D "0431fef3067bf503dfb464069f06163a"
> -SRC_URI[sha256sum] =3D "43fcb9679f8b75ed87ad10944a506292def13e4afb194a=
fa7aa921b01e8ecdbf"
> -
> -inherit pkgconfig python3-dir python3native siteinfo
> -
> -# Recursive make problem
> -EXTRA_OEMAKE =3D "MAKEFLAGS=3D DESTDIR=3D${D} LIBDIR=3D${libdir}/crda =
LDLIBREG=3D'-Wl,-rpath,${libdir}/crda -lreg' \
> -                UDEV_RULE_DIR=3D${nonarch_base_libdir}/udev/rules.d/"
> -TARGET_BITS =3D "${SITEINFO_BITS}"
> -export TARGET_BITS
> -
> -do_compile() {
> -    oe_runmake all_noverify
> -}
> -
> -do_install() {
> -    oe_runmake SBINDIR=3D${sbindir}/ install
> -}
> -
> -RDEPENDS:${PN} =3D "udev wireless-regdb"

--=20
# Randy MacLeod
# Wind River Linux


