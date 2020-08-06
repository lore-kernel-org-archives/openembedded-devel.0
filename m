Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.73])
 by mx.groups.io with SMTP id smtpd.web10.5875.1596718850923770501
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2020 06:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TgXsm4KG;
 spf=pass (domain: windriver.com, ip: 40.107.93.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=le5jabWajAeo6wR762ZGLl/3VUdzq5o3cf5tuzYGAAJpL10Utd4nfzcZ0E0pPerHUWtTwuKbT+Uv71QiKfLbsWcccv469SWER0zEuDhTENmudTvESIeU/qKH8geH/2MJL7iiGJD0+8VNd7zRdNac1I1EmTb+G4WCm+QbWtoSVSFPrme7NPcUtEHs3Xw8IUblHfQ82z2alTUCs3xURZdlobADrnhrUFwCXZP4hWXLFunxV4oNgtfMR/ko6KnGKRSgkSyfSI+giJ7rWQMYnibsJ6icnsbYZqSVtQ7zseW7PB4mlCWOL9QNxxm9Np95ENq2CfojgQII+spcsrdfEV3+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ooAywW6nr2rV+jlvylW3Hw7nw5tXeV7JRA37bnlOELU=;
 b=MuIuAXGlTG849/gE3BxAZcfsKUWvAAGgv5KsQ6HACJRldwtoublaDRop2KGoWEhsBC/EcvSAJBP5NS7ByZZrM7s7phtblbJEB99agDDip+pP/1rxzOdYDEwr0FIVIDJQJ1xNhqqDisy2FVkLYrE0I+tkdHq3s+t/BtsOrdTEfnHsWoLTQlINjDXRjJQ1jno2E9yqNkw0mXPVwxsZ6e3UzVhdunnSAVkftBr/iVpeOSi08Z5JxMRYTVP9lceeqP4VUBjK8M8hDxsU75t00ugmur7zxMJf5c3/HLalxLyGtz0Zvt77FfUNJY9boFjAh289eU7y+UFRUnBF1myohs9RPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ooAywW6nr2rV+jlvylW3Hw7nw5tXeV7JRA37bnlOELU=;
 b=TgXsm4KG5hBCyg6jLbABGK2PCct5woyOi9/9O/p6liKtKXpnp8qYJtzaZq19WpyozgLOuDi6PZP84BkZKVTdc5V+X/HMUSgZC9fnEnPfKRH6srZdpRL9OrkLxknovIxBvE7t1SXxE9P5A99rsKK9/h8juG/1DoOq84RLdvwc+dk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4305.namprd11.prod.outlook.com (2603:10b6:a03:1bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Thu, 6 Aug
 2020 13:00:49 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.016; Thu, 6 Aug 2020
 13:00:49 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-isort: Upgrade 5.1.4 -> 5.2.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200803095759.9591-1-leon.anavi@konsulko.com>
 <20200803095759.9591-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6f3a43d2-1e87-03a7-dad2-5a21c19a08c7@windriver.com>
Date: Thu, 6 Aug 2020 09:00:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200803095759.9591-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0156.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::35) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0156.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Thu, 6 Aug 2020 13:00:49 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a687c978-c262-4c4f-ea25-08d83a08be09
X-MS-TrafficTypeDiagnostic: BY5PR11MB4305:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB43057BCE68961A23673168499F480@BY5PR11MB4305.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5XH+41SFcc6TcqKAWrivECoZq2VQyNUevIOfbd6xHR5d7qwFMM6dSrPM0hbcOXEqKTLrP7coHmhaUust5RDRRJKKMvZQ28Buo1eLjVWqqSQ9RLZnWqNHtLLbum3tT3hDOUeND0qY20YCF7ZW45WxL4l5bAbBp65yjcQ+YXNPGiUKNPgiu05iLZfOmf26Oi1LCTzi5q8ExbnzDU+O7PNn5LeB//BYyBkZJqKO8OnwcldhkkaEPgLxznjuMVPwDVcPkhIEPp3jlW90hZrPSxlktSFOr2/z0d3PE6hvS6nHOhAGUyDpK5LCN2MeA6+BMi7aPcrCSZJUCps+L1nWKGDV2FyDWXhDuLgFNpTMGb7k/dm8W7CAdo0Ed6c2wem5TIhoysFrL3m3rQNc/Hvptw1YDFnnru9HHf+ccRxHrkWeKMuq4Dy4pbSWrac4NfzyRhBU8HmbWGOjtN8A1nOjkKt4RQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(346002)(366004)(396003)(136003)(2616005)(44832011)(26005)(86362001)(186003)(16526019)(31686004)(956004)(5660300002)(16576012)(316002)(478600001)(966005)(52116002)(2906002)(6486002)(166002)(8676002)(8936002)(36756003)(66556008)(66476007)(66946007)(31696002)(33964004)(53546011)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	YUhx94GvVlRiKfn6zPNVwMk9DXLkM/nrwPzIA4pxi3JkL0z0moGXmDO0Dd2z4ZZeohExnyUZcO2Cv9/LSp4hVQO6YLwE7fsKLaXPrUfP3MYfkz8iEkPONF3vHSzIYilBvxaC4g9/1WtmxHEFjuuF8HxDeGvZCMF3V5gBXk2HfGz/CDcoaQjlIv8cvbKoJhctyh9CyqatRnaCDCQBalw4ZVUCrskp/KT1tuAwTLxeWqemvpH/Y6tFuErhSQi3mbItFaBvmNITiPL6Tnof6q29zTkZ2kY4Z6fRlpyzjtDsU907NSPtrLDyVCQzU3aFHGHAl4Y6Z60TzGgWNdl8ai4O14uFEMsgboKdpegIhIYudnYHTa4ynhtXu+EwGDF3UXJ46KTyAqBQ18i72sYIKyx19BG9Hrc68D1zKe0dL5gSLvMcsZDgy0vq7fswyStc/jg0WH+Olct0YJ8RiTPnwqtxjY5RLxmKt1iwXmS6ipzDJr36sSMeRD4Vh8HmAUGoa7v5e5UdAG9NNcLJO/kq6iNecTF1Wf+9J7Fp4ZsGJ/5vVHs1O/lPpqG8Q9D4iCYENOOiYTuXh8fC6e6U4RqCiAbDZS4nNRA32xVEFhWmuXYLDeQLundT+azP73T/9NiQK1iitvXQU7q/+aIJA8F+Isi6gg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a687c978-c262-4c4f-ea25-08d83a08be09
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 13:00:49.7144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQhhXiTCT2KnfuyMIXyq4MRdzFe2gUBcaf6Er5b797BHnvbjsLAxpvRhc8WuFG6jQIu9z3IDTtoi8pP9t6LqQ7kIvfl1LNMLXLZioW99b1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4305
Content-Type: multipart/alternative;
 boundary="------------EB4739FCEE94A755796F6A93"
Content-Language: en-US

--------------EB4739FCEE94A755796F6A93
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/3/20 5:57 AM, Leon Anavi wrote:
> Upgrade to release 5.2.2:
>
> - Fixed #1356: return status when arguments are passed in without
>    files or a content stream.
> - Update precommit to default to filtering files that are defined
>    in skip.
> - Improved relative path detection for skip config usage.
> - Added recursive symbolic link protection.
> - Implemented #1177: Support for color output using --color.
> - Implemented recursive symlink detection support.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-isort_5.1.4.bb => python3-isort_5.2.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-isort_5.1.4.bb => python3-isort_5.2.2.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-isort_5.1.4.bb b/meta-python/recipes-devtools/python/python3-isort_5.2.2.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-isort_5.1.4.bb
> rename to meta-python/recipes-devtools/python/python3-isort_5.2.2.bb
> index 59ff2ffe1..4aa3a8838 100644
> --- a/meta-python/recipes-devtools/python/python3-isort_5.1.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-isort_5.2.2.bb
> @@ -4,8 +4,8 @@ LICENSE = "MIT"
>   SECTION = "devel/python"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
>   
> -SRC_URI[md5sum] = "64d552bbcef48219572cc39649c48fbd"
> -SRC_URI[sha256sum] = "145072eedc4927cc9c1f9478f2d83b2fc1e6469df4129c02ef4e8c742207a46c"
> +SRC_URI[md5sum] = "2e501eacbf110d1e2c524590b183d339"
> +SRC_URI[sha256sum] = "96b27045e3187b9bdde001143b79f9b10a462f372bff7062302818013b6c86f3"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------EB4739FCEE94A755796F6A93
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/3/20 5:57 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200803095759.9591-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 5.2.2:

- Fixed #1356: return status when arguments are passed in without
  files or a content stream.
- Update precommit to default to filtering files that are defined
  in skip.
- Improved relative path detection for skip config usage.
- Added recursive symbolic link protection.
- Implemented #1177: Support for color output using --color.
- Implemented recursive symlink detection support.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200803095759.9591-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-isort_5.1.4.bb =&gt; python3-isort_5.2.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.1.4.bb =&gt; python3-isort_5.2.2.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.1.4.bb b/meta-python/recipes-devtools/python/python3-isort_5.2.2.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-isort_5.1.4.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.2.2.bb
index 59ff2ffe1..4aa3a8838 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.2.2.bb
@@ -4,8 +4,8 @@ LICENSE = &quot;MIT&quot;
 SECTION = &quot;devel/python&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489">&quot;file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489&quot;</a>
 
-SRC_URI[md5sum] = &quot;64d552bbcef48219572cc39649c48fbd&quot;
-SRC_URI[sha256sum] = &quot;145072eedc4927cc9c1f9478f2d83b2fc1e6469df4129c02ef4e8c742207a46c&quot;
+SRC_URI[md5sum] = &quot;2e501eacbf110d1e2c524590b183d339&quot;
+SRC_URI[sha256sum] = &quot;96b27045e3187b9bdde001143b79f9b10a462f372bff7062302818013b6c86f3&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------EB4739FCEE94A755796F6A93--
