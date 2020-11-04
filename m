Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.52])
 by mx.groups.io with SMTP id smtpd.web09.13864.1604501142721858064
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2020 06:45:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Q9fhBZuc;
 spf=pass (domain: windriver.com, ip: 40.107.243.52, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQ2oqc1Zgvotyrl41RzoPeyTUbL7yNC8bWzVnzYYWZ1zlD4z642GXiI3v/qNTDQ1wAWtUNFxHhS2jQdOe0BhkgOz9PyFP89IEUVE8/+L2u188OxWCQTPT/ckNlp7/urb7nMI/jDjAbhcCe22n6FcfAQnr2NA09ns+PIIHObWiXIo+YnBAcEx7nmVL74tRJhlnrs9lSGv8k7ikvCm00l7xgEHQNtmz7JQnURoPQEPNSh4PRLiJaM4Cs/9xe1oQ5gXTrztY+6U0ttRHVNkaM41lcAtBBxCgD6PhMV8Ge75VjBuMmL439SccjS1W2ndg9rpwpz21I/pXsSxmsXPXRDA5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9sD4Jjn71VJ1OvXENxp3294VMmkUW2BH0cveZOLl5E=;
 b=RJBlgLjf8j6oQ/IPPJVm398ieG62kJTjBXb7IlLwQUXyLGH92SDDMfoy7715FcBOm/upxVTiPZ7WcR3swKkJ4MO1FWaa9Zd4Eems9ppVLejMcOMO054Ol25wuQasb7Y22XLekuckLJ0hsGEEz2pB7+Go+lvwGtFN+yMyfD/LamG0FKiqyBEXxe0IiVm6VaZ/IGjq592vKrtoCksx3mlBTVpkX2s+5STznU2ZdtwWrjElZoob1+hwP2t+n4DHf3LSDAnuH4BWSiuv7cOfCXVSVzrE4vN0wDGsNFArSsNEVnojqdN7LtOApKefmeSbsQhH5eROKVWjN4dtyxzNBuwnrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9sD4Jjn71VJ1OvXENxp3294VMmkUW2BH0cveZOLl5E=;
 b=Q9fhBZucBk0dVcv/gnc9B2h3zaAbIkM+CuLY/bwY/bGsKHhvJ+97TJUZtfSttuU5atq9ybu7y3zTR0slH6PuBIAN3+r+2SiuHgYCEyWxY2+I39++NUymvFsKsOXIG4e3ALx4bbtqJOedFFOktZJ5RDKmWigHyZboa9VrwK7hD0E=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 4 Nov
 2020 14:45:41 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 14:45:41 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-luma-oled: Upgrade 3.6.0 -> 3.7.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201026115041.11671-1-leon.anavi@konsulko.com>
 <20201026115041.11671-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <88ca61e6-c940-70c3-d4d3-f9122d0dff4a@windriver.com>
Date: Wed, 4 Nov 2020 09:45:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201026115041.11671-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::23) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR05CA0010.namprd05.prod.outlook.com (2603:10b6:a03:c0::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10 via Frontend Transport; Wed, 4 Nov 2020 14:45:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f73d620a-1e3c-4302-1124-08d880d04d8c
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5085:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5085EBC9D02247444527A35C9FEF0@SJ0PR11MB5085.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:327;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RTF+GOGKtsUxXi3FdPFEh5OxmjwHKHAysoap4UAAoxSPw0VSdIkv36AOaiHbWFcULheIrYKV+GkBOqyrXSigJn+NkaEmchJ5QykYlWYidxBTPmbpewIVMGUBZrbxop9G6/cNAtTmBiBcTeC1d9fFn6Fbz2iI2Cxx9TApNrJh8yTC3thuJcyX4GE2WEOmYwxQ0+k+zSm2D/oJmAJ3Csw+5KSw6x++fDCOxvZ/9o5EO4cVpjc+KYp4/vfKcdB+ZMWoO7DRPJ2cwf8iL6e9eXMBKH08MkqbxlOFrEEvZVccMxouJvJ7LYMgMq8wUDn5RXTSpVlScJp8Q4e6l88JfuyaRGy58uQ4DbAY/yaqHiK3evNR+2z8yQ/VtGggWPUdffTXqERCfZkOcSLv4UCy8mhvayn64vK776TNNpXMDcdOU6VX4ouf1w5E4BPRHXNWKiy2bk8GbnpyaFQCwLlacT+C5A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(136003)(366004)(376002)(8936002)(36756003)(6486002)(166002)(5660300002)(8676002)(33964004)(53546011)(66946007)(86362001)(66556008)(66476007)(44832011)(83380400001)(52116002)(478600001)(2616005)(956004)(2906002)(31686004)(316002)(186003)(16526019)(966005)(16576012)(26005)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	MdznV/mxuUFC5i0MwqixSuUjUDSpsDctkdM7yPVVOD0PaaDR7jBnenOqg/tGA6cbb6IMIukubf6q2/ZnFTQcL7ncdU1gTdXQMI7uU8GnBPvGRftWuE+G2JBX5R/oOzSR8wXMVmjtIqO/o6qbN/vTmZc888Ot8r//k7mbK46ZR6JT6Uzbzc8rvHkTT8S2ggPHNyC1dO//vkVxdbvcLxVQrq1kX8xSNLXxUzp9sJmAYD9ryAtNud0ln2y/q3f5UTwW51XLQpojFROgcyM2T/YWbMmz4GpADCmw7dIevo+VfN/9m32CJALmiHVdi9mzdsiSCZnIslma88mjdFpib2kXb/M9STpyHEuym/V+Yr/1L915z2S/Ab7UVCblzYNzKm/LqSoKELnAcdR/Jg4oBRdW+Tsi1OfHKiGdW0RyeiyJKL7cRlxrlzIQW5Y25m9xjqgVl+ew5iTjttawzLzDFuUNT6xecRvVlLUdRCuH2tV0uHhhMzBg9ZibBL7I1817JETYKJl413RWvpDZOelljuWjoNyXmg+Jzxb5ZVzk++b6BO3LewqK7IcO51SxTf+3IR+ZDcqfqQ5XSKCDntwEcSNo6oR3wU7nPHzf6s8HIBTNsjMpcBc10QwKIOCS1mNUoE59ju8bghExUmaHTl5gJllE9A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f73d620a-1e3c-4302-1124-08d880d04d8c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 14:45:41.7771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJ5NpRfUUajqYVON/TfrOJWtm8U7bD/NuqW78wepENpqbGL0Hg+6pvuCWFw9aO2JfArsSFIhMTJ50EPmjCK57zMX7o44+Na8g6CUauZ6CLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
Content-Type: multipart/alternative;
 boundary="------------0E482D725DC64B5AB2514AA1"
Content-Language: en-US

--------------0E482D725DC64B5AB2514AA1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/26/20 7:50 AM, Leon Anavi wrote:
> - Drop support for Python 3.5, only 3.6 or newer is supported now
> - Add support for SSD1351 128x96 display
> - Pin luma.core to 1.x.y line only, in anticipation of performance
>    improvements in upcoming major release
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-luma-oled_3.6.0.bb => python3-luma-oled_3.7.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-luma-oled_3.6.0.bb => python3-luma-oled_3.7.0.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-luma-oled_3.6.0.bb b/meta-python/recipes-devtools/python/python3-luma-oled_3.7.0.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-luma-oled_3.6.0.bb
> rename to meta-python/recipes-devtools/python/python3-luma-oled_3.7.0.bb
> index ae14aff366..8c9d195baa 100644
> --- a/meta-python/recipes-devtools/python/python3-luma-oled_3.6.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-luma-oled_3.7.0.bb
> @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=c328c862c3335ad464e1c9a3ba574249"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "ff45a3067658434339da2586a97e526b"
> -SRC_URI[sha256sum] = "dbd8ebce1c0b10feabb725b321d4a7f9f7353fe16878c8145ca332a173c193c9"
> +SRC_URI[md5sum] = "dd661f869180c5b306628cc6ade04d60"
> +SRC_URI[sha256sum] = "fa710ea5d46f731033dbbcf4330f264d653a9a21d60b29dfc53355f72f355e17"
>   
>   CLEANBROKEN = "1"
>   
>
> 
>

--------------0E482D725DC64B5AB2514AA1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/26/20 7:50 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201026115041.11671-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Drop support for Python 3.5, only 3.6 or newer is supported now
- Add support for SSD1351 128x96 display
- Pin luma.core to 1.x.y line only, in anticipation of performance
  improvements in upcoming major release

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201026115041.11671-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-luma-oled_3.6.0.bb =&gt; python3-luma-oled_3.7.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-oled_3.6.0.bb =&gt; python3-luma-oled_3.7.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-oled_3.6.0.bb b/meta-python/recipes-devtools/python/python3-luma-oled_3.7.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-luma-oled_3.6.0.bb
rename to meta-python/recipes-devtools/python/python3-luma-oled_3.7.0.bb
index ae14aff366..8c9d195baa 100644
--- a/meta-python/recipes-devtools/python/python3-luma-oled_3.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-oled_3.7.0.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=c328c862c3335ad464e1c9a3ba574249">&quot;file://LICENSE.rst;md5=c328c862c3335ad464e1c9a3ba574249&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;ff45a3067658434339da2586a97e526b&quot;
-SRC_URI[sha256sum] = &quot;dbd8ebce1c0b10feabb725b321d4a7f9f7353fe16878c8145ca332a173c193c9&quot;
+SRC_URI[md5sum] = &quot;dd661f869180c5b306628cc6ade04d60&quot;
+SRC_URI[sha256sum] = &quot;fa710ea5d46f731033dbbcf4330f264d653a9a21d60b29dfc53355f72f355e17&quot;
 
 CLEANBROKEN = &quot;1&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------0E482D725DC64B5AB2514AA1--
