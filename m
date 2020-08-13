Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.54])
 by mx.groups.io with SMTP id smtpd.web10.13145.1597334021493205155
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 08:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CiW7qZi6;
 spf=pass (domain: windriver.com, ip: 40.107.220.54, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gn0vRS4aqgHMze4kpq3aHW3Rh6YeFu6tOkge14ZNLBTPCxTYmG2bSVnscInQYEFwgu7AMF1koL8D+5NOT9xsUHAXGPFqpNMZKpQJbBCNrJFWiDJeQI/13pgoyuRi8lFXOqGn9xyIWzD5Ik2zHYG+ta7z1aU2E/HYD9Vj2qlHGqATHYyvQnoK1KAnfCig/ZD0lCjFqVwZ69ysI6AzzQXrNtp+iHEw564D4puQVuQwxRTiOewFzO/04MGxisu/6Or3Sb0Fb62cc6/eAvIuiVDjWT/4/p4M+wcBWQGjZsbndET7QMAvaDrUbK2me4w5hATws0HCfUyfiVvUF6DCiWgKCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWzKSbtJJ5vjLD3RuOx67GofHHtZp5Ali+EOci+QClw=;
 b=NyfIVLDf1fJp6lllyxr0AKXDGpOH3sWZeBo2scWQ8ERfPx8m8pHvcyad1uQLDXt+2rYRiS7vUq5HPwF9OoCLSyjEarKatKKuxsTqQRwVDC3ZdXdtVKt7P6jigDoBJq4RtnWR9CoguTzIc4l7S7Mxn37p3Uuyhkic5DJuPFzFJGBHzyY1q79Z4NykriW9S5MKQ0uBGAVdRJnOLaM5e1HsB7ZRwMAoPPgBEZvR21odNM82uv90bdmkCqpWMJ74qJcv2weeLW6zouQbkVEFaiQVx9IY8vFb9PoMQqOF185yBL1BQyaUFf3K1YmwBujg5k+5ryQyQpCKa+KbRDKT/weNpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWzKSbtJJ5vjLD3RuOx67GofHHtZp5Ali+EOci+QClw=;
 b=CiW7qZi60/sRY9YAmEJ+xPu1cIHn/LCsk4gcxEH7/Jrky4XDtnSJbHdbinrQOJ5tuav/nBZdlm+u3QQXtpDi+ZvD7FwMWVb4Uu+gDBwjtbvnrobuY2MLVsPKoywYgiTJUUtjD1fxe+xoNNEyzou1qeFijwN6mANKdfBwg31DmQ0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3606.namprd11.prod.outlook.com (2603:10b6:a03:b5::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Thu, 13 Aug
 2020 15:53:39 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Thu, 13 Aug 2020
 15:53:39 +0000
Subject: Re: [oe] [meta-python][PATCH 02/10] python3-hyperlink: Upgrade 19.0.0 -> 20.0.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200811114430.27916-1-leon.anavi@konsulko.com>
 <20200811114430.27916-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <001cdc3e-4384-8eb2-52a5-b95054f61ac5@windriver.com>
Date: Thu, 13 Aug 2020 11:53:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200811114430.27916-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0052.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0052.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 15:53:38 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c8e7e0f-b9b0-4065-7032-08d83fa10ba9
X-MS-TrafficTypeDiagnostic: BYAPR11MB3606:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB36064F9CDCAC1D212AD435309F430@BYAPR11MB3606.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:480;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yAhzOa4Plkcqjw7s6ubrgNld6zzTFPY4VPwtGMgbcSFGYtoeueLZZcyW7tYtK5XZZ2nyx3gs0TCL6lP2MDlcWsF1t2z95oMPLpoeJ9FicJVZ0HElzxot/Gh7vSUQz6JKhX68ByTz/d2FkBIFOEsssnfANR1XHNnv9Vl6eV+8Tjodj2HNKHx51o0edJf1QW/VZSp+U81UERZAVIeeO3po3vYjFUHWkiFx3Yu+OdNHZYUQsvuVZ2vT11F40Mh2pYJ4/nhlyAbaND59OTXf77OWjsp8PeH+kRD+8b82RV8Oz2JmpNSmaXPrrZ7oJvQoFkiNJ8CgwYeWLedxKxhbgG7vR3U6hL+Tdk49O92RAwhWzEM4lTkwgA/x0dqCivplQzNc/8fXIl6qXdl1FecSCZ1Gz/4F/uUsVkGHjbhTAMgtEa7KX2byrSkFdYf+zeepmNDqV4bclooJqKObVLvDa9ddhw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(376002)(39850400004)(396003)(8676002)(31686004)(186003)(8936002)(16526019)(5660300002)(36756003)(26005)(6486002)(478600001)(2906002)(31696002)(44832011)(66946007)(956004)(166002)(66476007)(966005)(83380400001)(86362001)(66556008)(52116002)(53546011)(316002)(33964004)(2616005)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	UjhZquVptqCLLjMrfbwD6dyW0g6xlrool3v7aUxkFznuO4CeOb/gFK00CxvrOx1pscRgwsb9w8H39GTT0YqTgWxVAKKest3ZIzvcBWEYeZ3hAsLGXdei8P9uCpBn0oixOWWkaovXIT851nueJhNCGysLAKZWr0PJ4udlQiNsj6O109U33KzZDjjG44nmMFRnI5L5QEw9DMK94/WKlPSIxe6CVrRYI98Eu18kqAsJFY4pa2GoiolwHriJyNIAsOABQED/I9GCnnlxZ6mQnJPoLZNMs2Lyc3IQ99FdYGSXQlm1N6B36v905Vftg5hh2TBDsLRVrloDo52OyXWT57WHjfjUNpf3EatFBjEZZzRfMAR8tUeWDJusD2CeOAPjTtbTB1GpPpJ5V7Wr7qqo3joZ7ohwdT+gm4OQ/UjpyyueXSGvd1oAVScmjEJtTP8sP7UHJcg08W5RbBOq7H/v1XcER5rOobb0mfiDV8qgp3cHgnnXuZKVD1dMgAcC2c4V2tru0Vs5MEqPcfutVNGW3Z7Q/9FxGX0E0rtvWmzSAd/Ey96d1uN95cTNDVufGBywBxk1NbMjmyFptQHg+sRDkv81tcVrojPFWbT/xTQGYDLoI+dKFidzV6a+2bnZMcwFp0bO8d2vjLNi0DQAkDL4BtQqmQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8e7e0f-b9b0-4065-7032-08d83fa10ba9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 15:53:39.4281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqUN7e7gWiOm3f4g0xAsiGiIT1y7yUgQz8j9lj6NkJPJza7DHRqcAhhRyXVtNoiNNv4X8it+Ja698Mb6c3RzmcpP6GZhDWKnDn3ib26Tl4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3606
Content-Type: multipart/alternative;
 boundary="------------E1BEB56483D04632E524B867"
Content-Language: en-US

--------------E1BEB56483D04632E524B867
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/11/20 7:44 AM, Leon Anavi wrote:
> Upgrade to release 20.0.1:
>
> - Rerelease to fix packaging metadata around conditional
>    requirements.
> - CPython 3.7 and 3.8 and PyPy3 added to test matrix.
> - Hyperlink now has type hints and they are now exported per
>    PEP 561.
> - Several bugs related to hidden state were fixed, making it so
>    that all data on a URL object (including rooted and uses_netloc)
>    is reflected by and consistent with its textual representation.
>    This does mean that sometimes these constructor arguments are
>    ignored, if it would create invalid or unparseable URL text.
>
> License-Update: New contributor added. No change of license.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-hyperlink_19.0.0.bb => python3-hyperlink_20.0.1.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-hyperlink_19.0.0.bb => python3-hyperlink_20.0.1.bb} (61%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-hyperlink_19.0.0.bb b/meta-python/recipes-devtools/python/python3-hyperlink_20.0.1.bb
> similarity index 61%
> rename from meta-python/recipes-devtools/python/python3-hyperlink_19.0.0.bb
> rename to meta-python/recipes-devtools/python/python3-hyperlink_20.0.1.bb
> index 3ee098ad6..c9e281504 100644
> --- a/meta-python/recipes-devtools/python/python3-hyperlink_19.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-hyperlink_20.0.1.bb
> @@ -1,10 +1,10 @@
>   DESCRIPTION = "A featureful, correct URL for Python"
>   HOMEPAGE = "https://github.com/python-hyper/hyperlink"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=3893d4ed05dcc823f8ed685a9ea19bcb"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=6dc5b4bd3d02faedf08461621aa2aeca"
>   
> -SRC_URI[sha256sum] = "4288e34705da077fada1111a24a0aa08bb1e76699c9ce49876af722441845654"
> -SRC_URI[md5sum] = "4772fb4d87c26a1ab22a6161424e3cba"
> +SRC_URI[sha256sum] = "47fcc7cd339c6cb2444463ec3277bdcfe142c8b1daf2160bdd52248deec815af"
> +SRC_URI[md5sum] = "d7983e3d2625e5f7dffc8d12da8803ab"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------E1BEB56483D04632E524B867
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/11/20 7:44 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200811114430.27916-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 20.0.1:

- Rerelease to fix packaging metadata around conditional
  requirements.
- CPython 3.7 and 3.8 and PyPy3 added to test matrix.
- Hyperlink now has type hints and they are now exported per
  PEP 561.
- Several bugs related to hidden state were fixed, making it so
  that all data on a URL object (including rooted and uses_netloc)
  is reflected by and consistent with its textual representation.
  This does mean that sometimes these constructor arguments are
  ignored, if it would create invalid or unparseable URL text.

License-Update: New contributor added. No change of license.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200811114430.27916-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-hyperlink_19.0.0.bb =&gt; python3-hyperlink_20.0.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-hyperlink_19.0.0.bb =&gt; python3-hyperlink_20.0.1.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-hyperlink_19.0.0.bb b/meta-python/recipes-devtools/python/python3-hyperlink_20.0.1.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-hyperlink_19.0.0.bb
rename to meta-python/recipes-devtools/python/python3-hyperlink_20.0.1.bb
index 3ee098ad6..c9e281504 100644
--- a/meta-python/recipes-devtools/python/python3-hyperlink_19.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-hyperlink_20.0.1.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = &quot;A featureful, correct URL for Python&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/python-hyper/hyperlink">&quot;https://github.com/python-hyper/hyperlink&quot;</a>
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3893d4ed05dcc823f8ed685a9ea19bcb">&quot;file://LICENSE;md5=3893d4ed05dcc823f8ed685a9ea19bcb&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=6dc5b4bd3d02faedf08461621aa2aeca">&quot;file://LICENSE;md5=6dc5b4bd3d02faedf08461621aa2aeca&quot;</a>
 
-SRC_URI[sha256sum] = &quot;4288e34705da077fada1111a24a0aa08bb1e76699c9ce49876af722441845654&quot;
-SRC_URI[md5sum] = &quot;4772fb4d87c26a1ab22a6161424e3cba&quot;
+SRC_URI[sha256sum] = &quot;47fcc7cd339c6cb2444463ec3277bdcfe142c8b1daf2160bdd52248deec815af&quot;
+SRC_URI[md5sum] = &quot;d7983e3d2625e5f7dffc8d12da8803ab&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------E1BEB56483D04632E524B867--
