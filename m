Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.73])
 by mx.groups.io with SMTP id smtpd.web12.13972.1604501172148496848
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2020 06:46:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HQ+PHUtv;
 spf=pass (domain: windriver.com, ip: 40.107.243.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWBZ4YHIld3F07a4lez8fg9hHws2Fh0L/jgOIiGhJx+omIhuHU4Weml0Ukz9X3nd9fcz2Daq/jbT3+zjRQUIYBpZB/bfAcM0XCvTl3yyE0mjrdWW/2eiwwRZ54OVkUt0hUkRmQuc/2iUtvqH6lSLd+WwVQerOjgHecnP18wpjGHO7JqzOsW9v3CLPF03SGRVm2vt6C+DNM2XbSe0VxIiX4CcWqR/K5vBPpFWZ6d3s8XQPx21/jWpTCW0isDVItXleCYUr6aeYJYK3KrhjLyq7kKtE8qa7eqbGGE6Ub3g6pco2SFTJS39s3Qgf1CqItv+CK0h4v1dz547GG6CibKUnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGta3gJ3G3OygV6a/CP0w0xQCbCakSLvxFHBU5FCLQ4=;
 b=NaDPNE28F316iuuMZpzvUH7fqm4eDZPpm1RKPakB7pa8PwXDQ0X+ZbmNE2kAVeaSW82ym6l9D3aWFBS0GCltQarIqTc+J/J4XuxLQrboJEg2DyIV2NEmyCUxUe/RIGKGeiuyx2WbupH2Oo//AE5UUQESGUdv9EuTYl8QHz+dn3Fd44vOAZQK1pZ6fu7pBlpf+hzLoT01Mh/fej0OXvzs+pra0/TSb9RDBCYfOuQi8ZBtaEk7rLA+0f0GFOHp0GcmZf4aR173WUmbKGXg3YOhGU0mYnA06mch4h8aVcbLg79Al3T41BZkORJe7rifrS72peEiy1S4bOMWUxmjbWOuVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGta3gJ3G3OygV6a/CP0w0xQCbCakSLvxFHBU5FCLQ4=;
 b=HQ+PHUtvT9TogOxsT4BhHxV+ahqYQ4wWXbpU7RaqV94gYrSuccvqrvNJM6fYesDElVmeFDugRtglBkKrgKc8r1cv4LXVyPTSmHVt72ZnmF/lur4fev06Obp1VsDBspPXJd4DR9BdMTH9qcbo4Yy1VGdYP84RTgd8M5q6JMLd3Qc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 4 Nov
 2020 14:46:11 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 14:46:11 +0000
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-markdown: Upgrade 3.3.2 -> 3.3.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201027104013.11394-1-leon.anavi@konsulko.com>
 <20201027104013.11394-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d4ae28d7-14ad-1af5-7992-ea607d12a56e@windriver.com>
Date: Wed, 4 Nov 2020 09:46:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201027104013.11394-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: SJ0PR03CA0128.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::13) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by SJ0PR03CA0128.namprd03.prod.outlook.com (2603:10b6:a03:33c::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Wed, 4 Nov 2020 14:46:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c38f700-b4a5-4668-09a4-08d880d05f17
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5085:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5085E5E9628F87543E8CE2D49FEF0@SJ0PR11MB5085.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:199;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lLbiU5vssHe6/Kh6HN6MELC0wHAostPNV16Rp1C7tF0fJggJ7NbSDDN3Xfgj14bFRFS9sWsicJdirdwohhc9A+HASTx/AJo3QEmXJZedVWypmrLMjxapjQz9CnAF5E4xoVgVWwsFTKtbP+1tgzl7HJTfMTFcbQEFSId63qYsOLfcRqhlKU8lNaizxtZSifB5ZHLaK6qRG40s/Mbqp+kG9gVI7+09+5A0kqhkil1HGHa85o33c/BbAlnjF558X5QQg2dIhnkpV/6MT3KhbvDchPdyQC6YHqcDFTOn5u4XvBWkxn2VoIKJwy7IgBJ3VBSIf+Y1HAIaJp4jytPBCMzM+Q3ucWD49m1jEdk1rhYCTwmwVjCrMKeTiK2G3cnH4ckfL4ArEsUoerkYtKIcgxoOTuJ8Q986gwtW6kYwrNVZiNDkhcwG02xam2AolAstEorQ5YAlbm18XWyEd+mPs0lH6w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(136003)(366004)(376002)(8936002)(36756003)(6486002)(166002)(5660300002)(8676002)(33964004)(53546011)(66946007)(86362001)(66556008)(66476007)(44832011)(83380400001)(52116002)(478600001)(2616005)(956004)(2906002)(31686004)(316002)(186003)(16526019)(966005)(16576012)(26005)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	TPgaSGwgp3jhJQZzYMfAh5TTAGISpfmF2Zy8jYxpO2BnJSw+cd++7V3UrANndoUHVE6+D6G5/Z5OjB+09RfdBGz3GPmaodzkkPbcsIcG0gGbQO/W/4RjcAn0LpBH7KcV1ueZj2XBUk2h61JdeoXp9OlBlCl6oXbeRvPmq2mv+rQZNf670MzWCZSK9F7Hk9fpTI4gNsSIdr6OwKNNfKb3URJISu0znSX3PRAbm7gQJl4356a9/gF9gcFJ9vA3xgDMb2l5kiIGmXOFrJEODEmEI8wkDXJXIcnQeY2NNVTYZR5MY+seZCznsOXqht/d+sZh1V88PrHNMk9/2XBDeKX/hdr+L38zYY0n6ebEhcN+uXydxmLpeXy9z6PLoZJ0zsHF8A9uE6V5XCRPjG5aLSnKx0eKThTvjS2oroG28lLgoUY5PyfmdtBp8DplSzFAMTif3+wh/XPQEcSWMD3fAuhMdzE4Gv5USzTEJIpj8wqPJofUWRFTRMa71ftC23Yure/ssQDTkYEqVpeaQWLwHOTxRqvZa9MdH6j41sbC0PcdlYwv2QBbUV08sLylCa9ks6ReJuWOtDxNaaSxf1nmjYeygYGG2TlhWEjIA8Mteu2++7W5iYGKrOWBEg6AVRHRSY1/15jyn+yqdyHHpkbfsXOIKA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c38f700-b4a5-4668-09a4-08d880d05f17
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 14:46:11.2062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEpoVOmMkK2hTrSh7OJvq2o1IkyNXtycnU7c/Y6liJkIDlBRe1E7cbX5ZsaUR3/s3s7rmE2X9Wj3sW27upZdT/SEecg5N3DuWbO+HBZ3cgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
Content-Type: multipart/alternative;
 boundary="------------AAA7F7C00FF6E1B9F0B2CE58"
Content-Language: en-US

--------------AAA7F7C00FF6E1B9F0B2CE58
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/27/20 6:40 AM, Leon Anavi wrote:
> - Unify all block-level tags
> - Fix issue where some empty elements would have text rendered
>    as None when using md_in_html
> - Avoid catastrophic backtracking in hr regex
> - Fix hr HTML handling
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-markdown_3.3.2.bb => python3-markdown_3.3.3.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-markdown_3.3.2.bb => python3-markdown_3.3.3.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-markdown_3.3.2.bb b/meta-python/recipes-devtools/python/python3-markdown_3.3.3.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-markdown_3.3.2.bb
> rename to meta-python/recipes-devtools/python/python3-markdown_3.3.3.bb
> index d8d5304264..990544cf1b 100644
> --- a/meta-python/recipes-devtools/python/python3-markdown_3.3.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-markdown_3.3.3.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
>   inherit pypi setuptools3
>   
>   PYPI_PACKAGE = "Markdown"
> -SRC_URI[md5sum] = "4bdebf1b5c64286c2214c99120da4292"
> -SRC_URI[sha256sum] = "4b71fbd2db30c1dfb400f22b25f41cb823fc1db0aa8b7b67d120644f92cc1011"
> +SRC_URI[md5sum] = "034e3bccfde211d44b4a7a69cb290ba0"
> +SRC_URI[sha256sum] = "5d9f2b5ca24bc4c7a390d22323ca4bad200368612b5aaa7796babf971d2b2f18"
>   
>   BBCLASSEXTEND = "native"
>   
>
> 
>

--------------AAA7F7C00FF6E1B9F0B2CE58
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/27/20 6:40 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201027104013.11394-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Unify all block-level tags
- Fix issue where some empty elements would have text rendered
  as None when using md_in_html
- Avoid catastrophic backtracking in hr regex
- Fix hr HTML handling

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201027104013.11394-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-markdown_3.3.2.bb =&gt; python3-markdown_3.3.3.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-markdown_3.3.2.bb =&gt; python3-markdown_3.3.3.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-markdown_3.3.2.bb b/meta-python/recipes-devtools/python/python3-markdown_3.3.3.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-markdown_3.3.2.bb
rename to meta-python/recipes-devtools/python/python3-markdown_3.3.3.bb
index d8d5304264..990544cf1b 100644
--- a/meta-python/recipes-devtools/python/python3-markdown_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-markdown_3.3.3.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed">&quot;file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed&quot;</a>
 inherit pypi setuptools3
 
 PYPI_PACKAGE = &quot;Markdown&quot;
-SRC_URI[md5sum] = &quot;4bdebf1b5c64286c2214c99120da4292&quot;
-SRC_URI[sha256sum] = &quot;4b71fbd2db30c1dfb400f22b25f41cb823fc1db0aa8b7b67d120644f92cc1011&quot;
+SRC_URI[md5sum] = &quot;034e3bccfde211d44b4a7a69cb290ba0&quot;
+SRC_URI[sha256sum] = &quot;5d9f2b5ca24bc4c7a390d22323ca4bad200368612b5aaa7796babf971d2b2f18&quot;
 
 BBCLASSEXTEND = &quot;native&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------AAA7F7C00FF6E1B9F0B2CE58--
