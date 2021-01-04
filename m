Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.78])
 by mx.groups.io with SMTP id smtpd.web11.15001.1609774421796211814
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jan 2021 07:33:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WLo9b5Ap;
 spf=pass (domain: windriver.com, ip: 40.107.94.78, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSOKqd4mP1G/KY/18Eok1IGSJJvAoEsfXrwoWDfNWGHntTS/Lv8UzYMzrmFHQa6Xbgw1Jy/FuW2zMDYWgabS+im6UXdpP/kimWT9ESKJ8wI438LvNviRq/LhwT0rS4XWfb+E5IRTuASlhyllH/B2ZTOOxZH4zEnetHuFimDthqkmTk+q0m4FRsxWUAlCBpUOtNphNVXSBGW99DrNswVEtnwHqrHsExxhqrX7dfQ/Nc5jzLBgK1XoCZL1KPsAzLywGSHubWj7tKxffGolfINZWG+3lvbVvNkUYofnabR45vMmfhppQgUu9kB5FEVZ0VCzp5R46svGLncf6AxhRx4Xdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCQeuSGE6ZYZv/I3QR+OjBx3pqjxPjuByvwUMDJSqpQ=;
 b=OYCpTK9wfNupSDSMGrzWBsuVah+rsZXdnFgGewpSE/7xlFuPAR+nR8jIb8l0sPqna/c7IN3EM1Rm35bomRmprtKaoDt4Jt+8WNHrAp8Bz3haU1F3V0xsd9+DUKaue6OGUUFvPbCJv9oW1eQ4micoABT44zvEvLSGtdiCLIoAfi3wvk8wDoBbthxP6wI1EJDkwqPmYpYHs2hsx34rwGA6dkm6mWWHeBs9KTNFxRbVZjDTcXeUrLLSD2NVfzXH7HgJWUtKQcf9hR3yS5R8gbJBKwaX8P7qoVyLWIu4bV/xMLX7cBOLT6dpmhjWjJsDbxiO7apzKYPAw/IxbQ7LMuxScQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCQeuSGE6ZYZv/I3QR+OjBx3pqjxPjuByvwUMDJSqpQ=;
 b=WLo9b5ApoWPGAaRgqoq1w5rOYkGUtd4HVeRy3xYh4mh67eIAdQWKcFCgtMyQxB5uLaVjkmGdV2o3Lk9KADhp+Ssoe3ogEt9lX9thJfOnhnrbLQsaYe0EoVeKnM8iixsdGFJahyEW+ekOnoQwPh49N8A0zitFwkkBWmm5kcunTxg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5053.namprd11.prod.outlook.com (2603:10b6:a03:2af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Mon, 4 Jan
 2021 15:33:41 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 15:33:41 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-astor: switch to python3
To: "Yu, Mingli" <mingli.yu@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20201223024725.32317-1-mingli.yu@windriver.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <bb5549b8-7341-e985-1ddd-9c58d9ee2760@windriver.com>
Date: Mon, 4 Jan 2021 10:33:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201223024725.32317-1-mingli.yu@windriver.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0332.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::7) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0332.namprd13.prod.outlook.com (2603:10b6:208:2c6::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.4 via Frontend Transport; Mon, 4 Jan 2021 15:33:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff8c36ce-3956-41cf-8318-08d8b0c61d17
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5053:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5053F4FCFBEE6573D08F8CF39FD20@SJ0PR11MB5053.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hyn2XcI/ODRYFoVuN87Zrlvw65KfjvUkJ5Di7CbP++YPQJplz5Rf6FVdSxHj8szaxbEIRhugnnM+8wa2qdc9ZMDhcqvW2G1R7AoN9RyLynZUPyemyliXFIBSPnhUutFUFa83Icq5s5qD10OGcDrE9fMsTKQtg7YcahESokRkd7tLvwGpA77ZlOepAnPS5c1pSZiJ+9P8Tac4o4cTY26l5tP7UKokISj7pI27JxeQW9uLW783S/fRtzIzc0hAM3/Eb34XDWD249IZPZWoHwZqL6Z/SNhNlDdNLjgxEXps+nDeQxMdMIMQvQVXkBYxvxeF8gHlvhYvz72wu7IFg4EoZuBNTtEEUu2d6VWhBnWFyNwnSX2ms2BsiPfhphRHZ0QglZ3N8ukW2nB7qeqTzGW3KalVXgQQdnVtnYccvl2xp27P+IYSaxt+Q76ocfJnkQgBGXNUy+Myn1dzCIGSZLhh4vXPdx4X3ezEtgWN/M0ImW88AED92LQfYhJqxgUNx7LwHgtqk/bUf29QfPM9TBRkCzsuTD1PAd6vZzEmTHsKfeAC3yQjNBkL/hIb48OCDuGS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(346002)(136003)(376002)(396003)(66556008)(52116002)(2616005)(478600001)(53546011)(166002)(66946007)(36756003)(966005)(66476007)(26005)(31696002)(6486002)(4001150100001)(16526019)(2906002)(956004)(186003)(5660300002)(86362001)(8676002)(33964004)(83380400001)(44832011)(16576012)(8936002)(31686004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ay9MUGNLciswQjYvMzJ0WWxJSTdYNzJGcmJRdFlXZWVnWjVaV3c3MXpJZ2RP?=
 =?utf-8?B?OUltd2FuSkM1VlB2dmVJcFN6NFpBWEUxVGExSUV3TlNSRlFJanUvcC9DQ3pk?=
 =?utf-8?B?T0drTUVhQkVQUEU3OFpTclkwTU9PcjBUOXZGalluZHYzMXpTTkFidzVPZE5G?=
 =?utf-8?B?c2VjSW50NkU5dUZTaGN2WS81b25vTEhZT0tHdXhINlI3VGd0SFBOZ2MyU0Ey?=
 =?utf-8?B?SzJoTmh5VmlTVjlubVcwVVptKzdNdGtWMklKYjhoN2hSM1N3aUlHWkZ2eS9i?=
 =?utf-8?B?TXN5M04wOXNzbWdGeFcwQjRRUzVFc1lqYTE1NWNnTjhQajRhVHB0VXM1SlRT?=
 =?utf-8?B?dEVVOG1WYUJzSTNORVpQRUtlQStZampaMVBZUTdTQVJhOTkrT0szRjJPTWtr?=
 =?utf-8?B?OHpXdFFScThwS2ZwK1AzWnIzSk5zWHFTL213ZWJKQjRlNGZjd0kzRzdrTXNm?=
 =?utf-8?B?Yzd5a25IUyt5ZTRwd05xUTA4ajVwQXhUeTI1K0Q0WFVhekM3QWFVWUZwZGRp?=
 =?utf-8?B?SGxaSWZpN3VpQmxTY21yTDVWUmdibTNkZWJjY2kzVmsxc0JiTnhNaHRENGIv?=
 =?utf-8?B?aVJDakt6TS9NYS9PL3hZSEJ5dlFDc2FPZDdKSFlQRWpCTm1zNVFCL0hWZklX?=
 =?utf-8?B?RTQxQzFaOTV1NFhFNnFlVjZFRXV0K2Rnc2M4bFcvQ1E5QWdabzJIYjBnc2cy?=
 =?utf-8?B?emFPd0p4S0dqTTYxbjA0NjdSRUpMYVBpRUlranVFUEJNZFVoQkhheXBaQXJS?=
 =?utf-8?B?RUpLeFhkdnI1a1FyaEx2ZGorOXphb3hvSmxsRnRKWUoxckhhWkgzcTl3VXJl?=
 =?utf-8?B?OGtTV2o0N0RLZ1ppN0RsLzdVTjlsZkZNdjhkOEJnb2VZeG1ET0dLb09DQ3k4?=
 =?utf-8?B?eUR2YVdZWTYxWlJJQ1ErY2ErOW9qMFBnUnVzVkNheHhpSGp2eXZDOVZLb1c2?=
 =?utf-8?B?REFwVHcyY2hWSUNIUENXOHdLeTB6U1NsdFdEWVJFVDVKbkh0dzBTWjIydTF4?=
 =?utf-8?B?SmdZcU1iNTFTYStvWWtxMFQ2T3d4LzBua3VCek5MdXRpMVU4YitsQTV1U3Ax?=
 =?utf-8?B?TGcyL1JTdDlkeTVwVkJ2Q2Q5SlJPTnNNTkF3THdIakQ3MDlDQnlYZmR3bnIz?=
 =?utf-8?B?ZVlibmJhOGRYaVdkNDhPaHNrdVNiWDNBOG9RckVRYU90cUZPM0hYclAwZHhj?=
 =?utf-8?B?dzd6NjhOeWwyVU9YWjZzamNCMm8wVS9GSXJhTk1rK0FuOWpXcUVPWTNGR1Zp?=
 =?utf-8?B?dlpjejU2TzUzWnZMdHBJNldSby9tU0oyOTVta1FnMWZhMDhMVy96cWNNbTZj?=
 =?utf-8?Q?SlfUwlyce/Bcr4mwMwzf264idTliISb++O?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 15:33:40.9849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8c36ce-3956-41cf-8318-08d8b0c61d17
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LoZ3/s3J/HocqPFQTTpYGikUb9jvlPxa1MJqsUB3wckpahjbotX5j7znmlE4/o/UL8dqZ3uTPZ8Hh1VoaB6bklyTfDfPthmBMDBdcYSLcMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5053
Content-Type: multipart/alternative;
 boundary="------------0CB817A460D865C1303FB8A7"
Content-Language: en-US

--------------0CB817A460D865C1303FB8A7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-12-22 9:47 p.m., Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>
> As python2 reached end of life(EOL), so convert rtrip.py to python3.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../0001-rtrip.py-convert-to-python3.patch    | 36 +++++++++++++++++++
>   .../python/python3-astor_0.8.1.bb             |  4 ++-
>   2 files changed, 39 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-astor/0001-rtrip.py-convert-to-python3.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-astor/0001-rtrip.py-convert-to-python3.patch b/meta-python/recipes-devtools/python/python3-astor/0001-rtrip.py-convert-to-python3.patch
> new file mode 100644
> index 000000000..009951864
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-astor/0001-rtrip.py-convert-to-python3.patch
> @@ -0,0 +1,36 @@
> +From 1a477968593a14ee9c8597c1ed4e8b61a7731e15 Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Wed, 23 Dec 2020 02:23:13 +0000
> +Subject: [PATCH] rtrip.py: convert to python3
> +
> +As Python 2 reached end of life (EOL), so convert rtrip.py to python3.
> +
> +Upstream-Status: Submitted [https://github.com/berkerpeksag/astor/pull/192]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + astor/rtrip.py | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/astor/rtrip.py b/astor/rtrip.py
> +index 8b108e7..e2e30a6 100755
> +--- a/astor/rtrip.py
> ++++ b/astor/rtrip.py
> +@@ -1,4 +1,4 @@
> +-#! /usr/bin/env python
> ++#! /usr/bin/env python3
> + # -*- coding: utf-8 -*-
> + """
> + Part of the astor library for Python AST manipulation.
> +@@ -160,7 +160,7 @@ def usage(msg):
> +
> +         Usage:
> +
> +-            python -m astor.rtrip [readonly] [<source>]
> ++            python3 -m astor.rtrip [readonly] [<source>]
> +
> +
> +         This utility tests round-tripping of Python source to AST
> +--
> +2.26.2
> +
> diff --git a/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb b/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
> index 125a0236e..5048e5bec 100644
> --- a/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
> @@ -4,7 +4,9 @@ SECTION = "devel/python"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=561205fdabc3ec52cae2d30815b8ade7"
>   
> -SRC_URI = "git://github.com/berkerpeksag/astor.git "
> +SRC_URI = "git://github.com/berkerpeksag/astor.git \
> +           file://0001-rtrip.py-convert-to-python3.patch \
> +"
>   SRCREV ?= "c7553c79f9222e20783fe9bd8a553f932e918072"
>   
>   inherit setuptools3
>
> 
>

--------------0CB817A460D865C1303FB8A7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-12-22 9:47 p.m., Yu, Mingli
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201223024725.32317-1-mingli.yu@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>

As python2 reached end of life(EOL), so convert rtrip.py to python3.

Signed-off-by: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201223024725.32317-1-mingli.yu@windriver.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../0001-rtrip.py-convert-to-python3.patch    | 36 +++++++++++++++++++
 .../python/python3-astor_0.8.1.bb             |  4 ++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-astor/0001-rtrip.py-convert-to-python3.patch

diff --git a/meta-python/recipes-devtools/python/python3-astor/0001-rtrip.py-convert-to-python3.patch b/meta-python/recipes-devtools/python/python3-astor/0001-rtrip.py-convert-to-python3.patch
new file mode 100644
index 000000000..009951864
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-astor/0001-rtrip.py-convert-to-python3.patch
@@ -0,0 +1,36 @@
+From 1a477968593a14ee9c8597c1ed4e8b61a7731e15 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
+Date: Wed, 23 Dec 2020 02:23:13 +0000
+Subject: [PATCH] rtrip.py: convert to python3
+
+As Python 2 reached end of life (EOL), so convert rtrip.py to python3.
+
+Upstream-Status: Submitted [<a class="moz-txt-link-freetext" href="https://github.com/berkerpeksag/astor/pull/192">https://github.com/berkerpeksag/astor/pull/192</a>]
+
+Signed-off-by: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
+---
+ astor/rtrip.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/astor/rtrip.py b/astor/rtrip.py
+index 8b108e7..e2e30a6 100755
+--- a/astor/rtrip.py
++++ b/astor/rtrip.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ # -*- coding: utf-8 -*-
+ &quot;&quot;&quot;
+ Part of the astor library for Python AST manipulation.
+@@ -160,7 +160,7 @@ def usage(msg):
+ 
+         Usage:
+ 
+-            python -m astor.rtrip [readonly] [&lt;source&gt;]
++            python3 -m astor.rtrip [readonly] [&lt;source&gt;]
+ 
+ 
+         This utility tests round-tripping of Python source to AST
+-- 
+2.26.2
+
diff --git a/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb b/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
index 125a0236e..5048e5bec 100644
--- a/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
@@ -4,7 +4,9 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=561205fdabc3ec52cae2d30815b8ade7">&quot;file://LICENSE;md5=561205fdabc3ec52cae2d30815b8ade7&quot;</a>
 
-SRC_URI = &quot;git://github.com/berkerpeksag/astor.git &quot;
+SRC_URI = &quot;git://github.com/berkerpeksag/astor.git \
+           <a class="moz-txt-link-freetext" href="file://0001-rtrip.py-convert-to-python3.patch">file://0001-rtrip.py-convert-to-python3.patch</a> \
+&quot;
 SRCREV ?= &quot;c7553c79f9222e20783fe9bd8a553f932e918072&quot;
 
 inherit setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------0CB817A460D865C1303FB8A7--
