Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.77])
 by mx.groups.io with SMTP id smtpd.web11.172.1591377979759065641
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jun 2020 10:26:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=A57HiebH;
 spf=pass (domain: windriver.com, ip: 40.107.220.77, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+HpRYEE9KrfmlQE0Kxez3vnBQIF8TB6RZQXrSHnW4rFBYS3oJqX9OmdrM0zTxkbeuxC4I454s3Bz/XC2lkXYPA87mOKeJSYzw3PLnkJFIEoFLnXi4zjLWk+J/P/t70DOGyo9ER3rPyzvbTpoGIIV7VieScYcfuTfP4h6QbyPcxbuziMARvGfg6iKOmfQOWxzK6gSdnSSb8I40iiV88FY8aW8QNffGqZlhD0/RtL5Gs0CWzyJJVgsZedMLJ61ThaDCffl8+A8IMjPZssqxS+LkksnP5DGymIrYcM/+6dbmcv0jIF/hzVSpnR3YcKrXa7YP9vmaQbKnpqiz2ZE1wxtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4Kxzz2FVeYX+KUCFxvTZh4mb5+J2IR9JQDktLTeSZU=;
 b=biaMnKmGrkWjN1VBtXjxXhi2mhoqX8DOpFQrbcySwK8PLgZaQA7WQ762V+d34QstGfC1/g3lXkJO2AOBAELhM3G+nm4cVdS/sO8V/Yvt+cbyRcuIMpzko3KqjlsvGddkcrPh6MZqwUhghdalIQsOCol6oTA3DukA/y6YweGrBkdWXnph3WRzBQEpPr6jCstWQ0/VwWGg4NJ/qWw0yvgozDK5G4n+eX/Dauk9Q/IJ4tQM+ZDhh0uTtrFzH2kUdjaCZYzqMcRLK8plqVMn238LFARK7z2OrX0xyJn1ryEDlwjUYojv+ogkDypf4eqUoT6KFVCDfny5Q9wk70KCGQgj/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4Kxzz2FVeYX+KUCFxvTZh4mb5+J2IR9JQDktLTeSZU=;
 b=A57HiebHLl9+zr9JzIld9RmZqs9FdGJgEhQQZB2AMeGYp5PRDDP+I0HawIlEgdejlnUGPP2doR4vl+gpqhmEKpJxazmdUvuyjT9v0jyTIql0VZ7P+B+vf+Zz/l4J7D2oTMmqjqS4prz2qakLuP+itHmto/ZH3nswOgaUJnv2+BQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1874.namprd11.prod.outlook.com (2603:10b6:404:107::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.19; Fri, 5 Jun
 2020 17:26:18 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3066.019; Fri, 5 Jun 2020
 17:26:18 +0000
Subject: Re: [oe] [meta-python][PATCH 3/6] python3-future: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200604121223.3818-1-leon.anavi@konsulko.com>
 <20200604121223.3818-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0cf72bf8-611a-6de2-3e29-987ed3cd7b50@windriver.com>
Date: Fri, 5 Jun 2020 13:26:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200604121223.3818-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::24) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0011.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Fri, 5 Jun 2020 17:26:17 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7d4d802-8f80-47be-f7aa-08d809758ea5
X-MS-TrafficTypeDiagnostic: BN6PR11MB1874:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1874278C35A199DDABE57E6D9F860@BN6PR11MB1874.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-Forefront-PRVS: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UhjbdnJ5MDLCwP0V33Ylna7rrc0uUNNC5cmUJdz+x/KZj2ibQ7a6CX10f3W+kHu64blxcZt1TxQ0ECCaEmMZlbpV5f9qo+vVPzIjlFUwzL3yrVgE1DxSPrAAVyVpw0JJ1WR9dLHDEWdvB+QwEyJsEnExh80nfp8GbWuL5Z6bHUtNEoiOTufidQ/OVqs/p81ZLbp01IxI/kq/ZLnS2Kk11GDTbtZwloYOVOXC7MV12p/ZD1YKZdNTLxrb1WG6q78Ef8RyN7QfL2s6r2LrcYzmq6wHqrwDWd4daCNSAwq3aYFhzXkEJOa+UqWkanqKFRAyIsNFuePSsw3LTSRaqhhwsrdX8GFvAU4ryD+k9TDDXlVCfUloW7b4OxmCOBDopsbvTHZv+DUcG1Ha0gcIIUlerpnlHH9854jLitmPfpyrv0Qd/G60mk1Iz1qejoJZJ5Y0HJhFuvn8U8dGAWj7oVQlaQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(376002)(136003)(396003)(39850400004)(2616005)(66476007)(186003)(66946007)(86362001)(16526019)(316002)(16576012)(8936002)(26005)(52116002)(44832011)(6486002)(53546011)(33964004)(956004)(31686004)(8676002)(31696002)(36756003)(2906002)(66556008)(966005)(166002)(83380400001)(5660300002)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	1/3mDOQDAWnrUCRbHMboIawfeEBC+cbuhW791qQHSjIR7N02KB7CIkFfJiQynXMTZEuX2qMpTBXlnnnAVeV3hMfAvL272aYEDKtkP5K8Y96DsB/7h/YTwG+KDDpDqcSCs1pPINv5KeZlkAtTlTo02PuSkab4vxsN/6gSwrf4kugHUxodw6RaL611Tbo4rUNf3hpeYnbS8ZI8z6YuuqZhRrzlZdrzqU24B+Jp24TFfnK6Lnt3JQot5HFxbPPhGKUoUX8J2gw1m5YLpu2DGfRVgM+FEHN3qWbhUc3vIL9XCSyfnAum7KQe+Y/gX4GbLZtWMeOIEDCtFz5N9lG1+CK1Ay7fErgpVud6TEDhKh7rodAwIPDkZYNSijAaLckZKgcW4b2QAqzB6GkrPIOisCpFLvh1qc1EUWOvRXZ1gFy5an5h55Ttb5ZwcNn5EjnKgMjnuCn9BDOaq5NKmg3UHSAqDQ0I5ngWVtk9BF4fL+itkP8=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d4d802-8f80-47be-f7aa-08d809758ea5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 17:26:18.4798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WmdyuWNb9mHcDYtR/PSveP7wLHwQUDgmE8sWwWs7HxZhaq1YpXWnJYbZwUA2xLRsh1Z5peKczZS25AKtcDJvQh0GPXdCgIuj8j5uXRpodoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1874
Content-Type: multipart/alternative;
 boundary="------------80141DD52D129E9616A2C7B0"
Content-Language: en-US

--------------80141DD52D129E9616A2C7B0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/4/20 8:12 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-future.inc     | 13 -------------
>   .../python/python3-future_0.18.2.bb               | 15 +++++++++++++--
>   2 files changed, 13 insertions(+), 15 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-future.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-future.inc b/meta-python/recipes-devtools/python/python-future.inc
> deleted file mode 100644
> index c0a2b39ba..000000000
> --- a/meta-python/recipes-devtools/python/python-future.inc
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -DESCRIPTION = "Clean single-source support for Python 3 and 2"
> -HOMEPAGE = "https://python-future.org"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a253924061f8ecc41ad7a2ba1560e8e7"
> -
> -SRC_URI[md5sum] = "e4579c836b9c025872efe230f6270349"
> -SRC_URI[sha256sum] = "b1bead90b70cf6ec3f0710ae53a525360fa360d306a86583adc6bf83a4db537d"
> -
> -PYPI_PACKAGE_HASH = "99abde815842bc6e97d5a7806ad51236630da14ca2f3b1fce94c0bb94d3d"
> -
> -inherit pypi
> -
> -BBCLASSEXTEND = "native"
> diff --git a/meta-python/recipes-devtools/python/python3-future_0.18.2.bb b/meta-python/recipes-devtools/python/python3-future_0.18.2.bb
> index f059186bf..90d1661d4 100644
> --- a/meta-python/recipes-devtools/python/python3-future_0.18.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-future_0.18.2.bb
> @@ -1,2 +1,13 @@
> -inherit setuptools3
> -require python-future.inc
> +DESCRIPTION = "Clean single-source support for Python 3 and 2"
> +HOMEPAGE = "https://python-future.org"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a253924061f8ecc41ad7a2ba1560e8e7"
> +
> +SRC_URI[md5sum] = "e4579c836b9c025872efe230f6270349"
> +SRC_URI[sha256sum] = "b1bead90b70cf6ec3f0710ae53a525360fa360d306a86583adc6bf83a4db537d"
> +
> +PYPI_PACKAGE_HASH = "99abde815842bc6e97d5a7806ad51236630da14ca2f3b1fce94c0bb94d3d"
> +
> +inherit pypi setuptools3
> +
> +BBCLASSEXTEND = "native"
>
> 

--------------80141DD52D129E9616A2C7B0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/4/20 8:12 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200604121223.3818-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200604121223.3818-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-future.inc     | 13 -------------
 .../python/python3-future_0.18.2.bb               | 15 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 13 insertions(&#43;), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-future.inc

diff --git a/meta-python/recipes-devtools/python/python-future.inc b/meta-python/recipes-devtools/python/python-future.inc
deleted file mode 100644
index c0a2b39ba..000000000
--- a/meta-python/recipes-devtools/python/python-future.inc
&#43;&#43;&#43; /dev/null
@@ -1,13 &#43;0,0 @@
-DESCRIPTION = &quot;Clean single-source support for Python 3 and 2&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://python-future.org">&quot;https://python-future.org&quot;</a>
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=a253924061f8ecc41ad7a2ba1560e8e7">&quot;file://LICENSE.txt;md5=a253924061f8ecc41ad7a2ba1560e8e7&quot;</a>
-
-SRC_URI[md5sum] = &quot;e4579c836b9c025872efe230f6270349&quot;
-SRC_URI[sha256sum] = &quot;b1bead90b70cf6ec3f0710ae53a525360fa360d306a86583adc6bf83a4db537d&quot;
-
-PYPI_PACKAGE_HASH = &quot;99abde815842bc6e97d5a7806ad51236630da14ca2f3b1fce94c0bb94d3d&quot;
-
-inherit pypi
-
-BBCLASSEXTEND = &quot;native<a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta-python/recipes-devtools/python/python3-future_0.18.2.bbb/meta-python/recipes-devtools/python/python3-future_0.18.2.bbindexf059186bf..90d1661d4100644---a/meta-python/recipes-devtools/python/python3-future_0.18.2.bb&#43;&#43;&#43;b/meta-python/recipes-devtools/python/python3-future_0.18.2.bb@@-1,2&#43;1,13@@-inheritsetuptools3-requirepython-future.inc&#43;DESCRIPTION=">&quot;
diff --git a/meta-python/recipes-devtools/python/python3-future_0.18.2.bb b/meta-python/recipes-devtools/python/python3-future_0.18.2.bb
index f059186bf..90d1661d4 100644
--- a/meta-python/recipes-devtools/python/python3-future_0.18.2.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-future_0.18.2.bb
@@ -1,2 &#43;1,13 @@
-inherit setuptools3
-require python-future.inc
&#43;DESCRIPTION = &quot;</a>Clean single-source support for Python 3 and 2&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://python-future.org">&quot;https://python-future.org&quot;</a>
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=a253924061f8ecc41ad7a2ba1560e8e7">&quot;file://LICENSE.txt;md5=a253924061f8ecc41ad7a2ba1560e8e7&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;e4579c836b9c025872efe230f6270349&quot;
&#43;SRC_URI[sha256sum] = &quot;b1bead90b70cf6ec3f0710ae53a525360fa360d306a86583adc6bf83a4db537d&quot;
&#43;
&#43;PYPI_PACKAGE_HASH = &quot;99abde815842bc6e97d5a7806ad51236630da14ca2f3b1fce94c0bb94d3d&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;BBCLASSEXTEND = &quot;native&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------80141DD52D129E9616A2C7B0--
