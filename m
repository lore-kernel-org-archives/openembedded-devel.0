Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.49])
 by mx.groups.io with SMTP id smtpd.web12.10254.1599060676374066061
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UNA3mrvK;
 spf=pass (domain: windriver.com, ip: 40.107.243.49, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSP8e+L+6q/sZ/CDnOMa8Cog6t1ZZ9yinA3SFm+7snzI0EPGJovhpJx7v5Vwru0RiBUbgfmAiZWqz+87qENe5qd33yLpadysonXmTx93UL8+JvsJMEUYSi7gIbnh4zEDwYsR8G54PIWcgbakp8B+d5I0ehsHNTmKBU0OKmjIUBPjCFZTB2Dz6g86hw30ZUdJEAiJcRrmblIAANifJU0xMrAczyJHZZnNECh2WQrBqxbpeMZyXv0LAclaiqjsZLuOZIm2jjYea/JinUyp8xZTmevFNCAqEvgJKDux0OHjigWgq2udYKPIkY78PUu7dkxHGLQIkgSv4cCPQ64OWv68TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsnRKqnOmIjZQoPE1BOvhq83OhbL8+Oo2w2Q2DM6Zf8=;
 b=GUQ75wEhhtw115ixeTOLpcxpQ4hx52w35rtZIFBVHx73jp6S1BSn6B//5Harj5o5ZZ3WYVBeak4otvKJTGZzqLYOHmFC+UUbOYDsi2v7oQkkRy2IAcW08kk4o1I+pHBVp7tXsX710lV7DCRGdzvXE2iCDmp2FmALFI2BZETAQCnuKDNZh2UXf86p33ZmQ5/6gh4DP0ghYE7wer8lV6dVXOp6xKWt5jpfaCDKUUPUFartO3xj+w7IUs0+rXr9qVN88XZGObN1Ee9KHKI6ABVt5AuU/iCVsScDdHcZXwVDfs0a+dMdnkSayKY7Nv0/mS0FpKj1oU0HqXjHgi7WqAgi1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsnRKqnOmIjZQoPE1BOvhq83OhbL8+Oo2w2Q2DM6Zf8=;
 b=UNA3mrvKPDQVnZbRU0/+vL+0+nrhqYJRFnRoS7GaN2+JtpZBhqPOTCwKCx63RaqcBhwZ2UK7MkEZFpQ1ut1Fsr5kOFa4hVG8QzJWZ/ZWe0BAA9Vy+siaQfoMGTBuHLh3xAxEB23upocVNn7O+xAg07w+JPImpAc4Z8C4lNtSk8k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3815.namprd11.prod.outlook.com (2603:10b6:a03:fa::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 2 Sep
 2020 15:31:15 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 15:31:15 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-traitlets: Upgrade 4.3.3 -> 5.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200901081147.13556-1-leon.anavi@konsulko.com>
 <20200901081147.13556-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1f516dad-75cb-3231-7d5a-3cbdc2669314@windriver.com>
Date: Wed, 2 Sep 2020 11:31:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200901081147.13556-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::16)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 15:31:14 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2542cd1e-e487-4deb-cb80-08d84f553ad5
X-MS-TrafficTypeDiagnostic: BYAPR11MB3815:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB38159313B6B5B15EDF2D95E49F2F0@BYAPR11MB3815.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ryf8wXETEus+O8zdobJK1leoIlV3IXUanlGdomwI1iTOAA5WEBGRlqdxQ+Sysa80KoEpXNqZaMSGvda7rhB9Tehpoy8Jzqch6HhA+tP3MZ9RixXyQhhlU4cSzwP8aFT27dkCsLAQwPuUtTXOQUU/GvGUaVPqB3vbej7/+U5sPMJeL0i/6LC5v5AWvfDEcNvZmKiaSeBKGsZml2Sy65YeFBG9hnSuDDwY7H92pn05Oz/IdYWIXF3PlaUI472ibbYvar6OMaG4M/Vpj9k/PGQsfvbmFdBDRo+JyuWsHtwm1g5vK8FWwPOKcQaoVk+lMpVaDofLYY8bJmeZnqsBeTCDL4yuubX1vV6FjThU4cD6jFtCtQFoho6psWintBDD39YyH+UFnFnmlvWgRZuh8AwFSScA5OQs6MeFz7bIPwkQZrpUSmHgDomvvhR6NNT1P2y5irAADWyhiY3n0GlamfAw2Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(346002)(136003)(39850400004)(316002)(186003)(33964004)(966005)(83380400001)(6486002)(166002)(8676002)(956004)(44832011)(16576012)(26005)(53546011)(2616005)(52116002)(478600001)(31686004)(8936002)(2906002)(31696002)(66946007)(66476007)(66556008)(36756003)(5660300002)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	J2xHSwcu/Ba5moQ9NChCywbmxLlnnnWpOuebUEeQUe1NQ7VIP/CNMeEOaEOympTrrGxS3MCc3qvyJVWyR80Ivlv9rMWUU1+pJ63itmf8VYrMRpFMsOj93m1if9UTwBMY6rym3Tn2LGBhuHoxkNdiDjt9un1nfXzZ6iXqTZtalrOORLfeViybgrjkFqvtYPyCesLDTg1j4yZnVllpYYbl/XBSE18ITFjs/XG3C64TxA6HMzRRIsyVxXFRatsMEV/WajXvQq3N+K7yrOUaZIuiT6qNSYjJ2OiGqxCoae1KPNnuA/frqv2yss53xU8hZuavam7dfI+vTTov3o7Jn1MgIaRj9fEDy1ibobhb8TnwYdyVj0nfuNRXTaY/3qOgobcpMODa/neCxpk/AY8h62xzvUjKDtNWV+OuRJIAK6eq4FEiZwzmtpRVuMZd5/5eJ1BA9zk0WV8Z3SY+AYTSVIJoNFOlSmb7J2KbjISHrXvdhSYOwc59D8nC4TYXnBJF4ou1C/DpdrvCXhuXEVTvNvYrtL506zqzp/hxwC8atwax5zoqfQ7NLfLXIGC3rm/bAG8HBlBteZcD84ssA00d2gX81q79tHM5kPEiY/B6BuWtF9UupU9WjVh4YfakiOEt0vsyocshLNe1R8MjHla5wLy9mg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2542cd1e-e487-4deb-cb80-08d84f553ad5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 15:31:15.3188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yukpBPozMfu3fQqQ9UIl69KLy59PHk849DL/U7T+OmGAGj/7khkf563TDPf7ITc5W6SMaeYsrfkGQ/h0JSdC87hIFsK8jP6xim4urH1C+54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3815
Content-Type: multipart/alternative;
 boundary="------------49B949F9266482E164151837"
Content-Language: en-US

--------------49B949F9266482E164151837
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/1/20 4:11 AM, Leon Anavi wrote:
> Upgrade to release 5.0.0:
>
> Traitlets 5.0 is a new version of traitlets that accumulate
> changes over a period of more close to four years; A number of
> internal refactoring made the internal code structure cleaner and
> simpler, and greatly improved the diagnostic error messages as
> well has help and documentation generation. Major changes:
>
> - Removal of Python 2 support,
> - Removal of Python 3.0-3.6 support
> - Follow NEP 29, and are thus Python 3.7+ only.
> - Remove six as a dependency
> - Remove funcsig as a dependency.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...python3-traitlets_4.3.3.bb => python3-traitlets_5.0.0.bb} | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-traitlets_4.3.3.bb => python3-traitlets_5.0.0.bb} (69%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-traitlets_4.3.3.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.0.0.bb
> similarity index 69%
> rename from meta-python/recipes-devtools/python/python3-traitlets_4.3.3.bb
> rename to meta-python/recipes-devtools/python/python3-traitlets_5.0.0.bb
> index edfb3abfa..8aa0ce5ba 100644
> --- a/meta-python/recipes-devtools/python/python3-traitlets_4.3.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-traitlets_5.0.0.bb
> @@ -6,12 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING.md;md5=eec4de4d599518742e54e75954e33b46"
>   
>   PYPI_PACKAGE = "traitlets"
>   
> -SRC_URI[md5sum] = "3a4f263af65d3d79f1c279f0247077ef"
> -SRC_URI[sha256sum] = "d023ee369ddd2763310e4c3eae1ff649689440d4ae59d7485eb4cfbbe3e359f7"
> +SRC_URI[md5sum] = "3dec5b73409c07bf48cd5db220431ee9"
> +SRC_URI[sha256sum] = "0d9c4005506b306b0a99551e96174b8bedc675c2dd048f92b3bbbb7d86ac93a9"
>   
>   RDEPENDS_${PN} = "\
>       ${PYTHON_PN}-ipython-genutils \
> -    ${PYTHON_PN}-six \
>       ${PYTHON_PN}-decorator \
>   "
>   
>
> 

--------------49B949F9266482E164151837
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/1/20 4:11 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200901081147.13556-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 5.0.0:

Traitlets 5.0 is a new version of traitlets that accumulate
changes over a period of more close to four years; A number of
internal refactoring made the internal code structure cleaner and
simpler, and greatly improved the diagnostic error messages as
well has help and documentation generation. Major changes:

- Removal of Python 2 support,
- Removal of Python 3.0-3.6 support
- Follow NEP 29, and are thus Python 3.7+ only.
- Remove six as a dependency
- Remove funcsig as a dependency.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200901081147.13556-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...python3-traitlets_4.3.3.bb =&gt; python3-traitlets_5.0.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_4.3.3.bb =&gt; python3-traitlets_5.0.0.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_4.3.3.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.0.0.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-traitlets_4.3.3.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.0.0.bb
index edfb3abfa..8aa0ce5ba 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_4.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.0.0.bb
@@ -6,12 +6,11 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING.md;md5=eec4de4d599518742e54e75954e33b46">&quot;file://COPYING.md;md5=eec4de4d599518742e54e75954e33b46&quot;</a>
 
 PYPI_PACKAGE = &quot;traitlets&quot;
 
-SRC_URI[md5sum] = &quot;3a4f263af65d3d79f1c279f0247077ef&quot;
-SRC_URI[sha256sum] = &quot;d023ee369ddd2763310e4c3eae1ff649689440d4ae59d7485eb4cfbbe3e359f7&quot;
+SRC_URI[md5sum] = &quot;3dec5b73409c07bf48cd5db220431ee9&quot;
+SRC_URI[sha256sum] = &quot;0d9c4005506b306b0a99551e96174b8bedc675c2dd048f92b3bbbb7d86ac93a9&quot;
 
 RDEPENDS_${PN} = &quot;\
     ${PYTHON_PN}-ipython-genutils \
-    ${PYTHON_PN}-six \
     ${PYTHON_PN}-decorator \
 &quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------49B949F9266482E164151837--
