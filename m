Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.52])
 by mx.groups.io with SMTP id smtpd.web10.9610.1594384676733187125
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2020 05:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cKR8oI0p;
 spf=pass (domain: windriver.com, ip: 40.107.243.52, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUPT46cKbCxuHJrSkNdQwewcEDKhYkTnl9W+Wa6U0EMjM2iWUNbJn8jjZ21NHBtiVrOxRuK6RT/8aNMVBvrpL2YawElelRWIdQEiOJN112ZHFWlu1Q9hE5OEyqmkpfMMbcTqukyCmtE4Zb7XAzN00/WnyTlBrOZNrGlB3JsSCwESNxpp/e4VFWs8G/tXowhT9dh3UGNjg39teLgWMRVqiomeEUittk5XnGZ2CFM3XAArmOHOTnjLOx9ArFq7T1AjcVwi9PEuFzSjFa72Uf7wycRgNNU9tre+/RGX4J/rd1fxRUKztpskkxvBGQIho1ITWq3YVn38vgUXxJwRaKN88Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmUqCO3v3CD8FZVfjbM7/yiiO7GdvtB3M/o16kIcHW0=;
 b=OlbgfJSNbdOVExuacgoUf0t5PtCBDL5tWBsXxTtnOvsVXuiXeigwAbNEyNNtyrLsWIcamihSg5lIvqZwjlKf044gBVgjyFhFW1cAkEsotbSxSyQDuzq2Inf+o2IEE9iTfYpNzcVbOIm+sFSuuQynCiyupsdAGKPmrKGuXEL+OKzWaqSh8VXeqy/x4GglnQ3gxmnihFwjp676kldsvgLuHLvGmq05ZCzntsnN/GV4cDmtxNqIM99jHh9JT4GqXxJd0J6tvxjM8B5k5O9+wj/Tt0UnFojKlaKOZ11OBmALgko1LRcQaCCSVIV/Zd3ls2/+zoi+evRs0BVqy7jK9arVIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmUqCO3v3CD8FZVfjbM7/yiiO7GdvtB3M/o16kIcHW0=;
 b=cKR8oI0pReToRwlnGgGTEwI6pxuiJyymBzUNGvv8KE+pJdU5rVxFJWubTRznOeLrOsaSXJy10vGOg29BYAr9cz8B4A6edQeTJXwZ36o+xNKX2KlWeRh4Qn7YadAXbspUDB5iY9M8etCnwROjaciaRIQ1illUWyYvCApilhyu8h8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB4516.namprd11.prod.outlook.com (2603:10b6:5:2a5::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.20; Fri, 10 Jul 2020 12:37:56 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.031; Fri, 10 Jul 2020
 12:37:56 +0000
Subject: Re: [oe] [meta-python][PATCH 6/7] python3-pyconnman: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200708094659.27331-1-leon.anavi@konsulko.com>
 <20200708094659.27331-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b49a60a8-0fff-d015-8ffe-239b76bb9e91@windriver.com>
Date: Fri, 10 Jul 2020 08:37:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200708094659.27331-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0082.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::21) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0082.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend Transport; Fri, 10 Jul 2020 12:37:55 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05857f8a-2972-45ea-0ded-08d824ce120c
X-MS-TrafficTypeDiagnostic: DM6PR11MB4516:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB45167BB7899550FBCCB0111D9F650@DM6PR11MB4516.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:138;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XM+ZKL4dDkLp6Uym920mvzCoxvYjY6xNeEVNy2phWp1arhRRm15XB300xvtwz86QvtU/IPDv7P4GwaVjXQJkoPgfBjnM+chqHPWlOcNp6YEwEVeuprJ7252RZDniW7zvdiI/7hOxHArLMdkhfF18O1nCx9HN05IYQQqaROMdUM1p4iw+rdrqEekpoCX+7pEflintE/vsrq509X6DdBjVz+EbDkAoidaFISj6RXPhk6FVVPlJwEquTCMfI/k3fjZg4ZQC/sbDmhzQKPGR9ETu3m21GVInBvRtNPirYowZeq2JOiuOa4XZYeDg1hfbxdnD6+j2XJhC6nCujHPrltfsL4GIumZ1YRwqk4u1yNHKBrbZ5VMistR+Bwa3cVTdE4qsTpIfVuA3xIq8KCOLkmA8RBWKAfZMNamU6950+OZC9tVhW3TZfSdaC6lLLZ+8enuyxnhsNEB0V5mFUZjERwxwQw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(366004)(376002)(346002)(136003)(16526019)(16576012)(44832011)(166002)(53546011)(66556008)(66946007)(26005)(66476007)(2906002)(966005)(316002)(478600001)(8676002)(31686004)(31696002)(8936002)(6486002)(86362001)(2616005)(956004)(36756003)(186003)(52116002)(5660300002)(83380400001)(33964004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	e3ACgMwnAabQG5tXQcOeLC9Ck1J0pBdJItNBdGokJQAVuFGUosO9/pJ74SLU/0FXz+XyEQrb5iQVea8dSCuHw+wJn0QODQiEJKRmkXmNk1REPDGX/KiPyMjEiJyFK5kNzzvEAGh1xUi3dbZRJHifxH+hhrZl9FCg/A/PfWWgPC+o7mK55iiVuR3mymOuabJXjegmGGn/43qce+qDkubZ35FyZUu1KF/W3izMtsGryFabplUefUm4Jxdd3oIXiETqCD0LCtLR0YHey6/P7L5mcHyBR7fFp4Qxa4RnKS/L2oP7HYx90GUmINqZmXKOuKhVNtvq63mFSHsL90wEp2JYQVuIAJfP4Vsvj8b6WJcSniFrQY50xCx/LeQKZrT4tRqAenKoqVFdLr/5Ip9KmePpCNCzmkczJOKj+4KYoMpMJt98a+qG8Dus7LJRMrwyLMdUbmwCQrSgO4Bu5SqLGzijnB+jFxBD3gEaI2/mXf7yLig=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05857f8a-2972-45ea-0ded-08d824ce120c
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2020 12:37:55.9147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QuBuMCM8RtFqcjvIyuL/IujD/UZGUjWt0/HdbQjA+ebbWmiUDJvf5sfvztPF14AeTI6uR2AwHIIYgWTANQzUsneSTSKjP/mG0VTsFo5bm9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4516
Content-Type: multipart/alternative;
 boundary="------------B8895ACB135A9528FBF3A84A"
Content-Language: en-US

--------------B8895ACB135A9528FBF3A84A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/8/20 5:46 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python-pyconnman/python-pyconnman.inc           | 12 ------------
>   .../python-pyconnman/python3-pyconnman_0.2.0.bb     | 13 ++++++++++---
>   2 files changed, 10 insertions(+), 15 deletions(-)
>   delete mode 100644 meta-python/recipes-connectivity/python-pyconnman/python-pyconnman.inc
>
> diff --git a/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman.inc b/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman.inc
> deleted file mode 100644
> index 8517079bf..000000000
> --- a/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman.inc
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -DESCRIPTION = "Python-based Network Connectivity Management"
> -HOMEPAGE = "https://pypi.python.org/pypi/pyconnman/"
> -LICENSE = "Apache-2.0"
> -
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> -
> -SRC_URI[md5sum] = "d60bdffbd9c920f005fdc5e05a8b94cd"
> -SRC_URI[sha256sum] = "d3a63a039c82b08a1171b003eafa62c6f128aa4eaa1ce7a55a9401b48f9ad926"
> -
> -inherit pypi
> -
> -RDEPENDS_${PN} = "connman"
> diff --git a/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb b/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb
> index e0f3fdd75..b80c167bb 100644
> --- a/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb
> +++ b/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb
> @@ -1,5 +1,12 @@
> -require python-pyconnman.inc
> +DESCRIPTION = "Python-based Network Connectivity Management"
> +HOMEPAGE = "https://pypi.python.org/pypi/pyconnman/"
> +LICENSE = "Apache-2.0"
>   
> -inherit setuptools3
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>   
> -RDEPENDS_${PN} += "python3-dbus python3-pprint"
> +SRC_URI[md5sum] = "d60bdffbd9c920f005fdc5e05a8b94cd"
> +SRC_URI[sha256sum] = "d3a63a039c82b08a1171b003eafa62c6f128aa4eaa1ce7a55a9401b48f9ad926"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} = "connman python3-dbus python3-pprint"
>
> 

--------------B8895ACB135A9528FBF3A84A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/8/20 5:46 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200708094659.27331-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200708094659.27331-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python-pyconnman/python-pyconnman.inc           | 12 ------------
 .../python-pyconnman/python3-pyconnman_0.2.0.bb     | 13 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;---
 2 files changed, 10 insertions(&#43;), 15 deletions(-)
 delete mode 100644 meta-python/recipes-connectivity/python-pyconnman/python-pyconnman.inc

diff --git a/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman.inc b/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman.inc
deleted file mode 100644
index 8517079bf..000000000
--- a/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman.inc
&#43;&#43;&#43; /dev/null
@@ -1,12 &#43;0,0 @@
-DESCRIPTION = &quot;Python-based Network Connectivity Management&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.python.org/pypi/pyconnman/">&quot;https://pypi.python.org/pypi/pyconnman/&quot;</a>
-LICENSE = &quot;Apache-2.0&quot;
-
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57">&quot;file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57&quot;</a>
-
-SRC_URI[md5sum] = &quot;d60bdffbd9c920f005fdc5e05a8b94cd&quot;
-SRC_URI[sha256sum] = &quot;d3a63a039c82b08a1171b003eafa62c6f128aa4eaa1ce7a55a9401b48f9ad926&quot;
-
-inherit pypi
-
-RDEPENDS_${PN} = &quot;connman<a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bbb/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bbindexe0f3fdd75..b80c167bb100644---a/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb&#43;&#43;&#43;b/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb@@-1,5&#43;1,12@@-requirepython-pyconnman.inc&#43;DESCRIPTION=">&quot;
diff --git a/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb b/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb
index e0f3fdd75..b80c167bb 100644
--- a/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb
&#43;&#43;&#43; b/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb
@@ -1,5 &#43;1,12 @@
-require python-pyconnman.inc
&#43;DESCRIPTION = &quot;</a>Python-based Network Connectivity Management&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.python.org/pypi/pyconnman/">&quot;https://pypi.python.org/pypi/pyconnman/&quot;</a>
&#43;LICENSE = &quot;Apache-2.0&quot;
 
-inherit setuptools3
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57">&quot;file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57&quot;</a>
 
-RDEPENDS_${PN} &#43;= &quot;python3-dbus python3-pprint&quot;
&#43;SRC_URI[md5sum] = &quot;d60bdffbd9c920f005fdc5e05a8b94cd&quot;
&#43;SRC_URI[sha256sum] = &quot;d3a63a039c82b08a1171b003eafa62c6f128aa4eaa1ce7a55a9401b48f9ad926&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;RDEPENDS_${PN} = &quot;connman python3-dbus python3-pprint&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------B8895ACB135A9528FBF3A84A--
