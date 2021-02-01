Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.88])
 by mx.groups.io with SMTP id smtpd.web09.33554.1612185845006191353
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Feb 2021 05:24:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Vp+kfOD5;
 spf=pass (domain: windriver.com, ip: 40.107.102.88, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eq+iHcmenah+C6pwKcUDCC1wz2yHAnBt2N6f/lB/GkjCt1yz3AWmfnxujdB9Jeb9/CVSoHJLfeW01vMvjHTxvl8wMGZ5+GYeQkqlBqtVdTnNNeWWdWEYZJSU7dP0V/zOTHst8y4j4SNfN9+/cZnk5eJSayuwxPQ497Yw/DVNNtDPgeh+fxQaBBaVvBVjUbpoAD2iTeBQXdMIYYoxw5c1Hs8nSCREwx5PHRKgvIY3W4WJEuFBmWnPk8silnWnRNCaW0REBcQQxDJ8eOVowCRg9ozZrOnCgWqutqbRgQUYACFi5kkIQVR06pGQbV7r/faMIlSNdS2RNECbt/Wq4pt10w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nv1Rtp4oJIwW6oXXUrRs3g2rgGwrNxy9xERRD+upm8A=;
 b=PR93bPnDlsbw9NegpmGVWvUDtyXnOz0eAMIZB/q7pdXjGNnwPOnw5Y2oI4+7+amepjPxrl3TCGVQfqKQh8/Zyvc62OaJto8X3H+rTa/iD19EFBAYWFY1YP0WC7PP3ZxYbhaxY37jiiMDBAEcySpGfKgZUlkGW0ApIzrp5AGSO5EqCzxCmlXXRdy+NHdNn47XulYf3iQ2EW8FtJ4ToXjVOgMW1705M/NBiPRRr6LspcULG1zTA1LVH+7eSY9dEGECgY9357SvDyr6XixGfpKb4x9SeW72IAr6XoRPOQVszitHr7iX3tWvs4h8VfSOKysbq0kea3gdy1Vb3gHknCZEtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nv1Rtp4oJIwW6oXXUrRs3g2rgGwrNxy9xERRD+upm8A=;
 b=Vp+kfOD5IZP0DRhvKRr8F5otm8hgYXspwh5kqEu3o7cckUtS5IQOF9bcXVFcKZQxibiHvsGL+6R+OSqbkHgSuVJnh/jk8LVqSkZ09ljfTxKeD2FxXKKHbPbU01kjcY8NnhW37+BzOdVeLXDvcs0kWbsecY/8nlAI7b9ZRmvkELk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5165.namprd11.prod.outlook.com (2603:10b6:a03:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Mon, 1 Feb
 2021 13:24:03 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.024; Mon, 1 Feb 2021
 13:24:03 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-pybind11: Upgrade 2.5.0 -> 2.6.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210128102903.11760-1-leon.anavi@konsulko.com>
 <20210128102903.11760-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b820d1c1-1fd2-9be1-7740-b3a987917b3a@windriver.com>
Date: Mon, 1 Feb 2021 08:24:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210128102903.11760-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN0PR04CA0015.namprd04.prod.outlook.com
 (2603:10b6:408:ee::20) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN0PR04CA0015.namprd04.prod.outlook.com (2603:10b6:408:ee::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Mon, 1 Feb 2021 13:24:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eee706e4-af96-46cd-3130-08d8c6b4a4b4
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5165:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB51656E843F426D2E14FC63C79FB69@SJ0PR11MB5165.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/uUJzhIrPdQSOrb9K2W+MPAs4eCmRj6OZl130v7VX/H98EvnYKBp9/4teNdY7FhsoO/E/BcPbBZ3AWAVhin09D9A5kTM9tJj/Z+e7MoORq6Xjy3zhHpkCVTfcQJQs4X9z4hWERhjpA7uEM7bkYugL2WrkY4n/03Um82N72KblLJU8bqhqwKT/Tu9ThPt/7BoTFOjRrQVzuWnHiRl70b0qeEp3fMQbZf3UxpXqNdkarJeAnvDwzVNVFc2+NK8STnHCGvCz45WmAkodzURusBZLS0Nni+bf7wRDm/Pu2PezdOXZ5YTQ2GxmKaYHpya+DstdjWqiKDYLS3fmmU8IbNuGg2oUaHHUyem/BAZ2edrJuzCsu8qptmrZpCSezV2tZD0X2OMt/aPn/cXmxQb+A/xtr+vOoC303VVoEgvmXci2qu2z77xBUk+YrFsv1xF+U16iiXrC6P2M7Hg9VLVRm/2EfMt4IwE5zmPTV4G72UlLr5dC8rdk0nYsYsOfdA6V0LO3eHgc79Z6msMbLXzu+FI+8CM65i75VBfmDlilESrApC9O6E1NvLQia72afO+qOpxgKPNzHGs+u1BIJYhONNPI8UglPjMRxAJ9VxYum0QxulMUYiLg/6uuGajWxlwqT+xHldme0Z/t2Z8M/Fqp6Fu4TpxcFV0hZNSg4+QKlzTC0OurCN+hA/0AQayAggj3FoNsb/8vEbGZc/P3cclJDtDR+ye+Amg0L1eWQKSFSlELKA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(136003)(39850400004)(376002)(5660300002)(66476007)(33964004)(66946007)(16526019)(2616005)(2906002)(36756003)(186003)(19627235002)(66556008)(86362001)(52116002)(31686004)(6486002)(8676002)(966005)(956004)(53546011)(44832011)(83380400001)(26005)(478600001)(316002)(30864003)(16576012)(8936002)(31696002)(166002)(46800400005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?T0JZUzI1SzZpZVZoWTJ3K21aSG5EZllUVUhuV1BBYStwQmlibUpiRXZmKzNn?=
 =?utf-8?B?b0U2STI1dUQ0cXFEU2l4Tlc2TWU4VU54Nm5POTNwVEN6OHhkTmZqSWZJZHBM?=
 =?utf-8?B?WXdncTByRUw0bEh3aWY4RmYzcVlQd1BnWWdoZFc3bDh6TE1KNFBXVzJHd3FE?=
 =?utf-8?B?NVVxVmx5YlhpSUhQVlNSWThJSGRRemZkWGJJY1VnKytsbnFzTElzZkNYVG05?=
 =?utf-8?B?WXRJYWM2NW9odjAxSDNzVXBCblBSNmtZb3Z2ZDAycFFPN2VGR0RvSVQ1dzJm?=
 =?utf-8?B?WnpVWkRJTXZzUFdkbnRMbWIyTGFmRHRiYVJUYm56SHZqSVh6KzNEcFppeWFw?=
 =?utf-8?B?RDZwcmtGWlJzQ2NKVUFyM29ySFU2RHNKZ1RKMFYwMkZ5TlZOZkNrUEk2aHNF?=
 =?utf-8?B?aHA2VGErTTQ4bHJxQ1R2UHlPcTFZNlRMNkdzU1BJTlpUTUhaNlNCdFU5MHhQ?=
 =?utf-8?B?elpVODNNMVhkVVIxSGx4OGMwNGNvcnFRR0dVWGRCSlE0WVdUZFVZdTB6VlM4?=
 =?utf-8?B?ZmtkRmVHYzM1emE3VENyY1RGUEpPdVlSRjdYOU80elRNVlc0SGdkVFFrSVF4?=
 =?utf-8?B?YUFKbFdFVTB0WS9PR0R4U1RSNjNLdHZGVHprUzlHWGhKYWJySkhodmZOdkIy?=
 =?utf-8?B?L1U5Vmp6M1FoWXY3UXErM0R6ckVTQWdudXpZSDZ6ZzQ4aUNPUW1JcFlVQXlM?=
 =?utf-8?B?eXY4V0hWZm54WXk3VnNoNXFxaEJHUnl5bEZaS1B3S1BNQ29aeWtQK3E2NW52?=
 =?utf-8?B?RUNxMGtsbDduYVF2VS9iUHlSb2dHNE1KTG1JaXVaNE10My9LNXAraU05UjlH?=
 =?utf-8?B?Ym40ZnZNN0RZamwrejZwb0NtSVROS1AvdjNkUjdHK0s0UnBQQnFiM09uYUpT?=
 =?utf-8?B?T3FXUTU3T3hnK3hKaXpmemFQQkgwOHJaUVMxWjl3UVYyZWhUWEZ6Um93YWx4?=
 =?utf-8?B?dC82MkFHMWhNRWJyY1RVd3pRWm9zOEtVMzJEY0g0dnVWK2VoK1BNY1ZoTmFM?=
 =?utf-8?B?MXZub3VBZHJzeXkyRXBndGsrZDJicC9kdDNvaEJPL0RmOUlOU1BseUROQ0FK?=
 =?utf-8?B?ZjR0OWFTMDJUaFYxbU5Ubmg0YUNTZlNOQk1tcU1rc1ZJMFFleW5zZldQUWEr?=
 =?utf-8?B?ZE1Nd0YrVjdvK3ZoT1AwMzNqejZuVHNEK3J6c2tYSE4wZHpLVTk4aHBPbSti?=
 =?utf-8?B?dHorK2xtakxQMzQvR0ZJUjdCZXJhTElubDhLWEM5akxEMDZic3h2TnVyWFBO?=
 =?utf-8?B?Qk5lQlJub2orVXhsS2JOVlUwcVNCNTJnOVREamZManMwbUloQ1Jqci93NFBZ?=
 =?utf-8?B?Snc4WkxveXBieDBmOXR5OEs1NW83MlhISk11dDU2UUpsN3JtV1lvdXpDVW12?=
 =?utf-8?B?eWRrUys3VDlxM2tRN2NESEk3bGRaTWZtRkREbGFkWWxCQkY1cnBlcklQbVFu?=
 =?utf-8?Q?tOMwv03C?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eee706e4-af96-46cd-3130-08d8c6b4a4b4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 13:24:03.6188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39nRzMzvgIfdqLVq3hEWIV2T+vZwNiOCdpetVewKAIeK8SPFGG9pdmMuZCfOKiV8vOVXkGbou7PISKmdoaf1ipWu42Kb8Rub9CzNY62+jU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5165
Content-Type: multipart/alternative;
 boundary="------------C6BAA73D0884F542178DFF73"
Content-Language: en-US

--------------C6BAA73D0884F542178DFF73
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-28 5:29 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 2.6.2:
>
> - enum: add missing Enum.value property.
> - Allow thread termination to be avoided during shutdown for CPython
>    3.7+ via .disarm for gil_scoped_acquire/gil_scoped_release.
> - Fix bug where the constructor of object subclasses would not
>    throw on being passed a Python object of the wrong type.
> - The type_caster for integers does not convert Python objects with
>    __int__ anymore with noconvert or during the first round of trying
>    overloads.
> - When casting to a C++ integer, __index__ is always called and not
>    considered as conversion, consistent with Python 3.8+.
> - Fixed segfault in multithreaded environments when using
>    scoped_ostream_redirect.
> - Leave docstring unset when all docstring-related options are
>    disabled, rather than set an empty string.
> - The module key in builtins that pybind11 uses to store its
>    internals changed from std::string to a python str type (more
>    natural on Python 2, no change on Python 3).
> - Fixed assertion error related to unhandled (later overwritten)
>    exception in CPython 3.8 and 3.9 debug builds.
> - Fix py::gil_scoped_acquire assert with CPython 3.9 debug build.
> - Fix issue with a test failing on PyTest 6.2.
> - Fix warning modifying constructor parameter 'flag' that shadows
>    a field of 'set_flag' [-Wshadow-field-in-constructor-modified].
> - Suppressed some deprecation warnings about old-style
>    __init__/__setstate__ in the tests.
> - Fix invalid access when calling a pybind11 __init__ on a
>    non-pybind11 class instance.
> - Fixed various minor memory leaks in pybind11's test suite.
> - Resolved memory leak in cpp_function initialization when
>    exceptions occurred.
> - Added a Valgrind build, checking for leaks and memory-related
>    UB, to CI.
> - Intel compiler was not activating C++14 support due to a broken
>    define.
> - Support ICC and NVIDIA HPC SDK in C++17 mode.
> - Support Intel OneAPI compiler (ICC 20.2) and add to CI.
>
> License-Update: Update a link.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ck-pointer-size-when-cross-compiling.patch | 15 +++---
>   .../0001-Do-not-strip-binaries.patch          | 51 +++++++++++--------
>   ...d11_2.5.0.bb => python3-pybind11_2.6.2.bb} |  6 +--
>   3 files changed, 41 insertions(+), 31 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pybind11_2.5.0.bb => python3-pybind11_2.6.2.bb} (82%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-check-pointer-size-when-cross-compiling.patch b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-check-pointer-size-when-cross-compiling.patch
> index 6455c95e7..761422e07 100644
> --- a/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-check-pointer-size-when-cross-compiling.patch
> +++ b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-check-pointer-size-when-cross-compiling.patch
> @@ -1,4 +1,4 @@
> -From 3abfa65517959ad279481021fafefba28f955e76 Mon Sep 17 00:00:00 2001
> +From 2e9318f7a70699eed239aee6301d1d0bbd2457ee Mon Sep 17 00:00:00 2001
>   From: Philip Balister <philip@balister.org>
>   Date: Fri, 10 Jul 2020 10:14:59 -0400
>   Subject: [PATCH] Do not check pointer size when cross compiling.
> @@ -8,23 +8,24 @@ It is reasonable to build for 32 machine on a 64 bit build machine. Prevents:
>   |   Python config failure: Python is 64-bit, chosen compiler is 32-bit
>
>   Signed-off-by: Philip Balister <philip@balister.org>
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>   ---
>    tools/FindPythonLibsNew.cmake | 2 +-
>    1 file changed, 1 insertion(+), 1 deletion(-)
>
>   diff --git a/tools/FindPythonLibsNew.cmake b/tools/FindPythonLibsNew.cmake
> -index d0c8fa2..8479e70 100644
> +index 3605aebc..67f4d4a0 100644
>   --- a/tools/FindPythonLibsNew.cmake
>   +++ b/tools/FindPythonLibsNew.cmake
> -@@ -123,7 +123,7 @@ list(GET _PYTHON_VALUES 9 PYTHON_MULTIARCH)
> +@@ -156,7 +156,7 @@ list(GET _PYTHON_VALUES 9 PYTHON_MULTIARCH)
>
>    # Make sure the Python has the same pointer-size as the chosen compiler
>    # Skip if CMAKE_SIZEOF_VOID_P is not defined
>   -if(CMAKE_SIZEOF_VOID_P AND (NOT "${PYTHON_SIZEOF_VOID_P}" STREQUAL "${CMAKE_SIZEOF_VOID_P}"))
>   +if((NOT CMAKE_CROSSCOMPILING) AND CMAKE_SIZEOF_VOID_P AND (NOT "${PYTHON_SIZEOF_VOID_P}" STREQUAL "${CMAKE_SIZEOF_VOID_P}"))
> -     if(PythonLibsNew_FIND_REQUIRED)
> -         math(EXPR _PYTHON_BITS "${PYTHON_SIZEOF_VOID_P} * 8")
> -         math(EXPR _CMAKE_BITS "${CMAKE_SIZEOF_VOID_P} * 8")
> +   if(PythonLibsNew_FIND_REQUIRED)
> +     math(EXPR _PYTHON_BITS "${PYTHON_SIZEOF_VOID_P} * 8")
> +     math(EXPR _CMAKE_BITS "${CMAKE_SIZEOF_VOID_P} * 8")
>   --
> -2.25.4
> +2.17.1
>
> diff --git a/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch
> index 07ab9a03b..699eb6155 100644
> --- a/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch
> +++ b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch
> @@ -1,4 +1,4 @@
> -From 918f3ef01c7a67f3beb67307966698474f144581 Mon Sep 17 00:00:00 2001
> +From debd676cd94f92a30b3be45f1245aa13d8c398c0 Mon Sep 17 00:00:00 2001
>   From: Philip Balister <philip@balister.org>
>   Date: Wed, 8 Jul 2020 09:41:43 -0400
>   Subject: [PATCH] Do not strip binaries.
> @@ -6,34 +6,43 @@ Subject: [PATCH] Do not strip binaries.
>    * OpenEmbedded strips them after creating debug packages.
>
>   Signed-off-by: Philip Balister <philip@balister.org>
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>   ---
> - tools/pybind11Tools.cmake | 13 -------------
> - 1 file changed, 13 deletions(-)
> + tools/pybind11NewTools.cmake | 5 -----
> + tools/pybind11Tools.cmake    | 4 ----
> + 2 files changed, 9 deletions(-)
>
> +diff --git a/tools/pybind11NewTools.cmake b/tools/pybind11NewTools.cmake
> +index 18da8be1..82ebf5e7 100644
> +--- a/tools/pybind11NewTools.cmake
> ++++ b/tools/pybind11NewTools.cmake
> +@@ -246,11 +246,6 @@ function(pybind11_add_module target_name)
> +     endif()
> +   endif()
> +
> +-  if(NOT MSVC AND NOT ${CMAKE_BUILD_TYPE} MATCHES Debug|RelWithDebInfo)
> +-    # Strip unnecessary sections of the binary on Linux/macOS
> +-    pybind11_strip(${target_name})
> +-  endif()
> +-
> +   if(MSVC)
> +     target_link_libraries(${target_name} PRIVATE pybind11::windows_extras)
> +   endif()
>   diff --git a/tools/pybind11Tools.cmake b/tools/pybind11Tools.cmake
> -index a3603ab..b4c8f63 100644
> +index 32313539..a7d81012 100644
>   --- a/tools/pybind11Tools.cmake
>   +++ b/tools/pybind11Tools.cmake
> -@@ -230,19 +230,6 @@ function(pybind11_add_module target_name)
> -
> -   _pybind11_add_lto_flags(${target_name} ${ARG_THIN_LTO})
> +@@ -201,10 +201,6 @@ function(pybind11_add_module target_name)
> +     endif()
> +   endif()
>
> --  if (NOT MSVC AND NOT ${CMAKE_BUILD_TYPE} MATCHES Debug|RelWithDebInfo)
> --    # Strip unnecessary sections of the binary on Linux/Mac OS
> --    if(CMAKE_STRIP)
> --      if(APPLE)
> --        add_custom_command(TARGET ${target_name} POST_BUILD
> --                           COMMAND ${CMAKE_STRIP} -x $<TARGET_FILE:${target_name}>)
> --      else()
> --        add_custom_command(TARGET ${target_name} POST_BUILD
> --                           COMMAND ${CMAKE_STRIP} $<TARGET_FILE:${target_name}>)
> --      endif()
> --    endif()
> +-  if(NOT MSVC AND NOT ${CMAKE_BUILD_TYPE} MATCHES Debug|RelWithDebInfo)
> +-    pybind11_strip(${target_name})
>   -  endif()
>   -
>      if(MSVC)
> -     # /MP enables multithreaded builds (relevant when there are many files), /bigobj is
> -     # needed for bigger binding projects due to the limit to 64k addressable sections
> +     target_link_libraries(${target_name} PRIVATE pybind11::windows_extras)
> +   endif()
>   --
> -2.25.4
> +2.17.1
>
> diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.6.2.bb
> similarity index 82%
> rename from meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
> rename to meta-python/recipes-devtools/python/python3-pybind11_2.6.2.bb
> index 5d57590a1..bd16a6d0d 100644
> --- a/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pybind11_2.6.2.bb
> @@ -1,15 +1,15 @@
>   SUMMARY = "Seamless operability between C++11 and Python"
>   HOMEPAGE = "https://github.com/wjakob/pybind11"
>   LICENSE = "BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=774f65abd8a7fe3124be2cdf766cd06f"
>
>   DEPENDS = "boost"
>
>   SRC_URI = "git://github.com/pybind/pybind11.git \
>              file://0001-Do-not-strip-binaries.patch \
>              file://0001-Do-not-check-pointer-size-when-cross-compiling.patch \
> -          "
> -SRCREV = "3b1dbebabc801c9cf6f0953a4c20b904d444f879"
> +"
> +SRCREV = "8de7772cc72daca8e947b79b83fea46214931604"
>
>   S = "${WORKDIR}/git"
>
> --
> 2.17.1
>
>
> 
>

--------------C6BAA73D0884F542178DFF73
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-28 5:29 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210128102903.11760-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 2.6.2:

- enum: add missing Enum.value property.
- Allow thread termination to be avoided during shutdown for CPython
  3.7+ via .disarm for gil_scoped_acquire/gil_scoped_release.
- Fix bug where the constructor of object subclasses would not
  throw on being passed a Python object of the wrong type.
- The type_caster for integers does not convert Python objects with
  __int__ anymore with noconvert or during the first round of trying
  overloads.
- When casting to a C++ integer, __index__ is always called and not
  considered as conversion, consistent with Python 3.8+.
- Fixed segfault in multithreaded environments when using
  scoped_ostream_redirect.
- Leave docstring unset when all docstring-related options are
  disabled, rather than set an empty string.
- The module key in builtins that pybind11 uses to store its
  internals changed from std::string to a python str type (more
  natural on Python 2, no change on Python 3).
- Fixed assertion error related to unhandled (later overwritten)
  exception in CPython 3.8 and 3.9 debug builds.
- Fix py::gil_scoped_acquire assert with CPython 3.9 debug build.
- Fix issue with a test failing on PyTest 6.2.
- Fix warning modifying constructor parameter 'flag' that shadows
  a field of 'set_flag' [-Wshadow-field-in-constructor-modified].
- Suppressed some deprecation warnings about old-style
  __init__/__setstate__ in the tests.
- Fix invalid access when calling a pybind11 __init__ on a
  non-pybind11 class instance.
- Fixed various minor memory leaks in pybind11's test suite.
- Resolved memory leak in cpp_function initialization when
  exceptions occurred.
- Added a Valgrind build, checking for leaks and memory-related
  UB, to CI.
- Intel compiler was not activating C++14 support due to a broken
  define.
- Support ICC and NVIDIA HPC SDK in C++17 mode.
- Support Intel OneAPI compiler (ICC 20.2) and add to CI.

License-Update: Update a link.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210128102903.11760-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ck-pointer-size-when-cross-compiling.patch | 15 +++---
 .../0001-Do-not-strip-binaries.patch          | 51 +++++++++++--------
 ...d11_2.5.0.bb =&gt; python3-pybind11_2.6.2.bb} |  6 +--
 3 files changed, 41 insertions(+), 31 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pybind11_2.5.0.bb =&gt; python3-pybind11_2.6.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-check-pointer-size-when-cross-compiling.patch b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-check-pointer-size-when-cross-compiling.patch
index 6455c95e7..761422e07 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-check-pointer-size-when-cross-compiling.patch
+++ b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-check-pointer-size-when-cross-compiling.patch
@@ -1,4 +1,4 @@
-From 3abfa65517959ad279481021fafefba28f955e76 Mon Sep 17 00:00:00 2001
+From 2e9318f7a70699eed239aee6301d1d0bbd2457ee Mon Sep 17 00:00:00 2001
 From: Philip Balister <a class="moz-txt-link-rfc2396E" href="mailto:philip@balister.org">&lt;philip@balister.org&gt;</a>
 Date: Fri, 10 Jul 2020 10:14:59 -0400
 Subject: [PATCH] Do not check pointer size when cross compiling.
@@ -8,23 +8,24 @@ It is reasonable to build for 32 machine on a 64 bit build machine. Prevents:
 |   Python config failure: Python is 64-bit, chosen compiler is 32-bit

 Signed-off-by: Philip Balister <a class="moz-txt-link-rfc2396E" href="mailto:philip@balister.org">&lt;philip@balister.org&gt;</a>
+Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
 ---
  tools/FindPythonLibsNew.cmake | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

 diff --git a/tools/FindPythonLibsNew.cmake b/tools/FindPythonLibsNew.cmake
-index d0c8fa2..8479e70 100644
+index 3605aebc..67f4d4a0 100644
 --- a/tools/FindPythonLibsNew.cmake
 +++ b/tools/FindPythonLibsNew.cmake
-@@ -123,7 +123,7 @@ list(GET _PYTHON_VALUES 9 PYTHON_MULTIARCH)
+@@ -156,7 +156,7 @@ list(GET _PYTHON_VALUES 9 PYTHON_MULTIARCH)

  # Make sure the Python has the same pointer-size as the chosen compiler
  # Skip if CMAKE_SIZEOF_VOID_P is not defined
 -if(CMAKE_SIZEOF_VOID_P AND (NOT &quot;${PYTHON_SIZEOF_VOID_P}&quot; STREQUAL &quot;${CMAKE_SIZEOF_VOID_P}&quot;))
 +if((NOT CMAKE_CROSSCOMPILING) AND CMAKE_SIZEOF_VOID_P AND (NOT &quot;${PYTHON_SIZEOF_VOID_P}&quot; STREQUAL &quot;${CMAKE_SIZEOF_VOID_P}&quot;))
-     if(PythonLibsNew_FIND_REQUIRED)
-         math(EXPR _PYTHON_BITS &quot;${PYTHON_SIZEOF_VOID_P} * 8&quot;)
-         math(EXPR _CMAKE_BITS &quot;${CMAKE_SIZEOF_VOID_P} * 8&quot;)
+   if(PythonLibsNew_FIND_REQUIRED)
+     math(EXPR _PYTHON_BITS &quot;${PYTHON_SIZEOF_VOID_P} * 8&quot;)
+     math(EXPR _CMAKE_BITS &quot;${CMAKE_SIZEOF_VOID_P} * 8&quot;)
 --
-2.25.4
+2.17.1

diff --git a/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch
index 07ab9a03b..699eb6155 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch
+++ b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch
@@ -1,4 +1,4 @@
-From 918f3ef01c7a67f3beb67307966698474f144581 Mon Sep 17 00:00:00 2001
+From debd676cd94f92a30b3be45f1245aa13d8c398c0 Mon Sep 17 00:00:00 2001
 From: Philip Balister <a class="moz-txt-link-rfc2396E" href="mailto:philip@balister.org">&lt;philip@balister.org&gt;</a>
 Date: Wed, 8 Jul 2020 09:41:43 -0400
 Subject: [PATCH] Do not strip binaries.
@@ -6,34 +6,43 @@ Subject: [PATCH] Do not strip binaries.
  * OpenEmbedded strips them after creating debug packages.

 Signed-off-by: Philip Balister <a class="moz-txt-link-rfc2396E" href="mailto:philip@balister.org">&lt;philip@balister.org&gt;</a>
+Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
 ---
- tools/pybind11Tools.cmake | 13 -------------
- 1 file changed, 13 deletions(-)
+ tools/pybind11NewTools.cmake | 5 -----
+ tools/pybind11Tools.cmake    | 4 ----
+ 2 files changed, 9 deletions(-)

+diff --git a/tools/pybind11NewTools.cmake b/tools/pybind11NewTools.cmake
+index 18da8be1..82ebf5e7 100644
+--- a/tools/pybind11NewTools.cmake
++++ b/tools/pybind11NewTools.cmake
+@@ -246,11 +246,6 @@ function(pybind11_add_module target_name)
+     endif()
+   endif()
+
+-  if(NOT MSVC AND NOT ${CMAKE_BUILD_TYPE} MATCHES Debug|RelWithDebInfo)
+-    # Strip unnecessary sections of the binary on Linux/macOS
+-    pybind11_strip(${target_name})
+-  endif()
+-
+   if(MSVC)
+     target_link_libraries(${target_name} PRIVATE pybind11::windows_extras)
+   endif()
 diff --git a/tools/pybind11Tools.cmake b/tools/pybind11Tools.cmake
-index a3603ab..b4c8f63 100644
+index 32313539..a7d81012 100644
 --- a/tools/pybind11Tools.cmake
 +++ b/tools/pybind11Tools.cmake
-@@ -230,19 +230,6 @@ function(pybind11_add_module target_name)
-
-   _pybind11_add_lto_flags(${target_name} ${ARG_THIN_LTO})
+@@ -201,10 +201,6 @@ function(pybind11_add_module target_name)
+     endif()
+   endif()

--  if (NOT MSVC AND NOT ${CMAKE_BUILD_TYPE} MATCHES Debug|RelWithDebInfo)
--    # Strip unnecessary sections of the binary on Linux/Mac OS
--    if(CMAKE_STRIP)
--      if(APPLE)
--        add_custom_command(TARGET ${target_name} POST_BUILD
--                           COMMAND ${CMAKE_STRIP} -x $&lt;TARGET_<a class="moz-txt-link-freetext" href="FILE:$">FILE:$</a>{target_name}&gt;)
--      else()
--        add_custom_command(TARGET ${target_name} POST_BUILD
--                           COMMAND ${CMAKE_STRIP} $&lt;TARGET_<a class="moz-txt-link-freetext" href="FILE:$">FILE:$</a>{target_name}&gt;)
--      endif()
--    endif()
+-  if(NOT MSVC AND NOT ${CMAKE_BUILD_TYPE} MATCHES Debug|RelWithDebInfo)
+-    pybind11_strip(${target_name})
 -  endif()
 -
    if(MSVC)
-     # /MP enables multithreaded builds (relevant when there are many files), /bigobj is
-     # needed for bigger binding projects due to the limit to 64k addressable sections
+     target_link_libraries(${target_name} PRIVATE pybind11::windows_extras)
+   endif()
 --
-2.25.4
+2.17.1

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.6.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pybind11_2.6.2.bb
index 5d57590a1..bd16a6d0d 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.6.2.bb
@@ -1,15 +1,15 @@
 SUMMARY = &quot;Seamless operability between C++11 and Python&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/wjakob/pybind11">&quot;https://github.com/wjakob/pybind11&quot;</a>
 LICENSE = &quot;BSD-2-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62">&quot;file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=774f65abd8a7fe3124be2cdf766cd06f">&quot;file://LICENSE;md5=774f65abd8a7fe3124be2cdf766cd06f&quot;</a>

 DEPENDS = &quot;boost&quot;

 SRC_URI = &quot;git://github.com/pybind/pybind11.git \
            <a class="moz-txt-link-freetext" href="file://0001-Do-not-strip-binaries.patch">file://0001-Do-not-strip-binaries.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-Do-not-check-pointer-size-when-cross-compiling.patch">file://0001-Do-not-check-pointer-size-when-cross-compiling.patch</a> \
-          &quot;
-SRCREV = &quot;3b1dbebabc801c9cf6f0953a4c20b904d444f879&quot;
+&quot;
+SRCREV = &quot;8de7772cc72daca8e947b79b83fea46214931604&quot;

 S = &quot;${WORKDIR}/git&quot;

--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------C6BAA73D0884F542178DFF73--
