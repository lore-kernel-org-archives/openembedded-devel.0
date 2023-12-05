Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDED7C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 01:43:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.89169.1701740628582954875
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Dec 2023 17:43:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=CAbEgxG0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0703390de8=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B51RSGA007181
	for <openembedded-devel@lists.openembedded.org>; Mon, 4 Dec 2023 17:43:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=bCYE+eG7nZPZrhU5hXMcVmchx0utcsd7YMZskxfQ108=; b=
	CAbEgxG0X2JIJ24RqJidOcQYK7HZMsHDX1xUjoArO+obTDIfgSSEgb+odpL7AgJC
	t7MKwavmDmfaIvCp6/10xJxVfka67fMzUFtqOUSVJeKElkuL5xutlbL73cSPZgnX
	9sglZDkAlvCxpyqVurDAoPFdHm6rM7qgJj0tLOl075SM4Ei515KyS1Mnbm9XCTNw
	TAtG7cQjT37pnXjm2R+O5S0fiuOo2myop837YZTptanQkonwFTF5//8qSuTMBY3g
	RXO6v30/Qrsd010qnj80xNgX3Tgrdk5f4j+y7u4ezLRERNPYCVB2XGE5OsXDDiPH
	wX/epiqAU6AP9ae2PVi9Xw==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ur4ym203y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 17:43:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AComsiUHQjv/RHh+WQyCelWa63Fn1kW9OhMROecM95neAn85CiB9YeWRT/4nj/fzUqo1dy5a+LwMIHc3EhSL+/P2RdHXWWKR5wOZTwAuavS9u9osC/9akQQsPgAXlHq6rJOfIAyW0TBhB41t6O7J1lavaVrNlnCX4VLBoaCpkSOfB/NFgg5KGRBdRskY+cqUs7Jpnz7XjKJ0/sLj+tyG7BD0waZ7TLLi8w1J6LMdl8BG3v+gvmcgGpzT3rtgGJcmNyIlE2V/DJ8UAXAAH4q8ap77l+NIavk/y4udWA53tjUuef2RE5KmYlFUbWUuQD5+2+V5Efjq/V72xnf7LwKHkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bCYE+eG7nZPZrhU5hXMcVmchx0utcsd7YMZskxfQ108=;
 b=DeUZVC3h5twcDGlp0GnBvtB3B3YHtvmY2kSozFRRmpzNQEclyDg8yIoCmqAnniO21IHvIGzacfLf1nFVVX1HiRvZXb1+Xaea1yJGAZHYeAlc6fkkCORd6sEeN/yRJWRvXRo0fvc8LM9HWq3HaD4cuZhn+t7GXo6OVT4XtY/fCoLSQgb9ZcnH9KU6W7GkuATFeMJXX6xQ2eyzhcP5h9NbUjUeuMuzVBjHUOtEfaulF0hsUoBfNyouLYZBvf0Qg8cH5/v/EbA5HGGIFpoQLj5VTpeCTFiobrfgm2vyidY7g2OUVgoYkzgvep7TabpVWCw1wesAdu3hr9dJeyy5zHjnZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SJ2PR11MB7425.namprd11.prod.outlook.com (2603:10b6:a03:4c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Tue, 5 Dec
 2023 01:43:45 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::4b52:5e25:a620:592]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::4b52:5e25:a620:592%7]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 01:43:45 +0000
