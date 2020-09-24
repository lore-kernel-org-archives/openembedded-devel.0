Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.56])
 by mx.groups.io with SMTP id smtpd.web10.26204.1600976640241539939
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2020 12:44:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OY5rZBd/;
 spf=pass (domain: windriver.com, ip: 40.107.93.56, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnoHAkTijhDQlTfx0Ji2SSB9+jkoreCT1B8QSq5ftuZuITk370QGNr6f+AWutxxvW+6uO4t+sehlpYOkV+p4OAXWoa9A/JNwWLi5cWE7TF+9WLNa21UxA7JcuIZVU5MeIm4KkQp6EPaXbLpDVlvRtFjffpCp8mH5Hv+35BpM7TUJTWDvyi+r6oQDffsKd8kDi/jmAAOgDS5LzqW6APKLYXTGh3KvAmttwigCnh6SzU3xeenZB5tJ4C1w2HfAkVTvUqq7wKbERk+YMwN2Iskw1Ei31nJrvJef6v2OG2YZCJtcLghOtAdQbdZoEUJUWUBX4AbWONF7d3At6hhse4jqeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+14piqq7QMPrSbVhxNmHZb2h5TvTNOLbbEVXovWEcac=;
 b=EfJJ7NIKUeWCQBS4ZykELM4rx3wjVVm7okSZuJqAhHEGf+wmEls0xWMGbEsLJEHOfXSa3O+Pq5/1qxIAtWW0qgr6L0lRGAd1FCl+p2jCTEsC4mFshdSxMXidfqNCv96Qn0/Rv1+mA3KSV22KCu2oBX7eZNzdhi/uPOHVnhdcpnA0dGHx152t2k5cpaEeT4vb5TBzqw0nn6cl7WN9UOGkRIsqjLy6bkuwOX4S5j9M1xFlJpzu5fDrkNUC4oAm8QGir8nmRUc7qNnG3100SKtClWsTeDgbA8p0egDfO5MdkbSXjFS+coqXHDRRt0pm0PAWssJZscuY52R/bkMLikfakQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+14piqq7QMPrSbVhxNmHZb2h5TvTNOLbbEVXovWEcac=;
 b=OY5rZBd/LpXfeY0wpfzD755ccenxfn9c4s68UZn/OBj46GDJxq0W94bfLSauJuHQrzenwlZ2lOOzzXOQUEwUn0Zopo7k6wzR3/jWRaxxnJoNaiN+AtR5ndSXK1VUESqqifpZIZqOzxIlAh47GgLLlFdVJaJHQgeiryh3hriYscE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3559.namprd11.prod.outlook.com (2603:10b6:a03:f7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Thu, 24 Sep
 2020 19:43:58 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.026; Thu, 24 Sep 2020
 19:43:58 +0000
Subject: Re: [meta-python][PATCH] python3-docopt: add version 0.6.2
To: Hongxu Jia <hongxu.jia@windriver.com>, raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
References: <20200923074531.23290-1-hongxu.jia@windriver.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e0737100-1b1a-d619-d444-466d056d3bc2@windriver.com>
Date: Thu, 24 Sep 2020 15:43:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200923074531.23290-1-hongxu.jia@windriver.com>
X-ClientProxiedBy: YT1PR01CA0009.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::22)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0009.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Thu, 24 Sep 2020 19:43:57 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d56bead5-2b8a-4581-e3a8-08d860c22dc6
X-MS-TrafficTypeDiagnostic: BYAPR11MB3559:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3559D930DABEB83A7AB0ABAE9F390@BYAPR11MB3559.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:335;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GuXqQZLRAwwaZzQpKd0ce1+ezfJHcOEDQSYo99U1vNwFnmlYNrTKCcav8bTAd489ozgaaAT67sHmkTDk4t42EDsZNCtDs+zV8KM8/TUdrWzZ87sX60Cbp9CzxJqpZ+KmYU7zY1ldACqe+a/kxCeVSF/csMN3fUSTVngNVLT5ncwmAbk9Mo4r8DFvlGyMyB6gtQRK5XCpWhUv66wo22gbaH0TurLjNdzDL7SHTOXAwrahmw3odZj7swW4Ad99/RQ2TpoTcgKEQlUmiQfGuiV9+qgFjVyVVH12zHnF01TZmNRBkTsX4WhAWNjM5YrABCy0yOy5TAiH7JZMQHRDX/x+jcf+W+VH5TItyU8OhGKPPssDPskxzIdP2vGRg4CJwCFk52h1S8tUIYgIsxg9LAHBtwMESne1dNhCzNiOGg6srJcJ7SUmtRDokUwOZosbemIIAd7HaAKAO7sScX9E4nYy04yiP1DX2Xrm1GVDvta12POeLtW2F5jsRjZEbhXxaGwh
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(346002)(376002)(366004)(396003)(66476007)(26005)(52116002)(53546011)(36756003)(8676002)(44832011)(6666004)(86362001)(316002)(2906002)(66556008)(8936002)(4326008)(31696002)(31686004)(66946007)(956004)(6486002)(5660300002)(186003)(478600001)(16576012)(2616005)(16526019)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	XUlmsxKKExaQWynPLNOv09PmSXiyNy2OdSwZRu1FpuxJurZzQqGncP4u18x+shJAlyCPRE9AcNbFjI5+IXJRoeIYADSC/Tt1UmN6mh7a3e1DTadWhiBhzt2pAW4493EB3Pzlb8kT6CPwR9SQM/QOHF0BRgstHcgBwihQu7twz7SzsEDjDMxLCxPHsu+2xMU/1QdrfF6FQWktZU4eDJqRBJh4r5dzvfAB1v5xGyXFuxUYPEL0bjM/Uk7k6iVDMiVK3ndpFjN5TT2ucG3/ym7t96BGUys7IoGLF5sORPF7/u1nmoWbqTKtBfvCF9qHVbgotBpQ3gauWB06pcKhzelyU37yw4OHVHT8AG98ubqFQTwQVauCR/+AUjmouEHqQFUA7v2jMvtpn4rBVWYNzJiJCI3L++EPasGRMXkKPIzQ2HuyCBwdYUogLkIuv6/ilDM5EF3TyoEO1oJ93zIJCGW/KdTg64eY0iJfJzdX1t62/DInwyo6s7Tz596X2YZFtdvn6LXTjLJnhRwZxuABezIsRysSEpdTbH5FC9LSXsH8jmgFHTuOhllL/UH+XOg61XLkP+WH9ttkT4DNQOLFUULJg248KWfw5E94g3B55PcWIVcga/50tluYYhN7LsQ/elggthd+tZF2ZomeY/IWlUr+zw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d56bead5-2b8a-4581-e3a8-08d860c22dc6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 19:43:58.3464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sgs+gqvpZbdUhtu3rJIdI4ypbaKmAG1EvOGKVA9GFcMhOg7K5Zkfb5MXe0JVMG+V+lWtoN+5l/kd+EGK3BJ4I19SQhDXyhz8L49nUDA9S40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3559
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 9/23/20 3:45 AM, Hongxu Jia wrote:
> It is required by python3-pykwalify cli
> ...
> $ pykwalify -h
> x86_64-wrlinuxsdk-linux/usr/lib/python3.8/site-packages/pykwalify/cli.py", line 11, in <module>
>      from docopt import docopt
> ModuleNotFoundError: No module named 'docopt'
> ...
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-docopt_0.6.2.bb   | 11 +++++++++++
>   .../python/python3-pykwalify_1.7.0.bb                 |  1 +
>   2 files changed, 12 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-docopt_0.6.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-docopt_0.6.2.bb b/meta-python/recipes-devtools/python/python3-docopt_0.6.2.bb
> new file mode 100644
> index 000000000..a2432068c
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-docopt_0.6.2.bb
> @@ -0,0 +1,11 @@
> +SUMMARY = "Pythonic argument parser, that will make you smile"
> +HOMEPAGE = "http://docopt.org/"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=09b77fb74986791a3d4a0e746a37d88f"
> +
> +inherit setuptools3 pypi
> +
> +SRC_URI[md5sum] = "4bc74561b37fad5d3e7d037f82a4c3b1"
> +SRC_URI[sha256sum] = "49b3a825280bd66b3aa83585ef59c4a8c82f2c8a522dbe754a8bc8d08c85c491"
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
> index 4440723d3..7a30f1f67 100644
> --- a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
> @@ -12,6 +12,7 @@ inherit setuptools3 pypi
>   unset _PYTHON_SYSCONFIGDATA_NAME
>   
>   RDEPENDS_${PN} = "\
> +    ${PYTHON_PN}-docopt \
>       ${PYTHON_PN}-dateutil \
>       ${PYTHON_PN}-pyyaml \
>   "
