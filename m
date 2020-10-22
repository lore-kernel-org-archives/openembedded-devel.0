Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.56])
 by mx.groups.io with SMTP id smtpd.web09.1363.1603410305771565033
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 16:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cGK+bmHW;
 spf=pass (domain: windriver.com, ip: 40.107.237.56, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVueP5AgprOmCwt07BRt/FDxO3ieuKmdVfmykLiFi++XlFbi52ZGHY8HoJ5mJpcnv6MyNE0eX3RzCYgI5o65mD98JUPRxj4Z4DJPl9jP58yk+LP5zBz5qPCaEOMKOiaocNu1nfz7ZASGg81Vawlkg8/xr7xaQEYTJ0vJA+0NfgL6r5ymjM+r3BAYtYi9B51gbjcte/999F6p9agyFSFyXE3kFUjB9SEo4O5eaoayqd+M4nLHwxiW7577nQTzcljqfngupklmxLxKewYILoGhFa7d+BWlYJXbhzslKNJIiOAYrfnnwEG/Sus7EwXUOZgaSFEK7jtcYHawQ1oAm3PwoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NRn3bNJAMwPr/uycWCr8NqLlsBo/giRAtHovOmQ2soU=;
 b=Fllp+F3TWwXUxM3XEyqO1HppzBPA497PsDuhV70nV4+fiVDuqbhNfdSb73QuyEDN8UWVr++ENn8FSqcRjNtHZtIuTUTahd8lrQKpjdWBSqwdmmphWEeEmE9zLSDLC7ogODCliO+rW8uJ/6U4cwN2VYdBcjWGwl92tbl006u2dmGmT0ohCfuga3gIVoT1nog9cgajZTpuxgDYwgzrZQFwdw9M2IGmQiP/zVpRzlKt3rv2iky5WAj6lf0rcVMJnj1jic4k4AuYOh/gf8fxco5/nYnKE/HL/ISrSBWWjmkQYTAsTGb72YiGsUhv/MUnXk39tzMrAPsHJVVbtpC1CoZ8gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NRn3bNJAMwPr/uycWCr8NqLlsBo/giRAtHovOmQ2soU=;
 b=cGK+bmHW1KbKvOkK1IU/N2RoRahJVnMYHq5yBHmsPqPXrWoqc0dSycBLCWZ7pKOtNymbXz2ABippr/ywPV79toKRC5faroN5cCdzJBakzqYHRPWEyZFKI8yYvTMsevb0Ya/gHiOKubmfDx+5ENAzWz1zm3WY49WQvBqdylwaKdc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 22 Oct
 2020 23:45:04 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 23:45:04 +0000
Subject: Re: [oe] [meta-python][PATCH 5/7] python3-markdown: Upgrade 3.3.1 -> 3.3.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201021111609.28237-1-leon.anavi@konsulko.com>
 <20201021111609.28237-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f1ec3006-5d0c-6601-d382-83f321fd989a@windriver.com>
Date: Thu, 22 Oct 2020 19:45:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201021111609.28237-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:40::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR04CA0016.namprd04.prod.outlook.com (2603:10b6:a03:40::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22 via Frontend Transport; Thu, 22 Oct 2020 23:45:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0d7dc0f-520c-4966-4782-08d876e47fcb
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4896EBC143393DDD97D6E3179F1D0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0j6PlRlbkiHtZ1BJ4uh6COAhA1Kh3aTx3tVF7/tjavNc5289d8xW2GjJctNbK+aHsw7uq08fiHR1aa7qpuJTb8sra2PD33ivl/89C+j8Nfb6ljRJGL8wG26FLp/PLejZux3VIMLSztnE4Zpidm3WundhEAzkLwqDDGmww42MIo1nUBYugFxwp6TxJ6zjuqGRpDzlP2mxelMxyGU8081XHISskuI70NtfFe1kYJemDykL+cMEsv/wWeBJKlv3xqR60SJZwhq0GkhRNoM1q/UeqbvV2HbMk+B8aq8Ccq8SkbyqhRF8nuwWVz7OhnkEonlL7wTfTstiJ46OjRFiMt+a7Xg2D5VgljPWv0a4sH5hrl4A4Ku3NRRG8s7ag8iLKzgJsn5BCvGHgIYdksVWBpQKNAG1dfPjcxlfSGUlJdKCsq021ZmhGoNs+vH8YUrGbmTdc2IK+pEkx5r0QkqhT6QptA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(346002)(366004)(376002)(2616005)(31686004)(33964004)(478600001)(186003)(2906002)(956004)(166002)(44832011)(8936002)(6486002)(966005)(8676002)(83380400001)(36756003)(5660300002)(66556008)(53546011)(316002)(86362001)(26005)(16576012)(66946007)(66476007)(16526019)(52116002)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	7CJG3bR0BtkbJr17ZZoWWoxC11V4QztSIXUUgb6UOmxZbdpmf3es7WjgQtUxj7BDTERcaQaTWq3dewK+CoR+dzjTHkgtfZ3ckbSVhwm7/uz7NlZTt1JY6gb5s2r0c6pwbrp5LiykvSWvt9n6HMUSXbORxCGrtsj5PrUlwsM+LJRdm4a1h5naWW4tOwOLOuRkwIUSA4W6cuGZt8eqW+Qw439tRjoyFDWVrhrlXvnsYLYUallIqlgcGgfserYwaTiBg94UFCO22vNSX1+6Tg9K8ajIfQunJUaWLTWKifRFAm3W+BbZI3YEDpCVgfCLfagZZP8F9Tpp/LxGRdBwNagreA6/ispp98OsuKYcmsy/XggBZXuxrjo7Etn0MUzp72lBsQ7IMaiy0nWhIKFN4ssUfM/Te9AShUBYE/izW0Xm/ysxgY67X9F6N3Tee9UAF4OQPM9ZsGGkA4RF0ES5VelVSJRnerfw0JQjTbJZUOVDonF9NtY/yBtXHdrq8DMbQPlXmjQYpphMVM4fFafux7u6QjH51fP+BAhYnbL6TCdFJnCVBcNNsvVhmEjFb/8WFpeP2gPSuCnDLjMWVLBDiMtQaqFEVuK5s/tk/WDypv8cVxouInF/bOOchRbbntCNihyLZ+m5w8KV9bOxXClxMrw+xQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d7dc0f-520c-4966-4782-08d876e47fcb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 23:45:04.3863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XhpvlFvzaaWUwEmNt9DTt6t7zmmzrxblSioGvorv0NgzkmD9qkHILJ1v0gHvxTfKbz4mFPaqzvRAaGtmGEkFx2RD2rW8Hvu9u9jOo6rPtwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------2A0C69ACCBF0D6CC43A04DAD"
Content-Language: en-US

--------------2A0C69ACCBF0D6CC43A04DAD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/21/20 7:16 AM, Leon Anavi wrote:
> - Properly parse inline HTML in md_in_html
> - Account for Etree Elements in HTML Stash
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-markdown_3.3.1.bb => python3-markdown_3.3.2.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-markdown_3.3.1.bb => python3-markdown_3.3.2.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-markdown_3.3.1.bb b/meta-python/recipes-devtools/python/python3-markdown_3.3.2.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-markdown_3.3.1.bb
> rename to meta-python/recipes-devtools/python/python3-markdown_3.3.2.bb
> index 8c6830b47d..d8d5304264 100644
> --- a/meta-python/recipes-devtools/python/python3-markdown_3.3.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-markdown_3.3.2.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
>   inherit pypi setuptools3
>   
>   PYPI_PACKAGE = "Markdown"
> -SRC_URI[md5sum] = "c7b68676df277df34342bb9a27f7fe30"
> -SRC_URI[sha256sum] = "c3ce9ebb035c078cac0f2036068d054e7dc34354eeecc49c173c33c96b124af6"
> +SRC_URI[md5sum] = "4bdebf1b5c64286c2214c99120da4292"
> +SRC_URI[sha256sum] = "4b71fbd2db30c1dfb400f22b25f41cb823fc1db0aa8b7b67d120644f92cc1011"
>   
>   BBCLASSEXTEND = "native"
>   
>
> 
>

--------------2A0C69ACCBF0D6CC43A04DAD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/21/20 7:16 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201021111609.28237-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Properly parse inline HTML in md_in_html
- Account for Etree Elements in HTML Stash

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201021111609.28237-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-markdown_3.3.1.bb =&gt; python3-markdown_3.3.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-markdown_3.3.1.bb =&gt; python3-markdown_3.3.2.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-markdown_3.3.1.bb b/meta-python/recipes-devtools/python/python3-markdown_3.3.2.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-markdown_3.3.1.bb
rename to meta-python/recipes-devtools/python/python3-markdown_3.3.2.bb
index 8c6830b47d..d8d5304264 100644
--- a/meta-python/recipes-devtools/python/python3-markdown_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-markdown_3.3.2.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed">&quot;file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed&quot;</a>
 inherit pypi setuptools3
 
 PYPI_PACKAGE = &quot;Markdown&quot;
-SRC_URI[md5sum] = &quot;c7b68676df277df34342bb9a27f7fe30&quot;
-SRC_URI[sha256sum] = &quot;c3ce9ebb035c078cac0f2036068d054e7dc34354eeecc49c173c33c96b124af6&quot;
+SRC_URI[md5sum] = &quot;4bdebf1b5c64286c2214c99120da4292&quot;
+SRC_URI[sha256sum] = &quot;4b71fbd2db30c1dfb400f22b25f41cb823fc1db0aa8b7b67d120644f92cc1011&quot;
 
 BBCLASSEXTEND = &quot;native&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------2A0C69ACCBF0D6CC43A04DAD--
