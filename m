Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.47])
 by mx.groups.io with SMTP id smtpd.web12.10886.1593784958466722203
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 07:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=G9UqmPPl;
 spf=pass (domain: windriver.com, ip: 40.107.244.47, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fd0WrbH4DD1kph5QbxT9CP7hUkd++uIjV+9WE5Vl28SyzZ+P+DhSGamO6LeyDBeg45W0w8VtKqQvjgZ2W8uaxViMXpKlRjytidyF7x6j24wt8PYV1gzR3BT6n/WcaY4Dj2DYpovL81Bc6F6nchuuLHuaGfm74vj+mcDtmqmHv/bm082rTULnCEWYpUkJjmRP2tvqh7P5uCwaiiCE9y1N1hnTIVCm1RwSa//8gqlIFTEl0szK+WQhNxSW/XX2NR0l+LvSLusx+0NZKljCyr5KiuTul/+MThHIpXJq/4WvjCeM6P3GpmfFiYuayclcpf5kX/P7C5c5goRXUABdmtnmwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50IoSLummljsuMVDu1gdczvjDbe/mjigzJQqms4idaw=;
 b=leOgOKY09tVRCbXW+E+6CcJIKXX/rXSXnlKq40HYQupEJaVvtNekep3plphUCjMoy/3CLSvhhdJ9TBBwZLaic9AamED2psJSqL2D0E3sW2lNpNrQGKkS7omDI6Mgx81AucuWfP4mdfhNJvWTdGjThZX75O9eFwGLAypWU+mz/+wAT12jW5tarx9zwHCK4flrZ1AKK3whF9LPOH9DSdvTXZYT9wqmXYeN13nsy9znpoxSOGMOjvsURpmX5r8VeZ8Md7GzOeAtG0i23CRNl7xRdblLXvClRjI0q+h6AWdudIi6tdrAUuqNaaRT40zjNy66dqJ774Kc4Lpe300JrNXgFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50IoSLummljsuMVDu1gdczvjDbe/mjigzJQqms4idaw=;
 b=G9UqmPPlVyRttJojBhSZSDqylQ8dLHThswWXt5b5/yavnWdPLYWDqAKuBBed0kjM9fD4usu5+67vkNEsQkUKm8F5zp/kbn2KNcKuI1CrWzy/l03Xl1GsMf+9QEEeYDGhyxavxv6h5NlWOSZ4ySM+QE2Wf1i117y3ybmtO9JjY/M=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB3627.namprd11.prod.outlook.com (2603:10b6:5:13b::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.23; Fri, 3 Jul 2020 14:02:37 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3131.036; Fri, 3 Jul 2020
 14:02:37 +0000
Subject: Re: [oe] [meta-python][PATCH 3/7] python3-pymisp: Upgrade 2.4.122 -> 2.4.128
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200629171853.18608-1-leon.anavi@konsulko.com>
 <20200629171853.18608-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <33b11799-84da-44bf-0b78-f6e5c13ac42d@windriver.com>
Date: Fri, 3 Jul 2020 10:02:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200629171853.18608-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0139.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::18) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0139.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Fri, 3 Jul 2020 14:02:36 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7453b0e-cece-4f4f-e88d-08d81f59bdee
X-MS-TrafficTypeDiagnostic: DM6PR11MB3627:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB36271DC4C6EFCC24A8AACFD39F6A0@DM6PR11MB3627.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9Bb+HiwEmFrvnqpIO6v71M/qioqDtnO4YfTuY+jWfN0EO4CWuuVN5vELLX8K75ZOyLMGfYUu9vLfjpzwqoqj/l6sscjeb27JR5s93e+pzQeUaia+PDJjdnN5zPRuRTN8it1hbGcwFG3b9vw7bmMvei2quMWel/vNmafQq3kz9t+akhDeWJOJccYdrMW+VXcuFZiRrjtuvlYsc7PHcgArLd7t6CwuyFuHJotEfokhWnxNbDZ3QXFFD5s/vyqaJLitV8YeytPHBTI73AgE7TVZpzV/tHLGKgUI3l+76HQXUStc0syI0xb59QwHKntckq7yh3agZVp2f+l5102twBLw469mxETPjJnkIP4tB1qe1R55yV7zVp6DWBdYI6lC0/wBN9i0MiIvoCllckxHNWK0w7vrMGVImCPN2C9N61fdfAot4K2y7Law5C2VvbRb9BtvfxHClDj8a8gkdjn2XiqWUQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(366004)(39850400004)(376002)(346002)(136003)(33964004)(66556008)(478600001)(966005)(16576012)(316002)(36756003)(8676002)(66476007)(8936002)(53546011)(2906002)(86362001)(52116002)(31686004)(31696002)(166002)(66946007)(83380400001)(16526019)(5660300002)(26005)(186003)(44832011)(6486002)(2616005)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	spGgERC+vy5OUU6DaR/mXKzf2UnwI0Dik3sWj1rutzYIyy7FcpMhrCgd5pPcOqqegdlSSCOvOFjYSbpcjHetXsKVC87bAyW+eBWNNVTTw92YllzwlL6qW/BCGMwNv+1Q6CgMF52GWs1wyv4a7JvSIQUh34w/8bBvKDmPeTaxj27XcMfUgRG20pRUJh38Fwh+n7xUbl0r+fC/sEp6Q8RV6GKxME+eeIXD+JIiddSJagbkbcNH6Gekxq2QOCIB49769Qy4GYu+A/q1xrk+B8iTIg6q0rnNBE7xs8IizNGcw4+XtTOcH9yrPdGuBx/rXKHZjcM3rLWY0aYs1cXTPbSnxHdbe6/HZkpBsBRc+akKu+Uuzf3EaoG/qUBcq8qN4h7GoyoGZJqJdyHK49bGAFGwt1kY3nAMDQ80qAivYLrtQX5ZOV05iI00dQnvcxDK/Q6yDiMpqP3i3HsxBm682G5A4Ef8Qan53oF8ebPZ3XCuwSM=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7453b0e-cece-4f4f-e88d-08d81f59bdee
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 14:02:37.4335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +HKL6gp4QiZL/cwmdMa9TBiIQTH+tfTFEr/7yjuDEN0TZtlPAqFYUR8BnroShBIi+VcoDR49R2Y96yR9vnWWK/XbnY9zeqRteeEdVMAyZ4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3627
Content-Type: multipart/alternative;
 boundary="------------25057A451E04ABB939EB22F1"
Content-Language: en-US

--------------25057A451E04ABB939EB22F1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/29/20 1:18 PM, Leon Anavi wrote:
> Upgrade to release 2.4.128:
>
> - Bump version.
> - Add a few test cases.
> - Bump objects.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pymisp_2.4.122.bb => python3-pymisp_2.4.128.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.122.bb => python3-pymisp_2.4.128.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.122.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.128.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.122.bb
> rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.128.bb
> index bf2da0066..e27bf9900 100644
> --- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.122.bb
> +++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.128.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
>   
> -SRC_URI[md5sum] = "ef41185d4c2753dc2c1a9ab937e3614a"
> -SRC_URI[sha256sum] = "ecdc362b4bb5dd500a5f0b9e795b35ed75037de64f8dcf39c24d029e7657ad7f"
> +SRC_URI[md5sum] = "a90a25def591c6a265bc904f801646f1"
> +SRC_URI[sha256sum] = "714b8b5c8debb4b5e0e602a5fe8a599206e89c1313244ed0e69d9e0bc816f1f7"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------25057A451E04ABB939EB22F1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/29/20 1:18 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200629171853.18608-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.4.128:

- Bump version.
- Add a few test cases.
- Bump objects.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200629171853.18608-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pymisp_2.4.122.bb =&gt; python3-pymisp_2.4.128.bb}  | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.122.bb =&gt; python3-pymisp_2.4.128.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.122.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.128.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.122.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.128.bb
index bf2da0066..e27bf9900 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.122.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pymisp_2.4.128.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/MISP/PyMISP">&quot;https://github.com/MISP/PyMISP&quot;</a>
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20">&quot;file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20&quot;</a>
 
-SRC_URI[md5sum] = &quot;ef41185d4c2753dc2c1a9ab937e3614a&quot;
-SRC_URI[sha256sum] = &quot;ecdc362b4bb5dd500a5f0b9e795b35ed75037de64f8dcf39c24d029e7657ad7f&quot;
&#43;SRC_URI[md5sum] = &quot;a90a25def591c6a265bc904f801646f1&quot;
&#43;SRC_URI[sha256sum] = &quot;714b8b5c8debb4b5e0e602a5fe8a599206e89c1313244ed0e69d9e0bc816f1f7&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------25057A451E04ABB939EB22F1--
