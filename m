Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.53])
 by mx.groups.io with SMTP id smtpd.web11.21284.1602868664190650611
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2020 10:17:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Xu3bVSyv;
 spf=pass (domain: windriver.com, ip: 40.107.94.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QG9zMX8+/uU0caccR/soHbgl3eY2MYaSYjxNm88hHAm6LDtFHBuxqgfuJdurv7keMMZS3mUMHXUJgxa1X19HwFB5anFjB8tH2PGZvnqYPn0QIdpjfKyXOWqDpEbqjWYDS+T0J4OMr/Z0HP47LnYT0ZmLX42Bt2tPwk8nzP72CPyE20BLKKA9R89IYL7+59LzTvOkN4MASjAgs8kpdVRw5HklH2zJYyfAjEtaraq/arRn8plTXEHBx9XcULdS9MAbDiWO7535EBH2WY6YIdZGgZjWKBNJnHBF3C7lF3pI/XReoO9NYxd7Wv2W3pHdywUn9yG3cPJ0gALOFm8kNTntOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+DV9Cxyha1wEmTr18yTKLKR/ha2IANgt80kpmb884s=;
 b=hzoOGpm/Cv44GxuFqtJetmDKDJpYmEIYX5jSmxM1iqr50lUplF3aInNJSeOqMf9TrXJWXsQpxaxgUGiinDoMUyigeOlkky6+08/pILE/uskBJR5KvCJ1rXlnJ07HHC8kttaWaurAS9Oj5h7e6MXZQUkPrLzJM03u7I0whgUTP0YD20rvuIT6Z5yuFHllUkPT6snUebXws79fhx90oDKYE2B6EEWvXg0VB7b5dCsrn4kc7On3MYPxoWtHsS6AXDZhAN85u0TSlZFCGhvOHIOSwit45jLGvNjdTJ11uL4RmNtI1RhutkhWp7xtE28DVm0RL+P7uAARD+DvdjVjun3RGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+DV9Cxyha1wEmTr18yTKLKR/ha2IANgt80kpmb884s=;
 b=Xu3bVSyvxlukV9ogDcb1FChlZzAKMebMIlHOCZu4+5uhMqISzqRBT1P9maMRWIzg10Wv02GqcuroEz5G1ZBUUMZeVbhkp9dAvuJfjm2ZmUgandMZ/5tx8xEM4tCkpvu8M6sEh2Hr56wwi1Li0PUDgsKi0CebC4PiuGpJ+Ij/rcg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4226.namprd11.prod.outlook.com (2603:10b6:a03:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Fri, 16 Oct
 2020 17:17:42 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.025; Fri, 16 Oct 2020
 17:17:42 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-sqlparse: Upgrade 0.3.1 -> 0.4.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201013114654.5610-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8eae0aef-4f2e-6ee9-5af4-db4673ace011@windriver.com>
Date: Fri, 16 Oct 2020 13:17:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201013114654.5610-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY5PR17CA0061.namprd17.prod.outlook.com
 (2603:10b6:a03:167::38) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY5PR17CA0061.namprd17.prod.outlook.com (2603:10b6:a03:167::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.23 via Frontend Transport; Fri, 16 Oct 2020 17:17:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a1d3a95-eca3-4a22-cca6-08d871f763b8
X-MS-TrafficTypeDiagnostic: BY5PR11MB4226:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4226AD49010889798236AE9B9F030@BY5PR11MB4226.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IKUs7/hP+RA06EYpoVeY/xjGXLC7RIuoB8JTrJdgMx0K7tV4ATojFriM6zzWhdZVDk0dy2xb9/py1xnCefo86zVn4KTT5KXtnU2W4y4C7C7E4CYu24Kc3EsQ5+pkrclR0ehWFtTtHnQQBkgvDVztVVtsAB3FLmFRVHXvvWjULtFFwe8dwWjmFNtFzu92TWO5PI3k9K2VT8TFFQ/rUyuS2blmv+avyTRYB00ppt3zbSJpRHeegww/4pczbN2+wisne8MN6z/wTmC6R8k2L+iNngltgWJVy02iuz5+pN01zlnPMZWP7gj8KGUHMRoNCq7Q1LNAsKoP/c0t9nLaBcQf1kpd+B+ITYvHIP/C9qmBFBVB3OJ/Gccv1bu86msX1uEAhyF7Sk0FR4xq4eofKsslBtbdXBI66aUI5rU8+mOKOQBiBXjPoEu/1F7YgOvxJLqg6/y/B+x1i+CWa/elpWgiDZGcWPVr0bjwS9IPqbjDNdo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(366004)(346002)(39850400004)(16576012)(66946007)(86362001)(31686004)(478600001)(2906002)(44832011)(966005)(66476007)(33964004)(6486002)(316002)(31696002)(66556008)(34490700002)(83380400001)(166002)(36756003)(16526019)(2616005)(956004)(5660300002)(30864003)(52116002)(8676002)(8936002)(26005)(53546011)(186003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	hYIQ9PbiBAwNTHE++meG23zO1/L1GWU2af2idP+H8JnIh63wWzLdrGXtBOUmXLDRVOnfFj/F5fl4mXVW5WeVvrniIFTj3ORqO/FyR1CVRnECbW8NVEdf6GDvvKJE79tuN1AdOhq3JIeBwIN/+tEYoLIKBWMCWC3f3eGwODP0nND16IIvld/yCkWpIKCH1obrluXbRjLxIKeTGNYHF6cRH6shUdWrpizbr75xh1sfL8/XzOM3NggexOjuw7HB2iJdS7pPIyU7RwwZF+0KrsOylNMxIhmyOEF/5VLTjUeZVRIKSrsvSrOAmanudXMWvluGHWJ6mhL+4Ly3YbTWMIeoVPnESFqCXQmhIZNjLaf93aCAVc9yDQbMvXkzGtIlBQ6uN5sP/LBTXtRCnvSVFyJPrlh9gFSq2U1OEzq1vpSvuSVLwtyhcSu3/4RJ6sTwwK0siD7t754ktPYE0L/hUTt/aic+l13xzHwpJTzwBlclz257t5MzRS5ohskBVaIhaPE9o4CfsH+xH2bpyfnY25BcBnyhPVuKf2/N4HXt0Lx9lp6S8SJdgqNRLoNUZePCTVKhwSe6KZ6tWopTYZ4Kpi7KDPF7K0laSSgahK7qzYy0cDc/mJ1opvqnuG2TgOM1u81RxXqPqRdXK+hYzRwK1ghh9Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a1d3a95-eca3-4a22-cca6-08d871f763b8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2020 17:17:42.0239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTIfiCw33BDMTENZDRjrg+HIswljSlmHy7YiKZh2IpV9B+kY0ryFUngY3MGVjqgnPaJN4c8zOTThnYXsOyHA4WvKEoFZ9FNVFkB0nbgi+II=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4226
Content-Type: multipart/alternative;
 boundary="------------553F15D5FC3C674A8E0EEC60"
Content-Language: en-US

--------------553F15D5FC3C674A8E0EEC60
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/13/20 7:46 AM, Leon Anavi wrote:
> - Just removed a debug print statement
> - Remove support for end-of-life Python 2.7 and 3.4. Python 3.5+
>    is now required.
> - Remaining strings that only consist of whitespaces are not
>    treated as statements anymore. Code that ignored the last
>    element from sqlparse.split() should be updated accordingly
>    since that function now doesn't return an empty string as the
>    last element in some cases.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...1-sqlparse-change-shebang-to-python3.patch | 90 +++++++++++++++----
>   ...rse_0.3.1.bb => python3-sqlparse_0.4.1.bb} |  4 +-
>   2 files changed, 77 insertions(+), 17 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sqlparse_0.3.1.bb => python3-sqlparse_0.4.1.bb} (81%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sqlparse/0001-sqlparse-change-shebang-to-python3.patch b/meta-python/recipes-devtools/python/python3-sqlparse/0001-sqlparse-change-shebang-to-python3.patch
> index ad6c50ff77..94121340d5 100644
> --- a/meta-python/recipes-devtools/python/python3-sqlparse/0001-sqlparse-change-shebang-to-python3.patch
> +++ b/meta-python/recipes-devtools/python/python3-sqlparse/0001-sqlparse-change-shebang-to-python3.patch
> @@ -1,4 +1,4 @@
> -From 10c9d3341d64d697f678a64ae707f6bda21565bb Mon Sep 17 00:00:00 2001
> +From 7fd00ab8c1b663052d57e735b6b956d5c92fbaed Mon Sep 17 00:00:00 2001
>   From: Changqing Li <changqing.li@windriver.com>
>   Date: Mon, 9 Mar 2020 13:10:37 +0800
>   Subject: [PATCH] sqlparse: change shebang to python3
> @@ -10,42 +10,102 @@ we can only make this change after python2 is offcially
>   dropped.
>   
>   Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>   ---
> - setup.py             | 2 +-
> - sqlparse/__main__.py | 2 +-
> - sqlparse/cli.py      | 2 +-
> - 3 files changed, 3 insertions(+), 3 deletions(-)
> + 0001-sqlparse-change-shebang-to-python3.patch | 51 +++++++++++++++++++
> + setup.py                                      |  2 +-
> + sqlparse/__main__.py                          |  2 +-
> + sqlparse/cli.py                               |  2 +-
> + 4 files changed, 54 insertions(+), 3 deletions(-)
> + create mode 100644 0001-sqlparse-change-shebang-to-python3.patch
>   
> +diff --git a/0001-sqlparse-change-shebang-to-python3.patch b/0001-sqlparse-change-shebang-to-python3.patch
> +new file mode 100644
> +index 0000000..ad6c50f
> +--- /dev/null
> ++++ b/0001-sqlparse-change-shebang-to-python3.patch
> +@@ -0,0 +1,51 @@
> ++From 10c9d3341d64d697f678a64ae707f6bda21565bb Mon Sep 17 00:00:00 2001
> ++From: Changqing Li <changqing.li@windriver.com>
> ++Date: Mon, 9 Mar 2020 13:10:37 +0800
> ++Subject: [PATCH] sqlparse: change shebang to python3
> ++
> ++Upstream-Status: Pending
> ++
> ++Don't send upstream since upstream still support python2,
> ++we can only make this change after python2 is offcially
> ++dropped.
> ++
> ++Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ++---
> ++ setup.py             | 2 +-
> ++ sqlparse/__main__.py | 2 +-
> ++ sqlparse/cli.py      | 2 +-
> ++ 3 files changed, 3 insertions(+), 3 deletions(-)
> ++
> ++diff --git a/setup.py b/setup.py
> ++index 345d0ce..ce3abc3 100644
> ++--- a/setup.py
> +++++ b/setup.py
> ++@@ -1,4 +1,4 @@
> ++-#!/usr/bin/env python
> +++#!/usr/bin/env python3
> ++ # -*- coding: utf-8 -*-
> ++ #
> ++ # Copyright (C) 2009-2018 the sqlparse authors and contributors
> ++diff --git a/sqlparse/__main__.py b/sqlparse/__main__.py
> ++index 867d75d..dd0c074 100644
> ++--- a/sqlparse/__main__.py
> +++++ b/sqlparse/__main__.py
> ++@@ -1,4 +1,4 @@
> ++-#!/usr/bin/env python
> +++#!/usr/bin/env python3
> ++ # -*- coding: utf-8 -*-
> ++ #
> ++ # Copyright (C) 2009-2018 the sqlparse authors and contributors
> ++diff --git a/sqlparse/cli.py b/sqlparse/cli.py
> ++index 25555a5..8bf050a 100755
> ++--- a/sqlparse/cli.py
> +++++ b/sqlparse/cli.py
> ++@@ -1,4 +1,4 @@
> ++-#!/usr/bin/env python
> +++#!/usr/bin/env python3
> ++ # -*- coding: utf-8 -*-
> ++ #
> ++ # Copyright (C) 2009-2018 the sqlparse authors and contributors
> ++--
> ++2.7.4
> ++
>   diff --git a/setup.py b/setup.py
> -index 345d0ce..ce3abc3 100644
> +index ede0aff..dc6a323 100644
>   --- a/setup.py
>   +++ b/setup.py
>   @@ -1,4 +1,4 @@
>   -#!/usr/bin/env python
>   +#!/usr/bin/env python3
> - # -*- coding: utf-8 -*-
>    #
> - # Copyright (C) 2009-2018 the sqlparse authors and contributors
> + # Copyright (C) 2009-2020 the sqlparse authors and contributors
> + # <see AUTHORS file>
>   diff --git a/sqlparse/__main__.py b/sqlparse/__main__.py
> -index 867d75d..dd0c074 100644
> +index 2bf2513..6a3a115 100644
>   --- a/sqlparse/__main__.py
>   +++ b/sqlparse/__main__.py
>   @@ -1,4 +1,4 @@
>   -#!/usr/bin/env python
>   +#!/usr/bin/env python3
> - # -*- coding: utf-8 -*-
>    #
> - # Copyright (C) 2009-2018 the sqlparse authors and contributors
> + # Copyright (C) 2009-2020 the sqlparse authors and contributors
> + # <see AUTHORS file>
>   diff --git a/sqlparse/cli.py b/sqlparse/cli.py
> -index 25555a5..8bf050a 100755
> +index 7a8aacb..9c727e8 100755
>   --- a/sqlparse/cli.py
>   +++ b/sqlparse/cli.py
>   @@ -1,4 +1,4 @@
>   -#!/usr/bin/env python
>   +#!/usr/bin/env python3
> - # -*- coding: utf-8 -*-
>    #
> - # Copyright (C) 2009-2018 the sqlparse authors and contributors
> + # Copyright (C) 2009-2020 the sqlparse authors and contributors
> + # <see AUTHORS file>
>   --
> -2.7.4
> +2.17.1
>   
> diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.3.1.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.4.1.bb
> similarity index 81%
> rename from meta-python/recipes-devtools/python/python3-sqlparse_0.3.1.bb
> rename to meta-python/recipes-devtools/python/python3-sqlparse_0.4.1.bb
> index 1aef28be03..c8a64c1095 100644
> --- a/meta-python/recipes-devtools/python/python3-sqlparse_0.3.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.4.1.bb
> @@ -8,8 +8,8 @@ SRC_URI += "file://0001-sqlparse-change-shebang-to-python3.patch \
>               file://run-ptest \
>   	    "
>   
> -SRC_URI[md5sum] = "423047887a3590b04dd18f8caf843a2f"
> -SRC_URI[sha256sum] = "e162203737712307dfe78860cc56c8da8a852ab2ee33750e33aeadf38d12c548"
> +SRC_URI[md5sum] = "eebbc6b5f1033054873033e54b0c1266"
> +SRC_URI[sha256sum] = "0f91fd2e829c44362cbcfab3e9ae12e22badaa8a29ad5ff599f9ec109f0454e8"
>   
>   export BUILD_SYS
>   export HOST_SYS
>
> 
>

--------------553F15D5FC3C674A8E0EEC60
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/13/20 7:46 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201013114654.5610-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Just removed a debug print statement
- Remove support for end-of-life Python 2.7 and 3.4. Python 3.5+
  is now required.
- Remaining strings that only consist of whitespaces are not
  treated as statements anymore. Code that ignored the last
  element from sqlparse.split() should be updated accordingly
  since that function now doesn't return an empty string as the
  last element in some cases.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201013114654.5610-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...1-sqlparse-change-shebang-to-python3.patch | 90 +++++++++++++++----
 ...rse_0.3.1.bb =&gt; python3-sqlparse_0.4.1.bb} |  4 +-
 2 files changed, 77 insertions(+), 17 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sqlparse_0.3.1.bb =&gt; python3-sqlparse_0.4.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse/0001-sqlparse-change-shebang-to-python3.patch b/meta-python/recipes-devtools/python/python3-sqlparse/0001-sqlparse-change-shebang-to-python3.patch
index ad6c50ff77..94121340d5 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse/0001-sqlparse-change-shebang-to-python3.patch
+++ b/meta-python/recipes-devtools/python/python3-sqlparse/0001-sqlparse-change-shebang-to-python3.patch
@@ -1,4 +1,4 @@
-From 10c9d3341d64d697f678a64ae707f6bda21565bb Mon Sep 17 00:00:00 2001
+From 7fd00ab8c1b663052d57e735b6b956d5c92fbaed Mon Sep 17 00:00:00 2001
 From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
 Date: Mon, 9 Mar 2020 13:10:37 +0800
 Subject: [PATCH] sqlparse: change shebang to python3
@@ -10,42 +10,102 @@ we can only make this change after python2 is offcially
 dropped.
 
 Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
 ---
- setup.py             | 2 +-
- sqlparse/__main__.py | 2 +-
- sqlparse/cli.py      | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
+ 0001-sqlparse-change-shebang-to-python3.patch | 51 +++++++++++++++++++
+ setup.py                                      |  2 +-
+ sqlparse/__main__.py                          |  2 +-
+ sqlparse/cli.py                               |  2 +-
+ 4 files changed, 54 insertions(+), 3 deletions(-)
+ create mode 100644 0001-sqlparse-change-shebang-to-python3.patch
 
+diff --git a/0001-sqlparse-change-shebang-to-python3.patch b/0001-sqlparse-change-shebang-to-python3.patch
+new file mode 100644
+index 0000000..ad6c50f
+--- /dev/null
++++ b/0001-sqlparse-change-shebang-to-python3.patch
+@@ -0,0 +1,51 @@
++From 10c9d3341d64d697f678a64ae707f6bda21565bb Mon Sep 17 00:00:00 2001
++From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
++Date: Mon, 9 Mar 2020 13:10:37 +0800
++Subject: [PATCH] sqlparse: change shebang to python3
++
++Upstream-Status: Pending
++
++Don't send upstream since upstream still support python2,
++we can only make this change after python2 is offcially
++dropped.
++
++Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
++---
++ setup.py             | 2 +-
++ sqlparse/__main__.py | 2 +-
++ sqlparse/cli.py      | 2 +-
++ 3 files changed, 3 insertions(+), 3 deletions(-)
++
++diff --git a/setup.py b/setup.py
++index 345d0ce..ce3abc3 100644
++--- a/setup.py
+++++ b/setup.py
++@@ -1,4 +1,4 @@
++-#!/usr/bin/env python
+++#!/usr/bin/env python3
++ # -*- coding: utf-8 -*-
++ #
++ # Copyright (C) 2009-2018 the sqlparse authors and contributors
++diff --git a/sqlparse/__main__.py b/sqlparse/__main__.py
++index 867d75d..dd0c074 100644
++--- a/sqlparse/__main__.py
+++++ b/sqlparse/__main__.py
++@@ -1,4 +1,4 @@
++-#!/usr/bin/env python
+++#!/usr/bin/env python3
++ # -*- coding: utf-8 -*-
++ #
++ # Copyright (C) 2009-2018 the sqlparse authors and contributors
++diff --git a/sqlparse/cli.py b/sqlparse/cli.py
++index 25555a5..8bf050a 100755
++--- a/sqlparse/cli.py
+++++ b/sqlparse/cli.py
++@@ -1,4 +1,4 @@
++-#!/usr/bin/env python
+++#!/usr/bin/env python3
++ # -*- coding: utf-8 -*-
++ #
++ # Copyright (C) 2009-2018 the sqlparse authors and contributors
++-- 
++2.7.4
++
 diff --git a/setup.py b/setup.py
-index 345d0ce..ce3abc3 100644
+index ede0aff..dc6a323 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- # -*- coding: utf-8 -*-
  #
- # Copyright (C) 2009-2018 the sqlparse authors and contributors
+ # Copyright (C) 2009-2020 the sqlparse authors and contributors
+ # &lt;see AUTHORS file&gt;
 diff --git a/sqlparse/__main__.py b/sqlparse/__main__.py
-index 867d75d..dd0c074 100644
+index 2bf2513..6a3a115 100644
 --- a/sqlparse/__main__.py
 +++ b/sqlparse/__main__.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- # -*- coding: utf-8 -*-
  #
- # Copyright (C) 2009-2018 the sqlparse authors and contributors
+ # Copyright (C) 2009-2020 the sqlparse authors and contributors
+ # &lt;see AUTHORS file&gt;
 diff --git a/sqlparse/cli.py b/sqlparse/cli.py
-index 25555a5..8bf050a 100755
+index 7a8aacb..9c727e8 100755
 --- a/sqlparse/cli.py
 +++ b/sqlparse/cli.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- # -*- coding: utf-8 -*-
  #
- # Copyright (C) 2009-2018 the sqlparse authors and contributors
+ # Copyright (C) 2009-2020 the sqlparse authors and contributors
+ # &lt;see AUTHORS file&gt;
 -- 
-2.7.4
+2.17.1
 
diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.3.1.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.4.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-sqlparse_0.3.1.bb
rename to meta-python/recipes-devtools/python/python3-sqlparse_0.4.1.bb
index 1aef28be03..c8a64c1095 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.4.1.bb
@@ -8,8 +8,8 @@ SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://0001-sqlparse-change-shebang-to-python3.patch\file://run-ptest\">&quot;file://0001-sqlparse-change-shebang-to-python3.patch \
             file://run-ptest \
 	    &quot;</a>
 
-SRC_URI[md5sum] = &quot;423047887a3590b04dd18f8caf843a2f&quot;
-SRC_URI[sha256sum] = &quot;e162203737712307dfe78860cc56c8da8a852ab2ee33750e33aeadf38d12c548&quot;
+SRC_URI[md5sum] = &quot;eebbc6b5f1033054873033e54b0c1266&quot;
+SRC_URI[sha256sum] = &quot;0f91fd2e829c44362cbcfab3e9ae12e22badaa8a29ad5ff599f9ec109f0454e8&quot;
 
 export BUILD_SYS
 export HOST_SYS
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------553F15D5FC3C674A8E0EEC60--