Message-ID: <dac27014-6297-40b6-997e-f55fbab81024@windriver.com>
Date: Tue, 5 Dec 2023 09:43:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [V2][master][PATCH] cpuid: fix do_install
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <179DCBA638A51FD2.24600@lists.openembedded.org>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <179DCBA638A51FD2.24600@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCPR01CA0208.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::16) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SJ2PR11MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: 45276014-ab32-401b-f840-08dbf5339e64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HDrotAFq9375BMGF6H6r2UAw6Gb+brwZehHk+nQRQd7/hnF0qKmOdK+Hjka9hxurGNmhtVTBJ8qYTRcD2SG0/5cA1hXYRKA1YFfsJqKvfkfWyQvMR5FnpNZBqYh/wN9zew+wtwpK5lo+OgNGS+xgy8mJ67+Krbh4yNjo1VIgO8MV1rmMU+PAgBowbqdLosvAZj5DM5UdCmgMZAsRCCZEAh3X4TffYOmUEY4tyzdeu7+7vXSQCAdMKgqHmJtOfL12CEMkoyKqGZMvHHfq3EzwKTh21Nj2Fy54kCHOZ6sh+WLPbfl9Cc5aspqSVyPXEHNd6a6+gXyXT4TCcPIXgP3t060Kgvvyq3aes6KMhtpeAnCz260P24ctGVLhiDnRZLxVTQ25ubxh3AOkf45+YpoB0Q1mqEr5WvTJ+MdHQVVtkJhDuulLUvOU/1JRoEStOBX+4OsZfmi0JI/8L1hHX8Pq+1X6iWRjQun3/QNyKXvbx01ioMMCLT8xlLnbAUkz7wnItcz73yFbgnPqFLbXRRlog7xz43vHzPfjFUypKciZ2Dv4a8Vujr6A/uKysDrvP4soYgYPPOJbm2iIHbLNSM7sNtvV4ucPUkCopyIQYNE6jt+70QLvPxmPSTNTYBX6q+XriBW5e/W6JtGFqqOYuFJSbEK5noclqHcTlQA7lMokl1E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66899024)(6916009)(66476007)(8936002)(86362001)(316002)(8676002)(44832011)(31696002)(66556008)(66946007)(966005)(478600001)(6486002)(36756003)(41300700001)(2906002)(5660300002)(26005)(2616005)(6506007)(6512007)(53546011)(83380400001)(6666004)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aGlTSlliY0xJa0t4a3B4RDZwdm5JQ0k4aC93U2txTnBUQUtGRXhVdGRVVWxx?=
 =?utf-8?B?SjVKQkgzUTBkUEhocFZuK254aDZzV2UxK3J0amo0UjVEOEp5WUtUaGpodytO?=
 =?utf-8?B?TzVMZTMxR0RvTHdINHpDTTJwZC9oZ2plRTdPV0hFbkdTTjhRWXhkd1lQT2tK?=
 =?utf-8?B?Vms1NkxDYmM3N3VFRTQyTEZzcVpEQTA2VEFhTXpoRHducm15dGROWW96T2o1?=
 =?utf-8?B?V254dXRwdk9mNmt3cDhkQjNUY0lITnhrRnV0T3lmM2Z5YU41c1JLcWpWUGtw?=
 =?utf-8?B?ejJMNkZyOFNzZk03U3Irc2srSmlCN0hPTG5sQm91U2FNTzFoRFF4RU9LOUFK?=
 =?utf-8?B?bzJ3c0ZqbUxJdVF3OHA3N0FDckloMHhsOHBaSEhsSVNpODlKa250YlIxeWdr?=
 =?utf-8?B?U3F0WU1DdkNvOVR2S0RZdzNUeVZmMnZMWmNqZlJ6OE11eWpSSlpiMGZEc05v?=
 =?utf-8?B?cGhXT2d0SmlUNmdudkw1V3lndXBRMlYrZ2E3WXhudTNVMWRMYWhBSkt5eDNN?=
 =?utf-8?B?ZEJTNGw5WFZVV3c4eExXNUlTVWlHZkdkc1NYWmJYZkttSFJPT0xrd2lMdkp2?=
 =?utf-8?B?U2RPbzg0UENqcnFYNmJXajBKdWVadFBYVzZLTVdqblIzaUVMYkhwU1l6Umlv?=
 =?utf-8?B?eHhUaTZrbXJLc2dWMDd4VVk4MzRTSDZldGx3akZ6d04yTkt3MnRBQVhFeHBp?=
 =?utf-8?B?S3JDYlJ6UW5YNTVGZ1dNSDdkcDNXbVJPemhGdWZtUHNIcFhvTlh5RGFURjBu?=
 =?utf-8?B?aWlXRVZ0ZUYyVmVSeTdUMW9CWnpBMVZQUVoyREd5R3loRGZyNExqQkNselJ5?=
 =?utf-8?B?WktBSjM5TlpIYmwwSFBrU1Z5VlNEYTR3ZDNiS09tVXdTb1FNUFlwekp4a1J1?=
 =?utf-8?B?RWlyTmp3RXFjcU8wc0RQRnlYTndtazZZK2xrWTNyUk1JSTI5ZC9TQ3V3R1Q5?=
 =?utf-8?B?YzMyRyt3SjhLaUxCVm5DT3BpTEhEUEJucE5wdzdydWVHN0V5MDdpQlJNdzFK?=
 =?utf-8?B?SzM2eFU2YWVrY3lob3J1WFVCQ3J6UCtOMWt5cGFtM3k5VSsrY0VIc0lROHNC?=
 =?utf-8?B?YUJVR2ZSa3JyaG5PTzNNYlRtbE1UWXZ3NWM1YmVXTFhqLzQ0bEl2Mk96dXA3?=
 =?utf-8?B?NFo0TGNhV1hjb0J3aGVmanJOeUNwY0lMTlhsdkJTckFhQjN3bkJjWDV3ZjR6?=
 =?utf-8?B?TXlZaER0b2FRSnFlQy9lb3pjU3JLdDh6NDdPTC8wM2szQVhDSnlkVjcwY2Fx?=
 =?utf-8?B?WmZIMkdleXk1SUlEN2l2Rm04VlplVDRybTM2bXdwcDFsUG81NTRjMVJVYkc4?=
 =?utf-8?B?aDllbHZFNDJlRm9XNWplOWtzV2JNOVNsSFdnTWJLL1VaTVpEdmdYVG9xTnNz?=
 =?utf-8?B?NXFMT2VvczNkZHFMQ2FGYmRWYjN4KzVFUzZmZm1WQnAxU0VPdDJ5eG1vK2hQ?=
 =?utf-8?B?MWNmR01BUStqNm4wZDlBa2tzdk40NE1ZdEtIdGJlL2RkZDBHUmY0KzlJUEFj?=
 =?utf-8?B?dmU0V2t5dnp5S0VFTjhaRkhEU1h6QS93NC80TmVMVG1yN0h3d1FQR2k1SmUw?=
 =?utf-8?B?MlF3UytuZVFmMW5ONTNmQmo5Ynk0UzRIdlQ4SHROVFRvKzloK1E3LzdFazN0?=
 =?utf-8?B?WkhKTVdBUkQzQmQ3bmhPRm8wSCtqajc4VndpckJoWGhQaDNOd00vZU9FbnBE?=
 =?utf-8?B?OUo5S1A5ZnZic0FTbGx1eG4vVTA3S2FmVUN0WkM0YnB1Rnc0VjkvWWNVWGto?=
 =?utf-8?B?SURJc0RkWWNCNEdJNjkvampLWG5BaTdBY3BPSGlIeUwrWkRnVG1wYkQrR1dE?=
 =?utf-8?B?QXdyR3RHaEZzVkNpUzhHNGhiOG1NSVRUZVVtZWRkd3RSN3p6ck5Ma2xwNE51?=
 =?utf-8?B?ditETENQTkNHTVBEVnR1QlFxRXdRcHJGZHI0NUh5dDFFeDNlYS9FanM4OUwy?=
 =?utf-8?B?NTh4MStiS2lyWjBHZnU1TDRiQ2EvS3Q1S1lIdEFYQVNHNHpNTEtxUU1QK0I5?=
 =?utf-8?B?TU1WVkl0bGd3MUZvem1nYWNiSGh5MWZvYzk0djdaSmpNR0NSdGVlS1hnMXkv?=
 =?utf-8?B?QlJqZ0UzSlNqdlZZVkZIWW5OclBMN0xLdHJORFFxa0JsTnVJNitLYmFnanA2?=
 =?utf-8?B?SVdaYllvQnpVMXU0cmZrVzkrYkROUmxZTWtFSHFzUytIbmFBbE1OMXpwNGpK?=
 =?utf-8?B?dkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45276014-ab32-401b-f840-08dbf5339e64
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 01:43:45.5962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iqhqTonQJ9wOZ/zJn/0MWWdPQTMTEayQRONRV1OalmVoFr4W7RHRCQ7Od4vIJQSjK79b6CfO4SN6nwCDdMeGcOheuJmzdjf7slIbrcJcejc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7425
X-Proofpoint-GUID: KNIH9JbawAOaEirjDaDPLCvLflqNVTKx
X-Proofpoint-ORIG-GUID: KNIH9JbawAOaEirjDaDPLCvLflqNVTKx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=809
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2312050013
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3B51RSGA007181
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Dec 2023 01:43:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107219

