Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.47])
 by mx.groups.io with SMTP id smtpd.web09.35559.1611578608567622552
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 04:43:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PLs14OX0;
 spf=pass (domain: windriver.com, ip: 40.107.244.47, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iq5kYkNuoq2qbzmuPWTi2WrjO7+BKgesbNYabC96z6My2qT7wNufQszhbzIqZ3J3nAU6wWGhuSphJKxWEQweyyViot7gce9zjvn7WbPEMQwO9PsCNn8J2R7W4wFsES9aNxi5KMakDDd/aqORm5LclDYBW9PIsY1jV0o121HCZgr+xU5G7U6kLYoV3s5mGE6BCOD9wXXWGfVc1SbMDkhwwkOedRjcZSaEp9pLzhCABKi6fT+8/rV1TZXwD7Pk8QIeM0ULh+wYMB1SQV/n41Ho/zgGWM0jSMlkAivmP6jGds9JPMlpN8KBtub02i+Wux52uwdo4ijca+ofU9KzHHLLMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3REi5EMe/WaXj9VIfoh3P5mte4D3yz7XUAqI+YJHtd8=;
 b=fddlUl9Def599crdcdTUvqf8KRDHJ7MasnyqG6PlQADnAGBA/if4xtL1ybFEP7qbyU3suKz2hZsrCU0KDKHKcZN8/7jdGrrEI3t8KDVLAp2iHXHtzAIgV3XzlPgVcsRIlrGRmmQKbMnlDuuBI6+gptfh/pa41IBa6FMmiQUVD0rGkBS+CnNV2MIro1FneEi3Q/eAHNHC8IQlDRRtbS+knYsNbVFNyz2iFSUDN0u+C9WrUHlRzOqC9fsZTDEOyQw+OkxQoSo6LdHeI1f4n/LApveXiIC7KVjvHoHUQQSxW6of36XHoTHskFEsr8WPWRFg2gve/kjuQarDJVXM8uQ44A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3REi5EMe/WaXj9VIfoh3P5mte4D3yz7XUAqI+YJHtd8=;
 b=PLs14OX0FiTTrsc/A9KlfUzroWMfp1t0xOIAWIobJ72QNQ1zujoHVYYCENSa4Hp0p2O2sJkPImhZ+ErEvk4k4ii/R2u7CYfWvQDFfyyHZtSH6nWPBmzViPyz2UkD68MrHTI7I1TFFpxo8aEBPkPfKiSaRZ0CmkTx3ncQ5CtmEAY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 by MN2PR11MB3678.namprd11.prod.outlook.com (2603:10b6:208:f8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.16; Mon, 25 Jan
 2021 12:43:27 +0000
Received: from MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44]) by MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44%7]) with mapi id 15.20.3763.019; Mon, 25 Jan 2021
 12:43:27 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-pyzmq: Upgrade 20.0.0 -> 21.0.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210122101126.25982-1-leon.anavi@konsulko.com>
 <20210122101126.25982-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3b3adc93-44b5-daec-ba11-ebd9556ae4b6@windriver.com>
