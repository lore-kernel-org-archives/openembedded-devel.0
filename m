Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.57])
 by mx.groups.io with SMTP id smtpd.web12.2029.1594577792049786450
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 11:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mGcOR6wK;
 spf=pass (domain: windriver.com, ip: 40.107.237.57, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVMe9qHdYJpABBJa+Aq+pCEwf6KH3soQQJvqey6YrDX3bw7wmCglL2ak7sBUOiM/vkdyiL+VLEj9NnmAf6AZtlNOBf7BXdHs1WN97wLO3GtY4Psbsl6tE79fkV0F18Ksf5JZzGjfpe5NglIyrb1XyFGv17Lf3DNVpkaVMuZJDelhDfSoHHV3R7qcHzMiIyniKvCHb3QGdMY/zW7BbWuffKs2W90iFhPFbrkD/cj8ep0/YOO8sHICdT9dipeRhnSTDUh1++KtlYPoVkv7r0iFY6uhD8wj/f54UlJTwq3YkyDK9KlEP/LKIaIBOzf/77vQrj8fXVTLbWXvhNAPNCXY0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OUoclvGEAZD81GjZbAXahrHLxKZeqsusrDTiVxIk9ms=;
 b=BOm1qr4fTnEBIrFdx4RZ9ChwcpQRKRpYOga9p7zMLb3jzQBafXWbCSIQ8WnZKeHBCzU9VG9o0EHoJFHhmk+cEVDPzbrBT0O2VD6ZD9uOBYitOa8kDe6ioIJ3zAI/me1kuoJcmbeXC/YX/4fbkAWkSKmfJ1Hz9ipfd6+PrHq+B5965dPU2bVYt9rldcAHFmiKvowKWq5R0cB/cjuVncfG7qobcRbPCsBZSY3wl2ZJP1vYSLw+mcn+WSfM6CDCZbdtujiF6yR97aanB9RMxJso22Iv00tNnvt1H1O1mv6nY3L4iav6ets0mlM1IyesD/xG4f2DGOt7sz5gmJpXCLHnwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OUoclvGEAZD81GjZbAXahrHLxKZeqsusrDTiVxIk9ms=;
 b=mGcOR6wKoV98/8ebcW68wyQCHMQQyXM1Gewavy+Ab9+U2eyZKxeRWbhK1lQWqttH8mxYxxVFd9azAt+01p6pVDJmqYuF61jnSaHS/+K+bj8v6lrJgLeW0sZnsrBShk5sBbk1rOu8B/22ZNHfymuVrO+zoMy+j03v4k15PWfCbxg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.23; Sun, 12 Jul 2020 18:16:29 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3174.025; Sun, 12 Jul 2020
 18:16:28 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-flask-babel: update to 1.0.0 and consolidate
To: akuster <akuster808@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200709040810.9754-1-akuster808@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <7391513f-30a9-a8f2-9999-754b5393ac71@windriver.com>
Date: Sun, 12 Jul 2020 14:16:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200709040810.9754-1-akuster808@gmail.com>
X-ClientProxiedBy: YTXPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::34) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend Transport; Sun, 12 Jul 2020 18:16:28 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d37c6e4-c440-4dce-aa44-08d8268fb249
X-MS-TrafficTypeDiagnostic: DM6PR11MB4532:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4532EE2DFC3532E2DF5E2FB39F630@DM6PR11MB4532.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jMQLnFoZhqwoewvP82sSjU91sGhJOVVFrN+DCeW81IYrtZJifbQ9przqz2crOw7vb41+SrbxrDXvmt2y1GLIdgn9CPG2djHnqyWBkLs+rlRysjCi9UkQDCLsyLYDW37ePjhXRM+Ie3jx7H6yktZJsEZMqpS/evzIacXgxRvi9+AgulblUk9U+8XnGTeXTrVtQGp3Sn4aGiQ56JBX8yss6ag0gSTnMMOBPVLIjHOh0DA5fDnvNFsKcxZ7vIL2zhRDVsRuEqBnmQx1bnsaRyJxHMmOLjvp9VELnLbh33ceAMr8owbGkkpVcQvA+2235dTNW6rSTrdOkN7NYpQ2vzv+7QpGBooRnsXUD2IofoHdixlugWfD8YPAiQ4v83FshbdEd+WhnpzEkzQ5RMRuwWwVGxneZ7Dj19SkIDMnjuoTYVdVX7+R8EZFT8LrMIHxf9IFPOHk9k4VjZYTR/WSGC3cEA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(39830400003)(346002)(376002)(136003)(396003)(2906002)(166002)(8936002)(31696002)(83380400001)(66476007)(66556008)(966005)(478600001)(6486002)(66946007)(33964004)(52116002)(36756003)(86362001)(16576012)(316002)(5660300002)(31686004)(15650500001)(53546011)(186003)(16526019)(26005)(44832011)(956004)(8676002)(2616005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	iduMzdfcOtY1yl8Uw/9AZHVsVsjEbFdDzBMI4MVaNPEiXigUMZaZadUBhjn83JB+tdGNwY+itadOoGkw0afWHgLej8hS2A6N/34lcZHzwcvvt6ZfoSmJhl2vvT9i0N/wjf69UBeH48AHRGYdONbZjxj+DTVCX5UQzwqVy9ZVM0LYsltW8p3sSSAGnutYEwB6cTKK9OGWnodqiqi0AFCXBpiIqva1ZbpI+VJqXENHPC0dsBFZzg27tmzdooCXVjIygXC4so6ky8vWzwgrHS7L0isYH1WdB4IbBkAsDdzemHMQGSsMWCfWVuq9TQ3DcyB6v0GCTMo5hS/RiTc2lAnGghUp6PcvVucvBXBGDBCTo+MGi1otJ8W/L9GeUjre7taYjAjxe6rvS23xkudsO4qI73Ds1/ul7e4dB43PsUN1rXB1kNRUZip7HCPB9q7tcfYBgg3xa2jpDC2YmFvP1IPNpPUZK1UpfMjLshtsOhUxfgQ=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d37c6e4-c440-4dce-aa44-08d8268fb249
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2020 18:16:28.8052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UatJMB/w0E5JFnw2Pga33tHK6R/o7oKOgxbpN7u8nXtec1Bqyxc7nq0KRhH711uB45PqOA/v587ZM1Qg+SjQXLDS6V7VkugWFU7B6RBooPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4532
Content-Type: multipart/alternative;
 boundary="------------DEAEF91E6DE7ADC928B0CF4B"
Content-Language: en-US

--------------DEAEF91E6DE7ADC928B0CF4B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/9/20 12:08 AM, akuster wrote:
> The python3-werkzeug 1.0.0 requires this package to be updated.
> Fixes:
> File "/usr/lib/python3.8/site-packages/flask_babel/__init__.py", line 19, in <module>
>      from werkzeug import ImmutableDict
> ImportError: cannot import name 'ImmutableDict' from 'werkzeug' (/usr/lib/python3.8/site-packages/werkzeug/__init__.py)
>
> https://github.com/python-babel/flask-babel/issues/162
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-flask-babel_0.12.2.bb    | 2 --
>   .../{python-flask-babel.inc => python3-flask-babel_1.0.0.bb} | 5 ++---
>   2 files changed, 2 insertions(+), 5 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-flask-babel_0.12.2.bb
>   rename meta-python/recipes-devtools/python/{python-flask-babel.inc => python3-flask-babel_1.0.0.bb} (66%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-flask-babel_0.12.2.bb b/meta-python/recipes-devtools/python/python3-flask-babel_0.12.2.bb
> deleted file mode 100644
> index 104e7c28f1..0000000000
> --- a/meta-python/recipes-devtools/python/python3-flask-babel_0.12.2.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -inherit pypi setuptools3
> -require python-flask-babel.inc
> diff --git a/meta-python/recipes-devtools/python/python-flask-babel.inc b/meta-python/recipes-devtools/python/python3-flask-babel_1.0.0.bb
> similarity index 66%
> rename from meta-python/recipes-devtools/python/python-flask-babel.inc
> rename to meta-python/recipes-devtools/python/python3-flask-babel_1.0.0.bb
> index 0e507f3372..d968be3ee2 100644
> --- a/meta-python/recipes-devtools/python/python-flask-babel.inc
> +++ b/meta-python/recipes-devtools/python/python3-flask-babel_1.0.0.bb
> @@ -2,12 +2,11 @@ DESCRIPTION = "i18n and l10n support for Flask based on babel and pytz"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=51917f3e8e858f5ae295a7d0e2eb3cc9"
>   
> -SRC_URI[md5sum] = "fcf2f360ff279d3133e40974804efd72"
> -SRC_URI[sha256sum] = "316ad183e42003f3922957fa643d0a1e8e34a0f0301a88c3a8f605bc37ba5c86"
> +SRC_URI[sha256sum] = "d6a70468f9a8919d59fba2a291a003da3a05ff884275dddbd965f3b98b09ab3e"
>   
>   PYPI_PACKAGE = "Flask-Babel"
>   
> -inherit pypi
> +inherit pypi setuptools3
>   
>   RDEPENDS_${PN} += "\
>       ${PYTHON_PN}-speaklater \
>
> 

--------------DEAEF91E6DE7ADC928B0CF4B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/9/20 12:08 AM, akuster wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200709040810.9754-1-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">The python3-werkzeug 1.0.0 requires this package to be updated.
Fixes:
File &quot;/usr/lib/python3.8/site-packages/flask_babel/__init__.py&quot;, line 19, in &lt;module&gt;
    from werkzeug import ImmutableDict
ImportError: cannot import name 'ImmutableDict' from 'werkzeug' (/usr/lib/python3.8/site-packages/werkzeug/__init__.py)

<a class="moz-txt-link-freetext" href="https://github.com/python-babel/flask-babel/issues/162">https://github.com/python-babel/flask-babel/issues/162</a>

Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200709040810.9754-1-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-flask-babel_0.12.2.bb    | 2 --
 .../{python-flask-babel.inc =&gt; python3-flask-babel_1.0.0.bb} | 5 &#43;&#43;---
 2 files changed, 2 insertions(&#43;), 5 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-flask-babel_0.12.2.bb
 rename meta-python/recipes-devtools/python/{python-flask-babel.inc =&gt; python3-flask-babel_1.0.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-babel_0.12.2.bb b/meta-python/recipes-devtools/python/python3-flask-babel_0.12.2.bb
deleted file mode 100644
index 104e7c28f1..0000000000
--- a/meta-python/recipes-devtools/python/python3-flask-babel_0.12.2.bb
&#43;&#43;&#43; /dev/null
@@ -1,2 &#43;0,0 @@
-inherit pypi setuptools3
-require python-flask-babel.inc
diff --git a/meta-python/recipes-devtools/python/python-flask-babel.inc b/meta-python/recipes-devtools/python/python3-flask-babel_1.0.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python-flask-babel.inc
rename to meta-python/recipes-devtools/python/python3-flask-babel_1.0.0.bb
index 0e507f3372..d968be3ee2 100644
--- a/meta-python/recipes-devtools/python/python-flask-babel.inc
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-flask-babel_1.0.0.bb
@@ -2,12 &#43;2,11 @@ DESCRIPTION = &quot;i18n and l10n support for Flask based on babel and pytz&quot;
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=51917f3e8e858f5ae295a7d0e2eb3cc9">&quot;file://LICENSE;md5=51917f3e8e858f5ae295a7d0e2eb3cc9&quot;</a>
 
-SRC_URI[md5sum] = &quot;fcf2f360ff279d3133e40974804efd72&quot;
-SRC_URI[sha256sum] = &quot;316ad183e42003f3922957fa643d0a1e8e34a0f0301a88c3a8f605bc37ba5c86&quot;
&#43;SRC_URI[sha256sum] = &quot;d6a70468f9a8919d59fba2a291a003da3a05ff884275dddbd965f3b98b09ab3e&quot;
 
 PYPI_PACKAGE = &quot;Flask-Babel&quot;
 
-inherit pypi
&#43;inherit pypi setuptools3
 
 RDEPENDS_${PN} &#43;= &quot;\
     ${PYTHON_PN}-speaklater \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------DEAEF91E6DE7ADC928B0CF4B--
