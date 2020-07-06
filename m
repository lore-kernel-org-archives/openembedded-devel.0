Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.69])
 by mx.groups.io with SMTP id smtpd.web11.60759.1594050214912744291
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=F45hGb0y;
 spf=pass (domain: windriver.com, ip: 40.107.69.69, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WCh1Bt6bwG1IAkBh74ml8uG8DVCl5Ju8VDxI8u1EY5fTraLjLeummikbq4llZni1UcsIhZCZVtxhH+WgR1qmjNJ27AHtCMahLbi2Ua1KFnGAd0In3H88tylYnl2d3+3A0wlYlfJFt2p2favxRTlJ69wY1K5+V2M3H2k7fyXEy3hPZRdxIMPOGkSqy14ZLfLmWafBBrSNlWOLEB5khafb/+7bYdT75J2lrc43OOGukyGXQiZrFg+fa/6s6W86M0HX7pWnBja7BZC5V5dCLKpVJ1KoNVP3RNjEUizsKkyV1Xr8f91EJhh2847g4bVr4sC207a3ac3kRxyqgk57hfkBOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8jyA4yrNPdwod6tLKdbBoSmWTtOcus9wHZwrfUiIG4=;
 b=LA9xdzEGC9mdyRsSF6d20qMTlZnyWsSxGrsrYIZk2bmAQiVDT8tdb5jEvoseHUwIAffrdyANfKJloinSxf/NuR2b6GGGFxO7TXDTSWrFidepIHsw2k6VUgQkzddEuQJfFPWFu2MeAAknT1+QzxPysakAECFTPYvKfUlSdXlb6w76jahbbvzprM4DO+/rv5DaaiuCpBgMEsmIxfwVBcKpDHDXjbp3yTdtvG+necW7wbDK6Sgqe1Lnc2OIQBlEMJg3xPcNeRgRzsg5dfeQW3ulr+nTw8DRTb968Ha7FJGXuNvYMA2D4JAdzTw0g56Z43Kavj26mQO+ZFZgoGEmglp+Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8jyA4yrNPdwod6tLKdbBoSmWTtOcus9wHZwrfUiIG4=;
 b=F45hGb0yPy4hRpcI79UWdld88v3SQVoODURRJ/cUU1mi1RT2nZxiAqRqmiLOEtCBaEzYZ69HM0TL8aRORYO+yAjjL1zHokISPT2q8tEwApDwjeCw4puK/P7K5UA1UZ1qnz80P4mtoZ2sLlvFd5st45dmQREqmMXgnPVA3N59r4U=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM5PR11MB1899.namprd11.prod.outlook.com (2603:10b6:3:10b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.27; Mon, 6 Jul 2020 15:43:33 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:43:33 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-stevedore: Upgrade 1.31.0 -> 2.0.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200702104819.14256-1-leon.anavi@konsulko.com>
 <20200702104819.14256-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <fab227e3-72c4-40b1-71a5-166e58072342@windriver.com>
Date: Mon, 6 Jul 2020 11:43:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200702104819.14256-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0031.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::44)
 To DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0031.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend Transport; Mon, 6 Jul 2020 15:43:33 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6710faf-f0ad-41fe-f7d4-08d821c35733
X-MS-TrafficTypeDiagnostic: DM5PR11MB1899:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB18994E7D4C879BF1EE32202E9F690@DM5PR11MB1899.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r5nYqguAFqkuRweWOMdZ43zF4uZX2RetRl3VCTPagN9ZCdC8ZXQqsGSmgOYvO5t48QSRAU6yObwYEWVfm7UuR73UlAy/RkB5Q80eGqW7I1Ecnq0Zz5JxLroq/trzenNmbj+nHgnbc1Iiuew8kMUONKnBJVY3kwwwTpqHZD209aEtTSOlvPAMUY+IL85Rc/d5b/l46BxuBMgrWPSTW0+XeIwih14t5+UZ0IBu3UOguJoxpCNhfmwCUkPPJ0o7QFuiVcNicnUqJ+2XlV6ET8YR02vBUEBYuLwsLWCOTm6bQkimlyrAMDX8hSxIW28hWOQBCCFa67wes9Jyizq/Pywl4XKq4KcdmDD9Moj8lFNYqS5ooaWUn8ryObp3dliCibCkA8hXa3ZOokBrabrh6O6y7dM9niF+qsiZ/jrF67rGjMx4lD09abO6ifCJg6dZPjUXFZHKLF4es6YL/UfHi5ZvnQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(346002)(376002)(366004)(39850400004)(136003)(16576012)(5660300002)(31686004)(478600001)(86362001)(83380400001)(31696002)(6486002)(966005)(36756003)(316002)(956004)(2616005)(186003)(16526019)(33964004)(44832011)(166002)(52116002)(8936002)(8676002)(66946007)(66476007)(66556008)(2906002)(53546011)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Ynhn39rYjuJCl1wSRIN+yWcJmlZjYMzbo8jYqSMh6VmzbfwklrRXy+svkR/MgK/9t31zd9cTJzWVAbOlLNBQ/b/P05tp12raFUdyxLCJa+/dw6TVmv3XPHrl3v9L64v6z85S7BPjYDUAGNAXZAbgOGX2RJlMEZlK7fVexJaM1QFlqu93rO29dRlsaiU3hb7aZ8u/8AzXPH8sCicxOoJ31HygurSZmZPi683MS4it/kRPKgf8Kfx/IGeZidY2AZFMm+fjDHvhs8Dlu2R9xJqdaK+M140jHXHl6Ygn07ebmIncf2YqJpqztgsuHWjAqlIZQ0p70lecveua1+uG+BvamRLG9AGGVYN153pgkU45A9Rv6jBXN96Uda040iezycot01TYCQBKj1sLE/kqUVed9pRseUA9+YzFj1D975KbKR89kGbbegLnp2VGxRDjEzzP609eUa07wHon0YWKt+bHXenbucrNmNCOD83ijf9UMKe6OEqrMI8c3mH5n77Ld7Hw
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6710faf-f0ad-41fe-f7d4-08d821c35733
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 15:43:33.9527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6gzAqXYdGRg6TJmUmESTJtlDk0eSaTp8a78mcDwunG6qRUcMFhUTbWBeiF4lAqFzP18oDQhSnF461ftEPFG+ckm37/S7REg7thcCTDXddAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1899
Content-Type: multipart/alternative;
 boundary="------------D3B2568DDFB056E028E73CF8"
Content-Language: en-US

--------------D3B2568DDFB056E028E73CF8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/2/20 6:48 AM, Leon Anavi wrote:
> Upgrade to release 2.0.1:
>
> - Stop to use the __future__ module
> - Switch to newer openstackdocstheme and reno versions
> - Add Python3 victoria unit tests
> - Mark sphinx extensions thread safe
> - Remove dead files
> - Drop Python 2.7 support
> - Update master for stable/ussuri
>
> Update the HOMEPAGE because Stevedore is now part of the OpenStack
> Oslo program and is managed through OpenStack's infrastructure
> system.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...thon3-stevedore_1.31.0.bb => python3-stevedore_2.0.1.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-stevedore_1.31.0.bb => python3-stevedore_2.0.1.bb} (60%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-stevedore_1.31.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_2.0.1.bb
> similarity index 60%
> rename from meta-python/recipes-devtools/python/python3-stevedore_1.31.0.bb
> rename to meta-python/recipes-devtools/python/python3-stevedore_2.0.1.bb
> index b985ca5b1..cf388fa7c 100644
> --- a/meta-python/recipes-devtools/python/python3-stevedore_1.31.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-stevedore_2.0.1.bb
> @@ -1,10 +1,10 @@
>   DESCRIPTION = "Manage dynamic plugins for Python applications"
> -HOMEPAGE = "https://github.com/dreamhost/stevedore"
> +HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>   
> -SRC_URI[md5sum] = "42fa2bf0251c96b543765c5ce13f37c9"
> -SRC_URI[sha256sum] = "e0739f9739a681c7a1fda76a102b65295e96a144ccdb552f2ae03c5f0abe8a14"
> +SRC_URI[md5sum] = "d0f137ec4fe5d98978970671a860882d"
> +SRC_URI[sha256sum] = "609912b87df5ad338ff8e44d13eaad4f4170a65b79ae9cb0aa5632598994a1b7"
>   
>   DEPENDS += "${PYTHON_PN}-pbr-native"
>   
>
> 

--------------D3B2568DDFB056E028E73CF8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/2/20 6:48 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200702104819.14256-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.0.1:

- Stop to use the __future__ module
- Switch to newer openstackdocstheme and reno versions
- Add Python3 victoria unit tests
- Mark sphinx extensions thread safe
- Remove dead files
- Drop Python 2.7 support
- Update master for stable/ussuri

Update the HOMEPAGE because Stevedore is now part of the OpenStack
Oslo program and is managed through OpenStack's infrastructure
system.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200702104819.14256-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...thon3-stevedore_1.31.0.bb =&gt; python3-stevedore_2.0.1.bb} | 6 &#43;&#43;&#43;---
 1 file changed, 3 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_1.31.0.bb =&gt; python3-stevedore_2.0.1.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_1.31.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_2.0.1.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-stevedore_1.31.0.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_2.0.1.bb
index b985ca5b1..cf388fa7c 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_1.31.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-stevedore_2.0.1.bb
@@ -1,10 &#43;1,10 @@
 DESCRIPTION = &quot;Manage dynamic plugins for Python applications&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/dreamhost/stevedore">&quot;https://github.com/dreamhost/stevedore&quot;</a>
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://docs.openstack.org/stevedore/latest/">&quot;https://docs.openstack.org/stevedore/latest/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57">&quot;file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57&quot;</a>
 
-SRC_URI[md5sum] = &quot;42fa2bf0251c96b543765c5ce13f37c9&quot;
-SRC_URI[sha256sum] = &quot;e0739f9739a681c7a1fda76a102b65295e96a144ccdb552f2ae03c5f0abe8a14&quot;
&#43;SRC_URI[md5sum] = &quot;d0f137ec4fe5d98978970671a860882d&quot;
&#43;SRC_URI[sha256sum] = &quot;609912b87df5ad338ff8e44d13eaad4f4170a65b79ae9cb0aa5632598994a1b7&quot;
 
 DEPENDS &#43;= &quot;${PYTHON_PN}-pbr-native&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------D3B2568DDFB056E028E73CF8--
