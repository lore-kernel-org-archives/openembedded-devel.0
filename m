Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.76])
 by mx.groups.io with SMTP id smtpd.web11.12680.1598359563963528403
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 05:46:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=K9L31mOX;
 spf=pass (domain: windriver.com, ip: 40.107.100.76, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4FUzrsHQD5iCUKty/2F4F+7It9cmhwRNwW6E1YpffUPE8vuBDmdj+fkxjYD3gAefmWKgDVYV0tIHPxdCStsqmSLQM/5fSvJuwnrZxZkye1y3ALsyHJm59claiWZgpSThwhRk+VdnrcOgwfU6M/6jBvJF1mgbif/dICkgGlr+R9lUN2US0snMUQJT4c6++JcdkbhAuaO/F8PtbRuZ096vbESb5TJBFDXkiR7tR1q2M+lqI5+E9um6dNNc2wbXD/SqY6d/966CcKl1y85sahv2lU4nkg1rq5nwZsGpt+WCbASznppr5I4o1zMTYDyYEZz1B2U6JMKAqbblDAGITVO/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=boI/JZ5KuF8UnFA/0w4SFraP8Ztxh5I8fyTDL/z88LY=;
 b=nCcl6UVHJHtaVdtwCNmD4YqIbRc3sLDq3Z5VIMcYDxGH7v8Zgk/I13TvUnojy69V99vwTyZ86Igfxv+JmkRmACqj39WRtr1GdMH/NPzEWeC5RSWUc34to/v06fo0EYuh7dGjuy4GNT1bJ0EfEUEEYkNpqp9q2Nt0czBkg/1/3qrkWDauWGaWRQFuu3k8zAxBvz5cJ7D4Lg2ITnbZFBo9xyUbCCc/7JZ4c8/9iUWM5TJGRn1ZARK4jkrGNhse+LBDPdhxRVLPN6FJIJN/Eg9+U92rwCPkLghpYkF2HEvN0jF05eOLXS2o6ARnaLo052VgW5n/3H+tVhmecDCdl7YHpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=boI/JZ5KuF8UnFA/0w4SFraP8Ztxh5I8fyTDL/z88LY=;
 b=K9L31mOX0rDy+WxWt6TF1P7VsuU+OkljfP5+cUECK0xVcKXLGFe6FxWWmXYa6A5R4n+8v2WoclB6wVJtWJ9EOsf+Hhgs67kerMIWo1vozG0MPCZ1UmFKbm8MmakT0Fu33rZdTRMQNxsbTi0g4CcdxS9axnMQVztL1VU8AxWRmFU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3976.namprd11.prod.outlook.com (2603:10b6:a03:187::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Tue, 25 Aug
 2020 12:46:02 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 12:46:02 +0000
Subject: Re: [oe] [meta-python][PATCH 5/7] python3-typing-extensions: Upgrade 3.7.4.2 -> 3.7.4.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200824145004.12568-1-leon.anavi@konsulko.com>
 <20200824145004.12568-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <fdcc3ed2-47cb-f030-8d3f-5a65dda888ab@windriver.com>
Date: Tue, 25 Aug 2020 08:45:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200824145004.12568-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::8) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0069.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Tue, 25 Aug 2020 12:46:02 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68a830ef-69f9-4187-1f3b-08d848f4d32b
X-MS-TrafficTypeDiagnostic: BY5PR11MB3976:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB39764DAD0512ABEE539B2EDA9F570@BY5PR11MB3976.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:415;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ztGKZA4tWBdPE8DEdLQAJXb+VWQXE3gBjE8RkbeFsZRkukwziK0sPapb5E4KbqlNHpzu6MqNmvhEbpwyYafwdEuRYqfrw1J7h+qQv3ZDpzIYIv9ZRq+whTkFEJXMwA+iXX4An76qvc4IkJXuUbwqUIsshiwJQwwKsqxBAw5tNbvU9rwQoEmHzqSmqfXy5Bqyb1Ep1RxWjzuVS6jo77TD6tSKvOAnCd7sCG3mMjXbvdB9yyB04/5QQY0XvhfThjrJfOlHnvLJZ2zBbVDnGMsP4g/0+oN+/34Bm+Bi9YsPWaZX/A4Ml2+yPusPQiiW7a7W5x7kBSHNDwP1loBALcZzB2CYkHPasQq0NwOC66NP7p3nRjH9Me6PloE+Ex8Fg9PDWwrIgc7UiCJUEq2KCZ2iY2DSEEzStS0nJ0qm49Hnw+Mc0bt8VWGuhgCtNjOybxa0puyiBDBUh1YKXDfgq/vL1A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39850400004)(376002)(366004)(136003)(66946007)(66556008)(478600001)(26005)(186003)(5660300002)(31696002)(2906002)(83380400001)(31686004)(166002)(8676002)(36756003)(316002)(8936002)(66476007)(966005)(16576012)(86362001)(2616005)(52116002)(33964004)(53546011)(6486002)(44832011)(956004)(6666004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	jmE6dLdnpcwKEnKjIU1+1oGVVRBp+nwHqJ1GRalcWYpKH0lRAy8VFeEffNyQiEwA/jon59QIG5EDIUFjhnt7DQEkHbXFKdD9T9b15ZtStLe1rDRZhoRUA5dL9fq0AlfFHMduI2Gxfr2ZLcWx0EjzfJRzZNpi7foRquooEFfrzIns/xQnai90xGbLpwJSzAAGqmBxXBLdmrpJdxDqqsWn3AJ4iEafsDF0FNMZekJU6NY0pM4QDMjL5SYHuUxs7NF0xCNuCD6oNEPqrFWL1UGdhosFvf7UiS3GUuKYfgEZJa4967+LWXC8R02TT9/0bzuohA73XWgD3CcGuffasj9ATWYZs9ijZQBAvQgSaZyeLiatn+dI11ADcj3+aA1IsqWJQ8Pnxye7KCzqgBdaU9funeXep5+HV4D2C8X2eBzogH4r3XOZnJlpuxQucxO2l5LrHae6wR9Ml+FVPuI2sBMm+EjiX7llicnGoNbZPaSn2r7QG3NwirIEvv2bgeh/jTRpa0N+GUSKVTn5vM2hvJ17pW6rty3WbBgs0bUj3cbLaMAlYUYl6mbQW960ojd6hpMKY34gdQXZYskg5Z6QX7VMC68ShrKQJj0j/94DVMdUwXd/W4zAGYuCdRt3oI6jcD+n1PT8k7hZqvVGKvsRq7SriQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a830ef-69f9-4187-1f3b-08d848f4d32b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 12:46:02.6662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TG5wThA7btb4h1pHYTQ2cKWvHJR4cqLC/E/U5Tv6GlLLTALIUoTM+JLTbxSfFGFjAzzQ9K3WL/0y+jKTGDe5X0n4icCANjIyfzyh93WG994=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3976
Content-Type: multipart/alternative;
 boundary="------------D8BD79CC6552047F1CF84385"
Content-Language: en-US

--------------D8BD79CC6552047F1CF84385
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/24/20 10:50 AM, Leon Anavi wrote:
> Upgrade to release 3.7.4.3:
>
> - Add SupportsIndex, added in Python 3.8
> - Make tests for Annotated work with Python 3.9
> - Add PEP 613 TypeAlias to typing_extensions
> - Add tox.ini for typing_extensions
> - Remove extra 'use' in readme
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...nsions_3.7.4.2.bb => python3-typing-extensions_3.7.4.3.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-typing-extensions_3.7.4.2.bb => python3-typing-extensions_3.7.4.3.bb} (66%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-typing-extensions_3.7.4.2.bb b/meta-python/recipes-devtools/python/python3-typing-extensions_3.7.4.3.bb
> similarity index 66%
> rename from meta-python/recipes-devtools/python/python3-typing-extensions_3.7.4.2.bb
> rename to meta-python/recipes-devtools/python/python3-typing-extensions_3.7.4.3.bb
> index 51e9eda2e..8ef15fab7 100644
> --- a/meta-python/recipes-devtools/python/python3-typing-extensions_3.7.4.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-typing-extensions_3.7.4.3.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f"
>   # The name on PyPi is slightly different.
>   PYPI_PACKAGE = "typing_extensions"
>   
> -SRC_URI[md5sum] = "f2674282966dc088d10170c2347431cc"
> -SRC_URI[sha256sum] = "79ee589a3caca649a9bfd2a8de4709837400dfa00b6cc81962a1e6a1815969ae"
> +SRC_URI[md5sum] = "5fcbfcb22e6f8c9bf23fb9f8e020f6ee"
> +SRC_URI[sha256sum] = "99d4073b617d30288f569d3f13d2bd7548c3a7e4c8de87db09a9d29bb3a4a60c"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------D8BD79CC6552047F1CF84385
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/24/20 10:50 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200824145004.12568-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.7.4.3:

- Add SupportsIndex, added in Python 3.8
- Make tests for Annotated work with Python 3.9
- Add PEP 613 TypeAlias to typing_extensions
- Add tox.ini for typing_extensions
- Remove extra 'use' in readme

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200824145004.12568-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...nsions_3.7.4.2.bb =&gt; python3-typing-extensions_3.7.4.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-typing-extensions_3.7.4.2.bb =&gt; python3-typing-extensions_3.7.4.3.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-typing-extensions_3.7.4.2.bb b/meta-python/recipes-devtools/python/python3-typing-extensions_3.7.4.3.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-typing-extensions_3.7.4.2.bb
rename to meta-python/recipes-devtools/python/python3-typing-extensions_3.7.4.3.bb
index 51e9eda2e..8ef15fab7 100644
--- a/meta-python/recipes-devtools/python/python3-typing-extensions_3.7.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-typing-extensions_3.7.4.3.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f">&quot;file://LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f&quot;</a>
 # The name on PyPi is slightly different.
 PYPI_PACKAGE = &quot;typing_extensions&quot;
 
-SRC_URI[md5sum] = &quot;f2674282966dc088d10170c2347431cc&quot;
-SRC_URI[sha256sum] = &quot;79ee589a3caca649a9bfd2a8de4709837400dfa00b6cc81962a1e6a1815969ae&quot;
+SRC_URI[md5sum] = &quot;5fcbfcb22e6f8c9bf23fb9f8e020f6ee&quot;
+SRC_URI[sha256sum] = &quot;99d4073b617d30288f569d3f13d2bd7548c3a7e4c8de87db09a9d29bb3a4a60c&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------D8BD79CC6552047F1CF84385--
