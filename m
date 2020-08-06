Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.63])
 by mx.groups.io with SMTP id smtpd.web12.5750.1596718967349669967
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2020 06:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=FJt2rhAw;
 spf=pass (domain: windriver.com, ip: 40.107.223.63, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egufaInwfbFM1+3b0ppvKJhRwkCXAoPln//1u/Fz4S7ZfLAPn5O2324yARYz8gU/DRFZnK3xeWoaGQwOjFzbPpzZEgR0Dxf9akPxKoCplp78Tnpzk23I+LETcMK8w1HZlmQe6qdEQDr4hMclFgMgZCijBJ94259i+GPgCt+UWEWj8sn98CvjvvqWZ8ionerqWC8VgLnvBbDK9D7TYAegf1NiV9U7sR10DNyu9ztWn9vgVskOaEtezcVd5WXGbuN1XbdcNolXFh+B80h2sMdv/HDBKWlGYAYMIj1JiEdWJYto83Uhcv3fMhS1OF2L3Ku/VHbA5I0fpjhJxEoW6M609w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyFgzKM+VODeawXnEaF4hyQsBJrdAiNWy48NrIrI/c0=;
 b=M2ntGF0xatJWdDgX7V+nKyfOF7uhbjLYKYh0CvwHDOVxm8C2PRlEvUpU/H6Ym+tXMUENE+KDiUOC7cDoN1qDMZn4pYL8nQBCALTZaJ3Rm+ATmfTRQDVw9NStLvQ1XK5tQesnZfA2CK+osepSmVHkaXVmCY3LsO4iM3VEVQgHIgVkQA6Ur5wAQ72pXyTzryBovKQri+2IPWPfDCuTeHT0ur0zTW7XrRZhQse4i998Rpm713w2SSRRAczPvtoPAEAHvjCZWKL2q+pAefulfnjZ6+WpjE//fnMmtH/T/X3E8dD9XL2QqOpFg/aeJG72WqE6dEdIUiZLeDjpKrpD7gtQCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyFgzKM+VODeawXnEaF4hyQsBJrdAiNWy48NrIrI/c0=;
 b=FJt2rhAwlCpBZUUmdw6WiMx6p6/dd6FMm8JvwtTG8MgHbZWgVL4jKHhW01dnpMcnnqSWemgmEnozh6TFFW6DTjtEE+cw+1WY9+BDiGojkjunCcFOCqvqsjBxnWPj/wAUaW38a/yQiNXfUYyRcg+xMLv3aEyLasUP8AXbh5TKn/Q=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4305.namprd11.prod.outlook.com (2603:10b6:a03:1bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Thu, 6 Aug
 2020 13:02:46 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.016; Thu, 6 Aug 2020
 13:02:46 +0000
Subject: Re: [oe] [meta-python][PATCH 6/7] python3-regex: Upgrade 2020.6.8 -> 2020.7.14
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200803140520.23250-1-leon.anavi@konsulko.com>
 <20200803140520.23250-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e03820a1-b46a-4f67-81b2-ecc7f2822605@windriver.com>
Date: Thu, 6 Aug 2020 09:02:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200803140520.23250-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::8) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0069.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18 via Frontend Transport; Thu, 6 Aug 2020 13:02:45 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d787cc8-0898-45a6-22e8-08d83a090369
X-MS-TrafficTypeDiagnostic: BY5PR11MB4305:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4305747A581F182F45C86F009F480@BY5PR11MB4305.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:549;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kbLSE+WCQpY4a2py1JmH0jcW0jPZ14VH3ao5D+YhnahYvTi3mAP8VwTxgVrHVU15CoEr3e65lRVJQTaP/cSv5bsO2D6fzht9qez7N19CO5UPTcCeWaJcUKc2Ds/eMpWoF/lcaOBhri+CCozXy86flriwB9didFSkoEWSBlbaAgD9GTv0FQYRFppyGisWOZNTtiJrwlxFKM4ijXb0rK4hpqfyTkjbHno7hUaLtkhmW0IOW5ck2ziOC45KheATmn2fFtH9ZiUAG66LAe109AvkE8gX3WJCGR2YhM9sYW7iW1lyvX4FtLQApdEu4pms7zqwR0mphmJLkScKB8OTCQ7Uezqoqb0VIH1pJkwhEUjdqxHNJlv8zFXCrZWNHqeET7J1xnbWq/8ZFf98hiswjpkiy+8OuXuLeaVyU+V+Cg3e5Bmpl1pkKykdgJWxKhlJnzNjeSZbu3aKD1NGLPsjxJM9BQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(346002)(366004)(396003)(136003)(2616005)(44832011)(26005)(86362001)(186003)(16526019)(31686004)(956004)(5660300002)(16576012)(316002)(478600001)(966005)(52116002)(2906002)(6486002)(166002)(8676002)(8936002)(36756003)(66556008)(66476007)(66946007)(31696002)(33964004)(53546011)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	1biJIdcb0Rjgo24pqqxHMooEyvQB6gArfS0ciBGiqAzGhvyPGO8CpxvXwKhDixtlPCTGJqc09VK53Z+q1bvMQoqn2hcxexgssOxel9OPtP3AXBBVf4yE8iMwcZf0sXYWvPPBKIX2cfFIq4ysdrens4W7FkbwVJNIm3zMZYO/x0gC0h6FY4iKtzlM6iiUK9Hj2sH61Q9FQSN1FZ3QK+0//ClwZCmpDt5tscf4DIELwv1bR37ZTaUJpCRvAPMd3881ey9yqKo0QyhRK122suFN1yud/oYzmdVr5OUTI+HR/vignvoUgPr5B+NF+Ar6QZdRKVwk2qvurpwmyM3oF3lGtHkFlpLM23nm6k+zvEdjAb3iFPaoWlN3dgz7NMX2vYr5LAMJ9A96gr2WHZu8uNwGzgV2Cyzy4Wsw0curB8KPcSsCOBqIxL7321TI8uq3Ay55pQs80Mq8iUhR/LimcWecnY2O9QbdpkInCLGS7SuCzqIJqqBUvZu9THX6EeeFxDlPZ17SAmPklsJ9rGdfsAewh4SwX++QC77Y0pzzgPWw490Ipk2iglcstIMmSCkH7q/HxV1l2hWdEniqG1HcE6uV8QOI1IGasLhBM5+Ssvcnz9mX2qD+Sc/40IippkUr1U+y4UhbOoGqcwppj38ayc9ong==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d787cc8-0898-45a6-22e8-08d83a090369
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 13:02:46.0962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 585wcjor10bLDFUtu4a0EsXNqY39LS6/vNihpDZNVIpI1BoPUKkR1etZizzYKroVeaT1Z8mq5ZrUFnEjUJaaZtopllIT8IdILgShidynu6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4305
Content-Type: multipart/alternative;
 boundary="------------9162BEA0FBC84BB1FB66E874"
Content-Language: en-US

--------------9162BEA0FBC84BB1FB66E874
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/3/20 10:05 AM, Leon Anavi wrote:
> Upgrade to release 2020.7.14:
>
> - Added \h as an alias to [[:blank:]].
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-regex_2020.6.8.bb => python3-regex_2020.7.14.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-regex_2020.6.8.bb => python3-regex_2020.7.14.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.6.8.bb b/meta-python/recipes-devtools/python/python3-regex_2020.7.14.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-regex_2020.6.8.bb
> rename to meta-python/recipes-devtools/python/python3-regex_2020.7.14.bb
> index d09f63840..5c608c989 100644
> --- a/meta-python/recipes-devtools/python/python3-regex_2020.6.8.bb
> +++ b/meta-python/recipes-devtools/python/python3-regex_2020.7.14.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=ee7987010dadc17745
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "a991f73b0ccfe8f6e9a99bd1bc9071b1"
> -SRC_URI[sha256sum] = "e9b64e609d37438f7d6e68c2546d2cb8062f3adb27e6336bc129b51be20773ac"
> +SRC_URI[md5sum] = "c3a53929c3797289566368be4b6b964a"
> +SRC_URI[sha256sum] = "3a3af27a8d23143c49a3420efe5b3f8cf1a48c6fc8bc6856b03f638abc1833bb"
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 

--------------9162BEA0FBC84BB1FB66E874
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/3/20 10:05 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200803140520.23250-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2020.7.14:

- Added \h as an alias to [[:blank:]].

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200803140520.23250-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-regex_2020.6.8.bb =&gt; python3-regex_2020.7.14.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2020.6.8.bb =&gt; python3-regex_2020.7.14.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.6.8.bb b/meta-python/recipes-devtools/python/python3-regex_2020.7.14.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-regex_2020.6.8.bb
rename to meta-python/recipes-devtools/python/python3-regex_2020.7.14.bb
index d09f63840..5c608c989 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2020.6.8.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2020.7.14.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=ee7987010dadc17745inheritpypisetuptools3-SRC_URI[md5sum]=">&quot;file://PKG-INFO;beginline=8;endline=8;md5=ee7987010dadc17745
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;</a>a991f73b0ccfe8f6e9a99bd1bc9071b1&quot;
-SRC_URI[sha256sum] = &quot;e9b64e609d37438f7d6e68c2546d2cb8062f3adb27e6336bc129b51be20773ac&quot;
+SRC_URI[md5sum] = &quot;c3a53929c3797289566368be4b6b964a&quot;
+SRC_URI[sha256sum] = &quot;3a3af27a8d23143c49a3420efe5b3f8cf1a48c6fc8bc6856b03f638abc1833bb&quot;
 
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------9162BEA0FBC84BB1FB66E874--
