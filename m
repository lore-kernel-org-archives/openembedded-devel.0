Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.47])
 by mx.groups.io with SMTP id smtpd.web11.2371.1614421114023023411
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Feb 2021 02:18:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gPz5hkq4;
 spf=pass (domain: windriver.com, ip: 40.107.223.47, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmhl8E1i3x9gJeoA+T5iu3/O/UjkplyJgE0olHGyJAWXM/4rqj/I5zc/WJM390W3DzByDQTrjbMZFSFXL6x/E1Dq0zJS5RuFznZWADsiHerz296e13WYsjnLXNkMxxARYQlhG7WXXINTS9IOjfo5krKPu5AwxC+s2vDFB4w4jPD+9No1R+QHfy/crbU/bXeBbYpaVPZu5lOBHlECYxvtcJFYwSYa9q3eOjv0oXvLolaoW+IXS05etj0UiLXPwo3phQSYg0RsZpS60NqEZHybQmJukEeOAwQENfCXlSXAEEgyGqloif770pd4nbUgDSadXkPQgyPSUYOI58KwyB2qqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvbdOXb77KhM8PqiOFvafe5hoqDbkV+i6iYj4A8FxG0=;
 b=Tf/rmh021VvKkLgdUnrkrOsJ6aCGphusnjhqesX/31h8amhZdChMDH17zAU0txrniEeBKNnLNVNds+9n3eEbnZikGC6chVO+ifpj2zatizuljcqtiRToaMslzgTm53vlOyRnYpAfcxqEBpl2I2oHrQNel7zvoxh33vjYJ6GNDSB8ct3zYvV8xyh3PUyRyCwMrbg7v/JUWhGcLftyIaebEjubcdErwUxHBwqfAJtjNI+UVTWzLmQjOrayEeMFTKiIYGf8zT5agaoGvZaZ52oSCitMMqB9Q5JrOlZwSqpOiOnpm2S6PKbIlSKU2KnOrEJm/UrMyPfQ/hc7Qqs+t3UIZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvbdOXb77KhM8PqiOFvafe5hoqDbkV+i6iYj4A8FxG0=;
 b=gPz5hkq43Yz8Lbx5e2CRHRyLLVPyut7pZJkCsJy7Mq9K8pZmaahmChvZcBG5CLbGSXtNYec2x0uiynDhOzEzWuwXQHsr63NTacbjXinLgPH3J1kR861GnwFD6Yf26WB69RRfHD6yCW6yVecyhgGIKdh4AHCYjAQ/eIMc8qwAQAc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BYAPR11MB3256.namprd11.prod.outlook.com (2603:10b6:a03:76::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Sat, 27 Feb
 2021 10:18:31 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::95a3:653e:2078:fb4]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::95a3:653e:2078:fb4%6]) with mapi id 15.20.3868.035; Sat, 27 Feb 2021
 10:18:31 +0000
