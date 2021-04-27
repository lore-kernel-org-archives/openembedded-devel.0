Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.43])
 by mx.groups.io with SMTP id smtpd.web11.8831.1619532275010671386
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Apr 2021 07:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=N5Ubf/Y/;
 spf=pass (domain: windriver.com, ip: 40.107.236.43, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ghttOqWOrvEg8t1GNEmI3cwkIwBLWcc0q4knpkZGjdV3YavRCgsRxK/uE1lqyMk8dTb71PQW91Hq18DGNxLpqCMnIykxcRXF4HyaJtJebMoOnTXfRgREFt9P5mgmfvmSndHCfI6HNtk81FL9pVWV/mFlj+8k9kOYwoxVSwVqBfiSaH0AMZaAmdWcHMLWyCLJHjOjdXgv4guOY7PZk/2joY4QXQSYR7Z34Aw3cI+y42U3yICLOXjRSQdQDORxbTJWqAtKVUHsHgrOA2yBpQCbp19DIemboCc0yTbfokCm4UbL/R9Hg1IbMBk/SJyOyPTneXwLuP7IWrqjazZkhvNz/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4rkLyhMMIsGcZyHd+5xByFomyzBM3wSnR8624dQugU=;
 b=OrYpoxO5NxjBTk1R25INQDFVye2aWHac83JaXAtUW1IQCI2k12DMfFjrMNHgwbXx+9WMSIK9zQB6YBA7eDUy/D4LMAQQSdKTuWLDbsLCRr1xSVxYyb/mswHRDSJXCDiQNEp2bMvYXnW/+t+uM/P4+8ulo1FUKq5qpLMtSKNd63kKS5UkterFkCvpCkRhvSbst7hmv20Pq0i7QfcySxRMDi4dsIQujXWdIGxh+akforW4NCBjXDl8JgkZywy2i5soCjp6uJQUHfdoWmVMzGEMOB4UcUSvQeLx6MhoLsvQ2BcD9EHvoII85dlerqREfJ9le/mM2D5sBWxGXQgu9H2Cgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4rkLyhMMIsGcZyHd+5xByFomyzBM3wSnR8624dQugU=;
 b=N5Ubf/Y/LO0ia0OarDCcvl+F8m9py/bpMf1winFt2qfaIjfYF1BXm+rTOASS8dTbQ5qp+fojWC7ix+bKQIE7CFgrPXfwcSYCwFamc/W9iYTRMbXSjuyzIw5BRWVLwc0/C31pIXyHc10EEVXYw/BXEBzEIQ4l4iDqE2ho91aOFoI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5006.namprd11.prod.outlook.com (2603:10b6:a03:2db::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Tue, 27 Apr
 2021 14:04:33 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76%5]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 14:04:32 +0000
Subject: Re: [meta-python][PATCH] python3-txsockjs: new package
To: Bartosz Golaszewski <brgl@bgdev.pl>, Khem Raj <raj.khem@gmail.com>,
 Armin Kuster <akuster808@gmail.com>,
 Tim moto-timo Orling <TicoTimo@gmail.com>, Derek Straka <derek@asterius.io>
Cc: openembedded-devel@lists.openembedded.org
References: <20210427140009.10771-1-brgl@bgdev.pl>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <472586cf-e706-069e-14d4-615b9ba35bf9@windriver.com>
Date: Tue, 27 Apr 2021 10:04:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210427140009.10771-1-brgl@bgdev.pl>
X-Originating-IP: [2607:fea8:c29d:d7c0::12bc]
X-ClientProxiedBy: BL1PR13CA0204.namprd13.prod.outlook.com
 (2603:10b6:208:2be::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:c29d:d7c0::12bc] (2607:fea8:c29d:d7c0::12bc) by BL1PR13CA0204.namprd13.prod.outlook.com (2603:10b6:208:2be::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.16 via Frontend Transport; Tue, 27 Apr 2021 14:04:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a30b306e-2412-4416-b935-08d909856195
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5006:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB50069179828858658A50DB1F9F419@SJ0PR11MB5006.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4Cd45CnCbkZ+nlxjtDYOg1PuRiPMLDIVWEKjPdgeQKhKx9GjsmQ7srCaidT4jrkNp17/ay/m0w5Y+yilSaq1KufFt47nvgPzSzkpjxiNDexps8jgTWFVekSFnKkNUgsGMr5J2L5HQkuFYsm5UMw1kfciE7wSi5zni2q0lsQaM4lR98Myl1CSuK/hu64lgRQc9QGIRX5//60ajCxWaDG3myUZWiA5+7UgumrnFplNM9Q9bZbU+y1Yn60X5lp0YRbve3qnwDztANYPIFIiq7gecZZiMZJYLRFvVITmNR0qQmrJcCn2T91xWBmaqoTLQDYnYPgyAsVkRwLxUjN97RmB3dHWMBFXmRhdxn2GBlTZ5gqIDiqXxeaAP8x/mGRCt8oFGjy8DQrv9v7JkLfFullxDw/HDk29TAE4PJ5CzYsUQ0hN7z5Vo9RoHBrXbB4FEaZ7mFjrOj8/PWYZjfk5WNzObPFNuYUfAJXcwtNJ+AQ6n7GxWOS94X5ubkPuVbln4DBiJVQgwXIUFC3guY73Cfd7ucDo50gFQ+6AD6cPPvUeR5QZMXjfTqZbNVARD/NYZJpczni4rxBl72lKcH6qbk8av2gbtiVX9P6deSWg6TB45bntwYNmWsTbGxWEdy/T6/G8rN9BvifItcoAcESJCJeI4M0V2ggrTY4qItZr9hTcEzJSlCDGmkBEeZPx+n3xjQwH8yJuOLFON0ZSLd2fXL9AJXalLlyna90l27pUCwiT9hK4DLBsyz/bxb6hHnAwN1Kf
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(376002)(136003)(366004)(396003)(316002)(8936002)(110136005)(8676002)(31686004)(478600001)(83380400001)(16526019)(4326008)(6486002)(5660300002)(186003)(2616005)(31696002)(2906002)(44832011)(36756003)(53546011)(86362001)(38100700002)(66556008)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?MWFDaHZDZXJFaE5QS3RPb1RFYW1UcktFK2psNUIwa0MzZzRPY282M1AzTXpz?=
 =?utf-8?B?dHFjTVQwZnUvUWg4NTRwVUNqOVFnZzUra2tQc3lYamlHbWlBbkl5ZzFkRTFz?=
 =?utf-8?B?T3RGM1BveVdEWVc1VXNFRHRXQTdMRnQ3TmxzaTZXT2Zqa2JxRlAwS21hTFJ0?=
 =?utf-8?B?d25pNzhnbUREZlV6OW02ZjV6UVFUUjluTk4wSld4TmxTUFRtcGhRb09FZU1H?=
 =?utf-8?B?RUUveWJDdlozNCtTdWU3dkEzNWt1MEZCdFZ5VmpCUTRaOWhnRzZXNExwRXlo?=
 =?utf-8?B?a3EyS2NSRzZNL3I1QXpWcGl4bkxYMVNiaUpGaTA5WG1KOUFRN3MveUlMWk03?=
 =?utf-8?B?V3hGS0tVa1FBcmtWZzU0NG9Pek1rKzB6Tm5JYStLRThXVzVxYUF0Qi8xYVhW?=
 =?utf-8?B?cytzdk13Y3RrNXF6WWlWRmY3bWZGbjluRFFHci9IUzN2YzJ3Z0F1NC9ueFVV?=
 =?utf-8?B?WkdlR0owcGxrenNOSGNjMFEyaXIwbE9QSGhoOXVBSVplc1ZjY3A2RlJGdDhB?=
 =?utf-8?B?MGplc3REamhaZENOdW5SVTVjQXMrQ0JyTi9CRlYzbERjTE4vanpaeVRBT1Q3?=
 =?utf-8?B?clFidGV4dmJzYitaeWhFVFZCdk5HU1NUSXNmZExJMkNvOHIxM1hHbGZyeExV?=
 =?utf-8?B?cVFNbkV2NlJFSDF4Nk9mL2RBOHRaRis0RCsvekNZellJRlJ3aTlQTUJuUE9q?=
 =?utf-8?B?eTArU1R0b1RNR085NkFMZ2EwdWt2eDREQ0JtTU1qUnNjREhlb2RjQjlVUmhL?=
 =?utf-8?B?V2FaVzNjV2dEeFRTcXVQM0ZaUnZJMlczQVdPYnlnVGtmOE1sVFA0c3JzSnhE?=
 =?utf-8?B?YnoxOG9YV3M1VUVqN0VoMi9JZUFoaFpmVnZ2NHNxMHRYODIwQXFoL1BBbnBP?=
 =?utf-8?B?anNQTUdrZVdaWm9YNmJ4N20vOTNvbDhoZ0poaGNJUGtXMWdMYjF2WTJpTlZz?=
 =?utf-8?B?bXFOaXUzeisvRUhiRTMxV2pBNGtQd0JvK1dJTFFiQ1RValVieGFlMjNnWlRh?=
 =?utf-8?B?bjBWVzMxT0ZrUlk5TTNWS1BvbThpVCs3MklGYUh0MEdFbllWSTBhLzBuRXdL?=
 =?utf-8?B?M2NPS09EYzR5V0llU3AybW9KUlVZOHppclczQnNUdW5RSU4zejc1RkVPMnFK?=
 =?utf-8?B?UWh0N3hyWWR1L1RLb0xOaXgwVEhTdUYvbGhpK1F2b0tNRUlpR3JCUDNIRk9w?=
 =?utf-8?B?cHRWZ0Y3SStvdy9OSGkzN3hTOTBiTzU0ODRNaVFQcy9lY0VOd2dLTDMwNkgw?=
 =?utf-8?B?MzdadDdFY0NqTFc0UVdodHJjMitKNDFwb3EvZTIxMGtoZVNZZHZHUGVnU2ZV?=
 =?utf-8?B?UWM3UTdLOFgxeFczK2J2UmlrcldicENVWWZxaHZNOTFxcFhTaTZyUzNNaEE0?=
 =?utf-8?B?Rnd0MWdTSFlUSzdmSW1xRkNETmU2RW56SHYyK3NSZWdSamkrbFpVVEZ5SkhB?=
 =?utf-8?B?ZWJIc2V3Q1BHUW0vMzlMQVQ5WGJHdkpQZEF1NDExZU1IUjNHUC9LcGIzVWU5?=
 =?utf-8?B?bHcxV1ByM3M3Q0VxenB0cCsraFdiaHZjNkNmNllEWlpHT3FkUUFwL05Dc2w4?=
 =?utf-8?B?ZzI1eXptLzc3ZXNVTk5odnlhM1lZT2t6M0RHK0sxT2Q5RVlZY0hqTUtlenJm?=
 =?utf-8?B?cHNiQm5ieUhqVXVlY2Y5dEF1WDN3ZUZsMnRrbjlLRGVmT1B1S01pYVlLNFNx?=
 =?utf-8?B?bXFXWEQ2V1pmNVhZclgyU0tONGpNcUJjNGFXMU1JOHl3REl4RllLTjQ0ZThw?=
 =?utf-8?B?ZUJhMUk3R2F0WXc4YjMybWdqN0NwV3AxbUZrZFVCbHA2WkZManNZbmZiSW14?=
 =?utf-8?B?SHlDeTlFMERTZ0ZId3BUdz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a30b306e-2412-4416-b935-08d909856195
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 14:04:32.3907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jY1A6P0qe0B78psjc2EeSsQ2uy90JYJdEthoSZPyO2SwWElImuA11CLbWaEy7pDvsGz7I3yZNtV18rszkjjP1bqhuqHOxzxQ5f1rEqRVM3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5006
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 2021-04-27 10:00 a.m., Bartosz Golaszewski wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> This adds twisted python support for SockJS.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>   .../0001-setup-fix-syntax-error.patch         | 27 +++++++++++++++++++
>   .../python/python3-txsockjs_1.2.2.bb          | 15 +++++++++++
>   2 files changed, 42 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-txsockjs/0001-setup-fix-syntax-error.patch
>   create mode 100644 meta-python/recipes-devtools/python/python3-txsockjs_1.2.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-txsockjs/0001-setup-fix-syntax-error.patch b/meta-python/recipes-devtools/python/python3-txsockjs/0001-setup-fix-syntax-error.patch
> new file mode 100644
> index 000000000..f5de64221
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-txsockjs/0001-setup-fix-syntax-error.patch
> @@ -0,0 +1,27 @@
> +From 7b6323f467dc4f2ff4421350ac5fbf3a73c66764 Mon Sep 17 00:00:00 2001
> +From: Bartosz Golaszewski <brgl@bgdev.pl>
> +Date: Tue, 27 Apr 2021 14:20:41 +0200
> +Subject: [PATCH] setup: fix syntax error
> +
> +Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> +---
> +Upstream-Status: Inappropriate [Project's github has been removed :(]

I'm hesitant to add a recipe for a module whose official repository may 
have been deleted. I do see the DesertBus/sockjs-twisted repo, but it 
hasn't been updated in several years. Do you know if any of the forks 
are actually being maintained?

- Trevor

> +
> + setup.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/setup.py b/setup.py
> +index d67320e..13ac3c5 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -70,6 +70,6 @@ setup(
> + try:
>
> +     from twisted.plugin import IPlugin, getPlugins
>
> +     list(getPlugins(IPlugin))
>
> +-except Exception, e:
>
> ++except Exception as e:
>
> +     log.warn("*** Failed to update Twisted plugin cache. ***")
>
> +     log.warn(str(e))
>
> +--
> +2.25.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-txsockjs_1.2.2.bb b/meta-python/recipes-devtools/python/python3-txsockjs_1.2.2.bb
> new file mode 100644
> index 000000000..e5a86e013
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-txsockjs_1.2.2.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "A simple library for adding SockJS support to your twisted application."
> +AUTHOR = "Christopher Gamble"
> +HOMEPAGE = "https://pypi.org/project/txsockjs/"
> +SECTION = "devel/python"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c62063068876fa826aa4fb6db49fdf7a"
> +
> +SRC_URI += "file://0001-setup-fix-syntax-error.patch"
> +
> +SRC_URI[md5sum] = "fcdd3f68021abc6034223b5b36f43128"
> +SRC_URI[sha256sum] = "759f5571e276e70c1ad20919d27cf2e8eef8751594892bd107d6e88dce4a5db9"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += "python3-twisted"
> --
> 2.30.1
>
