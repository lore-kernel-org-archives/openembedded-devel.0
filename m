Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.63])
 by mx.groups.io with SMTP id smtpd.web10.25644.1598552354417047454
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 11:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LUQUP9ka;
 spf=pass (domain: windriver.com, ip: 40.107.243.63, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gR/4R+jjE7nGGNaYTvzrJIh9YnQ6RwhEmP2DhWuA8j7w8GScJbVLEHLR+Q6Zyhp7j6mtgCcyENlExxWSlBm7CGjEoVXCcrrll8+Yw8uYBtkJvIrVY3wZ+J7T6CbnoLmdDu18q2OnTwD8gddhp1Rc9Q1VxDuD1AF4EcMAIjHLhGjzV969ui46yqTmX9ww8GizpF5lHhMAhodll1XrxWHdj8fhgNGrZz5meumOLuhSfi5wcuRWtdm9QqaQCGUioeJdHFhS0+ZrkHlQP6QMdCMip2iowwf0r2VooWxiJo/CZ/b1Ok4ZG3Qvz8tDeFjJYLzAiPBBkzzsE3x63oNk2vXRAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwvTXrWynt3oRLoj1sYhEH5zKSelsGmtGJnAH4a69Ow=;
 b=cuh3WdNz6i/KgmYYIe3pfGps58cFrCjVmfa8daojsrLJsGN11W2ec8uRGuDwCnon4rXRNWOGfcoG116YU2WD9hQS+3U3vfUUcqcsga8GlUM7j9UlFrSwvorKClbhxXDE1SOZs7vmjNX3xfU51oyy1zWoVCcn5a0qzLMuu6mpN7gKT519szo7F0aE6E6FmxHnyOFqqsBxRQqe9U5zMZdJLF16m2Qd0CLnFDL5uR6cT9gFxyaxX1LWth+mJy6s0SBkSF+XfOPU1eHCpwUdcUgZye21qVssRMjYIhHORpQZHoLno3X8I0Omp0gqfe/lqA+CRKQ0dIBBWJcbcKPoyU8uZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwvTXrWynt3oRLoj1sYhEH5zKSelsGmtGJnAH4a69Ow=;
 b=LUQUP9kaQ/iTVKPYkaE8qy2INLHwYJeqzdnq4/LxIxe1OVaLlpppuy1gLunRsulmG5pavPxKzbZVKmL091QYcNd7zzKGW2NKToyp3+wLGvnc6KK7Rirdq7xn+Os60knUtmz0Gf8uq/TN2VeZollWKR9wY2GW5TkR7f2c0fqIzpg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2806.namprd11.prod.outlook.com (2603:10b6:a02:c7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Thu, 27 Aug
 2020 18:19:13 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Thu, 27 Aug 2020
 18:19:13 +0000
Subject: Re: [oe] [meta-python][PATCH 1/6] python3-diskcache: Upgrade 5.0.1 -> 5.0.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200826154020.29208-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <7cf71f1c-5179-a314-d2b7-37c4b82698e7@windriver.com>
Date: Thu, 27 Aug 2020 14:19:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200826154020.29208-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0085.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::24) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0085.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Thu, 27 Aug 2020 18:19:12 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7be10626-41c6-43ce-b441-08d84ab5b35f
X-MS-TrafficTypeDiagnostic: BYAPR11MB2806:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2806F73E56F550393E114D939F550@BYAPR11MB2806.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:136;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aUZwuXTpl1hvEKLyBGUM1P6HDQ5Rx5+5Vlxl3v/YYODV8J784f8YH97HD4D3ufbsgQUeM6+YTHkBv7XC5oqvaSD8/4ucZ0ihOc8IOYjm7Rzvbg2cge/gliu8p+b/D97o8+1p3ugFlqpE6ZzGQb2c9iI9Evz98nkPO8dwaw4wjYcJa6BHDEfiDOWifsEvTHKcV/6rcjWkAheudN1ag0JkNzSfHAmm/NZXUYWwNOz6mYLq0v/FVvjw0ZbNgninzGXxl5IZwu7y2QlN/alVwXKCyF4d2vzQ9jAt0R6looGqW9f8/hjIQvYNkDr26HBCA2PEyhCjbR8ONmk6TSyfocmyleV4L4xEF/+lnvd9eiX0Mt5/q98vSX+KZyRtBoHBe7JV5hnxjyt38mDEN7ybztOoE1JrCyvYU6RoulsM2azG0ZCdB3oSs+eVztvd15SM84qpl6PdXdKTmzYNtbx5UVjBZg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(346002)(376002)(396003)(366004)(8936002)(36756003)(6486002)(8676002)(478600001)(5660300002)(16576012)(966005)(166002)(316002)(31686004)(956004)(2906002)(52116002)(86362001)(33964004)(31696002)(83380400001)(53546011)(186003)(66946007)(2616005)(6666004)(44832011)(66476007)(26005)(66556008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	tuG0HJNtbO26cb37Nmba6QmTF0gYhrdE20bVafhSy311XStdeUxbZsmbxQJhMTKfch3uBiODqeYrU2ysQ2DLhIqK/AleAFuaBmRTaRnBdpUWsKaUNdKPrnLRdH3TziO8FxVmtsFeLfnuRoRzRWnXzA+ybDSTiZVuFugjQDiPqu2x7vhVtu7NLJyR9JBijNWlLLYXWSRHm756VXcSe/1BugzugjAVPyIUesea2kZxmeWQcdlHv9CoP/MULhBoDqvw8+SROBUr0YRjAsS+9DpGirWrumx4SqDsKG18+3JDX9+mDtBEgdL90pLQd6XL1HZZW5Kir4Wuy/YJS5us800anlq+rMTCSL9zCNR4Eg1hh3Px7Rcj81FSuNPWMbESsK8ZrpoZEJXjLk7TdTaa+xn1yXsM2Du78bQAfHIUaXSn5syUIF6196GvX6bPmCOC/6zX2KJAPhxB9igbNoZYFTa4wjl5qt/JQv38rXNXHtUybFybbq4qOBS9K/6MVEqZawRpPSVh61MGFQu/bbdQwG8kHoxHPe4XtI7k1QPF7hegOD8wBQh7OlTgs73uHh9Yr4g06P7EecuTjuIWydSxUnyEnERIIP7suQtOIZGNcnSGbOb4BQpuaeiUA8byqguTUloTno/Pu8OERaGxNrekdfg6JQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be10626-41c6-43ce-b441-08d84ab5b35f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 18:19:13.3503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eipJPNWHl2QgDj5n2kbpjwOpbfZwY5vV94UxWayaGoz0YVsX7puu+lsmMJgadAQj4HqZZcRxJ5mIIdSTesgk28Z/n7zhDKwWJTefkfAnGds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2806
Content-Type: multipart/alternative;
 boundary="------------25942ECB49FB7EBF69F073B4"
Content-Language: en-US

--------------25942ECB49FB7EBF69F073B4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/26/20 11:40 AM, Leon Anavi wrote:
> Stay up to date and upgrade to latest release following the recent
> "bump version to 5.0.2" commit in the GitHub upstream repo.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-diskcache_5.0.1.bb => python3-diskcache_5.0.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-diskcache_5.0.1.bb => python3-diskcache_5.0.2.bb} (67%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-diskcache_5.0.1.bb b/meta-python/recipes-devtools/python/python3-diskcache_5.0.2.bb
> similarity index 67%
> rename from meta-python/recipes-devtools/python/python3-diskcache_5.0.1.bb
> rename to meta-python/recipes-devtools/python/python3-diskcache_5.0.2.bb
> index 9f92fde22..7eda65fa0 100644
> --- a/meta-python/recipes-devtools/python/python3-diskcache_5.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-diskcache_5.0.2.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "http://www.grantjenks.com/docs/diskcache/"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c985b6a9269e57a1073d5f142d68eb68"
>   
> -SRC_URI[md5sum] = "5c8c5789f584a36eacc7240921eee35c"
> -SRC_URI[sha256sum] = "b24a2da03d6a45edcec14ea6ef7129ddf0de78f04497557308d1461753d90633"
> +SRC_URI[md5sum] = "b8061d293045b29b83201cf9a62b1da2"
> +SRC_URI[sha256sum] = "6e350e795e197f979316a3f524a729edb13d1739959c6e9cb5df78a0a72c8255"
>   
>   PYPI_PACKAGE = "diskcache"
>   
>
> 

--------------25942ECB49FB7EBF69F073B4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/26/20 11:40 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200826154020.29208-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Stay up to date and upgrade to latest release following the recent
&quot;bump version to 5.0.2&quot; commit in the GitHub upstream repo.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200826154020.29208-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-diskcache_5.0.1.bb =&gt; python3-diskcache_5.0.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-diskcache_5.0.1.bb =&gt; python3-diskcache_5.0.2.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-diskcache_5.0.1.bb b/meta-python/recipes-devtools/python/python3-diskcache_5.0.2.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-diskcache_5.0.1.bb
rename to meta-python/recipes-devtools/python/python3-diskcache_5.0.2.bb
index 9f92fde22..7eda65fa0 100644
--- a/meta-python/recipes-devtools/python/python3-diskcache_5.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-diskcache_5.0.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.grantjenks.com/docs/diskcache/">&quot;http://www.grantjenks.com/docs/diskcache/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c985b6a9269e57a1073d5f142d68eb68">&quot;file://LICENSE;md5=c985b6a9269e57a1073d5f142d68eb68&quot;</a>
 
-SRC_URI[md5sum] = &quot;5c8c5789f584a36eacc7240921eee35c&quot;
-SRC_URI[sha256sum] = &quot;b24a2da03d6a45edcec14ea6ef7129ddf0de78f04497557308d1461753d90633&quot;
+SRC_URI[md5sum] = &quot;b8061d293045b29b83201cf9a62b1da2&quot;
+SRC_URI[sha256sum] = &quot;6e350e795e197f979316a3f524a729edb13d1739959c6e9cb5df78a0a72c8255&quot;
 
 PYPI_PACKAGE = &quot;diskcache&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------25942ECB49FB7EBF69F073B4--