Date: Mon, 25 Jan 2021 07:43:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210122101126.25982-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0439.namprd03.prod.outlook.com
 (2603:10b6:408:113::24) To MN2PR11MB3919.namprd11.prod.outlook.com
 (2603:10b6:208:13b::27)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0439.namprd03.prod.outlook.com (2603:10b6:408:113::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.14 via Frontend Transport; Mon, 25 Jan 2021 12:43:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4e7ae4f-0729-46c5-9231-08d8c12ecfda
X-MS-TrafficTypeDiagnostic: MN2PR11MB3678:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB3678170ED6EB8A97D92374989FBD9@MN2PR11MB3678.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1KGrARo6CrECu+rAnLNHdgoKPxsuHqpVoy3rs99MpIhQDWoW3CP6ElBP4CZD9v4+S2/NRzN3K4ITyXN8txdbgWFUF4NPBHS1IvXUH1MjDjdqnTsY+K6ZlCZ+CYpS8FgysOQA6PzSsPL7jmfFmI9DNwvQ0HFmCSAQxjMEt1p8PpLcM2Rv5Y9sC9cYHR/R4ZXn8UmJCj11TRIem2QqkCruczN7+2qRaU5EWBtsyqCGV6gyvRkIgNmfBONQEmY5ylBvHwupyxLe1pnEheiweOiTO1X3xNMWOjZW1sDKl3lA9C/rER38LcjXCZF4gvXHHCpubmdcSL2S3Md2XqZZpGKVH0tAT+lQEro8W4rOrK/sUwHEDutbEYxYFqT1gda2V+2KO4Y0aX2v1ykQ1E6eKx+PEy6pDvOm1ZxfN74TjDCgmAlvFTVxkeKqz1dlUkui0gsn7h+4Y7g9U5gAywd2WRsglUGBQ4IA/oyyodOnj7CB+UkaMAsNIF2/ZhALdhV5K00/hhfm44fyDRu6xTeGD8JO0pk6HOxcc4gJTFOw3gN87GO8bPQR5S+4C0n4rAJg3uVV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3919.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(366004)(39840400004)(346002)(33964004)(2906002)(966005)(478600001)(186003)(316002)(956004)(5660300002)(52116002)(166002)(66556008)(53546011)(66476007)(16526019)(8936002)(36756003)(6486002)(66946007)(26005)(31696002)(44832011)(31686004)(8676002)(86362001)(83380400001)(16576012)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bHZRdzBJOG9CbkhIQUp4ajlBeC9wOC9LWjZCR1RTSHRob3dUbjRFeTIycnln?=
 =?utf-8?B?aEVLYWN3U0RyR1JDUEpSdU5ob0Y1UGRCY0ZaSENEVXdtMjJVdjUvZGo5TER3?=
 =?utf-8?B?dGl5eFJpNnRBTGhGUzl4bzNPQzdweVE3RDlSUmZwcnNvZ003amRpM3B5NHAv?=
 =?utf-8?B?cTRyVVFmZEtQSml2a0ROWmdZMXJSTmRTdzMwTlA0emI3OGE3VmNsaWk4bit2?=
 =?utf-8?B?N3Q1d29TYkVGVkJvWHczbDZNKzV4ZXBXRjQxS2orRjBtQ2lpa2JyRlBsTnFV?=
 =?utf-8?B?NWI4UE5UbEo4cUpvNzRDNTlzME5ZZUM3c1RKdEhBbHdRUjFpVFdGbit2UzdH?=
 =?utf-8?B?aG1FYXQyTU5YMlc1bHVieEoveVdSWGVVUDlBNWkwTi9XelVJd2hVdit0YS9u?=
 =?utf-8?B?MjJ3dWpMYnlvQVIvTzJtekFYMHJxUCs0WTA2V3BEcTFPbEMxQlVwTVRCZFBO?=
 =?utf-8?B?RFFabE9SN1NubEYrQzdNNGt3ZXB1VGdxMmRuOU1jcGlrM1k2RS9Vb3lQZXBT?=
 =?utf-8?B?TWQzd0pHa0hTeENUV2RuQmYyNXdpSTlQWkhQVU1jUnJ5K0hQZDlSSU9xVkhJ?=
 =?utf-8?B?N0MxSm0zL00yakJpVitSbXN5QnZvOE5oeGQ1d2FIam1WTW1LMWQwWTg3ZjRz?=
 =?utf-8?B?TkdRZk1sWlZkOElnREw1dStPNlg1THNCbDdWZEZldjlPNE5KVzg0RjVDWHNR?=
 =?utf-8?B?ZjQ5VHNjQ1ZGS1ROYkdrTFhHNC9TM0UzM0JYcFdiS010TVdZRERueGh5dUJX?=
 =?utf-8?B?MFJzRXVmYmdDdVlqang2d0M2QkZPeVJrRlB3OFNOejZONFB3SVAvMXppUXNY?=
 =?utf-8?B?enQ2VlFNcUxISGJ5VzdyQ3E5OVhTWWl3UkloRXFsQVdweDJ6UXR0Yjk2ak1z?=
 =?utf-8?B?WFJ2RlVrV0hCbDlJWisrZHVsaTBleFByU0d2ZHJMa3Q4S0Z2RWFPUDgvWTdD?=
 =?utf-8?B?a1Y0NE1jSVB1dHlTbE1MdXR5dkhDVW0wSkRCUkpha3dQblRoMTZhakFNZ1BN?=
 =?utf-8?B?UzFOc1h0L3RESlRsM2JhbGgrZzRxRVBHTlZMckNGMTMydlZvRXJOU3JXK0lp?=
 =?utf-8?B?c0RhQmhZMFg4R3VDZHZQblMrcEFEc3FmTDFFU1BwSytjRDdWdE5oajlUbGNt?=
 =?utf-8?B?b1Uvd1RhRHo2VjN4clRuZHZTZFQvVVh6bnN2K01tUU5TTGZ3VkNwMlUxKy9M?=
 =?utf-8?B?NklPdFg2UEFlaDVrTmswSHVpbG5idFh5SkxyODU4cVRZVzhoUWpnWGtaenBu?=
 =?utf-8?B?R2U4azU4UGhqV1pQUitjZHVreGJpaUpNZkQ5cEEvZzlDUWJ0Z1djeGtlUjZO?=
 =?utf-8?Q?r8aHwKN8bSSVw0Zk2xrUbVa0yEi8PpQRmP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e7ae4f-0729-46c5-9231-08d8c12ecfda
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 12:43:27.4118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ldv14HZN1DAKu/HOhEdp341hX3o69E8CgGwtqb07zMGRQ/zhyLmbXhNV9j5Dxls3xpRKN+QdBwLwDDodwkMn6tpGjGIK4QYLUhe+HBdxB2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3678
Content-Type: multipart/alternative;
 boundary="------------938EAC00368D2A60BA045E6D"
Content-Language: en-US

--------------938EAC00368D2A60BA045E6D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-22 5:11 a.m., Leon Anavi wrote:
> - drop support for Python 3.5. Python >= 3.6 is required
> - mypy type stubs, which should improve static analysis of pyzmq,
>    especially for dynamically defined attributes such as zmq
>    constants. These are new! Let us know if you find any issues.
> - support for zero-copy and sending bufferables with cffi backend.
>    This is experimental! Please report issues.
> - zero-copy support in CFFI backend (send(copy=False) now does
>    something).
> - Support sending any buffer-interface-providing objects in CFFI
>    backend.
> - Errors during teardown of asyncio Sockets
> - Missing MSVCP140.dll in Python 3.9 wheels on Windows, causing
>    vcruntime-redist package to be required to use the Python 3.9
>    wheels for pyzmq 20.0
> - pyzmq-21.0.1 only changes CI configuration for Windows wheels
>    (built with VS2017 instead of VS2019), fixing compatibility with
>    some older Windows on all Pythons and removing requirement of
>    VC++ redistributable package on latest Windows and Python < 3.8.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-pyzmq/club-rpath-out.patch  | 24 ++++++++++++++++---
>   ...yzmq_20.0.0.bb => python3-pyzmq_21.0.1.bb} |  2 +-
>   2 files changed, 22 insertions(+), 4 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pyzmq_20.0.0.bb => python3-pyzmq_21.0.1.bb} (91%)
>
> diff --git a/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch b/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch
> index 936f16585..d4e144a61 100644
> --- a/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch
> +++ b/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch
> @@ -1,13 +1,31 @@
> +From b394003d31a7187767b7d6cc7b871968d2674be9 Mon Sep 17 00:00:00 2001
> +From: Leon Anavi <leon.anavi@konsulko.com>
> +Date: Fri, 22 Jan 2021 11:41:12 +0200
> +Subject: [PATCH] setup.py: Adjust _add_rpath
> +
> +Fix error: unrecognized command-line option '-R'
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> +---
> + setup.py | 3 ---
> + 1 file changed, 3 deletions(-)
> +
>   diff --git a/setup.py b/setup.py
> -index d243eaa..98099bc 100755
> +index 22f582d..2d28655 100755
>   --- a/setup.py
>   +++ b/setup.py
> -@@ -192,8 +192,6 @@ def _add_rpath(settings, path):
> +@@ -231,9 +231,6 @@ def _add_rpath(settings, path):
>        """
>        if sys.platform == 'darwin':
> -         settings['extra_link_args'].extend(['-Wl,-rpath','-Wl,%s' % path])
> +         settings['extra_link_args'].extend(['-Wl,-rpath', '-Wl,%s' % path])
>   -    else:
>   -        settings['runtime_library_dirs'].append(path)
> +-
>    
>    def settings_from_prefix(prefix=None, bundle_libzmq_dylib=False):
>        """load appropriate library/include settings from ZMQ prefix"""
> +--
> +2.17.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_20.0.0.bb b/meta-python/recipes-devtools/python/python3-pyzmq_21.0.1.bb
> similarity index 91%
> rename from meta-python/recipes-devtools/python/python3-pyzmq_20.0.0.bb
> rename to meta-python/recipes-devtools/python/python3-pyzmq_21.0.1.bb
> index a668eb11e..d6b741460 100644
> --- a/meta-python/recipes-devtools/python/python3-pyzmq_20.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyzmq_21.0.1.bb
> @@ -8,7 +8,7 @@ DEPENDS = "zeromq"
>   FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyzmq:"
>   
>   SRC_URI += "file://club-rpath-out.patch"
> -SRC_URI[sha256sum] = "824ad5888331aadeac772bce27e1c2fbcab82fade92edbd234542c4e12f0dca9"
> +SRC_URI[sha256sum] = "c3a630dd7716e8e127d43b22598e256a2d11a847b8cc3310350528960037fa06"
>   
>   inherit pypi pkgconfig setuptools3
>   
>
> 
>

--------------938EAC00368D2A60BA045E6D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-22 5:11 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210122101126.25982-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- drop support for Python 3.5. Python &gt;= 3.6 is required
- mypy type stubs, which should improve static analysis of pyzmq,
  especially for dynamically defined attributes such as zmq
  constants. These are new! Let us know if you find any issues.
- support for zero-copy and sending bufferables with cffi backend.
  This is experimental! Please report issues.
- zero-copy support in CFFI backend (send(copy=False) now does
  something).
- Support sending any buffer-interface-providing objects in CFFI
  backend.
- Errors during teardown of asyncio Sockets
- Missing MSVCP140.dll in Python 3.9 wheels on Windows, causing
  vcruntime-redist package to be required to use the Python 3.9
  wheels for pyzmq 20.0
- pyzmq-21.0.1 only changes CI configuration for Windows wheels
  (built with VS2017 instead of VS2019), fixing compatibility with
  some older Windows on all Pythons and removing requirement of
  VC++ redistributable package on latest Windows and Python &lt; 3.8.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210122101126.25982-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-pyzmq/club-rpath-out.patch  | 24 ++++++++++++++++---
 ...yzmq_20.0.0.bb =&gt; python3-pyzmq_21.0.1.bb} |  2 +-
 2 files changed, 22 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_20.0.0.bb =&gt; python3-pyzmq_21.0.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch b/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch
index 936f16585..d4e144a61 100644
--- a/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch
+++ b/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch
@@ -1,13 +1,31 @@
+From b394003d31a7187767b7d6cc7b871968d2674be9 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
+Date: Fri, 22 Jan 2021 11:41:12 +0200
+Subject: [PATCH] setup.py: Adjust _add_rpath
+
+Fix error: unrecognized command-line option '-R'
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
+---
+ setup.py | 3 ---
+ 1 file changed, 3 deletions(-)
+
 diff --git a/setup.py b/setup.py
-index d243eaa..98099bc 100755
+index 22f582d..2d28655 100755
 --- a/setup.py
 +++ b/setup.py
-@@ -192,8 +192,6 @@ def _add_rpath(settings, path):
+@@ -231,9 +231,6 @@ def _add_rpath(settings, path):
      &quot;&quot;&quot;
      if sys.platform == 'darwin':
-         settings['extra_link_args'].extend(['-Wl,-rpath','-Wl,%s' % path])
+         settings['extra_link_args'].extend(['-Wl,-rpath', '-Wl,%s' % path])
 -    else:
 -        settings['runtime_library_dirs'].append(path)
+-
  
  def settings_from_prefix(prefix=None, bundle_libzmq_dylib=False):
      &quot;&quot;&quot;load appropriate library/include settings from ZMQ prefix&quot;&quot;&quot;
+-- 
+2.17.1
+
diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_20.0.0.bb b/meta-python/recipes-devtools/python/python3-pyzmq_21.0.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pyzmq_20.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_21.0.1.bb
index a668eb11e..d6b741460 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_20.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_21.0.1.bb
@@ -8,7 +8,7 @@ DEPENDS = &quot;zeromq&quot;
 FILESEXTRAPATHS_prepend := &quot;${THISDIR}/python-pyzmq:&quot;
 
 SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://club-rpath-out.patch">&quot;file://club-rpath-out.patch&quot;</a>
-SRC_URI[sha256sum] = &quot;824ad5888331aadeac772bce27e1c2fbcab82fade92edbd234542c4e12f0dca9&quot;
+SRC_URI[sha256sum] = &quot;c3a630dd7716e8e127d43b22598e256a2d11a847b8cc3310350528960037fa06&quot;
 
 inherit pypi pkgconfig setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------938EAC00368D2A60BA045E6D--
