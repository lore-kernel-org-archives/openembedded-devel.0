Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.89])
 by mx.groups.io with SMTP id smtpd.web09.33741.1612186523799079391
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Feb 2021 05:35:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=RKEys467;
 spf=pass (domain: windriver.com, ip: 40.107.75.89, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OeGPCg/nITRLTgnO3Pzk37ezRU+bxlKG6hYIzuIATDG8a8hvo/tMGuWGq0vLYzU1Tz+zNGWsAWQjNt18hRznCX7+rCZ2dWiLlJFs6rkvcfdPtN3YiJ5AZ0fF7bqB+v91Wi7EfNKvHYkhPkCeFhy8b/oXJiJLlTpKpHkzDiZAQzMJobrRVmI5mZq1u+gEzuQQTWKDdZ4W0t8CCZ9kC9I5SBza3IpUfHaZJLrR352n1frOLxo87qaK1sHAp/SxO8YFOkDGQuimdoDKCO7Bjr8BWrxy32gOZfmtNGwoM90qWT7VBqSXAmjOHMGKlUvu2jcx6XnKjBz7pwzDn0oBZMVfoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ctoeCZ0K6+t7Rs8pU5rzgdJncC7OddPo3ioIIjDeQM=;
 b=hMLbbvZ0/OFpgcW4asJAsugSrIAfJEbWKIHM94uNgxVa7Pchm8W5asFCSpj9UFsDgSTkXwdFvLsenHseI66NBgwJ2WCAk1VWKE4dh55a102A+n5jEkTmqBwCScrs8+gTHCmeBZ6nn1yB+8BgROvv9UYk4Q6Gdej/btXtJFL1eozdhrLnvOO87TsyYfvg1pdVxaUJt4b9vGbcupzjWJXGsReiILbmxeKCrux2gUtPGdH9ktQzStcJ9Hmtwizu66x8CJy5nr1iYnDa37XzoPQeWwaQuEW8a+7VcRzoa+bnHtpjUhz2CCP7HFvWL9ns1GVfUc/jt+Cx8QYIXTzAEhBSgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ctoeCZ0K6+t7Rs8pU5rzgdJncC7OddPo3ioIIjDeQM=;
 b=RKEys4675rJgfWfyULJfyIrZsTbVTLjr/L7i54PHGtDHwvhCHd8N3Q8aWVodVLALJxGzjRMgvTegMD32vqYw2SBUx44JejvJbqCOFz4QooRQxTrCnRo1lo1bWgVRitpY2cO9LrMZvQ7KsZ1wsiavRuZJNsRJC18ief+yQtxhaZI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4308.namprd11.prod.outlook.com (2603:10b6:a03:1b9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Mon, 1 Feb
 2021 13:35:22 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.024; Mon, 1 Feb 2021
 13:35:22 +0000
Subject: Re: [oe] [meta-python][PATCH 3/4] python3-pyzmq: Upgrade 21.0.2 -> 22.0.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210129131029.2163-1-leon.anavi@konsulko.com>
 <20210129131029.2163-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <29c60e01-a6f6-bf10-feff-6399f62cbff2@windriver.com>
Date: Mon, 1 Feb 2021 08:35:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210129131029.2163-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR1101CA0019.namprd11.prod.outlook.com
 (2603:10b6:405:4a::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR1101CA0019.namprd11.prod.outlook.com (2603:10b6:405:4a::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Mon, 1 Feb 2021 13:35:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4fce5e1-90bc-4f33-c1f9-08d8c6b6392a
X-MS-TrafficTypeDiagnostic: BY5PR11MB4308:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB430803B524D004C834E0D64F9FB69@BY5PR11MB4308.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sPXgIY22Zo95VTEW9/vqyb0NhaBU94ZNyqecWmVJDOwh2m0LbkWzNoDdFbr+oTc5I8dzFwpmrBWpOB451xqpX/3/Ab4ldA/KchBMm4ELLsj6GsbvWZrQhKQ7H2uj9Ga9hQixVKemZutse/5EY2yfxAWdC1BFe0e1r6nrshfYweWdxdsYOow4NdtdqFHldwMf2ht9SwkPrn60GcjWNfR7sX/xmzt/JRQp/pLSQEsfBBr6SWqLzZOGMCHrETFedM7Qzhh/qA56PSRQqrm6E2Bv2d7OGDhtSVyuW369MUtGysfWe0Lu82txY/K6/YVPi4cZZ74NM6/Y8iA3aYwpLlvhrg7iNOTFp2NUAIWnFctaLICou4nxdMSN+0dggHIYll2HXYaOamxbmqsOfNzEeXC1JIG6lBrc/Awk4tLDTlym6DPq0UMiqetmZL2TGAb/AHHXrOrC5fUB2EieAo2XcFsu/TUBZmCBmMMs3lkWX+XtA6HDXmIRPHz6YBIZI7SCzdO0MuKJvPgOeb8GpfIyodyciqrQddaeT7nlVoCBiMFlQoV6J3p2snLV0s/n4FPUKa9FXBcNIZLVctZE9c9XEVhyvyytBrmDBd+E1jaVpVzJdhDr0EGPHwW8gw5ktmR5zXyosYQsUpdlmLAoRZB6bX70rp1xRFjveKwSxiI7XqLGpDO4qw6Kio1I0lYZ9qt2scid
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(136003)(376002)(396003)(366004)(5660300002)(316002)(478600001)(26005)(966005)(8936002)(53546011)(956004)(2616005)(186003)(44832011)(16526019)(166002)(86362001)(52116002)(2906002)(16576012)(66946007)(83380400001)(66556008)(66476007)(31686004)(6486002)(33964004)(31696002)(36756003)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?M05uc0VMTnkwcWpGS1prSkhWTTNEYjIwempYOVEvQ05tS3lBd0tJelo2USt0?=
 =?utf-8?B?T1hUdmdSMHV4Qm1CK1dlbS9YaVJhSW5sUy9OWWJjUmZkamp1cllYY2p4SU5V?=
 =?utf-8?B?MWdWRGozREIxRXMycVE3ZGpUT3dHaUpUMUt4dmlLSHNTM3J4dm94bGx0cit0?=
 =?utf-8?B?UGViMWRZb0lLTndHblBqOFA1ckpWYXppenRZb1J0RVhtVVRCN2xuSGFnckVy?=
 =?utf-8?B?Ynd0MkcxbmN4cy9SdnB1dkVxUXZjYXZsUWZ4aithLzM1ZFY3Rm9hRUhtajdh?=
 =?utf-8?B?TTUzWnJnd1B3N0xaWjNxWkQxZnJxMjRuOEl6cUFiNUx6MnNvWnNiWXVSVXZG?=
 =?utf-8?B?YTJGMG4zd1AvVHIraVdkZFNXbnVrL0NYaEJLeTk0ZnpjSnNkNzBNVkQvc0hv?=
 =?utf-8?B?SnFwWXVaWVRQdzVVMFJiNmdzL2YwR2gwZmYxN2M4QXdVMHZodS9WZ1grY1Bp?=
 =?utf-8?B?Z1k0bjlITXJqcUpwRmNkb0lSZ3kyYkN4M044bGpvei9OcXBac24rNXBxZWcw?=
 =?utf-8?B?Z2VuTXN4aFQrN3JZVW1jS1FwNDRxbC93bU5hVjJmN053Tm5uNTBZU1NJUjRr?=
 =?utf-8?B?c3B3c0FmT0YxNW0yOGMvWWVlZmk5OHExOGN2N05kZWlqQ2dlNUxuaWZiQjhI?=
 =?utf-8?B?TVI2ZTFVak1sQWVUdTR5M3c4NHRRcFVDL3RoVHc1bXQ2NFFiME1IdDhCYS9V?=
 =?utf-8?B?QWVPbkpWRmU3d0J3MFlpY00zeUhDRmZkWXA5WkNTY1pIcmVXRi9wVTVxb2VB?=
 =?utf-8?B?QTY2amlBWnUxRkVlMlpLV1hEYVhzU2dEVEtkc0dSL0hjN2ZreWdMQVFZMTZS?=
 =?utf-8?B?L0IzNGgzRzVtTkdlbmZzZ3dneE5RV0dSWmZ2bEg5TkdpUzI0OXFuSnVnTTU1?=
 =?utf-8?B?V2N0L2xRdDBTcmI0YnpjMkhYOWQrSzQxd1NzaXEzT2t2TTA5YzFLamxoQTcv?=
 =?utf-8?B?UlorZk1relZjNVNEVHdQR3JPUk1YbXFYNmxZUTVmVlAxcjBsdWM3bk5POWcr?=
 =?utf-8?B?R2xFd2NIMERGcE05aFNyWm1NbnpzNjdOdHpoTkFoMUFKOFhNN25ZUkJFS0NI?=
 =?utf-8?B?QnhmNjM0WUFLdzNSdUJQcStjZENRaW1vL2ZPMmxWNndCRGN0YmtiWU51VEcr?=
 =?utf-8?B?SjRzdFhmM3IvamhtK2hBTDVJd0FnWkJuKzIyTG5yRXpxKzdTUUhtNkh4R21F?=
 =?utf-8?B?MjJ0U0RJN0E1dmJaK0poa0xvNFZmNUpTTkRiTHA2S3Z3TFZVZUhBanpJZWht?=
 =?utf-8?B?RUR1K2swamtDQTdody9wRGtKR1dJcWtuMXRRbDRIQ3c5UHpLTzQyVElVUG5w?=
 =?utf-8?B?cWN3aHlOM1ZDYkQrREVrQlFjYTdmWFM4Zk01WFVmOHhYcFFmSG5JdUNlNGVl?=
 =?utf-8?B?ckNXakl3QUhNU29wc0UybkpiekVUNmRGNjFHV244akFDcnlsREkrYjJDZm5a?=
 =?utf-8?Q?k85ol5VR?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4fce5e1-90bc-4f33-c1f9-08d8c6b6392a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 13:35:22.1374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vr/FaK0LLIZD5PWTtMAUqwiPGG+5iLkL/dusd8BF0uI2TvwKD3dwwERQF8bdhFh14tELR+aT8jVtsKxXsdr5yWXomYQbXZhai1BzyO40fJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4308
Content-Type: multipart/alternative;
 boundary="------------CE75D6DC712163B16BA08676"
Content-Language: en-US

--------------CE75D6DC712163B16BA08676
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-29 8:10 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 22.0.2:
>
> - Add workaround for bug in DLL loading for Windows wheels with
>    conda Python >= 3.8
> - Fix type of Frame.bytes for non-copying recvs with CFFI backend
>    (regression in 21.0)
> - Add manylinux wheels for pypy
> - Some typing fixes
> - Bump bundled libzmq to 4.3.4
> - Strip unused symbols in manylinux wheels, resulting in
>    dramatically smaller binaries. This matches behavior in v20 and
>    earlier.
> - Windows CPython wheels bundle public libzmq binary builds,
>    instead of building libzmq as a Python Extension. This means
>    they include libsodium for the first time.
> - Our own implementation of bundling libzmq into pyzmq on Windows
>    is removed, instead relying on delvewheel (or installations
>    putting dlls on %PATH%) to bundle dependency dlls.
> - The (new in 21.0) Windows wheels for PyPy likely require the
>    Windows vcredist package. This may have always been the case,
>    but the delvewheel approach doesn't seem to work.
> - Windows + PyPy is now the only remaining case where a wheel has
>    libzmq built as an Extension. All other builds ship libzmq built
>    using its own tooling, which should result in better, more
>    stable builds.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-pyzmq/club-rpath-out.patch         | 12 +++++-------
>   ...thon3-pyzmq_21.0.2.bb => python3-pyzmq_22.0.2.bb} |  2 +-
>   2 files changed, 6 insertions(+), 8 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pyzmq_21.0.2.bb => python3-pyzmq_22.0.2.bb} (91%)
>
> diff --git a/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch b/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch
> index d4e144a61..61aeaca5f 100644
> --- a/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch
> +++ b/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch
> @@ -1,4 +1,4 @@
> -From b394003d31a7187767b7d6cc7b871968d2674be9 Mon Sep 17 00:00:00 2001
> +From efae4e08d13e0958d929ea524e21c0a210b31982 Mon Sep 17 00:00:00 2001
>   From: Leon Anavi <leon.anavi@konsulko.com>
>   Date: Fri, 22 Jan 2021 11:41:12 +0200
>   Subject: [PATCH] setup.py: Adjust _add_rpath
> @@ -8,15 +8,16 @@ Fix error: unrecognized command-line option '-R'
>   Upstream-Status: Inappropriate [oe specific]
>
>   Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> +
>   ---
>    setup.py | 3 ---
>    1 file changed, 3 deletions(-)
>
>   diff --git a/setup.py b/setup.py
> -index 22f582d..2d28655 100755
> +index b634d94..7f6a2f1 100755
>   --- a/setup.py
>   +++ b/setup.py
> -@@ -231,9 +231,6 @@ def _add_rpath(settings, path):
> +@@ -235,9 +235,6 @@ def _add_rpath(settings, path):
>        """
>        if sys.platform == 'darwin':
>            settings['extra_link_args'].extend(['-Wl,-rpath', '-Wl,%s' % path])
> @@ -24,8 +25,5 @@ index 22f582d..2d28655 100755
>   -        settings['runtime_library_dirs'].append(path)
>   -
>
> - def settings_from_prefix(prefix=None, bundle_libzmq_dylib=False):
> + def settings_from_prefix(prefix=None):
>        """load appropriate library/include settings from ZMQ prefix"""
> ---
> -2.17.1
> -
> diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_21.0.2.bb b/meta-python/recipes-devtools/python/python3-pyzmq_22.0.2.bb
> similarity index 91%
> rename from meta-python/recipes-devtools/python/python3-pyzmq_21.0.2.bb
> rename to meta-python/recipes-devtools/python/python3-pyzmq_22.0.2.bb
> index 8bde98247..555f27cb4 100644
> --- a/meta-python/recipes-devtools/python/python3-pyzmq_21.0.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyzmq_22.0.2.bb
> @@ -8,7 +8,7 @@ DEPENDS = "zeromq"
>   FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyzmq:"
>
>   SRC_URI += "file://club-rpath-out.patch"
> -SRC_URI[sha256sum] = "098c13c6198913c2a0690235fa74d2e49161755f66b663beaec89651554cc79c"
> +SRC_URI[sha256sum] = "d7b82a959e5e22d492f4f5a1e650e909a6c8c76ede178f538313ddb9d1e92963"
>
>   inherit pypi pkgconfig setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------CE75D6DC712163B16BA08676
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-29 8:10 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210129131029.2163-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 22.0.2:

- Add workaround for bug in DLL loading for Windows wheels with
  conda Python &gt;= 3.8
- Fix type of Frame.bytes for non-copying recvs with CFFI backend
  (regression in 21.0)
- Add manylinux wheels for pypy
- Some typing fixes
- Bump bundled libzmq to 4.3.4
- Strip unused symbols in manylinux wheels, resulting in
  dramatically smaller binaries. This matches behavior in v20 and
  earlier.
- Windows CPython wheels bundle public libzmq binary builds,
  instead of building libzmq as a Python Extension. This means
  they include libsodium for the first time.
- Our own implementation of bundling libzmq into pyzmq on Windows
  is removed, instead relying on delvewheel (or installations
  putting dlls on %PATH%) to bundle dependency dlls.
- The (new in 21.0) Windows wheels for PyPy likely require the
  Windows vcredist package. This may have always been the case,
  but the delvewheel approach doesn't seem to work.
- Windows + PyPy is now the only remaining case where a wheel has
  libzmq built as an Extension. All other builds ship libzmq built
  using its own tooling, which should result in better, more
  stable builds.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210129131029.2163-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-pyzmq/club-rpath-out.patch         | 12 +++++-------
 ...thon3-pyzmq_21.0.2.bb =&gt; python3-pyzmq_22.0.2.bb} |  2 +-
 2 files changed, 6 insertions(+), 8 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_21.0.2.bb =&gt; python3-pyzmq_22.0.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch b/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch
index d4e144a61..61aeaca5f 100644
--- a/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch
+++ b/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch
@@ -1,4 +1,4 @@
-From b394003d31a7187767b7d6cc7b871968d2674be9 Mon Sep 17 00:00:00 2001
+From efae4e08d13e0958d929ea524e21c0a210b31982 Mon Sep 17 00:00:00 2001
 From: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
 Date: Fri, 22 Jan 2021 11:41:12 +0200
 Subject: [PATCH] setup.py: Adjust _add_rpath
@@ -8,15 +8,16 @@ Fix error: unrecognized command-line option '-R'
 Upstream-Status: Inappropriate [oe specific]

 Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
+
 ---
  setup.py | 3 ---
  1 file changed, 3 deletions(-)

 diff --git a/setup.py b/setup.py
-index 22f582d..2d28655 100755
+index b634d94..7f6a2f1 100755
 --- a/setup.py
 +++ b/setup.py
-@@ -231,9 +231,6 @@ def _add_rpath(settings, path):
+@@ -235,9 +235,6 @@ def _add_rpath(settings, path):
      &quot;&quot;&quot;
      if sys.platform == 'darwin':
          settings['extra_link_args'].extend(['-Wl,-rpath', '-Wl,%s' % path])
@@ -24,8 +25,5 @@ index 22f582d..2d28655 100755
 -        settings['runtime_library_dirs'].append(path)
 -

- def settings_from_prefix(prefix=None, bundle_libzmq_dylib=False):
+ def settings_from_prefix(prefix=None):
      &quot;&quot;&quot;load appropriate library/include settings from ZMQ prefix&quot;&quot;&quot;
---
-2.17.1
-
diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_21.0.2.bb b/meta-python/recipes-devtools/python/python3-pyzmq_22.0.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pyzmq_21.0.2.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_22.0.2.bb
index 8bde98247..555f27cb4 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_21.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_22.0.2.bb
@@ -8,7 +8,7 @@ DEPENDS = &quot;zeromq&quot;
 FILESEXTRAPATHS_prepend := &quot;${THISDIR}/python-pyzmq:&quot;

 SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://club-rpath-out.patch">&quot;file://club-rpath-out.patch&quot;</a>
-SRC_URI[sha256sum] = &quot;098c13c6198913c2a0690235fa74d2e49161755f66b663beaec89651554cc79c&quot;
+SRC_URI[sha256sum] = &quot;d7b82a959e5e22d492f4f5a1e650e909a6c8c76ede178f538313ddb9d1e92963&quot;

 inherit pypi pkgconfig setuptools3

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

--------------CE75D6DC712163B16BA08676--
