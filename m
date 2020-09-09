Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.53])
 by mx.groups.io with SMTP id smtpd.web10.3404.1599675944940773544
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2020 11:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ePJogvTp;
 spf=pass (domain: windriver.com, ip: 40.107.92.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiAaLXvEzacFsuYKfA557byEbU/jc5z2Yqg3g+BaGtJ/kQVsU11W1Zc+7Z2lJeqcRykwganImstgjDylw3kajTUfnaFYRyuanPMhYGcIGD1PcFhOukg3JhKjXZd+eD2fx5hQ3lwEfWJH1LQF3w9cJEgslpJDOz2dafESM/50rLkE5XYEQ518nHrJPmGEjBEnGxzGDF0E6u7VzEPDxT6AYTo0jV7X+rFeUJRYsIFql//NQcmXbKEM9ci+kaVKaPwER0WIuwBEfqjvBN123nya8CLMMx+rMndTIebUuY7ykwDUTAO6pmdUrQy2+8XxQyTg67L0klJyOh2o/muUawPKcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9BJTcV4jcE+TFtbpxQJidvPDpNnc6jFaxx6MylOCQA=;
 b=bR8vVZ8CL3rhC9VIIf2E+b3aXjzLIoENuyt1qU/BY3fyGrNY11uTYVC1V99pHkux8JIoWAI7gKM9ab/kv/hnGcpQ5xJKNDtUXQsqFQBtc5XXFIMqYqcd2Asrq38cOUUXuW9W7zRJ1varjO24PmMWsfXqIJJ2osJko4xizzlil4sAHLqr7doRH2oTYX9YCFuUW8UGoqDC4YbwRm4o4mEan7dDBoV0EWGaG+7D0W60nPwUKb+pfOvp6zyLnWmO8NBoD49nL0olZQ/aJDSYPBi7HzQPjpvuugI6fZq85/6kCSP4zA5e6Ul6BAkiU9Za2WgD5lavZW8A/JvrahlIqmATlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9BJTcV4jcE+TFtbpxQJidvPDpNnc6jFaxx6MylOCQA=;
 b=ePJogvTp6rju4FzMPFXxwXA8qg7++EW7zTFw606K9oop+VRBJYfNnsQJ7sV10EtLgbnVWGxLOe8dDkhVA9mXENP9oQeUkqd/oxZFSduXlI0fnndabTKfOGq19kn5dLC8HE3VOTwsYV1sdR+07ebF+0XxZZuG9OocWEm8o3ROF0E=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3669.namprd11.prod.outlook.com (2603:10b6:a03:f7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Wed, 9 Sep
 2020 18:25:43 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.019; Wed, 9 Sep 2020
 18:25:43 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-isort: Upgrade 5.4.2 -> 5.5.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200903133520.19437-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d56426f9-5911-e074-6f4c-83ba5ba5e069@windriver.com>
Date: Wed, 9 Sep 2020 14:25:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200903133520.19437-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0062.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Wed, 9 Sep 2020 18:25:42 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e58bfa9-ae14-4422-fce2-08d854edc313
X-MS-TrafficTypeDiagnostic: BYAPR11MB3669:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB366931C6EB4AA03CBDCE4F959F260@BYAPR11MB3669.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Fg9ujEMz8pSGt+2uD0J0x5WmdJFloHkZL9NCnUz/mOztGfMPhnfHQpmg+71R9TpMF3LsXfviwLmCxCYw44ck1QwJmtS7OZZa7DCzasGpJ0PXPC+GdTkhavqXFFHQPzbrae2eBnfrvKscpDUPsfOYBdIsRQkNj9q8msjp0yiVpx7fkOqwQqizbfb9LnA/XZA0pijRbMGJY0fQ97Gz3h55ic8crDbbVB/YoKxBbpkrQLYYPHnfqcgHFPSe0VPeWXYLfN0k4O7EUL0CH9ZqlzVUOf0ds4EOCmqeGwuYSplxYaIK0RSJ2DVjUIr4a1tYvmQXTc4XmR3zY3vr7OXfw/aXkf3nl/0szELOLqhjfBwlXe6++5Zn1yIjrZgaeX9jn3GsSmu7jfStFdabHOh7hRqONsLPFI/1jFjk6R5xtP/EmiyOmG7cDvz7a8eeWZkTS7EsDMA5H1Nq5Wxi3IHPS84TcA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(346002)(366004)(966005)(33964004)(26005)(52116002)(8676002)(956004)(166002)(478600001)(36756003)(2616005)(86362001)(83380400001)(66556008)(66476007)(316002)(186003)(66946007)(5660300002)(16576012)(8936002)(44832011)(16526019)(2906002)(31696002)(53546011)(31686004)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	9whbh2Gv/KTvZt0xM3ipwKpbkTioJpXpFAyfmycCiEZExbn6/1i6UFxfh61VWU1SrBtPhdlCDWVXklAuveXnp99IodS5s6EwxV4FM/2KiyVR5hXkjEH+CZ+g4AeBcDpWT37gb9NnSnSkhhJ/HLmZwyWckkIQjh1uoI8jWdB8ty3pBlz2yK4zeddpJmLN+DtSnM1nah8lsfHgVzfc7UZiNph0Vv/kq36ajoFCy0sgr/uMaEDec2YobBhj5H0hPclbnnyG7fqihF/CcJ7WQ/FDDFJyY66nFhe2BCCzcq/NmUankZlgPibeZd+fLrQj+Su2FA4JXX0KSIi+BLITcssYl4QrDyufNJ/0l4Q211pElY4utSuUlz9PMf32EOMGue4nlWzKLmrgcZqmcUQpXUaDhYDVkvL7pWiUl0vQBeUtBZu2vp/CZTHA2fAjJlqq+4L3Qy4BRfIYw1QsThnEh5h/ZbSBRMTsWbPk8xLBamnnyLcmFV6StElJv2yotPeIPVuP+sUI+syXHFpu3NSHWN5MAZ0nUZxarDp2Pa4rs8wuoozk80K9tomk7LdgVbLfnTU7T7bVSsi8HYsK73xtjEJfNnZSA0/1QugPjyQIrOqMd0VjlP8AoaXXpf4n6oOdiUK+UPKRKTpRHWbPWv+AQi69UA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e58bfa9-ae14-4422-fce2-08d854edc313
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2020 18:25:43.1833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t667T2YPSkFLqK1DSSPgdxiTWXxn9Gs6/S0E4biEclnzkhf09qseLgrgFiZ9ITTMVE+xBNfNikb8bqfZSAJP+L7FdiovOy6o6UbE9xY2Wx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3669
Content-Type: multipart/alternative;
 boundary="------------B27C1A27D6046C8029479275"
Content-Language: en-US

--------------B27C1A27D6046C8029479275
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/3/20 9:35 AM, Leon Anavi wrote:
> - Fixed: isort: off comment doesn't work, if it's the top comment
>    in the file.
> - Fixed: reverse_relative setting doesn't have any effect when
>    combined with force_sort_within_sections.
> - Fixed: --skip can error in the case of projects that contain
>    recursive symlinks.
> - Fixed: ensure_newline_before_comments doesn't work if comment is
>    at top of section and sections don't have lines between them.
> - Fixed: comments in imports with ";" can keep isort from
>    recognizing import line.
> - Fixed: As imports removed when combine_star is set.
> - Fixed: --float-to-top has no effect if no import is already at
>    the top.
> - Fixed: isort never settles on module docstring + add import.
> - Fixed: Error raised when repo contains circular symlinks.
> - Fixed: noqa comment is moved from star import to constant
>    import.
> - Fixed: Incorrect placement of import additions.
> - Fixed: isort5 throws error when stdin used on Windows with
>    deprecated args.
> - Added support for specifying config file when using git hook.
> - Added support for coloring diff output.
> - New multi-line grid mode without parentheses.
> - Extensive profile testing.
> - Proprety based testing applied to code snippets.
> - Create automated integration test that includes full code base
>    of largest OpenSource isort users.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-isort_5.4.2.bb => python3-isort_5.5.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-isort_5.4.2.bb => python3-isort_5.5.0.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-isort_5.4.2.bb b/meta-python/recipes-devtools/python/python3-isort_5.5.0.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-isort_5.4.2.bb
> rename to meta-python/recipes-devtools/python/python3-isort_5.5.0.bb
> index 6b1cee40d..ee13d76e5 100644
> --- a/meta-python/recipes-devtools/python/python3-isort_5.4.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-isort_5.5.0.bb
> @@ -4,8 +4,8 @@ LICENSE = "MIT"
>   SECTION = "devel/python"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
>   
> -SRC_URI[md5sum] = "59592b6e14beba48149d651e900e3815"
> -SRC_URI[sha256sum] = "d488ba1c5a2db721669cc180180d5acf84ebdc5af7827f7aaeaa75f73cf0e2b8"
> +SRC_URI[md5sum] = "9560df531409e67ac8796e98ffcb6124"
> +SRC_URI[sha256sum] = "0906e0e7092e060c05de709ad172e1ec1b26aa27fdd4e8093f257890cd881d18"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------B27C1A27D6046C8029479275
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/3/20 9:35 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200903133520.19437-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fixed: isort: off comment doesn't work, if it's the top comment
  in the file.
- Fixed: reverse_relative setting doesn't have any effect when
  combined with force_sort_within_sections.
- Fixed: --skip can error in the case of projects that contain
  recursive symlinks.
- Fixed: ensure_newline_before_comments doesn't work if comment is
  at top of section and sections don't have lines between them.
- Fixed: comments in imports with &quot;;&quot; can keep isort from
  recognizing import line.
- Fixed: As imports removed when combine_star is set.
- Fixed: --float-to-top has no effect if no import is already at
  the top.
- Fixed: isort never settles on module docstring + add import.
- Fixed: Error raised when repo contains circular symlinks.
- Fixed: noqa comment is moved from star import to constant
  import.
- Fixed: Incorrect placement of import additions.
- Fixed: isort5 throws error when stdin used on Windows with
  deprecated args.
- Added support for specifying config file when using git hook.
- Added support for coloring diff output.
- New multi-line grid mode without parentheses.
- Extensive profile testing.
- Proprety based testing applied to code snippets.
- Create automated integration test that includes full code base
  of largest OpenSource isort users.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200903133520.19437-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-isort_5.4.2.bb =&gt; python3-isort_5.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.4.2.bb =&gt; python3-isort_5.5.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.4.2.bb b/meta-python/recipes-devtools/python/python3-isort_5.5.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-isort_5.4.2.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.5.0.bb
index 6b1cee40d..ee13d76e5 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.5.0.bb
@@ -4,8 +4,8 @@ LICENSE = &quot;MIT&quot;
 SECTION = &quot;devel/python&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489">&quot;file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489&quot;</a>
 
-SRC_URI[md5sum] = &quot;59592b6e14beba48149d651e900e3815&quot;
-SRC_URI[sha256sum] = &quot;d488ba1c5a2db721669cc180180d5acf84ebdc5af7827f7aaeaa75f73cf0e2b8&quot;
+SRC_URI[md5sum] = &quot;9560df531409e67ac8796e98ffcb6124&quot;
+SRC_URI[sha256sum] = &quot;0906e0e7092e060c05de709ad172e1ec1b26aa27fdd4e8093f257890cd881d18&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------B27C1A27D6046C8029479275--
