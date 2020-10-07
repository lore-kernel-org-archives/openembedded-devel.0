Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.84])
 by mx.groups.io with SMTP id smtpd.web11.1512.1602078523338613921
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2020 06:48:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Z4IYeLB3;
 spf=pass (domain: windriver.com, ip: 40.107.236.84, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TXB3JYzYGW6eL8PbL4w/gQaNPeXGE1Y57uEGwbTOYzVT14AdqI+HH7dBLWTzdclUNQjIRwJQ0nkAOCZivJKW2POEnM7ch+XwNmwIm0BM7nZcJi70i0rMsv11bxETXuu2w1T1fAbFuLXalOnYYFi2wuj3A///8n3CPtdjibzvwYQf0hayDZa0trWRcXDIGrOwg9+4wG+V6y9WLFojX177vJkD4VfCzvrmWUtckMlSdK9FIe29/mNmzuTvAkL1f4y5qGFGM1l//wwMneVlmt9bsDgOi2EUBWot68ieJdyek1caq+cCTyNvrJxgU+QsUyp7ORX+PN2rA1ZfxAZzwuLLOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Byc2s8fxv48UUWsP+OamjICZWZnAgGpgNsob9uA17lY=;
 b=MyO0PE8O4k+8BiyCwkcZXYALerIE+4ZmzfrbQAodPb9MNcBtxBQILLBMWx+bTzXhKGLgWXyAycESwqj/bYeEzfO6u5IJGErKoL1V1iVGv8DVr53GrJZ54rRi+u+v46MhqDL2BMnE24EsHc+v/jZoKCgxyiYyXDnb3dmbvP2YgFU7SI5I2ktv9oukm699JgVoi1GedDJEzfL7wkWFDiqv98OxjOu5i73b6dgXCkCEeQtL1v+8QPIlCNYHg0ksYiAjCpdret27tzVf85QySIq78ONPWJajGercjPd1FBEfRiHRZOrVdIZPya39oQ3XDg+lU5QX3BjEt0NUNaFP0E7Q6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Byc2s8fxv48UUWsP+OamjICZWZnAgGpgNsob9uA17lY=;
 b=Z4IYeLB3dfVyzLQ4+vrvKDOFY5SutGKPneFT2er0UJHsvGkWBmUC3TMh2uiAPsvYRwCmTnib55ZLjErNjvhqwUlgBPEmmFytfCq5wPCNPU4pW2E37wtec7rETl9IOsP7QYy/v/iyD6S56qB/UJ9apKDbhuvQSiJb+znyTU/3BU4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2536.namprd11.prod.outlook.com (2603:10b6:a02:c4::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Wed, 7 Oct
 2020 13:48:41 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3433.045; Wed, 7 Oct 2020
 13:48:41 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-cmd2: Upgrade 1.3.10 -> 1.3.11
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201006090526.24310-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f8cc9ecc-cd3c-a66a-8a5e-c37c0ec0df1a@windriver.com>
Date: Wed, 7 Oct 2020 09:48:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201006090526.24310-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22 via Frontend Transport; Wed, 7 Oct 2020 13:48:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68be0903-3b4a-42c3-215c-08d86ac7b383
X-MS-TrafficTypeDiagnostic: BYAPR11MB2536:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2536FD7D0FAA50DC75144A609F0A0@BYAPR11MB2536.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8QnHM1owhhJ9HCu2VQgRcYBoYUToH8RhNNW+WDlBwBy1xTJiUhguYQlzua1VUx+XtGZavQMkqUfgIs5LLS0L9yn7t1UNr8ve2fzc4hgKnuRs7pbe2GC86vmCJfu72gw2qCPhVu7keDk03mZwxozmaUmSxMdhOh6SA0e0uHTKlusCe16WiPal0EftnoqvVzDJf/JizUgOgyJmt5ksVD0psRKHeJJVW+W4mYFrHGndMu/07TaimbkBi+yjYp9Q8iH9Ne2gBVeYPIyDNEPWpEQ10VIc21ZF96UnpDgCpIwN3GePE+lnKGNOvfungbxr+yQEwTdKOj/I2KJNE5ExMqzl5An3ti4AaXzqNOebGFPSABcqse2GKmETNYNC/MEyFVvWLh296wW4cwuVJK6uOAEhBOC+0oSkdoCnwH/uAbOj79KNcD84hh5rknHgvJQ5NnZ8R0WpNTgCngw7EQ/1UGr+Vg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(136003)(346002)(376002)(366004)(396003)(86362001)(16526019)(26005)(186003)(166002)(66556008)(66476007)(66946007)(83380400001)(2616005)(956004)(316002)(52116002)(16576012)(8936002)(8676002)(31696002)(6486002)(33964004)(5660300002)(83080400001)(53546011)(478600001)(36756003)(966005)(44832011)(2906002)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	c0evXBwhldrdeVxwj6+583aRPFsSajjiuKjyPm8/oN8Ek5QXtzM7pCX30xj1xAfq2SN4B6HcRZYcPI7t++Jm58QChRlfKpgqa6Q8P7K0MDfBWStEE++ng1DHPRUo25SBpiLvN7OVRSfhjOzif0I7BAkeHk1m+Rfr9W/q15JPDg1213+s2eulPtobs/xZNIsePiJQ1XLHX8tTjPTdJltdFxNCmX01JNqAZfu0JZLKL1gGm1irBaFJ0ofhga/RzhI3vsIWNESxvTLteRhWuqGFZicafM2Lxaxs94/HtSFJpJRMD6giO6B5xjllzlgFJ16cXh3FQXUPYNc8ShvKFplKrHgywxR9ExuON5164CUIWA04NTWBzdP05/6hQ+yWwTCS1eHeqAvEozyYKts+PPCmDVv964w5ufS1yyTZpkPL2FuVJ2mzYUWUOsKCzI5oylI/KWYOfkzlcLhMh4kf5SoGNTclq+C9JiweTqdEMJhJccloufV97E/UP0/wnf0bscHqjLQQgS5yIk2tmuj4OYjPwVenZRR48uPNGYOcealTp8ArDi5+p68iV6X3n9XjKto5+LhjgHLD3Bl2Lo8SAX6NBcvSX/X6ap23Zhs0Ro/K+diI2ugJ8U0f1y4ltoDuApZb7BFhoXDmBk6GFtIrt5kaJQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68be0903-3b4a-42c3-215c-08d86ac7b383
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 13:48:41.8604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tN7yAsG0vm+mPV4AHSLNvnh/8uEZCY2Kpbx/7MO+vf9wUA4BxRxRSRZCfE9M8r8hG+POZf4PGtcT8UMvxB4Bn5dtFKcrfdeNDh1LanidGYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2536
Content-Type: multipart/alternative;
 boundary="------------437B571B02CD3C0F9FCD5217"
Content-Language: en-US

--------------437B571B02CD3C0F9FCD5217
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/6/20 5:05 AM, Leon Anavi wrote:
> - Fixed issue where quoted redirectors and terminators in aliases
>    and macros were not being restored when read from a startup
>    script.
> - Fixed issue where instantiating more than one cmd2-based class
>    which uses the @as_subcommand_to decorator resulted in
>    duplicated help text in the base command the subcommands belong
>    to.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-cmd2_1.3.10.bb => python3-cmd2_1.3.11.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cmd2_1.3.10.bb => python3-cmd2_1.3.11.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.3.10.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.3.11.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-cmd2_1.3.10.bb
> rename to meta-python/recipes-devtools/python/python3-cmd2_1.3.11.bb
> index 7b74187838..3b2aa5b744 100644
> --- a/meta-python/recipes-devtools/python/python3-cmd2_1.3.10.bb
> +++ b/meta-python/recipes-devtools/python/python3-cmd2_1.3.11.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
>   
>   DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>   
> -SRC_URI[md5sum] = "39258e1af392e0bcefceb1982d7716bd"
> -SRC_URI[sha256sum] = "960d8288c8e3a093d04975e3dd8461ce2e43c1d0c70e54873f622f8f0b77d6f5"
> +SRC_URI[md5sum] = "7e3dbe0aefa331e80f515d3c41cc3b8c"
> +SRC_URI[sha256sum] = "826a288ee6d9c4ec1184e64e9566c09d3b73be8f4283c1898fa4332f1daf8dbf"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------437B571B02CD3C0F9FCD5217
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/6/20 5:05 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201006090526.24310-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fixed issue where quoted redirectors and terminators in aliases
  and macros were not being restored when read from a startup
  script.
- Fixed issue where instantiating more than one cmd2-based class
  which uses the @as_subcommand_to decorator resulted in
  duplicated help text in the base command the subcommands belong
  to.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201006090526.24310-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-cmd2_1.3.10.bb =&gt; python3-cmd2_1.3.11.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_1.3.10.bb =&gt; python3-cmd2_1.3.11.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.3.10.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.3.11.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cmd2_1.3.10.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_1.3.11.bb
index 7b74187838..3b2aa5b744 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_1.3.10.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_1.3.11.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def">&quot;file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def&quot;</a>
 
 DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 
-SRC_URI[md5sum] = &quot;39258e1af392e0bcefceb1982d7716bd&quot;
-SRC_URI[sha256sum] = &quot;960d8288c8e3a093d04975e3dd8461ce2e43c1d0c70e54873f622f8f0b77d6f5&quot;
+SRC_URI[md5sum] = &quot;7e3dbe0aefa331e80f515d3c41cc3b8c&quot;
+SRC_URI[sha256sum] = &quot;826a288ee6d9c4ec1184e64e9566c09d3b73be8f4283c1898fa4332f1daf8dbf&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------437B571B02CD3C0F9FCD5217--
