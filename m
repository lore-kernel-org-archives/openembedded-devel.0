Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B92E95A8E
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 03:47:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.53809.1696823230577862153
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Oct 2023 20:47:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=RgMSLz1D;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=864643f306=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3993lAkX019101;
	Sun, 8 Oct 2023 20:47:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:cc:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=pd3kdHSBmXgDc9YpTuVRfWR2SzsyAmlDyNMpsacl4/A=; b=
	RgMSLz1DrW+RBbuTduxsq3/js41GxMUvlrnKemjePjtRKjjnLNuIS6Dt8HFNIXf8
	az1D251W0zrDTIGZhDjAAiWZoYKSottw2417BQHiR3xdciKCVKnbARKH1lzP3jot
	GSMDU7gCpBAOZAaLZFWH0PlEBpH4mYi07od0cB8VWA2aCqs3A1XjGQEyVsAgJ9Bb
	WAMj0Im1tYyW4ZE7vUIhNTmnd1oLMLDqefRMU5qe5xRPh6QvFQ6xoNCFftkmoVnh
	LXQBbcliOxrrjmlS/nuHU+Kf745qkQ2WFe/1DxcHZ71rGdfLfigKIjFwPRlQPkWJ
	YW9bNXzfnGK1FKVR5gLpXw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tk2m0h7u8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 08 Oct 2023 20:47:09 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 3993l9n8019092;
	Sun, 8 Oct 2023 20:47:09 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tk2m0h7u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Oct 2023 20:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vb10NOYglQGqLz834Q14l4X5vubjXAp6HTndWUQCPj+qX8VBN2pk8dcxR8m4+ItRw2Jp3oUWBMdkooEB+pnPa1t9I+AxY8bF4lBlXvyW2lvDTQqEJkOb9RLfaHcS0sVYgcpQQM1sGYxB0OaQ8vuWFyRyHuNNtvG5BgbnGM9BdFpyrJCp6rxMxnWUijCd/Gw9tPEEpIE3kbyESNIRNqTa7W9VzQm93TmhuflkNdhHgi1vRmJLx0Am4teyfsaNeq1r2Sws8o1GUOpd8HC8dkFhkqPA1KTXIWwQAYEGuyRCNEgLhYNvmFIMCKuqZKefp5qOA0sIL1iZgQPhyoOk5pf4SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pd3kdHSBmXgDc9YpTuVRfWR2SzsyAmlDyNMpsacl4/A=;
 b=FGNs8dQjZQS4jLobuu91ClbfEv6xay1bSEEYo+B/vxiXY8EdvFeSLTACnCEZMGVPo0hvG43UrWreKqt+whBclkOkBmXdVoCTT6D4oNssvNw3MR3ugmQT0eLPj1dk1gNWYzmJw8zA2dK5OCeO3nXEEuBJBfgYUsITNgKPyzJi+yG5/YMdUqmZ8kz95wyDP1XLQzfx1jbQLQJhdmFG40bJVocVq0hu2GPddzO8GfBDcMkweS188JVM/chLVaN9+QIruNg97qN3gtbWzh4zVAPnzXxyMyIfz8i/NdSHFmfKAiPGAdveRGc5IbgtUUUZD77nLyvpyXFW51Ou+CvWtmjpnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by DM4PR11MB6406.namprd11.prod.outlook.com (2603:10b6:8:8b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.43; Mon, 9 Oct
 2023 03:47:05 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::ba6c:1bf1:ca35:6df7]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::ba6c:1bf1:ca35:6df7%7]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 03:47:04 +0000
