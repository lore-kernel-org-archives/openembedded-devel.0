Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.87])
 by mx.groups.io with SMTP id smtpd.web11.25389.1598552269250726452
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 11:17:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WvFPyYAI;
 spf=pass (domain: windriver.com, ip: 40.107.243.87, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KINRGoP7XEv1aA6R4EzFErPD1Pj3xfT6varsRAB/sEJVk7Smr0etto9SE2quyK/pPGMzSirBKoI8DyipqpvLgRt8no+jbzfWGHnEB11wf9p5ANL/kdpePZX0f5aWAWOpVJHK9y8K+Es0bxGyeMhstgFnzXbQlcC7PhvullY/OV7ZejQiM1spuGwbU/BczKDLuQozGhIhPtjfDKiqluY+tifJ0aNaJZWJub/7rs8iy5/wcKBza/c08FzeA9Wk9WleGLRB/NHzX1LjccdOsGAkNJ2IRWq1DO2U2+n5B/+06DPZjfOIOwIEE6KDSwVCGjiaPFHFMUQDykJl2eBB32SmhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVR2QXgkaqPxsos6fT3+nhd+5tTgic7aBBx4a/AbGrw=;
 b=P4HkJKvG70WqHi6vbCIcaMGNjFysWM6GFcG2rCqcD8jHEVT3UQELyBIWQjokNTq0rugr0pXI/ta8RuiKu9B4iVDYQqfNmBjFRzCpY0wSDRbvoXi0x0HfL8X025Z9nsECVG+Aub8lla3CTWK+w9vUl3ueMV9G8D9OCMeDIck9y07/Z9NaSOC/utBzKt81qINe+efzbKCAKc1eiievMQ3En71NdIeUaAEovmXnCQNzaQqmOOxkNxC/m2qnT4CxXl/0k9E4HjRnWA88N8ISZYgf8YimHZHXi/B0M87GnruKAW6y9LrHX109F6qsNYvOJmbPx2iDlrVcnMD2CUm23MMcbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVR2QXgkaqPxsos6fT3+nhd+5tTgic7aBBx4a/AbGrw=;
 b=WvFPyYAIsG16FozxXU0hoyPhVQLdO04WDabz89dERr8vKcEXgKAN6GJDA2KCUa9DD/4Q1+7IjbKL5Q8EjekMTYtBVohi0ckQbaM8VxW3Cdlkdz6/4gZV5A7G++8yJbgP0y6XLMAcc2KHFA8nregXcULxzl8kOUjPKeEZTsht2bE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2726.namprd11.prod.outlook.com (2603:10b6:a02:be::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Thu, 27 Aug
 2020 18:17:48 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Thu, 27 Aug 2020
 18:17:48 +0000
Subject: Re: [oe] [meta-python][PATCH 4/7] python3-cmd2: Upgrade 1.3.3 -> 1.3.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200825132633.875-1-leon.anavi@konsulko.com>
 <20200825132633.875-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <48c426f6-aa2d-37e5-041f-eb5e17b4bc65@windriver.com>
Date: Thu, 27 Aug 2020 14:17:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200825132633.875-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::36) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTOPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.20 via Frontend Transport; Thu, 27 Aug 2020 18:17:47 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81bdf0f4-918a-45f2-6a35-08d84ab58083
X-MS-TrafficTypeDiagnostic: BYAPR11MB2726:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2726A521DF8B0505BA5601179F550@BYAPR11MB2726.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:213;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jFHycOrqx6sXI0NoxnOtpVM/T9SrJZiWsD1bxKwFuX/5DD++TIyyMm6RWkvR1MdFSn1/vJp5S36IMrb74SZ4xTRl9zKikBKZ/jYyUIJzcPDL0dXAE5QhKTzlcCC0ZprPIQVDdAhmjcmOHLBPM80+UhrS/hdEnsmx4q++ij50MyaqjfRaPKKBDi+szaQp2pWmpEFEqu8azBOT1TI1RZFOfTxO4HLoE+CkzoJFmxwXCnDCxishZr2kj1LA6enQGLxGMM+xIKR4/FrHqy/i5JvOGY9NiOvN+q22lH3/6At8SspL5PQ4ocJZj4US6HnStReA+oh4dXnzTjVIm2k6K+WJ8viDx3piPdy1Mjv3lrCRaoTST6oZW6tUrn9wmBY5qqNxVpgAxko0N43RySk+FxHIbqNcTOiSvbrPouahydKITism9U9tWtg7e3Mv+9m/dV7LjttFxv4ksy4DiU2CQtcJdw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(366004)(136003)(346002)(5660300002)(66556008)(2616005)(956004)(26005)(31696002)(8936002)(6486002)(83380400001)(33964004)(966005)(66946007)(31686004)(86362001)(2906002)(186003)(66476007)(53546011)(52116002)(166002)(8676002)(36756003)(316002)(478600001)(44832011)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	nCQVbRAe5+vHT+vFoPzdgSDwzNh6gMnpr9P6riWZz+n5H8xSxM14iCh6bKvNhvaQ/MKEB+SmV8rnvKdOvlwp/5iF2v+DuEPTIMGliQzdoI1IhBE4hFORdJcgUBdzlrz2Ur8NyNdeb/WWQgcZlOaNjRCDNOPCilOSARst9KKQIQSGlcZbKZbs9Edb8lY6MgHGEczMXHhdzOG4VVzuUtIg2d6NjFK3fe9NLY7sig3sfWL197nbXH8vS+M1Tj/HtOwvwQopgLTci4pql948JOTkCoHDiuOhFbmFP0+8PEUcQ97eVjQ52q2aKKa4d93D+3pOyz4zFq1wTuGxk5gZ62JVzr6I8GPW1fmRIxhpDlLHvU8FSW3/J0/XWaN5h89d26R4tJ/DMwpSFu9KUz8UeKrfUeRlTypLU4QbmWphHdGf/bCc70CVWgW5OhIVmKH3LM7VHBp2nxJ7JiPgQtncAAYpO4YUuypjeOypsIXn/6jKhJEw6IFIXHxbRlPWTIpaoLG63OSS5/mWNn18C1PlDjO6U6YeQERJYRlSk6IshupSwOY6VKCzglbzAWrpWxifdAIzT23FgZ/6YZppXG1sCq/GtAwiDqS+UXfIepO7cVZw88xbEl6uM3r9UxZgyQbzBGAKDlFIchh4S84zKvrSt9GpfQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81bdf0f4-918a-45f2-6a35-08d84ab58083
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 18:17:48.0386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4uTgAYMFw2k7qdImgGHZBs4wVVmpqzuN5xvCoMV3aC5u08AMTe+1BsWEqUEX1Oc6K3/sQDlAKVEP2musHkTXqU83m7YGfLMkhDPJ9/nPbFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2726
Content-Type: multipart/alternative;
 boundary="------------0A0F6D33C63203EA8F75C451"
Content-Language: en-US

--------------0A0F6D33C63203EA8F75C451
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/25/20 9:26 AM, Leon Anavi wrote:
> Upgrade to release 1.3.4:
>
> - Fixed AttributeError when CommandSet that uses
>    as_subcommand_to decorator is loaded during cmd2.Cmd.__init__()
> - Improved exception messages when using mock without spec=True
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-cmd2_1.3.3.bb => python3-cmd2_1.3.4.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cmd2_1.3.3.bb => python3-cmd2_1.3.4.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.3.3.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.3.4.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-cmd2_1.3.3.bb
> rename to meta-python/recipes-devtools/python/python3-cmd2_1.3.4.bb
> index a44f02f00..ab05b82e1 100644
> --- a/meta-python/recipes-devtools/python/python3-cmd2_1.3.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-cmd2_1.3.4.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
>   
>   DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>   
> -SRC_URI[md5sum] = "c8ffa926c50673f00fd8ff8533e9f959"
> -SRC_URI[sha256sum] = "38015008ff4639edfd66591063a0e9bb75a62dccb14ee3ec7bf3a6cb130de5cf"
> +SRC_URI[md5sum] = "6b746468d1fd606b5dd96058dde0c5ac"
> +SRC_URI[sha256sum] = "b56f82f3ef3c9a0aa08423e25a97516a3e19239b051426be5686611786fd6032"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------0A0F6D33C63203EA8F75C451
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/25/20 9:26 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200825132633.875-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.3.4:

- Fixed AttributeError when CommandSet that uses
  as_subcommand_to decorator is loaded during cmd2.Cmd.__init__()
- Improved exception messages when using mock without spec=True

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200825132633.875-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-cmd2_1.3.3.bb =&gt; python3-cmd2_1.3.4.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_1.3.3.bb =&gt; python3-cmd2_1.3.4.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.3.3.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.3.4.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cmd2_1.3.3.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_1.3.4.bb
index a44f02f00..ab05b82e1 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_1.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_1.3.4.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def">&quot;file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def&quot;</a>
 
 DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 
-SRC_URI[md5sum] = &quot;c8ffa926c50673f00fd8ff8533e9f959&quot;
-SRC_URI[sha256sum] = &quot;38015008ff4639edfd66591063a0e9bb75a62dccb14ee3ec7bf3a6cb130de5cf&quot;
+SRC_URI[md5sum] = &quot;6b746468d1fd606b5dd96058dde0c5ac&quot;
+SRC_URI[sha256sum] = &quot;b56f82f3ef3c9a0aa08423e25a97516a3e19239b051426be5686611786fd6032&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------0A0F6D33C63203EA8F75C451--
