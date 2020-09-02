Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.71])
 by mx.groups.io with SMTP id smtpd.web11.10206.1599060540273383848
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:29:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=miBku2s6;
 spf=pass (domain: windriver.com, ip: 40.107.236.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZsmeLWnZaEDWTuUvADXq0DbspiHa7hf4bqXSLyUd7FPyY9no6pCHN6VaGo/ndrAO3BdU7ZLKtSG+X6rEECuT4BvknnOwabS6zB4jcUqvhL7dVPrWPtlf/GXIS3Jdxt4w8D5Et7ZNnKqC/TJvf1opvZhBV1TwLbXahnLEDHgXn/aoAZ9Y0HW92vSxTfZ4e/oHkuhDRXbp27sfeBNQRcnmp0k4kAsHRv1vLhDgyE8zYI8GAm3CwIv579v7TnskCs61vJ9tmVnxAsLvuXJFTByIkj75P3Guaj7wferYSTu7WSqxX0Q6/LbXi2OOdr0cj2/fGPYWk2uCXw1UbE7XvkZgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwgYFGjP4/ZHjpfAnI71ehpT0eF5FTleo4hu+yzAuzw=;
 b=FAY/TcUs+tupNtCCAkmtlM+pN9IjIggrSRU2TLyxEP/3HL81p+BrGcc+h72wNVJC3Snh3MdeMgyTInQr+unAoIhQY2j/3tQewTdz8jeb3LmGMfcRxCy0iIf7X3RuoswahOftScEs0nYAL/iPiBuGnNU7hmnBHDTArtB3M31mVVmxBZC6u/XEUIZ7BRqe8u0KqInmpx0aQTqSTBpS3Oqo5Qm8/CUbqIIluHwO7lVx9hk9IkeC4dM7D5zOKp7Oh+0QZDUX/GOlZe6kOjpQ0GtrkvO4b54rW6Sw9ohmfPjUl4KlPXmVAuTqgVHpY/XMiDuX5Wd2vTsAcffO6cCtk5JfGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwgYFGjP4/ZHjpfAnI71ehpT0eF5FTleo4hu+yzAuzw=;
 b=miBku2s65/a4KP++oQd9D/6sMRxIk+1XjToqaIVzQPXl037JG51P5+AoWdq+5dqgrKov1Y10HU9T0Z0J/n4Cjt4VttBhxj2MltuVgOjkM4vvpMfmvyHAngzGlSXaFUh3Ap7EuXZJ2rPEW5S0Qy+73A7kVEOUsx+RRHb2my14bbI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3030.namprd11.prod.outlook.com (2603:10b6:a03:87::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Wed, 2 Sep
 2020 15:28:58 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 15:28:58 +0000
Subject: Re: [oe] [meta-python][PATCH 02/10] python3-sh: Upgrade 1.13.1 -> 1.14.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200831070318.6573-1-leon.anavi@konsulko.com>
 <20200831070318.6573-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8498403e-7490-7d3a-6a4c-a60ce73caa93@windriver.com>
Date: Wed, 2 Sep 2020 11:28:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200831070318.6573-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0010.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::23)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0010.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 15:28:58 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f90c7b7-ab16-4796-0074-08d84f54e968
X-MS-TrafficTypeDiagnostic: BYAPR11MB3030:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB303036442641B94BB636D5B89F2F0@BYAPR11MB3030.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hb43swXzLxjot/S8H5dNNr+XHCz/LPjH/+d9/2lRKaYP4SENIphi6z4YGeSXFAfuYWYFESnLdf8fZ6wUAsJ+fDWltGR4IGMoFV/fR5Klqz5ZgOXRvYTsok1xeCwEHQRzp6k7WL8g/E9Gc89VSBK6qMd43FokQL8egpgGyRzHhnXQiaoYIrb0gAH6RSbwEpMUJtz3bBjNUmm4n7Ei5WIZXyRsHePye7fJX2br0VRodyuTbXCOGqolyqDi4RgM61z20VSCZP4y9rOCk+DiXxp3Oyd1dfnc8uzKDIKezTA8HNkusIy3oJtjDGcfQILTVnVAx4sUXMukwPYu6P1/py0g9yHbSVfu64U+jgFJrwlWQxHDNTG87+w/4VgMn1bm4DRiCemA5yLcU+125tRZjQtwP+ZuuBHlsVXDDUK/wji6VLcp3wyDa+pbWR18nMK8YPCFfmivjXRoKm/BXM0+NSXTiw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(366004)(376002)(346002)(6486002)(316002)(966005)(31686004)(86362001)(5660300002)(16576012)(2906002)(2616005)(52116002)(66476007)(8936002)(478600001)(186003)(66946007)(44832011)(36756003)(8676002)(26005)(53546011)(956004)(83380400001)(166002)(66556008)(31696002)(33964004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	SEWrytf+X1wjJjfUYcXR0gfMrgi1Lbm5eLViz8kMxu/lTwGivW6RLvLwJBH3wSZRS7Yyhdb8GTfnnxdG/ulgh27U4cs1N9Ap7qMT8JmMyxb10oOo8g0GRS1XjF4/1g/xM4LWRaxfVYWYprAYvAY54nNW33lCuEWd7hnEUw2ERzryc1u6wqyUgO5p9SuBIllxWJmEJzMa5/pqv3FNu8Vs+ENyPvXZIuupgBIzU8ELsc+ZBsr9G6E0GzpttPUSbcpF0WQzjZFDbwo26Stq2qbrg6IsHBRH2OhPraQpXoRdCwhFBEsBKsbCDOcP1SmBQw8uYzF9QMR/gsAGMPAe6BjsFTa7spLVag3CjSVK7GjECxMfLBlJcmOt+V8a7lN0qNSI0M9tJKt/I3yT8WObvtpZxwWwf2DtmMyvYnmYpdqHgZNM+tcCSbzB+QR/unF0xImX4qsHqbYhQnop0NCHWti31SzNYiZmxfZIasLM2vvn9L3VgaZsxWu+8GxyElV5XW3IBLqEPAwO9f6Up/dupQgTJEt2Tk1VNRCfLlB8r5hiBpLsLC91CXtHfBrxKZJCKtjRefzWCzYbsWplEfRDKlBfYB1toNFOS/PcItAppbYaFH8wHzsOQYEBUd3h/bFHDEVUz2oOSWpoYKut30Y4LdLV+Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f90c7b7-ab16-4796-0074-08d84f54e968
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 15:28:58.7767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OckqlJ8RyjPKnkKWsc88xeDPawnuf/LsiAl8vpVSfj2eNsykZrvHf6x5dFWO3ggiDH6XzPrqZ8zfBJiLDVpX8Lp/rgvZ3A+EvInympIKsoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3030
Content-Type: multipart/alternative;
 boundary="------------D808FE95017D3C615611F161"
Content-Language: en-US

--------------D808FE95017D3C615611F161
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/31/20 3:03 AM, Leon Anavi wrote:
> Upgrade to release 1.14.0:
>
> - _env now more lenient in accepting dictionary-like objects
> - None and False arguments now do not pass through to underlying
>    command
> - Implemented find_spec on the fancy importer, which fixes some
>    Python3.4+ issues
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-sh_1.13.1.bb => python3-sh_1.14.0.bb}     | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sh_1.13.1.bb => python3-sh_1.14.0.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sh_1.13.1.bb b/meta-python/recipes-devtools/python/python3-sh_1.14.0.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-sh_1.13.1.bb
> rename to meta-python/recipes-devtools/python/python3-sh_1.14.0.bb
> index 2a6d9bcc6..7724f4be0 100644
> --- a/meta-python/recipes-devtools/python/python3-sh_1.13.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-sh_1.14.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/amoffat/sh"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5317094292296f03405f59ae5f6544b6"
>   
> -SRC_URI[md5sum] = "7e3dd3a6b49c06db93746994a68cb8cf"
> -SRC_URI[sha256sum] = "97a3d2205e3c6a842d87ebbc9ae93acae5a352b1bc4609b428d0fd5bb9e286a3"
> +SRC_URI[md5sum] = "4cbbcb85c081d78f4b0f00d634db9bb9"
> +SRC_URI[sha256sum] = "05c7e520cdf70f70a7228a03b589da9f96c6e0d06fc487ab21fc62b26a592e59"
>   
>   PYPI_PACKAGE = "sh"
>   
>
> 

--------------D808FE95017D3C615611F161
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/31/20 3:03 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200831070318.6573-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.14.0:

- _env now more lenient in accepting dictionary-like objects
- None and False arguments now do not pass through to underlying
  command
- Implemented find_spec on the fancy importer, which fixes some
  Python3.4+ issues

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200831070318.6573-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-sh_1.13.1.bb =&gt; python3-sh_1.14.0.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sh_1.13.1.bb =&gt; python3-sh_1.14.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-sh_1.13.1.bb b/meta-python/recipes-devtools/python/python3-sh_1.14.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-sh_1.13.1.bb
rename to meta-python/recipes-devtools/python/python3-sh_1.14.0.bb
index 2a6d9bcc6..7724f4be0 100644
--- a/meta-python/recipes-devtools/python/python3-sh_1.13.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sh_1.14.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/amoffat/sh">&quot;https://github.com/amoffat/sh&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=5317094292296f03405f59ae5f6544b6">&quot;file://LICENSE.txt;md5=5317094292296f03405f59ae5f6544b6&quot;</a>
 
-SRC_URI[md5sum] = &quot;7e3dd3a6b49c06db93746994a68cb8cf&quot;
-SRC_URI[sha256sum] = &quot;97a3d2205e3c6a842d87ebbc9ae93acae5a352b1bc4609b428d0fd5bb9e286a3&quot;
+SRC_URI[md5sum] = &quot;4cbbcb85c081d78f4b0f00d634db9bb9&quot;
+SRC_URI[sha256sum] = &quot;05c7e520cdf70f70a7228a03b589da9f96c6e0d06fc487ab21fc62b26a592e59&quot;
 
 PYPI_PACKAGE = &quot;sh&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------D808FE95017D3C615611F161--
