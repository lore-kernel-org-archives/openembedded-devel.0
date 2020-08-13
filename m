Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.87])
 by mx.groups.io with SMTP id smtpd.web12.13039.1597334032405296149
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 08:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kW64xPIV;
 spf=pass (domain: windriver.com, ip: 40.107.220.87, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1fJcuKqSkL3hYVtg9AO810q5gYYB5xD1tbCNmZYIf1vwuCNd4SBjJT1/cBgPMEjidO4Hbh2ZUgI9kT9lsyc5tLKHj+dJF6zI8MOH5P3hznFzQtl/1x6th6ZYM5Nsd25DFsbKmhdeZfAWOTZ/a5cLu2gHAYqKEpA7yappZRShCYXzPfXIqCrU/woPvwYqds8iiWfxv+rdLS1X7at6rWh8hDMvSdx89xZF+V/uHIg/utT1VcymEE1a4Xp+cWPwI8fS0Pm55FrV7NxdjXv4Ltlut5zZYqQ35Y4hXbcKUOoSQir2ppkazBXeYund0XCKLJ86ETkdPlZN9XjQlL6/KEJ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdchnVm6aO5EX9TxCO5l6mWaOOgdx6Bz2xAj81duPgE=;
 b=Oe1zfahBg4U1ff+d3mQoYQSZZP3QmqkU0tZilxYUoSAZTp2VBE2ancpjcD9PT2GF0iVxcPHgSi/mGtO67LzzFwX3O6Rhz7fhGLj/k74ih8/6SHAXdX52eHl5GiLI8k6Srm3yqlkn1cNAJGy/5P2MRQmyer7rZar+BUcSDyi9305TV/b3xa/1/yj+kl0QXm2eP6fqzqzEKrFzQrYShZr4QH7ogBS6YOnSF6RIoDsv4InJuUQ/JKx0sPG1lOomeDCIwoQd9xT78DOjzymemz4bCDBgsTbKjIx+DyCkTDe2/hFnzuV1R0XzZgrbOESt3uU8+SpoOi2fbAjthaYlXvJx9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdchnVm6aO5EX9TxCO5l6mWaOOgdx6Bz2xAj81duPgE=;
 b=kW64xPIVTHDPHKdHS61HM07nvB0pVIauQRI587eR7Rf/0dKRZHJN8WOTjvPiZxd69cw1AAhkRbJ3b7vSBAh+hBv84Ex8vScpFqUDqBNy74qdS3Q89soJMVGQuNahWr+e52Bb+Qo5lpHGkJwbpgYwg596vKhrcyKoqxvA9ny+PlQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3606.namprd11.prod.outlook.com (2603:10b6:a03:b5::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Thu, 13 Aug
 2020 15:53:51 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Thu, 13 Aug 2020
 15:53:51 +0000
Subject: Re: [oe] [meta-python][PATCH 03/10] python3-bitarray: Upgrade 1.4.2 -> 1.5.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200811114430.27916-1-leon.anavi@konsulko.com>
 <20200811114430.27916-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <7b18f641-9751-4f63-aba9-1141615c8c17@windriver.com>
Date: Thu, 13 Aug 2020 11:53:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200811114430.27916-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0063.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::40) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0063.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Thu, 13 Aug 2020 15:53:50 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee199856-c8f9-4ee0-4920-08d83fa112b2
X-MS-TrafficTypeDiagnostic: BYAPR11MB3606:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB36066441A854CA640C7435CB9F430@BYAPR11MB3606.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dtpMoJmv4+VkUyCNAabE/OA8MGxMrwEMovalBFRu/Tj4oIqcxPYRPf38ISumPDI6Xqf9fbkChA67hcVP/WSe/olJ5h7A3z9eaM37Ha94Uhsv12q1dt84OTGW//GfI8fkEioCkIo53/6LgWtW9l+S6UIfhcBcy4gUOmEp2xyUZ/RerTm80y3mXVtG+GaZEmDfgljtWT9/RUwZy1HxYZ8lUqeJnoVJXEVErfBwzVEvbHVsIOrDJzcjP3kSqyEa4NUzLFGPKWTsS1lAm4nbbsD/DBHJJRbVzNvlafDlHJ7AxD5Tsm1duHi5REnnjWR9AiLNv0aCiOBoRYs7nAVK0MZFBRGJd48q/XOhzBDJEyAVq4JHP5ldANe4/NquJGxakgzAkLabh+DJ2qizrE+4MpS6dqxzm+46Oj4IlVAdvqDr+Ii68wiZIYp0G0ICWSp+55slioA/47enmNyzC4uniPAkYg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(376002)(39850400004)(396003)(8676002)(31686004)(186003)(8936002)(16526019)(5660300002)(36756003)(26005)(6486002)(478600001)(2906002)(31696002)(44832011)(66946007)(956004)(166002)(66476007)(966005)(83380400001)(86362001)(66556008)(52116002)(53546011)(316002)(33964004)(2616005)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	TJYXHllQkVjyigTBEIgXrI3IMDg9cESKas9SGKD0Eia7mCqn0vnDDk+G/71EXaX5cWmYFd+e1LG3IkA1fOn+2LmiqFMtW3PYz719TtUvIuOGNw4JcLBNHona7zmdRkAqJQ4k/BeXK8J9fzCR5h+t6ApPrPgP4hDqR/aDFf3h6iKhUoDU2i1S1c6r2E3RjRutuYX2UqV7ogdsJVnoLBPOR2p7QaXBYcC9jU3X6vpySX1S+4iS3T1Dsp7oIedcfIbpYxH2xEgBtIQIvvYv7xn4epvcUOHfoKXxZSda31HQ8buHhl1RlFaUdtGYsfNAtHoZV/C0vGetpUE/CLpA1APsYTGQOOkdjLYIzeZU6TZqn30Fbt66uWYmL32JfGwCitvZ99jdkRSLZVPdnGbr/5+x7SLrwAYb6mHPbFGEraWbPu2w4DDi753tKBULxlRS/isf7yEUHFTQQxaciamIgqwGoOG9flGaJFP3FaSzfjoRjZz/t70w6AF8UyjY/PuzQHJitQVlxpSFqrd1j4Y4Ce9NczE5JYZihkgLdLumw+pa35NthlVvkSvatMhxZ0maH45zIrVgNUF1AsuOq+IqrLgWBXOtbUR6y/BlOsiXUEYVS4SNvszzRFzLgBnbmonbHOiyrfPYQWboVK8YMtodkniqVw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee199856-c8f9-4ee0-4920-08d83fa112b2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 15:53:51.0802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q+hNifTuLLJCI440rczM31tc+9C7ffleEI4osw+9+tRsJSPvTHM5JtheM3ImZeQFpCcfTpCj8GhZUPYLQjxA9p5YGGgj3+uv9ubka3GrKrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3606
Content-Type: multipart/alternative;
 boundary="------------47EF5C96AE58736D6F3AEF50"
Content-Language: en-US

--------------47EF5C96AE58736D6F3AEF50
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/11/20 7:44 AM, Leon Anavi wrote:
> Upgrade to release 1.5.1:
>
> - support signed integers in `util.ba2int()` and `util.int2ba()`
> - deprecate `.length()` in favor of `len()`
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-bitarray_1.4.2.bb => python3-bitarray_1.5.1.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-bitarray_1.4.2.bb => python3-bitarray_1.5.1.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.4.2.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.5.1.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-bitarray_1.4.2.bb
> rename to meta-python/recipes-devtools/python/python3-bitarray_1.5.1.bb
> index 925bdc8d9..70804ad18 100644
> --- a/meta-python/recipes-devtools/python/python3-bitarray_1.4.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-bitarray_1.5.1.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
>   LICENSE = "PSF"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
>   
> -SRC_URI[md5sum] = "2bc9489e9048db6a8705a7b9493e3015"
> -SRC_URI[sha256sum] = "16f9908c9388af616f2b298febbefa8315d648f522d195a7706d8ba1895c5680"
> +SRC_URI[md5sum] = "7005b90013838954facbaa231d7cccd9"
> +SRC_URI[sha256sum] = "45bba08bc142781ec7e18a847735219390808f9b6279c356252edddaee1f5fcd"
>   
>   inherit setuptools3 pypi
>   
>
> 

--------------47EF5C96AE58736D6F3AEF50
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
    <blockquote type="cite" cite="mid:20200811114430.27916-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.5.1:

- support signed integers in `util.ba2int()` and `util.int2ba()`
- deprecate `.length()` in favor of `len()`

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200811114430.27916-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-bitarray_1.4.2.bb =&gt; python3-bitarray_1.5.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.4.2.bb =&gt; python3-bitarray_1.5.1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.4.2.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.5.1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.4.2.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.5.1.bb
index 925bdc8d9..70804ad18 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.5.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/ilanschnell/bitarray">&quot;https://github.com/ilanschnell/bitarray&quot;</a>
 LICENSE = &quot;PSF&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d">&quot;file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d&quot;</a>
 
-SRC_URI[md5sum] = &quot;2bc9489e9048db6a8705a7b9493e3015&quot;
-SRC_URI[sha256sum] = &quot;16f9908c9388af616f2b298febbefa8315d648f522d195a7706d8ba1895c5680&quot;
+SRC_URI[md5sum] = &quot;7005b90013838954facbaa231d7cccd9&quot;
+SRC_URI[sha256sum] = &quot;45bba08bc142781ec7e18a847735219390808f9b6279c356252edddaee1f5fcd&quot;
 
 inherit setuptools3 pypi
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------47EF5C96AE58736D6F3AEF50--
