Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.86])
 by mx.groups.io with SMTP id smtpd.web10.1090.1614621084517903677
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Mar 2021 09:51:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KOhWka92;
 spf=pass (domain: windriver.com, ip: 40.107.237.86, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNDg2UHMOHpuHMR04XirmaS0xiZaJ1w74hPUL66At66p42wpsnSFlTGfiCzWwePK3Sq0VLW9iuT+isfANGeVqXzGJ/BVzE6TPEDpylYTEQvtoj5tLTo9tTGe0CLnNzwUiCS+em9kxz8xr/bzHN4mjqw9qL4SWGRH8yy2rGDl3P67HqljOgksZcHLRLvjF2/MpnF15ylkvPuyfd8soN/MXt7zEqHd7zWWHfhtSUpffEatlmAAWQhJ+gDDAgVKj/RiVGu15N4iNyz3UBBuol1Wjf+WdkgIqUedgGYE36SNjJbRVGZqx8hSCTQYXabc5ggczq8kICCDRwVmJICVxJBPTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0CN46Cl/wldKRDvRSF2VM19bi7iXqMaYoKoIEF0Oys=;
 b=LkXWmcn+ZF7ZxNaAU0SJAayOOqiiGL/7S1QNpUglKwn2jcYtSS9MR6c+2NKHnM7b+wtEqKbDZyJ3XnlAMDUhXacD+e8TYeC8fyA3suzK9LvZeC6Vx0bjzL30xuPoz3CVpwEV9IPHbvRhIP//BP9Hd8FywZ+/WU1oBe9sY34qPZlmggnN5GMFiPzQ0JKtM1mhap1x+nJ6v60+tg9z2ldQcYV4WWAshyGVu7eJWdtuyu/0qlUVVVUN0zhyEoTMhUynTZGizQRGA9ctzOe7jFVK/IjvTqsDmOv22PxIfRuplxBEymgieP7sbUmrx8lfGtr1HAQQEZKxyAyy446EuGdnjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0CN46Cl/wldKRDvRSF2VM19bi7iXqMaYoKoIEF0Oys=;
 b=KOhWka92hKnEP/emfkVMT9LaoK22HzqOJG7VXskAnenNDYO8hgO4aenYCseb/z/Mp0RtMV+eX+HxpP5GouoICXj/iXlgDjAOBPNpggrBndzyAoI2b1kng/R1iAO+Oy451wmFYXdrHjC+KtGu7FjXzHEhTPv25Mx96eUffzNsT1g=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3447.namprd11.prod.outlook.com (2603:10b6:a03:1d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Mon, 1 Mar
 2021 17:51:23 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 17:51:22 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-aiohttp: Upgrade 3.7.3 -> 3.7.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210226110931.6287-1-leon.anavi@konsulko.com>
 <20210226110931.6287-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <41fa123d-6787-8d97-7035-dae776760ac7@windriver.com>
Date: Mon, 1 Mar 2021 12:51:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210226110931.6287-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN0PR04CA0197.namprd04.prod.outlook.com
 (2603:10b6:408:e9::22) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN0PR04CA0197.namprd04.prod.outlook.com (2603:10b6:408:e9::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Mon, 1 Mar 2021 17:51:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3635bf5-79d9-4bf3-52f8-08d8dcdaa08b
X-MS-TrafficTypeDiagnostic: BYAPR11MB3447:
X-MS-Exchange-MinimumUrlDomainAge: github.com#4892
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB344748B7ABE3B55777670B169F9A9@BYAPR11MB3447.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oo2yIQxG64qnae6UY2LW3Cy/Mg2XHdbJcn4f77ArkoM18Or2f3lR1yww2PZPWvUG8+40qVXYMkaQOgm2jBS4wHmjdT4cD++16KrO6dC7H9Pk4KHcMDbXeUoy+SRlSK2ywrAbYP3gGZtFWnqgPmSnrXw7cd4HcphEnAPWDkjg9xYoPwe3Bs4+gpAW23M3zfUne+H94ulIU2yUBBrMzH/wHiu7MMbnb6By+XX6cc9oh3a0B+UH6081g524OKbnLT05yyeWorCjefLU670g9QqNS3dNJgabYEOSmRwagxNUAlWSxzrxOiBiwVn1zTOwVx9o3jfpOD8UAJxUCRkM3a4Rku4aMhmQVzA2+ZV1dC/0fFozaNIBQZed9Inj8snAwq6Hs0kLXXZWXFJpLQwu32OIlsaSBQZLN9CHC5jbBRBcFK3lXFIu+/VYDAOtAlTAf21eK0l8RQZrjGikKN4D2oM40Y7OAbKowJMN3Psb1BhdaWoLra35aWlwlD6kK3YrXoJnW9cmDJXdW7EP6JyHhOMViE3sAAohJu53zHd3oA5PGmn21UyVszlMKJQzx5KnjdJWsivA6kZg5mQEETCg8l/KlF0YXaGW8ss66lIWlxqQoEaWr7TUI4LXU4YPwpaLroQS2UY7rTGVPUP5U2jJkyxi1uRuExq49ytNCW8SEJnK7AZWh4lXJtJnp7xa5O3ag9B/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(39840400004)(346002)(26005)(86362001)(166002)(83380400001)(16526019)(186003)(5660300002)(316002)(16576012)(33964004)(36756003)(31686004)(2906002)(478600001)(2616005)(956004)(66476007)(31696002)(966005)(8936002)(8676002)(53546011)(44832011)(66946007)(6486002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?aHBFRWJnQVpPdWFhK2lTMUFPai9qaGQ5dkdpemhQMGxlRU9xMnpScnFoVGlj?=
 =?utf-8?B?TUJXcWhIVjkvRnpYcVRzR29YTnp1WXZvQnN5MVNIdzlMUCtUdEZIdlNpN21B?=
 =?utf-8?B?dldHSE9BaDMyNjVRZ1NZTHBwdno3blF5bGFwYkhGbUhCMTMwaTJKWWo5OENH?=
 =?utf-8?B?L1FmSitoY2FvdmRiM2dlZnhYUk5oY0YvcklJVmJPYVlqc2N3NldXNWNBc0tV?=
 =?utf-8?B?NHRGb1duT1Z5cDdlNURydUpzRHFxY0VRT0JiZDRPNEIvZktXTDlVdTZHU2E1?=
 =?utf-8?B?Q1FzdnkxMThyUXpIRXRpVkdzM04rUE9qZGJDdGdCNHV3RFdFS0lCaElIRG1m?=
 =?utf-8?B?dkhaaVZJRTYwbXBCY3Z6N0k5U2dpb29GNzNYVDE0TU9aZDE3Yy9EcEEyTmlU?=
 =?utf-8?B?NUNmemk4UTlyYUFGN2hMNXRNNHRyRzBKT3ZqeFVnQWRreUlQUndLWU9iSEl1?=
 =?utf-8?B?c1FVcTl3Q2VzaDlma09xVmUzS2JGbEluREtRSTJNMHRNK2t4NndQMWErb2JT?=
 =?utf-8?B?NVIzN1NHank2MVBTdnM2dDRmekZsME9rc0R0NkpZcGEwdFNxOVVPbEs4U25M?=
 =?utf-8?B?WnVETlp0aFJvem5HYUU0ODlVUXVUam9Lbm82dlpsbWlYRHJiejF3WVZDUWtm?=
 =?utf-8?B?VStkMGNPMmZoYVFZTC9mdzRBOG1IZEZ1aklmKzdoNkhKN2EzTDVqUUFjb0Rs?=
 =?utf-8?B?MmlmZVZQNDdidlFNY25TNFpoY20xZ1haekFjSWZTTWJmL241U0VPMG1TcG1l?=
 =?utf-8?B?WXMyNW1ROXZIdno2UllGbVF1QjhIUnlOck10YThya1ZmdmpxVW9ZWXdSYVhH?=
 =?utf-8?B?SGNuL2ZwTXdoV2RhUTg5dXZTZHJBTGRzcjM3MlJydGpDZzlaeGFscEUyVStC?=
 =?utf-8?B?TDJHM0J5bzcwVzJiRFJqOUYvU25BcVVhRTdkdWE5NFQ0Z3NUNFRsVUZ2UHhP?=
 =?utf-8?B?VDJIRXg5aDgzL1l2eWxDanNaejk2RHlFRm1NQ1JSY25pYThHMGFRTU02NHdZ?=
 =?utf-8?B?MDB6M1crSVFibjJVdE53YlE0M1Q5eVpWTlY5TEk5SnJka0h6ZjdpWFdvc0Zl?=
 =?utf-8?B?YXZOVDhmN0hxSkJVNDRKRHJyeHZueitIcVQrbXh6N2pGbFZwMVExVkUza3Q2?=
 =?utf-8?B?TlArUjd4dzFmR0YvbmxFNXUrMFpNVC9QR3JicHJibzlzSzVHOStyRmRmSVk4?=
 =?utf-8?B?YUFvZ3JGdVliaEsxNzFiNVpFbmRLRy9XelNiWjdKWkxRejkxTlZsQTNJREp3?=
 =?utf-8?B?VDFFS2dETFhvbXFqZWlENSs3L2xLVXpNR3JvU0tJVHRhY2p2cDV6aG0vWkFx?=
 =?utf-8?B?T1ZFTHNwZTR5M2dmczVaS09iYU0wVWhlZjJwdEhKdWVibUYvMDBSbUhwNmph?=
 =?utf-8?B?bDNGQjJiTk1EMVFwUlhtRWZmWkdobGdldmR4OVNHaFB0OXlSZC9ySFdFMG1D?=
 =?utf-8?B?Y3ZUYVM2dTFpYmtsY1ZWeWZnRVVDMnVicjZZeG5ldk8xZENwMW5NSW9raWlq?=
 =?utf-8?B?bjBWN3UzdDZQN3RpbGVvcFVTRHlhWjB2VXVYVXlnRFZ6dmhoQXZjTmZscVd3?=
 =?utf-8?B?SzdodWJkN1pZZGJFNDRNNzY0YTNRZDR0MUlidWdMMXhVd08zNHI1WEhXcXNl?=
 =?utf-8?B?UWlvN2g0cU1LUnV6NGpFY2lJRkh1QVdxKzRnQWh3SGV0cHQxMStJc0VGVTlM?=
 =?utf-8?B?U1ZndVg4SXpvbWRTS2RERUdBM1JCYlVzZ1VYRUc5Qm9wZk1RMTdZQXNucmla?=
 =?utf-8?Q?iAqqNm1RhGRXmpdnN8B/3Hg2PsVUp2oH//c0TzN?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3635bf5-79d9-4bf3-52f8-08d8dcdaa08b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 17:51:22.9410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cAjMQ9/tJpF+1Urhr9UlLJ225YnnoZ0rKSAaVjKX0UZS/VFefp8CDXJ+3BLFwrj+gfAxiyrQ6MJTvT0eGvp8VerV4tl6f01XSsiEclSzKTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3447
Content-Type: multipart/alternative;
 boundary="------------8E3D637803547CDD6AB1080C"
Content-Language: en-US

--------------8E3D637803547CDD6AB1080C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-26 6:09 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 3.7.4:
>
> - (SECURITY BUG) Started preventing open redirects in the
>    aiohttp.web.normalize_path_middleware middleware.
> - Fix interpretation difference of the pure-Python and the
>    Cython-based HTTP parsers construct a yarl.URL object for
>    HTTP request-target.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-aiohttp_3.7.3.bb => python3-aiohttp_3.7.4.bb}      | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-aiohttp_3.7.3.bb => python3-aiohttp_3.7.4.bb} (88%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.4.bb
> similarity index 88%
> rename from meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb
> rename to meta-python/recipes-devtools/python/python3-aiohttp_3.7.4.bb
> index 5d62e0676c..63d6783891 100644
> --- a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.4.bb
> @@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3bf3d48554bdca1ea7fdb48de378c2ca"
>
> -SRC_URI[sha256sum] = "9c1a81af067e72261c9cbe33ea792893e83bc6aa987bfbd6fdc1e5e7b22777c4"
> +SRC_URI[sha256sum] = "5d84ecc73141d0a0d61ece0742bb7ff5751b0657dab8405f899d3ceb104cc7de"
>
>   PYPI_PACKAGE = "aiohttp"
>   inherit setuptools3 pypi
> --
> 2.17.1
>
>
> 
>

--------------8E3D637803547CDD6AB1080C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-26 6:09 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210226110931.6287-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 3.7.4:

- (SECURITY BUG) Started preventing open redirects in the
  aiohttp.web.normalize_path_middleware middleware.
- Fix interpretation difference of the pure-Python and the
  Cython-based HTTP parsers construct a yarl.URL object for
  HTTP request-target.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210226110931.6287-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-aiohttp_3.7.3.bb =&gt; python3-aiohttp_3.7.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.7.3.bb =&gt; python3-aiohttp_3.7.4.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.4.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.7.4.bb
index 5d62e0676c..63d6783891 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/aio-libs/aiohttp">&quot;https://github.com/aio-libs/aiohttp&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=3bf3d48554bdca1ea7fdb48de378c2ca">&quot;file://LICENSE.txt;md5=3bf3d48554bdca1ea7fdb48de378c2ca&quot;</a>

-SRC_URI[sha256sum] = &quot;9c1a81af067e72261c9cbe33ea792893e83bc6aa987bfbd6fdc1e5e7b22777c4&quot;
+SRC_URI[sha256sum] = &quot;5d84ecc73141d0a0d61ece0742bb7ff5751b0657dab8405f899d3ceb104cc7de&quot;

 PYPI_PACKAGE = &quot;aiohttp&quot;
 inherit setuptools3 pypi
--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------8E3D637803547CDD6AB1080C--