Please ignore this mail,=C2=A0 thanks

//Changqing

On 12/5/23 09:35, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Fix do_install to make cpuid-doc installed correctly
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   .../recipes-devtools/cpuid/cpuid_20230614.bb  | 10 +++---
>   ...e-the-hardcode-path-to-bindir-mandir.patch | 36 ++++++++++++++++++=
+
>   2 files changed, 42 insertions(+), 4 deletions(-)
>   create mode 100644 meta-oe/recipes-devtools/cpuid/files/0001-Makefile=
-update-the-hardcode-path-to-bindir-mandir.patch
>
> diff --git a/meta-oe/recipes-devtools/cpuid/cpuid_20230614.bb b/meta-oe=
/recipes-devtools/cpuid/cpuid_20230614.bb
> index a88042ba65..ed339e0160 100644
> --- a/meta-oe/recipes-devtools/cpuid/cpuid_20230614.bb
> +++ b/meta-oe/recipes-devtools/cpuid/cpuid_20230614.bb
> @@ -8,6 +8,7 @@ LICENSE =3D "GPL-2.0-only"
>   LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db234ee4d69f5fce4486a80fdaf=
4a4263"
>  =20
>   SRC_URI =3D "http://www.etallen.com/${BPN}/${BP}.src.tar.gz \
> +           file://0001-Makefile-update-the-hardcode-path-to-bindir-man=
dir.patch \
>              "
>   SRC_URI[sha256sum] =3D "b1c83045efc26076307751e0662d580277f5f9bf89cf0=
27231a7812003c3a4e8"
>  =20
> @@ -15,9 +16,10 @@ COMPATIBLE_HOST =3D "(i.86|x86_64).*-linux"
>  =20
>   inherit perlnative
>  =20
> -# The install rule from the Makefile has hardcoded paths, so we duplic=
ate
> -# the actions to accommodate different paths.
>   do_install () {
> -    install -D -m 0755 ${B}/cpuid ${D}/${bindir}/cpuid
> -    install -D -m 0444 ${B}/cpuid.man.gz ${D}/${mandir}
> +    oe_runmake DESTDIR=3D${D} bindir=3D${bindir} mandir=3D${mandir} in=
stall
>   }
> +
> +RDEPENDS:${PN} =3D "perl"
> +
> +INSANE_SKIP:${PN} +=3D "already-stripped"
> diff --git a/meta-oe/recipes-devtools/cpuid/files/0001-Makefile-update-=
the-hardcode-path-to-bindir-mandir.patch b/meta-oe/recipes-devtools/cpuid=
/files/0001-Makefile-update-the-hardcode-path-to-bindir-mandir.patch
> new file mode 100644
> index 0000000000..43486338a7
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/cpuid/files/0001-Makefile-update-the-har=
dcode-path-to-bindir-mandir.patch
> @@ -0,0 +1,36 @@
> +From 1339348c5b69b32378a638d65b16297d29c5fa22 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Tue, 7 Nov 2023 16:06:49 +0800
> +Subject: [PATCH] Makefile: update the hardcode path to bindir/mandir
> +
> +Update the hardcode path to bindir/mandir
> +
> +Upstream-Status: pending
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + Makefile | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 828d2b1..365e26d 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -55,10 +55,10 @@ cpuinfo2cpuid.man.gz: cpuinfo2cpuid.man
> + 	gzip < $< > $@
> +
> + install: $(PROG) $(PROG).man.gz cpuinfo2cpuid cpuinfo2cpuid.man.gz
> +-	install -D $(INSTALL_STRIP) -m 755 $(PROG) $(BUILDROOT)/usr/bin/$(PR=
OG)
> +-	install -D -m 444 $(PROG).man.gz       $(BUILDROOT)/usr/share/man/ma=
n1/$(PROG).1.gz
> +-	install -D -m 755 cpuinfo2cpuid        $(BUILDROOT)/usr/bin/cpuinfo2=
cpuid
> +-	install -D -m 444 cpuinfo2cpuid.man.gz $(BUILDROOT)/usr/share/man/ma=
n1/cpuinfo2cpuid.1.gz
> ++	install -D $(INSTALL_STRIP) -m 755 $(PROG) $(BUILDROOT)${bindir}/$(P=
ROG)
> ++	install -D -m 444 $(PROG).man.gz       $(BUILDROOT)${mandir}/man1/$(=
PROG).1.gz
> ++	install -D -m 755 cpuinfo2cpuid        $(BUILDROOT)${bindir}/cpuinfo=
2cpuid
> ++	install -D -m 444 cpuinfo2cpuid.man.gz $(BUILDROOT)${mandir}/man1/cp=
uinfo2cpuid.1.gz
> +
> + clean:
> + 	rm -f $(PROG) $(PROG).i386 $(PROG).x86_64
> +--
> +2.25.1
> +
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107217): https://lists.openembedded.org/g/openembed=
ded-devel/message/107217
> Mute This Topic: https://lists.openembedded.org/mt/102984213/3616873
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[changqing.li@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

