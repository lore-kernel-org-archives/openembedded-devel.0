Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.87])
 by mx.groups.io with SMTP id smtpd.web12.8585.1590075204908109219
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2020 08:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=W3uGrrKG;
 spf=pass (domain: windriver.com, ip: 40.107.93.87, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTjCDyrFr9uqgAXZRO9tExeEAxwziuJ17LH6SVnqcvQ+dnsKy2QiNSoDzsFOb/axq52eFpw7vdAwYJq28b8rcsUylE/KLwbKFl/qMUwEcw89xu4W/Cd0E0Yy/hsemgPr7mXMZimCC6b+i9SgAde3w7NC0LeaVhfLHIZtAPmdMT136+7J0adn46nLKKY5ufiyxo5VwJWfIE+nBYpuz4i6aser24SG7nvhLzvEn/hhR/7xrO/2xUlumUepLV7xJ1BT7dCkoesndiO04U6d78yfE9EYGqhYfyhoffVPCIuodjFITJz5tJdUELZMEPyRUSP5sTrNaYSFVcSYf6/+Zt3iCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPmAno6gDrMTZi1pwjBa4FXb6BesxvRpVa5E3ngwI9A=;
 b=U7rFCCaPyzx+YbWyHlTlZAPugidWzEwFROUFQboahsivB4JwIaQ0+VOXQa0LYnhjg17fOF/DdXtJvZbfM8UXomrl59wSN048n/+n3oHpvE2SnFdwOBfza1mPypAxeoZC6j3S6Gz/sFb6qjOgbSAIdCoGxNy0JYK+eHBxgaHgjemSGPXBGL1efXX3eVmS8te77FKl2eBcidj1SkVN8U25vp2vol+Y2EVcnf6p6/6Q37YOuqoLOub81s7sT6zQXo1MBI47RVuOHsNH3XKZKydpbpy/lqU+1e3uh2CfZZOwu1auRfLpG9EfkZEKyXqDgmuTSuMAr33u94ZWXBMZ1fafcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPmAno6gDrMTZi1pwjBa4FXb6BesxvRpVa5E3ngwI9A=;
 b=W3uGrrKG2uxhDsFCxyLwSF67EPxKYbZaX9oiHKDx7Q0xR1qvYWfgbRr/8YF4PBzHAEUDV8A2RH0UhLNRaTja8Dgb6QnQAjFm/BZwfj7wddYXaLgaJh6YVZIChdpN3xBoWRfKGt0ODqbcL1H7SJq8XsvqgtWu3O4i4fO7gMjc718=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1809.namprd11.prod.outlook.com (2603:10b6:404:102::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24; Thu, 21 May
 2020 15:33:23 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3000.022; Thu, 21 May 2020
 15:33:23 +0000
Subject: Re: [oe] [meta-python][PATCH 3/4] python3-aiofiles: Upgrade to 0.5.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200520141502.28254-1-leon.anavi@konsulko.com>
 <20200520141502.28254-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <9d1f0b62-1b5e-0a09-c2e4-79efafec5d3f@windriver.com>
Date: Thu, 21 May 2020 11:33:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200520141502.28254-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0045.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::22) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0045.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Thu, 21 May 2020 15:33:23 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07843286-8f0b-4da1-83cc-08d7fd9c4c5c
X-MS-TrafficTypeDiagnostic: BN6PR11MB1809:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1809A008E43B9CDED8E44C919FB70@BN6PR11MB1809.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 041032FF37
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ekm07u2lqHDZDilQjil4Oq4G/fkd7hMuERqsjZ+3zcyipYGiEV7bghhMJguD8UxOpxpJJFpEQkSV3ZH8cRyPhodZgueHJy9fv89Zr0Iore909/xd1d90YFYPi/+yFbzryO6W7vrlWaUvBy1spfQdu8gy7gx5JvHsoPCk56UFy8+QwcqrVVWlTmt7Kw4sjhR7EoniagmTwXX7eO4VXKIrHhMNJxemzFuiHkALCjm2kHlnZWEhZqFkrVTLaa7MX1vvpE/RLJ0Df4+3RFT7/HMLuS3GQZUZhAX0aa56XTAcYwVQDOPRS/x50XsuvtLdQGTSUL392iK+lm6IN/rfSvc8rlz/VJyWaZ/BgwekyulpNtBw4stn5nJPY/Riu+8C9WKEn+8VxKMIH/TpK1/zsVeOZshXK7GN2V+8cEclBc7JHOFDhnpCGFJa1cMGfGzPFeak0JWqcoZfAutA197PHCI60Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(136003)(366004)(396003)(346002)(376002)(31686004)(26005)(478600001)(5660300002)(53546011)(166002)(6486002)(186003)(16526019)(52116002)(66946007)(2906002)(33964004)(8676002)(316002)(8936002)(16576012)(36756003)(66476007)(66556008)(44832011)(31696002)(956004)(86362001)(966005)(2616005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	TM6Z2QrOy9lOpiMFPF2JPM5NkHp6Hu5EMXhSaD8eIaFKASw/vtxiDnxAx3+gMSUduwwICBCuT9lAA3pv+R7L4SigkV8EBP1B/4XOmz0D8RvFij1g4NQ2RrA5PwHCj8Bjg7UDnItO9bxLp4q/YHz4zjJcfDPcaxXPWEhgBFwfjO8bSWuzDs2VdHf6JxRCepgmUwxqfNVp8F9Z+3kSJ7bQ1Jkb5sUAjzYQo725qCkk1zJqdudy72fS+UlZ57fUu7LY/YtClSGImXE4RVPitn8fCD94fXkGpnWot8azqJbloelA0Jao1HKtm3+t03BnFn2l45vpoKwwQOcj4EDCfCuGJm7D5MNf0ktc6r6+EbMA0qFws9CBeRhoEK6Hcxjb29XjkPS9LL5NFG8ovqncYzJTM4XCRVp1S9ftBg4ZCG/FOgCRLYuiWXdUF7tP5r6x1I8DuBD+4lJqR90pjiw37QVE4IPrtMeZdmmp7YF4yMdYjh4clBEZSe4I6o2sur7zdSUR
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07843286-8f0b-4da1-83cc-08d7fd9c4c5c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2020 15:33:23.4901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w3hD8++xV+TNdpCTyPJJig3FcV3c2yQt0z9UDLcmQRd7bwGMSNSrP6fmV9cnirs6bxFUDVsL2+TAE1jwqQqK1O7O2hX73u0sDFBftBJTFm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1809
Content-Type: multipart/alternative;
 boundary="------------8D8949463DE2C1EEDA5648F9"
Content-Language: en-US

--------------8D8949463DE2C1EEDA5648F9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/20/20 10:15 AM, Leon Anavi wrote:
> Upgrade to release 0.5.0.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-aiofiles_0.4.0.bb => python3-aiofiles_0.5.0.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-aiofiles_0.4.0.bb => python3-aiofiles_0.5.0.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-aiofiles_0.4.0.bb b/meta-python/recipes-devtools/python/python3-aiofiles_0.5.0.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-aiofiles_0.4.0.bb
> rename to meta-python/recipes-devtools/python/python3-aiofiles_0.5.0.bb
> index b21cade52..0559c01e4 100644
> --- a/meta-python/recipes-devtools/python/python3-aiofiles_0.4.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-aiofiles_0.5.0.bb
> @@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
>   
> -SRC_URI[md5sum] = "cb33cf96c371fbd56fc27ab0bd81bd61"
> -SRC_URI[sha256sum] = "021ea0ba314a86027c166ecc4b4c07f2d40fc0f4b3a950d1868a0f2571c2bbee"
> +SRC_URI[md5sum] = "2243eff06072115e8afe8907677ca51d"
> +SRC_URI[sha256sum] = "98e6bcfd1b50f97db4980e182ddd509b7cc35909e903a8fe50d8849e02d815af"
>   
>   PYPI_PACKAGE = "aiofiles"
>   
>
> 

--------------8D8949463DE2C1EEDA5648F9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/20/20 10:15 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200520141502.28254-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.5.0.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200520141502.28254-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-aiofiles_0.4.0.bb =&gt; python3-aiofiles_0.5.0.bb}  | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiofiles_0.4.0.bb =&gt; python3-aiofiles_0.5.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-aiofiles_0.4.0.bb b/meta-python/recipes-devtools/python/python3-aiofiles_0.5.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-aiofiles_0.4.0.bb
rename to meta-python/recipes-devtools/python/python3-aiofiles_0.5.0.bb
index b21cade52..0559c01e4 100644
--- a/meta-python/recipes-devtools/python/python3-aiofiles_0.4.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-aiofiles_0.5.0.bb
@@ -4,8 &#43;4,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/aio-libs/aiohttp">&quot;https://github.com/aio-libs/aiohttp&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d2794c0df5b907fdace235a619d80314">&quot;file://LICENSE;md5=d2794c0df5b907fdace235a619d80314&quot;</a>
 
-SRC_URI[md5sum] = &quot;cb33cf96c371fbd56fc27ab0bd81bd61&quot;
-SRC_URI[sha256sum] = &quot;021ea0ba314a86027c166ecc4b4c07f2d40fc0f4b3a950d1868a0f2571c2bbee&quot;
&#43;SRC_URI[md5sum] = &quot;2243eff06072115e8afe8907677ca51d&quot;
&#43;SRC_URI[sha256sum] = &quot;98e6bcfd1b50f97db4980e182ddd509b7cc35909e903a8fe50d8849e02d815af&quot;
 
 PYPI_PACKAGE = &quot;aiofiles&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------8D8949463DE2C1EEDA5648F9--
