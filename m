Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.62])
 by mx.groups.io with SMTP id smtpd.web11.23090.1591976346067288932
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 08:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YRD8K5xp;
 spf=pass (domain: windriver.com, ip: 40.107.94.62, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQ+Ri257lAqQQBmNzjjNsZnsfu0Snz4HIeHgmTH85bMG7YBkeFPYR9epi4LQu5lmnkS/nyqouwsT0j+OttvjNeGkmsqL5U4izk03Wd1tAxwNtWdAuiORvmcpnSxjYKhIwlVhJLU9wiSuzCanXESW9cYwSXDYGUWi2L1PHaInvq9gH5fQnOv/5XClZeokPTWbJHWI3G7IefvYEk0PjWZkXuS3OJmVTuVh96znbQeiVPV3X96atdkCxv9YvYVyK+O1HH0aIpxvvFZfHs1D6kHf9p5QGVYAXrKxyZ25QCzSVmot5Ac9Uep7kawSValTEYaP/IQ8Totbbz/j/aEAQM9zUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LO6yB2WwFLs3OgSMvl//FuTPRwHKZygAFX0bZkN+oI=;
 b=di4fiOhhnPUAJM70nzUTB8UK/gtrg/GgtgX65bc1GPGrf64RIN8py27Kj7AysGJW8RnLanY1VOm1EO+MyK+76cfWIbI3eN2G6gTKzJem7TOupevsgVD1BCrhqcSylm2bOOWTBZb/BINRBZwfraCjgyOOVReDfjInWPqBjCGWK3x1WfqA0bd7dqxIhaWzDeVG38sPwcjU5+Brf40sVmkfXWtxTRHKVr+OHZKy+fQ8uRY+2yrWPjBhASaUJx9cA6AxBVwduKCXIj7ZcCsry0YsP3iPMAeFHVGh7L/V4zUVUrfU41+v0NEfkZMMS+/vHnNZ3uwuknop6T4pnS39nR8gLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LO6yB2WwFLs3OgSMvl//FuTPRwHKZygAFX0bZkN+oI=;
 b=YRD8K5xpwQ3MPz7oBwf1azACNaZEgaMuiSSOY7oYBD+YbtSeApvWRcB2VtcVPo5oqaK9Jh2P1lfS5YFwW/BPQqrf3EDfhabYGNgDSwb3VFc622wnr+SydL+twoPQWvHFNbRVRUB/29YvJOQQIMM88vPJ1/2l16MxqGOBOIn4s+Y=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3953.namprd11.prod.outlook.com (2603:10b6:405:7f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Fri, 12 Jun
 2020 15:39:02 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Fri, 12 Jun 2020
 15:39:02 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-twisted: Upgrade 19.10.0 -> 20.3.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200612144201.4536-1-leon.anavi@konsulko.com>
 <20200612144201.4536-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <aaf3034c-a60f-edc8-07cc-13524b306b3a@windriver.com>
Date: Fri, 12 Jun 2020 11:39:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200612144201.4536-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::16)
 To BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Fri, 12 Jun 2020 15:39:02 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42d87c4f-fe13-417a-f184-08d80ee6bb7b
X-MS-TrafficTypeDiagnostic: BN6PR11MB3953:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3953B9F57E51390DDC9EA8C59F810@BN6PR11MB3953.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:612;
X-Forefront-PRVS: 0432A04947
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dAZ+8vGBdHcAxHJ9a7lnO+WLdWKLM/faojbZC82oJVlMx3CdLW9yiddcJezWfr59499VQ0kO6oGjW71x9wlWrEv+WnxER82rIn8hDeilyRc+A/GUxB3GbxDL/MtHsJTZ4347SLPzLIu34rh/1ubqNmQP0j5RLhgPoYaIEz64bs2tts5zTocypOC9lUVg6AOzdo7VxtnB7UYPn8tUeYXFLOYBPUxBVhOAEJjyUWnbgVtVk9gRBgMYKgxerTTW21cR1fUICqLL9iX3ZkhE8bEQJ+qWixHhGID38NG6bWWlsJKQiCcZfMq5OCStDs9wX9uKBu6bm9iSvMaTS2aP+p5KsSDRY+h7PdDEK5r6fwfOBaiSe0v0Zq5JzG9Vlve8DKRsEpiJ40xGbRZTc2UzeE76PQO4+rtSI9LCopZMmj6P+nVwmP8ypEn+RtxFEOMoG96tPqcj09fTACroq4667NX3+Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(366004)(396003)(376002)(346002)(39850400004)(5660300002)(8936002)(33964004)(36756003)(316002)(53546011)(16576012)(956004)(31686004)(52116002)(83380400001)(66556008)(66476007)(66946007)(16526019)(86362001)(6486002)(186003)(966005)(26005)(2906002)(44832011)(166002)(478600001)(8676002)(31696002)(66574014)(2616005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	kouilGdrloIhmoRi53bSVwe+ppV9mfzcaJB8WOfzIAyS+SiDbn9YH5QC2o1G/u87JwMNx9a3E3pwRSGFxM1kNeSJEnF2arb4DwpaRLfHJXeaArkcudCY0muOSzt5rOQOCH4WY4tmd3of1xbUTXss8aSe4V/sv0NVP0dNIpULzDBqp7soMW0fBVAfMYaeBPK0lCFuzMEKuBDZWacMCdD7/pSvipmpBM4QoeC+ytM8FXzrxuSZs/PDaOy6r8iY7Sp0easVc7vULfZG9/Vit97FhFVrBJBrY54+ulCfWbICXEagao6adaBNeS3nlcWXGl42jd0669EARzjRfzryToIcxF+aSTC0a2NxV/naXz88fdY7SJFJ14kNIxhhgT2UUT+KSVv1l3PvkX56lAJJMgtdu1H21VN+DBRusXgShmZRB+iRUVJjd/YSME8QnnOzn0L0n3rKcGZ3pIadtsqaJHGj0wbV9+NLxJKmlz66eCA4E60mQZFlqzmLNB1hknVOq5tK
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d87c4f-fe13-417a-f184-08d80ee6bb7b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2020 15:39:02.6042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvyfrDtxepyjDpf6Iq5Ga+MxZdyp0IsV3a2l6T6FVrDsHr5TTBMgorn+Hx3pTjqlpRoLlrv4i86Kg2NkIoseEIOrESlufNc8wcts/CtxlWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3953
Content-Type: multipart/alternative;
 boundary="------------E8B6B85AAABCB9E321046F93"
Content-Language: en-US

--------------E8B6B85AAABCB9E321046F93
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/12/20 10:42 AM, Leon Anavi wrote:
> Upgrade to release 20.3.0. The year in file LICENSE has been
> updated but the project remains available under MIT license.
> The patch for test_runner.py is no longer needed because the same
> fix has been already applied in the upstream. The new release
> bring the following improvements:
>
> - Bugfixes
> - Improved documentation
> - twisted.news is deprecated
> - twisted.conch.ssh now supports the curve25519-sha256 key
>    exchange algorithm
> - twisted.conch.ssh.keys can now write private keys in the new
>    "openssh-key-v1" format, introduced in OpenSSH 6.5 and made the
>    default in OpenSSH 7.8. ckeygen has a corresponding new
>    --private-key-subtype=v1 option.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...r-import-in-test_runner-to-be-from-t.patch | 38 -------------------
>   ...d_19.10.0.bb => python3-twisted_20.3.0.bb} |  8 ++--
>   2 files changed, 3 insertions(+), 43 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-twisted/0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch
>   rename meta-python/recipes-devtools/python/{python3-twisted_19.10.0.bb => python3-twisted_20.3.0.bb} (97%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-twisted/0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch b/meta-python/recipes-devtools/python/python3-twisted/0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch
> deleted file mode 100644
> index 39fc7d43e..000000000
> --- a/meta-python/recipes-devtools/python/python3-twisted/0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From 754f21282ad2775db8ff501d40bbc497faeb17ba Mon Sep 17 00:00:00 2001
> -From: Trevor Gamblin <trevor.gamblin@windriver.com>
> -Date: Tue, 17 Dec 2019 15:09:22 -0500
> -Subject: [PATCH] fix MemoryReactor import in test_runner to be from
> - twisted.internet.testing
> -
> -Upstream-Status: Backport [https://github.com/twisted/twisted/commit/754f21282ad2775db8ff501d40bbc497faeb17ba]
> -
> -Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ----
> - src/twisted/application/newsfragments/9746.misc    | 1 +
> - src/twisted/application/runner/test/test_runner.py | 2 +-
> - 2 files changed, 2 insertions(+), 1 deletion(-)
> - create mode 100644 src/twisted/application/newsfragments/9746.misc
> -
> -diff --git a/src/twisted/application/newsfragments/9746.misc b/src/twisted/application/newsfragments/9746.misc
> -new file mode 100644
> -index 000000000..8b1378917
> ---- /dev/null
> -+++ b/src/twisted/application/newsfragments/9746.misc
> -@@ -0,0 +1 @@
> -+
> -diff --git a/src/twisted/application/runner/test/test_runner.py b/src/twisted/application/runner/test/test_runner.py
> -index 9abc3449a..cce495b12 100644
> ---- a/src/twisted/application/runner/test/test_runner.py
> -+++ b/src/twisted/application/runner/test/test_runner.py
> -@@ -15,7 +15,7 @@ from twisted.logger import (
> -     LogLevel, LogPublisher, LogBeginner,
> -     FileLogObserver, FilteringLogObserver, LogLevelFilterPredicate,
> - )
> --from twisted.test.proto_helpers import MemoryReactor
> -+from twisted.internet.testing import MemoryReactor
> -
> - from ...runner import _runner
> - from .._exit import ExitStatus
> ---
> -2.24.1
> -
> diff --git a/meta-python/recipes-devtools/python/python3-twisted_19.10.0.bb b/meta-python/recipes-devtools/python/python3-twisted_20.3.0.bb
> similarity index 97%
> rename from meta-python/recipes-devtools/python/python3-twisted_19.10.0.bb
> rename to meta-python/recipes-devtools/python/python3-twisted_20.3.0.bb
> index f2fcd30b7..697725fd7 100644
> --- a/meta-python/recipes-devtools/python/python3-twisted_19.10.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-twisted_20.3.0.bb
> @@ -5,12 +5,10 @@ HOMEPAGE = "http://www.twistedmatrix.com"
>   
>   #twisted/topfiles/NEWS:655: - Relicensed: Now under the MIT license, rather than LGPL.
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=1743f12d8b8f5aec625c0569a058f0a6"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=27ac6d9597237e7e76282edd7a40cd68"
>   
> -SRC_URI += "file://0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch"
> -
> -SRC_URI[sha256sum] = "7394ba7f272ae722a74f3d969dcf599bc4ef093bc392038748a490f1724a515d"
> -SRC_URI[md5sum] = "f2d70f7a66ecdf54152310164cceadfe"
> +SRC_URI[sha256sum] = "d72c55b5d56e176563b91d11952d13b01af8725c623e498db5507b6614fc1e10"
> +SRC_URI[md5sum] = "fc16d575730db7d0cddd09fc35af3eea"
>   
>   PYPI_PACKAGE = "Twisted"
>   PYPI_PACKAGE_EXT = "tar.bz2"
>
> 

--------------E8B6B85AAABCB9E321046F93
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/12/20 10:42 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200612144201.4536-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 20.3.0. The year in file LICENSE has been
updated but the project remains available under MIT license.
The patch for test_runner.py is no longer needed because the same
fix has been already applied in the upstream. The new release
bring the following improvements:

- Bugfixes
- Improved documentation
- twisted.news is deprecated
- twisted.conch.ssh now supports the curve25519-sha256 key
  exchange algorithm
- twisted.conch.ssh.keys can now write private keys in the new
  &quot;openssh-key-v1&quot; format, introduced in OpenSSH 6.5 and made the
  default in OpenSSH 7.8. ckeygen has a corresponding new
  --private-key-subtype=v1 option.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200612144201.4536-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...r-import-in-test_runner-to-be-from-t.patch | 38 -------------------
 ...d_19.10.0.bb =&gt; python3-twisted_20.3.0.bb} |  8 &#43;&#43;--
 2 files changed, 3 insertions(&#43;), 43 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-twisted/0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch
 rename meta-python/recipes-devtools/python/{python3-twisted_19.10.0.bb =&gt; python3-twisted_20.3.0.bb} (97%)

diff --git a/meta-python/recipes-devtools/python/python3-twisted/0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch b/meta-python/recipes-devtools/python/python3-twisted/0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch
deleted file mode 100644
index 39fc7d43e..000000000
--- a/meta-python/recipes-devtools/python/python3-twisted/0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch
&#43;&#43;&#43; /dev/null
@@ -1,38 &#43;0,0 @@
-From 754f21282ad2775db8ff501d40bbc497faeb17ba Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
-Date: Tue, 17 Dec 2019 15:09:22 -0500
-Subject: [PATCH] fix MemoryReactor import in test_runner to be from
- twisted.internet.testing
-
-Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/twisted/twisted/commit/754f21282ad2775db8ff501d40bbc497faeb17ba">https://github.com/twisted/twisted/commit/754f21282ad2775db8ff501d40bbc497faeb17ba</a>]
-
-Signed-off-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
----
- src/twisted/application/newsfragments/9746.misc    | 1 &#43;
- src/twisted/application/runner/test/test_runner.py | 2 &#43;-
- 2 files changed, 2 insertions(&#43;), 1 deletion(-)
- create mode 100644 src/twisted/application/newsfragments/9746.misc
-
-diff --git a/src/twisted/application/newsfragments/9746.misc b/src/twisted/application/newsfragments/9746.misc
-new file mode 100644
-index 000000000..8b1378917
---- /dev/null
-&#43;&#43;&#43; b/src/twisted/application/newsfragments/9746.misc
-@@ -0,0 &#43;1 @@
-&#43;
-diff --git a/src/twisted/application/runner/test/test_runner.py b/src/twisted/application/runner/test/test_runner.py
-index 9abc3449a..cce495b12 100644
---- a/src/twisted/application/runner/test/test_runner.py
-&#43;&#43;&#43; b/src/twisted/application/runner/test/test_runner.py
-@@ -15,7 &#43;15,7 @@ from twisted.logger import (
-     LogLevel, LogPublisher, LogBeginner,
-     FileLogObserver, FilteringLogObserver, LogLevelFilterPredicate,
- )
--from twisted.test.proto_helpers import MemoryReactor
-&#43;from twisted.internet.testing import MemoryReactor
- 
- from ...runner import _runner
- from .._exit import ExitStatus
--- 
-2.24.1
-
diff --git a/meta-python/recipes-devtools/python/python3-twisted_19.10.0.bb b/meta-python/recipes-devtools/python/python3-twisted_20.3.0.bb
similarity index 97%
rename from meta-python/recipes-devtools/python/python3-twisted_19.10.0.bb
rename to meta-python/recipes-devtools/python/python3-twisted_20.3.0.bb
index f2fcd30b7..697725fd7 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_19.10.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-twisted_20.3.0.bb
@@ -5,12 &#43;5,10 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.twistedmatrix.com">&quot;http://www.twistedmatrix.com&quot;</a>
 
 #twisted/topfiles/<a class="moz-txt-link-freetext" href="NEWS:655">NEWS:655</a>: - Relicensed: Now under the MIT license, rather than LGPL.
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=1743f12d8b8f5aec625c0569a058f0a6">&quot;file://LICENSE;md5=1743f12d8b8f5aec625c0569a058f0a6&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=27ac6d9597237e7e76282edd7a40cd68">&quot;file://LICENSE;md5=27ac6d9597237e7e76282edd7a40cd68&quot;</a>
 
-SRC_URI &#43;= <a class="moz-txt-link-rfc2396E" href="file://0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch">&quot;file://0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch&quot;</a>
-
-SRC_URI[sha256sum] = &quot;7394ba7f272ae722a74f3d969dcf599bc4ef093bc392038748a490f1724a515d&quot;
-SRC_URI[md5sum] = &quot;f2d70f7a66ecdf54152310164cceadfe&quot;
&#43;SRC_URI[sha256sum] = &quot;d72c55b5d56e176563b91d11952d13b01af8725c623e498db5507b6614fc1e10&quot;
&#43;SRC_URI[md5sum] = &quot;fc16d575730db7d0cddd09fc35af3eea&quot;
 
 PYPI_PACKAGE = &quot;Twisted&quot;
 PYPI_PACKAGE_EXT = &quot;tar.bz2&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------E8B6B85AAABCB9E321046F93--
