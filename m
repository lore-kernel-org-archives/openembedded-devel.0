Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.46])
 by mx.groups.io with SMTP id smtpd.web09.12096.1603110600339557955
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2020 05:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=MFGEm5VP;
 spf=pass (domain: windriver.com, ip: 40.107.243.46, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7+GRVO+CziIDQpEWWFBzTm4le+zqHO9L1hWJ67FqD61G3y8FVZnpfxVpd3cKufVVPl+hzU9EzzXGTIHIFLyzcuKZVxyWR4UrRa6WEDWu07tGw3xTV62A0IIQaUDwDmu75M/RAN5kvKqm2IpVYV3kM6q3ufKf+TKEwoEV1R5lPLxJEE4+PyaybbnsY3rEbAypw4Zlck1DazO5WCrz+KZ0N62Ynm1ps2JzURSqtXp+TQT/7cF/3Y+EFDfGQUCzcz3Mx6zj1QUeewTVyvXzWPITWvUSBoyRalzzXRNWjbfDhP0Wk0PFwzMePib8IEEW774/Qa0KbzoBuP93586BNbQYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUpI/xoWdt+1tTaRD+QwXUg0Y6WXUby9XJWkqC2nvWM=;
 b=VuBgGd1VkbcSBkO7zCmJJYfy107jaou3c9zty8QfVRukasP3OPqEe+B5i5lzZXfb07BcgCC6Taazup0peQEcWue1gYSV/dKB6fUErbvkVTE/akeO8yqTltobVAibY2INF33nsgkrCaxsSJovrBORhMMktyuXu0cnAT5ApEcCPggZebhPeBuHUJKod3YBmsiQsNUA7rXlcXCmSErNpulcVo4J3g4KqClWMKGiLscewOluWL9lbSVohICZv2FsM5y5mzunEkAFzaRZwlHU0xWelhPzFTtYShqdjxzWIeyWG3MEpAzSPuwiT8HN28LgmZn9lScDGPv6LuM6p93MAkdQiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUpI/xoWdt+1tTaRD+QwXUg0Y6WXUby9XJWkqC2nvWM=;
 b=MFGEm5VPgx38w91D214blOsBWczTbPuhw85w2WE7g3px9G25GDeNyZFgsMuS6gkmWBwohfPyjsv7KoAiV9oZvU+PVb4SwRh/j3b1Jft6Pq5NsqFBtjRmu07m2acE953vlgl3pPx3monDGuyNOMSMUQGs4AwbrhoODqdfd1HxeFY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4323.namprd11.prod.outlook.com (2603:10b6:a03:1c2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22; Mon, 19 Oct
 2020 12:29:57 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 12:29:57 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-markdown: Upgrade 3.3 -> 3.3.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201014073256.9605-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ad49fbbd-500f-4dae-8f2c-9ba13178d15c@windriver.com>
Date: Mon, 19 Oct 2020 08:29:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201014073256.9605-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR08CA0023.namprd08.prod.outlook.com
 (2603:10b6:a03:100::36) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR08CA0023.namprd08.prod.outlook.com (2603:10b6:a03:100::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.23 via Frontend Transport; Mon, 19 Oct 2020 12:29:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80e9f7d3-a46d-482a-2261-08d8742ab080
X-MS-TrafficTypeDiagnostic: BY5PR11MB4323:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB432396746460C6D67FF5602A9F1E0@BY5PR11MB4323.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MEXIynhC11eDhy7kBpzO7TqPY8g6Sypd2JdB1r6OcswesFxkMSaM1gtox5NBHzO/UWTcLSZeHrig5CODvaFf5VjgiomuCoslY3qDZAOEzqUvuatAYvYCj+AsbfDZgk/BV5oyslpvrQucqnSf3Zxo4SpgQs+uWP2yTIHdBVIRc8NM6vdzD2P9jFPlt1gS0oeNuaYiXEqeglPSlZ5cj/aXqZCBAAZXEA3WJBERGCJAbCFZoYRJTcuIy92w8oPTPz6Ut/RPsbldBmd4aZtMGfq/jP+6APd160OepnvBm5Tu4HhQHJHmKQmxudJ9z9lqNXu6cBuniaDN+5Yv2AM39lswWPm8mXMbkosCETzYBC7MN1P35Mwj7urF1nhbYbH1b5ifLon4HemVPpQpWhJfvCQY6+IXlE2/xmgHhNOgkbe3Gbb+RywcLAUqLnjzwkaAFS7q8NT5LCFNVl5lg0noCH2cKA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39850400004)(366004)(376002)(33964004)(6486002)(316002)(66556008)(66476007)(2616005)(66946007)(86362001)(956004)(52116002)(8936002)(166002)(36756003)(2906002)(16576012)(53546011)(83380400001)(478600001)(186003)(31686004)(16526019)(966005)(44832011)(8676002)(31696002)(26005)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	YAEt/7iUP32DJxhi1mowDgbhoqeDnQtWTwOvI1EXdXcOOybas7ZwdPc9Mrc2Y6y0fDfQcZB5SNLT2hKB35VKz+2mUhjBoCx8l5FTRK2Pg71+NnLAxzq1cpBu5rVQUBj+xVbu6I8Zot4lbIh6yvCJddetJJApCPTbMagxPum9Pi+ewDXO9EeVhtehXsG+/b49gnGcb6L9D0kHxJk1gRI3w0/FbMQPZ5/SaGICydcoueaRld8LFAmk3hz26gQLJl30llDwFOeQjyEuE9ovqc7pfGq2oXB7kEgOijN1d00jmTHkUYvZbjizECMSZaAhau+hz12CShFXLBNpGFjvumiZqXQ1mM/G7BaeC1AH0XwVEw/cieZMowxMJ+cX4eHk0/4Ys/B4xAs3d1wYQbQaMgXl0HFtaLMo/1viCEuACmxHzXbxGFT7zgc0iEqygatnuxtReALp1sVoR6AWV566xPrewQoxLaBuPpaPOJB7IBA7Jdu4Q1P1kShGGiA+XfPoB7CrGPJhHdN9h0rs9fM2ot3NkhNG/plDghaK2FhRrAI/d51tgKJlZk1y+m7ryw0CV90LeCtTeR+lijZTvLGBXEs+hpLZ3qjukfSEyxAuyZqXKONqZSOJBWDf4vY+la8EjoLd/HI2hCnewxn+8XhAT9Cc7g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e9f7d3-a46d-482a-2261-08d8742ab080
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 12:29:57.4239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: psI9imYzCWFXBlJVF3NJWzB60oQLd9jHtRWYL91DmzVdxZBCcSWQp6QF0NFAvcOWr3ZjK6DP0Afq3WSHsm1vu1fTacBUThfltrdPVO2HEtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4323
Content-Type: multipart/alternative;
 boundary="------------941E0921BD11DCEE8739B1CD"
Content-Language: en-US

--------------941E0921BD11DCEE8739B1CD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/14/20 3:32 AM, Leon Anavi wrote:
> - Correctly parse raw script and style tags
> - Ensure consistent class handling by fenced_code and codehilite
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-markdown_3.3.bb => python3-markdown_3.3.1.bb}    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-markdown_3.3.bb => python3-markdown_3.3.1.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-markdown_3.3.bb b/meta-python/recipes-devtools/python/python3-markdown_3.3.1.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-markdown_3.3.bb
> rename to meta-python/recipes-devtools/python/python3-markdown_3.3.1.bb
> index db8311be5d..8c6830b47d 100644
> --- a/meta-python/recipes-devtools/python/python3-markdown_3.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-markdown_3.3.1.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
>   inherit pypi setuptools3
>   
>   PYPI_PACKAGE = "Markdown"
> -SRC_URI[md5sum] = "76eb34a058bb8b637ccadc4ce384bae4"
> -SRC_URI[sha256sum] = "4f4172a4e989b97f96860fa434b89895069c576e2b537c4b4eed265266a7affc"
> +SRC_URI[md5sum] = "c7b68676df277df34342bb9a27f7fe30"
> +SRC_URI[sha256sum] = "c3ce9ebb035c078cac0f2036068d054e7dc34354eeecc49c173c33c96b124af6"
>   
>   BBCLASSEXTEND = "native"
>   
>
> 
>

--------------941E0921BD11DCEE8739B1CD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/14/20 3:32 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201014073256.9605-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Correctly parse raw script and style tags
- Ensure consistent class handling by fenced_code and codehilite

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20201014073256.9605-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-markdown_3.3.bb =&gt; python3-markdown_3.3.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-markdown_3.3.bb =&gt; python3-markdown_3.3.1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-markdown_3.3.bb b/meta-python/recipes-devtools/python/python3-markdown_3.3.1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-markdown_3.3.bb
rename to meta-python/recipes-devtools/python/python3-markdown_3.3.1.bb
index db8311be5d..8c6830b47d 100644
--- a/meta-python/recipes-devtools/python/python3-markdown_3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-markdown_3.3.1.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed">&quot;file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed&quot;</a>
 inherit pypi setuptools3
 
 PYPI_PACKAGE = &quot;Markdown&quot;
-SRC_URI[md5sum] = &quot;76eb34a058bb8b637ccadc4ce384bae4&quot;
-SRC_URI[sha256sum] = &quot;4f4172a4e989b97f96860fa434b89895069c576e2b537c4b4eed265266a7affc&quot;
+SRC_URI[md5sum] = &quot;c7b68676df277df34342bb9a27f7fe30&quot;
+SRC_URI[sha256sum] = &quot;c3ce9ebb035c078cac0f2036068d054e7dc34354eeecc49c173c33c96b124af6&quot;
 
 BBCLASSEXTEND = &quot;native&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------941E0921BD11DCEE8739B1CD--