Subject: Re: [oe][PATCH] lmbench: Install cache command and fix typos in manual page
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: openembedded-devel@lists.openembedded.org
References: <166650501510A6E8.6890@lists.openembedded.org>
Message-ID: <168f0c44-2ca5-1d5f-d6c9-df35bcd2e8e0@windriver.com>
Date: Sat, 27 Feb 2021 18:18:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <166650501510A6E8.6890@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR03CA0043.apcprd03.prod.outlook.com
 (2603:1096:202:17::13) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by HK2PR03CA0043.apcprd03.prod.outlook.com (2603:1096:202:17::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend Transport; Sat, 27 Feb 2021 10:18:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c5d09a2-ac73-4562-9239-08d8db0907f2
X-MS-TrafficTypeDiagnostic: BYAPR11MB3256:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB325657D4ED9CAD694B75EEDBE49C9@BYAPR11MB3256.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:40;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AiJ38SXg1f6egl7RhGkTbIJBOTh2O1m5Uv0os44AUN8b9o8tmlqleLa8As3XM9oldTkchtZiKMsWeXATIy3lOiuA49X/IYsVLj0O0Tgu1B8enq/SbryVphnksNL1bLOyIO1dCud9OXCd9U2XUttq+48Q3ev9bQDavRRWkTcsMexe7GED8bGkiGsll+IQD6h3WZ5aOgsDq6pFfImsvVCUwfIbUs7rWBKUlK07/qHAe9tgqN/CgfQ0hLfGMdDTkWYrqXtUUwQhn5+aC9hCkfot3HnhnwcallaIYE3iBF6dCXIQ+BLOYVfwe2s0Wjj1HwD5WAeRZgk7KMxKeS8rtZo2kgNbicpqI2VKmWmiEcRADEyQF0TQiB8eoLvMpXUna5GewgcSMSz57s/H093LZoSnpn/P8FTfZ/AKKeUipACYWvHUKKg7nGZlqBJ2HHnBntWxdz5okDygrHbclQziJnSQmov2T15irp/wStiEodIuDzjpSYKKWOmXD5dUpuGT64f1edbdalT4AbuQ7QUt6+cN4wc8RN4Yya78c7G/xa/xRGdSY/4SzyurKd4YbZ6tM16vXjxvHG5/tcR5KIbbh/audVvqIrcjoMy3cddW8A3C1nPMns1e8rdcupIdbJLHYcFT2IZNMb0ZyHdPrkQfrQVDAwTxCftbfYLQiTMd5lIMP8/w1bC1i9ioMxo5w0fKJ9SNWMikAN+iC1jLqkSuXiHAwA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(366004)(346002)(376002)(2616005)(53546011)(66556008)(956004)(26005)(6916009)(8936002)(6706004)(83380400001)(52116002)(186003)(16526019)(8676002)(6666004)(5660300002)(66476007)(66946007)(31696002)(6486002)(316002)(2906002)(966005)(86362001)(31686004)(478600001)(16576012)(36756003)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?WlI5eEhBY0tmTGF4eWhwRzhrUUkxZlF6RmF5QmR6Y0JJcVpsWndEY0ltblNw?=
 =?utf-8?B?MTRsOS8xc3ExV24wUWlOV2kycnNDOHhHNTduU2grc0hrSE9RSWJDbituZDEx?=
 =?utf-8?B?NWordzg3QjNQYitJZ1hYUkJCWWlZWW81ODNZRXUvYXAzMFViL0VHbDdqOW8x?=
 =?utf-8?B?RWlJTE9uWDIyUWg3MytzVGIyaVo4dXo5dE5EYkp1azlpZXlpVERvbnFIYVRD?=
 =?utf-8?B?WVBjTFlab2hSa09IU241U21CdFZiSlFTSmJwZksyMWxka2V4VEVucllXLzFV?=
 =?utf-8?B?WXF1M0VTWkNXclR0eEVoaUs3dFBxN2ZJZjd3b3BYRm9lN1VabVpnaENsSS80?=
 =?utf-8?B?SW80aUVWaEczQVAxV0JXUUtIREpmVERtNjF4c2ZEa2swd2xOdGdEb3hpZnVW?=
 =?utf-8?B?K1RwK1NuVGlyL3J1K1dqbjJNUEp4RlpZUTBMb2FiemZLUGZDWWFCRU1iem53?=
 =?utf-8?B?K1pqVW9ZcW93YWpPVVRpVmg2eHBXOWRrd29lUG5UZVZ2SWhBeDhaZ3JZVnpa?=
 =?utf-8?B?UUhFbi9KdEtZeFNESkFsMjRhM2Q4TE84aDl0clNaQUp3MTE1QmVqZVBPdzRq?=
 =?utf-8?B?bFluUkRFaXpFcHBOTTZ5em0vQXFFSTZma0tqaDVQRCt0NnJoQUQyc3hvMUxU?=
 =?utf-8?B?OHhiYmx1M1ZtVnhqSTFZQVZhcEI4eG1zbWR1aHR2aXlsSEhDUUhXSm1MTnZh?=
 =?utf-8?B?UmZFL0pUb2FOdjFxUmtKN0JLaUp6enp3cVl2U3I4aDdDV1FDOHE0aFRGOFo1?=
 =?utf-8?B?UjhpR2kvdmtrQTRydUdWTHF0NmU3SjQ5M2lsZzNJRlBDSmJncFpPZWEvZWZk?=
 =?utf-8?B?dnR2YjkwbVZiZ0dybFo1bm9QYmFnMElUMUEySXhBQ0dpa0VKOVdWVFdHMTZG?=
 =?utf-8?B?RDJxMWEzVytQNnZjTXRsTmZrV2YrUnBHaW1DcllGYmYzcnNQUThEeC9lREwv?=
 =?utf-8?B?VG5jajI5Y2VkeTIvVXc3QnBLOWdqcFFmWm9Gc0ZpMVNLNWlRSUc1UUEvdUk4?=
 =?utf-8?B?WlArQWZMc2tRUC93UHdCMW1CZkpIK3pTeEJNbnVrSFFOMXhveEFweHVQSGps?=
 =?utf-8?B?RUVPend5NVBMSmtSLzkyTDMvWU14S0c2QzlhbU00V0xNOHpCUHlXdkx4dzFR?=
 =?utf-8?B?dVFHTVZrdUthbk1ZQm1IdEF2TEYwd2ZzaVd1OG9kWitwSThmTFEwSVlJU1l6?=
 =?utf-8?B?WHhNYmEwVHhSSHZPV0pzOVJ6bS94Tm9ZYWRKb1AxY1JWUFdiVDl6aWUyclM1?=
 =?utf-8?B?Nzd3dFZiVmRYSmtQVGdvak9RZTIrcG5pNUc2NU9vSUU2WklhZWxUckI5OVBZ?=
 =?utf-8?B?Q3RRNHZFd2hjTGJ0eDljanYxcFdyRXpWOWFSSXEzQVNGU3U4SDBZRE9RMmNL?=
 =?utf-8?B?YnNmaFpZcTBNR1lNUlhKU2ppSW4raGV4Zlc5cHBXNkEyOXlUVTBUVTN6VUlU?=
 =?utf-8?B?TXJRZHovbWJCZWVtSEcwVTdNWVB2MzZQaWZ4NXNlTGE1RGpFVjY4OWFCaFhK?=
 =?utf-8?B?aXZNaVNRR1owemhTbTdMNzVXdG4yQWdlaStnSzB4RmswOENja21YZmtMZXdp?=
 =?utf-8?B?MzVqY2NSOEY4ZGtVd0EyS2t5WkN5N3V0amxTdGtDbVJCWjlicW9qK1A0RjN2?=
 =?utf-8?B?UGRBVmhPM1d3UVUyWkVxbDYwZk1aUFF0VjM5NWF4ZEhoQkhHZ2taRXlUVElH?=
 =?utf-8?B?VEg1Q0pUMWxadGV6MGVSNHUwTExaL3lFajFPWTNwcHhYcG84U2c5Y1hPUm1T?=
 =?utf-8?Q?fahFyNR1/swleQiMkfXCO8Zl8Z51SgzP1U2OWaV?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5d09a2-ac73-4562-9239-08d8db0907f2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4241.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2021 10:18:30.9960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WW8otTYX9NQaPc5KKeQYw1tXviHBxu+5xUKD6Pmft87/eBHBXwzEdEzkBftXhZoZSHSjQ8NCZrbEimxBBqlWKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3256
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Ping.

Yanfei

On 2/23/21 3:36 PM, Xu, Yanfei wrote:
> From: Yanfei Xu <yanfei.xu@windriver.com>
> 
> Cache command was omitted when install, now add it.
> Fix a few typos in lat_unix_connect manual page.
> 
> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> ---
>   ...ypos-in-lat_unix_connect-manual-page.patch | 30 +++++++++++++++++++
>   .../lmbench/lmbench_3.0-a9.bb                 |  2 ++
>   2 files changed, 32 insertions(+)
>   create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch
> 
> diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch
> new file mode 100644
> index 000000000..d49dac5b2
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch
> @@ -0,0 +1,30 @@
> +From 9bf2b363c5173c03adecf366f116415dbc559017 Mon Sep 17 00:00:00 2001
> +From: Yanfei Xu <yanfei.xu@windriver.com>
> +Date: Tue, 23 Feb 2021 10:54:26 +0800
> +Subject: [PATCH 1/2] doc: Fix typos in lat_unix_connect manual page
> +
> +Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> +---
> + doc/lat_unix_connect.8 | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/doc/lat_unix_connect.8 b/doc/lat_unix_connect.8
> +index b42e9a4..5ab1a51 100644
> +--- a/doc/lat_unix_connect.8
> ++++ b/doc/lat_unix_connect.8
> +@@ -25,9 +25,9 @@ is a client/server program that measures interprocess
> + connection latencies.   The benchmark times the creation and connection of
> + an AF_UNIX socket to a local server.
> + .LP
> +-.B lat_connect
> +-has three forms of usage: as a server (-s), as a client (lat_connect),
> +-and as a shutdown (lat_connect -S).
> ++.B lat_unix_connect
> ++has three forms of usage: as a server (-s), as a client (lat_unix_connect),
> ++and as a shutdown (lat_unix_connect -S).
> + .SH OUTPUT
> + The reported time is in microseconds per connection.
> + Output format is like so
> +--
> +2.27.0
> +
> diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> index 21e81ecf2..e9d1067d4 100644
> --- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> +++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> @@ -29,6 +29,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
>              file://0001-lmbench-Point-webpage-lm-to-target-directory.patch \
>              file://0001-doc-Fix-typos-in-manual-pages.patch \
>              file://0001-lat_fifo-Fix-cleanup-sequence.patch \
> +           file://0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch \
>              "
>   SRC_URI[md5sum] = "b3351a3294db66a72e2864a199d37cbf"
>   SRC_URI[sha256sum] = "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8a2a551"
> @@ -73,6 +74,7 @@ do_install () {
>               -C src install
>       mv ${D}${bindir}/line ${D}${bindir}/lm_line
>       install -m 0755 ${WORKDIR}/lmbench-run ${D}${bindir}/
> +    install -m 0755 ${S}/bin/${TARGET_SYS}/cache ${D}${bindir}/
>       sed -i -e 's,^SHAREDIR=.*$,SHAREDIR=${datadir}/${BPN},;' \
>              -e 's,^CONFIG=.*$,CONFIG=`$SCRIPTSDIR/config`,;' \
>              ${D}${bindir}/lmbench-run
> 
> 
> 
> 
> 
