Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.51])
 by mx.groups.io with SMTP id smtpd.web12.7414.1613657832109888915
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Feb 2021 06:17:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=X78scoI5;
 spf=pass (domain: windriver.com, ip: 40.107.244.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JOpu5XvQ/X6iPCM81BqhYOQ3wjTL6Nwc/2c1fre2QeoodwfkE9SFtJMrHeS5eH5Or+LMhff9k4sHxYZC/pvLoVQ+9DIGpLxhfHl74PhicKrHqmr7TfWk4lxyoc5CQEdkxxr2PgnVGSKcm0h0uEXZdPU+dQnVZ1mYABzRk5IEjl4laHZMLg6PNNnRxDB2eL9S8qPQYAxMTWZfopXzUKAGP+wfYynB0/Jbb0LpANPfUD1y5UhT4jnn3JOjllZuCZaNUU3qiy+iNBoZUCfhC09LdFn/o2GLUAgoubRQTKM6V+VtZO1bl9JxCL5/ulBU8ZyTYGhrbCbNp4PuM8a4SR4o2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXb1bi1XmrYe3oHY0U25U0LYW3hbp+qv7oHwzSTpXFo=;
 b=GbYoQVPEXVLqsRx77gKACb3NO/FOXSs49fhXoGCjFqiK3gnF+lESJqh775Fx5Q8HcSmeopvY5PZkLOaO13fW+EGN7zC9GCWEEHV1NtFzSCeWm9AiIbMzgydMwWSdFAHlUQLUuaCsVq/eaviWE0cKteXrNpfedsqkqrFhdHIEkBg+BFOr7Jq3kdZfcRjCy5XLzXHvB/F6yMnuKJbcC2FzFrdALPjoXm1JBK2kTjx7xs0boso2bFM4NP15nJmBKTPwGjbPuPg/7z+Gc+cP44PXD6jg2H0IDuNPuOE8f4tDo3dlMNQMfGyIwEq2jeXPlW2VQ+N2GMekeAij90T5Bimdsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXb1bi1XmrYe3oHY0U25U0LYW3hbp+qv7oHwzSTpXFo=;
 b=X78scoI5NeWd9+YfEvhvAJmsLLLIQKX8iJbgsqwMmgFWTqBNWiZ3AHKaI6dNSq51hOhYuCTKT2b7XKCxg4NBt+ZZvjk2/nGHcS9rglp/UJuNwHIrxVCjAzutBvTRdVfjyC6N8hPBkGbFcuyOV/f0af4IszH0K06saMYBalzLeIo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4353.namprd11.prod.outlook.com (2603:10b6:a03:1b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Thu, 18 Feb
 2021 14:17:10 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3846.042; Thu, 18 Feb 2021
 14:17:10 +0000
Subject: Re: [oe] [meta-python][PATCH 2/2] python-grpcio-tools: Upgrade to 1.35.0
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20210217215820.3761256-1-raj.khem@gmail.com>
 <20210217215820.3761256-2-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <86eb7936-6dce-30bf-89c3-516ee35f7f2e@windriver.com>
Date: Thu, 18 Feb 2021 09:17:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210217215820.3761256-2-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: SJ0PR03CA0219.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::14) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by SJ0PR03CA0219.namprd03.prod.outlook.com (2603:10b6:a03:39f::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 14:17:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d996f0d9-5a45-46dd-8852-08d8d417e178
X-MS-TrafficTypeDiagnostic: BY5PR11MB4353:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4353879C741A46EA9EB132D59F859@BY5PR11MB4353.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VntaurovIXXyeQGj0ggvl910bkSgIcvX1K7O1sjxuqKQba0yvU6wTchx0/BQkSRUQ5zqx4epI7FZ0xV/w+cEMj8NCYA22BBfiLphy0lRvJuzOGxxH0ZRFsdhxJCOcvhveuX7y3vQu7pbOtZepsYErdmHYwTHRKR0SmXCS6poNqcCQPA23IGtrnLMFp7cefAfNucXNR1W/1b55mSOf04tfiBhna/VQPs/B4HEuT5Wx9JYs9oFHGp6P3oi8uIUUwpHappKkz1iulMvh/6hUV6uusBI+sggl9pry7DH2MnKCJCSbSK4nlY+IRAKtDCAkUWrZMs1BH28DZ8b0YBczokgry4DM4YaZ5s7oYvRj/IMHawPPl7dm/aoHuKYBicvIkyign8f+h5lJTpfh1yd1KIN872ip8d+zKWwtVumFbhEf3Yqe/WMJCSO1UIJhO0NdUpb8VneoeXA2hKdJcBNq7S0RnKkogByZhguVcj7pJf0YBeYJc4DDrVH7BJ7tMHsM972RWfW4DDFYMOIvFMNJe/VuKxPILsGuLmBs8ZHhTZmD/kw+fuJiqk5ZYpuz+tNNKR8hltxZ2Ta3Dg61BJ6UqobkFxHOnxJAqlPykz4nEyvhnrPOwHwmvBHpFNyblgCV9kTcQ6RJ1LA6f2W3OeQ50UsaheCsphdhMu2nTg7CNJOzT6R0hAGaf8C0WZl+XhBDRGi
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39850400004)(376002)(136003)(346002)(5660300002)(66476007)(956004)(2616005)(316002)(166002)(83380400001)(16526019)(30864003)(186003)(66946007)(66556008)(44832011)(6486002)(86362001)(966005)(26005)(478600001)(8936002)(52116002)(31696002)(33964004)(36756003)(2906002)(31686004)(16576012)(53546011)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?M3Q0WnY0emROSHNydXhOZHY5cHJ6cVN1aHptVEpYVDRVdnU2cStLYWtpN0xv?=
 =?utf-8?B?OGVzcGp1ZHRtOTBvUVBiUnFCeGROSTdtN0N4dHByblZGTGFsWnR2WFJudFMr?=
 =?utf-8?B?UW9QeFpWVnVhTEJNaGJFcXFpNjZEUFg3K1pSeUJEbUdENEY5V1dYSEkwWG0x?=
 =?utf-8?B?QlEzRGJrTk96MW82eFdnOFZnN2JRRVgvOHlUNzZibmpaSkMvaWcvZVl3NWdi?=
 =?utf-8?B?dXk0MnBsK0Y1R09LNEVGY1BBNVNGeTA3VWxTYkVkZ25ab0VLTlNtWERtN3JF?=
 =?utf-8?B?b0drYmR0Umd2ZGl1RncvcTEwQnFNY3NTb0wwRnFGR0ZKay9hVE9SdENPYytB?=
 =?utf-8?B?Rm5xTG9ubmR2NGFkRkYzeVFERXpvQUVtQm1CRFhNdXdOaEpwQ3JSek9WTDEx?=
 =?utf-8?B?a2cxcGJIZWVoVk0rbFpjamI2akl3YXJxbDhRWWVML0NybkVLRjJSL1Z5Wnhp?=
 =?utf-8?B?b3I1SmFuVFg0RUZZQjJmdEd2eWxBVnl6OTkyUkZsNHpIS0dGZDU1aW5nQzIy?=
 =?utf-8?B?Qzh4WlJMcTJINGhKUmFrbnNmK2pqRmU0Y3QzUlJnME0yZHdvTjdRT2JCZTBL?=
 =?utf-8?B?TWZwT1kxb0FIUENEZnJRb3NvZnlYK0xUa0RaNk9HcWVlNFNLd1VIblNGZjY3?=
 =?utf-8?B?UVRFRmR1VHlDU083RUJ1VXJoVHJRTGN1VVFEQ0xaTEMxR0U3bHoraFRPb0ps?=
 =?utf-8?B?VFVneGZPSDZCRnl4bkJqNk1NMW1iaGU4QnBuUkgzQVJDUG1yRUcrRFJvRktP?=
 =?utf-8?B?dlZpYWEwVmJpV082UW5FZkp3Zmp5cWtOWitxL3RQeDlkdldHZFdINFM5czIz?=
 =?utf-8?B?Zmp4ZHU2eFRmYXpVUWFJbm92WjgzOXB3U1JjaHQxbEN4SXY0MnUrOWRES1h3?=
 =?utf-8?B?cmNiVmlLRDlMbjh1TjBsTTFMY21Zb3dMOVFnN1p6UHM5N1hNTzMxc2dMUFJ4?=
 =?utf-8?B?Qm9WUDNmSW8yK0NCa0VTeUdSSzdNb0EyYXQ0VG03Q04zQ2VybDhDYkh4SEF5?=
 =?utf-8?B?bG4yNEQ1MkdSdXhvYWZ6dXVTdDZLMnpiQmQyTXJTTTNzZEIwK1g3bXBGcUw2?=
 =?utf-8?B?emNVK1QwWGU4cEcwYStncjBTMVh2TmVIYUNhQjZVc1A3NnhUYnZYYVplWkda?=
 =?utf-8?B?WklDQmloZmVkclAyNWVudE5pR0tKMURlMTNkV0dqL2xBT2hPWHB5cXRUUzdm?=
 =?utf-8?B?eExRTDduQWVLc3FmckF4dmNKc0xZWUNWcTRuckhBMFdFSkV1V3pQTE5kZWNj?=
 =?utf-8?B?YU93TkkvWWUzM0hlcG5RZ0ptc1BabGJlckNEYmpZQy92N3ZWNDRBdlFvaU1P?=
 =?utf-8?B?Z3N4THJzREQvbWxFTDRjNmEyTEw3NWl0d0tsT1BzMHdDb1lBVFFvdHRCOFlh?=
 =?utf-8?B?VjcrTHVPcEJQQzcxclQrYnp2bVdHNVp2bStsWHNmaU5hdU5NZE4xbGxPU2xx?=
 =?utf-8?B?cEg4ZHgvSGhMSStjZnhuOFhEZXpRT1o5M3RNZ1dsQzB5cUpRd2xUVDdoZ0hr?=
 =?utf-8?B?bC8waXYrYzBwWGFFTldzbUdDMFV0SlZVR1ZUb0U3cXRkN1lKTGJmUDVWLzYy?=
 =?utf-8?B?MzFFdy95OTdQajNmYnZxd3JPanBObjMzRmQ4ZXZUM04vdFZZREErZVJZdkt0?=
 =?utf-8?B?bE16eUtmd1dyWHNnZzdpYlV0dERKTVNWTXlsTXJsS3cyUkNESzhKUld6WUNM?=
 =?utf-8?B?M1YrNUNYSUx3NXgybmRyWjhlcFhvYWdPaTBaaVYwTE5Gbkg3aUYzbzFTcVhE?=
 =?utf-8?Q?hw6DMqYFQ/SCSV6pPvDcWny7vKEz5oBjC97Z6PB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d996f0d9-5a45-46dd-8852-08d8d417e178
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 14:17:10.8712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 25Ts8xn5ktYaEffY0hWqxdeAaBx2r92UlDoJ9ZYk6rEjfBSkrdpnb210TyBQlv09quM0eBCKaOD26S1PZ+Bbpuzv4sZ6iYzKEG9Gl2q+UYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4353
Content-Type: multipart/alternative;
 boundary="------------B5864FE25668BB3E4170CAB8"
Content-Language: en-US

--------------B5864FE25668BB3E4170CAB8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-17 4:58 p.m., Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> merge inc file into bb as this is the only consumer now
> Fix the compiler name logic to match OE, since our compiler name is not
> a single word but a collection of words
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...-Do-not-mix-C-and-C-compiler-options.patch | 58 +++++++++++++++++++
>   .../python/python3-grpcio-tools_1.14.1.bb     |  2 -
>   ...ols.inc => python3-grpcio-tools_1.35.0.bb} |  7 ++-
>   3 files changed, 62 insertions(+), 5 deletions(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
>   delete mode 100644 meta-python/recipes-devtools/python/python3-grpcio-tools_1.14.1.bb
>   rename meta-python/recipes-devtools/python/{python-grpcio-tools.inc => python3-grpcio-tools_1.35.0.bb} (63%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
> new file mode 100644
> index 0000000000..aef67b5748
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
> @@ -0,0 +1,58 @@
> +From 9b2f1d400db8b8d0045f5a58a748a2dc52b5c9ef Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 17 Feb 2021 13:38:55 -0800
> +Subject: [PATCH] setup.py: Do not mix C and C++ compiler options
> +
> +EXTRA_ENV_COMPILE_ARGS is used both with CC and CXX
> +so using -std=c++11 or -std=gnu99 together will cause
> +build time errors espcially with clang
> +
> +Keep '-std=c++11' to fix native build error
> +with old gcc (such as gcc 5.4.0 on ubuntu 16.04), for clang
> +we will remove them through GRPC_PYTHON_CFLAGS at do_compile
> +in bb recipe.
> +
> +While export CC="gcc ", cc_args is None, it will
> +cause subprocess.Popen always return 1. On centos 8, if you don't
> +install package libatomic, there will be a native build error
> +`cannot find /usr/lib64/libatomic.so.1.2.0'.
> +
> +Add no harm '-g' to cc_args if cc_args is empty.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + setup.py | 9 ++++++---
> + 1 file changed, 6 insertions(+), 3 deletions(-)
> +
> +diff --git a/setup.py b/setup.py
> +index a316038..70aa174 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -76,8 +76,11 @@ def check_linker_need_libatomic():
> +     """Test if linker on system needs libatomic."""
> +     code_test = (b'#include <atomic>\n' +
> +                  b'int main() { return std::atomic<int64_t>{}; }')
> +-    cxx = os.environ.get('CXX', 'c++')
> +-    cpp_test = subprocess.Popen([cxx, '-x', 'c++', '-std=c++11', '-'],
> ++    cxx, cxx_args = os.environ.get('CXX').split(' ', 1) or 'c++'
> ++    if not cxx_args:
> ++      cxx_args = "-g"
> ++
> ++    cpp_test = subprocess.Popen([cxx, cxx_args, '-x', 'c++', '-std=c++11', '-'],
> +                                 stdin=PIPE,
> +                                 stdout=PIPE,
> +                                 stderr=PIPE)
> +@@ -87,7 +90,7 @@ def check_linker_need_libatomic():
> +     # Double-check to see if -latomic actually can solve the problem.
> +     # https://github.com/grpc/grpc/issues/22491
> +     cpp_test = subprocess.Popen(
> +-        [cxx, '-x', 'c++', '-std=c++11', '-latomic', '-'],
> ++        [cxx, cxx_args, '-x', 'c++', '-std=c++11', '-latomic', '-'],
> +         stdin=PIPE,
> +         stdout=PIPE,
> +         stderr=PIPE)
> +--
> +2.30.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.14.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.14.1.bb
> deleted file mode 100644
> index 2da1a4df03..0000000000
> --- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.14.1.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -inherit setuptools3
> -require python-grpcio-tools.inc
> diff --git a/meta-python/recipes-devtools/python/python-grpcio-tools.inc b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
> similarity index 63%
> rename from meta-python/recipes-devtools/python/python-grpcio-tools.inc
> rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
> index 6675f904c1..0063b4b0ef 100644
> --- a/meta-python/recipes-devtools/python/python-grpcio-tools.inc
> +++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
> @@ -8,9 +8,10 @@ RDEPENDS_${PN} = "${PYTHON_PN}-grpcio"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515"
>
> -inherit pypi
> +inherit pypi setuptools3
>
> -SRC_URI[md5sum] = "b2fabfb54c7824c1e49a02de2aa6628e"
> -SRC_URI[sha256sum] = "4ce5aa660d7884f23aac1eafa93b97a4c3e2b512edff871e91fdb6ee86ebd5ea"
> +SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
> +
> +SRC_URI[sha256sum] = "9e2a41cba9c5a20ae299d0fdd377fe231434fa04cbfbfb3807293c6ec10b03cf"
>
>   BBCLASSEXTEND = "native nativesdk"
> --
> 2.30.1
>
>
> 
>

--------------B5864FE25668BB3E4170CAB8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-17 4:58 p.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210217215820.3761256-2-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

merge inc file into bb as this is the only consumer now
Fix the compiler name logic to match OE, since our compiler name is not
a single word but a collection of words

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210217215820.3761256-2-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...-Do-not-mix-C-and-C-compiler-options.patch | 58 +++++++++++++++++++
 .../python/python3-grpcio-tools_1.14.1.bb     |  2 -
 ...ols.inc =&gt; python3-grpcio-tools_1.35.0.bb} |  7 ++-
 3 files changed, 62 insertions(+), 5 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-grpcio-tools_1.14.1.bb
 rename meta-python/recipes-devtools/python/{python-grpcio-tools.inc =&gt; python3-grpcio-tools_1.35.0.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
new file mode 100644
index 0000000000..aef67b5748
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
@@ -0,0 +1,58 @@
+From 9b2f1d400db8b8d0045f5a58a748a2dc52b5c9ef Mon Sep 17 00:00:00 2001
+From: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
+Date: Wed, 17 Feb 2021 13:38:55 -0800
+Subject: [PATCH] setup.py: Do not mix C and C++ compiler options
+
+EXTRA_ENV_COMPILE_ARGS is used both with CC and CXX
+so using -std=c++11 or -std=gnu99 together will cause
+build time errors espcially with clang
+
+Keep '-std=c++11' to fix native build error
+with old gcc (such as gcc 5.4.0 on ubuntu 16.04), for clang
+we will remove them through GRPC_PYTHON_CFLAGS at do_compile
+in bb recipe.
+
+While export CC=&quot;gcc &quot;, cc_args is None, it will
+cause subprocess.Popen always return 1. On centos 8, if you don't
+install package libatomic, there will be a native build error
+`cannot find /usr/lib64/libatomic.so.1.2.0'.
+
+Add no harm '-g' to cc_args if cc_args is empty.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
+---
+ setup.py | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index a316038..70aa174 100644
+--- a/setup.py
++++ b/setup.py
+@@ -76,8 +76,11 @@ def check_linker_need_libatomic():
+     &quot;&quot;&quot;Test if linker on system needs libatomic.&quot;&quot;&quot;
+     code_test = (b'#include &lt;atomic&gt;\n' +
+                  b'int main() { return std::atomic&lt;int64_t&gt;{}; }')
+-    cxx = os.environ.get('CXX', 'c++')
+-    cpp_test = subprocess.Popen([cxx, '-x', 'c++', '-std=c++11', '-'],
++    cxx, cxx_args = os.environ.get('CXX').split(' ', 1) or 'c++'
++    if not cxx_args:
++      cxx_args = &quot;-g&quot;
++
++    cpp_test = subprocess.Popen([cxx, cxx_args, '-x', 'c++', '-std=c++11', '-'],
+                                 stdin=PIPE,
+                                 stdout=PIPE,
+                                 stderr=PIPE)
+@@ -87,7 +90,7 @@ def check_linker_need_libatomic():
+     # Double-check to see if -latomic actually can solve the problem.
+     # <a class="moz-txt-link-freetext" href="https://github.com/grpc/grpc/issues/22491">https://github.com/grpc/grpc/issues/22491</a>
+     cpp_test = subprocess.Popen(
+-        [cxx, '-x', 'c++', '-std=c++11', '-latomic', '-'],
++        [cxx, cxx_args, '-x', 'c++', '-std=c++11', '-latomic', '-'],
+         stdin=PIPE,
+         stdout=PIPE,
+         stderr=PIPE)
+--
+2.30.1
+
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.14.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.14.1.bb
deleted file mode 100644
index 2da1a4df03..0000000000
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.14.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-grpcio-tools.inc
diff --git a/meta-python/recipes-devtools/python/python-grpcio-tools.inc b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python-grpcio-tools.inc
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
index 6675f904c1..0063b4b0ef 100644
--- a/meta-python/recipes-devtools/python/python-grpcio-tools.inc
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
@@ -8,9 +8,10 @@ RDEPENDS_${PN} = &quot;${PYTHON_PN}-grpcio&quot;
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515">&quot;file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515&quot;</a>

-inherit pypi
+inherit pypi setuptools3

-SRC_URI[md5sum] = &quot;b2fabfb54c7824c1e49a02de2aa6628e&quot;
-SRC_URI[sha256sum] = &quot;4ce5aa660d7884f23aac1eafa93b97a4c3e2b512edff871e91fdb6ee86ebd5ea&quot;
+SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch">&quot;file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch&quot;</a>
+
+SRC_URI[sha256sum] = &quot;9e2a41cba9c5a20ae299d0fdd377fe231434fa04cbfbfb3807293c6ec10b03cf&quot;

 BBCLASSEXTEND = &quot;native nativesdk&quot;
--
2.30.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------B5864FE25668BB3E4170CAB8--