Message-ID: <f4d6873b-ed46-e602-cb3e-c0ba2590c93f@windriver.com>
Date: Mon, 9 Oct 2023 11:46:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [oe] [meta-oe] [PATCH] postgresql: upgrade 15.3 -> 15.4
Content-Language: en-US
To: akuster808 <akuster808@gmail.com>
References: <1692149883-5071-1-git-send-email-wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <1692149883-5071-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0092.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::10) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2557:EE_|DM4PR11MB6406:EE_
X-MS-Office365-Filtering-Correlation-Id: 7252e40c-c438-4bf3-45e1-08dbc87a670e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1rI6ubywsMykNmNbwn9atFC0Jk7frTqmenuftBJSv41JzROymMF9u5S5CErse702eTD0j/0y4SFKRIBGVvcOJsqcpBhPC+DVAnPBCWWys4tz9QvNBrkOkj9cLnzjmnCqggHcZYGGI7Jq/S8SIW39ewNVbmu/3BwNTBK+JAhW37RREvD+eob+7gSsjVFhu1qCYv522IrtRoUJoJ9HAtC4D5a2ZJlNFUcjyvFSx928ai/D8FQoLihqFtng35Q0zSfoV5Lrz84GskWK4xTuDbrTQtrIFq9/gpgZvTjZ1y234YssynGFF8BhOBhTeIxKZcsWtAyecCvhrGzZq53CoJym/YKPlnbQ6IL27F8FyMyQ2RCv0e63kw0h8IZ+hjlAk5LMb/5xg0EeGX6F3xbxVdT09AOItSifRbj5gEr2UYD3STjbrJJk09Mzmh5YyNLirgT0ZlBJWmwgVS1xzYJF2ciQXtw7XFqfvAQ13L9vRhuGqfjOwMAAKKlkDoAaplRwd0A/gqMWvJsww1YIe+Xh5nTShlnw2IKeCnzVtgb4+kUnTrfsT8ZlqUaLBFimK8JENQyJJ9gToLPHRXan0ExxWIZ5IlZAhuAEdn0IYwU+75wvzgGeSv9f9Ca5RkIKXsoR/s0UuXaNJh8vMzFgKqrXEsIbvQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(346002)(136003)(366004)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(31696002)(38100700002)(86362001)(36756003)(31686004)(66899024)(2906002)(6512007)(6486002)(966005)(478600001)(41300700001)(8936002)(5660300002)(4326008)(8676002)(53546011)(6666004)(44832011)(6506007)(83380400001)(2616005)(66556008)(66476007)(66946007)(316002)(6916009)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TW9uRm54Q3VodXY2YUFzZHRadjFuMU9oLy9jdkc0SW5KOVJKbjJUek1rcjZu?=
 =?utf-8?B?b0d3dzNaK0xLSnI4Q096TXFROTNKdm8vaGVBUXc0N3psYVZLZEFzbGIvNFFQ?=
 =?utf-8?B?VjFROGJsUCtMZzlsVmFVWjZMYjFJOFRON3g4dFZJbVlJQ3FmeTJaYkJMYkpt?=
 =?utf-8?B?ZnhCRTBLdE5kN0JIcDBMbG1MVHlzaDhvVFVabGdZSlgzZXhFbEY2MWR3b0t4?=
 =?utf-8?B?Ry9OcENHWk5WYmcxcEhueFlURUc1S21qdGZLS1d2RmxGdWZ2aVBpVGlBUjlq?=
 =?utf-8?B?TTVwT1ZrVkxTemZnR1VJdkJBejV3SFdBbko1eVVuR2diSUJHTEJKVGsvWThh?=
 =?utf-8?B?dytWSnhIQ2x0VFc2WmZDaERvK2hpQnh2OFdjZkVZVGFBZkI2VzNGdUV4OXdw?=
 =?utf-8?B?M2RaRk45SEcvRGFMY01kN2tmRUdMbXdSSEdnVlVIVjZtcU5MaVNITWlQczhs?=
 =?utf-8?B?WjhVVWttZE1YRXRDR3BQbGN1M2RpVlUzMXprZFRjc3FLdWZCR25OMVJmZGtF?=
 =?utf-8?B?dEVDa1NLNWM1OVBEY3AwVjdDWTNMZG9jRS9jbFBzeERWa01OU1BIVC9hckEx?=
 =?utf-8?B?MWExdktoT0pyd28zWFB2TXJ0dzQyWjRFTGV6cnMyQ0JuYzZ1SFg1TTlGNnRP?=
 =?utf-8?B?VWg5Z3ZFbmJySTVaYlhsMnd0S0RlL2NaSVZkYUVJR05hVlZ6NElmWnAzZnNO?=
 =?utf-8?B?dW5iK1EvYWRHOTRBc1BFRHAyQjR2bmFOcENmdmpnRnIvWkdqazV6aXdYeWg0?=
 =?utf-8?B?WWt6ekpoQnVnUG9EK3lZa2FZdFNYUUx0WUNRMWhYTDhqcnEvS21wbnhyeDgr?=
 =?utf-8?B?R3VScndhTUZOSjZRZ2k1eGR0a28zYzVQS25kS3lrQXo2OVIzL1dCOVNmLzNG?=
 =?utf-8?B?TVFZQWV0VEt2UE1IOVRQRkdBVC9HNUxnMzZaQWdlRCtld1VCMnVXbis1ak5C?=
 =?utf-8?B?Rk8yejk0dGhJdXJUc0kwU1JaK21NRG5UUlVoTnpsN3gyS282U05FeldIVGgx?=
 =?utf-8?B?QllQa3R6NTBPUXdPdytCNUJhaHg2all4WHRDOXI5SWJjTUZkS2xlSkJPeFFL?=
 =?utf-8?B?UWhQdnR5QWpvMlUrNVIxTGpZMnVWaEZwTXZNTGdpTUV5QXgrQk1FL2VSVHRD?=
 =?utf-8?B?UHdPWGE0WlNXRWtSUnY0UTdwTkpLeS9VWC9lWVdKZE9ncjl6ZC9lUHB6LzN4?=
 =?utf-8?B?YitEc2lZNXZnTzhXSkxQQjNjVHBzd05wMkszaWxwQ1UvU28ydkFxRlBCK2ZY?=
 =?utf-8?B?T2ltU1l2VkpkRTNHM0gwdHI1U29qTTk3V3RXQ1MvK2dmYXFlOXVBWWJLd2VV?=
 =?utf-8?B?NG1KU1YrOTllRFBxRm1mUXZVeWU5ejFKcjdrTUdYTU1QZUhtZ3A2YlJvV1lh?=
 =?utf-8?B?NHd5MW1RRGlJMGtBMllNWURNRWo5K2VPaWdZVWhlOVRtVXNNQ2diMUNud05q?=
 =?utf-8?B?clpOQ3VQYUxUbnJlTjRFd2FqbmhiY3pEaTR2b1RHaFR5T29oaUJPVWF6M3NE?=
 =?utf-8?B?UngvZzBjTDFxWXJaWWRsZ2ExZFRsZzZkMW9UTkowR3hWdWthQ2VxSW4wd2p3?=
 =?utf-8?B?aUlqWjFNcWxNUWVGSWZGNm9aN00zS1ZXMUZ1Qjg1amZYMWxNOG10aWxjbzhy?=
 =?utf-8?B?eWp1MlRURmpZY2UwZWxBS2lZNEJCdllScHlseWdVRDJ1UEtVVHhkOEE4SlR6?=
 =?utf-8?B?aU0zOEdYMHZ0T09oV3RzdVJUK2hvNEd1MG9VUEMwVFRmREZ3VGhBMkhmQXZJ?=
 =?utf-8?B?dFpiRFNRMzMyVm95WUZUT1FEY3BDY1ZJeXBNKzhVU203R2wraTkwUkU2Myts?=
 =?utf-8?B?cHZ5bUJJT3p3RUt6cUdEYlFIaGZ5aVJ4cFFuUExPb1FRRlQra3J1azRqdEgr?=
 =?utf-8?B?YzJFL08vek5wR2lMWk9EUW5yNXlEZGU4RjNQOW5NMDV1S1R0dytyMEt2M05U?=
 =?utf-8?B?cjdNejhnK1ZMSmYzUjg0UVJuZ1UyT1Vob3R6OGxOT2xNeGJXS01lSXBmOTZ4?=
 =?utf-8?B?QmZNQ1Z4TlpYRWtrbEZ1TzFGbmpwd3VNQ0U0TUFsWXFrQStBWWJUblVodnhp?=
 =?utf-8?B?cXhmQWZhb0Q2eXZvK3U3YXFpS3RCaENoZTNGaHA1TUZFa0pVSVdFY3dBUW5u?=
 =?utf-8?B?RGZIMnJ3YUdyYXAwVlVmaVBJMjNGOVBaRWJRcTBNaEp6TjBFZ2hhUjV5a0E3?=
 =?utf-8?B?aUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7252e40c-c438-4bf3-45e1-08dbc87a670e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 03:47:04.7917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +EwgwACMFVLN5kd2XYfBZLCUpmg5FOMu2Om1+sOLrcsaGOu+z2sx+1KQaS6z+CfHKqc2GQqxM62X9i38Mjd+QgcK/ZOsLkysX6Ke4qIP8jg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6406
X-Proofpoint-GUID: h_hsyG7jss1txZltQp_jZ2pSMsUZf1Fi
X-Proofpoint-ORIG-GUID: Yf9LSI7dpYtb4lANugbsPjokivBCFwoH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_01,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310090032
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3993lAkX019101
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Oct 2023 03:47:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105389

Hi,=C2=A0 Armin

Could you help to cherry-pick this patch to mickledore? Thanks


Regards

Changqing

On 8/16/23 09:38, wangmy wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0001-configure.ac-bypass-autoconf-2.69-version-check.patch
> refreshed for 15.4
>
> Changelog:
> https://www.postgresql.org/docs/release/15.4/
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>   ...-configure.ac-bypass-autoconf-2.69-version-check.patch | 8 +++++--=
-
>   .../postgresql/{postgresql_15.3.bb =3D> postgresql_15.4.bb} | 2 +-
>   2 files changed, 6 insertions(+), 4 deletions(-)
>   rename meta-oe/recipes-dbs/postgresql/{postgresql_15.3.bb =3D> postgr=
esql_15.4.bb} (86%)
>
> diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-byp=
ass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/fi=
les/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
> index 3c8187d1a2..fb70b22720 100644
> --- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-aut=
oconf-2.69-version-check.patch
> +++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-aut=
oconf-2.69-version-check.patch
> @@ -8,18 +8,17 @@ for upgrade to autoconf 2.71
>   Upstream-Status: Inappropriate [disable feature]
>
>   Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> -
>   ---
>    configure.ac | 4 ----
>    1 file changed, 4 deletions(-)
>
>   diff --git a/configure.ac b/configure.ac
> -index 998ff31..912e490 100644
> +index 524fdf1..3bea642 100644
>   --- a/configure.ac
>   +++ b/configure.ac
>   @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined ma=
cros
>
> - AC_INIT([PostgreSQL], [15.3], [pgsql-bugs@lists.postgresql.org], [], =
[https://www.postgresql.org/])
> + AC_INIT([PostgreSQL], [15.4], [pgsql-bugs@lists.postgresql.org], [], =
[https://www.postgresql.org/])
>
>   -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf=
 version 2.69 is required.
>   -Untested combinations of 'autoconf' and PostgreSQL versions are not
> @@ -28,3 +27,6 @@ index 998ff31..912e490 100644
>    AC_COPYRIGHT([Copyright (c) 1996-2022, PostgreSQL Global Development=
 Group])
>    AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
>    AC_CONFIG_AUX_DIR(config)
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_15.3.bb b/meta-o=
e/recipes-dbs/postgresql/postgresql_15.4.bb
> similarity index 86%
> rename from meta-oe/recipes-dbs/postgresql/postgresql_15.3.bb
> rename to meta-oe/recipes-dbs/postgresql/postgresql_15.4.bb
> index e1d49895f0..3aa2662891 100644
> --- a/meta-oe/recipes-dbs/postgresql/postgresql_15.3.bb
> +++ b/meta-oe/recipes-dbs/postgresql/postgresql_15.4.bb
> @@ -11,6 +11,6 @@ SRC_URI +=3D "\
>      file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
>   "
>
> -SRC_URI[sha256sum] =3D "ffc7d4891f00ffbf5c3f4eab7fbbced8460b8c0ee63c5a=
5167133b9e6599d932"
> +SRC_URI[sha256sum] =3D "baec5a4bdc4437336653b6cb5d9ed89be5bd5c0c58b94e=
0becee0a999e63c8f9"
>
>   CVE_STATUS[CVE-2017-8806] =3D "not-applicable-config: Ddoesn't apply =
to out configuration of postgresql so we can safely ignore it."
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104377): https://lists.openembedded.org/g/openembed=
ded-devel/message/104377
> Mute This Topic: https://lists.openembedded.org/mt/100771712/3616873
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[changqing.li@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

